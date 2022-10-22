pragma solidity 0.5.7;

contract Election {
    
    // Model a Messege 
    struct Messege{
        uint idMessage;
        string text;
        uint userFrom;
        uint userTo;
        
    }
    mapping(uint => Messege) public messanges;
    // Model a User
    struct User {
        uint id;
        string name;
        uint countMessages;
    }

    // Read/write users
    mapping(uint => User) public users;
    

    // Store Users Count
    uint public usersCount=0;
    uint public countMessages=0;
    constructor () public {
        //set default users
        addUser('1');
        addUser('2');
    }

    function addUser (string memory _name) private {
        usersCount++;
        users[usersCount]=User(usersCount, _name, 0);
        
    }

    function sendMessage (uint _userFrom, uint _userTo, string memory _message) public {
        require(
            _userFrom > 0 &&
            _userFrom <= usersCount &&
            _userTo > 0 &&
            _userTo <= usersCount);
            countMessages++;
            messanges[countMessages]=Messege(countMessages, _message, _userFrom, _userTo);
        
    }
}