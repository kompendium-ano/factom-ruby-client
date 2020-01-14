class Syncing < Dry::Struct
  attribute :status?, Types::String
  attribute :received?, Types::Int
  attribute :expected?, Types::Int
  attribute :missing?, Types::Array

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if (jsonData.has_key? "result")
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
      status: d.has_key?("status") ? d.fetch("status") : nil,
      received: d.has_key?("received") ? d.fetch("received") : 0,
      expected: d.has_key?("expected") ? d.fetch("expected") : 0,
      missing: d.has_key?("missing") ? d.fetch("missing") : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "status" => @status,
      "received" => @received,
      "expected" => @expected,
      "missing" => @missing,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Authset < Dry::Struct
  attribute :leaders?, Types::Array
  attribute :audits?, Types::Array

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if (jsonData.has_key? "result")
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
      leaders: d.has_key?("leaders") ? d.fetch("leaders") : nil,
      audits: d.has_key?("audits") ? d.fetch("audits") : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "leaders" => @leaders,
      "audits" => @audits,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Elections < Dry::Struct
  attribute :inprogress?, Types::Bool

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if (jsonData.has_key? "result")
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
      inprogress: d.has_key?("inprogress") ? d.fetch("inprogress") : false,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "inprogress" => @inprogress,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class DiagnosticsResponse < Dry::Struct
  attribute :name, Types::String
  attribute :id, Types::String
  attribute :publickey, Types::String
  attribute :role, Types::String
  attribute :leaderheight, Types::String
  attribute :currentheight, Types::String
  attribute :currentminute, Types::String
  attribute :currentminuteduration, Types::String
  attribute :previousminuteduration, Types::String
  attribute :balancehash, Types::String
  attribute :tempbalancehash, Types::String
  attribute :lastblockfromdbstate, Types::Bool
  attribute :syncing, Syncing
  attribute :authset, Authset
  attribute :elections, Elections

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if (jsonData.has_key? "result")
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
      name: d.has_key?("name") ? d.fetch("name") : 0,
      id: d.has_key?("id") ? d.fetch("id") : nil,
      publickey: d.has_key?("publickey") ? d.fetch("publickey") : nil,
      role: d.has_key?("role") ? d.fetch("role") : nil,
      leaderheight: d.has_key?("leaderheight") ? d.fetch("leaderheight") : 0,
      currentheight: d.has_key?("currentheight") ? d.fetch("currentheight") : 0,
      currentminute: d.has_key?("currentminute") ? d.fetch("currentminute") : 0,
      currentminuteduration: d.has_key?("currentminuteduration") ? d.fetch("currentminuteduration") : 0,
      previousminuteduration: d.has_key?("previousminuteduration") ? d.fetch("previousminuteduration") : 0,
      balancehash: d.has_key?("balancehash") ? d.fetch("balancehash") : nil,
      tempbalancehash: d.has_key?("tempbalancehash") ? d.fetch("tempbalancehash") : nil,
      lastblockfromdbstate: d.has_key?("lastblockfromdbstate") ? d.fetch("lastblockfromdbstate") : false,
      syncing: d.has_key?("syncing") ? Syncing.from_json!(d.fetch("syncing")) : nil,
      authset: d.has_key?("authset") ? Authset.from_json!(d.fetch("authset")) : nil,
      elections: d.has_key?("elections") ? Elections.from_json!(d.fetch("elections")) : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "name" => @name,
      "id" => @id,
      "publickey" => @publickey,
      "role" => @role,
      "leaderheight" => @leaderheight,
      "currentheight" => @currentheight,
      "currentminute" => @currentminute,
      "currentminuteduration" => @currentminuteduration,
      "previousminuteduration" => @previousminuteduration,
      "balancehash" => @balancehash,
      "lastblockfromdbstate" => @lastblockfromdbstate,
      "ethereum" => @ethereum.to_dynamic,
      "syncing" => @syncing.to_dynamic,
      "authset" => @authset.to_dynamic,
      "elections" => @elections.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
