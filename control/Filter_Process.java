package control;

import javax.swing.JTable;
import javax.swing.RowFilter;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableRowSorter;

/**
 * Facilitates the filtering of rows based on the inputs.
 */
public class Filter_Process {
     private static DefaultTableModel def_model;
     private static TableRowSorter<DefaultTableModel> row_sorter;

     public Filter_Process() {
     }

     /**
      * Filter the tables based on a regex following the parameter.
      * 
      * @param table
      * @param input_search
      * @param column_index
      */
     public static void regexFilter(JTable table, String input_search, int column_index) {
          def_model = (DefaultTableModel) table.getModel();
          row_sorter = new TableRowSorter<DefaultTableModel>(def_model);
          table.setRowSorter(row_sorter);

          row_sorter.setRowFilter(RowFilter.regexFilter(input_search, column_index));
     }

     /**
      * Cancel the filter.
      * 
      * @param table
      */
     public static void cancelFilter(JTable table) {
          def_model = (DefaultTableModel) table.getModel();
          row_sorter = new TableRowSorter<DefaultTableModel>(def_model);
          table.setRowSorter(row_sorter);

          row_sorter.setRowFilter(null);
     }
}
