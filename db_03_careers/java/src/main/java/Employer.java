/*
 * CS3810 - Principles of Database Systems - Spring 2022
 * Instructor: Thyago Mota
 * Student Names:
 * Description: creates an Employer entity with a 1-many mapping to EmployerInterest and allows listing of all employers
 */

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

// TODO: finish the class definition
class EmployerInterestPK implements Serializable {
    
}

// TODO: finish the object-relational mapping
class EmployerInterest implements Serializable {

}

// TODO: finish the object-relational mapping
class Employer {

    public static void main(String[] args) {

        // Entity Manager initialization
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("db03");
        EntityManager em = emf.createEntityManager();

        // TODO: list all employers

        em.close();
    }
}
