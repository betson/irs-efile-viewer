<?xml version="1.0" encoding="UTF-8"?>
<!-- Last modified on 11/02/2016 by Harold Nadel updated per defect #46812 added the missing bullet in the caution area of the form.  -->
<!-- Last modified on 9/20/2016 by Harold Nadel for WR#184740 Updating for TY2016 -->
<!-- Last modified on 01/20/2015 by Harold Nadel for KISAM # IM02398611 correcting TIN display and updating TY2014 to TY2015 -->
<!-- 06/16/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- Last modified on 11/19/2014 by Harold Nadel for IBM Defect 41780 PDF Comparison 1040 EIC made sure all the references to the year 1994 were changed to 1995 -->
<!-- Last modified on 10/22/2014 by Harold Nadel for IBM Defect 41780 PDF Comparison 1040 EIC -->
<!-- 08/14/2017 - Changes made for UWR 200411 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS1040ScheduleEICStyle.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>
<xsl:param name="Form1040ScheduleEICData" select="$RtnDoc/IRS1040ScheduleEIC"/>
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form1040ScheduleEICData)"/></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
  <meta name="Description" content="IRS Form 1040ScheduleC"/>
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
    <xsl:call-template name="InitJS"/>
 <style type="text/css"> 
 <xsl:if test="not($Print) or $Print=''">  
        <!-- Form 1040ScheduleEIC CSS Styles are located in the template called below -->
        <xsl:call-template name="IRS1040ScheduleEICStyle"/>
        <xsl:call-template name="AddOnStyle"/>
  </xsl:if>   
  </style>  
  <xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass">
  <form name="Form1040ScheduleEIC">
    <!-- WARNING LINE -->
    <xsl:call-template name="DocumentHeader"/>
    <!-- Begin Form Number and Name -->

    <div class="styBB" style="width:187mm;height:22.5mm;">
      <div class="styFNBox" style="width:31mm;height:22.5mm;">
        <div style="padding-top:1mm;">                  
          <span class="styFormNumber" style="font-size:9pt;">SCHEDULE EIC</span>
          <br/>
          <span class="styFormNumber" style="font-size:7pt;">(Form 1040 or 1040-SR)</span>
          <br/>
        </div>
        <div style="padding-top:8mm;">
          <span class="styAgency">Department of the Treasury</span><br/>
          <span class="styAgency">Internal Revenue Service <span style="width:3mm"/> (99)</span> 
        </div>
      </div>
      <div class="styFTBox" style="width:125mm;height:22.5mm;">
        <div class="styMainTitle" style="height:5mm;margin-top:0mm;padding-left:3px;">
          <div style="width:70mm;float:left;clear:none;vertical-align:top;padding-top:1mm;padding-left:20mm;"> Earned Income Credit  </div> 
          <div style="float:right;text-align:right;width:19mm;padding-top:2mm;padding-right:13mm;">
             <img src="{$ImagePath}/1040_EIC_Hdr.gif" alt="Attach to Form 1040 or 1040-SR icon" border="darkgray" width="56" height="57"/>
          </div>
          <div style="width:69.5mm;font-size:9pt;margin-top:0mm;font-weight:normal;vertical-align:top;float:left;clear:none;padding-left:16mm;padding-bottom:2mm;">
          Qualifying Child Information</div>
		  
		  <div class="styFBT" style="width:92mm;font-size:7pt;margin-top:0mm;font-weight:normal;float:left;text-align:left">
		    <img src="{$ImagePath}/1040SchEIC_Bullet_Sm.gif" alt="SmallBullet" style="margin-right:2px;"/>Complete and attach to Form 1040 or 
		    1040-SR only if you have a qualifying child.</div>
		  <div class="styFBT" style="width:100mm;font-size:7pt;margin-top:0mm;font-weight:normal;float:left;text-align:left;font-family:Arial Narrow;font-size:7pt;">
		    <img src="{$ImagePath}/1040SchEIC_Bullet_Sm.gif" alt="SmallBullet" style="margin-right:2px;"/>
		    Go to <i>www.irs.gov/ScheduleEIC</i> for the latest information.
		  </div>
        </div>
	  </div>
      <div class="styTYBox" style="width:30mm;height:22.5mm;">
        <div class="styOMB" style="height:4mm;">OMB No. 1545-0074</div>
        <div class="styTaxYear">
          20<span class="styTYColor">19</span>
        </div>
        <div style="margin-left:3mm; text-align:left;padding-top:2mm;">
          Attachment<br/>Sequence No. <span class="styBoldText">43</span>
        </div>
      </div>
    </div>
    <!-- End Form Number and Name section -->
    <div class="styBB" style="height:8mm;width:187mm;">
      <div class="styNameBox" style="width:137mm;height:8mm;font-size:7pt;display:inline;">
        Name(s) shown on return <br/>
      <!--  <Name on return>-->         
          <xsl:call-template name="PopulateReturnHeaderFiler">
			<xsl:with-param name="TargetNode">Name</xsl:with-param>
			</xsl:call-template>
      </div>      
      <!--SSN on retun-->  
      <div style="width:50mm;height:8mm;font-size:7pt;font-weight:normal;padding-left:1mm;display:inline;">
       <b>Your social security number</b><br/>
       <span style="width:40mm;text-align:center;">
			<xsl:call-template name="PopulateReturnHeaderFiler">
				<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
			</xsl:call-template>
		</span>
      </div>
    </div>
    <!--Note-->
     <div class="styBB" style="width:187mm;">
     <div class="styGenericDiv" style="width:37mm; height:4.5mm;padding-left: 0px;font-size: 13pt;font-family: Arial;">
     <i><b>Before you begin:</b></i>
