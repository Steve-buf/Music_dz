CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Group (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenreBand (
	Genre_id INTEGER REFERENCES Genre(id),
	Group_id INTEGER REFERENCES Group(id),
	CONSTRAINT pk_Genre_group PRIMARY KEY (Genre_id, Group_id)
);


CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) unique NOT NULL,
	year_of INTEGER check(year_of>1900)
);


CREATE TABLE IF NOT EXISTS BandAlbum (
	Album_id INTEGER REFERENCES Album(id),
	Band_id INTEGER REFERENCES Group(id),
	CONSTRAINT pk_Group_Album PRIMARY KEY (Album_id, Group_id)
);


CREATE TABLE IF NOT EXISTS Songs (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	duration INTEGER,
	Album_id INTEGER REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) unique NOT NULL,
	year_of INTEGER check(year_of>1900),
);

CREATE TABLE IF NOT EXISTS SongCollection (
	Song_id INTEGER REFERENCES Songs(id),
	Collection_id INTEGER REFERENCES Collection(id),
	CONSTRAINT pk_SongCollection PRIMARY KEY (Song_id, Collection_id)
);
