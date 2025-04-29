
import requests
from bs4 import BeautifulSoup


def get_station_code(station_name):
    url = f"https://www.mapsofindia.com/railways/station-code/{station_name.replace(' ', '-').lower()}.html"
    html_data = requests.get(url).text
    soup = BeautifulSoup(html_data, 'html.parser')
    station_code = soup.find("table", class_="extrtable").find_all('b')[-1].get_text()
    return station_code