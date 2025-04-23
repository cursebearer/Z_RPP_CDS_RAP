CLASS zcl_rpp_func_abap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rpp_func_abap IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA: lt_data_in TYPE STANDARD TABLE OF zi_rpp_view_entity_agency.

    lt_data_in = CORRESPONDING #( it_original_data ).

    LOOP AT lt_data_in ASSIGNING FIELD-SYMBOL(<fs_data>).

      <fs_data>-AbapName = 'Rafael Pavesi'.

      ENDLOOP.

      ct_calculated_data = CORRESPONDING #( lt_data_in ).

    ENDMETHOD.


    METHOD if_sadl_exit_calc_element_read~get_calculation_info.
    ENDMETHOD.
ENDCLASS.
