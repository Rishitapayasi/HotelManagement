# frozen_string_literal: true

class Ability
  include CanCan::Ability
  
  def initialize(user)
    return unless user.present?
    can :read, Hotel, user: user.customer?
    can :manage, Booking
    
    return unless user.type == 'Owner'
    can :manage, Hotel
    can :create, Room
  end
end