</div>
<div class="styLNDesc" style="width:149mm;height:16mm;">
         <li>See the instructions for Form 1040 or 1040-SR, line 18a, to make sure that <b>(a) </b>you can take the EIC, and <b>(b) </b>you have a qualifying child.</li>         
          <li>Be sure the child's name on line 1 and social security number (SSN) on line 2 agree with the child's social security card. 
          Otherwise, at the time we process your return, we may reduce or disallow your EIC. If the name or SSN on the child's social security card is not correct, call the Social Security Administration at 1-800-772-1213.</li> 
</div>
     </div>
     <!--Caution-->
     <div class="styBB" style="width:187mm;border-bottom-width:1px">
		 <div class="styBB" style="width:15mm; border-bottom-width: 0px;height: 15mm;padding-top:3mm;font-size:7pt;">
		<img src="{$ImagePath}/1040SchEIC2_Caution.gif" alt="Caution icon"/>
		</div>   
		<div class="styLNDesc" style="width:172mm;height:20mm;padding-top:3mm;">       
			<li>You can't claim the EIC for a child who didn't live with you for more than half of the year. </li>         
			<li style="padding-top:1mm;">If you take the EIC even though you are not eligible, you may not be allowed to take the credit for up to 10 years. See the instructions for details.</li> 
			<li style="padding-top:1mm;">It will take us longer to process your return and issue your refund if you do not fill in all lines that apply for each qualifying child.</li> 
		</div>
     </div>
   <!--Qualifying Child information table--> 
   <!-- BEGIN Qualifying Child title -->
   <table class="styTable" style="width:187mm;font-size:7pt;display:table;" cellspacing="0">
      <thead>
		<tr>
			<td colspan="2" style="border-top:2px solid black;border-bottom:3px solid black; width:79mm;height:8mm;">
				<div style="font-size: 13pt;padding-top:1.0mm;padding-bottom:1mm;"><font color="gray">Qualifying Child Information</font>
				</div>
			</td>
			<td scope="col" style="text-align:center;padding-top:0.5mm;padding-bottom:0.5mm;font-weight: bold;border-top:2px solid black;border-bottom:3px solid black; width:34mm; height:8mm;font-size:10pt;">Child 1</td>
			<td scope="col" style="text-align:center;padding-top:0.5mm;padding-bottom:0.5mm;font-weight: bold;border-top:2px solid black;border-bottom:3px solid black; width:34mm; height:8mm;font-size:10pt;"> Child 2</td>
			<td scope="col" style="text-align:center;padding-top:0.5mm;padding-bottom:0.5mm;font-weight: bold;border-top:2px solid black;border-bottom:3px solid black; width:34mm; height:8mm;font-size:10pt;"> Child 3</td>
		</tr>
         <!-- End Qualifying Child title --> 
    <!-- BEGIN Part II Line Items -->
      <!-- BEGIN Left Side Table of Part II-->
		<tr>
			<td style="width:4mm;height:4mm;padding-top:1mm;padding-left:1.5mm;"><b>1</b></td>
            <td style="width:75mm;height:4mm;padding-top:1mm;">
				<span style="font-size:9pt;"><b>Child's name</b></span>
            </td>       
			<th scope="col" style="width:34mm;height:4mm;border-left:1px solid black;font-weight:normal;">
				First name   <span style="width:2mm;"/> Last name
			</th>
			<th scope="col" style="width:34mm;height:4mm;border-left:1px solid black;font-weight:normal;">
				First name   <span style="width:2mm;"/> Last name
			</th>
			<th scope="col" style="width:34mm;height:4mm;border-left:1px solid black;font-weight:normal;">
				First name   <span style="width:2mm;"/> Last name
			</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>		
            <!--Line 1-->
		<tr>
            <td style="width:4mm;height:8mm;"><span style="width:1mm;"/></td>
            <td style="width:75mm;height:8mm;border-bottom:1px solid black;">
				If you have more than three qualifying children, you have to list only three to get the maximum credit.
            </td>    
			<xsl:if test="count($Form1040ScheduleEICData/QualifyingChildInformation) &lt;1">   
				<td style="width:34mm;height:8mm;border-left:1px solid black;border-bottom:1px solid black;padding-left:1mm;text-align:left;border-bottom-width:1px;">
					<span style="width:1mm;"/>
				</td>
				<td style="width:34mm;height:8mm;border-left:1px solid black;border-bottom:1px solid black;padding-left:1mm;text-align:left;border-bottom-width:1px;">
					<span style="width:1mm;"/>
				</td>
				<td style="width:34mm;height:8mm;border-left:1px solid black;border-bottom:1px solid black;padding-left:1mm;text-align:left;border-bottom-width:1px;">
					<span style="width:1mm;"/>
				</td>
			</xsl:if>   
			<xsl:if test="$Form1040ScheduleEICData/QualifyingChildInformation/ChildFirstAndLastName">     
				<xsl:call-template name="CreateTable">
					<xsl:with-param name="Start" select="position()"/>
					<xsl:with-param name="Stop" select="position()+3"/>
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation"/>		
				</xsl:call-template>       
			</xsl:if>   
		</tr>   
