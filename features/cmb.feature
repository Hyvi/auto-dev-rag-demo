Feature: 银行现金管理

  Scenario: 财务经理设定新的支付限额
    Given 财务经理已登录到银行现金管理系统并选择了一个尚未设定支付限额的成员单位账户
    When 财务经理输入了新的支付限额并提交
    Then 系统接受新的支付限额并显示成功的确认消息，同时更新账户的支付限额

  Scenario: 财务经理查看支付限额建议
    Given 财务经理已登录到银行现金管理系统并选择了一个尚未设定支付限额的成员单位账户
    When 财务经理尝试设定支付限额
    Then 系统自动计算并显示建议的支付限额

  Scenario: 财务经理尝试支付超过设定限额的金额
    Given 财务经理已登录到银行现金管理系统并选择了一个已设定支付限额的成员单位账户，尝试支付超过设定限额的金额
    When 财务经理提交支付请求
    Then 系统拒绝支付请求并显示一个警告消息，指出支付金额超过了设定的支付限额

  Scenario: 财务经理尝试设定不存在的成员单位账户的支付限额
    Given 财务经理已登录到银行现金管理系统
    When 财务经理选择一个不存在的成员单位账户并尝试设定支付限额
    Then 系统拒绝设定支付限额并显示一个错误消息，指出所选的成员单位账户不存在

  Scenario: 财务经理尝试设定一个无效的支付限额
    Given 财务经理已登录到银行现金管理系统并选择了一个成员单位账户
    When 财务经理输入了一个无效的支付限额（例如非数字、负数等）并尝试提交
    Then 系统拒绝设定支付限额并显示一个错误消息，指出支付限额必须是有效的数值

  Scenario: 财务经理尝试设定超过账户余额的支付限额
    Given 财务经理已登录到银行现金管理系统并选择了一个成员单位账户，账户余额为X元
    When 财务经理输入了一个大于X元的支付限额并尝试提交
    Then 系统拒绝设定支付限额并显示一个错误消息，指出支付限额不能超过账户的余额

  Scenario: 网络异常
    Given 财务经理已登录到银行现金管理系统并选择了一个成员单位账户
    When 在设定支付限额时发生网络异常
    Then 系统显示一个错误消息，指出网络异常，让用户稍后再试

  Scenario: 后端服务异常
    Given 财务经理已登录到银行现金管理系统并选择了一个成员单位账户
    When 在设定支付限额时后端服务异常
    Then 系统显示一个错误消息，指出服务暂时不可用，让用户稍后再试

  Scenario: 数据库异常
    Given 财务经理已登录到银行现金管理系统并选择了一个成员单位账户
    When 在设定支付限额时数据库异常
    Then 系统显示一个错误消息，指出数据异常，让用户稍后再试