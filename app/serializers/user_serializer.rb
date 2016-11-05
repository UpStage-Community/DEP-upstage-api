class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :image, :bio, :url, :auth_token
end