class ImportIdentityKeyResponse < Dry::Struct
  attribute :keys, Types::Array

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        keys: d.has_key?('keys') ? d.fetch("keys") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "keys"  => @keys,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end