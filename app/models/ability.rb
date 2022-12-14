# frozen_string_literal: true

class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user

    if user.seller?
      seller_abilities
    else
      buyer_abilities
    end
  end

  def buyer_abilities
    can :read, :all
    can :buy, Product
  end

  def seller_abilities
    can :read, :all
    can :create, Product
    can :update, Product, seller: user
    can :destroy, Product, seller: user
  end
end
