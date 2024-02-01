document.addEventListener("DOMContentLoaded", function () {
            const form = document.getElementById("wizardForm");
            const steps = document.querySelectorAll(".step");
            const progressBar = document.getElementById("progressBar");
            const progressLabel = document.getElementById("progressLabel");
            const thankYouMessage = document.getElementById("thankYou");
            const nextButtons = document.querySelectorAll(".next-btn");
            const prevButtons = document.querySelectorAll(".prev-btn");

            let currentStep = 1;

            nextButtons.forEach((btn) => {
                btn.addEventListener("click", function () {
                    if (currentStep < steps.length) {
                        steps[currentStep - 1].classList.add("hidden");
                        steps[currentStep].classList.remove("hidden");
                        currentStep++;
                        updateProgressBar();
                    } else {
                        // If it's the last step, show the thank you message
                        form.classList.add("hidden");
                        thankYouMessage.classList.remove("hidden");
                    }
                });
            });

            prevButtons.forEach((btn) => {
                btn.addEventListener("click", function () {
                    if (currentStep > 1) {
                        steps[currentStep - 1].classList.add("hidden");
                        steps[currentStep - 2].classList.remove("hidden");
                        currentStep--;
                        updateProgressBar();
                    }
                });
            });

            function updateProgressBar() {
                const progressPercentage = ((currentStep - 1) / (steps.length - 1)) * 100;
                progressBar.style.width = `${progressPercentage}%`;
                progressLabel.textContent = `Step ${currentStep} of ${steps.length}`;
            }

            form.addEventListener("submit", function (event) {
                event.preventDefault();
                // Perform form submission or additional processing here
                console.log("Form submitted!");
            });
        });