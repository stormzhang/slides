# 当我们谈论测试时我们谈论什么

author: 马陆骋&lt;malucheng@boohee.com&gt;

## 目录

-   为什么要(写)测试(代码)
-   测试的方式(TDD)
-   常用工具
-   小贴士
-   用户故事
-   demo

## Why

省略100万字

### 只说一点想法

- 写测试可以保证你\*没错\*, 不能证明你是\*对的\*
- 写测试代码可以适当的写重复代码, 不必死扣 DRY
- 测试代码要起到文档的作用(不会过时的文档)
- 事后补写测试是很难的, 最好还是 TDD


## the rails way

<http://guides.rubyonrails.org/testing.html>

-   单元测试(model)
-   功能测试(controller)
-   集成测试(integration)

## TDD

Test Driven Development

先写测试, 再写实现

### Red-Green-Refactor

红 绿 重构

![](../assets/images/talk-about-test/redgreenrefacor.png)

### 每次都做最简实现

对我影响极大的一套视频

嘉宾 Daniel Teng 是 Scrum 联盟第 28 位认证 Scrum 教练

<http://railscasts-china.com/episodes/two-daniel-pair-live-show>

<http://railscasts-china.com/episodes/two-daniel-pair-live-show2>

<http://railscasts-china.com/episodes/two-daniel-pair-live-show3>

## Tools

-   minitest
-   factorygirl
-   guard
-   cucumber

### minitest

ruby 2.0 之后的默认测试框架, 与 rails 无缝集成

直接调用

    bin/rake test

如果想执行单个测试文件, 只要

    ruby -Itest test/controllers/api/v1/processions_controller_test.rb

要具体到某个方法, 也行

    ruby -Itest test/controllers/api/v1/processions_controller_test.rb -n /full/

### factorygirl

一个制造假数据的 gem

### guard

一个监控变动的工具, 一般配合插件 `guard-minitest` 来自动运行测试

## Tips

### 修复 bug 时首先写测试

-   编写测试模拟 bug 出现情况, 并断言希望的结果
-   修改业务逻辑代码, 使测试通过
-   确保其他已有测试不受影响
-   重构

### 编写测试可以理清思路

-   如果发现一段逻辑很难测试, 那说明代码本身耦合度太高
-   分解代码逻辑, 得到更小的逻辑模块
-   为每个小模块编写测试
-   整合使之运行

### 模拟网络请求

-   大部分外部 API 调用都应该 stub 或 mock
-   如果需要可以专门写一个测试并使用环境变量来启动真实测试

### 使用 Benchmark

用的不多, 一般用于相对的性能测试

### 测试模型时先测 factory girl 的合法性

```ruby
setup do
  @broadcast = build(:broadcast)
end

test "factory girl is valid" do
  assert @broadcast.valid?
end
```

## Cucumber

我认为这是对业务逻辑的一种测试

<http://huoliguo.farbox.com/post/2015-06-05>

## 参考项目

<https://git.boohee.cn/ruby/care>

    +------------------+-------+-------+---------+---------+-----+-------+
    | Name             | Lines |   LOC | Classes | Methods | M/C | LOC/M |
    +------------------+-------+-------+---------+---------+-----+-------+
    | Controllers      |  1134 |   963 |      23 |      86 |   3 |     9 |
    | Helpers          |     2 |     2 |       0 |       0 |   0 |     0 |
    | Jobs             |    33 |    30 |       3 |       3 |   1 |     8 |
    | Models           |   998 |   749 |      38 |      69 |   1 |     8 |
    | Javascripts      |    20 |     0 |       0 |       0 |   0 |     0 |
    | Controller tests |  1718 |  1413 |      21 |       2 |   0 |   704 |
    | Model tests      |   790 |   562 |      37 |       0 |   0 |     0 |
    | Job tests        |   140 |   117 |       2 |       0 |   0 |     0 |
    | Cucumber features|   144 |    79 |       0 |       0 |   0 |     0 |
    +------------------+-------+-------+---------+---------+-----+-------+
    | Total            |  4979 |  3915 |     124 |     160 |   1 |    22 |
    +------------------+-------+-------+---------+---------+-----+-------+
      Code LOC: 1744     Test LOC: 2171     Code to Test Ratio: 1:1.2


## Thanks

Questions?
