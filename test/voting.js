const Voting = artifacts.require('./Voting.sol')

contract('Voting', accounts => {
  let votingInstance

  beforeEach(async () => {
    votingInstance = await Voting.new("test", 3, {from: accounts[0], gas: 1000000});
  })

  it('cannot deploy with more than 10 options', async () => {
    try {
      await Voting.new("test", 11, {from: accounts[0], gas: 1000000});
      assert(false, 'cannot deploy with more than 10 options')
    } catch (e) {
      assert(true)
    }
  })

  it('successfully vote for an option', async () => {
    await votingInstance.vote(1, { from: accounts[0] })
    const result = await votingInstance.result(1)
    assert.equal(result, 1, 'result should be incremented')
  })

  it('cannot vote multiple times', async () => {
    await votingInstance.vote(1, { from: accounts[0], })
    try {
      await votingInstance.vote(1, { from: accounts[0], })
      assert(false, "Second voting must be reverted")
    } catch (e) {
      assert(true)
    }
  })
})
