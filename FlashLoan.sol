// Solidity 版本
pragma solidity ^0.6.6;

// 导入依赖
import "./FlashLoanReceiverBase.sol";
import "./ILendingPoolAddressesProvider.sol";
import "./ILendingPool.sol";

/**
    contract:
        FlashloanV1:
            闪电贷合约
            继承名为 FlashLoanReceiverBaseV1 的抽象合约
            它提供了必要的实现细节
            如闪电贷的偿还
**/
contract FlashloanV1 is FlashLoanReceiverBaseV1 {
    // AAVE 中 DAI 借贷池的地址
    constructor(address _addressProvider) FlashLoanReceiverBaseV1(_addressProvider) public{}

    /**
        function:
            flashloan: 执行闪电贷
        params:
            _asset: 闪电贷的资产池子地址, 本例子中为: DAI
            amount: 贷款总金额
        visibility:
            public: 通过内部, 或者消息来进行调用
            onlyOwner: 仅合约持有者可调用
    **/
    function flashloan(address _asset, uint amount) public onlyOwner {
        // 本次不需要任何闪电贷的数据, 传递一个空字符串
        bytes memory data = "";
        // 通过 Aave 提供的 ILendingPoolV1 初始化 LendingPool 接口, 调用 flashLoan 函数
        ILendingPoolV1 lendingPool = ILendingPoolV1(addressesProvider.getLendingPool());
        // 调用 flashLoan 函数
        /** params:
            _receiver: 接收贷款的地址, 此处为当前合约地址
            _reserve: 传递资产地址, 此处为 Kovan 中 DAI 地址
            _amount: 借款金额, 此处为 1 DAI
            _params: 可调用参数, 此处为空数据
        **/
        lendingPool.flashLoan(address(this), _asset, amount, data);
    }

  
    /**
        function:
            executeOperation: 执行借款
        params:
            _reserve: 所借代币的合约地址
            _amount: 借款金额
            _fee: 偿还利息
            _params: 可调用参数
        returns:
            allBalance: 可借贷金额上限
    **/
    function executeOperation(
        address _reserve,
        uint256 _amount,
        uint256 _fee,
        bytes calldata _params
    )
        external
        override
    {
        // 检查由池子可向本地址借贷的代币上限, 若小于目标贷款金额, 提示错误
        require(_amount <= getBalanceInternal(address(this), _reserve), "[错误提示] 目标池子余额不足, 无法进行借贷");

        /**
            借贷逻辑核心函数
        **/

        // 总贷款金额加入偿还利息
        uint totalDebt = _amount.add(_fee);
        // 归还总贷款金额
        transferFundsBackToPoolInternal(_reserve, totalDebt);
    }

}
