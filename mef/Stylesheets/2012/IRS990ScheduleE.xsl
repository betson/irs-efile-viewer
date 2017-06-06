<?xml version="1.0" encoding="UTF-8"?>
<!-- 07/22/2010 - Modified by Jeremy Nichols per BSP101319OTH -->
<!-- 09/17/2010 - Modified by Jeremy Nichols per defect #27210 -->
<!-- 07/18/2011 - Modified for TY 2011 per UWR #40502 - Jeremy Nichols -->
<!-- 10/05/2011 - Modified per defect #30285 - Jeremy Nichols -->
<!-- 06/18/2012 - Modified for TY 2012 per UWR #58215 - Jeremy Nichols -->

<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp "&#160;">
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!--xmlns:fo="http://www.w3.org/1999/XSL/Format">-->
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS990ScheduleEStyle.xsl"/>
  
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <!--xsl:param name="RtnSummaryData" select="/TEGEOrganizationReturn/ReturnSummary"/-->
  <xsl:param name="FormData" select="$RtnDoc/IRS990ScheduleE"/>
  <xsl:param name="Form990ScheduleEData" select="$RtnDoc/IRS990ScheduleE" />

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
  <meta name="Description" content="Form 990 Schedule E" />
   <meta name="GENERATOR" content="IBM WebSphere Studio"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>
  <style type="text/css">
    <xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS990ScheduleEStyle"/>
      <xsl:call-template name="AddOnStyle"></xsl:call-template>
  </xsl:if>  
 </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>

<body class="styBodyClass">
 <form name="Form990ScheduleE" />
  <xsl:call-template name="DocumentHeader"></xsl:call-template>
<!-- BEGIN FORM HEADER -->
<div class="IRS990ScheduleE_LineContainer" style="height:20mm;">
  <!-- Form Name -->
  <div class="IRS990ScheduleE_FormNumBlock" style="padding-top:.5mm;padding-bottom:0px;">
     <span style="font-size:10pt;font-weight:bold;padding-bottom:0mm;height:4mm;">SCHEDULE E</span>
    
     <span style="font-size:9pt;font-weight:bold;height:3mm;font-family:'Arial Narrow';padding-top:0px;padding-bottom:0px;">(Form 990 or 990-EZ)</span>
     <br /> 
       <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$FormData"/>      
       </xsl:call-template>
    <div style="padding-top:4mm;font-weight:bold;" />


     <span class="styAgency" style="height:2mm;">Department of the Treasury</span>
    
     <span class="styAgency" style="padding-bottom:0px;height:2mm;">Internal Revenue Service</span>
  </div>

  <!-- Form Title Box -->
  <div class="IRS990ScheduleE_FormTitleBlock" style="padding-top:.5mm;">
    <!-- Form Title -->
   
    <span class="styMainTitle" style="font-weight:bold;font-size:17pt;">Schools</span>
     <div style="padding-top:1mm;font-weight:bold;" />

 
    <span style="width:121mm;font-size:6pt;font-weight:bold;padding-bottom:1mm;"><img src="{$ImagePath}/990SchF_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/>Complete if the organization answered "Yes" to Form 990, Part IV, line 13,</span> 
    <span style="width:121mm;font-size:6pt;font-weight:bold;padding-bottom:1mm;">or Form 990-EZ, Part VI, line 48.</span>
    <span style="width:121mm;font-size:6pt;font-weight:bold;padding-bottom:1mm;"><img src="{$ImagePath}/990SchF_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/> Attach to Form 990 or Form 990-EZ. </span>
  </div>
  <!-- Tax Year Box -->
  <div class="IRS990ScheduleE_FormYearBlock" >
    <!-- OMB No. -->
    <div class="IRS990ScheduleE_OMB" style="padding-top:.5mm;">OMB No. 1545-0047</div>
    <!-- Tax Year -->
    <div class="IRS990ScheduleE_TaxYear" style="padding-bottom:.5px;padding-top:0mm;">
       <span>20<span class="styTYColor">12</span></span></div>
    <div class="styPartName" style="font-size:6pt;height:5.25mm;padding-left:6mm;width:30mm;padding-top:.25px;text-align:left">Open to Public Inspection
       </div> 
  </div>
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
  
  <div class="styGenericDiv" style="width:52mm;height:4mm;padding-left:1.5mm;">
    <span class="styBoldText">Employer identification number</span>
    <br/><br/>
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">EIN</xsl:with-param>
    </xsl:call-template>
  </div>
