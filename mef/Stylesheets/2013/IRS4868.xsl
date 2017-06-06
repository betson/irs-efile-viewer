<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="IRS4868Style.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS4868"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				     <meta http-equiv="Content-Type" content="text/html" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<meta name="Description" content="Form IRS 4868"/>
				<xsl:call-template name="InitJS"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS4868Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form4868">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form -->
<div class="styBB" style="width:187mm;">
	<div class="styFNBox" style="width:30mm;font-size: 7pt;height:19mm;">
		<div style="height:12mm">
            Form<span class="styFormNumber"> 4868</span>
          </div>
				<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service (99)</span>
						</div>
		<div class="styFTBox" style="height:19mm;width:122mm;padding-top:1mm;">
		<div class="styMainTitle" style="">Application for Automatic Extension of Time<br/>
      To File U.S. Individual Income Tax Return
      </div>				
	<div class="styFST" style="width:122mm;height:5mm;padding-top:4mm;font-size:6pt;margin-left:2mm;text-align:left;">
        For calendar year 2013, or other tax year beginning
					<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
						ending 
					<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								<span style="width:0mm;"></span>.
            </div>
						</div>
	<div class="styTYBox" style="width:30mm;height:19mm; border-left-width: 1px;">
							<div class="styOMB" style="height:2mm;font-size:7pt;">OMB No. 1545-0074</div>
							<br/>
	<div class="styTaxYear" style="height:10mm">20<span class="styTYColor">13</span>
							</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!-- BEGIN Part I Title -->
	<div class="styBB" style="width:187mm;border-bottom: 1px solid black;">
						<table width="186mm" border="0" cellpadding="0" cellspacing="0" style="font-family: Verdana; font-size: 7pt;">
							<!-- Inner table - Header, Part I -->
							<tr>
								<!--identification-->
								<td >
									<table style="width:95mm" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td style="width: 95mm;font-size:7pt;border-bottom:1px solid black;">
												<div class="styBB" style="width: 95mm;border-top:1px solid black;">
													<div class="styPartName" style="width:10mm;text-align:top;">Part l</div>
													<span class="styPartDesc" style="width:85mm;background-color:lightgrey;">Identification
                                    </span>
												</div>
											</td>
										</tr>
										<tr>
											<!--Name-->
											<td >
												<div style="width: 95mm;border-bottom: 1px solid black;border-right: 1px solid black;">
													<span class="styLNLeftNumBox" style="width:4mm;padding-left: 1.0mm;height:8mm;font-size:7pt;">1</span>
													<span class="styLNDesc" style="width:89mm;height:8mm;font-size:7pt;">Your name(s) (see instructions)
                                    <br/>
														<span style="height:4.5mm;padding-top:1mm;">
															<xsl:call-template name="PopulateReturnHeaderFiler">
																<xsl:with-param name="TargetNode">Name</xsl:with-param>
															</xsl:call-template>
															<br/>
														</span>
													</span>
												</div>
											</td>
										</tr>
										<tr>
											<!--Address-->
					<td>
					<div style="width: 95mm;border-bottom: 1px solid black;border-right: 1px solid black;">
				<div class="styLNLeftNumBox" style="width:4mm;padding-left: 1.0mm;height:14mm;font-size:7pt;"/>
							<div class="styLNDesc" style="width:74mm;height:6mm;font-size:7pt;">Address (see instructions)
                                        <br/>
														<span style="height:6mm;padding-top:1mm;">
															<xsl:call-template name="PopulateReturnHeaderFiler">
																<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
															</xsl:call-template>
															<br/>
															<xsl:call-template name="PopulateReturnHeaderFiler">
																<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
															</xsl:call-template>
														</span>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<!--City,State-->
											<td>
												<div style="width: 95mm;border-bottom:1px  solid black;border-right: 1px solid black;height:12.4mm;">
													<div class="styLNLeftNumBox" style="width:4mm;padding-left: 1.0mm;height:10mm;font-size:7pt;"/>
									<div class="styLNDesc" style="width:54mm;height:12.4mm;font-size:7pt;border-right: 1px solid black;">City, town, or post office
                                            <br/>
														<br/>
														<xsl:if test="$RtnHdrData/Filer/USAddress">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"/>
														</xsl:call-template>
															</xsl:if>
															 <xsl:if test="AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress">
															 <div style="font-size:6pt;">
															 	<xsl:call-template name="PopulateReturnHeaderFiler">
															<xsl:with-param name="TargetNode">City</xsl:with-param>
														</xsl:call-template>
													<br/>
														<xsl:call-template name="PopulateReturnHeaderFiler">
															<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
														</xsl:call-template>
														</div>
															</xsl:if>
													</div>
													<div class="styLNDesc" style="width:12mm;height:100%;font-size:7pt;text-align:center;border-right: 1px solid black;">
                                        State
                                            <br/>
														<br/>
														 <xsl:if test="$RtnHdrData/Filer/USAddress">
													<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/State"/>
														</xsl:call-template>
														</xsl:if>
														 <xsl:if test="AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress">
														<xsl:call-template name="PopulateReturnHeaderFiler">
															<xsl:with-param name="TargetNode">Country</xsl:with-param>
														</xsl:call-template>
															</xsl:if>
													</div>
													<div class="styLNDesc" style="width:24mm;height:100%;font-size:7pt;text-align:center;">
										<span align="left" style="text-align:left;margin-right:6mm;padding-left:1mm">			
                                        ZIP code</span>
                                            <br/>
														<br/>
														<xsl:if test="$RtnHdrData/Filer/USAddress">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCode"/>
														</xsl:call-template>
														</xsl:if>
														<xsl:if test="AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress">
														 <xsl:call-template name="LinkToLeftoverDataTableInline">
                               <xsl:with-param name="Desc">Part I, line 2 - Postal Code</xsl:with-param>
                                <xsl:with-param name="TargetNode" select="AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress/PostalCode"/>
                                  </xsl:call-template> 
														
														</xsl:if>
													</div>
													<br/>
													<br/>
												</div>
											</td>
										</tr>
										<tr>
											<!--SSN-->
											<td>
												<div style="width: 95mm;border-bottom-width: 0px;border-right: 1px solid black;">
													<span class="styLNLeftNumBox" style="width:4mm;padding-left: mm;height:8mm;font-size:7pt;">2</span>
													<span class="styLNDesc" style="width:42mm;height:10mm;font-size:7pt;border-right: 1px solid black;text-align:center">
													<span style="margin-right:2mm">
													Your social security number
													</span>
                                            <br/>
														<br/>
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
														</xsl:call-template>
													</span>
													<span class="styLNLeftNumBox" style="padding-left: 1mm;width:5mm;height:10mm;font-size:7pt;">3</span>
													<span class="styLNDesc" style="width:43mm;height:10mm;font-size:7pt;text-align:center">Spouse's social security number
                                            <br/>
														<br/>
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseSSN"/>
														</xsl:call-template>
													</span>
												</div>
											</td>
										</tr>
									</table>
								</td>
								<!--Part II-->
								<td width="92mm" style="width=89mm;" valign="top">
									<table style="width: 92mm;" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<!--Title-->
											<td style="width: 92mm;font-size:7pt;border-bottom:1px solid black;">
												<div class="styBB" style="width: 92mm;border-top:1px solid black;">
													<div class="styPartName" style="width:11mm;">Part ll</div>
													<div class="styPartDesc" style="width:81mm;background-color:lightgrey;">Individual Income Tax
                                    </div>
												</div>
											</td>
										</tr>
										<tr>
											<!--Line 4-->
											<td style="width: 92mm;font-size:8pt;">
												<div style="width: 92mm; padding-top: .5mm;">
													<span class="styLNLeftNumBox" style="width:5mm;padding-left: 1.25mm;height:5mm; font-size:7pt;">4</span>
													<span class="styLNDesc" style="width:50mm;height:5mm;font-size:7pt;">Estimate of total tax liability for 2013
                                    </span>
													<span style="width:5px;"/> $
                                    <span style="width:32mm;border-bottom: 1px solid black;text-align:right;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLiabilityAmt"/>
														</xsl:call-template>
													</span>
												</div>
											</td>
										</tr>
										<tr>
											<!--Line 5-->
											<td style="width: 92mm;font-size:8pt;">
												<div style="width: 92mm;padding-top:.1mm; padding-bottom:.1mm;">
													<span class="styLNLeftNumBox" style="width:5mm;padding-left: 1.25mm;height:4mm; font-size:7pt;">5</span>
													<span class="styLNDesc" style="width:30mm;height:4mm;font-size:7pt;">Total 2013 payments
                                    </span>
									<span style="width:8px;"/>.
                                    <span style="width:8px;"/>.
                                    <span style="width:7px;"/>.
                                    <span style="width:7px;"/>.
                                    <span style="width:7px;"/>.
                                     <span style="width:7px;"/>.
                                    <span style="width:32mm;border-bottom: 1px solid black;text-align:right;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
														</xsl:call-template>
													</span>
												</div>
											</td>
										</tr>
										<tr>
											<!--Line 6-->
								<td style="width: 92mm;font-size:8pt;">
												<div style="width: 92mm; padding-top: .5mm;">
													<span class="styLNLeftNumBox" style="width:5mm;padding-left: 1.25mm;height:4mm; font-size:7pt;">6</span>
												<span class="styLNDesc" style="width:87mm;height:4mm;font-size:7pt;"><b>Balance due.</b> Subtract line 5 from line 4
                                    <br/>(see instructions)  
                                    <span style="width:8px;"/>.
                                    <span style="width:7px;"/>.
                                     <span style="width:7px;"/>.
                                   <span style="width:7px;"/>.
                                    <span style="width:7px;"/>.
                                    <span style="width:7px;"/>.
                                     <span style="width:7px;"/>.
                                      <span style="width:7px;"/>.
                                     <span style="width:7px;"/>.
                                    <span style="width:31mm;border-bottom: 1px solid black;text-align:right;font-size:8pt">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
															</xsl:call-template>
														</span>
													</span>
												</div>
											</td>
										</tr>
										<tr>
											<!--line 7-->
											<td style="width: 92mm;font-size:8pt;">
												<div style="width: 92mm; padding-top: .5mm;border-bottom:1px  solid black">
													<span class="styLNLeftNumBox" style="width:5mm;padding-left: 1.25mm;height:4mm; font-size:7pt;">7</span>
													<span class="styLNDesc" style="width:87mm;height:4mm;font-size:7pt;">Amount you are paying <span style="font-size:6pt;">(see instructions)</span>
														<span style="width:.5mm;"/>
														<img src="{$ImagePath}/4868_Bullet.gif" width="4" height="7" alt="Right arrow image" border="0"/>
														<span style="width:7px;"/>.
                                        <span style="width:.5mm;"/>
														<span style="width:31mm;text-align:right;font-size:8pt">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TaxpayerIsPayingAmt"/>
															</xsl:call-template>
														</span>
													</span>
												</div>
											</td>
										</tr>
										<tr>
										<!--Line 8-->
											<td style="width: 92mm;font-size:8pt;">
												<div style="width: 92mm; padding-top: .1mm;">
													<div class="styLNLeftNumBox" style="width:5mm;padding-left: 1.25mm;height:4mm; font-size:7pt;">8</div>
													<div class="styLNDesc" style="width:80mm;height:4mm;font-size:7pt;">
													<label>
															<xsl:call-template name="PopulateLabel">
																<xsl:with-param name="TargetNode" select="$FormData/TaxpayerAbroadInd"/>
																<xsl:with-param name="BackupName">IRS4868TaxpayerAbroadInd</xsl:with-param>
															</xsl:call-template>Check here if you are "out of the country" and a U.S.<br/>citizen or resident (see instructions)
														</label>
                                           <span class="styBoldText">
								<span style="width:7px"/>.
                                   	<span style="width:2px"/>.
                                   	<span style="width:6px"/>.
                                  	<span style="width:7px"/>.
                                   	<span style="width:7px"/>.
                                   	<span style="width:7px"/>.
                                 	<span style="width:7px"/>.
                                  	<span style="width:7px"/>.
                                  	<span style="width:7px"/>.
                                  </span>
                                  	</div>
                                      <div class="styLNDesc" style="width:7mm;height:4mm;font-size:7pt;padding-top:4mm;">
                               <img src="{$ImagePath}/4868_Bullet.gif" alt="Right arrow image" border="0"/>
														<span style="width:2.0mm;"/>
														<input type="checkbox" class="styckbox" name="checkbox">
															<!--xsl:if test="$FormData/TaxpayerAbroadInd"-->
																<xsl:call-template name="PopulateCheckbox">
																	<xsl:with-param name="TargetNode" select="$FormData/TaxpayerAbroadInd"/>
																	<xsl:with-param name="BackupName">IRS4868TaxpayerAbroadInd</xsl:with-param>
																</xsl:call-template>
															<!--/xsl:if-->
														</input>
														
													</div>
												</div>
											</td>
										</tr>
										<tr>
										<!--Line 9-->
											<td style="width: 92mm;font-size:8pt;">
												<div style="width: 92mm; padding-top: .1mm;">
													<div class="styLNLeftNumBox" style="width:5mm;padding-left: 1.25mm;height:4mm; font-size:7pt;">9</div>
													<div class="styLNDesc" style="width:80mm;height:4mm;font-size:7pt;">
													<label>
															<xsl:call-template name="PopulateLabel">
																<xsl:with-param name="TargetNode" select="$FormData/NonresWithNoWagesSubjToWhInd"/>
																<xsl:with-param name="BackupName">IRS4868NonresWithNoWagesSubjToWhInd</xsl:with-param>
															</xsl:call-template>Check here if you file Form 1040NR or 1040NR-EZ and did<br/>not receive wages as an employee subject to U.S. income<br/>tax withholding
														</label>
                                      <span class="styBoldText">
								<span style="width:7px"/>.
                                   	<span style="width:7px"/>.
                                   	<span style="width:7px"/>.
                                  	<span style="width:7px"/>.
                                   	<span style="width:7px"/>.
                                   	<span style="width:7px"/>.
                                 	<span style="width:7px"/>.
                                  	<span style="width:7px"/>.
                               	<span style="width:7px"/>.
                                   	<span style="width:7px"/>.
                                  	<span style="width:7px"/>.
                                	<span style="width:7px"/>.
                                 	<span style="width:7px"/>.
                                 	<span style="width:7px"/>.
                                 	<span style="width:7px"/>.
                                 	<span style="width:7px"/>.
                                  </span>
                                  </div>
                                  <div class="styLNDesc" style="width:7mm;height:4mm;font-size:7pt;padding-top:8mm;">
                                  <img src="{$ImagePath}/4868_Bullet.gif" alt="Right arrow image" border="0"/>
														<span style="width:2mm;"/>
														<input type="checkbox" class="styckbox" name="checkbox">
															<!--xsl:if test="$FormData/NonresWithNoWagesSubjToWhInd"-->
																<xsl:call-template name="PopulateCheckbox">
																	<xsl:with-param name="TargetNode" select="$FormData/NonresWithNoWagesSubjToWhInd"/>
																	<xsl:with-param name="BackupName">IRS4868NonresWithNoWagesSubjToWhInd</xsl:with-param>
																</xsl:call-template>
															<!--/xsl:if-->
														</input>
															</div>
													</div>
												
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<div class="pageEnd" style="width: 187mm;font-size:7pt;">
						<span style="float:left;"><b>For Privacy Act and Paperwork Reduction Act Notice, see page 4.</b>
					<span style=" width:21mm;"/>Cat. No. 13141W</span>
				
					<span style="font-size:7 pt;float:right;">Form <b>4868 </b>(2013)</span>
						</div>
					<!-- END Part I Part ll Title -->
				<!-- From 1065 form -->
				<!-- BEGIN Left Over Table -->
		<div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
          Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>
        </div>
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$FormData"/>
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>
                      <td class="styLeftOverTableRowAmount" style="width:100mm;" scope="row">
                                    <xsl:call-template name="PopulateLeftoverRow">
                                      <xsl:with-param name="Desc">Part I, line 2 - Postal Code</xsl:with-param>
                                        <xsl:with-param name="TargetNode" select="AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress/PostalCode"/>
                                        <xsl:with-param name="BackupName">AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress/PostalCode</xsl:with-param>
                                    </xsl:call-template>
                            </td>
        </table>
        	</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
