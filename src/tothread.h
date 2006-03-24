/*****
*
* TOra - An Oracle Toolkit for DBA's and developers
* Copyright (C) 2003-2005 Quest Software, Inc
* Portions Copyright (C) 2005 Other Contributors
* 
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation;  only version 2 of
* the License is valid for this program.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
*
*      As a special exception, you have permission to link this program
*      with the Oracle Client libraries and distribute executables, as long
*      as you follow the requirements of the GNU GPL in regard to all of the
*      software in the executable aside from Oracle client libraries.
*
*      Specifically you are not permitted to link this program with the
*      Qt/UNIX, Qt/Windows or Qt Non Commercial products of TrollTech.
*      And you are not permitted to distribute binaries compiled against
*      these libraries without written consent from Quest Software, Inc.
*      Observe that this does not disallow linking to the Qt Free Edition.
*
*      You may link this product with any GPL'd Qt library such as Qt/Free
*
* All trademarks belong to their respective owners.
*
*****/

#ifndef TOTHREAD_H
#define TOTHREAD_H

#include "config.h"

#include <qthread.h>

/** This is an abstract class that defines something that is to be performed by a
 * thread.
 */
class toTask
{
public:
    virtual ~toTask()
    { }
    /** This member is called when the class is started.
     */
    virtual void run(void) = 0;
};

#ifndef QT_THREAD_SUPPORT
#include <semaphore.h>

class toSemaphore
{
private:
    sem_t Semaphore;
    void init(int val);

    toSemaphore(const toSemaphore &);
public:
    toSemaphore();
    toSemaphore(int val);
    ~toSemaphore();

    void up();
    void down();
    int getValue();
};

#else


/** Encapsulation of pthread semaphores. A semaphore can be raise to any value
* but will wait till raised above zero when lowered below 0. Can also be implemented
* without pthreads using Qt multithreaded primitives. Observe that these function
* different than Qt semaphores.
*/

class toSemaphore
{
private:
    QMutex Mutex;
    QWaitCondition Condition;

    int Value;
public:
    /** Create semaphore
    */
    toSemaphore()
            : Condition()
    {
        Value = 0;
    }
    /** Unimplemented copy constructor.
    */
    toSemaphore(const toSemaphore &);
    /** Create semaphore
    * @param val Value of new semaphore.
    */
    toSemaphore(int val)
            : Condition()
    {
        Value = val;
    }

    /** Increase semaphore value by 1.
    */
    void up();
    /** Decrease semaphore value by 1, wait for it to never go below 0.
    */
    void down();
    /** Get current semaphore value.
    */
    int getValue();
};

#endif

#include <list>

#ifdef WIN32

class toLock
{
private:
    QMutex Mutex;
public:
    toLock(void)
            : Mutex(false)
    { }
    toLock(const toLock &);

    void lock (void)
    {
        Mutex.lock();
    }
    void unlock(void)
    {
        Mutex.unlock();
    }
};

void *toThreadStartWrapper(void*);

class toThread
{
private:
    /** Not part of the API.
     */

class taskRunner : public QThread
    {
    public:
        toSemaphore StartSemaphore;
        toTask *Task;
        taskRunner(toTask *);
        virtual void run(void);
        friend class toThread;
    }
    Thread;
    static std::list<toThread *> *Threads;
    static toLock *Lock;
    static int LastID;
    static __declspec( thread ) int ThreadID;
    static int MainThread;

    toThread(const toThread &);
public:
    toThread(toTask *);
    ~toThread();

    void start(void);
    void startAsync(void);
    static void msleep(int msec);
    static bool mainThread(void);
    friend class taskRunner;
};

#else
#include <pthread.h>
#include <signal.h>
#include <time.h>

/** A wrapper around the pthread mutexfunctions. A lock can only be locked
*  by one thread at a time and is the basis of most thread synchronisation.
*/

class toLock
{
private:
    /** Actual pthread mutex of class.
    */
    pthread_mutex_t Mutex;
    toLock(const toLock &);
public:
    /** Create lock
    */
    toLock(void);
    ~toLock();

    /** Lock this lock.
    */
    void lock (void)
        ;
    /** Unlock this lock.
    */
    void unlock(void);
};

/** Used to create new threads of execution. When a thread exits it will delete the
* thread and task objects so the calling thread must never delete a started thread.
*/

class toThread
{
private:
    static toThread *DeleteThread;
    static toLock *Lock;
    /** PThread identifier.
    */
    pthread_t Thread;
    /** Thread attributes.
    */
    pthread_attr_t ThreadAttr;
    /** Task to run in new thread.
    */
    toTask *Task;
    /** Semaphore that is raised when new thread has started running.
    */
    toSemaphore StartSemaphore;
    /** Initialise thread attributes.
    */
    void initAttr(void);
    /** Called when thread is started to execute task. Pointer to @ref toThread
    * is passed as parameter.
    */
    friend void *toThreadStartWrapper(void*);
    /** Main thread id
    */
    static pthread_t MainThread;

    toThread(const toThread &);
public:
    /** Create thread.
    * @param task Task to run.
    */
    toThread(toTask *task);
    ~toThread();

    /** Start thread and wait for other thread to start running.
    */
    void start(void);
    /** Start thread and continue executing this thread until normal scheduling
    * handles over execution to child thread.
    */
    void startAsync(void);
    /** Sleep in milliseconds.
    */
    static void msleep(int msec);
    /** Returns true if this is the main thread.
    */
    static bool mainThread(void);
};

#endif

/** This is a convenience class that holds a lock for the duration of the scope
 * of the object. It is very convenient to use if exceptions can be thrown, simply
 * declare an auto @ref toLocker to hold the lock. If any exception is thrown the
 * locker will be deallocated and the lock released.
 */

class toLocker
{
private:
    /** Lock held.
     */
    toLock &Lock;
    toLocker(const toLocker &);
public:
    /** Create locker.
     * @param lock Lock to hold.
     */
    toLocker(toLock &lock )
            : Lock(lock )
    {
        Lock.lock();
    }
    ~toLocker()
    {
        Lock.unlock();
    }
};

#endif