drop table user;
create table user(
	id int AUTO_INCREMENT,
	name varchar(100),
	password varchar(100),
	email varchar(100),
	mobile varchar(100),
	image varchar(100),
	gender int,
	create_user varchar(50),
	create_time varchar(50),
	modify_user varchar(50),
	modify_time varchar(50),
	primary key(id)
);
/*查询根类*/
select 
	id,
	parent_id as parentId,
	name,
	status,
	sort_order as sortOrder,
	is_parent as isParent,
	created_time as createdTime,
	modified_time as modifiedTime,
	created_user as createdUser,
	modified_user as modifiedUser
from 
	t_goods_category
where 
	id=#{rootId}
	
/*查询一级子类*/
select 
	id,
	parent_id as parentId,
	name,
	status,
	sort_order as sortOrder,
	is_parent as isParent,
	created_time as createdTime,
	modified_time as modifiedTime,
	created_user as createdUser,
	modified_user as modifiedUser
from 
	t_goods_category
where 
	parent_id=#{rootId} and status=1
order by sort_order

/*根据传入的rootId查找其子类*/
select 
	id,
	parent_id as parentId,
	name,
	status,
	sort_order as sortOrder,
	is_parent as isParent,
	created_time as createdTime,
	modified_time as modifiedTime,
	created_user as createdUser,
	modified_user as modifiedUser
from 
	t_goods_category
where 
	parent_id in(
		select 
			t.id
		from 
			t_goods_category t
		where
			t.parent_id=#{rootId} and t.status=1
		
	)and status=1
order by sort_order
	
