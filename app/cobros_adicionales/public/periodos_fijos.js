/**
 * Select 2
 */
$('.select2').select2();

 /**
  * Tabla
  */
  let tabla = $('#table-periodos').DataTable( {
     "processing": true,
     "serverSide": false,
     "ajax": `${BASE_URL}/cobros_adicionales/crud_periodos_fijos/datatable/`,
     "columns": [
         {
             data: "id",
             className: 'vertical-middle text-center',
             width: "50px",
         },
         {
             data: "nombre",
             className: 'vertical-middle',
         },
         {
             orderable: false,
             className: 'text-center text-truncate vertical-middle',
             width: "50px",
             defaultContent: `<div>
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
    let url = `${BASE_URL}/cobros_adicionales/crud_periodos_fijos/periodos/`;

    AJAX.enviar({
        url: url,
        antes: function() {
            Loader.show();
        },
        error: function(mensaje) {
            Loader.hide();
            Alerta.danger('Consultar periodo contable', mensaje);
        },
        ok: function(data) {
            Loader.hide();

            let selectPeriodos = $("#modal-nuevo form select[name=periodo_id]");
            selectPeriodos.html('');
            for(let periodo of data.periodos) {
                selectPeriodos.append(`<option value="${periodo.idPeriodoContable}">${periodo.nombre}</option>`);
            }
            $('.select2').select2();

            $("#modal-nuevo").modal('show');
        }
    });
});

$("#modal-nuevo form").on('submit', function(e) {
    e.preventDefault();
    let url = `${BASE_URL}/cobros_adicionales/crud_periodos_fijos/registrar/`;
    let data = new FormData( $("#modal-nuevo form")[0] );

    AJAX.enviar({
        url: url,
        data: data,
        antes: function() {
            Loader.show();
        },
        error: function(mensaje) {
            Loader.hide();
            Alerta.danger('Registrar periodo contable', mensaje);
        },
        ok: function(data) {
            RefrescarTabla();
            Loader.hide();
            $("#modal-nuevo").modal('hide');
            Alerta.success('Registrar periodo contable', 'Periodo contable registrado exitosamente.');
            $("#modal-nuevo form")[0].reset();
        }
    });
});

/**
 * Eliminar
 */
 tabla.on('click', 'td button.eliminar', function() {
    var data = tabla.row( $(this).parents('tr') ).data();

    $("#modal-eliminar form [data=nombre]").html(data.nombre);
    $("#modal-eliminar form [name=periodo_id]").val( data.id );

    $("#modal-eliminar").modal('show');
});

$("#modal-eliminar form").on('submit', function(e) {
    e.preventDefault();
    let url = `${BASE_URL}/cobros_adicionales/crud_periodos_fijos/eliminar/`;
    let data = new FormData( $("#modal-eliminar form")[0] );

    AJAX.enviar({
        url: url,
        data: data,
        antes: function() {
            Loader.show();
        },
        error: function(mensaje) {
            Loader.hide();
            Alerta.danger('Quitar cobro adicional', mensaje);
        },
        ok: function(data) {
            RefrescarTabla();
            Loader.hide();
            $("#modal-eliminar").modal('hide');
            Alerta.success('Quitar cobro adicional', 'Cobro adicional removido de la lista de periodos fijos exitosamente.');
            $("#modal-eliminar form")[0].reset();
        }
    });
});