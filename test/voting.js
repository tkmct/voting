const Voting = artifacts.require('./Voting.sol')

contract('Voting', accounts => {
  it('should have 1 of result for themeId 1.', async () => {
    const votingInstance = await Voting.deployed()

    const themeId = web3.utils.asciiToHex('1')

    await votingInstance.vote(themeId, 0, { from: accounts[0] })
    const result = await votingInstance.results(themeId, 0)

    assert.equal(result, 1, 'result value is invalid')
  })
})
