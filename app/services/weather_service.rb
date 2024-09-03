class WeatherService
  include HTTParty
  base_uri ENV['FOREWEATHER_API_BASE_URL']

  def initialize(city)
    @options = { query: { q: city, appid: ENV['FOREWEATHER_API_KEY'] } }
  end

  def fetch_weather_data
    self.class.get('/weather', @options)
  end

  def fetch_temperature
    response = fetch_weather_data

    if response.success?
      response['main']
    else
      []
    end
  end
end
