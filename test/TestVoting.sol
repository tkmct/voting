pragma solidity >=0.4.21 <0.7.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Voting.sol";

contract TestVoting {
    function testNewTheme() public {
        Voting voting = Voting(DeployedAddresses.Voting());

        voting.vote("1", 0);

        uint256 expected = 1;
        Assert.equal(
            voting.results("1", 0),
            expected,
            "Voting result of id 1 should be 1"
        );
    }

}
