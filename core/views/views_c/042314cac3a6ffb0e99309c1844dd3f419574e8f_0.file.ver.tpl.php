<?php
/* Smarty version 3.1.36, created on 2020-10-27 16:54:48
  from 'C:\xampp\htdocs\contaduria\app\cobros\templates\ver.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_5f9842c824aa24_39845593',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '042314cac3a6ffb0e99309c1844dd3f419574e8f' => 
    array (
      0 => 'C:\\xampp\\htdocs\\contaduria\\app\\cobros\\templates\\ver.tpl',
      1 => 1603814087,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5f9842c824aa24_39845593 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'C:\\xampp\\htdocs\\contaduria\\vendor\\smarty\\smarty\\libs\\plugins\\modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
echo '<script'; ?>
>
    const ID_COBRO = '<?php echo $_smarty_tpl->tpl_vars['objCobro']->value->id;?>
';
<?php echo '</script'; ?>
>

<div class="m-2 p-2">
    <form class="card" id="form-modificar">
        <div class="card-header bg-primary text-white">
            <div class="float-left">
                <a href="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/Cobros/Index/">
                    <div class="text-white pr-2">
                        <i class="fas fa-sm fa-arrow-left"></i>
                    </div>
                </a>
            </div>

            <h5 class="mb-0">Cobro ID <?php echo $_smarty_tpl->tpl_vars['objCobro']->value->id;?>
</h5>
        </div>

        <div class="card-body">
            <div class="row">
                <!-- ROW 1 -->
                <div class="col-12">
                    <div class="form-group">
                        <label class="mb-0">Empresa<b class="text-danger">*</b></label>
                        <input type="text" class="form-control form-control-sm text-black" disabled value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->razon_social;?>
">
                    </div>
                </div>

                <!-- ROW 2 -->
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label class="mb-0">Plan Contratado</label>
                        <input type="text" class="form-control form-control-sm text-black" disabled value="<?php echo $_smarty_tpl->tpl_vars['plan']->value['nombre'] == NULL ? 'No asignado' : $_smarty_tpl->tpl_vars['plan']->value['nombre'];?>
">
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label class="mb-0">Valor Plan CLP</label>
                        <input type="text" class="form-control form-control-sm text-right text-black" disabled value="<?php echo $_smarty_tpl->tpl_vars['objCobro']->value->valorPlan;?>
">
                    </div>
                </div>
                
                <!-- ROW 3 -->
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="input-motivoDescuento" class="mb-0">Motivo Dct.</label>
                        <input type="text" id="input-motivoDescuento" <?php echo $_smarty_tpl->tpl_vars['objCobro']->value->idStatus == '1' || $_smarty_tpl->tpl_vars['objCobro']->value->idStatus == '2' ? '' : 'disabled';?>
 name="motivoDescuento" class="form-control form-control-sm" value="<?php echo $_smarty_tpl->tpl_vars['objCobro']->value->motivoDescuento;?>
">
                    </div>
                </div>
                
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="input-valorCobrar" class="mb-0">Valor a Cobrar<b class="text-danger">*</b></label>
                        <div class="input-group input-group-sm">
                            <input type="number" id="input-valorCobrar" <?php echo $_smarty_tpl->tpl_vars['objCobro']->value->idStatus == '1' || $_smarty_tpl->tpl_vars['objCobro']->value->idStatus == '2' ? 'required' : 'disabled';?>
 name="valorCobrar" class="form-control text-right" value="<?php echo $_smarty_tpl->tpl_vars['objCobro']->value->valorCobrar;?>
" step="<?php echo 1/(pow(10,$_smarty_tpl->tpl_vars['objMonedaCLP']->value->decimales));?>
">
                            <div class="input-group-append">
                                <div class="input-group-text"><?php echo $_smarty_tpl->tpl_vars['objMonedaCLP']->value->simbolo;?>
</div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- ROW 4 -->
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="input-numeroFactura" class="mb-0">N° Factura<b class="text-danger">*</b></label>
                        <input type="text" id="input-numeroFactura" <?php echo $_smarty_tpl->tpl_vars['objCobro']->value->idStatus == '1' || $_smarty_tpl->tpl_vars['objCobro']->value->idStatus == '2' ? 'required' : 'disabled';?>
 name="numeroFactura" class="form-control form-control-sm" value="<?php echo $_smarty_tpl->tpl_vars['objCobro']->value->numeroFactura;?>
">
                    </div>
                </div>
                
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="input-fechaVencimiento" class="mb-0">Fecha Vencimiento<b class="text-danger">*</b></label>
                        <input type="date" id="input-fechaVencimiento" <?php echo $_smarty_tpl->tpl_vars['objCobro']->value->idStatus == '1' || $_smarty_tpl->tpl_vars['objCobro']->value->idStatus == '2' ? 'required' : 'disabled';?>
 name="fechaVencimiento" class="form-control form-control-sm" value="<?php echo $_smarty_tpl->tpl_vars['objCobro']->value->fechaVencimiento;?>
">
                    </div>
                </div>
                
                <!-- ROW 5 -->
                <div class="col-12 col-md-6">
                    <div class="row">
                        <div class="col-12 col-mb-6">
                            <div class="form-group">
                                <label class="mb-0">Status</label>
                                <input type="text" class="form-control form-control-sm bg-white text-black" idStatus="<?php echo $_smarty_tpl->tpl_vars['objStatus']->value->id;?>
" disabled value="<?php echo $_smarty_tpl->tpl_vars['objStatus']->value->nombre;?>
" id="input-status">
                            </div>
                        </div>

                        <div class="col-12 col-mb-6">
                            <div class="form-group">
                                <label class="mb-0">Periodo de cobro<b class="text-danger">*</b></label>
                                <input type="text" class="form-control form-control-sm text-black" disabled value="<?php echo $_smarty_tpl->tpl_vars['objPeriodo']->value->nombre;?>
">
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="input-observacion" class="mb-0">Observación</label>
                        <textarea name="observacion" id="input-observacion" class="form-control form-control-sm" placeholder="Observación..." <?php echo $_smarty_tpl->tpl_vars['objCobro']->value->idStatus == '1' || $_smarty_tpl->tpl_vars['objCobro']->value->idStatus == '2' ? '' : 'disabled';?>
 cols="30" rows="4"><?php echo $_smarty_tpl->tpl_vars['objCobro']->value->observacion;?>
</textarea>
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="input-observacion" class="mb-0">Centro de costo<b class="text-danger">*</b></label>
                        <select name="centroCosto" id="input-centroCosto" class="form-control form-control-sm" <?php echo $_smarty_tpl->tpl_vars['objCobro']->value->idStatus == '1' || $_smarty_tpl->tpl_vars['objCobro']->value->idStatus == '2' ? 'required' : 'disabled';?>
>
                            <option value="">Seleccione el centro de costo...</option>
                            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['centrosCosto']->value, 'centro');
$_smarty_tpl->tpl_vars['centro']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['centro']->value) {
$_smarty_tpl->tpl_vars['centro']->do_else = false;
?>
                                <?php if ($_smarty_tpl->tpl_vars['objCentroCosto']->value->id == $_smarty_tpl->tpl_vars['centro']->value['idCentroCosto']) {?>
                                    <option value="<?php echo $_smarty_tpl->tpl_vars['centro']->value['idCentroCosto'];?>
" selected><?php echo $_smarty_tpl->tpl_vars['centro']->value['nombre'];?>
</option>
                                <?php } else { ?>
                                    <option value="<?php echo $_smarty_tpl->tpl_vars['centro']->value['idCentroCosto'];?>
"><?php echo $_smarty_tpl->tpl_vars['centro']->value['nombre'];?>
</option>
                                <?php }?>
                            <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                        </select>
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label class="mb-0">Registrado por</label>
                        <input type="text" class="form-control form-control-sm" disabled value="<?php echo $_smarty_tpl->tpl_vars['objUsuario']->value->nombre;?>
">
                    </div>
                </div>

                <?php if ($_smarty_tpl->tpl_vars['metodoPago']->value != NULL && $_smarty_tpl->tpl_vars['fechaPago']->value != NULL) {?>
                    <div class="col-12 col-md-6">
                        <div class="form-group mb-0">
                            <label class="mb-0">Metodo de pago</label>
                            <input type="text" class="form-control form-control-sm" disabled value="<?php echo $_smarty_tpl->tpl_vars['metodoPago']->value;?>
">
                        </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <div class="form-group mb-0">
                            <label class="mb-0">Fecha de pago</label>
                            <input type="text" class="form-control form-control-sm" disabled value="<?php echo Formato::Fecha($_smarty_tpl->tpl_vars['fechaPago']->value);?>
">
                        </div>
                    </div>
                <?php }?>
            </div>
        </div>

        <div class="card-footer text-center">
            <a type="button" href="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/Cobros/Index/" class="btn btn-outline-secondary" style="width: 100px;">
                Volver
            </a>

            <?php if ($_smarty_tpl->tpl_vars['objCobro']->value->idStatus == '1' || $_smarty_tpl->tpl_vars['objCobro']->value->idStatus == '2') {?>
            <button type="button" class="btn btn-danger" style="width: 100px;" id="boton-anular">
                Anular
            </button>
            
            <button type="submit" class="btn btn-primary" style="width: 100px;" id="boton-actualizar">
                Actualizar
            </button>

            <button type="button" class="btn btn-success" style="width: 100px;" id="boton-pagar">
                Pagar
            </button>
            <?php }?>
        </div>
    </form>
</div>

<div class="modal fade" id="modal-pagar">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
        <form class="modal-content" id="form-pagar">
            <div class="modal-header bg-success text-white">
                <h5 class="mb-0">Pagar cobro N° <?php echo $_smarty_tpl->tpl_vars['objCobro']->value->id;?>
</h5>
                <button class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <label for="pagar-input-idMetodoPago" class="mb-0">Metodo de pago</label>
                            <select name="idMetodoPago" id="pagar-input-idMetodoPago" class="form-control" required>
                                <option value="">Metodos de pagos...</option>
                                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['metodosPagos']->value, 'metodopago');
$_smarty_tpl->tpl_vars['metodopago']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['metodopago']->value) {
$_smarty_tpl->tpl_vars['metodopago']->do_else = false;
?>
                                    <option value="<?php echo $_smarty_tpl->tpl_vars['metodopago']->value['idMetodoPago'];?>
"><?php echo $_smarty_tpl->tpl_vars['metodopago']->value['nombre'];?>
</option>
                                <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                            </select>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-group mb-0">
                            <label for="pagar-input-fechaPago" class="mb-0">Metodo de pago</label>
                            <input type="date" name="fechaPago" id="pagar-input-fechaPago" class="form-control" value="<?php echo smarty_modifier_date_format(time(),'%Y-%m-%d');?>
">
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-outline-secondary" style="width: 100px;" data-dismiss="modal">
                    Cancelar
                </button>

                <button type="submit" class="btn btn-success" style="width: 100px;">
                    Pagar
                </button>
            </div>
        </form>
    </div>
</div><?php }
}
