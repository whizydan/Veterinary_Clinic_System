package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;

@Entity
public class Appointment implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long customerId;
    private Long animalId;
    private Long vetId;
    private String appointmentDate;
    private String reason;
    private String diagnosis;

    // Constructors, getters, setters, and toString method
    public Appointment() {
    }

    public Appointment(Long customerId, Long animalId, Long vetId, String date, String reason, String diagnosis) {
        this.customerId = customerId;
        this.animalId = animalId;
        this.vetId = vetId;
        this.appointmentDate = date;
        this.reason = reason;
        this.diagnosis = diagnosis;
    }
    
    public void setAppointmentDate(String date){
        this.appointmentDate = date;
    }
    
    public String getAppointmentDate(){
        return appointmentDate;
    }
    
    public String getDiagnosis(){
        return diagnosis;
    }
    
    public void setDiagnosis(String diagnosis){
        this.diagnosis = diagnosis;
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

    public Long getAnimalId() {
        return animalId;
    }

    public void setAnimalId(Long animalId) {
        this.animalId = animalId;
    }

    public Long getVetId() {
        return vetId;
    }

    public void setVetId(Long vetId) {
        this.vetId = vetId;
    }

    public String getDate() {
        return appointmentDate;
    }

    public void setDate(String date) {
        this.appointmentDate = date;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    @Override
    public String toString() {
        return "Appointment{" +
                "id=" + id +
                ", customerId=" + customerId +
                ", animalId=" + animalId +
                ", vetId=" + vetId +
                ", date=" + appointmentDate +
                ", reason='" + reason + '\'' +
                '}';
    }
}
