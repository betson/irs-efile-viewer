<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8906Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="Form8906Data" select="$RtnDoc/IRS8906"/>
  <xsl:param name="Form8906ScheduleAData" select="$RtnDoc/IRS8906/IRS8906ScheduleA"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
	<!-- Updated 8/31/2010 <<RLW>> -->
	  <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<title>
		  <xsl:call-template name="FormTitle">
			<xsl:with-param name="RootElement" select="local-name($Form8906Data)"/>
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
		<meta name="Description" content="IRS Form 8906"/>
		<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
		<xsl:call-template name="InitJS"/>
		  <style type="text/css">
			<xsl:if test="not($Print) or $Print=''">
			  <xsl:call-template name="IRS8906Style"/>
			  <xsl:call-template name="AddOnStyle"/>
			</xsl:if>
		  </style>
		  <xsl:call-template name="GlobalStylesForm"/>
		  </head>
			<body class="styBodyClass">
			  <form name="Form8906" style="font-size:7pt;">
				<!-- BEGIN WARNING LINE -->
				<xsl:call-template name="DocumentHeader"/>
				<!-- END WARNING LINE -->
				<!-- Begin Form Number and Name -->
				<div class="styTBB" style="width:187mm;height:21mm;">
				  <div class="styFNBox" style="width:34mm;height:21mm;">
					<div style="height:13mm;">
                      Form <span class="styFormNumber">8906</span>
					  <br/>
					  <!--Begin General Dependency Push Pin -->
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$Form8906Data"/>
                      </xsl:call-template>
                      <!--End General Dependency Push Pin -->   
					</div>
					<div style="height:8mm;padding-top:.75mm;">
					  <span class="styAgency">Department of the Treasury</span>
				  <br/>
					  <span class="styAgency">Internal Revenue Service</span>
					</div>
				  </div>
				  <div class="styFTBox" style="width:120.7mm;height:21mm;">
					<div class="styMainTitle" style="height:11mm;">
                      Distilled Spirits Credit
                    </div>
                    <br/>
					<div class="styFST" style="height:4mm;font-size:7pt;padding-top:.5mm;">
					  <img src="{$ImagePath}/8906_Bullet.gif" alt="bullet image"/>
            Attach to your tax return.
          </div>
          <br/>
          <div class="styFST" style="height:4mm;font-size:7pt;padding-top:.5mm;">
					  <img src="{$ImagePath}/8906_Bullet.gif" alt="bullet image"/>
					  Go to <i><a href="http://www.irs.gov/Form8906">www.irs.gov/Form8906</a></i> for the latest information.
          </div>
				  </div>
				  <div class="styTYBox" style="width:30mm;height:21mm;">
					<div class="styOMB" style="height:auto;">
                      OMB No. 1545-1982
                    </div>
					<div class="styTaxYear" style="height:9mm;padding-top:0;">20<span class="styTYColor">20</span></div>
					<div style="text-align:left;padding-left:3mm;">
					  Attachment Sequence No. <span class="styBoldText" style="font-size:8.5pt;">150</span>
					</div>
				  </div>
				</div>
				<!-- End Form Number and Name section -->
				<!-- Begin Names and Identifying number section -->
				<div class="styBB" style="width:187mm;">
				  <div class="styNameBox" style="width:155mm;height:auto;font-size:7pt;font-weight:normal;">
					Name(s) shown on return<br/>
              <!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
			  <xsl:choose>
			  <!-- Name from 1120/990/1065 Return Header -->
				<xsl:when test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
				  </xsl:call-template>
				  <br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
				  </xsl:call-template>
				</xsl:when>
				<!-- Name from 1040 Return Header -->
				<xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt">
				  <br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
				  </xsl:call-template>
				</xsl:when>
				<!-- Name from 1041 Return Header -->
				<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
				  </xsl:call-template>
				  <br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
				  </xsl:call-template>
				</xsl:when>
				<!--<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
				  </xsl:call-template>
				  <br/>
				</xsl:when> -->
				</xsl:choose>
				  </div>
				  <div class="styEINBox" style="width:30mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
					Identifying number<br/>
					<br/>
					<span style="font-weight:normal;">
				<!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
				<xsl:choose>
		          <xsl:when test="$RtnHdrData/Filer/EIN">
					<xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
					</xsl:call-template>
				  </xsl:when>
				  <xsl:otherwise>
					<xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
					</xsl:call-template>
				  </xsl:otherwise>
				</xsl:choose>
					</span>
				  </div>
				</div>
				<div class="styBB" style="width:187mm;">
				  <!-- Line 1 -->
				  <div style="width:187mm;">
					<!-- Position makes the 'a' in "1a" line up with the other letters. -->
					<div class="styLNLeftNumBoxSD" style="height:4mm;">1</div>
					  <div class="styLNDesc" style="width:139mm;height:4mm;">
						<span style="float:left;">Total number of cases of distilled spirits (see instructions)</span>
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">...............</span>
					  </div>
					  <div class="styLNRightNumBox" style="height:4mm;">1</div>
					  <div class="styLNAmountBox" style="text-align:center;">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8906Data/DistldSpiritsCasesTotalQty"/>
						</xsl:call-template>
					  </div>
					</div>
					<!--End of line 1 -->
					<!-- Line 2 -->
					<div style="width:187mm;">
					  <div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
					  <div class="styLNDesc" style="width:139mm;height:4mm;">
					<span style="float:left;">Average tax-financing cost per case</span>
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">.......................</span>
             		  </div>
					  <div class="styLNRightNumBox" style="height:4mm;">2</div>
					  <div class="styLNAmountBox" style="text-align:center;">0.19065 </div>
					</div>
					<!--End of line 2 -->
					<!--Line 3 -->
					<div style="width:187mm;">
					  <div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
					  <div class="styLNDesc" style="width:139mm;height:4mm;">
						<span style="float:left;">Multiply line 1 by line 2</span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">..........................</span>
				      </div>
					  <div class="styLNRightNumBox" style="height:4mm;">3</div>
					  <div class="styLNAmountBox">
					    <xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form8906Data/TotCaseQtyMultByCostPerCaseAmt"/>
						</xsl:call-template>
					  </div>
					</div>
					<!--End of line 3 -->
					<!--Line 4 -->
					<div style="width:187mm;">
					  <div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
					  <div class="styLNDesc" style="width:139mm;height:4mm;">
						<span style="float:left;">Distilled spirits credit from partnerships and S corporations (see instructions)</span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">.........</span>
					  </div>
					  <div class="styLNRightNumBox" style="height:4mm;">4</div>
					  <div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form8906Data/DistilledSpiritsCreditAmt"/>
						</xsl:call-template>
				  </div>
					</div>
					<!--End of line 4 -->
					<!--Line 5 -->
					<div style="width:187mm;">
					  <div class="styLNLeftNumBoxSD" style="height:8mm;">5</div>
					  <div class="styLNDesc" style="width:139mm;height:8mm;">
						Add lines 3 and 4. Partnerships and S corporations, report this amount on Schedule K. All others,
						<span style="float:left;">report this amount on Form 3800, Part III, line 1n.</span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">..................</span>
					  </div>
					  <div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">5</div>
					  <div class="styLNAmountBoxNBB" style="padding-top:4mm;height:8mm;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form8906Data/SumOfTotTxFnCstNdDistSprtCrAmt"/>
						</xsl:call-template>
					  </div>
					</div>
					<!--End of line 5 -->
					</div>
					<!-- End Part I -->
					<!-- capturing the page bottom info -->
					<!--  FOOTER-->
					<div style="width:187mm;text-align:right;">
					  <!--<span class="styBoldText" style="width:100mm;">
							For Paperwork Reduction Act Notice, see instructions.
						</span>-->
					  <span style="width:97mm;">Cat. No. 37715M</span> 
					  <span style="width:90mm;">Form <span class="styBoldText" style="font-size:9pt;">8906</span> (2020)</span>
					</div>
					<!--br class="pageEnd"/-->
					<!-- Adding page break -->
					<p class="pageend"/>
				    <div class="styLeftOverTitleLine" id="LeftoverData" style="width:187mm;">
					  <div class="styLeftOverTitle">
						Additional Data        
					  </div>
					  <div class="styLeftOverButtonContainer">
						<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
					  </div>      
					</div>
					<table class="styLeftOverTbl">
					  <xsl:call-template name="PopulateCommonLeftover">
						<xsl:with-param name="TargetNode" select="$Form8906Data"/>
						<xsl:with-param name="DescWidth" select="100"/>
					  </xsl:call-template>
					  <xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 19 - Other Credit Allowed Type</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8906Data/CreditAllowedForTheCurrentYear/@otherCreditAllowedType"/>
						<xsl:with-param name="DescWidth" select="100"/>
					  </xsl:call-template>
					  <xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 19 - Section 383 or Section 384 Indicator</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form8906Data/CreditAllowedForTheCurrentYear/@sec383Or384Indicator"/>
						<xsl:with-param name="DescWidth" select="100"/>
					  </xsl:call-template>
					</table>  
				  </form>
			    </body>
		      </html>
	        </xsl:template>
</xsl:stylesheet>