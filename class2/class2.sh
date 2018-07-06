####shell语法

###条件测试
##test/[，检查命令的退出码
#read myint
#test $myint -eq 100
#echo $?

###测试整型
##-eq是否相等
#read myint
#test $myint -eq 100
#
##-ne是否不相等
#test $myint -ne 100
#
##-lt是否小于
#test $myint -lt 100
#
##-gt是否大于
#test $myint -gt 100
#
##-le是否小于等于
#test $myint -le 100
#
##-ge是否大于等于
#test $myint -ge 100
#echo $?

###测试字符串
#read mystr
#
##判断是否相等
[ "X"$mystr == "Xhello" ]
#
##判断是否不等
#[ $mystr != "hello" ]
#
##判断是否为空
#[ -z $mystr ]
#
##判断是否为非空串
#[ -n $mystr ]
#echo $?

###测试文件
##-f是否为普通文件
#[ -f ./class1.sh ]
#
##-d是否为目录文件
#[ -d / ]
#
##-c字符设备文件
#[ -c /dev/tty ]
#
##-b块设备文件
#[ -b /dev/sda ]
#echo $?

###多条件测试
##-a逻辑与
#printf "please enter data1:"
#read data1
#printf "please enter data2:"
#read data2
#[ $data1 -eq 100 -a $data2 -eq 200 ]
#
##-o逻辑或
#[ $data1 -eq 100 -o $data2 -eq 200 ]
#
##"! "逻辑非
#read mystr
#[ ! "X$mystr" == "Xhello" ]
#echo $?

###if条件语句
#read mystr
#if [ "X$mystr" == "Xhello" ];then
##then
#    echo "get hello"
#fi

###if条件嵌套
#printf "please enter data:"
#read data
#if [ $data -lt 100 ];then
#    if [ $data -eq 50 ];then
#        echo "data is 50"
#    elif [ $data -lt 50 ];then
#        echo "data is less than 50"
#    else
#        echo "data is greater than 50 and less than 100"
#    fi
#else
#    echo "data is greater than 100"
#fi

###检测文件内是否含有关键字'222'
#printf "please enter file name:"
#read filename
#if grep -Eq '222' "$filename";then
#    echo "yes"
#else
#    echo "no"
#fi

###空代码块
##":"为空命令，什么也不做，但退出码总是真
#printf "please enter data:"
#read data
#if [ $data -eq 100 ];then
##    false
##    true
#    :
#else
#    echo "AAAAAA"
#fi

### || 和 &&
## &&相当于"if...then..."
#printf "please enter data:"
#read data
#[ $data -eq 100 ] && echo "yes"
#[ $data -eq 100 ] && {
#        echo "yes"
#    }
#
## ||相当于"if not...then..."
#printf "please enter data:"
#read data
#[ $data -eq 100 ] || echo "yes"
#[ $data -eq 100 ] || {
#        echo "yes"
#    }

###case/esac命令
##执行形式./class2.sh stop/start/等
#case $1 in
#    'start')
#    echo "start ..done"
#    ;;
#    'stop')
#    echo "stop ..done"
#    ;;
#    'restart')
#    echo "restart ..done"
#    ;;
#    'status')
#    echo "status ..done"
#    ;;
#    *)
#    echo "default"
#    ;;
#esac
#
##"|"分隔相等含义条件，即start与-s等效
#case $1 in
#    'start' | -s)
#    echo "start ..done"
#    ;;
#    'stop' | -t)
#    echo "stop ..done"
#    ;;
#    'restart' | -rt)
#    echo "restart ..done"
#    ;;
#    'status' | -st)
#    echo "status ..done"
#    ;;
#    *)
#    echo "default"
#    ;;
#esac
#
##还支持通配符
#case $1 in
#    [sS]tart | -s)
#    echo "start ..done"
#    ;;
#    sto[pP] | -t)
#    echo "stop ..done"
#    ;;
#    [rR]estart | -rt)
#    echo "restart ..done"
#    ;;
#    [sS]tatus | -st)
#    echo "status ..done"
#    ;;
#    *)
#    echo "default"
#    ;;
#esac

###for循环语句
##(())形式类似C语言
#for ((i=0; i<=10; ++i))
#do
#    echo "hello $i"
#done
#
##for in形式
#for i in {1..10}
#do
#    echo "hi $i"
#done
#
##for in可以用来遍历字符
#for i in {a..z}
#do
#    echo "hello $i"
#done
#
##循环条件的组合(带空格)，输出结果区间拼接
#for i in {a..e} {1..5}
#do
#    echo "hello $i"
#done
#
##循环条件的组合(不带空格)，输出结果i拼接
#for i in {a..e}{1..5}
#do
#    echo "hello $i"
#done

