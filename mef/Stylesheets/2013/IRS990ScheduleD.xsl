<?xml version="1.0" encoding="UTF-8"?>
<!-- This stylesheet was created by Sandy Cram and last modified on 11/25/2008 -->
<!-- This stylesheet was last modified by Sandy Cram on 1/8/2009  added shading for SRD -->
<!-- This stylesheet was modified on 7/08/2009 for TY2009/PY2010 changes by Sandy Cram-->
<!-- This stylesheet was modified on 8/26/2009 for TY2009/PY2010 BSP-091865OTH changes by Sandy Cram-->
<!-- Last modified on 10/28/2009 by Sandy Cram  Updates made per BSP-092774OTH -->
<!-- Modified by Sandy Cram on 12/17/2009 -->
<!-- Modified by Robert Jones on 08/10/2010 BSP-101319OTH -->
<!-- Updated 7/21/2011 per UWR 40502 by Robert L Jones -->
<!-- Updated 01/21/2012 per UWR 52085 by Robert L Jones -->
<!-- Last modified on 06/28/2012 by Robert Jones for UWR 58215 -->
<!-- Last modified on 09/06/2012 by Robert Jones for UWR 58215 after getting the 2012 PDF's-->
<!-- Last modified on 10/04/2012 by Robert Jones for UWR 58215 after getting the 2.0 Schema and Kelly email which provided the new element for Part X line 2 -->
<!-- Last modified on 10/26/2012 by Robert Jones for Defect 33279 AcVerify -->
<!-- Last modified on 11/18/2012 by Robert Jones for Defect 33431  -->
<!-- Last modified on 11/19/2012 by Robert Jones for Defect 33279 AccVerify for 508  -->
<!-- Last modified on 01/11/2012 by Robert Jones for Defect 33388 AccVerify for 508  -->
<!-- Last modified on 01/11/2012 by Robert Jones for Defect 55783 Part VII, VIII Col C, Part IV line 2b  -->
<!-- Last modified on 10/23/2013 by Robert Jones for Defect 38546 "?" in Separated print in Parts VII and VIII  -->
<!-- Last modified on 11/14/2013 by Robert Jones Removed identifier column  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS990ScheduleDStyle.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>
<xsl:param name="FormData" select="$RtnDoc/IRS990ScheduleD"/>
<xsl:template match="/">

<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
  <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"/></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
  <meta name="Desc" content="IRS Form 990 Schedule D"/>
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  <xsl:call-template name="InitJS"/>
    <style type="text/css">
<xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS990ScheduleDStyle"/>
        <xsl:call-template name="AddOnStyle"/>
</xsl:if>
    </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
    <form name="Form990ScheduleD">
      <xsl:call-template name="DocumentHeader"/>
      <div class="styTBB" style="width:187mm;">
        <div class="styFNBox" style="width:28mm;height:auto;">
          <div style="padding-top:1mm;font-weight:bold;font:8pt">
       <span style="font-size:10pt;font-weight:bold;font-familiy:'Arial Narrow';">SCHEDULE D</span>
     <br/>
     <span style="font-size:8pt;font-weight:bold;font-family:'Arial ';">(Form 990)</span>
     <br/>
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
          <div class="styMainTitle" style="padding-top:2mm">Supplemental Financial Statements</div>
          <div class="styFBT" style="height:5mm;padding-top:0mm">
           <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 
           Complete if the organization answered "Yes," to
		Form 990, <br />Part IV, line 6, 7, 8, 9, 10, 11a, 11b, 11c, 11d, 11e, 11f, 12a, or 12b<br />
          <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 
           Attach to Form 990. 
           <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 
          See separate instructions. 
           <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 
          Information about Schedule D (Form 990) and its instructions is at <!--www.irs.gov/form990.-->
          <a href="http://www.irs.gov/form990" title="Link to IRS.gov">
                <i>www.irs.gov/form990</i>
            </a>. 
           </div>
        
        </div>
        <div class="styTYBox" style="width:30mm;">
          <div class="styOMB" style="height:auto;">OMB No. 1545-0047</div>
          <div class="styTY">20<span class="styTYColor">13</span></div>
          <div class="styPartName" style="height:8mm; width:30.5mm;padding-top:0.3mm">Open to Public Inspection</div>
        </div>
      </div>

<!-- Begin Name and Identifying Number Section-->      
<div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
  <div class="styFNBox" style="width:134mm;height:auto;padding-left:2mm">
     <span class="styBoldText">Name of the organization</span>
<br/>
    <div style="font-family:verdana;font-size:6pt;height:6.25mm">
     <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
    </xsl:call-template>
    <br/>
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
      <div class="styPartDesc" style="width:172mm; height:auto;">Organizations Maintaining Donor Advised Funds or Other Similar Funds or Accounts. 
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
          <th scope="col" colspan="2" align="center" style="width:66mm;height:4mm;padding-top:0mm; border-bottom:1px solid black">
            
          </th>
          
          <th scope="col" align="center" style="width:120mm;font-size:7pt;border-left:1px solid black;padding-top:0mm;  border-bottom:1px solid black">(a)
            <span class="styNormalText"> Donor advised funds</span>

          </th>
          <th scope="col" align="center" style="width:120mm;font-size:7pt;border-left:1px solid black; padding-top:0mm; border-bottom:1px solid black">
            (b)<span class="styNormalText"> Funds and other accounts</span>
          </th>
         
        </tr>
      </thead>
      <tfoot/>
  <tbody valign="top">
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 1mm;height:4.5mm;float:none;">1</td>
      <td class="styLNDesc" style="height:4.5mm;padding-left:2mm;float:none;">
        Total number at end of year
       <span class="styIRS990ScheduleD_DotSpacing">.........</span>

     
        
      </td>

      <td class="styLNAmountBox" style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
	<xsl:call-template name="PopulateText">
		<xsl:with-param name="TargetNode" select="$FormData//DonorAdvisedFundsHeldCnt"/>	</xsl:call-template>
   </td>
      <td class="styLNAmountBox" style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
	<xsl:call-template name="PopulateText">
		<xsl:with-param name="TargetNode" select="$FormData/FundsAndOtherAccountsHeldCnt"/>
	</xsl:call-template>
   </td>
    
    </tr>
    <tr>
      <td class="styLNLeftNumBox" style="padding-left: 1mm;height:4.5mm;float:none;">2</td>
      <td class="styLNDesc" style="height:4.5mm;padding-left:2mm;float:none;">
        Aggregate contributions to (during year)
        <span class="styIRS990ScheduleD_DotSpacing">...</span>
     
      </td>

      <td class="styLNAmountBox" style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/DonorAdvisedFundsContriAmt"/>
	</xsl:call-template>
   </td>
      <td class="styLNAmountBox" style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/FundsAndOtherAccountsContriAmt"/>
	</xsl:call-template>
   </td>
     </tr>
    
  <tr>
      <td class="styLNLeftNumBox" style="padding-left: 1mm;height:4.5mm;float:none;">3</td>
      <td class="styLNDesc" style="height:4.5mm;padding-left:2mm;float:none;">
       Aggregate grants from (during year)
       <span class="styIRS990ScheduleD_DotSpacing">.....</span>
        
      </td>

<!--<td class="styLNRightNumBox" style="width:6mm;height:4.5mm;">25a</td>-->
      <td class="styLNAmountBox" style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/DonorAdvisedFundsGrantsAmt"/>	
	</xsl:call-template>
   </td>
      <td class="styLNAmountBox" style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/FundsAndOtherAccountsGrantsAmt"/>
	</xsl:call-template>
   </td>
    
    </tr>
<tr>
      <td class="styLNLeftNumBox" style="height:4.5mm;float:none;">4</td>
      <td class="styLNDesc" style="height:4.5mm;padding-left:2mm;float:none;">
       Aggregate value at end of year
       <span class="styIRS990ScheduleD_DotSpacing"> ........</span>
        
      </td>

<!--<td class="styLNRightNumBox" style="width:6mm;height:4.5mm;">25a</td>-->
      <td class="styLNAmountBox" style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/DonorAdvisedFundsVlEOYAmt"/>	
	</xsl:call-template>
   </td>
      <td class="styLNAmountBox" style="width:62mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/FundsAndOtherAccountsVlEOYAmt"/>
	</xsl:call-template>
   </td>
  
    </tr>

     </tbody>
    </table>
<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-top:1mm">5</div>
 <div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:1mm">
  Did the organization inform all donors and donor advisors in writing that the assets held in donor advised<br/>funds are the organization's property, subject to the organization's exclusive legal control?
<span class="styIRS990ScheduleD_DotSpacing">............</span>
 </div>
<span style="padding-top:1mm;padding-top:4mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/DisclosedOrgLegCtrlInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedOrgLegCtrlInd"/>
        <xsl:with-param name="BackupName">IRS990ScheduleDDisclosedOrgsLegalControl</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedOrgLegCtrlInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDDisclosedOrgsLegalControl</xsl:with-param>
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:4mm;display:inline;"/>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/DisclosedOrgLegCtrlInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedOrgLegCtrlInd"/>
         <xsl:with-param name="BackupName">IRS990ScheduleDDisclosedOrgsLegalControl</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedOrgLegCtrlInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDDisclosedOrgsLegalControl</xsl:with-param>
        </xsl:call-template>            
        No
      </label>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">6</div>
 <div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:1mm">
  Did the organization inform all grantees, donors, and donor advisors in writing that grant funds can be <br/>used only for charitable purposes and not for the benefit of the donor or donor advisor, or for any other purpose conferring impermissible private benefit?
<span class="styIRS990ScheduleD_DotSpacing">...................................</span>
 </div>
<span style="padding-top:1mm;padding-top:7mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/DisclosedForCharitablePrpsInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedForCharitablePrpsInd"/>
      <xsl:with-param name="BackupName">IRS990ScheduleDDisclosedForCharitablePurposes</xsl:with-param>
      </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:7mm">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedForCharitablePrpsInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDDisclosedForCharitablePurposes</xsl:with-param>
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:7mm;display:inline;"/>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/DisclosedForCharitablePrpsInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedForCharitablePrpsInd"/>
        <xsl:with-param name="BackupName">IRS990ScheduleDDisclosedForCharitablePurposes</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:7mm">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/DisclosedForCharitablePrpsInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDDisclosedForCharitablePurposes</xsl:with-param>
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
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:0mm;"/>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:0mm">

<span style="width:90mm;">
<span style="padding-top:0mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/PreservationPublicUseInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/PreservationPublicUseInd"/>
       <xsl:with-param name="BackupName">IRS990ScheduleDPreservationForPublicUse</xsl:with-param>
       </xsl:call-template>
      </input>
      </span>
      <label style="padding-top:0mm;padding-left:1mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/PreservationPublicUseInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDPreservationForPublicUse</xsl:with-param>
        </xsl:call-template>            
       Preservation of land for public use (e.g., recreation or education)</label>
      </span>

<span style="width:80mm;padding-left:4mm">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/HistoricLandAreaInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/HistoricLandAreaInd"/>
        <xsl:with-param name="BackupName">IRS990ScheduleDHistoricLandArea</xsl:with-param>
        </xsl:call-template>
      </input>
     
      <label style="padding-top:0mm;padding-left:2mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/HistoricLandAreaInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDHistoricLandArea</xsl:with-param>
        </xsl:call-template>            
      Preservation of an historically important land area
      </label>
      </span>
</div>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: mm;padding-top:1mm"/>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:0mm">

<span style="width:90mm;">
<span style="padding-top:0mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/ProtectionNaturalHabitatInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/ProtectionNaturalHabitatInd"/>
        <xsl:with-param name="BackupName">IRS990ScheduleDProtectionOfNaturalHabitat</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="padding-left:1mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/ProtectionNaturalHabitatInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDProtectionOfNaturalHabitat</xsl:with-param>
        </xsl:call-template>            
       Protection of natural habitat
      </label>
      </span>

<span style="width:80mm;padding-left:4mm">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/HistoricStructureInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/HistoricStructureInd"/>
        <xsl:with-param name="BackupName">IRS990ScheduleDHistoricStructure</xsl:with-param>
        </xsl:call-template>
      </input>
      
      <label style="padding-top:0mm;padding-left:2mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/HistoricStructureInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDHistoricStructure</xsl:with-param>
        </xsl:call-template>            
      Preservation of a certified historic structure
      </label>
      
     </span>
</div>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:0mm"/>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:0mm">

<span style="width:90mm;">
<span style="padding-top:0mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/PreservationOpenSpaceInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/PreservationOpenSpaceInd"/>
        <xsl:with-param name="BackupName">IRS990ScheduleDPreservationOfOpenSpace</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="padding-left:1mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/PreservationOpenSpaceInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDPreservationOfOpenSpace</xsl:with-param>
         
</xsl:call-template>            
       Preservation of open space
        
      </label>
      </span>
</div>
</div>
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="padding-left:1mm;padding-top:1mm;">2</div>
 <div class="styLNDesc" style="width:160mm;border-right-width:0;padding-top:1mm;">
