<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
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
  
  <xsl:param name="DependencyData" select="$RtnDoc/GeneralExplanationAttachment" />
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>

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
  <meta name="Description" content="IRS Form 990 or 990EZ Schedule A" />

   <xsl:call-template name="GlobalStylesForm"/>

  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>
  <style type="text/css">
    <xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS990ScheduleAStyle"/>
      <xsl:call-template name="AddOnStyle"></xsl:call-template>
    </xsl:if>
  </style>
</head>

<body class="styBodyClass">
<xsl:call-template name="DocumentHeader"></xsl:call-template>
<!-- BEGIN FORM HEADER -->
<div class="IRS990ScheduleA_LineContainer">
  <!-- Form Name -->
  <div class="IRS990ScheduleA_FormNumBlock" style="padding-top:5px;">
     <span style="font-size:11pt;font-weight:bold;font-familiy:'Arial Narrow';">SCHEDULE A</span>
     <br />
     <span style="font-size:10pt;font-weight:bold;font-family:'Arial Narrow';">(Form 990 or 990EZ)</span>
     <br />
       <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$FormData"/>      
       </xsl:call-template>
     <br />
     <span style=" font-family:Arial Narrow; ">Department of the Treasury</span>
     <br />
     <span style=" font-family:Arial Narrow; ">Internal Revenue Service</span>
  </div>

  <!-- Form Title Box -->
  <div class="IRS990ScheduleA_FormTitleBlock">
    <!-- Form Title -->
    <div style="padding-top: 2mm">
    <span class="styMainTitle">Public Charity Status and Public Support</span>
    </div>
    <!-- Form Subtitle -->
    <br />
    <span style="font-weight:bold">
      Complete if the organization is a section 501(c)(3) organization or a section<br />
      <span style="font-weight:bold">
      4947(a)(1) nonexempt charitable trust.<br />
    <div style="padding-top: 2.3mm">
    <span style="font-weight:bold">
      <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/> Attach to Form 990 or Form 990-EZ.  <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/> See separate instructions.</span>
    </div>
    </span>
    </span>
  </div>
  
    <div class="IRS990ScheduleA_FormYearBlock">
    <div class="IRS990ScheduleA_OMB">OMB No. 1545-0047</div> 
    <div class="styTY" style="height:2mm;text-align:center;">
      20<span class="styTYColor">10</span>
    </div>
    <div style="height:7.2mm; background-color: black; color: white; font-size: 7.5pt;font-weight: bold;text-align:center;">Open to Public<br/>Inspection</div>
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
  <div class="styFNBox" style="width:134mm;height:8mm;">
     Name of the organization<br/>
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

<!-- Part I header -->
<div class="styBB" style="width: 187mm">
  <div class="styPartName">Part I</div>
  <div class="styPartDesc">Reason for Public Charity Status
       <span class="styNormalText">(All organizations must complete this part.) See instructions</span>
   </div>
<!--  <div class="styBB" style="height: 1mm; width: 187mm"></div> -->
</div>


<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineDesc" style="width:188mm;border-right-width:0px;">
   The organization is not a private foundation because it is: (For lines 1 through 11, check only one box.)
    </div>
</div>

<!-- line 1 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">1</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/Church170b1Ai"/>
      </xsl:call-template>                                                                     
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/Church170b1Ai"/>
      </xsl:call-template>
       A church, convention of churches, or association of churches.
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
    <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/School170b1Aii"/>
      </xsl:call-template>
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/School170b1Aii"/>
      </xsl:call-template>
      A school described in 
      <span style="font-weight:bold;">
         section 170(b)(1)(A)(ii).
      </span>
      (Attach Schedule E.)
    </label> 
  </div>
</div>
<!-- line 3 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">3</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/Hospital170b1Aiii"/>
      </xsl:call-template>
    </input>
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/Hospital170b1Aiii"/>
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
    <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/MedicalResearchOrg170b1Aiii"/>
      </xsl:call-template>
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/MedicalResearchOrg170b1Aiii"/>
      </xsl:call-template>
     A medical research organization operated in conjunction with a hospital described in
      <span style="font-weight:bold;">
         section 170(b)(1)(A)(iii).</span>
     Enter the hospital's name, city, and state:
    </label> 
     </div>
</div>
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineIndex"></div>
  
     <span style="font-weight:bold;"><span style="width: 1.5mm" /></span>
  <div class="IRS990ScheduleA_LineDescIV" style="width:154mm;border-bottom-width:1px;border-bottom-style:solid;">
  <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
     <!--If the print parameter is separated, but there are at most 2 data elements-->
    <xsl:choose>
      <xsl:when test="($Print != $Separated) or count($FormData/HospitalNameAndAddress) &lt;= 2">
        <xsl:for-each select="$FormData/HospitalNameAndAddress">
        
         <div style="font-family:verdana;font-size:7pt;text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1"/>
          </xsl:call-template>,
          </div>
          
          <div style="font-family:verdana;font-size:7pt;">
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2"/>
           </xsl:call-template>,          
          </div>
          <xsl:call-template name="PopulateText">
           <xsl:with-param name="TargetNode" select="City"/>
          </xsl:call-template>,
         <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="State"/>
          </xsl:call-template>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Country"/>
          </xsl:call-template>
          </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="PopulateAdditionalDataTableMessage">
          <xsl:with-param name="TargetNode" select="$FormData/HospitalNameAndAddress" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </div>
</div>

 <!-- line 5 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">5</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/CollegeSupportOrg170b1Aiv"/>
      </xsl:call-template>
    </input>
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/CollegeSupportOrg170b1Aiv"/>
      </xsl:call-template>
      An organization operated for the benefit of a college or university owned or operated by a governmental unit described in
    </label> 
  </div>
</div>
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineDescIV">
  <span style="font-weight:bold;"> section 170(b)(1)(A)(iv).</span> (Complete Part II.)
  </div>
</div>
<!-- line 6 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">6</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/GovernmentalUnit170b1Av"/>
      </xsl:call-template>
    </input>
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/GovernmentalUnit170b1Av"/>
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
    <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/PubliclySupportedOrg170b1Avi"/>
      </xsl:call-template>
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label> 
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PubliclySupportedOrg170b1Avi"/>
      </xsl:call-template>
      An organization that normally receives a substantial part of its support from a governmental unit or from the general public described in
    </label>
  </div>
</div>
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label> 
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PubliclySupportedOrg170b1Avi"/>
      </xsl:call-template>
    <span style="font-weight:bold;">section 170(b)(1)(A)(vi)</span>. (Complete Part II.)
    </label>
  </div>
</div>
<!-- line 8 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">8</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/CommunityTrust170b1Avi"/>
      </xsl:call-template>
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label> 
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/CommunityTrust170b1Avi"/>
      </xsl:call-template>
     A community trust described in <span style="font-weight:bold;">section 170(b)(1)(A)(vi)</span>. (Complete Part II.)
    </label>
  </div>
</div>
<!-- line 9 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">9</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/PubliclySupportedOrg509a2"/>
      </xsl:call-template>
    </input>
  </div>  
  <div class="IRS990ScheduleA_LineDescIV">
    <label> 
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PubliclySupportedOrg509a2"/>
      </xsl:call-template>
      An organization that normally receives: (1) more than 33<span style="font-size:5pt;">1/3</span>% of its support from contributions, membership fees, and gross
    </label>
  </div>
</div>
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineDescIV">
    receipts from activities related to its exempt functions—subject to certain exceptions, and (2) no more than 33<span style="font-size:5pt;">1/3</span>% of 
  </div>
</div>
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineDescIV">
    its support from gross investment income and unrelated business taxable income (less section 511 tax) from businesses 
  </div>
</div>
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineDescIV">
    acquired by the organization after June 30, 1975.  See<span style="font-weight:bold;"> section 509(a)(2).</span> (Complete Part III.)
  </div>
</div>
<!-- line 10 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">10</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/TestingForPublicSafety509a4"/>
      </xsl:call-template>
    </input>  
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label> 
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/TestingForPublicSafety509a4"/>
      </xsl:call-template>
      An organization  organized and operated exclusively to test for public safety. See<span style="font-weight:bold;">section 509(a)(4).</span> 
      </label>
  </div>
