class AllComment < ApplicationRecord
  belongs_to :user, polymorphic: true
  belongs_to :blog

  validates :title, :body, presence: true
end
