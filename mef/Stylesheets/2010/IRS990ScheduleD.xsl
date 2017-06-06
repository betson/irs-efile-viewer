<?xml version="1.0" encoding="UTF-8" ?>

<!-- This stylesheet was created by Sandy Cram and last modified on 11/25/2008 -->
<!-- This stylesheet was last modified by Sandy Cram on 1/8/2009  added shading for SRD -->
<!-- This stylesheet was modified on 7/08/2009 for TY2009/PY2010 changes by Sandy Cram-->
<!-- This stylesheet was modified on 8/26/2009 for TY2009/PY2010 BSP-091865OTH changes by Sandy Cram-->
<!-- Last modified on 10/28/2009 by Sandy Cram  Updates made per BSP-092774OTH -->
<!-- Modified by Sandy Cram on 12/17/2009 -->
<!-- Modified by Robert Jones on 08/10/2010 BSP-101319OTH -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS990ScheduleDStyle.xsl"/>
<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS990ScheduleD" />
<xsl:template match="/">

<html>
  <head>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private" />
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="Description" content="IRS Form 990 Schedule D" />
  
  
  
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>
    <style type="text/css">
<xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS990ScheduleDStyle"></xsl:call-template>
        <xsl:call-template name="AddOnStyle"></xsl:call-template>
 </xsl:if>
    </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
    <form name="Form990ScheduleD">
      <xsl:call-template name="DocumentHeader"></xsl:call-template>
      <div class="styTBB" style="width:187mm;">
        <div class="styFNBox" style="width:28mm;height:20mm;">
          <div style="padding-top:1mm;font-weight:bold;font:8pt">
       <span style="font-size:10pt;font-weight:bold;font-familiy:'Arial Narrow';">SCHEDULE D</span>
     <br />
     <span style="font-size:8pt;font-weight:bold;font-family:'Arial ';">(Form 990)</span>
     <br />
            <!--<xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData"/>
            </xsl:call-template> -->           
          </div>
          <div style="padding-top:7mm;">
            <span class="styAgency">Department of the Treasury</span><br/>
            <span class="styAgency">Internal Revenue Service</span>
          </div>
        </div>
        <div class="styFTBox" style="width:128mm;">
          <div class="styMainTitle" style="padding-top:6mm">Supplemental Financial Statements</div>
          <div class="styFBT" style="height:5mm;padding-top:0mm">
           <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 
           Complete if the organization answered "Yes," to
		Form 990, <br />Part IV, line 6, 7, 8, 9, 10, 11,  or 12.<br />
          <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 
           Attach to Form 990. 
           <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 
          See separate instructions. 
           </div>
        
        </div>
        <div class="styTYBox" style="width:30mm;">
          <div class="styOMB" style="height:2mm;">OMB No. 1545-0047</div>
          <div class="styTY" >20<span class="styTYColor">10</span></div>
          <div class="styPartName" style="height:8mm; width:30.5mm;padding-top:0.3mm">Open to Public Inspection</div>
        </div>
      </div>

<!-- Begin Name and Identifying Number Section-->      
<div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
  <div class="styFNBox" style="width:134mm;height:8mm;padding-left:2mm">
     <span class="styBoldText">Name of the organization</span>
<br/>
    <div style="font-family:verdana;font-size:6pt;height:6.25mm">
     <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
    </xsl:call-template>
    <br />
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
    </xsl:call-template>
   </div> 
  </div>
  
  <div class="styGenericDiv" style="width:52mm;height:4mm;padding-left:1mm;">
    <span class="styBoldText">Employer identification number</span>
    <br/><br/>
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">EIN</xsl:with-param>
    </xsl:call-template>
  </div>
</div>
<!-- End Name and Identifying Number Section-->      
<!-- Part I -->
<div class="styBB" style="width:187mm;float:none;">
      <div class="styPartName" style="float:left;width:14mm;">Part I</div>
      <div class="styPartDesc" style="width:172mm;">Organizations Maintaining Donor Advised Funds or Other Similar Funds or Accounts. 
        <span style="font-size: 8pt;font-weight:normal">
          Complete if the organization answered "Yes" to Form 990, Part IV, line 6.
        </span>
      </div>
    </div>
<!-- End Part I-->
 <!-- Begin Part I Table-->
    <table class="styTable" style="font-size:7pt;width:187mm;border-bottom-width:1px" cellspacing="0">
      <thead>
        <tr scope="col">
          <th scope="col" colspan="2" align="center" style="width:66mm;height:4mm;padding-top:0mm; border-bottom:1 solid black">
            
          </th>
          
          <th scope="col" align="center" style="width:120mm;font-size:7pt;border-left:1 solid black;padding-top:0mm;  border-bottom:1 solid black">(a)
            <span class="styNormalText"> Donor advised funds</span>

          </th>
          <th scope="col" align="center" style="width:120mm;font-size:7pt;border-left:1 solid black; padding-top:0mm; border-bottom:1 solid black">
            (b)<span class="styNormalText"> Funds and other accounts</span>
          </th>
         
        </tr>
      </thead>
      <tfoot></tfoot>
  <tbody valign="top">
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 1mm;height:4.5mm;">1</td>
      <td class="styLNDesc" style="height:4.5mm;padding-left:2mm;">
        Total number at end of year
       <span class="styIRS990ScheduleD_DotSpacing">.......</span>

     
        
      </td>

      <td class="styLNAmountBox"  style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
	<xsl:call-template name="PopulateText">
		<xsl:with-param name="TargetNode" select="$FormData//NumberDAFsHeld" />	</xsl:call-template>
   </td>
      <td class="styLNAmountBox" style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
	<xsl:call-template name="PopulateText">
		<xsl:with-param name="TargetNode" select="$FormData/NumberFundsHeld" />
	</xsl:call-template>
   </td>
    
    </tr>
    <tr>
      <td class="styLNLeftNumBox" style="padding-left: 1mm;height:4.5mm;">2</td>
      <td class="styLNDesc" style="height:4.5mm;padding-left:2mm;">
        Aggregate contributions to (during year)
        <span class="styIRS990ScheduleD_DotSpacing">...</span>
     
      </td>

      <td class="styLNAmountBox"  style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/DonorAdvisedContributions" />
	</xsl:call-template>
   </td>
      <td class="styLNAmountBox" style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/ContribToFundsAndOtherAccounts" />
	</xsl:call-template>
   </td>
     </tr>
    
  <tr>
      <td class="styLNLeftNumBox" style="padding-left: 1mm;height:4.5mm;">3</td>
      <td class="styLNDesc" style="height:4.5mm;padding-left:2mm;">
       Aggregate grants from (during year)
       <span class="styIRS990ScheduleD_DotSpacing">...</span>
        
      </td>

<!--<td class="styLNRightNumBox" style="width:6mm;height:4.5mm;">25a</td>-->
      <td class="styLNAmountBox"  style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/GrantsPaidFromDonorFunds" />	
	</xsl:call-template>
   </td>
      <td class="styLNAmountBox" style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/GrantsFundsAndOtherAccounts" />
	</xsl:call-template>
   </td>
    
    </tr>
<tr>
      <td class="styLNLeftNumBox" style="height:4.5mm;">4</td>
      <td class="styLNDesc" style="height:4.5mm;padding-left:2mm;">
       Aggregate value at end of year
       <span class="styIRS990ScheduleD_DotSpacing"> .......</span>
        
      </td>

<!--<td class="styLNRightNumBox" style="width:6mm;height:4.5mm;">25a</td>-->
      <td class="styLNAmountBox"  style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/AggregateDAFValue" />	
	</xsl:call-template>
   </td>
      <td class="styLNAmountBox" style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/AggregateFundValue" />
	</xsl:call-template>
   </td>
  
    </tr>

     </tbody>
    </table>
<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-top:1mm">5</div>
 <div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:1mm">
  Did the organization inform all donors and donor advisors in writing that the assets held in donor advised<br />funds are the organization's property, subject to the organization's exclusive legal control?
<span class="styIRS990ScheduleD_DotSpacing">............</span>
 </div>
<span style="padding-top:1mm;padding-top:4mm">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/DisclosedOrgsLegalControl" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedOrgsLegalControl" />
        <xsl:with-param name="BackupName">Form990ScheduleDDisclosedOrgsLegalControlYes</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedOrgsLegalControl" />
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:4mm"></span>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/DisclosedOrgsLegalControl" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedOrgsLegalControl" />
         <xsl:with-param name="BackupName">Form990ScheduleDDisclosedOrgsLegalControlNo</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedOrgsLegalControl" />
        </xsl:call-template>            
        No
      </label>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">6</div>
 <div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:1mm">
  Did the organization inform all grantees, donors, and donor advisors in writing that grant funds may be <br />used only for charitable purposes and not for the benefit of the donor or donor advisor, or for any other purpose conferring impermissible private benefit. 
<span class="styIRS990ScheduleD_DotSpacing">...................................</span>
 </div>
<span style="padding-top:1mm;padding-top:7mm">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/DisclosedForCharitablePurposes" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedForCharitablePurposes" />
      <xsl:with-param name="BackupName">Form990ScheduleDDisclosedForCharitablePurposesYes</xsl:with-param>
      </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:7mm">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedForCharitablePurposes" />
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:7mm"></span>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/DisclosedForCharitablePurposes" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedForCharitablePurposes" />
        <xsl:with-param name="BackupName">Form990ScheduleDDisclosedForCharitablePurposesNo</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:7mm">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedForCharitablePurposes" />
        </xsl:call-template>            
        No
      </label>
</div>

     


<!-- Part II-->
<div class="styBB" style="width:187mm;float:none;border-top-width:1px">
      <div class="styPartName" style="float:left;width:14mm;">Part II</div>
       <div class="styPartDesc" style="width:172mm;">Conservation Easements.  
        <span style="font-size: 8pt;font-weight:normal">
          Complete if the organization answered "Yes" to Form 990, Part IV, line 7.
        </span>
      </div>
    </div>
 
 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">1</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:1mm">
Purpose(s) of conservation easements held by the organization (check all that apply).</div>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:0mm;"></div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:0mm">

<span style="width:90mm;">
<span style="padding-top:0mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/PreservationForPublicUse" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/PreservationForPublicUse" />
       <xsl:with-param name="BackupName">Form990ScheduleDPreservationForPublicUse</xsl:with-param>
       </xsl:call-template>
      </input>
      </span>
      <label style="padding-top:0mm;padding-left:2mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/PreservationForPublicUse" />
        </xsl:call-template>            
       Preservation of land for public use (e.g., recreation or pleasure)    </label>
      </span>

<span style="width:80mm;padding-left:4mm">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/HistoricLandArea" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/HistoricLandArea" />
        <xsl:with-param name="BackupName">Form990ScheduleDHistoricLandArea</xsl:with-param>
        </xsl:call-template>
      </input>
     
      <label style="padding-top:0mm;padding-left:2mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/HistoricLandArea" />
        </xsl:call-template>            
      Preservation of an historically importantly land area
      </label>
      </span>
</div>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: mm;padding-top:1mm"></div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:0mm">

<span style="width:90mm;">
<span style="padding-top:0mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/ProtectionOfNaturalHabitat" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/ProtectionOfNaturalHabitat" />
        <xsl:with-param name="BackupName">Form990ScheduleDProtectionOfNaturalHabitat</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="padding-left:2mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/ProtectionOfNaturalHabitat" />
        </xsl:call-template>            
       Protection of natural habitat
      </label>
      </span>

<span style="width:80mm;padding-left:4mm">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/HistoricStructure" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/HistoricStructure" />
        <xsl:with-param name="BackupName">Form990ScheduleDHistoricStructure</xsl:with-param>
        </xsl:call-template>
      </input>
      
      <label style="padding-top:0mm;padding-left:2mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/HistoricStructure" />
        </xsl:call-template>            
      Preservation of a certified historic structure
      </label>
      
     </span>
</div>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:0mm"></div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:0mm">

<span style="width:90mm;">
<span style="padding-top:0mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/PreservationOfOpenSpace" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/PreservationOfOpenSpace" />
        <xsl:with-param name="BackupName">Form990ScheduleDPreservationOfOpenSpace</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="padding-left:2mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/PreservationOfOpenSpace" />
         
</xsl:call-template>            
       Preservation of open space
        
      </label>
      </span>
