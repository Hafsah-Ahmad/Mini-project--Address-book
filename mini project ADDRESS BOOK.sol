// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressBook {
    
    //  Define a contact using struct
    struct Contact {
        string name;
        string phone;
        address wallet;
    }

    //  Dynamic array to store all contacts
    Contact[] private contacts;

    //  Mapping for quick name-based lookup
    mapping(string => uint) private nameToIndex;
    mapping(string => bool) private nameExists;

    // Add a new contact
    function addContact(string memory N, string memory P, address W) public {
        require(!nameExists[N], "Contact with this name already exists.");
        
        contacts.push(Contact(N,P,W));
        nameToIndex[N] = contacts.length - 1;
        nameExists[N] = true;
    }

    // Get contact by name
    function getContact(string memory N) public view returns (string memory, string memory, address) {
        require(nameExists[N], "Contact not found.");
        
        uint index = nameToIndex[N];
        Contact memory c = contacts[index];
        return (c.name, c.phone, c.wallet);
    }

    // Get all contacts (names only for gas saving)
    function getAllContactNames() public view returns (string[] memory) {
        string[] memory names = new string[](contacts.length);
        for (uint i = 0; i < contacts.length; i++) {
            names[i] = contacts[i].name;
        }
        return names;
    }

    // Delete contact by name
    function deleteContact(string memory N) public {
        require(nameExists[N], "Contact not found.");
        
        uint index = nameToIndex[N];
        uint lastIndex = contacts.length - 1;

        // Replace with last contact (swap & pop)
        contacts[index] = contacts[lastIndex];
        nameToIndex[contacts[index].name] = index;

        contacts.pop();
        delete nameToIndex[N];
        nameExists[N] = false;
    }
}
