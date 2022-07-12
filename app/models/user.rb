class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable

  has_attached_file :avatar
  # Validate content type
  validates_attachment_content_type :avatar, content_type: /\Aimage/
  # Validate filename
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
  # Explicitly do not validate
  do_not_validate_attachment_file_type :avatar

  has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

has_many :posts
has_many :comments
has_many :likes 
has_many :user_roles
has_many :roles, through: :user_roles
 # after_create :in_active

 # def in_active
 #   #self.is_active = false
 #   self.role = "user"
 #   self.save
 # end

 # def role?
 #   if self.role.eql?("Admin")
 #     return " Admin"
 #   else
 #     return "user"
 #   end
 # end

after_create :in_active


def in_active   
    #byebug
     @role = Role.find_by(name: "User")
     @user_role = self.user_roles.create(role_id: @role.id)
 end

 def role?
  #debugger
  if self.roles.collect(&:name).include?("Admin")
     return Role.first.name
  else
     return Role.second.name
   end
 end
end