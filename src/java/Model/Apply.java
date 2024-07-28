/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
public class Apply {

    private String ApplyId;
    private String CvId;
    private String EmpoyeeId;
    private String CompanyId;
    private String PostId;
    private String status;

    public Apply() {
    }

    public Apply(String ApplyId, String CvId, String EmpoyeeId, String CompanyId, String PostId, String status) {
        this.ApplyId = ApplyId;
        this.CvId = CvId;
        this.EmpoyeeId = EmpoyeeId;
        this.CompanyId = CompanyId;
        this.PostId = PostId;
        this.status = status;
    }

    public String getApplyId() {
        return ApplyId;
    }

    public void setApplyId(String ApplyId) {
        this.ApplyId = ApplyId;
    }

    public String getPostId() {
        return PostId;
    }

    public void setPostId(String PostId) {
        this.PostId = PostId;
    }

    public String getCvId() {
        return CvId;
    }

    public void setCvId(String CvId) {
        this.CvId = CvId;
    }

    public String getCompanyId() {
        return CompanyId;
    }

    public void setCompanyId(String CompanyId) {
        this.CompanyId = CompanyId;
    }

    public String getEmpoyeeId() {
        return EmpoyeeId;
    }

    public void setEmpoyeeId(String EmpoyeeId) {
        this.EmpoyeeId = EmpoyeeId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
