/**
 * Oracle(c) PL/SQL 11g Parser  
 *
 * Copyright (c) 2009-2011 Alexandre Porcelli <alexandre.porcelli@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
parser grammar PLSQLKeys;

options {
    output=AST;
}

tokens {
    DEBUG_VK;
    REUSE_VK;
    REPLACE_VK;
    DETERMINISTIC_VK;
    RESULT_CACHE_VK;
    PIPELINED_VK;
    AGGREGATE_VK;
    RELIES_ON_VK;
    AUTHID_VK;
    DEFINER_VK;
    CURRENT_USER_VK;
    CLUSTER_VK;
    PACKAGE_VK;
    BODY_VK;
    PARALLEL_ENABLE_VK;
    SPECIFICATION_VK;
    RANGE_VK;
    HASH_VK;
    EXTERNAL_VK;
    CALL_VK;
    DDL_VK;
    ENABLE_VK;
    DATABASE_VK;
    DISABLE_VK;
    BEFORE_VK;
    REFERENCING_VK;
    LOGON_VK;
    AFTER_VK;
    SCHEMA_VK;
    TRUNCATE_VK;
    STARTUP_VK;
    STATISTICS_VK;
    NOAUDIT_VK;
    SUSPEND_VK;
    AUDIT_VK;
    DISASSOCIATE_VK;
    SHUTDOWN_VK;
    COMPOUND_VK;
    SERVERERROR_VK;
    PARENT_VK;
    FOLLOWS_VK;
    NESTED_VK;
    OLD_VK;
    DB_ROLE_CHANGE_VK;
    LOGOFF_VK;
    ANALYZE_VK;
    INSTEAD_VK;
    ASSOCIATE_VK;
    NEW_VK;
    RENAME_VK;
    COMMENT_VK;
    FORCE_VK;
    VALIDATE_VK;
    TYPE_VK;
    COMPILE_VK;
    EXCEPTIONS_VK;
    LIMIT_VK;
    INSTANTIABLE_VK;
    FINAL_VK;
    ADD_VK;
    MODIFY_VK;
    INCLUDING_VK;
    CASCADE_VK;
    INVALIDATE_VK;
    CONVERT_VK;
    LANGUAGE_VK;
    JAVA_VK;
    OVERRIDING_VK;
    C_VK;
    LIBRARY_VK;
    CONTEXT_VK;
    OUT_VK;
    INOUT_VK;
    PARAMETERS_VK;
    AGENT_VK;
    NOCOPY_VK;
    PRAGMA_VK;
    CUSTOMDATUM_VK;
    ORADATA_VK;
    CONSTRUCTOR_VK;
    SQLDATA_VK;
    MEMBER_VK;
    SELF_VK;
    OBJECT_VK;
    STATIC_VK;
    UNDER_VK;
    MAP_VK;
    CONSTANT_VK;
    EXCEPTION_INIT_VK;
    PERCENT_NOTFOUND_VK;
    PERCENT_FOUND_VK;
    PERCENT_ISOPEN_VK;
    PERCENT_ROWCOUNT_VK;
    PERCENT_ROWTYPE_VK;
    PERCENT_TYPE_VK;
    SERIALLY_REUSABLE_VK;
    AUTONOMOUS_TRANSACTION_VK;
    INLINE_VK;
    RESTRICT_REFERENCES_VK;
    EXIT_VK;
    RETURN_VK;
    RAISE_VK;
    LOOP_VK;
    FORALL_VK;
    CONTINUE_VK;
    REVERSE_VK;
    OFF_VK;
    EXECUTE_VK;
    IMMEDIATE_VK;
    COMMIT_VK;
    WORK_VK;
    BULK_VK;
    COMMITTED_VK;
    ISOLATION_VK;
    SERIALIZABLE_VK;
    WRITE_VK;
    WAIT_VK;
    CORRUPT_XID_ALL_VK;
    CORRUPT_XID_VK;
    BATCH_VK;
    DEFERRED_VK;
    ROLLBACK_VK;
    OPEN_VK;
    SAVEPOINT_VK;
    CLOSE_VK;
    READ_VK;
    ONLY_VK;
    REF_VK;
    PLS_INTEGER_VK;
    SUBPARTITION_VK;
    PARTITION_VK;
    TIMESTAMP_TZ_UNCONSTRAINED_VK;
    UROWID_VK;
    POSITIVEN_VK;
    TIMEZONE_ABBR_VK;
    BINARY_DOUBLE_VK;
    BFILE_VK;
    TIMEZONE_REGION_VK;
    TIMESTAMP_LTZ_UNCONSTRAINED_VK;
    NATURALN_VK;
    SIMPLE_INTEGER_VK;
    BYTE_VK;
    BINARY_FLOAT_VK;
    NCLOB_VK;
    CLOB_VK;
    DSINTERVAL_UNCONSTRAINED_VK;
    YMINTERVAL_UNCONSTRAINED_VK;
    ROWID_VK;
    TIMESTAMP_UNCONSTRAINED_VK;
    SIGNTYPE_VK;
    BLOB_VK;
    NVARCHAR2_VK;
    STRING_VK;
    MAXVALUE_VK;
    MINVALUE_VK;
    DBTIMEZONE_VK;
    SESSIONTIMEZONE_VK;
    RAW_VK;
    NUMBER_VK;
    VARCHAR2_VK;
    BOOLEAN_VK;
    POSITIVE_VK;
    MLSLABEL_VK;
    BINARY_INTEGER_VK;
    LONG_VK;
    CHARACTER_VK;
    CHAR_VK;
    VARCHAR_VK;
    NCHAR_VK;
    BIT_VK;
    FLOAT_VK;
    REAL_VK;
    DOUBLE_VK;
    PRECISION_VK;
    TIME_VK;
    TIMESTAMP_VK;
    NUMERIC_VK;
    DECIMAL_VK;
    DEC_VK;
    INTEGER_VK;
    INT_VK;
    SMALLINT_VK;
    NATURAL_VK;
    SECOND_VK;
    TIMEZONE_HOUR_VK;
    TIMEZONE_MINUTE_VK;
    LOCAL_VK;
    YEAR_VK;
    MONTH_VK;
    DAY_VK;
    HOUR_VK;
    MINUTE_VK;
    MERGE_VK;
    REJECT_VK;
    LOG_VK;
    UNLIMITED_VK;
    FIRST_VK;
    NOCYCLE_VK;
    BLOCK_VK;
    XML_VK;
    PIVOT_VK;
    SEQUENTIAL_VK;
    SINGLE_VK;
    SKIP_VK;
    UPDATED_VK;
    EXCLUDE_VK;
    REFERENCE_VK;
    UNTIL_VK;
    SEED_VK;
    SIBLINGS_VK;
    CUBE_VK;
    NULLS_VK;
    DIMENSION_VK;
    SCN_VK;
    UNPIVOT_VK;
    KEEP_VK;
    MEASURES_VK;
    SAMPLE_VK;
    UPSERT_VK;
    VERSIONS_VK;
    RULES_VK;
    ITERATE_VK;
    ROLLUP_VK;
    NAV_VK;
    AUTOMATIC_VK;
    LAST_VK;
    GROUPING_VK;
    INCLUDE_VK;
    IGNORE_VK;
    RESPECT_VK;
    SUBMULTISET_VK;
    LIKEC_VK;
    LIKE2_VK;
    LIKE4_VK;
    ROW_VK;
    SET_VK;
    SOME_VK;
    FULL_VK;
    CROSS_VK;
    LEFT_VK;
    RIGHT_VK;
    INNER_VK;
    VALUE_VK;
    INCREMENT_VK;
    DECREMENT_VK;
    AT_VK;
    DENSE_RANK_VK;
    NAME_VK;
    COLLECT_VK;
    ROWS_VK;
    NCHAR_CS_VK;
    DECOMPOSE_VK;
    FOLLOWING_VK;
    FIRST_VALUE_VK;
    PRECEDING_VK;
    WITHIN_VK;
    CANONICAL_VK;
    COMPATIBILITY_VK;
    OVER_VK;
    LAST_VALUE_VK;
    CURRENT_VK;
    UNBOUNDED_VK;
    COST_VK;
    CHAR_CS_VK;
    AUTO_VK;
    TREAT_VK;
    CONTENT_VK;
    XMLPARSE_VK;
    XMLELEMENT_VK;
    ENTITYESCAPING_VK;
    STANDALONE_VK;
    WELLFORMED_VK;
    XMLEXISTS_VK;
    VERSION_VK;
    XMLCAST_VK;
    YES_VK;
    NO_VK;
    EVALNAME_VK;
    XMLPI_VK;
    XMLCOLATTVAL_VK;
    DOCUMENT_VK;
    XMLFOREST_VK;
    PASSING_VK;
    INDENT_VK;
    HIDE_VK;
    XMLAGG_VK;
    XMLNAMESPACES_VK;
    NOSCHEMACHECK_VK;
    NOENTITYESCAPING_VK;
    XMLQUERY_VK;
    XMLTABLE_VK;
    XMLROOT_VK;
    SCHEMACHECK_VK;
    XMLATTRIBUTES_VK;
    ENCODING_VK;
    SHOW_VK;
    XMLSERIALIZE_VK;
    ORDINALITY_VK;
    DEFAULTS_VK;
    CHR_VK;
    COUNT_VK;
    CAST_VK;
    TRANSLATE_VK;
    TRIM_VK;
    LEADING_VK;
    TRAILING_VK;
    BOTH_VK;
    EXTRACT_VK;
    SEQUENCE_VK;
    NOORDER_VK;
    CYCLE_VK;
    CACHE_VK;
    NOCACHE_VK;
    NOMAXVALUE_VK;
    NOMINVALUE_VK;
    SEARCH_VK;
    DEPTH_VK;
    BREADTH_VK;
}

@includes
{
	#include "UserTraits.hpp"
	#include "PLSQLLexer.hpp"
}
@namespace { Antlr3BackendImpl }

// @members{
//     // int equalsIgnoreCase(pANTLR3_COMMON_TOKEN s1, const char* s2)
//     // {
//     //     return !strcasecmp(s1->getText(s1)->chars, s2);
//     // }
// }

create_key
    :    SQL92_RESERVED_CREATE
    ;
    
replace_key
//  :    {input.LT(1).getText().equalsIgnoreCase("REPLACE")}?=> REGULAR_ID
    :    {equalsIgnoreCase(LT(1)->getText(), "REPLACE")}?=> REGULAR_ID -> REPLACE_VK[$REGULAR_ID]
    ;

package_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PACKAGE")}?=> REGULAR_ID -> PACKAGE_VK[$REGULAR_ID]
    ;

body_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BODY")}? REGULAR_ID -> BODY_VK[$REGULAR_ID]
    ;

begin_key
    :    SQL92_RESERVED_BEGIN
    ;

exit_key:    {equalsIgnoreCase(LT(1)->getText(), "EXIT")}? REGULAR_ID -> EXIT_VK[$REGULAR_ID]
    ;

declare_key
    :    SQL92_RESERVED_DECLARE
    ;

exception_key
    :    SQL92_RESERVED_EXCEPTION
    ;

serveroutput_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SERVEROUTPUT")}? REGULAR_ID
    ;

off_key
    :    {equalsIgnoreCase(LT(1)->getText(), "OFF")}? REGULAR_ID -> OFF_VK[$REGULAR_ID]
    ;

constant_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CONSTANT")}? REGULAR_ID -> CONSTANT_VK[$REGULAR_ID]
    ;

subtype_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SUBTYPE")}? REGULAR_ID
    ;

cursor_key//{equalsIgnoreCase(LT(1)->getText(), "CURSOR")}? REGULAR_ID
    :    SQL92_RESERVED_CURSOR
    ;

nextval_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NEXTVAL")}?=> REGULAR_ID
    ;

goto_key
    :    SQL92_RESERVED_GOTO
    ;

execute_key
    :    {equalsIgnoreCase(LT(1)->getText(), "EXECUTE")}? REGULAR_ID -> EXECUTE_VK[$REGULAR_ID]
    ;

immediate_key
    :    {equalsIgnoreCase(LT(1)->getText(), "IMMEDIATE")}?=> REGULAR_ID -> IMMEDIATE_VK[$REGULAR_ID]
    ;

return_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RETURN")}? REGULAR_ID -> RETURN_VK[$REGULAR_ID]
    ;

procedure_key
    :    SQL92_RESERVED_PROCEDURE
    ;

function_key
    :    {equalsIgnoreCase(LT(1)->getText(), "FUNCTION")}?=> REGULAR_ID
    ;

pragma_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PRAGMA")}? REGULAR_ID -> PRAGMA_VK[$REGULAR_ID]
    ;

exception_init_key
    :    {equalsIgnoreCase(LT(1)->getText(), "EXCEPTION_INIT")}? REGULAR_ID -> EXCEPTION_INIT_VK[$REGULAR_ID]
    ;

type_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TYPE")}?=> REGULAR_ID -> TYPE_VK[$REGULAR_ID]
    ;

record_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RECORD")}?=> REGULAR_ID
    ;

indexed_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INDEXED")}? REGULAR_ID
    ;

index_key
    :    PLSQL_RESERVED_INDEX
    ;

percent_notfound_key
    :    {input.LT(2).getText().equalsIgnoreCase("NOTFOUND")}?=> PERCENT REGULAR_ID -> PERCENT_NOTFOUND_VK[$REGULAR_ID, $REGULAR_ID.text]
    ;

percent_found_key
    :    {input.LT(2).getText().equalsIgnoreCase("FOUND")}?=> PERCENT REGULAR_ID -> PERCENT_FOUND_VK[$REGULAR_ID, $REGULAR_ID.text]
    ;

percent_isopen_key
    :    {input.LT(2).getText().equalsIgnoreCase("ISOPEN")}?=> PERCENT REGULAR_ID -> PERCENT_ISOPEN_VK[$REGULAR_ID, $REGULAR_ID.text]
    ;

percent_rowcount_key
    :    {input.LT(2).getText().equalsIgnoreCase("ROWCOUNT")}?=> PERCENT REGULAR_ID -> PERCENT_ROWCOUNT_VK[$REGULAR_ID, $REGULAR_ID.text]
    ;

percent_rowtype_key
    :    {input.LT(2).getText().equalsIgnoreCase("ROWTYPE")}?=> PERCENT REGULAR_ID -> PERCENT_ROWTYPE_VK[$REGULAR_ID, $REGULAR_ID.text] 
    ;

percent_type_key
    :    {input.LT(2).getText().equalsIgnoreCase("TYPE")}?=> PERCENT REGULAR_ID -> PERCENT_TYPE_VK[$REGULAR_ID, $REGULAR_ID.text]
    ;

out_key
    :    {equalsIgnoreCase(LT(1)->getText(), "OUT")}?=> REGULAR_ID -> OUT_VK[$REGULAR_ID]
    ;

inout_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INOUT")}? REGULAR_ID -> INOUT_VK[$REGULAR_ID]
    ;

extend_key
    :    {equalsIgnoreCase(LT(1)->getText(), "EXTEND")}?=> REGULAR_ID
    ;

raise_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RAISE")}? REGULAR_ID -> RAISE_VK[$REGULAR_ID]
    ;

while_key
    :    {equalsIgnoreCase(LT(1)->getText(), "WHILE")}? REGULAR_ID
    ;

loop_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LOOP")}? REGULAR_ID -> LOOP_VK[$REGULAR_ID]
    ;

commit_key
    :    {equalsIgnoreCase(LT(1)->getText(), "COMMIT")}?=> REGULAR_ID -> COMMIT_VK[$REGULAR_ID]
    ;

work_key:    {equalsIgnoreCase(LT(1)->getText(), "WORK")}? REGULAR_ID -> WORK_VK[$REGULAR_ID]
    ;

if_key
    :    PLSQL_RESERVED_IF
    ;

elsif_key
    :    PLSQL_NON_RESERVED_ELSIF
    ;

authid_key
    :    {equalsIgnoreCase(LT(1)->getText(), "AUTHID")}?=> REGULAR_ID -> AUTHID_VK[$REGULAR_ID]
    ;

definer_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DEFINER")}? REGULAR_ID -> DEFINER_VK[$REGULAR_ID]
    ;

external_key
    :    {equalsIgnoreCase(LT(1)->getText(), "EXTERNAL")}? REGULAR_ID -> EXTERNAL_VK[$REGULAR_ID]
    ;

language_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LANGUAGE")}? REGULAR_ID -> LANGUAGE_VK[$REGULAR_ID]
    ;

java_key
    :    {equalsIgnoreCase(LT(1)->getText(), "JAVA")}? REGULAR_ID -> JAVA_VK[$REGULAR_ID]
    ;

name_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NAME")}?=> REGULAR_ID -> NAME_VK[$REGULAR_ID]
    ;

deterministic_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DETERMINISTIC")}?=> REGULAR_ID -> DETERMINISTIC_VK[$REGULAR_ID]
    ;

parallel_enable_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PARALLEL_ENABLE")}?=> REGULAR_ID -> PARALLEL_ENABLE_VK[$REGULAR_ID]
    ;

result_cache_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RESULT_CACHE")}?=> REGULAR_ID -> RESULT_CACHE_VK[$REGULAR_ID]
    ;

pipelined_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PIPELINED")}?=> REGULAR_ID -> PIPELINED_VK[$REGULAR_ID]
    ;

aggregate_key
    :    {equalsIgnoreCase(LT(1)->getText(), "AGGREGATE")}? REGULAR_ID -> AGGREGATE_VK[$REGULAR_ID]
    ;

alter_key
    :    SQL92_RESERVED_ALTER
    ;

compile_key
    :    {equalsIgnoreCase(LT(1)->getText(), "COMPILE")}? REGULAR_ID -> COMPILE_VK[$REGULAR_ID]
    ; 

debug_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DEBUG")}? REGULAR_ID -> DEBUG_VK[$REGULAR_ID]
    ;

reuse_key
    :    {equalsIgnoreCase(LT(1)->getText(), "REUSE")}? REGULAR_ID -> REUSE_VK[$REGULAR_ID]
    ;

settings_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SETTINGS")}? REGULAR_ID
    ;

specification_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SPECIFICATION")}? REGULAR_ID -> SPECIFICATION_VK[$REGULAR_ID]
    ;

drop_key
    :    SQL92_RESERVED_DROP
    ;

trigger_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TRIGGER")}?=> REGULAR_ID
    ;

force_key
    :    {equalsIgnoreCase(LT(1)->getText(), "FORCE")}?=> REGULAR_ID -> FORCE_VK[$REGULAR_ID]
    ;

validate_key
    :    {equalsIgnoreCase(LT(1)->getText(), "VALIDATE")}? REGULAR_ID -> VALIDATE_VK[$REGULAR_ID]
    ;

ref_key
    :    {equalsIgnoreCase(LT(1)->getText(), "REF")}?=> REGULAR_ID -> REF_VK[$REGULAR_ID]
    ;

array_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ARRAY")}?=> REGULAR_ID
    ;

varray_key
    :    {equalsIgnoreCase(LT(1)->getText(), "VARRAY")}?=> REGULAR_ID
    ;

pls_integer_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PLS_iNTEGER")}?=> REGULAR_ID -> PLS_INTEGER_VK[$REGULAR_ID]
    ;

serially_reusable_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SERIALLY_REUSABLE")}?=> REGULAR_ID -> SERIALLY_REUSABLE_VK[$REGULAR_ID]
    ;

autonomous_transaction_key
    :    {equalsIgnoreCase(LT(1)->getText(), "AUTONOMOUS_TRANSACTION")}?=> REGULAR_ID -> AUTONOMOUS_TRANSACTION_VK[$REGULAR_ID]
    ;

inline_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INLINE")}?=> REGULAR_ID -> INLINE_VK[$REGULAR_ID]
    ;

restrict_references_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RESTRICT_REFERENCES")}?=> REGULAR_ID -> RESTRICT_REFERENCES_VK[$REGULAR_ID]
    ;

exceptions_key
    :    {equalsIgnoreCase(LT(1)->getText(), "EXCEPTIONS")}?=> REGULAR_ID -> EXCEPTIONS_VK[$REGULAR_ID] 
    ;

save_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SAVE")}?=> REGULAR_ID
    ;

forall_key
    :    {equalsIgnoreCase(LT(1)->getText(), "FORALL")}?=> REGULAR_ID -> FORALL_VK[$REGULAR_ID]
    ;

continue_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CONTINUE")}?=> REGULAR_ID -> CONTINUE_VK[$REGULAR_ID]
    ;

indices_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INDICES")}?=> REGULAR_ID
    ;

values_key
    :    SQL92_RESERVED_VALUES
    ;

case_key
    :    SQL92_RESERVED_CASE
    ;

bulk_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BULK")}?=> REGULAR_ID -> BULK_VK[$REGULAR_ID]
    ;

collect_key
    :    {equalsIgnoreCase(LT(1)->getText(), "COLLECT")}?=> REGULAR_ID -> COLLECT_VK[$REGULAR_ID]
    ;

committed_key
    :    {equalsIgnoreCase(LT(1)->getText(), "COMMITTED")}? REGULAR_ID -> COMMITTED_VK[$REGULAR_ID]
    ;

use_key
    :    {equalsIgnoreCase(LT(1)->getText(), "USE")}?=> REGULAR_ID
    ;

level_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LEVEL")}? REGULAR_ID
    ;

isolation_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ISOLATION")}?=> REGULAR_ID -> ISOLATION_VK[$REGULAR_ID]
    ;

serializable_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SERIALIZABLE")}? REGULAR_ID -> SERIALIZABLE_VK[$REGULAR_ID]
    ;

segment_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SEGMENT")}? REGULAR_ID
    ;

write_key
    :    {equalsIgnoreCase(LT(1)->getText(), "WRITE")}?=> REGULAR_ID -> WRITE_VK[$REGULAR_ID]
    ;

wait_key
    :    {equalsIgnoreCase(LT(1)->getText(), "WAIT")}?=> REGULAR_ID -> WAIT_VK[$REGULAR_ID]
    ;

corrupt_xid_all_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CORRUPT_XID_ALL")}?=> REGULAR_ID -> CORRUPT_XID_ALL_VK[$REGULAR_ID]
    ;

corrupt_xid_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CORRUPT_XID")}?=> REGULAR_ID -> CORRUPT_XID_VK[$REGULAR_ID]
    ;

batch_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BATCH")}?=> REGULAR_ID -> BATCH_VK[$REGULAR_ID]
    ;

session_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SESSION")}?=> REGULAR_ID
    ;

role_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ROLE")}?=> REGULAR_ID
    ;

constraint_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CONSTRAINT")}?=> REGULAR_ID
    ;

constraints_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CONSTRAINTS")}?=> REGULAR_ID
    ;

call_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CALL")}?=> REGULAR_ID -> CALL_VK[$REGULAR_ID]
    ;

explain_key
    :    {equalsIgnoreCase(LT(1)->getText(), "EXPLAIN")}?=> REGULAR_ID
    ;

merge_key
    :    {equalsIgnoreCase(LT(1)->getText(), "MERGE")}?=> REGULAR_ID -> MERGE_VK[$REGULAR_ID]
    ;

plan_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PLAN")}?=> REGULAR_ID
    ;

system_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SYSTEM")}?=> REGULAR_ID
    ;

subpartition_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SUBPARTITION")}?=> REGULAR_ID -> SUBPARTITION_VK[$REGULAR_ID]
    ;

partition_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PARTITION")}?=> REGULAR_ID -> PARTITION_VK[$REGULAR_ID]
    ;

matched_key
    :    {equalsIgnoreCase(LT(1)->getText(), "MATCHED")}?=> REGULAR_ID
    ;

reject_key
    :    {equalsIgnoreCase(LT(1)->getText(), "REJECT")}?=> REGULAR_ID -> REJECT_VK[$REGULAR_ID]
    ;

log_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LOG")}?=> REGULAR_ID -> LOG_VK[$REGULAR_ID]
    ;

unlimited_key
    :    {equalsIgnoreCase(LT(1)->getText(), "UNLIMITED")}?=> REGULAR_ID -> UNLIMITED_VK[$REGULAR_ID]
    ;

limit_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LIMIT")}?=> REGULAR_ID -> LIMIT_VK[$REGULAR_ID]
    ;

errors_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ERRORS")}?=> REGULAR_ID
    ;

timestamp_tz_unconstrained_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TIMESTAMP_TZ_UNCONSTRAINED")}?=> REGULAR_ID -> TIMESTAMP_TZ_UNCONSTRAINED_VK[$REGULAR_ID]
    ;

urowid_key
    :    {equalsIgnoreCase(LT(1)->getText(), "UROWID")}?=> REGULAR_ID -> UROWID_VK[$REGULAR_ID]
    ;

binary_float_min_subnormal_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BINARY_FLOAT_MIN_SUBNORMAL")}?=> REGULAR_ID
    ;

binary_double_min_normal_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BINARY_DOUBLE_MIN_NORMAL")}?=> REGULAR_ID
    ;

binary_float_max_normal_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BINARY_FLOAT_MAX_NORMAL")}?=> REGULAR_ID
    ;

positiven_key
    :    {equalsIgnoreCase(LT(1)->getText(), "POSITIVEN")}?=> REGULAR_ID -> POSITIVEN_VK[$REGULAR_ID]
    ;

timezone_abbr_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TIMEZONE_ABBR")}?=> REGULAR_ID -> TIMEZONE_ABBR_VK[$REGULAR_ID]
    ;

binary_double_min_subnormal_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BINARY_DOUBLE_MIN_SUBNORMAL")}?=> REGULAR_ID
    ;

binary_float_max_subnormal_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BINARY_FLOAT_MAX_SUBNORMAL")}?=> REGULAR_ID
    ;

binary_double_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BINARY_DOUBLE")}?=> REGULAR_ID -> BINARY_DOUBLE_VK[$REGULAR_ID]
    ;

bfile_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BFILE")}?=> REGULAR_ID -> BFILE_VK[$REGULAR_ID]
    ;

binary_double_infinity_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BINARY_DOUBLE_INFINITY")}?=> REGULAR_ID
    ;

timezone_region_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TIMEZONE_REGION")}?=> REGULAR_ID -> TIMEZONE_REGION_VK[$REGULAR_ID]
    ;

timestamp_ltz_unconstrained_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TIMESTAMP_LTZ_UNCONSTRAINED")}?=> REGULAR_ID -> TIMESTAMP_LTZ_UNCONSTRAINED_VK[$REGULAR_ID]
    ;

naturaln_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NATURALN")}?=> REGULAR_ID -> NATURALN_VK[$REGULAR_ID]
    ;

simple_integer_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SIMPLE_INTEGER")}?=> REGULAR_ID -> SIMPLE_INTEGER_VK[$REGULAR_ID]
    ;

binary_double_max_subnormal_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BINARY_DOUBLE_MAX_SUBNORMAL")}?=> REGULAR_ID
    ;

byte_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BYTE")}?=> REGULAR_ID -> BYTE_VK[$REGULAR_ID]
    ;

binary_float_infinity_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BINARY_FLOAT_INFINITY")}?=> REGULAR_ID
    ;

binary_float_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BINARY_FLOAT")}?=> REGULAR_ID -> BINARY_FLOAT_VK[$REGULAR_ID]
    ;

range_key
    :    {equalsIgnoreCase(LT(1)->getText(), "range")}?=> REGULAR_ID -> RANGE_VK[$REGULAR_ID]
    ;

nclob_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NCLOB")}?=> REGULAR_ID -> NCLOB_VK[$REGULAR_ID]
    ;

clob_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CLOB")}?=> REGULAR_ID -> CLOB_VK[$REGULAR_ID]
    ;

dsinterval_unconstrained_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DSINTERVAL_UNCONSTRAINED")}?=> REGULAR_ID -> DSINTERVAL_UNCONSTRAINED_VK[$REGULAR_ID]
    ;

yminterval_unconstrained_key
    :    {equalsIgnoreCase(LT(1)->getText(), "YMINTERVAL_UNCONSTRAINED")}?=> REGULAR_ID -> YMINTERVAL_UNCONSTRAINED_VK[$REGULAR_ID]
    ;

rowid_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ROWID")}?=> REGULAR_ID -> ROWID_VK[$REGULAR_ID]
    ;

binary_double_nan_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BINARY_DOUBLE_NAN")}?=> REGULAR_ID
    ;

timestamp_unconstrained_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TIMESTAMP_UNCONSTRAINED")}?=> REGULAR_ID -> TIMESTAMP_UNCONSTRAINED_VK[$REGULAR_ID]
    ;

binary_float_min_normal_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BINARY_FLOAT_MIN_NORMAL")}?=> REGULAR_ID
    ;

signtype_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SIGNTYPE")}?=> REGULAR_ID -> SIGNTYPE_VK[$REGULAR_ID]
    ;

blob_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BLOB")}?=> REGULAR_ID -> BLOB_VK[$REGULAR_ID]
    ;

nvarchar2_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NVARCHAR2")}?=> REGULAR_ID -> NVARCHAR2_VK[$REGULAR_ID]
    ;

binary_double_max_normal_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BINARY_DOUBLE_MAX_NORMAL")}?=> REGULAR_ID
    ;

binary_float_nan_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BINARY_FLOAT_NAN")}?=> REGULAR_ID
    ;

string_key
    :    {equalsIgnoreCase(LT(1)->getText(), "STRING")}?=> REGULAR_ID -> STRING_VK[$REGULAR_ID]
    ;

c_key
    :    {equalsIgnoreCase(LT(1)->getText(), "C")}?=> REGULAR_ID -> C_VK[$REGULAR_ID]
    ;

library_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LIBRARY")}?=> REGULAR_ID -> LIBRARY_VK[$REGULAR_ID]
    ;

context_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CONTEXT")}?=> REGULAR_ID -> CONTEXT_VK[$REGULAR_ID]
    ;

parameters_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PARAMETERS")}?=> REGULAR_ID -> PARAMETERS_VK[$REGULAR_ID]
    ;

agent_key
    :    {equalsIgnoreCase(LT(1)->getText(), "AGENT")}?=> REGULAR_ID -> AGENT_VK[$REGULAR_ID]
    ;

cluster_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CLUSTER")}?=> REGULAR_ID -> CLUSTER_VK[$REGULAR_ID]
    ;

hash_key
    :    {equalsIgnoreCase(LT(1)->getText(), "HASH")}?=> REGULAR_ID -> HASH_VK[$REGULAR_ID]
    ;

relies_on_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RELIES_ON")}?=> REGULAR_ID -> RELIES_ON_VK[$REGULAR_ID]
    ;

returning_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RETURNING")}?=> REGULAR_ID
    ;    

statement_id_key
    :    {equalsIgnoreCase(LT(1)->getText(), "STATEMENT_ID")}?=> REGULAR_ID
    ;

deferred_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DEFERRED")}?=> REGULAR_ID -> DEFERRED_VK[$REGULAR_ID]
    ;

advise_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ADVISE")}?=> REGULAR_ID
    ;

resumable_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RESUMABLE")}?=> REGULAR_ID
    ;

timeout_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TIMEOUT")}?=> REGULAR_ID
    ;

parallel_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PARALLEL")}?=> REGULAR_ID
    ;

ddl_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DDL")}?=> REGULAR_ID -> DDL_VK[$REGULAR_ID]
    ;

query_key
    :    {equalsIgnoreCase(LT(1)->getText(), "QUERY")}?=> REGULAR_ID
    ;

dml_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DML")}?=> REGULAR_ID
    ;

guard_key
    :    {equalsIgnoreCase(LT(1)->getText(), "GUARD")}?=> REGULAR_ID
    ;

nothing_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NOTHING")}?=> REGULAR_ID
    ;

enable_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ENABLE")}?=> REGULAR_ID -> ENABLE_VK[$REGULAR_ID]
    ;

database_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DATABASE")}?=> REGULAR_ID -> DATABASE_VK[$REGULAR_ID]
    ;

disable_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DISABLE")}?=> REGULAR_ID -> DISABLE_VK[$REGULAR_ID]
    ;

link_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LINK")}?=> REGULAR_ID
    ;

identified_key
    :    PLSQL_RESERVED_IDENTIFIED
    ;

none_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NONE")}?=> REGULAR_ID
    ;

before_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BEFORE")}?=> REGULAR_ID -> BEFORE_VK[$REGULAR_ID] 
    ;

referencing_key
    :    {equalsIgnoreCase(LT(1)->getText(), "REFERENCING")}?=> REGULAR_ID -> REFERENCING_VK[$REGULAR_ID]
    ;

logon_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LOGON")}?=> REGULAR_ID -> LOGON_VK[$REGULAR_ID]
    ;

after_key
    :    {equalsIgnoreCase(LT(1)->getText(), "AFTER")}?=> REGULAR_ID -> AFTER_VK[$REGULAR_ID]
    ;

schema_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SCHEMA")}?=> REGULAR_ID -> SCHEMA_VK[$REGULAR_ID]
    ;

grant_key
    :    SQL92_RESERVED_GRANT
    ;

truncate_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TRUNCATE")}?=> REGULAR_ID -> TRUNCATE_VK[$REGULAR_ID]
    ;

startup_key
    :    {equalsIgnoreCase(LT(1)->getText(), "STARTUP")}?=> REGULAR_ID -> STARTUP_VK[$REGULAR_ID]
    ;

statistics_key
    :    {equalsIgnoreCase(LT(1)->getText(), "STATISTICS")}?=> REGULAR_ID -> STATISTICS_VK[$REGULAR_ID]
    ;

noaudit_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NOAUDIT")}?=> REGULAR_ID -> NOAUDIT_VK[$REGULAR_ID]
    ;

suspend_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SUSPEND")}?=> REGULAR_ID -> SUSPEND_VK[$REGULAR_ID]
    ;

audit_key
    :    {equalsIgnoreCase(LT(1)->getText(), "AUDIT")}?=> REGULAR_ID -> AUDIT_VK[$REGULAR_ID]
    ;

disassociate_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DISASSOCIATE")}?=> REGULAR_ID -> DISASSOCIATE_VK[$REGULAR_ID] 
    ;

shutdown_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SHUTDOWN")}?=> REGULAR_ID -> SHUTDOWN_VK[$REGULAR_ID]
    ;

compound_key
    :    {equalsIgnoreCase(LT(1)->getText(), "COMPOUND")}?=> REGULAR_ID -> COMPOUND_VK[$REGULAR_ID]
    ;

servererror_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SERVERERROR")}?=> REGULAR_ID -> SERVERERROR_VK[$REGULAR_ID]
    ;

parent_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PARENT")}?=> REGULAR_ID -> PARENT_VK[$REGULAR_ID]
    ;

follows_key
    :    {equalsIgnoreCase(LT(1)->getText(), "FOLLOWS")}?=> REGULAR_ID -> FOLLOWS_VK[$REGULAR_ID]
    ;

nested_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NESTED")}?=> REGULAR_ID -> NESTED_VK[$REGULAR_ID]
    ;

old_key
    :    {equalsIgnoreCase(LT(1)->getText(), "OLD")}?=> REGULAR_ID -> OLD_VK[$REGULAR_ID]
    ;

statement_key
    :    {equalsIgnoreCase(LT(1)->getText(), "STATEMENT")}?=> REGULAR_ID
    ;

db_role_change_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DB_ROLE_CHANGE")}?=> REGULAR_ID -> DB_ROLE_CHANGE_VK[$REGULAR_ID]
    ;

each_key
    :    {equalsIgnoreCase(LT(1)->getText(), "EACH")}?=> REGULAR_ID
    ;

logoff_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LOGOFF")}?=> REGULAR_ID -> LOGOFF_VK[$REGULAR_ID]
    ;

analyze_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ANALYZE")}?=> REGULAR_ID -> ANALYZE_VK[$REGULAR_ID]
    ;

instead_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INSTEAD")}?=> REGULAR_ID -> INSTEAD_VK[$REGULAR_ID]
    ;

associate_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ASSOCIATE")}?=> REGULAR_ID -> ASSOCIATE_VK[$REGULAR_ID]
    ;

new_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NEW")}?=> REGULAR_ID -> NEW_VK[$REGULAR_ID]
    ;

revoke_key
    :    SQL92_RESERVED_REVOKE
    ;

rename_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RENAME")}?=> REGULAR_ID -> RENAME_VK[$REGULAR_ID] 
    ;

customdatum_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CUSTOMDATUM")}?=> REGULAR_ID -> CUSTOMDATUM_VK[$REGULAR_ID]
    ;

oradata_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ORADATA")}?=> REGULAR_ID -> ORADATA_VK[$REGULAR_ID]
    ;

constructor_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CONSTRUCTOR")}?=> REGULAR_ID -> CONSTRUCTOR_VK[$REGULAR_ID]
    ;

sqldata_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SQLDATA")}?=> REGULAR_ID -> SQLDATA_VK[$REGULAR_ID]
    ;

member_key
    :    {equalsIgnoreCase(LT(1)->getText(), "MEMBER")}?=> REGULAR_ID -> MEMBER_VK[$REGULAR_ID]
    ;

self_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SELF")}?=> REGULAR_ID -> SELF_VK[$REGULAR_ID]
    ;

object_key
    :    {equalsIgnoreCase(LT(1)->getText(), "OBJECT")}?=> REGULAR_ID -> OBJECT_VK[$REGULAR_ID]
    ;

variable_key
    :    {equalsIgnoreCase(LT(1)->getText(), "VARIABLE")}?=> REGULAR_ID
    ;

instantiable_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INSTANTIABLE")}?=> REGULAR_ID -> INSTANTIABLE_VK[$REGULAR_ID]
    ;

final_key
    :    {equalsIgnoreCase(LT(1)->getText(), "FINAL")}?=> REGULAR_ID -> FINAL_VK[$REGULAR_ID]
    ;

static_key
    :    {equalsIgnoreCase(LT(1)->getText(), "STATIC")}?=> REGULAR_ID -> STATIC_VK[$REGULAR_ID]
    ;

oid_key
    :    {equalsIgnoreCase(LT(1)->getText(), "OID")}?=> REGULAR_ID
    ;

result_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RESULT")}?=> REGULAR_ID
    ;

under_key
    :    {equalsIgnoreCase(LT(1)->getText(), "UNDER")}?=> REGULAR_ID -> UNDER_VK[$REGULAR_ID]
    ;

map_key
    :    {equalsIgnoreCase(LT(1)->getText(), "MAP")}?=> REGULAR_ID -> MAP_VK[$REGULAR_ID]
    ;

overriding_key
    :    {equalsIgnoreCase(LT(1)->getText(), "OVERRIDING")}?=> REGULAR_ID -> OVERRIDING_VK[$REGULAR_ID]
    ;

add_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ADD")}?=> REGULAR_ID -> ADD_VK[$REGULAR_ID]
    ;

modify_key
    :    {equalsIgnoreCase(LT(1)->getText(), "MODIFY")}?=> REGULAR_ID -> MODIFY_VK[$REGULAR_ID]
    ;

including_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INCLUDING")}?=> REGULAR_ID -> INCLUDING_VK[$REGULAR_ID]
    ;

substitutable_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SUBSTITUTABLE")}?=> REGULAR_ID
    ;

attribute_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ATTRIBUTE")}?=> REGULAR_ID
    ;

cascade_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CASCADE")}?=> REGULAR_ID -> CASCADE_VK[$REGULAR_ID] 
    ;

data_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DATA")}?=> REGULAR_ID
    ;

invalidate_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INVALIDATE")}?=> REGULAR_ID -> INVALIDATE_VK[$REGULAR_ID]
    ;

element_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ELEMENT")}?=> REGULAR_ID
    ;

first_key
    :    {equalsIgnoreCase(LT(1)->getText(), "FIRST")}?=> REGULAR_ID -> FIRST_VK[$REGULAR_ID]
    ;

check_key
    :    SQL92_RESERVED_CHECK
    ;

option_key
    :    SQL92_RESERVED_OPTION
    ;

nocycle_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NOCYCLE")}?=> REGULAR_ID -> NOCYCLE_VK[$REGULAR_ID]
    ;

locked_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LOCKED")}?=> REGULAR_ID
    ;

block_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BLOCK")}?=> REGULAR_ID -> BLOCK_VK[$REGULAR_ID]
    ;

xml_key
    :    {equalsIgnoreCase(LT(1)->getText(), "XML")}?=> REGULAR_ID -> XML_VK[$REGULAR_ID]
    ;

pivot_key
    :    {(equalsIgnoreCase(LT(1)->getText(), "PIVOT"))}?=> REGULAR_ID -> PIVOT_VK[$REGULAR_ID]
    ;

prior_key
    :    SQL92_RESERVED_PRIOR
    ;

sequential_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SEQUENTIAL")}?=> REGULAR_ID -> SEQUENTIAL_VK[$REGULAR_ID]
    ;

single_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SINGLE")}?=> REGULAR_ID -> SINGLE_VK[$REGULAR_ID]
    ;

skip_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SKIP")}?=> REGULAR_ID -> SKIP_VK[$REGULAR_ID]
    ;

model_key
    :    //{equalsIgnoreCase(LT(1)->getText(), "MODEL")}?=> REGULAR_ID
        PLSQL_NON_RESERVED_MODEL
    ;

updated_key
    :    {equalsIgnoreCase(LT(1)->getText(), "UPDATED")}?=> REGULAR_ID -> UPDATED_VK[$REGULAR_ID]
    ;

increment_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INCREMENT")}?=> REGULAR_ID -> INCREMENT_VK[$REGULAR_ID]
    ;

exclude_key
    :    {equalsIgnoreCase(LT(1)->getText(), "EXCLUDE")}?=> REGULAR_ID -> EXCLUDE_VK[$REGULAR_ID]
    ;

reference_key
    :    {equalsIgnoreCase(LT(1)->getText(), "REFERENCE")}?=> REGULAR_ID -> REFERENCE_VK[$REGULAR_ID]
    ;

sets_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SETS")}?=> REGULAR_ID
    ;

until_key
    :    {equalsIgnoreCase(LT(1)->getText(), "UNTIL")}?=> REGULAR_ID -> UNTIL_VK[$REGULAR_ID]
    ;

seed_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SEED")}?=> REGULAR_ID -> SEED_VK[$REGULAR_ID]
    ;

maxvalue_key
    :    {equalsIgnoreCase(LT(1)->getText(), "MAXVALUE")}?=> REGULAR_ID -> MAXVALUE_VK[$REGULAR_ID]
    ;

siblings_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SIBLINGS")}?=> REGULAR_ID -> SIBLINGS_VK[$REGULAR_ID]
    ;

cube_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CUBE")}?=> REGULAR_ID -> CUBE_VK[$REGULAR_ID]
    ;

nulls_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NULLS")}?=> REGULAR_ID -> NULLS_VK[$REGULAR_ID]
    ;

dimension_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DIMENSION")}?=> REGULAR_ID -> DIMENSION_VK[$REGULAR_ID]
    ;

scn_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SCN")}?=> REGULAR_ID -> SCN_VK[$REGULAR_ID]
    ;

snapshot_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SNAPSHOT")}?=> REGULAR_ID
    ;

decrement_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DECREMENT")}?=> REGULAR_ID -> DECREMENT_VK[$REGULAR_ID]
    ;

unpivot_key
    :    {(equalsIgnoreCase(LT(1)->getText(), "UNPIVOT"))}?=> REGULAR_ID -> UNPIVOT_VK[$REGULAR_ID]
    ;

keep_key
    :    {equalsIgnoreCase(LT(1)->getText(), "KEEP")}?=> REGULAR_ID -> KEEP_VK[$REGULAR_ID]
    ;

measures_key
    :    {equalsIgnoreCase(LT(1)->getText(), "MEASURES")}?=> REGULAR_ID -> MEASURES_VK[$REGULAR_ID]
    ;

rows_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ROWS")}?=> REGULAR_ID -> ROWS_VK[$REGULAR_ID]
    ;

sample_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SAMPLE")}?=> REGULAR_ID -> SAMPLE_VK[$REGULAR_ID]
    ;

upsert_key
    :    {equalsIgnoreCase(LT(1)->getText(), "UPSERT")}?=> REGULAR_ID -> UPSERT_VK[$REGULAR_ID]
    ;

versions_key
    :    {equalsIgnoreCase(LT(1)->getText(), "VERSIONS")}?=> REGULAR_ID -> VERSIONS_VK[$REGULAR_ID]
    ;

rules_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RULES")}?=> REGULAR_ID -> RULES_VK[$REGULAR_ID]
    ;

iterate_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ITERATE")}?=> REGULAR_ID -> ITERATE_VK[$REGULAR_ID]
    ;

minvalue_key
    :    {equalsIgnoreCase(LT(1)->getText(), "MINVALUE")}?=> REGULAR_ID -> MINVALUE_VK[$REGULAR_ID]
    ;

rollup_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ROLLUP")}?=> REGULAR_ID -> ROLLUP_VK[$REGULAR_ID]
    ;

nav_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NAV")}?=> REGULAR_ID -> NAV_VK[$REGULAR_ID]
    ;

automatic_key
    :    {equalsIgnoreCase(LT(1)->getText(), "AUTOMATIC")}?=> REGULAR_ID -> AUTOMATIC_VK[$REGULAR_ID]
    ;

last_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LAST")}?=> REGULAR_ID -> LAST_VK[$REGULAR_ID]
    ;

main_key
    :    {equalsIgnoreCase(LT(1)->getText(), "MAIN")}?=> REGULAR_ID
    ;

grouping_key
    :    {equalsIgnoreCase(LT(1)->getText(), "GROUPING")}?=> REGULAR_ID -> GROUPING_VK[$REGULAR_ID]
    ;

include_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INCLUDE")}?=> REGULAR_ID -> INCLUDE_VK[$REGULAR_ID]
    ;

ignore_key
    :    {equalsIgnoreCase(LT(1)->getText(), "IGNORE")}?=> REGULAR_ID -> IGNORE_VK[$REGULAR_ID]
    ;

respect_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RESPECT")}?=> REGULAR_ID ->RESPECT_VK[$REGULAR_ID]
    ;

unique_key
    :    SQL92_RESERVED_UNIQUE
    ;

submultiset_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SUBMULTISET")}?=> REGULAR_ID -> SUBMULTISET_VK[$REGULAR_ID]
    ;

at_key
    :    {equalsIgnoreCase(LT(1)->getText(), "AT")}?=> REGULAR_ID -> AT_VK[$REGULAR_ID]
    ;

a_key
    :    {equalsIgnoreCase(LT(1)->getText(), "A")}?=> REGULAR_ID
    ;

empty_key
    :    {equalsIgnoreCase(LT(1)->getText(), "EMPTY")}?=> REGULAR_ID
    ;

likec_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LIKEC")}?=> REGULAR_ID -> LIKEC_VK[$REGULAR_ID]
    ;

nan_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NAN")}?=> REGULAR_ID
    ;

infinite_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INFINITE")}?=> REGULAR_ID
    ;

like2_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LIKE2")}?=> REGULAR_ID -> LIKE2_VK[$REGULAR_ID]
    ;

like4_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LIKE4")}?=> REGULAR_ID -> LIKE4_VK[$REGULAR_ID]
    ;

present_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PRESENT")}?=> REGULAR_ID
    ;

dbtimezone_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DBTIMEZONE")}?=> REGULAR_ID -> DBTIMEZONE_VK[$REGULAR_ID]
    ;

sessiontimezone_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SESSIONTIMEZONE")}?=> REGULAR_ID -> SESSIONTIMEZONE_VK[$REGULAR_ID]
    ;

nchar_cs_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NCHAR_CS")}?=> REGULAR_ID -> NCHAR_CS_VK[$REGULAR_ID]
    ;

decompose_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DECOMPOSE")}?=> REGULAR_ID -> DECOMPOSE_VK[$REGULAR_ID]
    ;

following_key
    :    {equalsIgnoreCase(LT(1)->getText(), "FOLLOWING")}?=> REGULAR_ID -> FOLLOWING_VK[$REGULAR_ID]
    ;

first_value_key
    :    {equalsIgnoreCase(LT(1)->getText(), "FIRST_VALUE")}?=> REGULAR_ID -> FIRST_VALUE_VK[$REGULAR_ID]
    ;

preceding_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PRECEDING")}?=> REGULAR_ID -> PRECEDING_VK[$REGULAR_ID]
    ;

within_key
    :    {equalsIgnoreCase(LT(1)->getText(), "WITHIN")}?=> REGULAR_ID -> WITHIN_VK[$REGULAR_ID]
    ;

canonical_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CANONICAL")}?=> REGULAR_ID -> CANONICAL_VK[$REGULAR_ID]
    ;

compatibility_key
    :    {equalsIgnoreCase(LT(1)->getText(), "COMPATIBILITY")}?=> REGULAR_ID -> COMPATIBILITY_VK[$REGULAR_ID]
    ;

over_key
    :    {equalsIgnoreCase(LT(1)->getText(), "OVER")}?=> REGULAR_ID -> OVER_VK[$REGULAR_ID]
    ;

multiset_key
//    :    {equalsIgnoreCase(LT(1)->getText(), "MULTISET")}?=> REGULAR_ID
    :    PLSQL_NON_RESERVED_MULTISET
    ;

connect_by_root_key
    :    PLSQL_NON_RESERVED_CONNECT_BY_ROOT
    ;

last_value_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LAST_VALUE")}?=> REGULAR_ID -> LAST_VALUE_VK[$REGULAR_ID]
    ;

current_key
    :    SQL92_RESERVED_CURRENT
    ;

unbounded_key
    :    {equalsIgnoreCase(LT(1)->getText(), "UNBOUNDED")}?=> REGULAR_ID -> UNBOUNDED_VK[$REGULAR_ID]
    ;

dense_rank_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DENSE_RANK")}?=> REGULAR_ID -> DENSE_RANK_VK[$REGULAR_ID]
    ;

cost_key
    :    {equalsIgnoreCase(LT(1)->getText(), "COST")}?=> REGULAR_ID -> COST_VK[$REGULAR_ID]
    ;

char_cs_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CHAR_CS")}?=> REGULAR_ID -> CHAR_CS_VK[$REGULAR_ID]
    ;

auto_key
    :    {equalsIgnoreCase(LT(1)->getText(), "AUTO")}?=> REGULAR_ID -> AUTO_VK[$REGULAR_ID]
    ;

treat_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TREAT")}?=> REGULAR_ID -> TREAT_VK[$REGULAR_ID]
    ;

content_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CONTENT")}?=> REGULAR_ID -> CONTENT_VK[$REGULAR_ID]
    ;

xmlparse_key
    :    {equalsIgnoreCase(LT(1)->getText(), "XMLPARSE")}?=> REGULAR_ID -> XMLPARSE_VK[$REGULAR_ID]
    ;

xmlelement_key
    :    {equalsIgnoreCase(LT(1)->getText(), "XMLELEMENT")}?=> REGULAR_ID -> XMLELEMENT_VK[$REGULAR_ID]
    ;

entityescaping_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ENTITYESCAPING")}?=> REGULAR_ID -> ENTITYESCAPING_VK[$REGULAR_ID]
    ;

standalone_key
    :    {equalsIgnoreCase(LT(1)->getText(), "STANDALONE")}?=> REGULAR_ID -> STANDALONE_VK[$REGULAR_ID]
    ;

wellformed_key
    :    {equalsIgnoreCase(LT(1)->getText(), "WELLFORMED")}?=> REGULAR_ID -> WELLFORMED_VK[$REGULAR_ID]
    ;

xmlexists_key
    :    {equalsIgnoreCase(LT(1)->getText(), "XMLEXISTS")}?=> REGULAR_ID -> XMLEXISTS_VK[$REGULAR_ID]
    ;

version_key
    :    {equalsIgnoreCase(LT(1)->getText(), "VERSION")}?=> REGULAR_ID -> VERSION_VK[$REGULAR_ID]
    ;

xmlcast_key
    :    {equalsIgnoreCase(LT(1)->getText(), "XMLCAST")}?=> REGULAR_ID -> XMLCAST_VK[$REGULAR_ID]
    ;

yes_key
    :    {equalsIgnoreCase(LT(1)->getText(), "YES")}?=> REGULAR_ID -> YES_VK[$REGULAR_ID]
    ;

no_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NO")}?=> REGULAR_ID -> NO_VK[$REGULAR_ID]
    ;

evalname_key
    :    {equalsIgnoreCase(LT(1)->getText(), "EVALNAME")}?=> REGULAR_ID -> EVALNAME_VK[$REGULAR_ID]
    ;

xmlpi_key
    :    {equalsIgnoreCase(LT(1)->getText(), "XMLPI")}?=> REGULAR_ID -> XMLPI_VK[$REGULAR_ID]
    ;

xmlcolattval_key
    :    {equalsIgnoreCase(LT(1)->getText(), "XMLCOLATTVAL")}?=> REGULAR_ID -> XMLCOLATTVAL_VK[$REGULAR_ID]
    ;

document_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DOCUMENT")}?=> REGULAR_ID -> DOCUMENT_VK[$REGULAR_ID]
    ;

xmlforest_key
    :    {equalsIgnoreCase(LT(1)->getText(), "XMLFOREST")}?=> REGULAR_ID -> XMLFOREST_VK[$REGULAR_ID]
    ;

passing_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PASSING")}?=> REGULAR_ID -> PASSING_VK[$REGULAR_ID]
    ;

columns_key//: PLSQL_RESERVED_COLUMNS
    :    {equalsIgnoreCase(LT(1)->getText(), "COLUMNS")}?=> REGULAR_ID -> PASSING_VK[$REGULAR_ID] 
    ;

indent_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INDENT")}?=> REGULAR_ID -> INDENT_VK[$REGULAR_ID]
    ;

hide_key
    :    {equalsIgnoreCase(LT(1)->getText(), "HIDE")}?=> REGULAR_ID -> HIDE_VK[$REGULAR_ID]
    ;

xmlagg_key
    :    {equalsIgnoreCase(LT(1)->getText(), "XMLAGG")}?=> REGULAR_ID -> XMLAGG_VK[$REGULAR_ID]
    ;

path_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PATH")}?=> REGULAR_ID
    ;

xmlnamespaces_key
    :    {equalsIgnoreCase(LT(1)->getText(), "XMLNAMESPACES")}?=> REGULAR_ID -> XMLNAMESPACES_VK[$REGULAR_ID]
    ;

size_key
    :    SQL92_RESERVED_SIZE
    ;

noschemacheck_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NOSCHEMACHECK")}?=> REGULAR_ID -> NOSCHEMACHECK_VK[$REGULAR_ID]
    ;

noentityescaping_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NOENTITYESCAPING")}?=> REGULAR_ID -> NOENTITYESCAPING_VK[$REGULAR_ID]
    ;

xmlquery_key
    :    {equalsIgnoreCase(LT(1)->getText(), "XMLQUERY")}?=> REGULAR_ID -> XMLQUERY_VK[$REGULAR_ID]
    ;

xmltable_key
    :    {equalsIgnoreCase(LT(1)->getText(), "XMLTABLE")}?=> REGULAR_ID -> XMLTABLE_VK[$REGULAR_ID]
    ;

xmlroot_key
    :    {equalsIgnoreCase(LT(1)->getText(), "XMLROOT")}?=> REGULAR_ID -> XMLROOT_VK[$REGULAR_ID]
    ;

schemacheck_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SCHEMACHECK")}?=> REGULAR_ID -> SCHEMACHECK_VK[$REGULAR_ID]
    ;

xmlattributes_key
    :    {equalsIgnoreCase(LT(1)->getText(), "XMLATTRIBUTES")}?=> REGULAR_ID -> XMLATTRIBUTES_VK[$REGULAR_ID]
    ;

encoding_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ENCODING")}?=> REGULAR_ID -> ENCODING_VK[$REGULAR_ID]
    ;

show_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SHOW")}?=> REGULAR_ID -> SHOW_VK[$REGULAR_ID]
    ;

xmlserialize_key
    :    {equalsIgnoreCase(LT(1)->getText(), "XMLSERIALIZE")}?=> REGULAR_ID -> XMLSERIALIZE_VK[$REGULAR_ID]
    ;

ordinality_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ORDINALITY")}?=> REGULAR_ID -> ORDINALITY_VK[$REGULAR_ID]
    ;

defaults_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DEFAULTS")}?=> REGULAR_ID -> DEFAULTS_VK[$REGULAR_ID]
    ;

sqlerror_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SQLERROR")}? REGULAR_ID 
    ;
	
oserror_key
    :    {equalsIgnoreCase(LT(1)->getText(), "OSERROR")}? REGULAR_ID 
    ;

success_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SUCCESS")}? REGULAR_ID 
    ;

warning_key
    :    {equalsIgnoreCase(LT(1)->getText(), "WARNING")}? REGULAR_ID 
    ;

failure_key
    :    {equalsIgnoreCase(LT(1)->getText(), "FAILURE")}? REGULAR_ID 
    ;

insert_key
    :    SQL92_RESERVED_INSERT
    ;

order_key
    :    SQL92_RESERVED_ORDER
    ;

minus_key
    :    PLSQL_RESERVED_MINUS
    ;

row_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ROW")}? REGULAR_ID -> ROW_VK[$REGULAR_ID]
    ;

mod_key
    :    {equalsIgnoreCase(LT(1)->getText(), "MOD")}? REGULAR_ID
    ;

raw_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RAW")}?=> REGULAR_ID -> RAW_VK[$REGULAR_ID]
    ;

power_key
    :    {equalsIgnoreCase(LT(1)->getText(), "POWER")}? REGULAR_ID
    ;

lock_key
    :    PLSQL_RESERVED_LOCK
    ;

exists_key
    :    SQL92_RESERVED_EXISTS
    ;

having_key
    :    SQL92_RESERVED_HAVING
    ;

any_key
    :    SQL92_RESERVED_ANY
    ;

with_key
    :    SQL92_RESERVED_WITH
    ;

transaction_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TRANSACTION")}?=> REGULAR_ID
    ;

rawtohex_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RAWTOHEX")}? REGULAR_ID
    ;

number_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NUMBER")}?=> REGULAR_ID -> NUMBER_VK[$REGULAR_ID]
    ;

nocopy_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NOCOPY")}?=> REGULAR_ID -> NOCOPY_VK[$REGULAR_ID]
    ;

to_key
    :    SQL92_RESERVED_TO
    ;

abs_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ABS")}? REGULAR_ID
    ;

rollback_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ROLLBACK")}?=> REGULAR_ID -> ROLLBACK_VK[$REGULAR_ID]
    ;

share_key
    :    PLSQL_RESERVED_SHARE
    ;

greatest_key
    :    {equalsIgnoreCase(LT(1)->getText(), "GREATEST")}? REGULAR_ID
    ;

vsize_key
    :    {equalsIgnoreCase(LT(1)->getText(), "VSIZE")}? REGULAR_ID
    ;

exclusive_key
    :    PLSQL_RESERVED_EXCLUSIVE
    ;

varchar2_key
    :    {equalsIgnoreCase(LT(1)->getText(), "VARCHAR2")}?=> REGULAR_ID -> VARCHAR2_VK[$REGULAR_ID]
    ;

rowidtochar_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ROWIDTOCHAR")}? REGULAR_ID
    ;

open_key
    :    {equalsIgnoreCase(LT(1)->getText(), "OPEN")}?=> REGULAR_ID -> OPEN_VK[$REGULAR_ID]
    ;

comment_key
    :    {equalsIgnoreCase(LT(1)->getText(), "COMMENT")}?=> REGULAR_ID -> COMMENT_VK[$REGULAR_ID]
    ;

sqrt_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SQRT")}? REGULAR_ID
    ;

instr_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INSTR")}? REGULAR_ID
    ;

nowait_key
    :    PLSQL_RESERVED_NOWAIT
    ;

lpad_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LPAD")}? REGULAR_ID
    ;

boolean_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BOOLEAN")}?=> REGULAR_ID -> BOOLEAN_VK[$REGULAR_ID]
    ;

rpad_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RPAD")}? REGULAR_ID
    ;

savepoint_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SAVEPOINT")}?=> REGULAR_ID -> SAVEPOINT_VK[$REGULAR_ID]
    ;

decode_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DECODE")}? REGULAR_ID
    ;

reverse_key
    :    {equalsIgnoreCase(LT(1)->getText(), "REVERSE")}? REGULAR_ID -> REVERSE_VK[$REGULAR_ID]
    ;

least_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LEAST")}? REGULAR_ID
    ;

nvl_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NVL")}? REGULAR_ID
    ;

variance_key
    :    {equalsIgnoreCase(LT(1)->getText(), "VARIANCE")}? REGULAR_ID
    ;

start_key
    :    PLSQL_RESERVED_START
    ;

desc_key
    :    SQL92_RESERVED_DESC
    ;

concat_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CONCAT")}? REGULAR_ID
    ;

dump_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DUMP")}? REGULAR_ID
    ;

soundex_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SOUNDEX")}? REGULAR_ID
    ;

positive_key
    :    {equalsIgnoreCase(LT(1)->getText(), "POSITIVE")}?=> REGULAR_ID -> POSITIVE_VK[$REGULAR_ID]
    ;

union_key
    :    SQL92_RESERVED_UNION
    ;

ascii_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ASCII")}? REGULAR_ID
    ;

connect_key
    :    SQL92_RESERVED_CONNECT
    ;

asc_key
    :    SQL92_RESERVED_ASC
    ;

hextoraw_key
    :    {equalsIgnoreCase(LT(1)->getText(), "HEXTORAW")}? REGULAR_ID
    ;

to_date_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TO_DATE")}? REGULAR_ID
    ;

floor_key
    :    {equalsIgnoreCase(LT(1)->getText(), "FLOOR")}? REGULAR_ID
    ;

sign_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SIGN")}? REGULAR_ID
    ;

update_key
    :    SQL92_RESERVED_UPDATE
    ;

trunc_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TRUNC")}? REGULAR_ID
    ;

rtrim_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RTRIM")}? REGULAR_ID
    ;

close_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CLOSE")}?=> REGULAR_ID -> CLOSE_VK[$REGULAR_ID]
    ;

to_char_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TO_CHAR")}? REGULAR_ID
    ;

ltrim_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LTRIM")}? REGULAR_ID
    ;

mode_key
    :    PLSQL_RESERVED_MODE
    ;

uid_key
    :    {equalsIgnoreCase(LT(1)->getText(), "UID")}? REGULAR_ID
    ;

chr_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CHR")}? REGULAR_ID -> CHR_VK[$REGULAR_ID]
    ;

intersect_key
    :    SQL92_RESERVED_INTERSECT
    ;

chartorowid_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CHARTOROWID")}? REGULAR_ID
    ;

mlslabel_key
    :    {equalsIgnoreCase(LT(1)->getText(), "MLSLABEL")}?=> REGULAR_ID -> MLSLABEL_VK[$REGULAR_ID]
    ;

userenv_key
    :    {equalsIgnoreCase(LT(1)->getText(), "USERENV")}? REGULAR_ID
    ;

stddev_key
    :    {equalsIgnoreCase(LT(1)->getText(), "STDDEV")}? REGULAR_ID
    ;

length_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LENGTH")}? REGULAR_ID
    ;

fetch_key
    :    SQL92_RESERVED_FETCH
    ;

group_key
    :    SQL92_RESERVED_GROUP
    ;

sysdate_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SYSDATE")}? REGULAR_ID
    ;

binary_integer_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BINARY_INTEGER")}?=> REGULAR_ID -> BINARY_INTEGER_VK[$REGULAR_ID]
    ;

to_number_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TO_NUMBER")}? REGULAR_ID
    ;

substr_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SUBSTR")}? REGULAR_ID
    ;

ceil_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CEIL")}? REGULAR_ID
    ;

initcap_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INITCAP")}? REGULAR_ID
    ;

round_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ROUND")}? REGULAR_ID
    ;

long_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LONG")}?=> REGULAR_ID -> LONG_VK[$REGULAR_ID]
    ;

read_key
    :    {equalsIgnoreCase(LT(1)->getText(), "READ")}?=> REGULAR_ID -> READ_VK[$REGULAR_ID]
    ;

only_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ONLY")}? REGULAR_ID -> ONLY_VK[$REGULAR_ID]
    ;

set_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SET")}?=> REGULAR_ID -> SET_VK[$REGULAR_ID]
    ;

nullif_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NULLIF")}? REGULAR_ID
    ;

coalesce_key
    :    {equalsIgnoreCase(LT(1)->getText(), "COALESCE")}? REGULAR_ID
    ;

count_key
    :    {equalsIgnoreCase(LT(1)->getText(), "COUNT")}? REGULAR_ID -> COUNT_VK[$REGULAR_ID]
    ;

avg_key    :    {equalsIgnoreCase(LT(1)->getText(), "AVG")}? REGULAR_ID
    ;

max_key    :    {equalsIgnoreCase(LT(1)->getText(), "MAX")}? REGULAR_ID
    ;

min_key    :    {equalsIgnoreCase(LT(1)->getText(), "MIN")}? REGULAR_ID
    ;

sum_key    :    {equalsIgnoreCase(LT(1)->getText(), "SUM")}? REGULAR_ID
    ;

unknown_key
    :    {equalsIgnoreCase(LT(1)->getText(), "UNKNOWN")}? REGULAR_ID
    ;

escape_key
    :    {equalsIgnoreCase(LT(1)->getText(), "ESCAPE")}? REGULAR_ID
    ;

some_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SOME")}? REGULAR_ID -> SOME_VK[$REGULAR_ID]
    ;

match_key
    :    {equalsIgnoreCase(LT(1)->getText(), "MATCH")}? REGULAR_ID
    ;

cast_key
//    :    {equalsIgnoreCase(LT(1)->getText(), "CAST")}? REGULAR_ID -> CAST_VK[$REGULAR_ID]
    :    PLSQL_NON_RESERVED_CAST
    ;

full_key:    {equalsIgnoreCase(LT(1)->getText(), "FULL")}?=> REGULAR_ID -> FULL_VK[$REGULAR_ID]
    ;

partial_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PARTIAL")}? REGULAR_ID
    ;

character_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CHARACTER")}?=> REGULAR_ID -> CHARACTER_VK[$REGULAR_ID]
    ;

except_key
    :    {equalsIgnoreCase(LT(1)->getText(), "EXCEPT")}? REGULAR_ID
    ;

char_key:    {equalsIgnoreCase(LT(1)->getText(), "CHAR")}?=> REGULAR_ID -> CHAR_VK[$REGULAR_ID]
    ;

varying_key
    :    {equalsIgnoreCase(LT(1)->getText(), "VARYING")}?=> REGULAR_ID
    ;

varchar_key
    :    {equalsIgnoreCase(LT(1)->getText(), "VARCHAR")}?=> REGULAR_ID -> VARCHAR_VK[$REGULAR_ID]
    ;

national_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NATIONAL")}? REGULAR_ID
    ;

nchar_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NCHAR")}? REGULAR_ID -> NCHAR_VK[$REGULAR_ID]
    ;

bit_key    :    {equalsIgnoreCase(LT(1)->getText(), "BIT")}? REGULAR_ID -> BIT_VK[$REGULAR_ID]
    ;

float_key
    :    {equalsIgnoreCase(LT(1)->getText(), "FLOAT")}? REGULAR_ID -> FLOAT_VK[$REGULAR_ID]
    ;
    
real_key:    {equalsIgnoreCase(LT(1)->getText(), "REAL")}?=> REGULAR_ID -> REAL_VK[$REGULAR_ID]
    ;

double_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DOUBLE")}?=> REGULAR_ID -> DOUBLE_VK[$REGULAR_ID]
    ;

precision_key
    :    {equalsIgnoreCase(LT(1)->getText(), "PRECISION")}? REGULAR_ID -> PRECISION_VK[$REGULAR_ID]
    ;

interval_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INTERVAL")}?=> REGULAR_ID
    ;

time_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TIME")}? REGULAR_ID -> TIME_VK[$REGULAR_ID]
    ;
 
zone_key:    {equalsIgnoreCase(LT(1)->getText(), "ZONE")}? REGULAR_ID
    ;

timestamp_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TIMESTAMP")}? REGULAR_ID -> TIMESTAMP_VK[$REGULAR_ID]
    ;

date_key//:    {equalsIgnoreCase(LT(1)->getText(), "DATE")}?=> REGULAR_ID -> DATE_VK[$REGULAR_ID]
    :    SQL92_RESERVED_DATE
    ;

numeric_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NUMERIC")}?=> REGULAR_ID -> NUMERIC_VK[$REGULAR_ID]
    ;

decimal_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DECIMAL")}?=> REGULAR_ID -> DECIMAL_VK[$REGULAR_ID]
    ;

dec_key    :    {equalsIgnoreCase(LT(1)->getText(), "DEC")}?=> REGULAR_ID -> DEC_VK[$REGULAR_ID]
    ;

integer_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INTEGER")}?=> REGULAR_ID -> INTEGER_VK[$REGULAR_ID]
    ;

int_key    :    {equalsIgnoreCase(LT(1)->getText(), "INT")}?=> REGULAR_ID -> INT_VK[$REGULAR_ID]
    ;

smallint_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SMALLINT")}?=> REGULAR_ID -> SMALLINT_VK[$REGULAR_ID]
    ;

corresponding_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CORRESPONDING")}? REGULAR_ID
    ;

cross_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CROSS")}?=> REGULAR_ID -> CROSS_VK[$REGULAR_ID]
    ;

join_key
    :    {equalsIgnoreCase(LT(1)->getText(), "JOIN")}?=> REGULAR_ID
    ;

left_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LEFT")}?=> REGULAR_ID -> LEFT_VK[$REGULAR_ID]
    ;

right_key
    :    {equalsIgnoreCase(LT(1)->getText(), "RIGHT")}?=> REGULAR_ID -> RIGHT_VK[$REGULAR_ID]
    ;

inner_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INNER")}?=> REGULAR_ID -> INNER_VK[$REGULAR_ID]
    ;

natural_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NATURAL")}?=> REGULAR_ID -> NATURAL_VK[$REGULAR_ID]
    ;

outer_key
    :    {equalsIgnoreCase(LT(1)->getText(), "OUTER")}?=> REGULAR_ID
    ;

using_key
    :    PLSQL_NON_RESERVED_USING
    ;

indicator_key
    :    {equalsIgnoreCase(LT(1)->getText(), "INDICATOR")}? REGULAR_ID
    ;

user_key
    :    {equalsIgnoreCase(LT(1)->getText(), "USER")}? REGULAR_ID
    ;

current_user_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CURRENT_USER")}? REGULAR_ID -> CURRENT_USER_VK[$REGULAR_ID]
    ;

session_user_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SESSION_USER")}? REGULAR_ID
    ;

system_user_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SYSTEM_USER")}? REGULAR_ID
    ;

value_key
    :    {equalsIgnoreCase(LT(1)->getText(), "VALUE")}? REGULAR_ID -> VALUE_VK[$REGULAR_ID]
    ;

substring_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SUBSTRING")}?=> REGULAR_ID
    ;

upper_key
    :    {equalsIgnoreCase(LT(1)->getText(), "UPPER")}? REGULAR_ID
    ;

lower_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LOWER")}? REGULAR_ID
    ;

convert_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CONVERT")}? REGULAR_ID -> CONVERT_VK[$REGULAR_ID]
    ;

translate_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TRANSLATE")}? REGULAR_ID -> TRANSLATE_VK[$REGULAR_ID]
    ;

trim_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TRIM")}? REGULAR_ID -> TRIM_VK[$REGULAR_ID]
    ;

leading_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LEADING")}? REGULAR_ID -> LEADING_VK[$REGULAR_ID]
    ;

trailing_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TRAILING")}? REGULAR_ID -> TRAILING_VK[$REGULAR_ID]
    ;

both_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BOTH")}? REGULAR_ID -> BOTH_VK[$REGULAR_ID]
    ;

collate_key
    :    {equalsIgnoreCase(LT(1)->getText(), "COLLATE")}? REGULAR_ID
    ;

position_key
    :    {equalsIgnoreCase(LT(1)->getText(), "POSITION")}? REGULAR_ID
    ;

extract_key
    :    {equalsIgnoreCase(LT(1)->getText(), "EXTRACT")}? REGULAR_ID -> EXTRACT_VK[$REGULAR_ID]
    ;

second_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SECOND")}? REGULAR_ID -> SECOND_VK[$REGULAR_ID]
    ;

timezone_hour_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TIMEZONE_HOUR")}? REGULAR_ID -> TIMEZONE_HOUR_VK[$REGULAR_ID]
    ;

timezone_minute_key
    :    {equalsIgnoreCase(LT(1)->getText(), "TIMEZONE_MINUTE")}? REGULAR_ID -> TIMEZONE_MINUTE_VK[$REGULAR_ID]
    ;

char_length_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CHAR_LENGTH")}? REGULAR_ID
    ;

octet_length_key
    :    {equalsIgnoreCase(LT(1)->getText(), "OCTET_LENGTH")}? REGULAR_ID
    ;

character_length_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CHARACTER_LENGTH")}? REGULAR_ID
    ;

bit_length_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BIT_LENGTH")}? REGULAR_ID
    ;

local_key
    :    {equalsIgnoreCase(LT(1)->getText(), "LOCAL")}? REGULAR_ID -> LOCAL_VK[$REGULAR_ID]
    ;

current_timestamp_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CURRENT_TIMESTAMP")}? REGULAR_ID
    ;

current_date_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CURRENT_DATE")}? REGULAR_ID
    ;

current_time_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CURRENT_TIME")}? REGULAR_ID
    ;

module_key
    :    {equalsIgnoreCase(LT(1)->getText(), "MODULE")}? REGULAR_ID
    ;

global_key
    :    {equalsIgnoreCase(LT(1)->getText(), "GLOBAL")}? REGULAR_ID
    ;

year_key
    :    {equalsIgnoreCase(LT(1)->getText(), "YEAR")}?=> REGULAR_ID -> YEAR_VK[$REGULAR_ID]
    ;

month_key
    :    {equalsIgnoreCase(LT(1)->getText(), "MONTH")}? REGULAR_ID -> MONTH_VK[$REGULAR_ID]
    ;

day_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DAY")}?=> REGULAR_ID -> DAY_VK[$REGULAR_ID]
    ;

hour_key:    {equalsIgnoreCase(LT(1)->getText(), "HOUR")}? REGULAR_ID -> HOUR_VK[$REGULAR_ID]
    ;

minute_key
    :    {equalsIgnoreCase(LT(1)->getText(), "MINUTE")}? REGULAR_ID -> MINUTE_VK[$REGULAR_ID]
    ;

whenever_key
    :    {equalsIgnoreCase(LT(1)->getText(), "WHENEVER")}? REGULAR_ID
    ;

is_key
    :    SQL92_RESERVED_IS
    ;

else_key
    :    SQL92_RESERVED_ELSE
    ;

table_key
    :    SQL92_RESERVED_TABLE
    ;

the_key
    :    SQL92_RESERVED_THE
    ;

then_key
    :    SQL92_RESERVED_THEN
    ;

end_key
    :    SQL92_RESERVED_END
    ;

all_key
    :    SQL92_RESERVED_ALL
    ;

on_key
    :    SQL92_RESERVED_ON
    ;

or_key
    :    SQL92_RESERVED_OR
    ;

and_key
    :    SQL92_RESERVED_AND
    ;

not_key
    :    SQL92_RESERVED_NOT
    ;

true_key
    :    SQL92_RESERVED_TRUE
    ;

false_key
    :    SQL92_RESERVED_FALSE
    ;

default_key
    :    SQL92_RESERVED_DEFAULT
    ;

distinct_key
    :    SQL92_RESERVED_DISTINCT
    ;

into_key
    :    SQL92_RESERVED_INTO
    ;

by_key
    :    SQL92_RESERVED_BY
    ;

as_key
    :    SQL92_RESERVED_AS
    ;

in_key
    :    SQL92_RESERVED_IN
    ;

of_key
    :    SQL92_RESERVED_OF
    ;

null_key
    :    SQL92_RESERVED_NULL
    ;

for_key
    :    SQL92_RESERVED_FOR
    ;

select_key
    :    SQL92_RESERVED_SELECT
    ;

when_key
    :    SQL92_RESERVED_WHEN
    ;

delete_key
    :    SQL92_RESERVED_DELETE
    ;

between_key
    :    SQL92_RESERVED_BETWEEN
    ;

like_key
    :    SQL92_RESERVED_LIKE
    ;

from_key
    :    SQL92_RESERVED_FROM
    ;

where_key
    :    SQL92_RESERVED_WHERE
    ;

sequence_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SEQUENCE")}? REGULAR_ID -> SEQUENCE_VK[$REGULAR_ID]
    ;

noorder_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NOORDER")}? REGULAR_ID -> NOORDER_VK[$REGULAR_ID]
    ;

cycle_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CYCLE")}? REGULAR_ID -> CYCLE_VK[$REGULAR_ID]
    ;

cache_key
    :    {equalsIgnoreCase(LT(1)->getText(), "CACHE")}? REGULAR_ID -> CACHE_VK[$REGULAR_ID]
    ;

nocache_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NOCACHE")}? REGULAR_ID -> NOCACHE_VK[$REGULAR_ID]
    ;

nomaxvalue_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NOMAXVALUE")}? REGULAR_ID -> NOMAXVALUE_VK[$REGULAR_ID]
    ;

nominvalue_key
    :    {equalsIgnoreCase(LT(1)->getText(), "NOMINVALUE")}? REGULAR_ID -> NOMINVALUE_VK[$REGULAR_ID]
    ;

search_key
    :    {equalsIgnoreCase(LT(1)->getText(), "SEARCH")}? REGULAR_ID -> SEARCH_VK[$REGULAR_ID]
    ;

depth_key
    :    {equalsIgnoreCase(LT(1)->getText(), "DEPTH")}? REGULAR_ID -> DEPTH_VK[$REGULAR_ID]
    ;

breadth_key
    :    {equalsIgnoreCase(LT(1)->getText(), "BREADTH")}? REGULAR_ID -> BREADTH_VK[$REGULAR_ID]
    ;
