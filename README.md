# Black Scholes Solidity

Highly accurate estimation of the Black-Scholes model prices for ATM options calculated on-chain

## Black-Scholes Model Estimation

The price for an option contract is a factor of the volatility of the underlying asset. One common model for determining the price is the Black-Scholes model, also known as the Black-Scholes-Merton model. Although it has some inaccuracies and drawbacks when used in real world scenarios it remains one of the most commonly used methods for pricing option contracts.

## Potential Uses

- On-chain price quotations for derivative contracts.
- Self-hedging synthetic positions.
- Volatility-adjusted transaction volume.

## Planned Improvements

- Precision handled by the contract rather than passed to the contract
- The goal here is to ultimately be able to calculate the price for options other than those ATM.
- Implementation of self-pricing mechanism based on logged historical prices
- SafeMath integration
- Gas Optimizations

## Getting Started

```bash
npm install

truffle develop

# once console loads:
> test
```

## Issues & Contributing

There are likely better ways to accomplish the goals of this project. Feel free to open an issue for any bugs that you may encounter or any suggestions you might desire to share.

## Final Thoughts

We as an industry have only begun to scratch the surface of blockchain implementations of financial derivatives. The problem which has hindered most assets up to this point is the ability to have on-chain pricing data that is also decentralized/trusted. Derivatives offer the possibility of removing the this necessity due to their inherent nature and relationship to an underlying asset. 