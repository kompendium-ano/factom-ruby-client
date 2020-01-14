class GetHeightResponse < Dry::Struct
  attribute :height, Types::Int

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if (jsonData.has_key? "result")
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
      height: d.has_key?("height") ? d.fetch("height") : 0,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "height" => @height,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
