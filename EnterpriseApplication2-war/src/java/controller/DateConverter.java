package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConverter {

    public static String convertDate(String inputDate) {
        try {
            // Parse the input date
            SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date date = inputFormat.parse(inputDate);

            // Format the date to the desired output format
            SimpleDateFormat outputFormat = new SimpleDateFormat("MMMM d yyyy");
            return outputFormat.format(date);
        } catch (ParseException e) {
            // Handle parsing exception if needed
            e.printStackTrace();
            return null;
        }
    }
}
