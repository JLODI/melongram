class Comment < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, optional: true, class_name: "Comment"
  has_many :comments, foreign_key: :parent_id, dependent: :destroy

  validates :text, presence: true

  after_create_commit do
    broadcast_append_to [commentable, :comments], target: "#{dom_id( parent || commentable)}_comments", partial: "comments/comment_with_replies", locals: { view_current_user: self.user }
  end

  after_update_commit do 
    broadcast_replace_to self #event listener to changes for each comment
  end

  after_destroy_commit do
    broadcast_remove_to self #event listener to changes for each comment
    broadcast_action_to self, action: :remove, target: "#{dom_id(self)}_with_comments"
  end
end
