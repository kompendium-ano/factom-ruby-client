class DropRateResponse < Dry::Struct
  attribute :DropRate, Types::Int

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        DropRate: d.has_key?('DropRate') ? d.fetch("DropRate") : 0,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "DropRate"  => @DropRate,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end