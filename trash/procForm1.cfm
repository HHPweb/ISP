<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Form Submit:  Independent Study Proposal</title>
<link rel="stylesheet" type="text/css" href="myStyle.css" />
<cfinclude template="jqueryLoad.cfm">
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
            <h1>Independent Study Proposal</h1>
              <hr />
        <cffunction name="addUser">
             <cftry>
                <cfset myTerm="#Form.term#~#Form.year#">
                <cfquery dataSource="hhp_apps" name="myQuery"> 
                    INSERT INTO ISP_forms
                    (date,last,first,middle,address,city,state,zip,phone,pirateid,email,term,supervisor,goals,outcomes,tasks,evaluation,prefix,number,initDate,writing) 
                    VALUES 
                    ('#DateFormat(now(), "m-d-yyyy")# #TimeFormat(now())#','#Trim(Form.last)#','#Trim(Form.first)#','#Trim(Form.middle)#','#Trim(Form.address)#','#Trim(Form.city)#','#Trim(Form.state)#','#Trim(Form.zip)#','#Trim(Form.phone)#','#Trim(Session.pirateid)#','#Trim(Form.email)#','#myTerm#','#Trim(Form.supervisor)#','#Trim(Form.goals)#','#Trim(Form.outcomes)#','#Trim(Form.tasks)#','#Trim(Form.evaluation)#','#Trim(Form.prefix)#','#Trim(Form.number)#','#DateFormat(now(), "m-d-yyyy")# #TimeFormat(now())#','#Trim(Form.writing)#')
                </cfquery>
                
                <cfmail to = "#Trim(Form.supervisor)#" from = "#Trim(Form.email)#" subject = "Independent Study Proposal">
        This message was generated automatically by the HHP Independent Study Proposal website.
                        
        An independent study proposal from #Trim(Form.first)# #Trim(Form.last)# has been submitted or edited and awaits your approval.
        Please log in at: https://core.ecu.edu/baldwinc/ISP/index.cfm to review this application.
                        </cfmail>
                        <cfmail to = "baldwinc@ecu.edu" from = "#Trim(Form.email)#" subject = "Independent Study Proposal">
        This message was generated automatically by the HHP Independent Study Proposal website.
                        
        An independent study proposal from #Trim(Form.first)# #Trim(Form.last)# has been submitted or edited.
                        </cfmail>
                <cfoutput>Your form has been submitted.  <br /><br />Go back and <a href="student.cfm">submit another request or edit an existing one.</a>	</cfoutput>
                 <cfcatch type="any">
                    <cfmail to = "baldwinc@ecu.edu" from = "#Trim(Form.email)#" subject = "Independent Study Proposal Failure">
An independent study proposal from #Trim(Form.first)# #Trim(Form.last)# has failed to be written to the db during an update by the student.  Where have we gone wrong?
        
         Diagnostic messages from ColdFusion.
            Message: #cfcatch.message#
            
         Caught an exception, type = #CFCATCH.TYPE#
         
Form data dump:

last = #Trim(Form.last)#
first = #Trim(Form.first)#
middle = #Trim(Form.middle)#
address = #Trim(Form.address)#
city = #Trim(Form.city)#
state = #Trim(Form.state)#
zip = #Trim(Form.zip)#
phone = #Trim(Form.phone)#
email = #Trim(Form.email)#
term = #myTerm#
writing intensive = #Trim(Form.writing)#
supervisor = #Trim(Form.supervisor)#

goals = #Trim(Form.goals)#

outcomes = #Trim(Form.outcomes)#

tasks = #Trim(Form.tasks)#

evaluation = #Trim(Form.evaluation)#

prefix = #Trim(Form.prefix)#
number = #Trim(Form.number)#
                        </cfmail>
					<cfoutput><br /><br /><br /><br />There was a problem and your data was not written to the database.<br /><br /> Please contact the <a href="mailto:baldwinc@ecu.edu">administrator</a> with a description of your problem.</cfoutput>
                </cfcatch>
            </cftry>
        </cffunction>
        
        <cfif IsDefined("Session.pirateid")>
            <cfif #Session.pirateid# is not "">
                <cfoutput>#addUser()#</cfoutput>
                <cfelse><cflocation url = "index.cfm">
               </cfif>
        </cfif>
    </div>
    
    <cfinclude template="footer.cfm">
</div><!-- end of the wrapper div -->
<script type="text/javascript">$('#wrapper').corner("bottom");$('#foot').corner("bottom")</script>

</body>
</html>