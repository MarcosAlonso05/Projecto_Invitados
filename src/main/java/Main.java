import modelo.Invitado;
import modelo.Servicio;

public class Main {
	public static void main(String[] args) {
		Servicio servicio = new Servicio();
		servicio.connect();

		Invitado invitado = new Invitado("Nya~");
		servicio.saveInvitado(invitado);
		System.out.println(invitado);
//
//		invitado = new Invitado("bb");
//		servicio.saveInvitado(invitado);
//		System.out.println(invitado);

		Invitado i = servicio.getInvitado(1);
		System.out.println(i);
		i.setNombre("Miau");
		servicio.saveInvitado(i);

		System.out.println(servicio.getInvitadosByNombre("aa"));

		servicio.disconnect();
	}
}