</div>
<!-- End Name and Identifying Number Section-->     

 <!-- line 1 -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="styPartName" >Part I</div>
  <div class="IRS990ScheduleE_LineDesc" style="width:150mm;border-right-width:0px;border-top-width:0px;"></div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-top-width:0px;"></div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-top-width:0px;">YES</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;border-top-width:0px;">NO</div>
</div>
<div class="IRS990ScheduleE_LineContainer" >
  <div class="IRS990ScheduleE_LineIndex" style="padding-top:1.5mm;">1</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:1.5mm;padding-bottom:0mm;">
  Does the organization have a racially nondiscriminatory policy toward students by statement in its charter, bylaws,
</div>
  <div class="IRS990ScheduleE_LineIndexMidFiller"  style="padding-top:1.5mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="padding-top:1.5mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="border-right-width:0px;padding-top:1.5mm;"></div>
  </div>

<div class="IRS990ScheduleE_LineContainer" >
  <div class="IRS990ScheduleE_SubLineIndex" ></div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:.5mm;">
 other governing instrument, or in a resolution of its governing body?
    <span class="IRS990ScheduleE_Dotspacing">......................</span>
  </div>
 <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">1</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
    <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/NondiscriminatoryPolicyStmt"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/NondiscriminatoryPolicyStmt"/>
      </xsl:call-template>
      </span>
  </div>
</div>

 <!-- line 2 -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex" style="padding-top:1mm;">2</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:1mm;">
    Does the organization include a statement of its racially nondiscriminatory policy toward students in all its
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;padding-top:1mm;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_SubLineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:.25mm;">
    brochures, catalogues, and other written communications with the public dealing with student admissions,
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_SubLineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc">
    programs, and scholarships?
    <span class="IRS990ScheduleE_Dotspacing" style="padding-left:1mm;">......................................</span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">2</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/PolicyStatementInBrochuresEtc"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/PolicyStatementInBrochuresEtc"/>
      </xsl:call-template>
      </span>
  </div>
</div>


 <!-- line 3 -->
<div class="IRS990ScheduleE_LineContainer" >
  <div class="IRS990ScheduleE_LineIndex" style="padding-top:.5mm;">3</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:.5mm;">
    Has the organization publicized its racially nondiscriminatory policy through newspaper or broadcast media during
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_SubLineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc">
    the period of solicitation for students, or during the registration period if it has no solicitation program, in a way
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer" >
  <div class="IRS990ScheduleE_SubLineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc">
    that makes the policy known to all parts of the general community it serves? If "Yes," please describe. If "No,"
  <!--  <span class="IRS990ScheduleE_Dotspacing">..................</span>-->
  </div>
   <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"></div>
</div>

<div class="IRS990ScheduleE_LineContainer" >
  <div class="IRS990ScheduleE_SubLineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc">
     please explain.  If you need more space use Part II.
   <span class="IRS990ScheduleE_Dotspacing" style="padding-left:1mm;">.............................</span>
  </div>


 <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">3</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/PolicyPublViaBroadcastMedia"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/PolicyPublViaBroadcastMedia"/>
      </xsl:call-template>
      </span>
  </div>
</div>

<!--<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc">
    If "Yes," please describe; if "No," please explain. (If you need more space, attach a separate statement.)
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"></div>
</div> -->
<div class="IRS990ScheduleE_LineContainer" style="height:4mm;">
  <div class="IRS990ScheduleE_LineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;border-right-width:1px;">
       <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/PubViaBroadcastMediaExpln"/>
      </xsl:call-template>
