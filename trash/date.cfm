<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>HHP Independent Study Proposal</title>
<link rel="stylesheet" type="text/css" href="myStyle.css" />
<cfscript>
   StructClear(Session);
</cfscript>
<cfset myDate = #DateFormat(now(), "m-d-yyyy")#>
<cfinclude template="admin/login.cfm">
</head>
<body>
<div id="wrapper"> 
    <div class="ECU_Banner"> 
    	<img src="images/eastcarolinauniversity.gif" alt="East Carolina University" /> 
    </div>
    
    <div id="subHeader">
    	The College of Health and Human Performance
    </div>
    
    <div class="divText"> 
            <h1>Experimenting with Dates</h1>
            <cfset thisYear=#Year(Now())#>
			<cfoutput><h2>#thisYear#</h2></cfoutput>
            <cfoutput><h2>#thisYear + 1#</h2></cfoutput>
    </div>
    
    
    
    
        
    <div class="footer"> 
        <img src="images/centennial_web_logo_footer.gif" alt="ECU Centennial Logo" align="left" /> 
        The College of Health &amp; Human Performance<br />
    Minges Coliseum | Greenville, NC 27858-4353<br />
    252.328.4630 | <a href="http://www.ecu.edu/cs-ecu/contact_us.cfm">Contact Us</a><br />
    &copy;2010 | <a href="http://www.ecu.edu/cs-ecu/use_privacy.cfm">terms of use</a> | Last Updated: 02.17.2010 
    </div>
    
</div><!-- end of the wrapper div -->

</body>
</html>
