class ZCL_easy_abap definition
  public
  final
  create public .


public section.
  type-pools ABAP .
  type-pools RSDS .

  types:
    BEGIN OF ty,
             o_easy_abap TYPE REF TO zcl_easy_abap,
             BEGIN OF  s_cx_data,
               s_bapiret     TYPE bapiret2,
               s_callstack   TYPE abap_callstack_line,
               t_callstack   TYPE abap_callstack,
               t_source_code TYPE stringtab,
               serial_value  TYPE string,
               add_serial    TYPE string,
               add_t100      TYPE bapiret2_tab,
               add_write     TYPE stringtab,
               noid          TYPE string,
               s_sy          TYPE sy,
               timestampl    TYPE timestampl,
               guid          TYPE string,
               code          TYPE string,
             END OF s_cx_data,
             t_ref_data  TYPE STANDARD TABLE OF REF TO data WITH EMPTY KEY,
             t_ref_obj   TYPE STANDARD TABLE OF REF TO object WITH EMPTY KEY,
             t_bal       TYPE STANDARD TABLE OF balm WITH EMPTY KEY,
           END OF ty .

  constants:
    BEGIN OF cs,
        BEGIN OF s_popup_answer,
          exit TYPE string VALUE 'EXIT',
          yes  TYPE string VALUE 'YES',
          no   TYPE string VALUE 'NO',
        END OF s_popup_answer,
        BEGIN OF s_alv_event_type,
          double_click       TYPE string VALUE 'DOUBLE_CLICK',
          hotspot_click      TYPE string VALUE 'HOTSPOT_CLICK' ##NO_TEXT,
          toolbar_click      TYPE string VALUE 'TOOLBAR_CLICK',
          popup_cancel       TYPE string VALUE 'POPUP_CANCEL',
          popup_close        TYPE string VALUE 'POPUP_CLOSE',
          after_data_changed TYPE string VALUE 'AFTER_DATA_CHANGED',
          menu_button        TYPE string VALUE 'MENU_BUTTON',
          f4_help            TYPE string VALUE 'F4_HELP',
        END OF s_alv_event_type,
        BEGIN OF s_error_code,
          user_exit     TYPE string     VALUE 'ZCX_USER_EXIT',
          no_data       TYPE string     VALUE 'ZCX_NO_DATA',
          input_invalid TYPE string     VALUE 'ZCX_INPUT_INVALID',
        END OF s_error_code,
      END OF cs .
  data:
    BEGIN OF ms_data,
            t_log TYPE bapiret2_tab,
            t_bal TYPE ty-t_bal,
          END OF ms_data .
  class-data:
*    DATA mt_log TYPE bapiret2_tab .
    BEGIN OF ss_db_buffer,
        t_t100       TYPE HASHED TABLE OF t100       WITH UNIQUE KEY sprsl arbgb msgnr,
        t_dd04t      TYPE HASHED TABLE OF dd04t      WITH UNIQUE KEY rollname ddlanguage,
        t_kna1       TYPE HASHED TABLE OF kna1       WITH UNIQUE KEY kunnr,
        t_lfa1       TYPE HASHED TABLE OF lfa1       WITH UNIQUE KEY lifnr,
        t_makt       TYPE HASHED TABLE OF makt       WITH UNIQUE KEY spras matnr,
        t_dd04l      TYPE HASHED TABLE OF dd04l      WITH UNIQUE KEY rollname,
        t_dd01l      TYPE HASHED TABLE OF dd01l      WITH UNIQUE KEY domname,
        t_materialid TYPE HASHED TABLE OF materialid WITH UNIQUE KEY matnr_int,
        t_mara       TYPE HASHED TABLE OF mara       WITH UNIQUE KEY matnr,
        t_ihpa       TYPE HASHED TABLE OF ihpa       WITH UNIQUE KEY objnr parvw counter,
        t_cslt       TYPE HASHED TABLE OF cslt      WITH UNIQUE KEY spras kokrs lstar,
      END OF ss_db_buffer .

*  events EVENT
*    exporting
*      value(E_DATA) type DATA .
  class-methods GET
    importing
      !CONV_IN type ABAP_BOOL optional
      !CONV_OUT type ABAP_BOOL optional
      !PRINT type ABAP_BOOL optional
      !PRINT_DEEP type ABAP_BOOL optional
      !XML type ABAP_BOOL optional
      !JSON type ABAP_BOOL optional
      !JSON_DEEP type ABAP_BOOL optional
      !ZIP type ABAP_BOOL optional
      !UNZIP type ABAP_BOOL optional
      !PARAM_USER type ABAP_BOOL optional
      !TRIM_UPPER_CASE type ABAP_BOOL optional
      !TRIM type ABAP_BOOL optional
      !PARAM_SYSTEM type ABAP_BOOL optional
      !PARAM_ID type ABAP_BOOL optional
      !MSG_TYPE type ABAP_BOOL optional
      !TEXT type ABAP_BOOL optional
      !DD04T type ABAP_BOOL optional
      !GUID16 type ABAP_BOOL optional
      !RTTI_KIND type ABAP_BOOL optional
      !RTTI_TYPE type ABAP_BOOL optional
      !RTTI_TYPE_KIND type ABAP_BOOL optional
      !RTTI_TYPE_SUPER type ABAP_BOOL optional
      !RTTI_TYPE_DYNAM type ABAP_BOOL optional
      !POPUP_CHOOSE type ABAP_BOOL optional
      !POPUP_CONFIRM type ABAP_BOOL optional
      !POPUP_GET_VALUE type ABAP_BOOL optional
      !METHODNAME type ABAP_BOOL optional
      !CX_CODE type ABAP_BOOL optional
      !I_ANY type ANY optional
      !I_ANY2 type ANY optional
      !I_ANY3 type ANY optional
      !I_ANY4 type ANY optional
      !I_ANY5 type ANY optional
      !IV_LANGU type ANY default SY-LANGU
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
      !LOG_INFO type ABAP_BOOL optional
    returning
      value(R_RESULT) type STRING .
  class-methods CFW
    importing
      !GET_FCAT type ABAP_BOOL optional
      !I_ANY type ANY optional
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
    exporting
      !E_ANY type ANY .
  class-methods GET_BUS
    importing
      !VEKP_EXIDV_BY_VENUM type ABAP_BOOL optional
      !VEKP_VENUM_BY_EXIDV type ABAP_BOOL optional
      !MAKT_MAKTX_BY_MATNR type ABAP_BOOL optional
      !MATNR_EXT type ABAP_BOOL optional
      !MARA_MEINS_BY_MATNR type ABAP_BOOL optional
      !VBAK_VBELN_BY_LIKP_VORG type ABAP_BOOL optional
      !KNA1_NAME1_BY_KUNNR type ABAP_BOOL optional
      !LFA1_NAME1_BY_LIFNR type ABAP_BOOL optional
      !VBPA_KUNNR_BY_VBELN_POS_PARVW type ABAP_BOOL optional
      !IHPA_PARNR_BY_OBJNR_PARVW type ABAP_BOOL optional
      !CSLT_LTEXT_BY_LANG_KOKRS_LSTAR type ABAP_BOOL optional
      !USERDETAIL_INFO_BY_PERNR type ABAP_BOOL optional
      !I_ANY type ANY optional
      !I_ANY2 type ANY optional
      !I_ANY3 type ANY optional
      !IV_LANGU type ANY default SY-LANGU
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
      !CONV_EXIT type ABAP_BOOL default ABAP_FALSE
      !REFRESH_MEMORY type ABAP_BOOL default ABAP_FALSE
    returning
      value(R_RESULT) type STRING .
  class-methods GET_MSG
    importing
      !I_ANY type ANY optional
      !IV_ID type ANY optional
      !IV_NO type ANY optional
      !IV_TYPE type ANY optional
      !IV_V1 type ANY optional
      !IV_V2 type ANY optional
      !IV_V3 type ANY optional
      !IV_V4 type ANY optional
      !IV_LANGU type ANY default SY-LANGU
      !USE_T100_ONLY type ABAP_BOOL default ABAP_FALSE
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
    preferred parameter I_ANY
    returning
      value(R_RESULT) type BAPIRET2 .
  class-methods DO
    importing
      !FREE_SY type ABAP_BOOL optional
      !COMMIT_A_WAIT type ABAP_BOOL optional
      !ROLLBACK type ABAP_BOOL optional
      !SEND_EMAIL type ABAP_BOOL optional
      !SEND_IDOC type ABAP_BOOL optional
      !RAISE_EVENT type ABAP_BOOL optional
      !RFC_NEW_TASK type ABAP_BOOL optional
      !RFC_BACKGROUND_TASK type ABAP_BOOL optional
      !RFC_PARALLEL_TASK type ABAP_BOOL optional
      !AMC_SEND type ABAP_BOOL optional
      !HTTP_REQ_SET type ABAP_BOOL optional
      !HTTP_REQ_GET type ABAP_BOOL optional
      !REPORT_START type ABAP_BOOL optional
      !INIT type ABAP_BOOL optional
      !INIT_CUST type ABAP_BOOL optional
      !I_ANY type ANY optional
      !I_ANY2 type ANY optional
      !I_ANY3 type ANY optional
      !I_ANY5 type ANY optional
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
    exporting
      !E_ANY type ANY .
  class-methods INFO
    importing
      !IV_DEPTH type ANY optional
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
    exporting
      value(EV_DATE) type CLIKE
      value(EV_TIME) type CLIKE
      value(EV_TIMESTAMPL) type TIMESTAMPL
      value(EV_TIME_ISO8601) type CLIKE
      !EV_TIME_WRITE type STRING
      !EV_DATE_WRITE type STRING
      !EV_USERNAME type STRING
      !EV_IP_ADRESS type STRING
      !EV_IS_GUI_ACTIVE type ABAP_BOOL
      !EV_SY_MSGTEXT type STRING
      !ES_CALLSTACK type ABAP_CALLSTACK_LINE
      !ET_CALLSTACK type ABAP_CALLSTACK
      !EV_REPID type CLIKE
      !EV_METHOD type CLIKE
      !ET_DEQUEUE_TABLE type WLF_SEQG3_TAB
      !EV_WORK_PROCESS_ID type STRING
      !ET_SOURCE_CODE type STRINGTAB
      !EV_LOG_INFO type STRING
      !E_MOCK type ANY .
  class-methods CHECK
    importing
      !TAB_EQUAL type ABAP_BOOL optional
      !SYST type ABAP_BOOL optional
      !T100_ERROR type ABAP_BOOL optional
      !T100_MSG type ABAP_BOOL optional
      !VALUE_IN_STRUCT type ABAP_BOOL optional
      !IN_DOMRANGE type ABAP_BOOL optional
      !INITIAL type ABAP_BOOL optional
      !BOUND type ABAP_BOOL optional
      !TRUE type ABAP_BOOL optional
      !FALSE type ABAP_BOOL optional
      !ASSIGNED type ABAP_BOOL optional
      !RANGE_VALID type ABAP_BOOL optional
      !FIELD_EXIST type ABAP_BOOL optional
      !FUNCTION_EXIST type ABAP_BOOL optional
      !LOCK_IS_SET type ABAP_BOOL optional
      !CASTABLE type ABAP_BOOL optional
      !CONVERTIBLE type ABAP_BOOL optional
      !RTTI_TYPE_KIND_CSEQ type ABAP_BOOL optional
      !VALUE_IN_TAB type ABAP_BOOL optional
      !GUI_ACTIVE type ABAP_BOOL optional
      value(I_ANY) type ANY optional
      value(I_ANY2) type ANY optional
      value(I_ANY3) type ANY optional
      value(I_ANY4) type ANY optional
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
      !IV_DEPTH type ANY default 0
    returning
      value(R_RESULT) type ABAP_BOOL .
  class-methods LOCK
    importing
      !SET type ABAP_BOOL optional
      !FREE type ABAP_BOOL optional
      !SET_SNAP type ABAP_BOOL optional
      !IS_SET type ABAP_BOOL optional
      !A_COLLECT type ABAP_BOOL optional
      !SET_COLLECT type ABAP_BOOL optional
      !FREE_COLLECT type ABAP_BOOL optional
      !I_OBJECT type ANY optional
      !IV_MODE type ANY default 'E'
      !IV_SCOPE type ANY default '2'
      !IV_UNAME type ANY default SY-UNAME
      !I_ANY type ANY default SY-MANDT
      !I_ANY2 type ANY optional
      !I_ANY3 type ANY optional
      !I_ANY4 type ANY optional
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
    exporting
      !ET_SNAP type WLF_SEQG3_TAB
      !EV_IS_SET type ABAP_BOOL .
  class-methods ITAB
    importing
      !DELETE_DUPLICATES type ABAP_BOOL optional
      !CHANGE_SEQUENCE type ABAP_BOOL optional
      !MOVE_CORRESPONDING type ABAP_BOOL optional
      !MERGE type ABAP_BOOL optional
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
    changing
      !CT_TAB type STANDARD TABLE .
  class-methods RTTI
    importing
      !I_ANY type ANY optional
      !IV_NAME type ANY optional
      !I_FNAM_TYPE type ANY optional
      !I_FNAM_TAB type ANY optional
      !IV_LANGU type ANY default SY-LANGU
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
    preferred parameter I_ANY
    exporting
      !EV_KIND type STRING
      !EV_TYPE type STRING
      !EV_TYPE_IS_DDIC type ABAP_BOOL
      !EV_TYPE_KIND type STRING
      !EV_TYPE_KIND_IS_C type ABAP_BOOL
      !EV_LINE_KIND type STRING
      !EV_LINE_TYPE type STRING
      !EV_LINE_TYPE_KIND type STRING
      !EV_LINE_TYPE_KIND_IS_C type ABAP_BOOL
      !EV_LINE_TYPE_IS_DDIC type ABAP_BOOL
      !EV_REF_DYN type STRING
      !EV_REF_STAT type STRING
      !EV_REF_SUPER type STRING
      !ET_REF_SUPER type STRINGTAB
      !ET_COMP type ABAP_COMPONENT_TAB
      !ET_DOMRANGE type STANDARD TABLE
      !EV_CONVEXIT type CLIKE
      !EV_IN_DOMR type ABAP_BOOL
      !EV_FIELDNAME type CLIKE
      !EV_TYPEDESCR type CLIKE
      !EV_OUTPUTLEN type I
      !EV_LENGTH type I
      !EO_HANDLE type ref to CL_ABAP_DATADESCR .
  class-methods TRANS
    importing
      !ID type ABAP_BOOL optional
      !XML type ABAP_BOOL optional
      !JSON type ABAP_BOOL optional
      !PRINT type ABAP_BOOL optional
      !ZIP type ABAP_BOOL optional
      !UNZIP type ABAP_BOOL optional
      !TAB_2_TAB type ABAP_BOOL optional
      !XML_2 type ABAP_BOOL optional
      !JSON_2 type ABAP_BOOL optional
      !VALUE_2_RANGE type ABAP_BOOL optional
      !RANGETAB_2_WHERE type ABAP_BOOL optional
      !PARAMS_2_STRUCT type ABAP_BOOL optional
      !VALUE_2_RANGETAB type ABAP_BOOL optional
      !STRING_2_STRINGTAB type ABAP_BOOL optional
      !SPLIT_WORD type ABAP_BOOL optional
      !COPY type ABAP_BOOL optional
      value(I_ANY) type ANY optional
      value(I_ANY2) type ANY optional
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
    preferred parameter I_ANY
    exporting
      value(E_RESULT) type ANY .
  class-methods CONV
    importing
      value(I_ANY) type ANY
      !IV_UNIT_INPUT type ANY optional
      !IV_UNIT_RESULT type ANY optional
      !IV_ROUND_DECI type I optional
      !EXIT_IN type ABAP_BOOL default ABAP_FALSE
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
    exporting
      !R_RESULT type ANY .
  class-methods MSG
    importing
      value(I_ANY) type ANY optional
      value(IV_ID) type ANY optional
      value(IV_NO) type ANY optional
      value(IV_TYPE) type ANY optional
      value(IV_V1) type ANY optional
      value(IV_V2) type ANY optional
      value(IV_V3) type ANY optional
      value(IV_V4) type ANY optional
      !USE_T100_ONLY type ABAP_BOOL default ABAP_FALSE
      !IV_LANGU type ANY default SY-LANGU
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
    preferred parameter I_ANY
    exporting
      !EV_ID type CLIKE
      !EV_NO type ANY
      !EV_TYPE type CLIKE
      !EV_V1 type CLIKE
      !EV_V2 type CLIKE
      !EV_V3 type CLIKE
      !EV_V4 type CLIKE
      !EV_NOID type CLIKE
      !EV_TYNOID type CLIKE
      !E_ANY type ANY
      !E_ANY_ADD type ANY
      !ES_BAPI type BAPIRET2
      !ET_BAPI type BAPIRET2_TAB .
  class-methods DB_UPDATE
    importing
      !BAL type ABAP_BOOL optional
      !VARI type ABAP_BOOL optional
      !SO10 type ABAP_BOOL optional
      !BAL_INDX type ABAP_BOOL optional
      !ALL type ABAP_BOOL optional
      !GOS type ABAP_BOOL optional
      !I_ANY type ANY optional
      !I_KEY1 type ANY optional
      !I_KEY2 type ANY optional
      !I_KEY3 type ANY optional
      !I_KEY4 type ANY optional
      !COMMIT type ABAP_BOOL default ABAP_FALSE
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE .
  class-methods DB_READ
    importing
      !SO10 type ABAP_BOOL optional
      !BAL type ABAP_BOOL optional
      !VARI type ABAP_BOOL optional
      !ALL type ABAP_BOOL optional
      !GOS type ABAP_BOOL optional
      !GOS_HEAD type ABAP_BOOL optional
      !GOS_LIST type ABAP_BOOL optional
      !I_KEY1 type ANY optional
      !I_KEY2 type ANY optional
      !I_KEY3 type ANY optional
      !I_KEY4 type ANY optional
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
    exporting
      value(E_RESULT) type DATA .
  class-methods DB_DELETE
    importing
      !SO10 type ABAP_BOOL optional
      !BAL type ABAP_BOOL optional
      !VARI type ABAP_BOOL optional
      !ALL type ABAP_BOOL optional
      !GOS type ABAP_BOOL optional
      !GOS_HEAD type ABAP_BOOL optional
      !GOS_LIST type ABAP_BOOL optional
      !I_KEY1 type ANY optional
      !I_KEY2 type ANY optional
      !I_KEY3 type ANY optional
      !I_KEY4 type ANY optional
      !COMMIT type ABAP_BOOL optional
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE .
  class-methods RAISE
    importing
      value(I_ANY) type ANY optional
      value(I_HEAD) type ANY optional
      value(I_PREV) type ANY optional
      !I_CODE type ANY optional
      !I_SER_VALUE type ANY optional
      !I_SER_DATA type ANY optional
      !I_ADD_T100 type ANY optional
      !I_ADD_WRITE type ANY optional
      !IV_DEPTH type I default 0
      !RESUMABLE type ABAP_BOOL default ABAP_FALSE
    preferred parameter I_ANY
    returning
      value(R_RESULT) type ref to CX_NO_CHECK .
  class-methods RAISE_CHECK
    importing
      !READ_TABLE type ABAP_BOOL optional
      !SELECT type ABAP_BOOL optional
      !FUNCTION type ABAP_BOOL optional
      !METHOD type ABAP_BOOL optional
      !FOR_ALL_ENTRIES type ABAP_BOOL optional
      !NOT_INITIAL type ABAP_BOOL optional
      !SY_SUBRC type ABAP_BOOL optional
      !SY_MSGTY type ABAP_BOOL optional
      value(I_CHECK1) type ANY optional
      value(I_CHECK2) type ANY optional
      value(I_CHECK3) type ANY optional
      !IS_SY type SY default SY
      !I_FLAG type ANY optional
      !IV_SUBRC type ANY optional
      !I_VAL1 type ANY optional
      !I_VAL2 type ANY optional
      !I_VAL3 type ANY optional
      !I_VAL4 type ANY optional
      !I_CODE type ANY optional
      !I_SER_VALUE type ANY optional
      !I_SER_DATA type ANY optional
      !I_ADD_T100 type ANY optional
      !I_ADD_WRITE type ANY optional
      value(I_HEAD) type ANY optional
      value(I_PREV) type ANY optional
      !RESUMABLE type ANY default ABAP_FALSE
    returning
      value(R_RESULT) type ref to CX_ROOT .
  class-methods SCREEN
    importing
      !SELDATA_SET type ABAP_BOOL default ABAP_FALSE
      !SELDATA_SET_VARI type ABAP_BOOL default ABAP_FALSE
      !SELDATA_GET type ABAP_BOOL default ABAP_FALSE
      !TITLE_SET type ABAP_BOOL default ABAP_FALSE
      !STATUS_SET type ABAP_BOOL default ABAP_FALSE
      !ELEM_SET_BY_DIRTY type ABAP_BOOL default ABAP_FALSE
      !ELEM_SET_BY_VALUE type ABAP_BOOL default ABAP_FALSE
      !ELEM_GET_BY_VALUE type ABAP_BOOL default ABAP_FALSE
      !ELEM_ACTIVE type ABAP_BOOL default ABAP_FALSE
      !ELEM_INACTIVE type ABAP_BOOL default ABAP_FALSE
      !ELEM_INVISIBLE type ABAP_BOOL default ABAP_FALSE
      !I_ANY type ANY optional
      !I_ANY2 type ANY optional
      !IV_REPID type ANY optional
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
    exporting
      !E_RESULT type ANY .
  class-methods GUI
    importing
      !MESSAGE type ABAP_BOOL optional
      !POPUP_T100_SIMPLE type ABAP_BOOL optional
      !POPUP_T100 type ABAP_BOOL optional
      !POPUP_PRINT type ABAP_BOOL optional
      !POPUP_XML type ABAP_BOOL optional
      !POPUP_JSON type ABAP_BOOL optional
      !POPUP_JSON_DEEP type ABAP_BOOL optional
      !POPUP_TAB type ABAP_BOOL optional
      !POPUP_ERROR type ABAP_BOOL optional
      !POPUP_CUST type ABAP_BOOL optional
      !POPUP_BAL_TAB type ABAP_BOOL optional
      !START_BAL type ABAP_BOOL optional
      !START_TCODE type ABAP_BOOL optional
      !START_BROWSER type ABAP_BOOL optional
      !POPUP_ALV_VARI type ABAP_BOOL optional
      !POPUP_SEL_VARI type ABAP_BOOL optional
      !STATUS type ABAP_BOOL optional
      !STATUS_PROGRESS type ABAP_BOOL optional
      !POPUP_F4_HELP type ABAP_BOOL optional
      !POPUP_F4_HELP_TAB type ABAP_BOOL optional
      !POPUP_INFO type ABAP_BOOL optional
      !POPUP_GET_VALUE type ABAP_BOOL optional
      !POPUP_CONFIRM type ABAP_BOOL optional
      !POPUP_RANGE type ABAP_BOOL optional
      !POPUP_CHOOSE type ABAP_BOOL optional
      !CALL_VIEW type ABAP_BOOL optional
      !FILE_DOWNLOAD type ABAP_BOOL optional
      !FILE_UPLOAD type ABAP_BOOL optional
      !I_ANY type ANY optional
      !I_ANY2 type ANY optional
      !I_ANY3 type ANY optional
      !I_ANY4 type ANY optional
      !I_ANY5 type ANY optional
      !I_ANY6 type ANY optional
      !IV_TYPE type ANY optional
      !IV_TITLE type ANY optional
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
    preferred parameter I_ANY
    exporting
      !E_ANY type ANY
      !EV_ANSWER type STRING .
  class-methods POPUP
    importing
      !IT_TABLE type STANDARD TABLE
      !IV_TITLE type CLIKE default SY-TITLE
      !IV_VERTICAL_LINES type ABAP_BOOL default ABAP_TRUE
      !IV_HEADERS_VISIBLE type ABAP_BOOL default ABAP_TRUE
      !IV_RAISE_DOUBLE_CLICK type ABAP_BOOL default ABAP_TRUE
      !IV_DEFAULT_TOOLBAR type ABAP_BOOL default ABAP_FALSE
      !IT_ICON type STRINGTAB optional
      !IT_RAISE_HOTSPOT type STRINGTAB optional
      !IT_OUTLEN type NAME2STRINGVALUE_TABLE optional
      !IT_TITLE type NAME2STRINGVALUE_TABLE optional
      !IT_SORT type STRINGTAB optional
      !IT_HIDE type STRINGTAB optional
      !IV_OPTIMIZE_COLWIDTH type ABAP_BOOL default ABAP_FALSE
      !IS_LAYOUT type DISVARIANT optional
      !IV_LAYOUT_RESTRICTION type ANY optional
      !IV_COL_START type ANY default '10'
      !IV_COL_END type ANY default '160'
      !IV_LINE_START type ANY default '1'
      !IV_LINE_END type ANY default '25'
      !IV_SEL type ANY optional
      !IV_SEL_COL type ANY optional
    exporting
      !EV_EVENT_TYPE type STRING
      !EV_EVENT_ROW type I
      !EV_EVENT_COL type STRING
      !EV_EVENT_VALUE type STRING
      !ET_SELECTION type SALV_T_ROW
      !ER_LINE type ref to DATA
      !EV_UCOMM type STRING .
  class-methods CX_INFO
    importing
      !IX_ROOT type ref to CX_ROOT
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
    exporting
      !EV_CODE type STRING
      !ET_ADD_T100 type BAPIRET2_TAB
      !EV_GUID type STRING
      !ET_SOURCE type STRINGTAB
      !ET_CALLSTACK type ABAP_CALLSTACK
      !EV_VAL_PRINT type STRING
      !ES_BAPIRET type BAPIRET2
      !E_ADD_SERIAL type STRING .
  methods LOG
    importing
      value(I_ANY) type ANY optional
      value(IV_ID) type ANY optional
      value(IV_NO) type ANY optional
      value(IV_TYPE) type ANY optional
      value(IV_V1) type ANY optional
      value(IV_V2) type ANY optional
      value(IV_V3) type ANY optional
      value(IV_V4) type ANY optional
      !USE_T100_ONLY type ABAP_BOOL default ABAP_FALSE
      !IV_LANGU type ANY default SY-LANGU
      !RAISE_ERROR type ABAP_BOOL default ABAP_FALSE
    preferred parameter I_ANY
    returning
      value(R_RESULT) type TY-O_EASY_ABAP .
  class-methods JSON
    importing
      !JSON_2 type ABAP_BOOL default ABAP_FALSE
      !I_ANY type ANY optional
      !I_ANY2 type ANY optional
      !I_ANY3 type ANY optional
      !I_ANY4 type ANY optional
      !I_ANY5 type ANY optional
      !IT_R_DATA type TY-T_REF_DATA optional
      !IT_R_OBJECT type TY-T_REF_OBJ optional
    exporting
      !E_ANY1 type ANY
      !E_ANY2 type ANY
      !E_ANY3 type ANY
      !E_ANY4 type ANY
      !E_ANY5 type ANY
      !E_REF1 type ANY
      !E_TYPE1 type ANY
      !E_KIND1 type ANY
      !E_REF2 type ANY
      !E_TYPE2 type ANY
      !E_KIND2 type ANY
      !E_REF3 type ANY
      !E_TYPE3 type ANY
      !E_KIND3 type ANY
      !E_REF4 type ANY
      !E_TYPE4 type ANY
      !E_KIND4 type ANY
      !E_REF5 type ANY
      !E_TYPE5 type ANY
      !E_KIND5 type ANY
      !ET_R_DATA type TY-T_REF_DATA
      !ET_R_OBJECT type TY-T_REF_OBJ .
