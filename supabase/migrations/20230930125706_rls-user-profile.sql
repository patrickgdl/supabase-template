alter table "public"."user_profiles" enable row level security;

create policy "Enable delete for users based on user_id"
on "public"."user_profiles"
as permissive
for update
to public
using ((auth.uid() = user_id))
with check ((auth.uid() = user_id));


create policy "Enable insert for authenticated users only"
on "public"."user_profiles"
as permissive
for insert
to public
with check ((auth.uid() = user_id));


create policy "Enable read access for all users"
on "public"."user_profiles"
as permissive
for select
to public
using (true);



