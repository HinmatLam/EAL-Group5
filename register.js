function registerUser() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;

    // Store the username and password in localStorage
    localStorage.setItem("username", username);
    localStorage.setItem("password", password);

    alert("Registration successful! Please proceed to the login page.");
}
