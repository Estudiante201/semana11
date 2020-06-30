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
 <h2>Consulta de Jugador</h2>
		 <div class="col-md-23" >  
		       <form accept-charset="UTF-8"  action="consultaJugador" class="simple_form" id="defaultForm2"  method="post">
					<div class="row">
						<div class="col-md-3">	
								<select id="id_equipo" name="idEquipo" class='form-control'>
										<option value=" "> [ Seleccione Equipo ]</option>    
								</select>
						</div>
						<div class="col-md-3">
								<input class="form-control" id="id_nombre" name="nombre" placeholder="Ingrese el nombre" type="text">
						</div>
						<div class="col-md-3">
								<input class="form-control" id="id_posicion" name="posicion" placeholder="Ingrese la posicion" type="text">
						</div>
						<div class="col-md-3">
								<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
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
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
 </div>

<script type="text/javascript">
$.getJSON("cargaEquipo", {}, function(data){
	$.each(data, function(index,item){
		$("#id_equipo").append("<option value="+item.idEquipo +">"+ item.nombre +"</option>");
	});
});
</script>
    
</body>
</html> 