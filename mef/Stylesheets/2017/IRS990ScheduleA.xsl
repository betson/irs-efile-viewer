<?xml version="1.0" encoding="UTF-8"?>

<!-- Last modified on 5/6/2015 by Robert Jones per UWR 123023 IE11 upgrade fixes. -->
<!-- Last modified on 6/3/2015 by Robert Jones per IBM Defect 43127 IE11 upgrade fixes. -->
<!-- Last modified on 6/3/2015 by Robert Jones per IBM Defect 43128 IE11 upgrade fixes. -->
<!-- Last modified on 6/3/2015 by Robert Jones per IBM Defect 43422 IE11 upgrade fixes.NPF -->
<!-- Last modified on 6/3/2015 by Robert Jones per SOI KISAM IM02150548 Line 16b Incorrect element name ThirtyThrPctSuprtTestsPY509Ind.  Changed to correct element name ThirtyThrPctSuprtTestsPY170Ind -->
<!-- Last modified on 8/7/2015 by Robert Jones per UWR 161462 PDF 3/26/2015  -->
<!-- Last modified on 8/7/2015 by Robert Jones per UWR 161465 PDF 4/13/2015  -->
<!-- added backupname params throughout form per 8/20/2015 email from Mitchell Buyck -->
<!-- Last Modified on 10/14/15 per IBM Defect 44923 Part V Sec B line 1e data on next line - Robert L Jones-->
<!-- Last Modified on 10/14/15 per IBM Defect 44924 Part VI overlapping  - Robert L Jones-->
<!-- Last Modified on 10/22/15 per PDF REVIEW - Robert L Jones-->
<!-- Last Modified on 11/24/15 per IBM Defect 44924 Part VI overlapping  - Robert L Jones-->
<!-- Last Modified on 02/11/16 per Kisam IM02466377  - Robert L Jones-->
<!-- Last Modified on 3/25/2016 per Kisam#IM02518925 sep print not populating at 11g Table col iii -->
<!-- Update per UWR 177702 Tax Year by Robert L Jones -->
<!-- Last Modified on 6/21/16 per IBM Defect 46032 Part V, Line 10 wrapping - Robert L Jones-->
<!-- Update per UWR 185907  11/08/2016 - 11a-g becomes 12a-g, New elements for line 9 - by Robert L Jones -->
<!-- Last Modified on 1/11/17 per IBM Defect 47648 Rejected Page 3 Footer rendering on next page by itself. NPF no less space can be created- Robert L Jones-->
<!-- Last Modified on 1/11/17 per IBM Defect 47647 Part I Text-align:right Total data- Robert L Jones-->
 <!-- Updated per UWR 195015 5/19/17 by Robert L Jones -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS990ScheduleAStyle.xsl"/>
  
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <!--xsl:param name="RtnSummaryData" select="/TEGEOrganizationReturn/ReturnSummary"/-->
  <xsl:param name="FormData" select="$RtnDoc/IRS990ScheduleA"/>
  <xsl:param name="FormDataVIA" select="$RtnDoc/IRS990ScheduleA/IRS990ScheduleAPartVIA"/>
  <xsl:param name="FormDataVIB" select="$RtnDoc/IRS990ScheduleA/IRS990ScheduleAPartVIB"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/GeneralExplanationAttachment"/>
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>

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
  <meta name="Description" content="IRS Form 990 or 990EZ Schedule A"/>

   <xsl:call-template name="GlobalStylesForm"/>

  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  <xsl:call-template name="InitJS"/>
  <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS990ScheduleAStyle"/>
      <xsl:call-template name="AddOnStyle"/>
</xsl:if>
  </style>
</head>

<body class="styBodyClass">
<xsl:call-template name="DocumentHeader"/>
<!-- BEGIN FORM HEADER -->
<div class="IRS990ScheduleA_LineContainer">
  <!-- Form Name -->
  <div class="IRS990ScheduleA_FormNumBlock" style="padding-top:5px;height:22.5mm;">
     <span style="font-size:11pt;font-weight:bold;font-familiy:'Arial Narrow';">SCHEDULE A</span>
     <br/>
     <span style="font-size:10pt;font-weight:bold;font-family:'Arial Narrow';">(Form 990 or 990EZ)</span>
     <br/>
       <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$FormData"/>      
       </xsl:call-template>
     <br/>
     <span style=" font-family:Arial Narrow; ">Department of the Treasury</span>
     <br/>
     <span style=" font-family:Arial Narrow; ">Internal Revenue Service</span>
  </div>

  <!-- Form Title Box -->
  <div class="IRS990ScheduleA_FormTitleBlock" style="height:22.5mm;">
    <!-- Form Title -->
    <div style="padding-top: 2mm">
    <span class="styMainTitle">Public Charity Status and Public Support</span>
    </div>
    <!-- Form Subtitle -->
    <span style="font-weight:bold;">
      Complete if the organization is a section 501(c)(3) organization or a section
      <span style="font-weight:bold">
      4947(a)(1) nonexempt charitable trust.
   <br></br>
    <span style="font-weight:bold;text-align:center;">
     <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/> Attach to Form 990 or Form 990-EZ. </span><br></br>
   <!--  <span style="font-weight:bold;text-align:left;"> <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/> See separate instructions.</span><br/>-->
      
     <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/> Go to 
     <span style="text-align:center;"/> <a href="http://www.irs.gov/form990" title="Link to IRS.gov">
                <i>www.irs.gov/Form990</i></a> for the latest information.
     </span>
   
   
    </span>
  </div>
  
    <div class="IRS990ScheduleA_FormYearBlock" style="height:22.5mm;">
    <div class="IRS990ScheduleA_OMB">OMB No. 1545-0047</div> 
    <div class="styTY" style="height:11.5mm;text-align:center;width:30mm;">
      20<span class="styTYColor">17</span>
    </div>
    <div style="width:30mm; background-color: black; color: white; font-size: 7.5pt;font-weight: bold;text-align:center;">Open to Public<br/>Inspection</div>
  </div>

  <!-- Tax Year Box -->
 <!-- <div class="IRS990ScheduleA_FormYearBlock"> -->
    <!-- OMB No. -->
<!--    <div class="IRS990ScheduleA_OMB">OMB No. 1545-0047</div> -->
    <!-- Tax Year -->
 <!--   <div class="IRS990ScheduleA_TaxYear">
       <span>20<span class="styTYColor">10</span></span>
    </div>
  </div> -->
</div>
<!-- Begin Name and Identifying Number Section-->      
<div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
  <div class="styFNBox" style="width:134mm;height:9mm;">
    <b> Name of the organization</b><br/>
    <div style="font-family:verdana;font-size:6pt;height:auto">
     <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
    </xsl:call-template>
    <br/>
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
    </xsl:call-template>
   </div> 
  </div>
  
  <div class="styGenericDiv" style="width:52mm;height:auto;padding-left:1mm;">
    <span class="styBoldText">Employer identification number</span>
    <br/><br/>
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">EIN</xsl:with-param>
    </xsl:call-template>
  </div>
</div>
<!-- End Name and Identifying Number Section-->      

<!-- Part I header -->
<div class="styBB" style="width: 187mm">
   <div class="styPartName" style="height:auto;">Part I</div>
  <div class="styPartDesc" style="height:auto;">Reason for Public Charity Status
       <span class="styNormalText">(All organizations must complete this part.) See instructions.</span>
   </div>
<!--  <div class="styBB" style="height: 1mm; width: 187mm"></div> -->
</div>


<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineDesc" style="width:188mm;border-right-width:0px;">
   The organization is not a private foundation because it is: (For lines 1 through 12, check only one box.)
    </div>
</div>

<!-- line 1 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">1</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchAChurchIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/ChurchInd"/>
         <xsl:with-param name="BackupName">IRS990SchAChurchInd</xsl:with-param>
      </xsl:call-template>                                                                     
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/ChurchInd"/>
         <xsl:with-param name="BackupName">IRS990SchAChurchInd</xsl:with-param>
      </xsl:call-template>
       A church, convention of churches, or association of churches described in
       <span style="font-weight:bold;">
         section 170(b)(1)(A)(i).
      </span>
      </label>
  </div>
</div>
<!-- line 2 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">2</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input  class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchASchoolIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/SchoolInd"/>
         <xsl:with-param name="BackupName">IRS990SchASchoolInd</xsl:with-param>
      </xsl:call-template>
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/SchoolInd"/>
        <xsl:with-param name="BackupName">IRS990SchASchoolInd</xsl:with-param>
      </xsl:call-template>
      A school described in 
      <span style="font-weight:bold;">
         section 170(b)(1)(A)(ii).
      </span>
      (Attach Schedule E (Form 990 or 990-EZ).)
    </label> 
  </div>
</div>
<!-- line 3 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">3</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input  class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchAHospitalIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/HospitalInd"/>
        <xsl:with-param name="BackupName">IRS990SchAHospitalInd</xsl:with-param>
      </xsl:call-template>
    </input>
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/HospitalInd"/>
        <xsl:with-param name="BackupName">IRS990SchAHospitalInd</xsl:with-param>
      </xsl:call-template>
      A hospital or a cooperative hospital service organization described in 
      <span style="font-weight:bold;">
         section 170(b)(1)(A)(iii).
      </span>
      </label> 
  </div>
</div>
<!-- line 4 -->

<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">4</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input  class="IRS990ScheduleA_Checkbox" type="checkbox"  alt="IRS990SchAMedicalResearchOrganizationIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/MedicalResearchOrganizationInd"/>
        <xsl:with-param name="BackupName">IRS990SchAMedicalResearchOrganizationInd</xsl:with-param>
      </xsl:call-template>
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/MedicalResearchOrganizationInd"/>
         <xsl:with-param name="BackupName">IRS990SchAMedicalResearchOrganizationInd</xsl:with-param>
      </xsl:call-template>
     A medical research organization operated in conjunction with a hospital described in
      <span style="font-weight:bold;">
         section 170(b)(1)(A)(iii).</span>
     Enter the hospital's name, city, and state:
     <span class="styFixedUnderline" style="width:140mm;float:none;padding-left:2mm;padding-top:0;padding-bottom:0;"/>
      </label> 
     </div>
</div>

<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
     <!--If the print parameter is separated, but there are at most 2 data elements-->
    <xsl:choose>
      <xsl:when test="($Print != $Separated) or count($FormData/HospitalNameAndAddressGrp) &lt;= 2">
        <xsl:for-each select="$FormData/HospitalNameAndAddressGrp">
        
         <div style="font-family:verdana;font-size:7pt;padding-left:16mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="SupportedOrganizationName/BusinessNameLine1Txt"/>
          </xsl:call-template>,
          </div>
          
          <div style="font-family:verdana;font-size:7pt;padding-left:16mm;">
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="SupportedOrganizationName/BusinessNameLine2Txt"/>
           </xsl:call-template>,          
          </div>
          <xsl:call-template name="PopulateText">
           <xsl:with-param name="TargetNode" select="CityNm"/>
          </xsl:call-template>,
         <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
          </xsl:call-template>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="CountryCd"/>
          </xsl:call-template>
          </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="PopulateAdditionalDataTableMessage">
          <xsl:with-param name="TargetNode" select="$FormData/HospitalNameAndAddressGrp"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  
<br></br>


 <!-- line 5 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">5</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input  class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchACollegeOrganizationIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/CollegeOrganizationInd"/>
         <xsl:with-param name="BackupName">IRS990SchACollegeOrganizationInd</xsl:with-param>
      </xsl:call-template>
    </input>
  </div>
  <div class="IRS990ScheduleA_LineDescV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/CollegeOrganizationInd"/>
        <xsl:with-param name="BackupName">IRS990SchACollegeOrganizationInd</xsl:with-param>
      </xsl:call-template>
      An organization operated for the benefit of a college or university owned or operated by a governmental unit described in<b> section 170(b)(1)(A)(iv).</b> (Complete Part II.)
    </label> 
  </div>
</div>

  
<!-- line 6 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">6</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input  class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchAGovernmentalUnitIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/GovernmentalUnitInd"/>
        <xsl:with-param name="BackupName">IRS990SchAGovernmentalUnitInd</xsl:with-param>
      </xsl:call-template>
    </input>
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/GovernmentalUnitInd"/>
        <xsl:with-param name="BackupName">IRS990SchAGovernmentalUnitInd</xsl:with-param>
      </xsl:call-template>
       A federal, state, or local government or governmental unit described in
       <span style="font-weight:bold;"> section 170(b)(1)(A)(v).</span>
    </label>
  </div>
</div>
<!-- line 7 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">7</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input  class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchAPublicOrganization170IndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/PublicOrganization170Ind"/>
        <xsl:with-param name="BackupName">IRS990SchAPublicOrganization170Ind</xsl:with-param>
      </xsl:call-template>
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label> 
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PublicOrganization170Ind"/>
         <xsl:with-param name="BackupName">IRS990SchAPublicOrganization170Ind</xsl:with-param>
      </xsl:call-template>
  An organization that normally receives a substantial part of its support from a governmental unit or from the general public described in <b>section 170(b)(1)(A)(vi).</b> (Complete Part II.)
    </label>
  </div>
</div>

<!-- line 8 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">8</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input  class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchACommunityTrustIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/CommunityTrustInd"/>
         <xsl:with-param name="BackupName">IRS990SchACommunityTrustInd</xsl:with-param>
      </xsl:call-template>
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label> 
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/CommunityTrustInd"/>
         <xsl:with-param name="BackupName">IRS990SchACommunityTrustInd</xsl:with-param>
      </xsl:call-template>
     A community trust described in <span style="font-weight:bold;">section 170(b)(1)(A)(vi)</span>. (Complete Part II.)
    </label>
  </div>
</div>


<!-- line 9 -->

<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">9</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input  class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchAAgriculturalResearchOrgIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/AgriculturalResearchOrgInd"/>
        <xsl:with-param name="BackupName">IRS990SchAAgriculturalResearchOrgInd</xsl:with-param>
      </xsl:call-template>
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/AgriculturalResearchOrgInd"/>
         <xsl:with-param name="BackupName">IRS990SchAAgriculturalResearchOrgInd</xsl:with-param>
      </xsl:call-template>
    An agricultural research organization described in
      <span style="font-weight:bold;">
         170(b)(1)(A)(ix) </span>
     operated in conjunction with a land-grant college or university or a non-land grant college of agriculture. See instructions. Enter the name, city, and state of the college or university:
     <span class="styFixedUnderline" style="width:170mm;float:none;padding-left:2mm;padding-top:0;padding-bottom:0;"/>
      </label> 
     </div>
</div>


<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
     <!--If the print parameter is separated, but there are at most 2 data elements-->
    <xsl:choose>
      <xsl:when test="($Print != $Separated) or count($FormData/AgriculturalNameAndAddressGrp) &lt;= 2">
        <xsl:for-each select="$FormData/AgriculturalNameAndAddressGrp">
        
         <div style="font-family:verdana;font-size:7pt;padding-left:16mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="SupportedOrganizationName/BusinessNameLine1Txt"/>
          </xsl:call-template>,
          </div>
          
          <div style="font-family:verdana;font-size:7pt;padding-left:16mm;">
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="SupportedOrganizationName/BusinessNameLine2Txt"/>
           </xsl:call-template>,          
          </div>
          <xsl:call-template name="PopulateText">
           <xsl:with-param name="TargetNode" select="CityNm"/>
          </xsl:call-template>,
         <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
          </xsl:call-template>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="CountryCd"/>
          </xsl:call-template>
          </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="PopulateAdditionalDataTableMessage">
          <xsl:with-param name="TargetNode" select="$FormData/AgriculturalNameAndAddressGrp"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  
<br></br>
<!-- line 10 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">10</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input  class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchAPubliclySupportedOrg509a2IndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/PubliclySupportedOrg509a2Ind"/>
         <xsl:with-param name="BackupName">IRS990SchAPubliclySupportedOrg509a2Ind</xsl:with-param>
      </xsl:call-template>
    </input>
  </div>  
  <div class="IRS990ScheduleA_LineDescIX">
    <label> 
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PubliclySupportedOrg509a2Ind"/>
         <xsl:with-param name="BackupName">IRS990SchAPubliclySupportedOrg509a2Ind</xsl:with-param>
      </xsl:call-template>
      An organization that normally receives: (1) more than 33<span style="font-size:5pt;">1/3</span>% of its support from contributions, membership fees, and gross  receipts from activities related to its exempt functions—subject to certain exceptions, and (2) no more than 33<span style="font-size:5pt;">1/3</span>% of  its support from gross investment income and unrelated business taxable income (less section 511 tax) from businesses  acquired by the organization after June 30, 1975.  See <span style="font-weight:bold;"> section 509(a)(2).</span> (Complete Part III.)
    </label>
  </div>
</div>

<!-- line 10 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">11</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input  class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchATestPublicSafetyIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/TestPublicSafetyInd"/>
         <xsl:with-param name="BackupName">IRS990SchATestPublicSafetyInd</xsl:with-param>
      </xsl:call-template>
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label> 
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/TestPublicSafetyInd"/>
         <xsl:with-param name="BackupName">IRS990SchATestPublicSafetyInd</xsl:with-param>
      </xsl:call-template>
      An organization  organized and operated exclusively to test for public safety. See <span style="font-weight:bold;">section 509(a)(4).</span> 
      </label>
  </div>
</div>
<!-- line 12 Changed per UWR 185907 - 2016-->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">12</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input  class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchASupportingOrganization509a3IndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/SupportingOrganization509a3Ind"/>
         <xsl:with-param name="BackupName">IRS990SchASupportingOrganization509a3Ind</xsl:with-param>
      </xsl:call-template>
    </input>
  </div>  
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/SupportingOrganization509a3Ind"/>
        <xsl:with-param name="BackupName">IRS990SchASupportingOrganization509a3Ind</xsl:with-param>
      </xsl:call-template>
      An organization organized and operated exclusively for the benefit of, to perform the functions of, or to carry out the purposes of one or more publicly supported organizations described in <b>section 509(a)(1)</b> or <b>section 509(a)(2).</b> See <span style="font-weight:bold;">section 509(a)(3).</span> Check the box in lines 12a through 12d that describes the type of supporting organization and complete lines 12e, 12f, and 12g.
    </label> 
  </div>
</div>

     
      <!-- line 12 ends-->
<!-- line 12a -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">a</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchASupportingOrgType1IndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/SupportingOrgType1Ind"/>
        <xsl:with-param name="BackupName">IRS990SchASupportingOrgType1Ind</xsl:with-param>
      </xsl:call-template>
    </input>
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/SupportingOrgType1Ind"/>
        <xsl:with-param name="BackupName">IRS990SchASupportingOrgType1Ind</xsl:with-param>
      </xsl:call-template>
     <b>Type I.</b> A supporting organization operated, supervised, or
