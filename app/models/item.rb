class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true do
    validates :image
    validates :title
    validates :text
    validates :price
  end

  validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :prefecture_id
    validates :day_id
  end
end
