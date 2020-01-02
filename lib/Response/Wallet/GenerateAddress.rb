class GenerateAddressResponse < Dry::Struct
  attribute :public, Types::String
  attribute :secret, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end

    new(
        public: d.has_key?('public') ? d.fetch("public") : nil,
        secret: d.has_key?('secret') ? d.fetch("secret") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "public"  => @public,
        "secret"  => @secret,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end