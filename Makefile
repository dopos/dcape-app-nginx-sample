## dcape-app-nginx Makefile
## This file extends Makefile.app from dcape
#:

SHELL            = /bin/bash
CFG             ?= .env
CFG_BAK         ?= $(CFG).bak

#- Docker repo & image name without version
IMAGE           ?= nginx

#- ver
IMAGE_VER       ?= 1.19.4-alpine

# ------------------------------------------------------------------------------
# app custom config

# Owerwrite for setup
APP_SITE        ?= host.dev.test

#- domain
APP_ACME_DOMAIN ?= www.$(APP_SITE)

#- app root
APP_ROOT        ?= $(PWD)

PERSIST_FILES    = html nginx

# ------------------------------------------------------------------------------

# if exists - load old values
-include $(CFG_BAK)
export

-include $(CFG)
export

# ------------------------------------------------------------------------------
# Find and include DCAPE_ROOT/Makefile
DCAPE_COMPOSE   ?= dcape-compose
DCAPE_ROOT      ?= $(shell docker inspect -f "{{.Config.Labels.dcape_root}}" $(DCAPE_COMPOSE))

ifeq ($(shell test -e $(DCAPE_ROOT)/Makefile.app && echo -n yes),yes)
  include $(DCAPE_ROOT)/Makefile.app
else
  include /opt/dcape/Makefile.app
endif