ENDCLASS.



CLASS ZCL_easy_abap IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>CFW
* +-------------------------------------------------------------------------------------------------+
* | [--->] GET_FCAT                       TYPE        ABAP_BOOL(optional)
* | [--->] I_ANY                          TYPE        ANY(optional)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<---] E_ANY                          TYPE        ANY
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD cfw.

try.

    case abaP_true.

        when get_fcat.

            data lt_fcat type lvc_t_fcat.

          lt_fcat = lcl_help=>cfw_get_fcat( it_table = i_any  ).
          e_any = lt_fcat.




endcase.



        DATA lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error( ix_root = lx_root raise_error = raise_error ).
    ENDTRY.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>CHECK
* +-------------------------------------------------------------------------------------------------+
* | [--->] TAB_EQUAL                      TYPE        ABAP_BOOL(optional)
* | [--->] SYST                           TYPE        ABAP_BOOL(optional)
* | [--->] T100_ERROR                     TYPE        ABAP_BOOL(optional)
* | [--->] T100_MSG                       TYPE        ABAP_BOOL(optional)
* | [--->] VALUE_IN_STRUCT                TYPE        ABAP_BOOL(optional)
* | [--->] IN_DOMRANGE                    TYPE        ABAP_BOOL(optional)
* | [--->] INITIAL                        TYPE        ABAP_BOOL(optional)
* | [--->] BOUND                          TYPE        ABAP_BOOL(optional)
* | [--->] TRUE                           TYPE        ABAP_BOOL(optional)
* | [--->] FALSE                          TYPE        ABAP_BOOL(optional)
* | [--->] ASSIGNED                       TYPE        ABAP_BOOL(optional)
* | [--->] RANGE_VALID                    TYPE        ABAP_BOOL(optional)
* | [--->] FIELD_EXIST                    TYPE        ABAP_BOOL(optional)
* | [--->] FUNCTION_EXIST                 TYPE        ABAP_BOOL(optional)
* | [--->] LOCK_IS_SET                    TYPE        ABAP_BOOL(optional)
* | [--->] CASTABLE                       TYPE        ABAP_BOOL(optional)
* | [--->] CONVERTIBLE                    TYPE        ABAP_BOOL(optional)
* | [--->] RTTI_TYPE_KIND_CSEQ            TYPE        ABAP_BOOL(optional)
* | [--->] VALUE_IN_TAB                   TYPE        ABAP_BOOL(optional)
* | [--->] GUI_ACTIVE                     TYPE        ABAP_BOOL(optional)
* | [--->] I_ANY                          TYPE        ANY(optional)
* | [--->] I_ANY2                         TYPE        ANY(optional)
* | [--->] I_ANY3                         TYPE        ANY(optional)
* | [--->] I_ANY4                         TYPE        ANY(optional)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] IV_DEPTH                       TYPE        ANY (default =0)
* | [<-()] R_RESULT                       TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD check.

    "Sammlung diverser Checks
    "Bsp Message Type, Werte in Range, Tabellen gleich usw
    TRY.
        CASE abap_true.

          WHEN in_domrange.

            r_result = lcl_help=>rtts_is_in_domrange( iv_any = i_any ).


          WHEN tab_equal.

            DATA(lv_tab1_json) = get( json = 'X' i_any = i_any ).
            DATA(lv_tab2_json) = get( json = 'X' i_any = i_any2 ).
            IF lv_tab1_json = lv_tab2_json.
              r_result = abap_true.
            ELSE.
              r_result = abap_false.
            ENDIF.


          WHEN range_valid.

            r_result = lcl_help=>is_range_valid( i_any = i_any ).


          WHEN gui_active.

            info( IMPORTING ev_is_gui_active = r_result ).


          WHEN rtti_type_kind_cseq.

            rtti( EXPORTING i_any = i_any
                  IMPORTING ev_type_kind_is_c = r_result  ).


          WHEN value_in_tab.

            FIELD-SYMBOLS:  <lt_table> TYPE STANDARD TABLE.
            FIELD-SYMBOLS:   <l_any>    TYPE any.
            FIELD-SYMBOLS:  <l_value>  TYPE any.

            "prÃ¼ft ob der wert i_any3
            "in der tabelle i_any mit Spalte i_any2 vorhanden ist

            ASSIGN i_any TO <lt_table>.
            LOOP AT <lt_table> ASSIGNING <l_any>.
              IF i_any2 = 'TABLE_LINE'.
                ASSIGN <l_any> TO <l_value>.
              ELSE.
                ASSIGN COMPONENT i_any2 OF STRUCTURE <l_any> TO <l_value>.
              ENDIF.
              IF <l_value> = i_any3.
                r_result = abap_true.
                RETURN.
              ENDIF.
            ENDLOOP.

          WHEN syst.

            DATA ls_sy TYPE sy.
            ls_sy = i_any.
            IF ls_sy-subrc <> 0 OR ls_sy-msgty = 'E'.
              r_result = abap_false.
            ELSE.
              r_result = abap_true.
            ENDIF.

          WHEN t100_msg.

            DATA lv_id_check TYPE string.

            msg(
              EXPORTING
                i_any         = i_any
                use_t100_only = abap_true
              IMPORTING
                ev_id         = lv_id_check ).
            IF lv_id_check IS INITIAL.
              r_result = abap_false.
            ELSE.
              r_result = abap_true.
            ENDIF.

          WHEN convertible.

            IF get( rtti_kind = 'X' i_any = i_any ) = get( rtti_kind = 'X' i_any = i_any2 ).
              r_result = abap_true.
            ENDIF.


          WHEN castable.

            "PrÃ¼ft ob Referenz i_any2 auf Referenz vom Typ mit Namen i_any gecastet werden kannn
            rtti(
              EXPORTING
                i_any                = i_any
              IMPORTING
                ev_type              = DATA(lv_classname_any1)
                ev_type_kind_is_c    = DATA(lv_is_c)
                et_ref_super         = DATA(lt_ref_super_any1) ).

            IF lt_ref_super_any1 IS INITIAL AND lv_is_c = abap_true.
              rtti( EXPORTING iv_name = i_any
                   IMPORTING ev_type = lv_classname_any1 et_ref_super = lt_ref_super_any1 ).

            ELSEIF lt_ref_super_any1 IS INITIAL.
              raise('WRONG_TYPE_OF_INPUT').
            ENDIF.

            rtti(
              EXPORTING
                i_any                = i_any2
              IMPORTING
              ev_type   = DATA(lv_classname_any2)
                ev_type_kind_is_c    = lv_is_c
                et_ref_super         = DATA(lt_ref_super_any2) ).

            IF lt_ref_super_any2 IS INITIAL AND lv_is_c = abap_true.
              rtti( EXPORTING iv_name = i_any2
                    IMPORTING et_ref_super = lt_ref_super_any2 ).
            ELSEIF lt_ref_super_any2 IS INITIAL.
              raise('WRONG_TYPE_OF_INPUT').
            ENDIF.

            r_result = check( value_in_tab = 'X' i_any = lt_ref_super_any2
                              i_any2 = 'TABLE_LINE' i_any3 = lv_classname_any1 ).


          WHEN t100_error.

            DATA: lv_type TYPE string.

            msg(
              EXPORTING
                i_any           = i_any
                use_t100_only = abap_true
              IMPORTING
                ev_type   = lv_type ).

            IF lv_type = 'E' OR lv_type = 'A'.
              r_result = abap_true.
            ELSE.
              r_result = abap_false.
            ENDIF.

            RETURN.


          WHEN value_in_struct.


            DO.
              ASSIGN COMPONENT sy-index OF STRUCTURE i_any2
                  TO <l_any>.
              IF sy-subrc <> 0.
                EXIT.
              ENDIF.

              IF <l_any> = i_any.
                r_result = abap_true.
                EXIT.
              ENDIF.
            ENDDO.

            RETURN.

          WHEN function_exist.

            DATA funcname  TYPE rs38l_fnam .
            funcname = i_any.

            CALL FUNCTION 'FUNCTION_EXISTS'
              EXPORTING
                funcname           = funcname    " Name des Funktionsbausteins
*           importing
*               group              =     " Name der Funktionsgruppe
*               include            =     " Name des Includes
*               namespace          =     " Namensraum
*               str_area           =     " Name der Funktionsgruppe ohne Namensraum
              EXCEPTIONS
                function_not_exist = 1
                OTHERS             = 2.
            IF sy-subrc <> 0.
              r_result = abap_false.
            ELSE.
              r_result = abap_true.
            ENDIF.

          WHEN lock_is_set. " = abap_true.

            lock(
              EXPORTING is_set = 'X'
                i_any        = i_any
                i_any2       = i_any2
                i_any3       = i_any3
                i_any4       = i_any4
                raise_error  = abap_true
              IMPORTING
                ev_is_set    = r_result ).

          WHEN OTHERS.
            raise('WRONG_CALL_OF_METHOD').
        ENDCASE.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>CONV
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ANY                          TYPE        ANY
* | [--->] IV_UNIT_INPUT                  TYPE        ANY(optional)
* | [--->] IV_UNIT_RESULT                 TYPE        ANY(optional)
* | [--->] IV_ROUND_DECI                  TYPE        I(optional)
* | [--->] EXIT_IN                        TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<---] R_RESULT                       TYPE        ANY
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD conv.

    "Durchführen von Konvertierungen
    "Bsp Char->INT, Rundungen, Sprachabkürzungen usw
    TRY.
        FREE r_result.

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Typen bestimmen

        DATA:
          lv_type_in       TYPE string,
          lv_type_out      TYPE string,
          lv_type_kind_in  TYPE string,
          lv_type_kind_out TYPE string.

        rtti(
          EXPORTING
            i_any         = i_any
          IMPORTING
            ev_type       = lv_type_in
            ev_type_kind  = lv_type_kind_in ).

        rtti(
          EXPORTING
            i_any         = r_result
          IMPORTING
            ev_type       = lv_type_out
            ev_type_kind  = lv_type_kind_out ).


        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Sonderbehandlungen / Rundung

        IF  iv_unit_input IS SUPPLIED AND iv_unit_result IS SUPPLIED
            AND iv_unit_input <> iv_unit_result.

          DATA lv_p_16 TYPE p LENGTH 16 DECIMALS 6.

          lcl_help=>conv_unit( EXPORTING i_any = i_any
                  i_unit_in = iv_unit_input   i_unit_out = iv_unit_result
                  IMPORTING
                      e_result = lv_p_16 ).

          IF iv_round_deci IS SUPPLIED.
            conv(
              EXPORTING
                i_any          = lv_p_16
                iv_round_deci  = iv_round_deci
                raise_error    = raise_error
              IMPORTING
                r_result       = r_result ).

          ELSE.

            conv(
        EXPORTING
          i_any          = lv_p_16
*              iv_round_deci  = iv_round_deci
          raise_error    = raise_error
        IMPORTING
          r_result       = r_result ).

          ENDIF.

          RETURN.

        ENDIF.


        IF iv_round_deci IS SUPPLIED.

          lcl_help=>round2( EXPORTING i_any = i_any iv_decimals = iv_round_deci
                                 IMPORTING e_result = r_result ).

          RETURN.

        ENDIF.


        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " spezielle Konvertierungen

        IF lv_type_in = 'LANGU' OR lv_type_in = 'SPRAS' OR lv_type_in = 'SYST_LANGU'
        AND lv_type_out = 'LAISO'.

          CALL FUNCTION 'CONVERT_SAP_LANG_TO_ISO_LANG'
            EXPORTING
              input            = i_any
            IMPORTING
              output           = r_result
            EXCEPTIONS
              unknown_language = 1
              error_message    = 2
              OTHERS           = 3.
          IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
          raise_check( function = 'X' ).

          RETURN.
        ENDIF.


        IF lv_type_in = 'LAISO'
        AND lv_type_out = 'LANGU' OR lv_type_out = 'SPRAS' OR lv_type_out = 'SYST_LANGU'.

          CALL FUNCTION 'CONVERSION_EXIT_ISOLA_INPUT'
            EXPORTING
              input            = i_any
            IMPORTING
              output           = r_result
            EXCEPTIONS
              unknown_language = 1
              error_message    = 2
              OTHERS           = 3.
          IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
          raise_check( function = 'X' ).

          RETURN.
        ENDIF.


        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Generelle Konvertierungen

        DATA lv_c_500 TYPE c LENGTH 500.

        CASE lv_type_kind_out.

          WHEN cl_abap_typedescr=>typekind_packed.

            CASE lv_type_kind_in.

              WHEN cl_abap_typedescr=>typekind_int
                OR cl_abap_typedescr=>typekind_int1
                OR cl_abap_typedescr=>typekind_int2
                OR cl_abap_typedescr=>typekind_packed.

                r_result = i_any.


              WHEN cl_abap_typedescr=>typekind_string.

*              data lv_c type c length 500.
                FREE lv_c_500.
                lv_c_500 = get( trim = 'X' i_any = i_any ).

                conv( EXPORTING i_any    = lv_c_500
                      IMPORTING r_result = r_result ).

                RETURN.

              WHEN cl_abap_typedescr=>typekind_char

               OR cl_abap_typedescr=>typekind_num.
**
*                REPLACE ALL OCCURRENCES OF ',' IN i_any WITH '.'.


                CALL FUNCTION 'MOVE_CHAR_TO_NUM'
                  EXPORTING
                    chr             = i_any
                  IMPORTING
                    num             = r_result
                  EXCEPTIONS
                    convt_no_number = 1
                    convt_overflow  = 2
                    OTHERS          = 3.
                IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
                raise_check( function = 'X' ).

*                CALL FUNCTION 'CHAR_PACK_CONVERSION'
*                  EXPORTING
*                    input     = i_any
*                  IMPORTING
*                    decstring = r_result.

            ENDCASE.



          WHEN cl_abap_typedescr=>typekind_int
          OR cl_abap_typedescr=>typekind_int1
          OR cl_abap_typedescr=>typekind_int2.

            CASE lv_type_kind_in.

              WHEN cl_abap_typedescr=>typekind_packed
              OR cl_abap_typedescr=>typekind_int
            OR cl_abap_typedescr=>typekind_int1
            OR cl_abap_typedescr=>typekind_int2.

                r_result = i_any.

              WHEN cl_abap_typedescr=>typekind_char
             OR cl_abap_typedescr=>typekind_string
             OR cl_abap_typedescr=>typekind_num.

                DATA lv_n TYPE p LENGTH 16 DECIMALS 0.

                CALL FUNCTION 'MOVE_CHAR_TO_NUM'
                  EXPORTING
                    chr             = i_any
                  IMPORTING
                    num             = lv_n
                  EXCEPTIONS
                    convt_no_number = 1
                    convt_overflow  = 2
                    OTHERS          = 3.
                IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
                raise_check( function = 'X' ).

                r_result = lv_n.

            ENDCASE.



          WHEN cl_abap_typedescr=>typekind_char
          OR cl_abap_typedescr=>typekind_string
          OR cl_abap_typedescr=>typekind_num.


            WRITE i_any TO lv_c_500.
            r_result = get( trim = 'X' i_any = lv_c_500 ).


        ENDCASE.


*
*        CASE lv_type_out.
*
*          WHEN 'TIME'.
**          and .
*
*          WHEN 'SYST_TIME'.
*
*          WHEN 'SA_ERFMG'.
*
*            CASE lv_type_in.
*
*              WHEN 'TVARV_VAL'.
*                SHIFT i_any LEFT DELETING LEADING ' '.
*                REPLACE ',' IN i_any WITH '.'.
*                r_result = i_any.
*
*            ENDCASE.
*
*
**          WHEN cl_abap_typedescr=>typekind_char
**          OR cl_abap_typedescr=>typekind_string
**          OR cl_abap_typedescr=>typekind_num.
*
**            CALL FUNCTION 'MOVE_CHAR_TO_NUM'
**              EXPORTING
**                chr             = i_any
**              IMPORTING
**                num             = r_result
**              EXCEPTIONS
**                convt_no_number = 1
**                convt_overflow  = 2
**                OTHERS          = 3.
**            raise_check( function = 'X' ).
*
*          WHEN OTHERS.

*          WHEN 'D'.
*
*            DATA lv_string TYPE string.
*            lv_string = i_any.
*
*            IF exit_in = abap_true.
*
*              CALL FUNCTION 'CONVERT_DATE_TO_INTERNAL'
*                EXPORTING
*                  date_external            = lv_string      " external date formatting
**                 accept_initial_date      = accept_initial_date " Single-Character Indicator
*                IMPORTING
*                  date_internal            = lv_string       " internal date formatting
*                EXCEPTIONS
*                  date_external_is_invalid = 1                   " the external date is invalid (not plausible)
*                  error_message            = 2
*                  OTHERS                   = 3.
*
*            ENDIF.

*            r_result = lv_string.
*            RETURN.

**          WHEN OTHERS.
*            IF r_result IS INITIAL.
*              r_result = i_any.
*            ENDIF.
**        ENDCASE.
*        ENDCASE.

        IF exit_in = abap_true.
          r_result = get( conv_in = 'X' i_any = r_result ).
        ENDIF.


        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        DATA lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error( ix_root = lx_root raise_error = raise_error ).
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>CX_INFO
* +-------------------------------------------------------------------------------------------------+
* | [--->] IX_ROOT                        TYPE REF TO CX_ROOT
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<---] EV_CODE                        TYPE        STRING
* | [<---] ET_ADD_T100                    TYPE        BAPIRET2_TAB
* | [<---] EV_GUID                        TYPE        STRING
* | [<---] ET_SOURCE                      TYPE        STRINGTAB
* | [<---] ET_CALLSTACK                   TYPE        ABAP_CALLSTACK
* | [<---] EV_VAL_PRINT                   TYPE        STRING
* | [<---] ES_BAPIRET                     TYPE        BAPIRET2
* | [<---] E_ADD_SERIAL                   TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD cx_info.

    DATA:
      lx_no    TYPE REF TO lcx_no_check,
      lr_data  TYPE REF TO data,
      lv_value TYPE string,
      lv_descr TYPE string.
    DATA: lx_root TYPE REF TO cx_root.
    FIELD-SYMBOLS:
    <lv_value> TYPE any.

    "Infos aus Exception auslesen
    "Bsp Nachricht, Logs, Callstack usw
    TRY.
        lx_no ?= ix_root.

        et_add_t100 = lx_no->ms_data-add_t100.
        ev_guid     = lx_no->ms_data-guid.
        et_source   = lx_no->ms_data-t_source_code.
        ev_code     = lx_no->ms_data-code.
        es_bapiret  = lx_no->ms_data-s_bapiret.
        et_callstack = lx_no->ms_data-t_callstack.
        e_add_serial = lx_no->ms_data-add_serial.
        ev_val_print = ' '.


        IF lx_no->ms_data-serial_value IS NOT INITIAL.

          json(
            EXPORTING
              json_2      = abap_true
              i_any      = lx_no->ms_data-serial_value
            IMPORTING
              e_ref1      = lr_data
          ).

          IF lr_data IS BOUND.

            ASSIGN lr_data->* TO <lv_value>.
            trans( EXPORTING print = 'X' i_any = <lv_value> IMPORTING e_result = lv_value ).
            rtti( EXPORTING i_any = <lv_value> IMPORTING ev_typedescr = lv_descr ).
            CONCATENATE ev_val_print  lv_descr ' = '  lv_value '  |  ' INTO ev_val_print RESPECTING BLANKS.

          ENDIF.

          FREE lr_data.
          json(
            EXPORTING
              json_2      = abap_true
              i_any      = lx_no->ms_data-serial_value
            IMPORTING
              e_ref2      = lr_data
          ).

          IF lr_data IS BOUND.

            ASSIGN lr_data->* TO <lv_value>.
            trans( EXPORTING print = 'X' i_any = <lv_value> IMPORTING e_result = lv_value ).
            rtti( EXPORTING i_any = <lv_value> IMPORTING ev_typedescr = lv_descr ).
            CONCATENATE ev_val_print  lv_descr ' = '  lv_value '  |  ' INTO ev_val_print RESPECTING BLANKS.

          ENDIF.

          FREE lr_data.
          json(
            EXPORTING
              json_2      = abap_true
              i_any      = lx_no->ms_data-serial_value
            IMPORTING
              e_ref3      = lr_data
          ).

          IF lr_data IS BOUND.

            ASSIGN lr_data->* TO <lv_value>.
            trans( EXPORTING print = 'X' i_any = <lv_value> IMPORTING e_result = lv_value ).
            rtti( EXPORTING i_any = <lv_value> IMPORTING ev_typedescr = lv_descr ).
            CONCATENATE ev_val_print  lv_descr ' = '  lv_value '  |  ' INTO ev_val_print RESPECTING BLANKS.

          ENDIF.

          FREE lr_data.
          json(
            EXPORTING
              json_2      = abap_true
              i_any      = lx_no->ms_data-serial_value
            IMPORTING
              e_ref4      = lr_data
          ).

          IF lr_data IS BOUND.

            ASSIGN lr_data->* TO <lv_value>.
            trans( EXPORTING print = 'X' i_any = <lv_value> IMPORTING e_result = lv_value ).
            rtti( EXPORTING i_any = <lv_value> IMPORTING ev_typedescr = lv_descr ).
            CONCATENATE ev_val_print  lv_descr ' = '  lv_value '  |  ' INTO ev_val_print RESPECTING BLANKS.

          ENDIF.


          SHIFT ev_val_print RIGHT DELETING TRAILING ' '.
          SHIFT ev_val_print RIGHT DELETING TRAILING '|'.
          SHIFT ev_val_print LEFT DELETING LEADING ' '.

        ENDIF.

        RETURN.

      CATCH cx_root INTO lx_root.
*        lcl_local_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    ENDTRY.



    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " OData Exception

    DATA lx_odata TYPE REF TO /iwbep/cx_mgw_base_exception.

    TRY.

        lx_odata ?= ix_root.

        msg( EXPORTING i_any  = lx_odata->message_container
              IMPORTING e_any = et_add_t100 ) .


      CATCH cx_root INTO lx_root.
