package assignment.three;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 * 
 * Utility methods for creating session factory and session objects
 * 
 */

public class HibernateUtil {
	private static SessionFactory sessionFactory;

	// static block to initialize Hibernate configuration. Configuration is picked
	// up from hibernate.cfg.xml
	static {
		try {
			if (sessionFactory == null) {
				Configuration config = new Configuration();
				config.addAnnotatedClass(assignment.three.StudentBean.class);
				config.configure();

				StandardServiceRegistryBuilder serviceRegistryBuilder = new StandardServiceRegistryBuilder();
				serviceRegistryBuilder.applySettings(config.getProperties());

				ServiceRegistry serviceRegistry = serviceRegistryBuilder.build();

				sessionFactory = config.buildSessionFactory(serviceRegistry);
			}

		} catch (Throwable ex) {
			System.out.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	// close cache and connection pool
	public static void shutdown() {
		getSessionFactory().close();
	}
}
