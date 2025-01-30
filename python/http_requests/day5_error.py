import requests,time,logging
 
def example(url):
    max_retries = 3  
    retry_delay = 2 
    
    for attempt in range(max_retries):
        try:
            response = requests.get(url)
            response.raise_for_status()  
            print("Data:", response.json())
            break  
    
        except requests.exceptions.RequestException as e:
            print(f"Attempt {attempt + 1} failed: {e}")
            time.sleep(retry_delay)  # Wait before retrying
    
    else:
        print("Max retries reached. Request failed.")


def cache_example():
 
    cache = {}
    
    def get_data(url):
        if url in cache :
            # print("Returning Cached Data")
            return cache[url]["data"]
    
        response = requests.get(url)
        if response.status_code == 200:
            cache[url] = {"data": response.json()}
            return cache[url]["data"]
    
        return None
    
    url = "https://jsonplaceholder.typicode.com/posts/1"
    print(get_data(url))
    
    print("cache is here !!!!")
    print(cache)
    url = "https://jsonplaceholder.typicode.com/posts/2"
    print(get_data(url))
    
    print("cache is here !!!!")
    print(cache)

def logging_example():
 
    logging.basicConfig(filename="api_requests.log", level=logging.INFO)
    
    url = "https://jsonplaceholder.typicode.com/posts/101"
    
    response = requests.get(url)
    
    if response.status_code == 200:
        logging.info(f"Success: {url} - {response.status_code}")
    else:
        logging.error(f"Error: {url} - {response.status_code}")
    

def working_example():
    url = "https://jsonplaceholde.typicode.com/posts/1"
    example(url)

    cache_example()