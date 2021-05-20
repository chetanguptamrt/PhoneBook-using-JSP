/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function showModal(id){
    $.ajax({
        url: "./GetContactDetailServlet?id="+id,
        method: "post",
        datatype: "json",
        success: function(data){
            console.log(data);
            var daa = JSON.parse(data);
            $("#name").html(daa.name);

            var phone = "";
            if(daa.phone!=="") {
                phone = "<h6>Phone:</h6>" + daa.phone + "&nbsp;&nbsp;&nbsp;" +daa.phoneName + "<br/><br/>";
            }
            var email = "";
            if(daa.email!==""){
                email = "<h6>Email:</h6>" + daa.email + "&nbsp;&nbsp;&nbsp;" +daa.emailName + "<br/><br/>";
            }
            var occp = "";
            if(daa.occupation!==""){
                occp = "<h6>Occupation:</h6>" + daa.occupation + "<br/><br/>";
            }

            $("#detail").html(phone+email+occp);
            $("#editLink").attr("href","./editContact.jsp?id="+daa.id);
        },
        error: function(){
            alert("Something went wrong, Please try again later!");
        }
    });

}
