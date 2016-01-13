// Defines the function that allows Do-Tell
// to track events on the site

var doTell = {};
  doTell.report = function(eventName){
    var event = {event: { name: eventName}};

    var request = new XMLHttpRequest();
    // use in production
    request.open("POST", "https://do-tell-sir.herokuapp.com/api/events", true);

    // use for local testing
    // request.open("POST", "http://localhost:3000/api/events", true);

    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  }
