require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe "GET #index" do
    let(:city) { "São Paulo" }
    let(:weather_service_instance) { instance_double(WeatherService) }

    before do
      allow(WeatherService).to receive(:new).with(city).and_return(weather_service_instance)
    end

    context "quando a requisição ao serviço de clima é bem-sucedida" do
      let(:temperature_data) { { "temp" => 298.15 } }

      before do
        allow(weather_service_instance).to receive(:fetch_temperature).and_return(temperature_data)
        get :index, params: { city: city }
      end

      it "inicializa a cidade correta" do
        expect(assigns(:city)).to eq(city)
      end

      it "atribui a resposta do serviço ao @response" do
        expect(assigns(:response)).to eq(temperature_data)
      end

      it "retorna uma resposta bem-sucedida" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "quando a requisição ao serviço de clima falha" do
      before do
        allow(weather_service_instance).to receive(:fetch_temperature).and_return([])
        get :index, params: { city: city }
      end

      it "atribui um array vazio ao @response" do
        expect(assigns(:response)).to eq([])
      end

      it "retorna uma resposta bem-sucedida" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "quando a cidade não é fornecida" do
      let(:default_city) { "São Paulo" }

      before do
        allow(weather_service_instance).to receive(:fetch_temperature).and_return({})
        get :index
      end

      it "define a cidade padrão como São Paulo" do
        expect(assigns(:city)).to eq(default_city)
      end
    end
  end
end
