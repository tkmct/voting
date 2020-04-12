pragma solidity >=0.6.0 <0.7.0;
pragma experimental ABIEncoderV2;


contract Voting {
    string public title;
    uint256 public optionCount;
    uint256[] public result;
    mapping(address => bool) public voted;

    event Voted(address from, uint256 optionIndex);

    constructor(string memory _title, uint256 _optionCount) public {
        require(_optionCount < 10, "Option count must be less than 10");
        title = _title;
        optionCount = _optionCount;

        for (uint256 i = 0; i < _optionCount; i++) {
            result.push(0);
        }
    }

    modifier onlyOnce() {
        require(!voted[msg.sender], "You cannot vote multiple time");
        _;
    }

    function vote(uint256 _optionIndex) public {
        require(_optionIndex < optionCount, "Invalid option index");
        result[_optionIndex] += 1;
    }
}
