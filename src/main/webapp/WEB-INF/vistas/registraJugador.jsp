<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body>

<div class="container">
<h1>Registra Jugador</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="registraJugador" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fechaNacmiento">Fecha Nacimiento</label>
				<input class="form-control" id="id_fechaNacmiento" name="fechaNacmiento" type="date">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_sueldo">Sueldo</label>
				<input class="form-control" id="id_sueldo" name="sueldo" placeholder="Ingrese el sueldo" type="text">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_posicion">Posicion</label>
				<input class="form-control" id="id_posicion" name="posicion" placeholder="Ingrese la posicion" type="text">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_talla">Talla</label>
				<input class="form-control" id="id_talla" name="talla" placeholder="Ingrese la talla" type="text">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_email">Email</label>
				<input class="form-control" id="id_email" name="email" placeholder="Ingrese el email" type="text">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_equipo">Equipo</label>
				<select id="id_equipo" name="equipo.idEquipo" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crear</button>
			</div>
	</form>
</div>

<script type="text/javascript">
$.getJSON("cargaEquipo", {}, function(data){
	$.each(data, function(index,item){
		$("#id_equipo").append("<option value="+item.idEquipo +">"+ item.nombre +"</option>");
	});
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#id_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 2 a 100 caracteres',
                	min : 2,
                	max : 100
                }
            }
        },
        fechaNacimiento: {
    		selector : '#id_fechaNacimiento',
            validators: {
                notEmpty: {
                    message: 'La fecha de nacimiento es un campo obligatorio'
                },
            }
        },
        sueldo: {
    		selector : '#id_sueldo',
            validators: {
            	notEmpty: {
                    message: 'El sueldo es un campo obligatorio'
                },
            }
        },
        posicion: {
    		selector : '#id_posicion',
            validators: {
            	notEmpty: {
                    message: 'La posicion es un campo obligatorio'
                },
            }
        },
        talla: {
    		selector : '#id_talla',
            validators: {
            	notEmpty: {
                    message: 'La talla es un campo obligatorio'
                },
            }
        },
        email: {
    		selector : '#id_email',
            validators: {
            	notEmpty: {
                    message: 'El email es un campo obligatorio'
                },
            }
        },
        equipo: {
    		selector : '#id_equipo',
            validators: {
            	notEmpty: {
                    message: 'El equipo es un campo obligatorio'
                },
            }
        },
    	
    }   
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>




