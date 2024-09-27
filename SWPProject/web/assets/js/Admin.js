function filterAccounts() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const rows = document.querySelectorAll('#accountTableBody tr');

        rows.forEach(row => {
            const accountName = row.cells[1].textContent.toLowerCase();
            row.style.display = accountName.includes(searchInput) ? '' : 'none';
        });
    }
    



function createAccount() {
    const accountName = document.getElementById("modalAccountName").value;
    const password = document.getElementById("modalPassword").value;
    const email = document.getElementById("modalEmail").value;
    const phoneNumber = document.getElementById("modalPhoneNumber").value;
    const role = document.getElementById("modalRole").value;

    if (accountName && password && email && phoneNumber && role) {
        const formData = new FormData();
        formData.append("username", accountName);
        formData.append("password", password);
        formData.append("email", email);
        formData.append("phoneNumber", phoneNumber);
        formData.append("roleID", role); // Ensure roleID matches the expected integer ID

        fetch("CreateAccountServlet", {
            method: "POST",
            body: formData
        })
        .then(response => {
            if (response.ok) {
                location.reload(); // Reload the page to see the new account
            } else {
                alert("Failed to create account");
            }
        })
        .catch(error => console.error('Error:', error));
    } else {
        alert("Please fill in all fields");
    }
}
