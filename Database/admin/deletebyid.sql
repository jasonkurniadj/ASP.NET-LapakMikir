create proc deletebyid
@Id int
as
begin 
delete from Material
where Id = @Id	
end