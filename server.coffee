# Module dependencies
express = require 'express'
fs = require 'fs'
# Create application server
app = express()

# Configuration
app.configure =>
	app.set 'views', __dirname + "js/views"
	app.set 'view engine', 'jade'
	app.use	express.bodyParser()
	app.use express.methodOverride()
	app.use express.cookieParser()
	app.use express.static(__dirname)
	#app.use "/test", express.static(__dirname + "/public/test")

app.get "/", (req, res) ->
	res.set 'Content-type', 'text/html'
	res.send index

console.log 'server listening at 8020' 
app.listen 8020