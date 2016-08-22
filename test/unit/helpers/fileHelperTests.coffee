should = require "should"
assert = require "assert"
InMemoryFileAdapter = require "../../../helpers/inMemoryFileAdapter"
FileHelper = require("../../../helpers/fileHelper")

describe "FileHelper Tests", -> 
    data = {
        fileName: "file.txt",
        type: "base64",
        content: "Some text content is here",
        handlerStub: (err, data) ->
    }
    data.buffer = new Buffer(data.content);
    data.content64 = data.buffer.toString(data.type);
    fileHelper = null
    inMemoryFileAdapter = null
    before -> 
        inMemoryFileAdapter = new InMemoryFileAdapter()
        fileHelper = new FileHelper(inMemoryFileAdapter);
    
    describe "Creation", ->
        it "creates a valid object", ->
            fileHelper.isOk().should.be.true()
        
        it "fails on empty input fileAdapter", ->
            ctr = () -> new FileHelper()
            ctr.should.throw(assert.AssertionError)
            
    describe "loadFile", ->
        it "loads content from fileAdapter storage with base64 to text conversion", (done) ->
            fileAdapter = new InMemoryFileAdapter()
            fileAdapter.files[data.fileName] = data.content64
            localFileHelper = new FileHelper(fileAdapter)
            content = localFileHelper.loadFile data.fileName, data.type, (err, content) ->
                content.should.equal(data.content64)
                done()
        
        it "fails on empty fileName", ->
            f = () -> fileHelper.loadFile(null, data.type, data.handlerStub)
            f.should.throw(assert.AssertionError)
            
        it "fails on empty type", ->
            f = () -> fileHelper.loadFile(data.fileName, null, data.handlerStub)
            f.should.throw(assert.AssertionError)
            
        it "fails on empty handler", ->
            f = () -> fileHelper.loadFile(data.fileName, data.type, null)
            f.should.throw(assert.AssertionError)
            
    describe "saveFile", ->
        it "saves content to fileAdapter storage", (done) ->
            fileAdapter = new InMemoryFileAdapter()
            localFileHelper = new FileHelper(fileAdapter)
            localFileHelper.saveFile data.fileName, data.content, (err) -> 
                fileAdapter.files[data.fileName].should.equal(data.content)
                done()
        it "fails on empty fileName", ->
            f = () -> fileHelper.saveFile(null, data.content, data.handlerStub)
            f.should.throw(assert.AssertionError)
            
        it "fails on empty data", ->
            f = () -> fileHelper.saveFile(data.fileName, null, data.handlerStub)
            f.should.throw(assert.AssertionError)
            
        it "fails on empty handler", ->
            f = () -> fileHelper.saveFile(data.fileName, data.content, null)
            f.should.throw(assert.AssertionError)