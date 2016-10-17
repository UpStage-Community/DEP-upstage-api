class ProductionsController < ApplicationController
    def index
    #     # resource = Production.new(title: 'ActiveModelSerializers', body: 'Convention over configuration')
    #     # options = {}
    #     # serialization = ActiveModelSerializers::SerializableResource.new(Production, options)
    #     # serialization.to_json
    #     # serialization.as_json
    #     print "8" * 88
    #     print Production.all
    #     Production.all.to_json
    @productions = Production.all
    render json: @productions
    end

    def show

    end
end
