package Phase1;
import java.io.*;
import java.util.*; 

public class Phase1 {

    // Method to read a file and process its contents
    public static void readFile(String path){
        try {
            //* initialize file and fileReader
            Scanner myReader = new Scanner(new File(path));

            try {
                //* initialize writer and its buffer
                BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter("output.txt"));


                //* Reading the file line by line
                while (myReader.hasNextLine()) {
                    String data = myReader.nextLine();
                    String[] temp = data.split(",");
                    ArrayList<String> finalLine = new ArrayList<String>();
                    
                    //* Iterating over each part of the line
                    for (String string : temp) {
                        string = string.trim();
                        finalLine.add(getDataType(string));
                    }

                    //* Joining the processed data with commas and writing to file
                    String finalString = String.join(",", finalLine);
                    bufferedWriter.write(finalString);
                    bufferedWriter.newLine();
                }
                //* Closing the Scanner and BufferedWriter
                myReader.close();
                bufferedWriter.close();
            } catch (FileNotFoundException e) {
                System.out.println("file not found.");
            }
        } catch (IOException e) {
            System.out.println("An error occurred making a new file.");
        }
    }
    
    private static String getDataType(String string) {
        try {
            Integer.parseInt(string);
            return "Integer";
        } catch (NumberFormatException e) {
            try {
                Float.parseFloat(string);
                return "Float";
            } catch (NumberFormatException e2) {
                return "String";
            }
        }
    }

    public static void main(String[] args) {
        readFile("phase1_spring2024.txt");
    }
}

