</div>
<!-- line 11-->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">11</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/SupportingOrganization509a3"/>
      </xsl:call-template>
    </input>
  </div>  
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/SupportingOrganization509a3"/>
      </xsl:call-template>
      An organization organized and operated exclusively for the benefit of, to perform the functions of, or to carry out the purposes of one or more publicly supported organizations described in section 509(a)(1) or section 509(a)(2). See <span style="font-weight:bold;">section 509(a)(3).</span> Check the box that describes the type of supporting organization and complete lines 11e through 11h.
    </label> 
  </div>
</div>
<!-- <div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/SupportingOrganization509a3"/>
      </xsl:call-template>
     </label> 
  </div>
</div> -->

<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/SupportingOrganization509a3"/>
        <xsl:with-param name="BackupName">IRS990ScheduleAType1</xsl:with-param>
      </xsl:call-template>
           
 <!-- line 11 check boxes --> 
 <!--
       <span style="padding-right: 3mm"> <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/></span> 
     --> 
         
      <span style="width:30mm;">
      <div class="IRS990ScheduleA_LineIndex">a</div>
      <input type="checkbox" class="IRS990ScheduleA_Checkbox">
         <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/SupportingOrg509a3Type1" />
          <xsl:with-param name="BackupName">IRS990ScheduleAType1</xsl:with-param>
         </xsl:call-template>
        </input>
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$FormData/SupportingOrg509a3Type1" />
            <xsl:with-param name="BackupName">IRS990ScheduleAType1
            </xsl:with-param>
          </xsl:call-template>
          Type I
        </label>
      </span>     
             
      <span style="width:30mm;">
      <div class="IRS990ScheduleA_LineIndex">b</div>
      <input type="checkbox" class="IRS990ScheduleA_Checkbox">
         <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/SupportingOrg509a3Type2" />
          <xsl:with-param name="BackupName">IRS990ScheduleAType2</xsl:with-param>
         </xsl:call-template>
        </input>
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$FormData/SupportingOrg509a3Type2" />
            <xsl:with-param name="BackupName">IRS990ScheduleAType2
            </xsl:with-param>
          </xsl:call-template>
          Type II
        </label>
      </span>
     
      <span style="width:70mm;">
       <div class="IRS990ScheduleA_LineIndex">c</div>
      <input type="checkbox" class="IRS990ScheduleA_Checkbox">
         <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/SupportingOrg509a3Type3FuncInt" />
          <xsl:with-param name="BackupName">IRS990ScheduleAType3</xsl:with-param>
         </xsl:call-template>
        </input>
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$FormData/SupportingOrg509a3Type3FuncIt" />
            <xsl:with-param name="BackupName">IRS990ScheduleAType3
            </xsl:with-param>
          </xsl:call-template>
          Type III - Functionally integrated
        </label>
      </span>
                        
         <span style="width:40mm;">
           <div class="IRS990ScheduleA_LineIndex">d</div>
      <input type="checkbox" class="IRS990ScheduleA_Checkbox">
         <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/SupportingOrg509a3Type3Other" />
          <xsl:with-param name="BackupName">IRS990ScheduleAType3</xsl:with-param>
         </xsl:call-template>
        </input>
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$FormData/SupportingOrg509a3Type3Other" />
            <xsl:with-param name="BackupName">IRS990ScheduleAType3Other
            </xsl:with-param>
          </xsl:call-template>
          Type III - Other
        </label>
      </span>
  
     </label> 
  </div>
   
 
</div>
<!-- line 11 ends-->
<!-- line 11e -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">e</div>
  <div class="IRS990ScheduleA_LineIndex">
    <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/CertificationCheckbox"/>
      </xsl:call-template>
    </input>
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/CertificationCheckbox"/>
      </xsl:call-template>
      By checking this box, I certify that the organization is not controlled directly or indirectly by one or more disqualified persons other than foundation managers and other than one or more publicly supported organizations described in section 509(a)(1) or section 509(a)(2).
    </label> 
  </div>
</div>
<!-- line 11f -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">f</div>
  <div class="IRS990ScheduleA_LineIndex">
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/WrittenIRSDetermination"/>
      </xsl:call-template>
      If the organization received a written determination from the IRS that it is a Type I, Type II or Type III supporting organization, check this box
      <span class="IRS990ScheduleA_DotSpacing">..................................................  </span>
    </label> 
        <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/WrittenIRSDetermination"/>
      </xsl:call-template>
    </input>
  </div>
</div>
<!-- line 11g -->
<div class="IRS990ScheduleA_LineContainer">
   <div class="IRS990ScheduleA_LineIndex">g</div>
  <div class="IRS990ScheduleA_LineIndex">
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/CollegeSupportOrg170b1Aiv"/>
      </xsl:call-template>
     Since August 17, 2006, has the organization accepted any gift or contribution from any of the <br /> following persons?<br />
    </label> 
  </div>
</div>
<!-- line 11g(i) -->
<div class="IRS990ScheduleA_LineContainer">
 <!-- <div class="styLNLeftLtrBoxDD">(i)</div> -->
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineIndex"></div> 
  <div class="IRS990ScheduleA_LineDesc" style="border-right-width:0px; width: 142mm">
  <span style="font-weight:bold;">(i)</span>  a person who directly or indirectly controls, either alone or together with persons described in  (ii)</div>
  <div class="IRS990ScheduleA_LineIndexMid" style="width: 11mm"></div>
  <div class="IRS990ScheduleA_LineIndexMid" style="border-top-width:1px;">Yes</div>
  <div class="IRS990ScheduleA_LineIndexMid" style="border-right-width:0px;border-top-width:1px;">No</div>
</div>
<!-- line 11g(i) continued -->
<div class="IRS990ScheduleA_LineContainer">
 <!-- <div class="IRS990ScheduleA_SubLineIndex"></div> -->
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineIndex"></div> 
   <div class="IRS990ScheduleA_LineDesc" style="width: 142mm">
            and (iii) below, the governing body of the the supported organization?
    <span class="IRS990ScheduleA_Dotspacing">................</span>
  </div>
  <div class="IRS990ScheduleA_LineIndexMid" style="width: 11mm">11g(i)</div>
  <div class="IRS990ScheduleA_LineIndexMid">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/ContribByControllingIndividual"/>
      </xsl:call-template>
    </span>  
  </div>
  <div class="IRS990ScheduleA_LineIndexMid" style="border-right-width:0px;">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/ContribByControllingIndividual"/>
      </xsl:call-template>
    </span>  
  </div>
</div>
<!-- line 11g(ii) -->
<div class="IRS990ScheduleA_LineContainer">
 <!-- <div class="IRS990ScheduleA_SubLineIndex"></div> -->
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineIndex"></div> 
  <div class="IRS990ScheduleA_LineDesc" style="width: 142mm">
<!--    <span style="width:8mm;font-weight:bold;text-align:center;">(ii)</span> -->
  <span style="font-weight:bold;">(ii)</span>
     a family member of a person  described in (i) above?
    <span class="IRS990ScheduleA_Dotspacing">......................</span>
  </div>
  <div class="IRS990ScheduleA_LineIndexMid" style="width: 11mm">11g(ii)</div>
  <div class="IRS990ScheduleA_LineIndexMid">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/ContributionByRelatedParty"/>
      </xsl:call-template>
    </span>  
  </div>
  <div class="IRS990ScheduleA_LineIndexMid" style="border-right-width:0px;">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/ContributionByRelatedParty"/>
      </xsl:call-template>
     </span> 
  </div>
</div>
<!-- line 11g(iii)i -->
<div class="IRS990ScheduleA_LineContainer">
<!--   <div class="IRS990ScheduleA_SubLineIndex"></div> -->
  <div class="IRS990ScheduleA_LineIndex"></div>
  <div class="IRS990ScheduleA_LineIndex"></div> 
  <div class="IRS990ScheduleA_LineDesc" style="width: 142mm">
    <span style="font-weight:bold;">(iii)</span>
   a 35% controlled entity of a person described in (i) or (ii) above?
    <span class="IRS990ScheduleA_Dotspacing">................</span>
  </div>
  <div class="IRS990ScheduleA_LineIndexMid" style="width: 11mm">11g(iii)</div>
  <div class="IRS990ScheduleA_LineIndexMid">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/ContribBy35ControlledEntity"/>
      </xsl:call-template>
    </span>  
  </div>
  <div class="IRS990ScheduleA_LineIndexMid" style="border-right-width:0px;">
   <span style="font-weight: normal">
      <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/ContribBy35ControlledEntity"/>
      </xsl:call-template>
     </span> 
  </div>
</div>

<!-- line 11h -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">h</div>
  <div class="IRS990ScheduleA_LineIndex">
