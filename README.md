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
    # example:
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
<input type="text" name="name" class="form-control">
```

`/app/views/dashboards/user_dashboard/edit/name.erb`:

```html
<input type="text" name="name" value="<%= value %>" class="form-control">
```

```ruby
smith = User.new(id: 1, name: "Smith")
james = User.new(id: 1, name: "James")
dashboard = UserDashboard.new
```

```erb
<%= dashboard.index([smith, james]) %>
```

output:
```html
<header class="navbar border-bottom p-4">
  <h2 class="m-0">User</h2>
  <div>
    <a href="/admin/user/new" class="btn btn-primary">
      new
    </a>
  </div>
</header>

<main class="p-4">
  <table class="table">
    <thead>
      <tr>
        <th scope="col">id</th>
        <th scope="col">name</th>
        <th scope="col">show</th>
        <th scope="col">edit</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>Smith</td>
        <td><a href="/admin/user/1">show</a></td>
        <td><a href="/admin/user/1/edit">edit</a>
        </td>
      </tr>
      <tr>
        <td>2</td>
        <td>James</td>
        <td><a href="/admin/user/2">show</a></td>
        <td><a href="/admin/user/2/edit">edit</a>
        </td>
      </tr>
    </tbody>
  </table>
</main>
```


```erb
<%= dashboard.show(smith) %>
```

output:

```html
<header class="navbar border-bottom p-4">
  <h2 class="m-0">Show User</h2>
  <div>
    <a href="/admin/user" class="btn btn-primary">
      Back
    </a>
  </div>
</header>

<main class="p-4">
  <dl>
    <dt>id></dt>
    <dd>1</dd>
    <dt>name</dt>
    <dd>Smith</dd>
  </dl>
</main>
```

```erb
<%= dashboard.new(errors: ["Name is required!"]) %>
```

output:
```html
<header class="navbar border-bottom py-4">
  <h2 class="m-0">Create User</h2>
  <div>
    <a href="/admin/user" class="btn btn-primary">
      Back to index
    </a>
  </div>
</header>
<main class="p-4">
  <ul class="alert alert-danger">
    <li class="ml-3">Name is required</li>
  </ul>
  <form method="post" action="/admin/user">
    <div class="mb-3">
      <label for="name" class="form-label">name</label>
      <input type="text" name="name" class="form-control"/>
    </div>
  </form>
</main>
```

```erb
<%= dashboard.edit(id: 1, values: {name: "Smith"}, errors: []) %>
```

output:
```html
<header class="navbar border-bottom py-4">
  <h2 class="m-0">Create User</h2>
  <div>
    <a href="/admin/user" class="btn btn-primary">
      Back to index
    </a>
  </div>
</header>
<main class="p-4">
  <form method="patch" action="/admin/user/1">
    <div class="mb-3">
      <label for="name" class="form-label">name</label>
      <input type="text" name="name" value="test" class="form-control"/>
    </div>
  </form>
</main>
```

**You can decorate table and forms with [Bootstrap](https://getbootstrap.com/docs/5.0/getting-started/download/)!**

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cc-kawakami/micro_admin. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the MicroAdmin project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/cc-kawakami/micro_admin/blob/master/CODE_OF_CONDUCT.md).
