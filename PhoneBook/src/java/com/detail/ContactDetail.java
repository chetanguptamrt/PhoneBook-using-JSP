/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.detail;

/**
 *
 * @author chetan
 */
public class ContactDetail {
    private int id;
    private final String name;
    private final String phone;
    private final String phoneName;
    private final String email;
    private final String emailName;
    private final String occupation;
    private int userId;

    public ContactDetail(String name, String phone, String phoneName, String email, String emailName, String occupation, int userId) {
        this.name = name;
        this.phone = phone;
        this.phoneName = phoneName;
        this.email = email;
        this.emailName = emailName;
        this.occupation = occupation;
        this.userId = userId;
    }

    public ContactDetail(int id, String name, String phone, String phoneName, String email, String emailName, String occupation, int userId) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.phoneName = phoneName;
        this.email = email;
        this.emailName = emailName;
        this.occupation = occupation;
        this.userId = userId;
    }

    public ContactDetail(int id, String name, String phone, String phoneName, String email, String emailName, String occupation) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.phoneName = phoneName;
        this.email = email;
        this.emailName = emailName;
        this.occupation = occupation;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPhone() {
        return phone;
    }

    public String getPhoneName() {
        return phoneName;
    }

    public String getEmail() {
        return email;
    }

    public String getEmailName() {
        return emailName;
    }

    public String getOccupation() {
        return occupation;
    }

    public int getUserId() {
        return userId;
    }
    
}