<!--    <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/CommunityTrust170b1Avi"/>
      </xsl:call-template>
    </input>  -->
  </div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label> 
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/CommunityTrust170b1Avi"/>
      </xsl:call-template>
      Provide the following information about the supported organization(s). 
    </label>
  </div>
</div>

    <div style="float:right;">           
    <!-- button display logic -->          
    <xsl:call-template name="SetDynamicTableToggleButton">
      <xsl:with-param name="TargetNode" select="$FormData/SupportedOrgInformation" />
      <xsl:with-param name="headerHeight" select="2" />
      <xsl:with-param name="containerHeight" select="2" />
      <xsl:with-param name="containerID" select="'p1Ln11TbCtnr'" />                  
    </xsl:call-template>               
     <!-- end button display logic -->              
  </div> 
   
  <!--Part I line 11h table -->
  <div class="IRS990ScheduleAPart4_TableContainer" id="p1Ln11TbCtnr"> 
    <!-- print logic -->
    <xsl:call-template name="SetInitialState"/>
    <!-- end -->        
    <table cellspacing="0" style="font-size:7pt;">
 <!--     <tr>
        <th class="IRS990ScheduleA_GenericCell" style="width:187mm;height:4mm;border:1 black solid;border-left-width:0px;border-right-width:0px;border-top-						width:1px;text_align:center;font-weight:normal;" scope="col" colspan="6">
          Provide the following information about the supported organizations. (see page 7 of the instructions.)
        </th>
      </tr>
-->
 <div class="styBB" style="height: .2mm; width: 187mm"></div>
 
 
                      <!-- Column i -->
                    

      <tr>
        <th class="IRS990ScheduleA_GenericCell" style="width:32mm;"  scope="col" rowspan="2">(i)<br/><span class="styNormalText"> Name of supported organization</span></th>
      						<!-- Column ii -->
        <th class="IRS990ScheduleA_GenericCell" style="width:20mm;border-right-width:1px" scope="col" rowspan="2">(ii)<br/><span class="styNormalText"> EIN</span></th>
									<!-- Column iii -->
        <th class="IRS990ScheduleA_GenericCell" style="width:32mm;border-right-width:1px;"  scope="col" rowspan="2">(iii)<br/><span class="styNormalText">  Type of organization (described on lines 1- 9 above or IRC section (see instructions))</span></th>
									<!-- Column iv -->
        <th class="IRS990ScheduleA_GenericCell" style="width:24mm;border-right-width:1px;" scope="col" colspan="2">(iv)<br/><span class="styNormalText">  Is the organization in col. (i) listed in your governing document? </span></th>
						<!-- Column v -->
        <th class="IRS990ScheduleA_GenericCell" style="width:24mm;border-right-width:1px;"  scope="col" colspan="2">(v)<br/><span class="styNormalText"> Did you notify the organization in col. (i) of your support? </span></th>
						<!-- Column vi -->
	 <th class="IRS990ScheduleA_GenericCell" style="width:24mm;border-right-width:1px;" scope="col" colspan="2">(vi)<br/><span class="styNormalText">  Is the organization in col. (i) organized in the U.S.? </span></th>
                           <!-- Column vii -->
        <th class="IRS990ScheduleA_GenericCell" style="width:32mm;border-right-width:0px;" scope="col" rowspan="2"  colspan="1">(vii)<br/><span class="styNormalText">  Amount of support? </span></th>


      </tr>
      	<tr>
			<th class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;" >Yes</th>
 			<th class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;" >No</th>
 			<th class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;" >Yes</th>
 			<th class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;" >No</th>
 	 		<th class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;" >Yes</th>
 			<th class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;" >No</th>
	</tr>
      
        <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
        <!-- If the print parameter is separated, but there are fewer elements than the container height (2) -->
							<!-- Name of Supported Organization -->
      
<xsl:if test="($Print != $Separated) or count($FormData/SupportedOrgInformation) &lt;= 2">

          <xsl:for-each select="$FormData/SupportedOrgInformation">
        
            <tr>
            <td class="IRS990ScheduleA_GenericCell" style="font-family:verdana;font-size:6pt;">(<xsl:number value="position()" format="1"/>) 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1"/>
                </xsl:call-template>
                <br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2"/>
                </xsl:call-template>
              </td>
             
              <!-- Employer Identification Number -->
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="EIN"/>
                </xsl:call-template> 
              </td>  
              
                 <!-- Type of Organization -->           
            <td class="IRS990ScheduleA_GenericCell" style="text-align:center;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="TypeOfOrganization"/>
                </xsl:call-template> 
              </td>      
  
              <!-- Supported Organization Listed? -->
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center;">
  <!--              <xsl:call-template name="PopulateYesBox">  -->
              <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="ListedInGoverningDoc"/>
                </xsl:call-template> 
              </td>  
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center; ">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="ListedInGoverningDoc"/>
                </xsl:call-template> 
              </td>      
    
                  <!-- Notify Of Support? -->
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="SupportedOrganizationNotified"/>
                </xsl:call-template> 
              </td>  
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center; ">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="SupportedOrganizationNotified"/>
                </xsl:call-template> 
              </td>   
                 
              <!-- Organized In US? -->
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="OrganizedInUS"/>
                </xsl:call-template> 
              </td>  
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center; ">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="OrganizedInUS"/>
                </xsl:call-template> 
              </td>      

								<!-- Amount of Support -->
              <td class="IRS990ScheduleA_GenericCell" style="text-align:right;border-right-width:0px;width:32mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="Amount"/>
                </xsl:call-template> 
              </td>      
            </tr>
          </xsl:for-each>
        </xsl:if>
        <!-- Display the first blank row if the data set is empty. If the number of data elements is more than 2 -->
        <!-- and the print option is separated, display a message in the first row directing the user to the -->
        <!-- additional data table -->
        <xsl:if test="count($FormData/SupportedOrgInformation) &lt; 1 or
            (($Print = $Separated) and (count($FormData/SupportedOrgInformation) &gt; 2)) ">
          <tr>
            <td class="IRS990ScheduleA_GenericCell" >
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$FormData/SupportedOrgInformation" />
              </xsl:call-template>
              <span style="width:3px" />
            </td>
            <td class="IRS990ScheduleA_GenericCell" >
                  <span style="width:3px" />
            </td>
		<td class="IRS990ScheduleA_GenericCell" >
                  <span style="width:3px" />
            </td>
		<td class="IRS990ScheduleA_GenericCell" >
                  <span style="width:3px" />
            </td>
		<td class="IRS990ScheduleA_GenericCell" >
                  <span style="width:3px" />
            </td>
		<td class="IRS990ScheduleA_GenericCell" >
                  <span style="width:3px" />
            </td>
		<td class="IRS990ScheduleA_GenericCell" >
                  <span style="width:3px" />
            </td>
		<td class="IRS990ScheduleA_GenericCell" >
                  <span style="width:3px" />
            </td>
		<td class="IRS990ScheduleA_GenericCell" >
                  <span style="width:3px" />
            </td>

            <td class="IRS990ScheduleA_GenericCell" style="border-right-width:0px;text-align:center">
              <span style="width:3px" />
            </td>
          </tr>
        </xsl:if>
        <!--Display the second blank row if there is only one row of data. If the number of data elements is -->
        <!-- more than 2 and the print option is separated, also display a blank second row -->
        <xsl:if  test="count($FormData/SupportedOrgInformation) &lt; 2 or
            (($Print = $Separated) and (count($FormData/SupportedOrgInformation) &gt; 2)) ">
          <tr>
            <td class="IRS990ScheduleA_GenericCell" >
              <span style="width:3px" />
           </td>
            <td class="IRS990ScheduleA_GenericCell" >
              <span style="width:3px" />
           </td>
		<td class="IRS990ScheduleA_GenericCell" >
              <span style="width:3px" />
           </td>
		<td class="IRS990ScheduleA_GenericCell" >
              <span style="width:3px" />
            </td>
		<td class="IRS990ScheduleA_GenericCell" >
              <span style="width:3px" />
           </td>
		<td class="IRS990ScheduleA_GenericCell" >
                  <span style="width:3px" />
            </td>
		<td class="IRS990ScheduleA_GenericCell" >
                  <span style="width:3px" />
            </td>
		<td class="IRS990ScheduleA_GenericCell" >
                  <span style="width:3px" />
            </td>
		<td class="IRS990ScheduleA_GenericCell" >
                  <span style="width:3px" />
            </td>

            <td class="IRS990ScheduleA_GenericCell" style="border-right-width:0px;">
              <span style="width:3px" />
            </td>
          </tr>
        </xsl:if>
        <tr>
             	<td style="border:black 0 solid;border-bottom-width:1;border-right-width:1" colspan="1"><span 					class="styBoldText" >Total </span>					
             </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
 
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:32mm;font-size:7pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SumOfAmounts"/>
     	</xsl:call-template></td>
      </tr>
    </table>
    
     <br />
  </div> 
    
  <xsl:call-template name="SetInitialDynamicTableHeight">
    <xsl:with-param name="TargetNode" select="$FormData/SupportedOrgInformation" />
    <xsl:with-param name="headerHeight" select="2" />
    <xsl:with-param name="containerHeight" select="4"/>
    <xsl:with-param name="containerID" select="'p1Ln11TbCtnr'" />
  </xsl:call-template>



