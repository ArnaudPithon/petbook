datadir := data

PG = psql
DB = petbook

all:

init: database

database: tables populate

tables: $(datadir)/create_tables.pgsql
	$(PG) -d $(DB) -f $<

populate: $(datadir)/seeding.pgsql
	$(PG) -d $(DB) -f $<

.PHONY: init all database tables populate
