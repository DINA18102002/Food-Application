function validate() {
    var un = document.getElementById("username").value;
    var unp = /^[a-zA-Z0-9]+$/;
    
    var em = document.getElementById("email").value;
    var pw = document.getElementById("password").value;
    var cpw = document.getElementById("confirmPassword").value;
    var add = document.getElementById("address").value;
    var pn = document.getElementById("mobile").value;
    var pnp = /^[0-9]+$/;
    
    var valid = true;
    
    // Form validation logic (similar to before)
    if (un === "") {
        document.getElementById("msg1").innerText = "Username can't be empty";
        valid = false;
    } else if (!unp.test(un)) {
        document.getElementById("msg1").innerText = "Username can only contain letters and numbers";
        valid = false;
    } else {
        document.getElementById("msg1").innerText = "";
    }
    
    if (em === "") {
        document.getElementById("msg3").innerText = "Email is required";
        valid = false;
    } else {
        document.getElementById("msg3").innerText = "";
    }
    
    if (pw === "") {
        document.getElementById("msg4").innerText = "Password is required";
        valid = false;
    } else {
        document.getElementById("msg4").innerText = "";
    }
    
    if (cpw === "") {
        document.getElementById("msg5").innerText = "Please confirm your password";
        valid = false;
    }
    
    if (pw !== cpw) {
        document.getElementById("msg6").innerText = "Passwords do not match";
        valid = false;
    } else {
        document.getElementById("msg5").innerText = "";
        document.getElementById("msg6").innerText = "";
    }
    
    if (add === "") {
        document.getElementById("msg7").innerText = "Please enter your address";
        valid = false;
    } else {
        document.getElementById("msg7").innerText = "";
    }
    
    if (pn === "") {
        document.getElementById("msg8").innerText = "Mobile number required";
        valid = false;
    } else if (!pnp.test(pn)) {
        document.getElementById("msg8").innerText = "Mobile number must contain only numbers";
        valid = false;
    } else {
        document.getElementById("msg8").innerText = "";
    }
	
	
   		
		
		return valid;
    }

    
