class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :admin
      can :manage, :all
    # elsif user.role? :writter
    #   can :manage, [Post, Asset]
    # elsif user.role? :memeber
    #   can :read, [MemberPost, Asset]
    #   # manage posts, assets user owns
    #   can :manage, Post do |p|
    #     p.try(:owner) == user
    #   end
    #   can :manage, Asset do |a|
    #     a.try(:owner) == user
    #   end
    end
  end
end