*        lcl_local_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>DB_DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] SO10                           TYPE        ABAP_BOOL(optional)
* | [--->] BAL                            TYPE        ABAP_BOOL(optional)
* | [--->] VARI                           TYPE        ABAP_BOOL(optional)
* | [--->] ALL                            TYPE        ABAP_BOOL(optional)
* | [--->] GOS                            TYPE        ABAP_BOOL(optional)
* | [--->] GOS_HEAD                       TYPE        ABAP_BOOL(optional)
* | [--->] GOS_LIST                       TYPE        ABAP_BOOL(optional)
* | [--->] I_KEY1                         TYPE        ANY(optional)
* | [--->] I_KEY2                         TYPE        ANY(optional)
* | [--->] I_KEY3                         TYPE        ANY(optional)
* | [--->] I_KEY4                         TYPE        ANY(optional)
* | [--->] COMMIT                         TYPE        ABAP_BOOL(optional)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD db_delete.

    "Löschen von DB Eintraegen von verschiedenen Services
    "Business Log, GOS Objekte, SO10 Texte, Vari Tab usw
    TRY.
        CASE abap_true.

          WHEN all.
            "Generisches Lesen von Daten aus DB

            db_delete(
                 vari = 'X'
                 raise_error = 'X'
                 i_key1 = i_key1
                 i_key2 = i_key2
                 i_key3 = i_key3
                        ).


          WHEN vari.
            "VARI Tabelle für Selektionsvarianten
            "generische Ablage für unstrukturierte Daten

            DATA lv_key TYPE c LENGTH 54.
            DATA lv_string TYPE string.

            lv_string = get( trim = 'X' i_any = i_key1 ) &&
                        get( trim = 'X' i_any = i_key2 ) &&
                        get( trim = 'X' i_any = i_key3 ).
            lv_key(54) = lv_string.

            do( free_sy = 'X').
            DELETE FROM DATABASE vari(z1) CLIENT sy-mandt ID lv_key.
            IF sy-subrc = 4.
              raise( i_head = 'ZCX_DELETE_VARI_DATABASE_ERROR'
                    i_any = get_msg( i_any = 'ZCX_NO_ENTRY_WITH_KEY_&1_FOUND' iv_v1 = lv_key ) ).
            ELSE.
              raise_check( sy_subrc = 'X' i_head = 'ZCX_DELETE_VARI_DATABASE_ERROR' ).
            ENDIF.

        ENDCASE.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " DB Commit

        IF commit = 'X'.
          do( commit_a_wait = 'X' ).
        ENDIF.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>DB_READ
* +-------------------------------------------------------------------------------------------------+
* | [--->] SO10                           TYPE        ABAP_BOOL(optional)
* | [--->] BAL                            TYPE        ABAP_BOOL(optional)
* | [--->] VARI                           TYPE        ABAP_BOOL(optional)
* | [--->] ALL                            TYPE        ABAP_BOOL(optional)
* | [--->] GOS                            TYPE        ABAP_BOOL(optional)
* | [--->] GOS_HEAD                       TYPE        ABAP_BOOL(optional)
* | [--->] GOS_LIST                       TYPE        ABAP_BOOL(optional)
* | [--->] I_KEY1                         TYPE        ANY(optional)
* | [--->] I_KEY2                         TYPE        ANY(optional)
* | [--->] I_KEY3                         TYPE        ANY(optional)
* | [--->] I_KEY4                         TYPE        ANY(optional)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<---] E_RESULT                       TYPE        DATA
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD db_read.

    "Lesen der Datenbank ueber verschiedene Services
    "Business Log, GOS Objekte, SO10 Texte, Vari Tab usw
    TRY.
        CASE abap_true.

          WHEN all.
            "Generisches Lesen von Daten aus DB

            DATA lv_data TYPE string.

            db_read( EXPORTING vari = 'X' raise_error = 'X' i_key1 = i_key1 i_key2 = i_key2 i_key3 = i_key3
                     IMPORTING e_result = lv_data ).

            "Daten von flache Form in Zieltyp
            trans( EXPORTING json_2 = 'X' unzip = 'X' i_any = lv_data
                   IMPORTING e_result = e_result  ).


          WHEN gos_head.
            "Generic Object Services - GOS
            "read head infos for a specific document

            DATA ls_link TYPE obl_s_link.
            DATA ls_gos_head_result TYPE sofolenti1 .

            ls_link-instid_b = i_key1. "FOL27000000000004EXT44000000000100
            ls_gos_head_result = lcl_help=>gos_read_object_head( ls_link  ).
            e_result = ls_gos_head_result.


          WHEN gos.
            "Generic Object Services - GOS
            "read a specific document Content

            DATA lv_gos_result TYPE xstring.

            ls_link-instid_b = i_key1. "FOL27000000000004EXT44000000000100
            lv_gos_result    = lcl_help=>gos_read_object_content( ls_link ).
            e_result         = lv_gos_result.


          WHEN gos_list.
            "Generic Object Services - GOS
            "get list of all docuemts

            DATA lv_instid TYPE  sibflporb-instid.
            DATA lv_typeid TYPE sibflporb-typeid.
            DATA lv_catid TYPE sibflporb-catid.
            DATA lt_gos_list_result TYPE obl_t_link.

            lv_instid = i_key1. " '0010270682'
            lv_typeid = i_key2. " 'BUS2105'
            lv_catid  = i_key3. " 'BO'

            lt_gos_list_result =  lcl_help=>gos_read_object_list(
                                     iv_instid      = lv_instid
                                     iv_typeid      = lv_typeid
                                     iv_catid       = lv_catid  ).

            e_result = lt_gos_list_result.


          WHEN vari.
            "VARI Tabelle für Selektionsvarianten
            "generische Ablage für unstrukturierte Daten

            DATA lv_key TYPE c LENGTH 54.
            DATA lv_string TYPE string.

            lv_string = get( trim = 'X' i_any = i_key1 ) &&
                        get( trim = 'X' i_any = i_key2 ) &&
                        get( trim = 'X' i_any = i_key3 ).
            lv_key(54) = lv_string.

            do( free_sy = 'X').
            IMPORT data = lv_data FROM DATABASE vari(z1) CLIENT sy-mandt ID lv_key.
            raise_check( sy_subrc = 'X' i_head = 'ZCX_READ_DATABASE_VARI_ERROR' ).

            IF check( convertible = 'X' i_any = e_result i_any2 = lv_data ) = abap_true.
              e_result = lv_data.
            ELSE.
              raise('ZCX_WRONG_TYPE_OF_OUTPUT').
            ENDIF.


          WHEN so10.
            "SO10 Texte
            "read a specific text

            DATA lv_object TYPE thead-tdobject.
            DATA lv_name   TYPE thead-tdname.
            DATA lv_id     TYPE thead-tdid.
            DATA lv_langu  TYPE thead-tdspras.
            DATA lt_so10_result TYPE stringtab.

            lv_object = i_key1. " 'VBBK'
            lv_id     = i_key2. " '0002' Type
            lv_name   = i_key3. " '0030000000' Auftrag
            lv_langu  = i_key4. " 'E'

            lcl_help=>so10_read(
            EXPORTING
                i_key1   = lv_object
                i_key2   = lv_id
                i_key3   = lv_name
                i_key4   = lv_langu
            IMPORTING
              e_result = lt_so10_result ).

            e_result = lt_so10_result.


          WHEN bal.
            "Business Application Log - BAL
            "read a specific log

            lcl_help=>bal_read(
              EXPORTING
                iv_object    = i_key1
                iv_subobject = i_key2
                iv_extnumber = i_key3
              RECEIVING
                rt_balmt     = DATA(lt_balmt) ).

            IF 'BALM_T' = get(  rtti_type = 'X' i_any = e_result ).
              e_result = lt_balmt.
            ELSE.
              msg( EXPORTING i_any = lt_balmt
                   IMPORTING e_any = e_result ).
              itab( EXPORTING change_sequence = 'X'
                    CHANGING  ct_tab          = e_result  ).
            ENDIF.


          WHEN OTHERS.
            raise('ZCX_WRONG_CALL_OF_METHOD').
        ENDCASE.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>DB_UPDATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] BAL                            TYPE        ABAP_BOOL(optional)
* | [--->] VARI                           TYPE        ABAP_BOOL(optional)
* | [--->] SO10                           TYPE        ABAP_BOOL(optional)
* | [--->] BAL_INDX                       TYPE        ABAP_BOOL(optional)
* | [--->] ALL                            TYPE        ABAP_BOOL(optional)
* | [--->] GOS                            TYPE        ABAP_BOOL(optional)
* | [--->] I_ANY                          TYPE        ANY(optional)
* | [--->] I_KEY1                         TYPE        ANY(optional)
* | [--->] I_KEY2                         TYPE        ANY(optional)
* | [--->] I_KEY3                         TYPE        ANY(optional)
* | [--->] I_KEY4                         TYPE        ANY(optional)
* | [--->] COMMIT                         TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD db_update.

    "Schreiben der Datenbank ueber verschiedene Services
    "Business Log, GOS Objekte, SO10 Texte, Vari Tab usw
    TRY.
        CASE abap_true.

          WHEN all.

            DATA lv_data TYPE string.

            "Daten in flache Form umwandeln
            trans( EXPORTING json = 'X' zip = 'X' i_any = i_any raise_error = 'X'
                   IMPORTING e_result = lv_data ).

            db_update( vari = 'X' i_key1 = i_key1 i_key2 = i_key2 i_key3 = i_key3
                     commit = commit raise_error = abap_true i_any = lv_data ).

          WHEN gos.

            lcl_help=>gos_create_object(
              iv_data           = i_any
              iv_instid         = i_key1 "i_gs_object-instid
              iv_typeid         = i_key2 "gs_object-typeid
              iv_catid          = i_key3 "gs_object-catid
              iv_filename_w_ext = i_key4 "i_any2 "'example.pdf'
              commit_work       = commit
              ).

          WHEN vari.

            DATA lv_key TYPE c LENGTH 54.
            DATA lv_string TYPE string.

            lv_string = get( trim = 'X' i_any = i_key1 ) &&
                        get( trim = 'X' i_any = i_key2 ) &&
                        get( trim = 'X' i_any = i_key3 ).
            lv_key(54) = lv_string.

            trans( EXPORTING id = 'X' i_any = i_any raise_error = 'X'
                   IMPORTING e_result = lv_data ).
            do( free_sy = 'X').
            EXPORT data = lv_data TO DATABASE vari(z1) CLIENT sy-mandt ID lv_key.
            raise_check( sy_subrc = 'X' ).


          WHEN bal.

            DATA:
              ls_log    TYPE bal_s_log.

            ls_log-object    = i_key1.
            ls_log-subobject = i_key2.
            ls_log-extnumber = i_key3.

            lcl_help=>bal_save(  i_any = i_any is_log = ls_log ).


          WHEN bal_indx.

            DATA: lv_key_bal_indx TYPE c LENGTH 20.
            CONCATENATE i_key1 i_key2 i_key3 i_key4 INTO lv_string.
            SHIFT lv_string LEFT DELETING LEADING ' '.
            lv_key_bal_indx = lv_string.

            "Daten in flache Form umwandeln
            trans(
               EXPORTING
                  xml          = 'X'
                  zip                = 'X'
                  i_any              = i_any
               IMPORTING
                  e_result           = lv_data ).


            do( free_sy = 'X').
            EXPORT data = lv_data TO DATABASE bal_indx(z1) CLIENT sy-mandt ID lv_key_bal_indx.
            raise_check( sy_subrc = 'X' ).


          WHEN so10.

            DATA lv_object TYPE thead-tdobject.
            DATA lv_name   TYPE thead-tdname.
            DATA lv_id     TYPE thead-tdid.
            DATA lv_langu  TYPE thead-tdspras.
            DATA lt_so10_stringtab TYPE stringtab.
            DATA lt_so10_result TYPE stringtab.

            lv_object = i_key1. " 'VBBK'
            lv_id     = i_key2. " '0002' Type
            lv_name   = i_key3. " '0030000000' Auftrag
            lv_langu  = i_key4. " 'E'

            lt_so10_stringtab = i_any.

            lcl_help=>so10_write(
                i_key1   = lv_object
                i_key2   = lv_id
                i_key3   = lv_name
                i_key4   = lv_langu
                i_any    = lt_so10_stringtab
                i_commit = commit
                ).

          WHEN OTHERS.
            raise('CX_WONG_CALL_OF_METHOD').
        ENDCASE.

        IF commit = 'X'.
          do( commit_a_wait = 'X' ).
        ENDIF.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error( ix_root = lx_root raise_error = raise_error ).
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>DO
* +-------------------------------------------------------------------------------------------------+
* | [--->] FREE_SY                        TYPE        ABAP_BOOL(optional)
* | [--->] COMMIT_A_WAIT                  TYPE        ABAP_BOOL(optional)
* | [--->] ROLLBACK                       TYPE        ABAP_BOOL(optional)
* | [--->] SEND_EMAIL                     TYPE        ABAP_BOOL(optional)
* | [--->] SEND_IDOC                      TYPE        ABAP_BOOL(optional)
* | [--->] RAISE_EVENT                    TYPE        ABAP_BOOL(optional)
* | [--->] RFC_NEW_TASK                   TYPE        ABAP_BOOL(optional)
* | [--->] RFC_BACKGROUND_TASK            TYPE        ABAP_BOOL(optional)
* | [--->] RFC_PARALLEL_TASK              TYPE        ABAP_BOOL(optional)
* | [--->] AMC_SEND                       TYPE        ABAP_BOOL(optional)
* | [--->] HTTP_REQ_SET                   TYPE        ABAP_BOOL(optional)
* | [--->] HTTP_REQ_GET                   TYPE        ABAP_BOOL(optional)
* | [--->] REPORT_START                   TYPE        ABAP_BOOL(optional)
* | [--->] INIT                           TYPE        ABAP_BOOL(optional)
* | [--->] INIT_CUST                      TYPE        ABAP_BOOL(optional)
* | [--->] I_ANY                          TYPE        ANY(optional)
* | [--->] I_ANY2                         TYPE        ANY(optional)
* | [--->] I_ANY3                         TYPE        ANY(optional)
* | [--->] I_ANY5                         TYPE        ANY(optional)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<---] E_ANY                          TYPE        ANY
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD do.

    " Methode zum Ausfuehren haeufig wiederkehrender Aktionen
    " commit, rollback, rfc, usw
    TRY.
        CASE abap_true.

          WHEN init.

            "Helper initialisieren
            DATA(lo_help) = NEW lcl_help(  ).
            FREE lo_help.


          WHEN init_cust.

            FIELD-SYMBOLS: <ls_data> TYPE data.
            ASSIGN i_any->* TO <ls_data>.
            lcl_help=>init_cust( IMPORTING e_any2 =  <ls_data> ).


          WHEN amc_send.

            DATA: lv_amc_msg        TYPE string.
            DATA: lv_amc_channel_id TYPE string.
            DATA: lv_amc_appli_id   TYPE c LENGTH 30. "string.

            lv_amc_appli_id   = i_any.
            lv_amc_channel_id = i_any2.
            lv_amc_msg        = i_any3.


            CAST if_amc_message_producer_text(

                   cl_amc_channel_manager=>create_message_producer(
                     i_application_id = lv_amc_appli_id "'ZKAL_MC_UI5_TEST' "ZAMC_TESTÃ¢â#¬â#¢
                     i_channel_id     = lv_amc_channel_id  ) "'/ping' )

              )->send( i_message = lv_amc_msg ) . "|Static text| ).


          WHEN http_req_get.


            lcl_help=>http_request_get(
*              exporting
*                IV_HOST              = 'http://eloquentjavascript.net'
*                IV_URI               = '/author'
*                IV_AUTHENTICATE_NAME =
*                IV_AUTHENTICATE_PW   =
*              importing
*                EV_RESULT            =
            ).
*              catch CX_T100_MSG.    "



          WHEN free_sy.

            FREE: sy-subrc, sy-msgid, sy-msgno, sy-msgty, sy-msgv1, sy-msgv2, sy-msgv3, sy-msgv4.


          WHEN commit_a_wait.

            DATA ls_return  TYPE bapiret2.

            CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
              EXPORTING
                wait          = abap_true    " Using the command `COMMIT AND WAIT`
              IMPORTING
                return        = ls_return    " Return Messages
              EXCEPTIONS
                error_message = 1
                OTHERS        = 2.
            IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
            raise_check( function = 'X' i_check1 = ls_return ).


          WHEN rollback.

            CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'
              IMPORTING
                return        = ls_return    " Return Messages
              EXCEPTIONS
                error_message = 1
                OTHERS        = 2.
            IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
            raise_check( function = 'X' i_check1 = ls_return ).


          WHEN rfc_background_task OR rfc_new_task OR rfc_parallel_task.

            CASE abap_true.
              WHEN rfc_new_task.

*                if abap_false = check( castable = 'X' i_any = 'IF_SERIALIZABLE_OBJECT' i_any2 = i_any ).
*                  raise( 'ZCX_INPUT_OBJECT_NOT_SERIALIZABLE_ERROR').
*                endif.

                NEW lcl_rfc_control( )->start_new_task(
                  EXPORTING
                    iv_method_name = i_any2
                    if_object      = i_any
                  IMPORTING
                    ei_object      = e_any
                ).

            ENDCASE.
*            lv_name_merfc_new_taskthod = i_any2.
*            Methodenname zum ausfÃ¼hren
*            und serialisierbares Objekt Ã¼bergeben

*            lcl_rfc_control=>start_new_task

*            pbt( i_any = i_any ).


          WHEN report_start.

*            IF sy-slset IS INITIAL OR sy-slset <> iv_repid_variant.
*
*              DATA lv_mandt TYPE sy-mandt.
*
*              SELECT SINGLE mandt
*                FROM vari
*                INTO lv_mandt
*                WHERE report = iv_repid_name "sy-repid
*                AND variant = iv_repid_variant   ##WRITE_OK.
*              IF sy-subrc <> 0.
*                RETURN.
*              ENDIF.
**      mo_help->so_check_a_raise->after_select(  ).
*
*
*              lv_char100 = iv_repid_variant.
*
*              SUBMIT (iv_repid_name) "z034tsd_ship_monitor_start
*                  VIA SELECTION-SCREEN
*                  USING SELECTION-SET lv_char100.
*
*
*            ENDIF.

          WHEN OTHERS.
            raise('ZCX_WORNG_CALL_OF_METHOD').

        ENDCASE.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    ENDTRY.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] CONV_IN                        TYPE        ABAP_BOOL(optional)
* | [--->] CONV_OUT                       TYPE        ABAP_BOOL(optional)
* | [--->] PRINT                          TYPE        ABAP_BOOL(optional)
* | [--->] PRINT_DEEP                     TYPE        ABAP_BOOL(optional)
* | [--->] XML                            TYPE        ABAP_BOOL(optional)
* | [--->] JSON                           TYPE        ABAP_BOOL(optional)
* | [--->] JSON_DEEP                      TYPE        ABAP_BOOL(optional)
* | [--->] ZIP                            TYPE        ABAP_BOOL(optional)
* | [--->] UNZIP                          TYPE        ABAP_BOOL(optional)
* | [--->] PARAM_USER                     TYPE        ABAP_BOOL(optional)
* | [--->] TRIM_UPPER_CASE                TYPE        ABAP_BOOL(optional)
* | [--->] TRIM                           TYPE        ABAP_BOOL(optional)
* | [--->] PARAM_SYSTEM                   TYPE        ABAP_BOOL(optional)
* | [--->] PARAM_ID                       TYPE        ABAP_BOOL(optional)
* | [--->] MSG_TYPE                       TYPE        ABAP_BOOL(optional)
* | [--->] TEXT                           TYPE        ABAP_BOOL(optional)
* | [--->] DD04T                          TYPE        ABAP_BOOL(optional)
* | [--->] GUID16                         TYPE        ABAP_BOOL(optional)
* | [--->] RTTI_KIND                      TYPE        ABAP_BOOL(optional)
* | [--->] RTTI_TYPE                      TYPE        ABAP_BOOL(optional)
* | [--->] RTTI_TYPE_KIND                 TYPE        ABAP_BOOL(optional)
* | [--->] RTTI_TYPE_SUPER                TYPE        ABAP_BOOL(optional)
* | [--->] RTTI_TYPE_DYNAM                TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_CHOOSE                   TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_CONFIRM                  TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_GET_VALUE                TYPE        ABAP_BOOL(optional)
* | [--->] METHODNAME                     TYPE        ABAP_BOOL(optional)
* | [--->] CX_CODE                        TYPE        ABAP_BOOL(optional)
* | [--->] I_ANY                          TYPE        ANY(optional)
* | [--->] I_ANY2                         TYPE        ANY(optional)
* | [--->] I_ANY3                         TYPE        ANY(optional)
* | [--->] I_ANY4                         TYPE        ANY(optional)
* | [--->] I_ANY5                         TYPE        ANY(optional)
* | [--->] IV_LANGU                       TYPE        ANY (default =SY-LANGU)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] LOG_INFO                       TYPE        ABAP_BOOL(optional)
* | [<-()] R_RESULT                       TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD  get.

    "Durchführen diverser Aktionen
    "Bsp JSON Tranformationen, zippen, msg texte, popups, RTTI infos usw
    "Ergebnis als String
    TRY.
        CASE abap_true.

          WHEN methodname.

            DATA lv_depth TYPE i.
            IF i_any IS NOT INITIAL.
              lv_depth = i_any.
            ENDIF.
            lv_depth = lv_depth + 1.

            info(
              EXPORTING
                iv_depth           = lv_depth
              IMPORTING
                ev_method          = r_result
            ).


          WHEN text.
            msg( EXPORTING i_any = i_any iv_langu = iv_langu raise_error = 'X'
                 IMPORTING e_any = r_result ).


          WHEN msg_type.
            msg( EXPORTING i_any = i_any iv_langu = iv_langu raise_error = 'X'
                IMPORTING ev_type = r_result ).


          WHEN zip.
            trans( EXPORTING zip = 'X' i_any = i_any raise_error = 'X'
                   IMPORTING e_result = r_result ).

          WHEN unzip.
            trans( EXPORTING unzip = 'X' i_any = i_any raise_error = 'X'
                   IMPORTING e_result = r_result ).

          WHEN json.
            trans( EXPORTING json = 'X' i_any = i_any raise_error = 'X'
                   IMPORTING e_result = r_result ).

          WHEN json_deep.

            json(
              EXPORTING
                i_any = i_any
                i_any2 = i_any2
                i_any3 = i_any3
                i_any4 = i_any4
                i_any5 = i_any5
              IMPORTING
                e_any1      = r_result
            ).


          WHEN xml.
            trans( EXPORTING xml = 'X' i_any = i_any raise_error = 'X'
                   IMPORTING e_result = r_result ).

          WHEN conv_in.
            "FÃ¼hrt einen Conversion Exit Input mit i_any durch
            "wenn i_any2 gefÃ¼llt dann erfolgt exit Ã¼ber typ bestimmung
            "wenn i_any3 gefÃ¼llt wird wert als exitname verwendet
            r_result =  lcl_help=>get_convexit(
                                            i_any   = i_any
                                            iv_type = i_any2
                                            iv_exit = i_any3 ).

          WHEN conv_out.
            "FÃ¼hrt einen Conversion Exit Input mit i_any durch
            "wenn i_any2 gefÃ¼llt dann erfolgt exit Ã¼ber typ bestimmung
            "wenn i_any3 gefÃ¼llt wird wert als exitname verwendet
            r_result =  lcl_help=>get_convexit(
                                            i_any   = i_any
                                            iv_type = i_any2
                                            iv_exit = i_any3
                                            iv_is_input = abap_false ).


          WHEN popup_choose.

            DATA lv_result TYPE string.

            gui(
              EXPORTING
                popup_choose      = 'X'
                i_any             = i_any
                i_any2            = i_any2
                iv_title          = i_any3
                raise_error       = raise_error
              IMPORTING
                e_any             = lv_result
*
            ).

            lv_result =  get(
                  trim            = 'X'
                  i_any           = lv_result
              ).
            r_result = lv_result.

          WHEN popup_confirm.
            DATA lv_answer TYPE string.
            gui(
              EXPORTING
                popup_confirm     = 'X'
                i_any             = i_any
              IMPORTING
*            e_any             =
                ev_answer         = lv_answer
            ).

            CASE lv_answer.
              WHEN cs-s_popup_answer-yes.
                r_result = abap_true.
            ENDCASE.

          WHEN trim_upper_case.
            r_result = i_any.
            SHIFT r_result RIGHT DELETING TRAILING ' '.
            SHIFT r_result LEFT DELETING LEADING ' '.
            TRANSLATE r_result TO UPPER CASE.

          WHEN trim.
            r_result = i_any.
            SHIFT r_result RIGHT DELETING TRAILING ' '.
            SHIFT r_result LEFT DELETING LEADING ' '.

          WHEN print_deep.

            trans( EXPORTING print = 'X' i_any = i_any
                   IMPORTING e_result = r_result ).

          WHEN print.
            DATA lv_c TYPE c LENGTH 500.

            WRITE i_any TO lv_c.
            SHIFT lv_c LEFT DELETING LEADING ' '.
            r_result = lv_c.

*            trans( EXPORTING print = 'X' i_any = i_any
*                   IMPORTING e_result = r_result ).


          WHEN log_info.

            info(
              IMPORTING
                ev_time_write      = DATA(lv_time)
                ev_date_write      = DATA(lv_date)
            ).

            CONCATENATE
             lv_date
             lv_time
             sy-uname
             INTO r_result SEPARATED BY ' / '.



          WHEN rtti_type_kind.
            rtti( EXPORTING i_any        = i_any
                  IMPORTING ev_type_kind = r_result ).

          WHEN rtti_kind.
            rtti( EXPORTING i_any   = i_any
                  IMPORTING ev_kind = r_result ).

          WHEN guid16.
