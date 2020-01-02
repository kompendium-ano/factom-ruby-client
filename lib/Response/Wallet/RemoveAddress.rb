class RemoveAddressResponse < Dry::Struct
  attribute :success, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        success: d.has_key?('success') ? d.fetch("success") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "success"  => @success,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end