pragma solidity ^0.4.23;


contract BlackScholesEstimate {
    
    function sqrt(uint256 x) public pure returns (uint256) {
        uint256 c = (x + 1) / 2;
        uint256 b = x;
        while (c < b) {
            b = c;
            c = (x / c + c) / 2;
        }
        return b;
    }
    
    function blackScholesEstimate(
        uint256 _vol,
        uint256 _underlying,
        uint256 _time
    ) public pure returns (uint256 estimate) {
    
        estimate = 40 * _vol * _underlying * sqrt(_time);
        return estimate;
    }
    
}