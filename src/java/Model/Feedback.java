/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author NganPT
 */
public class Feedback {

    private String feedbackId;
    private String employeeId;
    private String companyId;
    private String description;
    private Date feedbackTime;

    public Feedback() {
    }

    public Feedback(String feedbackId, String employeeId, String companyId, String description, Date feedbackTime) {
        this.feedbackId = feedbackId;
        this.employeeId = employeeId;
        this.companyId = companyId;
        this.description = description;
        this.feedbackTime = feedbackTime;
    }

    public String getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(String feedbackId) {
        this.feedbackId = feedbackId;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getFeedbackTime() {
        return feedbackTime;
    }

    public void setFeedbackTime(Date feedbackTime) {
        this.feedbackTime = feedbackTime;
    }

    @Override
    public String toString() {
        return "Feedback{" + "feedbackId=" + feedbackId + ", employeeId=" + employeeId + ", companyId=" + companyId + ", description=" + description + ", feedbackTime=" + feedbackTime + '}';
    }

}
