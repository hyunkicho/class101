pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
 
contract MyToken is ERC20, Ownable {
   constructor() ERC20("LambdaToken", "LMT") {
   }
   function mint(uint256 amount) public onlyOwner{
       _mint(_msgSender(),amount);
   }
}
