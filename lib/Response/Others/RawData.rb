class RawDataResponse < Dry::Struct
  attribute :data, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if (jsonData.has_key? "result")
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
      data: d.has_key?("data") ? d.fetch("data") : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "data" => @data,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
