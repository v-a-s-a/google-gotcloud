PATH=/sbin:/usr/sbin:/bin:/usr/bin
DESC="Mounting a GCS bucket though a FUSE"
NAME=gcsfuse
DAEMON=/home/vasya/go/bin/$NAME
PIDFILE=/var/run/$NAME.pid
SCRIPTNAME=/etc/init.d/$NAME
BUCKET="gs-fuse-test"
MOUNT_POINT="/mnt/data/"
DAEMON_OPTS=" -limit-ops-per-sec -1 \
              -o ro \
              -stat-cache-ttl 1.0h \
              -type-cache-ttl 1.0h \
              -temp-dir /mnt/output/ \
              -temp-dir-bytes 200000000000 \
              $BUCKET $MOUNT_POINT"


if [ ! -x $DAEMON ]; then
  echo "ERROR: Can't execute $DAEMON."
  exit 1
fi

start_service() {
  echo -n " * Starting $NAME... "
  start-stop-daemon --chuid trubetsk --background -Sq -p $PIDFILE -x $DAEMON -- $DAEMON_OPTS
  e=$?
  if [ $e -eq 1 ]; then
    echo "already running"
    return
  fi

  if [ $e -eq 255 ]; then
    echo "couldn't start :("
    exit 1
  fi

  echo "done"
}

stop_service() {
  echo -n " * Stopping $NAME... "
  start-stop-daemon -Kq -R 10 -p $PIDFILE
  e=$?
  umount $MOUNT_POINT
  if [ $e -eq 1 ]; then
    echo "not running"
    return
  fi

  echo "done"
}

status_service() {
    printf "%-50s" "Checking $NAME..."
    if [ -f $PIDFILE ]; then
        PID=`cat $PIDFILE`
        if [ -z "`ps axf | grep ${PID} | grep -v grep`" ]; then
            printf "%s\n" "Process dead but pidfile exists"
            exit 1 
        else
            echo "Running"
        fi
    else
        printf "%s\n" "Service not running"
        exit 3 
    fi
}

case "$1" in
  status)
    status_service
    ;;
  start)
    start_service
    ;;
  stop)
    stop_service
    ;;
  restart)
    stop_service
    start_service
    ;;
  *)
    echo "Usage: service $NAME {start|stop|restart|status}" >&2
    exit 1   
    ;;
esac

exit 0
