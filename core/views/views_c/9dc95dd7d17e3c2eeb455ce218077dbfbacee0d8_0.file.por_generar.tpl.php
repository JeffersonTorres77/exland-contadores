<?php
/* Smarty version 3.1.36, created on 2021-07-19 15:48:04
  from 'C:\xampp\htdocs\Contadores\app\facturas\templates\por_generar.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_60f58294aceb47_51354534',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '9dc95dd7d17e3c2eeb455ce218077dbfbacee0d8' => 
    array (
      0 => 'C:\\xampp\\htdocs\\Contadores\\app\\facturas\\templates\\por_generar.tpl',
      1 => 1616587700,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_60f58294aceb47_51354534 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="m-2 p-2">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">
                Empresas
            </h5>
        </div>

        <div class="card-body">
            <div class="alert alert-info">
                <div class="h5 mb-0">Filtros</div>
                <hr>
                <div class="row">
                    <div class="form-group col-12 col-md-6 mb-3 mb-md-0">
                        <label class="mb-0">Mostrar al que tenga el periodo contable:</label>
                        <select name="" id="filtro-incluir-periodo" class="form-control form-control-sm">
                            <option value="">General</option>
                            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['periodos']->value, 'periodo');
$_smarty_tpl->tpl_vars['periodo']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['periodo']->value) {
$_smarty_tpl->tpl_vars['periodo']->do_else = false;
?>
                                <option value="<?php echo $_smarty_tpl->tpl_vars['periodo']->value['idPeriodoContable'];?>
"><?php echo $_smarty_tpl->tpl_vars['periodo']->value['nombre'];?>
</option>
                            <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                        </select>
                    </div>
                    <div class="form-group col-12 col-md-6 mb-0">
                        <label class="mb-0">Mostrar al que falte por el periodo contable:</label>
                        <select name="" id="filtro-excluir-periodo" class="form-control form-control-sm">
                            <option value="">General</option>
                            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['periodos']->value, 'periodo');
$_smarty_tpl->tpl_vars['periodo']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['periodo']->value) {
$_smarty_tpl->tpl_vars['periodo']->do_else = false;
?>
                                <option value="<?php echo $_smarty_tpl->tpl_vars['periodo']->value['idPeriodoContable'];?>
"><?php echo $_smarty_tpl->tpl_vars['periodo']->value['nombre'];?>
</option>
                            <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                        </select>
                    </div>
                </div>
            </div>

            <hr>

            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover table-sm" style="width: 100%;" id="tabla">
                    <thead>
                        <tr>
                            <th style="width: 25px;">Id</th>
                            <th style="width: 100px;">RUT</th>
                            <th style="width: auto;">Nombre</th>
                            <th style="width: 200px;">Inicio servicio</th>
                        </tr>
                    </thead>
    
                    <tbody>
                        <tr>
                            <td colspan="5">
                                <h5 class="mb-0 text-center p-2">. . .</h5>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div><?php }
}
