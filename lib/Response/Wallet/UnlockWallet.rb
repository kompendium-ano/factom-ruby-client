class UnlockWalletResponse < Dry::Struct
  attribute :success, Types::Bool
  attribute :unlockeduntil, Types::Int

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        success: d.has_key?('success') ? d.fetch("success") : false,
        unlockeduntil: d.has_key?('unlockeduntil') ? d.fetch("unlockeduntil") : 0,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "success"  => @success,
        "unlockeduntil"  => @unlockeduntil,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end