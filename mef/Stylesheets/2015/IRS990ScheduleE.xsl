<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">
<!-- 03/25/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 07/31/2015 - Modified per UWR 161465 - Jeremy Nichols-->
]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
  <xsl:param name="Form990ScheduleEData" select="$RtnDoc/IRS990ScheduleE"/>

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
  <meta name="Description" content="Form 990 Schedule E"/>
   <meta name="GENERATOR" content="IBM WebSphere Studio"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  <xsl:call-template name="InitJS"/>
  <style type="text/css">
    <xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS990ScheduleEStyle"/>
      <xsl:call-template name="AddOnStyle"/>
  </xsl:if>  
 </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>

<body class="styBodyClass">
 <form name="Form990ScheduleE"/>
  <xsl:call-template name="DocumentHeader"/>
<!-- BEGIN FORM HEADER -->
<div class="IRS990ScheduleE_LineContainer" style="height:24mm;border-bottom:1px solid black;padding-bottom:0;">
  <!-- Form Name -->
  <div class="IRS990ScheduleE_FormNumBlock" style="height:24mm;width:28mm;padding-top:.5mm;padding-bottom:0.25mm;border-bottom-width:0;">
     <span style="font-size:10pt;font-weight:bold;">SCHEDULE E</span>
     <span style="font-size:9pt;font-weight:bold;height:3mm;font-family:'Arial Narrow';padding-top:0px;padding-bottom:0px;">(Form 990 or 990-EZ)</span>
    <br/>
       <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$FormData"/>      
       </xsl:call-template>
		<div style="height:9mm;"/><br/>

     <span class="styAgency" style="font-size:7pt;padding-left:0;">Department of the Treasury</span><br/>
     <span class="styAgency" style="font-size:7pt;padding-bottom:5px;">Internal Revenue Service</span>
  </div>

  <!-- Form Title Box -->
  <div class="IRS990ScheduleE_FormTitleBlock" style="height:24mm;width:128mm;padding-top:.5mm;padding-bottom:2.5mm;">
    <!-- Form Title -->
   
    <div class="styMainTitle" style="font-weight:bold;font-size:17pt;">Schools</div><br/>
     <div style="padding-top:1mm;font-weight:bold;"/>
    <span style="font-size:6pt;font-weight:bold;padding-bottom:1mm;"><img src="{$ImagePath}/990SchF_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/>Complete if the organization answered "Yes" on Form 990,</span><br/>
    <span style="font-size:6pt;font-weight:bold;padding-bottom:1mm;">Part IV, line 13, or Form 990-EZ, Part VI, line 48.</span><br/>
    <span style="font-size:6pt;font-weight:bold;padding-bottom:1mm;"><img src="{$ImagePath}/990SchF_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/> Attach to Form 990 or Form 990-EZ.</span><br/>
    <span style="font-size:6pt;font-weight:bold;padding-bottom:1mm;"><img src="{$ImagePath}/990SchF_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/> Information about Schedule E (Form 990 or 990-EZ) and its instructions is at <i>www.irs.gov/form990</i>.</span><br/>
  </div>
  
  <!-- Tax Year Box -->
  <div class="IRS990ScheduleE_FormYearBlock" style="height:24mm;">
    <!-- OMB No. -->
    <span class="IRS990ScheduleE_OMB" style="padding-top:.5mm;">OMB No. 1545-0047</span>
    <!-- Tax Year -->
    <span class="IRS990ScheduleE_TaxYear" style="padding-top:0.75mm;padding-bottom:0.75mm;border-bottom-width:0;">
       20<span class="styTYColor">15</span>
   </span>
    <span class="styPartName" style="font-size:7pt;height:7.75mm;padding-left:6mm;width:32mm;padding-top:1mm;padding-bottom:1mm;text-align:left;border-bottom-width:1px;">Open to Public Inspection</span>
  </div>
