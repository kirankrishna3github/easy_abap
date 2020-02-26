
class lcx_no_check definition deferred.
class lcl_help_gui definition deferred.

class lcl_help definition.

  public section.

    types ty_o_easy_abap type ref to zcl_easy_abap.
    types ty_o_easy_gui  type ref to lcl_help_gui.

    class-data so_help type ty_o_easy_abap.
    class-data lr_tab type ref to data.

    class-methods so10_write
      importing
        i_any    type any
        i_key1   type any
        i_key2   type any
        i_key3   type any
        i_key4   type any
        i_commit type abap_bool.

    class-methods convert_binary_2_xstring
      importing
        it_input        type solix_tab
      returning
        value(r_result) type xstring .

    class-methods convert_xstring_2_binary
      importing
        iv_input        type xstring
      returning
        value(r_result) type solix_tab.

    class-methods so10_read
      importing
        i_key1   type any
        i_key2   type any
        i_key3   type any
        i_key4   type any
      exporting
        e_result type data.

    class-methods:
      gos_read_object_list
        importing
          iv_instid        type any "sibflporb-instid    "= rels-instid_a. "p_instid.
          iv_typeid        type any "sibflporb-typeid " #"= rels-typeid_a . "p_typeid.
          iv_catid         type any "sibflporb-catid
        returning
          value(et_result) type obl_t_link.


    class-methods:
      gos_read_object_head
        importing
          is_link         type obl_s_link
        returning
          value(r_result) type sofolenti1
        .

    class-methods:
      gos_read_object_content
        importing
          is_link         type obl_s_link
        returning
          value(r_result) type xstring
        .


    class-methods gos_create_object
      importing
        iv_data           type xstring
        iv_filename_w_ext type any default 'example.pdf'
        iv_instid         type any "sibflporb-instid    "= rels-instid_a. "p_instid.
        iv_typeid         type any "sibflporb-typeid " #"= rels-typeid_a . "p_typeid.
        iv_catid          type any
        commit_work       type abap_bool default abap_false
        use_exceptions    type abap_bool default abap_true. "sibflporb-catid.

    class-methods gui_upload
      importing
        iv_type         type any default 'BIN'
        use_exceptions  type abap_bool default abap_true
      returning
        value(r_result) type xstring.

    class-methods gui_download
      importing
        iv_input         type xstring
        iv_filname_w_ext type any default 'example.pdf'
        iv_filter        type any default '(*.pdf)|*.pdf|'
        iv_type          type any default 'BIN'
        use_exceptions   type abap_bool default abap_true.
*            raising

    class-methods t100_get
      importing
        value(i_any)    type any
      returning
        value(r_result) type bapiret2_tab.


    class-methods rtts_get_fieldname_by_type_tab
      importing
        iv_typename     type clike
        iv_tabname      type clike
      returning
        value(r_result) type string.



    class-methods  http_request_get
      importing
        iv_host              type string default 'http://eloquentjavascript.net'
        iv_uri               type string default '/author'
        iv_authenticate_name type clike optional
        iv_authenticate_pw   type clike optional
      exporting
        ev_result            type string
      raising
        cx_t100_msg.


    class-methods t100_set
      importing
        it_bapi type bapiret2_tab
      exporting
        e_any   type any.
    class-methods rtts_get_comp_tab
      importing
        i_any               type any
      returning
        value(rt_component) type abap_component_tab.

    class-methods is_range_valid
      importing
        i_any           type any
      returning
        value(r_result) type abap_bool.


    class-methods:
      popup_clike_one_line
        importing
          it_text type string_table,

      popup_print
        importing
          it_text type string_table,

      gui_popup_t100
        importing
          it_bapi type bapiret2_tab,

      gui_popup_t100_ext
        importing
          it_bapi type bapiret2_tab,

      popup_table
        importing
          it_table type standard table,

      popup_f4_help
        importing
          !iv_name_search_help type string
          !iv_name_field       type string
        returning
          value(rv_resault)    type string,


      gui_popup_exception
        importing
          value(ix_root) type ref to cx_root
          print_date     type any optional,

      popup_choose
        importing
          iv_title        type any optional
          it_choices      type any
          i_sel           type any
        returning
          value(r_result) type string, "0 wenn cancel oder geschlossen

      popup_json_deep
        importing
          iv_serial type clike,

      popup_range
        importing
                  iv_any    type any
        exporting et_range  type standard table
                  ev_cancel type abap_bool, "DEFAULT abap_false,

      call_transaction
        importing
          !iv_transaction_name type clike
          !iv_field1_name      type clike optional
          !iv_field1_value     type clike optional
          !iv_field2_name      type clike optional
          !iv_field2_value     type clike optional
          !iv_field3_name      type clike optional
          !iv_field3_value     type clike optional.


    class-methods gui_popup_bal
      importing
        !iv_object    type clike
        !iv_subobject type clike optional
        !iv_extnumber type clike optional .
    class-methods gui_popup_xml
      importing
        i_iv_xml type string.
    class-methods gui_popup_inform
      importing
        is_bapi type bapiret2.

    class-methods gui_popup_pdf
      importing
        iv_file type xstring.

    class-methods gui_popup_confirm
      importing
        is_bapi         type bapiret2
      returning
        value(r_result) type abap_bool.

    class-methods:
      class_constructor,
      rtts_get_domrange
        importing
          iv_value type any
        exporting
          et_tab   type standard table,


      bal_read
        importing
          iv_object       type clike
          iv_subobject    type clike optional
          iv_extnumber    type clike optional
          iv_lognumber    type clike optional
        returning
          value(rt_balmt) type balm_t
        raising
          cx_t100_msg,

      bal_read_list
        importing
          iv_object      type clike
          iv_subobject   type clike optional
          iv_extnumber   type clike optional
        returning
          value(rt_list) type balhdr_t
        raising
          cx_t100_msg,

      rtts_is_in_domrange
        importing
          iv_any           type any
        returning
          value(rv_result) type abap_bool,


      popup_f4_help_tab
        importing
          iv_fieldname     type any
          it_table         type standard table
        returning
          value(rv_result) type string,

      data_2_params
        importing
          iv_repid         type clike default sy-repid
        returning
          value(rt_params) type rsparams_tt,

      data_2_single_value
        importing
          iv_repid         type clike default sy-repid
          iv_name          type clike
        returning
          value(rv_string) type string,


      data_2_struct
        importing
          iv_repid     type clike default sy-repid
        exporting
          es_structure type any,



      data_2_where_dirty
        importing
          iv_repid        type clike default sy-repid
          iv_tabname      type clike
        returning
          value(r_result) type string,

      data_2_where_join
        importing
          i_spfli         type clike
        returning
          value(r_result) type string,

      data_2_rangetab_dirty
        importing
          iv_repid         type clike default sy-repid
          iv_tabname       type clike
        returning
          value(rt_result) type rsds_frange_t,

      data_2_single_type_dirty
        importing
          i_ls_params_name type any
          iv_repid         type clike default sy-repid
        returning
          value(r_result)  type ref to cl_abap_datadescr,

      data_2_single_range
        importing
          iv_repid        type clike default sy-repid
          iv_name         type clike
        returning
          value(rt_range) type rsds_selopt_t,


      gui_popup_get_value
        importing
          !iv_title       type clike optional
          !iv_tab1        type clike
          !iv_field1      type clike
          !iv_value1      type clike optional
          !iv_is_input1   type abap_bool default abap_true
          !iv_tab2        type clike optional
          !iv_field2      type clike optional
          !iv_value2      type clike optional
          !iv_is_input2   type abap_bool default abap_true
          !iv_tab3        type clike optional
          !iv_field3      type clike optional
          !iv_value3      type clike optional
          !iv_is_input3   type abap_bool default abap_true
          !iv_tab4        type clike optional
          !iv_field4      type clike optional
          !iv_value4      type clike optional
          !iv_is_input4   type abap_bool default abap_true
          !iv_tab5        type clike optional
          !iv_field5      type clike optional
          !iv_value5      type clike optional
          !iv_is_input5   type abap_bool default abap_true
        exporting
          !ev_user_cancel type abap_bool
          !ev_value1      type any
          !ev_value2      type clike
          !ev_value3      type clike
          !ev_value4      type clike
          !ev_value5      type clike
        raising
          cx_t100_msg,

      popup_f4_help_vari_selscreen
        importing
          iv_repid         type clike default sy-repid
        returning
          value(rv_result) type string,
      source_code_get_fubaname
        importing
          it_source type string_table
        exporting
          e_v1      type string
          e_v2      type string
          e_v3      type string,
      source_code_get_readtable
        importing
          it_source       type string_table
        returning
          value(r_result) type string,
      source_code_get_selectname
        importing
          it_source       type string_table
        returning
          value(r_result) type string,

      bal_save
        importing
          i_any  type any
          i_any2 type clike optional
          is_log type bal_s_log,

      selscreen_struc_2_screen
        importing
          iv_repid        type any
          value(is_struc) type any.

    class-methods trans_params_2_struc
      importing
        it_params type rsparams_tt
      exporting
        es_struc  type any.

    class-methods: t100_get_w_text
      importing
        iv_text         type any
        iv_v1           type any optional
        iv_v2           type any optional
        iv_v3           type any optional
        iv_v4           type any optional
      returning
        value(r_result) type bapiret2.

    class-methods: t100_replace_placeholder
      importing
        is_bapi         type bapiret2
      returning
        value(r_result) type bapiret2,

      lock_set
        importing
          iv_val1       type any default sy-mandt
          iv_val2       type clike
          iv_val3       type clike optional
          iv_val4       type any   optional
          iv_lock       type clike
          iv_mode       type clike default 'E'
          iv_scope      type clike default '2'
          iv_is_collect type abap_bool default abap_false
        raising
          cx_t100_msg,

      lock_free
        importing
          iv_val1       type any default sy-mandt
          iv_val2       type clike
          iv_val3       type clike optional
          iv_val4       type any optional
          iv_lock       type clike
          iv_mode       type clike default 'E'
          iv_scope      type clike default '2'
          iv_is_collect type abap_bool default abap_false
        raising
          cx_t100_msg,

      lock_is_set
        importing
          iv_val           type clike
          iv_val2          type clike optional
          iv_val3          type clike optional
          iv_val4          type clike optional
*          iv_field         TYPE clike
          iv_lock          type clike
          iv_unam          type any default sy-uname
        returning
          value(rv_result) type abap_bool
        raising
          cx_t100_msg,

      lock_get_snap
        returning
          value(rt_result) type so_help->ty-t_seqg3
        raising
          cx_t100_msg,

      lock_set_snap
        importing
          it_snap type so_help->ty-t_seqg3
        raising
          cx_t100_msg,

      lock_collect_set
        raising
          cx_t100_msg,

      lock_collect_free,

      cx_set
        importing
          ix_no_check type ref to lcx_no_check
          ix_prev     type ref to cx_root,
      cx_no_2_static
        importing
          i_lx_no         type ref to cx_no_check
        returning
          value(r_result) type ref to cx_static_check,
      source_code_get_not_initial
        returning
          value(r_result) type string,
      get_convexit
        importing
          value(i_any)    type any
          !iv_type        type clike optional
          iv_exit         type any optional
          !iv_is_input    type abap_bool default abap_true
        returning
          value(r_result) type string .


    class-methods:   selscreen_set
      importing
        !i_any          type any optional
        value(iv_repid) type any optional
        !raise_error    type abap_bool default abap_false
          preferred parameter i_any ,

      selscreen_get
        importing
          value(iv_repid)       type any optional
          !iv_variant           type any optional
          !iv_multi_tabname     type clike optional
          !iv_single_fieldname  type any optional
          !iv_value_name        type any optional
          !raise_error          type abap_bool default abap_false
        exporting
          !et_range_multi_dirty type rsds_frange_t
          !et_range_single      type rsds_selopt_t
          !et_parameter         type rsparams_tt
          !ev_value             type clike
          !es_struc             type any ,

      write
        importing
          i_any           type any
        returning
          value(r_result) type string,

      handle_error
        importing
          ix_root      type ref to cx_root
          raise_assert type abap_bool optional
          raise_error  type abap_bool,

      round2
        importing
          i_any       type any
          iv_decimals type any
        exporting
          e_result    type any,

      conv_unit
        importing
          i_any      type any
          i_unit_in  type any
          i_unit_out type any
        exporting
          e_result   type any,

      popup_alv_f4
        importing
          iv_handle      type clike optional
          iv_uname       type clike optional
          iv_repid       type clike optional
        returning
          value(rv_vari) type string,

      gui_popup_bal_tab
        importing
          i_any type any table,

      gui_popup_bal_list_tab
        importing
          i_any type any table,

      popup_json
        importing
          i_any type any,

      popup_cust
        importing
          i_any type ref to data,

      init_cust
        exporting
          e_any2 type data,

      mock_data
        exporting
          e_mock type any.

    class-methods cfw_get_fcat
      importing
        it_table        type standard table
      returning
        value(r_result) type lvc_t_fcat .
    class-methods gui_get_screenshot
      returning
        value(r_result) type xstring.

    class-methods gui_popup_selscreen_dynamic
      importing
        iv_tabname              type clike
      returning
        value(rt_where_clauses) type rsds_twhere.
    class-methods service_file_read
      importing
        i_lv_directory  type string
      returning
        value(r_result) type xstring.
    class-methods service_file_update
      importing
        iv_direct type string
        i_data    type xstring.


  protected section.


    class-methods:
      lock_queue
        importing
          iv_is_lock     type abap_bool default abap_true "iv_fm_name TYPE clike
          value(iv_val1) type clike optional
          value(iv_val2) type clike optional
          value(iv_val3) type clike optional
          value(iv_val4) type clike optional
          iv_params      type clike optional
*          iv_field      TYPE clike
*          iv_tab        TYPE clike
          iv_lock        type clike
          iv_mode        type clike default 'E'
          iv_scope       type clike default '1'
          iv_is_collect  type abap_bool default abap_false
        raising
          cx_t100_msg.

    class-methods: lock_queue_get_parmtab
      importing
                it_import            type virsimp_tab
                iv_parms             type seqg3-garg optional
                iv_val1              type any optional
                iv_val2              type any optional
                iv_val3              type any optional
                iv_val4              type any optional
      returning value(rt_parameters) type abap_func_parmbind_tab
      raising
                cx_t100_msg.


endclass.


class lcl_help_gui_global definition.


  public section.

    types ty_o_easy_abap type lcl_help=>ty_o_easy_abap.
    types ty_o_easy_alv type ref to lcl_help_gui_global .

    types:
      begin of ty_s_event,
        type         type string,
        row          type i,
        col          type string,
        value        type string,
        line         type ref to data,
        sender       type ref to cl_salv_events,
        ucomm        type string,
        o_object     type ref to object,
        t_selections type salv_t_row,
      end of ty_s_event .
*    types:
*      begin of ty_s_col_setup,
*        name       type string,
*        is_tech    type abap_bool,
*        is_icon    type abap_bool,
*        is_hotspot type abap_bool,
*        is_button  type abap_bool,
*        out_length type string,
*        title      type string,
*        color      type string,
*      end of ty_s_col_setup .
*    types:
*      ty_t_setup type standard table of ty_s_col_setup with default key .
    types:
      begin of ty_s_option,
        title                    type string, " OPTIONAL
        vertical_lines           type abap_bool, " DEFAULT abap_true
        headers_visible          type abap_bool, " DEFAULT abap_true
        raise_double_click       type abap_bool, " DEFAULT abap_true
        t_raise_hotspot          type stringtab , "DEFAULT abap_true
        raise_after_data_changed type abap_bool , "DEFAULT abap_true
        raise_f4                 type abap_bool , "DEFAULT abap_true
        t_col_setting            type lcl_help=>so_help->ty-ty_t_setup, " OPTIONAL
        t_hide                   type stringtab, " OPTIONAL
        t_sort                   type stringtab, " OPTIONAL
        t_edit                   type stringtab, " OPTIONAL
        t_raise_f4               type stringtab,
        optimize_colwidth        type abap_bool, " DEFAULT abap_falseA
        default_toolbar          type abap_bool,
        t_toolbar                type ttb_button,
        t_outlen                 type name2stringvalue_table,
        selmode                  type string,
        layout_restriction       type string,
        s_layout                 type disvariant,
        name_row_color           type string,
        name_row_style           type string,
        t_toolbar_hide           type stringtab,
      end of ty_s_option .
    types:
      begin of ty_s_log_output,
        icon_status type c length 4,
        number      type bapiret2-number,
        id          type bapiret2-id,
        message     type bapiret2-message,
        type        type bapiret2-type,
        time        type t,
        date        type d,
        t_color     type lvc_t_scol,
        message_v1  type bapiret2-message_v1,
        message_v2  type bapiret2-message_v2,
        message_v3  type bapiret2-message_v3,
        message_v4  type bapiret2-message_v4,
      end of ty_s_log_output .

    data:
      begin of ms_salv,
        o_salv       type ref to cl_salv_table,
        o_columns    type ref to cl_salv_columns_table,
        o_settings   type ref to cl_salv_display_settings,
        o_functions  type ref to cl_salv_functions_list,
        o_events     type ref to cl_salv_events_table,
        o_sorts      type ref to cl_salv_sorts,
        o_selections type ref to cl_salv_selections,
        o_layout     type ref to cl_salv_layout,
      end of ms_salv .
    data:
      begin of ms_grid,
        o_grid         type ref to cl_gui_alv_grid,
        t_fieldcat     type lvc_t_fcat,
        s_layout       type lvc_s_layo,
        t_toolbar_excl type ui_functions,
      end of ms_grid .
    data:
      begin of ms_control read-only,
        is_popup       type abap_bool,
        is_raise_event type abap_bool,
        o_parent_cont  type ref to cl_gui_container,
        o_parent_dummy type ref to cl_gui_splitter_container,
        r_table        type ref to data,
        is_type_grid   type abap_bool,
        is_type_salv   type abap_bool,
        is_modal_popup type abap_bool,
        repid          type sy-repid,
        dynnr          type sy-dynnr,
      end of ms_control .
    data ms_option type ty_s_option .
    data ms_event type ty_s_event read-only .
    data:
*    data mt_log type bapiret2_tab .
      begin of  ms_log ,
        t_log type standard table of ty_s_log_output with empty key,
      end of ms_log .
    class-data so_help type ty_o_easy_abap .

    events user_action .

    class-methods gui_popup_get_value
      importing
        !iv_title              type clike optional
        value(iv_tab_field_1)  type clike optional
        !iv_is_input1          type abap_bool default abap_true
        value(iv_tab_field_2)  type clike optional
        !iv_is_input2          type abap_bool default abap_true
        value(iv_tab_field_3)  type clike optional
        !iv_is_input3          type abap_bool default abap_true
        value(iv_tab_field_4)  type clike optional
        !iv_is_input4          type abap_bool default abap_true
        value(iv_tab_field_5)  type clike optional
        !iv_is_input5          type abap_bool default abap_true
        value(iv_tab_field_6)  type clike optional
        !iv_is_input6          type abap_bool default abap_true
        value(iv_tab_field_7)  type clike optional
        !iv_is_input7          type abap_bool default abap_true
        value(iv_tab_field_8)  type clike optional
        !iv_is_input8          type abap_bool default abap_true
        value(iv_tab_field_9)  type clike optional
        !iv_is_input9          type abap_bool default abap_true
        value(iv_tab_field_10) type clike optional
        !iv_is_input10         type abap_bool default abap_true
      exporting
        !ev_user_cancel        type abap_bool
        !ev_value1             type any
        !ev_value2             type any
        !ev_value3             type any
        !ev_value4             type any
        !ev_value5             type any
        !ev_value6             type any
        !ev_value7             type any
        !ev_value8             type any
        !ev_value9             type any
        !ev_value10            type any .
    methods get_selected_tab
      exporting
        !et_any type standard table .
    methods constructor
      importing
        !ct_table          type any optional
        !raise_event       type abap_bool default abap_true
        !io_container      type ref to cl_gui_container optional
        !iv_is_modal_popup type abap_bool default abap_false
        !iv_modal_title    type any default ' '
        !iv_repid          type any default sy-repid
        !iv_dynnr          type any default sy-dynnr
        !is_salv           type abap_bool default abap_true                                                  "erzeugt cl_salv_table
        !is_grid           type abap_bool default abap_false .                                                 "erzeugt cl_gui_alv_grid,
    methods display .
*      free,
    "A = Spalten u Zeilenselktion // '','B' = Einfachselektion,Listbox // C = Mehrfachselektiin
    "D = Zellenselektion
    methods set
      importing
        !iv_title                    type clike optional
        !iv_vertical_lines           type abap_bool default abap_true
        !iv_headers_visible          type abap_bool default abap_true
        !iv_default_toolbar          type abap_bool default abap_false
        !iv_raise_double_click       type abap_bool default abap_true
        !it_raise_hotspot            type stringtab optional
        !iv_raise_after_data_changed type abap_bool default abap_true
        !it_raise_f4                 type stringtab optional
        !it_raise_toolbar            type ttb_button optional
        !it_toolbar_hide             type stringtab optional
        !it_col_setting              type lcl_help=>so_help->ty-ty_t_setup optional
        !it_hide                     type stringtab optional
        !it_outlen                   type name2stringvalue_table optional
        !it_sort                     type stringtab optional
        !it_edit                     type stringtab optional
        !iv_optimize_colwidth        type abap_bool default abap_false
        !raise_error                 type abap_bool default abap_false
        !iv_selmode                  type any optional
        !iv_layout_restriction       type any optional
        !iv_layout_report            type any optional
        !iv_layout_handle            type any optional
        !is_layout                   type disvariant optional
        !iv_name_row_color           type any optional
        !iv_name_row_style           type any optional .
    class-methods class_constructor .
    class-methods popup_customizing .
    class-methods popup_json_table
      importing
        !iv_tablename type clike optional .
    class-methods popup_json_data
      importing
        !i_any type any
      exporting
        !e_any type any .
    class-methods factory_log
      importing
        !io_container      type ref to cl_gui_container optional
        !iv_is_modal_popup type abap_bool default abap_false
        !iv_repid          type any default sy-repid
        !iv_dynnr          type any default sy-dynnr
      returning
        value(r_result)    type ty_o_easy_alv .          "zcl_kal_easy_alv_v06. "_alv.
    methods free .
    methods focus
      importing
        !set type abap_bool
        !get type abap_bool .
    methods log_add
      importing
        !i_any          type any
        !iv_v1          type any optional
        !iv_v2          type any optional
        !iv_v3          type any optional
        !iv_v4          type any optional
        !iv_icon        type any optional
        !iv_type        type any optional
        !iv_is_color    type abap_bool optional
        !cfw_refresh    type abap_bool default abap_true
      returning
        value(r_result) type ty_o_easy_alv .      "_alv.
    methods log_add_line
      importing
        !i_any          type any optional
        !iv_v1          type any optional
        !iv_v2          type any optional
        !iv_v3          type any optional
        !iv_v4          type any optional
        !iv_icon        type any optional
        !iv_type        type any optional
        !cfw_refresh    type abap_bool default abap_true
          preferred parameter i_any
      returning
        value(r_result) type ty_o_easy_alv .

    methods refresh .
    methods set_visible
      importing
        !iv_set_visible type abap_bool default abap_true .      "_alv.
    class-methods get_alv_info
      importing
        !it_ref_table type ref to data optional
        !io_alv       type ref to cl_gui_alv_grid optional
      exporting
        !et_filter    type lvc_t_filt
        !et_sort      type lvc_t_sort
        !et_fieldcat  type lvc_t_fcat
        !es_variant   type disvariant
        !es_layout    type lvc_s_layo .
    class-methods update_fieldcat
      importing
        !io_alv       type ref to cl_gui_alv_grid
        !it_ref_table type ref to data
        !it_fieldcat  type lvc_t_fcat .
  protected section.



    methods:
      on_salv_double_click
            for event double_click of cl_salv_events_table
        importing
            row
            column
            sender,

      on_salv_hotspot_click
            for event link_click of cl_salv_events_table
        importing
            row
            column
            sender,

      on_salv_toolbar_click for event added_function of cl_salv_events_table
        importing
            e_salv_function
            sender,

      on_grid_data_changed        " DATA_CHANGED_FINISHED
            for event data_changed of cl_gui_alv_grid
        importing
            er_data_changed
            e_onf4
            e_onf4_before
            e_onf4_after
            e_ucomm
            sender,


      on_grid_data_changed_finished        " DATA_CHANGED_FINISHED
            for event data_changed_finished of cl_gui_alv_grid
        importing
            e_modified
            et_good_cells
            sender,

      on_grid_menu_button "ONF4
            for event menu_button of cl_gui_alv_grid
        importing
            e_object
            e_ucomm,

      on_grid_f4_help "ONF4
            for event onf4 of cl_gui_alv_grid
        importing
            e_fieldname
            e_fieldvalue
            es_row_no
            er_event_data
            et_bad_cells
            e_display
            sender,

      on_grid_toolbar
      for event toolbar of
                    cl_gui_alv_grid
        importing e_object
                    e_interactive,
      on_grid_user_command
      for event user_command of
                    cl_gui_alv_grid
        importing e_ucomm,

      on_grid_hotspot_click
      for event hotspot_click of
            cl_gui_alv_grid
        importing
            e_row_id
            e_column_id
            es_row_no,


      on_dialogbox_close for event close of cl_gui_dialogbox_container
        importing sender,

      handle_event,

      salv_init,
      grid_init,
      salv_set,
      grid_set.




endclass.



class lcl_help_gui_global implementation.


  method class_constructor.
    create object so_help.
  endmethod.


  method constructor.


    data(lv_kind) = so_help->get( rtti_kind = 'X' i_any = ct_table ).
    case lv_kind.
      when cl_abap_datadescr=>kind_ref.
        if ct_table is bound.
          ms_control-r_table = ct_table.
        endif.
      when cl_abap_datadescr=>kind_table.
        so_help->x_raise( 'ZCX_WRONG_INPUT_TYPE_ERROR').
*        GET REFERENCE OF ct_table INTO  ms_cont<rol-r_table.
    endcase.

    ms_control-is_modal_popup = iv_is_modal_popup.
    if io_container is bound and ms_control-is_modal_popup = abap_true.
      so_help->x_raise( 'ZCX_CONTAINER_IN_DIALOGBOX_NOT_POSSIBLE_ERROR' ).
    endif.

    ms_control-is_raise_event = raise_event.
    ms_control-o_parent_cont  = io_container.

    if is_grid = abap_true.
      ms_control-is_type_grid = abap_true.
    else.
      ms_control-is_type_salv = abap_true.
    endif.


    if ct_table is not supplied.
      "dann wird dieser helper nur fÃ¼r statische aufrufe benutzt
      return.
    endif.

    ms_option-title = iv_modal_title.

    if is_grid = abap_true.
      grid_init(  ).
    else.
      salv_init(  ).
    endif.



  endmethod.


  method display.

    free ms_event.

    data lv_savemode type c length 1.
*    DATA   lt_excl_tb TYPE ui_functions.
    case ms_option-layout_restriction.
      when  if_salv_c_layout=>restrict_none.
        lv_savemode = 'A'.
      when if_salv_c_layout=>restrict_user_dependant.
        lv_savemode = 'U'.
      when if_salv_c_layout=>restrict_user_independant.
        lv_savemode = 'X'.
    endcase.

    if ms_control-is_type_salv = abap_true.
      ms_salv-o_salv->display(  ).

      ms_event-t_selections = ms_salv-o_selections->get_selected_rows( ).

    else.

      so_help->trans(
        exporting
          tab_2_tab          = 'X'
          i_any              =  ms_option-t_toolbar_hide
        importing
          e_result       = ms_grid-t_toolbar_excl
      ).


      """"""""""""""""""""""""""""""""""""""""""""""""
      " nicht benötigte Toolbarelemente ausblenden

      append cl_gui_alv_grid=>mc_fc_loc_delete_row    to  ms_grid-t_toolbar_excl.
      append cl_gui_alv_grid=>mc_fc_loc_insert_row    to  ms_grid-t_toolbar_excl.
      append cl_gui_alv_grid=>mc_fc_loc_copy_row      to  ms_grid-t_toolbar_excl.
      append cl_gui_alv_grid=>mc_fc_loc_paste         to  ms_grid-t_toolbar_excl.
      append cl_gui_alv_grid=>mc_fc_loc_paste_new_row to  ms_grid-t_toolbar_excl.
      append cl_gui_alv_grid=>mc_fc_loc_append_row    to  ms_grid-t_toolbar_excl.
      append cl_gui_alv_grid=>mc_fc_loc_cut           to  ms_grid-t_toolbar_excl.
      append cl_gui_alv_grid=>mc_fc_loc_copy          to  ms_grid-t_toolbar_excl.
      append cl_gui_alv_grid=>mc_fc_loc_undo          to  ms_grid-t_toolbar_excl.
      append cl_gui_alv_grid=>mc_fc_refresh           to  ms_grid-t_toolbar_excl.
      append cl_gui_alv_grid=>mc_fc_graph             to  ms_grid-t_toolbar_excl.
      append cl_gui_alv_grid=>mc_fc_help              to  ms_grid-t_toolbar_excl.
      append cl_gui_alv_grid=>mc_fc_info              to  ms_grid-t_toolbar_excl.


      field-symbols: <lt_table> type standard table.
      assign ms_control-r_table->* to <lt_table>.

      ms_grid-o_grid->set_table_for_first_display(
      exporting
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
        changing
          it_outtab                     = <lt_table>                " Output Table
          it_fieldcatalog               = ms_grid-t_fieldcat                 " Field Catalog
*        it_sort                       =                  " Sort Criteria
*        it_filter                     =                  " Filter Criteria
        exceptions
          invalid_parameter_combination = 1                " Wrong Parameter
          program_error                 = 2                " Program Errors
          too_many_lines                = 3                " Too many Rows in Ready for Input Grid
          others                        = 4  ).
      if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
      so_help->x_raise_check( method = 'X' ).


      if ms_control-is_modal_popup = abap_true.
        ms_control-o_parent_cont->set_focus(
          exporting
            control           =  ms_grid-o_grid                " Control
          exceptions
            cntl_error        = 1                " cntl_error
            cntl_system_error = 2                " cntl_system_error
            others            = 3
        ).
        if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
        so_help->x_raise_check( method = 'X' ).

      endif.

*      IF ms_option-t_toolbar IS NOT INITIAL.
*        CALL METHOD ms_grid-o_grid->set_toolbar_interactive.
*      ENDIF.

    endif.


    case sy-ucomm.

      when '&ONT'.
        ms_event-type = so_help->cs-s_alv_event_type-popup_close.


      when '&AC1'. " or 'TRPI'.
        ms_event-type = so_help->cs-s_alv_event_type-popup_cancel.

      when others.
    endcase.

  endmethod.


  method factory_log.

    try.

        data lt_dummy type standard table of spfli.

        create object r_result
          exporting
