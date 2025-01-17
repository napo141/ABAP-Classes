CLASS zcl_customer_manager_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:

      add_customer IMPORTING id TYPE z_customer_id_2
                            name TYPE z_customer_name_2
                            activo TYPE z_customer_activo_2
                   EXPORTING check_code TYPE i,


      update_customer IMPORTING id TYPE z_customer_id_2
                               name TYPE z_customer_name_2
                               activo TYPE z_customer_activo_2
                      EXPORTING check_code TYPE i,

      delete_customer IMPORTING id TYPE z_customer_id_2
                      EXPORTING check_code TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_customer_manager_2 IMPLEMENTATION.

METHOD add_customer.
  DATA: ls_customer TYPE zstruct_customer_2.

  ls_customer-customer_id = id.
  ls_customer-customer_name = name.
  ls_customer-customer_activo = activo.

  INSERT INTO ztcustomer_2 VALUES @ls_customer.

  check_code = sy-subrc.
ENDMETHOD.

METHOD update_customer.
  DATA: ls_customer TYPE zstruct_customer_2.

  SELECT SINGLE * FROM ztcustomer_2 WHERE customer_id = @id INTO @ls_customer.

  IF sy-subrc = 0.
    ls_customer-customer_name = name.
    ls_customer-customer_activo = activo.

    UPDATE ztcustomer_2 FROM @ls_customer.
  ENDIF.

  check_code = sy-subrc.
ENDMETHOD.

METHOD delete_customer.
  DELETE FROM ztcustomer_2 WHERE customer_id = @id.

  check_code = sy-subrc.
ENDMETHOD.

ENDCLASS.
