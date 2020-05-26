class Job < ApplicationRecord
    has_many :characters
    
    require 'httparty'
    require 'byebug'

    include HTTParty
    format :json

    base_uri 'https://www.dnd5eapi.co'

    def job_details
        @request_hash = self.class.get("#{self.url}").parsed_response
    end
end
