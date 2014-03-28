# Helpdesk [![Code Climate](https://codeclimate.com/github/wacaw/helpdesk.png)](https://codeclimate.com/github/wacaw/helpdesk) [![Build Status](https://travis-ci.org/wacaw/helpdesk.svg?branch=master)](https://travis-ci.org/wacaw/helpdesk) [![Gem Version](https://badge.fury.io/rb/helpdesk.png)](http://badge.fury.io/rb/helpdesk)
Helpdesk is a Rails engine that provides simple helpdesk functionality directly into your site.



## <a name="demo"></a>Demo

[http://helpdesk-demo.herokuapp.com](http://helpdesk-demo.herokuapp.com)

Source of demo: [https://github.com/wacaw/helpdesk-demo](https://github.com/wacaw/helpdesk-demo).

## Installation
### 1. Install helpdesk gem
In your `Gemfile`, add the following dependencies:
In <b>Rails 3</b>, add this to your Gemfile and run the +bundle+ command.

```ruby
gem "helpdesk", '0.0.14'
```

In <b>Rails 4</b>, add this to your Gemfile and run the +bundle+ command.

```ruby
gem "helpdesk", ">= 0.0.20"
```
### 2. Run installation

```
rails g helpdesk:install
```
That creates a Helpdesk initializer and copy locale files to your application.

### 3. Add 3 methods to your applications application_controller.rb
   * helpdesk_user - to exposes your current_user
   * helpdesk_admin? - to check privileges
   * helpdesk_admins_collection - to list all admin

Example, for app with devise&rolify gems:
```ruby
class ApplicationController < ActionController::Base
[...]
      helper_method :helpdesk_user,:helpdesk_admin?,:helpdesk_admin_collection
      def helpdesk_user
        current_user
      end

      def helpdesk_admin?
        current_user.has_role? :admin
      end

      def helpdesk_admin_collection
        (Helpdesk.user_class).with_role(:admin)
      end
end
```

### 4. Restart app
and visit http://localhost:3000/helpdesk



License
-------

MIT