<!--Line 2-->
        <tr>
            <td style="vertical-align:top;width:4mm;padding-top:1mm;padding-left:1.5mm;"><b>2</b></td>
            <td scope="row" style="width:75mm;border-bottom:1px solid black;padding-top:1mm:padding-left:0mm;">
				<span style="font-size:9pt;"><b>Child's SSN</b></span><br/>
				<span style="font-weight:normal;"> The child must have an SSN as defined in the 
					instructions for Form 1040, or 1040-SR line 18a, unless the child was 
					born and died in 2019. If your child was born and died 
					in 2019 and did not have an SSN, enter "Died" on this 
					line and attach a copy of the child's birth certificate, 
					death certificate, or hospital medical records showing a live birth.
				</span>
            </td>   
            <td style="width:34mm;border-left:1px solid black;border-bottom:1px solid black;padding-top:10mm;text-align:center">  
				<xsl:choose>
					<xsl:when test="$Form1040ScheduleEICData/QualifyingChildInformation[1]/QualifyingChildSSN">
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/QualifyingChildSSN"/>			
						</xsl:call-template> 	
					</xsl:when>
					<xsl:when test="$Form1040ScheduleEICData/QualifyingChildInformation[1]/DiedLiteralCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/DiedLiteralCd"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<span class="styTableCellPad"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>	
			<td style="width:34mm;border-left:1px solid black;border-bottom:1px solid black;padding-top:10mm;text-align:center">  
				<xsl:choose>
					<xsl:when test="$Form1040ScheduleEICData/QualifyingChildInformation[2]/QualifyingChildSSN">
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/QualifyingChildSSN"/>			
						</xsl:call-template> 	
					</xsl:when>
					<xsl:when test="$Form1040ScheduleEICData/QualifyingChildInformation[2]/DiedLiteralCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/DiedLiteralCd"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<span class="styTableCellPad"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>	
			<td style="width:34mm;border-left:1px solid black;border-bottom:1px solid black;padding-top:10mm;text-align:center">  
				<xsl:choose>
					<xsl:when test="$Form1040ScheduleEICData/QualifyingChildInformation[3]/QualifyingChildSSN">
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/QualifyingChildSSN"/>			
						</xsl:call-template> 	
					</xsl:when>
					<xsl:when test="$Form1040ScheduleEICData/QualifyingChildInformation[3]/DiedLiteralCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/DiedLiteralCd"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<span class="styTableCellPad"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
        </tr>
		<!--Line 3 -->
        <tr>
            <td style="vertical-align:top;width:4mm;padding-top:1mm;padding-left:1.5mm;border-bottom:3px solid black;"><b>3</b></td>
            <td scope="row" style="width:75mm;border-bottom:3px solid black;vertical-align:top;padding-top:1mm;">
				<span style="font-size:9pt;"><b>Child's year of birth</b></span>
				<span style="font-weight:normal;">              
				</span>
            </td> 
            <xsl:if test="count($Form1040ScheduleEICData/QualifyingChildInformation/ChildBirthYr) &lt;1">   
				<td style="width:34mm;border-left:1px solid black;border-bottom:3px solid black;padding-top:1mm;text-align:left;padding-left:1mm;">      
					Year <span style="width:2mm;">              
					</span>        	
					<div style="font-size: 6pt;padding-top:1.0mm;padding-bottom:1mm;text-align:left;color:black;">
						<i>If born after 2000 <b>and</b> the child is younger than you (or your spouse, if filing jointly), skip lines 4a and 4b; go to line 5.</i>      
					</div>	                             
				</td>   
				<td style="width:34mm;border-left:1px solid black;border-bottom:3px solid black;padding-top:1mm;text-align:left;padding-left:1mm;">  		  
					Year  <span style="width:2mm;">              
					</span>        	
					<div style="font-size: 6pt;padding-top:1.0mm;padding-bottom:1mm;text-align:left;color:black;">
						<i>If born after 2000 <b>and</b> the child is younger than you (or your spouse, if filing jointly), skip lines 4a and 4b; go to line 5.</i>           
					</div>	                             
				</td>   
				<td style="width:34mm;border-left:1px solid black;border-bottom:3px solid black;padding-top:1mm;text-align:left;padding-left:1mm;">     		  
					Year  <span style="width:2mm;">              
					</span>        	
					<div style="font-size: 6pt;padding-top:1.0mm;padding-bottom:1mm;text-align:left;color:black;">
						<i>If born after 2000 <b>and</b> the child is younger than you (or your spouse, if filing jointly), skip lines 4a and 4b; go to line 5.</i>           
					</div>	                             
				</td>   
            </xsl:if>           
			<xsl:if test="$Form1040ScheduleEICData/QualifyingChildInformation/ChildBirthYr">    
				<xsl:call-template name="CreateTableChildYearOfBirth">
					<xsl:with-param name="Start" select="position()"/>
					<xsl:with-param name="Stop" select="position()+3"/>
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation/ChildBirthYr"/>			
				</xsl:call-template>
			</xsl:if>							   
        </tr>                      
		<!--Line 4-->        
		<tr>
			<td style="height:4.0mm;vertical-align:top;width:4.5mm;padding-top:1mm;border-bottom-width:0px;padding-left:1mm;"><b>4a</b></td>
            <td style="height:4.0mm;width:75mm;border-bottom:1px solid black;vertical-align:top;padding-top:1mm;">
				<span style="font-size:7pt;">Was the child under age 24 at the end of <br/>2019, a student, and younger than you (or your spouse, if filing jointly)? </span>           
            </td>	
			<td style="height:4.0mm;width:34mm;border-left:1px solid black;border-bottom:1px solid black;padding-top:1mm;border-top-width:0px;text-align:left;padding-left:4mm;"> 
			  <span>
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/ChildIsAStudentUnder24Ind"/>
				</xsl:call-template>
				<input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateYesCheckbox">
