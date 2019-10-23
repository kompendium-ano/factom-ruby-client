# factom-ruby

# Implementation
    clone this repo on your project root path
    git clone https://gitlab.com/kompendium/factom-ruby.git
# Usage
    require_relative './factom-ruby/lib/Factomd/FactomBalance'
    balance = FactomBalance.new
    
    # get ec address balance
    result = balance.getECAddressBalance "EC2dTBH2Nc9t9Y7RFD3FYMN5ottoPeHdk6xqUWEc6eHVoBPj6CmH"
    puts result 
# Example 

[Factomd](Factomd.test.rb)

[Factom Walletd](FactomWalletd.test.rb)

[Debug](Debug.test.rb)