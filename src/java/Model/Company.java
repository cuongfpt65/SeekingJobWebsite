/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author NganPT
 */
public class Company {

    private String idCompany;
    private String email;
    private String password;
    private String nameCompany;
    private String nameCEO;
    private String vat;
    private String location;
    private String address;
    private String phone;
    private String logo;
    private String description;

    public Company() {
    }

    public Company(String idCompany, String email, String password, String nameCompany, String nameCEO, String vat, String location, String address, String phone, String logo, String description) {
        this.idCompany = idCompany;
        this.email = email;
        this.password = password;
        this.nameCompany = nameCompany;
        this.nameCEO = nameCEO;
        this.vat = vat;
        this.location = location;
        this.address = address;
        this.phone = phone;
        this.logo = logo;
        this.description = description;
    }

    public String getIdCompany() {
        return idCompany;
    }

    public void setIdCompany(String idCompany) {
        this.idCompany = idCompany;
    }
  

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNameCompany() {
        return nameCompany;
    }

    public void setNameCompany(String nameCompany) {
        this.nameCompany = nameCompany;
    }

    public String getNameCEO() {
        return nameCEO;
    }

    public void setNameCEO(String nameCEO) {
        this.nameCEO = nameCEO;
    }

    public String getVat() {
        return vat;
    }

    public void setVat(String vat) {
        this.vat = vat;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

  

}
