from pprint import pprint
import requests
import sys

city = 'Moscow'
# url = f'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22{city}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys'

def process_one_day_forecast(forecast):
    #  {'code': '28', 'date': '25 Aug 2017', 'day': 'Fri', 'high': '74', 'low': '61', 'text': 'Mostly Cloudy'}
    new_forecast = {}
    for key in ['date', 'day', 'text']:
        new_forecast[key] = forecast[key]
    for key in ['high', 'low']:
        new_forecast[key] = round((int(forecast[key]) - 32) * (5/9), 1)
    return new_forecast


class YahooWeatherForecast:
    def get(self, city):
        url = f'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22{city}%22)&format=json'
        data = requests.get(url).json()
        forecast_data = [process_one_day_forecast(f) for f in data['query']['results']['channel']['item']['forecast']]
        return forecast_data

class CityInfo:
    def __init__(self, city, weater_forecast = None):
        self.city = city
        self._weater_forecast = weater_forecast or YahooWeatherForecast()

    def get_weater_forecast(self):
        return self._weater_forecast.get(self.city)

def _main():
    moscow_info = CityInfo(city)
    forecast = moscow_info.get_weater_forecast()
    pprint(forecast)
    return forecast

if __name__ == '__main__':
    try:
        forecast = _main()
    except:
        print("Unexpected error:", sys.exc_info()[0])
