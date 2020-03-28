const Voting = artifacts.require('./Voting.sol')

contract('Voting', accounts => {
  it('should create new theme', async () => {
    const votingInstance = await Voting.deployed()
    await votingInstance.createTheme(
      "test voting theme",
      "this is a test theme",
      "A,B,C",
      100,
      {
        from: accounts[0]
      }
    )

    const theme = await votingInstance.themes(0)

    assert.equal(theme.id, 0, 'theme is created')
  })
})
