class AuthoritiesResponse < Dry::Struct
  attribute :Authorities, Types::Array

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        Authorities: d.has_key?('Authorities') ? d.fetch("Authorities") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "Authorities"  => @Authorities,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end