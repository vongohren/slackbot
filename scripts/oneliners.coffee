# Description:
#   Cracking sick oneliners.
# 
# Dependencies
#   Lodash
#
# Commands:
#   hubot crack me up - Scrapes reddit.com/r/oneliners monthly top list and returns a random oneliner.
#
cheerio = require 'cheerio'
_       = require 'lodash'

module.exports = (robot) ->
  robot.respond /(crack me up)/i, (msg) ->
    robot.http("http://www.reddit.com/r/oneliners.json?limit=100&sort=top&t=year")
      .get() (err, res, body) ->
        msg.send _.sample(_.map(JSON.parse(body).data.children, (redditPost) -> redditPost.data.title))
