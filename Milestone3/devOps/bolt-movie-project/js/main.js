// DOM Elements
const nowShowingContainer = document.getElementById('nowShowingMovies');
const comingSoonContainer = document.getElementById('comingSoonMovies');
const searchInput = document.querySelector('.search-input');

// Initialize AOS
AOS.init({
    duration: 1000,
    once: true
});

// Create Movie Card
function createMovieCard(movie) {
    const card = document.createElement('div');
    card.className = 'col-md-4 col-lg-3 mb-4';
    card.innerHTML = `
        <div class="movie-card" data-aos="fade-up">
            <img src="${movie.poster_path ? IMAGE_BASE_URL + movie.poster_path : 'images/placeholder.jpg'}" 
                 alt="${movie.title}" class="card-img">
            <div class="movie-info">
                <h5 class="movie-title">${movie.title}</h5>
                <div class="movie-rating">
                    <span class="stars">${getStarRating(movie.vote_average)}</span>
                    <span class="rating-number">${movie.vote_average.toFixed(1)}</span>
                </div>
            </div>
        </div>
    `;

    card.addEventListener('click', () => {
        window.location.href = `/pages/movie-details.html?id=${movie.id}`;
    });

    return card;
}

// Generate star rating
function getStarRating(rating) {
    const stars = '★'.repeat(Math.round(rating / 2)) + '☆'.repeat(5 - Math.round(rating / 2));
    return stars;
}

// Load Movies
async function loadMovies() {
    try {
        // Load Now Playing Movies
        const nowPlaying = await api.getNowPlaying();
        nowPlaying.results.forEach(movie => {
            nowShowingContainer.appendChild(createMovieCard(movie));
        });

        // Load Upcoming Movies
        const upcoming = await api.getUpcoming();
        upcoming.results.forEach(movie => {
            comingSoonContainer.appendChild(createMovieCard(movie));
        });
    } catch (error) {
        console.error('Error loading movies:', error);
    }
}

// Search functionality
let searchTimeout;
searchInput.addEventListener('input', (e) => {
    clearTimeout(searchTimeout);
    searchTimeout = setTimeout(async () => {
        const query = e.target.value.trim();
        if (query.length > 2) {
            try {
                const results = await api.searchMovies(query);
                // Handle search results (implement search results display)
                console.log(results);
            } catch (error) {
                console.error('Error searching movies:', error);
            }
        }
    }, 500);
});

// Initialize
document.addEventListener('DOMContentLoaded', () => {
    loadMovies();
});