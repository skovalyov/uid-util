# Valid UID chars
HEX_CHARS =
  ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]

defaultOptions =
  uppercase: true
  braces: false
  hyphens: true

# Return random UID char
getRandomChar = () -> HEX_CHARS[Math.floor(Math.random() * 16)]

module.exports =
  # Create UID
  create : (options) ->
    options = options || defaultOptions
    uid = ""
    uid += getRandomChar() for i in [1..8]
    uid += "-" if options.hyphens
    uid += getRandomChar() for j in [1..4]
    uid += "-" if options.hyphens
    uid += getRandomChar() for j in [1..4]
    uid += "-" if options.hyphens
    uid += getRandomChar() for j in [1..4]
    uid += "-" if options.hyphens
    uid += ("0000000" + new Date().getTime().toString(16)).substr(-8)
    uid += getRandomChar() for i in [1..4]
    uid = uid.toUpperCase() if options.uppercase
    uid = "{#{uid}}" if options.braces
    return uid