</div>
<!-- Begin Name and Identifying Number Section-->      
<div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
  <div class="styFNBox" style="width:134mm;height:9mm;">
     Name of the organization<br/>
    <div style="font-family:verdana;font-size:6pt;height:6.25mm">
     <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
    </xsl:call-template>
    <br/>
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
    </xsl:call-template>
   </div> 
  </div>
  
  <div class="styGenericDiv" style="width:52mm;height:9mm;padding-left:1.5mm;">
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
  <div class="styPartName" style="height:4mm;">Part I</div>
  <div class="IRS990ScheduleE_LineDesc" style="width:150mm;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;"/>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineDesc" style="width:164mm;border-right-width:0px;border-top-width:1px;"/>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-top-width:1px;"/>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-top-width:1px;">YES</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;border-top-width:1px;">NO</div>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex" style="padding-top:1.5mm;">1</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:1.5mm;padding-bottom:0mm;">
  Does the organization have a racially nondiscriminatory policy toward students by statement in its charter, bylaws,
</div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="padding-top:1.5mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="padding-top:1.5mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="border-right-width:0px;padding-top:1.5mm;"/>
  </div>

<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_SubLineIndex"/>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:.5mm;">
 other governing instrument, or in a resolution of its governing body?
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
 <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">1</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
    <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/NondiscriminatoryPolicyStmtInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/NondiscriminatoryPolicyStmtInd"/>
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
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:1mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:1mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;padding-top:1mm;"/>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_SubLineIndex"/>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:.25mm;">
    brochures, catalogues, and other written communications with the public dealing with student admissions,
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"/>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_SubLineIndex"/>
  <div class="IRS990ScheduleE_LineDesc">
    programs, and scholarships?
    <span style="width:3mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">2</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/PolicyStmtInBrochuresEtcInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/PolicyStmtInBrochuresEtcInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>


 <!-- line 3 -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex" style="padding-top:.5mm;">3</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:.5mm;">
    Has the organization publicized its racially nondiscriminatory policy through newspaper or broadcast media during
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"/>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_SubLineIndex"/>
  <div class="IRS990ScheduleE_LineDesc">
    the period of solicitation for students, or during the registration period if it has no solicitation program, in a way
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"/>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_SubLineIndex"/>
  <div class="IRS990ScheduleE_LineDesc">
    that makes the policy known to all parts of the general community it serves? If "Yes," please describe. If "No,"
  <!--  <span class="IRS990ScheduleE_Dotspacing">..................</span>-->
  </div>
   <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"/>
</div>

<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_SubLineIndex"/>
  <div class="IRS990ScheduleE_LineDesc">
     please explain.  If you need more space use Part II.
    <span style="width:1mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>


 <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">3</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/PlcyPblczdViaBroadcastMediaInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/PlcyPblczdViaBroadcastMediaInd"/>
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
  <div class="IRS990ScheduleE_LineIndex"/>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;border-right-width:1px;">
       <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/PubViaBroadcastMediaExpln"/>
      </xsl:call-template>
</div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="height:100%"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="height:100%"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;height:100%"/>
</div>
<xsl:if test="string-length($FormData/PubViaBroadcastMediaExpln) &lt;1">
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex"/>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"/>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex"/>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"/>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex"/>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"/>
</div>
</xsl:if>


 <!-- line 4 -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex" style="padding-top:1mm;">4</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:1mm;">
    Does the organization maintain the following?
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="padding-top:1mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="padding-top:1mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="border-right-width:0px;padding-top:1mm;"/>
</div>

<!-- Line 4a -->
<div class="IRS990ScheduleE_LineContainer" style="padding-bottom:0mm;">
  <div class="styLNLeftLtrBoxDD" style="padding-top:.75mm;">a</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:1mm;padding-bottom:0mm;">
    Records indicating the racial composition of the student body, faculty, and administrative staff?
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
  
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:1mm;">4a</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:1mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintainRacialCompRecsInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:1mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintainRacialCompRecsInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>

<!-- line 4b -->
<div class="IRS990ScheduleE_LineContainer" style="height:4mm;padding-top:0mm;">
  <div class="styLNLeftLtrBoxDD" style="padding-bottom:0mm;padding-top:1mm;">b</div>
  
   <div class="IRS990ScheduleE_LineDesc" style="padding-top:1mm;">
    Records documenting  that scholarships and other financial assistance are awarded on a racially nondiscriminatory
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="padding-top:1mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="padding-top:1mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="border-right-width:0px;padding-top:1mm;"/>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_SubLineIndex" style="padding-top:.5mm;"/>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:.5mm;">
    basis?
    <span style="width:1mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">4b</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintainScholarshipsRecsInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintainScholarshipsRecsInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>