Complete lines 2a through 2d if the organization held a qualified conservation contribution 
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
      <tfoot/>
  <tbody valign="top">
  	<tr>
		<td class="styLNLeftNumBox" style="width:4.2mm; height:4mm;padding-left:3mm;float:none;">a</td>
		<td style="border:0px 0px 0px 0px; height:4mm;">
			Total number of conservation easements
			<span class="styIRS990ScheduleD_DotSpacing">.......................</span>
		</td>
		<td class="styLNRightNumBox" style="border:1px solid black; border-top: 0px;height:4mm;vertical-align:bottom;padding-right:0.75mm;float:none;">2a</td>
		<td class="styLNAmountBox" style="width:45mm;border: 1px solid black; border-left: 0px; border-top:0px; vertical-align:bottom;padding-right:0.75mm;height:4mm;text-align:right;float:none;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/TotalEasementsCnt"/>
			</xsl:call-template>
		</td>
	</tr>
	<tr>
		<td class="styLNLeftNumBox" style="width:4.2mm; height:4mm;padding-left:3mm;float:none;">b</td>
		<td style="border:0px 0px 0px 0px; height:4mm;">
			Total acreage restricted by conservation easements
			<span class="styIRS990ScheduleD_DotSpacing">..................</span>
		</td>
		<td class="styLNRightNumBox" style="border:1px solid black; border-top: 0px;height:4mm;vertical-align:bottom;padding-right:0.75mm;float:none;">2b</td>
		<td class="styLNAmountBox" style="width:45mm;border: 1px solid black; border-left: 0px; border-top:0px; vertical-align:bottom;padding-right:0.75mm;height:4mm;text-align:right;float:none;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/TotalAcreageCnt"/>
			</xsl:call-template>
		</td>
	</tr>
	<tr>
		<td class="styLNLeftNumBox" style="width:4.2mm; height:4mm;padding-left:3mm;float:none;">c</td>
		<td style="border:0px 0px 0px 0px; height:4mm;">
			Number of conservation easements on a certified historic structure included in (a)
			<span class="styIRS990ScheduleD_DotSpacing">.....</span>
		</td>
		<td class="styLNRightNumBox" style="border:1px solid black; border-top: 0px;height:4mm;vertical-align:bottom;padding-right:0.75mm;float:none;">2c</td>
		<td class="styLNAmountBox" style="width:45mm;border: 1px solid black; border-left: 0px; border-top:0px; vertical-align:bottom;padding-right:0.75mm;height:4mm;text-align:right;float:none;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/HistoricStructureEasementsCnt"/>
			</xsl:call-template>
		</td>
	</tr>
	<tr>
		<td class="styLNLeftNumBox" style="width:4.2mm; height:4mm;padding-left:3mm;float:none;">d</td>
		<td style="border:0px 0px 0px 0px; height:4mm;">
			Number of conservation easements included in (c) acquired after 8/17/06, and not on a historic structure listed in the National Register
			<span class="styIRS990ScheduleD_DotSpacing">....................</span>
		</td>
		<td class="styLNRightNumBox" style="border:1px solid black; border-top: 0px;height:4mm;vertical-align:bottom;padding-right:0.75mm;float:none;">2d</td>
		<td class="styLNAmountBox" style="width:45mm;border: 1px solid black; border-left: 0px; border-top:0px; vertical-align:bottom;padding-right:0.75mm;height:4mm;text-align:right;float:none;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/HistoricStrctrEasementsAftrCnt"/>
			</xsl:call-template>
		</td>
	</tr>
 </tbody>
  </table>
 
 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">3</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:1mm; height:auto;">
 Number of conservation easements modified, transferred, released, extinguished, or terminated by the organization during <br/>the tax year
  <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 

 <span class="styIRS990ScheduleDUnderlineAmount" style="float:none;padding-left:2mm;text-align:center;">
 
 <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/ModifiedEasementsCnt"/>
          </xsl:call-template>
  </span></div>
</div>

 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:2mm">4</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:1mm">
 Number of states where property subject to conservation easement is located 
  
 <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 

 <span class="styIRS990ScheduleDUnderlineAmount" style="float:none;padding-left:2mm;text-align:center;">
 
 <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/StatesEasementsHeldCnt"/>
          </xsl:call-template>
  </span>
  </div>
  </div>

 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">5</div>
 <div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:1mm">
  Does the organization have a written policy regarding the periodic monitoring, inspection, handling of violations, and <br/>enforcement of the conservation easements it holds?
<span class="styIRS990ScheduleD_DotSpacing">.............................</span>
 </div>
<span style="padding-top:1mm;padding-top:4mm">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/WrittenPolicyMonitoringInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/WrittenPolicyMonitoringInd"/>
	<xsl:with-param name="BackupName">IRS990ScheduleDWrittenPolicyMonitoring</xsl:with-param>
      </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/WrittenPolicyMonitoringInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDWrittenPolicyMonitoring</xsl:with-param>
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:4mm;display:inline;"/>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/WrittenPolicyMonitoringInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/WrittenPolicyMonitoringInd"/>
        <xsl:with-param name="BackupName">IRS990ScheduleDWrittenPolicyMonitoring</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/WrittenPolicyMonitoringInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDWrittenPolicyMonitoring</xsl:with-param>
        </xsl:call-template>            
        No
      </label>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">6</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:1mm;height:auto; ">
 Staff and volunteer hours devoted to monitoring, inspecting, and enforcing conservation easements during the year <br/> 
<img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 
 <span class="styIRS990ScheduleDUnderlineAmount" style="width:24mm;float:none;padding-left:.5mm;text-align:center;">
 
 <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/StaffHoursSpentEnforcementCnt"/>
          </xsl:call-template>
  </span>
  </div>
 </div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:2mm">7</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:1mm;height:auto; ">
  Amount of expenses incurred in monitoring, inspecting, and enforcing conservation easements during the year  <br/>
  <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> $
<span class="styIRS990ScheduleDUnderlineAmount" style="width:34mm;float:none;text-align:center;">
 
 <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ExpensesIncurredEnforcementAmt"/>
          </xsl:call-template>
  </span>
  </div>

</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">8</div>
 <div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:1mm; height:auto;">
  Does each conservation easement reported on line 2(d) above satisfy the requirements of section 170(h)(4)(B)(i) and section 170(h)(4)(B)(ii)?
<span class="styIRS990ScheduleD_DotSpacing">.......................................</span>
 </div>
<span style="padding-top:1mm;padding-top:4mm">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/Section170hRqrStsfdInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/Section170hRqrStsfdInd"/>
        <xsl:with-param name="BackupName">IRS990ScheduleDSect170hRequirementsSatisfied</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/Section170hRqrStsfdInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDSect170hRequirementsSatisfied</xsl:with-param>
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:4mm;display:inline;"/>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/Section170hRqrStsfdInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/Section170hRqrStsfdInd"/>
        <xsl:with-param name="BackupName">IRS990ScheduleDSect170hRequirementsSatisfied</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/Section170hRqrStsfdInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDSect170hRequirementsSatisfied</xsl:with-param>
        </xsl:call-template>            
        No
      </label>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">9</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:1mm;height:auto; ">
  In Part XIII, describe how the organization reports conservation easements in its revenue and expense statement, and <br/>balance sheet, and include, if applicable, the text of the footnote to the organization’s financial statements that describes<br/>the organization’s accounting for conservation easements.
</div>
</div>
   

<!-- End Part II-->
<!-- Part III -->
<div class="styBB" style="width:187mm;float:none;border-top-width:1px">
      <div class="styPartName" style="float:left;width:14mm;">Part III</div>
      <div class="styPartDesc" style="width:172mm;height:auto; ">Organizations Maintaining Collections of Art, Historical Treasures, or Other Similar Assets. <br/>
        <span style="font-size: 8pt;font-weight:normal">
          Complete if the organization answered "Yes" to Form 990, Part IV, line 8.
        </span>
      </div>
    </div>
    
  <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">1a</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:.5mm;height:auto; ">
 If the organization elected, as permitted under SFAS 116 (ASC 958), not to report in its revenue statement and balance sheet works of art, historical treasures, or other similar assets held for public exhibition, education, or research in furtherance of public service, provide, in Part XIII, the text of the footnote to its financial statements that describes these items.</div>
</div>
 
 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">b</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:.5mm; height:auto;">
 If the organization elected, as permitted under SFAS 116 (ASC 958), to report in its revenue statement and balance sheet works of art, historical treasures, or other similar assets held for public exhibition, education, or research in furtherance of public service, provide the following amounts relating to these items:</div>
</div>
 
 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 5mm;padding-top:1mm">(i)</div>
 <div class="styLNDesc" style="width:175mm;border-right-width:0;padding-top:.5mm;padding-left:1.15mm;height:auto;">
  Revenues included in Form 990, Part VIII, line 1  <span class="styIRS990ScheduleD_DotSpacing">........................</span>
  <span style="padding-left:1.5mm"><img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/></span> 
$

  <span class="styIRS990ScheduleDUnderlineAmount" style="float:none;width:32mm;">
 
 <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ArtPublicExhibitionAmountsGrp/RevenuesIncludedAmt"/>
          </xsl:call-template>
  </span>
  </div>
<div class="styLNLeftNumBox" style="padding-left: 4mm;padding-top:1mm">(ii)</div>
 <div class="styLNDesc" style="width:174mm;border-right-width:0;padding-top:.5mm;padding-left:.5mm;height:auto;">
  Assets included in Form 990, Part X
    <span class="styIRS990ScheduleD_DotSpacing">..............................</span>
    <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 
$
  <span class="styIRS990ScheduleDUnderlineAmount" style="float:none;width:32mm;">
 
 <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ArtPublicExhibitionAmountsGrp/AssetsIncludedAmt"/>
          </xsl:call-template>
  </span>
  </div>

</div>
   
  <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">2</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:.5mm;height:auto;">
  If the organization received or held works of art, historical treasures, or other similar assets for financial gain, provide the <br/>following amounts required to be reported under SFAS 116 (ASC 958) relating to these items:</div>
</div>
 
 
 
 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">a</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:.5mm;height:auto;">
  Revenues included in Form 990, Part VIII, line 1  <span class="styIRS990ScheduleD_DotSpacing">..........................</span>
  <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> 
 $

  <span class="styIRS990ScheduleDUnderlineAmount" style="float:none;width:32mm;">
 
 <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/HeldWorksArtGrp/RevenuesIncludedAmt"/>
          </xsl:call-template>
  </span>
  </div>
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">b</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:.5mm;height:auto;">
   Assets included in Form 990, Part X  
   <span class="styIRS990ScheduleD_DotSpacing">...............................</span>
  <span style="padding-left:1.5mm"><img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/> </span> 
  $

  <span class="styIRS990ScheduleDUnderlineAmount" style="float:none;width:32mm;">
 
 <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/HeldWorksArtGrp/AssetsIncludedAmt"/>
          </xsl:call-template>
  </span>
  </div>
</div>

<!-- End Part III -->

<!-- Footer -->
    <div style="width:187mm;float:none;clear:both;border-top:solid 1px" class="pageEnd">
      <div class="styGenericDiv" style="width:122mm;font-weight:bold">For Paperwork Reduction Act Notice, see the Instructions for Form 990.</div>
      <div class="styGenericDiv" style="width:23mm;">Cat. No. 52283D</div>
      <div class="styGenericDiv" style="float:right;"> <span class="styBoldText">Schedule D (Form 990) 2013</span>
      </div>
    </div>
      
   <br/>

  
    <!-- header -->
    <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
      <div style="width:90mm;" class="styGenericDiv">Schedule D (Form 990) 2013</div>
      <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
      <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span></div>
    </div>
    
<!-- Part III  Continued-->
<div class="styBB" style="width:187mm;float:none;">
      <div class="styPartName" style="float:left;width:13mm;height:auto;">Part III</div>
      <div class="styPartDesc" style="width:173mm;float:right;height:auto;">Organizations Maintaining Collections of Art, Historical Treasures, or Other Similar Assets 
        <span style="font-size: 7pt;font-weight:normal;font-style:italic ">
          (continued)
        </span>
      </div>
    </div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">3</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:1mm;height:auto;">
 Using the organization’s acquisition, accession, and other records, check any of the following that are a significant use of its collection items (check all that apply):</div>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:0mm">a</div>
 <div class="styLNDesc" style="width:175mm;border-right-width:0;padding-top:0mm;height:auto;">

<span style="width:85mm;">
<span style="padding-top:0mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/CollectionUsedPubExhibitionInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/CollectionUsedPubExhibitionInd"/>
       <xsl:with-param name="BackupName">IRS990ScheduleDCollectUsedForPublicExhibition</xsl:with-param> 
       </xsl:call-template>
      </input>
      </span>
      <label style="padding-top:0mm;padding-left:2mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/CollectionUsedPubExhibitionInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDCollectUsedForPublicExhibition</xsl:with-param>
        </xsl:call-template>            
        Public exhibition
      </label>
      </span>
<span style="width:85mm;">
<div class="styLNLeftNumBox" style="padding-left: 2mm;padding-top:0mm">d</div>
<span style="padding-top:0mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/CollUsedLoanOrExchProgInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/CollUsedLoanOrExchProgInd"/>
        <xsl:with-param name="BackupName">IRS990ScheduleDCollectUsedForLoanOrExchPrgrms</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="padding-top:0mm;padding-left:2mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/CollUsedLoanOrExchProgInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDCollectUsedForLoanOrExchPrgrms</xsl:with-param>
        </xsl:call-template>            
        Loan or exchange programs
      </label>
      </span>
