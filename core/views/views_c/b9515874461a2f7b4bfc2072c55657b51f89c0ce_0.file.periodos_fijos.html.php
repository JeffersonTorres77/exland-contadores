<?php
/* Smarty version 3.1.36, created on 2021-07-19 19:43:17
  from 'C:\xampp\htdocs\Contadores\app\cobros_adicionales\templates\periodos_fijos.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_60f5b9b5b27032_82217240',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'b9515874461a2f7b4bfc2072c55657b51f89c0ce' => 
    array (
      0 => 'C:\\xampp\\htdocs\\Contadores\\app\\cobros_adicionales\\templates\\periodos_fijos.html',
      1 => 1626716561,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_60f5b9b5b27032_82217240 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="p-2 m-2">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <div class="d-flex justify-content-between">
                <h5 class="card-title mb-0">
                    <a href="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/Cobros_Adicionales/" class="text-white text-decoration-none">
                        <i class="fas fa-arrow-left pr-1 mr-1"></i>
                    </a>
                    Periodos Fijos
                </h5>
                <div class="datatable-header-options h5">
                    <button id="btn-nuevo">
                        <i class="fas fa-plus"></i>
                    </button>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-sm table-hover table-striped table-bordered mb-0 w-100" id="table-periodos">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Opc.</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="100">
                                <h5 class="mb-0 p-3 text-center">. . .</h5>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- MODAL NUEVO -->
<div class="modal fade" id="modal-nuevo">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
        <form class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="mb-0">Nuevo periodo fijo</h5>
                <button class="close" data-dismiss="modal" type="button">&times;</button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group mb-0">
                            <label class="mb-0">Periodos contables</label>
                            <div>
                                <select class="form-control select2" name="periodo_id">
                                    <option value="" disabled>Seleccione un periodo contable...</option>
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
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-outline-secondary" style="width: 100px;" type="button" data-dismiss="modal">
                    Cerrar
                </button>
                <button class="btn btn-primary" style="width: 100px;" type="submit">
                    Registrar
                </button>
            </div>
        </form>
    </div>
</div>

<!-- MODAL ELIMINAR -->
<div class="modal fade" id="modal-eliminar">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
        <form class="modal-content">
            <div class="modal-header bg-danger text-white">
                <h5 class="mb-0">Quitar periodo contable</h5>
                <button class="close" data-dismiss="modal" type="button">&times;</button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="periodo_id">
                <p class="mb-0">¿Esta seguro que desea eliminar de los periodos fijos el periodo contable <b data="nombre"></b>?</p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-outline-secondary" style="width: 100px;" type="button" data-dismiss="modal">
                    Cerrar
                </button>
                <button class="btn btn-danger" style="width: 100px;" type="submit">
                    Eliminar
                </button>
            </div>
        </form>
    </div>
</div><?php }
}
