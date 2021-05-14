function prompt() {

    var username = "";
    var user = db.runCommand({
        connectionStatus: 1
    }).authInfo.authenticatedUsers[0];

    if (!!user) {
        username = user.user;
    } else {
        username = "anonymous";
    }

    var database = db.getName();

    return `${username}:${database} >`;
}
