const BlackScholesEstimate = artifacts.require('BlackScholesEstimate.sol');
const bs = require('black-scholes');
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
      // console.log(result);
    });
    it('should estimate black-scholes price within 1 penny',  async () => {
      let vol = .90;
      let underlying = 50;
      let time = 1;
      let strike = underlying;
      let rf = 0.02

      let price = originalPrecision(await BSinstance.blackScholesEstimate(highPrecision(vol), highPrecision(underlying), highPrecision(daystodecimal(time)), {from: accounts[0]}));
      // console.log(price);

      let actualP = bs.blackScholes(underlying, strike, daystodecimal(time), vol, rf, "call").toFixed(4);
      let actualC = bs.blackScholes(underlying, strike, daystodecimal(time), vol, rf, "put").toFixed(4);
      // console.log(actualP, actualC);
      // console.log(actualP);

      diffP = actualP - price;
      diffC = actualC - price;
      console.log(`Black Scholes: ${price}`);
      console.log(`Estimated ATM Put: ${(actualP)}`);
      console.log(`Difference: ${(diffP)}`);
      console.log(`Estimated ATM Call: ${(actualC)}`);
      console.log(`Difference: ${(diffC)}`);
      
      assert.isTrue(Math.abs(diffP) < 0.01);
      assert.isTrue(Math.abs(diffC) < 0.01);

    });
  });

});
