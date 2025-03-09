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

@WebServlet("/ConsultaController")
public class ConsultaController extends HttpServlet {
    private Servicio servicio;

    @Override
    public void init() {
        servicio = new Servicio();
        servicio.connect();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("consulta".equals(action)) {
            String nombre = request.getParameter("nombre");

            if (nombre != null && !nombre.trim().isEmpty()) {
                List<Invitado> invitados = servicio.getInvitadosByNombre(nombre);

                if (!invitados.isEmpty()) {
                    request.setAttribute("invitados", invitados);
                    request.setAttribute("nombre", nombre);
                } else {
                    request.setAttribute("mensaje", "No se encontró ningún invitado con el nombre '" + nombre + "'.");
                }
            } else {
                request.setAttribute("mensaje", "Error: Debe ingresar un nombre para realizar la consulta.");
            }

            request.getRequestDispatcher("darConsulta.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
        servicio.disconnect();
    }
}