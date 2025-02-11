document.addEventListener("DOMContentLoaded", () => {
    const backToHome = document.getElementById("backToHome");
    
    if (backToHome) backToHome.addEventListener("click", () => window.location.href = "index.html");
});

document.addEventListener("DOMContentLoaded", () => {
    const directionSlider = document.getElementById("direction");
    const strengthSlider = document.getElementById("strength");

    // Funktion zum animieren des Sliders hin und her
    const animateSlider = (slider, stopAnimationCallback) => {
        let currentValue = parseInt(slider.value, 10);
        const maxValue = parseInt(slider.max, 10);
        const minValue = parseInt(slider.min, 10);
        let direction = 1; // 1 für vorwärts, -1 für rückwärts

        const animate = () => {
            // Wenn die Animation gestoppt wurde, einfach nichts tun
            if (stopAnimationCallback()) {
                return;
            }

            currentValue += direction;

            // Wenn der Wert 100 erreicht, Richtung umkehren
            if (currentValue >= maxValue) {
                direction = -1;  // Umkehr der Richtung
            }

            // Wenn der Wert 0 erreicht, Richtung umkehren
            if (currentValue <= minValue) {
                direction = 1;  // Umkehr der Richtung
            }

            slider.value = currentValue;
            requestAnimationFrame(animate); // Nächsten Frame anfordern
        };

        animate();
    };

    // Zustände, ob die Animation gestoppt wurde
    let directionStopAnimation = false;
    let strengthStopAnimation = false;

    // Verhindern, dass der Wert durch Ziehen verändert wird (initiale Blockierung)
    directionSlider.style.pointerEvents = "none";
    strengthSlider.style.pointerEvents = "none";

    // Event-Listener für Klick auf den Slider
    directionSlider.addEventListener("click", (e) => {
        const rect = e.target.getBoundingClientRect();
        const offsetX = e.clientX - rect.left;
        const newValue = Math.min(Math.max(offsetX / rect.width, 0), 1);
        directionSlider.value = newValue * directionSlider.max;

        // Stoppe die Animation für diesen Slider und erlaube den Wert zu setzen
        directionStopAnimation = true;
        directionSlider.style.pointerEvents = "auto"; // Erlaube das Setzen des Werts durch Klick
    });

    strengthSlider.addEventListener("click", (e) => {
        const rect = e.target.getBoundingClientRect();
        const offsetX = e.clientX - rect.left;
        const newValue = Math.min(Math.max(offsetX / rect.width, 0), 1);
        strengthSlider.value = newValue * strengthSlider.max;

        // Stoppe die Animation für diesen Slider und erlaube den Wert zu setzen
        strengthStopAnimation = true;
        strengthSlider.style.pointerEvents = "auto"; // Erlaube das Setzen des Werts durch Klick
    });

    // Variable, die verfolgt, welche Animation gestoppt werden soll
    let stopFirstAnimation = true;

    // Event-Listener für das Drücken der Leertaste
    document.addEventListener("keydown", (e) => {
        if (e.code === "Space") {
            // Stoppe beim ersten Mal die erste Animation
            if (stopFirstAnimation) {
                directionStopAnimation = true;  // Stoppe die erste Animation
            }
            // Beim zweiten Mal stoppe die zweite Animation
            else {
                strengthStopAnimation = true;  // Stoppe die zweite Animation
            }

            // Toggle die Variable, um beim nächsten Mal die andere Animation zu stoppen
            stopFirstAnimation = !stopFirstAnimation;
        }
    });

    // Start der Animation bei Laden der Seite
    animateSlider(directionSlider, () => directionStopAnimation);
    animateSlider(strengthSlider, () => strengthStopAnimation);
});
