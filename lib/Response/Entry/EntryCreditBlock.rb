class CreditBlockHeader < Dry::Struct
  attribute :bodyhash?,       Types::String
  attribute :prevheaderhash?, Types::String
  attribute :prevfullhash?,       Types::String
  attribute :dbheight?, Types::Int
  attribute :headerexpansionarea?,       Types::String
  attribute :objectcount?, Types::Int
  attribute :bodysize?,       Types::Int
  attribute :chainid?,       Types::String
  attribute :ecchainid?,       Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
        bodyhash:       d.has_key?('bodyhash') ? d.fetch("bodyhash") : nil,
        prevheaderhash:            d.has_key?('prevheaderhash') ? d.fetch("prevheaderhash") : nil,
        prevfullhash:       d.has_key?('prevfullhash') ? d.fetch("prevfullhash") : nil,
        dbheight:            d.has_key?('dbheight') ? d.fetch("dbheight") : nil,
        headerexpansionarea:       d.has_key?('headerexpansionarea') ? d.fetch("headerexpansionarea") : nil,
        objectcount:            d.has_key?('objectcount') ? d.fetch("objectcount") : 0,
        bodysize:       d.has_key?('bodysize') ? d.fetch("bodysize") : 0,
        chainid:            d.has_key?('chainid') ? d.fetch("chainid") : nil,
        ecchainid:       d.has_key?('ecchainid') ? d.fetch("ecchainid") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "bodyhash" => @bodyhash,
        "prevheaderhash" => @prevheaderhash,
        "prevfullhash" => @prevfullhash,
        "dbheight" => @dbheight,
        "headerexpansionarea" => @headerexpansionarea,
        "objectcount" => @objectcount,
        "bodysize" => @bodysize,
        "chainid" => @chainid,
        "ecchainid" => @ecchainid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Body < Dry::Struct
  attribute :entries?,       Types::Array

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
        entries:       d.has_key?('entries') ? d.fetch("entries") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "entries" => @entries,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class EcBlock < Dry::Struct
  attribute :header?,       CreditBlockHeader
  attribute :body?, Body

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
        header:       d.has_key?('header') ? CreditBlockHeader.from_dynamic!(d.fetch("header")) : nil,
        body:            d.has_key?('body') ? Body.from_dynamic!(d.fetch("body")) : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "header" => @header.to_dynamic,
        "bodu" => @body.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class EntryCreditBlockResponse < Dry::Struct
  attribute :ecblock, EcBlock
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
        ecblock: d.has_key?('ecblock') ? EcBlock.from_dynamic!(d.fetch("ecblock")) : nil,
        rawdata:  d.has_key?('rawdata') ? d.fetch("rawdata") : '',
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "rawdata"  => @rawdata,
        "ecblock" => @ecblock.to_dynamic,
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