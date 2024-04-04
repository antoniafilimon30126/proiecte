const questions= [
    {
        question: "Which colour is the most common on the national flags of the world, featuring on 75% of national flags?",
        answers: [
            {text: "Red", correct: true},
            {text: "Blue", correct: false},
            {text: "White", correct: false},
            {text: "Green", correct: false},

        ]
    },

    {
        question: "Which actor was the first female to be paid $1million dollars for a role?",
        answers: [
            {text: "Judi Dench", correct: false},
            {text: "Sandra Bullock", correct: false},
            {text: "Elizabeth Taylor", correct: true},
            {text: "Audrey Hepburn", correct: false},

        ]
    },

    {
        question: "Which famous pop musician sang at Princess Diana's funeral?",
    
        answers: [
            {text: "Prince", correct: false},
            {text: "Michael Jackson", correct: false},
            {text: "Elton John", correct: true},
            {text: "Madonna", correct: false},

        ]
    },

    {
        question: "What country has the highest life expectancy?",
    
        answers: [
            {text: "Moscow", correct: false},
            {text: "Hong Kong", correct: true},
            {text: "Bucharest", correct: false},
            {text: "Rome", correct: false},

        ]
    },

    {
        question: "What country has the most islands?",
    
        answers: [
            {text: "Sweden", correct: true},
            {text: "Spain", correct: false},
            {text: "Ireland", correct: false},
            {text: "Thailand", correct: false},

        ]
    },
    {
        question: "Which is the smallest continent in the world?",
    
        answers: [
            {text: "Asia", correct: false},
            {text: "Europe", correct: false},
            {text: "Africa", correct: false},
            {text: "Australia", correct: true},

        ]
    },


];

const questionElement = document.getElementById("question");
const answerButtonsElement = document.getElementById("answer-buttons");
const nextQuestion = document.getElementById("next-btn");


let currentQuestionIndex = 0;
let score = 0; 

function startQuiz(){

    currentQuestionIndex = 0;
    score = 0; 
    nextQuestion.innerHTML = "Next Question";
    showQuestion();
}

function showQuestion(){
    resetState();
    let currentQuestion = questions[currentQuestionIndex];
    let questionNo = currentQuestionIndex + 1;
    questionElement.innerHTML = questionNo + ". " + currentQuestion.question;

    currentQuestion.answers.forEach(answer => {
        const button = document.createElement("button");
        button.innerHTML = answer.text;
        button.classList.add("btn");
        answerButtonsElement.appendChild(button);
       if(answer.correct){
           button.dataset.correct = answer.correct;
       }
        button.addEventListener("click", selectAnswer);
   
    });
}


function resetState(){
    nextQuestion.style.display = "none";
    //const answerButtons = document.getElementById("answer-buttons"); 

        while(answerButtonsElement.firstChild){
            answerButtonsElement.removeChild(answerButtonsElement.firstChild);
        }
    }


function selectAnswer(e){
    const selectedBtn = e.target;
    const isCorrect = selectedBtn.dataset.correct === "true";

    if(isCorrect){

        selectedBtn.classList.add("correct");
        score++; 
    } else {

        selectedBtn.classList.add("incorrect");
    }
    Array.from(answerButtonsElement.children).forEach(button => {
        if(button.dataset.correct === "true"){
            button.classList.add("correct");
        }
        button.disabled = true; 
    });
    nextQuestion.style.display= "block";
}

function showScore(){
    resetState();
    questionElement.innerHTML = `You scored ${score} out of ${questions.length}!`;
    nextQuestion.innerHTML = "Play again";
    nextQuestion.style.display = "block";
}


function handleNextButton(){
    currentQuestionIndex++;
    if(currentQuestionIndex < questions.length){
        showQuestion();
    } else {
        showScore();
    }
}


nextQuestion.addEventListener("click", () => {
    if(currentQuestionIndex < questions.length){
        handleNextButton();
    } else {
        startQuiz();
    }
});

document.addEventListener("DOMContentLoaded", startQuiz);
