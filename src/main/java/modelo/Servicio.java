package modelo;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.spi.ServiceException;

import java.util.List;

/**
 * Esta clase se encarga de mantener la conexión con la base de datos y de manejar las transacciones con dicha base de
 * datos.
 */

public class Servicio {
    private SessionFactory sessionFactory;
    private Session session;

    public Servicio() {}

    public void connect() {
        if(System.getenv("DATABASE_URL") == null || System.getenv("DATABASE_URL").isEmpty()) {
            throw new RuntimeException("No se ha especificado url de conexión para la base de datos (variable de entorno DATABASE_URL).");
        }
        if(System.getenv("DATABASE_USER") == null || System.getenv("DATABASE_USER").isEmpty()) {
            throw new RuntimeException("No se ha especificado usuario para la base de datos (variable de entorno DATABASE_USER).");
        }
        if(System.getenv("DATABASE_PASSWORD") == null || System.getenv("DATABASE_PASSWORD").isEmpty()) {
            throw new RuntimeException("No se ha especificado contraseña para la base de datos (variable de entorno DATABASE_PASSWORD).");
        }
        Configuration config = new Configuration().configure();

        config.setProperty("hibernate.connection.username", System.getenv("DATABASE_USER"));
        config.setProperty("hibernate.connection.password", System.getenv("DATABASE_PASSWORD"));
        config.setProperty("hibernate.connection.url", System.getenv("DATABASE_URL"));
        try {
            sessionFactory = config.buildSessionFactory();
        }catch(ServiceException e) {
            throw new RuntimeException("La url o contraseña para la base de datos es incorrecta.");
        }
        session = sessionFactory.openSession();
    }

    public void saveInvitado(Invitado invitado) {
        Transaction t = session.beginTransaction();
        session.persist(invitado);
        session.flush();
        t.commit();
    }

    public Invitado getInvitado(int id) {
		return (Invitado) session.byId(Invitado.class).load(id);
    }

    public List<Invitado> getInvitados() {
        return session.createQuery("from INVITADO", Invitado.class).getResultList();
    }

    public List<Invitado> getInvitadosByNombre(String nombre) {
        return session.createQuery("from INVITADO where nombre = :nombre", Invitado.class).setParameter("nombre", nombre).getResultList();
    }

    /**
     * Elimina un invitado de la base de datos.
     *
     * @param id Id del invitado a eliminar
     * @return `true` si se ha podido eliminar. `false` si no.
     */
    public boolean deleteInvitado(int id) {
        Transaction t = session.beginTransaction();
        Invitado invitado = (Invitado) session.get(Invitado.class, id);
        if(invitado == null) return false;

        session.remove(invitado);
        session.flush();
        t.commit();
        return true;
    }

    public void disconnect() {
        session.close();
        sessionFactory.close();
    }
}
