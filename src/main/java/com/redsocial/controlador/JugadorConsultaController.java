package com.redsocial.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redsocial.entidad.Jugador;
import com.redsocial.servicio.JugadorServicio;

@Controller
public class JugadorConsultaController {

	@Autowired
	private JugadorServicio servicio;
	
	@RequestMapping("/verConsultaJugador")
	public String ver() {
		return "consultaJugador";
	}
	
	@RequestMapping("/consultaJugador")
	public String lista(int idEquipo, String nombre, String posicion, Model m) {
		List<Jugador> lista =  servicio.listaJugador(idEquipo, nombre+"%", posicion);
		m.addAttribute("jugadores", lista);
		return "consultaJugador";
	}
}
