pragma solidity 0.5.7;
pragma experimental ABIEncoderV2;

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

    function addUser (string memory _name) public {
        usersCount++;
        users[usersCount]=User(usersCount, _name);
        
    }

    function sendMessage (User memory _userFrom, User memory _userTo, string memory _message) public {
        uint idUserFrom = _userFrom.id; 
        uint idUserTo = _userTo.id; 
        require(
            idUserFrom > 0 &&
            idUserFrom <= usersCount &&
            idUserTo > 0 &&
            idUserTo <= usersCount);
            countMessages++;
            messanges[countMessages]=Messege(countMessages, _message, idUserFrom, idUserTo);
        
    }
}