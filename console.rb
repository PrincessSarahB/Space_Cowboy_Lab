require("pry-byebug")
require_relative("./models/bounty.rb")

Bounty.delete_all()

bounty1 = Bounty.new({
  "name" => "Captain Mal Reynolds",
  "danger_level" => "medium",
  "bounty_value" => 2000,
  "homeworld" => "Shadow"
  })

  bounty1.save()

  bounty2 = Bounty.new({
    "name" => "River Tam",
    "danger_level" => "ermagerdyerderd",
    "bounty_value" => 50000,
    "homeworld" => "Osiris"
    })

    bounty2.save()

    binding.pry

    nil
