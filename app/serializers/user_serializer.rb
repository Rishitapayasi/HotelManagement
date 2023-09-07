class UserSerializer < ActiveModel::Serializer
  attributes :full_name, :email, :type
end

