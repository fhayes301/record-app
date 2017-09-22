class Record < ApplicationRecord
  belongs_to :user
  has_many :songs

  validates :genre, :artist, :album, :year, :quantity, { presence: true }

  def self.search(search)
    mysearch = search.capitalize
    where('genre LIKE :search OR artist LIKE :search OR album LIKE :search', search:"%#{mysearch}%")
  end

end
