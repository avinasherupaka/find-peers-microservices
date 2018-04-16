
-- Each service holds it's data in an exclusive keyspace

CREATE KEYSPACE IF NOT EXISTS beacon_service WITH REPLICATION = {
  'class': 'NetworkTopologyStrategy',
  'DATA' : 2
};

CREATE TABLE IF NOT EXISTS beacon_service.beacons_by_location (
    location_id uuid,
    beacon_id uuid,
    beacon_name text,
    PRIMARY KEY (location_id)
);

CREATE KEYSPACE IF NOT EXISTS tracking_service WITH REPLICATION = {
  'class': 'NetworkTopologyStrategy',
  'DATA' : 2
};

CREATE TABLE IF NOT EXISTS tracking_service.users_by_beacon (
    beacon_id uuid,
    time_logged timestamp,
    user_id uuid,
    name text,
    PRIMARY KEY (beacon_id, time_logged, user_id)
) WITH CLUSTERING ORDER BY (time_logged DESC);


-- Init the data for beacons_by_location
insert into beacon_service.beacons_by_location (location_id, beacon_id, beacon_name ) VALUES ( ce519f95-923c-4532-879e-cd19afa8dda8, 5bf966d9-8046-4fc1-ae5a-80c923ebea5a, 'Bed Room Beacon');

insert into beacon_service.beacons_by_location (location_id, beacon_id, beacon_name ) VALUES ( 68dce417-460a-4509-acdf-c5401afd652f, 99a627ed-d91b-45de-beef-5e73c4edba87, 'Kitchen Beacon');

insert into beacon_service.beacons_by_location (location_id, beacon_id, beacon_name ) VALUES ( 70e71688-1b99-42de-a414-299e033192ec, 250cd22b-1de4-4a6c-9ee5-761bf39204d0, 'Living Room Beacon');

insert into beacon_service.beacons_by_location (location_id, beacon_id, beacon_name ) VALUES ( bd1bd41c-0b28-4595-8eb5-394a645570ca, 42c75451-e0da-4481-b807-580bbb8c4bf2, 'Basement Beacon');

insert into beacon_service.beacons_by_location (location_id, beacon_id, beacon_name ) VALUES ( 8321be22-9686-4b35-9f3d-4d7b74fdc463, 562a37e6-232f-4e97-b4b8-7c02af55aeda, 'Garden Beacon');


-- Init the data for users_by_beacon (All same time, equivalent to ms epoch time: 1473156000)
insert into tracking_service.users_by_beacon (beacon_id, time_logged, user_id, name) VALUES ( 5bf966d9-8046-4fc1-ae5a-80c923ebea5a, '2016-09-06 10:00:00+0000', f525cff6-721e-11e6-8b77-86f30ca893d3 ,'Avinash Erupaka');

insert into tracking_service.users_by_beacon (beacon_id, time_logged, user_id, name) VALUES ( 5bf966d9-8046-4fc1-ae5a-80c923ebea5a, '2016-09-06 10:00:00+0000', 8010fa28-721f-11e6-8b77-86f30ca893d3 ,'Bhargavi Erupaka');

insert into tracking_service.users_by_beacon (beacon_id, time_logged, user_id, name) VALUES ( 5bf966d9-8046-4fc1-ae5a-80c923ebea5a, '2016-09-06 10:00:00+0000', 88b66e10-721f-11e6-8b77-86f30ca893d3 ,'Shobha Erupaka');

insert into tracking_service.users_by_beacon (beacon_id, time_logged, user_id, name) VALUES ( 99a627ed-d91b-45de-beef-5e73c4edba87, '2016-09-06 10:00:00+0000', 94e11b68-721f-11e6-8b77-86f30ca893d3 ,'Shreya Sulgham');

insert into tracking_service.users_by_beacon (beacon_id, time_logged, user_id, name) VALUES ( 99a627ed-d91b-45de-beef-5e73c4edba87, '2016-09-06 10:00:00+0000', 94e11b68-721f-11e6-8b77-86f30ca893d3 ,'Shrihan Sulgham');

insert into tracking_service.users_by_beacon (beacon_id, time_logged, user_id, name) VALUES ( 99a627ed-d91b-45de-beef-5e73c4edba87, '2016-09-06 10:00:00+0000', 99970b22-721f-11e6-8b77-86f30ca893d3 ,'Archana Sulgham');

insert into tracking_service.users_by_beacon (beacon_id, time_logged, user_id, name) VALUES ( 99a627ed-d91b-45de-beef-5e73c4edba87, '2016-09-06 10:00:00+0000', 9ebc0c38-721f-11e6-8b77-86f30ca893d3 ,'Anil Sulgham');

insert into tracking_service.users_by_beacon (beacon_id, time_logged, user_id, name) VALUES ( 562a37e6-232f-4e97-b4b8-7c02af55aeda, '2016-09-06 10:00:00+0000', a4619f9a-721f-11e6-8b77-86f30ca893d3 ,'Sunita Bohra');
