CLASS zcl_main_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_main_2 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lo_customer_manager TYPE REF TO zcl_customer_manager_2,
          lv_check_code       TYPE i,
          lt_customers        TYPE TABLE OF ztcustomer_2,
          ls_customer         TYPE ztcustomer_2,
          lv_output           TYPE string.

    CREATE OBJECT lo_customer_manager.

    lv_output = 'Insertando registros en la tabla...'.
    out->write( lv_output ).

    lo_customer_manager->add_customer( EXPORTING id = 'CUST001'
                                                 name = 'Cliente Uno'
                                                 activo = 'X'
                                       IMPORTING check_code = lv_check_code ).
    IF lv_check_code = 0.
      lv_output = 'Registro CUST001 insertado correctamente.'.
    ELSE.
      lv_output = 'Error al insertar CUST001.'.
    ENDIF.
    out->write( lv_output ).

    lo_customer_manager->add_customer( EXPORTING id = 'CUST002'
                                                 name = 'Cliente Dos'
                                                 activo = ' '
                                       IMPORTING check_code = lv_check_code ).
    IF lv_check_code = 0.
      lv_output = 'Registro CUST002 insertado correctamente.'.
    ELSE.
      lv_output = 'Error al insertar CUST002.'.
    ENDIF.
    out->write( lv_output ).

    lo_customer_manager->add_customer( EXPORTING id = 'CUST003'
                                                 name = 'Cliente Tres'
                                                 activo = 'X'
                                       IMPORTING check_code = lv_check_code ).
    IF lv_check_code = 0.
      lv_output = 'Registro CUST003 insertado correctamente.'.
    ELSE.
      lv_output = 'Error al insertar CUST003.'.
    ENDIF.
    out->write( lv_output ).

    lo_customer_manager->add_customer( EXPORTING id = 'CUST004'
                                                 name = 'Cliente Cuatro'
                                                 activo = ' '
                                       IMPORTING check_code = lv_check_code ).
    IF lv_check_code = 0.
      lv_output = 'Registro CUST004 insertado correctamente.'.
    ELSE.
      lv_output = 'Error al insertar CUST004.'.
    ENDIF.
    out->write( lv_output ).

    lv_output = 'Actualizando registros en la tabla...'.
    out->write( lv_output ).

    lo_customer_manager->update_customer( EXPORTING id = 'CUST002'
                                                    name = 'Cliente Dos Actualizado'
                                                    activo = 'X'
                                          IMPORTING check_code = lv_check_code ).
    IF lv_check_code = 0.
      lv_output = 'Registro CUST002 actualizado correctamente.'.
    ELSE.
      lv_output = 'Error al actualizar CUST002.'.
    ENDIF.
    out->write( lv_output ).

    lo_customer_manager->update_customer( EXPORTING id = 'CUST003'
                                                    name = 'Cliente Tres Actualizado'
                                                    activo = ' '
                                          IMPORTING check_code = lv_check_code ).
    IF lv_check_code = 0.
      lv_output = 'Registro CUST003 actualizado correctamente.'.
    ELSE.
      lv_output = 'Error al actualizar CUST003.'.
    ENDIF.
    out->write( lv_output ).

    lv_output = 'Eliminando registros de la tabla...'.
    out->write( lv_output ).

    lo_customer_manager->delete_customer( EXPORTING id = 'CUST004'
                                          IMPORTING check_code = lv_check_code ).
    IF lv_check_code = 0.
      lv_output = 'Registro CUST004 eliminado correctamente.'.
    ELSE.
      lv_output = 'Error al eliminar CUST004.'.
    ENDIF.
    out->write( lv_output ).

    lv_output = 'Consultando registros en la tabla...'.
    out->write( lv_output ).

    SELECT * FROM ztcustomer_2 INTO TABLE @lt_customers.

    LOOP AT lt_customers INTO ls_customer.
      lv_output = |ID: { ls_customer-customer_id }, Nombre: { ls_customer-customer_name }, Activo: { ls_customer-customer_activo }|.
      out->write( lv_output ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
