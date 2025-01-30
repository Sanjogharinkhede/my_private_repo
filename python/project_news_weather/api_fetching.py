import requests,os,json
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()


# OpenWeatherMap API
def fetch_weather(city="New York"):
    api_key = os.getenv('weather_api_key')
    # url = f"https://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}"
    # url=f"https://api.openweathermap.org/data/2.5/weather?id=524901&lang=fr&appid={api_key}"
    url=f"https://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}"
    # url=f""
    response = requests.get(url)
    if response.status_code == 200:
        with open("weather.json", "w") as f:
            json.dump(response.json(), f)
        print("Weather data saved!")
    else:
        print(f"Error fetching weather data: {response.status_code}")

# NewsAPI
def fetch_news(query="us"):
    api_key = "55e333a6eefc420a908bae1279b795aa"
    url = f"https://newsapi.org/v2/top-headlines?q={query}&apiKey={api_key}"
    response = requests.get(url)
    if response.status_code == 200:
        with open("news.json", "w") as f:
            json.dump(response.json(), f)
        print("News data saved!")
    else:
        print(f"Error fetching news data: {response.status_code}")

# Run the functions

fetch_weather()  # Default city: New York
fetch_news()     # Default query: us