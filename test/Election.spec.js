const assert = require('assert');

const Election = artifacts.require('Election');

const BN = web3.utils.BN;

contract('Election', function(accounts) {
    let electionInstance;

    before(async () => {
        electionInstance = await Election.deployed();
    });

    user1 = addUser(Ilya);
    user2 = addUser(Artem);
    message = 'I <3 Artem Bekhtin';
    result = sendMessage(user1, user2, message);
})