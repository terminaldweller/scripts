
const fetch = require('node-fetch')
const fs = require("fs")
const util = require("util")
const readFile = util.promisify(fs.readFile)

async function JSON_POST_req(data,options) {
  var dummy = {"source": data.toString(), "options":"{}"}
  return await {method:"POST", body:JSON.stringify(dummy), headers:{"Content-Type":"application/json"}}
}

function compiler_explorer(data, options) {
    JSON_POST_req(data, options).then(post_arg=>
    fetch("https://godbolt.org/api/compiler/g92/compile?options=-O3", post_arg)).then(res=>
    res.text()).then(body=>
      console.log(body.split("\n").slice(1,body.split("\n").length).join("\n"))).catch(error=>
        console.log(error))
}

const config = JSON.parse(fs.readFileSync("./ceconfig.json"))
compiler_explorer(process.argv[2], config)
