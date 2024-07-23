package org.sample;

import java.util.Scanner;

public class Sum {
    // Method to calculate the sum of an array of integers
    public int sumNum(int[] numbers) {
        int sum = 0;
        for (int number : numbers) {
            sum += number;
        }
        return sum;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the size of inputs: ");
        int n = scanner.nextInt();

        int[] numbers = new int[n];
        System.out.println("Enter the numbers:");

        // Read the inputs from the user
        for (int i = 0; i < n; i++) {
            numbers[i] = scanner.nextInt();
        }

        Sum sm = new Sum();
        int result = sm.sumNum(numbers);

        System.out.println("The sum of all inputs is: " + result);

        scanner.close();
    }
}
