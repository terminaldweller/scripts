
const fetch = require('node-fetch')
const fs = require("fs")
const util = require("util")
const readFile = util.promisify(fs.readFile)
const path = require("path")
const defaultOpts = {
"userArguments":"-O3", "filters":
  {"binary":false,
    "commentOnly":true,
    "demangle":true,
    "directives":true,
    "execute":false,
    "intel":true,
    "labels":true,
    "lables":true,
    "libraryCode":false,
    "trim":false
  }
}

async function read_C_source(path) {
  return await readFile(path, "utf-8")
}

function JSON_POST_req(data, options) {
  const config = fs.readFileSync(options, "utf-8")
  var dummy = {"source": data, "options": JSON.parse(config)}
  /* if no config found, then run default
  var dummy = {"source": data, "options": defaultOpts}
  */
  return {method:"POST", body:JSON.stringify(dummy), headers:{"Content-Type":"application/json"}}
}

function compiler_explorer(path, options) {
  read_C_source(path).then(data=>
    JSON_POST_req(data, options)).then(post_arg=>
    fetch("https://godbolt.org/api/compiler/g92/compile", post_arg)).then(res=>
    res.text()).then(body=>
      console.log(body.split("\n").slice(1,body.split("\n").length).join("\n"))).catch(error=>
        console.log(error))
}

if (process.argv.length < 3) {console.log("you did not specify enough args. needs two. path to source code and path to options to pass to compiler explorer.")}
else {compiler_explorer(process.argv[2], process.argv[3])}
