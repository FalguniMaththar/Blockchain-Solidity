// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract SimpleStorage {
    
    // TYPES & DECLARING VARIABLES
    
    uint256 public myUint = 123;            // Unsigned integer (0 to 2^256 - 1)
    int256 public myInt = -456;             // Signed integer (can be negative)
    bool public myBool = true;              // Boolean (true/false)
    string public myString = "Blockchain";  // String type
    address public myAddress = msg.sender;  // Ethereum wallet/contract address
    bytes32 public myBytes32 = keccak256(   // 32-byte fixed length data (hash)
        abi.encodePacked("Hello World")
    );

    
    uint256 favoriteNumber; 

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] public people; // people(index) -> (favoriteNumber, name)
    mapping(string => uint256) public nameToFavoriteNumber; // nameToFavoriteNumber(name) -> number

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}