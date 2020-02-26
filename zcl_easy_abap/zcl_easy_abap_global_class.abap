"! Easy abap
"! Helps with messages, exceptions, conversions, gui popups ...
"! v 0.61 - 01.02.2020
"! https://github.com/lars-sawyer/easy_abap

class zcl_easy_abap definition
  public
  create public .

  public section.
    type-pools abap .
    type-pools rsds .

    types:
      begin of ty,

        o_easy_abap type ref to zcl_easy_abap,
        t_ref_data  type standard table of ref to data with empty key,
        t_ref_obj   type standard table of ref to object with empty key,
        t_bal       type standard table of balm with empty key,
        t_seqg3     type standard table of seqg3 with empty key,


        begin of ty_s_col_setup,
          name       type string,
          is_tech    type abap_bool,
          is_icon    type abap_bool,
          is_hotspot type abap_bool,
          is_button  type abap_bool,
          out_length type string,
          title      type string,
          color      type string,
        end of ty_s_col_setup,

        ty_t_setup  type standard table of ty-ty_s_col_setup with default key,

        begin of  s_cx_data,
          s_bapiret     type bapiret2,
          s_callstack   type abap_callstack_line,
          t_callstack   type abap_callstack,
          t_source_code type string_table,
          serial_value  type string,
          add_serial    type string,
          add_t100      type bapiret2_tab,
          add_write     type string_table,
          noid          type string,
          s_sy          type sy,
          timestampl    type timestampl,
          guid          type string,
          code          type string,
        end of s_cx_data,

        begin of s_msg,
          s_balm   type balm,
          s_bapi   type bapiret2,
          t_bapi   type bapiret2_tab,
          t_bal    type ty-t_bal,
          text     type string,
          noid     type string,
          type     type string,
          is_error type abap_bool,
        end of s_msg,

        begin of s_rtti,
          handle       type ref to cl_abap_datadescr,
          handle_struc type ref to cl_abap_datadescr,
          handle_tab   type ref to cl_abap_datadescr,
        end of s_rtti,

        begin of s_info,
          date         type d,
          time         type t,
          timestampl   type timestampl,
          time_iso8601 type string,
          user         type string,
          log_info     type string,
        end of s_info,

      end of ty .

    constants:
      begin of cs,

        begin of s_popup_answer,
          exit type string value 'EXIT',
          yes  type string value 'YES',
          no   type string value 'NO',
        end of s_popup_answer,

        begin of s_alv_event_type,
          double_click       type string value 'DOUBLE_CLICK',
          hotspot_click      type string value 'HOTSPOT_CLICK' ##NO_TEXT,
          toolbar_click      type string value 'TOOLBAR_CLICK',
          popup_cancel       type string value 'POPUP_CANCEL',
          popup_close        type string value 'POPUP_CLOSE',
          after_data_changed type string value 'AFTER_DATA_CHANGED',
          menu_button        type string value 'MENU_BUTTON',
          f4_help            type string value 'F4_HELP',
        end of s_alv_event_type,

        begin of s_crud,
          create type string value 'UPDATE',
          read   type string value 'READ',
          update type string value 'UPDATE',
          delete type string value 'UPDATE',
        end of s_crud,

        begin of s_error_code,
          user_exit     type string     value 'ZCX_USER_EXIT',
          no_data       type string     value 'ZCX_NO_DATA',
          input_invalid type string     value 'ZCX_INPUT_INVALID',
        end of s_error_code,

      end of cs .
    data:
      begin of ms,
        t_log type bapiret2_tab,
        t_bal type ty-t_bal,
      end of ms.
    class-data:
      begin of ss_db_buffer,
        t_t100       type hashed table of t100       with unique key sprsl arbgb msgnr,
        t_dd04t      type hashed table of dd04t      with unique key rollname ddlanguage,
        t_dd04l      type hashed table of dd04l      with unique key rollname,
        t_dd01l      type hashed table of dd01l      with unique key domname,

        t_kna1       type hashed table of kna1       with unique key kunnr,
        t_lfa1       type hashed table of lfa1       with unique key lifnr,
        t_makt       type hashed table of makt       with unique key spras matnr,
        t_materialid type hashed table of materialid with unique key matnr_int,
        t_mara       type hashed table of mara       with unique key matnr,
        t_ihpa       type hashed table of ihpa       with unique key objnr parvw counter,
        t_cslt       type hashed table of cslt       with unique key spras kokrs lstar,
      end of ss_db_buffer .

    class-methods get
      importing
        !conv_in         type abap_bool optional
        !conv_out        type abap_bool optional
        !print           type abap_bool optional
        !print_deep      type abap_bool optional
        !xml             type abap_bool optional
        !json            type abap_bool optional
        !json_deep       type abap_bool optional
        !zip             type abap_bool optional
        !unzip           type abap_bool optional
        !trim_upper_case type abap_bool optional
        !trim            type abap_bool optional
        !param_user      type abap_bool optional
        !param_system    type abap_bool optional
        !param_id        type abap_bool optional
        !print_date      type abap_bool optional
        !print_time      type abap_bool optional
        !msg_type        type abap_bool optional
        !text            type abap_bool optional
        !dd04t           type abap_bool optional
        !guid16          type abap_bool optional
        !rtti_kind       type abap_bool optional
        !rtti_type       type abap_bool optional
        !rtti_type_kind  type abap_bool optional
        !rtti_type_super type abap_bool optional
        !rtti_type_dynam type abap_bool optional
        !rtti_type_line  type abap_bool optional
        !popup_choose    type abap_bool optional
        !popup_get_value type abap_bool optional
        !methodname      type abap_bool optional
        !hash            type abap_bool optional
        !cx_code         type abap_bool optional
        !i_any           type any optional
        !i_any2          type any optional
        !i_any3          type any optional
        !i_any4          type any optional
        !i_any5          type any optional
        !iv_langu        type any default sy-langu
        !raise_error     type abap_bool default abap_false
        !log_info        type abap_bool optional
      returning
        value(r_result)  type string .
    class-methods get_bus
      importing
        !vekp_exidv_by_venum            type abap_bool optional
        !vekp_venum_by_exidv            type abap_bool optional
        !makt_maktx_by_matnr            type abap_bool optional
        !matnr_ext                      type abap_bool optional
        !mara_meins_by_matnr            type abap_bool optional
        !vbak_vbeln_by_likp_vorg        type abap_bool optional
        !kna1_name1_by_kunnr            type abap_bool optional
        !lfa1_name1_by_lifnr            type abap_bool optional
        !vbpa_kunnr_by_vbeln_pos_parvw  type abap_bool optional
        !ihpa_parnr_by_objnr_parvw      type abap_bool optional
        !cslt_ltext_by_lang_kokrs_lstar type abap_bool optional
        !dd02t_ddtext_by_tabname        type abap_bool optional
        !dd04l_domname_by_rollname      type abap_bool optional
        !dd04l_outputlen_by_rollname    type abap_bool optional
        !dd04l_leng_by_rollname         type abap_bool optional
        !dd01l_convexit_by_domname      type abap_bool optional
        !dd04t_scrtext_by_rollname_leng type abap_bool optional
        !t100_text_by_no_id             type abap_bool optional
        !userdetail_info_by_pernr       type abap_bool optional
        !tftit_stext_by_funcname        type abap_bool optional
        !i_any                          type any optional
        !i_any2                         type any optional
        !i_any3                         type any optional
        !iv_langu                       type any default sy-langu
        !raise_error                    type abap_bool default abap_false
        !conv_exit                      type abap_bool default abap_false
        !refresh_memory                 type abap_bool default abap_false
      returning
        value(r_result)                 type string .
    class-methods do
      importing
        !free_sy             type abap_bool optional
        !commit_a_wait       type abap_bool optional
        !rollback            type abap_bool optional
        !email_send          type abap_bool optional
        !idoc_send           type abap_bool optional
        !raise_event         type abap_bool optional
        !rfc_new_task        type abap_bool optional
        !rfc_background_task type abap_bool optional
        !rfc_parallel_task   type abap_bool optional
        !amc_send            type abap_bool optional
        !amc_receiver_list   type abap_bool optional
        !http_req_set        type abap_bool optional
        !http_req_get        type abap_bool optional
        !report_start        type abap_bool optional
        !init                type abap_bool optional
        !init_cust           type abap_bool optional
        !i_any               type any optional
        !i_any2              type any optional
        !i_any3              type any optional
        !i_any5              type any optional
        !raise_error         type abap_bool default abap_false
      exporting
        !e_any               type any .
    class-methods info
      importing
        !iv_depth              type any optional
        !raise_error           type abap_bool default abap_false
      exporting
        value(ev_date)         type d
        value(ev_time)         type t
        value(ev_timestampl)   type timestampl
        value(ev_time_iso8601) type string
        !ev_username           type string
        !ev_ip_adress          type string
        !ev_is_gui_active      type abap_bool
        !ev_sy_msgtext         type string
        !es_callstack          type abap_callstack_line
        !et_callstack          type abap_callstack
        !ev_repid              type string
        !ev_method             type string
        !et_dequeue_table      type ty-t_seqg3                      "wlf_seqg3_tab
        !ev_work_process_id    type string
        !et_source_code        type string_table
        !ev_log_info           type string
        !e_mock                type any
      returning
        value(r_result)        type ty-s_info .
    class-methods check
      importing
        !tab_equal           type abap_bool optional
        !syst                type abap_bool optional
        !t100_error          type abap_bool optional
        !t100_msg            type abap_bool optional
        !value_in_struct     type abap_bool optional
        !in_domrange         type abap_bool optional
        !initial             type abap_bool optional
        !bound               type abap_bool optional
        !true                type abap_bool optional
        !false               type abap_bool optional
        !assigned            type abap_bool optional
        !range_valid         type abap_bool optional
        !field_exist         type abap_bool optional
        !function_exist      type abap_bool optional
        !lock_is_set         type abap_bool optional
        !castable            type abap_bool optional
        !convertible         type abap_bool optional
        !rtti_type_kind_cseq type abap_bool optional
        !value_in_tab        type abap_bool optional
        !gui_active          type abap_bool optional
        !popup_confirm       type abap_bool optional
        value(i_any)         type any optional
        value(i_any2)        type any optional
        value(i_any3)        type any optional
        value(i_any4)        type any optional
        !raise_error         type abap_bool default abap_false
        !iv_depth            type any default 0
      returning
        value(r_result)      type abap_bool .
    class-methods itab
      importing
        !delete_duplicates  type abap_bool optional
        !change_sequence    type abap_bool optional
        !move_corresponding type abap_bool optional
        !merge              type abap_bool optional
        !raise_error        type abap_bool default abap_false
      changing
        !ct_tab             type standard table .
    class-methods rtti
      importing
        !i_any                  type any optional
        !iv_name                type any optional
        !i_fnam_type            type any optional
        !i_fnam_tab             type any optional
        !iv_langu               type any default sy-langu
        !raise_error            type abap_bool default abap_false
          preferred parameter i_any
      exporting
        !ev_kind                type string
        !ev_type                type string
        !ev_type_is_ddic        type abap_bool
        !ev_type_abap           type string
        !ev_type_kind           type string
        !ev_type_kind_is_c      type abap_bool
        !ev_line_kind           type string
        !ev_line_type           type string
        !ev_line_type_kind      type string
        !ev_line_type_kind_is_c type abap_bool
        !ev_line_type_is_ddic   type abap_bool
        !ev_table_type          type string
        !ev_ref_dyn             type string
        !ev_ref_stat            type string
        !ev_ref_super           type string
        !et_ref_super           type string_table
        !et_comp                type abap_component_tab
        !ev_domname             type string
        !et_domrange            type standard table
        !ev_convexit            type clike
        !ev_in_domr             type abap_bool
        !ev_fieldname           type clike
        !ev_typedescr           type clike
        !ev_outputlen           type i
        !ev_length              type i
        !eo_handle              type ref to cl_abap_datadescr
      returning
        value(r_result)         type ty-s_rtti .
    class-methods trans
      importing
        !id                 type abap_bool optional
        !xml                type abap_bool optional
        !json               type abap_bool optional
        !print              type abap_bool optional
        !zip                type abap_bool optional
        !unzip              type abap_bool optional
        !tab_2_tab          type abap_bool optional
        !xml_2              type abap_bool optional
        !json_2             type abap_bool optional
        !value_2_range      type abap_bool optional
        !xml_2_itab         type abap_bool optional
        !rangetab_2_where   type abap_bool optional
        !params_2_struct    type abap_bool optional
        !value_2_rangetab   type abap_bool optional
        !string_2_stringtab type abap_bool optional
        !split_word         type abap_bool optional
        !copy               type abap_bool optional
        value(i_any)        type any optional
        value(i_any2)       type any optional
        !raise_error        type abap_bool default abap_false
          preferred parameter i_any
      exporting
        value(e_result)     type any .
    class-methods conv
      importing
        value(i_any)    type any
        !iv_unit_input  type any optional
        !iv_unit_result type any optional
        !iv_round_deci  type i optional
        !exit_in        type abap_bool default abap_false
        !raise_error    type abap_bool default abap_false
      exporting
        !r_result       type any .
    class-methods msg
      importing
        value(i_any)    type any optional
        value(i_id)     type any optional
        value(i_no)     type any optional
        value(i_type)   type any optional
        value(i_v1)     type any optional
        value(i_v2)     type any optional
        value(i_v3)     type any optional
        value(i_v4)     type any optional
        !use_t100_only  type abap_bool default abap_false
        !i_langu        type any default sy-langu
        !raise_error    type abap_bool default abap_false
          preferred parameter i_any
      exporting
        !e_any          type any
        !e_any_add      type any
      returning
        value(r_result) type ty-s_msg .
    "!
    "! @parameter crud | Welche Prozedur soll druchgeführt werden
    "! @parameter so10 |
    "! @parameter bal |
    "! @parameter bal_list |
    "! @parameter vari |
    "! @parameter all |
    "! @parameter gos_list |
    "! @parameter gos_head |
    "! @parameter gos_content |
    "! @parameter i_key1 |
    "! @parameter i_key2 |
    "! @parameter i_key3 |
    "! @parameter i_key4 |
    "! @parameter raise_error |
    "! @parameter e_result |
    class-methods service
      importing
        !crud           type string
        !all            type abap_bool optional
        !so10           type abap_bool optional
        !bal            type abap_bool optional
        !bal_list       type abap_bool optional
        !vari           type abap_bool optional
        !gos_list       type abap_bool optional
        !gos_head       type abap_bool optional
        !gos_content    type abap_bool optional
        !file           type abap_bool optional
        !i_key1         type any optional
        !i_key2         type any optional
        !i_key3         type any optional
        !i_key4         type any optional
        !i_any          type any optional
        !i_any2         type any optional
        !commit         type abap_bool default abap_false
        !raise_error    type abap_bool default abap_false
      exporting
        value(e_result) type data .
    class-methods x_raise
      importing
        value(i_any)    type any optional
        value(i_head)   type any optional
        value(i_prev)   type any optional
        !i_code         type any optional
        !i_ser_value    type any optional
        !i_ser_data     type any optional
        !i_add_t100     type any optional
        !i_add_write    type any optional
        !iv_depth       type i default 0
        !resumable      type abap_bool default abap_false
          preferred parameter i_any
      returning
        value(r_result) type ref to cx_no_check .
    class-methods x_raise_check
      importing
        !read_table      type abap_bool optional
        !select          type abap_bool optional
        !function        type abap_bool optional
        !method          type abap_bool optional
        !for_all_entries type abap_bool optional
        !not_initial     type abap_bool optional
        !msg_not_error   type abap_bool optional
        !sy_subrc        type abap_bool optional
        !sy_msgty        type abap_bool optional
        value(i_check1)  type any optional
        value(i_check2)  type any optional
        value(i_check3)  type any optional
        !is_sy           type sy default sy
        !i_flag          type any optional
        !iv_subrc        type any optional
        !i_val1          type any optional
        !i_val2          type any optional
        !i_val3          type any optional
        !i_val4          type any optional
        !i_code          type any optional
        !i_ser_value     type any optional
        !i_ser_data      type any optional
        !i_add_t100      type any optional
        !i_add_write     type any optional
        value(i_head)    type any optional
        value(i_prev)    type any optional
        !resumable       type any default abap_false
      returning
        value(r_result)  type ref to cx_root .
    class-methods x_info
      importing
        !ix_root        type ref to cx_root
        !raise_error    type abap_bool default abap_false
      exporting
        !ev_code        type string
        !et_add_t100    type bapiret2_tab
        !ev_guid        type string
        !et_source      type string_table
        !et_callstack   type abap_callstack
        !ev_val_print   type string
        !es_bapiret     type bapiret2
        !e_add_serial   type string
        !es_data        type ty-s_cx_data
      returning
        value(r_result) type ty-s_cx_data .
    class-methods gui_popup
      importing
        !msg_error        type abap_bool optional
        !msg_warning      type abap_bool optional
        !msg_success      type abap_bool optional
        !msg_info         type abap_bool optional
        !msg              type abap_bool optional
        !t100             type abap_bool optional
        !t100_ext         type abap_bool optional
        !print            type abap_bool optional
        !xml              type abap_bool optional
        !json             type abap_bool optional
        !json_deep        type abap_bool optional
        !tab              type abap_bool optional
        !exception        type abap_bool optional
        !cust             type abap_bool optional
        !balm             type abap_bool optional
        !balm_list        type abap_bool optional
        !selbild          type abap_bool optional
        !f4_help          type abap_bool optional
        !f4_help_tab      type abap_bool optional
        !get_value        type abap_bool optional
        !confirm          type abap_bool optional
        !range            type abap_bool optional
        !choose           type abap_bool optional
        !vari_alv         type abap_bool optional
        !vari_sel         type abap_bool optional
        !selscreen_dyn    type abap_bool optional
        !file_download    type abap_bool optional
        !file_upload      type abap_bool optional
        !start_se16n_edit type abap_bool optional
        !start_bal        type abap_bool optional
        !start_tcode      type abap_bool optional
        !start_browser    type abap_bool optional
        !call_view        type abap_bool optional
        !get_screenshot   type abap_bool optional
        !i_any            type any optional
        !i_any2           type any optional
        !i_any3           type any optional
        !i_any4           type any optional
        !i_any5           type any optional
        !i_any6           type any optional
        !iv_type          type any optional
        !iv_title         type any optional
        !raise_error      type abap_bool default abap_false
          preferred parameter i_any
      exporting
        !e_any            type any
        !ev_answer        type string .
    class-methods gui_popup_gen
      importing
        !it_table              type standard table
        !iv_title              type clike default sy-title
        !iv_vertical_lines     type abap_bool default abap_true
        !iv_headers_visible    type abap_bool default abap_true
        !iv_raise_double_click type abap_bool default abap_true
        !iv_default_toolbar    type abap_bool default abap_false
        !it_icon               type string_table optional
        !it_raise_hotspot      type string_table optional
        !it_outlen             type name2stringvalue_table optional
        !it_title              type name2stringvalue_table optional
        !it_sort               type string_table optional
        !it_hide               type string_table optional
        !it_col_setting        type ty-ty_t_setup optional
        !iv_optimize_colwidth  type abap_bool default abap_false
        !is_layout             type disvariant optional
        !iv_layout_restriction type any optional
        !iv_col_start          type any default '10'
        !iv_col_end            type any default '160'
        !iv_line_start         type any default '1'
        !iv_line_end           type any default '25'
        !iv_sel                type any optional
        !iv_sel_col            type any optional
        !raise_error           type abap_bool default abap_false
      exporting
        !ev_event_type         type string
        !ev_event_row          type i
        !ev_event_col          type string
        !ev_event_value        type string
        !et_selection          type salv_t_row
        !er_line               type data
        !ev_ucomm              type string .
    class-methods gui_cfw
      importing
        !get_fcat            type abap_bool default abap_false
        !do_suppress_toolbar type abap_bool default abap_false
        !i_any               type any optional
        !raise_error         type abap_bool default abap_false
      exporting
        !e_any               type any .
    class-methods gui_screen
      importing
        !seldata_set       type abap_bool default abap_false
        !seldata_set_vari  type abap_bool default abap_false
        !seldata_get       type abap_bool default abap_false
        !title_set         type abap_bool default abap_false
        !status            type abap_bool optional
        !status_progress   type abap_bool optional
        !status_set        type abap_bool default abap_false
        !elem_set_by_dirty type abap_bool default abap_false
        !elem_set_by_value type abap_bool default abap_false
        !elem_get_by_value type abap_bool default abap_false
        !elem_active       type abap_bool default abap_false
        !elem_inactive     type abap_bool default abap_false
        !elem_invisible    type abap_bool default abap_false
        !elem_intensify    type abap_bool default abap_false
        !i_any             type any optional
        !i_any2            type any optional
        !iv_repid          type any optional
        !raise_error       type abap_bool default abap_false
      exporting
        !e_result          type any .
    class-methods json
      importing
        !json_2      type abap_bool default abap_false
        !i_any       type any optional
        !i_any2      type any optional
        !i_any3      type any optional
        !i_any4      type any optional
        !i_any5      type any optional
        !it_r_data   type ty-t_ref_data optional
        !it_r_object type ty-t_ref_obj optional
        !raise_error type abap_bool default abap_false
      exporting
        !e_any1      type any
        !e_any2      type any
        !e_any3      type any
        !e_any4      type any
        !e_any5      type any
        !e_ref1      type any
        !e_type1     type any
        !e_kind1     type any
        !e_ref2      type any
        !e_type2     type any
        !e_kind2     type any
        !e_ref3      type any
        !e_type3     type any
        !e_kind3     type any
        !e_ref4      type any
        !e_type4     type any
        !e_kind4     type any
        !e_ref5      type any
        !e_type5     type any
        !e_kind5     type any
        !et_r_data   type ty-t_ref_data
        !et_r_object type ty-t_ref_obj .
    methods log
      importing
        value(i_any)    type any optional
        value(i_id)     type any optional
        value(i_no)     type any optional
        value(i_type)   type any optional
        value(i_v1)     type any optional
        value(i_v2)     type any optional
        value(i_v3)     type any optional
        value(i_v4)     type any optional
        !use_t100_only  type abap_bool default abap_false
        !i_langu        type any default sy-langu
        !raise_error    type abap_bool default abap_false
          preferred parameter i_any
      returning
        value(r_result) type ty-o_easy_abap .
