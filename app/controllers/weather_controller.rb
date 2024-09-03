class WeatherController < ApplicationController
  def index
    @city = params[:city] || 'São Paulo'
    weather_service = WeatherService.new(@city)
    @response = weather_service.fetch_temperature
  end
end
