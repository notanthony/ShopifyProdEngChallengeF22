Author: Anthony Zhao


# ON Replit
Please fork this replit https://replit.com/@notanthony1/ShopifyBackendChallengeF22?v=1 to use it. 



### PLEASE NOTE: 
My replit is public and I used an sqlite database. Meaning anyone can add entries into the DB. 


### To clear entries of a forked replit run the commands 


bin/rails c 


Item.delete_all


### Preamble:


Orginally this was written for ruby 3.1.2 (see below) but Replit uses a very old version of ruby. So I copied over my files into the replit base framework since I would have had to move my files into an older version regardless. Here is a link to the replit framework I forked https://replit.com/@replit/Rails-legacy. This github repo does not work when imported into replit even though it was download directly from replit. Instead fork my replit.




# ON Computer

NOTE: I used the default ruby framework to start off the project "rails g scaffold items name"


For this project you will need ruby 3.1.2 and Rails 7.0.3 (use the ruby3version branch) 


Navigate to the directory this project is in the terminal


cd /project/dir


run the following commands in the terminal


git checkout ruby3version


rails s


# Other notes
I made modifications (rest are from the templates I used) in the following files

### app


-> controllers -> items_controller.rb


-> services -> all files


-> model -> item.rb


### db


-> migrate -> all files


-> schema.rb


### config 

-> routes.rb




### ------------------------------------------------------------------------------------------------------------






# Rails on Replit

This is a template to get you started with Rails on Replit. It's ready to go so you can just hit run and start coding!

This template was generated using `rails new` (after you install the `rails` gem from the packager sidebar) so you can always do that if you prefer to set it up from scratch. The only had two make config changes we had to make to run it on Replit:

- bind the app on `0.0.0.0` instead of `localhost` (see `.replit`)
- allow all hosts (see `config/environments/development.rb`)
- allow the app to be iframed (see `config/application.rb`)

## Running the app

Simple hit run! You can edit the run command from the `.replit` file.

## Running commands

Start every command with `bundle exec` so that it runs in the context of the installed gems environment. The console pane will give you output from the server but you can run arbitrary command from the shell without stopping the server.

## Database

SQLite would work in development but we don't recommend running it in production. Instead look into using the built-in [Replit database](http://docs.replit.com/misc/database). Otherwise you are welcome to connect databases from your favorite provider. 

## Help

If you need help you might be able to find an answer on our [docs](https://docs.replit.com) page. Alternatively you can [ask in the community](https://replit.com/talk/ask). Feel free to report bugs [here](https://replit.com/bugs) and give us feedback [here](https://replit.com/feedback).