<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/ChildIsAStudentUnder24Ind"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleEICChildsaStudentunder24[1]</xsl:with-param>
					</xsl:call-template>	
				</input> 
				<label>
          			<xsl:call-template name="PopulateLabelYes">
            			<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/ChildIsAStudentUnder24Ind"/>
          				<xsl:with-param name="BackupName">IRS1040ScheduleEICChildsaStudentunder24[1]</xsl:with-param>
          			</xsl:call-template>
        			<span class="styBoldText">  Yes</span>
        		</label>  
				<span style="width:10mm;"/>        		  
				<input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/ChildIsAStudentUnder24Ind"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleEICChildsaStudentunder24[1]</xsl:with-param>
					</xsl:call-template>	
				</input> 
				<label>
          			<xsl:call-template name="PopulateLabelNo">
            			<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/ChildIsAStudentUnder24Ind"/>
          				<xsl:with-param name="BackupName">IRS1040ScheduleEICChildsaStudentunder24[1]</xsl:with-param>
          			</xsl:call-template>
        			<span class="styBoldText"> No</span>
        		</label>  
				</span>
				<div style="padding-top:1.0mm;padding-bottom:1mm;text-align:top;font-size:6pt;font-style:italic;">
					<div style="color:black;width:16mm;float:left;">Go to <br/>line 5.</div>
					<div style="color:black;width:16mm;float:left;">Go to line 4b.</div>
				</div>
			</td>	
			<td style="height:4.0mm;width:34mm;border-left:1px solid black;border-bottom:1px solid black;padding-top:1mm;border-top-width:0px;text-align:left;padding-left:4mm;">  
			  <span>
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/ChildIsAStudentUnder24Ind"/>
				</xsl:call-template>
				<input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/ChildIsAStudentUnder24Ind"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleEICChildsaStudentunder24[2]</xsl:with-param>
					</xsl:call-template>	
				</input> 
				<label>
          			<xsl:call-template name="PopulateLabelYes">
            				<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/ChildIsAStudentUnder24Ind"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleEICChildsaStudentunder24[2]</xsl:with-param>
          			</xsl:call-template>
        			<span class="styBoldText">  Yes</span>
        		</label>  
				<span style="width:10mm;"/>        		  
				<input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/ChildIsAStudentUnder24Ind"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleEICChildsaStudentunder24[2]</xsl:with-param>
					</xsl:call-template>	
				</input> 
				<label>
          			<xsl:call-template name="PopulateLabelNo">
            				<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/ChildIsAStudentUnder24Ind"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleEICChildsaStudentunder24[2]</xsl:with-param>
					</xsl:call-template>
        			<span class="styBoldText"> No</span>
        		</label>  
			  </span>
				<div style="padding-top:1.0mm;padding-bottom:1mm;text-align:top;font-size:6pt;font-style:italic;">
					<div style="color:black;width:16mm;float:left;">Go to <br/>line 5.</div>
					<div style="color:black;width:16mm;float:left;">Go to line 4b.</div>
				</div>
			</td>	
			<td style="height:4.0mm;width:34mm;border-left:1px solid black;border-bottom:1px solid black;padding-top:1mm;border-top-width:0px;text-align:left;padding-left:4mm;">
			  <span>
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/ChildIsAStudentUnder24Ind"/>
				</xsl:call-template>
				<input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/ChildIsAStudentUnder24Ind"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleEICChildsaStudentunder24[3]</xsl:with-param>
					</xsl:call-template>	
				</input> 
				<label>
          			<xsl:call-template name="PopulateLabelYes">
            			<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/ChildIsAStudentUnder24Ind"/>
          				<xsl:with-param name="BackupName">IRS1040ScheduleEICChildsaStudentunder24[3]</xsl:with-param>
          			</xsl:call-template>
        			<span class="styBoldText">  Yes</span>
        		</label>  
				<span style="width:10mm;"/>        		  
				<input type="checkbox" class="styCkbox" name="Checkbox">
				<xsl:call-template name="PopulateNoCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/ChildIsAStudentUnder24Ind"/>
					 <xsl:with-param name="BackupName">IRS1040ScheduleEICChildsaStudentunder24[3]</xsl:with-param>
				</xsl:call-template>	
				</input> 
				<label>
          			<xsl:call-template name="PopulateLabelNo">
            			<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/ChildIsAStudentUnder24Ind"/>
          				<xsl:with-param name="BackupName">IRS1040ScheduleEICChildsaStudentunder24[3]</xsl:with-param>
          			</xsl:call-template>
        			<span class="styBoldText"> No</span>
        		</label>  
        		</span>
				<div style="padding-top:1.0mm;padding-bottom:1mm;text-align:top;font-size:6pt;font-style:italic;">
					<div style="color:black;width:16mm;float:left;">Go to <br/>line 5.</div>
					<div style="color:black;width:16mm;float:left;">Go to line 4b.</div>
				</div>
			</td>	   
        </tr>
		<!--Line 4b-->  
        <tr>
            <td style="height:4.0mm;vertical-align:top;width:4mm;padding-top:1mm;border-bottom:3px solid black;padding-left:3.5mm;"><b>b</b></td>
            <td style="height:4.0mm;width:75mm;vertical-align:top;padding-top:1mm;border-bottom:3px solid black;">
				Was the child permanently and totally disabled during any part of 2019? 
            </td>    
			<td style="height:4.0mm;width:34mm;padding-top:1mm;text-align:left;padding-left:4mm;border-left:1px solid black;border-bottom:3px solid black;">
			  <span>
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/ChildPermanentlyDisabledInd"/>
				</xsl:call-template>
				<input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/ChildPermanentlyDisabledInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleEICChildPermanentlyDisabledInd[1]</xsl:with-param>
					</xsl:call-template>	
				</input> 
				<label>
          			<xsl:call-template name="PopulateLabelYes">
           				<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/ChildPermanentlyDisabledInd"/>
          				<xsl:with-param name="BackupName">IRS1040ScheduleEICChildPermanentlyDisabledInd[1]</xsl:with-param>
          			</xsl:call-template>
        			<span class="styBoldText">  Yes</span>
        		</label>  
				<span style="width:10mm;"/>        		  
				<input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/ChildPermanentlyDisabledInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleEICChildPermanentlyDisabledInd[1]</xsl:with-param>
					</xsl:call-template>	
				</input> 
				<label>
          			<xsl:call-template name="PopulateLabelNo">
            			<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/ChildPermanentlyDisabledInd"/>
          				<xsl:with-param name="BackupName">IRS1040ScheduleEICChildPermanentlyDisabledInd[1]</xsl:with-param>
          			</xsl:call-template>
        			<span class="styBoldText"> No</span>
        		</label>  
        		</span>
				<div style="padding-top:1.0mm;padding-bottom:1mm;text-align:top;width:33mm;font-size:6pt;color:black;">
					<div style="width:13mm;float:left;font-style:italic;">Go to <br/>line 5.</div>
					<div style="width:20mm;float:left;"> The child is not a <br/>qualifying child.</div>
				</div>
			</td>	
			<td style="height:4.0mm;width:34mm;padding-top:1mm;text-align:left;padding-left:4mm;border-left:1px solid black;border-bottom:3px solid black;">
			  <span>
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/ChildPermanentlyDisabledInd"/>
				</xsl:call-template>
				<input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/ChildPermanentlyDisabledInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleEICChildPermanentlyDisabledInd[2]</xsl:with-param>
					</xsl:call-template>	
				</input> 
				<label>
          			<xsl:call-template name="PopulateLabelYes">
            			<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/ChildPermanentlyDisabledInd"/>
          				<xsl:with-param name="BackupName">IRS1040ScheduleEICChildPermanentlyDisabledInd[2]</xsl:with-param>
          			</xsl:call-template>
       				<span class="styBoldText">  Yes</span>
        		</label>  
				<span style="width:10mm;"/>        		  
				<input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/ChildPermanentlyDisabledInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleEICChildPermanentlyDisabledInd[2]</xsl:with-param>
					</xsl:call-template>	
				</input> 
				<label>
          			<xsl:call-template name="PopulateLabelNo">
            			<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/ChildPermanentlyDisabledInd"/>
          				<xsl:with-param name="BackupName">IRS1040ScheduleEICChildPermanentlyDisabledInd[2]</xsl:with-param>
          			</xsl:call-template>
        			<span class="styBoldText"> No</span>
        		</label>  
        		</span>
				<div style="padding-top:1.0mm;padding-bottom:1mm;text-align:top;width:33mm;font-size:6pt;color:black;">
					<div style="width:13mm;float:left;font-style:italic;">Go to <br/>line 5.</div>
					<div style="width:20mm;float:left;"> The child is not a <br/>qualifying child.</div>
				</div>
			</td>	
			<td style="height:4.0mm;width:34mm;border-right-width:0px;padding-top:1mm;border-top-width:0px;text-align:left;padding-left:4mm;border-left:1px solid black;border-bottom:3px solid black;">
			  <span>
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/ChildPermanentlyDisabledInd"/>
				</xsl:call-template>
				<input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/ChildPermanentlyDisabledInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleEICChildPermanentlyDisabledInd[3]</xsl:with-param>
					</xsl:call-template>	
				</input> 
				<label>
          			<xsl:call-template name="PopulateLabelYes">
            			<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/ChildPermanentlyDisabledInd"/>
          				<xsl:with-param name="BackupName">IRS1040ScheduleEICChildPermanentlyDisabledInd[3]</xsl:with-param>
          			</xsl:call-template>
        			<span class="styBoldText">  Yes</span>
        		</label>  
				<span style="width:10mm;"/>        		  
				<input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/ChildPermanentlyDisabledInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleEICChildPermanentlyDisabledInd[3]</xsl:with-param>
					</xsl:call-template>	
				</input> 
				<label>
          			<xsl:call-template name="PopulateLabelNo">
            			<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/ChildPermanentlyDisabledInd"/>
          				<xsl:with-param name="BackupName">IRS1040ScheduleEICChildPermanentlyDisabledInd[3]</xsl:with-param>
          			</xsl:call-template>
        			<span class="styBoldText"> No</span>
        		</label>  
        		</span>
				<div style="padding-top:1.0mm;padding-bottom:1mm;text-align:top;width:33mm;font-size:6pt;color:black;">
					<div style="width:13mm;float:left;font-style:italic;">Go to <br/>line 5.</div>
					<div style="width:20mm;float:left;"> The child is not a <br/>qualifying child.</div>
				</div>
			</td>	
		</tr>            
		<!--Line 5-->
        <tr>
			<td style="vertical-align:top;width:4mm;padding-top:2mm;padding-left:1.5mm;"><b>5</b></td>
            <td style="width:75mm;border-bottom:1px solid black;">
             <span style="font-size:9pt;"><b>Child's relationship to you</b></span><br/>
             <span style="font-weight:normal;"> (for example, son, daughter, grandchild,<br/>
             niece, nephew, foster child, etc.)    
             </span>
                  </td>    
             <td style="width:34mm;border-left:1px solid black;border-bottom:1px solid black;padding-top:10mm;text-align:center">  
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/ChildRelationshipCd"/>			
				</xsl:call-template> 	
				<span class="styTableCellPad"/>
			</td>	
              <td style="width:34mm;border-left:1px solid black;border-bottom:1px solid black;padding-top:10mm;text-align:center">  
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/ChildRelationshipCd"/>			
				</xsl:call-template> 	
				<span class="styTableCellPad"/>
			</td>	
			  <td style="width:34mm;border-left:1px solid black;border-bottom:1px solid black;padding-top:10mm;text-align:center">  
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/ChildRelationshipCd"/>			
				</xsl:call-template> 	
				<span class="styTableCellPad"/>
			</td>	
			</tr>           
 <!--Line 6-->
  <tr>
    <td style="vertical-align:top;width:4mm;padding-top:1mm;padding-left:1.5mm;"><b>6</b></td>
       <td style="width:75mm;border-bottom-width:0px;padding-top:1mm">
             <span style="font-size:9pt;"><b>Number of months child lived with</b></span><br/>
             <span style="font-size:9pt;"><b>you in the United States during 2019</b></span><br/><br/>
             <li>If the child lived with you for more than half of<br/>
				2019 but less than 7 months, enter "7".</li>         
          <li style="padding-top:2mm;">If the child was born or died in 2019 and your<br/>
			home was the child's home for more than half the<br/>
			time he or she was alive during 2019, enter "12."<br/></li> 
   </td> 
   <!--If child lives with you-->
	 <xsl:if test="$Form1040ScheduleEICData/QualifyingChildInformation[1]/MonthsChildLivedWithYouCnt">
		<td style="width:34mm;border-left:1px solid black;border-bottom:0px solid black;padding-top:18mm;"> 
			<div style="padding-left:16mm;">
				<div class="styFixedUnderline" style="width:10mm;"> 		 	   	
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/MonthsChildLivedWithYouCnt"/>
					</xsl:call-template>
				</div> months
			</div>
			<br/>
			<span style="width:1mm;"/> 
			<span style="color:black"><i>Do not enter more than 12<br/>months.</i></span>                                                   
		</td>
     </xsl:if>
	 <xsl:if test="$Form1040ScheduleEICData/QualifyingChildInformation[1]/KidnappedChildCd">
		<td style="width:34mm;border-left:1px solid black;border-bottom:0px solid black;padding-top:18mm;"> 
			<div style="padding-left:16mm;">
				<div class="styFixedUnderline" style="width:10mm;"> 		 	   	
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/KidnappedChildCd"/>
					</xsl:call-template>
				</div> months
			</div>
			<br/>
			<span style="width:1mm;"/> 
			<span style="color:black"><i>Do not enter more than 12<br/>months.</i></span>                                                   
		</td>
     </xsl:if> 
	 <xsl:if test="$Form1040ScheduleEICData/QualifyingChildInformation[2]/MonthsChildLivedWithYouCnt">
		<td style="width:34mm;border-left:1px solid black;border-bottom:0px solid black;padding-top:18mm;"> 
			<div style="padding-left:16mm;">
				<div class="styFixedUnderline" style="width:10mm;"> 		 	   	
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/MonthsChildLivedWithYouCnt"/>
					</xsl:call-template>
				</div> months
			</div>
			<br/>
			<span style="width:1mm;"/> 
			<span style="color:black"><i>Do not enter more than 12<br/>months.</i></span>                                                   
		</td>
     </xsl:if>
	 <xsl:if test="$Form1040ScheduleEICData/QualifyingChildInformation[2]/KidnappedChildCd">
		<td style="width:34mm;border-left:1px solid black;border-bottom:0px solid black;padding-top:18mm;"> 
			<div style="padding-left:16mm;">
				<div class="styFixedUnderline" style="width:10mm;"> 		 	   	
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/KidnappedChildCd"/>
					</xsl:call-template>
				</div> months
			</div>
			<br/>
			<span style="width:1mm;"/> 
			<span style="color:black"><i>Do not enter more than 12<br/>months.</i></span>                                                   
		</td>
     </xsl:if> 
	 <xsl:if test="$Form1040ScheduleEICData/QualifyingChildInformation[3]/MonthsChildLivedWithYouCnt">
		<td style="width:34mm;border-left:1px solid black;border-bottom:0px solid black;padding-top:18mm;"> 
			<div style="padding-left:16mm;">
				<div class="styFixedUnderline" style="width:10mm;"> 		 	   	
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/MonthsChildLivedWithYouCnt"/>
					</xsl:call-template>
				</div> months
			</div>
			<br/>
			<span style="width:1mm;"/> 
			<span style="color:black"><i>Do not enter more than 12<br/>months.</i></span>                                                   
		</td>
     </xsl:if>
	 <xsl:if test="$Form1040ScheduleEICData/QualifyingChildInformation[3]/KidnappedChildCd">
		<td style="width:34mm;border-left:1px solid black;border-bottom:0px solid black;padding-top:18mm;"> 
			<div style="padding-left:16mm;">
				<div class="styFixedUnderline" style="width:10mm;"> 		 	   	
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/KidnappedChildCd"/>
					</xsl:call-template>
				</div> months
			</div>
			<br/>
			<span style="width:1mm;"/> 
			<span style="color:black"><i>Do not enter more than 12<br/>months.</i></span>                                                   
		</td>
     </xsl:if> 
        <!--Blank lines for no children-->
     <xsl:if test="(count($Form1040ScheduleEICData/QualifyingChildInformation) &lt;1) ">
		<td style="width:34mm;border-left:1px solid black;border-bottom:0px solid black;padding-top:18mm;"> 
			<div style="padding-left:16mm;">
				<div class="styFixedUnderline" style="width:10mm;"> 		 	   	
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[1]/MonthsChildLivedWithYouCnt"/>
					</xsl:call-template>
				</div> months
			</div>
			<br/>
			<span style="width:1mm;"/> 
			<span style="color:black"><i>Do not enter more than 12<br/>months.</i></span>                                                   
		</td>		
	 </xsl:if>  	
     <!--Blank lines for no children-->
    <xsl:if test="(count($Form1040ScheduleEICData/QualifyingChildInformation) &lt;2)  ">
		<td style="width:34mm;border-left:1px solid black;border-bottom:0px solid black;padding-top:18mm;"> 
			<div style="padding-left:16mm;">
				<div class="styFixedUnderline" style="width:10mm;">	 	   	
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[2]/MonthsChildLivedWithYouCnt"/>
					</xsl:call-template>
				</div> months
			</div>
			<br/>
			<span style="width:1mm;"/> 
			<span style="color:black"><i>Do not enter more than 12<br/>months.</i></span>                                                   
		</td>	
	</xsl:if>  	
     <!--Blank lines for no children-->
    <xsl:if test="(count($Form1040ScheduleEICData/QualifyingChildInformation) &lt;3)  ">
		<td style="width:34mm;border-left:1px solid black;border-bottom:0px solid black;padding-top:18mm;"> 
			<div style="padding-left:16mm;">
				<div class="styFixedUnderline" style="width:10mm;"> 		 	   	
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData/QualifyingChildInformation[3]/MonthsChildLivedWithYouCnt"/>
					</xsl:call-template>
				</div> months
			</div>
			<br/>
			<span style="width:1mm;"/> 
			<span style="color:black"><i>Do not enter more than 12<br/>months.</i></span>                                                   
		</td>	
	</xsl:if>  	
          </tr> 
        </tbody>
      </table> 
   <!--TIP-->
   <div class="styFixedUnderline" style="width:187mm;padding-top:0mm;height:0.5mm;border-bottom-width:0px;border-top-width:1px;">  
    <!-- Footer-->   
      <div style="float:left;">
        <span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions. </span>
          <span style="width:10px;"/>
        <span style="font-weight:normal;">Cat. No. 13339M </span>
        <br/>
      </div>        
      <div style="float:right;">
        <span style="width:20px;"/>  
        <span class="styBoldText">Schedule EIC (Form 1040 or 1040-SR) 2019 </span>
      </div>    
          </div>   
    <br/> <br/>
     <div class="pageEnd" style="width:187mm;">    </div>
      <!-- BEGIN Left Over Table -->  
        <!-- Additonal Data Title Bar and Button -->
          <!-- Additonal Data Title Bar and Button -->
               <div class="styLeftOverTitleLine" id="LeftoverData">
                  <div class="styLeftOverTitle">
                  Additional Data        
                  </div>
                  <div class="styLeftOverButtonContainer">
                     <input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
                  </div>      
               </div>
              
        <!-- Additional Data Table -->
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleEICData"/>
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>    
          <xsl:for-each select="$Form1040ScheduleEICData/QualifyingChildInformation">
			  <xsl:call-template name="PopulateLeftoverRow">
				  <xsl:with-param name="Desc">Line 1 - Child <xsl:number value="position()" format="1"/> Name Control</xsl:with-param>
				  <xsl:with-param name="TargetNode" select="QualifyingChildNameControlTxt"/>
				  <xsl:with-param name="DescWidth" select="100"/>
			  </xsl:call-template>
          </xsl:for-each>
        </table>
      <!-- END Left Over Table -->        
    </form>
  </body>
