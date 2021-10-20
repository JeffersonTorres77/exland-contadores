<?php

class controlador
{
    /**
     * Index
     */
    public function index() {
        $json_periodos_fijos = json_encode(PeriodosContablesModel::Buscar(['es_fijo' => '1']));
        $json_periodos_fijos = str_replace('\\', '\\\\', $json_periodos_fijos);

        Incluir::template('templates/index.html', [
            'empresas' => EmpresasModel::Buscar(),
            'periodos' => PeriodosContablesModel::Buscar(),
            'json_periodos_fijos' => $json_periodos_fijos,
        ], [
            'js' => ["public/index.js"]
        ]);
    }

    /**
     * CRUD Cobros adicionales
     */
    public function crud_cobros_adicionales($parametros = []) {
        setHandlerJson();
        if(!isset($parametros[0])) throw new Exception('No se ha enviado la acción.');
        $accion = strtolower($parametros[0]);
        require_once(__DIR__."/utils/crud-cobros.php");
    }
    
    /**
     * Periodos fijos
     */
    public function periodos_fijos() {
        Incluir::template('templates/periodos_fijos.html', [], [
            'js' => ["public/periodos_fijos.js"]
        ]);
    }

    /**
     * CRUD Periodos fijos
     */
    public function crud_periodos_fijos($parametros = []) {
        setHandlerJson();
        if(!isset($parametros[0])) throw new Exception('No se ha enviado la acción.');
        $accion = strtolower($parametros[0]);
        require_once(__DIR__."/utils/crud-periodos.php");
    }
}