require('sinatra')
  require('sinatra/reloader')
  require('./lib/stylist')
  require('./lib/client')
  also_reload('lib/**/*.rb')
  require("pg")

  DB = PG.connect({:dbname => "hair_salon"})

  get("/") do
    @stylists = Stylist.all()
    erb(:index)
  end

  get("/stylists/new") do
    erb(:stylist_form)
  end

  post("/stylists") do
    name = params.fetch("name")
    stylist = Stylist.new({:name => name, :id => nil})
    stylist.save()
    erb(:stylist_success)
  end

  get("/stylists") do
    @stylists = Stylist.all()
    erb(:stylists)
  end

  get("/stylists/:id") do
    @stylist = Stylist.find(params.fetch("id").to_i())
    erb(:stylist)
  end

  post("/clients") do
    name = params.fetch("name")
    stylist_id = params.fetch("stylist_id").to_i()
    @stylist = Stylist.find(stylist_id)
    @client = Client.new({:name => name, :stylist_id => stylist_id, :id => nil})
    @client.save()
    erb(:client_success)
  end

  delete("/client") do
    @client = Client.find(params.fetch("client_id"))
    @client.delete()
    @clients = Client.all()
    erb(:client_delete)
  end

  delete("/stylists/:id") do
    @stylist = Stylist.find(params.fetch("id").to_i())
    @stylist.delete()
    @stylists = Stylist.all()
    erb(:index)
  end

  get("/stylists/:id/edit") do
    @stylist = Stylist.find(params.fetch("id").to_i())
    erb(:stylist_edit)
  end

  patch("/stylists/:id") do
    name = params.fetch("name")
    @stylist = Stylist.find(params.fetch("id").to_i())
    @stylist.update({:name => name})
    erb(:stylist)
  end

  patch("/client_update") do
    name = params.fetch("name")
    client_id = params.fetch("client_mark")
    @client = Client.find(params.fetch("client_id"))
    @client.update({:name => name, :id => client_id})
    erb(:client_update)
  end
