package oms.validator;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author angel
 */
public class Validator {

    //Setting patterns for each type that needs validation
    private String emailPattern = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}";
    private String namePattern = "([A-Z][a-z]*)+([\\s][A-Za-z]*)*";
    private String passwordPattern = "[a-zA-z0-9]+";
    private String phonePattern = "[0-9]{8,10}";
    private String titlePattern = "[A-Za-z0-9\\s]+";
    private String yearPattern = "[0-9]{4}(-[0-9]{4}){0,1}";
    private String genrePattern = "[A-Za-z]*";

    public Validator() {

    }

    //Method used to compare pattern of what has been given against the predefined pattern
    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }

    //Method used to validate email
    public boolean validateEmail(String email) {
        return validate(emailPattern, email);
    }

    //Method used to validate name
    public boolean validateName(String name) {
        return validate(namePattern, name);
    }

    //Method used to validate password
    public boolean validatePassword(String password) {
        return validate(passwordPattern, password);
    }

    //Method used to validate phone
    public boolean validatePhone(String phone) {
        return validate(phonePattern, phone);
    }

    //Method used to validate title
    public boolean validateTitle(String title) {
        return validate(titlePattern, title);
    }

    //Method used to validate year
    public boolean validateYear(String date) {
        return validate(yearPattern, date);
    }

    //Method used to validate genre
    public boolean validateGenre(String genre) {
        return validate(genrePattern, genre);
    }
}
