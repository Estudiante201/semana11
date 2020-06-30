<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body> 

 <div class="container">
 <h1>Crud de Jugador</h1>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudJugador">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudJugador" class="simple_form" id="defaultForm2"  method="post">
					<div class="row">
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_nonbre_filtro">NOMBRE</label>
							  	<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" >REGISTRA</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tableAlumno" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>Fecha nacimiento</th>
												<th>Sueldo</th>
												<th>Posicion</th>
												<th>Talla</th>
												<th>Email</th>
												<th>Equipo</th>
												<th>Actualiza</th>
												<th>Elimina</th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${jugadores}" var="x">
													<tr>
														<td>${x.idJugador}</td>
														<td>${x.nombre}</td>
														<td>${x.fechaNacimiento}</td>
														<td>${x.sueldo}</td>
														<td>${x.posicion}</td>
														<td>${x.talla}</td>
														<td>${x.email}</td>
														<td>${x.equipo.nombre}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idJugador}','${x.nombre}','${x.fechaNacimiento}','${x.sueldo}','${x.posicion}','${x.talla}','${x.email}','${x.equipo.idEquipo}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idJugador}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Jugador</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudJugador" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Jugador</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text">
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fechaNacimiento">Fecha nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_fechaNacimiento" name="fechaNacimiento" type="date">
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_sueldo">Sueldo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_sueldo" name="sueldo" placeholder="Ingrese el sueldo" type="text">
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_posicion">Posicion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_posicion" name="posicion" placeholder="Ingrese la posicion" type="text">
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_talla">Talla</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_talla" name="talla" placeholder="Ingrese la talla" type="text">
		                                        </div>
		                                    </div>   
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_email">Email</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_email" name="email" placeholder="Ingrese el email" type="text">
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_equipo">Equipo</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_equipo" name="equipo.idEquipo" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Jugador</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudJugador" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Jugador</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idJugador" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text">
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_fechaNacimiento">Fecha Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_fechaNacimiento" name="fechaNacimiento" type="date">
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_sueldo">Sueldo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_sueldo" name="sueldo" placeholder="Ingrese el sueldo" type="text">
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_posicion">Posicion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_posicion" name="posicion" placeholder="Ingrese la posicion" type="text">
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_talla">Talla</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_talla" name="talla" placeholder="Ingrese la talla" type="text">
		                                        </div>
		                                    </div>  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_email">Email</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_email" name="email" placeholder="Ingrese el email" type="text">
		                                        </div>
		                                    </div>  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_equipo">Equipo</label>
		                                        <div class="col-lg-5">
													<select id="id_act_equipo" name="equipo.idEquipo" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>

</div>

<script type="text/javascript">
$.getJSON("cargaEquipo", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_equipo").append("<option value="+item.idEquipo +">"+ item.nombre +"</option>");
		$("#id_act_equipo").append("<option value="+item.idEquipo +">"+ item.nombre +"</option>");
	});
	
});
</script>

<script type="text/javascript">
function eliminar(id){	
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,nombre,fechaNacimiento,sueldo,posicion,talla,email,idEquipo){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_nombre]').val(nombre);
	$('input[id=id_act_fechaNacimiento]').val(fechaNacimiento);
	$('input[id=id_act_sueldo]').val(sueldo);
	$('input[id=id_act_posicion]').val(posicion);
	$('input[id=id_act_talla').val(talla);
	$('input[id=id_act_email').val(email)
	$('select[id=id_act_equipo]').val(idEquipo);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tableAlumno').DataTable();
} );
</script>

<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_reg_nombre',
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
            "fechaNacimiento": {
        		selector : '#id_reg_fechaNacimiento',
                validators: {
                    notEmpty: {
                        message: 'La fecha de nacimiento es un campo obligatorio'
                    },
                }
            },
            "sueldo": {
        		selector : '#id_reg_sueldo',
                validators: {
                	notEmpty: {
                        message: 'El sueldo es un campo obligatorio'
                    },
                }
            },
            "posicion": {
        		selector : '#id_reg_posicion',
                validators: {
                	notEmpty: {
                        message: 'La posicion es un campo obligatorio'
                    },
                }
            },
            "talla": {
        		selector : '#id_reg_talla',
                validators: {
                	notEmpty: {
                        message: 'La talla es un campo obligatorio'
                    },
                }
            },
            "email": {
        		selector : '#id_reg_email',
                validators: {
                	notEmpty: {
                        message: 'El email es un campo obligatorio'
                    },
                }
            },
            "equipo.idEquipo": {
        		selector : '#id_reg_equipo',
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
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_act_nombre',
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
            "fechaNacimiento": {
        		selector : '#id_act_fechaNacimiento',
                validators: {
                    notEmpty: {
                        message: 'La fecha de nacimiento es un campo obligatorio'
                    },
                }
            },
            "sueldo": {
        		selector : '#id_act_sueldo',
                validators: {
                	notEmpty: {
                        message: 'El sueldo es un campo obligatorio'
                    },
                }
            },
            "posicion": {
        		selector : '#id_act_posicion',
                validators: {
                	notEmpty: {
                        message: 'La posicion es un campo obligatorio'
                    },
                }
            },
            "talla": {
        		selector : '#id_act_talla',
                validators: {
                	notEmpty: {
                        message: 'La talla es un campo obligatorio'
                    },
                }
            },
            "email": {
        		selector : '#id_act_email',
                validators: {
                	notEmpty: {
                        message: 'El email es un campo obligatorio'
                    },
                }
            },
            "equipo.idEquipo": {
        		selector : '#id_act_equipo',
                validators: {
                	notEmpty: {
                        message: 'El equipo es un campo obligatorio'
                    },
                }
            },
          
        }   
    });
</script>
    
</body>
</html> 