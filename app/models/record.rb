class Record < ApplicationRecord
  belongs_to :user

  validates :genre, :artist, :album, :year, :quantity, { presence: true }

  def self.search(search)
    where("genre LIKE ?", "%#{search}%")
    where("artist LIKE ?", "%#{search}%")
    where("album LIKE ?", "%#{search}%")
  end

end
