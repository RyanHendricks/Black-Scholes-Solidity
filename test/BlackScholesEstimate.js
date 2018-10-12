const BlackScholesEstimate = artifacts.require('BlackScholesEstimate.sol');
const bs = require('black-scholes');



// **blackScholes(s, k, t, v, r, callPut)**
// - **s** - Current price of the underlying
// - **k** - Strike price
// - **t** - Time to expiration in years
// - **v** - Volatility as a decimal
// - **r** - Annual risk-free interest rate as a decimal
// - **callPut** - The type of option to be priced - "call" or "put"
// bs.blackScholes(30, 34, .25, .2, .08, "call"); // 0.23834902311961947
// bs.blackScholes(30, 34, .25, .2, .08, "put"); // 3.5651039155492974
// Usage:
// ```








const BN = require('bignumber.js');
const assert = require('chai').assert

function toReadable(num) {
  return web3.fromWei(new BN(num)).toNumber();
}

function daystodecimal(days) {
  return (days / 365);
}

function highPrecision(num) {
  return num * 1000000;
}

function originalPrecision(num) {
  return num / (1000000 * 100000 * 1000000);
}

contract('Black Scholes Estimation', function(accounts) {
  // let instance, token, init, fnl, buyer, seller;
  
  beforeEach(async () => {
    BSinstance = await BlackScholesEstimate.new();
  });

  describe('sqrt', async () => {
    it('should calculate correct square root',  async () => {
      let result = new BN(await BSinstance.sqrt(4)).toNumber();
      assert.equal(result, 2);
      let result2 = new BN(await BSinstance.sqrt(49)).toNumber();
      let result3 = new BN(await BSinstance.sqrt(144)).toNumber();
      let result4 = new BN(await BSinstance.sqrt(225)).toNumber();
      assert.equal(result2, 7, 'sqrt of 49 is 7');
      assert("sqrt of 49 is 7");
      assert.equal(result3, 12);
      assert.equal(result4, 15);

      console.log(result);
    });
    it('should not allow tokencontract to be set by addresses other than owner',  async () => {
      let vol = .90;
      let underlying = 50;
      let time = 1;
      let strike = underlying;
      let rf = 0.02

      let price = originalPrecision(await BSinstance.blackScholesEstimate(highPrecision(vol), highPrecision(underlying), highPrecision(daystodecimal(time)), {from: accounts[0]}));
      console.log(price);

      let precision = 0.1;

      let actualP = bs.blackScholes(underlying, strike, daystodecimal(time), vol, rf, "call").toFixed(4);
      let actualC = bs.blackScholes(underlying, strike, daystodecimal(time), vol, rf, "put").toFixed(4);
      console.log(actualP, actualC);
      // assert.isBelow(Math.abs(actualP - price), precision);
      console.log(actualP);
      // assert.isBelow(Math.abs(actualC - price), precision);
      diffP = actualP - price;
      diffC = actualC - price;
      console.log(`Black Scholes: ${price}`);
      console.log(`Deposit Amount: ${toReadable(approveAmount)}`);
      console.log(`Deposit Amount: ${toReadable(approveAmount)}`);

      
      assert.isTrue(Math.abs(diffP) < 0.01);
      assert.isTrue(Math.abs(diffC) < 0.01);

    });
    it('should allow the owner to set the tokencontract address',  async () => {
      // await ADTS.setTokenContract(StakeToken.address, { from: accounts[0] });
      // let tokencontract = await ADTS.tokenAddress({ from: accounts[0] });
      // assert.equal(StakeToken.address, tokencontract);
    });
  });

  describe('Token Deposit to ADTS', async function() {
    it('should allow token deposit', async () => {
      // let tokenAddress =  StakeToken.address;
      // await ADTS.setTokenContract(tokenAddress, { from: accounts[0] });
      // await StakeToken.approve(ADTS.address, 1000000000000000000, { from: accounts[0] });
      // await ADTS.makeDeposit({ from: accounts[0] });

      // let balance = await ADTS.getUserTokenBalance(accounts[0], { from: accounts[0]});
      // assert.equal(toReadable(balance), 1);
    });

    it('should show equal token balance when calling token contract and ADTS method',  async () => {
      // let tokenAddress =  StakeToken.address;
      // await ADTS.setTokenContract(tokenAddress, { from: accounts[0] });
      // await StakeToken.approve(ADTS.address, 1000000000000000000, { from: accounts[0] });
      // await ADTS.makeDeposit({ from: accounts[0] });

      // let balance = await ADTS.getUserTokenBalance(accounts[0], { from: accounts[0]});
      // let bal1 = await StakeToken.balanceOf(accounts[0], { from: accounts[0] });
      // let bal2 = await StakeToken.balanceOf(ADTS.address, { from: accounts[0] });
      // assert.equal(bal2.valueOf(), balance.valueOf());
    });
  });


  

});
