// API Configuration
const API_KEY = 'YOUR_TMDB_API_KEY';
const BASE_URL = 'https://api.themoviedb.org/3';
const IMAGE_BASE_URL = 'https://image.tmdb.org/t/p/w500';

// API Endpoints
const endpoints = {
    nowPlaying: `${BASE_URL}/movie/now_playing`,
    upcoming: `${BASE_URL}/movie/upcoming`,
    movieDetails: (movieId) => `${BASE_URL}/movie/${movieId}`,
    movieCredits: (movieId) => `${BASE_URL}/movie/${movieId}/credits`,
    movieReviews: (movieId) => `${BASE_URL}/movie/${movieId}/reviews`,
    search: `${BASE_URL}/search/movie`
};

// Fetch wrapper with error handling
async function fetchAPI(endpoint, params = {}) {
    try {
        const queryParams = new URLSearchParams({
            api_key: API_KEY,
            ...params
        });

        const response = await fetch(`${endpoint}?${queryParams}`);
        
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }

        return await response.json();
    } catch (error) {
        console.error('Error fetching data:', error);
        throw error;
    }
}

// API Methods
const api = {
    getNowPlaying: async () => {
        return await fetchAPI(endpoints.nowPlaying);
    },

    getUpcoming: async () => {
        return await fetchAPI(endpoints.upcoming);
    },

    getMovieDetails: async (movieId) => {
        return await fetchAPI(endpoints.movieDetails(movieId));
    },

    getMovieCredits: async (movieId) => {
        return await fetchAPI(endpoints.movieCredits(movieId));
    },

    getMovieReviews: async (movieId) => {
        return await fetchAPI(endpoints.movieReviews(movieId));
    },

    searchMovies: async (query) => {
        return await fetchAPI(endpoints.search, { query });
    }
};

export default api;