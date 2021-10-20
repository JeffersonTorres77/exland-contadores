<?php
/* Smarty version 3.1.36, created on 2020-10-26 19:38:16
  from 'C:\xampp\htdocs\contaduria\app\cobros\templates\nuevo.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_5f9717985e3141_87678371',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '0d938d6586a876ba49cea3f7c62a222ba764bad7' => 
    array (
      0 => 'C:\\xampp\\htdocs\\contaduria\\app\\cobros\\templates\\nuevo.tpl',
      1 => 1603737495,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5f9717985e3141_87678371 (Smarty_Internal_Template $_smarty_tpl) {
echo '<script'; ?>
>
    const EMPRESAS = JSON.parse(`<?php echo $_smarty_tpl->tpl_vars['empresasJson']->value;?>
`);
<?php echo '</script'; ?>
>

<div class="m-2 p-2">
    <form class="card" id="form-nuevo">
        <div class="card-header bg-primary text-white">
            <div class="float-left">
                <a href="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/Cobros/Index/">
                    <div class="text-white pr-2">
                        <i class="fas fa-sm fa-arrow-left"></i>
                    </div>
                </a>
            </div>
            
            <h5 class="mb-0">Emitir cobro</h5>
        </div>

        <div class="card-body">
            <div class="row">
                <!-- ROW 1 -->
                <div class="col-12">
                    <div class="form-group">
                        <label for="input-idEmpresa" class="mb-0">Empresa<b class="text-danger">*</b></label>
                        <select name="idEmpresa" id="input-idEmpresa" class="form-control" required>
                            <option value="">Seleccione una empresa</option>
                            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['empresas']->value, 'empresa');
$_smarty_tpl->tpl_vars['empresa']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['empresa']->value) {
$_smarty_tpl->tpl_vars['empresa']->do_else = false;
?>
                                <option value="<?php echo $_smarty_tpl->tpl_vars['empresa']->value['idEmpresa'];?>
">
                                    <?php echo $_smarty_tpl->tpl_vars['empresa']->value['razon_social'];?>

                                </option>
                            <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                        </select>
                    </div>
                </div>

                <!-- ROW 2 -->
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="input-idPlan" class="mb-0">Plan Contratado</label>
                        <input type="text" id="input-idPlan" class="form-control bg-warning" disabled>
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="input-valorPlan" class="mb-0">Valor Plan CLP</label>
                        <input type="text" id="input-valorPlan" class="form-control bg-warning text-right" disabled>
                    </div>
                </div>
                
                <!-- ROW 3 -->
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="input-motivoDescuento" class="mb-0">Motivo Dct.</label>
                        <input type="text" name="motivoDescuento" id="input-motivoDescuento" class="form-control" placeholder="Motivo Dct...">
                    </div>
                </div>
                
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="input-valorCobrar" class="mb-0">Valor a Cobrar<b class="text-danger">*</b></label>
                        <input type="text" name="valorCobrar" id="input-valorCobrar" class="form-control" placeholder="Valor a cobrrar..." required>
                    </div>
                </div>
                
                <!-- ROW 4 -->
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="input-numeroFactura" class="mb-0">N° Factura<b class="text-danger">*</b></label>
                        <input type="text" name="numeroFactura" id="input-numeroFactura" class="form-control" placeholder="Numero de factura..." required>
                    </div>
                </div>
                
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="input-fechaVencimiento" class="mb-0">Fecha Vencimiento<b class="text-danger">*</b></label>
                        <input type="date" name="fechaVencimiento" id="input-fechaVencimiento" class="form-control" required>
                    </div>
                </div>
                
                <!-- ROW 5 -->
                <div class="col-12 col-md-6">
                    <div class="row">
                        <div class="col-12 col-mb-6">
                            <div class="form-group">
                                <label class="mb-0">Status</label>
                                <input type="text" class="form-control bg-warning" disabled value="<?php echo $_smarty_tpl->tpl_vars['statusPendiente']->value->nombre;?>
">
                            </div>
                        </div>

                        <div class="col-12 col-mb-6">
                            <div class="form-group">
                                <label for="input-periodoCobro" class="mb-0">Periodo de cobro<b class="text-danger">*</b></label>
                                <select name="periodoCobro" id="input-periodoCobro" class="form-control" required>
                                    <option value="">Seleccione...</option>
                                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['periodosCobros']->value, 'periodoCobro');
$_smarty_tpl->tpl_vars['periodoCobro']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['periodoCobro']->value) {
$_smarty_tpl->tpl_vars['periodoCobro']->do_else = false;
?>
                                        <option value="<?php echo $_smarty_tpl->tpl_vars['periodoCobro']->value['idPeriodoContable'];?>
">
                                            <?php echo $_smarty_tpl->tpl_vars['periodoCobro']->value['nombre'];?>

                                        </option>
                                    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="input-observacion" class="mb-0">Observación</label>
                        <textarea name="observacion" id="input-observacion" class="form-control" placeholder="Observación..." cols="30" rows="4"></textarea>
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="input-observacion" class="mb-0">Centro de costo<b class="text-danger">*</b></label>
                        <select name="centroCosto" id="input-centroCosto" class="form-control" required>
                            <option value="">Seleccione el centro de costo...</option>
                            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['centrosCosto']->value, 'centro');
$_smarty_tpl->tpl_vars['centro']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['centro']->value) {
$_smarty_tpl->tpl_vars['centro']->do_else = false;
?>
                                <option value="<?php echo $_smarty_tpl->tpl_vars['centro']->value['idCentroCosto'];?>
"><?php echo $_smarty_tpl->tpl_vars['centro']->value['nombre'];?>
</option>
                            <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                        </select>
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label class="mb-0">Usuario que registra</label>
                        <input type="text" class="form-control" disabled value="<?php echo Sesion::Usuario()->nombre;?>
">
                    </div>
                </div>
            </div>
        </div>

        <div class="card-footer text-center">
            <a class="btn btn-outline-secondary" style="width: 100px;" href="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/Cobros/Index/">
                Cancelar
            </a>

            <button type="submit" class="btn btn-primary" style="width: 100px;">
                Generar
            </button>
        </div>
    </form>
</div><?php }
}
