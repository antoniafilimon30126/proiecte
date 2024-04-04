const quizzes = [
    {
        title: "General Knowledge Quiz",
        url: "http://localhost/index_quiz.html" 
    },
  
];

const quizButtonsContainer = document.getElementById("quiz-buttons");

quizzes.forEach(quiz => {
    const button = document.createElement("button");
    button.textContent = quiz.title;
    button.classList.add("quiz-button");
    button.addEventListener("click", () => {
        window.location.href = quiz.url; 
    });
    quizButtonsContainer.appendChild(button);
});
