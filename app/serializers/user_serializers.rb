class UserSerializer < ActiveModel::Serializer
  attributes :full_name, :email, :password, :type
end
