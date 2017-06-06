<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS940ScheduleAStyle.xsl"/>
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />  
	<xsl:param name="FormData" select="$RtnDoc/IRS940ScheduleA" />  
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Form 940 Schedule A" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print=''">-->
						<xsl:call-template name="IRS940ScheduleAStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					<!--</xsl:if>-->
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="IRS940ScheduleA">
					<xsl:call-template name="DocumentHeader"/>
					<!--General Dependency Push Pin-->
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Top Left Margin - Total Credit Reduction Wages Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalCreditReductionWagesAmt"/>
						</xsl:call-template>
					<!-- header -->
					<div class="styTBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styMainTitle" style="width:125mm;float:left;font-size:14pt;padding-top:0mm;">
							Schedule A (Form 940) for 2014:
							<div class="styFBT" style="font-size:10pt;padding-bottom:0mm;padding-top:0mm;">Multi-State Employer and Credit Reduction Information</div>
							<div class="styAgency" style="padding-bottom:1mm;">Department of the Treasury — Internal Revenue Service</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:100%;float:right;border-left-width:0px;">
							<div style="font-size:12pt;font-family:Courier New;font-weight:bold;text-align:right;">860312</div>
							<div class="styOMB" style="border-bottom-width:0px;padding-top:4mm;text-align:right;font-size:7pt;">OMB No. 1545-0028</div>
						</div>
					</div>
					
					<div style="width:187mm;padding-bottom:2mm;">
					<div class="styBB" style="width:131mm;height:20.5mm;border-top-width:1px;border-left-width:1px;border-right-width:1px;float:left;">
							<div style="width:131mm;padding-top:2mm;">
								<span style="float:left;padding-top:3mm;padding-left:3mm;font-size:6pt;"><b>Employer identification number (EIN)</b></span>
								<span style="float:right;padding-right:3.2mm;">
									<span class="styLNCtrNumBox" style="width:78mm;border-top-width:1px;padding-top:1.5mm;float:right;height:7mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</span>
								</span>
							</div>
						
							<div style="width:131mm;padding-top:2mm;padding-bottom:2mm;padding-right:2.4mm;">
								<span style="float:left;padding-top:4mm;padding-left:3mm;font-size:6pt;"><b>Name</b><i> (not your trade name)</i></span>
								<span class="styLNCtrNumBox" style="width:92mm;border-top-width:1px;float:left;height:8mm;float:right;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="width:26mm;float:right;font-size:8pt;padding-right:2mm">
								See the instructions on page 2. File this schedule with Form 940.
						</div>
						</div>
						
						<div class="styBB" style="width:187mm;border-left-width:2px;border-top-width:2px;border-right-width:2px;float:none;clear:both;font-weight:bold;font-size:9pt;padding-bottom:1mm;padding-top:1mm;padding-right:1mm;padding-left:1mm;">Place an “X” in the box of EVERY state in which you had to pay state unemployment tax this year. For each state with a credit reduction rate greater than zero, enter the FUTA taxable wages, multiply by the reduction rate, and enter the credit reduction amount. Do not include in the <i>FUTA Taxable Wages</i> box wages that were excluded from state unemployment tax (see the instructions for Step 2). If any states do not apply to you, leave them blank.
					</div>
					
	<div style="width:187mm;">
		<!--Left Column-->
		<div style="width:351px;float:left;border:black solid 0px;border-right-width:2px;border-left-width:2px;">
			<div class="styIRS940SATableRow">
				<div style="float:left;">
					<div class="styIRS940SAHeaderPA">Postal Abbreviation</div>
					<div class="styIRS940SAHeaderLong">FUTA<br/>Taxable Wages</div>
					<div class="styIRS940SAHeaderRR">Reduction Rate</div>
					<div class="styIRS940SAHeaderLong">Credit Reduction</div>
				</div>
			</div>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">AK</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">AL</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">AR</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">AZ</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">CA</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">CO</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">CT</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">DC</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">DE</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">FL</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">GA</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">HI</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">IA</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">ID</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">IL</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">IN</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">KS</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">KY</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">LA</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">MA</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">MD</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">ME</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">MI</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">MN</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">MO</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">MS</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">MT</xsl:with-param></xsl:call-template>
		</div>
		<!--End Left Column-->
		
		<!--Right Column-->
		<div style="width:350px;float:right;border:black solid 0px;border-right-width:2px;">
			<div class="styIRS940SATableRow">
				<div style="float:left;">
					<div class="styIRS940SAHeaderPA">Postal Abbreviation</div>
					<div class="styIRS940SAHeaderLong">FUTA<br/>Taxable Wages</div>
					<div class="styIRS940SAHeaderRR">Reduction Rate</div>
					<div class="styIRS940SAHeaderLong">Credit Reduction</div>
				</div>
			</div>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">NC</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">ND</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">NE</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">NH</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">NJ</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">NM</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">NV</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">NY</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">OH</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">OK</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">OR</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">PA</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">RI</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">SC</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">SD</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">TN</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">TX</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">UT</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">VA</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">VT</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">WA</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">WI</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">WV</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">WY</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">PR</xsl:with-param></xsl:call-template>
			<xsl:call-template name="PopulateState"><xsl:with-param name="StateAbrv">VI</xsl:with-param></xsl:call-template>
		</div>
		</div>
		
		<div class="styBB" style="width:187mm;padding-bottom:1mm;border-bottom-width:2px;padding-top:0mm;">
		<div class="styLNDesc" style="width:150mm;height:4mm;padding-left:8mm;padding-top:0mm;float:left;font-size:8pt;">
			<b>Total Credit Reduction. </b>Add all amounts shown in the <i>Credit Reduction </i>boxes. Enter the total here and on Form 940, line 11
			<span class="styBoldText">
			  <span style="width:16px;"/>.
			  <span style="width:16px;"/>.
			  <span style="width:16px;"/>.
			  <span style="width:16px;"/>.
			  <span style="width:16px;"/>.
			  <span style="width:16px;"/>.
			  <span style="width:16px;"/>.
			  <span style="width:16px;"/>.
			  <span style="width:16px;"/>.
			  <span style="width:16px;"/>.
			  <span style="width:16px;"/>.
			  <span style="width:16px;"/>.
			  <span style="width:16px;"/>.
			</span>
        </div>
        <div style="width:37mm;padding-top:1mm;float:right;">
			<div class="styLNCtrNumBox" style="width:37mm;height:6mm;border-top-width:1px;padding-top:1mm;text-align:right;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/TotalCreditReductionAmt"/>
					<xsl:with-param name="BackupName">IRS940ATotalCreditReductionAmt</xsl:with-param>
				</xsl:call-template>
			</div>
		</div>
		</div>
					
		<!-- Page boundary -->
		<div class="pageEnd" style="width:187mm;">
			<span style="float:left;clear:none;font-weight:bold;">For Privacy Act and Paperwork Reduction Act Notice, see the Instructions for Form 940.</span>
			<span style="float:left;clear:none;margin-left:10mm;font-size:6pt;padding-top:0.4mm;">Cat. No. 16997C</span>
			<span style="float:right;clear:none;font-weight:bold;font-size:6pt;padding-top:0.4mm;">Schedule A (Form 940) 2014</span>
		</div>
      
      <!-- BEGIN Left Over Table -->
		<!-- Additonal Data Title Bar and Button -->
		<div class="styLeftOverTitleLine" id="LeftoverData">
			<div class="styLeftOverTitle">
				Additional Data        
			</div>
			<div class="styLeftOverButtonContainer">
				<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
			</div>
		</div>
		<!-- Additional Data Table -->
		<table class="styLeftOverTbl">
			<xsl:call-template name="PopulateCommonLeftover">
				<xsl:with-param name="TargetNode" select="$FormData"/>
				<xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRowAmount">
				<xsl:with-param name="Desc">Top Left Margin - Total Credit Reduction Wages Amount</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/TotalCreditReductionWagesAmt"/>
				<xsl:with-param name="DescWidth" select="105"/>
			</xsl:call-template>
		</table>      
	</form>
