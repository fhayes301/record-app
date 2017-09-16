require 'csv'

User.delete_all
Record.delete_all

user = {
  name: "Jeff",
  email: "Jeff@mail.com",
  password: "password"
}

User.create(user)

csv_text = File.read(Rails.root.join('lib', 'seeds', 'jeffs_records.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

def empty_year(data)
  if data == "x"
    "tbd"
  else
    data
  end
end

csv.each do |row|

  record = {
    user_id: 1,
    genre: row[0],
    artist: row[1],
    album: row[2],
    year: empty_year(row[3]),
    quantity: row[4]
  }
  Record.create(record)

end
