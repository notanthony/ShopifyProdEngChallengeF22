# app/services/coinbase_service.rb
module ApiServices
    class Weather
        cattr_reader :weather_client, instance_accessor: false do
        WeatherApiClient.new
        end
    
        def self.get_current_weather(options)
            weather_client.get_current_weather(options)
        end
    end
end