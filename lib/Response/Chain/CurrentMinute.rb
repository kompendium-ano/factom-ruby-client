class CurrentMinuteResponse < Dry::Struct
  attribute :leaderheight, Types::Int
  attribute :directoryblockheight,  Types::Int
  attribute :minute, Types::Int
  attribute :currentblockstarttime,  Types::Int
  attribute :currentminutestarttime, Types::Int
  attribute :currenttime,  Types::Int
  attribute :directoryblockinseconds, Types::Int
  attribute :stalldetected,  Types::Bool
  attribute :faulttimeout, Types::Int
  attribute :roundtimeout,  Types::Int

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        leaderheight: d.has_key?('leaderheight') ? d.fetch("leaderheight") : 0,
        directoryblockheight:  d.has_key?('directoryblockheight') ? d.fetch("directoryblockheight") : 0,
        minute: d.has_key?('minute') ? d.fetch("minute") : 0,
        currentblockstarttime:  d.has_key?('currentblockstarttime') ? d.fetch("currentblockstarttime") : 0,
        currentminutestarttime: d.has_key?('currentminutestarttime') ? d.fetch("currentminutestarttime") : 0,
        currenttime:  d.has_key?('currenttime') ? d.fetch("currenttime") : 0,
        directoryblockinseconds: d.has_key?('directoryblockinseconds') ? d.fetch("directoryblockinseconds") : 0,
        stalldetected:  d.has_key?('stalldetected') ? d.fetch("stalldetected") : false,
        faulttimeout: d.has_key?('faulttimeout') ? d.fetch("faulttimeout") : 0,
        roundtimeout:  d.has_key?('roundtimeout') ? d.fetch("roundtimeout") : 0,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "leaderheight"  => @leaderheight,
        "directoryblockheight" => @directoryblockheight,
        "minute"  => @minute,
        "currentblockstarttime" => @currentblockstarttime,
        "currentminutestarttime"  => @currentminutestarttime,
        "currenttime" => @currenttime,
        "directoryblockinseconds"  => @directoryblockinseconds,
        "stalldetected" => @stalldetected,
        "faulttimeout"  => @faulttimeout,
        "roundtimeout" => @roundtimeout,
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