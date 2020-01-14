class Params < Dry::Struct
  attribute :transaction?, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    new(
        transaction: d.has_key?('transaction') ? d.fetch("transaction") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(json)
  end

  def to_dynamic
    {
        "transaction"  => @transaction,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class ComposeTransactionResponse < Dry::Struct
  attribute :id, Types::Int
  attribute :params, Params

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end

    new(
        id: d.has_key?('id') ? d.fetch("id") : 0,
        params: d.has_key?('params') ? Params.from_json!(d.fetch("params")) : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "id"  => @id,
        "params"  => @params.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end