<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>HHP Independent Study Proposal</title>
<link rel="stylesheet" type="text/css" href="myStyle.css" />
<cfinclude template="jqueryLoad.cfm">
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
            <h1>Independent Study Proposal Form</h1> 
    </div>
    
    <div id="instructions">
        <p>This Independent Study Form is to be used by all students wishing to engage in an Independent Study, Field Experience, Practicum, or other course in which they work one-on-one with a particular faculty member. PRIOR to completing this form, the student should speak with the potential instructor and work out the details of the course expectations and timelines.</p>
        
        <p><strong>STUDENT:</strong> Complete and submit the form below. Your faculty supervisor will be notified via the email address you provide, so make sure it is correct. The student must be enrolled in the semester in which the independent study work is undertaken. Independent study involves one-on-one mentoring of a student by a faculty member.</p>
        
        <p><strong>COURSE SUBSTITUTION:</strong> Independent study should not be used to replace courses that are regularly offered, except in extraordinary circumstances (e.g., two required courses are offered at the same time during a student's final semester before graduation).</p>
    </div>
    
    <div id="login">
            <!--- All Error messages --->
            <!--- <cfset message="Temporarily unavailable for updates."> --->
        <cfif isDefined("message")>
            <cfoutput><p class="errormessage">#message#</p></cfoutput>
        </cfif>
            
           <form method="post" id="loginform" name="myForm" action="index.cfm">
    <fieldset>
    <legend>Login to start or edit-review a proposal. </legend>
    
            <label for="pirateidinput"><strong>PirateID</strong></label>
            <input id="pirateidinput" name="pirateid" type="text" size="20" /><br /><br />
            <label for="passphraseinput"><strong>Passphrase</strong></label>
            <input id="passphraseinput" name="passphrase" type="password" size="20" /><br /><br />	
            <input type="hidden" name="status" value="edit" />
            <input type="hidden" name="login" value="edit" />
            <input type="submit" id="submitBtn" name="subBtn" value="Enter" /><br /><br />
            <a href="http://pirateid.ecu.edu">Forgot your passphrase?</a>
    </fieldset>
    </form> 
           
        </div>
        
    <cfinclude template="footer.cfm">
</div><!-- end of the wrapper div -->
<script type="text/javascript">$('#wrapper').corner("bottom");$('#foot').corner("bottom")</script>
</body>
</html>
