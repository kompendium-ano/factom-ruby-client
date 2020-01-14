class PredictiveFERResponse < Dry::Struct
  attribute :PredictiveFER, Types::Int

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        PredictiveFER: d.has_key?('PredictiveFER') ? d.fetch("PredictiveFER") : 0,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "PredictiveFER"  => @PredictiveFER,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end