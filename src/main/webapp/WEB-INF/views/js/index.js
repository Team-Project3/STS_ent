/*const imagesLoaded = require('imagesloaded');*/
import Navigation from "./navigation.js";

// Preload images
const preloadImages = () => {
    return new Promise((resolve, reject) => {
        imagesLoaded(document.querySelectorAll('.screen'), {background: true}, resolve);
    });
};

// Preload fonts
const preloadFonts = () => {
    return new Promise((resolve, reject) => {
        WebFont.load({
            typekit: {
                id: 'cze1cgq'
            },
            active: resolve
        });
    });
};

// Preload fonts and images
Promise.all([preloadImages(), preloadFonts()]).then(() => {
    new Navigation(document.querySelector('.menu'));
    // Remove loader (loading class)
    document.body.classList.remove('loading');
});

document.documentElement.className="js";
var supportsCssVars=function(){var e,t=document.createElement("style");
return t.innerHTML="root: { --tmp-var: bold; }",document.head.appendChild(t),e=!!(window.CSS&&window.CSS.supports&&window.CSS.supports("font-weight","var(--tmp-var)")),t.parentNode.removeChild(t),e};
supportsCssVars()||alert("Please view this demo in a modern browser that supports CSS Variables.");