</div>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">b</div>
 <div class="styLNDesc" style="width:175mm;border-right-width:0;padding-top:0mm;height:auto;">

<span style="width:85mm;vertical-align:top;padding-top:1mm;height:auto;">
<span style="padding-top:1mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/CollUsedScholarlyRsrchInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/CollUsedScholarlyRsrchInd"/>
       <xsl:with-param name="BackupName">IRS990ScheduleDCollectUsedForScholarResearch</xsl:with-param>
      </xsl:call-template>
      </input>
      </span>
      <label style="padding-left:2mm;padding-top:1mm;">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/CollUsedScholarlyRsrchInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDCollectUsedForScholarResearch</xsl:with-param>
        </xsl:call-template>            
       Scholarly research
      </label>
      </span>

<span style="width:85mm;padding-top:1mm;height:auto;">
<div class="styLNLeftNumBox" style="padding-left: 2mm;padding-top:0mm">e</div>
<span style="padding-top:0mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/CollectionUsedOtherPurposesGrp/CollectionUsedOtherPurposesInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/CollectionUsedOtherPurposesGrp/CollectionUsedOtherPurposesInd"/>
       <xsl:with-param name="BackupName">IRS990ScheduleDCollectionUsedForOtherPurposes</xsl:with-param>
       </xsl:call-template>
      </input>
      </span>
      
      <label style="padding-top:1mm;padding-left:2mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/CollectionUsedOtherPurposesGrp/CollectionUsedOtherPurposesInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDCollectionUsedForOtherPurposes</xsl:with-param>
          
        </xsl:call-template>            
        Other
      </label>
      
      
      <span class="styIRS990ScheduleDUnderlineAmount" style="float:none;width:52mm;text-align:left;padding-left:1mm;padding-top:0mm;vertical-align:top;border-style:dotted">
	<xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/CollectionUsedOtherPurposesGrp/OtherPurposesDesc"/>
          </xsl:call-template>
 
	 </span>
     </span>
</div>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">c</div>
 <div class="styLNDesc" style="width:170mm;border-right-width:0;padding-top:1mm;height:auto;">

<span style="width:85mm;height:auto;">
<span style="padding-top:0mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/CollectionUsedPreservationInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/CollectionUsedPreservationInd"/>
        <xsl:with-param name="BackupName">IRS990ScheduleDCollectUsedForPreservation</xsl:with-param>
        </xsl:call-template>
      </input>
      </span>
      <label style="padding-left:2mm">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/CollectionUsedPreservationInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDCollectUsedForPreservation</xsl:with-param>
        </xsl:call-template>            
        Preservation for future generations
        
      </label>
      </span>
</div>
</div>


<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">4</div>
 <div class="styLNDesc" style="width:175mm;border-right-width:0;padding-top:1mm;height:auto;">
 Provide a description of the organization’s collections and explain how they further the organization’s exempt purpose in <br/>Part XIII.</div>
</div>


<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">5</div>
 <div class="styLNDesc" style="width:145mm;border-right-width:0;padding-top:1mm;height:auto;">
During the year, did the organization solicit or receive donations of art, historical treasures or other similar
<br/>assets to be sold to raise funds rather than to be maintained as part of the organization’s collection?<span class="styIRS990ScheduleD_DotSpacing">........</span>
 </div>
<span style="padding-top:1mm;padding-top:4mm">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/SolicitedAssetsSaleInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/SolicitedAssetsSaleInd"/>
        <xsl:with-param name="BackupName">IRS990ScheduleDSolicitedAssetsForSale</xsl:with-param>
      </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/SolicitedAssetsSaleInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDSolicitedAssetsForSale</xsl:with-param>
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:4mm"/>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/SolicitedAssetsSaleInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/SolicitedAssetsSaleInd"/>
        <xsl:with-param name="BackupName">IRS990ScheduleDSolicitedAssetsForSale</xsl:with-param>
       </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/SolicitedAssetsSaleInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDSolicitedAssetsForSale</xsl:with-param>
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
       <div class="styPartDesc" style="width:172mm;height:auto;">Escrow and Custodial Arrangements.   
        <span style="font-size: 8pt;font-weight:normal;display:inline;">
          Complete if the organization answered "Yes" to Form 990, <br/>Part IV, line 9, or reported an amount on Form 990, Part X, line 21.
        </span>
      </div>
    </div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">1a</div>
 <div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:1mm">
  Is the organization an agent, trustee, custodian or other intermediary for contributions or other assets not
  <br/>included on Form 990, Part X?
  <span class="styIRS990ScheduleD_DotSpacing">....................................</span>
 </div>
<span style="padding-top:1mm;padding-top:4mm">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/AgentTrusteeEtcInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/AgentTrusteeEtcInd"/>
        <xsl:with-param name="BackupName">IRS990ScheduleDAgentTrusteeEtc</xsl:with-param>
      </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/AgentTrusteeEtcInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDAgentTrusteeEtc</xsl:with-param>
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:4mm;display:inline;"/>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/AgentTrusteeEtcInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/AgentTrusteeEtcInd"/>
      <xsl:with-param name="BackupName">IRS990ScheduleDAgentTrusteeEtc</xsl:with-param>
    </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:4mm">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/AgentTrusteeEtcInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDAgentTrusteeEtc</xsl:with-param>
        </xsl:call-template>            
        No
      </label>
</div>

 <div style="width:187mm;">
<div class="styLNLeftNumBox" style="padding-left:3mm;padding-top:1mm;">b</div>
 <div class="styLNDesc" style="width:125mm;border-right-width:0;padding-top:1mm;">
 If "Yes," explain the arrangement in Part XIII and complete the following table:
 </div>
 <table class="styTable" style="font-size:7pt;width:187mm;border-bottom-width:1px;" cellspacing="0">
      <thead>
        <tr scope="col">
          <th scope="col" colspan="2" align="center" style="width:140mm;height:4mm;padding-top:0mm; border-bottom:1px solid black;">
         </th>
           <th scope="col" align="center" style="width:8mm;border-left:1px solid black; border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black"><span class="styNBSP"/></th>

          <th scope="col" align="center" style="width:45mm;font-size:7pt;border-left:1px solid black; padding-top:0mm; border-bottom:1px solid black;border-top:1px solid black"> Amount
          </th>
       </tr>
      </thead>
      <tfoot/>
  <tbody valign="top">
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 3mm;height:4.5mm;float:none;">c</td>
      <td class="styLNDesc" style="width:140mm;border-right-width:0;padding-top:1mm;padding-left:0mm;float:none;">
       Beginning balance 
      <span class="styIRS990ScheduleD_DotSpacing">.................................</span>
      </td>
   	   <td class="styLNRightNumBox" style="height:4.5mm;">1c</td>
<td class="styLNAmountBox" style="width:65mm;height:4mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/BeginningBalanceAmt"/>
	</xsl:call-template>
   </td> 
   </tr>
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 3mm;height:4.5mm;float:none;">d</td>
      <td class="styLNDesc" style="width:140mm;border-right-width:0;padding-top:1mm;padding-left:0mm;float:none;">
       Additions during the year
       <span class="styIRS990ScheduleD_DotSpacing">..............................</span>
       </td>
   <td class="styLNRightNumBox" style="height:4.5mm;">1d</td>
<td class="styLNAmountBox" style="width:65mm;height:4mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/AdditionsDuringYearAmt"/>
	</xsl:call-template>
   </td> 
   </tr>
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 3mm;height:4.5mm;float:none;">e</td>
      <td class="styLNDesc" style="width:140mm;border-right-width:0;padding-top:1mm;padding-left:0mm;float:none;">
       Distributions during the year 

       <span class="styIRS990ScheduleD_DotSpacing">.............................</span>
       </td>
   <td class="styLNRightNumBox" style="height:4.5mm;">1e</td>
<td class="styLNAmountBox" style="width:65mm;height:4mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/DistributionsDuringYearAmt"/>
	</xsl:call-template>
   </td> 
   </tr>
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 3mm;height:4.5mm;float:none;">f</td>
      <td class="styLNDesc" style="width:140mm;border-right-width:0;padding-top:1mm;padding-left:0mm;float:none;">
       Ending balance        
       <span class="styIRS990ScheduleD_DotSpacing">...................................</span>
       </td>
   <td class="styLNRightNumBox" style="height:4.5mm;">1f</td>
<td class="styLNAmountBox" style="width:65mm;height:4mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$FormData/EndingBalanceAmt"/>	
</xsl:call-template>
   </td> 
   </tr>
 </tbody>
  </table>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">2a</div>
 <div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:1mm">
 Did the organization include an amount on Form 990, Part X, line 21?  
 <span class="styIRS990ScheduleD_DotSpacing">.....................</span>
 </div>
<span style="padding-top:1mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/InclEscrowCustodialAcctLiabInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/InclEscrowCustodialAcctLiabInd"/>
      <xsl:with-param name="BackupName">IRS990ScheduleDIncludedOnFS</xsl:with-param>
     </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:1mm">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/InclEscrowCustodialAcctLiabInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDIncludedOnFS</xsl:with-param>
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:1mm;display:inline;"/>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/InclEscrowCustodialAcctLiabInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/InclEscrowCustodialAcctLiabInd"/>
        <xsl:with-param name="BackupName">IRS990ScheduleDIncludedOnFS</xsl:with-param>
       </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;padding-top:1mm">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/InclEscrowCustodialAcctLiabInd"/>
          <xsl:with-param name="BackupName">IRS990ScheduleDIncludedOnFS</xsl:with-param>
        </xsl:call-template>            
        No
      </label>
</div>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">b</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:0mm;height:auto;">
If "Yes," explain the arrangement in Part XIII. Check here if the explanation has been provided in Part XIII
<!-- For 508 Jaws I had to move the span and div to after the closing label which shortened the spot where the box ends-->
<!--<span class="styIRS990ScheduleD_DotSpacing">.......-->
<span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; margin-left:2mm">........
<input type="checkbox" class="styIRS990ScheduleDCkBox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ExplanationProvidedInd"/>
								<xsl:with-param name="BackupName">IRS990ScheduleDExplanationInPartXIII</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/ExplanationProvidedInd"/>
								<xsl:with-param name="BackupName">IRS990ScheduleDExplanationInPartXIII</xsl:with-param>
							</xsl:call-template>
                </label>
             </span>
                </div>
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
          <th scope="col" colspan="2" align="center" style="width:47mm;padding-top:0mm; border-bottom:1px solid black;">
            <span class="styItalicText" style="font-weight:normal;">
             
            </span>
          </th>
       <th scope="col" align="center" style="width:30mm;font-size:6pt;border-left:1px solid black; border-bottom:1px solid black;">
            (a)<span class="styNormalText">Current year</span>
          </th>
          <th scope="col" align="center" style="width:30mm;font-size:6pt;border-left:1px solid black; border-bottom:1px solid black;">
            (b)<span class="styNormalText">Prior year</span>
          </th>
          <th scope="col" align="center" style="width:30mm;font-size:6pt;border-left:1px solid black; border-bottom:1px solid black">b
            (c)<span class="styNormalText">Two years back</span>
          </th>
          <th scope="col" align="center" style="width:30mm;font-size:6pt;border-left:1px solid black; border-bottom:1px solid black">
            (d)<span class="styNormalText">Three years back</span>
          </th>
          <th scope="col" align="center" style="width:30mm;font-size:6pt;border-left:1px solid black; border-bottom:1px solid black">
            (e)<span class="styNormalText">Four years back</span>
          </th>
        </tr>
      </thead>
      <tfoot/>
  <tbody valign="top">
<tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;float:none;">1a</td>
      <td class="styLNDesc" style="width:59mm;height:4.5mm;float:none;">
        Beginning of year balance
        
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">....</span>
      </td>
<!-- 40502 unshaded boxes D  Part V for tax year 2011-->
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYEndwmtFundGrp/BeginningYearBalanceAmt"/>
</xsl:call-template>
</td>
 <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus1YrEndwmtFundGrp/BeginningYearBalanceAmt"/>
</xsl:call-template>
</td>
<!--
      <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
-->

<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus2YrEndwmtFundGrp/BeginningYearBalanceAmt"/>
</xsl:call-template>
</td>
   <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus3YrEndwmtFundGrp/BeginningYearBalanceAmt"/>
</xsl:call-template>
</td>
  <!--<td class="styTableCell" style="width:25mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black; border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>-->
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus4YrEndwmtFundGrp/BeginningYearBalanceAmt"/>
</xsl:call-template>
</td>
    </tr>
    <tr>
    
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;float:none;">b</td>
      <td class="styLNDesc" style="width:59mm;height:4.5mm;float:none;">
     Contributions
        
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">........</span>
      </td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYEndwmtFundGrp/ContributionsAmt"/>
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus1YrEndwmtFundGrp/ContributionsAmt"/>
</xsl:call-template>
</td>
<!--
      <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
-->
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus2YrEndwmtFundGrp/ContributionsAmt"/>
</xsl:call-template>
</td>
   <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus3YrEndwmtFundGrp/ContributionsAmt"/>
