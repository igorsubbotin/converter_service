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