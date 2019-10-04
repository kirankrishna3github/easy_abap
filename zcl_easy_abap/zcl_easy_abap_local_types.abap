*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcx_no_check DEFINITION DEFERRED.
class lcl_help_gui DEFINITION DEFERRED.

CLASS lcl_help DEFINITION.

  PUBLIC SECTION.
    TYPES ty_o_easy_abap TYPE REF TO ZCL_001_00_TEST.
    types ty_o_easy_gui  type ref to lcl_help_gui.

    CLASS-DATA so_help  TYPE ty_o_easy_abap.
    CLASS-DATA lr_tab TYPE REF TO data.
    CONSTANTS cv_rfc_function_name TYPE string VALUE 'ZFM_KAL_EASY_RFC_CALL_V06'.

    CLASS-DATA:
      sv_is_assert_when_error TYPE abap_bool VALUE abap_false.


    CLASS-METHODS so10_write
      IMPORTING
        i_any    TYPE any
        i_key1   TYPE any
        i_key2   TYPE any
        i_key3   TYPE any
        i_key4   TYPE any
        i_commit TYPE abap_bool.

    CLASS-METHODS convert_binary_2_xstring
      IMPORTING
        it_input        TYPE solix_tab
      RETURNING
        VALUE(r_result) TYPE xstring .

    CLASS-METHODS convert_xstring_2_binary
      IMPORTING
        iv_input        TYPE xstring
      RETURNING
        VALUE(r_result) TYPE solix_tab.

    CLASS-METHODS so10_read
      IMPORTING
        i_key1   TYPE any
        i_key2   TYPE any
        i_key3   TYPE any
        i_key4   TYPE any
      EXPORTING
        e_result TYPE data.

    CLASS-METHODS:
      gos_read_object_list
        IMPORTING
          iv_instid        TYPE any "sibflporb-instid    "= rels-instid_a. "p_instid.
          iv_typeid        TYPE any "sibflporb-typeid " #"= rels-typeid_a . "p_typeid.
          iv_catid         TYPE any "sibflporb-catid
*          use_exceptions   TYPE abap_bool DEFAULT abap_true
        RETURNING
          VALUE(et_result) TYPE obl_t_link.


    CLASS-METHODS:
      gos_read_object_head
        IMPORTING
          is_link         TYPE obl_s_link
*          use_exceptions  TYPE abap_bool DEFAULT abap_true
        RETURNING
          VALUE(r_result) TYPE sofolenti1
        .

    CLASS-METHODS:
      gos_read_object_content
        IMPORTING
          is_link         TYPE obl_s_link
*          use_exceptions  TYPE abap_bool DEFAULT abap_true
        RETURNING
          VALUE(r_result) TYPE xstring
        .


    CLASS-METHODS gos_create_object
      IMPORTING
        iv_data           TYPE xstring
        iv_filename_w_ext TYPE any DEFAULT 'example.pdf'
        iv_instid         TYPE any "sibflporb-instid    "= rels-instid_a. "p_instid.
        iv_typeid         TYPE any "sibflporb-typeid " #"= rels-typeid_a . "p_typeid.
        iv_catid          TYPE any
        commit_work       TYPE abap_bool DEFAULT abap_false
        use_exceptions    TYPE abap_bool DEFAULT abap_true. "sibflporb-catid.

    CLASS-METHODS gui_upload
      IMPORTING
        iv_type         TYPE any DEFAULT 'BIN'
        use_exceptions  TYPE abap_bool DEFAULT abap_true
      RETURNING
        VALUE(r_result) TYPE xstring.

    CLASS-METHODS gui_download
      IMPORTING
        iv_input         TYPE xstring
        iv_filname_w_ext TYPE any DEFAULT 'example.pdf'
        iv_filter        TYPE any DEFAULT '(*.pdf)|*.pdf|'
        iv_type          TYPE any DEFAULT 'BIN'
        use_exceptions   TYPE abap_bool DEFAULT abap_true.
*            raising

    CLASS-METHODS t100_get
      IMPORTING
        VALUE(i_any)    TYPE any
      RETURNING
        VALUE(r_result) TYPE bapiret2_tab.

    CLASS-METHODS: data_t100_get
      IMPORTING
        is_bapi        TYPE bapiret2
        iv_langu       TYPE clike DEFAULT sy-langu
      EXPORTING
        VALUE(es_t100) TYPE t100,
*        es_bapiret     TYPE bapiret2,

      rtts_get_fieldname_by_type_tab
        IMPORTING
          iv_typename     TYPE clike
          iv_tabname      TYPE clike
        RETURNING
          VALUE(r_result) TYPE string.



    CLASS-METHODS  http_request_get
      IMPORTING
        iv_host              TYPE string DEFAULT 'http://eloquentjavascript.net'
        iv_uri               TYPE string DEFAULT '/author'
        iv_authenticate_name TYPE clike OPTIONAL
        iv_authenticate_pw   TYPE clike OPTIONAL
      EXPORTING
        ev_result            TYPE string
      RAISING
        cx_t100_msg.


    CLASS-METHODS t100_set
      IMPORTING
        it_bapi TYPE bapiret2_tab
      EXPORTING
        e_any   TYPE any.
    CLASS-METHODS rtts_get_comp_tab
      IMPORTING
        i_any               TYPE any
      RETURNING
        VALUE(rt_component) TYPE abap_component_tab.

    CLASS-METHODS is_range_valid
      IMPORTING
        i_any           TYPE any
      RETURNING
        VALUE(r_result) TYPE abap_bool.


    CLASS-METHODS:
      popup_clike_one_line
        IMPORTING
          it_text TYPE stringtab,

      popup_print
        IMPORTING
          it_text TYPE stringtab,

      popup_t100
        IMPORTING
          it_bapi TYPE bapiret2_tab,

      popup_t100_ext
        IMPORTING
          it_bapi TYPE bapiret2_tab,

      popup_table
        IMPORTING
          it_table TYPE STANDARD TABLE,

      popup_f4_help
        IMPORTING
          !iv_name_search_help TYPE string
          !iv_name_field       TYPE string
        RETURNING
          VALUE(rv_resault)    TYPE string,


      popup_exception
        IMPORTING
          ix_root TYPE REF TO cx_root,

      popup_choose
        IMPORTING
          iv_title        TYPE any OPTIONAL
          it_choices      TYPE any
          i_sel           TYPE any
        RETURNING
          VALUE(r_result) TYPE string, "0 wenn cancel oder geschlossen

      popup_json_deep
        IMPORTING
          iv_serial TYPE clike,

      popup_sel_option
        IMPORTING
                  iv_tab    TYPE string
                  iv_field  TYPE string
        EXPORTING et_range  TYPE STANDARD TABLE
                  ev_cancel TYPE abap_bool, "DEFAULT abap_false,

      call_transaction
        IMPORTING
          !iv_transaction_name TYPE clike
          !iv_field1_name      TYPE clike OPTIONAL
          !iv_field1_value     TYPE clike OPTIONAL
          !iv_field2_name      TYPE clike OPTIONAL
          !iv_field2_value     TYPE clike OPTIONAL
          !iv_field3_name      TYPE clike OPTIONAL
          !iv_field3_value     TYPE clike OPTIONAL.



    CLASS-METHODS gui_popup_bal
      IMPORTING
        !iv_object    TYPE clike
        !iv_subobject TYPE clike OPTIONAL
        !iv_extnumber TYPE clike OPTIONAL .
    CLASS-METHODS gui_popup_xml
      IMPORTING
        i_iv_xml TYPE string.
    CLASS-METHODS gui_popup_inform
      IMPORTING
        is_bapi TYPE bapiret2.
    CLASS-METHODS gui_popup_confirm
      IMPORTING
        is_bapi         TYPE bapiret2
      RETURNING
        VALUE(r_result) TYPE abap_bool.
*    CLASS-METHODS gui_popup_t100
*      IMPORTING
*        VALUE(it_bapi) TYPE bapiret2_tab.
    CLASS-METHODS:
      class_constructor,
      rtts_get_domrange
        IMPORTING
          iv_value TYPE any
        EXPORTING
          et_tab   TYPE STANDARD TABLE,


      bal_read
        IMPORTING
          iv_object       TYPE clike
          iv_subobject    TYPE clike OPTIONAL
          iv_extnumber    TYPE clike OPTIONAL
        RETURNING
          VALUE(rt_balmt) TYPE balm_t
        RAISING
          cx_t100_msg,


      rtts_is_in_domrange
        IMPORTING
          iv_any           TYPE any
        RETURNING
          VALUE(rv_result) TYPE abap_bool,


      popup_f4_help_tab
        IMPORTING
          iv_fieldname     TYPE any
          it_table         TYPE STANDARD TABLE
        RETURNING
          VALUE(rv_result) TYPE string,

      data_2_params
        IMPORTING
          iv_repid         TYPE clike DEFAULT sy-repid
        RETURNING
          VALUE(rt_params) TYPE rsparams_tt,


      data_2_single_value
        IMPORTING
          iv_repid         TYPE clike DEFAULT sy-repid
          iv_name          TYPE clike
        RETURNING
          VALUE(rv_string) TYPE string,


      data_2_struct
        IMPORTING
          iv_repid     TYPE clike DEFAULT sy-repid
        EXPORTING
          es_structure TYPE any,



      data_2_where_dirty
        IMPORTING
          iv_repid        TYPE clike DEFAULT sy-repid
          iv_tabname      TYPE clike
        RETURNING
          VALUE(r_result) TYPE string,

      data_2_where_join
        IMPORTING
          i_spfli         TYPE clike
        RETURNING
          VALUE(r_result) TYPE string,

      data_2_rangetab_dirty
        IMPORTING
          iv_repid         TYPE clike DEFAULT sy-repid
          iv_tabname       TYPE clike
        RETURNING
          VALUE(rt_result) TYPE rsds_frange_t,

      data_2_single_type_dirty
        IMPORTING
          i_ls_params_name TYPE any
          iv_repid         TYPE clike DEFAULT sy-repid
        RETURNING
          VALUE(r_result)  TYPE REF TO cl_abap_datadescr,

      data_2_single_range
        IMPORTING
          iv_repid        TYPE clike DEFAULT sy-repid
          iv_name         TYPE clike
        RETURNING
          VALUE(rt_range) TYPE rsds_selopt_t,


      gui_popup_get_value
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
          !ev_value1      TYPE any
          !ev_value2      TYPE clike
          !ev_value3      TYPE clike
          !ev_value4      TYPE clike
          !ev_value5      TYPE clike
        RAISING
          cx_t100_msg,

      popup_f4_help_vari_selscreen
        IMPORTING
          iv_repid         TYPE clike DEFAULT sy-repid
        RETURNING
          VALUE(rv_result) TYPE string,
      source_code_get_fubaname
        IMPORTING
          it_source TYPE stringtab
        EXPORTING
          e_v1      TYPE string
          e_v2      TYPE string
          e_v3      TYPE string,
      source_code_get_readtable
        IMPORTING
          it_source       TYPE stringtab
        RETURNING
          VALUE(r_result) TYPE string,
      source_code_get_selectname
        IMPORTING
          it_source       TYPE stringtab
        RETURNING
          VALUE(r_result) TYPE string,

      bal_save
        IMPORTING
          i_any  TYPE any
          is_log TYPE bal_s_log,
      selscreen_struc_2_screen
        IMPORTING
          iv_repid        TYPE any
          VALUE(is_struc) TYPE any.

    CLASS-METHODS trans_params_2_struc
      IMPORTING
        it_params TYPE rsparams_tt
      EXPORTING
        es_struc  TYPE any.

    CLASS-METHODS: t100_get_w_text
      IMPORTING
        iv_text         TYPE any
        iv_v1           TYPE any OPTIONAL
        iv_v2           TYPE any OPTIONAL
        iv_v3           TYPE any OPTIONAL
        iv_v4           TYPE any OPTIONAL
      RETURNING
        VALUE(r_result) TYPE bapiret2.

    CLASS-METHODS: t100_replace_placeholder
      IMPORTING
        is_bapi         TYPE bapiret2
      RETURNING
        VALUE(r_result) TYPE bapiret2,

      lock_set
        IMPORTING
          iv_val1       TYPE any DEFAULT sy-mandt
          iv_val2       TYPE clike
          iv_val3       TYPE clike OPTIONAL
          iv_val4       TYPE any   OPTIONAL
          iv_lock       TYPE clike
          iv_mode       TYPE clike DEFAULT 'E'
          iv_scope      TYPE clike DEFAULT '2'
          iv_is_collect TYPE abap_bool DEFAULT abap_false
        RAISING
          cx_t100_msg,


      lock_free
        IMPORTING
          iv_val1       TYPE any DEFAULT sy-mandt
          iv_val2       TYPE clike
          iv_val3       TYPE clike OPTIONAL
          iv_val4       TYPE any OPTIONAL
          iv_lock       TYPE clike
          iv_mode       TYPE clike DEFAULT 'E'
          iv_scope      TYPE clike DEFAULT '2'
          iv_is_collect TYPE abap_bool DEFAULT abap_false
        RAISING
          cx_t100_msg,

      lock_is_set
        IMPORTING
          iv_val           TYPE clike
          iv_val2          TYPE clike OPTIONAL
          iv_val3          TYPE clike OPTIONAL
          iv_val4          TYPE clike OPTIONAL
*          iv_field         TYPE clike
          iv_lock          TYPE clike
          iv_unam          TYPE any DEFAULT sy-uname
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

      lock_collect_free,

      cx_set
        IMPORTING
          ix_no_check TYPE REF TO lcx_no_check
          ix_prev     TYPE REF TO cx_root,
      cx_no_2_static
        IMPORTING
          i_lx_no         TYPE REF TO cx_no_check
        RETURNING
          VALUE(r_result) TYPE REF TO cx_static_check,
      source_code_get_not_initial
        RETURNING
          VALUE(r_result) TYPE string,
      get_convexit
        IMPORTING
          VALUE(i_any)    TYPE any
          !iv_type        TYPE clike OPTIONAL
          iv_exit         TYPE any OPTIONAL
          !iv_is_input    TYPE abap_bool DEFAULT abap_true
        RETURNING
          VALUE(r_result) TYPE string .

    METHODS: gui_popup_alf_f4_vari.

    CLASS-METHODS:   selscreen_set
      IMPORTING
        !i_any          TYPE any OPTIONAL
        VALUE(iv_repid) TYPE any OPTIONAL
        !raise_error    TYPE abap_bool DEFAULT abap_false
          PREFERRED PARAMETER i_any ,

      selscreen_get
        IMPORTING
          VALUE(iv_repid)       TYPE any OPTIONAL
          !iv_variant           TYPE any OPTIONAL
          !iv_multi_tabname     TYPE clike OPTIONAL
          !iv_single_fieldname  TYPE any OPTIONAL
          !iv_value_name        TYPE any OPTIONAL
          !raise_error          TYPE abap_bool DEFAULT abap_false
        EXPORTING
          !et_range_multi_dirty TYPE rsds_frange_t
          !et_range_single      TYPE rsds_selopt_t
          !et_parameter         TYPE rsparams_tt
          !ev_value             TYPE clike
          !es_struc             TYPE any ,

      write
        IMPORTING
          i_any           TYPE any
        RETURNING
          VALUE(r_result) TYPE string,

      handle_error
        IMPORTING
          ix_root      TYPE REF TO cx_root
          raise_assert TYPE abap_bool OPTIONAL
          raise_error  TYPE abap_bool,

      round2
        IMPORTING
          i_any       TYPE any
          iv_decimals TYPE any
        EXPORTING
          e_result    TYPE any,

      conv_unit
        IMPORTING
          i_any      TYPE any
          i_unit_in  TYPE any
          i_unit_out TYPE any
        EXPORTING
          e_result   TYPE any,

      popup_alv_f4
        IMPORTING
          iv_handle      TYPE clike OPTIONAL
          iv_uname       TYPE clike OPTIONAL
          iv_repid       TYPE clike OPTIONAL
        RETURNING
          VALUE(rv_vari) TYPE string,

      gui_popup_bal_tab
        IMPORTING
          i_any TYPE balm_t,

      popup_json
        IMPORTING
          i_any TYPE any,

      popup_cust
        IMPORTING
          i_any TYPE REF TO data,

      init_cust
*      IMPORTING
*          I_ANY TYPE ref to data
        EXPORTING
          e_any2 TYPE data,

      mock_data
        exporting
          e_mock TYPE any.

    CLASS-METHODS cfw_get_fcat
      IMPORTING
        !it_table       TYPE STANDARD TABLE
      RETURNING
        VALUE(r_result) TYPE lvc_t_fcat .

  PROTECTED SECTION.


    CLASS-METHODS:
      lock_queue
        IMPORTING
          iv_is_lock     TYPE abap_bool DEFAULT abap_true "iv_fm_name TYPE clike
          VALUE(iv_val1) TYPE clike OPTIONAL
          VALUE(iv_val2) TYPE clike OPTIONAL
          VALUE(iv_val3) TYPE clike OPTIONAL
          VALUE(iv_val4) TYPE clike OPTIONAL
          iv_params      TYPE clike OPTIONAL
*          iv_field      TYPE clike
*          iv_tab        TYPE clike
          iv_lock        TYPE clike
          iv_mode        TYPE clike DEFAULT 'E'
          iv_scope       TYPE clike DEFAULT '1'
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
                  iv_val4              TYPE any OPTIONAL
        RETURNING VALUE(rt_parameters) TYPE abap_func_parmbind_tab
        RAISING
                  cx_t100_msg.



ENDCLASS.



CLASS lcl_help_gui DEFINITION
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES ty_o_easy_abap TYPE lcl_help=>ty_o_easy_abap.
    TYPES ty_o_easy_alv TYPE lcl_help=>ty_o_easy_gui .
    TYPES:
      BEGIN OF ty_s_event,
        type         TYPE string,
        row          TYPE i,
        col          TYPE string,
        value        TYPE string,
        line         TYPE REF TO data,
        sender       TYPE REF TO cl_salv_events,
        ucomm        TYPE string,
        o_object     TYPE REF TO object,
        t_selections TYPE salv_t_row,
      END OF ty_s_event .

    TYPES:
      BEGIN OF ty_s_col_setup,
        name       TYPE string,
        is_tech    TYPE abap_bool,
        is_icon    TYPE abap_bool,
        is_hotspot TYPE abap_bool,
        is_button  TYPE abap_bool,
        out_length TYPE string,
        title      TYPE string,
        color      TYPE string,
      END OF ty_s_col_setup .
    TYPES:
      ty_t_setup TYPE STANDARD TABLE OF ty_s_col_setup WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ty_s_option,
        title                    TYPE string, " OPTIONAL
        vertical_lines           TYPE abap_bool, " DEFAULT abap_true
        headers_visible          TYPE abap_bool, " DEFAULT abap_true
        raise_double_click       TYPE abap_bool, " DEFAULT abap_true
        t_raise_hotspot          TYPE stringtab , "DEFAULT abap_true
        raise_after_data_changed TYPE abap_bool , "DEFAULT abap_true
        raise_f4                 TYPE abap_bool , "DEFAULT abap_true
        t_col_setting            TYPE ty_t_setup, " OPTIONAL
        t_hide                   TYPE stringtab, " OPTIONAL
        t_sort                   TYPE stringtab, " OPTIONAL
        t_edit                   TYPE stringtab, " OPTIONAL
        t_raise_f4               TYPE stringtab,
        optimize_colwidth        TYPE abap_bool, " DEFAULT abap_falseA
        default_toolbar          TYPE abap_bool,
        t_toolbar                TYPE ttb_button,
        t_outlen                 TYPE name2stringvalue_table,
        selmode                  TYPE string,
        layout_restriction       TYPE string,
        s_layout                 TYPE disvariant,
        name_row_color           TYPE string,
        name_row_style           TYPE string,
        t_toolbar_hide           TYPE stringtab,
      END OF ty_s_option .
    TYPES:
      BEGIN OF ty_s_log_output,
        icon_status TYPE c LENGTH 4,
        number      TYPE bapiret2-number,
        id          TYPE bapiret2-id,
        message     TYPE bapiret2-message,
        type        TYPE bapiret2-type,
        t_color     TYPE lvc_t_scol,
        message_v1  TYPE bapiret2-message_v1,
        message_v2  TYPE bapiret2-message_v2,
        message_v3  TYPE bapiret2-message_v3,
        message_v4  TYPE bapiret2-message_v4,
      END OF ty_s_log_output .

    DATA:
      BEGIN OF ms_salv,
        o_salv       TYPE REF TO cl_salv_table,
        o_columns    TYPE REF TO cl_salv_columns_table,
        o_settings   TYPE REF TO cl_salv_display_settings,
        o_functions  TYPE REF TO cl_salv_functions_list,
        o_events     TYPE REF TO cl_salv_events_table,
        o_sorts      TYPE REF TO cl_salv_sorts,
        o_selections TYPE REF TO cl_salv_selections,
        o_layout     TYPE REF TO cl_salv_layout,
      END OF ms_salv .
    DATA:
      BEGIN OF ms_grid,
        o_grid         TYPE REF TO cl_gui_alv_grid,
        t_fieldcat     TYPE lvc_t_fcat,
        s_layout       TYPE lvc_s_layo,
        t_toolbar_excl TYPE ui_functions,
      END OF ms_grid .
    DATA:
      BEGIN OF ms_control READ-ONLY,
        is_popup       TYPE abap_bool,
        is_raise_event TYPE abap_bool,
        o_parent_cont  TYPE REF TO cl_gui_container,
        r_table        TYPE REF TO data,
        is_type_grid   TYPE abap_bool,
        is_type_salv   TYPE abap_bool,
        is_modal_popup TYPE abap_bool,
        repid          TYPE sy-repid,
        dynnr          TYPE sy-dynnr,
      END OF ms_control .
    DATA ms_option TYPE ty_s_option .
    DATA ms_event TYPE ty_s_event READ-ONLY .
    DATA mt_log TYPE bapiret2_tab .
    DATA:
      BEGIN OF  ms_log ,
        t_log TYPE STANDARD TABLE OF ty_s_log_output WITH EMPTY KEY,
      END OF ms_log .
    CLASS-DATA so_help TYPE ty_o_easy_abap .

    EVENTS user_action .

    CLASS-METHODS gui_popup_get_value
      IMPORTING
        !iv_title              TYPE clike OPTIONAL
        VALUE(iv_tab_field_1)  TYPE clike OPTIONAL
        !iv_is_input1          TYPE abap_bool DEFAULT abap_true
        VALUE(iv_tab_field_2)  TYPE clike OPTIONAL
        !iv_is_input2          TYPE abap_bool DEFAULT abap_true
        VALUE(iv_tab_field_3)  TYPE clike OPTIONAL
        !iv_is_input3          TYPE abap_bool DEFAULT abap_true
        VALUE(iv_tab_field_4)  TYPE clike OPTIONAL
        !iv_is_input4          TYPE abap_bool DEFAULT abap_true
        VALUE(iv_tab_field_5)  TYPE clike OPTIONAL
        !iv_is_input5          TYPE abap_bool DEFAULT abap_true
        VALUE(iv_tab_field_6)  TYPE clike OPTIONAL
        !iv_is_input6          TYPE abap_bool DEFAULT abap_true
        VALUE(iv_tab_field_7)  TYPE clike OPTIONAL
        !iv_is_input7          TYPE abap_bool DEFAULT abap_true
        VALUE(iv_tab_field_8)  TYPE clike OPTIONAL
        !iv_is_input8          TYPE abap_bool DEFAULT abap_true
        VALUE(iv_tab_field_9)  TYPE clike OPTIONAL
        !iv_is_input9          TYPE abap_bool DEFAULT abap_true
        VALUE(iv_tab_field_10) TYPE clike OPTIONAL
        !iv_is_input10         TYPE abap_bool DEFAULT abap_true
      EXPORTING
        !ev_user_cancel        TYPE abap_bool
        !ev_value1             TYPE any
        !ev_value2             TYPE any
        !ev_value3             TYPE any
        !ev_value4             TYPE any
        !ev_value5             TYPE any
        !ev_value6             TYPE any
        !ev_value7             TYPE any
        !ev_value8             TYPE any
        !ev_value9             TYPE any
        !ev_value10            TYPE any .
    METHODS get_selected_tab
      EXPORTING
        !et_any TYPE STANDARD TABLE .
    METHODS constructor
      IMPORTING
        !ct_table          TYPE any OPTIONAL
        !raise_event       TYPE abap_bool DEFAULT abap_true
        !io_container      TYPE REF TO cl_gui_container OPTIONAL
        !iv_is_modal_popup TYPE abap_bool DEFAULT abap_false
        !iv_modal_title    TYPE any DEFAULT ' '
        !iv_repid          TYPE any DEFAULT sy-repid
        !iv_dynnr          TYPE any DEFAULT sy-dynnr
        !is_salv           TYPE abap_bool DEFAULT abap_true                                      "erzeugt cl_salv_table
        !is_grid           TYPE abap_bool DEFAULT abap_false .                                     "erzeugt cl_gui_alv_grid,
    METHODS display .
*      free,
    "A = Spalten u Zeilenselktion // '','B' = Einfachselektion,Listbox // C = Mehrfachselektiin
    "D = Zellenselektion
    METHODS set
      IMPORTING
        !iv_title                    TYPE clike OPTIONAL
        !iv_vertical_lines           TYPE abap_bool DEFAULT abap_true
        !iv_headers_visible          TYPE abap_bool DEFAULT abap_true
        !iv_default_toolbar          TYPE abap_bool DEFAULT abap_false
        !iv_raise_double_click       TYPE abap_bool DEFAULT abap_true
        !it_raise_hotspot            TYPE stringtab OPTIONAL
        !iv_raise_after_data_changed TYPE abap_bool DEFAULT abap_true
        !it_raise_f4                 TYPE stringtab OPTIONAL
        !it_raise_toolbar            TYPE ttb_button OPTIONAL
        !it_toolbar_hide             TYPE stringtab OPTIONAL
        !it_col_setting              TYPE ty_t_setup OPTIONAL
        !it_hide                     TYPE stringtab OPTIONAL
        !it_outlen                   TYPE name2stringvalue_table OPTIONAL
        !it_sort                     TYPE stringtab OPTIONAL
        !it_edit                     TYPE stringtab OPTIONAL
        !iv_optimize_colwidth        TYPE abap_bool DEFAULT abap_false
        !raise_error                 TYPE abap_bool DEFAULT abap_false
        !iv_selmode                  TYPE any OPTIONAL
        !iv_layout_restriction       TYPE any OPTIONAL
        !iv_layout_report            TYPE any OPTIONAL
        !iv_layout_handle            TYPE any OPTIONAL
        !is_layout                   TYPE disvariant OPTIONAL
        !iv_name_row_color           TYPE any OPTIONAL
        !iv_name_row_style           TYPE any OPTIONAL .
    CLASS-METHODS alv_get_fcat
      IMPORTING
        !it_table       TYPE STANDARD TABLE
      RETURNING
        VALUE(r_result) TYPE lvc_t_fcat .
    CLASS-METHODS class_constructor .
*      popup_salv_easy
*        IMPORTING
*          VALUE(it_table)       TYPE STANDARD TABLE
*          iv_title              TYPE clike     DEFAULT sy-title
*          iv_vertical_lines     TYPE abap_bool DEFAULT abap_true
*          iv_headers_visible    TYPE abap_bool DEFAULT abap_true
*          iv_raise_double_click TYPE abap_bool DEFAULT abap_true
*          iv_raise_hotspot      TYPE abap_bool DEFAULT abap_true
*          it_col_setting        TYPE ty_t_setup OPTIONAL
*          it_sort               TYPE stringtab  OPTIONAL
*          it_hide               TYPE stringtab OPTIONAL
*          iv_optimize_colwidth  TYPE abap_bool DEFAULT abap_false
*          iv_col_start          TYPE any DEFAULT '10'
*          iv_col_end            TYPE any DEFAULT '160'
*          iv_line_start         TYPE any DEFAULT '10'
*          iv_line_end           TYPE any DEFAULT '30'
*        EXPORTING
*          es_event              TYPE ty_s_event,
    CLASS-METHODS popup_customizing .
*        !ct_table          TYPE any OPTIONAL
*        !raise_event       TYPE abap_bool DEFAULT abap_true
*        !iv_modal_title    TYPE any DEFAULT ' '
*        !is_salv           TYPE abap_bool DEFAULT abap_true              "erzeugt cl_salv_table
*        !is_grid           TYPE abap_bool DEFAULT abap_false
    CLASS-METHODS popup_json_table
      IMPORTING
        !iv_tablename TYPE clike OPTIONAL .
    CLASS-METHODS popup_json_data
      IMPORTING
        !i_any TYPE any
      EXPORTING
        !e_any TYPE any .
    CLASS-METHODS factory_log
      IMPORTING
        !io_container      TYPE REF TO cl_gui_container OPTIONAL
        !iv_is_modal_popup TYPE abap_bool DEFAULT abap_false
        !iv_repid          TYPE any DEFAULT sy-repid
        !iv_dynnr          TYPE any DEFAULT sy-dynnr
      RETURNING
        VALUE(r_result)    TYPE ty_o_easy_alv .     "zcl_kal_easy_alv_v06. "_alv.
    METHODS free .
    METHODS focus
      IMPORTING
        !set TYPE abap_bool
        !get TYPE abap_bool .
    METHODS log_add_new
      IMPORTING
        !i_any          TYPE any
        !iv_v1          TYPE any OPTIONAL
        !iv_v2          TYPE any OPTIONAL
        !iv_v3          TYPE any OPTIONAL
        !iv_v4          TYPE any OPTIONAL
        !iv_icon        TYPE any OPTIONAL
        !iv_type        TYPE any OPTIONAL
        !iv_is_color    TYPE abap_bool OPTIONAL
      RETURNING
        VALUE(r_result) TYPE ty_o_easy_alv .    "_alv.
    METHODS log_add
      IMPORTING
        !i_any          TYPE any OPTIONAL
        !iv_v1          TYPE any OPTIONAL
        !iv_v2          TYPE any OPTIONAL
        !iv_v3          TYPE any OPTIONAL
        !iv_v4          TYPE any OPTIONAL
        !iv_icon        TYPE any OPTIONAL
        !iv_type        TYPE any OPTIONAL
          PREFERRED PARAMETER i_any
      RETURNING
        VALUE(r_result) TYPE ty_o_easy_alv .
    METHODS refresh .  "_alv.
    CLASS-METHODS get_alv_info
      IMPORTING
        !it_ref_table TYPE REF TO data OPTIONAL
        !io_alv       TYPE REF TO cl_gui_alv_grid OPTIONAL
      EXPORTING
        !et_filter    TYPE lvc_t_filt
        !et_sort      TYPE lvc_t_sort
        !et_fieldcat  TYPE lvc_t_fcat
        !es_variant   TYPE disvariant
        !es_layout    TYPE lvc_s_layo .
    CLASS-METHODS update_fieldcat
      IMPORTING
        !io_alv       TYPE REF TO cl_gui_alv_grid
        !it_ref_table TYPE REF TO data
        !it_fieldcat  TYPE lvc_t_fcat .
  PROTECTED SECTION.



    METHODS:
      on_salv_double_click
            FOR EVENT double_click OF cl_salv_events_table
        IMPORTING
            row
            column
            sender,

      on_salv_hotspot_click
            FOR EVENT link_click OF cl_salv_events_table
        IMPORTING
            row
            column
            sender,

      on_salv_toolbar_click FOR EVENT added_function OF cl_salv_events_table
        IMPORTING
            e_salv_function
            sender,

      on_grid_data_changed        " DATA_CHANGED_FINISHED
            FOR EVENT data_changed OF cl_gui_alv_grid
        IMPORTING
      ER_DATA_CHANGED
      E_ONF4
      E_ONF4_BEFORE
      E_ONF4_AFTER
      E_UCOMM
      sender,


      on_grid_data_changed_finished        " DATA_CHANGED_FINISHED
            FOR EVENT data_changed_finished OF cl_gui_alv_grid
        IMPORTING
            e_modified
            et_good_cells
            sender,

      on_grid_menu_button "ONF4
            FOR EVENT menu_button OF cl_gui_alv_grid
        IMPORTING
            e_object
            e_ucomm,

      on_grid_f4_help "ONF4
            FOR EVENT onf4 OF cl_gui_alv_grid
        IMPORTING
            e_fieldname
            e_fieldvalue
            es_row_no
            er_event_data
            et_bad_cells
            e_display
            sender,

      on_grid_toolbar
      FOR EVENT toolbar OF
                    cl_gui_alv_grid
        IMPORTING e_object
                    e_interactive,
      on_grid_user_command
      FOR EVENT user_command OF
                    cl_gui_alv_grid
        IMPORTING e_ucomm,

      on_grid_hotspot_click
      FOR EVENT hotspot_click OF
            cl_gui_alv_grid
        IMPORTING
            e_row_id
            e_column_id
            es_row_no,


      on_dialogbox_close FOR EVENT close OF cl_gui_dialogbox_container
        IMPORTING sender,

      handle_event,

      salv_init,
      grid_init,
      salv_set,
      grid_set.



ENDCLASS.



CLASS lcl_help_gui IMPLEMENTATION.


  METHOD alv_get_fcat.

    DATA:
      lo_alv          TYPE REF TO cl_salv_table,
      lo_columns      TYPE REF TO cl_salv_columns_list,
      lo_aggregations TYPE REF TO cl_salv_aggregations,
      lx_previous     TYPE REF TO cx_root.

    DATA lt_tab TYPE REF TO data.

    CREATE DATA lt_tab
        LIKE it_table.

* -----------------------------------------------------------------------------
* Fieldkatalog erzeugen

    TRY.
        FIELD-SYMBOLS: <lt_table> TYPE STANDARD TABLE.
*        ASSIGN ms_control-r_table->* TO <lt_table>.
        ASSIGN lt_tab->* TO <lt_table>.


        cl_salv_table=>factory(
          IMPORTING
            r_salv_table   =  lo_alv   " Basisklasse einfache ALV Tabellen
          CHANGING
            t_table        = <lt_table> ).


        lo_columns = lo_alv->get_columns( ).
        lo_aggregations = lo_alv->get_aggregations( ).

        r_result = cl_salv_controller_metadata=>get_lvc_fieldcatalog( r_columns      = lo_columns
                                                                     r_aggregations = lo_aggregations ).

      CATCH cx_salv_msg INTO lx_previous.
*        lx_root = factory_cx_t100( i_any  = 'Fehler beim Erstellen des Feldkatalogs'(002)  io_previous = lx_previous ).
*        RAISE EXCEPTION lx_root.
    ENDTRY.


  ENDMETHOD.


  METHOD class_constructor.
    CREATE OBJECT so_help.
  ENDMETHOD.


  METHOD constructor.


    DATA(lv_kind) = so_help->get( rtti_kind = 'X' i_any = ct_table ).
    CASE lv_kind.
      WHEN cl_abap_datadescr=>kind_ref.
        IF ct_table IS BOUND.
          ms_control-r_table = ct_table.
        ENDIF.
      WHEN cl_abap_datadescr=>kind_table.
        so_help->raise( 'ZCX_WRONG_INPUT_TYPE_ERROR').
*        GET REFERENCE OF ct_table INTO  ms_cont<rol-r_table.
    ENDCASE.

    ms_control-is_modal_popup = iv_is_modal_popup.
    IF io_container IS BOUND AND ms_control-is_modal_popup = abap_true.
      so_help->msg( EXPORTING i_any   = 'ZCX_CONTAINER_IN_DIALOGBOX_NOT_POSSIBLE_ERROR'
                    IMPORTING et_bapi = mt_log ).
    ENDIF.

    ms_control-is_raise_event = raise_event.
    ms_control-o_parent_cont  = io_container.

    IF is_grid = abap_true.
      ms_control-is_type_grid = abap_true.
    ELSE.
      ms_control-is_type_salv = abap_true.
    ENDIF.


    IF ct_table IS NOT SUPPLIED.
      "dann wird dieser helper nur fÃ¼r statische aufrufe benutzt
      RETURN.
    ENDIF.

    ms_option-title = iv_modal_title.

    IF is_grid = abap_true.
      grid_init(  ).
    ELSE.
      salv_init(  ).
    ENDIF.



  ENDMETHOD.


  METHOD display.

    FREE ms_event.

    DATA lv_savemode TYPE c LENGTH 1.
