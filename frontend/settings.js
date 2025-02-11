document.addEventListener("DOMContentLoaded", () => {
    const backToHomeSettings = document.getElementById("backToHomeSettings");
    
    if (backToHomeSettings) backToHomeSettings.addEventListener("click", () => window.location.href = "index.html");
});
