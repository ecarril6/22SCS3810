/*
 * CS3810 - Principles of Database Systems - Spring 2022
 * Instructor: Thyago Mota
 * Student Names:
 * Description: creates Interest entity and allows listing of all interests
 */

import javax.persistence.*;

// TODO: finish the object-relational mapping
public class Interest {

    public static void main(String[] args) {

        // Entity Manager initialization
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("db03");
        EntityManager em = emf.createEntityManager();

        // TODO: list all interests
    
        em.close();
    }
}
