class Job < ApplicationRecord
    has_many :characters
    
    has_many :job_spells
    has_many :spells, through: :job_spells
    
    has_many :abilities
    
    require 'httparty'
    require 'byebug'

    include HTTParty
    format :json

    base_uri 'https://www.dnd5eapi.co'

    def job_details
        @request_hash = self.class.get("#{self.url}").parsed_response
    end
end