</xsl:call-template>
</td>
 <!-- <td class="styTableCell" style="width:25mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black; border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>-->
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus4YrEndwmtFundGrp/ContributionsAmt"/>
</xsl:call-template>
</td>
    </tr>
    
  <tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;float:none;">c</td>
      <td class="styLNDesc" style="width:59mm;height:4.5mm;float:none;">
     Net investment earnings, gains, and losses
       
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"/>
      </td>
      <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;padding-top:3mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYEndwmtFundGrp/InvestmentEarningsOrLossesAmt"/>
</xsl:call-template>
</td>
  <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;padding-top:3mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus1YrEndwmtFundGrp/InvestmentEarningsOrLossesAmt"/>
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;padding-top:3mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus2YrEndwmtFundGrp/InvestmentEarningsOrLossesAmt"/>
</xsl:call-template>
</td>
<!--
      <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
-->
  <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;padding-top:3mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus3YrEndwmtFundGrp/InvestmentEarningsOrLossesAmt"/>
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm; padding-top:3mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus4YrEndwmtFundGrp/InvestmentEarningsOrLossesAmt"/>
</xsl:call-template>
</td>

  <!--<td class="styTableCell" style="width:25mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black; border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>-->
    </tr>
     <tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;float:none;">d</td>
      <td class="styLNDesc" style="width:59mm;height:4.5mm;float:none;">
    Grants or scholarships
       
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.....</span>
      </td>
      <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYEndwmtFundGrp/GrantsOrScholarshipsAmt"/>
</xsl:call-template>
</td>
 <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus1YrEndwmtFundGrp/GrantsOrScholarshipsAmt"/>
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus2YrEndwmtFundGrp/GrantsOrScholarshipsAmt"/>
</xsl:call-template>
</td>
<!--
      <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
-->
    <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus3YrEndwmtFundGrp/GrantsOrScholarshipsAmt"/>
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus4YrEndwmtFundGrp/GrantsOrScholarshipsAmt"/>
</xsl:call-template>
</td>
  <!--<td class="styTableCell" style="width:25mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black; border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>-->
    </tr>
 <tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;float:none;">e</td>
      <td class="styLNDesc" style="width:59mm;height:4.5mm;float:none;">
    Other expenditures for facilities<br/>and programs
       
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">........</span>
      </td>
      <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;padding-top:3mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYEndwmtFundGrp/OtherExpendituresAmt"/>
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;padding-top:3mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus1YrEndwmtFundGrp/OtherExpendituresAmt"/>
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;padding-top:3mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus2YrEndwmtFundGrp/OtherExpendituresAmt"/>
</xsl:call-template>
</td>
<!--
      <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
-->
    <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;padding-top:3mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus3YrEndwmtFundGrp/OtherExpendituresAmt"/>
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm; padding-top:3mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus4YrEndwmtFundGrp/OtherExpendituresAmt"/>
</xsl:call-template>
</td>

  <!--<td class="styTableCell" style="width:25mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black; border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>-->
    </tr>
 <tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;float:none;">f</td>
      <td class="styLNDesc" style="width:59mm;height:4.5mm;float:none;">
    Administrative expenses
       
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">....</span>
      </td>
      <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYEndwmtFundGrp/AdministrativeExpensesAmt"/>
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus1YrEndwmtFundGrp/AdministrativeExpensesAmt"/>
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus2YrEndwmtFundGrp/AdministrativeExpensesAmt"/>
</xsl:call-template>
</td>
<!--
      <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
-->
   <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus3YrEndwmtFundGrp/AdministrativeExpensesAmt"/>
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus4YrEndwmtFundGrp/AdministrativeExpensesAmt"/>
</xsl:call-template>
</td>

  <!--<td class="styTableCell" style="width:25mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black; border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>-->
    </tr>
 <tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;float:none;">g</td>
      <td class="styLNDesc" style="width:59mm;height:4.5mm;float:none;">
     End of year balance
       
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">......</span>
      </td>
      <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYEndwmtFundGrp/EndYearBalanceAmt"/>
</xsl:call-template>
</td>
 <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus1YrEndwmtFundGrp/EndYearBalanceAmt"/>
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus2YrEndwmtFundGrp/EndYearBalanceAmt"/>
</xsl:call-template>
</td>
<!--
      <td class="styTableCell" style="width:24mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black;background-color:lightgrey;border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>
-->
   <td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus3YrEndwmtFundGrp/EndYearBalanceAmt"/>
</xsl:call-template>
</td>
<td class="styLNAmountBoxSmall" style="height:4.5mm;width:24mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/CYMinus4YrEndwmtFundGrp/EndYearBalanceAmt"/>
</xsl:call-template>
</td>

 <!-- <td class="styTableCell" style="width:25mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-style: solid; border-color:black; border-left-width:1px;border-right-width:0px "> 
<span class="styTableCellPad" /> 
</td>-->
    </tr>
 </tbody>
    </table>

<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">2</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:1mm">
Provide the estimated percentage of the current year end balance (line 1g, column (a)) held as:
 </div>
  </div>
 
 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">a</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:0mm">
 Board designated or quasi-endowment
 <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/>
<span class="styIRS990ScheduleDUnderlineAmount" style="float:none;padding-left:2mm;text-align:center;border-style:dotted">
 <xsl:call-template name="PopulatePercent">
            <xsl:with-param name="TargetNode" select="$FormData/BoardDesignatedBalanceEOYPct"/>
          </xsl:call-template>
  </span> 
  </div>
  </div>
  <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">b</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:0mm">
Permanent endowment
 <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/>
<span class="styIRS990ScheduleDUnderlineAmount" style="float:none;padding-left:2mm;text-align:center;border-style:dotted">
 
 <xsl:call-template name="PopulatePercent">
            <xsl:with-param name="TargetNode" select="$FormData/PrmnntEndowmentBalanceEOYPct"/>
          </xsl:call-template>
  </span> 
  </div>
  </div>
 <div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm">c</div>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:0mm">
Temporarily restricted endowment
 <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMd Bullet"/>
<span class="styIRS990ScheduleDUnderlineAmount" style="float:none;padding-left:2mm;text-align:center;border-style:dotted">
 
 <xsl:call-template name="PopulatePercent">
            <xsl:with-param name="TargetNode" select="$FormData/TermEndowmentBalanceEOYPct"/>
          </xsl:call-template>
  </span> 
  </div>
  </div>


<div style=" width: 187mm; ">
<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:1mm"/>
 <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:0mm">
The percentages in lines 2a, 2b, and 2c should equal 100%.
 
  </div>
  </div>




<div style=" width: 187mm; ">
 <div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:0mm">3a</div>
  <div class="styLNDesc" style="border-right-width:0px; width: 150mm;padding-top:0mm">
    Are there endowment funds not in the possession of the organization that are held and administered for the 
  <br/>organization by:
  </div><br/>

<div class="styIRS990ScheduleDLineIndexMid" style="width: 10mm;border-left:1px"/>
  <div class="styIRS990ScheduleDLineIndexMid" style="border-top-width:1px;">Yes</div>
  <div class="styIRS990ScheduleDLineIndexMid" style="border-right-width:0px;border-top-width:1px;">No</div>
</div>
<!-- line 3a i -->
<div style=" width: 187mm; ">
 <div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:0mm"/>
  <div class="styLNDesc" style="border-right-width:0px; width: 150mm;padding-top:0mm">
    <span style="font-weight:bold;text-align:center;">(i)</span>
    unrelated organizations
    <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">........................</span>

  </div>
  <div class="styIRS990ScheduleDLineIndexMid" style="width:10mm;border-left-width:1px">3a(i)</div>
  <div class="styIRS990ScheduleDLineIndexMid">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/EndowmentsHeldUnrelatedOrgInd"/>
      </xsl:call-template>
    </span>  
  </div>
  <div class="styIRS990ScheduleDLineIndexMid" style="border-right-width:0px;">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/EndowmentsHeldUnrelatedOrgInd"/>
      </xsl:call-template>
    </span>  
  </div>
</div>
<!-- line 3a ii -->
<div style=" width: 187mm; ">
 <div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:0mm"/>
  <div class="styLNDesc" style="border-right-width:0px; width: 150mm">
    <span style="font-weight:bold;text-align:center;">(ii)</span>
     related organizations
    <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">........................</span>

  </div>
  <div class="styIRS990ScheduleDLineIndexMid" style="width: 10mm;border-left-width:1px">3a(ii)</div>
  <div class="styIRS990ScheduleDLineIndexMid">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/EndowmentsHeldRelatedOrgInd"/>
      </xsl:call-template>
    </span>  
  </div>
  <div class="styIRS990ScheduleDLineIndexMid" style="border-right-width:0px;">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/EndowmentsHeldRelatedOrgInd"/>
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
        <xsl:with-param name="TargetNode" select="$FormData/RelatedOrgListSchRInd"/>
      </xsl:call-template>
    </span>  
  </div>
  <div class="styIRS990ScheduleDLineIndexMid" style="border-right-width:0px;">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/RelatedOrgListSchRInd"/>
      </xsl:call-template>
    </span>  
  </div>
</div>
 <div style=" width: 187mm; ">
 <div class="styLNLeftNumBox" style="padding-left:1mm;padding-top:0mm">4</div>
  <div class="styLNDesc" style="border-right-width:0px; width:150mm;padding-top:0mm">
Describe in Part XIII the intended uses of the organization's endowment funds.
</div>
</div>

<!-- End Part V -->

<!-- BEGIN Part VI Title -->
    <div class="styBB" style="width:187mm;float:none;border-top:solid 1px;">
      <div class="styPartName" style="float:left;width:14mm;">Part VI</div>
      <!--<div class="styPartDesc" style="width:172mm;">Investments&#151;Land, Buildings, and Equipment. --> 
      <div class="styPartDesc" style="width:172mm;height:auto;">Land, Buildings, and Equipment.
      <span style="font-size: 8pt;font-weight:normal;display:inline;">
          Complete if the organization answered 'Yes' to Form 990, Part IV, line 11a.
        </span>
        <span style="font-size: 8pt;font-weight:normal;display:inline;">
          See Form 990, Part X, line 10.
        </span>
      </div>
    </div>
    <!-- END Part VI Title -->
    
    <!-- Begin Part VI Table-->
    <table class="styTable" style="font-size:7pt;width:187mm;display:block;" cellspacing="0">
      <thead>
        <tr scope="col">
          <th scope="col" colspan="2" align="center" style="width:77mm;height:9mm;padding-top:0mm; border-bottom:1px solid black;vertical-align:top;">
            <span style="font-weight:normal;">
            Description of property
            </span> 
          </th>
          <th scope="col" align="center" style="width:46mm;font-size:6pt;border-left:1px solid black; border-bottom:1px solid black;vertical-align:top;">
            (a)<span style="font-weight:normal;">
 Cost or other basis (investment) </span> 

          </th>
       <th scope="col" align="center" style="width:46mm;font-size:6pt;border-left:1px solid black; border-bottom:1px solid black; vertical-align:top;">
            (b)<span class="styNormalText">Cost or other basis (other)</span>
          </th>
          <th scope="col" align="center" style="width:46mm;font-size:6pt;border-left:1px solid black; border-bottom:1px solid black;vertical-align:top;">
            (c)<span class="styNormalText"> Accumulated depreciation</span>
          </th>
          <th scope="col" align="center" style="width:46mm;font-size:6pt;border-left:1px solid black; border-bottom:1px solid black;vertical-align:top;">
            (d)<span class="styNormalText"> Book value</span>
          </th>
        </tr>
      </thead>
      <tfoot/>
  <tbody valign="top">

<tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;float:none;">1a</td>
      <td class="styLNDesc" style="width:109mm;height:4.5mm;float:none;">
      Land
    <!--Dotted Line-->
     <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.................</span>
      </td>

      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/LandGrp/InvestmentCostOrOtherBasisAmt"/></xsl:call-template>
</td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/LandGrp/OtherCostOrOtherBasisAmt"/>
</xsl:call-template>
</td>
     
 <td class="styTableCell" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;background-color:lightgrey;border-left-width:1px;border-bottom-width:1px;border-style:solid;border-color:black;border-right:0px;float:none;">
  <span class="styTableCellPad"/> 
  </td>
 <!--<td class="styIRS990ScheduleDShadingCellRB " style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
</td>-->
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/LandGrp/BookValueAmt"/></xsl:call-template>
</td>
    </tr>
    <tr>
   
   
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;float:none;">b</td>
      <td class="styLNDesc" style="width:109mm;height:4.5mm;float:none;">
                                   Buildings
        <span style="width:1px"/>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$FormData/BuildingsGrp"/>
        </xsl:call-template>
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">................</span>
      </td>
      
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/BuildingsGrp/InvestmentCostOrOtherBasisAmt"/>
</xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/BuildingsGrp/OtherCostOrOtherBasisAmt"/>
</xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/BuildingsGrp/DepreciationAmt"/>
</xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/BuildingsGrp/BookValueAmt"/>
</xsl:call-template></td>
    </tr>
    
  <tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;float:none;">c</td>
      <td class="styLNDesc" style="width:109mm;height:4.5mm;float:none;">
      Leasehold improvements
       
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">............</span>
      </td>
      
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LeaseholdImprovementsGrp/InvestmentCostOrOtherBasisAmt"/></xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LeaseholdImprovementsGrp/OtherCostOrOtherBasisAmt"/></xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LeaseholdImprovementsGrp/DepreciationAmt"/></xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LeaseholdImprovementsGrp/BookValueAmt"/></xsl:call-template></td>
    </tr>
    
    <tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;float:none;">d</td>
      <td class="styLNDesc" style="width:109mm;height:4.5mm;float:none;">
     Equipment
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">................</span>
      </td>
      
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/EquipmentGrp/InvestmentCostOrOtherBasisAmt"/></xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/EquipmentGrp/OtherCostOrOtherBasisAmt"/></xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/EquipmentGrp/DepreciationAmt"/></xsl:call-template></td>
      <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/EquipmentGrp/BookValueAmt"/></xsl:call-template></td>
    </tr>