</div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="height:100%"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="height:100%"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;height:100%"></div>
</div>
<xsl:if test="string-length($FormData/PubViaBroadcastMediaExpln) &lt;1">
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"></div>
</div>
</xsl:if>


 <!-- line 4 -->
<div class="IRS990ScheduleE_LineContainer" >
  <div class="IRS990ScheduleE_LineIndex" style="padding-top:1mm;">4</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:1mm;">
    Does the organization maintain the following?
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="padding-top:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="padding-top:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="border-right-width:0px;padding-top:1mm;"></div>
</div>

<!-- Line 4a -->
<div class="IRS990ScheduleE_LineContainer" style="padding-bottom:0mm;">
  <div class="styLNLeftLtrBoxDD" style="padding-top:.75mm;">a</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:1mm;padding-bottom:0mm;">
    Records indicating the racial composition of the student body, faculty, and administrative staff?
    <span class="IRS990ScheduleE_Dotspacing" style="padding-left:1.75mm;padding-top:1mm;">..........</span>
  </div>
  
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:1mm;">4a</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:1mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintRacialCompositionRecords"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:1mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintRacialCompositionRecords"/>
      </xsl:call-template>
      </span>
  </div>
</div>

<!-- line 4b -->
<div class="IRS990ScheduleE_LineContainer" style="height:4mm;padding-top:0mm;" >
  <div class="styLNLeftLtrBoxDD" style="padding-bottom:0mm;padding-top:1mm;">b</div>
  
   <div class="IRS990ScheduleE_LineDesc" style="padding-top:1mm;">
    Records documenting  that scholarships and other financial assistance are awarded on a racially nondiscriminatory
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="padding-top:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="padding-top:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="border-right-width:0px;padding-top:1mm;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_SubLineIndex" style="padding-top:.5mm;"></div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:.5mm;">
    basis?
    <span class="IRS990ScheduleE_Dotspacing" style="padding-left:1.5mm;padding-top:.5mm;">...............................................</span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">4b</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintScholarshipsRecords"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintScholarshipsRecords"/>
      </xsl:call-template>
      </span>
  </div>
</div>

<!-- line 4c -->
<div class="IRS990ScheduleE_LineContainer" style="height:4mm;padding-bottom:0mm;">
  <div class="styLNLeftLtrBoxDD" style="height:4mm;padding-bottom:0mm;padding-top:.75mm;">c</div>
  <div class="IRS990ScheduleE_LineDesc" style="height:4mm;padding-top:1mm;padding-bottom:0mm;" >
    Copies of all catalogues, brochures, announcements, and other written communications to the public dealing
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:4mm;padding-bottom:0mm;padding-top:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:4mm;padding-bottom:0mm;padding-top:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="border-right-width:0px;height:4mm;padding-bottom:0mm;padding-top:1mm;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer" style="height:4mm;padding-top:0mm;">
  <div class="IRS990ScheduleE_SubLineIndex" style="height:4mm;padding-top:.5mm;"></div>
  <div class="IRS990ScheduleE_LineDesc" style="height:4mm;padding-top:.5mm;">
    with student admissions, programs, and scholarships?
    <span class="IRS990ScheduleE_Dotspacing" style="padding-left:1mm;padding-top:.5mm;">...........................</span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">4c</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintCopiesOfBrochuresEtc"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintCopiesOfBrochuresEtc"/>
      </xsl:call-template>
      </span>
  </div>
</div>

