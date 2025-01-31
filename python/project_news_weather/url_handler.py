from http.server import BaseHTTPRequestHandler, HTTPServer
import urllib.parse
import api_fetching as backend  

class RequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path.startswith("/update_weather"):
            query = urllib.parse.urlparse(self.path).query
            params = urllib.parse.parse_qs(query)
            city = params.get("city", ["New York"])[0]

            backend.fetch_weather(city)
            print(query,params,city)
            self.send_response(200)
            self.end_headers()
        elif self.path.startswith("/update_news"):
            query = urllib.parse.urlparse(self.path).query
            params = urllib.parse.parse_qs(query)
            news_query = params.get("query", ["modi"])[0]
            backend.fetch_news(news_query)
            print(query,params,news_query)
            self.send_response(200)
            self.end_headers()
        else:
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def run(server_class=HTTPServer, handler_class=RequestHandler, port=8000):
    server_address = ("", port)
    httpd = server_class(server_address, handler_class)
    print(f"Server running on port {port}...")
    httpd.serve_forever()

if __name__ == "__main__":
    run()