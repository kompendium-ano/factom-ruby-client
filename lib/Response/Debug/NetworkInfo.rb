class NetworkInfoResponse < Dry::Struct
  attribute :NetworkNumber, Types::Int
  attribute :NetworkName, Types::String
  attribute :NetworkID, Types::Int

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        NetworkNumber: d.has_key?('NetworkNumber') ? d.fetch("NetworkNumber") : 0,
        NetworkName: d.has_key?('NetworkName') ? d.fetch("NetworkName") : nil,
        NetworkID: d.has_key?('NetworkID') ? d.fetch("NetworkID") : 0,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "NetworkNumber"  => @NetworkNumber,
        "NetworkName"  => @NetworkName,
        "NetworkID"  => @NetworkID,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end