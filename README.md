# Comp421-Project-Deliverable2
## How to clean up a table?
TRUNCATE TABLE tablename CASCADE;

  This will delete all data in a table as well as its relational data.

## Auto-useless-data-generation
Loop in SQL can do
for example, this code insert 800 rows into users table 
```
    do $$
begin
for r in 1..800 loop
insert into users values('User'||r,'zhanzhan'||r,'luoluo'||r,'male','84372479@qq.com','51483427080');
end loop;
end;
$$;
```