</body>
</html>
</xsl:template>

<!--State Row Generator-->
<xsl:template name="PopulateState">
		<xsl:param name="StateAbrv"/>
		<html lang="EN-US">
			<body class="styBodyClass" >
				<div class="styIRS940SATableRow">
					<div class="styIRS940SAAmtBoxPA" style="text-align:center;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/CreditReductionGrp[FUTAStateCd=$StateAbrv]/FUTAStateCd"/>
							</xsl:call-template>
							<input type="checkbox" class="styIRS940SACkbox" alt="FUTAStateCd[$StateAbrv]">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CreditReductionGrp[FUTAStateCd=$StateAbrv]/FUTAStateCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="$StateAbrv"/>
									<xsl:with-param name="BackupName">FUTAStateCd[<xsl:value-of select="$StateAbrv"/>]</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<div class="styIRS940SAAmtBoxPA" style="padding-top:1.6mm;border-bottom-width:1px;">
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/CreditReductionGrp[FUTAStateCd=$StateAbrv]/FUTAStateCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="$StateAbrv"/>
								<xsl:with-param name="BackupName">FUTAStateCd[<xsl:value-of select="$StateAbrv"/>]</xsl:with-param>
							</xsl:call-template><xsl:value-of select="$StateAbrv"/>
						</label>
					</div>
					<div class="styIRS940SAAmtBoxLong">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CreditReductionGrp[FUTAStateCd=$StateAbrv]/TotalTaxableFUTAWagesAmt" />
						</xsl:call-template>
					</div>
					<div class="styIRS940SAAmtBoxRR" style="background-color:lightgrey;font-size:6pt;padding-top:3mm;">
						x<span style="width:1mm;"/>
						<xsl:choose>
							<xsl:when test="$FormData/CreditReductionGrp[FUTAStateCd=$StateAbrv]/CreditReductionRt">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/CreditReductionGrp[FUTAStateCd=$StateAbrv]/CreditReductionRt" />
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="$StateAbrv = 'CA' or $StateAbrv = 'KY'  or $StateAbrv = 'NC' or $StateAbrv = 'NY' or $StateAbrv = 'OH' or $StateAbrv = 'VI'">
										<span style="text-align:left;">.012</span>
									</xsl:when>
									<xsl:when test="$StateAbrv = 'CT'">
										<span style="text-align:left;">.017</span>
									</xsl:when>
									<xsl:when test="$StateAbrv = 'AR' or $StateAbrv = 'DE' or $StateAbrv = 'GA' or $StateAbrv = 'MO' or $StateAbrv = 'RI' or $StateAbrv = 'WI'">
										<span style="text-align:left;">.000</span>
									</xsl:when>
									<xsl:when test="$StateAbrv = 'IN'">
										<span style="text-align:left;">.015</span>
									</xsl:when>
									<xsl:otherwise>
										<span style="text-align:left;">.000</span>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<div class="styIRS940SAAmtBoxLong">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CreditReductionGrp[FUTAStateCd=$StateAbrv]/CreditReductionAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