controlled by its supported organization(s), typically by giving the
supported organization(s) the power to regularly appoint or elect a
majority of the directors or trustees of the supporting organization.
<b>You must complete Part IV, Sections A and B.</b>
    </label> 
  </div>
</div>

<!-- line 12b -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">b</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchASupportingOrgType2IndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/SupportingOrgType2Ind"/>
        <xsl:with-param name="BackupName">IRS990SchASupportingOrgType2Ind</xsl:with-param>
      </xsl:call-template>
    </input>
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/SupportingOrgType2Ind"/>
        <xsl:with-param name="BackupName">IRS990SchASupportingOrgType2Ind</xsl:with-param>
      </xsl:call-template>
    <b> Type II.</b> A supporting organization supervised or controlled in
connection with its supported organization(s), by having control or
management of the supporting organization vested in the same
persons that control or manage the supported organization(s).<b> You
must complete Part IV, Sections A and C.</b>
    </label> 
  </div>
</div>

<!-- line 12c -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">c</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchASupportingOrgType3FuncIntIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/SupportingOrgType3FuncIntInd"/>
        <xsl:with-param name="BackupName">IRS990SchASupportingOrgType3FuncIntInd</xsl:with-param>
      </xsl:call-template>
    </input>
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/SupportingOrgType3FuncIntInd"/>
        <xsl:with-param name="BackupName">IRS990SchASupportingOrgType3FuncIntInd</xsl:with-param>
      </xsl:call-template>
    <b>Type III functionally integrated.</b> A supporting organization
operated in connection with, and functionally integrated with, its
supported organization(s) (see instructions).<b> You must complete
Part IV, Sections A, D, and E.</b>
    </label> 
  </div>
</div>

<!-- line 12d -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">d</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchASupportingOrgType3NonFuncIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/SupportingOrgType3NonFuncInd"/>
        <xsl:with-param name="BackupName">IRS990SchASupportingOrgType3NonFuncInd</xsl:with-param>
      </xsl:call-template>
    </input>
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/SupportingOrgType3NonFuncInd"/>
        <xsl:with-param name="BackupName">IRS990SchASupportingOrgType3NonFuncInd</xsl:with-param>
      </xsl:call-template>
    <b>Type III non-functionally integrated.</b> A supporting organization
operated in connection with its supported organization(s) that is not
functionally integrated. The organization generally must satisfy a
distribution requirement and an attentiveness requirement (see
instructions). <b>You must complete Part IV, Sections A and D, and Part V.</b>
    </label> 
  </div>
</div>
<!-- line 12e -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">e</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchAIRSWrittenDeterminationIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/IRSWrittenDeterminationInd"/>
        <xsl:with-param name="BackupName">IRS990SchAIRSWrittenDeterminationInd</xsl:with-param>
      </xsl:call-template>
    </input>
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/IRSWrittenDeterminationInd"/>
        <xsl:with-param name="BackupName">IRS990SchAIRSWrittenDeterminationInd</xsl:with-param>
      </xsl:call-template>
   Check this box if the organization received a written determination from the IRS that it is a Type I, Type II, Type III functionally integrated, or Type III non-functionally integrated supporting organization.
    </label> 
  </div>
</div>

<!-- line 12f -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">f</div>
  
  <div class="IRS990ScheduleA_LineDescIV" style="width:180mm;">
   Enter the number of supported organizations
   <!-- Dotted Line -->
              <span style="letter-spacing:2mm; font-size:7pt; margin-left:2mm;">...............................</span>
              <span class="styFixedUnderline" style="width:30mm;float:none;padding-left:2mm;padding-top:0;padding-bottom:0; font-size:7pt;">
               <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SupportedOrganizationsCnt"/>
      </xsl:call-template>
              
    </span>
    
  </div>
</div>

<!-- line 12g -->
  <div class="IRS990ScheduleA_LineIndex">g</div>
  <div class="IRS990ScheduleA_LineIndex">
  </div>
  <div class="IRS990ScheduleA_LineDescIV" style="float:left;display:table;display:inline;">
    Provide the following information about the supported organization(s). 
   </div>

               
    <!-- button display logic          
    <xsl:call-template name="SetDynamicTableToggleButton">
      <xsl:with-param name="TargetNode" select="$FormData/SupportedOrgInformationGrp"/>
      <xsl:with-param name="headerHeight" select="2"/>
      <xsl:with-param name="containerHeight" select="2"/>
      <xsl:with-param name="containerID" select="'p1Ln11TbCtnr'"/>                  
    </xsl:call-template>               
     end button display logic -->              
  
   
  <!--Part I line 12g table -->
  <div class="IRS990ScheduleAPart4_TableContainer" id="p1Ln11TbCtnr" style="display:table;"> 
    <!-- print logic -->
    <!--<xsl:call-template name="SetInitialState"/>-->
    <!-- end -->        
    <table cellspacing="0" style="font-size:7pt;display:table;">
 <!--     <tr>
        <th class="IRS990ScheduleA_GenericCell" style="width:187mm;height:4mm;border:1 black solid;border-left-width:0px;border-right-width:0px;border-top-						width:1px;text_align:center;font-weight:normal;" scope="col" colspan="6">
          Provide the following information about the supported organizations. (see page 7 of the instructions.)
        </th>
      </tr>
-->
 <div class="styBB" style="height: .auto; width: 188mm;display:table;display:inline;"/>
 
 
                      <!-- Column i -->
                    

      <tr>
        <th class="IRS990ScheduleA_GenericCell" style="width:60mm;vertical-align:top;text-align:center;font-weight:normal" scope="col" rowspan="2"><b>(i)</b> Name of supported organization</th>
      						<!-- Column ii -->
       <th class="IRS990ScheduleA_GenericCell" style="vertical-align:top;text-align:center;width:20mm;padding-bottom:17mm;border-right-width:1px;font-weight:normal" scope="col" rowspan="2"><b>(ii)</b> EIN</th>
									<!-- Column iii -->
      <th class="IRS990ScheduleA_GenericCell" style="vertical-align:top;text-align:center;width:32mm;border-right-width:1px;font-weight:normal" scope="col" rowspan="2"><b>(iii)</b> Type of organization (described on lines 1- 10 above (see instructions)) </th>
									<!-- Column iv -->
        <th class="IRS990ScheduleA_GenericCell" style="vertical-align:top;text-align:center;width:32mm;padding-bottom:1mm;border-right-width:1px;font-weight:normal" scope="col" colspan="2"><b>(iv)</b> Is the organization listed in your governing document?</th>
						<!-- Column v -->
  <!--     <th class="IRS990ScheduleA_GenericCell" style="vertical-align:top;text-align:center;width:24mm;padding-bottom:4mm;border-right-width:1px;" scope="col" colspan="2"><b>(v)</b><span class="styNormalText"> Did you notify the organization in col. <b>(i)</b> of your support? </span></th>-->
						<!-- Column vi -->
<!--	<th class="IRS990ScheduleA_GenericCell" style="vertical-align:top;text-align:center;width:24mm;padding-bottom:5mm;border-right-width:1px;" scope="col" colspan="2"><b>(vi)</b><span class="styNormalText">  Is the organization in col. <b>(i)</b> organized in the U.S.? </span></th>-->
                           <!-- Column v -->
        <th class="IRS990ScheduleA_GenericCell" style="vertical-align:top;text-align:center;width:32mm;padding-bottom:15mm;border-right-width:1px;font-weight:normal" scope="col" rowspan="2" colspan="1"><b>(v)</b> Amount of monetary support (see instructions)</th>
         <th class="IRS990ScheduleA_GenericCell" style="vertical-align:top;text-align:center;width:32mm;padding-bottom:15mm;border-right-width:0px;font-weight:normal" scope="col" rowspan="2" colspan="1"><b>(vi)</b> Amount of other support (see instructions)</th>


      </tr>
      	<tr>
			<th scope="col" class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;padding-left:5mm;">Yes</th>
 			<th scope="col" class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;padding-left:5mm;">No</th>
 			
	</tr>
      
        <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
        <!-- If the print parameter is separated, but there are fewer elements than the container height (2) -->
							<!-- Name of Supported Organization -->
      
<xsl:if test="($Print != $Separated) or count($FormData/SupportedOrgInformationGrp) &lt;= 2">

          <xsl:for-each select="$FormData/SupportedOrgInformationGrp">
        
            <tr>
            <td class="IRS990ScheduleA_GenericCell" style="font-family:verdana;font-size:6pt;vertical-align:top;">(<xsl:number value="position()" format="A"/>) 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="SupportedOrganizationName/BusinessNameLine1Txt"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="SupportedOrganizationName/BusinessNameLine2Txt"/>
                </xsl:call-template>
              </td>
             
              <!-- Employer Identification Number -->
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center;vertical-align:top;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="EIN"/>
                </xsl:call-template> 
              </td>  
              
                 <!-- Type of Organization -->           
            <td class="IRS990ScheduleA_GenericCell" style="text-align:center;vertical-align:top;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="OrganizationTypeCd"/>
                </xsl:call-template> 
              </td>      
  
              <!-- Supported Organization Listed? -->
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center;vertical-align:top;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="GoverningDocumentListedInd"/>
                </xsl:call-template> 
              </td>  
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center; vertical-align:top;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="GoverningDocumentListedInd"/>
                </xsl:call-template> 
              </td>      
    
            

								<!-- Amount of Support -->
              <td class="IRS990ScheduleA_GenericCell" style="text-align:right;border-right-width:1px;width:32mm;vertical-align:top;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="SupportAmt"/>
                </xsl:call-template> 
              </td> 
              <!--Other Support-Not used for 2014. Dummy select Name to make empty cell complete table. -->     
              <td class="IRS990ScheduleA_GenericCell" style="text-align:right;border-right-width:0px;width:32mm;vertical-align:top;">
               <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="OtherSupportAmt"/>
                </xsl:call-template>
              </td>      
            </tr>
          </xsl:for-each>
        </xsl:if>
        <!-- Display the first blank row if the data set is empty. If the number of data elements is more than 2 -->
        <!-- and the print option is separated, display a message in the first row directing the user to the -->
        <!-- additional data table -->
        <xsl:if test="count($FormData/SupportedOrgInformationGrp) &lt; 1 or             (($Print = $Separated) and (count($FormData/SupportedOrgInformationGrp) &gt; 2)) ">
          <tr>
            <td class="IRS990ScheduleA_GenericCell" style="border-right-width:0px;">
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$FormData/SupportedOrgInformationGrp"/>
              </xsl:call-template>
              <span style="width:3px"/>
            </td>
            <td class="IRS990ScheduleA_GenericCell">
                  <span style="width:3px"/>
            </td>
		<td class="IRS990ScheduleA_GenericCell">
                  <span style="width:3px"/>
            </td>
		<td class="IRS990ScheduleA_GenericCell">
                  <span style="width:3px"/>
            </td>
		<td class="IRS990ScheduleA_GenericCell">
                  <span style="width:3px"/>
            </td>
		<td class="IRS990ScheduleA_GenericCell">
                  <span style="width:3px"/>
            </td>
		<td class="IRS990ScheduleA_GenericCell">
                  <span style="width:3px"/>
            </td>
		

           
          </tr>
        </xsl:if>
        <!--Display the second blank row if there is only one row of data. If the number of data elements is -->
        <!-- more than 2 and the print option is separated, also display a blank second row -->
        <xsl:if test="count($FormData/SupportedOrgInformationGrp) &lt; 2 or             (($Print = $Separated) and (count($FormData/SupportedOrgInformationGrp) &gt; 2)) ">
          <tr>
            <td class="IRS990ScheduleA_GenericCell">
              <span style="width:3px"/>
           </td>
            <td class="IRS990ScheduleA_GenericCell">
              <span style="width:3px"/>
           </td>
		<td class="IRS990ScheduleA_GenericCell">
              <span style="width:3px"/>
           </td>
		<td class="IRS990ScheduleA_GenericCell">
              <span style="width:3px"/>
            </td>
		<td class="IRS990ScheduleA_GenericCell">
              <span style="width:3px"/>
           </td>
		<td class="IRS990ScheduleA_GenericCell">
                  <span style="width:3px"/>
            </td>
		 <td class="IRS990ScheduleA_GenericCell" style="border-right-width:0px;">
              <span style="width:3px" />
            </td>
		

            
          </tr>
        </xsl:if>
        <tr>
             	<td style="border:black 0 solid;border-bottom-width:0px;border-right-width:1px;" colspan="1">
             	<span class="styBoldText">Total </span>	
             	<!-- Per defect 42254 removed pen image <xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="TargetNode" select="$FormData/SupportedOrganizationsTotalCnt"/>
											</xsl:call-template>-->
										<div style="float:right;">
										 <xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SupportedOrganizationsTotalCnt"/>
											</xsl:call-template>	
											</div>			
             </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
     <!-- Monetary Support-->
       <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;width:32mm;font-size:7pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SupportSumAmt"/>
     	</xsl:call-template>
     	</td>
     	<!-- Other Support Total, No element so box should remain empty-->
     	<td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" />
     	 <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/OtherSupportSumAmt"/>
     	</xsl:call-template>
     	</td>
      </tr>
    </table>
    
     
  </div> 
    
 <!-- <xsl:call-template name="SetInitialDynamicTableHeight">
    <xsl:with-param name="TargetNode" select="$FormData/SupportedOrgInformationGrp"/>
    <xsl:with-param name="headerHeight" select="2"/>
    <xsl:with-param name="containerHeight" select="4"/>
    <xsl:with-param name="containerID" select="'p1Ln11TbCtnr'"/>
  </xsl:call-template>-->

	
	
	<div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						
	<div class="styBoldText" style="font-weight:7pt;width:90;float: left; clear: none;"> For Paperwork Reduction Act Notice, see the Instructions for <br></br>Form 990 or 990-EZ.  </div>
	<div style="width:40mm;float:left;font-size:7pt;padding-left:10mm">
      Cat. No. 11285F
    </div>
	<div style="width:57mm;text-align:right;float:right;font-size:7pt;font-weight:bold;">Schedule A (Form 990 or 990-EZ) 2017</div>
	 
	 
						
								</div>
					<div class="pageEnd"/>
	
		
	
				


<!-- footer line
<div class="pageEnd" style="width:187mm;">

  
    <div style="font-weight:bold;width:116mm;float:left;padding-left:0mm;font-size:7pt">
      For Paperwork Reduction Act Notice, see the Instructions for Form 990 or 990EZ.</div>
    <div style="width:20mm;float:left;text-align:center;font-size:6pt;padding-top:0mm">
      Cat. No. 11285F
    </div>
    <span style="width:50mm;text-align:right;float:left;font-family:'arial narrow';font-weight:bold;">Schedule A (Form 990 or 990-EZ) 2015</span>
  
</div>-->
<!--Page Footer
					<div class="pageEnd" style="width:187mm">
						<div style="font-weight:bold;width:116mm;float:left;padding-left:0mm;font-size:6pt">
            For Paperwork Reduction Act Notice, see the instructions for Form 990 or 990-EZ.
          </div>
						<div style="width:20mm;float:left;text-align:center;font-size:6pt;padding-top:.5mm">
            Cat. No. 50084S
          </div>
						<div style="width:50mm;text-align:right;float:left;">
							<span style="font-weight:bold;font-size:6pt">Schedule C (Form 990 or 990-EZ) 2012</span>
						</div>
					</div>-->

<p style="page-break-before: always"/>
<!-- Page Header -->
  <div class="styBB" style="width:187mm; padding-bottom:.5mm;">  
    <div style="float:left;">Schedule A (Form 990 or 990-EZ) 2017</div>
    <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>                    
  </div>  
<!-- END Page Header -->      




<!-- Part II header -->
<div class="styBB" style="width:187mm;">
  <div class="styPartName" style="width:16mm;height:auto;">Part II</div>
 <div class="styPartDesc" style="width:171mm;height:auto;">Support Schedule for Organizations Described in Sections 170(b)(1)(A)(iv), 170(b)(1)(A)(vi), and 170(b)(1)(A)(ix)<br/>
      <span class="styNormalText">(Complete only if you checked the box on line 5, 7, 8, or 9 of Part I or if the
organization failed to qualify under Part III. If the organization fails to
qualify under the tests listed below, please complete Part III.)</span>
  </div>
<!--  <div class="styGenericDiv"> -->
    <!-- button display logic -->
 <!--   <xsl:call-template name="SetDynamicTableToggleButton">
      <xsl:with-param name="TargetNode" select="$FormData/CompOfHghstPaidCntrctProfSer"/>                                                                               
      <xsl:with-param name="containerHeight" select="5"/>
       <xsl:with-param name="headerHeight" select="1"/>
      <xsl:with-param name="containerID" select=" 'HPCntrct' "/>
    </xsl:call-template>
    end button display logic -->
  <!-- </div> -->
</div>
 
  <!-- <div class="styPartDesc" style="width:162mm;font-weight:bold">Public Support</div> -->
  <span class="styPartDesc" style="width:171mm;font-weight:bold;text-align:left;height:auto;">Section A.  Public Support</span>


<!-- Part II  table  Public Support -->
<div class="IRS990ScheduleA_TableContainer" style="border-bottom-width:0px;">
   <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
     <tr>
      <th class="IRS990ScheduleA_GenericCell" style="width:60mm;font-weight:bold;border-bottom-width:0px;height:auto;" scope="col" colspan="2">
        <span style="float: left; clear:both"> Calendar year <span class="styBoldText">(or fiscal year beginning in) <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/></span>
        </span>
 <!--      <span style="float:right; clear: both"><img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/></span>  -->
      </th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(a) <span class="styNormalText"> 2013</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(b) <span class="styNormalText"> 2014</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(c) <span class="styNormalText"> 2015</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(d) <span class="styNormalText"> 2016</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(e) <span class="styNormalText"> 2017</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;border-right-width:0px;text_align:center;vertical-align:center;" scope="col">(f) <span class="styNormalText"> Total</span></th> 
     </tr>
      <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">1</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Gifts, grants, contributions, and membership fees received. (Do not include any "unusual grant.") <span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContriRcvd170Grp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContriRcvd170Grp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContriRcvd170Grp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContriRcvd170Grp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContriRcvd170Grp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>

      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContriRcvd170Grp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">2</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Tax revenues levied for the organization's benefit and either paid to or expended on its behalf<span class="IRS990ScheduleA_DotSpacing">....</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedOrgnztnlBnft170Grp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedOrgnztnlBnft170Grp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedOrgnztnlBnft170Grp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedOrgnztnlBnft170Grp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedOrgnztnlBnft170Grp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedOrgnztnlBnft170Grp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">3</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">The value of services or facilities furnished by a governmental unit to the organization without charge.<span class="IRS990ScheduleA_DotSpacing">.</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GovtFurnSrvcFcltsVl170Grp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GovtFurnSrvcFcltsVl170Grp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GovtFurnSrvcFcltsVl170Grp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GovtFurnSrvcFcltsVl170Grp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GovtFurnSrvcFcltsVl170Grp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GovtFurnSrvcFcltsVl170Grp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
        <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">4</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;"><b>Total.</b> Add lines 1 through 3<span class="IRS990ScheduleA_DotSpacing"/></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalCalendarYear170Grp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalCalendarYear170Grp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalCalendarYear170Grp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalCalendarYear170Grp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalCalendarYear170Grp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalCalendarYear170Grp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
     <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">5</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">The portion of total contributions by each person (other than a governmental unit or publicly supported organization) included
