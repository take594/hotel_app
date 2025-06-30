class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy

  def own?(object)
    object.user_id == self.id
  end
end
