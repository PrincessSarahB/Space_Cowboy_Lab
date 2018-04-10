require("pg")

class Bounty
  attr_reader :id
  attr_accessor :name, :danger_level, :bounty_value, :homneworld
  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @danger_level = options["danger_level"]
    @bounty_value = options["bounty_value"].to_i
    @homeworld = options["homeworld"]
  end

def save()
db = PG.connect({dbname: "space_cowboys", host: "localhost"})
sql = "INSERT INTO space_cowboys_bounty (name, danger_level, bounty_value, homeworld) VALUES ($1, $2, $3, $4) RETURNING id;"
values = [@name, @danger_level, @bounty_value, @homeworld]
db.prepare("save", sql)
result = db.exec_prepared("save", values)
db.close()
@id = result[0]["id"].to_i
end

def delete()
  db = PG.connect({dbname: "space_cowboys", host: "localhost"})
  sql = "DELETE FROM space_cowboys_bountY WHERE ID = $1"
  values = [@id]
  db.prepare("delete", sql)
  db.exec_prepared("delete", values)
  db.close()
end


def self.all()
  db = PG.connect({dbname: "space_cowboys", host: "localhost"})
  sql = "SELECT * FROM space_cowboys_bounty;"
  db.prepare("all", sql)
  bounties = db.exec_prepared("all")
  db.close()
  return bounties.map {|bounty| Bounty.new(bounty)}
end

def self.delete_all()
db = PG.connect({dbname: "space_cowboys", host: "localhost"})
sql = "DELETE FROM space_cowboys_bounty;"
db.prepare("delete_all", sql)
db.exec_prepared("delete_all")
db.close()

end

end
