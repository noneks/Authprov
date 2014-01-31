require 'role_model'

class User < ActiveRecord::Base

  has_many :pictures

  include RoleModel

  roles_attribute :roles_mask
 
  roles :admin, :editor

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create( name:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            image: auth.info.image,
                            password:Devise.friendly_token[0,20],
                            roles: [:editor])
      end
       
    end
  end


  def self.find_for_vkontakte_oauth access_token
    user = User.where(:provider => access_token.provider, :uid => access_token.uid).first
    if user 
      return user
    else 
      registered_user = User.where(email: access_token.uid+'@vk.com').first
      if registered_user
        return registered_user
      else

        user = User.create( provider: access_token.provider,
                            uid: access_token.uid,
                            name: access_token.info.name,
                            email: access_token.uid+'@vk.com',
                            image: access_token.info.image,
                            password: Devise.friendly_token[0,20],
                            roles: [:editor])
        #user.roles = [:editor]
      end
    end
  end
  
end