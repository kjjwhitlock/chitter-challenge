alter table peeps add column created_at timestamp;
alter table peeps alter column created_at set default now();
