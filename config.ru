require 'sinatra/base'

Dir.glob('./{controllers,models}/*.rb').each{
    |file| require file
}

map('/') {run ApplicationController}
map('/home') {run HomeController}
map('/drink') {run DrinkController}
map('/liquor') {run LiquorController}
