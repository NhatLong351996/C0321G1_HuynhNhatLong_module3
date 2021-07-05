package com.company;

import java.security.NoSuchAlgorithmException;
import java.util.Scanner;

public class Calculation {
    public static void main(String[] args) throws NoSuchAlgorithmException {
        Scanner scanner = new Scanner(System.in);
        boolean check;
        while (true) {
            System.out.println("Enter first number: ");
            int a = scanner.nextInt();
            System.out.println("Enter second number: ");
            int b = scanner.nextInt();
            do {
                System.out.println("----Calculator---");
                System.out.println("Choose the math: \n" +
                        "1. Addition\n" +
                        "2. Subtraction\n" +
                        "3. Multiplication\n" +
                        "4. Division.\n" +
                        "5. Back\n");
                String input = scanner.next();
                check = true;
                switch (input) {
                    case "1":
                        System.out.println("Result: " + a + " + " + b + " = " + sum(a, b));
                        break;
                    case "2":
                        System.out.println("Result: " + a + " - " + b + " = " + sub(a, b));
                        break;
                    case "3":
                        System.out.println("Result: " + a + " x " + b + " = " + mul(a, b));
                        break;
                    case "4":
                        System.out.println("Result: " + a + " : " + b + " = " + divide(a, b));
                        break;
                    case "5":
                        check = true;
                        break;
                    default:
                        System.err.println("Enter again!");
                        check = false;
                        break;
                }
            } while (!check);
        }
    }


    public static int sum(int a, int b) {
        return a + b;
    }

    public static int sub(int a, int b) {
        return a - b;
    }

    public static int mul(int a, int b) {
        return a * b;
    }

    public static int divide(int a, int b) throws NoSuchAlgorithmException {
        if (b == 0) {
            throw new NoSuchAlgorithmException();
        }
        return a / b;
    }
}