<tr>
      <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-left:3mm;border-bottom:1px solid black;float:none;">e</td>
 <td class="styLNDesc" style="width:109mm;height:4.5mm;border-bottom:1px solid black;float:none;">
      Other
       
        <!--Dotted Line-->
   <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.................</span>
      </td>
      
 <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-  right:0.75mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/OtherLandBuildingsGrp/InvestmentCostOrOtherBasisAmt"/>
</xsl:call-template></td>
     
 <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/OtherLandBuildingsGrp/OtherCostOrOtherBasisAmt"/>
</xsl:call-template></td>
      
 <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/OtherLandBuildingsGrp/DepreciationAmt"/>
</xsl:call-template></td>
      
 <td class="styLNAmountBoxSmall" style="width:46mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/OtherLandBuildingsGrp/BookValueAmt"/>
</xsl:call-template></td>
    </tr>

<tr>
 
  <td class="styLNDesc" colspan="5" style="border-right-width:0px; width:160mm;padding-top:0mm;border-bottom:1px solid black;float:none;">
<span style="font-weight:bold">Total.</span> Add lines 1a through 1e.<span class="styItalicText">  (Column (d) must equal Form 990, Part X, column (B), line 10(c).)</span>
<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.......</span>
  <span style="padding-left:2mm">
  <img src="{$ImagePath}/990SchD_Bullet_Md.gif" alt="SchDMdBullet"/></span></td>
<td class="styLNAmountBoxSmall" style="width:46mm;padding-right:0.75mm;float:none;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/TotalBookValueLandBuildingsAmt"/></xsl:call-template></td> 
</tr> 
</tbody>
</table>

<!-- Footer -->
    <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageEnd">
     
      <div class="styGenericDiv" style="float:right;"> <span class="styBoldText">Schedule D (Form 990) 2013</span></div>
    </div>
      
   <br/>

  
    <!-- header -->
    <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
      <div style="width:90mm;" class="styGenericDiv">Schedule D (Form 990) 2013</div>
      <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
      <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">3</span></div>
    </div>
    

<!-- Begin  Part VII -->
<div class="styBB" style="width:187mm;float:none;border-top-width:0px;">
      <div class="styPartName" style="float:left;width:14mm;">Part VII</div>
      <div class="styPartDesc" style="width:172mm;height:auto;">Investments&#151;Other Securities. 
      <span style="font-size: 8pt;font-weight:normal">
           Complete if the organization answered 'Yes' to Form 990, Part IV, line 11b.
        </span>
        <span style="font-size: 8pt;font-weight:normal">
           See Form 990, Part X, line 12.
        </span>
      </div>
  
<div class="styGenericDiv" style="float:right">
      
     <xsl:call-template name="SetDynamicTableToggleButton">
            <xsl:with-param name="TargetNode" select="$FormData/OtherSecuritiesGrp"/>
            <xsl:with-param name="containerHeight" select="13"/>
            <xsl:with-param name="containerID" select=" 'IOSctn' "/>
          </xsl:call-template>
         <!-- end button display logic -->
      </div>
      </div>
   

    <!-- BEGIN Part VIITable -->
    <div class="styTableContainer" id="IOSctn" style="height:auto;">
      <!-- print logic -->
        <xsl:call-template name="SetInitialState"/>
      <!-- end -->
      <table class="styTable" style="font-size:7pt;float:none;clear:both;" cellspacing="0">
       
          <tr>
            <th class="styTableCellHeader" scope="col" colspan="2" style="width:117mm;font-weight:normal;border-color:black;vertical-align:top;"><span style="font-weight:bold">(a)</span> Description of security or category<br />(including name of security)</th>
            <th class="styTableCellHeader" scope="col" style="font-weight:normal; text-align:center;border-right-width:1px;border-color:black;vertical-align:top;"><span style="font-weight:bold">(b)</span>Book value</th>
          <th class="styTableCellHeader" scope="col" colspan="2" style="width:52mm;font-weight:normal;text-align:center;border-right-width:0px;border-color:black;vertical-align:top;"><span style="font-weight:bold">(c)</span> Method of valuation:<br />Cost or end-of-year market value</th>
         </tr>
       
         <tr>
         <td class="styTableCell" colspan="2" style="width:117mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
		
	<span class="styGenericDiv" style="float:left" colspan="2">(1)Financial derivatives</span></td>
      <td class="styTableCell" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/FinancialDerivativesGrp/BookValueAmt"/>
		</xsl:call-template></td>
         <td class="styTableCell" colspan="2" style="width:52mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;border-color:black;text-align:center;float:none;">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="$FormData/FinancialDerivativesGrp/MethodValuationCd"/>
	</xsl:call-template></td>
		 </tr>
  <tr>
	 <td class="styTableCell" colspan="2" style="width:117mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
	
	<span class="styGenericDiv" style="float:left" colspan="2">(2)Closely-held equity interests</span></td>
      <td class="styTableCell" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/CloselyHeldEquityInterestsGrp/BookValueAmt"/>
		</xsl:call-template></td>
        <td class="styTableCell" colspan="2" style="width:52mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;border-color:black;text-align:center;float:none;">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="$FormData/CloselyHeldEquityInterestsGrp/MethodValuationCd"/>
	</xsl:call-template></td>
 </tr>
 
 
  <xsl:if test="($Print != $Separated) or count($FormData/OtherSecuritiesGrp) &lt;= 9">
          <xsl:for-each select="$FormData/OtherSecuritiesGrp">
	
	
	<tr>
	 <td class="styTableCell" colspan="2" style="width:117mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black;float:none;">
<span class="styGenericDiv" style="float:left;padding-right:1mm" colspan="2">
<xsl:if test="position()=1">
              (3)Other </xsl:if></span><br />(<xsl:number value="position()" format="A"/>)
<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="Desc"/>
	</xsl:call-template>
	</td>
      
<td class="styTableCell" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="BookValueAmt"/>
		</xsl:call-template></td>
         
         <td class="styTableCell" colspan="2" style="width:52mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;border-color:black;text-align:center;float:none;">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="MethodValuationCd"/>
	</xsl:call-template></td>
 </tr>
</xsl:for-each>
    </xsl:if>
 <xsl:if test="count($FormData/OtherSecuritiesGrp) &lt; 1 or             (($Print = $Separated) and (count($FormData/OtherSecuritiesGrp) &gt; 9)) ">
          <tr>
            <td class="styTableCell" colspan="2" style="width:117mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black;float:none;">
             <xsl:if test="position()=1">
              Other </xsl:if><br/><xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$FormData/OtherSecuritiesGrp"/>
              </xsl:call-template>
 		<span style="width:3px"/>
           </td>
            <td class="styTableCell" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
              <span style="width:3px"/>
           </td>
		 <td class="styTableCell" colspan="2" style="width:52mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;border-color:black;float:none;">
              <span style="width:3px"/>
           </td>
		
		</tr>
        </xsl:if>
        <xsl:if test="count($FormData/OtherSecuritiesGrp) &lt; 2 or ((count($FormData/OtherSecuritiesGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherSecuritiesGrp) &lt; 3 or ((count($FormData/OtherSecuritiesGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherSecuritiesGrp) &lt; 4 or ((count($FormData/OtherSecuritiesGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherSecuritiesGrp) &lt; 5 or ((count($FormData/OtherSecuritiesGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherSecuritiesGrp) &lt; 6 or ((count($FormData/OtherSecuritiesGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherSecuritiesGrp) &lt; 7 or ((count($FormData/OtherSecuritiesGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherSecuritiesGrp) &lt; 8 or ((count($FormData/OtherSecuritiesGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherSecuritiesGrp) &lt; 9 or ((count($FormData/OtherSecuritiesGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIITableFillerRow"/>
								</xsl:if>
 <tr>
     <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:82mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;float:left;border-color:black;float:none;">
<span class="styItalicText" style="float:left;font-size:6pt"><span style="font-weight:bold;font-style:normal;">Total.</span>
 (Column (b) must equal Form 990, Part X, col. (B) line 12.)</span>
  
  <span style="padding-left:0mm">
  <img src="{$ImagePath}/990SchD_Bullet_Sm.gif" alt="Small Bullet"/></span></td> 
<td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/TotalBookValueSecuritiesAmt"/>
		</xsl:call-template></td> 
  
	
		<td class="styIRS990ScheduleDShadingCell" style="width:70;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;"/></tr>

    
 
        
      </table>
    </div>
    <!-- Set Initial Height of Above Table -->
    <xsl:call-template name="SetInitialDynamicTableHeight">
      <xsl:with-param name="TargetNode" select="$FormData/OtherSecuritiesGrp"/>
      <xsl:with-param name="containerHeight" select="13"/>
      <xsl:with-param name="containerID" select=" 'IOSctn' "/>
    </xsl:call-template>
    <!-- End Set Initial Height of Above Table -->
    <!-- END Part VII Table -->    
 
<!-- End Part VII -->

<!-- Part VIII -->
<div class="styBB" style="width:187mm;float:none;border-top-width:1px;">
      <div class="styPartName" style="float:left;width:15mm;">Part VIII</div>
       <div class="styPartDesc" style="width:172mm;height:auto;">Investments&#151;Program Related.  
       <span style="font-size: 8pt;font-weight:normal">
          Complete if the organization answered 'Yes' to Form 990, Part IV, line 11c.
        </span>
        <span style="font-size: 8pt;font-weight:normal">
          See Form 990, Part X, line 13.
        </span>
      </div>
     <div class="styGenericDiv" style="float:right">
         <!-- button display logic -->
          <xsl:call-template name="SetDynamicTableToggleButton">
            <xsl:with-param name="TargetNode" select="$FormData/InvstProgramRelatedOrgGrp"/>
            <xsl:with-param name="containerHeight" select="10"/>
            <xsl:with-param name="containerID" select=" 'IPRctn' "/>
          </xsl:call-template>
         <!-- end button display logic -->
      </div>
    </div>
    <!-- END Part VIII Title -->


    <!-- BEGIN Part VIIITable -->
    <div class="styTableContainerNBB" id="IPRctn" style="height:auto;">
      <!-- print logic -->
        <xsl:call-template name="SetInitialState"/>
      <!-- end -->
      <table class="styTable" style="font-size:7pt;float:none;clear:both;" cellspacing="0">
        <thead class="styTableThead">
          <tr>
            <th class="styTableCellHeader" scope="col" colspan="2" style="width:117mm;font-weight:normal;border-color:black;vertical-align:top;text-align:center;"><span style="font-weight:bold">(a)</span> Description of investment</th>
            <th class="styTableCellHeader" scope="col" style="font-weight:normal; text-    				align:center;border-right-width:1px;border-color:black;vertical-align:top;"><span style="font-weight:bold">(b)</span> Book value</th>
          <th class="styTableCellHeader" scope="col" colspan="2" style="width:52mm;font-weight:normal;border-right-width:0px;border-color:black;vertical-align:top;text-align:center;"><span style="font-weight:bold">(c)</span> Method of valuation:<br />Cost or end-of-year market value</th>
         </tr>
 </thead>
        <tfoot/>
        <tbody>
  
   <xsl:if test="($Print != $Separated) or count($FormData/InvstProgramRelatedOrgGrp) &lt;= 9">
          <xsl:for-each select="$FormData/InvstProgramRelatedOrgGrp">
     
        <tr>
         <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:117mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black;float:none;">(<xsl:number value="position()" format="1"/>)
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="Desc"/>
	</xsl:call-template></td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="BookValueAmt"/>
		</xsl:call-template></td>
         <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:52mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;border-color:black;text-align:center;float:none;">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="MethodValuationCd"/>
	</xsl:call-template></td>
		 </tr>
  </xsl:for-each>
    </xsl:if>
    
 <xsl:if test="count($FormData/InvstProgramRelatedOrgGrp) &lt; 1 or             (($Print = $Separated) and (count($FormData/InvstProgramRelatedOrgGrp) &gt;9)) ">
          <tr>
            <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:117mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black;float:none;">
             <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$FormData/InvstProgramRelatedOrgGrp"/>
              </xsl:call-template>
 		<span style="width:3px"/>
           </td>
   <td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
              <span style="width:3px"/>
           </td>
		 <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:52mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;border-color:black;float:none;">
              <span style="width:3px"/>
           </td>
		
		</tr>
        </xsl:if>
 <xsl:if test="count($FormData/InvstProgramRelatedOrgGrp) &lt; 2 or ((count($FormData/InvstProgramRelatedOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/InvstProgramRelatedOrgGrp) &lt; 3 or ((count($FormData/InvstProgramRelatedOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/InvstProgramRelatedOrgGrp) &lt; 4 or ((count($FormData/InvstProgramRelatedOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/InvstProgramRelatedOrgGrp) &lt; 5 or ((count($FormData/InvstProgramRelatedOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/InvstProgramRelatedOrgGrp) &lt; 6 or ((count($FormData/InvstProgramRelatedOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/InvstProgramRelatedOrgGrp) &lt; 7 or ((count($FormData/InvstProgramRelatedOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/InvstProgramRelatedOrgGrp) &lt; 8 or ((count($FormData/InvstProgramRelatedOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>  
								<xsl:if test="count($FormData/InvstProgramRelatedOrgGrp) &lt; 9 or ((count($FormData/InvstProgramRelatedOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartVIIITableFillerRow"/>
								</xsl:if>              
        <tr>
		
 <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:117mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;float:left;border-color:black;float:none;">

