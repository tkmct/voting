pragma solidity >=0.4.21 <0.7.0;

contract Voting {
    struct Theme {
        bytes32 id;
        string title;
    }

    Theme[] themes;
    mapping(bytes32 => uint256) public results;

    function vote(bytes32 themeId) public {
        results[themeId] += 1;
    }
}
