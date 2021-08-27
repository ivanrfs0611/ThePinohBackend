const pool = require("../config/db");

exports.Login = (username, password) => {
  return new Promise(function (resolve, reject) {
    var sql = `SELECT userId, username FROM User WHERE username = '${username}' AND passwordHash = '${password}'`;
    pool.query(sql, (err, result) => {
      console.log(result);
      if (err) reject(err);

      resolve(result);
    });
  });
};
