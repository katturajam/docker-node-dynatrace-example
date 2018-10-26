var Hapi = require("hapi");
const server = new Hapi.Server();

server.connection({"port": 3000 });

server.route({
  method: "GET",
  path: "/",
  handler: (request, response) => {
      response("Hello World");
  }
});


server.start(error => {
    if(error) {
        throw error;
    }
    console.log("Listening at " + server.info.uri);
});
