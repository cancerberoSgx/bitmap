const https = require('https');

function nodeRequest(url,cb){
  https.get(url, (resp) => {
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

nodeRequest("https://i.imgur.com/6egth7W.png",(err,data)=>{
if(err){
  console.log("Error: " + err.message);

}
else {
  // console.log(typeof data, typeof data[0],  data[0] , Array.isArray(data[0]), data.length);
  require('fs').writeFileSync('tmpNode.png', data);
  
  // require('fs').writeFileSync('tmpNode.png', data, 'binary');
}
})