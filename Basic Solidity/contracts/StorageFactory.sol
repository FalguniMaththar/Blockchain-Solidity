// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./Simple.Storage.sol"; // Import the SimpleStorage contract

contract StorageFactory {
    // Array of deployed SimpleStorage contracts
    SimpleStorage[] public storageContracts;

    // Deploy a new SimpleStorage contract
    function createSimpleStorageContract() public {
        SimpleStorage newStorage = new SimpleStorage();
        storageContracts.push(newStorage);
    }

    // Call store() on a specific SimpleStorage contract
    function storeNumber(uint256 _index, uint256 _favoriteNumber) public {
        SimpleStorage selectedStorage = storageContracts[_index];
        selectedStorage.store(_favoriteNumber);
    }

    // Call retrieve() on a specific SimpleStorage contract
    function getNumber(uint256 _index) public view returns (uint256) {
        SimpleStorage selectedStorage = storageContracts[_index];
        return selectedStorage.retrieve();
    }
}