</div>
</div>
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="padding-left:1mm;padding-top:1mm;">2</div>
 <div class="styLNDesc" style="width:160mm;border-right-width:0;padding-top:1mm;">
Complete lines 2a–2d if the organization held a qualified conservation contribution 
 in the form of a conservation easement on the last day of the tax year. 
 </div>
 </div>
  <table class="styTable" style="font-size:7pt;width:187mm;border-bottom-width:1px" cellspacing="0">
      <thead>
        <tr scope="col">
		<th scope="col" style="width:7.2mm; border:0px 0px 0px 0px; height:4mm;"><span class="styNBSP"/></th><!--Left Num Box-->
		<th scope="col" style="border:0px 0px 0px 0px; height:4mm;"><span class="styNBSP"/></th><!--Description-->
		<th scope="col" style="width:8mm; border:1px 1px 1px 1px solid black; height:4mm;background-color:lightgrey"><span class="styNBSP"/></th><!--Table num box-->
		<th scope="col" style="width:45mm; border: 1px solid black; border-left: 0px; height:4mm;font-weight:bold; text-align:center">Held at the End of the Year </th><!--Table Description-->
        </tr>
      </thead>
      <tfoot></tfoot>
  <tbody valign="top">
  	<tr>
		<td class="styLNLeftNumBox" style="width:4.2mm; height:4mm;padding-left:3mm">a</td>
		<td style="border:0px 0px 0px 0px; height:4mm;">
			Total number of conservation easements
			<span class="styIRS990ScheduleD_DotSpacing">.......................</span>
		</td>
		<td class="styLNRightNumBox" style="border:1px solid black; border-top: 0px;height:4mm;vertical-align:bottom;padding-right:0.75mm;">2a</td>
		<td class="styLNAmountBox" style="width:45mm;border: 1px solid black; border-left: 0px; border-top:0px; vertical-align:bottom;padding-right:0.75mm;height:4mm;text-align:right">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/TotalNumberOfEasements" />
			</xsl:call-template>
		</td>
	</tr>
	<tr>
		<td class="styLNLeftNumBox" style="width:4.2mm; height:4mm;padding-left:3mm">b</td>
		<td style="border:0px 0px 0px 0px; height:4mm;">
			Total acreage restricted by conservation easements
			<span class="styIRS990ScheduleD_DotSpacing">..................</span>
		</td>
		<td class="styLNRightNumBox" style="border:1px solid black; border-top: 0px;height:4mm;vertical-align:bottom;padding-right:0.75mm;">2b</td>
		<td class="styLNAmountBox" style="width:45mm;border: 1px solid black; border-left: 0px; border-top:0px; vertical-align:bottom;padding-right:0.75mm;height:4mm;text-align:right">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/TotalAcreage" />
			</xsl:call-template>
		</td>
	</tr>
	<tr>
		<td class="styLNLeftNumBox" style="width:4.2mm; height:4mm;padding-left:3mm">c</td>
		<td style="border:0px 0px 0px 0px; height:4mm;">
			Number of conservation easements on a certified historic structure included in (a)
			<span class="styIRS990ScheduleD_DotSpacing">.....</span>
		</td>
		<td class="styLNRightNumBox" style="border:1px solid black; border-top: 0px;height:4mm;vertical-align:bottom;padding-right:0.75mm;">2c</td>
		<td class="styLNAmountBox" style="width:45mm;border: 1px solid black; border-left: 0px; border-top:0px; vertical-align:bottom;padding-right:0.75mm;height:4mm;text-align:right">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/NmbrHistStructEasements" />
			</xsl:call-template>
		</td>
	</tr>
	<tr>
		<td class="styLNLeftNumBox" style="width:4.2mm; height:4mm;padding-left:3mm">d</td>
		<td style="border:0px 0px 0px 0px; height:4mm;">
			Number of conservation easements included in (c) acquired after 8/17/06
			<span class="styIRS990ScheduleD_DotSpacing">........</span>
		</td>
		<td class="styLNRightNumBox" style="border:1px solid black; border-top: 0px;height:4mm;vertical-align:bottom;padding-right:0.75mm;">2d</td>
		<td class="styLNAmountBox" style="width:45mm;border: 1px solid black; border-left: 0px; border-top:0px; vertical-align:bottom;padding-right:0.75mm;height:4mm;text-align:right">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/NmbrHistStructEasementsAfter" />
			</xsl:call-template>
		</td>
	</tr>
 </tbody>
  </table>
 
 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">3</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:1mm">
 Number of conservation easements modified, transferred, released, extinguished, or terminated by the organization during <br />the taxable year
  <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 

 <span class="styIRS990ScheduleDUnderlineAmount" style="float:none;padding-left:2mm;text-align:center;" >
 
 <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/NmbrEasementsModified" />
          </xsl:call-template>
  </span></div>
</div>

 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:2mm">4</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:1mm">
 Number of states where property subject to conservation easement is located 
  
 <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 

 <span class="styIRS990ScheduleDUnderlineAmount" style="float:none;padding-left:2mm;text-align:center;" >
 
 <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/NmbrStatesInWhichEasementsHeld" />
          </xsl:call-template>
  </span>
  </div>
  </div>

 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">5</div>
 <div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:1mm">
  Does the organization have a written policy regarding the periodic monitoring, inspection, handling of violations, and <br />enforcement of the conservation easements it holds?
<span class="styIRS990ScheduleD_DotSpacing">.............................</span>
 </div>
<span style="padding-top:1mm;padding-top:4mm">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/WrittenPolicyMonitoring" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/WrittenPolicyMonitoring" />
	<xsl:with-param name="BackupName">Form990ScheduleDWrittenPolicyMonitoringYes</xsl:with-param>
      </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/WrittenPolicyMonitoring" />
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:4mm"></span>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/WrittenPolicyMonitoring" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/WrittenPolicyMonitoring" />
        <xsl:with-param name="BackupName">Form990ScheduleDWrittenPolicyMonitoringNo</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/WrittenPolicyMonitoring" />
        </xsl:call-template>            
        No
      </label>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:2mm">6</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:1mm">
 Staff and volunteer hours devoted to monitoring, inspecting and enforcing conservation easements during the year  
<img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 
 <span class="styIRS990ScheduleDUnderlineAmount" style="width:24mm;float:none;padding-left:.5mm;text-align:center;" >
 
 <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/StaffHoursSpentOnEnforcement" />
          </xsl:call-template>
  </span>
  </div>
 </div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:2mm">7</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:1mm">
  Amount of expenses incurred in monitoring, inspecting, and enforcing conservation easements during the year  
  <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> $
<span class="styIRS990ScheduleDUnderlineAmount" style="width:28mm;float:none;padding-left:mm;text-align:center;" >
 
 <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ExpensesIncurredForEnforcement" />
          </xsl:call-template>
  </span>
  </div>

</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">8</div>
 <div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:1mm">
  Does each conservation easement reported on line 2(d) above satisfy the requirements of section<br />170(h)(4)(B)(i) and 170(h)(4)(B)(ii)?
<span class="styIRS990ScheduleD_DotSpacing">....................................</span>
 </div>
<span style="padding-top:1mm;padding-top:4mm">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/Sect170hRequirementsSatisfied" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/Sect170hRequirementsSatisfied" />
        <xsl:with-param name="BackupName">Form990ScheduleDSect170hRequirementsSatisfiedYes</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/Sect170hRequirementsSatisfied" />
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:4mm"></span>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/Sect170hRequirementsSatisfied" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/Sect170hRequirementsSatisfied" />
        <xsl:with-param name="BackupName">Form990ScheduleDSect170hRequirementsSatisfiedNo</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/Sect170hRequirementsSatisfied" />
        </xsl:call-template>            
        No
      </label>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">9</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:1mm">
  In Part XIV, describe how the organization reports conservation easements in its revenue and expense statement, and <br />balance sheet, and include, if applicable, the text of the footnote to the organization’s financial statements that describes<br />the organization’s accounting for conservation easements.
</div>
</div>
   

<!-- End Part II-->
<!-- Part III -->
<div class="styBB" style="width:187mm;float:none;border-top-width:1px">
      <div class="styPartName" style="float:left;width:14mm;">Part III</div>
      <div class="styPartDesc" style="width:172mm;">Organizations Maintaining Collections of Art, Historical Treasures, or Other Similar Assets. <br />
        <span style="font-size: 8pt;font-weight:normal">
          Complete if the organization answered "Yes" to Form 990, Part IV, line 8.
        </span>
      </div>
    </div>
    
  <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">1a</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:.5mm">
 If the organization elected, as permitted under SFAS 116, not to report in its revenue statement and balance sheet works of <br />art, historical treasures, or other similar assets held for public exhibition, education or research in furtherance of public service,<br />provide, in Part XIV, the text of the footnote to its financial statements that describes these items.</div>
</div>
 
 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">b</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:.5mm">
 If the organization elected, as permitted under SFAS 116, to report in its revenue statement and balance sheet works of art,<br />historical treasures, or other similar assets held for public exhibition, education, or research in furtherance of public service,<br />provide the following amounts relating to these items:</div>
</div>
 
 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 8mm;padding-top:1mm">(i)</div>
 <div class="styLNDesc" style="width:175mm;border-right-width:0;padding-top:.5mm;padding-left:1.15mm">
  Revenues included in Form 990, Part VIII, line 1  <span class="styIRS990ScheduleD_DotSpacing">........................</span>
  <span style="padding-left:1.5mm"><img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/></span> 
$

  <span class="styIRS990ScheduleDUnderlineAmount" style="float:none;width:32mm;" >
 
 <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ArtPublicExhibitionAmts/RevenuesIncluded" />
          </xsl:call-template>
  </span>
  </div>
<div class="styLNLeftNumBox" style="padding-left: 8mm;padding-top:1mm">(ii)</div>
 <div class="styLNDesc" style="width:174mm;border-right-width:0;padding-top:.5mm;padding-left:.5mm">
  Assets included in Form 990, Part X
    <span class="styIRS990ScheduleD_DotSpacing">..............................</span>
    <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 
$
  <span class="styIRS990ScheduleDUnderlineAmount" style="float:none;width:32mm;" >
 
 <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ArtPublicExhibitionAmts/AssetsInPartX" />
          </xsl:call-template>
  </span>
  </div>

</div>
   
  <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">2</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:.5mm">
  If the organization received or held works of art, historical treasures, or other similar assets for financial gain, provide the <br />following amounts required to be reported under SFAS 116 relating to these items:</div>
</div>
 
 
 
 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">a</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:.5mm;">
  Revenues included in Form 990, Part VIII, line 1  <span class="styIRS990ScheduleD_DotSpacing">..........................</span>
  <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 
 $

  <span class="styIRS990ScheduleDUnderlineAmount" style="float:none;width:32mm;" >
 
 <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/HeldWorksOfArtAmts/RevenuesIncluded" />
          </xsl:call-template>
  </span>
  </div>
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">b</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:.5mm;">
   Assets included in Form 990, Part X  
   <span class="styIRS990ScheduleD_DotSpacing">...............................</span>
  <span style="padding-left:1.5mm"><img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> </span> 
  $

  <span class="styIRS990ScheduleDUnderlineAmount" style="float:none;width:32mm;" >
 
 <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/HeldWorksOfArtAmts/AssetsInPartX" />
          </xsl:call-template>
  </span>
  </div>
</div>

<!-- End Part III -->

<!-- Footer -->
    <div style="width:187mm;float:none;clear:both;border-top:solid 1px" class="pageend">
      <div class="styGenericDiv" style="width:122mm;font-weight:bold">For Privacy Act and Paperwork Reduction Act Notice, see the Intructions for Form 990 </div>
      <div class="styGenericDiv" style="width:25mm;">Cat. No. 52283D</div>
      <div class="styGenericDiv" style="float:right;"> <span class="styBoldText">Schedule D (Form 990) 2010</span></div>
    </div>
      
   <br />

  
    <!-- header -->
    <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
      <div style="width:90mm;" class="styGenericDiv">Schedule D (Form 990) 2010</div>
      <div style="width:55mm;text-align:center;" class="styGenericDiv"></div>
      <div style = "float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span></div>
    </div>
    
