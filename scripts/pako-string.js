// var file = 'src/assets/pako.min.js'
var file = 'src/bitmap/js/nodeRequest.js'
require('fs').writeFileSync('tmp.txt', JSON.stringify(require('fs').readFileSync(file).toString()))