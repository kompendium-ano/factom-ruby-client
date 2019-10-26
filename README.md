<<<<<<< HEAD
# factom-ruby

# Implementation
    clone this repo on your project root path
    git clone https://gitlab.com/kompendium/factom-ruby.git
    
# Config
    You can change default node url or ports
    require_relative './factom-ruby/lib/config'
    config = Config.new
    
    config.setHost("http://abc.com")
    config.setPort(8000)
    config.setWalletdPort(8009)

# Usage
# Retreiving a balance
    require_relative './factom-ruby/lib/Factomd/FactomBalance'
    balance = FactomBalance.new(config)
    
    # get ec address balance
    result = balance.getECAddressBalance "EC2dTBH2Nc9t9Y7RFD3FYMN5ottoPeHdk6xqUWEc6eHVoBPj6CmH"
    puts result 
    
# Reading Entry Data
    require_relative './factom-ruby/lib/Factomd/ReadFactomChain'
    
    rdChain = ReadFactomChain.new(config)
    readChain = rdChain.readChainEntry "b11bb4e1dacea726224c05bf863092ba02d301de55c08039f381e6e0ad1cef0d"
    puts readChain
    
# Writing an Entry
    require_relative './factom-ruby/lib/FactomWalletd/Compose'
    require_relative './factom-ruby/lib/Factomd/Chains'
    
    compose = Compose.new(config)
    puts(compose.composeEntry("48e0c94d00bf14d89ab10044075a370e1f55bcb28b2ff16206d865e192827645","EC2DKSYyRcNWf7RS963VFYgMExo1824HVeCfQ9PGPmNzwrcmgm2r"))

    chains = Chains.new(config)
    
    commitEntry = chains.commitEntry("00016dcfd0983146e5259a21586d887816878126d2e1dd28d446a11d6ab7987f4dc78f2e4e5c17d763ad62244461094efc15bd4f1b2a899e01037416545862d9990806e17e5fe246310ceacb573703b7a8e7f59e11351a23ad48bc22062ff28246748e90231e980bfe58514d89325855ba189f585c259aaaa4b7a420b3c6704fe692cdd49cc4a962e1fe07569bb35841e98b2aae647aff2c163f67722d51024a28e7f05635d07b61f0093a50289281b4a22bb1dc65bfe4a7ecb74f7bff9c58c580c48943c86b9a0e")
    puts commitEntry
    
    revealChain = chains.revealEntry "007E18CCC911F057FB111C7570778F6FDC51E189F35A6E6DA683EC2A264443531F000E0005746573745A0005746573745A48656C6C6F20466163746F6D21"
    puts revealChain
    
# Block Height and Current Minute
    require_relative './factom-ruby/lib/Factomd/Factoid'
    require_relative './factom-ruby/lib/Factomd/Chains'
    
    factoid = Factoid.new(config)
    heights = factoid.heights
    puts heights
    
    chains = Chains.new(config)
    currentMinute = chains.currentMinute
    puts currentMinute
    
# Sending A Transaction
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
    
# Testing
    ruby tests/Factomd.test.rb
    ruby tests/FactomWalletd.test.rb
    ruby tests/Debug.test.rb
    
[Factomd](tests/Factomd.test.rb)

[Factom Walletd](tests/FactomWalletd.test.rb)

[Debug](tests/Debug.test.rb)
=======
[![Build Status](https://travis-ci.com/kompendium-llc/factom-ruby.svg?branch=master)](https://travis-ci.com/kompendium-llc/factom-ruby)
[![codecov](https://codecov.io/gh/kompendium-llc/factom-ruby/branch/master/graph/badge.svg)](https://codecov.io/gh/kompendium-llc/factom-ruby)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/kompendium-llc/factom-ruby/blob/master/LICENSE)
[![Discord](https://img.shields.io/discord/419201548372017163.svg?label=&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)](https://discord.gg/mYmcQM2)

# Factom-Ruby

## [Documentation](kompendium-llc.github.io/factom-ruby)

A json-rpc client for the Factom protocol. 



## Installation

**Ruby Gem**:
```bash
gem install factom
```

**Git**:
```bash
git clone https://github.com/kompendium-llc/factom-ruby.git
```

## Custom Parameters  
```
# <IN HERE INCLUDE HOW TO SET A REMOTE URL AND PORT>
# config -> setHost api.factomd.net
# config -> setPort 443
```

~~You can change default node url on config file - lib/config.rb~~

## Usage

#### Retreiving a balance
```ruby
require_relative './factom-ruby/lib/Factomd/FactomBalance'
balance = FactomBalance.new
result = balance.getECAddressBalance "EC2dTBH2Nc9t9Y7RFD3FYMN5ottoPeHdk6xqUWEc6eHVoBPj6CmH"
puts result
``` 

#### Reading Entry Data
```ruby
# factomd -> entry api
```

#### Writing an Entry
*Note: Ensure data in the entry fields is hex-encoded. This includes the content section.*

```ruby
# walletd -> compose entry -> ( <COMMIT>, <REVEAL>)
# chainid: 48e0c94d00bf14d89ab10044075a370e1f55bcb28b2ff16206d865e192827645
# ext-ids: [ "cd90", "90cd"]
# content: "abcdef"
# ec-pub: "EC2DKSYyRcNWf7RS963VFYgMExo1824HVeCfQ9PGPmNzwrcmgm2r"

# factomd -> commit entry
# params: <COMMIT>

# factomd -> reveal entry
#params: <REVEAL>
```

#### Block Height and Current Minute
```ruby
# factomd -> Get Height

# factomd -> current minute
```



#### Sending A Transaction
```ruby
# walletd -> new-transaction
# tx-name: "MyTx"

# walletd -> add Input
# tx-name: "MyTx"
# amount: 10000
# address: FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q

# walletd -> add Output
# tx-name: "MyTx"
# amount: 10000
# address: FA2H7gecy8Nr7cxF7ngtByW23PxvrysuzYMAiAhbRTddCWZTLs4P

# walletd -> add Fee
# tx-name: "MyTx"
# address: FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q

# walletd -> Sign Transaction
# tx-name: "MyTx"

# walletd -> Compose Transaction -> <TX HEX STRING>
# tx-name: "MyTx"

# factomd -> factoidSubmit
#transaction: <TX HEX STRING>
```

## Testing

```bash
<SHOW HOW TO RUN THE TESTS>
```

[Factomd](Factomd.test.rb)

[Factom Walletd](FactomWalletd.test.rb)

[Debug](Debug.test.rb)

## Support

Additional support for the Factom Protocol or library usage can be found on [discord](https://discord.gg/mYmcQM2)

## Development

To contribute to the factom-ruby library, clone the repository, create a feature branch and submit a PR to the develop branch.
>>>>>>> f701931... added codecov badge
