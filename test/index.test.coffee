should = require 'should'
uidUtil = require '../src'

HEX_CHARS =
  ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]

describe "uid-util", ->
  describe "create()", ->
    it "should have the form XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX", ->
      uid = uidUtil.create()
      should.exist(uid)
      uid.should.be.a("string").with.lengthOf(36)
      for i in [0..35]
        c = uid.charAt i
        if i in [8, 13, 18, 23]
          c.should.eql "-"
        else
          HEX_CHARS.should.include c