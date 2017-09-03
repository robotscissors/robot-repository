class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :documents

  validates :fullname, presence: true

  before_save { self.role ||= :standard }
  enum role: [:standard,:admin]

end
