
package pada.maemovieproject;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
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
public class infoUI {
    infoUI() throws IOException{
        
        //copponents και styling
        JLabel h1 = new JLabel();
        h1.setText("APP INFORMATION");
        JLabel paragraph = new JLabel();
        paragraph.setText("⚫ This is a movie registering app developed as the final project for the Software Development Methologies lab");
        paragraph.setFont(new Font("Roboto",Font.BOLD,15));
        JLabel developerLabel = new JLabel();
        developerLabel.setText("⚫ It was developed by Giorgos Iliopoulos, AM 18390198 from 3/6/2022 to 6/6/2022");
        developerLabel.setFont(new Font("Roboto",Font.BOLD,15));
        JLabel paragraph2 = new JLabel();
        paragraph2.setText("⚫ Feel free to register your movies and keep track of what you have watched! 😊 🍿");
        paragraph2.setFont(new Font("Roboto",Font.BOLD,15));
        h1.setFont(new Font("Roboto",Font.BOLD,25));
        JButton closeButton = new JButton("Close about");
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
        //Πανελ για τις ταμπέλες
        JPanel infoPanel = new JPanel();
        infoPanel.setBackground(new Color(42,157,143));
        infoPanel.setBounds(100, 100, 100, 100);
        infoPanel.setVisible(true);
        infoPanel.setLayout(new BorderLayout());
        infoPanel.setSize(800,600);
        infoPanel.setBounds(100, 100, 100, 100);
        infoPanel.setLayout(new BoxLayout(infoPanel, BoxLayout.PAGE_AXIS));
        infoPanel.setBorder(BorderFactory.createTitledBorder(""));
        infoPanel.add(Box.createRigidArea(new Dimension(0,20)));
        // βάζω τα components στο panel
        infoPanel.add(h1);
        infoPanel.add(Box.createRigidArea(new Dimension(0,20)));
        infoPanel.add(paragraph);
        infoPanel.add(Box.createRigidArea(new Dimension(0,20)));
        infoPanel.add(developerLabel);
        infoPanel.add(Box.createRigidArea(new Dimension(0,20)));
        infoPanel.add(paragraph2);
        infoPanel.add(Box.createRigidArea(new Dimension(0,20)));
        infoPanel.add(closeButton);
        infoPanel.add(Box.createRigidArea(new Dimension(0,20)));
        paragraph2.setAlignmentX(Component.CENTER_ALIGNMENT);
        paragraph.setAlignmentX(Component.CENTER_ALIGNMENT);
        developerLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
        h1.setAlignmentX(Component.CENTER_ALIGNMENT);
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
        
        // frame
        JFrame infoFrame = new JFrame("About page");
        infoFrame.getContentPane().setBackground(new Color(31,52,61));
        infoFrame.setVisible(true);
        infoFrame.setLayout(new BorderLayout());
        infoFrame.setSize(1000,600);
        infoFrame.add(header,BorderLayout.NORTH);
        infoFrame.add(infoPanel, BorderLayout.CENTER);
        infoFrame.add(decorationRightLabel, BorderLayout.EAST);
        infoFrame.add(decorationLeftLabel, BorderLayout.WEST);
        infoFrame.add(footerPanel, BorderLayout.AFTER_LAST_LINE);
        closeButton.addActionListener (e -> {
            infoFrame.dispose();
        });
    }
}