</html>
</xsl:template>
<xsl:template name="CreateTable">
	<xsl:param name="Start"/>
	<xsl:param name="Stop"/>
	<xsl:param name="TargetNode"/>
		<xsl:if test="$Start &lt; $Stop">
			<td style="width:34mm;border-right-width:0px;padding-left:1mm;text-align:left;border-left:1px solid black;border-bottom:1px solid black;">
			<xsl:call-template name="PopulateName">
				<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
			</xsl:call-template>
			</td>
			<xsl:call-template name="CreateTable">
			<xsl:with-param name="Start" select="$Start + 1"/>
			<xsl:with-param name="Stop" select="$Stop"/>
			<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
		</xsl:if>
</xsl:template>
<xsl:template name="PopulateName">
	<xsl:param name="TargetNode"/>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode/ChildFirstAndLastName/PersonFirstNm"/>
			</xsl:call-template>
			<span style="width:1mm;"/>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode/ChildFirstAndLastName/PersonLastNm"/>
			</xsl:call-template>
			<span style="width:1mm;"/>
			<xsl:call-template name="LinkToLeftoverDataTableInline">
				<xsl:with-param name="Desc">Line 1 - Qualifying Child Name Control</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$TargetNode/QualifyingChildNameControlTxt"/>
			</xsl:call-template>	     
