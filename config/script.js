// Your JavaScript code goes here
document.addEventListener("DOMContentLoaded", function() {
    const urlParams = new URLSearchParams(window.location.search);
    const username = urlParams.get("user");

    if (username) {
        document.getElementById("username").textContent = username;
    } else {
        window.location.href = "index.html"; // Redirect if no user is logged in
    }

    // Handle form submission for workout plan
    document.getElementById('submit-workout').addEventListener('click', function() {
        const selectedGoal = document.getElementById('goal').value;
        const selectedExercise = document.getElementById('exercise').value;
        const workoutDate = document.getElementById('workout-date').value;
        const workoutDuration = document.getElementById('workout-duration').value;  // Added duration

        if (selectedGoal && selectedExercise && workoutDate && workoutDuration) {
            document.getElementById('workout-summary').innerHTML = `
                <h3>Your Workout Plan:</h3>
                <p><strong>Goal:</strong> ${selectedGoal}</p>
                <p><strong>Exercise:</strong> ${selectedExercise}</p>
                <p><strong>Workout Date:</strong> ${workoutDate}</p>
                <p><strong>Workout Duration:</strong> ${workoutDuration} minutes</p>
            `;
        } else {
            alert("Please complete all fields before submitting.");
        }
    });
});
