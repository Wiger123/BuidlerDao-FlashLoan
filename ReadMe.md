# Buidler DAO 系列课程: 闪电贷基础
- 主讲人: Wiger
- 代码编写: Soth
- 教研助理: 菠菜菠菜!
- 助教: Niel

## Kovan 水龙头
- Kovan Link: https://faucets.chain.link/
- Kovan: https://gitter.im/kovan-testnet/faucet

## 学习资料
1. 闪电贷源码: https://github.com/Wiger123/BuidlerDao-FlashLoan
2. 经典攻击复现: https://github.com/Rivaill/CryptoVulhub
3. 闪电贷套利: https://github.com/paco0x/amm-arbitrageur
4. Uniswap 学习资料

## Basic Demo
1. PPT 讲解
2. Basic Demo: 写 => 编译 => 输入构造函数 0x506B0B2CF20FAA8f38a4E2B524EE43e1f4458Cc5 部署 => 验证合约 000000000000000000000000506b0b2cf20faa8f38a4e2b524ee43e1f4458cc5
3. Kovan Etherscan 调用: https://kovan.etherscan.io/address/0xbAECCE8aC87fd22e93f682565B392B029071bd61
4. 提前传入 DAI / AAVE / ... 作为手续费
5. 输入参数: 0xFf795577d9AC8bD7D90Ee22b6C1703490b6512FD 1000000000000000000000
6. 完成闪电贷 Basic Demo

## Pro Demo
1. TokenA: 0xdcD910430D64E00207D7B6aC0f3F7458F7464581; TokenB: 0x6DC4FD9335eF0F5fe10Db08D0dea8426808B087F
2. 建立 3 个池子: DAI - Token1, Token1 - Token2, Token2 - DAI
3. DAI => TokenA => TokenB
4. 授权 => 交易
5. 还钱 => 转移利润
6. Kovan Etherscan 调用: https://kovan.etherscan.io/address/0x87288733ef6f556d22221ee05734e454daac38e4
5. 输入参数: 0xFf795577d9AC8bD7D90Ee22b6C1703490b6512FD 1000000000000000000000
6. 完成闪电贷 Pro Demo

## 地址
1. DAI 合约地址
address public dai = 0xFf795577d9AC8bD7D90Ee22b6C1703490b6512FD;
2. TokenA 合约地址
address public tokenA = 0xdcD910430D64E00207D7B6aC0f3F7458F7464581;
3. TokenB 合约地址
address public tokenB = 0x6DC4FD9335eF0F5fe10Db08D0dea8426808B087F;
4. Uniswap V2 路由地址
address public router = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;