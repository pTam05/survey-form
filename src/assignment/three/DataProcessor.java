package assignment.three;

import java.lang.Math;

/**
 * Calculates mean and standard deviation.
 * 
 * @author parnavit
 *
 */

public class DataProcessor {

	int[] num = new int[200];
	int length = 0;

	public DataProcessor(String[] nums) {
		// TODO Auto-generated constructor stub
		int idx = 0;
		for (String i : nums) {
			num[idx++] = Integer.parseInt(i);
		}
		this.length = nums.length;
	}

	public double mean() {
		double sum = 0;

		for (int i = 0; i < this.length; i++) {
			sum += num[i];
		}
		double mean = sum / this.length;
		return mean;
	}

	public double standardDeviation(double mean) {
		double variance = 0;

		for (int i : num) {
			variance += Math.pow((i - mean), 2);
		}

		variance = variance / num.length;

		return Math.sqrt(variance);
	}
}