endclass.



class zcl_034tmm_easy_abap_01 implementation.


  method check.

    "Sammlung diverser Checks
    "Bsp Message Type, Werte in Range, Tabellen gleich usw
    try.
        case abap_true.

          when popup_confirm.
            data lv_answer type string.
            gui_popup(
              exporting
                confirm     = 'X'
                i_any             = i_any
              importing
*            e_any             =
                ev_answer         = lv_answer
            ).

            case lv_answer.
              when cs-s_popup_answer-yes.
                r_result = abap_true.
            endcase.

          when in_domrange.

            r_result = lcl_help=>rtts_is_in_domrange( iv_any = i_any ).


          when tab_equal.

            data(lv_tab1_json) = get( json = 'X' i_any = i_any ).
            data(lv_tab2_json) = get( json = 'X' i_any = i_any2 ).
            if lv_tab1_json = lv_tab2_json.
              r_result = abap_true.
            else.
              r_result = abap_false.
            endif.


          when range_valid.

            r_result = lcl_help=>is_range_valid( i_any = i_any ).


          when gui_active.

            info( importing ev_is_gui_active = r_result ).


          when rtti_type_kind_cseq.

            rtti( exporting i_any = i_any
                  importing ev_type_kind_is_c = r_result  ).


          when value_in_tab.

            field-symbols: <lt_table> type standard table.
            field-symbols: <l_any>    type any.
            field-symbols: <l_value>  type any.

            "prÃ¼ft ob der wert i_any3
            "in der tabelle i_any mit Spalte i_any2 vorhanden ist

            assign i_any to <lt_table>.
            loop at <lt_table> assigning <l_any>.
              if i_any2 = 'TABLE_LINE'.
                assign <l_any> to <l_value>.
              else.
                assign component i_any2 of structure <l_any> to <l_value>.
              endif.
              if <l_value> = i_any3.
                r_result = abap_true.
                return.
              endif.
            endloop.

          when syst.

            data ls_sy type sy.
            ls_sy = i_any.
            if ls_sy-subrc <> 0 or ls_sy-msgty = 'E'.
              r_result = abap_false.
            else.
              r_result = abap_true.
            endif.

          when t100_msg.

            data(ls_bapi) = msg( i_any = i_any use_t100_only = abap_true )-s_bapi.
            if ls_bapi-id is initial.
              r_result = abap_false.
            else.
              r_result = abap_true.
            endif.

          when convertible.

            if get( rtti_kind = 'X' i_any = i_any ) = get( rtti_kind = 'X' i_any = i_any2 ).
              r_result = abap_true.
            endif.


          when castable.

            "PrÃ¼ft ob Referenz i_any2 auf Referenz vom Typ mit Namen i_any gecastet werden kannn
            rtti(
              exporting
                i_any                = i_any
              importing
                ev_type              = data(lv_classname_any1)
                ev_type_kind_is_c    = data(lv_is_c)
                et_ref_super         = data(lt_ref_super_any1) ).

            if lt_ref_super_any1 is initial and lv_is_c = abap_true.
              rtti( exporting iv_name = i_any
                   importing ev_type = lv_classname_any1 et_ref_super = lt_ref_super_any1 ).

            elseif lt_ref_super_any1 is initial.
              x_raise('WRONG_TYPE_OF_INPUT').
            endif.

            rtti(
              exporting
                i_any                = i_any2
              importing
              ev_type   = data(lv_classname_any2)
                ev_type_kind_is_c    = lv_is_c
                et_ref_super         = data(lt_ref_super_any2) ).

            if lt_ref_super_any2 is initial and lv_is_c = abap_true.
              rtti( exporting iv_name = i_any2
                    importing et_ref_super = lt_ref_super_any2 ).
            elseif lt_ref_super_any2 is initial.
              x_raise('WRONG_TYPE_OF_INPUT').
            endif.

            r_result = check( value_in_tab = 'X' i_any = lt_ref_super_any2
                              i_any2 = 'TABLE_LINE' i_any3 = lv_classname_any1 ).


          when t100_error.

            data: lv_type type string.

            lv_type = msg( i_any = i_any use_t100_only = abap_true )-type.

            if lv_type = 'E' or lv_type = 'A'.
              r_result = abap_true.
            else.
              r_result = abap_false.
            endif.

            return.


          when value_in_struct.


            do.
              assign component sy-index of structure i_any2
                  to <l_any>.
              if sy-subrc <> 0.
                exit.
              endif.

              if <l_any> = i_any.
                r_result = abap_true.
                exit.
              endif.
            enddo.

            return.

          when function_exist.

            data funcname  type rs38l_fnam .
            funcname = i_any.

            call function 'FUNCTION_EXISTS'
              exporting
                funcname           = funcname    " Name des Funktionsbausteins
*           importing
*               group              =     " Name der Funktionsgruppe
*               include            =     " Name des Includes
*               namespace          =     " Namensraum
*               str_area           =     " Name der Funktionsgruppe ohne Namensraum
              exceptions
                function_not_exist = 1
                others             = 2.
            if sy-subrc <> 0.
              r_result = abap_false.
            else.
              r_result = abap_true.
            endif.

          when lock_is_set. " = abap_true.
*
            data: lv_any  type string, lv_any2 type string, lv_any3 type string, lv_any4 type string.

            lv_any  = i_any.
            lv_any2 = i_any2.
            lv_any3 = i_any3.
            lv_any4 = i_any4.

*            lcl_help=>lock_is_set(
*              exporting
*                iv_val    = lv_any
*                iv_val2   = lv_any2
*                iv_val3   = lv_any3
*                iv_val4   = lv_any4
*                iv_lock   = i_object
*                iv_unam   = iv_uname
*              receiving
*                rv_result = ev_is_set
*            ).

          when others.
            x_raise('WRONG_CALL_OF_METHOD').
        endcase.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        data: lx_root type ref to cx_root.
      catch cx_root into lx_root.
        lcl_help=>handle_error( ix_root = lx_root raise_error = raise_error ).
    endtry.

  endmethod.


  method conv.

    "Durchführen von Konvertierungen
    "Bsp Char->INT, Rundungen, Sprachabkürzungen usw
    try.
        clear r_result.

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Typen bestimmen

        data:
          lv_type_in       type string,
          lv_type_out      type string,
          lv_type_kind_in  type string,
          lv_type_kind_out type string.

        rtti(
          exporting
            i_any         = i_any
          importing
            ev_type       = lv_type_in
            ev_type_kind  = lv_type_kind_in ).

        rtti(
          exporting
            i_any         = r_result
          importing
            ev_type       = lv_type_out
            ev_type_kind  = lv_type_kind_out ).


        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Sonderbehandlungen / Rundung

        if lv_type_in = 'TIMESTAMPL' and  lv_type_kind_out = 'D'.
          convert time stamp i_any
          time zone sy-zonlo
          into date r_result.
*          time ev_time.
          return.
        endif.

        if lv_type_in = 'TIMESTAMPL' and  lv_type_kind_out = 'T'.
          convert time stamp i_any
          time zone sy-zonlo
          into date data(lv_dummy4)
          time r_result.
          return.
        endif.

        if  iv_unit_input is supplied and iv_unit_result is supplied
            and iv_unit_input <> iv_unit_result.

          data lv_p_16 type p length 16 decimals 6.

          lcl_help=>conv_unit( exporting i_any = i_any
                  i_unit_in = iv_unit_input   i_unit_out = iv_unit_result
                  importing
                      e_result = lv_p_16 ).

          if iv_round_deci is supplied.
            conv(
              exporting
                i_any          = lv_p_16
                iv_round_deci  = iv_round_deci
                raise_error    = raise_error
              importing
                r_result       = r_result ).

          else.

            conv(
        exporting
          i_any          = lv_p_16
*              iv_round_deci  = iv_round_deci
          raise_error    = raise_error
        importing
          r_result       = r_result ).

          endif.

          return.

        endif.


        if iv_round_deci is supplied.

          lcl_help=>round2( exporting i_any = i_any iv_decimals = iv_round_deci
                                 importing e_result = r_result ).

          return.

        endif.


        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " spezielle Konvertierungen

        if lv_type_in = 'LANGU' or lv_type_in = 'SPRAS' or lv_type_in = 'SYST_LANGU'
        and lv_type_out = 'LAISO'.

          call function 'CONVERT_SAP_LANG_TO_ISO_LANG'
            exporting
              input            = i_any
            importing
              output           = r_result
            exceptions
              unknown_language = 1
              error_message    = 2
              others           = 3.
          if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
          x_raise_check( function = 'X' ).

          return.
        endif.


        if lv_type_in = 'LAISO'
        and lv_type_out = 'LANGU' or lv_type_out = 'SPRAS' or lv_type_out = 'SYST_LANGU'.

          call function 'CONVERSION_EXIT_ISOLA_INPUT'
            exporting
              input            = i_any
            importing
              output           = r_result
            exceptions
              unknown_language = 1
              error_message    = 2
              others           = 3.
          if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
          x_raise_check( function = 'X' ).

          return.
        endif.


        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Generelle Konvertierungen

        data lv_c_500 type c length 500.

        case lv_type_kind_out.

          when cl_abap_typedescr=>typekind_packed.

            case lv_type_kind_in.

              when cl_abap_typedescr=>typekind_int
                or cl_abap_typedescr=>typekind_int1
                or cl_abap_typedescr=>typekind_int2
                or cl_abap_typedescr=>typekind_packed.

                r_result = i_any.


              when cl_abap_typedescr=>typekind_string.

*              data lv_c type c length 500.
                clear lv_c_500.
                lv_c_500 = get( trim = 'X' i_any = i_any ).

                conv( exporting i_any    = lv_c_500
                      importing r_result = r_result ).

                return.

              when cl_abap_typedescr=>typekind_char

               or cl_abap_typedescr=>typekind_num.

                try.
                    r_result = i_any.

                  catch cx_root.

                    call function 'MOVE_CHAR_TO_NUM'
                      exporting
                        chr             = i_any
                      importing
                        num             = r_result
                      exceptions
                        convt_no_number = 1
                        convt_overflow  = 2
                        others          = 3.
                    if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
                    x_raise_check( function = 'X' ).

                endtry.


            endcase.



          when cl_abap_typedescr=>typekind_int
          or cl_abap_typedescr=>typekind_int1
          or cl_abap_typedescr=>typekind_int2.

            case lv_type_kind_in.

              when cl_abap_typedescr=>typekind_packed
              or cl_abap_typedescr=>typekind_int
            or cl_abap_typedescr=>typekind_int1
            or cl_abap_typedescr=>typekind_int2.

                r_result = i_any.

              when cl_abap_typedescr=>typekind_char
             or cl_abap_typedescr=>typekind_string
             or cl_abap_typedescr=>typekind_num.

                data lv_n type p length 16 decimals 0.

                call function 'MOVE_CHAR_TO_NUM'
                  exporting
                    chr             = i_any
                  importing
                    num             = lv_n
                  exceptions
                    convt_no_number = 1
                    convt_overflow  = 2
                    others          = 3.
                if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
                x_raise_check( function = 'X' ).

                r_result = lv_n.

            endcase.



          when cl_abap_typedescr=>typekind_char
          or cl_abap_typedescr=>typekind_string
          or cl_abap_typedescr=>typekind_num.

            r_result =  get(  print = 'X' i_any = i_any ).
*             r_result = lcl_help=>WRITE( i_any ).
*            WRITE i_any TO .
*            r_result = get( trim = 'X' i_any = lv_c_500 ).

          when others.
            r_result = i_any.


        endcase.


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

        if exit_in = abap_true.
          r_result = get( conv_in = 'X' i_any = r_result ).
        endif.


        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        data lx_root type ref to cx_root.
      catch cx_root into lx_root.
        lcl_help=>handle_error( ix_root = lx_root raise_error = raise_error ).
    endtry.

  endmethod.


  method do.

    " Methode zum Ausfuehren haeufig wiederkehrender Aktionen
    " commit, rollback, rfc, usw
    try.
        case abap_true.

          when init.

            "Helper initialisieren
            data(lo_help) = new lcl_help(  ).
            clear lo_help.


          when init_cust.

            field-symbols: <ls_data> type data.
            assign i_any->* to <ls_data>.
            lcl_help=>init_cust( importing e_any2 =  <ls_data> ).


          when amc_send.

            data: lv_amc_msg        type string.
            data: lv_amc_channel_id type string.
            data: lv_amc_appli_id   type c length 30. "string.

            lv_amc_appli_id   = i_any.
            lv_amc_channel_id = i_any2.
            lv_amc_msg        = i_any3.


            cast if_amc_message_producer_text(

                   cl_amc_channel_manager=>create_message_producer(
                     i_application_id = lv_amc_appli_id "'ZKAL_MC_UI5_TEST' "ZAMC_TESTÃ¢â#¬â#¢
                     i_channel_id     = lv_amc_channel_id  ) "'/ping' )

              )->send( i_message = lv_amc_msg ) . "|Static text| ).


          when http_req_get.


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



          when free_sy.

            free: sy-subrc, sy-msgid, sy-msgno, sy-msgty, sy-msgv1, sy-msgv2, sy-msgv3, sy-msgv4.

          when commit_a_wait.

            data ls_return  type bapiret2.

            call function 'BAPI_TRANSACTION_COMMIT'
              exporting
                wait          = abap_true    " Using the command `COMMIT AND WAIT`
              importing
                return        = ls_return    " Return Messages
              exceptions
                error_message = 1
                others        = 2.
            if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
            x_raise_check( function = 'X' i_check1 = ls_return ).


          when rollback.

            call function 'BAPI_TRANSACTION_ROLLBACK'
              importing
                return        = ls_return    " Return Messages
              exceptions
                error_message = 1
                others        = 2.
            if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
            x_raise_check( function = 'X' i_check1 = ls_return ).


          when rfc_background_task or rfc_new_task or rfc_parallel_task.

            case abap_true.
              when rfc_new_task.

*                if abap_false = check( castable = 'X' i_any = 'IF_SERIALIZABLE_OBJECT' i_any2 = i_any ).
*                  raise( 'ZCX_INPUT_OBJECT_NOT_SERIALIZABLE_ERROR').
*                endif.

*                new lcl_rfc_control( )->start_new_task(
*                  exporting
*                    iv_method_name = i_any2
*                    if_object      = i_any
*                  importing
*                    ei_object      = e_any
*                ).

            endcase.
*            lv_name_merfc_new_taskthod = i_any2.
*            Methodenname zum ausfÃ¼hren
*            und serialisierbares Objekt Ã¼bergeben

*            lcl_rfc_control=>start_new_task

