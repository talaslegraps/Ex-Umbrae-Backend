pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// We need to import the helper functions from the contract that we copy/pasted.

contract MyEpicNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    event NewEpicNFTMinted(address sender, uint256 tokenId);

    string[] wizardUri = [
        "https://ipfs.io/ipfs/QmRwGiYT4K5BrhGWgSRcNbiyD7rdSa7RstPGLFaLexRttx",
        "https://ipfs.io/ipfs/QmcKJm6Adu7KvTFQuEmNDDU7C6ihMnRoUYGjdGj1vhhKhH",
        "https://ipfs.io/ipfs/QmU1XGNzrbi1r9EaoKTpvnGZX344JMcNHif4CbX7BCztfJ",
        "https://ipfs.io/ipfs/QmXU1mfHhasUrrHdD72hjWKnheg8WsL5MnNLFYt9MRhWFL"
    ];
    string[] warlockUri = [
        "https://ipfs.io/ipfs/QmSo1akJJ8ZrziGhbL9PyUtLG5F3L3G8gyaZeKWEEQ2i4a",
        "https://ipfs.io/ipfs/QmQmP7c17MF7uxcF8z5C1978svmSuBBmrVeDA9AAxbpbsi",
        "https://ipfs.io/ipfs/QmVJLXELHMXvuWgN2xEprpBQX7npf56JiF6e3vFEd7aHQX"
    ];
    string[] necromancerUri = [
        "https://ipfs.io/ipfs/QmeQMPuRDXohjfwg4cmZcTh6kZNzSg5BWoMiLPsYH9e7Rr",
        "https://ipfs.io/ipfs/QmWBJQvUuUovH5zc2h1M32BtkxBonWzDtUwWBNSyz5GoTj",
        "https://ipfs.io/ipfs/QmeSrGhCAnLQdgLZ9f4gDVFysE9YEafYzY9tZtufk9Q3fj",
        "https://ipfs.io/ipfs/QmPbFaT8qMLtxwRCDJ4KVz8HaZvFGVQgJBCHJKTCMmYt97"
    ];

    constructor() ERC721("ExUmbrae", "EXUM") {
        console.log("EXUM cards contract constructed.");
    }

    function makeWizardNFT() public {
        uint256 newItemId = _tokenIds.current();

        string memory finalTokenUri = wizardUri[newItemId % 4];

        console.log("\n--------------------");
        console.log(finalTokenUri);
        console.log("--------------------\n");

        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, finalTokenUri);

        _tokenIds.increment();
        console.log(
            "A wizard NFT w/ ID %s has been minted to %s",
            newItemId,
            msg.sender
        );

        emit NewEpicNFTMinted(msg.sender, newItemId);
    }

    function makeWarlockNFT() public {
        uint256 newItemId = _tokenIds.current();

        string memory finalTokenUri = warlockUri[newItemId % 3];

        console.log("\n--------------------");
        console.log(finalTokenUri);
        console.log("--------------------\n");

        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, finalTokenUri);

        _tokenIds.increment();
        console.log(
            "A warlock NFT w/ ID %s has been minted to %s",
            newItemId,
            msg.sender
        );

        emit NewEpicNFTMinted(msg.sender, newItemId);
    }

    function makeNecromancerNFT() public {
        uint256 newItemId = _tokenIds.current();

        string memory finalTokenUri = necromancerUri[newItemId % 4];

        console.log("\n--------------------");
        console.log(finalTokenUri);
        console.log("--------------------\n");

        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, finalTokenUri);

        _tokenIds.increment();
        console.log(
            "A necromancer NFT w/ ID %s has been minted to %s",
            newItemId,
            msg.sender
        );

        emit NewEpicNFTMinted(msg.sender, newItemId);
    }
}
