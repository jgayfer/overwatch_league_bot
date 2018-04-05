# Overwatch League Bot

Overwatch League Bot is a Discord bot that deals with everything related to the Overwatch League. This project is currently unfinished, but work is in progress.

## Setup Guide

```
bundle install
bundle exec rake db:create
```

If a previous database already exists, migrations may need to be run

```
bundle exec db:migrate
```

Once the database is initialized, the bot can be run with

```
bundle exec ruby lib/overwatch_league_bot.rb
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jgayfer/overwatch_league_bot.

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).