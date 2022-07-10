/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pada.maemovieproject;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
/**
 *
 * @author georg
 */
public class movieUI {
    
    // components που θα χρησιμοποιήσω
        JLabel appLabel = new JLabel();
        JTextField movieTitle = new JTextField();
        JLabel footer = new JLabel();
        JLabel movieNo = new JLabel();
        JLabel movieTitleLabel = new JLabel();
        JLabel movieYearLabel = new JLabel();
        JLabel runtimeLabel = new JLabel();
        JLabel directorLabel = new JLabel();
        JLabel warning = new JLabel();
        JButton saveButton = new JButton("Save");
        JButton statisticsButton = new JButton("Statistics");
        JButton infoButton = new JButton("About");
        JButton closeButton = new JButton("Close App");
        JTextField movieYear = new JTextField();
        JTextField runtime = new JTextField();
        JTextField director = new JTextField();
        String[] genres = {"(--Select a genre--)","Action","Comedy","Horror","Fantasy","Drama"};
        JComboBox genreBox = new JComboBox(genres);
        
        String numOfMoviesInitial;
        int numOfMoviesInitialInt;
        BufferedReader moviereaderInitial;
       
    movieUI () throws IOException {
        
        // Counter για την επόμενη ταινία που θα γίνει register ( για τον κωδικό ταινίας κατά την εγγραφή της και το display πάνω στην εφαρμγή)
        File allMoviesInitial = new File("allMovies.txt");
            try {
                this.moviereaderInitial = new BufferedReader (new FileReader(allMoviesInitial));
            } catch (FileNotFoundException ex) {
                Logger.getLogger(movieUI.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                numOfMoviesInitial = moviereaderInitial.readLine();
                numOfMoviesInitialInt=Integer.valueOf(numOfMoviesInitial);
                numOfMoviesInitialInt= numOfMoviesInitialInt+1;
                numOfMoviesInitial=String.valueOf(numOfMoviesInitialInt);
            } catch (IOException ex) {
                Logger.getLogger(movieUI.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        // Βάζω κείμενο και styling στα components
        movieNo.setText(" MOVIE ENTRY CODE "+numOfMoviesInitial);
        movieNo.setFont(new Font("Roboto",Font.BOLD,20));
        
        
        BufferedImage decorationRight=ImageIO.read(new File("stripes.jpg"));
        JLabel decorationRightLabel = new JLabel(new ImageIcon(decorationRight));
        decorationRightLabel.setPreferredSize(new Dimension(80,20));
        
        
        BufferedImage decorationLeft=ImageIO.read(new File("stripes.jpg"));
        JLabel decorationLeftLabel= new JLabel(new ImageIcon(decorationLeft));
        decorationLeftLabel.setPreferredSize(new Dimension(80,20));
        
        
        movieTitleLabel.setText("Movie title :");
        movieTitleLabel.setFont(new Font("Roboto",Font.BOLD,15));
        
        movieYearLabel.setText("Release Year :");
        movieYearLabel.setFont(new Font("Roboto",Font.BOLD,15));
        
        runtimeLabel.setText("Runtime (in minutes):");
        runtimeLabel.setFont(new Font("Roboto",Font.BOLD,15));
        
        
        directorLabel.setText("Director :");
        directorLabel.setFont(new Font("Roboto",Font.BOLD,15));
        
        
        
        movieTitle.setPreferredSize(new Dimension (800,35));
        movieTitle.setMaximumSize(movieTitle.getPreferredSize());
        
        
        movieYear.setPreferredSize(new Dimension (800,35));
        movieYear.setMaximumSize(movieTitle.getPreferredSize());
        
        
        runtime.setPreferredSize(new Dimension (800,35));
        runtime.setMaximumSize(movieTitle.getPreferredSize());
        
       
        director.setPreferredSize(new Dimension (800,35));
        director.setMaximumSize(movieTitle.getPreferredSize());
        
        
        genreBox.setPreferredSize(new Dimension (800,35));
        genreBox.setMaximumSize(movieTitle.getPreferredSize());
        
        saveButton.setBackground(new Color(233,196,106));
        saveButton.setPreferredSize(new Dimension(130,35));
        saveButton.setFont(new Font("Roboto",Font.BOLD,14));
        statisticsButton.setBackground(new Color(244,162,97));
        statisticsButton.setPreferredSize(new Dimension(130,35));
        statisticsButton.setFont(new Font("Roboto",Font.BOLD,14));
        infoButton.setBackground(new Color(231,111,81));
        infoButton.setPreferredSize(new Dimension(130,35));
        infoButton.setFont(new Font("Roboto",Font.BOLD,14));
        closeButton.setBackground(new Color(249,65,68));
        appLabel.setText("Movie Tracker App");
        appLabel.setForeground(new Color(253,252,220));
        appLabel.setFont(new Font("Roboto",Font.BOLD,25));
        footer.setText("@Giliop MAE lab project");
        footer.setForeground(new Color(253,252,220));
        
        // Πανελ για τα κουμπιά ( για να έχουν FlowLayout)
        JPanel buttonsPanel = new JPanel();
        buttonsPanel.setBackground(new Color(42,157,143)); 
        buttonsPanel.setBounds(30, 30, 30, 30);
        buttonsPanel.setLayout(new FlowLayout(FlowLayout.CENTER));
        buttonsPanel.add(saveButton);
        buttonsPanel.add(statisticsButton);
        buttonsPanel.add(infoButton);
        buttonsPanel.add(closeButton);
        
        //πανελ header
        JPanel header = new JPanel();
        header.setBackground(new Color(21,37,44));
        header.setPreferredSize(new Dimension(100,60));
        header.add(appLabel);
        
         // Panel footer
        JPanel footerPanel = new JPanel();
        footerPanel.setBackground(new Color(21,37,44));
        footerPanel.setPreferredSize(new Dimension(100,60));
        footerPanel.add(footer);
        
        // Το πάνελ για τα στοιχεία της εφαργμογής 
        JPanel mainFramePanel = new JPanel();
        mainFramePanel.setBackground(new Color(42,157,143));
        mainFramePanel.setBounds(100, 100, 100, 100);
        mainFramePanel.setLayout(new BoxLayout(mainFramePanel, BoxLayout.PAGE_AXIS));
        mainFramePanel.setBorder(BorderFactory.createTitledBorder(""));
        mainFramePanel.add(Box.createRigidArea(new Dimension(0,20)));
        mainFramePanel.add(movieNo);
        movieNo.setAlignmentX(Component.CENTER_ALIGNMENT);
        //mainFramePanel.setAlignmentX(Component.CENTER_ALIGNMENT);
        mainFramePanel.add(Box.createRigidArea(new Dimension(0,10)));
        mainFramePanel.add(movieTitleLabel);
        mainFramePanel.add(movieTitle);
        mainFramePanel.add(Box.createRigidArea(new Dimension(0,10)));
        mainFramePanel.add(movieYearLabel);
        mainFramePanel.add(movieYear);
        mainFramePanel.add(Box.createRigidArea(new Dimension(0,10)));
        mainFramePanel.add(runtimeLabel);
        mainFramePanel.add(runtime);
        mainFramePanel.add(Box.createRigidArea(new Dimension(0,10)));
        mainFramePanel.add(directorLabel);
        mainFramePanel.add(director);
        mainFramePanel.add(Box.createRigidArea(new Dimension(0,20)));
        mainFramePanel.add(genreBox);
        mainFramePanel.add(Box.createRigidArea(new Dimension(0,20)));
        mainFramePanel.add(buttonsPanel);
        mainFramePanel.add(warning);
        warning.setAlignmentX(Component.CENTER_ALIGNMENT);
        movieYearLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
        movieYear.setAlignmentX(Component.CENTER_ALIGNMENT);
        movieTitleLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
        movieTitle.setAlignmentX(Component.CENTER_ALIGNMENT);
        runtimeLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
        runtime.setAlignmentX(Component.CENTER_ALIGNMENT);
        directorLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
        director.setAlignmentX(Component.CENTER_ALIGNMENT);
        
        
        // Main Frame
        JFrame frame = new JFrame("Movie app");
        frame.getContentPane().setBackground(new Color(31,52,61));
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
        frame.setLayout(new BorderLayout());
        frame.setSize(1000,700);
        frame.add(header,BorderLayout.NORTH);
        frame.add(mainFramePanel, BorderLayout.CENTER);
        frame.add(decorationRightLabel, BorderLayout.EAST);
        frame.add(decorationLeftLabel, BorderLayout.WEST);
        frame.add(footerPanel, BorderLayout.AFTER_LAST_LINE);
        
        
        // save button action listener
        saveButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    // παίρνω τα values από τα πεδία
                    String title = movieTitle.getText();
                    String year = movieYear.getText();
                    String runtimeValue = runtime.getText();
                    String directorValue = director.getText();
                    String genre = genreBox.getSelectedItem().toString();
                    
                    //έλεγχος για το αν είναι συμπληρωμένα τα πεδία 
                    if (!title.equals("") && !year.equals("") && !runtimeValue.equals("") && !directorValue.equals("") && !genre.equals("(--Select a genre--)")){
                        File allMovies = new File("allMovies.txt");
                        
                        //πρόσθεση στις συνολικές ταινίες
                        String allMoviesCount;
                        String countForLabel;
                        BufferedReader moviereader = new BufferedReader (new FileReader(allMovies));
                        allMoviesCount = moviereader.readLine();


                        FileWriter moviewriter = new FileWriter(allMovies);
                        BufferedWriter bmoviewriter = new BufferedWriter(moviewriter);


                        int numberOfMoviesNum = Integer.valueOf(allMoviesCount);
                        numberOfMoviesNum = numberOfMoviesNum + 1;
                        allMoviesCount = String.valueOf(numberOfMoviesNum);
                        bmoviewriter.write(allMoviesCount);
                        bmoviewriter.newLine();   

                        countForLabel = String.valueOf(numberOfMoviesNum + 1);


                        //καλώ την κλάση fileWriterClass που γράφει τις ταινίες στα αρχεία 
                        fileWriterClass fileWriter = new fileWriterClass(title,year,runtimeValue,directorValue,genre,allMoviesCount);
                        fileWriter.writeToFile(); 
                        movieNo.setText("MOVIE ENTRY CODE " + countForLabel);
                        
                        
                        // έλεγχοι και setting του oldest και newest movie 
                        String oldestMovie = moviereader.readLine();
                        String oldestMovieTitle = moviereader.readLine();
                        String newestMovie = moviereader.readLine();
                        String newestMovieTitle = moviereader.readLine();
                         if(!oldestMovie.equals("")){
                             int oldestMovieInt = Integer.valueOf(oldestMovie);
                             int yearInt = Integer.valueOf(year);
                             int newestMovieInt = Integer.valueOf(newestMovie);  
                             if (yearInt <= oldestMovieInt) {
                                oldestMovieInt=yearInt;
                                year=String.valueOf(oldestMovieInt);
                                bmoviewriter.write(year);
                                bmoviewriter.newLine();
                                bmoviewriter.write(title);
                                bmoviewriter.newLine();
                                bmoviewriter.write(newestMovie);
                                bmoviewriter.newLine();
                                bmoviewriter.write(newestMovieTitle);
                                bmoviewriter.newLine();
                                bmoviewriter.close();
                            }else  if (yearInt >= newestMovieInt) {
                                newestMovieInt=yearInt;
                                year=String.valueOf(newestMovieInt);
                                bmoviewriter.write(oldestMovie);
                                bmoviewriter.newLine();
                                bmoviewriter.write(oldestMovieTitle);
                                bmoviewriter.newLine();
                                bmoviewriter.write(year);
                                bmoviewriter.newLine();
                                bmoviewriter.write(title);
                                bmoviewriter.newLine();
                                bmoviewriter.close();
                            } else {
                                bmoviewriter.write(oldestMovie);
                                bmoviewriter.newLine();
                                bmoviewriter.write(oldestMovieTitle);
                                bmoviewriter.newLine();
                                bmoviewriter.write(newestMovie);
                                bmoviewriter.newLine();
                                bmoviewriter.write(newestMovieTitle);
                                bmoviewriter.newLine();
                                bmoviewriter.close();
                            }
                         }
                         
                        // Καθάριση των πεδίων 
                        
                        movieTitle.setText("");
                        movieYear.setText("");
                        runtime.setText("");
                        director.setText("");
                        
                        bmoviewriter.close();
                        moviereader.close();
                        warning.setText("");
                    }else {
                    // προηδοποίηση αν δεν είναι όλα τα πεδία συμπληρωμένα 
                     warning.setText("All fields must be filled");
                     warning.setForeground(new Color(178,11,28));
                       
                    }
                    
                 
                } catch (IOException ex) {
                    Logger.getLogger(MaeMovieProject.class.getName()).log(Level.SEVERE, null, ex);
                }
                }
        });
        
        statisticsButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //κλήση κλάσης για statistics UI
                  statisticsUI statsUI = new statisticsUI();
            }        
            });
        
        infoButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                
                try {
                    
                    //κλήση κλάσης για info UI
                    infoUI infoUi = new infoUI();
                } catch (IOException ex) {
                    Logger.getLogger(movieUI.class.getName()).log(Level.SEVERE, null, ex);
                }
            }        
            });
                
        closeButton.addActionListener (e -> {
            
            //κλήσιμο εφαρμοφής με το close button
                frame.dispose();
            });
        
        
    }}
