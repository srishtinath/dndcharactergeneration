require 'httparty'
require 'byebug'

class DndApi
    include HTTParty
    format :json

    base_uri 'https://www.dnd5eapi.co'

    def classes
        request_hash = self.class.get('/api/classes').parsed_response
        request_hash["results"].each do |result|
            Job.create(index: result["index"], name: result["name"])
        end
    end

    def description(result)
        @desc_hash = self.class.get(result).parsed_response
        @desc_hash["desc"][0]
    end

    def spells
        request_hash = self.class.get('/api/spells').parsed_response
        request_hash["results"].each do |result|
            # byebug
            @url = result["url"]
            # byebug
            @description = description(@url)
            # byebug
            Spell.create(name: result["name"], description: @description)
        end
    end

    def abilities
        request_hash = self.class.get('/api/features').parsed_response
        request_hash["results"].each do |result|
            @url = result["url"]
            @description = description(@url)

            Ability.create(name: result["name"], description: @description)
        end
    end


    # def class_details(job)
    #     @request_hash = self.class.get('/#{find_class.url}').parsed_response
    # end

end

# api = DndApi.new 
# # byebug
# api.spells
# byebug
