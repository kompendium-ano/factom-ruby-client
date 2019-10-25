require_relative './lib/Factomd/FactomBalance'
require_relative './lib/Factomd/CreateFactomChain'
require_relative './lib/Factomd/ReadFactomChain'
require_relative './lib/Factomd/Transaction'
require_relative './lib/Factomd/Blocks'
require_relative './lib/Factomd/Chains'
require_relative './lib/Factomd/Entry'
require_relative './lib/Factomd/Factoid'
require_relative './lib/Factomd/Others'

#
# balance = FactomBalance.new
#
# # get ec address balance
# result = balance.getECAddressBalance "EC2dTBH2Nc9t9Y7RFD3FYMN5ottoPeHdk6xqUWEc6eHVoBPj6CmH"
# puts result
#
# # get factoid address balance
# result = balance.getFactoidAddressBalance "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q"
# puts result
#
# # get multiple ec address balance
# result = balance.multiEcBalance ["EC293AbTn3VScgC2m86xTh2kFKAMNnkgoLdXgywpPa66Jacom5ya","EC3ExcVhmGRJmavCf1LCMu8YiHCyU2CWVh5DmXRz6jfPHMbzJSCz"]
# puts result
#
# # get multiple factoid address balance
# result = balance.multiFctBalance ["FA3uMAv9htC5y5u3ayzxNQKZNDpgrJVf49kJSKdVNxcYoNBbSLXc","FA3umgJaXdHjpSQyBUPC2uMFuoW9nM5Ymm8Sa2f2VKGSqsyx79nf"]
# puts result
#
# # create a factom chain
# crChain = CreateFactomChain.new
# rs = crChain.createFactomChain "EC3hAg6HGZ2cGeGeqkmLgF7mc5gPuyDFooqwy9GrMdvABiaxmu2y", "hghgjuytuy"
# puts rs
#
# # Make a Factom Entry
# rs = crChain.makeFactomEntry "fc66c38089454fdfb2e4e51835988592db6294d167d53d5f5a7b13944e3644c9", "EC2VKr9Vm5yuWtT9DMfnyPUDZkJH6oiNBipbtjA3YLWkenW9P1qm"
# puts rs
#
# # Read Factom Entry
# rdChain = ReadFactomChain.new
# readChain = rdChain.readChainEntry "b11bb4e1dacea726224c05bf863092ba02d301de55c08039f381e6e0ad1cef0d"
# puts readChain
#
# # send transaction
# txn = Transaction.new
# data = [
#     "txname" => "test1",
#     "inputAddress" => "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q",
#     "inputAmount" => 1000012000,
#     "outputAddress" => "FA2yeHMMJR6rpjRYGe3Q4ogThHUmByk3WLhTjQDvPrxDoTYF8BbC",
#     "outputAmount" => 1000000000
# ]
# rs = txn.sendTransaction data
# puts rs
#
# # Get Transaction List
# tx = txn.pendingTransactions "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q"
# puts tx
#
# # Get Transaction
# txtn = txn.transaction "64251aa63e011f803c883acf2342d784b405afa59e24d9c5506c84f6c91bf18b"
# puts txtn
#
# blocks = Blocks.new
# # Get Block Height
# blkHeight = blocks.ablockByHeight
# puts blkHeight
#
# # Get Block Height
# ack = blocks.ack "e96cca381bf25f6dd4dfdf9f7009ff84ee6edaa3f47f9ccf06d2787482438f4b", "f9164cd66af9d5773b4523a510b5eefb9a5e626480feeb6671ef2d17510ca300"
# puts ack
#
#
# # Get admin-block
# adminBlock = blocks.adminBlock "ee4793393cc7cb7c93b9f609a850e13976be24a16f4b2ce81fb4177df72a865b"
# puts adminBlock
#
# # Retrieves a directory block given only its height.
# dblockByHeight = blocks.dblockByHeight 14460
# puts dblockByHeight
#
#
# # # directory-block
# directoryBlock = blocks.directoryBlock "7ed5d5b240973676c4a8a71c08c0cedb9e0ea335eaef22995911bcdc0fe9b26b"
# puts directoryBlock
#
# # directory-block
# directoryBlockHead = blocks.directoryBlockHead
# puts directoryBlockHead
#
# # directory-block
# ecblockByHeight = blocks.ecblockByHeight 10000
# puts ecblockByHeight
#
# chains = Chains.new
# # Get Chain Head
# chainHead = chains.chainHead "5a77d1e9612d350b3734f6282259b7ff0a3f87d62cfef5f35e91a5604c0490a3"
# puts chainHead
#
# # Commit Chain
# commitChain = chains.commitChain("00016dcfd0983146e5259a21586d887816878126d2e1dd28d446a11d6ab7987f4dc78f2e4e5c17d763ad62244461094efc15bd4f1b2a899e01037416545862d9990806e17e5fe246310ceacb573703b7a8e7f59e11351a23ad48bc22062ff28246748e90231e980bfe58514d89325855ba189f585c259aaaa4b7a420b3c6704fe692cdd49cc4a962e1fe07569bb35841e98b2aae647aff2c163f67722d51024a28e7f05635d07b61f0093a50289281b4a22bb1dc65bfe4a7ecb74f7bff9c58c580c48943c86b9a0e")
# puts commitChain
#
# # Commit Entry
# commitEntry = chains.commitEntry("00016dcfd0983146e5259a21586d887816878126d2e1dd28d446a11d6ab7987f4dc78f2e4e5c17d763ad62244461094efc15bd4f1b2a899e01037416545862d9990806e17e5fe246310ceacb573703b7a8e7f59e11351a23ad48bc22062ff28246748e90231e980bfe58514d89325855ba189f585c259aaaa4b7a420b3c6704fe692cdd49cc4a962e1fe07569bb35841e98b2aae647aff2c163f67722d51024a28e7f05635d07b61f0093a50289281b4a22bb1dc65bfe4a7ecb74f7bff9c58c580c48943c86b9a0e")
# puts commitEntry
#
# # Get Current Minute
# currentMinute = chains.currentMinute
# puts currentMinute
#
# # reveal-chain
# revealChain = chains.revealChain "007E18CCC911F057FB111C7570778F6FDC51E189F35A6E6DA683EC2A264443531F000E0005746573745A0005746573745A48656C6C6F20466163746F6D21"
# puts revealChain
#
#
# # reveal-entry
# revealChain = chains.revealEntry "007E18CCC911F057FB111C7570778F6FDC51E189F35A6E6DA683EC2A264443531F000E0005746573745A0005746573745A48656C6C6F20466163746F6D21"
# puts revealChain
#
# # To Check Commit Chain
# sendRawMessage = chains.sendRawMessage "00016dcfa2434846e5259a21586d887816878126d2e1dd28d446a11d6ab7987f4dc78f2e4e5c17d763ad62244461094efc15bd4f1b2a899e01037416545862d9990806e17e5fe246310ceacb573703b7a8e7f59e11351a23ad48bc22062ff28246748e90231e980bfe58514d89325855ba189f585c259aaaa4b7a420b3c6704fe692cdd49cc4a9628f2383a36a95fe1ae2bc2314a5011605601ecf7858fbbbf8eb2388787d2cd680d8d90961f5760f94397733462e21cbaf1867ef85a68c671cc14e4bc4694cc102"
# puts sendRawMessage
#
# entry = Entry.new
#
# # Get Entry
# rs = entry.entry "24674e6bc3094eb773297de955ee095a05830e431da13a37382dcdc89d73c7d7"
# puts rs
#
# # entry-ack
# rs = entry.entryAck "9228b4b080b3cf94cceea866b74c48319f2093f56bd5a63465288e9a71437ee8"
# puts rs
#
# # entry-block
# rs = entry.entryBlock "041c3fed14469a3d0f1a022e3d5321583065e691edb9223605c86766ff881883"
# puts rs
#
# # entrycredit-block
# rs = entry.entrycreditBlock "2050b16701f29238d6b99bcf3fb0ca55d6d884139601f06691fc370cda659d60"
# puts rs
#
# # entry-credit-rate
# rs = entry.entryCreditRate
# puts rs
#
# # pending-entries
# rs = entry.pendingEntries
# puts rs
#
# factoid = Factoid.new
#
# # factoidAck
# factoidAck = factoid.factoidAck "f1d9919829fa71ce18caf1bd8659cce8a06c0026d3f3fffc61054ebb25ebeaa0"
# puts factoidAck
#
# # factoidBlock
# factoidBlock = factoid.factoidBlock "1df843ee64f4b139047617a2df1007ea4470fabd097ddf87acabc39813f71480"
# puts factoidBlock
#
# # fblockByHeight
# fblockByHeight = factoid.fblockByHeight 1
# puts fblockByHeight
#
# # fblockByHeight
# heights = factoid.heights
# puts heights
#
oth = Others.new
#
# # properties
# prop = oth.properties
# puts prop
#
# # raw-data
# rawData = oth.rawData "ee380f524689af957528c91e5674d0226744d19630fa45daec794f1d0c0c0222"
# puts rawData
#
# # receipt
# receipt = oth.receipt "2413a0f67e7dd988728f77020905829eef62ad06c0b7bf8e52a7e1455d5f3fb6"
# puts receipt
#

# # anchor
# anchor = oth.anchors "2413a0f67e7dd988728f77020905829eef62ad06c0b7bf8e52a7e1455d5f3fb6"
# puts anchor

# diagnostics
# diagnostics = oth.diagnostics
# puts diagnostics