<!-- Part III  Continued-->
<div class="styBB" style="width:187mm;float:none;">
      <div class="styPartName" style="float:left;width:13mm;">Part III</div>
      <div class="styPartDesc" style="width:173mm;float:right">Organizations Maintaining Collections of Art, Historical Treasures, or Other Similar Assets 
        <span style="font-size: 7pt;font-weight:normal;font-style:italic ">
          (continued)
        </span>
      </div>
    </div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">3</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:1mm">
 Using the organization’s accession and other records, check any of the following that are a significant use of its collection <br />items (check all that apply):</div>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:0mm">a</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:0mm">

<span style="width:85mm;">
<span style="padding-top:0mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/CollectUsedForPublicExhibition" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/CollectUsedForPublicExhibition" />
       <xsl:with-param name="BackupName">Form990ScheduleDCollectUsedForPublicExhibition</xsl:with-param> 
       </xsl:call-template>
      </input>
      </span>
      <label style="padding-top:0mm;padding-left:2mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/CollectUsedForPublicExhibition" />
        </xsl:call-template>            
        Public exhibition
      </label>
      </span>
<span style="width:85mm;">
<div class="styLNLeftNumBox" style="padding-left: 2mm;padding-top:0mm">d</div>
<span style="padding-top:0mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/CollectUsedForLoanOrExchPrgrms" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/CollectUsedForLoanOrExchPrgrms" />
        <xsl:with-param name="BackupName">Form990ScheduleDCollectUsedForLoanOrExchPrgrms</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="padding-top:0mm;padding-left:2mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/CollectUsedForLoanOrExchPrgrms" />
        </xsl:call-template>            
        Loan or exchange programs
      </label>
      </span>
</div>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">b</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:0mm">

<span style="width:85mm;vertical-align:top;padding-top:1mm">
<span style="padding-top:1mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/CollectUsedForScholarResearch" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/CollectUsedForScholarResearch" />
       <xsl:with-param name="BackupName">Form990ScheduleDCollectUsedForScholarResearch</xsl:with-param>
      </xsl:call-template>
      </input>
      </span>
      <label style="padding-left:2mm;padding-top:1mm;">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/CollectUsedForScholarResearch" />
        </xsl:call-template>            
       Scholarly research
      </label>
      </span>

<span style="width:85mm;padding-top:1mm">
<div class="styLNLeftNumBox" style="padding-left: 2mm;padding-top:0mm">e</div>
<span style="padding-top:0mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/CollectionUsedForOther/CollectionUsedForOtherPurposes" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/CollectionUsedForOther/CollectionUsedForOtherPurposes" />
       <xsl:with-param name="BackupName">Form990ScheduleDCollectionUsedForOther</xsl:with-param>
       </xsl:call-template>
      </input>
      </span>
      
      <label style="padding-top:1mm;padding-left:2mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/CollectionUsedForOther/CollectionUsedForOtherPurposes" />
        </xsl:call-template>            
        Other
      </label>
      
      
      <span class="styIRS990ScheduleDUnderlineAmount" style="float:none;width:62mm;text-align:left;padding-left:1mm;padding-top:0mm;vertical-align:top;border-style:dotted" >
	<xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/CollectionUsedForOther/DescriptionOfOtherPurposes" />
          </xsl:call-template>
 
	 </span>
     </span>
</div>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">c</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:1mm">

<span style="width:85mm;">
<span style="padding-top:0mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/CollectUsedForPreservation" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/CollectUsedForPreservation" />
        <xsl:with-param name="BackupName">Form990ScheduleDCollectUsedForPreservation</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="padding-left:2mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/CollectUsedForPreservation" />
        </xsl:call-template>            
        Preservation for future generations
        
      </label>
      </span>
</div>
</div>


<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">4</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:1mm">
 Provide a description of the organization’s collections and explain how they further the organization’s exempt purpose in <br />Part XIV.</div>
</div>


<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">5</div>
 <div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:1mm">
During the year, did the organization solicit or receive donations of art, historical treasures or other similar
<br />assets to be sold to raise funds rather than to be maintained as part of the organization’s collection?<span class="styIRS990ScheduleD_DotSpacing">........</span>
 </div>
<span style="padding-top:1mm;padding-top:4mm">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/SolicitedAssetsForSale" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/SolicitedAssetsForSale" />
        <xsl:with-param name="BackupName">Form990ScheduleDSolicitedAssetsForSaleYes</xsl:with-param>
      </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/SolicitedAssetsForSale" />
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:4mm"></span>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/SolicitedAssetsForSale" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/SolicitedAssetsForSale" />
        <xsl:with-param name="BackupName">Form990ScheduleDSolicitedAssetsForSaleNo</xsl:with-param>
       </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/SolicitedAssetsForSale" />
        </xsl:call-template>            
        No
      </label>
</div>

<!-- End Part III Continued-->

<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- ============================================================== -->

<!-- Part IV -->
<div class="styBB" style="width:187mm;float:none;border-top:solid 1px;">
      <div class="styPartName" style="float:left;width:14mm;">Part IV</div>
       <div class="styPartDesc" style="width:172mm;">Escrow and Custodial Arrangements.   
        <span style="font-size: 8pt;font-weight:normal">
          Complete if the organization answered "Yes" to Form 990, <br />Part IV, line 9, or reported an amount on Form 990, Part X, line 21.
        </span>
      </div>
    </div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">1a</div>
 <div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:1mm">
  Is the organization an agent, trustee, custodian or other intermediary for contributions or other assets not
  <br />included on Form 990, Part X?
  <span class="styIRS990ScheduleD_DotSpacing">....................................</span>
 </div>
<span style="padding-top:1mm;padding-top:4mm">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/AgentTrusteeEtc" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/AgentTrusteeEtc" />
        <xsl:with-param name="BackupName">Form990ScheduleDAgentTrusteeEtcYes</xsl:with-param>
      </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/AgentTrusteeEtc" />
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:4mm"></span>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/AgentTrusteeEtc" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/AgentTrusteeEtc" />
      <xsl:with-param name="BackupName">Form990ScheduleDAgentTrusteeEtcNo</xsl:with-param>
    </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/AgentTrusteeEtc" />
        </xsl:call-template>            
        No
      </label>
</div>

 <div style="width:187mm;">
<div class="styLNLeftNumBox" style="padding-left:3mm;padding-top:1mm;">b</div>
 <div class="styLNDesc" style="width:125mm;border-right-width:0;padding-top:1mm;">
 If "Yes," explain the arrangement in Part XIV and complete the following table:
 </div>
 <table class="styTable" style="font-size:7pt;width:187mm;border-bottom-width:1px;" cellspacing="0">
      <thead>
        <tr scope="col">
          <th scope="col" colspan="2" align="center" style="width:140mm;height:4mm;padding-top:0mm; border-bottom:1 solid black;">
         </th>
           <th scope="col" align="center" style="width:8mm;border-left:1 solid black; border-bottom:1 solid black;border-top:1 solid black;border-left:1 solid black"><span class="styNBSP"></span></th>

          <th scope="col" align="center" style="width:45mm;font-size:7pt;border-left:1 solid black; padding-top:0mm; border-bottom:1 solid black;border-top:1 solid black"> Amount
          </th>
       </tr>
      </thead>
      <tfoot></tfoot>
  <tbody valign="top">
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 3mm;height:4.5mm;">c</td>
      <td class="styLNDesc" style="width:140mm;border-right-width:0;padding-top:1mm;padding-left:0mm">
       Beginning balance 
      <span class="styIRS990ScheduleD_DotSpacing">.................................</span>
      </td>
   	   <td class="styLNRightNumBox" >1c</td>
<td class="styLNAmountBox"  style="width:65mm;height:4mm;vertical-align:bottom;padding-			right:0.75mm;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" 			  select="$FormData/BeginningBalance" />
	</xsl:call-template>
   </td> 
   </tr>
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 3mm;height:4.5mm;">d</td>
      <td class="styLNDesc" style="width:140mm;border-right-width:0;padding-top:1mm;padding-left:0mm">
       Additions during the year
       <span class="styIRS990ScheduleD_DotSpacing">..............................</span>
       </td>
   <td class="styLNRightNumBox" >1d</td>
<td class="styLNAmountBox"  style="width:65mm;height:4mm;vertical-align:bottom;padding-right:0.75mm;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/AdditionsDuringYear" />
	</xsl:call-template>
   </td> 
   </tr>
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 3mm;height:4.5mm;">e</td>
      <td class="styLNDesc" style="width:140mm;border-right-width:0;padding-top:1mm;padding-left:0mm">
       Distributions during the year 

       <span class="styIRS990ScheduleD_DotSpacing">.............................</span>
       </td>
   <td class="styLNRightNumBox" >1e</td>
<td class="styLNAmountBox"  style="width:65mm;height:4mm;vertical-align:bottom;padding-right:0.75mm;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/DistributionsDuringYear" />
	</xsl:call-template>
   </td> 
   </tr>
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 3mm;height:4.5mm;">f</td>
      <td class="styLNDesc" style="width:140mm;border-right-width:0;padding-top:1mm;padding-left:0mm">
       Ending balance        
       <span class="styIRS990ScheduleD_DotSpacing">...................................</span>
       </td>
   <td class="styLNRightNumBox" >1f</td>
<td class="styLNAmountBox"  style="width:65mm;height:4mm;vertical-align:bottom;padding-right:0.75mm;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/EndingBalance" />	
</xsl:call-template>
   </td> 
   </tr>
 </tbody>
  </table>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">2a</div>
 <div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:1mm">
 Did the organization include an amount on Form 990, Part X, line 21?  <span class="styIRS990ScheduleD_DotSpacing">.....................</span>
 </div>
<span style="padding-top:1mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/IncludedOnFS" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/IncludedOnFS" />
      <xsl:with-param name="BackupName">Form990ScheduleDIncludedOnFSYes</xsl:with-param>
     </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:1mm">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/IncludedOnFS" />
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:1mm"></span>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/IncludedOnFS" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/IncludedOnFS" />
        <xsl:with-param name="BackupName">Form990ScheduleDIncludedOnFSNo</xsl:with-param>
       </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:1mm">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/IncludedOnFS" />
        </xsl:call-template>            
        No
      </label>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">b</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:1mm">
If “Yes,” explain the arrangement in Part XIV.</div>
</div>
<!-- End Part IV -->
<!-- Part V -->
<div class="styBB" style="width:187mm;float:none;border-top-width:1px;">
      <div class="styPartName" style="float:left;width:14mm;">Part V</div>
     <div class="styPartDesc" style="width:172mm;">Endowment Funds.  
        <span style="font-size: 8pt;font-weight:normal">
          Complete if the organization answered "Yes" to Form 990, Part IV, line 10.
        </span>
      </div>
    </div>
    
     <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
      <thead>
        <tr scope="col">
          <th scope="col" colspan="2" align="center" style="width:47mm;padding-top:0mm; border-bottom:1 solid black;">
            <span class="styItalicText" style="font-weight:normal;">
             
            </span>
          </th>
       <th scope="col" align="center" style="width:30mm;font-size:6pt;border-left:1 solid black; border-bottom:1 solid black;">
            (a)<span class="styNormalText">Current Year</span>
          </th>
          <th scope="col" align="center" style="width:30mm;font-size:6pt;border-left:1 solid black; border-bottom:1 solid black;">
            (b)<span class="styNormalText">Prior Year</span>
          </th>
          <th scope="col" align="center" style="width:30mm;font-size:6pt;border-left:1 solid black; border-bottom:1 solid black">
            (c)<span class="styNormalText">Two Years Back</span>
          </th>
          <th scope="col" align="center" style="width:30mm;font-size:6pt;border-left:1 solid black; border-bottom:1 solid black">
            (d)<span class="styNormalText">Three Years Back</span>
          </th>
          <th scope="col" align="center" style="width:30mm;font-size:6pt;border-left:1 solid black; border-bottom:1 solid black">
            (e)<span class="styNormalText">Four Years Back</span>
          </th>
        </tr>
      </thead>
      <tfoot></tfoot>
  <tbody valign="top">
<tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;">1a</td>
      <td class="styLNDesc" style="width:59mm;height:4.5mm;">
        Beginning of year balance
        
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">....</span>
      </td>

<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYear/BeginningOfYearBalance" />
</xsl:call-template>
</td>
 <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinus1Year/BeginningOfYearBalance" />
</xsl:call-template>
</td>
<!--
      <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
