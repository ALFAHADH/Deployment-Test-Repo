const timeElement = document.getElementById('time');

if (timeElement) {
    timeElement.textContent = new Date().toLocaleString();
}
