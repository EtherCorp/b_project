# Project created with Rails

This project was created with the shell command:

```shell
rails new b_project --database=postgresql
```

## Changes

* Contains only initial scaffold provided for Rails, without aditional gems.
* Doesn't contains `config/cable.yml`, `config/database.yml` and `config/secrets.yml` files.
* Contains `config/cable.yml.default`, `config/database.yml.default` and `config/secrets.yml.default`. These files must be used in order to generate the .yml files.

## How to use

Firstly, you need use .default files as templates, and make the .yml files. If you need to modify them, please click [here](http://guides.rubyonrails.org/configuring.html) for more information.

Next, you must create a new secret_key, with shell command:

```shell
rake secret
```

Then, create database with command:

```shell
rake db:create
```

Finally, test the project with:

```shell
rails s
```

You should see a beauty welcome windows at [http://localhost:3000](http://localhost:3000) (maybe you should change url or port).

That's all!