-->
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinus2Years/BeginningOfYearBalance" />
</xsl:call-template>
</td>
   <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
  <td class="styTableCell" style="width:25mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
    </tr>
    <tr>
    
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;">b</td>
      <td class="styLNDesc" style="width:59mm;height:4.5mm;">
     Contributions
        
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">........</span>
      </td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYear/Contributions" />
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinus1Year/Contributions" />
</xsl:call-template>
</td>
<!--
      <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
-->
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinus2Years/Contributions" />
</xsl:call-template>
</td>
   <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
  <td class="styTableCell" style="width:25mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
    </tr>
    
  <tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;">c</td>
      <td class="styLNDesc" style="width:59mm;height:4.5mm;">
     Investment earnings or losses
       
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...</span>
      </td>
      <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYear/InvestmentEarningsOrLosses" />
</xsl:call-template>
</td>
  <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinus1Year/InvestmentEarningsOrLosses" />
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinus2Years/InvestmentEarningsOrLosses" />
</xsl:call-template>
</td>
<!--
      <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
-->
   <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
  <td class="styTableCell" style="width:25mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
    </tr>
     <tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;">d</td>
      <td class="styLNDesc" style="width:59mm;height:4.5mm;">
    Grants or scholarships
       
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.....</span>
      </td>
      <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYear/GrantsOrScholarships" />
</xsl:call-template>
</td>
 <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinus1Year/GrantsOrScholarships" />
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinus2Years/GrantsOrScholarships" />
</xsl:call-template>
</td>
<!--
      <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
-->
   <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
  <td class="styTableCell" style="width:25mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
    </tr>
 <tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;">e</td>
      <td class="styLNDesc" style="width:59mm;height:4.5mm;">
    Other expenditures for facilities<br />and programs
       
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">........</span>
      </td>
      <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYear/OtherExpenditures" />
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinus1Year/OtherExpenditures" />
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinus2Years/OtherExpenditures" />
</xsl:call-template>
</td>
<!--
      <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
-->
   <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
  <td class="styTableCell" style="width:25mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
    </tr>
 <tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;">f</td>
      <td class="styLNDesc" style="width:59mm;height:4.5mm;">
    Administrative expenses
       
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">....</span>
      </td>
      <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYear/AdministrativeExpenses" />
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinus1Year/AdministrativeExpenses" />
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinus2Years/AdministrativeExpenses" />
</xsl:call-template>
</td>
<!--
      <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
-->
   <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
  <td class="styTableCell" style="width:25mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
    </tr>
 <tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;">g</td>
      <td class="styLNDesc" style="width:59mm;height:4.5mm;">
     End of year balance
       
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">......</span>
      </td>
      <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYear/EndOfYearBalance" />
</xsl:call-template>
</td>
 <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinus1Year/EndOfYearBalance" />
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinus2Years/EndOfYearBalance" />
</xsl:call-template>
</td>
<!--
      <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
-->
   <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
  <td class="styTableCell" style="width:25mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
    </tr>
 </tbody>
    </table>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">2</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:1mm">
Provide the estimated percentage of the year end balance held as:
 </div>
  </div>
 
 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">a</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:0mm">
 Board designated or quasi-endowment:
 <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/>
<span class="styIRS990ScheduleDUnderlineAmount" style="float:none;padding-left:2mm;text-align:center;border-style:dotted" >
 <xsl:call-template name="PopulatePercent">
            <xsl:with-param name="TargetNode" select="$FormData/BoardDesignatedEOYBalance" />
          </xsl:call-template>
  </span> 
  </div>
  </div>
  <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">b</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:0mm">
Permanent endowment:
 <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/>
<span class="styIRS990ScheduleDUnderlineAmount" style="float:none;padding-left:2mm;text-align:center;border-style:dotted" >
 
 <xsl:call-template name="PopulatePercent">
            <xsl:with-param name="TargetNode" 			select="$FormData/PermanentEndowmentEOYBalance" />
          </xsl:call-template>
  </span> 
  </div>
  </div>
 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">c</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:0mm">
Term endowment:
 <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/>
<span class="styIRS990ScheduleDUnderlineAmount" style="float:none;padding-left:2mm;text-align:center;border-style:dotted" >
 
 <xsl:call-template name="PopulatePercent">
            <xsl:with-param name="TargetNode" select="$FormData/TermEndowmentEOYBalance" />
          </xsl:call-template>
  </span> 
  </div>
  </div>


<div style=" width: 187mm; ">
 <div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:0mm">3a</div>
  <div class="styLNDesc" style="border-right-width:0px; width: 150mm;padding-top:0mm">
    Are there endowment funds not in the possession of the organization that are held and administered for the 
  <br />organization by:
  </div><br />

<div class="styIRS990ScheduleDLineIndexMid" style="width: 10mm;border-left:1px"></div>
  <div class="styIRS990ScheduleDLineIndexMid" style="border-top-width:1px;">Yes</div>
  <div class="styIRS990ScheduleDLineIndexMid" style="border-right-width:0px;border-top-width:1px;">No</div>
</div>
<!-- line 3a i -->
<div style=" width: 187mm; ">
 <div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:0mm"></div>
  <div class="styLNDesc" style="border-right-width:0px; width: 150mm;padding-top:0mm">
    <span style="font-weight:bold;text-align:center;">(i)</span>
    unrelated organizations
    <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">........................</span>

  </div>
  <div class="styIRS990ScheduleDLineIndexMid" style="width:10mm;border-left-width:1px">3a(i)</div>
  <div class="styIRS990ScheduleDLineIndexMid">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/EndowmentsHeldByUnrelatedOrgs"/>
      </xsl:call-template>
    </span>  
  </div>
  <div class="styIRS990ScheduleDLineIndexMid" style="border-right-width:0px;">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/EndowmentsHeldByUnrelatedOrgs"/>
      </xsl:call-template>
    </span>  
  </div>
</div>
<!-- line 3a ii -->
<div style=" width: 187mm; ">
 <div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:0mm"></div>
  <div class="styLNDesc" style="border-right-width:0px; width: 150mm">
    <span style="font-weight:bold;text-align:center;">(ii)</span>
     related organizations
    <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">........................</span>

  </div>
  <div class="styIRS990ScheduleDLineIndexMid" style="width: 10mm;border-left-width:1px">3a(ii)</div>
  <div class="styIRS990ScheduleDLineIndexMid">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/EndowmentsHeldByRelatedOrgs"/>
      </xsl:call-template>
    </span>  
  </div>
  <div class="styIRS990ScheduleDLineIndexMid" style="border-right-width:0px;">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/EndowmentsHeldByRelatedOrgs"/>
      </xsl:call-template>
    </span>  
  </div>
</div>
<div style=" width: 187mm; ">
 <div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:0mm">b</div>
  <div class="styLNDesc" style="border-right-width:0px; width:150mm;padding-top:0mm">
 If "Yes" to 3a(ii), are the related organizations listed as required on Schedule R?
   
    <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.........</span>

  </div>
  <div class="styIRS990ScheduleDLineIndexMid" style="width: 10mm;border-left-width:1px">3b</div>
  <div class="styIRS990ScheduleDLineIndexMid">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/AreRelatedOrgsListedScheduleR"/>
      </xsl:call-template>
    </span>  
  </div>
  <div class="styIRS990ScheduleDLineIndexMid" style="border-right-width:0px;">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/AreRelatedOrgsListedScheduleR"/>
      </xsl:call-template>
    </span>  
  </div>
</div>
 <div style=" width: 187mm; ">
 <div class="styLNLeftNumBox" style="padding-left:1mm;padding-top:0mm">4</div>
  <div class="styLNDesc" style="border-right-width:0px; width:150mm;padding-top:0mm">
Describe in Part XIV the intended uses of the organization's endowment funds.
</div>
</div>

<!-- End Part V -->

<!-- BEGIN Part VI Title -->
    <div class="styBB" style="width:187mm;float:none;border-top:solid 1px;">
      <div class="styPartName" style="float:left;width:14mm;">Part VI</div>
      <div class="styPartDesc" style="width:172mm;">Investments&#151;Land, Buildings, and Equipment.  
        <span style="font-size: 8pt;font-weight:normal">
          See Form 990, Part X, line 10.
        </span>
      </div>
    </div>
    <!-- END Part VI Title -->
    
    <!-- Begin Part VI Table-->
    <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
      <thead>
        <tr scope="col">
          <th scope="col" colspan="2" align="center" style="width:77mm;height:9mm;padding-top:0mm; border-bottom:1 solid black">
            <span style="font-weight:normal;">
            Description of investment
            </span> 
          </th>
          <th scope="col" align="center" style="width:46mm;font-size:6pt;border-left:1 solid black; border-bottom:1 solid black">
            (a)<span style="font-weight:normal;">
 Cost or other basis (investment) </span> 

          </th>
          <th scope="col" align="center" style="width:46mm;font-size:6pt;border-left:1 solid black; border-bottom:1 solid black">
            (b)<span class="styNormalText">Cost or other basis (other)</span>
          </th>
          <th scope="col" align="center" style="width:46mm;font-size:6pt;border-left:1 solid black; border-bottom:1 solid black">
            (c)<span class="styNormalText"> Accumulated depreciation</span>
          </th>
          <th scope="col" align="center" style="width:46mm;font-size:6pt;border-left:1 solid black; border-bottom:1 solid black">
            (d)<span class="styNormalText"> Book value</span>
          </th>
        </tr>
      </thead>
      <tfoot></tfoot>
  <tbody valign="top">

<tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;">1a</td>
      <td class="styLNDesc" style="width:109mm;height:4.5mm;">
      Land
    <!--Dotted Line-->
     <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.................</span>
      </td>

      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/Land/InvestmentCostOrOtherBasis" /></xsl:call-template>
</td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/Land/OtherCostOrOtherBasis" />
</xsl:call-template>
</td>
     
 <td class="styTableCell" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;background-color:lightgrey;border-left-width:1px;border-bottom-width:1px;border-style:solid;border-color:black;border-right:0px">
  <span class="styTableCellPad" /> 
  </td>
 <!--<td class="styIRS990ScheduleDShadingCellRB " style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
</td>-->
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/Land/BookValue" /></xsl:call-template>
</td>
    </tr>
    <tr>
   
   
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;">b</td>
      <td class="styLNDesc" style="width:109mm;height:4.5mm;">
                                   Buildings
        <span style="width:1px"></span>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$FormData/Buildings"/>
        </xsl:call-template>
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">................</span>
      </td>
      
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/Buildings/InvestmentCostOrOtherBasis" />
</xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/Buildings/OtherCostOrOtherBasis" />
</xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/Buildings/Depreciation" />
</xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/Buildings/BookValue" />
</xsl:call-template></td>
    </tr>
    
  <tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;">c</td>
      <td class="styLNDesc" style="width:109mm;height:4.5mm;">
      Leasehold improvements
       
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">............</span>
      </td>
      
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LeaseholdImprovements/InvestmentCostOrOtherBasis" /></xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LeaseholdImprovements/OtherCostOrOtherBasis" /></xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LeaseholdImprovements/Depreciation" /></xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LeaseholdImprovements/BookValue" /></xsl:call-template></td>
    </tr>
    
    <tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;">d</td>
      <td class="styLNDesc" style="width:109mm;height:4.5mm;">
     Equipment
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">................</span>
      </td>
      
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/Equipment/InvestmentCostOrOtherBasis" /></xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/Equipment/OtherCostOrOtherBasis" /></xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/Equipment/Depreciation" /></xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/Equipment/BookValue" /></xsl:call-template></td>
    </tr>
<tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;border-bottom:1 solid black">e</td>
 <td class="styLNDesc" style="width:109mm;height:4.5mm;border-bottom:1 solid black">
      Other
       
        <!--Dotted Line-->
   <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.................</span>
      </td>
      
 <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-		right:0.75mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/OtherLandBuildings/InvestmentCostOrOtherBasis" />
</xsl:call-template></td>
     
 <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/OtherLandBuildings/OtherCostOrOtherBasis" />
</xsl:call-template></td>
      
 <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/OtherLandBuildings/Depreciation" />
</xsl:call-template></td>
      
 <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/OtherLandBuildings/BookValue" />
</xsl:call-template></td>
    </tr>

<tr>
 
  <td class="styLNDesc" colspan="5" style="border-right-width:0px; width:160mm;padding-top:0mm;border-bottom:1 solid black">
<span style="font-weight:bold">Total.</span> Add lines 1a-1e.<span class="styItalicText"> (Column (d) should equal Form 990, Part X, column (B), line 10(c).)</span>
<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">........</span>
  <span style="padding-left:2mm">
  <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMdBullet"/></span></td>
