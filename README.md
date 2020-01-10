# ActiveRecord::LoggerAttributes

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/active_record/logger_attributes`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-logger_attributes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-logger_attributes

## Usage

First, create a column to hold your log messages:

```ruby
class AddActivityLogToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :activity_log, :text, array: true, default: []
  end
end
```

Add the `logger_attr` to your model:

```ruby
class BlogPost < ActiveRecord::Base
  logger_attr :activity_log
end
```

Write to the logger as you normally would:

```ruby
@post = BlogPost.new
@post.activity_log_logger.info "Setting up new blog post"
@post.save
```

All of the options supported by [activemodel-logger_attributes](https://github.com/chrisb/activemodel-logger_attributes) are supported here with a few additions:

```ruby
logger_attr :activity_log, update_on_write: true
```

If the `update_on_write` option is enabled (`true` by default) the log column will be updated immediately when new messages are pushed to the logger (internally this happens via [`update_column`](http://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-update_columns) so beware caveats, however this is generally what you want) _if the model is already persisted_, otherwise database updates will happen conventionally via `save`.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActiveRecord::LoggerAttributes project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/activerecord-logger_attributes/blob/master/CODE_OF_CONDUCT.md).
