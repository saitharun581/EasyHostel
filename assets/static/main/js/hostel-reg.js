function validation(){
    var fname= document.myform.Fname
    var lname= document.myform.Lname
    var email= document.myform.Email 
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var password=document.myform.Password
    var letter = /[a-z]/;
    var upper = /[A-Z]/;
    var number = /[0-9]/;
    
    if (fname.value=='' || fname.value.length <6){
        alert(" firstname should be more than 6 alphabets")
        fname.focus();
        return false;
    }
    
    
    
    if (lname.value=='' || lname.value.length<6){
        alert("last name should be more than 6 alphabets")
        lname.focus();
        return false;
    }
    if(!email.value.match(mailformat)){
        alert("invalid email")
        email.focus();
        return false;
    }
    
    if (!letter.test(password.value)) {
           alert("Please make sure password includes a lowercase letter.")
           return false;
        }
        if (!number.test(password.value)) {
           alert("Please make sure Password Includes a Digit")
           return false;
        }
        if (!upper.test(password.value)) {
           alert("Please make sure password includes an uppercase letter.");
           return false;
        }
    return true;
    }