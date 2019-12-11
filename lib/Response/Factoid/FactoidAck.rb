class FactoidAckResponse < Dry::Struct
  attribute :txid, Types::String
  attribute :transactiondate, Types::Int
  attribute :transactiondatestring, Types::String
  attribute :blockdate, Types::Int
  attribute :blockdatestring, Types::String
  attribute :status, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        txid: d.has_key?('txid') ? d.fetch("txid") : nil,
        transactiondate: d.has_key?('transactiondate') ? d.fetch("transactiondate") : 0,
        transactiondatestring: d.has_key?('transactiondatestring') ? d.fetch("transactiondatestring") : nil,
        blockdate: d.has_key?('blockdate') ? d.fetch("blockdate") : 0,
        blockdatestring: d.has_key?('blockdatestring') ? d.fetch("blockdatestring") : nil,
        status: d.has_key?('status') ? d.fetch("status") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "txid"  => @txid,
        "transactiondate"  => @transactiondate,
        "transactiondatestring"  => @transactiondatestring,
        "blockdate"  => @blockdate,
        "blockdatestring"  => @blockdatestring,
        "status"  => @status,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

# This code may look verbose in Ruby but
# it performs some complex validation of JSON data which we REQUIRE for correctness
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   entry_response = EntryResponse.from_json! "{…}"
#   puts entry_response.entrydata.blockdate.even?
#
# If from_json! succeeds, the value returned matches the schema.