class User < ActiveRecord::Base
   has_many :memberships
   has_many :organizations, :through => :memberships

   attr_accessor :password
   attr_protected :password_digest

   validates :email, :presence => true, :uniqueness => true

   after_create :api_authenticable

   def password=(pass)
     return if pass.blank?

     @password = pass
     self.password_digest = BCrypt::Password.create(pass)
   end

   def self.authenticate(email, password)
     user = find_by_email(email)
     user && BCrypt::Password.new(user.password_digest) == password ? user : nil
   end

   def create_organization(org_name)
     org = Organization.create(name: org_name)
     org.users << self
     org.save!
     memberships = org.memberships
     raise "Couldn't find membership just created" unless memberships.count == 1
     membership = memberships.first
     membership.is_owner = true
     membership.save!
     org
   end

   private

   def api_authenticable
     update_attribute(:api_key, Digest::SHA1.hexdigest([Time.now, rand].join))
   end
end