on line 1 that exceeds 2% of the amount shown on line 11, column (f)<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SubstantialContributorsTotAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" valign="top">6</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;"><b>Public support.</b> Subtract line 5 from line 4.<span class="IRS990ScheduleA_DotSpacing"/></td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
         <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/PublicSupportTotal170Amt"/>
        </xsl:call-template>
      </td>
    </tr>
  </table>
</div>

<span class="styPartDesc" style="width:162mm;font-weight:bold;height:auto;">Section B. Total Support</span>

<!-- Part II  table  Total Support -->
<div class="IRS990ScheduleA_TableContainer" style="border-bottom-width:0px;">
   <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
     <tr>
      <th class="IRS990ScheduleA_GenericCell" style="width:60mm;font-weight:bold;border-bottom-width:0px;" scope="col" colspan="2">
        <span style="float: left; clear: both"> Calendar year
        <span class="styNormalText;">(or fiscal year beginning in) <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/></span></span>
<!--       <span style="float:right; clear: both"><img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/></span>  -->
      </th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(a)<span class="styNormalText"> 2013</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(b)<span class="styNormalText"> 2014</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(c)<span class="styNormalText"> 2015</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(d)<span class="styNormalText"> 2016</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(e)<span class="styNormalText"> 2017</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;border-right-width:0px;text_align:center;vertical-align:center;" scope="col">(f)<span class="styNormalText"> Total</span></th>
    </tr>
        <tr>
      <td class="IRS990ScheduleA_IndexCell" style="border-bottom-width:0px;" valign="top">7</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Amounts from line 4<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalCalendarYear170Grp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalCalendarYear170Grp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalCalendarYear170Grp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalCalendarYear170Grp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalCalendarYear170Grp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>

      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalCalendarYear170Grp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
   <!-- Line 8 -->
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="border-bottom-width:0px;" valign="top">8</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Gross income from interest, dividends, payments received on securities loans, rents, royalties and income from similar sources<span class="IRS990ScheduleA_DotSpacing">...</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome170Grp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome170Grp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome170Grp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome170Grp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome170Grp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome170Grp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <!-- Line 9 -->
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="border-bottom-width:0px;" valign="top">9</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Net income from unrelated business activities, whether or not the business is regularly carried on<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/UnrelatedBusinessNetIncm170Grp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/UnrelatedBusinessNetIncm170Grp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/UnrelatedBusinessNetIncm170Grp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/UnrelatedBusinessNetIncm170Grp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/UnrelatedBusinessNetIncm170Grp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>

      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/UnrelatedBusinessNetIncm170Grp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <!-- Line 10 -->   
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="border-bottom-width:0px;" valign="top">10</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Other income. Do not include gain or loss from the sale of capital assets (Explain in Part VI.)<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/OtherIncome170Grp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/OtherIncome170Grp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/OtherIncome170Grp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/OtherIncome170Grp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/OtherIncome170Grp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/OtherIncome170Grp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <!-- Line 11 -->
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="border-bottom-width:0px;" valign="top">11</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;"><b>Total support.</b> Add lines 7 through 10<span class="IRS990ScheduleA_DotSpacing"></span></td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalSupportAmt"/>
      </xsl:call-template>
      </td>
    </tr>
 </table>
</div>

<!-- line 12 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:6mm;">12</div>
  <div class="IRS990ScheduleA_LineDescIVA">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsRltdActivitiesAmt"/>
      </xsl:call-template>
      Gross receipts from related activities, etc. (see instructions)
           <!-- Pen image -->
<!--      <xsl:call-template name="LinkToLeftoverDataTableInline">
            <xsl:with-param name="Desc">Line 22 - Description</xsl:with-param>
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome/Description"/>
          </xsl:call-template>
          <span style="width:5mm" /> -->
          <!-- Pushpin image -->
<!--      <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome"/>
          </xsl:call-template>  -->
        <span class="IRS990ScheduleA_DotSpacing">.................. </span>
     </label> 
    </div>
    
       <div class="styLNRightNumBox" style="height:4mm;">12</div>
    <div class="styLNAmountBox" style="height:4mm;width:34mm;">
    <xsl:call-template name="PopulateAmount">
    <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsRltdActivitiesAmt"/>
    </xsl:call-template>
    </div>
 
  </div>

<!-- line 13 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:6mm;">13</div>
  <div class="IRS990ScheduleA_LineDescIV" style="width:178mm;">
          <span style="font-weight:bold;">
         First five years.
      </span>
      If the Form 990 is for the organization's first, second, third, fourth, or fifth tax year as a section 501(c)(3) organization,
      check this box and <b>stop here</b>
      <!-- Dotted Line -->
              <span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; margin-left:2mm;">........................................</span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
        <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchAFirst5Years170IndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/First5Years170Ind"/>
        <xsl:with-param name="BackupName">IRS990SchAFirst5Years170Ind</xsl:with-param>
      </xsl:call-template>
    </input> 
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/First5Years170Ind"/>
        <xsl:with-param name="BackupName">IRS990SchAFirst5Years170Ind</xsl:with-param>
      </xsl:call-template>
      </label> 
      </div>
       </div>

<div class="styBB" style="width:187mm;border-top-width:1px;">
<span class="styPartDesc" style="width:162mm;font-weight:bold">Section C.  Computation of Public Support Percentage</span>
</div>

     <!--xsl:for-each select="$FormData/CompOfHghstPaidCntrctProfSer"-->
  
  <!-- line 14 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:6mm;">14</div>
  <div class="IRS990ScheduleA_LineDescIVA">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PublicSupportCY170Pct"/>
      </xsl:call-template>
      Public support percentage for 2017 (line 6, column (f) divided by line 11, column (f))
       <span class="IRS990ScheduleA_DotSpacing">.........  </span>
     </label> 
    </div>
    
       <div class="styLNRightNumBox" style="height:4mm;">14</div>
    <div class="styLNAmountBox" style="height:4mm;width:34mm;"><xsl:call-template name="PopulatePercent"><xsl:with-param name="TargetNode" select="$FormData/PublicSupportCY170Pct"/></xsl:call-template></div>
<!-- select="$FormData/PublicSupportPertcentage170"/></xsl:call-template>%</div> -->

 
  </div>
 
   <!-- line 15 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:6mm;">15</div>
  <div class="IRS990ScheduleA_LineDescIVA">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PublicSupportPY170Pct"/>
      </xsl:call-template>
      Public support percentage for 2016 Schedule A, Part II, line 14
       <span class="IRS990ScheduleA_DotSpacing">...............  </span>
     </label> 
   </div>
   
       <div class="styLNRightNumBox" style="height:4mm;">15</div>
    <div class="styLNAmountBox" style="height:4mm;width:34mm;"><xsl:call-template name="PopulatePercent"><xsl:with-param name="TargetNode" select="$FormData/PublicSupportPY170Pct"/></xsl:call-template></div>

</div>

<!-- line 16a -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:6mm;padding-right:9px;">16a</div>
  <div class="IRS990ScheduleA_LineDescIVB" style="height:auto;">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThrPctSuprtTestsCY170Ind"/>
        <xsl:with-param name="BackupName">IRS990SchAThirtyThrPctSuprtTestsCY170Ind</xsl:with-param>
      </xsl:call-template>
      <span style="font-weight:bold;">
         33 <span style="font-size:5pt;">1/3</span>% support test—2017.
      </span>
      If the organization did not check the box on line 13, and line 14 is 33 <span style="font-size:5pt;">1/3</span>% or more, check this box<br/>
      and <b>stop here.</b>  The organization qualifies as a publicly supported organization
      <span class="IRS990ScheduleA_DotSpacing">.......................  </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchAThirtyThrPctSuprtTestsCY170IndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThrPctSuprtTestsCY170Ind"/>
        <xsl:with-param name="BackupName">IRS990SchAThirtyThrPctSuprtTestsCY170Ind</xsl:with-param>
      </xsl:call-template>
    </input>  
   </div>
</div>

<!-- line 16b -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:7.4mm;padding-right:9px;">b</div>
 <div class="IRS990ScheduleA_LineDescIVB" style="height:auto;">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThrPctSuprtTestsPY170Ind"/>
        <xsl:with-param name="BackupName">IRS990SchAThirtyThrPctSuprtTestsPY170Ind</xsl:with-param>
      </xsl:call-template>
      <span style="font-weight:bold;">
         33 <span style="font-size:5pt;">1/3</span>% support test—2016.
      </span>
      If the organization did not check a box on line 13 or 16a, and line 15 is 33 <span style="font-size:5pt;">1/3</span>% or more, check this<br/>
      box and <b>stop here.</b>  The organization qualifies as a publicly supported organization
      <span class="IRS990ScheduleA_DotSpacing">.....................  </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchAThirtyThrPctSuprtTestsPY170IndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThrPctSuprtTestsPY170Ind"/>
         <xsl:with-param name="BackupName">IRS990SchAThirtyThrPctSuprtTestsPY170Ind</xsl:with-param>
      </xsl:call-template>
    </input>  
   </div>
</div>

<!-- line 17a -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:6mm;padding-right:9px;">17a</div>
  <div class="IRS990ScheduleA_LineDescIVB" style="height:auto;">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/TenPctFactsCrcmstncsTestCYInd"/>
         <xsl:with-param name="BackupName">IRS990SchATenPctFactsCrcmstncsTestCYInd</xsl:with-param>
      </xsl:call-template>
      <span style="font-weight:bold;">
         10%-facts-and-circumstances test—2017.
      </span>
      If the organization did not check a box on line 13, 16a, or 16b, and line 14<br/>
      is 10% or more, and if the organization meets the "facts-and-circumstances" test, check this box and <b>stop here.</b>  Explain<br/>
      in Part VI how the organization meets the "facts-and-circumstances" test.  The organization qualifies as a publicly supported<br/>
      organization
      <span class="IRS990ScheduleA_DotSpacing">.....................................................  </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchATenPctFactsCrcmstncsTestCYIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/TenPctFactsCrcmstncsTestCYInd"/>
        <xsl:with-param name="BackupName">IRS990SchATenPctFactsCrcmstncsTestCYInd</xsl:with-param>
      </xsl:call-template>
    </input>  
   </div>
</div>

<!-- line 17b -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:7.2mm;padding-right:9px;">b</div>
 <div class="IRS990ScheduleA_LineDescIVB" style="height:auto;">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/TenPctFactsCrcmstncsTestPYInd"/>
        <xsl:with-param name="BackupName">IRS990SchATenPctFactsCrcmstncsTestPYInd</xsl:with-param>
      </xsl:call-template>
      <span style="font-weight:bold;">
         10%-facts-and-circumstances test—2016.
      </span>
      If the organization did not check a box on line 13, 16a, 16b, or 17a, and line<br/>
     15 is 10% or more, and if the organization meets the "facts-and-circumstances" test, check this box and <b>stop here.</b><br/>
     Explain in Part VI how the organization meets the "facts-and-circumstances" test.  The organization qualifies as a publicly<br/> supported organization
      <span class="IRS990ScheduleA_DotSpacing">................................................  </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchATenPctFactsCrcmstncsTestPYIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/TenPctFactsCrcmstncsTestPYInd"/>
        <xsl:with-param name="BackupName">IRS990SchATenPctFactsCrcmstncsTestPYInd</xsl:with-param>
      </xsl:call-template>
    </input>  
   </div>
</div>

<!-- line 18 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:6mm;">18</div>
  
     <div class="IRS990ScheduleA_LineDescIVB" style="width:178mm;height:auto;">
          <span style="font-weight:bold;">
         Private foundation.
      </span>
      If the organization did not check a box on line 13, 16a, 16b, 17a, or 17b, check this box and see<br/>
      instructions
      <span class="IRS990ScheduleA_DotSpacing">.....................................................  </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
     
     <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchAPrivateFoundation170IndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/PrivateFoundation170Ind"/>
        <xsl:with-param name="BackupName">IRS990SchAPrivateFoundation170Ind</xsl:with-param>
      </xsl:call-template>
    </input>  
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PrivateFoundation170Ind"/>
         <xsl:with-param name="BackupName">IRS990SchAPrivateFoundation170Ind</xsl:with-param>
      </xsl:call-template>
      </label>
   </div>
</div>
<div class="styBB" style="width:187mm;border-bottom-width:1px;"/>

	<!--Page Footer Part II-->
<div class="pageEnd" style="width:187mm;border-top-width:1px;">
  <div style="float:right;">
    <span style="width:80px;"/>  
    <span class="styBoldText"> Schedule A (Form 990 or 990-EZ) 2017</span> 
  </div>  
</div>
<!-- END Footer -->
<p style="page-break-before: always"/>
<!-- Page Header -->
  <div class="styBB" style="width:187mm; padding-bottom:.5mm;">  
    <div style="float:left;">Schedule A (Form 990 or 990-EZ) 2017</div>
    <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></div>                    
  </div>  
<!-- END Page Header -->      

<!-- Part III header-->
<div class="styBB" style="width:187mm;">
  <div class="styPartName" style="width:20mm;height:auto;">Part III</div>
  <div class="styPartDesc" style="width:165mm;height:auto;">Support Schedule for Organizations Described in Section 509(a)(2)<br/>
      <span class="styNormalText">(Complete only if you checked the box on line 10 of Part I or if the organization
failed to qualify under Part II. If the organization fails to qualify under
the tests listed below, please complete Part II.)</span>
  </div>
</div>
<!-- <div class="styBB" style="width: 187mm">
  <div class="styPartName" style="margin-top: 2mm">Part III</div>
  <div class="styPartDesc" style="padding-top: 2mm;width: 157mm">Statements About Activities
        <span class="styNormalText">(See page 2 of the instructions.)</span>
  </div>  -->

<span class="styPartDesc" style="width:165mm;font-weight:bold;height:auto;">Section A. Public Support</span>

<!--Part III  table -->
<div class="IRS990ScheduleA_TableContainer" style="border-bottom-width:0px;">
   <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
     <tr>
      <th class="IRS990ScheduleA_GenericCell" style="width:60mm;font-weight:bold;border-bottom-width:0px;" scope="col" colspan="2">
        <span style="float: left; clear: both"> Calendar year <span class="styBoldText">(or fiscal year beginning in) <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/></span></span>
      </th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(a) <span class="styNormalText"> 2013</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(b) <span class="styNormalText"> 2014</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(c) <span class="styNormalText"> 2015</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(d) <span class="styNormalText"> 2016</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(e) <span class="styNormalText"> 2017</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;border-right-width:0px;text_align:center;vertical-align:center;" scope="col">(f) <span class="styNormalText"> Total</span></th>
    </tr>
    <tr>
    <!-- Line 1 -->
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">1</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Gifts, grants, contributions, and membership fees received. (Do not include any "unusual grants.") <span class="IRS990ScheduleA_DotSpacing">.</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContrisRcvd509Grp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContrisRcvd509Grp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContrisRcvd509Grp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContrisRcvd509Grp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContrisRcvd509Grp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContrisRcvd509Grp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
    <!-- Line 2 -->
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">2</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Gross receipts from admissions, merchandise sold or services performed, or facilities furnished in any activity that is related to the organization's tax-exempt purpose<span class="IRS990ScheduleA_DotSpacing"></span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsAdmissionsGrp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsAdmissionsGrp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsAdmissionsGrp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsAdmissionsGrp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsAdmissionsGrp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsAdmissionsGrp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
    <!-- Line 3 -->
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">3</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Gross receipts from activities that are not an unrelated trade or business under section 513 <span class="IRS990ScheduleA_DotSpacing">.....</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsNonUnrltBusGrp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsNonUnrltBusGrp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsNonUnrltBusGrp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsNonUnrltBusGrp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsNonUnrltBusGrp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsNonUnrltBusGrp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
    <!-- Line 4 -->
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">4</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Tax revenues levied for the organization's benefit  and either paid to or expended on its behalf<span class="IRS990ScheduleA_DotSpacing">...</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedOrgnztnlBnft509Grp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedOrgnztnlBnft509Grp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedOrgnztnlBnft509Grp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedOrgnztnlBnft509Grp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedOrgnztnlBnft509Grp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedOrgnztnlBnft509Grp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">5</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">The value of services or facilities furnished by a governmental unit to the organization without charge<span class="IRS990ScheduleA_DotSpacing"></span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GovtFurnSrvcFcltsVl509Grp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GovtFurnSrvcFcltsVl509Grp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GovtFurnSrvcFcltsVl509Grp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GovtFurnSrvcFcltsVl509Grp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
     <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GovtFurnSrvcFcltsVl509Grp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
       <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GovtFurnSrvcFcltsVl509Grp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">6</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;"><b>Total.</b> Add lines 1 through 5<span class="IRS990ScheduleA_DotSpacing"></span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509Grp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509Grp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509Grp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509Grp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509Grp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509Grp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <!-- Line 7a -->
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;padding-left:2mm;padding-right:5px;" valign="top">7a</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Amounts included on lines 1, 2, and 3 received from disqualified persons<span class="IRS990ScheduleA_DotSpacing"></span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmountsRcvdDsqlfyPersonGrp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmountsRcvdDsqlfyPersonGrp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmountsRcvdDsqlfyPersonGrp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmountsRcvdDsqlfyPersonGrp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmountsRcvdDsqlfyPersonGrp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmountsRcvdDsqlfyPersonGrp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>

    <!-- Line 7b -->
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;padding-left:2mm;padding-right:5px;" valign="top"> b</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Amounts included on lines 2 and 3 received from other than disqualified persons that exceed the greater of $5,000 or 1% of the amount on line 13 for the year<span class="IRS990ScheduleA_DotSpacing">.</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SubstantialContributorsAmtGrp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SubstantialContributorsAmtGrp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SubstantialContributorsAmtGrp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SubstantialContributorsAmtGrp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SubstantialContributorsAmtGrp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SubstantialContributorsAmtGrp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>

    <!-- Line 7c -->
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;padding-left:2mm;padding-right:5px;" valign="top"> c</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Add lines 7a and 7b<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SubstAndDsqlfyPrsnsTotGrp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SubstAndDsqlfyPrsnsTotGrp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SubstAndDsqlfyPrsnsTotGrp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SubstAndDsqlfyPrsnsTotGrp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SubstAndDsqlfyPrsnsTotGrp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SubstAndDsqlfyPrsnsTotGrp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <!-- Line 8 -->
      <tr>  
        <td class="IRS990ScheduleA_IndexCell" valign="top">8</td>
        <td class="IRS990ScheduleA_GenericCell" style="width:56mm;vertical-align:top;">
          <b>Public support.</b> (Subtract line 7c from line 6.)
          <!-- Pen image -->
 <!--     <xsl:call-template name="LinkToLeftoverDataTableInline">
            <xsl:with-param name="Desc">Line 22 - Description</xsl:with-param>
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome/Description"/>
          </xsl:call-template>
          <span style="width:5mm" /> -->
          <!-- Pushpin image -->
