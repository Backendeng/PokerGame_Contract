pragma solidity >=0.8.9 <0.9.0;
import "@openzeppelin/contracts/access/Ownable.sol";   //for usein onlyOwner
import "@openzeppelin/contracts/utils/math/SafeMath.sol"; // for a=a+b, a.add(b). why do I use. because security
import "@openzeppelin/contracts/token/ERC721/IERC721.sol"; // for GET NFT


interface IERC20 {  // interface same like header in C.

    function burn(address user, uint256 amount) external;

    function balanceOf(address user) external view returns (uint256);  // Get value in address

    function transferFrom(address from, address to, uint256 amount) external returns(bool);  // send "amount" money from 1 parameter to 2 parameter 
    
    function transfer(address to, uint256 amount) external returns (bool); // send Money from "this contract" to "to"
}


contract poker is Ownable {  // why onable . because use for onlyonwer.

    ERC20 public Atomotos;
    address public payableAddress; // owner wallet

    constructor(address _atomotos, address PokerNFT) {
        Atomotos = IERC20(_atomotos);
        payableAddress = msg.sender;
    }

    function transferAtomotos(uint256 _address) public {
        Atomotos.transferFrom(msg.sender, payableAddress, amount); // msg.sender is user who run that function
        // transfer is send.. transferFrom is give.
    }
}