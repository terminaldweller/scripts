create or replace function strip_ascii_escape() returns trigger
language plpgsql as $$
    begin
        NEW.log = regexp_replace(NEW.log,'\x1b\[[\x30-\x3f]*[\x20-\x2f]*[\x40-\x7e]','','g');
        NEW.log = regexp_replace(NEW.log,'\x1b[PX^_].*?\x1b\\','','g');
        NEW.log = regexp_replace(NEW.log,'\x1b\][^\a]*(?:\a|\x1b\\)','','g');
        NEW.log = regexp_replace(NEW.log,'\x1b[\[\]A-Z\\^_@]','','g');
        NEW.log = regexp_replace(NEW.log,'[\x00-\x1f\x7f-\x9f\xad]+','','g');

        return NEW;
    end;
$$;

create trigger strip_ascii_escape
before insert on public.logs
for each row execute function strip_ascii_escape()
