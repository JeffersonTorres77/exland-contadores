<?php
/* Smarty version 3.1.36, created on 2020-10-28 11:50:51
  from 'C:\xampp\htdocs\contaduria\app\empresas\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_5f994d0b2fe4e6_60153807',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'b057f5034849cb85674d9b2910c6120ee120c442' => 
    array (
      0 => 'C:\\xampp\\htdocs\\contaduria\\app\\empresas\\templates\\index.tpl',
      1 => 1603882246,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5f994d0b2fe4e6_60153807 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="p-2 m-2">
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
                            <label for="nuevo-input-direccion" class="mb-0">Dirección</label>
                            <textarea class="form-control" placeholder="Dirección..." name="direccion" id="nuevo-input-direccion" required cols="30" rows="4"></textarea>
                        </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="nuevo-input-comuna" class="mb-0">Comuna</label>
                            <input type="text" class="form-control" placeholder="Comuna..." name="comuna" id="nuevo-input-comuna" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="nuevo-input-oficina_sii" class="mb-0">Oficina SII</label>
                            <input type="text" class="form-control" placeholder="Oficina SII..." name="oficina_sii" id="nuevo-input-oficina_sii" required>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-group">
                            <label for="nuevo-input-giro" class="mb-0">Giro</label>
                            <input type="text" class="form-control" placeholder="Giro..." name="giro" id="nuevo-input-giro" required>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-group">
                            <label for="nuevo-input-correo" class="mb-0">Correo</label>
                            <input type="email" class="form-control" placeholder="Correo..." name="correo" id="nuevo-input-correo" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="nuevo-input-fecha_inicio_actividades" class="mb-0">Fecha inicio actividades</label>
                            <input type="date" class="form-control" name="fecha_inicio_actividades" id="nuevo-input-fecha_inicio_actividades" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="nuevo-input-fecha_inicio_servicio" class="mb-0">Fecha inicio servicio</label>
                            <input type="date" class="form-control" name="fecha_inicio_servicio" id="nuevo-input-fecha_inicio_servicio" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label for="nuevo-input-rut_representante_legal_1" class="mb-0">RUT</label>
                            <input type="text" class="form-control" name="rut_representante_legal_1" id="nuevo-input-rut_representante_legal_1" placeholder="RUT 1..." required>
                        </div>
                    </div>

                    <div class="col-12 col-md-8">
                        <div class="form-group">
                            <label for="nuevo-input-representante_legal_1" class="mb-0">Representante legal 1</label>
                            <input type="text" class="form-control" name="representante_legal_1" id="nuevo-input-representante_legal_1" placeholder="Representante legal 1..." required>
                        </div>
                    </div>

                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label for="nuevo-input-rut_representante_legal_2" class="mb-0">RUT</label>
                            <input type="text" class="form-control" name="rut_representante_legal_2" id="nuevo-input-rut_representante_legal_2" placeholder="RUT 2...">
                        </div>
                    </div>

                    <div class="col-12 col-md-8">
                        <div class="form-group">
                            <label for="nuevo-input-representante_legal_2" class="mb-0">Representante legal 2</label>
                            <input type="text" class="form-control" name="representante_legal_2" id="nuevo-input-representante_legal_2" placeholder="Representante legal 2...">
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-group">
                            <label for="nuevo-input-tipo_actuacion" class="mb-0">Tipo actuación</label>
                            <input type="text" class="form-control" name="tipo_actuacion" id="nuevo-input-tipo_actuacion" placeholder="Tipo actuación...">
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-group">
                            <label for="nuevo-input-regimen_tributario" class="mb-0">Regimen tributario</label>
                            <input type="text" class="form-control" name="regimen_tributario" id="nuevo-input-regimen_tributario" placeholder="Regimen tributario..." required>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-group">
                            <label for="nuevo-input-idPlan" class="mb-0">Plan</label>
                            <select name="idPlan" id="nuevo-input-idPlan" class="form-control" required>
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
