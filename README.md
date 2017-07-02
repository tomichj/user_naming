# UserNaming

UserNaming is a simple gem that provides a 'name' column and some standardized way to deal with user's names in
rails applications.

This isn't a big gem: it's a migration and a module with 4 or 5 methods that you include in your 'user' class. 
But, it lets me deal with user's names in the same way in every application I build. Over time, this pays off.

This gem currently supports rails 5 and beyond; adding 4.2 support is trivial, but would also require
adding an `appraisal` configuration. Open for PRs if interested.


## Installation

Add this line to your application's `Gemfile` and run `bundle install` to install it:

```ruby
gem 'user_naming'
```

Then run the UserNaming install generator:

```sh
rails generate user_naming:install
```

If your user model is not `User`, you can (optionally) specify a user model with the `--model` flag. For example,
if your user model class is `Person`:

```sh
rails generate user_naming:install --model Person
```

After you've run the install generator, apply the migration that was just generated:
```sh
rails db:migrate
```

The generator does the following:

* Insert `include UserNaming::User` into your `User` model.
* Create a migration to add a `name` column to your `User` table.


## Usage

UserNaming supports setting the user's name as one field via `name=`.

Non-mutating accessors to read the user's name in different formats are provided: 

- name
- first_name
- last_name
- initials
- first_name_last_initial

That's it!


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tomichj/user_naming. 

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

