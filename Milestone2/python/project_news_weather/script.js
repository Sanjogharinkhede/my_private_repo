// Function to update weather data
function updateWeather() {
  const city = document.getElementById('cityInput').value;
  if (!city) {
    alert('Please enter a city name.');
    return;
  }

  // Call Python backend to fetch weather data
  fetch(`/update_weather?city=${city}`)
    .then(() => {
      // Reload weather data from JSON file
      fetch('weather.json')
        .then(response => response.json())
        .then(data => {
          const weatherDiv = document.getElementById('weather');
          if (data.cod === 200) {
            const weather = data.weather[0];
            const main = data.main;
            weatherDiv.innerHTML = `
              <p><strong>City:</strong> ${data.name}</p>
              <p><strong>Condition:</strong> ${weather.description}</p>
              <p><strong>Temperature:</strong> ${main.temp}°C</p>
              <p><strong>Humidity:</strong> ${main.humidity}%</p>
              <p><strong>Wind Speed:</strong> ${data.wind.speed} m/s</p>
            `;
          } else {
            weatherDiv.innerHTML = `<p>Error: ${data.message}</p>`;
          }
        });
    })
    .catch(error => console.error('Error updating weather data:', error));
}

// Function to update news data
function updateNews() {
  const query = document.getElementById('newsQuery').value;
  if (!query) {
    alert('Please enter a search term.');
    return;
  }

  // Call Python backend to fetch news data
  fetch(`/update_news?query=${query}`)
    .then(() => {
      // Reload news data from JSON file
      fetch('news.json')
        .then(response => response.json())
        .then(data => {
          const newsDiv = document.getElementById('news');
          if (data.status === 'ok') {
            const articles = data.articles.slice(0, 3); //no of articles
            newsDiv.innerHTML = articles.map(article => `
              <div class="card mb-3">
                <div class="card-body">
                  <h5 class="card-title">${article.title}</h5>
                  <p class="card-text">${article.description}</p>
                  <a href="${article.url}" target="_blank" class="btn btn-primary">Read More</a>
                </div>
              </div>
            `).join('');
          } else {
            newsDiv.innerHTML = `<p>Error: ${data.message}</p>`;
          }
        });
    })
    .catch(error => console.error('Error updating news data:', error));
}