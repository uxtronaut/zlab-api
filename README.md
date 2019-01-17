# zlab-api

API Endpoints for personal homelab administration.

This Rails 5 API stores inventory and handles operations on my homelab. Currently it manages sites (which have many environments for multiple configurations between deployment instances), jobs (such as cluster deployments and backups), clusters (Flynn clusters), and hosts (either cluster nodes or standalone VMs).


## Architecture

Configuration is stored in MongoDB via the mongoid gem.

These endpoints are intended for use with zlab-ui, the frontend administration tool for my homelab.

Deployments and other jobs are logged and also can pipe output to the frontend UI.

Deployments are targeted towards both my home ESXI setup and DigitalOcean.

## Schema

```
 sites
 / | \
    environments
      / | \
backups   variables

    clusters
     / | \
backups  deployments

jobs (deployments and backups)
```

## Install

* Ensure you have Ruby 2.5.3 running on your system (I prefer chruby and ruby-install for managing and switching between ruby versions.)
* Ensure you have the `bundler` gem installed on your system (`gem install bundler`)
* Clone this project and `cd` into its directory
* `bundle install`
* Create your `.env` environment file (see the Environment section of this README)
* Ensure you have the `dotenv` gem installed on your system (`gem install dotenv`)
* Run the development server: `dotenv rails s`

Now you should find the healthcheck success message in your browser at http://localhost:3000/healthcheck

## Environment

```
RAILS_ENV=<development|production>
CORS_ORIGIN=http://localhost:8080
```

## TODO

* Add individual VM host deployments
* Move Flynn cluster backups into API
* Add wordpress site deployments
