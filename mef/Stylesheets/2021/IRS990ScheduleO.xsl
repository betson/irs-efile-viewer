<?xml version="1.0" encoding="UTF-8"?>

<!-- Last modified on -->

<!-- Last modified on 5/18/2017 by Harold Nadel per UWR #195015 TY from 2016 to 2017 -->
<!-- Last modified on 5/3/2016 by Harold Nadel per UWR # 177702 TY from 2015 to 2016-->
<!-- Last modified on 10/22/2015 by Harold Nadel per PDF Review changed year from 2014 to 2015, put additional data on a new page.-->
<!-- Last modified on 6/24/2015 by Harold Nadel for WR # 123023 changes for IE11 -->
<!-- Last modified on 4/06/2015 by Harold Nadel for WR # 123023 changes for IE11-->

<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS990ScheduleOStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<!--xsl:param name="RtnSummaryData" select="/TEGEOrganizationReturn/ReturnSummary"/-->
	<xsl:param name="FormData" select="$RtnDoc/IRS990ScheduleO"/>
	<!--  <xsl:param name="DependencyData" select="$RtnDoc/GeneralExplanationAttachment" /> -->
	<xsl:param name="DependencyData" select="$RtnDoc/IRS990ScheduleO"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 990 Schedule O"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS990ScheduleOStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeader"/>
				<!-- BEGIN FORM HEADER -->
				<div class="IRS990ScheduleO_LineContainer" style="width: 187mm; height: auto; ">
					<!-- Form Name -->
					<div class="IRS990ScheduleO_FormNumBlock" style="width: 30.5mm; height: 20.5mm; padding-top: 5px; border-bottom-width: 0px; float:left;">
						<span style="font-size:11pt;font-weight:bold;font-familiy:'Arial Narrow';">SCHEDULE O</span>
						<br/>
						<span style="font-size:10pt;font-weight:bold;font-family:'Arial Narrow';">(Form 990)</span>
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
					<div class="IRS990ScheduleO_FormTitleBlock;" style= "width: 126.5mm; height: auto; text-align: center;padding-top:1mm;float:left;">
						<!-- Form Title -->
						<div style="padding-top: 1mm; ">
							<span class="styMainTitle">Supplemental Information to Form 990 or 990-EZ</span>
						</div>
						<!-- Form Subtitle -->
						<br/>
						<span style="font-weight:bold;text-align:center;padding-top:0mm;">
						Complete to provide information for responses to specific questions on <br/>
						Form 990 or 990-EZ or to provide any additional information. <br/>
							<img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
     						 Attach to Form 990 or 990-EZ.<br/>
						</span>
						
						<span style="font-weight:bold;text-align:center;padding-top:0mm;">
							<img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
							Go to <!--www.irs.gov/form990.--><a href="http://www.irs.gov/form990" title="Link to IRS.gov">
                <i>www.irs.gov/Form990</i></a> for the latest information. 
						</span>
						
					</div>
					<div class="IRS990ScheduleO_FormYearBlock" style="height: auto; width: 29.5mm;border-left-width: 1px;">
						<div class="IRS990ScheduleO_OMB" style="height: auto; width: 29.5mm;">OMB No. 1545-0047</div>
						<div class="styTY" style="height:auto; width: 29.5mm; text-align:center;">
      20<span class="styTYColor">21</span>
						</div>
						<div style="height:auto; width: 29.5mm; background-color: black; color: white; font-size: 7.5pt;font-weight: bold;text-align:center;">Open to Public<br/>Inspection</div>
					</div>
					
					<div class="styBB" style="width: 187mm; height:auto; clear: both; font-family: verdana; font-size: 7pt; border-color: black; border-bottom-width: 1px;"></div>
					<!-- Tax Year Box -->
					<!--  <div class="IRS990ScheduleO_FormYearBlock">  -->
					<!-- OMB No. -->
					<!--    <div class="IRS990ScheduleO_OMB">OMB No. 1545-0047</div>  -->
					<!-- Tax Year -->
					<!--   <div class="IRS990ScheduleO_TaxYear">
       <span>20<span class="styTYColor">08</span></span>
    </div>
  </div>  -->
				</div>
				<!-- Begin Name and Identifying Number Section-->
				<div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
					<div class="styFNBox" style="width:134mm;height:auto;">
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
					<div class="styGenericDiv" style="width:52mm;height:4mm;padding-left:1mm;">
						<span class="styBoldText">Employer identification number</span>
						<br/>
						<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">EIN</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
				<!-- End Name and Identifying Number Section-->
				<table id="GEPATbl" class="styDepTbl" style="margin-top:4mm; font-size:8pt; font-family:Arial;float:none;clear:both;">
					<thead class="styTableThead">
						<tr class="styDepTblHdr">
							<!--th class="styDepTblCell" scope="col">Item No.</th-->
							<th class="styDepTblCell" style="width:20mm" scope="col">Return Reference</th>
							<th class="styDepTblCell" style="width:167mm" scope="col">Explanation</th>
						</tr>
					</thead>
					<tfoot/>
					<tbody>
						<xsl:for-each select="$DependencyData/SupplementalInformationDetail">
							<tr>
								<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
								<!--td class="styDepTblCell" valign="top">
            <xsl:value-of select="position()" />
          </td-->
								<td class="styDepTblCell" style="width:20mm" align="left" valign="top">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="width:167mm" align="left" valign="top">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<!-- comment line -->
				<!--             	<td style="border:black 0 solid;border-bottom-width:1;border-right-width:1" colspan="5"><span 					class="styBoldText" >Explanation</span>					
				<span class="IRS990ScheduleO_Dotspacing">.....................................................</span>
		</td>  -->
				<!-- footer line -->
				<div class="pageEnd" style="page-break-after:always;width:187mm;float:none;clear:both;">
					<div class="IRS990ScheduleO_LineContainer">
						<div style="font-weight:bold;width:100mm;float:left;font-family:'arial narrow';">
      For Paperwork Reduction Act Notice, see the Instructions for Form 990 or 990-EZ.</div>
						<div style="width:40mm;float:left;">
      Cat. No. 51056K
    </div>
						<div style="width:47mm;text-align:right;float:left;font-family:'arial narrow';font-weight:bold;">Schedule O (Form 990) 2021</div>
					</div>
				</div>
				<p style="page-break-before:always" />
				<!-- Page Header -->
				<!--  <div class="styBB" style="width:187mm; padding-bottom:.5mm;">  
    <div style="float:left;">Schedule O (Form 990) 2008</div>
    <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>                    
  </div>  -->
				<!-- END Page Header -->
				<!-- Begin Name and Identifying Number Section-->
				<!--<div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
  <div class="styFNBox" style="width:134mm;height:8mm;">
     Name of the organization<br/>
    <div style="font-family:verdana;font-size:6pt;height:6.25mm">
     <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
    </xsl:call-template>
    <br />
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
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
</div> -->
				<!-- End Name and Identifying Number Section-->
				<!--    <table id="GEPATbl" class="styDepTbl" style="margin-top:4mm; font-size:8pt; font-family:Arial">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">Identifier</th>
          <th class="styDepTblCell" scope="col">Return Reference</th>  
          <th class="styDepTblCell" scope="col">Explanation</th>                
        </tr>          
      </thead>  
      <tfoot></tfoot>
      <tbody>  
      <xsl:for-each select="$DependencyData/GeneralExplanation">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" align="left" valign="top">          
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Identifier" /></xsl:call-template>             
          </td>              
          <td class="styDepTblCell" align="left" valign="top">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="ReturnReference" /></xsl:call-template>             
          </td>      
          <td class="styDepTblCell" align="left" valign="top">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Explanation" /></xsl:call-template>             
          </td>                                                
        </tr>
      </xsl:for-each>
      </tbody>  
    </table>  -->
				<!-- comment line -->
				<!--             	<td style="border:black 0 solid;border-bottom-width:1;border-right-width:1" colspan="5"><span 					class="styBoldText" >Explanation</span>					
				<span class="IRS990ScheduleO_Dotspacing">.....................................................</span>
		</td> -->
				<!--Page Footer-->
				<!-- <div class="pageEnd" style="width:187mm">
  <div style="float:right;">
    <span style="width:80px;"></span>  
    <span class="styBoldText"> Schedule O (Form 990) 2008</span> 
  </div>  
</div>  -->
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
						<xsl:with-param name="TargetNode" select="$FormData"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>