</xsl:template>
<xsl:template name="CreateTableChildYearOfBirth">
	<xsl:param name="Start"/>
	<xsl:param name="Stop"/>
	<xsl:param name="TargetNode"/>
		<xsl:if test="$Start &lt; $Stop">
			  <td style="width:34mm;border-right-width:0px;padding-top:1mm;text-align:center;border-left:1px solid black;border-bottom:3px solid black;"> 			  
		Year  <span style="width:2mm;">              
             </span>        	
			<xsl:call-template name="PopulateYear1">
				<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
			</xsl:call-template>		
			<div style="font-size:6pt;padding-top:1.0mm;padding-bottom:1mm;text-align:left;color:black;padding-left:2mm;">           
		<i>If born after 2000 <b>and</b> the child is younger than you (or your spouse, if filing jointly), skip lines 4a and 4b; go to line 5.</i>
              </div>	                             
			</td>			
			<xsl:call-template name="CreateTableChildYearOfBirth">
			<xsl:with-param name="Start" select="$Start + 1"/>
			<xsl:with-param name="Stop" select="$Stop"/>
			<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
		</xsl:if>
</xsl:template>
<xsl:template name="PopulateYear1">
	<xsl:param name="TargetNode"/>
			<xsl:call-template name="PopulateYear">
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>		
</xsl:template>	
<xsl:template name="AddPositionNumber">
  <xsl:if test="position()=1">1</xsl:if>
  <xsl:if test="position()=2">2</xsl:if> 
    <xsl:if test="position()=3">3</xsl:if>  
</xsl:template>
</xsl:stylesheet>