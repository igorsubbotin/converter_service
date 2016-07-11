var should = require("should"),
    request = require("supertest"),
    app = require('../app.js'),
    agent = request(app);
    
describe('Convert Crud Test', function() {
    it('Should work and return 200 status', function(done) {
        agent.get('/api/converts')
            .expect(200)
            .end(function(err, results) {
                done();
            });
    });
});