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

  it('successfully vote for an option', async () => {
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
    await votingInstance.vote(0, 0, {
      from: accounts[0]
    })

    const result = await votingInstance.results(0, 0)

    assert.equal(result, 1, 'result should be incremented')
  })
})
