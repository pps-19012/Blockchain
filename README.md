# Blockchain
Blockchain projects coming soon...

## [Blockchain Merkle Tree](https://www.javatpoint.com/blockchain-merkle-tree#:~:text=Merkle%20tree%20is%20a%20fundamental,a%20large%20body%20of%20data.)
> Merkle tree is a fundamental part of blockchain technology. It is a mathematical data structure composed of hashes of different blocks of data, and which serves as a summary of all the transactions in a block. It also allows for efficient and secure verification of content in a large body of data. It also helps to verify the consistency and content of the data. Both Bitcoin and Ethereum use Merkle Trees structure. Merkle Tree is also known as Hash Tree.
>
> The concept of Merkle Tree is named after Ralph Merkle, who patented the idea in 1979. Fundamentally, it is a data structure tree in which every leaf node labelled with the hash of a data block, and the non-leaf node labelled with the cryptographic hash of the labels of its child nodes. The leaf nodes are the lowest node in the tree.

#### How do Merkle trees work?
A Merkle tree stores all the transactions in a block by producing a digital fingerprint of the entire set of transactions. It allows the user to verify whether a transaction can be included in a block or not.

Merkle trees are created by repeatedly calculating hashing pairs of nodes until there is only one hash left. This hash is called the Merkle Root, or the Root Hash. The Merkle Trees are constructed in a bottom-up approach.

Every leaf node is a hash of transactional data, and the non-leaf node is a hash of its previous hashes. Merkle trees are in a binary tree, so it requires an even number of leaf nodes. If there is an odd number of transactions, the last hash will be duplicated once to create an even number of leaf nodes.

## [Bitcoin Whitepaper](https://bitcoin.org/bitcoin.pdf)
> A purely peer-to-peer version of electronic cash would allow online
payments to be sent directly from one party to another without going through a
financial institution. Digital signatures provide part of the solution, but the main
benefits are lost if a trusted third party is still required to prevent double-spending.
We propose a solution to the double-spending problem using a peer-to-peer network.
The network timestamps transactions by hashing them into an ongoing chain of
hash-based proof-of-work, forming a record that cannot be changed without redoing
the proof-of-work. The longest chain not only serves as proof of the sequence of
events witnessed, but proof that it came from the largest pool of CPU power. As
long as a majority of CPU power is controlled by nodes that are not cooperating to
attack the network, they'll generate the longest chain and outpace attackers. The
network itself requires minimal structure. Messages are broadcast on a best effort
basis, and nodes can leave and rejoin the network at will, accepting the longest
proof-of-work chain as proof of what happened while they were gone.

## Blockchain Nodes
#### Main network
- Persistent
- Real Blockchain
- Costs money
#### Test Networks
- Persistent but can be deleted
- Real Blockchain
- Beta Release
#### Developer Networks (like Ganache)
- Unit Testing
- Fast
- Non-persistent

## Cryptographic Hashing
#### Properties:
- deterministic, i.e. same output for same input.
- quick to compute.
- infeasible to generate a message from hash value.
- small change gives different hash value.
- infeasible to find two different messages with same hash value.

## Smart contract
- State machine: needs transaction to change state. Can do logic operations.
- State change happens only through **mining** or **transaction**.
- Turing complete.
- Languages: Solidity, Vyper, Serpent, LLL, Mutan

## Variables 
- intialized by default. There is no null or undefined value
- reference type need a memory location (memory/stoarge)
- Address:
  - holds 20 byte values.
  - has a member _balance_ which has balance in Wei
- Strings and Bytes
  - Both are special arrays. 
  - Expensive.
  - String is equal to bytes but does not have a length of index-access.
  - Bytes for arbitrary length raw data. String for arbitrary length string (UTF-8) data.
- All variables are statically typed.
- Not all rules to development apply as 
    - limited resources
    - variable initialization

## Address
- members ``` address myAddress = "0xabc123..."```
  - ```myAddress.balance``` => balance in Wei
  - ```myAddress.transfer``` => transfer from smart contract (amount in Wei)
- low-level calls => ```.send()``` returns a boolean. Doesn't cascade exceptions.
- ```.call.gas().value()``` lets you forward a specific amount of gas. Also returns a boolean.
- ```.send(), .transfer()``` both only transfer 2300 gas along.

## Global Objects
- help understand transaction logistics. Properties:
  - ```msg.sender``` - Address of the account that initialized the transaction.
  - ```msg.value``` - Amount of Ether sent along.
  - ```now``` - curernt timestamp. (Beware, this can be influenced).

## Payable functions 
- Function cannot receive Ether unless marked as _payable_.
- If function not marked as _payable_ receive Ether the transaction fails.

## Mapping
- mapping (eg. __keyType_ => __valueType_)

## Fungible vs Non-Fungible Tokens
### Non-Fungible tokens are:
- Non interchangeable.
- Unique.
- Non-divisible (to some degree).
- ERC-721 standard.

### Fungible tokens are:
- Interchangeable.
- Uniform.
- Divisible.
- ERC-20 or ERC-777 standard.

## Gas — the fuel Ethereum DApps run on
In Solidity, your users have to pay every time they execute a function on your DApp using a currency called gas. Users buy gas with Ether (the currency on Ethereum), so your users have to spend ETH in order to execute functions on your DApp.

How much gas is required to execute a function depends on how complex that function's logic is. Each individual operation has a gas cost based roughly on how much computing resources will be required to perform that operation (e.g. writing to storage is much more expensive than adding two integers). The total gas cost of your function is the sum of the gas costs of all its individual operations.

Because running functions costs real money for your users, code optimization is much more important in Ethereum than in other programming languages. If your code is sloppy, your users are going to have to pay a premium to execute your functions — and this could add up to millions of dollars in unnecessary fees across thousands of users.

### Why is gas necessary?
Ethereum is like a big, slow, but extremely secure computer. When you execute a function, every single node on the network needs to run that same function to verify its output — thousands of nodes verifying every function execution is what makes Ethereum decentralized, and its data immutable and censorship-resistant.

The creators of Ethereum wanted to make sure someone couldn't clog up the network with an infinite loop, or hog all the network resources with really intensive computations. So they made it so transactions aren't free, and users have to pay for computation time as well as storage.

## Crowdsale contract:
https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol
