/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $("#addContact").on("submit",function(event){
        event.preventDefault();
        var f = $(this).serialize();
        $.ajax({
            url: "AddContactServlet",
            data: f,
            method: "post",
            success: function(data){
                if(data.trim()==="done"){
                    $("#status").show();
                    $("#status").removeClass("alert-danger");
                    $("#status").addClass("alert-success");
                    $("#status").html("Contact save successfully");
                    $("#name").val("");
                    $("#phone").val("");
                    $("#phoneName").val("Mobile");
                    $("#email").val("");
                    $("#emailName").val("Mobile");
                    $("#occp").val("");
                } else{
                    $("#status").show();
                    $("#status").removeClass("alert-success");
                    $("#status").addClass("alert-danger");
                    $("#status").html("Something went wrong!");
                }
            },
            error: function(){
                $("#status").show();
                $("#status").removeClass("alert-success");
                $("#status").addClass("alert-danger");
                $("#status").html("Something went wrong!");
            }
        });
        
    });
});