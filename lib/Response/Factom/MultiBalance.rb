class MultiBalanceResponse < Dry::Struct
  attribute :currentheight, Types::Int
  attribute :lastsavedheight, Types::Int
  attribute :balances, Types::Array

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if (jsonData.has_key? "result")
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
      currentheight: d.has_key?("currentheight") ? d.fetch("currentheight") : 0,
      lastsavedheight: d.has_key?("lastsavedheight") ? d.fetch("lastsavedheight") : 0,
      balances: d.has_key?("balances") ? d.fetch("balances") : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "currentheight" => @currentheight,
      "lastsavedheight" => @lastsavedheight,
      "balances" => @balances,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
