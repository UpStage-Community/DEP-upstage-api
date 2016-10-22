class ProductionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :short_description, 
    :price_range, :ticket_url, :image

  belongs_to :company
end
