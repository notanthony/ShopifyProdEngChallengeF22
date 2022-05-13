class Item < ApplicationRecord
    include Discard::Model
    validates :name, presence: true
    after_discard :validate_discard_message
    after_undiscard :clear_discard_message  

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
