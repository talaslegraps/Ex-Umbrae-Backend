const main = async () => {
  const nftContractFactory = await hre.ethers.getContractFactory("MyEpicNFT");
  const nftContract = await nftContractFactory.deploy();
  await nftContract.deployed();
  console.log("Contract deployed to:", nftContract.address);

  // Call the function.
  let txnWizard = await nftContract.makeWizardNFT();
  // Wait for it to be mined.
  await txnWizard.wait();
  console.log("Minted Wizard NFT");

  let txnWarlock = await nftContract.makeWarlockNFT();
  await txnWarlock.wait();
  console.log("Minted Warlock NFT");

  let txnNecro = await nftContract.makeNecromancerNFT();
  await txnNecro.wait();
  console.log("Minted Necromancer NFT");
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();
