class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :provider, :uid, :email, :password, :password_confirmation, :remember_me, :roles
  # attr_accessible :title, :body
  #

  include Cfp::User

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid      = auth['uid']
      user.email    = "#{user.uid}@github.com"
    end
  end
end