<span class="styItalicText" style="float:left;font-size:6pt"><span style="font-weight:bold;font-style:normal">Total.</span>
 (Column (b) must equal Form 990, Part X, col.(B) line 13.)</span>
  
  <span style="padding-left:mm">
  <img src="{$ImagePath}/990SchD_Bullet_Sm.gif" alt="Small Bullet"/></span></td> 
<td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/TotalBookValueProgramRltdAmt"/>
		</xsl:call-template></td> 
  
	
		<td class="styIRS990ScheduleDShadingCell" style="width:52;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-color:black;float:none;"></td></tr>

   
        </tbody>
      </table>
    </div>
    <!-- Set Initial Height of Above Table -->
    <xsl:call-template name="SetInitialDynamicTableHeight">
      <xsl:with-param name="TargetNode" select="$FormData/InvstProgramRelatedOrgGrp"/>
      <xsl:with-param name="containerHeight" select="10"/>
      <xsl:with-param name="containerID" select=" 'IPRctn' "/>
    </xsl:call-template>
    <!-- End Set Initial Height of Above Table -->
    <!-- END Part VIII Table -->    
  

<!-- End Part VIII -->

<!-- Part IX -->
<div class="styBB" style="width:187mm;float:none;border-top:solid 1px;">
      <div class="styPartName" style="float:left;width:14mm;">Part IX</div>
       <div class="styPartDesc" style="width:172mm;height:auto;">Other Assets.  
       <span style="font-size: 7pt;font-weight:normal">
       Complete if the organization answered 'Yes' to Form 990, Part IV, line 11d.</span>
        <span style="font-size: 7pt;font-weight:normal">
          See Form 990, Part X, line 15.
        </span>
      </div>
     <div class="styGenericDiv" style="float:right">
         <!-- button display logic -->
          <xsl:call-template name="SetDynamicTableToggleButton">
            <xsl:with-param name="TargetNode" select="$FormData/OtherAssetsOrgGrp"/>
            <xsl:with-param name="containerHeight" select="10"/>
            <xsl:with-param name="containerID" select=" 'OActn' "/>
          </xsl:call-template>
         <!-- end button display logic -->
      </div>
<div class="styTableContainerNBB" id="OActn" style="height:auto;">
      <!-- print logic -->
        <xsl:call-template name="SetInitialState"/>
      <!-- end -->
      <table class="styTable" style="font-size:7pt;float:none;clear:both;" cellspacing="0">
        <thead class="styTableThead">
          <tr>
            <th class="styTableCellHeader" scope="col" colspan="4" style="width:149mm;font-weight:normal;border-top-width:1px;border-color:black"><span style="font-weight:bold">(a)</span> Description</th>
            <th class="styTableCellHeader" scope="col" style="font-weight:normal; text-        align:center;border-top-width:1px;border-right-width:0px;border-color:black"><span style="font-weight:bold">(b)</span> Book value</th>
        </tr>
 </thead>
        <tfoot/>
     <tbody>
  <xsl:if test="($Print != $Separated) or count($FormData/OtherAssetsOrgGrp) &lt;= 9">
          <xsl:for-each select="$FormData/OtherAssetsOrgGrp">
        <tr>
         <td class="styIRS990ScheduleDTableCellLB" colspan="4" style="width:149mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black;float:none;">(<xsl:number value="position()" format="1"/>)
		<xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Desc"/>
              </xsl:call-template></td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:38mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right:0px;border-color:black;float:none;">
		<xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="BookValueAmt"/>
              </xsl:call-template></td>
    </tr>
  </xsl:for-each>
 </xsl:if>


  <xsl:if test="count($FormData/OtherAssetsOrgGrp) &lt; 1 or             (($Print = $Separated) and (count($FormData/OtherAssetsOrgGrp) &gt;9)) ">
<tr>
         <td class="styIRS990ScheduleDTableCellLB" colspan="4" style="width:149mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black;float:none;">
		<xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$FormData/OtherAssetsOrgGrp"/>
              </xsl:call-template>
 		<span style="width:3px"/>
</td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:38mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right:0px;border-color:black;float:none;">
		<span style="width:3px"/>
	</td>
   </tr>
</xsl:if>
<xsl:if test="count($FormData/OtherAssetsOrgGrp) &lt; 2 or ((count($FormData/OtherAssetsOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherAssetsOrgGrp) &lt; 3 or ((count($FormData/OtherAssetsOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherAssetsOrgGrp) &lt; 4 or ((count($FormData/OtherAssetsOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherAssetsOrgGrp) &lt; 5 or ((count($FormData/OtherAssetsOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherAssetsOrgGrp) &lt; 6 or ((count($FormData/OtherAssetsOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherAssetsOrgGrp) &lt; 7 or ((count($FormData/OtherAssetsOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherAssetsOrgGrp) &lt; 8 or ((count($FormData/OtherAssetsOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if> 
								<xsl:if test="count($FormData/OtherAssetsOrgGrp) &lt; 9 or ((count($FormData/OtherAssetsOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartIXTableFillerRow"/>
								</xsl:if>               
  <tr>
  <td class="styIRS990ScheduleDTableCellLB" colspan="4" style="width:149mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
<span class="styItalicText" style="float:left;"><span style="font-weight:bold;font-style:normal">Total.</span> (Column (b) must equal Form 990, Part X, col.(B)  line 15.)</span>
    <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>

  <span style="padding-left:2mm">
  <img src="{$ImagePath}/990SchD_Bullet_Sm.gif" alt="Small Bullet"/></span></td> 
<td class="styIRS990ScheduleDTableCellLB" style="width:38mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right:0px;border-color:black;float:none;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/TotalBookValueOtherAssetsAmt"/>
		</xsl:call-template></td> 
	</tr>


  </tbody>
 </table>
    </div>
    <!-- Set Initial Height of Above Table -->
    <xsl:call-template name="SetInitialDynamicTableHeight">
      <xsl:with-param name="TargetNode" select="$FormData/OtherAssetsOrgGrp"/>
      <xsl:with-param name="containerHeight" select="10"/>
      <xsl:with-param name="containerID" select=" 'OActn' "/>
    </xsl:call-template>
    <!-- End Set Initial Height of Above Table -->
    <!-- END Part ??X Table -->    
</div>
<!-- End Part IX -->
  
    <!-- BEGIN Part X Title   -->
    <div class="styBB" style="width:187mm;clear:both;border-top-width:1px">
      <div class="styPartName" style="float:left;width:14mm;padding-left:1mm">Part X</div>
      <div class="styPartDesc" style="float:left;width:164mm;height:auto;">
        Other Liabilities.  
        <span style="font-size: 8pt;font-weight:normal">
        Complete if the organization answered 'Yes' to Form 990, Part IV, line 11e or 11f.</span>
         <span style="font-size: 8pt;font-weight:normal">
          See Form 990, Part X, line 25.
        </span>
     </div>
      <div class="styGenericDiv" style="float:right">
         <!-- button display logic -->
          <xsl:call-template name="SetDynamicTableToggleButton">
            <xsl:with-param name="TargetNode" select="$FormData/OtherLiabilitiesOrgGrp"/>
            <xsl:with-param name="containerHeight" select="12"/>
            <xsl:with-param name="containerID" select=" 'ROActn' "/>
          </xsl:call-template>
         <!-- end button display logic -->
      </div>
    </div>
    <!-- END Part X Title -->


    <!-- BEGIN Part X Table -->
    <div class="styTableContainerNBB" id="ROActn" style="height:auto;">
      <!-- print logic -->
        <xsl:call-template name="SetInitialState"/>
      <!-- end -->
      <table class="styTable" style="font-size:7pt;float:none;clear:both;" cellspacing="0">
        <thead class="styTableThead">
          <tr>
            <th class="styTableCellHeader" scope="col" colspan="2" style="width:80mm;font-weight:normal;border-color:black"><span class="styLNLeftNumBoxSD" style="text-align:left;padding-left:0mm;font-weight:normal">1.</span><span style="font-weight:bold">(a)</span> Description of liability</th>
            <th class="styTableCellHeader" scope="col" style="font-weight:normal; text-align:center;border-right-width:1px;border-color:black;vertical-align:top;"><span style="font-weight:bold">(b)</span> Book value</th>
            <th class="styIRS990ScheduleDShadingCell" scope="col" colspan="2" style="border-left:1px;border-color:black"/>
         </tr>
</thead>
        <tfoot/>
        <tbody>
      
        <tr>
         <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:80mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
		
	<span class="styGenericDiv" style="float:left" colspan="2">Federal income taxes</span></td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxLiabilityAmt"/>
		</xsl:call-template></td>
      <td class="styIRS990ScheduleDShadingCell" style="width:72;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-color:black;float:none;"/>
		 </tr>
  
  <xsl:if test="($Print != $Separated) or count($FormData/OtherLiabilitiesOrgGrp) &lt;= 9">
     <xsl:for-each select="$FormData/OtherLiabilitiesOrgGrp">
	  <tr>
	 <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:80mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black;float:none;"><!--(<xsl:number value="position()" format="1"/>)TEGE wants Federal Income Taxes hardcoded with a (1) in front and then increment the remaining liabilities starting with (2). IBM nor I could make it work. TEGE changed it to be a (1) in front of the Federal Income Taxes and no number in front of the other liabilities - RLJ 2010-->
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="Desc"/>
	</xsl:call-template></td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="Amt"/>
		</xsl:call-template></td>
      <td class="styIRS990ScheduleDShadingCell" style="width:72;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-color:black;float:none;">
</td>
 </tr>
 </xsl:for-each>
    </xsl:if> 


 <xsl:if test="count($FormData/OtherLiabilitiesOrgGrp) &lt; 1 or             (($Print = $Separated) and (count($FormData/OtherLiabilitiesOrgGrp) &gt;9)) ">
 <tr>
     	 <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:80mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black;float:none;">
		<xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$FormData/OtherAssetsOrgGrp"/>
              </xsl:call-template>
 		<span style="width:3px"/>
</td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
		<span style="width:3px"/>
</td>
      <td class="styIRS990ScheduleDShadingCell" style="width:72;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-color:black;float:none;"><span style="width:3px"/>
</td>
 </tr>
     </xsl:if> 
      <xsl:if test="count($FormData/OtherLiabilitiesOrgGrp) &lt; 2 or ((count($FormData/OtherLiabilitiesOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherLiabilitiesOrgGrp) &lt; 3 or ((count($FormData/OtherLiabilitiesOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherLiabilitiesOrgGrp) &lt; 4 or ((count($FormData/OtherLiabilitiesOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherLiabilitiesOrgGrp) &lt; 5 or ((count($FormData/OtherLiabilitiesOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherLiabilitiesOrgGrp) &lt; 6 or ((count($FormData/OtherLiabilitiesOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherLiabilitiesOrgGrp) &lt; 7 or ((count($FormData/OtherLiabilitiesOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherLiabilitiesOrgGrp) &lt; 8 or ((count($FormData/OtherLiabilitiesOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/OtherLiabilitiesOrgGrp) &lt; 9 or ((count($FormData/OtherLiabilitiesOrgGrp) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchDPartXTableFillerRow"/>
								</xsl:if>
 <tr>		
 <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:80mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;float:left;border-color:black;float:none;">

<span class="styItalicText" style="float:left;font-size:6pt"><span style="font-weight:bold;font-style:normal">Total.</span>
 (Column (b) must equal Form 990, Part X, col.(B) line 25.)</span>
  
  <span style="padding-left:1mm">
  <img src="{$ImagePath}/990SchD_Bullet_Sm.gif" alt="Small Bullet"/></span></td> 
<td class="styIRS990ScheduleDTableCellLB" style="width:35mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-color:black;float:none;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/TotalLiabilityAmt"/>
		</xsl:call-template></td> 
  
	
		<td class="styIRS990ScheduleDShadingCell" style="width:72;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-color:black;float:none;"/></tr>

  <td class="styIRS990ScheduleDTableCellLB" colspan="6" style="width:180mm;height:4.5mm;vertical-align:bottom;border-left:0px;text-align:left;border-right:0px;border-top-width:1px;border-style:solid;border-color:black;float:none;">