*            DATA: lv_guid_16 TYPE guid_16.
*            CALL FUNCTION 'GUID_CREATE'
*              IMPORTING
*                ev_guid_16 = lv_guid_16.
            DATA: l_uuid_16  TYPE sysuuid_x16.
            l_uuid_16 = cl_system_uuid=>create_uuid_x16_static( ).

            r_result = l_uuid_16. "lv_guid_16.


          WHEN param_id.

            IMPORT testmemory TO r_result FROM MEMORY ID 'TESTMEMORY'.


          WHEN param_system.

            DATA:
                ls_tvarvc TYPE tvarvc.

            FREE ls_tvarvc.
            ls_tvarvc-name = i_any.
            ls_tvarvc-type = i_any2.

            TRANSLATE ls_tvarvc-name TO UPPER CASE.
            SHIFT     ls_tvarvc-name LEFT DELETING LEADING ' '.
*            ls_tvarvc-name = get( conv_in = 'X' i_any = ls_tvarvc-name ).
            ls_tvarvc-type = get( conv_in = 'X' i_any = ls_tvarvc-type ).

            SELECT SINGLE *
            FROM tvarvc
            INTO CORRESPONDING FIELDS OF ls_tvarvc
            WHERE name = ls_tvarvc-name
            AND type   = ls_tvarvc-type.
            raise_check(
                select = abap_true
                i_ser_value = get( json_deep = 'X'
                                    i_any  = ls_tvarvc-name
                                    i_any2 = ls_tvarvc-type )
                        ).

            r_result = ls_tvarvc-low.

          WHEN param_user.

            DATA: lv_parid TYPE usr05-parid,
                  lv_user  TYPE usr05-bname.

            lv_parid = i_any.
            lv_user  = i_any2.

            SELECT SINGLE parva
                FROM usr05
                INTO r_result
                WHERE bname = lv_user
                AND   parid = lv_parid.
            raise_check( select = abap_true i_ser_value = get( json_deep = 'X' i_any = lv_user i_any2 = lv_parid ) ).


          WHEN dd04t.
            DATA ls_dd04t   TYPE dd04t.

            FREE ls_dd04t.
            ls_dd04t-rollname   = get( trim_upper_case = 'X' i_any = i_any    ).
            ls_dd04t-ddlanguage = get( trim_upper_case = 'X' i_any = iv_langu ).

            READ TABLE ss_db_buffer-t_dd04t INTO ls_dd04t
                WITH TABLE KEY rollname = ls_dd04t-rollname ddlanguage = ls_dd04t-ddlanguage.
            IF sy-subrc <> 0.
              SELECT SINGLE *
              FROM dd04t
              INTO ls_dd04t
              WHERE rollname  = ls_dd04t-rollname
              AND  ddlanguage = iv_langu.
              INSERT ls_dd04t INTO TABLE ss_db_buffer-t_dd04t.
            ENDIF.
            CASE i_any2.
              WHEN 'S'.
                r_result = ls_dd04t-scrtext_s.
              WHEN 'L'.
                r_result = ls_dd04t-scrtext_l.
              WHEN OTHERS.
                r_result = ls_dd04t-scrtext_m.
            ENDCASE.

            IF r_result IS INITIAL.
              raise('NO_DATA').
            ENDIF.

          WHEN rtti_type OR rtti_type_super.

            DATA: lv_typename       TYPE string,
                  lv_typename_super TYPE string,
                  lv_kind           TYPE string.

            rtti( EXPORTING i_any = i_any
                  IMPORTING
                     ev_type       = lv_typename
*                     ev_type_ddic  = lv_typename_ddic
                     ev_ref_super      = lv_typename_super
                     ev_kind           = lv_kind ).

            r_result = lv_typename.

            CASE lv_kind.
              WHEN cl_abap_datadescr=>kind_ref.
                IF rtti_type_super = abap_true.
                  r_result = lv_typename_super.
                ENDIF.
            ENDCASE.
            RETURN.

          WHEN popup_get_value.

            DATA: lv_changed TYPE as4flag.
            DATA: lv_name TYPE string.
            lv_name = i_any.
            CALL FUNCTION 'CC_POPUP_STRING_INPUT'
              EXPORTING
                property_name = lv_name
              IMPORTING
                value_changed = lv_changed
              CHANGING
                string_value  = r_result.

            IF sy-ucomm = 'CANCEL'." = abap_true.
              r_result = cs-s_popup_answer-exit.
              sy-ucomm = cs-s_popup_answer-exit.
            ENDIF.

*      DATA lo_gui TYPE ty-o_easy_alv.
*            CREATE OBJECT lo_gui.
*            lo_gui->gui_popup_get_value(
*           EXPORTING
*             iv_title        = i_any
*             iv_tab_field_1  = ' MDMFDBID-VALUE'
**            iv_tab_field_1  = 'DD04T-SCRTEXT_L'
*           IMPORTING
*             ev_user_cancel  = DATA(lv_is_cancel)
*             ev_value1       = r_result
*         ).
*            IF lv_is_cancel = abap_true.
*              r_result = cs-s_popup_answer-exit. "raise('ZCX_USER_POPUP_PRESSED_EXIT').
*            ENDIF.


          WHEN cx_code.

            cx_info( EXPORTING ix_root = i_any
                     IMPORTING ev_code = r_result ).


          WHEN OTHERS.
            raise('CX_WRONG_METHOD_CALL').

        ENDCASE.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    ENDTRY.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>GET_BUS
* +-------------------------------------------------------------------------------------------------+
* | [--->] VEKP_EXIDV_BY_VENUM            TYPE        ABAP_BOOL(optional)
* | [--->] VEKP_VENUM_BY_EXIDV            TYPE        ABAP_BOOL(optional)
* | [--->] MAKT_MAKTX_BY_MATNR            TYPE        ABAP_BOOL(optional)
* | [--->] MATNR_EXT                      TYPE        ABAP_BOOL(optional)
* | [--->] MARA_MEINS_BY_MATNR            TYPE        ABAP_BOOL(optional)
* | [--->] VBAK_VBELN_BY_LIKP_VORG        TYPE        ABAP_BOOL(optional)
* | [--->] KNA1_NAME1_BY_KUNNR            TYPE        ABAP_BOOL(optional)
* | [--->] LFA1_NAME1_BY_LIFNR            TYPE        ABAP_BOOL(optional)
* | [--->] VBPA_KUNNR_BY_VBELN_POS_PARVW  TYPE        ABAP_BOOL(optional)
* | [--->] IHPA_PARNR_BY_OBJNR_PARVW      TYPE        ABAP_BOOL(optional)
* | [--->] CSLT_LTEXT_BY_LANG_KOKRS_LSTAR TYPE        ABAP_BOOL(optional)
* | [--->] USERDETAIL_INFO_BY_PERNR       TYPE        ABAP_BOOL(optional)
* | [--->] I_ANY                          TYPE        ANY(optional)
* | [--->] I_ANY2                         TYPE        ANY(optional)
* | [--->] I_ANY3                         TYPE        ANY(optional)
* | [--->] IV_LANGU                       TYPE        ANY (default =SY-LANGU)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] CONV_EXIT                      TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] REFRESH_MEMORY                 TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<-()] R_RESULT                       TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_bus.

    "Business Infos auslesen
    "Bsp venum->exidv, mara-meins, maktx, kunnr usw
    TRY.
        CASE abap_true.

          WHEN mara_meins_by_matnr.

            DATA ls_mara TYPE mara.

            ls_mara-matnr = i_any.

            READ TABLE ss_db_buffer-t_mara INTO ls_mara
              WITH KEY matnr = ls_mara-matnr.
            IF sy-subrc <> 0.
              SELECT SINGLE matnr meins
                  FROM mara
                  INTO CORRESPONDING FIELDS OF ls_mara
*                WHERE spras = iv_langu
                  WHERE   matnr = ls_mara-matnr.
              INSERT ls_mara INTO TABLE ss_db_buffer-t_mara.
            ENDIF.

            r_result = ls_mara-meins.

            raise_check( not_initial = 'X'  i_check1 = r_result
                i_ser_value = get(  json_deep = 'X' i_any =  ls_mara-matnr )
                i_head      = 'ZCX_READ_DATABASE_MARA_MEINS_ERROR'
            ).

          WHEN cslt_ltext_by_lang_kokrs_lstar.

            DATA ls_cslt TYPE cslt.

            ls_cslt-spras = i_any.
            IF ls_cslt-spras IS INITIAL.
              ls_cslt-spras = sy-langu.
            ENDIF.
            ls_cslt-kokrs = i_any2.
            ls_cslt-lstar = i_any3.
*            objnr = i_any.
*            ls_cslt-parvw = i_any2.
*              WITH KEY objnr = ls_ihpa-objnr parvw = ls_ihpa-parvw.
            READ TABLE ss_db_buffer-t_cslt INTO ls_cslt
                WITH KEY
                    spras = ls_cslt-spras
                    kokrs = ls_cslt-kokrs
                    lstar = ls_cslt-lstar.
            IF sy-subrc <> 0.
              SELECT SINGLE *
                FROM cslt
                INTO ls_cslt
                WHERE
                spras = ls_cslt-spras AND
                kokrs = ls_cslt-kokrs AND
                lstar = ls_cslt-lstar.
              INSERT ls_cslt INTO TABLE ss_db_buffer-t_cslt.
            ENDIF.

            r_result = ls_cslt-ltext.

            raise_check( not_initial = 'X'  i_check1 = r_result
                        i_ser_value = get(  json_deep = 'X' i_any = ls_cslt-kokrs i_any2 = ls_cslt-lstar )
                        i_head      = 'ZCX_READ_DATABASE_CSLT_LTEXT_ERROR'
                    ).

          WHEN ihpa_parnr_by_objnr_parvw.

            DATA ls_ihpa TYPE ihpa.

            ls_ihpa-objnr = i_any.
            ls_ihpa-parvw = i_any2.
            READ TABLE ss_db_buffer-t_ihpa INTO ls_ihpa
              WITH KEY objnr = ls_ihpa-objnr parvw = ls_ihpa-parvw.
            IF sy-subrc <> 0.
              SELECT SINGLE *
                FROM ihpa
                INTO ls_ihpa
                WHERE objnr = ls_ihpa-objnr
                AND parvw = ls_ihpa-parvw.
              INSERT ls_ihpa INTO TABLE ss_db_buffer-t_ihpa.
            ENDIF.

            r_result = ls_ihpa-parnr.

            raise_check( not_initial = 'X'  i_check1 = r_result
                        i_ser_value = get(  json_deep = 'X' i_any = ls_ihpa-objnr i_any2 = ls_ihpa-parvw )
                        i_head      = 'ZCX_READ_DATABASE_IHPA_PARNR_ERROR'
                    ).

          WHEN  userdetail_info_by_pernr.

            DATA lv_uname TYPE xubname.
            DATA lv_info TYPE string.
            DATA ls_adress TYPE  bapiaddr3.
            DATA lt_return TYPE bapiret2_tab.
*              data lt_ret

            lv_uname = i_any.
            lv_info = i_any2.

            CALL FUNCTION 'BAPI_USER_GET_DETAIL'
              EXPORTING
                username      = lv_uname " User Name
                cache_results = 'X'    " Temporarily buffer results in work process
              IMPORTING
                address       = ls_adress  " Address Data
              TABLES
                return        = lt_return.    " Return Structure

            CASE lv_info.
              WHEN 'FULLNAME'.
                r_result = ls_adress-fullname.
            ENDCASE.


          WHEN vekp_exidv_by_venum.



          WHEN vekp_venum_by_exidv.




          WHEN makt_maktx_by_matnr.

            DATA ls_makt       TYPE makt.

            FREE ls_makt.
            ls_makt-spras = iv_langu.
            ls_makt-matnr = i_any.

            IF conv_exit = abap_true.
              ls_makt-spras = get( conv_in = 'X' i_any = ls_makt-spras ).
              ls_makt-matnr = get( conv_in = 'X' i_any = ls_makt-matnr ).
            ENDIF.

            READ TABLE ss_db_buffer-t_makt
              INTO ls_makt WITH TABLE KEY spras = ls_makt-spras matnr = ls_makt-matnr.

            IF sy-subrc <> 0 OR refresh_memory = abap_true.
              SELECT SINGLE *
                FROM makt
                INTO CORRESPONDING FIELDS OF ls_makt
                WHERE spras = iv_langu
                AND   matnr = i_any.
              INSERT ls_makt INTO TABLE ss_db_buffer-t_makt.
            ENDIF.
            r_result = ls_makt-maktx.


          WHEN matnr_ext.

            DATA ls_materialid TYPE materialid.
            FREE ls_materialid.
            ls_materialid-matnr_int = i_any.

            IF conv_exit = abap_true.
              ls_materialid-matnr_int = get( conv_in = 'X' i_any = ls_materialid-matnr_int ).
            ENDIF.

            READ TABLE ss_db_buffer-t_materialid
                INTO ls_materialid WITH TABLE KEY matnr_int = ls_materialid-matnr_int.

            IF sy-subrc <> 0 OR refresh_memory = abap_true.
              SELECT SINGLE *
               FROM  materialid
               INTO  ls_materialid
               WHERE matnr_int = ls_materialid-matnr_int.
              INSERT ls_materialid INTO TABLE ss_db_buffer-t_materialid.
            ENDIF.

            r_result = ls_materialid-matnr_ext.


          WHEN kna1_name1_by_kunnr.

            DATA ls_kna1 TYPE kna1.

            FREE ls_kna1.
            ls_kna1-kunnr = i_any.

            IF conv_exit = abap_true.
              ls_kna1-kunnr = get( conv_in = 'X' i_any = ls_kna1-kunnr ).
            ENDIF.

            READ TABLE ss_db_buffer-t_kna1
                INTO ls_kna1 WITH TABLE KEY kunnr = ls_kna1-kunnr.

            IF sy-subrc <> 0 OR refresh_memory = abap_true.
              SELECT SINGLE  *
                  FROM kna1
                  INTO CORRESPONDING FIELDS OF ls_kna1
                  WHERE kunnr = ls_kna1-kunnr.
              INSERT ls_kna1 INTO TABLE ss_db_buffer-t_kna1.
            ENDIF.
            r_result = ls_kna1-name1.


          WHEN lfa1_name1_by_lifnr.

            DATA ls_lfa1 TYPE lfa1.

            FREE ls_lfa1.
            ls_lfa1-lifnr = i_any.

            IF conv_exit = abap_true.
              ls_lfa1-lifnr = get( conv_in = 'X' i_any = ls_lfa1-lifnr ).
            ENDIF.

            READ TABLE ss_db_buffer-t_lfa1
                INTO ls_lfa1 WITH TABLE KEY lifnr = ls_lfa1-lifnr.

            IF sy-subrc <> 0 OR refresh_memory = abap_true.
              SELECT SINGLE  *
                  FROM lfa1
                  INTO CORRESPONDING FIELDS OF ls_lfa1
                  WHERE lifnr = ls_lfa1-lifnr. "lv_lifnr.
              INSERT ls_lfa1 INTO TABLE ss_db_buffer-t_lfa1.
            ENDIF.
            r_result = ls_lfa1-name1.


          WHEN OTHERS.
            raise('CX_WRONG_METHOD_CALL').

        ENDCASE.

        IF r_result IS INITIAL.
          raise('CX_NO_DATA').
        ENDIF.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>GET_MSG
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ANY                          TYPE        ANY(optional)
* | [--->] IV_ID                          TYPE        ANY(optional)
* | [--->] IV_NO                          TYPE        ANY(optional)
* | [--->] IV_TYPE                        TYPE        ANY(optional)
* | [--->] IV_V1                          TYPE        ANY(optional)
* | [--->] IV_V2                          TYPE        ANY(optional)
* | [--->] IV_V3                          TYPE        ANY(optional)
* | [--->] IV_V4                          TYPE        ANY(optional)
* | [--->] IV_LANGU                       TYPE        ANY (default =SY-LANGU)
* | [--->] USE_T100_ONLY                  TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<-()] R_RESULT                       TYPE        BAPIRET2
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_msg.

    "Message erzeugen aus diversen Daten oder Objekten
    "Bsp Log Objekte, Exceptions, BAPIRET usw.
    msg(
      EXPORTING
        i_any         = i_any
        iv_id         = iv_id
        iv_no         = iv_no
        iv_type       = iv_type
        iv_v1         = iv_v1
        iv_v2         = iv_v2
        iv_v3         = iv_v3
        iv_v4         = iv_v4
        use_t100_only = use_t100_only
        iv_langu      = iv_langu
        raise_error   = raise_error
      IMPORTING
        es_bapi       = r_result ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>GUI
* +-------------------------------------------------------------------------------------------------+
* | [--->] MESSAGE                        TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_T100_SIMPLE              TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_T100                     TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_PRINT                    TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_XML                      TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_JSON                     TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_JSON_DEEP                TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_TAB                      TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_ERROR                    TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_CUST                     TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_BAL_TAB                  TYPE        ABAP_BOOL(optional)
* | [--->] START_BAL                      TYPE        ABAP_BOOL(optional)
* | [--->] START_TCODE                    TYPE        ABAP_BOOL(optional)
* | [--->] START_BROWSER                  TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_ALV_VARI                 TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_SEL_VARI                 TYPE        ABAP_BOOL(optional)
* | [--->] STATUS                         TYPE        ABAP_BOOL(optional)
* | [--->] STATUS_PROGRESS                TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_F4_HELP                  TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_F4_HELP_TAB              TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_INFO                     TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_GET_VALUE                TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_CONFIRM                  TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_RANGE                    TYPE        ABAP_BOOL(optional)
* | [--->] POPUP_CHOOSE                   TYPE        ABAP_BOOL(optional)
* | [--->] CALL_VIEW                      TYPE        ABAP_BOOL(optional)
* | [--->] FILE_DOWNLOAD                  TYPE        ABAP_BOOL(optional)
* | [--->] FILE_UPLOAD                    TYPE        ABAP_BOOL(optional)
* | [--->] I_ANY                          TYPE        ANY(optional)
* | [--->] I_ANY2                         TYPE        ANY(optional)
* | [--->] I_ANY3                         TYPE        ANY(optional)
* | [--->] I_ANY4                         TYPE        ANY(optional)
* | [--->] I_ANY5                         TYPE        ANY(optional)
* | [--->] I_ANY6                         TYPE        ANY(optional)
* | [--->] IV_TYPE                        TYPE        ANY(optional)
* | [--->] IV_TITLE                       TYPE        ANY(optional)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<---] E_ANY                          TYPE        ANY
* | [<---] EV_ANSWER                      TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD gui.

    "GUI Anzeige für verschiedene Aktionen
    "Bsp Tabellenausgabe, Log Anzeige, Messages, Popup Confirm/Inform usw
    TRY.
        IF sy-batch = abap_true.
          raise('ZCX_GUI_ACTIVE_IN_BATCH_MODE_ERROR').
        ENDIF.
        FREE ev_answer.

        CASE abap_true.

          WHEN popup_cust.

            lcl_help=>popup_cust(  i_any ).

          WHEN message.

            msg(
               EXPORTING
                i_any         = i_any
*                iv_id         = iv_id
*                iv_no         = iv_no
                iv_type       = iv_type
*                iv_v1         = iv_v1
*                iv_v2         = iv_v2
*                iv_v3         = iv_v3
*                iv_v4         = iv_v4
              IMPORTING
                es_bapi       = DATA(ls_log)
            ).

            CASE iv_type.
              WHEN 'S'.
                MESSAGE s398(00) WITH
                   ls_log-message_v1
                   ls_log-message_v2
                   ls_log-message_v3
                   ls_log-message_v4.

            ENDCASE.

          WHEN popup_json_deep.

            lcl_help=>popup_json_deep( iv_serial = i_any ).

          WHEN popup_alv_vari.

            lcl_help=>popup_alv_f4(
              EXPORTING
                iv_handle = i_any2
                iv_uname  = i_any2
                iv_repid  = i_any
              RECEIVING
                rv_vari   = e_any
            ).


          WHEN file_upload.
            e_any = lcl_help=>gui_upload( use_exceptions = raise_error ).

          WHEN file_download.

            lcl_help=>gui_download(
        iv_input         = i_any
        iv_filname_w_ext = i_any2 "'example.pdf'
        iv_filter        = i_any3 "'(*.pdf)|*.pdf|'
    ).

          WHEN popup_f4_help_tab.
            DATA lx_root TYPE REF TO cx_root.
            TRY.
                lcl_help=>popup_f4_help_tab(
                   EXPORTING
                     iv_fieldname       = i_any
                     it_table           = i_any2
                   RECEIVING
                     rv_result          = e_any ).
              CATCH cx_root INTO lx_root.
                CASE get( cx_code = 'X' i_any = lx_root ).
                  WHEN cs-s_error_code-user_exit.
                    ev_answer = cs-s_popup_answer-exit.
                ENDCASE.
            ENDTRY.

          WHEN status.
            DATA ls_sy TYPE sy.
            msg(
         EXPORTING
           i_any         = i_any
*           iv_id         = iv_id
*           iv_no         = iv_no
           iv_type       = iv_type
*           iv_v1         = iv_v1
*           iv_v2         = iv_v2
*           iv_v3         = iv_v3
*           iv_v4         = iv_v4
*           iv_langu      = iv_langu
         IMPORTING
           e_any         = ls_sy ).

            IF ls_sy-msgty CA 'EWSI'.
            ELSE.
              ls_sy-msgty = 'I'.
            ENDIF.
            MESSAGE ID ls_sy-msgid TYPE 'S' NUMBER ls_sy-msgno
            WITH ls_sy-msgv1 ls_sy-msgv2 ls_sy-msgv3 ls_sy-msgv4
            DISPLAY LIKE ls_sy-msgty.

          WHEN status_progress.

            DATA: lv_prozent   TYPE i.
            DATA lv_text TYPE char100.

            lv_prozent = i_any2.
            lv_text = i_any.

*lv_n_prozent = ( lv_tabix / lv_counter_all ) * 100.
*lv_prozent   = lv_n_prozent.

            CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
              EXPORTING
                percentage = lv_prozent
                text       = lv_text.

          WHEN popup_f4_help.

            TRY.

                FREE ev_answer.

                lcl_help=>popup_f4_help(
                  EXPORTING
                    iv_name_search_help = i_any2
                    iv_name_field       = i_any
                  RECEIVING
                    rv_resault          = e_any ).

              CATCH cx_root INTO lx_root.
                CASE get( cx_code = 'X' i_any = lx_root ).
                  WHEN cs-s_error_code-user_exit.
                    ev_answer = cs-s_popup_answer-exit.
                ENDCASE.
            ENDTRY.

          WHEN popup_json.
            DATA:
              lo_alv        TYPE lcl_help=>ty_o_easy_gui.

            CREATE OBJECT lo_alv.

            DATA lr_result TYPE REF TO data.


            lo_alv->popup_json_data(
              EXPORTING
                i_any = i_any
                IMPORTING
                    e_any = e_any
                ).



*            lcl_local_help=>popup_json(  i_any = I_any ).
*            CALL TRANSFORMATION sjson2html SOURCE XML i_any
*                                 RESULT XML DATA(html).
*
*            cl_abap_browser=>show_html( html_string =
*            cl_abap_codepage=>convert_from( html ) ).
            RETURN.

          WHEN start_browser.

            DATA lv_url TYPE c LENGTH 400.
            lv_url = i_any.

            CALL FUNCTION 'CALL_BROWSER'
              EXPORTING
                url                    = lv_url         " URL of Browser Call
