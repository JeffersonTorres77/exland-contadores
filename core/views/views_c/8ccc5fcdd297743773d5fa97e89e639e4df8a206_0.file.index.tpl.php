<?php
/* Smarty version 3.1.36, created on 2020-10-27 23:09:50
  from 'C:\xampp\htdocs\contaduria\app\dashboard\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_5f989aaebfb449_91557865',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8ccc5fcdd297743773d5fa97e89e639e4df8a206' => 
    array (
      0 => 'C:\\xampp\\htdocs\\contaduria\\app\\dashboard\\templates\\index.tpl',
      1 => 1603836590,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5f989aaebfb449_91557865 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="m-2 p-2">
    <div class="row">
        <div class="col-12 col-sm-6 col-md-4">
            <div class="card mb-3 bg-warning text-black">
                <div class="card-header">
                    <div class="font-weight-bold mb-0">Ventas pendiente pago</div>
                </div>

                <div class="card-body">
                    <div class="h6 mb-0 w-100">
                        <label class="h4" id="card-label-monto"><?php echo Formato::Precio($_smarty_tpl->tpl_vars['montoVentasPendientePago']->value,$_smarty_tpl->tpl_vars['objMonedaCLP']->value->decimales);?>
</label>
                        <label style="position: relative; top: -5px;">CLP</label>

                        <div class="float-right">
                            <button class="btn btn-sm btn-dark" data-toggle="collapse" data-target="#collapse-1">
                                <i class="fas fa-info"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="card-footer collapse p-0 m-0" id="collapse-1">
                    <div class="small m-0 p-2">
                        Son los cobros que tiene el estado <b>pendiente</b> indiferente el año emisión.
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4">
            <div class="card mb-3 bg-danger text-white">
                <div class="card-header">
                    <div class="font-weight-bold mb-0">Venta con pago Vencido</div>
                </div>

                <div class="card-body">
                    <div class="h6 mb-0 w-100">
                        <label class="h4" id="card-label-monto"><?php echo Formato::Precio($_smarty_tpl->tpl_vars['montoVentasPagoVencido']->value,$_smarty_tpl->tpl_vars['objMonedaCLP']->value->decimales);?>
</label>
                        <label style="position: relative; top: -5px;">CLP</label>

                        <div class="float-right">
                            <button class="btn btn-sm btn-dark" data-toggle="collapse" data-target="#collapse-2">
                                <i class="fas fa-info"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="card-footer collapse p-0 m-0" id="collapse-2">
                    <div class="small m-0 p-2">
                        Son los cobros que tiene el estado <b>Vencido</b> indiferente el año de emisión.
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4">
            <div class="card mb-3 bg-success text-white">
                <div class="card-header">
                    <div class="font-weight-bold mb-0">Ventas Facturadas año en curso</div>
                </div>

                <div class="card-body">
                    <div class="h6 mb-0 w-100">
                        <label class="h4" id="card-label-monto"><?php echo Formato::Precio($_smarty_tpl->tpl_vars['montoVentasFacturadasAnoCurso']->value,$_smarty_tpl->tpl_vars['objMonedaCLP']->value->decimales);?>
</label>
                        <label style="position: relative; top: -5px;">CLP</label>

                        <div class="float-right">
                            <button class="btn btn-sm btn-dark" data-toggle="collapse" data-target="#collapse-3">
                                <i class="fas fa-info"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="card-footer collapse p-0 m-0" id="collapse-3">
                    <div class="small m-0 p-2">
                        Son las ventas totales <b>(pendiente de pago + Pagado)</b> no considerar anulado.
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4">
            <div class="card mb-3 bg-success text-white">
                <div class="card-header">
                    <div class="font-weight-bold mb-0">Ingresos del mes en curso</div>
                </div>

                <div class="card-body">
                    <div class="h6 mb-0 w-100">
                        <label class="h4" id="card-label-monto"><?php echo Formato::Precio($_smarty_tpl->tpl_vars['montoIngresosMesCurso']->value,$_smarty_tpl->tpl_vars['objMonedaCLP']->value->decimales);?>
</label>
                        <label style="position: relative; top: -5px;">CLP</label>

                        <div class="float-right">
                            <button class="btn btn-sm btn-dark" data-toggle="collapse" data-target="#collapse-4">
                                <i class="fas fa-info"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="card-footer collapse p-0 m-0" id="collapse-4">
                    <div class="small m-0 p-2">
                        Son los pago registrados en el mes en curso
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4">
            <div class="card mb-3 bg-primary text-white">
                <div class="card-header">
                    <div class="font-weight-bold mb-0">Egresos Anuales</div>
                </div>

                <div class="card-body">
                    <div class="h6 mb-0 w-100">
                        <label class="h4" id="card-label-monto"><?php echo Formato::Precio($_smarty_tpl->tpl_vars['montoEgresosAnuales']->value,$_smarty_tpl->tpl_vars['objMonedaCLP']->value->decimales);?>
</label>
                        <label style="position: relative; top: -5px;">CLP</label>

                        <div class="float-right">
                            <button class="btn btn-sm btn-dark" data-toggle="collapse" data-target="#collapse-4">
                                <i class="fas fa-info"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="card-footer collapse p-0 m-0" id="collapse-4">
                    <div class="small m-0 p-2">
                        Suma de todo los egresos del año menos los anulados.
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4">
            <div class="card mb-3 bg-primary text-white">
                <div class="card-header">
                    <div class="font-weight-bold mb-0">Egresos del mes</div>
                </div>

                <div class="card-body">
                    <div class="h6 mb-0 w-100">
                        <label class="h4" id="card-label-monto"><?php echo Formato::Precio($_smarty_tpl->tpl_vars['montoEgresosMensuales']->value,$_smarty_tpl->tpl_vars['objMonedaCLP']->value->decimales);?>
</label>
                        <label style="position: relative; top: -5px;">CLP</label>

                        <div class="float-right">
                            <button class="btn btn-sm btn-dark" data-toggle="collapse" data-target="#collapse-4">
                                <i class="fas fa-info"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="card-footer collapse p-0 m-0" id="collapse-4">
                    <div class="small m-0 p-2">
                        Suma de todos los egresos del mes en curso menos los anulados.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><?php }
}
