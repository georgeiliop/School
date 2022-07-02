/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pada.maemovieproject;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author georg
 */
public class fileWriterClass {
    public String title;
    public String year;
    public String runTimeValue;
    public String directorValue;
    public String genre;
    public String allMoviesCount;
    fileWriterClass(String title, String year, String runTimeValue, String directorValue, String genre,String allMoviesCount){
        this.title=title;
        this.year=year;
        this.runTimeValue=runTimeValue;
        this.directorValue=directorValue;
        this.genre=genre;
        this.allMoviesCount=allMoviesCount;
    }
    
    public void writeToFile(){
        FileWriter writer = null;
        try {
            
            // ανοίγω συγκεκριμένο αρχείο που έρχεται από το movieUI και γράφω τα values που πέρασα από τα πεδία 
            File actionFile = new File(genre+".txt");
            writer = new FileWriter(actionFile,true);
            BufferedWriter actionWriter = new BufferedWriter(writer);
            actionWriter.write("Entry : " + allMoviesCount + " | ");
            actionWriter.write("Title : " + title + " | ");
            actionWriter.write("Runtime : " + runTimeValue + " | ");
            actionWriter.write("Director : " + directorValue);
            actionWriter.newLine();
            actionWriter.close();
            File actionData = new File(genre+"Data.txt");
            String numberOfMovies;
            String oldest;
            String newest;
            BufferedReader reader = new BufferedReader (new FileReader(actionData));
            numberOfMovies = reader.readLine();
            FileWriter writerData = new FileWriter(actionData);
            BufferedWriter actionDataWriter = new BufferedWriter(writerData);
            int numberOfMoviesNum = Integer.valueOf(numberOfMovies);
            numberOfMoviesNum = numberOfMoviesNum + 1;
            numberOfMovies = String.valueOf(numberOfMoviesNum);
            actionDataWriter.write(numberOfMovies);
            actionDataWriter.newLine();
            actionDataWriter.close();
            
        } catch (IOException ex) {
            Logger.getLogger(fileWriterClass.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                writer.close();
            } catch (IOException ex) {
                Logger.getLogger(fileWriterClass.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