<!-- line 4d -->
<div class="IRS990ScheduleE_LineContainer" >
  <div class="styLNLeftLtrBoxDD" style="padding-top:1mm;">d</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:1.25mm;padding-bottom:.25mm;">
    Copies of all material used by the organization or on its behalf to solicit contributions?
    <span class="IRS990ScheduleE_Dotspacing" style="padding-left:.5mm;padding-top:1mm;">..............</span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:1.25mm;">4d</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:1.25mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintCopiesOfAllSolicitations"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:1.25mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintCopiesOfAllSolicitations"/>
      </xsl:call-template>
      </span>
  </div>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex" style="padding-top:1mm;"></div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:1mm;">
    If you answered "No" to any of the above, please explain. If you need more space, use Part II.
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;padding-top:1mm;"></div>
</div>
<!-- combine comment lines, fix later -->
<div class="IRS990ScheduleE_LineContainer" style="height:4mm">
  <div class="IRS990ScheduleE_LineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:1mm;border-bottom-style:solid;border-bottom-width:1px;border-right-width:1px;">
       <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/OrgDoesNotMaintainExplanation"/>
      </xsl:call-template>
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="height:100%"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="height:100%"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;height:100%"></div>
</div>
<xsl:if test="string-length($FormData/OrgDoesNotMaintainExplanation) &lt;1">
<!-- changed &lt to &gt to get the lines to print out -  11/27/2007 - with &lt it only prints out 1 line -->

<div class="IRS990ScheduleE_LineContainer" >
  <div class="IRS990ScheduleE_LineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"></div>
</div>
</xsl:if>

 <!-- line 5 -->
<div class="IRS990ScheduleE_LineContainer"  >
  <div class="IRS990ScheduleE_LineIndex" style="padding-top:1mm;">5</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:1mm;">
    Does the organization discriminate by race in any way with respect to:
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;padding-top:1mm;"></div>
</div>

<!-- line 5a -->
<div class="IRS990ScheduleE_LineContainer"  >
  <div class="styLNLeftLtrBoxDD" style="padding-bottom:.5mm;padding-top:.5mm;">a</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:.5mm;" >
    Students' rights or privileges?
    <span class="IRS990ScheduleE_Dotspacing" style="padding-left:.75mm;">.....................................</span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">5a</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceStudentsRights"/>
      </xsl:call-template>
       </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceStudentsRights"/>
      </xsl:call-template>
      </span>
  </div>
</div>

 <!-- line 5b -->
<div class="IRS990ScheduleE_LineContainer" style="height:1mm;">
  <div class="IRS990ScheduleE_LineIndex" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineDesc" style="height:1mm;">
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:1mm;border-right-width:0px;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftLtrBoxDD" style="padding-bottom:.5mm;padding-top:0mm;">b</div>
  <div class="IRS990ScheduleE_LineDesc">
    Admissions policies?
    <span class="IRS990ScheduleE_Dotspacing" style="padding-left:.5mm;">.........................................</span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">5b</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceAdmissPolicies"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceAdmissPolicies"/>
      </xsl:call-template>
      </span>
  </div>
</div>

 <!-- line 5c -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc">
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFiller"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="border-right-width:0px;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftLtrBoxDD" style="padding-top:0mm;padding-bottom:.5mm;">c</div>
  <div class="IRS990ScheduleE_LineDesc">
    Employment of faculty or administrative staff?
    <span class="IRS990ScheduleE_Dotspacing" style="padding-left:.75mm;">..............................</span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">5c</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceEmplmnFaculty"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceEmplmnFaculty"/>
      </xsl:call-template>
      </span>
  </div>
</div>
 <!-- line 5d -->
<div class="IRS990ScheduleE_LineContainer" style="height:1mm;">
  <div class="IRS990ScheduleE_LineIndex" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineDesc" style="height:1mm;">
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:1mm;border-right-width:0px;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer" >
  <div class="styLNLeftLtrBoxDD" style="padding-top:0mm;padding-bottom:0mm;height:1mm;">d</div>
  <div class="IRS990ScheduleE_LineDesc" >
    Scholarships or other financial assistance?
    <span class="IRS990ScheduleE_Dotspacing">................................</span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">5d</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceScholarships"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceScholarships"/>
      </xsl:call-template>
      </span>
  </div>