<!--      <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome"/>
          </xsl:call-template> -->
        </td>   
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;"><span style="width:1px;" /></td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/PublicSupportTotal509Amt"/>
          </xsl:call-template>
        </td>
      </tr>  
  </table>
</div>

<span class="styPartDesc" style="width:162mm;font-weight:bold">Section B. Total Support</span>

<!--                                           Save above code               -->


<div class="IRS990ScheduleA_TableContainer" style="border-bottom-width:0px;">
   <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
     <tr>
      <th class="IRS990ScheduleA_GenericCell" style="width:60mm;font-weight:bold;border-bottom-width:0px;" scope="col" colspan="2">
        <span style="float: left; clear: both"> Calendar year <span class="styBoldText"> (or fiscal year beginning in) <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/></span></span>
      </th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(a) <span class="styNormalText"> 2013</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(b) <span class="styNormalText"> 2014</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(c) <span class="styNormalText"> 2015</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(d) <span class="styNormalText"> 2016</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center;vertical-align:center;" scope="col">(e) <span class="styNormalText"> 2017</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;border-right-width:0px;text_align:center;vertical-align:center;" scope="col">(f) <span class="styNormalText"> Total</span></th>
    </tr>
    <tr>
    <!-- Line 9 -->
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">9</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Amounts from line 6<span class="IRS990ScheduleA_DotSpacing">...</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509Grp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509Grp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509Grp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509Grp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509Grp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509Grp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">10a</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Gross income from interest, dividends, payments received on securities loans, rents, royalties and income from similar sources<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome509Grp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome509Grp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome509Grp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome509Grp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome509Grp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>

      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome509Grp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top"> b</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Unrelated business taxable income (less section 511 taxes) from businesses acquired after June 30, 1975<span class="IRS990ScheduleA_DotSpacing">.</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Post1975UBTIGrp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Post1975UBTIGrp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Post1975UBTIGrp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Post1975UBTIGrp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Post1975UBTIGrp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
       <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Post1975UBTIGrp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top"> c</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Add lines 10a and 10b<span class="IRS990ScheduleA_DotSpacing">.</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeAndUBTIGrp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeAndUBTIGrp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeAndUBTIGrp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeAndUBTIGrp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeAndUBTIGrp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeAndUBTIGrp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
    <!-- Line 11 -->
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">11</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Net income from unrelated business activities not included in line 10b, whether or not the business is regularly carried on<span class="IRS990ScheduleA_DotSpacing">.</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetIncomeFromOtherUBIGrp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetIncomeFromOtherUBIGrp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetIncomeFromOtherUBIGrp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetIncomeFromOtherUBIGrp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetIncomeFromOtherUBIGrp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetIncomeFromOtherUBIGrp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
    <!-- Line 12 -->
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">12</td>
          <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;vertical-align:top;">Other income. Do not include gain or loss from the sale of capital assets (Explain in Part VI.)
          <span class="IRS990ScheduleA_DotSpacing">..</span>              
          <!-- Pen image -->
 <!--     <xsl:call-template name="LinkToLeftoverDataTableInline">
            <xsl:with-param name="Desc">Line 22 - Description</xsl:with-param>
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome/Description"/>
          </xsl:call-template>
          <span style="width:5mm" /> -->
          <!-- Pushpin image -->
<!--      <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome"/>
          </xsl:call-template>  -->
        </td>    
        <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome509Grp/CurrentTaxYearMinus4YearsAmt"/>
          </xsl:call-template>
        </td>
        <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome509Grp/CurrentTaxYearMinus3YearsAmt"/>
          </xsl:call-template>
        </td>
        <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome509Grp/CurrentTaxYearMinus2YearsAmt"/>
          </xsl:call-template>
        </td>
        <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome509Grp/CurrentTaxYearMinus1YearAmt"/>
          </xsl:call-template>
        </td>
        <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome509Grp/CurrentTaxYearAmt"/>
          </xsl:call-template>
        </td>
        <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome509Grp/TotalAmt"/>
          </xsl:call-template>
        </td>
      </tr>  
 <!-- Line 13 -->
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">13</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;"><b>Total support.</b> (Add lines 9, 10c, 11, and 12.)<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      
      
<td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalSupportCalendarYearGrp/CurrentTaxYearMinus4YearsAmt"/>
      </xsl:call-template>
      </td>      
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalSupportCalendarYearGrp/CurrentTaxYearMinus3YearsAmt"/>
      </xsl:call-template>
      </td>      
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalSupportCalendarYearGrp/CurrentTaxYearMinus2YearsAmt"/>
      </xsl:call-template>
      </td>      
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalSupportCalendarYearGrp/CurrentTaxYearMinus1YearAmt"/>
      </xsl:call-template>
      </td>      
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalSupportCalendarYearGrp/CurrentTaxYearAmt"/>
      </xsl:call-template>
      </td>      
  
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalSupportCalendarYearGrp/TotalAmt"/>
      </xsl:call-template>
      </td>
    </tr>
  </table>
</div>

<!--  2nd Table of Page 3 above -->

<!-- Part III Line 14 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">14</div>
 <div class="IRS990ScheduleA_LineDescIVAL" style="height:auto;">
  
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/First5Years509Ind"/>
         <xsl:with-param name="BackupName">IRS990SchAFirst5Years509Ind</xsl:with-param>
      </xsl:call-template>
      <span style="font-weight:bold;">
         First five years.
      </span>
      If the Form 990 is for the organization's first, second, third, fourth, or fifth tax year as a section 501(c)(3) organization,<br/>
      check this box and <b>stop here</b>
      <span class="IRS990ScheduleA_DotSpacing">............................................. </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchAFirst5Years509IndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/First5Years509Ind"/>
         <xsl:with-param name="BackupName">IRS990SchAFirst5Years509Ind</xsl:with-param>
      </xsl:call-template>
    </input>  
  </div>
    
</div>
<!-- line 14 ends -->

<div class="styBB" style="width:187mm;border-top-width: 1px">
<span class="styPartDesc" style="width:162mm;font-weight:bold;height:auto;">Section C.  Computation of Public Support Percentage</span>
</div>

  <!-- line 15 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">15</div>
  <div class="IRS990ScheduleA_LineDescIVA">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PublicSupportCY509Pct"/>
         <xsl:with-param name="BackupName">IRS990SchAPublicSupportCY509Pct</xsl:with-param>
      </xsl:call-template>
      Public support percentage for 2017 (line 8, column (f) divided by line 13, column (f))
       <span class="IRS990ScheduleA_DotSpacing">.........  </span>
     </label> 
   </div>
    <div class="styLNRightNumBox" style="height:4mm;">15</div>
    <div class="styLNAmountBox" style="height:4mm;">
    <xsl:call-template name="PopulatePercent">
    <xsl:with-param name="TargetNode" select="$FormData/PublicSupportCY509Pct"/>
     <xsl:with-param name="BackupName">IRS990SchAPublicSupportCY509Pct</xsl:with-param>
    
    </xsl:call-template>
    </div>
</div>
 
   <!-- line 16 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">16</div>
  <div class="IRS990ScheduleA_LineDescIVA">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PublicSupportPY509Pct"/>
         <xsl:with-param name="BackupName">IRS990SchAPublicSupportPY509Pct</xsl:with-param>
      </xsl:call-template>
      Public support percentage from 2016 Schedule A, Part III, line 15
       <span class="IRS990ScheduleA_DotSpacing">...............  </span>
     </label> 
    </div>
     <div class="styLNRightNumBox" style="height:4mm;border-bottom-width: 0px">16</div>
    <div class="styLNAmountBox" style="height:4mm;border-bottom-width: 0px;">
    <xsl:call-template name="PopulatePercent">
    <xsl:with-param name="TargetNode" select="$FormData/PublicSupportPY509Pct"/>
    <xsl:with-param name="BackupName">IRS990SchAPublicSupportPY509Pct</xsl:with-param>
    
    </xsl:call-template>
   </div>
 
</div>
<div class="styBB" style="width:187mm;border-top-width: 1px">
<span class="styPartDesc" style="width:162mm;font-weight:bold;height:auto;">Section D. Computation of Investment Income Percentage</span>
</div>

  <!-- line 17 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">17</div>
  <div class="IRS990ScheduleA_LineDescIVA">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeCYPct"/>
        <xsl:with-param name="BackupName">IRS990SchAInvestmentIncomeCYPct</xsl:with-param>
      </xsl:call-template>
      Investment income percentage for <b>2017</b> (line 10c, column (f) divided by line 13, column (f))
       <span class="IRS990ScheduleA_DotSpacing">......  </span>
     </label> 
   </div>
    <div class="styLNRightNumBox" style="height:4mm;">17</div>
    <div class="styLNAmountBox" style="height:4mm;">
    <xsl:call-template name="PopulatePercent">
    <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeCYPct"/>
    <xsl:with-param name="BackupName">IRS990SchAInvestmentIncomeCYPct</xsl:with-param>
    </xsl:call-template>
    </div>

</div>
 
   <!-- line 18 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">18</div>
  <div class="IRS990ScheduleA_LineDescIVA">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomePYPct"/>
        <xsl:with-param name="BackupName">IRS990SchAInvestmentIncomePYPct</xsl:with-param>
      </xsl:call-template>
      Investment income percentage from <b>2016</b> Schedule A, Part III, line 17
       <span class="IRS990ScheduleA_DotSpacing">.............  </span>
     </label> 
   </div>
    <div class="styLNRightNumBox" style="height:4mm;">18</div>
    <div class="styLNAmountBox" style="height:4mm;">
    <xsl:call-template name="PopulatePercent">
    <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomePYPct"/>
    <xsl:with-param name="BackupName">IRS990SchAInvestmentIncomePYPct</xsl:with-param>
    </xsl:call-template>
    </div>

</div>


<!-- line 19a -->
<div class="IRS990ScheduleA_LineContainer" style="padding-left:0.8mm;">
  <div class="IRS990ScheduleA_LineIndex" style="width:5mm;padding-right:9px;">19a</div>
  <div class="IRS990ScheduleA_LineDescIVB" style="height:auto;">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThrPctSuprtTestsCY509Ind"/>
        <xsl:with-param name="BackupName">IRS990SchAThirtyThrPctSuprtTestsCY509Ind</xsl:with-param>
      </xsl:call-template>
      <b>
         <span style="padding-left:1mm;;">33</span> <span style="font-size:5pt;">1/3</span>% support tests—2017.
      </b>
      If the organization did not check the box on line 14, and line 15 is more than 33 <span style="font-size:5pt;">1/3</span>%, and line 17 is not <span style="padding-left:1mm;"/>more than 33 <span style="font-size:5pt;">1/3</span>%, check this box and <b>stop here.</b>  The organization qualifies as a publicly supported organization
      <span class="IRS990ScheduleA_DotSpacing">....... </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchAThirtyThrPctSuprtTestsCY509IndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThrPctSuprtTestsCY509Ind"/>
        <xsl:with-param name="BackupName">IRS990SchAThirtyThrPctSuprtTestsCY509Ind</xsl:with-param>
      </xsl:call-template>
    </input>  
   </div>
</div>

<!-- line 19b -->
<div class="IRS990ScheduleA_LineContainer">
   <div class="IRS990ScheduleA_LineIndex" style="padding-right:8px;">b</div>
  <div class="IRS990ScheduleA_LineDescIVAL" style="height:auto;">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThrPctSuprtTestsPY509Ind"/>
        <xsl:with-param name="BackupName">IRS990SchAThirtyThrPctSuprtTestsPY509Ind</xsl:with-param>
      </xsl:call-template>
      <span style="font-weight:bold;">
         33 <span style="font-size:5pt;">1/3</span>% support tests—2016.
      </span>
      If the organization did not check a box on line 14 or line 19a, and line 16 is more than 33 <span style="font-size:5pt;">1/3</span>% and line 18 is not more than 33 <span style="font-size:5pt;">1/3</span>%, check this box and <b>stop here.</b> The organization qualifies as a publicly supported organization
      <span class="IRS990ScheduleA_DotSpacing">.... </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchAThirtyThrPctSuprtTestsPY509IndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThrPctSuprtTestsPY509Ind"/>
        <xsl:with-param name="BackupName">IRS990SchAThirtyThrPctSuprtTestsPY509Ind</xsl:with-param>
        
      </xsl:call-template>
    </input>  
   </div>
</div>

<!-- line 20 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">20</div>
  <div class="IRS990ScheduleA_LineDescIVAL" style="height:auto;">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PrivateFoundation509Ind"/>
        <xsl:with-param name="BackupName">IRS990SchAPrivateFoundation509Ind</xsl:with-param>
      </xsl:call-template>
      <span style="font-weight:bold;height:auto;">
         Private foundation.
      </span>
      If the organization did not check a box on line 14, 19a, or 19b, check this box and see instructions
      <span class="IRS990ScheduleA_DotSpacing">.... </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchAPrivateFoundation509IndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/PrivateFoundation509Ind"/>
        <xsl:with-param name="BackupName">IRS990SchAPrivateFoundation509Ind</xsl:with-param>
      </xsl:call-template>
    </input>  
   </div>
</div>

<div class="styBB" style="width:187mm;"/>

<!--Page Footer Part III-->
<div class="pageEnd" style="width:187mm">
  <div style="float:right;">
    <span style="width:80px;"/>  
    <span class="styBoldText"> Schedule A (Form 990 or 990-EZ) 2017</span> 
  </div>  
</div>
<p style="page-break-before: always"/>
 <!-- Page Header -->
  <div class="styBB" style="width:187mm; padding-bottom:.5mm;">  
    <div style="float:left;">Schedule A (Form 990 or 990-EZ) 2017</div>
    <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span></div>                    
  </div>  
 
  
<!-- END Page Header --> 
 <div class="styBB" style="width:187mm;float:none;">
            <div class="styPartName" style="float:left;height:auto">Part IV</div>
            <div class="styPartDesc" style="float:left;width:172mm;">Supporting Organizations</div>
             <span style="padding-left:16mm;height:auto"/> (Complete only if you checked a box on line 12 of Part I. If you checked 12a of Part I, complete Sections A and B.
            If you checked 12b of <span style="width:17mm;padding-left:2mm;"/>Part I, complete Sections A and C. If you checked 12c of Part I, complete Sections A, D, and E. If you checked 12d of Part I, complete <span style="width:17mm;padding-left:2mm;"/>Sections A and D, and complete Part V.)
          </div>
 <div style="width:187mm;border-top-width: 1px" class="styBB">
						<div class="styPartDesc" style="width: 100mm;height:auto;">
    Section A. All Supporting Organizations 
  </div>
					</div>
					<!--  Line 1  -->
					<div style="width: 187mm">
					<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width: 155mm;height:4.5mm;"/>
                        	<div class="styLNRightNumBox" style="height:4.5mm;border-left:0px;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">Yes</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">No</div>
						
					    </div>
					    <div style="width: 187mm">
					<div class="styLNLeftNumBox">1</div>
					<div class="styLNDesc" style="width: 155mm;height:7.5mm;">
       Are all of the organization’s supported organizations listed by name in the organization’s governing documents?<br></br>
         <i> If "No," describe in<b> Part VI</b> how the supported organizations are designated. If designated by class or purpose,<br></br>describe the designation. If historic and continuing relationship, explain.</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/ListedByNameGoverningDocInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/ListedByNameGoverningDocInd"/>
              </xsl:call-template>
						</div>
					</div>
					
				<div style="width: 187mm">
					<div class="styLNLeftNumBox">2</div>
					<div class="styLNDesc" style="width: 155mm;height:7.5mm;">
      Did the organization have any supported organization that does not have an IRS determination of status under section 509(a)(1) or (2)? <i>If "Yes," explain in <b>Part VI</b> how the organization determined that the supported organization was
described in section 509(a)(1) or (2).</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SuprtOrgNoIRSDeterminationInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SuprtOrgNoIRSDeterminationInd"/>
              </xsl:call-template>
						</div>
					</div>	
					
					
          <div style="width: 187mm">
					<div class="styLNLeftNumBox">3a</div>
					<div class="styLNDesc" style="width: 155mm;height:4.5mm;">
       Did the organization have a supported organization described in section 501(c)(4), (5), or (6)?
<i> If "Yes," answer (b) and (c) below.</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">3a</div>
						<div class="styLNRightNumBox">
							  <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SupportedOrgSectionC456Ind"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SupportedOrgSectionC456Ind"/>
              </xsl:call-template>
						</div>
					</div>	
       
       <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
					<div class="styLNDesc" style="width: 155mm;height:7.5mm;">
        Did the organization confirm that each supported organization qualified under section 501(c)(4), (5), or (6) and satisfied the
