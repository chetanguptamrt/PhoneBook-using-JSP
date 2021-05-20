/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.database.DBConnect;
import com.detail.UserDetail;
import com.javaclass.Email;
import com.javaclass.PasswordEncrypt;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author chetan
 */
public class UserDAO {
    
    public String registerUser(String name, String email, String password){
        try{
            String ePassword = PasswordEncrypt.hashPassword(password);
            
            Connection conn = DBConnect.getConn();
            String query1 = "select * from user where email = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            pt1.setString(1, email);
            ResultSet rs = pt1.executeQuery();
            if(rs.next()){
               
                String query3 = "select * from user where email = ? and activate = true";
                PreparedStatement pt3 = conn.prepareStatement(query3);
                pt3.setString(1, email);
                ResultSet rs3 = pt3.executeQuery();
                if(rs3.next()){
                    return "alreadyUser";
                } else{
                    
                    String query4 = "update user set name = ?, password = ?, activate = false where email = ?";
                    PreparedStatement pt4 = conn.prepareStatement(query4);
                    pt4.setString(1, name);
                    pt4.setString(2, ePassword);
                    pt4.setString(3 , email);
                    int i = pt4.executeUpdate();
                    if(i==1){
                        
                        PreparedStatement pt6 = conn.prepareStatement("delete from userverification where email = ?");
                        pt6.setString(1, email);
                        pt6.executeUpdate();
                        int otp = getOtp();
                        String query5 = "insert into userverification value(?,?)";
                        PreparedStatement pt5 = conn.prepareStatement(query5);
                        pt5.setString(1, email);
                        pt5.setInt(2, otp);
                        pt5.executeUpdate();

                        String body = "Hello "+name+",\n\n"
                                + "Your activation link is : \n"
                                + "http://localhost:8080/PhoneBook/GetVerifiedUserServlet?email="+email+"&otp="+otp+"\n\n"
                                + "If you are having any issue with your account, please don't hesitate to contact us.\n\nThanks!\nPhone Book";

                        Thread t = new Thread(new Email(email,"Verification Link",body));
                        t.start();
                        return "done";
                    }
                }
            } else{
                
                String query2 = "insert into user (name,email,password) values (?,?,?)";
                PreparedStatement pt2 = conn.prepareStatement(query2);
                pt2.setString(1, name);
                pt2.setString(2, email);
                pt2.setString(3, ePassword);
                int i = pt2.executeUpdate();
                if(i==1){
                    
                    PreparedStatement pt6 = conn.prepareStatement("delete from userverification where email = ?");
                    pt6.setString(1, email);
                    pt6.executeUpdate();
                    int otp = getOtp();
                    String query5 = "insert into userverification values(?,?)";
                    PreparedStatement pt5 = conn.prepareStatement(query5);
                    pt5.setString(1, email);
                    pt5.setInt(2, otp);
                    pt5.executeUpdate();
                    
                    String body = "Hello "+name+",\n\n"
                            + "Your activation link is : \n"
                            + "http://localhost:8080/PhoneBook/GetVerifiedUserServlet?email="+email+"&otp="+otp+"\n\n"
                            + "If you are having any issue with your account, please don't hesitate to contact us.\n\nThanks!\nPhone Book";
                    
                    Thread t = new Thread(new Email(email,"Verification Link",body));
                    t.start();
                    return "done";
                }
            }
        } 
        catch(SQLException e){
            e.printStackTrace();
        }
        return "no";
    }
    
    public String getVerify(String email, int otp){
        try {
            System.out.println(email+otp);
            Connection conn = DBConnect.getConn();
            String query = "select * from userverification where email = ? and otp = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, email);
            pt.setInt(2, otp);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                String query2 = "delete from userverification where email = ?";
                PreparedStatement pt2 = conn.prepareStatement(query2);
                pt2.setString(1, email);
                pt2.executeUpdate();
                String query3 = "update user set activate = true where email = ?";
                PreparedStatement pt3 = conn.prepareStatement(query3);
                pt3.setString(1, email);
                pt3.executeUpdate();
                return "done";
            }
            
        } catch(SQLException e){
            e.printStackTrace();
        }
        
