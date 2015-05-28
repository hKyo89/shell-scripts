#!/bin/bash

echo ""
logfile=/tmp/log/build-server.log
echo "Installing Supervisord"
echo "----------------------"

echo -n "* (1/) Installing supervisor ... "
easy_install supervisor 1>> $logfile
echo "Done"

echo -n "* (2/) Checking version ... "
supervisord --version

echo -n "* (3/) Preparing configuration file ... "
echo_supervisord_conf > /etc/supervisord.conf
echo "Done"

echo -n "* (4/) Installing supervisord to service ... "
cat << EOF > /etc/rc.d/init.d/supervisord
#!/bin/bash

. /etc/init.d/functions

DAEMON=/usr/bin/supervisord
PIDFILE=/var/run/supervisord.pid

[ -x "\$DAEMON" ] || exit 0

start() {
        echo -n "Starting supervisord: "
        if [ -f \$PIDFILE ]; then
                PID=\`cat \$PIDFILE\`
                echo supervisord already running: \$PID
                exit 2;
        else
                daemon  \$DAEMON --pidfile=\$PIDFILE -c /etc/supervisord.conf
                RETVAL=\$?
                echo
                [ \$RETVAL -eq 0 ] && touch /var/lock/subsys/supervisord
                return \$RETVAL
        fi

}

stop() {
        echo -n "Shutting down supervisord: "
        echo
        killproc -p \$PIDFILE supervisord
        echo
        rm -f /var/lock/subsys/supervisord
        return 0
}

case "\$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    status)
        status supervisord
        ;;
    restart)
        stop
        start
        ;;
    *)
        echo "Usage:  {start|stop|status|restart}"
        exit 1
        ;;
esac
exit \$?
EOF
echo "Done"

echo -n "* (5/) Changing permission of supervisord service ... "
chmod 755 /etc/rc.d/init.d/supervisord
echo "Done"

echo -n "* (6/) Installing superlance ... "
easy_install superlance 1>> $logfile
echo "Done"

setenforce 0

echo ""



