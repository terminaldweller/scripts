"use strict";

config.set("editor", "vim");
config.set("enableTelemetry", false);
config.set("inspectDepth", 8);
config.set("historyLength", 5000);

{
  const hostnameSymbol = Symbol("hostname");
  prompt = () => {
    if (!db[hostnameSymbol]) db[hostnameSymbol] = db.serverStatus().host;
    return `\x1b[38;5;63m${ISODate().toLocaleTimeString()} \x1b[38;5;24m${db.getName()}\x1b[38;5;24m@${
      db[hostnameSymbol]
    }\x1b[38;5;22m Uptime:${db.serverStatus().uptime}\x1b[38;5;26m Documents:${
      db.stats().objects
    }\x1b[38;5;109m V:${db.version()} \n \x1b[38;5;30m>>>\x1b[0m`;
  };
}

function get_mangas() {
  return db.mangas.find();
}

function get_animes() {
  return db.animes.find();
}

function get_movies() {
  return db.movies.find();
}

function get_stash() {
  return db.stash.find();
}
