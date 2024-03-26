package model;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPopupMenu;
import javax.swing.JSeparator;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;

/**
 * Facilitates the creation and functionalities of the tables
 */
public class Table_Manager {
    private static JTable students_table;
    private static JTable courses_table;
    private JPopupMenu tablePopupMenu;

    public Table_Manager(JFrame main) {
        new Data_Manager();
        processCourseTable(main);
        processStudentTable(main);
    }

    /**
     * Process the initial data and the functionalities of the student table
     */
    private void processStudentTable(JFrame main) {
        // setup the table
        students_table = new JTable(Data_Manager.getStudentsModel());
        students_table.getTableHeader().setReorderingAllowed(false); // to make columns not movable
        students_table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION); // to prevent multiple selection
        tablePopupMenu = new JPopupMenu();

        JMenuItem count = new JMenuItem("Student Count");
        count.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(main,
                        "There are currently " + students_table.getRowCount() + " student listed.", "Student count",
                        JOptionPane.CLOSED_OPTION);
            }
        });
        tablePopupMenu.add(count);
        students_table.setComponentPopupMenu(tablePopupMenu);
    }

    /**
     * Process the initial data and the functionalities of the course table
     */
    private void processCourseTable(JFrame main) {
        // setup the table
        courses_table = new JTable(Data_Manager.getCoursesModel());
        courses_table.getTableHeader().setReorderingAllowed(false); // to make columns not movable
        courses_table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION); // to prevent multiple selection
        tablePopupMenu = new JPopupMenu();

        // show how many course listed
        JMenuItem count = new JMenuItem("Course Count");
        count.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(main,
                        "There are currently " + courses_table.getRowCount() + " courses listed.", "Course count",
                        JOptionPane.CLOSED_OPTION);
            }
        });
        tablePopupMenu.add(count);

        tablePopupMenu.add(new JSeparator());

        // display number of unenrolled students
        JMenuItem unenrolled_count = new JMenuItem("Unenrolled Students");
        unenrolled_count.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(main,
                        "There are currently TODO student\\s unenrolled.",
                        "Unenrolled count", JOptionPane.CLOSED_OPTION);
            }
        });
        tablePopupMenu.add(unenrolled_count);

        tablePopupMenu.add(new JSeparator());

        // show the student count
        JMenuItem details = new JMenuItem("Student Enrolled");
        details.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (courses_table.getSelectedRow() < 0)
                    JOptionPane.showMessageDialog(main,
                            "Select a course.", "No Selection",
                            JOptionPane.CLOSED_OPTION);
                else {

                }
            }
        });
        tablePopupMenu.add(details);

        courses_table.setComponentPopupMenu(tablePopupMenu);
    }

    /**
     * For getting the student table.
     * 
     * @return Table_Manager.student_table
     */
    public static JTable getStudentTable() {
        return Table_Manager.students_table;
    }

    /**
     * For getting the course table.
     * 
     * @return Table_Manager.courses_table
     */
    public static JTable getCourseTable() {
        return Table_Manager.courses_table;
    }
}
