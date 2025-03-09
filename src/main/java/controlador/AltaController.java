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

@WebServlet("/AltaController")
public class AltaController extends HttpServlet {
    private Servicio servicio;

    @Override
    public void init() {
        servicio = new Servicio();
        servicio.connect();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("alta".equals(action)) {
            String nombre = request.getParameter("nombre");

            if (nombre != null && !nombre.trim().isEmpty()) {
                List<Invitado> invitados = servicio.getInvitadosByNombre(nombre);

                if (!invitados.isEmpty()) {
                    request.setAttribute("mensaje", "Error: El invitado con el nombre '" + nombre + "' ya está registrado.");
                } else {
                    Invitado nuevoInvitado = new Invitado(nombre);
                    servicio.saveInvitado(nuevoInvitado);
                    request.setAttribute("mensaje", "Invitado agregado con éxito: " + nombre);
                }
            } else {
                request.setAttribute("mensaje", "Error: El nombre no puede estar vacío.");
            }

            request.getRequestDispatcher("darAlta.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
        servicio.disconnect();
    }
}