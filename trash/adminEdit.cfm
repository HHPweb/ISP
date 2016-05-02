<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>HHP Independent Study Proposal</title>
<link rel="stylesheet" type="text/css" href="myStyle.css" />
<cfinclude template="jqueryLoad.cfm">
<cfset myDate = #DateFormat(now(), "m-d-yyyy")#>
<script type="text/javascript" src="comments.js"></script>
<script type="text/javascript">
function makeSure() {
	var r=confirm("Delete this application?");
if (r==true)
  {
  return true;
  }
else
  {
  return false;
  }
}
</script>

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
<!--- begin modal for comments --->
<cfinclude template="comModal.cfm">
<!--- end modal for comments --->
        
	<cfif IsDefined("Session.pirateid")><!--- checking to see if they've logged in --->
        <div id="instructions">&nbsp;
             <div id="pirateid"><strong>Admin: <cfoutput>#Session.pirateid#</cfoutput></strong><span class="logoff"><a href="index.cfm">log off</a></span></div>
             
             <div id="dlForm">
                 <cfform name="delForm" action="delAppAdmin.cfm" method="post" onsubmit="return makeSure()">
                    <cfinput name="id" type="hidden" value="#Form.myApp#">
                    <cfinput name="submit" type="submit" value="Delete This Application" >
                </cfform>
             </div>
             [ <a href="javascript:openComm();">comments</a> ]
             <div id="appDate"></div>
             
        </div>
        
    <cfif IsDefined("Form.myApp")>
                    
               <div id="formDiv">
                    <cfinclude template="admin/formEditing.cfm">
                    <cfquery name="fetchData" datasource="hhp_apps">
                        Select * From ISP_forms Where id = <cfqueryparam value="#Form.myApp#" CFSQLType="CF_SQL_VARCHAR">
                    </cfquery>
                     <cfif fetchData.writing is not "">
						<cfif fetchData.writing is "yes">
                            <cfscript>
                                WriteOutput("<script type='text/javascript'>document.getElementById('yes').checked = 'checked';</script>");
                            </cfscript>
                        </cfif>
                        <cfif fetchData.writing is "no">
                            <cfscript>
                                WriteOutput("<script type='text/javascript'>document.getElementById('no').checked = 'checked';</script>");
                            </cfscript>
                        </cfif>
					</cfif> 
                    <cfif fetchData.facultyApp is "yes">
                        <cfscript>
                            WriteOutput("<script type='text/javascript'>document.getElementById('facultyApp').checked = 'checked';</script>");
                        </cfscript>
                    </cfif>
                    <cfif fetchData.chairApp is "yes">
                        <cfscript>
                            WriteOutput("<script type='text/javascript'>document.getElementById('chairApp').checked = 'checked';</script>");
                        </cfscript>
                    </cfif>
                    <cfif fetchData.processDone is "yes">
                        <cfscript>
                            WriteOutput("<script type='text/javascript'>document.getElementById('processDone').checked = 'checked';document.getElementById('compBy').innerHTML = ' Processed by: #fetchData.asstMail# on #fetchData.staffDate#';</script>");
                        </cfscript>
                    </cfif>
                    <cfif fetchData.facultyDate is not "">
                        <cfscript>
                            WriteOutput("<script type='text/javascript'>document.getElementById('facultyDate').innerHTML = '(approved on: #JSStringFormat(fetchData.facultyDate)#)';</script>");
                        </cfscript>
                    </cfif>
                    <cfif fetchData.chairDate is not "">
                        <cfscript>
                            WriteOutput("<script type='text/javascript'>document.getElementById('chairDate').innerHTML = '(approved on: #JSStringFormat(fetchData.chairDate)#)';</script>");
                        </cfscript>
                    </cfif>
                    <cfif fetchData.initDate is not "">
                        <cfscript>
                            WriteOutput("<script type='text/javascript'>document.getElementById('appDate').innerHTML = '(first submitted on: #JSStringFormat(fetchData.initDate)#)';</script>");
                        </cfscript>
                    </cfif>
                    <cfif fetchData.term is not "">
                    	<cfset tList = ValueList(fetchData.term)>
                        <cfset tArr = ListToArray(tList,"~",false)>
						<cfscript>
							WriteOutput("<script type='text/javascript'>document.getElementById('term').value = '#JSStringFormat(tArr[1])#';</script>");
							WriteOutput("<script type='text/javascript'>document.getElementById('year').value = '#JSStringFormat(tArr[2])#';</script>");
						</cfscript>
                    </cfif>
                    <cfscript>
                        WriteOutput("<script type='text/javascript'>document.getElementById('last').value = '#JSStringFormat(fetchData.last)#';document.getElementById('first').value = '#JSStringFormat(fetchData.first)#';document.getElementById('middle').value = '#JSStringFormat(fetchData.middle)#';document.getElementById('address').value = '#JSStringFormat(fetchData.address)#';document.getElementById('city').value = '#JSStringFormat(fetchData.city)#';document.getElementById('state').value = '#JSStringFormat(fetchData.state)#';document.getElementById('zip').value = '#JSStringFormat(fetchData.zip)#';document.getElementById('phone').value = '#JSStringFormat(fetchData.phone)#';document.getElementById('email').value = '#JSStringFormat(fetchData.email)#';document.getElementById('supervisor').value = '#JSStringFormat(fetchData.supervisor)#';document.getElementById('goals').value = '#JSStringFormat(fetchData.goals)#';document.getElementById('outcomes').value = '#JSStringFormat(fetchData.outcomes)#';document.getElementById('tasks').value = '#JSStringFormat(fetchData.tasks)#';document.getElementById('evaluation').value = '#JSStringFormat(fetchData.evaluation)#';document.getElementById('prefix').value = '#JSStringFormat(fetchData.prefix)#';document.getElementById('number').value = '#JSStringFormat(fetchData.number)#';document.getElementById('crn').value = '#JSStringFormat(fetchData.crn)#';document.getElementById('hours').value = '#JSStringFormat(fetchData.hours)#';document.getElementById('chairMail').value = '#JSStringFormat(fetchData.chairMail)#';document.getElementById('asstMail').value = '#JSStringFormat(fetchData.asstMail)#';</script>");
                    </cfscript>
               </div>
	</cfif>
            

    <cfelse>
        <cflocation url = "index.cfm">
    </cfif>
        <!--- <cfinclude template="admin/form.cfm"> --->
	<cfinclude template="footer.cfm">
</div><!-- end of the wrapper div -->
<script type="text/javascript">$('#wrapper').corner("bottom");$('#foot').corner("bottom")</script>
 
</body>
</html>