<td class="styLNAmountBoxSmall" style="width:46mm;padding-right:0.75mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/TotalOfBookValueLandBuildings" /></xsl:call-template></td> 
</tr> 
</tbody>
</table>

<!-- Footer -->
    <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
     
      <div class="styGenericDiv" style="float:right;"> <span class="styBoldText">Schedule D (Form 990) 2010</span></div>
    </div>
      
   <br />

  
    <!-- header -->
    <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
      <div style="width:90mm;" class="styGenericDiv">Schedule D (Form 990) 2010</div>
      <div style="width:55mm;text-align:center;" class="styGenericDiv"></div>
      <div style = "float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">3</span></div>
    </div>
    

<!-- Begin  Part VII -->
<div class="styBB" style="width:187mm;float:none;border-top-width:0px;">
      <div class="styPartName" style="float:left;width:14mm;">Part VII</div>
      <div class="styPartDesc" style="width:172mm;">Investments&#151;Other Securities. 
        <span style="font-size: 8pt;font-weight:normal">
           See Form 990, Part X, line 12.
        </span>
      </div>
  
<div class="styGenericDiv" style="float:right">
      
     <xsl:call-template name="SetDynamicTableToggleButton">
            <xsl:with-param name="TargetNode" select="$FormData/OtherSecurities"/>
            <xsl:with-param name="containerHeight" select="11"/>
            <xsl:with-param name="containerID" select=" 'IOSctn' "/>
          </xsl:call-template>
         <!-- end button display logic -->
      </div>
      </div>
   

    <!-- BEGIN Part VIITable -->
    <div class="styTableContainer" id="IOSctn" style="height:25mm;">
      <!-- print logic -->
        <xsl:call-template name="SetInitialState"/>
      <!-- end -->
      <table class="styTable" style="font-size:7pt;float:none;clear:both;" cellspacing="0">
       
          <tr>
            <th class="styTableCellHeader" scope="col" colspan="2" style="width:82mm;font-weight:normal;border-color:black"><span style="font-weight:bold">(a)</span> Description of security or category<br />(including name of security)</th>
            <th class="styTableCellHeader" scope="col" style="font-weight:normal; text-align:center;border-right-width:1px;border-color:black"><span style="font-weight:bold">(b)</span>Book value</th>
          <th class="styTableCellHeader" scope="col" colspan="2" style="width:70mm;font-weight:normal;border-right-width:0px;border-color:black"><span style="font-weight:bold">(c)</span> Method of valuation:<br />Cost or end-of-year market value</th>
         </tr>
       
         <tr>
         <td class="styTableCell" colspan="2" style="width:82mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
		
	<span class="styGenericDiv" style="float:left" colspan="2">(1)Financial derivatives</span></td>
      <td class="styTableCell" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/FinancialDerivatives/BookValue" />
		</xsl:call-template></td>
         <td class="styTableCell" colspan="2" style="width:70mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;border-color:black">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" 			select="$FormData/FinancialDerivatives/MethodOfValuation" />
	</xsl:call-template></td>
		 </tr>
  <tr>
	 <td class="styTableCell" colspan="2" style="width:82mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
	
	<span class="styGenericDiv" style="float:left" colspan="2">(2)Closely-held equity interests</span></td>
      <td class="styTableCell" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" 
select="$FormData/CloselyHeldEquityInterests/BookValue" />
		</xsl:call-template></td>
        <td class="styTableCell" colspan="2" style="width:70mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;border-color:black">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" 			select="$FormData/CloselyHeldEquityInterests/MethodOfValuation" />
	</xsl:call-template></td>
 </tr>
 
 
  <xsl:if test="($Print != $Separated) or count($FormData/OtherSecurities) &lt;= 9">
          <xsl:for-each select="$FormData/OtherSecurities">
	
	
	<tr>
	 <td class="styTableCell" colspan="2" style="width:82mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black">
<span class="styGenericDiv" style="float:left;padding-right:1mm" colspan="2">
<xsl:if test="position()=1">
              (3)Other </xsl:if></span><br />(<xsl:number value="position()" format="A"/>)
<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" 	select="Description" />
	</xsl:call-template>
	</td>
      
<td class="styTableCell" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="BookValue" />
		</xsl:call-template></td>
         
         <td class="styTableCell" colspan="2" style="width:70mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;border-color:black">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" 	select="MethodOfValuation" />
	</xsl:call-template></td>
 </tr>
</xsl:for-each>
    </xsl:if>
 <xsl:if test="count($FormData/OtherSecurities) &lt; 1 or
            (($Print = $Separated) and (count($FormData/OtherSecurities) &gt; 9)) ">
          <tr>
            <td class="styTableCell" colspan="2" style="width:82mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black">
             <xsl:if test="position()=1">
              Other </xsl:if><br /><xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" 			 select="$FormData/OtherSecurities" />
              </xsl:call-template>
 		<span style="width:3px" />
           </td>
            <td class="styTableCell" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
              <span style="width:3px" />
           </td>
		 <td class="styTableCell" colspan="2" style="width:70mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;border-color:black">
              <span style="width:3px" />
           </td>
		
		</tr>
        </xsl:if>
        <xsl:if test="count($FormData/OtherSecurities) &lt; 2 or ((count($FormData/OtherSecurities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherSecurities) &lt; 3 or ((count($FormData/OtherSecurities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherSecurities) &lt; 4 or ((count($FormData/OtherSecurities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherSecurities) &lt; 5 or ((count($FormData/OtherSecurities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherSecurities) &lt; 6 or ((count($FormData/OtherSecurities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherSecurities) &lt; 7 or ((count($FormData/OtherSecurities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherSecurities) &lt; 8 or ((count($FormData/OtherSecurities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherSecurities) &lt; 9 or ((count($FormData/OtherSecurities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
 <tr>
     <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:82mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;float:left;border-color:black">
<span class="styItalicText" style="float:left;font-size:6pt"><span style="font-weight:bold;font-style:normal;">Total.</span>
 (Column (b) should equal Form 990, Part X, col.(B) line 12.)</span>
  
  <span style="padding-left:0mm">
  <img src="{$ImagePath}/990SchD_Bullet_Sm.gif" alt="Small Bullet"/></span></td> 
<td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/TotalOfBookValueSecurities" />
		</xsl:call-template></td> 
  
	
		<td class="styIRS990ScheduleDShadingCell" style="width:70;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;"></td></tr>

    
 
        
      </table>
    </div>
    <!-- Set Initial Height of Above Table -->
    <xsl:call-template name="SetInitialDynamicTableHeight">
      <xsl:with-param name="TargetNode" select="$FormData/OtherSecurities"/>
      <xsl:with-param name="containerHeight" select="11"/>
      <xsl:with-param name="containerID" select=" 'IOSctn' "/>
    </xsl:call-template>
    <!-- End Set Initial Height of Above Table -->
    <!-- END Part VII Table -->    
 
<!-- End Part VII -->

<!-- Part VIII -->
<div class="styBB" style="width:187mm;float:none;border-top-width:1px;">
      <div class="styPartName" style="float:left;width:15mm;">Part VIII</div>
       <div class="styPartDesc" style="width:172mm;">Investments&#151;Program Related.  
        <span style="font-size: 8pt;font-weight:normal">
          See Form 990, Part X, line 13.
        </span>
      </div>
     <div class="styGenericDiv" style="float:right">
         <!-- button display logic -->
          <xsl:call-template name="SetDynamicTableToggleButton">
            <xsl:with-param name="TargetNode" select="$FormData/InvestmentsProgramRelated"/>
            <xsl:with-param name="containerHeight" select="9"/>
            <xsl:with-param name="containerID" select=" 'IPRctn' "/>
          </xsl:call-template>
         <!-- end button display logic -->
      </div>
    </div>
    <!-- END Part VIII Title -->


    <!-- BEGIN Part VIIITable -->
    <div class="styTableContainerNBB" id="IPRctn" style="height:25mm;">
      <!-- print logic -->
        <xsl:call-template name="SetInitialState"/>
      <!-- end -->
      <table class="styTable" style="font-size:7pt;float:none;clear:both;" cellspacing="0">
        <thead class="styTableThead">
          <tr>
            <th class="styTableCellHeader" scope="col" colspan="2" style="width:82mm;font-weight:normal;border-color:black"><span style="font-weight:bold">(a)</span> Description of investment type</th>
            <th class="styTableCellHeader" scope="col" style="font-weight:normal; text-    				align:center;border-right-width:1px;border-color:black"><span style="font-weight:bold">(b)</span> Book value</th>
          <th class="styTableCellHeader" scope="col" colspan="2" style="width:70mm;font-weight:normal;border-right-width:0px;border-color:black"><span style="font-weight:bold">(c)</span> Method of valuation:<br />Cost or end-of-year market value</th>
         </tr>
 </thead>
        <tfoot></tfoot>
        <tbody>
  
   <xsl:if test="($Print != $Separated) or count($FormData/InvestmentsProgramRelated) &lt;= 9">
          <xsl:for-each select="$FormData/InvestmentsProgramRelated">
     
        <tr>
         <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:82mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black">(<xsl:number value="position()" format="1"/>)
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" 			select="Description" />
	</xsl:call-template></td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="BookValue" />
		</xsl:call-template></td>
         <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:70mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;border-color:black">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" 			select="MethodOfValuation" />
	</xsl:call-template></td>
		 </tr>
  </xsl:for-each>
    </xsl:if>
    
 <xsl:if test="count($FormData/InvestmentsProgramRelated) &lt; 1 or
            (($Print = $Separated) and (count($FormData/InvestmentsProgramRelated) &gt;9)) ">
          <tr>
            <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:82mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black">
             <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" 			 select="$FormData/InvestmentsProgramRelated" />
              </xsl:call-template>
 		<span style="width:3px" />
           </td>
   <td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
              <span style="width:3px" />
           </td>
		 <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:70mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;border-color:black">
              <span style="width:3px" />
           </td>
		
		</tr>
        </xsl:if>
 <xsl:if test="count($FormData/InvestmentsProgramRelated) &lt; 2 or ((count($FormData/InvestmentsProgramRelated) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/InvestmentsProgramRelated) &lt; 3 or ((count($FormData/InvestmentsProgramRelated) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/InvestmentsProgramRelated) &lt; 4 or ((count($FormData/InvestmentsProgramRelated) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/InvestmentsProgramRelated) &lt; 5 or ((count($FormData/InvestmentsProgramRelated) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/InvestmentsProgramRelated) &lt; 6 or ((count($FormData/InvestmentsProgramRelated) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/InvestmentsProgramRelated) &lt; 7 or ((count($FormData/InvestmentsProgramRelated) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/InvestmentsProgramRelated) &lt; 8 or ((count($FormData/InvestmentsProgramRelated) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>  
								<xsl:if test="count($FormData/InvestmentsProgramRelated) &lt; 9 or ((count($FormData/InvestmentsProgramRelated) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>              
        <tr>
		
 <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:82mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;float:left;border-color:black">

<span class="styItalicText" style="float:left;font-size:6pt"><span style="font-weight:bold;font-style:normal">Total.</span>
 (Column (b) should equal Form 990, Part X, col.(B) line 13.)</span>
  
  <span style="padding-left:mm">
  <img src="{$ImagePath}/990SchD_Bullet_Sm.gif" alt="Small Bullet"/></span></td> 
<td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/TotalOfBookValueProgramRelated" />
		</xsl:call-template></td> 
  
	
		<td class="styIRS990ScheduleDShadingCell" style="width:70;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-color:black"></td></tr>

   
        </tbody>
      </table>
    </div>
    <!-- Set Initial Height of Above Table -->
    <xsl:call-template name="SetInitialDynamicTableHeight">
      <xsl:with-param name="TargetNode" select="$FormData/InvestmentsProgramRelated"/>
      <xsl:with-param name="containerHeight" select="9"/>
      <xsl:with-param name="containerID" select=" 'IPRctn' "/>
    </xsl:call-template>
    <!-- End Set Initial Height of Above Table -->
    <!-- END Part VIII Table -->    
  

<!-- End Part VIII -->

