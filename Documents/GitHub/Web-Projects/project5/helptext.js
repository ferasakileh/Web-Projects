// JavaScript to fetch text from an external file and insert it into the paragraph
fetch('helpstring.txt')
.then(response => response.text())
.then(data => {
    document.getElementById('myParagraph').innerText = data;
})
.catch(error => console.error('Error loading text:', error));