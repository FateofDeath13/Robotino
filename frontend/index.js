document.addEventListener("DOMContentLoaded", () => {
    const playButton = document.getElementById("playButton");
    const settingsButton = document.getElementById("settingsButton");
    
    if (playButton) playButton.addEventListener("click", () => window.location.href = "game.html");
    if (settingsButton) settingsButton.addEventListener("click", () => window.location.href = "settings.html");
});