<!-- Part IX -->
<div class="styBB" style="width:187mm;float:none;border-top:solid 1px;">
      <div class="styPartName" style="float:left;width:14mm;">Part IX</div>
       <div class="styPartDesc" style="width:172mm;">Other Assets.  
        <span style="font-size: 8pt;font-weight:normal">
          See Form 990, Part X, line 15.
        </span>
      </div>
     <div class="styGenericDiv" style="float:right">
         <!-- button display logic -->
          <xsl:call-template name="SetDynamicTableToggleButton">
            <xsl:with-param name="TargetNode" select="$FormData/OtherAssets"/>
            <xsl:with-param name="containerHeight" select="9"/>
            <xsl:with-param name="containerID" select=" 'OActn' "/>
          </xsl:call-template>
         <!-- end button display logic -->
      </div>
<div class="styTableContainerNBB" id="OActn" style="height:25mm;">
      <!-- print logic -->
        <xsl:call-template name="SetInitialState"/>
      <!-- end -->
      <table class="styTable" style="font-size:7pt;float:none;clear:both;" cellspacing="0">
        <thead class="styTableThead">
          <tr>
            <th class="styTableCellHeader" scope="col" colspan="4" style="width:149mm;font-weight:normal;border-top-width:1px;border-color:black"><span style="font-weight:bold">(a)</span> Description</th>
            <th class="styTableCellHeader" scope="col" style="font-weight:normal; text-    				align:center;border-top-width:1px;border-right-width:0px;border-color:black"><span style="font-weight:bold">(b)</span> Book value</th>
        </tr>
 </thead>
        <tfoot></tfoot>
     <tbody>
  <xsl:if test="($Print != $Separated) or count($FormData/OtherAssets) &lt;= 9">
          <xsl:for-each select="$FormData/OtherAssets">
        <tr>
         <td class="styIRS990ScheduleDTableCellLB" colspan="4" style="width:149mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black">(<xsl:number value="position()" format="1"/>)
		<xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode"  select="Description" />
              </xsl:call-template></td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:38mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right:0px;border-color:black">
		<xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode"	 select="BookValue" />
              </xsl:call-template></td>
    </tr>
  </xsl:for-each>
 </xsl:if>


  <xsl:if test="count($FormData/OtherAssets) &lt; 1 or
            (($Print = $Separated) and (count($FormData/OtherAssets) &gt;9)) ">
<tr>
         <td class="styIRS990ScheduleDTableCellLB" colspan="4" style="width:149mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black">
		<xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode"	 select="$FormData/OtherAssets" />
              </xsl:call-template>
 		<span style="width:3px" />
</td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:38mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right:0px;border-color:black">
		<span style="width:3px" />
	</td>
   </tr>
</xsl:if>
<xsl:if test="count($FormData/OtherAssets) &lt; 2 or ((count($FormData/OtherAssets) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherAssets) &lt; 3 or ((count($FormData/OtherAssets) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherAssets) &lt; 4 or ((count($FormData/OtherAssets) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherAssets) &lt; 5 or ((count($FormData/OtherAssets) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherAssets) &lt; 6 or ((count($FormData/OtherAssets) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherAssets) &lt; 7 or ((count($FormData/OtherAssets) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherAssets) &lt; 8 or ((count($FormData/OtherAssets) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if> 
								<xsl:if test="count($FormData/OtherAssets) &lt; 9 or ((count($FormData/OtherAssets) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if>               
  <tr>
  <td class="styIRS990ScheduleDTableCellLB" colspan="4" style="width:149mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
<span class="styItalicText" style="float:left;"><span style="font-weight:bold;font-style:normal">Total.</span> (Column (b) should equal Form 990, Part X, col.(B)  line 15.)</span>
    <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>

  <span style="padding-left:2mm">
  <img src="{$ImagePath}/990SchD_Bullet_Sm.gif" alt="Small Bullet"/></span></td> 
<td class="styIRS990ScheduleDTableCellLB" style="width:38mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right:0px;border-color:black">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/TotalBookValueOtherAssets" />
		</xsl:call-template></td> 
	</tr>


  </tbody>
 </table>
    </div>
    <!-- Set Initial Height of Above Table -->
    <xsl:call-template name="SetInitialDynamicTableHeight">
      <xsl:with-param name="TargetNode" select="$FormData/OtherAssets"/>
      <xsl:with-param name="containerHeight" select="9"/>
      <xsl:with-param name="containerID" select=" 'OActn' "/>
    </xsl:call-template>
    <!-- End Set Initial Height of Above Table -->
    <!-- END Part ??X Table -->    
</div>
<!-- End Part IX -->
  
    <!-- BEGIN Part X Title   -->
    <div class="styBB" style="width:187mm;clear:both;border-top-width:1px">
      <div class="styPartName" style="float:left;width:14mm;padding-left:1mm">Part X</div>
      <div class="styPartDesc" style="float:left;width:164mm">
        Other Liabilities.  
         <span style="font-size: 8pt;font-weight:normal">
          See Form 990, Part X, line 25.
        </span>
     </div>
      <div class="styGenericDiv" style="float:right">
         <!-- button display logic -->
          <xsl:call-template name="SetDynamicTableToggleButton">
            <xsl:with-param name="TargetNode" select="$FormData/OtherLiabilities"/>
            <xsl:with-param name="containerHeight" select="10"/>
            <xsl:with-param name="containerID" select=" 'ROActn' "/>
          </xsl:call-template>
         <!-- end button display logic -->
      </div>
    </div>
    <!-- END Part X Title -->


    <!-- BEGIN Part X Table -->
    <div class="styTableContainerNBB" id="ROActn" style="height:25mm;">
      <!-- print logic -->
        <xsl:call-template name="SetInitialState"/>
      <!-- end -->
      <table class="styTable" style="font-size:7pt;float:none;clear:both;" cellspacing="0">
        <thead class="styTableThead">
          <tr>
            <th class="styTableCellHeader" scope="col" colspan="2" style="width:80mm;font-weight:normal;border-color:black"><span class="styLNLeftNumBoxSD" style="text-align:left;padding-left:0mm;font-weight:normal">1.</span><span style="font-weight:bold">(a)</span> Description of Liability</th>
            <th class="styTableCellHeader" scope="col" style="font-weight:normal; text-align:center;border-right-width:1px;border-color:black"><span style="font-weight:bold">(b)</span> Amount</th>
            <th class="styIRS990ScheduleDShadingCell" scope="col" colspan="2" style="border-left:1px;border-color:black"></th>
         </tr>
</thead>
        <tfoot></tfoot>
        <tbody>
      
        <tr>
         <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:80mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
		
	<span class="styGenericDiv" style="float:left" colspan="2">Federal Income Taxes</span></td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxLiability" />
		</xsl:call-template></td>
      <td class="styIRS990ScheduleDShadingCell" style="width:72;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-color:black"></td>
		 </tr>
  
  <xsl:if test="($Print != $Separated) or count($FormData/OtherLiabilities) &lt;= 9">
     <xsl:for-each select="$FormData/OtherLiabilities">
	  <tr>
	 <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:80mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black"><!--(<xsl:number value="position()" format="1"/>)TEGE wants Federal Income Taxes hardcoded with a (1) in front and then increment the remaining liabilities starting with (2). IBM nor I could make it work. TEGE changed it to be a (1) in front of the Federal Income Taxes and no number in front of the other liabilities - RLJ 2010-->
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" 	select="Description" />
	</xsl:call-template></td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="Amount" />
		</xsl:call-template></td>
      <td class="styIRS990ScheduleDShadingCell" style="width:72;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-color:black">
</td>
 </tr>
 </xsl:for-each>
    </xsl:if> 


 <xsl:if test="count($FormData/OtherLiabilities) &lt; 1 or
            (($Print = $Separated) and (count($FormData/OtherLiabilities) &gt;9)) ">
 <tr>
     	 <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:80mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black">
		<xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode"	 select="$FormData/OtherAssets" />
              </xsl:call-template>
 		<span style="width:3px" />
</td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
		<span style="width:3px" />
</td>
      <td class="styIRS990ScheduleDShadingCell" style="width:72;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-color:black"><span style="width:3px" />
</td>
 </tr>
     </xsl:if> 
      <xsl:if test="count($FormData/OtherLiabilities) &lt; 2 or ((count($FormData/OtherLiabilities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherLiabilities) &lt; 3 or ((count($FormData/OtherLiabilities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherLiabilities) &lt; 4 or ((count($FormData/OtherLiabilities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherLiabilities) &lt; 5 or ((count($FormData/OtherLiabilities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherLiabilities) &lt; 6 or ((count($FormData/OtherLiabilities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherLiabilities) &lt; 7 or ((count($FormData/OtherLiabilities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherLiabilities) &lt; 8 or ((count($FormData/OtherLiabilities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherLiabilities) &lt; 9 or ((count($FormData/OtherLiabilities) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
 <tr>		
 <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:80mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;float:left;border-color:black">

<span class="styItalicText" style="float:left;font-size:6pt"><span style="font-weight:bold;font-style:normal">Total.</span>
 (Column (b) should equal Form 990, Part X, col.(B) line 25.)</span>
  
  <span style="padding-left:1mm">
  <img src="{$ImagePath}/990SchD_Bullet_Sm.gif" alt="Small Bullet"/></span></td> 
<td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/TotalOfAmounts" />
		</xsl:call-template></td> 
  
	
		<td class="styIRS990ScheduleDShadingCell" style="width:72;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-color:black"></td></tr>

  <td class="styIRS990ScheduleDTableCellLB" colspan="6" style="width:180mm;height:4.5mm;vertical-align:bottom;border-left:0px;text-align:left;border-right:0px;border-top-width:1px;border-style:solid;border-color:black" >
