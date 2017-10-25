# Project created with Rails

This project was created with the shell command:

```shell
rails new b_project --database=postgresql
```

## How to use

Firstly, you need use .default files as templates, and make the config/\*.yml and .env files with them. If you need to modify them, please click [here](http://guides.rubyonrails.org/configuring.html) for more information.

Next, you must create a new secret_key, with shell command:

```shell
rake secret
```

Then, create database with command:

```shell
rake db:create
```

And then, execute migrations (if it is required):

```shell
rake db:migrate
```

Finally, test the project with:

```shell
rails s
```

You should see a beauty welcome windows at [http://localhost:3000](http://localhost:3000) (maybe you should change url or port).

That's all!
