package assignment.three;

import java.io.Serializable;
import javax.persistence.Id;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.UniqueConstraint;

/**
 * Holds all student data from the survey form.
 * 
 * @author parnavit
 *
 */

@Entity
@Table(name = "student", uniqueConstraints = { @UniqueConstraint(columnNames = "studentID") })
public class StudentBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 * Instance Variables
	 * 
	 */
	@Id
	String studentID;

	@Column(name = "firstname")
	private String firstName;

	@Column(name = "lastname")
	private String lastName;

	private String address;

	@Column(name = "zipcode")
	private int zip;

	private String city;
	private String state;

	@Column(name = "phoneNum")
	private long tel;
	private String email;
	private String url;

	@Column(name = "form_date")
	private String dateOfSurvey;

	@Column(name = "interestUniversity")
	private String info;

	@Column(name = "likeCampus_db")
	private String interest;

	@Column(name = "recommend")
	private String recommendation;

	private String comments;
	private String raffle;
	private String gradMonth;
	private String gradYear;

	public StudentBean() {
	}

	public StudentBean(String studentID, String firstName, String lastName, String address, int zip, String city,
			String state, long tel, String email, String url, String dateOfSurvey, String interest,
			String recommendation, String info, String comments, String raffle, String gradMonth, String gradYear) {
		super();
		this.studentID = studentID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.zip = zip;
		this.city = city;
		this.state = state;
		this.tel = tel;
		this.email = email;
		this.url = url;
		this.dateOfSurvey = dateOfSurvey;
		this.interest = interest;
		this.recommendation = recommendation;
		this.comments = comments;
		this.raffle = raffle;
		this.gradMonth = gradMonth;
		this.gradYear = gradYear;
		this.info = info;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the zip
	 */
	public int getZip() {
		return zip;
	}

	/**
	 * @param zip the zip to set
	 */
	public void setZip(int zip) {
		this.zip = zip;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}

	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * @return the date
	 */
	public String getDateOfSurvey() {
		return dateOfSurvey;
	}

	/**
	 * @param date the date to set
	 */
	public void setDateOfSurvey(String dateOfSurvey) {
		this.dateOfSurvey = dateOfSurvey;
	}

	/**
	 * @return the interest
	 */
	public String getInterest() {
		return interest;
	}

	/**
	 * @param interest the interest to set
	 */
	public void setInterest(String interest) {
		this.interest = interest;
	}

	/**
	 * @return the tel
	 */
	public long getTel() {
		return tel;
	}

	/**
	 * @param tel the tel to set
	 */
	public void setTel(long tel) {
		this.tel = tel;
	}

	/**
	 * @return the info
	 */
	public String getInfo() {
		return info;
	}

	/**
	 * @param info the info to set
	 */
	public void setInfo(String info) {
		this.info = info;
	}

	/**
	 * @return the recommendation
	 */
	public String getRecommendation() {
		return recommendation;
	}

	/**
	 * @param reccomendation the recommendation to set
	 */
	public void setRecommendation(String recommendation) {
		this.recommendation = recommendation;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	/**
	 * @return the raffle
	 */
	public String getRaffle() {
		return raffle;
	}

	/**
	 * @param raffle the raffle to set
	 */
	public void setRaffle(String raffle) {
		this.raffle = raffle;
	}

	public String getGradMonth() {
		return gradMonth;
	}

	public void setGradMonth(String gradMonth) {
		this.gradMonth = gradMonth;
	}

	public String getGradYear() {
		return gradYear;
	}

	public void setGradYear(String gradYear) {
		this.gradYear = gradYear;
	}

}
