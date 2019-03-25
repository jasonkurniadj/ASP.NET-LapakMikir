create proc viewbyid
@Id int
as 
begin
select * from Material
where Id = @Id
end