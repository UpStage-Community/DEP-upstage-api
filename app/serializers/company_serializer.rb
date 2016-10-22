class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email, :url, :short_description, 
    :description, :image

  has_many :productions
end
