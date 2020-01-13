# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  author_id         :integer          not null
#  post_id           :integer          not null
#  parent_comment_id :integer
#  content           :text             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Comment < ApplicationRecord 
  validates :author_id, :post_id, presence: true 

  belongs_to :author,
    class_name: "User"

  belongs_to :post

  belongs_to :comment, optional: true, 
    foreign_key: :parent_comment_id

  has_many :child_comments, 
    class_name: 'Comment', 
    foreign_key: :parent_comment_id
end 
