class TmpTransactionResponse < Dry::Struct
  attribute :transactions, Types::Array

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end

    new(
        transactions: d.has_key?('transactions') ? d.fetch("transactions") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "transactions"  => @transactions,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end