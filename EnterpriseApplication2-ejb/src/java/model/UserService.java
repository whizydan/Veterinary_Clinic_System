package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

@Stateless
public class UserService {

    @PersistenceContext(unitName = "EnterpriseApplication2-ejbPU")
    private EntityManager entityManager;
    
    public void saveUser(Users user) {
        entityManager.persist(user);
    }
    
    public void deleteUser(Long userId) {
        // Find the user entity by its ID
        Users user = entityManager.find(Users.class, userId);

        // If user entity exists, remove it from the persistence context
        if (user != null) {
            entityManager.remove(user);
        }
    }
    
    public void deleteOwner(Long userId) {
        // Find the user entity by its ID
        Owner user = entityManager.find(Owner.class, userId);

        // If user entity exists, remove it from the persistence context
        if (user != null) {
            entityManager.remove(user);
        }
    }
    
    public void deleteAnimal(Long animalId) {
        // Find the user entity by its ID
        Animal user = entityManager.find(Animal.class, animalId);

        // If user entity exists, remove it from the persistence context
        if (user != null) {
            entityManager.remove(user);
        }
    }
    
    public void deleteApp(Long appId) {
        // Find the user entity by its ID
        Appointment app = entityManager.find(Appointment.class, appId);

        // If user entity exists, remove it from the persistence context
        if (app != null) {
            entityManager.remove(app);
        }
    }
    
    // Method to add a new appointment
    public void addAppointment(Long customerId, Long animalId, Long vetId, String appointmentDate, String reason, String diagnosis) {
        // Create a new Appointment object
        Appointment newAppointment = new Appointment(customerId, animalId, vetId, appointmentDate, reason, diagnosis);

        // Persist the new appointment in the database
        entityManager.persist(newAppointment);
    }
    
    public Users getUserById(Long userId) {
        // Find the user entity by its ID
        return entityManager.find(Users.class, userId);
    }
    
    public Animal getAnimalById(Long animalId) {
        // Find the user entity by its ID
        return entityManager.find(Animal.class, animalId);
    }
    
    public Owner getOwnerById(Long userId) {
        // Find the user entity by its ID
        return entityManager.find(Owner.class, userId);
    }
    
    public void updateUser(Users updatedUser) {
        // Merge the updated user entity into the persistence context
        entityManager.merge(updatedUser);
    }
    
    public void updateAnimal(Animal updatedUser) {
        // Merge the updated user entity into the persistence context
        entityManager.merge(updatedUser);
    }
    
    public void updateOwner(Owner updatedUser) {
        // Merge the updated user entity into the persistence context
        entityManager.merge(updatedUser);
    }

    public List<Users> getAllUsers() {
        // Create a JPQL query to select all users
        String jpql = "SELECT u FROM Users u";

        // Create a TypedQuery to execute the JPQL query
        TypedQuery<Users> query = entityManager.createQuery(jpql, Users.class);

        // Execute the query and return the result list
        return query.getResultList();
    }
    
    public List<Appointment> getAllApps() {
        // Create a JPQL query to select all users
        String jpql = "SELECT u FROM Appointment u";

        // Create a TypedQuery to execute the JPQL query
        TypedQuery<Appointment> query = entityManager.createQuery(jpql, Appointment.class);

        // Execute the query and return the result list
        return query.getResultList();
    }
    
    public boolean validateUser(String email, String password) {
        // Query to check if a user with the provided email and password exists
        Query query = entityManager.createQuery("SELECT COUNT(u) FROM Users u WHERE u.email = :email AND u.password = :password");
        query.setParameter("email", email);
        query.setParameter("password", password);

        // Execute the query and get the result count
        long count = (long) query.getSingleResult();

        // Return true if count is greater than 0, indicating a valid user
        return count > 0;
    }
    
