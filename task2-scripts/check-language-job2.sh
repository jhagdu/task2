file=/root/mywebdata/job1-pull-repo/mycode.html
ext=${file##*.}
if [ $ext == "html" ]
then 
  if ! docker ps | grep httpd
  then 
    docker run -itd -p 8081:80 -v /root/mywebdata/job1-pull-repo:/usr/local/apache2/htdocs/  httpd:latest
  fi  
  docker cp zen_carson:/var/lib/jenkins/workspace/job1-pull-repo/ /root/mywebdata/
elif [ $ext == "php" ]
then
  if ! docker ps | grep php
  then 
    docker run -itd -p 8081:80 -v /root/mywebdata/job1-pull-repo:/usr/src/myapp/  php:latest
  fi  
  docker cp zen_carson:/var/lib/jenkins/workspace/job1-pull-repo/ /root/mywebdata/
else
  if ! docker ps | grep $ext
  then 
    docker run -itd  $ext
  fi
fi
