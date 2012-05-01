class User < ActiveRecord::Base

   attr_accessor :password
   attr_protected :password_digest

   validates :email, :presence => true, :uniqueness => true


   def password=(pass)
     return if pass.blank?

     @password = pass
     self.password_digest = BCrypt::Password.create(pass)
   end

   def self.authenticate(email, password)
     user = find_by_email(email)
     user && BCrypt::Password.new(user.password_digest) == password ? user : nil
   end
end