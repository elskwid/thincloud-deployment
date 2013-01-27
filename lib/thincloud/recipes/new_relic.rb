require "new_relic/recipes"

# Notify NewRelic
after "deploy:create_symlink", "newrelic:notice_deployment"
