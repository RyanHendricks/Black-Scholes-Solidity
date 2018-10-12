pragma solidity ^0.4.23;



contract StakeSwap {


//     address public maker;
//     address public taker;

//     uint256 public escrowBalance;

//     mapping(address => uint256) public marginBalance;
    

//     function setMaker(address _maker) public {
//         maker = _maker;
//     }
//     function setTaker(address _taker) public {
//         maker = _taker;
//     }


//     /// economic terms of swap agreement

//     /// termination terms


//     /// settlement procedures

//     /// add margin
//     function marginDeposit() public payable {
//         address _user = msg.sender;

//         require(_user == maker || _user == taker, "only maker or taker can deposit margin");
//         require(msg.value > 0, "no funds were sent with deposit function call");

//         if (_user == maker) {
//             marginBalance[maker] = marginBalance[maker] + msg.value;
//         }

//         if (_user == taker) {
//             marginBalance[taker] = marginBalance[taker] + msg.value;
//         }
        
//     }

//     function getMarginBalances() public returns {
        
//     }

//     /// withdraw margin

//     /// remargin

//     /// terminate contract

}