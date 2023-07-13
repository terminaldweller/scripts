create table if not exists security_rss_keyword_store (
    id serial primary key not null,
    logdate timestamp without time zone default now(),
    nick varchar(128) not null,
    log varchar(1024) not null,
    channel varchar(256) not null
);

create or replace function security_rss_trigger_function()
returns trigger
language plpgsql
as $$
begin
    if NEW.log like any(array['%nvidia%','%intel%','%dell%']) then
        insert into security_rss_keyword_store(nick,log,channel)
        values (NEW.nick,NEW.log,NEW.channel);
end;
$$

create or replace trigger security_rss_trigger
after insert or update
on public.logs
for each row
execute function security_rss_trigger_function();
