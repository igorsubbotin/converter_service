chai = require "chai"
chai.use(require('chai-shallow-deep-equal'))
should = chai.should()
Plugin = require("../../../../models/models").plugin;
options = require("../../../../models/plugin/options");

describe "Plugin Model Tests", ->
    plugin = null
    data = null
    
    before ->
        data = {
            id: '463B46AF-C612-4e53-8E0F-63FD23B3679F',
            formatDisplayName: 'CSV',
            options: [options.dateFormat, options.decimalDelimiter, options.header, options.separator]
        }        
        plugin = new Plugin(data.id, data.formatDisplayName, data.options)
    
    describe "Creation", ->
        it "creates a model instance with correct properties", ->
            plugin.should.shallowDeepEqual(data)
    
    describe "clone", ->
        it "returns a new object", ->
            clone = plugin.clone()
            clone.id += "_changed_id"
            clone.options[0].title = "_change_title"
            clone.id.should.not.be.equal(plugin.id)
            clone.options[0].title.should.not.be.equal(plugin.options[0].title)
            
        it "creates an object with properties equal to source object", ->
            clone = plugin.clone()
            clone.should.shallowDeepEqual(plugin)