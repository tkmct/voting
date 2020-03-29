pragma solidity >=0.4.21 <0.7.0;
pragma experimental ABIEncoderV2;

contract Voting {
    struct Theme {
        uint256 id;
        string title;
        string description;
        string options; // option is comma separated string
        uint256 finishAt;
    }

    uint256 private themeCount;
    mapping(uint256 => Theme) public themes;
    mapping(uint256 => mapping(uint256 => uint256)) public results;

    // mapping to store which option users voted for
    // mapping(bytes32 => mapping(address => uint256)) votings;

    // TODO: write createTheme method
    function createTheme(
        string memory title,
        string memory description,
        string memory options,
        uint256 finishAt
    ) public returns (uint256) {
        uint256 id = themeCount;

        Theme memory theme = Theme(id, title, description, options, finishAt);

        themes[id] = theme;
        themeCount += 1;
        return id;
    }

    /**
    * vote method
    * user can vote with given
    */
    function vote(uint256 themeId, uint256 optionIndex) public {
        // TODO: assert if given option is in theme's options
        results[themeId][optionIndex] += 1;
    }
}

/**
one user can vote only once
restrict user who can create new theme
*/

