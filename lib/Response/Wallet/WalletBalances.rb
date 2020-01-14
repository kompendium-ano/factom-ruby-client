class WalletBalanceResponse < Dry::Struct
  attribute :fctaccountbalances, Types::Any
  attribute :ecaccountbalances, Types::Any

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        fctaccountbalances: d.has_key?('fctaccountbalances') ? d.fetch("fctaccountbalances") : nil,
        ecaccountbalances: d.has_key?('ecaccountbalances') ? d.fetch("ecaccountbalances") : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "fctaccountbalances"  => @fctaccountbalances,
        "ecaccountbalances"  => @ecaccountbalances,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end