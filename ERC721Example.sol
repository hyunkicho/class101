pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol";
 
contract TestERC is ERC721URIStorage, Ownable { //오픈제플린 라이브러리의 컨트렉트 상속
   using Strings for uint256;
   string private baseURI;
 
   constructor(string memory name_, string memory symbol_, string memory baseURI_)
   ERC721(name_, symbol_)
   {
       setBaseURI(baseURI_);
   }
 
   function setBaseURI(string memory baseURI_) public onlyOwner {
       baseURI = baseURI_;
   }
 
   function _baseURI() internal view virtual override returns (string memory) {
       return baseURI;
   }
 
   function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
       require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
       return bytes(_baseURI()).length > 0 ? string(abi.encodePacked(_baseURI(), tokenId.toString())) : "";
   }
 
   function mint(address to, uint256 tokenId) public onlyOwner{
       _mint(to,tokenId);
       _setTokenURI(tokenId,tokenURI(tokenId));
   }

  function burn(uint256 tokenId) public {
       _burn(tokenId);
   }
 
}