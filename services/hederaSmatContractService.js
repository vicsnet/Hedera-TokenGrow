import { ContractCreateFlow, Client, ContractFunctionParameters} from '@hashgraph/sdk';

/*
 * Stores the bytecode and deploys the contract to the Hedera network.
 * Return an array with the contractId and contract solidity address.
 * 
 * Note: This single call handles what FileCreateTransaction(), FileAppendTransaction() and
 * ContractCreateTransaction() classes do. 
*/
export const deployContract = async (client, bytecode, gasLimit) => {

    // Set the timeout duration in milliseconds
  //   const timeoutMs = 5000; // Example: 5 seconds

  //   // Configure the timeout on the client's operator account
  // client.setOperator({ timeout: timeoutMs });


    const contractCreateFlowTxn = new ContractCreateFlow()
      .setBytecode(bytecode)
      .setGas(gasLimit)
      .setConstructorParameters(new ContractFunctionParameters().addString("TokenGrowTrack").addString("TGT").addAddress('0x0000000000000000000000000000000000e46cdf').addAddress('0x0000000000000000000000000000000000e46eea'));
  
    console.log(`- Deploying smart contract to Hedera network`)
    const txnResponse = await contractCreateFlowTxn.execute(client);
  
    const txnReceipt = await txnResponse.getReceipt(client);
    const contractId = txnReceipt.contractId;
    if (contractId === null ) { throw new Error("Somehow contractId is null.");}
  
    const contractSolidityAddress = contractId.toSolidityAddress();
  
    console.log(`- The smart contract Id is ${contractId}`);
    console.log(`- The smart contract Id in Solidity format is ${contractSolidityAddress}\n`);
  
    return [contractId, contractSolidityAddress];
  }