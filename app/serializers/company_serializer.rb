class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email, :url, :short_description, :long_description, :image

  has_many :productions
end
