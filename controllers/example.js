const get = (req, res) => {
  console.log(req.query);

  if (req.query.error && req.query.error === 'true') {
    throw Error('this is my error');
  } else {
    res.json(req.query);
  }
};

module.exports = {
  get,
};