public support tests under section 509(a)(2)? <i>If "Yes," describe in <b>Part VI</b> when and how the organization made the
determination.</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">3b</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SupportedOrgQualifiedInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SupportedOrgQualifiedInd"/>
              </xsl:call-template>
						</div>
					</div>	
       
       
        <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:3mm;">c</div>
					<div class="styLNDesc" style="width: 155mm;height:4.5mm;">
       Did the organization ensure that all support to such organizations was used exclusively for section 170(c)(2)(B) purposes?
       
              <i>If "Yes," explain in <b>Part VI</b> what controls the organization put in place to ensure such use</i>.
  </div>
     
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">3c</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SuprtExclusivelySec170c2BInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							  <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SuprtExclusivelySec170c2BInd"/>
              </xsl:call-template>
						</div>
					</div>	
       
         <div style="width: 187mm">
					<div class="styLNLeftNumBox">4a</div>
					<div class="styLNDesc" style="width: 155mm;height:4.5mm;">
        Was any supported organization not organized in the United States ("foreign supported organization")?
        
              <i>If “Yes” and if you checked 12a or 12b in Part I, answer (b) and (c) below.</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">4a</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SupportedOrgNotOrganizedUSInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SupportedOrgNotOrganizedUSInd"/>
              </xsl:call-template>
						</div>
					</div>	
        
        <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
					<div class="styLNDesc" style="width: 155mm;height:4.5mm;">
        Did the organization have ultimate control and discretion in deciding whether to make grants to the foreign supported
organization?<i> If “Yes,” describe in <b>Part VI</b> how the organization had such control and discretion despite being controlled or
supervised by or in connection with its supported organizations.</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">4b</div>
						<div class="styLNRightNumBox">
							  <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/ControlDecidingGrntFrgnOrgInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/ControlDecidingGrntFrgnOrgInd"/>
              </xsl:call-template>
						</div>
					</div>	
        
        <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:3mm;">c</div>
					<div class="styLNDesc" style="width: 155mm;height:7.5mm;">
        Did the organization support any foreign supported organization that does not have an IRS determination under sections
501(c)(3) and 509(a)(1) or (2)?
        <i>If “Yes,” explain in <b>Part VI</b> what controls the organization used to ensure that all support to
the foreign supported organization was used exclusively for section 170(c)(2)(B) purposes.</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">4c</div>
						<div class="styLNRightNumBox">
							  <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SupportForeignOrgNoDetermInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SupportForeignOrgNoDetermInd"/>
              </xsl:call-template>
						</div>
					</div>	
        
         <div style="width: 187mm">
					<div class="styLNLeftNumBox">5a</div>
					<div class="styLNDesc" style="width: 155mm;height:10.5mm;">
        Did the organization add, substitute, or remove any supported organizations during the tax year?
        <i>If “Yes,” answer (b) and
(c) below (if applicable). Also, provide detail in <b>Part VI,</b> including (i) the names and EIN numbers of the supported
organizations added, substituted, or removed; (ii) the reasons for each such action; (iii) the authority under the
organization's organizing document authorizing such action; and (iv) how the action was accomplished (such as by
amendment to the organizing document).</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:10.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:10.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:10.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">5a</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/OrganizationChangeSuprtOrgInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/OrganizationChangeSuprtOrgInd"/>
              </xsl:call-template>
						</div>
					</div>	
					
					
					
         <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:3mm;padding-top:2mm;">b</div>
					<div class="styLNDesc" style="width: 155mm;height:4.5mm;padding-top:2mm;">
        <b>Type I or Type II only.</b>  Was any added or substituted supported organization part of a class already designated in the
organization's organizing document?
  </div>
     
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">5b</div>
						<div class="styLNRightNumBox">
							  <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SupportedOrgClassDesignatedInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SupportedOrgClassDesignatedInd"/>
              </xsl:call-template>
						</div>
					</div>	
        
         <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:3mm;">c</div>
					<div class="styLNDesc" style="width: 155mm;height:4.5mm;">
        <b>Substitutions only.</b>  Was the substitution the result of an event beyond the organization's control?
  </div>
     
						<div class="styLNRightNumBox" style="height:4.5mm;">5c</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
							  <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SubstitutionBeyondOrgCntlInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
							  <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SubstitutionBeyondOrgCntlInd"/>
              </xsl:call-template>
						</div>
					
					</div>	
        
        
        <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:1mm;">6</div>
					<div class="styLNDesc" style="width: 155mm;height:10.5mm;">
          Did the organization provide support (whether in the form of grants or the provision of services or facilities) to anyone other
than (i) its supported organizations, (ii) individuals that are part of the charitable class benefited by one or more of its
supported organizations, or (iii) other supporting organizations that also support or benefit one or more of the filing
organization’s supported organizations?
        <i>If “Yes,” provide detail in <b>Part VI.</b></i>
                
              </div>
     
						<div class="styLNRightNumBox" style="height:10.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:10.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:10.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SupportNonSupportedOrgInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							  <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/SupportNonSupportedOrgInd"/>
              </xsl:call-template>
						</div>
					</div>	
        
        <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:1mm;">7</div>
					<div class="styLNDesc" style="width: 155mm;height:7.5mm;">
        Did the organization provide a grant, loan, compensation, or other similar payment to a substantial contributor (defined in
section 4958(c)(3)(C)), a family member of a substantial contributor, or a 35% controlled entity with regard to a
substantial contributor?
        <i>If “Yes,” complete Part I of Schedule L (Form 990 or 990-EZ) .</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNRightNumBox">
							   <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/PaymentSubstantialContribtrInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							  <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/PaymentSubstantialContribtrInd"/>
              </xsl:call-template>
						</div>
					</div>	
        
        
        
         <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:1mm;">8</div>
					<div class="styLNDesc" style="width: 155mm;height:4.5mm;">
         Did the organization make a loan to a disqualified person (as defined in section 4958) not described in line 7?
        <i>If “Yes,” complete Part I of Schedule L (Form 990 or 990-EZ).</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/LoanDisqualifiedPersonInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							  <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/LoanDisqualifiedPersonInd"/>
              </xsl:call-template>
						</div>
					</div>	
        
        
          
         <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:1mm;">9a</div>
					<div class="styLNDesc" style="width: 155mm;height:7.5mm;">
        Was the organization controlled directly or indirectly at any time during the tax year by one or more disqualified persons as
defined in section 4946 (other than foundation managers and organizations described in section 509(a)(1) or (2))?
        <i>If “Yes,” provide detail in<b> Part VI.</b></i>
  </div>
     
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">9a</div>
						<div class="styLNRightNumBox">
							   <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/ControlledDisqualifiedPrsnInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							  <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/ControlledDisqualifiedPrsnInd"/>
              </xsl:call-template>
						</div>
					</div>	
          
          <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
					<div class="styLNDesc" style="width: 155mm;height:4.5mm;">
         Did one or more disqualified persons (as defined in line 9a) hold a controlling interest in any entity in which the supporting
organization had an interest?
        <i>If “Yes,” provide detail in<b> Part VI.</b></i>
  </div>
     
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">9b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/DisqualifiedPrsnControllIntInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							  <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/DisqualifiedPrsnControllIntInd"/>
              </xsl:call-template>
						</div>
					</div>	
        
        
        <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:3mm;">c</div>
					<div class="styLNDesc" style="width: 155mm;height:4.5mm;">
         Did a disqualified person (as defined in line 9a) have an ownership interest in, or derive any personal benefit from, assets
in which the supporting organization also had an interest?
        <i>If “Yes,” provide detail in<b> Part VI.</b></i>
  </div>
     
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">9c</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/DisqualifiedPrsnOwnrIntInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							  <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/DisqualifiedPrsnOwnrIntInd"/>
              </xsl:call-template>
						</div>
					</div>	
        
        
        
        <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:0mm;">10a</div>
					<div class="styLNDesc" style="width: 155mm;height:7.5mm;">
        Was the organization subject to the excess business holdings rules of section 4943 because of section 4943(f) (regarding certain
Type II supporting organizations, and all Type III non-functionally integrated supporting organizations)?
        <i>If “Yes,” answer line 10b below.</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">10a</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/ExcessBusinessHoldingsRulesInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							  <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/ExcessBusinessHoldingsRulesInd"/>
              </xsl:call-template>
						</div>
					</div>	
        
        
         <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
					<div class="styLNDesc" style="width: 155mm;height:4.5mm;">
        Did the organization have any excess business holdings in the tax year? <i>(Use Schedule C, Form 4720, to determine
whether the organization had excess business holdings).</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">10b</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/ExcessBusinessHoldingsInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							  <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/ExcessBusinessHoldingsInd"/>
              </xsl:call-template>
						</div>
					</div>	
        
         <div class="styBB" style="width:187mm;"/>
          <!--Page Footer Part III-->
<div class="pageEnd" style="width:187mm">
  <div style="float:right;">
    <span style="width:80px;"/>  
    <span class="styBoldText"> Schedule A (Form 990 or 990-EZ) 2017</span> 
  </div>  
</div>
<p style="page-break-before: always"/>
 <!-- Page Header -->
  <div class="styBB" style="width:187mm; padding-bottom:.5mm;">  
    <div style="float:left;">Schedule A (Form 990 or 990-EZ) 2017</div>
    <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span></div>                    
  </div>  
        
     <div class="styBB" style="width:187mm;float:none;">
            <div class="styPartName" style="float:left;height:auto">Part IV</div>
            <div class="styPartDesc" style="float:left;width:172mm;">Supporting Organizations  <span class="styNormalText">  (continued)</span></div>   
         
         </div>   
       
        	<div style="width: 187mm">
					<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width: 155mm;height:4.5mm;"/>
                        	<div class="styLNRightNumBox" style="height:4.5mm;border-left:0px;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">Yes</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">No</div>
						   </div>
						   
					    <div style="width: 187mm">
					<div class="styLNLeftNumBox">11</div>
					<div class="styLNDesc" style="width: 155mm;height:4.5mm;">
       Has the organization accepted a gift or contribution from any of the following persons?<br></br>
       <div class="styLNLeftNumBox" style="padding-left:0mm"></div>
  </div>
     
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left:3mm;">a</div>
						<div class="styLNDesc" style="width: 155mm;height:4.5;">A person who directly or indirectly controls, either alone or together with persons described in (b) and (c) below, the governing body of a supported organization?
													</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
							 
						</div>
				<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm;height:4.5;">
													</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">11a</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/ContributionControllerInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
							  <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/ContributionControllerInd"/>
              </xsl:call-template>
						</div>
						
					</div>	
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
						<div class="styLNDesc" style="width: 155mm;height:4.5;">A family member of a person described in (a) above?
													</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">11b</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
						<xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/ContributionFamilyInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
						 <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/ContributionFamilyInd"/>
                </xsl:call-template>
						</div>
							 
						</div>
				
     <div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left:3mm;">c</div>
						<div class="styLNDesc" style="width: 155mm;height:4.5;">A 35% controlled entity of a person described in (a) or (b) above?
 <i>If “Yes” to a, b, or c, provide detail in Part VI.</i>
													</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">11c</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
						 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/Contribution35ControlledInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
						  <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchASupportingOrgGrp/Contribution35ControlledInd"/>
              </xsl:call-template>
						</div>
							 
						</div>
          
        <div class="styBB" style="width:187mm;float:none;">
         <div class="styBB" style="width:187mm;"/>
            <div class="styPartDesc" style="width:152mm;text-align:left;height:auto;border-top-width:1px;">
Section B. Type I Supporting Organizations 
</div>
 </div>
 <div style="width: 187mm">
					<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width: 155mm;height:4.5mm;"/>
                        	<div class="styLNRightNumBox" style="height:4.5mm;border-left:0px;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">Yes</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">No</div>
						
					    </div>
					    <div style="width: 187mm">
					<div class="styLNLeftNumBox">1</div>
					<div class="styLNDesc" style="width: 155mm;height:17mm;">
        Did the directors, trustees, or membership of one or more supported organizations have the power to regularly appoint or
elect at least a majority of the organization’s directors or trustees at all times during the tax year?
         <i>If “No,” describe in <b>Part VI</b> how the supported organization(s) effectively operated, supervised, or controlled the organization’s activities. If the organization had more than one supported organization, describe how the powers to appoint and/or remove directors or
trustees were allocated among the supported organizations and what conditions or restrictions, if any, applied to such
powers during the tax year.</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:17mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:17mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:17mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType1SuprtOrgGrp/PowerAppointMajorityDirTrstInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType1SuprtOrgGrp/PowerAppointMajorityDirTrstInd"/>
              </xsl:call-template>
						</div>
					</div>
					
				<div style="width: 187mm">
					<div class="styLNLeftNumBox">2</div>
					<div class="styLNDesc" style="width: 155mm;height:7.5mm;">
       Did the organization operate for the benefit of any supported organization other than the supported organization(s) that
operated, supervised, or controlled the supporting organization?
<i>If “Yes,” explain in <b>Part VI</b> how providing such benefit
carried out the purposes of the supported organization(s) that operated, supervised or controlled the supporting
organization.</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox" style="height:7.5mm;">2</div>
						<div class="styLNRightNumBox" style="height:7.5mm;">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType1SuprtOrgGrp/OperateBenefitNonSuprtOrgInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType1SuprtOrgGrp/OperateBenefitNonSuprtOrgInd"/>
              </xsl:call-template>
						</div>
					</div>	
 
           <div class="styBB" style="width:187mm;float:none;">
           <div class="styBB" style="width:187mm;"/>
            <div class="styPartDesc" style="width:152mm;text-align:left;height:1mm;border-top-width:1px;height:auto;">
Section C. Type II Supporting Organizations 
</div>

 </div>
 <div style="width: 187mm">
					<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width: 155mm;height:4.5mm;"/>
                        	<div class="styLNRightNumBox" style="height:4.5mm;border-left:0px;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">Yes</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">No</div>
						
					    </div>
					    <div style="width: 187mm">
					<div class="styLNLeftNumBox">1</div>
					<div class="styLNDesc" style="width: 155mm;height:5.5mm;">
         Were a majority of the organization’s directors or trustees during the tax year also a majority of the directors or trustees of
each of the organization’s supported organization(s)?
         <i>If “No,” describe in <b>Part VI</b> how control or management of the
supporting organization was vested in the same persons that controlled or managed the supported organization(s).
                    </i>
  </div>
     
						<div class="styLNRightNumBox" style="height:5.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:5.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:5.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox" style="border-bottom:0px;height:5.5mm;">1</div>
						<div class="styLNRightNumBox" style="border-bottom:0px;height:5.5mm;">
							  <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/MajorityDirTrstSupportedOrgInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="border-bottom:0px;height:5.5mm;">
							 <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/MajorityDirTrstSupportedOrgInd"/>
              </xsl:call-template>
						</div>
					</div>
					
					
					
					<div class="styBB" style="width:187mm;float:none;">
                    <div class="styBB" style="width:187mm;"/>
         
            <div class="styPartDesc" style="width:152mm;text-align:left;height:auto;border-top-width:1px;">
Section D. All Type III Supporting Organizations 
</div>
 </div>
 <div style="width: 187mm">
					<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width: 155mm;height:4.5mm;"/>
                        	<div class="styLNRightNumBox" style="height:4.5mm;border-left:0px;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">Yes</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">No</div>
						
					    </div>
					    <div style="width: 187mm">
					<div class="styLNLeftNumBox">1</div>
					<div class="styLNDesc" style="width: 155mm;height:14mm;">
         Did the organization provide to each of its supported organizations, by the last day of the fifth month of the organization’s
tax year, (i) a written notice describing the type and amount of support provided during the prior tax year, (ii) a copy of the
Form 990 that was most recently filed as of the date of notification, and (iii) copies of the organization’s governing
documents in effect on the date of notification, to the extent not previously provided?
  </div>
     
						<div class="styLNRightNumBox" style="height:14mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:14mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3SprtOrgAllGrp/TimelyProvidedDocumentsInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3SprtOrgAllGrp/TimelyProvidedDocumentsInd"/>
              </xsl:call-template>
						</div>
					</div>
					
				<div style="width: 187mm">
					<div class="styLNLeftNumBox">2</div>
					<div class="styLNDesc" style="width: 155mm;height:10mm;">
        Were any of the organization’s officers, directors, or trustees either (i) appointed or elected by the supported organization(s)
or (ii) serving on the governing body of a supported organization?
         <i>If "No," explain in <b>Part VI</b> how the organization
maintained a close and continuous working relationship with the supported organization(s).</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:10mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:10mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3SprtOrgAllGrp/OfficersCloseRelationshipInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3SprtOrgAllGrp/OfficersCloseRelationshipInd"/>
              </xsl:call-template>
						</div>
					</div>	
 
 <div style="width: 187mm">
					<div class="styLNLeftNumBox">3</div>
					<div class="styLNDesc" style="width: 155mm;height:7.5mm;">
         By reason of the relationship described in (2), did the organization’s supported organizations have a significant voice in the
organization’s investment policies and in directing the use of the organization’s income or assets at all times during the tax
year?
         <i>If "Yes," describe in <b>Part VI</b> the role the organization’s supported organizations played in this regard.</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox" style="height:5.5mm;">3</div>
						<div class="styLNRightNumBox" style="height:5.5mm;">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3SprtOrgAllGrp/SupportedOrgVoiceInvestmentInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:5.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3SprtOrgAllGrp/SupportedOrgVoiceInvestmentInd"/>
              </xsl:call-template>
						</div>
					</div>	
 <div class="styBB" style="width:187mm;float:none;">
           <div class="styBB" style="width:187mm;"/>
           
            <div class="styPartDesc" style="width:152mm;text-align:left;height:auto;border-top-width:1px;">
Section E. Type III Functionally-Integrated Supporting Organizations 
</div>
 </div>
 
            <div class="styLNLeftNumBox" style="padding-left:1mm;">1</div>
            <div class="styLNDesc" style="width: 175mm">Check the box next to the method that the organization used to satisfy the Integral Part Test during the year<b> (see instructions)</b>:</div> 
           
            <!-- line 1 -->
<div class="IRS990ScheduleA_LineContainer">
 <div class="IRS990ScheduleA_LineIndex" style="padding-left:5mm;">a</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="ActivitiesTestIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3FuncIntGrp/ActivitiesTestInd"/>
        <xsl:with-param name="BackupName">IRS990SchAForm990SchAType3FuncIntGrp</xsl:with-param>
      </xsl:call-template>                                                                     
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV" style="width: 160mm;">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3FuncIntGrp/ActivitiesTestInd"/>
        <xsl:with-param name="BackupName">IRS990SchAForm990SchAType3FuncIntGrp</xsl:with-param>
      </xsl:call-template>
       The organization satisfied the Activities Test. Complete<b> line 2</b> below.
        </label>
  </div>
