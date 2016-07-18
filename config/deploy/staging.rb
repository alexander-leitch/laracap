
# 10.1.128.23

# server ip address, username with which you ssh to your server and the roles assigned to this server
server '10.1.128.23', user: 'alexanderl-a', roles: %w{app db web}
# path to deploy the project
set :deploy_to, '/home/alexanderl-a/cap/staging'
# set some variables that is used in deploy tasks written in deploy.rb
# don't keep the sensetive credentials here; like database name, username and password
# you can use overlay for setting sensetive information.
set :app_path, '/home/alexanderl-a/cap/staging'
set :app_debug, false
set :app_key, 'NrLNIrApophsxQzbm98DGNlnWK1wxxdc'