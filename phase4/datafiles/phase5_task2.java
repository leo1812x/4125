package phase4.datafiles;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

public class phase5_task2 {

    public static String task2(){
        String[] HighestPaid = {"","","0"};

        try {
            //* initialize file and fileReader
            Scanner myReader = new Scanner(new File("position_.txt"));


                //* Reading the file line by line
                while (myReader.hasNextLine()) {

                    //* Reading the file line by line
                    String data = myReader.nextLine();
                    //* split the line so list[0] = positionID, list[1] = positionName, list[2] = salary
                    String[] list = data.replaceAll(" ", "").split(",");

                    //*find the Highest paid position */
                    HighestPaid = Integer.parseInt(list[2]) > Integer.parseInt(HighestPaid[2]) ? list : HighestPaid;
                    
                }
                //* Closing the Scanner and BufferedWriter
                myReader.close();
            }catch (IOException e) {
                System.out.println("file not found.");
            }
            return HighestPaid[1];
        }



    public static void main(String[] args) {
        System.out.println("The highest paid position is: " + task2());
    }
}
