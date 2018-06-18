
/****** Object:  StoredProcedure [dbo].[sec_get_privileges]    Script Date: 31/05/2018 12:19:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sec_get_privileges]
	@app_code smallint = 0
AS
BEGIN
	select *
	  from sysprivilege p (nolock)
	 where p.app_code = isnull(@app_code,0)
  order by p.privilege_name
END
