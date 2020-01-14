class NewTransactionResponse < Dry::Struct
  attribute :feesrequired, Types::Int
  attribute :signed, Types::Bool
  attribute :name, Types::String
  attribute :timestamp, Types::Int
  attribute :totalecoutputs, Types::Int
  attribute :totalinputs, Types::Int
  attribute :totaloutputs, Types::Int
  attribute :inputs, Types::Array
  attribute :outputs, Types::Array
  attribute :ecoutputs, Types::Array
  attribute :txid, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if (jsonData.has_key? "result")
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end

    new(
      feesrequired: d.has_key?("feesrequired") ? d.fetch("feesrequired") : 0,
      signed: d.has_key?("signed") ? d.fetch("signed") : false,
      name: d.has_key?("name") ? d.fetch("name") : nil,
      timestamp: d.has_key?("timestamp") ? d.fetch("timestamp") : 0,
      totalecoutputs: d.has_key?("totalecoutputs") ? d.fetch("totalecoutputs") : 0,
      totalinputs: d.has_key?("totalinputs") ? d.fetch("totalinputs") : 0,
      totaloutputs: d.has_key?("totaloutputs") ? d.fetch("totaloutputs") : 0,
      inputs: d.has_key?("inputs") ? d.fetch("inputs") : nil,
      outputs: d.has_key?("outputs") ? d.fetch("outputs") : nil,
      ecoutputs: d.has_key?("ecoutputs") ? d.fetch("ecoutputs") : nil,
      txid: d.has_key?("txid") ? d.fetch("txid") : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "feesrequired" => @feesrequired,
      "signed" => @signed,
      "name" => @name,
      "timestamp" => @timestamp,
      "totalecoutputs" => @totalecoutputs,
      "totalinputs" => @totalinputs,
      "totaloutputs" => @totaloutputs,
      "inputs" => @inputs,
      "outputs" => @outputs,
      "ecoutputs" => @ecoutputs,
      "txid" => @txid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
