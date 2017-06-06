<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8932Style.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8932"/>
	<xsl:template match="/">
	<!-- 6/14/2011 RLW-->
		<html>
			<head>
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
				<meta name="Description" content="Form IRS 8932"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8932Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass">
				<form name="Form8932">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form -->
					<div class="styBB" style="width:187mm;height: 21mm">
						<div class="styFNBox" style="padding-top: 1mm;width:31mm;font-size: 7pt;height: 21mm">
            Form <span class="styFormNumber">8932</span>
							<br/>
							<!--General Dependency Push Pin -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<div class="styAgency" style="padding-top: 1mm">(Rev. December 2010)</div>
							<div class="styAgency" style="padding-top: 1mm">Department of the Treasury<br/>Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="padding-top: 6mm; width:125mm">
							<div class="styMainTitle">Credit for Employer Differential Wage Payments</div>
							<div class="styFST" style="padding-top: 2mm; height:5mm;font-size:7pt;margin-left:3mm;font-weight:bold">
								<br/>
								<img src="{$ImagePath}/8932_Bullet.gif" alt="MediumBullet"/>  
                Attach to your tax return.
              </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:22mm; border-left-width: 1px">
							<div class="styOMB" style="height:8mm;padding-top:2mm">OMB No. 1545-2126</div>
							<div class="stySequence" style="padding-top:7mm">Attachment<br/>Sequence No. <b>161</b>
							</div>
						</div>
					</div>
	<!--  End title of Form  -->
	<!--  Begin Populate Name and Employer identification number  -->
	<div class="styBB" style="width:187mm">
	<div class="styNameBox" style="width:146.3mm;font-weight:normal;font-size:7pt;">
       Name(s) shown on return
       <br/>
	<div style="font-family:verdana;font-size:6pt;">
	<xsl:choose>
   <xsl:when test="$RtnHdrData/ReturnType='1040'">								  
    <br/>
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">Name</xsl:with-param>
    </xsl:call-template>
   </xsl:when>
  <xsl:otherwise>
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
    </xsl:call-template>
    <br/>
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
    </xsl:call-template>
  </xsl:otherwise>
</xsl:choose>
 </div>
</div>
  <div class="styEINBox" style="padding-left:2mm;font-size:7pt;">
	<span class="BoldText">Identifying number</span>
	<div class="styNormalText" style="text-align:left; padding-top:2mm;">
	<xsl:choose>
	  <xsl:when test="$RtnHdrData/ReturnType='1040'">
      <xsl:call-template name="PopulateReturnHeaderFiler">
        <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="PopulateReturnHeaderFiler">
        <xsl:with-param name="TargetNode">EIN</xsl:with-param>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
	</div>
  </div>
</div>
<!--  End Populate Name and Employer indentification number  -->
					<!--  L1 -->
					<div style="width: 187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Eligible differential wage payments paid during the tax year (see instructions)</span>
								<span class="styBoldText" style="float:right;padding-right:1mm;">
									<span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                </span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox">1</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DifferentialWagePmtEligibleAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  L1 -->
					<!--  L2 -->
					<div style="width: 187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:139mm">
								<span style="float:left;">Multiply line 1 by 20% (.20) (see instructions for the adjustment you must make)
              <!-- Form to Form Link (Push Pin)-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CurrentYearCredit"/>
									</xsl:call-template>
								</span>
								<span class="styBoldText" style="float:right;padding-right:1mm;">
									<span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                </span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox">2</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DifferentialWagePmtAdjustAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  L2 -->
					<!--  L3 -->
					<div style="width: 187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="styLNDesc" style="width:139mm;">
                Credit for employer differential wage payments from partnerships, S corporations, cooperatives, estates,<span style="float:left;">and trusts (see instructions)</span>
								<span class="styBoldText" style="float:right;padding-right:1mm;">
									<span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                </span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">3</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DifferentialWagePmtCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  L3 -->
					<!--  L4 -->
					<div style="width: 187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;">4</div>
							<div class="styLNDesc" style="width:139mm;height:8mm; ">Add lines 2 and 3. Cooperatives, estates, and trusts go
              to line 5; partnerships and S corporations, report <span style="float:left;">this amount on Schedule K; all others, report this amount on Form 3800, line 1w</span>
								<span class="styBoldText" style="float:right;padding-right:1mm;">
									<span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                </span>
							</div>
						</div>
						<div style="float:right;clear;none;">
							<div class="styLNRightNumBox" style="height:8mm; padding-top:4mm; border-bottom-width:1px">4</div>
							<div class="styLNAmountBox" style="height:8mm; padding-top:4mm; border-bottom-width:1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DifferentialWagePmtNetAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  L4 -->
					<!--  L5 -->
					<div style="width: 187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="styLNDesc" style="width:139mm">
								<span style="float:left;">Amount allocated to patrons of the cooperative or beneficiaries of the estate or trust (see instructions) </span>
							</div>
						</div>
						<div style="float:right;clear;none;">
							<div class="styLNRightNumBox">5</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DifferentialWagePmtAllocateAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  L5 -->
					<!--  L6 -->
					<div class="styBB" style="width: 187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="styLNDesc" style="width:139mm; ">
								<b>Cooperative, estates, and trusts.</b> Subtract line 5 from line 4. Report this amount on Form 3800, line 1w
               </div>
						</div>
						<div style="float:right;clear;none;">
							<div class="styLNRightNumBox" style="border-bottom-width:0px">6</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DifferentialWagePmtCoopEstAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  L6 -->
					<div style="width:187mm;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see page 2. </span>
						<span style="width:100px;"/>                      
              Cat. No. 37747W 
            <span style="width:125px;"/>  
              Form <span class="styBoldText">8932</span> (Rev. 12-2010)
          </div>
					<br/>
					<br class="pageEnd"/>
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
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
