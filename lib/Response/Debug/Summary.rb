class SummaryResponse < Dry::Struct
  attribute :Summary, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        Summary: d.has_key?('Summary') ? d.fetch("Summary") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "Summary"  => @Summary,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end