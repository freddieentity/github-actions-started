# ===========
#  Interface
# ===========

RESET        := $(shell tput -Txterm sgr0)
YELLOW       := $(shell tput -Txterm setab 3 && tput -Txterm setaf 0)
YELLOW_TEXT  := $(shell tput -Txterm setaf 3)
PURPLE       := $(shell tput -Txterm setab 5 && tput -Txterm setaf 7)
PURPLE_TEXT  := $(shell tput -Txterm setaf 5)