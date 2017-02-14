# Customer Support App

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

## Build
Run the following the command to build the app front-end in the project_root/public
```
grunt build --gruntfile client/Gruntfile.js
```

## Assumptions
The application is designed as a standard customer support application.
Some common-sense assumptions have been taken to fill the gap in the spec.
Below is the list of a few of those assumptions:
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

## Requirements Covered

All the requirements in the spec have been covered. They are listed below.
* A web portal for customers to login, create support requests and view status of their previous support requests
* A web portal for support agents to view and close the support requests assigned to them
* PDF-exportable report of requests closed in last one month
* Ability for admins to manage other users and support requests

## Running the app

After installing all the dependencies, the app can be run by executing the following commands:
```
cd client
grunt serve
```
Open `localhost:9000` to view the app

## Issues faced while completing the assignment

### Exporting report in PDF
The straightforward approach to export a pdf is to save it to the server and provide the client with the url. But this approach is prone to unauthorized access of the report file. To circumvent this issue, a file-streaming based solution was implemented. Upon requesting the report, pdf data is streamed to the client which then parses the data as a blob and creates an objectURL. The objectURL is then used to have the file download in the browser.

## Feedback for improving the assignment
It would be good to have some sample data in CSV format for importing to the database as seed. It would help in understanding the system requirements in a better manner.
