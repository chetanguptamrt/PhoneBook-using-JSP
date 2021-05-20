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
public class UserDetail {
    
    private final int id;
    private final String name;
    private final String email;
    private final Boolean activate;
    private final String profilePic;

    public UserDetail(int id, String name, String email, Boolean activate, String profilePic) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.activate = activate;
        this.profilePic = profilePic;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public Boolean getActivate() {
        return activate;
    }

    public String getProfilePic() {
        return profilePic;
    }
    
    
}
