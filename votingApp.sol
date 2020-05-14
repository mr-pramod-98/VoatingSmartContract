pragma solidity ^0.5.0;

contract myVotingContract{
    
    // CONSTRUCTOR TO CREATE 2 INITIAL CANDIDATES
    constructor() public{
        
        // CREATING CANDIDATE-1
        numberOfCandidates++;
        candidates[numberOfCandidates] = Candidates(numberOfCandidates, "Bitcoin", 0);
        
        // CREATING CANDIDATE-2
        numberOfCandidates++;
        candidates[numberOfCandidates] = Candidates(numberOfCandidates, "Litecoin", 0);
    }
    
    // STRUCTURE "Candidates" TO STORE DETAILS OF THE CANDIDATES
    struct Candidates{
        uint candidateNumber;
        string candidateName;
        int voteCount;
    }
    
    // USED TO MAINTAIN THE NUMBER OF CANDIDATES
    uint private numberOfCandidates = 0;
    
    // MAPPING OF CANDIDATES WITH THEIR CANDIDATE-NUMBER
    mapping(uint=>Candidates) private candidates;
    
    // THIS FUNCTION IS USED TO ADD NEW CANDIDATES
    function addCandidate(string memory candidateName) public{
        numberOfCandidates++;
        candidates[numberOfCandidates] = Candidates(numberOfCandidates, candidateName, 0);
    }
    
    // THIS FUNCTION IS USED TO GET THE CANDIDATE DETAILS
    function getCandidate(uint candidateNumber) view public returns(uint, string memory){
        return(
            candidates[candidateNumber].candidateNumber,
            candidates[candidateNumber].candidateName
        );
    }
    
    // THIS FUNCTION IS USED HANDEL THE VOTING ACTION
    function voteTo(uint candidateNumber) public{
        // INCREMENTING THE "voteCount" OF THE CANDIDATE CORRESPONDING TO THEIR CANDIDATE-NUMBER
        candidates[candidateNumber].voteCount++;
    }
    
    // THIS FUNCTION IS USED TO DISPLAY THE DETAILS OF THE CANDIDATE WITH MAXIMUM VOTES
    function getLeadingCandidate() view public returns(string memory){
        bool isTie = false;
        uint c_id = 1;
        int c_vote_count = candidates[c_id].voteCount;
        
        for(uint i=1; i<numberOfCandidates; i++){
            if(candidates[i].voteCount > c_vote_count){
                c_id = i;
                c_vote_count = candidates[i].voteCount;
            }
        }
        
        return candidates[c_id].candidateName;
    }
}
