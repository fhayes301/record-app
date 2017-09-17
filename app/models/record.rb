class Record < ApplicationRecord
  belongs_to :user

  validates :genre, :artist, :album, :year, :quantity, { presence: true }

end
