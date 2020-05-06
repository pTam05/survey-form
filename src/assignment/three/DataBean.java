package assignment.three;
import java.io.Serializable;

/**
 * Holds mean and standard deviation values calculated from raffle input.
 * 
 * @author parnavit
 *
 */

public class DataBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private Double mean;
	private Double stdDev;

	public DataBean() {
		
	}
	
	public DataBean(Double mean, Double stdDev) {
		super();
		this.mean = mean;
		this.stdDev = stdDev;
	}

	/**
	 * @return the mean
	 */
	public Double getMean() {
		return mean;
	}

	/**
	 * @param mean the mean to set
	 */
	public void setMean(Double mean) {
		this.mean = mean;
	}

	/**
	 * @return the stdDev
	 */
	public Double getStdDev() {
		return stdDev;
	}

	/**
	 * @param stdDev the stdDev to set
	 */
	public void setStdDev(Double stdDev) {
		this.stdDev = stdDev;
	}

}