###while循环语句
#i=0
#while [ $i -le 5 ]
#do
#    echo "hello $i"
##    ((i++))
#    let i++
#done

###until循环
##条件为假执行语句，条件为真跳出循环
#i=0
#until [ $i -ge 5 ]
#do
#    echo "hello $i"
#    let i++
#done

###死循环
##方法1
#for (( ; ;  ))
#do
#    echo "this is youngmay"
#    sleep 1
#done
#
##方法2
#while :
#do
#    echo "this is youngmay"
#    sleep 1
#done
#
##方法3
#until false
#do
#    echo "this is youngmay"
#    sleep 1
#done

###循环体内也不能有空语句，可用:代替
#until false
#do
#    :
#done

###求1-100的和
#i=1
#sum=0
#for i in {1..100}
#do
#    let sum+=i
#    let i++
#done
#echo $sum

###求1-100的和，但要打印出过程1+2...+100=5050
#i=1
#sum=0
#str=''
#while [ $i -le 100 ]
#do
#    let sum+=i
#    if [ -z $str ];then
#        str=$i
#    else
#        str=$str+$i
#    fi
#    let i++
#done
#echo $str=$sum

###位置参数和特殊变量
#
##特殊变量
#echo "\$0 is $0"
#echo "\$1 is $1"
#echo "\$2 is $2"
#echo "\$3 is $3"
#echo "\$# is $#"
#echo "\$@ is $@"
#echo "\$? is $?"
#echo "\$$ is $$"
#
##位置参数可以利用shift命令左移，这里的左移本质上为覆盖
##注意这里的$0不会改变，左移从$1开始
#echo "================shift 1 before==================="
#echo "\$0 is $0"
#echo "\$1 is $1"
#echo "\$2 is $2"
#echo "\$3 is $3"
#echo "\$# is $#"
#echo "\$@ is $@"
#echo "\$? is $?"
#echo "\$$ is $$"
#echo "================shift 1 before==================="
#shift 1
#echo "\$0 is $0"
#echo "\$1 is $1"
#echo "\$2 is $2"
#echo "\$3 is $3"
#echo "\$# is $#"
#echo "\$@ is $@"
#echo "\$? is $?"
#echo "\$$ is $$"

###遍历命令行参数
#
##方法1
#for i in $@
#do
#    echo $i
#done
#
##方法2
#while [ $# -ne 0 ]
#do
#    echo $1
#    shift 1
#done

###函数
##仅在函数被调用时，才执行函数体中内容
##shell中函数必须先定义后调用
#function myfun()
#{
#    echo "I am function"
#}
#myfun

###函数传参
#function myfun()
#{
#    echo $0
#    echo $1
#    echo $2
#    echo $3
#    echo $#
#    echo $@
#    echo "I am myfun"
#}
#myfun 1 2
#
##$0不会作为函数参数
#function myfun()
#{
#    echo "=================function====================="
#    echo $0
#    echo $1
#    echo $2
#    echo $#
#    echo $@
#    echo "I am myfun"
#}
#myfun 1 2
#echo "================shell======================="
#echo $0
#echo $1
#echo $2
#echo $#
#echo $@

###函数返回值
##函数中return后的数字即为函数返回值，函数返回值不能为字符串
#function myfun()
#{
#    echo "I am function"
#    return 123
#}
#myfun
#echo $?

###判断函数执行是否正确
#function myfun()
#{
#    echo "I am function"
#    return 123
#}
#myfun
#if [ $? -eq 123 ];then
#    echo "success"
#else
#    echo "failed"
#fi
#
##上面的代码也可以写成
#function myfun()
#{
#    echo "I am function"
#    return 0
#}
#if myfun;then
#    echo "success"
#else
#    echo "fail"
#fi

###echo输出函数的返回值
##不关心函数的退出码，关心的是数据string
##函数中有且仅有一条string输出
#function myfun()
#{
#    echo "success"
#}
#ret=$(myfun)
#if [ "X$ret" == "Xsuccess" ];then
#    echo "exec success"
#else
#    echo "exec fail"
#fi

###Shell脚本的调试方法
##在脚本中利用set -x和set +x启用或禁用参数
#
#for i in {1..10}
#do
#set -x
#    touch file.$i
#set +x
#done
#
#echo "hello 1"
#echo "hello 2"
#echo "hello 3"
#echo "hello 4"
#set +x
#echo "hello 5"
#echo "hello 6"
#echo "hello 7"
#set -x
#echo "hello 8"
#echo "hello 9"
#echo "hello 10"

