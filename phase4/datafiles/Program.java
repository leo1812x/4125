import java.io.*;
import java.util.*;


public class Program {

    // Method to read a file and process its contents
    public static void ReadAndWrite(String path, String outputpath){

        String formattedString = String.format("%s.txt", path);

        try {
            //* initialize file and fileReader
            Scanner myReader = new Scanner(new File(formattedString));

            try {
                //* initialize writer and its buffer
                BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(String.format("%s.sql", outputpath)));


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

                    //* add final string into SQL insert statement
                    String sqlString = String.format("INSERT INTO %s VALUES (%s);", path, finalString);

                    bufferedWriter.write(sqlString);
                    bufferedWriter.newLine();
                }
                //*once done with line, write "commit" at the end
                bufferedWriter.write("commit;");

                //* Closing the Scanner and BufferedWriter
                myReader.close();
                bufferedWriter.close();
            } catch (FileNotFoundException e) {
                System.out.println("An error occurred making a new file.");
            }
        } catch (IOException e) {
            System.out.println("file not found.");
        }
    }
    
    //*check data type
    private static String getDataType(String string) {
        try {
            Integer.parseInt(string);
            return string;
        } catch (NumberFormatException e) {
            try {
                Float.parseFloat(string);
                return string;
            } catch (NumberFormatException e2) {
                return string.compareTo("NULL") == 0 ? "NULL" : String.format("'%s'", string);
            }
        }
    }

    public static void main(String[] args) {
        String inputPath = args[0];
        ReadAndWrite(inputPath, args[1]);
    }
}

































