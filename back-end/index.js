const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'popo7783',
  database: 'movie_db',
  multipleStatements: true
});

let query = `
  SELECT m.mid,m.mname, mi.img_url, g.gname
  FROM movies m
  JOIN movie_images mi ON m.mid = mi.mid
  JOIN movies_genres mg ON m.mid = mg.mid
  JOIN genres g ON g.gid = mg.gid;

  SELECT * FROM genres;

  SELECT m.mid,m.mname,m.title,m.initial_release,m.rate,GROUP_CONCAT(g.gname SEPARATOR ' - ') AS genres,d.dname,mi.img_url
  FROM movies m
  JOIN movies_genres mg ON m.mid = mg.mid
  JOIN genres g ON g.gid = mg.gid
  JOIN directors d ON d.did = m.did
  JOIN movie_images mi on m.mid = mi.mid
  GROUP BY m.mid, m.mname, m.title, m.initial_release, d.dname,mi.img_url;
`;

app.get('/movies', (req, res) => {
  db.query(query, (err, results) => {
    if (err) {
      console.error('Query error:', err);
      return res.status(500).json({ error: err });
    }
    console.log('Results:', results);

    const movies = results[0];
    const genres = results[1];
    const movieInfo = results[2];

    res.json({ movies, genres , movieInfo });
  });
});

app.get('/movies/:id', (req, res) => {
  const movieId = req.params.id;
  const query = `
    SELECT m.mid, m.mname, m.title, m.initial_release, m.rate, 
           GROUP_CONCAT(g.gname SEPARATOR ' - ') AS genres, 
           d.dname, mi.img_url
    FROM movies m
    JOIN movies_genres mg ON m.mid = mg.mid
    JOIN genres g ON g.gid = mg.gid
    JOIN directors d ON d.did = m.did
    JOIN movie_images mi ON m.mid = mi.mid
    WHERE m.mid = ?
    GROUP BY m.mid, m.mname, m.title, m.initial_release, d.dname, mi.img_url;
  `;

  db.query(query, [movieId], (err, results) => {
    if (err) {
      console.error("Query error:", err);
      return res.status(500).json({ error: err });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: "Movie not found" });
    }
    res.json({ movieInfo: results[0] });
  });
});


app.listen(3000, () => {
  console.log('Server running on http://localhost:3000');
});

