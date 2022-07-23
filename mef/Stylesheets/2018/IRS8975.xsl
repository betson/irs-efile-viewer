<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8975Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8975"/>
	<!--<xsl:variable name="StockInformationSize" select="count($FormData/StockInformation)"/>-->
	<xsl:variable name="RowsToShow" select="21"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8975"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8975Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:256mm;">
				<form name="Form8975">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!--Title of Form -->
					<div class="styTBB" style="width:256mm; height:24mm;">
						<div class="styFNBox" style="width:33mm; height:24mm; padding-top:1mm;">
							Form <span class="styFormNumber">8975</span>
							<br/>							
							<span class="styAgency" style="font-size:7pt;">(June 2017)</span>			
							<br/>
							<br/>
							<br/>
							<div style="line-height:100%;">
								<span class="styAgency">Department of the Treasury</span>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:192mm; height:24mm;">
							<div class="styFMT" style="padding-top:3mm; padding-bottom:2mm; font-size:16pt;">Country-by-Country Report<br/>				
								<span style="font-size:7pt;">
									For reporting period beginning 
									<span style="width:20mm; border-bottom:1 solid black; font-weight:normal;">
										<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
									</span>
								    , and ending 
									<span style="width:20mm; border-bottom:1 solid black; font-weight:normal;">
										<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
									</span>
								</span>
								<span style="font-size:7pt;">
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/> 
									Information about Form 8975 and its separate instructions is at 
									<a style="text-decoration:none; color:black;" href="http://www.irs.gov/form8975" title="Link to IRS.gov">
										<i>www.irs.gov/form8975.</i>
									</a>
								  </span> 
								<br/>
							</div>	
						</div>
						<div class="styTYBox" style="width:31mm; height:24mm;">
							<div style="padding-top:10mm;">OMB No. 1545-2272 </div>
						</div>
					</div>
					<!-- Amended Checkbox line-->
					<div class="styBB" style="width:256mm;">
						<div class="styNameBox" style="border-right-width:0px; font-weight:bold;">
							If this is an amended report, check here
							<input type="checkbox"  alt="IRS8975 amended report" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AmendReportInd"/>
									<xsl:with-param name="BackupName">IRS8975AmendReportInd</xsl:with-param>
								</xsl:call-template>
						    </input>						
						</div>
					</div>
					<!-- Number of form 8975 Schedule A -->
					<div class="styBB" style="width:256mm; ">
						<div class="styNameBox" style="border-right-width:0px; height:5mm; padding-top:1mm;">
							<b>Enter the number of Schedules A (Form 8975) attached to this Form 8975</b>
							<span style="width:1mm;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form8975ScheduleAAttachCnt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Form8975ScheduleAAttachCnt"/>
							</xsl:call-template>		
						</div>
					</div>
					<!--Part I -->
					<div class="styBB" style="width:256mm;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Identification of Filer </div>
					</div>
					<!-- Line 1a, 1b and 1c -->
					<div class="styBB" style="width:256mm;">
						<div style="width:146mm; height:10mm; float:left; border-style:solid; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px;">
							<div class="styLNLeftNumBox" style="padding-left:2.25mm;">1a</div>
							<div class="styLNDesc" style="width:137.5mm;">Name of the reporting entity
								<br/>
								<!-- choice for 1120 (Parent/Subsidiary), 1065 and 1041 Return Header-->
								<xsl:call-template name="PopulateFilerName">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>														
							</div>
						</div>
						<div style="width:55mm; height:10mm; float:left; border-style:solid; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px;">
							<div class="styLNLeftNumBox" style="padding-left:2.25mm;">1b</div>
							<div class="styLNDesc" style="width:46mm;">Reporting role code
								<br/>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/EntityReportingRoleCd"/>
								</xsl:call-template>					
							</div>
						</div>
						<div style="width:55mm; height:10mm; float:right; border-style:solid; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:0px;">
							<div class="styLNLeftNumBox" style="padding-left:2.25mm;">1c</div>
							<div class="styLNDesc" style="width:47mm;">EIN <br/>
								<br/>
								<!-- choice for 1120 (Parent/Subsidiary), 1065 and 1041 Return Header-->
								<xsl:call-template name="PopulateFilerTIN">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>				
							</div>
						</div>
					</div>
					<!--END NAME OF CORPORATION AND EIN LINE -->
					<!-- Line 2-->
					<div class="styBB" style="width:256mm;">
						<div class="styLNLeftNumBox" style="padding-left:2.25mm; height:10mm;">2</div>
						<div class="styLNDesc">Number, street, and room or suite no. (if P.O. box, see instructions) <br/>
							<!-- Choice of 1120, 1120S, 1065, 1065B vs. 1041-->
							<xsl:choose>
								<xsl:when test="$RtnHdrData/Filer/USAddress">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</xsl:when>								
								<xsl:otherwise>									
								</xsl:otherwise>
							</xsl:choose>				
						</div>						
					</div>
					<!-- Line 3a, 3b and 3c -->
					<div class="styBB" style="width:256mm;">
						<div style="width:116mm; height:7mm; float:left; border-style:solid; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px;">
							<div class="styLNLeftNumBox" style="padding-left:2.25mm;">3a</div>
							<div class="styLNDesc" style="width:102.5mm;">City or town
								<br/>
								<xsl:choose>
									<xsl:when test="$RtnHdrData/Filer/USAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
										</xsl:call-template>									
									</xsl:when>
									<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
										</xsl:call-template>									
									</xsl:when>
									<xsl:otherwise>											
									</xsl:otherwise>
								</xsl:choose>										
							</div>
						</div>
						<div style="width:65mm; height:7mm; float:left; border-style:solid; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:1px;">
							<div class="styLNLeftNumBox" style="padding-left:2.25mm;">3b</div>
							<div class="styLNDesc" style="width:56.5mm;">State or province
								<br/>
								<xsl:choose>
									<xsl:when test="$RtnHdrData/Filer/USAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
										</xsl:call-template>									
									</xsl:when>
									<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
										</xsl:call-template>									
									</xsl:when>
									<xsl:otherwise>			
									</xsl:otherwise>
								</xsl:choose>						
							</div>
						</div>
						<div style="width:75mm; height:7mm; float:right; border-style:solid; border-color:black; border-top-width:0px; border-bottom-width:0px; border-left-width:0px; border-right-width:0px;">
							<div class="styLNLeftNumBox" style="padding-left:2.25mm;">3c</div>
							<div class="styLNDesc" style="width:67mm;">Country, and ZIP or foreign postal code 
								<br/>
								<xsl:choose>
									<xsl:when test="$RtnHdrData/Filer/USAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
										</xsl:call-template>									
									</xsl:when>
									<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
										</xsl:call-template>
										<span style="width:2mm;"/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>									
									</xsl:when>
									<xsl:otherwise>											
									</xsl:otherwise>
								</xsl:choose>					
							</div>
						</div>
					</div>
					<!--END NAME OF CORPORATION AND EIN LINE -->
					<!--2018 XREF IBM Defect 62459 and KISAM IM00351632 Data is disconnected, fixed by adding display: block to all class -->
					<!-- Additional Information line-->
					<!--BEGIN Part II -->
					<div class="styBB" style="width:256mm; border-bottom:0; display:block;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style=" width:242mm; border-bottom:1px solid black;">Additional Information </div>						
					    <!--<div class="styNBB" style="width:256mm; display:block;">-->
						<div class="styNameBox" style="float:none; border-right-width:0px; font-size:7pt; display:block;">
							<b>Enter any additional information related to the multinational enterprise group.</b>
							<br/>							
							<xsl:choose>
								<!-- Display when there is no data -->
								<xsl:when test="not($FormData/AdditionalInformationTxt) or $FormData/AdditionalInformationTxt = ''">
									<xsl:call-template name="EmptyIteratorTemp">
										<xsl:with-param name="NumEmptyRows" select="21"/>
										<xsl:with-param name="TempToCall" select="'EmptyExplanationLine'"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>	
									<xsl:for-each select="$FormData/AdditionalInformationTxt">
										<div class="styNBB" style="border-bottom:1px solid black;font-size:8pt;width:254mm; text-align:left; padding-top:1mm; display:block;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</div>
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<!--</div>-->
					</div>
					<!--END Part II -->					
					<!-- BEGIN Page Footer -->
					<div style="width:256mm;">
						<!-- Page Footer -->
						<div style="clear:both; border-top:1px solid black;width:256mm;">
							<div style="width:124mm; font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see separate instructions. </div>
							<div style="width:90mm; text-align:center;" class="styGenericDiv">Cat. No. 37798N</div>
							<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">8975</span> (6-2017)</div>
						</div>						
					</div>
					<div class="pageEnd"/>
					<!-- END Page Footer -->
					<!-- Recycle Image -->
					<div align="center" style="width:256mm; padding-top:1mm; clear:both;"/>					
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
						  Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>					
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="EmptyExplanationLine">
		<xsl:param name="IsSeparated">no</xsl:param>
		<xsl:param name="CalledTemplate">no</xsl:param>
		<div class="styBB" style="width:256mm; height:7mm; padding-top:3mm;">
			<!--<xsl:if test="$IsSeparated = 'yes' ">-->
				<!--<xsl:call-template name="PopulateAdditionalDataTableMessage">
					<xsl:with-param name="TargetNode" select="$CalledTemplate"/>
				</xsl:call-template>-->
			<!--</xsl:if>-->
		</div>
	</xsl:template>
	<!-- The param CalledTemplate is used to differentiate different elements for the additional data table as the different elements call the same template -->
	<xsl:template name="EmptyIteratorTemp">
		<xsl:param name="NumEmptyRows"/>
		<xsl:param name="TempToCall"/>
		<xsl:param name="CalledTemplate" select="$FormData"/>
		<xsl:param name="IsSeparated">no</xsl:param>
		<xsl:if test="$IsSeparated = 'no' ">
			<xsl:if test="$NumEmptyRows &gt; 0">
				<xsl:choose>
					<xsl:when test="$TempToCall = 'EmptyExplanationLine'">
						<xsl:call-template name="EmptyExplanationLine"/>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
				<xsl:call-template name="EmptyIteratorTemp">
					<xsl:with-param name="NumEmptyRows" select="$NumEmptyRows - 1"/>
					<xsl:with-param name="TempToCall" select="$TempToCall"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
		<!--<xsl:if test="$IsSeparated = 'yes' ">
			<xsl:choose>
				<xsl:when test="$TempToCall = 'EmptyExplanationLine'">
					<xsl:call-template name="EmptyExplanationLine">
						<xsl:with-param name="IsSeparated">yes</xsl:with-param>
						<xsl:with-param name="CalledTemplate" select="$CalledTemplate"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
			<xsl:call-template name="EmptyIteratorTemp">
				<xsl:with-param name="NumEmptyRows" select="$NumEmptyRows - 1"/>
				<xsl:with-param name="TempToCall" select="$TempToCall"/>
			</xsl:call-template>
		</xsl:if>-->
	</xsl:template>	
</xsl:stylesheet>
