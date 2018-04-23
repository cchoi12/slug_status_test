class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  validates :title, :description, presence: true
  validates :status, presence: true

  enum status: { draft: 0, pre_published: 1, published: 2 }

  alias_attribute :slug, :title
end
