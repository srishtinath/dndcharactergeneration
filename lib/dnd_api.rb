require 'httparty'
require 'byebug'

class DndApi
    include HTTParty
    format :json

    base_uri 'https://www.dnd5eapi.co'

    def classes
        request_hash = self.class.get('/api/classes').parsed_response
        request_hash["results"].each do |result|
            Job.create(index: result["index"], name: result["name"], url: result["url"])
        end
    end
    
end

# api = DndApi.new 
# byebug
# api.classes
# byebug

# def abilities
#     request_hash = self.class.get('/api/features').parsed_response
#     request_hash["results"].each do |result|
#         @desc = description(result["url"])
#         Ability.create(name: result["name"], description: @desc)
#     end
# end

# def description(url)
#     @desc_hash = self.class.get(url).parsed_response
#     @desc_hash["desc"]
# end