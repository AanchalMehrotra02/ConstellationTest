class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :statuses

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :first_name ,presence: true 
  validates :last_name ,presence: true 
  validates :profile_name ,presence: true ,
  						   uniqueness: true,
  						   format: {
  						   	with: /\A[a-zA-Z0-9]+\Z/,
  						   	message: "must be formated correctly"
  						   }

  has_many :statuses
  def full_name
  	first_name + " " + last_name 
  end

  def gravtar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)

    "http://www.gravatar.com/avatar/#{hash}/d=mm"
  end

end
