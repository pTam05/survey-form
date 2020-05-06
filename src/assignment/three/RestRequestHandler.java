/**
 * 
 */
package assignment.three;

import java.io.IOException;
import java.util.ArrayList;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;

import assignment.three.StudentBean;

/**
 * @author parnavi
 *
 */

@Path("/studentdata")
public class RestRequestHandler {

	public RestRequestHandler() {
	}

	@GET
	@Path("/list")
	@Produces(MediaType.APPLICATION_JSON)
	public String getGnumberList() {

		ArrayList<String> studentIDList = new ArrayList<String>();
		StudentDAO studentDao = new StudentDAO();

		try {
			studentIDList = studentDao.getStudentIdList();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String retJson = new Gson().toJson(studentIDList);
		return retJson;
	}

	@GET
	@Path("/record/{sid}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getStudentInfo(@PathParam("sid") String studentID) {

		Object obj = new Object();
		StudentDAO studentDao = new StudentDAO();

		try {
			obj = studentDao.displaySurveyData(studentID);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String retJson = new Gson().toJson(obj);
		return retJson;
	}

//	@POST
//	@Path("/save")
//	@Consumes("application/x-www-form-urlencoded")
//	public StudentBean save(@FormParam("studentID") String studentID, @FormParam("firstName") String fname,
//			@FormParam("lastName") String lname, @FormParam("streetAddress") String address,
//			@FormParam("city") String city, @FormParam("state") String state, @FormParam("zip") String zip,
//			@FormParam("phone") String phone, @FormParam("email") String email, @FormParam("url") String url,
//			@FormParam("dateOfSurvey") String dateOfSurvey, @FormParam("campusLike") String campusLike,
//			@FormParam("recommend") String recommendation, @FormParam("intrest") String sourceInfo,
//			@FormParam("year") String gradYear, @FormParam("month") String gradMonth,
//			@FormParam("datafield") String raffle, @FormParam("comments") String comments) {
//
//		StudentDAO studentDao = new StudentDAO();
//
//		StudentBean data = new StudentBean(studentID, fname, lname, address, Integer.parseInt(zip), city, state,
//				Long.parseLong(phone), email, url, dateOfSurvey, campusLike, recommendation, sourceInfo, comments,
//				raffle, gradMonth, gradYear);
//
//		studentDao.writeToDB(data);
//
//		return data;
//	}

	@POST
	@Path("/save")
	@Consumes("application/x-www-form-urlencoded")
	public StudentBean save(@FormParam("studentID") String studentID, @FormParam("firstName") String fname,
			@FormParam("lastName") String lname, @FormParam("streetAddress") String address,
			@FormParam("city") String city, @FormParam("state") String state, @FormParam("zip") String zip,
			@FormParam("phoneNumber") String phone, @FormParam("email") String email, @FormParam("url") String url,
			@FormParam("dateOfSurvey") String dateOfSurvey, @FormParam("campusLike") String campusLike,
			@FormParam("recommend") String recommendation, @FormParam("intrest") String sourceInfo,
			@FormParam("year") String gradYear, @FormParam("month") String gradMonth,
			@FormParam("datafield") String raffle, @FormParam("comments") String comments) {

		StudentDAO studentDao = new StudentDAO();

		StudentBean data = new StudentBean(studentID, fname, lname, address, Integer.parseInt(zip), city, state,
				Long.parseLong(phone), email, url, dateOfSurvey, campusLike, recommendation, sourceInfo, comments,
				raffle, gradYear, gradMonth);

		studentDao.writeToDB(data);

		return data;
	}

}
