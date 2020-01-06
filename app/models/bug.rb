class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :developer, optional: true
  belongs_to :qa

  mount_uploader :image, ImageUploader
  validates :title, presence: true,
                    length: {minimum: 5}
  validate  :deadline_cannot_be_in_the_past

  def deadline_cannot_be_in_the_past
    errors.add(:deadline, "can't be in the past") if
      deadline.present? and deadline < Date.today
  end
end 
 