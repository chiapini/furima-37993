class Adress < ApplicationRecord
  validates :user, :item, presence: true

  belongs_to :purchase
end
