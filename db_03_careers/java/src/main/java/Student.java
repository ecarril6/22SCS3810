/*
 * CS3810 - Principles of Database Systems - Spring 2022
 * Instructor: Thyago Mota
 * Student Names:
 * Description: creates a Student entity with a 1-many mapping to StudentInterest and allows listing of all students
 */

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

// TODO: finish the object-relational mapping
class StudentInterestPK implements Serializable {

}

// TODO: finish the object-relational mapping
class StudentInterest implements Serializable {

}

// TODO: finish the object-relational mapping
class Student {

    public static void main(String[] args) {
        
        // Entity Manager initialization
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("db03");
        EntityManager em = emf.createEntityManager();

        // TODO: list all students
        
        em.close();
    }
}
