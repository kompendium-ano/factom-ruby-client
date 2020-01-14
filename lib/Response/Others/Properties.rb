class PropertiesResponse < Dry::Struct
  attribute :factomdversion, Types::String
  attribute :factomdapiversion, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        factomdversion: d.has_key?('factomdversion') ? d.fetch("factomdversion") : nil,
        factomdapiversion: d.has_key?('factomdapiversion') ? d.fetch("factomdapiversion") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "factomdversion"  => @factomdversion,
        "factomdapiversion"  => @factomdapiversion,
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