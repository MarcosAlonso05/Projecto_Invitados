package controlador;

import modelo.Invitado;
import modelo.Servicio;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ModificadorController")
public class ModificadorController extends HttpServlet {
    private Servicio servicio;

    @Override
    public void init() {
        servicio = new Servicio();
        servicio.connect();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("modificar".equals(action)) {
            String nombreActual = request.getParameter("nombreActual");
            String nuevoNombre = request.getParameter("nuevoNombre");

            if (nombreActual != null && !nombreActual.trim().isEmpty() &&
                    nuevoNombre != null && !nuevoNombre.trim().isEmpty()) {

                List<Invitado> invitados = servicio.getInvitadosByNombre(nombreActual);

                if (!invitados.isEmpty()) {
                    for (Invitado invitado : invitados) {
                        invitado.setNombre(nuevoNombre);
                        servicio.saveInvitado(invitado);
                    }
                    request.setAttribute("mensaje", "Invitado modificado con éxito: " + nombreActual + " → " + nuevoNombre);
                } else {
                    request.setAttribute("mensaje", "Error: No se encontró ningún invitado con el nombre '" + nombreActual + "'.");
                }
            } else {
                request.setAttribute("mensaje", "Error: Ambos campos son obligatorios.");
            }

            request.getRequestDispatcher("darModificacion.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
        servicio.disconnect();
    }
}