*    DATA   lt_excl_tb TYPE ui_functions.
    CASE ms_option-layout_restriction.
      WHEN  if_salv_c_layout=>restrict_none.
        lv_savemode = 'A'.
      WHEN if_salv_c_layout=>restrict_user_dependant.
        lv_savemode = 'U'.
      WHEN if_salv_c_layout=>restrict_user_independant.
        lv_savemode = 'X'.
    ENDCASE.

    IF ms_control-is_type_salv = abap_true.
      ms_salv-o_salv->display(  ).

      ms_event-t_selections = ms_salv-o_selections->get_selected_rows( ).

    ELSE.

      so_help->trans(
        EXPORTING
          tab_2_tab          = 'X'
          i_any              =  ms_option-t_toolbar_hide
        IMPORTING
          e_result       = ms_grid-t_toolbar_excl
      ).


      """"""""""""""""""""""""""""""""""""""""""""""""
      " nicht benötigte Toolbarelemente ausblenden

      APPEND cl_gui_alv_grid=>mc_fc_loc_delete_row    TO  ms_grid-t_toolbar_excl.
      APPEND cl_gui_alv_grid=>mc_fc_loc_insert_row    TO  ms_grid-t_toolbar_excl.
      APPEND cl_gui_alv_grid=>mc_fc_loc_copy_row      TO  ms_grid-t_toolbar_excl.
      APPEND cl_gui_alv_grid=>mc_fc_loc_paste         TO  ms_grid-t_toolbar_excl.
      APPEND cl_gui_alv_grid=>mc_fc_loc_paste_new_row TO  ms_grid-t_toolbar_excl.
      APPEND cl_gui_alv_grid=>mc_fc_loc_append_row    TO  ms_grid-t_toolbar_excl.
      APPEND cl_gui_alv_grid=>mc_fc_loc_cut           TO  ms_grid-t_toolbar_excl.
      APPEND cl_gui_alv_grid=>mc_fc_loc_copy          TO  ms_grid-t_toolbar_excl.
      APPEND cl_gui_alv_grid=>mc_fc_loc_undo          TO  ms_grid-t_toolbar_excl.
      APPEND cl_gui_alv_grid=>mc_fc_refresh           TO  ms_grid-t_toolbar_excl.
      APPEND cl_gui_alv_grid=>mc_fc_graph             TO  ms_grid-t_toolbar_excl.
      APPEND cl_gui_alv_grid=>mc_fc_help              TO  ms_grid-t_toolbar_excl.
      APPEND cl_gui_alv_grid=>mc_fc_info              TO  ms_grid-t_toolbar_excl.


      FIELD-SYMBOLS: <lt_table> TYPE STANDARD TABLE.
      ASSIGN ms_control-r_table->* TO <lt_table>.

      ms_grid-o_grid->set_table_for_first_display(
      EXPORTING
*        i_buffer_active               =                  " Buffering Active
*        i_bypassing_buffer            =                  " Switch Off Buffer
*        i_consistency_check           =                  " Starting Consistency Check for Interface Error Recognition
*        i_structure_name              =                  " Internal Output Table Structure Name
        is_variant                    = ms_option-s_layout " Layout
        i_save                        = lv_savemode " Save Layout
        i_default                     = 'X'              " Default Display Variant
        is_layout                     =  ms_grid-s_layout                " Layout
*        is_print                      =                  " Print Control
*        it_special_groups             =                  " Field Groups
        it_toolbar_excluding          = ms_grid-t_toolbar_excl
*        it_toolbar_excluding          =                  " Excluded Toolbar Standard Functions
*        it_hyperlink                  =                  " Hyperlinks
*        it_alv_graphics               =                  " Table of Structure DTC_S_TC
*        it_except_qinfo               =                  " Table for Exception Quickinfo
*        ir_salv_adapter               =                  " Interface ALV Adapter
        CHANGING
          it_outtab                     = <lt_table>                " Output Table
          it_fieldcatalog               = ms_grid-t_fieldcat                 " Field Catalog
*        it_sort                       =                  " Sort Criteria
*        it_filter                     =                  " Filter Criteria
        EXCEPTIONS
          invalid_parameter_combination = 1                " Wrong Parameter
          program_error                 = 2                " Program Errors
          too_many_lines                = 3                " Too many Rows in Ready for Input Grid
          OTHERS                        = 4  ).
      IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
      so_help->raise_check( method = 'X' ).


      IF ms_control-is_modal_popup = abap_true.
        ms_control-o_parent_cont->set_focus(
          EXPORTING
            control           =  ms_grid-o_grid                " Control
          EXCEPTIONS
            cntl_error        = 1                " cntl_error
            cntl_system_error = 2                " cntl_system_error
            OTHERS            = 3
        ).
        IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
        so_help->raise_check( method = 'X' ).



      ENDIF.


*      IF ms_option-t_toolbar IS NOT INITIAL.
*        CALL METHOD ms_grid-o_grid->set_toolbar_interactive.
*      ENDIF.



    ENDIF.


    CASE sy-ucomm.

      WHEN '&ONT'.
        ms_event-type = so_help->cs-s_alv_event_type-popup_close.


      WHEN '&AC1'. " or 'TRPI'.
        ms_event-type = so_help->cs-s_alv_event_type-popup_cancel.

      WHEN OTHERS.
    ENDCASE.

  ENDMETHOD.


  METHOD factory_log.

    TRY.

        DATA lt_dummy TYPE STANDARD TABLE OF spfli.

        CREATE OBJECT r_result
          EXPORTING
*           r_result          = NEW zcl_034tmm_future_easy_alv(
            ct_table          = REF #( lt_dummy )
            io_container      = io_container
            iv_is_modal_popup = iv_is_modal_popup
*           iv_modal_title    = ' '
            iv_repid          = iv_repid
            iv_dynnr          = iv_dynnr.

        r_result->ms_control-r_table = REF #( r_result->ms_log-t_log ).

        r_result->ms_salv-o_salv->set_data(
          CHANGING
            t_table                     =  r_result->ms_log-t_log ).
        " Table to Be Displayed
*    ).
*      CATCH cx_salv_no_new_data_allowed.    "
      CATCH cx_root INTO DATA(lx_root).
        so_help->raise( lx_root ).
    ENDTRY.



    DATA lt_col TYPE ty_t_setup.

*    data lt_col type ms_gui-o_alv_data->ty_t_setup.
*    FREE lt_col.
    APPEND INITIAL LINE TO lt_col ASSIGNING FIELD-SYMBOL(<ls_col>).
    <ls_col>-name = 'ICON_STATUS'.
    <ls_col>-is_icon = abap_true.
    <ls_col>-out_length = '2'.

*    free <ls_col>.
    APPEND INITIAL LINE TO lt_col ASSIGNING <ls_col>.
    <ls_col>-name = 'NUMBER'.
*    <ls_col>-is_icon = abap_true.
    <ls_col>-out_length = '3'.

    FREE <ls_col>.
    APPEND INITIAL LINE TO lt_col ASSIGNING <ls_col>.
    <ls_col>-name = 'ID'.
*    <ls_col>-is_icon = abap_true.
    <ls_col>-out_length = '5'.

    APPEND INITIAL LINE TO lt_col ASSIGNING <ls_col>.
    <ls_col>-name = 'MESSAGE_V1'.
    <ls_col>-is_tech = abap_true.
*    <ls_col>-out_length = '2'.

    APPEND INITIAL LINE TO lt_col ASSIGNING <ls_col>.
    <ls_col>-name = 'MESSAGE_V2'.
    <ls_col>-is_tech = abap_true.

    APPEND INITIAL LINE TO lt_col ASSIGNING <ls_col>.
    <ls_col>-name = 'MESSAGE_V3'.
    <ls_col>-is_tech = abap_true.

    APPEND INITIAL LINE TO lt_col ASSIGNING <ls_col>.
    <ls_col>-name = 'MESSAGE_V4'.
    <ls_col>-is_tech = abap_true.

    APPEND INITIAL LINE TO lt_col ASSIGNING <ls_col>.
    <ls_col>-name = 'TYPE'.
    <ls_col>-is_tech = abap_true.


    DATA ls_layout TYPE disvariant.
    ls_layout-report = sy-repid.
    ls_layout-handle = 'LOG'.

    r_result->set(
*      exporting
*        iv_title                    =
*        iv_vertical_lines           = ABAP_TRUE
*        iv_headers_visible          = abap_false
       iv_default_toolbar          = abap_true
*        iv_raise_double_click       = ABAP_TRUE
*        it_raise_hotspot            =
*        iv_raise_after_data_changed = ABAP_TRUE
*        it_raise_f4                 =
*        it_raise_toolbar            =
       it_col_setting              = lt_col
*        it_hide                     =
*        it_outlen                   =
*        it_sort                     =
*        it_edit                     =
*        iv_optimize_colwidth        = ABAP_FALSE
*        raise_error                 = ABAP_FALSE
       is_layout = ls_layout
       iv_layout_restriction = if_salv_c_layout=>restrict_none
       iv_name_row_color = 'T_COLOR'
   ).


    r_result->display(  ).


  ENDMETHOD.


  METHOD focus.
*
* sender->ms_grid-o_grid->get_current_cell( IMPORTING
*                           es_row_id = lv_row_id2
*                           es_col_id = lv_col_id2
*                           es_row_no = lv_row_no2 ).
*
*
*      sender->ms_grid-o_grid->refresh_table_display(  ).
*
*
*
* DATA: wa_cells TYPE lvc_s_cell.
** Passende Zeile suchen
**    READ TABLE data WITH KEY key = key INTO line.
*    wa_cells-row_id-index = 2.
*    wa_cells-col_id-fieldname = 'ACTTYPE' . "fieldname'.
*    CALL METHOD sender->ms_grid-o_grid->set_current_cell_via_id
*          EXPORTING is_row_id = wa_cells-row_id
*                    is_column_id = wa_cells-col_id.
*    CALL METHOD sender->ms_grid-o_grid->set_focus( sender->ms_grid-o_grid ).

  ENDMETHOD.


  METHOD free.

    IF ms_control-is_modal_popup = abap_true AND ms_control-o_parent_cont IS BOUND.
      ms_control-o_parent_cont->free(  ).
      FREE    ms_control-o_parent_cont.
    ENDIF.

    IF ms_grid-o_grid IS BOUND.
      ms_grid-o_grid->free(  ).
      FREE ms_grid-o_grid.
    ENDIF.

  ENDMETHOD.


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

  ENDMETHOD.


  METHOD get_selected_tab.

    FIELD-SYMBOLS <lt_tab> TYPE STANDARD TABLE.
    FIELD-SYMBOLS <ls_tab> TYPE any.

    FREE et_any.

    ASSIGN ms_control-r_table->* TO <lt_tab>.

    IF ms_salv-o_salv IS BOUND.

      LOOP AT ms_event-t_selections INTO DATA(lv_sel).

        READ TABLE <lt_tab> ASSIGNING <ls_tab>
          INDEX lv_sel.

        APPEND <ls_tab> TO et_any.

      ENDLOOP.


    ELSE.

      ms_grid-o_grid->get_selected_rows(
        IMPORTING
          et_index_rows =  DATA(lt_rows)   " Indexes of Selected Rows
*        et_row_no     =     " Numeric IDs of Selected Rows
      ).

      LOOP AT lt_rows INTO DATA(lv_row).

        READ TABLE <lt_tab> ASSIGNING <ls_tab>
         INDEX lv_row-index.

        APPEND <ls_tab> TO et_any.

      ENDLOOP.

    ENDIF.

  ENDMETHOD.


  METHOD grid_init.


    FIELD-SYMBOLS:
        <lt_table> TYPE STANDARD TABLE.

    DATA lo_dialogbox TYPE REF TO cl_gui_dialogbox_container.


    IF ms_control-is_modal_popup = abap_true.

      DATA lv_caption TYPE c LENGTH 30.
      lv_caption = ms_option-title.

      CREATE OBJECT lo_dialogbox
        EXPORTING
          caption = lv_caption
          width   = 900
          height  = 200
          top     = 150
          left    = 150
          repid   = ms_control-repid
          dynnr   = ms_control-dynnr.


      CALL METHOD cl_gui_cfw=>flush
        EXCEPTIONS
          cntl_system_error = 1
          cntl_error        = 2.
      IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma

      SET HANDLER on_dialogbox_close FOR lo_dialogbox.
      ms_control-o_parent_cont = lo_dialogbox.

    ENDIF.

    TRY.

        ASSIGN ms_control-r_table->* TO <lt_table>.

        IF ms_control-o_parent_cont IS BOUND.
          CREATE OBJECT ms_grid-o_grid
            EXPORTING
              i_parent = ms_control-o_parent_cont.


        ELSE.

          so_help->msg( EXPORTING i_any   = 'ZCX_ALV_GRID_WITHOUT_CONTAINER_NOT_POSSIBLE_ERROR'
                         IMPORTING et_bapi = mt_log ).

        ENDIF.


*       FIELD-SYMBOLS: <lt_table> TYPE STANDARD TABLE.
        ASSIGN ms_control-r_table->* TO <lt_table>.
        ms_grid-t_fieldcat = alv_get_fcat(   <lt_table> ).
*        ms_grid-t_fieldcat = alv_get_fcat(  ).

    ENDTRY.

  ENDMETHOD.


  METHOD grid_set.
    DATA: lv_nam  TYPE string.

    FIELD-SYMBOLS:
      <ls_fieldcat> LIKE LINE OF ms_grid-t_fieldcat.
    DATA lv_set_hospot_event TYPE abap_bool.

    LOOP AT ms_grid-t_fieldcat ASSIGNING <ls_fieldcat>.

      READ TABLE ms_option-t_edit TRANSPORTING NO FIELDS
          WITH KEY table_line = <ls_fieldcat>-fieldname.
      IF sy-subrc = 0.
        <ls_fieldcat>-edit = 'X'.
      ENDIF.


      READ TABLE ms_option-t_raise_hotspot TRANSPORTING NO FIELDS
        WITH KEY table_line = <ls_fieldcat>-fieldname.
      IF sy-subrc = 0.
        <ls_fieldcat>-hotspot = abap_true.
      ENDIF.

      READ TABLE ms_option-t_col_setting INTO DATA(ls_col)
        WITH KEY name = <ls_fieldcat>-fieldname.
      IF sy-subrc = 0.
*
*            if <ls_col>-is_button = abaP_true.
*            <ls_fieldcat>-
*            endif.
        IF ls_col-out_length IS NOT INITIAL.
          <ls_fieldcat>-outputlen = ls_col-out_length.
        ENDIF.

        IF ls_col-is_icon = abap_true." is NOT INITIAL.
          <ls_fieldcat>-icon = abap_true.

          IF ls_col-is_hotspot = abap_true.
            <ls_fieldcat>-hotspot = abap_true.
            lv_set_hospot_event = abap_true.
          ENDIF.
        ENDIF.


      ENDIF.

      "TODO

    ENDLOOP.



    IF ms_option-raise_after_data_changed = abap_true.

      SET HANDLER on_grid_data_changed_finished FOR ms_grid-o_grid.
      set handler on_grid_data_changed for ms_grid-o_grid.

      CALL METHOD ms_grid-o_grid->register_edit_event
        EXPORTING
          i_event_id = cl_gui_alv_grid=>mc_evt_modified. "enter. "modified.

      ms_grid-o_grid->set_ready_for_input( 1 ).

    ENDIF.

    SET HANDLER on_grid_menu_button FOR ms_grid-o_grid.
*    loop at ms_option-t_col_setting into data(ls_col).
*
**    ls_col-i
*
*    endloop.


    IF ms_option-t_raise_f4 IS NOT INITIAL.

      DATA:
        lt_f4 TYPE lvc_t_f4,
        ls_f4 TYPE lvc_s_f4.

      LOOP AT ms_option-t_raise_f4 INTO lv_nam.


        ls_f4-fieldname  = lv_nam.
        ls_f4-register   = 'X'.
* ls_f4-getbefore  = 'X'.
* ls_f4-chngeafter = 'X'.
        INSERT ls_f4 INTO TABLE lt_f4.

      ENDLOOP.

      CALL METHOD ms_grid-o_grid->register_f4_for_fields
        EXPORTING
          it_f4 = lt_f4.

      SET HANDLER on_grid_f4_help FOR ms_grid-o_grid.

    ENDIF.


    IF ms_option-default_toolbar = abap_false AND ms_option-t_toolbar IS INITIAL.
      ms_grid-s_layout-no_toolbar = abap_true.
    ENDIF.

*    if ms_control-is_modal_popup = abap_false.
    ms_grid-s_layout-grid_title = ms_option-title.
    ms_grid-s_layout-smalltitle = abap_true.
    ms_grid-s_layout-sel_mode = ms_option-selmode.
    ms_grid-s_layout-stylefname = ms_option-name_row_style.
*    ms_grid-s_layout-stylefname = ms_option-name_row_style.
    ms_grid-s_layout-cwidth_opt = ms_option-optimize_colwidth.
    IF ms_option-headers_visible = abap_false.
      ms_grid-s_layout-no_headers = abap_true.
    ENDIF.
*    ms_grid-s_layout-d
*    else.
*
*      endif.


    IF ms_option-t_toolbar IS NOT INITIAL.

      SET HANDLER
      on_grid_user_command
                on_grid_toolbar FOR ms_grid-o_grid.

    ENDIF.

    IF ms_option-t_raise_hotspot IS NOT INITIAL OR lv_set_hospot_event = abap_true.

      SET HANDLER on_grid_hotspot_click FOR ms_grid-o_grid.

    ENDIF.

  ENDMETHOD.


  METHOD gui_popup_get_value.

    DATA:
      lt_value  TYPE STANDARD TABLE OF sval,
      ls_value  TYPE sval,
      lv_return TYPE string,
      lv_title  TYPE sy-title.

    IF iv_title IS SUPPLIED.
      lv_title = iv_title.
    ELSE.
      lv_title = so_help->get( text = 'X' i_any = '271(DB)' ).
*      MESSAGE s271(db) INTO lv_title.
    ENDIF.

****************************************
* Feld1 befüllen


    FREE ls_value.
    IF iv_tab_field_1 IS NOT INITIAL.
      iv_tab_field_1 =  so_help->get(
                             trim_upper_case = 'X'
                             i_any = iv_tab_field_1
                              ).

      SPLIT  iv_tab_field_1 AT '-' INTO ls_value-tabname ls_value-fieldname.

    ELSE.
      DATA lv_string TYPE string.
      so_help->rtti(
        EXPORTING
          i_any   = ev_value1
        IMPORTING
          ev_type =  lv_string
      ).

      SPLIT lv_string AT '-' INTO ls_value-tabname ls_value-fieldname.

    ENDIF.



    ls_value-value = ev_value1.

    IF iv_is_input1 = abap_true.
      ls_value-field_attr = '01'.
    ELSE.
      ls_value-field_attr = '02'.
    ENDIF.

    APPEND ls_value TO lt_value.

****************************************
* Feld2 befüllen

    IF iv_tab_field_2 IS SUPPLIED. " AND iv_tab2 IS SUPPLIED.

      FREE ls_value.
      iv_tab_field_2 =  so_help->get(
                             trim_upper_case = 'X'
                             i_any = iv_tab_field_2
                              ).

      SPLIT  iv_tab_field_2 AT '-' INTO ls_value-tabname ls_value-fieldname.
      ls_value-value = ev_value2.

      IF iv_is_input2 = abap_true.
        ls_value-field_attr = '01'.
      ELSE.
        ls_value-field_attr = '02'.
      ENDIF.

      APPEND ls_value TO lt_value.

    ENDIF.


****************************************
* Feld3 befüllen

    IF iv_tab_field_3 IS SUPPLIED. " AND iv_tab3 IS SUPPLIED.

      FREE ls_value.
      iv_tab_field_3 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_3
                        ).
      SPLIT  iv_tab_field_3 AT '-' INTO ls_value-tabname ls_value-fieldname.
      ls_value-value = ev_value3.

      IF iv_is_input3 = abap_true.
        ls_value-field_attr = '01'.
      ELSE.
        ls_value-field_attr = '02'.
      ENDIF.

      APPEND ls_value TO lt_value.

    ENDIF.


****************************************
* Feld4 befüllen

    IF iv_tab_field_4 IS SUPPLIED. "AND iv_tab4 IS SUPPLIED.

      FREE ls_value.
      iv_tab_field_4 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_4
                        ).
      SPLIT  iv_tab_field_4 AT '-' INTO ls_value-tabname ls_value-fieldname.
      ls_value-value = ev_value4.

      IF iv_is_input4 = abap_true.
        ls_value-field_attr = '01'.
      ELSE.
        ls_value-field_attr = '02'.
      ENDIF.

      APPEND ls_value TO lt_value.

    ENDIF.


*****************************************
* Feld4 befüllen

    IF iv_tab_field_5 IS SUPPLIED. " AND iv_tab5 IS SUPPLIED.

      FREE ls_value.
      iv_tab_field_5 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_5
                        ).

      SPLIT  iv_tab_field_5 AT '-' INTO ls_value-tabname ls_value-fieldname.
      ls_value-value = ev_value5.

      IF iv_is_input5 = abap_true.
        ls_value-field_attr = '01'.
      ELSE.
        ls_value-field_attr = '02'.
      ENDIF.

      APPEND ls_value TO lt_value.

    ENDIF.


*****************************************
* Feld6 befüllen

    IF iv_tab_field_6 IS SUPPLIED. " AND iv_tab5 IS SUPPLIED.

      FREE ls_value.
      iv_tab_field_6 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_6
                        ).

      SPLIT  iv_tab_field_6 AT '-' INTO ls_value-tabname ls_value-fieldname.
      ls_value-value = so_help->get(
                     conv_out = 'X'
                     i_any  = ev_value6
                     ).

      IF iv_is_input6 = abap_true.
        ls_value-field_attr = '01'.
      ELSE.
        ls_value-field_attr = '02'.
      ENDIF.

      APPEND ls_value TO lt_value.

    ENDIF.

*****************************************
* Feld7 befüllen

    IF iv_tab_field_7 IS SUPPLIED. " AND iv_tab5 IS SUPPLIED.

      FREE ls_value.
      iv_tab_field_7 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_7
                        ).

      SPLIT  iv_tab_field_7 AT '-' INTO ls_value-tabname ls_value-fieldname.
      ls_value-value = so_help->get(
                     conv_out = 'X'
                     i_any  = ev_value7
                     ).

      IF iv_is_input7 = abap_true.
        ls_value-field_attr = '01'.
      ELSE.
        ls_value-field_attr = '02'.
      ENDIF.

      APPEND ls_value TO lt_value.

    ENDIF.

*    *****************************************
* Feld8 befüllen

    IF iv_tab_field_8 IS SUPPLIED. " AND iv_tab5 IS SUPPLIED.

      FREE ls_value.
      iv_tab_field_8 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_8
                        ).

      SPLIT  iv_tab_field_8 AT '-' INTO ls_value-tabname ls_value-fieldname.
      ls_value-value = so_help->get(
                     conv_out = 'X'
                     i_any  = ev_value8
                     ).

      IF iv_is_input8 = abap_true.
        ls_value-field_attr = '01'.
      ELSE.
        ls_value-field_attr = '02'.
      ENDIF.

      APPEND ls_value TO lt_value.

    ENDIF.

*    *****************************************
* Feld9 befüllen

    IF iv_tab_field_9 IS SUPPLIED. " AND iv_tab5 IS SUPPLIED.

      FREE ls_value.
      iv_tab_field_9 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_9
                        ).

      SPLIT  iv_tab_field_9 AT '-' INTO ls_value-tabname ls_value-fieldname.
      ls_value-value = so_help->get(
                     conv_out = 'X'
                     i_any  = ev_value9
                     ).

      IF iv_is_input9 = abap_true.
        ls_value-field_attr = '01'.
      ELSE.
        ls_value-field_attr = '02'.
      ENDIF.

      APPEND ls_value TO lt_value.

    ENDIF.

*    *    *****************************************
* Feld10 befüllen

    IF iv_tab_field_10 IS SUPPLIED. " AND iv_tab5 IS SUPPLIED.

      FREE ls_value.
      iv_tab_field_10 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_10
                        ).

      SPLIT  iv_tab_field_10 AT '-' INTO ls_value-tabname ls_value-fieldname.
      ls_value-value = so_help->get(
                     conv_out = 'X'
                     i_any  = ev_value10
                     ).

      IF iv_is_input10 = abap_true.
        ls_value-field_attr = '01'.
      ELSE.
        ls_value-field_attr = '02'.
      ENDIF.

      APPEND ls_value TO lt_value.

    ENDIF.
*****************************************
* Popup aufrufen
*break-point.

    DO.

      TRY.

          CALL FUNCTION 'POPUP_GET_VALUES'
            EXPORTING
*             no_value_check  = SPACE    " Schaltet Prüfungen des jeweiligen Datentyps aus
              popup_title     = lv_title   " Text der Titelzeile
*             start_column    = '5'    " Startspalte des Dialogfensters
*             start_row       = '5'    " Startzeile des Dialogfensters
            IMPORTING
              returncode      = lv_return    " Antwort des Anwenders
            TABLES
              fields          = lt_value    " Tabellenfelder, Werte und Attribute
            EXCEPTIONS
              error_in_fields = 1
              error_message   = 2
              OTHERS          = 3.
          IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
          so_help->raise_check( function = 'X' ).

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
*                ev_value1 = ls_value-value.
                ev_value1 = so_help->get(
                          conv_in = 'X'
                          i_any = ls_value-value
                          i_any2 = iv_tab_field_1
                           ).

              WHEN 2.
*                           ev_value2 = ls_value-value.
                ev_value2 = so_help->get(
                         conv_in = 'X'
                         i_any = ls_value-value
                         i_any2 = iv_tab_field_2
                          ).

              WHEN 3.
*                           ev_value3 = ls_value-value.
                ev_value3 = so_help->get(
                       conv_in = 'X'
                       i_any = ls_value-value
                       i_any2 = iv_tab_field_3
                        ).

              WHEN 4.
*                           ev_value4 = ls_value-value.
                ev_value4 = so_help->get(
                        conv_in = 'X'
                        i_any = ls_value-value
                        i_any2 = iv_tab_field_4
                         ).

              WHEN 5.
*                           ev_value5 = ls_value-value.
                ev_value5 = so_help->get(
                       conv_in = 'X'
                       i_any = ls_value-value
                       i_any2 = iv_tab_field_5
                        ).

              WHEN 6.
*                           ev_value6 = ls_value-value.
                ev_value6 = so_help->get(
                       conv_in = 'X'
                       i_any = ls_value-value
                       i_any2 = iv_tab_field_6
                        ).

              WHEN 7.
*                           ev_value6 = ls_value-value.
                ev_value7 = so_help->get(
                       conv_in = 'X'
                       i_any = ls_value-value
                       i_any2 = iv_tab_field_7
                        ).

              WHEN 8.
*                           ev_value6 = ls_value-value.
                ev_value8 = so_help->get(
                       conv_in = 'X'
                       i_any = ls_value-value
                       i_any2 = iv_tab_field_8
                        ).

              WHEN 9.
*                           ev_value6 = ls_value-value.
                ev_value9 = so_help->get(
                       conv_in = 'X'
                       i_any = ls_value-value
                       i_any2 = iv_tab_field_9
                        ).
              WHEN 10.
*                           ev_value6 = ls_value-value.
                ev_value10 = so_help->get(
                       conv_in = 'X'
                       i_any = ls_value-value
                       i_any2 = iv_tab_field_10
                        ).
            ENDCASE.
          ENDLOOP.

          EXIT.

        CATCH cx_no_check INTO DATA(lx_root).

          IF  so_help->get_msg(  lx_root )-id = '56'
          AND so_help->get_msg( lx_root )-number = '704'.
            RAISE EXCEPTION lx_root.
          ENDIF.

          so_help->gui( lx_root ).

      ENDTRY.

    ENDDO.
  ENDMETHOD.


  METHOD handle_event.

    FIELD-SYMBOLS: <lt_tab>    TYPE STANDARD TABLE,
                   <ls_line>   TYPE any,
                   <ls_line_z> TYPE any,
                   <lv_any>    TYPE any.
    ASSIGN ms_control-r_table->* TO <lt_tab>.

*      ms_event-t_selections = ms_salv-o_selections->get_selected_rows( ).

    IF ms_salv-o_salv IS BOUND.
      ms_event-t_selections = ms_salv-o_selections->get_selected_rows( ).
    ENDIF.

    IF ms_grid-o_grid IS BOUND.

      ms_grid-o_grid->get_selected_rows(
           IMPORTING
             et_index_rows =  DATA(lt_rows) "ms_event-t_selections "DATA(lt_rows)   " Indexes of Selected Rows
*        et_row_no     =     " Numeric IDs of Selected Rows
         ).

      FREE ms_event-t_selections.
      LOOP AT lt_rows INTO DATA(lv_row).
        APPEND lv_row TO   ms_event-t_selections.
*
*        READ TABLE <lt_tab> ASSIGNING <ls_tab>
*         INDEX lv_row-index.
*
*        APPEND <ls_tab> TO et_any.
*
      ENDLOOP.

    ENDIF.



    IF ms_event-row IS NOT INITIAL.
      READ TABLE <lt_tab> ASSIGNING <ls_line>
          INDEX ms_event-row.

      CREATE DATA ms_event-line
        LIKE <ls_line>.
      ASSIGN ms_event-line->* TO <ls_line_z>.
      <ls_line_z> = <ls_line>.

      IF ms_event-col IS NOT INITIAL.

        ASSIGN COMPONENT ms_event-col OF STRUCTURE <ls_line> TO <lv_any>.
        so_help->conv( EXPORTING i_any = <lv_any> IMPORTING r_result = ms_event-value ).

      ENDIF.

    ENDIF.



    IF ms_control-is_raise_event = abap_true.
      RAISE EVENT user_action.
    ELSE.
      LEAVE TO SCREEN 0.
    ENDIF.


  ENDMETHOD.


  METHOD log_add.


    DATA ls_msg TYPE bapiret2.

    r_result = me.

    READ TABLE ms_log-t_log ASSIGNING FIELD-SYMBOL(<ls_log>)
      INDEX 1.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    so_help->msg( EXPORTING i_any = i_any iv_v1 = iv_v1
            iv_v2 = iv_v2 iv_v3 = iv_v3 iv_v4 = iv_v4
             IMPORTING e_any = ls_msg ).

    CONCATENATE <ls_log>-message ls_msg-message INTO <ls_log>-message.

* ELSE.
    CASE iv_type.
      WHEN 'S'.
        <ls_log>-icon_status = '@5B@'.
      WHEN 'W'.
        <ls_log>-icon_status = '@5D@'.
      WHEN 'E'.
        <ls_log>-icon_status = '@5C@'.
    ENDCASE.
*    ENDIF.

*    INSERT ls_msg INTO ms_gui-t_alv_log_output INDEX 1.
    ms_salv-o_salv->refresh(  ).

  ENDMETHOD.


  METHOD log_add_new.

    DATA ls_bapi TYPE bapiret2.
    DATA ls_msg LIKE LINE OF ms_log-t_log.

    r_result = me.

    IF cl_abap_datadescr=>kind_table = so_help->get( rtti_kind = 'X' i_any = i_any ).

      so_help->msg(
            EXPORTING i_any = i_any
            IMPORTING et_bapi = DATA(lt_bapi) ).

      LOOP AT lt_bapi INTO ls_bapi.
        log_add_new( ls_bapi ).
      ENDLOOP.


    ELSE.


      so_help->msg( EXPORTING i_any = i_any iv_v1 = iv_v1
      iv_v2 = iv_v2 iv_v3 = iv_v3 iv_v4 = iv_v4 iv_type = iv_type
                IMPORTING e_any = ls_msg ).

*      ls_msg-message = so_help->get( text = 'X' i_any = ls_bapi ).
*      ls_msg-id      = ls_bapi-id.
*      ls_msg-number  = ls_bapi-number.
*      ls_msg-type    = ls_bapi-type.
*      ls-msg-m


      IF iv_icon IS NOT INITIAL.
        ls_msg-icon_status = iv_icon.
      ELSE.

        CASE  ls_msg-type.
          WHEN 'S'.
            ls_msg-icon_status = '@5B@'.
          WHEN 'W'.
            ls_msg-icon_status = '@5D@'.
          WHEN 'E'.
            ls_msg-icon_status = '@5C@'.
        ENDCASE.


        CASE iv_type.
          WHEN 'S'.
            ls_msg-icon_status = '@5B@'.
          WHEN 'W'.
            ls_msg-icon_status = '@5D@'.
          WHEN 'E'.
            ls_msg-icon_status = '@5C@'.
        ENDCASE.
      ENDIF.

      IF iv_is_color = abap_true.
        APPEND INITIAL LINE TO ls_msg-t_color ASSIGNING FIELD-SYMBOL(<ls_color>).

        <ls_color>-fname = ''.
        <ls_color>-nokeycol = ' '. "bleibt frei da KEy-Spalte nicht veraendert werden soll
        <ls_color>-color-col = '2'.
        <ls_color>-color-int = '1'.
        <ls_color>-color-inv = '0'.

      ENDIF.


      INSERT ls_msg INTO ms_log-t_log INDEX 1.
      IF ms_salv-o_salv IS BOUND.
        ms_salv-o_salv->refresh(
          EXPORTING
*            S_STABLE     =     " ALV Control: Refresh Stability
            refresh_mode = if_salv_c_refresh=>soft    " ALV: Data Element for Constants
        ).
      ENDIF.

    ENDIF.

*    so_help->msg(
*      EXPORTING
*        i_any         = i_any
**      iv_id         =
**      iv_no         =
**      iv_type       =
**      iv_v1         =
**      iv_v2         =
**      iv_v3         =
**      iv_v4         =
**      use_t100_only = ABAP_FALSE
**      iv_langu      = SY-LANGU
**      raise_error   = ABAP_FALSE
*      IMPORTING
**      ev_id         =
**      ev_no         =
**      ev_type       =
**      ev_v1         =
**      ev_v2         =
**      ev_v3         =
**      ev_v4         =
**      ev_noid       =
**      ev_tynoid     =
**      ev_text_w_pl  =
*        e_any         = ms_log-t_log
**      es_bapi       =
**      et_bapi       =
*    ).

  ENDMETHOD.


  METHOD on_dialogbox_close.
    sender->free(  ).
  ENDMETHOD.


  METHOD on_grid_data_changed.

  ENDMETHOD.


  METHOD on_grid_data_changed_finished.

    ms_event-type = so_help->cs-s_alv_event_type-after_data_changed.
    handle_event( ).

  ENDMETHOD.


  METHOD on_grid_f4_help.

*data lv_char type c length 100.

    ms_event-type = so_help->cs-s_alv_event_type-f4_help.
*    ms_event_row = lv_char.
    ms_event-row =  es_row_no-row_id.
    ms_event-col = e_fieldname.

    handle_event(  ).

  ENDMETHOD.


  METHOD on_grid_hotspot_click.

    ms_event-type = so_help->cs-s_alv_event_type-hotspot_click.
    ms_event-col = e_column_id-fieldname. "row_id-rowtype. "ucomm = e_ucomm.>
    ms_event-row = e_row_id-index.
    handle_event(  ).

  ENDMETHOD.


  METHOD on_grid_menu_button.


    ms_event-type = so_help->cs-s_alv_event_type-menu_button.
    ms_event-ucomm = e_ucomm.
    ms_event-o_object = e_object.
*    ms_event_row = lv_char.
*    ms_event-row =  es_row_no-row_id.
*    ms_event-col = e_fieldname.

    handle_event(  ).

  ENDMETHOD.


  METHOD on_grid_toolbar.

*    FREE e_object->mt_toolbar.
    APPEND LINES OF ms_option-t_toolbar TO e_object->mt_toolbar.

  ENDMETHOD.


  METHOD on_grid_user_command.

    ms_event-type = so_help->cs-s_alv_event_type-toolbar_click.
    ms_event-ucomm = e_ucomm.
    handle_event(  ).

  ENDMETHOD.


  METHOD on_salv_double_click.

    FREE ms_event.
    ms_event-type = so_help->cs-s_alv_event_type-double_click.
    ms_event-row = row.
    ms_event-col = column.
    ms_event-t_selections = ms_salv-o_selections->get_selected_rows( ).
    handle_event( ).

  ENDMETHOD.


  METHOD on_salv_hotspot_click.

    FREE ms_event.
    ms_event-type = so_help->cs-s_alv_event_type-hotspot_click.
    ms_event-row = row.
    ms_event-col = column.
*    ms_event-t_selections = ms_salv-o_selections->get_selected_rows( ).

    handle_event( ).

  ENDMETHOD.


  METHOD on_salv_toolbar_click.

    FREE ms_event.
    ms_event-type = so_help->cs-s_alv_event_type-toolbar_click.
    ms_event-ucomm = e_salv_function.
