/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $("#registerForm").on("submit",function(event){
        event.preventDefault();
        var f = $(this).serialize();
        $.ajax({
            url: "./RegistrationServlet",
            method: "post",
            data: f,
            success: function(data){
                if(data.trim()==="done"){
                    location.reload();
                } else if(data.trim()==="alreadyUser"){
                    $("#registerStatus").show();
                    $("#registerStatus").html("Already exist user!");
                } else {
                    $("#registerStatus").show();
                    $("#registerStatus").html("Something went wrong!");
                }
            },
            error: function(){
                $("#registerStatus").show();
                $("#registerStatus").html("Something went wrong!");
            }
        });
    });

    $("#loginForm").on("submit",function(event){
        event.preventDefault();
        var f = $(this).serialize();
        $.ajax({
            url: "./LoginServlet",
            method: "post",
            data: f,
            success: function(data){
                if(data.trim()==="done"){
                    location.reload();
                } else if(data.trim()==="invalid"){
                    $("#loginStatus").show();
                    $("#loginStatus").html("Incorrect email and password!");
                } else {
                    $("#loginStatus").show();
                    $("#loginStatus").html("Something went wrong!");
                }
            },
            error: function(){
                $("#loginStatus").show();
                $("#loginStatus").html("Something went wrong!");
            }
        });
    });
});