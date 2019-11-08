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

# How to access response by key
    debug = Debug.new(config)
    
    # holdingQueue
    response = debug.holdingQueue
    p response.result.Messages
    
    # You can access all api's responses as like this
    
# Testing
    ruby tests/Factomd.test.rb
    ruby tests/FactomWalletd.test.rb
    ruby tests/Debug.test.rb
    
[Factomd](tests/Factomd.test.rb)

[Factom Walletd](tests/FactomWalletd.test.rb)

[Debug](tests/Debug.test.rb)

# OpenStruct Class Definition 
    An OpenStruct is a data structure, similar to a Hash, that allows the definition of
    arbitrary attributes with their accompanying values.
    This is accomplished by using Ruby's metaprogramming to define methods on the class itself.
    
   [Read More](https://ruby-doc.org/stdlib-2.5.1/libdoc/ostruct/rdoc/OpenStruct.html)
