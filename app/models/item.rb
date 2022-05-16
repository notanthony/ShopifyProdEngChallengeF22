class Item < ApplicationRecord
    include Discard::Model
    attr_accessor :weather_description
    validates :name, :city, presence: true
    validates :city, acceptance: {accept: ['Toronto', 'Vancouver', 'Ottawa', 'Calgary', 'Waterloo']}
    after_discard :validate_discard_message
    after_undiscard :clear_discard_message  

    def get_current_weather_description
        begin 
            ApiServices::Weather.get_current_weather({:city => city, :country_code => "CA"})['description']
        rescue StandardError => e
            errors.add(:weather_description, "not found, " + e.message)
            ''
        end
    end

    private 
        def validate_discard_message
            if discarded_message.blank?
                self.update_attribute(:discarded_message,nil)
            end
        end
        
        # I assumed they would want the message to get cleared after wards since they restored it, it no longer needs a message about why it was deleted    
        def clear_discard_message
            self.update_attribute(:discarded_message,nil)
        end
end