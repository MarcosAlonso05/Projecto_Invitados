import modelo.Invitado;
import modelo.Servicio;

public class Main {
	public static void main(String[] args) {
		Servicio servicio = new Servicio();
		servicio.connect();

//		Invitado invitado = new Invitado("aa");
//		servicio.saveInvitado(invitado);
//		System.out.println(invitado);
//
//		invitado = new Invitado("bb");
//		servicio.saveInvitado(invitado);
//		System.out.println(invitado);

		System.out.println(servicio.getInvitado(1));
		System.out.println(servicio.getInvitadosByNombre("aa"));

		servicio.disconnect();
	}
}
