<?php
/* Smarty version 3.1.36, created on 2021-03-17 15:06:42
  from 'C:\xampp\htdocs\Contaduria\app\empresas\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_60520cf20e5cb9_09534967',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f56019a3ac0d067a0e127db710bf370f53e587a8' => 
    array (
      0 => 'C:\\xampp\\htdocs\\Contaduria\\app\\empresas\\templates\\index.tpl',
      1 => 1615989994,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_60520cf20e5cb9_09534967 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'C:\\xampp\\htdocs\\Contaduria\\vendor\\smarty\\smarty\\libs\\plugins\\modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
?>
<div class="p-2 m-2">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">
                Empresas

                <div class="datatable-header-options">
                    <button data-toggle="modal" data-target="#modal-nuevo">
                        <i class="fas fa-plus"></i>
                    </button>

                    <button onclick="RefrescarTabla()">
                        <i class="fas fa-sync-alt"></i>
                    </button>
                </div>
            </h5>
        </div>

        <div class="card-body">
            <table class="table table-bordered table-striped table-hover table-sm" style="width: 100%;" id="tabla">
                <thead>
                    <tr>
                        <th style="width: 25px;">Id</th>
                        <th style="width: 100px;">RUT</th>
                        <th style="width: auto;">Nombre</th>
                        <th style="width: 200px;">Plan</th>
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

<!-- MODAL NUEVO -->
<div class="modal fade" id="modal-nuevo">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <form class="modal-content" id="form-nuevo">
            <div class="modal-header bg-primary text-white">
                <h5 class="mb-0">Nueva empresa</h5>
                <button class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <div class="row">
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label for="nuevo-input-rut" class="mb-0">RUT</label>
                            <input type="text" class="form-control" placeholder="RUT..." name="rut" id="nuevo-input-rut" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-8">
                        <div class="form-group">
                            <label for="nuevo-input-razon_social" class="mb-0">Razon social</label>
                            <input type="text" class="form-control" placeholder="Razon social..." name="razon_social" id="nuevo-input-razon_social" required>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-group">
                            <label for="nuevo-input-correo" class="mb-0">Correo</label>
                            <input type="email" class="form-control" placeholder="Correo..." name="correo" id="nuevo-input-correo" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-7">
                        <div class="form-group mb-0">
                            <label for="nuevo-input-idPlan" class="mb-0">Plan</label>
                            <select name="idPlan" id="nuevo-input-idPlan" class="form-control">
                                <option value="">Planes...</option>
                                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['planes']->value, 'plan');
$_smarty_tpl->tpl_vars['plan']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['plan']->value) {
$_smarty_tpl->tpl_vars['plan']->do_else = false;
?>
                                    <option value="<?php echo $_smarty_tpl->tpl_vars['plan']->value['idPlan'];?>
"><?php echo $_smarty_tpl->tpl_vars['plan']->value['nombre'];?>
</option>
                                <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                            </select>
                        </div>
                    </div>

                    <div class="col-12 col-md-5">
                        <div class="form-group mb-0">
                            <label for="nuevo-input-fechaInicioPlan" class="mb-0">Fecha inicio Plan</label>
                            <input type="date" name="fechaInicioPlan" id="nuevo-input-fechaInicioPlan" class="form-control" value="<?php echo smarty_modifier_date_format(time(),'%Y-%m-%d');?>
">
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-outline-secondary w-100px" data-dismiss="modal">
                    Cerrar
                </button>

                <button type="submit" class="btn btn-primary w-100px">
                    Registrar
                </button>
            </div>
        </form>
    </div>
</div>
<!-- FIN MODAL NUEVO --><?php }
}
