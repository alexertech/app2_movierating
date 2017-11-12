# Movie rating

### Goal

- CRUD for movies and users
- A user can login / logout 
- Only a logged user can create / edit / delete movies
- Non registered users only can see the movie listing
- Form for up / down vote and comment

## Model

**Movie**
```
name:string
summary:string
```

**User**
```
email:string
password:string
```

**Rating**
```
vote:integer   (1 up, 2 down)
comment:string
user:references
movie:references
```

## Building
Create the rails app:

`rails new MovieRating`

Update the Gemfile to add a couple of gems to our project:

```
gem 'bootstrap-sass', '~> 3.3.6'
gem 'jquery-rails'
```

Now, using the marvel of rails,  we can quickly build the base of our project creating the CRUD’s with Scaffolding:

```
$ rails genereate scaffold Movie name:string summary:string
$ rails generate scaffold User email:string passwd:string
```

This will do all the job for routing / model / controller and views.

Add some seeds:

*db/seeds.rb*
```ruby
Movie.create(name: 'Star Wars', summary: 'In a distant galaxy, the empire, pew pew.')
Movie.create(name: 'Matrix', summary: 'The one, and a super computer whatever.')
Movie.create(name: 'Pacific Rim', summary: 'Robots vs monsters FTW.')

User.create(email: 'alex@local', password: 'hola')
```

Update the routes, so our start page is the movie index:

*db/routes.rb*
```
root 'movies#index"
```

And lets test the application, first build the database, then add the seed records and start the server:

```
$ rake db:migrate
$ rake db:seed

$ rails s
```

Quick and simple, we now have "/movies" for our movie index, and "/users" for our registered users.

For the sake of the example, we are going to add a couple of links to switch between the users and the movies:

**app/views/layout/application.html.erb**
```html
  <body>

    <%= yield %>

    <br>
    <p>
    	<%= link_to 'Movies', movies_path %> | 
    	<%= link_to 'Users', users_path %>
    </p>
  </body>
```

# User sessions
Now to the interesting part, lets restrict the create / edit / delete actions and force that a user must be logged. 

Create a controller for the sessions:

`rails generate controller Sessions new create destroy`

This time will create the controller with two defined actions: create and destroy.

Next fix the routing:

```ruby
  # Session maagement
  get  "/login"  => "sessions#new"     , as: :login
  post "/login"  => "sessions#create"
  get  "/logout" => "sessions#destroy" , as: :logout
```

We can delete the extra pages in views/sessions, since we are going to use only the **new.html.erb**, lets create a Login form there. Note that we don’t use *form_for*, we use **form_tag** to redirect the action exactly where we need:

```ruby
<%= form_tag login_path do%>

    <%=label_tag :email %>
    <%=text_field_tag :email %>

    <%=label_tag :password %>
    <%=text_field_tag :passwd %>

    <%=submit_tag %>

<% end %>

<%= link_to 'back', movies_path %>
```

Now in the sessions controller:

```ruby
class SessionsController < ApplicationController
    
    def new
    end
    
    def create
        user = User.authenticate(params[:email], params[: passwd])
        if user
            session[:user_id] = user.id
            redirect_to movies_path
        else 
           redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to login_path
    end

end
```

The special part of this code is: **User.authenticate**, a method for the model **User**. We can see also that if the auth is incorrect or the session closed we redirect the user to **login_path**, the only view we have for the sessions.

*app/model/User.rb*

```ruby
class User < ApplicationRecord

    def self.authenticate(email, passwd)

        user = User.where(email: email).first

        if user && user.passwd == passwd
            user
        else
            nil
        end
    end

end

```

We added the method authenticate to the User class.

To follow the user and lock the items we want on the site, we need to create  a couple of helper functions at *application_controller.rb*:

```ruby
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to login_path unless current_user
  end

end

```

If there is no current user at the time of the authorize, we redirect to the login screen. 

Finally, lets restrict the usage of the items we want on the Movies:

*app/controllers/movies_controller.rb**
```ruby
class MoviesController < ApplicationController

    before_action :authorize, only: [:new, :create, :edit, :update, :destroy]
.
.
.
```

Add a Login and Logout items to the application layout and go to test the application:

```ruby
    <p>
    <%= link_to 'Movies', movies_path %> | 
    <%= link_to 'Users', users_path %> |

    <% if current_user %>
        <%=link_to 'Logout', logout_path%>
    <% else %>
        <%=link_to 'Login', login_path%>
    <% end %>

    </p>
```

Our current_user helper will be in charge of all the information related to the logged user.

`before_action :authorize`

To wrap up, add this to the user_controller, so a non-registered user can’t do any actions on the users itself:

# Password encryption

See [app3 - job board](https://github.com/alexertech/app3_jobsboard), for how to apply BCRYPT to this scheme.

# Up/Down vote and comment

Work to do... someday :)