<?php

switch($accion)
{
    /**
     * DataTable
     */
    case 'datatable':
        $table = 'periodos_contables';
        $primaryKey = 'idPeriodoContable';
        $where = "es_fijo = '1'";
        
        $columns = array(
            [ 'db' => 'idPeriodoContable', 'dt' => 'id' ],
            [ 'db' => 'nombre', 'dt' => 'nombre' ],
        );
        
        // SQL server connection information
        $sql_details = ARRAY_BASE_DATOS;

        $response = SSP::complex( $_GET, $sql_details, $table, $primaryKey, $columns, $where );
        echo json_encode($response);
    break;

    /**
     * Periodos contables para registrar
     */
    case 'periodos':
        sendJson([
            'periodos' => PeriodosContablesModel::Buscar(['es_fijo' => '0']),
        ]);
    break;

    /**
     * Registrar
     */
    case 'registrar':
        $periodo_id = Input::post('periodo_id', TRUE);
        $objPeriodo = new PeriodoContableModel( $periodo_id );

        Conexion::db()->startTransaction();
        $objPeriodo->Modificar([ 'es_fijo' => '1' ]);
        Conexion::db()->commit();

        sendJson([ 'ok' => TRUE ]);
    break;

    /**
     * Eliminar
     */
    case 'eliminar':
        $periodo_id = Input::post('periodo_id', TRUE);
        $objPeriodo = new PeriodoContableModel( $periodo_id );

        Conexion::db()->startTransaction();
        $objPeriodo->Modificar([ 'es_fijo' => '0' ]);
        Conexion::db()->commit();

        sendJson([ 'ok' => TRUE ]);
    break;
    
    /**
     * Defecto
     */
    default: throw new Exception('Acción invalida.');
}