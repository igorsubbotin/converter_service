should = require "should"
getFileHelper = require "../../../configuration/getFileHelper"

describe "getFileHelper Tests", -> 
    it "creates valid fileHelper", ->
        fileHelper = getFileHelper()
        fileHelper.isOk().should.be.true()