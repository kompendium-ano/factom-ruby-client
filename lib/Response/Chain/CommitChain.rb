class CommitChainResponse < Dry::Struct
  attribute :message, Types::String
  attribute :txid,  Types::String
  attribute :entryhash, Types::String
  attribute :chainid,  Types::String

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
        txid:  d.has_key?('txid') ? d.fetch("txid") : nil,
        entryhash: d.has_key?('entryhash') ? d.fetch("entryhash") : nil,
        chainid:  d.has_key?('chainid') ? d.fetch("chainid") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "message"  => @message,
        "txid" => @txid,
        "entryhash"  => @entryhash,
        "chainid" => @chainid,
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