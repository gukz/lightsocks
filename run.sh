#!/bin/bash
Host="45.32.184.42"
Password="7Do{zUV1?{14jGKT"


init() {
    echo "
{
    \"listen\": \"127.0.0.1:7448\",
    \"remote\": \"${Host}:34965\",
    \"password\": \"gwVjbEMdUSX3vvAV9drT+xGd/4WoHEhf9msLBOzPn15bRVSqDOiJYP7nmk3feUYilIckmctmTJG1V3fzt36P2z873JP5s8E9o/ovPDIK0GmGzjdYRy2MANnRfDrhyE5PgDjANpVn6ln4EmTMGCtJuSycyqIgAxewx1q0rrIIG7bN1LEuco50v1PCoAJdKOt/D73eUIGhB3GeRHpiAUAmp2q4KQbdpmU1qZDkM8Yecx9hkmhu75Z1GcWli3b0m5jur+mkS9UQIRTle/y7KvG6xI39GkENFm284sMTcPJvCX3YrULX7TQ5DpeKydKr5taEeD7gMFwnI0rjMYJSVqxViA==\"
}
    ">./lightsocks.txt
    ln -s ./lightsocks.txt ~/.lightsocks.json
    sshpass -p $Password scp lightsocks.txt root@${Host}:~/.lightsocks.json
    sshpass -p $Password scp ls-server-linux root@${Host}:~/
    sshpass -p $Password ssh root@${Host} "./ls-server-linux"
}

init
