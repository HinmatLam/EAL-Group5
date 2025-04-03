function loginUser() {
    var loginUsername = document.getElementById("loginUsername").value;
    var loginPassword = document.getElementById("loginPassword").value;

    // Retrieve the stored username and password from localStorage
    var storedUsername = localStorage.getItem("username");
    var storedPassword = localStorage.getItem("password");

    if (loginUsername === storedUsername && loginPassword === storedPassword) {
        // Login successful, redirect to the second page
        window.location.href = "welcome.html";
    } else {
        alert("Incorrect username or password. Please try again.");
    }
}