*    ms_event-row = row.
*    ms_event-col = column.
    ms_event-t_selections = ms_salv-o_selections->get_selected_rows( ).

    handle_event( ).

  ENDMETHOD.


  METHOD popup_customizing.









*
*    "popup table mit 2 spalten: werk und icon
*    "button mit hinzufÃ¼gen und button mit lÃ¶schen
*    "hinzufÃ¼gen -> werk popoup -> select option
*    "grÃ¼n ->speichern
*    "kreuz-> cancel achtung eimgaben werden nciht Ã¼bernommen
*    "iconspalte selmoption aufrufen
*
*    TYPES:
*      BEGIN OF ty_s_input,
*        werks   TYPE werks,
*        t_range TYPE rsds_selopt_t,
*      END OF ty_s_input,
*
*      BEGIN OF ty_s_output,
*        icon_range  TYPE string,
*        value       TYPE string,
*        icon_action TYPE string,
*        t_range     TYPE rsds_selopt_t,
*      END OF ty_s_output.
*
*    DATA: lt_input  TYPE STANDARD TABLE OF ty_s_input WITH DEFAULT KEY,
*          lt_output TYPE STANDARD TABLE OF ty_s_output,
**          ls_event  TYPE ty_s_event,
*          lv_value  TYPE string,
*          lt_col    TYPE ty_t_setup.
*
*    lt_input = VALUE #(
*         (  werks = '1000' t_range = VALUE #( ( sign = 'I' option = 'E' low = 'test' ) ) )
*         ).
*
*
*    DO.
*
*      FREE lt_output.
*      SORT lt_input BY werks.
*
*      LOOP AT lt_input INTO DATA(ls_input).
*
*        APPEND INITIAL LINE TO lt_output ASSIGNING FIELD-SYMBOL(<ls_output>).
*        <ls_output>-value   = ls_input-werks.
*        <ls_output>-t_range = ls_input-t_range.
*
*        IF ls_input-t_range IS INITIAL.
*          <ls_output>-icon_range  = '@1F@'.
*        ELSE.
*          <ls_output>-icon_range  = '@1E@'.
*        ENDIF.
*        <ls_output>-icon_action = '@18@'.
*      ENDLOOP.
*
*      APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
*      APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
*      <ls_output>-icon_action = '@17@'.
*
*
*      lt_col = VALUE #(
*            ( name = 'ICON_RANGE'  is_hotspot = 'X' is_icon = 'X' title = 'Selektion' out_length = 6 )
*            ( name = 'ICON_ACTION' is_hotspot = 'X' is_icon = 'X' title = 'Aktion'    out_length = 4  )
*            ( name = 'T_RANGE'     is_tech = 'X'                                       )
*            ( name = 'VALUE'       title = 'Werk'                                     out_length = 6  )
*            ) .
*
*     so_help->gui_popup(
*         EXPORTING
*           it_table              = lt_output
*         iv_title              = 'Customizing:'
**        iv_vertical_lines     = abap_true
**        iv_headers_visible    = abap_true
**        iv_raise_double_click = abap_true
**        iv_raise_hotspot      = abap_true
**it_icon = value #(  (  `ICON_RANGE`) )
*           it_col_setting        = lt_col
*           it_sort               = VALUE #( ( `WERKS` ) )
**        iv_optimize_colwidth  = abap_false
**        iv_col_start          = '10'
*         iv_col_end            = '40'
**        iv_line_start         = '10'
*         iv_line_end           = '20'
*         IMPORTING
*           es_event           = data(ls_event)
*       ).
*
*
*      CASE ls_event-type.
*
*        WHEN so_help->cs_alv_event_type-hotspot_click.
*
*          CASE ls_event-value.
*
*            WHEN '@1E@' OR '@1F@'. "Range Popup aufrufen
*
*              ASSIGN ls_event-line->* TO <ls_output>.
*              DATA lv_cancel TYPE string.
*              so_help->gui( EXPORTING popup_range = 'X' i_any = 'MARA' i_any2 = 'MATNR'
*                            IMPORTING e_any = <ls_output>-t_range ev_answer = lv_cancel  ).
**              lcl_alv_help=>popup_sel_option(
**                EXPORTING iv_tab   = 'MARA' iv_field = 'MATNR'
**                IMPORTING et_range = ev_cancel = DATA(lv_cancel) ).
*
*              IF lv_cancel = abap_false.
*                lt_input[ werks = <ls_output>-value ]-t_range = <ls_output>-t_range.
*              ENDIF.
*
*
*            WHEN '@18@'. "Zeile lÃ¶schen
*
*              ASSIGN ls_event-line->* TO <ls_output>.
*              so_help->gui( EXPORTING popup_confirm = 'X' i_any = 'Zeile mit Werk &1 wird gelÃ¶scht?'
*                                      iv_v1 = <ls_output>-value
*                            IMPORTING ev_answer  = DATA(lv_answer) ).
*
*              CASE lv_answer.
*                WHEN so_help->cs_popup_answer-yes.
*                  DELETE lt_input INDEX ls_event-row.
*                WHEN so_help->cs_popup_answer-no.
*              ENDCASE.
*
*            WHEN  '@17@'. "Neues Werk hinzufÃ¼gen
*
*              DO.
*                so_help->gui( EXPORTING popup_get_value = 'X' i_any = 'MARC-WERKS'
*                              IMPORTING e_any = lv_value ev_answer = DATA(lv_answer3) ).
*
*                CASE lv_answer3.
*                  WHEN so_help->cs_popup_answer-exit.
*                    EXIT.
*                  WHEN OTHERS.
*                    READ TABLE lt_input TRANSPORTING NO FIELDS
*                        WITH KEY werks = lv_value.
*                    IF sy-subrc = 0.
*                      so_help->gui( popup_info = 'X' i_any = 'Werk &1 bereits vorhanden'
*                                    iv_v1 = lv_value ).
*                    ELSE.
*                      APPEND INITIAL LINE TO lt_input ASSIGNING FIELD-SYMBOL(<ls_input>).
*                      <ls_input>-werks = lv_value.
*                      EXIT.
*                    ENDIF.
*                ENDCASE.
*              ENDDO.
*
*          ENDCASE.
*
*        WHEN cs_event_type-popup_cancel. "Popup gecancelt
*
*          so_help->gui( EXPORTING popup_confirm = 'X' i_any = 'Ã#nderungen verwerfen?'
*                        IMPORTING ev_answer  = DATA(lv_answer2) ).
*
*          CASE lv_answer2.
*            WHEN so_help->cs_popup_answer-yes. RETURN.
*            WHEN so_help->cs_popup_answer-no.
*          ENDCASE.
*
*
*        WHEN cs_event_type-popup_close. "Popup schlieÃ#en u speichern
*          "speichern
*          RETURN.
*
*      ENDCASE.
*
*    ENDDO.

  ENDMETHOD.


  METHOD popup_json_data.

    DATA lv_tabname TYPE string.
    DATA lo_handle TYPE REF TO cl_abap_datadescr.



    DATA lt_tab TYPE REF TO data.
    FIELD-SYMBOLS: <lt_tab> TYPE STANDARD TABLE.
    DATA lv_json2 TYPE string.


    DATA lv_json TYPE string.

    lv_json = so_help->get( json = 'X' i_any = i_any ).


    TYPES text   TYPE c LENGTH 255.

    DATA: text_tab TYPE TABLE OF text,
          back_tab LIKE text_tab.


    DATA lt_stringtab TYPE stringtab.
    DATA lt_tab2 TYPE stringtab.
    DATA lt_tab3 TYPE stringtab.
    DATA lt_tab4 TYPE stringtab.
    DATA lt_backtab TYPE stringtab.
    DATA lv_times TYPE i.
    DATA lv_pos TYPE i.
    DATA lv_pos_start TYPE i.
    DATA lv_pos_end TYPE i.

*    do.

    lv_times = strlen( lv_json ).
    lv_pos_start = 0.
    DO lv_times TIMES.

      lv_pos = sy-index - 1.

      IF lv_json+lv_pos(1) = '}'
        OR lv_json+lv_pos(1) = '{'
        OR lv_json+lv_pos(1) = '['
        OR lv_json+lv_pos(1) = ']'.

        lv_pos_end = lv_pos - lv_pos_start.
        APPEND lv_json+lv_pos_start(lv_pos_end)  TO lt_tab2.
        lv_pos_start = lv_pos.

        ADD 1 TO lv_pos.

        lv_pos_end = lv_pos - lv_pos_start.
        APPEND lv_json+lv_pos_start(lv_pos_end)  TO lt_tab2.
        lv_pos_start = lv_pos.

        CONTINUE.
      ENDIF.

      IF lv_json+lv_pos(1) = ','.
        lv_pos_end = lv_pos - lv_pos_start + 1.
        APPEND lv_json+lv_pos_start(lv_pos_end)  TO lt_tab2.
        lv_pos_start = lv_pos + 1.
      ENDIF.


    ENDDO.

    DELETE lt_tab2 WHERE table_line = ''.

    EDITOR-CALL FOR lt_tab2 BACKUP INTO lt_backtab.
*    break-point.
    IF sy-subrc = 0.


      DATA lv_result TYPE string.
      LOOP AT lt_tab2 INTO DATA(lv_string).
        CONCATENATE
            lv_result
            lv_string
            INTO
            lv_result.
      ENDLOOP.

      FREE e_any.
      so_help->trans(
           EXPORTING
*             json               = 'X'
             json_2             = 'X'
             i_any              = lv_result
           IMPORTING
             e_result           = e_any
         ).

*      MODIFY (lv_tabname) FROM TABLE <lt_tab>.

*modify spfli from table <lt_tab>.
*   text_tab <> back_tab.
*  ...
    ENDIF.


  ENDMETHOD.


  METHOD popup_json_table.
    CREATE OBJECT so_help.

    IF iv_tablename IS INITIAL.
      DATA(lv_tablename) = so_help->get( popup_get_value = 'X' i_any = 'Bitte Tabellenname eingeben:' ).
    ELSE.
      lv_tablename = iv_tablename.
    ENDIF.

    DATA(lv_sel) =  so_help->get(
               popup_choose = 'X'
               i_any        = 'Welcher Aktion soll durchgeführt werden?'
               i_any2       = VALUE stringtab(
                      ( `Eintrage erstellen (CREATE)` )
                      ( `Eintrage aendern (UPDATE)` )
                      ( `Eintrage aendern u erstellen (MODIFY)` )
                      (  `Eintraege loeschen (DELETE)` )
                             )
*                i_any3 = lv_sel
            ).

*DATA: lv_tablename TYPE string VALUE 'SPFLI'.       " Tabelle, die ausgelesen werden soll

    DATA: lv_selection_id TYPE rsdynsel-selid.          " Selection-ID zur Unterscheidung mehrerer Sets
    DATA: lv_number_of_fields TYPE i.                   " Anzahl der Felder

    DATA: it_expressions TYPE rsds_texpr.               " Expressions
    DATA: it_field_ranges TYPE rsds_trange.             " Ranges
    DATA: it_tables TYPE STANDARD TABLE OF rsdstabs.    " Init: Tabellen
    DATA: it_fields TYPE STANDARD TABLE OF rsdsfields.  " Init: Felder
    DATA: it_where_clauses TYPE rsds_twhere.            " Daten für Where-Tabelle

* Tabelle hinzufügen
    it_tables = VALUE #( ( prim_tab = lv_tablename ) ).

* freien Selektionsbildschirm initialisieren
    CALL FUNCTION 'FREE_SELECTIONS_INIT'
      EXPORTING
        kind                     = 'T' " T: TABLES_TAB G: FIELD_GROUPS_KEY, F: FIELDS_TAB
        expressions              = it_expressions
*       field_groups_key         =
      IMPORTING
        selection_id             = lv_selection_id
        field_ranges             = it_field_ranges
      TABLES
        tables_tab               = it_tables
        fields_tab               = it_fields
      EXCEPTIONS
        fields_incomplete        = 1
        fields_no_join           = 2
        field_not_found          = 3
        no_tables                = 4
        table_not_found          = 5
        expression_not_supported = 6
        incorrect_expression     = 7
        illegal_kind             = 8
        area_not_found           = 9
        inconsistent_area        = 10
        kind_f_no_fields_left    = 11
        kind_f_no_fields         = 12
        too_many_fields          = 13
        dup_field                = 14
        field_no_type            = 15
        field_ill_type           = 16
        dup_event_field          = 17
        node_not_in_ldb          = 18
        area_no_field            = 19
        OTHERS                   = 20.

    IF sy-subrc = 0.
* freien Selektionsbildschirm anzeigen
      CALL FUNCTION 'FREE_SELECTIONS_DIALOG'
        EXPORTING
          selection_id            = lv_selection_id
          title                   = 'Beispielselektion'
          frame_text              = 'Bitte auswählen'
          status                  = 1                 " normaler Selektionsmodus
          as_window               = abap_true        " abap_true -> als Fenster anzeigen
          no_intervals            = abap_true         " keine Intervalle im Selektionsbild anzeigen, kann über Button "Intervalle" geändert werden
        IMPORTING
          where_clauses           = it_where_clauses
          expressions             = it_expressions
          field_ranges            = it_field_ranges
          number_of_active_fields = lv_number_of_fields
        TABLES
          fields_tab              = it_fields
        EXCEPTIONS
          internal_error          = 1
          no_action               = 2
          selid_not_found         = 3
          illegal_status          = 4
          OTHERS                  = 5.
      BREAK-POINT.
      IF sy-subrc = 0.
        TRY.
* Daten ausgeben
            DATA: o_it TYPE REF TO data.
            DATA: o_it_back TYPE REF TO data.
            DATA: o_row TYPE REF TO data.
            FIELD-SYMBOLS: <fs_table> TYPE ANY TABLE. " Feldsymbol für Arbeit mit Tabelle
            FIELD-SYMBOLS: <fs_table_back> TYPE ANY TABLE. " Feldsymbol für Arbeit mit Tabelle
            FIELD-SYMBOLS: <fs_row> TYPE any.         " Feldsymbol für Arbeit mit Zeile

* dynamische Tabelle vom Typ lv_tablename erzeugen
            CREATE DATA o_it TYPE STANDARD TABLE OF (lv_tablename).
            CREATE DATA o_it_back TYPE STANDARD TABLE OF (lv_tablename).
* Feldsymbol auf die dynamische Tabelle anlegen
            ASSIGN o_it->* TO <fs_table>.

            IF <fs_table> IS ASSIGNED.
* dynamische Workarea vom Typ der Tabellenzeile erzeugen
              CREATE DATA o_row LIKE LINE OF <fs_table>.
* Feldsymbol auf die Workarea anlegen
              ASSIGN o_row->* TO <fs_row>.

              BREAK-POINT.

              IF <fs_row> IS ASSIGNED.

                IF lines( it_where_clauses ) > 0.
                  DATA(ls_where_clause) = it_where_clauses[ tablename = lv_tablename ].
                  SELECT * FROM (lv_tablename) INTO TABLE <fs_table> WHERE (ls_where_clause-where_tab).
                ELSE.
                  SELECT * FROM (lv_tablename) INTO TABLE <fs_table>.
                ENDIF.

                IF sy-subrc = 0.

                  ASSIGN o_it_back->* TO <fs_table_back>.
                  <fs_table_back> = <fs_table>.
*              o_it_back->* = <fs_table>.

                  DATA lo_gui TYPE ty_o_easy_alv.
                  CREATE OBJECT lo_gui.

                  lo_gui->popup_json_data(
                   EXPORTING
                     i_any = <fs_table>
                   IMPORTING
                     e_any = <fs_table>
                 ).

                  IF abap_false = so_help->check(
             tab_equal           = 'X'
             i_any               = <fs_table>
             i_any2              = <fs_table_back>
                ) .
                    IF abap_true =  so_help->get(  popup_confirm = 'X' i_any = 'Daten wurden verändert. Auf DB speichern?' ).
                      MODIFY (lv_tablename) FROM TABLE <fs_table>.
                      so_help->raise_check( sy_subrc = 'X').
                      so_help->do( commit_a_wait = 'X' ).
                    ENDIF.
                  ENDIF.


* herausfinden, wieviele Spalten die Tabelle hat
*                DATA(o_struct) = CAST cl_abap_structdescr( cl_abap_typedescr=>describe_by_data( <fs_row> ) ).
*                DATA(it_comp) = o_struct->get_components( ).

* alle Datensätze der Tabelle durchgehen
*                LOOP AT <fs_table> INTO <fs_row>.

* spaltenweise jeden Datansatz durchgehen
*                  LOOP AT it_comp ASSIGNING FIELD-SYMBOL(<fs_col>).
* den Inhalt der Strukturkomponente (Zeile) ausgeben
*                    ASSIGN COMPONENT <fs_col>-name OF STRUCTURE <fs_row> TO FIELD-SYMBOL(<fs_cell>).

*                    IF <fs_cell> IS ASSIGNED.
**                      WRITE: <fs_cell>.
*                    ENDIF.
*                  ENDLOOP.

*                  NEW-LINE.

*                ENDLOOP.
                ELSE.
                  so_help->gui(  popup_info = 'X' i_any = 'Keine Daten vorhanden. Bitte Selektion prüfen.').
*                WRITE: / 'Keine Daten verfügbar.'.
                ENDIF.
              ENDIF.
            ENDIF.
          CATCH cx_root INTO DATA(lx_root).
            so_help->gui( lx_root ).
*          MESSAGE e_text->get_text( ) TYPE 'S' DISPLAY LIKE 'E'.
        ENDTRY.
      ENDIF.
    ENDIF.


  ENDMETHOD.


  METHOD refresh.

    IF ms_salv-o_salv IS BOUND.

      ms_salv-o_salv->refresh(  ).

    ENDIF.

    IF ms_grid-o_grid IS BOUND.

      ms_grid-o_grid->refresh_table_display(  ).

    ENDIF.

  ENDMETHOD.


  METHOD salv_init.

    FIELD-SYMBOLS:
        <lt_table> TYPE STANDARD TABLE.

    TRY.

*        if ms_control-r_table

        ASSIGN ms_control-r_table->* TO <lt_table>.

        IF ms_control-o_parent_cont IS INITIAL.
          cl_salv_table=>factory(
*            EXPORTING
*            list_display   = if_salv_c_bool_sap=>false " ALV Displayed in List Mode
*              r_container    = ms_control-o_parent_cont                          " Abstract Container for GUI Controls
*            container_name =
            IMPORTING
              r_salv_table   =  ms_salv-o_salv                        " Basis Class Simple ALV Tables
            CHANGING
              t_table        = <lt_table>
          ).

        ELSE.

          cl_salv_table=>factory(
          EXPORTING
*            list_display   = if_salv_c_bool_sap=>false " ALV Displayed in List Mode
            r_container    = ms_control-o_parent_cont                           " Abstract Container for GUI Controls
*            container_name =
            IMPORTING
               r_salv_table   =  ms_salv-o_salv                        " Basis Class Simple ALV Tables
            CHANGING
               t_table        = <lt_table> ).

        ENDIF.

      CATCH cx_root INTO DATA(lx_root).
    ENDTRY.


    ms_salv-o_settings   = ms_salv-o_salv->get_display_settings( ).
    ms_salv-o_sorts      = ms_salv-o_salv->get_sorts( ).
    ms_salv-o_columns    = ms_salv-o_salv->get_columns( ).
    ms_salv-o_functions  = ms_salv-o_salv->get_functions( ).
    ms_salv-o_events     = ms_salv-o_salv->get_event( ).
    ms_salv-o_selections = ms_salv-o_salv->get_selections( ).
    ms_salv-o_layout     = ms_salv-o_salv->get_layout( ).


*       FIELD-SYMBOLS: <lt_table> TYPE STANDARD TABLE.
    ASSIGN ms_control-r_table->* TO <lt_table>.
    ms_grid-t_fieldcat = alv_get_fcat(   <lt_table> ).

  ENDMETHOD.


  METHOD salv_set.


    TRY.

        DATA lv_title TYPE lvc_title.
        lv_title = ms_option-title.
        ms_salv-o_settings->set_list_header(  lv_title ).
*          lo_set->set_list_header( lv_title ).
        ms_salv-o_settings->set_vertical_lines(  ms_option-vertical_lines ).

        ms_salv-o_columns->set_headers_visible( ms_option-headers_visible ).


        IF ms_option-raise_double_click = abap_true.
*          lo_event = lo_alv->get_event(  ).
          SET HANDLER on_salv_double_click FOR ms_salv-o_events. "lo_event.

        ENDIF.

        IF ms_option-t_raise_hotspot IS NOT INITIAL.

          SET HANDLER on_salv_hotspot_click FOR ms_salv-o_events.

        ENDIF.

        ms_salv-o_columns->set_optimize( ms_option-optimize_colwidth ).

        IF ms_option-name_row_color IS NOT INITIAL.
          DATA lv_color_col TYPE lvc_fname.
          lv_color_col = ms_option-name_row_color.
          ms_salv-o_columns->set_color_column( lv_color_col ).
        ENDIF.


        DATA ls_col TYPE ty_s_col_setup.

        DATA: go_column TYPE REF TO cl_salv_column_table.
        DATA lv_name TYPE  lvc_fname.
        DATA lv_length TYPE lvc_outlen.
        DATA: lv_title_m TYPE scrtext_m,
              lv_title_s TYPE scrtext_s,
              lv_title_l TYPE scrtext_l.
*        data: lv_title_m type c length 40.

*               break-point.
*              "Ist spalte ddic? wenn nein feldnamen setzten
*              field-symbols: <lt_table> type standard table.
*                assign ms_control-r_table->* to <lt_table>.
*                so_help->rtti(
*                  exporting
*                    i_any                  = <lt_table>
*                  importing
*                    et_comp                = data(lt_comp)
*                ).
*
*                loop at lt_comp transporting no fields
*                    where name = ls_col-name.

*                endloop.

        LOOP AT ms_option-t_col_setting INTO ls_col.
          TRY.
              lv_name = ls_col-name.
              lv_length = ls_col-out_length.
              go_column ?=  ms_salv-o_columns->get_column( lv_name ).
              go_column->set_output_length( lv_length  ).

              IF ls_col-title IS NOT INITIAL.
                lv_title_m = lv_title_s = lv_title_l = ls_col-title.

                go_column->set_medium_text( lv_title_m  ).
                go_column->set_short_text( lv_title_s  ).
                go_column->set_long_text( lv_title_l  ).
*                 go_column->set_title( lv_title_t  ).
              ELSE.

              ENDIF.

              go_column->set_icon( ls_col-is_icon ).
              go_column->set_technical( ls_col-is_tech ).
              IF ls_col-is_hotspot = abap_true.
                go_column->set_cell_type(
                    value = if_salv_c_cell_type=>hotspot ).
              ELSEIF ls_col-is_button = abap_true.
*                break-point.
                go_column->set_cell_type(
          value = if_salv_c_cell_type=>button ).
              ENDIF.

*              break-point.
              IF strlen( ls_col-color ) >= 3. " is not INITIAL.

                DATA ls_color TYPE lvc_s_colo.
                ls_color-col = ls_col-color(1).
                ls_color-int = ls_col-color+1(1). "iv_intense.
                ls_color-inv = ls_col-color+2(1)."iv_inverse.
                go_column->set_color( ls_color  ).
              ENDIF.

            CATCH cx_root.
          ENDTRY.
        ENDLOOP.


        DATA lv_sort TYPE string.
        DATA lv_sort2 TYPE lvc_fname.
        DATA: lv_hide TYPE string.
        LOOP AT ms_option-t_sort INTO lv_sort.
          lv_sort2 = lv_sort.
          ms_salv-o_sorts->add_sort(  lv_sort2 ).
        ENDLOOP.

        LOOP AT ms_option-t_hide INTO lv_hide.
          TRY.
              lv_name = lv_hide.
              go_column ?=  ms_salv-o_columns->get_column( lv_name ).
              go_column->set_technical( abap_true ).
            CATCH cx_root.
          ENDTRY.

        ENDLOOP.

        LOOP AT ms_option-t_outlen INTO DATA(ls_outlen). " INTO lv_hide.
          TRY.
              lv_name = ls_outlen-name.
              lv_length = ls_outlen-value.
              go_column ?=  ms_salv-o_columns->get_column( lv_name ).
              go_column->set_output_length( value = lv_length ).
            CATCH cx_root.
          ENDTRY.

        ENDLOOP.

        DATA lv_string TYPE string.
        DATA: ls_toolbar LIKE LINE OF ms_option-t_toolbar.
        LOOP AT ms_option-t_raise_hotspot INTO lv_string. " INTO lv_hide.
          TRY.
              lv_name = lv_string.
*              lv_length = ls_outlen-value.
              go_column ?=  ms_salv-o_columns->get_column( lv_name ).
              go_column->set_cell_type( if_salv_c_cell_type=>hotspot ).
            CATCH cx_root.
          ENDTRY.

        ENDLOOP.

        IF ms_option-default_toolbar = abap_true.
*          go_salv_functions_list = go_salv->get_functions( ).
*      go_salv_functions_list->set_all( ).
          ms_salv-o_functions->set_default(  ).
        ENDIF.

        LOOP AT ms_option-t_toolbar INTO ls_toolbar.

          DATA lv_c_40 TYPE c LENGTH 40.
          lv_c_40 = ls_toolbar-text  .
          lv_string = ls_toolbar-text  .
*    ls_toolbar-text  .

          TRY.

              ms_salv-o_functions->add_function(
                EXPORTING
                  name               = ls_toolbar-function    " ALV Funktion
*         icon               =
                  text               = lv_string
                  tooltip            = lv_string
                  position           = if_salv_c_function_position=>right_of_salv_functions     " Funktion Positionierung
              ).

            CATCH cx_root.
          ENDTRY.
*       catch cx_salv_existing.    "
*       catch cx_salv_wrong_call.    " set_function(
*       exporting
*         name               =     <<" ALV Funktion
*         boolean            =     " boolsche Variable (X=true, space=false)
*     ).
*       catch cx_salv_not_found.    "
*       catch cx_salv_wrong_call.    "

        ENDLOOP.


        DATA lv_selmode TYPE i.
        lv_selmode = ms_option-selmode.
        ms_salv-o_selections->set_selection_mode( lv_selmode ).



        IF ms_option-s_layout IS NOT INITIAL.

          DATA ls_layout TYPE salv_s_layout_key.

          ls_layout-report = ms_option-s_layout-report.
          ls_layout-handle = ms_option-s_layout-handle.
* ls_layout-repid = ms_option-s_layout-report.

*      key-report = sy-repid.
*  gr_layout = l_gr_alv->get_layout( ).
          ms_salv-o_layout->set_key( value = ls_layout ). "gr_layout->set_key( key ).
          IF ms_option-layout_restriction IS NOT INITIAL.
            DATA lv_restri TYPE i.
            lv_restri = ms_option-layout_restriction.
            ms_salv-o_layout->set_save_restriction( lv_restri ).
          ENDIF.
          ms_salv-o_layout->set_default( abap_true ).
*
*gr_layout type ref to cl_salv_layout
*
*  key type salv_s_layout_key.

        ENDIF.


*




* Eventhandler für Klicks in die Toolbar des SALV-Grids setzen
        SET HANDLER on_salv_toolbar_click FOR ms_salv-o_events.





      CATCH cx_root.
    ENDTRY.

  ENDMETHOD.


  METHOD set.
    FIELD-SYMBOLS: <ls_toolbar> LIKE LINE OF ms_option-t_toolbar.


    ms_option-title = iv_title.
    ms_option-headers_visible = iv_headers_visible.
    ms_option-t_edit = it_edit.
    ms_option-raise_after_data_changed =  iv_raise_after_data_changed.
    ms_option-t_raise_f4 = it_raise_f4.
    ms_option-default_toolbar = iv_default_toolbar.
    ms_option-raise_double_click = iv_raise_double_click.
*    if it_raise_hotspot is not initial.
    ms_option-t_raise_hotspot = it_raise_hotspot.
    ms_option-t_hide    = it_hide.
    ms_option-t_sort    = it_sort.
    ms_option-t_col_setting = it_col_setting.
    ms_option-t_outlen  = it_outlen.
    ms_option-optimize_colwidth = iv_optimize_colwidth.
    ms_option-t_toolbar = it_raise_toolbar.
    ms_option-selmode   = iv_selmode.
    ms_option-t_toolbar_hide = it_toolbar_hide.

    IF is_layout IS NOT INITIAL.
      ms_option-s_layout = is_layout.
    ELSE.
      ms_option-s_layout-handle = iv_layout_handle.
      ms_option-s_layout-report = iv_layout_report.
    ENDIF.
    ms_option-layout_restriction = iv_layout_restriction.
    ms_option-name_row_color = iv_name_row_color.
    ms_option-name_row_style = iv_name_row_style.


    LOOP AT ms_option-t_toolbar ASSIGNING <ls_toolbar>.

      IF <ls_toolbar>-butn_type IS INITIAL.
        <ls_toolbar>-butn_type = '4'.
      ENDIF.

    ENDLOOP.


    IF ms_control-is_type_salv = abap_true.
      salv_set(  ).
    ELSE.
      grid_set(  ).
    ENDIF.


  ENDMETHOD.


  METHOD update_fieldcat.

    get_alv_info(
      EXPORTING
        it_ref_table = it_ref_table
        io_alv       = io_alv
      IMPORTING
        es_layout    = DATA(ls_layout)
        et_filter    = DATA(lt_filter)
        et_sort      = DATA(lt_sort)
        es_variant   = DATA(ls_variant)  ).

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



  ENDMETHOD.
ENDCLASS.


CLASS lcx_no_check DEFINITION INHERITING FROM cx_no_check FRIENDS  lcl_help.

  PUBLIC SECTION.

    INTERFACES if_t100_message.

    DATA:
      text    TYPE string,
      texttab TYPE stringtab,
      ms_data TYPE lcl_help=>so_help->ty-s_cx_data.

    METHODS:
      get_text REDEFINITION,
      get_longtext REDEFINITION.

ENDCLASS.

CLASS lcx_no_check IMPLEMENTATION.

  METHOD get_text.
    result = ms_data-s_bapiret-message.
  ENDMETHOD.

  METHOD get_longtext.
    result = get_text(  ).
  ENDMETHOD.

ENDCLASS.

*CLASS lcx_static_check DEFINITION INHERITING FROM cx_static_check FRIENDS  lcl_local_help.
*
*  PUBLIC SECTION.
*    DATA:
*      text    TYPE string,
*      texttab TYPE stringtab,
*      ms_data TYPE lcl_local_help=>ty_s_cx_data.
*
*    METHODS:
*      get_text REDEFINITION.
*
*ENDCLASS.
*
*CLASS lcx_static_check IMPLEMENTATION.
*
*  METHOD get_text.
*    result = ms_data-s_bapiret-message.
*  ENDMETHOD.
*
*ENDCLASS.


CLASS lcl_help IMPLEMENTATION.

method cfw_get_fcat.

    DATA:
      lo_alv          TYPE REF TO cl_salv_table,
      lo_columns      TYPE REF TO cl_salv_columns_list,
      lo_aggregations TYPE REF TO cl_salv_aggregations,
      lx_previous     TYPE REF TO cx_root.

    DATA lt_tab TYPE REF TO data.

    CREATE DATA lt_tab
        LIKE it_table.

* -----------------------------------------------------------------------------
* Fieldkatalog erzeugen

    TRY.
        FIELD-SYMBOLS: <lt_table> TYPE STANDARD TABLE.
*        ASSIGN ms_control-r_table->* TO <lt_table>.
        ASSIGN lt_tab->* TO <lt_table>.


        cl_salv_table=>factory(
          IMPORTING
            r_salv_table   =  lo_alv   " Basisklasse einfache ALV Tabellen
          CHANGING
            t_table        = <lt_table> ).


        lo_columns = lo_alv->get_columns( ).
        lo_aggregations = lo_alv->get_aggregations( ).

        r_result = cl_salv_controller_metadata=>get_lvc_fieldcatalog( r_columns      = lo_columns
                                                                     r_aggregations = lo_aggregations ).

      CATCH cx_salv_msg INTO lx_previous.
*        lx_root = factory_cx_t100( i_any  = 'Fehler beim Erstellen des Feldkatalogs'(002)  io_previous = lx_previous ).
*        RAISE EXCEPTION lx_root.
    ENDTRY.

endmethod.

  METHOD so10_read.

    DATA:
      lv_object TYPE thead-tdobject,
      lv_name   TYPE thead-tdname,
      lv_id     TYPE thead-tdid,
      lv_langu  TYPE thead-tdspras,
      lt_lines  TYPE STANDARD TABLE OF tline,
      s_header  TYPE thead.

    lv_object = i_key1.
    lv_id     = i_key2.
    lv_name   = i_key3.
    lv_langu  = i_key4.

    IF lv_langu IS INITIAL.
      lv_langu = sy-langu.
    ENDIF.

    CALL FUNCTION 'READ_TEXT'
      EXPORTING
        object          = lv_object
        name            = lv_name
        id              = lv_id
        language        = lv_langu
*       LOCAL_CAT       = LOCAL_CAT
      IMPORTING
        header          = s_header
      TABLES
        lines           = lt_lines
      EXCEPTIONS
        object          = 1
        id              = 2
        language        = 3
        name            = 4
        not_found       = 5
        reference_check = 6.
    IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
    so_help->raise_check( function = 'X' ).

    DATA lt_stringtab TYPE stringtab.
    LOOP AT lt_lines INTO DATA(ls_line).
      APPEND INITIAL LINE TO lt_stringtab ASSIGNING FIELD-SYMBOL(<lv_string>).
      <lv_string> = ls_line-tdline.
    ENDLOOP.

    e_result = lt_stringtab.

  ENDMETHOD.


  METHOD  convert_binary_2_xstring.

    DATA lv_xstring TYPE xstring.
    DATA lv_length TYPE i.

    lv_length = 255 * lines(  it_input ).

    CALL FUNCTION 'SCMS_BINARY_TO_XSTRING'
      EXPORTING
        input_length  = lv_length
      IMPORTING
        buffer        = r_result "lv_xstring
      TABLES
        binary_tab    = it_input
      EXCEPTIONS
        failed        = 1
        error_message = 2
        OTHERS        = 3.
    IF sy-subrc <> sy-subrc. sy-subrc = sy-subrc. ENDIF. "SLINT Check OK withoput pragma
    so_help->raise_check(  function = 'X' ).

  ENDMETHOD.



  METHOD so10_write.


    DATA ls_header TYPE thead.
    FIELD-SYMBOLS:
      <lt_any>  TYPE STANDARD TABLE,
      <lv_any>  TYPE any,
      <ls_line> TYPE tline.

    DATA:  lt_lines   TYPE STANDARD TABLE OF tline.

    ls_header-tdobject = i_key1.
    ls_header-tdid     = i_key2.
    ls_header-tdname   = i_key3.
    IF i_key4 IS INITIAL.
      ls_header-tdspras  = sy-langu.
    ELSE.
      ls_header-tdspras  = i_key4.
    ENDIF.

    ASSIGN i_any TO <lt_any>.
    LOOP AT <lt_any> ASSIGNING <lv_any>.
      APPEND INITIAL LINE TO lt_lines ASSIGNING <ls_line>.
      <ls_line>-tdline = <lv_any>.
    ENDLOOP.

    CALL FUNCTION 'SAVE_TEXT'
      EXPORTING
*       client        = sy-mandt
        header        = ls_header
      TABLES
        lines         = lt_lines
      EXCEPTIONS
        id            = 1
        language      = 2
        name          = 3
        object        = 4
        error_message = 5
        OTHERS        = 6.
    IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
    so_help->raise_check( function = 'X' ).

    IF i_commit = abap_true.

      CALL FUNCTION 'COMMIT_TEXT'
        EXPORTING
          id       = ls_header-tdid
          language = ls_header-tdspras
          name     = ls_header-tdname
          object   = ls_header-tdobject.

      COMMIT WORK AND WAIT.
    ENDIF.

  ENDMETHOD.


  METHOD convert_xstring_2_binary.

    r_result = cl_bcs_convert=>xstring_to_solix( iv_xstring = iv_input ). "lv_xstring ).

  ENDMETHOD.



  METHOD gos_read_object_list.


    TRY.

        TYPES
           : BEGIN OF gys_key
           ,   foltp TYPE so_fol_tp
           ,   folyr TYPE so_fol_yr
           ,   folno TYPE so_fol_no
           ,   objtp TYPE so_obj_tp
           ,   objyr TYPE so_obj_yr
           ,   objno TYPE so_obj_no
           ,   forwarder TYPE so_usr_nam
           , END OF gys_key
           .

        DATA
            " Schlüssel des Business-Objekts
          : gs_object   TYPE sibflporb

            " Verknüpfungen zum Objekt
          , gt_relopt   TYPE obl_t_relt
          , gs_relopt   TYPE obl_s_relt

          .

        " Businessobjekt-ID übernehmen
        gs_object-instid  = iv_instid.
        gs_object-typeid  = iv_typeid.
        gs_object-catid   = iv_catid.

        " Verknüpfungstypen:
        gs_relopt-sign = 'I'.
        gs_relopt-option = 'EQ'.

        " Anhänge
        gs_relopt-low = 'ATTA'.
        APPEND gs_relopt TO gt_relopt.
        " Notizen
        gs_relopt-low = 'NOTE'.
        APPEND gs_relopt TO gt_relopt.
        " URLs
        gs_relopt-low = 'URL'.
        APPEND gs_relopt TO gt_relopt.

