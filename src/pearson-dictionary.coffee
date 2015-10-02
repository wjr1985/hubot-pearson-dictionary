# Description:
#   Defines words using the Pearson Dictionary API
#
# Configuration:
#   PEARSON_API_KEY - Your Pearson API key
#
# Commands:
#   hubot define me <word> - Defines the word specified
#
# Notes:
#   You'll need to get an API key from http://developer.pearson.com/content-apis/get-started. It's free!
#
# Author:
#   wjr1985

module.exports = (robot) ->
  robot.respond /define( me)? (.*)/i, (msg) ->
    word = msg.match[2]

    if process.env.PEARSON_API_KEY == undefined
      msg.send "API keys not set up properly. Sorry!"
      return

    query = {apikey: process.env.PEARSON_API_KEY, headword: word}
    msg.http("https://api.pearson.com:443/v2/dictionaries/laad3/entries")
      .query(query)
      .get() (err, res, body) ->
        if err
          msg.send "Error: Unable to reach server"
          return
        if res.statusCode isnt 200
          msg.send "Error #{res.statusCode} - Too many words?"
          return

        definitions = JSON.parse(body)
        message = ""
        if definitions.count <= 0
          msg.send "Word \"#{word}\" not found!"
          return

        parsed_definitions = []
        message = "#{word}:\n"
        for result in definitions.results
          if result.headword.toUpperCase() == word.toUpperCase()
            part_of_speech = result.part_of_speech

            continue if result.senses == null

            senses = result.senses[0]
            definition = senses.definition
            example = if senses.examples then senses.examples[0].text else null

            continue if definition == undefined

            parsed_definition = "- (#{part_of_speech}) #{definition}"
            parsed_definition += ": #{example}" if example
            parsed_definitions.push parsed_definition

        if parsed_definitions.length <= 0
          msg.send "Word \"#{word}\" not found!"
          return

        message += parsed_definitions.join "\n"
        msg.send message
