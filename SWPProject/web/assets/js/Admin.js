function filterAccounts(formType) {
    const searchInput = formType === 'Ban' ? document.getElementById('searchInputBan').value.toLowerCase() : document.getElementById('searchInputUnban').value.toLowerCase();
    const options = formType === 'Ban' ? document.getElementById('accountSelectBan').options : document.getElementById('accountSelectUnban').options;

    for (let i = 0; i < options.length; i++) {
        const optionText = options[i].text.toLowerCase();
        options[i].style.display = optionText.includes(searchInput) ? 'block' : 'none';
    }
}

function filterAccounts() {
    const input = document.getElementById('searchInput');
    const filter = input.value.toLowerCase();
    const select = document.getElementById('accountSelect');
    const options = select.options;

    // Loop through all options and hide those that don't match the search
    for (let i = 1; i < options.length; i++) { // Start from 1 to skip the first disabled option
        const accountName = options[i].text.toLowerCase();
        options[i].style.display = accountName.includes(filter) ? '' : 'none';
    }
}

function loadTabContent(page) {
    const xhr = new XMLHttpRequest();
    xhr.open("GET", page, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            document.getElementById('tabContent').innerHTML = xhr.responseText;
        }
    };
    xhr.send();
}
