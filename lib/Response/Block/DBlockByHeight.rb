class Dheader < Dry::Struct
  attribute :version?, Types::Int
  attribute :networkid?, Types::Int
  attribute :bodymr?, Types::String
  attribute :prevkeymr?, Types::String
  attribute :prevfullhash?, Types::String
  attribute :timestamp?, Types::Int
  attribute :dbheight?, Types::Int
  attribute :blockcount?, Types::Int
  attribute :chainid?, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]

    new(
        version: d.has_key?('version') ? d.fetch("version") : 0,
        networkid: d.has_key?('networkid') ? d.fetch("networkid") : 0,
        bodymr: d.has_key?('bodymr') ? d.fetch("bodymr") : nil,
        prevkeymr: d.has_key?('prevkeymr') ? d.fetch("prevkeymr") : nil,
        prevfullhash: d.has_key?('prevfullhash') ? d.fetch("prevfullhash") : nil,
        timestamp: d.has_key?('timestamp') ? d.fetch("timestamp") : 0,
        dbheight: d.has_key?('dbheight') ? d.fetch("dbheight") : 0,
        blockcount: d.has_key?('blockcount') ? d.fetch("blockcount") : 0,
        chainid: d.has_key?('chainid') ? d.fetch("chainid") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(json)
  end

  def to_dynamic
    {
        "version"  => @version,
        "networkid"  => @networkid,
        "bodymr"  => @bodymr,
        "prevkeymr"  => @prevkeymr,
        "prevfullhash"  => @prevfullhash,
        "timestamp"  => @timestamp,
        "dbheight"  => @dbheight,
        "blockcount"  => @blockcount,
        "chainid"  => @chainid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class DBlock < Dry::Struct
  attribute :header, Dheader
  attribute :dbentries, Types::Array
  attribute :dbhash, Types::String
  attribute :keymr, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]

    new(
        header: d.has_key?('header') ? Dheader.from_json!(d.fetch("header")) : nil,
        dbentries: d.has_key?('dbentries') ? d.fetch("dbentries") : nil,
        dbhash: d.has_key?('dbhash') ? d.fetch("dbhash") : nil,
        keymr: d.has_key?('keymr') ? d.fetch("keymr") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(json)
  end

  def to_dynamic
    {
        "header"  => @header.to_dynamic,
        "dbentries"  => @dbentries,
        "dbhash"  => @dbhash,
        "keymr"  => @keymr,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class DBlockByHeightResponse < Dry::Struct
  attribute :dblock, DBlock
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
        dblock: d.has_key?('dblock') ? DBlock.from_json!(d.fetch("dblock")) : nil,
        rawdata: d.has_key?('rawdata') ? d.fetch("rawdata") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "dblock"  => @dblock.to_dynamic,
        "rawdata"  => @rawdata,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end