<b>2.</b> Liability for uncertain tax positions  In Part XIII, provide the text of the footnote to the organization's financial statements that reports the organization's liability for uncertain tax positions under FIN 48 (ASC 740). Check here if the text of the footnote has been provided in Part XIII
<!-- For 508 Jaws I had to move the span to after the closing label which shortened the spot where the box ends-->
<span class="styIRS990ScheduleD_DotSpacing">..................................................

<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FootnoteTextInd"/>
								<xsl:with-param name="BackupName">IRS990ScheduleDFootnoteInPartXIII</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/FootnoteTextInd"/>
								<xsl:with-param name="BackupName">IRS990ScheduleDFootnoteInPartXIII</xsl:with-param>
							</xsl:call-template>
                </label>
                </span>
</td>
    
        </tbody>
      </table>
    </div>
    <!-- Set Initial Height of Above Table -->
    <xsl:call-template name="SetInitialDynamicTableHeight">
      <xsl:with-param name="TargetNode" select="$FormData/OtherLiabilitiesOrgGrp"/>
      <xsl:with-param name="containerHeight" select="12"/>
      <xsl:with-param name="containerID" select=" 'ROActn' "/>
    </xsl:call-template>
    <!-- End Set Initial Height of Above Table -->
    <!-- END Part ??X Table -->    
 

    <!-- Footer -->
    <div style="width:187mm;float:none;clear:both;padding-top:2.5mm;" class="pageEnd">
     
      <div class="styGenericDiv" style="float:right;"> <span class="styBoldText">Schedule D (Form 990) 2013</span></div>
    </div>
      
   <br/>

  
    <!-- header -->
    <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
      <div style="width:90mm;" class="styGenericDiv">Schedule D (Form 990) 2013</div>
      <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
      <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">4</span></div>
    </div>
    
    <!-- Begin Parts XI  Removed per UWR58215 and renumber the others-->
    <!--  <table class="styTable" style="font-size:7pt;width:187mm;border-bottom-width:1px" cellspacing="0">
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
       Other (Describe in Part XIV.)
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
       Total adjustments (net). Add lines 4 through 8
        <span class="styIRS990ScheduleD_DotSpacing">.........................</span></td>
  <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">9</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/TotalAdjustments" />
            </xsl:call-template></td>
   </tr>
<tr>
      <td class="styLNLeftNumBox" style="padding-left: 1mm;height:4.5mm;">10</td>
      <td class="styLNDesc" style="width:145mm;border-right-width:0;padding-top:1mm;padding-left:0mm">
      Excess or (deficit) for the year per audited financial statements. Combine lines 3 and 9
        <span class="styIRS990ScheduleD_DotSpacing">.......</span></td>
  <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0">10</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ExcessOrDeficitPerFS" />
            </xsl:call-template></td>
   </tr>
</tbody>
  </table>
    -->
    <!-- Begin Parts XI -->
      <table class="styTable" style="font-size:7pt;width:187mm;border-top-width:1px" cellspacing="0">
        <thead>
          <tr scope="col">
            <th class="styBB" colspan="6" scope="col" style="padding-bottom:0;padding-top:0;border-top-width:1px;float:none;">
               <span class="styPartName" style="width:15mm;">Part XI</span>
              <span class="styPartDesc" style="width:171mm;height:auto;">
                Reconciliation of Revenue per Audited Financial Statements With Revenue per Return 
                <span style="font-size: 8pt;font-weight:normal"> 
                Complete if the organization answered 'Yes' to Form 990, Part IV, line 12a.     
                </span>    
                </span>                 
            </th>
          </tr>
        </thead>
        <tfoot/>
        <tbody valign="top">
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;float:none;">1</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;float:none;" colspan="3">Total revenue, gains, and other support per audited financial statements
              <!--Dotted Line-->
             <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.......</span>
            </td>
            
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0;float:none;">1</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotalRevEtcAuditedFinclStmtAmt"/></xsl:call-template></td>
          </tr>    
         
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;float:none;">2</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;float:none;" colspan="3">Amounts included on line 1 but not on Form 990, Part VIII, line 12:</td>
            <td class="styShadingCell" style="width:8mm;height:4.5mm;border-left-width:1px;float:none;"><span class="styTableCellPad"/></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;"><span class="styTableCellPad"/></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">a</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;float:none;">Net unrealized gains on investments
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..........</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:8mm;float:none;">2a</td>
            <td class="styLNAmountBox" style="height:4.5mm;float:none;">
            <xsl:call-template name="PopulateAmount">
            	<xsl:with-param name="TargetNode" select="$FormData/NetUnrealizedGainsInvstAmt"/>
		</xsl:call-template>
		<span style="width:1px;"/></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0;float:none;">
            <span style="width:1px;"/></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;">
            <span class="styTableCellPad"/></td>
          </tr>    
         
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">b</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;float:none;">Donated services and use of facilities
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.........</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:8mm;float:none;">2b</td>
            <td class="styLNAmountBox" style="height:4.5mm;float:none;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/DonatedServicesAndUseFcltsAmt"/>
		</xsl:call-template>
		<span style="width:1px;"/></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0;float:none;">
            <span style="width:1px;"/></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;">
            <span class="styTableCellPad"/></td>
          </tr>    
          
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">c</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;float:none;">Recoveries of prior year grants
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:8mm;float:none;">2c</td>
            <td class="styLNAmountBox" style="height:4.5mm;float:none;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/RecoveriesPriorYearGrantsAmt"/>
            </xsl:call-template>
            <span style="width:1px;">
			</span></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0;float:none;">
            <span style="width:1px;">
            </span></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;">
            <span class="styTableCellPad"/></td>
          </tr>    
        
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">d</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;float:none;">Other (Describe in Part XIII.) 
             <!--<span class="styBB" style="width:62mm;float:none;">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData/TotOthRevenueOnLnaButNotOnLn12"/>
              </xsl:call-template>
              </span> <br />-->
             <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">............</span>
		<!-- <span class="styBB" style="width:85mm;float:none;"></span>-->
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:8mm;float:none;">2d</td>
            <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;float:none;">
            <xsl:call-template name="PopulateAmount">
           	 <xsl:with-param name="TargetNode" select="$FormData/OtherRevenueAmt"/>	
	</xsl:call-template><span style="width:1px;"/></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0;float:none;">
            <span style="width:1px;"/></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;">
            <span class="styTableCellPad"/></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">e</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;float:none;" colspan="3">Add lines <span class="styBoldText">2a</span> through <span class="styBoldText">2d</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">
              .....................</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0;float:none;">2e</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/RevenueNotReportedAmt"/></xsl:call-template></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;float:none;">3</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;float:none;" colspan="3">Subtract line <span class="styBoldText">2e</span> from line <span class="styBoldText">1</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.....................</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0;float:none;">3</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/RevenueSubtotalAmt"/></xsl:call-template></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;float:none;">4</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;float:none;" colspan="3">Amounts included on Form 990, Part VIII, line 12, but not on line <span class="styBoldText">1</span>:</td>
            <td class="styShadingCell" style="width:8mm;height:4.5mm;border-left-width:1px;float:none;"><span class="styTableCellPad"/></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;"><span class="styTableCellPad"/></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">a</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;float:none;">Investment expenses not included on  Form 990, Part  VIII, line 7b
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:8mm;float:none;">4a</td>
            <td class="styLNAmountBox" style="height:4.5mm;float:none;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/InvestmentExpensesNotIncldAmt"/>
		</xsl:call-template><span style="width:1px;">
		</span></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0;float:none;"><span style="width:1px;"/></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;"><span class="styTableCellPad"/></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">b</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;float:none;">Other (Describe in Part XIII.)  
            <!--<span class="styBB" style="width:62mm;float:none;">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData/OtherRevenues"/>
              </xsl:call-template>
              </span> <br />
              <span class="styBB" style="width:85mm;float:none;"></span>-->
            <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
		</td>
            
            <td class="styLNRightNumBox" style="height:4.5mm;width:8mm;float:none;">4b</td>
            <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;float:none;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherRevenuesNotIncludedAmt"/>
		</xsl:call-template><span style="width:1px;"/></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0;float:none;">
            <span style="width:1px;"/></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;">
            <span class="styTableCellPad"/></td>
          </tr>    
          
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">c</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;float:none;" colspan="3">Add lines <span class="styBoldText">4a</span> and <span class="styBoldText">4b</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.......................</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0;float:none;">4c</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;float:none;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/RevenueNotReportedFinclStmtAmt"/>
</xsl:call-template></td>
          </tr>    
          
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;border: solid black 1px; border-top-width:0; border-left-width:0;border-right-width:0px;float:none;">5</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;border: solid black 1px; border-top-width:0; border-left-width:0;border-right-width:0px;float:none;" colspan="3">
Total revenue. Add lines <span class="styBoldText">3</span> and <span class="styBoldText">4c. </span> (This must equal Form 990, Part I, line 12.)
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">......</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0;border-bottom-width:1px;float:none;">5</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;float:none;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/TotalRevenuePerForm990Amt"/>
</xsl:call-template></td>
          </tr>    
        </tbody>
      </table>
      
<!-- =======================begin Part XII =============================================-->
 <!-- =============================================================================-->   
 
 <!-- Begin Parts XII -->
      <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
        <thead>
          <tr scope="col">
            <th class="styBB" colspan="6" scope="col" style="padding-bottom:0;padding-top:0;float:none;">
               <span class="styPartName" style="width:15mm;">Part XII</span>
              <span class="styPartDesc" style="width:171mm;height:auto;">
                Reconciliation of Expenses per Audited Financial Statements With Expenses per Return. 
                <span style="font-size: 8pt;font-weight:normal"> 
                Complete if the organization answered 'Yes' to Form 990, Part IV, line 12a.     
                </span>       
              </span>                      
            </th>
          </tr>
        </thead>
        <tfoot/>
        <tbody valign="top">
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;float:none;">1</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;float:none;" colspan="3">Total expenses and losses per audited financial statements
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0;float:none;">1</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotExpnsEtcAuditedFinclStmtAmt"/></xsl:call-template></td>
          </tr>    
          
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;float:none;">2</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;float:none;" colspan="3">Amounts included on line 1 but not on Form 990, Part IX, line 25:</td>
            <td class="styShadingCell" style="width:8mm;height:4.5mm;border-left-width:1px;float:none;"><span class="styTableCellPad"/></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;"><span class="styTableCellPad"/></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">a</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;float:none;">Donated services and use of facilities
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..........</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;float:none;">2a</td>
            <td class="styLNAmountBox" style="height:4.5mm;float:none;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/DonatedServicesUseFcltsAmt"/>
</xsl:call-template><span style="width:1px;"/></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0;float:none;"><span style="width:1px;"/></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;"><span class="styTableCellPad"/></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">b</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;float:none;">Prior year adjustments
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..............</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;float:none;">2b</td>
            <td class="styLNAmountBox" style="height:4.5mm;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/PriorYearAdjustmentsAmt"/></xsl:call-template><span style="width:1px;"/></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0;float:none;"><span style="width:1px;"/></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;"><span class="styTableCellPad"/></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">c</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;float:none;">Other losses
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">................</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;float:none;">2c</td>
            <td class="styLNAmountBox" style="height:4.5mm;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LossesReportedAmt"/></xsl:call-template><span style="width:1px;"/></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0;float:none;"><span style="width:1px;"/></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;"><span class="styTableCellPad"/></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">d</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;float:none;">Other (Describe in Part XIII.) 
             <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">............</span>
	</td>
            <td class="styLNRightNumBox" style="height:4.5mm;float:none;">2d</td>
            <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;float:none;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherExpensesIncludedAmt"/>
</xsl:call-template><span style="width:1px;"/></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0;float:none;"><span style="width:1px;"/></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;"><span class="styTableCellPad"/></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">e</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;float:none;" colspan="3">Add lines <span class="styBoldText">2a</span> through <span class="styBoldText">2d</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......................</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0;float:none;">2e</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;float:none;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/ExpensesNotReportedAmt"/></xsl:call-template></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;float:none;">3</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;float:none;" colspan="3">Subtract line <span class="styBoldText">2e</span> from line <span class="styBoldText">1</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.....................</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0;float:none;">3</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;float:none;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ExpensesSubtotalAmt"/>
	</xsl:call-template></td>
          </tr>    
         
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;float:none;">4</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;float:none;" colspan="3">Amounts included on Form 990, Part IX, line 25, but not on line <span class="styBoldText">1:</span></td>
            <td class="styShadingCell" style="width:8mm;height:4.5mm;border-left-width:1px;float:none;"><span class="styTableCellPad"/></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;"><span class="styTableCellPad"/></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">a</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;float:none;">Investment expenses not included on Form 990, Part VIII, line 7b
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;float:none;">4a</td>
            <td class="styLNAmountBox" style="height:4.5mm;float:none;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/InvestmentExpensesNotIncld2Amt"/>
	</xsl:call-template><span style="width:1px;"/></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0;float:none;"><span style="width:1px;"/></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;"><span class="styTableCellPad"/></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">b</td>
            <td class="styLNDesc" style="width:100mm;height:4.5mm;float:none;">Other (Describe in Part XIII.) 
            <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............</span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;float:none;">4b</td>
            <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;float:none;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherExpensesNotIncludedAmt"/>
	</xsl:call-template>
	<span style="width:1px;"/></td>
            <td class="styShadingCellRB" style="width:8mm;height:4.5mm; border-right:0;float:none;"><span style="width:1px;"/></td>
            <td class="styLNAmountBoxNBB" style="height:4.5mm; border-left-width: 1px;float:none;"><span class="styTableCellPad"/></td>
          </tr>    
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;float:none;">c</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;float:none;" colspan="3">Add lines <span class="styBoldText">4a</span> and <span class="styBoldText">4b</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......................</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0;float:none;">4c</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;float:none;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ExpensesNotRptFinclStmtAmt"/>
		</xsl:call-template></td>
          </tr>    
          
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;border: solid black 1px; border-top-width:0; border-left-width:0;border-right-width:0px;float:none;">5</td>
            <td class="styLNDesc" style="width:145mm;height:4.5mm;border: solid black 1px; border-top-width:0; border-left-width:0;border-right-width:0px;float:none;" colspan="3">Total expenses. Add lines <span class="styBoldText">3</span> and <span class="styBoldText">4c.</span>
         (This must equal Form 990, Part I, line 18.)     <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">......</span>
            </td>
            <td class="styLNRightNumBox" style="width:8mm;height:4.5mm; border-right:0;float:none;">5</td>
            <td class="styLNAmountBox" style="height:4.5mm; border-left-width: 1px;float:none;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/TotalExpensesPerForm990Amt"/>
		</xsl:call-template></td>
          </tr>    
        </tbody>
      </table>
