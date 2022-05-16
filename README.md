Author: Anthony Zhao
### Preface


I forked my own repo, https://github.com/notanthony/ShopifyBackendChallengeF22, I built off the ruby 3.1.2 version. Then for Replit I forked my own replit, https://replit.com/@notanthony1/ShopifyBackendFall2022, and copied in the new changes I added. The code I wrote is identical however, they run on different versions so the Github code may not run on Replit and the code from Replit may not run on Github. For specifc usage instructions please see the sections below.

I made modifications in the following files, this includes the changes I made in the forks. 

You can also look at the Weather API Integration commit to see the exact changes I made for the api integration

###### app

-> apis -> all files


-> controllers -> items_controller.rb


-> services -> all files


-> model -> item.rb


###### db


-> migrate -> all files


-> schema.rb


###### config 

-> routes.rb


-> application.rb


### Replit 

###### Introduction

The main branch is a download of the code from Replit. Although I downloaded the code directly from Replit it does not import back into Replit properly. 


###### Replit Usage


In order to run the Replt code you can use the public replit here: https://replit.com/@notanthony1/ShopifyBackendFall2022. You can also fork my replit if you want to modify it. 

###### Forked Replits 

I used a SQLite database and the replit is public so anyone can add entries into the DB. These DB changes may persit in the forked version. If you want to clear the DB run the following commands. My replit has my key in the enviroment variables but if you want to fork it you need to add your own.


bin/rails c 


Item.delete_all


### PC Usage

###### Introduction

I used the default ruby framework to start off the project "rails g scaffold items name"


For this project you will need ruby 3.1.2 and Rails 7.0.3 and you need to clone the repo and switch to the ruby3version!

###### Usage


Navigate to the directory this project is in using the terminal


cd /project/dir


run the following commands in the terminal


git checkout ruby3version


rails s


On pc you need to add an openweather api key to your enviroment variables as WEATHER_API_KEY. Detailed instructions: https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html 


Get your api key here:
https://openweathermap.org/
