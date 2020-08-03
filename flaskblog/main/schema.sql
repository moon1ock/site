DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS serverspecs;
DROP TABLE IF EXISTS serverload;

CREATE TABLE client (

    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ip TEXT NOT NULL,
    city TEXT NOT NULL,
    country TEXT NOT NULL,
    time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    lat REAL NOT NULL,
    lon REAL NOT NULL,
    browser TEXT

);

CREATE TABLE serverspecs (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    -- CPU data get with `system_profiler SPHardwareDataType`
    processor_name TEXT,
    processor_speed TEXT,
    num_of_processors INTEGER,
    num_of_cores INTEGER,
    l2_cache INTEGER, --KB, per core
    l3_cache INTEGER, --MB

    -- Physical Memory
    ram INTEGER, --GB

    -- GPU data
    chipset_model TEXT,
    vram INTEGER, -- MB

    --Disk data
    disk_total BIGINT, --bytes
    disk_used BIGINT, --bytes
    disk_percent REAL, --bytes
    -- # Note: UNIX usually reserves 5% of the total disk space for the root user. total and used fields on UNIX
    -- refer to the overall total and used space, whereas free represents the space available for the user and
    -- percent represents the user utilization (see source code). That is why percent value may look 5% bigger
    -- than what you would expect it to be. Also note that both 4 values match “df” cmdline utility.

    -- Network data
    ping REAL, --ms
    upload_speed REAL, --Mbps
    download_speed REAL --Mbps
);


CREATE TABLE serverload (

    time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- CPU data get with `system_profiler SPHardwareDataType`
    cpu_user REAL,
    cpu_system REAL,
    cpu_idle REAL,

    -- Physical Memory
    memory_available BIGINT, --GB

    -- GPU data
    -- NOT FOUND

    --Disk data
    disk_read BIGINT, --bytes
    disk_write BIGINT, --bytes

    -- Network data
    net_sent BIGINT, --ms
    net_recv BIGINT --Mbps
);