</div>

 <!-- line 5e -->
<div class="IRS990ScheduleE_LineContainer" style="height:1mm;">
  <div class="IRS990ScheduleE_LineIndex" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineDesc" style="height:1mm;">
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:1mm;border-right-width:0px;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftLtrBoxDD" style="padding-top:0mm;padding-bottom:0mm;">e</div>
  <div class="IRS990ScheduleE_LineDesc">
    Educational policies?
    <span class="IRS990ScheduleE_Dotspacing">.........................................</span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">5e</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceEducPolicies"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceEducPolicies"/>
      </xsl:call-template>
      </span>
  </div>
</div>

 <!-- line 5f -->
<div class="IRS990ScheduleE_LineContainer" style="height:1mm;">
  <div class="IRS990ScheduleE_LineIndex" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineDesc" style="height:1mm;">
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:1mm;border-right-width:0px;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer" >
  <div class="styLNLeftLtrBoxDD" style="padding-bottom:.5mm;padding-top:0mm;">f</div>
  <div class="IRS990ScheduleE_LineDesc">
    Use of facilities?
    <span class="IRS990ScheduleE_Dotspacing">...........................................</span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">5f</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceUseOfFclts"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceUseOfFclts"/>
      </xsl:call-template>
      </span>
  </div>
</div>

 <!-- line 5g -->
<div class="IRS990ScheduleE_LineContainer" style=" height:1mm;">
  <div class="IRS990ScheduleE_LineIndex" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineDesc" style="height:1mm;">
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="border-right-width:0px;height:1mm;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftLtrBoxDD" style="padding-top:0mm;padding-bottom:.5mm;">g</div>
  <div class="IRS990ScheduleE_LineDesc">
    Athletic programs?
    <span class="IRS990ScheduleE_Dotspacing">..........................................</span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">5g</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceAthleticProg"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceAthleticProg"/>
      </xsl:call-template>
      </span>
  </div>
</div>

<div class="IRS990ScheduleE_LineContainer" style="height:1mm;" >
  <div class="IRS990ScheduleE_LineIndex" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineDesc" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:1mm;border-bottom:0mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:1mm;border-bottom:0mm;" ></div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:1mm;border-right-width:0px;border-bottom:0mm;"></div>
</div> 




 <!-- line 5h -->
<div class="IRS990ScheduleE_LineContainer" >
  <div class="styLNLeftLtrBoxDD" style="padding-top:.5mm;padding-bottom:.5mm;">h</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:.5mm;">
    Other extracurricular activities?
    <span class="IRS990ScheduleE_Dotspacing">.....................................</span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">5h</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceOtherActy"/>
      </xsl:call-template>
       </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceOtherActy"/>
      </xsl:call-template>
      </span>
  </div>
</div>
<!-- supplemental info line -->
<!-- need to combine the multiple lines.  fix later -->
<div class="IRS990ScheduleE_LineContainer" >
  <div class="IRS990ScheduleE_LineIndex" ></div>
  <div class="IRS990ScheduleE_LineDesc" >
    If you answered "Yes" to any of the above, please explain. If you need more space, use Part II.
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" ></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" ></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer" style="height:4mm;">
  <div class="IRS990ScheduleE_LineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;border-right-width:1px;">
       <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceExplanation"/>
      </xsl:call-template>
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="height:100%"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="height:100%"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;height:100%"></div>
</div>
<xsl:if test="string-length($FormData/DiscriminateRaceExplanation) &lt;1">
  <div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer" >
  <div class="IRS990ScheduleE_LineIndex"></div>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"></div>
</div>
</xsl:if>

 <!-- line 6a -->

