class List < ApplicationRecord
  has_one_attached :image #画像を保存できるカラム追加？

  validates :title, presence: true
  validates :body, presence: true

  #rails cを学ぼうでコメントアウトしたところ
  validates :image, presence: true
end
