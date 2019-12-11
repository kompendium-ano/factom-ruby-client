class BHeader < Dry::Struct
  attribute :prevbackrefhash, Types::String
  attribute :dbheight, Types::Int
  attribute :headerexpansionsize, Types::Int
  attribute :headerexpansionarea, Types::String
  attribute :messagecount, Types::Int
  attribute :bodysize, Types::Int
  attribute :adminchainid, Types::String
  attribute :chainid, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]

    new(
        prevbackrefhash: d.has_key?('prevbackrefhash') ? d.fetch("prevbackrefhash") : nil,
        dbheight: d.has_key?('dbheight') ? d.fetch("dbheight") : nil,
        headerexpansionsize: d.has_key?('headerexpansionsize') ? d.fetch("headerexpansionsize") : nil,
        headerexpansionarea: d.has_key?('headerexpansionarea') ? d.fetch("headerexpansionarea") : nil,
        messagecount: d.has_key?('messagecount') ? d.fetch("messagecount") : nil,
        bodysize: d.has_key?('bodysize') ? d.fetch("bodysize") : nil,
        adminchainid: d.has_key?('adminchainid') ? d.fetch("adminchainid") : nil,
        chainid: d.has_key?('chainid') ? d.fetch("chainid") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(json)
  end

  def to_dynamic
    {
        "prevbackrefhash"  => @prevbackrefhash,
        "dbheight"  => @dbheight,
        "headerexpansionsize"  => @headerexpansionsize,
        "headerexpansionarea"  => @headerexpansionarea,
        "messagecount"  => @messagecount,
        "bodysize"  => @bodysize,
        "adminchainid"  => @adminchainid,
        "chainid"  => @chainid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class ABlock < Dry::Struct
  attribute :header, BHeader
  attribute :abentries, Types::Array
  attribute :backreferencehash, Types::String
  attribute :lookuphash, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]

    new(
        header: d.has_key?('header') ? BHeader.from_json!(d.fetch("header")) : nil,
        abentries: d.has_key?('abentries') ? d.fetch("abentries") : nil,
        backreferencehash: d.has_key?('backreferencehash') ? d.fetch("backreferencehash") : nil,
        lookuphash: d.has_key?('lookuphash') ? d.fetch("lookuphash") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(json)
  end

  def to_dynamic
    {
        "header"  => @header.to_dynamic,
        "abentries"  => @abentries,
        "backreferencehash"  => @backreferencehash,
        "lookuphash"  => @lookuphash,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class ABlockByHeightResponse < Dry::Struct
  attribute :ablock, ABlock
  attribute :rawdata, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(d.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end

    new(
        ablock: d.has_key?('ablock') ? ABlock.from_json!(d.fetch("ablock")) : nil,
        rawdata: d.has_key?('rawdata') ? d.fetch("rawdata") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "ablock"  => @ablock.to_dynamic,
        "rawdata"  => @rawdata,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end