<div class="IRS990ScheduleE_LineContainer" >
  <div class="IRS990ScheduleE_LineIndex" style="padding-right:5px;padding-top:.5mm;">6a</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-bottom:.5;padding-top:.5mm;">
    Does the organization receive any financial aid or assistance from a governmental agency?
       <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$FormData/GovernmentFinancialAid"/>
      </xsl:call-template>
    <span class="IRS990ScheduleE_Dotspacing" style="padding-left:.75mm;">...........</span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">6a</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/GovernmentFinancialAidReceived"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/GovernmentFinancialAidReceived"/>
      </xsl:call-template>
      </span>
  </div>
</div>

 <!-- line 6b -->
<!--<div class="IRS990ScheduleE_LineContainer" style="height:1mm;">
  <div class="IRS990ScheduleE_LineIndex" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineDesc" style="height:1mm;">
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="height:1mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;height:1mm;"></div>
</div> -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftLtrBox" style="padding-left:5mm;padding-bottom:0mm;" >b</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:0mm;">
    Has the organization's right to such aid ever been revoked or suspended?
    <span class="IRS990ScheduleE_Dotspacing" style="padding-left:.75mm;">...................</span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;" >6b</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/GovernmentFinancialAidRevoked"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/GovernmentFinancialAidRevoked"/>
      </xsl:call-template>
      </span>
  </div>
</div>
<!-- supplemental info line -->
<div class="IRS990ScheduleE_LineContainer" >
  <div class="IRS990ScheduleE_LineIndex" style="padding-top:.5mm;"></div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:.5mm;">
    If you answered "Yes" to either line 6a or line 6b, explain on Part II.
    
    <!--**************************************************************************************************************************************-->
  <!-- Added this DataTableInline for the Explanation needed for line 6 - there is no reference in the schema for any attached statement
        just a short explanation is noted - spoke with Jack about this and he suggested doing it this way -->

   <xsl:call-template name="LinkToLeftoverDataTableInline">
          <xsl:with-param name="Desc">Line 6b - Financial Aid Exp</xsl:with-param>
          <xsl:with-param name="TargetNode" select="$FormData/GovtFinancialAidExplanation"/>
        </xsl:call-template>

  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:.5mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:.5mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;padding-top:.5mm;"></div>
</div>


 <!-- line 7 -->
<div class="styBB">
<div class="IRS990ScheduleE_LineContainer" >
  <div class="styLNLeftNumBox" style="padding-left:4mm;padding-top:0mm;">7</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:0mm;padding-bottom:0mm;">
    Does the organization certify that it has complied with the applicable requirements of sections 4.01 through 4.05
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:0mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:0mm;"></div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;padding-top:0mm;"></div>
</div>
<div class="IRS990ScheduleE_LineContainer" >
  <div class="IRS990ScheduleE_SubLineIndex" ></div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:0mm;padding-bottom:0mm;">
    of Rev. Proc. 75-50, 1975-2 C.B. 587, covering racial nondiscrimination? If "No," explain on Part II.
    
   <!--  <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleE/GeneralExplanationAttachment"/>
        <xsl:with-param name="TabOrder" select="2"/>
      </xsl:call-template>-->
    <!--**************************************************************************************************************************************-->
  <!-- Added this DataTableInline for the Explanation needed for line 7 - there is no reference in the schema for any attached statement
        just a short explanation is noted - spoke with Jack about this and he suggested doing it this way -->
    
   <xsl:call-template name="LinkToLeftoverDataTableInline">
          <xsl:with-param name="Desc">Line 7 - CompProc7550Exp</xsl:with-param>
          <xsl:with-param name="TargetNode" select="$FormData/ComplianceProc75_50Explanation"/>
        </xsl:call-template>
  <!--   <span class="IRS990ScheduleE_Dotspacing" >.....</span>-->
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="padding-top:.5mm;">7</div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/ComplianceWithRevProc7550"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/ComplianceWithRevProc7550"/>
      </xsl:call-template>
      </span>
  </div>
</div>
</div>

