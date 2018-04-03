USE [HRIS]
GO
/****** Object:  StoredProcedure [dbo].[hris_get_paf_list_pending]    Script Date: 2/04/2018 5:29:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[hris_get_paf_list_pending]
	@user_id_num varchar(12)
AS
BEGIN
	select p.paf_id,
		   e.id_num,
		   e.employee_firstname,
		   e.employee_lastname,
		   e.employee_middlename,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   ps.position_name,
		   pst.posstatus_name,
		   es.empstatus_name,
		   l.location_name,
		   p.salary,
		   p.effective_date,
		   p.effective_until,
		   (case p.is_cancelled when 0 then p.rank_movement else -2 end) rank_movement,
		   p.pafstatus_code,
		   p.is_cancelled,
		   e.is_external
	  from paf p (nolock)
	  join employee e (nolock) on e.id_num = p.id_num
	  join t_position ps (nolock) on ps.position_code = p.position_code
	  join t_empstatus es (nolock) on es.empstatus_code = p.empstatus_code
	  join t_positionstatus pst (nolock) on pst.posstatus_code = p.posstatus_code
	  join location l (nolock) on l.location_code = p.location_code
	 where p.pafstatus_code = 'PND'
	   and isnull(p.is_cancelled,0) = 0
	   and (ps.level_code in ( 
							   select distinct level_code
							     from sysroleprivilege rp (nolock)
							     join sysuserrole ur (nolock) 
								   on ur.role_code = rp.role_code and ur.id_num = @user_id_num
							     join sysrolelevel rl (nolock)
								   on rl.role_code = rp.role_code
							    where rp.privilege_code = 'PAF_VIEW')
							 ) 
  order by employee_name, p.paf_id desc
END

