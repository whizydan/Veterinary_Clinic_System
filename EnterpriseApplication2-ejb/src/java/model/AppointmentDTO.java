package model;

import java.io.Serializable;

public class AppointmentDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;
    private Long customerId;
    private String customerName;
    private Long animalId;
    private String animalName;
    private Long vetId;
    private String vetName;
    private String appointmentDate;
    private String reason;
    private String diagnosis;
    private String condition;

    // Constructors, getters, and setters
    public AppointmentDTO() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }
    
    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getCondition() {
        return condition;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Long getAnimalId() {
        return animalId;
    }

    public void setAnimalId(Long animalId) {
        this.animalId = animalId;
    }

    public String getAnimalName() {
        return animalName;
    }

    public void setAnimalName(String animalName) {
        this.animalName = animalName;
    }

    public Long getVetId() {
        return vetId;
    }

    public void setVetId(Long vetId) {
        this.vetId = vetId;
    }

    public String getVetName() {
        return vetName;
    }

    public void setVetName(String vetName) {
        this.vetName = vetName;
    }

    public String getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }
    
    @Override
    public String toString() {
        return "{\n" +
                "    \"id\": \"" + id + "\",\n" +
                "    \"name\": \"" + animalName + "\",\n" +
                "    \"date\": \"" + appointmentDate + "\",\n" +
                "    \"type\": \"" + "event" + "\",\n" +  // Assuming all entries are of type "event"
                "    \"badge\": \"" + vetName + "\",\n" +
                "    \"description\": \"" + diagnosis + "\",\n" +
                "    \"color\": \"" + "#42f5b3" + "\"\n" +  // You can customize the color as needed
                "}";
    }
}
