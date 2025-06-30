class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :checkIn, presence: true
  validates :checkOut, presence: true
  validates :numberOfPeople, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validate :checkIn_shoud_be_later_than_today
  validate :checkOut_shoud_be_later_than_checkIn

  def checkIn_shoud_be_later_than_today
    if checkIn!=nil&&checkIn<Time.now
      errors.add(:checkIn, "は本日以降にしてください")
    end
  end

  def checkOut_shoud_be_later_than_checkIn
    if checkIn!=nil && checkOut!=nil && checkIn>=checkOut
      errors.add(:checkOut, "はチェックイン日以降にしてください")
    end
  end

  def own?(object)
    object.user_id == self.id
  end
end
