class Ability

  include CanCan::Ability  

  def initialize(user)  
    if user.present?  
      if user.role.name == 'admin'  
        can :manage, :all
      else  
        can :create, Product  
        can :create, Sale
        can :read, Product
        can :read, Sale
      end  
    else  
      can :read, :all  
    end  
  end  

end