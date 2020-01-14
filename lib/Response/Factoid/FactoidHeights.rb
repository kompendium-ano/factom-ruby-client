class FactoidHeightsResponse < Dry::Struct
  attribute :directoryblockheight, Types::Int
  attribute :leaderheight, Types::Int
  attribute :entryblockheight, Types::Int
  attribute :entryheight, Types::Int

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        directoryblockheight: d.has_key?('directoryblockheight') ? d.fetch("directoryblockheight") : 0,
        leaderheight: d.has_key?('leaderheight') ? d.fetch("leaderheight") : 0,
        entryblockheight: d.has_key?('entryblockheight') ? d.fetch("entryblockheight") : 0,
        entryheight: d.has_key?('entryheight') ? d.fetch("entryheight") : 0,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "directoryblockheight"  => @directoryblockheight,
        "leaderheight"  => @leaderheight,
        "entryblockheight"  => @entryblockheight,
        "entryheight"  => @entryheight,
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