*           r_result          = NEW zcl_034tmm_future_easy_alv(
            ct_table          = ref #( lt_dummy )
            io_container      = io_container
            iv_is_modal_popup = iv_is_modal_popup
*           iv_modal_title    = ' '
            iv_repid          = iv_repid
            iv_dynnr          = iv_dynnr.

        r_result->ms_control-r_table = ref #( r_result->ms_log-t_log ).

        r_result->ms_salv-o_salv->set_data(
          changing
            t_table                     =  r_result->ms_log-t_log ).
        " Table to Be Displayed
*    ).
*      CATCH cx_salv_no_new_data_allowed.    "
      catch cx_root into data(lx_root).
        so_help->x_raise( lx_root ).
    endtry.



    data lt_col type so_help->ty-ty_t_setup.

*    data lt_col type ms_gui-o_alv_data->ty_t_setup.
*    FREE lt_col.
    append initial line to lt_col assigning field-symbol(<ls_col>).
    <ls_col>-name = 'ICON_STATUS'.
    <ls_col>-is_icon = abap_true.
    <ls_col>-out_length = '2'.

*    free <ls_col>.
    append initial line to lt_col assigning <ls_col>.
    <ls_col>-name = 'NUMBER'.
*    <ls_col>-is_icon = abap_true.
    <ls_col>-out_length = '3'.

    free <ls_col>.
    append initial line to lt_col assigning <ls_col>.
    <ls_col>-name = 'ID'.
*    <ls_col>-is_icon = abap_true.
    <ls_col>-out_length = '5'.


    append initial line to lt_col assigning <ls_col>.
    <ls_col>-name = 'MESSAGE'.
*    <ls_col>-is_tech = abap_true.
    <ls_col>-out_length = '120'.

    append initial line to lt_col assigning <ls_col>.
    <ls_col>-name = 'MESSAGE_V1'.
    <ls_col>-is_tech = abap_true.
*    <ls_col>-out_length = '2'.

    append initial line to lt_col assigning <ls_col>.
    <ls_col>-name = 'MESSAGE_V2'.
    <ls_col>-is_tech = abap_true.

    append initial line to lt_col assigning <ls_col>.
    <ls_col>-name = 'MESSAGE_V3'.
    <ls_col>-is_tech = abap_true.

    append initial line to lt_col assigning <ls_col>.
    <ls_col>-name = 'MESSAGE_V4'.
    <ls_col>-is_tech = abap_true.

    append initial line to lt_col assigning <ls_col>.
    <ls_col>-name = 'TYPE'.
    <ls_col>-is_tech = abap_true.


    data ls_layout type disvariant.
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


  endmethod.


  method focus.
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

  endmethod.


  method free.

    if ms_control-is_modal_popup = abap_true and ms_control-o_parent_cont is bound.
      ms_control-o_parent_cont->free(  ).
      free    ms_control-o_parent_cont.
    endif.

    if ms_grid-o_grid is bound.
      ms_grid-o_grid->free(  ).
      free ms_grid-o_grid.
    endif.

  endmethod.


  method get_alv_info.

    if et_fieldcat is supplied.

      call method io_alv->get_frontend_fieldcatalog
        importing
          et_fieldcatalog = et_fieldcat.

    endif.

    if es_variant is supplied.
      io_alv->get_variant(
        importing
          es_variant =  es_variant   " Layout
*        e_save     =     " Single-Character Flag
      ).
    endif.

    if et_filter is supplied.

      io_alv->get_filter_criteria(
        importing
          et_filter = et_filter    " Filter Criteria
      ).
    endif.

    if et_sort is supplied.

      io_alv->get_sort_criteria(
        importing
          et_sort = et_sort    " Sort Criteria
      ).
    endif.

    if es_layout is supplied.

      io_alv->get_frontend_layout(
        importing
          es_layout = es_layout    " Layout
      ).

    endif.

  endmethod.


  method get_selected_tab.

    field-symbols <lt_tab> type standard table.
    field-symbols <ls_tab> type any.

    free et_any.

    assign ms_control-r_table->* to <lt_tab>.

    if ms_salv-o_salv is bound.

      loop at ms_event-t_selections into data(lv_sel).

        read table <lt_tab> assigning <ls_tab>
          index lv_sel.

        append <ls_tab> to et_any.

      endloop.


    else.

      ms_grid-o_grid->get_selected_rows(
        importing
          et_index_rows =  data(lt_rows)   " Indexes of Selected Rows
*        et_row_no     =     " Numeric IDs of Selected Rows
      ).

      loop at lt_rows into data(lv_row).

        read table <lt_tab> assigning <ls_tab>
         index lv_row-index.

        append <ls_tab> to et_any.

      endloop.

    endif.

  endmethod.


  method grid_init.


    field-symbols:
        <lt_table> type standard table.

    data lo_dialogbox type ref to cl_gui_dialogbox_container.


    if ms_control-is_modal_popup = abap_true.

      data lv_caption type c length 30.
      lv_caption = ms_option-title.

      create object lo_dialogbox
        exporting
          caption = lv_caption
          width   = 900
          height  = 200
          top     = 150
          left    = 150
          repid   = ms_control-repid
          dynnr   = ms_control-dynnr.


      call method cl_gui_cfw=>flush
        exceptions
          cntl_system_error = 1
          cntl_error        = 2.
      if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma

      set handler on_dialogbox_close for lo_dialogbox.
      ms_control-o_parent_cont = lo_dialogbox.

    endif.

    try.

        assign ms_control-r_table->* to <lt_table>.

        if ms_control-o_parent_cont is bound.
          create object ms_grid-o_grid
            exporting
              i_parent = ms_control-o_parent_cont.


        else.
          so_help->x_raise(  'ZCX_ALV_GRID_WITHOUT_CONTAINER_NOT_POSSIBLE_ERROR' ).

        endif.


        assign ms_control-r_table->* to <lt_table>.
        so_help->gui_cfw(
                     exporting get_fcat = 'X' i_any = <lt_table>
                     importing e_any = ms_grid-t_fieldcat ).

    endtry.

  endmethod.


  method grid_set.
    data: lv_nam  type string.

    field-symbols:
      <ls_fieldcat> like line of ms_grid-t_fieldcat.
    data lv_set_hospot_event type abap_bool.

    loop at ms_grid-t_fieldcat assigning <ls_fieldcat>.

      read table ms_option-t_edit transporting no fields
          with key table_line = <ls_fieldcat>-fieldname.
      if sy-subrc = 0.
        <ls_fieldcat>-edit = 'X'.
      endif.


      read table ms_option-t_raise_hotspot transporting no fields
        with key table_line = <ls_fieldcat>-fieldname.
      if sy-subrc = 0.
        <ls_fieldcat>-hotspot = abap_true.
      endif.

      read table ms_option-t_col_setting into data(ls_col)
        with key name = <ls_fieldcat>-fieldname.
      if sy-subrc = 0.
*
*            if <ls_col>-is_button = abaP_true.
*            <ls_fieldcat>-
*            endif.
        if ls_col-out_length is not initial.
          <ls_fieldcat>-outputlen = ls_col-out_length.
        endif.

        if ls_col-is_icon = abap_true." is NOT INITIAL.
          <ls_fieldcat>-icon = abap_true.

          if ls_col-is_hotspot = abap_true.
            <ls_fieldcat>-hotspot = abap_true.
            lv_set_hospot_event = abap_true.
          endif.
        endif.

        if ls_col-title is not initial.

          <ls_fieldcat>-scrtext_s = ls_col-title.
          <ls_fieldcat>-scrtext_m = ls_col-title.
          <ls_fieldcat>-scrtext_l = ls_col-title.

        endif.

      endif.

      "TODO


      <ls_fieldcat>-scrtext_l =  <ls_fieldcat>-scrtext_l && '  [' && <ls_fieldcat>-fieldname && ']'.


    endloop.





    if ms_option-raise_after_data_changed = abap_true.

      set handler on_grid_data_changed_finished for ms_grid-o_grid.
      set handler on_grid_data_changed for ms_grid-o_grid.

      call method ms_grid-o_grid->register_edit_event
        exporting
          i_event_id = cl_gui_alv_grid=>mc_evt_modified. "enter. "modified.

      ms_grid-o_grid->set_ready_for_input( 1 ).

    endif.

    set handler on_grid_menu_button for ms_grid-o_grid.
*    loop at ms_option-t_col_setting into data(ls_col).
*
**    ls_col-i
*
*    endloop.


    if ms_option-t_raise_f4 is not initial.

      data:
        lt_f4 type lvc_t_f4,
        ls_f4 type lvc_s_f4.

      loop at ms_option-t_raise_f4 into lv_nam.


        ls_f4-fieldname  = lv_nam.
        ls_f4-register   = 'X'.
* ls_f4-getbefore  = 'X'.
* ls_f4-chngeafter = 'X'.
        insert ls_f4 into table lt_f4.

      endloop.

      call method ms_grid-o_grid->register_f4_for_fields
        exporting
          it_f4 = lt_f4.

      set handler on_grid_f4_help for ms_grid-o_grid.

    endif.


    if ms_option-default_toolbar = abap_false and ms_option-t_toolbar is initial.
      ms_grid-s_layout-no_toolbar = abap_true.
    endif.

*    if ms_control-is_modal_popup = abap_false.
    ms_grid-s_layout-grid_title = ms_option-title.
    ms_grid-s_layout-smalltitle = abap_true.
    ms_grid-s_layout-sel_mode = ms_option-selmode.
    ms_grid-s_layout-stylefname = ms_option-name_row_style.
*    ms_grid-s_layout-stylefname = ms_option-name_row_style.
    ms_grid-s_layout-cwidth_opt = ms_option-optimize_colwidth.
    if ms_option-headers_visible = abap_false.
      ms_grid-s_layout-no_headers = abap_true.
    endif.
*    ms_grid-s_layout-d
*    else.
*
*      endif.


    if ms_option-t_toolbar is not initial.

      set handler
      on_grid_user_command
                on_grid_toolbar for ms_grid-o_grid.

    endif.

    if ms_option-t_raise_hotspot is not initial or lv_set_hospot_event = abap_true.

      set handler on_grid_hotspot_click for ms_grid-o_grid.

    endif.

  endmethod.


  method gui_popup_get_value.

    data:
      lt_value  type standard table of sval,
      ls_value  type sval,
      lv_return type string,
      lv_title  type sy-title.

    if iv_title is supplied.
      lv_title = iv_title.
    else.
      lv_title = so_help->get( text = 'X' i_any = '271(DB)' ).
*      MESSAGE s271(db) INTO lv_title.
    endif.

****************************************
* Feld1 befüllen


    free ls_value.
    if iv_tab_field_1 is not initial.
      iv_tab_field_1 =  so_help->get(
                             trim_upper_case = 'X'
                             i_any = iv_tab_field_1
                              ).

      split  iv_tab_field_1 at '-' into ls_value-tabname ls_value-fieldname.

    else.
      data lv_string type string.
      so_help->rtti(
        exporting
          i_any   = ev_value1
        importing
          ev_type =  lv_string
      ).

      split lv_string at '-' into ls_value-tabname ls_value-fieldname.

    endif.



    ls_value-value = ev_value1.

    if iv_is_input1 = abap_true.
      ls_value-field_attr = '01'.
    else.
      ls_value-field_attr = '02'.
    endif.

    append ls_value to lt_value.

****************************************
* Feld2 befüllen

    if iv_tab_field_2 is supplied. " AND iv_tab2 IS SUPPLIED.

      free ls_value.
      iv_tab_field_2 =  so_help->get(
                             trim_upper_case = 'X'
                             i_any = iv_tab_field_2
                              ).

      split  iv_tab_field_2 at '-' into ls_value-tabname ls_value-fieldname.
      ls_value-value = ev_value2.

      if iv_is_input2 = abap_true.
        ls_value-field_attr = '01'.
      else.
        ls_value-field_attr = '02'.
      endif.

      append ls_value to lt_value.

    endif.


****************************************
* Feld3 befüllen

    if iv_tab_field_3 is supplied. " AND iv_tab3 IS SUPPLIED.

      free ls_value.
      iv_tab_field_3 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_3
                        ).
      split  iv_tab_field_3 at '-' into ls_value-tabname ls_value-fieldname.
      ls_value-value = ev_value3.

      if iv_is_input3 = abap_true.
        ls_value-field_attr = '01'.
      else.
        ls_value-field_attr = '02'.
      endif.

      append ls_value to lt_value.

    endif.


****************************************
* Feld4 befüllen

    if iv_tab_field_4 is supplied. "AND iv_tab4 IS SUPPLIED.

      free ls_value.
      iv_tab_field_4 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_4
                        ).
      split  iv_tab_field_4 at '-' into ls_value-tabname ls_value-fieldname.
      ls_value-value = ev_value4.

      if iv_is_input4 = abap_true.
        ls_value-field_attr = '01'.
      else.
        ls_value-field_attr = '02'.
      endif.

      append ls_value to lt_value.

    endif.


*****************************************
* Feld4 befüllen

    if iv_tab_field_5 is supplied. " AND iv_tab5 IS SUPPLIED.

      free ls_value.
      iv_tab_field_5 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_5
                        ).

      split  iv_tab_field_5 at '-' into ls_value-tabname ls_value-fieldname.
      ls_value-value = ev_value5.

      if iv_is_input5 = abap_true.
        ls_value-field_attr = '01'.
      else.
        ls_value-field_attr = '02'.
      endif.

      append ls_value to lt_value.

    endif.


*****************************************
* Feld6 befüllen

    if iv_tab_field_6 is supplied. " AND iv_tab5 IS SUPPLIED.

      free ls_value.
      iv_tab_field_6 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_6
                        ).

      split  iv_tab_field_6 at '-' into ls_value-tabname ls_value-fieldname.
      ls_value-value = so_help->get(
                     conv_out = 'X'
                     i_any  = ev_value6
                     ).

      if iv_is_input6 = abap_true.
        ls_value-field_attr = '01'.
      else.
        ls_value-field_attr = '02'.
      endif.

      append ls_value to lt_value.

    endif.

*****************************************
* Feld7 befüllen

    if iv_tab_field_7 is supplied. " AND iv_tab5 IS SUPPLIED.

      free ls_value.
      iv_tab_field_7 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_7
                        ).

      split  iv_tab_field_7 at '-' into ls_value-tabname ls_value-fieldname.
      ls_value-value = so_help->get(
                     conv_out = 'X'
                     i_any  = ev_value7
                     ).

      if iv_is_input7 = abap_true.
        ls_value-field_attr = '01'.
      else.
        ls_value-field_attr = '02'.
      endif.

      append ls_value to lt_value.

    endif.

*    *****************************************
* Feld8 befüllen

    if iv_tab_field_8 is supplied. " AND iv_tab5 IS SUPPLIED.

      free ls_value.
      iv_tab_field_8 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_8
                        ).

      split  iv_tab_field_8 at '-' into ls_value-tabname ls_value-fieldname.
      ls_value-value = so_help->get(
                     conv_out = 'X'
                     i_any  = ev_value8
                     ).

      if iv_is_input8 = abap_true.
        ls_value-field_attr = '01'.
      else.
        ls_value-field_attr = '02'.
      endif.

      append ls_value to lt_value.

    endif.

*    *****************************************
* Feld9 befüllen

    if iv_tab_field_9 is supplied. " AND iv_tab5 IS SUPPLIED.

      free ls_value.
      iv_tab_field_9 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_9
                        ).

      split  iv_tab_field_9 at '-' into ls_value-tabname ls_value-fieldname.
      ls_value-value = so_help->get(
                     conv_out = 'X'
                     i_any  = ev_value9
                     ).

      if iv_is_input9 = abap_true.
        ls_value-field_attr = '01'.
      else.
        ls_value-field_attr = '02'.
      endif.

      append ls_value to lt_value.

    endif.

*    *    *****************************************
* Feld10 befüllen

    if iv_tab_field_10 is supplied. " AND iv_tab5 IS SUPPLIED.

      free ls_value.
      iv_tab_field_10 =  so_help->get(
                       trim_upper_case = 'X'
                       i_any = iv_tab_field_10
                        ).

      split  iv_tab_field_10 at '-' into ls_value-tabname ls_value-fieldname.
      ls_value-value = so_help->get(
                     conv_out = 'X'
                     i_any  = ev_value10
                     ).

      if iv_is_input10 = abap_true.
        ls_value-field_attr = '01'.
      else.
        ls_value-field_attr = '02'.
      endif.

      append ls_value to lt_value.

    endif.
*****************************************
* Popup aufrufen
*break-point.

    do.

      try.

          call function 'POPUP_GET_VALUES'
            exporting
*             no_value_check  = SPACE    " Schaltet Prüfungen des jeweiligen Datentyps aus
              popup_title     = lv_title   " Text der Titelzeile
*             start_column    = '5'    " Startspalte des Dialogfensters
*             start_row       = '5'    " Startzeile des Dialogfensters
            importing
              returncode      = lv_return    " Antwort des Anwenders
            tables
              fields          = lt_value    " Tabellenfelder, Werte und Attribute
            exceptions
              error_in_fields = 1
              error_message   = 2
              others          = 3.
          if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
          so_help->x_raise_check( function = 'X' ).

          if lv_return = 'A'.
            ev_user_cancel = abap_true.
            return.
          else.
            ev_user_cancel = abap_false.
          endif.

*****************************************
* Werte übernehmen

          loop at lt_value into ls_value.
            case sy-tabix.

              when 1.
*                ev_value1 = ls_value-value.
                ev_value1 = so_help->get(
                          conv_in = 'X'
                          i_any = ls_value-value
                          i_any2 = iv_tab_field_1
                           ).

              when 2.
*                           ev_value2 = ls_value-value.
                ev_value2 = so_help->get(
                         conv_in = 'X'
                         i_any = ls_value-value
                         i_any2 = iv_tab_field_2
                          ).

              when 3.
*                           ev_value3 = ls_value-value.
                ev_value3 = so_help->get(
                       conv_in = 'X'
                       i_any = ls_value-value
                       i_any2 = iv_tab_field_3
                        ).

              when 4.
*                           ev_value4 = ls_value-value.
                ev_value4 = so_help->get(
                        conv_in = 'X'
                        i_any = ls_value-value
                        i_any2 = iv_tab_field_4
                         ).

              when 5.
*                           ev_value5 = ls_value-value.
                ev_value5 = so_help->get(
                       conv_in = 'X'
                       i_any = ls_value-value
                       i_any2 = iv_tab_field_5
                        ).

              when 6.
*                           ev_value6 = ls_value-value.
                ev_value6 = so_help->get(
                       conv_in = 'X'
                       i_any = ls_value-value
                       i_any2 = iv_tab_field_6
                        ).

              when 7.
*                           ev_value6 = ls_value-value.
                ev_value7 = so_help->get(
                       conv_in = 'X'
                       i_any = ls_value-value
                       i_any2 = iv_tab_field_7
                        ).

              when 8.
*                           ev_value6 = ls_value-value.
                ev_value8 = so_help->get(
                       conv_in = 'X'
                       i_any = ls_value-value
                       i_any2 = iv_tab_field_8
                        ).

              when 9.
*                           ev_value6 = ls_value-value.
                ev_value9 = so_help->get(
                       conv_in = 'X'
                       i_any = ls_value-value
                       i_any2 = iv_tab_field_9
                        ).
              when 10.
*                           ev_value6 = ls_value-value.
                ev_value10 = so_help->get(
                       conv_in = 'X'
                       i_any = ls_value-value
                       i_any2 = iv_tab_field_10
                        ).
            endcase.
          endloop.

          exit.

        catch cx_no_check into data(lx_root).

          if  so_help->msg( lx_root )-s_bapi-id = '56'
          and so_help->msg( lx_root )-s_bapi-number = '704'.
            raise exception lx_root.
          endif.

          so_help->gui_popup( lx_root ).

      endtry.

    enddo.
  endmethod.


  method handle_event.

    field-symbols: <lt_tab>    type standard table,
                   <ls_line>   type any,
                   <ls_line_z> type any,
                   <lv_any>    type any.
    assign ms_control-r_table->* to <lt_tab>.

*      ms_event-t_selections = ms_salv-o_selections->get_selected_rows( ).

    if ms_salv-o_salv is bound.
      ms_event-t_selections = ms_salv-o_selections->get_selected_rows( ).
    endif.

    if ms_grid-o_grid is bound.

      ms_grid-o_grid->get_selected_rows(
           importing
             et_index_rows =  data(lt_rows) "ms_event-t_selections "DATA(lt_rows)   " Indexes of Selected Rows
*        et_row_no     =     " Numeric IDs of Selected Rows
         ).

      free ms_event-t_selections.
      loop at lt_rows into data(lv_row).
        append lv_row to   ms_event-t_selections.
*
*        READ TABLE <lt_tab> ASSIGNING <ls_tab>
*         INDEX lv_row-index.
*
*        APPEND <ls_tab> TO et_any.
*
      endloop.

    endif.



    if ms_event-row is not initial.
      read table <lt_tab> assigning <ls_line>
          index ms_event-row.

      create data ms_event-line
        like <ls_line>.
      assign ms_event-line->* to <ls_line_z>.
      <ls_line_z> = <ls_line>.

      if ms_event-col is not initial.

        assign component ms_event-col of structure <ls_line> to <lv_any>.
        so_help->conv( exporting i_any = <lv_any> importing r_result = ms_event-value ).

      endif.

    endif.



    if ms_control-is_raise_event = abap_true.
      raise event user_action.
    else.
      leave to screen 0.
    endif.


  endmethod.


  method log_add.

    data ls_bapi type bapiret2.
    data ls_msg like line of ms_log-t_log.

    r_result = me.

    if cl_abap_datadescr=>kind_table = so_help->get( rtti_kind = 'X' i_any = i_any ).

      data(lt_bapi) = so_help->msg( i_any )-t_bapi.

      so_help->itab(
     exporting
       change_sequence    = 'X'
     changing
       ct_tab             = lt_bapi
   ).

      loop at lt_bapi into ls_bapi.
        log_add( i_any = ls_bapi cfw_refresh = abap_false ).
      endloop.


    else.


      so_help->msg( exporting i_any = i_any i_v1 = iv_v1
      i_v2 = iv_v2 i_v3 = iv_v3 i_v4 = iv_v4 i_type = iv_type
                importing e_any = ls_msg ).

*      ls_msg-message = so_help->get( text = 'X' i_any = ls_bapi ).
*      ls_msg-id      = ls_bapi-id.
*      ls_msg-number  = ls_bapi-number.
*      ls_msg-type    = ls_bapi-type.
*      ls-msg-m


      if iv_icon is not initial.
        ls_msg-icon_status = iv_icon.
      else.

        case  ls_msg-type.
          when 'S'.
            ls_msg-icon_status = '@5B@'.
          when 'W'.
            ls_msg-icon_status = '@5D@'.
          when 'E'.
            ls_msg-icon_status = '@5C@'.
        endcase.


        case iv_type.
          when 'S'.
            ls_msg-icon_status = '@5B@'.
          when 'W'.
            ls_msg-icon_status = '@5D@'.
          when 'E'.
            ls_msg-icon_status = '@5C@'.
        endcase.
      endif.

      if iv_is_color = abap_true.
        append initial line to ls_msg-t_color assigning field-symbol(<ls_color>).

        <ls_color>-fname = ''.
        <ls_color>-nokeycol = ' '. "bleibt frei da KEy-Spalte nicht veraendert werden soll
        <ls_color>-color-col = '2'.
        <ls_color>-color-int = '1'.
        <ls_color>-color-inv = '0'.

      endif.


      so_help->info(
        importing
          ev_date            = ls_msg-date
          ev_time            = ls_msg-time
      ).

      insert ls_msg into ms_log-t_log index 1.


    endif.

    if ms_salv-o_salv is bound and cfw_refresh = abap_true.
      ms_salv-o_salv->refresh(
        exporting
*            S_STABLE     =     " ALV Control: Refresh Stability
          refresh_mode = if_salv_c_refresh=>soft    " ALV: Data Element for Constants
      ).
    endif.

  endmethod.


  method log_add_line.


    data ls_msg type bapiret2.

    r_result = me.

    read table ms_log-t_log assigning field-symbol(<ls_log>)
      index 1.
    if sy-subrc <> 0.
      return.
    endif.

    so_help->msg( exporting i_any = i_any i_v1 = iv_v1
            i_v2 = iv_v2 i_v3 = iv_v3 i_v4 = iv_v4
             importing e_any = ls_msg ).

    concatenate <ls_log>-message ls_msg-message into <ls_log>-message.

* ELSE.
    case iv_type.
      when 'S'.
        <ls_log>-icon_status = '@5B@'.
      when 'W'.
        <ls_log>-icon_status = '@5D@'.
      when 'E'.
        <ls_log>-icon_status = '@5C@'.
    endcase.
*    ENDIF.

    so_help->info(
      importing
        ev_date            = <ls_log>-date
        ev_time            = <ls_log>-time
    ).

    if ms_salv-o_salv is bound and cfw_refresh = abap_true.
      ms_salv-o_salv->refresh(
        exporting
*            S_STABLE     =     " ALV Control: Refresh Stability
          refresh_mode = if_salv_c_refresh=>soft    " ALV: Data Element for Constants
      ).
    endif.

  endmethod.


  method on_dialogbox_close.
    sender->free(  ).
  endmethod.


  method on_grid_data_changed.

  endmethod.


  method on_grid_data_changed_finished.

    ms_event-type = so_help->cs-s_alv_event_type-after_data_changed.
    handle_event( ).

  endmethod.


  method on_grid_f4_help.

*data lv_char type c length 100.

    ms_event-type = so_help->cs-s_alv_event_type-f4_help.
*    ms_event_row = lv_char.
    ms_event-row =  es_row_no-row_id.
    ms_event-col = e_fieldname.

    handle_event(  ).

  endmethod.


  method on_grid_hotspot_click.

    ms_event-type = so_help->cs-s_alv_event_type-hotspot_click.
    ms_event-col = e_column_id-fieldname. "row_id-rowtype. "ucomm = e_ucomm.>
    ms_event-row = e_row_id-index.
    handle_event(  ).

  endmethod.


  method on_grid_menu_button.


    ms_event-type = so_help->cs-s_alv_event_type-menu_button.
    ms_event-ucomm = e_ucomm.
    ms_event-o_object = e_object.
*    ms_event_row = lv_char.
*    ms_event-row =  es_row_no-row_id.
*    ms_event-col = e_fieldname.

    handle_event(  ).

  endmethod.


  method on_grid_toolbar.

*    FREE e_object->mt_toolbar.
    append lines of ms_option-t_toolbar to e_object->mt_toolbar.

  endmethod.


  method on_grid_user_command.

    ms_event-type = so_help->cs-s_alv_event_type-toolbar_click.
    ms_event-ucomm = e_ucomm.
    handle_event(  ).

  endmethod.


  method on_salv_double_click.

    free ms_event.
    ms_event-type = so_help->cs-s_alv_event_type-double_click.
    ms_event-row = row.
    ms_event-col = column.
    ms_event-t_selections = ms_salv-o_selections->get_selected_rows( ).
    handle_event( ).

  endmethod.


  method on_salv_hotspot_click.

    free ms_event.
    ms_event-type = so_help->cs-s_alv_event_type-hotspot_click.
    ms_event-row = row.
    ms_event-col = column.
*    ms_event-t_selections = ms_salv-o_selections->get_selected_rows( ).

    handle_event( ).

  endmethod.


  method on_salv_toolbar_click.

    free ms_event.
    ms_event-type = so_help->cs-s_alv_event_type-toolbar_click.
    ms_event-ucomm = e_salv_function.