*        TRY.
        " Verknüpfungen zum Objekt lesen
        cl_binary_relation=>read_links_of_binrels(
          EXPORTING
            is_object           = gs_object
            it_relation_options = gt_relopt
            ip_role             = 'GOSAPPLOBJ'
          IMPORTING
            et_links            = et_result ).


      CATCH cx_root INTO DATA(lx_root).
*        IF use_exceptions = abap_true.
        so_help->raise(  lx_root ).
*        ENDIF.
    ENDTRY.

  ENDMETHOD.

  METHOD gos_create_object.


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
      .

    TRY.


        DATA lv_name TYPE string.
        DATA lv_ext TYPE string.

        SPLIT iv_filename_w_ext AT '.' INTO lv_name lv_ext.

        gd_doc_type           = lv_ext. " 'pdf'.
        gs_doc_data-obj_descr = lv_name. "'test7'.
        gs_doc_data-obj_name  = iv_filename_w_ext.. " 'test7.pdf'.

        gs_doc_data-doc_size = xstrlen( iv_data ) . "gd_flen.
        DATA lt_pdf_bin TYPE solix_tab.
        so_help->trans( EXPORTING i_any = iv_data IMPORTING e_result = lt_pdf_bin ).
*        DATA(lt_pdf_bin) = convert_xstring_2_binary( iv_input = iv_data ).

        " Root-Folder der GOS ermitteln
        CALL FUNCTION 'SO_FOLDER_ROOT_ID_GET'
          EXPORTING
            region                = 'B'
          IMPORTING
            folder_id             = gs_folder
          EXCEPTIONS
            communication_failure = 1
            owner_not_exist       = 2
            system_failure        = 3
            x_error               = 4
            error_message         = 5
            OTHERS                = 6.
        IF sy-subrc <> sy-subrc. sy-subrc = sy-subrc. ENDIF. "SLINT Check OK withoput pragma
        so_help->raise_check(  function = 'X' ) .

        " Dokument anlegen
        CALL FUNCTION 'SO_DOCUMENT_INSERT_API1'
          EXPORTING
            folder_id                  = gs_folder
            document_data              = gs_doc_data
            document_type              = gd_doc_type
          IMPORTING
            document_info              = gs_doc_info
          TABLES
            contents_hex               = lt_pdf_bin
          EXCEPTIONS
            folder_not_exist           = 1
            document_type_not_exist    = 2
            operation_no_authorization = 3
            parameter_error            = 4
            x_error                    = 5
            enqueue_error              = 6
            error_message              = 8
            OTHERS                     = 9.
        IF sy-subrc <> sy-subrc. sy-subrc = sy-subrc. ENDIF. "SLIN Check OK withoput pragma
        so_help->raise_check(  function = 'X' ) .

        " Businessobjekt-ID übernehmen
        gs_object-instid  = iv_instid. "p_instid.
        gs_object-typeid  = iv_typeid. "p_typeid.
        gs_object-catid   = iv_catid. "p_catid.

        gs_object-instid  = so_help->get(  conv_in = 'X' i_any = gs_object-instid i_any2 = 'ALPHA' ).

        " Dokumentdaten als Ziel
        CONCATENATE gs_folder gs_doc_info-object_id
           INTO gs_objtgt-instid RESPECTING BLANKS.
        " Alternative:
        " gs_objtgt-instid = gs_doc_info-doc_id.
        gs_objtgt-typeid  = 'MESSAGE'.
        gs_objtgt-catid   = 'BO'.


        " Verknüpfung anlegen
        cl_binary_relation=>create_link(
          EXPORTING
            is_object_a = gs_object
            is_object_b = gs_objtgt
            ip_reltype  = 'ATTA' ).


        IF commit_work = abap_true.
          so_help->do( commit_a_wait = 'X' ).
        ENDIF.

      CATCH cx_root INTO DATA(lx_root).
        IF use_exceptions = abap_true.
          so_help->raise( lx_root ).
        ENDIF.

    ENDTRY.

  ENDMETHOD.

  METHOD gui_download.

*       IF sy-subrc = 0.

    DATA: lv_action TYPE i.
    DATA: lv_filename TYPE string.
    DATA: lv_fullpath TYPE string.
    DATA: lv_path TYPE string.

    DATA lv_type TYPE char10. " default 'ASC'.
    lv_type = iv_type.

    TRY.
        DATA lt_bin_data TYPE solix_tab.
        so_help->trans( EXPORTING i_any = iv_input IMPORTING e_result = lt_bin_data ).
*    DATA(lt_bin_data) = convert_xstring_2_binary( iv_input ). "convert_string_2_binary( iv_input = iv_input ).

        IF abap_false = so_help->check( gui_active = 'X' ).
          so_help->raise( 'ZCX_NO_GUI_ACTIVE_ERROR').
        ENDIF.

        DATA lv_name TYPE string.
        DATA lv_ext TYPE string.

        SPLIT iv_filname_w_ext AT '.' INTO lv_name lv_ext.
* Speichern-Dialog
        cl_gui_frontend_services=>file_save_dialog( EXPORTING
                                                      default_file_name = iv_filname_w_ext
                                                      default_extension = lv_ext
                                                      file_filter       = '(*.pdf)|*.pdf|'
                                                    CHANGING
                                                      filename          = lv_filename
                                                      path              = lv_path
                                                      fullpath          = lv_fullpath
                                                      user_action       = lv_action ).

        IF lv_action EQ cl_gui_frontend_services=>action_ok.
* Daten lokal speichern
          cl_gui_frontend_services=>gui_download( EXPORTING
                                                    bin_filesize = xstrlen( iv_input )
                                                    filename     = lv_fullpath
                                                    filetype     = lv_type
                                                  CHANGING
                                                    data_tab     = lt_bin_data ).
        ENDIF.

      CATCH cx_root INTO DATA(lx_root).
        IF use_exceptions = abap_true.
          so_help->raise( lx_root ).
        ENDIF.
    ENDTRY.


  ENDMETHOD.


  METHOD gui_upload.



    DATA: lt_file_table TYPE filetable,
          ls_file       TYPE file_table,
          lv_rc         TYPE i.


    TRY.

        IF abap_false = so_help->check( gui_active = 'X' ).
          so_help->raise( 'ZCX_NO_GUI_ACTIVE_ERROR').
        ENDIF.

*  LS_FILE-FILENAME = P_FILE.
        APPEND ls_file TO lt_file_table.

        CALL METHOD cl_gui_frontend_services=>file_open_dialog
*    EXPORTING
*      WINDOW_TITLE            =
*      DEFAULT_EXTENSION       =
*      DEFAULT_FILENAME        =
*      FILE_FILTER             =
*      WITH_ENCODING           =
*      INITIAL_DIRECTORY       =
*      MULTISELECTION          =
          CHANGING
            file_table              = lt_file_table
            rc                      = lv_rc
*           USER_ACTION             =
*           FILE_ENCODING           =
          EXCEPTIONS
            file_open_dialog_failed = 1
            cntl_error              = 2
            error_no_gui            = 3
            not_supported_by_gui    = 4
            OTHERS                  = 5.
        so_help->raise_check(  function = 'X' ).

        READ TABLE lt_file_table INTO ls_file INDEX 1.

        IF sy-subrc = 0.
          DATA(lv_path) = ls_file-filename.
        ENDIF.


        DATA: lv_filename TYPE string.
        DATA lt_solix TYPE solix_tab.

        lv_filename = lv_path.

        DATA lv_type TYPE char10. " default 'ASC'.
        lv_type = iv_type.

        CALL METHOD cl_gui_frontend_services=>gui_upload
          EXPORTING
            filename                = lv_filename
            filetype                = lv_type
*           HAS_FIELD_SEPARATOR     = SPACE
*           HEADER_LENGTH           = 0
*           READ_BY_LINE            = 'X'
*           DAT_MODE                = SPACE
*           CODEPAGE                = SPACE
*           IGNORE_CERR             = ABAP_TRUE
*           REPLACEMENT             = '#'
*           VIRUS_SCAN_PROFILE      =
*    IMPORTING
*           FILELENGTH              =
*           HEADER                  =
          CHANGING
            data_tab                = lt_solix
          EXCEPTIONS
            file_open_error         = 1
            file_read_error         = 2
            no_batch                = 3
            gui_refuse_filetransfer = 4
            invalid_type            = 5
            no_authority            = 6
            unknown_error           = 7
            bad_data_format         = 8
            header_not_allowed      = 9
            separator_not_allowed   = 10
            header_too_long         = 11
            unknown_dp_error        = 12
            access_denied           = 13
            dp_out_of_memory        = 14
            disk_full               = 15
            dp_timeout              = 16
            not_supported_by_gui    = 17
            error_no_gui            = 18
            OTHERS                  = 19.
        so_help->raise_check(  function = 'X' ).

        so_help->trans( EXPORTING i_any = lt_solix  IMPORTING e_result = r_result ).
*        r_result = convert_binary_2_xstring( lt_solix ).

      CATCH cx_root INTO DATA(lx_root).
        IF use_exceptions = abap_true.
          so_help->raise( lx_root ).
        ENDIF.
    ENDTRY.

  ENDMETHOD.


  METHOD gos_read_object_head.
*   , END OF gys_key
*   .
    TYPES
       : BEGIN OF gys_key
       ,   foltp TYPE so_fol_tp
       ,   folyr TYPE so_fol_yr
       ,   folno TYPE so_fol_no
       ,   objtp TYPE so_obj_tp
       ,   objyr TYPE so_obj_yr
       ,   objno TYPE so_obj_no
       ,   forwarder TYPE so_usr_nam
       , END OF gys_key
       .
    DATA
        " Schlüssel des Business-Objekts
      : gs_key      TYPE gys_key

        " Dokumenten-ID
      , gd_doc_id   TYPE so_entryid

        " Dokumenten-Grunddaten
      , gt_contx    TYPE solix_tab
      , gt_cont     TYPE soli_tab
      .

    DATA lt_doc TYPE solix_tab.

    TRY.
        " Optional: Schlüsselkomponenten extrahieren
        gs_key = is_link-instid_b.

        " Die Dokumenten-ID für SAPOffice entspricht der ermittelten
        "   Instanz-ID
        gd_doc_id = is_link-instid_b.

        " Dokumenteninhalte löschen
        CLEAR
          : gt_cont
          , gt_contx
          .
        " Dokument lesen
        CALL FUNCTION 'SO_DOCUMENT_READ_API1'
          EXPORTING
            document_id                = gd_doc_id
          IMPORTING
            document_data              = r_result "gs_doc_data
*          TABLES
*           object_content             = gt_cont
*           contents_hex               = lt_doc
          EXCEPTIONS
            document_id_not_exist      = 1
            operation_no_authorization = 2
            x_error                    = 3
            error_message              = 4
            OTHERS                     = 5.
        IF sy-subrc <> 0. sy-subrc = sy-subrc . ENDIF. "SLIN OK without pragma
        so_help->raise_check(  function = 'X' ).


      CATCH cx_root INTO DATA(lx_root).
*        IF use_exceptions = abap_true.
        so_help->raise( lx_root ).
*        ENDIF.
    ENDTRY.
  ENDMETHOD.




  METHOD gos_read_object_content.
*   , END OF gys_key
*   .
    TYPES
       : BEGIN OF gys_key
       ,   foltp TYPE so_fol_tp
       ,   folyr TYPE so_fol_yr
       ,   folno TYPE so_fol_no
       ,   objtp TYPE so_obj_tp
       ,   objyr TYPE so_obj_yr
       ,   objno TYPE so_obj_no
       ,   forwarder TYPE so_usr_nam
       , END OF gys_key
       .
    DATA
        " Schlüssel des Business-Objekts
      : gs_key      TYPE gys_key

        " Dokumenten-ID
      , gd_doc_id   TYPE so_entryid

        " Dokumenten-Grunddaten
      , gt_contx    TYPE solix_tab
      , gt_cont     TYPE soli_tab
      .

    DATA lt_doc TYPE solix_tab.

    TRY.
        " Optional: Schlüsselkomponenten extrahieren
        gs_key = is_link-instid_b.

        " Die Dokumenten-ID für SAPOffice entspricht der ermittelten
        "   Instanz-ID
        gd_doc_id = is_link-instid_b.

        " Dokumenteninhalte löschen
        CLEAR
          : gt_cont
          , gt_contx
          .
        " Dokument lesen
        CALL FUNCTION 'SO_DOCUMENT_READ_API1'
          EXPORTING
            document_id                = gd_doc_id
*          IMPORTING
*           document_data              = es_docdata "gs_doc_data
          TABLES
            object_content             = gt_cont
            contents_hex               = lt_doc
          EXCEPTIONS
            document_id_not_exist      = 1
            operation_no_authorization = 2
            x_error                    = 3
            error_message              = 4
            OTHERS                     = 5.
        IF sy-subrc <> 0. sy-subrc = sy-subrc . ENDIF. "SLIN OK without pragma
        so_help->raise_check(  function = 'X' ).

*        r_result =

        so_help->trans( EXPORTING i_any = lt_doc IMPORTING e_result = r_result ).

*  trans(  )=>convert_binary_2_xstring( lt_doc ).



*        so_help->trans(
*          EXPORTING
*            i_any     = lt_doc
*          IMPORTING
*            e_result  = r_result
*        ).

      CATCH cx_root INTO DATA(lx_root).
*        IF use_exceptions = abap_true.
        so_help->raise( lx_root ).
