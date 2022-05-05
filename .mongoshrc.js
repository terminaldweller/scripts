{
  const hostnameSymbol = Symbol("hostname");
  prompt = () => {
    if (!db[hostnameSymbol]) db[hostnameSymbol] = db.serverStatus().host;
    return `\x1b[38;5;22m${db.getName()}\x1b[38;5;24m@${
      db[hostnameSymbol]
    }\x1b[38;5;22m:Uptime:${db.serverStatus().uptime}:Documents:${
      db.stats().objects
    } >>>\x1b[0m`;
    ;
  };
}