*            pbt( i_any = i_any ).


          when report_start.

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

          when others.
            x_raise('ZCX_WORNG_CALL_OF_METHOD').

        endcase.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        data: lx_root type ref to cx_root.
      catch cx_root into lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    endtry.


  endmethod.


  method  get.

    "Durchführen verschiedener Transformationen
    "Bsp JSON Tranformationen, zippen, msg texte, popups, RTTI infos usw
    "Ergebnis als String
    try.
        case abap_true.

          when hash.

            data lv_hash_input type string.
            data lv_hash_output type string.

            lv_hash_input = i_any.

            cl_abap_message_digest=>calculate_hash_for_char(
                exporting
                     if_data                = lv_hash_input    " Data
                importing
                     ef_hashstring          =  lv_hash_output   " Hash value as hex encoded string
*                    ef_hashxstring         =     " Binary hash value as XString
*                    ef_hashb64string       =     " Hash value as base64 encoded string
*                    ef_hashx               =     " Hash value as XSequence
).

            r_result = lv_hash_output.


          when methodname.

            data lv_depth type i.
            if i_any is not initial.
              lv_depth = i_any.
            endif.
            lv_depth = lv_depth + 1.

            info(
              exporting
                iv_depth           = lv_depth
              importing
                ev_method          = r_result
            ).


          when text.
            msg( exporting i_any = i_any i_langu = iv_langu raise_error = 'X'
                 importing e_any = r_result ).


          when msg_type.
            r_result = msg( i_any = i_any i_langu = iv_langu raise_error = 'X' )-type.

          when zip.
            trans( exporting zip = 'X' i_any = i_any raise_error = 'X'
                   importing e_result = r_result ).

          when unzip.
            trans( exporting unzip = 'X' i_any = i_any raise_error = 'X'
                   importing e_result = r_result ).

          when json.
            trans( exporting json = 'X' i_any = i_any raise_error = 'X'
                   importing e_result = r_result ).


          when print_date or print_time.

            data lv_timestampl type timestampl.
            data lv_date type d.
            data lv_time type t.
            lv_timestampl = i_any.

            if lv_timestampl is initial.
              get time stamp field lv_timestampl.
            endif.

            convert time stamp lv_timestampl
            time zone sy-zonlo
            into date lv_date
            time lv_time.

            if print_date = abap_true.
              r_result =  get(  print = 'X' i_any = lv_date ).
            else.
              r_result =  get(  print = 'X' i_any = lv_time ).
            endif.

          when json_deep.

            json(
              exporting
                i_any = i_any
                i_any2 = i_any2
                i_any3 = i_any3
                i_any4 = i_any4
                i_any5 = i_any5
              importing
                e_any1      = r_result
            ).


          when xml.
            trans( exporting xml = 'X' i_any = i_any raise_error = 'X'
                   importing e_result = r_result ).

          when conv_in.
            "FÃ¼hrt einen Conversion Exit Input mit i_any durch
            "wenn i_any2 gefÃ¼llt dann erfolgt exit Ã¼ber typ bestimmung
            "wenn i_any3 gefÃ¼llt wird wert als exitname verwendet
            r_result =  lcl_help=>get_convexit(
                                            i_any   = i_any
                                            iv_type = i_any2
                                            iv_exit = i_any3 ).

          when conv_out.
            "FÃ¼hrt einen Conversion Exit Input mit i_any durch
            "wenn i_any2 gefÃ¼llt dann erfolgt exit Ã¼ber typ bestimmung
            "wenn i_any3 gefÃ¼llt wird wert als exitname verwendet
            r_result =  lcl_help=>get_convexit(
                                            i_any   = i_any
                                            iv_type = i_any2
                                            iv_exit = i_any3
                                            iv_is_input = abap_false ).


          when popup_choose.

            data lv_result type string.

            gui_popup(
              exporting
                choose            = 'X'
                i_any             = i_any
                i_any2            = i_any2
                iv_title          = i_any3
                raise_error       = raise_error
              importing
                e_any             = lv_result
*
            ).

            lv_result =  get(
                  trim            = 'X'
                  i_any           = lv_result
              ).
            r_result = lv_result.



          when trim_upper_case.
            r_result = get( trim = 'X' i_any = i_any ).
            translate  r_result to upper case.

          when trim.
            r_result = i_any.
            shift r_result right deleting trailing ' '.
            shift r_result left deleting leading ' '.

          when print_deep.

            trans( exporting print = 'X' i_any = i_any
                   importing e_result = r_result ).

          when print.

            r_result =  lcl_help=>write( i_any ).

          when log_info.

            data(lv_date2) = get( print_date = 'X' ).
            data(lv_time2) = get( print_time = 'X' ).

            concatenate
             lv_date2
             lv_time2
             sy-uname
             into r_result separated by ' / '.

          when rtti_type_line.

            rtti( exporting i_any        = i_any
                  importing ev_line_type = r_result ).

          when rtti_type_kind.
            rtti( exporting i_any        = i_any
                  importing ev_type_kind = r_result ).

          when rtti_kind.
            rtti( exporting i_any   = i_any
                  importing ev_kind = r_result ).

          when guid16.

*            DATA lv_guid_16 TYPE guid_16.
*            CALL FUNCTION 'GUID_CREATE'
*              IMPORTING
*                ev_guid_16 = lv_guid_16.
*            r_result = lv_gui_16.

            data: lv_uuid_16  type sysuuid_x16.
            lv_uuid_16 = cl_system_uuid=>create_uuid_x16_static( ).
            r_result = lv_uuid_16.


          when param_id.

            import testmemory to r_result from memory id 'TESTMEMORY'.


          when param_system.

            data ls_tvarvc type tvarvc.
            ls_tvarvc-type = get( trim_upper_case = 'X' i_any = i_any ).
            ls_tvarvc-type = i_any2.
            ls_tvarvc-type = get( conv_in = 'X' i_any = ls_tvarvc-type ).

            select low
            up to 1 rows
            from tvarvc
            into ls_tvarvc-low
            where name = ls_tvarvc-name
            and type   = ls_tvarvc-type
            order by primary key.
            endselect.
            x_raise_check( select ='X'
                i_check1 = ls_tvarvc-name
                i_check2 = ls_tvarvc-type ).

            r_result = ls_tvarvc-low.


          when param_user.

            data ls_usr05 type usr05.
            ls_usr05-parid = get( trim_upper_case = 'X' i_any = i_any ).
            if i_any2 is not initial.
              ls_usr05-bname = get( trim_upper_case = 'X' i_any = i_any2 ).
            else.
              ls_usr05-bname = get( trim_upper_case = 'X' i_any = sy-uname ).
            endif.

            select parva
            up to 1 rows
            from usr05
            into ls_usr05-parva
            where bname = ls_usr05-bname
            and   parid = ls_usr05-parid
            order by primary key.
            endselect.
            x_raise_check( select = 'X'
                     i_check1 = ls_usr05-bname
                     i_check2 = ls_usr05-parid ).

            r_result = ls_usr05-parva.


          when dd04t.

            r_result = get_bus( dd04t_scrtext_by_rollname_leng = 'X'
                                     i_any    = i_any
                                     i_any2   = i_any2
                                     iv_langu = iv_langu ).

          when rtti_type or rtti_type_super.

            data: lv_typename       type string,
                  lv_typename_super type string,
                  lv_kind           type string.

            rtti( exporting i_any = i_any
                  importing
                     ev_type       = lv_typename
*                     ev_type_ddic  = lv_typename_ddic
                     ev_ref_super      = lv_typename_super
                     ev_kind           = lv_kind ).

            r_result = lv_typename.

            case lv_kind.
              when cl_abap_datadescr=>kind_ref.
                if rtti_type_super = abap_true.
                  r_result = lv_typename_super.
                endif.
            endcase.
            return.

          when popup_get_value.

            data: lv_changed type as4flag.
            data: lv_name type string.
            lv_name = i_any.

            if i_any2 is initial.
              call function 'CC_POPUP_STRING_INPUT'
                exporting
                  property_name = lv_name
                importing
                  value_changed = lv_changed
                changing
                  string_value  = r_result.

              if sy-ucomm = 'CANCEL'." = abap_true.
                r_result = cs-s_popup_answer-exit.
*              sy-ucomm = cs-s_popup_answer-exit.
                x_raise( 'ZCX_USER_CANCEL' ).
              endif.

            else.

              lcl_help=>gui_popup_get_value(
                exporting
                  iv_title       = i_any
                  iv_tab1        = segment( val = i_any2  sep = '-' index = 1 )
                  iv_field1      = segment( val = i_any2  sep = '-' index = 2 )
                importing
                  ev_user_cancel =  data(lv_is_cancel)
                  ev_value1      = r_result
              ).

              if lv_is_cancel = abap_true.
                x_raise( 'ZCX_USER_CANCEL' ).
              endif.

            endif.

          when cx_code.

            x_info( exporting ix_root = i_any
                     importing ev_code = r_result ).


          when others.
            x_raise('ZCX_WRONG_METHOD_CALL').

        endcase.


*        IF r_result IS INITIAL.
*          x_raise('ZCX_NO_DATA').
*        ENDIF.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        data: lx_root type ref to cx_root.
      catch cx_root into lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    endtry.


  endmethod.


  method get_bus.

    "Business Infos auslesen
    "Bsp venum->exidv, mara-meins, maktx, kunnr usw
    try.
        case abap_true.


          when tftit_stext_by_funcname.

            data ls_tftit type tftit.
            ls_tftit-funcname = get( trim_upper_case = 'X' i_any = i_any ).

            select single *
            from tftit
            into ls_tftit
            where spras = iv_langu
            and  funcname = ls_tftit-funcname.
            if sy-subrc <> 0.

              select single *
              from tftit
              into ls_tftit
              where spras = 'E'
              and  funcname = ls_tftit-funcname.
              if sy-subrc <> 0.

                select single *
                from tftit
                into ls_tftit
                where spras = 'D'
                and  funcname = ls_tftit-funcname.

              endif.
            endif.

            r_result = ls_tftit-stext.


          when t100_text_by_no_id.

            data ls_t100 type t100.

            ls_t100-msgnr = get( trim_upper_case = 'X' i_any = i_any ).
            ls_t100-arbgb = get( trim_upper_case = 'X' i_any = i_any2 ).

            do.

              read table ss_db_buffer-t_t100
              into ls_t100
                  with table key
                  sprsl = iv_langu
                  arbgb = ls_t100-arbgb
                  msgnr = ls_t100-msgnr.
              if sy-subrc = 0.
                exit.
              endif.

              select *
                  from t100
                  up to 1 rows
                  into corresponding fields of ls_t100
                where sprsl = iv_langu
                 and arbgb = ls_t100-arbgb
                 and msgnr = ls_t100-msgnr
                  order by primary key.
              endselect.
              if sy-subrc = 0.
                insert ls_t100 into table ss_db_buffer-t_t100.
                exit.
              endif.

              read table ss_db_buffer-t_t100 into ls_t100
                         with table key
                  sprsl = 'E'
                  arbgb = ls_t100-arbgb
                  msgnr = ls_t100-msgnr.
              if sy-subrc = 0.
                exit.
              endif.

              select *
              from t100
              up to 1 rows
              into corresponding fields of ls_t100
                 where sprsl = 'E'
                 and arbgb = ls_t100-arbgb
                 and msgnr = ls_t100-msgnr
                 order by primary key.
              endselect.
              if sy-subrc = 0.
                insert ls_t100 into table ss_db_buffer-t_t100.
                exit.
              endif.

              if iv_langu = 'D'.
                exit.
              endif.

              read table ss_db_buffer-t_t100 into ls_t100
                     with table key
                  sprsl = 'D'
                  arbgb = ls_t100-arbgb
                  msgnr = ls_t100-msgnr.
              if sy-subrc = 0.
                exit.
              endif.

              select *
              from t100
              up to 1 rows
              into corresponding fields of ls_t100
                 where sprsl = 'D'
                 and arbgb = ls_t100-arbgb
                 and msgnr = ls_t100-msgnr
                 order by primary key.
              endselect.
              if sy-subrc = 0.
                insert ls_t100 into table ss_db_buffer-t_t100.
                exit.
              endif.

              exit.
            enddo.

            r_result = ls_t100-text.


          when dd04t_scrtext_by_rollname_leng.

            data ls_dd04t type dd04t.
            ls_dd04t-rollname   = get( trim_upper_case = 'X' i_any = i_any ).
            ls_dd04t-ddlanguage = get( trim_upper_case = 'X' i_any = i_any ).

            read table ss_db_buffer-t_dd04t into ls_dd04t
               with table key rollname = ls_dd04t-rollname ddlanguage = ls_dd04t-ddlanguage.
            if sy-subrc <> 0.
              select  *
              up to 1 rows
              from dd04t
              into ls_dd04t
              where rollname  = ls_dd04t-rollname
              and  ddlanguage = iv_langu
              order by primary key.
              endselect.
              insert ls_dd04t into table ss_db_buffer-t_dd04t.
            endif.
            case i_any2.
              when 'S'.
                r_result = ls_dd04t-scrtext_s.
              when 'L'.
                r_result = ls_dd04t-scrtext_l.
              when others.
                r_result = ls_dd04t-scrtext_m.
            endcase.

          when dd01l_convexit_by_domname.

            data ls_dd01l type dd01l.
            ls_dd01l-domname = get( trim_upper_case = 'X' i_any = i_any ).

            read table ss_db_buffer-t_dd01l into ls_dd01l
               with table key domname = ls_dd01l-domname.

            if sy-subrc <> 0.
              select *
              from dd01l
              up to 1 rows
                into ls_dd01l
              where domname = ls_dd01l-domname
              order by primary key.
              endselect.

              "nehmen auch leere werte mit wir das beim nÃ¤chsten mal wissen
              insert ls_dd01l into table ss_db_buffer-t_dd01l.
            endif.

            r_result = ls_dd01l-convexit.


          when  dd04l_domname_by_rollname
          or dd04l_leng_by_rollname
          or dd04l_outputlen_by_rollname.

            data ls_dd04l type dd04l.
            ls_dd04l-rollname = get( trim_upper_case = 'X' i_any = i_any ).

            read table ss_db_buffer-t_dd04l into ls_dd04l
               with key rollname = ls_dd04l-rollname.

            if sy-subrc <> 0.
              select *
              from dd04l
              up to 1 rows
              into ls_dd04l
              where rollname = ls_dd04l-rollname
              order by primary key.
              endselect.
              "nehmen auch leere werte mit wir das beim nÃ¤chsten mal wissen
              insert ls_dd04l into table ss_db_buffer-t_dd04l.
            endif.

            case abap_true.
              when  dd04l_domname_by_rollname.
                r_result = ls_dd04l-domname.
              when dd04l_leng_by_rollname.
                r_result = ls_dd04l-leng.
              when dd04l_outputlen_by_rollname.
                r_result = ls_dd04l-outputlen.
            endcase.


          when dd02t_ddtext_by_tabname.

            data ls_dd02t type dd02t.

            ls_dd02t-tabname = get( trim_upper_case = 'X' i_any = i_any ).
            ls_dd02t-ddlanguage = iv_langu.

            select tabname ddlanguage ddtext
              up to 1 rows
                     from dd02t
                     into corresponding fields of ls_dd02t
                     where tabname = ls_dd02t-tabname
                     and   ddlanguage = ls_dd02t-ddlanguage
                     order by tabname ddlanguage ddtext.
            endselect.
            if sy-subrc <> 0.
              select tabname ddlanguage ddtext
              up to 1 rows
          from dd02t
          into corresponding fields of ls_dd02t
          where tabname = r_result
          and   ddlanguage = 'E'
          order by tabname ddlanguage ddtext.
              endselect.
              if sy-subrc <> 0.
                select tabname ddlanguage ddtext
                up to 1 rows
                    from dd02t
                into corresponding fields of ls_dd02t
                    where tabname = r_result
                and   ddlanguage = 'D'
                order by tabname ddlanguage ddtext.
                endselect.
              endif.

            endif.
            r_result = ls_dd02t-ddtext.

          when mara_meins_by_matnr.

            data ls_mara type mara.

            ls_mara-matnr = i_any.

            read table ss_db_buffer-t_mara into ls_mara
              with key matnr = ls_mara-matnr.
            if sy-subrc <> 0.
              select matnr meins
              up to 1 rows
                  from mara
                  into corresponding fields of ls_mara
                  where   matnr = ls_mara-matnr
                  order by matnr meins.
              endselect.
              insert ls_mara into table ss_db_buffer-t_mara.
            endif.

            r_result = ls_mara-meins.

            x_raise_check( not_initial = 'X'  i_check1 = r_result
                i_ser_value = get(  json_deep = 'X' i_any =  ls_mara-matnr )
                i_head      = 'ZCX_READ_DATABASE_MARA_MEINS_ERROR'
            ).

          when cslt_ltext_by_lang_kokrs_lstar.

            data ls_cslt type cslt.

            ls_cslt-spras = i_any.
            if ls_cslt-spras is initial.
              ls_cslt-spras = sy-langu.
            endif.
            ls_cslt-kokrs = i_any2.
            ls_cslt-lstar = i_any3.
*            objnr = i_any.
*            ls_cslt-parvw = i_any2.
*              WITH KEY objnr = ls_ihpa-objnr parvw = ls_ihpa-parvw.
            read table ss_db_buffer-t_cslt into ls_cslt
                with key
                    spras = ls_cslt-spras
                    kokrs = ls_cslt-kokrs
                    lstar = ls_cslt-lstar.
            if sy-subrc <> 0.
              select *
              up to 1 rows
                from cslt
                into ls_cslt
                where
                spras = ls_cslt-spras and
                kokrs = ls_cslt-kokrs and
                lstar = ls_cslt-lstar
                order by primary key.
              endselect.
              insert ls_cslt into table ss_db_buffer-t_cslt.
            endif.

            r_result = ls_cslt-ltext.

            x_raise_check( not_initial = 'X'  i_check1 = r_result
                        i_ser_value = get(  json_deep = 'X' i_any = ls_cslt-kokrs i_any2 = ls_cslt-lstar )
                        i_head      = 'ZCX_READ_DATABASE_CSLT_LTEXT_ERROR'
                    ).

          when ihpa_parnr_by_objnr_parvw.

            data ls_ihpa type ihpa.

            ls_ihpa-objnr = i_any.
            ls_ihpa-parvw = i_any2.
            read table ss_db_buffer-t_ihpa into ls_ihpa
              with key objnr = ls_ihpa-objnr parvw = ls_ihpa-parvw counter = '000001'.
            if sy-subrc <> 0.
              select single *
                from ihpa
                into ls_ihpa
                where objnr = ls_ihpa-objnr
                and parvw = ls_ihpa-parvw
                and counter = '000001'.
              insert ls_ihpa into table ss_db_buffer-t_ihpa.
            endif.

            r_result = ls_ihpa-parnr.

            x_raise_check( not_initial = 'X'  i_check1 = r_result
                        i_ser_value = get(  json_deep = 'X' i_any = ls_ihpa-objnr i_any2 = ls_ihpa-parvw )
                        i_head      = 'ZCX_READ_DATABASE_IHPA_PARNR_ERROR'
                    ).

          when  userdetail_info_by_pernr.

            data lv_uname type xubname.
            data lv_info type string.
            data ls_adress type  bapiaddr3.
            data lt_return type bapiret2_tab.