*        ENDIF.

    ENDTRY.
  ENDMETHOD.



  METHOD lock_set.

    TRY.

        lock_queue(
          EXPORTING
            iv_is_lock    = abap_true "fm_name  = lv_name_fm
            iv_val1       = iv_val1
            iv_val2       = iv_val2
            iv_val3       = iv_val3
            iv_val4       = iv_val4
            iv_lock       = iv_lock
            iv_mode       = iv_mode
            iv_scope      = iv_scope
            iv_is_collect = iv_is_collect ).


        """""""""""""""""""""""""""
        " Fehlerverarbeitung

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        "D  SE  893 Sperre kann nicht gesetzt werden
        so_help->raise( i_any = so_help->get_msg( iv_id = 'SE' iv_no = '893' )
                        i_prev = lx_root ).
    ENDTRY.

  ENDMETHOD.                    "lock_set

  METHOD lock_free.

    TRY.

        lock_queue(
          EXPORTING
            iv_is_lock  = abap_false "fm_name  = lv_name_fm
            iv_val1       = iv_val1
            iv_val2       = iv_val2
            iv_val3       = iv_val3
            iv_val4       = iv_val4
            iv_lock       = iv_lock
            iv_mode       = iv_mode
            iv_scope      = iv_scope
            iv_is_collect = iv_is_collect ).


        """""""""""""""""""""""""""
        " Fehlerverarbeitung

        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        "D  UA_INV_VALUATION    031 Sperre kann nicht aufgehoben werden
        so_help->raise( i_any = so_help->get_msg( iv_id = 'UA_INV_VALUATION' iv_no =  '031' )
                        i_prev = lx_root ).
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
        IF sy-subrc <> 0. sy-subrc = 3. ENDIF.
        so_help->raise_check(  function = 'X'  ).

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
        IF sy-subrc <> 0. sy-subrc = 4. ENDIF.
        so_help->raise_check(  function = 'X'  ).


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
              iv_val3       = iv_val3
              iv_val4       = iv_val4 ).

        ENDIF.


        "MODE
        LOOP AT lt_import INTO ls_para.

          IF sy-tabix = 1.
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
          so_help->raise( sy ).
        ENDIF.

        """""""""""

        DATA:lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        so_help->raise(  i_any = so_help->get_msg(
                                        i_any = 'VALUE = &1 TABLE = &2 OBJECT = &3'
                                        iv_v1 = iv_val2
                                        iv_v2 = lv_tab
                                        iv_v3 = iv_lock )
                        i_prev = lx_root ).
    ENDTRY.

  ENDMETHOD.                    "lock_queue

  METHOD lock_is_set.

    DATA:
      lt_enq    TYPE STANDARD TABLE OF seqg3,
      lv_garg   TYPE seqg3-garg,
      lv_gname  TYPE eqegraname,
      lv_number TYPE syst-tabix,
      lv_subrc  TYPE sy-subrc,
      lv_tab    TYPE eqegraname,
      lv_string TYPE string.

    lv_gname = iv_lock.

    SELECT roottab
           FROM dd25l
           WHERE viewname = @lv_gname
           ORDER BY PRIMARY KEY
           INTO @lv_tab
           UP TO 1 ROWS.
    ENDSELECT.
    so_help->raise_check( select = 'X' ).

*    SELECT SINGLE roottab
*         FROM dd25l
*          INTO lv_tab
*          WHERE viewname = lv_gname. "iv_lock.
*    so_help->raise_check( select = 'X' ).

    CONCATENATE
        iv_val iv_val2 iv_val3 iv_val4 INTO lv_string.
    SHIFT lv_string LEFT DELETING LEADING ' '.
    lv_garg = lv_string.

*    IF iv_val2 IS NOT SUPPLIED.
*      CONCATENATE sy-mandt iv_val INTO lv_garg. "== concatenated the client and the document number to be used in garg
*    ELSE.
*      CONCATENATE sy-mandt iv_val iv_val2 INTO lv_garg.
*    ENDIF.

    IF iv_unam IS NOT INITIAL.

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
      IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma

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
      IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma

    ENDIF.
    so_help->raise_check(  function = 'X' ).

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
    IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
    so_help->raise_check( function = 'X' ).

    so_help->info( IMPORTING ev_work_process_id = lv_process_id ).
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
        so_help->raise('ZCX_CREATE_LOCKS_WITH_SNAPSHOT_ERROR').
    ENDTRY.

  ENDMETHOD.                    "lock_set_snap

  METHOD lock_collect_set.

    CALL FUNCTION 'FLUSH_ENQUEUE'
      EXCEPTIONS
        foreign_lock   = 1
        system_failure = 2
        error_message  = 3
        OTHERS         = 4.
    IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
    so_help->raise_check(  function = 'X' ).

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

            "TODO
            so_help->rtti(
              EXPORTING
                i_any             = <lv_any>
              IMPORTING
                ev_length = lv_int  ).

*            so_help->so_obsolete->rtts_get_info_simple(
*              EXPORTING
*                iv_element      = <lv_any>
*              IMPORTING
*                ev_outputlen    = lv_int ).

            <lv_any> = iv_parms+lv_pos(lv_int).
            ADD lv_int TO lv_pos.
            <lv_any> = so_help->get( conv_in = 'X' i_any = <lv_any> ).
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
                so_help->raise('ZCX_WRONG_NUMBER_KEY_ENTRIES_FOR_LOCK_ERROR').
              ENDIF.

              ls_parameters-name  = ls_para-parameter. "'VBELN'.
              ls_parameters-kind  = abap_func_exporting.
              CREATE DATA lr_data TYPE (ls_para-typ).
              ASSIGN lr_data->* TO <lv_any>.
              <lv_any> = iv_val1.
              <lv_any> = so_help->get( conv_in = 'X' i_any =  <lv_any> ).
              GET REFERENCE OF <lv_any> INTO lr_data.
              ls_parameters-value = lr_data.
              INSERT ls_parameters INTO TABLE rt_parameters.
            ENDIF.

            IF iv_val2 IS NOT INITIAL AND sy-tabix = 3.

              IF ls_para-typ = '' AND ls_para-parameter(1) = 'X'.
                so_help->raise('ZCX_WRONG_NUMBER_KEY_ENTRIES_FOR_LOCK_ERROR').
              ENDIF.

              ls_parameters-name  = ls_para-parameter. "'VBELN'.
              ls_parameters-kind  = abap_func_exporting.
              CREATE DATA lr_data TYPE (ls_para-typ).
              ASSIGN lr_data->* TO <lv_any>.
              <lv_any> = iv_val2.
              <lv_any> = so_help->get( conv_in = 'X' i_any = <lv_any> ).
              GET REFERENCE OF <lv_any> INTO lr_data.
              ls_parameters-value = lr_data.
              INSERT ls_parameters INTO TABLE rt_parameters.
            ENDIF.

            IF iv_val3 IS NOT INITIAL AND sy-tabix = 4.

              IF ls_para-typ = '' AND ls_para-parameter(1) = 'X'.
                so_help->raise('ZCX_WRONG_NUMBER_KEY_ENTRIES_FOR_LOCK_ERROR').
              ENDIF.

              ls_parameters-name  = ls_para-parameter. "'VBELN'.
              ls_parameters-kind  = abap_func_exporting.
              CREATE DATA lr_data TYPE (ls_para-typ).
              ASSIGN lr_data->* TO <lv_any>.
              <lv_any> = iv_val3.
              <lv_any> = so_help->get( conv_in = 'X' i_any = <lv_any> ).
              GET REFERENCE OF <lv_any> INTO lr_data.
              ls_parameters-value = lr_data.
              INSERT ls_parameters INTO TABLE rt_parameters.
            ENDIF.

            IF iv_val4 IS NOT INITIAL AND sy-tabix = 5.

              IF ls_para-typ = '' AND ls_para-parameter(1) = 'X'.
                so_help->raise('ZCX_WRONG_NUMBER_KEY_ENTRIES_FOR_LOCK_ERROR').
              ENDIF.

              ls_parameters-name  = ls_para-parameter. "'VBELN'.
              ls_parameters-kind  = abap_func_exporting.
              CREATE DATA lr_data TYPE (ls_para-typ).
              ASSIGN lr_data->* TO <lv_any>.
              <lv_any> = iv_val3.
              <lv_any> = so_help->get( conv_in = 'X' i_any = <lv_any> ).
              GET REFERENCE OF <lv_any> INTO lr_data.
              ls_parameters-value = lr_data.
              INSERT ls_parameters INTO TABLE rt_parameters.
            ENDIF.

          ENDLOOP.

        ENDIF.

        DATA:
                lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        so_help->raise( i_any = 'ZCX_LOCK_ERROR' i_prev = lx_root ).
    ENDTRY.

  ENDMETHOD.                    "lock_queue_get_parmtab


  METHOD selscreen_get.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Diese Methode liest von einem Selektionsbild die Daten aus
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA:
      lv_repid  TYPE string,
      lt_params TYPE rsparams_tt.

    TRY.

        FREE ev_value.

        IF iv_repid IS INITIAL.
          so_help->info( EXPORTING iv_depth = 1 IMPORTING ev_repid = lv_repid ).
        ELSE.
          lv_repid = iv_repid.
        ENDIF.



        IF et_range_single IS SUPPLIED AND iv_single_fieldname IS NOT INITIAL.

          et_range_single = lcl_help=>data_2_single_range(
                   iv_repid = lv_repid iv_name = iv_single_fieldname ).

          RETURN.
        ENDIF.

        IF et_range_multi_dirty IS SUPPLIED AND iv_multi_tabname IS NOT INITIAL.

          et_range_multi_dirty =  lcl_help=>data_2_rangetab_dirty(
              iv_repid = lv_repid iv_tabname = iv_multi_tabname ).

          RETURN.
        ENDIF.

        IF et_parameter IS SUPPLIED.

          IF iv_variant IS NOT INITIAL.

            DATA lv_report_vari TYPE c LENGTH 40.
            DATA lv_vari_vari TYPE c LENGTH 14.

            lv_report_vari = lv_repid.
            lv_vari_vari   = iv_variant.
            lv_report_vari = so_help->get( trim_upper_case = 'X' i_any = lv_report_vari ).
            lv_vari_vari   = so_help->get( trim_upper_case = 'X' i_any = lv_vari_vari ).

            CALL FUNCTION 'RS_VARIANT_VALUES_TECH_DATA'
              EXPORTING
                report               = lv_report_vari  " Report Name
                variant              = lv_vari_vari  " Variant Name
*               sel_text             = SPACE
*               move_or_write        = 'W'
*               sorted               = SPACE    " Order as on selection screen
                execute_direct       = 'X'
*      IMPORTING
*               techn_data           =
              TABLES
                variant_values       = et_parameter
*               variant_text         =     " Selection Texts
              EXCEPTIONS
                variant_non_existent = 1
                variant_obsolete     = 2
                error_message        = 3
                OTHERS               = 4.
            IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
            so_help->raise_check( function = abap_true i_head = 'ZCX_NO_SELECTION_FOR_VARIANT_FOUND_ERROR').

          ELSE.


            et_parameter =  lcl_help=>data_2_params(
                   iv_repid = lv_repid ).

          ENDIF.
          RETURN.
        ENDIF.

        IF iv_value_name IS SUPPLIED.

          ev_value =  lcl_help=>data_2_single_value(
                iv_repid = lv_repid iv_name = iv_value_name ).

          RETURN.
        ENDIF.

        IF es_struc IS SUPPLIED.


          IF iv_variant IS SUPPLIED.


            selscreen_get(
              EXPORTING
                iv_repid             = lv_repid
                iv_variant           = iv_variant
                raise_error          = raise_error
              IMPORTING
                et_parameter         = lt_params ).


            so_help->trans( EXPORTING params_2_struct = 'X' i_any = lt_params
                   IMPORTING e_result = es_struc ).

*            lcl_local_help=>trans_params_2_struc(
*              EXPORTING
*                it_params = lt_params
*              IMPORTING
*                es_struc  = es_struc ).

          ELSE.


            lcl_help=>data_2_struct(
              EXPORTING
                iv_repid     = lv_repid
              IMPORTING
                es_structure = es_struc
            ).

          ENDIF.

          RETURN.
        ENDIF.



        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.

        IF raise_error = abap_true OR lcl_help=>sv_is_assert_when_error = abap_true.
          so_help->raise(  lx_root ).
        ENDIF.

    ENDTRY.

  ENDMETHOD.


  METHOD selscreen_set.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " diese Methode füllt einen Selection Screen mit Daten
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA:
      lv_repid TYPE string,
      lv_type  TYPE string,
      lv_kind  TYPE string.

    TRY.

        IF iv_repid IS INITIAL.
          so_help->info( EXPORTING iv_depth = 1 IMPORTING ev_repid = lv_repid ).
        ELSE.
          lv_repid = iv_repid.
        ENDIF.

        so_help->rtti(
          EXPORTING
            i_any        = i_any
          IMPORTING
            ev_type  = lv_type
            ev_kind      = lv_kind ).


        CASE lv_kind.

          WHEN cl_abap_datadescr=>kind_struct.

            lcl_help=>selscreen_struc_2_screen(
                    iv_repid = lv_repid is_struc = i_any ).

            RETURN.

          WHEN cl_abap_datadescr=>kind_table.


            CASE lv_type.

              WHEN 'RSPARAMS_TT'. "t_it_params

                DATA:
                  lv_repid_c TYPE sy-repid,
                  lt_params  TYPE rsparams_tt.

                lt_params = i_any.
                lv_repid_c = lv_repid.

                ##FM_SUBRC_OK
                CALL FUNCTION 'SELTAB_2_SELOPTS'
                  EXPORTING
                    program                     = lv_repid_c
*                   ACCEPT_OTHER_KIND           = 'X'
                  TABLES
                    seltab                      = lt_params
*                   P_SSCR                      =
                  EXCEPTIONS
                    program_cannot_be_generated = 1
                    illegal_object_kind         = 2
                    OTHERS                      = 3.
                so_help->raise_check( function = 'X').
                RETURN.

            ENDCASE.
        ENDCASE.


        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        IF raise_error = abap_true OR lcl_help=>sv_is_assert_when_error = abap_true.
          so_help->raise( i_any  = lx_root ).
        ENDIF.
    ENDTRY.

  ENDMETHOD.




  METHOD class_constructor.
    CREATE OBJECT so_help.
*    CREATE OBJECT so_help_gui.
  ENDMETHOD.



  METHOD rtts_get_fieldname_by_type_tab.

    DATA:
      lo_structdescr TYPE REF TO cl_abap_structdescr,
      lo_descr       TYPE REF TO cl_abap_datadescr,
      lt_comp        TYPE abap_component_tab,
      ls_comp        LIKE LINE OF lt_comp.

    lo_structdescr ?=  cl_abap_datadescr=>describe_by_name(  iv_tabname ).
    lo_descr       ?= cl_abap_datadescr=>describe_by_name(  iv_typename ).
    lt_comp         = lo_structdescr->get_components( ).

    LOOP AT lt_comp INTO ls_comp.

      IF  ls_comp-type = lo_descr.

        r_result = ls_comp-name.

        RETURN.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.



  METHOD rtts_get_domrange.
    DATA: lv_domname  TYPE dd07l-domname,
          lt_dd_descr TYPE STANDARD TABLE OF dd07v.

    lv_domname = iv_value.

    "Mögliche Werte auslesen
    CALL FUNCTION 'DD_DOMVALUES_GET'
      EXPORTING
        domname        = lv_domname   " Domain name
*       text           = SPACE    " Default ' ': without texts, 'X': with, 'T': only text
*       langu          = iv_langu    " Language, default SY-LANGU, '*': all texts
*       bypass_buffer  = SPACE
*  IMPORTING
*       rc             =
      TABLES
        dd07v_tab      = lt_dd_descr
      EXCEPTIONS
        wrong_textflag = 1
        OTHERS         = 2.
    IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
*    raise_w_check_function(  ).
*      mo_help->so_check_a_raise->after_select(  is_sy = sy ).


    "Wenn eine Wertetabelle hinterlegt ist

    "Gucken welche Spalte typgleich ist und dann nur die Spalte ausgeben

    "Ergebnis 1 Zeilige Spalte mit Beschreibung


  ENDMETHOD.


  METHOD gui_popup_get_value.



    DATA:
      lt_value  TYPE STANDARD TABLE OF sval,
      ls_value  TYPE sval,
      lv_return TYPE string,
      lv_title  TYPE sy-title.

    IF iv_title IS SUPPLIED.
      lv_title = iv_title.
    ELSE.
      lv_title = so_help->get( text = 'X' i_any = '271(DB)' ).
*      MESSAGE s271(db) INTO lv_title.
    ENDIF.

****************************************
* Feld1 befüllen

    FREE ls_value.
    ls_value-tabname   = iv_tab1.
    ls_value-fieldname = iv_field1.

    IF ev_value1 IS SUPPLIED.
      ls_value-value = ev_value1.
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
*break-point.
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
    IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
    so_help->raise_check( function = 'X' ).

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
        WHEN 5.
          ev_value5 = ls_value-value.
      ENDCASE.
    ENDLOOP.


  ENDMETHOD.                    "popup_get_values




  METHOD rtts_is_in_domrange.


    DATA:
      lv_domname  TYPE domname,
      lt_dd_descr TYPE STANDARD TABLE OF dd07v.
*      ls_dd07v     LIKE LINE OF st_dd07v_buffer.

    rv_result = abap_true.




    DATA:
      lo_eldescr    TYPE REF TO cl_abap_elemdescr,
      ls_dd04l      TYPE dd04l,
      lo_struct     TYPE REF TO cl_abap_typedescr,
      lx_cast_error TYPE REF TO cx_sy_move_cast_error,
      lv_typename   TYPE string.

    lo_struct = cl_abap_typedescr=>describe_by_data( iv_any ).

    TRY.
        lo_eldescr ?= lo_struct.
        ##no_handler
      CATCH cx_sy_move_cast_error INTO lx_cast_error.

        "D  FDT_RFC 010 Datenobjekt gehört nicht zum Typ 'Element'
*        mo_help->so_cx_factory->raise_msg(
*           EXPORTING
*              iv_msgid     = 'FDT_RFC'
*              iv_msgno     = '010'
*              io_previous  = lx_cast_error
*              ).
    ENDTRY.

*    ev_is_ddic =  lo_eldescr->is_ddic_type(  ).

*    lo_eldescr->get_ddic_field(
*      EXPORTING
*        p_langu      = iv_langu    " Current Language
*      RECEIVING
*        p_flddescr   = es_fielddescr     " Field Description
*     EXCEPTIONS
*       not_found    = 1
*       no_ddic_type = 2
*       OTHERS       = 3 ).
*    mo_help->so_check_a_raise->after_method( is_sy = sy ).


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Typ bestimmen

*    IF iv_name_element IS NOT SUPPLIED.
    lv_typename =  lo_struct->get_relative_name( ).
*    ELSE.
*      ev_typename = iv_name_element.
*    ENDIF.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Domäne bestimmen

    "TODO Tabellenpuffer

    SELECT SINGLE rollname domname
    FROM dd04l
    INTO ls_dd04l
      WHERE rollname = lv_typename
      .

*    ls_dd04l-rollname = ev_typename.




    lv_domname = ls_dd04l-domname.
*
*
*    lv_domname = lv_domname_s.
*
*    IF lv_domname IS INITIAL.
*      RETURN. "Wenn keien Domain da, dann ist alles erlaubt
*    ENDIF.


*    READ TABLE st_dd07v_buffer INTO ls_dd07v
*         WITH KEY domname = lv_domname domvalue_l = iv_any .
*    IF sy-subrc <> 0.
*      CATCH cx_t100_msg.    "
    CALL FUNCTION 'DD_DOMVALUES_GET'
      EXPORTING
        domname        = lv_domname   " Domain name
*       text           = SPACE    " Default ' ': without texts, 'X': with, 'T': only text
*       langu          = iv_langu    " Language, default SY-LANGU, '*': all texts
*       bypass_buffer  = SPACE
*  IMPORTING
*       rc             =
      TABLES
        dd07v_tab      = lt_dd_descr
      EXCEPTIONS
        wrong_textflag = 1
        OTHERS         = 2.
    IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
*    raise_w_check_function(  ).
*      mo_help->so_check_a_raise->after_select(  is_sy = sy ).

*      APPEND LINES OF lt_dd_descr TO st_dd07v_buffer.

    READ TABLE lt_dd_descr  INTO DATA(ls_dd07v)
         WITH KEY domname = lv_domname domvalue_l = iv_any." ddlanguage = iv_langu.
    IF sy-subrc <> 0.
      rv_result = abap_false.
    ENDIF.

*    ENDIF.

*    rv_result = ls_dd07v-ddtext.

  ENDMETHOD.


  METHOD bal_read.

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
    IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
    so_help->raise_check( function = 'X').
*    mo_help->so_check_a_raise->after_function( is_sy = sy ).

    READ TABLE lt_header
     INTO ls_header INDEX 1.
    so_help->raise_check( read_table = 'X').
*    mo_help->so_check_a_raise->after_read_table( is_sy = sy ).



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
      so_help->raise( 'ZCX_BAL_LOG_EMPTY').
*      mo_help->so_error->raise_text(  'Keine BAL Informationen vorhanden.' ).
    ENDIF.


*    sort lt_message by time_stmp ascending.

    rt_balmt = lt_message.

  ENDMETHOD.                    "bal_load


  METHOD t100_get.

    FIELD-SYMBOLS:
      <lt_any> TYPE ANY TABLE,
      <ls_any> TYPE any.

*      <ls_param> LIKE LINE OF et_params.

    DATA: lt_comp TYPE abap_component_tab,
          ls_comp LIKE LINE OF lt_comp,
          lv_text TYPE string.
*          ls_log  TYPE /stc/tbx08_s_log_data.

    FIELD-SYMBOLS: <fs_comp>   TYPE any,
                   <ls_result> LIKE LINE OF r_result.
    DATA:
      lt_bapi_tmp    TYPE bapiret2_tab,
      lv_kind        TYPE string,
      ls_bapi_result TYPE bapiret2,
      lv_string      TYPE string.

    TRY.

        so_help->rtti(
          EXPORTING
            i_any       = i_any
          IMPORTING
*        ev_typename =
            ev_kind     = lv_kind
*        et_domrange =
*        ev_in_domr  =
        ).

        CASE lv_kind.

          WHEN cl_abap_datadescr=>kind_elem.
*           and i_any IS NOT INITIAL.

*           AND lv_kind = cl_abap_datadescr=>kind_elem.
            TRY.
                DATA lv_string2 TYPE string.
                lv_string = i_any.
                lv_string2 = i_any.
                SHIFT lv_string LEFT DELETING LEADING ' '.
                SHIFT lv_string2 LEFT DELETING LEADING ' '.
                IF lv_string(1) CA 'EWSIewsi'.
                  ls_bapi_result-type = lv_string(1).
                  lv_string = lv_string+1.
                ENDIF.
                IF lv_string(3) CO '0123456789'.
                  ls_bapi_result-number = lv_string(3).
                  lv_string = lv_string+4.
                  SPLIT lv_string AT ')' INTO ls_bapi_result-id lv_string.
*              EXIT.
                ELSE.
                  DATA(lv_tmp) = lv_string2(2).
                  TRANSLATE lv_tmp TO UPPER CASE.
                  IF lv_tmp = 'CX'.
                    "DE  >REP    202 Es ist ein Fehler &1 &2 aufgetreten
                    ls_bapi_result-id     = '>REP'.
                    ls_bapi_result-type   = 'E'.
                    ls_bapi_result-number = '202'.
                    ls_bapi_result-message_v1 = 'type'.
                    ls_bapi_result-message_v2 = lv_string2.
                    TRANSLATE ls_bapi_result-message_v1 TO UPPER CASE.
                  ENDIF.
                ENDIF.
                APPEND ls_bapi_result TO r_result.
              CATCH cx_root.
            ENDTRY.




          WHEN 'T'.
            ASSIGN i_any TO <lt_any>.
            LOOP AT <lt_any> ASSIGNING <ls_any>.
              lt_bapi_tmp = t100_get( i_any = <ls_any>  ).
              APPEND LINES OF lt_bapi_tmp TO r_result.
            ENDLOOP.

          WHEN 'S'.

            so_help->rtti(
              EXPORTING
                i_any   = i_any
              IMPORTING
                et_comp = lt_comp  ).

            LOOP AT lt_comp INTO ls_comp WHERE as_include = abap_true.
              DELETE lt_comp.

              DATA lo_incl TYPE REF TO cl_abap_structdescr.
              TRY.
                  lo_incl ?= ls_comp-type.

                  APPEND LINES OF lo_incl->get_components( ) TO lt_comp.

                CATCH cx_root.
              ENDTRY.

            ENDLOOP.


            LOOP AT lt_comp INTO ls_comp.

              ASSIGN COMPONENT ls_comp-name OF STRUCTURE i_any
                TO <fs_comp>.

              IF <fs_comp> IS NOT ASSIGNED OR
                    sy-subrc <> 0.
                CONTINUE.
              ENDIF.

              CASE ls_comp-name.
                WHEN 'SYMSGID' OR 'MSGID' OR 'ARBGB' OR 'SYST_MSGID' OR 'ID' OR 'AG'.
                  "Nachrichtenklasse
                  ls_bapi_result-id = <fs_comp>.

                WHEN 'SYMSGNO' OR 'MSGNO' OR 'MSGNR' OR 'SYST_MSGNO' OR 'NUMBER' OR 'NO'.
                  "Nachrichtennummer
                  ls_bapi_result-number = <fs_comp>.

                WHEN 'BAPI_MTYPE' OR 'MSGTY' OR 'SYST_MSGTY' OR 'TYPE' OR 'SEVERITY' OR 'MSGTYP'.
                  "Nachrichtentyp
                  ls_bapi_result-type = <fs_comp>.

                WHEN 'MESSAGE'.
                  ls_bapi_result-message = <fs_comp>.

                WHEN 'CODE'.
*                data lv_String type string.
                  lv_string = <fs_comp>.
                  SHIFT lv_string RIGHT DELETING TRAILING ' '.
                  DATA lv_pos TYPE i.
                  lv_pos = strlen( lv_string ) - 3.
                  ls_bapi_result-number = <fs_comp>+lv_pos.
                  SHIFT lv_string LEFT DELETING LEADING ' '.
                  lv_pos = strlen( lv_string ) - 3.
                  ls_bapi_result-id = lv_string(lv_pos).

                WHEN OTHERS.
                  IF ls_comp-name CS 'MSGV' OR ls_comp-name CS 'MESSAGE_' OR ls_comp-name CS 'VAR'.
                    "Nachrichtenvariable
                    IF ls_comp-name CS 'V1' OR ls_comp-name = 'VAR1'.
                      ls_bapi_result-message_v1 = <fs_comp>.
                    ELSEIF ls_comp-name CS 'V2' OR ls_comp-name = 'VAR2'.
                      ls_bapi_result-message_v2 = <fs_comp>.
                    ELSEIF ls_comp-name CS 'V3' OR ls_comp-name = 'VAR3'.
                      ls_bapi_result-message_v3 = <fs_comp>.
                    ELSEIF ls_comp-name CS 'V4' OR ls_comp-name = 'VAR4'.
                      ls_bapi_result-message_v4 = <fs_comp>.
                    ENDIF.
                  ENDIF.
              ENDCASE.

            ENDLOOP.

            "Nachricht nur im Klartext gefunden dann Anpassen
            IF ls_bapi_result-message IS NOT INITIAL.
              IF ( ls_bapi_result-id = '00' AND ls_bapi_result-number = '398' ) OR
                 ( ls_bapi_result-id IS INITIAL AND ls_bapi_result-number IS INITIAL ).

                DATA ls_bapi TYPE bapiret2.
                ls_bapi = lcl_help=>t100_get_w_text(
                                EXPORTING iv_text =  ls_bapi_result-message ).

                ls_bapi-type   = ls_bapi_result-type.
                ls_bapi_result = ls_bapi.

              ENDIF.
            ENDIF.


            TRANSLATE ls_bapi_result-type TO UPPER CASE.
            TRANSLATE ls_bapi_result-id   TO UPPER CASE.
            SHIFT  ls_bapi_result-id  LEFT DELETING LEADING ' '.
            TRANSLATE ls_bapi_result-number TO UPPER CASE.

            "bapiretrunfall
            IF ls_bapi_result-id IS INITIAL AND ls_bapi_result-number IS INITIAL
                AND ls_bapi_result-message IS NOT INITIAL.
*                     t100_get_w_text(
*                       EXPORTING
*                         iv_text  = ls_bapi_result-message
*                       RECEIVING
*                         r_result = ls_bapi_result
*                     ).
            ENDIF.

            APPEND ls_bapi_result TO r_result.

          WHEN 'R'.

            DATA:
              li_t100      TYPE REF TO if_t100_message,
              lx_root      TYPE REF TO cx_root,
              lt_bapi_prev TYPE bapiret2_tab,
              lx_no_check  TYPE REF TO lcx_no_check.

            DO.

              IF i_any IS NOT BOUND.
                EXIT.
              ENDIF.

              TRY.

                  lx_no_check ?= i_any.

                  APPEND  lx_no_check->ms_data-s_bapiret TO r_result.
                  APPEND LINES OF  lx_no_check->ms_data-add_t100 TO r_result.

                  "Verhindern endlosschleife wenn previous auf eigene excdption zeigt
                  IF lx_no_check->previous IS BOUND. " AND lines( r_result ) < 20.
                    so_help->info(  IMPORTING et_callstack = DATA(lt_stack) ).
                    IF lines( lt_stack ) < 50.
                      lt_bapi_prev = t100_get( i_any = lx_no_check->previous  ).
                      APPEND LINES OF lt_bapi_prev TO r_result.
                    ENDIF.
                  ENDIF.

                  EXIT.
                CATCH cx_sy_move_cast_error.
              ENDTRY.



              TRY.

                  DATA li_odata_log TYPE REF TO /iwbep/if_message_container.
                  DATA lt_odata_msg TYPE /iwbep/t_message_container.

*                    break-point.
                  li_odata_log ?= i_any.

                  lt_odata_msg =  li_odata_log->get_messages(
*            iv_provide_text = ABAP_FALSE
                     ).

                  so_help->msg(
                    EXPORTING
                      i_any         = lt_odata_msg
                    IMPORTING
                      e_any         = r_result
                  ).

                  EXIT.
                CATCH cx_root.
              ENDTRY.





              TRY.
                  li_t100 ?= i_any.

                  ls_bapi_result-id    = li_t100->t100key-msgid.
                  ls_bapi_result-number = li_t100->t100key-msgno.
                  ls_bapi_result-message_v1 = li_t100->t100key-attr1.
                  ls_bapi_result-message_v2 = li_t100->t100key-attr2.
                  ls_bapi_result-message_v3 = li_t100->t100key-attr3.
                  ls_bapi_result-message_v4 = li_t100->t100key-attr4.

                  TRY.
                      lx_root ?= i_any.
                      ls_bapi_result-type = 'E'.
                      APPEND ls_bapi_result TO r_result.

*                  WHILE lx_root->previous IS bound.
                      lt_bapi_prev = t100_get( i_any = lx_root->previous  ).
                      APPEND LINES OF lt_bapi_prev TO r_result.
**                  ENDWHILE.

                    CATCH cx_sy_move_cast_error.
                      APPEND ls_bapi_result TO r_result.
                  ENDTRY.

                  EXIT.
                CATCH cx_sy_move_cast_error.
              ENDTRY.

              TRY.

                  lx_root ?= i_any.
                  lv_text = lx_root->get_text(  ).
                  so_help->msg(
                    EXPORTING
                      i_any      = lv_text
                    IMPORTING
                      et_bapi    = r_result  ).

                  DATA lx_tmp TYPE REF TO cx_root.
                  lx_tmp = lx_root->previous.
                  WHILE lx_tmp IS NOT INITIAL.
                    lt_bapi_prev = t100_get( i_any = lx_tmp  ).
                    APPEND LINES OF lt_bapi_prev TO r_result.
                    lx_tmp = lx_tmp->previous.
                  ENDWHILE.

                  EXIT.
                CATCH cx_sy_move_cast_error.

              ENDTRY.

              EXIT.
            ENDDO.
        ENDCASE.

        LOOP AT r_result ASSIGNING <ls_result>.
          TRANSLATE <ls_result>-type   TO UPPER CASE.
          TRANSLATE <ls_result>-id     TO UPPER CASE.
          TRANSLATE <ls_result>-number TO UPPER CASE.
          IF <ls_result>-id IS INITIAL. " and <ls_result>-message is NOT INITIAL. "OR <ls_result>-number IS INITIAL.
            DELETE r_result.
          ENDIF.
        ENDLOOP.


*data lx_root type ref to cx_root.
      CATCH cx_root INTO lx_root.
        so_help->raise(  lx_root ).
    ENDTRY.

  ENDMETHOD.


  METHOD data_t100_get.

    DATA lv_msgnr TYPE msgnr.
    lv_msgnr = is_bapi-number.

    READ TABLE so_help->ss_db_buffer-t_t100 INTO es_t100
        WITH TABLE KEY sprsl = iv_langu arbgb = is_bapi-id msgnr = lv_msgnr .
    IF sy-subrc = 0.
      RETURN.
    ENDIF.

    SELECT SINGLE *
        FROM t100
        INTO CORRESPONDING FIELDS OF es_t100
      WHERE sprsl = iv_langu
      AND   arbgb = is_bapi-id
      AND   msgnr = lv_msgnr .
    IF sy-subrc = 0.
      INSERT es_t100 INTO TABLE so_help->ss_db_buffer-t_t100.
      RETURN.
    ENDIF.

    READ TABLE so_help->ss_db_buffer-t_t100 INTO es_t100
       WITH TABLE KEY sprsl = 'E' arbgb = is_bapi-id msgnr = lv_msgnr .
    IF sy-subrc = 0.
      RETURN.
    ENDIF.

    SELECT SINGLE *
    FROM t100
    INTO CORRESPONDING FIELDS OF es_t100
    WHERE sprsl = 'E'
    AND   arbgb = is_bapi-id
    AND   msgnr = lv_msgnr .
    IF sy-subrc = 0.
      INSERT es_t100 INTO TABLE so_help->ss_db_buffer-t_t100.
      RETURN.
    ENDIF.

    IF iv_langu = 'D'.
      RETURN.
    ENDIF.

    READ TABLE so_help->ss_db_buffer-t_t100 INTO es_t100
    WITH TABLE KEY sprsl = 'D' arbgb = is_bapi-id msgnr = lv_msgnr .
    IF sy-subrc = 0.
      RETURN.
    ENDIF.

    SELECT SINGLE *
   FROM t100
   INTO CORRESPONDING FIELDS OF es_t100
      WHERE sprsl = 'D'
      AND   arbgb = is_bapi-id
      AND   msgnr = lv_msgnr .
    IF sy-subrc = 0.
      INSERT es_t100 INTO TABLE so_help->ss_db_buffer-t_t100.
      RETURN.
    ENDIF.

  ENDMETHOD.


  METHOD t100_set.

    FIELD-SYMBOLS:
      <lt_any> TYPE STANDARD TABLE,
      <ls_any> TYPE any.

*      <ls_param> LIKE LINE OF et_params.
*    FREE e_any.

    DATA: lt_comp     TYPE abap_component_tab,
          ls_comp     LIKE LINE OF lt_comp,
          ls_bapi     TYPE bapiret2,
          ls_bapi_tmp TYPE bapiret2.

    READ TABLE it_bapi INTO ls_bapi
      INDEX 1.
*          ls_log  TYPE /stc/tbx08_s_log_data.

    FIELD-SYMBOLS: <fs_comp> TYPE any.
    DATA:
      lv_kind TYPE string,
      lt_bapi TYPE bapiret2_tab.

    so_help->rtti(
      EXPORTING
        i_any       = e_any
      IMPORTING
*        ev_typename =
        ev_kind     = lv_kind
*        et_domrange =
*        ev_in_domr  =
    ).

    CASE lv_kind.

      WHEN cl_abap_datadescr=>kind_elem.

*    IF ev_text IS SUPPLIED.
        e_any = ls_bapi-message.


      WHEN cl_abap_datadescr=>kind_ref.


        DATA(lv_typename) = so_help->get( rtti_type = 'X' i_any = e_any ).

        CASE lv_typename.

            "Sonderbahndlung OData Log
          WHEN '/IWBEP/CL_MGW_MSG_CONTAINER'.
            IF e_any IS INITIAL.
              DATA li_log TYPE REF TO /iwbep/if_message_container.
              DATA lo_ref TYPE REF TO object.
              li_log ?= /iwbep/cl_mgw_msg_container=>get_mgw_msg_container( ).
            ELSE.
              li_log ?= e_any.
            ENDIF.

            li_log->add_messages_from_bapi(
              EXPORTING
                it_bapi_messages          = it_bapi    " Return parameter tabler
            ).

            lo_ref = li_log.
            e_any ?= lo_ref.
            RETURN.

          WHEN OTHERS.
            RETURN.
        ENDCASE.

        TRY.

            DATA lx_no_check TYPE REF TO lcx_no_check.
            lx_no_check ?=  e_any.
            INSERT LINES OF it_bapi INTO TABLE lx_no_check->ms_data-add_t100.

          CATCH cx_root.

        ENDTRY.


      WHEN cl_abap_datadescr=>kind_table.

        LOOP AT it_bapi INTO ls_bapi_tmp.

          FREE lt_bapi.
          APPEND ls_bapi_tmp TO lt_bapi.

          ASSIGN e_any TO <lt_any>.
          APPEND INITIAL LINE TO <lt_any> ASSIGNING <ls_any>.
          t100_set(
            EXPORTING
              it_bapi = lt_bapi
            IMPORTING
              e_any   = <ls_any>
          ).

        ENDLOOP.

      WHEN cl_abap_datadescr=>kind_struct.

        so_help->rtti(
          EXPORTING
            i_any       = e_any
          IMPORTING
            et_comp = lt_comp  ).

        LOOP AT lt_comp INTO ls_comp.
          ASSIGN COMPONENT ls_comp-name OF STRUCTURE e_any
            TO <fs_comp>.

          CHECK <fs_comp> IS ASSIGNED AND
                sy-subrc = 0.

          CASE ls_comp-name.
            WHEN 'SYMSGID' OR 'MSGID' OR 'ARBGB' OR 'SYST_MSGID' OR 'ID' OR 'AG'.
              "Nachrichtenklasse
              <fs_comp> = ls_bapi-id. "ls_bapi_result-id = <fs_comp>.

            WHEN 'SYMSGNO' OR 'MSGNO' OR 'MSGNR' OR 'SYST_MSGNO' OR 'NUMBER' OR 'NO'.
              "Nachrichtennummer
              <fs_comp> = ls_bapi-number.

            WHEN 'BAPI_MTYPE' OR 'MSGTY' OR 'SYST_MSGTY' OR 'TYPE' OR 'SEVERITY' OR 'MSGTYP'.
              "Nachrichtentyp
              <fs_comp> = ls_bapi-type.

            WHEN 'MESSAGE' OR 'TEXT' OR 'MSGTXT'.

              <fs_comp> = ls_bapi-message.

            WHEN 'CODE'.
              <fs_comp> = ls_bapi-id && ls_bapi-number.
*                ls_log-code = 'ME110'.

            WHEN OTHERS.
              IF ls_comp-name CS 'MSGV'
              OR ls_comp-name CS 'MESSAGE_'
              OR ls_comp-name CS 'VAR'
              OR ls_comp-name CS 'ATTR'.
                "Nachrichtenvariable
                IF ls_comp-name CS 'V1'
                OR ls_comp-name = 'VAR1'
                OR ls_comp-name = 'ATTR1' .
                  <fs_comp> = ls_bapi-message_v1.
                ELSEIF ls_comp-name CS 'V2'
                OR ls_comp-name = 'VAR2'
                OR ls_comp-name = 'ATTR2' .
                  <fs_comp> = ls_bapi-message_v2.
*                  ls_bapi_result-message_v2 = <fs_comp>.
                ELSEIF ls_comp-name CS 'V3'
                OR ls_comp-name = 'VAR3'
                OR ls_comp-name = 'ATTR3' .
                  <fs_comp> = ls_bapi-message_v3. "ls_bapi_result-message_v3 = .
*                  ls_bapi_result-message_v3 = <fs_comp>.
                ELSEIF ls_comp-name CS 'V4'
                OR ls_comp-name = 'VAR4'
                OR ls_comp-name = 'ATTR4'.
                  <fs_comp> = ls_bapi-message_v4.
                ENDIF.
              ENDIF.
          ENDCASE.
        ENDLOOP.

    ENDCASE.


  ENDMETHOD.




  METHOD rtts_get_comp_tab.


    DATA:
      wa_component   TYPE abap_componentdescr,
      lv_name2       TYPE string,
      lo_descr       TYPE REF TO cl_abap_typedescr,
      lo_structdescr TYPE REF TO cl_abap_structdescr,
      ls_comp        LIKE LINE OF lo_structdescr->components,
      ls_data        TYPE REF TO data,
      lv_kind        TYPE string.

    FIELD-SYMBOLS:
      <ls_line>  TYPE any,
      <lv_feld>  TYPE any,
      <ft_input> TYPE STANDARD TABLE,
      <any>      TYPE any.


    """""""""""""""""""""
    " Struktur mit Typ wie Input erzeugen

    so_help->rtti( EXPORTING i_any =  i_any
                 IMPORTING ev_kind = lv_kind ).

    CASE lv_kind.

      WHEN 'T'.
        ASSIGN  i_any TO <ft_input>.
        CREATE DATA ls_data LIKE LINE OF <ft_input>.

      WHEN 'S'.
        CREATE DATA ls_data LIKE i_any.

      WHEN 'R'.
        ASSIGN  i_any->* TO <any>.
        so_help->rtti( EXPORTING i_any =  i_any
             IMPORTING ev_kind = lv_kind ).
        CASE lv_kind.
          WHEN 'T'.
            ASSIGN  i_any TO <ft_input>.
            CREATE DATA ls_data LIKE LINE OF <ft_input>.

          WHEN 'S'.
            CREATE DATA ls_data LIKE i_any.

          WHEN OTHERS.
            RETURN.
        ENDCASE.

    ENDCASE.


    """""""""""""""""""""
    " Components erzeugen
    ASSIGN ls_data->* TO <ls_line>.
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

  ENDMETHOD.

*
*  METHOD gui_popup_table.
*
*
*
*    DATA:
*      lx_salv TYPE REF TO cx_salv_msg,
*      lo_alv  TYPE REF TO cl_salv_table.
*
*    FIELD-SYMBOLS:
*      <ls_row>   TYPE any,
*      <lv_field> TYPE any.
*
*    TRY.
*
*        READ TABLE it_table ASSIGNING <ls_row>
*            INDEX 1.
**        mo_help->so_check_a_raise->is_not_initial( <ls_row> ).
*
*        ASSIGN COMPONENT 2 OF STRUCTURE <ls_row> TO <lv_field>.
*        IF <lv_field> IS NOT ASSIGNED.
**          mo_help->so_check_a_raise->is_not_initial( <lv_field> ).
*        ENDIF.
*
*
*        cl_salv_table=>factory(
*          EXPORTING
*            list_display   = if_salv_c_bool_sap=>false  "TRUE fuer Listenausgabe
*          IMPORTING
*            r_salv_table   =  lo_alv     "Objekt ALV
*          CHANGING
*            t_table        = it_table ). "Tabelle fuer Anzeige
*
*
*        DATA:
*          lo_cols  TYPE REF TO cl_salv_columns_table,
*          lo_set   TYPE REF TO cl_salv_display_settings,
*          lv_title TYPE lvc_title.
*
*        lo_set = lo_alv->get_display_settings( ).
*        lv_title = so_help->t100_get_text( iv_id = 'DB6' iv_no = 205 ).
*        lo_set->set_list_header( lv_title ).
*
*        lo_cols = lo_alv->get_columns( ).
*        lo_cols->set_optimize( abap_true ).
**
*        lo_alv->set_screen_popup(
*     EXPORTING
*       start_column = '10'
*       end_column   = '160'
*       start_line   =  '10'
*       end_line     = '25' ).
*
*
**        lo_event = lo_alv->get_event(  ).
**        SET HANDLER on_double_click FOR lo_event.
*
**        FREE ms_event.
*        lo_alv->display( ).
**        rs_event = ms_event.
*
*      CATCH cx_salv_msg INTO lx_salv.
*        "D  NF1 060 Popup wurde abgebrochen
**        mo_help->so_error->raise_msg( iv_id = 'NF1' iv_no = '060' io_previous = lx_salv ) .
*    ENDTRY.
*
*  ENDMETHOD.
*
*
*  METHOD gui_popup_error.
*
*    "Temporär
*    so_help->gui( t100 = 'X' i_any = i_ix_error ).
*
*
*  ENDMETHOD.


*  METHOD gui_popup_texttab.
*
*  ENDMETHOD.

  METHOD gui_popup_alf_f4_vari.

*
**    TRY.
**
*    DATA: ls_variant TYPE disvariant.
*
** ---------------------------------------------------------------------
** Input aufbereiten
*
*    IF iv_repid IS SUPPLIED.
*      ls_variant-report   = iv_repid.
*    ELSE.
*      ls_variant-report   = cl_abap_syst=>get_current_program( ).
*    ENDIF.
*
**    IF iv_uname IS SUPPLIED.
*    ls_variant-username = iv_uname.
**    ELSE.
***      ls_variant-username = cl_abap_syst=>get_user_name( ).
**    ENDIF.
*
*    ls_variant-handle = iv_handle.
*
*
*    """""""""""""""""""""""""""""""""""
*    " Check
*
*    IF ls_variant-report IS INITIAL.
*      lcl_help_factory_all=>so_error->raise_text(
*          'Kein Reportnamen übergeben' ).
*    ENDIF.
*
*
** ---------------------------------------------------------------------
** F4-Hilfe aufrufen
*
*    CALL FUNCTION 'LT_F4_FOR_VARIANTS'
*      EXPORTING
*        i_tool          = 'LT'
*        i_sap           = 'X'
*        is_variant      = ls_variant
*        i_customer      = 'X'
*        i_user_specific = 'X'
*        i_no_aedat      = 'X'
*        i_no_aetime     = 'X'
*        i_no_aename     = 'X'
*        i_no_default    = 'X'
*      IMPORTING
*        es_variant      = ls_variant
*      EXCEPTIONS
*        not_found       = 1
*        OTHERS          = 2.
*    lcl_help_factory_all=>so_check_a_raise->after_function( is_sy = sy ).
*
** ---------------------------------------------------------------------
** Usereingabe übernehmen
*
*    IF ls_variant-variant NE ' '.
*      rv_vari = ls_variant-variant.
*    ELSE.
*      rv_vari = iv_vari.
*    ENDIF.
*
*
*    """"""""""""""""""""""""""""""""
*    " Fehlerbehandlung
*
**        DATA: lx_ro<ot TYPE REF TO cx_root.
**      CATCH cx_root INTO lx_root.
**        lcl_help_factory_all=>so_gui->popup_exception(  lx_root ).
**    ENDTRY.


  ENDMETHOD.


  METHOD popup_choose.

    DATA:
      lv_strlen_max TYPE i,
      lv_line_max   TYPE i,
      lv_col_end    TYPE string.
    DATA lv_title TYPE sy-title.
    CONSTANTS lc_col_end_min TYPE i VALUE 15.
    CONSTANTS lc_col_end_max TYPE i VALUE 20.

    TYPES:
      BEGIN OF ty_s_output,
        icon  TYPE c LENGTH 1,
        value TYPE string,
      END OF ty_s_output.

    DATA lt_output2 TYPE STANDARD TABLE OF ty_s_output.

    DATA lt_choices TYPE stringtab.

    so_help->trans(
      EXPORTING
        tab_2_tab          = 'X'
        i_any              = it_choices
      IMPORTING
        e_result           = lt_choices
    ).

    LOOP AT lt_choices INTO DATA(lv_choice).
      APPEND INITIAL LINE TO lt_output2 ASSIGNING FIELD-SYMBOL(<ls_out>).
      <ls_out>-value = lv_choice.

      IF strlen(  lv_choice ) > lv_strlen_max.
        lv_strlen_max = strlen(  lv_choice ).
      ENDIF.
    ENDLOOP.

    lv_col_end = lv_strlen_max + 8.
    IF lv_col_end < lc_col_end_min.
      lv_col_end = lc_col_end_max.
    ENDIF.

    IF  lv_col_end < 40.
      lv_col_end = 40.
    ENDIF.


    lv_line_max = lines(  lt_choices ).


    IF lv_line_max < 3.
      lv_line_max = 2.
    ELSEIF lv_line_max < 6.
      lv_line_max = 4.
    ELSEIF lv_line_max < 8.
      lv_line_max = 6.
    ELSE.
      lv_line_max = lv_line_max * 5 / 2 - 10.
    ENDIF.

    IF iv_title IS NOT INITIAL AND cl_abap_datadescr=>kind_elem = so_help->get(  rtti_kind = 'X' i_any = iv_title ).
      lv_title = iv_title.
    ELSE.
      " BEN_SELCA DE  A   ArbgLeistung Auswahlknopf Plankategorie Auswahl Auswahl Auswahl
      lv_title = so_help->get( dd04t = 'X' i_any = 'BEN_SELCA' ). "'Auswahl:'.
    ENDIF.

    so_help->popup(
      EXPORTING
        it_table              = lt_output2
        iv_title              = lv_title
*          iv_vertical_lines     = abap_true
          iv_headers_visible    = abap_false
*          iv_raise_double_click = abap_true
        it_raise_hotspot = VALUE #(  ( `VALUE` ) )
        it_hide = VALUE #(  (  `ICON`) )
*        it_col_setting        = lt_col_settings
*          it_sort               =
          iv_optimize_colwidth  = abap_true
          iv_col_start          = '10'
          iv_col_end            =  lv_col_end
          iv_line_start         = '1'
          iv_line_end           = lv_line_max
          iv_sel = i_sel
      IMPORTING
        ev_event_type = DATA(lv_type)
        ev_event_row = DATA(lv_row)
        et_selection = DATA(lt_select)
*        es_event              = ls_event
    ).

*    break-point.
    IF lv_type = so_help->cs-s_alv_event_type-popup_cancel.
      r_result = so_help->cs-s_popup_answer-exit.
    ELSE.
*      r_result = lv_row.


      IF lv_row IS INITIAL.
        READ TABLE lt_select INTO DATA(lv_select)
            INDEX 1.
        IF sy-subrc = 0.
          r_result = lv_select.
        ELSE.
          r_result = '1'.
        ENDIF.
      ELSE.
        r_result = lv_row.
      ENDIF.

    ENDIF.

    r_result = so_help->get( trim = 'X' i_any = r_result ).
    TRY.
        sy-index = r_result.
        sy-tabix = r_result.
      CATCH cx_root.
        sy-index = 99.
        sy-tabix = 99.
    ENDTRY.
  ENDMETHOD.


  METHOD popup_f4_help.

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
    ELSE.
      so_help->raise( 'ZCX_VALUE_RQUEST_ERROR' ).
    ENDIF.

  ENDMETHOD.                    "display_f4_help



  METHOD popup_exception.

    TYPES:
      BEGIN OF  ty_s_output,
        icon TYPE c LENGTH 5,
        text TYPE string,
      END OF ty_s_output.

    DATA:
      lt_out       TYPE STANDARD TABLE OF ty_s_output,
      lx_root      TYPE REF TO cx_root,
      lv_counter   TYPE i,
      lv_val_print TYPE string.

    DATA: lt_choice_popup TYPE stringtab,
          lt_bapi         TYPE bapiret2_tab,
          lt_source       TYPE stringtab,
          lt_log          TYPE bapiret2_tab,
          ls_log          LIKE LINE OF lt_log,
          lv_text         TYPE string.

    FIELD-SYMBOLS: <ls_out> LIKE LINE OF lt_out.
    DATA lv_counter2 TYPE i.
    DATA ls_bapi TYPE bapiret2.

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Log aufbereiten

    "Leerzeile
    APPEND INITIAL LINE TO lt_out ASSIGNING <ls_out>.

    lx_root = ix_root.
    WHILE lx_root IS BOUND AND lv_counter2 < 10.

      FREE lt_log.
      FREE lv_val_print.
      FREE ls_bapi.
      APPEND INITIAL LINE TO lt_out ASSIGNING <ls_out>.

      "Infos aus Exception lesen
      so_help->cx_info(
            EXPORTING
                ix_root      = lx_root
            IMPORTING
                  et_add_t100  = lt_log
                  es_bapiret   = ls_bapi
                  ev_val_print = lv_val_print
                    ).

      "Exceptiontext
      <ls_out>-text  = lx_root->get_text(  ).
      IF <ls_out>-text IS INITIAL AND lt_log IS INITIAL.
        "DE    N8  800 Ein unerwarteter Fehler ist aufgetreten.
        <ls_out>-text = so_help->get( text = 'X' i_any = '800(N8)' ).
      ENDIF.
      DO lv_counter TIMES.
        CONCATENATE  '  ' <ls_out>-text INTO <ls_out>-text RESPECTING BLANKS.
      ENDDO.
      CONCATENATE '| ' <ls_out>-text INTO <ls_out>-text RESPECTING BLANKS.

      "Zusätzliche Logs
      LOOP AT lt_log INTO ls_log.

        APPEND INITIAL LINE TO lt_out ASSIGNING <ls_out>.
        <ls_out>-text = so_help->get( text = 'X' i_any = ls_log ).
        DO lv_counter TIMES.
          CONCATENATE  '  ' <ls_out>-text INTO <ls_out>-text RESPECTING BLANKS.
        ENDDO.
        CONCATENATE '| ' <ls_out>-text INTO <ls_out>-text RESPECTING BLANKS.

      ENDLOOP.

      "Zusätzliche Values
      IF lv_val_print IS NOT INITIAL.
        APPEND INITIAL LINE TO lt_out ASSIGNING <ls_out>.
        <ls_out>-text = lv_val_print.
        DO lv_counter TIMES.
          CONCATENATE  '  ' <ls_out>-text INTO <ls_out>-text RESPECTING BLANKS.
        ENDDO.
        CONCATENATE '| ' <ls_out>-text INTO <ls_out>-text RESPECTING BLANKS.
      ENDIF.


      ADD 2 TO lv_counter.
      lx_root = lx_root->previous.
      ADD 1 TO lv_counter2.
    ENDWHILE.

    READ TABLE lt_out ASSIGNING <ls_out>
        INDEX 2.
    IF sy-subrc = 0.
      <ls_out>-icon = '@5C@'.
    ENDIF.

    APPEND INITIAL LINE TO lt_out ASSIGNING <ls_out>.
    APPEND INITIAL LINE TO lt_out ASSIGNING <ls_out>.
    APPEND INITIAL LINE TO lt_out ASSIGNING <ls_out>.

    so_help->cx_info(
      EXPORTING
          ix_root      = ix_root
      IMPORTING
          ev_guid = DATA(lv_guid)
              ).

    "*für weitere Optionen, Doppelklick hier'.
    <ls_out>-text = so_help->get( text = 'X' i_any = '003(O0)' ).
    CONCATENATE '*' <ls_out>-text '    /   ID: ' lv_guid  INTO <ls_out>-text RESPECTING BLANKS .



    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " ALV Ausgabe

    DATA lv_line_end TYPE i.

    IF lines(  lt_out ) > 11.
      lv_line_end = 15.
    ELSE.
      lv_line_end = 10.
    ENDIF.


    DO.
*    break-point.
      so_help->popup(
        EXPORTING
          it_table              = lt_out
          iv_title              = so_help->get( dd04t = 'X' i_any = 'MESSAGE_D' )
*          iv_vertical_lines     = abap_true
        iv_headers_visible    = abap_false
        it_icon = VALUE #( ( `ICON` ) )
        it_outlen = VALUE #(  ( name = 'ICON' value = '1' ) ( name = 'TEXT' value = '110' ) )
*        iv_raise_double_click = abap_true
*        iv_raise_hotspot      = abap_true
*        it_col_setting        = lt_col
*        it_sort               =
*        iv_optimize_colwidth  = abap_false
        iv_col_start          = '10'
        iv_col_end            = '140'
        iv_line_start         = '1'
        iv_line_end           = lv_line_end
*        iv_sel                 = 2
*        iv_sel_col            = 'ICON'
        IMPORTING
            ev_event_type = DATA(lv_type)
*          es_event              = ls_event
      ).


      CASE lv_type.

        WHEN so_help->cs-s_alv_event_type-popup_cancel OR so_help->cs-s_alv_event_type-popup_close.
          RETURN.

        WHEN so_help->cs-s_alv_event_type-double_click.

          so_help->cx_info(
            EXPORTING
              ix_root      = ix_root
*              raise_error  = ABAP_FALSE
            IMPORTING
*              ev_name      =
              et_add_t100  = DATA(lt_log2)
              e_add_serial  = DATA(lv_serial)
*              ev_guid      =
              et_source    = DATA(lt_source2)
              et_callstack = DATA(lt_callstack)
*              ev_val_print =
*              es_bapiret   =
          ).

          FREE lt_choice_popup.
          APPEND 'T100_INFO'    TO lt_choice_popup.

          IF lt_log2 IS NOT INITIAL.
            APPEND 'ADD_LOG' TO lt_choice_popup.
          ENDIF.

          IF lv_serial IS NOT INITIAL.
            APPEND 'ADD_DATA'     TO lt_choice_popup.
          ENDIF.

          IF lt_callstack IS NOT INITIAL.
            APPEND 'CALLSTACK'    TO lt_choice_popup.
            APPEND 'GO_TO_EDITOR'       TO lt_choice_popup.
          ENDIF.

          IF lt_source2 IS NOT INITIAL.
            APPEND 'SOURCE_CODE'  TO lt_choice_popup.
          ENDIF.

          DO.
            DATA lv_tabix TYPE i.
            so_help->get( popup_choose = 'X' i_any = lt_choice_popup i_any2 = lv_tabix ).
*            break-point.
            lv_tabix = sy-tabix.
            READ TABLE lt_choice_popup INTO DATA(lv_choice)
                INDEX sy-tabix.
            IF sy-subrc <> 0.
              EXIT.
            ENDIF.
*            l

            CASE lv_choice.

              WHEN 'ADD_LOG'.
                so_help->gui( popup_t100 = 'X' i_any = lt_log2 ). "TO lt_choice_popup.

              WHEN 'T100_INFO'.
                FREE lt_bapi.
*                lx_root = ix_root.
*                WHILE lx_root IS BOUND.
                so_help->msg( EXPORTING i_any = ix_root IMPORTING e_any_add = lt_bapi ).
