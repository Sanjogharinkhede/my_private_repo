// Function to fetch and display questions for a specific tab
function loadQuiz(fileName, containerId) {
  fetch(fileName)
    .then(response => response.text())
    .then(data => {
      const questionsArray = data
        .split("==============================================")
        .filter(section => section.trim().length > 0)
        .map(section => {
          const lines = section.trim().split("\n"); // Split by lines
          let question = "";
          let options = [];
          let answer = "";

          // Find the index where options start (lines starting with "a)", "b)", etc.)
          let optionStartIndex = lines.findIndex(line => line.trim().startsWith("a)")) ;
          console.log(optionStartIndex);
          
          if (optionStartIndex==-1){
            optionStartIndex = lines.findIndex(line => line.trim().startsWith("A)"))
          }

          // Everything before the first option is part of the question
          question = lines.slice(0, optionStartIndex).join("\n").trim(); // Join with newlines

          // The next 4 lines are options
          options = lines.slice(optionStartIndex, optionStartIndex + 4);

          // The line after the options is the answer
          answer = lines[optionStartIndex + 5]?.trim();

          if (!answer) {
            // If answer is undefined, empty, or null
            answer = lines[optionStartIndex + 4]?.trim();
          }
          return { question, options, answer };
        });

      displayQuestions(questionsArray, containerId); // Call display function
    })
    .catch(error => console.error(`Error fetching questions from ${fileName}:`, error));
}

// Render the questions dynamically
function displayQuestions(questionsArray, containerId) {
  const container = document.querySelector(`#${containerId}`);
  container.innerHTML = ""; // Clear previous content

  questionsArray.forEach((item, index) => {
    const cardHTML = `
      <div class="my_card my-3">
        <div class="card-body">
          <h5 class="card-title">${item.question.replace(/\n/g, "<br>")}</h5> <!-- Replace newlines with <br> -->
          <ul class="list-group list-group-flush">
            ${item.options
              .map(
                (option, i) =>
                  `<li class="list-group-item">
                         ${option}
                  </li>`
              )
              .join("")}
          </ul>
          <button class="btn btn-primary mt-3" onclick="toggleAnswer('${containerId}', ${index})">
            Show Answer
          </button>
          <p class="mt-2 d-none" id="answer-${containerId}-${index}">
            <strong>Answer:</strong> ${item.answer}
          </p>
        </div>
      </div>
    `;
    container.innerHTML += cardHTML; // Append the card to the container
  });
}

// Toggle the visibility of the answer
function toggleAnswer(containerId, index) {
  const answerElement = document.getElementById(`answer-${containerId}-${index}`);
  answerElement.classList.toggle("d-none");
}

// Load the default quiz (Day 1) when the page loads
document.addEventListener("DOMContentLoaded", () => {
  loadQuiz("quizzes/day1.txt", "questionContainerDay1");
});

// Add event listeners to tabs to load quizzes dynamically
document.querySelectorAll(".nav-link").forEach(tab => {
  tab.addEventListener("click", () => {
    const targetId = tab.getAttribute("data-bs-target").replace("#", ""); // Get target container ID
    const fileName = `quizzes/${targetId}.txt`; // Map tab ID to file name
    loadQuiz(fileName, `questionContainer${targetId.charAt(0).toUpperCase() + targetId.slice(1)}`);
  });
});