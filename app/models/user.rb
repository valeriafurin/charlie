class User < ApplicationRecord
  validates :message, presence: true, length: { minimum: 10 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :contacts
  has_many :sessions
  after_create :add_contacts

  private 
  # adds 3 template contacts to be filled/edited by the user upon registration
  def add_contacts
    id = self.id
    3.times do
      Contact.new(user_id: id).save!
    end
  end
end