*    ms_event-row = row.
*    ms_event-col = column.
    ms_event-t_selections = ms_salv-o_selections->get_selected_rows( ).

    handle_event( ).

  endmethod.


  method popup_customizing.









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
*              so_help->gui_popup( EXPORTING popup_range = 'X' i_any = 'MARA' i_any2 = 'MATNR'
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
*              so_help->gui_popup( EXPORTING popup_confirm = 'X' i_any = 'Zeile mit Werk &1 wird gelÃ¶scht?'
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
*                so_help->gui_popup( EXPORTING popup_get_value = 'X' i_any = 'MARC-WERKS'
*                              IMPORTING e_any = lv_value ev_answer = DATA(lv_answer3) ).
*
*                CASE lv_answer3.
*                  WHEN so_help->cs_popup_answer-exit.
*                    EXIT.
*                  WHEN OTHERS.
*                    READ TABLE lt_input TRANSPORTING NO FIELDS
*                        WITH KEY werks = lv_value.
*                    IF sy-subrc = 0.
*                      so_help->gui_popup( popup_info = 'X' i_any = 'Werk &1 bereits vorhanden'
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
*          so_help->gui_popup( EXPORTING popup_confirm = 'X' i_any = 'Ã#nderungen verwerfen?'
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

  endmethod.


  method popup_json_data.

    data lv_json type string.

    lv_json = so_help->get( json = 'X' i_any = i_any ).


    types text   type c length 255.

    data: text_tab type table of text.


    data lt_tab2 type stringtab.
    data lt_backtab type stringtab.
    data lv_times type i.
    data lv_pos type i.
    data lv_pos_start type i.
    data lv_pos_end type i.

*    do.

    lv_times = strlen( lv_json ).
    lv_pos_start = 0.
    do lv_times times.

      lv_pos = sy-index - 1.

      if lv_json+lv_pos(1) = '}'
        or lv_json+lv_pos(1) = '{'
        or lv_json+lv_pos(1) = '['
        or lv_json+lv_pos(1) = ']'.

        lv_pos_end = lv_pos - lv_pos_start.
        append lv_json+lv_pos_start(lv_pos_end)  to lt_tab2.
        lv_pos_start = lv_pos.

        add 1 to lv_pos.

        lv_pos_end = lv_pos - lv_pos_start.
        append lv_json+lv_pos_start(lv_pos_end)  to lt_tab2.
        lv_pos_start = lv_pos.

        continue.
      endif.

      if lv_json+lv_pos(1) = ','.
        lv_pos_end = lv_pos - lv_pos_start + 1.
        append lv_json+lv_pos_start(lv_pos_end)  to lt_tab2.
        lv_pos_start = lv_pos + 1.
      endif.


    enddo.

    delete lt_tab2 where table_line = ''.

    editor-call for lt_tab2 backup into lt_backtab.
*    break-point.
    if sy-subrc = 0.


      data lv_result type string.
      loop at lt_tab2 into data(lv_string).
        concatenate
            lv_result
            lv_string
            into
            lv_result.
      endloop.

      free e_any.
      so_help->trans(
           exporting
*             json               = 'X'
             json_2             = 'X'
             i_any              = lv_result
           importing
             e_result           = e_any
         ).

*      MODIFY (lv_tabname) FROM TABLE <lt_tab>.

*modify spfli from table <lt_tab>.
*   text_tab <> back_tab.
*  ...
      sy-ucomm = so_help->cs-s_popup_answer-yes.
    endif.


  endmethod.


  method popup_json_table.
    create object so_help.

    if iv_tablename is initial.
      data(lv_tablename) = so_help->get( popup_get_value = 'X' i_any = 'Bitte Tabellenname eingeben:' ).
    else.
      lv_tablename = iv_tablename.
    endif.

    data(lv_sel) =  so_help->get(
               popup_choose = 'X'
               i_any        = 'Welcher Aktion soll durchgeführt werden?'
               i_any2       = value stringtab(
                      ( `Eintrage erstellen (CREATE)` )
                      ( `Eintrage aendern (UPDATE)` )
                      ( `Eintrage aendern u erstellen (MODIFY)` )
                      (  `Eintraege loeschen (DELETE)` )
                             )
*                i_any3 = lv_sel
            ).

*DATA: lv_tablename TYPE string VALUE 'SPFLI'.       " Tabelle, die ausgelesen werden soll

    data: lv_selection_id type rsdynsel-selid.          " Selection-ID zur Unterscheidung mehrerer Sets
    data: lv_number_of_fields type i.                   " Anzahl der Felder

    data: it_expressions type rsds_texpr.               " Expressions
    data: it_field_ranges type rsds_trange.             " Ranges
    data: it_tables type standard table of rsdstabs.    " Init: Tabellen
    data: it_fields type standard table of rsdsfields.  " Init: Felder
    data: it_where_clauses type rsds_twhere.            " Daten für Where-Tabelle

* Tabelle hinzufügen
    it_tables = value #( ( prim_tab = lv_tablename ) ).

* freien Selektionsbildschirm initialisieren
    call function 'FREE_SELECTIONS_INIT'
      exporting
        kind                     = 'T' " T: TABLES_TAB G: FIELD_GROUPS_KEY, F: FIELDS_TAB
        expressions              = it_expressions
*       field_groups_key         =
      importing
        selection_id             = lv_selection_id
        field_ranges             = it_field_ranges
      tables
        tables_tab               = it_tables
        fields_tab               = it_fields
      exceptions
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
        others                   = 20.

    if sy-subrc = 0.
* freien Selektionsbildschirm anzeigen
      call function 'FREE_SELECTIONS_DIALOG'
        exporting
          selection_id            = lv_selection_id
          title                   = 'Beispielselektion'
          frame_text              = 'Bitte auswählen'
          status                  = 1                 " normaler Selektionsmodus
          as_window               = abap_true        " abap_true -> als Fenster anzeigen
          no_intervals            = abap_true         " keine Intervalle im Selektionsbild anzeigen, kann über Button "Intervalle" geändert werden
        importing
          where_clauses           = it_where_clauses
          expressions             = it_expressions
          field_ranges            = it_field_ranges
          number_of_active_fields = lv_number_of_fields
        tables
          fields_tab              = it_fields
        exceptions
          internal_error          = 1
          no_action               = 2
          selid_not_found         = 3
          illegal_status          = 4
          others                  = 5.
*      break-point.
      if sy-subrc = 0.
        try.
* Daten ausgeben
            data: o_it type ref to data.
            data: o_it_back type ref to data.
            data: o_row type ref to data.
            field-symbols: <fs_table> type any table. " Feldsymbol für Arbeit mit Tabelle
            field-symbols: <fs_table_back> type any table. " Feldsymbol für Arbeit mit Tabelle
            field-symbols: <fs_row> type any.         " Feldsymbol für Arbeit mit Zeile

* dynamische Tabelle vom Typ lv_tablename erzeugen
            create data o_it type standard table of (lv_tablename).
            create data o_it_back type standard table of (lv_tablename).
* Feldsymbol auf die dynamische Tabelle anlegen
            assign o_it->* to <fs_table>.

            if <fs_table> is assigned.
* dynamische Workarea vom Typ der Tabellenzeile erzeugen
              create data o_row like line of <fs_table>.
* Feldsymbol auf die Workarea anlegen
              assign o_row->* to <fs_row>.

*              break-point.

              if <fs_row> is assigned.

                if lines( it_where_clauses ) > 0.
                  data(ls_where_clause) = it_where_clauses[ tablename = lv_tablename ].
                  select * from (lv_tablename) into table <fs_table> where (ls_where_clause-where_tab).
                else.
                  select * from (lv_tablename) into table <fs_table>.
                endif.

                if sy-subrc = 0.

                  assign o_it_back->* to <fs_table_back>.
                  <fs_table_back> = <fs_table>.
*              o_it_back->* = <fs_table>.

                  data lo_gui type ty_o_easy_alv.
                  create object lo_gui.

                  lo_gui->popup_json_data(
                   exporting
                     i_any = <fs_table>
                   importing
                     e_any = <fs_table>
                 ).

                  if abap_false = so_help->check(
             tab_equal           = 'X'
             i_any               = <fs_table>
             i_any2              = <fs_table_back>
                ) .
                    if abap_true =  so_help->check(  popup_confirm = 'X' i_any = 'Daten wurden verändert. Auf DB speichern?' ).
                      modify (lv_tablename) from table <fs_table>.
                      so_help->x_raise_check( sy_subrc = 'X').
                      so_help->do( commit_a_wait = 'X' ).
                    endif.
                  endif.


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
                else.
                  so_help->gui_popup(  msg = 'X' i_any = 'Keine Daten vorhanden. Bitte Selektion prüfen.').
*                WRITE: / 'Keine Daten verfügbar.'.
                endif.
              endif.
            endif.
          catch cx_root into data(lx_root).
            so_help->gui_popup( lx_root ).
*          MESSAGE e_text->get_text( ) TYPE 'S' DISPLAY LIKE 'E'.
        endtry.
      endif.
    endif.


  endmethod.


  method refresh.

    if ms_salv-o_salv is bound.

      ms_salv-o_salv->refresh(  ).

    endif.

    if ms_grid-o_grid is bound.

      ms_grid-o_grid->refresh_table_display(  ).

    endif.

  endmethod.


  method salv_init.

    field-symbols:
        <lt_table> type standard table.

    try.

*        if ms_control-r_table

        assign ms_control-r_table->* to <lt_table>.

        if ms_control-o_parent_cont is initial.
          cl_salv_table=>factory(
*            EXPORTING
*            list_display   = if_salv_c_bool_sap=>false " ALV Displayed in List Mode
*              r_container    = ms_control-o_parent_cont                          " Abstract Container for GUI Controls
*            container_name =
            importing
              r_salv_table   =  ms_salv-o_salv                        " Basis Class Simple ALV Tables
            changing
              t_table        = <lt_table>
          ).

        else.

          "Dummy Parent erzeugen da sonst nicht invisible möglich ist

          create object ms_control-o_parent_dummy
            exporting
              parent                  = ms_control-o_parent_cont
*             link_dynnr              = sy-dynnr " type SY-DYNNR optional
*             link_repid              = sy-repid "alue(LINK_REPID) type SY-REPID optional
              rows                    = 1
              columns                 = 1
              no_autodef_progid_dynnr = 'X'
            exceptions
              cntl_error              = 1
              cntl_system_error       = 2
              others                  = 3.

          call method ms_control-o_parent_dummy->set_row_sash
            exporting
              id    = 1                                    "first conatiner (actually splitter bar)
              type  = cl_gui_splitter_container=>type_sashvisible
              value = cl_gui_splitter_container=>false.



          cl_salv_table=>factory(
          exporting
*            list_display   = if_salv_c_bool_sap=>false " ALV Displayed in List Mode
                     r_container =  ms_control-o_parent_dummy->get_container( row = 1 column = 1 )                     " Abstract Container for GUI Controls
*            container_name =
            importing
               r_salv_table   =  ms_salv-o_salv                        " Basis Class Simple ALV Tables
            changing
               t_table        = <lt_table> ).

        endif.

      catch cx_root into data(lx_root).
    endtry.


    ms_salv-o_settings   = ms_salv-o_salv->get_display_settings( ).
    ms_salv-o_sorts      = ms_salv-o_salv->get_sorts( ).
    ms_salv-o_columns    = ms_salv-o_salv->get_columns( ).
    ms_salv-o_functions  = ms_salv-o_salv->get_functions( ).
    ms_salv-o_events     = ms_salv-o_salv->get_event( ).
    ms_salv-o_selections = ms_salv-o_salv->get_selections( ).
    ms_salv-o_layout     = ms_salv-o_salv->get_layout( ).


*       FIELD-SYMBOLS: <lt_table> TYPE STANDARD TABLE.
    assign ms_control-r_table->* to <lt_table>.
    so_help->gui_cfw(
                    exporting get_fcat = 'X' i_any = <lt_table>
                    importing e_any = ms_grid-t_fieldcat ).

  endmethod.


  method salv_set.


    try.

        data lv_title type lvc_title.
        lv_title = ms_option-title.
        ms_salv-o_settings->set_list_header(  lv_title ).
*          lo_set->set_list_header( lv_title ).
        ms_salv-o_settings->set_vertical_lines(  ms_option-vertical_lines ).

        ms_salv-o_columns->set_headers_visible( ms_option-headers_visible ).


        if ms_option-raise_double_click = abap_true. " or line_exists( ms_option-t_col_setting[ is_hotspot = abap_true ] )..
*          lo_event = lo_alv->get_event(  ).
          set handler on_salv_double_click for ms_salv-o_events. "lo_event.

        endif.

        if ms_option-t_raise_hotspot is not initial or line_exists( ms_option-t_col_setting[ is_hotspot = abap_true ] ).

          set handler on_salv_hotspot_click for ms_salv-o_events.

        endif.

        ms_salv-o_columns->set_optimize( ms_option-optimize_colwidth ).

        if ms_option-name_row_color is not initial.
          data lv_color_col type lvc_fname.
          lv_color_col = ms_option-name_row_color.
          ms_salv-o_columns->set_color_column( lv_color_col ).
        endif.


        data ls_col type so_help->ty-ty_s_col_setup.

        data: go_column type ref to cl_salv_column_table.
        data lv_name type  lvc_fname.
        data lv_length type lvc_outlen.
        data: lv_title_m type scrtext_m,
              lv_title_s type scrtext_s,
              lv_title_l type scrtext_l.
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

        loop at ms_option-t_col_setting into ls_col.
          try.
              lv_name = ls_col-name.
              lv_length = ls_col-out_length.
              go_column ?=  ms_salv-o_columns->get_column( lv_name ).
              go_column->set_output_length( lv_length  ).

              if ls_col-title is not initial.
                lv_title_m = lv_title_s = lv_title_l = ls_col-title.

                go_column->set_medium_text( lv_title_m  ).
                go_column->set_short_text( lv_title_s  ).
                go_column->set_long_text( lv_title_l  ).
*                 go_column->set_title( lv_title_t  ).
              else.

              endif.

              go_column->set_icon( ls_col-is_icon ).
              go_column->set_technical( ls_col-is_tech ).
              if ls_col-is_hotspot = abap_true.
                go_column->set_cell_type(
                    value = if_salv_c_cell_type=>hotspot ).
              elseif ls_col-is_button = abap_true.
*                break-point.
                go_column->set_cell_type(
          value = if_salv_c_cell_type=>button ).
              endif.

*              break-point.
              if strlen( ls_col-color ) >= 3. " is not INITIAL.

                data ls_color type lvc_s_colo.
                ls_color-col = ls_col-color(1).
                ls_color-int = ls_col-color+1(1). "iv_intense.
                ls_color-inv = ls_col-color+2(1)."iv_inverse.
                go_column->set_color( ls_color  ).
              endif.

            catch cx_root.
          endtry.
        endloop.


        data lv_sort type string.
        data lv_sort2 type lvc_fname.
        data: lv_hide type string.
        loop at ms_option-t_sort into lv_sort.
          lv_sort2 = lv_sort.
          ms_salv-o_sorts->add_sort(  lv_sort2 ).
        endloop.

        loop at ms_option-t_hide into lv_hide.
          try.
              lv_name = lv_hide.
              go_column ?=  ms_salv-o_columns->get_column( lv_name ).
              go_column->set_technical( abap_true ).
            catch cx_root.
          endtry.

        endloop.

        loop at ms_option-t_outlen into data(ls_outlen). " INTO lv_hide.
          try.
              lv_name = ls_outlen-name.
              lv_length = ls_outlen-value.
              go_column ?=  ms_salv-o_columns->get_column( lv_name ).
              go_column->set_output_length( value = lv_length ).
            catch cx_root.
          endtry.

        endloop.

        data lv_string type string.
        data: ls_toolbar like line of ms_option-t_toolbar.
        loop at ms_option-t_raise_hotspot into lv_string. " INTO lv_hide.
          try.
              lv_name = lv_string.
*              lv_length = ls_outlen-value.
              go_column ?=  ms_salv-o_columns->get_column( lv_name ).
              go_column->set_cell_type( if_salv_c_cell_type=>hotspot ).
            catch cx_root.
          endtry.

        endloop.

        if ms_option-default_toolbar = abap_true.
*          go_salv_functions_list = go_salv->get_functions( ).
*      go_salv_functions_list->set_all( ).
          ms_salv-o_functions->set_default(  ).
        endif.

        loop at ms_option-t_toolbar into ls_toolbar.

          data lv_c_40 type c length 40.
          lv_c_40 = ls_toolbar-text  .
          lv_string = ls_toolbar-text  .
*    ls_toolbar-text  .

          try.

              ms_salv-o_functions->add_function(
                exporting
                  name               = ls_toolbar-function    " ALV Funktion
*         icon               =
                  text               = lv_string
                  tooltip            = lv_string
                  position           = if_salv_c_function_position=>right_of_salv_functions     " Funktion Positionierung
              ).

            catch cx_root.
          endtry.
*       catch cx_salv_existing.    "
*       catch cx_salv_wrong_call.    " set_function(
*       exporting
*         name               =     <<" ALV Funktion
*         boolean            =     " boolsche Variable (X=true, space=false)
*     ).
*       catch cx_salv_not_found.    "
*       catch cx_salv_wrong_call.    "

        endloop.


        data lv_selmode type i.
        lv_selmode = ms_option-selmode.
        ms_salv-o_selections->set_selection_mode( lv_selmode ).



        if ms_option-s_layout is not initial.

          data ls_layout type salv_s_layout_key.

          ls_layout-report = ms_option-s_layout-report.
          ls_layout-handle = ms_option-s_layout-handle.
* ls_layout-repid = ms_option-s_layout-report.

*      key-report = sy-repid.
*  gr_layout = l_gr_alv->get_layout( ).
          ms_salv-o_layout->set_key( value = ls_layout ). "gr_layout->set_key( key ).
          if ms_option-layout_restriction is not initial.
            data lv_restri type i.
            lv_restri = ms_option-layout_restriction.
            ms_salv-o_layout->set_save_restriction( lv_restri ).
          endif.
          ms_salv-o_layout->set_default( abap_true ).
*
*gr_layout type ref to cl_salv_layout
*
*  key type salv_s_layout_key.

        endif.


*




* Eventhandler für Klicks in die Toolbar des SALV-Grids setzen
        set handler on_salv_toolbar_click for ms_salv-o_events.


        "Feldbezeichnung in Überschrift
*        loop at ms_salv-o_salv->get_columns( )->get( ) assigning field-symbol(<c>).
**  <c>-r_column->set_short_text( |{ <c>-r_column->get_columnname( ) } [{ <c>-r_column->get_short_text( ) }]| ).
**  <c>-r_column->set_medium_text( |{ <c>-r_column->get_columnname( ) } [{ <c>-r_column->get_medium_text( ) }]| ).
*          <c>-r_column->set_long_text( |{ <c>-r_column->get_long_text( ) } [{ <c>-r_column->get_columnname( ) }]| ).
*        endloop.



      catch cx_root.
    endtry.

  endmethod.


  method set.
    field-symbols: <ls_toolbar> like line of ms_option-t_toolbar.


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

    if is_layout is not initial.
      ms_option-s_layout = is_layout.
    else.
      ms_option-s_layout-handle = iv_layout_handle.
      ms_option-s_layout-report = iv_layout_report.
    endif.
    ms_option-layout_restriction = iv_layout_restriction.
    ms_option-name_row_color = iv_name_row_color.
    ms_option-name_row_style = iv_name_row_style.


    loop at ms_option-t_toolbar assigning <ls_toolbar>.

      if <ls_toolbar>-butn_type is initial.
        <ls_toolbar>-butn_type = '4'.
      endif.

    endloop.


    if ms_control-is_type_salv = abap_true.
      salv_set(  ).
    else.
      grid_set(  ).
    endif.


  endmethod.


  method set_visible.


    if ms_grid-o_grid is not initial.

*        if iv_set_visible = abap_false.
      ms_grid-o_grid->set_visible( iv_set_visible ).
*      else.
*         ms_grid-o_grid->set_visible(  abap_true ).
*      endif.
    endif.

    if ms_salv-o_salv is not initial.

*    if iv_set_visible = abap_false.
*
      if ms_control-o_parent_dummy is bound.
        ms_control-o_parent_dummy->set_visible(  iv_set_visible ).
      endif.

**      ms_salv-o_salv->close_screen(  ).
*      else.
*      ms_salv-o_salv->display(  ).
*      endif.
    endif.



  endmethod.


  method update_fieldcat.

    get_alv_info(
      exporting
        it_ref_table = it_ref_table
        io_alv       = io_alv
      importing
        es_layout    = data(ls_layout)
        et_filter    = data(lt_filter)
        et_sort      = data(lt_sort)
        es_variant   = data(ls_variant)  ).

    io_alv->set_variant(
      exporting
        is_variant = ls_variant    " Layout Variant (External Use)
*        i_save     =     " Single-Character Flag
    ).

    io_alv->set_frontend_fieldcatalog( it_fieldcat ).

    io_alv->set_sort_criteria(
      exporting
        it_sort                   = lt_sort    " Sort Criteria
*      EXCEPTIONS
*        no_fieldcatalog_available = 1
*        others                    = 2
    ).

    io_alv->set_filter_criteria(
      exporting
        it_filter                 =  lt_filter   " Filter Conditions
*     EXCEPTIONS
*       no_fieldcatalog_available = 1
*       others                    = 2
    ).
    if sy-subrc <> 0.
*    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*               WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    endif.



  endmethod.
endclass.

class lcl_help_gui definition inheriting from lcl_help_gui_global.

endclass.


class lcx_no_check definition inheriting from cx_no_check friends  lcl_help.

  public section.

    interfaces if_t100_dyn_msg.

    data:
      text    type string,
      texttab type string_table,
      ms_data type lcl_help=>so_help->ty-s_cx_data.

    methods:
      get_text redefinition,
      get_longtext redefinition.

endclass.

class lcx_no_check implementation.

  method get_text.
    result = ms_data-s_bapiret-message.
  endmethod.

  method get_longtext.
    result = get_text(  ).
  endmethod.

endclass.



class lcl_help implementation.

  method cfw_get_fcat.

    data:
      lo_alv          type ref to cl_salv_table,
      lo_columns      type ref to cl_salv_columns_list,
      lo_aggregations type ref to cl_salv_aggregations,
      lx_previous     type ref to cx_root.

    data lt_tab type ref to data.

    create data lt_tab
        like it_table.

* -----------------------------------------------------------------------------
* Fieldkatalog erzeugen

    try.
        field-symbols: <lt_table> type standard table.
*        ASSIGN ms_control-r_table->* TO <lt_table>.
        assign lt_tab->* to <lt_table>.


        cl_salv_table=>factory(
          importing
            r_salv_table   =  lo_alv   " Basisklasse einfache ALV Tabellen
          changing
            t_table        = <lt_table> ).


        lo_columns = lo_alv->get_columns( ).
        lo_aggregations = lo_alv->get_aggregations( ).

        r_result = cl_salv_controller_metadata=>get_lvc_fieldcatalog( r_columns      = lo_columns
                                                                     r_aggregations = lo_aggregations ).

      catch cx_salv_msg into lx_previous.
*        lx_root = factory_cx_t100( i_any  = 'Fehler beim Erstellen des Feldkatalogs'(002)  io_previous = lx_previous ).
*        RAISE EXCEPTION lx_root.
    endtry.

  endmethod.

  method so10_read.

    data:
      lv_object type thead-tdobject,
      lv_name   type thead-tdname,
      lv_id     type thead-tdid,
      lv_langu  type thead-tdspras,
      lt_lines  type standard table of tline,
      s_header  type thead.

    lv_object = i_key1.
    lv_id     = i_key2.
    lv_name   = i_key3.
    lv_langu  = i_key4.

    if lv_langu is initial.
      lv_langu = sy-langu.
    endif.

    call function 'READ_TEXT'
      exporting
        object          = lv_object
        name            = lv_name
        id              = lv_id
        language        = lv_langu
*       LOCAL_CAT       = LOCAL_CAT
      importing
        header          = s_header
      tables
        lines           = lt_lines
      exceptions
        object          = 1
        id              = 2
        language        = 3
        name            = 4
        not_found       = 5
        reference_check = 6.
    if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
    so_help->x_raise_check( function = 'X' ).

    data lt_stringtab type string_table.
    loop at lt_lines into data(ls_line).
      append initial line to lt_stringtab assigning field-symbol(<lv_string>).
      <lv_string> = ls_line-tdline.
    endloop.

    e_result = lt_stringtab.

  endmethod.


  method  convert_binary_2_xstring.

    data lv_length type i.

    lv_length = 255 * lines(  it_input ).

    call function 'SCMS_BINARY_TO_XSTRING'
      exporting
        input_length  = lv_length
      importing
        buffer        = r_result "lv_xstring
      tables
        binary_tab    = it_input
      exceptions
        failed        = 1
        error_message = 2
        others        = 3.
    if sy-subrc <> sy-subrc. sy-subrc = sy-subrc. endif. "SLINT Check OK withoput pragma
    so_help->x_raise_check(  function = 'X' ).

  endmethod.



  method so10_write.


    data ls_header type thead.
    field-symbols:
      <lt_any>  type standard table,
      <lv_any>  type any,
      <ls_line> type tline.

    data:  lt_lines   type standard table of tline.

    ls_header-tdobject = i_key1.
    ls_header-tdid     = i_key2.
    ls_header-tdname   = i_key3.
    if i_key4 is initial.
      ls_header-tdspras  = sy-langu.
    else.
      ls_header-tdspras  = i_key4.
    endif.

    assign i_any to <lt_any>.
    loop at <lt_any> assigning <lv_any>.
      append initial line to lt_lines assigning <ls_line>.
      <ls_line>-tdline = <lv_any>.
    endloop.

    call function 'SAVE_TEXT'
      exporting
*       client        = sy-mandt
        header        = ls_header
      tables
        lines         = lt_lines
      exceptions
        id            = 1
        language      = 2
        name          = 3
        object        = 4
        error_message = 5
        others        = 6.
    if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
    so_help->x_raise_check( function = 'X' ).

    if i_commit = abap_true.

      call function 'COMMIT_TEXT'
        exporting
          id       = ls_header-tdid
          language = ls_header-tdspras
          name     = ls_header-tdname
          object   = ls_header-tdobject.

      commit work and wait.
    endif.

  endmethod.


  method convert_xstring_2_binary.

    r_result = cl_bcs_convert=>xstring_to_solix( iv_xstring = iv_input ). "lv_xstring ).

  endmethod.



  method gos_read_object_list.


    try.

        types
           : begin of gys_key
           ,   foltp type so_fol_tp
           ,   folyr type so_fol_yr
           ,   folno type so_fol_no
           ,   objtp type so_obj_tp
           ,   objyr type so_obj_yr
           ,   objno type so_obj_no
           ,   forwarder type so_usr_nam
           , end of gys_key
           .

        data
            " Schlüssel des Business-Objekts
          : gs_object   type sibflporb

            " Verknüpfungen zum Objekt
          , gt_relopt   type obl_t_relt
          , gs_relopt   type obl_s_relt

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
        append gs_relopt to gt_relopt.
        " Notizen
        gs_relopt-low = 'NOTE'.
        append gs_relopt to gt_relopt.
        " URLs
        gs_relopt-low = 'URL'.
        append gs_relopt to gt_relopt.

*        TRY.
        " Verknüpfungen zum Objekt lesen
        cl_binary_relation=>read_links_of_binrels(
          exporting
            is_object           = gs_object
            it_relation_options = gt_relopt
            ip_role             = 'GOSAPPLOBJ'
          importing
            et_links            = et_result ).


      catch cx_root into data(lx_root).
*        IF use_exceptions = abap_true.
        so_help->x_raise(  lx_root ).
*        ENDIF.
    endtry.

  endmethod.

  method gos_create_object.


    data
        " Ordner
      : gs_folder   type soodk

        " Verknüpfung: Quelle & Ziel
      , gs_object   type sibflporb
      , gs_objtgt   type sibflporb

        " Dokumenten-Grunddaten
      , gs_doc_info type sofolenti1
      , gs_doc_data type sodocchgi1
      , gd_doc_type type soodk-objtp

        " Dokumenteninhalt binär
      .

    try.


        data lv_name type string.
        data lv_ext type string.

        split iv_filename_w_ext at '.' into lv_name lv_ext.

        gd_doc_type           = lv_ext. " 'pdf'.
        gs_doc_data-obj_descr = lv_name. "'test7'.
        gs_doc_data-obj_name  = iv_filename_w_ext.. " 'test7.pdf'.

        gs_doc_data-doc_size = xstrlen( iv_data ) . "gd_flen.
        data lt_pdf_bin type solix_tab.
        so_help->trans( exporting i_any = iv_data importing e_result = lt_pdf_bin ).
*        DATA(lt_pdf_bin) = convert_xstring_2_binary( iv_input = iv_data ).

        " Root-Folder der GOS ermitteln
        call function 'SO_FOLDER_ROOT_ID_GET'
          exporting
            region                = 'B'
          importing
            folder_id             = gs_folder
          exceptions
            communication_failure = 1
            owner_not_exist       = 2
            system_failure        = 3
            x_error               = 4
            error_message         = 5
            others                = 6.
        if sy-subrc <> sy-subrc. sy-subrc = sy-subrc. endif. "SLINT Check OK withoput pragma
        so_help->x_raise_check(  function = 'X' ) .

        " Dokument anlegen
        call function 'SO_DOCUMENT_INSERT_API1'
          exporting
            folder_id                  = gs_folder
            document_data              = gs_doc_data
            document_type              = gd_doc_type
          importing
            document_info              = gs_doc_info
          tables
            contents_hex               = lt_pdf_bin
          exceptions
            folder_not_exist           = 1
            document_type_not_exist    = 2
            operation_no_authorization = 3
            parameter_error            = 4
            x_error                    = 5
            enqueue_error              = 6
            error_message              = 8
            others                     = 9.
        if sy-subrc <> sy-subrc. sy-subrc = sy-subrc. endif. "SLIN Check OK withoput pragma
        so_help->x_raise_check(  function = 'X' ) .

        " Businessobjekt-ID übernehmen
        gs_object-instid  = iv_instid. "p_instid.
        gs_object-typeid  = iv_typeid. "p_typeid.
        gs_object-catid   = iv_catid. "p_catid.

        gs_object-instid  = so_help->get(  conv_in = 'X' i_any = gs_object-instid i_any2 = 'ALPHA' ).

        " Dokumentdaten als Ziel
        concatenate gs_folder gs_doc_info-object_id
           into gs_objtgt-instid respecting blanks.
        " Alternative:
        " gs_objtgt-instid = gs_doc_info-doc_id.
        gs_objtgt-typeid  = 'MESSAGE'.
        gs_objtgt-catid   = 'BO'.


        " Verknüpfung anlegen
        cl_binary_relation=>create_link(
          exporting
            is_object_a = gs_object
            is_object_b = gs_objtgt
            ip_reltype  = 'ATTA' ).


        if commit_work = abap_true.
          so_help->do( commit_a_wait = 'X' ).
        endif.

      catch cx_root into data(lx_root).
        if use_exceptions = abap_true.
          so_help->x_raise( lx_root ).
        endif.

    endtry.

  endmethod.

  method gui_download.

*       IF sy-subrc = 0.

    data: lv_action type i.
    data: lv_filename type string.
    data: lv_fullpath type string.
    data: lv_path type string.

    data lv_type type char10. " default 'ASC'.
    lv_type = iv_type.

    try.
        data lt_bin_data type solix_tab.
        so_help->trans( exporting i_any = iv_input importing e_result = lt_bin_data ).
*    DATA(lt_bin_data) = convert_xstring_2_binary( iv_input ). "convert_string_2_binary( iv_input = iv_input ).

        if abap_false = so_help->check( gui_active = 'X' ).
          so_help->x_raise( 'ZCX_NO_GUI_ACTIVE_ERROR').
        endif.

        data lv_name type string.
        data lv_ext type string.

        split iv_filname_w_ext at '.' into lv_name lv_ext.
* Speichern-Dialog
        cl_gui_frontend_services=>file_save_dialog( exporting
                                                      default_file_name = iv_filname_w_ext
                                                      default_extension = lv_ext
                                                      file_filter       = '(*.pdf)|*.pdf|'
                                                    changing
                                                      filename          = lv_filename
                                                      path              = lv_path
                                                      fullpath          = lv_fullpath
                                                      user_action       = lv_action ).

        if lv_action eq cl_gui_frontend_services=>action_ok.
* Daten lokal speichern
          cl_gui_frontend_services=>gui_download( exporting
                                                    bin_filesize = xstrlen( iv_input )
                                                    filename     = lv_fullpath
                                                    filetype     = lv_type
                                                  changing
                                                    data_tab     = lt_bin_data ).
        endif.

      catch cx_root into data(lx_root).
        if use_exceptions = abap_true.
          so_help->x_raise( lx_root ).
        endif.
    endtry.


  endmethod.


  method gui_upload.



    data: lt_file_table type filetable,
          ls_file       type file_table,
          lv_rc         type i.


    try.

        if abap_false = so_help->check( gui_active = 'X' ).
          so_help->x_raise( 'ZCX_NO_GUI_ACTIVE_ERROR').
        endif.

*  LS_FILE-FILENAME = P_FILE.
        append ls_file to lt_file_table.

        call method cl_gui_frontend_services=>file_open_dialog
*    EXPORTING
*      WINDOW_TITLE            =
*      DEFAULT_EXTENSION       =
*      DEFAULT_FILENAME        =
*      FILE_FILTER             =
*      WITH_ENCODING           =
*      INITIAL_DIRECTORY       =
*      MULTISELECTION          =
          changing
            file_table              = lt_file_table
            rc                      = lv_rc
*           USER_ACTION             =
*           FILE_ENCODING           =
          exceptions
            file_open_dialog_failed = 1
            cntl_error              = 2
            error_no_gui            = 3
            not_supported_by_gui    = 4
            others                  = 5.
        so_help->x_raise_check(  function = 'X' ).

        loop at lt_file_table into ls_file where filename <> ''.
          data(lv_path) = ls_file-filename.
        endloop.
        if sy-subrc <> 0.
          so_help->x_raise('ZCX_NO_FILE_PATH_FOUND_ERROR').
        endif.


        data: lv_filename type string.
        data lt_solix type solix_tab.

        lv_filename = lv_path.

        data lv_type type char10. " default 'ASC'.
        lv_type = iv_type.

        call method cl_gui_frontend_services=>gui_upload
          exporting
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
          changing
            data_tab                = lt_solix
          exceptions
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
            others                  = 19.
        so_help->x_raise_check(  function = 'X' ).

        so_help->trans( exporting i_any = lt_solix  importing e_result = r_result ).
*        r_result = convert_binary_2_xstring( lt_solix ).

      catch cx_root into data(lx_root).
        if use_exceptions = abap_true.
          so_help->x_raise( lx_root ).
        endif.
    endtry.

  endmethod.


  method gos_read_object_head.
*   , END OF gys_key
*   .
    types
       : begin of gys_key
       ,   foltp type so_fol_tp
       ,   folyr type so_fol_yr
       ,   folno type so_fol_no
       ,   objtp type so_obj_tp
       ,   objyr type so_obj_yr
       ,   objno type so_obj_no
       ,   forwarder type so_usr_nam
       , end of gys_key
       .
    data
        " Schlüssel des Business-Objekts
      : gs_key      type gys_key

        " Dokumenten-ID
      , gd_doc_id   type so_entryid

        " Dokumenten-Grunddaten
      , gt_contx    type solix_tab
      , gt_cont     type soli_tab
      .

    try.
        " Optional: Schlüsselkomponenten extrahieren
        gs_key = is_link-instid_b.

        " Die Dokumenten-ID für SAPOffice entspricht der ermittelten
        "   Instanz-ID
        gd_doc_id = is_link-instid_b.

        " Dokumenteninhalte löschen
        clear
          : gt_cont
          , gt_contx
          .
        " Dokument lesen
        call function 'SO_DOCUMENT_READ_API1'
          exporting
            document_id                = gd_doc_id
          importing
            document_data              = r_result "gs_doc_data
*          TABLES
*           object_content             = gt_cont
*           contents_hex               = lt_doc
          exceptions
            document_id_not_exist      = 1
            operation_no_authorization = 2
            x_error                    = 3
            error_message              = 4
            others                     = 5.
        if sy-subrc <> 0. sy-subrc = sy-subrc . endif. "SLIN OK without pragma
        so_help->x_raise_check(  function = 'X' ).


      catch cx_root into data(lx_root).
*        IF use_exceptions = abap_true.
        so_help->x_raise( lx_root ).
*        ENDIF.
    endtry.
  endmethod.




  method gos_read_object_content.
*   , END OF gys_key
*   .
    types
       : begin of gys_key
       ,   foltp type so_fol_tp
       ,   folyr type so_fol_yr
       ,   folno type so_fol_no
       ,   objtp type so_obj_tp
       ,   objyr type so_obj_yr
       ,   objno type so_obj_no
       ,   forwarder type so_usr_nam
       , end of gys_key
       .
    data
        " Schlüssel des Business-Objekts
      : gs_key      type gys_key

        " Dokumenten-ID
      , gd_doc_id   type so_entryid

        " Dokumenten-Grunddaten
      , gt_contx    type solix_tab
      , gt_cont     type soli_tab
      .

    data lt_doc type solix_tab.

    try.
        " Optional: Schlüsselkomponenten extrahieren
        gs_key = is_link-instid_b.

        " Die Dokumenten-ID für SAPOffice entspricht der ermittelten
        "   Instanz-ID
        gd_doc_id = is_link-instid_b.

        " Dokumenteninhalte löschen
        clear
          : gt_cont
          , gt_contx
          .
        " Dokument lesen
        call function 'SO_DOCUMENT_READ_API1'
          exporting
            document_id                = gd_doc_id
*          IMPORTING
*           document_data              = es_docdata "gs_doc_data
          tables
            object_content             = gt_cont
            contents_hex               = lt_doc
          exceptions
            document_id_not_exist      = 1
            operation_no_authorization = 2
            x_error                    = 3
            error_message              = 4
            others                     = 5.
        if sy-subrc <> 0. sy-subrc = sy-subrc . endif. "SLIN OK without pragma
        so_help->x_raise_check(  function = 'X' ).

*        r_result =

        so_help->trans( exporting i_any = lt_doc importing e_result = r_result ).

*  trans(  )=>convert_binary_2_xstring( lt_doc ).



*        so_help->trans(
*          EXPORTING
*            i_any     = lt_doc
*          IMPORTING
*            e_result  = r_result
*        ).

      catch cx_root into data(lx_root).
*        IF use_exceptions = abap_true.
        so_help->x_raise( lx_root ).
*        ENDIF.

    endtry.
  endmethod.



  method lock_set.

    try.

        lock_queue(
          exporting
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

        data: lx_root type ref to cx_root.
      catch cx_root into lx_root.
        "D  SE  893 Sperre kann nicht gesetzt werden
        so_help->x_raise( i_any = so_help->msg( i_id = 'SE' i_no = '893' )-s_bapi
                        i_prev = lx_root ).
    endtry.

  endmethod.                    "lock_set

  method lock_free.

    try.

        lock_queue(
          exporting
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

        data: lx_root type ref to cx_root.
      catch cx_root into lx_root.
        "D  UA_INV_VALUATION    031 Sperre kann nicht aufgehoben werden
        so_help->x_raise( i_any = so_help->msg( i_id = 'UA_INV_VALUATION' i_no =  '031' )-s_bapi
                        i_prev = lx_root ).
    endtry.

  endmethod.                    "lock_free

  method lock_queue.

    data:
      lv_tab          type  string.

    data:
         lr_data type ref to data.

    data:
      lt_parameters type abap_func_parmbind_tab,
      ls_parameters type abap_func_parmbind,
      ls_exception  type abap_func_excpbind,
      lt_exceptions type abap_func_excpbind_tab.

    field-symbols:
       <lv_any> type data.

    try.

        """"""""""""""""""""""""""""""""""
        " Fuba u Schnittstelle bestimmen

        data:
          lv_name_fm type char30,
          ls_para    type rsimp,
          lt_excp    type standard table of rsexc,
          lt_export  type standard table of rsexp,
          lt_import  type standard table of rsimp,
          lt_tables  type standard table of rstbl,
          ls_excp    like line of lt_excp.

        if iv_is_lock = abap_true.
          concatenate 'ENQUEUE_' iv_lock into lv_name_fm.
        else.
          concatenate 'DEQUEUE_' iv_lock into lv_name_fm.
        endif.

        call function 'FUNCTION_EXISTS'
          exporting
            funcname           = lv_name_fm
          exceptions
            function_not_exist = 1
            error_message      = 2
            others             = 3.
        if sy-subrc <> 0. sy-subrc = 3. endif.
        so_help->x_raise_check(  function = 'X'  ).

        call function 'FUNCTION_IMPORT_INTERFACE'
          exporting
            funcname           = lv_name_fm   " Name of the function module
          tables
            exception_list     = lt_excp    " Table of exceptions
            export_parameter   = lt_export    " Table of Export Parameters
            import_parameter   = lt_import    " Table of Import Parameters
*           changing_parameter =     " Table for Changing Parameters
            tables_parameter   = lt_tables   " Table With Tables
          exceptions
            error_message      = 1
            function_not_found = 2
            invalid_name       = 3
            others             = 4.
        if sy-subrc <> 0. sy-subrc = 4. endif.
        so_help->x_raise_check( function = 'X'  ).


        """"""""""""""""""""""""""""""""""
        " Importparameter befüllen

        if iv_params is not initial.

          lt_parameters =  lock_queue_get_parmtab(
               it_import     = lt_import
               iv_parms      = iv_params ).

        else.

          lt_parameters = lock_queue_get_parmtab(
              it_import     = lt_import
              iv_val1       = iv_val1
              iv_val2       = iv_val2
              iv_val3       = iv_val3
              iv_val4       = iv_val4 ).

        endif.


        "MODE
        loop at lt_import into ls_para.

          if sy-tabix = 1.
            ls_parameters-name  = ls_para-parameter. "lv_paramname.
            ls_parameters-kind  = abap_func_exporting.
            if ls_para-typ is not initial.
              create data lr_data type (ls_para-typ).
            else.
              create data lr_data type char1.
            endif.
            assign lr_data->* to <lv_any>.
            <lv_any> = iv_mode.
            get reference of <lv_any> into lr_data.
            ls_parameters-value = lr_data.
            insert ls_parameters into table lt_parameters.
          endif.

        endloop.

        ls_parameters-name  = '_SCOPE'.
        ls_parameters-kind  = abap_func_exporting.
        if ls_para-typ is not initial.
          create data lr_data type (ls_para-typ).
        else.
          create data lr_data type char1.
        endif.
        assign lr_data->* to <lv_any>.
        <lv_any> =  iv_scope.
        get reference of <lv_any> into lr_data.
        ls_parameters-value = lr_data.
        insert ls_parameters into table lt_parameters.

        ls_parameters-name  = '_COLLECT'.
        ls_parameters-kind  = abap_func_exporting.
        if ls_para-typ is not initial.
          create data lr_data type (ls_para-typ).
        else.
          create data lr_data type char1.
        endif.
        assign lr_data->* to <lv_any>.
        <lv_any> = iv_is_collect.
        get reference of <lv_any> into lr_data.
        ls_parameters-value = lr_data.
        insert ls_parameters into table lt_parameters.


        """"""""""""""""""""""""""""""""""
        " Exceptions

        data:
          lv_subrc type i value 0.

        loop at lt_excp into ls_excp.
          lv_subrc = lv_subrc + 1.

          ls_exception-value = lv_subrc. "1.
          ls_exception-name = ls_excp-exception. "'FOREIGN_LOCK'.
          insert ls_exception into table lt_exceptions.

        endloop.

        ls_exception-name = 'ERROR_MESSAGE'.
        ls_exception-value = 3.
        insert ls_exception into table lt_exceptions.

        ls_exception-name = 'OTHERS'.
        ls_exception-value = 4.
        insert ls_exception into table lt_exceptions.


        """"""""""""""""""""""""""""""""""
        " Aufruf

        call function lv_name_fm
          parameter-table
          lt_parameters
          exception-table
          lt_exceptions.
        if sy-subrc <> 0.
          so_help->x_raise( sy ).
        endif.

        """""""""""

        data:lx_root type ref to cx_root.
      catch cx_root into lx_root.
        so_help->x_raise(  i_any = so_help->msg(
                                        i_any = 'VALUE = &1 TABLE = &2 OBJECT = &3'
                                        i_v1 = iv_val2
                                        i_v2 = lv_tab
                                        i_v3 = iv_lock )-s_bapi
                        i_prev = lx_root ).
    endtry.

  endmethod.                    "lock_queue

  method lock_is_set.

    data:
      lt_enq    type standard table of seqg3,
      lv_garg   type seqg3-garg,
      lv_gname  type eqegraname,
      lv_number type i,
      lv_subrc  type i,
      lv_tab    type eqegraname,
      lv_string type string.

    lv_gname = iv_lock.

    select roottab
           from dd25l
           where viewname = @lv_gname
           order by primary key
           into @lv_tab
           up to 1 rows.
    endselect.
    so_help->x_raise_check( select = 'X' ).

*    SELECT SINGLE roottab
*         FROM dd25l
*          INTO lv_tab
*          WHERE viewname = lv_gname. "iv_lock.
*    so_help->raise_check( select = 'X' ).

    concatenate
        iv_val iv_val2 iv_val3 iv_val4 into lv_string.
    shift lv_string left deleting leading ' '.
    lv_garg = lv_string.

*    IF iv_val2 IS NOT SUPPLIED.
*      CONCATENATE sy-mandt iv_val INTO lv_garg. "== concatenated the client and the document number to be used in garg
*    ELSE.
*      CONCATENATE sy-mandt iv_val iv_val2 INTO lv_garg.
*    ENDIF.

    if iv_unam is not initial.

      call function 'ENQUEUE_READ'
        exporting
          gname                 = lv_tab "lv_gname "'EVVBLKE' " Granularity name (-> table name)
          garg                  = lv_garg    " Granularity value(->values of key fields)
          guname                = iv_unam    " User name
        importing
          number                = lv_number   " Number of chosen lock entries
          subrc                 = lv_subrc    " Error code of the enqueue call
        tables
          enq                   = lt_enq    " List of the chosen lock entries
        exceptions
          communication_failure = 1
          system_failure        = 2
          error_message         = 3
          others                = 4.
      if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma

    else.

      call function 'ENQUEUE_READ'
        exporting
          gname                 = lv_tab "lv_gname "'EVVBLKE' " Granularity name (-> table name)
          garg                  = lv_garg    " Granularity value(->values of key fields)
        importing
          number                = lv_number   " Number of chosen lock entries
          subrc                 = lv_subrc    " Error code of the enqueue call
        tables
          enq                   = lt_enq    " List of the chosen lock entries
        exceptions
          communication_failure = 1
          system_failure        = 2
          error_message         = 3
          others                = 4.
      if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma

    endif.
    so_help->x_raise_check(  function = 'X' ).

    if lines(  lt_enq ) > 0.
      rv_result = abap_true.
    else.
      rv_result = abap_false.
    endif.

  endmethod.                    "lock_is_set

  method lock_get_snap.

    data
      lv_process_id type string.

    call function 'ENQUEUE_READ'
      tables
        enq                   = rt_result    " List of the chosen lock entries
      exceptions
        communication_failure = 1
        system_failure        = 2
        error_message         = 3
        others                = 4.
    if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
    so_help->x_raise_check( function = 'X' ).

    so_help->info( importing ev_work_process_id = lv_process_id ).
    delete rt_result where gtwp <> lv_process_id.

  endmethod.                    "lock_get_snap

  method lock_set_snap.

    data:
      lt_enq  type standard table of seqg3,
      ls_snap type seqg3.

    try.
        lt_enq = lock_get_snap( ).

        "sperre setzten die aktuell nicht vorhanden
        loop at it_snap into ls_snap.

          read table lt_enq transporting no fields
              with key gname = ls_snap-gname garg = ls_snap-garg.

          if sy-subrc <> 0.

            lock_queue(
             exporting
               iv_is_lock      = abap_true
               iv_params       = ls_snap-garg
               iv_lock         = ls_snap-gobj ).

          endif.

        endloop.


        "sperre lösen die aktuell zu viel
        loop at lt_enq into ls_snap.

          read table it_snap transporting no fields
              with key gname = ls_snap-gname garg = ls_snap-garg.

          if sy-subrc <> 0.

            lock_queue(
              exporting
                iv_is_lock      = abap_false
                iv_params       = ls_snap-garg
                iv_lock         = ls_snap-gobj ).

          endif.

        endloop.

        data: lx_t100 type ref to cx_t100_msg.
      catch cx_t100_msg into lx_t100.
        so_help->x_raise('ZCX_CREATE_LOCKS_WITH_SNAPSHOT_ERROR').
    endtry.

  endmethod.                    "lock_set_snap

  method lock_collect_set.

    call function 'FLUSH_ENQUEUE'
      exceptions
        foreign_lock   = 1
        system_failure = 2
        error_message  = 3
        others         = 4.
    if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
    so_help->x_raise_check(  function = 'X' ).

  endmethod.                    "lock_collect_set

  method lock_collect_free.

    call function 'RESET_ENQUEUE'.

  endmethod.                    "lock_collect_free

  method lock_queue_get_parmtab.

    data:
         lr_data type ref to data.

    data:
      ls_parameters type abap_func_parmbind.

    field-symbols:
       <lv_any> type data.

    data:
      ls_para type rsimp,
      lv_int  type i,
      lv_pos  type i value 0..

    try.

        if iv_parms is not initial.

          loop at it_import into ls_para.
            "Verfahren um iv_parms aufzuschlüsseln

            if sy-tabix = 1.
              continue.
            endif.

            if ls_para-typ = '' and ls_para-parameter(1) = 'X'.
*          so_error->raise_text( 'Anzahl Schlüssel <> Anzahl Import Sperrobjekt').
              exit.
            endif.

            ls_parameters-name  = ls_para-parameter. "'VBELN'.
            ls_parameters-kind  = abap_func_exporting.
            create data lr_data type (ls_para-typ).
            assign lr_data->* to <lv_any>.

            so_help->rtti(
              exporting
                i_any     = <lv_any>
              importing
                ev_length = lv_int  ).

            <lv_any> = iv_parms+lv_pos(lv_int).
            lv_pos = lv_pos + lv_int.
            <lv_any> = so_help->get( conv_in = 'X' i_any = <lv_any> ).
            get reference of <lv_any> into lr_data.
            ls_parameters-value = lr_data.
            insert ls_parameters into table rt_parameters.

          endloop.

        else.


          """"""""""""""""""""""""""""""""""
          " Importparameter befüllen

          loop at it_import into ls_para.

            if iv_val1 is not initial and sy-tabix = 2.

              if ls_para-typ = '' and ls_para-parameter(1) = 'X'.
                so_help->x_raise('ZCX_WRONG_NUMBER_KEY_ENTRIES_FOR_LOCK_ERROR').
              endif.

              ls_parameters-name  = ls_para-parameter. "'VBELN'.
              ls_parameters-kind  = abap_func_exporting.
              create data lr_data type (ls_para-typ).
              assign lr_data->* to <lv_any>.
              <lv_any> = iv_val1.
              <lv_any> = so_help->get( conv_in = 'X' i_any =  <lv_any> ).
              get reference of <lv_any> into lr_data.
              ls_parameters-value = lr_data.
              insert ls_parameters into table rt_parameters.
            endif.

            if iv_val2 is not initial and sy-tabix = 3.

              if ls_para-typ = '' and ls_para-parameter(1) = 'X'.
                so_help->x_raise('ZCX_WRONG_NUMBER_KEY_ENTRIES_FOR_LOCK_ERROR').
              endif.

              ls_parameters-name  = ls_para-parameter. "'VBELN'.
              ls_parameters-kind  = abap_func_exporting.
              create data lr_data type (ls_para-typ).
              assign lr_data->* to <lv_any>.
              <lv_any> = iv_val2.
              <lv_any> = so_help->get( conv_in = 'X' i_any = <lv_any> ).
              get reference of <lv_any> into lr_data.
              ls_parameters-value = lr_data.
              insert ls_parameters into table rt_parameters.
            endif.

            if iv_val3 is not initial and sy-tabix = 4.

              if ls_para-typ = '' and ls_para-parameter(1) = 'X'.
                so_help->x_raise('ZCX_WRONG_NUMBER_KEY_ENTRIES_FOR_LOCK_ERROR').
              endif.

              ls_parameters-name  = ls_para-parameter. "'VBELN'.
              ls_parameters-kind  = abap_func_exporting.
              create data lr_data type (ls_para-typ).
              assign lr_data->* to <lv_any>.
              <lv_any> = iv_val3.
              <lv_any> = so_help->get( conv_in = 'X' i_any = <lv_any> ).
              get reference of <lv_any> into lr_data.
              ls_parameters-value = lr_data.
              insert ls_parameters into table rt_parameters.
            endif.

            if iv_val4 is not initial and sy-tabix = 5.

              if ls_para-typ = '' and ls_para-parameter(1) = 'X'.
                so_help->x_raise('ZCX_WRONG_NUMBER_KEY_ENTRIES_FOR_LOCK_ERROR').
              endif.

              ls_parameters-name  = ls_para-parameter. "'VBELN'.
              ls_parameters-kind  = abap_func_exporting.
              create data lr_data type (ls_para-typ).
              assign lr_data->* to <lv_any>.
              <lv_any> = iv_val3.
              <lv_any> = so_help->get( conv_in = 'X' i_any = <lv_any> ).
              get reference of <lv_any> into lr_data.
              ls_parameters-value = lr_data.
              insert ls_parameters into table rt_parameters.
            endif.

          endloop.

        endif.

        data:
                lx_root type ref to cx_root.
      catch cx_root into lx_root.
        so_help->x_raise( i_any = 'ZCX_LOCK_ERROR' i_prev = lx_root ).
    endtry.

  endmethod.                    "lock_queue_get_parmtab


  method selscreen_get.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Diese Methode liest von einem Selektionsbild die Daten aus
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    data:
      lv_repid  type string,
      lt_params type rsparams_tt.

*    try.

    clear ev_value.

    if iv_repid is initial.
      so_help->info( exporting iv_depth = 1 importing ev_repid = lv_repid ).
    else.
      lv_repid = iv_repid.
    endif.



    if et_range_single is supplied and iv_single_fieldname is not initial.

      et_range_single = lcl_help=>data_2_single_range(
               iv_repid = lv_repid iv_name = iv_single_fieldname ).

      return.
    endif.

    if et_range_multi_dirty is supplied and iv_multi_tabname is not initial.

      et_range_multi_dirty =  lcl_help=>data_2_rangetab_dirty(
          iv_repid = lv_repid iv_tabname = iv_multi_tabname ).

      return.
    endif.

    if et_parameter is supplied.

      if iv_variant is not initial.

        data lv_report_vari type c length 40.
        data lv_vari_vari type c length 14.

        lv_report_vari = lv_repid.
        lv_vari_vari   = iv_variant.
        lv_report_vari = so_help->get( trim_upper_case = 'X' i_any = lv_report_vari ).
        lv_vari_vari   = so_help->get( trim_upper_case = 'X' i_any = lv_vari_vari ).

        call function 'RS_VARIANT_VALUES_TECH_DATA'
          exporting
            report               = lv_report_vari  " Report Name
            variant              = lv_vari_vari  " Variant Name
*           sel_text             = SPACE
*           move_or_write        = 'W'
*           sorted               = SPACE    " Order as on selection screen
            execute_direct       = 'X'
*      IMPORTING
*           techn_data           =
          tables
            variant_values       = et_parameter
*           variant_text         =     " Selection Texts
          exceptions
            variant_non_existent = 1
            variant_obsolete     = 2
            error_message        = 3
            others               = 4.
        if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
        so_help->x_raise_check( function = abap_true i_head = 'ZCX_NO_SELECTION_FOR_VARIANT_FOUND_ERROR').

      else.


        et_parameter =  lcl_help=>data_2_params(
               iv_repid = lv_repid ).

      endif.
      return.
    endif.

    if iv_value_name is supplied.

      ev_value =  lcl_help=>data_2_single_value(
            iv_repid = lv_repid iv_name = iv_value_name ).

      return.
    endif.

    if es_struc is supplied.


      if iv_variant is supplied.


        selscreen_get(
          exporting
            iv_repid             = lv_repid
            iv_variant           = iv_variant
            raise_error          = raise_error
          importing
            et_parameter         = lt_params ).


        so_help->trans( exporting params_2_struct = 'X' i_any = lt_params
               importing e_result = es_struc ).

*            lcl_local_help=>trans_params_2_struc(
*              EXPORTING
*                it_params = lt_params
*              IMPORTING
*                es_struc  = es_struc ).

      else.


        lcl_help=>data_2_struct(
          exporting
            iv_repid     = lv_repid
          importing
            es_structure = es_struc
        ).

      endif.

      return.
    endif.



*        data: lx_root type ref to cx_root.
*      catch cx_root into lx_root.

*        if raise_error = abap_true or lcl_help=>sv_is_assert_when_error = abap_true.
*          so_help->x_raise(  lx_root ).
*        endif.
*
*    endtry.

  endmethod.


  method selscreen_set.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " diese Methode füllt einen Selection Screen mit Daten
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    data:
      lv_repid type string,
      lv_type  type string,
      lv_kind  type string.

*    try.

    if iv_repid is initial.
      so_help->info( exporting iv_depth = 1 importing ev_repid = lv_repid ).
    else.
      lv_repid = iv_repid.
    endif.

    so_help->rtti(
      exporting
        i_any        = i_any
      importing
        ev_type  = lv_type
        ev_kind      = lv_kind ).


    case lv_kind.

      when cl_abap_datadescr=>kind_struct.

        lcl_help=>selscreen_struc_2_screen(
                iv_repid = lv_repid is_struc = i_any ).

        return.

      when cl_abap_datadescr=>kind_table.


        case lv_type.

          when 'RSPARAMS_TT'. "t_it_params

            data:
              lv_repid_c type c length 40,
              lt_params  type rsparams_tt.

            lt_params = i_any.
            lv_repid_c = lv_repid.

            ##FM_SUBRC_OK
            call function 'SELTAB_2_SELOPTS'
              exporting
                program                     = lv_repid_c
*               ACCEPT_OTHER_KIND           = 'X'
              tables
                seltab                      = lt_params
*               P_SSCR                      =
              exceptions
                program_cannot_be_generated = 1
                illegal_object_kind         = 2
                others                      = 3.
            so_help->x_raise_check( function = 'X').
            return.

        endcase.
    endcase.


*        data: lx_root type ref to cx_root.
*      catch cx_root into lx_root.
*        if raise_error = abap_true or lcl_help=>sv_is_assert_when_error = abap_true.
*          so_help->x_raise( i_any  = lx_root ).
*        endif.
*    endtry.

  endmethod.




  method class_constructor.
    create object so_help.
  endmethod.



  method rtts_get_fieldname_by_type_tab.

    data:
      lo_structdescr type ref to cl_abap_structdescr,
      lo_descr       type ref to cl_abap_datadescr,
      lt_comp        type abap_component_tab,
      ls_comp        like line of lt_comp.

    lo_structdescr ?=  cl_abap_datadescr=>describe_by_name(  iv_tabname ).
    lo_descr       ?= cl_abap_datadescr=>describe_by_name(  iv_typename ).
    lt_comp         = lo_structdescr->get_components( ).

    loop at lt_comp into ls_comp.

      if  ls_comp-type = lo_descr.

        r_result = ls_comp-name.

        return.
      endif.

    endloop.

  endmethod.



  method rtts_get_domrange.
    data: lv_domname  type dd07l-domname,
          lt_dd_descr type standard table of dd07v.

    lv_domname = iv_value.

    "Mögliche Werte auslesen
    call function 'DD_DOMVALUES_GET'
      exporting
        domname        = lv_domname   " Domain name
*       text           = SPACE    " Default ' ': without texts, 'X': with, 'T': only text
*       langu          = iv_langu    " Language, default SY-LANGU, '*': all texts
*       bypass_buffer  = SPACE
*  IMPORTING
*       rc             =
      tables
        dd07v_tab      = lt_dd_descr
      exceptions
        wrong_textflag = 1
        others         = 2.
    if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
*    raise_w_check_function(  ).
*      mo_help->so_check_a_raise->after_select(  is_sy = sy ).


    "Wenn eine Wertetabelle hinterlegt ist

    "Gucken welche Spalte typgleich ist und dann nur die Spalte ausgeben

    "Ergebnis 1 Zeilige Spalte mit Beschreibung


  endmethod.


  method gui_popup_get_value.



    data:
      lt_value  type standard table of sval,
      ls_value  type sval,
      lv_return type string,
      lv_title  type c length 70.

    if iv_title is supplied.
      lv_title = iv_title.
    else.
      lv_title = so_help->get( text = 'X' i_any = '271(DB)' ).
*      MESSAGE s271(db) INTO lv_title.
    endif.

****************************************
* Feld1 befüllen

    clear ls_value.
    ls_value-tabname   = iv_tab1.
    ls_value-fieldname = iv_field1.

    if ev_value1 is supplied.
      ls_value-value = ev_value1.
    endif.

    if iv_is_input1 = abap_true.
      ls_value-field_attr = '01'.
    else.
      ls_value-field_attr = '02'.
    endif.

    append ls_value to lt_value.

****************************************
* Feld2 befüllen

    if iv_field2 is supplied and iv_tab2 is supplied.

      clear ls_value.
      ls_value-tabname   = iv_tab2.
      ls_value-fieldname = iv_field2.

      if iv_value2 is supplied.
        ls_value-value = iv_value2.
      endif.

      if iv_is_input2 = abap_true.
        ls_value-field_attr = '01'.
      else.
        ls_value-field_attr = '02'.
      endif.

      append ls_value to lt_value.

    endif.


****************************************
* Feld3 befüllen

    if iv_field3 is supplied and iv_tab3 is supplied.

      clear ls_value.
      ls_value-tabname   = iv_tab3.
      ls_value-fieldname = iv_field3.

      if iv_value3 is supplied.
        ls_value-value = iv_value3.
      endif.

      if iv_is_input3 = abap_true.
        ls_value-field_attr = '01'.
      else.
        ls_value-field_attr = '02'.
      endif.

      append ls_value to lt_value.

    endif.


****************************************
* Feld4 befüllen

    if iv_field4 is supplied and iv_tab4 is supplied.

      clear ls_value.
      ls_value-tabname   = iv_tab4.
      ls_value-fieldname = iv_field4.

      if iv_value4 is supplied.
        ls_value-value = iv_value4.
      endif.

      if iv_is_input4 = abap_true.
        ls_value-field_attr = '01'.
      else.
        ls_value-field_attr = '02'.
      endif.

      append ls_value to lt_value.

    endif.


*****************************************
* Feld4 befüllen

    if iv_field5 is supplied and iv_tab5 is supplied.

      clear ls_value.
      ls_value-tabname   = iv_tab5.
      ls_value-fieldname = iv_field5.

      if iv_value5 is supplied.
        ls_value-value = iv_value5.
      endif.

      if iv_is_input5 = abap_true.
        ls_value-field_attr = '01'.
      else.
        ls_value-field_attr = '02'.
      endif.

      append ls_value to lt_value.

    endif.


*****************************************
* Popup aufrufen
*break-point.
    call function 'POPUP_GET_VALUES'
      exporting
*       no_value_check  = SPACE    " Schaltet Prüfungen des jeweiligen Datentyps aus
        popup_title     = lv_title   " Text der Titelzeile
*       start_column    = '5'    " Startspalte des Dialogfensters
*       start_row       = '5'    " Startzeile des Dialogfensters
      importing
        returncode      = lv_return    " Antwort des Anwenders
      tables
        fields          = lt_value    " Tabellenfelder, Werte und Attribute
      exceptions
        error_in_fields = 1
        others          = 2.
    if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
    so_help->x_raise_check( function = 'X' ).

    if lv_return = 'A'.
      ev_user_cancel = abap_true.
      return.
    else.
      ev_user_cancel = abap_false.
    endif.

*****************************************
* Werte übernehmen

    loop at lt_value into ls_value.
      case sy-tabix.
        when 1.
          ev_value1 = ls_value-value.
        when 2.
          ev_value2 = ls_value-value.
        when 3.
          ev_value3 = ls_value-value.
        when 4.
          ev_value4 = ls_value-value.
        when 5.
          ev_value5 = ls_value-value.
      endcase.
    endloop.


  endmethod.                    "popup_get_values




  method rtts_is_in_domrange.

    data:
      lv_domname  type string,
      lt_dd_descr type standard table of dd07v.

    rv_result = abap_true.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Typ bestimmen

    so_help->rtti(
      exporting
        i_any                  = iv_any
      importing
         ev_domname = lv_domname
    ).


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Domänenwerte bestimmen


    call function 'DD_DOMVALUES_GET'
      exporting
        domname        = conv domname( lv_domname )  " Domain name
*       text           = SPACE    " Default ' ': without texts, 'X': with, 'T': only text
*       langu          = iv_langu    " Language, default SY-LANGU, '*': all texts
*       bypass_buffer  = SPACE
*  IMPORTING
*       rc             =
      tables
        dd07v_tab      = lt_dd_descr
      exceptions
        wrong_textflag = 1
        others         = 2.
    if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
*    raise_w_check_function(  ).
*      mo_help->so_check_a_raise->after_select(  is_sy = sy ).

*      APPEND LINES OF lt_dd_descr TO st_dd07v_buffer.

    read table lt_dd_descr  into data(ls_dd07v)
         with key domname = lv_domname domvalue_l = iv_any." ddlanguage = iv_langu.
    if sy-subrc <> 0.
      rv_result = abap_false.
    endif.


  endmethod.

  method bal_read_list.

    data:
      ls_extn   type bal_s_extn,
      ls_sub    type bal_s_sub,
      ls_obj    type bal_s_obj,
      ls_filt   type bal_s_lfil,
      lt_header type balhdr_t,
      ls_header type line of balhdr_t.

    ls_extn-sign   = ls_sub-sign   = ls_obj-sign   = 'I'.
    ls_extn-option = ls_sub-option = ls_obj-option = 'EQ'.

    ls_obj-low  = iv_object    .
    ls_sub-low  = iv_subobject .
    ls_extn-low = iv_extnumber.

    append:
        ls_extn to ls_filt-extnumber,
        ls_obj  to ls_filt-object,
        ls_sub  to ls_filt-subobject.

    call function 'BAL_DB_SEARCH'
      exporting
        i_s_log_filter     = ls_filt    " Log header data filter
      importing
        e_t_log_header     = lt_header    " Table of log header data read
      exceptions
        log_not_found      = 1
        no_filter_criteria = 2
        error_message      = 3
        others             = 4.
    if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
    so_help->x_raise_check( function = 'X').
*    mo_help->so_check_a_raise->after_function( is_sy = sy ).

    read table lt_header
     into ls_header index 1.
    so_help->x_raise_check( read_table = 'X').
*    mo_help->so_check_a_raise->after_read_table( is_sy = sy ).

    rt_list = lt_header.



*    rt_balmt = lt_message.

  endmethod.                    "bal_load



  method bal_read.

    data:
      ls_extn   type bal_s_extn,
      ls_sub    type bal_s_sub,
      ls_obj    type bal_s_obj,
      ls_filt   type bal_s_lfil,
      ls_logn   type bal_s_logn,
      lt_header type balhdr_t,
      ls_header type line of balhdr_t.

    ls_extn-sign   = ls_sub-sign   = ls_obj-sign   = ls_logn-sign   =  'I'.
    ls_extn-option = ls_sub-option = ls_obj-option = ls_logn-option = 'EQ'.

    ls_obj-low  = iv_object    .
    ls_sub-low  = iv_subobject .
    ls_extn-low = iv_extnumber.
    ls_logn-low = iv_lognumber.

    append:
        ls_extn to ls_filt-extnumber,
        ls_obj  to ls_filt-object,
        ls_sub  to ls_filt-subobject.

    if  iv_lognumber is not initial.
      append ls_logn to ls_filt-lognumber.
    endif.

    call function 'BAL_DB_SEARCH'
      exporting
        i_s_log_filter     = ls_filt    " Log header data filter
      importing
        e_t_log_header     = lt_header    " Table of log header data read
      exceptions
        log_not_found      = 1
        no_filter_criteria = 2
        error_message      = 3
        others             = 4.
    if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
    so_help->x_raise_check( function = 'X').
*    mo_help->so_check_a_raise->after_function( is_sy = sy ).

    read table lt_header
     into ls_header index 1.
    so_help->x_raise_check( read_table = 'X').
*    mo_help->so_check_a_raise->after_read_table( is_sy = sy ).

*    if iv_

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "laden

    data:
      lt_lognumber type standard table of szal_lognumber.


    loop at lt_header into ls_header.
      append ls_header-lognumber to lt_lognumber.
    endloop.

    data:
      lt_message type standard table of balm,
      lt_parms   type standard table of balmp.

    call function 'APPL_LOG_READ_DB_WITH_LOGNO'
*  EXPORTING
*    put_into_memory    = SPACE
*  IMPORTING
*    number_of_logs     =     " Number of logs read
      tables
        lognumbers         = lt_lognumber
*       header_data        =     " Log header data
*       header_parameters  =     " Log parameters
        messages           = lt_message    " Log messages
        message_parameters = lt_parms   " Message parameters
*       contexts           =
*       t_exceptions       =     " Application Log: Exceptions in Log
      .
    if lt_message is initial.
      so_help->x_raise( 'ZCX_BAL_LOG_EMPTY').
*      mo_help->so_error->raise_text(  'Keine BAL Informationen vorhanden.' ).
    endif.


*    sort lt_message by time_stmp ascending.

    rt_balmt = lt_message.

  endmethod.                    "bal_load


  method t100_get.

    field-symbols:
      <lt_any> type any table,
      <ls_any> type any.

    data: lt_comp type abap_component_tab,
          ls_comp like line of lt_comp,
          lv_text type string.
*          ls_log  TYPE /stc/tbx08_s_log_data.

    field-symbols: <fs_comp>   type any,
                   <ls_result> like line of r_result.
    data:
      lt_bapi_tmp    type bapiret2_tab,
      lv_kind        type string,
      ls_bapi_result type bapiret2,
      lv_string      type string.

    try.



        so_help->rtti(
          exporting
            i_any       = i_any
          importing
*        ev_typename =
            ev_kind     = lv_kind
*        et_domrange =
*        ev_in_domr  =
        ).

        case lv_kind.

          when cl_abap_datadescr=>kind_elem.
*           and i_any IS NOT INITIAL.

*           AND lv_kind = cl_abap_datadescr=>kind_elem.
            try.
                data lv_string2 type string.
                lv_string = i_any.
                lv_string2 = i_any.
                shift lv_string left deleting leading ' '.
                shift lv_string2 left deleting leading ' '.
                if lv_string(1) ca 'EWSIewsi'.
                  ls_bapi_result-type = lv_string(1).
                  lv_string = lv_string+1.
                endif.
                if lv_string(3) co '0123456789'.
                  ls_bapi_result-number = lv_string(3).
                  lv_string = lv_string+4.
                  split lv_string at ')' into ls_bapi_result-id lv_string.
*              EXIT.
                else.
                  data(lv_tmp) = lv_string2(2).
                  translate lv_tmp to upper case.
                  if lv_tmp = 'CX'.
                    "DE  >REP    202 Es ist ein Fehler &1 &2 aufgetreten
                    ls_bapi_result-id     = '>REP'.
                    ls_bapi_result-type   = 'E'.
                    ls_bapi_result-number = '202'.
                    ls_bapi_result-message_v1 = 'type'.
                    ls_bapi_result-message_v2 = lv_string2.
                    translate ls_bapi_result-message_v1 to upper case.
                  endif.
                endif.
                append ls_bapi_result to r_result.
              catch cx_root.
            endtry.




          when 'T'.
            assign i_any to <lt_any>.
            loop at <lt_any> assigning <ls_any>.
              lt_bapi_tmp = t100_get( i_any = <ls_any>  ).
              append lines of lt_bapi_tmp to r_result.
            endloop.

          when 'S'.

            "abkürzung speed up
*            try.
            field-symbols <ls_result2> type bapiret2_tab.
            data lr_data type ref to data.
            get reference of i_any into lr_data.
            assign lr_data->('T_BAPI') to <ls_result2>.
            if sy-subrc = 0.
              r_result = <ls_result2>.
              return.
            endif.
*              catch cx_root.
*            endtry.

            so_help->rtti(
              exporting
                i_any   = i_any
              importing
                et_comp = lt_comp  ).

            loop at lt_comp into ls_comp where as_include = abap_true.
              delete lt_comp.

              data lo_incl type ref to cl_abap_structdescr.
              try.
                  lo_incl ?= ls_comp-type.

                  append lines of lo_incl->get_components( ) to lt_comp.

                catch cx_root.
              endtry.

            endloop.


            loop at lt_comp into ls_comp.

              assign component ls_comp-name of structure i_any
                to <fs_comp>.

              if <fs_comp> is not assigned or
                    sy-subrc <> 0.
                continue.
              endif.

              case ls_comp-name.
                when 'SYMSGID' or 'MSGID' or 'ARBGB' or 'SYST_MSGID' or 'ID' or 'AG'.

                  if <fs_comp> is initial.
                    continue.
                  endif.

                  "Nachrichtenklasse
                  ls_bapi_result-id = <fs_comp>.

                when 'SYMSGNO' or 'MSGNO' or 'MSGNR' or 'SYST_MSGNO' or 'NUMBER' or 'NO'.
                  "Nachrichtennummer
                  ls_bapi_result-number = <fs_comp>.

                when 'BAPI_MTYPE' or 'MSGTY' or 'SYST_MSGTY' or 'TYPE' or 'SEVERITY' or 'MSGTYP'.
                  "Nachrichtentyp
                  ls_bapi_result-type = <fs_comp>.

                when 'MESSAGE'.
                  ls_bapi_result-message = <fs_comp>.

                when 'CODE'.

                  if <fs_comp> is initial.
                    continue.
                  endif.

*                data lv_String type string.
                  lv_string = <fs_comp>.
                  shift lv_string right deleting trailing ' '.
                  data lv_pos type i.
                  lv_pos = strlen( lv_string ) - 3.
                  ls_bapi_result-number = <fs_comp>+lv_pos.
                  shift lv_string left deleting leading ' '.
                  lv_pos = strlen( lv_string ) - 3.
                  ls_bapi_result-id = lv_string(lv_pos).

                when others.
                  if ls_comp-name cs 'MSGV' or ls_comp-name cs 'MESSAGE_' or ls_comp-name cs 'VAR'.
                    "Nachrichtenvariable
                    if ls_comp-name cs 'V1' or ls_comp-name = 'VAR1'.
                      ls_bapi_result-message_v1 = <fs_comp>.
                    elseif ls_comp-name cs 'V2' or ls_comp-name = 'VAR2'.
                      ls_bapi_result-message_v2 = <fs_comp>.
                    elseif ls_comp-name cs 'V3' or ls_comp-name = 'VAR3'.
                      ls_bapi_result-message_v3 = <fs_comp>.
                    elseif ls_comp-name cs 'V4' or ls_comp-name = 'VAR4'.
                      ls_bapi_result-message_v4 = <fs_comp>.
                    endif.
                  endif.
              endcase.

            endloop.

            "Nachricht nur im Klartext gefunden dann Anpassen
            if ls_bapi_result-message is not initial.
              if ( ls_bapi_result-id = '00' and ls_bapi_result-number = '398' ) or
                 ( ls_bapi_result-id is initial and ls_bapi_result-number is initial ).

                data ls_bapi type bapiret2.
                ls_bapi = lcl_help=>t100_get_w_text(
                                exporting iv_text =  ls_bapi_result-message ).

                ls_bapi-type   = ls_bapi_result-type.
                ls_bapi_result = ls_bapi.

              endif.
            endif.


            translate ls_bapi_result-type to upper case.
            translate ls_bapi_result-id   to upper case.
            shift  ls_bapi_result-id  left deleting leading ' '.
            translate ls_bapi_result-number to upper case.

            "bapiretrunfall
            if ls_bapi_result-id is initial and ls_bapi_result-number is initial
                and ls_bapi_result-message is not initial.
*                     t100_get_w_text(
*                       EXPORTING
*                         iv_text  = ls_bapi_result-message
*                       RECEIVING
*                         r_result = ls_bapi_result
*                     ).
            endif.

            append ls_bapi_result to r_result.

          when 'R'.

            data:
              li_t100      type ref to if_t100_message,
              lx_root      type ref to cx_root,
              lt_bapi_prev type bapiret2_tab,
              lx_no_check  type ref to lcx_no_check.

            do.

              if i_any is not bound.
                exit.
              endif.


              try.
                  data lo_log like so_help.

                  lo_log ?= i_any.
                  r_result = lo_log->ms-t_log.

                  exit.
                catch cx_sy_move_cast_error.
              endtry.



              try.

                  lx_no_check ?= i_any.

                  append  lx_no_check->ms_data-s_bapiret to r_result.
                  append lines of  lx_no_check->ms_data-add_t100 to r_result.

                  "Verhindern endlosschleife wenn previous auf eigene excdption zeigt
                  if lx_no_check->previous is bound. " AND lines( r_result ) < 20.
                    so_help->info(  importing et_callstack = data(lt_stack) ).
                    if lines( lt_stack ) < 50.
                      lt_bapi_prev = t100_get( i_any = lx_no_check->previous  ).
                      append lines of lt_bapi_prev to r_result.
                    endif.
                  endif.

                  exit.
                catch cx_sy_move_cast_error.
              endtry.



              try.

                  data li_odata_log type ref to /iwbep/if_message_container.
                  data lt_odata_msg type /iwbep/t_message_container.

*                    break-point.
                  li_odata_log ?= i_any.

                  lt_odata_msg =  li_odata_log->get_messages(
*            iv_provide_text = ABAP_FALSE
                     ).

                  so_help->msg(
                    exporting
                      i_any         = lt_odata_msg
                    importing
                      e_any         = r_result
                  ).

                  exit.
                catch cx_root.
              endtry.

              try.

                  "TODO
*        data li_log type ref to /stc/if_msg_base.
*
*        li_log ?= i_any.
*
*            so_help->msg(
*              exporting
*                i_any         = li_log->return_messages( )
*              importing
*                e_any         = r_result
*            ).

*            exit.
                catch cx_root.
              endtry.

              try.
                  li_t100 ?= i_any.

                  ls_bapi_result-id    = li_t100->t100key-msgid.
                  ls_bapi_result-number = li_t100->t100key-msgno.
                  ls_bapi_result-message_v1 = li_t100->t100key-attr1.
                  ls_bapi_result-message_v2 = li_t100->t100key-attr2.
                  ls_bapi_result-message_v3 = li_t100->t100key-attr3.
                  ls_bapi_result-message_v4 = li_t100->t100key-attr4.

                  try.
                      lx_root ?= i_any.
                      ls_bapi_result-type = 'E'.
                      append ls_bapi_result to r_result.

*                  WHILE lx_root->previous IS bound.
                      lt_bapi_prev = t100_get( i_any = lx_root->previous  ).
                      append lines of lt_bapi_prev to r_result.
**                  ENDWHILE.

                    catch cx_sy_move_cast_error.
                      append ls_bapi_result to r_result.
                  endtry.

                  exit.
                catch cx_sy_move_cast_error.
              endtry.

              try.

                  lx_root ?= i_any.
                  lv_text = lx_root->get_text(  ).
                  r_result  = so_help->msg( lv_text )-t_bapi.

                  data lx_tmp type ref to cx_root.
                  lx_tmp = lx_root->previous.
                  while lx_tmp is not initial.
                    lt_bapi_prev = t100_get( i_any = lx_tmp  ).
                    append lines of lt_bapi_prev to r_result.
                    lx_tmp = lx_tmp->previous.
                  endwhile.

                  exit.
                catch cx_sy_move_cast_error.

              endtry.

              exit.
            enddo.
        endcase.

        loop at r_result assigning <ls_result>.
*          translate <ls_result>-type   to upper case.
*          translate <ls_result>-id     to upper case.
*          translate <ls_result>-number to upper case.
          if <ls_result>-id is initial. " and <ls_result>-message is NOT INITIAL. "OR <ls_result>-number IS INITIAL.
            delete r_result.
          endif.
        endloop.


*data lx_root type ref to cx_root.
      catch cx_root into lx_root.
        so_help->x_raise(  lx_root ).
    endtry.

  endmethod.


*  method data_t100_get.
*
*    data lv_msgnr type msgnr.
*    lv_msgnr = is_bapi-number.
*
*    read table so_help->ss_db_buffer-t_t100 into es_t100
*        with table key sprsl = iv_langu arbgb = is_bapi-id msgnr = lv_msgnr .
*    if sy-subrc = 0.
*      return.
*    endif.
*
*    select single *
*        from t100
*        into corresponding fields of es_t100
*      where sprsl = iv_langu
*      and   arbgb = is_bapi-id
*      and   msgnr = lv_msgnr .
*    if sy-subrc = 0.
*      insert es_t100 into table so_help->ss_db_buffer-t_t100.
*      return.
*    endif.
*
*    read table so_help->ss_db_buffer-t_t100 into es_t100
*       with table key sprsl = 'E' arbgb = is_bapi-id msgnr = lv_msgnr .
*    if sy-subrc = 0.
*      return.
*    endif.
*
*    select single *
*    from t100
*    into corresponding fields of es_t100
*    where sprsl = 'E'
*    and   arbgb = is_bapi-id
*    and   msgnr = lv_msgnr .
*    if sy-subrc = 0.
*      insert es_t100 into table so_help->ss_db_buffer-t_t100.
*      return.
*    endif.
*
*    if iv_langu = 'D'.
*      return.
*    endif.
*
*    read table so_help->ss_db_buffer-t_t100 into es_t100
*    with table key sprsl = 'D' arbgb = is_bapi-id msgnr = lv_msgnr .
*    if sy-subrc = 0.
*      return.
*    endif.
*
*    select single *
*   from t100
*   into corresponding fields of es_t100
*      where sprsl = 'D'
*      and   arbgb = is_bapi-id
*      and   msgnr = lv_msgnr .
*    if sy-subrc = 0.
*      insert es_t100 into table so_help->ss_db_buffer-t_t100.
*      return.
*    endif.
*
*  endmethod.


  method t100_set.

    field-symbols:
      <lt_any> type standard table,
      <ls_any> type any.

*      <ls_param> LIKE LINE OF et_params.
*    clear e_any.

    data: lt_comp     type abap_component_tab,
          ls_comp     like line of lt_comp,
          ls_bapi     type bapiret2,
          ls_bapi_tmp type bapiret2.

    read table it_bapi into ls_bapi
      index 1.
*          ls_log  TYPE /stc/tbx08_s_log_data.

    field-symbols: <fs_comp> type any.
    data:
      lv_kind type string,
      lt_bapi type bapiret2_tab.

    so_help->rtti(
      exporting
        i_any       = e_any
      importing
*        ev_typename =
        ev_kind     = lv_kind
*        et_domrange =
*        ev_in_domr  =
    ).

    case lv_kind.

      when cl_abap_datadescr=>kind_elem.

*    IF ev_text IS SUPPLIED.
        e_any = ls_bapi-message.


      when cl_abap_datadescr=>kind_ref.


        data(lv_typename) = so_help->get( rtti_type = 'X' i_any = e_any ).

        case lv_typename.

            "Sonderbahndlung OData Log
          when '/IWBEP/CL_MGW_MSG_CONTAINER'.
            if e_any is initial.
              data li_log type ref to /iwbep/if_message_container.
              data lo_ref type ref to object.
              li_log ?= /iwbep/cl_mgw_msg_container=>get_mgw_msg_container( ).
            else.
              li_log ?= e_any.
            endif.

            li_log->add_messages_from_bapi(
              exporting
                it_bapi_messages          = it_bapi    " Return parameter tabler
            ).

            lo_ref = li_log.
            e_any ?= lo_ref.
            return.

          when others.
            return.
        endcase.

        try.

            data lx_no_check type ref to lcx_no_check.
            lx_no_check ?=  e_any.
            insert lines of it_bapi into table lx_no_check->ms_data-add_t100.

          catch cx_root.

        endtry.


      when cl_abap_datadescr=>kind_table.

        loop at it_bapi into ls_bapi_tmp.

          clear lt_bapi.
          append ls_bapi_tmp to lt_bapi.

          assign e_any to <lt_any>.
          append initial line to <lt_any> assigning <ls_any>.
          t100_set(
            exporting
              it_bapi = lt_bapi
            importing
              e_any   = <ls_any>
          ).

        endloop.

      when cl_abap_datadescr=>kind_struct.

        so_help->rtti(
          exporting
            i_any       = e_any
          importing
            et_comp = lt_comp  ).

        loop at lt_comp into ls_comp.
          assign component ls_comp-name of structure e_any
            to <fs_comp>.

          check <fs_comp> is assigned and
                sy-subrc = 0.

          case ls_comp-name.
            when 'SYMSGID' or 'MSGID' or 'ARBGB' or 'SYST_MSGID' or 'ID' or 'AG'.
              "Nachrichtenklasse
              <fs_comp> = ls_bapi-id. "ls_bapi_result-id = <fs_comp>.

            when 'SYMSGNO' or 'MSGNO' or 'MSGNR' or 'SYST_MSGNO' or 'NUMBER' or 'NO'.
              "Nachrichtennummer
              <fs_comp> = ls_bapi-number.

            when 'BAPI_MTYPE' or 'MSGTY' or 'SYST_MSGTY' or 'TYPE' or 'SEVERITY' or 'MSGTYP'.
              "Nachrichtentyp
              <fs_comp> = ls_bapi-type.

            when 'MESSAGE' or 'TEXT' or 'MSGTXT'.

              <fs_comp> = ls_bapi-message.

            when 'CODE'.
              <fs_comp> = ls_bapi-id && ls_bapi-number.
*                ls_log-code = 'ME110'.

            when others.
              if ls_comp-name cs 'MSGV'
              or ls_comp-name cs 'MESSAGE_'
              or ls_comp-name cs 'VAR'
              or ls_comp-name cs 'ATTR'.
                "Nachrichtenvariable
                if ls_comp-name cs 'V1'
                or ls_comp-name = 'VAR1'
                or ls_comp-name = 'ATTR1' .
                  <fs_comp> = ls_bapi-message_v1.
                elseif ls_comp-name cs 'V2'
                or ls_comp-name = 'VAR2'
                or ls_comp-name = 'ATTR2' .
                  <fs_comp> = ls_bapi-message_v2.
*                  ls_bapi_result-message_v2 = <fs_comp>.
                elseif ls_comp-name cs 'V3'
                or ls_comp-name = 'VAR3'
                or ls_comp-name = 'ATTR3' .
                  <fs_comp> = ls_bapi-message_v3. "ls_bapi_result-message_v3 = .
*                  ls_bapi_result-message_v3 = <fs_comp>.
                elseif ls_comp-name cs 'V4'
                or ls_comp-name = 'VAR4'
                or ls_comp-name = 'ATTR4'.
                  <fs_comp> = ls_bapi-message_v4.
                endif.
              endif.
          endcase.
        endloop.

    endcase.


  endmethod.




  method rtts_get_comp_tab.


    data:
      wa_component   type abap_componentdescr,
      lv_name2       type string,
      lo_descr       type ref to cl_abap_typedescr,
      lo_structdescr type ref to cl_abap_structdescr,
      ls_comp        like line of lo_structdescr->components,
      ls_data        type ref to data,
      lv_kind        type string.

    field-symbols:
      <ls_line>  type any,
      <lv_feld>  type any,
      <ft_input> type standard table,
      <any>      type any.


    """""""""""""""""""""
    " Struktur mit Typ wie Input erzeugen

    so_help->rtti( exporting i_any =  i_any
                 importing ev_kind = lv_kind ).

    case lv_kind.

      when 'T'.
        assign  i_any to <ft_input>.
        create data ls_data like line of <ft_input>.

      when 'S'.
        create data ls_data like i_any.

      when 'R'.
        assign  i_any->* to <any>.
        so_help->rtti( exporting i_any =  i_any
             importing ev_kind = lv_kind ).
        case lv_kind.
          when 'T'.
            assign  i_any to <ft_input>.
            create data ls_data like line of <ft_input>.

          when 'S'.
            create data ls_data like i_any.

          when others.
            return.
        endcase.

    endcase.


    """""""""""""""""""""
    " Components erzeugen
    assign ls_data->* to <ls_line>.
    lo_descr = cl_abap_structdescr=>describe_by_data( <ls_line> ).

    try.

        lo_structdescr ?= lo_descr.

        loop at lo_structdescr->components into ls_comp.

          concatenate '<ls_line>-' ls_comp-name into lv_name2.
*          DATA(lv_name2) = |<ls_line>-{ CONV string( ls_comp-name ) }|.
          assign (lv_name2) to <lv_feld>.

          clear wa_component.
          wa_component-name = ls_comp-name.
*          wa_component-name = CONV string( ls_comp-name ).
          wa_component-type ?= cl_abap_elemdescr=>describe_by_data( <lv_feld> ).
          insert wa_component into table rt_component.

        endloop.

      catch cx_root.

        clear wa_component.
        wa_component-name = 'TABLE_LINE'.
        wa_component-type ?= cl_abap_elemdescr=>describe_by_data( <ls_line> ).
        insert wa_component into table rt_component.

    endtry.

  endmethod.

*
*
*  METHOD gui_popup_alf_f4_vari.
*
**
***    TRY.
***
**    DATA: ls_variant TYPE disvariant.
**
*** ---------------------------------------------------------------------
*** Input aufbereiten
**
**    IF iv_repid IS SUPPLIED.
**      ls_variant-report   = iv_repid.
**    ELSE.
**      ls_variant-report   = cl_abap_syst=>get_current_program( ).
**    ENDIF.
**
***    IF iv_uname IS SUPPLIED.
**    ls_variant-username = iv_uname.
***    ELSE.
****      ls_variant-username = cl_abap_syst=>get_user_name( ).
***    ENDIF.
**
**    ls_variant-handle = iv_handle.
**
**
**    """""""""""""""""""""""""""""""""""
**    " Check
**
**    IF ls_variant-report IS INITIAL.
**      lcl_help_factory_all=>so_error->raise_text(
**          'Kein Reportnamen übergeben' ).
**    ENDIF.
**
**
*** ---------------------------------------------------------------------
*** F4-Hilfe aufrufen
**
**    CALL FUNCTION 'LT_F4_FOR_VARIANTS'
**      EXPORTING
**        i_tool          = 'LT'
**        i_sap           = 'X'
**        is_variant      = ls_variant
**        i_customer      = 'X'
**        i_user_specific = 'X'
**        i_no_aedat      = 'X'
**        i_no_aetime     = 'X'
**        i_no_aename     = 'X'
**        i_no_default    = 'X'
**      IMPORTING
**        es_variant      = ls_variant
**      EXCEPTIONS
**        not_found       = 1
**        OTHERS          = 2.
**    lcl_help_factory_all=>so_check_a_raise->after_function( is_sy = sy ).
**
*** ---------------------------------------------------------------------
*** Usereingabe übernehmen
**
**    IF ls_variant-variant NE ' '.
**      rv_vari = ls_variant-variant.
**    ELSE.
**      rv_vari = iv_vari.
**    ENDIF.
**
**
**    """"""""""""""""""""""""""""""""
**    " Fehlerbehandlung
**
***        DATA: lx_ro<ot TYPE REF TO cx_root.
***      CATCH cx_root INTO lx_root.
***        lcl_help_factory_all=>so_gui->popup_exception(  lx_root ).
***    ENDTRY.
*
*
*  ENDMETHOD.


  method popup_choose.

    data:
      lv_strlen_max type i,
      lv_line_max   type i,
      lv_col_end    type string.
    data lv_title type c length 70. "sy-title.
    constants lc_col_end_min type i value 15.
    constants lc_col_end_max type i value 20.

    types:
      begin of ty_s_output,
        icon  type c length 1,
        value type string,
      end of ty_s_output.

    data lt_output2 type standard table of ty_s_output.

    data lt_choices type string_table.

    so_help->trans(
      exporting
        tab_2_tab          = 'X'
        i_any              = it_choices
      importing
        e_result           = lt_choices
    ).

    loop at lt_choices into data(lv_choice).
      append initial line to lt_output2 assigning field-symbol(<ls_out>).
      <ls_out>-value = lv_choice.

      if strlen(  lv_choice ) > lv_strlen_max.
        lv_strlen_max = strlen(  lv_choice ).
      endif.
    endloop.

    lv_col_end = lv_strlen_max + 8.
    if lv_col_end < lc_col_end_min.
      lv_col_end = lc_col_end_max.
    endif.

    if  lv_col_end < 40.
      lv_col_end = 40.
    endif.


    lv_line_max = lines(  lt_choices ).


    if lv_line_max < 3.
      lv_line_max = 2.
    elseif lv_line_max < 6.
      lv_line_max = 4.
    elseif lv_line_max < 8.
      lv_line_max = 6.
    else.
      lv_line_max = lv_line_max * 5 / 2 - 10.
    endif.

    if iv_title is not initial and cl_abap_datadescr=>kind_elem = so_help->get(  rtti_kind = 'X' i_any = iv_title ).
      lv_title = iv_title.
    else.
      " BEN_SELCA DE  A   ArbgLeistung Auswahlknopf Plankategorie Auswahl Auswahl Auswahl
      lv_title = so_help->get( dd04t = 'X' i_any = 'BEN_SELCA' ). "'Auswahl:'.
    endif.

    so_help->gui_popup_gen(
      exporting
        it_table              = lt_output2
        iv_title              = lv_title
*          iv_vertical_lines     = abap_true
          iv_headers_visible    = abap_false
*          iv_raise_double_click = abap_true
        it_raise_hotspot = value #(  ( `VALUE` ) )
        it_hide = value #(  (  `ICON`) )
*        it_col_setting        = lt_col_settings
*          it_sort               =
          iv_optimize_colwidth  = abap_true
          iv_col_start          = '10'
          iv_col_end            =  lv_col_end
          iv_line_start         = '1'
          iv_line_end           = lv_line_max
          iv_sel                = i_sel
      importing
        ev_event_type = data(lv_type)
        ev_event_row = data(lv_row)
        et_selection = data(lt_select)
*        es_event              = ls_event
    ).

*    break-point.
    if lv_type = so_help->cs-s_alv_event_type-popup_cancel.
      r_result = so_help->cs-s_popup_answer-exit.
    else.
*      r_result = lv_row.


      if lv_row is initial.
        read table lt_select into data(lv_select)
            index 1.
        if sy-subrc = 0.
          r_result = lv_select.
        else.
          r_result = '1'.
        endif.
      else.
        r_result = lv_row.
      endif.

    endif.

    r_result = so_help->get( trim = 'X' i_any = r_result ).
    try.
        sy-index = r_result.
        sy-tabix = r_result.
      catch cx_root.
        sy-index = 99.
        sy-tabix = 99.
    endtry.
  endmethod.


  method popup_f4_help.

    data ls_shlp type shlp_descr.
    data: lv_name type shlpname.

    lv_name = iv_name_search_help.
*  lv_name_field = iv_name_field.

    call function 'F4IF_GET_SHLP_DESCR'
      exporting
        shlpname = lv_name
        shlptype = 'SH'
      importing
        shlp     = ls_shlp.

    data:
      lt_return_values type table of ddshretval,
      ls_return_values type ddshretval,
      l_rc             type i.

    field-symbols: <interface> type ddshiface.
    loop at ls_shlp-interface assigning <interface>.
      if <interface>-shlpfield = iv_name_field.
        <interface>-valfield = 'X'.
      endif.
    endloop.


    call function 'F4IF_START_VALUE_REQUEST'
      exporting
        shlp          = ls_shlp
*       disponly      = ' '
*       maxrecords    = 500
*       multisel      = ' '
*       cucol         = sy-cucol
*       curow         = sy-curow
      importing
        rc            = l_rc
      tables
        return_values = lt_return_values.

    if l_rc = 0.
      read table lt_return_values into ls_return_values index 1.
      rv_resault = ls_return_values-fieldval.
    else.
      so_help->x_raise( 'ZCX_VALUE_RQUEST_ERROR' ).
    endif.

  endmethod.                    "display_f4_help



  method gui_popup_exception.

    types:
      begin of  ty_s_output,
        icon type c length 5,
        text type string,
      end of ty_s_output.

    data:
      lt_out       type standard table of ty_s_output,
      lx_root      type ref to cx_root,
      lv_counter   type i,
      lv_val_print type string.

    data: lt_choice_popup type string_table,
          lt_log          type bapiret2_tab,
          ls_log          like line of lt_log.

    field-symbols: <ls_out> like line of lt_out.
    data lv_counter2 type i.
    data ls_bapi type bapiret2.

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Log aufbereiten

    "Leerzeile
    append initial line to lt_out assigning <ls_out>.

    lx_root = ix_root.
    while lx_root is bound and lv_counter2 < 10.

      clear lt_log.
      clear lv_val_print.
      clear ls_bapi.
      append initial line to lt_out assigning <ls_out>.

      "Infos aus Exception lesen
      so_help->x_info(
            exporting
                ix_root      = lx_root
            importing
                  et_add_t100  = lt_log
                  es_bapiret   = ls_bapi
                  ev_val_print = lv_val_print
                    ).

      "Exceptiontext
      <ls_out>-text  = lx_root->get_text(  ).
      if <ls_out>-text is initial and lt_log is initial.
        "DE    N8  800 Ein unerwarteter Fehler ist aufgetreten.
        <ls_out>-text = so_help->get( text = 'X' i_any = '800(N8)' ).
      endif.
      do lv_counter times.
        concatenate  '  ' <ls_out>-text into <ls_out>-text respecting blanks.
      enddo.
      concatenate '| ' <ls_out>-text into <ls_out>-text respecting blanks.

      "Zusätzliche Logs
      loop at lt_log into ls_log.

        append initial line to lt_out assigning <ls_out>.
        <ls_out>-text = so_help->get( text = 'X' i_any = ls_log ).
        do lv_counter times.
          concatenate  '  ' <ls_out>-text into <ls_out>-text respecting blanks.
        enddo.
        concatenate '| ' <ls_out>-text into <ls_out>-text respecting blanks.

      endloop.

      "Zusätzliche Values
      if lv_val_print is not initial.
        append initial line to lt_out assigning <ls_out>.
        <ls_out>-text = lv_val_print.
        do lv_counter times.
          concatenate  '  ' <ls_out>-text into <ls_out>-text respecting blanks.
        enddo.
        concatenate '| ' <ls_out>-text into <ls_out>-text respecting blanks.
      endif.


      lv_counter = lv_counter + 2.
      lx_root = lx_root->previous.
      lv_counter2 = lv_counter2 + 1.
    endwhile.

    read table lt_out assigning <ls_out>
        index 2.
    if sy-subrc = 0.
      <ls_out>-icon = '@5C@'.
    endif.

    append initial line to lt_out assigning <ls_out>.
    append initial line to lt_out assigning <ls_out>.
    append initial line to lt_out assigning <ls_out>.

    so_help->x_info(
      exporting
          ix_root      = ix_root
      importing
          ev_guid = data(lv_guid)
          es_data = data(ls_data)
              ).

    "*für weitere Optionen, Doppelklick hier'.
    <ls_out>-text = so_help->get( text = 'X' i_any = '003(O0)' ).

    data(lv_date) = so_help->get( print_date = 'X' i_any = ls_data-timestampl ).
    data(lv_time) = so_help->get( print_time = 'X' i_any = ls_data-timestampl ).

    concatenate '*' <ls_out>-text
        '  / ' lv_guid
        ' / ' lv_date ' ' lv_time ' ' ls_data-s_sy-uname
        into <ls_out>-text respecting blanks .



    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " ALV Ausgabe

    data lv_line_end type i.

    if lines(  lt_out ) > 11.
      lv_line_end = 15.
    else.
      lv_line_end = 10.
    endif.


    do.
*    break-point.
      so_help->gui_popup_gen(
        exporting
          it_table              = lt_out
          iv_title              = so_help->get( dd04t = 'X' i_any = 'MESSAGE_D' )
*          iv_vertical_lines     = abap_true
        iv_headers_visible    = abap_false
*        it_icon = value #( ( `ICON` ) )
        it_outlen = value #(  ( name = 'ICON' value = '2' ) ( name = 'TEXT' value = '110' ) )
*        iv_raise_double_click = abap_true
*        iv_raise_hotspot      = abap_true
*        it_col_setting        = lt_col
*        it_sort               =
*        iv_optimize_colwidth  = abap_false
        it_col_setting        = value #( ( name = 'ICON' is_icon = 'X' ) )
        iv_col_start          = '10'
        iv_col_end            = '140'
        iv_line_start         = '1'
        iv_line_end           = lv_line_end
        iv_sel                 = lines( lt_out )
        iv_sel_col            = 'ICON'
        importing
            ev_event_type = data(lv_type)
*          es_event              = ls_event
      ).


      case lv_type.

        when so_help->cs-s_alv_event_type-popup_cancel or so_help->cs-s_alv_event_type-popup_close.
          return.

        when so_help->cs-s_alv_event_type-double_click.

*          break-point.
          so_help->x_info(
            exporting
              ix_root      = ix_root
*              raise_error  = ABAP_FALSE
            importing
*              ev_name      =
              et_add_t100  = data(lt_log2)
              e_add_serial  = data(lv_serial)
*              ev_guid      =
              et_source    = data(lt_source2)
              et_callstack = data(lt_callstack)
*              ev_val_print =
*              es_bapiret   =
          ).

          clear lt_choice_popup.
          append 'T100_INFO'    to lt_choice_popup.

          if lt_log2 is not initial.
            append 'ADD_LOG' to lt_choice_popup.
          endif.

          if lv_serial is not initial.
            append 'ADD_DATA'     to lt_choice_popup.
          endif.

          if lt_callstack is not initial.
            append 'CALLSTACK'    to lt_choice_popup.
            append 'GO_TO_EDITOR'       to lt_choice_popup.
          endif.

          if lt_source2 is not initial.
            append 'SOURCE_CODE'  to lt_choice_popup.
          endif.

          do.
            data lv_tabix type i.
            so_help->get( popup_choose = 'X' i_any = lt_choice_popup i_any2 = lv_tabix ).
            lv_tabix = sy-tabix.
            read table lt_choice_popup into data(lv_choice)
                index sy-tabix.
            if sy-subrc <> 0.
              exit.
            endif.

            case lv_choice.

              when 'ADD_LOG'.
                so_help->gui_popup( t100_ext = 'X' i_any = lt_log2 ). "TO lt_choice_popup.

              when 'T100_INFO'.
                so_help->gui_popup( t100_ext = 'X' i_any = so_help->msg( ix_root )-t_bapi ).

              when 'CALLSTACK'.
                so_help->gui_popup( lt_callstack ).

              when 'SOURCE_CODE'.
                so_help->gui_popup( lt_source2 ).

              when 'GO_TO_EDITOR'.

                read table lt_callstack into data(ls_stack)
                    index 1.

                if sy-subrc = 0.

                  perform call_editor in program sapms380 using ls_stack-mainprogram "lv_progname
                                   ls_stack-include "lv_incl_name
                                   ls_stack-line. "lv_line.

                endif.


              when 'ADD_DATA'.
                so_help->gui_popup( json = 'X' i_any = lv_serial ).

            endcase.
          enddo.
        when others.
          exit.
      endcase.
    enddo.


  endmethod.


  method call_transaction.


    data:
      lv_tcode     type c length 20, "sy-tcode,
      lv_value     type memoryid,
      lv_value2    type memoryid,
      lv_value3    type memoryid,
      lv_val_name  type char20,
      lv_val2_name type char20,
      lv_val3_name type char20.


    if iv_field1_name <> ''
      and iv_field1_value <> ''.
      lv_val_name = iv_field1_name.
      lv_value    = iv_field1_value.
      set parameter id lv_val_name field lv_value.
    endif.
*
    if iv_field2_name <> ''
    and iv_field2_value <> ''.
      lv_val2_name = iv_field2_name.
      lv_value2 = iv_field2_value.
      set parameter id lv_val2_name field lv_value2.
    endif.

    if iv_field3_name <> ''
  and iv_field3_value <> ''.
      lv_val3_name = iv_field3_name.
      lv_value3 = iv_field3_value.
      set parameter id lv_val3_name field lv_value3.
    endif.

    lv_tcode = iv_transaction_name.
    call transaction lv_tcode and skip first screen.     "#EC CI_CALLTA
    so_help->x_raise_check( is_sy = sy ).


*    me->

  endmethod.                    "call_transaction



  method popup_range.

    data: struc_tab_and_field type rstabfield.

    clear ev_cancel.

    struc_tab_and_field-tablename = segment( val = conv string( iv_any ) sep = '-' index = 1 ).
    struc_tab_and_field-fieldname = segment( val = conv string( iv_any ) sep = '-' index = 2 ).

    call function 'COMPLEX_SELECTIONS_DIALOG'
      exporting
        tab_and_field     = struc_tab_and_field
      tables
        range             = et_range
      exceptions
        no_range_tab      = 1
        cancelled         = 2
        internal_error    = 3
        invalid_fieldname = 4
        others            = 5.
    if sy-subrc = 2.
      ev_cancel = abap_true.
      return.
    endif.
    so_help->x_raise_check( function = 'X' ).


  endmethod.

  method popup_json_deep.


    data lv_choice type string.
    data lr_data type ref to data.
    data lr_obj type ref to object.
    data lv_kind1 type string.
    data lv_kind2 type string.
    data lv_type1 type string.
    data lv_type2 type string.
    field-symbols: <any> type any.

    so_help->json(
      exporting
        json_2      = 'X'
        i_any       = iv_serial
      importing
*               e_ref1      =
        e_type1     = lv_type1
        e_kind1     = lv_kind1
        e_type2     = lv_type2
        e_kind2     = lv_kind2
    ).

    data lt_choice_data type string_table.
    clear lt_choice_data.
    if lv_type1 is not initial.
      append lv_type1 to lt_choice_data.
    endif.
    if lv_type2 is not initial.
      append lv_type2 to lt_choice_data.
    endif.
    do.
      so_help->get( popup_choose = 'X' i_any = lt_choice_data ).
      read table lt_choice_data into lv_choice
          index sy-tabix.
      if sy-subrc <> 0.
        exit.
      endif.

      case lv_choice.

        when lv_type1.

          case lv_kind1.

            when cl_abap_datadescr=>kind_ref.
              so_help->json(
              exporting
                json_2      = 'X'
                       i_any       = iv_serial
              importing
                e_ref1      = lr_obj
                 ).

            when others.
              so_help->json(
              exporting
                json_2      = 'X'
                       i_any       = iv_serial
              importing
                e_ref1      = lr_data
                 ).

              assign lr_data->* to <any>.

              so_help->gui_popup(
                  json        = 'X'
                  i_any             = <any>
              ).

          endcase.

        when lv_type2.

          case lv_kind2.

            when cl_abap_datadescr=>kind_ref.
              so_help->json(
              exporting
                json_2      = 'X'
                       i_any       = iv_serial
              importing
                e_ref2      = lr_obj
                 ).

            when others.
              so_help->json(
              exporting
                json_2      = 'X'
                i_any       = iv_serial
              importing
                e_ref2      = lr_data
                 ).

              assign lr_data->* to <any>.

              so_help->gui_popup(
                  json        = 'X'
                  i_any             = <any>
              ).

          endcase.

        when others.
          exit.
      endcase.
    enddo.



  endmethod.

  method popup_clike_one_line.

    types:
      begin of ty_s_output,
        dummy type c length 1,
        value type string,
      end of ty_s_output.

    data lt_output type standard table of ty_s_output.
    data: ls_text like line of it_text.
    field-symbols: <ls_out> like line of lt_output.

    loop at it_text into ls_text.
      append initial line to lt_output assigning <ls_out>.
      <ls_out>-value = ls_text.
    endloop.


    so_help->gui_popup_gen(
      exporting
        it_table              = lt_output
            iv_title              = so_help->get( dd04t = 'X' i_any = 'CIFDISP' )
*            iv_vertical_lines     = abap_true
            iv_headers_visible    = abap_false
*            iv_raise_double_click = abap_true
*            iv_raise_hotspot      = abap_true
*             it_col_setting        = VALUE #(  (  name = 'DUMMY' is_tech = abap_true ) )
            it_hide = value #(  (  `DUMMY` ) )
*            it_sort               =
*            iv_optimize_colwidth  = abap_false
*            iv_col_start          = '10'
*            iv_col_end            = '160'
*            iv_line_start         = '10'
*            iv_line_end           = '30'
*          IMPORTING
*            es_event              =
    ).



  endmethod.


  method popup_print.

    types:
      begin of ty_s_output,
        dummy type c length 1,
        value type string,
      end of ty_s_output.

    data lt_output type standard table of ty_s_output.
    data: ls_text like line of it_text.
    field-symbols: <ls_out> like line of lt_output.

    loop at it_text into ls_text.

      append initial line to lt_output assigning <ls_out>.
      <ls_out>-value = ls_text.
    endloop.


    so_help->gui_popup_gen(
      exporting
        it_table              = lt_output
            iv_title              = so_help->get( dd04t = 'X' i_any = 'CIFDISP' )
*            iv_vertical_lines     = abap_true
            iv_headers_visible    = abap_false
*            iv_raise_double_click = abap_true
*            iv_raise_hotspot      = abap_true
*             it_col_setting        = VALUE #(  (  name = 'DUMMY' is_tech = abap_true ) )
            it_hide = value #(  (  `DUMMY` ) )
*            it_sort               =
*            iv_optimize_colwidth  = abap_false
*            iv_col_start          = '10'
*            iv_col_end            = '160'
*            iv_line_start         = '10'
*            iv_line_end           = '30'
*          IMPORTING
*            es_event              =
    ).



  endmethod.

  method gui_popup_t100.

    data:
      ls_bapi type bapiret2.

    type-pools: icon.

    types:
      begin of ty_s_output,
        icon type string,
        text type string,
        id   type string,
        no   type string,
      end of ty_s_output.

    field-symbols:
        <ls_output> type ty_s_output.


    """""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ausgabetabelle bauen

    try.

        data:
         lt_output type standard table of ty_s_output.
        clear lt_output.
        append initial line to lt_output.

        loop at it_bapi into ls_bapi.

*          "ZU VIELE nACHRICHTEN RAUS
*          if ls_bapi-number = '279' and ls_bapi-id = '>3'.
*            continue.
*          endif.
*
*          if ls_bapi-message = 'Cause: sy is not valid  /  sy-subrc <> 0'.
*            continue.
*          endif.
*          if ls_bapi-message = 'Cause: a message with type error is found / msgty = E'.
*            continue.
*          endif.
*          if ls_bapi-message = 'Cause: an error flag is set  /  lv_error_flag = X'.
*            continue.
*          endif.


          append initial line to lt_output assigning <ls_output>.
          <ls_output>-text = ls_bapi-message.

          if  <ls_output>-text is initial.
            <ls_output>-text = ls_bapi-message.
          endif.
          case ls_bapi-type.
            when 'E'.
              <ls_output>-icon = icon_led_red.
            when 'S'.
              <ls_output>-icon = icon_led_green.
            when 'I'.
              <ls_output>-icon = icon_information.
            when 'W'.
              <ls_output>-icon = icon_led_yellow.
          endcase.

          <ls_output>-id = ls_bapi-id.
          <ls_output>-no = ls_bapi-number.

        endloop.

        append initial line to lt_output assigning <ls_output>.
        append initial line to lt_output assigning <ls_output>.
        append initial line to lt_output assigning <ls_output>.
        "O0 003 Bitte wählen Sie eine Zeile mit dem Doppelklick (F2)
        <ls_output>-text = so_help->get( text = 'X' i_any = '003(O0)' ).
        concatenate '*' <ls_output>-text  into <ls_output>-text .


        """""""""""""""""""""""""""""""""""""""""""""""""""""
        " ALV bauen

*        DATA:
*          ls_event       TYPE so_help->ty_s_alv_event.
*          lt_col_setting TYPE STANDARD TABLE OF so_help->ty_s_alv_column_setting, "lo_alv->ty_s_setup,
*          ls_col         TYPE so_help->ty_s_alv_column_setting.

*        clear ls_col.
*        ls_col-name = 'TEXT'.
*        ls_col-out_length = '120'.
*        APPEND ls_col TO lt_col_setting.
*
*        clear ls_col.
*        ls_col-name = 'TYPE'.
*        ls_col-is_icon = abap_true.
*        ls_col-out_length = '2'.
*        APPEND ls_col TO lt_col_setting.
*
*        clear ls_col.
*        ls_col-name = 'ID'.
*        ls_col-out_length = '5'.
*        ls_col-is_tech = abap_true.
*        APPEND ls_col TO lt_col_setting.
*
*        clear ls_col.
*        ls_col-name = 'NO'.
*        ls_col-out_length = '3'.
*        ls_col-is_tech = abap_true.
*        APPEND ls_col TO lt_col_setting.


        """"""""""""""""""""""""""""""""""""""""
        " Anzeige


        data lv_line_end type i.

        if lines(  lt_output ) > 11.
          lv_line_end = 25.
        elseif lines(  lt_output ) <= 6.
          lv_line_end = 10.
        else.
          lv_line_end = 20.
        endif.


        do.

          so_help->gui_popup_gen(
            exporting              it_table              = lt_output
             iv_title              = so_help->get( text = 'X' i_any = '011(N2ALL)' ) "Protokoll
             iv_vertical_lines     = abap_false
             iv_headers_visible    = abap_false
             it_hide = value #(  (  `NO` ) (  `ID` )  )
             it_outlen = value #(  (  name = 'ICON' value = '2' )  (  name = 'TEXT' value = '100' ) )
             it_col_setting = value #( ( name = 'ICON' is_icon = 'X' ) )
             iv_col_start          = '10'
             iv_col_end            = '140'
             iv_line_start         = '1'
             iv_line_end           = lv_line_end
             iv_sel            = lines( lt_output )
             iv_sel_col         = 'ICON'
           importing
             ev_event_type = data(lv_type) "s_event              = ls_event
             ev_event_row = data(lv_row)
          ).

          if lv_type = so_help->cs-s_alv_event_type-double_click. "is_double_click = abap_true.
            gui_popup_t100_ext( it_bapi ).
          else.
            exit.
          endif.

        enddo.


        """""""""""""""""""""""""""""""
        " Fehlerbehandlung
        data: lx_root type ref to cx_root.
      catch cx_root into lx_root.
        "D  NF1 060 Popup wurde abgebrochen
*        mo_help->so_error->raise_msg( iv_id = 'NF1' iv_no = '060' io_previous = lx_salv ) .
    endtry.


  endmethod.

  method gui_popup_t100_ext.

    types:
      begin of ty_s_output,
        type type string,
        text type bapiret2-message,
        no   type bapiret2-number,
        id   type bapiret2-id,
      end of ty_s_output.

    data ls_bapi type bapiret2.
    data lt_out type standard table of ty_s_output.

    type-pools: icon.
    field-symbols <ls_out> type ty_s_output.


    """""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ausgabetabelle bauen

    loop at it_bapi into ls_bapi.
      append initial line to lt_out assigning <ls_out>.
      <ls_out>-text = ls_bapi-message.

      case ls_bapi-type.
        when 'E'.
          <ls_out>-type = icon_led_red.
        when 'S'.
          <ls_out>-type = icon_led_green.
        when 'I'.
          <ls_out>-type = icon_information.
        when 'W'.
          <ls_out>-type = icon_led_yellow.
      endcase.

      <ls_out>-id = ls_bapi-id.
      <ls_out>-no = ls_bapi-number.

    endloop.


    """""""""""""""""""""""""""""""""""""""""""""""""""""
    " ALV bauen



    """"""""""""""""""""""""""""""""""""""""
    " Anzeige


    data lv_line_end type i.

    if lines(  lt_out ) > 11.
      lv_line_end = 25.
    elseif lines(  lt_out ) > 20.
      lv_line_end = 45.
    else.
      lv_line_end = 20.
    endif.

    so_help->gui_popup_gen(
      exporting
        it_table              = lt_out
        iv_title              = so_help->get( text = 'X' i_any = '011(N2ALL)' ) "Protokoll
        iv_vertical_lines     = abap_false
*              iv_headers_visible    = abap_false
*            iv_raise_double_click = abap_true
*            iv_raise_hotspot      = abap_true
*            it_hide = VALUE #(  (  `NO` ) (  `ID` )  )
    it_icon = value #( ( `TYPE` ) )
      it_outlen = value #(  (  name = 'TYPE' value = '2' )  (  name = 'TEXT' value = '85' )  (  name = 'ID' value = '8' )  )
*              it_col_setting        = lt_col_setting
*            it_sort               =
*            iv_optimize_colwidth  = abap_false
        it_col_setting      = value #( ( name = 'TYPE' is_icon = 'X' ) )
        iv_col_start          = '10'
        iv_col_end            = '140'
        iv_line_start         = '1'
            iv_line_end           = lv_line_end
      iv_default_toolbar = abap_true
      is_layout = value disvariant( handle = 'T100_EXT' report = sy-repid )
      iv_layout_restriction = if_salv_c_layout=>restrict_user_dependant
      importing
        ev_event_type = data(lv_type) "s_event              = ls_event
          ev_event_row = data(lv_row)
    ).

  endmethod.

  method popup_table.

    "prüfung ob es einzeilige tablle ist
    so_help->rtti(
      exporting
        i_any                = it_table
      importing
*        ev_line_type_kind    = DATA(lv_line_type_kind)
        ev_line_type_kind_is_c = data(lv_is_c) ).
*        et_comp              = DATA(lt_comp) ).

    if lv_is_c = abap_true.
      popup_clike_one_line(  it_table ).
    else.

      "CIFDISP  DE  A   Anzeige Anzeige Anzeige Anzeige Anzeige

      so_help->gui_popup_gen(
        exporting
          it_table              = it_table
          iv_title              = so_help->get( dd04t = 'X' i_any = 'CIFDISP' ) "Anzeige'
*        iv_vertical_lines     = abap_true
*        iv_headers_visible    = abap_true
*        iv_raise_double_click = abap_true
*        it_col_setting        =
          iv_optimize_colwidth  = abap_true
        iv_col_start          = '10'
        iv_col_end            = '160'
*        iv_line_start         = '10'
*        iv_line_end           = '20'
*      IMPORTING
*        es_event              =
    ).

    endif.

  endmethod.

  method gui_popup_xml.

    cl_abap_browser=>show_xml(
     exporting xml_string = i_iv_xml
               size       = cl_abap_browser=>xlarge ).


  endmethod.

  method gui_popup_selscreen_dynamic.


    data: lv_selection_id type rsdynsel-selid.          " Selection-ID zur Unterscheidung mehrerer Sets
    data: lv_number_of_fields type i.                   " Anzahl der Felder
    data: it_expressions type rsds_texpr.               " Expressions
    data: it_field_ranges type rsds_trange.             " Ranges
    data: it_tables type standard table of rsdstabs.    " Init: Tabellen
    data: it_fields type standard table of rsdsfields.  " Init: Felder
    data: it_where_clauses type rsds_twhere.            " Daten für Where-Tabelle

* Tabelle hinzufügen
    data ls_tab type rsdstabs.
    ls_tab-prim_tab =  iv_tabname.
    insert ls_tab into table it_tables. "= VALUE #( ( prim_tab = lv_tablename ) ).

* freien Selektionsbildschirm initialisieren
    call function 'FREE_SELECTIONS_INIT'
      exporting
        kind                     = 'T' " T: TABLES_TAB G: FIELD_GROUPS_KEY, F: FIELDS_TAB
        expressions              = it_expressions
*       field_groups_key         =
      importing
        selection_id             = lv_selection_id
        field_ranges             = it_field_ranges
      tables
        tables_tab               = it_tables
        fields_tab               = it_fields
      exceptions
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
        others                   = 20.

    if sy-subrc = 0.
* freien Selektionsbildschirm anzeigen
      call function 'FREE_SELECTIONS_DIALOG'
        exporting
          selection_id            = lv_selection_id
          title                   = 'Beispielselektion'
          frame_text              = 'Bitte auswählen'
          status                  = 1                 " normaler Selektionsmodus
          as_window               = abap_false        " abap_true -> als Fenster anzeigen
          no_intervals            = abap_true         " keine Intervalle im Selektionsbild anzeigen, kann über Button "Intervalle" geändert werden
        importing
          where_clauses           = it_where_clauses
          expressions             = it_expressions
          field_ranges            = it_field_ranges
          number_of_active_fields = lv_number_of_fields
        tables
          fields_tab              = it_fields
        exceptions
          internal_error          = 1
          no_action               = 2
          selid_not_found         = 3
          illegal_status          = 4
          others                  = 5.

      rt_where_clauses = it_where_clauses.

    endif.

  endmethod.


  method gui_popup_bal.

    try.

        data:
*      lo_bal        TYPE REF TO lcl_bal,
          ls_profile type bal_s_prof,
          lx_t100    type ref to cx_t100_msg.

        """""""""""""""""""""""""""""""""""""""
        " Handle bestimmen

        data:
          ls_extn   type bal_s_extn,
          ls_sub    type bal_s_sub,
          ls_obj    type bal_s_obj,
          ls_filt   type bal_s_lfil,
          lt_header type balhdr_t,
          ls_header like line of lt_header.

        call function 'MESSAGES_INITIALIZE'.

        ls_extn-sign   = ls_sub-sign   = ls_obj-sign   = 'I'.
        ls_extn-option = ls_sub-option = ls_obj-option = 'EQ'.

        ls_obj-low  = iv_object   .
        ls_sub-low  = iv_subobject.
        ls_extn-low = iv_extnumber.

        append:
            ls_extn to ls_filt-extnumber,
            ls_obj  to ls_filt-object,
            ls_sub  to ls_filt-subobject.

        ##FM_SUBRC_OK
        call function 'BAL_DB_SEARCH'
          exporting
            i_s_log_filter     = ls_filt    " Log header data filter
          importing
            e_t_log_header     = lt_header    " Table of log header data read
          exceptions
            log_not_found      = 1
            no_filter_criteria = 2
            error_message      = 3
            others             = 4.
        if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
        so_help->x_raise_check( function = 'X' ).

        read table lt_header
         into ls_header index 1.
        so_help->x_raise_check( read_table = 'X' ).
*

        data:
          lt_lognumber type bal_t_logn,
          lt_handle    type bal_t_logh.

        loop at lt_header into ls_header.
          append ls_header-lognumber to lt_lognumber.
        endloop.


*    APPEND is_header-lognumber TO lt_lognumber.

        ##FM_SUBRC_OK
        call function 'BAL_DB_LOAD'
          exporting
            i_t_lognumber      = lt_lognumber
          importing
            e_t_log_handle     = lt_handle
          exceptions
            no_logs_specified  = 1
            log_not_found      = 2
            log_already_loaded = 3
            error_message      = 4
            others             = 5.
        if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
        so_help->x_raise_check( function = 'X' ).

*        CALL FUNCTION 'BAL_DSP_PROFILE_POPUP_GET'
*       IMPORTING
*            e_s_display_profile = ls_profile
*       EXCEPTIONS
*            OTHERS              = 1.

        ##FM_SUBRC_OK
        call function 'BAL_DSP_LOG_DISPLAY'
          exporting
            i_t_log_handle       = lt_handle
            i_s_display_profile  = ls_profile
            i_amodal             = ' ' "iv_amodal'
          exceptions
            profile_inconsistent = 01
            internal_error       = 02
            no_data_available    = 03
            no_authority         = 04
            error_message        = 05
            others               = 99.
        if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
        so_help->x_raise_check( function = 'X' ).


        call function 'MESSAGES_INITIALIZE'.

      catch cx_t100_msg into lx_t100.
        "D  WU  733 Keine Daten vorhanden.
        so_help->x_raise( i_any = '733(WU)' i_prev = lx_t100 ).

    endtry.

  endmethod.

  method gui_popup_inform.

    data:
      lv_txt1      type char80,
      lv_txt2      type char80,
      lv_txt3      type char80,
      lv_txt4      type char80,
      lt_stringtab type string_table,
      lv_title     type  sta_ptitel. "  type c length 35

    clear lt_stringtab.
    so_help->trans(
     exporting
        string_2_stringtab   = 'X'
        split_word           = 'X'
        i_any                = is_bapi-message
        i_any2               = 80
      importing
        e_result             = lt_stringtab  ).


    read table lt_stringtab index 1
    into lv_txt1.

    read table lt_stringtab index 2
      into lv_txt2.

    read table lt_stringtab index 3
      into lv_txt3.

    read table lt_stringtab index 4
      into lv_txt4.

    lv_title = so_help->get( dd04t = 'X' i_any = 'GPDINFO' ).

    call function 'POPUP_TO_INFORM'
      exporting
        titel = lv_title
        txt1  = lv_txt1
        txt2  = lv_txt2
        txt3  = lv_txt3
        txt4  = lv_txt4.


  endmethod.


  method gui_popup_pdf.

    "TODO: klappt noch nicht ganz

    data: go_pdf_object type ref to cl_gui_html_viewer,
          go_pdf_dialog type ref to cl_gui_dialogbox_container.
*      go_pdf_handler        TYPE REF TO gc_pdf_handler.

    " in the subroutine get pdf file and convert to binary
    data: gs_fp_outputparams type sfpoutputparams.

    " binary itab definations
    types: begin of ty_itab,
             line type x length 255,
           end of ty_itab.
    data: lt_itab type standard table of x255, "ty_itab,
          lv_url  type char255,
          lv_size type i value 0.

    gs_fp_outputparams-getpdf     = abap_true.

*CALL FUNCTION 'FP_JOB_OPEN'
*  CHANGING
*    ie_outputparams = gs_fp_outputparams.
*
*CALL FUNCTION 'FP_FUNCTION_MODULE_NAME'
*  EXPORTING
*    i_name     = gv_form_name
*  IMPORTING
*    e_funcname = gv_fm_name.
*
*CALL FUNCTION gv_fm_name
*  EXPORTING
*    /1bcdwb/docparams  = gs_fp_docparams
*    iv_sflight         = lt_sflight
*    iv_scarr           = lt_scarr
*    it_sbook           = lt_sbook
*  IMPORTING
*    /1bcdwb/formoutput = gs_fp_outputforms.
    " xstring to binary
    call function 'SCMS_XSTRING_TO_BINARY'
      exporting
        buffer        = iv_file
      importing
        output_length = lv_size
      tables
        binary_tab    = lt_itab.

*CALL FUNCTION 'FP_JOB_CLOSE'.


    " create dialogbox and set data
    create object go_pdf_dialog
      exporting
        width  = 900
        height = 450.

*CREATE OBJECT go_pdf_handler.
*SET HANDLER   go_pdf_handler->close_pdf_view FOR go_pdf_dialog.
    create object go_pdf_object
      exporting
        parent = go_pdf_dialog.

    call method go_pdf_object->load_data
      exporting
        type                   = 'BIN'  " 'TEXT'
        subtype                = 'PDF'          " 'HTML'
        size                   = lv_size
      importing
        assigned_url           = lv_url
      changing
        data_table             = lt_itab
      exceptions
        dp_invalid_parameter   = 1
        dp_error_general       = 2
        cntl_error             = 3
        html_syntax_notcorrect = 4
        others                 = 5.

    call method go_pdf_object->show_data
      exporting
        url      = lv_url
        in_place = abap_true.

    call method go_pdf_dialog->set_visible
      exporting
        visible = abap_true.

  endmethod.

  method gui_popup_confirm.

    data:
      lv_text   type  c length 100,
      lv_answer type c length 1.
    data lv_title type c length 100.

    lv_text = is_bapi-message.
    lv_title = so_help->get( text = 'X' i_any = '168(SWN)' ).

    call function 'POPUP_TO_CONFIRM'
      exporting
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
      importing
        answer                = lv_answer        " Return values: '1', '2', 'A'
*    TABLES
*       parameter             = parameter     " Text transfer table for parameter in text
      exceptions
        text_not_found        = 1             " Diagnosis text not found
        others                = 2.
    if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
    so_help->x_raise_check( function = 'X' ).

    if lv_answer = 1.
      r_result = abap_true.
    else.
      r_result = abap_false.
    endif.


  endmethod.



  method data_2_single_range.



    data: lt_params_sel   type rsparams_tt,
          ls_params       like line of lt_params_sel,
          lv_dirty_assign type string.

*  CLEAR cs_sel.

    field-symbols:" <fs_source>       TYPE any,
      " <fs_destination>  TYPE any,
      <lv_any>          type data,
      <lt_range>        type any,
      <ls_range_s>      type any,
      <lt_range_t>      type standard table,
      <ls_range_result> like line of rt_range. "any.


*    lo_struct ?= cl_abap_structdescr=>describe_by_data( es_structure ).
*    lt_components = lo_struct->get_components( ).

    "Parameter von Selektionsbild auslesen
    so_help->gui_screen( exporting seldata_get = 'X' iv_repid = iv_repid
                    importing e_result = lt_params_sel ).

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

    loop at lt_params_sel into ls_params
        where selname = iv_name.
      "  UNASSIGN: <fs_source>.


      "Variable auslesen
      case ls_params-kind.

        when 'P'.
          concatenate '(' iv_repid ')' ls_params-selname
        into lv_dirty_assign.

          assign (lv_dirty_assign) to <lt_range>.

          append initial line to rt_range assigning <ls_range_result>.

*          ASSIGN COMPONENT 'SIGN' OF STRUCTURE <ls_range_result> TO  <lv_any>.
          <ls_range_result>-sign = 'I'.

*          ASSIGN COMPONENT 'OPTION' OF STRUCTURE <ls_range_result> TO  <lv_any>.
          <ls_range_result>-option = 'EQ'.

*          ASSIGN COMPONENT 'LOW' OF STRUCTURE <ls_range_result> TO  <lv_any>.
          <ls_range_result>-low = <lt_range>.


          delete rt_range where sign is initial and option is initial.


        when 'S'.
          concatenate '(' iv_repid ')' ls_params-selname '[]'
        into lv_dirty_assign.
          assign (lv_dirty_assign) to <lt_range>.
          assign <lt_range> to <lt_range_t>.
          loop at <lt_range_t> assigning <ls_range_s>.
            append initial line to rt_range assigning <ls_range_result>.

            assign component 'SIGN' of structure <ls_range_s> to  <lv_any>.
            <ls_range_result>-sign = <lv_any>.

            assign component 'OPTION' of structure <ls_range_s> to  <lv_any>.
            <ls_range_result>-option = <lv_any>.

            assign component 'LOW' of structure <ls_range_s> to  <lv_any>.
            <ls_range_result>-low = <lv_any>.

            assign component 'HIGH' of structure <ls_range_s> to  <lv_any>.
            <ls_range_result>-high = <lv_any>.

*                 assign COMPONENT 'SIGN' of STRUCTURE <ls_range> to  <lv_any>.
*        <ls_range_result>-sign = <lv_any>.
          endloop.

          delete rt_range where sign is initial and option is initial. " and low is INITIAL and high is initial.

          return.
*        assign <lv_range>->('SIGN') to <lv_any>.

      endcase.

*      ASSIGN (lv_dirty_assign) TO <lv_any>.


      "Typ bestimmen

    endloop.


  endmethod.

  method data_2_where_join.

  endmethod.


  method data_2_struct.


    data: lt_params_sel type rsparams_tt.

*  CLEAR cs_sel.

    lt_params_sel = data_2_params(
       iv_repid = iv_repid
   ).

    trans_params_2_struc( exporting it_params = lt_params_sel  importing es_struc = es_structure ).



  endmethod.


  method data_2_single_value.
    data: lt_params type rsparams_tt,
          ls_param  like line of lt_params.


    lt_params = data_2_params( iv_repid = iv_repid ).

    read table lt_params into ls_param
      with key selname = iv_name.
    so_help->x_raise_check( read_table = abap_true ).

    rv_string = ls_param-low.
*  CATCH cx_t100_msg.
*  CATCH cx_t100_msg.

  endmethod.



  method data_2_where_dirty.


    data: lt_result type rsds_frange_t.
*          lt_params TYPE any.

    data_2_rangetab_dirty(
      exporting
        iv_repid   = iv_repid "SY-REPID
        iv_tabname = iv_tabname
      receiving
        rt_result  = lt_result
    ).

    so_help->trans(
      exporting
        rangetab_2_where = 'X'
        i_any            = lt_result
      importing
        e_result         = r_result  ).


  endmethod.



  method data_2_single_type_dirty.


    data:
*          lo_tab_descr type ref to cl_abap-tabdesr
      lv_dirty_assign type string,
      lo_datadescr    type ref to cl_abap_typedescr.

*  CLEAR cs_sel.

    field-symbols: <lv_any>   type data,
                   <lv_any_t> type standard table,
                   <fs_line>  type any.
*                   <ls_result>          LIKE LINE OF rt_result.



*    lo_struct ?= cl_abap_structdescr=>describe_by_data( es_structure ).
*    lt_components = lo_struct->get_components( ).

    concatenate
        i_ls_params_name
        '[]'
        into lv_dirty_assign.

    assign (lv_dirty_assign) to <lv_any>.


    if sy-subrc = 0.

      assign <lv_any> to <lv_any_t>.
      append initial line to <lv_any_t> assigning <fs_line>.
      assign ('<fs_line>-LOW') to <lv_any>.


    else.

      assign (i_ls_params_name) to <lv_any>.

    endif.


    lo_datadescr = cl_abap_datadescr=>describe_by_data( p_data = <lv_any> ).

    data(lv_name) = lo_datadescr->get_relative_name( ).
    r_result ?= lo_datadescr.
*     cl_abaP_datadescr=>describe_by_name( p_data = <lv_any> ).


  endmethod.

  method data_2_params.

    data:
*          lt_params   TYPE STANDARD TABLE OF rsparams,
          curr_report type raldb_repo.

    curr_report = iv_repid.

    ##FM_SUBRC_OK
    call function 'RS_REFRESH_FROM_SELECTOPTIONS'
      exporting
        curr_report     = curr_report
*   IMPORTING
*       SP              =
      tables
        selection_table = rt_params
*       SELECTION_TABLE_255       =
      exceptions
        not_found       = 1
        no_report       = 2
        others          = 3.
    if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
    so_help->x_raise_check( function = abap_true ).

  endmethod.

  method data_2_rangetab_dirty.


    "Über selscreen tabelle loopen
    "Dirty Assign Typ holen
    "Schauen ob dieser in Zieltabelle
    "Aufnehmen

    data: lo_struct     type ref to cl_abap_structdescr,
*          lo_tab_descr type ref to cl_abap-tabdesr
          lt_components type cl_abap_structdescr=>component_table,
          lt_params_sel type rsparams_tt,
          ls_params     like line of lt_params_sel,
          ls_component  like line of lt_components,
          lo_typename   type ref to cl_abap_datadescr.

*  CLEAR cs_sel.

    field-symbols: <ls_result>          like line of rt_result.


    data:
            ls_result like line of rt_result.

*    lo_struct ?= cl_abap_structdescr=>describe_by_data( es_structure ).
*    lt_components = lo_struct->get_components( ).

    "Parameter von Selektionsbild auslesen
    lt_params_sel = data_2_params(
       iv_repid = iv_repid  ).

    "Zieltabelle auslesen / typen etc
    lo_struct ?= cl_abap_typedescr=>describe_by_name( iv_tabname ).
    lt_components = lo_struct->get_components( ).

    "Rangetabelle erzeugen
    sort lt_params_sel by selname.
    delete adjacent duplicates from lt_params_sel comparing selname.

    loop at lt_params_sel into ls_params.

      lo_typename = data_2_single_type_dirty(  ls_params-selname ).

*    lv_rel_name = lo_typename->get_relative_name(  ).

      read table lt_components into ls_component
          with key type = lo_typename.
      if sy-subrc <> 0.
        continue.
      endif.

      clear ls_result.


      so_help->rtti(
        exporting
*        i_any        =
          i_fnam_type  = lo_typename->absolute_name
          i_fnam_tab   = iv_tabname
        importing
*        ev_typename  =
*        ev_kind      =
*        et_comp      =
*        et_domrange  =
*        ev_convexit  =
*        ev_in_domr   =
          ev_fieldname = ls_result-fieldname
      ).


      so_help->gui_screen( exporting seldata_get = 'X' iv_repid = iv_repid i_any = ls_params-selname
                       importing e_result = ls_result-selopt_t ).


      read table rt_result assigning <ls_result>
        with key fieldname = ls_result-fieldname.

      if sy-subrc <> 0.
        append ls_result to rt_result.
      else.
        append lines of ls_result-selopt_t to <ls_result>-selopt_t.
      endif.

*      APPEND INITIAL LINE TO rt_result ASSIGNING <ls_result>.





    endloop.




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

  endmethod.

  method popup_f4_help_tab.

    data:
      lt_return    type standard table of ddshretval,
      ls_return    like line of lt_return,
      lv_fieldname type  dfies-fieldname.

    lv_fieldname = iv_fieldname.

    call function 'F4IF_INT_TABLE_VALUE_REQUEST'
      exporting
        retfield        = lv_fieldname                           " Spalte, die zurückgegeben werden soll
        window_title    = 'SELECT_VALUE:'    " dafür Bezeichnung
        value_org       = 'S'
      tables
        value_tab       = it_table            " Tabelle mit Werten übergeben
        return_tab      = lt_return         " Rückgabewert
      exceptions
        parameter_error = 1
        no_values_found = 2
        error_message   = 3
        others          = 4.
    if sy-subrc <> 0. sy-subrc = sy-subrc. endif. "SLIN check ok without pragma
    so_help->x_raise_check( function = 'X' i_head = 'ZCX_VALUE_REQUEST_ERROR' ).

    read table lt_return into ls_return
      index 1.
    rv_result = ls_return-fieldval.

  endmethod.



  method popup_f4_help_vari_selscreen.

    data: lv_repid   type rsvar-report,
          lv_variant type rsvar-variant.

    lv_repid = iv_repid.

    ##FM_SUBRC_OK
    call function 'RS_VARIANT_CATALOG'
      exporting
        report               = lv_repid
*       new_title            = space
*       dynnr                =
*       internal_call        = space
*       masked               = 'X'
*       variant              = space
        pop_up               = abap_true
      importing
        sel_variant          = lv_variant
*       sel_variant_text     =
*      TABLES
*       belonging_dynnr      =
      exceptions
        no_report            = 1
        report_not_existent  = 2
        report_not_supplied  = 3
        no_variants          = 4
        no_variant_selected  = 5
        variant_not_existent = 6
        others               = 7.
    if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
    so_help->x_raise_check( function = abap_true ).


    rv_result = lv_variant.

  endmethod.



  method source_code_get_fubaname.

    data:
      lt_source        type string_table,
      lv_counter       type i,
      lv_code          type string,
      lv_temp          type string,
      lv_counter_new   type i,
      lv_line_function type i,
      r_result         type string.


    clear e_v3.

    lt_source = it_source.

    try.

        lv_counter = lines( it_source ) - 5.

        field-symbols: <ls_code> type string.
        loop at lt_source assigning <ls_code>.
          translate <ls_code> to upper case.
        endloop.

        while lv_counter > 0 .

          read table lt_source into lv_code
          index lv_counter.

          if lv_code cs 'CALL FUNCTION' or lv_code cs 'call function'.
            lv_line_function = lv_counter.
            split lv_code at 'CALL FUNCTION'
            into  lv_temp r_result.

            shift r_result left deleting leading ' '.

            "Steht in dieser Zeile Funktionsaufruf oder erst in der nächsten?
            if strlen(  r_result ) = 0.

              lv_counter_new = lv_counter + 1.

              read table lt_source into r_result
              index lv_counter_new.

              shift r_result left deleting leading ' '.

            endif.

            exit.
          endif.

          lv_counter = lv_counter - 1.
        endwhile.

        split r_result at ' '
        into r_result lv_temp.

        r_result = r_result+1.
        data: lv_len type i.
        lv_len = strlen( r_result ) - 1.
        r_result = r_result(lv_len).

        data:
          lv_string_result type string,
          lv_length        type i.

        lv_string_result = so_help->get_bus( tftit_stext_by_funcname = 'X'
                                    i_any = r_result ).
        r_result = ` ` && r_result.
        concatenate '"' lv_string_result '"' ' | ' r_result into lv_string_result
            respecting blanks.

        lv_length = strlen(  lv_string_result ).


        if lv_length <= 45.
          e_v1 =  lv_string_result.
          return.
        endif.

        e_v1 = lv_string_result(45).


        concatenate e_v1 '&2' into e_v1 respecting blanks.
        e_v2 = lv_string_result+45.

        if lv_length <= 95.
          return.
        endif.

        concatenate e_v1 '&3' into e_v1 respecting blanks.
        e_v3 = lv_string_result+95.

*    CONCATENATE r_result ' (' ls_tftit-stext ')' INTO r_result RESPECTING BLANKS.

*    es_stack = is_called.
*    es_stack-line = lv_line_function.

      catch cx_root.
        e_v1 = 'UNKNOWN'.
    endtry.

  endmethod.


  method source_code_get_readtable.

    data:
      lt_source      type string_table,
      lv_counter     type i,
      lv_code        type string,
      lv_temp        type string,
      lv_counter_new type i.

    lv_counter = lines( it_source ) - 6.

    lt_source = it_source.

    field-symbols: <ls_code> type string.
    loop at lt_source assigning <ls_code>.
      translate <ls_code> to upper case.
    endloop.

    while lv_counter > 0 .

      read table lt_source into lv_code
      index lv_counter.

      translate lv_code to upper case.

      if lv_code cs 'TABLE' and lv_code cs 'READ'.

        split lv_code at 'TABLE'
        into  lv_temp r_result.

        shift r_result left deleting leading ' '.

        "Steht in dieser Zeile Funktionsaufruf oder erst in der nächsten?
        if strlen(  r_result ) = 0.

          lv_counter_new = lv_counter + 1.

          read table lt_source into r_result
          index lv_counter_new.

          shift r_result left deleting leading ' '.

        endif.

        exit.
      endif.

      lv_counter = lv_counter - 1.
    endwhile.

    split r_result at ' '
    into r_result lv_temp.

  endmethod.

  method source_code_get_selectname.

    data:
      lt_source      type string_table,
      lv_counter     type i,
      lv_code        type string,
      lv_temp        type string,
      lv_counter_new type i.


    try.

*        break-point.
        lt_source = it_source.

        lv_counter = lines( it_source ) - 5.


        field-symbols: <ls_code> type string.
        loop at lt_source assigning <ls_code>.
          translate <ls_code> to upper case.
        endloop.


        while lv_counter > 0 .

          read table lt_source into lv_code
            index lv_counter.

          if lv_code cs 'FROM'.

            split lv_code at 'FROM'
             into  lv_temp r_result.
            shift r_result left deleting leading ' '.
            "Steht in dieser Zeile shcon Tabelleninfo oder erst in der nächsten?
            if strlen(  r_result ) = 0.
              lv_counter_new = lv_counter + 1.
              read table lt_source into r_result
               index lv_counter_new.
              shift r_result left deleting leading ' '.
            endif.

            exit.
          endif.
          lv_counter = lv_counter - 1.
        endwhile.

        split r_result at ' '
           into r_result lv_temp.

        data lv_string type string.
        lv_string = so_help->get_bus( dd02t_ddtext_by_tabname = 'X' i_any = r_result  ).
        concatenate  '"' lv_string ' (' r_result ')"' into r_result respecting blanks.

      catch cx_root.
        r_result = 'UNKNOWN'.
    endtry.


  endmethod.

  method bal_save.

    data:
      lv_handle  type balloghndl,
      lt_bal_msg type bal_tt_msg,
      ls_bal_msg type bal_s_msg,
      lx_error   type ref to cx_root,
      lt_error   type bapiret2_tab,
      ls_log     type bal_s_log.


    if i_any is initial.
      so_help->x_raise('ZCX_NO_LOG_DATA').
    endif.

    ls_log = is_log.
    ls_log-params-altext = i_any2.

    call function 'BAL_LOG_CREATE'
      exporting
        i_s_log                 = ls_log " Log header data
      importing
        e_log_handle            = lv_handle  " Log handle
      exceptions
        log_header_inconsistent = 1
        error_message           = 3
        others                  = 2.
    if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
    so_help->x_raise_check( function = abap_true ).

    data:
      lt_handle    type bal_t_logh.


    """"""""""""""""""""""""""""""""""""""""
    " Nachrichten übertragen

    so_help->msg(
      exporting
        i_any         = i_any
      importing
        e_any    = lt_bal_msg
    ).

    loop at lt_bal_msg into ls_bal_msg.

      try.
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
          call function 'BAL_LOG_MSG_ADD'
            exporting
              i_log_handle     = lv_handle
              i_s_msg          = ls_bal_msg
            exceptions
              log_not_found    = 1
              msg_inconsistent = 2
              log_is_full      = 3
              error_message    = 4
              others           = 5.
          if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
          so_help->x_raise_check(  function = abap_true ).
*              mo_help->so_check_a_raise->after_function( is_sy = sy ).
          "cx_t100->check_a_raise_function( is_sy = sy ).

        catch cx_t100_msg into lx_error.
          so_help->msg( exporting i_any = lx_error
                 importing e_any =  lt_error  ).
      endtry.

    endloop.

    if lt_error is not initial.

      so_help->x_raise( lt_error ).

    endif.


    """"""""""""""""""""""""""""""""""""""""
    " Speichern

*    DATA:
*       ls_header TYPE balhdr.

    data:
*      <lt_handle TYPE bal_t_logh,
      lt_log_nr type bal_t_lgnm.

    clear lt_handle.
    append lv_handle to lt_handle.

    call function 'BAL_DB_SAVE'
      exporting
*       i_client         = SY-MANDT    " Client in which the new log is to be saved
*       i_in_update_task = SPACE    " Save in UPDATE TASK
*       i_save_all       = 'X'    " Save all logs in memory
        i_t_log_handle   = lt_handle    " Table of log handles
*       i_2th_connection = 'X'   " FALSE: No secondary connection
*       i_2th_connect_commit = 'X' "SPACE'    " FALSE: No COMMIT in module
*       i_link2job       = 'X'    " Boolean Variable (X=True, -=False, Space=Unknown)
      importing
        e_new_lognumbers = lt_log_nr   " Table of new log numbers
*       e_second_connection  =     " Name of Secondary Connection
      exceptions
        log_not_found    = 1
        save_not_allowed = 2
        numbering_error  = 3
        error_message    = 4
        others           = 5.
    if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
    so_help->x_raise_check( function = abap_true ).
*        mo_help->so_check_a_raise->after_function( is_sy = sy ).


  endmethod.


  method selscreen_struc_2_screen.



    data: lo_struct     type ref to cl_abap_structdescr,
          lt_components type cl_abap_structdescr=>component_table,
          lt_params_sel type rsparams_tt,
          lt_params_new type rsparams_tt,
          lv_selname    type string.

    field-symbols:
      <ls_params>  type line of rsparams_tt,
      <ls_params2> type line of rsparams_tt.
*  CLEAR cs_sel.

    field-symbols: "<fs_source>          TYPE any,
      <fs_destination>     type any,
      <fs_destination_tab> type standard table,
      <fs_component>       like line of lt_components,
      <lv_any>             type data,
      <fs_line>            type any.
    data ls_new type line of rsparams_tt.
    data lt_new type rsparams_tt.

    lo_struct ?= cl_abap_structdescr=>describe_by_data( is_struc ).
    lt_components = lo_struct->get_components( ).


    so_help->gui_screen(
      exporting
        seldata_get = 'X'
        iv_repid    = iv_repid
      importing
        e_result   = lt_params_sel ) .


      loop at lt_components assigning <fs_component>.

          data(lo_eledescr) = <fs_component>-type.

          clear ls_new.
          ls_new-selname = <fs_component>-name.

          assign component <fs_component>-name of structure is_struc to <fs_destination>.

          case lo_eledescr->kind. "<fs_component>-type.

            when cl_abap_datadescr=>kind_table.

              assign <fs_destination> to <fs_destination_tab>.

              loop at  <fs_destination_tab> assigning <fs_line>.

                ls_new-kind = 'S'.

                assign component 'LOW' of structure <fs_line> to <lv_any>.
                ls_new-low = <lv_any>.
                assign component 'HIGH' of structure <fs_line> to <lv_any>.
                ls_new-high = <lv_any>.
                assign component 'SIGN' of structure <fs_line> to <lv_any>.
                ls_new-sign = <lv_any>.
                assign component 'OPTION' of structure <fs_line> to <lv_any>.
                ls_new-option = <lv_any>.

                insert ls_new into table lt_new.

              endloop.

           when others.
              ls_new-low = <fs_destination>.
              insert ls_new into table lt_new.

          endcase.

        endloop.

        so_help->gui_screen( seldata_set = 'X' iv_repid = iv_repid i_any = lt_new ).


      endmethod.


      method trans_params_2_struc.


        data: lo_struct     type ref to cl_abap_structdescr,
              lt_components type cl_abap_structdescr=>component_table,
*          lt_params_sel TYPE rsparams_tt,
              ls_params     like line of it_params.

*  CLEAR cs_sel.

        field-symbols: "<fs_source>          TYPE any,
          <fs_destination>     type any,
          <fs_destination_tab> type standard table,
          <fs_component>       like line of lt_components,
          <lv_any>             type data,
          <fs_line>            type any.

        try.

            lo_struct ?= cl_abap_structdescr=>describe_by_data( es_struc ).
            lt_components = lo_struct->get_components( ).

            loop at it_params into ls_params.
              unassign: <fs_destination>. ", <fs_source>.


              if ls_params-sign is initial and ls_params-option is initial
                  and ls_params-low is initial and ls_params-high is initial.
                continue.
              endif.


              read table lt_components assigning <fs_component>
                  with key name = ls_params-selname.
              if sy-subrc <> 0.
                continue.
              endif.


              assign component <fs_component>-name of structure es_struc to <fs_destination>.

              case ls_params-kind.

                when 'S'.
                  assign <fs_destination> to <fs_destination_tab>.
                  append initial line to <fs_destination_tab> assigning <fs_line>.

                  if ls_params-low is not initial.
                    assign component 'LOW' of structure <fs_line> to <lv_any>.


                    so_help->conv(
                 exporting
                   i_any   = ls_params-low
                   exit_in = abap_true
                 importing
                   r_result       =  <lv_any>  ).
*               <lv_any> = ls_params-low.
*              <lv_any> = so_help->conv_exit( <lv_any> ).

                  endif.

                  if ls_params-high is not initial.

                    assign component 'HIGH' of structure <fs_line> to <lv_any>.


                    so_help->conv(
                 exporting
                   i_any   = ls_params-high
                   exit_in = abap_true
                 importing
                   r_result       =  <lv_any>  ).

                  endif.
*              <lv_any> = ls_params-high.
*              <lv_any> = so_help->conv_exit( <lv_any> ).
                  assign component 'SIGN' of structure <fs_line> to <lv_any>.
                  <lv_any> = ls_params-sign.
                  assign component 'OPTION' of structure <fs_line> to <lv_any>.
                  <lv_any> = ls_params-option.

**          lv_name = ls_params-selname && '[]'.
*          ASSIGN (lv_name) TO <lv_any>.
                when 'P'.
*            break-point.
                  so_help->conv(
                    exporting
                      i_any   = ls_params-low
                      exit_in = abap_true
                    importing
                      r_result =  <fs_destination>  ).
                  continue.
              endcase.

            endloop.
            data lx_root type ref to cx_root.
          catch cx_root into lx_root.
            so_help->x_raise(  lx_root ).
        endtry.
      endmethod.


*  METHOD on_double_click.
*    ss_alv_tmp-row = row.
*    ss_alv_tmp-col = column.
*    ss_alv_tmp-is_double_click = abap_true.
*    LEAVE TO SCREEN 0.
*
*  ENDMETHOD.


      method t100_get_w_text.

        try.

            r_result-message = iv_text.
            r_result-message_v1 = so_help->get( print ='X' i_any = iv_v1 ).
            r_result-message_v2 = so_help->get( print ='X' i_any = iv_v2 ).
            r_result-message_v3 = so_help->get( print ='X' i_any = iv_v3 ).
            r_result-message_v4 = so_help->get( print ='X' i_any = iv_v4 ).
            r_result = lcl_help=>t100_replace_placeholder( is_bapi = r_result ).
            r_result-id = '00'.
            r_result-number = 398.

            clear:
            r_result-message_v1,
            r_result-message_v2,
            r_result-message_v3,
            r_result-message_v4.

            data lv_char200 type c length 200.
            lv_char200 = r_result-message.
            r_result-message_v1 = lv_char200(50).
            r_result-message_v2 = lv_char200+50(50).
            r_result-message_v3 = lv_char200+100(50).
            r_result-message_v4 = lv_char200+150(50).

          catch cx_root.

            r_result-id = '00'.
            r_result-number = 398.
        endtry.

      endmethod.


      method t100_replace_placeholder.

        data ls_bapi type bapiret2.

        ls_bapi = is_bapi.

        if ls_bapi-id = '00' and ls_bapi-number = 398.

          concatenate
              ls_bapi-message_v1
              ls_bapi-message_v2
              ls_bapi-message_v3
              ls_bapi-message_v4
              into ls_bapi-message respecting blanks.

        else.

          if ls_bapi-message_v1 is not initial.
            replace '&1' in ls_bapi-message with ls_bapi-message_v1.
            if sy-subrc <> 0.
              replace '&' in ls_bapi-message with ls_bapi-message_v1.
            endif.
*            clear iv_v1.
          endif.

          if ls_bapi-message_v2 is not initial.
            replace '&2' in ls_bapi-message with ls_bapi-message_v2.
            if sy-subrc <> 0.
              replace '&' in ls_bapi-message with ls_bapi-message_v2.
            endif.
          endif.

          if ls_bapi-message_v3 is not initial.
            replace '&3' in ls_bapi-message with ls_bapi-message_v3.
            if sy-subrc <> 0.
              replace '&' in ls_bapi-message with ls_bapi-message_v3.
            endif.
          endif.

          if ls_bapi-message_v4 is not initial.
            replace '&4' in ls_bapi-message with ls_bapi-message_v4.
            if sy-subrc <> 0.
              replace '&' in ls_bapi-message with ls_bapi-message_v4.
            endif.
          endif.

        endif.

        r_result = ls_bapi.


      endmethod.



      method cx_set.
        ix_no_check->previous = ix_prev.
      endmethod.


      method cx_no_2_static.

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

      endmethod.


      method source_code_get_not_initial.
        data: ls_callstack   type abap_callstack_line,
              it_source      type string_table,
              lv_counter     type i value 20,
              lv_code        like line of it_source,
              it_source_new  type string_table,
              lv_counter_new type i,
              lv_temp        type string.

        so_help->info(
          exporting
            iv_depth           = 2
*      raise_error        = abap_false
          importing
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

        do 20 times.

          read table it_source into data(ls_source)
              index ls_callstack-line.

          append ls_source to it_source_new.
          delete it_source index ls_callstack-line.

        enddo.

        it_source = it_source_new.

        field-symbols: <ls_code> type string.
        loop at it_source assigning <ls_code>.
          translate <ls_code> to upper case.
        endloop.


        while lv_counter > 0 .

          read table it_source into lv_code
            index lv_counter.

          if lv_code cs 'FROM'.

            split lv_code at 'FROM'
             into  lv_temp r_result.
            shift r_result left deleting leading ' '.
            "Steht in dieser Zeile shcon Tabelleninfo oder erst in der nächsten?
            if strlen(  r_result ) = 0.
              lv_counter_new = lv_counter + 1.
              read table it_source into r_result
               index lv_counter_new.
              shift r_result left deleting leading ' '.
            endif.

            exit.
          endif.
          lv_counter = lv_counter - 1.
        endwhile.

        split r_result at ' '
           into r_result lv_temp.

        data lv_string type string.
        lv_string = so_help->get_bus( dd02t_ddtext_by_tabname = 'X' i_any = r_result  ).
        concatenate r_result '(' lv_string ')' into r_result respecting blanks.

      endmethod.


      method get_convexit.


        data:
          lr_value    type ref to data,
          lv_convexit type string.

        field-symbols:
          <lv_value> type any.

*    try.
        "Ausgabe vorbereiten
        r_result = i_any.
        shift r_result left deleting leading ' '.

        "Convexit bestimmen
        if iv_exit is not initial.
          lv_convexit = iv_exit.
        elseif iv_type is not initial.
          so_help->rtti(
           exporting
             iv_name = iv_type
           importing
             ev_convexit  = lv_convexit ).
        else.
          so_help->rtti(
         exporting
           i_any        = i_any
         importing
           ev_convexit  = lv_convexit ).
        endif.

        if lv_convexit is initial.

          "Wurde Konv Exit als Type reingegeben?
          if iv_type is not initial.
            r_result = get_convexit(
                 i_any       = i_any
                 iv_exit     = iv_type
             ).
          endif.


          return.
        endif.

        if iv_is_input = abap_true.
          concatenate
        'CONVERSION_EXIT_'
        lv_convexit
        '_INPUT'
        into lv_convexit.
        else.
          concatenate
           'CONVERSION_EXIT_'
           lv_convexit
           '_OUTPUT'
           into lv_convexit.
        endif.


        "Zielwert vorbereiten
        if iv_type is not initial.
          create data lr_value
              type (iv_type).
          assign lr_value->* to <lv_value>.
          <lv_value> = i_any.
        else.
          assign i_any  to <lv_value>.
        endif.


        call function lv_convexit
          exporting
            input           = <lv_value>
          importing
            output          = <lv_value>
          exceptions
            check_failed    = 1
            not_numeric     = 2
            t344_get_failed = 3
            wrong_length    = 4
            error_message   = 5
            others          = 6.
        if sy-subrc <> 0.
          so_help->x_raise( sy ).
        endif.

        r_result = <lv_value>.

*        data: lx_root type ref to cx_root.
*      catch cx_root into lx_root.
*        if lcl_help=>sv_is_assert_when_error = abap_true.
*          assert 1 = 0.
*        endif.
*    endtry.

      endmethod.


      method write.

        data:
          lv_kind      type string,
          lv_type      type string,
          lv_line_type type string,
          lt_comp      type abap_component_tab.

        so_help->rtti(
          exporting
            i_any                = i_any
*        iv_name              =
*        i_fnam_type          =
*        i_fnam_tab           =
*        iv_langu             = SY-LANGU
*        raise_error          = ABAP_FALSE
          importing
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


        case lv_kind.

          when cl_abap_typedescr=>kind_elem.

            data lv_tmp type c length 500.
            data lv_value type string.
            data: ls_comp like line of lt_comp.
            write i_any to lv_tmp.
            r_result = lv_tmp.
            shift r_result left deleting leading ' '.

          when cl_abap_typedescr=>kind_struct.

            field-symbols: <any> type any.

            r_result = lv_type.
            loop at lt_comp into ls_comp.
              assign component ls_comp-name of structure i_any to <any>.
              lv_value = write(  <any> ).
              concatenate r_result ';' ls_comp-name '=' lv_value into r_result.
            endloop.

          when cl_abap_typedescr=>kind_table.

            data lv_line type string.
            field-symbols: <lt_table> type standard table, <ls_line> type any.
            assign i_any to <lt_table>.
            loop at <lt_table> assigning <ls_line>.
              lv_line = write( <ls_line> ).
              concatenate r_result cl_abap_char_utilities=>cr_lf lv_line into r_result.
            endloop.

        endcase.

      endmethod.



      method handle_error.

        if raise_error = abap_true.
          so_help->x_raise( ix_root ).
        endif.
*    if raise_assert is supplied.
*      if raise_assert = abap_true.
*        assert 1 = 0.
*      endif.
*    elseif  sv_is_assert_when_error = abap_true.
*      assert 1 = 0.
*    endif.

      endmethod.


      method round2.

        data lv_count_decimals type i.
        lv_count_decimals = iv_decimals.

        data(lv_p_handle) = cl_abap_elemdescr=>get_p(
             p_length                   =  16   " Länge des P-Feldes (in Bytes)
             p_decimals                 =  lv_count_decimals + 1 ).


        data(lv_p_handle2) = cl_abap_elemdescr=>get_p(
        p_length                   =  16   " Länge des P-Feldes (in Bytes)
        p_decimals                 =  lv_count_decimals ).


*         DATA(lv_p_handle) = cl_abap_elemdescr=>get_p(
*               p_length                   =  16   " Länge des P-Feldes (in Bytes)
*               p_decimals                 =  lv_count_decimals + 1 ).


        field-symbols: <lv_p> type p.
        data lv_p type ref to data.

        create data lv_p
            type handle lv_p_handle.

        assign  lv_p->* to <lv_p>.

        so_help->conv( exporting i_any    = i_any
                      importing r_result = <lv_p> ).






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


        call function 'ROUND'
          exporting
            decimals      = lv_count_decimals
            input         = <lv_p>
            sign          = 'X' "lv_sign
          importing
            output        = <lv_p>
          exceptions
            input_invalid = 1
            overflow      = 2
            type_invalid  = 3
            error_message = 4
            others        = 5.
        if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
        so_help->x_raise_check( function = 'X' ).

        so_help->conv( exporting i_any    = <lv_p>
                       importing r_result = e_result ).

        return.


*        ENDIF.

      endmethod.


      method conv_unit.

        data lv_p_in  type p length 16 decimals 6.
        data lv_p_out type p length 16 decimals 6.

        so_help->conv(
          exporting
            i_any          = i_any
            raise_error    = abap_true
          importing
            r_result       = lv_p_in
        ).

        call function 'UNIT_CONVERSION_SIMPLE'
          exporting
            input                = lv_p_in   " Eingabewert
*           no_type_check        = 'X'    " Typprüfung für Umrechnungsfaktoren
*           round_sign           = SPACE    " Kennzeichen für Rundung (+ auf, - ab, X kaufm.)
            unit_in              = i_unit_in    " Einheit des Eingabewertes
            unit_out             = i_unit_out "SPACE    " Einheit des Ausgabewertes
          importing
*           add_const            =     " additive Konstante für die Umrechnung
*           decimals             =     " Anzahl Dezimalen für die Rundung
*           denominator          =     " Nenner für die Umrechnung
*           numerator            =     " Zähler für die Umrechnung
            output               = lv_p_out   " Ausgabewert
          exceptions
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
            others               = 11.
        if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
        so_help->x_raise_check( function = 'X').

        so_help->conv(
          exporting
            i_any          = lv_p_out
            raise_error    = abap_true
          importing
            r_result       = e_result
        ).



      endmethod.

      method is_range_valid.



        field-symbols:
          <sign>   type any,
          <option> type any,
          <low>    type any,
          <high>   type any.

        try.


            case  so_help->get( rtti_kind = 'X' i_any = i_any ).

              when cl_abap_typedescr=>kind_table.

                field-symbols: <lt_any> type any table.
                field-symbols: <ls_any> type any.

                assign i_any to <lt_any>.

                loop at <lt_any> assigning <ls_any>.

                  r_result = is_range_valid( i_any = <ls_any> ).

                  if r_result = abap_false.
                    return.
                  endif.

                endloop.

                return.

              when others.
                r_result = abap_false.
                return.

            endcase.


            """""""""""""""""""""""""""""""""""""""""""""""""""
            " Struktur prüfen

            assign ('I_ANY-OPTION') to <option>.
            assign ('I_ANY-SIGN')   to <sign>.
            assign ('I_ANY-HIGH')   to <high>.
            assign ('I_ANY-LOW')    to <low>.


            if <option> is not assigned
              or <sign> is not assigned
              or <high> is not assigned
              or <low> is not assigned.
              r_result = abap_false.
              return.
              "d 1x  208 fehler: die übergebene tabelle ist keine ranges-tabelle!
*          so_help->so_cx_factory->raise_msg( iv_msgid = '1X' iv_msgno = 208 ).
*          so_help->raise( iv_id = '1X' iv_no = '208' ).
            endif.

*        so_help->so_abap->rtts_get_info_simple(
*            EXPORTING
*              iv_element      = <low>
*            IMPORTING
*              ev_typename     = lv_typename
*              ev_scrtext_s    = lv_descr ).
*        CONCATENATE lv_descr '(' lv_typename ')' INTO lv_typename.


            """""""""""""""""""""""""""""""""""""""""""""""""""
            " Validieren

            if  <option> <> 'EQ'
            and <option> <> 'GE'
            and <option> <> 'CP'
            and <option> <> 'BT'
            and <option> <> 'NE'
            and <option> <> 'LT'
            and <option> <> 'GT'
            and <option> <> 'NP'
            and <option> <> 'NB'.

              "RSPLS  600 Range-Eintrag &1 zu Merkmal &2 ist fehlerhaft. Feld &3 ist nicht gültig.
*          so_help->so_cx_factory->raise_msg( iv_msgid = 'RSPLS' iv_msgno = 600 iv_v1 = 'OPTION'
*                      iv_v2 =  lv_typename iv_v3 = <option> ).
              return.

            endif.

            if <sign> <> 'I'
            and <sign> <> 'E'.

              "RSPLS  600 Range-Eintrag &1 zu Merkmal &2 ist fehlerhaft. Feld &3 ist nicht gültig.
*          so_help->so_cx_factory->raise_msg( iv_msgid = 'RSPLS' iv_msgno = 600 iv_v1 = '_' iv_v2 = 'SIGN' iv_v3 = <sign> ).
              return.

            endif.


            r_result = abap_true.


            """"""""""""""""""""""""""""""""""""""""""""
            " Fehlerbehandlung

            data: lx_t100 type ref to cx_t100_msg.
          catch cx_t100_msg into lx_t100.

*        IF <low> IS ASSIGNED.
*          "  D  1X  207 Fehler in der Ranges-Tabelle &!
*          so_help->so_cx_factory->raise_msg( iv_msgid = '1X' iv_msgno = 207
*          iv_v1 = lv_typename io_previous = lx_t100 ).
*
*        ELSE.
*          RAISE EXCEPTION lx_t100.
*        ENDIF.

        endtry.



      endmethod.

      method http_request_get.



        data:
          lv_host type string,
          lv_uri  type string,
          lv_v1   type string, lv_v2 type string, lv_v3 type string, lv_v4 type string.

        lv_host = iv_host.
        lv_uri  = iv_uri.


* Method-Local Data Declarations:
        data: lo_http_client type ref to if_http_client.

        cl_http_client=>create_by_url(
          exporting
            url                =  lv_host   " URL
          importing
            client             =  lo_http_client   " HTTP Client Abstraction
          exceptions
            argument_not_found = 1
            plugin_not_active  = 2
            internal_error     = 3
            others             = 4
        ).
        if sy-subrc <> 0.
          lv_v1 = sy-msgv1.  lv_v2 = sy-msgv2.  lv_v3 = sy-msgv3.  lv_v4 = sy-msgv4.
          raise exception type cx_t100_msg
            exporting
              t100_msgid = sy-msgid
              t100_msgno = sy-msgno
              t100_msgv1 = lv_v1
              t100_msgv2 = lv_v2
              t100_msgv3 = lv_v3
              t100_msgv4 = lv_v4.
        endif.





        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

        lo_http_client->request->set_method(
        if_http_request=>co_request_method_get ).

        if iv_authenticate_name is not initial and iv_authenticate_pw is not initial.
          lo_http_client->authenticate( username = iv_authenticate_name
                                 password = iv_authenticate_pw ).

          lo_http_client->propertytype_logon_popup =  lo_http_client->co_enabled.

        endif.

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
        call method lo_http_client->send
          exceptions
            http_communication_failure = 1
            http_invalid_state         = 2
            http_processing_failed     = 3
            http_invalid_timeout       = 4
            others                     = 5.
        if sy-subrc ne 0.
          lv_v1 = sy-msgv1.  lv_v2 = sy-msgv2.  lv_v3 = sy-msgv3.  lv_v4 = sy-msgv4.
          raise exception type cx_t100_msg
            exporting
              t100_msgid = sy-msgid
              t100_msgno = sy-msgno
              t100_msgv1 = lv_v1
              t100_msgv2 = lv_v2
              t100_msgv3 = lv_v3
              t100_msgv4 = lv_v4.
        endif.

* Receive the results:
        call method lo_http_client->receive
          exceptions
            http_communication_failure = 1
            http_invalid_state         = 2
            http_processing_failed     = 3
            others                     = 4.
        if sy-subrc <> 0.
          lv_v1 = sy-msgv1.  lv_v2 = sy-msgv2.  lv_v3 = sy-msgv3.  lv_v4 = sy-msgv4.
          raise exception type cx_t100_msg
            exporting
              t100_msgid = sy-msgid
              t100_msgno = sy-msgno
              t100_msgv1 = lv_v1
              t100_msgv2 = lv_v2
              t100_msgv3 = lv_v3
              t100_msgv4 = lv_v4.
        endif.


        data: lv_http_rc type i, lv_reason type string.
        lo_http_client->response->get_status( importing
                                              code   = lv_http_rc
                                              reason = lv_reason ).

*    rs_result-http_code = lv_http_rc.
*    rs_result-http_text = lv_reason.
*    rs_result-result    = lo_http_client->response->get_cdata( ).


        lo_http_client->close( ).

      endmethod.


      method popup_alv_f4.

*    TRY.
*
        data: ls_variant type disvariant.

* ---------------------------------------------------------------------
* Input aufbereiten

        if iv_repid is supplied.
          ls_variant-report   = iv_repid.
        else.
          ls_variant-report   = cl_abap_syst=>get_current_program( ).
        endif.

*    IF iv_uname IS SUPPLIED.
        ls_variant-username = iv_uname.
*    ELSE.
**      ls_variant-username = cl_abap_syst=>get_user_name( ).
*    ENDIF.

        ls_variant-handle = iv_handle.


        """""""""""""""""""""""""""""""""""
        " Check

        if ls_variant-report is initial.
*      lcl_help_factory_all=>so_error->raise_text(
*          'Kein Reportnamen übergeben' ).
        endif.


* ---------------------------------------------------------------------
* F4-Hilfe aufrufen

        call function 'LT_F4_FOR_VARIANTS'
          exporting
            i_tool          = 'LT'
            i_sap           = 'X'
            is_variant      = ls_variant
            i_customer      = 'X'
            i_user_specific = 'X'
            i_no_aedat      = 'X'
            i_no_aetime     = 'X'
            i_no_aename     = 'X'
            i_no_default    = 'X'
          importing
            es_variant      = ls_variant
          exceptions
            not_found       = 1
            error_message   = 2
            others          = 3.
        if sy-subrc <> sy-subrc. sy-subrc = sy-subrc. endif. "SLINT Check OK withoput pragma
        so_help->x_raise_check(  function = 'X' ).
*    lcl_help_factory_all=>so_check_a_raise->after_function( is_sy = sy ).

* ---------------------------------------------------------------------
* Usereingabe übernehmen

        if ls_variant-variant ne ' '.
          rv_vari = ls_variant-variant.
        else.
*      rv_vari = iv_vari.
        endif.


        """"""""""""""""""""""""""""""""
        " Fehlerbehandlung

*        DATA: lx_ro<ot TYPE REF TO cx_root.
*      CATCH cx_root INTO lx_root.
*        lcl_help_factory_all=>so_gui->popup_exception(  lx_root ).
*    ENDTRY.

      endmethod.                    "get_layout_f4_help



      method gui_popup_bal_list_tab.

        type-pools: icon.

        types:
          begin of ty_s_output,
            type      type string,
            aldate    type sy-datum,
            altime    type sy-uzeit,
            aluser    type baluser,
            altext    type baltext,
            object    type balobj_d,
            subobject type balsubobj,
            extnumber type balnrext,
            lognumber type balognr,
*        no    TYPE bapiret2-number,
*        id    TYPE bapiret2-id,
*        text  TYPE bapiret2-message,
          end of ty_s_output.

        field-symbols:
            <ls_out> type ty_s_output.
        data ls_bal type balhdr.
        field-symbols: <lt_any> type any table.
        data ls_out type ty_s_output.
        assign i_any to <lt_any>.

        type-pools: icon.

        """""""""""""""""""""""""""""""""""""""""""""""""""""
        " Ausgabetabelle bauen

        try.

            data:
             lt_output type standard table of ty_s_output.
            clear lt_output.
*        APPEND INITIAL LINE TO lt_output.

            loop at <lt_any> into ls_bal.

              append initial line to lt_output assigning <ls_out>.

              move-corresponding ls_bal to <ls_out>.

              if ls_bal-msg_cnt_e > 0.
                <ls_out>-type = icon_led_red.

              elseif ls_bal-msg_cnt_w > 0.
                <ls_out>-type = icon_led_yellow.

              elseif ls_bal-msg_cnt_s > 0.
                <ls_out>-type = icon_led_green.

              endif.
*          <ls_out>-uzeit     = ls_bal-alchtime.
*          <ls_out>-datum     = ls_bal-alchdate.
*          <ls_out>-lognumber = ls_bal-lognumber.
*          <ls_out>-aluser    = ls_bal-alchuser.
            endloop.

            so_help->itab(
              exporting
                change_sequence    = 'X'
              changing
                ct_tab             = lt_output
            ).



            """"""""""""""""""""""""""""""""""""""""
            " Anzeige


            data lv_line_end type i.

            if lines(  lt_output ) > 11.
              lv_line_end = 25.
            elseif lines(  lt_output ) > 20.
              lv_line_end = 45.
            else.
              lv_line_end = 20.
            endif.


            do.

              so_help->gui_popup_gen(
                exporting
                  it_table              = lt_output
                  iv_title              =  so_help->get( text = 'X' i_any = '011(N2ALL)' ) "Protokoll
*              iv_vertical_lines     = abap_false
*              iv_headers_visible    = abap_false
*            iv_raise_double_click = abap_true
                it_raise_hotspot = value #( ( `LOGNUMBER` ) )
                it_hide = value #(  (  `OBJECT` ) (  `SUBOBJECT` ) (  `EXTNUMBER` )  )
                it_outlen = value #(  (  name = 'TYPE' value = '1' )
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
            is_layout = value disvariant( handle = 'POPUP_BAL_LIST' report = sy-repid )
          iv_layout_restriction = if_salv_c_layout=>restrict_user_dependant
                importing
                  ev_event_type = data(lv_type) "s_event              = ls_event
                    ev_event_row = data(lv_row)
                    er_line = ls_out
              ).

*          lo_alv->ms_salv-o_salv->display( ).

              if lv_type = so_help->cs-s_alv_event_type-double_click or
                lv_type = so_help->cs-s_alv_event_type-hotspot_click. "is_double_click = abap_true.


                data lt_bal type standard table of balm.

                data lv_lognumber type string.
                lv_lognumber = '00000000000141546804'.

                so_help->service(
                  exporting
                    crud        = so_help->cs-s_crud-read
                    bal         = 'X'
                    i_key1      = ls_out-object
                    i_key2      = ls_out-subobject
                    i_key3      = ls_out-extnumber
                    i_key4      = ls_out-lognumber
                  importing
                    e_result    = lt_bal
                ).

                so_help->gui_popup( lt_bal ).

              else.
                exit.
              endif.

            enddo.


            """""""""""""""""""""""""""""""
            " Fehlerbehandlung
            data: lx_root type ref to cx_root.
          catch cx_root into lx_root.
            "D  NF1 060 Popup wurde abgebrochen
*        mo_help->so_error->raise_msg( iv_id = 'NF1' iv_no = '060' io_previous = lx_salv ) .
        endtry.


      endmethod.



      method gui_popup_bal_tab.

        type-pools: icon.

        types:
          begin of ty_s_output,
            type  type string,
            text  type bapiret2-message,
            datum type baldate,
            uzeit type baltime,
            no    type bapiret2-number,
            id    type bapiret2-id,
          end of ty_s_output.

        field-symbols:
            <ls_out> type ty_s_output.
        data ls_bal type balm.
        field-symbols: <lt_any> type any table.

        assign i_any to <lt_any>.

        """""""""""""""""""""""""""""""""""""""""""""""""""""
        " Ausgabetabelle bauen

        try.

            data:
             lt_output type standard table of ty_s_output.
            clear lt_output.
*        APPEND INITIAL LINE TO lt_output.

            loop at <lt_any> into ls_bal.


              append initial line to lt_output assigning <ls_out>.
              <ls_out>-text = so_help->get( text = 'X' i_any = ls_bal ).

*          IF  <ls_output>-text IS INITIAL.
*            <ls_output>-text = ls_bapi-message.
*          ENDIF.
              case ls_bal-msgty.
                when 'E'.
                  <ls_out>-type = icon_led_red.
                when 'S'.
                  <ls_out>-type = icon_led_green.
                when 'I'.
                  <ls_out>-type = icon_information.
                when 'W'.
                  <ls_out>-type = icon_led_yellow.
              endcase.

              <ls_out>-id = ls_bal-msgid.
              <ls_out>-no = ls_bal-msgno.

              convert time stamp ls_bal-time_stmp time zone sy-zonlo into date <ls_out>-datum time <ls_out>-uzeit.

            endloop.
*break-point.

            so_help->itab(
              exporting
*            delete_duplicates  =
                change_sequence    = 'X'
*            move_corresponding =
*            merge              =
*            raise_error        = ABAP_FALSE
              changing
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

*        clear ls_col.
*        ls_col-name = 'TEXT'.
*        ls_col-out_length = '120'.
*        APPEND ls_col TO lt_col_setting.
*
*        clear ls_col.
*        ls_col-name = 'TYPE'.
*        ls_col-is_icon = abap_true.
*        ls_col-out_length = '2'.
*        APPEND ls_col TO lt_col_setting.
*
*        clear ls_col.
*        ls_col-name = 'ID'.
*        ls_col-out_length = '5'.
*        ls_col-is_tech = abap_true.
*        APPEND ls_col TO lt_col_setting.
*
*        clear ls_col.
*        ls_col-name = 'NO'.
*        ls_col-out_length = '3'.
*        ls_col-is_tech = abap_true.
*        APPEND ls_col TO lt_col_setting.


            """"""""""""""""""""""""""""""""""""""""
            " Anzeige


            data lv_line_end type i.

            if lines(  lt_output ) > 11.
              lv_line_end = 25.
            elseif lines(  lt_output ) > 20.
              lv_line_end = 45.
            else.
              lv_line_end = 20.
            endif.


            do.

              so_help->gui_popup_gen(
                exporting
                  it_table              = lt_output
                  iv_title              =  so_help->get( text = 'X' i_any = '011(N2ALL)' ) "Protokoll
*              iv_vertical_lines     = abap_false
*              iv_headers_visible    = abap_false
*            iv_raise_double_click = abap_true
*            iv_raise_hotspot      = abap_true
*            it_hide = VALUE #(  (  `NO` ) (  `ID` )  )
                it_outlen = value #(  (  name = 'TYPE' value = '2' )
                                      (  name = 'TEXT' value = '80' )
                                      (  name = 'ID' value = '6' )
                                      (  name = 'UZEIT' value = '8' )
                                      (  name = 'DATUM' value = '10' )
                                      )
*              it_col_setting        = lt_col_setting
*            it_sort               =
*            iv_optimize_colwidth  = abap_false
*            iv_col_start          = '10'
                iv_col_end            = '140'
                iv_line_start         = '1'
                iv_line_end           = lv_line_end
                      iv_default_toolbar = abap_true
            is_layout = value disvariant( handle = 'POPUP_BAL' report = sy-repid )
          iv_layout_restriction = if_salv_c_layout=>restrict_user_dependant
                importing
                  ev_event_type = data(lv_type) "s_event              = ls_event
                    ev_event_row = data(lv_row)
              ).

*          lo_alv->ms_salv-o_salv->display( ).

              if lv_type = so_help->cs-s_alv_event_type-double_click. "is_double_click = abap_true.
*            READ TABLE it_bapi INTO ls_bapi
*                INDEX lv_row - 1.
*            IF sy-subrc = 0.
*              clear lt_bapi.
*              APPEND ls_bapi TO lt_bapi.
*            popup_table( it_bapi ).
*            ENDIF.
              else.
                exit.
              endif.

            enddo.


            """""""""""""""""""""""""""""""
            " Fehlerbehandlung
            data: lx_root type ref to cx_root.
          catch cx_root into lx_root.
            "D  NF1 060 Popup wurde abgebrochen
*        mo_help->so_error->raise_msg( iv_id = 'NF1' iv_no = '060' io_previous = lx_salv ) .
        endtry.


      endmethod.


      method popup_json.

      endmethod.


      method popup_cust.

        field-symbols <lv_key1_user> type string.
        field-symbols <lv_key2_user> type string.
        field-symbols <ls_user> type any.
        field-symbols <ls_user_b> type any.

        field-symbols <lv_key1_gen> type string.
        field-symbols <lv_key2_gen> type string.
        field-symbols <ls_gen> type any.
        field-symbols <ls_gen_b> type any.
        field-symbols <ls_cust> type any.

        assign i_any->('KEY1_USER') to <lv_key1_user>.
        assign i_any->('KEY2_USER') to <lv_key2_user>.
        assign i_any->('S_USER') to <ls_user>.
        assign i_any->('S_USER_BACKUP') to <ls_user_b>.
        assign i_any->('KEY1_GEN') to <lv_key1_gen>.
        assign i_any->('KEY2_GEN') to <lv_key2_gen>.
        assign i_any->('S_GEN') to <ls_gen>.
        assign i_any->('S_GEN_BACKUP') to <ls_gen_b>.
        assign i_any->* to <ls_cust>.

        do.
          data lv_index type string.

          lv_index = so_help->get( popup_choose    = 'X'
                                i_any = value string_table(
                                       ( `USER_CUSTOMIZING`)
                                       ( `USER_CUSTOMIZING_RESET` )
                                       ( `GENERAL_CUSTOMIZING`)
                                       ( `GENERAL_CUSTOMIZING_RESET`)
                                       ( `CUSTOMIZING` ) )
                                i_any2 = lv_index ).

          try.

              case lv_index.

                when '1'.

                  so_help->gui_popup( exporting json = 'X' i_any = <ls_user>
                               importing e_any = <ls_user> ).

                  case sy-ucomm.

                    when so_help->cs-s_popup_answer-yes. "'WB_SAVE'.

                      so_help->service(
                          crud        =  so_help->cs-s_crud-update
                          all         = 'X'
                          i_key1      = <lv_key1_user>
                          i_key2      = <lv_key2_user>
                          i_key3      = sy-uname
                          i_any       = <ls_user> "ss_cust-s_user
                          commit      = abap_true
                      ).

                      so_help->gui_popup( msg = 'X' i_any = 'DB_UPDATE_SUCCESSFUL' ).

                    when others.
*              lcl_help=>gui( popup_info = 'X' i_any = 'Aktion abgebrochen' ).
                  endcase.

                when '2'.

                  so_help->service(
                      crud        =  so_help->cs-s_crud-delete
                      all         = 'X'
                      i_key1      = <lv_key1_user>
                      i_key2      = <lv_key2_user>
                      i_key3      = sy-uname
                      raise_error = abap_true
                      commit      = abap_true
                   ).

                  <ls_user> = <ls_user_b>.
                  so_help->gui_popup( msg = 'X' i_any = 'DB_UPDATE_SUCCESSFUL' ).


                when '3'.

                  so_help->gui_popup( exporting json = 'X' i_any =  <ls_gen>
                                importing e_any = <ls_gen> ).

                  case sy-ucomm.

                    when 'WB_SAVE'.

                      so_help->service(
                          crud        =  so_help->cs-s_crud-update
                          all         = 'X'
                          i_key1      = <lv_key1_gen>
                          i_key2      = <lv_key2_gen>
                          i_any       = <ls_gen>
                          commit      = abap_true
                      ).

                      so_help->gui_popup( msg = 'X' i_any = 'DB_UPDATE_SUCCESSFUL' ).

                    when others.
*              lcl_help=>gui( popup_info = 'X' i_any = 'Aktion abgebrochen' ).
                  endcase.


                when '4'.

                  so_help->service(
                      crud        =  so_help->cs-s_crud-delete
                       all         = 'X'
                       i_key1      = <lv_key1_gen>
                       i_key2      = <lv_key2_gen>
                       raise_error = abap_true
                       commit      = abap_true
                    ).

                  <ls_gen> = <ls_gen_b>.
                  so_help->gui_popup( msg = 'X' i_any = 'DB_UPDATE_SUCCESSFUL' ).


                when '5'.

                  so_help->gui_popup( exporting json = 'X' i_any =  <ls_cust>
                                importing e_any = <ls_cust> ).


                when others.
                  exit.

              endcase.

            catch cx_root into data(lx_root).
              so_help->gui_popup( lx_root ).
          endtry.
        enddo.

      endmethod.


      method init_cust.

        field-symbols <lv_key1_user> type string.
        field-symbols <lv_key2_user> type string.
        field-symbols <ls_user> type any.
        field-symbols <ls_user_b> type any.

        field-symbols <lv_key1_gen> type string.
        field-symbols <lv_key2_gen> type string.
        field-symbols <ls_gen> type any.
        field-symbols <ls_gen_b> type any.
        field-symbols <ls_cust> type any.

        data e_any type ref to data.

        e_any = ref #(  e_any2 ).

        assign e_any->('KEY1_USER') to <lv_key1_user>.
        assign e_any->('KEY2_USER') to <lv_key2_user>.
        assign e_any->('S_USER') to <ls_user>.
        assign e_any->('S_USER_BACKUP') to <ls_user_b>.
        assign e_any->('KEY1_GEN') to <lv_key1_gen>.
        assign e_any->('KEY2_GEN') to <lv_key2_gen>.
        assign e_any->('S_GEN') to <ls_gen>.
        assign e_any->('S_GEN_BACKUP') to <ls_gen_b>.
        assign e_any->* to <ls_cust>.

        <ls_user_b> = <ls_user>.
        <ls_gen_b> = <ls_gen>.

        try.
            so_help->service(
              exporting
                   crud        = so_help->cs-s_crud-read
                all         = 'X'
                i_key1      = <lv_key1_user>
                i_key2      = <lv_key2_user>
                i_key3      = sy-uname
                raise_error = 'X'
              importing
                e_result    = <ls_user>
            ).
          catch cx_root.
        endtry.

        try.
            so_help->service(
              exporting
                   crud        = so_help->cs-s_crud-read
                all         = 'X'
                i_key1      = <lv_key1_gen>
                i_key2      = <lv_key2_gen>
                raise_error = 'X'
              importing
                e_result    = <ls_gen>
            ).
          catch cx_root.
        endtry.


      endmethod.


      method mock_data.

        field-symbols <table> type standard table.
        field-symbols <struct> type any.
        field-symbols <elem> type any.
        case so_help->get( rtti_kind = 'X' i_any = e_mock ).

          when cl_abap_datadescr=>kind_table.

            assign e_mock to <table>.
            do 10 times.
              append initial line to <table> assigning <struct>.
              mock_data( importing e_mock = <struct> ).
            enddo.


          when cl_abap_datadescr=>kind_struct.

            do.
              assign component sy-index of structure e_mock to <elem>.
              if sy-subrc <> 0.
                exit.
              endif.
              mock_data( importing e_mock = <elem> ).
            enddo.

          when cl_abap_datadescr=>kind_elem.

            case so_help->get( rtti_type_kind = 'X' i_any = e_mock ).

              when
                 cl_abap_datadescr=>typekind_string or
                 cl_abap_datadescr=>typekind_char or
                 cl_abap_datadescr=>typekind_csequence.

                e_mock = 'ABCDEFGHIJKLMNOPQRSTUVW'.

              when
                 cl_abap_datadescr=>typekind_num or
                 cl_abap_datadescr=>typekind_numeric.

                e_mock = '123456789101112131415161718191'.

              when
                  cl_abap_datadescr=>typekind_int or
                  cl_abap_datadescr=>typekind_int1 or
                  cl_abap_datadescr=>typekind_int2. " OR
*              cl_abap_datadescr=>typekind_int8.

                data(o_rnd) = new cl_random_number( ).
                o_rnd->if_random_number~init( ).
                e_mock = o_rnd->if_random_number~get_random_int( 100 ).


            endcase.
        endcase.

      endmethod.


      method gui_get_screenshot.

        data: lv_mime_type type string.
        data: lv_image_bytes type xstring.

* Screenshot aufnehmen
        cl_gui_frontend_services=>get_screenshot( importing
                                                    mime_type_str = lv_mime_type
                                                    image         = lv_image_bytes ).

        r_result = lv_image_bytes.

      endmethod.


      method service_file_read.

* Dateiinhalt (Binärdatenstrom) als xstring
        data: lv_bytes_xstr type xstring.
* Pfad + Dateiname auf dem Appl.-Server
        data(lv_file) = i_lv_directory.

        try.
* Datei zum binären Lesen öffnen
            open dataset lv_file for input in binary mode.
            if sy-subrc <> 0.
              so_help->x_raise( 'SERVICE_FILE_READ_ERROR' ). "
            endif.
* Daten bis Dateiende lesen
            read dataset lv_file into lv_bytes_xstr.

            if sy-subrc <> 0.
              so_help->x_raise( 'SERVICE_FILE_READ_ERROR' ). " 'Fehler beim Lesen.'.
            endif.

* Datei schließen
            close dataset lv_file.

          catch cx_root into data(e_txt).
            so_help->x_raise( e_txt ).
        endtry.

      endmethod.


      method service_file_update.

* Dateiinhalt (Binärdatenstrom) als xstring
        data(lv_bytes_xstr) = i_data.
* Pfad + Dateiname auf dem Appl.-Server
        data(lv_file) = iv_direct.

        try.
* Datei zum binären Schreiben öffnen
            open dataset lv_file for output in binary mode.
            if sy-subrc <> 0.
              so_help->x_raise( 'SERVICE_FILE_UPDATE_ERROR' ). " 'Fehler beim Lesen.'.
            endif.

* Binärdaten in die Datei schreiben
            transfer lv_bytes_xstr to lv_file.

* Datei schließen
            close dataset lv_file.

          catch cx_root into data(e_txt).
            so_help->x_raise( e_txt ). " 'Fehler beim Lesen.'.
        endtry.

      endmethod.

endclass.
