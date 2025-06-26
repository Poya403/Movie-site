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

    const movies = results[0];
    const genres = results[1];
    const movieInfo = results[2];

    res.json({ movies, genres , movieInfo });
  });
});

app.get('/movies/:id', (req, res) => {
  const movieId = req.params.id;

  const movieQuery = `
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

  const castQuery = `
    SELECT a.aname, mc.role_in_movie
    FROM actors a
    JOIN movies_cast mc ON a.aid = mc.aid
    WHERE mc.mid = ?;
  `;

  db.query(movieQuery, [movieId], (err, movieResults) => {
    if (err) {
      console.error("Query error:", err);
      return res.status(500).json({ error: err });
    }
    if (movieResults.length === 0) {
      return res.status(404).json({ message: "Movie not found" });
    }

    db.query(castQuery, [movieId], (err, castResults) => {
      if (err) {
        console.error("Query error:", err);
        return res.status(500).json({ error: err });
      }

      res.json({
        movieInfo: movieResults[0],
        cast: castResults
      });
    });
  });
});

app.post('/register', async (req, res) => {
  const { uname, password } = req.body;

  const query = "INSERT INTO users (uname, password) VALUES (?, ?)";
  db.query(query, [uname, password], (err, result) => {
    if (err) {
      console.error("خطا در ثبت‌نام:", err);
      return res.status(500).json({ error: err });
    }
    res.json({ message: "successfully registered!", id: result.insertId });
  });
});

app.post('/login', async (req, res) => {
  const { uname, password } = req.body;

  db.query("SELECT * FROM users WHERE uname = ?", [uname], async (err, results) => {
    if (err || results.length === 0) { return res.status(401).json({ message: "نام کاربری یا رمز عبور اشتباه است" });}

    const user = results[0];

    if (password !== user.password) { return res.status(401).json({ message: "رمز عبور اشتباه است" });}

    res.json({ message: "successfully login!", id: user.uid});
  });
});

app.get('/account/:id', (req, res) => {
  const userId = req.params.id;
  const query = `SELECT * FROM users WHERE uid = ?`;

  db.query(query, [userId], (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "خطا در دریافت اطلاعات کاربر" });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: "کاربر پیدا نشد" });
    }
    res.json(results[0]);
  });
});

app.get('/accountEdit/:id', (req, res) => {
  const userId = req.params.id;
  const query = `SELECT * FROM users WHERE uid = ?`;

  db.query(query, [userId], (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "خطا در دریافت اطلاعات کاربر" });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: "کاربر پیدا نشد" });
    }
    res.json(results[0]);
  });
});

app.put('/accountEdit/:id', (req, res) => {
  const userId = req.params.id;
  const { uname, bio, isChangingPassword, curr_password, new_password } = req.body;

  const selectQuery = `SELECT password FROM users WHERE uid = ?`;
  db.query(selectQuery, [userId], (err, results) => {
    if (err || results.length === 0) {
      return res.status(500).json({ message: "کاربر یافت نشد یا خطای دیتابیس" });
    }

    const currentPasswordInDb = results[0].password;

    if (isChangingPassword) {
      if (curr_password !== currentPasswordInDb) {
        return res.status(401).json({ message: "رمز عبور فعلی اشتباه است" });
      }
      const updateQuery = `UPDATE users SET uname = ?, bio = ?, password = ? WHERE uid = ?`;
      db.query(updateQuery, [uname, bio, new_password, userId], (err) => {
        if (err) {
          console.error("Update error:", err);
          return res.status(500).json({ message: "خطا در به‌روزرسانی اطلاعات" });
        }
        res.json({ message: "اطلاعات با موفقیت ویرایش شد" });
      });
    } else {
      const updateQuery = `UPDATE users SET uname = ?, bio = ? WHERE uid = ?`;
      db.query(updateQuery, [uname, bio, userId], (err) => {
        if (err) {
          console.error("Update error:", err);
          return res.status(500).json({ message: "خطا در به‌روزرسانی اطلاعات" });
        }
        res.json({ message: "اطلاعات با موفقیت ویرایش شد" });
      });
    }
  });
});

app.listen(3000, () => {
  console.log('Server running on http://localhost:3000');
});

