class RevealParams < Dry::Struct
  attribute :entry?, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    new(
      entry: d.has_key?("entry") ? d.fetch("entry") : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(json)
  end

  def to_dynamic
    {
      "entry" => @entry,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class CommitParams < Dry::Struct
  attribute :message?, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    new(
      message: d.has_key?("message") ? d.fetch("message") : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(json)
  end

  def to_dynamic
    {
      "entry" => @entry,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Commit < Dry::Struct
  attribute :id?, Types::Int
  attribute :params?, CommitParams
  attribute :method?, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    new(
      id: d.has_key?("id") ? d.fetch("id") : 0,
      params: d.has_key?("params") ? CommitParams.from_json!(d.fetch("params")) : nil,
      method: d.has_key?("method") ? d.fetch("method") : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(json)
  end

  def to_dynamic
    {
      "id" => @id,
      "params" => @params.to_dynamic,
      "method" => @method,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Reveal < Dry::Struct
  attribute :id?, Types::Int
  attribute :params?, RevealParams
  attribute :method?, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    new(
      id: d.has_key?("id") ? d.fetch("id") : 0,
      params: d.has_key?("params") ? RevealParams.from_json!(d.fetch("params")) : nil,
      method: d.has_key?("method") ? d.fetch("method") : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(json)
  end

  def to_dynamic
    {
      "id" => @id,
      "params" => @params.to_dynamic,
      "method" => @method,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class FactomChainResponse < Dry::Struct
  attribute :commit?, Commit
  attribute :reveal?, Reveal

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if (jsonData.has_key? "result")
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end

    new(
      commit: d.has_key?("commit") ? Commit.from_json!(d.fetch("commit")) : nil,
      reveal: d.has_key?("reveal") ? Reveal.from_json!(d.fetch("reveal")) : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "commit" => @commit.to_dynamic,
      "reveal" => @reveal.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
