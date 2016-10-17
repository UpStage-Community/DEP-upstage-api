class ProductionSerializer < ActiveModel::Serializer
  attributes :id, :title

  belongs_to :company
end
