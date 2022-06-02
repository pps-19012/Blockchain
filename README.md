# Blockchain
Blockchain projects coming soon...

## [Blockchain Merkle Tree](https://www.javatpoint.com/blockchain-merkle-tree#:~:text=Merkle%20tree%20is%20a%20fundamental,a%20large%20body%20of%20data.)
> Merkle tree is a fundamental part of blockchain technology. It is a mathematical data structure composed of hashes of different blocks of data, and which serves as a summary of all the transactions in a block. It also allows for efficient and secure verification of content in a large body of data. It also helps to verify the consistency and content of the data. Both Bitcoin and Ethereum use Merkle Trees structure. Merkle Tree is also known as Hash Tree.

The concept of Merkle Tree is named after Ralph Merkle, who patented the idea in 1979. Fundamentally, it is a data structure tree in which every leaf node labelled with the hash of a data block, and the non-leaf node labelled with the cryptographic hash of the labels of its child nodes. The leaf nodes are the lowest node in the tree.

How do Merkle trees work?
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
