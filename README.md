# Overwatch League Bot

Overwatch League Bot is a Discord bot that deals with everything related to the Overwatch League. This project is currently unfinished, but work is in progress.

## Setup Guide

Install dependencies:
```
bundle install
```

Initialize the database:
```
bundle exec rake db:migrate
```

Make a new file at `config/bot.yml` and add your bot's token to it. You can use `config/example.bot.yml` as a guide for how this file should look.

Run the bot!
```
bundle exec ruby app.rb
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jgayfer/overwatch_league_bot.

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).