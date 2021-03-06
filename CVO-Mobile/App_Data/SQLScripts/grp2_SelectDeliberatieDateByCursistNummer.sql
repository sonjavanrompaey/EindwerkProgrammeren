--3/05/2015 

--SVR 

  

--stored procedure 

--deliberatie datums overzicht 

  

use Administratix_cursist  
go 

if exists (select 1 from sysobjects where name = 'grp2_SelectDeliberatieDateByCursistNummer' AND type = 'P') -- P = procedure 
begin 
drop proc grp2_SelectDeliberatieDateByCursistNummer 
end 
go 

create procedure grp2_SelectDeliberatieDateByCursistNummer( @CursistNummer int) 
as 
begin 
select  
CursusNummer as Cursusnummer 
,Naam as Module 
,Convert(nvarchar, DeliberatieDatum, 5) as DeliberatieDatum 
,Convert(nvarchar, DatumTweedeZit, 5) as TweedeZitDatum 
from IngerichteModulevariant 
inner join Plaatsing on Plaatsing.IdIngerichteModulevariant = IngerichteModulevariant.id 
inner join Cursist on Plaatsing.IdCursist = Cursist.Id 
where Cursist.CursistNummer = @CursistNummer 
order by DeliberatieDatum 
end 