<!-- footer line -->
<div class="pageEnd" style="width:187mm;float:none;clear:both;">

  <div class="IRS990ScheduleA_LineContainer">
    <div style="font-weight:bold;width:100mm;float:left;font-family:'arial narrow';">
      For Paperwork Reduction Act Notice, see the Instructions for Form 990.</div>
    <div style="width:40mm;float:left;">
      Cat. No. 11285F
    </div>
    <div style="width:47mm;text-align:right;float:left;font-family:'arial narrow';font-weight:bold;">Schedule A (Form 990 or 990-EZ) 2010</div>
  </div>
</div>




<!-- Page Header -->
  <div class="styBB" style="width:187mm; padding-bottom:.5mm;">  
    <div style="float:left;">Schedule A (Form 990 or 990-EZ) 2010</div>
    <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>                    
  </div>  
<!-- END Page Header -->      




<!-- Part II header -->
<div class="styBB" style="width:187mm;">
  <div class="styPartName" style="width:20mm;">Part II</div>
  <div class="styPartDesc" style="width:162mm;">Support Schedule for Organizations Described in IRC 170(b)(1)(A)(iv) and 170(b)(1)(A)(vi)<br />
      <span class="styNormalText">(Complete only if you checked the box on line 5, 7, or 8 of Part I or if the
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
    </xsl:call-template> -->
    <!-- end button display logic -->
  <!-- </div> -->
</div>
 
  <!-- <div class="styPartDesc" style="width:162mm;font-weight:bold">Public Support</div> -->
  <span class="styPartDesc" style="width:162mm;font-weight:bold">Section A.  Public Support</span>


<!-- Part II  table  Public Support -->
<div class="IRS990ScheduleA_TableContainer" style="border-bottom-width:0px;">
   <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
     <tr>
      <th class="IRS990ScheduleA_GenericCell" style="width:60mm;font-weight:bold;border-bottom-width:0px" scope="col" colspan="2">
        <span style="float: left; clear:both"> Calendar year</span><span class="styNormalText">(or fiscal year beginning in)</span>
 <!--      <span style="float:right; clear: both"><img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/></span>  -->
      </th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(a)<span class="styNormalText"> 2006</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(b)<span class="styNormalText"> 2007</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(c)<span class="styNormalText"> 2008</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(d)<span class="styNormalText"> 2009</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(e)<span class="styNormalText"> 2010</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;border-right-width:0px;text_align:center" scope="col">(f)<span class="styNormalText"> Total</span></th> 
     </tr>
      <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">1</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Gifts, grants, contributions, and membership fees received. (Do not include any "unusual grants.") <span class="IRS990ScheduleA_DotSpacing">....</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContribReceived170/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContribReceived170/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContribReceived170/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContribReceived170/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContribReceived170/CurrentTaxYear"/>
      </xsl:call-template>
      </td>

      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContribReceived170/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">2</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Tax revenues levied for the organization's benefit and either paid to or expended on its behalf<span class="IRS990ScheduleA_DotSpacing">.......</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedForOrgBenefit170/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedForOrgBenefit170/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedForOrgBenefit170/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedForOrgBenefit170/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedForOrgBenefit170/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedForOrgBenefit170/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">3</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">The value of services or facilities furnished by a governmental unit to the organization without charge.<span class="IRS990ScheduleA_DotSpacing">.</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ValueSrvcFcltsFurnishedByGovt/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ValueSrvcFcltsFurnishedByGovt/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ValueSrvcFcltsFurnishedByGovt/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ValueSrvcFcltsFurnishedByGovt/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ValueSrvcFcltsFurnishedByGovt/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ValueSrvcFcltsFurnishedByGovt/Total"/>
      </xsl:call-template>
      </td>
    </tr>
        <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">4</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;"><b>Total.</b> Add lines 1 through 3<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total170/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total170/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total170/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total170/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total170/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total170/Total"/>
      </xsl:call-template>
      </td>
    </tr>
     <tr>
      <td class="IRS990ScheduleA_IndexCell"  style="width:4mm;border-bottom-width:0px;" valign="top">5</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">The portion of total contributions by each person (other than a governmental unit or publicly supported organization) included
on line 1 that exceeds 2% of the amount shown on line 11, column (f)<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmountsSubstContributorsTotal"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" valign="top">6</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;"><b>Public Support.</b> Subtract line 5 from line 4.<span class="IRS990ScheduleA_DotSpacing"></span></td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
         <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/PublicSupportTotal170"/>
        </xsl:call-template>
      </td>
    </tr>
  </table>
</div>

<span class="styPartDesc" style="width:162mm;font-weight:bold">Section B. Total Support</span>

<!-- Part II  table  Total Support -->
<div class="IRS990ScheduleA_TableContainer" style="border-bottom-width:0px;">
   <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
     <tr>
      <th class="IRS990ScheduleA_GenericCell" style="width:60mm;font-weight:bold;border-bottom-width:0px;" scope="col" colspan="2">
        <span style="float: left; clear: both"> Calendar year</span><span class="styNormalText">(or fiscal year beginning in)</span>
<!--       <span style="float:right; clear: both"><img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/></span>  -->
      </th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(a)<span class="styNormalText"> 2006</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(b)<span class="styNormalText"> 2007</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(c)<span class="styNormalText"> 2008</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(d)<span class="styNormalText"> 2009</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(e)<span class="styNormalText"> 2010</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;border-right-width:0px;text_align:center" scope="col">(f)<span class="styNormalText"> Total</span></th>
    </tr>
        <tr>
      <td class="IRS990ScheduleA_IndexCell" style="border-bottom-width:0px;" valign="top">7</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Amounts from line 4<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total170/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total170/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total170/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total170/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total170/CurrentTaxYear"/>
      </xsl:call-template>
      </td>

      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total170/Total"/>
      </xsl:call-template>
      </td>
    </tr>
   <!-- Line 8 -->
    <tr>
      <td class="IRS990ScheduleA_IndexCell"  style="border-bottom-width:0px;" valign="top">8</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Gross income from interest, dividends, payments received on securities loans, rents, royalties and income from similar sources<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome170/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome170/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome170/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome170/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome170/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome170/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <!-- Line 9 -->
    <tr>
      <td class="IRS990ScheduleA_IndexCell"  style="border-bottom-width:0px;" valign="top">9</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Net income from unrelated business activities, whether or not the business is regularly carried on<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetUBI/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetUBI/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetUBI/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetUBI/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetUBI/CurrentTaxYear"/>
      </xsl:call-template>
      </td>

      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetUBI/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <!-- Line 10 -->   
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="border-bottom-width:0px;" valign="top">10</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Other income. (Explain in Part IV.)  Do not include gain or loss from the sale of capital assets<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/OtherIncome170/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/OtherIncome170/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/OtherIncome170/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/OtherIncome170/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/OtherIncome170/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/OtherIncome170/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <!-- Line 11 -->
    <tr>
      <td class="IRS990ScheduleA_IndexCell"  style="border-bottom-width:0px;" valign="top">11</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;"><b>Total support</b> (Add lines 7 through 10)<span class="IRS990ScheduleA_DotSpacing">.</span></td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
         <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalSupport"/>
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
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsFromAdmissionsEtc"/>
      </xsl:call-template>
      Gross receipts from related activities, etc.  (See instructions.)
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
    <div class="styLNAmountBox" style="height:4mm;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsFromAdmissionsEtc" /></xsl:call-template></div>
 
  </div>

<!-- line 13 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:6mm;">13</div>
  <div class="IRS990ScheduleA_LineDescIV">
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/First5Years170"/>
      </xsl:call-template>
      <span style="font-weight:bold;">
         First Five Years
      </span>
      If the Form 990 is for the organization's first, second, third, fourth, or fifth tax year as a 501(c)(3) organization,<br/>
      check this box and <b>stop here</b>
       <span class="IRS990ScheduleA_DotSpacing">..........................................  </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
      <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/First5Years170"/>
      </xsl:call-template>
    </input> 
   </div>
    <div class="styBB" style="width:187mm;"></div>
 </div>

<div class="styBB" style="width:187mm;">
<span class="styPartDesc" style="width:162mm;font-weight:bold">Section C.  Computation of Public Support Percentage</span>
</div>

     <!--xsl:for-each select="$FormData/CompOfHghstPaidCntrctProfSer"-->
  
  <!-- line 14 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:6mm;">14</div>
  <div class="IRS990ScheduleA_LineDescIVA">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PublicSupportPertcentage170"/>
      </xsl:call-template>
      Public Support Percentage for 2010 (line 6 column (f) divided by line 11 column (f))
       <span class="IRS990ScheduleA_DotSpacing">.........  </span>
     </label> 
    </div>
    
       <div class="styLNRightNumBox" style="height:4mm;">14</div>
    <div class="styLNAmountBox" style="height:4mm;"><xsl:call-template name="PopulatePercent"><xsl:with-param name="TargetNode" select="$FormData/PublicSupportPertcentage170"/></xsl:call-template></div>
<!-- select="$FormData/PublicSupportPertcentage170"/></xsl:call-template>%</div> -->

 
  </div>
 
   <!-- line 15 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:6mm;">15</div>
  <div class="IRS990ScheduleA_LineDescIVA">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PublicSupportPertcentPriorYear"/>
      </xsl:call-template>
      Public Support Percentage for 2009 Schedule A, Part II, line 14
       <span class="IRS990ScheduleA_DotSpacing">...............  </span>
     </label> 
   </div>
   
       <div class="styLNRightNumBox" style="height:4mm;">15</div>
    <div class="styLNAmountBox" style="height:4mm;"><xsl:call-template name="PopulatePercent"><xsl:with-param name="TargetNode" select="$FormData/PublicSupportPertcentPriorYear" /></xsl:call-template></div>

</div>

<!-- line 16a -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:6mm;padding-right:9px;">16a</div>
  <div class="IRS990ScheduleA_LineDescIVB">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThreePercntTestsCY170"/>
      </xsl:call-template>
      <span style="font-weight:bold;">
         33 <span style="font-size:5pt;">1/3</span>% support test—2010.
      </span>
      If the organization did not check the box on line 13, and line 14 is 33 <span style="font-size:5pt;">1/3</span>% or more, check this box<br/>
      and <b>stop here.</b>  The organization qualifies as a publicly supported organization
      <span class="IRS990ScheduleA_DotSpacing">......................  </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThreePercntTestsCY170"/>
      </xsl:call-template>
    </input>  
   </div>
</div>

<!-- line 16b -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:7.4mm;padding-right:9px;">b</div>
  <div class="IRS990ScheduleA_LineDescIVB">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThreePercntTestsPY170"/>
      </xsl:call-template>
      <span style="font-weight:bold;">
         33 <span style="font-size:5pt;">1/3</span>% support test—2009.
      </span>
      If the organization did not check the box on line 13 or 16a, and line 15 is 33 <span style="font-size:5pt;">1/3</span>% or more, check this<br/>
      box and <b>stop here.</b>  The organization qualifies  as a publicly supported organization
      <span class="IRS990ScheduleA_DotSpacing">.....................  </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThreePercntTestsPY170"/>
      </xsl:call-template>
    </input>  
   </div>
</div>

<!-- line 17a -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:6mm;padding-right:9px;">17a</div>
  <div class="IRS990ScheduleA_LineDescIVB">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/TenPercentTestCurrentYear"/>
      </xsl:call-template>
      <span style="font-weight:bold;">
         10%-facts-and-circumstances test—2010.
      </span>
      If the organization did not check a box on line 13, 16a, or 16b and line 14<br/>
      is 10% or more, and if the organization meets the "facts and circumstances" test, check this box and <b>stop here.</b>  Explain<br/>
      in Part IV how the organization meets the "facts and circumstances" test.  The organization qualifies as a publicly supported<br/>
      organization
      <span class="IRS990ScheduleA_DotSpacing">..................................................  </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/TenPercentTestCurrentYear"/>
      </xsl:call-template>
    </input>  
   </div>
</div>

<!-- line 17b -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:7.2mm;padding-right:9px;">b</div>
  <div class="IRS990ScheduleA_LineDescIVB">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/TenPercentTestPriorYear"/>
      </xsl:call-template>
      <span style="font-weight:bold;">
         10%-facts-and-circumstances test—2009.
      </span>
      If the organization did not check a box on line 13, 16a, 16b, or 17a and line<br/>
     15 is 10% or more, and if the organization meets the "facts and circumstances" test, check this box and <b>stop here.</b><br/>
     Explain in Part IV how the organization meets the "facts and circumstances" test.  The organization qualifies  as a publicly<br/> supported organization
      <span class="IRS990ScheduleA_DotSpacing">..............................................  </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/TenPercentTestPriorYear"/>
      </xsl:call-template>
    </input>  
   </div>
</div>

<!-- line 18 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex" style="width:6mm;">18</div>
  <div class="IRS990ScheduleA_LineDescIVB">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PrivateFoundation170"/>
      </xsl:call-template>
      <span style="font-weight:bold;">
         Private Foundation
      </span>
      If the organization did not check a box on line 13, 16a, 16b, 17a or 17b, check this box and see<br/>
      instructions
      <span class="IRS990ScheduleA_DotSpacing">...................................................  </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/PrivateFoundation170"/>
      </xsl:call-template>
    </input>  
   </div>
</div>

<div class="styBB" style="width:187mm;"></div>

	<!--Page Footer Part II-->
<div class="pageEnd" style="width:187mm">
  <div style="float:right;">
    <span style="width:80px;"></span>  
    <span class="styBoldText"> Schedule A (Form 990 or 990-EZ) 2010</span> 
  </div>  
</div>
<!-- END Footer -->

<!-- Page Header -->
  <div class="styBB" style="width:187mm; padding-bottom:.5mm;">  
    <div style="float:left;">Schedule A (Form 990 or 990-EZ) 2010</div>
    <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></div>                    
  </div>  
<!-- END Page Header -->      

<!-- Part III header-->
<div class="styBB" style="width:187mm;">
  <div class="styPartName" style="width:20mm;">Part III</div>
  <div class="styPartDesc" style="width:162mm;">Support Schedule for Organizations Described in IRC 509(a)(2)<br />
      <span class="styNormalText">(Complete only if you checked the box on line 9 of Part I or if the organization
failed to qualify under Part II. If the organization fails to qualify under
the tests listed below, please complete Part II.)</span>
  </div>
</div>
<!-- <div class="styBB" style="width: 187mm">
  <div class="styPartName" style="margin-top: 2mm">Part III</div>
  <div class="styPartDesc" style="padding-top: 2mm;width: 157mm">Statements About Activities
        <span class="styNormalText">(See page 2 of the instructions.)</span>
  </div>  -->

<span class="styPartDesc" style="width:162mm;font-weight:bold">Section A. Public Support</span>

<!--Part III  table -->
<div class="IRS990ScheduleA_TableContainer" style="border-bottom-width:0px;">
   <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
     <tr>
      <th class="IRS990ScheduleA_GenericCell" style="width:60mm;font-weight:bold;border-bottom-width:0px;" scope="col" colspan="2">
        <span style="float: left; clear: both"> Calendar year</span><span class="styNormalText">(or fiscal year beginning in)</span>
      </th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(a)<span class="styNormalText"> 2006</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(b)<span class="styNormalText"> 2007</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(c)<span class="styNormalText"> 2008</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(d)<span class="styNormalText"> 2009</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(e)<span class="styNormalText"> 2010</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;border-right-width:0px;text_align:center" scope="col">(f)<span class="styNormalText"> Total</span></th>
    </tr>
    <tr>
    <!-- Line 1 -->
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">1</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Gifts, grants, contributions, and membership fees received. (Do not include any "unusual grants.") <span class="IRS990ScheduleA_DotSpacing">.</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContribReceived509/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContribReceived509/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContribReceived509/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContribReceived509/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContribReceived509/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GiftsGrantsContribReceived509/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
    <!-- Line 2 -->
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">2</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Gross receipts from admissions, merchandise sold or services performed, or facilities furnished in any activity that is related to the organization's tax-exempt purpose<span class="IRS990ScheduleA_DotSpacing">......</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsFromAdmissions/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsFromAdmissions/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsFromAdmissions/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsFromAdmissions/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsFromAdmissions/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsFromAdmissions/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
    <!-- Line 3 -->
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">3</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Gross receipts from activities that are not an unrelated trade or business under section 513<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsFromNonUBI/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsFromNonUBI/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsFromNonUBI/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsFromNonUBI/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsFromNonUBI/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsFromNonUBI/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
    <!-- Line 4 -->
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">4</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Tax revenues levied for the organization's benefit  and either paid to or expended on its behalf<span class="IRS990ScheduleA_DotSpacing">...</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedForOrgBenefit509/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedForOrgBenefit509/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedForOrgBenefit509/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedForOrgBenefit509/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedForOrgBenefit509/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxRevLeviedForOrgBenefit509/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">5</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">The value of services or facilities furnished by a governmental unit to the organization without charge<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
     <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
       <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ValueOfSvcsFcltsFurnishdByGovt/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">6</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;"><b>Total.</b> Add lines 1 through 5<span class="IRS990ScheduleA_DotSpacing">.</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <!-- Line 7a -->
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;padding-left:2mm;padding-right:5px;" valign="top">7a</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Amounts included on lines 1, 2, and 3 received from disqualified persons<span class="IRS990ScheduleA_DotSpacing">...</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmtsRecdFromDisqualPersons/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmtsRecdFromDisqualPersons/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmtsRecdFromDisqualPersons/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmtsRecdFromDisqualPersons/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmtsRecdFromDisqualPersons/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmtsRecdFromDisqualPersons/Total"/>
      </xsl:call-template>
      </td>
    </tr>

    <!-- Line 7b -->
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;padding-left:2mm;padding-right:5px;" valign="top"> b</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Amounts included on lines 2 and 3 received from other than disqualified persons that exceed the greater of $5,000 or 1% of the amount on line 13 for the year<span class="IRS990ScheduleA_DotSpacing">.</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmtsFromSubstContributors/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmtsFromSubstContributors/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmtsFromSubstContributors/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmtsFromSubstContributors/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmtsFromSubstContributors/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmtsFromSubstContributors/Total"/>
      </xsl:call-template>
      </td>
    </tr>

    <!-- Line 7c -->
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;padding-left:2mm;padding-right:5px;" valign="top"> c</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Add lines 7a and 7b<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SupportFromDQPsEtc/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SupportFromDQPsEtc/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SupportFromDQPsEtc/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SupportFromDQPsEtc/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SupportFromDQPsEtc/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SupportFromDQPsEtc/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <!-- Line 8 -->
      <tr>  
        <td class="IRS990ScheduleA_IndexCell" valign="top">8</td>
        <td class="IRS990ScheduleA_GenericCell" style="width:56mm;vertical-align:top;">
          <b>Public Support</b> (Subtract line 7c from line 6.)
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
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:1px;background-color:lightgrey;width:25mm;font-size:6pt;Verdana;">&nbsp;</td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/PublicSupportTotal509"/>
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
        <span style="float: left; clear: both"> Calendar year</span><span class="styNormalText"> (or fiscal year beginning in)</span>
      </th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(a)<span class="styNormalText"> 2006</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(b)<span class="styNormalText"> 2007</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(c)<span class="styNormalText"> 2008</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(d)<span class="styNormalText"> 2009</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;text_align:center" scope="col">(e)<span class="styNormalText"> 2010</span></th>
      <th class="IRS990ScheduleA_GenericCell" style="width:25mm;border-right-width:0px;text_align:center" scope="col">(f)<span class="styNormalText"> Total</span></th>
    </tr>
    <tr>
    <!-- Line 9 -->
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">9</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Amounts from line 6<span class="IRS990ScheduleA_DotSpacing">...</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Total509/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">10a</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Gross income from interest, dividends, payments received on securities loans, rents, royalties and income from similar sources<span class="IRS990ScheduleA_DotSpacing">..</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome509/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome509/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome509/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome509/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome509/CurrentTaxYear"/>
      </xsl:call-template>
      </td>

      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GrossInvestmentIncome509/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top"> b</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Unrelated business taxable income (less section 511 taxes) from businesses acquired after June 30, 1975<span class="IRS990ScheduleA_DotSpacing">.</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Post1975UBTI/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Post1975UBTI/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Post1975UBTI/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Post1975UBTI/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Post1975UBTI/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
       <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Post1975UBTI/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top"> c</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Add lines 10a and 10b<span class="IRS990ScheduleA_DotSpacing">.</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeAndUBTI/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeAndUBTI/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeAndUBTI/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeAndUBTI/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeAndUBTI/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeAndUBTI/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
    <!-- Line 11 -->
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">11</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;">Net income from unrelated business activities not included in line 10b, whether or not the business is regularly carried on<span class="IRS990ScheduleA_DotSpacing">.</span></td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetIncomeFromOtherUBI/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetIncomeFromOtherUBI/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetIncomeFromOtherUBI/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetIncomeFromOtherUBI/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetIncomeFromOtherUBI/CurrentTaxYear"/>
      </xsl:call-template>
      </td>
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/NetIncomeFromOtherUBI/Total"/>
      </xsl:call-template>
      </td>
    </tr>
    <tr>
    <!-- Line 12 -->
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">12</td>
          <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;vertical-align:top;">Other income. Do not include gain or loss from the sale of capital assets (Explain in Part IV.)
          <span class="IRS990ScheduleA_DotSpacing"></span>              
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
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome509/CurrentTaxYearMinus4Years"/>
          </xsl:call-template>
        </td>
        <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome509/CurrentTaxYearMinus3Years"/>
          </xsl:call-template>
        </td>
        <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome509/CurrentTaxYearMinus2Years"/>
          </xsl:call-template>
        </td>
        <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome509/CurrentTaxYearMinus1Year"/>
          </xsl:call-template>
        </td>
        <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome509/CurrentTaxYear"/>
          </xsl:call-template>
        </td>
        <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/OtherIncome509/Total"/>
          </xsl:call-template>
        </td>
      </tr>  
 <!-- Line 13 -->
    <tr>
      <td class="IRS990ScheduleA_IndexCell" style="width:4mm;border-bottom-width:0px;" valign="top">13</td>
      <td class="IRS990ScheduleA_GenericCell" style="width:56mm;border-bottom-width:0px;"><b>Total support</b> (Add lines 9, 10c, 11 and 12.)<span class="IRS990ScheduleA_DotSpacing">.</span></td>
      
      
<td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalSupportTotal/CurrentTaxYearMinus4Years"/>
      </xsl:call-template>
      </td>      
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalSupportTotal/CurrentTaxYearMinus3Years"/>
      </xsl:call-template>
      </td>      
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalSupportTotal/CurrentTaxYearMinus2Years"/>
      </xsl:call-template>
      </td>      
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalSupportTotal/CurrentTaxYearMinus1Year"/>
      </xsl:call-template>
      </td>      
      <td class="IRS990ScheduleA_MoneyCell" style="width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalSupportTotal/CurrentTaxYear"/>
      </xsl:call-template>
      </td>      
  
      <td class="IRS990ScheduleA_MoneyCell" style="border-right-width:0px;width:25mm;font-size:6pt;Verdana;">
       <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalSupportTotal/Total"/>
      </xsl:call-template>
      </td>
    </tr>
  </table>
</div>

<!--  2nd Table of Page 3 above -->

<!-- Part III Line 14 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">14</div>
  <div class="IRS990ScheduleA_LineDescIVAL">
  
    <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/First5Years509"/>
      </xsl:call-template>
      <span style="font-weight:bold;">
         First Five Years
      </span>
      If the Form 990 is for the organization's first, second, third, fourth, or fifth tax year as a 501(c)(3) organization,<br/>
      check this box and <b>stop here</b>
      <span class="IRS990ScheduleA_DotSpacing">............................................. </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/First5Years509"/>
      </xsl:call-template>
    </input>  
  </div>
    <div class="styBB" style="width:187mm;"></div>
</div>
<!-- line 14 ends -->

<div class="styBB" style="width:187mm;">
<span class="styPartDesc" style="width:162mm;font-weight:bold">Section C.  Computation of Public Support Percentage</span>
</div>

  <!-- line 15 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">15</div>
  <div class="IRS990ScheduleA_LineDescIVA">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PublicSupportPercentage509"/>
      </xsl:call-template>
      Public Support Percentage for 2010 (line 8 column (f) divided by line 13 column (f))
       <span class="IRS990ScheduleA_DotSpacing">.........  </span>
     </label> 
   </div>
    <div class="styLNRightNumBox" style="height:4mm;">15</div>
    <div class="styLNAmountBox" style="height:4mm;"><xsl:call-template name="PopulatePercent"><xsl:with-param name="TargetNode" select="$FormData/PublicSupportPercentage509" /></xsl:call-template></div>
</div>
 
   <!-- line 16 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">16</div>
  <div class="IRS990ScheduleA_LineDescIVA">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PriorYearSupportPercentage"/>
      </xsl:call-template>
      Public support percentage from 2009 Schedule A, Part III, line 15
       <span class="IRS990ScheduleA_DotSpacing">...............  </span>
     </label> 
    </div>
     <div class="styLNRightNumBox" style="height:4mm;">16</div>
    <div class="styLNAmountBox" style="height:4mm;"><xsl:call-template name="PopulatePercent"><xsl:with-param name="TargetNode" select="$FormData/PriorYearSupportPercentage" /></xsl:call-template></div>
 <div class="styBB" style="width:187mm;"></div>

</div>

<div class="styBB" style="width:187mm;">
<span class="styPartDesc" style="width:162mm;font-weight:bold">Section D. Computation of Investment Income Percentage</span>
</div>

  <!-- line 17 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">17</div>
  <div class="IRS990ScheduleA_LineDescIVA">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomePercentage"/>
      </xsl:call-template>
      Investment income percentage for <b>2010</b> (line 10c column (f) divided by line 13 column (f))
       <span class="IRS990ScheduleA_DotSpacing">......  </span>
     </label> 
   </div>
    <div class="styLNRightNumBox" style="height:4mm;">17</div>
    <div class="styLNAmountBox" style="height:4mm;"><xsl:call-template name="PopulatePercent"><xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomePercentage" /></xsl:call-template></div>

</div>
 
   <!-- line 18 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">18</div>
  <div class="IRS990ScheduleA_LineDescIVA">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PriorYrInvestIncomePercentage"/>
      </xsl:call-template>
      Investment income percentage from <b>2009</b> Schedule A, Part III, line 17
       <span class="IRS990ScheduleA_DotSpacing">.............  </span>
     </label> 
   </div>
    <div class="styLNRightNumBox" style="height:4mm;">18</div>
    <div class="styLNAmountBox" style="height:4mm;"><xsl:call-template name="PopulatePercent"><xsl:with-param name="TargetNode" select="$FormData/PriorYrInvestIncomePercentage" /></xsl:call-template></div>

</div>


<!-- line 19a -->
<div class="IRS990ScheduleA_LineContainer" style="padding-left:0.8mm;">
  <div class="IRS990ScheduleA_LineIndex" style="width:5mm;padding-right:9px;">19a</div>
  <div class="IRS990ScheduleA_LineDescIVB">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThreePercntTestsCY509"/>
      </xsl:call-template>
      <span style="font-weight:bold;">
         33 <span style="font-size:5pt;">1/3</span>% support tests—2010.
      </span>
      If the organization did not check the box on line 14, and line 15 is more than 33 <span style="font-size:5pt;">1/3</span>% and line 17 is not more than 33 <span style="font-size:5pt;">1/3</span>%, check this box and <b>stop here.</b>  The organization qualifies  as a publicly supported organization
      <span class="IRS990ScheduleA_DotSpacing">.......... </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThreePercntTestsCY509"/>
      </xsl:call-template>
    </input>  
   </div>
</div>

<!-- line 19b -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">b</div>
  <div class="IRS990ScheduleA_LineDescIVAL">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThreePercntTestsPY509"/>
      </xsl:call-template>
      <span style="font-weight:bold;">
         33 <span style="font-size:5pt;">1/3</span>% support tests—2009.
      </span>
      If the organization did not check a box on line 14 or line 19a, and line 16 is more than 33 <span style="font-size:5pt;">1/3</span>% and line 18 is not more than 33 <span style="font-size:5pt;">1/3</span>%, check this box and <b>stop here.</b> The organization qualifies as a publicly supported organization
      <span class="IRS990ScheduleA_DotSpacing">.... </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/ThirtyThreePercntTestsPY509"/>
      </xsl:call-template>
    </input>  
   </div>
</div>

<!-- line 20 -->
<div class="IRS990ScheduleA_LineContainer">
  <div class="IRS990ScheduleA_LineIndex">20</div>
  <div class="IRS990ScheduleA_LineDescIVAL">
      <label>
       <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$FormData/PrivateFoundation509"/>
      </xsl:call-template>
      <span style="font-weight:bold;">
         Private Foundation
      </span>
      If the organization did not check a box on line 14, 19a or 19b, check this box and see instructions
      <span class="IRS990ScheduleA_DotSpacing">..... </span>
       <img src="{$ImagePath}/990SchA_Bullet_Line.gif" alt="right arrow"/>
    </label> 
     <input class="IRS990ScheduleA_Checkbox" type="checkbox">
       <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$FormData/PrivateFoundation509"/>
      </xsl:call-template>
    </input>  
   </div>
</div>

<div class="styBB" style="width:187mm;"></div>

<!--Page Footer Part III-->
<div class="pageEnd" style="width:187mm">
  <div style="float:right;">
    <span style="width:80px;"></span>  
    <span class="styBoldText"> Schedule A (Form 990 or 990-EZ) 2010</span> 
  </div>  
</div>

 <!-- Page Header -->
  <div class="styBB" style="width:187mm; padding-bottom:.5mm;">  
    <div style="float:left;">Schedule A (Form 990 or 990-EZ) 2010</div>
    <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span></div>                    
  </div>  
<!-- END Page Header --> 
  			
<!-- Part IV header-->
<div class="styBB" style="width: 187mm">
  <div class="styPartName" style="width: 20mm">Part IV</div>
  <div class="styPartDesc" style="width: 167mm">Supplemental Information.
       <span class="styNormalText">Supplemental Information. Complete this part to provide the explanation required by Part II, line 10; Part II, line 17a or 17b; or Part III, line 12. Also complete this part for any additional information. (See instructions).</span>
  </div>
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
                    <xsl:with-param name="TargetNode" select="$FormData/FactsAndCircumstancesTest"/>
                  </xsl:call-template>
                </td>
          </tr>
       </table>
       
       <!--***FactsAndCircumTestENDGeneralExplanBEGIN****************-->
       
  <xsl:variable name="pos" select="position()"/>
						<xsl:if test="(position() mod 5)=1">
							<span style="float:right">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/GeneralExplanation"/>
									<xsl:with-param name="containerHeight" select="5"/>
									<xsl:with-param name="containerID" select="'SUPctn'"/>
								</xsl:call-template>
							</span>
							<div class="styTableContainer" style="width: 187mm;  border-bottom-width: 1px" id="SUPctn">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
									<thead class="styTableThead">
										<tr class="styDepTblHdr">
											<th class="styDepTblCell" scope="col" style="width:187mm;border-right-width:0px;border-left-width:0px">Explanation</th>
										</tr>
									</thead>
									<tfoot/>
									<tbody valign="top">
										<tr>
											<td class="styTableCell" style="border-right-width: 0px; width:187mm;text-align:left ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/GeneralExplanation"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styTableCell" style="border-right-width: 0px; width:187mm;text-align:left ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/GeneralExplanation[$pos + 1]"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styTableCell" style="border-right-width: 0px; width:187mm;text-align:left ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/GeneralExplanation[$pos + 2]"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styTableCell" style="border-right-width: 0px; width:187mm;text-align:left ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/GeneralExplanation[$pos + 3]"/>
												</xsl:call-template>
											</td>
										</tr>
										</tbody>
								</table>
							</div>
						</xsl:if>
					
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="GeneralExplanation"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'SUPctn' "/>
					</xsl:call-template>


 
    
 <!--Page Footer-->
<div class="pageEnd" style="width:187mm">
  <div style="float:right;">
    <span style="width:80px;"></span>  
    <span class="styBoldText"> Schedule A (Form 990 or 990-EZ) 2010</span> 
  </div>  
</div>  
<!--END Page Footer-->


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
    <xsl:with-param name="TargetNode" select="$FormData" />
    <xsl:with-param name="DescWidth" select="100"/>
  </xsl:call-template>
</table>

    <!-- Additonal Data Table for separated data from Part I, Line 4 -->
    <xsl:if test="($Print = $Separated) and (count($FormData/HospitalNameAndAddress) &gt; 2) ">
      <span class="styRepeatingDataTitle">
        <br/>Form 990, Schedule A, Part I, Line 4 - A medical research organization operated in conjunction with a hospital. Section 170(b)(1)(A)(iii). Enter the hospital's name, city, and state:
      </span>
      <table class="styDepTbl" style="font-size:7pt">
        <thead class="styTableHead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell">Hospital Name, City, and State</th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="$FormData/HospitalNameAndAddress">
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
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1"/>
                </xsl:call-template><br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2"/>
                </xsl:call-template>
              </span>
                
                <br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="City"/>
                </xsl:call-template>,<span style="width:3px" />
                <xsl:choose>
                  <xsl:when test="Address/State">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="State"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="Country"/>
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
    
    
    
    <!-- Additonal Data Table for separated data from Part I, Line 11h -->
    <xsl:if test="($Print = $Separated) and (count($FormData/SupportedOrgInformation) &gt; 2) ">
      <span class="styRepeatingDataTitle">
        <br/>Form 990, Schedule A, Part I, Line 11h - Provide the following information about the organizations the organization supports. 
      </span>
      <table class="styDepTbl" style="font-size:7pt">
        <thead class="styTableHead">
          <tr class="styDepTblHdr">
          
     
     
        <th class="IRS990ScheduleA_GenericCell" style="width:32mm;"  rowspan="2">(i)<br/><span class="styNormalText"> Name of Supported Organization</span></th>
      	 <th class="IRS990ScheduleA_GenericCell" style="width:20mm;border-right-width:1px"  rowspan="2">(ii)<br/><span class="styNormalText"> EIN</span></th>
	 <th class="IRS990ScheduleA_GenericCell" style="width:32mm;border-right-width:1px;"  rowspan="2">(iii)<br/><span 			class="styNormalText">  Type of organization (described on lines 1- 9 above or IRC section.)</span></th>
	 <th class="IRS990ScheduleA_GenericCell" style="width:24mm;border-right-width:1px;"  colspan="2">(iv)<br/><span 			class="styNormalText">  Is the organization in (i) listed in your governing document? </span></th>
	<th class="IRS990ScheduleA_GenericCell" style="width:24mm;border-right-width:1px;"  colspan="2">(v)<br/><span 			class="styNormalText"> Did you notify the organization in (i) of your support? </span></th>
	<th class="IRS990ScheduleA_GenericCell" style="width:24mm;border-right-width:1px;" colspan="2">(vi)<br/><span class="styNormalText">  Is the organization in (i) organized in the U.S.? </span></th>
       <th class="IRS990ScheduleA_GenericCell" style="width:32mm;border-right-width:0px;" rowspan="2"  colspan="1">(vii)<br/><span class="styNormalText">  Amount of support? </span></th>
      </tr>
      	<tr>
			<th class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;" >Yes</th>
 			<th class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;" >No</th>
 			<th class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;" >Yes</th>
 			<th class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;" >No</th>
 	 		<th class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;" >Yes</th>
 			<th class="IRS990ScheduleA_GenericCell" style="width:9mm;border-right-width:1px;" >No</th>

	</tr>

<!--            <th class="styDepTblCell" >(a) Name(s) of supported organization(s)</th>
            <th class="styDepTblCell" style="width:25mm;">(b) Line number from above</th>
          </tr>  -->
        </thead>
        <tbody>
          <xsl:for-each select="$FormData/SupportedOrgInformation">
            <tr>
              <!--Define background colors to the rows -->
              <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <td class="styDepTblCell" style="text-align:left;font-family:verdana;font-size:6pt">(<xsl:number value="position()" format="A"/>)
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1"/>
                </xsl:call-template><br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2"/>
                </xsl:call-template>
              </td>
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="EIN"/>
                </xsl:call-template> 
              </td>  
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="TypeOfOrganization"/>
                </xsl:call-template> 
              </td>      
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center;">
              <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="ListedInGoverningDoc"/>
                </xsl:call-template> 
              </td>  
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center; ">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="ListedInGoverningDoc"/>
                </xsl:call-template> 
              </td>      
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="SupportedOrganizationNotified"/>
                </xsl:call-template> 
              </td>  
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center; ">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="SupportedOrganizationNotified"/>
                </xsl:call-template> 
              </td>   
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="OrganizedInUS"/>
                </xsl:call-template> 
              </td>  
              <td class="IRS990ScheduleA_GenericCell" style="text-align:center; ">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="OrganizedInUS"/>
                </xsl:call-template> 
              </td>      
              <td class="IRS990ScheduleA_GenericCell" style="text-align:right;border-right-width:0px">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Amount"/>
                </xsl:call-template> 
              </td>      
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
   </xsl:if>
    <!-- End Part I, Line 11h separated data -->
        
    <!-- Additonal Data Table for separated data from Part VII, Line 51d -->
 <xsl:if test="($Print = $Separated) and (count($FormData/TransferSchedule) &gt; 16) ">
      <span class="styRepeatingDataTitle">
        <br/>Form 990, Schedule A, Part VII, Line 51d - If the answer to any of the above is "Yes," complete the following schedule. Column (b) should always show the fair market value of the goods, other assets, or services given by the reporting organization. If the organization received less than fair market value in any transaction or sharing arrangement, show in column (d) the value of the goods, other assets, or services received:
      </span>
      <table class="styDepTbl" style="font-size:7pt">
        <thead class="styTableHead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" style="width:14mm;text_align:center;" >
              <span style="font-weight:bold">(a)</span><br />Line no.
            </th>
            <th class="styDepTblCell" style="width:26mm;text_align:center;" >
              <span style="font-weight:bold">(b)</span><br />Amount involved
            </th>
            <th class="styDepTblCell" style="width:70mm;text_align:center;" >
              <span style="font-weight:bold">(c)</span><br />Name of noncharitable exempt organization
            </th>
            <th class="styDepTblCell" style="width:70mm;text_align:center;" >
              <span style="font-weight:bold">(d)</span><br />Description of transfers, transactions, and sharing arrangement
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
                  <xsl:with-param name="TargetNode" select="NameOfNoncharitableEO/BusinessNameLine1"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NameOfNoncharitableEO/BusinessNameLine2"/>
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
        <br/>Form 990, Schedule A, Part IV, Line 52b - If "Yes," complete the following schedule:
      </span>
      <table class="styDepTbl" style="font-size:7pt">
        <thead class="styTableHead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" style="width:70mm;text_align:center;">
              <span style="font-weight:bold;">(a)</span><br />Name of organization
            </th>
            <th class="styDepTblCell" style="width:40mm;text_align:center;">
              <span style="font-weight:bold;">(b)</span><br />Type of organization
            </th>
            <th class="styDepTblCell" style="width:70mm;text_align:center;">
              <span style="font-weight:bold;">(c)</span><br />Description of relationship
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
                  <xsl:with-param name="TargetNode" select="NameOfOrganization/BusinessNameLine1"/>
                </xsl:call-template><br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NameOfOrganization/BusinessNameLine2"/>
                </xsl:call-template>
              </td>
              
              <td class="styDepTblCell" style="text-align:center">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="TypeOfOrganization"/>
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
  <xsl:param name="NumOfTotRows" />
  <xsl:param name="CurrentRowCount" />
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
      <xsl:with-param name="NumOfTotRows" select="$NumOfTotRows" />
      <xsl:with-param name="CurrentRowCount" select="$CurrentRowCount + 1" />
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<!-- This template is used to add blank rows to the table in Part VII Line 52b where the number of rows of data -->
<!-- is fewer than the container height (in this case 16). This template will continue to add blank rows until the -->
<!-- total number of rows have been filled in, including data rows and blank rows. -->
<xsl:template name="Part7Line52bFillerRows">
  <xsl:param name="NumOfTotRows" />
  <xsl:param name="CurrentRowCount" />
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
      <xsl:with-param name="NumOfTotRows" select="$NumOfTotRows" />
      <xsl:with-param name="CurrentRowCount" select="$CurrentRowCount + 1" />
    </xsl:call-template>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>
