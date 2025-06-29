                                     AddressBook Smart Contract


A decentralized Ethereum-based Address Book built with Solidity. This contract allows users to securely store, retrieve, and manage contacts on the blockchain. Each user's contact list is private and isolated.

Features=

-Add a new contact by name and Ethereum address
-Retrieve a contact's address by name
-View all saved contact names
-Delete a contact
-Contact list is user-specific — no one can view or modify someone else’s contacts


Smart Contract Overview

Technologies Used=
- Solidity `^0.8.0`
- Remix IDE

Core Data Structures=
solidity
struct Contact {
    string name;
    address contactAddress;
}

mapping(address => mapping(string => Contact)) private userContacts;
mapping(address => string[]) private contactNames;