###数组
#
##bash shell只支持一维数组，初始化不用定义数组大小
##用括号表示，元素以空格分开，且可以用不连续的下标
#arr=(1 a 3.14 'b' 'string')
#echo "0 : ${arr[0]}"
#echo "1 : ${arr[1]}"
#echo "2 : ${arr[2]}"
#echo "3 : ${arr[3]}"
#echo "4 : ${arr[4]}"
#
##获取数组中所有元素
#arr=(1 a 3.14 'b' "string")
#echo ${arr[@]}
#echo ${arr[*]}
#
##获取数组长度
#arr=(1 a 3.14 'b' "string")
#echo ${#arr[@]}
#echo ${#arr[*]}
#
##遍历数组1
#arr=(1 a 3.14 'b' "string")
#for (( i=0; i<${#arr[@]}; i++ ))
#do
#    echo "$i -> ${arr[$i]}"
#done
#
##遍历数组2->推荐，简单
#arr=(1 a 3.14 'b' "string")
#for i in ${arr[@]}
#do
#    echo $i
#done

###shell输出重定向
#echo "hello world" > file2
#
##对循环结果进行输出重定向
#for(( i=0; i<10; i++ ))
#do
#    echo "hello $i"
#done > file2

###追加重定向
#for (( i=0; i<5; ++i ))
#do
#    echo "youngmay+$i"
#done >> file2

###输入重定向
#
##读取file2文件的一行
#read line < file2
#echo $line
#
##按行读取整个file2文件
#while read line
#do
#    echo $line
#done < file2
#
##给每行添加字符串may，再备份到file3
#while read line
#do
#    echo 'may'$line
#done < file2 >file3

###stderr重定向到file4
##命令行上执行
#find a 2>file4

###Here Document->shell中特殊的重定向
#
##统计EOF之间有多少行
#wc -l << EOF
#    aaaaaa
#    bbbbbb
#    cccccc
#    dddddd
#    hello bit
#EOF
#
##使用here document生成makefile文件
#cat <<EOF > makefile
#test:test.c
#    gcc -o test test.c
#.PHONY:clean
#clean:
#    rm -f test
#EOF

###/dev/null文件->类似垃圾桶
#cat makefile 2>&1 > /dev/null

###shell与信号
#trap 'echo "hello world"; ls' 3
#while :
#do
#    :
#done

###shell文件包含
##"."与"source"作用相同，相当于引入头文件
##. api.sh
#source api.sh
#read d1 d2
#res=$(intadd $d1 $d2)
#echo $res

###shell运算符
#
##echo
##换行
#echo -e "hello \nworld"
##不换行
#echo -e "hello \c"
#echo "world"
#
##printf
#mystr='string'
#myint=100
#myfloat=3.14
#printf "%s : %d : %f\n" $mystr $myint $myfloat

###产生一个随机数
#echo $RANDOM

###编写进度条
#i=0
#str=''
#label=("|" "/" "-" "\\")
#while [ $i -le 100 ]
#do
#    printf "[%d%%][%c][%s]\r" $i ${label[i%4]} $str
#    let i++
#    str=${str}'#'
#    sleep 0.1
#done
#printf "\n"

###输入至少3个参数，计算最大、最小、平均值
#if [ $# -lt 3 ];then
#    echo "参数太少"
#    exit 1
#fi
#sum=0
#max=$1
#min=$1
#for i in $@
#do
#    [ $i -lt $min ] && min=$i
#    [ $i -gt $max ] && max=$i
#    let sum=$sum+$i
#done
#echo "min="$min
#echo "max="$max
#avg=`echo "ibase=10;scale=2;$sum/$#"|bc`
#echo "avg="$avg

###有一列数：1 2 3 5 8 13 21 34...问第100个数为多少
#arr[0]=1
#arr[1]=2
#for(( i=2; i<=99; i++ ))
#do
#    arr[$i]=`expr ${arr[$i-1]} + ${arr[$i-2]}`
#done
#for(( i=0; i<=99; i++ ))
#do
#    echo ${arr[$i]}
#done

###将文件内容形如123abc456输出为456ABC123
#input="123abc456"
#sub1=${input:0:3}
#sub2=${input:3:3}
#sub3=${input:6:3}
#tmp=$sub3$sub2$sub1
#echo $tmp | tr 'a-z' 'A-Z'
