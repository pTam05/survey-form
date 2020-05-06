package assignment.three;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import org.hibernate.Session;
import org.hibernate.HibernateException;
import assignment.three.HibernateUtil;
import assignment.three.StudentBean;

/**
 * Class to insert and retrieve data to/from database.
 * 
 * @author parnavi
 *
 */
public class StudentDAO {

	Connection conn;

	@SuppressWarnings("unchecked")
	public ArrayList<String> getStudentIdList() throws IOException {
		ArrayList<String> studentsList = new ArrayList<String>();

		Session session = HibernateUtil.getSessionFactory().openSession();

		try {

			session.beginTransaction();
			studentsList = (ArrayList<String>) session.createQuery("SELECT studentID FROM StudentBean").list();
			session.getTransaction().commit();

		} catch (HibernateException ex) {

			ex.printStackTrace();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			session.close();
		}

		return studentsList;
	}

	@SuppressWarnings("unchecked")
	public StudentBean displaySurveyData(String str) throws IOException {
		ArrayList<StudentBean> studentsList = new ArrayList<StudentBean>();

		Session session = HibernateUtil.getSessionFactory().openSession();

		try {

			session.beginTransaction();
			studentsList = (ArrayList<StudentBean>) session
					.createQuery("FROM StudentBean WHERE studentID = '" + str.trim() + "'").list();
			session.getTransaction().commit();

		} catch (HibernateException ex) {

			ex.printStackTrace();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			session.close();
		}

		return studentsList.get(0);
	}

	public void writeToDB(StudentBean s) {
		Session session = HibernateUtil.getSessionFactory().openSession();

		try {
			session.beginTransaction();
			session.save(s);
			session.getTransaction().commit();
		} catch (HibernateException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
	}

}
