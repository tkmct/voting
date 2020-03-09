pragma solidity >=0.4.21 <0.7.0;
pragma experimental ABIEncoderV2;

contract Voting {
    // Data structure
    struct Period {
        uint256 start;
        uint256 end;
    }

    struct Theme {
        bytes32 id;
        string title;
        string description;
        string[] options;
        Period period;
    }

    Theme[] public themes;

    mapping(bytes32 => uint256[]) public results;

    // mapping to store which option users voted for
    // mapping(bytes32 => mapping(address => uint256)) votings;

    // TODO: write createTheme method
    // function createTheme() public {
    //     Theme memory theme = Theme();
    //     themes.push(theme);
    // }

    /**
    * vote method
    * user can vote with given
    */
    function vote(bytes32 themeId, uint256 optionIndex) public {
        // TODO: assert if given option is in theme's options
        results[themeId][optionIndex] += 1;
    }
}

/**
one user can vote only once
restrict user who can create new theme
*/

