const pool = require("../config/db");

exports.insertMenu = (data) => {
  return new Promise(function (resolve, reject) {
    var sql = "insert into Menu set ?";
    pool.query(sql, [data], (err, result) => {
      if (err) reject(err);

      resolve(true);
    });
  });
};
