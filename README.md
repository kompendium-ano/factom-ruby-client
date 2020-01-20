# Ruby JSON-RPC client for Factom API

[![Build Status](https://travis-ci.com/kompendium-llc/factom-ruby-client.svg?branch=master)](https://travis-ci.com/kompendium-llc/factom-ruby-client)
[![Coverage Status](https://camo.githubusercontent.com/275ed9ffa38cbe3b7080582a63b11457161071ec/68747470733a2f2f636f766572616c6c732e696f2f7265706f732f6769746875622f6464696d617269612f6b6f612d747970657363726970742d737461727465722f62616467652e7376673f6272616e63683d646576656c6f70)](https://coveralls.io/github/kompendium-llc/factom-ruby-client?branch=master)
[![Gem](https://img.shields.io/gem/v/factom-rb.svg?style=flat)](http://rubygems.org/gems/factom-rb "View this project in Rubygems")
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/kompendium-llc/factom-ruby-client/blob/master/LICENSE)

A JSON-RPC Ruby client for the Factom protocol. Each response has special ADT(algebraic data type) that automatically converted from JSON response and suitable for further usage in business logic. All responses are available in [Response](https://github.com/kompendium-llc/factom-ruby-client/tree/master/lib/Response) directory along with convinient converters.

## Installation

**Ruby Gem**:
```bash
gem install factom-rb
```

**Git**:
```bash
git clone https://github.com/kompendium-llc/factom-ruby.git
```

## Config

You can set multiple types of connections not only local but a remote one.

```ruby
    # Change default node url or ports
    require_relative './factom-ruby/lib/config'
    config = Config.new

    config.setHost("https://factomd.net")
    config.setPort(8000)
    config.setWalletdPort(8009)
```

## Usage

As a result of each response you'll get a unique structure that available for use in business logic right away.

#### Retreiving a balance
```ruby
    require_relative './factom-ruby/lib/Factomd/FactomBalance'
    balance = FactomBalance.new(config)

    # get ec address balance
    result = balance.getECAddressBalance "EC2dTBH2Nc9t9Y7RFD3FYMN5ottoPeHdk6xqUWEc6eHVoBPj6CmH"
    puts result
```

#### Reading Entry Data
```ruby
    require_relative './factom-ruby/lib/Factomd/ReadFactomChain'

    rdChain = ReadFactomChain.new(config)
    readChain = rdChain.readChainEntry "b11bb4e1dacea726224c05bf863092ba02d301de55c08039f381e6e0ad1cef0d"
    puts readChain
```

####  Writing an Entry
```ruby
    require_relative './factom-ruby/lib/FactomWalletd/Compose'
    require_relative './factom-ruby/lib/Factomd/Chains'

    compose = Compose.new(config)
    puts(compose.composeEntry("48e0c94d00bf14d89ab10044075a370e1f55bcb28b2ff16206d865e192827645","EC2DKSYyRcNWf7RS963VFYgMExo1824HVeCfQ9PGPmNzwrcmgm2r"))

    chains = Chains.new(config)

    commitEntry = chains.commitEntry("00016dcfd0983146e5259a21586d887816878126d2e1dd28d446a11d6ab7987f4dc78f2e4e5c17d763ad62244461094efc15bd4f1b2a899e01037416545862d9990806e17e5fe246310ceacb573703b7a8e7f59e11351a23ad48bc22062ff28246748e90231e980bfe58514d89325855ba189f585c259aaaa4b7a420b3c6704fe692cdd49cc4a962e1fe07569bb35841e98b2aae647aff2c163f67722d51024a28e7f05635d07b61f0093a50289281b4a22bb1dc65bfe4a7ecb74f7bff9c58c580c48943c86b9a0e")
    puts commitEntry

    revealChain = chains.revealEntry "007E18CCC911F057FB111C7570778F6FDC51E189F35A6E6DA683EC2A264443531F000E0005746573745A0005746573745A48656C6C6F20466163746F6D21"
    puts revealChain
```

#### Block Height and Current Minute
```ruby
    require_relative './factom-ruby/lib/Factomd/Factoid'
    require_relative './factom-ruby/lib/Factomd/Chains'

    factoid = Factoid.new(config)
    heights = factoid.heights
    puts heights

    chains = Chains.new(config)
    currentMinute = chains.currentMinute
    puts currentMinute
```

#### Sending A Transaction
```ruby
    require_relative './factom-ruby/lib/Factomd/Transaction'
    txn = Transaction.new(config)
    data = [
        "txname" => "test1",
        "inputAddress" => "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q",
        "inputAmount" => 1000012000,
        "outputAddress" => "FA2yeHMMJR6rpjRYGe3Q4ogThHUmByk3WLhTjQDvPrxDoTYF8BbC",
        "outputAmount" => 1000000000
    ]
    rs = txn.sendTransaction data
    puts rs
```

#### Accessing fields by key
``` ruby
    debug = Debug.new(config)

    # eg. holdingQueue
    response = debug.holdingQueue
    p response.result.Messages
```

## Testing
```ruby
    ruby tests/Factomd.test.rb
    ruby tests/FactomWalletd.test.rb
    ruby tests/Debug.test.rb
```
## Support

Additional support for the Factom Protocol or library usage can be found on [discord](https://discord.gg/mYmcQM2)

## Development

To contribute to the `factom-ruby-client` library, clone the repository, create a feature branch and submit a PRfor review.

## Contributions

Please, feel free to contribute, fork the repo and submit PR.

Say thanks, send a tip:

- `btc`: 39oVXpsgsyW8ZgzsnX3sV7HLdtXWfT96qN
- `fct`: FA38cwer93mmPw1HxjScLmK1yF9iJTu5P87T2vdkbuLovm2YXyss
- `eth`: 0x9cDBA6bb44772259B3A3fb89cf233A147a720f34
- `xlm`: GD2FROTYXYSNOQQREYXHCXVOYWV556EM6PAHMVUHJNJEUYTUXUSNUZQ3