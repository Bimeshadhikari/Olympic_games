SELECT  
      [ID],
      [Name] As Competitor_Name,
      Case when Sex ='M' Then 'Male'  Else 'Female' End as Sex,
      [Age],
	  Case when [Age] < 18 Then 'Under Age'
	       when [Age] Between 18 and 25 Then '18-25'
		   when [Age] Between 25 and 30 Then '25-30'
		   when [Age] > 30 Then 'Over 30'
		   End as [Age Grouping],
      [Height],
      [Weight],
      [NOC] As Nation_Code,
      [Games],
	 Left (Games,CHARINDEX(' ' ,Games)-1) As 'Year',
	 Right (Games,CHARINDEX(' ', Reverse(Games))) As 'Season',
      [City],
      [Sport],
      [Event],
	  Case when Medal= 'NA' Then 'Not Registered' else Medal End As 'Medal'
  FROM [olympic_games].[dbo].[athletes_event_results]
  Where RIGHT(Games,Charindex(' ', Reverse(Games))-1)= 'Summer' 