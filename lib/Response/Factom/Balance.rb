class BalanceResponse < Dry::Struct
  attribute :balance, Types::Int

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        balance: d.has_key?('balance') ? d.fetch("balance") : 0
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "balance"  => @balance,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end