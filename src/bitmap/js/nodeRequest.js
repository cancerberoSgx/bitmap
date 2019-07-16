
function nodeRequest(url,cb){
  require('https').get(url, (resp) => {
    let data = [];
    resp.on('data', (chunk) => {
      data .push(chunk);
    });
    resp.on('end', () => {
      var body = Buffer.concat(data)
      cb(null, body)
    });
  }).on("error", (err) => {
    cb(err);
  });
}