    public Users getUser(String email, String password) {
    // Query to retrieve the user with the provided email and password
    Query query = entityManager.createQuery("SELECT u FROM Users u WHERE u.email = :email AND u.password = :password");
    query.setParameter("email", email);
    query.setParameter("password", password);

    // Execute the query to retrieve the user
    List<Users> users = query.getResultList();

    // Check if the list contains any user
    if (!users.isEmpty()) {
        // Return the first user found (assuming email is unique)
        return users.get(0);
    } else {
        // Return null if no user is found
        return null;
    }
    }
    public void addOwner(String name, String email, String phone, String address) {
        Owner owner = new Owner(name, email, phone, address);
        entityManager.persist(owner);
    }
    public void addAnimal(Long customerId, String name, String condition, String age) {
        Animal animal = new Animal(customerId, name, condition, age);
        entityManager.persist(animal);
    }
    public List<Owner> getAllOwners() {
        // Create a JPQL query to select all owners
        String jpql = "SELECT o FROM Owner o";

        // Create a TypedQuery to execute the JPQL query
        TypedQuery<Owner> query = entityManager.createQuery(jpql, Owner.class);

        // Execute the query and return the result list
        return query.getResultList();
    }
    public List<Animal> getAnimalsByOwnerId(Long ownerId) {
        // Create a JPQL query to select animals by owner id
        String jpql = "SELECT a FROM Animal a WHERE a.customerId = :ownerId";

        // Create a TypedQuery to execute the JPQL query
        TypedQuery<Animal> query = entityManager.createQuery(jpql, Animal.class);
        query.setParameter("ownerId", ownerId);

        // Execute the query and return the result list
        return query.getResultList();
    }
    public boolean hasThreeOrMoreBookingsInDay(Long vetId, String date) {
        // Create a JPQL query to count appointments for the specified vet on the given date
        String jpql = "SELECT COUNT(a) FROM Appointment a " +
                      "WHERE a.vetId = :vetId AND a.appointmentDate = :date";

        // Create a TypedQuery to execute the JPQL query
        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
        query.setParameter("vetId", vetId);
        query.setParameter("date", date);

        // Execute the query and get the result count
        long count = query.getSingleResult();

        // Return true if the vet has 3 or more bookings in the day, otherwise return false
        return count >= 3;
    }
    
   public List<AppointmentDTO> getApps() {
    // Create a JPQL query to select all appointments with related information
    String jpql = "SELECT a.id, a.appointmentDate, a.reason, a.diagnosis, an.id AS animalId, an.name AS animalName,o.id AS customerId, o.name AS customerName,u.id AS vetId, u.name AS vetName, u.email AS vetEmail, i.condition FROM Appointment a\n" +
"             JOIN Animal an ON a.animalId = an.id\n" +
"             JOIN Owner o ON an.customerId = o.id\n" +
"             JOIN Users u ON a.vetId = u.id\n" +
"              JOIN Animal i ON i.id = a.animalId";

    // Create a TypedQuery to execute the JPQL query
    TypedQuery<Object[]> query = entityManager.createQuery(jpql, Object[].class);

    // Execute the query and return the result list
    List<Object[]> resultList = query.getResultList();

    // Process the result list and create AppointmentDTO objects
    List<AppointmentDTO> appointmentDTOList = new ArrayList<>();
    for (Object[] result : resultList) {
        Long appointmentId = (Long) result[0];
        String appointmentDate = (String) result[1];
        String reason = (String) result[2];
        String diagnosis = (String) result[3];
        Long animalId = (Long) result[4];
        String animalName = (String) result[5];
        Long customerId = (Long) result[6];
        String customerName = (String) result[7];
        Long vetId = (Long) result[8];
        String vetName = (String) result[9];
        String vetEmail = (String) result[10];
        String condition = (String) result[11];

        // Create a new AppointmentDTO object and set the relevant information
        AppointmentDTO appointmentDTO = new AppointmentDTO();
        appointmentDTO.setId(appointmentId);
        appointmentDTO.setCustomerId(customerId);
        appointmentDTO.setCustomerName(customerName);
        appointmentDTO.setAnimalId(animalId);
        appointmentDTO.setAnimalName(animalName);
        appointmentDTO.setVetId(vetId);
        appointmentDTO.setVetName(vetName);
        appointmentDTO.setAppointmentDate(appointmentDate);
        appointmentDTO.setReason(reason);
        appointmentDTO.setDiagnosis(diagnosis);
        appointmentDTO.setCondition(condition);

        // Add the AppointmentDTO to the list
        appointmentDTOList.add(appointmentDTO);
    }

    return appointmentDTOList;
 }
   
    public void updateAppointment(Long appointmentId, String newDate) {
        // Find the appointment entity by its ID
        Appointment appointment = entityManager.find(Appointment.class, appointmentId);

        // If appointment entity exists, update its properties
        if (appointment != null) {
            // Set the new values for date and condition
            appointment.setAppointmentDate(newDate);

            // Merge the updated appointment entity into the persistence context
            entityManager.merge(appointment);
        }
    }
    
