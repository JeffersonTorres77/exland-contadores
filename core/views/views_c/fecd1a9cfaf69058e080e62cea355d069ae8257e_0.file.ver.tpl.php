<?php
/* Smarty version 3.1.36, created on 2020-10-24 00:17:23
  from 'C:\xampp\htdocs\contaduria\app\empresas\templates\ver.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_5f935673478df7_01297296',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'fecd1a9cfaf69058e080e62cea355d069ae8257e' => 
    array (
      0 => 'C:\\xampp\\htdocs\\contaduria\\app\\empresas\\templates\\ver.tpl',
      1 => 1603491442,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5f935673478df7_01297296 (Smarty_Internal_Template $_smarty_tpl) {
?><form class="m-2 p-2" id="form-datos">
    <input type="hidden" name="idEmpresa" value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->id;?>
">

    <div class="card mb-3">
        <div class="card-body p-3">
            <h5 class="mb-0">
                <a href="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/Empresas/Index/" class="text-decoration-none">
                    <i class="fas fa-arrow-left pr-1 mr-1"></i>
                </a>
                <?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->razon_social;?>

            </h5>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-md-6">
            <div class="card mb-3">
                <div class="card-header">
                    <h5 class="mb-0">Datos basicos</h5>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-12 col-md-4">
                            <div class="form-group">
                                <label for="input-rut" class="mb-0">RUT</label>
                                <input type="text" class="form-control" placeholder="RUT..." name="rut" id="input-rut" required value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->rut;?>
">
                            </div>
                        </div>
    
                        <div class="col-12 col-md-8">
                            <div class="form-group">
                                <label for="input-razon_social" class="mb-0">Razon social</label>
                                <input type="text" class="form-control" placeholder="Razon social..." name="razon_social" id="input-razon_social" required value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->razon_social;?>
">
                            </div>
                        </div>
    
                        <div class="col-12">
                            <div class="form-group">
                                <label for="input-direccion" class="mb-0">Dirección</label>
                                <textarea class="form-control" placeholder="Dirección..." name="direccion" id="input-direccion" required cols="30" rows="4"><?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->direccion;?>
</textarea>
                            </div>
                        </div>
    
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label for="input-comuna" class="mb-0">Comuna</label>
                                <input type="text" class="form-control" placeholder="Comuna..." name="comuna" id="input-comuna" required value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->comuna;?>
">
                            </div>
                        </div>
    
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label for="input-oficina_sii" class="mb-0">Oficina SII</label>
                                <input type="text" class="form-control" placeholder="Oficina SII..." name="oficina_sii" id="input-oficina_sii" required value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->oficina_sii;?>
">
                            </div>
                        </div>
    
                        <div class="col-12">
                            <div class="form-group">
                                <label for="input-giro" class="mb-0">Giro</label>
                                <input type="text" class="form-control" placeholder="Giro..." name="giro" id="input-giro" required value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->giro;?>
">
                            </div>
                        </div>
    
                        <div class="col-12">
                            <div class="form-group">
                                <label for="input-correo" class="mb-0">Correo</label>
                                <input type="email" class="form-control" placeholder="Correo..." name="correo" id="input-correo" required value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->correo;?>
">
                            </div>
                        </div>
    
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label for="input-fecha_inicio_actividades" class="mb-0">Fecha inicio actividades</label>
                                <input type="date" class="form-control" name="fecha_inicio_actividades" id="input-fecha_inicio_actividades" required value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->fecha_inicio_actividades;?>
">
                            </div>
                        </div>
    
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label for="input-fecha_inicio_servicio" class="mb-0">Fecha inicio servicio</label>
                                <input type="date" class="form-control" name="fecha_inicio_servicio" id="input-fecha_inicio_servicio" required value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->fecha_inicio_servicio;?>
">
                            </div>
                        </div>
    
                        <div class="col-12 col-md-4">
                            <div class="form-group">
                                <label for="input-rut_representante_legal_1" class="mb-0">RUT</label>
                                <input type="text" class="form-control" name="rut_representante_legal_1" id="input-rut_representante_legal_1" placeholder="RUT 1..." required value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->rut_representante_legal_1;?>
">
                            </div>
                        </div>
    
                        <div class="col-12 col-md-8">
                            <div class="form-group">
                                <label for="input-representante_legal_1" class="mb-0">Representante legal 1</label>
                                <input type="text" class="form-control" name="representante_legal_1" id="input-representante_legal_1" placeholder="Representante legal 1..." required value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->representante_legal_1;?>
">
                            </div>
                        </div>
    
                        <div class="col-12 col-md-4">
                            <div class="form-group">
                                <label for="input-rut_representante_legal_2" class="mb-0">RUT</label>
                                <input type="text" class="form-control" name="rut_representante_legal_2" id="input-rut_representante_legal_2" placeholder="RUT 2..." value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->rut_representante_legal_2;?>
">
                            </div>
                        </div>
    
                        <div class="col-12 col-md-8">
                            <div class="form-group">
                                <label for="input-representante_legal_2" class="mb-0">Representante legal 2</label>
                                <input type="text" class="form-control" name="representante_legal_2" id="input-representante_legal_2" placeholder="Representante legal 2..." value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->representante_legal_2;?>
">
                            </div>
                        </div>
    
                        <div class="col-12">
                            <div class="form-group">
                                <label for="input-tipo_actuacion" class="mb-0">Tipo actuación</label>
                                <input type="text" class="form-control" name="tipo_actuacion" id="input-tipo_actuacion" placeholder="Tipo actuación..." value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->tipo_actuacion;?>
">
                            </div>
                        </div>
    
                        <div class="col-12">
                            <div class="form-group mb-0">
                                <label for="input-regimen_tributario" class="mb-0">Regimen tributario</label>
                                <input type="text" class="form-control" name="regimen_tributario" id="input-regimen_tributario" placeholder="Regimen tributario..." required value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->regimen_tributario;?>
">
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
        
        <div class="col-12 col-md-6">
            <div class="card mb-3">
                <div class="card-header">
                    <h5 class="mb-0">Planes</h5>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="input-idPlan" class="mb-0">Plan</label>
                                <select class="form-control" name="idPlan" id="input-idPlan">
                                    <option value="">Asignar un plan</option>
                                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['planes']->value, 'plan');
$_smarty_tpl->tpl_vars['plan']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['plan']->value) {
$_smarty_tpl->tpl_vars['plan']->do_else = false;
?>
                                        <?php if ($_smarty_tpl->tpl_vars['plan']->value['idPlan'] == $_smarty_tpl->tpl_vars['objEmpresa']->value->idPlan) {?>
                                            <option value="<?php echo $_smarty_tpl->tpl_vars['plan']->value['idPlan'];?>
" selected><?php echo $_smarty_tpl->tpl_vars['plan']->value['nombre'];?>
</option>
                                        <?php } else { ?>
                                            <option value="<?php echo $_smarty_tpl->tpl_vars['plan']->value['idPlan'];?>
"><?php echo $_smarty_tpl->tpl_vars['plan']->value['nombre'];?>
</option>
                                        <?php }?>
                                    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                                </select>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-group">
                                <label for="input-fechaInicioPlan" class="mb-0">Fecha inicio</label>
                                <input type="date" class="form-control" name="fechaInicioPlan" id="input-fechaInicioPlan">
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
    </div>

    <div class="card">
        <div class="card-body p-3">
            <div class="text-center">
                <button type="submit" class="btn btn-success w-100px">
                    Guardar
                </button>
            </div>
        </div>
    </div>
</form><?php }
}
