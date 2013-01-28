# thincloud-deployment
#
# Application specific deployment settings. To make changes for a specific
# stage, please see `config/deploy/*.rb`
#
# This is a standard Capistrano deploy.rb. All the power remains.

set :domain, "DOMAIN_NAME.com"
set :application, "APPLICATION_NAME"
set :repository, "git@github.com:ORGANIZATION/APPLICATION_NAME.git"
set :flowdock_api_token, "FLOWDOCK_API_TOKEN"