*                  lx_root = lx_root->previous.
*                ENDWHILE.
                so_help->gui( popup_t100 = 'X' i_any = lt_bapi ).

              WHEN 'CALLSTACK'.
                so_help->gui( lt_callstack ).

              WHEN 'SOURCE_CODE'.
                so_help->gui( lt_source2 ).

              WHEN 'GO_TO_EDITOR'.

                READ TABLE lt_callstack INTO DATA(ls_stack)
                    INDEX 1.

                IF sy-subrc = 0.

                  PERFORM call_editor IN PROGRAM sapms380 USING ls_stack-mainprogram "lv_progname
                                   ls_stack-include "lv_incl_name
                                   ls_stack-line. "lv_line.

                ENDIF.


              WHEN 'ADD_DATA'.

                so_help->gui( popup_json_deep = 'X' i_any = lv_serial ).


            ENDCASE.
          ENDDO.
        WHEN OTHERS.
          EXIT.
      ENDCASE.
    ENDDO.


  ENDMETHOD.


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
    so_help->raise_check( is_sy = sy ).


*    me->

  ENDMETHOD.                    "call_transaction



  METHOD popup_sel_option.

    DATA: struc_tab_and_field TYPE rstabfield.

    FREE ev_cancel.

    struc_tab_and_field-fieldname = iv_field. "'WERKS'.
    struc_tab_and_field-tablename = iv_tab. ". "'KOMG'.


    CALL FUNCTION 'COMPLEX_SELECTIONS_DIALOG'
      EXPORTING
        tab_and_field     = struc_tab_and_field
      TABLES
        range             = et_range
      EXCEPTIONS
        no_range_tab      = 1
        cancelled         = 2
        internal_error    = 3
        invalid_fieldname = 4
        OTHERS            = 5.
    IF sy-subrc = 2.
      ev_cancel = abap_true.
      RETURN.
    ENDIF.
    so_help->raise_check( function = 'X' ).


  ENDMETHOD.

  METHOD popup_json_deep.


    DATA lv_choice TYPE string.
    DATA lr_data TYPE REF TO data.
    DATA lr_obj TYPE REF TO object.
    DATA lv_kind1 TYPE string.
    DATA lv_kind2 TYPE string.
    DATA lv_type1 TYPE string.
    DATA lv_type2 TYPE string.
    FIELD-SYMBOLS: <any> TYPE any.

    so_help->json(
      EXPORTING
        json_2      = 'X'
        i_any       = iv_serial
      IMPORTING
*               e_ref1      =
        e_type1     = lv_type1
        e_kind1     = lv_kind1
        e_type2     = lv_type2
        e_kind2     = lv_kind2
    ).

    DATA lt_choice_data TYPE stringtab.
    FREE lt_choice_data.
    IF lv_type1 IS NOT INITIAL.
      APPEND lv_type1 TO lt_choice_data.
    ENDIF.
    IF lv_type2 IS NOT INITIAL.
      APPEND lv_type2 TO lt_choice_data.
    ENDIF.
    DO.
      so_help->get( popup_choose = 'X' i_any = lt_choice_data ).
      READ TABLE lt_choice_data INTO lv_choice
          INDEX sy-tabix.
      IF sy-subrc <> 0.
        EXIT.
      ENDIF.

      CASE lv_choice.

        WHEN lv_type1.

          CASE lv_kind1.

            WHEN cl_abap_datadescr=>kind_ref.
              so_help->json(
              EXPORTING
                json_2      = 'X'
                       i_any       = iv_serial
              IMPORTING
                e_ref1      = lr_obj
                 ).

            WHEN OTHERS.
              so_help->json(
              EXPORTING
                json_2      = 'X'
                       i_any       = iv_serial
              IMPORTING
                e_ref1      = lr_data
                 ).

              ASSIGN lr_data->* TO <any>.

              so_help->gui(
                  popup_json        = 'X'
                  i_any             = <any>
              ).

          ENDCASE.

        WHEN lv_type2.

          CASE lv_kind2.

            WHEN cl_abap_datadescr=>kind_ref.
              so_help->json(
              EXPORTING
                json_2      = 'X'
                       i_any       = iv_serial
              IMPORTING
                e_ref2      = lr_obj
                 ).

            WHEN OTHERS.
              so_help->json(
              EXPORTING
                json_2      = 'X'
                i_any       = iv_serial
              IMPORTING
                e_ref2      = lr_data
                 ).

              ASSIGN lr_data->* TO <any>.

              so_help->gui(
                  popup_json        = 'X'
                  i_any             = <any>
              ).

          ENDCASE.

        WHEN OTHERS.
          EXIT.
      ENDCASE.
    ENDDO.



  ENDMETHOD.

  METHOD popup_clike_one_line.

    TYPES:
      BEGIN OF ty_s_output,
        dummy TYPE c LENGTH 1,
        value TYPE string,
      END OF ty_s_output.

    DATA lt_output TYPE STANDARD TABLE OF ty_s_output.
    DATA: ls_text LIKE LINE OF it_text.
    FIELD-SYMBOLS: <ls_out> LIKE LINE OF lt_output.

    LOOP AT it_text INTO ls_text.
      APPEND INITIAL LINE TO lt_output ASSIGNING <ls_out>.
      <ls_out>-value = ls_text.
    ENDLOOP.


    so_help->popup(
      EXPORTING
        it_table              = lt_output
            iv_title              = so_help->get( dd04t = 'X' i_any = 'CIFDISP' )
*            iv_vertical_lines     = abap_true
            iv_headers_visible    = abap_false
*            iv_raise_double_click = abap_true
*            iv_raise_hotspot      = abap_true
*             it_col_setting        = VALUE #(  (  name = 'DUMMY' is_tech = abap_true ) )
            it_hide = VALUE #(  (  `DUMMY` ) )
*            it_sort               =
*            iv_optimize_colwidth  = abap_false
*            iv_col_start          = '10'
*            iv_col_end            = '160'
*            iv_line_start         = '10'
*            iv_line_end           = '30'
*          IMPORTING
*            es_event              =
    ).



  ENDMETHOD.


  METHOD popup_print.

    TYPES:
      BEGIN OF ty_s_output,
        dummy TYPE c LENGTH 1,
        value TYPE string,
      END OF ty_s_output.

    DATA lt_output TYPE STANDARD TABLE OF ty_s_output.
    DATA: ls_text LIKE LINE OF it_text.
    FIELD-SYMBOLS: <ls_out> LIKE LINE OF lt_output.

    LOOP AT it_text INTO ls_text.

      APPEND INITIAL LINE TO lt_output ASSIGNING <ls_out>.
      <ls_out>-value = ls_text.
    ENDLOOP.


    so_help->popup(
      EXPORTING
        it_table              = lt_output
            iv_title              = so_help->get( dd04t = 'X' i_any = 'CIFDISP' )
*            iv_vertical_lines     = abap_true
            iv_headers_visible    = abap_false
*            iv_raise_double_click = abap_true
*            iv_raise_hotspot      = abap_true
*             it_col_setting        = VALUE #(  (  name = 'DUMMY' is_tech = abap_true ) )
            it_hide = VALUE #(  (  `DUMMY` ) )
*            it_sort               =
*            iv_optimize_colwidth  = abap_false
*            iv_col_start          = '10'
*            iv_col_end            = '160'
*            iv_line_start         = '10'
*            iv_line_end           = '30'
*          IMPORTING
*            es_event              =
    ).



  ENDMETHOD.

  METHOD popup_t100.

    DATA:
      ls_bapi TYPE bapiret2,
      lt_bapi TYPE bapiret2_tab.

    TYPE-POOLS: icon.

    TYPES:
      BEGIN OF ty_s_output,
        type TYPE string,
        text TYPE string,
        id   TYPE string,
        no   TYPE string,
      END OF ty_s_output.

    FIELD-SYMBOLS:
        <ls_output> TYPE ty_s_output.


    """""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ausgabetabelle bauen

    TRY.

        DATA:
         lt_output TYPE STANDARD TABLE OF ty_s_output.
        FREE lt_output.
        APPEND INITIAL LINE TO lt_output.

        LOOP AT it_bapi INTO ls_bapi.

          "ZU VIELE nACHRICHTEN RAUS
          IF ls_bapi-number = '279' AND ls_bapi-id = '>3'.
            CONTINUE.
          ENDIF.

          IF ls_bapi-message = 'Cause: sy is not valid  /  sy-subrc <> 0'.
            CONTINUE.
          ENDIF.
          IF ls_bapi-message = 'Cause: a message with type error is found / msgty = E'.
            CONTINUE.
          ENDIF.
          IF ls_bapi-message = 'Cause: an error flag is set  /  lv_error_flag = X'.
            CONTINUE.
          ENDIF.


          APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
          <ls_output>-text = ls_bapi-message.

          IF  <ls_output>-text IS INITIAL.
            <ls_output>-text = ls_bapi-message.
          ENDIF.
          CASE ls_bapi-type.
            WHEN 'E'.
              <ls_output>-type = icon_led_red.
            WHEN 'S'.
              <ls_output>-type = icon_led_green.
            WHEN 'I'.
              <ls_output>-type = icon_message_information.
            WHEN 'W'.
              <ls_output>-type = icon_led_yellow.
          ENDCASE.

          <ls_output>-id = ls_bapi-id.
          <ls_output>-no = ls_bapi-number.

        ENDLOOP.

        APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
        APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
        APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
        "O0 003 Bitte wählen Sie eine Zeile mit dem Doppelklick (F2)
        <ls_output>-text = so_help->get( text = 'X' i_any = '003(O0)' ).
        CONCATENATE '*' <ls_output>-text  INTO <ls_output>-text .


        """""""""""""""""""""""""""""""""""""""""""""""""""""
        " ALV bauen

*        DATA:
*          ls_event       TYPE so_help->ty_s_alv_event.
*          lt_col_setting TYPE STANDARD TABLE OF so_help->ty_s_alv_column_setting, "lo_alv->ty_s_setup,
*          ls_col         TYPE so_help->ty_s_alv_column_setting.

*        FREE ls_col.
*        ls_col-name = 'TEXT'.
*        ls_col-out_length = '120'.
*        APPEND ls_col TO lt_col_setting.
*
*        FREE ls_col.
*        ls_col-name = 'TYPE'.
*        ls_col-is_icon = abap_true.
*        ls_col-out_length = '2'.
*        APPEND ls_col TO lt_col_setting.
*
*        FREE ls_col.
*        ls_col-name = 'ID'.
*        ls_col-out_length = '5'.
*        ls_col-is_tech = abap_true.
*        APPEND ls_col TO lt_col_setting.
*
*        FREE ls_col.
*        ls_col-name = 'NO'.
*        ls_col-out_length = '3'.
*        ls_col-is_tech = abap_true.
*        APPEND ls_col TO lt_col_setting.


        """"""""""""""""""""""""""""""""""""""""
        " Anzeige


        DATA lv_line_end TYPE i.

        IF lines(  lt_output ) > 11.
          lv_line_end = 25.
        ELSE.
          lv_line_end = 20.
        ENDIF.


        DO.

          so_help->popup(
            EXPORTING
              it_table              = lt_output
              iv_title              = so_help->get( text = 'X' i_any = '205(DB6)' ) "iv_id = 'DB6' iv_no = 205 )
              iv_vertical_lines     = abap_false
              iv_headers_visible    = abap_false
*            iv_raise_double_click = abap_true
*            iv_raise_hotspot      = abap_true
            it_hide = VALUE #(  (  `NO` ) (  `ID` )  )
            it_outlen = VALUE #(  (  name = 'TYPE' value = '3' )  (  name = 'TEXT' value = '120' ) )
*              it_col_setting        = lt_col_setting
*            it_sort               =
*            iv_optimize_colwidth  = abap_false
*            iv_col_start          = '10'
*            iv_col_end            = '160'
*            iv_line_start         = '10'
            iv_line_end           = lv_line_end
            IMPORTING
              ev_event_type = DATA(lv_type) "s_event              = ls_event
                ev_event_row = DATA(lv_row)
          ).

*          lo_alv->ms_salv-o_salv->display( ).

          IF lv_type = so_help->cs-s_alv_event_type-double_click. "is_double_click = abap_true.
*            READ TABLE it_bapi INTO ls_bapi
*                INDEX lv_row - 1.
*            IF sy-subrc = 0.
*              FREE lt_bapi.
*              APPEND ls_bapi TO lt_bapi.
            popup_table( it_bapi ).
*            ENDIF.
          ELSE.
            EXIT.
          ENDIF.

        ENDDO.


        """""""""""""""""""""""""""""""
        " Fehlerbehandlung
        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        "D  NF1 060 Popup wurde abgebrochen
*        mo_help->so_error->raise_msg( iv_id = 'NF1' iv_no = '060' io_previous = lx_salv ) .
    ENDTRY.


  ENDMETHOD.

  METHOD popup_t100_ext.

    TYPES:
      BEGIN OF ty_s_output,
        type TYPE string,
        no   TYPE bapiret2-number,
        id   TYPE bapiret2-id,
        text TYPE bapiret2-message,
      END OF ty_s_output.

    DATA ls_bapi TYPE bapiret2.
    DATA lt_bapi TYPE bapiret2_tab.
    DATA lt_out TYPE STANDARD TABLE OF ty_s_output.

    TYPE-POOLS: icon.
    FIELD-SYMBOLS <ls_out> TYPE ty_s_output.


    """""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ausgabetabelle bauen

    LOOP AT it_bapi INTO ls_bapi.
      APPEND INITIAL LINE TO lt_out ASSIGNING <ls_out>.
      <ls_out>-text = ls_bapi-message.

      CASE ls_bapi-type.
        WHEN 'E'.
          <ls_out>-type = icon_led_red.
        WHEN 'S'.
          <ls_out>-type = icon_led_green.
        WHEN 'I'.
          <ls_out>-type = icon_message_information.
        WHEN 'W'.
          <ls_out>-type = icon_led_yellow.
      ENDCASE.

      <ls_out>-id = ls_bapi-id.
      <ls_out>-no = ls_bapi-number.

    ENDLOOP.


    """""""""""""""""""""""""""""""""""""""""""""""""""""
    " ALV bauen



    """"""""""""""""""""""""""""""""""""""""
    " Anzeige


    DATA lv_line_end TYPE i.

    IF lines(  lt_out ) > 11.
      lv_line_end = 25.
    ELSEIF lines(  lt_out ) > 20.
      lv_line_end = 45.
    ELSE.
      lv_line_end = 20.
    ENDIF.

    so_help->popup(
      EXPORTING
        it_table              = lt_out
        iv_title              = so_help->get( text = 'X' i_any = '011(N2ALL)' ) "Protokoll
        iv_vertical_lines     = abap_false
*              iv_headers_visible    = abap_false
*            iv_raise_double_click = abap_true
*            iv_raise_hotspot      = abap_true
*            it_hide = VALUE #(  (  `NO` ) (  `ID` )  )
      it_outlen = VALUE #(  (  name = 'TYPE' value = '1' )  (  name = 'TEXT' value = '120' )  )
*              it_col_setting        = lt_col_setting
*            it_sort               =
*            iv_optimize_colwidth  = abap_false
*            iv_col_start          = '10'
*            iv_col_end            = '160'
*            iv_line_start         = '10'
            iv_line_start         = '1'
            iv_line_end           = lv_line_end
      iv_default_toolbar = abap_true
      is_layout = VALUE disvariant( handle = 'T100_EXT' report = sy-repid )
      iv_layout_restriction = if_salv_c_layout=>restrict_user_dependant
      IMPORTING
        ev_event_type = DATA(lv_type) "s_event              = ls_event
          ev_event_row = DATA(lv_row)
    ).

  ENDMETHOD.

  METHOD popup_table.

    "prüfung ob es einzeilige tablle ist
    so_help->rtti(
      EXPORTING
        i_any                = it_table
      IMPORTING
*        ev_line_type_kind    = DATA(lv_line_type_kind)
        ev_line_type_kind_is_c = DATA(lv_is_c) ).
*        et_comp              = DATA(lt_comp) ).

    IF lv_is_c = abap_true.
      popup_clike_one_line(  it_table ).
    ELSE.

      "CIFDISP  DE  A   Anzeige Anzeige Anzeige Anzeige Anzeige

      so_help->popup(
        EXPORTING
          it_table              = it_table
          iv_title              = so_help->get( dd04t = 'X' i_any = 'CIFDISP' ) "Anzeige'
*        iv_vertical_lines     = abap_true
*        iv_headers_visible    = abap_true
*        iv_raise_double_click = abap_true
*        it_col_setting        =
          iv_optimize_colwidth  = abap_true
*        iv_col_start          = '10'
*        iv_col_end            = '160'
*        iv_line_start         = '10'
*        iv_line_end           = '20'
*      IMPORTING
*        es_event              =
    ).

    ENDIF.

  ENDMETHOD.

  METHOD gui_popup_xml.

    cl_abap_browser=>show_xml(
     EXPORTING xml_string = i_iv_xml
               size       = cl_abap_browser=>xlarge ).


  ENDMETHOD.

  METHOD gui_popup_bal.

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

        ##FM_SUBRC_OK
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
        IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
        so_help->raise_check( function = 'X' ).

        READ TABLE lt_header
         INTO ls_header INDEX 1.
        so_help->raise_check( read_table = 'X' ).
*

        DATA:
          lt_lognumber TYPE bal_t_logn,
          lt_handle    TYPE bal_t_logh.

        LOOP AT lt_header INTO ls_header.
          APPEND ls_header-lognumber TO lt_lognumber.
        ENDLOOP.


*    APPEND is_header-lognumber TO lt_lognumber.

        ##FM_SUBRC_OK
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
        IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
        so_help->raise_check( function = 'X' ).

*        CALL FUNCTION 'BAL_DSP_PROFILE_POPUP_GET'
*       IMPORTING
*            e_s_display_profile = ls_profile
*       EXCEPTIONS
*            OTHERS              = 1.

        ##FM_SUBRC_OK
        CALL FUNCTION 'BAL_DSP_LOG_DISPLAY'
          EXPORTING
            i_t_log_handle       = lt_handle
            i_s_display_profile  = ls_profile
            i_amodal             = ' ' "iv_amodal'
          EXCEPTIONS
            profile_inconsistent = 01
            internal_error       = 02
            no_data_available    = 03
            no_authority         = 04
            error_message        = 05
            OTHERS               = 99.
        IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
        so_help->raise_check( function = 'X' ).


        CALL FUNCTION 'MESSAGES_INITIALIZE'.

      CATCH cx_t100_msg INTO lx_t100.
        "D  WU  733 Keine Daten vorhanden.
        so_help->raise( i_any = '733(WU)' i_prev = lx_t100 ).

    ENDTRY.

  ENDMETHOD.

  METHOD gui_popup_inform.

    DATA:
      lv_txt1      TYPE char80,
      lv_txt2      TYPE char80,
      lv_txt3      TYPE char80,
      lv_txt4      TYPE char80,
      lt_stringtab TYPE stringtab,
      lv_title     TYPE  sta_ptitel. "  type c length 35

    FREE lt_stringtab.
    so_help->trans(
     EXPORTING
        string_2_stringtab   = 'X'
        split_word           = 'X'
        i_any                = is_bapi-message
        i_any2               = 80
      IMPORTING
        e_result             = lt_stringtab  ).


    READ TABLE lt_stringtab INDEX 1
    INTO lv_txt1.

    READ TABLE lt_stringtab INDEX 2
      INTO lv_txt2.

    READ TABLE lt_stringtab INDEX 3
      INTO lv_txt3.

    READ TABLE lt_stringtab INDEX 4
      INTO lv_txt4.

    lv_title = so_help->get( dd04t = 'X' i_any = 'GPDINFO' ).

    CALL FUNCTION 'POPUP_TO_INFORM'
      EXPORTING
        titel = lv_title
        txt1  = lv_txt1
        txt2  = lv_txt2
        txt3  = lv_txt3
        txt4  = lv_txt4.


  ENDMETHOD.


  METHOD gui_popup_confirm.

    DATA:
      lv_text   TYPE  c LENGTH 100,
      lv_answer TYPE c LENGTH 1.
    DATA lv_title TYPE c LENGTH 100.

    lv_text = is_bapi-message.
    lv_title = so_help->get( text = 'X' i_any = '168(SWN)' ).

    CALL FUNCTION 'POPUP_TO_CONFIRM'
      EXPORTING
        titlebar              = lv_title "so_help->get( msg = 'X' i_any = '168(SWN)' ) " Title of dialog box
*       diagnose_object       = space         " Diagnosis text (maintain via SE61)
        text_question         = lv_text " Question text in dialog box
*       text_button_1         = text-001      " Text on the first pushbutton
*       icon_button_1         = space         " Icon on first pushbutton
*       text_button_2         = text-002      " Text on the second pushbutton
*       icon_button_2         = space         " Icon on second pushbutton
*       default_button        = '1'           " Cursor position
        display_cancel_button = ' '           " Button for displaying cancel pushbutton
*       userdefined_f1_help   = space         " User-Defined F1 Help
*       start_column          = 25            " Column in which the POPUP begins
*       start_row             = 6             " Line in which the POPUP begins
**       popup_type    = is_bapi-type    " Icon type
*       iv_quickinfo_button_1 = space         " Quick Info on First Pushbutton
*       iv_quickinfo_button_2 = space         " Quick Info on Second Pushbutton
      IMPORTING
        answer                = lv_answer        " Return values: '1', '2', 'A'
*    TABLES
*       parameter             = parameter     " Text transfer table for parameter in text
      EXCEPTIONS
        text_not_found        = 1             " Diagnosis text not found
        OTHERS                = 2.
    IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
    so_help->raise_check( function = 'X' ).

    IF lv_answer = 1.
      r_result = abap_true.
    ELSE.
      r_result = abap_false.
    ENDIF.


  ENDMETHOD.

*
*  METHOD gui_popup_t100.
*
*    TRY.
*
*        DATA:
*          lo_alv  TYPE REF TO cl_salv_table,
*          ls_bapi TYPE bapiret2.
*
*        TYPE-POOLS: icon.
*
*        TYPES:
*
*          BEGIN OF ty_s_output,
*            type TYPE string,
*            text TYPE string,
*            id   TYPE string,
*            no   TYPE string,
**        v1   TYPE string,
**        v2   TYPE string,
**        v3   TYPE string,
**        v4   TYPE string,
*
*          END OF ty_s_output.
*
*        FIELD-SYMBOLS:
*    <ls_output> TYPE ty_s_output.
*
*        DO.
*
*
*          DATA:
*           lt_output TYPE STANDARD TABLE OF ty_s_output.
*          FREE lt_output.
*          APPEND INITIAL LINE TO lt_output.
*
*          LOOP AT it_bapi INTO ls_bapi.
*
*            APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
**      <ls_output>-type = ls_bapi-type.
*            <ls_output>-text = ls_bapi-message.
*
*            IF  <ls_output>-text IS INITIAL.
*              <ls_output>-text = ls_bapi-message.
*            ENDIF.
**      <ls_output>-id   = ls_bapi-id.
**      <ls_output>-no   = ls_bapi-number.
*
*            CASE ls_bapi-type.
*
*              WHEN 'E'.
*                <ls_output>-type = icon_led_red.
*              WHEN 'S'.
*                <ls_output>-type = icon_led_green.
*              WHEN 'I'.
*                <ls_output>-type = icon_message_information.
*              WHEN 'W'.
*                <ls_output>-type = icon_led_yellow.
*            ENDCASE.
*
**      <ls_output>-v1 = ls_bapi-message_v1.
**      <ls_output>-v2 = ls_bapi-message_v2.
**      <ls_output>-v3 = ls_bapi-message_v3.
**      <ls_output>-v4 = ls_bapi-message_v4.
*            <ls_output>-id = ls_bapi-id.
*            <ls_output>-no = ls_bapi-number.
*
*
*          ENDLOOP.
*
*          APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
*          APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
*          APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
*          "O0 003 Bitte wählen Sie eine Zeile mit dem Doppelklick (F2)
*          <ls_output>-text = so_help->t100_get_text( '003(O0)' ).
*          CONCATENATE '*' <ls_output>-text  INTO <ls_output>-text .
*
*          DATA:
*            lo_set   TYPE REF TO cl_salv_display_settings,
*            lv_title TYPE lvc_title.
*
*
*
*          cl_salv_table=>factory(
*            EXPORTING
*              list_display   = if_salv_c_bool_sap=>false  "TRUE fuer Listenausgabe
*            IMPORTING
*              r_salv_table   =  lo_alv     "Objekt ALV
*            CHANGING
*              t_table        = lt_output ). "Tabelle fuer Anzeige
*
*
*          lo_set = lo_alv->get_display_settings( ).
*          lv_title = so_help->t100_get_text( iv_id = 'DB6' iv_no = 205 ).
*          lo_set->set_list_header( lv_title ).
*          lo_set->set_vertical_lines(  abap_false ).
**    lo_set->set_horizontal_lines(  abap_False ).
*
*          DATA: go_column TYPE REF TO cl_salv_column_table,
*                lo_cols   TYPE REF TO cl_salv_columns_table.
*          "Spaltenueberschrift setzten
*
*
*
*          lo_cols = lo_alv->get_columns( ).
*          lo_cols->set_headers_visible(  abap_false ).
*
*          go_column ?= lo_cols->get_column( 'TEXT' ).
*          go_column->set_output_length( '120' ).
*
*          go_column ?= lo_cols->get_column( 'TYPE' ).
*          go_column->set_icon( if_salv_c_bool_sap=>true ).
*          go_column->set_output_length( '2' ).
**   go_column->set_technical( abap_true ).
*
*          go_column ?= lo_cols->get_column( 'ID' ).
*          go_column->set_output_length( '5' ).
**        IF iv_show_simple = abap_true.
*          go_column->set_technical( abap_true ).
**        ENDIF.
*
*
*          go_column ?= lo_cols->get_column( 'NO' ).
*          go_column->set_output_length( '3' ).
**        IF iv_show_simple = abap_true.
*          go_column->set_technical( abap_true ).
**        ENDIF.
*
*          """"""""""""""""""""""""""""""
*          " Fuktionen anschalten
*
*          DATA:
*            lo_func  TYPE REF TO cl_salv_functions_list,
*            lo_event TYPE REF TO cl_salv_events_table,
*            lt_bapi  TYPE bapiret2_tab.
*
*          lo_func =  lo_alv->get_functions( ).
*
**        lo_func->set_all(
**      value = if_salv_c_bool_sap=>true ).
*
*
*          """"""""""""""""""""""""""""""
*          " Layoutverwaltung
*
*          lo_event = lo_alv->get_event(  ).
*          SET HANDLER on_double_click FOR lo_event.
*
*          """"""""""""""""""""""""""""""""""""""""
*          " Anzeige
*
*          lo_alv->set_screen_popup(
*        EXPORTING
*          start_column = '10'
*          end_column   = '160'
*          start_line   =  '10'
*          end_line     = '25' ).
*
*
*          FREE ss_alv_tmp.
*          lo_alv->display( ).
*
*          IF ss_alv_tmp-is_double_click = abap_true.
*            READ TABLE it_bapi INTO ls_bapi
*                INDEX ss_alv_tmp-row - 1.
*            IF sy-subrc = 0.
*              FREE lt_bapi.
*              APPEND ls_bapi TO lt_bapi.
*              so_help->gui( table = 'X' i_any  = lt_bapi ).
*            ENDIF.
*          ELSE.
*            EXIT.
*          ENDIF.
*
*
*        ENDDO.
*
*        """""""""""""""""""""""""""""""
*        " Fehlerbehandlung
*        DATA: lx_root TYPE REF TO cx_root.
*      CATCH cx_root INTO lx_root.
*        "D  NF1 060 Popup wurde abgebrochen
**        mo_help->so_error->raise_msg( iv_id = 'NF1' iv_no = '060' io_previous = lx_salv ) .
*    ENDTRY.
*
*  ENDMETHOD.
*

  METHOD data_2_single_range.



    DATA: lt_params_sel   TYPE rsparams_tt,
          ls_params       LIKE LINE OF lt_params_sel,
          lv_dirty_assign TYPE string.

*  CLEAR cs_sel.

    FIELD-SYMBOLS:" <fs_source>       TYPE any,
      " <fs_destination>  TYPE any,
      <lv_any>          TYPE data,
      <lt_range>        TYPE any,
      <ls_range_s>      TYPE any,
      <lt_range_t>      TYPE STANDARD TABLE,
      <ls_range_result> LIKE LINE OF rt_range. "any.


*    lo_struct ?= cl_abap_structdescr=>describe_by_data( es_structure ).
*    lt_components = lo_struct->get_components( ).

    "Parameter von Selektionsbild auslesen
    so_help->screen( EXPORTING seldata_get = 'X' iv_repid = iv_repid
                    IMPORTING e_result = lt_params_sel ).

*     EXPORTING
*       iv_repid            = iv_repid
**        iv_multi_tabname    =
**        iv_single_fieldname =
*     IMPORTING
**        et_range_multi      =
**        et_range_single     =
*        et_parameter = lt_params_sel
*   ).

*   lt_params_sel = data_2_params(
*       iv_repid = iv_repid  ).

    "Zieltabelle auslesen / typen etc


    "TODO

    LOOP AT lt_params_sel INTO ls_params
        WHERE selname = iv_name.
      "  UNASSIGN: <fs_source>.


      "Variable auslesen
      CASE ls_params-kind.

        WHEN 'P'.
          CONCATENATE '(' iv_repid ')' ls_params-selname
        INTO lv_dirty_assign.

          ASSIGN (lv_dirty_assign) TO <lt_range>.

          APPEND INITIAL LINE TO rt_range ASSIGNING <ls_range_result>.

*          ASSIGN COMPONENT 'SIGN' OF STRUCTURE <ls_range_result> TO  <lv_any>.
          <ls_range_result>-sign = 'I'.

*          ASSIGN COMPONENT 'OPTION' OF STRUCTURE <ls_range_result> TO  <lv_any>.
          <ls_range_result>-option = 'EQ'.

*          ASSIGN COMPONENT 'LOW' OF STRUCTURE <ls_range_result> TO  <lv_any>.
          <ls_range_result>-low = <lt_range>.


          DELETE rt_range WHERE sign IS INITIAL AND option IS INITIAL.


        WHEN 'S'.
          CONCATENATE '(' iv_repid ')' ls_params-selname '[]'
        INTO lv_dirty_assign.
          ASSIGN (lv_dirty_assign) TO <lt_range>.
          ASSIGN <lt_range> TO <lt_range_t>.
          LOOP AT <lt_range_t> ASSIGNING <ls_range_s>.
            APPEND INITIAL LINE TO rt_range ASSIGNING <ls_range_result>.

            ASSIGN COMPONENT 'SIGN' OF STRUCTURE <ls_range_s> TO  <lv_any>.
            <ls_range_result>-sign = <lv_any>.

            ASSIGN COMPONENT 'OPTION' OF STRUCTURE <ls_range_s> TO  <lv_any>.
            <ls_range_result>-option = <lv_any>.

            ASSIGN COMPONENT 'LOW' OF STRUCTURE <ls_range_s> TO  <lv_any>.
            <ls_range_result>-low = <lv_any>.

            ASSIGN COMPONENT 'HIGH' OF STRUCTURE <ls_range_s> TO  <lv_any>.
            <ls_range_result>-high = <lv_any>.

*                 assign COMPONENT 'SIGN' of STRUCTURE <ls_range> to  <lv_any>.
*        <ls_range_result>-sign = <lv_any>.
          ENDLOOP.

          DELETE rt_range WHERE sign IS INITIAL AND option IS INITIAL. " and low is INITIAL and high is initial.

          RETURN.
*        assign <lv_range>->('SIGN') to <lv_any>.

      ENDCASE.

*      ASSIGN (lv_dirty_assign) TO <lv_any>.


      "Typ bestimmen

    ENDLOOP.


  ENDMETHOD.

  METHOD data_2_where_join.

  ENDMETHOD.


  METHOD data_2_struct.


    DATA: lt_params_sel TYPE rsparams_tt.

*  CLEAR cs_sel.

    lt_params_sel = data_2_params(
       iv_repid = iv_repid
   ).

    trans_params_2_struc( EXPORTING it_params = lt_params_sel  IMPORTING es_struc = es_structure ).



  ENDMETHOD.


  METHOD data_2_single_value.
    DATA: lt_params TYPE rsparams_tt,
          ls_param  LIKE LINE OF lt_params.


    lt_params = data_2_params( iv_repid = iv_repid ).

    READ TABLE lt_params INTO ls_param
      WITH KEY selname = iv_name.
    so_help->raise_check( read_table = abap_true ).

    rv_string = ls_param-low.
*  CATCH cx_t100_msg.
*  CATCH cx_t100_msg.

  ENDMETHOD.



  METHOD data_2_where_dirty.


    DATA: lt_result TYPE rsds_frange_t.
*          lt_params TYPE any.

    data_2_rangetab_dirty(
      EXPORTING
        iv_repid   = iv_repid "SY-REPID
        iv_tabname = iv_tabname
      RECEIVING
        rt_result  = lt_result
    ).

    so_help->trans(
      EXPORTING
        rangetab_2_where = 'X'
        i_any            = lt_result
      IMPORTING
        e_result         = r_result  ).


  ENDMETHOD.



  METHOD data_2_single_type_dirty.


    DATA:
*          lo_tab_descr type ref to cl_abap-tabdesr
      lv_dirty_assign TYPE string,
      lo_datadescr    TYPE REF TO cl_abap_typedescr.

*  CLEAR cs_sel.

    FIELD-SYMBOLS: <lv_any>   TYPE data,
                   <lv_any_t> TYPE STANDARD TABLE,
                   <fs_line>  TYPE any.
*                   <ls_result>          LIKE LINE OF rt_result.



*    lo_struct ?= cl_abap_structdescr=>describe_by_data( es_structure ).
*    lt_components = lo_struct->get_components( ).

    CONCATENATE
        i_ls_params_name
        '[]'
        INTO lv_dirty_assign.

    ASSIGN (lv_dirty_assign) TO <lv_any>.


    IF sy-subrc = 0.

      ASSIGN <lv_any> TO <lv_any_t>.
      APPEND INITIAL LINE TO <lv_any_t> ASSIGNING <fs_line>.
      ASSIGN ('<fs_line>-LOW') TO <lv_any>.


    ELSE.

      ASSIGN (i_ls_params_name) TO <lv_any>.

    ENDIF.


    lo_datadescr = cl_abap_datadescr=>describe_by_data( p_data = <lv_any> ).

    DATA(lv_name) = lo_datadescr->get_relative_name( ).
    r_result ?= lo_datadescr.
*     cl_abaP_datadescr=>describe_by_name( p_data = <lv_any> ).


  ENDMETHOD.

  METHOD data_2_params.

    DATA:
*          lt_params   TYPE STANDARD TABLE OF rsparams,
          curr_report TYPE raldb_repo.

    curr_report = iv_repid.

    ##FM_SUBRC_OK
    CALL FUNCTION 'RS_REFRESH_FROM_SELECTOPTIONS'
      EXPORTING
        curr_report     = curr_report
*   IMPORTING
*       SP              =
      TABLES
        selection_table = rt_params
*       SELECTION_TABLE_255       =
      EXCEPTIONS
        not_found       = 1
        no_report       = 2
        OTHERS          = 3.
    IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
    so_help->raise_check( function = abap_true ).

  ENDMETHOD.

  METHOD data_2_rangetab_dirty.


    "Über selscreen tabelle loopen
    "Dirty Assign Typ holen
    "Schauen ob dieser in Zieltabelle
    "Aufnehmen

    DATA: lo_struct     TYPE REF TO cl_abap_structdescr,
*          lo_tab_descr type ref to cl_abap-tabdesr
          lt_components TYPE cl_abap_structdescr=>component_table,
          lt_params_sel TYPE rsparams_tt,
          ls_params     LIKE LINE OF lt_params_sel,
          ls_component  LIKE LINE OF lt_components,
          lo_typename   TYPE REF TO cl_abap_datadescr.

*  CLEAR cs_sel.

    FIELD-SYMBOLS: <ls_result>          LIKE LINE OF rt_result.


    DATA:
            ls_result LIKE LINE OF rt_result.

*    lo_struct ?= cl_abap_structdescr=>describe_by_data( es_structure ).
*    lt_components = lo_struct->get_components( ).

    "Parameter von Selektionsbild auslesen
    lt_params_sel = data_2_params(
       iv_repid = iv_repid  ).

    "Zieltabelle auslesen / typen etc
    lo_struct ?= cl_abap_typedescr=>describe_by_name( iv_tabname ).
    lt_components = lo_struct->get_components( ).

    "Rangetabelle erzeugen
    SORT lt_params_sel BY selname.
    DELETE ADJACENT DUPLICATES FROM lt_params_sel COMPARING selname.

    LOOP AT lt_params_sel INTO ls_params.

      lo_typename = data_2_single_type_dirty(  ls_params-selname ).

*    lv_rel_name = lo_typename->get_relative_name(  ).

      READ TABLE lt_components INTO ls_component
          WITH KEY type = lo_typename.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.

      FREE ls_result.


      so_help->rtti(
        EXPORTING
*        i_any        =
          i_fnam_type  = lo_typename->absolute_name
          i_fnam_tab   = iv_tabname
        IMPORTING
*        ev_typename  =
*        ev_kind      =
*        et_comp      =
*        et_domrange  =
*        ev_convexit  =
*        ev_in_domr   =
          ev_fieldname = ls_result-fieldname
      ).


      so_help->screen( EXPORTING seldata_get = 'X' iv_repid = iv_repid i_any = ls_params-selname
                       IMPORTING e_result = ls_result-selopt_t ).


      READ TABLE rt_result ASSIGNING <ls_result>
        WITH KEY fieldname = ls_result-fieldname.

      IF sy-subrc <> 0.
        APPEND ls_result TO rt_result.
      ELSE.
        APPEND LINES OF ls_result-selopt_t TO <ls_result>-selopt_t.
      ENDIF.

*      APPEND INITIAL LINE TO rt_result ASSIGNING <ls_result>.





    ENDLOOP.




*        ls_result-fieldname
*    loop at lt_components into ls_component.

*    ls_component-type.


*    endloop.
*


*      RECEIVING
*        p_descr_ref    =
*      EXCEPTIONS
*        type_not_found = 1
*        others         = 2
*    ).
*    IF sy-subrc <> 0.
*     MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*       WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
*    ENDIF.

*    "TODO
*
*    LOOP AT lt_params_sel INTO ls_params.
*      UNASSIGN: <fs_destination>, <fs_source>.
*
*
*      "Variable auslesen
*      CASE ls_params-kind.
*
*        WHEN 'P'.
*          CONCATENATE '(' iv_repid ')' ls_params-selname
*        INTO lv_dirty_assign.
*
*        WHEN 'S'.
*          CONCATENATE '(' iv_repid ')' ls_params-selname '[]'
*        INTO lv_dirty_assign.
*      ENDCASE.
*
*      ASSIGN (lv_dirty_assign) TO <lv_any>.
*
*
*      "Typ bestimmen
*
*
*
*
*      "Ist Typ Teil der Zieltabelle?
*
*
**     .
*
*    ENDLOOP.
*     assign (iv_repid)
*
*
*      READ TABLE lt_components ASSIGNING <fs_component>
*          WITH KEY name = ls_params-selname.
*      IF sy-subrc <> 0.
*        CONTINUE.
*      ENDIF.
*

  ENDMETHOD.

  METHOD popup_f4_help_tab.

    DATA:
*          lt_waage type STANDARD TABLE OF zstc_t_waage_val,
      lt_return    TYPE STANDARD TABLE OF ddshretval,
      ls_return    LIKE LINE OF lt_return,
      lv_fieldname TYPE  dfies-fieldname.
*
*    select *
*      from zstc_t_waage_val
*      into CORRESPONDING FIELDS OF table lt_waage.
*      where

    lv_fieldname = iv_fieldname.

    CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
      EXPORTING
        retfield        = lv_fieldname                           " Spalte, die zurückgegeben werden soll
        window_title    = 'SELECT_VALUE:'    " dafür Bezeichnung
        value_org       = 'S'
      TABLES
        value_tab       = it_table            " Tabelle mit Werten übergeben
        return_tab      = lt_return         " Rückgabewert
      EXCEPTIONS
        parameter_error = 1
        no_values_found = 2
        error_message   = 3
        OTHERS          = 4.
    IF sy-subrc <> 0. sy-subrc = sy-subrc. ENDIF. "SLIN check ok without pragma
    so_help->raise_check( function = 'X' i_head = 'ZCX_VALUE_REQUEST_ERROR' ).
*    IF sy-subrc = 0.
    READ TABLE lt_return INTO ls_return
      INDEX 1.
    rv_result = ls_return-fieldval.
*    RETURN = return_tab_vr-fieldval.
*    ELSE.

*    ENDIF.

  ENDMETHOD.



  METHOD popup_f4_help_vari_selscreen.

    DATA: lv_repid   TYPE rsvar-report,
          lv_variant TYPE rsvar-variant.

    lv_repid = iv_repid.

    ##FM_SUBRC_OK
    CALL FUNCTION 'RS_VARIANT_CATALOG'
      EXPORTING
        report               = lv_repid
*       new_title            = space
*       dynnr                =
*       internal_call        = space
*       masked               = 'X'
*       variant              = space
        pop_up               = abap_true
      IMPORTING
        sel_variant          = lv_variant
*       sel_variant_text     =
*      TABLES
*       belonging_dynnr      =
      EXCEPTIONS
        no_report            = 1
        report_not_existent  = 2
        report_not_supplied  = 3
        no_variants          = 4
        no_variant_selected  = 5
        variant_not_existent = 6
        OTHERS               = 7.
    IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
    so_help->raise_check( function = abap_true ).


    rv_result = lv_variant.

  ENDMETHOD.



  METHOD source_code_get_fubaname.

    DATA:
      lt_source        TYPE stringtab,
      lv_counter       TYPE i,
      lv_code          TYPE string,
      lv_temp          TYPE string,
      lv_counter_new   TYPE i,
      lv_line_function TYPE i,
      r_result         TYPE string.


    FREE e_v3.

    lt_source = it_source.

    TRY.

        lv_counter = lines( it_source ) - 5.

        FIELD-SYMBOLS: <ls_code> TYPE string.
        LOOP AT lt_source ASSIGNING <ls_code>.
          TRANSLATE <ls_code> TO UPPER CASE.
        ENDLOOP.

        WHILE lv_counter > 0 .

          READ TABLE lt_source INTO lv_code
          INDEX lv_counter.

          IF lv_code CS 'CALL FUNCTION' OR lv_code CS 'call function'.
            lv_line_function = lv_counter.
            SPLIT lv_code AT 'CALL FUNCTION'
            INTO  lv_temp r_result.

            SHIFT r_result LEFT DELETING LEADING ' '.

            "Steht in dieser Zeile Funktionsaufruf oder erst in der nächsten?
            IF strlen(  r_result ) = 0.

              lv_counter_new = lv_counter + 1.

              READ TABLE lt_source INTO r_result
              INDEX lv_counter_new.

              SHIFT r_result LEFT DELETING LEADING ' '.

            ENDIF.

            EXIT.
          ENDIF.

          lv_counter = lv_counter - 1.
        ENDWHILE.

        SPLIT r_result AT ' '
        INTO r_result lv_temp.

        r_result = r_result+1.
        DATA: lv_len TYPE i.
        lv_len = strlen( r_result ) - 1.
        r_result = r_result(lv_len).

        DATA ls_tftit TYPE tftit.

        SELECT SINGLE *
        FROM tftit
        INTO ls_tftit
        WHERE spras = sy-langu
        AND  funcname = r_result.
        IF sy-subrc <> 0.

          SELECT SINGLE *
          FROM tftit
          INTO ls_tftit
          WHERE spras = 'EN'
          AND  funcname = r_result.
          IF sy-subrc <> 0.


            SELECT SINGLE *
            FROM tftit
            INTO ls_tftit
            WHERE spras = 'DE'
            AND  funcname = r_result.

          ENDIF.
        ENDIF.



*        CONCATENATE r_result ' (&2 &3)' INTO r_result RESPECTING BLANKS.
*        e_v1 = r_result.
*        TRY.
*            e_v2 = ls_tftit-stext(50).
*            e_v3 = ls_tftit-stext+50.
*          CATCH cx_root.
*        ENDTRY.


        DATA:
          lv_string_result TYPE string,
          lv_length        TYPE i.



        lv_string_result = ls_tftit-stext.
        r_result = ` ` && r_result.
        CONCATENATE '"' lv_string_result '"' ' | ' r_result INTO lv_string_result
            RESPECTING BLANKS.

        lv_length = strlen(  lv_string_result ).


        IF lv_length <= 45.
          e_v1 =  lv_string_result.
          RETURN.
        ENDIF.

        e_v1 = lv_string_result(45).


        CONCATENATE e_v1 '&2' INTO e_v1 RESPECTING BLANKS.
        e_v2 = lv_string_result+45.

        IF lv_length <= 95.
          RETURN.
        ENDIF.

        CONCATENATE e_v1 '&3' INTO e_v1 RESPECTING BLANKS.
        e_v3 = lv_string_result+95.

*    CONCATENATE r_result ' (' ls_tftit-stext ')' INTO r_result RESPECTING BLANKS.

*    es_stack = is_called.
*    es_stack-line = lv_line_function.

      CATCH cx_root.
        e_v1 = 'UNKNOWN'.
    ENDTRY.

  ENDMETHOD.


  METHOD source_code_get_readtable.

    DATA:
      lt_source      TYPE stringtab,
      lv_counter     TYPE i,
      lv_code        TYPE string,
      lv_temp        TYPE string,
      lv_counter_new TYPE i.

    lv_counter = lines( it_source ) - 6.

    lt_source = it_source.

    FIELD-SYMBOLS: <ls_code> TYPE string.
    LOOP AT lt_source ASSIGNING <ls_code>.
      TRANSLATE <ls_code> TO UPPER CASE.
    ENDLOOP.

    WHILE lv_counter > 0 .

      READ TABLE lt_source INTO lv_code
      INDEX lv_counter.

      TRANSLATE lv_code TO UPPER CASE.

      IF lv_code CS 'TABLE' AND lv_code CS 'READ'.

        SPLIT lv_code AT 'TABLE'
        INTO  lv_temp r_result.

        SHIFT r_result LEFT DELETING LEADING ' '.

        "Steht in dieser Zeile Funktionsaufruf oder erst in der nächsten?
        IF strlen(  r_result ) = 0.

          lv_counter_new = lv_counter + 1.

          READ TABLE lt_source INTO r_result
          INDEX lv_counter_new.

          SHIFT r_result LEFT DELETING LEADING ' '.

        ENDIF.

        EXIT.
      ENDIF.

      lv_counter = lv_counter - 1.
    ENDWHILE.

    SPLIT r_result AT ' '
    INTO r_result lv_temp.

  ENDMETHOD.

  METHOD source_code_get_selectname.

    DATA:
      lt_source      TYPE stringtab,
      lv_counter     TYPE i,
      lv_code        TYPE string,
      lv_temp        TYPE string,
      lv_counter_new TYPE i.


    TRY.

*        break-point.
        lt_source = it_source.

        lv_counter = lines( it_source ) - 5.


        FIELD-SYMBOLS: <ls_code> TYPE string.
        LOOP AT lt_source ASSIGNING <ls_code>.
          TRANSLATE <ls_code> TO UPPER CASE.
        ENDLOOP.


        WHILE lv_counter > 0 .

          READ TABLE lt_source INTO lv_code
            INDEX lv_counter.

          IF lv_code CS 'FROM'.

            SPLIT lv_code AT 'FROM'
             INTO  lv_temp r_result.
            SHIFT r_result LEFT DELETING LEADING ' '.
            "Steht in dieser Zeile shcon Tabelleninfo oder erst in der nächsten?
            IF strlen(  r_result ) = 0.
              lv_counter_new = lv_counter + 1.
              READ TABLE lt_source INTO r_result
               INDEX lv_counter_new.
              SHIFT r_result LEFT DELETING LEADING ' '.
            ENDIF.

            EXIT.
          ENDIF.
          lv_counter = lv_counter - 1.
        ENDWHILE.

        SPLIT r_result AT ' '
           INTO r_result lv_temp.

        TRANSLATE r_result TO UPPER CASE.

        DATA ls_dd02t TYPE dd02t.
        SELECT SINGLE tabname ddlanguage ddtext
               FROM dd02t
               INTO CORRESPONDING FIELDS OF ls_dd02t
               WHERE tabname = r_result
               AND   ddlanguage = sy-langu.
        IF sy-subrc <> 0.
          SELECT SINGLE tabname ddlanguage ddtext
      FROM dd02t
      INTO CORRESPONDING FIELDS OF ls_dd02t
      WHERE tabname = r_result
      AND   ddlanguage = 'EN'.
          IF sy-subrc <> 0.
            SELECT SINGLE tabname ddlanguage ddtext
                FROM dd02t
            INTO CORRESPONDING FIELDS OF ls_dd02t
                WHERE tabname = r_result
            AND   ddlanguage = 'DE'.
          ENDIF.
        ENDIF.

        DATA lv_string TYPE string.
        lv_string = ls_dd02t-ddtext.
*        CONCATENATE r_result '(' lv_string ')' INTO r_result RESPECTING BLANKS.
        CONCATENATE  '"' lv_string ' (' r_result ')"' INTO r_result RESPECTING BLANKS.

      CATCH cx_root.
        r_result = 'UNKNOWN'.
    ENDTRY.


  ENDMETHOD.

  METHOD bal_save.

    DATA:
      lv_handle  TYPE balloghndl,
      lt_bal_msg TYPE bal_t_msg,
      ls_bal_msg TYPE bal_s_msg,
      lx_error   TYPE REF TO cx_root,
      lt_error   TYPE bapiret2_tab.


    IF i_any IS INITIAL.
      so_help->raise('ZCX_NO_LOG_DATA').
    ENDIF.

    CALL FUNCTION 'BAL_LOG_CREATE'
      EXPORTING
        i_s_log                 = is_log " Log header data
      IMPORTING
        e_log_handle            = lv_handle  " Log handle
      EXCEPTIONS
        log_header_inconsistent = 1
        error_message           = 3
        OTHERS                  = 2.
    IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
    so_help->raise_check( function = abap_true ).

    DATA:
      lt_handle    TYPE bal_t_logh.


    """"""""""""""""""""""""""""""""""""""""
    " Nachrichten übertragen

    so_help->msg(
      EXPORTING
        i_any         = i_any
      IMPORTING
        e_any    = lt_bal_msg
    ).

    LOOP AT lt_bal_msg INTO ls_bal_msg.

      TRY.
