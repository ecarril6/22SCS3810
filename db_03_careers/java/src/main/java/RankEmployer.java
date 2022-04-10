/*
 * CS3810 - Principles of Database Systems - Spring 2022
 * Instructor: Thyago Mota
 * Student Names:
 * Description: show recommendation scores for student-employer matching based on common interests
 */

import javax.persistence.*;
import java.util.Scanner;

public class RankEmployer {

    // compute the jaccard similarity between given student and employer
    static double jaccard(final Student student, final Employer employer) {
        int common = 0;
        for (StudentInterest studentInterest: student.getInterests()) {
            boolean found = false;
            for (EmployerInterest employerInterest : employer.getInterests())
                if (studentInterest.getStudentInterestPK().getInterest().equals(employerInterest.getEmployerInterestPK().getInterest())) {
                    found = true;
                    break;
                }
            if (found)
                common++;
        }
        int all = student.getInterests().size() + employer.getInterests().size() - common;
        return (double) common / all;
    }

    public static void main(String[] args) {

        // Entity Manager initialization
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("db03");
        EntityManager em = emf.createEntityManager();

        // TODO: retrieve a student by email
        Scanner sc = new Scanner(System.in);
        System.out.print("email: ");
        String email = sc.nextLine();

        // TODO: matching of the student to each employer
        
        em.close();
    }
}