*              data lt_ret

            lv_uname = i_any.
            lv_info = i_any2.

            call function 'BAPI_USER_GET_DETAIL'
              exporting
                username      = lv_uname " User Name
                cache_results = 'X'    " Temporarily buffer results in work process
              importing
                address       = ls_adress  " Address Data
              tables
                return        = lt_return.    " Return Structure

            case lv_info.
              when 'FULLNAME'.
                r_result = ls_adress-fullname.
            endcase.


          when vekp_exidv_by_venum.



          when vekp_venum_by_exidv.




          when makt_maktx_by_matnr.

            data ls_makt       type makt.

            clear ls_makt.
            ls_makt-spras = iv_langu.
            ls_makt-matnr = i_any.

            if conv_exit = abap_true.
              ls_makt-spras = get( conv_in = 'X' i_any = ls_makt-spras ).
              ls_makt-matnr = get( conv_in = 'X' i_any = ls_makt-matnr ).
            endif.

            read table ss_db_buffer-t_makt
              into ls_makt with table key spras = ls_makt-spras matnr = ls_makt-matnr.

            if sy-subrc <> 0 or refresh_memory = abap_true.
              select single *
                from makt
                into corresponding fields of ls_makt
                where spras = iv_langu
                and   matnr = i_any.
              insert ls_makt into table ss_db_buffer-t_makt.
            endif.
            r_result = ls_makt-maktx.


          when matnr_ext.

            data ls_materialid type materialid.
            clear ls_materialid.
            ls_materialid-matnr_int = i_any.

            if conv_exit = abap_true.
              ls_materialid-matnr_int = get( conv_in = 'X' i_any = ls_materialid-matnr_int ).
            endif.

            read table ss_db_buffer-t_materialid
                into ls_materialid with table key matnr_int = ls_materialid-matnr_int.

            if sy-subrc <> 0 or refresh_memory = abap_true.
              select single *
               from  materialid
               into  ls_materialid
               where matnr_int = ls_materialid-matnr_int.
              insert ls_materialid into table ss_db_buffer-t_materialid.
            endif.

            r_result = ls_materialid-matnr_ext.


          when kna1_name1_by_kunnr.

            data ls_kna1 type kna1.

            clear ls_kna1.
            ls_kna1-kunnr = i_any.

            if conv_exit = abap_true.
              ls_kna1-kunnr = get( conv_in = 'X' i_any = ls_kna1-kunnr ).
            endif.

            read table ss_db_buffer-t_kna1
                into ls_kna1 with table key kunnr = ls_kna1-kunnr.

            if sy-subrc <> 0 or refresh_memory = abap_true.
              select single  *
                  from kna1
                  into corresponding fields of ls_kna1
                  where kunnr = ls_kna1-kunnr.
              insert ls_kna1 into table ss_db_buffer-t_kna1.
            endif.
            r_result = ls_kna1-name1.


          when lfa1_name1_by_lifnr.

            data ls_lfa1 type lfa1.

            clear ls_lfa1.
            ls_lfa1-lifnr = i_any.

            if conv_exit = abap_true.
              ls_lfa1-lifnr = get( conv_in = 'X' i_any = ls_lfa1-lifnr ).
            endif.

            read table ss_db_buffer-t_lfa1
                into ls_lfa1 with table key lifnr = ls_lfa1-lifnr.

            if sy-subrc <> 0 or refresh_memory = abap_true.
              select single  *
                  from lfa1
                  into corresponding fields of ls_lfa1
                  where lifnr = ls_lfa1-lifnr. "lv_lifnr.
              insert ls_lfa1 into table ss_db_buffer-t_lfa1.
            endif.
            r_result = ls_lfa1-name1.


          when others.
            x_raise('ZCX_WRONG_METHOD_CALL').

        endcase.

        if r_result is initial.
          x_raise('ZCX_NO_DATA').
        endif.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        data: lx_root type ref to cx_root.
      catch cx_root into lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    endtry.

  endmethod.


  method gui_cfw.

    try.

        case abap_true.

          when get_fcat.

            data lt_fcat type lvc_t_fcat.

            lt_fcat = lcl_help=>cfw_get_fcat( it_table = i_any  ).
            e_any = lt_fcat.

          when do_suppress_toolbar.
            cl_abap_list_layout=>suppress_toolbar( ).

        endcase.



        data lx_root type ref to cx_root.
      catch cx_root into lx_root.
        lcl_help=>handle_error( ix_root = lx_root raise_error = raise_error ).
    endtry.
  endmethod.


  method gui_popup.

    "GUI Anzeige für verschiedene Aktionen
    "Bsp Tabellenausgabe, Log Anzeige, Messages, Popup Confirm/Inform usw
    try.
        if abap_false = check( gui_active = 'X' ).
          x_raise('ZCX_GUI_ACTIVE_IN_BATCH_MODE_ERROR').
        endif.

        clear ev_answer.

        case abap_true.

          when msg_error or msg_warning or msg_success or msg_info.
            data lv_type type string.
            case abap_true.
              when msg_error. lv_type = 'E'.
              when msg_warning. lv_type = 'W'.
              when msg_success. lv_type = 'S'.
              when msg_info. lv_type = 'I'.
            endcase.

            gui_popup( msg( i_any = i_any i_type = lv_type )-s_bapi ).


          when selscreen_dyn.

            data lt_where type rsds_twhere.
            lt_where = lcl_help=>gui_popup_selscreen_dynamic( conv string( i_any ) ).
            e_any = lt_where.


          when get_screenshot.

            data lv_xstring type xstring.

            lv_xstring =  lcl_help=>gui_get_screenshot(  ).
            e_any = lv_xstring.

          when start_se16n_edit.

            call function 'SE16N_INTERFACE'
              exporting
                i_tab         = conv se16n_tab( get( trim_upper_case = 'X' i_any = i_any ) )    " Table
                i_edit        = 'X'    " Single-Character Indicator
                i_sapedit     = 'X'    " Single-Character Indicator
              exceptions
                error_message = 1
                others        = 2.
            x_raise_check( function = 'X' ).

          when selbild.

