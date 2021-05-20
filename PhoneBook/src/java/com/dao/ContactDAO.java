/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.database.DBConnect;
import com.detail.ContactDetail;
import com.detail.ContactList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author chetan
 */
public class ContactDAO {
    
    public String insertContact(ContactDetail cd){
        try{
            Connection conn = DBConnect.getConn();
            String query = "insert into contact (name,phone,phoneName,email,emailName,occupation,userId) values(?,?,?,?,?,?,?)";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, cd.getName());
            pt.setString(2, cd.getPhone());
            pt.setString(3, cd.getPhoneName());
            pt.setString(4, cd.getEmail());
            pt.setString(5, cd.getEmailName());
            pt.setString(6, cd.getOccupation());
            pt.setInt(7, cd.getUserId());
            int i = pt.executeUpdate();
            if(i == 1){
                return "done";
            }   
        } catch(SQLException ex){
            ex.printStackTrace();
        }
        return "no";
    }
    
    public List<ContactList> getContactList(int userId){
        List<ContactList> list = new ArrayList<ContactList>();
        ContactList cl = null;
        try{
            Connection conn = DBConnect.getConn();
            String query = "select id,name,phone from contact where userId = ? order by name asc";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, userId);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                cl = new ContactList(rs.getInt("id"),rs.getString("name"),rs.getString("phone"));
                list.add(cl);
            }
            
        } catch(SQLException ex){
            ex.printStackTrace();
        }
        
        return list;
    }
    
    public ContactDetail getContactDetail(int id,int userId){
        ContactDetail cd = null;
        try{
            Connection conn = DBConnect.getConn();
            String query = "select * from contact where id = ? and userId = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, id);
            pt.setInt(2, userId);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                cd = new ContactDetail(rs.getInt("id"),rs.getString("name"),rs.getString("phone"),rs.getString("phoneName"),rs.getString("email"),rs.getString("emailName"),rs.getString("Occupation"));
                return cd;
            }
            
        } catch(SQLException ex){
            ex.printStackTrace();
        }
        
        return cd;
    }

    public String editContact(ContactDetail cd) {
        try{
            Connection conn = DBConnect.getConn();
            String query = "update contact set name = ?,phone = ?,phoneName = ?,email = ?,emailName = ?,occupation = ? where id = ? and userId = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, cd.getName());
            pt.setString(2, cd.getPhone());
            pt.setString(3, cd.getPhoneName());
            pt.setString(4, cd.getEmail());
            pt.setString(5, cd.getEmailName());
            pt.setString(6, cd.getOccupation());
            pt.setInt(7, cd.getId());
            pt.setInt(8, cd.getUserId());
            int i = pt.executeUpdate();
            if(i == 1){
                return "done";
            }   
        } catch(SQLException ex){
            ex.printStackTrace();
        }

        return "no";
    }
    
}
