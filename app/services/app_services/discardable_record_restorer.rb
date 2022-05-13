module AppServices
    class DiscardableRecordRestorer < ApplicationService
        def initialize (discardable_record)
            @discardable_record = discardable_record 
        end 
    
        def call
            if !@discardable_record.discarded? 
                raise StandardError.new "Cannot restore an object that is not deleted"
            end
            @discardable_record.undiscard! 
        rescue StandardError => e
            @discardable_record.errors.add(:base, e.message )
            return false 
        else 
            return true 
        end
    end
end
            