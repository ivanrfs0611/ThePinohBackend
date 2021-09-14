const authModel = require("../model/authModel");
const jwt = require("../lib/jwt");
const bcrypt = require("../lib/bcrypt");

exports.login = async (req, res) => {
  let adminID = authModel.Login(
    req.body.username,
    bcrypt.Encrypt(req.body.password)
  );
  adminID
    .then(function (result) {
      if (result.length > 0) {
        //success login

        let data = {
          userId: result[0].id,
          username: result[0].username,
        };

        let token = jwt.Encode(data);

        res.json({
          code: 200,
          success: true,
          token,
        });
      } else {
        //unsuccessful login
        // console.log(result);
        res.json({
          code: 200,
          success: true,
        });
      }
    })
    .catch(function (err) {
      console.log(err);
      res.json({
        code: 500,
        success: false,
      });
    });
};
