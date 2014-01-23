class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
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
                            password:Devise.friendly_token[0,20],
                          )
      end
       
    end
  end


    def self.find_for_vkontakte_oauth access_token
      user = User.where(:provider => auth.provider, :uid => auth.uid).first
      if user 
        return user
      else 
        user = User.create( :provider => access_token.provider,
                            :url => access_token.info.urls.Vkontakte,
                            :name => access_token.info.name,
                            :email => access_token.extra.raw_info.domain+'@vk.com',
                            :password => Devise.friendly_token[0,20])
      end
  end
  
end
