// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProofOfExistence {
    // 1. State Variables
    address public owner;  
    mapping(bytes32 => uint256) public proofs;  

    // 4. Events
    event DocumentNotarized(address indexed sender, bytes32 indexed documentHash, uint256 timestamp);

    // 2. Constructor
    constructor() {
        owner = msg.sender;  
    }

    // 3a. Function to notarize a document
    function notarizeDocument(bytes32 _documentHash) public {
        require(proofs[_documentHash] == 0, "Document already notarized");
        proofs[_documentHash] = block.timestamp;  
        emit DocumentNotarized(msg.sender, _documentHash, block.timestamp);  
    }

    // 3b. Function to verify a document
    function verifyDocument(bytes32 _documentHash) public view returns (bool) {
        return proofs[_documentHash] > 0;  
    }
}
