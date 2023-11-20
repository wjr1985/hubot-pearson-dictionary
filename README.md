# No longer being maintained

I'm unsure how to get an API key anymore (developer.pearson.com no longer resolves), so I won't be maintaining this anymore. Thanks for using it!

# hubot-pearson-dictionary

A Hubot script that uses Pearson's Dictionary API to define words. Requires an API key from [http://developer.pearson.com/content-apis/get-started](http://developer.pearson.com/content-apis/get-started).

If you run into any issues when using this, please file a GitHub issue, as there may be some edge cases that I missed.

See [`src/pearson-dictionary.coffee`](src/pearson-dictionary.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-pearson-dictionary --save`

Then add **hubot-pearson-dictionary** to your `external-scripts.json`:

```json
[
  "hubot-pearson-dictionary"
]
```

## Sample Interaction

```
user1>> hubot define sticker
hubot>> sticker:
        - (noun) a small piece of paper or plastic with a picture or writing on it that you can stick on to something
user2>> hubot define me ice
hubot>> ice:
        - (noun) water that has frozen into a solid state: Drive carefully – there’s ice on the road.
        - (phrasal verb) to cover a cake with icinga mixture made of liquid and sugar
```

## Etc

This script isn't affiliated with Pearson in any way.