*               window_name            = space         " Under ITS: Name of Browser Target Window
*               new_window             = space         " Under Win32: Open a New Window
*               browser_type           = browser_type  " Obsolete: Do Not Use
*               contextstring          = contextstring " Obsolete: Do Not Use
              EXCEPTIONS
                frontend_not_supported = 1             " Frontend Not Supported
                frontend_error         = 2             " Error occurred in SAPGUI
                prog_not_found         = 3             " Program not found or not in executable form
                no_batch               = 4             " Front-End Function Cannot Be Executed in Backgrnd
                unspecified_error      = 5             " Unspecified Exception
                OTHERS                 = 6.
            IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
            raise_check( function = 'X').

          WHEN start_tcode.

            IF i_any2 IS INITIAL.
              RETURN.
            ENDIF.

            lcl_help=>call_transaction(
                iv_transaction_name = i_any
                iv_field1_name      = i_any2
                iv_field1_value     = i_any3
                iv_field2_name      = i_any3
                iv_field3_value     = i_any4 ).

          WHEN popup_range.

            lcl_help=>popup_sel_option(
               EXPORTING iv_tab   = 'MARA' iv_field = 'MATNR'
               IMPORTING et_range = e_any ev_cancel = DATA(lv_cancel) ).

          WHEN popup_choose.
            lcl_help=>popup_choose(
              EXPORTING
              iv_title   = iv_title
                it_choices = i_any
                i_sel      = i_any2
              RECEIVING
                r_result   = e_any ).
            RETURN.

          WHEN popup_print.
            DATA lt_stringtab TYPE stringtab.
            trans( EXPORTING print  = 'X' i_any = i_any
                   IMPORTING  e_result = lt_stringtab ).
            gui( popup_tab = 'X' i_any = lt_stringtab ).
            RETURN.

          WHEN popup_error.
            lcl_help=>popup_exception( i_any ).
            RETURN.


          WHEN popup_tab.

            IF get(  rtti_kind = 'X' i_any = i_any ) = cl_abap_datadescr=>kind_struct.

              DATA: lref_data TYPE REF TO data.
              FIELD-SYMBOLS: <lt_data> TYPE STANDARD TABLE.

              CREATE DATA lref_data LIKE TABLE OF i_any.
              ASSIGN i_any TO <lt_data>.
              APPEND INITIAL LINE TO <lt_data> ASSIGNING FIELD-SYMBOL(<l_any>).
              <l_any> = i_any.
              lcl_help=>popup_table( <lt_data> ).

            ELSE.
              lcl_help=>popup_table(  i_any ).
            ENDIF.
            RETURN.

          WHEN popup_t100.
            DATA lt_bapi TYPE bapiret2_tab.
            FREE lt_bapi.
            msg( EXPORTING i_any = i_any IMPORTING et_bapi = lt_bapi  ).
            lcl_help=>popup_t100_ext(  lt_bapi ).
            RETURN.

          WHEN popup_t100_simple.

            FREE lt_bapi.
            msg( EXPORTING i_any = i_any IMPORTING et_bapi = lt_bapi  ).
            lcl_help=>popup_t100(  lt_bapi ).
            RETURN.

          WHEN popup_xml.

*            lv_xml = get( xml = 'X' i_any = i_any ).
            lcl_help=>gui_popup_xml( i_any ).
            RETURN.


          WHEN call_view.

            DATA lv_viewname TYPE tabname.
            DATA lv_action TYPE c LENGTH 1.

            lv_viewname = i_any.
            IF i_any2 IS NOT INITIAL.
              lv_action = i_any2.
            ELSE.
              lv_action = 'S'.
            ENDIF.

            CALL FUNCTION 'VIEW_MAINTENANCE_CALL'
              EXPORTING
                action        = lv_action "'U' " S = Show, U = Update, T = Transport
                view_name     = lv_viewname
              EXCEPTIONS
                error_message = 1
                OTHERS        = 2.
            IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
            raise_check( function = 'X').

          WHEN popup_bal_tab.
            lcl_help=>gui_popup_bal_tab( i_any = i_any ).
            RETURN.

          WHEN start_bal.

            lcl_help=>gui_popup_bal(
                iv_object    = i_any
                iv_subobject = i_any2
                iv_extnumber = i_any3 ).
            RETURN.


          WHEN popup_sel_vari.

            e_any = lcl_help=>popup_f4_help_vari_selscreen(
                iv_repid = i_any  ).

            IF e_any IS INITIAL.
              ev_answer = cs-s_popup_answer-exit.
            ENDIF.

          WHEN popup_info.
            DATA ls_bapi TYPE bapiret2.

            msg(
            EXPORTING
              i_any         = i_any
*              iv_id         = iv_id
*              iv_no         = iv_no
              iv_type       = iv_type
*              iv_v1         = iv_v1
*              iv_v2         = iv_v2
*              iv_v3         = iv_v3
*              iv_v4         = iv_v4
*              iv_langu      = iv_langu
            IMPORTING
*              e_any        = ls_sy2
              es_bapi   = ls_bapi
               ).
*              et_bapi   = lt_bapi ).

*            if ls_sy2-msgty is INITIAL.
*            ls_sy2-msgty = 'I'.
*            endif.

*            if ls_sy2-msgty <> 'I'.
**            message ls_bapi-message  type 'I'
**           MESSAGE ID ls_sy2-msgid TYPE 'I' NUMBER ls_sy2-msgno
**            WITH ls_sy2-msgv1 ls_sy2-msgv2 ls_sy2-msgv3 ls_sy2-msgv4
*            DISPLAY LIKE ls_sy2-msgty. "'S'. " INTO lv_dummy.
*            else.
*                    message ls_bapi-message  type 'I'.
**                   MESSAGE ID ls_sy2-msgid TYPE 'I' NUMBER ls_sy2-msgno
**            WITH ls_sy2-msgv1 ls_sy2-msgv2 ls_sy2-msgv3 ls_sy2-msgv4.
**            DISPLAY LIKE ls_sy2-msgty. "'S'. " INTO lv_dummy.
*            endif.
            lcl_help=>gui_popup_inform( ls_bapi ).
            RETURN.

          WHEN popup_get_value.


            FREE ev_answer.

            DATA: lv_is_cancel TYPE abap_bool,
                  lv_tab1      TYPE string,
                  lv_field1    TYPE string.
            SPLIT i_any AT '-' INTO lv_tab1 lv_field1.

            lcl_help=>gui_popup_get_value(
              EXPORTING
                iv_title       = i_any2
                iv_tab1        = lv_tab1
                iv_field1      = lv_field1
              IMPORTING
                ev_user_cancel = lv_is_cancel
                ev_value1      = e_any ).

            IF lv_is_cancel = abap_true.
              ev_answer = cs-s_popup_answer-exit.
            ELSE.
*              e_any = lv_value.
            ENDIF.


          WHEN popup_confirm.

*            DATA ls_bapi TYPE bapiret2.
            DATA lv_answer TYPE abap_bool.

            ls_bapi =  get_msg(
                  i_any         = i_any
*                  iv_id         = iv_id
*                  iv_no         = iv_no
                  iv_type       = iv_type
*                  iv_v1         = iv_v1
*                  iv_v2         = iv_v2
*                  iv_v3         = iv_v3
*                  iv_v4         = iv_v4
*                  iv_langu      = iv_langu
                  ).

            lv_answer =  lcl_help=>gui_popup_confirm( is_bapi = ls_bapi ).

            IF lv_answer = abap_true.
              ev_answer = cs-s_popup_answer-yes.
            ELSE.
              ev_answer = cs-s_popup_answer-no.
            ENDIF.

            "herausfinden was die beste AnzeigemÃ¶glichkeit ist...
          WHEN OTHERS.

            CASE get( rtti_kind = 'X' i_any = i_any ). .

              WHEN cl_abap_datadescr=>kind_ref.

                IF abap_true = check( castable = 'X' i_any = 'CX_ROOT' i_any2 = i_any ).
                  gui( popup_error = 'X' i_any = i_any ).
                  RETURN.
                ENDIF.

              WHEN cl_abap_datadescr=>kind_struct OR cl_abap_datadescr=>kind_table.

                CASE get( rtti_type = 'X' i_any = i_any ).

                  WHEN 'BALM_T'.

                    gui( popup_bal_tab = 'X' i_any = i_any ).
                    RETURN.

                  WHEN OTHERS.
                    TRY.
                        msg( use_t100_only = abap_true raise_error = abap_true i_any = i_any ).
                        gui(  popup_t100_simple = 'X' i_any = i_any ).
                      CATCH cx_no_check.
                        gui( popup_tab = 'X' i_any = i_any ).
                    ENDTRY.
                    RETURN.

                ENDCASE.

            ENDCASE.



            msg(
             EXPORTING
               i_any         = i_any
*               iv_id         = iv_id
*               iv_no         = iv_no
               iv_type       = iv_type
*               iv_v1         = iv_v1
*               iv_v2         = iv_v2
*               iv_v3         = iv_v3
*               iv_v4         = iv_v4
*               iv_langu      = iv_langu
             IMPORTING
               e_any         = ls_sy ).

            IF ls_sy-msgty CA 'EWSI'.
            ELSE.
              ls_sy-msgty = 'I'.
            ENDIF.
            MESSAGE ID ls_sy-msgid TYPE ls_sy-msgty NUMBER ls_sy-msgno
            WITH ls_sy-msgv1 ls_sy-msgv2 ls_sy-msgv3 ls_sy-msgv4.


        ENDCASE.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    ENDTRY.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>INFO
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_DEPTH                       TYPE        ANY(optional)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<---] EV_DATE                        TYPE        CLIKE
* | [<---] EV_TIME                        TYPE        CLIKE
* | [<---] EV_TIMESTAMPL                  TYPE        TIMESTAMPL
* | [<---] EV_TIME_ISO8601                TYPE        CLIKE
* | [<---] EV_TIME_WRITE                  TYPE        STRING
* | [<---] EV_DATE_WRITE                  TYPE        STRING
* | [<---] EV_USERNAME                    TYPE        STRING
* | [<---] EV_IP_ADRESS                   TYPE        STRING
* | [<---] EV_IS_GUI_ACTIVE               TYPE        ABAP_BOOL
* | [<---] EV_SY_MSGTEXT                  TYPE        STRING
* | [<---] ES_CALLSTACK                   TYPE        ABAP_CALLSTACK_LINE
* | [<---] ET_CALLSTACK                   TYPE        ABAP_CALLSTACK
* | [<---] EV_REPID                       TYPE        CLIKE
* | [<---] EV_METHOD                      TYPE        CLIKE
* | [<---] ET_DEQUEUE_TABLE               TYPE        WLF_SEQG3_TAB
* | [<---] EV_WORK_PROCESS_ID             TYPE        STRING
* | [<---] ET_SOURCE_CODE                 TYPE        STRINGTAB
* | [<---] EV_LOG_INFO                    TYPE        STRING
* | [<---] E_MOCK                         TYPE        ANY
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD info.

    " diese Methode ermittelt diverse Informationen

    FREE es_callstack.
    FREE ev_log_info.
    FREE et_callstack.
    FREE ev_method.
    FREE ev_work_process_id.
    FREE ev_repid.

    TRY.

        IF ev_date IS SUPPLIED
        OR ev_time IS SUPPLIED
        OR ev_timestampl IS SUPPLIED
        OR ev_time_iso8601 IS SUPPLIED.

          GET TIME STAMP FIELD ev_timestampl.
          CONVERT TIME STAMP ev_timestampl
          TIME ZONE sy-zonlo
          INTO DATE ev_date
          TIME ev_time.

          IF ev_time_iso8601 IS SUPPLIED.
            "20171028163427.1811670
            "2017-05-31T23:59:59

            DATA:
                    lv_time_string TYPE char200.

            lv_time_string =  ev_timestampl.
            SHIFT lv_time_string LEFT DELETING LEADING ' '.
            CONCATENATE
            lv_time_string(4) '-' lv_time_string+4(2) '-' lv_time_string+6(2) 'T'
            ev_time(2) ':' ev_time+2(2) ':'  ev_time+4(2) lv_time_string+14(7)
             INTO lv_time_string.

            ev_time_iso8601 = lv_time_string.
*        SHIFT iv_date_time LEFT DELETING LEADING ' '.
*        CONCATENATE iv_date_time(4)  iv_date_time+5(2)  iv_date_time+8(2)     INTO lv_date.
*        CONCATENATE iv_date_time+11(2) iv_date_time+14(2) iv_date_time+17(2) INTO lv_time.
          ENDIF.


        ENDIF.

        IF e_mock IS SUPPLIED.

          lcl_help=>mock_data( IMPORTING e_mock = e_mock ).

        ENDIF.

        DATA: lv_char20 TYPE char20.

        IF ev_date_write IS SUPPLIED.
          WRITE sy-datum TO lv_char20.
          ev_date_write = lv_char20.
        ENDIF.

        IF ev_time_write IS SUPPLIED.
          WRITE sy-uzeit TO lv_char20.
          ev_time_write = lv_char20.
        ENDIF.

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        IF ev_is_gui_active IS SUPPLIED.

          DATA:
        lv_gui TYPE char1.

          ev_is_gui_active = abap_false.

          IF sy-batch = abap_false
            AND sy-binpt = abap_false.

            CALL FUNCTION 'RFC_IS_GUI_ON'
              IMPORTING
                on = lv_gui.

            IF lv_gui = 'Y'.
              ev_is_gui_active = abap_true.
            ENDIF.
          ENDIF.
        ENDIF.

        IF ev_work_process_id IS SUPPLIED.

          DATA:
            lv_wp_no TYPE wpno.

          CALL FUNCTION 'TH_GET_OWN_WP_NO'
            IMPORTING
*             subrc =     " Return Code of the Function Module
              wp_no = lv_wp_no    " Separate Work Process Number
*             wp_pid   =     " PID of Separate Work Process
*             wp_index =
            .
          ev_work_process_id = lv_wp_no.

        ENDIF.


        IF ev_username IS SUPPLIED.
          ev_username = sy-uname.
        ENDIF.

        """""""""""""""""""""""""""""""
        IF es_callstack IS SUPPLIED OR et_callstack IS SUPPLIED OR et_source_code IS SUPPLIED
            OR ev_repid IS SUPPLIED OR ev_method IS SUPPLIED.

          CALL FUNCTION 'SYSTEM_CALLSTACK'
            EXPORTING
              max_level = '0'
            IMPORTING
              callstack = et_callstack.

          "delete this method
          DELETE et_callstack INDEX 1.
          IF iv_depth IS NOT INITIAL.
            DATA: lv_count TYPE i.
            lv_count = iv_depth.
            DO lv_count TIMES.
              DELETE et_callstack INDEX 1.
            ENDDO.
          ENDIF.

          READ TABLE et_callstack INTO es_callstack
              INDEX 1.

          ev_repid = es_callstack-mainprogram.
          ev_method = es_callstack-blockname.

        ENDIF.

        IF et_source_code IS SUPPLIED.

          DATA:
            lo_wb_source    TYPE REF TO cl_wb_source,
            lv_name_program TYPE trdir-name.

          lv_name_program = es_callstack-include. "iv_name_program.

          CREATE OBJECT lo_wb_source
            EXPORTING
              source_name = lv_name_program.    " physical name.


          lo_wb_source->read_source(
            IMPORTING
              source_tab = et_source_code "Source Code
            EXCEPTIONS
              cancelled                     = 1
              not_found                     = 2
              read_protected                = 3
              enhancement_locked            = 4
              OTHERS                        = 6 ).
          IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma

        ENDIF.


        IF et_dequeue_table IS SUPPLIED.

          et_dequeue_table =  lcl_help=>lock_get_snap( ).

        ENDIF.





        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>ITAB
* +-------------------------------------------------------------------------------------------------+
* | [--->] DELETE_DUPLICATES              TYPE        ABAP_BOOL(optional)
* | [--->] CHANGE_SEQUENCE                TYPE        ABAP_BOOL(optional)
* | [--->] MOVE_CORRESPONDING             TYPE        ABAP_BOOL(optional)
* | [--->] MERGE                          TYPE        ABAP_BOOL(optional)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<-->] CT_TAB                         TYPE        STANDARD TABLE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD itab.

    TRY.

        FIELD-SYMBOLS:
          <ls_tab>    TYPE any,
          <ls_tab_in> TYPE any,
          <lt_result> TYPE STANDARD TABLE.

        DATA:
          lt_r_tab TYPE REF TO data.

        CREATE DATA lt_r_tab
         LIKE ct_tab.

        ASSIGN lt_r_tab->* TO <lt_result>.


        CASE abap_true.

          WHEN change_sequence.

            WHILE ct_tab IS NOT INITIAL.
              APPEND INITIAL LINE TO <lt_result> ASSIGNING <ls_tab>.

              READ TABLE ct_tab ASSIGNING <ls_tab_in>
               INDEX lines( ct_tab ).
              <ls_tab> = <ls_tab_in>.

              DELETE ct_tab INDEX lines( ct_tab ).
            ENDWHILE.


          WHEN delete_duplicates.

            SORT ct_tab.
            DELETE ADJACENT DUPLICATES FROM ct_tab COMPARING ALL FIELDS.
            <lt_result> = ct_tab.

          WHEN OTHERS.
            raise('CX_WRONG_CALL_OF_METHOD').
        ENDCASE.


        FREE ct_tab.
        ct_tab = <lt_result>.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>JSON
