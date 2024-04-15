import javax.swing.SwingUtilities;

import view.SSIS_Main_Display;

/**
 * Runs the SSIS app.
 *
 * @author Caine Ivan R. Bautista
 * @date March 28,2024
 */
public class Main {
     public static void main(String[] args) {
          try {
               SwingUtilities.invokeLater(SSIS_Main_Display::new);
          } catch (Exception e) {
               e.printStackTrace();
          }
     }
}