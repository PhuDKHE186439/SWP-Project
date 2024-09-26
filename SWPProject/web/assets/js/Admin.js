function filterAccounts() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const rows = document.querySelectorAll('#accountTableBody tr');

        rows.forEach(row => {
            const accountName = row.cells[1].textContent.toLowerCase();
            row.style.display = accountName.includes(searchInput) ? '' : 'none';
        });
    }