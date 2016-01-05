# 那些年我们用过的 Rake

author: 马陆骋&lt;malucheng@boohee.com&gt;

## 目录

-   什么是 Rake
-   Rake 的常见用途
-   无处不在的 Rake
-   一些简单的例子
-   编写 Rake Task 的技巧
-   Rake in Action
-   小贴士

## 什么是 Rake

Rake 是一个 ruby 版的 make。

make 是一个 c 语言的构建工具。

所以说 Rake 是一个 ruby 编写的构建工具。

-   Rake 是一个 Ruby 的内部 DSL 哦\~
-   这意味着在 Rake 中可以编写任意的 Ruby 代码

## Rake 的常见用途

-   自动化脚本
-   文件处理
-   程序入口

## 无处不在的 Rake

-   rails \[route, db, assets, custom task\]
-   octopress \[new post, build, deploy\]
-   almost all the ruby projects can be tested by rake test

## 一些简单的例子

![栗子](../assets/images/rake-is-the-apple-of-my-eye/example.jpg)

### 清理临时文件

```ruby
desc 'Clean emacs backup files *~'
task :clean_emacs_backup do
  puts "Clean emacs backup files *~"
  files = Dir['*~']
  rm(files)
end
```

### 启动一个 web server

```ruby
desc 'start simple http server'
task :http_server do
  require 'webrick'
  WEBrick::HTTPServer.new(:Port=>8989,:DocumentRoot=>".").start
end

```

### 生成一个 licence 文件
```ruby
require 'date'
require 'erb'
namespace :licence do
  desc 'Generate Licences'
  task :mit do
    name = "Ma Lucheng"
    year = Date.today.year
    file = File.join(File.dirname(__FILE__), 'templates', 'mit.erb')
    erb = File.open(file).read
    content = ERB.new(erb).result(binding)
    File.open('LICENSE.md', 'w') { |file| file.write(content) }
  end
end
```

### 根据 org 文件生成 slide

略...

### 转化 API 文档

```ruby
file 'bingo/course_blueprint.html' => 'bingo/course_blueprint.md' do
  `aglio -i bingo/course_blueprint.md -o bingo/v2course_blueprint.html`
end
```

## 编写 Rake Task 的技巧

### 小步前进

一次只定义一个任务，然后把它们串联起来

### 使用命名空间

更好的组织形式

### 记录日志

了解程序的运行过程

### 委托复杂业务

让 Rake 做好自己的事情

## Rake in Action

simple blog generator

a good demo

### 主要步骤

- 查找定义源文件
- 动态定义 file task
- 执行动作
- 并发处理
- 任务依赖
- refactor
- 提取 model 和 view

## 小贴士

### 全局的 Rake Task

存放在 \$HOME/.rake/ 文件夹下

使用 `rake -g xxx` 调用

### Rake Task 的 desc

- 不写的话 `rake -T` 不会显示

- 不过用 `rake -T -A` 就能显示了

### 传参数给 Rake Task

错误的用法:

    bin/rake report:build_report_with_date "2015-09-07"

正确地用法:

    bin/rake report:build_report_with_date["2015-09-07"]

## Thanks

Questions?
