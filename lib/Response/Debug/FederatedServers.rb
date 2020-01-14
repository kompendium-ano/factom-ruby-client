class FederatedServersResponse < Dry::Struct
  attribute :FederatedServers, Types::Array

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        FederatedServers: d.has_key?('FederatedServers') ? d.fetch("FederatedServers") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "FederatedServers"  => @FederatedServers,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end