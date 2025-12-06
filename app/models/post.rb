class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :image  # ActiveStorageで画像を添付

  validates :item_name, presence: true
  validates :content, presence: true
  validates :category_id, presence: true

  # 画像が必須
  validates :image, presence: true
end
