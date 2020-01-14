class FactoidSubmitResponse < Dry::Struct
  attribute :message, Types::String
  attribute :txid, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end

    new(
        message: d.has_key?('message') ? d.fetch("message") : nil,
        txid: d.has_key?('txid') ? d.fetch("txid") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "message"  => @message,
        "txid"  => @txid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end