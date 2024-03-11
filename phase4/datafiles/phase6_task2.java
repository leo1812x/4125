package phase4.datafiles;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

public class phase6_task2 {
    public static void task2_1(){

        ArrayList<String> arrayID = new ArrayList<>();
        ArrayList<String> arrayNames = new ArrayList<>();

        try {
            //* Scan adresses
            Scanner adresses = new Scanner(new File("address_.txt"));
            while (adresses.hasNextLine()) {
                //* Reading the files line by line
                String adressLine = adresses.nextLine();

                //*every list as an array, clean spaces
                String[] dataAsList = adressLine.replaceAll(" ", "").split(",");

                //* if id not recorded, record
                if (!arrayID.contains(dataAsList[0])){
                    arrayID.add(dataAsList[0]);
                }
            }
            adresses.close();

            //* Scan employees
            Scanner employees = new Scanner(new File("employee_.txt"));
            while (employees.hasNextLine()){
                //* Reading the file line by line
                String employeeLine = employees.nextLine();

                //* every line as an array, clean spaces
                String[] dataAsList = employeeLine.split(", ");

                //* Get the name of each recorded ID
                if (arrayID.contains(dataAsList[0])){
                    arrayNames.add(dataAsList[1]);
                }
            }
            employees.close();

            arrayNames.forEach((value) -> System.out.println(value));

        }catch (IOException e) {
                System.out.println("file not found.");
        }
    }
    

    public static void task2_2(){

        //*key = id, value = hours */
        HashMap<String, Float> output = new HashMap<>();
        
        try {
            //* Scan timecards
            Scanner timecards = new Scanner(new File("timecard_.txt"));
            while (timecards.hasNextLine()){
                String timecardLine = timecards.nextLine();
                
                //* every line as an array, clean spaces
                String[] dataAsList = timecardLine.replaceAll(" ", "").split(",");

                //*if 
                if (!output.containsKey(dataAsList[0])){
                    output.put(dataAsList[0], Float.parseFloat(dataAsList[2]));
                }
                else{
                    output.put(dataAsList[0], output.get(dataAsList[0]) + Float.parseFloat(dataAsList[2]));
                }
            }
            timecards.close();


            output.forEach((key, value) -> System.out.println("Key: " + key + ", Value: " + value));

        } catch (Exception e) {
                System.out.println("file not found.");
        }
    }

    public static void main(String[] args) {
        task2_1();
        System.out.println("\n");
        task2_2();
    }

}





