*              DATA:
*             ls_msg TYPE bal_s_msg .
*
*              ls_msg-msgid = ls_bapiret2-id.
*              ls_msg-msgno = ls_bapiret2-number.
*              ls_msg-msgty = ls_bapiret2-type.
*              ls_msg-msgv1 = ls_bapiret2-message_v1.
*              ls_msg-msgv2 = ls_bapiret2-message_v2.
*              ls_msg-msgv3 = ls_bapiret2-message_v3.
*              ls_msg-msgv4 = ls_bapiret2-message_v4.
          CALL FUNCTION 'BAL_LOG_MSG_ADD'
            EXPORTING
              i_log_handle     = lv_handle
              i_s_msg          = ls_bal_msg
            EXCEPTIONS
              log_not_found    = 1
              msg_inconsistent = 2
              log_is_full      = 3
              error_message    = 4
              OTHERS           = 5.
          IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
          so_help->raise_check(  function = abap_true ).
*              mo_help->so_check_a_raise->after_function( is_sy = sy ).
          "cx_t100->check_a_raise_function( is_sy = sy ).

        CATCH cx_t100_msg INTO lx_error.
          so_help->msg( EXPORTING i_any = lx_error
                 IMPORTING e_any =  lt_error  ).
      ENDTRY.

    ENDLOOP.

    IF lt_error IS NOT INITIAL.

      so_help->raise( lt_error ).

    ENDIF.


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
*       i_client         = SY-MANDT    " Client in which the new log is to be saved
*       i_in_update_task = SPACE    " Save in UPDATE TASK
*       i_save_all       = 'X'    " Save all logs in memory
        i_t_log_handle   = lt_handle    " Table of log handles
*       i_2th_connection = 'X'   " FALSE: No secondary connection
*       i_2th_connect_commit = 'X' "SPACE'    " FALSE: No COMMIT in module
*       i_link2job       = 'X'    " Boolean Variable (X=True, -=False, Space=Unknown)
      IMPORTING
        e_new_lognumbers = lt_log_nr   " Table of new log numbers
*       e_second_connection  =     " Name of Secondary Connection
      EXCEPTIONS
        log_not_found    = 1
        save_not_allowed = 2
        numbering_error  = 3
        error_message    = 4
        OTHERS           = 5.
    IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
    so_help->raise_check( function = abap_true ).
*        mo_help->so_check_a_raise->after_function( is_sy = sy ).


  ENDMETHOD.


  METHOD selscreen_struc_2_screen.



    DATA: lo_struct     TYPE REF TO cl_abap_structdescr,
          lt_components TYPE cl_abap_structdescr=>component_table,
          lt_params_sel TYPE rsparams_tt,
          lt_params_new TYPE rsparams_tt,
          lv_selname    TYPE string.
*          ls_params     LIKE LINE OF lt_params_sel.
    FIELD-SYMBOLS:
      <ls_params>  TYPE LINE OF rsparams_tt,
      <ls_params2> TYPE LINE OF rsparams_tt.
*  CLEAR cs_sel.

    FIELD-SYMBOLS: "<fs_source>          TYPE any,
      <fs_destination>     TYPE any,
      <fs_destination_tab> TYPE STANDARD TABLE,
      <fs_component>       LIKE LINE OF lt_components,
      <lv_any>             TYPE data,
      <fs_line>            TYPE any.


    lo_struct ?= cl_abap_structdescr=>describe_by_data( is_struc ).
    lt_components = lo_struct->get_components( ).

    so_help->screen( EXPORTING seldata_get = 'X' iv_repid = iv_repid
                     IMPORTING e_result = lt_params_sel ) .
*
*                     selscreen_get(
*      EXPORTING
*        iv_repid             = iv_repid
*      IMPORTING
*        et_parameter         = lt_params_sel ).

    LOOP AT lt_params_sel ASSIGNING <ls_params>.
      UNASSIGN: <fs_destination>. ", <fs_source>.

      READ TABLE lt_components ASSIGNING <fs_component>
          WITH KEY name = <ls_params>-selname.
      IF sy-subrc <> 0.
        DELETE lt_params_sel.
        CONTINUE.
      ENDIF.


      ASSIGN COMPONENT <fs_component>-name OF STRUCTURE is_struc TO <fs_destination>.

      CASE <ls_params>-kind.

        WHEN 'S'.

          lv_selname = <ls_params>-selname.
          DELETE lt_params_sel WHERE selname = <ls_params>-selname.

          ASSIGN <fs_destination> TO <fs_destination_tab>.

          LOOP AT  <fs_destination_tab> ASSIGNING <fs_line>.

            APPEND INITIAL LINE TO lt_params_new ASSIGNING <ls_params2>.
            <ls_params2>-selname = lv_selname.
            <ls_params2>-kind = 'S'.

            ASSIGN COMPONENT 'LOW' OF STRUCTURE <fs_line> TO <lv_any>.
            <ls_params2>-low = <lv_any>.
            ASSIGN COMPONENT 'HIGH' OF STRUCTURE <fs_line> TO <lv_any>.
            <ls_params2>-high = <lv_any>.
            ASSIGN COMPONENT 'SIGN' OF STRUCTURE <fs_line> TO <lv_any>.
            <ls_params2>-sign = <lv_any>.
            ASSIGN COMPONENT 'OPTION' OF STRUCTURE <fs_line> TO <lv_any>.
            <ls_params2>-option = <lv_any>.

          ENDLOOP.
        WHEN 'P'.
          <ls_params>-low = <fs_destination>.
          CONTINUE.
      ENDCASE.

    ENDLOOP.


    APPEND LINES OF lt_params_new TO lt_params_sel.

    so_help->screen( seldata_set = 'X' iv_repid = iv_repid i_any = lt_params_sel ).

  ENDMETHOD.


  METHOD trans_params_2_struc.


    DATA: lo_struct     TYPE REF TO cl_abap_structdescr,
          lt_components TYPE cl_abap_structdescr=>component_table,
*          lt_params_sel TYPE rsparams_tt,
          ls_params     LIKE LINE OF it_params.

*  CLEAR cs_sel.

    FIELD-SYMBOLS: "<fs_source>          TYPE any,
      <fs_destination>     TYPE any,
      <fs_destination_tab> TYPE STANDARD TABLE,
      <fs_component>       LIKE LINE OF lt_components,
      <lv_any>             TYPE data,
      <fs_line>            TYPE any.

    TRY.

        lo_struct ?= cl_abap_structdescr=>describe_by_data( es_struc ).
        lt_components = lo_struct->get_components( ).

        LOOP AT it_params INTO ls_params.
          UNASSIGN: <fs_destination>. ", <fs_source>.


          IF ls_params-sign IS INITIAL AND ls_params-option IS INITIAL
              AND ls_params-low IS INITIAL AND ls_params-high IS INITIAL.
            CONTINUE.
          ENDIF.


          READ TABLE lt_components ASSIGNING <fs_component>
              WITH KEY name = ls_params-selname.
          IF sy-subrc <> 0.
            CONTINUE.
          ENDIF.


          ASSIGN COMPONENT <fs_component>-name OF STRUCTURE es_struc TO <fs_destination>.

          CASE ls_params-kind.

            WHEN 'S'.
              ASSIGN <fs_destination> TO <fs_destination_tab>.
              APPEND INITIAL LINE TO <fs_destination_tab> ASSIGNING <fs_line>.

              IF ls_params-low IS NOT INITIAL.
                ASSIGN COMPONENT 'LOW' OF STRUCTURE <fs_line> TO <lv_any>.


                so_help->conv(
             EXPORTING
               i_any   = ls_params-low
               exit_in = abap_true
             IMPORTING
               r_result       =  <lv_any>  ).
*               <lv_any> = ls_params-low.
*              <lv_any> = so_help->conv_exit( <lv_any> ).

              ENDIF.

              IF ls_params-high IS NOT INITIAL.

                ASSIGN COMPONENT 'HIGH' OF STRUCTURE <fs_line> TO <lv_any>.


                so_help->conv(
             EXPORTING
               i_any   = ls_params-high
               exit_in = abap_true
             IMPORTING
               r_result       =  <lv_any>  ).

              ENDIF.
*              <lv_any> = ls_params-high.
*              <lv_any> = so_help->conv_exit( <lv_any> ).
              ASSIGN COMPONENT 'SIGN' OF STRUCTURE <fs_line> TO <lv_any>.
              <lv_any> = ls_params-sign.
              ASSIGN COMPONENT 'OPTION' OF STRUCTURE <fs_line> TO <lv_any>.
              <lv_any> = ls_params-option.

**          lv_name = ls_params-selname && '[]'.
*          ASSIGN (lv_name) TO <lv_any>.
            WHEN 'P'.
*            break-point.
              so_help->conv(
                EXPORTING
                  i_any   = ls_params-low
                  exit_in = abap_true
                IMPORTING
                  r_result       =  <fs_destination>  ).
              CONTINUE.
          ENDCASE.

        ENDLOOP.
        DATA lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        so_help->raise(  lx_root ).
    ENDTRY.
  ENDMETHOD.


*  METHOD on_double_click.
*    ss_alv_tmp-row = row.
*    ss_alv_tmp-col = column.
*    ss_alv_tmp-is_double_click = abap_true.
*    LEAVE TO SCREEN 0.
*
*  ENDMETHOD.


  METHOD t100_get_w_text.

    DATA:
      lv_string    TYPE string,
      lt_stringtab TYPE stringtab.

    TRY.

        r_result-message = iv_text.
        r_result-message_v1 = so_help->get( print ='X' i_any = iv_v1 ).
        r_result-message_v2 = so_help->get( print ='X' i_any = iv_v2 ).
        r_result-message_v3 = so_help->get( print ='X' i_any = iv_v3 ).
        r_result-message_v4 = so_help->get( print ='X' i_any = iv_v4 ).
        r_result = lcl_help=>t100_replace_placeholder( is_bapi = r_result ).
        r_result-id = '00'.
        r_result-number = 398.

        FREE:
        r_result-message_v1,
        r_result-message_v2,
        r_result-message_v3,
        r_result-message_v4.

        DATA lv_char200 TYPE c LENGTH 200.
        lv_char200 = r_result-message.
        r_result-message_v1 = lv_char200(50).
        r_result-message_v2 = lv_char200+50(50).
        r_result-message_v3 = lv_char200+100(50).
        r_result-message_v4 = lv_char200+150(50).

      CATCH cx_root.

        r_result-id = '00'.
        r_result-number = 398.
    ENDTRY.

  ENDMETHOD.


  METHOD t100_replace_placeholder.

    DATA ls_bapi TYPE bapiret2.

    ls_bapi = is_bapi.

    IF ls_bapi-id = '00' AND ls_bapi-number = 398.

      CONCATENATE
          ls_bapi-message_v1
          ls_bapi-message_v2
          ls_bapi-message_v3
          ls_bapi-message_v4
          INTO ls_bapi-message RESPECTING BLANKS.

    ELSE.

      IF ls_bapi-message_v1 IS NOT INITIAL.
        REPLACE '&1' IN ls_bapi-message WITH ls_bapi-message_v1.
        IF sy-subrc <> 0.
          REPLACE '&' IN ls_bapi-message WITH ls_bapi-message_v1.
        ENDIF.
*            FREE iv_v1.
      ENDIF.

      IF ls_bapi-message_v2 IS NOT INITIAL.
        REPLACE '&2' IN ls_bapi-message WITH ls_bapi-message_v2.
        IF sy-subrc <> 0.
          REPLACE '&' IN ls_bapi-message WITH ls_bapi-message_v2.
        ENDIF.
      ENDIF.

      IF ls_bapi-message_v3 IS NOT INITIAL.
        REPLACE '&3' IN ls_bapi-message WITH ls_bapi-message_v3.
        IF sy-subrc <> 0.
          REPLACE '&' IN ls_bapi-message WITH ls_bapi-message_v3.
        ENDIF.
      ENDIF.

      IF ls_bapi-message_v4 IS NOT INITIAL.
        REPLACE '&4' IN ls_bapi-message WITH ls_bapi-message_v4.
        IF sy-subrc <> 0.
          REPLACE '&' IN ls_bapi-message WITH ls_bapi-message_v4.
        ENDIF.
      ENDIF.

    ENDIF.

    r_result = ls_bapi.


  ENDMETHOD.



  METHOD cx_set.
    ix_no_check->previous = ix_prev.
  ENDMETHOD.


  METHOD cx_no_2_static.

*    DATA:
*      lx_no     TYPE REF TO lcx_no_check,
*      lx_static TYPE REF TO lcx_static_check.
*
*    lx_no ?= i_lx_no.
*
*    lx_static->ms_data = lx_no->ms_data.
*    lx_static->texttab = lx_no->texttab.
*    lx_static->text    = lx_no->text.
*    lx_static->previous = lx_no->previous.
*
*    r_result = lx_static.
**  r_result->

  ENDMETHOD.


  METHOD source_code_get_not_initial.
    DATA: ls_callstack   TYPE abap_callstack_line,
          it_source      TYPE stringtab,
          lv_counter     TYPE i VALUE 20,
          lv_code        LIKE LINE OF it_source,
          it_source_new  TYPE stringtab,
          lv_counter_new TYPE i,
          lv_temp        TYPE string.

    so_help->info(
      EXPORTING
        iv_depth           = 2
*      raise_error        = abap_false
      IMPORTING
*      ev_date            =
*      ev_time            =
*      ev_timestampl      =
*      ev_time_iso8601    =
*      ev_time_write      =
*      ev_date_write      =
*      ev_username        =
*      ev_ip_adress       =
*      ev_is_gui_active   =
*      ev_sy_msgtext      =
        es_callstack       = ls_callstack
*      et_callstack       =
*      ev_repid           =
*      ev_method          =
*      et_dequeue_table   =
*      ev_work_process_id =
        et_source_code     = it_source
    ).

    DO 20 TIMES.

      READ TABLE it_source INTO DATA(ls_source)
          INDEX ls_callstack-line.

      APPEND ls_source TO it_source_new.
      DELETE it_source INDEX ls_callstack-line.

    ENDDO.

    it_source = it_source_new.

    FIELD-SYMBOLS: <ls_code> TYPE string.
    LOOP AT it_source ASSIGNING <ls_code>.
      TRANSLATE <ls_code> TO UPPER CASE.
    ENDLOOP.


    WHILE lv_counter > 0 .

      READ TABLE it_source INTO lv_code
        INDEX lv_counter.

      IF lv_code CS 'FROM'.

        SPLIT lv_code AT 'FROM'
         INTO  lv_temp r_result.
        SHIFT r_result LEFT DELETING LEADING ' '.
        "Steht in dieser Zeile shcon Tabelleninfo oder erst in der nächsten?
        IF strlen(  r_result ) = 0.
          lv_counter_new = lv_counter + 1.
          READ TABLE it_source INTO r_result
           INDEX lv_counter_new.
          SHIFT r_result LEFT DELETING LEADING ' '.
        ENDIF.

        EXIT.
      ENDIF.
      lv_counter = lv_counter - 1.
    ENDWHILE.

    SPLIT r_result AT ' '
       INTO r_result lv_temp.

    TRANSLATE r_result TO UPPER CASE.

    DATA ls_dd02t TYPE dd02t.
    SELECT SINGLE tabname ddlanguage ddtext
           FROM dd02t
           INTO CORRESPONDING FIELDS OF ls_dd02t
           WHERE tabname = r_result
           AND   ddlanguage = sy-langu.
    IF sy-subrc <> 0.
      SELECT SINGLE tabname ddlanguage ddtext
  FROM dd02t
  INTO CORRESPONDING FIELDS OF ls_dd02t
  WHERE tabname = r_result
  AND   ddlanguage = 'EN'.
      IF sy-subrc <> 0.
        SELECT SINGLE tabname ddlanguage ddtext
            FROM dd02t
        INTO CORRESPONDING FIELDS OF ls_dd02t
            WHERE tabname = r_result
        AND   ddlanguage = 'DE'.
      ENDIF.
    ENDIF.

    DATA lv_string TYPE string.
    lv_string = ls_dd02t-ddtext.
    CONCATENATE r_result '(' lv_string ')' INTO r_result RESPECTING BLANKS.

  ENDMETHOD.


  METHOD get_convexit.


    DATA:
      lr_value    TYPE REF TO data,
      lv_convexit TYPE string,
      lv_result   TYPE string,
      lv_kind     TYPE string.

    FIELD-SYMBOLS:
      <lv_value> TYPE any,
      <l_field>  TYPE any.

    TRY.
        "Ausgabe vorbereiten
        r_result = i_any.
        SHIFT r_result LEFT DELETING LEADING ' '.

        "Convexit bestimmen
        IF iv_exit IS NOT INITIAL.
          lv_convexit = iv_exit.
        ELSEIF iv_type IS NOT INITIAL.
          so_help->rtti(
           EXPORTING
             iv_name = iv_type
           IMPORTING
             ev_convexit  = lv_convexit ).
        ELSE.
          so_help->rtti(
         EXPORTING
           i_any        = i_any
         IMPORTING
           ev_convexit  = lv_convexit ).
        ENDIF.

        IF lv_convexit IS INITIAL.

          "Wurde Konv Exit als Type reingegeben?
          IF iv_type IS NOT INITIAL.
            r_result = get_convexit(
                 i_any       = i_any
                 iv_exit     = iv_type
             ).
          ENDIF.


          RETURN.
        ENDIF.

        IF iv_is_input = abap_true.
          CONCATENATE
        'CONVERSION_EXIT_'
        lv_convexit
        '_INPUT'
        INTO lv_convexit.
        ELSE.
          CONCATENATE
           'CONVERSION_EXIT_'
           lv_convexit
           '_OUTPUT'
           INTO lv_convexit.
        ENDIF.


        "Zielwert vorbereiten
        IF iv_type IS NOT INITIAL.
          CREATE DATA lr_value
              TYPE (iv_type).
          ASSIGN lr_value->* TO <lv_value>.
          <lv_value> = i_any.
        ELSE.
          ASSIGN i_any  TO <lv_value>.
        ENDIF.


        CALL FUNCTION lv_convexit
          EXPORTING
            input           = <lv_value>
          IMPORTING
            output          = <lv_value>
          EXCEPTIONS
            check_failed    = 1
            not_numeric     = 2
            t344_get_failed = 3
            wrong_length    = 4
            error_message   = 5
            OTHERS          = 6.
        IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
*      so_help->raise_check( is_sy = sy ). "TODO

        r_result = <lv_value>.


        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        IF lcl_help=>sv_is_assert_when_error = abap_true.
          ASSERT 1 = 0.
        ENDIF.
    ENDTRY.

*    ENDCASE.

  ENDMETHOD.


  METHOD write.

    DATA:
      lv_kind      TYPE string,
      lv_type      TYPE string,
      lv_line_type TYPE string,
      lt_comp      TYPE abap_component_tab.

    so_help->rtti(
      EXPORTING
        i_any                = i_any
*        iv_name              =
*        i_fnam_type          =
*        i_fnam_tab           =
*        iv_langu             = SY-LANGU
*        raise_error          = ABAP_FALSE
      IMPORTING
        ev_kind              = lv_kind
        ev_type              = lv_type
*        ev_type_kind         =
*        ev_type_is_ddic      =
*        ev_line_kind         =
        ev_line_type         = lv_line_type
*        ev_line_type_kind    =
*        ev_line_type_is_ddic =
*        ev_ref_dyn           =
*        ev_ref_stat          =
*        ev_ref_super         =
*        et_ref_super         =
*        ev_typename_ddic     =
        et_comp              = lt_comp
*        et_domrange          =
*        ev_convexit          =
*        ev_in_domr           =
*        ev_fieldname         =
*        ev_typedescr         =
*        ev_outputlen         =
*        eo_handle            =
    ).


    CASE lv_kind.

      WHEN cl_abap_typedescr=>kind_elem.

        DATA lv_tmp TYPE c LENGTH 500.
        DATA lv_value TYPE string.
        DATA: ls_comp LIKE LINE OF lt_comp.
        WRITE i_any TO lv_tmp.
        r_result = lv_tmp.
        SHIFT r_result LEFT DELETING LEADING ' '.

      WHEN cl_abap_typedescr=>kind_struct.

        FIELD-SYMBOLS: <any> TYPE any.

        r_result = lv_type.
        LOOP AT lt_comp INTO ls_comp.
          ASSIGN COMPONENT ls_comp-name OF STRUCTURE i_any TO <any>.
          lv_value = write(  <any> ).
          CONCATENATE r_result ';' ls_comp-name '=' lv_value INTO r_result.
        ENDLOOP.

      WHEN cl_abap_typedescr=>kind_table.

        DATA lv_line TYPE string.
        FIELD-SYMBOLS: <lt_table> TYPE STANDARD TABLE, <ls_line> TYPE any.
        ASSIGN i_any TO <lt_table>.
        LOOP AT <lt_table> ASSIGNING <ls_line>.
          lv_line = write( <ls_line> ).
          CONCATENATE r_result cl_abap_char_utilities=>cr_lf lv_line INTO r_result.
        ENDLOOP.

    ENDCASE.

  ENDMETHOD.



  METHOD handle_error.

    IF raise_error = abap_true.
      so_help->raise( ix_root ).
    ENDIF.
    IF raise_assert IS SUPPLIED.
      IF raise_assert = abap_true.
        ASSERT 1 = 0.
      ENDIF.
    ELSEIF  sv_is_assert_when_error = abap_true.
      ASSERT 1 = 0.
    ENDIF.

  ENDMETHOD.


  METHOD round2.

    DATA lv_sign TYPE c LENGTH 1.
    DATA lv_count_decimals TYPE i.
    lv_count_decimals = iv_decimals.

    DATA(lv_p_handle) = cl_abap_elemdescr=>get_p(
         p_length                   =  16   " Länge des P-Feldes (in Bytes)
         p_decimals                 =  lv_count_decimals + 1 ).


    DATA(lv_p_handle2) = cl_abap_elemdescr=>get_p(
    p_length                   =  16   " Länge des P-Feldes (in Bytes)
    p_decimals                 =  lv_count_decimals ).


*         DATA(lv_p_handle) = cl_abap_elemdescr=>get_p(
*               p_length                   =  16   " Länge des P-Feldes (in Bytes)
*               p_decimals                 =  lv_count_decimals + 1 ).


    FIELD-SYMBOLS: <lv_p> TYPE p.
    DATA lv_p TYPE REF TO data.

    CREATE DATA lv_p
        TYPE HANDLE lv_p_handle.

    ASSIGN  lv_p->* TO <lv_p>.

    so_help->conv( EXPORTING i_any    = i_any
                  IMPORTING r_result = <lv_p> ).






*    FIELD-SYMBOLS: <lv_p2> TYPE p.
*    DATA lv_p2 TYPE REF TO data.
*
*    CREATE DATA lv_p2
*        TYPE HANDLE lv_p_handle2.
*
*    ASSIGN  lv_p2->* TO <lv_p2>.
*
*    <lv_p2> = <lv_p>.
*


