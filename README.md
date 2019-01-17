# zlab-api

API Endpoints for personal homelab administration.

This Rails 5 API stores inventory and handles operations on my homelab. Currently it manages sites (which have many environments for multiple configurations between deployment instances), jobs (such as cluster deployments and backups), clusters (Flynn clusters), and hosts (either cluster nodes or standalone VMs).

Configuration is stored in MongoDB via the mongoid gem.

These endpoints are intended for use with zlab-ui, the frontend administration tool for my homelab.

Deployments and other jobs are logged and also can pipe output to the frontend UI.

Deployments are targeted towards both my home ESXI setup and DigitalOcean.

# TODO

* Add individual VM host deployments
* Move Flynn cluster backups into API
* Add wordpress site deployments
