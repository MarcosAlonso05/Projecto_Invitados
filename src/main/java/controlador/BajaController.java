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

@WebServlet("/BajaController")
public class BajaController extends HttpServlet {
    private Servicio servicio;

    @Override
    public void init() {
        servicio = new Servicio();
        servicio.connect();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("baja".equals(action)) {
            String nombre = request.getParameter("nombre");

            if (nombre != null && !nombre.trim().isEmpty()) {
                List<Invitado> invitados = servicio.getInvitadosByNombre(nombre);

                if (invitados != null && !invitados.isEmpty()) {
                    for (Invitado invitado : invitados) {
                        servicio.deleteInvitado(invitado.getId());
                    }
                    request.setAttribute("mensaje", "Invitado(s) eliminado(s) con éxito: " + nombre);
                } else {
                    request.setAttribute("mensaje", "Error: No se encontró ningún invitado con el nombre '" + nombre + "'.");
                }
            } else {
                request.setAttribute("mensaje", "Error: El nombre no puede estar vacío.");
            }

            request.getRequestDispatcher("resultado.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
        servicio.disconnect();
    }
}