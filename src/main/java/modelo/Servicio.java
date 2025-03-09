package modelo;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

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
        Configuration config = new Configuration().configure();
        sessionFactory = config.buildSessionFactory();
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