<b>2.</b> Fin 48 (ASC 740) Footnote. In Part XIV, provide the text of the footnote to the organization's financial statements that reports the organization's liability for uncertain tax positions under FIN 48 (ASC740).
</td>
    
        </tbody>
      </table>
    </div>
    <!-- Set Initial Height of Above Table -->
    <xsl:call-template name="SetInitialDynamicTableHeight">
      <xsl:with-param name="TargetNode" select="$FormData/OtherLiabilities"/>
      <xsl:with-param name="containerHeight" select="10"/>
      <xsl:with-param name="containerID" select=" 'ROActn' "/>
    </xsl:call-template>
    <!-- End Set Initial Height of Above Table -->
    <!-- END Part ??X Table -->    
 

    <!-- Footer -->
    <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
     
      <div class="styGenericDiv" style="float:right;"> <span class="styBoldText">Schedule D (Form 990) 2010</span></div>
    </div>
      
   <br />

  
    <!-- header -->
    <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
      <div style="width:90mm;" class="styGenericDiv">Schedule D (Form 990) 2010</div>
      <div style="width:55mm;text-align:center;" class="styGenericDiv"></div>
      <div style = "float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">4</span></div>
    </div>
    
    <!-- Begin Parts XI -->
      <table class="styTable" style="font-size:7pt;width:187mm;border-bottom-width:1px" cellspacing="0">
     <thead>
        <tr scope="col">
           <th class="styBB" colspan="6" scope="col" style="padding-bottom:0;padding-top:0;border-top-width:1px">
               <span class="styPartName" style="width:15mm;">Part XI</span>
              <span class="styPartDesc" style="width:171mm;">
                Reconciliation of Change in Net Assets from Form 990 to Financial Statements 
              </span>             
            </th>
     
        </tr>
      </thead>
      <tfoot></tfoot>
  <tbody valign="top">
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 2mm;height:4.5mm;">1</td>
      <td class="styLNDesc" style="width:145mm;border-right-width:0;padding-top:1mm;padding-left:0mm">
       Total revenue (Form 990, Part VIII, column (A), line 12)
      <span class="styIRS990ScheduleD_DotSpacing">....................</span></td>
	  <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">1</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/TotalRevenue" />
            </xsl:call-template></td>
 
 
   </tr>
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 2mm;height:4.5mm;">2</td>
      <td class="styLNDesc" style="width:145mm;border-right-width:0;padding-top:1mm;padding-left:0mm">
       Total expenses (Form 990, Part IX, column (A), line 25)

       <span class="styIRS990ScheduleD_DotSpacing">.....................</span></td>
   <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">2</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/TotalExpenses" />
            </xsl:call-template></td>
   </tr>
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 2mm;height:4.5mm;">3</td>
      <td class="styLNDesc" style="width:145mm;border-right-width:0;padding-top:1mm;padding-left:0mm">
      Excess or (deficit) for the year. Subtract line 2 from line 1

       <span class="styIRS990ScheduleD_DotSpacing">.............</span></td>
   <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">3</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ExcessOrDeficitForYear" />
            </xsl:call-template></td>
   </tr>
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 2mm;height:4.5mm;">4</td>
      <td class="styLNDesc" style="width:145mm;border-right-width:0;padding-top:1mm;padding-left:0mm">
       Net unrealized gains (losses) on investments
        <span class="styIRS990ScheduleD_DotSpacing">..........................</span></td>
  <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">4</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/NetUnrealizedGLOnInvestments" />
            </xsl:call-template></td>
   </tr>
 <tr>
      <td class="styLNLeftNumBox" style="padding-left: 2mm;height:4.5mm;">5</td>
      <td class="styLNDesc" style="width:145mm;border-right-width:0;padding-top:1mm;padding-left:0mm">
       Donated services and use of facilities
        <span class="styIRS990ScheduleD_DotSpacing">.............................</span></td>
 <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">5</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/DonatedServicesAndFacilities" />
            </xsl:call-template></td>
   </tr>
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 2mm;height:4.5mm;">6</td>
      <td class="styLNDesc" style="width:145mm;border-right-width:0;padding-top:1mm;padding-left:0mm">
       Investment expenses 
        <span class="styIRS990ScheduleD_DotSpacing">...................................</span></td>
   <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">6</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/InvestmentExpenses" />
            </xsl:call-template></td>
   </tr>
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 2mm;height:4.5mm;">7</td>
      <td class="styLNDesc" style="width:145mm;border-right-width:0;padding-top:1mm;padding-left:0mm">
      Prior period adjustments
        <span class="styIRS990ScheduleD_DotSpacing">..................................</span></td>
 <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">7</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/PriorPeriodAdjustments" />
            </xsl:call-template></td>
   </tr>
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 2mm;height:4.5mm;">8</td>
      <td class="styLNDesc" style="width:145mm;border-right-width:0;padding-top:1mm;padding-left:0mm">
       Other (Describe in Part XIV)
        <span class="styIRS990ScheduleD_DotSpacing">.................................</span></td>
   <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">8</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherAmount" />
            </xsl:call-template></td>
   </tr>
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 2mm;height:4.5mm;">9</td>
      <td class="styLNDesc" style="width:145mm;border-right-width:0;padding-top:1mm;padding-left:0mm">
       Total adjustments (net). Add lines 4 - 8
        <span class="styIRS990ScheduleD_DotSpacing">.............................</span></td>
  <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">9</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/TotalAdjustments" />
            </xsl:call-template></td>
   </tr>
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 1mm;height:4.5mm;">10</td>
      <td class="styLNDesc" style="width:145mm;border-right-width:0;padding-top:1mm;padding-left:0mm">
      Excess or (deficit) for the year per financial statements. Combine lines 3 and 9
        <span class="styIRS990ScheduleD_DotSpacing">.........</span></td>
  <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">10</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ExcessOrDeficitPerFS" />
            </xsl:call-template></td>
   </tr>
</tbody>
  </table>
    
    <!-- Begin Parts XII -->
      <table class="styTable" style="font-size:7pt;width:187mm;border-top-width:1px" cellspacing="0">
        <thead>
          <tr scope="col">
            <th class="styBB" colspan="6" scope="col" style="padding-bottom:0;padding-top:0;border-top-width:1px">
               <span class="styPartName" style="width:15mm;">Part XII</span>
              <span class="styPartDesc" style="width:171mm;">
                Reconciliation of Revenue per Audited Financial Statements With Revenue per Return 
              </span>             
            </th>
          </tr>
        </thead>
        <tfoot></tfoot>
        <tbody valign="top">
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;">1</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;" colspan="3">Total revenue, gains, and other support per audited financial statements
              <!--Dotted Line-->
             <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.......</span>
            </td>
            
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">1</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotRevenueEtcAuditedFinclStmt" /></xsl:call-template></td>
          </tr>    
         
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;">2</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;" colspan="3">Amounts included on line 1 but not on Form 990, Part VIII, line 12:</td>
            <td class="styShadingCell" style="width:8mm;height:4.5mm;border-left-width:1px;"><span class="styTableCellPad"></span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;"><span class="styTableCellPad"></span></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">a</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;">Net unrealized gains on investments
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..........</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:8mm">2a</td>
            <td class="styLNAmountBox" style="height:4.5mm;">
            <xsl:call-template name="PopulateAmount">
            	<xsl:with-param name="TargetNode" select="$FormData/NetUnrealizedGainsInvestments" />
		</xsl:call-template>
		<span style="width:1px;"></span></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0">
            <span style="width:1px;"></span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;">
            <span class="styTableCellPad"></span></td>
          </tr>    
         
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">b</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;">Donated services and use of facilities
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.........</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:8mm">2b</td>
            <td class="styLNAmountBox" style="height:4.5mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" 		select="$FormData/DonatedSrvcAndUseOfFacilities" />
		</xsl:call-template>
		<span style="width:1px;"></span></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0">
            <span style="width:1px;"></span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;">
            <span class="styTableCellPad"></span></td>
          </tr>    
          
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">c</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;">Recoveries of prior year grants
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:8mm">2c</td>
            <td class="styLNAmountBox" style="height:4.5mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/RecoveriesOfPriorYearGrants" />
            </xsl:call-template>
            <span style="width:1px;">
			</span></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0">
            <span style="width:1px;">
            </span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;">
            <span class="styTableCellPad"></span></td>
          </tr>    
        
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">d</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;">Other (Describe in Part XIV): 
             <!--<span class="styBB" style="width:62mm;float:none;">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData/TotOthRevenueOnLnaButNotOnLn12"/>
              </xsl:call-template>
              </span> <br />-->
             <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">............</span>
		<!-- <span class="styBB" style="width:85mm;float:none;"></span>-->
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:8mm">2d</td>
            <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;">
            <xsl:call-template name="PopulateAmount">
           	 <xsl:with-param name="TargetNode" select="$FormData/OtherRevenues" />	
	</xsl:call-template><span style="width:1px;"></span></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0">
            <span style="width:1px;"></span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;">
            <span class="styTableCellPad"></span></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">e</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;" colspan="3">Add lines <span class="styBoldText">2a</span> through <span class="styBoldText">2d</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">
              .....................</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">2e</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/RevenueNotRptdF990" /></xsl:call-template></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;">3</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;" colspan="3">Subtract line <span class="styBoldText">2e</span> from line <span class="styBoldText">1</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.....................</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">3</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/RevenueSubtotal" /></xsl:call-template></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;">4</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;" colspan="3">Amounts included on Form 990, Part VIII, line 12, but not on line <span class="styBoldText">1</span>:</td>
            <td class="styShadingCell" style="width:8mm;height:4.5mm;border-left-width:1px;"><span class="styTableCellPad"></span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;"><span class="styTableCellPad"></span></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">a</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;">Investment expenses not included on  Form 990, Part  VIII, line 7b
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:8mm">4a</td>
            <td class="styLNAmountBox" style="height:4.5mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/InvestmentExpensesNotIncluded" />
		</xsl:call-template><span style="width:1px;">
		</span></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0"><span style="width:1px;"></span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;"><span class="styTableCellPad"></span></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">b</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;">Other (Describe in Part XIV):  
            <!--<span class="styBB" style="width:62mm;float:none;">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData/OtherRevenues"/>
              </xsl:call-template>
              </span> <br />
              <span class="styBB" style="width:85mm;float:none;"></span>-->
            <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
		</td>
            
            <td class="styLNRightNumBox" style="height:4.5mm;width:8mm">4b</td>
            <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherRevenuesNotIncluded" />
		</xsl:call-template><span style="width:1px;"></span></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0">
            <span style="width:1px;"></span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;m">
            <span class="styTableCellPad"></span></td>
          </tr>    
          
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">c</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;" colspan="3">Add lines <span class="styBoldText">4a</span> and <span class="styBoldText">4b</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.......................</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">4c</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/RevenueNotRptdOnFinStmt" />
</xsl:call-template></td>
          </tr>    
          
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;border: solid black 1px; border-top-width:0; border-left-width:0;border-right-width:0px;">5</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;border: solid black 1px; border-top-width:0; border-left-width:0;border-right-width:0px;" colspan="3">
Total Revenue. Add lines <span class="styBoldText">3</span> and <span class="styBoldText">4c. </span> (This should equal Form 990, Part I, line 12.)
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">......</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0;border-bottom-width:1px;">5</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/TotalRevenuePerForm990" />
</xsl:call-template></td>
          </tr>    
        </tbody>
      </table>
      
<!-- =======================End Part XII =============================================-->
 <!-- =============================================================================-->   
 
 <!-- Begin Parts XIII -->
      <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
        <thead>
          <tr scope="col">
            <th class="styBB" colspan="6" scope="col" style="padding-bottom:0;padding-top:0;">
               <span class="styPartName" style="width:15mm;">Part XIII</span>
              <span class="styPartDesc" style="width:171mm;">
                Reconciliation of Expenses per Audited Financial Statements With Expenses per Return              
              </span>             
            </th>
          </tr>
        </thead>
        <tfoot></tfoot>
        <tbody valign="top">
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;">1</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;" colspan="3">Total expenses and losses per audited financial statements
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.............</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">1</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotExpensesEtcAuditedFinclStmt" /></xsl:call-template></td>
          </tr>    
          
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;">2</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;" colspan="3">Amounts included on line 1 but not on Form 990, Part IX, line 25:</td>
            <td class="styShadingCell" style="width:8mm;height:4.5mm;border-left-width:1px;"><span class="styTableCellPad"></span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;"><span class="styTableCellPad"></span></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">a</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;" >Donated services and use of facilities
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..........</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;">2a</td>
            <td class="styLNAmountBox" style="height:4.5mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/DonatedServicesUseOfFacilities" />
</xsl:call-template><span style="width:1px;"></span></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0"><span style="width:1px;"></span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;"><span class="styTableCellPad"></span></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">b</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;">Prior year adjustments
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..............</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;">2b</td>
            <td class="styLNAmountBox" style="height:4.5mm;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/PriorYearAdjustments" /></xsl:call-template><span style="width:1px;"></span></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0"><span style="width:1px;"></span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;"><span class="styTableCellPad"></span></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">c</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;">Other losses
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">................</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;">2c</td>
            <td class="styLNAmountBox" style="height:4.5mm;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LossesReported" /></xsl:call-template><span style="width:1px;"></span></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0"><span style="width:1px;"></span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;"><span class="styTableCellPad"></span></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">d</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;">Other (Describe in Part XIV):  
             <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">............</span>
	</td>
            <td class="styLNRightNumBox" style="height:4.5mm;">2d</td>
            <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherExpensesIncluded" />
</xsl:call-template><span style="width:1px;"></span></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0"><span style="width:1px;"></span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;"><span class="styTableCellPad"></span></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">e</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;" colspan="3">Add lines <span class="styBoldText">2a</span> through <span class="styBoldText">2d</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">......................</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">2e</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/ExpensesNotRptdF990" /></xsl:call-template></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;">3</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;" colspan="3">Subtract line <span class="styBoldText">2e</span> from line <span class="styBoldText">1</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.....................</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">3</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ExpensesSubtotal" />
	</xsl:call-template></td>
          </tr>    
         
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;">4</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;" colspan="3">Amounts included on Form 990, Part IX, line 25, but not on line <span class="styBoldText">1:</span></td>
            <td class="styShadingCell" style="width:8mm;height:4.5mm;border-left-width:1px;"><span class="styTableCellPad"></span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;"><span class="styTableCellPad"></span></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">a</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;">Investment expenses not included on Form 990, Part VIII, line 7b
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;">4a</td>
            <td class="styLNAmountBox" style="height:4.5mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/InvestmentExpensesNotIncluded2" />
	</xsl:call-template><span style="width:1px;"></span></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0"><span style="width:1px;"></span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;"><span class="styTableCellPad"></span></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">b</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;">Other (Describe in Part XIV): 
            <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">............</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;">4b</td>
            <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherExpensesNotIncluded" />
	</xsl:call-template>
	<span style="width:1px;"></span></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0"><span style="width:1px;"></span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;"><span class="styTableCellPad"></span></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">c</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;" colspan="3">Add lines <span class="styBoldText">4a</span> and <span class="styBoldText">4b</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.......................</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">4c</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ExpensesNotRptdOnFinStmt" />
		</xsl:call-template></td>
          </tr>    
          
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;border: solid black 1px; border-top-width:0; border-left-width:0;border-right-width:0px;">5</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;border: solid black 1px; border-top-width:0; border-left-width:0;border-right-width:0px;" colspan="3">Total expenses. Add lines <span class="styBoldText">3</span> and <span class="styBoldText">4c.</span>
         (This should equal Form 990, Part I, line 18.)     <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">......</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">5</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/TotalExpensesPerForm990" />
		</xsl:call-template></td>
          </tr>    
        </tbody>
      </table>
