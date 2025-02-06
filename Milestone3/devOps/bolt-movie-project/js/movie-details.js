// Movie Details Page
class MovieDetailsPage {
    constructor() {
        this.movieId = new URLSearchParams(window.location.search).get('id');
        this.init();
    }

    async init() {
        try {
            await this.loadMovieDetails();
            await this.loadCastAndCrew();
            await this.loadReviews();
            this.initializeBookingSystem();
            this.bindEvents();
        } catch (error) {
            console.error('Error initializing movie details:', error);
        }
    }

    async loadMovieDetails() {
        const movie = await api.getMovieDetails(this.movieId);
        
        // Update backdrop
        const backdropEl = document.querySelector('.movie-backdrop');
        backdropEl.style.backgroundImage = `url(${IMAGE_BASE_URL}${movie.backdrop_path})`;
        
        // Update poster
        const posterEl = document.querySelector('.movie-poster');
        posterEl.innerHTML = `<img src="${IMAGE_BASE_URL}${movie.poster_path}" alt="${movie.title}">`;
        
        // Update movie info
        document.querySelector('.movie-title').textContent = movie.title;
        document.querySelector('.rating').innerHTML = `${getStarRating(movie.vote_average)} (${movie.vote_average.toFixed(1)})`;
        document.querySelector('.runtime').textContent = `${movie.runtime} min`;
        document.querySelector('.release-date').textContent = new Date(movie.release_date).toLocaleDateString();
        document.querySelector('.synopsis').textContent = movie.overview;
        
        // Update genres
        const genresEl = document.querySelector('.genres');
        genresEl.innerHTML = movie.genres.map(genre => 
            `<span class="genre-tag">${genre.name}</span>`
        ).join('');
        
        // Load trailer if available
        if (movie.videos?.results?.length > 0) {
            const trailer = movie.videos.results.find(video => video.type === 'Trailer');
            if (trailer) {
                document.querySelector('.trailer-container').innerHTML = `
                    <iframe 
                        src="https://www.youtube.com/embed/${trailer.key}"
                        frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen>
                    </iframe>
                `;
            }
        }
    }

    async loadCastAndCrew() {
        const credits = await api.getMovieCredits(this.movieId);
        const castList = document.querySelector('.cast-list');
        
        // Display top 10 cast members
        castList.innerHTML = credits.cast.slice(0, 10).map(member => `
            <div class="cast-member" data-aos="fade-up">
                <img src="${member.profile_path ? IMAGE_BASE_URL + member.profile_path : '../images/placeholder-profile.jpg'}"
                     alt="${member.name}">
                <h4>${member.name}</h4>
                <p>${member.character}</p>
            </div>
        `).join('');
    }

    async loadReviews() {
        const reviews = await api.getMovieReviews(this.movieId);
        const reviewsContainer = document.querySelector('.reviews-container');
        
        if (reviews.results.length === 0) {
            reviewsContainer.innerHTML = '<p>No reviews yet. Be the first to review!</p>';
            return;
        }
        
        reviewsContainer.innerHTML = reviews.results.map(review => `
            <div class="review" data-aos="fade-up">
                <div class="review-header">
                    <h4>${review.author}</h4>
                    <span class="review-date">${new Date(review.created_at).toLocaleDateString()}</span>
                </div>
                <div class="review-content">
                    <p>${review.content}</p>
                </div>
            </div>
        `).join('');
    }

    initializeBookingSystem() {
        const dateContainer = document.querySelector('.date-picker');
        const showtimeContainer = document.querySelector('.showtime-picker');
        
        // Generate next 7 days
        const dates = Array.from({length: 7}, (_, i) => {
            const date = new Date();
            date.setDate(date.getDate() + i);
            return date;
        });
        
        dateContainer.innerHTML = dates.map(date => `
            <button class="date-option" data-date="${date.toISOString()}">
                <span class="day">${date.toLocaleDateString('en-US', {weekday: 'short'})}</span>
                <span class="date">${date.getDate()}</span>
            </button>
        `).join('');
        
        // Generate sample showtimes
        const showtimes = ['10:00', '12:30', '15:00', '17:30', '20:00', '22:30'];
        showtimeContainer.innerHTML = showtimes.map(time => `
            <button class="showtime-option" data-time="${time}">${time}</button>
        `).join('');
    }

    bindEvents() {
        // Date selection
        document.querySelectorAll('.date-option').forEach(button => {
            button.addEventListener('click', (e) => {
                document.querySelector('.date-option.selected')?.classList.remove('selected');
                e.target.closest('.date-option').classList.add('selected');
            });
        });
        
        // Showtime selection
        document.querySelectorAll('.showtime-option').forEach(button => {
            button.addEventListener('click', (e) => {
                document.querySelector('.showtime-option.selected')?.classList.remove('selected');
                e.target.classList.add('selected');
            });
        });
        
        // Book now button
        document.querySelector('.book-now-btn').addEventListener('click', () => {
            const selectedDate = document.querySelector('.date-option.selected')?.dataset.date;
            const selectedTime = document.querySelector('.showtime-option.selected')?.dataset.time;
            
            if (!selectedDate || !selectedTime) {
                alert('Please select a date and time');
                return;
            }
            
            // Redirect to booking page with selected options
            window.location.href = `/pages/booking.html?movie=${this.movieId}&date=${selectedDate}&time=${selectedTime}`;
        });
    }
}

// Initialize page
document.addEventListener('DOMContentLoaded', () => {
    new MovieDetailsPage();
});