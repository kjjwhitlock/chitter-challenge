Chitter Challenge
=================


### Setup
1. Bundle install
2. Run `rackup config.ru` to run server on port 9292

### How to set up the database
1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE chitter;`
3. Connect to the database using the `psql` command `\c peeps;`
4. Run the query saved in the file `01_create_peeps_table.sql`
5. Run the query saved in the file `02_added_timestamps.sql`
6. Run the query saved in the file `03_add_comments_table.sql`
7. Run the query saved in the file `04_create_users_table.sql`
