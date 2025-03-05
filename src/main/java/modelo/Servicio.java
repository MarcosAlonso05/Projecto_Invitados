package modelo;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 * Esta clase se encarga de mantener la conexión con la base de datos y de manejar las transacciones con dicha base de
 * datos.
 */

public class Servicio {
    private SessionFactory sessionFactory;
    private Session session;
}
