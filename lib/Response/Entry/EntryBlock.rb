class Header < Dry::Struct
  attribute :blocksequencenumber?,       Types::Int
  attribute :chainid?, Types::String
  attribute :prevkeymr?,          Types::String
  attribute :timestamp?,       Types::Int
  attribute :dbheight?,       Types::Int

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
        blocksequencenumber:       d.has_key?('blocksequencenumber') ? d.fetch("blocksequencenumber") : 0,
        chainid:            d.has_key?('chainid') ? d.fetch("chainid") : '',
        prevkeymr:          d.has_key?('prevkeymr') ? d.fetch("prevkeymr") : '',
        timestamp:       d.has_key?('timestamp') ? d.fetch("timestamp") : 0,
        dbheight:       d.has_key?('dbheight') ? d.fetch("dbheight") : 0,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "blocksequencenumber" => @blocksequencenumber,
        "chainid" => @chainid,
        "prevkeymr" => @prevkeymr,
        "timestamp" => @timestamp,
        "dbheight" => @dbheight,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class EntryBlockResponse < Dry::Struct
  attribute :header, Header
  attribute :entrylist,  Types::Array

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        header: d.has_key?('header') ? Header.from_dynamic!(d.fetch("header")) : nil,
        entrylist:  d.has_key?('entrylist') ? d.fetch("entrylist") : [],
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "entrylist"  => @entrylist,
        "header" => @header.to_dynamic,
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