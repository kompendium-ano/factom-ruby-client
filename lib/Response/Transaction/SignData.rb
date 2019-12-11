class SignDataResponse < Dry::Struct
  attribute :pubkey, Types::String
  attribute :signature, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end

    new(
        pubkey: d.has_key?('pubkey') ? d.fetch("pubkey") : nil,
        signature: d.has_key?('signature') ? d.fetch("signature") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "pubkey"  => @pubkey,
        "signature"  => @signature,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end