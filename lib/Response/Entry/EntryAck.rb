class Commitdata < Dry::Struct
  attribute :transactiondate,       Types::Int
  attribute :transactiondatestring, Types::String
  attribute :blockdate,             Types::Int
  attribute :blockdatestring,       Types::String
  attribute :status,                Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
        transactiondate:       d.has_key?('transactiondate') ? d.fetch("transactiondate") : 0,
        transactiondatestring: d.has_key?('transactiondatestring') ? d.fetch("transactiondatestring") : '',
        blockdate:             d.has_key?('blockdate') ? d.fetch("blockdate") : 0,
        blockdatestring:       d.has_key?('blockdatestring') ? d.fetch("blockdatestring") : '',
        status:                d.has_key?('status') ? d.fetch("status") :'',
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "transactiondate"       => @transactiondate,
        "transactiondatestring" => @transactiondatestring,
        "blockdate"             => @blockdate,
        "blockdatestring"       => @blockdatestring,
        "status"                => @status,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Entrydata < Dry::Struct
  attribute :blockdate,       Types::Int
  attribute :blockdatestring, Types::String
  attribute :status,          Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
        blockdate:       d.has_key?('blockdate') ? d.fetch("blockdate") : 0,
        blockdatestring: d.has_key?('blockdatestring') ? d.fetch("blockdatestring") : '',
        status:          d.has_key?('status') ? d.fetch("status") : '',
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "blockdate"       => @blockdate,
        "blockdatestring" => @blockdatestring,
        "status"          => @status,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class EntryAckResponse < Dry::Struct
  attribute :committxid, Types::String
  attribute :entryhash,  Types::String
  attribute :commitdata, Commitdata
  attribute :entrydata,  Entrydata

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        committxid: d.has_key?('committxid') ?  d.fetch("committxid") : '',
        entryhash:  d.has_key?('entryhash') ?  d.fetch("entryhash") : '',
        commitdata: d.has_key?('commitdata') ? Commitdata.from_dynamic!(d.fetch("commitdata")) : [],
        entrydata:  d.has_key?('entrydata') ? Entrydata.from_dynamic!(d.fetch("entrydata")) : [],
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "committxid" => @committxid,
        "entryhash"  => @entryhash,
        "commitdata" => @commitdata.to_dynamic,
        "entrydata"  => @entrydata.to_dynamic,
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