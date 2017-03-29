Dotfiles in Macbook Pro

Vim

鼠标

```
set mouse-=a " 鼠标暂不启用, 键盘党....
set mouse=a " 开启鼠标

```

退出后保留内容

```
set t_ti= t_te=
```

高亮缩进

```
,ig 启用缩进高亮
```

F 功能键

```
F1 废弃这个键,防止调出系统帮助
F2 set nu/nonu,行号开关，用于鼠标复制代码用
F3 set list/nolist,显示可打印字符开关
F4 set wrap/nowrap,换行开关
F5 set paste/nopaste,粘贴模式paste_mode开关,用于有格式的代码粘贴
F6 syntax on/off,语法开关，关闭语法可以加快大文件的展示F9 tagbar
F10 运行当前文件(quickrun)
```

自动对齐

```
:Tabularize 
/=>
可以选中多行,不选中默认操作当前行
    ,a= 对齐等号表达
    ,a: 对齐冒号表达式(json/map等)
    ,a<space>  首个空格对齐
    ,a2<space> 第二个空格对齐
    ,a*<space> 所有空格依次对齐
```

分屏移动

```
ctrl + j/k/h/l 进行上下左右窗口跳转,不需要ctrl+w+jkhlctrl-w + v/s 分屏
```

自动补全

```
,jd  跳转到函数定义, 分屏打开一个buffer(非常有用!!!!!!!!!)
,gd  跳到声明位置, 仅 filetypes: c, cpp, objc, objcpp, python 有效(比较少用)
```

tab操作

```
ctrl+t 新建一个tab

(hjkl)
,th 切第1个tab
,tl 切最后一个tab
,tj 下一个tab
,tk 前一个tab
,tn 下一个tab(next)
,tp 前一个tab(previous)
,td 关闭tab
,te tabedit
,tm tabm
,1 切第1个tab
,2 切第2个tab
,9 切第9个tab
,0 切最后一个tab
,tt 最近使用两个tab之间切换
```

目录树

```
[sd]

    ,n  打开 关闭树形目录结构

    在nerdtree窗口常用操作：(小写当前，大写root)
    x.......收起当前目录树
    X.......递归收起当前目录树
    r.......刷新当前目录
    R.......刷新根目录树

    p.......跳到当前节点的父节点
    P.......跳到root节点
    k/j.....上下移动
    K.......到同目录第一个节点
    J.......最后一个节点

    o.......Open files, directories and bookmarks

    s.......split上下分屏[原来是i, 改键]
    v.......vsplit左右分屏[原来是s, 改键]

    c.......将当前目录设为根节点
    q.......关闭
```

快速加/删引号

```
[d]
cs"'
"Hello world!" -> 'Hello world!'

ds"
"Hello world!" -> Hello world!

ysiw"
Hello -> "Hello"

yss"
Hello world -> "Hello world"

cst"
<a>abc</a>  -> "abc"

veeS"
hello world -> "hello world"

ys$" 当前到行尾, 引号引住
```



快速注释

```
[d] shift+v+方向键选中(默认当前行)
    -> ,cc      加上注释
    -> ,cu      解开注释
    -> ,c<space> 加上/解开注释
    -> ,cy      先复制再注解, p可以粘贴未注释前的代码
```

赋值语句代码对齐
将代码,或者json等, 根据表达式符号进行对齐,具体见例子 examples

```
[sd]  可以选中多行,不选中默认操作当前行
    ,a= 对齐等号表达
    ,a: 对齐冒号表达式(json/map等)
    ,a<space>  首个空格对齐
    ,a2<space> 第二个空格对齐
    ,a*<space> 所有空格依次对齐
```

去掉行尾空格

```
[sd] ,空格    去掉当前行末尾空格
```

多光标批量操作

```
[sd]
ctrl + m 开始选择
ctrl + p 向上取消
ctrl + x 跳过
esc   退出
```

视图模式下可伸缩选中部分，用于快速选中某些块

```
[sd]
v 增加选中范围
V 减少选中范围
```
