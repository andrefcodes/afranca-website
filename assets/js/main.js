/*
/// Copyright (C) 2026 Andre Franca <andre@abf.li>
///
/// This program is free software: you can redistribute it and/or modify
/// it under the terms of the GNU Affero General Public License as published by
/// the Free Software Foundation, either version 3 of the License, or
/// (at your option) any later version.
///
/// This program is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/// GNU Affero General Public License for more details.
///
/// You should have received a copy of the GNU Affero General Public License
/// along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

// Copy code block functionality

document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll("pre").forEach(function (pre) {
        const button = document.createElement("button");
        button.className = "copy-code-button";
        button.textContent = "Copy";
        button.addEventListener("click", function () {
            const code = pre.querySelector("code") || pre;
            navigator.clipboard.writeText(code.textContent).then(function () {
                button.textContent = "Copied!";
                setTimeout(function () {
                    button.textContent = "Copy";
                }, 2000);
            });
        });
        pre.style.position = "relative";
        pre.appendChild(button);
    });
});

// Outdated content notice - show if post is older than 1 year

document.addEventListener("DOMContentLoaded", function () {
    const outdatedNotice = document.querySelector(".notice-outdated");

    if (outdatedNotice) {
        const publishedDate = new Date(outdatedNotice.dataset.published);
        const now = new Date();
        const msPerYear = 365.25 * 24 * 60 * 60 * 1000;
        const ageInYears = (now - publishedDate) / msPerYear;

        if (ageInYears >= 1) {
            const years = Math.floor(ageInYears);
            const ageText = years === 1 ? "1 year" : years + " years";

            const ageSpan = outdatedNotice.querySelector(".post-age");
            if (ageSpan) {
                ageSpan.textContent = ageText;
            }

            outdatedNotice.style.display = "block";
        }
    }
});

// Smooth scroll for anchor links

document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll('a[href^="#"]').forEach(function (anchor) {
        anchor.addEventListener("click", function (e) {
            const href = this.getAttribute("href");
            if (!href || href === "#") {
                return;
            }

            const targetId = href.slice(1);
            const target = document.getElementById(targetId);
            if (!target) {
                return;
            }

            e.preventDefault();
            target.scrollIntoView({
                behavior: "smooth",
            });
            history.pushState(null, "", href);
        });
    });
});

// Blogroll random picker

document.addEventListener("DOMContentLoaded", function () {
    const randomButton = document.querySelector(".blogroll-random-button");
    if (!randomButton) {
        return;
    }

    const blogLinks = Array.from(document.querySelectorAll(".blogroll-link"));
    if (!blogLinks.length) {
        randomButton.disabled = true;
        randomButton.title = "No blogroll entries available";
        return;
    }

    randomButton.addEventListener("click", function () {
        const randomLink =
            blogLinks[Math.floor(Math.random() * blogLinks.length)];
        if (randomLink && randomLink.href) {
            window.open(randomLink.href, "_blank", "noopener");
        }
    });
});
