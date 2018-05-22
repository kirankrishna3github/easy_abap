
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" abap_utility v0.1.5
"
" date of last change: 2018-05-050T17:03Z
"
" works from AS ABAP 7.0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

TYPE-POOLS: abap, vsep, szal, v56e.



CLASS:
   lcl_help_txt          DEFINITION DEFERRED,
   lcl_help_abap          DEFINITION DEFERRED,
   lcl_help_t100          DEFINITION DEFERRED,
   lcx_help_exception     DEFINITION DEFERRED,
   lcl_help_error         DEFINITION DEFERRED,
   lcl_help_check_a_raise DEFINITION DEFERRED.

CLASS:
   lcl_help_string  DEFINITION DEFERRED,
   lcl_help_time    DEFINITION DEFERRED,
   lcl_help_itab    DEFINITION DEFERRED,
   lcl_help_service DEFINITION DEFERRED,
   lcl_help_data    DEFINITION DEFERRED,
   lcl_help_bl      DEFINITION DEFERRED.
*   lcl_help_log     DEFINITION DEFERRED.

CLASS:
  lcl_help_gui             DEFINITION DEFERRED,
  lcl_help_gui_cfw         DEFINITION DEFERRED,
  lcl_help_gui_alv          DEFINITION DEFERRED.
*  lcl_help_gui_disp_log    DEFINITION DEFERRED.

CLASS  lcl_help_factory_all DEFINITION DEFERRED.


"! Globale Typen des Includes
INTERFACE lif_help_top.

  TYPES:
    BEGIN OF ty_s_types,

      o_help_factory_all      TYPE REF TO lcl_help_factory_all,

*      o_help_factory_base     TYPE REF TO lcl_help_factory_base,
      o_help_txt              TYPE REF TO lcl_help_txt,
      o_help_abap             TYPE REF TO lcl_help_abap,
      o_help_cx_factory       TYPE REF TO lcl_help_error,
      o_help_cx_check_a_raise TYPE REF TO lcl_help_check_a_raise,
      o_help_t100             TYPE REF TO lcl_help_t100,
      x_help_error            TYPE REF TO lcx_help_exception,

      o_help_bl               TYPE REF TO lcl_help_bl,
      o_help_service          TYPE REF TO lcl_help_service,
      o_help_data             TYPE REF TO lcl_help_data,
      o_help_string           TYPE REF TO lcl_help_string,
      o_help_itab             TYPE REF TO lcl_help_itab,
      o_help_time             TYPE REF TO lcl_help_time,
*      o_help_log              TYPE REF TO lcl_help_log,

      o_help_gui              TYPE REF TO lcl_help_gui,
*      o_help_popup_log        TYPE REF TO lcl_help_gui_disp_log,
      o_help_gui_cfw          TYPE REF TO lcl_help_gui_cfw,
      o_help_gui_alv          TYPE REF TO lcl_help_gui_alv,

      s_name_value_pair       TYPE crms_email_name_value,
      t_name_value_pair       TYPE STANDARD TABLE OF ty_s_types-s_name_value_pair WITH DEFAULT KEY,

      v_l16_d4                TYPE p LENGTH 16 DECIMALS 4,

      BEGIN OF s_return_base_conv_clike,
        string TYPE string,
        char10 TYPE c LENGTH 10,
        char30 TYPE c LENGTH 30,
        char60 TYPE c LENGTH 60,
      END OF  s_return_base_conv_clike,

      BEGIN OF s_return_base_conv_number,
        int      TYPE i,
        p_l16_d2 TYPE p LENGTH 16 DECIMALS 6,
        p_l16_d4 TYPE p LENGTH 16 DECIMALS 6,
        p_l16_d6 TYPE p LENGTH 16 DECIMALS 6,
      END OF s_return_base_conv_number,

      BEGIN OF s_return_base_time_get,
        timestampl TYPE timestampl,
        timestamp  TYPE timestamp,
        datum      TYPE sy-datum,
        date       TYPE date,
        time       TYPE uzeit,
        year       TYPE i,
        month      TYPE i,
        day        TYPE i,
        hour       TYPE i,
        sec        TYPE i,
        msec       TYPE i,
      END OF s_return_base_time_get,

      BEGIN OF s_t100,
        msgid        TYPE string,
        msgno        TYPE string,
        msgty        TYPE string,
        msgv1        TYPE string,
        msgv2        TYPE string,
        msgv3        TYPE string,
        msgv4        TYPE string,
        t_params     TYPE ty_s_types-t_name_value_pair,
        text_en      TYPE string,
        text_de      TYPE string,
        text_sylangu TYPE string,
        is_db_exist  TYPE abap_bool,
        s_bapiret2   TYPE bapiret2,
      END OF s_t100,

      t_chartab255            TYPE STANDARD TABLE OF char200 WITH DEFAULT KEY, "c length 255,

*      s_serialtab             TYPE zstc_t_srv_error, "zkal_t_error2, "ZSTC_T_SRV_ERROR, "zkal_t_error2, "TODO

    END OF ty_s_types.

  CONSTANTS:
    BEGIN OF cs_constants,
      name_c_class   TYPE string VALUE 'LCX_HELP_EXCEPTION',
      name_serialtab TYPE string VALUE 'ZSTC01_T_ERROR', "ZSTC_T_SRV_ERROR', ""'ZKAL_T_ERROR2', "ZSTC_T_SRV_ERROR',  "TODO


      BEGIN OF s_popup_decide_answer.
  CONSTANTS: button_left   TYPE string VALUE 'LEFT',
             button_center TYPE string VALUE 'CENTER',
             button_cancel TYPE string VALUE 'CANCEL',
             END OF s_popup_decide_answer,

             END OF cs_constants.
ENDINTERFACE.                    "lif_types



CLASS lcl_help_factory_all DEFINITION.

  PUBLIC SECTION.

    INTERFACES:
      lif_help_top.

    ALIASES:
        cs_const FOR lif_help_top~cs_constants,
        type FOR lif_help_top~ty_s_types.

    TYPE-POOLS:
        abap.


    CLASS-DATA:

      so_txt           TYPE type-o_help_txt, "REF TO lcl_help_abap,
      so_abap          TYPE type-o_help_abap,
      so_error         TYPE type-o_help_cx_factory,
      so_check_a_raise TYPE type-o_help_cx_check_a_raise, "REF TO lcl_help_check_a_raise,

      so_data          TYPE type-o_help_data, "REF TO lcl_help_data,
      so_service       TYPE type-o_help_service, "REF TO lcl_help_service,
      so_time          TYPE type-o_help_time,
      so_bl            TYPE type-o_help_bl, "REF TO lcl_help_bl.

      so_gui           TYPE type-o_help_gui, "REF TO lcl_help_gui,
      so_cfw           TYPE type-o_help_gui_cfw, "REF TO lcl_help_gui_cfw,
      so_alv           TYPE type-o_help_gui_alv,
      so_itab          TYPE type-o_help_itab.
*      mo_get           TYPE REF TO lcl_help_factory.

*      so_cust          TYPE REF TO zstc_cl_srv_customizing. "zcl_kal_vertrag_cust. "ZSTC_CL_SRV_CUSTOMIZING.   "zcl_kal_vertrag_cust. "TODO

    CLASS-METHODS:
      class_constructor.

    CLASS-METHODS:
      string
        IMPORTING
          iv_clike         TYPE clike OPTIONAL
        RETURNING
          VALUE(ro_result) TYPE type-o_help_string,

*        service type type-ext-o_help_string,

      table
        IMPORTING
          it_table         TYPE STANDARD TABLE
        RETURNING
          VALUE(ro_result) TYPE type-o_help_itab,


      "!
      "! @parameter iv_time | default now
      "! @parameter ro_result |
      time
        IMPORTING
          iv_time          TYPE timestampl OPTIONAL
        RETURNING
          VALUE(ro_result) TYPE type-o_help_time.


*      log
*        RETURNING
*          VALUE(ro_result) TYPE REF TO lcl_help_log.

*     time_by_date_time
*            RETURNING
*          VALUE(ro_result) TYPE ty_s_types-o_help_time.

  PROTECTED SECTION.

    CLASS-DATA:
      BEGIN OF ss_singleton,
        so_abap    TYPE type-o_help_txt, "lcl_help_abap,
        so_gui     TYPE type-o_help_gui, "lcl_help_gui,
*        so_string TYPE REF TO lcl_help_string,
        so_service TYPE  type-o_help_service,
        so_cfw     TYPE  type-o_help_gui_cfw,
      END OF ss_singleton.

ENDCLASS.                    "lcl_help_factory_all DEFINITION



CLASS lcl_help_base DEFINITION.

  PUBLIC SECTION.

    TYPE-POOLS:
        abap.

    INTERFACES:
      lif_help_top.

    ALIASES:
        cs_const FOR lif_help_top~cs_constants,
        ty_s_type FOR lif_help_top~ty_s_types.

    METHODS constructor.

  PROTECTED SECTION.

    DATA:
       mo_help TYPE ty_s_type-o_help_factory_all.

ENDCLASS.

CLASS lcl_help_base IMPLEMENTATION.

  METHOD constructor.

    CREATE OBJECT mo_help.

  ENDMETHOD.


ENDCLASS.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BEGIN: Basishelper - Exception, T100 Texte, Abap Grundlagen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

CLASS lcl_help_abap DEFINITION INHERITING FROM lcl_help_base
  CREATE PUBLIC .
  PUBLIC SECTION.

    METHODS:

      info_get
        EXPORTING
          VALUE(ev_date)         TYPE clike
          VALUE(ev_time)         TYPE clike
          VALUE(ev_timestampl)   TYPE timestampl
          VALUE(ev_time_iso8601) TYPE clike
          ev_time_write          TYPE clike
          ev_date_write          TYPE clike
          ev_username            TYPE clike
          ev_ip_adress           TYPE string
          ev_is_gui_active       TYPE string
          ev_sy_msgtext          TYPE string
          et_callstack           TYPE string
          ev_repidname           TYPE string
          ev_method              TYPE string
          et_dequeue_table       TYPE string
          ev_work_process_id     TYPE string,


      check_is_error
        IMPORTING
          i_any              TYPE any
        RETURNING
          VALUE(rv_is_error) TYPE abap_bool,

      code_get_callstack
        EXPORTING
          et_callstack    TYPE abap_callstack
          es_callstack    TYPE abap_callstack_line
          es_callstack_1  TYPE abap_callstack_line
          ev_repid        TYPE string
          ev_called_repid TYPE string,

      code_get_select_info
        IMPORTING
          is_called     TYPE abap_callstack_line
        EXPORTING
          ev_name_table TYPE string
        RAISING
          cx_t100_msg,

      code_get_source
        IMPORTING
          iv_name_program     TYPE clike
          iv_number_row       TYPE i OPTIONAL
        RETURNING
          VALUE(rt_stringtab) TYPE stringtab
        RAISING
          cx_t100_msg,

      code_get_function_info
        IMPORTING
          is_called        TYPE abap_callstack_line
        EXPORTING
          ev_name_function TYPE string
          es_stack         TYPE abap_callstack_line,

      code_get_read_table_info
        IMPORTING
          is_called        TYPE abap_callstack_line
        EXPORTING
          ev_name_function TYPE string,

        conv_time
            importing
            iv_timestampl type timestampl
            exporting
                ev_date type datum
                ev_time type uzeit,

      conv_get_clike
        IMPORTING
          iv_value         TYPE simple
        RETURNING
          VALUE(rs_result) TYPE ty_s_type-s_return_base_conv_clike,

      conv_get_number
        IMPORTING
          iv_value         TYPE simple
        RETURNING
          VALUE(rs_result) TYPE ty_s_type-s_return_base_conv_number
        RAISING
          cx_t100_msg,

      conv_get_int
            importing
            i_any type any
            returning
            value(rv_result) type i,

      conv_get_packed_l16d4
        IMPORTING
          iv_value         TYPE simple
        RETURNING
          VALUE(rv_result) TYPE ty_s_type-v_l16_d4
        RAISING
          cx_t100_msg,

      conv_get_string
        IMPORTING
          iv_simple        TYPE simple
        RETURNING
          VALUE(rv_string) TYPE string,

      conv_stringtab_to_chartab
        IMPORTING
          it_data              TYPE stringtab
        RETURNING
          VALUE(rt_chartab255) TYPE ty_s_type-t_chartab255, "et_any_table type STANDARD TABLE,

      conv_conversion_exit
        IMPORTING
          VALUE(iv_value)     TYPE simple
          iv_is_input         TYPE abap_bool DEFAULT abap_true
          VALUE(iv_exit_name) TYPE string OPTIONAL
        EXPORTING
          VALUE(ev_value)     TYPE simple
        RAISING
          cx_t100_msg,

      conv_exit
        IMPORTING
          VALUE(iv_val)    TYPE simple
          iv_name          TYPE string    OPTIONAL
          iv_is_input      TYPE abap_bool DEFAULT abap_true
        RETURNING
          VALUE(rv_result) TYPE string
        RAISING
          cx_t100_msg,

      conv_exit_structure
        IMPORTING
          VALUE(is_val) TYPE any
          iv_is_input   TYPE abap_bool DEFAULT abap_true
        EXPORTING
          es_any        TYPE any
        RAISING
          cx_t100_msg,

      conv_date_to_internal
        IMPORTING
          i_any            TYPE any
        RETURNING
          VALUE(rv_result) TYPE datum
        RAISING
          cx_t100_msg,

      conv_date_to_external
        IMPORTING
          i_any            TYPE any
        RETURNING
          VALUE(rv_result) TYPE string
        RAISING
          cx_t100_msg,

      conv_get_range
        IMPORTING
          VALUE(iv_low)   TYPE simple
          VALUE(iv_high)  TYPE simple OPTIONAL
          iv_sign         TYPE clike DEFAULT 'I'
          iv_option       TYPE clike DEFAULT 'EQ'
          iv_is_conv_exit TYPE abap_bool DEFAULT abap_true
        EXPORTING
          et_range        TYPE STANDARD TABLE
        RAISING
          cx_t100_msg,

      conv_get_range_initial
        IMPORTING
          iv_value    TYPE simple OPTIONAL
          iv_typename TYPE clike OPTIONAL
        EXPORTING
          et_range    TYPE any
        RAISING
          cx_t100_msg .


    METHODS:

      rtts_is_in_domrange
        IMPORTING
          iv_any           TYPE any
        RETURNING
          VALUE(rv_result) TYPE abap_bool,

      rtts_get_domdescr
        IMPORTING
          iv_any           TYPE any
          iv_langu         TYPE sy-langu DEFAULT sy-langu
        RETURNING
          VALUE(rv_result) TYPE string
        RAISING
          cx_t100_msg.

    METHODS rtts_is_column_existing
      IMPORTING
        !it_table       TYPE any
        !iv_col_type    TYPE lvc_s_filt-fieldname
      RETURNING
        VALUE(r_result) TYPE abap_bool .

    METHODS rtts_get_table_component
      IMPORTING
        !it_ref_table       TYPE REF TO data OPTIONAL
        !it_ref_structure   TYPE REF TO data OPTIONAL
      RETURNING
        VALUE(rt_component) TYPE abap_component_tab .

    METHODS rtts_get_info_simple
      IMPORTING
        !iv_element      TYPE simple OPTIONAL
        !iv_name_element TYPE clike OPTIONAL
        !iv_langu        TYPE clike DEFAULT sy-langu
      EXPORTING
        !ev_typename     TYPE string
        !ev_domname      TYPE string
        !ev_convexit     TYPE string
        !ev_outputlen    TYPE i
        !ev_title        TYPE string
        !ev_shortdescr   TYPE string
        !ev_scrtext_s    TYPE string
        !ev_scrtext_m    TYPE string
        !ev_scrtext_l    TYPE string
        !ev_is_ddic      TYPE abap_bool
        !es_fielddescr   TYPE dfies
        ev_basetyp       TYPE string
      RAISING
        cx_t100_msg .

    METHODS rtts_get_info_class
      IMPORTING
        !io_object    TYPE REF TO object
      EXPORTING
        !ev_classname TYPE string .

    METHODS rtts_get_info_any
      IMPORTING
        !i_any   TYPE any
      EXPORTING
        !ev_kind TYPE string
        !ev_type TYPE string .

    METHODS: rtts_is_type_cx_root
      IMPORTING
        !i_any           TYPE any
      RETURNING
        VALUE(rv_result) TYPE abap_bool ,



      "! Wenn Zahl dnn wird auf Komma mit zwei Nachkommo konvertiert
      "! iv_is_rounded im Default wird geschnitten
      number_get_two_decimal_places  IMPORTING iv_string        TYPE string
                                               iv_is_rounded    TYPE abap_bool DEFAULT abap_false
                                     RETURNING VALUE(rv_string) TYPE string,

      number_get_rounded_result IMPORTING iv_input         TYPE any
                                          iv_decimals      TYPE i
                                RETURNING VALUE(rv_string) TYPE string,


      log_add
        IMPORTING
          it_bapiret        TYPE bapiret2_tab
          iv_msgid          TYPE any
          iv_msgno          TYPE any
          iv_type           TYPE any OPTIONAL
          iv_msgv1          TYPE simple OPTIONAL
          iv_msgv2          TYPE simple OPTIONAL
          iv_msgv3          TYPE simple OPTIONAL
          iv_msgv4          TYPE simple OPTIONAL
        RETURNING
          VALUE(rt_bapiret) TYPE bapiret2_tab
        RAISING
          cx_t100_msg,

      log_add_any
        IMPORTING
          it_bapiret        TYPE bapiret2_tab
          i_any             TYPE any
          is_add_previous   TYPE abap_bool DEFAULT abap_true
        RETURNING
          VALUE(rt_bapiret) TYPE bapiret2_tab
        RAISING
          cx_t100_msg,

     log_get_system_info
        importing
          iv_user type abap_bool DEFAULT abap_true
          iv_date type abap_bool default abap_true
          iv_time type abap_bool DEFAULT abap_true
        returning
        value(rv_result) type string,

      itab_move_corresponding_table
        IMPORTING
          it_table TYPE STANDARD TABLE
        EXPORTING
          et_table TYPE STANDARD TABLE,

      sy_init_subrc_a_msg,
      sy_set_msg_by_any
        IMPORTING
                  i_any TYPE any
        RAISING   cx_t100_msg.

    METHODS constructor .


  PROTECTED SECTION.

*    CONSTANTS:
*    cs_t100 LIKE lif_help_t100=>cs_constants VALUE lif_help_t100=>cs_constants.

*    DATA mo_help TYPE ty_s_types-o_help_factory_base.
*    DATA mo_help TYPE ref to lcl_help_factory_all. "ty_s_types-o_help_factory_base.
    METHODS: conv_char_to_num
      IMPORTING
        iv_value  TYPE simple
      EXPORTING
        ev_result TYPE simple
      RAISING
        cx_t100_msg. " ty_s_types-o_help_factory.

    CLASS-DATA:
                st_dd07v_buffer TYPE STANDARD TABLE OF dd07v.


  PRIVATE SECTION.



ENDCLASS.

CLASS lcl_help_txt DEFINITION INHERITING FROM lcl_help_base
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:

      text_get_by_dd04t
        IMPORTING
          iv_val       TYPE clike
          iv_langu     TYPE clike DEFAULT sy-langu
          iv_scrtext   TYPE clike DEFAULT 'M'
        RETURNING
          VALUE(rv_result) TYPE string
        RAISING
          cx_t100_msg,

      text_get_by_all
        IMPORTING
          iv_idno          TYPE any OPTIONAL
          iv_id            TYPE any OPTIONAL
          iv_no            TYPE any OPTIONAL
          iv_text          TYPE any OPTIONAL
          iv_v1            TYPE any OPTIONAL
          iv_v2            TYPE any OPTIONAL
          iv_v3            TYPE any OPTIONAL
          iv_v4            TYPE any  OPTIONAL
          iv_type          TYPE clike OPTIONAL
        RETURNING
          VALUE(rv_result) TYPE string
        RAISING
          cx_t100_msg,



      "! Searchs t100 info and returns text
      "! @parameter i_any | data with t100 info
      "! @parameter iv_langu |
      "! @parameter rv_string | t100 as text
      "! @raising cx_t100_msg | no t100 info found
      text_get_by_any
        IMPORTING
          i_any            TYPE any
          iv_langu         TYPE clike DEFAULT sy-langu
        RETURNING
          VALUE(rv_result) TYPE string
        RAISING
          cx_t100_msg,

      "! Searchs t100 info and returns text
      "! @parameter iv_msgid |
      "! @parameter iv_msgno |
      "! @parameter iv_langu |
      "! @parameter iv_v1 |
      "! @parameter iv_v2 |
      "! @parameter iv_v3 |
      "! @parameter iv_v4 |
      "! @parameter it_params |
      "! @parameter rv_string |
      "! @raising cx_t100_msg | no t100 info found
      text_get_by_msg
        IMPORTING
          VALUE(iv_id)     TYPE simple
          VALUE(iv_no)     TYPE simple
          VALUE(iv_langu)  TYPE clike  DEFAULT sy-langu
          VALUE(iv_v1)     TYPE simple OPTIONAL
          VALUE(iv_v2)     TYPE simple OPTIONAL
          VALUE(iv_v3)     TYPE simple OPTIONAL
          VALUE(iv_v4)     TYPE simple OPTIONAL
          it_params        TYPE ty_s_type-t_name_value_pair OPTIONAL
        RETURNING
          VALUE(rv_result) TYPE string
        RAISING
          cx_t100_msg,

      text_get_by_idno
        IMPORTING
          VALUE(iv_idno)   TYPE simple
          VALUE(iv_langu)  TYPE clike  DEFAULT sy-langu
          VALUE(iv_v1)     TYPE simple OPTIONAL
          VALUE(iv_v2)     TYPE simple OPTIONAL
          VALUE(iv_v3)     TYPE simple OPTIONAL
          VALUE(iv_v4)     TYPE simple OPTIONAL
          it_params        TYPE ty_s_type-t_name_value_pair OPTIONAL
        RETURNING
          VALUE(rv_result) TYPE string
        RAISING
          cx_t100_msg,

      text_get_by_cx
          importing
              ix_root type ref to cx_root
              iv_with_prev type abap_bool default abap_true
              iv_langu type clike default sy-langu
                RETURNING
          VALUE(rv_result) TYPE string
        RAISING
          cx_t100_msg,

      text_get_w_params
        IMPORTING
          iv_text        TYPE clike
          iv_v1          TYPE simple OPTIONAL
          iv_v2          TYPE simple OPTIONAL
          iv_v3          TYPE simple OPTIONAL
          iv_v4          TYPE simple OPTIONAL
          it_params      TYPE ty_s_type-t_name_value_pair OPTIONAL
        RETURNING
          VALUE(rv_text) TYPE string,


      bapiret_get_by_all
        IMPORTING
          iv_idno        TYPE any OPTIONAL
          iv_id          TYPE any OPTIONAL
          iv_no          TYPE any OPTIONAL
          iv_text        TYPE any OPTIONAL
          iv_v1          TYPE any OPTIONAL
          iv_v2          TYPE any OPTIONAL
          iv_v3          TYPE any OPTIONAL
          iv_v4          TYPE any  OPTIONAL
          iv_type        TYPE clike OPTIONAL
        RETURNING
          VALUE(rs_bapi) TYPE bapiret2
        RAISING
          cx_t100_msg,


      bapiret_get_by_any
        IMPORTING
          i_any            TYPE any
        RETURNING
          VALUE(rs_result) TYPE bapiret2
        RAISING
          cx_t100_msg,


      bapirettab_get_by_any
        IMPORTING
          i_any            TYPE any
        RETURNING
          VALUE(rt_result) TYPE bapiret2_tab
        RAISING
          cx_t100_msg,


      "! Returns t100 infos for any input
      "! @parameter i_any | input
      "! @parameter rs_t100 | t100 info
      "! @raising cx_t100_msg | no t100 info found
      info_get_by_any
        IMPORTING
          i_any          TYPE any
        RETURNING
          VALUE(rs_t100) TYPE ty_s_type-s_t100
        RAISING
          cx_t100_msg,

      info_get_by_all
        IMPORTING
          iv_idno        TYPE any OPTIONAL
          iv_id          TYPE any OPTIONAL
          iv_no          TYPE any OPTIONAL
          iv_text        TYPE any OPTIONAL
          iv_v1          TYPE any OPTIONAL
          iv_v2          TYPE any OPTIONAL
          iv_v3          TYPE any OPTIONAL
          iv_v4          TYPE any  OPTIONAL
          iv_type        TYPE clike OPTIONAL
        RETURNING
          VALUE(rs_t100) TYPE ty_s_type-s_t100
        RAISING
          cx_t100_msg,


      write_exception
        IMPORTING
          VALUE(ix_root) TYPE REF TO cx_root
          iv_is_detailed TYPE abap_bool DEFAULT abap_false
        RETURNING
          VALUE(rt_text) TYPE stringtab ,

      write_itab_header
        IMPORTING
          it_any           TYPE ANY TABLE
        RETURNING
          VALUE(rv_string) TYPE string,

      write_itab_positions
        IMPORTING
          it_any           TYPE STANDARD TABLE
        RETURNING
          VALUE(rt_result) TYPE stringtab,



      write_itab_all
        IMPORTING
          i_any            TYPE STANDARD TABLE
        RETURNING
          VALUE(rt_result) TYPE stringtab,

      write_any
        IMPORTING
          i_any            TYPE any
        RETURNING
          VALUE(rt_result) TYPE stringtab,


      write_val
        IMPORTING
          VALUE(i_any)     TYPE any
        RETURNING
          VALUE(rv_result) TYPE string
        RAISING
          cx_t100_msg,



      "! searchs t100 info and returns type
      "! @parameter i_any |
      "! @parameter rv_result | no t100 info found
      get_worst_type
        IMPORTING
          i_any            TYPE any
        RETURNING
          VALUE(rv_result) TYPE string
        RAISING
          cx_t100_msg,

      "! searchs t100 info, true = found, false = not found
      "! @parameter i_any |
      "! @parameter iv_strict_mode | checks in addition the existance of a db entry
      "! @parameter rv_result |
      is_found
        IMPORTING
          i_any            TYPE any
          iv_strict_mode   TYPE abap_bool DEFAULT abap_false
        RETURNING
          VALUE(rv_result) TYPE abap_bool,

      "! searchs t100 info, true = found, false = not found
      "! @parameter i_any |
      "! @parameter rv_result |
      is_found_a_in_t100
        IMPORTING
          VALUE(iv_msgid)  TYPE simple
          VALUE(iv_msgno)  TYPE simple
        RETURNING
          VALUE(rv_result) TYPE abap_bool,

      "! searchs t100 info, true := msgtyp = E, false := msgtyp ne E
      "! @parameter i_any |
      "! @parameter rv_result | no t100 info found
      is_error
        IMPORTING
          i_any            TYPE any
        RETURNING
          VALUE(rv_result) TYPE abap_bool
        RAISING
          cx_t100_msg.



    METHODS:

      constructor.


    METHODS:


      text_get_w_param
        IMPORTING
          iv_text        TYPE clike
          iv_msgv        TYPE simple OPTIONAL
          iv_position    TYPE i DEFAULT 1
        RETURNING
          VALUE(rv_text) TYPE string,

      text_get_param
        IMPORTING
          it_params        TYPE ty_s_type-t_name_value_pair
          iv_index         TYPE i
        RETURNING
          VALUE(rv_result) TYPE string
        RAISING
          cx_t100_msg,

      text_get_like_t100
        IMPORTING
          iv_text   TYPE clike
          iv_v1     TYPE simple OPTIONAL
          iv_v2     TYPE simple OPTIONAL
          iv_v3     TYPE simple OPTIONAL
          iv_v4     TYPE simple OPTIONAL
        EXPORTING
          ev_msgid  TYPE simple
          ev_msgno  TYPE simple
          ev_v1     TYPE simple
          ev_v2     TYPE simple
          ev_v3     TYPE simple
          ev_v4     TYPE simple
          et_params TYPE ty_s_type-t_name_value_pair,

      text_get_splitted_stringtab
        IMPORTING
          iv_text             TYPE string
          iv_length           TYPE i
        RETURNING
          VALUE(rt_stringtab) TYPE stringtab,

      text_get_placeholder_otr
        IMPORTING
          iv_text          TYPE clike
          iv_separator     TYPE string DEFAULT '&'
        RETURNING
          VALUE(rt_params) TYPE ty_s_type-t_name_value_pair,





      "! Searchs t100 info for every row, if found, adds text to rtab
      "! @parameter it_any |
      "! @parameter iv_langu |
      "! @parameter et_result |
      "! @raising cx_t100_msg | no row with t100 info
      t100_get_texttab_by_any_tab
        IMPORTING
          it_any           TYPE ANY TABLE
          iv_langu         TYPE clike DEFAULT sy-langu
        RETURNING
          VALUE(rt_result) TYPE stringtab
        RAISING
          cx_t100_msg.


  PROTECTED SECTION.

    METHODS cx_get_bapiret2tab
      IMPORTING
        VALUE(ix_root)   TYPE REF TO cx_root
      RETURNING
        VALUE(rt_result) TYPE bapiret2_tab .

class-data:
  st_dd04t type HASHED TABLE OF dd04t with UNIQUE key rollname ddlanguage.


ENDCLASS.                    "lcl_base  DEFINITIO

*----------------------------------------------------------------------*
*       CLASS lcl_help_t100  DEFINITIO
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_t100 DEFINITION INHERITING FROM lcl_help_base
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_info
      IMPORTING
        !i_any     TYPE any
      EXPORTING
        !ev_msgid  TYPE simple
        !ev_msgno  TYPE simple
        !ev_type   TYPE clike
        !et_params TYPE ty_s_type-t_name_value_pair
      RAISING
        cx_t100_msg.
    METHODS get_text
      IMPORTING
        !i_any           TYPE any
        !iv_langu        TYPE clike DEFAULT sy-langu
      RETURNING
        VALUE(rv_string) TYPE string
      RAISING
        cx_t100_msg .
    METHODS get_text_by_t100
      IMPORTING
        VALUE(iv_msgid)  TYPE simple
        VALUE(iv_msgno)  TYPE simple
        VALUE(iv_langu)  TYPE clike DEFAULT sy-langu
        VALUE(iv_v1)     TYPE simple OPTIONAL
        VALUE(iv_v2)     TYPE simple OPTIONAL
        VALUE(iv_v3)     TYPE simple OPTIONAL
        VALUE(iv_v4)     TYPE simple OPTIONAL
        VALUE(iv_v5)     TYPE simple OPTIONAL
        !it_params       TYPE ty_s_type-t_name_value_pair OPTIONAL
      RETURNING
        VALUE(rv_string) TYPE string
      RAISING
        cx_t100_msg .
    METHODS get_text_table
      IMPORTING
        !it_any    TYPE ANY TABLE
        !iv_langu  TYPE clike DEFAULT sy-langu
      EXPORTING
        !et_result TYPE stringtab
      RAISING
        cx_t100_msg .
    METHODS is_info_existing
      IMPORTING
        !i_any           TYPE any
      RETURNING
        VALUE(rv_result) TYPE abap_bool .
    METHODS is_info_existing_by_t100
      IMPORTING
        VALUE(iv_msgid)  TYPE simple
        VALUE(iv_msgno)  TYPE simple
      RETURNING
        VALUE(rv_result) TYPE abap_bool .
    METHODS is_error
      IMPORTING
        !i_any           TYPE any
      RETURNING
        VALUE(rv_result) TYPE abap_bool .
*    METHODS constructor .
    METHODS get_type
      IMPORTING
        !i_any           TYPE any
      RETURNING
        VALUE(rv_result) TYPE string .
  PROTECTED SECTION.

    CLASS-DATA:
      st_t100 TYPE HASHED TABLE OF t100 WITH UNIQUE KEY msgnr arbgb sprsl. "DEFAULT KEY .
*    DATA mo_help TYPE ty_s_type-o_help_factory_base .

    METHODS find_info
      IMPORTING
        !i_any     TYPE any
      EXPORTING
        !ev_msgid  TYPE simple
        !ev_msgno  TYPE simple
        !ev_type   TYPE simple
        !et_params TYPE ty_s_type-t_name_value_pair
      RAISING
        cx_t100_msg .
    METHODS get_tableinfo
      IMPORTING
        !it_any        TYPE ANY TABLE
      EXPORTING
        !et_info       TYPE bapiret2_tab
        !ev_worst_type TYPE string
      RAISING
        cx_t100_msg .
    METHODS set_structure
      IMPORTING
        !is_any    TYPE any
      EXPORTING
        !ev_msgid  TYPE string
        !ev_msgno  TYPE string
        !ev_type   TYPE string
        !et_params TYPE ty_s_type-t_name_value_pair
      RAISING
        cx_t100_msg .
    METHODS set_s_generic
      IMPORTING
        !is_any    TYPE any
      EXPORTING
        !ev_msgid  TYPE string
        !ev_msgno  TYPE string
        !ev_type   TYPE string
        !et_params TYPE ty_s_type-t_name_value_pair
      RAISING
        cx_t100_msg .
    METHODS set_s_bal_msg
      IMPORTING
        !is_balmsg TYPE bal_s_msg
      EXPORTING
        !ev_msgid  TYPE string
        !ev_msgno  TYPE string
        !ev_type   TYPE string
        !et_params TYPE ty_s_type-t_name_value_pair
      RAISING
        cx_t100_msg .


    METHODS set_s_huitem_messages
      IMPORTING
        !is_huitem_msg TYPE huitem_messages
      EXPORTING
        !ev_msgid      TYPE string
        !ev_msgno      TYPE string
        !ev_type       TYPE string
        !et_params     TYPE ty_s_type-t_name_value_pair
      RAISING
        cx_t100_msg .
    METHODS set_s_sy
      IMPORTING
        !is_sy     TYPE syst DEFAULT sy
      EXPORTING
        !ev_msgid  TYPE string
        !ev_msgno  TYPE string
        !ev_type   TYPE string
        !et_params TYPE ty_s_type-t_name_value_pair .
    METHODS set_s_bapiret2
      IMPORTING
        !is_bapiret TYPE bapiret2
      EXPORTING
        !ev_msgid   TYPE string
        !ev_msgno   TYPE string
        !ev_type    TYPE string
        !et_params  TYPE ty_s_type-t_name_value_pair .
    METHODS set_s_smesg
      IMPORTING
        !is_smesg  TYPE smesg
      EXPORTING
        !ev_msgid  TYPE string
        !ev_msgno  TYPE string
        !ev_type   TYPE string
        !et_params TYPE ty_s_type-t_name_value_pair .
    METHODS set_s_prott
      IMPORTING
        !is_prott  TYPE prott
      EXPORTING
        !ev_msgid  TYPE string
        !ev_msgno  TYPE string
        !ev_type   TYPE string
        !et_params TYPE ty_s_type-t_name_value_pair .
    METHODS set_s_bdcmsgcoll
      IMPORTING
        !is_bdcmsgcoll TYPE bdcmsgcoll
      EXPORTING
        !ev_msgid      TYPE string
        !ev_msgno      TYPE string
        !ev_type       TYPE string
        !et_params     TYPE ty_s_type-t_name_value_pair .
    METHODS  set_s_bapiincomp
      IMPORTING
        !is_bdcmsgcoll TYPE bapiincomp
      EXPORTING
        !ev_msgid      TYPE string
        !ev_msgno      TYPE string
        !ev_type       TYPE string
        !et_params     TYPE ty_s_type-t_name_value_pair .
    METHODS set_s_sprot_u
      IMPORTING
        !is_sprot_u TYPE sprot_u
      EXPORTING
        !ev_msgid   TYPE string
        !ev_msgno   TYPE string
        !ev_type    TYPE string
        !et_params  TYPE ty_s_type-t_name_value_pair .
    METHODS set_s_vbfs
      IMPORTING
        !is_vbfs   TYPE vbfs
      EXPORTING
        !ev_msgid  TYPE string
        !ev_msgno  TYPE string
        !ev_type   TYPE string
        !et_params TYPE ty_s_type-t_name_value_pair .
    METHODS set_object
      IMPORTING
        !io_any    TYPE any
      EXPORTING
        !ev_msgid  TYPE string
        !ev_msgno  TYPE string
        !ev_type   TYPE string
        !et_params TYPE ty_s_type-t_name_value_pair
      RAISING
        cx_t100_msg .
    METHODS set_o_if_t100_message
      IMPORTING
        !io_exception TYPE REF TO cx_root
      EXPORTING
        !ev_msgid     TYPE string
        !ev_msgno     TYPE string
        !ev_type      TYPE string
        !et_params    TYPE ty_s_type-t_name_value_pair
      RAISING
        cx_t100_msg .
    METHODS set_o_cx_t100_msg
      IMPORTING
        !ix_root   TYPE REF TO cx_root
      EXPORTING
        !ev_msgid  TYPE string
        !ev_msgno  TYPE string
        !ev_type   TYPE string
        !et_params TYPE ty_s_type-t_name_value_pair
      RAISING
        cx_t100_msg .
    METHODS set_o_cx_root
      IMPORTING
        !ix_root   TYPE REF TO cx_root
      EXPORTING
        !ev_msgid  TYPE string
        !ev_msgno  TYPE string
        !ev_type   TYPE string
        !et_params TYPE ty_s_type-t_name_value_pair
      RAISING
        cx_t100_msg .
    METHODS set_s_bapiret1
      IMPORTING
        !is_bapiret TYPE bapiret1
      EXPORTING
        !ev_msgid   TYPE string
        !ev_msgno   TYPE string
        !ev_type    TYPE string
        !et_params  TYPE ty_s_type-t_name_value_pair .


ENDCLASS.                    "lcl_find_t100  DEFINITIO

*----------------------------------------------------------------------*
*       CLASS lcl_help_check_a_raise  DEFINITIO
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_check_a_raise DEFINITION INHERITING FROM lcl_help_base
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS sy
      IMPORTING
        !iv_const      TYPE clike OPTIONAL
        !iv_text       TYPE clike OPTIONAL
        !iv_msgid      TYPE simple OPTIONAL
        !iv_msgno      TYPE simple OPTIONAL
        !iv_type       TYPE clike OPTIONAL
        !iv_v1         TYPE clike OPTIONAL
        !iv_v2         TYPE clike OPTIONAL
        !iv_v3         TYPE clike OPTIONAL
        !iv_v4         TYPE clike OPTIONAL
        !is_sy         TYPE syst DEFAULT sy
        !io_previous   TYPE REF TO cx_root OPTIONAL
        !is_check_type TYPE abap_bool DEFAULT abap_false
        !is_using_text TYPE abap_bool DEFAULT abap_false
        !iv_depth_info TYPE i DEFAULT 0
        !ii_add_data   TYPE REF TO if_serializable_object OPTIONAL
          PREFERRED PARAMETER iv_const
      RAISING
        cx_t100_msg .
    METHODS msg
      IMPORTING
        !iv_msgid    TYPE simple
        !iv_msgno    TYPE simple
        !iv_type     TYPE clike OPTIONAL
        !iv_v1       TYPE clike OPTIONAL
        !iv_v2       TYPE clike OPTIONAL
        !iv_v3       TYPE clike OPTIONAL
        !iv_v4       TYPE clike OPTIONAL
        !io_previous TYPE REF TO cx_root OPTIONAL
      RAISING
        cx_t100_msg .
    METHODS any_data
      IMPORTING
        VALUE(i_any1)    TYPE any OPTIONAL
        VALUE(i_any2)    TYPE any OPTIONAL
        VALUE(i_any3)    TYPE any OPTIONAL
        VALUE(is_sy)     TYPE syst OPTIONAL
        !io_previous     TYPE REF TO cx_root OPTIONAL
        !iv_rollb_work   TYPE abap_bool DEFAULT abap_false
        !iv_is_resumable TYPE abap_bool DEFAULT abap_false
          PREFERRED PARAMETER i_any1
      RAISING
        cx_t100_msg .
    METHODS sy_subrc_ne_null
      IMPORTING
        VALUE(is_sy)  TYPE syst DEFAULT sy
        !iv_msg_const TYPE clike OPTIONAL
        !iv_text      TYPE clike OPTIONAL
        !iv_msgid     TYPE simple OPTIONAL
        !iv_msgno     TYPE simple OPTIONAL
        !iv_v1        TYPE simple OPTIONAL
        !iv_v2        TYPE simple OPTIONAL
        !iv_v3        TYPE simple OPTIONAL
        !iv_v4        TYPE simple OPTIONAL
        !io_previous  TYPE REF TO cx_root OPTIONAL
          PREFERRED PARAMETER iv_msg_const
      RAISING
        cx_t100_msg .
    METHODS sy_msg_ne_error
      IMPORTING
        VALUE(is_sy) TYPE syst DEFAULT sy
        !iv_const    TYPE clike OPTIONAL
        !iv_text     TYPE clike OPTIONAL
        !iv_msgid    TYPE simple OPTIONAL
        !iv_msgno    TYPE simple OPTIONAL
        !iv_v1       TYPE simple OPTIONAL
        !iv_v2       TYPE simple OPTIONAL
        !iv_v3       TYPE simple OPTIONAL
        !iv_v4       TYPE simple OPTIONAL
        !io_previous TYPE REF TO cx_root OPTIONAL
        !ii_add_data TYPE REF TO if_serializable_object OPTIONAL
          PREFERRED PARAMETER iv_const
      RAISING
        cx_t100_msg .

    METHODS after_select
      IMPORTING
        !iv_idno     TYPE clike  OPTIONAL
        !iv_text     TYPE clike  OPTIONAL
        !iv_id       TYPE simple OPTIONAL
        !iv_no       TYPE simple OPTIONAL
        !iv_v1       TYPE simple OPTIONAL
        !iv_v2       TYPE simple OPTIONAL
        !iv_v3       TYPE simple OPTIONAL
        !iv_v4       TYPE simple OPTIONAL
        !io_previous TYPE REF TO cx_root OPTIONAL
        !ii_add_data TYPE REF TO if_serializable_object OPTIONAL
        !i_where1    TYPE simple OPTIONAL
        !i_where2    TYPE simple OPTIONAL
        !i_where3    TYPE simple OPTIONAL
        VALUE(is_sy) TYPE syst   DEFAULT sy
          PREFERRED PARAMETER iv_idno
      RAISING
        cx_t100_msg .

    METHODS after_function
      IMPORTING
        VALUE(i_any1)        TYPE data OPTIONAL
        VALUE(i_any2)        TYPE any OPTIONAL
        VALUE(i_any3)        TYPE any OPTIONAL
        VALUE(is_sy)         TYPE syst DEFAULT sy
        VALUE(iv_error_flag) TYPE abap_bool OPTIONAL
        !iv_const            TYPE clike OPTIONAL
        !iv_text             TYPE clike OPTIONAL
        !iv_msgid            TYPE simple OPTIONAL
        !iv_msgno            TYPE simple OPTIONAL
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        !iv_rollb_work       TYPE abap_bool DEFAULT abap_false
        !ii_add_data         TYPE REF TO if_serializable_object OPTIONAL
          PREFERRED PARAMETER iv_const
      RAISING
        cx_t100_msg .
    METHODS after_read_table
      IMPORTING
        VALUE(is_sy) TYPE syst DEFAULT sy
        !iv_const    TYPE clike OPTIONAL
        !iv_text     TYPE clike OPTIONAL
        !iv_msgid    TYPE simple OPTIONAL
        !iv_msgno    TYPE simple OPTIONAL
        !iv_v1       TYPE simple OPTIONAL
        !iv_v2       TYPE simple OPTIONAL
        !iv_v3       TYPE simple OPTIONAL
        !iv_v4       TYPE simple OPTIONAL
        !io_previous TYPE REF TO cx_root OPTIONAL
        !ii_add_data TYPE REF TO if_serializable_object OPTIONAL
          PREFERRED PARAMETER iv_const
      RAISING
        cx_t100_msg .
    METHODS after_method
      IMPORTING
        VALUE(is_sy) TYPE syst DEFAULT sy
        !iv_const    TYPE clike OPTIONAL
        !iv_text     TYPE clike OPTIONAL
        !iv_msgid    TYPE simple OPTIONAL
        !iv_msgno    TYPE simple OPTIONAL
        !iv_v1       TYPE simple OPTIONAL
        !iv_v2       TYPE simple OPTIONAL
        !iv_v3       TYPE simple OPTIONAL
        !iv_v4       TYPE simple OPTIONAL
        !io_previous TYPE REF TO cx_root OPTIONAL
        !ii_add_data TYPE REF TO if_serializable_object OPTIONAL
          PREFERRED PARAMETER iv_const
      RAISING
        cx_t100_msg . .
    METHODS after_commit
      IMPORTING
        !is_sy TYPE syst DEFAULT sy
      RAISING
        cx_t100_msg .
    METHODS is_not_initial
      IMPORTING
        !i_any               TYPE any
        !iv_const            TYPE clike OPTIONAL
        !iv_text             TYPE clike OPTIONAL
        !iv_msgid            TYPE simple OPTIONAL
        !iv_msgno            TYPE simple OPTIONAL
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RAISING
        cx_t100_msg .
    METHODS is_true
        importing
          iv_val type abap_bool
          iv_idno type clike
          iv_v1   type any  optional
          iv_v2 type any optional
          iv_v3 type any optional
          iv_v4 type any optional
          ix_prev type ref to cx_root optional
          iv_depth_info type i default 0.

    METHODS is_bound
      IMPORTING
        !i_any               TYPE REF TO object "any
        !iv_const            TYPE clike OPTIONAL
        !iv_text             TYPE clike OPTIONAL
        !iv_msgid            TYPE simple OPTIONAL
        !iv_msgno            TYPE simple OPTIONAL
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RAISING
        cx_t100_msg .
    METHODS is_assigned
      IMPORTING
        !i_any TYPE any
      RAISING
        cx_t100_msg .
    METHODS is_equal_type .

    METHODS is_range_valid
      IMPORTING
        is_range TYPE data
      RAISING
        cx_t100_msg.


    METHODS is_equal_value
      IMPORTING
        !iv_value1 TYPE any
        !iv_value2 TYPE any
      RAISING
        cx_t100_msg .
    METHODS is_lines
      IMPORTING
        !it_any     TYPE ANY TABLE
        !iv_compare TYPE string DEFAULT '>'
        !iv_count   TYPE i DEFAULT 1
      RAISING
        cx_t100_msg.
    METHODS field_exist .

ENDCLASS.                    "lcl_error_check_a_raise  DEFINITIO


CLASS lcl_help_data DEFINITION INHERITING FROM lcl_help_base.

  PUBLIC SECTION.

    METHODS trans_xml_2_any
      IMPORTING
        !iv_data_xml  TYPE string
      EXPORTING
        !ev_data_type TYPE any
      RAISING
        cx_t100_msg .
    METHODS trans_any_2_xml
      IMPORTING
        !iv_data_type      TYPE any
      RETURNING
        VALUE(rv_data_xml) TYPE string
      RAISING
        cx_t100_msg .

    METHODS trans_clike_2_zip
      IMPORTING
        !iv_string  TYPE clike
      EXPORTING
        !ev_xstring TYPE xstring
      RAISING
        cx_t100_msg .

    METHODS trans_zip_2_string
      IMPORTING
        !iv_xstring      TYPE string
      RETURNING
        VALUE(ev_string) TYPE string
      RAISING
        cx_t100_msg .

    METHODS trans_any_2_xml_zip
      IMPORTING
        !i_any           TYPE any
      RETURNING
        VALUE(rv_result) TYPE string
      RAISING
        cx_t100_msg .
    METHODS trans_xml_zip_2_any
      IMPORTING
        !iv_string TYPE string
      EXPORTING
        !e_any     TYPE any
      RAISING
        cx_t100_msg .

    METHODS:
      trans_ode_2_pdf.

    METHODS:

      http_request
        IMPORTING
          iv_request_mode  TYPE string DEFAULT  if_http_request=>co_request_method_get
          iv_host          TYPE string DEFAULT 'http://eloquentjavascript.net'
          iv_uri           TYPE string DEFAULT '/author'
        RETURNING
          VALUE(rv_result) TYPE string,



      sapgui_upload,
      sapgui_download,
      appli_data_create,
      appli_data_update,
      appli_data_delete,
      appli_data_read,

      db_serial_save
        IMPORTING
          if_serializable TYPE REF TO if_serializable_object
          iv_report       TYPE clike DEFAULT sy-repid
          iv_handle       TYPE clike OPTIONAL
          iv_handle2      TYPE clike OPTIONAL
          iv_handle3      TYPE clike OPTIONAL
          iv_uname        TYPE sy-uname DEFAULT sy-uname
          iv_is_commit    TYPE abap_bool DEFAULT abap_false
        RETURNING
          VALUE(rv_id)    TYPE string
        RAISING
          cx_t100_msg,

      db_serial_delete
        IMPORTING
          iv_id        TYPE any
          iv_is_commit TYPE abap_bool DEFAULT abap_false
        RAISING
          cx_t100_msg,

      db_serial_load
        IMPORTING
          iv_id     TYPE any
        EXPORTING
          ei_serial TYPE REF TO if_serializable_object
        RAISING
          cx_t100_msg.


ENDCLASS.                    "lcl_help_data DEFINITION



*----------------------------------------------------------------------*
*       CLASS lcl_help_error  DEFINITIO
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_error DEFINITION INHERITING FROM lcl_help_base
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS:
      get_instance
        IMPORTING
          iv_classname_error TYPE string DEFAULT 'CX_T100_MSG'
        RETURNING
          VALUE(ro_result)   TYPE ty_s_type-o_help_cx_factory.

    METHODS factory_msg
      IMPORTING
        !iv_id               TYPE simple OPTIONAL
        !iv_no               TYPE simple OPTIONAL
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !it_params           TYPE ty_s_type-t_name_value_pair OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        VALUE(iv_depth_info) TYPE i DEFAULT 0
        !ii_add_data         TYPE REF TO if_serializable_object OPTIONAL
      RETURNING
        VALUE(rx_t100)       TYPE REF TO cx_t100_msg .

    METHODS factory_idno
      IMPORTING
      !value(iv_idno)        TYPE clike
      !iv_v1               TYPE SIMPLE OPTIONAL
      !iv_v2               TYPE SIMPLE OPTIONAL
      !iv_v3               TYPE SIMPLE OPTIONAL
      !iv_v4               TYPE SIMPLE OPTIONAL
      !it_params           TYPE ty_s_type-t_name_value_pair OPTIONAL
      !io_previous         TYPE REF TO cx_root OPTIONAL
      !ii_add_data         TYPE REF TO if_serializable_object OPTIONAL
      VALUE(iv_depth_info) TYPE I DEFAULT 0
      RETURNING
         VALUE(rx_t100)       TYPE REF TO cx_t100_msg .
    METHODS factory_any
      IMPORTING
        VALUE(i_any1)        TYPE any OPTIONAL
        VALUE(i_any2)        TYPE any OPTIONAL
        VALUE(i_any3)        TYPE any OPTIONAL
        VALUE(is_sy)         TYPE syst DEFAULT sy
        !io_previous         TYPE REF TO cx_root OPTIONAL
        VALUE(iv_depth_info) TYPE i DEFAULT 0
          PREFERRED PARAMETER i_any1
      RETURNING
        VALUE(ro_error)      TYPE REF TO cx_t100_msg
      RAISING
        cx_t100_msg .
    METHODS factory_text
      IMPORTING
        VALUE(iv_text)       TYPE clike
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RETURNING
        VALUE(ro_error)      TYPE REF TO cx_t100_msg .
    METHODS factory_function
      IMPORTING
        VALUE(i_any1)        TYPE any OPTIONAL
        VALUE(i_any2)        TYPE any OPTIONAL
        VALUE(i_any3)        TYPE any OPTIONAL
        VALUE(is_sy)         TYPE syst DEFAULT sy
        !iv_text             TYPE clike OPTIONAL
        !iv_id               TYPE simple OPTIONAL
        !iv_no               TYPE simple OPTIONAL
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RETURNING
        VALUE(r_result)      TYPE REF TO cx_t100_msg .
    METHODS factory_select
      IMPORTING
        !iv_text             TYPE clike OPTIONAL
        !iv_idno             TYPE clike OPTIONAL
        !iv_id               TYPE simple OPTIONAL
        !iv_no               TYPE simple OPTIONAL
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        !i_where1            TYPE simple OPTIONAL
        !i_where2            TYPE simple OPTIONAL
        !i_where3            TYPE simple OPTIONAL
        VALUE(iv_depth_info) TYPE i DEFAULT 0
          PREFERRED PARAMETER iv_idno
      RETURNING
        VALUE(rx_result)     TYPE REF TO cx_t100_msg
      RAISING
        cx_t100_msg .
    METHODS factory_read_table
      IMPORTING
        !iv_text             TYPE clike OPTIONAL
        !iv_id               TYPE simple OPTIONAL
        !iv_no               TYPE simple OPTIONAL
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RETURNING
        VALUE(rx_result)     TYPE REF TO cx_t100_msg .
    METHODS factory_method
      IMPORTING
        !iv_text             TYPE clike OPTIONAL
        !iv_id               TYPE simple OPTIONAL
        !iv_no               TYPE simple OPTIONAL
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RETURNING
        VALUE(rx_result)     TYPE REF TO cx_t100_msg .
    METHODS raise
      IMPORTING
        !ix_t100             TYPE REF TO cx_t100_msg
        VALUE(iv_depth_info) TYPE i DEFAULT 0
        !iv_is_resumable     TYPE abap_bool DEFAULT abap_false
        !iv_rollb_work       TYPE abap_bool DEFAULT abap_false
      RAISING
        cx_t100_msg .
    METHODS raise_msg
      IMPORTING
        !iv_id               TYPE simple
        !iv_no               TYPE simple
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !it_params           TYPE ty_s_type-t_name_value_pair OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        !iv_is_resumable     TYPE abap_bool DEFAULT abap_false
        !iv_rollb_work       TYPE abap_bool DEFAULT abap_false
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RAISING
        cx_t100_msg .
    METHODS raise_idno
      IMPORTING
        !iv_idno             TYPE clike
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !it_params           TYPE ty_s_type-t_name_value_pair OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        !iv_is_resumable     TYPE abap_bool DEFAULT abap_false
        !iv_rollb_work       TYPE abap_bool DEFAULT abap_false
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RAISING
        cx_t100_msg .
    METHODS raise_any
      IMPORTING
        VALUE(i_any1)        TYPE data OPTIONAL
        VALUE(i_any2)        TYPE any OPTIONAL
        VALUE(i_any3)        TYPE any OPTIONAL
        VALUE(is_sy)         TYPE syst DEFAULT sy
        !io_previous         TYPE REF TO cx_root OPTIONAL
        !iv_is_resumable     TYPE abap_bool DEFAULT abap_false
        !iv_rollb_work       TYPE abap_bool DEFAULT abap_false
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RAISING
        cx_t100_msg .
    METHODS raise_text
      IMPORTING
        !iv_text             TYPE clike
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        !iv_is_resumable     TYPE abap_bool DEFAULT abap_false
        !iv_rollb_work       TYPE abap_bool DEFAULT abap_false
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RAISING
        cx_t100_msg .
    METHODS raise_select
      IMPORTING
        !iv_text             TYPE clike OPTIONAL
        !iv_idno             TYPE clike OPTIONAL
        !iv_id               TYPE simple OPTIONAL
        !iv_no               TYPE simple OPTIONAL
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        !iv_is_resumable     TYPE abap_bool DEFAULT abap_false
        !iv_rollb_work       TYPE abap_bool DEFAULT abap_false
        !i_where1            TYPE simple OPTIONAL
        !i_where2            TYPE simple OPTIONAL
        !i_where3            TYPE simple OPTIONAL
        VALUE(iv_depth_info) TYPE i DEFAULT 0
          PREFERRED PARAMETER iv_idno
      RAISING
        cx_t100_msg .
    METHODS raise_function
      IMPORTING
        VALUE(i_any1)        TYPE data OPTIONAL
        VALUE(i_any2)        TYPE any OPTIONAL
        VALUE(i_any3)        TYPE any OPTIONAL
        VALUE(is_sy)         TYPE syst DEFAULT sy
        !iv_text             TYPE clike OPTIONAL
        !iv_msgid            TYPE simple OPTIONAL
        !iv_msgno            TYPE simple OPTIONAL
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        !iv_is_resumable     TYPE abap_bool DEFAULT abap_false
        !iv_rollb_work       TYPE abap_bool DEFAULT abap_false
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RAISING
        cx_t100_msg .
    METHODS raise_read_table
      IMPORTING
        !iv_text             TYPE clike OPTIONAL
        !iv_msgid            TYPE simple OPTIONAL
        !iv_msgno            TYPE simple OPTIONAL
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        !iv_is_resumable     TYPE abap_bool DEFAULT abap_false
        !iv_rollb_work       TYPE abap_bool DEFAULT abap_false
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RAISING
        cx_t100_msg .

    METHODS raise_method
      IMPORTING
        !iv_text             TYPE clike OPTIONAL
        !iv_msgid            TYPE simple OPTIONAL
        !iv_msgno            TYPE simple OPTIONAL
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !iv_is_resumable     TYPE abap_bool DEFAULT abap_false
        !iv_rollb_work       TYPE abap_bool DEFAULT abap_false
        !io_previous         TYPE REF TO cx_root OPTIONAL
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RAISING
        cx_t100_msg.

    METHODS factory_by_table
      IMPORTING
        !it_any              TYPE ANY TABLE
        !io_previous         TYPE REF TO cx_root OPTIONAL
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RETURNING
        VALUE(ro_t100)       TYPE REF TO cx_t100_msg.

    METHODS factory_by_single
      IMPORTING
        !i_any               TYPE any
        !io_previous         TYPE REF TO cx_root
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RETURNING
        VALUE(ro_t100)       TYPE REF TO cx_t100_msg
      RAISING
        cx_t100_msg .
    METHODS factory_head
      IMPORTING
        !iv_idno             TYPE clike OPTIONAL
        !iv_text             TYPE clike OPTIONAL
        !iv_msgid            TYPE simple OPTIONAL
        !iv_msgno            TYPE simple OPTIONAL
        !iv_v1               TYPE simple OPTIONAL
        !iv_v2               TYPE simple OPTIONAL
        !iv_v3               TYPE simple OPTIONAL
        !iv_v4               TYPE simple OPTIONAL
        !io_previous         TYPE REF TO cx_root OPTIONAL
        VALUE(iv_depth_info) TYPE i DEFAULT 0
      RETURNING
        VALUE(ro_result)     TYPE REF TO cx_t100_msg
      RAISING
        cx_t100_msg .

    METHODS is_any_error
      IMPORTING
        VALUE(i_any1)    TYPE data OPTIONAL
        VALUE(i_any2)    TYPE any OPTIONAL
        VALUE(i_any3)    TYPE any OPTIONAL
        VALUE(is_sy)     TYPE syst DEFAULT sy
      RETURNING
        VALUE(rv_result) TYPE abap_bool .

    METHODS add_info
      IMPORTING
        ix_root         TYPE REF TO cx_root
        ii_serializable TYPE any OPTIONAL
        i_write         TYPE any OPTIONAL
        i_bapirettab    TYPE any OPTIONAL.

ENDCLASS.                    "lcl_error_factory  DEFINITIO


CLASS lcx_help_exception DEFINITION
  INHERITING FROM cx_t100_msg
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:
      mt_stack         TYPE abap_callstack,
      ms_sy            TYPE syst,
      mv_idno          TYPE string,
      mv_text          TYPE string,
      mv_longtext      TYPE string,
      mt_previous_text TYPE stringtab,
      mt_code          TYPE stringtab,

      mv_xml           TYPE string,
      mt_bapiret       TYPE bapirettab,
      mt_write         TYPE stringtab.

    CLASS-METHODS class_constructor .

    METHODS set_inheritance_attributes
      IMPORTING
        VALUE(iv_depth_info) TYPE i
        !ii_add_data         TYPE REF TO if_serializable_object .

    METHODS get_longtext
         REDEFINITION .
    METHODS get_source_position
         REDEFINITION .
    METHODS get_text
         REDEFINITION .
  PROTECTED SECTION.

    CLASS-DATA so_help TYPE REF TO lcl_help_factory_all. "ty_s_type-o_help_factory_base .
  PRIVATE SECTION.
ENDCLASS.                    "lcx_error  DEFINITIO

CLASS lcl_help_abap IMPLEMENTATION.


  METHOD conv_get_clike.

    rs_result-string = conv_get_string( iv_value ).

    rs_result-char10 = rs_result-string.
    rs_result-char30 = rs_result-string.
    rs_result-char60 = rs_result-string.

  ENDMETHOD.                    "conv_get_clike


method conv_get_int.

    data:
            ls_number type  ty_s_type-s_return_base_conv_number.


    ls_number = conv_get_number( iv_value = i_Any  ).
*      CATCH cx_t100_msg.    "

    rv_result = ls_number-int.

ENDMETHOD.

  METHOD conv_get_number.

    DATA:
       lv_type TYPE string.

    rtts_get_info_simple(
      EXPORTING
        iv_element = iv_value
        IMPORTING
        ev_basetyp = lv_type ).

    CASE lv_type.

        "Character
      WHEN cl_abap_typedescr=>typekind_char
      OR cl_abap_typedescr=>typekind_string
      OR cl_abap_typedescr=>typekind_num.

        conv_char_to_num(
          EXPORTING
            iv_value    = iv_value
          IMPORTING
            ev_result   = rs_result-p_l16_d2  ).

        conv_char_to_num(
           EXPORTING
             iv_value    = iv_value
          IMPORTING
             ev_result   = rs_result-p_l16_d4 ).

        conv_char_to_num(
           EXPORTING
            iv_value    = iv_value
          IMPORTING
            ev_result   = rs_result-p_l16_d6 ).


*        conv_char_to_num(
*           EXPORTING
*            iv_value    = iv_value
*          IMPORTING
*            ev_result   = rs_result-int ).

        rs_result-int = rs_result-p_l16_d2.



      WHEN OTHERS.

        rs_result-int      = iv_value.
        rs_result-p_l16_d2 = iv_value.
        rs_result-p_l16_d4 = iv_value.
        rs_result-p_l16_d6 = iv_value.

    ENDCASE.


  ENDMETHOD.                    "conv_get_number

  METHOD conv_exit_structure.

FIELD-SYMBOLS: <lv_field> TYPE any.

  DO.
    ASSIGN COMPONENT sy-index OF STRUCTURE is_val TO <lv_field>.
    IF sy-subrc NE 0.
      EXIT. "beendet die DO-Schleife nach dem letzten Feld
    ENDIF.

try.
    conv_conversion_exit(
      EXPORTING
        iv_value     = <lv_field>
        iv_is_input  = iv_is_input
*        iv_exit_name = iv_exit_name
      IMPORTING
        ev_value     = <lv_field> ).

catch cx_root.
  endtry.

  ENDDO.


  es_any = is_val.

  ENDMETHOD.





  METHOD conv_date_to_external.


    DATA:
            lv_int TYPE datum.
*            lv_char10 type

    lv_int = i_any.

    IF lv_int IS INITIAL.
      RETURN.
    ENDIF.

*
*        CALL FUNCTION 'CONVERT_DATE_TO_EXTERNAL'
*          EXPORTING
*            date_internal            =  lv_int    " internal date formatting
*          IMPORTING
*            date_external            =     " external date formatting
*          EXCEPTIONS
*            date_internal_is_invalid = 1
*            others                   = 2
*          .

*         .
*        mo_help->so_check_a_raise->after_function(  is_Sy = sy ).

  ENDMETHOD.


  METHOD conv_char_to_num.


    CALL FUNCTION 'MOVE_CHAR_TO_NUM'
      EXPORTING
        chr             = iv_value
      IMPORTING
        num             = ev_result
      EXCEPTIONS
        convt_no_number = 1
        convt_overflow  = 2
        OTHERS          = 3.
    mo_help->so_check_a_raise->after_function( is_sy = sy ).

  ENDMETHOD.                    "conv_char_to_num

    method conv_time.

      CONVERT TIME STAMP iv_timestampl
      TIME ZONE sy-zonlo
      INTO DATE ev_date
      TIME ev_time.


    endmethod.

  METHOD info_get.



    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    IF ev_date IS SUPPLIED
    OR ev_time IS SUPPLIED
    OR ev_timestampl IS SUPPLIED
    OR ev_time_iso8601 IS SUPPLIED
    .

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

      IF sy-batch = abap_false
        AND sy-binpt = abap_false.

        CALL FUNCTION 'RFC_IS_GUI_ON'
          IMPORTING
            on = lv_gui.

        IF lv_gui <> 'Y'.
          ev_is_gui_active = abap_false.
        ELSE.
          ev_is_gui_active = abap_true.
        ENDIF.
      ENDIF.
    ENDIF.

    IF ev_work_process_id IS SUPPLIED.

      DATA:
        lv_wp_no TYPE wpno.

      CALL FUNCTION 'TH_GET_OWN_WP_NO'
        IMPORTING
*         subrc =     " Return Code of the Function Module
          wp_no = lv_wp_no    " Separate Work Process Number
*         wp_pid   =     " PID of Separate Work Process
*         wp_index =
        .
      ev_work_process_id = lv_wp_no.

    ENDIF.


    IF ev_username IS SUPPLIED.
      ev_username = sy-uname.
    ENDIF.

  ENDMETHOD.                    "info_get


  METHOD check_is_error.

    DATA:
      lv_kind TYPE string,
      lv_type TYPE string,
      ls_sy   TYPE syst,
      lx_root TYPE REF TO cx_root.

    " Was wurde hereingegeben?
    mo_help->so_abap->rtts_get_info_any(
    EXPORTING
    i_any   = i_any
    IMPORTING
    ev_kind = lv_kind
    ev_type = lv_type
    ).


    " Speziafall sy
    IF lv_type = 'SYST'.

      ls_sy = i_any.
      IF ls_sy-subrc <> 0.
        rv_is_error = abap_true.
      ENDIF.
      RETURN.

    ENDIF.


    " Speziafall Cx_root
    TRY.

        lx_root ?= i_any.
        rv_is_error = abap_true.
        RETURN.

      CATCH cx_root.
    ENDTRY.

    " Sonst schauen wir immer nach Message
*    TRY.
    DATA:
      lt_bapi TYPE bapiret2_tab.

    lt_bapi =  mo_help->so_txt->bapirettab_get_by_any( i_any = i_any ).
    LOOP AT lt_bapi TRANSPORTING NO FIELDS
        WHERE type = 'E'.
      rv_is_error = abap_true.
      RETURN.
    ENDLOOP.
*        ENDIF.
*      CATCH cx_t100_msg.  " ( i_any = i_any ).
*        rv_is_error = abap_false.
*    ENDTRY.

  ENDMETHOD.                    "abap_is_error

  METHOD code_get_callstack.

    DATA:
      lt_stack_called TYPE abap_callstack,
      ls_stack_called TYPE LINE OF abap_callstack.

    CALL FUNCTION 'SYSTEM_CALLSTACK'
      EXPORTING
        max_level = '0'
      IMPORTING
        callstack = et_callstack.

    DELETE et_callstack INDEX 1.

    READ TABLE et_callstack INDEX 1
        INTO es_callstack.

    ev_repid = es_callstack-mainprogram.


    lt_stack_called  = et_callstack.

    DELETE lt_stack_called INDEX 1.

    READ TABLE lt_stack_called INDEX 1
       INTO es_callstack_1.

    IF sy-subrc = 0.
      ev_called_repid = ls_stack_called-mainprogram.
    ENDIF.

  ENDMETHOD.                    "code_get_callstack


  METHOD code_get_function_info.

    DATA:
      lt_source_code   TYPE stringtab,
      lv_counter       TYPE i,
      lv_code          TYPE string,
      lv_temp          TYPE string,
      lv_counter_new   TYPE i,
      lv_line_function TYPE i.
    TRY.
        code_get_source(
        EXPORTING
        iv_name_program = is_called-include
*      iv_number_row   =
        RECEIVING
        rt_stringtab    = lt_source_code
        ).
      CATCH cx_t100_msg.
    ENDTRY.

    lv_counter = is_called-line - 1.

    FIELD-SYMBOLS: <ls_code> TYPE string.
    LOOP AT lt_source_code ASSIGNING <ls_code>.
      TRANSLATE <ls_code> TO UPPER CASE.
    ENDLOOP.

    WHILE lv_counter > 0 .

      READ TABLE lt_source_code INTO lv_code
      INDEX lv_counter.

      IF lv_code CS 'CALL FUNCTION' OR lv_code CS 'call function'.
        lv_line_function = lv_counter.
        SPLIT lv_code AT 'CALL FUNCTION'
        INTO  lv_temp ev_name_function.

        SHIFT ev_name_function LEFT DELETING LEADING ' '.

        "Steht in dieser Zeile Funktionsaufruf oder erst in der nächsten?
        IF strlen(  ev_name_function ) = 0.

          lv_counter_new = lv_counter + 1.

          READ TABLE lt_source_code INTO ev_name_function
          INDEX lv_counter_new.

          SHIFT ev_name_function LEFT DELETING LEADING ' '.

        ENDIF.

        EXIT.
      ENDIF.

      lv_counter = lv_counter - 1.
    ENDWHILE.

    SPLIT ev_name_function AT ' '
    INTO ev_name_function lv_temp.


    es_stack = is_called.
    es_stack-line = lv_line_function.

  ENDMETHOD.                    "code_get_function_info


  METHOD code_get_read_table_info.

    DATA:
      lt_source_code TYPE stringtab,
      lv_counter     TYPE i,
      lv_code        TYPE string,
      lv_temp        TYPE string,
      lv_counter_new TYPE i.

    TRY.
        code_get_source(
        EXPORTING
        iv_name_program = is_called-include
*      iv_number_row   =
        RECEIVING
        rt_stringtab    = lt_source_code
        ).
      CATCH cx_t100_msg.
    ENDTRY.

    lv_counter = is_called-line - 1.


    FIELD-SYMBOLS: <ls_code> TYPE string.
    LOOP AT lt_source_code ASSIGNING <ls_code>.
      TRANSLATE <ls_code> TO UPPER CASE.
    ENDLOOP.

    WHILE lv_counter > 0 .

      READ TABLE lt_source_code INTO lv_code
      INDEX lv_counter.

      TRANSLATE lv_code TO UPPER CASE.

      IF lv_code CS 'TABLE' AND lv_code CS 'READ'.

        SPLIT lv_code AT 'TABLE'
        INTO  lv_temp ev_name_function.

        SHIFT ev_name_function LEFT DELETING LEADING ' '.

        "Steht in dieser Zeile Funktionsaufruf oder erst in der nächsten?
        IF strlen(  ev_name_function ) = 0.

          lv_counter_new = lv_counter + 1.

          READ TABLE lt_source_code INTO ev_name_function
          INDEX lv_counter_new.

          SHIFT ev_name_function LEFT DELETING LEADING ' '.

        ENDIF.

        EXIT.
      ENDIF.

      lv_counter = lv_counter - 1.
    ENDWHILE.

    SPLIT ev_name_function AT ' '
    INTO ev_name_function lv_temp.

  ENDMETHOD.                    "code_get_read_table_info


  METHOD code_get_select_info.

    DATA:
      lt_source_code TYPE stringtab,
      lv_counter     TYPE i,
      lv_code        TYPE string,
      lv_temp        TYPE string,
      lv_counter_new TYPE i.

    code_get_source(
      EXPORTING
        iv_name_program = is_called-include
      RECEIVING
        rt_stringtab    = lt_source_code  ).

    lv_counter = is_called-line - 1.


    FIELD-SYMBOLS: <ls_code> TYPE string.
    LOOP AT lt_source_code ASSIGNING <ls_code>.
      TRANSLATE <ls_code> TO UPPER CASE.
    ENDLOOP.


    WHILE lv_counter > 0 .

      READ TABLE lt_source_code INTO lv_code
        INDEX lv_counter.

      IF lv_code CS 'FROM'.

        SPLIT lv_code AT 'FROM'
         INTO  lv_temp ev_name_table.
        SHIFT ev_name_table LEFT DELETING LEADING ' '.
        "Steht in dieser Zeile shcon Tabelleninfo oder erst in der nächsten?
        IF strlen(  ev_name_table ) = 0.
          lv_counter_new = lv_counter + 1.
          READ TABLE lt_source_code INTO ev_name_table
           INDEX lv_counter_new.
          SHIFT ev_name_table LEFT DELETING LEADING ' '.
        ENDIF.

        EXIT.
      ENDIF.
      lv_counter = lv_counter - 1.
    ENDWHILE.

    SPLIT ev_name_table AT ' '
       INTO ev_name_table lv_temp.

    TRANSLATE ev_name_table TO UPPER CASE.


  ENDMETHOD.                    "code_get_select_info


  METHOD code_get_source.

    DATA:
      lo_wb_source    TYPE REF TO cl_wb_source,
      lv_name_program TYPE trdir-name,
      lv_string       TYPE string.

    lv_name_program = iv_name_program.

    CREATE OBJECT lo_wb_source
      EXPORTING
        source_name = lv_name_program.    " physical name.

    lo_wb_source->read_source(
      IMPORTING
        source_tab = rt_stringtab "Source Code
      EXCEPTIONS
        cancelled                     = 1
        not_found                     = 2
        read_protected                = 3
        enhancement_locked            = 4
        OTHERS                        = 6 ).
    mo_help->so_check_a_raise->after_method( is_sy = sy ).

    IF iv_number_row IS SUPPLIED.

      LOOP AT rt_stringtab INTO lv_string.
        IF sy-index <> iv_number_row.
          DELETE rt_stringtab.
        ENDIF.
      ENDLOOP.

    ENDIF.

  ENDMETHOD.                    "code_get_source


  METHOD constructor.
    super->constructor(  ).
*    CREATE OBJECT mo_help.

  ENDMETHOD.                    "constructor

  METHOD conv_date_to_internal.

    DATA:
            lv_ext TYPE datum.

    lv_ext = i_any.

    IF lv_ext IS INITIAL.
      RETURN.
    ENDIF.

    CALL FUNCTION 'CONVERT_DATE_TO_INTERNAL'
      EXPORTING
        date_external            = lv_ext    " external date formatting
*       accept_initial_date      =     " Single-Character Indicator
      IMPORTING
        date_internal            = rv_result    " internal date formatting
      EXCEPTIONS
        date_external_is_invalid = 1
        OTHERS                   = 2.
    mo_help->so_check_a_raise->after_function(  is_sy = sy ).


  ENDMETHOD.


  METHOD conv_exit.

    DATA:
      lv_typename  TYPE string,
      lx_root      TYPE REF TO cx_root,
      lv_exit_name TYPE string.

    DATA:
          lv_out TYPE REF TO data.

    FIELD-SYMBOLS:
                   <lv_feld> TYPE simple.

    """""""""""""""""""""""""""""""""
    " Typ nicht mitgegeben

    IF iv_name IS INITIAL.

      mo_help->so_abap->rtts_get_info_simple(
        EXPORTING
          iv_element      = iv_val
        IMPORTING
          ev_typename     = lv_typename
          ev_convexit     = lv_exit_name ).

      "Ferttig muss nichts durchlaufen werden
      IF lv_exit_name IS INITIAL.
        rv_result = iv_val.
        RETURN.
      ENDIF.

      conv_conversion_exit(
            EXPORTING
                iv_value      = iv_val
                iv_exit_name  = lv_exit_name
                iv_is_input   = iv_is_input
            IMPORTING
                ev_value      = iv_val ). "rv_result ).

      rv_result = iv_val.


      """""""""""""""""""""""""""""""""
      " Typ mitgegeben

    ELSE.

*      create data lv_out type (iv_name).

      TRY.

          mo_help->so_abap->rtts_get_info_simple(
      EXPORTING
        iv_name_element = iv_name
      IMPORTING
        ev_typename     = lv_typename
        ev_convexit     = lv_exit_name ).

          CREATE DATA lv_out TYPE (iv_name).

          ASSIGN lv_out->* TO <lv_feld>.


          conv_conversion_exit(
                EXPORTING
                    iv_value      = iv_val
                    iv_exit_name  = lv_exit_name
                    iv_is_input   = iv_is_input
                IMPORTING
                    ev_value      = <lv_feld> ). "rv_result ).

          rv_result = <lv_feld>.

*    data: lx_root type ref to cx_root.
        CATCH cx_root INTO lx_root..
*          mo_help->so_error->raise_text( iv_text = 'Fehler im Conversion Exit' io_previous = lx_root ).
      ENDTRY.


**      lv_exit_

*name = iv_name.
    ENDIF.




*  rv_result = lv_val_out.
*  SHIFT rv_result LEFT DELETING LEADING ' '.

  ENDMETHOD.                    "conv_exit


  METHOD conv_conversion_exit.

    DATA:
      lv_funcname     TYPE rs38l_fnam,
      lv_typename     TYPE string,
      lv_type         TYPE string,
      lx_root         TYPE REF TO cx_root,
      lx_illegal_type TYPE REF TO  cx_sy_dyn_call_illegal_func.

    DATA:
      lv_basetyp_output TYPE string,
      lv_basetyp_input  TYPE string.

    TRY.

        """"""""""""""""""""""""""""""""""""""""""""""""
        " Shift bei clike

        mo_help->so_abap->rtts_get_info_simple(
           EXPORTING
             iv_element      = iv_value
           IMPORTING
             ev_basetyp     = lv_basetyp_input ).

        IF  lv_basetyp_output CA 'C&Ngy'.
          SHIFT iv_value LEFT DELETING LEADING ' '.
        ENDIF.



        """"""""""""""""""""""""""""""""""""""""""""""""
        "Wenn möglich wird zumindest immer der Input ohne Konvertierung zurückgegeben

        TRY.
            ev_value = iv_value.
          CATCH  cx_sy_conversion_error.
        ENDTRY.


        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "Typ bestimmen

        IF iv_exit_name IS INITIAL.

          mo_help->so_abap->rtts_get_info_simple(
            EXPORTING
              iv_element      = ev_value
            IMPORTING
              ev_typename     = lv_typename
              ev_convexit     = iv_exit_name ).

        ENDIF.

        IF iv_exit_name IS INITIAL.
          "Fertig, es muss kein Convexit durchlafuen werden
          RETURN.
        ENDIF.



        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Name des Aufrufs bestimmen

        IF iv_is_input = abap_true.
          lv_type = '_INPUT'.
        ELSE.
          lv_type = '_OUTPUT'.
        ENDIF.

        CONCATENATE
          'CONVERSION_EXIT_'
          iv_exit_name
          lv_type
          INTO lv_funcname.

        CALL FUNCTION 'FUNCTION_EXISTS'
          EXPORTING
            funcname           = lv_funcname
          EXCEPTIONS
            function_not_exist = 1
            error_message      = 2
            OTHERS             = 3.

        mo_help->so_check_a_raise->after_function( is_sy = sy ).



        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Prüfungen

        "wenn eingabe u ausgeb clike, darf eingabe nicht länger als ausgabe sein


        mo_help->so_abap->rtts_get_info_simple(
           EXPORTING
             iv_element      = ev_value
           IMPORTING
             ev_basetyp     = lv_basetyp_output ).

        mo_help->so_abap->rtts_get_info_simple(
         EXPORTING
           iv_element      = iv_value
         IMPORTING
           ev_basetyp     = lv_basetyp_input ).

        IF  lv_basetyp_output CA 'C&Ngy' AND lv_basetyp_output CA 'C&Ngy'.

          SHIFT iv_value LEFT DELETING LEADING ' '.
          " D  00  092 Eingabe ist zu lang für das Feld
          IF strlen( iv_value ) > strlen( ev_value ).
            mo_help->so_error->raise_msg( iv_id = '00' iv_no = 092 ).
          ENDIF.
        ENDIF.



        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Konvertierung durchführen

        TRY.

            CALL FUNCTION lv_funcname
              EXPORTING
                input           = iv_value
              IMPORTING
                output          = ev_value
              EXCEPTIONS
                check_failed    = 1
                not_numeric     = 2
                t344_get_failed = 3
                wrong_length    = 4
                error_message   = 5
                OTHERS          = 6.

            " Fehlerbehandlung
            mo_help->so_check_a_raise->sy_subrc_ne_null( ).

          CATCH cx_sy_dyn_call_illegal_func INTO lx_illegal_type.

            "D    XSS_CAT_UIA 003 Fehlender Konvertierungsexit &1 für Feld &2
            mo_help->so_error->raise_msg(
                   EXPORTING
                     iv_id    = 'XSS_CAT_UIA'
                     iv_no    = 003
                     iv_v1    = lv_funcname
                     iv_v2    = lv_typename
                     io_previous = lx_root
                 ).

        ENDTRY.


        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Fehlerbehandlung

      CATCH cx_root INTO lx_root.
*          "D  RSAN_WB 032 Fehler bei Konvertierungsexit.
*        mo_help->so_cx_factory->raise_msg(
*             EXPORTING
*               iv_msgid    = 'RSAN_WB'
*               iv_msgno    = 032
*               iv_v1    = lv_funcname
*               iv_v2    = lv_typename
*               io_previous = lx_root
*           ).

        "D  RSDS  012 Fehler '&4' beim Konvertierungsexit &1 (Feld &2, Wert &3)
        mo_help->so_error->raise_msg(
             EXPORTING
               iv_id    = 'RSDS'
               iv_no    = 012
               iv_v1    =  lv_funcname
               iv_v2    =  lv_typename
               iv_v3    =  iv_value
               iv_v4    = '01'
               io_previous = lx_root
           ).

    ENDTRY.

  ENDMETHOD.                    "conv_conversion_exit


  METHOD conv_get_packed_l16d4.

    DATA:
       lv_type TYPE string.

    TRY.
        rtts_get_info_simple(
          EXPORTING
            iv_element = iv_value
            IMPORTING
            ev_typename = lv_type ).

      CATCH cx_t100_msg.
    ENDTRY.

    CASE lv_type.

        "Character
      WHEN cl_abap_typedescr=>typekind_char
      OR cl_abap_typedescr=>typekind_string
      OR cl_abap_typedescr=>typekind_num.

        conv_char_to_num(
          EXPORTING
            iv_value    = iv_value
          IMPORTING
            ev_result   = rv_result ).

      WHEN OTHERS.
        rv_result = iv_value.

    ENDCASE.

  ENDMETHOD.                    "conv_get_packed_l10_d2


  METHOD conv_get_range.

    FIELD-SYMBOLS:
      <ls_line> TYPE simple,
      <lv_any>  TYPE simple.


    "Dann wenn Werte nicht leer, Tabelle füllen
    IF iv_low IS NOT INITIAL OR iv_high IS NOT INITIAL.

      APPEND INITIAL LINE TO et_range ASSIGNING <ls_line>.

      ASSIGN COMPONENT 'SIGN' OF STRUCTURE <ls_line> TO <lv_any>.
      <lv_any> = iv_sign.

      ASSIGN COMPONENT 'OPTION' OF STRUCTURE <ls_line> TO <lv_any>.
      <lv_any> = iv_option.

      IF iv_low IS NOT INITIAL.

        IF iv_is_conv_exit = abap_true.
          conv_conversion_exit(  EXPORTING iv_value = iv_low IMPORTING ev_value = iv_low ).
        ENDIF.

        ASSIGN COMPONENT 'LOW' OF STRUCTURE <ls_line> TO <lv_any>.
        <lv_any> = iv_low.
      ENDIF.

      IF iv_high IS NOT INITIAL.
        IF iv_is_conv_exit = abap_true.
          conv_conversion_exit(  EXPORTING iv_value = iv_high IMPORTING ev_value = iv_high ).
        ENDIF.

        ASSIGN COMPONENT 'HIGH' OF STRUCTURE <ls_line> TO <lv_any>.
        <lv_any> = iv_high.
      ENDIF.

    ENDIF.


  ENDMETHOD.                    "conv_get_range


  METHOD conv_get_range_initial.

    DATA:
      lv_typename     TYPE string,
      lo_sign_descr   TYPE REF TO cl_abap_elemdescr,
      lo_option_descr TYPE REF TO cl_abap_elemdescr,
      lo_value_descr  TYPE REF TO cl_abap_elemdescr,
      lo_tabledescr   TYPE REF TO cl_abap_tabledescr,
      lo_structdescr  TYPE REF TO cl_abap_structdescr,
      lt_components   TYPE cl_abap_structdescr=>component_table,
      lx_root         TYPE REF TO cx_root.

    FIELD-SYMBOLS:
      <ls_components> TYPE abap_componentdescr.

    TRY.

        "Welcher Typ muss verwendet werden?
        IF iv_value IS SUPPLIED.
          rtts_get_info_simple(
          EXPORTING
          iv_element      = iv_value
          IMPORTING
          ev_typename     = lv_typename   ).
        ELSE.
          lv_typename = iv_typename.
        ENDIF.


        "Elemente erzeugen
        lo_sign_descr   ?= cl_abap_elemdescr=>describe_by_name( 'DDSIGN' ).
        lo_option_descr ?= cl_abap_elemdescr=>describe_by_name( 'DDOPTION' ).
        lo_value_descr  ?= cl_abap_elemdescr=>describe_by_name( lv_typename ).


        "Struktur erzeugen
        APPEND INITIAL LINE TO lt_components ASSIGNING <ls_components>.
        MOVE 'SIGN' TO <ls_components>-name.
        MOVE lo_sign_descr TO <ls_components>-type.

        APPEND INITIAL LINE TO lt_components ASSIGNING <ls_components>.
        MOVE 'OPTION' TO <ls_components>-name.
        MOVE lo_option_descr TO <ls_components>-type.

        APPEND INITIAL LINE TO lt_components ASSIGNING <ls_components>.
        MOVE 'LOW' TO <ls_components>-name.
        MOVE lo_value_descr TO <ls_components>-type.

        APPEND INITIAL LINE TO lt_components ASSIGNING <ls_components>.
        MOVE 'HIGH' TO <ls_components>-name.
        MOVE lo_value_descr TO <ls_components>-type.

        "RTTI Typen erstellen
        lo_structdescr = cl_abap_structdescr=>create( lt_components ).
        lo_tabledescr ?= cl_abap_tabledescr=>create( p_line_type = lo_structdescr ).

        "Daten erzeugen
        CREATE DATA et_range TYPE HANDLE lo_tabledescr.

      CATCH cx_root INTO lx_root.
        " DO  007  Aufbau des Zeilentyps & ist für Ranges-Tabellentypen nicht zulässig
        mo_help->so_error->raise_msg(
         iv_id      = 'DO'
         iv_no      = '007'
         iv_v1         = lv_typename
         io_previous   = lx_root ).

    ENDTRY.

  ENDMETHOD.                    "conv_get_range_initial


  METHOD conv_get_string.

    DATA:
      lv_type TYPE string.
    TRY.
        rtts_get_info_simple(
            IMPORTING
            ev_typename = lv_type ).
      CATCH cx_t100_msg.
    ENDTRY.

    CASE lv_type.

*        "Character
*      WHEN cl_abap_typedescr=>typekind_char
*      OR cl_abap_typedescr=>typekind_string
*      OR cl_abap_typedescr=>typekind_num.
*
*        conv_char_to_num(
*           EXPORTING
*            iv_value    = iv_value
*          IMPORTING
*            ev_result   = rs_result-p_l16_d6 ).

      WHEN OTHERS.

        rv_string = iv_simple.

    ENDCASE.

  ENDMETHOD.                    "conv_get_string




  METHOD rtts_is_in_domrange.


    DATA:
      lv_domname   TYPE domname,
      lv_domname_s TYPE string,
      lt_dd_descr  TYPE STANDARD TABLE OF dd07v,
      ls_dd07v     LIKE LINE OF st_dd07v_buffer.

    rv_result = abap_true.

    mo_help->so_abap->rtts_get_info_simple(
      EXPORTING
        iv_element      = iv_any
*        iv_name_element =
        iv_langu        = sy-langu
      IMPORTING
*        ev_typename     =
        ev_domname      =  lv_domname_s
*        ev_convexit     =
*        ev_outputlen    =
*        ev_title        =
*        ev_shortdescr   =
*        ev_scrtext_s    =
*        ev_scrtext_m    =
*        ev_scrtext_l    =
*        ev_is_ddic      =
*        es_fielddescr   =
*        ev_basetyp      =
    ).

    lv_domname = lv_domname_s.

    IF lv_domname IS INITIAL.
      RETURN. "Wenn keien Domain da, dann ist alles erlaubt
    ENDIF.


    READ TABLE st_dd07v_buffer INTO ls_dd07v
         WITH KEY domname = lv_domname domvalue_l = iv_any .
    IF sy-subrc <> 0.
*      CATCH cx_t100_msg.    "

      CALL FUNCTION 'DD_DOMVALUES_GET'
        EXPORTING
          domname        = lv_domname   " Domain name
*         text           = SPACE    " Default ' ': without texts, 'X': with, 'T': only text
*         langu          = iv_langu    " Language, default SY-LANGU, '*': all texts
*         bypass_buffer  = SPACE
*  IMPORTING
*         rc             =
        TABLES
          dd07v_tab      = lt_dd_descr
        EXCEPTIONS
          wrong_textflag = 1
          OTHERS         = 2.
      mo_help->so_check_a_raise->after_select(  is_sy = sy ).

      APPEND LINES OF lt_dd_descr TO st_dd07v_buffer.

      READ TABLE st_dd07v_buffer INTO ls_dd07v
           WITH KEY domname = lv_domname domvalue_l = iv_any." ddlanguage = iv_langu.
      IF sy-subrc <> 0.
        rv_result = abap_false.
      ENDIF.

    ENDIF.

*    rv_result = ls_dd07v-ddtext.

  ENDMETHOD.


  METHOD rtts_get_domdescr.

    DATA:
      lv_domname   TYPE domname,
      lv_domname_s TYPE string,
      lt_dd_descr  TYPE STANDARD TABLE OF dd07v,
      ls_dd07v     LIKE LINE OF st_dd07v_buffer.



    mo_help->so_abap->rtts_get_info_simple(
      EXPORTING
        iv_element      = iv_any
*        iv_name_element =
        iv_langu        = sy-langu
      IMPORTING
*        ev_typename     =
        ev_domname      =  lv_domname_s
*        ev_convexit     =
*        ev_outputlen    =
*        ev_title        =
*        ev_shortdescr   =
*        ev_scrtext_s    =
*        ev_scrtext_m    =
*        ev_scrtext_l    =
*        ev_is_ddic      =
*        es_fielddescr   =
*        ev_basetyp      =
    ).

    lv_domname = lv_domname_s.

    READ TABLE st_dd07v_buffer INTO ls_dd07v
         WITH KEY domname = lv_domname domvalue_l = iv_any ddlanguage = iv_langu.
    IF sy-subrc <> 0.
*      CATCH cx_t100_msg.    "

      CALL FUNCTION 'DD_DOMVALUES_GET'
        EXPORTING
          domname        = lv_domname   " Domain name
          text           = 'X' " Default ' ': without texts, 'X': with, 'T': only text
          langu          = iv_langu    " Language, default SY-LANGU, '*': all texts
*         bypass_buffer  = SPACE
*  IMPORTING
*         rc             =
        TABLES
          dd07v_tab      = lt_dd_descr
        EXCEPTIONS
          wrong_textflag = 1
          OTHERS         = 2.
      mo_help->so_check_a_raise->after_select(  is_sy = sy ).

      APPEND LINES OF lt_dd_descr TO st_dd07v_buffer.

      READ TABLE st_dd07v_buffer INTO ls_dd07v
           WITH KEY domname = lv_domname domvalue_l = iv_any ddlanguage = iv_langu.
      IF sy-subrc <> 0.
        READ TABLE st_dd07v_buffer INTO ls_dd07v
  WITH KEY domname = lv_domname domvalue_l = iv_any.
      ENDIF.
      mo_help->so_check_a_raise->after_read_table(  ).

    ENDIF.

    rv_result = ls_dd07v-ddtext.

  ENDMETHOD.


  METHOD rtts_get_info_any.

    DATA:
      lo_descr         TYPE REF TO cl_abap_typedescr,
      lo_descr_class   TYPE REF TO cl_abap_classdescr,
      lo_descr_table   TYPE REF TO cl_abap_tabledescr,
      lo_descr_element TYPE REF TO cl_abap_elemdescr,
      lv_length        TYPE string.

    lo_descr = cl_abap_typedescr=>describe_by_data( i_any ).
    ev_type =  lo_descr->get_relative_name( ).
    ev_kind = lo_descr->kind.

    "Was wurde hereingegeben?
    CASE lo_descr->kind.

      WHEN cl_abap_typedescr=>kind_elem.
        lo_descr_element  ?= cl_abap_typedescr=>describe_by_data( i_any ).
        ev_type  =  lo_descr_element->get_relative_name( ).
        IF ev_type IS INITIAL.
          lv_length =  lo_descr_element->length.
          CONCATENATE
          lo_descr_element->type_kind
          ' '
          lv_length
          INTO ev_type RESPECTING BLANKS.
        ENDIF.

      WHEN cl_abap_typedescr=>kind_struct.

      WHEN cl_abap_typedescr=>kind_table.
        lo_descr_table  ?= cl_abap_typedescr=>describe_by_data( i_any ).
        ev_type  =  lo_descr_table->get_relative_name( ).

      WHEN cl_abap_typedescr=>kind_ref.

        lo_descr_class  ?= cl_abap_typedescr=>describe_by_object_ref( i_any ).
        ev_type =  lo_descr_class->get_relative_name( ).

    ENDCASE.

  ENDMETHOD.                    "rtts_get_info_any


  METHOD rtts_get_info_class.

    DATA:
      lo_descr    TYPE REF TO cl_abap_typedescr,
      lo_descr_cl TYPE REF TO cl_abap_classdescr.

    lo_descr = cl_abap_datadescr=>describe_by_object_ref( p_object_ref = io_object ).
    lo_descr_cl ?= lo_descr.
    ev_classname = lo_descr_cl->absolute_name.

  ENDMETHOD.                    "rtts_get_info_class


  METHOD sy_init_subrc_a_msg.

    FREE:
        sy-subrc,
        sy-msgty,
        sy-msgid,
        sy-msgno,
        sy-msgv1,
        sy-msgv2,
        sy-msgv3,
        sy-msgv4.

  ENDMETHOD.                    "sy_init_subrc_a_msg

  METHOD sy_set_msg_by_any.

    DATA:
    ls_info TYPE  ty_s_type-s_t100.

    ls_info =  mo_help->so_txt->info_get_by_any( i_any = i_any  ).

    sy-msgty = ls_info-msgty.
    sy-msgid = ls_info-msgid.
    sy-msgno = ls_info-msgno.
    sy-msgv1 = ls_info-msgv1.
    sy-msgv2 = ls_info-msgv2.
    sy-msgv3 = ls_info-msgv3.
    sy-msgv4 = ls_info-msgv4.

  ENDMETHOD.                    "sy_set_msg_by_any

  METHOD itab_move_corresponding_table.

    FIELD-SYMBOLS:
      <fs_line_in>  TYPE any,
      <fs_line_out> TYPE any.


    LOOP AT it_table ASSIGNING <fs_line_in>.

      APPEND INITIAL LINE TO et_table ASSIGNING <fs_line_out>.
      MOVE-CORRESPONDING <fs_line_in> TO <fs_line_out>.

    ENDLOOP.


  ENDMETHOD.                    "itab_move_corresponding_table

  METHOD number_get_two_decimal_places.



    DATA:
      lv_string1 TYPE string,
      lv_string2 TYPE string.

    IF NOT iv_string CO '123456789,- '.
      RETURN. "Leere Ausgabe
    ENDIF.

    rv_string = iv_string.

    SHIFT rv_string RIGHT DELETING TRAILING ' '.

    "Wenn keine Nachkommastellen, einfach anfuegen und fertig
    IF NOT rv_string CA ','.
      CONCATENATE rv_string ',00' INTO rv_string.

    ELSE.

      SPLIT rv_string AT ',' INTO lv_string1 lv_string2.

      CASE strlen( lv_string2 ).

        WHEN '0'.
          CONCATENATE lv_string2 ',00' INTO rv_string.

        WHEN '1'.
          CONCATENATE rv_string ',0' INTO rv_string.


        WHEN '2'.
          CONCATENATE ',' rv_string  INTO rv_string.


        WHEN OTHERS.

          IF iv_is_rounded = abap_true.
            lv_string2 = number_get_rounded_result( iv_input = lv_string2 iv_decimals = 2 ).

          ELSE.
            CONCATENATE ',' lv_string2(2) INTO lv_string2.
*            lv_string2 = |,{ lv_string2(2) }|.
          ENDIF.

      ENDCASE.

      CONCATENATE lv_string1 lv_string2 INTO rv_string.
*      rv_string = |{ lv_string1 }{ lv_string2 }|.

    ENDIF.


  ENDMETHOD.                    "number_get_two_decimal_places

  METHOD number_get_rounded_result.

  ENDMETHOD.                    "number_get_rounded_result

 METHOD log_add.

    DATA:
          ls_bapiret2 TYPE bapiret2.

    ls_bapiret2-id = iv_msgid.
    ls_bapiret2-number = iv_msgno.
    ls_bapiret2-message_v1 = mo_help->so_abap->conv_get_string( iv_msgv1 ).
    ls_bapiret2-message_v2 = mo_help->so_abap->conv_get_string( iv_msgv2 ).
    ls_bapiret2-message_v3 = mo_help->so_abap->conv_get_string( iv_msgv3 ).
    ls_bapiret2-message_v4 = mo_help->so_abap->conv_get_string( iv_msgv4 ).

    ls_bapiret2-message = mo_help->so_txt->text_get_by_any( ls_bapiret2 ).
    ls_bapiret2-type = iv_type.
    rt_bapiret = it_bapiret.
    APPEND ls_bapiret2 TO rt_bapiret.

  ENDMETHOD.                    "log_add

  method  log_get_system_info.

    DATA:
          lv_time type string,
          lv_date type string,
          lv_user type string.

    mo_help->so_abap->info_get(
      IMPORTING
*        ev_date            =
*        ev_time            =
*        ev_timestampl      =
*        ev_time_iso8601    =
        ev_time_write      = lv_time
        ev_date_write      =  lv_date
        ev_username        =  lv_user
*        ev_ip_adress       =
*        ev_is_gui_active   =
*        ev_sy_msgtext      =
*        et_callstack       =
*        ev_repidname       =
*        ev_method          =
*        et_dequeue_table   =
*        ev_work_process_id =
    ).

 rv_result = '| '.

    if iv_user = abap_true.
    concatenate  rv_result  lv_user into rv_result RESPECTING BLANKS.
    endif.


    if iv_date = abap_true.
    concatenate rv_result ' / ' lv_date into rv_result RESPECTING BLANKS.
    endif.


    if iv_time = abap_true.
    concatenate rv_result ' / ' lv_time into rv_result RESPECTING BLANKS.
    endif.

    endmethod.


  METHOD log_add_any.

    DATA:
          ls_bapi TYPE bapiret2. "ty_s_types-s_t100.


    rt_bapiret = it_bapiret.

    """""""""""""""""""""""""""
    "Bei cx_root auch alle vorgänger
    DATA: lx_root TYPE REF TO cx_root.
    TRY.

        lx_root ?= i_any.

        WHILE lx_root IS BOUND.
          TRY.
              ls_bapi = mo_help->so_txt->bapiret_get_by_any( lx_root ).
            CATCH cx_root.
              RETURN.
          ENDTRY.
          APPEND ls_bapi TO rt_bapiret.
          lx_root = lx_root->previous.

          IF is_add_previous = abap_false.
            EXIT.
          ENDIF.
        ENDWHILE.

        RETURN.
      CATCH cx_root.
    ENDTRY.

    """""""""""""""""""""""""""
    " Bei Tabelle jede Zeile

    FIELD-SYMBOLS:
      <lt_tab>  TYPE STANDARD TABLE,
      <ls_line> TYPE any.
    data: lv_type type string.



      mo_help->so_abap->rtts_get_info_any(
        EXPORTING
          i_any   = i_any
        IMPORTING
          ev_kind = lv_type
*          ev_type =
      ).

      if lv_type = 'T'.

        TRY.
        ASSIGN i_any TO <lt_tab>.
        IF <lt_tab> IS ASSIGNED.
          LOOP AT <lt_tab> ASSIGNING <ls_line>.

            ls_bapi = mo_help->so_txt->bapiret_get_by_any( <ls_line> ).
            APPEND ls_bapi TO rt_bapiret.

          ENDLOOP.
          RETURN.
        ENDIF.
      CATCH cx_root.

    ENDTRY.
    else.

          try.
    ls_bapi = mo_help->so_txt->bapiret_get_by_any( i_any ).
    catch cx_root.
      try.
       mo_help->so_txt->text_get_like_t100(
         EXPORTING
           iv_text   = i_Any
*           iv_v1     =
*           iv_v2     =
*           iv_v3     =
*           iv_v4     =
         IMPORTING
           ev_msgid  = ls_bapi-id
           ev_msgno  = ls_bapi-number
           ev_v1     = ls_bapi-message_v1
           ev_v2     = ls_bapi-message_v2
           ev_v3     = ls_bapi-message_v3
           ev_v4     = ls_bapi-message_v4
*           et_params =
       ).
*       ls_bapi-message =
        APPEND ls_bapi TO rt_bapiret.
        catch cx_root.
          endtry.
      endtry.

      endif.

  ENDMETHOD.                    "log_add_any


  METHOD conv_stringtab_to_chartab.

    DATA:
            lv_string TYPE string.

    FIELD-SYMBOLS:
    <lv_char> TYPE char200.

    LOOP AT it_data INTO lv_string.

      APPEND INITIAL LINE TO rt_chartab255 ASSIGNING <lv_char>.
      <lv_char> = lv_string.

    ENDLOOP.

  ENDMETHOD.                    "conv_stringtab_to_chartab


  METHOD rtts_get_info_simple.

    DATA:
      lo_eldescr    TYPE REF TO cl_abap_elemdescr,
      ls_dd01l      TYPE dd01l,
      ls_dd04l      TYPE dd04l,
      ls_dd04t      TYPE dd04t,
      lo_struct     TYPE REF TO cl_abap_typedescr,
      lx_cast_error TYPE REF TO cx_sy_move_cast_error.

    lo_struct = cl_abap_typedescr=>describe_by_data( iv_element ).

    TRY.
        lo_eldescr ?= lo_struct.
      CATCH cx_sy_move_cast_error INTO lx_cast_error.
        "D  FDT_RFC 010 Datenobjekt gehört nicht zum Typ 'Element'
*        mo_help->so_cx_factory->raise_msg(
*           EXPORTING
*              iv_msgid     = 'FDT_RFC'
*              iv_msgno     = '010'
*              io_previous  = lx_cast_error
*              ).
    ENDTRY.

    ev_is_ddic =  lo_eldescr->is_ddic_type(  ).

    lo_eldescr->get_ddic_field(
      EXPORTING
        p_langu      = iv_langu    " Current Language
      RECEIVING
        p_flddescr   = es_fielddescr     " Field Description
     EXCEPTIONS
       not_found    = 1
       no_ddic_type = 2
       OTHERS       = 3 ).
*    mo_help->so_check_a_raise->after_method( is_sy = sy ).


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Typ bestimmen

    IF iv_name_element IS NOT SUPPLIED.
      ev_typename =  lo_struct->get_relative_name( ).
    ELSE.
      ev_typename = iv_name_element.
    ENDIF.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Domäne bestimmen

    SELECT SINGLE * FROM dd04l INTO ls_dd04l
      WHERE rollname = ev_typename.

    ls_dd04l-rollname = ev_typename.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Konversionexit bestimmen

    IF ls_dd04l-domname <> '' AND ev_convexit IS SUPPLIED.

      "Konvertierungsroutine bestimmen
      SELECT SINGLE * FROM dd01l INTO ls_dd01l "ev_convexit
              WHERE domname = ls_dd04l-domname.

      ls_dd01l-domname = ls_dd04l-domname.

    ENDIF.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Texte bestimmen

    IF ev_scrtext_l  IS SUPPLIED
    OR ev_scrtext_m  IS SUPPLIED
    OR ev_scrtext_s  IS SUPPLIED
    OR ev_title      IS SUPPLIED
    OR ev_shortdescr IS SUPPLIED.

      SELECT SINGLE *
      FROM dd04t
      INTO CORRESPONDING FIELDS OF ls_dd04t
        WHERE rollname   = ev_typename
        AND   ddlanguage = iv_langu.

      ls_dd04t-rollname = ev_typename.

    ENDIF.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " DDIC Infos bestimmen

    IF ev_outputlen IS SUPPLIED.

      ev_outputlen = es_fielddescr-outputlen.
      "Outputlänge bestimmen

    ENDIF.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ausgabeparameter beschreiben

    ev_convexit   = ls_dd01l-convexit.
    ev_domname    = ls_dd04l-domname.
    ev_scrtext_l  = ls_dd04t-scrtext_l.
    ev_scrtext_m  = ls_dd04t-scrtext_m.
    ev_scrtext_s  = ls_dd04t-scrtext_s.
    ev_shortdescr = ls_dd04t-ddtext.
    ev_title      = ls_dd04t-reptext.
    ev_basetyp    = lo_eldescr->type_kind.

  ENDMETHOD.                    "rtts_get_info_simple


  METHOD rtts_get_table_component.

    DATA:
      wa_component   TYPE abap_componentdescr,
      lt_data        TYPE REF TO data,
      lv_name2       TYPE string,
      lo_descr       TYPE REF TO cl_abap_typedescr,
      lo_structdescr TYPE REF TO cl_abap_structdescr,
      ls_comp        LIKE LINE OF lo_structdescr->components.

    FIELD-SYMBOLS:
      <ls_line>  TYPE any,
      <lv_feld>  TYPE any,
      <ft_input> TYPE STANDARD TABLE.

    "Wenn Tabelle reingegebn wwurde
    IF it_ref_table IS SUPPLIED.

      ASSIGN it_ref_table->* TO <ft_input>.
*
      CREATE DATA lt_data LIKE LINE OF <ft_input>.
      ASSIGN lt_data->* TO <ls_line>.

      IF <ft_input> IS NOT INITIAL.
        READ TABLE <ft_input> INDEX 1
          INTO <ls_line>.
      ELSE.
        APPEND INITIAL LINE TO <ft_input> ASSIGNING <ls_line>.
      ENDIF.

      "Wenn struktur reingegeben wurde
    ELSE.
      ASSIGN it_ref_structure->* TO  <ls_line>.
    ENDIF.

    lo_descr = cl_abap_structdescr=>describe_by_data( <ls_line> ).

    TRY.

        lo_structdescr ?= lo_descr.

        LOOP AT lo_structdescr->components INTO ls_comp.

          CONCATENATE '<ls_line>-' ls_comp-name INTO lv_name2.
*          DATA(lv_name2) = |<ls_line>-{ CONV string( ls_comp-name ) }|.
          ASSIGN (lv_name2) TO <lv_feld>.

          CLEAR wa_component.
          wa_component-name = ls_comp-name.
*          wa_component-name = CONV string( ls_comp-name ).
          wa_component-type ?= cl_abap_elemdescr=>describe_by_data( <lv_feld> ).
          INSERT wa_component INTO TABLE rt_component.

        ENDLOOP.

      CATCH cx_root.

        CLEAR wa_component.
        wa_component-name = 'TABLE_LINE'.
        wa_component-type ?= cl_abap_elemdescr=>describe_by_data( <ls_line> ).
        INSERT wa_component INTO TABLE rt_component.

    ENDTRY.

  ENDMETHOD.                    "rtts_get_table_component


  METHOD rtts_is_column_existing.

    DATA:
      lt_comp      TYPE abap_component_tab,
      ls_component TYPE LINE OF abap_component_tab,
      lt_r_table   TYPE REF TO data.

    GET REFERENCE OF it_table INTO lt_r_table.

    lt_comp = rtts_get_table_component( it_ref_table = lt_r_table ).

    READ TABLE lt_comp INTO ls_component
       WITH KEY name = iv_col_type.

    IF sy-subrc = 0.
      r_result = abap_true.
    ELSE.
      r_result = abap_false.
    ENDIF.

  ENDMETHOD.                    "rtts_is_column_existing


  METHOD rtts_is_type_cx_root.

    DATA:
    lx_root TYPE REF TO cx_root.

    TRY.
        lx_root ?= i_any.
        rv_result = abap_true.
      CATCH cx_root.
    ENDTRY.

  ENDMETHOD.                    "rtts_is_type_root



ENDCLASS.
CLASS lcl_help_txt IMPLEMENTATION.

  METHOD constructor.

    super->constructor( ).

  ENDMETHOD.


  METHOD write_itab_positions.

*
*    FIELD-SYMBOLS:
*                    <field> TYPE any,
*                    <fs_line> type any.
*
*    DATA: lv_string TYPE c LENGTH 500.
*    DATA: lv_temp TYPE string.
*
*
*    DATA: ls_string TYPE string,
*          ls_line   TYPE string,
*          lv_diff   TYPE i.
*
*    "Wenn keine dictionary, dann kann man es noch mit Zeile probieren
*    LOOP AT it_any ASSIGNING <fs_line>.
*      EXIT.
*    ENDLOOP.
*
*    IF <fs_line> IS NOT ASSIGNED.
*      RETURN.
*    ENDIF.
*
*    DATA(lo_struct) = cl_abap_typedescr=>describe_by_data( <fs_line> ).
*
*    "Wenn Zeile keine Struktur, Ende
*    IF lo_struct->kind NE cl_abap_typedescr=>kind_struct.
*      RETURN.
*    ENDIF.
*
*    DATA: lo_struct2 TYPE REF TO cl_abap_structdescr.
*    lo_struct2 ?= lo_struct.
*
*    lo_struct2->get_ddic_field_list(
*      RECEIVING
*        p_field_list             =  DATA(lt_fieldlist)   " Liste der DDIC-Beschreibung der Komponenten
*      EXCEPTIONS
*        not_found                = 1
*        no_ddic_type             = 2
*        OTHERS                   = 3  ).
*
*    IF sy-subrc <> 0.
*      RETURN.
*    ENDIF.
*
*    LOOP AT it_any ASSIGNING FIELD-SYMBOL(<row>).
*      FREE ls_line.
*
*      DO.
*        ASSIGN COMPONENT sy-index OF STRUCTURE <row> TO <field>.
*
*        IF sy-subrc = 0.
*
*          READ TABLE lt_fieldlist INDEX sy-index
*            ASSIGNING FIELD-SYMBOL(<field2>).
*
*          ls_string = mo_help->so_abap->conv_get_string( <field> ).
*          lv_diff =  <field2>-outputlen - strlen( ls_string ).
*
*          IF lv_diff > 0.
*            DO lv_diff TIMES.
*              ls_string = ls_string && ` `.
*            ENDDO.
*          ELSEIF lv_diff < 0.
*            lv_diff = lv_diff * -1.
*            lv_diff = strlen( ls_string ) - lv_diff.
*            ls_string = ls_string(lv_diff).
*          ENDIF.
*          ls_line = ls_line && ls_string.
*          ls_line = ls_line && `  `.
*        ELSE.
*          EXIT.
*        ENDIF.
*      ENDDO.
*
*
*      APPEND ls_line TO rt_result.
*
*    ENDLOOP.


  ENDMETHOD.                    "string_get


  METHOD write_itab_header.

*    FIELD-SYMBOLS <field> TYPE any.
*    DATA: lv_string TYPE c LENGTH 500.
*    DATA: lv_temp TYPE string.
**          ls_text TYPE ty_s_text.
*
*    "Wenn keine dictionary, dann kann man es noch mit Zeile probieren
*    LOOP AT it_any ASSIGNING FIELD-SYMBOL(<fs_line>).
*      EXIT.
*    ENDLOOP.
*
*    IF <fs_line> IS NOT ASSIGNED.
*      RETURN.
*    ENDIF.
*
*    DATA(lo_struct) = cl_abap_typedescr=>describe_by_data( <fs_line> ).
*
*    "Wenn Zeile keine Struktur, Ende
*    IF lo_struct->kind NE cl_abap_typedescr=>kind_struct.
*      RETURN.
*    ENDIF.
*
*    DATA: lo_struct2 TYPE REF TO cl_abap_structdescr.
*    lo_struct2 ?= lo_struct.
*
*    lo_struct2->get_ddic_field_list(
*      RECEIVING
*        p_field_list             =  DATA(lt_fieldlist)   " Liste der DDIC-Beschreibung der Komponenten
*      EXCEPTIONS
*        not_found                = 1
*        no_ddic_type             = 2
*        OTHERS                   = 3  ).
*
*    IF sy-subrc <> 0.
*      RETURN.
*    ENDIF.
*
*    DATA: ls_string TYPE string,
*          ls_line   TYPE string,
*          lv_diff   TYPE i.
*
*    "Kopf schreiben
*    LOOP AT lt_fieldlist ASSIGNING FIELD-SYMBOL(<field1>).
*      CLEAR ls_string.
*
*      ls_string = <field1>-reptext.
*      lv_diff = <field1>-outputlen - strlen( ls_string ).
*
*      IF lv_diff > 0.
*        DO lv_diff TIMES.
*          ls_string = ls_string && ` `.
*        ENDDO.
*      ELSEIF lv_diff < 0.
*        lv_diff = lv_diff * -1.
*        lv_diff = strlen( ls_string ) - lv_diff.
*        ls_string = ls_string(lv_diff).
*      ENDIF.
*      ls_line = ls_line && ls_string.
*      ls_line = ls_line && `  `.
*    ENDLOOP.
*
*    rv_string = ls_line.

  ENDMETHOD.                    "string_get_tab

  METHOD write_itab_all.

    DATA:
      ls_header    TYPE string,
      lt_stringtab TYPE stringtab,
      lv_string    TYPE string.

    ls_header = write_itab_header( it_any = i_any ).

    APPEND ls_header TO rt_result.

*    LOOP AT i_any ASSIGNING <ls_any>.
*
*      APPEND INITIAL LINE TO rt_result ASSIGNING <lv_string>.
*      <lv_string> = itab_write_positions(  <ls_any> ).
*
**    ENDLOOP.

    lt_stringtab = write_itab_positions( i_any ).

    LOOP AT lt_stringtab INTO lv_string.

      APPEND lv_string TO rt_result.

    ENDLOOP.
*    append lines of  itab_write_positions( i_any ) to rt_result.

  ENDMETHOD.                    "conv_get_stringtab


  METHOD cx_get_bapiret2tab.

    DATA:
      ls_bapi   TYPE bapiret2,
      lv_msgid  TYPE string,
      lv_msgno  TYPE string,
      lv_type   TYPE string,
      lt_params TYPE  ty_s_type-t_name_value_pair,
      lv_text   TYPE string,
      ls_info   TYPE ty_s_type-s_t100.

    WHILE ix_root IS BOUND.
      FREE: ls_bapi,lv_msgid, lv_msgno, lv_type, lt_params.

      ls_bapi-message = ix_root->get_text(  ).

      TRY.

          ls_info = mo_help->so_txt->info_get_by_any(
*          EXPORTING
          i_any       = ix_root
*          IMPORTING
*          ev_msgid    = lv_msgid
*          ev_msgno    = lv_msgno
*          et_params   = lt_params
          ).

          lv_msgid  = ls_info-msgid.
          lv_msgno  = ls_info-msgno.
          lt_params = ls_info-t_params.

        CATCH cx_t100_msg.

          "Wenn keine T100 Nachricht dann setzten wir Text als T100 (besser als nichts)
          lv_text = ix_root->get_text(  ).
          text_get_like_t100(
          EXPORTING
          iv_text   = lv_text
          IMPORTING
          ev_msgid  = lv_msgid
          ev_msgno  = lv_msgno
          et_params = lt_params  ).

      ENDTRY.

      ls_bapi-id         = lv_msgid.
      ls_bapi-number     = lv_msgno.
      ls_bapi-type       = 'E'.

      TRY.
          ls_bapi-message_v1 =  text_get_param( it_params = lt_params iv_index = 1 ).
        CATCH cx_t100_msg.
      ENDTRY.

      TRY.
          ls_bapi-message_v2 =  text_get_param( it_params = lt_params iv_index = 2 ).
        CATCH cx_t100_msg.
      ENDTRY.

      TRY.
          ls_bapi-message_v3 =  text_get_param( it_params = lt_params iv_index = 3 ).
        CATCH cx_t100_msg.
      ENDTRY.

      TRY.
          ls_bapi-message_v4 =  text_get_param( it_params = lt_params iv_index = 4 ).
        CATCH cx_t100_msg.
      ENDTRY.

      APPEND ls_bapi TO rt_result.

      ix_root = ix_root->previous.
    ENDWHILE.

  ENDMETHOD.                    "cx_get_bapiret2tab


  METHOD write_exception.

    IF iv_is_detailed = abap_false.

      DATA:
        lv_spaces TYPE string,
        lv_text   TYPE string.

      WHILE ix_root IS BOUND.

        lv_text = ix_root->get_text(  ).

        CONCATENATE lv_spaces lv_text INTO lv_text.
        APPEND lv_text TO rt_text.
        CONCATENATE lv_spaces  ''   INTO lv_spaces RESPECTING BLANKS.

        ix_root = ix_root->previous.
      ENDWHILE.

    ELSE.

      DATA:
        lx_before TYPE REF TO cx_root,
        lx_actual TYPE REF TO cx_root,
        lv_prog1  TYPE syrepid,
        lv_name1  TYPE syrepid,
        lv_line1  TYPE i,
        lv_prog2  TYPE syrepid,
        lv_name2  TYPE syrepid,
        lv_line2  TYPE i.
****      lv_spaces TYPE string,
*      lv_text   TYPE string.

      lx_before = ix_root.
      lx_actual = ix_root.

      WHILE lx_actual IS BOUND.

        lv_text = lx_actual->get_text( ).

        lx_actual->get_source_position(
        IMPORTING
        program_name = lv_prog2    " ABAP Program: Current Main Program
        include_name = lv_name2
        source_line  = lv_line2  ).

        lx_before->get_source_position(
        IMPORTING
        program_name = lv_prog1    " ABAP Program: Current Main Program
        include_name = lv_name1
        source_line  = lv_line1
        ).

        IF lv_prog1 = lv_prog2 AND lv_name1 = lv_name2 AND lv_line1 = lv_line2.
          "Selbe Codingstelle erschein auf selber Höhe
        ELSE.
          CONCATENATE lv_spaces  '  '   INTO lv_spaces RESPECTING BLANKS.
        ENDIF.

        CONCATENATE lv_spaces lv_text INTO lv_text.
        APPEND lv_text TO rt_text.

        lx_before = lx_actual.
        lx_actual = lx_actual->previous.

      ENDWHILE.

    ENDIF.

  ENDMETHOD.                    "cx_get_stringtab


*
*
*  METHOD bapirettab_get_by_any.
*
*
*    DATA:
*      lv_kind   TYPE string,
*      lv_type   TYPE string,
*      lt_params TYPE  ty_s_type-t_name_value_pair,
*      ls_params TYPE ty_s_type-s_name_value_pair,
*      ls_bapi   TYPE bapiret2.
*
*    FIELD-SYMBOLS:
*      <lt_any> TYPE ANY TABLE,
*      <ls_any> TYPE any.
*
*    mo_help->so_abap->rtts_get_info_any(
*      EXPORTING
*        i_any   = i_it_add_info
*      IMPORTING
*        ev_kind = lv_kind
*        ev_type = lv_type ).
*
*    CASE lv_kind.
*
*      WHEN cl_abap_typedescr=>kind_table.
*
*        ASSIGN i_it_add_info TO <lt_any>.
*        mo_help->so_check_a_raise->is_assigned( <lt_any> ).
*
*        LOOP AT <lt_any> ASSIGNING <ls_any>.
*
**               APPEND INITIAL LINE TO r_result ASSIGNING <ls_bapi>.
*
*          TRY.
*
*              FREE ls_bapi.
*
*              DATA:
*
*                ls_info   TYPE ty_s_type-s_t100.
*
*              ls_info =  mo_help->so_txt->t100_get_by_any(
**                EXPORTING
*                     i_any       = <ls_any>
**                IMPORTING
**                  ev_msgid    = ls_bapi-id
**                  ev_msgno    = ls_bapi-number
**                  ev_type     = ls_bapi-type
**                  et_params   = lt_params
*                 ).
*
*              ls_bapi-id = ls_info-msgid.
*              ls_bapi-number = ls_info-msgno.
*              ls_bapi-type = ls_info-msgty.
*              lt_params = ls_info-t_params.
*
*              READ TABLE lt_params INTO ls_params INDEX 1.
*              IF sy-subrc = 0.
*                ls_bapi-message_v1 = ls_params-value.
*              ENDIF.
*
*              READ TABLE lt_params INTO ls_params INDEX 2.
*              IF sy-subrc = 0.
*                ls_bapi-message_v1 = ls_params-value.
*              ENDIF.
*
*              READ TABLE lt_params INTO ls_params INDEX 3.
*              IF sy-subrc = 0.
*                ls_bapi-message_v1 = ls_params-value.
*              ENDIF.
*
*              READ TABLE lt_params INTO ls_params INDEX 4.
*              IF sy-subrc = 0.
*                ls_bapi-message_v1 = ls_params-value.
*              ENDIF.
*
*              APPEND ls_bapi TO r_result.
*
*            CATCH cx_root.
**             delete
**            raise lx_root.
*          ENDTRY.
*
*        ENDLOOP.
*
*
*      WHEN OTHERS.
*
**       APPEND INITIAL LINE TO r_result ASSIGNING <ls_bapi>.
*
*        TRY.
*
*
*            FREE ls_bapi.
*
**    DATA:
***      ls_info   type ty_s_types-s_t100.
*            FREE ls_info.
*
*
*            ls_info =  mo_help->so_txt->t100_get_by_any(
**                EXPORTING
*                   i_any       = i_it_add_info
**                IMPORTING
**                  ev_msgid    = ls_bapi-id
**                  ev_msgno    = ls_bapi-number
**                  ev_type     = ls_bapi-type
**                  et_params   = lt_params
*               ).
*
*            ls_bapi-id = ls_info-msgid.
*            ls_bapi-number = ls_info-msgno.
*            ls_bapi-type = ls_info-msgty.
*            lt_params = ls_info-t_params.
*
**    ls_info-
*
*            READ TABLE lt_params INTO ls_params INDEX 1.
*            IF sy-subrc = 0.
*              ls_bapi-message_v1 = ls_params-value.
*            ENDIF.
*
*            READ TABLE lt_params INTO ls_params INDEX 2.
*            IF sy-subrc = 0.
*              ls_bapi-message_v1 = ls_params-value.
*            ENDIF.
*
*            READ TABLE lt_params INTO ls_params INDEX 3.
*            IF sy-subrc = 0.
*              ls_bapi-message_v1 = ls_params-value.
*            ENDIF.
*
*            READ TABLE lt_params INTO ls_params INDEX 4.
*            IF sy-subrc = 0.
*              ls_bapi-message_v1 = ls_params-value.
*            ENDIF.
*
*            APPEND ls_bapi TO r_result.
*
*          CATCH cx_t100_msg.
**       free <ls_bapi>.
*        ENDTRY.
*
*    ENDCASE.
*
*    IF r_result IS INITIAL.
*      mo_help->so_error->raise_text(  'kein T100 Text gefunden' ).
*    ENDIF.
*
*  ENDMETHOD.                    "text_get_bapiret2tab


  METHOD text_get_by_dd04t.

    DATA: ls_dd04t TYPE dd04t.

  read table st_dd04t into ls_dd04t
    with key rollname = iv_val ddlanguage = iv_langu.
  if sy-subrc <> 0.

    SELECT SINGLE *
    FROM dd04t
    INTO CORRESPONDING FIELDS OF ls_dd04t
    WHERE rollname   = iv_val
    AND   ddlanguage = iv_langu.
    mo_help->so_check_a_raise->after_select(  ).

    insert ls_dd04t into TABLE st_dd04t.
endif.

    CASE iv_scrtext.
      WHEN 'S'.
        rv_result =  ls_dd04t-scrtext_s.
      WHEN 'L'.
        rv_result =  ls_dd04t-scrtext_l.
      WHEN OTHERS.
        rv_result =  ls_dd04t-scrtext_m.
    ENDCASE.

  ENDMETHOD.                    "text_get_dd04t


  METHOD text_get_like_t100.

    FIELD-SYMBOLS:
    <ls_param> TYPE  ty_s_type-s_name_value_pair .

    DATA:
      lt_stringtab TYPE stringtab,
      lv_text      TYPE string,
      lv_value     TYPE string,
      lv_lines     TYPE i,
      lv_index     TYPE i.


    FREE: et_params, ev_msgid, ev_msgno.

    ev_msgid = '00'.
    ev_msgno = 398.

    lv_text =  text_get_w_params(
         iv_text   = iv_text
         iv_v1     = iv_v1
         iv_v2     = iv_v2
         iv_v3     = iv_v3
         iv_v4     = iv_v4  ).

    text_get_splitted_stringtab(
    EXPORTING
    iv_text      = lv_text
    iv_length    = 50
    RECEIVING
    rt_stringtab = lt_stringtab  ).

    lv_lines =  lines( lt_stringtab ).
    DO lv_lines TIMES.
      lv_index = sy-index.
      TRY.
          APPEND INITIAL LINE TO et_params ASSIGNING <ls_param>.

          READ TABLE lt_stringtab INDEX lv_index
          INTO lv_value.

          IF sy-subrc = 0.
            <ls_param>-value = lv_value.
          ENDIF.

          CASE lv_index.
            WHEN 1.
              ev_v1 = lv_value.
            WHEN 2.
              ev_v2 = lv_value.
            WHEN 3.
              ev_v3 = lv_value.
            WHEN 4.
              ev_v4 = lv_value.
          ENDCASE.

        CATCH cx_root.
      ENDTRY.
    ENDDO.

  ENDMETHOD.                    "text_get_like_t100


  METHOD text_get_param.

    DATA:
      ls_param  TYPE LINE OF  ty_s_type-t_name_value_pair,
      lv_string TYPE string.

    lv_string = iv_index.

    READ TABLE it_params INTO ls_param
    INDEX iv_index.

    IF sy-subrc <> 0.
      "D CR  319 Parameter & ist nicht definiert
      RAISE EXCEPTION TYPE cx_t100_msg
        EXPORTING
          t100_msgid = 'CR'
          t100_msgno = 319
          t100_msgv1 = lv_string.

    ENDIF.

    rv_result = ls_param-value.

*    me->mo_help->

  ENDMETHOD.                    "text_get_param


  METHOD text_get_placeholder_otr.

    DATA:
      lv_position_begin TYPE i VALUE -1,
      lv_position_end   TYPE i VALUE 0,
      lv_letter         TYPE string,
      ls_param          TYPE LINE OF  ty_s_type-t_name_value_pair,
      lv_length         TYPE i,
      lv_strlen         TYPE i.

    FIELD-SYMBOLS:
    <ls_params> TYPE LINE OF  ty_s_type-t_name_value_pair .

    lv_strlen = strlen(  iv_text ).

    TRY.

        DO.
          IF lv_position_begin > lv_strlen.
            EXIT.
          ENDIF.

          ADD 1 TO lv_position_begin.
          lv_letter =  iv_text+lv_position_begin(1).

          "Wenn Anfang Parameter
          IF lv_letter = iv_separator.

            lv_position_begin = lv_position_begin + 1.
            lv_position_end = lv_position_begin.

            DO.
              ADD 1 TO lv_position_end.
              lv_letter =  iv_text+lv_position_end(1).

              "WennEnde eines Parameters
              IF lv_letter <> iv_separator.
                CONTINUE.
              ENDIF.

              FREE ls_param.
              lv_length = lv_position_end - lv_position_begin.
              ls_param-name = iv_text+lv_position_begin(lv_length).
              APPEND ls_param TO rt_params.
              EXIT.

            ENDDO.
            lv_position_begin = lv_position_end.

          ENDIF.
        ENDDO.

      CATCH  cx_sy_range_out_of_bounds.
    ENDTRY.

    """"""""""""""""""""""""""""""""""""""
    " Sepearatorzeichen bei OTR Texten ergänzen

    LOOP AT rt_params ASSIGNING <ls_params>.
      CONCATENATE
          iv_separator
          <ls_params>-name
          iv_separator
          INTO <ls_params>-name.
    ENDLOOP.



  ENDMETHOD.                    "text_get_placeholder_otr


  METHOD text_get_splitted_stringtab.

    DATA:
     lv_line TYPE c LENGTH 1000.

    lv_line = iv_text.

    CALL FUNCTION 'RKD_WORD_WRAP'
      EXPORTING
        textline            = lv_line   " Source text line
        outputlen           = iv_length    " Maximum output line width
      TABLES
        out_lines           = rt_stringtab   " All output lines as table
      EXCEPTIONS
        outputlen_too_large = 1
        error_message       = 2
        OTHERS              = 3.

  ENDMETHOD.                    "text_get_splitted_stringtab


  METHOD text_get_w_param.

    DATA:
      lv_value    TYPE string,
      lv_pos_temp TYPE c LENGTH 1,
      lv_position TYPE string.

    lv_pos_temp = iv_position.
    lv_position = lv_pos_temp.

    CONCATENATE
*          '_'
          '&'
         lv_position
*         '_'
          INTO lv_position.
*
    rv_text = iv_text.
*
*    TRANSLATE rv_text USING ' _'.
*    CONCATENATE rv_text '_' INTO rv_text.
*
    lv_value = mo_help->so_abap->conv_get_string( iv_msgv ).
*    CONCATENATE '_' lv_value '_' INTO lv_replace.
*    REPLACE lv_position IN rv_text WITH lv_replace.
*    IF sy-subrc <> 0.
*      REPLACE '_&_' IN rv_text WITH lv_value.
*    ENDIF.
*
*    TRANSLATE rv_text USING '_ '.

    DATA:
      lv_p1 TYPE string,
      lv_p2 TYPE string.

    FIND SUBSTRING lv_position IN rv_text.
    IF sy-subrc = 0.
      SPLIT rv_text AT lv_position INTO lv_p1 lv_p2.
    ELSE.

      FIND SUBSTRING '&' IN rv_text.
      IF sy-subrc = 0.
        SPLIT rv_text AT '&' INTO lv_p1 lv_p2.
      ELSE.
        RETURN.
      ENDIF.
    ENDIF.

    CONCATENATE
    lv_p1
    lv_value
    lv_p2
    INTO
    rv_text.

  ENDMETHOD.                    "text_get_w_param


  METHOD text_get_w_params.

    DATA:
      ls_param TYPE LINE OF  ty_s_type-t_name_value_pair,
      lv_tabix TYPE string.

    rv_text = iv_text.

    "------------------------------------------
    " Parameter ersetzten

    IF it_params IS NOT INITIAL.

      LOOP AT it_params INTO ls_param.
        lv_tabix = sy-tabix.

        IF ls_param-name <> '' AND ls_param-value <> ''.
          REPLACE ls_param-name IN rv_text WITH ls_param-value.
          CONTINUE.
        ENDIF.

        CONCATENATE
            '&'
            lv_tabix
            INTO ls_param-name.

        SHIFT ls_param-name RIGHT DELETING TRAILING ' '.
        SHIFT ls_param-name LEFT DELETING LEADING ' '.

        REPLACE ls_param-name IN rv_text WITH ls_param-value.

        IF sy-subrc <> 0.
          ls_param-name = '&'.
          REPLACE ls_param-name IN rv_text WITH ls_param-value.
        ENDIF.

      ENDLOOP.

      RETURN.
    ENDIF.

    "------------------------------------------
    " Parameter ersetzten

    IF iv_v1 IS SUPPLIED.

      text_get_w_param(
        EXPORTING
          iv_text   = rv_text
          iv_msgv   = iv_v1
        RECEIVING
          rv_text = rv_text ).

    ENDIF.


    IF iv_v2 IS SUPPLIED.

      text_get_w_param(
        EXPORTING
          iv_text     = rv_text
          iv_msgv       = iv_v2
          iv_position = 2
        RECEIVING
          rv_text = rv_text ).

    ENDIF.


    IF iv_v3 IS SUPPLIED.

      text_get_w_param(
        EXPORTING
          iv_text = rv_text
          iv_msgv   = iv_v3
          iv_position = 3
        RECEIVING
          rv_text = rv_text ).

    ENDIF.


    IF iv_v4 IS SUPPLIED.

      text_get_w_param(
        EXPORTING
          iv_text     = rv_text
          iv_msgv     = iv_v4
          iv_position = 4
        RECEIVING
          rv_text = rv_text ).

    ENDIF.


  ENDMETHOD.                    "text_get_w_params


  METHOD info_get_by_any.

    DATA:
       lo_t100 TYPE ty_s_type-o_help_t100.


*    mo_help->



    CREATE OBJECT lo_t100.

    "t100 Info holen
    lo_t100->get_info(
        EXPORTING
          i_any       = i_any
        IMPORTING
          ev_msgid    = rs_t100-msgid
          ev_msgno    = rs_t100-msgno
          ev_type     = rs_t100-msgty
          et_params   = rs_t100-t_params ).


    TRY. "Von Datenbank lesen

        rs_t100-text_sylangu =  text_get_by_msg(
              iv_id    = rs_t100-msgid
              iv_no    = rs_t100-msgno
              it_params   = rs_t100-t_params ).

        rs_t100-text_de =  text_get_by_msg(
              iv_id    = rs_t100-msgid
              iv_no    = rs_t100-msgno
              iv_langu    = 'DE'
              it_params   = rs_t100-t_params ).

        rs_t100-text_en =  text_get_by_msg(
              iv_id    = rs_t100-msgid
         iv_no    = rs_t100-msgno
         iv_langu    = 'EN'
         it_params   = rs_t100-t_params ).

        rs_t100-is_db_exist = abap_true.
      CATCH cx_t100_msg.
        rs_t100-is_db_exist = abap_false.
    ENDTRY.

    TRY.
        rs_t100-msgv1 = text_get_param( it_params =  rs_t100-t_params iv_index = 1 ).
        rs_t100-msgv2 = text_get_param( it_params =  rs_t100-t_params iv_index = 2 ).
        rs_t100-msgv3 = text_get_param( it_params =  rs_t100-t_params iv_index = 3 ).
        rs_t100-msgv4 = text_get_param( it_params =  rs_t100-t_params iv_index = 4 ).
      CATCH cx_t100_msg.
    ENDTRY.


    rs_t100-s_bapiret2-message_v1 = rs_t100-msgv1.
    rs_t100-s_bapiret2-message_v2 = rs_t100-msgv2.
    rs_t100-s_bapiret2-message_v3 = rs_t100-msgv3.
    rs_t100-s_bapiret2-message_v4 = rs_t100-msgv4.
    rs_t100-s_bapiret2-number     = rs_t100-msgno.
    rs_t100-s_bapiret2-id         = rs_t100-msgid.
    rs_t100-s_bapiret2-message    = rs_t100-text_sylangu.
    rs_t100-s_bapiret2-type       = rs_t100-msgty.


  ENDMETHOD.                    "t100_get_info_by_any

  METHOD text_get_by_any.

    DATA:
     lo_t100 TYPE ty_s_type-o_help_t100.

    CREATE OBJECT lo_t100.

    lo_t100->get_text(
      EXPORTING
        i_any       = i_any
        iv_langu    = iv_langu
      RECEIVING
        rv_string   = rv_result ).

    mo_help->so_abap->info_get(  ).

*    h2=>


  ENDMETHOD.                    "t100_get_text_by_any



  METHOD write_any.

    DATA:
      lv_kind    TYPE string.

    mo_help->so_abap->rtts_get_info_any(
      EXPORTING
        i_any   = i_any
      IMPORTING
        ev_kind = lv_kind
*      ev_type =
    ).

    CASE lv_kind.

      WHEN 'T'.

        rt_result =  mo_help->so_txt->write_itab_all( i_any = i_any ).

      WHEN 'S'.

*      DATA: ls_line like STANDARD TABLE OF i_any.



      WHEN OTHERS.

    ENDCASE.


  ENDMETHOD.                    "itab_write_any

  METHOD text_get_by_idno.


    DATA:
      lv_msgid  TYPE sy-msgid,
      lv_msgno  TYPE sy-msgno,
      lv_strlen TYPE i,
      lv_idno   TYPE string.

*    ADD 1 TO iv_depth_info.

    lv_idno = iv_idno.
    SHIFT lv_idno RIGHT DELETING TRAILING ' '.
    SHIFT lv_idno RIGHT DELETING TRAILING ')'.

    lv_strlen = strlen(  lv_idno ) - 3.
    lv_msgno = lv_idno+lv_strlen(3).

    SHIFT lv_idno LEFT DELETING LEADING ' '.
    DATA lv_text TYPE char30.
    SPLIT lv_idno AT '(' INTO lv_msgid lv_text.
*    lv_msgid = iv_id(2).


    text_get_by_msg(
      EXPORTING
        iv_id       = lv_msgid
        iv_no       =  lv_msgno
        iv_langu    = iv_langu
        iv_v1       =     iv_v1
        iv_v2       =     iv_v2
        iv_v3       =     iv_v3
        iv_v4       =     iv_v4
        it_params   =     it_params
      RECEIVING
        rv_result   = rv_result  ).

  ENDMETHOD.

method text_get_by_cx.

  data: lx_root type ref to cx_root,
        lv_text type string.

  lx_root = ix_root.

  rv_result = lx_root->get_text( ).

  if iv_with_prev = abap_true.
    lx_root = lx_root->previous.
  while lx_root is bound.

    lv_text = lx_root->get_text( ).
    concatenate rv_result ' / ' lv_text into rv_result RESPECTING BLANKS.

    lx_root = lx_root->previous.
    ENDWHILE.
  endif.

  endmethod.


  METHOD text_get_by_msg.

    DATA:
   lo_t100 TYPE ty_s_type-o_help_t100.

    CREATE OBJECT lo_t100.


    IF it_params IS NOT INITIAL.

      rv_result =  lo_t100->get_text_by_t100(
*         EXPORTING
           iv_msgid    = iv_id
           iv_msgno    = iv_no
           iv_langu    = iv_langu
           it_params   = it_params   ).

    ELSE.

      rv_result =  lo_t100->get_text_by_t100(
*         EXPORTING
           iv_msgid    = iv_id
           iv_msgno    = iv_no
           iv_langu    = iv_langu
           iv_v1       = iv_v1
           iv_v2       = iv_v2
           iv_v3       = iv_v3
           iv_v4       = iv_v4  ).

    ENDIF.

  ENDMETHOD.                    "t100_get_text_by_t100

  METHOD t100_get_texttab_by_any_tab.

    DATA:
 lo_t100 TYPE ty_s_type-o_help_t100.

    CREATE OBJECT lo_t100.

    lo_t100->get_text_table(
      EXPORTING
        it_any      = it_any
        iv_langu    = iv_langu
      IMPORTING
        et_result   = rt_result
    ).

  ENDMETHOD.                    "t100_get_texttab_by_any_tab



  METHOD bapirettab_get_by_any.

    DATA:
      lt_bapiret TYPE bapiret2_tab,
      ls_info    TYPE ty_s_type-s_t100,
      lv_kind    TYPE string,
      lx_root    TYPE REF TO cx_root.

    FIELD-SYMBOLS:
      <lt_tab> TYPE any TABLE,
      <ls_any> TYPE any.

    mo_help->so_abap->rtts_get_info_any(
      EXPORTING
        i_any   = i_any
      IMPORTING
        ev_kind = lv_kind
*      ev_type =
    ).

    CASE lv_kind.

      WHEN 'T'.
        ASSIGN i_any TO <lt_tab>.

        LOOP AT <lt_tab> ASSIGNING <ls_any>.
          TRY.
              lt_bapiret = bapirettab_get_by_any( <ls_any> ).
              APPEND LINES OF lt_bapiret TO rt_result.
            CATCH cx_t100_msg.    "
          ENDTRY.

        ENDLOOP.


      WHEN 'R'.

        TRY.

            lx_root ?= i_any.
            rt_result = cx_get_bapiret2tab(  lx_root ).

          CATCH cx_root.

        ENDTRY.

    ENDCASE.


*      WHEN OTHERS.
    IF rt_result IS INITIAL.


      TRY.
          ls_info = mo_help->so_txt->info_get_by_any( i_any = i_any ).
          APPEND ls_info-s_bapiret2 TO rt_result.
        CATCH cx_t100_msg.
      ENDTRY.

    ENDIF.
*    ENDCASE.

  ENDMETHOD.                    "t100_get_bapirettab_by_any


  METHOD is_found.

    DATA:
        lo_t100 TYPE ty_s_type-o_help_t100.

    CREATE OBJECT lo_t100.


    "Gibt es Info auf DB?
    rv_result = lo_t100->is_info_existing( i_any = i_any ).

    "Wenn nein u egal ob auf DB Eintrag vorhanden
    IF rv_result = abap_false AND iv_strict_mode = abap_false.

      "Pruefen ob es überhaot id u NO gibt
      TRY.
          info_get_by_any( i_any =  i_any ).
          rv_result = abap_true.
        CATCH cx_t100_msg.
      ENDTRY.

    ENDIF.

  ENDMETHOD.                    "t100_is_existing_by_any

  METHOD is_found_a_in_t100.

    DATA:
      lo_t100 TYPE ty_s_type-o_help_t100.

    CREATE OBJECT lo_t100.

    rv_result = lo_t100->is_info_existing_by_t100(
*      EXPORTING
        iv_msgid  = iv_msgid
        iv_msgno  = iv_msgno  ).

  ENDMETHOD.                    "t100_is_existing_by_t100

  METHOD is_error.

    DATA:
      lo_t100 TYPE ty_s_type-o_help_t100,
      lv_type TYPE string.

    CREATE OBJECT lo_t100.

    lo_t100->get_info(
      EXPORTING
        i_any       = i_any
      IMPORTING
        ev_type     = lv_type  ).

    IF lv_type = 'E'.
      rv_result = abap_true.
    ENDIF.

  ENDMETHOD.                    "t100_is_error_by_any

  METHOD get_worst_type.

    DATA:
  lo_t100 TYPE ty_s_type-o_help_t100.

    CREATE OBJECT lo_t100.

    lo_t100->get_info(
      EXPORTING
        i_any       = i_any
      IMPORTING
        ev_type     = rv_result  ).

  ENDMETHOD.                    "t100_get_type_by_any

  METHOD bapiret_get_by_any.

    DATA:
        ls_t100 TYPE ty_s_type-s_t100.

    ls_t100 = info_get_by_any( i_any = i_any  ).

    rs_result-id         = ls_t100-msgid.
    rs_result-number     = ls_t100-msgno.
    rs_result-type       = ls_t100-msgty.
    rs_result-message_v1 = ls_t100-msgv1.
    rs_result-message_v2 = ls_t100-msgv2.
    rs_result-message_v3 = ls_t100-msgv3.
    rs_result-message_v4 = ls_t100-msgv4.
    rs_result-message    = ls_t100-text_sylangu.
*    append ls_bapi to ms_data-t_bapiret2_tab.


  ENDMETHOD.                    "text_get_bapiret2_by_any

  METHOD bapiret_get_by_all.

    DATA:
         ls_t100 TYPE ty_s_type-s_t100.

    ls_t100 =  info_get_by_all(
          iv_idno     = iv_idno
          iv_id       = iv_id
          iv_no       = iv_no
          iv_text     = iv_text
          iv_v1       = iv_v1
          iv_v2       = iv_v2
          iv_v3       = iv_v3
          iv_v4       = iv_v4
          iv_type     = iv_type  ).

    rs_bapi = ls_t100-s_bapiret2.

  ENDMETHOD.

  METHOD write_val.

    DATA:
      lv_char200 TYPE char200.

    mo_help->so_abap->conv_conversion_exit(
      EXPORTING
        iv_value     = i_any
        iv_is_input  = abap_false
*        iv_exit_name =
      IMPORTING
        ev_value     = i_any
    ).

    WRITE i_any TO lv_char200.

    rv_result = lv_char200.

*      CATCH cx_t100_msg.    "
    "Conv exit output

  ENDMETHOD.



  METHOD info_get_by_all.

    DATA:
      lv_idno   TYPE string,
      lv_strlen TYPE i,
      lv_msgno  TYPE string,
      lv_msgid  TYPE string.

    IF iv_idno IS NOT INITIAL.

      lv_idno = iv_idno.
      SHIFT lv_idno RIGHT DELETING TRAILING ' '.
      SHIFT lv_idno RIGHT DELETING TRAILING ')'.

      lv_strlen = strlen(  lv_idno ) - 3.
      lv_msgno = lv_idno+lv_strlen(3).

      SHIFT lv_idno LEFT DELETING LEADING ' '.
      DATA lv_text TYPE char30.
      SPLIT lv_idno AT '(' INTO lv_msgid lv_text.
*    lv_msgid = iv_id(2).

*    rs_bapi-id     = lv_msgid.
*    rs_bapi-number = lv_msgno.

      RETURN.
    ENDIF.


*    ev_id = lv_msgid.
*    ev_no = lv_msgno.


  ENDMETHOD.

  METHOD text_get_by_all.

  ENDMETHOD.

ENDCLASS.                    "lcl_base IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_help_error IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_error IMPLEMENTATION.

  METHOD factory_any.



    DATA:
      lx_t100     TYPE REF TO cx_root.

    IF NOT io_previous IS INITIAL.
      lx_t100 = io_previous.
    ENDIF.

    ADD 1 TO iv_depth_info.

    TRY.
        factory_by_single(
          EXPORTING
            i_any         = i_any3
            io_previous   = lx_t100
            iv_depth_info = iv_depth_info
          RECEIVING
            ro_t100     = lx_t100
        ).

      CATCH cx_t100_msg.
    ENDTRY.


    TRY.

        factory_by_single(
            EXPORTING
              i_any       = i_any2
              io_previous = lx_t100
                iv_depth_info = iv_depth_info
            RECEIVING
              ro_t100     = lx_t100
          ).

      CATCH cx_t100_msg.    "
    ENDTRY.


    TRY.

        factory_by_single(
          EXPORTING
            i_any       = i_any1
            io_previous = lx_t100
              iv_depth_info = iv_depth_info
          RECEIVING
            ro_t100     = lx_t100
        ).

      CATCH cx_t100_msg.    "
    ENDTRY.


    IF is_sy IS SUPPLIED.

      TRY.

          factory_by_single(
            EXPORTING
              i_any       = is_sy
              io_previous = lx_t100
              iv_depth_info = iv_depth_info
            RECEIVING
              ro_t100     = lx_t100
          ).

        CATCH cx_t100_msg.    "
      ENDTRY.

    ENDIF.

    TRY.
        ro_error ?= lx_t100.
      CATCH cx_root.
    ENDTRY.

    IF ro_error IS BOUND.
      RETURN.
    ENDIF.

    "DE UAMO    037 Objekt konnte nicht erzeugt werden
    raise_msg(
      EXPORTING
        iv_id    = 'UAMO'
        iv_no    = 037  ).


  ENDMETHOD.                    "factory_any


  METHOD factory_by_single.



    DATA:
      lv_kind   TYPE string,
      lv_msgid  TYPE string,
      lv_msgno  TYPE string,
      lt_params TYPE ty_s_type-t_name_value_pair,
      lx_t100   TYPE REF TO cx_t100_msg,
      ls_t100   TYPE ty_s_type-s_t100.

    FIELD-SYMBOLS:
      <lt_any> TYPE ANY TABLE.

    ADD 1 TO iv_depth_info.


    "Ist input gefüllt?
*    check_a_raise_is_not_initial( i_any = i_any ).
    IF i_any IS INITIAL.
      RAISE EXCEPTION TYPE cx_t100_msg
        EXPORTING
          t100_msgid = 'UCFE'
          t100_msgno = 888.
    ENDIF.

    """""""""""""""""""""""""""""""""""""""""
    " Was wurde hereingegeben?

    mo_help->so_abap->rtts_get_info_any(
      EXPORTING
        i_any   = i_any
      IMPORTING
        ev_kind = lv_kind
    ).


    """""""""""""""""""""""""""""""""""""""""
    " CX_T100 erzeugen

    TRY.

        CASE lv_kind.

          WHEN cl_abap_typedescr=>kind_elem.

            mo_help->so_txt->text_get_like_t100(
              EXPORTING
                iv_text   = i_any
              IMPORTING
                ev_msgid  = lv_msgid
                ev_msgno  = lv_msgno
                et_params = lt_params
            ).

            factory_msg(
              EXPORTING
                iv_id    = lv_msgid
                iv_no    = lv_msgno
                it_params   = lt_params
                io_previous = io_previous
                iv_depth_info = iv_depth_info
              RECEIVING
                rx_t100     = lx_t100  ).

          WHEN cl_abap_typedescr=>kind_struct.

            ls_t100 =  mo_help->so_txt->info_get_by_any(
                   i_any            = i_any ).

            lv_msgid  = ls_t100-msgid.
            lv_msgno  = ls_t100-msgno.
            lt_params = ls_t100-t_params.


            factory_msg(
              EXPORTING
                iv_id      = lv_msgid
                iv_no      = lv_msgno
                it_params     = lt_params
                io_previous   = io_previous
                iv_depth_info = iv_depth_info
              RECEIVING
                rx_t100     = lx_t100  ).


          WHEN cl_abap_typedescr=>kind_table.

            ASSIGN i_any TO <lt_any>.

            lx_t100 = factory_by_table(
              it_any      =  <lt_any>
              io_previous = io_previous
              iv_depth_info = iv_depth_info ).

        ENDCASE.


      CATCH cx_t100_msg.
    ENDTRY.

    ro_t100 = lx_t100.

    IF ro_t100 IS NOT BOUND.

      "DE UAMO    037 Objekt konnte nicht erzeugt werden
      mo_help->so_error->raise_msg(
        EXPORTING
          iv_id    = 'UAMO'
          iv_no    = 037  ).
    ENDIF.



  ENDMETHOD.                    "factory_by_single


  METHOD factory_by_table.
*
*

    DATA:
      lv_type     TYPE string,
      lv_msgid    TYPE string,
      lv_msgno    TYPE string,
      lt_params   TYPE ty_s_type-t_name_value_pair,
      lo_previous TYPE REF TO cx_root,
      ls_t100     TYPE ty_s_type-s_t100.

    FIELD-SYMBOLS:
      <ls_any> TYPE any.

    lo_previous = io_previous.

    ADD 1 TO iv_depth_info.

    LOOP AT it_any ASSIGNING <ls_any>.
      FREE lt_params.

      TRY.

          ls_t100 =  mo_help->so_txt->info_get_by_any(
               i_any            = <ls_any> ).

          lv_msgid   = ls_t100-msgid.
          lv_msgno   = ls_t100-msgno.
          lt_params  = ls_t100-t_params.
          lv_type    = ls_t100-msgty.


          IF lv_type <> 'E'.
            CONTINUE.
          ENDIF.

          factory_msg(
            EXPORTING
              iv_id    = lv_msgid
              iv_no    = lv_msgno
              it_params   = lt_params
              io_previous =  lo_previous
              iv_depth_info = iv_depth_info
            RECEIVING
              rx_t100     = ro_t100 ).

          lo_previous = ro_t100.

        CATCH cx_root.

      ENDTRY.

    ENDLOOP.



  ENDMETHOD.                    "factory_by_table


  METHOD factory_idno.

    DATA:
      lv_msgid  TYPE sy-msgid,
      lv_msgno  TYPE sy-msgno,
      lv_strlen TYPE i,
      lv_idno   TYPE string.

    ADD 1 TO iv_depth_info.

    lv_idno = iv_idno.
    SHIFT lv_idno RIGHT DELETING TRAILING ' '.
    SHIFT lv_idno RIGHT DELETING TRAILING ')'.

    lv_strlen = strlen(  lv_idno ) - 3.
    lv_msgno = lv_idno+lv_strlen(3).

    SHIFT lv_idno LEFT DELETING LEADING ' '.
    DATA lv_text TYPE char30.
    SPLIT lv_idno AT '(' INTO lv_msgid lv_text.
*    lv_msgid = iv_id(2).


*    SPLIT iv_idno AT ' | ' INTO lv_msgid lv_msgno.
*    SHIFT: lv_msgno LEFT DELETING LEADING ' '.


    factory_msg(
      EXPORTING
        iv_id      =  lv_msgid
        iv_no      =  lv_msgno
        iv_v1         =  iv_v1
        iv_v2         =  iv_v2
        iv_v3         =  iv_v3
        iv_v4         =  iv_v4
        it_params     =  it_params
        io_previous   = io_previous
        iv_depth_info = iv_depth_info
        ii_add_data   = ii_add_data
      RECEIVING
        rx_t100       = rx_t100 ).


*    DATA:
*        lx_t100 TYPE ty_s_type-x_help_error. "REF TO lcx_help_error. "zcx_help_error.
*    TRY.
*        lx_t100 ?= rx_t100.
*        lx_t100->mv_type = iv_idno.

*      CATCH cx_root.
*    ENDTRY.


  ENDMETHOD.                    "factory_const


  METHOD factory_function.



    DATA:
      lx_t100_select   TYPE REF TO cx_t100_msg,
      ls_stack         TYPE LINE OF abap_callstack,
      lv_name_function TYPE string,
      lx_t100_any      TYPE REF TO cx_root,
      ls_sy            TYPE syst,
      lt_stack         TYPE abap_callstack,
      ls_stack_new     TYPE abap_callstack_line,
      lx_help_error    TYPE ty_s_type-x_help_error.

    FIELD-SYMBOLS:
    <ls_stack> TYPE LINE OF abap_callstack.

    ADD 1 TO iv_depth_info.

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Input übernehmen

    IF is_sy IS SUPPLIED.
      ls_sy = is_sy.
    ENDIF.

    TRY.

        factory_any(
          EXPORTING
            i_any1       = i_any1
            i_any2      = i_any2
            i_any3      = i_any3
            is_sy       = ls_sy
            io_previous = io_previous
          iv_depth_info = iv_depth_info
          RECEIVING
            ro_error    = lx_t100_any
        ).

      CATCH cx_t100_msg.
        lx_t100_any = io_previous.
    ENDTRY.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Function Nachricht

    mo_help->so_abap->code_get_callstack(
      IMPORTING
        et_callstack    = lt_stack  ).

    "Diese methode hier ist uninteressant
    DELETE lt_stack INDEX 1.
    READ TABLE lt_stack INDEX iv_depth_info
        INTO ls_stack.

    mo_help->so_abap->code_get_function_info(
            EXPORTING
                is_called = ls_stack
            IMPORTING
     ev_name_function = lv_name_function
     es_stack = ls_stack_new ).

    "D  1L 102  Fehler bei Aufruf von Funktionsbaustein &1
    factory_msg(
      EXPORTING
          iv_id = '1L'
          iv_no = 102
          iv_v1 = lv_name_function
       io_previous = lx_t100_any
               iv_depth_info = iv_depth_info
      RECEIVING
        rx_t100     =  lx_t100_select  ).

    TRY.
        lx_help_error ?= lx_t100_select.
        READ TABLE lx_help_error->mt_stack ASSIGNING <ls_stack> INDEX 1.
        <ls_stack> = ls_stack_new.
      CATCH cx_root.
    ENDTRY.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Kopfnachricht

    TRY.

        factory_head(
          EXPORTING
            iv_text     =  iv_text
            iv_msgid    =  iv_id
            iv_msgno    =  iv_no
            iv_v1       =  iv_v1
            iv_v2       =  iv_v2
            iv_v3       =  iv_v3
            iv_v4       =  iv_v4
            io_previous =  lx_t100_select
         iv_depth_info = iv_depth_info
          RECEIVING
            ro_result   = r_result
        ).

      CATCH cx_t100_msg.
        r_result = lx_t100_select.
    ENDTRY.


  ENDMETHOD.                    "factory_function


  METHOD factory_head.


    ADD 1 TO iv_depth_info.


    IF iv_idno IS NOT INITIAL.

      factory_idno(
        EXPORTING
          iv_idno         = iv_idno
          iv_v1         = iv_v1
          iv_v2         = iv_v2
          iv_v3         = iv_v3
          iv_v4         = iv_v4
          io_previous   = io_previous
          iv_depth_info = iv_depth_info
        RECEIVING
          rx_t100       = ro_result
      ).


    ELSEIF iv_msgid IS NOT INITIAL AND iv_msgno IS NOT INITIAL.

      factory_msg(
         EXPORTING
           iv_id    = iv_msgid
           iv_no    = iv_msgno
           iv_v1    =    iv_v1
           iv_v2    =    iv_v2
           iv_v3    =    iv_v3
           iv_v4    =    iv_v4
           io_previous =  io_previous
             iv_depth_info = iv_depth_info
         RECEIVING
           rx_t100     = ro_result
           ).


    ELSEIF iv_text IS NOT INITIAL.

      factory_text(
         EXPORTING
           iv_text     = iv_text
           iv_v1    =    iv_v1
           iv_v2    =    iv_v2
           iv_v3    =    iv_v3
           iv_v4    =    iv_v4
           io_previous =  io_previous
             iv_depth_info = iv_depth_info
         RECEIVING
           ro_error     = ro_result
       ).

    ELSEIF io_previous IS BOUND.
      TRY.
          ro_result ?= io_previous.

        CATCH cx_root.

          "D  FP  065 Kein Input übergeben & & & &
          raise_msg(
            EXPORTING
              iv_id      = 'FP'
              iv_no      = 065
              iv_v1         = ' '
              iv_v2         = ' '
              iv_v3         = ' '
              iv_v4         = ' '  ).

      ENDTRY.
    ELSE.

      "D  FP  065 Kein Input übergeben & & & &
      raise_msg(
        EXPORTING
          iv_id      = 'FP'
          iv_no      = 065
          iv_v1         = ' '
          iv_v2         = ' '
          iv_v3         = ' '
          iv_v4         = ' '  ).

    ENDIF.



  ENDMETHOD.                    "factory_head


  METHOD factory_method.





  ENDMETHOD.                    "factory_method


  METHOD factory_msg.



    DATA:
      lv_msgv1 TYPE string,
      lv_msgv2 TYPE string,
      lv_msgv3 TYPE string,
      lv_msgv4 TYPE string,
      lv_msgid TYPE sy-msgid,
      lv_msgno TYPE sy-msgno.

    DATA:
      li_t100 TYPE REF TO if_t100_message.

    ADD 1 TO iv_depth_info.


    IF it_params IS NOT INITIAL. "SUPPLIED.

      TRY.
          lv_msgv1 = mo_help->so_txt->text_get_param( it_params = it_params  iv_index  = 1  ).
          lv_msgv2 = mo_help->so_txt->text_get_param( it_params = it_params  iv_index  = 2  ).
          lv_msgv3 = mo_help->so_txt->text_get_param( it_params = it_params  iv_index  = 3  ).
          lv_msgv4 = mo_help->so_txt->text_get_param( it_params = it_params  iv_index  = 4  ).

        CATCH cx_t100_msg.
      ENDTRY.

    ELSE.
      lv_msgv1 = mo_help->so_abap->conv_get_string( iv_v1 ).
      lv_msgv2 = mo_help->so_abap->conv_get_string( iv_v2 ).
      lv_msgv3 = mo_help->so_abap->conv_get_string( iv_v3 ).
      lv_msgv4 = mo_help->so_abap->conv_get_string( iv_v4 ).
    ENDIF.


    lv_msgid = iv_id.
    lv_msgno = iv_no.


    TRY.

        DATA:
         lx_t100 TYPE ty_s_type-x_help_error.

        DATA:
          ptab      TYPE abap_parmbind_tab,
          ptab_line TYPE abap_parmbind.

        ptab_line-name = 'PREVIOUS'.
        ptab_line-kind = cl_abap_objectdescr=>exporting.
        GET REFERENCE OF io_previous INTO ptab_line-value.
        INSERT ptab_line INTO TABLE ptab.

        CREATE OBJECT lx_t100
          TYPE
            (cs_const-name_c_class)
          PARAMETER-TABLE
            ptab
          . "zcx_help_error_ext.

        rx_t100 = lx_t100.

        TRY.
            li_t100 ?= rx_t100.

            li_t100->t100key-msgno = lv_msgno.
            li_t100->t100key-msgid = lv_msgid.
            li_t100->t100key-attr1 = lv_msgv1.
            li_t100->t100key-attr2 = lv_msgv2.
            li_t100->t100key-attr3 = lv_msgv3.
            li_t100->t100key-attr4 = lv_msgv4.


          CATCH cx_root.

            lx_t100->t100_msgid = lv_msgid.
            lx_t100->t100_msgno = lv_msgno.
            lx_t100->t100_msgv1 = lv_msgv1.
            lx_t100->t100_msgv2 = lv_msgv2.
            lx_t100->t100_msgv3 = lv_msgv3.
            lx_t100->t100_msgv4 = lv_msgv4.
*        me->

        ENDTRY.

        lx_t100->set_inheritance_attributes(
            EXPORTING
              iv_depth_info = iv_depth_info
              ii_add_data   = ii_add_data
          ).


      CATCH cx_root.

        "Im worst case wird eine cx_t100_msg erzeugt
        ASSERT CONDITION lx_t100 IS BOUND. "SY-SUBRC <> 0

    ENDTRY.



*    """"""""""""""""""""""""""""""""""""""""""""""""""""
*    " Letzten 100 texte werden gespeichert, damit im Debugger einfach nachgelesen werden
*    " kann, welche Fehler passiert sind
*
*    lv_text      = rx_t100->get_text( ).
*    lv_text_long = rx_t100->get_longtext(  ).
*    CONCATENATE
*        lv_text '   |   Longtext: ' lv_text_long INTO lv_text RESPECTING BLANKS.
*    INSERT lv_text INTO st_generated_text INDEX 1.
*    lv_lines = lines( st_generated_text ).
*    IF lv_lines > 100.
*      DELETE st_generated_text INDEX 101.
*    ENDIF.
*


  ENDMETHOD.                    "factory_msg


  METHOD factory_read_table.

    DATA:
      ls_stack      TYPE LINE OF abap_callstack,
      lt_stack      TYPE abap_callstack,
      lv_name_table TYPE string.

    ADD 1 TO iv_depth_info.

*h=>

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Selectnachricht

    mo_help->so_abap->code_get_callstack(
      IMPORTING
        et_callstack    = lt_stack  ).

    "Diese methode hier ist uninteressant
    DELETE lt_stack INDEX 1.
    READ TABLE lt_stack INDEX iv_depth_info
        INTO ls_stack.

    mo_help->so_abap->code_get_read_table_info(
            EXPORTING
                is_called = ls_stack
            IMPORTING
                ev_name_function = lv_name_table ).


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Bauen

    "DE  DS  353 Fehler beim Zugriff auf die interne Tabelle & (&)
    factory_msg(
      EXPORTING
          iv_id = 'DS'
          iv_no = 353
          iv_v1 = ' '
          iv_v2 = lv_name_table
          iv_depth_info = iv_depth_info
      RECEIVING
        rx_t100     =  rx_result  ).


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Kopfnachricht

    TRY.
        factory_head(
          EXPORTING
            iv_text       =  iv_text
            iv_msgid      =  iv_id
            iv_msgno      =  iv_no
            iv_v1         =  iv_v1
            iv_v2         =  iv_v2
            iv_v3         =  iv_v3
            iv_v4         =  iv_v4
            io_previous   =  rx_result
            iv_depth_info =  iv_depth_info
          RECEIVING
            ro_result     = rx_result
        ).
      CATCH cx_t100_msg.    "
    ENDTRY.


  ENDMETHOD.                    "factory_read_table


  METHOD factory_select.

    DATA:
      lx_t100_select TYPE REF TO cx_t100_msg,
      ls_stack       TYPE LINE OF abap_callstack,
      lt_stack       TYPE abap_callstack,
      lv_name_table  TYPE string.

    ADD 1 TO iv_depth_info.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Selectnachricht

    mo_help->so_abap->code_get_callstack(
      IMPORTING
        et_callstack    = lt_stack  ).

    "Diese methode hier ist uninteressant
    DELETE lt_stack INDEX 1.
    READ TABLE lt_stack INDEX iv_depth_info
        INTO ls_stack.

    mo_help->so_abap->code_get_select_info(
      EXPORTING
        is_called     = ls_stack
      IMPORTING
        ev_name_table = lv_name_table
    ).
*
*            i_where1 type simple optional
*          i_where2 type simple optional
*          i_where3 type simple optional

    DATA:
      ls_dd02t    TYPE dd02t,
      lv_text     TYPE string,
      lv_name     TYPE string,
      lv_scrtext  TYPE string,
      lv_typename TYPE string,
      lv_value    TYPE string.

    SELECT SINGLE *
      FROM dd02t
      INTO CORRESPONDING FIELDS OF ls_dd02t
      WHERE tabname = lv_name_table
      AND   ddlanguage = sy-langu.

    IF sy-subrc = 0.
      lv_text = mo_help->so_txt->text_get_by_msg(
                  iv_id = 'CCSEQ' iv_no = 061 iv_v1 = lv_name_table ).

      CONCATENATE '(' ls_dd02t-ddtext ')' INTO lv_name.
      CONCATENATE lv_text lv_name INTO lv_text RESPECTING BLANKS.


      IF i_where1 IS NOT INITIAL.

        mo_help->so_abap->rtts_get_info_simple(
               EXPORTING
                  iv_element = i_where1
               IMPORTING
                  !ev_typename    = lv_typename
*          !ev_domname     TYPE string
*          !ev_convexit    TYPE string
*          !ev_outputlen   TYPE i
*          !ev_title       TYPE string
*          !ev_shortdescr  TYPE string
                  !ev_scrtext_s   = lv_scrtext ).
*          !ev_scrtext_m   TYPE string
*          !ev_scrtext_l   TYPE string
*          ev_is_ddic      TYPE abap_bool
*          es_fielddescr   TYPE dfies

        lv_value = mo_help->so_abap->conv_get_string( i_where1 ).

        CONCATENATE lv_text ' / ' lv_typename '=' lv_value INTO lv_text RESPECTING BLANKS.

      ENDIF.

      IF i_where2 IS NOT INITIAL.

        mo_help->so_abap->rtts_get_info_simple(
               EXPORTING
                  iv_element = i_where2
               IMPORTING
                  !ev_typename    = lv_typename
                  !ev_scrtext_s   = lv_scrtext ).

        lv_value = mo_help->so_abap->conv_get_string( i_where2 ).

        CONCATENATE lv_text ' / ' lv_typename '=' lv_value INTO lv_text RESPECTING BLANKS.

      ENDIF.

      IF i_where3 IS NOT INITIAL.

        mo_help->so_abap->rtts_get_info_simple(
               EXPORTING
                  iv_element = i_where3
               IMPORTING
                  !ev_typename    = lv_typename
                  !ev_scrtext_s   = lv_scrtext ).
        lv_value = mo_help->so_abap->conv_get_string( i_where3 ).

        CONCATENATE lv_text ' / ' lv_typename '=' lv_value INTO lv_text RESPECTING BLANKS.

      ENDIF.

      factory_text(
      EXPORTING
        iv_text      = lv_text
        io_previous  = io_previous
       iv_depth_info = iv_depth_info
      RECEIVING
        ro_error     =  lx_t100_select   ).

    ELSE.

      "Fehler beim Zugriff auf Datenbanktabelle &1
      factory_msg(
        EXPORTING
          iv_id      = 'CCSEQ'
          iv_no      = 061
          iv_v1         = lv_name_table
          io_previous   = io_previous
          iv_depth_info = iv_depth_info
        RECEIVING
          rx_t100       =  lx_t100_select   ).

    ENDIF.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Kopfnachricht

    TRY.

        factory_head(
          EXPORTING
            iv_text     =  iv_text
            iv_idno     =  iv_idno
            iv_msgid    =  iv_id
            iv_msgno    =  iv_no
            iv_v1       =  iv_v1
            iv_v2       =  iv_v2
            iv_v3       =  iv_v3
            iv_v4       =  iv_v4
            io_previous =  lx_t100_select
                iv_depth_info = iv_depth_info
          RECEIVING
            ro_result   = rx_result
        ).

      CATCH cx_t100_msg.
        rx_result = lx_t100_select.
    ENDTRY.


  ENDMETHOD.                    "factory_select


  METHOD factory_text.



    DATA:
      lt_params TYPE ty_s_type-t_name_value_pair,
      lv_msgid  TYPE string,
      lv_msgno  TYPE string,
      lv_text   TYPE string.


    ADD 1 TO iv_depth_info.

    """""""""""""""""""""""""""""""""""""""""""""
    " Text zusammenbauen

    mo_help->so_txt->text_get_w_params(
      EXPORTING
        iv_text   =   iv_text
        iv_v1     =   iv_v1
        iv_v2     =   iv_v2
        iv_v3     =   iv_v3
        iv_v4     =   iv_v4
      RECEIVING
        rv_text   = lv_text
    ).


    """""""""""""""""""""""""""""""""""""""""""""
    " Textinfo holen

    mo_help->so_txt->text_get_like_t100(
      EXPORTING
        iv_text   = lv_text
        iv_v1     = iv_v1
        iv_v2     = iv_v2
        iv_v3     = iv_v3
        iv_v4     = iv_v4
      IMPORTING
        ev_msgid  =  lv_msgid
        ev_msgno  =  lv_msgno
        et_params =  lt_params  ).


    """""""""""""""""""""""""""""""""""""""""""""
    " Exception befuellen

    factory_msg(
      EXPORTING
        iv_id    =       '00'
        iv_no    =       398
        it_params   = lt_params
        io_previous = io_previous
        iv_depth_info = iv_depth_info
      RECEIVING
        rx_t100     = ro_error
    ).



  ENDMETHOD.                    "factory_text


  METHOD is_any_error.

    rv_result =  mo_help->so_abap->check_is_error( i_any = i_any1 ).
    CHECK rv_result = abap_false.

    rv_result  =  mo_help->so_abap->check_is_error( i_any = i_any2 ).
    CHECK rv_result = abap_false.

    rv_result  =  mo_help->so_abap->check_is_error( i_any = i_any3 ).
    CHECK rv_result = abap_false.

    IF is_sy IS SUPPLIED.
      rv_result  =  mo_help->so_abap->check_is_error( i_any = is_sy ).
    ENDIF.

  ENDMETHOD.                    "is_any_error


  METHOD raise.

    DATA:
      ls_info  TYPE ty_s_type-s_t100,
      lv_dummy TYPE string.


    IF iv_rollb_work = abap_true.
      ROLLBACK WORK.                                  "#EC CI_ROLLBACK.
    ENDIF.

    ls_info = mo_help->so_txt->info_get_by_any( ix_t100 ).

    sy-msgid = ls_info-msgid.
    sy-msgno = ls_info-msgno.
    sy-msgv1 = ls_info-msgv1.
    sy-msgv2 = ls_info-msgv2.
    sy-msgv3 = ls_info-msgv3.
    sy-msgv4 = ls_info-msgv4.

    MESSAGE
    ID sy-msgid
    TYPE 'E'
    NUMBER sy-msgno
    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
    INTO lv_dummy.

    IF iv_is_resumable = abap_false.
      RAISE EXCEPTION ix_t100.

    ELSE.
*      RAISE RESUMABLE EXCEPTION ix_t100.

    ENDIF.


  ENDMETHOD.                    "raise


  METHOD raise_any.

    DATA:
      lx_t100 TYPE REF TO cx_t100_msg.

    "Wenn sy nicht reingegeben wird -> is_sy löschen
    "Gehen so sicher, dass mit sy keine Nachricht gebaut wird
    IF is_sy IS NOT SUPPLIED.
      FREE is_sy.
    ENDIF.

    ADD 1 TO iv_depth_info.

    factory_any(
      EXPORTING
        i_any1       = i_any1
        i_any2      = i_any2
        i_any3      = i_any3
        is_sy       = is_sy
        io_previous = io_previous
        iv_depth_info = iv_depth_info
      RECEIVING
        ro_error    = lx_t100
    ).

    raise(
        EXPORTING
          ix_t100       = lx_t100
          iv_depth_info =  iv_depth_info
          iv_rollb_work = iv_rollb_work
         iv_is_resumable   =  iv_is_resumable
     ).



  ENDMETHOD.                    "raise_any


  METHOD raise_idno.


    DATA:
     lx_t100 TYPE REF TO cx_t100_msg.

    ADD 1 TO iv_depth_info.

    factory_idno(
      EXPORTING
        iv_idno         =  iv_idno
        iv_v1         =  iv_v1
        iv_v2         =  iv_v2
        iv_v3         =  iv_v3
        iv_v4         =  iv_v4
        it_params     =  it_params
        io_previous   =  io_previous
        iv_depth_info =  iv_depth_info
      RECEIVING
        rx_t100       = lx_t100
    ).


    raise(
      EXPORTING
        ix_t100         = lx_t100
        iv_depth_info   = iv_depth_info
        iv_is_resumable = iv_is_resumable
        iv_rollb_work   = iv_rollb_work
    ).


  ENDMETHOD.                    "raise_const


  METHOD raise_function.



    DATA:
        lx_t100 TYPE REF TO cx_t100_msg.

    "Das Coding hier soll nicht analysiert werden für Fubanachricht
    ADD 1 TO iv_depth_info.

    "Wenn sy nicht reingegeben wird -> is_sy löschen
    "Gehen so sicher, dass mit sy keine Nachricht gebaut wird
    IF is_sy IS NOT SUPPLIED.
      FREE is_sy.
    ENDIF.

    factory_function(
      EXPORTING
        i_any1        = i_any1
        i_any2        = i_any2
        i_any3        = i_any3
        is_sy         = is_sy
        iv_text       = iv_text
        iv_id      = iv_msgid
        iv_no      = iv_msgno
        iv_v1         = iv_v1
        iv_v2         = iv_v2
        iv_v3         = iv_v3
        iv_v4         = iv_v4
        io_previous   = io_previous
        iv_depth_info = iv_depth_info
      RECEIVING
        r_result      = lx_t100
    ).


    IF iv_rollb_work = abap_true.
      ROLLBACK WORK.
    ENDIF.

    raise(
   EXPORTING
     ix_t100       = lx_t100
     iv_depth_info =  iv_depth_info
     iv_rollb_work = iv_rollb_work
         iv_is_resumable   =  iv_is_resumable
 ).



  ENDMETHOD.                    "raise_function


  METHOD raise_method.





  ENDMETHOD.                    "raise_method


  METHOD raise_msg.

    DATA:
      lx_t100 TYPE REF TO cx_t100_msg.

    ADD 1 TO iv_depth_info.

    factory_msg(
      EXPORTING
        iv_id      =  iv_id
        iv_no      =  iv_no
        iv_v1         =  iv_v1
        iv_v2         =  iv_v2
        iv_v3         =  iv_v3
        iv_v4         =  iv_v4
        it_params     =  it_params
        io_previous   =  io_previous
        iv_depth_info = iv_depth_info
      RECEIVING
        rx_t100       = lx_t100
    ).

    raise(
      EXPORTING
        ix_t100       = lx_t100
        iv_depth_info =  iv_depth_info
        iv_rollb_work = iv_rollb_work
         iv_is_resumable   =  iv_is_resumable
    ).


  ENDMETHOD.                    "raise_msg


  METHOD raise_read_table.



    DATA:
       lx_t100 TYPE REF TO cx_t100_msg.

    ADD 1 TO iv_depth_info.


    factory_read_table(
      EXPORTING
        iv_text       =  iv_text
        iv_id      =  iv_msgid
        iv_no      =  iv_msgno
        iv_v1         =  iv_v1
        iv_v2         =  iv_v2
        iv_v3         =  iv_v3
        iv_v4         =  iv_v4
        io_previous   =  io_previous
        iv_depth_info =  iv_depth_info
      RECEIVING
        rx_result     = lx_t100
    ).


    raise(
      EXPORTING
        ix_t100           =  lx_t100
        iv_depth_info     = iv_depth_info
        iv_rollb_work     = iv_rollb_work
        iv_is_resumable   =  iv_is_resumable
    ).



  ENDMETHOD.                    "raise_read_table


  METHOD raise_select.



    DATA:
        lx_t100 TYPE REF TO cx_t100_msg.

    "Das Coding hier soll nicht analysiert werden für Selectnachricht
    ADD 1 TO iv_depth_info.

    factory_select(
      EXPORTING
        iv_text       = iv_text
        iv_idno       = iv_idno
        iv_id         = iv_id
        iv_no         = iv_no
        iv_v1         = iv_v1
        iv_v2         = iv_v2
        iv_v3         = iv_v3
        iv_v4         = iv_v4
        io_previous   = io_previous
        iv_depth_info = iv_depth_info
         i_where1      = i_where1
i_where2       = i_where2
i_where3       = i_where3
      RECEIVING
        rx_result    =  lx_t100 ).

    raise(
      EXPORTING
        ix_t100       = lx_t100
        iv_depth_info =  iv_depth_info
        iv_is_resumable   =  iv_is_resumable ).



  ENDMETHOD.                    "raise_select


  METHOD raise_text.



    DATA:
     lx_t100 TYPE REF TO cx_t100_msg.

    "Das Coding hier soll nicht analysiert werden für Selectnachricht
    ADD 1 TO iv_depth_info.

    factory_text(
        EXPORTING
        iv_text     = iv_text
        iv_v1       = iv_v1
        iv_v2       = iv_v2
        iv_v3       = iv_v3
        iv_v4       = iv_v4
        io_previous = io_previous
        iv_depth_info = iv_depth_info
      RECEIVING
        ro_error    = lx_t100 ).

    raise(
    ix_t100       = lx_t100
    iv_depth_info =  iv_depth_info
    iv_rollb_work = iv_rollb_work
         iv_is_resumable   =  iv_is_resumable ).



  ENDMETHOD.                    "raise_text
  METHOD get_instance.

    CREATE OBJECT ro_result.
*      EXPORTING
*        iv_classname_error = iv_classname_error.

    "Prüfung ob name vom typ cx_t100_msg
    "Wenn nein dann cx_t100_msg

  ENDMETHOD.                    "get_instance

  METHOD add_info.

    DATA:
       lx_t100 TYPE REF TO lcx_help_exception.

    TRY.

        lx_t100 ?= ix_root.

        IF ii_serializable IS SUPPLIED.
          lx_t100->mv_xml =  mo_help->so_data->trans_any_2_xml_zip( i_any = ii_serializable ).
        ENDIF.

        IF i_bapirettab IS SUPPLIED.
          lx_t100->mt_bapiret = mo_help->so_txt->bapirettab_get_by_any( i_bapirettab ).
        ENDIF.

        IF i_write IS SUPPLIED.
          lx_t100->mt_write = mo_help->so_txt->write_any( i_any = i_write ).
        ENDIF.

      CATCH cx_root.
    ENDTRY.

  ENDMETHOD.                    "add_info

ENDCLASS.                    "lcl_error_factory IMPLEMENTATION


CLASS lcl_help_check_a_raise IMPLEMENTATION.


  METHOD after_commit.


    IF is_sy-subrc = 0.
      RETURN.
    ENDIF.

    mo_help->so_error->raise_text( 'Datenbank Commit konnte nicht ausgeführt werden.' ).


  ENDMETHOD.                    "after_commit


  METHOD after_function.



    DATA:
      lv_is_error      TYPE abap_bool.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ist es ein Fehler?

    IF is_sy IS NOT SUPPLIED OR is_sy-subrc = 0.
      FREE is_sy.
    ENDIF.


    mo_help->so_error->is_any_error(
     EXPORTING
         i_any1    = i_any1
         i_any2    = i_any2
         i_any3    = i_any3
         is_sy     = is_sy
     RECEIVING
         rv_result = lv_is_error ).

    CHECK lv_is_error = abap_true.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Werfen


    mo_help->so_error->raise_function(
    EXPORTING
      i_any1        =  i_any1
      i_any2        =  i_any2
      i_any3        =  i_any3
      is_sy         =  is_sy
      iv_text       =  iv_text
      iv_msgid      =  iv_msgid
      iv_msgno      =  iv_msgno
      iv_v1         =  iv_v1
      iv_v2         =  iv_v2
      iv_v3         =  iv_v3
      iv_v4         =  iv_v4
      io_previous   =  io_previous
      iv_rollb_work =  iv_rollb_work
      iv_depth_info =  1 "das Coding hier soll nicht analysiert werden
     ).



  ENDMETHOD.                    "after_function


  METHOD after_method.





  ENDMETHOD.                    "after_method


  METHOD after_read_table.

    " Ist es ein Fehler?
    CHECK is_sy-subrc <> 0.


    " Werfen
    mo_help->so_error->raise_read_table(
     EXPORTING
       iv_text       =    iv_text
       iv_msgid      =    iv_msgid
       iv_msgno      =    iv_msgno
       iv_v1         =    iv_v1
       iv_v2         =    iv_v2
       iv_v3         =    iv_v3
       iv_v4         =    iv_v4
       io_previous   =    io_previous
       iv_depth_info = 1
   ).
*
  ENDMETHOD.                    "after_read_table
*
*
  METHOD after_select.
*
    DATA:
      lv_is_error TYPE abap_bool.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ist es ein Fehler?

    lv_is_error = mo_help->so_abap->check_is_error( i_any = is_sy ).
    CHECK lv_is_error = abap_true.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " raise

    mo_help->so_error->raise_select(
      EXPORTING
          iv_text       =   iv_text
          iv_idno       =   iv_idno
          iv_id         =   iv_id
          iv_no         =   iv_no
          iv_v1         =   iv_v1
          iv_v2         =   iv_v2
          iv_v3         =   iv_v3
          iv_v4         =   iv_v4
          io_previous   =   io_previous
          iv_depth_info = 1
        i_where1      = i_where1
       i_where2       = i_where2
       i_where3       = i_where3 ).



  ENDMETHOD.                    "after_select


  METHOD any_data.

    DATA:
      lv_is_error TYPE abap_bool.


    """""""""""""""""""""""""""""""""""
    " Ist es ein Fehler?

    IF is_sy IS NOT SUPPLIED.
      FREE is_sy.
    ENDIF.

    mo_help->so_error->is_any_error(
      EXPORTING
          i_any1    = i_any1
          i_any2    = i_any2
          i_any3    = i_any3
          is_sy     = is_sy
      RECEIVING
          rv_result = lv_is_error ).

    CHECK lv_is_error = abap_true.


    """""""""""""""""""""""""""""""""""
    " Werfen

    mo_help->so_error->raise_any(
   EXPORTING
     i_any1        = i_any1
     i_any2        = i_any2
     i_any3        = i_any3
     is_sy         = is_sy
     io_previous   = io_previous
     iv_rollb_work = iv_rollb_work
     iv_is_resumable = iv_is_resumable
 ).

  ENDMETHOD.                    "any_data


  METHOD field_exist.





  ENDMETHOD.                    "field_exist


  METHOD is_assigned.





  ENDMETHOD.                    "is_assigned

  METHOD is_range_valid.
*
*    FIELD-SYMBOLS:
*      <sign>   TYPE any,
*      <option> TYPE any,
*      <low>    TYPE any,
*      <high>   TYPE any.
*
*    DATA:
*      lv_typename TYPE string,
*      lv_descr    TYPE string.
*
*    TRY.
*        """""""""""""""""""""""""""""""""""""""""""""""""""
*        " Struktur prüfen
*
*        ASSIGN ('IS_RANGE-OPTION') TO <option>.
*        ASSIGN ('IS_RANGE-SIGN')   TO <sign>.
*        ASSIGN ('IS_RANGE-HIGH')   TO <high>.
*        ASSIGN ('IS_RANGE-LOW')    TO <low>.
*
*
*        IF <option> IS NOT ASSIGNED
*          OR <sign> IS NOT ASSIGNED
*          OR <high> IS NOT ASSIGNED
*          OR <low> IS NOT ASSIGNED.
*          "D 1X  208 Fehler: Die übergebene Tabelle ist keine Ranges-Tabelle!
*          so_help->so_error->raise_msg( iv_msgid = '1X' iv_msgno = 208 ).
*        ENDIF.
*
*        so_help->so_abap->rtts_get_info_simple(
*            EXPORTING
*              iv_element      = <low>
*            IMPORTING
*              ev_typename     = lv_typename
*              ev_scrtext_s    = lv_descr ).
*        CONCATENATE lv_descr '(' lv_typename ')' INTO lv_typename.
*
*
*        """""""""""""""""""""""""""""""""""""""""""""""""""
*        " Validieren
*
*        IF  <option> <> 'EQ'
*        AND <option> <> 'GE'
*        AND <option> <> 'CP'
*        AND <option> <> 'BT'
*        AND <option> <> 'NE'
*        AND <option> <> 'LT'
*        AND <option> <> 'GT'
*        AND <option> <> 'NP'
*        AND <option> <> 'NB'.
*
*          "RSPLS  600 Range-Eintrag &1 zu Merkmal &2 ist fehlerhaft. Feld &3 ist nicht gültig.
*          so_help->so_error->raise_msg( iv_msgid = 'RSPLS' iv_msgno = 600 iv_v1 = 'OPTION'
*                      iv_v2 =  lv_typename iv_v3 = <option> ).
*
*        ENDIF.
*
*        IF <sign> <> 'I'
*        AND <sign> <> 'E'.
*
*          "RSPLS  600 Range-Eintrag &1 zu Merkmal &2 ist fehlerhaft. Feld &3 ist nicht gültig.
*          so_help->so_error->raise_msg( iv_msgid = 'RSPLS' iv_msgno = 600 iv_v1 = '_' iv_v2 = 'SIGN' iv_v3 = <sign> ).
*
*        ENDIF.
*
*
*        """"""""""""""""""""""""""""""""""""""""""""
*        " Fehlerbehandlung
*
*        DATA: lx_t100 TYPE REF TO cx_t100_msg.
*      CATCH cx_t100_msg INTO lx_t100.
*
*        IF <low> IS ASSIGNED.
*          "  D  1X  207 Fehler in der Ranges-Tabelle &!
*          so_help->so_error->raise_msg( iv_msgid = '1X' iv_msgno = 207
*          iv_v1 = lv_typename io_previous = lx_t100 ).
*
*        ELSE.
*          RAISE EXCEPTION lx_t100.
*        ENDIF.
*
*    ENDTRY.

  ENDMETHOD.                    "is_range_valid


  METHOD is_equal_type.





  ENDMETHOD.                    "is_equal_type


  METHOD is_equal_value.

    DATA: lv_kind1  TYPE string,
          lv_type1  TYPE string,
          lv_kind2  TYPE string,
          lv_value2 TYPE string.

    "typ vergleichen

    mo_help->so_abap->rtts_get_info_any(
      EXPORTING
        i_any   = iv_value1
      IMPORTING
        ev_kind = lv_kind1
        ev_type = lv_type1
    ).

    mo_help->so_abap->rtts_get_info_any(
      EXPORTING
        i_any   = iv_value2
      IMPORTING
        ev_kind = lv_kind2
        ev_type = lv_value2
    ).

*
*
*    "wert vergleichen


  ENDMETHOD.                    "is_equal_value


  METHOD is_lines.


    DATA:
            lv_lines TYPE i.

    lv_lines = lines( it_any ).

    CASE iv_compare.

      WHEN '='.

        IF lv_lines <> iv_count.


        ENDIF.

      WHEN '>'.

        IF lv_lines <= iv_count.

        ENDIF.


      WHEN '>=' OR '=>'.

      WHEN '<'.


      WHEN '<=' OR '=<'.

    ENDCASE.



  ENDMETHOD.                    "is_lines


  METHOD is_bound.



  ENDMETHOD.                    "is_not_bound


  METHOD is_not_initial.

    ADD 1 TO iv_depth_info.

    DATA:
      lx_t100 TYPE REF TO cx_t100_msg.

    IF i_any IS INITIAL.

      mo_help->so_error->factory_msg(
        EXPORTING
           iv_id    ='UCFE'
           iv_no    = 888
          io_previous   = io_previous
          iv_depth_info = iv_depth_info
        RECEIVING
          rx_t100       = lx_t100 ).

      mo_help->so_error->factory_head(
        EXPORTING
          iv_text       = iv_text
          iv_msgid      = iv_msgid
          iv_msgno      = iv_msgno
          iv_v1         = iv_v1
          iv_v2         = iv_v2
          iv_v3         = iv_v3
          iv_v4         = iv_v4
          io_previous   = lx_t100
          iv_depth_info = iv_depth_info
        RECEIVING
          ro_result     = lx_t100
      ).

      "DE  UCFE    888 Der Wert für &1 ist initial
      mo_help->so_error->raise(
        EXPORTING
          ix_t100       = lx_t100
          iv_depth_info = iv_depth_info
      ).

    ENDIF.

  ENDMETHOD.                    "is_not_initial


  METHOD is_true.

data lx_t100 type ref to cx_t100_msg.


    if iv_val = abap_true.
      return.
      endif.


     mo_help->so_error->factory_head(
         EXPORTING
           iv_text       =  'Booleanwert unvorhergesehen = FALSE'
           io_previous   =  ix_prev
         RECEIVING
           ro_result     = lx_t100
       ).

      "D  FDT_BRS 032 Fehler beim Verifizieren der Signatur (sy-subrc &1)
        mo_help->so_error->raise_idno(
         EXPORTING
          iv_idno      = iv_idno
          iv_v1         = iv_v1
          iv_v2         = iv_v2
          iv_v3         = iv_v3
          iv_v4         = iv_v4
          io_previous   = lx_t100
          iv_depth_info = iv_depth_info
       ).


  ENDMETHOD.                    "is_true


  METHOD msg.


    IF iv_type <> 'E'.
      RETURN.
    ENDIF.

    mo_help->so_error->raise_msg(
      EXPORTING
        iv_id    = iv_msgid
        iv_no    = iv_msgno
        iv_v1    = iv_v1
        iv_v2    = iv_v2
        iv_v3    = iv_v3
        iv_v4    = iv_v4   ).


  ENDMETHOD.                    "msg


  METHOD sy.
*
*
*    "noch einbauen das sy text bei bedarf gezogen wird
*
*
    DATA:
      lv_is_error TYPE abap_bool,
      lx_t100     TYPE REF TO cx_t100_msg.

    lv_is_error = mo_help->so_abap->check_is_error( i_any = is_sy ).

    IF lv_is_error = abap_false AND is_check_type = abap_true AND is_sy-msgty = 'E'.
      lv_is_error = abap_true.
    ENDIF.

    CHECK lv_is_error = abap_true.

    TRY.

        mo_help->so_error->factory_head(
         EXPORTING
           iv_text       =  iv_text
           iv_msgid      =  iv_msgid
           iv_msgno      =  iv_msgno
           iv_v1         =  iv_v1
           iv_v2         =  iv_v2
           iv_v3         =  iv_v3
           iv_v4         =  iv_v4
           io_previous   =  io_previous
           iv_depth_info =  iv_depth_info
         RECEIVING
           ro_result     = lx_t100
       ).

      CATCH cx_t100_msg.


        "Standardtext hinzufügen
        "D  FDT_BRS 032 Fehler beim Verifizieren der Signatur (sy-subrc &1)
        mo_help->so_error->raise_msg(
         EXPORTING
           iv_id         = 'FDT'
           iv_no         = 032
           iv_v1         = sy-subrc
           io_previous   = io_previous
           iv_depth_info = iv_depth_info
       ).


    ENDTRY.

    RAISE EXCEPTION lx_t100.

  ENDMETHOD.                    "sy


  METHOD sy_msg_ne_error.


    IF sy-msgty <> 'E'.
      RETURN.
    ENDIF.

    mo_help->so_error->raise_any( is_sy = sy ).


  ENDMETHOD.                    "sy_msg_ne_error


  METHOD sy_subrc_ne_null.


    IF sy-subrc = 0.
      RETURN.
    ENDIF.

    mo_help->so_error->raise_any( is_sy = sy ).

  ENDMETHOD.                    "sy_subrc_ne_null

ENDCLASS.                    "lcl_error_check_a_raise IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_help_t100 IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_t100 IMPLEMENTATION.


  METHOD find_info.

    DATA:
      lv_kind  TYPE string,
      lv_type  TYPE string,
      lv_msgid TYPE string,
      lv_msgno TYPE string.


    """"""""""""""""""""""""""""""""""""""""""
    " Input bestimmen

    mo_help->so_abap->rtts_get_info_any(
    EXPORTING
    i_any   = i_any
    IMPORTING
    ev_kind =  lv_kind ).
*    ev_type =  lv_type  ).


    """"""""""""""""""""""""""""""""""""""""""
    " Textinfo auslesen

    CASE lv_kind.

      WHEN cl_abap_typedescr=>kind_struct.

        set_structure(
        EXPORTING
        is_any      = i_any
        IMPORTING
        ev_msgid    = lv_msgid
        ev_msgno    = lv_msgno
        ev_type     = lv_type
        et_params   = et_params
        ).


      WHEN cl_abap_typedescr=>kind_ref.

        set_object(
        EXPORTING
        io_any      = i_any
        IMPORTING
        ev_msgid    = lv_msgid
        ev_msgno    = lv_msgno
        ev_type     = lv_type
        et_params   = et_params ).

      WHEN OTHERS.

        "DE MN  434 Es fehlt die Nachrichtenklasse, Fehlertyp oder Nachrichtennummer
        mo_help->so_error->raise_msg(
        EXPORTING
        iv_id    = 'MN'
        iv_no    = 434
        iv_v1    = lv_msgno
        iv_v2    = lv_msgid ).


    ENDCASE.

    ev_msgid = lv_msgid.
    ev_msgno = lv_msgno.
    ev_type  = lv_type.



  ENDMETHOD.                    "find_info


  METHOD get_info.

    DATA:
    lv_is_found TYPE abap_bool.

    "Gibt es t100 Infos
    find_info(
    EXPORTING
    i_any       = i_any
    IMPORTING
    ev_msgid    = ev_msgid
    ev_msgno    = ev_msgno
    ev_type     = ev_type
    et_params   = et_params ).

    "Existieren die auch auf Datenbank?
    lv_is_found = is_info_existing_by_t100(
    iv_msgid  = ev_msgid
    iv_msgno  = ev_msgno   ).

    IF lv_is_found = abap_false.

      mo_help->so_error->raise_msg(
      iv_id = 'BRF'
      iv_no = 415
      iv_v1 = ev_msgid
      iv_v2 = ev_msgno ).

    ENDIF.



  ENDMETHOD.                    "get_info


  METHOD get_tableinfo.



    DATA:
      ls_line TYPE bapiret2,
      lv_id   TYPE string,
      lv_no   TYPE string,
      lv_type TYPE string.

    FIELD-SYMBOLS:
    <ls_any> TYPE any.

    "Tabelle in msginfo umwandeln
    LOOP AT it_any ASSIGNING <ls_any>.

      TRY.

          get_info(
          EXPORTING
          i_any       = <ls_any>
          IMPORTING
          ev_msgid    =  lv_id
          ev_msgno    =  lv_no
          ev_type     =  lv_type   ).

          ls_line-id         = lv_id.
          ls_line-type       = lv_type.
          ls_line-log_msg_no = lv_no.

          APPEND ls_line TO et_info.

        CATCH cx_t100_msg.
      ENDTRY.

    ENDLOOP.


    "Worst Type bestimmen
    LOOP AT et_info INTO ls_line.

      IF ls_line-type = 'E' AND ev_worst_type <> 'E'.
        ev_worst_type = 'E'.
      ELSEIF ls_line-type = 'W' AND ev_worst_type <> 'E'.
        ev_worst_type = 'W'.
      ELSEIF ls_line-type = 'I' AND ev_worst_type <> 'E' AND ev_worst_type <> 'W'.
        ev_worst_type = 'I'.
      ELSEIF ls_line-type = 'S' AND ev_worst_type <> 'E' AND ev_worst_type <> 'W'.
        ev_worst_type = 'S'.
      ENDIF.

    ENDLOOP.



  ENDMETHOD.                    "get_tableinfo


  METHOD get_text.



    DATA:
      lv_msgid  TYPE string,
      lv_msgno  TYPE string,
      lv_type   TYPE string,
      lt_params TYPE ty_s_type-t_name_value_pair.

    get_info(
    EXPORTING
    i_any       = i_any
    IMPORTING
    ev_msgid    = lv_msgid
    ev_msgno    = lv_msgno
    ev_type     = lv_type
    et_params   = lt_params
    ).

    get_text_by_t100(
    EXPORTING
    iv_msgid    = lv_msgid
    iv_msgno    = lv_msgno
    iv_langu    = iv_langu
    it_params   = lt_params
    RECEIVING
    rv_string   = rv_string
    ).



  ENDMETHOD.                    "get_text


  METHOD get_text_by_t100.



    DATA:
      lv_msgv1 TYPE symsgv,
      lv_msgv2 TYPE symsgv,
      lv_msgv3 TYPE symsgv,
      lv_msgv4 TYPE symsgv,
      lv_msgid TYPE sy-msgid,
      lv_msgno TYPE sy-msgno,
      lv_langu TYPE sy-langu.

    DATA:
      lv_arbgb TYPE arbgb,
      ls_t100  TYPE t100.

    lv_msgid = iv_msgid.
    lv_msgno = iv_msgno.
    lv_msgv1 = mo_help->so_abap->conv_get_string( iv_v1 ).
    lv_msgv2 = mo_help->so_abap->conv_get_string( iv_v2 ).
    lv_msgv3 = mo_help->so_abap->conv_get_string( iv_v3 ).
    lv_msgv4 = mo_help->so_abap->conv_get_string( iv_v4 ).
    lv_langu = iv_langu.

    lv_arbgb = iv_msgid.
*    lv_msgnr = iv_msgno.

    READ TABLE st_t100 INTO ls_t100
    WITH KEY sprsl = lv_langu arbgb = lv_arbgb msgnr = lv_msgno.

    IF sy-subrc <> 0.

      SELECT SINGLE *
      FROM t100
      INTO CORRESPONDING FIELDS OF ls_t100
      WHERE sprsl = sy-langu
      AND   arbgb = lv_arbgb
      AND   msgnr = lv_msgno.

      IF sy-subrc <> 0.
        SELECT SINGLE *
            FROM t100
             INTO CORRESPONDING FIELDS OF ls_t100
             WHERE sprsl = 'EN'
             AND   arbgb = lv_arbgb
             AND   msgnr = lv_msgno.
      ENDIF.
      mo_help->so_check_a_raise->after_select(
                    i_where1 = sy-langu i_where2 = lv_arbgb i_where3 = lv_msgno  ).

      INSERT ls_t100 INTO TABLE st_t100.

    ENDIF.

    rv_string = ls_t100-text.

    IF it_params IS SUPPLIED.
      mo_help->so_txt->text_get_w_params(
        EXPORTING
          iv_text         = rv_string
          it_params       = it_params
            RECEIVING
      rv_text   =  rv_string  ).


    ENDIF.


    "Parameter ersetzten
    IF iv_v1 IS SUPPLIED.
      mo_help->so_txt->text_get_w_params(
      EXPORTING
      iv_text   = rv_string
      iv_v1     = lv_msgv1
      RECEIVING
      rv_text   =  rv_string ).
    ENDIF.

    "Parameter ersetzten
    IF iv_v2 IS SUPPLIED.
      mo_help->so_txt->text_get_w_params(
      EXPORTING
      iv_text   = rv_string
      iv_v2     = lv_msgv2
      RECEIVING
      rv_text   =  rv_string ).
    ENDIF.

    "Parameter ersetzten
    IF iv_v3 IS SUPPLIED.
      mo_help->so_txt->text_get_w_params(
      EXPORTING
      iv_text   = rv_string
      iv_v3     = lv_msgv3
      RECEIVING
      rv_text   =  rv_string ).
    ENDIF.

    "Parameter ersetzten
    IF iv_v4 IS SUPPLIED.
      mo_help->so_txt->text_get_w_params(
      EXPORTING
      iv_text   = rv_string
      iv_v4     = lv_msgv4
      RECEIVING
      rv_text   =  rv_string ).
    ENDIF.



  ENDMETHOD.                    "get_text_by_t100


  METHOD get_text_table.



    DATA: lv_text TYPE string.

    FIELD-SYMBOLS:
    <ls_any> TYPE any.

    LOOP AT it_any ASSIGNING <ls_any>.

      TRY.
          get_text(
          EXPORTING
          i_any       = <ls_any>
          iv_langu    = iv_langu
          RECEIVING
          rv_string   = lv_text
          ).

          APPEND lv_text TO et_result.

        CATCH cx_t100_msg.
      ENDTRY.

    ENDLOOP.

    IF et_result IS INITIAL.

      "DE MN  434 Es fehlt die Nachrichtenklasse, Fehlertyp oder Nachrichtennummer
      mo_help->so_error->raise_msg(
      EXPORTING
      iv_id    = 'MN'
      iv_no    = 434 ).
    ENDIF.



  ENDMETHOD.                    "get_text_table


  METHOD get_type.



    DATA:
    lv_kind TYPE string.

    FIELD-SYMBOLS:
    <lt_any> TYPE ANY TABLE.

    CHECK i_any IS NOT INITIAL.

    " Input bestimmen
    mo_help->so_abap->rtts_get_info_any(
    EXPORTING
    i_any   = i_any
    IMPORTING
    ev_kind =  lv_kind
    ev_type =  rv_result  ).


    " Textinfo auslesen
    TRY.

        CASE lv_kind.

            "Tabelle
          WHEN  cl_abap_typedescr=>kind_table.

            ASSIGN i_any TO <lt_any>.

            get_tableinfo(
            EXPORTING
            it_any        = <lt_any>
            IMPORTING
            ev_worst_type = rv_result ).

            " Sonst
          WHEN OTHERS.

            get_info(
            EXPORTING
            i_any            = i_any
            IMPORTING
            ev_type          = rv_result  ).

        ENDCASE.

      CATCH cx_t100_msg.
        "Wenn kein Text gefunden, wird leerer Type zurückgegeben
    ENDTRY.



  ENDMETHOD.                    "get_type


  METHOD is_error.

    DATA:
    lv_type TYPE string.

    TRY.

        get_type(
        EXPORTING
        i_any       = i_any
        RECEIVING
        rv_result = lv_type
        ).

        IF lv_type = 'E'.
          rv_result = abap_true.
        ENDIF.

      CATCH cx_t100_msg.
        "Wenn kein Text bestimmt werden kann, ist es kein Fehler
    ENDTRY.



  ENDMETHOD.                    "is_error


  METHOD is_info_existing.

    DATA:
      lv_msgid TYPE string,
      lv_msgno TYPE string.

    TRY.
        get_info(
        EXPORTING
        i_any       = i_any
        IMPORTING
        ev_msgid    = lv_msgid
        ev_msgno    = lv_msgno
        ).

      CATCH cx_t100_msg.
        RETURN.
    ENDTRY.

    rv_result = abap_true.

  ENDMETHOD.                    "is_info_existing


  METHOD is_info_existing_by_t100.

    DATA:
    lv_dummy TYPE text.

    SELECT SINGLE text
    FROM t100
    INTO lv_dummy
    WHERE arbgb = iv_msgid
    AND   msgnr = iv_msgno.

    IF sy-subrc = 0.
      rv_result = abap_true.
    ENDIF.

  ENDMETHOD.                    "is_info_existing_by_t100


  METHOD set_object.



    DATA:
    lx_root TYPE REF TO cx_root.

    """"""""""""""""""""""""""""""""""""""""""""""""""
    " Ist es eine Exception?

    TRY.
        lx_root ?= io_any.

        TRY. "IF_t100_Message


            set_o_if_t100_message(
            EXPORTING
            io_exception =  lx_root
            IMPORTING
            ev_msgid     = ev_msgid
            ev_msgno     = ev_msgno
            ev_type      = ev_type
            et_params    = et_params   ).
            EXIT.

          CATCH cx_root.
        ENDTRY.


        TRY. " CX_t100_MSG

            set_o_cx_t100_msg(
            EXPORTING
            ix_root   = lx_root
            IMPORTING
            ev_msgid     = ev_msgid
            ev_msgno     = ev_msgno
            ev_type      = ev_type
            et_params    = et_params   ).
            EXIT.

          CATCH cx_root.
        ENDTRY.


        TRY. " CX_ROOT

            set_o_cx_root(
            EXPORTING
            ix_root   = lx_root
            IMPORTING
            ev_msgid     = ev_msgid
            ev_msgno     = ev_msgno
            ev_type      = ev_type
            et_params    = et_params   ).
            EXIT.

          CATCH cx_t100_msg.
        ENDTRY.



      CATCH cx_root.
    ENDTRY.

    "DE MN  434 Es fehlt die Nachrichtenklasse, Fehlertyp oder Nachrichtennummer
    mo_help->so_error->raise_msg(
    EXPORTING
    iv_id    = 'MN'
    iv_no    = 434
    iv_v1    = ev_msgno
    iv_v2    = ev_msgid ).



  ENDMETHOD.                    "set_object


  METHOD set_o_cx_t100_msg.



    DATA:
      lx_t100  TYPE REF TO cx_t100_msg,
      ls_param TYPE LINE OF ty_s_type-t_name_value_pair,
      lx_root  TYPE REF TO cx_root.

    TRY.
        lx_t100 ?= ix_root.

        ev_msgid =  lx_t100->t100_msgid.
        ev_msgno = lx_t100->t100_msgno.
        ev_type  = 'E'.

        FREE ls_param.
        ls_param-value = lx_t100->t100_msgv1.
        APPEND ls_param TO et_params.

        FREE ls_param.
        ls_param-value = lx_t100->t100_msgv2.
        APPEND ls_param TO et_params.

        FREE ls_param.
        ls_param-value = lx_t100->t100_msgv3.
        APPEND ls_param TO et_params.

        FREE ls_param.
        ls_param-value = lx_t100->t100_msgv4.
        APPEND ls_param TO et_params.

      CATCH cx_root INTO lx_root.
        RAISE EXCEPTION TYPE cx_t100_msg
          EXPORTING
            t100_msgid = '00'
            t100_msgno = 398
            t100_msgv1 = 'Exception enthält keine Messageinfos'.
    ENDTRY.

  ENDMETHOD.                    "set_o_cx_t100_msg


  METHOD set_o_if_t100_message.



    FIELD-SYMBOLS:
    <any> TYPE any.

    DATA:
      li_t100   TYPE REF TO if_t100_message,
      lx_root   TYPE REF TO cx_root,
      ls_params TYPE LINE OF ty_s_type-t_name_value_pair.

    FREE et_params.

    """"""""""""""""""""""""""""""""""""""""
    " Text speichern

    "Ist es eine Exception mit Nachrichtenklasse?
    TRY.
        li_t100 ?= io_exception.
      CATCH cx_sy_move_cast_error INTO lx_root. "Wenn nein, fertig
        RAISE EXCEPTION TYPE cx_t100_msg
          EXPORTING
*           textid     =
*           previous   =
            t100_msgid = '00'
            t100_msgno = 398
            t100_msgv1 = 'Exception enthält keine t100 Nachricht'
*           t100_msgv2 =
*           t100_msgv3 =
*           t100_msgv4 =
          .

    ENDTRY.

    "Nachrichtenklasse auslesen
    ev_msgid = li_t100->t100key-msgid.
    ev_msgno = li_t100->t100key-msgno.
    ev_type = 'E'.


    """"""""""""""""""""""""""""""""""""""""
    " Parameter speichern

    "Attribut 1 auslesen
    IF li_t100->t100key-attr1 <> ''.

      FREE ls_params.
      ls_params-name = '&'.

      TRY.
          UNASSIGN <any>.
          ASSIGN li_t100->t100key-attr1 TO <any>.

          IF <any> IS ASSIGNED.
            ls_params-value = <any>.
          ENDIF.

        CATCH cx_root INTO lx_root.
      ENDTRY.

      APPEND ls_params TO et_params.
    ENDIF.

    "Attribut 2 auslesen
    IF li_t100->t100key-attr2 <> ''.

      FREE ls_params.
      ls_params-name = '&2'.

      TRY.
          UNASSIGN <any>.
          ASSIGN li_t100->t100key-attr2 TO <any>.

          IF <any> IS ASSIGNED.
            ls_params-value = <any>.
          ENDIF.

        CATCH cx_root INTO lx_root.
      ENDTRY.

      APPEND ls_params TO et_params.
    ENDIF.

    "Attribut 3 auslesen
    IF li_t100->t100key-attr3 <> ''.

      FREE ls_params.
      ls_params-name = '&3'.

      TRY.
          UNASSIGN <any>.
          ASSIGN li_t100->t100key-attr3 TO <any>.

          IF <any> IS ASSIGNED.
            ls_params-value = <any>.
          ENDIF.

        CATCH cx_root INTO lx_root.
      ENDTRY.

      APPEND ls_params TO et_params.
    ENDIF.

    "Attribut 3 auslesen
    IF li_t100->t100key-attr4 <> ''.

      FREE ls_params.
      ls_params-name = '&4'.

      TRY.
          UNASSIGN <any>.
          ASSIGN li_t100->t100key-attr4 TO <any>.

          IF <any> IS ASSIGNED.
            ls_params-value = <any>.
          ENDIF.

        CATCH cx_root INTO lx_root.
      ENDTRY.

      APPEND ls_params TO et_params.
    ENDIF.


    """""""""""""""""""""""""""""""""""""""""""""
    " Prüen ob auslesen korrekt

*    DATA:
*      lv_string1 TYPE string,
*      lv_string2 TYPE string.
*
*    lv_string1 = io_exception->get_text( ).
*
*    lv_string2 = get_text_by_t100(
*    iv_msgid  = ev_msgid
*    iv_msgno  = ev_msgno  ).
*
*    lv_string2 = mo_help->so_base->text_get_w_params(
*    iv_text    = lv_string2
*    it_params  = et_params ).
*
*    IF lv_string2 <> lv_string1.
*      mo_help->so_cx_t100->raise_text( 'Textinformationen der Exception konnte nicht bestimmt werden.' ).
*    ENDIF.



  ENDMETHOD.                    "set_o_if_t100_message


  METHOD set_structure.

    DATA:
    lv_type TYPE string.

    """"""""""""""""""""""""""""""""""""""""""
    " Input bestimmen

    mo_help->so_abap->rtts_get_info_any(
    EXPORTING
    i_any   = is_any
    IMPORTING
    ev_type = lv_type  ).


    """"""""""""""""""""""""""""""""""""""""""
    " Textinfo auslesen

    CASE lv_type.

      WHEN 'SYST'.

        set_s_sy(
        EXPORTING
        is_sy     = is_any
        IMPORTING
        ev_msgid  = ev_msgid
        ev_msgno  = ev_msgno
        ev_type   = ev_type
        et_params = et_params  ).

      WHEN 'BAPIRET2' OR 'TY_WA_BAPIRET'.

        set_s_bapiret2(
        EXPORTING
        is_bapiret = is_any
        IMPORTING
        ev_msgid  = ev_msgid
        ev_msgno  = ev_msgno
        ev_type   = ev_type
        et_params = et_params  ).

      WHEN 'BAPIRETURN1'.

        set_s_bapiret1(
            EXPORTING
                is_bapiret = is_any
            IMPORTING
                 ev_msgid  = ev_msgid
                ev_msgno  = ev_msgno
                ev_type   = ev_type
                et_params = et_params ).

      WHEN 'PROTT'.

        set_s_prott(
        EXPORTING
        is_prott  = is_any
        IMPORTING
        ev_msgid  = ev_msgid
        ev_msgno  = ev_msgno
        ev_type   = ev_type
        et_params = et_params  ).

      WHEN 'SPROT_U' OR 'V56E_LOGFILE_ENTRY'.

        set_s_sprot_u(
        EXPORTING
        is_sprot_u = is_any
        IMPORTING
        ev_msgid  = ev_msgid
        ev_msgno  = ev_msgno
        ev_type   = ev_type
        et_params = et_params  ).

      WHEN 'VBFS'.

        set_s_vbfs(
        EXPORTING
        is_vbfs   = is_any
        IMPORTING
        ev_msgid  = ev_msgid
        ev_msgno  = ev_msgno
        ev_type   = ev_type
        et_params = et_params  ).

      WHEN 'S_BAL_MSG'.

        set_s_bal_msg(
        EXPORTING
        is_balmsg = is_any
        IMPORTING
        ev_msgid  = ev_msgid
        ev_msgno  = ev_msgno
        ev_type   = ev_type
        et_params = et_params  ).


      WHEN 'HUITEM_MESSAGES'.

        set_s_huitem_messages(
        EXPORTING
        is_huitem_msg    = is_any
        IMPORTING
        ev_msgid  = ev_msgid
        ev_msgno  = ev_msgno
        ev_type   = ev_type
        et_params = et_params  ).



      WHEN 'BDCMSGCOLL'.

        set_s_bdcmsgcoll(
          EXPORTING
          is_bdcmsgcoll    = is_any
          IMPORTING
          ev_msgid  = ev_msgid
          ev_msgno  = ev_msgno
          ev_type   = ev_type
          et_params = et_params  ).


      WHEN 'BAPIINCOMP'.
        set_s_bapiincomp(
          EXPORTING
          is_bdcmsgcoll    = is_any
          IMPORTING
          ev_msgid  = ev_msgid
          ev_msgno  = ev_msgno
          ev_type   = ev_type
          et_params = et_params  ).


      WHEN OTHERS.

        set_s_generic(
            EXPORTING
             is_any  = is_any
            IMPORTING
               ev_msgid  = ev_msgid
               ev_msgno  = ev_msgno
               ev_type   = ev_type
               et_params = et_params  ).

*        "DE MN  434 Es fehlt die Nachrichtenklasse, Fehlertyp oder Nachrichtennummer
*        mo_help->so_cx_factory->raise_msg(
*        EXPORTING
*        iv_msgid    = 'MN'
*        iv_msgno    = 434
*        iv_v1    = ev_msgno
*        iv_v2    = ev_msgid ).

    ENDCASE.



  ENDMETHOD.                    "set_structure


  METHOD set_s_generic.

    FIELD-SYMBOLS:
      <lv_id>    TYPE any,
      <lv_no>    TYPE any,
      <lv_ty>    TYPE any,
      <lv_para>  TYPE any,
      <ls_param> LIKE LINE OF et_params.

    ASSIGN COMPONENT 'MSGID' OF STRUCTURE is_any TO <lv_id>.

    IF <lv_id> IS NOT ASSIGNED.
      ASSIGN COMPONENT 'ID' OF STRUCTURE is_any TO <lv_id>.
    ENDIF.


    ASSIGN COMPONENT 'MSGNO' OF STRUCTURE is_any TO <lv_no>.

    IF <lv_no> IS NOT ASSIGNED.
      ASSIGN COMPONENT 'NO' OF STRUCTURE is_any TO <lv_no>.
    ENDIF.

    IF <lv_no> IS NOT ASSIGNED.
      ASSIGN COMPONENT 'NUMBER' OF STRUCTURE is_any TO <lv_no>.
    ENDIF.


    IF <lv_id> IS NOT ASSIGNED OR <lv_no> IS NOT ASSIGNED.
      mo_help->so_error->raise_text(  'Keine Nachrichtentexte gefunden.').
    ENDIF.

    ev_msgid = <lv_id>.
    ev_msgno = <lv_no>.


    ASSIGN COMPONENT 'MSGTY' OF STRUCTURE is_any TO <lv_ty>.
    IF <lv_ty> IS ASSIGNED.
      ev_type = <lv_ty>.
    Else.
      ASSIGN COMPONENT 'TYPE' OF STRUCTURE is_any TO <lv_ty>.
        IF <lv_ty> IS ASSIGNED.
      ev_type = <lv_ty>.
   endif.
      endif.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""^
    " Parameter

    UNASSIGN <lv_para>.
    ASSIGN COMPONENT 'MSGV1' OF STRUCTURE is_any TO <lv_para>.
    IF <lv_para> IS ASSIGNED.
      APPEND INITIAL LINE TO et_params ASSIGNING <ls_param>.
      <ls_param>-value = <lv_para>.
    Else.
      ASSIGN COMPONENT 'MESSAGE_V1' OF STRUCTURE is_any TO <lv_para>.
    IF <lv_para> IS ASSIGNED.
      APPEND INITIAL LINE TO et_params ASSIGNING <ls_param>.
      <ls_param>-value = <lv_para>.
      endif.
    endif.

    UNASSIGN <lv_para>.
    ASSIGN COMPONENT 'MSGV2' OF STRUCTURE is_any TO <lv_para>.
    IF <lv_para> IS ASSIGNED.
      APPEND INITIAL LINE TO et_params ASSIGNING <ls_param>.
      <ls_param>-value = <lv_para>.
          Else.
      ASSIGN COMPONENT 'MESSAGE_V2' OF STRUCTURE is_any TO <lv_para>.
    IF <lv_para> IS ASSIGNED.
      APPEND INITIAL LINE TO et_params ASSIGNING <ls_param>.
      <ls_param>-value = <lv_para>.
      endif.
    ENDIF.

    UNASSIGN <lv_para>.
    ASSIGN COMPONENT 'MSGV3' OF STRUCTURE is_any TO <lv_para>.
    IF <lv_para> IS ASSIGNED.
      APPEND INITIAL LINE TO et_params ASSIGNING <ls_param>.
      <ls_param>-value = <lv_para>.
          Else.
      ASSIGN COMPONENT 'MESSAGE_V3' OF STRUCTURE is_any TO <lv_para>.
    IF <lv_para> IS ASSIGNED.
      APPEND INITIAL LINE TO et_params ASSIGNING <ls_param>.
      <ls_param>-value = <lv_para>.
      endif.
    ENDIF.

    UNASSIGN <lv_para>.
    ASSIGN COMPONENT 'MSGV4' OF STRUCTURE is_any TO <lv_para>.
    IF <lv_para> IS ASSIGNED.
      APPEND INITIAL LINE TO et_params ASSIGNING <ls_param>.
      <ls_param>-value = <lv_para>.
          Else.
      ASSIGN COMPONENT 'MESSAGE_V4' OF STRUCTURE is_any TO <lv_para>.
    IF <lv_para> IS ASSIGNED.
      APPEND INITIAL LINE TO et_params ASSIGNING <ls_param>.
      <ls_param>-value = <lv_para>.
      endif.
    ENDIF.


  ENDMETHOD.                    "set_s_generic


  METHOD set_s_bal_msg.



    DATA:
    ls_param TYPE LINE OF ty_s_type-t_name_value_pair.

    ev_msgid  = is_balmsg-msgid.
    ev_msgno  = is_balmsg-msgno.
    ev_type   = is_balmsg-msgty.

    IF is_balmsg-msgv1 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_balmsg-msgv1.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_balmsg-msgv2 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_balmsg-msgv2.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_balmsg-msgv3 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_balmsg-msgv3.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_balmsg-msgv4 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_balmsg-msgv4.
      APPEND ls_param TO et_params.
    ENDIF.



  ENDMETHOD.                    "set_s_bal_msg


  METHOD set_s_bapiret1.

    DATA:
    ls_param TYPE LINE OF ty_s_type-t_name_value_pair.

    """"""""""""""""""""""""""""""""""""""""
    " Text speichern

    ev_msgid = is_bapiret-id.
    ev_msgno = is_bapiret-number.
    ev_type  = is_bapiret-type.


    """""""""""""""""""""""""""""
    " Parameter speichern

    IF is_bapiret-message_v1 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_bapiret-message_v1.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_bapiret-message_v2 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_bapiret-message_v2.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_bapiret-message_v3 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_bapiret-message_v3.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_bapiret-message_v4 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_bapiret-message_v4.
      APPEND ls_param TO et_params.
    ENDIF.


  ENDMETHOD.                    "set_s_bapiret1

  METHOD set_s_smesg.


    DATA:
    ls_param TYPE LINE OF ty_s_type-t_name_value_pair.

    """"""""""""""""""""""""""""""""""""""""
    " Text speichern

    ev_msgid = is_smesg-arbgb.
    ev_msgno = is_smesg-txtnr.
    ev_type  = is_smesg-msgty.


    """""""""""""""""""""""""""""
    " Parameter speichern

    IF is_smesg-msgv1 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_smesg-msgv1.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_smesg-msgv2 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_smesg-msgv2.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_smesg-msgv3 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_smesg-msgv3.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_smesg-msgv4 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_smesg-msgv4.
      APPEND ls_param TO et_params.
    ENDIF.


  ENDMETHOD.                    "set_s_SMESG

  METHOD set_s_bapiret2.



    DATA:
    ls_param TYPE LINE OF ty_s_type-t_name_value_pair.

    """"""""""""""""""""""""""""""""""""""""
    " Text speichern

    ev_msgid = is_bapiret-id.
    ev_msgno = is_bapiret-number.
    ev_type  = is_bapiret-type.


    """""""""""""""""""""""""""""
    " Parameter speichern

    IF is_bapiret-message_v1 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_bapiret-message_v1.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_bapiret-message_v2 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_bapiret-message_v2.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_bapiret-message_v3 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_bapiret-message_v3.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_bapiret-message_v4 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_bapiret-message_v4.
      APPEND ls_param TO et_params.
    ENDIF.



  ENDMETHOD.                    "set_s_bapiret2

  METHOD set_s_bapiincomp.

    DATA:
       lv_text TYPE string.

    CONCATENATE
      'Kommunikationsfelder: Unvollständigkeit'
      ' | '
      is_bdcmsgcoll-doc_number
      '/'
      is_bdcmsgcoll-itm_number
      ' | '
      is_bdcmsgcoll-table_name
      ' '
      is_bdcmsgcoll-field_name
      ' '
      is_bdcmsgcoll-field_text
      INTO lv_text
      RESPECTING BLANKS.

    "Kommunikationsfelder: unvalsst#ndigkeit |  00102020 / 20 | VBAP KWMENG Auftragsmenge
    mo_help->so_txt->text_get_like_t100(
      EXPORTING
        iv_text   = lv_text
*        iv_v1     =
*        iv_v2     =
*        iv_v3     =
*        iv_v4     =
      IMPORTING
        ev_msgid  = ev_msgid
        ev_msgno  = ev_msgno
*        ev_v1     =
*        ev_v2     =
*        ev_v3     =
*        ev_v4     =
        et_params = et_params
    ).

  ENDMETHOD.                    "set_s_BAPIINCOMP

  METHOD set_s_bdcmsgcoll.


    DATA:
ls_param TYPE LINE OF ty_s_type-t_name_value_pair.

    ev_msgid = is_bdcmsgcoll-msgid.
    ev_msgno = is_bdcmsgcoll-msgnr.
    ev_type  = is_bdcmsgcoll-msgtyp.


    IF is_bdcmsgcoll-msgv1 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_bdcmsgcoll-msgv1.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_bdcmsgcoll-msgv2 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_bdcmsgcoll-msgv2.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_bdcmsgcoll-msgv3 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_bdcmsgcoll-msgv3.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_bdcmsgcoll-msgv4 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_bdcmsgcoll-msgv4.
      APPEND ls_param TO et_params.
    ENDIF.



  ENDMETHOD.                    "set_s_bdcmsgcoll


  METHOD set_s_huitem_messages.



    DATA:
    ls_param TYPE LINE OF ty_s_type-t_name_value_pair.


    ev_msgid = is_huitem_msg-msgid.
    ev_msgno = is_huitem_msg-msgno.
    ev_type  = is_huitem_msg-msgty.

    IF is_huitem_msg-msgv1 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_huitem_msg-msgv1.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_huitem_msg-msgv2 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_huitem_msg-msgv2.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_huitem_msg-msgv3 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_huitem_msg-msgv3.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_huitem_msg-msgv4 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_huitem_msg-msgv4.
      APPEND ls_param TO et_params.
    ENDIF.



  ENDMETHOD.                    "set_s_huitem_messages


  METHOD set_s_prott.



    DATA:
    ls_param TYPE LINE OF ty_s_type-t_name_value_pair.


    """"""""""""""""""""""""""""""""""""""""
    " Text speichern

    ev_msgid = is_prott-msgid.
    ev_msgno = is_prott-msgno.
    ev_type  = is_prott-msgty.


    """"""""""""""""""""""""""""""""""""""""
    " Parameter speichern

    IF is_prott-msgv1 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_prott-msgv1.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_prott-msgv2 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_prott-msgv2.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_prott-msgv3 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_prott-msgv3.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_prott-msgv4 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_prott-msgv4.
      APPEND ls_param TO et_params.
    ENDIF.



  ENDMETHOD.                    "set_s_prott


  METHOD set_s_sprot_u.



    DATA:
    ls_param TYPE LINE OF ty_s_type-t_name_value_pair.

    """"""""""""""""""""""""""""""""""""""""
    " Text speichern

    ev_msgid = is_sprot_u-ag.
    ev_msgno = is_sprot_u-msgnr.
    ev_type  = is_sprot_u-severity.


    """"""""""""""""""""""""""""""""""""""""
    " Parameter speichern

    IF  is_sprot_u-var1 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value =  is_sprot_u-var1.
      APPEND ls_param TO et_params.
    ENDIF.

    IF  is_sprot_u-var2 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value =  is_sprot_u-var2.
      APPEND ls_param TO et_params.
    ENDIF.

    IF  is_sprot_u-var3 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value =  is_sprot_u-var3.
      APPEND ls_param TO et_params.
    ENDIF.

    IF  is_sprot_u-var4 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value =  is_sprot_u-var4.
      APPEND ls_param TO et_params.
    ENDIF.



  ENDMETHOD.                    "set_s_sprot_u


  METHOD set_s_sy.



    DATA:
    ls_param TYPE LINE OF ty_s_type-t_name_value_pair.

    """"""""""""""""""""""""""""""""""""""""
    " Text speichern

    ev_msgid = is_sy-msgid.
    ev_msgno = is_sy-msgno.
    ev_type  = is_sy-msgty.


    """"""""""""""""""""""""""""""""""""""""
    " Parameter speichern

    IF is_sy-msgv1 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_sy-msgv1.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_sy-msgv2 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_sy-msgv2.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_sy-msgv3 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_sy-msgv3.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_sy-msgv4 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_sy-msgv4.
      APPEND ls_param TO et_params.
    ENDIF.



  ENDMETHOD.                    "set_s_sy


  METHOD set_s_vbfs.



    DATA:
    ls_param TYPE LINE OF ty_s_type-t_name_value_pair.


    """"""""""""""""""""""""""""""""""""""""
    " Text speichern

    ev_type       = is_vbfs-msgty.
    ev_msgno      = is_vbfs-msgno.
    ev_msgid      = is_vbfs-msgid.


    """"""""""""""""""""""""""""""""""""""""
    " Parameter speichern

    IF is_vbfs-msgv1 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_vbfs-msgv1.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_vbfs-msgv2 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_vbfs-msgv2.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_vbfs-msgv3 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_vbfs-msgv3.
      APPEND ls_param TO et_params.
    ENDIF.

    IF is_vbfs-msgv4 IS NOT INITIAL.
      FREE ls_param.
      ls_param-value = is_vbfs-msgv3.
      APPEND ls_param TO et_params.
    ENDIF.


  ENDMETHOD.                    "set_s_vbfs

  METHOD set_o_cx_root.

    DATA:lv_text TYPE string.

    lv_text = ix_root->get_text(  ).

    mo_help->so_txt->text_get_like_t100(
      EXPORTING
        iv_text   = lv_text
*             iv_v1     =
*             iv_v2     =
*             iv_v3     =
*             iv_v4     =
      IMPORTING
        ev_msgid  = ev_msgid
        ev_msgno  = ev_msgno
*             ev_v1     = lv_v1
*             ev_v2     =
*             ev_v3     =
*             ev_v4     =
        et_params = et_params
    ).

    ev_type = 'E'.

  ENDMETHOD.                    "set_o_cx_root

ENDCLASS.                    "lcl_find_t100 IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcx_help_exception IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENDE: Basishelper - Exception, T100 Texte, Abap Grundlagen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BEGIN: Erweiterter Helper - Stringverarbeitung, Zeitumrechnungen, Abap - Zusätze
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

CLASS lcl_help_string DEFINITION INHERITING FROM lcl_help_base.

  PUBLIC SECTION.

    DATA:
       mv_data TYPE string.


    METHODS:
      length,
      trim,
      shift_left,
      shift_right,
      concat_left, "input platzhalte
      concat_right,
      to_lower_case,
      to_upper_case,

      char_at, "position type i u länge
      contains_only,
      contains_any,

      equals,
      equals_ignore_case,

      get_clike,

      is_numeric,
      is_abc,

      "Wenn String eine Zahl, werden Tausenderpunkte hinzugefügt
      get_dot_for_thousand
        IMPORTING
                  iv_number        TYPE string
        RETURNING VALUE(rv_string) TYPE string,

      get_leading_zeros.

ENDCLASS.                    "lcl_help_string DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_help_string IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_string IMPLEMENTATION.

  METHOD length.

  ENDMETHOD.                    "length

  METHOD trim.

  ENDMETHOD.                    "trim

  METHOD shift_left.

  ENDMETHOD.                    "shift_left

  METHOD shift_right.

  ENDMETHOD.                    "shift_right

  METHOD concat_left.

  ENDMETHOD.                    "concat_left

  METHOD concat_right.


  ENDMETHOD.                    "concat_right

  METHOD to_lower_case.

*me->

*
*    call function 'STRING_UPPER_LOWER_CASE'
*      EXPORTING
*        delimiter =
*        string1   =
**      IMPORTING
**        string    =
**      EXCEPTIONS
**        not_valid = 1
**        too_long  = 2
**        too_small = 3
**        others    = 4
*      .
*    IF sy-subrc <> 0.
**     MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
**                WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*    ENDIF.

  ENDMETHOD.                    "to_lower_case

  METHOD to_upper_case.


    TRANSLATE mv_data TO UPPER CASE.

*    call function 'STRING_UPPER_LOWER_CASE'
*      EXPORTING
*        delimiter =
*        string1   = mv_data
*      IMPORTING
*        string    = mv_data
*      EXCEPTIONS
*        not_valid = 1
*        too_long  = 2
*        too_small = 3
*        ERROR_MESSAGE = 4
*        others    = 5.
*    mo_help->so_check_a_raise->after_function( is_Sy = sy ).


  ENDMETHOD.                    "to_upper_case

  METHOD char_at.

  ENDMETHOD.                    "char_at

  METHOD contains_only.
*        lcl_help
  ENDMETHOD.                    "contains_only

  METHOD contains_any.

  ENDMETHOD.                    "contains_any

  METHOD equals.

  ENDMETHOD.                    "equals

  METHOD equals_ignore_case.

  ENDMETHOD.                    "equals_ignore_case

  METHOD get_clike.

  ENDMETHOD.                    "get_clike

  METHOD get_leading_zeros.

  ENDMETHOD.                    "get_leading_zeros

  METHOD get_dot_for_thousand.


    DATA: lv_length         TYPE i,
          lv_position       TYPE i,
          lv_position_start TYPE i,
          part1             TYPE string,
          part2             TYPE string.

    rv_string = iv_number.

    IF iv_number CA sy-abcde.
      RETURN.
    ENDIF.

    lv_length = strlen( iv_number ).

    "Wo ist die erste mögliche Stelle des Tausenderpunktes
    IF iv_number CA ','.
      lv_position_start = 7.
    ELSE.
      lv_position_start = 4.
    ENDIF.

    "Ist Zahl groß genug?
    WHILE lv_length >= lv_position_start.

      lv_position =  lv_length - lv_position_start + 1.

      "Punkt setzten
      part1 = rv_string(lv_position).
      part2 = rv_string+lv_position.
      CONCATENATE part1 '.' part2 INTO rv_string.

      lv_position_start = lv_position_start + 3.

    ENDWHILE.


  ENDMETHOD.                    "get_dot_for_thousand

  METHOD is_numeric.

  ENDMETHOD.                    "is_numeric

  METHOD is_abc.

  ENDMETHOD.                    "is_abc

ENDCLASS.                    "lcl_help_string IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_help_time DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_time DEFINITION INHERITING FROM lcl_help_base.

  PUBLIC SECTION.

    METHODS:

      add_days,
      add_hours,
      add_minutes,
      add_time
        IMPORTING
                  iv_start_date TYPE datum
                  iv_start_time TYPE sy-uzeit
                  iv_add_time   TYPE sy-uzeit
        EXPORTING
                  ev_end_date   TYPE datum
                  ev_end_time   TYPE time
        RAISING   cx_t100_msg.

    METHODS get
      IMPORTING
        iv_zonlo         TYPE sy-zonlo DEFAULT sy-zonlo
      RETURNING
        VALUE(rs_result) TYPE ty_s_type-s_return_base_time_get.

    METHODS time_get_next_month
      RETURNING
        VALUE(rv_month) TYPE string .
    METHODS time_calc_date
      IMPORTING
        !iv_start_date TYPE datum
        !iv_add_month  TYPE i OPTIONAL
        !iv_type       TYPE string DEFAULT '+'
      EXPORTING
        !rv_datum      TYPE datum
      RAISING
        cx_t100_msg .
    METHODS date_add_month
      IMPORTING
                iv_start        TYPE datum
                iv_add          TYPE i
      RETURNING
                VALUE(r_result) TYPE datum
      RAISING   cx_t100_msg.
    METHODS date_substract_month
      IMPORTING
                iv_start        TYPE datum
                iv_add          TYPE i
      RETURNING
                VALUE(r_result) TYPE datum
      RAISING   cx_t100_msg.
    METHODS date_get_last_day_of_month
      IMPORTING
                i_lv_con_en_dat TYPE datum
      RETURNING
                VALUE(r_result) TYPE datum
      RAISING   cx_t100_msg.



*  PUBLIC SECTION.
*
**    TYPES:
**       ty_s_types TYPE lif_help_top_ext=>ty_s_types. "~ty_S_type.
*
*
*    METHODS:
**      constructor
**        IMPORTING
**          iv_timestampl TYPE timestampl OPTIONAL
**          iv_timestamp  TYPE timestamp  OPTIONAL
**          iv_datum      TYPE sy-datum   OPTIONAL
**          iv_time       TYPE sy-uzeit   OPTIONAL,
*      add_days,
*      add_hours,
*      add_minutes,
*      add_time
*        IMPORTING
*                  iv_start_date TYPE datum
*                  iv_start_time TYPE sy-uzeit
*                  iv_add_time   TYPE sy-uzeit
*        EXPORTING
*                  ev_end_date   TYPE datum
*                  ev_end_time   TYPE time
*        RAISING   cx_t100_msg.
*
*    METHODS get
*      IMPORTING
*        iv_zonlo         TYPE sy-zonlo DEFAULT sy-zonlo
*      RETURNING
*        VALUE(rs_result) TYPE ty_s_type-s_return_base_time_get.
*
*    METHODS time_get_next_month
*      RETURNING
*        VALUE(rv_month) TYPE string .
*    METHODS time_calc_date
*      IMPORTING
*        !iv_start_date TYPE datum
*        !iv_add_month  TYPE i OPTIONAL
*        !iv_type       TYPE string DEFAULT '+'
*      EXPORTING
*        !rv_datum      TYPE datum
*      RAISING
*        cx_t100_msg .

ENDCLASS.                    "lcl_help_time DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_help_time IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_time IMPLEMENTATION.



  METHOD time_calc_date.


    DATA:
      lv_date   TYPE begda,
      lv_result TYPE begda,
      lv_month  TYPE dlymo,
      lv_signum TYPE spli1.

    lv_date  = iv_start_date.
    lv_month = iv_add_month.
    lv_signum = iv_type.

    CALL FUNCTION 'RP_CALC_DATE_IN_INTERVAL'
      EXPORTING
        date      = lv_date
        days      = 0
        months    = lv_month
        signum    = lv_signum
        years     = 0
      IMPORTING
        calc_date = lv_result.

    rv_datum = lv_result.



  ENDMETHOD.                    "time_calc_date



  METHOD get.

    GET TIME STAMP FIELD rs_result-timestamp.

    CONVERT TIME STAMP rs_result-timestamp
    TIME ZONE iv_zonlo
    INTO DATE rs_result-datum
    TIME rs_result-time.


  ENDMETHOD.                    "time_get


  METHOD time_get_next_month.


    DATA:
      lv_int TYPE i.

    lv_int = sy-datum+4(2).

    IF lv_int = 12.
      lv_int = 1.
    ELSE.
      ADD 1 TO lv_int.
    ENDIF.

    rv_month = lv_int.

    IF lv_int < 10.
      CONCATENATE '0' rv_month INTO rv_month.
    ENDIF.


  ENDMETHOD.                    "time_get_next_month



*
*  METHOD constructor.
**    DATA:
**      lv_timestamp TYPE timestamp.
**
**    IF iv_timestamp IS NOT SUPPLIED.
**      GET TIME STAMP FIELD iv_timestamp.
**    ENDIF.
**
**    CONVERT TIME STAMP   iv_timestamp
**    TIME ZONE            sy-zonlo
**    INTO DATE            ev_date
**    TIME                 ev_time.
*  ENDMETHOD.                    "constructor


  METHOD add_days.

  ENDMETHOD.                    "add_days

  METHOD add_hours.

  ENDMETHOD.                    "add_hours

  METHOD add_minutes.

  ENDMETHOD.                    "add_minutes

  METHOD add_time.

    DATA:
      lv_tstamp        TYPE timestamp,
      lv_tstamp_result TYPE timestamp,
      lv_add_sec       TYPE i,
      lv_hour          TYPE i,
      lv_minute        TYPE i,
      lv_sec           TYPE i,
      lx_root          TYPE REF TO cx_root.

    TRY.

        " Wie viele Sekunden müssen addiert werden?
        lv_sec    =  iv_add_time+4(2).
        ADD lv_sec TO lv_add_sec.

        lv_minute = iv_add_time+2(2).
        lv_minute = lv_minute * 60.
        ADD lv_minute TO lv_add_sec.

        lv_hour   =  iv_add_time(2).
        lv_hour   = lv_hour * 60 * 60.
        ADD lv_hour TO lv_add_sec.


        " Eingabe in Timestamp
        CONVERT DATE iv_start_date TIME iv_start_time
        INTO TIME STAMP lv_tstamp TIME ZONE sy-zonlo.


        " Addition
        lv_tstamp_result =   cl_abap_tstmp=>add( tstmp = lv_tstamp secs  =  lv_add_sec ).

        " Konvertieren in Ausgabe
*        get_time(
*          EXPORTING
*            iv_timestamp = lv_tstamp_result
*          IMPORTING
*            ev_date      = ev_end_date
*            ev_time      = ev_end_time ).


      CATCH cx_root INTO lx_root. "DATA(lx_root).
    ENDTRY.

  ENDMETHOD.




  METHOD date_add_month.

    DATA:
      lv_date   TYPE begda,
      lv_result TYPE begda,
      lv_month  TYPE dlymo,
      lv_signum TYPE spli1.

    lv_date  = iv_start. "_start_date.
    lv_month = iv_add. "_month.
    lv_signum = '+'. "iv_type.

    CALL FUNCTION 'RP_CALC_DATE_IN_INTERVAL'
      EXPORTING
        date          = lv_date
        days          = 0
        months        = lv_month
        signum        = lv_signum
        years         = 0
      IMPORTING
        calc_date     = lv_result
      EXCEPTIONS
        error_message = 1.
    mo_help->so_check_a_raise->after_function(  ).

    r_result = lv_result.


  ENDMETHOD.

  METHOD date_substract_month.

    DATA:
      lv_date   TYPE begda,
      lv_result TYPE begda,
      lv_month  TYPE dlymo,
      lv_signum TYPE spli1.

    lv_date  = iv_start. "_start_date.
    lv_month = iv_add. "_month.
    lv_signum = '-'. "iv_type.

    CALL FUNCTION 'RP_CALC_DATE_IN_INTERVAL'
      EXPORTING
        date          = lv_date
        days          = 0
        months        = lv_month
        signum        = lv_signum
        years         = 0
      IMPORTING
        calc_date     = lv_result
      EXCEPTIONS
        error_message = 1.
    mo_help->so_check_a_raise->after_function(  ).

    r_result = lv_result.


  ENDMETHOD.


  METHOD date_get_last_day_of_month.

    CALL FUNCTION 'RP_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = i_lv_con_en_dat
      IMPORTING
        last_day_of_month = r_result
      EXCEPTIONS
        day_in_no_date    = 1
        error_message     = 2
        OTHERS            = 3.
    mo_help->so_check_a_raise->after_function(  ).

  ENDMETHOD.

*
*
*  METHOD time_calc_date.
*
*
*    DATA:
*      lv_date   TYPE begda,
*      lv_result TYPE begda,
*      lv_month  TYPE dlymo,
*      lv_signum TYPE spli1.
*
*    lv_date  = iv_start_date.
*    lv_month = iv_add_month.
*    lv_signum = iv_type.
*
*    CALL FUNCTION 'RP_CALC_DATE_IN_INTERVAL'
*      EXPORTING
*        date      = lv_date
*        days      = 0
*        months    = lv_month
*        signum    = lv_signum
*        years     = 0
*      IMPORTING
*        calc_date = lv_result.
*
*    rv_datum = lv_result.
*
*
*
*  ENDMETHOD.                    "time_calc_date
*
*
*
*  METHOD get.
*
*    GET TIME STAMP FIELD rs_result-timestamp.
*
*    CONVERT TIME STAMP rs_result-timestamp
*    TIME ZONE iv_zonlo
*    INTO DATE rs_result-datum
*    TIME rs_result-time.
*
*
*  ENDMETHOD.                    "time_get
*
*
*  METHOD time_get_next_month.
*
*
*    DATA:
*      lv_int TYPE i.
*
*    lv_int = sy-datum+4(2).
*
*    IF lv_int = 12.
*      lv_int = 1.
*    ELSE.
*      ADD 1 TO lv_int.
*    ENDIF.
*
*    rv_month = lv_int.
*
*    IF lv_int < 10.
*      CONCATENATE '0' rv_month INTO rv_month.
*    ENDIF.
*
*
*  ENDMETHOD.                    "time_get_next_month
*
*
*
**
**  METHOD constructor.
***    DATA:
***      lv_timestamp TYPE timestamp.
***
***    IF iv_timestamp IS NOT SUPPLIED.
***      GET TIME STAMP FIELD iv_timestamp.
***    ENDIF.
***
***    CONVERT TIME STAMP   iv_timestamp
***    TIME ZONE            sy-zonlo
***    INTO DATE            ev_date
***    TIME                 ev_time.
**  ENDMETHOD.                    "constructor
*
*
*  METHOD add_days.
*
*  ENDMETHOD.                    "add_days
*
*  METHOD add_hours.
*
*  ENDMETHOD.                    "add_hours
*
*  METHOD add_minutes.
*
*  ENDMETHOD.                    "add_minutes
*
*  METHOD add_time.
*
*    DATA:
*      lv_tstamp        TYPE timestamp,
*      lv_tstamp_result TYPE timestamp,
*      lv_add_sec       TYPE i,
*      lv_hour          TYPE i,
*      lv_minute        TYPE i,
*      lv_sec           TYPE i,
*      lx_root          TYPE REF TO cx_root.
*
*    TRY.
*
*        " Wie viele Sekunden müssen addiert werden?
*        lv_sec    =  iv_add_time+4(2).
*        ADD lv_sec TO lv_add_sec.
*
*        lv_minute = iv_add_time+2(2).
*        lv_minute = lv_minute * 60.
*        ADD lv_minute TO lv_add_sec.
*
*        lv_hour   =  iv_add_time(2).
*        lv_hour   = lv_hour * 60 * 60.
*        ADD lv_hour TO lv_add_sec.
*
*
*        " Eingabe in Timestamp
*        CONVERT DATE iv_start_date TIME iv_start_time
*        INTO TIME STAMP lv_tstamp TIME ZONE sy-zonlo.
*
*
*        " Addition
*        lv_tstamp_result =   cl_abap_tstmp=>add( tstmp = lv_tstamp secs  =  lv_add_sec ).
*
*        " Konvertieren in Ausgabe
**        get_time(
**          EXPORTING
**            iv_timestamp = lv_tstamp_result
**          IMPORTING
**            ev_date      = ev_end_date
**            ev_time      = ev_end_time ).
*
*
*      CATCH cx_root INTO lx_root. "DATA(lx_root).
*    ENDTRY.
*
*  ENDMETHOD.                    "add_time
*

ENDCLASS.                    "lcl_help_time IMPLEMENTATION


*----------------------------------------------------------------------*
*       CLASS lcl_help_itab DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_itab DEFINITION INHERITING FROM lcl_help_base.

  PUBLIC SECTION.

    METHODS:
      get_component
        IMPORTING
          it_ref_table        TYPE REF TO data
        RETURNING
          VALUE(rt_component) TYPE abap_component_tab,

      count_lines,
      is_col_existing
        IMPORTING
          it_table        TYPE any
          iv_col_type     TYPE lvc_s_filt-fieldname
        RETURNING
          VALUE(r_result) TYPE abap_bool,
      is_entry_existing,
      get_row_by_index,
      get_row_by_value,
      get_entry_by_index_col,
      get_entry_by_index_value
        IMPORTING
                  it_table        TYPE STANDARD TABLE
                  iv_column_name  TYPE clike
                  iv_row_id       TYPE clike
        RETURNING
                  VALUE(rv_value) TYPE string
        RAISING   cx_no_results,
      get_last_row,

      sum_col
        IMPORTING
          colname          TYPE string
        RETURNING
          VALUE(rv_result) TYPE ty_s_type-v_l16_d4,

      merge
        IMPORTING
          it_table  TYPE STANDARD TABLE
          it_table2 TYPE STANDARD TABLE OPTIONAL
          iv_name   TYPE clike
          iv_value  TYPE clike
        EXPORTING
          et_table  TYPE STANDARD TABLE
        RAISING
          cx_t100_msg.

    METHODS t_change_sequence
      IMPORTING
        VALUE(it_standard) TYPE STANDARD TABLE
      EXPORTING
        VALUE(et_standard) TYPE STANDARD TABLE .

    METHODS t_get_max_col
      IMPORTING
        !it_table           TYPE ANY TABLE
        !iv_col_name        TYPE string
      EXPORTING
        VALUE(ev_max_value) TYPE simple
      RAISING
        cx_t100_msg .

    METHODS t_sort_by_line_size
      IMPORTING
        !it_any       TYPE STANDARD TABLE
      EXPORTING
        VALUE(et_any) TYPE STANDARD TABLE .
    METHODS t_is_column_equal
      IMPORTING
        !it_any          TYPE STANDARD TABLE
        !iv_col_name     TYPE string
      RETURNING
        VALUE(rv_result) TYPE abap_bool
      RAISING
        cx_t100_msg .

    METHODS check_valid_values
      IMPORTING
        VALUE(it_values_allowed) TYPE stringtab
        !it_values               TYPE stringtab
      EXPORTING
        !et_result               TYPE stringtab
        !et_bapiret2             TYPE bapiret2_tab .

ENDCLASS.                    "lcl_help_table DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_help_itab IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_itab IMPLEMENTATION.

  METHOD get_component.

    FIELD-SYMBOLS:
         <ft_input>  TYPE STANDARD TABLE.

    ASSIGN it_ref_table->* TO <ft_input>.
*
*
    DATA: wa_component TYPE abap_componentdescr.

    DATA:
            lt_data TYPE REF TO data.

    DATA: lo_descr       TYPE REF TO cl_abap_typedescr,
          lo_structdescr TYPE REF TO cl_abap_structdescr,
          lv_name2       TYPE string,
          ls_comp        TYPE LINE OF abap_compdescr_tab.

    FIELD-SYMBOLS:
      <ls_line> TYPE any,
      <lv_feld> TYPE any.
*
    CREATE DATA lt_data LIKE LINE OF <ft_input>.
    ASSIGN lt_data->* TO <ls_line>.

    IF <ft_input> IS NOT INITIAL.
      READ TABLE <ft_input> INDEX 1
        INTO <ls_line>.
*      <ls_line> = <ft_input>[ 1 ].
    ELSE.
      APPEND INITIAL LINE TO <ft_input> ASSIGNING <ls_line>.
    ENDIF.

    lo_descr = cl_abap_structdescr=>describe_by_data( <ls_line> ).

    TRY.

        lo_structdescr ?= lo_descr.

        LOOP AT lo_structdescr->components INTO ls_comp.
          CONCATENATE '<ls_line>-' ls_comp-name INTO lv_name2.
*          DATA(lv_name2) = |<ls_line>-{ CONV string( ls_comp-name ) }|.
          ASSIGN (lv_name2) TO <lv_feld>.

          CLEAR wa_component.
          wa_component-name = ls_comp-name.
          wa_component-type ?= cl_abap_elemdescr=>describe_by_data( <lv_feld> ).
          INSERT wa_component INTO TABLE rt_component.

        ENDLOOP.

      CATCH cx_root.

        CLEAR wa_component.
        wa_component-name = 'ZZ_RTTS_CONTENT'.
        wa_component-type ?= cl_abap_elemdescr=>describe_by_data( <ls_line> ).
        INSERT wa_component INTO TABLE rt_component.

    ENDTRY.

  ENDMETHOD.                    "get_component

  METHOD count_lines.

  ENDMETHOD.                    "count_lines

  METHOD is_col_existing.

    DATA:
      lt_comp      TYPE abap_component_tab,
      lr_tab       TYPE REF TO datam,
      ls_component TYPE LINE OF abap_component_tab.

    GET REFERENCE OF it_table INTO lr_tab.

    lt_comp = get_component( it_ref_table = lr_tab ).

    READ TABLE lt_comp INTO ls_component
       WITH KEY name = iv_col_type.

    IF sy-subrc = 0.
      r_result = abap_true.
    ELSE.
      r_result = abap_false.
    ENDIF.


  ENDMETHOD.                    "is_col_existing



  METHOD t_change_sequence.

    DATA:
    lv_lines TYPE i.

    FIELD-SYMBOLS:
    <ls_any> TYPE any.

    lv_lines = lines(  it_standard ).

    DO lv_lines TIMES.

      READ TABLE it_standard INDEX lv_lines
      ASSIGNING <ls_any>.

      IF sy-subrc = 0.
        APPEND <ls_any> TO et_standard.
      ENDIF.

      ADD -1 TO lv_lines.
    ENDDO.

  ENDMETHOD.                    "t_change_sequence

  METHOD t_is_column_equal.

*    FIELD-SYMBOLS:
*      <lv_field>      TYPE any,
*      <lv_field_comp> TYPE any,
*      <lv_line>       TYPE any.
*
*    LOOP AT it_any ASSIGNING <lv_line>.
*
*      ASSIGN COMPONENT iv_col_name OF STRUCTURE <lv_line> TO <lv_field>.
*      IF sy-subrc <> 0.
*        mo_help->so_cx_t100->raise_text(
*        EXPORTING
*        iv_text       = 'Spalte nicht gefunden' ).
*      ENDIF.
*
*      IF <lv_field_comp> IS NOT ASSIGNED.
*        <lv_field_comp> = <lv_field>.
*      ELSE.
*
*        IF <lv_field_comp> <> <lv_field>.
*          rv_result = abap_false.
*          RETURN.
*        ENDIF.
*
*      ENDIF.
*
*
*    ENDLOOP.
*
*    rv_result = abap_true.

  ENDMETHOD.                    "t_is_column_equal


  METHOD t_sort_by_line_size.

    TYPES:
       BEGIN OF ty_s_info.
    TYPES: index TYPE i,
           size  TYPE abap_msize,
           END OF ty_s_info.

    DATA:
     lt_info TYPE STANDARD TABLE OF ty_s_info.

    FIELD-SYMBOLS:
      <ls_any>  TYPE any,
      <ls_info> TYPE ty_s_info.

    LOOP AT it_any ASSIGNING <ls_any>.

      APPEND INITIAL LINE TO lt_info ASSIGNING <ls_info>.

      <ls_info>-index = sy-tabix.

      cl_abap_memory_utilities=>get_memory_size_of_object(
        EXPORTING
          object                     = <ls_any>    " Object to be calculated
        IMPORTING
          bound_size_used            =  <ls_info>-size    ).

    ENDLOOP.

    SORT lt_info BY size DESCENDING.

    LOOP AT lt_info ASSIGNING <ls_info>.

      READ TABLE it_any ASSIGNING <ls_any>
          INDEX <ls_info>-index.

      APPEND <ls_any> TO et_any.

    ENDLOOP.

  ENDMETHOD.                    "t_sort_by_line_size

  METHOD is_entry_existing.

  ENDMETHOD.                    "is_entry_existing

  METHOD get_row_by_index.

  ENDMETHOD.                    "get_row_by_index

  METHOD get_row_by_value.

  ENDMETHOD.                    "get_row_by_value

  METHOD get_entry_by_index_col.

  ENDMETHOD.                    "get_entry_by_index_col


  METHOD check_valid_values.
*
*    DATA:
*     lo_log TYPE ty_s_types-o_help_log. "ty_o_log.
*
*    CREATE OBJECT lo_log.
*
*    FREE et_result.
*
*    LOOP AT it_values_allowed ASSIGNING FIELD-SYMBOL(<ls_allowed>).
*
*      SHIFT <ls_allowed> LEFT DELETING LEADING ' '.
*    ENDLOOP.
*
*
*    LOOP AT it_values INTO DATA(lv_value).
*
*      SHIFT lv_value LEFT DELETING LEADING ' '.
*
*      READ TABLE it_values_allowed TRANSPORTING NO FIELDS
*          WITH KEY table_line = lv_value.
*
*      IF sy-subrc <> 0.
*        lo_log->add_text( iv_text = |Eingabe { lv_value } kann nicht verarbeitet werden und wird gelöscht.|
*                          iv_type = 'E' ).
*      ELSE.
*        APPEND lv_value TO et_result.
*      ENDIF.
*
*    ENDLOOP.
*
**    if lo_log->is_worst_type( 'E' ) = abap_true.
*    et_bapiret2 = lo_log->mt_bapiret2.
*
**    endif.


  ENDMETHOD.                    "check_valid_values


  METHOD get_entry_by_index_value.

    FIELD-SYMBOLS:
      <ls_line> TYPE any,
      <fs_any>  TYPE any.

    DATA:
      lv_string TYPE string.

    READ TABLE it_table INDEX iv_row_id
   ASSIGNING <ls_line>.

    DATA:
          lv_string2 TYPE string.

    lv_string2 = iv_column_name.
    CONCATENATE '<ls_line>-' lv_string2 INTO lv_string.
*    lv_string = |<ls_line>-{  lv_string2 }|.

    ASSIGN (lv_string) TO <fs_any>.

    IF <fs_any> IS ASSIGNED.
      rv_value = <fs_any>.
    ELSE.
      RAISE EXCEPTION TYPE cx_no_results.
    ENDIF.

  ENDMETHOD.                    "get_entry_by_index_value


  METHOD merge.


    FIELD-SYMBOLS:
      <ls_any>    TYPE any,
      <lv_value>  TYPE any,
      <lt_itab>   TYPE STANDARD TABLE,
      <lv_name>   TYPE string,

      <ls_result> TYPE crms_email_name_value.

    DATA:
            lt_result TYPE STANDARD TABLE OF crms_email_name_value.

    DATA:
      lv_field TYPE string,
      lv_val1  TYPE p LENGTH 16 DECIMALS 2,
      lv_val2  TYPE p LENGTH 16 DECIMALS 2,
      lv_val3  TYPE p LENGTH 16 DECIMALS 2.

    ASSIGN it_table TO <lt_itab>.


    LOOP AT <lt_itab> ASSIGNING <ls_any>.

      UNASSIGN: <lv_name>, <lv_value>.

      CONCATENATE
      '<LS_ANY>-'
      iv_name
      INTO lv_field.

      ASSIGN (lv_field) TO <lv_name>.
      CHECK <lv_name> IS ASSIGNED.

      CONCATENATE
     '<LS_ANY>-'
     iv_value
     INTO lv_field.

      ASSIGN (lv_field) TO <lv_value>.
      CHECK <lv_value> IS ASSIGNED.

      READ TABLE lt_result ASSIGNING <ls_result>
          WITH KEY name = <lv_name>.

      IF sy-subrc = 0.
        lv_val1 =  mo_help->so_abap->conv_get_packed_l16d4( <ls_result>-value ).
        lv_val2 =  mo_help->so_abap->conv_get_packed_l16d4( <lv_value> ).
        lv_val3 = lv_val1 + lv_val2.
        <ls_result>-value = mo_help->so_abap->conv_get_string( lv_val3 ).
      ELSE.
        APPEND INITIAL LINE TO lt_result ASSIGNING <ls_result>.
        <ls_result>-name  = <lv_name>.
        <ls_result>-value = <lv_value>.
      ENDIF.

    ENDLOOP.

*    sort <lt_itab> by (iv_name).

    DATA: lt_table TYPE REF TO data.

    CREATE DATA lt_table LIKE it_table.
    ASSIGN lt_table->* TO <lt_itab>.
    <lt_itab> = it_table.

    SORT <lt_itab> BY (iv_name).
    DELETE ADJACENT DUPLICATES FROM <lt_itab> COMPARING (iv_name).


    LOOP AT <lt_itab> ASSIGNING <ls_any>.


      UNASSIGN: <lv_name>, <lv_value>.

      CONCATENATE
       '<LS_ANY>-'
       iv_name
       INTO lv_field.

      ASSIGN (lv_field) TO <lv_name>.
      CHECK <lv_name> IS ASSIGNED.

      CONCATENATE
     '<LS_ANY>-'
     iv_value
     INTO lv_field.

      ASSIGN (lv_field) TO <lv_value>.
      CHECK <lv_value> IS ASSIGNED.

      READ TABLE lt_result ASSIGNING <ls_result>
          WITH KEY name = <lv_name>.

      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.

      <lv_value> = <ls_result>-value.

    ENDLOOP.

    et_table = <lt_itab>.

  ENDMETHOD.


  METHOD t_get_max_col.

*    FIELD-SYMBOLS:
*      <ls_any>   TYPE any,
*      <lv_value> TYPE any.
*
*    DATA:
*      lv_p     TYPE p DECIMALS 2,
*      lv_p_max TYPE p DECIMALS 2,
*      lv_field TYPE string.
*
*    LOOP AT it_table ASSIGNING <ls_any>.
*
*      CONCATENATE
*      '<LS_ANY>-'
*      iv_col_name
*      INTO lv_field.
*
*      ASSIGN (lv_field) TO <lv_value>.
*
*      CHECK <lv_value> IS ASSIGNED.
*
*      lv_p = conv_get_packed_l16_d4(  <lv_value> ).
*
*      IF lv_p > lv_p_max.
*        lv_p_max = lv_p.
*      ENDIF.
*
*    ENDLOOP.
*
*    conv_conversion_exit(
*    EXPORTING
*    iv_value     = lv_p_max
*    IMPORTING
*    ev_value     = ev_max_value   ).


  ENDMETHOD.                    "t_get_max_col

  METHOD get_last_row.

  ENDMETHOD.                    "get_last_row

  METHOD sum_col.

  ENDMETHOD.                    "sum_col

ENDCLASS.                    "lcl_help_table IMPLEMENTATION


CLASS lcl_help_service DEFINITION
  CREATE PUBLIC INHERITING FROM lcl_help_base.

  PUBLIC SECTION.

    METHODS:

      bal_load
        IMPORTING
          iv_object       TYPE clike
          iv_subobject    TYPE clike OPTIONAL
          iv_extnumber    TYPE clike OPTIONAL
        RETURNING
          VALUE(rt_balmt) TYPE balm_t
        RAISING
          cx_t100_msg,

      bal_save_single
        IMPORTING
          iv_object    TYPE string
          iv_subobject TYPE string OPTIONAL
          iv_extnumber TYPE clike  OPTIONAL
          iv_idno      TYPE clike  OPTIONAL
          iv_id        TYPE any   OPTIONAL
          iv_no        TYPE any   OPTIONAL
          iv_text      TYPE clike OPTIONAL
          iv_v1        TYPE any OPTIONAL
          iv_v2        TYPE any OPTIONAL
          iv_v3        TYPE any OPTIONAL
          iv_v4        TYPE any  OPTIONAL
          iv_type      TYPE clike OPTIONAL
          iv_is_commit TYPE abap_bool DEFAULT abap_false
        RAISING
          cx_t100_msg,

      bal_save
        IMPORTING
          iv_object      TYPE string
          iv_subobject   TYPE string OPTIONAL
          iv_extnumber   TYPE clike  OPTIONAL
          VALUE(it_data) TYPE bapiret2_tab OPTIONAL
          is_line        TYPE bapiret2 OPTIONAL
          iv_is_commit   TYPE abap_bool DEFAULT abap_false
        RAISING
          cx_t100_msg,

      bal_delete
        IMPORTING
          iv_object    TYPE string
          iv_subobject TYPE string OPTIONAL
          iv_extnumber TYPE string OPTIONAL
        RAISING
          cx_t100_msg,

      gos_save,
      gos_load,

      email_send
        IMPORTING
          iv_sender          TYPE sy-uname DEFAULT sy-uname
          iv_email_recipient TYPE clike
          iv_subject         TYPE clike
          it_text            TYPE stringtab
          iv_is_commit       TYPE abap_bool DEFAULT abap_false
        RAISING
          cx_t100_msg,

      idoc_send
        IMPORTING
          is_edidc         TYPE edidc
          is_edidd         TYPE edidd
          iv_is_commit     TYPE abap_bool DEFAULT abap_true
        RETURNING
          VALUE(rv_docnum) TYPE string
        RAISING
          cx_t100_msg.

*    METHODS constructor.

    METHODS:
      classification_change
        IMPORTING
          iv_objectkey    TYPE clike
          iv_objecttable  TYPE clike
          iv_classnum     TYPE clike
          iv_classtype    TYPE clike
          iv_name         TYPE clike
          VALUE(iv_value) TYPE simple
        RAISING
          cx_t100_msg,

      classification_change_num
        IMPORTING
          iv_objectkey    TYPE clike
          iv_objecttable  TYPE clike
          iv_classnum     TYPE clike
          iv_classtype    TYPE clike
          iv_name         TYPE clike
          VALUE(iv_value) TYPE simple
        RAISING
          cx_t100_msg,

      classification_read
        IMPORTING
          iv_objectkey    TYPE clike
          iv_objecttable  TYPE clike
          iv_classnum     TYPE clike
          iv_classtype    TYPE clike
          iv_name         TYPE clike
          VALUE(iv_value) TYPE simple
        EXPORTING
          ev_value        TYPE simple
        RAISING
          cx_t100_msg,

      classification_read_num
        IMPORTING
          iv_objectkey    TYPE clike
          iv_objecttable  TYPE clike
          iv_classnum     TYPE clike
          iv_classtype    TYPE clike
          iv_name         TYPE clike
          VALUE(iv_value) TYPE simple
        EXPORTING
          ev_value        TYPE simple
        RAISING
          cx_t100_msg,

      number_get_next
        IMPORTING
          iv_range  TYPE clike
          iv_object TYPE clike
        EXPORTING
          ev_number TYPE simple
        RAISING
          cx_t100_msg.


    METHODS:
      db_text_save,
      db_text_load
        IMPORTING
                  iv_id          TYPE  clike
                  iv_object      TYPE clike
                  iv_name        TYPE clike
                  iv_langu       TYPE clike OPTIONAL
        RETURNING
                  VALUE(rt_text) TYPE stringtab
        RAISING   cx_t100_msg,

      db_text_update
        IMPORTING
                  iv_id     TYPE  clike
                  iv_object TYPE clike
                  iv_name   TYPE clike
                  iv_langu  TYPE clike OPTIONAL
                  it_text   TYPE stringtab
        RAISING   cx_t100_msg.

    METHODS:
      parameter_get_user
        IMPORTING
          !iv_name        TYPE string
          !iv_user        TYPE clike DEFAULT sy-uname
        RETURNING
          VALUE(rv_value) TYPE string
        RAISING
          cx_t100_msg,

      parameter_get_system
        IMPORTING
          !iv_name         TYPE string
          !iv_type         TYPE clike DEFAULT 'P'
        RETURNING
          VALUE(rv_result) TYPE string
        RAISING
          cx_t100_msg,


      db_is_entry_existing
        IMPORTING
          !iv_table_name   TYPE clike
          !iv_field_name   TYPE clike
          !iv_value        TYPE simple
        RETURNING
          VALUE(rv_result) TYPE abap_bool
        RAISING
          cx_t100_msg,

      db_commit
        IMPORTING
          iv_is_commit TYPE abap_bool DEFAULT abap_true
          iv_is_wait   TYPE abap_bool DEFAULT abap_false
        RAISING
          cx_t100_msg,

      db_commit_a_wait
        IMPORTING
          iv_is_commit TYPE abap_bool DEFAULT abap_true
        RAISING
          cx_t100_msg,

      db_rollback
        IMPORTING
          iv_is_commit TYPE abap_bool DEFAULT abap_true
        RAISING
          cx_t100_msg,


      lock_set
        IMPORTING
          iv_mandt      TYPE sy-mandt DEFAULT sy-mandt
          iv_val1       TYPE clike
          iv_val2       TYPE clike OPTIONAL
          iv_lock       TYPE clike
          iv_mode       TYPE clike DEFAULT 'E'
          iv_scope      TYPE clike DEFAULT '2'
          iv_is_collect TYPE abap_bool DEFAULT abap_false
        RAISING
          cx_t100_msg,


      lock_free
        IMPORTING
          iv_mandt      TYPE sy-mandt DEFAULT sy-mandt
          iv_val1       TYPE clike
          iv_val2       TYPE clike OPTIONAL
          iv_lock       TYPE clike
          iv_scope      TYPE clike DEFAULT '2'
          iv_is_collect TYPE abap_bool DEFAULT abap_false
        RAISING
          cx_t100_msg,

      lock_is_set
        IMPORTING
          iv_val           TYPE clike
          iv_val2          TYPE clike OPTIONAL
*          iv_field         TYPE clike
          iv_lock          TYPE clike
          iv_unam          TYPE sy-uname OPTIONAL
        RETURNING
          VALUE(rv_result) TYPE abap_bool
        RAISING
          cx_t100_msg,

      lock_get_snap
        RETURNING
          VALUE(rt_result) TYPE wlf_seqg3_tab
        RAISING
          cx_t100_msg,

      lock_set_snap
        IMPORTING
          it_snap TYPE wlf_seqg3_tab
        RAISING
          cx_t100_msg,

      lock_collect_set
        RAISING
          cx_t100_msg,

      lock_collect_free.





  PROTECTED SECTION.


    METHODS:
      lock_queue
        IMPORTING
          iv_is_lock     TYPE abap_bool DEFAULT abap_true "iv_fm_name TYPE clike
          VALUE(iv_val1) TYPE clike OPTIONAL
          VALUE(iv_val2) TYPE clike OPTIONAL
          VALUE(iv_val3) TYPE clike OPTIONAL
          iv_params      TYPE clike OPTIONAL
*          iv_field      TYPE clike
*          iv_tab        TYPE clike
          iv_lock        TYPE clike
          iv_mode        TYPE clike DEFAULT 'E'
          iv_scope       TYPE clike DEFAULT '2'
          iv_is_collect  TYPE abap_bool DEFAULT abap_false
        RAISING
          cx_t100_msg,

      lock_queue_get_parmtab
        IMPORTING
                  it_import            TYPE virsimp_tab
                  iv_parms             TYPE seqg3-garg OPTIONAL
                  iv_val1              TYPE any OPTIONAL
                  iv_val2              TYPE any OPTIONAL
                  iv_val3              TYPE any OPTIONAL
        RETURNING VALUE(rt_parameters) TYPE abap_func_parmbind_tab
        RAISING
                  cx_t100_msg.

ENDCLASS.                    "lcl_help_service  DEFINITIO


*----------------------------------------------------------------------*
*       CLASS lcl_help_factory_ext IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
*CLASS lcl_help_factory_ext IMPLEMENTATION.
*
*  METHOD class_constructor.
*
*    CREATE OBJECT so_service.
*    CREATE OBJECT so_data.
*
*  ENDMETHOD.                    "class_constructor
*
*ENDCLASS.                    "lcl_help_factory_ext IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_help_service IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_service IMPLEMENTATION.

  METHOD parameter_get_system.

    DATA:
    ls_tvarvc TYPE tvarvc.

    SELECT SINGLE *
    FROM tvarvc
    INTO CORRESPONDING FIELDS OF ls_tvarvc
    WHERE name = iv_name
    AND type = iv_type.
    mo_help->so_check_a_raise->after_select(  ).

    rv_result = ls_tvarvc-low.

  ENDMETHOD.                    "abap_get_system_parameter


  METHOD parameter_get_user.

    SELECT SINGLE parva
     FROM usr05
     INTO rv_value
     WHERE bname = iv_user
     AND   parid = iv_name.

    "D  01  037 ParameterID & existiert nicht.
    mo_help->so_check_a_raise->after_select(
             iv_id = '01' iv_no = '037' iv_v1 = iv_name ).


  ENDMETHOD.                    "abap_get_user_parameter





  METHOD db_commit.

    DATA:
    ls_bapiret TYPE bapiret2.

    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
      EXPORTING
        wait   = iv_is_wait    " Using the command `COMMIT AND WAIT`
      IMPORTING
        return = ls_bapiret.
    "D  5Z  807 Datenbankänderung konnte nicht durchgeführt werden
    mo_help->so_check_a_raise->after_function( iv_msgid = '5Z' iv_msgno = 807 i_any1 = ls_bapiret ).

  ENDMETHOD.                    "db_commit

  METHOD db_commit_a_wait.

    db_commit( iv_is_wait = abap_true ).

  ENDMETHOD.                    "db_commit_a_wait

  METHOD db_rollback.

    DATA:
      ls_bapiret TYPE bapiret2.

    CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'
      IMPORTING
        return = ls_bapiret.    " Return Messages
    mo_help->so_check_a_raise->after_function( i_any1 = ls_bapiret ).

  ENDMETHOD.                    "db_rollback



  METHOD lock_set.

    TRY.

        lock_queue(
          EXPORTING
            iv_is_lock    = abap_true "fm_name  = lv_name_fm
            iv_val1       = iv_mandt
            iv_val2       = iv_val1
            iv_val3       = iv_val2
            iv_lock       = iv_lock
            iv_mode       = iv_mode
            iv_scope      = iv_scope
            iv_is_collect = iv_is_collect ).


        """""""""""""""""""""""""""
        " Fehlerverarbeitung

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        "D  SE  893 Sperre kann nicht gesetzt werden
        mo_help->so_error->raise_msg( iv_id = 'SE' iv_no = 893 io_previous = lx_root ).
    ENDTRY.

  ENDMETHOD.                    "lock_set

  METHOD lock_free.

    TRY.

        lock_queue(
          EXPORTING
            iv_is_lock  = abap_false "fm_name  = lv_name_fm
            iv_val1       = iv_mandt
            iv_val2       = iv_val1
            iv_val3       = iv_val2
            iv_lock       = iv_lock
            iv_scope      = iv_scope
            iv_is_collect = iv_is_collect ).


        """""""""""""""""""""""""""
        " Fehlerverarbeitung

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        "D  UA_INV_VALUATION    031 Sperre kann nicht aufgehoben werden
        mo_help->so_error->raise_msg( iv_id = 'UA_INV_VALUATION' iv_no =  031 io_previous = lx_root ).
    ENDTRY.

  ENDMETHOD.                    "lock_free

  METHOD lock_queue.

    DATA:
      lv_tab          TYPE  string.

    DATA:
         lr_data TYPE REF TO data.

    DATA:
      lt_parameters TYPE abap_func_parmbind_tab,
      ls_parameters TYPE abap_func_parmbind,
      ls_exception  TYPE abap_func_excpbind,
      lt_exceptions TYPE abap_func_excpbind_tab.

    FIELD-SYMBOLS:
       <lv_any> TYPE data.

    TRY.

        """"""""""""""""""""""""""""""""""
        " Fuba u Schnittstelle bestimmen

        DATA:
          lv_name_fm TYPE char30,
          ls_para    TYPE rsimp,
          lt_excp    TYPE STANDARD TABLE OF rsexc,
          lt_export  TYPE STANDARD TABLE OF rsexp,
          lt_import  TYPE STANDARD TABLE OF rsimp,
          lt_tables  TYPE STANDARD TABLE OF rstbl,
          ls_excp    LIKE LINE OF lt_excp.

        IF iv_is_lock = abap_true.
          CONCATENATE 'ENQUEUE_' iv_lock INTO lv_name_fm.
        ELSE.
          CONCATENATE 'DEQUEUE_' iv_lock INTO lv_name_fm.
        ENDIF.

        CALL FUNCTION 'FUNCTION_EXISTS'
          EXPORTING
            funcname           = lv_name_fm
          EXCEPTIONS
            function_not_exist = 1
            error_message      = 2
            OTHERS             = 3.
        mo_help->so_check_a_raise->after_function( is_sy = sy ).

        CALL FUNCTION 'FUNCTION_IMPORT_INTERFACE'
          EXPORTING
            funcname           = lv_name_fm   " Name of the function module
          TABLES
            exception_list     = lt_excp    " Table of exceptions
            export_parameter   = lt_export    " Table of Export Parameters
            import_parameter   = lt_import    " Table of Import Parameters
*           changing_parameter =     " Table for Changing Parameters
            tables_parameter   = lt_tables   " Table With Tables
          EXCEPTIONS
            error_message      = 1
            function_not_found = 2
            invalid_name       = 3
            OTHERS             = 4.
        mo_help->so_check_a_raise->after_function( is_sy = sy ).


        """"""""""""""""""""""""""""""""""
        " Importparameter befüllen

        IF iv_params IS NOT INITIAL.

          lt_parameters =  lock_queue_get_parmtab(
               it_import     = lt_import
               iv_parms      = iv_params ).

        ELSE.

          lt_parameters = lock_queue_get_parmtab(
              it_import     = lt_import
              iv_val1       = iv_val1
              iv_val2       = iv_val2
              iv_val3       = iv_val3 ).

        ENDIF.


        "MODE
        LOOP AT lt_import INTO ls_para.

          IF iv_is_lock = abap_true AND sy-tabix = 1.
            ls_parameters-name  = ls_para-parameter. "lv_paramname.
            ls_parameters-kind  = abap_func_exporting.
            IF ls_para-typ IS NOT INITIAL.
              CREATE DATA lr_data TYPE (ls_para-typ).
            ELSE.
              CREATE DATA lr_data TYPE char1.
            ENDIF.
            ASSIGN lr_data->* TO <lv_any>.
            <lv_any> = iv_mode.
            GET REFERENCE OF <lv_any> INTO lr_data.
            ls_parameters-value = lr_data.
            INSERT ls_parameters INTO TABLE lt_parameters.
          ENDIF.

        ENDLOOP.

        ls_parameters-name  = '_SCOPE'.
        ls_parameters-kind  = abap_func_exporting.
        IF ls_para-typ IS NOT INITIAL.
          CREATE DATA lr_data TYPE (ls_para-typ).
        ELSE.
          CREATE DATA lr_data TYPE char1.
        ENDIF.
        ASSIGN lr_data->* TO <lv_any>.
        <lv_any> =  iv_scope.
        GET REFERENCE OF <lv_any> INTO lr_data.
        ls_parameters-value = lr_data.
        INSERT ls_parameters INTO TABLE lt_parameters.

        ls_parameters-name  = '_COLLECT'.
        ls_parameters-kind  = abap_func_exporting.
        IF ls_para-typ IS NOT INITIAL.
          CREATE DATA lr_data TYPE (ls_para-typ).
        ELSE.
          CREATE DATA lr_data TYPE char1.
        ENDIF.
        ASSIGN lr_data->* TO <lv_any>.
        <lv_any> = iv_is_collect.
        GET REFERENCE OF <lv_any> INTO lr_data.
        ls_parameters-value = lr_data.
        INSERT ls_parameters INTO TABLE lt_parameters.


        """"""""""""""""""""""""""""""""""
        " Exceptions

        DATA:
          lv_subrc TYPE sy-subrc VALUE 0.

        LOOP AT lt_excp INTO ls_excp.
          ADD 1 TO lv_subrc.

          ls_exception-value = lv_subrc. "1.
          ls_exception-name = ls_excp-exception. "'FOREIGN_LOCK'.
          INSERT ls_exception INTO TABLE lt_exceptions.

        ENDLOOP.

        ls_exception-name = 'ERROR_MESSAGE'.
        ls_exception-value = 3.
        INSERT ls_exception INTO TABLE lt_exceptions.

        ls_exception-name = 'OTHERS'.
        ls_exception-value = 4.
        INSERT ls_exception INTO TABLE lt_exceptions.


        """"""""""""""""""""""""""""""""""
        " Aufruf

        CALL FUNCTION lv_name_fm
          PARAMETER-TABLE
          lt_parameters
          EXCEPTION-TABLE
          lt_exceptions.
        IF sy-subrc <> 0.
          mo_help->so_error->raise_any(  is_sy = sy ).
        ENDIF.

        """""""""""

        DATA:lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        mo_help->so_error->raise_text(  iv_text = 'VALUE = &1 TABLE = &2 OBJECT = &3'
        iv_v1 = iv_val2 iv_v2 = lv_tab iv_v3 = iv_lock io_previous = lx_root ).
    ENDTRY.

  ENDMETHOD.                    "lock_queue

  METHOD lock_is_set.

    DATA:
      lt_enq    TYPE STANDARD TABLE OF seqg3,
      lv_garg   TYPE seqg3-garg,
      lv_gname  TYPE eqegraname,
      lv_number TYPE syst-tabix,
      lv_subrc  TYPE sy-subrc,
      lv_tab    TYPE eqegraname.

    lv_gname = iv_lock.

    SELECT SINGLE roottab
         FROM dd25l
          INTO lv_tab
          WHERE viewname = lv_gname. "iv_lock.
    mo_help->so_check_a_raise->after_select( ).

    IF iv_val2 IS NOT SUPPLIED.
      CONCATENATE sy-mandt iv_val INTO lv_garg. "== concatenated the client and the document number to be used in garg
    ELSE.
      CONCATENATE sy-mandt iv_val iv_val2 INTO lv_garg.
    ENDIF.

    IF iv_unam IS SUPPLIED.

      CALL FUNCTION 'ENQUEUE_READ'
        EXPORTING
          gname                 = lv_tab "lv_gname "'EVVBLKE' " Granularity name (-> table name)
          garg                  = lv_garg    " Granularity value(->values of key fields)
          guname                = iv_unam    " User name
        IMPORTING
          number                = lv_number   " Number of chosen lock entries
          subrc                 = lv_subrc    " Error code of the enqueue call
        TABLES
          enq                   = lt_enq    " List of the chosen lock entries
        EXCEPTIONS
          communication_failure = 1
          system_failure        = 2
          error_message         = 3
          OTHERS                = 4.

    ELSE.

      CALL FUNCTION 'ENQUEUE_READ'
        EXPORTING
          gname                 = lv_tab "lv_gname "'EVVBLKE' " Granularity name (-> table name)
          garg                  = lv_garg    " Granularity value(->values of key fields)
        IMPORTING
          number                = lv_number   " Number of chosen lock entries
          subrc                 = lv_subrc    " Error code of the enqueue call
        TABLES
          enq                   = lt_enq    " List of the chosen lock entries
        EXCEPTIONS
          communication_failure = 1
          system_failure        = 2
          error_message         = 3
          OTHERS                = 4.

    ENDIF.
    mo_help->so_check_a_raise->after_function(  is_sy = sy ).

    IF lines(  lt_enq ) > 0.
      rv_result = abap_true.
    ELSE.
      rv_result = abap_false.
    ENDIF.

  ENDMETHOD.                    "lock_is_set

  METHOD lock_get_snap.

    DATA
      lv_process_id TYPE string.

    CALL FUNCTION 'ENQUEUE_READ'
      TABLES
        enq                   = rt_result    " List of the chosen lock entries
      EXCEPTIONS
        communication_failure = 1
        system_failure        = 2
        error_message         = 3
        OTHERS                = 4.
    mo_help->so_check_a_raise->after_function(  is_sy = sy ).

    mo_help->so_abap->info_get( IMPORTING ev_work_process_id = lv_process_id ).
    DELETE rt_result WHERE gtwp <> lv_process_id.

  ENDMETHOD.                    "lock_get_snap

  METHOD lock_set_snap.

    DATA:
      lt_enq  TYPE STANDARD TABLE OF seqg3,
      ls_snap TYPE seqg3.

    TRY.
        lt_enq = lock_get_snap( ).

        "sperre setzten die aktuell nicht vorhanden
        LOOP AT it_snap INTO ls_snap.

          READ TABLE lt_enq TRANSPORTING NO FIELDS
              WITH KEY gname = ls_snap-gname garg = ls_snap-garg.

          IF sy-subrc <> 0.

            lock_queue(
             EXPORTING
               iv_is_lock      = abap_true
               iv_params       = ls_snap-garg
               iv_lock         = ls_snap-gobj ).

          ENDIF.

        ENDLOOP.


        "sperre lösen die aktuell zu viel
        LOOP AT lt_enq INTO ls_snap.

          READ TABLE it_snap TRANSPORTING NO FIELDS
              WITH KEY gname = ls_snap-gname garg = ls_snap-garg.

          IF sy-subrc <> 0.

            lock_queue(
              EXPORTING
                iv_is_lock      = abap_false
                iv_params       = ls_snap-garg
                iv_lock         = ls_snap-gobj ).

          ENDIF.

        ENDLOOP.

        DATA: lx_t100 TYPE REF TO cx_t100_msg.
      CATCH cx_t100_msg INTO lx_t100.
        mo_help->so_error->raise_text(  'Sperrzustand aus Snapshot konnte nicht wiederhergestellt werden' ).
    ENDTRY.

  ENDMETHOD.                    "lock_set_snap

  METHOD lock_collect_set.

    CALL FUNCTION 'FLUSH_ENQUEUE'
      EXCEPTIONS
        foreign_lock   = 1
        system_failure = 2
        error_message  = 3
        OTHERS         = 4.
    mo_help->so_check_a_raise->after_function(  is_sy = sy ).

  ENDMETHOD.                    "lock_collect_set

  METHOD lock_collect_free.

    CALL FUNCTION 'RESET_ENQUEUE'.

  ENDMETHOD.                    "lock_collect_free

  METHOD lock_queue_get_parmtab.

    DATA:
         lr_data TYPE REF TO data.

    DATA:
      ls_parameters TYPE abap_func_parmbind.

    FIELD-SYMBOLS:
       <lv_any> TYPE data.

    DATA:
      ls_para TYPE rsimp,
      lv_int  TYPE i,
      lv_pos  TYPE i VALUE 0..

    TRY.

        IF iv_parms IS NOT INITIAL.

          LOOP AT it_import INTO ls_para.
            "Verfahren um iv_parms aufzuschlüsseln

            IF sy-tabix = 1.
              CONTINUE.
            ENDIF.

            IF ls_para-typ = '' AND ls_para-parameter(1) = 'X'.
*          so_error->raise_text( 'Anzahl Schlüssel <> Anzahl Import Sperrobjekt').
              EXIT.
            ENDIF.

            ls_parameters-name  = ls_para-parameter. "'VBELN'.
            ls_parameters-kind  = abap_func_exporting.
            CREATE DATA lr_data TYPE (ls_para-typ).
            ASSIGN lr_data->* TO <lv_any>.

            mo_help->so_abap->rtts_get_info_simple(
              EXPORTING
                iv_element      = <lv_any>
              IMPORTING
                ev_outputlen    = lv_int ).

            <lv_any> = iv_parms+lv_pos(lv_int).
            ADD lv_int TO lv_pos.
            <lv_any> = mo_help->so_abap->conv_exit( <lv_any> ).
            GET REFERENCE OF <lv_any> INTO lr_data.
            ls_parameters-value = lr_data.
            INSERT ls_parameters INTO TABLE rt_parameters.

          ENDLOOP.

        ELSE.


          """"""""""""""""""""""""""""""""""
          " Importparameter befüllen

          LOOP AT it_import INTO ls_para.

            IF iv_val1 IS NOT INITIAL AND sy-tabix = 2.

              IF ls_para-typ = '' AND ls_para-parameter(1) = 'X'.
                mo_help->so_error->raise_text( 'Anzahl Schlüssel <> Anzahl Import Sperrobjekt').
              ENDIF.

              ls_parameters-name  = ls_para-parameter. "'VBELN'.
              ls_parameters-kind  = abap_func_exporting.
              CREATE DATA lr_data TYPE (ls_para-typ).
              ASSIGN lr_data->* TO <lv_any>.
              <lv_any> = iv_val1.
              <lv_any> = mo_help->so_abap->conv_exit( <lv_any> ).
              GET REFERENCE OF <lv_any> INTO lr_data.
              ls_parameters-value = lr_data.
              INSERT ls_parameters INTO TABLE rt_parameters.
            ENDIF.

            IF iv_val2 IS NOT INITIAL AND sy-tabix = 3.

              IF ls_para-typ = '' AND ls_para-parameter(1) = 'X'.
                mo_help->so_error->raise_text( 'Anzahl Schlüssel <> Anzahl Import Sperrobjekt').
              ENDIF.

              ls_parameters-name  = ls_para-parameter. "'VBELN'.
              ls_parameters-kind  = abap_func_exporting.
              CREATE DATA lr_data TYPE (ls_para-typ).
              ASSIGN lr_data->* TO <lv_any>.
              <lv_any> = iv_val2.
              <lv_any> = mo_help->so_abap->conv_exit( <lv_any> ).
              GET REFERENCE OF <lv_any> INTO lr_data.
              ls_parameters-value = lr_data.
              INSERT ls_parameters INTO TABLE rt_parameters.
            ENDIF.

            IF iv_val3 IS NOT INITIAL AND sy-tabix = 4.

              IF ls_para-typ = '' AND ls_para-parameter(1) = 'X'.
                mo_help->so_error->raise_text( 'Anzahl Schlüssel <> Anzahlö Import Sperrobjekt').
              ENDIF.

              ls_parameters-name  = ls_para-parameter. "'VBELN'.
              ls_parameters-kind  = abap_func_exporting.
              CREATE DATA lr_data TYPE (ls_para-typ).
              ASSIGN lr_data->* TO <lv_any>.
              <lv_any> = iv_val3.
              <lv_any> = mo_help->so_abap->conv_exit( <lv_any> ).
              GET REFERENCE OF <lv_any> INTO lr_data.
              ls_parameters-value = lr_data.
              INSERT ls_parameters INTO TABLE rt_parameters.
            ENDIF.

          ENDLOOP.

        ENDIF.

        DATA:
                lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        mo_help->so_error->raise_text( iv_text = 'Klappt nicht' io_previous = lx_root ).
    ENDTRY.

  ENDMETHOD.                    "lock_queue_get_parmtab


  METHOD db_is_entry_existing.

    DATA: lv_condition1 TYPE string,
          lx_root       TYPE REF TO cx_root.

    CONCATENATE
      iv_field_name
      ' = '
      iv_value
      INTO lv_condition1
      RESPECTING BLANKS.


    TRY.

        SELECT SINGLE (iv_value)
        FROM (iv_table_name)
        INTO sy-mandt
        WHERE (lv_condition1).
*        ENDSELECT.

        IF sy-subrc <> 0.
          rv_result = abap_false.
        ELSE.
          rv_result = abap_true.
        ENDIF.

      CATCH cx_root INTO lx_root.
        mo_help->so_error->raise_text(
            iv_text         = 'Select fehlerhaft'
            io_previous     =  lx_root   ).
    ENDTRY.

  ENDMETHOD.                    "abap_is_entry_existing



  METHOD classification_change.


    DATA:
      lv_objectkey   TYPE objnum,
      lv_objecttable TYPE tabelle,
      lv_classnum    TYPE klasse_d,
      lv_classtype   TYPE klassenart.

    DATA:
      lt_valuesnum  TYPE STANDARD TABLE OF bapi1003_alloc_values_num,
      lt_valueschar TYPE STANDARD TABLE OF bapi1003_alloc_values_char,
      lt_valuescurr TYPE STANDARD TABLE OF bapi1003_alloc_values_curr,
      lv_charact    TYPE atnam,
      lt_return     TYPE bapiret2_tab,
      ls_return     TYPE bapiret2.

    FIELD-SYMBOLS:
      <ls_value> TYPE bapi1003_alloc_values_char.


    """"""""""""""""""""""""""""""""""""""""""""
    " Klasse auslesen

    lv_objectkey   = iv_objectkey.
    lv_objecttable = iv_objecttable.
    lv_classnum    = iv_classnum.
    lv_classtype   = iv_classtype.
    lv_charact     = iv_name.

    CALL FUNCTION 'BAPI_OBJCL_GETDETAIL'
      EXPORTING
        objectkey       = lv_objectkey
        objecttable     = lv_objecttable
        classnum        = lv_classnum
        classtype       = lv_classtype
*       KEYDATE         = SY-DATUM
*       UNVALUATED_CHARS       = ' '
*       LANGUAGE        = SY-LANGU
*   IMPORTING
*       STATUS          =
*       STANDARDCLASS   =
      TABLES
        allocvaluesnum  = lt_valuesnum
        allocvalueschar = lt_valueschar
        allocvaluescurr = lt_valuescurr
        return          = lt_return
      EXCEPTIONS
        error_message   = 1.
    mo_help->so_check_a_raise->after_function( is_sy = sy  i_any1 = lt_return ).


    """"""""""""""""""""""""""""""""""""""""""""
    " Klasse verändern

    READ TABLE lt_valueschar ASSIGNING <ls_value>
      WITH KEY charact = lv_charact.
    "D    ADPTM   062 Merkmal & ist nicht vorhanden
    IF sy-subrc <> 0.
      APPEND INITIAL LINE TO lt_valueschar ASSIGNING <ls_value>.
      <ls_value>-charact = lv_charact.
*
*    so_cx_t100->raise(
*        iv_msgid    = 'ADPTM'
*        iv_msgno    = 062
*        iv_msgv1    = lv_charact ).
    ENDIF.

    mo_help->so_abap->conv_conversion_exit(
      EXPORTING
        iv_value     = iv_value
      IMPORTING
        ev_value     = iv_value ).

    <ls_value>-value_char = iv_value.


    CALL FUNCTION 'BAPI_OBJCL_CHANGE'
      EXPORTING
        objectkey          = lv_objectkey
        objecttable        = lv_objecttable
        classnum           = lv_classnum
        classtype          = lv_classtype
*       STATUS             = '1'
*       STANDARDCLASS      =
*       CHANGENUMBER       =
*       KEYDATE            = SY-DATUM
*       NO_DEFAULT_VALUES  = ' '
*     IMPORTING
*       CLASSIF_STATUS     =
      TABLES
        allocvaluesnumnew  = lt_valuesnum
        allocvaluescharnew = lt_valueschar
        allocvaluescurrnew = lt_valuescurr
        return             = lt_return
      EXCEPTIONS
        error_message      = 1.
    mo_help->so_check_a_raise->after_function( is_sy = sy  i_any1 = lt_return ).


    """"""""""""""""""""""""""""""""""""""""""""
    " Klasse speichern

    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
      EXPORTING
        wait          = 'X'
      IMPORTING
        return        = ls_return
      EXCEPTIONS
        error_message = 1.
    mo_help->so_check_a_raise->after_function( is_sy   = sy  i_any1 = ls_return ).


  ENDMETHOD.                    "classification_change


  METHOD classification_change_num.

    DATA:
      lv_objectkey   TYPE objnum,
      lv_objecttable TYPE tabelle,
      lv_classnum    TYPE klasse_d,
      lv_classtype   TYPE klassenart.

    DATA:
      lt_valuesnum  TYPE STANDARD TABLE OF bapi1003_alloc_values_num,
      lt_valueschar TYPE STANDARD TABLE OF bapi1003_alloc_values_char,
      lt_valuescurr TYPE STANDARD TABLE OF bapi1003_alloc_values_curr,
      lv_charact    TYPE atnam,
      lt_return     TYPE bapiret2_tab,
      ls_return     TYPE bapiret2.

    FIELD-SYMBOLS:
      <ls_value> TYPE bapi1003_alloc_values_num.


    """"""""""""""""""""""""""""""""""""""""""""
    " Klasse auslesen

    lv_objectkey   = iv_objectkey.
    lv_objecttable = iv_objecttable.
    lv_classnum    = iv_classnum.
    lv_classtype   = iv_classtype.
    lv_charact     = iv_name.

    CALL FUNCTION 'BAPI_OBJCL_GETDETAIL'
      EXPORTING
        objectkey       = lv_objectkey
        objecttable     = lv_objecttable
        classnum        = lv_classnum
        classtype       = lv_classtype
*       KEYDATE         = SY-DATUM
*       UNVALUATED_CHARS       = ' '
*       LANGUAGE        = SY-LANGU
*   IMPORTING
*       STATUS          =
*       STANDARDCLASS   =
      TABLES
        allocvaluesnum  = lt_valuesnum
        allocvalueschar = lt_valueschar
        allocvaluescurr = lt_valuescurr
        return          = lt_return
      EXCEPTIONS
        error_message   = 1.
    mo_help->so_check_a_raise->after_function( is_sy = sy  i_any1 = lt_return ).


    """"""""""""""""""""""""""""""""""""""""""""
    " Klasse verändern

    READ TABLE lt_valuesnum ASSIGNING <ls_value>
      WITH KEY charact = lv_charact.
    "D    ADPTM   062 Merkmal & ist nicht vorhanden
    IF sy-subrc <> 0.
      APPEND INITIAL LINE TO lt_valuesnum ASSIGNING <ls_value>.
      <ls_value>-charact = lv_charact.
*
*    so_cx_t100->raise(
*        iv_msgid    = 'ADPTM'
*        iv_msgno    = 062
*        iv_msgv1    = lv_charact ).
    ENDIF.

    mo_help->so_abap->conv_conversion_exit(
      EXPORTING
        iv_value     = iv_value
      IMPORTING
        ev_value     = iv_value ).

    <ls_value>-value_from = iv_value.


    CALL FUNCTION 'BAPI_OBJCL_CHANGE'
      EXPORTING
        objectkey          = lv_objectkey
        objecttable        = lv_objecttable
        classnum           = lv_classnum
        classtype          = lv_classtype
*       STATUS             = '1'
*       STANDARDCLASS      =
*       CHANGENUMBER       =
*       KEYDATE            = SY-DATUM
*       NO_DEFAULT_VALUES  = ' '
*     IMPORTING
*       CLASSIF_STATUS     =
      TABLES
        allocvaluesnumnew  = lt_valuesnum
        allocvaluescharnew = lt_valueschar
        allocvaluescurrnew = lt_valuescurr
        return             = lt_return
      EXCEPTIONS
        error_message      = 1.
    mo_help->so_check_a_raise->after_function( is_sy = sy  i_any1 = lt_return ).


    """"""""""""""""""""""""""""""""""""""""""""
    " Klasse speichern

    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
      EXPORTING
        wait          = 'X'
      IMPORTING
        return        = ls_return
      EXCEPTIONS
        error_message = 1.
    mo_help->so_check_a_raise->after_function( is_sy   = sy  i_any1 = ls_return ).


  ENDMETHOD.                    "classification_change_num


  METHOD classification_read.

    DATA:
      lv_objectkey   TYPE objnum,
      lv_objecttable TYPE tabelle,
      lv_classnum    TYPE klasse_d,
      lv_classtype   TYPE klassenart.

    DATA:
      lt_valuesnum  TYPE STANDARD TABLE OF bapi1003_alloc_values_num,
      lt_valueschar TYPE STANDARD TABLE OF bapi1003_alloc_values_char,
      lt_valuescurr TYPE STANDARD TABLE OF bapi1003_alloc_values_curr,
      lv_charact    TYPE atnam,
      lt_return     TYPE bapiret2_tab.

    FIELD-SYMBOLS:
      <ls_value> TYPE bapi1003_alloc_values_char.

    lv_objectkey   = iv_objectkey.
    lv_objecttable = iv_objecttable.
    lv_classnum    = iv_classnum.
    lv_classtype   = iv_classtype.
    lv_charact     = iv_name.

    CALL FUNCTION 'BAPI_OBJCL_GETDETAIL'
      EXPORTING
        objectkey       = lv_objectkey
        objecttable     = lv_objecttable
        classnum        = lv_classnum
        classtype       = lv_classtype
*       KEYDATE         = SY-DATUM
*       UNVALUATED_CHARS       = ' '
*       LANGUAGE        = SY-LANGU
*   IMPORTING
*       STATUS          =
*       STANDARDCLASS   =
      TABLES
        allocvaluesnum  = lt_valuesnum
        allocvalueschar = lt_valueschar
        allocvaluescurr = lt_valuescurr
        return          = lt_return
      EXCEPTIONS
        error_message   = 1.
    mo_help->so_check_a_raise->after_function( is_sy = sy  i_any1 = lt_return ).


    READ TABLE lt_valueschar ASSIGNING <ls_value>
      WITH KEY charact = lv_charact.
    mo_help->so_check_a_raise->after_read_table( ).

    mo_help->so_abap->conv_conversion_exit(
      EXPORTING
        iv_value     = <ls_value>-value_char
      IMPORTING
        ev_value     = ev_value ).

  ENDMETHOD.                    "classification_read


  METHOD classification_read_num.

    DATA:
      lv_objectkey   TYPE objnum,
      lv_objecttable TYPE tabelle,
      lv_classnum    TYPE klasse_d,
      lv_classtype   TYPE klassenart.

    DATA:
      lt_valuesnum  TYPE STANDARD TABLE OF bapi1003_alloc_values_num,
      lt_valueschar TYPE STANDARD TABLE OF bapi1003_alloc_values_char,
      lt_valuescurr TYPE STANDARD TABLE OF bapi1003_alloc_values_curr,
      lv_charact    TYPE atnam,
      lt_return     TYPE bapiret2_tab.


    FIELD-SYMBOLS:
          <ls_value> TYPE bapi1003_alloc_values_num.

    lv_objectkey   = iv_objectkey.
    lv_objecttable = iv_objecttable.
    lv_classnum    = iv_classnum.
    lv_classtype   = iv_classtype.
    lv_charact     = iv_name.

    CALL FUNCTION 'BAPI_OBJCL_GETDETAIL'
      EXPORTING
        objectkey       = lv_objectkey
        objecttable     = lv_objecttable
        classnum        = lv_classnum
        classtype       = lv_classtype
*       KEYDATE         = SY-DATUM
*       UNVALUATED_CHARS       = ' '
*       LANGUAGE        = SY-LANGU
*   IMPORTING
*       STATUS          =
*       STANDARDCLASS   =
      TABLES
        allocvaluesnum  = lt_valuesnum
        allocvalueschar = lt_valueschar
        allocvaluescurr = lt_valuescurr
        return          = lt_return
      EXCEPTIONS
        error_message   = 1.
    mo_help->so_check_a_raise->after_function( is_sy = sy  i_any1 = lt_return ).

    READ TABLE lt_valuesnum ASSIGNING <ls_value>
      WITH KEY charact = lv_charact.
    mo_help->so_check_a_raise->after_read_table( ).

    mo_help->so_abap->conv_conversion_exit(
      EXPORTING
        iv_value     = <ls_value>-value_from
      IMPORTING
        ev_value     = ev_value ).

  ENDMETHOD.                    "classification_read_num

*
*  METHOD constructor.
*
*    CREATE OBJECT mo_help.
*
*  ENDMETHOD.                    "constructor


  METHOD bal_load.

    DATA:
      ls_extn   TYPE bal_s_extn,
      ls_sub    TYPE bal_s_sub,
      ls_obj    TYPE bal_s_obj,
      ls_filt   TYPE bal_s_lfil,
      lt_header TYPE balhdr_t,
      ls_header TYPE LINE OF balhdr_t.

    ls_extn-sign   = ls_sub-sign   = ls_obj-sign   = 'I'.
    ls_extn-option = ls_sub-option = ls_obj-option = 'EQ'.

    ls_obj-low  = iv_object    .
    ls_sub-low  = iv_subobject .
    ls_extn-low = iv_extnumber.

    APPEND:
        ls_extn TO ls_filt-extnumber,
        ls_obj  TO ls_filt-object,
        ls_sub  TO ls_filt-subobject.

    CALL FUNCTION 'BAL_DB_SEARCH'
      EXPORTING
        i_s_log_filter     = ls_filt    " Log header data filter
      IMPORTING
        e_t_log_header     = lt_header    " Table of log header data read
      EXCEPTIONS
        log_not_found      = 1
        no_filter_criteria = 2
        error_message      = 3
        OTHERS             = 4.
    mo_help->so_check_a_raise->after_function( is_sy = sy ).

    READ TABLE lt_header
     INTO ls_header INDEX 1.
    mo_help->so_check_a_raise->after_read_table( is_sy = sy ).



    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "laden

    DATA:
      lt_lognumber TYPE STANDARD TABLE OF szal_lognumber.


    LOOP AT lt_header INTO ls_header.
      APPEND ls_header-lognumber TO lt_lognumber.
    ENDLOOP.

    DATA:
      lt_message TYPE STANDARD TABLE OF balm,
      lt_parms   TYPE STANDARD TABLE OF balmp.

    CALL FUNCTION 'APPL_LOG_READ_DB_WITH_LOGNO'
*  EXPORTING
*    put_into_memory    = SPACE
*  IMPORTING
*    number_of_logs     =     " Number of logs read
      TABLES
        lognumbers         = lt_lognumber
*       header_data        =     " Log header data
*       header_parameters  =     " Log parameters
        messages           = lt_message    " Log messages
        message_parameters = lt_parms   " Message parameters
*       contexts           =
*       t_exceptions       =     " Application Log: Exceptions in Log
      .



    IF lt_message IS INITIAL.
      mo_help->so_error->raise_text(  'Keine BAL Informationen vorhanden.' ).
    ENDIF.


    SORT lt_message BY time_stmp DESCENDING.

    rt_balmt = lt_message.

  ENDMETHOD.                    "bal_load

  METHOD bal_save.

    DATA:
      lx_root     TYPE REF TO cx_root,
      lv_handle   TYPE balloghndl,
      ls_bapiret2 TYPE bapiret2.

    TRY.

        IF is_line IS NOT INITIAL.
          APPEND is_line TO it_data.
        ENDIF.

        """"""""""""""""""""""""""""""""""""""""
        " BAL erzeugen

        DATA:
          ls_log TYPE bal_s_log.

        ls_log-object    = iv_object.
        ls_log-subobject = iv_subobject.
        ls_log-extnumber = iv_extnumber.

        CALL FUNCTION 'BAL_LOG_CREATE'
          EXPORTING
            i_s_log                 = ls_log " Log header data
          IMPORTING
            e_log_handle            = lv_handle  " Log handle
          EXCEPTIONS
            log_header_inconsistent = 1
            error_message           = 3
            OTHERS                  = 2.
        mo_help->so_check_a_raise->after_function( is_sy = sy ).

*          CATCH cx_t100_msg INTO lx_t100.
*            mo_help->so_cx_factory->raise_text(
*                 iv_text = 'BAL Objekt konnte nicht gefunden und nicht erzeugt werden'
*                 io_previous = lx_t100 ).
*        ENDTRY.
*    ENDTRY.

        DATA:
          lt_handle    TYPE bal_t_logh.


        """"""""""""""""""""""""""""""""""""""""
        " Nachrichten übertragen

        LOOP AT it_data INTO ls_bapiret2.

          TRY.
              DATA:
             ls_msg TYPE bal_s_msg .

              ls_msg-msgid = ls_bapiret2-id.
              ls_msg-msgno = ls_bapiret2-number.
              ls_msg-msgty = ls_bapiret2-type.
              ls_msg-msgv1 = ls_bapiret2-message_v1.
              ls_msg-msgv2 = ls_bapiret2-message_v2.
              ls_msg-msgv3 = ls_bapiret2-message_v3.
              ls_msg-msgv4 = ls_bapiret2-message_v4.

              CALL FUNCTION 'BAL_LOG_MSG_ADD'
                EXPORTING
                  i_log_handle     = lv_handle
                  i_s_msg          = ls_msg
                EXCEPTIONS
                  log_not_found    = 1
                  msg_inconsistent = 2
                  log_is_full      = 3
                  error_message    = 4
                  OTHERS           = 5.
              mo_help->so_check_a_raise->after_function( is_sy = sy ).
              "cx_t100->check_a_raise_function( is_sy = sy ).

            CATCH cx_t100_msg.
          ENDTRY.

        ENDLOOP.


        """"""""""""""""""""""""""""""""""""""""
        " Speichern

*    DATA:
*       ls_header TYPE balhdr.

        DATA:
*      <lt_handle TYPE bal_t_logh,
          lt_log_nr TYPE bal_t_lgnm.

        FREE lt_handle.
        APPEND lv_handle TO lt_handle.

        CALL FUNCTION 'BAL_DB_SAVE'
          EXPORTING
*           i_client         = SY-MANDT    " Client in which the new log is to be saved
*           i_in_update_task = SPACE    " Save in UPDATE TASK
*           i_save_all       = 'X'    " Save all logs in memory
            i_t_log_handle   = lt_handle    " Table of log handles
*           i_2th_connection = 'X'   " FALSE: No secondary connection
*           i_2th_connect_commit = 'X' "SPACE'    " FALSE: No COMMIT in module
*           i_link2job       = 'X'    " Boolean Variable (X=True, -=False, Space=Unknown)
          IMPORTING
            e_new_lognumbers = lt_log_nr   " Table of new log numbers
*           e_second_connection  =     " Name of Secondary Connection
          EXCEPTIONS
            log_not_found    = 1
            save_not_allowed = 2
            numbering_error  = 3
            error_message    = 4
            OTHERS           = 5.
        mo_help->so_check_a_raise->after_function( is_sy = sy ).

        IF iv_is_commit = abap_true.
          mo_help->so_service->db_commit( iv_is_wait = abap_true ).
        ENDIF.

*  commit work and wait.
        """"""""""""""""""""""""""""""""""""""""
        " Fehlerbehandlung

      CATCH cx_root INTO lx_root.

        IF iv_is_commit = abap_true.
          ROLLBACK WORK.
        ENDIF.

        CALL FUNCTION 'BAL_LOG_REFRESH'
          EXPORTING
            i_log_handle = lv_handle.

        mo_help->so_error->raise_text(
                   iv_text = 'Daten konnten nicht in BAL gespeichert werden.'
                   io_previous = lx_root ).
    ENDTRY.

  ENDMETHOD.                    "bal_save

  METHOD bal_delete.

  ENDMETHOD.                    "bal_delete

  METHOD email_send.


    "Method-Local Data Declarations:
    DATA: lo_sender  TYPE REF TO if_sender_bcs,
          lo_message TYPE REF TO cl_bcs,
          lv_adress  TYPE  adr6-smtp_addr.

    TRY.

        "Create a new send request:
        lo_message = cl_bcs=>create_persistent( ).


        "Create the sender using the current user:
        lo_sender = cl_sapuser_bcs=>create( iv_sender ).
        lo_message->set_sender( lo_sender ).


        DATA: lo_recipient TYPE REF TO if_recipient_bcs.
        "Create a recipient using the provided email address:
        lv_adress = iv_email_recipient.
        lo_recipient =  cl_cam_address_bcs=>create_internet_address( i_address_string = lv_adress ).
        "Add the recipient to the message:
        lo_message->add_recipient(  lo_recipient ).


        "Method-Local Data Declarations:
        DATA: lo_document TYPE REF TO if_document_bcs,
              lt_payload  TYPE bcsy_text,
              lv_text     LIKE LINE OF it_text.
        FIELD-SYMBOLS:
        <lfs_line> LIKE LINE OF lt_payload.
        "Create a simple text document payload:

        LOOP AT it_text INTO lv_text.
          APPEND INITIAL LINE TO lt_payload ASSIGNING <lfs_line>.
          <lfs_line>-line = lv_text.
        ENDLOOP.


        DATA: lv_subject TYPE sood-objdes.
        lv_subject = iv_subject.
        lo_document = cl_document_bcs=>create_from_text( i_text = lt_payload i_subject = lv_subject ).

        "Append the document to the message body:
        lo_message->set_document( lo_document ).


        DATA: lv_req_status  TYPE bcs_rqst VALUE 'N',
              lv_status_mail TYPE bcs_stml VALUE 'N'.
        "Turn off status messages for the request:
        lo_message->set_status_attributes(
        i_requested_status = lv_req_status
        i_status_mail = lv_status_mail ).
        "Toggle the flag to send the message immediately:
        lo_message->set_send_immediately( 'X' ).
        "Send the message:
        lo_message->send( ).
        "Have to commit the changes to enqueue the message:
        IF iv_is_commit = abap_true.
          mo_help->so_service->db_commit_a_wait(  ).
        ENDIF.


        "Fehlerbehandlung
        DATA: lx_bcx TYPE REF TO cx_bcs.
      CATCH  cx_bcs INTO lx_bcx.
        IF iv_is_commit = abap_true.
          mo_help->so_service->db_rollback( ).
        ENDIF.
        "D  KE_HDB  100 Email konnte nicht versendet werden
        mo_help->so_error->raise_msg(  iv_id = 'KE_HDB' iv_no = 100 io_previous = lx_bcx ).
    ENDTRY.


  ENDMETHOD.                    "email_send


  METHOD db_text_load.

    DATA:
      lv_langu  TYPE tdspras,
      lt_text   TYPE STANDARD TABLE OF tline,
      lv_id     TYPE tdid,
      lv_char70 TYPE char70,
      ls_line   TYPE tline,
      lv_object TYPE tdobject.

    FIELD-SYMBOLS:

                   <fv_line> TYPE string.

    IF iv_langu IS SUPPLIED.
      lv_langu = iv_langu.
    ELSE.
      lv_langu = sy-langu.
    ENDIF.

    lv_id = iv_id.
    lv_object = iv_object.
    lv_char70 = iv_name.
    lv_object = iv_object.

    CALL FUNCTION 'READ_TEXT'
      EXPORTING
        client                  = sy-mandt
        id                      = lv_id
        language                = lv_langu
        name                    = lv_char70 "v_name )
        object                  = lv_object
      TABLES
        lines                   = lt_text
      EXCEPTIONS
        id                      = 1
        language                = 2
        name                    = 3
        not_found               = 4
        object                  = 5
        reference_check         = 6
        wrong_access_to_archive = 7
        OTHERS                  = 8.
    IF sy-subrc <> 0.
*      DATA(lx_error) = factory_cx_t100( sy ).
*      RAISE EXCEPTION lx_error.
    ENDIF.

    LOOP AT lt_text INTO ls_line.
      APPEND INITIAL LINE TO rt_text ASSIGNING <fv_line>.
      <fv_line> = ls_line-tdline.
    ENDLOOP.

  ENDMETHOD.                    "db_text_load



  METHOD db_text_save.

*
*    DATA:
*       lv_xdata TYPE xstring.
*
*    lv_xdata =  data_any_2_zipped_xml( i_any = i_any ).
*
*    DATA:
**      lo_new     TYPE ty_o_me,
*      lv_xstring TYPE xstring.
*
*
*
*    DATA:
**      lv_xstring      TYPE xstring,
*      ls_data         TYPE LINE OF ty_s_types-t_serial_data, "ZSTC_T_SERIALDAT,
*      lt_counter      TYPE STANDARD TABLE OF char3,
*      lv_i            TYPE i,
*      lv_counter      TYPE  char3,
*      lv_max          TYPE i,
*      lv_is_confirmed TYPE abap_bool,
*      lt_stringtab    TYPE stringtab,
*      lv_string       TYPE string.
*
**    lv_xstring =  so_help->so_base->data_any_2_zipped_xml( i_any = so_main ).
*
*
*    ls_data-data_data = lv_xdata.
*    MOVE-CORRESPONDING sy TO ls_data.
*    ls_data-repid = sy-repid.
*
*    SELECT counter
*      FROM (cs_const-name_t_serial) "ZSTC_T_SERIALDAT
*      INTO TABLE lt_counter.
*
*    LOOP AT lt_counter INTO lv_counter.
*      lv_i = lv_counter.
*
*      IF lv_i > lv_max.
*        lv_max = lv_i.
*      ENDIF.
*    ENDLOOP.
*    ADD 1 TO lv_max.
*    ls_data-counter = lv_max.
*
*    LOOP AT it_descr INTO lv_string.
*      IF sy-index > 1.
*        CONCATENATE ' / ' ls_data-descr INTO ls_data-descr RESPECTING BLANKS.
*      ENDIF.
*
*      CONCATENATE ls_data-descr lv_string INTO ls_data-descr.
*    ENDLOOP.
*
*    MODIFY (cs_const-name_t_serial) FROM ls_data. "ZSTC_T_SERIALDAT
*    COMMIT WORK AND WAIT.
*
*    rv_id = ls_data-counter.
*


  ENDMETHOD.                    "db_text_save


  METHOD db_text_update.

    DATA:
      lt_lines  TYPE STANDARD TABLE OF tline,
      ls_header TYPE  thead,
      ls_text   TYPE string.

    FIELD-SYMBOLS:
                   <ls_line> TYPE tline.

    """"""""""""""""""""""""""""""""""""""""""
    " Vorbereitung

    IF iv_langu IS SUPPLIED.
      ls_header-tdspras = iv_langu.
    ELSE.
      ls_header-tdspras = sy-langu.
    ENDIF.

    ls_header-tdobject = iv_object.
    ls_header-tdid     = iv_id.
    ls_header-tdname   = iv_name.

    LOOP AT it_text INTO ls_text.
      APPEND INITIAL LINE TO lt_lines ASSIGNING <ls_line>.
      <ls_line>-tdline = ls_text.
    ENDLOOP.


    """"""""""""""""""""""""""""""""""""""""""
    " Speichern

    CALL FUNCTION 'SAVE_TEXT'
      EXPORTING
        client   = sy-mandt
        header   = ls_header
      TABLES
        lines    = lt_lines
      EXCEPTIONS
        id       = 1
        language = 2
        name     = 3
        object   = 4
        OTHERS   = 5.
    IF sy-subrc <> 0.
*      DATA(lx_error) = factory_cx_t100( sy ).
*      RAISE EXCEPTION lx_error.
    ENDIF.

    CALL FUNCTION 'COMMIT_TEXT'
      EXPORTING
        id       = ls_header-tdid
        language = ls_header-tdspras
        name     = ls_header-tdname
        object   = ls_header-tdobject.

*        mo_help
    COMMIT WORK AND WAIT.
    mo_help->so_check_a_raise->sy_subrc_ne_null(  ).

  ENDMETHOD.                    "db_text_update

  METHOD number_get_next.

    DATA:
      lv_range  TYPE nrnr,
      lv_object TYPE nrobj.

    lv_range  = iv_range.
    lv_object = iv_object.

    TRY.

        CALL FUNCTION 'NUMBER_GET_NEXT'
          EXPORTING
            nr_range_nr             = lv_range
            object                  = lv_object
*           QUANTITY                = '1'
*           SUBOBJECT               = ' '
*           TOYEAR                  = '0000'
*           IGNORE_BUFFER           = ' '
          IMPORTING
            number                  = ev_number
*           QUANTITY                =
*           RETURNCODE              =
          EXCEPTIONS
            interval_not_found      = 1
            number_range_not_intern = 2
            object_not_found        = 3
            quantity_is_0           = 4
            quantity_is_not_1       = 5
            interval_overflow       = 6
            buffer_overflow         = 7
            error_message           = 8
            OTHERS                  = 9.
        mo_help->so_check_a_raise->after_function( is_sy = sy  ).

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        mo_help->so_error->raise_text(
        iv_text = 'Fehler bei Generierung neuer Nummer aus Range &1 u Objekt &2'
        iv_v1 = lv_range
        iv_v2 = lv_object
        io_previous = lx_root
        ).
        "Bitte Exportingparameter prüfen
    ENDTRY.

  ENDMETHOD.                    "number_get_next


  METHOD gos_save.


    DATA
        " Ordner
       : gs_folder   TYPE soodk

        " Verknüpfung: Quelle & Ziel
      , gs_object   TYPE sibflporb
      , gs_objtgt   TYPE sibflporb

        " Dokumenten-Grunddaten
      , gs_doc_info TYPE sofolenti1
      , gs_doc_data TYPE sodocchgi1
      , gd_doc_type TYPE soodk-objtp

        " Dokumenteninhalt binär
      , gt_contx2    TYPE solix_tab

        " Dateiinformationen
      , gd_file     TYPE string
      .

    DATA:
      p_instid TYPE sibfboriid VALUE '0010001554',
      p_typeid TYPE sibftypeid VALUE 'BUS2032'.


*
*
    " Root-Folder der GOS ermitteln
    CALL FUNCTION 'SO_FOLDER_ROOT_ID_GET'
      EXPORTING
        region    = 'B'
      IMPORTING
        folder_id = gs_folder.

    " Dateiinfo in Dokumenteninfo übernehmen
    " Dateiinfo in Dokumenteninfo übernehmen
    CALL FUNCTION 'CH_SPLIT_FILENAME'
      EXPORTING
        complete_filename = gd_file
      IMPORTING
        extension         = gd_doc_type
        name              = gs_doc_data-obj_descr
        name_with_ext     = gs_doc_data-obj_name.
    TRANSLATE gd_doc_type TO UPPER CASE.

*gs_doc_data-doc_size = gd_flen.
*gs_doc_data-obj_descr = 'Objektbeschreibungeibung'.
*gs_doc_data-obj_name =  'Name'.
*gd_doc_type = 'PDF'.

    " Dokument anlegen
    " Dokument anlegen
    CALL FUNCTION 'SO_DOCUMENT_INSERT_API1'
      EXPORTING
        folder_id                  = gs_folder
        document_data              = gs_doc_data
        document_type              = gd_doc_type
      IMPORTING
        document_info              = gs_doc_info
      TABLES
        contents_hex               = gt_contx2
      EXCEPTIONS
        folder_not_exist           = 1
        document_type_not_exist    = 2
        operation_no_authorization = 3
        parameter_error            = 4
        x_error                    = 5
        enqueue_error              = 6
        OTHERS                     = 7.
    IF sy-subrc <> 0.
      BREAK-POINT.
      MESSAGE 'PDF ins GOS speichern fehlgeschlagen' TYPE 'E'.
    ENDIF.

    " Businessobjekt-ID übernehmen
    gs_object-instid  = p_instid.  "p_instid.
    gs_object-typeid  = p_typeid.
    gs_object-catid   = 'BO'.

    " Dokumentdaten als Ziel
    CONCATENATE gs_folder gs_doc_info-object_id
       INTO gs_objtgt-instid RESPECTING BLANKS.

    " Alternative:
    " gs_objtgt-instid = gs_doc_info-doc_id.
    gs_objtgt-typeid  = 'MESSAGE'.
    gs_objtgt-catid   = 'BO'.

    TRY.
        " Verknüpfung anlegen
        cl_binary_relation=>create_link(
          EXPORTING
            is_object_a = gs_object
            is_object_b = gs_objtgt
            ip_reltype  = 'ATTA' ).
        COMMIT WORK AND WAIT.
      CATCH cx_obl_parameter_error cx_obl_model_error cx_obl_internal_error.
    ENDTRY.


  ENDMETHOD.                    "gos_save

  METHOD gos_load.

  ENDMETHOD.                    "gos_load


  METHOD idoc_send.

    DATA:
      ls_edidc       TYPE edidc,
      lt_edidc_contr TYPE STANDARD TABLE OF edidc,
      lt_edidd       TYPE STANDARD TABLE OF edidd.

*  ls_edidd-segnam = 'ZSRVSEG'.
*  ls_edidd-sdata  = ls_srvdata.

    TRY.

        APPEND is_edidd TO lt_edidd.

        CALL FUNCTION 'MASTER_IDOC_DISTRIBUTE'
          EXPORTING
            master_idoc_control            = is_edidc
          TABLES
            communication_idoc_control     = lt_edidc_contr
            master_idoc_data               = lt_edidd
          EXCEPTIONS
            error_in_idoc_control          = 1
            error_writing_idoc_status      = 2
            error_in_idoc_data             = 3
            sending_logical_system_unknown = 4
            error_message                  = 5
            OTHERS                         = 6.
        mo_help->so_check_a_raise->after_function( is_sy = sy ).

        LOOP AT lt_edidc_contr INTO ls_edidc.
          IF ls_edidc-outmod = '1' OR
             ls_edidc-outmod = '2'.
            CALL FUNCTION 'EDI_DOCUMENT_DEQUEUE_LATER'
              EXPORTING
                docnum                 = ls_edidc-docnum
              EXCEPTIONS
                idoc_is_not_to_dequeue = 1
                error_message          = 2
                OTHERS                 = 3.
            mo_help->so_check_a_raise->after_function( is_sy = sy ).
          ENDIF.                                            "n_724214
        ENDLOOP.

        IF iv_is_commit = abap_true.
          mo_help->so_service->db_commit( ).
        ENDIF.

        rv_docnum = ls_edidc-docnum.

        """""""""""""""""""""""""""""""""""
        " Fehlerbearbeitung

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        IF iv_is_commit = abap_true.
          mo_help->so_service->db_rollback( ).
        ENDIF.
        "D  EA  052 IDoc konnte nicht versandt werden
        mo_help->so_error->raise_msg( iv_id = 'EA' iv_no = '052' io_previous = lx_root ).
    ENDTRY.
  ENDMETHOD.                    "idoc_send


  METHOD bal_save_single.

    DATA:
      ls_bapi TYPE bapiret2.


    ls_bapi =  mo_help->so_txt->bapiret_get_by_all(
         iv_idno     = iv_idno
         iv_id       = iv_id
         iv_no       = iv_no
         iv_text     = iv_text
         iv_v1       = iv_v1
         iv_v2       = iv_v2
         iv_v3       = iv_v3
         iv_v4       = iv_v4  ).


    bal_save(
        iv_object    =  iv_object
        iv_subobject = iv_subobject
        iv_extnumber = iv_extnumber
        is_line      = ls_bapi
        iv_is_commit = iv_is_commit ).


  ENDMETHOD.

ENDCLASS.                    "lcl_help_service IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_help_data IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_data IMPLEMENTATION.

*  METHOD constructor.
*
*    CREATE OBJECT mo_help.
*
*  ENDMETHOD.                    "constructor

  METHOD sapgui_download.


    DATA
        " Ordner
       : gt_contx2    TYPE solix_tab

        " Dateiinformationen
      , gd_file     TYPE string
      , lt_files TYPE filetable
        , lv_retcode TYPE sy-subrc
*    p_file
      .



    FIELD-SYMBOLS:
    <lfs_file> TYPE LINE OF filetable.

    CALL METHOD cl_gui_frontend_services=>file_open_dialog
      EXPORTING
        default_extension = 'pdf'
        file_filter       = '.pdf'
      CHANGING
        file_table        = lt_files
        rc                = lv_retcode.


    READ TABLE lt_files INDEX 1 ASSIGNING <lfs_file>.
    gd_file = <lfs_file>-filename.

    CALL FUNCTION 'GUI_DOWNLOAD'
      EXPORTING
*       BIN_FILESIZE                    =
        filename = gd_file
*       FILETYPE = 'ASC'
*       APPEND   = ' '
*       WRITE_FIELD_SEPARATOR           = ' '
*       HEADER   = '00'
*       TRUNC_TRAILING_BLANKS           = ' '
*       WRITE_LF = 'X'
*       COL_SELECT                      = ' '
*       COL_SELECT_MASK                 = ' '
*       DAT_MODE = ' '
*       CONFIRM_OVERWRITE               = ' '
*       NO_AUTH_CHECK                   = ' '
*       CODEPAGE = ' '
*       IGNORE_CERR                     = ABAP_TRUE
*       REPLACEMENT                     = '#'
*       WRITE_BOM                       = ' '
*       TRUNC_TRAILING_BLANKS_EOL       = 'X'
*       WK1_N_FORMAT                    = ' '
*       WK1_N_SIZE                      = ' '
*       WK1_T_FORMAT                    = ' '
*       WK1_T_SIZE                      = ' '
*       WRITE_LF_AFTER_LAST_LINE        = ABAP_TRUE
*       SHOW_TRANSFER_STATUS            = ABAP_TRUE
* IMPORTING
*       FILELENGTH                      =
      TABLES
        data_tab = gt_contx2
*       FIELDNAMES                      =
* EXCEPTIONS
*       FILE_WRITE_ERROR                = 1
*       NO_BATCH = 2
*       GUI_REFUSE_FILETRANSFER         = 3
*       INVALID_TYPE                    = 4
*       NO_AUTHORITY                    = 5
*       UNKNOWN_ERROR                   = 6
*       HEADER_NOT_ALLOWED              = 7
*       SEPARATOR_NOT_ALLOWED           = 8
*       FILESIZE_NOT_ALLOWED            = 9
*       HEADER_TOO_LONG                 = 10
*       DP_ERROR_CREATE                 = 11
*       DP_ERROR_SEND                   = 12
*       DP_ERROR_WRITE                  = 13
*       UNKNOWN_DP_ERROR                = 14
*       ACCESS_DENIED                   = 15
*       DP_OUT_OF_MEMORY                = 16
*       DISK_FULL                       = 17
*       DP_TIMEOUT                      = 18
*       FILE_NOT_FOUND                  = 19
*       DATAPROVIDER_EXCEPTION          = 20
*       CONTROL_FLUSH_ERROR             = 21
*       OTHERS   = 22
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.



  ENDMETHOD.                    "sapgui_download

  METHOD http_request.


    DATA:
      lv_host TYPE string,
      lv_uri  TYPE string.

    BREAK-POINT.

*    lv_host = 'http://eloquentjavascript.net'.
    lv_host = 'https://raw.githubusercontent.com'.
*    lv_uri = '/author'.
    lv_uri = '/lars-code/abap/master/zin_salv_help'.


* Method-Local Data Declarations:
    DATA: lo_http_client TYPE REF TO if_http_client.

** Create an instance of the HTTP client:
*    CALL METHOD cl_http_client=>create
*      EXPORTING
*        host               = lv_host
*      IMPORTING
*        client             = lo_http_client
*      EXCEPTIONS
*        argument_not_found = 1
*        plugin_not_active  = 2
*        internal_error     = 3
*        OTHERS             = 4.
*    IF sy-subrc NE 0.
**      RAISE EXCEPTION TYPE lcx_icf_exception.
*    ENDIF.
    cl_http_client=>create_by_url(
      EXPORTING
        url                =  lv_host   " URL
*    proxy_host         =     " Logical Destination (Specified in Function Call)
*    proxy_service      =     " Port Number
*    ssl_id             =     " SSL Identity
*    sap_username       =     " ABAP System, User Logon Name
*    sap_client         =     " R/3 System, Client Number from Logon
      IMPORTING
        client             =  lo_http_client   " HTTP Client Abstraction
      EXCEPTIONS
        argument_not_found = 1
        plugin_not_active  = 2
        internal_error     = 3
        OTHERS             = 4
    ).
    IF sy-subrc <> 0.
* MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.

* Select the HTTP GET method:


* Build and configure the request URI:
*    lv_uri =
*    build_uri( im_street = im_street
*    im_city = im_city
*    im_state = im_state
*    im_zip = im_zip ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    lo_http_client->request->set_method(
    if_http_request=>co_request_method_get ).

    lo_http_client->authenticate( username = ''
                           password = '' ).

    lo_http_client->propertytype_logon_popup =  lo_http_client->co_enabled.

    lo_http_client->request->set_version( version = if_http_request=>co_protocol_version_1_0 ).


    lo_http_client->request->set_header_field( name  = '~request_method'
                                        value = 'GET' ).

    lo_http_client->request->set_header_field( name  = 'Content-Type'
                                         value = 'text/xml; charset=utf-8' ).

    lo_http_client->request->set_header_field( name  = 'Accept'
                                        value = 'text/xml, text/html' ).



    cl_http_utility=>set_request_uri(
    request = lo_http_client->request
    uri = lv_uri ).

* Submit the request:
    CALL METHOD lo_http_client->send
      EXCEPTIONS
        http_communication_failure = 1
        http_invalid_state         = 2
        http_processing_failed     = 3
        http_invalid_timeout       = 4
        OTHERS                     = 5.
    IF sy-subrc NE 0.
*      RAISE EXCEPTION TYPE lcx_icf_exception.
    ENDIF.

* Receive the results:
    CALL METHOD lo_http_client->receive
      EXCEPTIONS
        http_communication_failure = 1
        http_invalid_state         = 2
        http_processing_failed     = 3
        OTHERS                     = 4.
    DATA: lv_http_rc TYPE i, lv_reason TYPE string.
    lo_http_client->response->get_status( IMPORTING
                                          code   = lv_http_rc
                                          reason = lv_reason ).

    IF lv_http_rc = 200.
      DATA lv_xml TYPE string.
      lv_xml = lo_http_client->response->get_cdata( ).

      cl_abap_browser=>show_xml( xml_string = lv_xml
                                 title      = 'XML-Daten'
                                 size       = cl_abap_browser=>large ).
    ELSE.
      mo_help->so_error->raise_text(  iv_text = 'Fehlercode &1 : &2'
             iv_v1 = lv_http_rc iv_v2 = lv_reason ).
*    data lv_error type char200.
*      WRITE: / 'Fehler: ', lv_http_rc to lv_error.
    ENDIF.



    lo_http_client->close( ).


    rv_result = lv_xml.

  ENDMETHOD.

  METHOD sapgui_upload.

    DATA
        " Ordner
       : gt_contx    TYPE solix_tab
      , gd_file     TYPE string
      , gd_flen     TYPE i
         , lt_files TYPE filetable
        , lv_retcode TYPE sy-subrc
*    p_file
      .



    FIELD-SYMBOLS:
    <lfs_file> TYPE LINE OF filetable.


    CALL METHOD cl_gui_frontend_services=>file_open_dialog
      EXPORTING
        default_extension = 'pdf'
        file_filter       = '.pdf'
      CHANGING
        file_table        = lt_files
        rc                = lv_retcode.


    READ TABLE lt_files INDEX 1 ASSIGNING <lfs_file>.
    gd_file = <lfs_file>-filename.


    CALL FUNCTION 'GUI_UPLOAD'
      EXPORTING
        filename   = gd_file
        filetype   = 'BIN'
      IMPORTING
        filelength = gd_flen
      TABLES
        data_tab   = gt_contx
      EXCEPTIONS
        OTHERS     = 1.


  ENDMETHOD.                    "sapgui_upload

  METHOD appli_data_create.

    DATA: h_file   TYPE c LENGTH 60,
          lv_contx TYPE LINE OF solix_tab.

    DATA:
         gt_contx    TYPE solix_tab.

    CONCATENATE '\\wvtrans01\B2BSUPPLP\APQP\import\Test1' sy-uzeit '.pdf' INTO h_file.
*    CONCATENATE '/Bestellungen/BIN_' l_doc-xekko-ebeln '.PDF' INTO h_file.

    OPEN DATASET h_file FOR OUTPUT IN BINARY MODE.
    CHECK sy-subrc EQ 0.
*    TRANSFER l_pdf_xstring  TO h_file.
    LOOP AT gt_contx INTO lv_contx.
      TRANSFER lv_contx TO h_file.
    ENDLOOP.

    CLOSE DATASET h_file.

  ENDMETHOD.                    "appli_data_create

  METHOD appli_data_update.

  ENDMETHOD.                    "appli_data_update

  METHOD appli_data_delete.

  ENDMETHOD.                    "appli_data_delete

  METHOD db_serial_save.

    DATA:
      lv_string TYPE string,
      lx_root   TYPE REF TO cx_root,
      lv_descr  TYPE string,
      lv_descr2 TYPE string.


    DATA:
      ls_serial2 TYPE REF TO data,
      lv_id      TYPE c LENGTH 10.


    FIELD-SYMBOLS:
      <ls_line>    TYPE any,
      <lv_datum>   TYPE datum,
      <lv_repid>   TYPE repid,
      <lv_id>      LIKE lv_id,
      <lv_uname>   TYPE uname,
      <lv_data>    TYPE string,
      <lv_time>    TYPE any,
      <lv_tcode>   TYPE tcode,
      <lv_handle>  TYPE char10,
      <lv_handle2> TYPE char10,
      <lv_handle3> TYPE char10,
      <lv_class>   TYPE char120, "har60,
      <lv_descr>   TYPE char200.

    TRY.

        CREATE DATA ls_serial2
            TYPE  (cs_const-name_serialtab).

        ASSIGN ls_serial2->('ID') TO <lv_id>.
        IF  <lv_id> IS NOT ASSIGNED.
          mo_help->so_error->raise_text(
            'Eintrag mit neuer ID Key konnte nicht erstellt werden' ).
        ENDIF.

        SELECT SINGLE MAX( id )
            FROM  (cs_const-name_serialtab)
        INTO <lv_id>.
        ADD 1 TO <lv_id>.


        ASSIGN ls_serial2->('DATUM') TO <lv_datum>.
        IF  <lv_datum> IS ASSIGNED.
          <lv_datum> =  sy-datum.
        ENDIF.

        ASSIGN ls_serial2->('TIME') TO <lv_time>.
        IF  <lv_time> IS ASSIGNED.
          <lv_time> =  sy-uzeit.
        ENDIF.

        ASSIGN ls_serial2->('REPID') TO <lv_repid>.
        IF <lv_repid> IS ASSIGNED.
          <lv_repid> =  sy-repid.
        ENDIF.

        ASSIGN ls_serial2->('UNAME') TO <lv_uname>.
        IF <lv_uname> IS ASSIGNED.
          <lv_uname> =  sy-uname.
        ENDIF.

        ASSIGN ls_serial2->('TCODE') TO <lv_tcode>.
        IF <lv_tcode> IS ASSIGNED.
          <lv_tcode> =  sy-tcode.
        ENDIF.

        ASSIGN ls_serial2->('HANDLE1') TO <lv_handle>.
        IF <lv_handle> IS ASSIGNED.
          <lv_handle> =  iv_handle.
        ENDIF.

        ASSIGN ls_serial2->('HANDLE2') TO <lv_handle2>.
        IF <lv_handle2> IS ASSIGNED.
          <lv_handle2> =  iv_handle2.
        ENDIF.

        ASSIGN ls_serial2->('HANDLE3') TO <lv_handle3>.
        IF <lv_handle3> IS ASSIGNED.
          <lv_handle3> =  iv_handle3.
        ENDIF.

        FREE lv_string.
        lv_string = trans_any_2_xml_zip( if_serializable ).
        ASSIGN ls_serial2->('DATA') TO <lv_data>.
        IF <lv_data> IS ASSIGNED.
          <lv_data> =  lv_string.
        ENDIF.

        FREE lv_string.
        mo_help->so_abap->rtts_get_info_class(
               EXPORTING io_object =  if_serializable
               IMPORTING ev_classname = lv_string ).

        ASSIGN ls_serial2->('CLASSNAME') TO <lv_class>.
        IF <lv_class> IS ASSIGNED.
          <lv_class> =  lv_string.
        ENDIF.


*        ASSIGN ls_serial2->* TO <ls_line>.
*        MODIFY (cs_const-name_serialtab) FROM <ls_line>. "ls_serial2.


        TRY.
            FREE lv_string.
            lx_root ?= if_serializable.

            WHILE lx_root IS BOUND.
              lv_descr = lx_root->get_text(  ).
              CONCATENATE lv_descr2 ' -> ' lv_descr INTO  lv_descr2 RESPECTING BLANKS. "= lx_root->get_text(  ).

              lx_root = lx_root->previous.
            ENDWHILE.
            SHIFT lv_descr2 LEFT DELETING LEADING ' '.
            SHIFT lv_descr2 LEFT DELETING LEADING '->'.
            SHIFT lv_descr2 LEFT DELETING LEADING ' '.

*            ASSIGN ls_serial2->('DATA') TO <lv_data>.
*            ls_serial-descr = lv_descr2.

            ASSIGN ls_serial2->('DESCR') TO <lv_descr>.
            IF <lv_descr> IS ASSIGNED.
              <lv_descr> =  lv_descr2.
            ENDIF.
          CATCH cx_root.
        ENDTRY.

        ASSIGN ls_serial2->* TO <ls_line>.
        MODIFY (cs_const-name_serialtab) FROM <ls_line>. "ls_serial2.

        rv_id = <lv_id>.

        IF iv_is_commit = abap_true.
          COMMIT WORK AND WAIT.
          mo_help->so_check_a_raise->after_commit( sy ).
        ENDIF.

      CATCH cx_root.
        IF iv_is_commit = abap_true.
          ROLLBACK WORK.
        ENDIF.
        mo_help->so_error->raise_text(  iv_text = 'Fehler beim Speichern der serialisierten Daten').
    ENDTRY.

  ENDMETHOD.                    "db_serial_save

  METHOD db_serial_load.

    DATA:
      lv_string TYPE string,
      lv_id     TYPE i.
*      ls_serial  TYPE ty_s_types_ext-s_serialtab.
*
*    lv_id = mo_help->so_abap->conv_get_int( iv_id  ).
*          CATCH cx_t100_msg.  " iv_id.

    SELECT SINGLE data
      FROM (cs_const-name_serialtab)
      INTO lv_string
      WHERE id = iv_id.
    mo_help->so_check_a_raise->after_select(  ).

    trans_xml_zip_2_any(
      EXPORTING
        iv_string  = lv_string
      IMPORTING
        e_any       = ei_serial
    ).

  ENDMETHOD.                    "db_serial_load


  METHOD trans_any_2_xml_zip.

    DATA:
      lv_data   TYPE string,
      lv_result TYPE xstring.

    lv_data = trans_any_2_xml( i_any ).

    "Zippen um Datenmenge die zum Remotebaustein geschickt wird zu verkleinern
    trans_clike_2_zip(
    EXPORTING
    iv_string  = lv_data
    IMPORTING
    ev_xstring = lv_result ).

    rv_result = lv_result.

  ENDMETHOD.                    "data_any_2_zipped_xml


  METHOD trans_any_2_xml.


    DATA:
     lx_root TYPE REF TO cx_root.

    TRY.
        CALL TRANSFORMATION id
        OPTIONS data_refs = 'heap-or-create'
        SOURCE test =  iv_data_type
        RESULT XML rv_data_xml.

      CATCH cx_root INTO lx_root.
        mo_help->so_error->raise_text(  'Fehler bei der Deserialisierung. Objekt kann nicht erzeugt werden' ).
    ENDTRY.


  ENDMETHOD.                    "data_transform_2_xml


  METHOD trans_xml_2_any.


    DATA:
            lx_root TYPE REF TO cx_root.

    TRY.
        CALL TRANSFORMATION id
        SOURCE XML iv_data_xml
        RESULT test = ev_data_type.

      CATCH cx_root INTO lx_root.
        mo_help->so_error->raise_text(  'Fehler bei der Deserialisierung. Objekt kann nicht erzeugt werden' ).
    ENDTRY.


  ENDMETHOD.                    "data_transform_from_xml


  METHOD trans_zip_2_string.

    DATA:
      lx_root    TYPE REF TO cx_root,
      lv_xstring TYPE xstring.

    lv_xstring = iv_xstring.

    TRY.
        cl_abap_gzip=>decompress_text(
        EXPORTING
        gzip_in                    = lv_xstring    " Eingabe der gezippten Daten
        IMPORTING
        text_out                   = ev_string ). " Dekomprimierte Ausgabe

      CATCH cx_root INTO lx_root.
        mo_help->so_error->raise_text(  iv_text = 'Fehler beim unzippen der Daten' io_previous = lx_root ).
    ENDTRY.

  ENDMETHOD.                    "data_unzip


  METHOD trans_clike_2_zip.


    DATA:
      lx_root TYPE REF TO cx_root.

    TRY.
        cl_abap_gzip=>compress_text(
        EXPORTING text_in  = iv_string
        IMPORTING gzip_out = ev_xstring ).

      CATCH cx_root INTO lx_root.
        mo_help->so_error->raise_text(  iv_text = 'Fehler beim unzippen der Datenn' io_previous = lx_root ).
    ENDTRY.


  ENDMETHOD.                    "data_zip


  METHOD trans_xml_zip_2_any.


    DATA:
      lv_data    TYPE string.
*      lv_xstring TYPE xstring.

*    lv_xstring = iv_string.

    lv_data = trans_zip_2_string( iv_string ).

    trans_xml_2_any(
    EXPORTING
    iv_data_xml  = lv_data
    IMPORTING
    ev_data_type = e_any ).


  ENDMETHOD.                    "data_zipped_xml_2_any

  METHOD trans_ode_2_pdf.

    DATA:
      lt_otf          TYPE STANDARD TABLE OF itcoo,
      ls_otf          TYPE itcoo,
      lv_transfer_bin TYPE sx_boolean,
      lt_objhead      TYPE soli_tab,
      lv_len          TYPE  so_obj_len.

    DATA:
      lt_content_txt TYPE  soli_tab,
      ls_content_txt TYPE LINE OF soli_tab,
      lt_pdf         TYPE solix_tab.

    LOOP AT lt_otf INTO ls_otf.

      CONCATENATE ls_otf-tdprintcom ls_otf-tdprintpar INTO ls_content_txt.
      APPEND ls_content_txt TO lt_content_txt.

    ENDLOOP.

    CALL FUNCTION 'SX_OBJECT_CONVERT_OTF_PDF'
      EXPORTING
        format_src      = 'OTF' "lc_otf
        format_dst      = 'PDF' "lc_pdf
        devtype         = 'PRINTER' "lc_printer
      CHANGING
        transfer_bin    = lv_transfer_bin "lv_trans_bin
        content_txt     = lt_content_txt
        content_bin     = lt_pdf
        objhead         = lt_objhead
        len             = lv_len
      EXCEPTIONS
        err_conv_failed = 1
        OTHERS          = 2.


  ENDMETHOD.                    "trans_ode_2_pdf

  METHOD appli_data_read.

    DATA:
      lv_size  TYPE i,
      lv_tabix TYPE sytabix,
      ls_solix TYPE solix.

    DATA: h_file TYPE c LENGTH 60 VALUE '\\wvtrans01\B2BSUPPLP\APQP\import\Test1'.

    DATA:
              gt_contx2    TYPE solix_tab.

    OPEN DATASET h_file FOR INPUT IN BINARY MODE.

    IF sy-subrc = 0.

      DO .
        READ DATASET h_file INTO  ls_solix LENGTH lv_size.
*    ls_Solix = ls_line.
        APPEND ls_solix TO gt_contx2.
        IF lv_size > 0.
          lv_tabix = lv_tabix + 1.
        ELSE.
          EXIT.
        ENDIF.
      ENDDO.
    ENDIF.

    CLOSE DATASET h_file.

  ENDMETHOD.                    "appli_data_read

  METHOD db_serial_delete.
    TRY.

        DATA: lv_id TYPE i.

        lv_id = iv_id.

        DELETE FROM (cs_const-name_serialtab) WHERE id = lv_id. "FROM ls_serial. "ZSTC_T_SERIALDAT
        IF iv_is_commit = abap_true.
          COMMIT WORK AND WAIT.
          mo_help->so_check_a_raise->after_commit( sy ).
        ENDIF.

      CATCH cx_root.
        ROLLBACK WORK.
        mo_help->so_error->raise_text(  iv_text = 'Fehler beim Speichern der serialisierten Daten').
    ENDTRY.
  ENDMETHOD.                    "db_serial_delete

ENDCLASS.                    "lcl_help_data IMPLEMENTATION


*----------------------------------------------------------------------*
*       CLASS lcl_help_bl DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_bl DEFINITION INHERITING FROM lcl_help_base.

  PUBLIC SECTION.

    METHODS:



      set_status
        IMPORTING
          iv_objnr       TYPE clike
          iv_obtyp       TYPE clike
          iv_status      TYPE clike
          iv_is_activate TYPE abap_bool DEFAULT abap_true
          iv_is_commit   TYPE abap_bool DEFAULT abap_false
        EXPORTING
          et_log         TYPE bapiret2_tab
        RAISING
          cx_t100_msg,

      get_user_info
        IMPORTING
                  iv_uname         TYPE sy-uname DEFAULT sy-uname
        RETURNING
                  VALUE(rs_result) TYPE szadr_addr3_complete
        RAISING   cx_t100_msg,

      get_warenempf_by_kunnr
        IMPORTING
          iv_kunnr         TYPE kunnr
        RETURNING
          VALUE(rv_result) TYPE string,





      get_meins
        IMPORTING
          iv_matnr        TYPE clike
          iv_werks        TYPE clike OPTIONAL
        RETURNING
          VALUE(rv_meins) TYPE meins
        RAISING
          cx_t100_msg,

      get_maktx
        IMPORTING
          iv_matnr         TYPE clike
          iv_langu         TYPE sy-langu DEFAULT sy-langu
        RETURNING
          VALUE(rv_result) TYPE string
        RAISING
          cx_t100_msg,

      hu_create
        IMPORTING
          is_plaf          TYPE plaf
          iv_vhilm         TYPE vhilm
        RETURNING
          VALUE(rv_result) TYPE string
        RAISING
          cx_t100_msg,

      hu_change_matnr_menge
        IMPORTING
          iv_exidv    TYPE clike
          iv_matnr    TYPE matnr
          iv_quantity TYPE bdmng
          iv_meins    TYPE meins
          iv_werks    TYPE werks_d
          iv_lgort    TYPE lgort_d
        RAISING
          cx_t100_msg,

      hu_print_label
        IMPORTING
          iv_venum TYPE clike
        RAISING
          cx_t100_msg,

      hu_get_exidv_by_venum
        IMPORTING
          iv_venum         TYPE clike
        RETURNING
          VALUE(rv_result) TYPE exidv
        RAISING
          cx_t100_msg,

      hu_get_venum_by_exidv
        IMPORTING
          iv_exidv         TYPE clike
        RETURNING
          VALUE(rv_result) TYPE venum
        RAISING
          cx_t100_msg,




      likp_create_by_vbak
        IMPORTING
          iv_vbeln         TYPE clike
          iv_is_commit     TYPE abap_bool DEFAULT abap_false
        EXPORTING
          VALUE(rv_result) TYPE vbeln
          rt_log           TYPE bapiret2_tab
        RAISING
          cx_t100_msg,

      likp_get_warenempf
        IMPORTING
          iv_kunnr         TYPE kunnr
        RETURNING
          VALUE(rv_result) TYPE string,

      likp_set_goods_movement
        IMPORTING
          iv_vbeln     TYPE clike
          iv_is_commit TYPE abap_bool DEFAULT abap_false
        EXPORTING
          et_log       TYPE bapiret2_tab
        RAISING
          cx_t100_msg,

      likp_get_partner
        IMPORTING
          iv_vbeln       TYPE clike
          iv_parvw       TYPE clike
        RETURNING
          VALUE(rs_vbpa) TYPE vbpa
        RAISING
          cx_t100_msg,






      qmfe_add
        IMPORTING
          !iv_qmnum      TYPE clike
          !iv_error_code TYPE clike
          !iv_sernr      TYPE clike
          !iv_is_commit  TYPE abap_bool DEFAULT abap_false
        EXPORTING
          !et_log        TYPE bapiret2_tab
        RAISING
          cx_t100_msg,

      qmfe_change
        IMPORTING
          iv_qmnum      TYPE clike
          iv_posnr      TYPE clike
          iv_error_code TYPE clike
          iv_sernr      TYPE clike
          iv_is_commit  TYPE abap_bool DEFAULT abap_false
        EXPORTING
          et_log        TYPE bapiret2_tab
        RAISING
          cx_t100_msg,

      qmel_get_status
        IMPORTING
          iv_qmnum         TYPE clike
        RETURNING
          VALUE(rt_result) TYPE stringtab
        RAISING
          cx_t100_msg,

      qmel_get_partner
        IMPORTING
          iv_qmnum       TYPE clike
          iv_parvw       TYPE clike
        RETURNING
          VALUE(rs_ihpa) TYPE ihpa
        RAISING
          cx_t100_msg,

      vbap_add_sernr
        IMPORTING
          iv_vbeln     TYPE clike
          iv_posnr     TYPE clike
          iv_sernr     TYPE clike     OPTIONAL
          it_sernr     TYPE stringtab OPTIONAL
          iv_is_commit TYPE abap_bool DEFAULT abap_false
        RAISING
          cx_t100_msg,

      vttk_set_status
        IMPORTING
          iv_tknum  TYPE clike
          iv_status TYPE clike
        RAISING
          cx_t100_msg,

      ltap_set_squit
        IMPORTING
          iv_lgnum     TYPE clike
          iv_tanum     TYPE clike
          iv_tapos     TYPE clike
          iv_is_commit TYPE abap_bool DEFAULT abap_false
        RAISING
          cx_t100_msg,

      ltap_is_storno
        IMPORTING
          iv_lgnum         TYPE clike
          iv_tanum         TYPE clike
          iv_tapos         TYPE clike
        RETURNING
          VALUE(rv_result) TYPE abap_bool
        RAISING
          cx_t100_msg.

  PROTECTED SECTION.

    TYPES:
  BEGIN OF ty_s_name.
    TYPES:
      kunnr TYPE kunnr,
      name1 TYPE name1,
      land1 TYPE land1,
      END OF ty_s_name.

    CLASS-DATA:
      st_land1_name1 TYPE HASHED TABLE OF ty_s_name WITH UNIQUE KEY kunnr,
      st_matnr_meins TYPE HASHED TABLE OF mara WITH UNIQUE KEY matnr.

    CLASS-DATA:
      st_makt        TYPE HASHED TABLE OF makt WITH UNIQUE KEY matnr spras,
      st_exidv_venum TYPE SORTED TABLE OF vekp WITH UNIQUE KEY exidv.

    METHODS:
      sd_init_packing
        RAISING
          cx_t100_msg.


ENDCLASS.                    "lcl_help_bl DEFINITION


*----------------------------------------------------------------------*
*       CLASS lcl_help_bl IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_bl IMPLEMENTATION.


  METHOD get_maktx.

    DATA:
      ls_makt  TYPE makt,
      lv_matnr TYPE matnr.

    mo_help->so_abap->conv_conversion_exit(
      EXPORTING iv_value     =  iv_matnr
      IMPORTING  ev_value     = lv_matnr
    ).

    READ TABLE st_makt INTO ls_makt
      WITH KEY matnr = lv_matnr spras = iv_langu.

    IF sy-subrc <> 0.

      SELECT SINGLE *
          FROM makt
        INTO CORRESPONDING FIELDS OF ls_makt
        WHERE matnr = lv_matnr
        AND spras = iv_langu.
      mo_help->so_check_a_raise->after_select( ).

      INSERT ls_makt INTO TABLE st_makt.

    ENDIF.

    rv_result = ls_makt-maktx.

  ENDMETHOD.                    "bl_get_maktx

  METHOD get_meins.

    DATA:
      lv_matnr       TYPE matnr,
      ls_matnr_meins TYPE mara,
      lv_meins       TYPE meins.

    lv_matnr = mo_help->so_abap->conv_exit( iv_val = iv_matnr iv_name = 'MATNR' ).

    IF iv_werks IS INITIAL.

      READ TABLE st_matnr_meins INTO ls_matnr_meins
          WITH KEY matnr = lv_matnr.
      IF sy-subrc = 0.
        rv_meins = ls_matnr_meins-meins.
        RETURN.
      ENDIF.

      SELECT SINGLE meins
          FROM mara
          INTO lv_meins
          WHERE matnr = lv_matnr.
      IF sy-subrc = 0.
        ls_matnr_meins-matnr = lv_matnr.
        ls_matnr_meins-meins = lv_meins.
        INSERT ls_matnr_meins INTO TABLE st_matnr_meins.
        rv_meins = lv_meins.
        RETURN.
      ENDIF.

      "DE  VH  502 Mengeneinheit & nicht vorhanden
      mo_help->so_error->raise_idno( 'VH(502)' ).


    ELSE.




      "gleiche mit werk





    ENDIF.

  ENDMETHOD.

  METHOD qmfe_change.


    DATA:
      lv_qmnum  TYPE qmnum,
*      lt_return TYPE STANDARD TABLE OF bapiret2,
*      ls_header   TYPE bapi2078_nothdri,
*      ls_header_x TYPE bapi2078_nothdri_x,
      lt_item   TYPE STANDARD TABLE OF bapi2078_notitemi,
      lt_item_x TYPE STANDARD TABLE OF bapi2078_notitemi_x.

    FIELD-SYMBOLS:
      <ls_item>   TYPE bapi2078_notitemi,
      <ls_item_x> TYPE bapi2078_notitemi_x.

    TRY.

        lv_qmnum = mo_help->so_abap->conv_exit( iv_val = iv_qmnum       iv_name = 'QMNUM' ).


        SELECT SINGLE qmnum
        FROM qmel
        INTO lv_qmnum
        WHERE qmnum = lv_qmnum.
        "DE QST 053 Qualitätsmeldung zur Meldungsnummer & nicht gefunden
        mo_help->so_check_a_raise->after_select( iv_id = 'QST' iv_no = 053 i_where1 = lv_qmnum ).

**        ls_header-code   = lv_code.
*        ls_header_x-code = lv_code.


        APPEND INITIAL LINE TO lt_item ASSIGNING <ls_item>.
        APPEND INITIAL LINE TO lt_item_x ASSIGNING <ls_item_x>.

*        <ls_item>-single_unit_nr   = iv_sernr. "iv_error_code.
*        <ls_item>-single_unit_nr   =  so_help->so_abap->conv_exit( <ls_item>-single_unit_nr ).

        <ls_item>-item_key   = iv_posnr.
        <ls_item>-item_key  = mo_help->so_abap->conv_exit( <ls_item>-item_key  ).

*        <ls_item_x>-single_unit_nr = abap_true.
        <ls_item_x>-item_key  = <ls_item>-item_key.

        <ls_item>-d_code = iv_error_code.
        <ls_item>-d_code =  mo_help->so_abap->conv_exit( <ls_item>-d_code ).
        <ls_item_x>-d_code = abap_true.


        CALL FUNCTION 'BAPI_QUALNOT_MODIFY_DATA'
          EXPORTING
            number        = lv_qmnum  " Message Number
**            notifheader   = ls_header    " BAPI Quality Notification Header for Creation
*           notifheader_x = ls_header_x    " Indicator for Notification Header
*      IMPORTING
*           notifheader_export =     " BAPI Quality Notification Header
          TABLES
            notifitem     = lt_item    " Notification Item for Creation
            notifitem_x   = lt_item_x    " Change Indicator for Notification Item
*           notifcaus     =     " Notification Cause for Creation
*           notifcaus_x   =     " Change Indicator for Notification Cause
*           notifactv     =     " Notification Activities for Creation
*           notifactv_x   =     " Change Indicator for Activities
*           notiftask     =     " Notification Task for Creation
*           notiftask_x   =     " Change Indicator for Notification Task
*           notifpartnr   =     " Partner(s) for Creation
*           notifpartnr_x =     " Change Indicator Partner
            return        = et_log   " Return Parameter(s)
*           notfulltxt    =     " Notification Long Text
          EXCEPTIONS
            error_message = 1
            OTHERS        = 2.
        mo_help->so_check_a_raise->after_function( i_any1 = et_log is_sy = sy ).


        CALL FUNCTION 'BAPI_QUALNOT_SAVE'
          EXPORTING
            number        = lv_qmnum
*         IMPORTING
*           NOTIFHEADER   =
          TABLES
            return        = et_log
          EXCEPTIONS
            error_message = 1
            OTHERS        = 2.
        mo_help->so_check_a_raise->after_function( i_any1 = et_log is_sy = sy ).


        IF iv_is_commit = abap_true.
          mo_help->so_service->db_commit_a_wait(  ).
        ENDIF.


        """""""""""""""""""""""""""""""""""""""""""""
        " Fehlerbehandlung

        DATA: lx_t100 TYPE REF TO cx_t100_msg.
      CATCH cx_t100_msg INTO lx_t100.
        IF iv_is_commit = abap_true.
          mo_help->so_service->db_rollback(  ).
        ENDIF.
        "D  1F  028  Änderungen wurden nicht gesichert
        mo_help->so_error->raise_idno( iv_idno = '1F(028)' io_previous = lx_t100 ).

    ENDTRY.

  ENDMETHOD.                    "change_qmel_pos


  METHOD set_status.

    DATA:
      lv_objnr  TYPE jsto-objnr,
      lv_status TYPE tj30t-txt04,
      lv_inact  TYPE char1,
      lv_obtyp  TYPE j_obtyp,
      lv_stsma  TYPE j_stsma,
      lv_estat  TYPE j_estat.

    TRY.

        IF iv_is_activate = abap_true.
          lv_inact = ' '.
        ELSE.
          lv_inact = 'X'.
        ENDIF.

        lv_objnr = iv_objnr.
        lv_status = iv_status.

        lv_objnr = mo_help->so_abap->conv_exit( lv_objnr ).
        lv_status = mo_help->so_abap->conv_exit( lv_status ).

        lv_obtyp = iv_obtyp.
        lv_obtyp = mo_help->so_abap->conv_exit( lv_obtyp ).

        SELECT SINGLE stsma
          FROM jsto
          INTO lv_stsma
          WHERE
            objnr = lv_objnr
          AND obtyp = lv_obtyp.
        mo_help->so_check_a_raise->after_select( ).


        SELECT SINGLE estat
          FROM tj30t
          INTO lv_estat
          WHERE stsma = lv_stsma
          AND   txt04 = lv_status.
        mo_help->so_check_a_raise->after_select( ).


        CALL FUNCTION 'STATUS_CHANGE_EXTERN'
          EXPORTING
*           check_only          = ' '    " Check Permissibility Only
*           client              = SY-MANDT    " Client (Only for Exceptional Cases!)
            objnr               = lv_objnr    " Object Number of Status Object
            user_status         = lv_estat    " User Status to be Set in Internal Format
            set_inact           = lv_inact    " 'Deactivate Status' Flag
*           set_chgkz           =     " 'Activate Change Documents' Flag
*           no_check            = ' '    " Checkbox Field
*      IMPORTING
*           stonr               =     " Status Number
          EXCEPTIONS
            object_not_found    = 1
            status_inconsistent = 2
            status_not_allowed  = 3
            error_message       = 4
            OTHERS              = 5.
        mo_help->so_check_a_raise->after_function( is_sy = sy ).

        IF iv_is_commit = abap_true.
          mo_help->so_service->db_commit_a_wait(  ).
        ENDIF.


        """""""""""""""""""""""""""""""""""""""""""""
        " Fehlerbehandlung

        DATA: lx_t100 TYPE REF TO cx_t100_msg.
      CATCH cx_t100_msg INTO lx_t100.
        IF iv_is_commit = abap_true.
          mo_help->so_service->db_rollback(  ).
        ENDIF.
        "D   0U  507 Statuswechsel nicht möglich
        mo_help->so_error->raise_msg(  iv_id = '0U' iv_no = 507  ).

    ENDTRY.

  ENDMETHOD.                    "status_set

  METHOD qmfe_add.

    DATA:
      lv_qmnum TYPE qmnum,
      lv_sernr TYPE gernr,
*      ls_header   TYPE bapi2078_nothdri,
*      ls_header_x TYPE bapi2078_nothdri_x,
      lt_item  TYPE STANDARD TABLE OF bapi2078_notitemi,
      lv_fenum TYPE fenum.
*      lt_item_x TYPE STANDARD TABLE OF bapi2078_notitemi_x.

    FIELD-SYMBOLS:
      <ls_item>   TYPE bapi2078_notitemi.

    TRY.

        lv_qmnum = mo_help->so_abap->conv_exit( iv_val = iv_qmnum       iv_name = 'QMNUM' ).
        lv_sernr = mo_help->so_abap->conv_exit( iv_val = iv_sernr       iv_name = 'GERNR' ).

        SELECT SINGLE qmnum
        FROM qmel
        INTO lv_qmnum
        WHERE qmnum = lv_qmnum.
        "DE QST 053 Qualitätsmeldung zur Meldungsnummer & nicht gefunden
        mo_help->so_check_a_raise->after_select( iv_id = 'QST' iv_no = 053 i_where1 = lv_qmnum ).

**        ls_header-code   = lv_code.
*        ls_header_x-code = lv_code.

        SELECT SINGLE MAX( fenum )
          FROM qmfe
          INTO lv_fenum
          WHERE qmnum = lv_qmnum.

        IF sy-subrc = 0.
          ADD 1 TO lv_fenum.
        ELSE.
          lv_fenum = 1.
        ENDIF.

        APPEND INITIAL LINE TO lt_item ASSIGNING <ls_item>.
*        APPEND INITIAL LINE TO lt_item_x ASSIGNING <ls_item_x>.

        <ls_item>-item_sort_no     = lv_fenum.
        <ls_item>-item_sort_no    =  mo_help->so_abap->conv_exit(   <ls_item>-item_sort_no  ).
        <ls_item>-single_unit_nr   = lv_sernr.
        <ls_item>-single_unit_nr   =  mo_help->so_abap->conv_exit( <ls_item>-single_unit_nr ).
*        <ls_item_x>-single_unit_nr = abap_true.

        <ls_item>-d_code = iv_error_code.
*        <ls_item>-d_code =  h=>so_abap->conv_exit( <ls_item>-d_code ).
*        <ls_item_x>-d_code = abap_true.

        CALL FUNCTION 'BAPI_QUALNOT_ADD_DATA'
          EXPORTING
            number  = lv_qmnum   " Message Number
*           notifheader        =     " BAPI Quality Notification Header for Creation
*           sender  =     " Logical system of sender
*  IMPORTING
*           notifhdtext        =     " Text Fields for Notification Header
*           notifheader_export =     " BAPI Quality Notification Header
          TABLES
*           notfulltxt         =     " Notification Long Text
            notitem = lt_item   " Notification Item for Creation
*           notifcaus          =     " Notification Cause for Creation
*           notifactv          =     " Notification Activities for Creation
*           notiftask          =     " Notification Task for Creation
*           notifpartnr        =     " Partner(s) for Creation
*           key_relationships  =     " Key Relationships
            return  = et_log.    " Return Parameter(s)
        mo_help->so_check_a_raise->after_function( i_any1 = et_log is_sy = sy ).

        CALL FUNCTION 'BAPI_QUALNOT_SAVE'
          EXPORTING
            number        = lv_qmnum
*         IMPORTING
*           NOTIFHEADER   =
          TABLES
            return        = et_log
          EXCEPTIONS
            error_message = 1
            OTHERS        = 2.
        mo_help->so_check_a_raise->after_function( i_any1 = et_log is_sy = sy ).


        IF iv_is_commit = abap_true.
          mo_help->so_service->db_commit_a_wait(  ).
        ENDIF.


        """""""""""""""""""""""""""""""""""""""""""""
        " Fehlerbehandlung

        DATA: lx_t100 TYPE REF TO cx_t100_msg.
      CATCH cx_t100_msg INTO lx_t100.
        IF iv_is_commit = abap_true.
          mo_help->so_service->db_rollback(  ).
        ENDIF.
        "Fehlercode konnte nicht gespeichert werden
        mo_help->so_error->raise_msg(  iv_id = '' iv_no = ' '  ).

    ENDTRY.
  ENDMETHOD.

  METHOD qmel_get_status.

    TYPES: BEGIN OF ty_s_status,
             objnr TYPE qmel-objnr,

             stsma TYPE jsto-stsma,
             stat  TYPE jest-stat,

             stonr TYPE tj30-stonr,
           END OF ty_s_status.

    TYPES: BEGIN OF ty_s_status_t,
             stsma TYPE jsto-stsma,
             stat  TYPE jest-stat,

*           stonr    TYPE tj30-stonr,
             spras TYPE spras,
             txt04 TYPE tj30t-txt04,
             txt30 TYPE tj30t-txt30,
           END OF ty_s_status_t.

    DATA:
      lv_qmnum  TYPE qmnum,
      lv_objnr  TYPE objnr,
      lt_status TYPE SORTED TABLE OF ty_s_status WITH NON-UNIQUE KEY objnr.

    DATA:
      lt_status_t TYPE SORTED TABLE OF ty_s_status_t WITH NON-UNIQUE KEY stsma stat spras,
      ls_status_t TYPE ty_s_status_t.

    TRY.

        lv_qmnum = mo_help->so_abap->conv_exit( iv_val = iv_qmnum iv_name = 'QMNUM').

        SELECT SINGLE objnr
           FROM qmel
           INTO lv_objnr
         WHERE qmnum = lv_qmnum.
        mo_help->so_check_a_raise->after_select(  ).

        "Statusschema und Objektstautus auslesen
        SELECT jest~objnr jest~stat jsto~stsma tj30~stonr
          FROM jest  "Status
          JOIN jsto  "Statusscheme
                 ON jsto~objnr = jest~objnr
          JOIN tj30
                 ON  tj30~estat = jest~stat
                 AND tj30~stsma = jsto~stsma
          INTO CORRESPONDING FIELDS OF TABLE lt_status
          WHERE jest~objnr = lv_objnr
          AND   jest~inact = ' '.
*          AND   tj30~stonr <> ' '.
        mo_help->so_check_a_raise->after_select(  ).

        "Beschreibungstecxte und stonr dazu auslesen
        SELECT estat AS stat
               stsma
*           tj30~stonr
               spras
               txt04
               txt30
          FROM tj30t "Gibt uns status für objnr
*      INNER JOIN tj30
*              ON tj30~estat = tj30t~estat
*             AND tj30~stsma = tj30t~stsma
          INTO CORRESPONDING FIELDS OF TABLE lt_status_t
          FOR ALL ENTRIES IN lt_status
          WHERE estat = lt_status-stat
          AND   stsma = lt_status-stsma
          AND   spras IN (sy-langu , 'E').
        mo_help->so_check_a_raise->after_select(  ).

        LOOP AT lt_status_t INTO ls_status_t.
          APPEND   ls_status_t-txt04 TO rt_result.
        ENDLOOP.


        DATA: lx_t100 TYPE REF TO cx_t100_msg.
      CATCH cx_t100_msg INTO lx_t100.
        "DE EIN 220 Fehler bei Statusprüfung
        mo_help->so_error->raise_msg(  iv_id = 'EIN' iv_no = 220 io_previous = lx_t100 ).
    ENDTRY.

  ENDMETHOD.                    "qmel_status_get

  METHOD qmel_get_partner.

    DATA:
      lv_qmnum TYPE qmnum,
      lv_objnr TYPE objnr,
      lv_parvw TYPE parvw.

    TRY.

        lv_qmnum = iv_qmnum.
        lv_parvw = iv_parvw.
        lv_qmnum = mo_help->so_abap->conv_exit(  lv_qmnum ).
        lv_parvw = mo_help->so_abap->conv_exit(  lv_parvw ).

        SELECT SINGLE objnr
        FROM qmel
        INTO lv_objnr
        WHERE qmnum = lv_qmnum.
        mo_help->so_check_a_raise->after_select(  ).

        SELECT SINGLE *
          FROM ihpa
          INTO CORRESPONDING FIELDS OF rs_ihpa
          WHERE objnr = lv_objnr
          AND  parvw = lv_parvw.
        mo_help->so_check_a_raise->after_select(  ).


        """"""""""""""""""""""""""""""""""""""""
        DATA: lx_t100 TYPE REF TO cx_t100_msg.
      CATCH cx_t100_msg INTO lx_t100.
        "D    67  391 Partner & ist nicht vorhanden
        mo_help->so_error->raise_msg(  iv_no = 391 iv_id = 67 io_previous = lx_t100 ).
    ENDTRY.

  ENDMETHOD.                    "qmel_get_partner



  METHOD hu_change_matnr_menge.

    TRY.

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " HU lesen

        DATA:
          ls_vekp  TYPE vekp,
          lv_exidv TYPE exidv.

        lv_exidv = mo_help->so_abap->conv_exit( iv_val = iv_exidv iv_name = 'EXIDV' ).

        SELECT SINGLE *
          FROM vekp
          INTO CORRESPONDING FIELDS OF ls_vekp
          WHERE exidv = lv_exidv.
        mo_help->so_check_a_raise->after_select( ).



        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " SD - Kontext initialisieren

        sd_init_packing( ).



        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " HU get HUs

        DATA:
          lt_venum    TYPE hum_venum_t,
          lt_messages TYPE huitem_messages_t.

        APPEND ls_vekp-venum TO lt_venum.

        CALL FUNCTION 'HU_GET_HUS'
          EXPORTING
            if_lock_hus   = abap_true
            if_no_loop    = abap_true
            if_more_hus   = abap_true
            it_venum      = lt_venum " HU Identifications
          IMPORTING
            et_messages   = lt_messages
          EXCEPTIONS
            hus_locked    = 1
            no_hu_found   = 2
            fatal_error   = 3
            error_message = 4
            OTHERS        = 5.
        mo_help->so_check_a_raise->after_function(
                                     i_any1 = lt_messages
                                     is_sy  = sy ).



        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Find Materials

        DATA:
          lt_v51vp TYPE vsep_t_v51vp,
          ls_v51vp TYPE LINE OF vsep_t_v51vp.

        ls_v51vp-matnr           = iv_matnr.
        ls_v51vp-werks           = iv_werks.
        ls_v51vp-pakmg           = iv_quantity. "is_packing-quantity.
        ls_v51vp-opmng           = iv_quantity.
        ls_v51vp-lf_opmng        = iv_quantity.
        ls_v51vp-opmng_bum       = iv_quantity.
        ls_v51vp-lf_opmng_bum    = iv_quantity.
        ls_v51vp-pakmg_bum       = iv_quantity.
        ls_v51vp-lfimg           = iv_quantity.
        ls_v51vp-lfimg_save      = iv_quantity.
        ls_v51vp-lgmng           = iv_quantity.
        ls_v51vp-menge_save      = iv_quantity.
        ls_v51vp-lgort           = iv_lgort.
        APPEND ls_v51vp TO lt_v51vp.

        CALL FUNCTION 'V51P_FIND_MATERIAL'
          EXPORTING
            it_v51vp       = lt_v51vp
          EXCEPTIONS
            item_not_found = 1
            mat_not_found  = 2
            error          = 3
            error_message  = 4
            OTHERS         = 5.
        mo_help->so_check_a_raise->after_function( is_sy = sy ).



        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " HU Packing Unpacking

        DATA:
          ls_packing TYPE vsep_s_pithu.

        ls_packing-venum    = ls_vekp-venum.
        ls_packing-exidv    = ls_vekp-exidv.
        ls_packing-velin    = 1.
        ls_packing-matnr    = iv_matnr.
        ls_packing-quantity = iv_quantity.
        ls_packing-meins    = iv_meins.
        ls_packing-werks    = iv_werks.
        ls_packing-lgort    = iv_lgort.


        CALL FUNCTION 'HU_PACKING_AND_UNPACKING'
          EXPORTING
            is_packing_request = ls_packing
          EXCEPTIONS
            missing_data       = 1
            hu_not_changeable  = 2
            not_possible       = 3
            customizing        = 4
            weight             = 5
            volume             = 6
            serial_nr          = 7
            fatal_error        = 8
            error_message      = 9
            OTHERS             = 10.
        mo_help->so_check_a_raise->after_function( is_sy = sy ).



        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Verbuchen

        DATA:
           lt_humsg TYPE huitem_messages_t.

        CALL FUNCTION 'HU_POST'
          EXPORTING
            if_synchron   = abap_true
            if_commit     = abap_false
          IMPORTING
            et_messages   = lt_humsg
          EXCEPTIONS
            error_message = 1.
        mo_help->so_check_a_raise->after_function( i_any1 = lt_humsg is_sy = sy ).



        """"""""""""""""""""""""""""""""""""""""""
        " Fehlerbehandlung

        DATA: lx_t100 TYPE REF TO cx_t100_msg.
      CATCH cx_t100_msg INTO lx_t100.
        "009 Material &1 Menge &2 aus Planauftrag konnte HU &2 nicht zugeordnet werden
        mo_help->so_error->raise_msg( iv_id = 'ZSTC_WEBSERVICES' iv_no = '009'
             iv_v1 = iv_matnr iv_v2 = iv_quantity  iv_v3 = iv_exidv io_previous = lx_t100 ).

    ENDTRY.

  ENDMETHOD.                    "hu_add_matnr


  METHOD sd_init_packing.

    CALL FUNCTION 'RV_DELIVERY_INIT'
      EXPORTING
        status_buff_init = abap_true
        if_no_deque      = abap_true.

    CALL FUNCTION 'HU_PACKING_REFRESH'.
    CALL FUNCTION 'SD_BUFFER_TABLES_REFRESH'.
    CALL FUNCTION 'SERIAL_INTTAB_REFRESH'.
    CALL FUNCTION 'STATUS_BUFFER_REFRESH'.
    CALL FUNCTION 'ME_CONFIRMATIONS_REFRESH'.
    CALL FUNCTION 'ME_REFRESH_COMP_GOODS_MOVEMENT'.
    CALL FUNCTION 'MMPUR_EKBE_REFRESH_BUFFER'.
    CALL FUNCTION 'RV_MESSAGES_REFRESH'.

    CALL FUNCTION 'LE_DELIVERY_REFRESH_BUFFER'
      EXCEPTIONS
        no_key_specified = 1
        OTHERS           = 2.


    DATA ls_v51g TYPE v51ggl.
    DATA ls_header TYPE v51ko.

    CALL FUNCTION 'HU_PACKING_REFRESH'.
    CALL FUNCTION 'HU_INITIALIZE_PACKING'.

    ls_v51g-init = abap_true.
    ls_header-object = '12'.

    CALL FUNCTION 'HU_INIT_CALL_PACKING'
      EXPORTING
        is_packing_header = ls_header
        is_v51g           = ls_v51g
      EXCEPTIONS
        hus_locked        = 1
        fatal_error       = 2
        error_message     = 3
        OTHERS            = 4.
    mo_help->so_check_a_raise->after_function( is_sy = sy ).

  ENDMETHOD.                    "init_packing

  METHOD hu_create.

    TRY.

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " SD - Kontext initialisieren

        sd_init_packing( ).


        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " HU erzeugen

        DATA ls_vekp TYPE vekpvb.
        DATA ls_header_add TYPE huhdr_additional_data.
        DATA lt_items TYPE huitm_prop.
        DATA lt_items_exp TYPE hum_hu_item_t.
        DATA lt_msg TYPE huitem_messages_t.
        DATA: ls_prop TYPE huhdr_proposal.

        ls_prop-exidv     = '$1'.
        ls_prop-vhilm     = iv_vhilm.

        ls_header_add-werks = is_plaf-plwrk.
        ls_header_add-lgort = is_plaf-lgort.

        "HU durch Funktionsbaustein anlegen
        CALL FUNCTION 'HU_CREATE_ONE_HU'
          EXPORTING
            is_header_proposal = ls_prop
            is_header_add      = ls_header_add
            it_items           = lt_items
          IMPORTING
            es_header          = ls_vekp
            et_items           = lt_items_exp
            et_messages        = lt_msg
          EXCEPTIONS
            input_missing      = 1
            not_possible       = 2
            header_error       = 3
            item_error         = 4
            serial_nr_error    = 5
            fatal_error        = 6
            error_message      = 7
            OTHERS             = 8.
        mo_help->so_check_a_raise->after_function( is_sy = sy i_any1 = lt_msg ).



        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Verbuchen

        DATA:
           lt_humsg TYPE huitem_messages_t.

        CALL FUNCTION 'HU_POST'
          EXPORTING
            if_synchron   = abap_true
            if_commit     = abap_false
          IMPORTING
            et_messages   = lt_humsg
          EXCEPTIONS
            error_message = 1.
        mo_help->so_check_a_raise->after_function( i_any1 = lt_humsg is_sy = sy ).

        rv_result = ls_vekp-exidv.



        """"""""""""""""""""""""""""""""""""""""""
        " Fehlerbehandlung

        DATA: lx_t100 TYPE REF TO cx_t100_msg.
      CATCH cx_t100_msg INTO lx_t100.
        "006  Fehler beim Erstellen einer HU
        mo_help->so_error->raise_msg( iv_id = 'ZSTC_WEBSERVICES' iv_no = '006'
                        io_previous = lx_t100 ).

    ENDTRY.

  ENDMETHOD.                    "hu_create


  METHOD get_user_info.

    DATA:
      ls_usr21     TYPE usr21.


    SELECT SINGLE *
      FROM usr21
      INTO CORRESPONDING FIELDS OF ls_usr21
      WHERE bname = iv_uname.
    mo_help->so_check_a_raise->after_select( ).


    CALL FUNCTION 'ADDR_PERS_COMP_GET_COMPLETE'
      EXPORTING
        addrnumber              = ls_usr21-addrnumber
*       ADDRHANDLE              =
        persnumber              = ls_usr21-persnumber
*       PERSHANDLE              =
*       ARCHIVE_HANDLE          =
*       IV_CURRENT_COMM_DATA    = 'X'
      IMPORTING
        addr3_complete          = rs_result
      EXCEPTIONS
        parameter_error         = 1
        address_not_exist       = 2
        person_not_exist        = 3
        internal_error          = 4
        wrong_access_to_archive = 5
        error_message           = 6
        OTHERS                  = 7.
    mo_help->so_check_a_raise->after_function( is_sy = sy ).


  ENDMETHOD.

  METHOD get_warenempf_by_kunnr.

    DATA:
      ls_name TYPE ty_s_name.

    READ TABLE st_land1_name1 INTO ls_name
      WITH KEY kunnr = iv_kunnr.

    IF sy-subrc <> 0.

      SELECT SINGLE land1 name1
        FROM kna1
        INTO (ls_name-land1, ls_name-name1)
        WHERE kunnr = iv_kunnr.

      ls_name-kunnr = iv_kunnr.

      INSERT ls_name INTO TABLE st_land1_name1.

    ENDIF.

*    ev_land1 = ls_name-land1.
    rv_result = ls_name-name1.

  ENDMETHOD.                    "get_warenempf


  METHOD likp_create_by_vbak.

    DATA:
      lv_vbeln     TYPE vbeln,
      lt_vbap      TYPE vbap_t,
      ls_vbap      TYPE vbap,
      lt_sls_items TYPE shp_sls_itm_t,
      lt_messages  TYPE vbfs_t,
      lt_dlv_items TYPE shp_dlv_itm_t,
      ls_item      TYPE LINE OF shp_dlv_itm_t,
      lt_snap_lock TYPE wlf_seqg3_tab,
      ls_ser02     TYPE ser02,
      lt_ser02     TYPE STANDARD TABLE OF ser02,
      lt_objk      TYPE STANDARD TABLE OF objk,
      ls_objk      TYPE objk,
      lt_sernr     TYPE shp_sernr_t.



    FIELD-SYMBOLS:
      <ls_item>  TYPE LINE OF shp_sls_itm_t,
      <ls_sernr> TYPE LINE OF shp_sernr_t.


    TRY.

        "Aktuelle gesetzte Sperren merken
        lt_snap_lock = mo_help->so_service->lock_get_snap( ).


        lv_vbeln = iv_vbeln.
        lv_vbeln = mo_help->so_abap->conv_exit( lv_vbeln ).

        SELECT *
          FROM vbap
          INTO CORRESPONDING FIELDS OF TABLE lt_vbap
          WHERE vbeln = lv_vbeln.
        mo_help->so_check_a_raise->after_select( ).

        LOOP AT lt_vbap INTO ls_vbap.

          APPEND INITIAL LINE TO lt_sls_items ASSIGNING <ls_item>.
          <ls_item>-rfbel = ls_vbap-vbeln.
          <ls_item>-rfpos = ls_vbap-posnr.
          <ls_item>-lfimg = ls_vbap-kwmeng.
          <ls_item>-vrkme = ls_vbap-vrkme.

        ENDLOOP.

        SELECT *
          FROM ser02
          INTO CORRESPONDING FIELDS OF TABLE lt_ser02
          WHERE sdaufnr = lv_vbeln.

        IF sy-subrc = 0.

          SELECT *
            FROM objk
            INTO CORRESPONDING FIELDS OF TABLE lt_objk
            FOR ALL ENTRIES IN lt_ser02
            WHERE obknr = lt_ser02-obknr.

          LOOP AT lt_ser02 INTO ls_ser02.

            READ TABLE lt_objk INTO ls_objk
             WITH KEY obknr = ls_ser02-obknr.

            IF sy-subrc <> 0.
              CONTINUE.
            ENDIF.

            APPEND INITIAL LINE TO lt_sernr ASSIGNING <ls_sernr>.
            <ls_sernr>-sernr = ls_objk-sernr.
            <ls_sernr>-rfbel = ls_ser02-sdaufnr.
            <ls_sernr>-rfpos = ls_ser02-posnr.

          ENDLOOP.


        ENDIF.


        CALL FUNCTION 'SHP_DELIVERY_CREATE_FROM_SLS'
          EXPORTING
*           IF_VSTEL      =
*           IF_LEDAT      =
            it_sls_items  = lt_sls_items
            it_sernr      = lt_sernr
*           IF_NO_DEQUEUE =
          IMPORTING
            et_dlv_items  = lt_dlv_items
            et_messages   = lt_messages
          EXCEPTIONS
            error_message = 1
            OTHERS        = 2.
        mo_help->so_check_a_raise->after_function(  is_sy = sy i_any1 = lt_messages ).

        rt_log = mo_help->so_txt->bapirettab_get_by_any(  lt_messages ).

        IF iv_is_commit = abap_true. " = 0.
          mo_help->so_service->db_commit_a_wait( ). "COMMIT WORK AND WAIT.
          TRY.
              mo_help->so_service->lock_set_snap(  lt_snap_lock ).
            CATCH cx_root.
          ENDTRY.
        ENDIF.

        READ TABLE lt_dlv_items INTO ls_item
            INDEX 1.
        rv_result = ls_item-vbeln.


        """"""""""""""""""""""""""""""""
        " Fehlerbehandlung

        DATA: lx_t100 TYPE REF TO cx_t100_msg.
      CATCH cx_t100_msg INTO lx_t100.
        IF iv_is_commit = abap_true. " = 0.
          mo_help->so_service->db_rollback( ).
        ENDIF.

        TRY.
            mo_help->so_service->lock_set_snap(  lt_snap_lock ).
          CATCH cx_root.
        ENDTRY.

        "DE JIT00   058 Lieferung konnte nicht erstellt werden
        mo_help->so_error->raise_msg( iv_id = 'JIT00' iv_no = '058' io_previous = lx_t100 ).
    ENDTRY.

  ENDMETHOD.                    "sd_likp_create_by_vbak

  METHOD vbap_add_sernr.


    DATA ls_serxx          TYPE rserxx.
    DATA lt_sernr          TYPE STANDARD TABLE OF e1rmsno.
    DATA ls_vbap TYPE vbap.
    DATA: lt_vbap TYPE STANDARD TABLE OF vbap.
    DATA: lt_serial_r TYPE STANDARD TABLE OF ersernr.
    DATA: lt_log TYPE tsmesg.

*** Select customer order item

    DATA:
      lv_vbeln TYPE vbap-vbeln,
      lv_posnr TYPE vbap-posnr,
      lv_sernr TYPE gernr.

    TRY.

        lv_vbeln = iv_vbeln.
        lv_posnr = iv_posnr.

        lv_vbeln = mo_help->so_abap->conv_exit(  lv_vbeln ).
        lv_posnr = mo_help->so_abap->conv_exit(  lv_posnr ).

        SELECT  *
        FROM vbap
        INTO CORRESPONDING FIELDS OF TABLE lt_vbap
        WHERE vbeln = lv_vbeln
        AND   posnr = lv_posnr.
        mo_help->so_check_a_raise->after_select(  ).

        READ TABLE lt_vbap INDEX 1
          INTO ls_vbap.

        IF iv_sernr IS NOT INITIAL.
          lv_sernr = iv_sernr.
          lv_sernr = mo_help->so_abap->conv_exit(  lv_sernr ).
          APPEND lv_sernr TO lt_sernr.
        ENDIF.

        LOOP AT it_sernr INTO lv_sernr.
          lv_sernr = mo_help->so_abap->conv_exit(  lv_sernr ).
          APPEND lv_sernr TO lt_sernr.
        ENDLOOP.


        ls_serxx-sdaufnr = ls_vbap-vbeln.
        ls_serxx-posnr   = ls_vbap-posnr.
        ls_serxx-anzsn   = lines( lt_sernr ).

        CALL FUNCTION 'SERNR_ADD_TO_DOCUMENT'
          EXPORTING
            operation                 = 'SDAU'    " Serialization procedure
            objkopf                   = 'SER02'    " Type of Object List
            serxx                     = ls_serxx
            material                  = ls_vbap-matnr    " Material Number
            profile                   = ls_vbap-serail
            quantity                  = 1
*           m_werk                    =     " Plant
*           m_charge                  =
*           j_vorgang                 =
*           kmatnr                    =
*           cuobj                     =
*           r_material                =     " Receiving Material
*           bstch                     =
*           bstup                     =
*           snbwg                     =     " Transaction Type Group
*           ematn                     =     " Material Number Corresponding to Manufacturer Part Number
*           kdauf                     =
*           kdpos                     =
*           automatic                 = SPACE    " Automatic serial number assignment
*           no_enqueue                = SPACE
*           more_allowed              = SPACE
*           budat                     =     " Posting Date in the Document
*           bapi                      = SPACE    " Call from BAPI
*           ext                       =     " Interface Extensions for SERNR_ADD_TO_DOCUMENT
*          IMPORTING
*           anzsn                     =
*           new_obknr                 =
*           serial_commit             =     " Change Indicator
*           status_not_allowed        =
*           zeilen_id                 =
*           ext_e                     =     " Export Interface Enhancements for SERNR_ADD_TO_DOCUMENT
          TABLES
            sernr                     = lt_sernr
            r_sernr                   = lt_serial_r
*           xvbpa                     =
          CHANGING
            t_smesg                   = lt_log   " Message table message collector
          EXCEPTIONS
            konfigurations_error      = 1
            general_serial_error      = 2
            no_profile_operation      = 3
            difference_in_header_data = 4
            error_message             = 5
            OTHERS                    = 6.
        mo_help->so_check_a_raise->after_function(  is_sy = sy i_any1 = lt_log ).

        IF iv_is_commit = abap_true.
          CALL FUNCTION 'SERIAL_LISTE_POST_AU'.
          mo_help->so_service->db_commit_a_wait( ). "COMMIT WORK AND WAIT.
        ENDIF.


        """"""""""""""""""""""""""""""""""
        " Fehlerbehandlung

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.

        IF iv_is_commit = abap_true.
          mo_help->so_service->db_rollback(  ). "COMMIT WORK AND WAIT.
        ENDIF.

        "DE BWSD    004 Fehler bei der Serialisierung aufgetreten
        mo_help->so_error->raise_msg(  iv_id = 'BWSD' iv_no = '004' io_previous = lx_root ).
    ENDTRY.

  ENDMETHOD.                    "sd_vbap_add_sernr

  METHOD likp_set_goods_movement.

    DATA:
      lv_is_error1 TYPE abap_bool,
      lv_is_error2 TYPE abap_bool,
      lv_is_error3 TYPE abap_bool,
      lv_is_error4 TYPE abap_bool,
      lv_is_error5 TYPE abap_bool,
      lv_is_error6 TYPE abap_bool,
      lv_is_error7 TYPE abap_bool,
      lv_is_error8 TYPE abap_bool,

      lv_vbeln     TYPE vbeln,
      ls_likp      TYPE likp,
      ls_vbkok     TYPE vbkok,
      lt_vbpo      TYPE TABLE OF vbpok,
      lt_prot      TYPE  STANDARD TABLE OF prott,
      lt_snap_lock TYPE wlf_seqg3_tab,
      lt_log       TYPE bapiret2_tab.

    TRY.

        sd_init_packing( ).

        """""""""""""""""""""""""""""""
        " Input validieren

        lv_vbeln = iv_vbeln.
        lv_vbeln = mo_help->so_abap->conv_exit( lv_vbeln ).

        SELECT SINGLE *
          FROM likp
          INTO CORRESPONDING FIELDS OF ls_likp
          WHERE vbeln = lv_vbeln.
        mo_help->so_check_a_raise->after_select( i_where1 = lv_vbeln ).

        SELECT SINGLE mandt "vbeln wbsta posnr
        FROM vbuk
        INTO sy-mandt
        WHERE vbeln = lv_vbeln
        AND   gbstk = 'C'.

        IF sy-subrc = 0.
          "D  JIT00 469 Lieferung ist bereits WA-gebucht
          mo_help->so_error->raise_msg( iv_id = 'JIT00' iv_no = 469 ).
        ENDIF.


        """""""""""""""""""""""""""""""
        " Vorbereiten

        ls_vbkok-wabuc = abap_true.
        ls_vbkok-vbeln_vl = lv_vbeln.

        """""""""""""""""""""""""""""""
        " Sperren

        lt_snap_lock = mo_help->so_service->lock_get_snap( ).

        """""""""""""""""""""""""""""""
        " Buchen

        CALL FUNCTION 'WS_DELIVERY_UPDATE_2'
          EXPORTING
            vbkok_wa                  = ls_vbkok
            synchron                  = ' '
            commit                    = ' '
            delivery                  = lv_vbeln
            if_error_messages_send    = space
            nicht_sperren_1           = ''
            if_get_delivery_buffered  = ''
            if_no_buffer_refresh      = ''
            if_no_init_1              = ''
            if_no_read_1              = ''
*           if_database_update_1      = '2'
*           NO_MESSAGES_UPDATE_1      = 'X'
*           IF_NO_MES_UPD_PACK        = 'X'
          IMPORTING
            ef_error_any              = lv_is_error1    " Feld zum Ankreuzen
            ef_error_in_item_deletion = lv_is_error2    " Feld zum Ankreuzen
            ef_error_in_pod_update    = lv_is_error3    " Feld zum Ankreuzen
            ef_error_in_interface     = lv_is_error4   " Feld zum Ankreuzen
            ef_error_in_goods_issue   = lv_is_error5    " Feld zum Ankreuzen
            ef_error_in_final_check   = lv_is_error6    " Feld zum Ankreuzen
            ef_error_partner_update   = lv_is_error7    " Fehler beim Ändern der Lieferungspartner
            ef_error_sernr_update     = lv_is_error8    " Fehler beim Ändern der Serialnummern
          TABLES
            vbpok_tab                 = lt_vbpo
            prot                      = lt_prot
          EXCEPTIONS
            error_message             = 98
            OTHERS                    = 99.
        mo_help->so_check_a_raise->after_function( is_sy = sy i_any1 = lt_vbpo i_any2 = lt_prot ).

        CASE abap_true.
          WHEN lv_is_error1.
            mo_help->so_error->raise_text( 'ef_error_any' ).
          WHEN lv_is_error2.
            mo_help->so_error->raise_text( 'ef_error_in_item_deletion' ).
          WHEN lv_is_error3.
            mo_help->so_error->raise_text( 'ef_error_in_pod_update' ).
          WHEN lv_is_error4.
            mo_help->so_error->raise_text( 'ef_error_in_interface' ).
          WHEN lv_is_error5.
            mo_help->so_error->raise_text( 'ef_error_in_goods_issue' ).
          WHEN lv_is_error6.
            mo_help->so_error->raise_text( 'ef_error_in_final_check' ).
          WHEN lv_is_error7.
            mo_help->so_error->raise_text( 'ef_error_partner_update' ).
          WHEN lv_is_error8.
            mo_help->so_error->raise_text( 'ef_error_sernr_update' ).
        ENDCASE.

        IF iv_is_commit = abap_true.
          mo_help->so_service->db_commit_a_wait(  ).
        ENDIF.


        """""""""""""""""""""""""""""""""""""""""
        " Sperren lösen

        TRY.
            mo_help->so_service->lock_set_snap(  lt_snap_lock ).
          CATCH cx_root.
        ENDTRY.


        """""""""""""""""""""""""""""""""""""""""
        " Log aufbereiten

        lt_log =  mo_help->so_txt->bapirettab_get_by_any(  lt_vbpo ).
        APPEND LINES OF lt_log TO et_log.
        FREE lt_log.
        lt_log =  mo_help->so_txt->bapirettab_get_by_any(  lt_prot ).
        APPEND LINES OF lt_log TO et_log.


        """""""""""""""""""""""""""""""""""""""""
        " Fehlerbehandlung

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        IF iv_is_commit = abap_true.
          mo_help->so_service->db_rollback( ).
        ENDIF.

        TRY.
            mo_help->so_service->lock_set_snap(  lt_snap_lock ).
          CATCH cx_root.
        ENDTRY.

        "D  BORGR 593 Wareneingang zu Anlieferung &1 konnte nicht gebucht werden
        mo_help->so_error->raise_msg( iv_id = 'BORGR' iv_no = 593 iv_v1 = lv_vbeln io_previous = lx_root ).
    ENDTRY.


  ENDMETHOD.                    "sd_likp_set_goods_movement

  METHOD likp_get_partner.

*    DATA:
*          lt_vbpa TYPE STANDARD TABLE OF vbpa,
*          ls_vbpa TYPE vbpa,
*          ls_relevant LIKE LINE OF rt_relevant.
*
*    SELECT vbeln
*    FROM vbpa
*    INTO CORRESPONDING FIELDS OF TABLE lt_vbpa
*    FOR ALL ENTRIES IN rt_relevant
*    WHERE vbeln = rt_relevant-vbelv
*      AND parvw = 'AG'.
*
*    LOOP AT rt_relevant INTO ls_relevant.
*
*      READ TABLE lt_vbpa INTO ls_vbpa
*      WITH KEY vbeln = ls_relevant-vbelv.
*
*      IF NOT ls_vbpa-kunnr IN is_input-tr_kunnr.
*        DELETE rt_relevant.
*      ENDIF.
*
*    ENDLOOP.

  ENDMETHOD.


  METHOD vttk_set_status.


    DATA: " -------------------------------------------- Lokale Daten ----
      lt_logfile TYPE v56e_logfile,
      ls_actvty  TYPE v56e_shipment_activities,
      ls_shpmnt  TYPE v56e_shipment,
      lv_tknum   TYPE tknum,
      lx_t100    TYPE REF TO cx_t100_msg.


    lv_tknum = mo_help->so_abap->conv_exit(  iv_val = iv_tknum iv_name = 'TKNUM' ).

    TRY.

        """""""""""""""""""""""""""""""""""""""""""""""""
        " Validierung Eingabe

        SELECT SINGLE mandt
          FROM vttk
          INTO sy-mandt
          WHERE tknum = lv_tknum.
        mo_help->so_check_a_raise->after_select(  ).

*    ls_actvty-options-no_commit_work   = abap_true.
*    ls_actvty-change-execute = abap_true.
*    ls_actvty-header-data-ualen = sy-uzeit.
*    ls_actvty-header-data-dalen = sy-datum.
*    ls_actvty-header-data-stlad = abap_true.
*    ls_actvty-change-shipment_number = iv_tknum.

        ls_actvty-options-no_commit_work   = abap_true.
        ls_actvty-change-execute = abap_true.
        ls_actvty-header-data-dtdis = sy-datum. "sy-uzeit.
        ls_actvty-header-data-uzdis = sy-uzeit. "datum.
        ls_actvty-header-data-stdis = abap_true.
        ls_actvty-change-shipment_number = lv_tknum.



        CALL FUNCTION 'SD_SHIPMENT_PROCESS'
          EXPORTING
            process_begin  = 'X'
            process_header = 'X'
*           process_items  = 'X'
*           PROCESS_STAGES = 'X'
*           PROCESS_STATUS = 'X'
            process_end    = 'X'
          IMPORTING
            e_logfile      = lt_logfile
          CHANGING
            c_activities   = ls_actvty
            c_shipment     = ls_shpmnt
          EXCEPTIONS
            error          = 1
            error_message  = 2
            OTHERS         = 3.
        mo_help->so_check_a_raise->after_function(  ).

        COMMIT WORK AND WAIT.
        mo_help->so_check_a_raise->after_commit(  ).
*    IF sy-subrc <> 0.
*      lx_root = lo_log->add( 'Transport konnte nicht auf DB geschrieben werden. Fehler bei Commit work.' ).
*      RAISE EXCEPTION lx_root.
*    ENDIF.

      CATCH cx_t100_msg INTO lx_t100.
        mo_help->so_error->raise_text(  iv_text = 'Status konnte im Transport nicht geändert werden' io_previous = lx_t100 ).
    ENDTRY.

  ENDMETHOD.

  METHOD hu_get_exidv_by_venum.

    DATA: lv_venum TYPE venum,
          ls_hu    LIKE LINE OF st_exidv_venum,
          lv_exidv TYPE exidv.

    mo_help->so_abap->conv_conversion_exit(
 EXPORTING
   iv_value     = iv_venum
 IMPORTING
   ev_value     = lv_venum
).


    READ TABLE st_exidv_venum
      INTO ls_hu
      WITH KEY venum = lv_venum.

    IF sy-subrc <> 0.

      SELECT SINGLE exidv
      FROM vekp
      INTO lv_exidv
      WHERE venum = lv_venum.

      IF sy-subrc = 0.
        ls_hu-exidv = lv_exidv.
        ls_hu-venum = lv_venum.
        INSERT ls_hu INTO TABLE st_exidv_venum.
      ELSE.
        "§DE    BORGR   624 HU &1 existiert nicht
        mo_help->so_error->raise_idno( iv_idno = 'BORGR(624)'  iv_v1 = lv_venum ).
      ENDIF.

    ENDIF.

    rv_result = lv_exidv.

    " st_exidv_venum
  ENDMETHOD.

  METHOD hu_get_venum_by_exidv.

    DATA: lv_venum TYPE venum,
          ls_hu    LIKE LINE OF st_exidv_venum,
          lv_exidv TYPE exidv.

    mo_help->so_abap->conv_conversion_exit(
 EXPORTING
   iv_value     = iv_exidv
 IMPORTING
   ev_value     = lv_exidv
).


    READ TABLE st_exidv_venum
      INTO ls_hu
      WITH KEY exidv = lv_exidv.

    IF sy-subrc <> 0.

      SELECT SINGLE venum
      FROM vekp
      INTO lv_venum
      WHERE venum = lv_exidv.

      IF sy-subrc = 0.
        ls_hu-exidv = lv_exidv.
        ls_hu-venum = lv_venum.
        INSERT ls_hu INTO TABLE st_exidv_venum.
      ELSE.
        "§DE    BORGR   624 HU &1 existiert nicht
        mo_help->so_error->raise_idno( iv_idno = 'BORGR(624)'  iv_v1 = lv_exidv ).
      ENDIF.

    ENDIF.

    rv_result = lv_venum.


    " st_exidv_venum
  ENDMETHOD.

  METHOD likp_get_warenempf.

  ENDMETHOD.

  METHOD ltap_set_squit.


    DATA:
      lt_ltap_conf    TYPE STANDARD TABLE OF  ltap_conf,
      lt_ltap_conf_hu TYPE STANDARD TABLE OF ltap_conf_hu,
      lv_tanum        TYPE tanum,
      lv_tapos        TYPE tapos,
      lv_is_squit     TYPE abap_bool,
      ls_ltap         TYPE ltap,
      lv_lgnum        TYPE lgnum.

    mo_help->so_abap->conv_conversion_exit(
      EXPORTING
        iv_value     = iv_tanum
      IMPORTING
        ev_value     = lv_tanum
    ).

    mo_help->so_abap->conv_conversion_exit(
   EXPORTING
     iv_value     = iv_tapos
   IMPORTING
     ev_value     = lv_tapos
 ).

    mo_help->so_abap->conv_conversion_exit(
   EXPORTING
     iv_value     = iv_lgnum
   IMPORTING
     ev_value     = lv_lgnum
 ).

    SELECT SINGLE *
      FROM ltap
       INTO CORRESPONDING FIELDS OF ls_ltap
      WHERE lgnum = lv_lgnum
      AND tanum = lv_tanum
      AND tapos = lv_tapos.
    mo_help->so_check_a_raise->after_select( ).


    APPEND INITIAL LINE TO lt_ltap_conf ASSIGNING FIELD-SYMBOL(<ls_conf>).
    <ls_conf>-tanum = ls_ltap-tanum.
    <ls_conf>-tapos = ls_ltap-tapos.
    <ls_conf>-squit = 'X'.

    APPEND INITIAL LINE TO lt_ltap_conf_hu ASSIGNING FIELD-SYMBOL(<ls_conf_hu>).
    <ls_conf_hu>-tanum = ls_ltap-tanum.
    <ls_conf_hu>-tapos = ls_ltap-tapos.
    <ls_conf_hu>-vonhu = ls_ltap-vlenr.
    <ls_conf_hu>-nachu = ls_ltap-vlenr.
    <ls_conf_hu>-huent = 'X'.
    <ls_conf_hu>-menga = ls_ltap-vsolm.
    <ls_conf_hu>-altme = ls_ltap-altme.

    lv_is_squit = ' '.


    CALL FUNCTION 'L_TO_CONFIRM'
      EXPORTING
        i_lgnum                        = lv_lgnum
        i_tanum                        = lv_tanum
        i_squit                        = lv_is_squit
*       I_QUKNZ                        = ' '
*       I_SUBST                        = ' '
        i_qname                        = sy-uname
        i_ename                        = sy-uname
*       I_SOLEX                        = 0
*       I_PERNR                        = 0
*       I_STDAT                        = INIT_DATUM
*       I_STUZT                        = 0
*       I_ENDAT                        = INIT_DATUM
*       I_ENUZT                        = 0
*       I_ISTWM                        = 0
*       I_KOMIM                        = ' '
*       I_EINLM                        = ' '
*       I_TBELI                        = ' '
*       I_UPDATE_TASK                  = ' '
        i_commit_work                  = ' '
*       I_AUSFB                        = ' '
      TABLES
        t_ltap_conf                    = lt_ltap_conf
        t_ltap_conf_hu                 = lt_ltap_conf_hu
*       T_LTAP_CONF_HU_SERIAL          =
      EXCEPTIONS
        to_confirmed                   = 1
        to_doesnt_exist                = 2
        item_confirmed                 = 3
        item_subsystem                 = 4
        item_doesnt_exist              = 5
        item_without_zero_stock_check  = 6
        item_with_zero_stock_check     = 7
        one_item_with_zero_stock_check = 8
        item_su_bulk_storage           = 9
        item_no_su_bulk_storage        = 10
        one_item_su_bulk_storage       = 11
        foreign_lock                   = 12
        squit_or_quantities            = 13
        vquit_or_quantities            = 14
        bquit_or_quantities            = 15
        quantity_wrong                 = 16
        double_lines                   = 17
        kzdif_wrong                    = 18
        no_difference                  = 19
        no_negative_quantities         = 20
        wrong_zero_stock_check         = 21
        su_not_found                   = 22
        no_stock_on_su                 = 23
        su_wrong                       = 24
        too_many_su                    = 25
        nothing_to_do                  = 26
        no_unit_of_measure             = 27
        xfeld_wrong                    = 28
        update_without_commit          = 29
        no_authority                   = 30
        lqnum_missing                  = 31
        charg_missing                  = 32
        no_sobkz                       = 33
        no_charg                       = 34
        nlpla_wrong                    = 35
        two_step_confirmation_required = 36
        two_step_conf_not_allowed      = 37
        pick_confirmation_missing      = 38
        quknz_wrong                    = 39
        hu_data_wrong                  = 40
        no_hu_data_required            = 41
        hu_data_missing                = 42
        hu_not_found                   = 43
        picking_of_hu_not_possible     = 44
        not_enough_stock_in_hu         = 45
        serial_number_data_wrong       = 46
        serial_numbers_not_required    = 47
        no_differences_allowed         = 48
        serial_number_not_available    = 49
        serial_number_data_missing     = 50
        to_item_split_not_allowed      = 51
        input_wrong                    = 52
        error_message                  = 53
        OTHERS                         = 54.
    IF sy-subrc <> 0.
      ROLLBACK WORK.
      mo_help->so_error->raise_any( is_sy = sy ).
    ENDIF.

    COMMIT WORK AND WAIT.

  ENDMETHOD.

  METHOD hu_print_label.


    DATA:
*        ls_log     TYPE zstc_t_label_log,
      lt_nast TYPE TABLE OF nast,
      ls_nast TYPE nast,
      lt_msg0 TYPE TABLE OF msg0,
      ls_msg0 TYPE msg0.

    FIELD-SYMBOLS: <ft_display> TYPE STANDARD TABLE.

    DATA:
            lv_venum TYPE venum.


    mo_help->so_abap->conv_conversion_exit(
      EXPORTING
        iv_value     = iv_venum
      IMPORTING
        ev_value     = lv_venum
    ).


    SELECT *
    FROM nast
    INTO CORRESPONDING FIELDS OF TABLE lt_nast
      WHERE objky EQ  lv_venum. "ls_log-venum.

    IF lt_nast IS NOT INITIAL.

      LOOP AT lt_nast INTO ls_nast.
        CLEAR ls_msg0.
        MOVE-CORRESPONDING ls_nast TO ls_msg0.
*      IF lv_printer IS NOT INITIAL.
*        ls_msg0-ldest = lv_printer.
*      ENDIF.
        APPEND ls_msg0 TO lt_msg0.
      ENDLOOP.

      ASSIGN lt_nast TO <ft_display>.

     CALL FUNCTION 'WFMC_MESSAGES_PROCESS'
        EXPORTING
          pi_display_id = 'NAST'                              "'NALIV6'
          pi_no_dialog  = abap_true
          pi_vermo      = 1
        TABLES
          tx_messages   = lt_msg0
          tx_display    = <ft_display>.
*    IF lv_rcode EQ 0.
**      MOVE abap_true TO cv_print_io.
*    ENDIF.

    ENDIF.


  ENDMETHOD.

  METHOD ltap_is_storno.

    DATA:
      lv_lgnum TYPE lgnum,
      lv_tanum TYPE tanum,
      lv_tapos TYPE tapos,
      ls_ltap  TYPE ltap.

    mo_help->so_abap->conv_conversion_exit(
  EXPORTING
    iv_value     = iv_lgnum
  IMPORTING
    ev_value     = lv_lgnum
).

    mo_help->so_abap->conv_conversion_exit(
    EXPORTING
      iv_value     = iv_tanum
    IMPORTING
      ev_value     = lv_tanum
  ).

    mo_help->so_abap->conv_conversion_exit(
    EXPORTING
      iv_value     = iv_tapos
    IMPORTING
      ev_value     = lv_tapos
  ).


    SELECT SINGLE *
        FROM ltap
      INTO CORRESPONDING FIELDS OF ls_ltap
      WHERE lgnum = lv_lgnum
      AND   tanum = lv_tanum
      AND   tapos = lv_tapos.
    mo_help->so_check_a_raise->after_select(  ).

    IF ls_ltap-pquit = 'X'
    AND ls_ltap-vorga = 'ST'.
      rv_result = abap_true.
    ELSE.
      rv_result = abap_false.
    ENDIF.


  ENDMETHOD.

ENDCLASS.                    "lcl_help_bl IMPLEMENTATION

CLASS lcx_help_exception IMPLEMENTATION.


  METHOD class_constructor.

    CREATE OBJECT so_help.

  ENDMETHOD.                    "class_constructor


  METHOD get_longtext.


    DATA:
      ls_stack   TYPE LINE OF abap_callstack,
      lv_prog    TYPE string,
      lv_include TYPE string,
      lv_line    TYPE string,
      lv_line_c  TYPE string,
      lv_block   TYPE string.

    result = get_text(  ).

    READ TABLE mt_stack INDEX 1
        INTO ls_stack.
    CHECK sy-subrc = 0.

    lv_prog    = ls_stack-mainprogram.
    lv_include = ls_stack-include.
    lv_line    = ls_stack-line.
    lv_block   = ls_stack-blockname.

    lv_line_c = lv_line.
    CONCATENATE
     result
         '  |  Include: '
         lv_include
         '  Line: '
             lv_line_c
             '  Block: '
             lv_block
                 INTO result RESPECTING BLANKS.


  ENDMETHOD.                    "get_longtext


  METHOD get_source_position.


    DATA:
           ls_stack TYPE LINE OF abap_callstack.

    super->get_source_position(
      IMPORTING
        program_name = program_name   " ABAP Program: Current Main Program
        include_name = include_name
        source_line  = source_line
    ).

    READ TABLE mt_stack INDEX 1
        INTO ls_stack.
    CHECK sy-subrc = 0.

    program_name = ls_stack-mainprogram.
    include_name = ls_stack-include.
    source_line  = ls_stack-line.

  ENDMETHOD.                    "get_source_position


  METHOD get_text.
*
    result = super->get_text( ).
**
*    TRY.
*        result =  so_help->so_t100->get_text_by_t100(
*             iv_msgid    = me->if_t100_message~t100key-msgid
*             iv_msgno    = me->if_t100_message~t100key-msgno
**            iv_langu    = SY-LANGU
*             iv_v1       = me->if_t100_message~t100key-attr1
*             iv_v2       = me->if_t100_message~t100key-attr2
*             iv_v3       = me->if_t100_message~t100key-attr3
*             iv_v4       = me->if_t100_message~t100key-attr4
**            iv_v5       =
**            it_params   =
**          RECEIVING
**            rv_string   =
*         ).
*      CATCH cx_t100_msg.    "
*    ENDTRY.


  ENDMETHOD.                    "get_text


  METHOD set_inheritance_attributes.

    ADD 1 TO iv_depth_info.

    """""""""""""""""""""""""""""""""""""""""""
    " Infos erweitern
*
    so_help->so_abap->code_get_callstack(
        IMPORTING
          et_callstack    =   mt_stack  ).

    DO iv_depth_info TIMES.
      DELETE  mt_stack INDEX 1.
    ENDDO.

    ms_sy       = sy.
    mv_text     = me->get_text(  ).
    mv_longtext = me->get_longtext( ).

    CONCATENATE t100_msgid "if_message~t100key-msgid
     '('
        t100_msgno
         ')'
        INTO mv_idno.


    """""""""""""""""""""""""""""""""""""""""""""
    " Codingstelle
    TRY.
        DATA: ls_stack LIKE LINE OF mt_stack.

        READ TABLE mt_stack INDEX 1
         INTO ls_stack.

        mt_code = so_help->so_abap->code_get_source(
             iv_name_program  = ls_stack-mainprogram
             iv_number_row    = ls_stack-line ).

      CATCH cx_root.
    ENDTRY.

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Stringtab mit Vorgängerinfos

    me->mt_previous_text = so_help->so_txt->write_exception(
        ix_root = me iv_is_detailed = abap_true ).


    """"""""""""""""""""""""""""""""""""""""""""""""
    " Add data

    TRY.
        IF ii_add_data IS NOT INITIAL.
          mv_xml = so_help->so_data->trans_any_2_xml_zip(  ii_add_data ).
        ENDIF.
      CATCH cx_t100_msg.    "
    ENDTRY.

  ENDMETHOD.                    "set_inheritance_attributes
ENDCLASS.                    "lcx_help_exception IMPLEMENTATION

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENDE: Erweiterter Helper - Stringverarbeitung, Zeitumrechnungen, Abap - Zusätze
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BEGIN - GUI Helper - Einfache Funktionen, ALV, Control Framework
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


*----------------------------------------------------------------------*
*       INTERFACE lif_help_top_gui IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
*INTERFACE lif_help_top_gui.
*
*
*  TYPES:
*    BEGIN OF ty_s_types,
*      o_help_gui             TYPE REF TO lcl_help_gui,
*      o_help_popup_exception TYPE REF TO lcl_help_gui_popup_error,
*      o_help_factory         TYPE REF TO lcl_help_factory_gui,
*    END OF ty_s_types.
*
*  CONSTANTS:
*    BEGIN OF cs_constants,
*      BEGIN OF s_popup_decide_answer.
*  CONSTANTS: button_left   TYPE string VALUE 'LEFT',
*             button_center TYPE string VALUE 'CENTER',
*             button_cancel TYPE string VALUE 'CANCEL',
*             END OF s_popup_decide_answer,
*
*             END OF cs_constants.
*
*ENDINTERFACE.                    "lif_help_top_gui DEFINITION
*
**----------------------------------------------------------------------*
**       CLASS lcl_help_factory_gui DEFINITION
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
*CLASS lcl_help_factory_gui DEFINITION INHERITING FROM lcl_help_base.
*
*  PUBLIC SECTION.
**
*    INTERFACES:
*      lif_help_top_gui.
**
*    ALIASES:
*       ty_s_gui_type
*          FOR lif_help_top_gui~ty_s_types.
**
*    CLASS-DATA:
*         so_help_sapgui TYPE ty_s_gui_type-o_help_gui.
**
*    CLASS-METHODS:
*      class_constructor.
*ENDCLASS.                    "lcl_help_factory_gui DEFINITION


CLASS lcl_help_gui DEFINITION INHERITING FROM lcl_help_base CREATE PUBLIC.

  PUBLIC SECTION.

*    INTERFACES:
*      lif_help_top_gui.
*
*    ALIASES:
*       ty_s_gui_type
*          FOR lif_help_top_gui~ty_s_types,
*       cs_const
*            FOR lif_help_top_gui~cs_constants.



    METHODS popup_confirm
      IMPORTING
        !iv_text               TYPE char255
        !iv_txt_btn_true       TYPE char10 OPTIONAL
        !iv_txt_btn_false      TYPE char10 OPTIONAL
      RETURNING
        VALUE(rv_is_confirmed) TYPE abap_bool .
    METHODS popup_inform
      IMPORTING
        !iv_msgid TYPE simple OPTIONAL
        !iv_msgno TYPE simple OPTIONAL
        !iv_v1    TYPE simple OPTIONAL
        !iv_v2    TYPE simple OPTIONAL
        !iv_v3    TYPE simple OPTIONAL
        !iv_v4    TYPE simple OPTIONAL
        !iv_text  TYPE clike OPTIONAL
        !sy       TYPE sy OPTIONAL
        PREFERRED PARAMETER iv_text
      RAISING
        cx_t100_msg .
    METHODS popup_exception
      IMPORTING
        !ix_exception TYPE REF TO cx_root
      RAISING
        cx_t100_msg.
*        !iv_is_previous TYPE abap_bool DEFAULT abap_false .
    METHODS popup_decide
      IMPORTING
        !iv_text                    TYPE clike
        !iv_btn_txt_left            TYPE clike DEFAULT 'Abbrechen'
        !iv_btn_txt_center          TYPE clike DEFAULT 'Weiter'
        !iv_is_btn_cancel_displayed TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(rv_answer)            TYPE string .
    METHODS popup_change_text
      IMPORTING
        VALUE(iv_title) TYPE clike OPTIONAL
        !it_text        TYPE stringtab OPTIONAL
        !iv_is_editable TYPE abap_bool DEFAULT abap_true
      EXPORTING
        !ev_is_changed  TYPE abap_bool
        !rt_text        TYPE stringtab .
    METHODS popup_get_values
      IMPORTING
        !iv_title       TYPE clike OPTIONAL
        !iv_tab1        TYPE clike
        !iv_field1      TYPE clike
        !iv_value1      TYPE clike OPTIONAL
        !iv_is_input1   TYPE abap_bool DEFAULT abap_true
        !iv_tab2        TYPE clike OPTIONAL
        !iv_field2      TYPE clike OPTIONAL
        !iv_value2      TYPE clike OPTIONAL
        !iv_is_input2   TYPE abap_bool DEFAULT abap_true
        !iv_tab3        TYPE clike OPTIONAL
        !iv_field3      TYPE clike OPTIONAL
        !iv_value3      TYPE clike OPTIONAL
        !iv_is_input3   TYPE abap_bool DEFAULT abap_true
        !iv_tab4        TYPE clike OPTIONAL
        !iv_field4      TYPE clike OPTIONAL
        !iv_value4      TYPE clike OPTIONAL
        !iv_is_input4   TYPE abap_bool DEFAULT abap_true
        !iv_tab5        TYPE clike OPTIONAL
        !iv_field5      TYPE clike OPTIONAL
        !iv_value5      TYPE clike OPTIONAL
        !iv_is_input5   TYPE abap_bool DEFAULT abap_true
      EXPORTING
        !ev_user_cancel TYPE abap_bool
        !ev_value1      TYPE clike
        !ev_value2      TYPE clike
        !ev_value3      TYPE clike
        !ev_value4      TYPE clike
        !ev_value5      TYPE clike
      RAISING
        cx_t100_msg .

    METHODS: popup_table
      IMPORTING
        VALUE(it_table) TYPE STANDARD TABLE
      RAISING
        cx_t100_msg ,

    popup_table_a_select_Entry
      IMPORTING
        VALUE(it_table) TYPE STANDARD TABLE
       returning
        value(rv_index) type i
      RAISING
        cx_t100_msg ,

      popup_xml
        IMPORTING
          iv_xml    TYPE any
          iv_is_zip TYPE abap_bool DEFAULT abap_false
        RAISING
          cx_t100_msg,

      popup_stringtab
        IMPORTING
          it_stringtab TYPE stringtab
        RAISING
          cx_t100_msg,

      popup_button_choice
        IMPORTING
          it_descr         TYPE stringtab
        RETURNING
          VALUE(rv_result) TYPE i,

      popup_t_bapiret2
        IMPORTING
          it_bapiret     TYPE bapiret2_tab
          iv_show_simple TYPE abap_bool DEFAULT abap_true
        RAISING
          cx_t100_msg,

      popup_t_balmt
        IMPORTING
          value(it_balmt)       TYPE balm_t
          iv_show_simple TYPE abap_bool DEFAULT abap_true
        RAISING
          cx_t100_msg.


METHODS popup_bal
      IMPORTING
        !iv_object    TYPE clike
        !iv_subobject TYPE clike
        !iv_extnumber TYPE clike OPTIONAL
      RAISING
        cx_t100_msg .


*    METHODS:
*      display_log
*        IMPORTING
*          io_log       TYPE REF TO lcl_help_log
*          io_container TYPE REF TO cl_gui_container OPTIONAL
*               returning
*          value(ro_log_gui) type ty_s_type-o_help_popup_log
*              RAISING
*          cx_t100_msg.

*      popup_log
*        IMPORTING
*          io_log       TYPE REF TO lcl_help_log
*          iv_is_amodal TYPE abap_bool DEFAULT abap_false
*          returning
*          value(ro_log_gui) type ty_s_type-o_help_popup_log
*        RAISING
*          cx_t100_msg.






    METHODS message_popup
      IMPORTING
        !iv_text TYPE clike
        !iv1     TYPE clike
        !iv2     TYPE clike OPTIONAL
        !iv3     TYPE clike OPTIONAL
        !iv4     TYPE clike OPTIONAL
        !iv5     TYPE clike OPTIONAL
        !iv6     TYPE clike OPTIONAL
        !iv_type TYPE clike DEFAULT 'I' .
    METHODS message_status
      IMPORTING
        !iv_msgno TYPE simple OPTIONAL
        !iv_msgid TYPE clike OPTIONAL
        !iv_text  TYPE clike OPTIONAL
        !iv1      TYPE clike OPTIONAL
        !iv2      TYPE clike OPTIONAL
        !iv3      TYPE clike OPTIONAL
        !iv4      TYPE clike OPTIONAL
        !iv_type  TYPE clike DEFAULT 'I' .
    METHODS message_sy
      IMPORTING
        !iv_sy   TYPE syst DEFAULT sy
        !iv_type TYPE clike OPTIONAL .
    METHODS set_title
      IMPORTING
        !iv_msgid       TYPE clike OPTIONAL
        !iv_msgno       TYPE simple OPTIONAL
        VALUE(iv_title) TYPE clike OPTIONAL
      RAISING
        cx_t100_msg .
    METHODS set_statusbar
      IMPORTING
        !iv_name_status  TYPE clike
        !iv_name_program TYPE clike .
    METHODS set_progressbar
      IMPORTING
        !iv_msgno      TYPE simple OPTIONAL
        !iv_msgid      TYPE clike OPTIONAL
        !iv_text       TYPE clike OPTIONAL
        !iv1           TYPE clike OPTIONAL
        !iv2           TYPE clike OPTIONAL
        !iv3           TYPE clike OPTIONAL
        !iv4           TYPE clike OPTIONAL
        !iv_percentage TYPE clike DEFAULT '100' .

    METHODS call_transaction
      IMPORTING
        !iv_transaction_name TYPE clike
        !iv_field1_name      TYPE clike OPTIONAL
        !iv_field1_value     TYPE clike OPTIONAL
        !iv_field2_name      TYPE clike OPTIONAL
        !iv_field2_value     TYPE clike OPTIONAL
        !iv_field3_name      TYPE clike OPTIONAL
        !iv_field3_value     TYPE clike OPTIONAL
      RAISING
        cx_t100_msg .

    METHODS data_upload .
    METHODS data_download .
    METHODS popup_exception_resumable
      IMPORTING
        !i_lx_t100          TYPE REF TO cx_root
      RETURNING
        VALUE(rv_is_resume) TYPE abap_bool .
    CLASS-METHODS class_constructor .
    METHODS popup_data .
    METHODS display_f4_help
      IMPORTING
        !iv_name_search_help TYPE string
        !iv_name_field       TYPE string
      RETURNING
        VALUE(rv_resault)    TYPE string .
    METHODS selscrn_load_variant
      IMPORTING
        iv_repid TYPE sy-repid DEFAULT sy-repid
        iv_name  TYPE string
      RAISING
        cx_t100_msg.
  PROTECTED SECTION.


    CLASS-METHODS on_link_click
          FOR EVENT link_click OF cl_salv_events_table
      IMPORTING
          !column
          !row
          !sender .

*    CLASS-DATA so_help TYPE ty_s_gui_type-o_help_factory.

    METHODS on_double_click
          FOR EVENT double_click OF cl_salv_events_table
      IMPORTING
          !column
          !row
          !sender .


    CLASS-METHODS: handle_close
                  FOR EVENT close OF cl_gui_dialogbox_container
      IMPORTING sender.

    CLASS-DATA:
*      so_help_display_log TYPE ty_s_type-o_help_popup_log,
      sv_index            TYPE i.
    "-REF TO lcl_help_gui_disp_log.


ENDCLASS.                    "lcl_help_gui DEFINITION


*
**----------------------------------------------------------------------*
**       CLASS lcl_help_gui_disp_log  DEFINITIO
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
*CLASS lcl_help_gui_disp_log DEFINITION
* CREATE PUBLIC INHERITING FROM lcl_help_base.
*
*  PUBLIC SECTION.
*
**    INTERFACES zif_034tpp_help.
*
**    ALIASES ty_s_type
**      FOR zif_034tpp_help~ty_s_types .
*
*    TYPES:
*      BEGIN OF ty_s_output,
*        type      TYPE string,
*        text      TYPE string,
*        icon_info TYPE string,
*        datu      TYPE sy-datum,
*        uzeit     TYPE sy-uzeit,
**        stack  TYPE string,
**        code   TYPE string,
**        x_root       TYPE REF TO cx_root,
**        is_add_into  type string,
**        t_add_info   TYPE bapiret2_tab,
**        t_add_string TYPE stringtab,
*        t_colour  TYPE lvc_t_scol,
*        celltype  TYPE salv_t_int4_column,
*      END OF ty_s_output .
*    TYPES:
*      ty_t_output TYPE STANDARD TABLE OF ty_s_output WITH DEFAULT KEY .
*    TYPES ty_o_log TYPE REF TO lcl_help_log .
*
*    DATA mv_last_ucomm TYPE string .
*    DATA mo_log TYPE ty_o_log READ-ONLY .
*    DATA mo_cont TYPE REF TO cl_gui_container READ-ONLY .
*    DATA mo_alv TYPE REF TO cl_salv_table READ-ONLY .
*    DATA mt_output TYPE ty_t_output READ-ONLY .
*
*    EVENTS close .
*
**    CLASS-METHODS class_constructor .
*    METHODS constructor
*      IMPORTING
*        !iv_type      TYPE i DEFAULT cl_gui_container=>container_type_docking
*        !iv_repid     TYPE clike OPTIONAL
*        !iv_dynnr     TYPE simple OPTIONAL
*        !iv_side      TYPE i DEFAULT cl_gui_docking_container=>dock_at_bottom
*        !io_container TYPE REF TO cl_gui_container OPTIONAL
*        iv_is_popup   TYPE abap_bool DEFAULT abap_false
*      RAISING
*        cx_salv_msg
*        cx_t100_msg .
*    METHODS display
*      IMPORTING
*        !it_bapiret2_tab TYPE bapiret2_tab OPTIONAL
*        !io_log          TYPE ty_o_log .
*    METHODS cfw_free
*      RAISING
*        cx_t100_msg .
*    METHODS cfw_init
*      IMPORTING
*        !io_container TYPE REF TO cl_gui_container
*      RAISING
*        cx_t100_msg.
*    METHODS on_new_entry
*         FOR EVENT new_entry OF lcl_help_log.
*  PROTECTED SECTION.
*
*    CONSTANTS:
*      BEGIN OF cs_ucomm,
*        close  TYPE string VALUE 'CLOSE',
*        delete TYPE string VALUE 'DELETE',
*      END OF cs_ucomm .
*
**    CLASS-DATA so_help TYPE REF TO lcl_help_factory_gui.
*
*    METHODS init_table .
*    METHODS init_alv
*      RAISING
*        cx_t100_msg .
*    METHODS on_added_function
*          FOR EVENT added_function OF cl_salv_events
*      IMPORTING
*          !e_salv_function
*          !sender .
*    METHODS on_link_click
*          FOR EVENT link_click OF cl_salv_events_table
*      IMPORTING
*          !column
*          !row
*          !sender .
*    METHODS on_before_salv_function
*          FOR EVENT before_salv_function OF cl_salv_events_table
*      IMPORTING
*          !e_salv_function
*          !sender .
*  PRIVATE SECTION.
*ENDCLASS.                    "lcl_help_gui_disp_log  DEFINITIO
*

*----------------------------------------------------------------------*
*       CLASS lcl_help_gui_popup_error  DEFINITIO
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_gui_popup_error DEFINITION INHERITING FROM lcl_help_base
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ty_s_output,
        descr  TYPE c LENGTH 700,
        info   TYPE string,
*        code   TYPE string,
        x_root TYPE REF TO cx_root,
      END OF ty_s_output .
    TYPES:
      ty_t_output TYPE STANDARD TABLE OF ty_s_output WITH DEFAULT KEY .

    CONSTANTS:
      BEGIN OF cs_answer,
        retry  TYPE string VALUE 'RETRY',
        resume TYPE string VALUE 'RESUME',
      END OF cs_answer .
    DATA mv_last_ucomm TYPE string .
    DATA mx_input TYPE REF TO cx_root READ-ONLY .
    DATA mo_cont TYPE REF TO cl_gui_container READ-ONLY .
    DATA mo_alv TYPE REF TO cl_salv_table READ-ONLY .
    DATA mt_output TYPE ty_t_output READ-ONLY .
    DATA:
      BEGIN OF ms_control,
        is_exit TYPE abap_bool,
      END OF ms_control .

    METHODS constructor
      IMPORTING
        !io_cont     TYPE REF TO cl_gui_container OPTIONAL
        !iv_is_popup TYPE abap_bool DEFAULT abap_true
      RAISING
        cx_salv_msg .
    METHODS display
      IMPORTING
        !ix_error TYPE REF TO cx_root .

  PROTECTED SECTION.

    METHODS init_table .
    METHODS init_alv .
    METHODS on_added_function
          FOR EVENT added_function OF cl_salv_events
      IMPORTING
          !e_salv_function
          !sender .
    METHODS on_link_click
          FOR EVENT link_click OF cl_salv_events_table
      IMPORTING
          !column
          !row
          !sender .
    METHODS on_before_salv_function
          FOR EVENT before_salv_function OF cl_salv_events_table
      IMPORTING
          !e_salv_function
          !sender .
  PRIVATE SECTION.
ENDCLASS.                    "lcl_help_gui_popup_error  DEFINITIO


*CLASS lcl_help_factory_gui IMPLEMENTATION.
**
*  METHOD class_constructor.
*    CREATE OBJECT so_help_sapgui.
*  ENDMETHOD.                    "class_constructor
**
*ENDCLASS.                    "lcl_help_factory_gui IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_help_gui_popup_error IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_gui_popup_error IMPLEMENTATION.


*  METHOD class_constructor.

*
*    CREATE OBJECT so_help.
*    CREATE OBJECT so_help_gui.


*  ENDMETHOD.                    "class_constructor


  METHOD constructor.
    super->constructor(  ).

*        try.

    IF io_cont IS BOUND.

      mo_cont = io_cont.

          cl_salv_table=>factory(
        EXPORTING
*        list_display   = IF_SALV_C_BOOL_SAP=>FALSE    " ALV Displayed in List Mode
          r_container    = mo_cont     " Abstract Container for GUI Controls
*        container_name =
        IMPORTING
          r_salv_table   = mo_alv    " Basis Class Simple ALV Tables
        CHANGING
          t_table        = mt_output
      ).

    ELSE.



      cl_salv_table=>factory(
        IMPORTING
          r_salv_table   = mo_alv    " Basis Class Simple ALV Tables
        CHANGING
          t_table        = mt_output
      ).

      IF iv_is_popup = abap_true.

        mo_alv->set_screen_popup(
            EXPORTING
        start_column = '10'
        end_column   = '120'
        start_line   =  '10'
        end_line     = '25' ).

      ENDIF.

    ENDIF.

    init_alv( ).


  ENDMETHOD.                    "constructor


  METHOD display.


    mx_input = ix_error.

    ms_control-is_exit = abap_false.
*    while ms_control-is_exit = abap_false.
    init_table( ).
    mo_alv->display( ).


  ENDMETHOD.                    "display


  METHOD init_alv.


    TRY.

        """"""""""""""""""""""""""""""""""""""""""""""
        " Layoutverwaltung

*    DATA: go_layout     TYPE REF TO cl_salv_layout.
*    DATA: gs_layout_key TYPE salv_s_layout_key.
*    "Objekt zur Verwaltung der Layouts generieren
*    go_layout = mo_alv->get_layout( ).
*    "Layoutschluessel mit Programmnamen belegen
*    gs_layout_key-report = sy-repid.
*    gs_layout_key-handle = 'E_POPUP'.
*    "Schluessel an ALV uebergeben
*    go_layout->set_key( gs_layout_key ).
*
*    "fuer eigenen und fuer andere User
*    go_layout->set_save_restriction( if_salv_c_layout=>restrict_none ).


        """"""""""""""""""""""""""""""""""""""""""""""
        " Toolbar setzten

        "Default setzt im Gegensatz zu All nur
        "Filter, Sortieren und Exportieren
*    mo_alv->get_functions( )->set_default(
*      value = if_salv_c_bool_sap=>true ).

        "GEht nur im Popup
*    IF mo_cont IS NOT BOUND.
*      mo_alv->get_functions( )->set_group_layout(
*          value = if_salv_c_bool_sap=>true ).
*    ENDIF.

*Passende Icons können in der SAP Tabelle "Icon" gesucht werden oder unter folgendem Link:
*https://experience.sap.com/files/guidelines/icons_sap/index.htm
        "Button1 hinzufuegen

*
*    TRY.
*        mo_alv->get_functions( )->add_function(
*        name =    'Stack' "Funktionscode
*        icon =    '@2U@' "Irgendein ICON aus Tabelle ICON
*        text =    'Stack zeigen'
*        tooltip = 'Hinzugefügte Funktion1'
*        position = if_salv_c_function_position=>right_of_salv_functions ).
*      CATCH cx_salv_existing.
*        "Fehlerbehandlung
*      CATCH cx_salv_wrong_call.
*        "Fehlerbehandlung
*    ENDTRY.
*
*    TRY.
*        mo_alv->get_functions( )->add_function(
*        name =    'Retry' "Funktionscode
*        icon =    '@2U@' "Irgendein ICON aus Tabelle ICON
*        text =    'Eigener Button1'
*        tooltip = 'Retry'
*        position = if_salv_c_function_position=>right_of_salv_functions ).
*      CATCH cx_salv_existing.
*        "Fehlerbehandlung
*      CATCH cx_salv_wrong_call.
*        "Fehlerbehandlung
*    ENDTRY.
*
*    SET HANDLER on_added_function FOR mo_alv->get_event( ) .


        """"""""""""""""""""""""""""""""""""""""""""""
        " Spalteneigenschaften

        DATA: go_column TYPE REF TO cl_salv_columns_table,
              lo_event  TYPE REF TO cl_salv_events_table.

        lo_event = mo_alv->get_event( ).
        SET HANDLER on_link_click
         FOR lo_event.

        DATA:  go_col_tab  TYPE REF TO cl_salv_column_table.
*    DATA:  go_col_tab  TYPE REF TO cl_salv_column_list.
        TRY.
            "Spalte holen
            go_column ?= mo_alv->get_columns( ).
            go_col_tab ?= go_column->get_column( 'STACK' ).
            "Hotspot aktivieren
            go_col_tab->set_cell_type( value = if_salv_c_cell_type=>hotspot ).
          CATCH cx_salv_not_found.
            "Fehlerbehandlung
          CATCH cx_salv_data_error.
            "Fehlerbehandlung
        ENDTRY.
*
*   mo_alv->get_columns( )->set_optimize( abap_true ).


        go_col_tab ?= go_column->get_column( 'INFO' ).
        go_col_tab->set_icon( if_salv_c_bool_sap=>true ).
        go_col_tab->set_cell_type( value = if_salv_c_cell_type=>hotspot ).
        go_col_tab->set_output_length( 2 ).

*    go_column ?= mo_alv->get_columns( )->get_column( 'CODE' ).
*    go_column->set_icon( if_salv_c_bool_sap=>true ).
*    go_column->set_output_length( 5 ).

        go_col_tab ?= go_column->get_column( 'DESCR' ).
*    go_column->set_cell_type( value = if_salv_c_cell_type=>hotspot ).
        go_col_tab->set_output_length( 94 ).


        SET HANDLER on_before_salv_function
            FOR lo_event.

        """"""""""""""""""""""""""""""""""""""""""""""
        " Sonstiges

        "Ueberschrift festlegen
        DATA:
              lo_display TYPE REF TO cl_salv_display_settings.

        lo_display = mo_alv->get_display_settings( ).
        lo_display->set_list_header( 'Fehlerprotokoll' ).
        "Groesse der Ueberschrift (aendert sich nur bei ALV im Container)
        lo_display->set_list_header_size( cl_salv_display_settings=>c_header_size_small ).

      CATCH cx_salv_not_found.

    ENDTRY.

  ENDMETHOD.                    "init_alv


  METHOD init_table.


    DATA:
      lx_error        TYPE REF TO cx_root,
      lx_t100         TYPE ty_s_type-x_help_error, " REF TO lcx_help_error,
      lv_blanks       TYPE string,
      lv_repid        TYPE syrepid,
      lv_include      TYPE syrepid,
      lv_line         TYPE i,
      lv_repid_prev   TYPE syrepid,
      lv_include_prev TYPE syrepid,
      lv_line_prev    TYPE i,
      lv_counter      TYPE i.

    FIELD-SYMBOLS:
    <ls_output> TYPE ty_s_output.

    lx_error = mx_input.

*    WHILE lx_error IS BOUND.
*
*      "Standardinfos
*      APPEND INITIAL LINE TO mt_output ASSIGNING <ls_output>.
*      <ls_output>-x_root = lx_error.
*      <ls_output>-descr  = lx_error->get_text(  ).
*      CONCATENATE lv_blanks ' ' <ls_output>-descr INTO <ls_output>-descr RESPECTING BLANKS.
*      <ls_output>-info   = icon_display.
*
*      TRY.
*          lx_t100 ?= lx_error.
**          <ls_output>-stack = icon_controlling_area. "lines( lx_t100->mt_stack ).
*          "Hotspot Stack aktivieren
*
*        CATCH cx_root.
*      ENDTRY.
*
*      lx_error = lx_error->previous.
*      CONCATENATE lv_blanks '>' INTO lv_blanks.
*    ENDWHILE.

    CONCATENATE '|' '  ' INTO lv_blanks RESPECTING BLANKS.
*    lv_blanks = | '.

    WHILE lx_error IS BOUND.

      "Standardinfos
      APPEND INITIAL LINE TO mt_output ASSIGNING <ls_output>.
      <ls_output>-x_root = lx_error.
      <ls_output>-descr  = lx_error->get_text(  ).
      CONCATENATE lv_blanks <ls_output>-descr INTO <ls_output>-descr RESPECTING BLANKS.
      <ls_output>-info   = icon_display.

      TRY.
          lx_t100 ?= lx_error.

          FREE lv_counter.
          IF lx_t100->mv_xml IS NOT INITIAL.
            ADD 1 TO lv_counter.
          ENDIF.


          IF lx_t100->mt_bapiret IS NOT INITIAL.
            ADD 1 TO lv_counter.
          ENDIF.

          IF lx_t100->mt_write IS NOT INITIAL.
            ADD 1 TO lv_counter.
          ENDIF.

          IF lv_counter > 0.
            CONCATENATE <ls_output>-descr '[' INTO <ls_output>-descr SEPARATED BY ' '.

            DO lv_counter TIMES.
              CONCATENATE <ls_output>-descr '+' INTO <ls_output>-descr.
            ENDDO.
            CONCATENATE <ls_output>-descr ']' INTO <ls_output>-descr.

          ENDIF.

*          <ls_output>-stack = icon_controlling_area. "lines( lx_t100->mt_stack ).
          "Hotspot Stack aktivieren

        CATCH cx_root.
      ENDTRY.

      lx_error->get_source_position(
        IMPORTING
          program_name = lv_repid    " ABAP Program: Current Main Program
          include_name = lv_include
          source_line  = lv_line
      ).

      IF lx_error->previous IS BOUND.
        lx_error->previous->get_source_position(
          IMPORTING
            program_name = lv_repid_prev    " ABAP Program: Current Main Program
            include_name = lv_include_prev
            source_line  = lv_line_prev
        ).
      ENDIF.

      lx_error = lx_error->previous.

      IF lv_repid = lv_repid_prev AND lv_include = lv_include_prev AND lv_line = lv_line_prev.
      ELSE.
        CONCATENATE lv_blanks '   ' INTO lv_blanks RESPECTING BLANKS.
      ENDIF.
    ENDWHILE.

*             APPEND INITIAL LINE TO mt_output ASSIGNING <ls_output>.
    APPEND INITIAL LINE TO mt_output ASSIGNING <ls_output>.
    <ls_output>-info   = icon_customer.



  ENDMETHOD.                    "init_table


  METHOD on_added_function.


    mv_last_ucomm = e_salv_function.

    CASE e_salv_function.
      WHEN 'STACK'.

        "popup stack

      WHEN 'BTN2'.
        MESSAGE 'Button2 gedrueckt.' TYPE 'I'.
      WHEN 'BTN3'.
        MESSAGE 'Button3 gedrueckt.' TYPE 'I'.
      WHEN 'BTN4'.
        MESSAGE 'Button3 gedrueckt mit geandertem Funktionscode.' TYPE 'I'.
    ENDCASE.


  ENDMETHOD.                    "on_added_function


  METHOD on_before_salv_function.




*break-point.
*    break-point.
    CASE e_salv_function.

      WHEN '&OL0'.



      WHEN '&ONT'.
        ms_control-is_exit = abap_true.

    ENDCASE.


  ENDMETHOD.                    "on_before_salv_function


  METHOD on_link_click.


    DATA:
      lv_progname  TYPE syrepid,
      lv_incl_name TYPE syrepid,
      lv_line      TYPE i.


    DATA:
      lt_tab    TYPE STANDARD TABLE OF char120,
      lv_tabix  TYPE i,
      ls_output TYPE ty_s_output.

    READ TABLE mt_output INDEX row
        INTO ls_output.

    IF ls_output-info = icon_customer.



      APPEND '1. Retry :  Der betroffene Codeabschnitt wird erneut durchlaufen.' TO lt_tab.
      APPEND '2. Save  :  Fehler für spätere Analyse abspeichern.' TO lt_tab.
      APPEND '3. Info  :  Nachrichtenklasse / Nr einblenden' TO lt_tab.
      APPEND '4. Add1  :  Instanz anzeigen u debuggen' TO lt_tab.
      APPEND '5. Add2  :  Resume' TO lt_tab.

      DO.
        CALL FUNCTION 'POPUP_WITH_TABLE_DISPLAY'
          EXPORTING
            endpos_col   = 70
            endpos_row   = 15
            startpos_col = 1
            startpos_row = 1
            titletext    = 'Welche Aktion soll ausgeführt werden?'
          IMPORTING
            choise       = lv_tabix
          TABLES
            valuetab     = lt_tab
          EXCEPTIONS
            break_off    = 1
            OTHERS       = 2.
        IF sy-subrc = 1.
          EXIT.
        ENDIF.

        CASE lv_tabix.
          WHEN 1.  "Codingstelle
*          mv_last_ucomm = cs_answer-retry.
*          LEAVE TO SCREEN 0.
          WHEN 2. "Stack aufrufen

            DATA:
              lt_stringtab TYPE stringtab,
              lv_id        TYPE i.
            mo_help->so_gui->popup_change_text(
     EXPORTING
       iv_title       = 'Bitte Beschreibungstext eingeben:'
     IMPORTING
       rt_text        = lt_stringtab
   ).

*          lv_id =    so_help->so_abap->data_save( i_any = mx_input it_descr = lt_stringtab ).

            TRY.

                mo_help->so_gui->popup_inform(
*            EXPORTING
*              iv_msgid =
*              iv_msgno =
                    iv_v1    = lv_id
*              iv_v2    =
*              iv_v3    =
*              iv_v4    =
                    iv_text  = 'Fehler wurde unter ID &1 abgespeichert.'
*              sy       =
                ).

*          so_help_gui->popup_table( it_table = lx_t100->mt_stack ).
              CATCH cx_t100_msg.    "
            ENDTRY.

          WHEN 3. "Bapiret einbleneden

            DATA:
                    lt_bapiret TYPE bapiret2_tab.

            lt_bapiret = mo_help->so_txt->bapirettab_get_by_any(  mx_input ).
            mo_help->so_gui->popup_table(  lt_bapiret ).



          WHEN 4. "instanz erzeugen

            DATA:
*              ls_serial TYPE ty_s_type-s_name_value_pairs_serialtab,
              li_serial TYPE REF TO if_serializable_object.
*       LV_I TYPE I:

            FIELD-SYMBOLS:
                           <lv_string> TYPE string.

            TRY.

*    lx_error ?= mx_input.

                ASSIGN mx_input->('MV_XML') TO <lv_string>.

                IF sy-subrc = 0.

                  mo_help->so_data->trans_xml_zip_2_any(
                     EXPORTING
                       iv_string  = <lv_string> "lx_error->mv_serial_xml
                     IMPORTING
                       e_any       = li_serial  ).

                  BREAK-POINT.

                ENDIF.
              CATCH cx_root.
            ENDTRY.


          WHEN 5.

            TRY.

*    lx_error ?= mx_input.

                ASSIGN mx_input->('MV_XML') TO <lv_string>.

                IF sy-subrc = 0.

                  mo_help->so_data->trans_xml_zip_2_any(
                     EXPORTING
                       iv_string  = <lv_string> "lx_error->mv_serial_xml
                     IMPORTING
                       e_any       = li_serial  ).

                  BREAK-POINT.

                  DATA:
                        lo_request TYPE REF TO object.

                  lo_request ?= li_serial.

*lo_request->start_a_serial( ).
                  CALL METHOD lo_request->('START_A_SERIAL').

                ENDIF.
              CATCH cx_root.
            ENDTRY.

        ENDCASE.
      ENDDO.

    ELSE.

      FIELD-SYMBOLS:
                     <lv_any> TYPE any. "abap_callstack.

      APPEND '1. Zur Codingstelle springen' TO lt_tab.
      TRY.
          ASSIGN ls_output-x_root->('MT_STACK') TO <lv_any>.
          IF sy-subrc = 0.
            APPEND '2. Callstack anzeigen' TO lt_tab.
          ENDIF.
        CATCH cx_root.
      ENDTRY.

      TRY.
          ASSIGN ls_output-x_root->('MV_XML') TO <lv_any>.
          IF sy-subrc = 0.
            APPEND '2. XML Daten anzeigen' TO lt_tab.
          ENDIF.
        CATCH cx_root.
      ENDTRY.

      DO.

        CALL FUNCTION 'POPUP_WITH_TABLE_DISPLAY'
          EXPORTING
            endpos_col   = 50
            endpos_row   = 15
            startpos_col = 1
            startpos_row = 1
            titletext    = 'Welche Aktion soll ausgeführt werden?'
          IMPORTING
            choise       = lv_tabix
          TABLES
            valuetab     = lt_tab
          EXCEPTIONS
            break_off    = 1
            OTHERS       = 2.
        IF sy-subrc = 1.
          EXIT.
        ENDIF.
        CASE lv_tabix.
          WHEN 1.  "Codingstelle
            ls_output-x_root->get_source_position( IMPORTING
                                                program_name = lv_progname    " ABAP-Programm, aktuelles Rahmenprogramm
                                                include_name = lv_incl_name
                                                source_line  = lv_line  ).

            PERFORM call_editor IN PROGRAM sapms380 USING lv_progname
                                  lv_incl_name
                                  lv_line.


          WHEN 2. "Stack aufrufen
            TRY.
                ASSIGN ls_output-x_root->('MT_STACK') TO <lv_any>.
                IF sy-subrc = 0.
                  mo_help->so_gui->popup_table( it_table = <lv_any> ).
*          APPEND '2. Callstack anzeigen' TO lt_tab.
                ENDIF.

              CATCH cx_t100_msg.    "
            ENDTRY.

          WHEN 3.
            TRY.
                ASSIGN ls_output-x_root->('MV_XML') TO <lv_any>.
                IF sy-subrc = 0.
                  mo_help->so_gui->popup_xml(
                    EXPORTING
                      iv_xml      = <lv_any>
                      iv_is_zip   = abap_true
                  ).
                ENDIF.
              CATCH cx_root.
            ENDTRY.

        ENDCASE.
      ENDDO.
    ENDIF.


  ENDMETHOD.                    "on_link_click
ENDCLASS.                    "lcl_help_gui_popup_error IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_help_gui_cfw DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_gui_cfw DEFINITION INHERITING FROM lcl_help_base.

  PUBLIC SECTION.

*
*    INTERFACES:
*      lif_help_top_base.
*
*    ALIASES:
*        ty_s_type FOR lif_help_top_base~ty_s_types.

    METHODS:

*      constructor,

      display_popup,

      cfw_get_splitter
        IMPORTING
          io_parent        TYPE REF TO cl_gui_container
          iv_rows          TYPE i
          iv_cols          TYPE i
        RETURNING
          VALUE(ro_result) TYPE REF TO cl_gui_splitter_container,

      cfw_get_custom_container
        IMPORTING
          !iv_repid                TYPE clike DEFAULT ''
          !iv_dynnr                TYPE simple DEFAULT ''
          !iv_name                 TYPE clike DEFAULT ''
        RETURNING
          VALUE(ro_cust_container) TYPE REF TO cl_gui_custom_container
        RAISING
          cx_t100_msg,

      cfw_get_container
        IMPORTING
          !iv_type            TYPE i DEFAULT cl_gui_container=>container_type_docking
          !iv_repid           TYPE sy-repid DEFAULT sy-repid
          !iv_dynnr           TYPE simple OPTIONAL
          !iv_side            TYPE i DEFAULT cl_gui_docking_container=>dock_at_bottom
        RETURNING
          VALUE(ro_container) TYPE REF TO cl_gui_container
        RAISING
          cx_t100_msg,


      "! Sucht alle Attribute vom Typ Control des Objekts, dann wird Sichtbarkeit geaendert
      set_controls_visible
        IMPORTING
          iv_visible TYPE abap_bool DEFAULT abap_true
          io_object  TYPE REF TO object,

      free_all_attributes
        IMPORTING
          io_object TYPE REF TO object,

      put_to_clipboard
        IMPORTING
          iv_row1 TYPE clike
          iv_row2 TYPE clike
          iv_row3 TYPE clike
          iv_row4 TYPE clike
        RAISING
          cx_t100_msg,

      get_from_clipboard
        RETURNING
          VALUE(rv_text) TYPE string.


  PROTECTED SECTION.

*    DATA:
*    mo_help TYPE type-o_help_factory_base.

ENDCLASS.                    "lcl_help_gui_cfw DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_help_gui_cfw IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_gui_cfw IMPLEMENTATION.

*  METHOD constructor.
*
*    CREATE OBJECT mo_help.
*
*  ENDMETHOD.                    "constructor

  METHOD get_from_clipboard.

*  *
*TYPES:
*  BEGIN OF ty_data,
*    fld1 TYPE char20,
*    fld2 TYPE char20,
*    fld3 TYPE char20,
*  END   OF ty_data.
*DATA: lt_data TYPE STANDARD TABLE OF ty_data.
*FIELD-SYMBOLS: <lfs_data>  LIKE LINE OF lt_data.
*
*START-OF-SELECTION.
*
** TO hold buffer from clipboard
*  TYPES:
*    BEGIN OF ty_clipdata,
*      DATA TYPE c LENGTH 500,
*    END   OF ty_clipdata.
*  DATA: lt_clipdata TYPE STANDARD TABLE OF ty_clipdata.
*  DATA: ls_clipdata LIKE LINE OF lt_clipdata.
*  DATA: lv_clip_len TYPE i.
*  CONSTANTS: c_tab  TYPE c VALUE cl_bcs_convert=>gc_tab.
** Split data to each field
*  DATA: lt_record TYPE STANDARD TABLE OF ty_clipdata.
*  DATA: ls_record LIKE LINE OF lt_record.
*  FIELD-SYMBOLS: <lfs_field> TYPE ANY.
**------------
** Import data from Clipboard
**------------
*  cl_gui_frontend_services=>clipboard_import(
*    IMPORTING
*       DATA                 = lt_clipdata
*       LENGTH               = lv_clip_len
*     EXCEPTIONS
*       cntl_error           = 1
*       error_no_gui         = 2
*       not_supported_by_gui = 3
*       OTHERS               = 4 ).
*  IF sy-subrc NE 0.
*    MESSAGE 'Error while importing data from clipboard' TYPE 'I'.
*    EXIT.
*  ENDIF.
**---- Split data to respective field and
**---- populate the data in table
*  LOOP AT lt_clipdata INTO ls_clipdata.
*    SPLIT ls_clipdata AT c_tab
*      INTO TABLE lt_record.
*    APPEND INITIAL LINE TO lt_data ASSIGNING <lfs_data>.
*    LOOP AT lt_record INTO ls_record.
*      ASSIGN COMPONENT sy-tabix
*        OF STRUCTURE <lfs_data> TO <lfs_field>.
*      IF sy-subrc EQ 0.
*        <lfs_field> = ls_record-DATA.
*      ENDIF.
*    ENDLOOP.
*  ENDLOOP.
**
** write it back for demo
*  LOOP AT lt_data ASSIGNING <lfs_data>.
*    WRITE: / <lfs_data>-fld1,
*             <lfs_data>-fld2,
*             <lfs_data>-fld3.
*  ENDLOOP.

  ENDMETHOD.                    "get_from_clipboard


  METHOD put_to_clipboard.

    TYPES:
      BEGIN OF ty_clipdata,
        data TYPE c LENGTH 500,
      END   OF ty_clipdata.

    DATA: lt_clipdata TYPE STANDARD TABLE OF ty_clipdata,
          ls_clipdata LIKE LINE OF lt_clipdata.
    DATA: lv_rc TYPE i.

    ls_clipdata-data = iv_row1.
    APPEND ls_clipdata TO lt_clipdata.
    ls_clipdata-data = iv_row2.
    APPEND ls_clipdata TO lt_clipdata.
    ls_clipdata-data = iv_row3.
    APPEND ls_clipdata TO lt_clipdata.
    ls_clipdata-data = iv_row4.
    APPEND ls_clipdata TO lt_clipdata.


    cl_gui_frontend_services=>clipboard_export(
      IMPORTING
        data                 = lt_clipdata
      CHANGING
        rc                   = lv_rc
      EXCEPTIONS
        cntl_error           = 1
        error_no_gui         = 2
        not_supported_by_gui = 3
        no_authority         = 4
        OTHERS               = 5 )
            .
    IF sy-subrc <> 0.
*      DATA(lx_error) = so_hlp->so_cx_t100->factory_any(  sy ).
*      RAISE EXCEPTION lx_error.
    ENDIF.

  ENDMETHOD.                    "put_to_clipboard



  METHOD set_controls_visible.

    DATA:
      lo_control TYPE REF TO cl_gui_control.

    DATA: lo_classdescr TYPE REF TO cl_abap_classdescr,
          ls_attr       TYPE LINE OF abap_attrdescr_tab.

    FIELD-SYMBOLS:
         <fs_attr> TYPE any.

    lo_classdescr ?=  cl_abap_objectdescr=>describe_by_object_ref( io_object ).


    LOOP AT lo_classdescr->attributes INTO ls_attr
        WHERE type_kind = cl_abap_typedescr=>typekind_oref
        AND   is_class  = abap_false.

      ASSIGN io_object->(ls_attr-name) TO <fs_attr>.

      CHECK <fs_attr> IS ASSIGNED AND <fs_attr> IS BOUND.

      TRY.
          lo_control ?= <fs_attr>.
          IF lo_control IS BOUND.
            lo_control->set_visible( visible = iv_visible ).
          ENDIF.

        CATCH cx_sy_move_cast_error.
          CONTINUE.
      ENDTRY.

    ENDLOOP.

  ENDMETHOD.                    "set_controls_visible

  METHOD display_popup.



  ENDMETHOD.                    "display_popup


  METHOD cfw_get_splitter.

    CREATE OBJECT ro_result
      EXPORTING
        parent  = io_parent
        rows    = iv_rows
        columns = iv_cols
        align   = 15. " (splitter fills the hole custom container)
**   get part of splitter container for 1st table


  ENDMETHOD.                    "cfw_get_splitter

  METHOD cfw_get_container.


    DATA:
      lo_dock  TYPE REF TO cl_gui_docking_container,
      lo_dialog type ref to cl_gui_dialogbox_container,
      lv_repid TYPE syrepid,
      lv_dynnr TYPE sy-dynnr.

    lv_dynnr = iv_dynnr.
    lv_repid = iv_repid.

    CASE iv_type.

      WHEN cl_gui_container=>container_type_docking.

        CREATE OBJECT lo_dock
          EXPORTING
*           parent                      =     " Parent container
            repid                       = lv_repid    " Report to Which This Docking Control is Linked
            dynnr                       = lv_dynnr   " Screen to Which This Docking Control is Linked
            side                        = iv_side    " Side to Which Control is Docked
            extension                   = 100    " Control Extension
*           style                       =     " Windows Style Attributes Applied to This Docking Container
*           lifetime                    = LIFETIME_DEFAULT    " Lifetime
*           caption                     =     " Caption
*           metric                      = 0    " Metric
*           ratio                       =     " Percentage of Screen: Takes Priority Over EXTENSION
*           no_autodef_progid_dynnr     =     " Don't Autodefined Progid and Dynnr?
*           name                        =     " Name
          EXCEPTIONS
            cntl_error                  = 1
            cntl_system_error           = 2
            create_error                = 3
            lifetime_error              = 4
            lifetime_dynpro_dynpro_link = 5
            OTHERS                      = 6.
        mo_help->so_check_a_raise->sy_subrc_ne_null( is_sy = sy ).

   ro_container = lo_dock.

    when cl_gui_container=>container_type_dialogbox.

        create object lo_dialog
*          EXPORTING
*            parent                      =     " Parent container
*            width                       = 30    " Width of This Container
*            height                      = 30    " Height of This Container
*            style                       =     " Windows Style Attributes Applied to this Container
*            repid                       =     " Report to Which This Control is Linked
*            dynnr                       =     " Screen to Which the Control is Linked
*            lifetime                    = LIFETIME_DEFAULT    " Lifetime
*            top                         = 0    " Top Position of Dialog Box
*            left                        = 0    " Left Position of Dialog Box
*            caption                     =     " Dialog Box Caption
*            no_autodef_progid_dynnr     =     " Don't Autodefined Progid and Dynnr?
*            metric                      = 0    " Metric
*            name                        =     " Name
          EXCEPTIONS
            cntl_error                  = 1
            cntl_system_error           = 2
            create_error                = 3
            lifetime_error              = 4
            lifetime_dynpro_dynpro_link = 5
            event_already_registered    = 6
            error_regist_event          = 7
            others                      = 8.
               mo_help->so_check_a_raise->sy_subrc_ne_null( is_sy = sy ).

       ro_container = lo_dialog.

      WHEN OTHERS.
        mo_help->so_error->raise_text(  'Hier noch weiter progn!').

    ENDCASE.

  ENDMETHOD.                    "cfw_get_container


  METHOD cfw_get_custom_container.


    DATA:
      lv_name  TYPE char40,
      lv_repid TYPE char40,
      lv_dynnr TYPE char4.

    lv_name = iv_name.
    lv_dynnr = iv_dynnr.
    lv_repid = iv_repid.


    CREATE OBJECT ro_cust_container
      EXPORTING
*       parent                      =
        container_name              = lv_name
        repid                       = lv_repid
        dynnr                       = lv_dynnr
      EXCEPTIONS
        cntl_error                  = 1
        cntl_system_error           = 2
        create_error                = 3
        lifetime_error              = 4
        lifetime_dynpro_dynpro_link = 5
        OTHERS                      = 6.
    mo_help->so_check_a_raise->sy_subrc_ne_null( is_sy = sy ).


  ENDMETHOD.                    "cfw_get_custom_container

  METHOD free_all_attributes.

    DATA:
      lo_control TYPE REF TO cl_gui_control.

    DATA: lo_classdescr TYPE REF TO cl_abap_classdescr,
          ls_attr       TYPE LINE OF abap_attrdescr_tab.

    FIELD-SYMBOLS:
         <fs_attr> TYPE any.

    lo_classdescr ?=  cl_abap_objectdescr=>describe_by_object_ref( io_object ).


    LOOP AT lo_classdescr->attributes INTO ls_attr
        WHERE type_kind = cl_abap_typedescr=>typekind_oref
        AND   is_class  = abap_false.

      ASSIGN io_object->(ls_attr-name) TO <fs_attr>.

      CHECK <fs_attr> IS ASSIGNED AND <fs_attr> IS BOUND.

      TRY.
          lo_control ?= <fs_attr>.
          IF lo_control IS BOUND.
            lo_control->free(  ).
          ENDIF.

        CATCH cx_sy_move_cast_error.
          CONTINUE.
      ENDTRY.

    ENDLOOP.

  ENDMETHOD.                    "free_all_attributes

ENDCLASS.                    "lcl_help_gui_cfw IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_help_gui_alv DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_gui_alv DEFINITION INHERITING FROM cl_salv_model_base.

  PUBLIC SECTION.

    CLASS-METHODS:
      get_alv_from_salv
        IMPORTING
          io_model       TYPE REF TO cl_salv_model
        RETURNING
          VALUE(ro_grid) TYPE REF TO cl_gui_alv_grid,


      get_alv_info
        IMPORTING
          it_ref_table TYPE REF TO data
          io_alv       TYPE REF TO cl_gui_alv_grid
        EXPORTING
          et_filter    TYPE lvc_t_filt
          et_sort      TYPE lvc_t_sort
          et_fieldcat  TYPE lvc_t_fcat
          es_variant   TYPE disvariant
          es_layout    TYPE lvc_s_layo,

      update_fieldcat
        IMPORTING
          io_alv       TYPE REF TO cl_gui_alv_grid
          it_ref_table TYPE REF TO data
          it_fieldcat  TYPE lvc_t_fcat,

      get_alv_fieldcat IMPORTING
                         VALUE(it_table)    TYPE ANY TABLE
                       RETURNING
                         VALUE(rt_fieldcat) TYPE lvc_t_fcat,

      get_alv_layout_f4_help
        IMPORTING
          iv_repid       TYPE clike OPTIONAL
          iv_uname       TYPE clike OPTIONAL
          iv_handle      TYPE clike   DEFAULT ''
          iv_vari        TYPE clike OPTIONAL
        RETURNING
          VALUE(rv_vari) TYPE disvariant-variant
        RAISING
          cx_t100_msg,

      is_layout_existing
          importing
             iv_repid       TYPE clike
             iv_handle      TYPE clike optional
            iv_uname       TYPE clike OPTIONAL
            iv_name type clike
          RETURNING
          value(rv_result) type abap_bool,


      get_alv_layout_default
        IMPORTING
          iv_repid       TYPE clike
                  iv_uname       TYPE clike OPTIONAL
                  iv_handle      TYPE clike DEFAULT ''
        RETURNING VALUE(rv_vari) TYPE disvariant,

      get_filter_possible
        IMPORTING
          it_table         TYPE STANDARD TABLE
          it_filter        TYPE lvc_t_filt
        RETURNING
          VALUE(rt_filter) TYPE lvc_t_filt,

      get_filter_via_selections
        IMPORTING
          it_table         TYPE STANDARD TABLE
          io_alv           TYPE REF TO cl_gui_alv_grid
        RETURNING
          VALUE(rt_filter) TYPE lvc_t_filt.

ENDCLASS.                    "lcl_help_gui_alv DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_help_gui_alv IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_gui_alv IMPLEMENTATION.
*&---------------------------------------------------------------------*
*& Wandelt eine Referenz auf cl_salv_table in ein cl_gui_alv_grid um.
*& Funktioniert nur, wenn SALV-Table schon mit display( ) angezeigt und
*& somit schon ein Container dafür erzeugt wurde. Andernfalls ist
*& r_adapter INITIAL.
*&---------------------------------------------------------------------*
*& -> io_model - Referenz auf cl_salv_table (cl_salv_model)
*& <- ro_grid  - Referenz auf cl_gui_alv_grid, bei Fehler INITIAL
*&---------------------------------------------------------------------*
  METHOD get_alv_from_salv.

    DATA:
      o_grid_adap TYPE REF TO cl_salv_grid_adapter,
      o_fs_adap   TYPE REF TO cl_salv_fullscreen_adapter.

* wenn Typ 'Table'
    IF io_model->model = if_salv_c_model=>table.
      TRY.
          IF abap_true = cl_wdy_wb_reflection_helper=>is_instance_of( object = io_model->r_controller->r_adapter
                                                                      type_name = 'CL_SALV_GRID_ADAPTER' ).

            o_grid_adap ?= io_model->r_controller->r_adapter .

            IF o_grid_adap IS BOUND.
              ro_grid = o_grid_adap->get_grid( ).
            ENDIF.
          ELSEIF abap_true = cl_wdy_wb_reflection_helper=>is_instance_of( object = io_model->r_controller->r_adapter
                                                                          type_name = 'CL_SALV_FULLSCREEN_ADAPTER' ).

            o_fs_adap ?=  io_model->r_controller->r_adapter .

            IF o_fs_adap IS BOUND.
              ro_grid = o_fs_adap->get_grid( ).
            ENDIF.
          ENDIF.
        CATCH cx_root.
      ENDTRY.
    ENDIF.
  ENDMETHOD.                    "get_alv_from_salv



  METHOD get_alv_info.


    IF et_fieldcat IS SUPPLIED.

      CALL METHOD io_alv->get_frontend_fieldcatalog
        IMPORTING
          et_fieldcatalog = et_fieldcat.

    ENDIF.

    IF es_variant IS SUPPLIED.
      io_alv->get_variant(
        IMPORTING
          es_variant =  es_variant   " Layout
*        e_save     =     " Single-Character Flag
      ).
    ENDIF.

    IF et_filter IS SUPPLIED.

      io_alv->get_filter_criteria(
        IMPORTING
          et_filter = et_filter    " Filter Criteria
      ).
    ENDIF.

    IF et_sort IS SUPPLIED.

      io_alv->get_sort_criteria(
        IMPORTING
          et_sort = et_sort    " Sort Criteria
      ).
    ENDIF.

    IF es_layout IS SUPPLIED.

      io_alv->get_frontend_layout(
        IMPORTING
          es_layout = es_layout    " Layout
      ).

    ENDIF.

  ENDMETHOD.                    "get_alv_info

  METHOD get_filter_possible.

    DATA:
      ls_filt TYPE lvc_s_filt.

    LOOP AT it_filter INTO ls_filt.

*      IF abap_true = is_column_existing(
*            it_table    = it_table
*            iv_col_type = ls_filt-fieldname ).

      APPEND ls_filt TO rt_filter.

*      ENDIF.

    ENDLOOP.

  ENDMETHOD.                    "get_filter_possible



  METHOD get_alv_fieldcat.

    DATA:
      lo_alv          TYPE REF TO cl_salv_table,
      lo_columns      TYPE REF TO cl_salv_columns_list,
      lo_aggregations TYPE REF TO cl_salv_aggregations,
      lx_previous     TYPE REF TO cx_root.


* -----------------------------------------------------------------------------
* Fieldkatalog erzeugen

    TRY.

        cl_salv_table=>factory(
          IMPORTING
            r_salv_table   =  lo_alv   " Basisklasse einfache ALV Tabellen
          CHANGING
            t_table        = it_table ).


        lo_columns = lo_alv->get_columns( ).
        lo_aggregations = lo_alv->get_aggregations( ).

        rt_fieldcat = cl_salv_controller_metadata=>get_lvc_fieldcatalog( r_columns      = lo_columns
                                                                     r_aggregations = lo_aggregations ).

      CATCH cx_salv_msg INTO lx_previous.
*        lx_root = factory_cx_t100( i_any  = 'Fehler beim Erstellen des Feldkatalogs'(002)  io_previous = lx_previous ).
*        RAISE EXCEPTION lx_root.
    ENDTRY.

  ENDMETHOD.                    "get_alv_fieldcat

method is_layout_existing.

  DATA:
        ls_ltdx type ltdx.

  ls_ltdx-report   = iv_repid.
  ls_ltdx-handle   = iv_handle.
  ls_ltdx-username = iv_uname.
  ls_ltdx-variant  = iv_name.


          SELECT SINGLE *
            FROM ltdxd
            INTO CORRESPONDING FIELDS OF ls_ltdx
            WHERE report   =  ls_ltdx-report
            AND   handle   = ls_ltdx-handle
            AND   username = ls_ltdx-username
            and   variant  = ls_ltdx-variant.

  if sy-subrc = 0.
    rv_result = abap_true.
    else.
      rv_result = abap_false.
      endif.

  endmethod.




  METHOD get_alv_layout_default.

    DATA: ls_variant TYPE disvariant.

* ---------------------------------------------------------------------
* Input aufbereiten

    ls_variant-report   = iv_repid.

    IF iv_uname IS SUPPLIED.
      ls_variant-username = iv_uname.
    ELSE.
*      ls_variant-username =
    ENDIF.

    ls_variant-handle = iv_handle.

    IF iv_uname IS SUPPLIED.

      CALL FUNCTION 'LVC_VARIANT_DEFAULT_GET'
        EXPORTING
          i_save        = 'A'    " Varianten speichern möglich
        CHANGING
          cs_variant    = ls_variant   " Varianteninformation
        EXCEPTIONS
          wrong_input   = 1
          not_found     = 2
          program_error = 3
          OTHERS        = 4.
      IF sy-subrc <> 0.
*     MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*                WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.

    ENDIF.

    IF ls_variant-variant IS INITIAL.

      CALL FUNCTION 'LVC_VARIANT_DEFAULT_GET'
        EXPORTING
          i_save        = ''    " Varianten speichern möglich
        CHANGING
          cs_variant    = ls_variant   " Varianteninformation
        EXCEPTIONS
          wrong_input   = 1
          not_found     = 2
          program_error = 3
          OTHERS        = 4.
      IF sy-subrc <> 0.
*     MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*                WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.

    ENDIF.

    rv_vari = ls_variant.

  ENDMETHOD.                    "get_alv_layout_default


  METHOD get_alv_layout_f4_help.

*    TRY.
*
    DATA: ls_variant TYPE disvariant.

* ---------------------------------------------------------------------
* Input aufbereiten

    IF iv_repid IS SUPPLIED.
      ls_variant-report   = iv_repid.
    ELSE.
      ls_variant-report   = cl_abap_syst=>get_current_program( ).
    ENDIF.

    IF iv_uname IS SUPPLIED.
      ls_variant-username = iv_uname.
    ELSE.
      ls_variant-username = cl_abap_syst=>get_user_name( ).
    ENDIF.

    ls_variant-handle = iv_handle.


    """""""""""""""""""""""""""""""""""
    " Check

    IF ls_variant-report IS INITIAL.
      lcl_help_factory_all=>so_error->raise_text(
          'Kein Reportnamen übergeben' ).
    ENDIF.


* ---------------------------------------------------------------------
* F4-Hilfe aufrufen

    CALL FUNCTION 'LT_F4_FOR_VARIANTS'
      EXPORTING
        i_tool          = 'LT'
        i_sap           = 'X'
        is_variant      = ls_variant
        i_customer      = 'X'
        i_user_specific = 'X'
        i_no_aedat      = 'X'
        i_no_aetime     = 'X'
        i_no_aename     = 'X'
        i_no_default    = 'X'
      IMPORTING
        es_variant      = ls_variant
      EXCEPTIONS
        not_found       = 1
        OTHERS          = 2.
    lcl_help_factory_all=>so_check_a_raise->after_function( is_sy = sy ).

* ---------------------------------------------------------------------
* Usereingabe übernehmen

    IF ls_variant-variant NE ' '.
      rv_vari = ls_variant-variant.
    ELSE.
      rv_vari = iv_vari.
    ENDIF.


    """"""""""""""""""""""""""""""""
    " Fehlerbehandlung

*        DATA: lx_ro<ot TYPE REF TO cx_root.
*      CATCH cx_root INTO lx_root.
*        lcl_help_factory_all=>so_gui->popup_exception(  lx_root ).
*    ENDTRY.

  ENDMETHOD.                    "get_layout_f4_help


  METHOD get_filter_via_selections.

    DATA:
      lt_cell TYPE lvc_t_cell,
      ls_cell TYPE lvc_s_cell.

    FIELD-SYMBOLS:
    <ls_filter> TYPE lvc_s_filt.

    io_alv->get_selected_cells(
      IMPORTING
        et_cell = lt_cell    " Selected Cells
    ).

    LOOP AT lt_cell INTO ls_cell.

      TRY.
*          DATA(lv_value) = get_table_value(
*                          iv_column_name = ls_cell-col_id-fieldname
*                          iv_row_id      = ls_cell-row_id
*                          it_table       = it_table ).


          APPEND INITIAL LINE TO rt_filter ASSIGNING <ls_filter>.
          <ls_filter>-fieldname    = ls_cell-col_id-fieldname.
          <ls_filter>-sign         = 'I'. "s_values-sign.
          <ls_filter>-option       = 'EQ'. "s_values-option.
*          <ls_filter>-low          = lv_value. "s_values-low.

        CATCH cx_no_results.
      ENDTRY.

    ENDLOOP.

    SORT rt_filter BY fieldname low.
    DELETE ADJACENT DUPLICATES FROM rt_filter COMPARING fieldname low.

  ENDMETHOD.                    "get_filter_via_selections

  METHOD update_fieldcat.


    DATA:
      lt_filter  TYPE lvc_t_filt,
      lt_sort    TYPE lvc_t_sort,
      ls_variant TYPE disvariant,
      ls_layout  TYPE lvc_s_layo.

    get_alv_info(
      EXPORTING
        it_ref_table = it_ref_table
        io_alv       = io_alv
      IMPORTING
        es_layout    = ls_layout
        et_filter    = lt_filter
        et_sort      = lt_sort
        es_variant   = ls_variant  ).

    io_alv->set_variant(
      EXPORTING
        is_variant = ls_variant    " Layout Variant (External Use)
*        i_save     =     " Single-Character Flag
    ).

    io_alv->set_frontend_fieldcatalog( it_fieldcat ).

    io_alv->set_sort_criteria(
      EXPORTING
        it_sort                   = lt_sort    " Sort Criteria
*      EXCEPTIONS
*        no_fieldcatalog_available = 1
*        others                    = 2
    ).

    io_alv->set_filter_criteria(
      EXPORTING
        it_filter                 =  lt_filter   " Filter Conditions
*     EXCEPTIONS
*       no_fieldcatalog_available = 1
*       others                    = 2
    ).
    IF sy-subrc <> 0.
*    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*               WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.



  ENDMETHOD.                    "update_fieldcat

ENDCLASS.                    "lcl_help_gui_alv IMPLEMENTATION




*----------------------------------------------------------------------*
*       CLASS lcl_help_gui IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_help_gui IMPLEMENTATION.


  METHOD call_transaction.


    DATA:
      lv_tcode     TYPE sy-tcode,
      lv_value     TYPE memoryid,
      lv_value2    TYPE memoryid,
      lv_value3    TYPE memoryid,
      lv_val_name  TYPE char20,
      lv_val2_name TYPE char20,
      lv_val3_name TYPE char20.


    IF iv_field1_name <> ''
      AND iv_field1_value <> ''.
      lv_val_name = iv_field1_name.
      lv_value    = iv_field1_value.
      SET PARAMETER ID lv_val_name FIELD lv_value.
    ENDIF.
*
    IF iv_field2_name <> ''
    AND iv_field2_value <> ''.
      lv_val2_name = iv_field2_name.
      lv_value2 = iv_field2_value.
      SET PARAMETER ID lv_val2_name FIELD lv_value2.
    ENDIF.

    IF iv_field3_name <> ''
  AND iv_field3_value <> ''.
      lv_val3_name = iv_field3_name.
      lv_value3 = iv_field3_value.
      SET PARAMETER ID lv_val3_name FIELD lv_value3.
    ENDIF.

    lv_tcode = iv_transaction_name.
    CALL TRANSACTION lv_tcode AND SKIP FIRST SCREEN.     "#EC CI_CALLTA
    mo_help->so_check_a_raise->any_data( is_sy = sy ).


*    me->

  ENDMETHOD.                    "call_transaction


  METHOD class_constructor.


*    CREATE OBJECT so_help.


  ENDMETHOD.                    "class_constructor


  METHOD data_download.



  ENDMETHOD.                    "data_download


  METHOD data_upload.


    DATA: lt_files TYPE filetable,
          lv_rc    TYPE i.



    DATA
        " Ordner
       : gt_contx    TYPE solix_tab

        " Dateiinformationen
      , gd_file     TYPE string
      , gd_flen     TYPE i
        .

    FIELD-SYMBOLS:
    <lfs_file> TYPE LINE OF filetable.




    CALL METHOD cl_gui_frontend_services=>file_open_dialog
      EXPORTING
        default_extension = 'pdf'
        file_filter       = '.pdf'
      CHANGING
        file_table        = lt_files
        rc                = lv_rc.
*    if lv_rc <> 0.
*    so_help->so_cx_t100->raise_msg(  ).


    READ TABLE lt_files INDEX 1 ASSIGNING <lfs_file>.
    gd_file = <lfs_file>-filename.


    CALL FUNCTION 'GUI_UPLOAD'
      EXPORTING
        filename   = gd_file
        filetype   = 'BIN'
      IMPORTING
        filelength = gd_flen
      TABLES
        data_tab   = gt_contx
      EXCEPTIONS
        OTHERS     = 1.

  ENDMETHOD.                    "data_upload


  "demo


  METHOD popup_bal.


    TRY.

        DATA:
*      lo_bal        TYPE REF TO lcl_bal,
          ls_profile TYPE bal_s_prof,
          lx_t100    TYPE REF TO cx_t100_msg.

        """""""""""""""""""""""""""""""""""""""
        " Handle bestimmen

        DATA:
          ls_extn   TYPE bal_s_extn,
          ls_sub    TYPE bal_s_sub,
          ls_obj    TYPE bal_s_obj,
          ls_filt   TYPE bal_s_lfil,
          lt_header TYPE balhdr_t,
          ls_header LIKE LINE OF lt_header.


        CALL FUNCTION 'MESSAGES_INITIALIZE'.

        ls_extn-sign   = ls_sub-sign   = ls_obj-sign   = 'I'.
        ls_extn-option = ls_sub-option = ls_obj-option = 'EQ'.

        ls_obj-low  = iv_object   .
        ls_sub-low  = iv_subobject.
        ls_extn-low = iv_extnumber.

        APPEND:
            ls_extn TO ls_filt-extnumber,
            ls_obj  TO ls_filt-object,
            ls_sub  TO ls_filt-subobject.

        CALL FUNCTION 'BAL_DB_SEARCH'
          EXPORTING
            i_s_log_filter     = ls_filt    " Log header data filter
          IMPORTING
            e_t_log_header     = lt_header    " Table of log header data read
          EXCEPTIONS
            log_not_found      = 1
            no_filter_criteria = 2
            error_message      = 3
            OTHERS             = 4.
        mo_help->so_check_a_raise->after_function( is_sy = sy ).

        READ TABLE lt_header
         INTO ls_header INDEX 1.
        mo_help->so_check_a_raise->after_read_table( ).
*

        DATA:
          lt_lognumber TYPE bal_t_logn,
          lt_handle    TYPE bal_t_logh.

        LOOP AT lt_header INTO ls_header.
          APPEND ls_header-lognumber TO lt_lognumber.
        ENDLOOP.


*    APPEND is_header-lognumber TO lt_lognumber.

        CALL FUNCTION 'BAL_DB_LOAD'
          EXPORTING
            i_t_lognumber      = lt_lognumber
          IMPORTING
            e_t_log_handle     = lt_handle
          EXCEPTIONS
            no_logs_specified  = 1
            log_not_found      = 2
            log_already_loaded = 3
            error_message      = 4
            OTHERS             = 5.
        mo_help->so_check_a_raise->after_function( is_sy = sy ).

*    READ TABLE lt_handle INDEX 1
*        INTO rv_result.
*    so_help->so_cx_t100->check_a_raise_read_table( ).



        """""""""""""""""""""""""""""""""""""""
        " Anzeige

*        CALL FUNCTION 'BAL_DSP_PROFILE_POPUP_GET'
*          IMPORTING
*            e_s_display_profile = ls_profile.

*    ls_profile-no_toolbar = 'X'.
*        ls_profile-tree_ontop = 'X'.
*        ls_profile-tree_size  = '20'.
*        ls_profile-pop_adjst  = 'X'.
*        ls_profile-cwidth_opt = 'X'.
*        ls_profile-use_grid   = 'X'.
*        ls_profile-show_all = 'X'.

        CALL FUNCTION 'BAL_DSP_LOG_DISPLAY'
          EXPORTING
            i_t_log_handle       = lt_handle
            i_s_display_profile  = ls_profile
            i_amodal             = 'X' "iv_amodal'
          EXCEPTIONS
            profile_inconsistent = 01
            internal_error       = 02
            no_data_available    = 03
            no_authority         = 04
            error_message        = 05
            OTHERS               = 99.
        mo_help->so_check_a_raise->after_function( is_sy = sy ).



      CATCH cx_t100_msg INTO lx_t100.
        "D  WU  733 Keine Daten vorhanden.
        mo_help->so_error->raise_msg( iv_id = 'WU' iv_no = 733 io_previous = lx_t100 ).


    ENDTRY.
*    cl_abap_unit_assert=>fail( 'Implement your first test here' ).

  ENDMETHOD.                    "display_bal



  METHOD display_f4_help.

    DATA ls_shlp TYPE shlp_descr.
    DATA: lv_name TYPE shlpname.

    lv_name = iv_name_search_help.
*  lv_name_field = iv_name_field.

    CALL FUNCTION 'F4IF_GET_SHLP_DESCR'
      EXPORTING
        shlpname = lv_name
        shlptype = 'SH'
      IMPORTING
        shlp     = ls_shlp.

    DATA:
      lt_return_values TYPE TABLE OF ddshretval,
      ls_return_values TYPE ddshretval,
      l_rc             TYPE sy-subrc.

    FIELD-SYMBOLS: <interface> TYPE ddshiface.
    LOOP AT ls_shlp-interface ASSIGNING <interface>.
      IF <interface>-shlpfield = iv_name_field.
        <interface>-valfield = 'X'.
      ENDIF.
    ENDLOOP.


    CALL FUNCTION 'F4IF_START_VALUE_REQUEST'
      EXPORTING
        shlp          = ls_shlp
*       disponly      = ' '
*       maxrecords    = 500
*       multisel      = ' '
*       cucol         = sy-cucol
*       curow         = sy-curow
      IMPORTING
        rc            = l_rc
      TABLES
        return_values = lt_return_values.

    IF l_rc = 0.
      READ TABLE lt_return_values INTO ls_return_values INDEX 1.
      rv_resault = ls_return_values-fieldval.
    ENDIF.

  ENDMETHOD.                    "display_f4_help


  METHOD message_popup.


    DATA:
       lv_text TYPE string.

    CONCATENATE iv1 iv2 iv3 iv4 iv5 iv6 INTO lv_text SEPARATED BY ' '.

    MESSAGE lv_text TYPE 'I' DISPLAY LIKE iv_type.


  ENDMETHOD.                    "message_popup


  METHOD message_status.


    DATA:
          lv_string TYPE string.

    TRY.
        lv_string =  mo_help->so_txt->text_get_by_msg(
             iv_id    = iv_msgid
             iv_no    = iv_msgno
             iv_v1       = iv1
             iv_v2       = iv2
             iv_v3       = iv3
             iv_v4       = iv4 ).

      CATCH cx_t100_msg.

        lv_string = mo_help->so_txt->text_get_w_params(
             iv_text   = iv_text
            iv_v1       = iv1
            iv_v2       = iv2
            iv_v3       = iv3
            iv_v4       = iv4 ).

    ENDTRY.


    MESSAGE lv_string TYPE 'S' DISPLAY LIKE iv_type.


  ENDMETHOD.                    "message_status


  METHOD message_sy.


  ENDMETHOD.                    "message_sy


  METHOD on_double_click.


*    DATA:
*      ls_data    TYPE LINE OF ty_s_types-t_serial_data, "LINE OF ty_t_data,
*      lx_root    TYPE REF TO cx_root,
*      lv_xstring TYPE xstring.
*
*
*    DATA:
*      lt_tab   TYPE STANDARD TABLE OF char120,
*      lv_tabix TYPE i,
*      lx_t100  TYPE ty_s_types-x_help_error. "REF TO lcx_help_error.
**        ls_output TYPE ty_s_output.
*
*    READ TABLE mt_data INDEX row
*        INTO ls_data.
*
*    lv_xstring = ls_data-data_data.
*
*    so_help->so_base->data_zipped_xml_2_any(
*      EXPORTING
*        iv_xstring  = lv_xstring
*      IMPORTING
*        e_any       = lx_root
*    ).
*
*    display_exception(  lx_root ).
*

  ENDMETHOD.                    "on_double_click


  METHOD popup_change_text.


    DATA:
      lt_text_fuba TYPE catsxt_longtext_itab,
      lt_text_old  TYPE catsxt_longtext_itab,
      ls_text      TYPE string,
      ls_text_fuba TYPE LINE OF catsxt_longtext_itab.

    FIELD-SYMBOLS:
      <ls_text>      TYPE string,
      <ls_text_fuba> TYPE LINE OF catsxt_longtext_itab.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Vorbereitung

    IF iv_title IS NOT SUPPLIED.
      iv_title = 'Texteingabe:'.
    ENDIF.

    LOOP AT it_text INTO ls_text.
      APPEND INITIAL LINE TO lt_text_fuba ASSIGNING <ls_text_fuba>.
      <ls_text_fuba> = ls_text.
    ENDLOOP.

    lt_text_old =  lt_text_fuba.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Aufruf

    DATA:
      lv_title      TYPE char70,
      lv_is_display TYPE abap_bool.

    IF iv_is_editable = abap_true.
      lv_is_display = abap_false.
    ELSE.
      lv_is_display = abap_true.
    ENDIF.

    CALL FUNCTION 'CATSXT_SIMPLE_TEXT_EDITOR'
      EXPORTING
        im_title        = lv_title  " Editor Titel
        im_display_mode = lv_is_display
        im_start_column = 10
        im_start_row    = 100
      CHANGING
        ch_text         = lt_text_fuba.  " Langtexttabelle für CATSXT


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Nachbearbeitung

    IF lt_text_old = lt_text_fuba OR sy-subrc <> 0.
      ev_is_changed = abap_false.
      RETURN.
    ENDIF.

    ev_is_changed = abap_true.

    LOOP AT lt_text_fuba INTO ls_text_fuba.
      APPEND INITIAL LINE TO rt_text ASSIGNING <ls_text>.
      <ls_text> = ls_text_fuba.
    ENDLOOP.


  ENDMETHOD.                    "popup_change_text


  METHOD popup_confirm.


    DATA:
     lv_answer TYPE answer.

    CALL FUNCTION 'POPUP_TO_CONFIRM'
      EXPORTING
        titlebar              = ''
        text_question         = iv_text
        text_button_1         = 'OK'
        icon_button_1         = 'ICON_CHECKED'
        text_button_2         = 'CANCEL'
        icon_button_2         = 'ICON_CANCEL'
        display_cancel_button = ' '
      IMPORTING
        answer                = lv_answer.

    IF lv_answer = '1'.
      rv_is_confirmed = abap_true.
    ELSE.
      rv_is_confirmed = abap_false.
    ENDIF.


  ENDMETHOD.                    "popup_confirm


  METHOD popup_data.

*
*    DATA:
*      lt_data  TYPE ty_s_types-t_serial_data,
*      ls_data  TYPE LINE OF ty_s_types-t_serial_data,
*      lo_alv   TYPE REF TO cl_salv_table,
*      lo_event TYPE REF TO cl_salv_events_table.
*
*    SELECT *
*        FROM (cs_const-name_t_serial) "zstc_T_Serialdat
*        INTO CORRESPONDING FIELDS OF TABLE mt_data.
**        repid = .
*
*    cl_salv_table=>factory(
**          EXPORTING
**            list_display   = IF_SALV_C_BOOL_SAP=>FALSE    " ALV Displayed in List Mode
**            r_container    =     " Abstract Container for GUI Controls
**            container_name =
*      IMPORTING
*        r_salv_table   = lo_alv     " Basis Class Simple ALV Tables
*      CHANGING
*        t_table        = mt_data
*    ).
**          CATCH cx_salv_msg.    "
*
*
*    lo_alv->set_screen_popup(
*  EXPORTING
*    start_column = '10'
*    end_column   = '140'
*    start_line   =  '10'
*    end_line     = '25' ).
*
*
*    lo_event = lo_alv->get_event(  ).
*    SET HANDLER on_double_click FOR lo_event.
*
*    lo_alv->display(  ).



  ENDMETHOD.                    "popup_data


  METHOD popup_decide.


    DATA:
      lv_btn_center TYPE char10,
      lv_btn_left   TYPE char10,
      lv_text       TYPE char255,
      lv_answer     TYPE answer.

    lv_btn_left   = iv_btn_txt_left.
    lv_btn_center = iv_btn_txt_center.
    lv_text       = iv_text.

    CALL FUNCTION 'POPUP_TO_CONFIRM'
      EXPORTING
        text_question         = lv_text
        text_button_1         = lv_btn_left
        text_button_2         = lv_btn_center
        display_cancel_button = iv_is_btn_cancel_displayed
      IMPORTING
        answer                = lv_answer.
    IF sy-subrc <> 0.
    ENDIF.

    CASE lv_answer.

      WHEN '1'.
        rv_answer = cs_const-s_popup_decide_answer-button_left.

      WHEN '2'.
        rv_answer = cs_const-s_popup_decide_answer-button_center.

      WHEN 'A'.
        rv_answer = cs_const-s_popup_decide_answer-button_cancel.

    ENDCASE.




  ENDMETHOD.                    "popup_decide


  METHOD popup_exception.


    DATA:
      lo_popup TYPE REF TO lcl_help_gui_popup_error,
      lx_root  TYPE REF TO cx_root.

    TRY.

        CREATE OBJECT lo_popup.

        lo_popup->display( ix_error = ix_exception ).


      CATCH cx_root INTO lx_root.
        mo_help->so_error->raise_text( 'Popup kann nciht angezeigt werden' ).
    ENDTRY.

  ENDMETHOD.                    "popup_exception


  METHOD popup_exception_resumable.


    DATA:
      lv_text   TYPE string,
      lv_answer TYPE string.

    lv_text = i_lx_t100->get_text(  ).

    CONCATENATE lv_text ' Soll die Verarbeitung trotzdem fortgesetzt werden?' INTO lv_text.

    popup_decide(
      EXPORTING
        iv_text                    = lv_text
        iv_btn_txt_left            = 'Weiter'
        iv_btn_txt_center          = 'Details'
        iv_is_btn_cancel_displayed = abap_true
      RECEIVING
        rv_answer                  = lv_answer
    ).

    CASE lv_answer.
      WHEN cs_const-s_popup_decide_answer-button_left.
        rv_is_resume = abap_true.
        RETURN.
      WHEN cs_const-s_popup_decide_answer-button_center.
*        display_exception( i_lx_t100   ).
      WHEN OTHERS.
        RETURN.
    ENDCASE.

  ENDMETHOD.                    "popup_exception_resumable


  METHOD popup_get_values.


    DATA:
      lt_value  TYPE STANDARD TABLE OF sval,
      ls_value  TYPE sval,
      lv_return TYPE string,
      lv_title  TYPE sy-title.

    IF iv_title IS SUPPLIED.
      lv_title = iv_title.
    ELSE.
      MESSAGE s271(db) INTO lv_title.
    ENDIF.

****************************************
* Feld1 befüllen

    FREE ls_value.
    ls_value-tabname   = iv_tab1.
    ls_value-fieldname = iv_field1.

    IF iv_value1 IS SUPPLIED.
      ls_value-value = iv_value1.
    ENDIF.

    IF iv_is_input1 = abap_true.
      ls_value-field_attr = '01'.
    ELSE.
      ls_value-field_attr = '02'.
    ENDIF.

    APPEND ls_value TO lt_value.

****************************************
* Feld2 befüllen

    IF iv_field2 IS SUPPLIED AND iv_tab2 IS SUPPLIED.

      FREE ls_value.
      ls_value-tabname   = iv_tab2.
      ls_value-fieldname = iv_field2.

      IF iv_value2 IS SUPPLIED.
        ls_value-value = iv_value2.
      ENDIF.

      IF iv_is_input2 = abap_true.
        ls_value-field_attr = '01'.
      ELSE.
        ls_value-field_attr = '02'.
      ENDIF.

      APPEND ls_value TO lt_value.

    ENDIF.


****************************************
* Feld3 befüllen

    IF iv_field3 IS SUPPLIED AND iv_tab3 IS SUPPLIED.

      FREE ls_value.
      ls_value-tabname   = iv_tab3.
      ls_value-fieldname = iv_field3.

      IF iv_value3 IS SUPPLIED.
        ls_value-value = iv_value3.
      ENDIF.

      IF iv_is_input3 = abap_true.
        ls_value-field_attr = '01'.
      ELSE.
        ls_value-field_attr = '02'.
      ENDIF.

      APPEND ls_value TO lt_value.

    ENDIF.


****************************************
* Feld4 befüllen

    IF iv_field4 IS SUPPLIED AND iv_tab4 IS SUPPLIED.

      FREE ls_value.
      ls_value-tabname   = iv_tab4.
      ls_value-fieldname = iv_field4.

      IF iv_value4 IS SUPPLIED.
        ls_value-value = iv_value4.
      ENDIF.

      IF iv_is_input4 = abap_true.
        ls_value-field_attr = '01'.
      ELSE.
        ls_value-field_attr = '02'.
      ENDIF.

      APPEND ls_value TO lt_value.

    ENDIF.


*****************************************
* Feld4 befüllen

    IF iv_field5 IS SUPPLIED AND iv_tab5 IS SUPPLIED.

      FREE ls_value.
      ls_value-tabname   = iv_tab5.
      ls_value-fieldname = iv_field5.

      IF iv_value5 IS SUPPLIED.
        ls_value-value = iv_value5.
      ENDIF.

      IF iv_is_input5 = abap_true.
        ls_value-field_attr = '01'.
      ELSE.
        ls_value-field_attr = '02'.
      ENDIF.

      APPEND ls_value TO lt_value.

    ENDIF.


*****************************************
* Popup aufrufen

    CALL FUNCTION 'POPUP_GET_VALUES'
      EXPORTING
*       no_value_check  = SPACE    " Schaltet Prüfungen des jeweiligen Datentyps aus
        popup_title     = lv_title   " Text der Titelzeile
*       start_column    = '5'    " Startspalte des Dialogfensters
*       start_row       = '5'    " Startzeile des Dialogfensters
      IMPORTING
        returncode      = lv_return    " Antwort des Anwenders
      TABLES
        fields          = lt_value    " Tabellenfelder, Werte und Attribute
      EXCEPTIONS
        error_in_fields = 1
        OTHERS          = 2.
    mo_help->so_check_a_raise->after_function( is_sy = sy ).

    IF lv_return = 'A'.
      ev_user_cancel = abap_true.
      RETURN.
    ELSE.
      ev_user_cancel = abap_false.
    ENDIF.

*****************************************
* Werte übernehmen

    LOOP AT lt_value INTO ls_value.
      CASE sy-tabix.
        WHEN 1.
          ev_value1 = ls_value-value.
        WHEN 2.
          ev_value2 = ls_value-value.
        WHEN 3.
          ev_value3 = ls_value-value.
        WHEN 4.
          ev_value4 = ls_value-value.
      ENDCASE.
    ENDLOOP.


  ENDMETHOD.                    "popup_get_values


  METHOD popup_inform.


    DATA:
      lv_input TYPE string,
      lt_text  TYPE stringtab,
      lv_txt1  TYPE char80,
      lv_txt2  TYPE char80,
      lv_txt3  TYPE char80,
      lv_txt4  TYPE char80.

    "Erarbeitung für wenn sy eingegeben oder wnen gar nichts einggeben

    IF iv_msgid IS NOT INITIAL AND iv_msgno IS NOT INITIAL.

      lv_input = mo_help->so_txt->text_get_by_msg( iv_id = iv_msgid iv_no = iv_msgno
                                                     iv_v1    = iv_v1
                                                     iv_v2    = iv_v2
                                                     iv_v3    = iv_v3
                                                     iv_v4    = iv_v4 ).

    ELSEIF iv_text IS NOT INITIAL.

      lv_input = mo_help->so_txt->text_get_w_params(
               iv_text   = iv_text
               iv_v1     =  iv_v1
               iv_v2     =  iv_v2
               iv_v3     =  iv_v3
               iv_v4     =  iv_v4      ).

    ELSE.
*      sy
    ENDIF.

    lt_text =  mo_help->so_txt->text_get_splitted_stringtab(
               iv_text      = lv_input
               iv_length    = 80 ).

    READ TABLE lt_text INDEX 1
      INTO lv_txt1.

    READ TABLE lt_text INDEX 2
      INTO lv_txt2.

    READ TABLE lt_text INDEX 3
      INTO lv_txt3.

    READ TABLE lt_text INDEX 4
      INTO lv_txt4.


    CALL FUNCTION 'POPUP_TO_INFORM'
      EXPORTING
        titel = 'Information'
        txt1  = lv_txt1
        txt2  = lv_txt2
        txt3  = lv_txt3
        txt4  = lv_txt4.


  ENDMETHOD.                    "popup_inform

  METHOD popup_xml.

    DATA:
            lv_xml TYPE string.

    lv_xml = iv_xml.
    IF iv_is_zip = abap_true.
      lv_xml = mo_help->so_data->trans_zip_2_string( lv_xml  ).
    ELSE.
      lv_xml = lv_xml.
    ENDIF.

*== data
    DATA lv_xml_xstring TYPE xstring.

*== Convert string to Xstring
    CALL FUNCTION 'J_3RT_CONV_STRING_TO_XSTRING'
      EXPORTING
        im_string  = lv_xml
      IMPORTING
        ex_xstring = lv_xml_xstring.

*== display XML data
    CALL FUNCTION 'DISPLAY_XML_STRING'
      EXPORTING
        xml_string      = lv_xml_xstring
      EXCEPTIONS
        no_xml_document = 1
        OTHERS          = 2.


    """" geht nur bei neuen Systemen
*    cl_abap_browser=>show_xml(
*        EXPORTING xml_string = lv_xml
*            size       = cl_abap_browser=>xlarge ).

  ENDMETHOD.                    "popup_xml

  METHOD popup_button_choice.

    TYPES:
      BEGIN  OF ty_s_output,
        col1 TYPE c LENGTH 1,
        col2 TYPE c LENGTH 60,
      END OF ty_s_output.

    DATA:
      lt_output     TYPE STANDARD TABLE OF ty_s_output,
      lv_descr      TYPE string,
      lo_salv       TYPE REF TO cl_salv_table,
      lv_max_length TYPE i,
      lv_length     TYPE i.

    FIELD-SYMBOLS:
    <ls_line> LIKE LINE OF lt_output.

    LOOP AT it_descr INTO lv_descr.

      APPEND INITIAL LINE TO lt_output ASSIGNING <ls_line>.
      <ls_line>-col2 = lv_descr.

      lv_length = strlen(  lv_descr ).
      IF lv_length > lv_max_length.
        lv_max_length = lv_length.
      ENDIF.

*      APPEND lv_descr TO lt_output.

    ENDLOOP.

    ADD 5 TO lv_max_length.

    cl_salv_table=>factory(
*      EXPORTING
*        list_display   = IF_SALV_C_BOOL_SAP=>FALSE    " ALV Displayed in List Mode
*        r_container    =     " Abstract Container for GUI Controls
*        container_name =
      IMPORTING
        r_salv_table   =  lo_salv   " Basis Class Simple ALV Tables
      CHANGING
        t_table        = lt_output
    ).
*      CATCH cx_salv_msg.    "

    lo_salv->set_screen_popup(
      EXPORTING
        start_column = 1
        end_column   = lv_max_length
        start_line   = 1
        end_line     = 5
    ).


    TRY.

        """"""""""""""""""""""""""""""""""""""""""""""
        " Spalteneigenschaften

        DATA: go_column TYPE REF TO cl_salv_columns_table,
              lo_event  TYPE REF TO cl_salv_events_table.

        lo_event = lo_salv->get_event( ).

        SET HANDLER on_link_click
         FOR lo_event.

        DATA:  go_col_tab  TYPE REF TO cl_salv_column_table.
*    DATA:  go_col_tab  TYPE REF TO cl_salv_column_list.
        TRY.
            "Spalte holen
            go_column ?= lo_salv->get_columns( ).
            go_col_tab ?= go_column->get_column( 'COL2' ).
            "Hotspot aktivieren
            go_col_tab->set_cell_type( value = if_salv_c_cell_type=>hotspot ).

*            go_col_tab->set_cell_type( if_salv_c_cell_type=>button  ).

          CATCH cx_salv_not_found.
            "Fehlerbehandlung
          CATCH cx_salv_data_error.
            "Fehlerbehandlung
        ENDTRY.
*
        TRY.
            "Spalte holen
            go_column ?= lo_salv->get_columns( ).
            go_col_tab ?= go_column->get_column( 'COL1' ).
            "Hotspot aktivieren
            go_col_tab->set_technical( abap_true ).
            ".set_cell_type( value = if_salv_c_cell_type=>hotspot ).
          CATCH cx_salv_not_found.
            "Fehlerbehandlung
          CATCH cx_salv_data_error.
            "Fehlerbehandlung
        ENDTRY.

*   mo_alv->get_columns( )->set_optimize( abap_true ).


        go_col_tab ?= go_column->get_column( 'COL2' ).
*        go_col_tab->set_icon( if_salv_c_bool_sap=>true ).
        go_col_tab->set_cell_type( value = if_salv_c_cell_type=>hotspot ).

        DATA: lv_outlen TYPE lvc_outlen.
        lv_outlen = lv_max_length.
        go_col_tab->set_output_length( lv_outlen ).

*    go_column ?= mo_alv->get_columns( )->get_column( 'CODE' ).
*    go_column->set_icon( if_salv_c_bool_sap=>true ).
*    go_column->set_output_length( 5 ).

*        go_col_tab ?= go_column->get_column( 'DESCR' ).
*    go_column->set_cell_type( value = if_salv_c_cell_type=>hotspot ).
*        go_col_tab->set_output_length( 150 ).


*        SET HANDLER on_before_salv_function
*            FOR lo_event.

        """"""""""""""""""""""""""""""""""""""""""""""
        " Sonstiges

        "Ueberschrift festlegen
        DATA:
              lo_display TYPE REF TO cl_salv_display_settings.

        lo_display = lo_salv->get_display_settings( ).
        lo_display->set_list_header( 'Auswahl' ).
        "Groesse der Ueberschrift (aendert sich nur bei ALV im Container)
        lo_display->set_list_header_size( cl_salv_display_settings=>c_header_size_small ).
        FREE sv_index.
        lo_salv->display( ).

        CASE sy-ucomm.
          WHEN '&F12' OR '&ONT'.
            rv_result = 0.
          WHEN OTHERS.
            rv_result = sv_index.
        ENDCASE.


      CATCH cx_salv_not_found.

    ENDTRY.



  ENDMETHOD.

  METHOD popup_stringtab.

  ENDMETHOD.                    "popup_stringtab

*  METHOD display_log.
*
**    DATA:
**       lo_log TYPE REF TO lcl_help_gui_disp_log.
**
**    TRY.
**
**        CREATE OBJECT ro_log_gui
**          EXPORTING
**            io_container = io_container.
**
**        ro_log_gui->display( io_log = io_log  ).
**
**
**      CATCH cx_root.
**    ENDTRY.
*
*  ENDMETHOD.                    "display_log

*
*  METHOD popup_log.
*
*    DATA:
*        lo_cont TYPE REF TO cl_gui_dialogbox_container.
*
*    IF iv_is_amodal = abap_true.
*
*
*      "Textedit erzeugen
*      CREATE OBJECT lo_cont
*        EXPORTING
**         parent                      =     " Parent container
*          width                       = 1200   " Width of This Container
*          height                      = 300    " Height of This Container
**         style                       =     " Windows Style Attributes Applied to this Container
*          repid                       = sy-repid    " Report to Which This Control is Linked
*          dynnr                       = sy-dynnr    " Screen to Which the Control is Linked
**         lifetime                    = cntl_lifetime_dynpro   " Lifetime
**         top                         = 0    " Top Position of Dialog Box
**         left                        = 0    " Left Position of Dialog Box
**         caption                     =     " Dialog Box Caption
**         no_autodef_progid_dynnr     =     " Don't Autodefined Progid and Dynnr?
**         metric                      = 0    " Metric
**         name                        =     " Name
*        EXCEPTIONS
*          cntl_error                  = 1
*          cntl_system_error           = 2
*          create_error                = 3
*          lifetime_error              = 4
*          lifetime_dynpro_dynpro_link = 5
*          event_already_registered    = 6
*          error_regist_event          = 7
*          OTHERS                      = 8.
*      mo_help->so_check_a_raise->after_function(  is_sy = sy ).
*
*      SET HANDLER handle_close FOR lo_cont.
*
**    DATA:
**       lo_log TYPE REF TO lcl_help_gui_disp_log.
*
*      TRY.
*
*          CREATE OBJECT so_help_display_log
*            EXPORTING
*              io_container = lo_cont.
*
*          so_help_display_log->display( io_log = io_log  ).
*
**    DATA:
**      lo_
*
*
*        CATCH cx_root.
*      ENDTRY.
*
*    ELSE.
*
*
*
*      CREATE OBJECT so_help_display_log
*        EXPORTING
**         iv_type     = CL_GUI_CONTAINER=>CONTAINER_TYPE_DOCKING
**         iv_repid    =
**         iv_dynnr    =
**         iv_side     = CL_GUI_DOCKING_CONTAINER=>DOCK_AT_BOTTOM
**         io_container =
*          iv_is_popup = abap_true.
**                 CATCH cx_salv_msg.    "
**                 CATCH cx_t100_msg.    "
*
*      so_help_display_log->display(
*        EXPORTING
**            it_bapiret2_tab =
*          io_log          = io_log
*      ).
*
*    ENDIF.
*
*
*  ENDMETHOD.                    "popup_log

  METHOD handle_close.

*    IF so_help_display_log->mo_cont = sender.
*
**    set handler so_help_display_log->on_new_entry for so_help_display_log->mo_log ACTIVATION abap_False.
*      so_help_display_log->cfw_free( ).
*
**    sender->free(  ).
*    ENDIF.

  ENDMETHOD.                    "handle_close



  METHOD popup_t_bapiret2.



    DATA:
      lx_salv TYPE REF TO cx_salv_msg,
      lo_alv  TYPE REF TO cl_salv_table,
      ls_bapi TYPE bapiret2.

    TYPE-POOLS: icon.

    TYPES:

      BEGIN OF ty_s_output,
        type TYPE string,
        id   TYPE string,
        no   TYPE string,
        text TYPE string,

      END OF ty_s_output.

    FIELD-SYMBOLS:
<ls_output> TYPE ty_s_output.

    DATA:
     lt_output TYPE STANDARD TABLE OF ty_s_output.

    LOOP AT it_bapiret INTO ls_bapi.

      APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
*      <ls_output>-type = ls_bapi-type.
      <ls_output>-text = ls_bapi-message.

      if  <ls_output>-text is INITIAL.
      <ls_output>-text = mo_help->so_txt->text_get_by_any( ls_bapi ).
        endif.
*      <ls_output>-id   = ls_bapi-id.
*      <ls_output>-no   = ls_bapi-number.

      CASE ls_bapi-type.

        WHEN 'E'.
          <ls_output>-type = icon_incomplete.
        WHEN 'S'.
          <ls_output>-type = icon_checked.
        WHEN 'I'.
          <ls_output>-type = icon_message_information.
        WHEN 'W'.
          <ls_output>-type = icon_message_warning.
      ENDCASE.

    ENDLOOP.

    DATA:
      lo_set   TYPE REF TO cl_salv_display_settings,
      lv_title TYPE lvc_title.



    cl_salv_table=>factory(
      EXPORTING
        list_display   = if_salv_c_bool_sap=>false  "TRUE fuer Listenausgabe
      IMPORTING
        r_salv_table   =  lo_alv     "Objekt ALV
      CHANGING
        t_table        = lt_output ). "Tabelle fuer Anzeige


    lo_set = lo_alv->get_display_settings( ).
    lv_title = mo_help->so_txt->text_get_by_msg( iv_id = 'DB6' iv_no = 205 ).
    lo_set->set_list_header( lv_title ).


    DATA: go_column TYPE REF TO cl_salv_column_table,
          lo_cols   TYPE REF TO cl_salv_columns_table.
    "Spaltenueberschrift setzten
    TRY.
        lo_cols = lo_alv->get_columns( ).

        go_column ?= lo_cols->get_column( 'TEXT' ).
        go_column->set_output_length( '116' ).

        go_column ?= lo_cols->get_column( 'TYPE' ).
        go_column->set_icon( if_salv_c_bool_sap=>true ).
        go_column->set_output_length( '3' ).


        go_column ?= lo_cols->get_column( 'ID' ).
        go_column->set_output_length( '2' ).
        IF iv_show_simple = abap_true.
          go_column->set_technical( abap_true ).
        ENDIF.


        go_column ?= lo_cols->get_column( 'NO' ).
        go_column->set_output_length( '3' ).
        IF iv_show_simple = abap_true.
          go_column->set_technical( abap_true ).
        ENDIF.

        """"""""""""""""""""""""""""""
        " Fuktionen anschalten

        DATA:
               lo_func   TYPE REF TO cl_salv_functions_list.

        lo_func =  lo_alv->get_functions( ).

        lo_func->set_all(
      value = if_salv_c_bool_sap=>true ).


        """"""""""""""""""""""""""""""
        " Layoutverwaltung


        IF iv_show_simple = abap_false.

*    DATA: lo_layout type ref to cl_salv_layout.
*
*      lo_layout  = lo_alv->get_layout(  ).
*        lo_layout->set_save_restriction( if_salv_c_layout=>restrict_none ).
*
*
*
**        break-point.
*        DATA: s_layout TYPE salv_s_layout_key . "ls_
*
**        IF ms_init-variant_mode <> cs_variant_type-none.
*          s_layout-handle        = cv_popup_bapi_handle. "ms_layout-s_variant-handle.
*          s_layout-report        = sy-repid. "ms_layout-s_variant-report.
**    s_layout-logical_group = ms_init-variant_usems_layout-s_variant-log_group.
**    s_layout-logical_group = ms_layout-s_variant-log_group.
*          lo_layout->set_key( value = s_layout ).
**        ENDIF.
*
*      lv_vari =  mo_help->so_alv->get_alv_layout_default(
*          EXPORTING
*            iv_repid  = s_layout-report
*            iv_uname  = sy-uname
*            iv_handle = s_layout-handle
**          RECEIVING
**            rv_vari   =
*        ).
*
**        IF ms_init-variant_is_default = abap_true.
*         ms_object-o_layout->set_default( ms_init-variant_is_default ).
*
*          DATA: ls_layo TYPE salv_s_layout.
*          ls_layo = ms_object-o_layout->get_default_layout( ).
*          ms_layout_default-variant  = ls_layo-layout.
*          IF ms_init-variant_mode = cs_variant_type-user_specific.
*            ms_layout_default-username = ms_init-variant_user.
*          ENDIF.
*          ms_layout_default-handle  = ms_init-variant_handle.
*         lo_layout->set_initial_layout(  ms_layout_default-variant ).
**          ms_object-o_layout->set_layout( ms_layout_default-variant ).
*        ENDIF.
*

        ENDIF.

        """"""""""""""""""""""""""""""""""""""""
        " Anzeige

        lo_alv->set_screen_popup(
      EXPORTING
        start_column = '10'
        end_column   = '140'
        start_line   =  '10'
        end_line     = '25' ).

        lo_alv->display( ).


        """""""""""""""""""""""""""""""
        " Fehlerbehandlung
        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        "D  NF1 060 Popup wurde abgebrochen
        mo_help->so_error->raise_msg( iv_id = 'NF1' iv_no = '060' io_previous = lx_salv ) .
    ENDTRY.

  ENDMETHOD.                    "popup_t_bapiret2

  METHOD popup_table.


    DATA:
      lx_salv TYPE REF TO cx_salv_msg,
      lo_alv  TYPE REF TO cl_salv_table.

    FIELD-SYMBOLS:
      <ls_row>   TYPE any,
      <lv_field> TYPE any.

    TRY.

        READ TABLE it_table ASSIGNING <ls_row>
            INDEX 1.
        mo_help->so_check_a_raise->is_not_initial( <ls_row> ).

        ASSIGN COMPONENT 2 OF STRUCTURE <ls_row> TO <lv_field>.
        if <lv_field> is not assigned.
        mo_help->so_check_a_raise->is_not_initial( <lv_field> ).
          endif.


        cl_salv_table=>factory(
          EXPORTING
            list_display   = if_salv_c_bool_sap=>false  "TRUE fuer Listenausgabe
          IMPORTING
            r_salv_table   =  lo_alv     "Objekt ALV
          CHANGING
            t_table        = it_table ). "Tabelle fuer Anzeige


        DATA:
                lo_cols TYPE REF TO cl_salv_columns_table.

        lo_cols = lo_alv->get_columns( ).
        lo_cols->set_optimize( abap_true ).
*
        lo_alv->set_screen_popup(
      EXPORTING
        start_column = '10'
        end_column   = '140'
        start_line   =  '10'
        end_line     = '25' ).

        lo_alv->display( ).

      CATCH cx_salv_msg INTO lx_salv.
        "D  NF1 060 Popup wurde abgebrochen
        mo_help->so_error->raise_msg( iv_id = 'NF1' iv_no = '060' io_previous = lx_salv ) .
    ENDTRY.



  ENDMETHOD.                    "popup_table

METHOD popup_table_a_Select_entry.


    DATA:
      lx_salv TYPE REF TO cx_salv_msg,
      lo_alv  TYPE REF TO cl_salv_table.

    FIELD-SYMBOLS:
      <ls_row>   TYPE any,
      <lv_field> TYPE any.

    TRY.

      do.

        READ TABLE it_table ASSIGNING <ls_row>
            INDEX 1.
        mo_help->so_check_a_raise->is_not_initial( <ls_row> ).

        ASSIGN COMPONENT 2 OF STRUCTURE <ls_row> TO <lv_field>.
        if <lv_field> is not assigned.
        mo_help->so_check_a_raise->is_not_initial( <lv_field> ).
          endif.


        cl_salv_table=>factory(
          EXPORTING
            list_display   = if_salv_c_bool_sap=>false  "TRUE fuer Listenausgabe
          IMPORTING
            r_salv_table   =  lo_alv     "Objekt ALV
          CHANGING
            t_table        = it_table ). "Tabelle fuer Anzeige


        DATA:
                lo_cols TYPE REF TO cl_salv_columns_table.

        lo_cols = lo_alv->get_columns( ).
        lo_cols->set_optimize( abap_true ).
*
        lo_alv->set_screen_popup(
      EXPORTING
        start_column = '10'
        end_column   = '140'
        start_line   =  '10'
        end_line     = '25' ).

        lo_alv->display( ).

      data(lt_rows) = lo_Alv->get_selections( )->get_selected_rows( ).
      if lines( lt_rows ) > 1.
        mo_help->so_gui->popup_inform( 'Mehrere Einträge markiert. Bitte nur einen auswählen.' ).
        elseif  lines( lt_rows ) < 1.
          mo_help->so_error->raise_text( 'Kein Eintrag ausgewählt' ).
        else.
          read table lt_rows into data(ls_row) index 1.
          rv_index = ls_row.
          return.
         endif.
enddo.

      CATCH cx_salv_msg INTO lx_salv.
        "D  NF1 060 Popup wurde abgebrochen
        mo_help->so_error->raise_msg( iv_id = 'NF1' iv_no = '060' io_previous = lx_salv ) .
    ENDTRY.



  ENDMETHOD.                    "popup_table

  METHOD set_progressbar.


    DATA:
          lv_string TYPE string.

    TRY.
        lv_string =  mo_help->so_txt->text_get_by_msg(
             iv_id    = iv_msgid
             iv_no    = iv_msgno
             iv_v1       = iv1
             iv_v2       = iv2
             iv_v3       = iv3
             iv_v4       = iv4 ).

      CATCH cx_t100_msg.

        lv_string = mo_help->so_txt->text_get_w_params(
            iv_text   = iv_text
            iv_v1       = iv1
            iv_v2       = iv2
            iv_v3       = iv3
            iv_v4       = iv4 ).

    ENDTRY.


    CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
      EXPORTING
        percentage = iv_percentage
        text       = lv_string.


  ENDMETHOD.                    "set_progressbar


  METHOD set_statusbar.


    SET PF-STATUS iv_name_status OF PROGRAM iv_name_program.

    IF sy-subrc <> 0.

    ENDIF.


  ENDMETHOD.                    "set_statusbar


  METHOD set_title.


    DATA:
      lx_error TYPE REF TO cx_t100_msg,
      lv_title TYPE string.

    IF iv_msgid IS NOT INITIAL AND iv_msgno IS NOT INITIAL.
      TRY.
          lv_title = mo_help->so_txt->text_get_by_msg(
              iv_id    =  iv_msgid   " IV_MSGID
              iv_no    =  iv_msgno   " IV_MSGNO
*        iv_langu    = SY-LANGU    " IV_LANGU
*        iv_v1       =     " IV_V1
*        iv_v2       =     " IV_V2
*        iv_v3       =     " IV_V3
*        iv_v4       =     " IV_V4
*        iv_v5       =     " IV_V5
*        it_params   =     " IT_PARAMS
*      RECEIVING
*        rv_string   =     " RV_STRING
          ).
        CATCH cx_t100_msg.    "
      ENDTRY.
    ELSE.
      lv_title = iv_title.
    ENDIF.

    "generischer SAP Title der auch vom cl_salv_table benutzt wird
    SET TITLEBAR '003'
    OF PROGRAM 'SAPLKKBL'
    WITH lv_title.

    IF sy-subrc <> 0.
      lx_error = mo_help->so_error->factory_text(
              'Titel konnte nicht gesetzt werden. Titlebar "GENERIC" in Program "SAPLZ034TSD_SHM_SCREEN" nicht gefunden.' ).
      RAISE EXCEPTION lx_error.
    ENDIF.


  ENDMETHOD.                    "set_title


  METHOD on_link_click.

*    break-point.
    sv_index = row.
    LEAVE TO SCREEN 0.

  ENDMETHOD.

  METHOD selscrn_load_variant.

    DATA:
            lv_char100 TYPE c LENGTH 100.

*    call SELECTION-SCREEN '100' starting at 10 10 ending at 100 100 .

    IF sy-slset IS INITIAL.

      SELECT SINGLE mandt
        FROM vari
        INTO sy-mandt
        WHERE report = iv_repid "sy-repid
        AND variant = iv_name.
      mo_help->so_check_a_raise->after_select(  ).


      lv_char100 = iv_name.

*    SUBMIT (iv_repid) "z034tsd_ship_monitor_start
*        VIA SELECTION-SCREEN
*        USING SELECTION-SET lv_char100.


    ENDIF.

  ENDMETHOD.                    "selscrn_load_variant

  METHOD popup_t_balmt.

    DATA:
      lx_salv TYPE REF TO cx_salv_msg,
      lo_alv  TYPE REF TO cl_salv_table,
      ls_balmt like line of it_balmt,
      lt_balmt type STANDARD TABLE OF balm,
      lv_lognumber type string.

    TYPE-POOLS: icon.

    TYPES:

      BEGIN OF ty_s_output,

       date type datum,
            time type uzeit,

        type TYPE string,
        id   TYPE string,
        no   TYPE string,
        text TYPE string,

      END OF ty_s_output.

    data:
 ls_output TYPE ty_s_output.

    DATA:
     lt_output TYPE STANDARD TABLE OF ty_s_output.

lt_balmt = it_balmt.

    sort lt_balmt by time_stmp ascending.

       LOOP AT lt_balmt INTO ls_balmt.

       if "lv_lognumber is not initial
       lv_lognumber <> ls_balmt-lognumber.
*          APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
          ls_output-text = '-------------------------'.
          insert ls_output into lt_output index 1.
          free ls_output.
*          continue.
*        APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
        concatenate 'Logno.:' ls_balmt-lognumber into ls_output-text.
           insert ls_output into lt_output index 1.
          free ls_output.
       endif.
       lv_lognumber = ls_balmt-lognumber.

*      APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
*      <ls_output>-type = ls_bapi-type.
      ls_output-text = mo_help->so_txt->text_get_by_any( ls_balmt ). " ls_balmt-msgidmessage.

     ls_output-id = ls_balmt-msgid.
      ls_output-no = ls_balmt-msgno.
*      <ls_output>-no = ls_balmt-msgno.

      CASE ls_balmt-msgty.

        WHEN 'E'.
          ls_output-type = icon_incomplete.
        WHEN 'S'.
          ls_output-type = icon_checked.
        WHEN 'I'.
          ls_output-type = icon_message_information.
        WHEN 'W'.
          ls_output-type = icon_message_warning.
      ENDCASE.


    mo_help->so_abap->conv_time(
                exporting
                iv_timestampl = ls_balmt-time_stmp
                importing
                ev_date = ls_output-date
                ev_time = ls_output-time ) .

   insert ls_output into lt_output index 1.
          free ls_output.

    ENDLOOP.

    DATA:
      lo_set   TYPE REF TO cl_salv_display_settings,
      lv_title TYPE lvc_title.

    cl_salv_table=>factory(
      EXPORTING
        list_display   = if_salv_c_bool_sap=>false  "TRUE fuer Listenausgabe
      IMPORTING
        r_salv_table   =  lo_alv     "Objekt ALV
      CHANGING
        t_table        = lt_output ). "Tabelle fuer Anzeige


    lo_set = lo_alv->get_display_settings( ).
    lv_title = mo_help->so_txt->text_get_by_msg( iv_id = 'DB6' iv_no = 205 ).
    lo_set->set_list_header( lv_title ).


    DATA: go_column TYPE REF TO cl_salv_column_table,
          lo_cols   TYPE REF TO cl_salv_columns_table.
    "Spaltenueberschrift setzten
    TRY.
        lo_cols = lo_alv->get_columns( ).

        go_column ?= lo_cols->get_column( 'TEXT' ).
        go_column->set_output_length( '100' ).

        go_column ?= lo_cols->get_column( 'TYPE' ).
        go_column->set_icon( if_salv_c_bool_sap=>true ).
        go_column->set_output_length( '3' ).


        go_column ?= lo_cols->get_column( 'ID' ).
        go_column->set_output_length( '2' ).
        IF iv_show_simple = abap_true.
          go_column->set_technical( abap_true ).
        ENDIF.


        go_column ?= lo_cols->get_column( 'NO' ).
        go_column->set_output_length( '3' ).
        IF iv_show_simple = abap_true.
          go_column->set_technical( abap_true ).
        ENDIF.

        """"""""""""""""""""""""""""""
        " Fuktionen anschalten

        DATA:
               lo_func   TYPE REF TO cl_salv_functions_list.

        lo_func =  lo_alv->get_functions( ).

        lo_func->set_all(
      value = if_salv_c_bool_sap=>true ).


        """"""""""""""""""""""""""""""
        " Layoutverwaltung


        IF iv_show_simple = abap_false.

*    DATA: lo_layout type ref to cl_salv_layout.
*
*      lo_layout  = lo_alv->get_layout(  ).
*        lo_layout->set_save_restriction( if_salv_c_layout=>restrict_none ).
*
*
*
**        break-point.
*        DATA: s_layout TYPE salv_s_layout_key . "ls_
*
**        IF ms_init-variant_mode <> cs_variant_type-none.
*          s_layout-handle        = cv_popup_bapi_handle. "ms_layout-s_variant-handle.
*          s_layout-report        = sy-repid. "ms_layout-s_variant-report.
**    s_layout-logical_group = ms_init-variant_usems_layout-s_variant-log_group.
**    s_layout-logical_group = ms_layout-s_variant-log_group.
*          lo_layout->set_key( value = s_layout ).
**        ENDIF.
*
*      lv_vari =  mo_help->so_alv->get_alv_layout_default(
*          EXPORTING
*            iv_repid  = s_layout-report
*            iv_uname  = sy-uname
*            iv_handle = s_layout-handle
**          RECEIVING
**            rv_vari   =
*        ).
*
**        IF ms_init-variant_is_default = abap_true.
*         ms_object-o_layout->set_default( ms_init-variant_is_default ).
*
*          DATA: ls_layo TYPE salv_s_layout.
*          ls_layo = ms_object-o_layout->get_default_layout( ).
*          ms_layout_default-variant  = ls_layo-layout.
*          IF ms_init-variant_mode = cs_variant_type-user_specific.
*            ms_layout_default-username = ms_init-variant_user.
*          ENDIF.
*          ms_layout_default-handle  = ms_init-variant_handle.
*         lo_layout->set_initial_layout(  ms_layout_default-variant ).
**          ms_object-o_layout->set_layout( ms_layout_default-variant ).
*        ENDIF.
*

        ENDIF.

        data: lo_cont type ref to cl_gui_docking_container.


    create object lo_cont
      EXPORTING
        parent                      =  cl_gui_container=>screen1   " Parent container
*        repid                       =     " Report to Which This Docking Control is Linked
*        dynnr                       =     " Screen to Which This Docking Control is Linked
*        side                        = DOCK_AT_LEFT    " Side to Which Control is Docked
*        extension                   = 50    " Control Extension
*        style                       =     " Windows Style Attributes Applied to This Docking Container
*        lifetime                    = LIFETIME_DEFAULT    " Lifetime
*        caption                     =     " Caption
*        metric                      = 0    " Metric
*        ratio                       =     " Percentage of Screen: Takes Priority Over EXTENSION
*        no_autodef_progid_dynnr     =     " Don't Autodefined Progid and Dynnr?
*        name                        =     " Name
      EXCEPTIONS
        cntl_error                  = 1
        cntl_system_error           = 2
        create_error                = 3
        lifetime_error              = 4
        lifetime_dynpro_dynpro_link = 5
        others                      = 6
      .
    IF sy-subrc <> 0.
*     MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*                WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.

*       lo_Cont ?=  mo_help->so_cfw->cfw_get_container(
*          EXPORTING
**            iv_type      = CL_GUI_CONTAINER=>CONTAINER_TYPE_DOCKING
*            iv_repid     = 'SAPLSLVC_FULLSCREEN'
*            iv_dynnr     = '0700'
*            iv_side      = CL_GUI_DOCKING_CONTAINER=>DOCK_AT_LEFT
**          RECEIVING
**            ro_container =
*        ).
*          CATCH cx_t100_msg.    "

*        lo_cont->dock_at(
**          EXPORTING
*            side              = CL_GUI_DOCKING_CONTAINER=>DOCK_AT_LEFT    " Dock This Control at Specified Side of its Parent
*          EXCEPTIONS
*            cntl_error        = 1
*            cntl_system_error = 2
*            others            = 3
*        ).
        IF sy-subrc <> 0.
*         MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*                    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
        ENDIF.
*
 CALL METHOD cl_gui_cfw=>flush
     EXCEPTIONS
         OTHERS = 1.

*        lo_cont->set_visible(
*          EXPORTING
*            visible           =     " Visible
**          EXCEPTIONS
**            cntl_error        = 1
**            cntl_system_error = 2
**            others            = 3
*        ).
*        IF sy-subrc <> 0.
**         MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
**                    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*        ENDIF.(  ).

        """"""""""""""""""""""""""""""""""""""""
        " Anzeige

        lo_alv->set_screen_popup(
      EXPORTING
        start_column = '10'
        end_column   = '145'
        start_line   =  '10'
        end_line     = '25' ).

        lo_alv->display( ).


        """""""""""""""""""""""""""""""
        " Fehlerbehandlung
        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        "D  NF1 060 Popup wurde abgebrochen
        mo_help->so_error->raise_msg( iv_id = 'NF1' iv_no = '060' io_previous = lx_salv ) .
    ENDTRY.


  ENDMETHOD.

ENDCLASS.                    "lcl_help_gui IMPLEMENTATION

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENDE - GUI Helper - Einfache Funktionen, ALV, Control Framework
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

CLASS lcl_help_factory_all IMPLEMENTATION.

  METHOD class_constructor.

    IF ss_singleton-so_abap  IS NOT BOUND.
      CREATE OBJECT ss_singleton-so_abap.
    ENDIF.
    so_txt =  ss_singleton-so_abap.

    CREATE OBJECT so_abap.


    IF ss_singleton-so_service  IS NOT BOUND.
      CREATE OBJECT ss_singleton-so_service.
    ENDIF.
    so_service =  ss_singleton-so_service.

*    IF ms_singleton-so_string  IS NOT BOUND.
*      CREATE OBJECT ms_singleton-so_string.
*    ENDIF.
*    mo_string =  ms_singleton-so_string.


    CREATE OBJECT so_error.
*      EXPORTING
*        iv_classname_error = cs_const-name_c_class.


    CREATE OBJECT so_check_a_raise.
*      EXPORTING
*        iv_classname_error = cs_const-name_c_class.


    CREATE OBJECT so_data.
*    CREATE OBJECT so_cfw.
    CREATE OBJECT so_bl.



    IF ss_singleton-so_gui  IS NOT BOUND.
      CREATE OBJECT ss_singleton-so_gui.
    ENDIF.
    so_gui =  ss_singleton-so_gui.

    IF ss_singleton-so_cfw  IS NOT BOUND.
      CREATE OBJECT ss_singleton-so_cfw.
    ENDIF.
    so_cfw =  ss_singleton-so_cfw.


*    CREATE OBJECT so_cust.

    CREATE OBJECT so_alv.


    CREATE OBJECT so_time.

    CREATE OBJECT so_itab.

  ENDMETHOD.                    "constructor


  METHOD string.
    CREATE OBJECT ro_result.
  ENDMETHOD.                    "string

  METHOD table.
    CREATE OBJECT ro_result.
  ENDMETHOD.                    "table

*  METHOD time_by_date_time.
*    CREATE OBJECT ro_result.
*  ENDMETHOD.

  METHOD time.

  create object ro_result.

*    so_gui->p
  ENDMETHOD.                    "time


*  METHOD log.
*    CREATE OBJECT ro_result.
*  ENDMETHOD.                    "log

ENDCLASS.                    "lcl_help_factory_all IMPLEMENTATION
