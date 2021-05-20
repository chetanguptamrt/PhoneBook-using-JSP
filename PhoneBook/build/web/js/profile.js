/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var picAvatar = 0;
function setPic(p){
    picAvatar = p;
    console.log(picAvatar);
    for(var i=1;i<=8;i++){
        $("#avatar"+i).css("border","2px solid black");
    }
    $("#avatar"+p).css("border","3px solid blue");
}
$("#changeAvatar").on("submit",function(event){
    event.preventDefault();
    if(picAvatar!==0){
        $.ajax({
            url: "./ChangeAvatarServlet?pid="+picAvatar,
            method: "post",
            success: function(data){
                if(data.trim()==="done"){
                    location.reload();
                } else{
                    alert("Something went wrong");
                    location.reload();
                }
            },
            error: function(){
                alert("Something went wrong");
                location.reload();
            }
        });
    }
});
$(document).ready(function(){
    $("#delete").click(function(){
        if(confirm("Do you want to delete your account?\nAre you sure")){
            $.ajax({
                url: "DeleteProfileServlet",
                method: "post",
                success: function(){
                    location.reload();
                },
                error: function(){
                    location.reload();
                }
            });
        }
    });
    $("#uPassword").on("submit",function(event){
        event.preventDefault();
        if($("#nPassword").val()===$("#cPassword").val()){
            var f = $(this).serialize();
            $.ajax({
                url: "./UpdatePasswordServlet",
                method: "post",
                data: f,
                success: function(data){
                    if(data.trim()==="done") {
                        $("#updateStatus").show();
                        $("#updateStatus").removeClass("text-danger");
                        $("#updateStatus").addClass("text-success");
                        $("#updateStatus").html("Password Update Successfully");
                    } else if(data.trim()==="notMatch") {
                        $("#updateStatus").show();
                        $("#updateStatus").removeClass("text-success");
                        $("#updateStatus").addClass("text-danger");
                        $("#updateStatus").html("Old Password doesn't match");
                    } else {
                        $("#updateStatus").show();
                        $("#updateStatus").removeClass("text-success");
                        $("#updateStatus").addClass("text-danger");
                        $("#updateStatus").html("Something went wrong!");
                    }
                    console.log(data);
                },
                error: function(){
                    $("#updateStatus").show();
                    $("#updateStatus").removeClass("text-success");
                    $("#updateStatus").addClass("text-danger");
                    $("#updateStatus").html("Something went wrong!");
                }
            });
        } else{
            $("#updateStatus").show();
            $("#updateStatus").removeClass("text-success");
            $("#updateStatus").addClass("text-danger");
            $("#updateStatus").html("New password and Confirm password doesn't match!");
        }
    });
});