<!--   BEGIN PAGE 1 FOOTER  -->
<div class="pageEnd" style="width:187mm;">
  <div style="width:113mm;font-weight:bold; float: left; font-size:8px;padding-top:.5mm;clear: none;">Paperwork Reduction Act Notice, see the Instructions for Form 990.</div>
  <div style="width:25mm;font-weight:normal; float: left; padding-right:0mm;font-size:8px;padding-left:1mm;padding-top:.5mm;">Cat. No. 50085D</div>
  <div style="width:48mm;font-weight:bold; clear: none;float:right;padding-right:0mm;padding-left:0mm;font-size:8px;padding-top:.5mm;">Schedule E (Form 990 or 990-EZ) 2012 </div>
   
</div>
<!--     END PAGE 1 FOOTER   -->

<!-- Page 2 Header -->
<!-- header -->
<div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
  <div style="width:90mm;" class="styGenericDiv">Schedule E (Form 990 or 990EZ) 2012</div>
  <div style="width:55mm;text-align:center;" class="styGenericDiv"></div>
  <div style = "float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span></div>
</div>
<!-- End Page 2 Header -->
  
<!-- Part II-->
<div class="styBB" style="width:187mm;float:none;border-top-width:1px">
  <div class="styPartName" style="float:left;width:14mm;">Part II</div>
   <span style="font-size:8pt;font-weight:bold;">Supplemental Information. </span>
   <span>Complete this part to provide the explanations required by Part I, lines 3, 4d, 5h, 6b, and 7, as applicable.  Also complete this part to provide any other additional information (see instructions).</span>
</div>
    
<!-- Part II Supplemental Information table -->
 <table id="GEPATbl" class="styDepTbl" style="font-size:8pt; font-family:Arial;float:none;clear:both;">
  <thead class="styTableThead">
    <tr class="styDepTblHdr">
      <th class="styDepTblCell" scope="col">Identifier</th>
      <th class="styDepTblCell" scope="col">Return Reference</th>
      <th class="styDepTblCell" scope="col">Explanation</th>
    </tr>
  </thead>
  <tfoot/>
  <tbody>
    <xsl:for-each select="$Form990ScheduleEData/Form990ScheduleEPartII">
      <tr>
        <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
        <td class="styDepTblCell" align="left" valign="top">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Identifier"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" align="left" valign="top">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ReturnReference"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" align="left" valign="top">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Explanation"/>
          </xsl:call-template>
        </td>
      </tr>
    </xsl:for-each>
  </tbody>
</table> 
<!-- End Part II Supplemental Information table -->

<!--   BEGIN PAGE 2 FOOTER  -->
<div class="pageEnd" style="width:187mm;">
  <div style="width:48mm;font-weight:bold; clear: none;float:right;padding-right:0mm;padding-left:0mm;font-size:8px;padding-top:.5mm;">Schedule E (Form 990 or 990-EZ) 2012 </div>
   
</div>
<!--     END PAGE 2 FOOTER   -->

  <!-- BEGIN Left Over Table -->  
    <!-- Additonal Data Title Bar and Button -->
    <div class="styLeftOverTitleLine" id="LeftoverData">
      <div class="styLeftOverTitle">
        Additional Data        
      </div>
      <div class="styLeftOverButtonContainer">
        <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
      </div>      
    </div>

    <!-- Additional Data Table -->
    
     <table class="styLeftOverTbl">
        <xsl:call-template name="PopulateCommonLeftover">
          <xsl:with-param name="TargetNode" select="$FormData" />
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>

   <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Financial Aid Explanation</xsl:with-param>
        <xsl:with-param name="TargetNode" select="$FormData/GovtFinancialAidExplanation"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>

<xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">CompProc7550Explanation</xsl:with-param>
        <xsl:with-param name="TargetNode" select="$FormData/ComplianceProc75_50Explanation"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
</table>
  </body>
     </html>
   </xsl:template>              
</xsl:stylesheet>
 