</div>
<!-- line 2 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="padding-left:5mm;">b</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input  class="IRS990ScheduleA_Checkbox" type="checkbox" alt="ParentSupportedOrgIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3FuncIntGrp/ParentSupportedOrgInd"/>
        <xsl:with-param name="BackupName">IRS990SchAForm990SchAType3FuncIntGrp</xsl:with-param>
      </xsl:call-template>
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV" style="width: 160mm;">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3FuncIntGrp/ParentSupportedOrgInd"/>
        <xsl:with-param name="BackupName">IRS990SchAForm990SchAType3FuncIntGrp</xsl:with-param>
      </xsl:call-template>
     The organization is the parent of each of its supported organizations. Complete<b> line 3</b> below.
    </label> 
  </div>
</div>
<!-- line 3 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="padding-left:5mm;">c</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input  class="IRS990ScheduleA_Checkbox" type="checkbox" alt="GovernmentalEntityIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3FuncIntGrp/GovernmentalEntityInd"/>
        <xsl:with-param name="BackupName">IRS990SchAForm990SchAType3FuncIntGrp</xsl:with-param>
      </xsl:call-template>
    </input>
  </div>
  <div class="IRS990ScheduleA_LineDescIV" style="width: 168mm;">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3FuncIntGrp/GovernmentalEntityInd"/>
        <xsl:with-param name="BackupName">IRS990SchAForm990SchAType3FuncIntGrp</xsl:with-param>
      </xsl:call-template>
      The organization supported a governmental entity. Describe in <b>Part VI</b> how you supported a government entity (see instructions)
      </label> 
  </div>
</div>
  <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-left:1mm;padding-top:5mm;">2</div>
            <div class="styLNDesc" style="width: 155mm;padding-top:5mm;">Activities Test.<b> Answer (a) and (b) below.</b></div> 
           
          
          </div>
           <div style="width: 187mm">
					<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width: 155mm;height:4.5mm;"/>
                        	<div class="styLNRightNumBox" style="height:4.5mm;border-left:0px;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-top-width: 1px;">Yes</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-top-width: 1px;">No</div>
						
					    </div>
					    <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:5mm;">a</div>
					<div class="styLNDesc" style="width: 155mm;height:12mm;">
         Did substantially all of the organization’s activities during the tax year directly further the exempt purposes of the supported
organization(s) to which the organization was responsive?
         <i>If "Yes," then in <b>Part VI identify those supported
organizations and explain</b> how these activities directly furthered their exempt purposes, how the organization was
responsive to those supported organizations, and how the organization determined that these activities constituted
substantially all of its activities.</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:12mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:12mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:12mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3FuncIntGrp/ActivitiesFurtherExemptPrpsInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3FuncIntGrp/ActivitiesFurtherExemptPrpsInd"/>
              </xsl:call-template>
						</div>
					</div>
					
				<div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:5mm;">b</div>
					<div class="styLNDesc" style="width: 155mm;height:10mm;">
         Did the activities described in (a) constitute activities that, but for the organization’s involvement, one or more of the
organization’s supported organization(s) would have been engaged in?
         <i>If "Yes," explain in <b>Part VI </b>the reasons for the
organization’s position that its supported organization(s) would have engaged in these activities but for the organization’s
involvement.</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:10mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:10mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3FuncIntGrp/ActivitiesEngagedOrgInvlmntInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3FuncIntGrp/ActivitiesEngagedOrgInvlmntInd"/>
              </xsl:call-template>
						</div>
					</div>	
 
 <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="padding-left:1mm;">3</div>
            <div class="styLNDesc" style="width: 155mm;height:4.5mm;">
       <!-- <span class="styIRS990AUnderlinedText" style=" width: 50mm;">-->Parent of Supported Organizations.<b> Answer (a) and (b) below.</b> 
                      
                         </div>
            <div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey;">
							
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:5mm;">a</div>
            <div class="styLNDesc" style="width:155mm;height:7.5mm;">
              Did the organization have the power to regularly appoint or elect a majority of the officers, directors, or trustees of each of
the supported organizations?
         <i>Provide details in <b>Part VI.</b></i>
               </div>
           <div class="styLNRightNumBox" style="height:7.5mm;">3a</div>
						<div class="styLNRightNumBox" style="height:7.5mm;">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3FuncIntGrp/AppointElectMajorityOfficerInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3FuncIntGrp/AppointElectMajorityOfficerInd"/>
              </xsl:call-template>
						</div>
					</div>	
              
          <div style="width: 187mm">
					<div class="styLNLeftNumBox" style="padding-left:5mm;">b</div>
					<div class="styLNDesc" style="width: 155mm;height:4.5mm;">
          Did the organization exercise a substantial degree of direction over the policies, programs and activities of each of its
supported organizations?
         <i>If "Yes," describe in <b>Part VI.</b> the role played by the organization in this regard.</i>
  </div>
     
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey;">
							<span style="width: 1px"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color: lightgrey"></div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="width: 155mm">
													</div>
						<div class="styLNRightNumBox">3b</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3FuncIntGrp/ExerciseDirectionPoliciesInd"/>
              </xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							 <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$FormData/Form990SchAType3FuncIntGrp/ExerciseDirectionPoliciesInd"/>
              </xsl:call-template>
						</div>
					</div>	
                 <div class="styBB" style="width:187mm;"/>
            <!--Page Footer Part III-->
<div class="pageEnd" style="width:187mm">
  <div style="float:right;">
    <span style="width:80px;"/>  
    <span class="styBoldText"> Schedule A (Form 990 or 990-EZ) 2017</span> 
  </div>  
</div>
<p style="page-break-before: always"/>
 <!-- Page Header -->
  <div class="styBB" style="width:187mm; padding-bottom:.5mm;">  
    <div style="float:left;">Schedule A (Form 990 or 990-EZ) 2017</div>
    <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">6</span></div>                    
  </div>  
          
        <!--<tr>
           <div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="padding-left:3mm;">1</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/TrustIntegralPartTestInd"/>
      </xsl:call-template>                                                                     
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/TrustIntegralPartTestInd"/>
      </xsl:call-template>
      Check here if the organization satisfied the Integral Part Test as a qualifying trust on Nov.
20, 1970. <b>See instructions.</b> All other <span style="width:155mm;text-align:left">Type III non-functionally integrated supporting organizations must complete Sections A through E.</span>
       </label>
  </div>
</div>    -->
        <div class="styBB" style="width:187mm;float:none;">
        <div class="styBB" style="width:187mm;"/>
        <div class="styPartName" style="float:left;height:auto">Part V</div>
          <div class="styPartDesc" style="width:155mm;text-align:left;height:4.5mm;"> Type III Non-Functionally Integrated 509(a)(3) Supporting Organizations </div>
     
      
     <tr>
           <div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="padding-left:3mm;">1</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="IRS990SchATrustIntegralPartTestIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/TrustIntegralPartTestInd"/>
        <xsl:with-param name="BackupName">IRS990SchATrustIntegralPartTestInd</xsl:with-param>
      </xsl:call-template>                                                                     
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/TrustIntegralPartTestInd"/>
        <xsl:with-param name="BackupName">IRS990SchATrustIntegralPartTestInd</xsl:with-param>
      </xsl:call-template>
      Check here if the organization satisfied the Integral Part Test as a qualifying trust on Nov.
20, 1970 (explain in Part VI). <b>See instructions.</b> All other Type III non-functionally integrated supporting organizations must complete Sections A through E.
       </label>
  </div>
</div>

   </tr>  
   </div>
     
     <!-- <span style="width:5px;"/>1.<span class="styIRS990AUnderlinedText" style="text-align: center; width: 10mm; font-size: 6pt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrustIntegralPartTestInd"/>
											</xsl:call-template>
										</span>   
										<span style="width:5px;"/> Check here if the organization satisfied the Integral Part Test as a qualifying trust on Nov.
20, 1970. <b>See instructions.</b> All other <span style="width:155mm;text-align:left">Type III non-functionally integrated supporting organizations must complete Sections A through E.</span>
          </div>-->
      
            
 
        
        
    
       <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
           
             <tr>
                
            <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;border-top-width: 1px;"></td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;" colspan="3">
              <span class="styBoldText" style="font-size:8pt;font-weight:bold; padding-top:1mm;"> Section A - Adjusted Net Income</span>  
         </td>
           
                
                <td class="styLNLeftNumBox" style="height:7.5mm;"></td>
                <td class="styLNAmountBox" style="height:7.5mm;font-family:'Arial';text-align:center;border-top-width: 0px; padding-top:1mm;">
                  (A) Prior Year
                  <span style="width:1px;"/>
                </td>
                
                <td class="styLNAmountBox" style="height:7.5mm;font-family:'Arial';text-align:center;border-top-width: 0px; padding-top:1mm;">
                (B) Current Year <br></br>(optional)
                  <span style="width:1px;"/>
                </td>
              </tr>
            
             <tr>
           
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-top-width: 1px;border-style: solid; border-color: black; border-top-width: 1px;border-bottom-width: 1px;border-left:0px;border-right:0px;">1</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 1px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">
                <!-- An underline is required here but it will not align with Amt Box line so need to change entire section to Table -->
                <!--<span class="styIRS990AUnderlinedText" style=" width: 125mm;">-->Net short-term capital gain
         
                 <!-- </span>-->
                </td>
                <td class="styLNRightNumBox" style="height:4.3mm;border-top-width: 1px">1</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/NetSTCapitalGainAdjNetIncmGrp/PriorYearAmt"/>
                  </xsl:call-template>
                 
                </td>
                
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/NetSTCapitalGainAdjNetIncmGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">2</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Recoveries of prior-year distributions
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">2</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/RecoveriesPYDistributionsGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
               <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/RecoveriesPYDistributionsGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">3</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Other gross income (see instructions)
                                         <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">3</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/OtherGrossIncomeGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/OtherGrossIncomeGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">4</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Add lines 1 through 3
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">4</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/AdjustedGrossIncomeGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/AdjustedGrossIncomeGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
            <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">5</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Depreciation and depletion
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">5</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/DepreciationDepletionGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/DepreciationDepletionGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:10.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">6</td>
                <td class="styLNDesc" style="width:107mm;height:10.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Portion of operating expenses paid or incurred for
production or collection of gross income or for
management, conservation, or maintenance of property
held for production of income (see instructions)
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:10.5mm;">6</td>
                <td class="styLNAmountBox" style="height:10.5mm;font-family:'Arial';padding-top:7mm;">
                <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/ProductionIncomeGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:10.5mm;font-family:'Arial';padding-top:7mm;">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/ProductionIncomeGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">7</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Other expenses (see instructions)
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">7</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/OtherExpensesGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/OtherExpensesGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">8</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3"><b>Adjusted Net Income</b> (subtract lines 5, 6 and 7 from
line 4)
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">8</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/TotalAdjustedNetIncomeGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedNetIncomeGrp/TotalAdjustedNetIncomeGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>  
             </table>
          <div class="styBB" style="width:187mm;"/>
            

          
           <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
            
              <!-- Begin Part V -->
              <tr>
                
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-top-width: 1px"></td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;" colspan="3">
           <span class="styBoldText" style="font-size:8pt;font-weight:bold;">Section B - Minimum Asset Amount</span>
                </td>
                <td class="styLNLeftNumBox" style="height:7.5mm;"></td>
                <td class="styLNAmountBox" style="height:7.5mm;font-family:'Arial';text-align: center;">
                  (A) Prior Year
                  <span style="width:1px;"/>
                </td>
                
                <td class="styLNAmountBox" style="height:7.5mm;font-family:'Arial';text-align: center;">
                (B) Current Year<br></br>(optional)
                  <span style="width:1px;"/>
                </td>
              </tr>
               <tr>
                <td class="styLNLeftNumBox" style="height:7.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 1px;border-bottom-width: 1px;border-left:0px;border-right:0px;">1</td>
                <td class="styLNDesc" style="width:107mm;height:7.5mm;border-style: solid; border-color: black; border-top-width: 1px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Aggregate fair market value of all non-exempt-use
assets (see instructions for short tax year or assets held for part of year):
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                <td class="styLNRightNumBox" style="height:7.5mm;border-top-width: 1px;padding-top:3mm;">1</td>
                <td class="styLNAmountBox" style="height:7.5mm;font-family:'Arial';background-color:lightgrey; ">
                 
                  <span style="width:1px;"/>
                </td>
                
                <td class="styLNAmountBox" style="height:7.5mm;font-family:'Arial';background-color:lightgrey; ">
                
               
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">a</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Average monthly value of securities
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">1a</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/AverageMonthlyFMVOfSecGrp//PriorYearAmt"/>
                  </xsl:call-template>
                  
                  <span style="width:1px;"/>
                </td>
                
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
               <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/AverageMonthlyFMVOfSecGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">b</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Average monthly cash balances
                                         <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">1b</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/AverageMonthlyCashBalancesGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/AverageMonthlyCashBalancesGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">c</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Fair market value of other non-exempt-use assets
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">1c</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/FMVOtherNonExemptUseAssetGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/FMVOtherNonExemptUseAssetGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
            <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">d</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3"><b>Total</b> (add lines 1a, 1b, and 1c)
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">1d</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/TotalFMVOfNonExemptUseAssetGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/TotalFMVOfNonExemptUseAssetGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
             <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm;">e</td>
                <td class="styLNDesc" style="width:107mm;height:auto;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3"><b>Discount </b>claimed for blockage or other factors<br></br>
(explain in detail in Part VI):
            <span style="width: 0mm"/><span class="styIRS990AUnderlinedText" style="text-align: right; width: 32mm; font-size: 6pt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/DiscountClaimedAmt"/>
											</xsl:call-template>
										</span>
                </td>
                 <td class="styLNRightNumBox" style="height:7.5mm;border-top-width: 0px;border-left-width: 1px;background-color:lightgrey;"></td>
                <td class="styLNAmountBox" style="height:7.5mm;font-family:'Arial'; background-color:lightgrey;">
                   <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:7.5mm;font-family:'Arial'; background-color:lightgrey;">
                   <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">2</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Acquisition indebtedness applicable to non-exempt use
assets
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">2</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/AcquisitionIndebtednessGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/AcquisitionIndebtednessGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">3</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Subtract line 2 from line 1d
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">3</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/AdjustedFMVLessIndebtednessGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/AdjustedFMVLessIndebtednessGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>  
              <tr>
                <td class="styLNLeftNumBox" style="height:auto;padding-left:3mm;">4</td>
                <td class="styLNDesc" style="width:107mm;height:auto;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Cash deemed held for exempt use. Enter 1-1/2% of
line 3 (for greater amount, see instructions).
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">4</td>
                <td class="styLNAmountBox" style="height:7.5mm;font-family:'Arial';padding-top:0mm;">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/CashDeemedCharitableGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:7.5mm;font-family:'Arial';padding-top:0mm;">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/CashDeemedCharitableGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:auto;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">5</td>
                               <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Net value of non-exempt-use assets (subtract line 4
from line 3)
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">5</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/NetVlNonExemptUseAssetsGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/NetVlNonExemptUseAssetsGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">6</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Multiply line 5 by .035
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">6</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/PctOfNetVlNonExemptUseAstGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/PctOfNetVlNonExemptUseAstGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">7</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Recoveries of prior-year distributions
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">7</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/RecoveriesPYDistriMinAssetGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/RecoveriesPYDistriMinAssetGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">8</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3"><b>Minimum Asset Amount </b> (add line 7 to line 6)
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">8</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/TotalMinimumAssetGrp/PriorYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MinimumAssetAmountGrp/TotalMinimumAssetGrp/CurrentYearAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
            
          </table>
           <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
            <div class="styBB" style="width:187mm;">
             </div>
                  
              <tr>
                
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;border-top-width: 1px"></td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;" colspan="3">
                
           <span class="styBoldText" style="font-size:8pt;font-weight:bold;">Section C - Distributable Amount</span></td>
           
                
                <td class="styLNLeftNumBox" style="height:4.5mm;"></td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';text-align:center;border-top-width: 0px;background-color:lightgrey">
                  
                  <span style="width:1px;"/>
                </td>
                
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';text-align:center;border-top-width: 0px">
               Current Year 
                  <span style="width:1px;"/>
                </td>
              </tr>
           <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 1px;border-bottom-width: 1px;border-left:0px;border-right:0px;">1</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width:1px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Adjusted net income for prior year (from Section A,
line 8, Column A)
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
               <td class="styLNRightNumBox" style="height:4.5mm;border-left-width: 1px;border-top-width: 1px">1</td>
                <!--<div class="styLNRightNumBox" style="height:4.5mm;border-left-width: 1px;border-top-width: 1px"/>-->
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial'; background-color:lightgrey">
                  
                  <span style="width:1px;"/>
                </td>
                
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
               <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/CYAdjNetIncomeDistributableAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">2</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Enter 85% of line 1
                                         <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">2</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial'; background-color:lightgrey">
                 
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/CYPct85AdjustedNetIncomeAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">3</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Minimum asset amount for prior year (from Section B,
line 8, Column A)
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">3</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial'; background-color:lightgrey">
                 
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/CYTotalMinAstDistributableAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
            <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">4</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Enter greater of line 2 or line 3
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">4</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial'; background-color:lightgrey">
                 
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/CYGreaterAdjustedMinimumAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
          <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">5</td>
                <td class="styLNDesc" style="width:107mm;height:4.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3">Income tax imposed in prior year
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:4.5mm;">5</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial'; background-color:lightgrey">
                 
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                 <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/CYIncomeTaxImposedPYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:7.5mm;padding-left:3mm;padding-bottom:3mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;">6</td>
                <td class="styLNDesc" style="width:107mm;height:7.5mm;border-style: solid; border-color: black; border-top-width: 0px;border-bottom-width: 1px;border-left:0px;border-right:0px;" colspan="3"><b>Distributable Amount.</b> Subtract line 5 from line 4,
unless subject to emergency temporary reduction (see
instructions)
            <!--Dotted Line-->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                 <td class="styLNRightNumBox" style="height:7.5mm;">6</td>
                <td class="styLNAmountBox" style="height:7.5mm;font-family:'Arial'; background-color:lightgrey">
                 
                  <span style="width:1px;"/>
                </td>
               
                <td class="styLNAmountBox" style="height:7.5mm;font-family:'Arial';padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/CYDistributableAsAdjustedAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              
               </table>
          <tr>
           <div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="padding-left:3mm;">7</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox" alt="FirstYearType3NonFuncIndChecked">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/FirstYearType3NonFuncInd"/>
        <xsl:with-param name="BackupName">IRS990SchADistributableAmountGrp</xsl:with-param>
      </xsl:call-template>                                                                     
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/FirstYearType3NonFuncInd"/>
         <xsl:with-param name="BackupName">IRS990SchADistributableAmountGrp</xsl:with-param>
      </xsl:call-template>
      Check here if the current year is the organization's first as a non-functionally-integrated Type III supporting organization (see instructions)
       </label>
  </div>
