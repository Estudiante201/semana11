package com.redsocial.controlador;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.redsocial.entidad.Equipo;
import com.redsocial.entidad.Jugador;
import com.redsocial.servicio.EquipoServicio;
import com.redsocial.servicio.JugadorServicio;

@Controller
public class JugadorController {

	@Autowired
	private JugadorServicio jugadorServicio;
	
	@Autowired
	private EquipoServicio equipoServicio;

	@RequestMapping("/verJugador")
	public String ver() {
		return "registraJugador";
	}
	
	@RequestMapping("/cargaEquipo")
	@ResponseBody
	public List<Equipo> listaEquipo() {
		return equipoServicio.listaEquipo();
	}
	
	@RequestMapping("/registraJugador")
	public String metRegistra(Jugador obj,HttpSession session) {
		Jugador aux = jugadorServicio.insertaActualizaJugador(obj);
		if(aux == null) {
			session.setAttribute("MENSAJE", "Registro erróneo");
		}else {
			session.setAttribute("MENSAJE", "Registro exitos");
		}
		return "redirect:verJugador";
	}
}
