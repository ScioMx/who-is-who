class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true,
                     format: { with: /\A[^@]+@[^@]+\z/,
                               message: "Please ingrese a valid email"}
  validates :birthplace, presence: true

  validates :birthdate, presence: true

  validates :institution, presence: true
  validates :career, presence: true
  validates :position, presence: true
  validates :responsibilities, presence: true
 
  has_attached_file :avatar, 
                    :styles => { :medium => "500x500>", :thumb => "125x125>" },
                    :default_url => "thumb/missing.png"
  
  validates_attachment_content_type :avatar, 
                                    :content_type => /\Aimage\/.*\Z/

  validates_attachment_presence :avatar 

  validates :interests, presence: true

  has_many :interests

  accepts_nested_attributes_for :interests
  
end