* +-------------------------------------------------------------------------------------------------+
* | [--->] JSON_2                         TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] I_ANY                          TYPE        ANY(optional)
* | [--->] I_ANY2                         TYPE        ANY(optional)
* | [--->] I_ANY3                         TYPE        ANY(optional)
* | [--->] I_ANY4                         TYPE        ANY(optional)
* | [--->] I_ANY5                         TYPE        ANY(optional)
* | [--->] IT_R_DATA                      TYPE        TY-T_REF_DATA(optional)
* | [--->] IT_R_OBJECT                    TYPE        TY-T_REF_OBJ(optional)
* | [<---] E_ANY1                         TYPE        ANY
* | [<---] E_ANY2                         TYPE        ANY
* | [<---] E_ANY3                         TYPE        ANY
* | [<---] E_ANY4                         TYPE        ANY
* | [<---] E_ANY5                         TYPE        ANY
* | [<---] E_REF1                         TYPE        ANY
* | [<---] E_TYPE1                        TYPE        ANY
* | [<---] E_KIND1                        TYPE        ANY
* | [<---] E_REF2                         TYPE        ANY
* | [<---] E_TYPE2                        TYPE        ANY
* | [<---] E_KIND2                        TYPE        ANY
* | [<---] E_REF3                         TYPE        ANY
* | [<---] E_TYPE3                        TYPE        ANY
* | [<---] E_KIND3                        TYPE        ANY
* | [<---] E_REF4                         TYPE        ANY
* | [<---] E_TYPE4                        TYPE        ANY
* | [<---] E_KIND4                        TYPE        ANY
* | [<---] E_REF5                         TYPE        ANY
* | [<---] E_TYPE5                        TYPE        ANY
* | [<---] E_KIND5                        TYPE        ANY
* | [<---] ET_R_DATA                      TYPE        TY-T_REF_DATA
* | [<---] ET_R_OBJECT                    TYPE        TY-T_REF_OBJ
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD json.

    DATA lt_tab TYPE STANDARD TABLE OF string.
    DATA lv_json_line TYPE string.
    DATA lv_type TYPE string.
    DATA lv_kind TYPE string.
    FIELD-SYMBOLS <any> TYPE any.

    IF abap_true = json_2.

      IF i_any IS INITIAL.
        raise('ZCX_INPUT_DATA_IS_INITIAL_ERROR').
      ENDIF.

      trans(
        EXPORTING
          json_2             = 'X'
          i_any              = i_any
        IMPORTING
          e_result           = lt_tab
      ).

      FREE lv_json_line.
      IF e_any1 IS SUPPLIED OR e_ref1 IS SUPPLIED OR e_type1 IS SUPPLIED OR e_kind1 IS SUPPLIED.
        READ TABLE lt_tab INTO lv_json_line
            INDEX 1.
        raise_check(  read_table = 'X' ).

        READ TABLE lt_tab INTO lv_kind
      INDEX 2.
        raise_check(  read_table = 'X' ).
        READ TABLE lt_tab INTO lv_type
            INDEX 3.
        raise_check(  read_table = 'X' ).

        e_type1 = lv_type.
        e_kind1 = lv_kind.

        IF e_any1 IS SUPPLIED.

          trans(
    EXPORTING
      json_2             = 'X'
      i_any              = lv_json_line
    IMPORTING
      e_result           = e_any1
  ).

        ENDIF.

        IF e_ref1 IS SUPPLIED.
          CASE lv_kind.

            WHEN cl_abap_datadescr=>kind_ref.

              trans(
                  EXPORTING
                      json_2 = 'X'
                      i_any  = lv_json_line
                  IMPORTING
                      e_result = e_ref1
                          ).

            WHEN OTHERS.

              CREATE DATA e_ref1
                TYPE (lv_type).

              ASSIGN e_ref1->* TO <any>.

              trans(
               EXPORTING
                 json_2             = 'X'
                 i_any              = lv_json_line
               IMPORTING
                 e_result           = <any>
             ).

          ENDCASE.

        ENDIF.

      ENDIF.

      FREE lv_json_line.
      IF e_any2 IS SUPPLIED OR e_ref2 IS SUPPLIED OR e_type2 IS SUPPLIED OR e_kind2 IS SUPPLIED..
        READ TABLE lt_tab INTO lv_json_line
            INDEX 4.
        raise_check(  read_table = 'X' ).

        READ TABLE lt_tab INTO lv_kind
      INDEX 5.
        raise_check(  read_table = 'X' ).
        READ TABLE lt_tab INTO lv_type
            INDEX 6.
        raise_check(  read_table = 'X' ).

        e_type2 = lv_type.
        e_kind2 = lv_kind.

        IF e_any2 IS SUPPLIED.

          trans(
    EXPORTING
      json_2             = 'X'
      i_any              = lv_json_line
    IMPORTING
      e_result           = e_any2
  ).

        ENDIF.

        IF e_ref2 IS SUPPLIED.
          CASE lv_kind.

            WHEN cl_abap_datadescr=>kind_ref.

              trans(
                  EXPORTING
                      json_2 = 'X'
                      i_any  = lv_json_line
                  IMPORTING
                      e_result = e_ref2
                          ).

            WHEN OTHERS.

              CREATE DATA e_ref2
                TYPE (lv_type).

              ASSIGN e_ref2->* TO <any>.

              trans(
               EXPORTING
                 json_2             = 'X'
                 i_any              = lv_json_line
               IMPORTING
                 e_result           = <any>
             ).

          ENDCASE.

        ENDIF.

      ENDIF.

      FREE lv_json_line.
      IF e_any3 IS SUPPLIED OR e_ref3 IS SUPPLIED OR e_type3 IS SUPPLIED OR e_kind3 IS SUPPLIED.
        READ TABLE lt_tab INTO lv_json_line
            INDEX 7.
        raise_check(  read_table = 'X' ).

        READ TABLE lt_tab INTO lv_kind
      INDEX 8.
        raise_check(  read_table = 'X' ).
        READ TABLE lt_tab INTO lv_type
            INDEX 9.
        raise_check(  read_table = 'X' ).

        e_type3 = lv_type.
        e_kind3 = lv_kind.

        IF e_any3 IS SUPPLIED.

          trans(
    EXPORTING
      json_2             = 'X'
      i_any              = lv_json_line
    IMPORTING
      e_result           = e_any3
  ).

        ENDIF.

        IF e_ref3 IS SUPPLIED.
          CASE lv_kind.

            WHEN cl_abap_datadescr=>kind_ref.

              trans(
                  EXPORTING
                      json_2 = 'X'
                      i_any  = lv_json_line
                  IMPORTING
                      e_result = e_ref3
                          ).

            WHEN OTHERS.

              CREATE DATA e_ref3
                TYPE (lv_type).

              ASSIGN e_ref3->* TO <any>.

              trans(
               EXPORTING
                 json_2             = 'X'
                 i_any              = lv_json_line
               IMPORTING
                 e_result           = <any>
             ).

          ENDCASE.
        ENDIF.
      ENDIF.


      FREE lv_json_line.
      IF e_any4 IS SUPPLIED OR e_ref4 IS SUPPLIED OR e_type4 IS SUPPLIED OR e_kind4 IS SUPPLIED..
        READ TABLE lt_tab INTO lv_json_line
            INDEX 10.
        raise_check(  read_table = 'X' ).

        READ TABLE lt_tab INTO lv_kind
      INDEX 11.
        raise_check(  read_table = 'X' ).
        READ TABLE lt_tab INTO lv_type
            INDEX 12.
        raise_check(  read_table = 'X' ).

        e_type4 = lv_type.
        e_kind4 = lv_kind.

        IF e_any4 IS SUPPLIED.

          trans(
    EXPORTING
      json_2             = 'X'
      i_any              = lv_json_line
    IMPORTING
      e_result           = e_any4
  ).

        ENDIF.

        IF e_ref4 IS SUPPLIED.
          CASE lv_kind.

            WHEN cl_abap_datadescr=>kind_ref.

              trans(
                  EXPORTING
                      json_2 = 'X'
                      i_any  = lv_json_line
                  IMPORTING
                      e_result = e_ref4
                          ).

            WHEN OTHERS.

              CREATE DATA e_ref4
                TYPE (lv_type).

              ASSIGN e_ref4->* TO <any>.

              trans(
               EXPORTING
                 json_2             = 'X'
                 i_any              = lv_json_line
               IMPORTING
                 e_result           = <any>
             ).

          ENDCASE.

        ENDIF.

      ENDIF.

      FREE lv_json_line.
      IF e_any5 IS SUPPLIED OR e_ref5 IS SUPPLIED OR e_type5 IS SUPPLIED OR e_kind5 IS SUPPLIED..
        READ TABLE lt_tab INTO lv_json_line
            INDEX 13.
        raise_check(  read_table = 'X' ).

        READ TABLE lt_tab INTO lv_kind
      INDEX 14.
        raise_check(  read_table = 'X' ).
        READ TABLE lt_tab INTO lv_type
            INDEX 15.
        raise_check(  read_table = 'X' ).

        e_type5 = lv_type.
        e_kind5 = lv_kind.

        IF e_any5 IS SUPPLIED.

          trans(
    EXPORTING
      json_2             = 'X'
      i_any              = lv_json_line
    IMPORTING
      e_result           = e_any5
  ).

        ENDIF.

        IF e_ref5 IS SUPPLIED.
          CASE lv_kind.

            WHEN cl_abap_datadescr=>kind_ref.

              trans(
                  EXPORTING
                      json_2 = 'X'
                      i_any  = lv_json_line
                  IMPORTING
                      e_result = e_ref5
                          ).

            WHEN OTHERS.

              CREATE DATA e_ref5
                TYPE (lv_type).

              ASSIGN e_ref5->* TO <any>.

              trans(
               EXPORTING
                 json_2             = 'X'
                 i_any              = lv_json_line
               IMPORTING
                 e_result           = <any>
             ).

          ENDCASE.

        ENDIF.

      ENDIF.


    ELSE.

      INSERT get( json = 'X' i_any = i_any ) INTO TABLE lt_tab.
      INSERT get( rtti_kind = 'X' i_any = i_any ) INTO TABLE lt_tab.
      INSERT get( rtti_type = 'X' i_any = i_any ) INTO TABLE lt_tab.

      INSERT get( json = 'X' i_any = i_any2 ) INTO TABLE lt_tab.
      INSERT get( rtti_kind = 'X' i_any = i_any2 ) INTO TABLE lt_tab.
      INSERT get( rtti_type = 'X' i_any = i_any2 ) INTO TABLE lt_tab.

      INSERT get( json = 'X' i_any = i_any3 ) INTO TABLE lt_tab.
      INSERT get( rtti_kind = 'X' i_any = i_any3 ) INTO TABLE lt_tab.
      INSERT get( rtti_type = 'X' i_any = i_any3 ) INTO TABLE lt_tab.

      INSERT get( json = 'X' i_any = i_any4 ) INTO TABLE lt_tab.
      INSERT get( rtti_kind = 'X' i_any = i_any4 ) INTO TABLE lt_tab.
      INSERT get( rtti_type = 'X' i_any = i_any4 ) INTO TABLE lt_tab.

      INSERT get( json = 'X' i_any = i_any5 ) INTO TABLE lt_tab.
      INSERT get( rtti_kind = 'X' i_any = i_any5 ) INTO TABLE lt_tab.
      INSERT get( rtti_type = 'X' i_any = i_any5 ) INTO TABLE lt_tab.

      e_any1 = get( json = 'X' i_any = lt_tab ).

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>LOCK
* +-------------------------------------------------------------------------------------------------+
* | [--->] SET                            TYPE        ABAP_BOOL(optional)
* | [--->] FREE                           TYPE        ABAP_BOOL(optional)
* | [--->] SET_SNAP                       TYPE        ABAP_BOOL(optional)
* | [--->] IS_SET                         TYPE        ABAP_BOOL(optional)
* | [--->] A_COLLECT                      TYPE        ABAP_BOOL(optional)
* | [--->] SET_COLLECT                    TYPE        ABAP_BOOL(optional)
* | [--->] FREE_COLLECT                   TYPE        ABAP_BOOL(optional)
* | [--->] I_OBJECT                       TYPE        ANY(optional)
* | [--->] IV_MODE                        TYPE        ANY (default ='E')
* | [--->] IV_SCOPE                       TYPE        ANY (default ='2')
* | [--->] IV_UNAME                       TYPE        ANY (default =SY-UNAME)
* | [--->] I_ANY                          TYPE        ANY (default =SY-MANDT)
* | [--->] I_ANY2                         TYPE        ANY(optional)
* | [--->] I_ANY3                         TYPE        ANY(optional)
* | [--->] I_ANY4                         TYPE        ANY(optional)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<---] ET_SNAP                        TYPE        WLF_SEQG3_TAB
* | [<---] EV_IS_SET                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD lock.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Diese Methode setzt,lÃ¶st, sammelt Sperren
    " snapshot = alle aktuell vorhandenen Sperren
    "
    " Scope = 1 -> sperre wird durch commit gelÃ¶st
    " Scope = 2 -> rollback lÃ¶st auf, commit nicht
    " Scope = 3 ->
    "
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA: lv_any  TYPE string, lv_any2 TYPE string, lv_any3 TYPE string, lv_any4 TYPE string.



    TRY.

        IF et_snap IS SUPPLIED.
          FREE et_snap.
          info( IMPORTING  et_dequeue_table   = et_snap ).
        ENDIF.

        CASE abap_true.

          WHEN set_snap.

            lcl_help=>lock_set_snap( it_snap = i_any ).


          WHEN set.

            lv_any = i_any.
            lv_any2 = i_any2.
            lv_any3 = i_any3.
            lv_any4 = i_any4.

            lcl_help=>lock_set(
              EXPORTING
                iv_val1        = lv_any
                iv_val2        = lv_any2
                iv_val3        = lv_any3
                iv_val4        = lv_any4
                iv_lock        = i_object
                iv_mode        = iv_mode
                iv_scope       = iv_scope
                iv_is_collect  = a_collect ).


          WHEN free.

            lv_any = i_any.
            lv_any2 = i_any2.
            lv_any3 = i_any3.
            lv_any4 = i_any4.

            lcl_help=>lock_free(
              EXPORTING
                iv_val1       = lv_any
                iv_val2       = lv_any2
                iv_val3       = lv_any3
                iv_val4       = lv_any4
                iv_lock       = i_object
                iv_mode       = iv_mode
                iv_scope      = iv_scope  ).


          WHEN set_collect.

            lcl_help=>lock_collect_set( ).

          WHEN free_collect.

            lcl_help=>lock_collect_free(  ).

          WHEN is_set.

            lv_any = i_any.
            lv_any2 = i_any2.
            lv_any3 = i_any3.
            lv_any4 = i_any4.

            lcl_help=>lock_is_set(
              EXPORTING
                iv_val    = lv_any
                iv_val2   = lv_any2
                iv_val3   = lv_any3
                iv_val4   = lv_any4
                iv_lock   = i_object
                iv_unam   = iv_uname
              RECEIVING
                rv_result = ev_is_set
            ).

          WHEN OTHERS.
            raise('CX_WRONG_CALL_OF_METHOD').
        ENDCASE.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_001_00_TEST->LOG
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ANY                          TYPE        ANY(optional)
* | [--->] IV_ID                          TYPE        ANY(optional)
* | [--->] IV_NO                          TYPE        ANY(optional)
* | [--->] IV_TYPE                        TYPE        ANY(optional)
* | [--->] IV_V1                          TYPE        ANY(optional)
* | [--->] IV_V2                          TYPE        ANY(optional)
* | [--->] IV_V3                          TYPE        ANY(optional)
* | [--->] IV_V4                          TYPE        ANY(optional)
* | [--->] USE_T100_ONLY                  TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] IV_LANGU                       TYPE        ANY (default =SY-LANGU)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<-()] R_RESULT                       TYPE        TY-O_EASY_ABAP
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD log.

    DATA ls_balmt TYPE LINE OF ty-t_bal.

    r_result = me.

    msg(
      EXPORTING
        i_any         = i_any
        iv_id         = iv_id
        iv_no         = iv_no
        iv_type       = iv_type
        iv_v1         = iv_v1
        iv_v2         = iv_v2
        iv_v3         = iv_v3
        iv_v4         = iv_v4
*        USE_T100_ONLY = ABAP_FALSE
        iv_langu      = iv_langu
        raise_error   = abap_false
      IMPORTING
*        EV_ID         =
*        EV_NO         =
*        EV_TYPE       =
*        EV_V1         =
*        EV_V2         =
*        EV_V3         =
*        EV_V4         =
*        EV_NOID       =
*        EV_TYNOID     =
        e_any         = ls_balmt
        es_bapi       = DATA(ls_bapi)
*        ET_BAPI       =
    ).

    INSERT ls_bapi INTO TABLE ms_data-t_log.

    info(
      IMPORTING
        ev_timestampl      = ls_balmt-time_stmp
    ).

    INSERT ls_balmt INTO TABLE ms_data-t_bal.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>MSG
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ANY                          TYPE        ANY(optional)
* | [--->] IV_ID                          TYPE        ANY(optional)
* | [--->] IV_NO                          TYPE        ANY(optional)
* | [--->] IV_TYPE                        TYPE        ANY(optional)
* | [--->] IV_V1                          TYPE        ANY(optional)
* | [--->] IV_V2                          TYPE        ANY(optional)
* | [--->] IV_V3                          TYPE        ANY(optional)
* | [--->] IV_V4                          TYPE        ANY(optional)
* | [--->] USE_T100_ONLY                  TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] IV_LANGU                       TYPE        ANY (default =SY-LANGU)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<---] EV_ID                          TYPE        CLIKE
* | [<---] EV_NO                          TYPE        ANY
* | [<---] EV_TYPE                        TYPE        CLIKE
* | [<---] EV_V1                          TYPE        CLIKE
* | [<---] EV_V2                          TYPE        CLIKE
* | [<---] EV_V3                          TYPE        CLIKE
* | [<---] EV_V4                          TYPE        CLIKE
* | [<---] EV_NOID                        TYPE        CLIKE
* | [<---] EV_TYNOID                      TYPE        CLIKE
* | [<---] E_ANY                          TYPE        ANY
* | [<---] E_ANY_ADD                      TYPE        ANY
* | [<---] ES_BAPI                        TYPE        BAPIRET2
* | [<---] ET_BAPI                        TYPE        BAPIRET2_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD msg.

    DATA:
      lt_bapiret_result TYPE bapiret2_tab,
      lt_result         TYPE bapiret2_tab,
      ls_result         TYPE bapiret2,
      lv_msgvar_check   TYPE abap_bool,
      lt_t100           TYPE STANDARD TABLE OF t100,
      ls_t100           TYPE t100.

    FIELD-SYMBOLS: <ls_bapi>   TYPE bapiret2,
                   <ls_result> LIKE LINE OF lt_result.

    "Ermitteln von Messageinformationen aus beliebigen Daten und Objekten
    "Wenn keine Nachrichtenklasse ermittelt werden kann, wird nach Text gesucht
    "Mapping auf beliebige Ausgabeparameter

    TRY.
        """""""""""""""""""""""""""""""""""
        " id/no ermitteln
        IF iv_id IS NOT INITIAL AND iv_no IS NOT INITIAL.
          ls_result-number = iv_no.
          ls_result-id     = iv_id.
          APPEND ls_result TO lt_result.
        ENDIF.

        IF i_any IS NOT INITIAL.

          lt_bapiret_result = lcl_help=>t100_get( EXPORTING i_any = i_any ).
          APPEND LINES OF lt_bapiret_result TO lt_result.
          IF lt_result IS INITIAL AND use_t100_only = abap_false.

            "Text auch mit Klartext ermitteln
            DATA(lo_typedescr) = cl_abap_typedescr=>describe_by_data( i_any ).
*            rtti( EXPORTING i_any = i_any IMPORTING ev_kind = lv_kind_text ).
            IF lo_typedescr->kind = cl_abap_datadescr=>kind_elem.
              "lv_kind_text = cl_abap_datadescr=>kind_elem.
              "Standard umwandeln
              ls_result = lcl_help=>t100_get_w_text(
                                      iv_text = i_any
                                      iv_v1 = iv_v1
                                      iv_v2 = iv_v2
                                      iv_v3 = iv_v3
                                      iv_v4 = iv_v4 ).

              lv_msgvar_check = abap_true.
              APPEND ls_result TO lt_result.

            ENDIF.
          ENDIF.
        ENDIF.


        """""""""""""""""""""""""""""""""""
        " Msginfo gefunden?

        READ TABLE lt_result ASSIGNING <ls_result> INDEX 1.
        IF sy-subrc <> 0.
          RAISE EXCEPTION TYPE lcx_no_check.
        ENDIF.

        "Messagevariablen u Type Ã¼bernehmen
        IF lv_msgvar_check = abap_false.
          IF <ls_result>-message_v1 IS INITIAL AND iv_v1 IS NOT INITIAL.
            <ls_result>-message_v1 = get( print ='X' i_any = iv_v1 ).
          ENDIF.
          IF <ls_result>-message_v2 IS INITIAL AND iv_v2 IS NOT INITIAL..
            <ls_result>-message_v2 = get( print ='X' i_any = iv_v2 ).
          ENDIF.
          IF <ls_result>-message_v3 IS INITIAL AND iv_v3 IS NOT INITIAL..
            <ls_result>-message_v3 = get( print ='X' i_any = iv_v3 ).
          ENDIF.
          IF <ls_result>-message_v4 IS INITIAL AND iv_v4 IS NOT INITIAL..
            <ls_result>-message_v4 = get( print ='X' i_any = iv_v4 ).
          ENDIF.
        ENDIF.
        IF iv_type IS NOT INITIAL.
          <ls_result>-type = iv_type.
        ENDIF.


        """""""""""""""""""""""""""""""""""
        " Text bestimmen

        LOOP AT lt_result ASSIGNING <ls_bapi>.

          <ls_bapi>-id = get( trim_upper_case = 'X' i_any = <ls_bapi>-id ).

          lcl_help=>data_t100_get(
            EXPORTING
              is_bapi  = <ls_bapi>
              iv_langu = iv_langu
              IMPORTING
              es_t100  = ls_t100 ).

          APPEND ls_t100 TO lt_t100.

          <ls_bapi>-message = ls_t100-text.
          <ls_bapi> = lcl_help=>t100_replace_placeholder( <ls_bapi> )  .

          <ls_bapi>-type   = get( trim_upper_case = 'X' i_any = <ls_bapi>-type ).
          <ls_bapi>-id     = get( trim_upper_case = 'X' i_any = <ls_bapi>-id ).
          <ls_bapi>-number = get( trim_upper_case = 'X' i_any = <ls_bapi>-number ).

        ENDLOOP.


        """""""""""""""""""""""""""""""
        " Ausgabe vorbereiten

        FREE et_bapi.

        READ TABLE lt_result ASSIGNING <ls_bapi>
            INDEX 1.
        IF  <ls_bapi>-message IS INITIAL.
*        ev_
        ENDIF.

        es_bapi = <ls_bapi>.
        APPEND LINES OF lt_result TO et_bapi.

        ev_id   = <ls_bapi>-id.
        ev_no   = <ls_bapi>-number.
        ev_v1   = <ls_bapi>-message_v1.
        ev_v2   = <ls_bapi>-message_v2.
        ev_v3   = <ls_bapi>-message_v3.
        ev_v4   = <ls_bapi>-message_v4.

        READ TABLE lt_result INTO ls_result
            WITH KEY type = 'S'.
        IF sy-subrc = 0.
          ev_type = ls_result-type.
        ENDIF.

        READ TABLE lt_result INTO ls_result
            WITH KEY type = 'W'.
        IF sy-subrc = 0.
          ev_type = ls_result-type.
        ENDIF.

        READ TABLE lt_result INTO ls_result
            WITH KEY type = 'E'.
        IF sy-subrc = 0.
          ev_type = ls_result-type.
        ENDIF.

        IF ev_noid IS SUPPLIED.
          ev_noid = <ls_bapi>-number.
          SHIFT ev_noid RIGHT DELETING TRAILING ' '.
          CONCATENATE ev_noid '(' <ls_bapi>-id ')'
            INTO ev_noid.
          TRANSLATE ev_noid TO UPPER CASE.
        ENDIF.

        IF ev_tynoid IS SUPPLIED.
          ev_tynoid = <ls_bapi>-type.
          CONCATENATE ev_tynoid <ls_bapi>-number
              '(' <ls_bapi>-id ')' INTO ev_tynoid.
          TRANSLATE ev_tynoid TO UPPER CASE.
        ENDIF.

        IF e_any IS SUPPLIED.

          FREE e_any.
          lcl_help=>t100_set(
                  EXPORTING it_bapi = lt_result
                  IMPORTING e_any   = e_any ).

        ENDIF.

        IF e_any_add IS SUPPLIED.

          lcl_help=>t100_set(
                  EXPORTING it_bapi = lt_result
                  IMPORTING e_any   = e_any_add ).

        ENDIF.


        "Message Befehl
        LOOP AT lt_result INTO DATA(ls_log_msg).
          "Watchpoint auf Message soll hier stehenbleiben
          sy-msgid = ls_log_msg-id.
          sy-msgno = ls_log_msg-number.
          sy-msgv1 = ls_log_msg-message_v1.
          sy-msgv2 = ls_log_msg-message_v2.
          sy-msgv3 = ls_log_msg-message_v3.
          sy-msgv4 = ls_log_msg-message_v4.
          if sy-msgty CN 'EWSI'.
          sy-msgty = 'I'.
          endif.
          MESSAGE ID sy-msgid
          TYPE sy-msgty
          NUMBER sy-msgno
          WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
          INTO DATA(lv_dummy).
        ENDLOOP.



        """""""""""""""""""""""""""""""
        " error handling

        DATA  lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error(
               ix_root = lx_root raise_error = raise_error
               raise_assert = abap_false ).
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>POPUP
* +-------------------------------------------------------------------------------------------------+
* | [--->] IT_TABLE                       TYPE        STANDARD TABLE
* | [--->] IV_TITLE                       TYPE        CLIKE (default =SY-TITLE)
* | [--->] IV_VERTICAL_LINES              TYPE        ABAP_BOOL (default =ABAP_TRUE)
* | [--->] IV_HEADERS_VISIBLE             TYPE        ABAP_BOOL (default =ABAP_TRUE)
* | [--->] IV_RAISE_DOUBLE_CLICK          TYPE        ABAP_BOOL (default =ABAP_TRUE)
* | [--->] IV_DEFAULT_TOOLBAR             TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] IT_ICON                        TYPE        STRINGTAB(optional)
* | [--->] IT_RAISE_HOTSPOT               TYPE        STRINGTAB(optional)
* | [--->] IT_OUTLEN                      TYPE        NAME2STRINGVALUE_TABLE(optional)
* | [--->] IT_TITLE                       TYPE        NAME2STRINGVALUE_TABLE(optional)
* | [--->] IT_SORT                        TYPE        STRINGTAB(optional)
* | [--->] IT_HIDE                        TYPE        STRINGTAB(optional)
* | [--->] IV_OPTIMIZE_COLWIDTH           TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] IS_LAYOUT                      TYPE        DISVARIANT(optional)
* | [--->] IV_LAYOUT_RESTRICTION          TYPE        ANY(optional)
* | [--->] IV_COL_START                   TYPE        ANY (default ='10')
* | [--->] IV_COL_END                     TYPE        ANY (default ='160')
* | [--->] IV_LINE_START                  TYPE        ANY (default ='1')
* | [--->] IV_LINE_END                    TYPE        ANY (default ='25')
* | [--->] IV_SEL                         TYPE        ANY(optional)
* | [--->] IV_SEL_COL                     TYPE        ANY(optional)
* | [<---] EV_EVENT_TYPE                  TYPE        STRING
* | [<---] EV_EVENT_ROW                   TYPE        I
* | [<---] EV_EVENT_COL                   TYPE        STRING
* | [<---] EV_EVENT_VALUE                 TYPE        STRING
* | [<---] ET_SELECTION                   TYPE        SALV_T_ROW
* | [<---] ER_LINE                        TYPE REF TO DATA
* | [<---] EV_UCOMM                       TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD popup.

    DATA:
      lo_alv        TYPE lcl_help=>ty_o_easy_gui,
      lv_col_start  TYPE i,
      lv_col_end    TYPE i,
      lv_line_start TYPE i,
      lv_line_end   TYPE i.

    IF sy-batch = abap_true.
      RETURN.
    ENDIF.

    CREATE DATA lcl_help=>lr_tab
        LIKE it_table.
    FIELD-SYMBOLS: <lt_tab> TYPE STANDARD TABLE.

    ASSIGN lcl_help=>lr_tab->* TO <lt_tab>.
    <lt_tab> = it_table.
    "PrÃ¼fung ist Tabelle reine Stringtab/clike tab?
    "TODO

    lv_col_start  = iv_col_start .
    lv_col_end    = iv_col_end   .
    lv_line_start = iv_line_start.
    lv_line_end   = iv_line_end  .

    CREATE OBJECT lo_alv
      EXPORTING
        ct_table    = lcl_help=>lr_tab "REF #( it_table )
        raise_event = abap_false.

    lo_alv->set(
        iv_title              = iv_title
        iv_vertical_lines     = iv_vertical_lines
        iv_headers_visible    = iv_headers_visible
        iv_raise_double_click = iv_raise_double_click
        it_raise_hotspot      = it_raise_hotspot
        it_outlen             = it_outlen
*        it_col_setting        = it_col_setting
        is_layout             = is_layout
        it_hide               = it_hide
        iv_default_toolbar    = iv_default_toolbar
        it_sort               = it_sort
        iv_layout_restriction = iv_layout_restriction ).

    lo_alv->ms_salv-o_salv->set_screen_popup(
               start_column = lv_col_start
               end_column   = lv_col_end
               start_line   = lv_line_start
               end_line     = lv_line_end    ).

    IF iv_sel IS NOT INITIAL.
      DATA lv_sel TYPE i.
      lv_sel = iv_sel.
      IF iv_sel_col IS INITIAL.
        lo_alv->ms_salv-o_selections->set_selected_rows( value = VALUE salv_t_row(  (  lv_sel ) ) ).
      ELSE.
        DATA lt_cells TYPE salv_t_cell.
        APPEND INITIAL LINE TO lt_cells ASSIGNING FIELD-SYMBOL(<ls_cell>).
        <ls_cell>-row = lv_sel.
        <ls_cell>-columnname = iv_sel_col.
*        <ls_cell>-
        lo_alv->ms_salv-o_selections->set_selected_cells( value = lt_cells ).
      ENDIF.



    ENDIF.


    lo_alv->display(  ).

    ev_event_type = lo_alv->ms_event-type.
    ev_event_col  = lo_alv->ms_event-col.
    ev_event_row  = lo_alv->ms_event-row.
    ev_event_value = lo_alv->ms_event-value.
    ev_ucomm = lo_alv->ms_event-ucomm.
    er_line = lo_alv->ms_event-line.
    et_selection = lo_alv->ms_event-t_selections.
*    if lo_alv->ms_salv-o_salv is bound.
**        ms_event-t_selections = ms_salv-o_selections->get_selected_rows( ).
*    ev_event_type = lo_alv->ms_event-type.



  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>RAISE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ANY                          TYPE        ANY(optional)
* | [--->] I_HEAD                         TYPE        ANY(optional)
* | [--->] I_PREV                         TYPE        ANY(optional)
* | [--->] I_CODE                         TYPE        ANY(optional)
* | [--->] I_SER_VALUE                    TYPE        ANY(optional)
* | [--->] I_SER_DATA                     TYPE        ANY(optional)
* | [--->] I_ADD_T100                     TYPE        ANY(optional)
* | [--->] I_ADD_WRITE                    TYPE        ANY(optional)
* | [--->] IV_DEPTH                       TYPE        I (default =0)
* | [--->] RESUMABLE                      TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<-()] R_RESULT                       TYPE REF TO CX_NO_CHECK
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD raise.

    " Erzeugen einer Exception
    " Wenn e_result nicht gefuellt -> Methode wirft Exception
    " Diverse Inputparameter werden in Exception abgelegt

    DATA(ls_sy) = sy.

    DATA lx_prev    TYPE REF TO cx_root.
    IF i_prev IS NOT INITIAL.
      lx_prev = raise( i_any =  i_prev iv_depth = iv_depth + 1 ).
    ENDIF.

    DATA lx_result  TYPE REF TO lcx_no_check.
    TRY.
        lx_result ?= i_any.

      CATCH cx_root.

        "Spezialfall: Bei Exception -> seinen Vorgaenger nehmen
        IF lx_prev IS INITIAL.
          TRY.
              lx_prev ?= i_any.
              lx_prev = lx_prev->previous.
            CATCH cx_root.
          ENDTRY.
        ENDIF.

        "ganz neu
        CREATE OBJECT lx_result.

        IF i_any IS INITIAL.
          "DE  >3  279 Es ist ein unerwarteter Fehler aufgetreten
          lx_result->ms_data-s_bapiret = get_msg( iv_id = '>3' iv_no  = '279').
        ELSE.
          lx_result->ms_data-s_bapiret = get_msg( i_any ).
        ENDIF.

        lx_result->ms_data-s_bapiret-type = 'E'.

        msg(
          EXPORTING
            i_any   = lx_result->ms_data-s_bapiret
          IMPORTING
            e_any   = lx_result->if_t100_message~t100key
            ev_noid = lx_result->ms_data-noid
        ).

        lx_result->text         = lx_result->ms_data-s_bapiret-message.
        lx_result->ms_data-s_sy = ls_sy.
        lx_result->ms_data-code = i_code.
        lx_result->ms_data-guid = get( guid16 = 'X' ).
        IF lx_result->ms_data-s_bapiret-message(3) = 'ZCX' OR i_any(2) = 'CX'.
          lx_result->ms_data-code = lx_result->ms_data-s_bapiret-message.
        ENDIF.

        info(
        EXPORTING
          iv_depth = iv_depth + 1
        IMPORTING
          ev_timestampl      = lx_result->ms_data-timestampl
          es_callstack       = lx_result->ms_data-s_callstack
          et_callstack       = lx_result->ms_data-t_callstack
          et_source_code     = lx_result->ms_data-t_source_code
      ).

        "Source Code verkleinern
        DATA ls_dummy   LIKE LINE OF lx_result->ms_data-t_source_code.
        DATA lv_counter TYPE i.
        LOOP AT lx_result->ms_data-t_source_code INTO ls_dummy.
          ADD 1 TO lv_counter.
          IF lv_counter > lx_result->ms_data-s_callstack-line + 5.
            DELETE lx_result->ms_data-t_source_code.
          ENDIF.
        ENDLOOP.
        IF lx_result->ms_data-s_callstack-line - 35 > 0.
          DO lx_result->ms_data-s_callstack-line - 35 TIMES.
            DELETE lx_result->ms_data-t_source_code INDEX 1.
          ENDDO.
        ENDIF.

    ENDTRY.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Previous

    IF lx_prev IS NOT INITIAL.
      lcl_help=>cx_set(
          ix_no_check = lx_result
          ix_prev     = lx_prev
      ).
    ENDIF.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "weitere Infos

    msg( EXPORTING i_any = lx_result IMPORTING e_any = lx_result->texttab ).

    IF i_add_t100 IS NOT INITIAL.
      msg( EXPORTING i_any      = i_add_t100
            IMPORTING e_any_add = lx_result->ms_data-add_t100 ).
    ENDIF.
    IF i_add_write IS NOT INITIAL.
      trans( EXPORTING print = 'X' i_any = i_add_write
             IMPORTING e_result = lx_result->ms_data-add_write   ).
    ENDIF.
    IF i_ser_data IS NOT INITIAL.
      lx_result->ms_data-add_serial = i_ser_data.
    ENDIF.
    IF i_ser_value IS NOT INITIAL.
      lx_result->ms_data-serial_value = i_ser_value.
    ENDIF.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Head

    IF i_head IS NOT INITIAL.
      lx_result ?= raise( i_any = i_head i_prev = lx_result iv_depth = iv_depth + 1 ).
    ENDIF.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " raisen

    IF r_result IS SUPPLIED.
      r_result = lx_result.
    ELSEIF resumable = abap_true.
      RAISE RESUMABLE EXCEPTION lx_result.
    ELSE.
      RAISE EXCEPTION lx_result.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>RAISE_CHECK
* +-------------------------------------------------------------------------------------------------+
* | [--->] READ_TABLE                     TYPE        ABAP_BOOL(optional)
* | [--->] SELECT                         TYPE        ABAP_BOOL(optional)
* | [--->] FUNCTION                       TYPE        ABAP_BOOL(optional)
* | [--->] METHOD                         TYPE        ABAP_BOOL(optional)
* | [--->] FOR_ALL_ENTRIES                TYPE        ABAP_BOOL(optional)
* | [--->] NOT_INITIAL                    TYPE        ABAP_BOOL(optional)
* | [--->] SY_SUBRC                       TYPE        ABAP_BOOL(optional)
* | [--->] SY_MSGTY                       TYPE        ABAP_BOOL(optional)
* | [--->] I_CHECK1                       TYPE        ANY(optional)
* | [--->] I_CHECK2                       TYPE        ANY(optional)
* | [--->] I_CHECK3                       TYPE        ANY(optional)
* | [--->] IS_SY                          TYPE        SY (default =SY)
* | [--->] I_FLAG                         TYPE        ANY(optional)
* | [--->] IV_SUBRC                       TYPE        ANY(optional)
* | [--->] I_VAL1                         TYPE        ANY(optional)
* | [--->] I_VAL2                         TYPE        ANY(optional)
* | [--->] I_VAL3                         TYPE        ANY(optional)
* | [--->] I_VAL4                         TYPE        ANY(optional)
* | [--->] I_CODE                         TYPE        ANY(optional)
* | [--->] I_SER_VALUE                    TYPE        ANY(optional)
* | [--->] I_SER_DATA                     TYPE        ANY(optional)
* | [--->] I_ADD_T100                     TYPE        ANY(optional)
* | [--->] I_ADD_WRITE                    TYPE        ANY(optional)
* | [--->] I_HEAD                         TYPE        ANY(optional)
* | [--->] I_PREV                         TYPE        ANY(optional)
* | [--->] RESUMABLE                      TYPE        ANY (default =ABAP_FALSE)
* | [<-()] R_RESULT                       TYPE REF TO CX_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD raise_check.

    DATA:
      lx_no_check  TYPE REF TO lcx_no_check,
      ls_sy        TYPE sy,
      lv_tabname   TYPE string,
      lv_readtable TYPE string,
      lx_prev      TYPE REF TO lcx_no_check,
      ls_bapi      TYPE bapiret2,
      lv_is_error  TYPE abap_bool,
      lt_add_t100  TYPE bapiret2_tab.
    DATA: lv_v1 TYPE string, lv_v2 TYPE string, lv_v3 TYPE string.


    " Testen ob ein Fehlerfall (je nach Situation) vorliegt
    " Bsp nach Select, Read Table, Call function usw
    " Bei Erkennung eines Fehler wird eine Exception vom Typ no_check geraist
    " Wenn e_result nicht gefuellt -> Methode wirft Exception

    ls_sy = sy.
    IF is_sy IS SUPPLIED.
      ls_sy = is_sy.
    ENDIF.
    lx_no_check ?= raise( iv_depth = 1 ).  "Dummy Exception fuer Codingstelle etc erzeugen


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " PrÃ¼fung und Nachricht erzeugen

    CASE abap_true.

      WHEN sy_msgty.

        IF ls_sy-msgty <> 'E'.
          RETURN.
        ENDIF.

        DATA lv_method TYPE string.
        DATA lv_repid TYPE string.

        info(
          EXPORTING
            iv_depth     = 1
          IMPORTING
             ev_method   = lv_method
             ev_repid    = lv_repid  ).

        "DE CACSCOR 061 SYST: Fehler in Routine &1 &2 &3 &4
        ls_bapi = get_msg( i_any = '061(CACSCOR)' iv_v1 = lv_repid && '(' && lv_method && ')'
                            iv_v2 = ' | ' iv_v3 = 'sy-msgty' iv_v4 = `= E` ). "iv_v4 = ls_sy-subrc ).

        IF ls_sy-msgid IS NOT INITIAL AND ls_sy-msgno IS NOT INITIAL.
          lx_prev ?= raise( i_any = ls_sy iv_depth = 1 i_prev = i_prev ).
        ELSE.
          IF i_prev IS NOT INITIAL.
            lx_prev ?= raise( i_any = i_prev iv_depth = 1 ).
          ENDIF.
        ENDIF.

      WHEN select.

        IF ls_sy-subrc = 0.
          RETURN.
        ENDIF.

        lv_tabname = lcl_help=>source_code_get_selectname(
             it_source = lx_no_check->ms_data-t_source_code ).

        "Select auf Tabelle xy fehlgeschlagen CCSEQ' iv_no = 061
        ls_bapi =  get_msg(
              iv_id         = 'CCSEQ'
              iv_no         = '061'
              iv_v1         = lv_tabname ).

        IF i_prev IS NOT INITIAL.
          lx_prev ?= raise( i_any = i_prev iv_depth = 1 ).
        ENDIF.

      WHEN function.

        "Fehlerkontrolle nach Aufruf Funktionsbaustein
        "Sy Werte korrekt? Nachrichten nicht fehlerhaft? Sonstige Flags?

        DATA lt_t100_tmp TYPE bapiret2_tab.

        msg( EXPORTING i_any = i_check1 IMPORTING et_bapi = lt_t100_tmp ).
        msg( EXPORTING i_any = i_check2 IMPORTING et_bapi = lt_t100_tmp ).
        msg( EXPORTING i_any = i_check3 IMPORTING et_bapi = lt_t100_tmp ).

        "Ist irgendwo ein Fehler uebergeben worden?
        IF  abap_false = check( t100_error = 'X' i_any = lt_t100_tmp  ).

          DO.
            IF ls_sy-subrc <> 0.
              msg( EXPORTING i_any = is_sy iv_type = 'E' IMPORTING et_bapi = lt_t100_tmp ).
              IF lt_t100_tmp IS INITIAL.
                msg( EXPORTING i_any = 'ZCX_SY_SUBRC_NOT_EQUALS_NULL' iv_type = 'E'
                   IMPORTING et_bapi =  lt_t100_tmp ).
              ENDIF.
              EXIT.
            ENDIF.

            IF i_flag = abap_true.
              msg( EXPORTING i_any = 'ZCX_ERROR_FLAG_IS_SET' iv_type = 'E'
                   IMPORTING et_bapi =  lt_t100_tmp ).
              EXIT.
            ENDIF.
            IF iv_subrc <> 0.
              msg( EXPORTING i_any = 'ZCX_SUBRC_IS_NOT_NULL' iv_type = 'E'
                   IMPORTING et_bapi = lt_t100_tmp ).
              EXIT.
            ENDIF.

            IF sy_msgty = abap_true.
              IF abap_true = check( t100_error = 'X' i_any = ls_sy ).
                msg( EXPORTING i_any = ls_sy iv_type = 'E'
                     IMPORTING et_bapi = lt_t100_tmp ).
                EXIT.
              ENDIF.
            ENDIF.

            EXIT.
          ENDDO.

        ENDIF.

        "Wenn keine Fehlersituation -> Abbruch
        IF abap_false = check( t100_error = 'X' i_any =  lt_t100_tmp  ).
          RETURN.
        ENDIF.

        "Nachrichten aufbereiten
        DELETE ADJACENT DUPLICATES FROM lt_t100_tmp COMPARING message.
        lt_add_t100 = lt_t100_tmp.


        IF i_prev IS NOT INITIAL.
          lx_prev ?= raise( i_any = i_prev iv_depth = 1 ).
        ENDIF.

        info(
          EXPORTING
            iv_depth           = 1
          IMPORTING
            et_source_code     = DATA(lt_source_code)
            es_callstack       = DATA(ls_callstack)
        ).


        WHILE lines( lt_source_code ) > ls_callstack-line.
          DELETE lt_source_code INDEX lines( lt_source_code ).
        ENDWHILE.

        lcl_help=>source_code_get_fubaname( EXPORTING
                      it_source = lt_source_code
                        IMPORTING
                        e_v1 = lv_v1
                        e_v2 = lv_v2
                        e_v3 = lv_v3 ).

        "DE 56  704 Fehler beim Aufruf des Funktionsbausteines &
        ls_bapi = get_msg(
              iv_id           = '56'
              iv_no           = '704'
              iv_v1           = lv_v1
              iv_v2           = lv_v2
              iv_v3           = lv_v3 ).



      WHEN read_table.

        IF ls_sy-subrc = 0.
          RETURN.
        ENDIF.

        lv_readtable = lcl_help=>source_code_get_readtable(
               it_source = lx_no_check->ms_data-t_source_code ).

        ""DE  DS  353 Fehler beim Zugriff auf die interne Tabelle & (&)
        ls_bapi = get_msg(
           EXPORTING
             iv_id           = 'DS'
             iv_no           = '353'
             iv_v1           = lv_readtable ).

        IF i_prev IS NOT INITIAL.
          lx_prev ?= raise( i_any = i_prev iv_depth = 1 ).
        ENDIF.


      WHEN not_initial.

        IF i_check1 IS NOT INITIAL.
          RETURN.
        ENDIF.


        "DE EI  251 Der Wert ist initial
        ls_bapi = get_msg( i_any = '251(EI)'  ).
        "iv_v4 = ls_sy-subrc ).

*        DATA lv_descr TYPE string.

*        rtti( EXPORTING i_any = i_check1 iv_langu = iv_langu
*              IMPORTING ev_typedescr = lv_descr ).

*        IF lv_descr IS INITIAL.
*          ls_bapi = get_msg( i_any = 'ZCX_VALUE_IS_INITIAL_ERROR' iv_v1 = lv_descr ).
*        ELSE.
*          ls_bapi = get_msg( i_any = 'ZCX_VALUE_&1_INITIAL_ERROR' iv_v1 = lv_descr ).
*        ENDIF.

        IF i_prev IS NOT INITIAL.
          lx_prev ?= raise( i_any = i_prev iv_depth = 1 ).
        ENDIF.


      WHEN for_all_entries.

*      cx_sy_t

        "Schauen ob Tabelle gefÃ¼llt ist
        IF i_check1 IS NOT INITIAL.
          RETURN.
        ENDIF.

        lv_readtable = lcl_help=>source_code_get_not_initial( ).
        lx_prev ?= raise(  i_any = 'CX_WRONG_SELECT_WITH_FOR_ALL_ENTRIES' i_prev = i_prev ).

        "Select auf Tabelle xy fehlgeschlagen CCSEQ' iv_no = 061
        ls_bapi =  get_msg(
            EXPORTING
              iv_id           = 'CCSEQ'
              iv_no           = '061'
              iv_v1           = lv_readtable ).


      WHEN method.

        IF ls_sy-subrc = 0.
          RETURN.
        ENDIF.

        ls_bapi = get_msg('ZCX_CALL_METHOD_ERROR').
        IF i_prev IS NOT INITIAL.
          lx_prev ?= raise( i_any = i_prev iv_depth = 1 ).
        ENDIF.


      WHEN sy_subrc.

        IF ls_sy-subrc = 0. " AND ls_sy-msgty <> 'E'.
          RETURN.
        ENDIF.

*        DATA lv_method TYPE string.
*        DATA lv_repid TYPE string.

        info(
          EXPORTING
            iv_depth     = 1
          IMPORTING
             ev_method   = lv_method
             ev_repid    = lv_repid  ).

        DATA(lv_name) = cl_oo_classname_service=>get_clsname_by_include( incname = CONV #( lv_repid )  ).

        "DE CACSCOR 061 SYST: Fehler in Routine &1 &2 &3 &4
        ls_bapi = get_msg( i_any = '061(CACSCOR)' iv_v1 = lv_name && '(' && lv_method && ')'
                            iv_v2 = ' | ' iv_v3 = 'sy-subrc' iv_v4 = `<> 0` ). "iv_v4 = ls_sy-subrc ).

        IF ls_sy-msgid IS NOT INITIAL AND ls_sy-msgno IS NOT INITIAL.
          lx_prev ?= raise( i_any = ls_sy iv_depth = 1 i_prev = i_prev ).
        ELSE.
          IF i_prev IS NOT INITIAL.
            lx_prev ?= raise( i_any = i_prev iv_depth = 1 ).
          ENDIF.
        ENDIF.


      WHEN OTHERS.

        IF i_check1 IS NOT INITIAL.
          msg( EXPORTING  i_any   = i_check1
                IMPORTING  et_bapi = lt_add_t100 ).
        ENDIF.

        IF i_check2 IS NOT INITIAL.
          msg( EXPORTING  i_any   = i_check2
                IMPORTING  et_bapi = lt_add_t100   ).
        ENDIF.

        IF i_check3 IS NOT INITIAL.
          msg( EXPORTING  i_any   = i_check3
                IMPORTING  et_bapi = lt_add_t100   ).
        ENDIF.

        IF is_sy IS SUPPLIED.
          msg( EXPORTING  i_any   = is_sy
                IMPORTING  et_bapi = lt_add_t100 ).
          IF is_sy-subrc <> 0.
            lv_is_error = abap_true.
          ENDIF.
        ENDIF.

        IF lv_is_error = abap_false.
          lv_is_error = check( t100_error = 'X' i_any = lt_add_t100  ).
        ENDIF.

        IF lv_is_error = abap_false.
          RETURN.
        ENDIF.

        IF lines( lt_add_t100  ) = 1.
          ls_bapi = get_msg( lt_add_t100[ 1 ] ).
        ELSE.
          "ein unerwarteter Fehler ist aufgetreten
          ls_bapi = get_msg(  iv_id = '>3' iv_no = '279' ).
        ENDIF.
        IF i_prev IS NOT INITIAL.
          lx_prev ?= raise( i_any = i_prev iv_depth = 1 ).
        ENDIF.


    ENDCASE.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Exception erzeugen

    DATA lv_ser_value TYPE string.
    IF i_val1 IS SUPPLIED.
      lv_ser_value = get(  json_deep = 'X' i_any = i_val1 i_any2 = i_val2 i_any3 = i_val3 i_any4 = i_val4 ).
    ELSE.
      lv_ser_value = i_ser_value.
    ENDIF.

    lx_no_check ?=  raise(
         i_any         = ls_bapi
         i_head        = i_head
         i_prev        = i_prev
         iv_depth      = 1
         i_code        = i_code
         i_add_t100    = lt_add_t100
         i_ser_value   = lv_ser_value
         i_ser_data    = i_ser_data
         i_add_write   = i_add_write  ).

    IF r_result IS SUPPLIED.
      r_result = lx_no_check.
    ELSEIF resumable = abap_true.
      RAISE RESUMABLE EXCEPTION lx_no_check.
    ELSE.
      RAISE EXCEPTION lx_no_check.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>RTTI
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ANY                          TYPE        ANY(optional)
* | [--->] IV_NAME                        TYPE        ANY(optional)
* | [--->] I_FNAM_TYPE                    TYPE        ANY(optional)
* | [--->] I_FNAM_TAB                     TYPE        ANY(optional)
* | [--->] IV_LANGU                       TYPE        ANY (default =SY-LANGU)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<---] EV_KIND                        TYPE        STRING
* | [<---] EV_TYPE                        TYPE        STRING
* | [<---] EV_TYPE_IS_DDIC                TYPE        ABAP_BOOL
* | [<---] EV_TYPE_KIND                   TYPE        STRING
* | [<---] EV_TYPE_KIND_IS_C              TYPE        ABAP_BOOL
* | [<---] EV_LINE_KIND                   TYPE        STRING
* | [<---] EV_LINE_TYPE                   TYPE        STRING
* | [<---] EV_LINE_TYPE_KIND              TYPE        STRING
* | [<---] EV_LINE_TYPE_KIND_IS_C         TYPE        ABAP_BOOL
* | [<---] EV_LINE_TYPE_IS_DDIC           TYPE        ABAP_BOOL
* | [<---] EV_REF_DYN                     TYPE        STRING
* | [<---] EV_REF_STAT                    TYPE        STRING
* | [<---] EV_REF_SUPER                   TYPE        STRING
* | [<---] ET_REF_SUPER                   TYPE        STRINGTAB
* | [<---] ET_COMP                        TYPE        ABAP_COMPONENT_TAB
* | [<---] ET_DOMRANGE                    TYPE        STANDARD TABLE
* | [<---] EV_CONVEXIT                    TYPE        CLIKE
* | [<---] EV_IN_DOMR                     TYPE        ABAP_BOOL
* | [<---] EV_FIELDNAME                   TYPE        CLIKE
* | [<---] EV_TYPEDESCR                   TYPE        CLIKE
* | [<---] EV_OUTPUTLEN                   TYPE        I
* | [<---] EV_LENGTH                      TYPE        I
* | [<---] EO_HANDLE                      TYPE REF TO CL_ABAP_DATADESCR
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD rtti.

    DATA:
      ls_dd04l       TYPE dd04l,
      ls_dd01l       TYPE dd01l,
      lo_class       TYPE REF TO cl_abap_classdescr,
      lo_class_super TYPE REF TO cl_abap_classdescr,
      lo_ref         TYPE REF TO cl_abap_refdescr,
      lo_descr_ref   TYPE REF TO cl_abap_typedescr,
      lo_obj         TYPE REF TO cl_abap_objectdescr.

    TRY.

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Kind bestimmen

        DATA: lo_descr TYPE REF TO cl_abap_typedescr.

        IF i_any IS SUPPLIED.
          lo_descr = cl_abap_typedescr=>describe_by_data( i_any ).
        ELSEIF iv_name IS NOT INITIAL.
          cl_abap_typedescr=>describe_by_name(
             EXPORTING
               p_name         = iv_name " Type name
             RECEIVING
               p_descr_ref  =  lo_descr   " Reference to description object
             EXCEPTIONS
               type_not_found = 1
               OTHERS         = 2 ).
          IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
          raise_check( method = 'X' ).
        ELSE.
          raise('CX_METHOD_CALL_W_INPUT_INITIAL').
        ENDIF.

        ev_kind = lo_descr->kind.
*        eo_handle ?= lo_descr.

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "method speed up: nur weiter durchlaufen wenn auch was anderes gebraucht wird

        IF ev_type    IS NOT SUPPLIED
         AND  ev_type_kind         IS NOT SUPPLIED
         AND  ev_type_is_ddic      IS NOT SUPPLIED
         AND  ev_line_kind         IS NOT SUPPLIED
         AND  ev_type_kind_is_c    IS NOT SUPPLIED
         AND  ev_line_type         IS NOT SUPPLIED
         AND  ev_line_type_kind    IS NOT SUPPLIED
         AND  ev_line_type_kind_is_c IS NOT SUPPLIED
         AND  ev_line_type_is_ddic IS NOT SUPPLIED
         AND  ev_ref_dyn           IS NOT SUPPLIED
         AND  ev_ref_stat          IS NOT SUPPLIED
         AND  ev_ref_super         IS NOT SUPPLIED
         AND  et_ref_super         IS NOT SUPPLIED
         AND  !et_comp             IS NOT SUPPLIED
         AND  !et_domrange         IS NOT SUPPLIED
         AND  !ev_convexit         IS NOT SUPPLIED
         AND  !ev_in_domr          IS NOT SUPPLIED
         AND  !ev_fieldname        IS NOT SUPPLIED
         AND  !ev_typedescr        IS NOT SUPPLIED
         AND  !ev_outputlen        IS NOT SUPPLIED
         AND  eo_handle            IS NOT SUPPLIED
         AND  ev_length            IS NOT SUPPLIED.
          RETURN.
        ENDIF.

*        eo_handle = lo_descr->c.

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "Typinfos bestimmen

        CASE lo_descr->kind.

          WHEN cl_abap_typedescr=>kind_elem.

            DATA lo_elem TYPE REF TO cl_abap_elemdescr.
            lo_elem ?=  lo_descr.

*            lo_elem->cr

            ev_type      = lo_elem->get_relative_name(  ).
            ev_type_kind = lo_elem->type_kind.
*            ev_type_ddic = lo_elem->type_
*            lo_elem->
            IF lo_elem->is_ddic_type(  ) = abap_true.
              ev_type_is_ddic = abap_true.
            ENDIF.

            CASE ev_type_kind.
              WHEN cl_abap_typedescr=>typekind_char
              OR cl_abap_typedescr=>typekind_string
              OR cl_abap_typedescr=>typekind_num
              OR cl_abap_typedescr=>typekind_clike
              OR cl_abap_typedescr=>typekind_csequence.

                ev_type_kind_is_c = abap_true.
            ENDCASE.


          WHEN cl_abap_typedescr=>kind_struct.

            DATA lo_struct TYPE REF TO cl_abap_structdescr.
            lo_struct ?= lo_descr.



*              CATCH cx_sy_struct_creation.  " (  ).

            ev_type      = lo_struct->get_relative_name(  ).
            ev_type_kind = lo_struct->type_kind.
            IF lo_struct->is_ddic_type(  ) = abap_true.
              ev_type_is_ddic = abap_true.
            ENDIF.

*            IF et_comp IS SUPPLIED.
            et_comp = lo_struct->get_components(  ).
*            ENDIF.
            eo_handle = lo_struct->create(
                p_components          =  et_comp
*                p_strict              = TRUE
            ).

          WHEN cl_abap_typedescr=>kind_table.

            DATA: lo_tab TYPE REF TO cl_abap_tabledescr.
            lo_tab ?= lo_descr.

*            ev_kind      = lo_tab->kind.
            ev_type      = lo_tab->get_relative_name(  ).
            ev_type_kind = lo_tab->type_kind.
            IF lo_tab->is_ddic_type(  ) = abap_true.
              ev_type_is_ddic = abap_true.
            ENDIF.

            DATA lo_descr_line TYPE REF TO cl_abap_structdescr.

            lo_descr = lo_tab->get_table_line_type(  ).
            ev_line_kind      = lo_descr->kind.
            ev_line_type      = lo_descr->get_relative_name(  ).
            ev_line_type_kind = lo_descr->type_kind.
            IF lo_descr->is_ddic_type(  ) = abap_true.
              ev_line_type_is_ddic = abap_true.
            ENDIF.

*            IF et_comp IS SUPPLIED.
            TRY.
                lo_descr_line ?= lo_descr.

                eo_handle = lo_tab->create(
                    EXPORTING
                      p_line_type          =  lo_descr_line   " Line Type
                  ).
*                     CATCH cx_sy_table_creation.    "

              CATCH cx_root.
            ENDTRY.
*            ENDIF.


            CASE ev_line_type_kind.
              WHEN cl_abap_datadescr=>typekind_csequence
              OR cl_abap_datadescr=>typekind_char
              OR cl_abap_datadescr=>typekind_clike
              OR cl_abap_datadescr=>typekind_string.
                ev_line_type_kind_is_c = abap_true.
            ENDCASE.


          WHEN cl_abap_typedescr=>kind_class.

            lo_class ?= lo_descr.
            ev_ref_stat =  lo_class->absolute_name+7.
            ev_type     = ev_ref_stat.

            IF et_ref_super IS SUPPLIED OR ev_ref_super IS SUPPLIED.

              lo_class_super = lo_class.
              WHILE lo_class_super IS BOUND.
                IF '\CLASS=OBJECT' = lo_class_super->absolute_name.
                  EXIT.
                ENDIF.
                ev_ref_super = lo_class_super->absolute_name+7.
                APPEND ev_ref_super TO et_ref_super.
                lo_class_super = lo_class_super->get_super_class_type(  ).
              ENDWHILE.

            ENDIF.

            RETURN.

          WHEN cl_abap_typedescr=>kind_ref.

            lo_ref ?= cl_abap_typedescr=>describe_by_data( i_any ).
            lo_descr_ref = lo_ref->get_referenced_type(  ).
            ev_ref_stat  = lo_descr_ref->absolute_name+7.
            ev_type      = ev_ref_stat.

            IF et_ref_super IS SUPPLIED OR ev_ref_super IS SUPPLIED.

              lo_class ?= lo_descr_ref.
              lo_class_super = lo_class.
              WHILE lo_class_super IS BOUND.
                IF '\CLASS=OBJECT' = lo_class_super->absolute_name.
                  EXIT.
                ENDIF.
                ev_ref_super = lo_class_super->absolute_name+7.
                APPEND ev_ref_super TO et_ref_super.
                lo_class_super = lo_class_super->get_super_class_type(  ).
              ENDWHILE.

            ENDIF.

            IF i_any IS BOUND AND ( ev_ref_dyn IS SUPPLIED OR et_ref_super IS SUPPLIED ).

              lo_obj ?= cl_abap_typedescr=>describe_by_object_ref( i_any ).
              ev_ref_dyn = lo_obj->absolute_name+7.

              IF et_ref_super IS SUPPLIED.
                FREE et_ref_super.
                lo_class ?= lo_obj.
                lo_class_super = lo_class.
                WHILE lo_class_super IS BOUND.
                  IF '\CLASS=OBJECT' = lo_class_super->absolute_name.
                    EXIT.
                  ENDIF.
                  ev_ref_super = lo_class_super->absolute_name+7.
                  APPEND ev_ref_super TO et_ref_super.
                  lo_class_super = lo_class_super->get_super_class_type(  ).
                ENDWHILE.

              ENDIF.

            ENDIF.

            RETURN.
        ENDCASE.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "method speed up: nur weiter durchlaufen wenn auch was anderes gebraucht wird

        IF    !et_comp             IS NOT SUPPLIED
         AND  !et_domrange         IS NOT SUPPLIED
         AND  !ev_convexit         IS NOT SUPPLIED
         AND  !ev_in_domr          IS NOT SUPPLIED
         AND  !ev_fieldname        IS NOT SUPPLIED
         AND  !ev_typedescr        IS NOT SUPPLIED
         AND  !ev_outputlen        IS NOT SUPPLIED
           AND  ev_length            IS NOT SUPPLIED
         AND  eo_handle            IS NOT SUPPLIED.
          RETURN.
        ENDIF.


        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Zusatzinfos

        IF ev_typedescr IS SUPPLIED.

          ev_typedescr = get( dd04t = 'X' i_any = ev_type iv_langu = iv_langu ).

        ENDIF.


        IF ev_convexit IS SUPPLIED OR ev_outputlen IS SUPPLIED OR ev_length IS SUPPLIED.

          FREE ls_dd04l.
          ls_dd04l-rollname = ev_type.

          READ TABLE ss_db_buffer-t_dd04l INTO ls_dd04l
             WITH KEY rollname = ls_dd04l-rollname.

          IF sy-subrc <> 0.
            SELECT SINGLE * FROM dd04l INTO ls_dd04l
            WHERE rollname = ls_dd04l-rollname.
            "nehmen auch leere werte mit wir das beim nÃ¤chsten mal wissen
            INSERT ls_dd04l INTO TABLE ss_db_buffer-t_dd04l.
          ENDIF.


          FREE ls_dd01l.
          ls_dd01l-domname = ls_dd04l-domname.

          READ TABLE ss_db_buffer-t_dd01l INTO ls_dd01l
             WITH TABLE KEY domname = ls_dd01l-domname.

          IF sy-subrc <> 0.
            SELECT SINGLE * FROM dd01l  INTO ls_dd01l
*             order by domname
            WHERE domname = ls_dd01l-domname.

            "nehmen auch leere werte mit wir das beim nÃ¤chsten mal wissen
            INSERT ls_dd01l INTO TABLE ss_db_buffer-t_dd01l.
          ENDIF.

          ev_convexit = ls_dd01l-convexit.
          ev_outputlen = ls_dd04l-outputlen.
          ev_length    = ls_dd04l-leng.

        ENDIF.


        IF i_fnam_tab IS NOT INITIAL AND i_fnam_type IS NOT INITIAL.

          lcl_help=>rtts_get_fieldname_by_type_tab(
            EXPORTING
              iv_typename = i_fnam_type
              iv_tabname  = i_fnam_tab
            RECEIVING
              r_result    = ev_fieldname
          ).
        ENDIF.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>SCREEN
* +-------------------------------------------------------------------------------------------------+
* | [--->] SELDATA_SET                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] SELDATA_SET_VARI               TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] SELDATA_GET                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] TITLE_SET                      TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] STATUS_SET                     TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] ELEM_SET_BY_DIRTY              TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] ELEM_SET_BY_VALUE              TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] ELEM_GET_BY_VALUE              TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] ELEM_ACTIVE                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] ELEM_INACTIVE                  TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] ELEM_INVISIBLE                 TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [--->] I_ANY                          TYPE        ANY(optional)
* | [--->] I_ANY2                         TYPE        ANY(optional)
* | [--->] IV_REPID                       TYPE        ANY(optional)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<---] E_RESULT                       TYPE        ANY
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD screen.

    DATA:
      lv_name_found TYPE abap_bool,
      lv_name       TYPE string,
      lv_repid      TYPE string.

    FIELD-SYMBOLS:
          <lv_any> TYPE any.

    TRY.

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " diese Methode kann Screen Eigenschaften setzten/lesen
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

        IF iv_repid IS INITIAL.
          info( EXPORTING iv_depth = 1 IMPORTING ev_repid = lv_repid ).
        ELSE.
          lv_repid = iv_repid.
        ENDIF.


        CASE abap_true.


            "F4 Hilfen sind ohne PAI/PBO
            "mit diesem Befehl kÃ¶nnen trotzdem Daten transportiert werden
          WHEN elem_get_by_value.

            DATA: dynpfields   TYPE STANDARD TABLE OF dynpread,
                  ls_dynpfield TYPE dynpread,
                  lv_dynname   TYPE c LENGTH 40.

            lv_dynname = lv_repid.
            ls_dynpfield-fieldname  = i_any.
*            ls_dynpfield-fieldvalue = i_any2.
            APPEND ls_dynpfield TO dynpfields.

            CALL FUNCTION 'DYNP_VALUES_READ'
              EXPORTING
                dyname               = lv_dynname
                dynumb               = sy-dynnr
              TABLES
                dynpfields           = dynpfields
              EXCEPTIONS
                invalid_abapworkarea = 1
                invalid_dynprofield  = 2
                invalid_dynproname   = 3
                invalid_dynpronummer = 4
                invalid_request      = 5
                no_fielddescription  = 6
                undefind_error       = 7
                error_message        = 8
                OTHERS               = 9.
            IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
            raise_check( function = 'X' ).

            READ TABLE dynpfields INDEX 1
                INTO ls_dynpfield.

            e_result = ls_dynpfield-fieldvalue.


            "F4 Hilfen sind ohne PAI/PBO
            "mit diesem Befehl kÃ¶nnen trotzdem Daten transportiert werden
          WHEN elem_set_by_value.

*            DATA: dynpfields   TYPE STANDARD TABLE OF dynpread,
*                  ls_dynpfield TYPE dynpread.
            lv_dynname = lv_repid.
            ls_dynpfield-fieldname  = i_any.
            ls_dynpfield-fieldvalue = i_any2.
            APPEND ls_dynpfield TO dynpfields.

            CALL FUNCTION 'DYNP_VALUES_UPDATE'
              EXPORTING
                dyname               = lv_dynname
                dynumb               = sy-dynnr
              TABLES
                dynpfields           = dynpfields
              EXCEPTIONS
                invalid_abapworkarea = 1
                invalid_dynprofield  = 2
                invalid_dynproname   = 3
                invalid_dynpronummer = 4
                invalid_request      = 5
                no_fielddescription  = 6
                undefind_error       = 7
                error_message        = 8
                OTHERS               = 9.
            IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
            raise_check( function = 'X' ).

            "Felder per Dirty Assign updaten
            "z.Bl. fÃ¼r Comments die nicht in Paramstabelle sind
          WHEN elem_set_by_dirty.

            DATA(lv_assign_addr) = '(' && lv_repid && ')' && i_any.
            ASSIGN (lv_assign_addr) TO <lv_any>.
            IF <lv_any> IS NOT ASSIGNED.
              raise('ZCX_FIELD_NOT_FOUND').
            ENDIF.
            <lv_any> = i_any2.


          WHEN seldata_set.

            lcl_help=>selscreen_set(
              EXPORTING
                i_any       = i_any
                iv_repid    = lv_repid
                raise_error = abap_true ).

          WHEN seldata_set_vari.

            DATA: lt_params2 TYPE rsparams_tt.

            screen(
         EXPORTING
           seldata_get       = 'X'
           i_any             = i_any
           iv_repid          = lv_repid
         IMPORTING
           e_result          = lt_params2 ).

            screen(
             seldata_set       = 'X'
             i_any             = lt_params2 ).


          WHEN seldata_get.

            rtti(
              EXPORTING
                i_any                  = e_result
*                iv_name                =
*                i_fnam_type            =
*                i_fnam_tab             =
*                iv_langu               = SY-LANGU
*                raise_error            = ABAP_FALSE
              IMPORTING
*                ev_kind                =
                ev_type                =  DATA(lv_tab_type)
*                ev_type_is_ddic        =
*                ev_type_kind           =
*                ev_type_kind_is_c      =
*                ev_line_kind           =
                ev_line_type           = DATA(lv_line_type)
*                ev_line_type_kind      =
*                ev_line_type_kind_is_c =
*                ev_line_type_is_ddic   =
*                ev_ref_dyn             =
*                ev_ref_stat            =
*                ev_ref_super           =
*                et_ref_super           =
*                et_comp                =
*                et_domrange            =
*                ev_convexit            =
*                ev_in_domr             =
*                ev_fieldname           =
*                ev_typedescr           =
*                ev_outputlen           =
*                eo_handle              =
            ).


            IF lv_tab_type = 'RSPARAMS_TT'
            OR lv_line_type = 'RSPARAMS'.
*            IF 'RSPARAMS_TT' = get( rtti_type = 'X' i_any = e_result ).
*            or 'RSPARAMS'

              lcl_help=>selscreen_get(
                EXPORTING
                  iv_repid             = lv_repid
                  iv_variant           = i_any
                  raise_error          = abap_true
                IMPORTING
                  et_parameter         = DATA(lt_params) ).

              FIELD-SYMBOLS: <lt_tab> TYPE STANDARD TABLE.
              ASSIGN e_result TO <lt_tab>.

              LOOP AT lt_params INTO DATA(ls_param).
                APPEND INITIAL LINE TO <lt_tab> ASSIGNING FIELD-SYMBOL(<ls_tab>).
                MOVE-CORRESPONDING ls_param TO <ls_tab>.
              ENDLOOP.

            ELSEIF cl_abap_typedescr=>kind_struct = get( rtti_kind = 'X' i_any = e_result ).

              lcl_help=>selscreen_get(
                EXPORTING
                  iv_repid             = lv_repid
                  iv_variant           = i_any
                  raise_error          = abap_true
                IMPORTING
                  es_struc             = e_result ).

            ENDIF.



          WHEN elem_inactive OR elem_active OR elem_invisible.

            lv_name = get( trim_upper_case = 'X' i_any = i_any ).

            LOOP AT SCREEN.

              IF NOT screen-name CS lv_name.
                CONTINUE.
              ENDIF.

              lv_name_found = abap_true.

              CASE abap_true.
                WHEN elem_invisible.
                  screen-active = 1.
                  screen-output = 0.
                  screen-input  = 0.
                  screen-invisible = 1.
                WHEN elem_inactive.
                  screen-input  = 0.
              ENDCASE.

              MODIFY SCREEN.
            ENDLOOP.

            IF lv_name_found = abap_false.
              raise('ZCX_FIELD_NOT_FOUND').
            ENDIF.


          WHEN title_set.

            DATA:
                lv_title TYPE string.

            lv_title = i_any.

            "generischer SAP Title der auch vom cl_salv_table benutzt wird
            SET TITLEBAR '003'
            OF PROGRAM 'SAPLKKBL'
            WITH lv_title.
            raise_check( sy_subrc = 'X' ).
            RETURN.

          WHEN OTHERS.
            raise('ZCX_WRONG_CALL_OF_METHOD').
        ENDCASE.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error( ix_root = lx_root raise_error = raise_error ).
    ENDTRY.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_001_00_TEST=>TRANS
* +-------------------------------------------------------------------------------------------------+
* | [--->] ID                             TYPE        ABAP_BOOL(optional)
* | [--->] XML                            TYPE        ABAP_BOOL(optional)
* | [--->] JSON                           TYPE        ABAP_BOOL(optional)
* | [--->] PRINT                          TYPE        ABAP_BOOL(optional)
* | [--->] ZIP                            TYPE        ABAP_BOOL(optional)
* | [--->] UNZIP                          TYPE        ABAP_BOOL(optional)
* | [--->] TAB_2_TAB                      TYPE        ABAP_BOOL(optional)
* | [--->] XML_2                          TYPE        ABAP_BOOL(optional)
* | [--->] JSON_2                         TYPE        ABAP_BOOL(optional)
* | [--->] VALUE_2_RANGE                  TYPE        ABAP_BOOL(optional)
* | [--->] RANGETAB_2_WHERE               TYPE        ABAP_BOOL(optional)
* | [--->] PARAMS_2_STRUCT                TYPE        ABAP_BOOL(optional)
* | [--->] VALUE_2_RANGETAB               TYPE        ABAP_BOOL(optional)
* | [--->] STRING_2_STRINGTAB             TYPE        ABAP_BOOL(optional)
* | [--->] SPLIT_WORD                     TYPE        ABAP_BOOL(optional)
* | [--->] COPY                           TYPE        ABAP_BOOL(optional)
* | [--->] I_ANY                          TYPE        ANY(optional)
* | [--->] I_ANY2                         TYPE        ANY(optional)
* | [--->] RAISE_ERROR                    TYPE        ABAP_BOOL (default =ABAP_FALSE)
* | [<---] E_RESULT                       TYPE        ANY
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD trans.


    DATA:
      lt_where   TYPE rsds_twhere,
      ls_where   TYPE LINE OF rsds_twhere,
      lt_params  TYPE rsds_trange,
      lv_string  LIKE LINE OF ls_where-where_tab,
      lv_string2 TYPE string.
    FIELD-SYMBOLS: <ls_params>     LIKE LINE OF lt_params,
                   <lt_any>        TYPE STANDARD TABLE,
                   <lt_any_result> TYPE STANDARD TABLE,
                   <ls_any_result> TYPE any,
                   <ls_any>        TYPE any.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " diese Methode tranformiert Eingabe in Ausgabewerte
    " Zippen / Tabellen / Formate usw
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    TRY.

        CASE abap_true.

          WHEN copy.

            DATA lr_data TYPE REF TO data.
            FIELD-SYMBOLS: <lr_data> TYPE STANDARD TABLE.
            CREATE DATA lr_data LIKE i_any.
            ASSIGN lr_data->* TO <lr_data>.
            <lr_data> = i_any.


          WHEN value_2_range.

            DATA lt_range TYPE rsds_selopt_t.
            APPEND INITIAL LINE TO lt_range ASSIGNING FIELD-SYMBOL(<ls_range>).
            <ls_range>-low = i_any.
            <ls_range>-sign = 'I'.
            <ls_range>-option = 'EQ'.
            e_result = lt_range.

          WHEN id.

            "Schreibt Input unverÃ¤ndert in Output
            "verhindert aber dass bei inkompatibilitÃ¤t eine unbehandelbare Ausnahme ensteht
            IF abap_true = check( convertible = 'X' i_any = i_any i_any2 = e_result ).
              e_result = i_any.
            ELSE.
              raise( i_any = get_msg(
                                    i_any = 'ZCX_INPUT_&1_CONVERT_TO_&2_ERROR'
                                    iv_v1 =  get( rtti_kind = 'X' i_any = i_any )
                                    iv_v2 =  get( rtti_kind = 'X' i_any = e_result )
                                      )
                     ).

            ENDIF.

          WHEN params_2_struct.

            lcl_help=>trans_params_2_struc(
              EXPORTING
                it_params = i_any
              IMPORTING
                es_struc  = e_result ).


          WHEN print.
            DATA lt_stringtab TYPE stringtab.
            lv_string2 = lcl_help=>write( i_any ).

            IF get( rtti_kind = 'X' i_any = e_result ) = cl_abap_typedescr=>kind_table.

              SPLIT lv_string2 AT cl_abap_char_utilities=>cr_lf INTO TABLE lt_stringtab.
              e_result = lt_stringtab.

            ELSE.
              e_result  = lv_string2.
            ENDIF.

          WHEN xml_2.

            IF unzip = abap_true.
              trans( EXPORTING unzip = 'X' i_any = i_any
                     IMPORTING e_result = i_any ).

            ENDIF.

            SHIFT i_any LEFT DELETING LEADING ' '.
            lv_string2 = i_any.

            CALL TRANSFORMATION id
             SOURCE XML lv_string2
             RESULT test = e_result.

            RETURN.

          WHEN json.

            DATA(lo_json_writer_t) = cl_sxml_string_writer=>create( type = if_sxml=>co_xt_json ).

            CALL TRANSFORMATION id
                    SOURCE values = i_any
                    RESULT XML lo_json_writer_t.

            cl_abap_conv_in_ce=>create( )->convert(
              EXPORTING
                input = lo_json_writer_t->get_output( )
              IMPORTING
                data = e_result ).

            IF zip = abap_true.
              trans( EXPORTING zip = 'X' i_any = e_result
                     IMPORTING e_result = e_result ).
            ENDIF.


          WHEN json_2.

            IF unzip = abap_true.
              trans( EXPORTING unzip = 'X' i_any = i_any
                     IMPORTING e_result = i_any ).
            ENDIF.

            CALL TRANSFORMATION id SOURCE XML i_any
                         RESULT values = e_result.

          WHEN tab_2_tab.
            IF cl_abap_datadescr=>kind_table <> get( rtti_kind = 'X' i_any = i_any )
            OR cl_abap_datadescr=>kind_table <> get( rtti_kind = 'X' i_any = e_result ).
              raise( 'ZCX_WRONG_INPUT_TYPE').
            ENDIF.

            ASSIGN i_any   TO <lt_any>.
            ASSIGN e_result TO <lt_any_result>.

            FREE <lt_any_result>.
            LOOP AT <lt_any> ASSIGNING <ls_any>.
              APPEND INITIAL LINE TO <lt_any_result> ASSIGNING <ls_any_result>.
              conv( EXPORTING i_any = <ls_any> IMPORTING r_result =  <ls_any_result> ).
            ENDLOOP.

          WHEN string_2_stringtab.

            IF split_word = abap_true.


              DATA:
                lv_line   TYPE c LENGTH 1000,
                lv_length TYPE i.
*                lt_stringtab TYPE stringtab.

              lv_line = i_any.
              lv_length = i_any2.
              ##FM_SUBRC_OK
              CALL FUNCTION 'RKD_WORD_WRAP'
                EXPORTING
                  textline            = lv_line   " Source text line
                  outputlen           = lv_length   " Maximum output line width
                TABLES
                  out_lines           = lt_stringtab  " All output lines as table
                EXCEPTIONS
                  outputlen_too_large = 1
                  error_message       = 2
                  OTHERS              = 3.
              raise_check( function = 'X' ).

              e_result = lt_stringtab.

              RETURN.
            ELSE.
              DATA lv_text TYPE string.
              lv_length = i_any2.
              lv_text = i_any.
              DO.
                APPEND INITIAL LINE TO lt_stringtab ASSIGNING FIELD-SYMBOL(<lv_string>).
                TRY.
                    <lv_string> = lv_text(lv_length).
                  CATCH cx_root.
                    EXIT.
                ENDTRY.
              ENDDO.


            ENDIF.


            ASSIGN i_any   TO <lt_any>.
            ASSIGN e_result TO <lt_any_result>.

            LOOP AT <lt_any> ASSIGNING <ls_any>.
              APPEND INITIAL LINE TO <lt_any_result> ASSIGNING <ls_any_result>.
              <ls_any_result> = <ls_any>.
            ENDLOOP.


          WHEN  xml.
*            DATA lv_string2 TYPE string.
            FREE lv_string2.

            CALL TRANSFORMATION id
               OPTIONS data_refs = 'heap-or-create'
               SOURCE test =  i_any
               RESULT XML lv_string2.

            e_result = lv_string2.

            IF zip = abap_true.
              trans( EXPORTING zip = 'X' i_any = e_result
                     IMPORTING e_result = e_result ).

            ENDIF.

            RETURN.

          WHEN zip.

            DATA:
*              lv_string2 TYPE string,#
              lv_xstring TYPE xstring.

            IF check( convertible = 'X' i_any = lv_string2 i_any2 = i_any ) = abap_true.
              lv_string2 = i_any.
            ELSE.
              raise('WRONG_INPUT_TYPE').
            ENDIF.

            cl_abap_gzip=>compress_text(
            EXPORTING text_in  = lv_string2
            IMPORTING gzip_out = lv_xstring ).

            e_result = lv_xstring.
            RETURN.

          WHEN unzip.

            lv_xstring = i_any.

            cl_abap_gzip=>decompress_text(
               EXPORTING gzip_in  = lv_xstring   " Eingabe der gezippten Daten
               IMPORTING text_out = lv_string2 ). " Dekomprimierte Ausgabe

            e_result = lv_string2.
            RETURN.

          WHEN rangetab_2_where.

            APPEND INITIAL LINE TO lt_params ASSIGNING <ls_params>.

            <ls_params>-tablename = 'SPFLI'.
            <ls_params>-frange_t = i_any.

            CALL FUNCTION 'FREE_SELECTIONS_RANGE_2_WHERE'
              EXPORTING
                field_ranges  = lt_params   " Selections in the form RSDS_TRANGE
              IMPORTING
                where_clauses = lt_where.   " Selections in the form RSDS_TWHERE

            READ TABLE lt_where INDEX 1
                INTO ls_where.

            LOOP AT ls_where-where_tab INTO lv_string.

              CONCATENATE
                  e_result
                  lv_string
                  INTO e_result.

            ENDLOOP.


*          WHEN any_2_chartab.
*
*            ASSIGN i_any   TO <lt_any>.
*            ASSIGN e_result TO <lt_any_result>.
*
*            LOOP AT <lt_any> ASSIGNING <ls_any>.
*              APPEND INITIAL LINE TO <lt_any_result> ASSIGNING <ls_any_result>.
*              <ls_any_result> = <ls_any>.
*            ENDLOOP.

          WHEN OTHERS. "Selbst transformation finden

            rtti( EXPORTING i_any   = i_any
                  IMPORTING ev_kind = DATA(lv_kind_in) ).

            rtti( EXPORTING i_any    = e_result
                  IMPORTING ev_kind = DATA(lv_kind_out) ).

            IF lv_kind_in = lv_kind_out AND lv_kind_in = cl_abap_typedescr=>kind_table.
              trans( EXPORTING tab_2_tab = 'X' i_any = i_any
                     IMPORTING e_result = e_result ).
              RETURN.
            ENDIF.


            IF abap_true = check( convertible = 'X' i_any = lt_range i_any2 = e_result )
                AND abap_true = check( rtti_type_kind_cseq = 'X' i_any = i_any ).

              trans( EXPORTING value_2_range = 'X' i_any = i_any
                     IMPORTING e_result = e_result ).

              RETURN.
            ENDIF.

*            data(lv_type_in)

            IF 'SOLIX_TAB' = get( rtti_type = 'X' i_any = i_any )
               AND 'XSTRING' = get( rtti_type = 'X' i_any = e_result ).

              e_result = lcl_help=>convert_binary_2_xstring( i_any ).

              RETURN.
            ENDIF.

            IF 'XSTRING' = get( rtti_type = 'X' i_any = i_any )
             AND 'SOLIX_TAB' = get( rtti_type = 'X' i_any = e_result ).

              e_result =  lcl_help=>convert_xstring_2_binary( iv_input = i_any ).
              RETURN.
            ENDIF.

        ENDCASE.


        DATA lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        lcl_help=>handle_error( ix_root = lx_root raise_error = raise_error ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
