$redis = Redis::Namespace.new("redis_with_rails", :redis => Redis.new)
# IMPORTANT: redis server set up in development:
# redis-conf is in live-projects/data/redis
# dump.rdb is in the same directory
# When starting server, need to specify config file at the end of path
# i.e. /Users/okadachikara/live-projects/data/redis/redis.conf
# on the config file, "dir" is /Users/okadachikara/live-projects/data/redis/
# does not include filename which is specified as "dbfilename" on the config file;
# filename needs to match for redis to read.

# !!!!!!!When using dump.rdb to recover data, shutdown redis first, move dump.rdb into "dir" then START, NOT restart; Do not restart without shutting down or
# or redis will overwrite dump.rdb
# redis-cli command to stop redis >> SHUTDOWN
# Move dump.rdb into
# reference: https://stackoverflow.com/questions/14497234/how-to-recover-redis-data-from-snapshotrdb-file-copied-from-another-machine
# If you want to shutdown and save, use this command: redis-cli command >> SHUTDOWN SAVE
# Above command will save the current snapshot data into dump.rdb
# Just shutting down will not save the data