</div> 
           <!--     <td class="styLNLeftNumBox" style="height:7.5mm;padding-left:3mm;">7</td>
                <td class="styLNDesc" style="width:187mm;height:7.5mm;text-align:left;" >
                <span class="styIRS990AUnderlinedText" style="width: 10mm; font-size: 6pt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/DistributableAmountGrp/FirstYearType3NonFuncInd"/>
											</xsl:call-template>
										</span>  Check here if the current year is the organization's first as a non-functionally-integrated Type III supporting organization (see instructions)
            
                </td>-->
              </tr>
           
         
          
        <div class="styBB" style="width:187mm;"/>
        <!--Page Footer Part III-->
<div class="pageEnd" style="width:187mm">
  <div style="float:right;">
    <span style="width:80px;"/>  
    <span class="styBoldText"> Schedule A (Form 990 or 990-EZ) 2017</span> 
  </div>  
</div>
<p style="page-break-before: always"/>
 <!-- Page Header -->
  <div class="styBB" style="width:187mm; padding-bottom:.5mm;">  
    <div style="float:left;">Schedule A (Form 990 or 990-EZ) 2017</div>
    <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">7</span></div>                    
  </div>  
  
  
  <!--<xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$FormData/DistributionsGrp"/>              
              <xsl:with-param name="containerHeight" select="20"/>
              <xsl:with-param name="containerID" select="'DISctn'"/>
          </xsl:call-template> -->
 
					<div class="styTableContainer" style="border-top-width: 0px; width: 187mm;height:auto" id="DISctn">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<div class="styPartName" style="float:left;height:auto">Part V</div>
     <div class="styPartDesc" style="width:155mm;text-align:left;">Type III Non-Functionally Integrated 509(a)(3) Supporting Organizations (continued)</div>
     
								<tr>
								<th scope="col" class="styTableCellHeader" colspan="2" style="font-size: 8pt; width: 150mm; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 1px;text-align:left;">
										<span class="styTableCellPad"/>Section D - Distributions 
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 37mm;border-top-width:1px; border-right-width: 0px; ">
        							<span class="styBoldText">Current Year</span>
									</th>
								</tr>
							
							
							
								<tr>
									<td class="styTableCell" style="padding-top:2mm;height:5.5mm;text-align:left; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width: 1px; width: 150mm" colspan="2">
										<span class="styBoldText" style="padding-left:1.5mm">1</span>
										<span style="width: 2mm"/>
         Amounts paid to supported organizations to accomplish exempt purposes</td>
									<td class="styTableCellSmall" style="width: 37mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributionsGrp/CYPaidAccomplishExemptPrpsAmt"/>
                  </xsl:call-template>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="padding-top:2mm;height:5.5mm;text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 150mm" colspan="2">
										<span class="styBoldText" style="padding-left:1.5mm">2</span>
										<span style="width: 2mm"/>
        Amounts paid to perform activity that directly furthers exempt purposes of supported organizations, in <br></br><span style="width: 6mm"/>excess of income from activity</td>
									<td class="styTableCellSmall" style="width: 37mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributionsGrp/CYPdInExcessIncomeActivityAmt"/>
                  </xsl:call-template>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="padding-top:2mm;height:5.5mm;text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 150mm" colspan="2">
										<span class="styBoldText" style="padding-left:1.5mm">3</span>
										<span style="width: 2mm"/>
        Administrative expenses paid to accomplish exempt purposes of supported organizations</td>
									<td class="styTableCellSmall" style="width: 37mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributionsGrp/CYAdministrativeExpensePaidAmt"/>
                  </xsl:call-template>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="padding-top:2mm;height:5.5mm;text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 150mm" colspan="2">
										<span class="styBoldText" style="padding-left:1.5mm">4</span>
										<span style="width: 2mm"/>
         Amounts paid to acquire exempt-use assets</td>
									<td class="styTableCellSmall" style="width: 37mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributionsGrp/ExemptUseAssetsAcquisPaidAmt"/>
                  </xsl:call-template>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="padding-top:2mm;height:5.5mm;text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 150mm" colspan="2">
										<span class="styBoldText" style="padding-left:1.5mm">5</span>
										<span style="width: 2mm"/>
         Qualified set-aside amounts (prior IRS approval required)</td>
									<td class="styTableCellSmall" style="width: 37mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributionsGrp/QualifiedSetAsideAmt"/>
                  </xsl:call-template>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="padding-top:2mm;height:5.5mm;text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 150mm" colspan="2">
										<span class="styBoldText" style="padding-left:1.5mm">6</span>
										<span style="width: 2mm"/>
         Other distributions (describe in <b>Part VI</b>). See instructions</td>
									<td class="styTableCellSmall" style="width: 37mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributionsGrp/CYOtherDistributionsAmt"/>
                  </xsl:call-template>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="padding-top:2mm;height:5.5mm;text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 150mm" colspan="2">
										<span class="styBoldText" style="padding-left:1.5mm">7</span>
										<span style="width: 2mm"/>
        <b>Total annual distributions.</b>  Add lines 1 through 6.</td>
									<td class="styTableCellSmall" style="width: 37mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributionsGrp/CYTotalAnnualDistributionsAmt"/>
                  </xsl:call-template>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="padding-top:2mm;height:5.5mm;text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 150mm" colspan="2">
										<span class="styBoldText" style="padding-left:1.5mm">8</span>
										<span style="width: 2mm"/>
         Distributions to attentive supported organizations to which the organization is responsive (provide <br></br><span style="width: 6mm"/>details in <b>Part VI</b>). See instructions</td>
									<td class="styTableCellSmall" style="width: 37mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributionsGrp/CYDistriAttentiveSuprtOrgAmt"/>
                  </xsl:call-template>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="padding-top:2mm;height:5.5mm;text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 150mm" colspan="2">
										<span class="styBoldText" style="padding-left:1.5mm">9</span>
										<span style="width: 2mm"/>
        Distributable amount for 2017 from Section C, line 6</td>
									<td class="styTableCellSmall" style="width: 37mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributionsGrp/CYDistributableAsAdjustedAmt"/>
                  </xsl:call-template>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="padding-top:2mm;height:5.5mm;text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 150mm" colspan="2">
										<span class="styBoldText" style="padding-left:1mm">10</span>
										<span style="width: 0mm"/>
         Line 8 amount divided by Line 9 amount</td>
									<td class="styTableCellSmall" style="width: 39mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;font-size:6pt;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$FormData/DistributionsGrp/CYDistributionYrRt"/>
                  </xsl:call-template>
									</td>
									</tr>
									
							        </table>
							      <!--  <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$FormData/DistributionsGrp"/>
            <xsl:with-param name="containerHeight" select="10"/>
            <xsl:with-param name="containerID" select="'DISctn'"/>
 </xsl:call-template>-->
													
															
															<table class="styTable" style="font-size: 7pt; border-color:black;width:187mm;" cellspacing="0">
						<tr>
				<th scope="col" class="styTableCellHeader" colspan="2" style="font-size: 8pt;width: 76mm; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 1px">
					<span class="styTableCellPad"/>Section E - Distribution Allocations (see instructions)
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 37mm;border-top-width: 1px">
       <b> (i)</b><br/>
										<span class="styNormalText"><b>Excess Distributions</b></span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 37mm;border-top-width: 1px">
       <b>(ii)</b> <br/>
										<span class="styNormalText"><b>Underdistributions</b><br></br><b> Pre-2017</b></span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 37mm;border-top-width: 1px;border-right-width:0px">
       <b>(iii)</b> <br/>
										<span class="styNormalText"><b>Distributable</b> <br></br><b>Amount for 2017</b></span>
									</th>
								
								</tr>
							
							
							
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 1.5mm">1</span>
										<span style="width: 1mm"/>
        Distributable amount for 2017 from Section C, line<br></br><span style="width: 5mm"/>6
        </td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px;padding-top:3mm;">
										<span class="styTableCellPad "/>
									<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/CYDistributableAsAdjustedAmt"/>
									  </xsl:call-template>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 1.5mm">2</span>
										<span style="width: 1mm"/>
         Underdistributions, if any, for years prior to 2017 <span style="padding-left: 7mm"/>(reasonable cause required-- explain in Part VI). <br></br><span style="padding-left: 7mm"/>See instructions.</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm;  border-bottom-width: 1px;padding-top:4mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/UnderdistributionsAmt"/>
									  </xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-right-width:0px">
										<span class="styTableCellPad"/>
										
									</td>
									
								</tr>
								
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 1.5mm">3</span>
										<span style="width: 1mm"/>
        Excess distributions carryover, if any, to 2017:</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px; background-color:lightgrey;">
										<span class="styTableCellPad "/>
										
									</td>
									
								</tr>
								<tr>
						<td class="styTableCell" style="background-color:lightgrey;text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">a</span>
										<span style="width: 1.5mm"/>
       <!-- From 2009<span class="styDotLn" style="float:none; clear:none">.......</span><span class="styIRS990AUnderlinedText" style="text-align: center; width: 20mm; font-size: 7pt">X
											
										</span> -->
         </td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px;background-color:lightgrey;">
										<span class="styTableCellPad "/>
									</td>
									
								</tr>
								<tr>
						<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">b</span>
										<span style="width: 1.5mm"/>
      From 2013<span class="styDotLn" style="float:none; clear:none">.......</span><span class="styIRS990AUnderlinedText" style="text-align: center; width: 20mm; font-size: 7pt">
											<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/ExcessDistributionCyovYr4Amt"/>
									  </xsl:call-template>
										</span> 
         </td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px;background-color:lightgrey;">
										<span class="styTableCellPad "/>
									</td>
									
								</tr>
								<tr>
						<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">c</span>
										<span style="width: 1.5mm"/>
     From 2014<span class="styDotLn" style="float:none; clear:none">.......</span><span class="styIRS990AUnderlinedText" style="text-align: center; width: 20mm; font-size: 7pt">
											<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/ExcessDistributionCyovYr3Amt"/>
									  </xsl:call-template>
										</span>
         </td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px;background-color:lightgrey;">
										<span class="styTableCellPad "/>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">d</span>
										<span style="width: 1.5mm"/>
       From 2015<span class="styDotLn" style="float:none; clear:none">.......</span><span class="styIRS990AUnderlinedText" style="text-align: center; width: 20mm; font-size: 7pt">
											<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/ExcessDistributionCyovYr2Amt"/>
									  </xsl:call-template>
										</span> 
         </td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px;background-color:lightgrey;">
										<span class="styTableCellPad "/>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">e</span>
										<span style="width: 1.5mm"/>
        From 2016<span class="styDotLn" style="float:none; clear:none">.......</span><span class="styIRS990AUnderlinedText" style="text-align: center; width: 20mm; font-size: 6pt"><xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/ExcessDistributionCyovYr1Amt"/>
									  </xsl:call-template>
											
										</span> 
        
         </td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px;background-color:lightgrey;">
										<span class="styTableCellPad "/>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">f</span>
										<span style="width: 1.5mm"/><b>Total</b> of lines 3a through e
         </td>
									<td class="styTableCellSmall" style="width: 37mm;  border-bottom-width: 1px">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/TotalExcessDistributionCyovAmt"/>
									  </xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px; background-color:lightgrey; ">
										<span class="styTableCellPad "/>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">g</span>
										<span style="width: 1.5mm"/>
       Applied to underdistributions of prior years
         </td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
										 <xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/CyovAppliedUnderdistriPYAmt"/>
									  </xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px;background-color:lightgrey;">
										<span class="styTableCellPad "/>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">h</span>
										<span style="width: 1.5mm"/>
        Applied to 2017 distributable amount
         </td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px">
										<span class="styTableCellPad "/>
										<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/CyovAppliedUnderdistrCPYAmt"/>
									  </xsl:call-template>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">i</span>
										<span style="width: 1.5mm;"/>
        Carryover from 2012 not applied (see <br></br><span style="width: 6mm;"/>instructions)
         </td>
									<td class="styTableCellSmall" style="width: 37mm; border-bottom-width: 1px;background-color:lightgrey; ">
										<span class="styTableCellPad"/>
										<!-- IBM wrote up saying take out shading and that it should populate this field, then reversed their opinion per PDF -->
									<!--	<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/CarryoverPYNotAppliedAmt"/>
									  </xsl:call-template>-->
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px; background-color:lightgrey;">
										<span class="styTableCellPad "/>
										
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2mm">j</span>
										<span style="width: 1mm;"/> Remainder. Subtract lines 3g, 3h, and 3i from 3f.
         </td>
									<td class="styTableCellSmall" style="width: 37mm; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/ExcessDistributionCyovAmt"/>
									  </xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px; background-color:lightgrey;">
										<span class="styTableCellPad "/>
									</td>
									
								</tr>
								
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 1.0mm">4</span>
										<span style="width: 1mm"/>Distributions for 2017 from Section D, line 7:</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 0px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width:0px;border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span style="width: 5.5mm"/>
         										<span style="width: 0mm"/>$ <span class="styIRS990AUnderlinedText" style="text-align: right; width: 32mm; font-size: 7pt">
											<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/CYTotalAnnualDistributionsAmt"/>
									  </xsl:call-template>
										</span>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width:1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width:1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width:1px;border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">a</span>
										<span style="width: 1mm"/>
         Applied to underdistributions of prior years</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; ">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/CYDistribAppUnderdistriPYAmt"/>
									  </xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; font-size: 6pt;background-color:lightgrey;border-right-width:0px">
										</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">b</span>
										<span style="width: 1mm"/>
         Applied to 2017 distributable amount
          
										</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; padding-top:2mm; font-size: 6pt;background-color:lightgrey">
										<span style="padding-right: 4mm">
											</span>
										</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/CYDistriAppDistributableAmt"/>
									  </xsl:call-template>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">c</span>
										<span style="width: 1mm"/>
         Remainder. Subtract lines 4a and 4b from 4.
									</td>
									<td class="styTableCellSmall" style="width: 37mm; padding-top: 2mm; font-size: 6pt">
										<span style="padding-right: 4mm">
											</span>
										<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/ExcessDistributionAmt"/>
									  </xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey;border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
									
								</tr>
								
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left:1mm">5</span>
										<span style="width: 1mm"/>
         Remaining underdistributions for years prior to<br></br><span style="width: 5mm"/> 2017, if any. Subtract lines 3g and 4a from line 2.<br></br><span style="width: 6mm"/>If the amount is greater than zero, explain in Part VI. <br></br><span style="width: 6mm"/>See instructions.</td>
									<td class="styTableCellSmall" style="width: 37mm; font-size: 6pt;background-color:lightgrey;">
										</td>
									<td class="styTableCellSmall" style="width: 37mm;padding-top:6mm ">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/RemainingUnderdistriPYAmt"/>
									  </xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey;border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left:1mm">6</span>
										<span style="width: 1mm"/>
         Remaining underdistributions for 2017. Subtract <br></br><span style="width: 6mm"/>lines 3h and 4b from line 1. If the amount is greater <br></br><span style="width: 5mm"/> than zero, explain in Part VI. See instructions.</td>
									<td class="styTableCellSmall" style="width: 37mm; font-size: 6pt;background-color:lightgrey;">
										</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; padding-top:6mm;border-right-width:0px">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/RemainingUnderdistriCYAmt"/>
									  </xsl:call-template>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left:1mm">7</span>
										<span style="width: 1mm"/>
        <b> Excess distributions carryover to 2018.</b> Add lines <br></br><span style="width: 5mm"/>3j and 4c.</td>
									<td class="styTableCellSmall" style="width: 37mm; font-size: 7pt;padding-top:5mm">
										<xsl:call-template name="PopulateAmount">
									  <xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/ExcessDistriCyovToNextYrAmt"/>
									  </xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey;border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left:1mm">8</span>
										<span style="width: 1mm"/>
        Breakdown of line 7:</td>
									<td class="styTableCellSmall" style="width: 37mm; font-size: 6pt;background-color:lightgrey">
										
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey;border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
									
								</tr>
								<tr>
							<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">a</span>
										<span style="width: 1.5mm"/>
       Excess from 2013<span class="styDotLn" style="float:none; clear:none">......</span><span class="styIRS990AUnderlinedText" style="text-align: center; width: 20mm; font-size: 7pt">
											<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/ExcessFromYear5Amt"/>
										</xsl:call-template>	
										</span>
         </td>
         
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:1px;background-color:lightgrey;border-right-width:0px">
										<span class="styTableCellPad "/>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">b</span>
										<span style="width: 1.5mm"/>
        Excess from 2014<span class="styDotLn" style="float:none; clear:none">.....</span><span class="styIRS990AUnderlinedText" style="text-align: center; width: 20mm; font-size: 7pt">
											<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/ExcessFromYear4Amt"/>
										</xsl:call-template>	
										</span>
         </td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px;background-color:lightgrey;">
										<span class="styTableCellPad "/>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">c</span>
										<span style="width: 1.5mm"/>
       Excess from 2015<span class="styDotLn" style="float:none; clear:none">.....</span><span class="styIRS990AUnderlinedText" style="text-align: center; width: 20mm; font-size: 7pt">
                                         <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/ExcessFromYear3Amt"/>
										</xsl:call-template>	
											
										</span> 
         </td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px;background-color:lightgrey;">
										<span class="styTableCellPad "/>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">d</span>
										<span style="width: 1.5mm"/>
       Excess from 2016<span class="styDotLn" style="float:none; clear:none">.....</span><span class="styIRS990AUnderlinedText" style="text-align: center; width: 20mm; font-size: 7pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/ExcessFromYear2Amt"/>
										</xsl:call-template>	
										</span> 
       
         </td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px;background-color:lightgrey;">
										<span class="styTableCellPad "/>
									</td>
									
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px; width: 76mm" colspan="2">
										<span class="styBoldText" style="padding-left: 2.5mm">e</span>
										<span style="width: 1.5mm"/>
       Excess from 2017<span class="styDotLn" style="float:none; clear:none">.....</span><span class="styIRS990AUnderlinedText" style="text-align: center; width: 20mm; font-size: 7pt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DistributionAllocationsGrp/ExcessFromYear1Amt"/>
										</xsl:call-template>	
										</span> 
        
         </td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; background-color:lightgrey; border-bottom-width: 1px">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 37mm; border-right-width:0px;background-color:lightgrey;">
										<span class="styTableCellPad "/>
									</td>
									
								</tr>
							
						</table>
					</div>
  
  
        
       
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float:right">
    <span class="styBoldText" style="font-size: 7pt">Schedule A (Form 990 or 990-EZ)</span> (2017)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
				<p style="page-break-before: always"/>	
				<!-- Page Header -->
  <div class="styBB" style="width:187mm; padding-bottom:.5mm;">  
    <div style="float:left;">Schedule A (Form 990 or 990-EZ) 2017</div>
    <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">8</span></div>                    
  </div>  	
					
					
					
					
					
					
					
			<!--		<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 990-PF (2013)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">7</span>
						</div>
					</div>-->
					<!--END HEADER--> 
             
