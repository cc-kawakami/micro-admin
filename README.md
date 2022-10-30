# MicroAdmin

A Minimal Administration dashboard parts.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'micro_admin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install micro_admin

## Usage

```ruby
class ApplicationDashboard < MicroAdmin::Dashboard::Base
    # If you use with Ruby on Rails
    self.view_paths = [Rails.root.join("app", "views", "dashboards")]
end
```

```ruby
class UserDashboard < ApplicationDashboard
    def index_attributes
        [:id, :name]
    end

    def show_attributes
        [:id, :name]
    end

    def form_attributes
        [:name]
    end

    def model_class
        User
    end
end
```

`/app/views/dashboards/user_dashboard/new/name.erb`:

```html
<input type="text" name="name">
```

`/app/views/dashboards/user_dashboard/edit/name.erb`:

```html
<input type="text" name="name" value="<%= value %>">
```

```ruby
smith = User.new(id: 1, name: "Smith")
jams = User.new(id: 1, name: "Jams")
dashboard = UserDashboard.new
```

```erb
<%= dashboard.index(errors: [smith, jams]) %>
```

```erb
<%= dashboard.show(smith) %>
```

```erb
<%= dashboard.new(errors: ["Name is required!"]) %>
```

```erb
<%= dashboard.edit(id: 1, values: {name: "Smith"}, errors: []) %>
```

**You can decorate table and forms with [Bootstrap](https://getbootstrap.com/docs/5.0/getting-started/download/)!**

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/micro_admin. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the MicroAdmin project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/micro_admin/blob/master/CODE_OF_CONDUCT.md).
