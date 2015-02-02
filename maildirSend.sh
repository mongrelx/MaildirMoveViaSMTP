 #!/bin/bash
 
 ls -d Maildir/cur/*  | 
  while read fnam; 
  do  ( echo "helo `hostname`"; 
        from=$(grep  "^From" "$fnam" | awk {'print $NF;exit'}) ; 
        echo "MAIL FROM:${from}"; 
        echo "rcpt to: <example@example.com>"; 
        echo "data";  
        cat "$fnam"; 
        echo "."; 
        echo "quit"; 
        ) | nc localhost 25 ; done
