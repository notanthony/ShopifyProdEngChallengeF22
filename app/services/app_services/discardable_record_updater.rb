module AppServices
    class DiscardableRecordUpdater < ApplicationService
        def initialize (discardable_record, params)
            @discardable_record = discardable_record 
            @params = params
        end 

        def call
            if @discardable_record.discarded?
                # In most cases soft deletes are used to archive information
                # I assumed this was the case here also and so I decided to disallow editing of deleted cases
                # it would defeat the purpose of an archive if it could be tampered with.
                # Also if an edit was made the deletion time should be updated since deletion time should be synonymous 
                # with the last time the item was in use
                raise StandardError.new "Cannot update a deleted object"
            end
        rescue StandardError => e
            @discardable_record.errors.add(:base, e.message )
            return false 
        else 
            return @discardable_record.update(@params)
        end
    end
end
        