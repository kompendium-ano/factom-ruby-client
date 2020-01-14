class DirectoryBlockHeadResponse < Dry::Struct
  attribute :keymr, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(d.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end

    new(
        keymr: d.has_key?('keymr') ? d.fetch("keymr") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "keymr"  => @keymr,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end