        return "no";
    }
    
    public UserDetail getDetail(String email){
        try{
            Connection conn = DBConnect.getConn();
            String query1 = "select * from user where email = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            pt1.setString(1, email);
            ResultSet rs = pt1.executeQuery();
            if(rs.next()){
                return new UserDetail(rs.getInt("id"),rs.getString("name"),rs.getString("email"),rs.getBoolean("activate"),rs.getString("profile"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }

    private int getOtp(){
       return (int)(Math.random()*(999999999-111111111+1)+111111111);
    }

    private int getOtp6(){
       return (int)(Math.random()*(999999-111111+1)+111111);
    }

    public String loginUser(String email, String password) {
        String ePassword = PasswordEncrypt.hashPassword(password);
        try{
            Connection conn = DBConnect.getConn();
            String query = "select * from user where email = ? and password = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, email);
            pt.setString(2, ePassword);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                return "done";
            } else{
                return "invalid";
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
        return "no";
    }
    
    public void resendLink(String name, String email){
        try{
            Connection conn = DBConnect.getConn();
            PreparedStatement pt6 = conn.prepareStatement("delete from userverification where email = ?");
            pt6.setString(1, email);
            pt6.executeUpdate();
            int otp = getOtp();
            String query5 = "insert into userverification values(?,?)";
            PreparedStatement pt5 = conn.prepareStatement(query5);
            pt5.setString(1, email);
            pt5.setInt(2, otp);
            pt5.executeUpdate();

            String body = "Hello "+name+",\n\n"
                    + "Your activation link is : \n"
                    + "http://localhost:8080/PhoneBook/GetVerifiedUserServlet?email="+email+"&otp="+otp+"\n\n"
                    + "If you are having any issue with your account, please don't hesitate to contact us.\n\nThanks!\nPhone Book";

            Thread t = new Thread(new Email(email,"Verification Link",body));
            t.start();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
    }
    
    public String changePassword(int id, String oPassword, String nPassword){
        try{
            Connection conn = DBConnect.getConn();
            String eoPassword = PasswordEncrypt.hashPassword(oPassword);
            String enPassword = PasswordEncrypt.hashPassword(nPassword);
            String query1 = "select * from user where id = ? and password = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            pt1.setInt(1, id);
            pt1.setString(2, eoPassword);
            ResultSet rs = pt1.executeQuery();
            if(rs.next()){
                String query2 = "update user set password = ? where id = ?";
                PreparedStatement pt2 = conn.prepareStatement(query2);
                pt2.setString(1, enPassword);
                pt2.setInt(2, id);
                int i = pt2.executeUpdate();
                if(i==1){
                    return "done";
                }                
            } else{
                return "notMatch";
            }
        } catch(SQLException ex){
            ex.printStackTrace();
        }
        return "no";
    }

    public String forgotOTP(String email){
        try{
            Connection conn = DBConnect.getConn();
            String query1 = "select * from user where email = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            pt1.setString(1, email);
            ResultSet rs = pt1.executeQuery();
            if(rs.next()){
                
                PreparedStatement pt6 = conn.prepareStatement("delete from userverification where email = ?");
                pt6.setString(1, email);
                pt6.executeUpdate();
                int otp = getOtp6();
                String query5 = "insert into userverification values(?,?)";
                PreparedStatement pt5 = conn.prepareStatement(query5);
                pt5.setString(1, email);
                pt5.setInt(2, otp);
                pt5.executeUpdate();

                String body = "Hello "+rs.getString("name")+",\n\n"
                        + "Your OTP is : "+otp+"\n\n"
                        + "If you are having any issue with your account, please don't hesitate to contact us.\n\nThanks!\nPhone Book";

                Thread t = new Thread(new Email(email,"Verification Link",body));
                t.start();
                return "done";
            } else{
                return "invalid";
            }
        } catch(SQLException ex){
            ex.printStackTrace();
        }
        return "no";
    }

    public String forgotPassword(String email, int otp,String password){
        try {
            String ePassword = PasswordEncrypt.hashPassword(password);
            System.out.println(email+otp);
            Connection conn = DBConnect.getConn();
            String query = "select * from userverification where email = ? and otp = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, email);
            pt.setInt(2, otp);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                String query2 = "delete from userverification where email = ?";
                PreparedStatement pt2 = conn.prepareStatement(query2);
                pt2.setString(1, email);
                pt2.executeUpdate();
                String query3 = "update user set password = ?, activate = true where email = ?";
                PreparedStatement pt3 = conn.prepareStatement(query3);
                pt3.setString(1, ePassword);
                pt3.setString(2, email);
                pt3.executeUpdate();
                return "done";
            } else{
                return "invalid";
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        
        return "no";
    }
    
    public String changeAvatar(int id,int pid){
        try{
            Connection conn = DBConnect.getConn();
            String query = "update user set profile = './profile/p"+pid+".jpg' where id  = ?"; 
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, id);
            int i = pt.executeUpdate();
            if(i == 1){
                return "done";
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        
        return "no";
    }

    public String deleteProfile(int id) {
        try{
            Connection conn = DBConnect.getConn();
            String query = "delete from user where id = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, id);
            int i = pt.executeUpdate();
            if(i==1){
                return "done";
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return "no";
    }
}
