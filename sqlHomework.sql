/*
 * TODO: Create a table called 'songs' that has the following fields:
 * - id - integer, primary key
 * - name - string
 * - album_id - foreign key
 * 
 * Note that album - song is a one-to-many relationship, so no bridge table is needed.
 */

CREATE TABLE songs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    album_id INTEGER NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Albums(id)
);

INSERT INTO songs
    (name, album_id)
VALUES
    ('Money', 1),  -- The Dark Side of the Moon
    ('Time', 1),
    ('Come Together', 2),  -- Abbey Road
    ('Here Comes the Sun', 2),
    ('Hotel California', 3),  -- Hotel California
    ('Life in the Fast Lane', 3),
    ('Born in the U.S.A.', 4),  -- Born in the U.S.A.
    ('Dancing in the Dark', 4),
    ('Bored to Death', 5),  -- California
    ("She\'s Out of Her Mind", 5)
;

CREATE TABLE Albums (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(70) NOT NULL,
    artist VARCHAR(70) NOT NULL,
    year_published INTEGER NOT NULL
);

/* 
 * TODO: Insert at least 4 rows of data into the songs table. You can change up the albums as well. :)
 */
 
 INSERT INTO Albums
     (name, artist, year_published)
 VALUES
     ('The Dark Side of the Moon', 'Pink Floyd', 1973),
     ('Abbey Road', 'The Beatles', 1969),
     ('Hotel California', 'Eagles', 1976),
     ('Born in the U.S.A.', 'Bruce Springsteen', 1984),
     ('California', 'Blink-182', 2016)
 ;

/* TODO: Write a query here to select all songs */

SELECT * FROM Albums;

/* 
 * TODO: Write a table join query to construct a table of Song Name : Album Name
 */
SELECT s.name AS "Song Name", a.name AS "Album Name"
FROM songs s
JOIN Albums a ON s.album_id = a.id;

/*
 * TODO: Find all albums published between 1970 and 1980.
 */
SELECT * 
FROM Albums
WHERE year_published BETWEEN 1970 AND 1980;

/*
 * TODO: Find all songs on albums published between 1970 and 1980. 
 *(Hint: Use a table join.)
 */
SELECT s.name AS "Song Name", a.name AS "Album Name", a.year_published
FROM songs s
JOIN Albums a ON s.album_id = a.id
WHERE a.year_published BETWEEN 1970 AND 1980;
 
/*
 * TODO: Find all songs on albums with names containing 'California'.
 */
SELECT s.name AS "Song Name", a.name AS "Album Name" 
FROM songs s
JOIN Albums a ON s.album_id = a.id
WHERE a.name LIKE '%California%';