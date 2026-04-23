/**
 * Andre Franca Hugo Theme - Main JavaScript
 */

// Copy code block functionality
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('pre').forEach(function(pre) {
        const button = document.createElement('button');
        button.className = 'copy-code-button';
        button.textContent = 'Copy';
        button.addEventListener('click', function() {
            const code = pre.querySelector('code') || pre;
            navigator.clipboard.writeText(code.textContent).then(function() {
                button.textContent = 'Copied!';
                setTimeout(function() {
                    button.textContent = 'Copy';
                }, 2000);
            });
        });
        pre.style.position = 'relative';
        pre.appendChild(button);
    });
});

// Outdated content notice - show if post is older than 1 year
document.addEventListener('DOMContentLoaded', function() {
    const outdatedNotice = document.querySelector('.notice-outdated');

    if (outdatedNotice) {
        const publishedDate = new Date(outdatedNotice.dataset.published);
        const now = new Date();
        const msPerYear = 365.25 * 24 * 60 * 60 * 1000;
        const ageInYears = (now - publishedDate) / msPerYear;

        if (ageInYears >= 1) {
            const years = Math.floor(ageInYears);
            const ageText = years === 1 ? '1 year' : years + ' years';

            const ageSpan = outdatedNotice.querySelector('.post-age');
            if (ageSpan) {
                ageSpan.textContent = ageText;
            }

            outdatedNotice.style.display = 'block';
        }
    }
});

// Smooth scroll for anchor links
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            if (href !== '#') {
                e.preventDefault();
                const target = document.querySelector(href);
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth'
                    });
                }
            }
        });
    });
});

// FitVids - Makes video embeds responsive (vanilla JS version)
document.addEventListener('DOMContentLoaded', function() {
    var selectors = [
        'iframe[src*="player.vimeo.com"]',
        'iframe[src*="youtube.com"]',
        'iframe[src*="youtube-nocookie.com"]',
        'iframe[src*="kickstarter.com"][src*="video.html"]',
    ];

    var allVideos = document.querySelectorAll(selectors.join(','));

    allVideos.forEach(function(video) {
        var videoWidth = video.getAttribute('width') || video.offsetWidth;
        var videoHeight = video.getAttribute('height') || video.offsetHeight;

        if (!videoWidth || !videoHeight) return;

        var ratio = parseFloat(videoHeight) / parseFloat(videoWidth);

        var wrapper = document.createElement('div');
        wrapper.className = 'fluid-width-video-wrapper';
        wrapper.style.paddingTop = (ratio * 100) + '%';

        video.parentNode.insertBefore(wrapper, video);
        wrapper.appendChild(video);

        video.removeAttribute('height');
        video.removeAttribute('width');
        video.style.position = 'absolute';
        video.style.top = '0';
        video.style.left = '0';
        video.style.width = '100%';
        video.style.height = '100%';
    });
});
