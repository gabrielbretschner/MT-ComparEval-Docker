#/bin/bash
ls -la data
php -S 0.0.0.0:8080 -t ./www &
php -f www/index.php Background:Watcher:Watch --folder=./data 2>&1 | tee data/watcher.log &
# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?
