var expect =  chai.expect;

describe('IdeasIndex', function () {
  beforeEach(function () {
    sinon.spy($, 'ajax');
    this.requests = [];
    this.xhr = sinon.useFakeXMLHttpRequest();
    this.xhr.onCreate = function (req) { this.requests.push(req); }.bind(this);
  });

  afterEach(function () {
    $.ajax.restore();
    //this.xhr.restore();
  });

  describe('renderAllideas', function() {
    beforeEach(function() {
      this.server = sinon.fakeServer.create();
    }),

    afterEach(function(){
      this.server.restore();
    })

    it('appends all ideas to the dom', function() {

      var ideas = JSON.stringify([
        { id: 1, title:"great", body:"idea", quality: 1 },
        { id: 2, title:"good", body:"idear", quality: 2 }
      ]);

      renderAllIdeas();

      this.server.requests[0].respond(200,{ "Content-type": "application/json" }, ideas)
      expect($('#ideas').length, 2, "It should append two ideas to the dom")
    })
  })
});
