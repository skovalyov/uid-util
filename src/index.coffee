# Valid UID chars
HEX_CHARS =
  ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]

# Return random UID char
getRandomChar = () -> HEX_CHARS[Math.floor(Math.random() * 16)]

module.exports =
  # Create UID
  create : () ->
    uid = ""
    uid += getRandomChar() for i in [0..7]
    for i in [0..2]
      uid += "-"
      for j in [0..3]
        uid += getRandomChar()
    uid += "-" + ("0000000" + new Date().getTime().toString(16).toUpperCase()).substr -8
    uid += getRandomChar() for i in [0..3]
    return uid