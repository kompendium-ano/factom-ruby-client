class Header < Dry::Struct
  attribute :prevblockkeymr?, Types::String
  attribute :sequencenumber?, Types::Int
  # attribute :timestamp, Types::Int

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]

    new(
        prevblockkeymr: d.has_key?('prevblockkeymr') ? d.fetch("prevblockkeymr") : nil,
        sequencenumber: d.has_key?('sequencenumber') ? d.fetch("sequencenumber") : 0,
        timestamp: d.has_key?('timestamp') ? d.fetch("timestamp") : 0,
        )
  end

  def self.from_json!(json)
    from_dynamic!(json)
  end

  def to_dynamic
    {
        "prevblockkeymr"  => @prevblockkeymr,
        "sequencenumber"  => @sequencenumber,
        "timestamp"  => @timestamp,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class DirectoryBlockResponse < Dry::Struct
  attribute :header, Header
  attribute :entryblocklist, Types::Array

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(d.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end

    new(
        header: d.has_key?('header') ? Header.from_json!(d.fetch("header")) : nil,
        entryblocklist: d.has_key?('entryblocklist') ? d.fetch("entryblocklist") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "header"  => @header.to_dynamic,
        "entryblocklist"  => @entryblocklist,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end