window.addEventListener('DOMContentLoaded', () => {
    const observer = new IntersectionObserver(entries => {
        entries.forEach(entry => {
            const id = entry.target.getAttribute('id');
            // Find the link in the nav that points to this section's ID
            const navLink = document.querySelector(`nav li a[href="/#${id}"]`);
            
            if (entry.isIntersecting) {
                // Remove active class from all links and add to the current one
                document.querySelectorAll('nav li a').forEach(link => link.classList.remove('active'));
                if (navLink) navLink.classList.add('active');
            }
        });
    }, { 
        // rootMargin triggers the highlight when the section is 40% from the top
        rootMargin: '-10% 0px -60% 0px', 
    });

    // Track all sections that have an ID
    document.querySelectorAll('section[id]').forEach((section) => {
        observer.observe(section);
    });
});
