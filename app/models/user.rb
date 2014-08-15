class User < ActiveRecord::Base
  validates :name, presence: true
  validates :responsibilities, presence: true
  validates :emails, presence: true,
                     format: { with: /\A[^@]+@[^@]+\z/,
                               message: "Please ingrese a valid email"}
 
  has_attached_file :avatar, 
                    :styles => { :medium => "500x500>", :thumb => "125x125>" },
                    :default_url => "thumb/missing.png"
  
  validates_attachment_content_type :avatar, 
                                    :content_type => /\Aimage\/.*\Z/

  validates_attachment_presence :avatar 

  has_many :interests
end
