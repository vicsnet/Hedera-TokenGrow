// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../lib/openzeppelin-contracts/contracts/utils/Counters.sol";

contract NFTToken is ERC721, ERC721URIStorage {
    // using Counters for Counters.Counter;

    // Counters.Counter private _tokenIdCounter;
    uint _tokenIdCounter;
    constructor(
        string memory _tokenName,
        string memory _tokenSymbol
    ) ERC721(_tokenName, _tokenSymbol) {}

    function mintNFT(address _to, string memory _uri) public {
        if (msg.sender != _to) revert();
        uint256 tokenId = _tokenIdCounter;
        _safeMint(_to, tokenId);
        _setTokenURI(tokenId, _uri);
        _tokenIdCounter +=1;
    }
    

    function _burn(
        uint256 tokenId
    ) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(
        uint256 tokenId
    ) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