<!-- =========================================================================-->
 <!-- Part XIV  Supplemental Information -->
 
  <div class="styGenericDiv" style="width: 187mm;">
  <div class="styPartName" style="width:18mm;">Part XIV</div>
  <div class="styPartDesc" style="width:169mm;font-weight:bold; ">
Supplemental Information
</div>

<div class="styIRS990ScheduleDLNDescBB" style="width:187mm;height:4mm; border-top-width:1px;padding-top:1mm;border-bottom-width:1px;border-right-width:0px;padding-left:2mm">
Complete this part to provide the descriptions required for Part II, lines 3, 5, and 9; Part III, lines 1a and 4; Part lV, lines 1b and 2b;<br /> Part V, line 4; Part X; Part XI, line 8; Part XII, lines 2d and 4b; and Part XIII, lines 2d and 4b. Also complete this part to provide any additional information.<br />
</div>
<span style="float:right"> 
  
 
          <xsl:call-template name="SetDynamicTableToggleButton" >
              <xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleDPartXIV" />              
              <xsl:with-param name="containerHeight" select="5" />
              <xsl:with-param name="containerID" select="'SUPctn'" />
          </xsl:call-template>  </span>   
        </div>
 

<div class="styTableContainer" style="width: 187mm; border-bottom-width: 2px" id="SUPctn">
<xsl:call-template name="SetInitialState"/>
<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
  <thead class="styTableThead">
    
    <tr class="styDepTblHdr">
          
          <th class="styDepTblCell" scope="col">Identifier</th>
          <th class="styDepTblCell" scope="col">Return Reference</th>  
          <th class="styDepTblCell" scope="col">Explanation</th>                
             

    </tr>
  </thead>
  <tfoot></tfoot>
  <tbody valign="top">
   <xsl:if test="($Print!=$Separated) or (($Print=$Separated) and (count($FormData/Form990ScheduleDPartXIV) &lt;20))">
      <xsl:for-each select="$FormData/Form990ScheduleDPartXIV">
          <tr>
      <td class="styTableCell" style="text-align:left;border-right-width: 1px; width:50mm; ">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Identifier" />
            </xsl:call-template>
      </td>
      <td class="styTableCell" style="text-align:left; border-right-width: 1px; width: 50mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ReturnReference" />
              </xsl:call-template>
           </td>      
      <td class="styTableCell" style="text-align:left; border-right-width: 0px; width: 86mm">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Explanation" />
              </xsl:call-template>
           </td>      

    </tr>     
     </xsl:for-each>
<!--     <xsl:call-template name="PopulateAdditionalRows">
      <xsl:with-param name="RowCounter" select="count($FormData/Form990ScheduleMPartII) + 1" ></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
    <xsl:if test="($Print=$Separated) and (count($FormData/Form990ScheduleMPartII) &gt;5)">
    <xsl:call-template name="PopulateAdditionalRows">
      <xsl:with-param name="RowCounter" select="1" ></xsl:with-param>
    </xsl:call-template> -->
    </xsl:if>
  </tbody>
</table>
</div>

<xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleDPartXIV"/>
            <xsl:with-param name="containerHeight" select="5"/>
            <xsl:with-param name="containerID" select=" 'SUPctn' "/>
 </xsl:call-template>

 
   <!-- Footer -->
    <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
   
      <div class="styGenericDiv" style="float:right;"> <span class="styBoldText">Schedule D (Form 990) 2010</span></div>
    </div>
      
   <br />
 
 
 <div class="styLeftOverTitleLine" id="LeftoverData">
        <div class="styLeftOverTitle">
          Additional Data        
        </div>
        <div class="styLeftOverButtonContainer">
          <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
        </div>      
      </div>
      
     <table class="styLeftOverTbl">
        <xsl:call-template name="PopulateCommonLeftover">
          <xsl:with-param name="TargetNode" select="$FormData" />
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
  </table> 

<br/>
<!-- SRD For Part VII -->
 <xsl:if test="($Print = $Separated) and count($FormData/OtherSecurities) &gt;= 8">
          
 <span class="styRepeatingDataTitle">Form 990, Schedule D, Part VII - Investments&#151; Other Securities</span>
 <table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;">
    <thead class="styTableThead">
    <tr class="styDepTblHdr">
            <th class="styTableCellHeader" scope="col" colspan="2" style="width:76mm;font-weight:normal;"><span style="font-weight:bold">(a)</span> Description of security or cateory<br />(including name of security)</th>
            <th class="styTableCellHeader" scope="col" style="font-weight:normal; text-    				align:center;border-right-width:1px;"><span style="font-weight:bold">(b)</span>Book value</th>
          <th class="styTableCellHeader" scope="col" colspan="2" style="width:76mm;font-weight:normal;border-right-width:0px;"><span style="font-weight:bold">(c)</span> Method of valuation<br />Cost or end-of-year market value</th>
 </tr>
 </thead>
    <tfoot/>
        
<xsl:for-each select="$FormData/OtherSecurities">
<tr>
		        <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
               <xsl:otherwise>styDepTblRow2Cell </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>   
          <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:72mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left">
	
	<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" 	select="Description" />
	</xsl:call-template>
	</td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:38mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="BookValue" />
		</xsl:call-template></td>
         
         <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:72mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" 	select="MethodOfValuation" />
	</xsl:call-template></td>
 </tr> 
</xsl:for-each>
</table>   </xsl:if>
<br />

 <!-- SRD For Part VIII -->
   <xsl:if test="($Print = $Separated) and count($FormData/InvestmentsProgramRelated) &gt;= 8">
      <span class="styRepeatingDataTitle">Form 990, Schedule D, Part VIII - Investments&#151; Program Related</span>
 <table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;">
    <thead class="styTableThead">
    <tr class="styDepTblHdr">

<th class="styTableCellHeader" scope="col" colspan="2" style="width:76mm;font-weight:normal;">
<span style="font-weight:bold">(a)</span> Description of investment type</th>
 
  <th class="styTableCellHeader" scope="col" style="font-weight:normal; text-    				align:center;border-right-width:1px;">
	<span style="font-weight:bold">(b)</span> Book value</th>
   
   <th class="styTableCellHeader" scope="col" colspan="2" style="width:76mm;font-weight:normal;border-right-width:0px;">
<span style="font-weight:bold">(c)</span> Method of valuation<br />Cost or end-of-year market value</th>
   </tr>
 </thead>
<tfoot></tfoot>
 
  <xsl:for-each select="$FormData/InvestmentsProgramRelated">
      <tr>
              <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
               <xsl:otherwise>styDepTblRow2Cell </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>   
 <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:72mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" 			select="Description" />
	</xsl:call-template></td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:38mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="BookValue" />
		</xsl:call-template></td>
         <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:72mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" 			select="MethodOfValuation" />
	</xsl:call-template></td>
		 </tr>
  </xsl:for-each>
    </table></xsl:if>
 
 <br />

 <!-- SRD for Part IX -->
     <xsl:if test="($Print = $Separated) and count($FormData/OtherAssets) &gt;= 8">
      <span class="styRepeatingDataTitle">Form 990, Schedule D, Part IX, - Other Assets</span>
 <table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;">
    <thead class="styTableThead">
   
    <tr class="styDepTblHdr">
    <th class="styTableCellHeader" scope="col" colspan="4" style="width:149mm;font-weight:normal;border-top-width:1px"><span style="font-weight:bold">(a)</span> Description</th>
            <th class="styTableCellHeader" scope="col" style="font-weight:normal; text-    				align:center;border-top-width:1px;border-right-width:0px"><span style="font-weight:bold">(b)</span> Book value</th>
        </tr>
 </thead>
        <tfoot></tfoot>
    <xsl:for-each select="$FormData/OtherAssets">
        <tr>
               <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
               <xsl:otherwise>styDepTblRow2Cell </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>   
<td class="styIRS990ScheduleDTableCellLB" colspan="4" style="width:149mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left">
		<xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode"  select="Description" />
              </xsl:call-template></td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:38mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right:0px">
		<xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode"	 select="BookValue" />
              </xsl:call-template></td>
    </tr>
  </xsl:for-each>
  </table></xsl:if>
<br />
<!-- SRD for Part X -->
 <xsl:if test="($Print = $Separated) and count($FormData/OtherLiabilities) &gt;= 8">
 <span class="styRepeatingDataTitle">Form 990, Schedule D, Part X, - Other Liabilities</span>
 <table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;">
    <thead class="styTableThead">
     <tr class="styDepTblHdr">
				
<th class="styTableCellHeader" scope="col" colspan="2" style="width:76mm;font-weight:normal;"><span class="styLNLeftNumBoxSD" style="text-align:left;padding-left:0mm;font-weight:normal">1.</span><span style="font-weight:bold">(a)</span> Description of Liability</th>
            <th class="styTableCellHeader" scope="col" style="font-weight:normal; text-    				align:center;border-right-width:1px;"><span style="font-weight:bold">(b)</span> Amount</th>
            <th class="styIRS990ScheduleDShadingCell" scope="col" colspan="2" style="border-left:1px;"></th>
      </tr> 
      </thead>
        <tfoot></tfoot>
   <xsl:for-each select="$FormData/OtherLiabilities">

  <tr>
	       <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
               <xsl:otherwise>styDepTblRow2Cell </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>   
<td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:72mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" 	select="Description" />
	</xsl:call-template></td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:38mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="Amount" />
		</xsl:call-template></td>
      <td class="styIRS990ScheduleDShadingCell" style="width:72;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
</td>
 </tr>
 </xsl:for-each>
    </table></xsl:if> 

    
    
 
     </form>
  </body>
</html>

</xsl:template>
<!-- Below are a few templates designed to be filler rows for the tables in this form -->
<xsl:template name="IRS990SchDPartVIITableFillerRow">
  <tr>
    <td class="styTableCellText" colspan="2" style="width:82mm;border-color:black">
				<br/>
				
				<span style="width:4px;"/>
			</td>
    <td class="styTableCell" style="width:27mm;text-align:left;border-color:black">
    <span style="width:4px"></span></td>
   
    <td class="styTableCell" colspan="2" style="width:70mm;border-right-width:0px;border-color:black">
    <span style="width:4px;"></span>
    </td>
  </tr>
</xsl:template>

<xsl:template name="IRS990SchDPartVIIITableFillerRow">
  <tr>
   <td class="styTableCellText" colspan="2" style="width:82mm;border-color:black">
				<br/>
				
				<span style="width:4px;"/>
			</td>
    <td class="styTableCell" style="width:27mm;text-align:left;border-color:black">
    <span style="width:4px"></span></td>
   
    <td class="styTableCell" colspan="2" style="width:70mm;border-right-width:0px;border-color:black">
    <span style="width:4px;"></span>
    </td>
  </tr>
</xsl:template>
<xsl:template name="IRS990SchDPartIXTableFillerRow">
  <tr>
   <td class="styTableCellText" colspan="4" style="border-color:black">
				<br/>
				
				<span style="width:4px;"/>
			</td>
  
   
    <td class="styTableCell" colspan="2" style="border-right-width:0px;border-color:black">
    <span style="width:4px;"></span>
    </td>
  </tr>
</xsl:template>

<xsl:template name="IRS990SchDPartXTableFillerRow">
 <tr>
   <td class="styTableCellText" colspan="2" style="border-color:black">
				<br/>
				<span style="width:4px;"/>
	</td>
	
    <td class="styTableCell" style=";border-color:black">
    <span style="width:4px"></span>
    </td>
   
    <td class="styIRS990ScheduleDShadingCell" colspan="2" style="border-right-width:0px;border-color:black">
    <span style="width:4px;"></span>
    </td>
  </tr>
</xsl:template>

</xsl:stylesheet>
