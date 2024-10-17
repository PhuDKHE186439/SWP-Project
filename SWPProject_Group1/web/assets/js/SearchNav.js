let currentQuery = "";
let currentMatchIndex = 0;
let matches = [];

function searchInPage() {
    const query = document.getElementById("searchInput").value.trim().toLowerCase();

    if (query === "") {
        alert("Please enter a search term.");
        return false;
    }

    // If the query is different, reset highlights and matches
    if (query !== currentQuery) {
        currentQuery = query;
        currentMatchIndex = 0;
        removeHighlights();
        matches = highlightMatches(query);
    }

    if (matches.length === 0) {
        alert("No matches found.");
        return false;
    }

    // Scroll to the current match and move to the next
    scrollToMatch(currentMatchIndex);
    currentMatchIndex = (currentMatchIndex + 1) % matches.length; // Loop through matches

    return false;
}

function highlightMatches(query) {
    const walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, null, false);
    const regex = new RegExp(query, 'gi');
    let node;
    let foundMatches = [];

    while ((node = walker.nextNode()) !== null) {
        const nodeText = node.nodeValue;
        let match;

        while ((match = regex.exec(nodeText)) !== null) {
            const span = document.createElement("span");
            span.className = "highlight";
            const before = document.createTextNode(nodeText.slice(0, match.index));
            const matchText = document.createTextNode(nodeText.slice(match.index, match.index + query.length));
            const after = document.createTextNode(nodeText.slice(match.index + query.length));

            span.appendChild(matchText);
            const parentNode = node.parentNode;
            parentNode.insertBefore(before, node);
            parentNode.insertBefore(span, node);
            parentNode.insertBefore(after, node);
            parentNode.removeChild(node);

            foundMatches.push(span);
        }
    }

    return foundMatches;
}

function scrollToMatch(index) {
    const match = matches[index];
    if (match) {
        match.scrollIntoView({ behavior: "smooth", block: "center" });
        match.classList.add("highlight-scrolled");
    }
}

function removeHighlights() {
    const highlights = document.querySelectorAll("span.highlight");
    highlights.forEach(function (highlight) {
        const textNode = document.createTextNode(highlight.textContent);
        highlight.parentNode.replaceChild(textNode, highlight);
    });
}
