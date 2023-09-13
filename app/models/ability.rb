# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(Owner)
      can [:read, :create, :update, :destroy], Hotels, user_id: user_id 
    end
  end
end
