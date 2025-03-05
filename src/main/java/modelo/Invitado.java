package modelo;

import jakarta.persistence.*;

@Entity(name = "INVITADO")
public class Invitado {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String nombre;

	public Invitado() {}

	public Invitado(String nombre) {
		this.nombre = nombre;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Override
	public String toString() {
		return "Invitado{" +
				"id=" + id +
				", nombre='" + nombre + '\'' +
				'}';
	}
}
