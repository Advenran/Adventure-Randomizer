# Adventure-Randomizer

##Application description

###Traveling Football Fan App
The traveling football Fan App is the perfect travel partner for football fanatics and casual watchers alike. It allows you to create your very own football match itineraries for your travels abroad. Itineraries are designed to be printed and conveniently stored with the rest of your travel documents for use on game day. The traveling football app outputs detailed information about the city you're visiting, the stadium the match will be held, and the teams that are playing that day. If you have internet access while at the game, The Traveling Football Fan is only one click away.

The casual fan will appreciate having easily accessible, printed content, they can use to build on their football knowledge as well as having valuable information that can help them connect with other football fans around the world. Building a network of football friends has never been easier.

The hardcore fan can also benefit from having readily accessible talking points they can use to connect with other fans and it can serve as an invaluable tool for keeping their many football watching adventures organized in one simple and convenient place.

##Team members
+ Bobby Lopez
+ Efosa Osamwonyi
+ Mike Stokes
+ Kangil Lee

##Technology used
+ Ruby on Rails
+ JQuery Ajax
+ Postgresql - database
+ HTML & CSS
+ Draw.io - ERD
+ Moqups.com - Wireframes


##Trello board
<a href="https://trello.com/b/tYYOSPAQ/project-3-bulbasaur">Bulbasaur Trello board</a>

##Artifacts
###Wireframes
<img src="./images/homepage.png">
<img src="./images/sign_up_page.png">
<img src="./images/itineraries.png">
<img src="./images/itinerariesid.png">
<img src="./images/matchesid-2.png">

###ERD
<img src="./images/ERDiagram.png">

###Tables

#### Users table
|id   |name| email  |password_digest   |
|---|---|---|---|
| 1  |efosa| efosa@gmail.com  |squirtle   |
| 2  |mike| mike@gmail.com  | charmander  |
| 3  |bobby| bobby@gmail.com  | mewtwo |
#### Itenaries table
|id   |name   |user_id   |
|---|---|---|---|
|1   |England Games  | 1  |
|2   |Barcelona-Camp Nou   |2   |
|3   |Germany games   |3   |
#### Matches table
|id|stadium_id|team1_name   | team2_name  | date  |itinerary_id|
|---|---|---|---|---|---|
|1|2 |Manchester United  | Chelsea  |05/01/2015   |1|
|2| 1 |Barcelona |Real Madrid   | 05/02/2015  |2|
|3| 3|Bayern Munich  | Manchester city  |05/04/2015   |3|

####Stadiums table
|id| name  |capacity   |city   | country  | home_team| stadium_blurb | city_blurb |
|---|---|---|---|---|---|---|---|
|1|Camp Nou   | 99,786  | Barcelona  | Spain  | FC Barcelona| stadium blurb | city blurb |
|2|Old Trafford   | 75,731  | Manchester  | England  |Manchester United FC| stadium blurb | city blurb |
|3|Allianz Arena   | 75,024  | Munich  | Germany  |Bayern Munich| stadium blurb | city blurb |