<!-- =========================================================================-->
 <!-- Part XIII  Supplemental Information -->
 
  <div class="styGenericDiv" style="width: 187mm;float:none;">
  <div class="styPartName" style="width:18mm;">Part XIII</div>
  <div class="styPartDesc" style="width:169mm;font-weight:bold; ">
Supplemental Information
</div>

<div class="styIRS990ScheduleDLNDescBB" style="width:187mm;height:auto; border-top-width:1px;padding-top:1mm;border-bottom-width:1px;border-right-width:0px;padding-left:2mm">
Provide the descriptions required for Part II, lines 3, 5, and 9; Part III, lines 1a and 4; Part lV, lines 1b and 2b;<br/> Part V, line 4; Part X, line 2; Part XI, lines 2d and 4b; and Part XII, lines 2d and 4b. Also complete this part to provide any additional information.<br/>
</div>
<span style="float:right"> 
  
 
          <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$FormData/SupplementalInformationDetail"/>              
              <xsl:with-param name="containerHeight" select="20"/>
              <xsl:with-param name="containerID" select="'SUPctn'"/>
          </xsl:call-template>  </span>   
        </div>
 

<div class="styTableContainer" style="width: 187mm; border-bottom-width: 2px" id="SUPctn">
<xsl:call-template name="SetInitialState"/>
<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
  <thead class="styTableThead">
    
    <tr class="styDepTblHdr">
          
          <!--<th class="styDepTblCell" scope="col" style="width:50mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Identifier</th>-->
          <th class="styDepTblCell" scope="col" style="width:50mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Return Reference</th>  
          <th class="styDepTblCell" scope="col" style="width:87mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Explanation</th>                
             

    </tr>
  </thead>
  <tfoot/>
  <tbody valign="top">
   <xsl:if test="($Print!=$Separated) or (($Print=$Separated) and (count($FormData/SupplementalInformationDetail) &lt;20))">
      <xsl:for-each select="$FormData/SupplementalInformationDetail">
          <tr>
    <!--  <td class="styTableCell" style="text-align:left;border-right-width: 1px; width:50mm; ">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="IdentifierTxt"/>
            </xsl:call-template>
      </td>-->
      <td class="styTableCell" style="text-align:left; border-right-width: 1px; width: 50mm;float:none;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
              </xsl:call-template>
           </td>      
      <td class="styTableCell" style="text-align:left; border-right-width: 0px; width: 137mm;float:none;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ExplanationTxt"/>
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
            <xsl:with-param name="TargetNode" select="$FormData/SupplementalInformationDetail"/>
            <xsl:with-param name="containerHeight" select="20"/>
            <xsl:with-param name="containerID" select=" 'SUPctn' "/>
 </xsl:call-template>

 
   <!-- Footer -->
    <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageEnd">
   
      <div class="styGenericDiv" style="float:right;"> <span class="styBoldText">Schedule D (Form 990) 2013</span></div>
    </div>
      
   <br/>
 
 
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
          <xsl:with-param name="TargetNode" select="$FormData"/>
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
  </table> 

<br/>
<!-- SRD For Part VII -->
 <xsl:if test="($Print = $Separated) and count($FormData/OtherSecuritiesGrp) &gt;= 8">
          
 <span class="styRepeatingDataTitle">Form 990, Schedule D, Part VII - Investments Other Securities</span>
 <table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;">
    <thead class="styTableThead">
    <tr class="styDepTblHdr">
            <th class="styTableCellHeader" scope="col" colspan="2" style="width:76mm;font-weight:normal;text-align:center;vertical-align:top;"><span style="font-weight:bold">(a)</span> Description of security or cateory<br/>(including name of security)</th>
            <th class="styTableCellHeader" scope="col" style="font-weight:normal; text-align:center;border-right-width:1px;vertical-align:top;"><span style="font-weight:bold">(b)</span>Book value</th>
          <th class="styTableCellHeader" scope="col" colspan="2" style="width:76mm;font-weight:normal;border-right-width:0px;text-align:center;vertical-align:top;"><span style="font-weight:bold">(c)</span> Method of valuation<br/>Cost or end-of-year market value</th>
 </tr>
 </thead>
    <tfoot/>
       
<xsl:for-each select="$FormData/OtherSecuritiesGrp">
<tr>
		        <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
               <xsl:otherwise>styDepTblRow2Cell </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>   
          <td class="styTableCell" colspan="2" style="width:82mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black;float:none;">
<span class="styGenericDiv" style="float:left;padding-right:1mm" colspan="2">
<xsl:if test="position()=1">
              (3)Other </xsl:if></span><br/>(<xsl:number value="position()" format="A"/>)
	
	<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="Desc"/>
	</xsl:call-template>
	</td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:38mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;float:none;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="BookValueAmt"/>
		</xsl:call-template></td>
         
         <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:72mm;height:4.5mm;vertical-align:bottom;text-align:center;padding-right:0.75mm;border-left:0px;border-right-width:0px;float:none;">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="MethodValuationCd"/>
	</xsl:call-template></td>
 </tr> 
</xsl:for-each>
</table>   </xsl:if>
<br/>

 <!-- SRD For Part VIII -->
   <xsl:if test="($Print = $Separated) and count($FormData/InvstProgramRelatedOrgGrp) &gt;= 8">
      <span class="styRepeatingDataTitle">Form 990, Schedule D, Part VIII - Investments Program Related</span>
 <table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;">
    <thead class="styTableThead">
    <tr class="styDepTblHdr">

<th class="styTableCellHeader" scope="col" colspan="2" style="width:76mm;font-weight:normal;text-align:center;vertical-align:top;">
<span style="font-weight:bold">(a)</span> Description of investment type</th>
 
  <th class="styTableCellHeader" scope="col" style="font-weight:normal; text-align:center;border-right-width:1px;vertical-align:top;">
	<span style="font-weight:bold">(b)</span> Book value</th>
   
   <th class="styTableCellHeader" scope="col" colspan="2" style="width:76mm;font-weight:normal;border-right-width:0px;text-align:center;vertical-align:top;">
<span style="font-weight:bold">(c)</span> Method of valuation<br/>Cost or end-of-year market value</th>
   </tr>
 </thead>
<tfoot/>
 
  <xsl:for-each select="$FormData/InvstProgramRelatedOrgGrp">
      <tr>
              <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
               <xsl:otherwise>styDepTblRow2Cell </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>   
 <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:82mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black;float:none;">(<xsl:number value="position()" format="1"/>)
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="Desc"/>
	</xsl:call-template></td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:38mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;float:none;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="BookValueAmt"/>
		</xsl:call-template></td>
         <td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:72mm;height:4.5mm;vertical-align:bottom;text-align:center;padding-right:0.75mm;border-left:0px;border-right-width:0px;float:none;">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="MethodValuationCd"/>
	</xsl:call-template></td>
		 </tr>
  </xsl:for-each>
    </table></xsl:if>
 
 <br/>

 <!-- SRD for Part IX -->
     <xsl:if test="($Print = $Separated) and count($FormData/OtherAssetsOrgGrp) &gt;= 8">
      <span class="styRepeatingDataTitle">Form 990, Schedule D, Part IX, - Other Assets</span>
 <table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;">
    <thead class="styTableThead">
   
    <tr class="styDepTblHdr">
    <th class="styTableCellHeader" scope="col" colspan="4" style="width:149mm;font-weight:normal;border-top-width:1px;text-align:center;vertical-align:top;"><span style="font-weight:bold">(a)</span> Description</th>
            <th class="styTableCellHeader" scope="col" style="font-weight:normal; text-align:center;vertical-align:top;border-top-width:1px;border-right-width:0px"><span style="font-weight:bold">(b)</span> Book value</th>
        </tr>
 </thead>
        <tfoot/>
    <xsl:for-each select="$FormData/OtherAssetsOrgGrp">
        <tr>
               <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
               <xsl:otherwise>styDepTblRow2Cell </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>   
<td class="styIRS990ScheduleDTableCellLB" colspan="4" style="width:149mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;border-color:black;float:none;">(<xsl:number value="position()" format="1"/>)
		<xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Desc"/>
              </xsl:call-template></td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:38mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right:0px;float:none;">
		<xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="BookValueAmt"/>
              </xsl:call-template></td>
    </tr>
  </xsl:for-each>
  </table></xsl:if>
<br/>
<!-- SRD for Part X -->
 <xsl:if test="($Print = $Separated) and count($FormData/OtherLiabilitiesOrgGrp) &gt;= 8">
 <span class="styRepeatingDataTitle">Form 990, Schedule D, Part X, - Other Liabilities</span>
 <table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;">
    <thead class="styTableThead">
     <tr class="styDepTblHdr">
				
<th class="styTableCellHeader" scope="col" colspan="2" style="width:76mm;font-weight:normal;"><span class="styLNLeftNumBoxSD" style="text-align:left;padding-left:0mm;font-weight:normal">1.</span><span style="font-weight:bold">(a)</span> Description of Liability</th>
            <th class="styTableCellHeader" scope="col" style="font-weight:normal; border-right-width:1px;text-align:center;vertical-align:top;"><span style="font-weight:bold">(b)</span> Book Value</th>
            <th class="styIRS990ScheduleDShadingCell" scope="col" colspan="2" style="border-left:1px;"/>
      </tr> 
      </thead>
        <tfoot/>
   <xsl:for-each select="$FormData/OtherLiabilitiesOrgGrp">

  <tr>
	       <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
               <xsl:otherwise>styDepTblRow2Cell </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>   
<td class="styIRS990ScheduleDTableCellLB" colspan="2" style="width:72mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;float:none;">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="Desc"/>
	</xsl:call-template></td>
      <td class="styIRS990ScheduleDTableCellLB" style="width:38mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;float:none;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="Amt"/>
		</xsl:call-template></td>
      <td class="styIRS990ScheduleDShadingCell" style="width:72;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;float:none;">
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
    <td class="styTableCellText" colspan="2" style="width:82mm;border-color:black;float:none;">
				<br/>
				
				<span style="width:4px;"/>
			</td>
    <td class="styTableCell" style="width:27mm;text-align:left;border-color:black;float:none;">
    <span style="width:4px"/></td>
   
    <td class="styTableCell" colspan="2" style="width:70mm;border-right-width:0px;border-color:black;float:none;">
    <span style="width:4px;"/>
    </td>
  </tr>
</xsl:template>

<xsl:template name="IRS990SchDPartVIIITableFillerRow">
  <tr>
   <td class="styTableCellText" colspan="2" style="width:82mm;border-color:black;float:none;">
				<br/>
				
				<span style="width:4px;"/>
			</td>
    <td class="styTableCell" style="width:27mm;text-align:left;border-color:black;float:none;">
    <span style="width:4px"/></td>
   
    <td class="styTableCell" colspan="2" style="width:70mm;border-right-width:0px;border-color:black;float:none;">
    <span style="width:4px;"/>
    </td>
  </tr>
</xsl:template>
<xsl:template name="IRS990SchDPartIXTableFillerRow">
  <tr>
   <td class="styTableCellText" colspan="4" style="border-color:black;float:none;">
				<br/>
				
				<span style="width:4px;"/>
			</td>
  
   
    <td class="styTableCell" colspan="2" style="border-right-width:0px;border-color:black;float:none;">
    <span style="width:4px;"/>
    </td>
  </tr>
</xsl:template>

<xsl:template name="IRS990SchDPartXTableFillerRow">
 <tr>
   <td class="styTableCellText" colspan="2" style="border-color:black;float:none;">
				<br/>
				<span style="width:4px;"/>
	</td>
	
    <td class="styTableCell" style="border-color:black;float:none;">
    <span style="width:4px"/>
    </td>
   
    <td class="styIRS990ScheduleDShadingCell" colspan="2" style="border-right-width:0px;border-color:black;float:none;">
    <span style="width:4px;"/>
    </td>
  </tr>
</xsl:template>

</xsl:stylesheet>