// SPDX-License-Identifier: MIT

pragma solidity >=0.8.9 <0.9.0;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface IERC20 {
    function burn(address user, uint256 amount) external;

    function balanceOf(address user) external view returns (uint256);

    function transferFrom(address from, address to, uint256 amount) external returns(bool);
    
    function transfer(address to, uint256 amount) external returns (bool);
}

contract poker is Ownable {  // Ownable is for only onwer.
    using SafeMath for uint256;  // for a.add(b) : a=a+b;

    IERC721 public PokerNFT; // for using nft or get nft.
    IERC20 public Atomotos;
    address public payableAddress;
    mapping(address => uint256) public PlayerList;


    constructor(address _atomotos, address PokerNFT) {
        Atomotos = IERC20(_atomotos);
        payableAddress = msg.sender;
    }

    function setPayableAddress(address _address) onlyOwner public {
        payableAddress = _address;
    }

    function transferAtomotos(uint256 amount) public {
        Atomotos.transferFrom(msg.sender, payableAddress, amount); //msg.sender is user who run that function.
        // transfer is send.. transferFrom is give 
    }

    function sendToWinner() public {
        require (PlayerList[msg.sender] > 0, "You can't get money.");
        Atomotos.transferFrom(payableAddress, msg.sender, PlayerList[msg.sender]);
        PlayerList[msg.sender] = 0;
        // Atomotos.transfer(msg.sender, PlayerList[msg.sender]);
    }

    function setPlayerAmount(address playerAddress, uint256 amount) onlyOwner public { // view is no gas.
        PlayerList[playerAddress] = PlayerList[playerAddress].add(amount);
    }
}