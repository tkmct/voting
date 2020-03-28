pragma solidity >=0.4.21 <0.7.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Voting.sol";

contract TestVoting {
    function testNewTheme() public {
        Voting voting = Voting(DeployedAddresses.Voting());
        uint256 themeId = voting.createTheme(
            "test voting theme",
            "this is a test theme",
            "A,B,C",
            100
        );

        (uint256 id, string memory title, string memory description, string memory options, uint256 finishAt) = voting
            .themes(themeId);
        Voting.Theme memory theme = Voting.Theme(
            id,
            title,
            description,
            options,
            finishAt
        );

        Assert.equal(theme.id, themeId, "A theme is created with an id");
    }

}
