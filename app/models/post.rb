class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy

  validates :description, presence: true, length: { minimum: 5, maximum: 1000 }
  validate :acceptable_image

  def acceptable_image
    return unless images.attached?

    acceptable_types = ["image/jpeg", "image/png", "image/webp" ]
    
    images.each do |image| 
      # Check file size
      if image.blob.byte_size > 1.megabyte
        errors.add(:images, "#{image.filename} is too large (must be less than 1 mb)")
      end
  
      # Check file type
      unless acceptable_types.include?(image.content_type)
        errors.add(:images, "#{image.filename} must be a JPEG, PNG, or WEBP")
      end

      unless images.count <= 20
        errors.add(:images, 'You can only upload a maximum of 20 images')
      end
    end
  end
end
