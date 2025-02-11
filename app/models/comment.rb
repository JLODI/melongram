class Comment < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :text, presence: true

  after_create_commit do
    broadcast_append_to [commentable, :comments], target: "#{dom_id(commentable)}_comments"
  end

  after_destroy_commit do
    broadcast_remove_to self #event listener to changes for each comment
  end
end
