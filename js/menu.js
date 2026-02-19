document.addEventListener('DOMContentLoaded', () => {
    const toggleButton = document.getElementById('menu-toggle');
    const header = document.getElementById('site-header');
    const navLinks = document.querySelectorAll('#main-nav a');

    // Toggle menu on button click
    toggleButton.addEventListener('click', () => {
        header.classList.toggle('expanded');
    });

    // Close menu automatically after clicking a link
    navLinks.forEach(link => {
        link.addEventListener('click', () => {
            header.classList.remove('expanded');
        });
    });
});
