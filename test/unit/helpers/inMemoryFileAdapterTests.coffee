chai = require "chai"
should = chai.should()
InMemoryFileAdapter = require "../../../helpers/inMemoryFileAdapter"

describe "InMemoryFileAdapter Tests", -> 
    it "puts data in internal storage", (done) ->
        inMemoryFileAdapter = new InMemoryFileAdapter()
        fileName = "file.txt"
        content = "file_content"
        inMemoryFileAdapter.saveFile fileName, content, (err, data) ->
            inMemoryFileAdapter.files[fileName].should.be.equal(content)
            done()
    
    it "loads data from internal storage", (done) ->
        inMemoryFileAdapter = new InMemoryFileAdapter()
        fileName = "file.txt"
        content = "file_content"
        inMemoryFileAdapter.saveFile fileName, content, () ->
        inMemoryFileAdapter.loadFile fileName, (err, data) ->
            data.should.be.equal(content)
            done()
            
    it "returns error on file load if option is enabled", (done) ->
        inMemoryFileAdapter = new InMemoryFileAdapter(true, false)
        fileName = "file.txt"
        inMemoryFileAdapter.loadFile fileName, (err, data) ->
            err.should.be.ok
            done()
            
    it "returns error on file save if option is enabled", (done) ->
        inMemoryFileAdapter = new InMemoryFileAdapter(false, true)
        fileName = "file.txt"
        inMemoryFileAdapter.saveFile fileName, null, (err, data) ->
            err.should.be.ok
            done()