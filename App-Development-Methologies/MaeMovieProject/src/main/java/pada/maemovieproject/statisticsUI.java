package pada.maemovieproject;


import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;


/**
 *
 * @author georg
 */
public class statisticsUI  {
    
    statisticsUI(){
        
        try {
            //αρχεία που θα χρησιμοποιήσω
            File movieData = new File("allMovies.txt");
            File actionData = new File("ActionData.txt");
            File comedyData = new File("ComedyData.txt");
            File dramaData = new File("DramaData.txt");
            File horrorData = new File("HorrorData.txt");
            File fantasyData = new File("FantasyData.txt");
            
           // components και styling
            
            JLabel h1 = new JLabel();
            h1.setText("APP STATISTICS");
            h1.setFont(new Font("Roboto",Font.BOLD,25));
            JLabel numOfMoviesLabel = new JLabel();
            numOfMoviesLabel.setText("⚫ Number of registered movies in the app : ");
            numOfMoviesLabel.setFont(new Font("Roboto",Font.BOLD,20));
            JLabel numOfMovies;
            JButton closeButton = new JButton("Close Statistics");
            closeButton.setBackground(new Color(249,65,68));
            JLabel footer = new JLabel();
            JLabel appLabel = new JLabel();
            appLabel.setText("Movie Tracker App");
            appLabel.setForeground(new Color(253,252,220));
            appLabel.setFont(new Font("Roboto",Font.BOLD,25));
            footer.setText("@Giliop MAE lab project");
            footer.setForeground(new Color(253,252,220));
            
            BufferedImage decorationRight=ImageIO.read(new File("stripes.jpg"));
            JLabel decorationRightLabel = new JLabel(new ImageIcon(decorationRight));
            decorationRightLabel.setPreferredSize(new Dimension(80,20));
        
        
            BufferedImage decorationLeft=ImageIO.read(new File("stripes.jpg"));
            JLabel decorationLeftLabel= new JLabel(new ImageIcon(decorationLeft));
            decorationLeftLabel.setPreferredSize(new Dimension(80,20));
            
            BufferedReader allMoviesReader = new BufferedReader(new FileReader(movieData)); 
            BufferedReader actionReader = new BufferedReader(new FileReader(actionData));
            BufferedReader comedyReader = new BufferedReader(new FileReader(comedyData));
            BufferedReader dramaReader = new BufferedReader(new FileReader(dramaData));
            BufferedReader horrorReader = new BufferedReader(new FileReader(horrorData));
            BufferedReader fantasyReader = new BufferedReader(new FileReader(fantasyData));
            
            
            
            //Συνολικός αριθμός καταχωρημένων ταινιών
            numOfMovies = new JLabel();
            numOfMovies.setText(allMoviesReader.readLine());
            numOfMovies.setFont(new Font("Roboto",Font.BOLD,15));
            
            // Κατηγορία με τς περισσότερες ταινίες 
            JLabel genreLabel = new JLabel();
            genreLabel.setText("⚫ Genre with the most registered movies :");
            genreLabel.setFont(new Font("Roboto",Font.BOLD,20));
            JLabel genre = new JLabel();
            int numAction = Integer.valueOf(actionReader.readLine());
            int numComedy = Integer.valueOf(comedyReader.readLine());
            int numHorror = Integer.valueOf(horrorReader.readLine());        
            int numDrama = Integer.valueOf(dramaReader.readLine());  
            int numFantasy = Integer.valueOf(fantasyReader.readLine());
            actionReader.close();
            comedyReader.close();
            horrorReader.close();
            dramaReader.close();
            fantasyReader.close();
            int max=numAction;
            String genreName="Action";
           
            if(numHorror > max){
                max=numHorror;
                genreName="Horror";
            }
            if(numComedy > max){
                max=numComedy;
                genreName="Comedy";
            }
            if(numDrama > max){
                max=numDrama;
                genreName="Drama";
            }
            if(numFantasy > max){
                max=numFantasy;
                genreName="Fantasy";
            }
            genre.setText(genreName+" has the most movies with "+max+ " movies");
            genre.setFont(new Font("Roboto",Font.BOLD,15));
                    
                    
                    
            // παλαιότερη ταινία        
            JLabel oldestMovieLabel = new JLabel();
            oldestMovieLabel.setText("⚫ Oldest movie : ");
            oldestMovieLabel.setFont(new Font("Roboto",Font.BOLD,20));
            JLabel oldestMovie = new JLabel();
            String oldestYear= allMoviesReader.readLine();
            String oldestTitle=allMoviesReader.readLine();
            oldestMovie.setText("Title : "+ oldestTitle + "  ||  Year : " + oldestYear);
            oldestMovie.setFont(new Font("Roboto",Font.BOLD,15));
            
            // νεότερη ταινία 
            JLabel newestMovieLabel = new JLabel();
            newestMovieLabel.setText("⚫ Newest movie : ");
            newestMovieLabel.setFont(new Font("Roboto",Font.BOLD,20));
            JLabel newestMovie = new JLabel();
            String newestYear= allMoviesReader.readLine();
            String newestTitle=allMoviesReader.readLine();
            newestMovie.setText("Title : "+ newestTitle + "  ||  Year : " + newestYear);
            newestMovie.setFont(new Font("Roboto",Font.BOLD,15));
            allMoviesReader.close();
           
            //Πανελ για τις ταμπέλες
            JPanel statsPanel = new JPanel();
            statsPanel.setBackground(new Color(42,157,143));
            statsPanel.setBounds(100, 100, 100, 100);
            statsPanel.setVisible(true);
            statsPanel.setLayout(new BorderLayout());
            statsPanel.setSize(800,600);
            statsPanel.setBounds(100, 100, 100, 100);
            statsPanel.setLayout(new BoxLayout(statsPanel, BoxLayout.PAGE_AXIS));
            statsPanel.setBorder(BorderFactory.createTitledBorder(""));
            statsPanel.add(Box.createRigidArea(new Dimension(0,20)));
            // βάζω τα components στο panel 
            statsPanel.add(h1);
            statsPanel.add(Box.createRigidArea(new Dimension(0,20)));
            statsPanel.add(numOfMoviesLabel);
            statsPanel.add(numOfMovies);
            statsPanel.add(Box.createRigidArea(new Dimension(0,20)));
            statsPanel.add(genreLabel);
            statsPanel.add(genre);
            statsPanel.add(Box.createRigidArea(new Dimension(0,20)));
            statsPanel.add(oldestMovieLabel);
            statsPanel.add(oldestMovie);
            statsPanel.add(Box.createRigidArea(new Dimension(0,20)));
            statsPanel.add(newestMovieLabel);
            statsPanel.add(newestMovie);
            statsPanel.add(Box.createRigidArea(new Dimension(0,20)));
            statsPanel.add(closeButton);
            statsPanel.add(Box.createRigidArea(new Dimension(0,20)));
            h1.setAlignmentX(Component.CENTER_ALIGNMENT);
            numOfMoviesLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
            numOfMovies.setAlignmentX(Component.CENTER_ALIGNMENT);
            genreLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
            genre.setAlignmentX(Component.CENTER_ALIGNMENT);
            oldestMovieLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
            oldestMovie.setAlignmentX(Component.CENTER_ALIGNMENT);
            newestMovieLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
            newestMovie.setAlignmentX(Component.CENTER_ALIGNMENT);
            closeButton.setAlignmentX(Component.CENTER_ALIGNMENT);
            
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
            
            
            JFrame statsFrame = new JFrame("Stats page");
            statsFrame.getContentPane().setBackground(new Color(31,52,61));
            //statsFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            statsFrame.setVisible(true);
            statsFrame.setLayout(new BorderLayout());
            statsFrame.setSize(800,600);
            statsFrame.add(header,BorderLayout.NORTH);
            statsFrame.add(statsPanel, BorderLayout.CENTER);
            statsFrame.add(decorationRightLabel, BorderLayout.EAST);
            statsFrame.add(decorationLeftLabel, BorderLayout.WEST);
            statsFrame.add(footerPanel, BorderLayout.AFTER_LAST_LINE);
            
            
            closeButton.addActionListener (e -> {
                statsFrame.dispose();
            });
        } catch (IOException ex) {
            Logger.getLogger(statisticsUI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