<!-- Part VI header-->
<div class="styBB" style="width:187mm;float:none;border-top-width:1px">
  <div class="styPartName" style="width: 15mm;height:auto;display:table;">Part VI</div>
  <span style="font-size:7pt;padding-left:2mm;width: 170mm;"><b>Supplemental Information.</b>
			
		 
  Provide the explanations required by Part II, line 10; Part II, line 17a or 17b; Part III, line 12; Part IV, Section A, lines 1, 2, 3b, 3c, 4b, 4c, 5a, 6, 9a, 9b, 9c, 11a, 11b, and 11c; Part IV, Section B, lines 1 and 2; Part IV, Section C, line 1; Part IV, Section D, lines 2 and 3; Part IV, Section E, lines 1c, 2a, 2b, 3a and 3b; Part V, line 1; Part V, Section B, line 1e; Part V Section D, lines 5, 6, and 8; and Part V, Section E, lines 2, 5, and 6. Also complete this part for any additional information. (See instructions).</span>
  </div>
 
  
<!--*********FactsAndCircumstancesTest******************************************-->
   <table id="GEPATbl" class="styDepTbl" style="margin-top:4mm; font-size:8pt; font-family:Arial">
          <thead class="styTableThead">
            <tr class="styDepTblHdr">
             <th class="styDepTblCell" scope="col">Facts And Circumstances Test</th>
            </tr>
          </thead>
          <tfoot/>
          
       <tr>
           <td class="styDepTblCell" align="left" valign="top">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormData/FactsAndCircumstancesTestTxt"/>
                  </xsl:call-template>
                </td>
          </tr>
       </table>
       <div class="styBB" style="width:187mm;padding-top:1mm;padding-bottom:1mm;clear:both; border-top:1 solid black;height:auto;">
       <!--***Return ReferenceandExplanationBEGIN****************-->
       <!-- button display logic To turn back on function change height to number of records-->
       <div class="styGenericDiv" style="float:right;"> 
<!--<xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleAPartVIGrp"/>              
              <xsl:with-param name="containerHeight" select="5"/>
              <xsl:with-param name="containerID" select="'SUPctn'"/>
          </xsl:call-template>-->
      <!-- end button display logic -->
</div>
</div>

<div class="styTableContainer" style="width:187mm;clear:all;height:auto;" id="SUPctn">
<!--<div class="styTableContainer" style="width: 187mm; border-bottom-width: 2px;">-->
<!--<xsl:call-template name="SetInitialState"/>-->
<table class="styTable" style="font-size: 7pt; border-color:black;height:auto;" cellspacing="0">
  <thead class="styTableThead">
   
    <tr class="styDepTblHdr">
          
          <!--<th class="styDepTblCell" scope="col" style="width:50mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Identifier</th>-->
          <th class="styDepTblCell" scope="col" style="width:50mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Return Reference</th>  
          <th class="styDepTblCell" scope="col" style="width:137mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Explanation</th>                
             

    </tr>
    
  </thead>
  <tfoot/>

  <tbody valign="top">
   <xsl:if test="($Print!=$Separated) or (($Print=$Separated) and (count($FormData/Form990ScheduleAPartVIGrp) &lt;20))">
      <xsl:for-each select="$FormData/Form990ScheduleAPartVIGrp">
          <tr>
    <!--  <td class="styTableCell" style="text-align:left;border-right-width: 1px; width:50mm; ">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="IdentifierTxt"/>
            </xsl:call-template>
      </td>-->
      <td class="styTableCell" style="text-align:left; border-right-width: 1px; width: 50mm;height:auto;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
              </xsl:call-template>
           </td>      
      <td class="styTableCell" style="text-align:left; border-right-width: 1px; width: 137mm;height:auto;">
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

<!--<xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleAPartVIGrp"/>
            <xsl:with-param name="containerHeight" select="5"/>
            <xsl:with-param name="containerID" select=" 'SUPctn' "/>
 </xsl:call-template>-->


 
    

 <!--Page Footer-->
<div class="pageEnd" style="width:187mm">
  <div style="float:right;">
    <span style="width:80px;"/>  
    <span class="styBoldText"> Schedule A (Form 990 or 990-EZ) 2017</span> 
  </div>  
</div>  
<!--END Page Footer-->

    <p style="page-break-before: always"/> 
<br/>
<!-- leftover data table -->
<div class="styLeftOverTitleLine" id="LeftoverData">
  <div class="styLeftOverTitle">
    Additional Data        
  </div>
  <div class="styLeftOverButtonContainer">
    <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
  </div>      
</div>  
<table class="styLeftOverTbl">
  <xsl:call-template name="PopulateCommonLeftover">
    <xsl:with-param name="TargetNode" select="$FormData"/>
    <xsl:with-param name="DescWidth" select="100"/>
  </xsl:call-template>
</table>

    <!-- Additonal Data Table for separated data from Part I, Line 4 -->
    <xsl:if test="($Print = $Separated) and (count($FormData/HospitalNameAndAddressGrp) &gt; 2) ">
      <span class="styRepeatingDataTitle">
        <br/>Form 990, Schedule A, Part I, Line 4 - A medical research organization operated in conjunction with a hospital. Section 170(b)(1)(A)(iii). Enter the hospital's name, city, and state:
      </span>
      <table class="styDepTbl" style="font-size:7pt">
        <thead class="styTableHead">
          <tr class="styDepTblHdr">
            <th scope="col" class="styDepTblCell">Hospital Name, City, and State</th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="$FormData/HospitalNameAndAddressGrp">
            <tr>
              <!--Define background colors to the rows -->
              <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <td class="styDepTblCell" style="text-align:left;font-size:7pt;">
              
              <span style="font-family:verdana;font-size:6pt;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="SupportedOrganizationName/BusinessNameLine1Txt"/>
                </xsl:call-template><br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="SupportedOrganizationName/BusinessNameLine2Txt"/>
                </xsl:call-template>
              </span>
                
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CityNm"/>
                </xsl:call-template>,<span style="width:3px"/>
                <xsl:choose>
                  <xsl:when test="Address/StateAbbreviationCd">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="CountryCd"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
    <!-- End Part I, Line 4 separated data -->
    
    
    
    <!-- Additonal Data Table for separated data from Part I, Line 12g -->
    <xsl:if test="($Print = $Separated) and (count($FormData/SupportedOrgInformationGrp) &gt; 2) ">
      <span class="styRepeatingDataTitle">
    <br/>Form 990, Sch A, Part I, Line 12g - Provide the following information about the supported organization(s).
      </span>
      <table class="styDepTbl" style="font-size:7pt">
        <thead class="styTableHead">
           <tr>
        <th class="IRS990ScheduleA_GenericCell" style="width:60mm;vertical-align:top;text-align:center;" scope="col" rowspan="2"><b>(i)</b><span class="styNormalText">Name of supported organization</span></th>
      						<!-- Column ii -->
       <th class="IRS990ScheduleA_GenericCell" style="vertical-align:top;text-align:center;width:20mm;padding-bottom:17mm;border-right-width:1px" scope="col" rowspan="2"><b>(ii)</b><span class="styNormalText"> EIN</span></th>
									<!-- Column iii -->
      <th class="IRS990ScheduleA_GenericCell" style="vertical-align:top;text-align:center;width:32mm;border-right-width:1px;" scope="col" rowspan="2"><b>(iii)</b><span class="styNormalText">  Type of organization (described on lines 1- 9 above (see instructions))</span> </th>
									<!-- Column iv -->
        <th class="IRS990ScheduleA_GenericCell" style="vertical-align:top;text-align:center;width:32mm;padding-bottom:1mm;border-right-width:1px;" scope="col" colspan="2"><b>(iv)</b><span class="styNormalText">  Is the organization listed in your governing document? </span></th>
						<!-- Column v -->
  <!--     <th class="IRS990ScheduleA_GenericCell" style="vertical-align:top;text-align:center;width:24mm;padding-bottom:4mm;border-right-width:1px;" scope="col" colspan="2"><b>(v)</b><span class="styNormalText"> Did you notify the organization in col. <b>(i)</b> of your support? </span></th>-->
						<!-- Column vi -->
<!--	<th class="IRS990ScheduleA_GenericCell" style="vertical-align:top;text-align:center;width:24mm;padding-bottom:5mm;border-right-width:1px;" scope="col" colspan="2"><b>(vi)</b><span class="styNormalText">  Is the organization in col. <b>(i)</b> organized in the U.S.? </span></th>-->
                           <!-- Column v -->
        <th class="IRS990ScheduleA_GenericCell" style="vertical-align:top;text-align:center;width:32mm;padding-bottom:15mm;border-right-width:1px;" scope="col" rowspan="2" colspan="1"><b>(v)</b><span class="styNormalText">  Amount of monetary support (see instructions)</span></th>
         <th class="IRS990ScheduleA_GenericCell" style="vertical-align:top;text-align:center;width:32mm;padding-bottom:15mm;border-right-width:0px;" scope="col" rowspan="2" colspan="1"><b>(vi)</b><span class="styNormalText">  Amount of other support (see instructions)</span></th>


      </tr>
      	<tr>
			<th scope="col" class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;padding-left:5mm;">Yes</th>
 			<th scope="col" class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;padding-left:5mm;">No</th>
 			<!--<th scope="col" class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;">Yes</th>
 			<th scope="col" class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;">No</th>
 	 		<th scope="col" class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;">Yes</th>
 			<th scope="col" class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;">No</th>-->
	</tr>

<!--            <th class="styDepTblCell" >(a) Name(s) of supported organization(s)</th>
            <th class="styDepTblCell" style="width:25mm;">(b) Line number from above</th>
          </tr>  -->
        </thead>
        <tbody>
         <xsl:for-each select="$FormData/SupportedOrgInformationGrp">
        
            <tr>
            <td class="IRS990ScheduleA_GenericCell" style="font-family:verdana;font-size:6pt;vertical-align:top;">(<xsl:number value="position()" format="A"/>) 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="SupportedOrganizationName/BusinessNameLine1Txt"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="SupportedOrganizationName/BusinessNameLine2Txt"/>
                </xsl:call-template>
              </td>
             
              <!-- Employer Identification Number -->
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center;vertical-align:top;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="EIN"/>
                </xsl:call-template> 
              </td>  
              
                 <!-- Type of Organization -->           
            <td class="IRS990ScheduleA_GenericCell" style="text-align:center;vertical-align:top;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="OrganizationTypeCd"/>
                </xsl:call-template> 
              </td>      
  
              <!-- Supported Organization Listed? -->
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center;vertical-align:top;">
  <!--              <xsl:call-template name="PopulateYesBox">  -->
              <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="GoverningDocumentListedInd"/>
                </xsl:call-template> 
              </td>  
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center; vertical-align:top;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="GoverningDocumentListedInd"/>
                </xsl:call-template> 
              </td>      
    
              

								<!-- Amount of Support -->
              <td class="IRS990ScheduleA_GenericCell" style="text-align:right;border-right-width:1px;width:32mm;vertical-align:top;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="SupportAmt"/>
                </xsl:call-template> 
              </td> 
              <!--Other Support -->     
              <td class="IRS990ScheduleA_GenericCell" style="text-align:right;border-right-width:0px;width:32mm;vertical-align:top;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="OtherSupportAmt"/>
                </xsl:call-template>
              </td>      
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
   </xsl:if>
    <!-- End Part I, Line 12g separated data -->
        
    <!-- Additonal Data Table for separated data from Part VII, Line 51d -->
 <xsl:if test="($Print = $Separated) and (count($FormData/TransferSchedule) &gt; 16) ">
      <span class="styRepeatingDataTitle">
        <br/>Form 990, Schedule A, Part VII, Line 51d - If the answer to any of the above is "Yes," complete the following schedule. Column (b) should always show the fair market value of the goods, other assets, or services given by the reporting organization. If the organization received less than fair market value in any transaction or sharing arrangement, show in column (d) the value of the goods, other assets, or services received:
      </span>
      <table class="styDepTbl" style="font-size:7pt">
        <thead class="styTableHead">
          <tr class="styDepTblHdr">
            <th scope="col" class="styDepTblCell" style="width:14mm;text_align:center;">
              <span style="font-weight:bold">(a)</span><br/>Line no.
            </th>
            <th scope="col" class="styDepTblCell" style="width:26mm;text_align:center;">
              <span style="font-weight:bold">(b)</span><br/>Amount involved
            </th>
            <th scope="col" class="styDepTblCell" style="width:70mm;text_align:center;">
              <span style="font-weight:bold">(c)</span><br/>Name of noncharitable exempt organization
            </th>
            <th scope="col" class="styDepTblCell" style="width:70mm;text_align:center;">
              <span style="font-weight:bold">(d)</span><br/>Description of transfers, transactions, and sharing arrangement
            </th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="$FormData/TransferSchedule">
            <tr>
              <!--Define background colors to the rows -->
              <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <td class="styDepTblCell" style="text-align:center">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="LineNumber"/>
                </xsl:call-template>
              </td>
              <td class="styDepTblCell" style="text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AmountInvolved"/>
                </xsl:call-template>
              </td>
              
              <td class="styDepTblCell" style="text-align:left;font-family:verdana;font-size:6pt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NameOfNoncharitableEO/BusinessNameLine1Txt"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NameOfNoncharitableEO/BusinessNameLine2Txt"/>
                </xsl:call-template>
              </td>
              
              <td class="styDepTblCell" style="text-align:left">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DescriptionOfTransfersEtc"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
    <!-- End Part VII, Line 51d separated data -->
    
    <!-- Additonal Data Table for separated data from Part VII, Line 52b -->
    <xsl:if test="($Print = $Separated) and (count($FormData/RelationshipSchedule) &gt; 16) ">
      <span class="styRepeatingDataTitle">
        <br/>Form 990, Schedule A, Part VI, Line 52b - If "Yes," complete the following schedule:
      </span>
      <table class="styDepTbl" style="font-size:7pt">
        <thead class="styTableHead">
          <tr class="styDepTblHdr">
            <th scope="col" class="styDepTblCell" style="width:70mm;text_align:center;">
              <span style="font-weight:bold;">(a)</span><br/>Name of organization
            </th>
            <th scope="col" class="styDepTblCell" style="width:40mm;text_align:center;">
              <span style="font-weight:bold;">(b)</span><br/>Type of organization
            </th>
            <th scope="col" class="styDepTblCell" style="width:70mm;text_align:center;">
              <span style="font-weight:bold;">(c)</span><br/>Description of relationship
            </th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="$FormData/RelationshipSchedule">
            <tr>
              <!--Define background colors to the rows -->
              <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              
              <td class="styDepTblCell" style="text-align:left,font-family:verdana;font-size:6pt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NameOfOrganization/BusinessNameLine1Txt"/>
                </xsl:call-template><br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NameOfOrganization/BusinessNameLine2Txt"/>
                </xsl:call-template>
              </td>
              
              <td class="styDepTblCell" style="text-align:center">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="OrganizationTypeDesc"/>
                </xsl:call-template>
              </td>
              <td class="styDepTblCell" style="text-align:left">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DescriptionOfRelationship"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
    <!-- End Part VII, Line 52b separated data -->

   </body>
</html>
</xsl:template>

<!-- This template is used to add blank rows to the table in Part VII Line 51d where the number of rows of data -->
<!-- is fewer than the container height (in this case 16). This template will continue to add blank rows until the -->
<!-- total number of rows have been filled in, including data rows and blank rows. -->
<xsl:template name="Part7Line51dFillerRows">
  <xsl:param name="NumOfTotRows"/>
  <xsl:param name="CurrentRowCount"/>
  <!-- Test condition to populate a blank row -->
  <xsl:if test="$CurrentRowCount &lt; $NumOfTotRows">
    <tr>
      <td class="IRS990ScheduleA_GenericCell" style="vertical-align:top;"><span style="width:1px;"/></td>
      <td class="IRS990ScheduleA_MoneyFieldMid" style="vertical-align:top;"><span style="width:1px;"/></td>
      <td class="IRS990ScheduleA_GenericCell" style="vertical-align:top;"><span style="width:1px;"/></td>
      <td class="IRS990ScheduleA_GenericCell" style="border-right-width:0px;vertical-align:top;">
        <span style="width:1px;"/>
      </td>
    </tr>
    <!-- Recursive call to itself after incrementing the CurrentRowCount. -->
    <xsl:call-template name="Part7Line51dFillerRows">
      <xsl:with-param name="NumOfTotRows" select="$NumOfTotRows"/>
      <xsl:with-param name="CurrentRowCount" select="$CurrentRowCount + 1"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<!-- This template is used to add blank rows to the table in Part VII Line 52b where the number of rows of data -->
<!-- is fewer than the container height (in this case 16). This template will continue to add blank rows until the -->
<!-- total number of rows have been filled in, including data rows and blank rows. -->
<xsl:template name="Part7Line52bFillerRows">
  <xsl:param name="NumOfTotRows"/>
  <xsl:param name="CurrentRowCount"/>
  <!-- Test condition to populate a blank row -->
  <xsl:if test="$CurrentRowCount &lt; $NumOfTotRows">
    <tr>
      <td class="IRS990ScheduleA_GenericCell" style="vertical-align:top;"><span style="width:1px;"/></td>
      <td class="IRS990ScheduleA_GenericCell" style="vertical-align:top;"><span style="width:1px;"/></td>
      <td class="IRS990ScheduleA_GenericCell" style="vertical-align:top;border-right:none;">
        <span style="width:1px;"/>
      </td>
    </tr>
    <!-- Recursive call to itself after incrementing the CurrentRowCount. -->
    <xsl:call-template name="Part7Line52bFillerRows">
      <xsl:with-param name="NumOfTotRows" select="$NumOfTotRows"/>
      <xsl:with-param name="CurrentRowCount" select="$CurrentRowCount + 1"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>