*    FIELD-SYMBOLS: <lv_p3> TYPE p.
*    DATA lv_p3 TYPE REF TO data.
*
*    CREATE DATA lv_p3
*        TYPE HANDLE lv_p_handle.
*
*    ASSIGN  lv_p3->* TO <lv_p3>.
*
*    <lv_p3> =  <lv_p> - <lv_p2>.
*    DO lv_count_decimals + 1 TIMES.
*      <lv_p3> = <lv_p3> * 10.
*    ENDDO.
*
*    IF <lv_p3> <= 4.
*      lv_sign = '-'.
*    ELSE.
*      lv_sign = '+'.
*    ENDIF.


    CALL FUNCTION 'ROUND'
      EXPORTING
        decimals      = lv_count_decimals
        input         = <lv_p>
        sign          = 'X' "lv_sign
      IMPORTING
        output        = <lv_p>
      EXCEPTIONS
        input_invalid = 1
        overflow      = 2
        type_invalid  = 3
        error_message = 4
        OTHERS        = 5.
    IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
    so_help->raise_check( function = 'X' ).

    so_help->conv( EXPORTING i_any    = <lv_p>
                   IMPORTING r_result = e_result ).

    RETURN.


*        ENDIF.

  ENDMETHOD.


  METHOD conv_unit.

    DATA lv_p_in  TYPE p LENGTH 16 DECIMALS 6.
    DATA lv_p_out TYPE p LENGTH 16 DECIMALS 6.

    so_help->conv(
      EXPORTING
        i_any          = i_any
        raise_error    = abap_true
      IMPORTING
        r_result       = lv_p_in
    ).

    CALL FUNCTION 'UNIT_CONVERSION_SIMPLE'
      EXPORTING
        input                = lv_p_in   " Eingabewert
*       no_type_check        = 'X'    " Typprüfung für Umrechnungsfaktoren
*       round_sign           = SPACE    " Kennzeichen für Rundung (+ auf, - ab, X kaufm.)
        unit_in              = i_unit_in    " Einheit des Eingabewertes
        unit_out             = i_unit_out "SPACE    " Einheit des Ausgabewertes
      IMPORTING
*       add_const            =     " additive Konstante für die Umrechnung
*       decimals             =     " Anzahl Dezimalen für die Rundung
*       denominator          =     " Nenner für die Umrechnung
*       numerator            =     " Zähler für die Umrechnung
        output               = lv_p_out   " Ausgabewert
      EXCEPTIONS
        conversion_not_found = 1
        division_by_zero     = 2
        input_invalid        = 3
        output_invalid       = 4
        overflow             = 5
        type_invalid         = 6
        units_missing        = 7
        unit_in_not_found    = 8
        unit_out_not_found   = 9
        error_message        = 10
        OTHERS               = 11.
    IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
    so_help->raise_check( function = 'X').

    so_help->conv(
      EXPORTING
        i_any          = lv_p_out
        raise_error    = abap_true
      IMPORTING
        r_result       = e_result
    ).



  ENDMETHOD.

  METHOD is_range_valid.



    FIELD-SYMBOLS:
      <sign>   TYPE any,
      <option> TYPE any,
      <low>    TYPE any,
      <high>   TYPE any.

    DATA:
      lv_typename TYPE string,
      lv_descr    TYPE string.

    TRY.


        CASE  so_help->get( rtti_kind = 'X' i_any = i_any ).

          WHEN cl_abap_typedescr=>kind_table.

            FIELD-SYMBOLS: <lt_any> TYPE ANY TABLE.
            FIELD-SYMBOLS: <ls_any> TYPE any.

            ASSIGN i_any TO <lt_any>.

            LOOP AT <lt_any> ASSIGNING <ls_any>.

              r_result = is_range_valid( i_any = <ls_any> ).

              IF r_result = abap_false.
                RETURN.
              ENDIF.

            ENDLOOP.

            RETURN.

          WHEN OTHERS.
            r_result = abap_false.
            RETURN.

        ENDCASE.


        """""""""""""""""""""""""""""""""""""""""""""""""""
        " Struktur prüfen

        ASSIGN ('I_ANY-OPTION') TO <option>.
        ASSIGN ('I_ANY-SIGN')   TO <sign>.
        ASSIGN ('I_ANY-HIGH')   TO <high>.
        ASSIGN ('I_ANY-LOW')    TO <low>.


        IF <option> IS NOT ASSIGNED
          OR <sign> IS NOT ASSIGNED
          OR <high> IS NOT ASSIGNED
          OR <low> IS NOT ASSIGNED.
          r_result = abap_false.
          RETURN.
          "d 1x  208 fehler: die übergebene tabelle ist keine ranges-tabelle!
*          so_help->so_cx_factory->raise_msg( iv_msgid = '1X' iv_msgno = 208 ).
*          so_help->raise( iv_id = '1X' iv_no = '208' ).
        ENDIF.

*        so_help->so_abap->rtts_get_info_simple(
*            EXPORTING
*              iv_element      = <low>
*            IMPORTING
*              ev_typename     = lv_typename
*              ev_scrtext_s    = lv_descr ).
*        CONCATENATE lv_descr '(' lv_typename ')' INTO lv_typename.


        """""""""""""""""""""""""""""""""""""""""""""""""""
        " Validieren

        IF  <option> <> 'EQ'
        AND <option> <> 'GE'
        AND <option> <> 'CP'
        AND <option> <> 'BT'
        AND <option> <> 'NE'
        AND <option> <> 'LT'
        AND <option> <> 'GT'
        AND <option> <> 'NP'
        AND <option> <> 'NB'.

          "RSPLS  600 Range-Eintrag &1 zu Merkmal &2 ist fehlerhaft. Feld &3 ist nicht gültig.
*          so_help->so_cx_factory->raise_msg( iv_msgid = 'RSPLS' iv_msgno = 600 iv_v1 = 'OPTION'
*                      iv_v2 =  lv_typename iv_v3 = <option> ).
          RETURN.

        ENDIF.

        IF <sign> <> 'I'
        AND <sign> <> 'E'.

          "RSPLS  600 Range-Eintrag &1 zu Merkmal &2 ist fehlerhaft. Feld &3 ist nicht gültig.
*          so_help->so_cx_factory->raise_msg( iv_msgid = 'RSPLS' iv_msgno = 600 iv_v1 = '_' iv_v2 = 'SIGN' iv_v3 = <sign> ).
          RETURN.

        ENDIF.


        r_result = abap_true.


        """"""""""""""""""""""""""""""""""""""""""""
        " Fehlerbehandlung

        DATA: lx_t100 TYPE REF TO cx_t100_msg.
      CATCH cx_t100_msg INTO lx_t100.

*        IF <low> IS ASSIGNED.
*          "  D  1X  207 Fehler in der Ranges-Tabelle &!
*          so_help->so_cx_factory->raise_msg( iv_msgid = '1X' iv_msgno = 207
*          iv_v1 = lv_typename io_previous = lx_t100 ).
*
*        ELSE.
*          RAISE EXCEPTION lx_t100.
*        ENDIF.

    ENDTRY.



  ENDMETHOD.

  METHOD http_request_get.



    DATA:
      lv_host TYPE string,
      lv_uri  TYPE string,
      lv_v1   TYPE string, lv_v2 TYPE string, lv_v3 TYPE string, lv_v4 TYPE string.

    lv_host = iv_host.
    lv_uri  = iv_uri.


* Method-Local Data Declarations:
    DATA: lo_http_client TYPE REF TO if_http_client.

    cl_http_client=>create_by_url(
      EXPORTING
        url                =  lv_host   " URL
      IMPORTING
        client             =  lo_http_client   " HTTP Client Abstraction
      EXCEPTIONS
        argument_not_found = 1
        plugin_not_active  = 2
        internal_error     = 3
        OTHERS             = 4
    ).
    IF sy-subrc <> 0.
      lv_v1 = sy-msgv1.  lv_v2 = sy-msgv2.  lv_v3 = sy-msgv3.  lv_v4 = sy-msgv4.
      RAISE EXCEPTION TYPE cx_t100_msg
        EXPORTING
          t100_msgid = sy-msgid
          t100_msgno = sy-msgno
          t100_msgv1 = lv_v1
          t100_msgv2 = lv_v2
          t100_msgv3 = lv_v3
          t100_msgv4 = lv_v4.
    ENDIF.





    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    lo_http_client->request->set_method(
    if_http_request=>co_request_method_get ).

    IF iv_authenticate_name IS NOT INITIAL AND iv_authenticate_pw IS NOT INITIAL.
      lo_http_client->authenticate( username = iv_authenticate_name
                             password = iv_authenticate_pw ).

      lo_http_client->propertytype_logon_popup =  lo_http_client->co_enabled.

    ENDIF.

    lo_http_client->request->set_version( version = if_http_request=>co_protocol_version_1_0 ).


    lo_http_client->request->set_header_field( name  = '~request_method'
                                        value = 'GET' ).

    lo_http_client->request->set_header_field( name  = 'CONTENT-TYPE'
                                         value = 'text/xml; charset=utf-8' ).

    lo_http_client->request->set_header_field( name  = 'ACCEPT'
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
      lv_v1 = sy-msgv1.  lv_v2 = sy-msgv2.  lv_v3 = sy-msgv3.  lv_v4 = sy-msgv4.
      RAISE EXCEPTION TYPE cx_t100_msg
        EXPORTING
          t100_msgid = sy-msgid
          t100_msgno = sy-msgno
          t100_msgv1 = lv_v1
          t100_msgv2 = lv_v2
          t100_msgv3 = lv_v3
          t100_msgv4 = lv_v4.
    ENDIF.

* Receive the results:
    CALL METHOD lo_http_client->receive
      EXCEPTIONS
        http_communication_failure = 1
        http_invalid_state         = 2
        http_processing_failed     = 3
        OTHERS                     = 4.
    IF sy-subrc <> 0.
      lv_v1 = sy-msgv1.  lv_v2 = sy-msgv2.  lv_v3 = sy-msgv3.  lv_v4 = sy-msgv4.
      RAISE EXCEPTION TYPE cx_t100_msg
        EXPORTING
          t100_msgid = sy-msgid
          t100_msgno = sy-msgno
          t100_msgv1 = lv_v1
          t100_msgv2 = lv_v2
          t100_msgv3 = lv_v3
          t100_msgv4 = lv_v4.
    ENDIF.


    DATA: lv_http_rc TYPE i, lv_reason TYPE string.
    lo_http_client->response->get_status( IMPORTING
                                          code   = lv_http_rc
                                          reason = lv_reason ).

*    rs_result-http_code = lv_http_rc.
*    rs_result-http_text = lv_reason.
*    rs_result-result    = lo_http_client->response->get_cdata( ).


    lo_http_client->close( ).

  ENDMETHOD.


  METHOD popup_alv_f4.

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

*    IF iv_uname IS SUPPLIED.
    ls_variant-username = iv_uname.
*    ELSE.
**      ls_variant-username = cl_abap_syst=>get_user_name( ).
*    ENDIF.

    ls_variant-handle = iv_handle.


    """""""""""""""""""""""""""""""""""
    " Check

    IF ls_variant-report IS INITIAL.
*      lcl_help_factory_all=>so_error->raise_text(
*          'Kein Reportnamen übergeben' ).
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
        error_message   = 2
        OTHERS          = 3.
    IF sy-subrc <> sy-subrc. sy-subrc = sy-subrc. ENDIF. "SLINT Check OK withoput pragma
    so_help->raise_check(  function = 'X' ).
*    lcl_help_factory_all=>so_check_a_raise->after_function( is_sy = sy ).

* ---------------------------------------------------------------------
* Usereingabe übernehmen

    IF ls_variant-variant NE ' '.
      rv_vari = ls_variant-variant.
    ELSE.
*      rv_vari = iv_vari.
    ENDIF.


    """"""""""""""""""""""""""""""""
    " Fehlerbehandlung

*        DATA: lx_ro<ot TYPE REF TO cx_root.
*      CATCH cx_root INTO lx_root.
*        lcl_help_factory_all=>so_gui->popup_exception(  lx_root ).
*    ENDTRY.

  ENDMETHOD.                    "get_layout_f4_help




  METHOD gui_popup_bal_tab.

    DATA:
*      ls_bapi TYPE bapiret2,
      lt_bapi TYPE bapiret2_tab.

    TYPE-POOLS: icon.

    TYPES:
      BEGIN OF ty_s_output,
        type  TYPE string,
        datum TYPE sy-datum,
        uzeit TYPE sy-uzeit,
        no    TYPE bapiret2-number,
        id    TYPE bapiret2-id,
        text  TYPE bapiret2-message,
      END OF ty_s_output.

    FIELD-SYMBOLS:
        <ls_out> TYPE ty_s_output.


    """""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ausgabetabelle bauen

    TRY.

        DATA:
         lt_output TYPE STANDARD TABLE OF ty_s_output.
        FREE lt_output.
*        APPEND INITIAL LINE TO lt_output.

        LOOP AT i_any INTO DATA(ls_bal).


          APPEND INITIAL LINE TO lt_output ASSIGNING <ls_out>.
          <ls_out>-text = so_help->get( text = 'X' i_any = ls_bal ).

*          IF  <ls_output>-text IS INITIAL.
*            <ls_output>-text = ls_bapi-message.
*          ENDIF.
          CASE ls_bal-msgty.
            WHEN 'E'.
              <ls_out>-type = icon_led_red.
            WHEN 'S'.
              <ls_out>-type = icon_led_green.
            WHEN 'I'.
              <ls_out>-type = icon_message_information.
            WHEN 'W'.
              <ls_out>-type = icon_led_yellow.
          ENDCASE.

          <ls_out>-id = ls_bal-msgid.
          <ls_out>-no = ls_bal-msgno.

          CONVERT TIME STAMP ls_bal-time_stmp TIME ZONE 'CET' INTO DATE <ls_out>-datum TIME <ls_out>-uzeit.

        ENDLOOP.
*break-point.

        so_help->itab(
          EXPORTING
*            delete_duplicates  =
            change_sequence    = 'X'
*            move_corresponding =
*            merge              =
*            raise_error        = ABAP_FALSE
          CHANGING
            ct_tab             = lt_output
        ).
*        sort lt_output by datum uzeit descending.

*        APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
*        APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
*        APPEND INITIAL LINE TO lt_output ASSIGNING <ls_output>.
*        "O0 003 Bitte wählen Sie eine Zeile mit dem Doppelklick (F2)
*        <ls_output>-text = so_help->get( text = 'X' i_any = '003(O0)' ).
**        CONCATENATE '*' <ls_output>-text  INTO <ls_output>-text .


        """""""""""""""""""""""""""""""""""""""""""""""""""""
        " ALV bauen

*        DATA:
*          ls_event       TYPE so_help->ty_s_alv_event.
*          lt_col_setting TYPE STANDARD TABLE OF so_help->ty_s_alv_column_setting, "lo_alv->ty_s_setup,
*          ls_col         TYPE so_help->ty_s_alv_column_setting.

*        FREE ls_col.
*        ls_col-name = 'TEXT'.
*        ls_col-out_length = '120'.
*        APPEND ls_col TO lt_col_setting.
*
*        FREE ls_col.
*        ls_col-name = 'TYPE'.
*        ls_col-is_icon = abap_true.
*        ls_col-out_length = '2'.
*        APPEND ls_col TO lt_col_setting.
*
*        FREE ls_col.
*        ls_col-name = 'ID'.
*        ls_col-out_length = '5'.
*        ls_col-is_tech = abap_true.
*        APPEND ls_col TO lt_col_setting.
*
*        FREE ls_col.
*        ls_col-name = 'NO'.
*        ls_col-out_length = '3'.
*        ls_col-is_tech = abap_true.
*        APPEND ls_col TO lt_col_setting.


        """"""""""""""""""""""""""""""""""""""""
        " Anzeige


        DATA lv_line_end TYPE i.

        IF lines(  lt_output ) > 11.
          lv_line_end = 25.
        ELSEIF lines(  lt_output ) > 20.
          lv_line_end = 45.
        ELSE.
          lv_line_end = 20.
        ENDIF.


        DO.

          so_help->popup(
            EXPORTING
              it_table              = lt_output
              iv_title              =  so_help->get( text = 'X' i_any = '011(N2ALL)' ) "Protokoll
*              iv_vertical_lines     = abap_false
*              iv_headers_visible    = abap_false
*            iv_raise_double_click = abap_true
*            iv_raise_hotspot      = abap_true
*            it_hide = VALUE #(  (  `NO` ) (  `ID` )  )
            it_outlen = VALUE #(  (  name = 'TYPE' value = '1' )
                                  (  name = 'TEXT' value = '115' )
                                  (  name = 'ID' value = '6' )
                                  (  name = 'UZEIT' value = '8' )
                                  (  name = 'DATUM' value = '10' )
                                  )
*              it_col_setting        = lt_col_setting
*            it_sort               =
*            iv_optimize_colwidth  = abap_false
*            iv_col_start          = '10'
*            iv_col_end            = '160'
            iv_line_start         = '1'
            iv_line_end           = lv_line_end
                  iv_default_toolbar = abap_true
        is_layout = VALUE disvariant( handle = 'POPUP_BAL' report = sy-repid )
      iv_layout_restriction = if_salv_c_layout=>restrict_user_dependant
            IMPORTING
              ev_event_type = DATA(lv_type) "s_event              = ls_event
                ev_event_row = DATA(lv_row)
          ).

*          lo_alv->ms_salv-o_salv->display( ).

          IF lv_type = so_help->cs-s_alv_event_type-double_click. "is_double_click = abap_true.
*            READ TABLE it_bapi INTO ls_bapi
*                INDEX lv_row - 1.
*            IF sy-subrc = 0.
*              FREE lt_bapi.
*              APPEND ls_bapi TO lt_bapi.
*            popup_table( it_bapi ).
*            ENDIF.
          ELSE.
            EXIT.
          ENDIF.

        ENDDO.


        """""""""""""""""""""""""""""""
        " Fehlerbehandlung
        DATA: lx_root TYPE REF TO cx_root.
      CATCH cx_root INTO lx_root.
        "D  NF1 060 Popup wurde abgebrochen
*        mo_help->so_error->raise_msg( iv_id = 'NF1' iv_no = '060' io_previous = lx_salv ) .
    ENDTRY.


  ENDMETHOD.


  METHOD popup_json.

  ENDMETHOD.


  METHOD popup_cust.

    FIELD-SYMBOLS <lv_key1_user> TYPE string.
    FIELD-SYMBOLS <lv_key2_user> TYPE string.
    FIELD-SYMBOLS <ls_user> TYPE any.
    FIELD-SYMBOLS <ls_user_b> TYPE any.

    FIELD-SYMBOLS <lv_key1_gen> TYPE string.
    FIELD-SYMBOLS <lv_key2_gen> TYPE string.
    FIELD-SYMBOLS <ls_gen> TYPE any.
    FIELD-SYMBOLS <ls_gen_b> TYPE any.
    FIELD-SYMBOLS <ls_cust> TYPE any.

    ASSIGN i_any->('KEY1_USER') TO <lv_key1_user>.
    ASSIGN i_any->('KEY2_USER') TO <lv_key2_user>.
    ASSIGN i_any->('S_USER') TO <ls_user>.
    ASSIGN i_any->('S_USER_BACKUP') TO <ls_user_b>.
    ASSIGN i_any->('KEY1_GEN') TO <lv_key1_gen>.
    ASSIGN i_any->('KEY2_GEN') TO <lv_key2_gen>.
    ASSIGN i_any->('S_GEN') TO <ls_gen>.
    ASSIGN i_any->('S_GEN_BACKUP') TO <ls_gen_b>.
    ASSIGN i_any->* TO <ls_cust>.

    DO.
      DATA lv_index TYPE string.

      lv_index = so_help->get( popup_choose    = 'X'
                            i_any = VALUE stringtab(
                                   ( `USER_CUSTOMIZING`)
                                   ( `USER_CUSTOMIZING_RESET` )
                                   ( `GENERAL_CUSTOMIZING`)
                                   ( `GENERAL_CUSTOMIZING_RESET`)
                                   ( `CUSTOMIZING` ) )
                            i_any2 = lv_index ).

      TRY.

          CASE lv_index.

            WHEN '1'.

              so_help->gui( EXPORTING popup_json = 'X' i_any = <ls_user>
                           IMPORTING e_any = <ls_user> ).

              CASE sy-ucomm.

                WHEN 'WB_SAVE'.

                  so_help->db_update(
                      all         = 'X'
                      i_key1      = <lv_key1_user>
                      i_key2      = <lv_key2_user>
                      i_key3      = sy-uname
                      i_any       = <ls_user> "ss_cust-s_user
                      commit      = abap_true
                  ).

                  so_help->gui( popup_info = 'X' i_any = 'DB_UPDATE_SUCCESSFUL' ).

                WHEN OTHERS.
*              lcl_help=>gui( popup_info = 'X' i_any = 'Aktion abgebrochen' ).
              ENDCASE.

            WHEN '2'.

              so_help->db_delete(
                  all         = 'X'
                  i_key1      = <lv_key1_user>
                  i_key2      = <lv_key2_user>
                  i_key3      = sy-uname
                  raise_error = abap_true
                  commit      = abap_true
               ).

              <ls_user> = <ls_user_b>.
              so_help->gui( popup_info = 'X' i_any = 'DB_UPDATE_SUCCESSFUL' ).


            WHEN '3'.

              so_help->gui( EXPORTING popup_json = 'X' i_any =  <ls_gen>
                            IMPORTING e_any = <ls_gen> ).

              CASE sy-ucomm.

                WHEN 'WB_SAVE'.

                  so_help->db_update(
                      all         = 'X'
                      i_key1      = <lv_key1_gen>
                      i_key2      = <lv_key2_gen>
                      i_any       = <ls_gen>
                      commit      = abap_true
                  ).

                  so_help->gui( popup_info = 'X' i_any = 'DB_UPDATE_SUCCESSFUL' ).

                WHEN OTHERS.
*              lcl_help=>gui( popup_info = 'X' i_any = 'Aktion abgebrochen' ).
              ENDCASE.


            WHEN '4'.

              so_help->db_delete(
                   all         = 'X'
                   i_key1      = <lv_key1_gen>
                   i_key2      = <lv_key2_gen>
                   raise_error = abap_true
                   commit      = abap_true
                ).

              <ls_gen> = <ls_gen_b>.
              so_help->gui( popup_info = 'X' i_any = 'DB_UPDATE_SUCCESSFUL' ).


            WHEN '5'.

              so_help->gui( EXPORTING popup_json = 'X' i_any =  <ls_cust>
                            IMPORTING e_any = <ls_cust> ).


            WHEN OTHERS.
              EXIT.

          ENDCASE.

        CATCH cx_root INTO DATA(lx_root).
          so_help->gui( lx_root ).
      ENDTRY.
    ENDDO.

  ENDMETHOD.


  METHOD init_cust.

    FIELD-SYMBOLS <lv_key1_user> TYPE string.
    FIELD-SYMBOLS <lv_key2_user> TYPE string.
    FIELD-SYMBOLS <ls_user> TYPE any.
    FIELD-SYMBOLS <ls_user_b> TYPE any.

    FIELD-SYMBOLS <lv_key1_gen> TYPE string.
    FIELD-SYMBOLS <lv_key2_gen> TYPE string.
    FIELD-SYMBOLS <ls_gen> TYPE any.
    FIELD-SYMBOLS <ls_gen_b> TYPE any.
    FIELD-SYMBOLS <ls_cust> TYPE any.

    DATA e_any TYPE REF TO data.

    e_any = REF #(  e_any2 ).

    ASSIGN e_any->('KEY1_USER') TO <lv_key1_user>.
    ASSIGN e_any->('KEY2_USER') TO <lv_key2_user>.
    ASSIGN e_any->('S_USER') TO <ls_user>.
    ASSIGN e_any->('S_USER_BACKUP') TO <ls_user_b>.
    ASSIGN e_any->('KEY1_GEN') TO <lv_key1_gen>.
    ASSIGN e_any->('KEY2_GEN') TO <lv_key2_gen>.
    ASSIGN e_any->('S_GEN') TO <ls_gen>.
    ASSIGN e_any->('S_GEN_BACKUP') TO <ls_gen_b>.
    ASSIGN e_any->* TO <ls_cust>.

    <ls_user_b> = <ls_user>.
    <ls_gen_b> = <ls_gen>.

    TRY.
        so_help->db_read(
          EXPORTING
            all         = 'X'
            i_key1      = <lv_key1_user>
            i_key2      = <lv_key2_user>
            i_key3      = sy-uname
            raise_error = 'X'
          IMPORTING
            e_result    = <ls_user>
        ).
      CATCH cx_root.
    ENDTRY.

    TRY.
        so_help->db_read(
          EXPORTING
            all         = 'X'
            i_key1      = <lv_key1_gen>
            i_key2      = <lv_key2_gen>
            raise_error = 'X'
          IMPORTING
            e_result    = <ls_gen>
        ).
      CATCH cx_root.
    ENDTRY.


  ENDMETHOD.


  METHOD mock_data.

    FIELD-SYMBOLS <table> TYPE STANDARD TABLE.
    FIELD-SYMBOLS <struct> TYPE any.
    FIELD-SYMBOLS <elem> TYPE any.
    DATA lv_index TYPE sy-index.

    CASE so_help->get( rtti_kind = 'X' i_any = e_mock ).

      WHEN cl_abap_datadescr=>kind_table.

        ASSIGN e_mock TO <table>.
        DO 10 TIMES.
          APPEND INITIAL LINE TO <table> ASSIGNING <struct>.
          mock_data( importing e_mock = <struct> ).
        ENDDO.


      WHEN cl_abap_datadescr=>kind_struct.

        DO.
          ASSIGN COMPONENT sy-index OF STRUCTURE e_mock TO <elem>.
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.
          mock_data( importing e_mock = <elem> ).
        ENDDO.

      WHEN cl_abap_datadescr=>kind_elem.

        CASE so_help->get( rtti_type_kind = 'X' i_any = e_mock ).

          WHEN
             cl_abap_datadescr=>typekind_string OR
             cl_abap_datadescr=>typekind_char OR
             cl_abap_datadescr=>typekind_csequence.

            e_mock = 'ABCDEFGHIJKLMNOPQRSTUVW'.

          WHEN
             cl_abap_datadescr=>typekind_num OR
             cl_abap_datadescr=>typekind_numeric.

            e_mock = '123456789101112131415161718191'.

          WHEN
              cl_abap_datadescr=>typekind_int OR
              cl_abap_datadescr=>typekind_int1 OR
              cl_abap_datadescr=>typekind_int2. " OR
*              cl_abap_datadescr=>typekind_int8.

             DATA(o_rnd) = NEW cl_random_number( ).
             o_rnd->if_random_number~init( ).
            e_mock = o_rnd->if_random_number~get_random_int( 100 ).


        ENDCASE.
    ENDCASE.

  ENDMETHOD.

ENDCLASS.

CLASS lcl_rfc_control DEFINITION.

  PUBLIC SECTION.
    CLASS-METHODS class_constructor.

    METHODS start_new_task
      IMPORTING
        iv_method_name TYPE any
        if_object      TYPE REF TO if_serializable_object
      EXPORTING
        ei_object      TYPE any.


    METHODS on_task_completed
      IMPORTING
        !p_task TYPE clike .

  PROTECTED SECTION.

    CLASS-DATA so_help TYPE lcl_help=>ty_o_easy_abap.

    METHODS wait_for_free_task .

    TYPES:
      BEGIN OF ty_s_name_int_string_pair,
        name  TYPE i,
        value TYPE string,
      END OF ty_s_name_int_string_pair.

    DATA mt_result TYPE STANDARD TABLE OF ty_s_name_int_string_pair WITH EMPTY KEY.

    DATA:
    mt_error TYPE STANDARD TABLE OF REF TO cx_root .
    DATA mt_log TYPE stringtab .
    DATA mv_tasks_started TYPE i .
    DATA mv_tasks_completed TYPE i .
    DATA mv_tasks_running  TYPE i .
    DATA mv_tasks_max      TYPE i VALUE 4.
*    DATA mv_function_name TYPE string VALUE 'ZSTC_PBT_CALL'. "#EC NOTEXT .
    DATA mv_classname_background_task TYPE string .

    METHODS call_function_in_new_task
      IMPORTING
        !iv_id         TYPE i
        !iv_xdata      TYPE string
        iv_method_name TYPE string.

  PRIVATE SECTION.
    METHODS:
      zzz_vorlage_fm_rfc_call.

ENDCLASS.

CLASS lcl_rfc_control IMPLEMENTATION.

  METHOD class_constructor.
    CREATE OBJECT so_help.
  ENDMETHOD.

  METHOD start_new_task.

    DATA lv_object_json TYPE string.
    DATA lv_object_json_result TYPE string.
    DATA lv_task_id TYPE i.
    DATA ls_result TYPE ty_s_name_int_string_pair.
    DATA li_serial TYPE REF TO if_serializable_object.

    TRY.

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "Vorbereitung

        so_help->trans(
          EXPORTING
            json               = 'X'
            i_any              = if_object
            raise_error        = abap_true
          IMPORTING
            e_result           = lv_object_json
        ).

        so_help->trans(
          EXPORTING
            zip                = 'X'
            i_any              = lv_object_json
            raise_error        = abap_true
          IMPORTING
            e_result           = lv_object_json
        ).


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "Aufruf im New Task

        lv_task_id = 1.

        "Aufruf
        call_function_in_new_task(
            iv_id          = lv_task_id
            iv_xdata       = lv_object_json
            iv_method_name = iv_method_name ).


        "Warten, bis alle Prozesse erledigt sind
        WAIT UNTIL
            mv_tasks_started = mv_tasks_completed.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "Nachbearbeitung

        READ TABLE mt_result INTO ls_result
            WITH KEY
             name = lv_task_id.
        so_help->raise_check( read_table = 'X' ).

        so_help->trans(
          EXPORTING
            unzip              = 'X'
            i_any              = ls_result-value
            raise_error        = abap_true
          IMPORTING
            e_result           = lv_object_json_result
        ).

        so_help->trans(
        EXPORTING
          json_2             = 'X'
          i_any              = lv_object_json_result
          raise_error        = abap_true
        IMPORTING
          e_result           = li_serial
       ).

        ei_object ?= li_serial.

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "Fehlerbehandlung

      CATCH cx_root INTO DATA(lx_root).
        so_help->raise(
                i_any = 'ZCX_RFC_NEW_TASK_ERROR'
                i_prev = lx_root ).
    ENDTRY.

  ENDMETHOD.

  METHOD call_function_in_new_task.


    DATA:
      lv_text TYPE text200,
*      lo_help_cx TYPE REF TO lcl_help_cx,
      lx_t100 TYPE REF TO cx_t100_msg.



    IF abap_false = so_help->check( function_exist = 'X' i_any = lcl_help=>cv_rfc_function_name ).
      so_help->raise('ZCX_RFC_FUNCTION_NOT_FOUND_ERROR').
    ENDIF.


    """"""""""""""""""""""""""""""""""""""""""""
    " Parallelverarbeitung anstoßen

    so_help->raise('ZCX_RFC_FUNCTION_NOT_FOUND_ERROR').

*    CALL FUNCTION lcl_local_help=>cv_rfc_function_name
*      STARTING NEW TASK iv_id
*      DESTINATION IN GROUP DEFAULT
*      CALLING on_task_completed
*      ON END OF TASK
*      EXPORTING
*        iv_object             = iv_xdata
*        iv_method_name        = iv_method_name
*      EXCEPTIONS
*        communication_failure = 1 MESSAGE lv_text
*        system_failure        = 2 MESSAGE lv_text
*        resource_failure      = 3
*        OTHERS                = 4.

    IF sy-subrc <> 0.
*      CREATE OBJECT lo_help_cx.
*      lx_t100 = lo_help_cx->factory_t100_function( sy ).
*      APPEND lx_t100 TO mt_error.
*      raise exception lx_t100.
    ENDIF.
*    endif.

    """"""""""""""""""""""""""""""""""""""""""""
    " Steuerungsvariablen aktualisieren

    ADD 1 TO mv_tasks_started.
    ADD 1 TO mv_tasks_running.


  ENDMETHOD.

  METHOD on_task_completed.


    DATA:
      lv_text  TYPE c LENGTH 80,
      lv_xdata TYPE xstring,
*      lo_help_cx TYPE REF TO lcl_help_cx,
      lx_t100  TYPE REF TO cx_t100_msg,
      lv_task  TYPE i.
    DATA ls_result TYPE ty_s_name_int_string_pair.
*    CREATE OBJECT lo_help_cx.

    ls_result-name = p_task.

    """"""""""""""""""""""""""""""""""""""""""""
    "Ergebnis abholen

    RECEIVE RESULTS FROM FUNCTION lcl_help=>cv_rfc_function_name "'ZZ_PARALLEL_CALL'
    IMPORTING
        ev_object = ls_result-value
    EXCEPTIONS
        communication_failure = 1 MESSAGE lv_text
        system_failure = 2 MESSAGE lv_text
        OTHERS = 3.

    IF sy-subrc <> 0.
*      lx_t100 = lo_help_cx->factory_t100_sy( sy ).
*      APPEND lx_t100 TO mt_error.
    ENDIF.


    """"""""""""""""""""""""""""""""""""""""""
    " Daten abspeichern

    INSERT ls_result INTO TABLE mt_result.


    """"""""""""""""""""""""""""""""""""""""""""
    " Steuerungsvariablen aktualisieren

    ADD 1 TO mv_tasks_completed.
    SUBTRACT 1 FROM mv_tasks_running.


  ENDMETHOD.


  METHOD wait_for_free_task.


    DATA:
      lv_free_tasks TYPE i.

    DO.

      "Maximale Anzahl der Tasks erreicht?
      IF mv_tasks_max > 0 AND mv_tasks_running >= mv_tasks_max.

        "Zu viele Prozesse: warten, bis nächster Prozess frei wird
        WAIT
        UNTIL mv_tasks_running < mv_tasks_max.

      ENDIF.

      "Anzahl der aktuell freien Dialogprozesse ermitteln
      CALL FUNCTION 'SPBT_GET_CURR_RESOURCE_INFO'
        IMPORTING
          free_pbt_wps = lv_free_tasks
        EXCEPTIONS
          OTHERS       = 3.
      IF sy-subrc <> 0. sy-subrc = 99. ENDIF. "SLIN check ok without pragma
      IF sy-subrc = 0 AND lv_free_tasks > 0.
        "Es ist mindestens ein freier Prozess vorhanden.
        EXIT. "Aus DO-Schleife
      ENDIF.

      "Kein freier Prozess vorhanden:
      "warten, bis einer frei wird
      WAIT UNTIL mv_tasks_running < mv_tasks_max.

    ENDDO.


  ENDMETHOD.

  METHOD zzz_vorlage_fm_rfc_call.

*FUNCTION zfm_rfc_call.
**"----------------------------------------------------------------------
**"*"Lokale Schnittstelle:
**"  IMPORTING
**"     VALUE(IV_OBJECT) TYPE  STRING
**"     VALUE(IV_METHOD_NAME) TYPE  STRING
**"  EXPORTING
**"     VALUE(EV_OBJECT) TYPE  STRING
**"----------------------------------------------------------------------
*
**  DATA li_object TYPE REF TO if_serializable_object.
*data lo_obj type ref to object.
*  DATA lv_object_json_result TYPE string.
*  DATA lv_object_json TYPE string.
*
*  DATA(so_help) = NEW zcl_034tmm_future_easy_abap( ).
*
*  so_help->trans(
*    EXPORTING
*      unzip              = 'X'
*      i_any              = iv_object
*      raise_error        = abap_true
*    IMPORTING
*      e_result           = lv_object_json_result
*  ).
*
*  so_help->trans(
*  EXPORTING
*    json_2             = 'X'
*    i_any              = lv_object_json_result
*    raise_error        = abap_true
*  IMPORTING
*    e_result           = lo_obj
* ).
*
**    data lo_obj type ref to object.
**    lo_obj = li_serial.
*    call method lo_obj->(iv_method_name).
*
*  so_help->trans(
*    EXPORTING
*      json               = 'X'
*      i_any              = lo_obj
*      raise_error        = abap_true
*    IMPORTING
*      e_result           = lv_object_json
*  ).
*
*  so_help->trans(
*    EXPORTING
*      zip                = 'X'
*      i_any              = lv_object_json
*      raise_error        = abap_true
*    IMPORTING
*      e_result           = lv_object_json
*  ).
*
*  ev_object = lv_object_json.
*
*ENDFUNCTION.

  ENDMETHOD.

ENDCLASS.
