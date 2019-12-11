class WalletBackupResponse < Dry::Struct
  attribute :wallet_seed, Types::String
  attribute :addresses, Types::Array

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        wallet_seed: d.has_key?('wallet_seed') ? d.fetch("wallet_seed") : nil,
        addresses: d.has_key?('addresses') ? d.fetch("addresses") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "wallet_seed"  => @wallet_seed,
        "addresses"  => @addresses,
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