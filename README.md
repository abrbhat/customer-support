# Customer Support App
A sample app for Rails + Angular stack

## Features

* A web portal for customers to login, create support requests and view status of their previous support requests
* A web portal for support agents to view and close the support requests assigned to them
* PDF-exportable report of requests closed in last one month
* Ability for admins to manage other users and support requests

## Assumptions
The application is designed as a standard customer support application.
Some common-sense assumptions have been taken. Below is the list of a few of those assumptions:
* The customers can register and login
* The customers can create support requests and view status of their previous requests
* The customers can close their own previous support requests
* The customers can re-open their previous closed support requests
* The agents can login but cannot register themselves
* The agents can close but not re-open support requests
* The admins can create other agents and admins but not other customers
* The admins can close support requests but not delete any support requests
* The admins can remove any agents and admins but not customers
* The last agent and admin cannot be removed

## Architecture

### Back-end
The Back-end of the application is a Ruby on Rails API. The API is based on the REST architecture and responds with JSON. The API follows the standard MVC design pattern.

### Front-end
The source code for the front-end AngularJS SPA resides in project_root/client. Building it with grunt results in the built being stored in project_root/public. This enables the Ruby on Rails server to serve the web pages directly without involving the asset pipeline. The front-end communicates with back-end through the REST API provided by the back-end.

The Angular App is divided into components and models.
* A component consists of a controller and a template. It handles logic related to an individual state.
* A model is a factory containing business logic related to a particular entity.

## Installation
The app consists of Ruby on Rails back-end and AngularJS front-end

### Back-end
Installation links for various dependencies are provided:
* [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
* [Rails](http://guides.railsgirls.com/install#setup-for-linux)
* [MySQL](https://www.tutorialspoint.com/mysql/mysql-installation.htm)

After installing Rails and MySQL, execute the following command in project_root/
```
bundle install
```

### Front-end
Installation links for various dependencies are provided:
* [nodejs](https://nodejs.org/en/download/package-manager/)
* [npm](http://blog.npmjs.org/post/85484771375/how-to-install-npm)
* [bower](https://bower.io/#install-bower)

After installing npm and bower, execute the following commands in project_root/
```
cd client
npm install
bower install

npm install -g grunt-cli karma-cli
```

## Initialization
Run the following the command to initialize the database
```
rails db:setup
```

## Test
Most of the test-coverage of the app is through end-to-end tests implemented
with Capybara. Some back-end unit-tests are also implemented with RSpec. To run
them, execute the following command in project_root/
```
rspec spec/
```
A few front-end tests are also implemented with Karma. The Karma tests are present only
as a proof-of-concept since the front-end functionality has been amply covered
through the end-to-end tests. To run them, run the following command in project_root/client/
```
karma start test/karma.co.js
```

## Build
Run the following the command to build the app front-end in the project_root/public
```
grunt build --gruntfile client/Gruntfile.js
```

## Running the app

After installing all the dependencies, the app can be run by executing the following commands:
```
cd client
grunt serve
```
Open `localhost:9000` to view the app

## Demo

https://customer-support-84625.herokuapp.com/

### Test credentials:
#### Admin:
Username: admin1@test.com,
Password: password

#### Agent:
Username: agent1@test.com,
Password: password

#### Customer:
Username: customer1@test.com,
Password: password
