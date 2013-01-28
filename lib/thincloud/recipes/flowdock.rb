require "flowdock/capistrano"

set(:flowdock_project_name) { application }
set(:flowdock_deploy_tags) { [application, stage] }
set :flowdock_api_token, ""
