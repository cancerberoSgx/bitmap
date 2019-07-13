var s = require('fs').readFileSync('haxelib.json').toString()
var o = JSON.parse(s)
var a = o.version.split('.')
var i = parseInt(a[a.length-1])
a[a.length-1] = i+1
o.version = a.join('.')
require('fs').writeFileSync('haxelib.json', JSON.stringify(o, null, 2))