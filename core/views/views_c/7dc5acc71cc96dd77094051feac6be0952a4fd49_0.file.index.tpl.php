<?php
/* Smarty version 3.1.36, created on 2020-10-29 16:06:41
  from 'C:\xampp\htdocs\Contaduria\app\cobros\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_5f9ada81185619_10948496',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '7dc5acc71cc96dd77094051feac6be0952a4fd49' => 
    array (
      0 => 'C:\\xampp\\htdocs\\Contaduria\\app\\cobros\\templates\\index.tpl',
      1 => 1603881322,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5f9ada81185619_10948496 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="p-2 m-2">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">
                Cobros

                <div class="datatable-header-options">
                    <a href="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/Cobros/Nuevo/">
                        <button class="float-left">
                            <i class="fas fa-plus"></i>
                        </button>
                    </a>

                    <button onclick="RefrescarTabla()">
                        <i class="fas fa-sync-alt"></i>
                    </button>
                </div>
            </h5>
        </div>

        <div class="card-body">
            <div class="collapse" id="filtros">
                <div class="card mb-3">
                    <div class="card-header p-2">
                        <div class="mb-0">
                            Filtros
                            <button class="close" data-toggle="collapse" data-target="#filtros">&times;</button>
                        </div>
                    </div>

                    <div class="card-body p-2">
                        <div class="row">
                            <div class="col-12 col-md-6 mb-3">
                                <div class="small">Status:</div>
                                <div class="row">
                                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['status']->value, 'statu');
$_smarty_tpl->tpl_vars['statu']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['statu']->value) {
$_smarty_tpl->tpl_vars['statu']->do_else = false;
?>
                                    <div class="col-6">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="filter-status-<?php echo $_smarty_tpl->tpl_vars['statu']->value['idStatus'];?>
" value="<?php echo $_smarty_tpl->tpl_vars['statu']->value['idStatus'];?>
">
                                            <label class="custom-control-label" for="filter-status-<?php echo $_smarty_tpl->tpl_vars['statu']->value['idStatus'];?>
"><?php echo $_smarty_tpl->tpl_vars['statu']->value['nombre'];?>
</label>
                                        </div>
                                    </div>
                                    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                                </div>
                            </div>

                            <div class="col-12 col-md-6">
                                <div class="row">
                                    <div class="col-12 mb-3">
                                        <div class="input-group input-group-sm">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">Empresas</div>
                                            </div>
                                            <select class="form-control" id="filter-empresa">
                                                <option value="">General</option>
                                                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['empresas']->value, 'empresa');
$_smarty_tpl->tpl_vars['empresa']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['empresa']->value) {
$_smarty_tpl->tpl_vars['empresa']->do_else = false;
?>
                                                <option value="<?php echo $_smarty_tpl->tpl_vars['empresa']->value['idEmpresa'];?>
"><?php echo $_smarty_tpl->tpl_vars['empresa']->value['razon_social'];?>
</option>
                                                <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="input-group input-group-sm">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">Desde</div>
                                            </div>
                                            <input type="date" class="form-control border-right-0" id="filter-fecha-desde">
            
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">Hasta</div>
                                            </div>
                                            <input type="date" class="form-control" id="filter-fecha-hasta">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <table class="table table-bordered table-striped table-hover table-sm" style="width: 100%;" id="tabla">
                <thead>
                    <tr>
                        <th class="text-truncate" style="width: 25px;">Id</th>
                        <th class="text-truncate" style="width: 100px;">Periodo contable</th>
                        <th class="text-truncate" style="width: auto;">Empresa</th>
                        <th class="text-truncate" style="width: 50px;">N° factura</th>
                        <th class="text-truncate" style="width: 100px;">Valor a cobrar</th>
                        <th class="text-truncate" style="width: 100px;">Fecha venc.</th>
                        <th class="text-truncate" style="width: 100px;">Status</th>
                        <th class="text-truncate" style="width: 50px;">Opciones</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td colspan="8">
                            <h5 class="mb-0 text-center p-2">. . .</h5>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div><?php }
}
