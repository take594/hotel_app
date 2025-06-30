class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :introduction, presence: true
  validates :rate, presence: true, numericality: {only_integer: true, greater_than: 1}
  validates :located, presence: true

  def self.looks_word(word)
    if word.present?
      @rooms = Room.where('name LIKE? or introduction LIKE?', "%#{word}%","%#{word}%" )
    else
      @rooms = Room.none
    end
  end
  
  def self.looks_area(area)
    if area.present?
      @rooms = Room.where('located LIKE?', "%#{area}%")
    else
      @rooms = Room.none
    end
  end

  def own?(object)
    object.user_id == self.id
  end
  
end
