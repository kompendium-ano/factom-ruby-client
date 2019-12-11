class FBlock < Dry::Struct
  attribute :bodymr?,       Types::String
  attribute :prevkeymr?, Types::String
  attribute :prevledgerkeymr?,       Types::String
  attribute :exchrate?, Types::Int
  attribute :dbheight?,       Types::Int
  attribute :transactions?, Types::Array
  attribute :chainid?,       Types::String
  attribute :keymr?,       Types::String
  attribute :ledgerkeymr?,       Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
        bodymr:       d.has_key?('bodymr') ? d.fetch("bodymr") : nil,
        prevkeymr:            d.has_key?('prevkeymr') ? d.fetch("prevkeymr") : nil,
        prevledgerkeymr:       d.has_key?('prevledgerkeymr') ? d.fetch("prevledgerkeymr") : nil,
        dbheight:            d.has_key?('dbheight') ? d.fetch("dbheight") : 0,
        exchrate:       d.has_key?('exchrate') ? d.fetch("exchrate") : 0,
        transactions:            d.has_key?('transactions') ? d.fetch("transactions") : [],
        chainid:       d.has_key?('chainid') ? d.fetch("chainid") : nil,
        keymr:            d.has_key?('keymr') ? d.fetch("keymr") : nil,
        ledgerkeymr:       d.has_key?('ledgerkeymr') ? d.fetch("ledgerkeymr") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "bodymr" => @bodymr,
        "prevkeymr" => @prevkeymr,
        "prevledgerkeymr" => @prevledgerkeymr,
        "dbheight" => @dbheight,
        "exchrate" => @exchrate,
        "transactions" => @transactions,
        "chainid" => @chainid,
        "keymr" => @keymr,
        "ledgerkeymr" => @ledgerkeymr,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class FactoidBlockResponse < Dry::Struct
  attribute :fblock, FBlock
  attribute :rawdata,  Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        fblock: d.has_key?('fblock') ? FBlock.from_dynamic!(d.fetch("fblock")) : nil,
        rawdata:  d.has_key?('rawdata') ? d.fetch("rawdata") : '',
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "rawdata"  => @rawdata,
        "fblock" => @fblock.to_dynamic,
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