$redis = Redis::Namespace.new("redis_with_rails", :redis => Redis.new)
# IMPORTANT: redis server setup in development:
# redis-conf is in live-projects/data/redis
# dump.rdb is in the same directory
# When starting server, need to specify config file name "redis.conf" at the end of path
# i.e. /Users/okadachikara/live-projects/data/redis/redis.conf
# on the config file, "dir" for the path to "dbfilename" or dump.rdb, where the redis hash is persisted
# is /Users/okadachikara/live-projects/data/redis/
# the path does not include filename which is specified as "dbfilename" on the config file;
# filename needs to match for redis to read.

# !!!!!!!When using dump.rdb to recover data kept in remote site, shutdown redis first, move dump.rdb into "dir" then START, NOT restart;
# Do not restart without shutting down or redis will overwrite the backup dump.rdb
# redis-cli command to stop redis >> SHUTDOWN
# reference: https://stackoverflow.com/questions/14497234/how-to-recover-redis-data-from-snapshotrdb-file-copied-from-another-machine

# If you want to shutdown and save, use this command: redis-cli command >> SHUTDOWN SAVE
# Above command will save the current snapshot data into dump.rdb
# Just shutting down will not save the data