*            lcl_help=>gui_popup(
*              selbild = 'X'
*              i_any   = value sci_atttab(
*                                ( kind = 'S' text = lcl_help=>get( dd04t = 'X' i_any = 'MATNR' ) ref = ref #(  lr_matnr )  )
*                                ( kind = 'S' text = lcl_help=>get( dd04t = 'X' i_any = 'DATUM' ) ref = ref #(  lr_date  )  )
*                        )
*              ).


            data lt_seldata type sci_atttab.
            lt_seldata = i_any.

            if abap_true = cl_ci_query_attributes=>generic( p_name       = conv #( sy-repid )
                                                            p_title      = 'Selektionsbild'
                                                            p_display    = abap_false " abap_true: Anzeige im READONLY-Modus
                                                            p_attributes = lt_seldata ).

              ev_answer = cs-s_popup_answer-exit.
            endif.

          when cust.

            lcl_help=>popup_cust(  i_any ).

          when json_deep.

            lcl_help=>popup_json_deep( iv_serial = i_any ).

          when vari_alv.

            lcl_help=>popup_alv_f4(
              exporting
                iv_handle = i_any2
                iv_uname  = i_any2
                iv_repid  = i_any
              receiving
                rv_vari   = e_any
            ).


          when file_upload.
            e_any = lcl_help=>gui_upload( use_exceptions = raise_error ).

          when file_download.

            lcl_help=>gui_download(
        iv_input         = i_any
        iv_filname_w_ext = i_any2 "'example.pdf'
        iv_filter        = i_any3 "'(*.pdf)|*.pdf|'
    ).

          when f4_help_tab.
            data lx_root type ref to cx_root.
            try.
                lcl_help=>popup_f4_help_tab(
                   exporting
                     iv_fieldname       = i_any
                     it_table           = i_any2
                   receiving
                     rv_result          = e_any ).
              catch cx_root into lx_root.
                case get( cx_code = 'X' i_any = lx_root ).
                  when cs-s_error_code-user_exit.
                    ev_answer = cs-s_popup_answer-exit.
                endcase.
            endtry.



          when f4_help.

            try.

                clear ev_answer.

                lcl_help=>popup_f4_help(
                  exporting
                    iv_name_search_help = i_any2
                    iv_name_field       = i_any
                  receiving
                    rv_resault          = e_any ).

              catch cx_root into lx_root.
                case get( cx_code = 'X' i_any = lx_root ).
                  when cs-s_error_code-user_exit.
                    ev_answer = cs-s_popup_answer-exit.
                endcase.
            endtry.

          when json.
            data:
              lo_alv        type lcl_help=>ty_o_easy_gui.

            create object lo_alv.

            lo_alv->popup_json_data(
              exporting
                i_any = i_any
                importing
                    e_any = e_any
                ).

            return.

          when start_browser.

            data lv_url type c length 400.
            lv_url = i_any.

            call function 'CALL_BROWSER'
              exporting
                url                    = lv_url         " URL of Browser Call
*               window_name            = space         " Under ITS: Name of Browser Target Window
*               new_window             = space         " Under Win32: Open a New Window
*               browser_type           = browser_type  " Obsolete: Do Not Use
*               contextstring          = contextstring " Obsolete: Do Not Use
              exceptions
                frontend_not_supported = 1             " Frontend Not Supported
                frontend_error         = 2             " Error occurred in SAPGUI
                prog_not_found         = 3             " Program not found or not in executable form
                no_batch               = 4             " Front-End Function Cannot Be Executed in Backgrnd
                unspecified_error      = 5             " Unspecified Exception
                others                 = 6.
            if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
            x_raise_check( function = 'X').

          when start_tcode.

            if i_any2 is initial.
              return.
            endif.

            lcl_help=>call_transaction(
                iv_transaction_name = i_any
                iv_field1_name      = i_any2
                iv_field1_value     = i_any3
                iv_field2_name      = i_any3
                iv_field3_value     = i_any4 ).

          when range.

            lcl_help=>popup_range(
               exporting iv_any  = i_any
               importing et_range = e_any ev_cancel = data(lv_cancel) ).

            if lv_cancel = abap_true.
              x_raise('ZCX_USER_CANCEL').
            endif.

          when choose.
            lcl_help=>popup_choose(
              exporting
              iv_title   = iv_title
                it_choices = i_any
                i_sel      = i_any2
              receiving
                r_result   = e_any ).
            return.

          when print.
            data lt_stringtab type string_table.
            trans( exporting print  = 'X' i_any = i_any
                   importing  e_result = lt_stringtab ).
            gui_popup( tab = 'X' i_any = lt_stringtab ).
            return.

          when exception.
            data(lx_root2) = cast cx_root( i_any ).
            lcl_help=>gui_popup_exception( lx_root2 ).
            return.


          when tab.

            if get(  rtti_kind = 'X' i_any = i_any ) = cl_abap_datadescr=>kind_struct.

              data: lref_data type ref to data.
              field-symbols: <lt_data> type standard table.

              create data lref_data like table of i_any.
              assign i_any to <lt_data>.
              append initial line to <lt_data> assigning field-symbol(<l_any>).
              <l_any> = i_any.
              lcl_help=>popup_table( <lt_data> ).

            else.
              lcl_help=>popup_table(  i_any ).
            endif.
            return.

          when t100_ext.
            data lt_bapi type bapiret2_tab.
            clear lt_bapi.
            lt_bapi = msg( i_any )-t_bapi.
            lcl_help=>gui_popup_t100_ext(  lt_bapi ).
            return.

          when t100.

            clear lt_bapi.
            lt_bapi = msg( i_any  )-t_bapi.
            lcl_help=>gui_popup_t100(  lt_bapi ).
            return.

          when xml.

*            lv_xml = get( xml = 'X' i_any = i_any ).
            lcl_help=>gui_popup_xml( i_any ).
            return.


          when call_view.

            data lv_viewname type tabname.
            data lv_action type c length 1.

            lv_viewname = i_any.
            if i_any2 is not initial.
              lv_action = i_any2.
            else.
              lv_action = 'S'.
            endif.

            call function 'VIEW_MAINTENANCE_CALL'
              exporting
                action        = lv_action "'U' " S = Show, U = Update, T = Transport
                view_name     = lv_viewname
              exceptions
                error_message = 1
                others        = 2.
            if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
            x_raise_check( function = 'X').

          when balm.
            lcl_help=>gui_popup_bal_tab( i_any = i_any ).
            return.

          when balm_list.
            lcl_help=>gui_popup_bal_list_tab( i_any = i_any ).
            return.

          when start_bal.

            lcl_help=>gui_popup_bal(
                iv_object    = i_any
                iv_subobject = i_any2
                iv_extnumber = i_any3 ).
            return.

          when vari_sel.

            e_any = lcl_help=>popup_f4_help_vari_selscreen(
                iv_repid = i_any  ).

            if e_any is initial.
              ev_answer = cs-s_popup_answer-exit.
            endif.

          when msg.
            lcl_help=>gui_popup_inform(
                        msg( i_any = i_any i_type = iv_type )-s_bapi
                        ).
            return.

          when get_value.

            clear ev_answer.

            data: lv_is_cancel type abap_bool,
                  lv_tab1      type string,
                  lv_field1    type string.

*            split i_any at '-' into lv_tab1 lv_field1.
            lv_tab1   = segment( val = i_any sep = '-' index = 1 ).
            lv_field1 = segment( val = i_any sep = '-' index = 2 ).

            lcl_help=>gui_popup_get_value(
              exporting
                iv_title       = i_any2
                iv_tab1        = lv_tab1
                iv_field1      = lv_field1
              importing
                ev_user_cancel = lv_is_cancel
                ev_value1      = e_any ).

            if lv_is_cancel = abap_true.
              ev_answer = cs-s_popup_answer-exit.
            else.
*              e_any = lv_value.
            endif.


          when confirm.

            ev_answer = switch #( lcl_help=>gui_popup_confirm( msg( i_any = i_any i_type = iv_type )-s_bapi )
                            when abap_true  then cs-s_popup_answer-yes
                            when abap_false then cs-s_popup_answer-no ).

            "herausfinden was die beste AnzeigemÃ¶glichkeit ist...
          when others.

            case get( rtti_kind = 'X' i_any = i_any ). .

              when cl_abap_datadescr=>kind_elem.
*              try.
                gui_popup( msg_info = 'X' i_any = conv string( i_any ) ).
*              catch cx_root.
*              endtry.

              when cl_abap_datadescr=>kind_ref.

                if abap_true = check( castable = 'X' i_any = 'CX_ROOT' i_any2 = i_any ).
                  gui_popup( exception = 'X' i_any = i_any ).
                  return.
                endif.

                data lo_bal type ty-o_easy_abap.
                try.
                    lo_bal ?= i_any.
                    gui_popup( lo_bal->ms-t_bal ).
                  catch cx_root.
                endtry.

              when cl_abap_datadescr=>kind_struct.

                data(ls_bapi) = msg( i_any )-s_bapi.

                if ls_bapi is initial.

                  data lr_data type ref to data.
                  create data lr_data like table of i_any.
                  field-symbols <lt_table> type standard table.
                  assign lr_data->* to <lt_table>.
                  insert i_any into table <lt_table>.
                  gui_popup( <lt_table> ).
                  return.

                else.

                  gui_popup( t100 = 'X' i_any = i_any ).

                endif.

              when cl_abap_datadescr=>kind_table.

                case get( rtti_type_line = 'X' i_any = i_any ).

                  when 'BALM'.

                    gui_popup( balm = 'X' i_any = i_any ).
                    return.

                  when 'BALHDR'.
                    gui_popup( balm_list = 'X' i_any = i_any ).
                    return.

                  when others.
                    try.
                        msg( use_t100_only = abap_true raise_error = abap_true i_any = i_any ).
                        gui_popup(  t100 = 'X' i_any = i_any ).
                      catch cx_no_check.
                        gui_popup( tab = 'X' i_any = i_any ).
                    endtry.
                    return.

                endcase.

            endcase.


*
*            msg(
*             exporting
*               i_any         = i_any
**               iv_id         = iv_id
**               iv_no         = iv_no
*               iv_type       = iv_type
**               iv_v1         = iv_v1
**               iv_v2         = iv_v2
**               iv_v3         = iv_v3
**               iv_v4         = iv_v4
**               iv_langu      = iv_langu
*             importing
*               e_any         = ls_sy ).
*
*            if ls_sy-msgty ca 'EWSI'.
*            else.
*              ls_sy-msgty = 'I'.
*            endif.
*            message id ls_sy-msgid type ls_sy-msgty number ls_sy-msgno
*            with ls_sy-msgv1 ls_sy-msgv2 ls_sy-msgv3 ls_sy-msgv4.


        endcase.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

      catch cx_root into lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    endtry.

  endmethod.


  method gui_popup_gen.

    data:
      lo_alv        type lcl_help=>ty_o_easy_gui,
      lv_col_start  type i,
      lv_col_end    type i,
      lv_line_start type i,
      lv_line_end   type i.

    try.

        if abap_false = check( gui_active = 'X' ).
          x_raise('ZCX_GUI_ACTIVE_IN_BATCH_MODE_ERROR').
        endif.

        create data lcl_help=>lr_tab
            like it_table.
        field-symbols: <lt_tab> type standard table.

        assign lcl_help=>lr_tab->* to <lt_tab>.
        <lt_tab> = it_table.
        "PrÃ¼fung ist Tabelle reine Stringtab/clike tab?
        "TODO

        lv_col_start  = iv_col_start .
        lv_col_end    = iv_col_end   .
        lv_line_start = iv_line_start.
        lv_line_end   = iv_line_end  .

        create object lo_alv
          exporting
            ct_table    = lcl_help=>lr_tab "REF #( it_table )
            raise_event = abap_false.

        lo_alv->set(
            iv_title              = iv_title
            iv_vertical_lines     = iv_vertical_lines
            iv_headers_visible    = iv_headers_visible
            iv_raise_double_click = iv_raise_double_click
            it_raise_hotspot      = it_raise_hotspot
            it_outlen             = it_outlen
            it_col_setting        = it_col_setting
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

        if iv_sel is not initial.

          try.
              data lv_sel type i.
              lv_sel = iv_sel.
              if iv_sel_col is initial.
                lo_alv->ms_salv-o_selections->set_selected_rows( value = value salv_t_row(  (  lv_sel ) ) ).
              else.
                lo_alv->ms_salv-o_selections->set_current_cell( value =
                    value salv_s_cell( row = iv_sel columnname = iv_sel_col  ) ).
*            data lt_cells type salv_t_cell.
*            append initial line to lt_cells assigning field-symbol(<ls_cell>).
*            <ls_cell>-row       = lv_sel.
*            <ls_cell>-columnname = iv_sel_col.
*            lo_alv->ms_salv-o_selections->set_selected_cells( value = lt_cells ).
              endif.

            catch cx_root.
          endtry.

        endif.


        lo_alv->display(  ).

        ev_event_type = lo_alv->ms_event-type.
        ev_event_col  = lo_alv->ms_event-col.
        ev_event_row  = lo_alv->ms_event-row.
        ev_event_value = lo_alv->ms_event-value.
        ev_ucomm = lo_alv->ms_event-ucomm.

*    er_line = lo_alv->ms_event-line.
        assign lo_alv->ms_event-line->* to field-symbol(<ls_line>).
        if <ls_line> is assigned and er_line is supplied.
          er_line = <ls_line>.
        endif.

        et_selection = lo_alv->ms_event-t_selections.
*    if lo_alv->ms_salv-o_salv is bound.
**        ms_event-t_selections = ms_salv-o_selections->get_selected_rows( ).
*    ev_event_type = lo_alv->ms_event-type.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

      catch cx_root into data(lx_root).
        lcl_help=>handle_error( ix_root = lx_root raise_error = raise_error ).
    endtry.

  endmethod.


  method gui_screen.

    data:
      lv_name_found type abap_bool,
      lv_name       type string,
      lv_repid      type string.

    field-symbols:
          <lv_any> type any.

    try.

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " diese Methode kann Screen Eigenschaften setzten/lesen
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

        if iv_repid is initial.
          info( exporting iv_depth = 1 importing ev_repid = lv_repid ).
        else.
          lv_repid = iv_repid.
        endif.


        case abap_true.


          when status.
            data ls_sy type sy.
            msg(
         exporting
           i_any        = i_any
           i_type       = i_any2
         importing
           e_any         = ls_sy ).

            if ls_sy-msgty ca 'EWSI'.
            else.
              ls_sy-msgty = 'I'.
            endif.
            message id ls_sy-msgid type 'S' number ls_sy-msgno
            with ls_sy-msgv1 ls_sy-msgv2 ls_sy-msgv3 ls_sy-msgv4
            display like ls_sy-msgty.

          when status_progress.

            data lv_prozent type i.
            data lv_text type char100.

            lv_text    = i_any.
            lv_prozent = i_any2.

            call function 'SAPGUI_PROGRESS_INDICATOR'
              exporting
                percentage = lv_prozent
                text       = lv_text.

            "F4 Hilfen sind ohne PAI/PBO
            "mit diesem Befehl kÃ¶nnen trotzdem Daten transportiert werden
          when elem_get_by_value.

            data: dynpfields   type standard table of dynpread,
                  ls_dynpfield type dynpread,
                  lv_dynname   type c length 40.

            lv_dynname = lv_repid.
            ls_dynpfield-fieldname  = i_any.
*            ls_dynpfield-fieldvalue = i_any2.
            append ls_dynpfield to dynpfields.

            call function 'DYNP_VALUES_READ'
              exporting
                dyname               = lv_dynname
                dynumb               = sy-dynnr
              tables
                dynpfields           = dynpfields
              exceptions
                invalid_abapworkarea = 1
                invalid_dynprofield  = 2
                invalid_dynproname   = 3
                invalid_dynpronummer = 4
                invalid_request      = 5
                no_fielddescription  = 6
                undefind_error       = 7
                error_message        = 8
                others               = 9.
            if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
            x_raise_check( function = 'X' ).

            read table dynpfields index 1
                into ls_dynpfield.

            e_result = ls_dynpfield-fieldvalue.


            "F4 Hilfen sind ohne PAI/PBO
            "mit diesem Befehl kÃ¶nnen trotzdem Daten transportiert werden
          when elem_set_by_value.

*            DATA: dynpfields   TYPE STANDARD TABLE OF dynpread,
*                  ls_dynpfield TYPE dynpread.
            lv_dynname = lv_repid.
            ls_dynpfield-fieldname  = i_any.
            ls_dynpfield-fieldvalue = i_any2.
            append ls_dynpfield to dynpfields.

            call function 'DYNP_VALUES_UPDATE'
              exporting
                dyname               = lv_dynname
                dynumb               = sy-dynnr
              tables
                dynpfields           = dynpfields
              exceptions
                invalid_abapworkarea = 1
                invalid_dynprofield  = 2
                invalid_dynproname   = 3
                invalid_dynpronummer = 4
                invalid_request      = 5
                no_fielddescription  = 6
                undefind_error       = 7
                error_message        = 8
                others               = 9.
            if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
            x_raise_check( function = 'X' ).

            "Felder per Dirty Assign updaten
            "z.Bl. fÃ¼r Comments die nicht in Paramstabelle sind
          when elem_set_by_dirty.

            data(lv_assign_addr) = '(' && lv_repid && ')' && i_any.
            assign (lv_assign_addr) to <lv_any>.
            if <lv_any> is not assigned.
              x_raise('ZCX_FIELD_NOT_FOUND').
            endif.
            <lv_any> = i_any2.


          when seldata_set.

            lcl_help=>selscreen_set(
              exporting
                i_any       = i_any
                iv_repid    = lv_repid
                raise_error = abap_true ).

          when seldata_set_vari.

            data lv_report_vari type c length 40.
            data lv_vari_vari type c length 14.

            lv_report_vari = lv_repid.
            lv_vari_vari   = i_any.

            call function 'RS_SUPPORT_SELECTIONS'
              exporting
                report               = lv_report_vari "Reportname
                variant              = lv_vari_vari   "Variantenname
              exceptions
                variant_not_existent = 1
                variant_obsolete     = 2
                others               = 3.
            x_raise_check( function = 'X' ).

*            data: lt_params2 type rsparams_tt.
*
*            gui_screen(
*         exporting
*           seldata_get       = 'X'
*           i_any             = i_any
*           iv_repid          = lv_repid
*         importing
*           e_result          = lt_params2 ).
*
*            gui_screen(
*             seldata_set       = 'X'
*             i_any             = lt_params2 ).


          when seldata_get.

            rtti(
              exporting
                i_any                  = e_result
*                iv_name                =
*                i_fnam_type            =
*                i_fnam_tab             =
*                iv_langu               = SY-LANGU
*                raise_error            = ABAP_FALSE
              importing
*                ev_kind                =
                ev_type                =  data(lv_tab_type)
*                ev_type_is_ddic        =
*                ev_type_kind           =
*                ev_type_kind_is_c      =
*                ev_line_kind           =
                ev_line_type           = data(lv_line_type)
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


            if lv_tab_type = 'RSPARAMS_TT'
            or lv_line_type = 'RSPARAMS'.
*            IF 'RSPARAMS_TT' = get( rtti_type = 'X' i_any = e_result ).
*            or 'RSPARAMS'

              lcl_help=>selscreen_get(
                exporting
                  iv_repid             = lv_repid
                  iv_variant           = i_any
                  raise_error          = abap_true
                importing
                  et_parameter         = data(lt_params) ).

              field-symbols: <lt_tab> type standard table.
              assign e_result to <lt_tab>.

              loop at lt_params into data(ls_param).
                append initial line to <lt_tab> assigning field-symbol(<ls_tab>).
                move-corresponding ls_param to <ls_tab>.
              endloop.

            elseif cl_abap_typedescr=>kind_struct = get( rtti_kind = 'X' i_any = e_result ).

              lcl_help=>selscreen_get(
                exporting
                  iv_repid             = lv_repid
                  iv_variant           = i_any
                  raise_error          = abap_true
                importing
                  es_struc             = e_result ).

            endif.



          when elem_inactive or elem_active or elem_invisible or elem_intensify.

            lv_name = get( trim_upper_case = 'X' i_any = i_any ).

            loop at screen.

              if not screen-name cs lv_name.
                continue.
              endif.

              lv_name_found = abap_true.

              case abap_true.
                when elem_invisible.
                  screen-active = 1.
                  screen-output = 0.
                  screen-input  = 0.
                  screen-invisible = 1.
                when elem_inactive.
                  screen-input  = 0.
                when elem_intensify.
                  screen-intensified = 1.

              endcase.

              modify screen.
            endloop.

            if lv_name_found = abap_false.
              x_raise('ZCX_FIELD_NOT_FOUND').
            endif.


          when title_set.

            data lv_title type string.

            lv_title = msg( i_any )-text.

            "generischer SAP Title der auch vom cl_salv_table benutzt wird
            set titlebar '003'
            of program 'SAPLKKBL'
            with lv_title.
            x_raise_check( sy_subrc = 'X' ).
            return.

          when others.
            x_raise('ZCX_WRONG_CALL_OF_METHOD').
        endcase.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        data: lx_root type ref to cx_root.
      catch cx_root into lx_root.
        lcl_help=>handle_error( ix_root = lx_root raise_error = raise_error ).
    endtry.


  endmethod.


  method info.

    " diese Methode ermittelt diverse Informationen

    clear es_callstack.
    clear ev_log_info.
    clear et_callstack.
    clear ev_method.
    clear ev_work_process_id.
    clear ev_repid.

    try.

        if r_result is supplied.

          info(
            exporting
              iv_depth           = iv_depth + 1
              raise_error        = raise_error
            importing
              ev_date            =   ev_date
              ev_time            =   ev_time
              ev_timestampl      =   ev_timestampl
              ev_time_iso8601    =   ev_time_iso8601
              ev_username        =   ev_username
              ev_log_info        =   ev_log_info
          ).

          r_result-date            = ev_date            .
          r_result-time            = ev_time            .
          r_result-timestampl      = ev_timestampl      .
          r_result-time_iso8601    = ev_time_iso8601    .
          r_result-user            = ev_username        .
          r_result-log_info        = ev_log_info        .
          return.
        endif.



        if ev_date is supplied
        or ev_time is supplied
        or ev_timestampl is supplied
        or ev_time_iso8601 is supplied.

          get time stamp field ev_timestampl.
          convert time stamp ev_timestampl
          time zone sy-zonlo
          into date ev_date
          time ev_time.

          if ev_time_iso8601 is supplied.
            "20171028163427.1811670
            "2017-05-31T23:59:59

            data:
              lv_time_string type char200.

            lv_time_string =  ev_timestampl.
            shift lv_time_string left deleting leading ' '.
            concatenate
            lv_time_string(4) '-' lv_time_string+4(2) '-' lv_time_string+6(2) 'T'
            ev_time(2) ':' ev_time+2(2) ':'  ev_time+4(2) lv_time_string+14(7)
             into lv_time_string.

            ev_time_iso8601 = lv_time_string.
*        SHIFT iv_date_time LEFT DELETING LEADING ' '.
*        CONCATENATE iv_date_time(4)  iv_date_time+5(2)  iv_date_time+8(2)     INTO lv_date.
*        CONCATENATE iv_date_time+11(2) iv_date_time+14(2) iv_date_time+17(2) INTO lv_time.
          endif.


*          data: date type d,
*                time type t.
*
*          data: year   type i,
*                month  type i,
*                day    type i,
*                hour   type i,
*                minute type i,
*                second type i.
*
*          date = sy-datlo.
*          time = sy-timlo.
*
*          year   = substring( val = date off = 0 len = 4 ).
*          month  = substring( val = date off = 4 len = 2 ).
*          day    = substring( val = date off = 6 len = 2 ).
*          hour   = substring( val = time off = 0 len = 2 ).
*          minute = substring( val = time off = 2 len = 2 ).
*          second = substring( val = time off = 4 len = 2 ).


        endif.

        if e_mock is supplied.

          lcl_help=>mock_data( importing e_mock = e_mock ).

        endif.

        if ev_log_info is supplied.
          ev_log_info = get( log_info = 'X' ).
        endif.

*        IF ev_date_write IS SUPPLIED.
*          WRITE sy-datum TO lv_char20.
*          ev_date_write = lv_char20.
*        ENDIF.
*
*        IF ev_time_write IS SUPPLIED.
*          WRITE sy-uzeit TO lv_char20.
*          ev_time_write = lv_char20.
*        ENDIF.

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        if ev_is_gui_active is supplied.

          data:
        lv_gui type char1.

          ev_is_gui_active = abap_false.

          if sy-batch = abap_false
            and sy-binpt = abap_false.

            call function 'RFC_IS_GUI_ON'
              importing
                on = lv_gui.

            if lv_gui = 'Y'.
              ev_is_gui_active = abap_true.
            endif.
          endif.
        endif.

        if ev_work_process_id is supplied.

          data:
            lv_wp_no type wpno.

          call function 'TH_GET_OWN_WP_NO'
            importing
*             subrc =     " Return Code of the Function Module
              wp_no = lv_wp_no    " Separate Work Process Number
*             wp_pid   =     " PID of Separate Work Process
*             wp_index =
            .
          ev_work_process_id = lv_wp_no.

        endif.


        if ev_username is supplied.
          ev_username = sy-uname.
        endif.

        """""""""""""""""""""""""""""""
        if es_callstack is supplied or et_callstack is supplied or et_source_code is supplied
            or ev_repid is supplied or ev_method is supplied.

          call function 'SYSTEM_CALLSTACK'
            exporting
              max_level = '0'
            importing
              callstack = et_callstack.

          "delete this method
          delete et_callstack index 1.
          if iv_depth is not initial.
            data: lv_count type i.
            lv_count = iv_depth.
            do lv_count times.
              delete et_callstack index 1.
            enddo.
          endif.

          read table et_callstack into es_callstack
              index 1.

          ev_repid = es_callstack-mainprogram.
          ev_method = es_callstack-blockname.

        endif.

        if et_source_code is supplied.

          data:
            lo_wb_source    type ref to cl_wb_source,
            lv_name_program type trdir-name.

          lv_name_program = es_callstack-include. "iv_name_program.

          create object lo_wb_source
            exporting
              source_name = lv_name_program.    " physical name.


          lo_wb_source->read_source(
            importing
              source_tab = et_source_code "Source Code
            exceptions
              cancelled                     = 1
              not_found                     = 2
              read_protected                = 3
              enhancement_locked            = 4
              others                        = 6 ).
          if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma

        endif.


        if et_dequeue_table is supplied.

          et_dequeue_table =  lcl_help=>lock_get_snap( ).

        endif.





        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        data: lx_root type ref to cx_root.
      catch cx_root into lx_root.
        lcl_help=>handle_error( ix_root = lx_root raise_error = raise_error ).
    endtry.

  endmethod.


  method itab.

    try.

        field-symbols:
          <ls_tab>    type any,
          <ls_tab_in> type any,
          <lt_result> type standard table.

        data:
          lt_r_tab type ref to data.

        create data lt_r_tab
         like ct_tab.

        assign lt_r_tab->* to <lt_result>.


        case abap_true.

          when change_sequence.

            while ct_tab is not initial.
              append initial line to <lt_result> assigning <ls_tab>.

              read table ct_tab assigning <ls_tab_in>
               index lines( ct_tab ).
              <ls_tab> = <ls_tab_in>.

              delete ct_tab index lines( ct_tab ).
            endwhile.


          when delete_duplicates.

            sort ct_tab.
            delete adjacent duplicates from ct_tab comparing all fields.
            <lt_result> = ct_tab.

          when others.
            x_raise('ZCX_WRONG_METHOD_CALL').
        endcase.


        clear ct_tab.
        ct_tab = <lt_result>.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        data: lx_root type ref to cx_root.
      catch cx_root into lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    endtry.

  endmethod.


  method json.

    data lt_tab type standard table of string.
    data lv_json_line type string.
    data lv_type type string.
    data lv_kind type string.
    field-symbols <any> type any.


    try.

        if abap_true = json_2.

          if i_any is initial.
            x_raise('ZCX_INPUT_DATA_IS_INITIAL_ERROR').
          endif.

          trans(
            exporting
              json_2             = 'X'
              i_any              = i_any
            importing
              e_result           = lt_tab
          ).

          clear lv_json_line.
          if e_any1 is supplied or e_ref1 is supplied or e_type1 is supplied or e_kind1 is supplied.
            read table lt_tab into lv_json_line
                index 1.
            x_raise_check(  read_table = 'X' ).

            read table lt_tab into lv_kind
          index 2.
            x_raise_check(  read_table = 'X' ).
            read table lt_tab into lv_type
                index 3.
            x_raise_check(  read_table = 'X' ).

            e_type1 = lv_type.
            e_kind1 = lv_kind.

            if e_any1 is supplied.

              trans(
        exporting
          json_2             = 'X'
          i_any              = lv_json_line
        importing
          e_result           = e_any1
      ).

            endif.

            if e_ref1 is supplied.
              case lv_kind.

                when cl_abap_datadescr=>kind_ref.

                  trans(
                      exporting
                          json_2 = 'X'
                          i_any  = lv_json_line
                      importing
                          e_result = e_ref1
                              ).

                when others.

                  create data e_ref1
                    type (lv_type).

                  assign e_ref1->* to <any>.

                  trans(
                   exporting
                     json_2             = 'X'
                     i_any              = lv_json_line
                   importing
                     e_result           = <any>
                 ).

              endcase.

            endif.

          endif.

          clear lv_json_line.
          if e_any2 is supplied or e_ref2 is supplied or e_type2 is supplied or e_kind2 is supplied..
            read table lt_tab into lv_json_line
                index 4.
            x_raise_check(  read_table = 'X' ).

            read table lt_tab into lv_kind
          index 5.
            x_raise_check(  read_table = 'X' ).
            read table lt_tab into lv_type
                index 6.
            x_raise_check(  read_table = 'X' ).

            e_type2 = lv_type.
            e_kind2 = lv_kind.

            if e_any2 is supplied.

              trans(
        exporting
          json_2             = 'X'
          i_any              = lv_json_line
        importing
          e_result           = e_any2
      ).

            endif.

            if e_ref2 is supplied.
              case lv_kind.

                when cl_abap_datadescr=>kind_ref.

                  trans(
                      exporting
                          json_2 = 'X'
                          i_any  = lv_json_line
                      importing
                          e_result = e_ref2
                              ).

                when others.

                  create data e_ref2
                    type (lv_type).

                  assign e_ref2->* to <any>.

                  trans(
                   exporting
                     json_2             = 'X'
                     i_any              = lv_json_line
                   importing
                     e_result           = <any>
                 ).

              endcase.

            endif.

          endif.

          clear lv_json_line.
          if e_any3 is supplied or e_ref3 is supplied or e_type3 is supplied or e_kind3 is supplied.
            read table lt_tab into lv_json_line
                index 7.
            x_raise_check(  read_table = 'X' ).

            read table lt_tab into lv_kind
          index 8.
            x_raise_check(  read_table = 'X' ).
            read table lt_tab into lv_type
                index 9.
            x_raise_check(  read_table = 'X' ).

            e_type3 = lv_type.
            e_kind3 = lv_kind.

            if e_any3 is supplied.

              trans(
        exporting
          json_2             = 'X'
          i_any              = lv_json_line
        importing
          e_result           = e_any3
      ).

            endif.

            if e_ref3 is supplied.
              case lv_kind.

                when cl_abap_datadescr=>kind_ref.

                  trans(
                      exporting
                          json_2 = 'X'
                          i_any  = lv_json_line
                      importing
                          e_result = e_ref3
                              ).

                when others.

                  create data e_ref3
                    type (lv_type).

                  assign e_ref3->* to <any>.

                  trans(
                   exporting
                     json_2             = 'X'
                     i_any              = lv_json_line
                   importing
                     e_result           = <any>
                 ).

              endcase.
            endif.
          endif.


          clear lv_json_line.
          if e_any4 is supplied or e_ref4 is supplied or e_type4 is supplied or e_kind4 is supplied..
            read table lt_tab into lv_json_line
                index 10.
            x_raise_check(  read_table = 'X' ).

            read table lt_tab into lv_kind
          index 11.
            x_raise_check(  read_table = 'X' ).
            read table lt_tab into lv_type
                index 12.
            x_raise_check(  read_table = 'X' ).

            e_type4 = lv_type.
            e_kind4 = lv_kind.

            if e_any4 is supplied.

              trans(
        exporting
          json_2             = 'X'
          i_any              = lv_json_line
        importing
          e_result           = e_any4
      ).

            endif.

            if e_ref4 is supplied.
              case lv_kind.

                when cl_abap_datadescr=>kind_ref.

                  trans(
                      exporting
                          json_2 = 'X'
                          i_any  = lv_json_line
                      importing
                          e_result = e_ref4
                              ).

                when others.

                  create data e_ref4
                    type (lv_type).

                  assign e_ref4->* to <any>.

                  trans(
                   exporting
                     json_2             = 'X'
                     i_any              = lv_json_line
                   importing
                     e_result           = <any>
                 ).

              endcase.

            endif.

          endif.

          clear lv_json_line.
          if e_any5 is supplied or e_ref5 is supplied or e_type5 is supplied or e_kind5 is supplied..
            read table lt_tab into lv_json_line
                index 13.
            x_raise_check(  read_table = 'X' ).

            read table lt_tab into lv_kind
          index 14.
            x_raise_check(  read_table = 'X' ).
            read table lt_tab into lv_type
                index 15.
            x_raise_check(  read_table = 'X' ).

            e_type5 = lv_type.
            e_kind5 = lv_kind.

            if e_any5 is supplied.

              trans(
        exporting
          json_2             = 'X'
          i_any              = lv_json_line
        importing
          e_result           = e_any5
      ).

            endif.

            if e_ref5 is supplied.
              case lv_kind.

                when cl_abap_datadescr=>kind_ref.

                  trans(
                      exporting
                          json_2 = 'X'
                          i_any  = lv_json_line
                      importing
                          e_result = e_ref5
                              ).

                when others.

                  create data e_ref5
                    type (lv_type).

                  assign e_ref5->* to <any>.

                  trans(
                   exporting
                     json_2             = 'X'
                     i_any              = lv_json_line
                   importing
                     e_result           = <any>
                 ).

              endcase.

            endif.

          endif.


        else.

          insert get( json = 'X' i_any = i_any )      into table lt_tab.
          insert get( rtti_kind = 'X' i_any = i_any ) into table lt_tab.
          insert get( rtti_type = 'X' i_any = i_any ) into table lt_tab.

          insert get( json = 'X' i_any = i_any2 )      into table lt_tab.
          insert get( rtti_kind = 'X' i_any = i_any2 ) into table lt_tab.
          insert get( rtti_type = 'X' i_any = i_any2 ) into table lt_tab.

          insert get( json = 'X' i_any = i_any3 )      into table lt_tab.
          insert get( rtti_kind = 'X' i_any = i_any3 ) into table lt_tab.
          insert get( rtti_type = 'X' i_any = i_any3 ) into table lt_tab.

          insert get( json = 'X' i_any = i_any4 )      into table lt_tab.
          insert get( rtti_kind = 'X' i_any = i_any4 ) into table lt_tab.
          insert get( rtti_type = 'X' i_any = i_any4 ) into table lt_tab.

          insert get( json = 'X' i_any = i_any5 )      into table lt_tab.
          insert get( rtti_kind = 'X' i_any = i_any5 ) into table lt_tab.
          insert get( rtti_type = 'X' i_any = i_any5 ) into table lt_tab.

          e_any1 = get( json = 'X' i_any = lt_tab ).

        endif.

      catch cx_root into data(lx_root).
        lcl_help=>handle_error(
            ix_root      = lx_root
            raise_error  = raise_error
        ).
    endtry.
  endmethod.


  method log.

    data lt_balmt type ty-t_bal.

    r_result = me.

    data(lt_bapi) = msg(
       exporting
         i_any        = i_any
         i_id         = i_id
         i_no         = i_no
         i_type       = i_type
         i_v1         = i_v1
         i_v2         = i_v2
         i_v3         = i_v3
         i_v4         = i_v4
         i_langu      = i_langu
         raise_error  = abap_false
       importing
         e_any         = lt_balmt
     )-t_bapi.

    insert lines of lt_bapi into table ms-t_log.

    info(
      importing
        ev_timestampl      = data(lv_time_stmp)
    ).

    loop at lt_balmt assigning field-symbol(<ls_bal>).
      <ls_bal>-time_stmp = lv_time_stmp.
    endloop.

    insert lines of lt_balmt into table ms-t_bal.


  endmethod.


  method msg.

    data:
      lt_bapiret_result type bapiret2_tab,
      ls_result         type bapiret2,
      lv_msgvar_check   type abap_bool.

    "Ermitteln von Messageinformationen aus beliebigen Daten und Objekten
    "Wenn keine Nachrichtenklasse ermittelt werden kann, wird nach Text gesucht
    "Mapping auf beliebige Ausgabeparameter

    "speed up
    if i_id is initial and i_no is initial and i_any is initial.
      return.
    endif.

    try.
        """""""""""""""""""""""""""""""""""
        " id/no ermitteln

        if i_id is not initial and i_no is not initial.
          ls_result-number = i_no.
          ls_result-id     = i_id.
          insert ls_result into table r_result-t_bapi.
        endif.

        if i_any is not initial.

          lt_bapiret_result = lcl_help=>t100_get( i_any ).
          insert lines of lt_bapiret_result into table r_result-t_bapi.
          if r_result-t_bapi is initial and use_t100_only = abap_false.

            "Text auch mit Klartext ermitteln
            data(lo_typedescr) = cl_abap_typedescr=>describe_by_data( i_any ).
            if lo_typedescr->kind = cl_abap_datadescr=>kind_elem.

              "Standard umwandeln
              ls_result = lcl_help=>t100_get_w_text(
                                      iv_text = i_any
                                      iv_v1 = i_v1
                                      iv_v2 = i_v2
                                      iv_v3 = i_v3
                                      iv_v4 = i_v4 ).

              lv_msgvar_check = abap_true.
              insert ls_result into table r_result-t_bapi.

            endif.
          endif.
        endif.


        """""""""""""""""""""""""""""""""""
        " Msginfo gefunden?

        read table r_result-t_bapi assigning field-symbol(<ls_result>) index 1.
        if sy-subrc <> 0.
          raise exception type lcx_no_check.
        endif.

        "Messagevariablen u Type aus inputvariablen setzten (wenn vorhanden)
        if lv_msgvar_check = abap_false.
          if <ls_result>-message_v1 is initial and i_v1 is not initial.
            <ls_result>-message_v1 = get( print ='X' i_any = i_v1 ).
          endif.
          if <ls_result>-message_v2 is initial and i_v2 is not initial..
            <ls_result>-message_v2 = get( print ='X' i_any = i_v2 ).
          endif.
          if <ls_result>-message_v3 is initial and i_v3 is not initial..
            <ls_result>-message_v3 = get( print ='X' i_any = i_v3 ).
          endif.
          if <ls_result>-message_v4 is initial and i_v4 is not initial..
            <ls_result>-message_v4 = get( print ='X' i_any = i_v4 ).
          endif.
        endif.
        if i_type is not initial.
          <ls_result>-type = i_type.
        endif.


        """""""""""""""""""""""""""""""""""
        " Text bestimmen

        loop at r_result-t_bapi assigning <ls_result>.

          <ls_result>-message = get_bus( t100_text_by_no_id = 'X'
                                       iv_langu = i_langu
                                       i_any    = <ls_result>-number
                                       i_any2   = <ls_result>-id ).

          <ls_result>        = lcl_help=>t100_replace_placeholder( <ls_result> )  .
          <ls_result>-type   = get( trim_upper_case = 'X' i_any = <ls_result>-type ).
          <ls_result>-id     = get( trim_upper_case = 'X' i_any = <ls_result>-id ).
          <ls_result>-number = get( trim_upper_case = 'X' i_any = <ls_result>-number ).

          if <ls_result>-type = 'E'.
            data(lv_is_error) = abap_true.
            exit.
          endif.

          if <ls_result>-type = 'W'.
            data(lv_is_warning) = abap_true.
          endif.

          if <ls_result>-type = 'S'.
            data(lv_is_success) = abap_true.
          endif.

        endloop.


        """""""""""""""""""""""""""""""
        " Ausgabe vorbereiten

        if lv_is_error = abap_true.
          r_result-type = 'E'.
        elseif lv_is_warning = abap_true.
          r_result-type = 'W'.
        elseif lv_is_success = abap_true.
          r_result-type = 'S'.
        endif.

        r_result-noid = <ls_result>-number.
        concatenate  r_result-noid '(' <ls_result>-id ')' into r_result-noid.

        if e_any is supplied.

          clear e_any.
          lcl_help=>t100_set(
                  exporting it_bapi = r_result-t_bapi
                  importing e_any   = e_any ).

        endif.

        if e_any_add is supplied.

          lcl_help=>t100_set(
                  exporting it_bapi = r_result-t_bapi
                  importing e_any   = e_any_add ).

        endif.

        if r_result is supplied.
          r_result-s_bapi = r_result-t_bapi[ 1 ].
          if  r_result-type = 'E'.
            r_result-is_error = abap_true.
          endif.
          r_result-text     = r_result-s_bapi-message.
          r_result-s_balm-msgid = r_result-s_bapi-id.
          r_result-s_balm-msgno = r_result-s_bapi-number.
          r_result-s_balm-msgty = r_result-type.
          r_result-s_balm-msgv1 = r_result-s_bapi-message_v1.
          r_result-s_balm-msgv2 = r_result-s_bapi-message_v2.
          r_result-s_balm-msgv3 = r_result-s_bapi-message_v3.
          r_result-s_balm-msgv4 = r_result-s_bapi-message_v4.
          info( importing ev_timestampl = r_result-s_balm-time_stmp ).

        endif.


        "Message Befehl
*        loop at r_result-t_bapi into data(ls_log_msg).
*
*          "Watchpoint auf Message soll hier stehenbleiben
*          if ls_log_msg-type cn 'EWSI'.
*            ls_log_msg-type = 'I'.
*          endif.
*          message id ls_log_msg-id
*          type ls_log_msg-type
*          number ls_log_msg-number
*          with ls_log_msg-message_v1 ls_log_msg-message_v2 ls_log_msg-message_v3 ls_log_msg-message_v4
*          into data(lv_dummy).
*        endloop.


        """""""""""""""""""""""""""""""
        " error handling

        data  lx_root type ref to cx_root.
      catch cx_root into lx_root.
        clear r_result.
        lcl_help=>handle_error(
               ix_root = lx_root raise_error = raise_error
               raise_assert = abap_false ).
    endtry.

  endmethod.


  method rtti.

    data:
      lo_class       type ref to cl_abap_classdescr,
      lo_class_super type ref to cl_abap_classdescr,
      lo_ref         type ref to cl_abap_refdescr,
      lo_descr_ref   type ref to cl_abap_typedescr,
      lo_obj         type ref to cl_abap_objectdescr.

    try.

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Kind bestimmen

        data: lo_descr type ref to cl_abap_typedescr.

        if i_any is supplied.
          lo_descr = cl_abap_typedescr=>describe_by_data( i_any ).
        elseif iv_name is not initial.
          cl_abap_typedescr=>describe_by_name(
             exporting
               p_name       = iv_name " Type name
             receiving
               p_descr_ref  =  lo_descr   " Reference to description object
             exceptions
               type_not_found = 1
               others         = 2 ).
          if sy-subrc <> 0. sy-subrc = 99. endif. "SLIN check ok without pragma
          x_raise_check( method = 'X' ).
        else.
          x_raise('ZCX_METHOD_CALL_W_INPUT_INITIAL').
        endif.

        ev_kind = lo_descr->kind.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "method speed up: nur weiter durchlaufen wenn auch was anderes gebraucht wird

        if ev_type    is not supplied
         and  ev_type_kind         is not supplied
         and  ev_type_abap         is not supplied
         and  ev_type_is_ddic      is not supplied
         and  ev_line_kind         is not supplied
         and  ev_type_kind_is_c    is not supplied
         and  ev_line_type         is not supplied
         and  ev_line_type_kind    is not supplied
         and  ev_line_type_kind_is_c is not supplied
         and  ev_line_type_is_ddic is not supplied
         and  ev_ref_dyn           is not supplied
         and  ev_ref_stat          is not supplied
         and  ev_ref_super         is not supplied
         and  et_ref_super         is not supplied
         and  !et_comp             is not supplied
         and  !et_domrange         is not supplied
         and  !ev_convexit         is not supplied
         and  !ev_in_domr          is not supplied
         and  !ev_fieldname        is not supplied
         and  !ev_typedescr        is not supplied
         and  !ev_outputlen        is not supplied
         and  eo_handle            is not supplied
         and  ev_length            is not supplied
         and r_result              is not supplied
         and ev_table_type         is not supplied.
          return.
        endif.

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "Typinfos bestimmen

        case lo_descr->kind.

          when cl_abap_typedescr=>kind_elem.

            data lo_elem type ref to cl_abap_elemdescr.
            lo_elem     ?=  lo_descr.
            ev_type      = lo_elem->get_relative_name(  ).
            ev_type_kind = lo_elem->type_kind.

            if lo_elem->is_ddic_type(  ) = abap_true.
              ev_type_is_ddic = abap_true.
            endif.

            case ev_type_kind.
              when cl_abap_typedescr=>typekind_char
              or cl_abap_typedescr=>typekind_string
              or cl_abap_typedescr=>typekind_num
              or cl_abap_typedescr=>typekind_clike
              or cl_abap_typedescr=>typekind_csequence.

                ev_type_kind_is_c = abap_true.
            endcase.

          when cl_abap_typedescr=>kind_struct.

            data lo_struct type ref to cl_abap_structdescr.
            lo_struct   ?= lo_descr.
            ev_type      = lo_struct->get_relative_name(  ).
            ev_type_kind = lo_struct->type_kind.
            if lo_struct->is_ddic_type(  ) = abap_true.
              ev_type_is_ddic = abap_true.
            endif.

            et_comp = lo_struct->get_components(  ).
            eo_handle = lo_struct->create( p_components =  et_comp ).

          when cl_abap_typedescr=>kind_table.

            data: lo_tab type ref to cl_abap_tabledescr.
            lo_tab ?= lo_descr.

            ev_type      = lo_tab->get_relative_name(  ).
            ev_type_kind = lo_tab->type_kind.
            if lo_tab->is_ddic_type(  ) = abap_true.
              ev_type_is_ddic = abap_true.
            endif.
            ev_table_type = lo_tab->table_kind.

            data lo_descr_line type ref to cl_abap_structdescr.

            lo_descr = lo_tab->get_table_line_type(  ).
            ev_line_kind      = lo_descr->kind.
            ev_line_type      = lo_descr->get_relative_name(  ).
            ev_line_type_kind = lo_descr->type_kind.
            if lo_descr->is_ddic_type(  ) = abap_true.
              ev_line_type_is_ddic = abap_true.
            endif.

            try.
                lo_descr_line ?= lo_descr.
                eo_handle = lo_tab->create( p_line_type =  lo_descr_line ).
              catch cx_root.
            endtry.

            case ev_line_type_kind.
              when cl_abap_datadescr=>typekind_csequence
              or cl_abap_datadescr=>typekind_char
              or cl_abap_datadescr=>typekind_clike
              or cl_abap_datadescr=>typekind_string.
                ev_line_type_kind_is_c = abap_true.
            endcase.

          when cl_abap_typedescr=>kind_class.

            lo_class ?= lo_descr.
            ev_ref_stat =  lo_class->absolute_name+7.
            ev_type     = ev_ref_stat.

            if et_ref_super is supplied or ev_ref_super is supplied.

              lo_class_super = lo_class.
              while lo_class_super is bound.
                if '\CLASS=OBJECT' = lo_class_super->absolute_name.
                  exit.
                endif.
                ev_ref_super = lo_class_super->absolute_name+7.
                append ev_ref_super to et_ref_super.
                lo_class_super = lo_class_super->get_super_class_type(  ).
              endwhile.

            endif.

            return.

          when cl_abap_typedescr=>kind_ref.

            lo_ref ?= cl_abap_typedescr=>describe_by_data( i_any ).
            lo_descr_ref = lo_ref->get_referenced_type(  ).
            ev_ref_stat  = lo_descr_ref->absolute_name+7.
            ev_type      = ev_ref_stat.

            if et_ref_super is supplied or ev_ref_super is supplied.

              lo_class ?= lo_descr_ref.
              lo_class_super = lo_class.
              while lo_class_super is bound.
                if '\CLASS=OBJECT' = lo_class_super->absolute_name.
                  exit.
                endif.
                ev_ref_super = lo_class_super->absolute_name+7.
                append ev_ref_super to et_ref_super.
                lo_class_super = lo_class_super->get_super_class_type(  ).
              endwhile.

            endif.

            if i_any is bound and ( ev_ref_dyn is supplied or et_ref_super is supplied ).

              lo_obj ?= cl_abap_typedescr=>describe_by_object_ref( i_any ).
              ev_ref_dyn = lo_obj->absolute_name+7.

              if et_ref_super is supplied.
                clear et_ref_super.
                lo_class ?= lo_obj.
                lo_class_super = lo_class.
                while lo_class_super is bound.
                  if '\CLASS=OBJECT' = lo_class_super->absolute_name.
                    exit.
                  endif.
                  ev_ref_super = lo_class_super->absolute_name+7.
                  append ev_ref_super to et_ref_super.
                  lo_class_super = lo_class_super->get_super_class_type(  ).
                endwhile.

              endif.

            endif.

            return.
        endcase.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "method speed up: nur weiter durchlaufen wenn auch was anderes gebraucht wird

        if
         !et_comp      is not supplied and
         !et_domrange  is not supplied and
         !ev_convexit  is not supplied and
         !ev_in_domr   is not supplied and
         !ev_fieldname is not supplied and
         !ev_typedescr is not supplied and
         !ev_outputlen is not supplied and
         ev_length     is not supplied and
         eo_handle     is not supplied and
         r_result      is not supplied.
          return.
        endif.


        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Zusatzinfos

        if ev_typedescr is supplied.

          ev_typedescr = get( dd04t = 'X' i_any = ev_type iv_langu = iv_langu ).

        endif.

        if ev_convexit is supplied or ev_outputlen is supplied or ev_length is supplied.

          ev_domname       = get_bus( dd04l_domname_by_rollname = 'X' i_any = ev_type ).
          ev_convexit      = get_bus( dd01l_convexit_by_domname = 'X' i_any = ev_domname ).
          ev_outputlen     = get_bus( dd04l_outputlen_by_rollname = 'X' i_any = ev_type ).
          ev_length        = get_bus( dd04l_leng_by_rollname = 'X' i_any = ev_type ). .

        endif.

        if i_fnam_tab is not initial and i_fnam_type is not initial.

          ev_fieldname = lcl_help=>rtts_get_fieldname_by_type_tab(
               iv_typename = i_fnam_type
               iv_tabname  = i_fnam_tab ).
        endif.


        if r_result is supplied.
          r_result-handle = eo_handle.

          "...
          "...
          "...
          "...

        endif.


        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        data: lx_root type ref to cx_root.
      catch cx_root into lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    endtry.

  endmethod.


  method service.

    "Lesen der Datenbank ueber verschiedene Services
    "Business Log, GOS Objekte, SO10 Texte, Vari Tab usw
    try.

        case crud.

          when cs-s_crud-read.

            case abap_true.

              when all.
                "Generisches Lesen von Daten aus DB

                data lv_data type string.

                service( exporting crud = crud vari = 'X' raise_error = 'X' i_key1 = i_key1 i_key2 = i_key2 i_key3 = i_key3
                         importing e_result = lv_data ).

                "Daten von flache Form in Zieltyp
                trans( exporting xml_2 = 'X'
                 unzip = 'X'
                  i_any = lv_data
                       importing e_result = e_result  ).

              when file.

                data lv_xstring type xstring.
                data lv_directory type string.
                lv_directory = i_any.
                lv_xstring = lcl_help=>service_file_read( lv_directory ).
                e_result = lv_xstring.

              when gos_head.
                "Generic Object Services - GOS
                "read head infos for a specific document

                data ls_link type obl_s_link.
                data ls_gos_head_result type sofolenti1 .

                ls_link-instid_b = i_key1. "FOL27000000000004EXT44000000000100
                ls_gos_head_result = lcl_help=>gos_read_object_head( ls_link  ).
                e_result = ls_gos_head_result.


              when gos_content.
                "Generic Object Services - GOS
                "read a specific document Content

                data lv_gos_result type xstring.

                ls_link-instid_b = i_key1. "FOL27000000000004EXT44000000000100
                lv_gos_result    = lcl_help=>gos_read_object_content( ls_link ).
                e_result         = lv_gos_result.


              when gos_list.
                "Generic Object Services - GOS
                "get list of all docuemts

                data lv_instid type  sibflporb-instid.
                data lv_typeid type sibflporb-typeid.
                data lv_catid type sibflporb-catid.
                data lt_gos_list_result type obl_t_link.

                lv_instid = i_key1. " '0010270682'
                lv_typeid = i_key2. " 'BUS2105'
                lv_catid  = i_key3. " 'BO'

                lt_gos_list_result =  lcl_help=>gos_read_object_list(
                                         iv_instid      = lv_instid
                                         iv_typeid      = lv_typeid
                                         iv_catid       = lv_catid  ).

                e_result = lt_gos_list_result.


              when vari.
                "VARI Tabelle für Selektionsvarianten
                "generische Ablage für unstrukturierte Daten

                data lv_key type c length 54.
                data lv_string type string.

                lv_string = get( trim = 'X' i_any = i_key1 ) &&
                            get( trim = 'X' i_any = i_key2 ) &&
                            get( trim = 'X' i_any = i_key3 ).
                lv_key(54) = lv_string.

                do( free_sy = 'X').
                import data = lv_data from database vari(z1) client sy-mandt id lv_key.
                x_raise_check( sy_subrc = 'X' i_head = 'ZCX_READ_DATABASE_VARI_ERROR' ).

                if check( convertible = 'X' i_any = e_result i_any2 = lv_data ) = abap_true.
                  e_result = lv_data.
                else.
                  x_raise('ZCX_WRONG_TYPE_OF_OUTPUT').
                endif.


              when so10.
                "SO10 Texte
                "read a specific text

                data lv_object type thead-tdobject.
                data lv_name   type thead-tdname.
                data lv_id     type thead-tdid.
                data lv_langu  type thead-tdspras.
                data lt_so10_result type string_table.

                lv_object = i_key1. " 'VBBK'
                lv_id     = i_key2. " '0002' Type
                lv_name   = i_key3. " '0030000000' Auftrag
                lv_langu  = i_key4. " 'E'

                lcl_help=>so10_read(
                exporting
                    i_key1   = lv_object
                    i_key2   = lv_id
                    i_key3   = lv_name
                    i_key4   = lv_langu
                importing
                  e_result = lt_so10_result ).

                e_result = lt_so10_result.

              when bal_list.

                data lt_list type balhdr_t.
                data lt_list_result type standard table of balhdr.

                lcl_help=>bal_read_list(
                  exporting
                     iv_object    = i_key1
                    iv_subobject = i_key2
                    iv_extnumber = i_key3
                  receiving
                    rt_list      = lt_list
                ).

                loop at lt_list into data(ls_list).
                  insert ls_list into table lt_list_result.
                endloop.

                e_result = lt_list_result.

              when bal.
                "Business Application Log - BAL
                "read a specific log

                lcl_help=>bal_read(
                  exporting
                    iv_object    = i_key1
                    iv_subobject = i_key2
                    iv_extnumber = i_key3
                    iv_lognumber = i_key4
                  receiving
                    rt_balmt     = data(lt_balmt) ).

                if 'BALM' = get(  rtti_type_line = 'X' i_any = e_result ).
                  field-symbols <lt_any> type any table.
                  assign e_result to <lt_any>.
                  loop at lt_balmt into data(ls_balm).
                    insert ls_balm into table <lt_any>.
                  endloop.
*            if 'BALM_T' = get(  rtti_type = 'X' i_any = e_result ).
*              e_result = lt_balmt.
                else.
                  msg( exporting i_any = lt_balmt
                       importing e_any = e_result ).
                  itab( exporting change_sequence = 'X'
                        changing  ct_tab          = e_result  ).
                endif.


              when others.
                x_raise('ZCX_WRONG_CALL_OF_METHOD').
            endcase.

          when cs-s_crud-update.

            case abap_true.

              when all.

                lv_data = get( xml = 'X' i_any = i_any   raise_error = 'X' ).
                lv_data = get( zip = 'X' i_any = lv_data raise_error = 'X').
                service( crud = crud vari = 'X' i_key1 = i_key1 i_key2 = i_key2 i_key3 = i_key3
                         commit = commit raise_error = abap_true i_any = lv_data ).

              when gos_content.

                lcl_help=>gos_create_object(
                  iv_data           = i_any
                  iv_instid         = i_key1 "i_gs_object-instid
                  iv_typeid         = i_key2 "gs_object-typeid
                  iv_catid          = i_key3 "gs_object-catid
                  iv_filename_w_ext = i_key4 "i_any2 "'example.pdf'
                  commit_work       = commit
                  ).


              when file.

*               data lv_xstring type xstring.
*               data lv_directory type string.
                lv_directory = i_any.
                lv_xstring = i_any2.
                lcl_help=>service_file_update( iv_direct = lv_directory i_data = lv_xstring ).

              when vari.

                data lv_key2 type c length 54.
                data lv_string2 type string.

                lv_string2 = get( trim = 'X' i_any = i_key1 ) &&
                             get( trim = 'X' i_any = i_key2 ) &&
                             get( trim = 'X' i_any = i_key3 ).
                lv_key2(54) = lv_string2.

                trans( exporting id = 'X' i_any = i_any raise_error = 'X'
                       importing e_result = lv_data ).

                do( free_sy = 'X').
                export data = lv_data to database vari(z1) client sy-mandt id lv_key2.
                x_raise_check( sy_subrc = 'X' ).


              when bal.

                data:
                  ls_log    type bal_s_log.

                ls_log-object    = i_key1.
                ls_log-subobject = i_key2.
                ls_log-extnumber = i_key3.

                lcl_help=>bal_save(  i_any = i_any i_any2 = i_any2 is_log = ls_log ).


              when bal.

                data: lv_key_bal_indx type c length 20.
                concatenate i_key1 i_key2 i_key3 i_key4 into lv_string.
                shift lv_string left deleting leading ' '.
                lv_key_bal_indx = lv_string.

                "Daten in flache Form umwandeln
                trans(
                   exporting
                      xml          = 'X'
                      zip                = 'X'
                      i_any              = i_any
                   importing
                      e_result           = lv_data ).


                do( free_sy = 'X').
                export data = lv_data to database bal_indx(z1) client sy-mandt id lv_key_bal_indx.
                x_raise_check( sy_subrc = 'X' ).


              when so10.

*            data lv_object type thead-tdobject.
*            data lv_name   type thead-tdname.
*            data lv_id     type thead-tdid.
*            data lv_langu  type thead-tdspras.
                data lt_so10_stringtab type string_table.
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

              when others.
                x_raise('CX_WONG_CALL_OF_METHOD').
            endcase.

            if commit = 'X'.
              do( commit_a_wait = 'X' ).
            endif.

          when cs-s_crud-delete.

            case abap_true.

              when all.
                "Generisches Lesen von Daten aus DB

                service(
                     crud        = crud
                     vari = 'X'
                     raise_error = 'X'
                     i_key1 = i_key1
                     i_key2 = i_key2
                     i_key3 = i_key3
                            ).


              when vari.
                "VARI Tabelle für Selektionsvarianten
                "generische Ablage für unstrukturierte Daten

*            data lv_key type c length 54.
*            data lv_string type string.

                lv_string = get( trim = 'X' i_any = i_key1 ) &&
                            get( trim = 'X' i_any = i_key2 ) &&
                            get( trim = 'X' i_any = i_key3 ).
                lv_key(54) = lv_string.

                do( free_sy = 'X').
                delete from database vari(z1) client sy-mandt id lv_key.
                if sy-subrc = 4.
                  x_raise( i_head = 'ZCX_DELETE_VARI_DATABASE_ERROR'
                        i_any = msg( i_any = 'ZCX_NO_ENTRY_WITH_KEY_&1_FOUND' i_v1 = lv_key )-s_bapi ).
                else.
                  x_raise_check( sy_subrc = 'X' i_head = 'ZCX_DELETE_VARI_DATABASE_ERROR' ).
                endif.

            endcase.


            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " DB Commit

            if commit = 'X'.
              do( commit_a_wait = 'X' ).
            endif.


          when others.
            x_raise('ZCX_WRONG_CALL_OF_METHOD').
        endcase.

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " error handling

        data: lx_root type ref to cx_root.
      catch cx_root into lx_root.
        lcl_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    endtry.

  endmethod.


  method trans.

    data:
      lt_where   type rsds_twhere,
      ls_where   type line of rsds_twhere,
      lt_params  type rsds_trange,
      lv_string  like line of ls_where-where_tab,
      lv_string2 type string.

    field-symbols: <ls_params>     like line of lt_params,
                   <lt_any>        type standard table,
                   <lt_any_result> type standard table,
                   <ls_any_result> type any,
                   <ls_any>        type any.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " diese Methode tranformiert Eingabe in Ausgabewerte
    " Zippen / Tabellen / Formate usw
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    try.

        case abap_true.

          when xml_2_itab.

            data lv_xml_input type string.

            lv_xml_input = i_any.

            data buffer      type xstring.
            data: lt_xml_tab type table of smum_xmltb.
            data: lt_return  type table of bapiret2.

            call function 'SCMS_STRING_TO_XSTRING'
              exporting
                text   = lv_xml_input
*               MIMETYPE       = ' '
*               ENCODING       = ENCODING
              importing
                buffer = buffer
              exceptions
                failed = 1
                others = 2.
            if sy-subrc <> 0. sy-subrc = sy-subrc. endif.
            x_raise_check( function = 'X' ).

            call function 'SMUM_XML_PARSE'
              exporting
                xml_input = buffer "iv_xml_string
              tables
                xml_table = lt_xml_tab
                return    = lt_return.
            x_raise_check( function = 'X' i_check1 = lt_return ).

            e_result = lt_xml_tab.


          when copy.

            data lr_data type ref to data.
            field-symbols: <lr_data> type standard table.
            create data lr_data like i_any.
            assign lr_data->* to <lr_data>.
            <lr_data> = i_any.


          when value_2_range.

            data lt_range type rsds_selopt_t.
            append initial line to lt_range assigning field-symbol(<ls_range>).
            <ls_range>-low = i_any.
            <ls_range>-sign = 'I'.
            <ls_range>-option = 'EQ'.
            e_result = lt_range.

          when id.

            "Schreibt Input unverÃ¤ndert in Output
            "verhindert aber dass bei inkompatibilitÃ¤t eine unbehandelbare Ausnahme ensteht
            if abap_true = check( convertible = 'X' i_any = i_any i_any2 = e_result ).
              e_result = i_any.
            else.
              x_raise( msg( i_any = 'ZCX_INPUT_&1_CONVERT_TO_&2_ERROR'
                            i_v1 =  get( rtti_kind = 'X' i_any = i_any )
                            i_v2 =  get( rtti_kind = 'X' i_any = e_result ) )-s_bapi
                     ).

            endif.

          when params_2_struct.

            lcl_help=>trans_params_2_struc(
              exporting
                it_params = i_any
              importing
                es_struc  = e_result ).


          when print.
            data lt_stringtab type string_table.
            lv_string2 = lcl_help=>write( i_any ).

            if get( rtti_kind = 'X' i_any = e_result ) = cl_abap_typedescr=>kind_table.

              split lv_string2 at cl_abap_char_utilities=>cr_lf into table lt_stringtab.
              e_result = lt_stringtab.

            else.
              e_result  = lv_string2.
            endif.

          when xml_2.

            if unzip = abap_true.
              trans( exporting unzip = 'X' i_any = i_any
                     importing e_result = i_any ).

            endif.

            shift i_any left deleting leading ' '.
            lv_string2 = i_any.

            call transformation id
             source xml lv_string2
             result test = e_result.

            return.

          when json.

            data(lo_json_writer_t) = cl_sxml_string_writer=>create( type = if_sxml=>co_xt_json ).

            call transformation id
                    source values = i_any
                    result xml lo_json_writer_t.

            cl_abap_conv_in_ce=>create( )->convert(
              exporting
                input = lo_json_writer_t->get_output( )
              importing
                data = e_result ).

            if zip = abap_true.
              trans( exporting zip = 'X' i_any = e_result
                     importing e_result = e_result ).
            endif.


          when json_2.

            if unzip = abap_true.
              trans( exporting unzip = 'X' i_any = i_any
                     importing e_result = i_any ).
            endif.

            call transformation id source xml i_any
                         result values = e_result.

          when tab_2_tab.
            if cl_abap_datadescr=>kind_table <> get( rtti_kind = 'X' i_any = i_any )
            or cl_abap_datadescr=>kind_table <> get( rtti_kind = 'X' i_any = e_result ).
              x_raise( 'ZCX_WRONG_INPUT_TYPE').
            endif.

            assign i_any   to <lt_any>.
            assign e_result to <lt_any_result>.

            clear <lt_any_result>.
            loop at <lt_any> assigning <ls_any>.
              append initial line to <lt_any_result> assigning <ls_any_result>.
              conv( exporting i_any = <ls_any> importing r_result =  <ls_any_result> ).
            endloop.

          when string_2_stringtab.

            if split_word = abap_true.


              data:
                lv_line   type c length 1000,
                lv_length type i.
*                lt_stringtab TYPE stringtab.

              lv_line = i_any.
              lv_length = i_any2.
              ##FM_SUBRC_OK
              call function 'RKD_WORD_WRAP'
                exporting
                  textline            = lv_line   " Source text line
                  outputlen           = lv_length   " Maximum output line width
                tables
                  out_lines           = lt_stringtab  " All output lines as table
                exceptions
                  outputlen_too_large = 1
                  error_message       = 2
                  others              = 3.
              x_raise_check( function = 'X' ).

              e_result = lt_stringtab.

              return.
            else.
              data lv_text type string.
              lv_length = i_any2.
              lv_text = i_any.
              do.
                append initial line to lt_stringtab assigning field-symbol(<lv_string>).
                try.
                    <lv_string> = lv_text(lv_length).
                  catch cx_root.
                    exit.
                endtry.
              enddo.


            endif.


            assign i_any   to <lt_any>.
            assign e_result to <lt_any_result>.

            loop at <lt_any> assigning <ls_any>.
              append initial line to <lt_any_result> assigning <ls_any_result>.
              <ls_any_result> = <ls_any>.
            endloop.


          when  xml.
*            DATA lv_string2 TYPE string.
            clear lv_string2.

            call transformation id
               options data_refs = 'heap-or-create'
               source test =  i_any
               result xml lv_string2.

            e_result = lv_string2.

            if zip = abap_true.
              trans( exporting zip = 'X' i_any = e_result
                     importing e_result = e_result ).

            endif.

            return.

          when zip.

            data:
*              lv_string2 TYPE string,#
              lv_xstring type xstring.

            if check( convertible = 'X' i_any = lv_string2 i_any2 = i_any ) = abap_true.
              lv_string2 = i_any.
            else.
              x_raise('WRONG_INPUT_TYPE').
            endif.

            cl_abap_gzip=>compress_text(
            exporting text_in  = lv_string2
            importing gzip_out = lv_xstring ).

            e_result = lv_xstring.
            return.

          when unzip.

            lv_xstring = i_any.

            cl_abap_gzip=>decompress_text(
               exporting gzip_in  = lv_xstring   " Eingabe der gezippten Daten
               importing text_out = lv_string2 ). " Dekomprimierte Ausgabe

            e_result = lv_string2.
            return.

          when rangetab_2_where.

            append initial line to lt_params assigning <ls_params>.

            <ls_params>-tablename = 'SPFLI'.
            <ls_params>-frange_t = i_any.

            call function 'FREE_SELECTIONS_RANGE_2_WHERE'
              exporting
                field_ranges  = lt_params   " Selections in the form RSDS_TRANGE
              importing
                where_clauses = lt_where.   " Selections in the form RSDS_TWHERE

            read table lt_where index 1
                into ls_where.

            loop at ls_where-where_tab into lv_string.

              concatenate
                  e_result
                  lv_string
                  into e_result.

            endloop.


*          WHEN any_2_chartab.
*
*            ASSIGN i_any   TO <lt_any>.
*            ASSIGN e_result TO <lt_any_result>.
*
*            LOOP AT <lt_any> ASSIGNING <ls_any>.
*              APPEND INITIAL LINE TO <lt_any_result> ASSIGNING <ls_any_result>.
*              <ls_any_result> = <ls_any>.
*            ENDLOOP.

          when others. "Selbst transformation finden

            rtti( exporting i_any   = i_any
                  importing ev_kind = data(lv_kind_in) ).

            rtti( exporting i_any    = e_result
                  importing ev_kind = data(lv_kind_out) ).

            if lv_kind_in = lv_kind_out and lv_kind_in = cl_abap_typedescr=>kind_table.
              trans( exporting tab_2_tab = 'X' i_any = i_any
                     importing e_result = e_result ).
              return.
            endif.


            if abap_true = check( convertible = 'X' i_any = lt_range i_any2 = e_result )
                and abap_true = check( rtti_type_kind_cseq = 'X' i_any = i_any ).

              trans( exporting value_2_range = 'X' i_any = i_any
                     importing e_result = e_result ).

              return.
            endif.

*            data(lv_type_in)

            if 'SOLIX_TAB' = get( rtti_type = 'X' i_any = i_any )
               and 'XSTRING' = get( rtti_type = 'X' i_any = e_result ).

              e_result = lcl_help=>convert_binary_2_xstring( i_any ).

              return.
            endif.

            if 'XSTRING' = get( rtti_type = 'X' i_any = i_any )
             and 'SOLIX_TAB' = get( rtti_type = 'X' i_any = e_result ).

              e_result =  lcl_help=>convert_xstring_2_binary( iv_input = i_any ).
              return.
            endif.

        endcase.


        data lx_root type ref to cx_root.
      catch cx_root into lx_root.
        lcl_help=>handle_error( ix_root = lx_root raise_error = raise_error ).
    endtry.

  endmethod.


  method x_info.

    data:
      lx_no    type ref to lcx_no_check,
      lr_data  type ref to data,
      lv_value type string,
      lv_descr type string.
    data: lx_root type ref to cx_root.
    field-symbols:
    <lv_value> type any.

    "Infos aus Exception auslesen
    "Bsp Nachricht, Logs, Callstack usw
    try.
        lx_no ?= ix_root.

        r_result = lx_no->ms_data.

        et_add_t100 = lx_no->ms_data-add_t100.
        ev_guid     = lx_no->ms_data-guid.
        et_source   = lx_no->ms_data-t_source_code.
        ev_code     = lx_no->ms_data-code.
        es_bapiret  = lx_no->ms_data-s_bapiret.
        et_callstack = lx_no->ms_data-t_callstack.
        e_add_serial = lx_no->ms_data-add_serial.
        ev_val_print = ' '.
        es_data = lx_no->ms_data.

        if lx_no->ms_data-serial_value is not initial.

          json(
            exporting
              json_2      = abap_true
              i_any      = lx_no->ms_data-serial_value
            importing
              e_ref1      = lr_data
          ).

          if lr_data is bound.

            assign lr_data->* to <lv_value>.
            trans( exporting print = 'X' i_any = <lv_value> importing e_result = lv_value ).
            rtti( exporting i_any = <lv_value> importing ev_typedescr = lv_descr ).
            concatenate ev_val_print  lv_descr ' = '  lv_value '  |  ' into ev_val_print respecting blanks.

          endif.

          clear lr_data.
          json(
            exporting
              json_2      = abap_true
              i_any      = lx_no->ms_data-serial_value
            importing
              e_ref2      = lr_data
          ).

          if lr_data is bound.

            assign lr_data->* to <lv_value>.
            trans( exporting print = 'X' i_any = <lv_value> importing e_result = lv_value ).
            rtti( exporting i_any = <lv_value> importing ev_typedescr = lv_descr ).
            concatenate ev_val_print  lv_descr ' = '  lv_value '  |  ' into ev_val_print respecting blanks.

          endif.

          clear lr_data.
          json(
            exporting
              json_2      = abap_true
              i_any      = lx_no->ms_data-serial_value
            importing
              e_ref3      = lr_data
          ).

          if lr_data is bound.

            assign lr_data->* to <lv_value>.
            trans( exporting print = 'X' i_any = <lv_value> importing e_result = lv_value ).
            rtti( exporting i_any = <lv_value> importing ev_typedescr = lv_descr ).
            concatenate ev_val_print  lv_descr ' = '  lv_value '  |  ' into ev_val_print respecting blanks.

          endif.

          clear lr_data.
          json(
            exporting
              json_2      = abap_true
              i_any      = lx_no->ms_data-serial_value
            importing
              e_ref4      = lr_data
          ).

          if lr_data is bound.

            assign lr_data->* to <lv_value>.
            trans( exporting print = 'X' i_any = <lv_value> importing e_result = lv_value ).
            rtti( exporting i_any = <lv_value> importing ev_typedescr = lv_descr ).
            concatenate ev_val_print  lv_descr ' = '  lv_value '  |  ' into ev_val_print respecting blanks.

          endif.


          shift ev_val_print right deleting trailing ' '.
          shift ev_val_print right deleting trailing '|'.
          shift ev_val_print left deleting leading ' '.

        endif.


*    if es_data is supplied.

*    endif.


*        RETURN.

      catch cx_root into lx_root.
*        lcl_local_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    endtry.



    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " OData Exception

    data lx_odata type ref to /iwbep/cx_mgw_base_exception.

    try.

        lx_odata ?= ix_root.

        msg( exporting i_any  = lx_odata->message_container
              importing e_any = et_add_t100 ) .


      catch cx_root into lx_root.
*        lcl_local_help=>handle_error(  ix_root = lx_root raise_error = raise_error ).
    endtry.

  endmethod.


  method x_raise.

    " Erzeugen einer Exception
    " Wenn e_result nicht gefuellt -> Methode wirft Exception
    " Diverse Inputparameter werden in Exception abgelegt

    data(ls_sy) = sy.

    data lx_prev    type ref to cx_root.
    if i_prev is not initial.
      lx_prev = x_raise( i_any =  i_prev iv_depth = iv_depth + 1 ).
    endif.

    data lx_result  type ref to lcx_no_check.
    try.
        lx_result ?= i_any.

      catch cx_root.

        "Spezialfall: Bei Exception -> seinen Vorgaenger nehmen
        if lx_prev is initial.
          try.
              lx_prev ?= i_any.
              lx_prev = lx_prev->previous.
            catch cx_root.
          endtry.
        endif.

        "ganz neu
        create object lx_result.

        if i_any is initial.
          lx_result->ms_data-s_bapiret = msg( '530(SY)')-s_bapi. "Es ist eine Ausnahme aufgetreten
        else.
          lx_result->ms_data-s_bapiret = msg( i_any )-s_bapi.
        endif.

        lx_result->ms_data-s_bapiret-type = 'E'.

        lx_result->ms_data-noid = msg(
           exporting
             i_any   = lx_result->ms_data-s_bapiret
           importing
             e_any   = lx_result->if_t100_message~t100key
*            ev_noid = lx_result->ms_data-noid
         )-noid.

        lx_result->text         = lx_result->ms_data-s_bapiret-message.
        lx_result->ms_data-s_sy = ls_sy.
        lx_result->ms_data-code = i_code.
        lx_result->ms_data-guid = get( guid16 = 'X' ).
*        IF lx_result->ms_data-s_bapiret-message(3) = 'ZCX' OR i_any(2) = 'CX'.
*          lx_result->ms_data-code = lx_result->ms_data-s_bapiret-message.
*        ENDIF.

        info(
        exporting
          iv_depth = iv_depth + 1
        importing
          ev_timestampl      = lx_result->ms_data-timestampl
          es_callstack       = lx_result->ms_data-s_callstack
          et_callstack       = lx_result->ms_data-t_callstack
          et_source_code     = lx_result->ms_data-t_source_code
      ).

        "Source Code verkleinern
        data ls_dummy   like line of lx_result->ms_data-t_source_code.
        data lv_counter type i.
        loop at lx_result->ms_data-t_source_code into ls_dummy.
          add 1 to lv_counter.
          if lv_counter > lx_result->ms_data-s_callstack-line + 5.
            delete lx_result->ms_data-t_source_code.
          endif.
        endloop.
        if lx_result->ms_data-s_callstack-line - 35 > 0.
          do lx_result->ms_data-s_callstack-line - 35 times.
            delete lx_result->ms_data-t_source_code index 1.
          enddo.
        endif.

    endtry.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Previous

    if lx_prev is not initial.
      lcl_help=>cx_set(
          ix_no_check = lx_result
          ix_prev     = lx_prev
      ).
    endif.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "weitere Infos
    data lx_help type ref to cx_root.
    data lt_text_add type bapiret2_tab.
*    data lx_help_local type ref to
    lx_help = lx_result.
    while lx_help is bound.
      clear lt_text_add.
      insert lx_help->get_text(  ) into table lx_result->texttab.
      lt_text_add = x_info( lx_help )-add_t100.
      if lt_text_add is not initial.
        loop at lt_text_add into data(ls_bapi).
          insert conv #( ls_bapi-message ) into table lx_result->texttab.
        endloop.
      endif.
      lx_help = lx_help->previous.
    endwhile.
    msg( exporting i_any = lx_result importing e_any = lx_result->texttab ).

    if i_add_t100 is not initial.

*      msg( exporting i_any      = i_add_t100
*            importing e_any_add = lx_result->ms_data-add_t100 ).
      insert lines of  msg(  i_add_t100 )-t_bapi
      into table lx_result->ms_data-add_t100.

    endif.
    if i_add_write is not initial.
      trans( exporting print = 'X' i_any = i_add_write
             importing e_result = lx_result->ms_data-add_write   ).
    endif.
    if i_ser_data is not initial.
      lx_result->ms_data-add_serial = i_ser_data.
    endif.
    if i_ser_value is not initial.
      lx_result->ms_data-serial_value = i_ser_value.
    endif.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Head

    if i_head is not initial.
      lx_result ?= x_raise( i_any = i_head i_prev = lx_result iv_depth = iv_depth + 1 ).
    endif.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " raisen

    if r_result is supplied.
      r_result = lx_result.
    elseif resumable = abap_true.
      raise resumable exception lx_result.
    else.
      raise exception lx_result.
    endif.

  endmethod.


  method x_raise_check.

    data:
      lx_no_check  type ref to lcx_no_check,
      ls_sy        type sy,
      lv_tabname   type string,
      lv_readtable type string,
      lx_prev      type ref to lcx_no_check,
      ls_bapi      type bapiret2,
      lv_is_error  type abap_bool,
      lt_add_t100  type bapiret2_tab.
    data: lv_v1 type string, lv_v2 type string, lv_v3 type string.


    " Testen ob ein Fehlerfall (je nach Situation) vorliegt
    " Bsp nach Select, Read Table, Call function usw
    " Bei Erkennung eines Fehler wird eine Exception vom Typ no_check geraist
    " Wenn e_result nicht gefuellt -> Methode wirft Exception

    ls_sy = sy.
    if is_sy is supplied.
      ls_sy = is_sy.
    endif.
    lx_no_check ?= x_raise( iv_depth = 1 ).  "Dummy Exception fuer Codingstelle etc erzeugen


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " PrÃ¼fung und Nachricht erzeugen

    case abap_true.

      when sy_msgty.

        if ls_sy-msgty <> 'E'.
          return.
        endif.

        data lv_method type string.
        data lv_repid type string.

        info(
          exporting
            iv_depth     = 1
          importing
             ev_method   = lv_method
             ev_repid    = lv_repid  ).

        "DE CACSCOR 061 SYST: Fehler in Routine &1 &2 &3 &4
        ls_bapi = msg( i_any = '061(CACSCOR)' i_v1 = lv_repid && '(' && lv_method && ')'
                            i_v2 = ' | ' i_v3 = 'sy-msgty' i_v4 = `= E` )-s_bapi. "iv_v4 = ls_sy-subrc ).

        if ls_sy-msgid is not initial and ls_sy-msgno is not initial.
          lx_prev ?= x_raise( i_any = ls_sy iv_depth = 1 i_prev = i_prev ).
        else.
          if i_prev is not initial.
            lx_prev ?= x_raise( i_any = i_prev iv_depth = 1 ).
          endif.
        endif.

      when select.

        if ls_sy-subrc = 0.
          return.
        endif.

        lv_tabname = lcl_help=>source_code_get_selectname(
             it_source = lx_no_check->ms_data-t_source_code ).

        "Select auf Tabelle xy fehlgeschlagen CCSEQ' iv_no = 061
        ls_bapi =  msg(
              i_id         = 'CCSEQ'
              i_no         = '061'
              i_v1         = lv_tabname )-s_bapi.

        if i_prev is not initial.
          lx_prev ?= x_raise( i_any = i_prev iv_depth = 1 ).
        endif.

      when function.

        "Fehlerkontrolle nach Aufruf Funktionsbaustein
        "Sy Werte korrekt? Nachrichten nicht fehlerhaft? Sonstige Flags?

        data lt_t100_tmp type bapiret2_tab.

        insert lines of  msg( i_any = i_check1 )-t_bapi into table lt_t100_tmp.
        insert lines of  msg( i_any = i_check2 )-t_bapi into table lt_t100_tmp.
        insert lines of  msg( i_any = i_check3 )-t_bapi into table lt_t100_tmp.
*        lt_t100_tmp = msg( i_any = i_check2 )-t_bapi.
*        lt_t100_tmp = msg( i_any = i_check3 )-t_bapi.

        "Ist irgendwo ein Fehler uebergeben worden?
        if  abap_false = check( t100_error = 'X' i_any = lt_t100_tmp  ).

          do.
            if ls_sy-subrc <> 0.
              lt_t100_tmp = msg( i_any = is_sy i_type = 'E'  )-t_bapi.
              if lt_t100_tmp is initial.
                lt_t100_tmp = msg( i_any = 'ZCX_SY_SUBRC_NOT_EQUALS_NULL' i_type = 'E' )-t_bapi.
              endif.
              exit.
            endif.

            if i_flag = abap_true.
              lt_t100_tmp = msg( i_any = 'ZCX_ERROR_FLAG_IS_SET' i_type = 'E' )-t_bapi.
              exit.
            endif.
            if iv_subrc <> 0.
              lt_t100_tmp = msg( i_any = 'ZCX_SUBRC_IS_NOT_NULL' i_type = 'E' )-t_bapi.
              exit.
            endif.

            if sy_msgty = abap_true.
              if abap_true = check( t100_error = 'X' i_any = ls_sy ).
                lt_t100_tmp = msg( i_any = ls_sy i_type = 'E')-t_bapi.
                exit.
              endif.
            endif.

            exit.
          enddo.

        endif.

        "Wenn keine Fehlersituation -> Abbruch
        if abap_false = check( t100_error = 'X' i_any =  lt_t100_tmp  ).
          return.
        endif.

        "Nachrichten aufbereiten
        delete adjacent duplicates from lt_t100_tmp comparing message.
        lt_add_t100 = lt_t100_tmp.


        if i_prev is not initial.
          lx_prev ?= x_raise( i_any = i_prev iv_depth = 1 ).
        endif.

        info(
          exporting
            iv_depth           = 1
          importing
            et_source_code     = data(lt_source_code)
            es_callstack       = data(ls_callstack)
        ).


        while lines( lt_source_code ) > ls_callstack-line.
          delete lt_source_code index lines( lt_source_code ).
        endwhile.

        lcl_help=>source_code_get_fubaname( exporting
                      it_source = lt_source_code
                        importing
                        e_v1 = lv_v1
                        e_v2 = lv_v2
                        e_v3 = lv_v3 ).

        "DE 56  704 Fehler beim Aufruf des Funktionsbausteines &
        ls_bapi = msg(
              i_id           = '56'
              i_no           = '704'
              i_v1           = lv_v1
              i_v2           = lv_v2
              i_v3           = lv_v3 )-s_bapi.



      when read_table.

        if ls_sy-subrc = 0.
          return.
        endif.

        lv_readtable = lcl_help=>source_code_get_readtable(
               it_source = lx_no_check->ms_data-t_source_code ).

        ""DE  DS  353 Fehler beim Zugriff auf die interne Tabelle & (&)
        ls_bapi = msg( i_id  = 'DS' i_no = '353' i_v1 = lv_readtable )-s_bapi.

        if i_prev is not initial.
          lx_prev ?= x_raise( i_any = i_prev iv_depth = 1 ).
        endif.


      when not_initial.

        if i_check1 is not initial.
          return.
        endif.


        "DE EI  251 Der Wert ist initial
        ls_bapi = msg( 'ZCX_INPUT_INITIAL' )-s_bapi.
        "iv_v4 = ls_sy-subrc ).

*        DATA lv_descr TYPE string.

*        rtti( EXPORTING i_any = i_check1 iv_langu = iv_langu
*              IMPORTING ev_typedescr = lv_descr ).

*        IF lv_descr IS INITIAL.
*          ls_bapi = get_msg( i_any = 'ZCX_VALUE_IS_INITIAL_ERROR' iv_v1 = lv_descr ).
*        ELSE.
*          ls_bapi = get_msg( i_any = 'ZCX_VALUE_&1_INITIAL_ERROR' iv_v1 = lv_descr ).
*        ENDIF.

        if i_prev is not initial.
          lx_prev ?= x_raise( i_any = i_prev iv_depth = 1 ).
        endif.


      when for_all_entries.

        "Schauen ob Tabelle gefÃ¼llt ist
        if i_check1 is not initial.
          return.
        endif.

        lv_readtable = lcl_help=>source_code_get_not_initial( ).
        lx_prev ?= x_raise(  i_any = 'ZCX_WRONG_SELECT_WITH_FOR_ALL_ENTRIES' i_prev = i_prev ).

        "Select auf Tabelle xy fehlgeschlagen CCSEQ' iv_no = 061
        ls_bapi =  msg( i_id = 'CCSEQ' i_no = '061' i_v1 = lv_readtable )-s_bapi.


      when method.

        if ls_sy-subrc = 0.
          return.
        endif.

        ls_bapi = msg('ZCX_CALL_METHOD_ERROR')-s_bapi.
        if i_prev is not initial.
          lx_prev ?= x_raise( i_any = i_prev iv_depth = 1 ).
        endif.


      when sy_subrc.

        if ls_sy-subrc = 0.
          return.
        endif.

        info(
          exporting
            iv_depth     = 1
          importing
             ev_method   = lv_method
             ev_repid    = lv_repid  ).

        data(lv_name) = cl_oo_classname_service=>get_clsname_by_include( incname = conv #( lv_repid )  ).

        "DE CACSCOR 061 SYST: Fehler in Routine &1 &2 &3 &4
        ls_bapi = msg( i_any = '061(CACSCOR)' i_v1 = lv_name && '(' && lv_method && ')'
                            i_v2 = ' | ' i_v3 = 'sy-subrc' i_v4 = `<> 0` )-s_bapi. "iv_v4 = ls_sy-subrc ).

        if ls_sy-msgid is not initial and ls_sy-msgno is not initial.
          lx_prev ?= x_raise( i_any = ls_sy iv_depth = 1 i_prev = i_prev ).
        else.
          if i_prev is not initial.
            lx_prev ?= x_raise( i_any = i_prev iv_depth = 1 ).
          endif.
        endif.


      when others.

        if i_check1 is not initial.
          lt_add_t100  =  msg( i_check1  )-t_bapi.
        endif.

        if i_check2 is not initial.
          lt_add_t100  =  msg( i_check2 )-t_bapi.
        endif.

        if i_check3 is not initial.
          lt_add_t100  =  msg( i_check3 )-t_bapi.
        endif.

        if is_sy is supplied.
          lt_add_t100  =  msg( is_sy )-t_bapi.
          if is_sy-subrc <> 0.
            lv_is_error = abap_true.
          endif.
        endif.

        if lv_is_error = abap_false.
          lv_is_error = check( t100_error = 'X' i_any = lt_add_t100  ).
        endif.

        if lv_is_error = abap_false.
          return.
        endif.

        if lines( lt_add_t100  ) >= 1.
          ls_bapi = msg( lt_add_t100[ 1 ] )-s_bapi.
          delete lt_add_t100 index 1.
        else.
          "ein unerwarteter Fehler ist aufgetreten
          ls_bapi = msg(  i_id = '>3' i_no = '279' )-s_bapi.
        endif.
        if i_prev is not initial.
          lx_prev ?= x_raise( i_any = i_prev iv_depth = 1 ).
        endif.


    endcase.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Exception erzeugen

    data lv_ser_value type string.
    if i_val1 is supplied.
      lv_ser_value = get(  json_deep = 'X' i_any = i_val1 i_any2 = i_val2 i_any3 = i_val3 i_any4 = i_val4 ).
    else.
      lv_ser_value = i_ser_value.
    endif.

    lx_no_check ?=  x_raise(
         i_any         = ls_bapi
         i_head        = i_head
         i_prev        = i_prev
         iv_depth      = 1
         i_code        = i_code
         i_add_t100    = lt_add_t100
         i_ser_value   = lv_ser_value
         i_ser_data    = i_ser_data
         i_add_write   = i_add_write  ).

    if r_result is supplied.
      r_result = lx_no_check.
    elseif resumable = abap_true.
      raise resumable exception lx_no_check.
    else.
      raise exception lx_no_check.
    endif.

  endmethod.
endclass.