    public void addDiagnosis(Long appointmentId, String diagnosis) {
        // Find the appointment entity by its ID
        Appointment appointment = entityManager.find(Appointment.class, appointmentId);

        // If appointment entity exists, update its properties
        if (appointment != null) {
            // Set the new values for date and condition
            appointment.setDiagnosis(diagnosis);

            // Merge the updated appointment entity into the persistence context
            entityManager.merge(appointment);
        }
    }
    
    public List<AppointmentDTO> getAppsByVetId(Long vetId) {
    // Create a JPQL query to select appointments with related information for a specific vetId
    String jpql = "SELECT a.id, a.appointmentDate, a.reason, a.diagnosis,\n" +
"       an.id AS animalId, an.name AS animalName,\n" +
"       o.id AS customerId, o.name AS customerName,\n" +
"       u.id AS vetId, u.name AS vetName, u.email AS vetEmail\n" +
"FROM Appointment a\n" +
"JOIN Animal an ON a.animalId = an.id\n" +
"JOIN Owner o ON an.customerId = o.id\n" +
"JOIN Users u ON a.vetId = u.id\n" +
"WHERE u.id = :vetId";

    // Create a TypedQuery to execute the JPQL query
    TypedQuery<Object[]> query = entityManager.createQuery(jpql, Object[].class);
    query.setParameter("vetId", vetId);

    // Execute the query and return the result list
    List<Object[]> resultList = query.getResultList();

    // Process the result list and create AppointmentDTO objects
    List<AppointmentDTO> appointmentDTOList = new ArrayList<>();
    for (Object[] result : resultList) {
        Long appointmentId = (Long) result[0];
        String appointmentDate = (String) result[1];
        String reason = (String) result[2];
        String diagnosis = (String) result[3];
        Long animalId = (Long) result[4];
        String animalName = (String) result[5];
        Long customerId = (Long) result[6];
        String customerName = (String) result[7];
        Long vetIdResult = (Long) result[8];
        String vetName = (String) result[9];
        String vetEmail = (String) result[10];

        // Create a new AppointmentDTO object and set the relevant information
        AppointmentDTO appointmentDTO = new AppointmentDTO();
        appointmentDTO.setId(appointmentId);
        appointmentDTO.setCustomerId(customerId);
        appointmentDTO.setCustomerName(customerName);
        appointmentDTO.setAnimalId(animalId);
        appointmentDTO.setAnimalName(animalName);
        appointmentDTO.setVetId(vetIdResult);
        appointmentDTO.setVetName(vetName);
        appointmentDTO.setAppointmentDate(appointmentDate);
        appointmentDTO.setReason(reason);
        appointmentDTO.setDiagnosis(diagnosis);

        // Add the AppointmentDTO to the list
        appointmentDTOList.add(appointmentDTO);
    }

    return appointmentDTOList;
    }  
    public String getVetNames() {
        // Create a JPQL query to select all vet names
        String jpql = "SELECT u.name FROM Users u WHERE u.role = '2'";

        // Create a TypedQuery to execute the JPQL query
        TypedQuery<String> query = entityManager.createQuery(jpql, String.class);

        // Execute the query and return the result list
        List<String> vetNames = query.getResultList();

        // Create a StringBuilder to build the result string
        StringBuilder result = new StringBuilder("[");
        
        // Append the vet names with index values
        for (int i = 0; i < vetNames.size(); i++) {
            result.append("'").append(vetNames.get(i)).append("'");
            
            // Add a comma and space after each vet name (except the last one)
            if (i < vetNames.size() - 1) {
                result.append(", ");
            }
        }

        result.append("]");

        // Convert the StringBuilder to a String and return
        return result.toString();
    }

    public Map<String, Long> getAppointmentsPerDay() {
        // Create a JPQL query to count appointments for each day
        String jpql = "SELECT a.appointmentDate, count(a) FROM Appointment a GROUP BY a.appointmentDate";

        // Create a TypedQuery to execute the JPQL query
        TypedQuery<Object[]> query = entityManager.createQuery(jpql, Object[].class);

        // Execute the query and return the result list
        List<Object[]> resultList = query.getResultList();

        // Process the result list and create a map with day and count
        Map<String, Long> appointmentsPerDay = new HashMap<>();
        for (Object[] result : resultList) {
            String appointmentDate = (String) result[0];
            Long appointmentCount = (Long) result[1];

            // Add the day and count to the map
            appointmentsPerDay.put(appointmentDate, appointmentCount);
        }

        return appointmentsPerDay;
    }
}