<!-- line 4c -->
<div class="IRS990ScheduleE_LineContainer" style="height:4mm;padding-bottom:0mm;">
  <div class="styLNLeftLtrBoxDD" style="height:4mm;padding-bottom:0mm;padding-top:.75mm;">c</div>
  <div class="IRS990ScheduleE_LineDesc" style="height:4mm;padding-top:1mm;padding-bottom:0mm;">
    Copies of all catalogues, brochures, announcements, and other written communications to the public dealing
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:4mm;padding-bottom:0mm;padding-top:1mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="height:4mm;padding-bottom:0mm;padding-top:1mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="border-right-width:0px;height:4mm;padding-bottom:0mm;padding-top:1mm;"/>
</div>
<div class="IRS990ScheduleE_LineContainer" style="height:4mm;padding-top:0mm;">
  <div class="IRS990ScheduleE_SubLineIndex" style="height:4mm;padding-top:.5mm;"/>
  <div class="IRS990ScheduleE_LineDesc" style="height:4mm;padding-top:.5mm;">
    with student admissions, programs, and scholarships?
    <span style="width:1mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">4c</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintainCpyOfBrochuresEtcInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintainCpyOfBrochuresEtcInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>

<!-- line 4d -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftLtrBoxDD" style="padding-top:1mm;">d</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:1.25mm;padding-bottom:.25mm;">
    Copies of all material used by the organization or on its behalf to solicit contributions?
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:1.25mm;">4d</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:1.25mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintainCpyOfAllSolInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:1.25mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/MaintainCpyOfAllSolInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex" style="padding-top:1mm;"/>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:1mm;">
    If you answered "No" to any of the above, please explain. If you need more space, use Part II.
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:1mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:1mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;padding-top:1mm;"/>
</div>
<!-- combine comment lines, fix later -->
<div class="IRS990ScheduleE_LineContainer" style="height:4mm">
  <div class="IRS990ScheduleE_LineIndex"/>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:1mm;border-bottom-style:solid;border-bottom-width:1px;border-right-width:1px;">
       <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/OrgDoesNotMaintainExplanation"/>
      </xsl:call-template>
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="height:100%"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="height:100%"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;height:100%"/>
</div>
<xsl:if test="string-length($FormData/OrgDoesNotMaintainExplanation) &lt;1">
<!-- changed &lt to &gt to get the lines to print out -  11/27/2007 - with &lt it only prints out 1 line -->

<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex"/>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"/>
</div>
</xsl:if>

 <!-- line 5 -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex" style="padding-top:1mm;">5</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:1mm;">
    Does the organization discriminate by race in any way with respect to:
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:1mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:1mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;padding-top:1mm;"/>
</div>

