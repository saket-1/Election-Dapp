//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract Election{
    
    struct Candidate{
        uint id;
        string name;
        uint votecount;
    }
    
    uint public candidatesCount;
    
    mapping(uint => Candidate) public candidates;
    
    mapping(address => bool) public votedornot;
    
    event electionupdates(
          uint indexed _candidateId);
    
    constructor(){
        addCandidate("Rahul");
        addCandidate("Modi");
        
    }
    
    function addCandidate(string memory name) private{
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount,name,0);
    }
    
    function vote(uint _candidateId) public{
        require(!votedornot[msg.sender]);
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        candidates[_candidateId].votecount++;
        votedornot[msg.sender] = true;
        emit electionupdates(_candidateId);
    }
}