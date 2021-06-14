class Blog < ApplicationRecord
  belongs_to :user
  has_many :all_comments

  validates :title, :body, presence: true

  accepts_nested_attributes_for :all_comments
end