<!-- line 5a -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftLtrBoxDD" style="padding-bottom:.5mm;padding-top:.5mm;">a</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:.5mm;">
    Students' rights or privileges?
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">5a</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceStdntsRghtsInd"/>
      </xsl:call-template>
       </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceStdntsRghtsInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>

 <!-- line 5b -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftLtrBoxDD" style="height:6.5mm;padding-bottom:.5mm;padding-top:3mm;">b</div>
  <div class="IRS990ScheduleE_LineDesc" style="height:6.5mm;padding-top:3mm;">
    Admissions policies?
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:6.5mm;padding-top:3mm;">5b</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:6.5mm;padding-top:3mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceAdmissPlcyInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:6.5mm;border-right-width:0px;padding-top:3mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceAdmissPlcyInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>

 <!-- line 5c -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftLtrBoxDD" style="height:6.5mm;padding-top:3mm;padding-bottom:.5mm;">c</div>
  <div class="IRS990ScheduleE_LineDesc" style="height:6.5mm;padding-top:3mm;">
    Employment of faculty or administrative staff?
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:6.5mm;padding-top:3mm;">5c</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:6.5mm;padding-top:3mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceEmplmFcultyInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;height:6.5mm;padding-top:3mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceEmplmFcultyInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>
 <!-- line 5d -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftLtrBoxDD" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">d</div>
  <div class="IRS990ScheduleE_LineDesc" style="height:6.5mm;padding-top:3mm;">
    Scholarships or other financial assistance?
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:6.5mm;padding-top:3mm;">5d</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:6.5mm;padding-top:3mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceSchsInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;height:6.5mm;padding-top:3mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceSchsInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>

 <!-- line 5e -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftLtrBoxDD" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">e</div>
  <div class="IRS990ScheduleE_LineDesc" style="height:6.5mm;padding-top:3mm;">
    Educational policies?
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:6.5mm;padding-top:3mm;">5e</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:6.5mm;padding-top:3mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceEducPlcyInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;height:6.5mm;padding-top:3mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceEducPlcyInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>

 <!-- line 5f -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftLtrBoxDD" style="padding-bottom:.5mm;height:6.5mm;padding-top:3mm;">f</div>
  <div class="IRS990ScheduleE_LineDesc" style="height:6.5mm;padding-top:3mm;">
    Use of facilities?
    <span style="width:3mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:6.5mm;padding-top:3mm;">5f</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:6.5mm;padding-top:3mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceUseOfFcltsInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;height:6.5mm;padding-top:3mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceUseOfFcltsInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>

 <!-- line 5g -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftLtrBoxDD" style="height:6.5mm;padding-top:3mm;padding-bottom:.5mm;">g</div>
  <div class="IRS990ScheduleE_LineDesc" style="height:6.5mm;padding-top:3mm;">
    Athletic programs?
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:6.5mm;padding-top:3mm;">5g</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:6.5mm;padding-top:3mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceAthltProgInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;height:6.5mm;padding-top:3mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceAthltProgInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>

 <!-- line 5h -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftLtrBoxDD" style="height:6.5mm;padding-top:3mm;padding-bottom:.5mm;">h</div>
  <div class="IRS990ScheduleE_LineDesc" style="height:6.5mm;padding-top:3mm;">
    Other extracurricular activities?
    <span style="width:3mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:6.5mm;padding-top:3mm;">5h</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="height:6.5mm;padding-top:3mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceOtherActyInd"/>
      </xsl:call-template>
       </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;height:6.5mm;padding-top:3mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceOtherActyInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>
<!-- supplemental info line -->
<!-- need to combine the multiple lines.  fix later -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex"/>
  <div class="IRS990ScheduleE_LineDesc">
    If you answered "Yes" to any of the above, please explain. If you need more space, use Part II.
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"/>
</div>
<div class="IRS990ScheduleE_LineContainer" style="height:4mm;">
  <div class="IRS990ScheduleE_LineIndex"/>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;border-right-width:1px;">
       <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/DiscriminateRaceExplanation"/>
      </xsl:call-template>
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="height:100%"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="height:100%"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;height:100%"/>
</div>
<xsl:if test="string-length($FormData/DiscriminateRaceExplanation) &lt;1">
  <div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex"/>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"/>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex"/>
  <div class="IRS990ScheduleE_LineDesc" style="border-bottom-style:solid;border-bottom-width:1px;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;"/>
</div>
</xsl:if>

 <!-- line 6a -->

<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex" style="padding-right:5px;padding-top:.5mm;">6a</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-bottom:.5;padding-top:.5mm;">
    Does the organization receive any financial aid or assistance from a governmental agency?
       <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$FormData/GovernmentFinancialAid"/>
      </xsl:call-template>
    <span style="width:3mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">6a</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/GovernmentFinancialAidRcvdInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/GovernmentFinancialAidRcvdInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>

 <!-- line 6b -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftLtrBox" style="padding-left:5mm;padding-bottom:0mm;">b</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:0mm;">
    Has the organization's right to such aid ever been revoked or suspended?
    <span style="width:3mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">6b</div>
  <div class="IRS990ScheduleE_LineIndexMid" style="padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/GovernmentFinancialAidRvkdInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMid" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/GovernmentFinancialAidRvkdInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>
<!-- supplemental info line -->
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_LineIndex" style="padding-top:.5mm;"/>
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
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:.5mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:.5mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;padding-top:.5mm;"/>
</div>


 <!-- line 7 -->
