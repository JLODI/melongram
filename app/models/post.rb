class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy

  validates :description, presence: true, length: { minimum: 5, maximum: 2200 }
  validates :images, presence: true
  validate :acceptable_image

  has_many :likes, as: :likeable
  has_many :comments, as: :commentable

  # def is_belongs_to? user
  #   Post.find_by(user_id: user.id, id: id)
  # end
  
  # def is_liked user
  #   Like.find_by(user_id: user.id, likeable_id: id)
  # end

  def acceptable_image
    return unless images.attached?

    acceptable_types = ["image/jpeg", "image/png", "image/webp" ]
    
    images.each do |image| 
      # Check file size
      if image.blob.byte_size > 4.megabyte
        errors.add(:images, "#{image.filename} is too large (must be less than 4 mb)")
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
