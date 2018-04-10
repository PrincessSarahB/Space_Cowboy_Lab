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
  sql = "DELETE FROM space_cowboys_bounty WHERE ID = $1"
  values = [@id]
  db.prepare("delete", sql)
  db.exec_prepared("delete", values)
  db.close()
end

def update()
  db = PG.connect({dbname: "space_cowboys", host: "localhost"})
  sql = "UPDATE space_cowboys_bounty SET (name, danger_level, bounty_value, homeworld) = ($1, $2, $3, $4) WHERE id = $5;"
  values = [@name, @danger_level, @bounty_value, @homeworld, @id]
  db.prepare("update", sql)
  db.exec_prepared("update", values)
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

def self.find_by_name(name)
  db = PG.connect({dbname: "space_cowboys", host: "localhost"})
  sql = "SELECT * FROM space_cowboys_bounty WHERE name = $1;"
values = [name]
  db.prepare("find_by_name", sql)
result = db.exec_prepared("find_by_name", values)
db.close()
# @name = name[0]["name"]
# return result.map {|result| Bounty.new(result)}
return Bounty.new(result[0])

end

def self.find_by_id(id)
  db = PG.connect({dbname: "space_cowboys", host: "localhost"})
  sql = "SELECT * FROM space_cowboys_bounty WHERE id = $1;"
values = [id]
db.prepare("find_by_id", sql)
result = db.exec_prepared("find_by_id", values)
db.close()
return result []
end
end
