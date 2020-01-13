# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  author_id  :integer          not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :author_id, presence: true

  belongs_to :author, 
    class_name: 'User'

  has_many :postSubs
  has_many :subs, through: :postSubs
  has_many :comments
end
