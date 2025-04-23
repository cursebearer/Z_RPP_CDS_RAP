CLASS zcl_rpp_agency DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rpp_agency IMPLEMENTATION.

  METHOD if_rap_query_provider~select.

    "Filtros
    DATA(lv_filter) = io_request->get_filter(  )->get_as_sql_string(  ).

    "Paginacao
    DATA(lo_paging) = io_request->get_paging(  ).

    IF lo_paging IS BOUND.

      DATA(lv_offset) = lo_paging->get_offset(  ).
      DATA(lv_top) = lo_paging->get_page_size(  ).

      IF lv_top < 0.
        lv_top = 20.
      ENDIF.

    ENDIF.

    "Seleciona os dados

    SELECT FROM /dmo/agency
      FIELDS agency_id,
             name,
             street
    WHERE (lv_filter)
    ORDER BY agency_id
    INTO TABLE @DATA(lt_data)
    OFFSET @lv_offset UP TO @lv_top ROWS.


    "Seta os dados
    IF sy-subrc = 0.

      io_response->set_data( lt_data ).

      IF io_request->is_total_numb_of_rec_requested(  ).

        "Total de registros
        io_response->set_total_number_of_records( lines( lt_data ) ).

      ENDIF.

    ENDIF.

  ENDMETHOD.

ENDCLASS.
