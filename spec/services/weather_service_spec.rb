require 'rails_helper'

RSpec.describe WeatherService, type: :service do
  let(:city) { "São Paulo" }
  let(:weather_service) { described_class.new(city) }

  describe "#fetch_weather_data" do
    context "quando a requisição é bem-sucedida" do
      let(:response_body) do
        {
          "main" => {
            "temp" => 298.15
          }
        }
      end

      before do
        stub_request(:get, "#{ENV['FOREWEATHER_API_BASE_URL']}/weather")
          .with(query: { q: city, appid: ENV['FOREWEATHER_API_KEY'] })
          .to_return(status: 200, body: response_body.to_json, headers: { 'Content-Type' => 'application/json' })
      end

      it "retorna os dados de tempo" do
        response = weather_service.fetch_weather_data
        expect(response['main']['temp']).to eq(298.15)
      end
    end

    context "quando a requisição falha" do
      before do
        stub_request(:get, "#{ENV['FOREWEATHER_API_BASE_URL']}/weather")
          .with(query: { q: city, appid: ENV['FOREWEATHER_API_KEY'] })
          .to_return(status: 500, body: "")
      end

      it "retorna uma resposta vazia" do
        response = weather_service.fetch_weather_data
        expect(response.body).to be_empty
      end
    end
  end

  describe "#fetch_temperature" do
    context "quando a requisição é bem-sucedida" do
      let(:response_body) do
        {
          "main" => {
            "temp" => 298.15
          }
        }
      end

      before do
        stub_request(:get, "#{ENV['FOREWEATHER_API_BASE_URL']}/weather")
          .with(query: { q: city, appid: ENV['FOREWEATHER_API_KEY'] })
          .to_return(status: 200, body: response_body.to_json, headers: { 'Content-Type' => 'application/json' })
      end

      it "retorna o hash com os dados principais" do
        main_data = weather_service.fetch_temperature
        expect(main_data['temp']).to eq(298.15)
      end
    end

    context "quando a requisição falha" do
      before do
        stub_request(:get, "#{ENV['FOREWEATHER_API_BASE_URL']}/weather")
          .with(query: { q: city, appid: ENV['FOREWEATHER_API_KEY'] })
          .to_return(status: 500, body: "")
      end

      it "retorna um array vazio" do
        main_data = weather_service.fetch_temperature
        expect(main_data).to eq([])
      end
    end
  end
end
