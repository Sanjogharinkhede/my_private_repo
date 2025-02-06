// Theme switcher functionality
const themeSwitch = document.getElementById('checkbox');
const htmlElement = document.documentElement;

// Check for saved theme preference
const savedTheme = localStorage.getItem('theme');
if (savedTheme) {
    htmlElement.setAttribute('data-bs-theme', savedTheme);
    themeSwitch.checked = savedTheme === 'light';
}

// Theme switch event listener
themeSwitch.addEventListener('change', function() {
    if (this.checked) {
        htmlElement.setAttribute('data-bs-theme', 'light');
        localStorage.setItem('theme', 'light');
    } else {
        htmlElement.setAttribute('data-bs-theme', 'dark');
        localStorage.setItem('theme', 'dark');
    }
});