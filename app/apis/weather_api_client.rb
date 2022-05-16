require 'httparty'
class WeatherApiClient
    include HTTParty
    debug_output $stdout
    base_uri 'https://api.openweathermap.org'
    default_timeout 3 # hard time out after 3 seconds 
    CACHE_EXPIRY_TIME = 60 # seconds before the cached results expire

    def api_key
        # You need to get an api key here https://openweathermap.org/
        # In replit you can add it to the Secrets 
        ENV['WEATHER_API_KEY']
    end

    def base_path
        "/data/2.5/weather?appid=#{api_key}"
    end

    def handle_timeouts
        begin 
            yield
        rescue Net::OpenTimeout, Net::ReadTimeout
            {}
        end 
    end 

    def build_url_from_options(options = {})
        # This way of doing it allows this client to be expanded to include api requests using lon/lat, city ids, etc.
        if options.key?(:city) && options.key?(:country_code)
            # Prevents false positives, when matching city name it is possible it finds the wrong city
            "#{ base_path }&q=#{options[:city]},#{options[:country_code]}&limit=2"
        else
            raise ArgumentError, "options must specify :city and :country_code"
        end
    end

    def get_current_weather(options)
        handle_timeouts do
            # Cache results to avoid repeating requests
            Rails.cache.fetch(cache_key(options), expires_in: CACHE_EXPIRY_TIME) do 
                response = self.class.get(build_url_from_options(options), :debug_output => $stdout)
                if response.code != 200
                    raise StandardError, "api responded with #{response.code}  #{response.message}"
                else  
                    response['weather'][0]
                end
            end
        end
    end

    def cache_key(options)
        if options.key?(:city) && options.key?(:country_code)
            "weatherapi:current:#{ options[:country_code] }:#{ options[:city] }"
        end
    end

end