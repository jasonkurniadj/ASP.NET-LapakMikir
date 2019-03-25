Create proc CreateorUpdate
@Id int,
@Course varchar(50),
@MaterialName varchar(50),
@MaterialDesc text,
@FileUpload varchar(50)
as
begin
if(@Id=0)
begin 
insert into Material (Course, MaterialName, MaterialDesc, FileUpload)
values(@Course, @MaterialName, @MaterialDesc, @FileUpload)
end
else
begin 
update Material
set
Course = @Course,
MaterialName = @MaterialName,
MaterialDesc = @MaterialDesc,
FileUpload = @FileUpload
where Id = @Id
end
end