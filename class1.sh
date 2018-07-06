#Shell正则表达式


##下行是一个约定的标记，告诉系统这个脚本需要什么解释器来执行
##!/bin/bash
#echo "hello world"
#echo hello world
#echo 'hello world'

##运行时用source或者.修饰，才能让父bash改变目录
#pwd
#cd ..
#pwd

##变量名与等号之间不能有空格
#mystring="bit tech"
#myint=1000
#myfloat=3.14
#mychar=c
#echo $mystring
#echo $myint
#echo $myfloat
#echo $mychar
#echo ${mystring} hello may

#val="hello"
#echo $val
#val=122
#echo $val
#unset val
#echo $val

##readonly修饰只读变量，不可删除
#readonly mystring="this is youngmay"
#echo $mystring
#unset mystring
#echo $mystring

##父bash定义的变量，用export修饰之后才能被子shell访问到
#echo $myval

##拼接字符串
#str1=hello
#str2=' young'
#str3="may"
#echo $str1$str2$str3'!'

##求字符串长度
#str='This YoungMay'
#echo ${#str}

##提取子字符串(左开右闭区间)
#str="adwec2131"
#echo ${str:1:4}

##文件名代换
#for i in {1..100};
#do
#    touch file$i;
#done

##命令代换与算术代换
#下行是反引号
#date=`date +%Y:%m:%d:%H:%M:%S`
#DATE=$(date +%Y:%m:%d:%H:%M:%S)
#echo $date
#echo $DATE

##算术运算
#int=1000
#echo $int
#((int++))
#echo $int
#int2=3
#res=$(($int+$int2))
#echo $res

##转义字符
#touch \$\ \$
#r
#\$\ \$

#在命令行上处理带-的文件名
#touch -- -file
#rm -- -file

#在命令行上\可以表示续行符

#单引号和双引号
#单引号会把其中内容全当普通字符
#双引号会将其中内容的变量、转义字符、日期等都进行替换
#str="good"
#echo "hello bit $str \\ \" \\ \` `date +%Y:%m:%d`"
#echo 'hello bit $str \\ \" \\ \` `date +%Y:%m:%d`'
