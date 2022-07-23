<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8900Style.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8900"/>
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
				<meta name="Description" content="IRS Form 8900"/>
				<meta name="Generator" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- PRINT STATEMENT -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8900Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form8900" style="font-family:verdana; font-size:7pt">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form title and Form number section -->
					<div class="styBB" style="width:187mm;clear:both;float:none;">
						<div class="styFNBox" style="width:31mm;height:22mm;">
							Form <span class="styFormNumber">8900</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
								<xsl:with-param name="TabOrder" select="2"/>
							</xsl:call-template>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<div style="padding-top:3.5mm;border-right-width:1px;">
								<div class="styAgency"> Department of the Treasury</div>
								<div class="styAgency">Internal Revenue Service</div>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<div class="styMainTitle" style="padding-top:2mm;">
							  Qualified Railroad Track Maintenance Credit</div>
							<div class="styFST" style="padding-top:6mm;font-weight:bold;">
								<img src="{$ImagePath}/8900_Bullet.gif" alt="bullet image"/>
								  Attach to your tax return.
							</div>
							<!--  2/16/2015 NOTE: this line of code will not match PDF 100% due to the amount of text and amount of width set to give an illusion that the infomation is center.  If add text-align:left the amount of data will not fix on one line and text on the second line is automtically wrap to the left. Customer approved of this display.-->
							<div class="styFST" style="width:125mm;float:left;clear:none;padding-top:2.5mm;">
								<img src="{$ImagePath}/8900_Bullet.gif" alt="bullet image"/>
								Go to  			
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form8900" title="Link to IRS.gov">
									<i>www.irs.gov/Form8900</i>
								</a> for instructions and the latest information.
							</div>
						</div>
						<div class="styTYBox" style="width:31mm;height:22mm;">
							<div class="styOMB" style="height:5.5mm;padding-top;1mm;">OMB No. 1545-1983</div>
							<div class="styTaxYear" style="font-size:21.5pt;">
								20<span class="styTYColor">19</span>
							</div>
							<div class="styOMB" style="border-bottom-width:0px;text-align:left;padding-left:5mm;height:auto;">
							  Attachment Sequence No. <span class="styBoldText" style="font-size:8pt;">144</span>
							</div>
						</div>
					</div>
					<!-- End form title and Form number Section -->
					<!-- Begin Name and Identifying Number Section-->
					<div class="styBB" style="width:187mm;clear:both;">
						<div class="styFNBox" style="width:147.5mm;">
						  Name(s) shown on return<br/>
							<xsl:call-template name="PopulateFilerName">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:38.5mm;padding-left:1mm;">
							<span class="styBoldText">Identifying number</span>
							<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateFilerTIN">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Name and Identifying Number Section-->
					<!-- BEGIN Line Items -->
					<!-- Start line 1 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;padding-top:4px;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:93mm;">
								Qualified railroad track maintenance expenditures paid or incurred 
								<span style="float:left;">(see instructions) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">1</div>
							<div class="styLNAmountBox" style="width:38mm;height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyRlrdTrackMaintExpendAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:10mm;padding-top:6mm;"/>
							<div class="styLNAmountBoxNBB" style="height:10mm;padding-top:6mm;"/>
						</div>
					</div>
					<!--end line 1-->
					<!-- Start line 2 -->
					<div style="width:187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Enter 50% (.50) of line 1</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox">2</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FiftyPctRlrdTrackMaintExpndAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 2-->
					<!-- Start line 3a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">3a</div>
							<div class="styLNDesc" style="width:93mm;">
								Number of miles of railroad track owned or leased by you (see 
								<span style="float:left;">instructions)</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">3a</div>
							<div class="styLNAmountBox" style="width:38mm;height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/MilesOfRlrdTrackOwnorLsdQty"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;padding-top:4mm;"/>
							<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm;"/>
						</div>
					</div>
					<!--end line 3a-->
					<!-- Start line 3b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;padding-bottom:0mm;">b</div>
							<div class="styLNDesc" style="width:93mm;padding-bottom:0mm;">
                  Less: number of miles of railroad track owned or leased by you and
                  assigned to other eligible taxpayers for purposes of this credit. See
              </div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBoxNBB" style="height:7.5mm;;padding-bottom:0mm;"/>
							<div class="styLNAmountBoxNBB" style="width:38mm;height:7.5mm;padding-bottom:0mm;"/>
							<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;padding-bottom:0mm;"/>
							<div class="styLNAmountBoxNBB" style="height:7.5mm;padding-bottom:0mm;"/>
						</div>
					</div>
					<!--end line 3b-->
					<!-- Start line 3b extension -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;padding-top: 0mm;padding-bottom:0mm;"/>
							<div class="styLNDesc" style="width:93mm;padding-top: 0mm;padding-bottom:0mm;">
								<span style="float:left;">instructions for more information, including required statement 
                  <!--Push Pin image -Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$FormData/LessNumOfMileRlrdTrckIsAsgnQty"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<!--<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>-->
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="padding-top: .25mm;padding-bottom:0mm;">3b</div>
							<div class="styLNAmountBox" style="width:38mm;padding-top: 0mm;padding-bottom:0mm;font-size:9px;">
								<xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$FormData/LessNumOfMileRlrdTrckIsAsgnQty"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;padding-top: 0mm;padding-bottom:0mm;"/>
							<div class="styLNAmountBoxNBB" style="padding-top: 0mm;padding-bottom:0mm;"/>
						</div>
					</div>
					<!--end line 3b extension-->
					<!-- Start line 3c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;padding-bottom:0mm;">c</div>
							<div class="styLNDesc" style="width:93mm;padding-bottom:0mm;">
								Number of miles of railroad track assigned to you by the owner or
								lessee for purposes of this credit. See instructions for more information,
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBoxNBB" style="height:7mm;padding-bottom:0mm;"/>
							<div class="styLNAmountBoxNBB" style="width:38mm;height:7mm;padding-bottom:0mm;"/>
							<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;padding-bottom:0mm;"/>
							<div class="styLNAmountBoxNBB" style="height:7mm;padding-bottom:0mm;"/>
						</div>
					</div>
					<!--end line 3c-->
					<!-- Start line 3c extension -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;padding-top: 0mm;padding-bottom:0mm;"/>
							<div class="styLNDesc" style="width:93mm;padding-top: 0mm;padding-bottom:0mm;">
								<span style="float:left;"> including required statement
							    <!--Push Pin image -Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/MlRlrdTrckAsgnByOwnrOrLsseeQty"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="padding-top: 0mm;padding-bottom:0mm;">3c</div>
							<div class="styLNAmountBox" style="width:38mm;padding-top: 0mm;padding-bottom:0mm;font-size:9px;">
								<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/MlRlrdTrckAsgnByOwnrOrLsseeQty"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:6mm;background-color:lightgrey;padding-top: 0mm;padding-bottom:0mm;"/>
							<div class="styLNAmountBoxNBB" style="height:6mm;padding-top: 0mm;padding-bottom:0mm;"/>
						</div>
					</div>
					<!--end line 3c extension-->
					<!-- Start line 3d -->
					<div style="width:187mm">
						<div style="float:left;clear:none;padding-top:.5mm">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">d</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">
									<b>Total.</b> Combine lines 3a through 3c <span style="width:1mm;"/>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="padding-left:.2.5mm;">......................</span>
								<span style="float:right;padding-right:2.5mm;">								
									<img src="{$ImagePath}/8900_Bullet.gif" alt="bullet image"/>
								</span>	
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">3d</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalRlrdTrackMilesQty"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 3d-->
					<!-- Start line 4 -->
					<div style="width:187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;">4</div>
							<div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
								<span style="float:left;">Multiply line 3d by $3,500</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">4</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/AdjustedTotalRailroadTrackAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 4-->
					<!-- Start line 5 -->
					<div style="width:187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;">5</div>
							<div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
								<span style="float:left;">Enter the <span style="font-weight:bold;">smaller</span> of line 2 or line 4
                
                <!-- start 05/07/2012 -->
									<!--Push Pin image -Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$FormData/QualifiedPctOfRlrdTrackAmt"/>
									</xsl:call-template>
									<!-- end 05/07/2012 -->
								</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">......................</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">5</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QualifiedPctOfRlrdTrackAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 5-->
					<!-- Start line 6 -->
					<div style="width:187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;">6</div>
							<div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
								<span style="float:left;">Qualified railroad track maintenance credit from partnerships and S corporations (see instructions)</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">6</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QualifiedRlrdTrackMaintCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 6-->
					<!-- Start line 7 -->
					<div style="width:187mm;height:7mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="styLNDesc" style="width:139mm;">
                  Add lines 5 and 6. Partnerships and S corporations, report this amount on Schedule K.  All others, report 
                  <span style="float:left;">this amount on Form 3800 Part III, line 4g </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
							</div>
						</div>
						<div style="float:right;clear:none;width:40mm">
							<div class="styLNRightNumBoxNBB" style="height:7mm;padding-top: 3.5mm;padding-bottom:.5mm;">7</div>
							<div class="styLNAmountBoxNBB" style="height:7mm;padding-top: 3.5mm;padding-bottom:.5mm;">
								<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/CurrentYearCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 7-->
					<!-- Start Page footer   -->
					<div style="width:187mm; border-top:1px solid Black; font-size:8pt">
						<div style="font-weight:bold; float:left; padding-top:0.5mm">
              For Paperwork Reduction Act Notice, see  separate instructions.  
            </div>
						<div style="float:right">
							<span style="margin-right:20mm; font-size:7pt">Cat. No. 37708X</span>          
                Form <b>8900</b> (2019)    
            </div>
					</div>
					<!--<p style="page-break-before:always"/>-->
					<!-- end Page footer-->
					<!-- Start Additional Data Page -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
						<div class="styLeftOverTitle">
          Additional Data        
        </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
					</table>
					<!-- end Additional Data Page -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
