# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present? 
    return unless user.type == 'Customer'
    can :read, Hotel
    can :manage, Booking
    can :available_hotels, Customer
    return unless user.type == 'Owner'
    can :manage, Hotel
    can :create, Room, user: user   #only owner of hotel can create room to their hotel
  end
end
