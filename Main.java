import model.Data_Manager;
import view.Login_Dialog;

/**
 * Runs the SSIS app.
 *
 * @author Caine Ivan R. Bautista
 * @date March 28,2024
 */
public class Main {
     public static void main(String[] args) {
          try {
               new Data_Manager();
               new Login_Dialog("You want Access???").setVisible(true);
          } catch (Exception e) {
               e.printStackTrace();
          }
     }
}