var should = require("should"),
    request = require("supertest"),
    app = require('../app.js'),
    agent = request(app);
    
describe('Plugin Crud Test', function() {
    it('Should work and return 200 status', function(done) {
        agent.get('/api/plugins')
            .expect(200)
            .end(function(err, results) {
                done();
            });
    });
});