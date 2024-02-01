var styledButton = document.getElementById("styledButton");
    var arrowIcon = document.getElementById("arrowIcon");

    // Add click event listener to toggle arrow visibility
    styledButton.addEventListener("click", function() {
        // Toggle arrow visibility by toggling a class
        arrowIcon.classList.toggle("hidden");
    });