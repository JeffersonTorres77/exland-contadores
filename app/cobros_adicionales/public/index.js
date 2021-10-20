/**
 * Select 2
 */
$('.select2').select2();

/**
 * Tabla
 */
 let tabla = $('#table-cobros').DataTable( {
    "processing": true,
    "serverSide": false,
    "ajax": `${BASE_URL}/cobros_adicionales/crud_cobros_adicionales/datatable/`,
    "order": [[0,'desc']],
    "columns": [
        {
            data: "id",
            className: 'vertical-middle text-center',
            width: "50px",
        },
        {
            data: "empresa",
            width: "auto",
            className: 'vertical-middle',
            render: function(d, type, row) {
                return d.razon_social;
            }
        },
        {
            data: "descripcion",
            className: 'vertical-middle',
            width: "auto",
        },
        {
            data: "monto",
            className: 'vertical-middle text-right',
            width: "100px",
            render: function(d, type, row) {
                return `${ formatNumber(d, 0) } ${MONEDA.simbolo}`;
            }
        },
        {
            orderable: false,
            className: 'text-center text-truncate vertical-middle',
            width: "100px",
            defaultContent: `<div>
                <button class="btn btn-sm btn-success editar">
                    <i class="fas fa-edit"></i>
                </button>
                <button class="btn btn-sm btn-danger eliminar">
                    <i class="fas fa-trash-alt"></i>
                </button>
            </div>`
        }
    ]
} );

function RefrescarTabla() {
    tabla.ajax.reload(null, false);
}

/**
 * Registrar
 */
$("#btn-nuevo").on('click', function() {
    $(`#modal-nuevo form [name='periodos_id[]'] option`).removeAttr('selected');
    for(let periodo of PERIODOS_FIJOS) {
        $(`#modal-nuevo form [name='periodos_id[]'] option[value=${periodo.idPeriodoContable}]`).attr('selected', '');
    }
    $('.select2').select2();

    $("#modal-nuevo").modal('show');
});

$("#modal-nuevo form").on('submit', function(e) {
    e.preventDefault();
    let url = `${BASE_URL}/cobros_adicionales/crud_cobros_adicionales/registrar/`;
    let data = new FormData( $("#modal-nuevo form")[0] );

    AJAX.enviar({
        url: url,
        data: data,
        antes: function() {
            Loader.show();
        },
        error: function(mensaje) {
            Loader.hide();
            Alerta.danger('Registrar cobro adicional', mensaje);
        },
        ok: function(data) {
            RefrescarTabla();
            Loader.hide();
            $("#modal-nuevo").modal('hide');
            Alerta.success('Registrar cobro adicional', 'Cobro adicional registrado exitosamente.');
            $("#modal-nuevo form")[0].reset();
        }
    });
});

/**
 * Modificar
 */
 tabla.on('click', 'td button.editar', function() {
    var data = tabla.row( $(this).parents('tr') ).data();

    $("#modal-modificar form [name=cobro_adicional_id]").val( data.id );
    $("#modal-modificar form [name=empresa]").val( data.empresa.razon_social );
    $("#modal-modificar form [name=descripcion]").val( data.descripcion );
    $("#modal-modificar form [name=monto]").val( data.monto );

    $(`#modal-modificar form [name='periodos_id[]'] option`).removeAttr('selected');
    for(let periodo_id of data.periodos_id) {
        $(`#modal-modificar form [name='periodos_id[]'] option[value=${periodo_id}]`).attr('selected', '');
    }
    $('.select2').select2();

    $("#modal-modificar").modal('show');
});

$("#modal-modificar form").on('submit', function(e) {
    e.preventDefault();
    let url = `${BASE_URL}/cobros_adicionales/crud_cobros_adicionales/modificar/`;
    let data = new FormData( $("#modal-modificar form")[0] );

    AJAX.enviar({
        url: url,
        data: data,
        antes: function() {
            Loader.show();
        },
        error: function(mensaje) {
            Loader.hide();
            Alerta.danger('Modificar cobro adicional', mensaje);
        },
        ok: function(data) {
            RefrescarTabla();
            Loader.hide();
            $("#modal-modificar").modal('hide');
            Alerta.success('Modificar cobro adicional', 'Cobro adicional modificado exitosamente.');
            $("#modal-modificar form")[0].reset();
        }
    });
});

/**
 * Eliminar
 */
 tabla.on('click', 'td button.eliminar', function() {
    var data = tabla.row( $(this).parents('tr') ).data();

    $("#modal-eliminar form [data=id]").html(`N° ${data.id}`);
    $("#modal-eliminar form [name=cobro_adicional_id]").val( data.id );

    $("#modal-eliminar").modal('show');
});

$("#modal-eliminar form").on('submit', function(e) {
    e.preventDefault();
    let url = `${BASE_URL}/cobros_adicionales/crud_cobros_adicionales/eliminar/`;
    let data = new FormData( $("#modal-eliminar form")[0] );

    AJAX.enviar({
        url: url,
        data: data,
        antes: function() {
            Loader.show();
        },
        error: function(mensaje) {
            Loader.hide();
            Alerta.danger('Eliminar cobro adicional', mensaje);
        },
        ok: function(data) {
            RefrescarTabla();
            Loader.hide();
            $("#modal-eliminar").modal('hide');
            Alerta.success('Eliminar cobro adicional', 'Cobro adicional eliminado exitosamente.');
            $("#modal-eliminar form")[0].reset();
        }
    });
});