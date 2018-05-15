-- SQL Script to capture the database table structure
select
[table_name] as  [Table Name],
[column_name] as [Column Name],
case [data_type]
  when 'varchar' then [data_type] + '(' + cast([character_maximum_length]  as varchar) + ')'
  when 'nvarchar' then [data_type] + '(' + cast([character_maximum_length]  as nvarchar) + ')'
  else [data_type]
end as [Data Type],
case [is_nullable]
  when 'No' then 'No'
  else 'Yes'
end as [Nullable],
isnull([column_default], '') as [Default Value],
isnull(cast([numeric_precision] as nvarchar),'') as [Precision],
isnull(cast([numeric_precision_radix] as nvarchar),'') as [Precision Radix],
isnull([collation_name],'') as [Collation Name]
from information_schema.[columns]
where [table_catalog]   like '%'
    and [table_schema]  like 'dbo'
    and [table_name]     like '%'
    and [column_name]  like '%Lastlogon%'
    and [data_type]        like '%'
order by [table_name], [ordinal_position]
-- SQL Script to capture the names of the database objects
select distinct
case [xtype]
 when 'C'   then 'CHECK constraint'
 when 'D'   then 'DEFAULT constraint'
 when 'F'    then 'FOREIGN KEY constraint'
 when 'L'    then 'Log'
 when 'FN' then 'Scalar function'
 when 'IF'   then 'Inlined table-function'
 when 'P'    then 'Stored procedure'
 when 'PK' then 'PRIMARY KEY constraint'
 when 'RF'  then 'Replication filter stored procedure'
 when 'S'    then 'SYSTEM table'
 when 'TF'  then 'Table function'
 when 'TR'  then 'Trigger'
 when 'U'    then 'User table'
 when 'UQ' then 'UNIQUE constraint'
 when 'V'    then 'View'
 when 'X'    then 'Extended stored procedure'
end as [xtype],
[name] as [Name]
from [dbo].[sysobjects]
where [xtype] in ('C', 'D', 'FN','P', 'PK', 'TR', 'U', 'V')
  and [name] like '%'
order by [xtype], [name]
-- SQL Script to capture the Names and Definitions of Views
select
   [table_name] as [View Name],
   [view_definition] as [View Definition]
from information_schema.[views]
where [table_name] like '%'
order by [table_name]

-- SQL Script to capture the Names and Definitions of functions and procedures
select
   [routine_type] as [Routine Type],
   [routine_name] as [Routine Name],
   [routine_definition] as [Routine Definition]
from information_schema.[routines] 
where [routine_type] in ('FUNCTION','PROCEDURE')
    and [routine_name]  like '%'
order by [routine_name]
-- SQL Script to capture the Names and Parameters of functions and procedures
select
   [specific_name] as [Routine Name],
   [parameter_name] as [Parameter Name],
case [data_type]
   when 'varchar' then [data_type] + '(' + cast([character_maximum_length]  as varchar) + ')'
   when 'nvarchar' then [data_type] + '(' + cast([character_maximum_length]  as nvarchar) + ')'
   else [data_type]
end as [Data Type]
from information_schema.[parameters]
where [specific_name] like '%'
order by [specific_name], [ordinal_position]

-- SQL Script to capture the GUID and Table names
-- This could help your SQL joins on what table have what guids.
select
[column_name] as [Guid Name],
[table_name] as  [Table Name],
case [is_nullable]
when 'YES' then 'Yes'
  else 'No'
end as [Nullable],
isnull([column_default], '') as [Default Value]
from information_schema.[columns]
where [table_schema]  = 'dbo'
  and [data_type] like 'uniqueidentifier'
order by [column_name], [table_name]


-- To look at the table or view definition

sp_help TableName
sp_help ViewName

sp_columns TableName

-- To look at what indexes are in a table

sp_helpindex TableName

-- To look at the definition of a stored procedure or a view

sp_helptext StoredProcedureName


sp_helptext ViewName

-- To look at the database object (tables, views, stored procedures) dependencies

sp_depends DatabaseObject"
