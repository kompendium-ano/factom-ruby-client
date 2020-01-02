class EntryCreditRateResponse < Dry::Struct
  attribute :rate, Types::Int

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        rate: d.has_key?('rate') ? d.fetch("rate") : 0,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "rate"  => @rate,
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