<div class="styBB">
<div class="IRS990ScheduleE_LineContainer">
  <div class="styLNLeftNumBox" style="padding-left:4mm;padding-top:0mm;">7</div>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:0mm;padding-bottom:0mm;">
    Does the organization certify that it has complied with the applicable requirements of sections 4.01 through 4.05
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:0mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="padding-top:0mm;"/>
  <div class="IRS990ScheduleE_LineIndexMidFillerGray" style="border-right-width:0px;padding-top:0mm;"/>
</div>
<div class="IRS990ScheduleE_LineContainer">
  <div class="IRS990ScheduleE_SubLineIndex"/>
  <div class="IRS990ScheduleE_LineDesc" style="padding-top:0mm;padding-bottom:0mm;">
    of Rev. Proc. 75-50, 1975-2 C.B. 587, covering racial nondiscrimination? If "No," explain on Part II.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    <span style="width:2mm;"/>.
    
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
        <xsl:with-param name="TargetNode" select="$FormData/ComplianceWithRevProc7550Ind"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleE_LineIndexMidFiller" style="border-right-width:0px;padding-top:.5mm;">
   <span style="font-weight: normal">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$FormData/ComplianceWithRevProc7550Ind"/>
      </xsl:call-template>
      </span>
  </div>
</div>
</div>

<!--   BEGIN PAGE 1 FOOTER  -->
<div class="pageEnd" style="width:187mm;">
  <div style="width:113mm;font-weight:bold; float: left; font-size:8px;padding-top:.5mm;clear: none;">Paperwork Reduction Act Notice, see the Instructions for Form 990 or Form 990-EZ.</div>
  <div style="width:24mm;font-weight:normal; float: left; padding-right:0mm;font-size:8px;padding-left:1mm;padding-top:.5mm;">Cat. No. 50085D</div>
  <div style="width:50mm;font-weight:bold; clear: none;float:right;padding-right:0mm;padding-left:0mm;font-size:8px;padding-top:.5mm;">Schedule E (Form 990 or 990-EZ) (2015) </div>
   
</div>
<!--     END PAGE 1 FOOTER   -->

<!-- Page 2 Header -->
<!-- header -->
<div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
  <div style="width:90mm;" class="styGenericDiv">Schedule E (Form 990 or 990EZ) (2015)</div>
  <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
  <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span></div>
</div>
<!-- End Page 2 Header -->
  
<!-- Part II-->
<div class="styBB" style="width:187mm;float:none;border-top-width:1px">
  <div class="styPartName" style="height:4mm;float:left;width:14mm;">Part II</div>
   <span style="font-size:8pt;font-weight:bold;padding-left:2mm;">Supplemental Information. </span>
   <span style="display:inline;">Provide the explanations required by Part I, lines 3, 4d, 5h, 6b, and 7, as applicable.  Also provide <br/>
   <span style="width:2mm;"/>any other additional information (see instructions).</span>
</div>
    
<!-- Part II Supplemental Information table -->
 <table id="GEPATbl" class="styDepTbl" style="font-size:8pt; font-family:Arial;float:none;clear:both;">
  <thead class="styTableThead">
    <tr class="styDepTblHdr">
      <th class="styDepTblCell" scope="col" style="width:80mm;">Return Reference</th>
      <th class="styDepTblCell" scope="col" style="width:107mm;">Explanation</th>
    </tr>
  </thead>
  <tfoot/>
  <tbody>
    <xsl:for-each select="$Form990ScheduleEData/SupplementalInformationDetail">
      <tr>
        <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
        <td class="styDepTblCell" align="left" valign="top">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" align="left" valign="top">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ExplanationTxt"/>
          </xsl:call-template>
        </td>
      </tr>
    </xsl:for-each>
  </tbody>
</table> 
<!-- End Part II Supplemental Information table -->

<!--   BEGIN PAGE 2 FOOTER  -->
<div class="pageEnd" style="width:187mm;">
  <div style="width:50mm;font-weight:bold; clear: none;float:right;padding-right:0mm;padding-left:0mm;font-size:8px;padding-top:.5mm;">Schedule E (Form 990 or 990-EZ) (2015) </div>
   
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
          <xsl:with-param name="TargetNode" select="$FormData"/>
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