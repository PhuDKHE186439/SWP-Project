function filterAccounts(formType) {
    let searchInput, options;
    if (formType === 'Ban') {
        searchInput = document.getElementById('searchInputBan').value.toLowerCase();
        options = document.getElementById('accountSelectBan').options;
    } else if (formType === 'Unban') {
        searchInput = document.getElementById('searchInputUnban').value.toLowerCase();
        options = document.getElementById('accountSelectUnban').options;
    } else if (formType === 'AccountList') {
        searchInput = document.getElementById('searchInput').value.toLowerCase();
        options = document.getElementById('accountSelect').options;
    } else {
        return;
    }
    for (let i = 1; i < options.length; i++) {
        const accountName = options[i].text.toLowerCase();
        options[i].style.display = accountName.includes(searchInput) ? '' : 'none';
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
