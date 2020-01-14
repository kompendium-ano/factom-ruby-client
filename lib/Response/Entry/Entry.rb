class EntryResponse < Dry::Struct
  attribute :chainid, Types::String
  attribute :content,  Types::String
  attribute :extids, Types::Array

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        chainid: d.has_key?('chainid') ?  d.fetch("chainid") : '',
        content:  d.has_key?('content') ?  d.fetch("content") : '',
        extids: d.has_key?('extids') ? d.fetch("extids") : [],
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "chainid" => @chainid,
        "content"  => @content,
        "extids" => @extids,
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