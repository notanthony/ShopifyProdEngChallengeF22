module AppServices
    class DiscardableRecordDiscarder < ApplicationService
        def initialize (discardable_record, discarded_message)
            @discardable_record = discardable_record 
            @discarded_message = discarded_message
        end 

        def call
            if @discardable_record.discarded? 
                raise StandardError.new "Cannot delete a deleted object"
            end
            @discardable_record.discard! 
        rescue StandardError => e
            @discardable_record.errors.add(:base, e.message )
            return false 
        else 
            return !@discarded_message.blank? && @discardable_record.update_attribute(:discarded_message, @discarded_message)
        end
    end
end
        