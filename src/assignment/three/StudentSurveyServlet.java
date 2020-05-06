package assignment.three;

import java.util.*;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * This is the first servlet that is called when the student survey form is
 * submitted. It stores data into db and calls the class that calculate the mean
 * and std deviation. It then returns the page to be displayed based on the mean
 * value.
 * 
 * @author parnavit
 * 
 */

@WebServlet("/StudentSurveyServlet")
public class StudentSurveyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public StudentSurveyServlet() {
		System.out.println("Servlet initialized");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		StudentDAO studentDao = new StudentDAO();
		ArrayList<String> studentIDList = new ArrayList<String>();
		double mean = 0.0;
		double stdDev = 0.0;

		try {

			String findStudentID = request.getParameter("findStudentID");

			// Get student data from request parameters.

			if (findStudentID == null || findStudentID == "") {

				response.getWriter().append("Served at: ").append(request.getContextPath());
				response.setContentType("text/html");

				String fname = request.getParameter("fname");
				String lname = request.getParameter("lname");
				String address = request.getParameter("streetAddress");
				String zip = request.getParameter("zipcode");

				String city = request.getParameter("city");
				String state = request.getParameter("state");

				String phone = request.getParameter("phone");
				String email = request.getParameter("emailId");
				String url = request.getParameter("url");
				String dateOfSurvey = request.getParameter("dateOfSurvey");
				String[] interest = request.getParameterValues("favorite");
				String sourceInfo = request.getParameter("source");
				String gradMonth = request.getParameter("dateofgraduation");
				String gradYear = request.getParameter("yearofgraduation");
				String recommendation = request.getParameter("recommendation");
				String comments = request.getParameter("comments");
				String raffle = request.getParameter("raffle");
				String studentID = request.getParameter("studentID");

				String campusLike = "";
				for (String i : interest) {
					campusLike += i + ",";
				}

				StudentBean data = new StudentBean(studentID, fname, lname, address, Integer.parseInt(zip), city, state,
						Long.parseLong(phone), email, url, dateOfSurvey, campusLike, recommendation, sourceInfo,
						comments, raffle, gradMonth, gradYear);

				studentDao.writeToDB(data);

				studentIDList = studentDao.getStudentIdList();
				session.setAttribute("studentIDList", studentIDList);

				// Finding mean and standard deviation.
				String[] numbers = raffle.split(",");
				if (numbers.length >= 10) {
					DataProcessor dp = new DataProcessor(numbers);
					mean = dp.mean();
					stdDev = dp.standardDeviation(mean);

					DataBean dBean = new DataBean(mean, stdDev);
					session.setAttribute("statData", dBean);

					if (mean > 90) {
						request.getRequestDispatcher("/WinnerAcknowledgement.jsp").forward(request, response);
					} else {
						request.getRequestDispatcher("/SimpleAcknowledgement.jsp").forward(request, response);
					}
				} else {
					DataBean dBean = new DataBean(0.0, 0.0);
					session.setAttribute("statData", dBean);
					request.getRequestDispatcher("/SimpleAcknowledgement.jsp").forward(request, response);
				}

			} else {
				// Student ID found in query param. Display student record or error page.
				Object obj = new Object();
				obj = studentDao.displaySurveyData(findStudentID);

				if (obj != null) {
					session.setAttribute("studentBeanObj", obj);
					request.getRequestDispatcher("/surveyformoutput.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("/NoSuchStudentJSP.jsp").forward(request, response);
				}

			}

		} catch (ArrayIndexOutOfBoundsException aiobe) {
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
