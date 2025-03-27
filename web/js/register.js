function validateForm() {
    let username = document.getElementById("user-name").value.trim();
    let email = document.getElementById("user-email").value.trim();
    let password = document.getElementById("user-pass").value;
    let repass = document.getElementById("user-repeatpass").value;

    if (username === "" || email === "" || password === "" || repass === "") {
        alert("Please fill in all fields!");
        return false;
    }

    if (!/^\S+@\S+\.\S+$/.test(email)) {
        alert("Invalid email format!");
        return false;
    }

    if (password.length < 3) {
        alert("Password must be at least 6 characters!");
        return false;
    }

    if (password !== repass) {
        alert("Passwords do not match!");
        return false;
    }

    return true;
}
