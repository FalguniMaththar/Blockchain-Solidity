// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;



contract FundMe {
    // Keep track of who funded and how much
    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;

    // Minimum contribution (0.01 ETH)
    uint256 public constant MINIMUM_USD = 0.01 ether;

    // Fund the contract
    function fund() public payable {
        // msg.value is in wei → check minimum contribution
        require(msg.value >= MINIMUM_USD, "Send at least 0.01 ETH!");

        // msg.sender = address of the sender
        addressToAmountFunded[msg.sender] += msg.value;

        // Add new funder
        funders.push(msg.sender);
    }

    // Show balance of contract
    function getBalance() public view returns (uint256) {
        return address(this).balance; // total ETH stored
    }

    // Withdraw funds (only owner in real use)
    function withdraw() public {
        // send all ETH to the caller (msg.sender)
        payable(msg.sender).transfer(address(this).balance);
    }
}