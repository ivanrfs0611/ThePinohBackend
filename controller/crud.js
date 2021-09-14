const crudModel = require("../model/CRUDModel");
const platform = require("../platform");

const uniqid = require("uniqid");

exports.insertMenu = async (req, res) => {
  let photo;
  if (req.files) {
    var file = req.files.photo;
    var extension = req.files.photo.name.split(".");
    extension = extension[extension.length - 1];
    photo = `${uniqid()}.${extension}`;

    file.mv(platform.projectDir + "/images/" + photo, function (err) {
      if (err) console.log(err);
    });
  }

  var data = {
    menuName: req.body.menuName,
    menuDescription: req.body.menuDescription,
    quantity: req.body.quantity,
    price: req.body.price,
    photo,
  };

  let result = crudModel.insertMenu(data);
  result
    .then(function (result) {
      res.json({
        status: 200,
        success: true,
      });
    })
    .catch(function (err) {
      res.json({
        status: 500,
        success: false,
        message: err,
      });
    });
};

exports.getMenu = async (req, res) => {
  let result = crudModel.getMenu();

  result
    .then(function (result) {
      res.json({
        status: 200,
        success: true,
        return: result,
      });
    })
    .catch(function (err) {
      res.json({
        status: 500,
        success: false,
        message: err,
      });
    });
};
