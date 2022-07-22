<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS6781Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form6781Data" select="$RtnDoc/IRS6781"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form6781Data)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set    -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Author" content="Charles Moore"/>
				<meta name="Description" content="TY 2003 IRS Form 6781"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
	  <xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS6781Style"/>
						<xsl:call-template name="AddOnStyle"/>
		</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="Form6781">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:21mm;">
							<div style="padding-top:1mm;">
                                Form <span class="styFormNumber">6781</span>
								<br/>
								<span style="width:1mm;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form6781Data"/>
								</xsl:call-template>
							</div>
							<div style="padding-top:1mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<div class="styMainTitle" style="height:8mm;padding-top:3mm">Gains and Losses From Section 1256<br/>Contracts and Straddles</div>
							<div style="height:3.5mm;font-size:7pt;padding-top:6mm;border:0px;" class="styFST">
							
								<img src="{$ImagePath}/6781_Bullet.gif" alt="Bullet Image"/>
								<span style="width:.5mm"/>
								 Information about Form 6781 and its instructions is at 
								<a href="http://www.irs.gov/form6781" title="Link to IRS.gov">
									<i>www.irs.gov/form6781.</i>
								</a>
							</div><br/>
							<div class="styFBT" style="height:5mm;padding-top:1mm">
								<img src="{$ImagePath}/6781_Bullet.gif" alt="bullet"/> 
								<span style="width:.5mm"/>
								Attach to your tax return.
						    </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:21mm;">
							<div class="styOMB" style="height:4mm;width:30mm;">OMB No. 1545-0644</div>
							<div class="styTY">20<span class="styTYColor">14</span>
							</div>
							<div class="styIRS6781Attachment" style="font-family:arial">Attachment<br/>Sequence No. <span class="styBoldText">82</span>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:150mm;height:9mm;font-weight:normal;font-size:7pt;">
                             Name(s) shown on tax return<br/>
                              <xsl:choose>
							<!-- Name from Form level -->
							<xsl:when test="normalize-space($Form6781Data/BusinessName/BusinessNameLine1Txt) != ''">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$Form6781Data/BusinessName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$Form6781Data/BusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:when>
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
							<xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
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
							<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								</xsl:call-template>
								<br/>
							</xsl:when>
							</xsl:choose>
						</div>
						<div class="styIRS6781INBox" style="width:35mm;height:9mm;padding-left:2mm;font-size:7pt;">
                        Identifying number<br/>
							<br/>							
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
						</div>
					</div>
					<div class="styBB" style="width:187mm;font-size:6pt;height:10mm">
						<div class="styGenericDiv" style="width:56mm;">Check all applicable boxes (see instructions).
						</div>
						<div class="styGenericDiv" style="width:65mm;">
							<span class="styBoldText">A</span>
							<span style="width:12px;"/>
							<input type="checkbox" alt="Mixed straddle election" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form6781Data/MixedStraddleElectionInd"/>
									<xsl:with-param name="BackupName">IRS6781MixedStraddleElection</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:12px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form6781Data/MixedStraddleElectionInd"/>
									<xsl:with-param name="BackupName">IRS6781MixedStraddleElection</xsl:with-param>
								</xsl:call-template>Mixed straddle election</label>
						</div>
						<div class="styGenericDiv" style="width:65mm;">
							<span class="styBoldText">C</span>
							<span style="width:12px;"/>
							<input type="checkbox" alt="Mixed straddle account election" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form6781Data/MixedStraddleAccountInd"/>
									<xsl:with-param name="BackupName">IRS6781MixedStraddleAccountElection</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:12px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form6781Data/MixedStraddleAccountInd"/>
									<xsl:with-param name="BackupName">IRS6781MixedStraddleAccountElection</xsl:with-param>
								</xsl:call-template>Mixed straddle account election</label>
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form6781Data/MixedStraddleAccountInd"/>
							</xsl:call-template>
						</div>
                         <div class="styGenericDiv" style="width:56mm;">&#160;
						</div>
						<div class="styGenericDiv" style="width:65mm;">
							<span class="styBoldText">B</span>
							<span style="width:12px;"/>
							<input type="checkbox" alt="Straddle-by-straddle identification election" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form6781Data/StraddleByStraddleInd"/>
									<xsl:with-param name="BackupName">IRS6781StraddleByStraddleIdElection</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:12px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form6781Data/StraddleByStraddleInd"/>
									<xsl:with-param name="BackupName">IRS6781StraddleByStraddleIdElection</xsl:with-param>
								</xsl:call-template>Straddle-by-straddle identification election
                           </label>
						</div>
						<div class="styGenericDiv" style="width:65mm;">
							<span class="styBoldText">D</span>
							<span style="width:12px;"/>
							<input type="checkbox" alt="Net section 1256 contracts loss election" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form6781Data/NetSection1256ElectionInd"/>
									<xsl:with-param name="BackupName">IRS6781NetSection1256ElectionInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:12px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form6781Data/NetSection1256ElectionInd"/>
									<xsl:with-param name="BackupName">IRS6781NetSection1256ElectionInd</xsl:with-param>
								</xsl:call-template>Net section 1256 contracts loss election</label>
							<span style="width:2px;"/>
						</div>
					</div>
					<!-- BEGIN PART I TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:4mm;">Part I</div>
						<div class="styPartDesc" style="width: 170mm">
							<div class="styGenericDiv" style="width:1mm; float: right; clear: none;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form6781Data/Section1256CntrctsAcctInfoGrp"/>
									<xsl:with-param name="containerHeight" select="3"/>
									<xsl:with-param name="containerID" select=" 'MTMctn' "/>
									<xsl:with-param name="imageID" select=" 'UGLimg' "/>
                                    <xsl:with-param name="buttonID" select=" 'UGLbtn' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
							<span style="width:6px; float: left; clear: none;"/>
							  Section 1256 Contracts Marked to Market
						</div>
					</div>
					<!-- END PART I TITLE -->
					<!-- BEGIN Part I Section 1256 Table -->
					<div class="styTableContainer" style="height:auto;" id="MTMctn">
					<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" style="font-size:7pt;border-color:black; id='MTMctn' ">
							<thead class="styTableThead">
								<tr >
									<th class="styTableCellHeader" scope="col" style="width:8mm;border-right-width:0px;">
										<span class="styTableCellPad"/>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:100mm;">
										<span style="font-weight:bold;">(a)</span>
										<span class="styNormalText"> Identification of account</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35.4mm;">
										<span style="font-weight:bold;">(b) (Loss)</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:36.7mm;border-right-width:0px;">
										<span style="font-weight:bold;">(c) Gain</span>
									</th>
										<th class="styLNRightNumBoxNBB" style="width:37mm;height:4.5mm;background-color:lightgrey;"/>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form6781Data/Section1256CntrctsAcctInfoGrp) &lt;= 3) ">
									<xsl:for-each select="$Form6781Data/Section1256CntrctsAcctInfoGrp">
										<tr>
											<td class="styTableCell" style="width:8mm;border-right-width:0px;text-align:center;vertical-align:top">
												<xsl:if test="(position() = count($Form6781Data/Section1256CntrctsAcctInfoGrp)) and (position() &gt;= 3)">
													<xsl:attribute name="style">border-bottom-width:0px;width:8mm;border-right-width:0px</xsl:attribute>
												</xsl:if>
												<span class="styBoldText">
													<xsl:if test="position()=1">1</xsl:if>
												</span>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="width:71mm;text-align:left;">
												<xsl:if test="(position() = count($Form6781Data/Section1256CntrctsAcctInfoGrp)) and (position() &gt;= 3)">
													<xsl:attribute name="style">border-bottom-width:0px;width:105.7mm;text-align:left;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AccountIdentificationDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:35.4mm;vertical-align:bottom;">
												<xsl:if test="(position() = count($Form6781Data/Section1256CntrctsAcctInfoGrp)) and (position() &gt;= 3)">
													<xsl:attribute name="style">border-bottom-width:0px;width:35.4mm;vertical-align:bottom;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:36.7mm;border-right-width:0px;vertical-align:bottom;">
												<xsl:if test="(position() = count($Form6781Data/Section1256CntrctsAcctInfoGrp)) and (position() &gt;= 3)">
													<xsl:attribute name="style">border-bottom-width:0px;width:36.7mm;border-right-width:0px;vertical-align:bottom;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:37mm;background-color:lightgrey;border-left-width:1px;border-bottom:0;border-right:0;">
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Table Filler Rows -->
								<xsl:if test="count($Form6781Data/Section1256CntrctsAcctInfoGrp) &lt; 1 or ((count($Form6781Data/Section1256CntrctsAcctInfoGrp) &gt; 3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:8mm;border-right-width:0px;">
											<span class="styBoldText">1</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:105.7mm;text-align:left;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form6781Data/Section1256CntrctsAcctInfoGrp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:35.4mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36.7mm;border-right-width:1px;">
											<span class="styTableCellPad"/>
										<td class="styTableCell" style="width:36.7mm;background-color:lightgrey;
											border-right-width:0px;border-bottom-width:0px;">
										</td>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form6781Data/Section1256CntrctsAcctInfoGrp) &lt; 2 or 
								((count($Form6781Data/Section1256CntrctsAcctInfoGrp) &gt; 3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:8mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:105.7mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:35.4mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36.7mm;border-right-width:1px;">
											<span class="styTableCellPad"/>
										</td>
									<td class="styTableCell" style="width:36.7mm;background-color:lightgrey;border-right-width:0px;;border-bottom-width:0px;">
										</td>	
									</tr>
								</xsl:if>
								<xsl:if test="count($Form6781Data/Section1256CntrctsAcctInfoGrp) &lt; 3 or ((count($Form6781Data/Section1256CntrctsAcctInfoGrp) &gt; 3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:8mm;border-right-width:0px;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:105.7mm;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:35.4mm;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36.7mm;border-right-width:1px;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36.7mm;background-color:lightgrey;border-right-width:0px;border-bottom-width:0px;">
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form6781Data/Section1256CntrctsAcctInfoGrp"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" 'MTMctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END Part I Section 1256 Table -->
					<!-- Line 2  -->
   					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
						<div class="styLNDesc" style="width:71mm;height:4mm">
							<span style="float:left;">Add the amounts on line 1 in columns (b) and (c)</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
						<div class="styLNAmountBox" style="width:31mm;height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form6781Data/TotalSection1256CntrctsLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:32mm;height:4.5mm; padding-right:1.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6781Data/TotalSection1256CntrctsGainAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:37mm;height:4.5mm;border-left-width:1px;background-color:lightgrey;border-bottom-width:1px;"/>
					</div>
					<!-- Line 3  -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
						<div class="styLNDesc" style="width:134mm;height:4mm;">
							<span style="float:left;">Net gain or (loss). Combine line 2, columns (b) and (c)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
						<div class="styLNAmountBox" style="width:36mm;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6781Data/NetGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4  -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">4</div>
						<div class="styLNDesc" style="width:134mm;height:4.5mm;">
							<span style="float:left;">Form 1099-B adjustments. See instructions and attach statement
						  <span style="width:2px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form6781Data/Form1099BAdjustmentsAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
						<div class="styLNFormLinkBox" style="height:4.5mm;padding-bottom:0mm;">         
						</div>
						<div class="styLNAmountBox" style="width:31mm;height:4.5mm;border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6781Data/Form1099BAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5  -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">5</div>
						<div class="styLNDesc" style="width:134mm;height:4.5mm;">
							<span style="float:left;">Combine lines 3 and 4</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
						<div class="styLNAmountBox" style="width:36mm;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6781Data/NetGainAnd1099BAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:9mm;"/>
						<div class="styLNDesc" style="width:134mm;height:9mm;">
							<span class="styBoldText">Note: </span>
							<span class="styItalicText">
							   If line 5 shows a net gain, skip line 6 and enter the gain on line 7. Partnerships
								and S corporations, see instructions.</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color: lightgrey; height:9mm;"/>
						<div class="styLNAmountBoxNBB" style="width:36mm;height:9mm;"/>
					</div>
					<!-- Line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;height:9mm;">6</div>
						<div class="styLNDesc" style="width:134mm;padding-top:1mm;height:9mm;">
						  If you have a net section 1256 contracts loss and checked box D above, enter
						  the amount of loss to 
						  <span style="float:left;">be carried back.  Enter the loss as a positive number.
						   If you did not check box D, enter -0-</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
						</div>
						<div class="styLNRightNumBox" style="padding-top:0mm;height:9mm;">
							<div style="background-color: lightgrey; width:8mm;height:3.5mm;"/>
							<div class="styLNRightNumBox" style="height:5mm;padding-top:2mm;border-bottom-width:0px;border-left-width:0px">6</div>
						</div>
						<div class="styLNAmountBox" style="width:36mm;padding-top:4.5mm;height:9mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6781Data/Section1256CarriedBackAmt"/>
							</xsl:call-template>
						</div>
					</div>
						<!-- Line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:5mm;">7</div>
						<div class="styLNDesc" style="width:134mm;height:5mm;">
							<span style="float:left;">Combine lines 5 and 6</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1.5mm">7</div>
						<div class="styLNAmountBox" style="width:36mm;height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6781Data/NetGainAndAdjPlusCarrybackAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
						<div class="styLNDesc" style="width:134mm;height:4mm;">
							<b>Short-term capital gain or (loss).</b>  Multiply line 7 by 40% (.40). Enter here and include on line 4 of
							<span style="float:left;"> Schedule D or on Form 8949 (see instructions)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">8</div>
						<div class="styLNAmountBox" style="width:36mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6781Data/ShortTermCapitalGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">9</div>
						<div class="styLNDesc" style="width:134mm;height:4mm;">
							<b>Long-term capital gain or (loss).</b> Multiply line 7 by 60% (.60). Enter here and include on line 11 of  
							<span style="float:left;">Schedule D or on Form 8949 (see instructions)</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">9</div>
						<div class="styLNAmountBoxNBB" style="width:36mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6781Data/LongTermCapitalGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN PART II TITLE -->
					<div class="styBB" style="width:187mm">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							<span style="width:6px;"/>Gains and Losses From Straddles. <span class="styNormalText">Attach a separate statement listing each straddle and its components.</span>
						</div>
					</div>
					<!-- END PART II TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS6781SectionDesc" style="width:183mm;float:left;clear:left;height:4mm">Section A&#8212;Losses From Straddles</div>
						<!-- &#151; is an em dash (as opposed to en dash) -->
						<div class="styGenericDiv" style="width:1mm;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form6781Data/LossesFromStraddlesInfoGrp"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'LFSctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- BEGIN Part II Section A Table -->
					<!-- 5 Point Verdana font is used in the body of this table out of neccessity-->
					<div class="styTableContainer" style="height:auto" id="LFSctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" style="border-color:black;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:32mm;"> (a)<span class="styNormalText;height:10mm"> Description of property</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:17mm;"> (b)<span class="styNormalText;height:10mm"> Date entered<br/>into or acquired</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:17mm;"> (c)<span class="styNormalText;height:10mm"> Date closed out or sold</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm"> (d)<span class="styNormalText;height:10mm"> Gross sales price</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm"> (e)<span class="styNormalText;height:10mm"> Cost or other basis plus expense of sale</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm"> (f) Loss. <span class="styNormalText;height:10mm">If column (e) is more than (d), enter difference. Otherwise, enter -0-</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm"> (g)<span class="styNormalText;height:10mm"> Unrecognized gain on offsetting positions</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;border-right-width:0px;height:10mm"> (h) Recognized loss.<span class="styNormalText">  If column (f) is more than (g), enter difference.  Otherwise, enter -0-</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody style="font-size:5pt;">
								<xsl:if test="($Print != $Separated) or (count($Form6781Data/LossesFromStraddlesInfoGrp) &lt;= 2) ">
									<xsl:for-each select="$Form6781Data/LossesFromStraddlesInfoGrp">
										<tr style="height:5mm;">
											<td class="styTableCellSmall" style="width:32mm;text-align:left;">
												<xsl:if test="(position() = count($Form6781Data/LossesFromStraddlesInfoGrp)) and (position() &gt;= 2)">
													<xsl:attribute name="style">border-bottom-width:0px;width:32mm;text-align:left;</xsl:attribute>
												</xsl:if>
													<span class="styBoldText" style="padding-left:1mm">
													<xsl:if test="position()=1">10</xsl:if>
												</span>
												<span class="styTableCellPad"/>
												<span style="font-size:5pt;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PropertyDesc "/>
													</xsl:call-template>
												</span>
												<span style="width:2px;"/>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:17mm;text-align:center">
												<xsl:if test="(position() = count($Form6781Data/LossesFromStraddlesInfoGrp)) and (position() &gt;= 2)">
													<xsl:attribute name="style">border-bottom-width:0px;width:17mm;text-align:center;</xsl:attribute>
												</xsl:if>
                                                    <xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="AcquiredDt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:17mm;text-align:center">
												<xsl:if test="(position() = count($Form6781Data/LossesFromStraddlesInfoGrp)) and (position() &gt;= 2)">
													<xsl:attribute name="style">border-bottom-width:0px;width:17mm;text-align:center;</xsl:attribute>
												</xsl:if>
                                                    <xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="ClosedOrSoldDt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS6781TableCellPartIISectA" style="width:24mm;">
												<xsl:if test="(position() = count($Form6781Data/LossesFromStraddlesInfoGrp)) and (position() &gt;= 2)">
													<xsl:attribute name="style">border-bottom-width:0px;width:24mm;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styIRS6781TableCellPartIISectA" style="width:24mm;">
												<xsl:if test="(position() = count($Form6781Data/LossesFromStraddlesInfoGrp)) and (position() &gt;= 2)">
													<xsl:attribute name="style">border-bottom-width:0px;width:24mm;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CostOrOtherBasisExpenseSaleAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styIRS6781TableCellPartIISectA" style="width:24mm;">
												<xsl:if test="(position() = count($Form6781Data/LossesFromStraddlesInfoGrp)) and (position() &gt;= 2)">
													<xsl:attribute name="style">border-bottom-width:0px;width:24mm;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styIRS6781TableCellPartIISectA" style="width:24mm;">
												<xsl:if test="(position() = count($Form6781Data/LossesFromStraddlesInfoGrp)) and (position() &gt;= 2)">
													<xsl:attribute name="style">border-bottom-width:0px;width:24mm;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="UnrcgnzdGainOffsettingPosAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styIRS6781TableCellPartIISectA" style="width:25mm;border-right-width:0px;">
												<xsl:if test="(position() = count($Form6781Data/LossesFromStraddlesInfoGrp)) and (position() &gt;= 2)">
													<xsl:attribute name="style">border-bottom-width:0px;width:25mm;border-right-width:0px;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RecognizedLossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Table Filler Rows -->
								<xsl:if test="count($Form6781Data/LossesFromStraddlesInfoGrp) &lt; 1 or ((count($Form6781Data/LossesFromStraddlesInfoGrp) &gt; 2) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellSmall" style="width:32mm;text-align:left;">
											<span class="styBoldText">10</span>
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form6781Data/LossesFromStraddlesInfoGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:17mm;text-align:center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:17mm;text-align:center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styIRS6781TableCellPartIISectA" style="width:24mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styIRS6781TableCellPartIISectA" style="width:24mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styIRS6781TableCellPartIISectA" style="width:24mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styIRS6781TableCellPartIISectA" style="width:24mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styIRS6781TableCellPartIISectA" style="width:25mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form6781Data/LossesFromStraddlesInfoGrp) &lt; 2 or ((count($Form6781Data/LossesFromStraddlesInfoGrp) &gt; 2) and ($Print = $Separated))">
									<tr >
										<td class="styTableCellSmall" style="width:32mm;text-align:left;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:17mm;text-align:center;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:17mm;text-align:center;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styIRS6781TableCellPartIISectA" style="width:24mm;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styIRS6781TableCellPartIISectA" style="width:24mm;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styIRS6781TableCellPartIISectA" style="width:24mm;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styIRS6781TableCellPartIISectA" style="width:24mm;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styIRS6781TableCellPartIISectA" style="width:25mm;border-right-width:0px;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form6781Data/LossesFromStraddlesInfoGrp"/>
						<xsl:with-param name="containerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'LFSctn' "/>
					</xsl:call-template>
					<!-- END Part II Section A Table -->
					<!-- 
         START Line 11a - The three amount boxes in this line must be the same width as the 
         last three columns of the "Part II Section A table" when the "Part II Section A table"
         is in an expanded format. Therefore 5pt Verdana font is used for these amount boxes.
          -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;">11a</div>
						<div class="styLNDesc" style="width:141mm;height:8mm;">
						  Enter the short-term portion of losses from line 10, column (h), here and include on line 4 of Schedule D
						  <span style="float:left;"> or on Form 8949 (see instructions)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:3mm;">11a</div>
							<div class="styLNAmountBox" style="height:8mm;width:30mm;font-size:6pt;padding-top:3mm;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form6781Data/ShortTermPortionRcgnzLossAmt"/>
								</xsl:call-template>
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$Form6781Data/ShortTermPortionRcgnzLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Line 11a-->
					<!-- 
         START Line 11b - The three amount boxes in this line must be the same width as the 
         last three columns of the "Part II Section A table" when the "Part II Section A table"
         is in an expanded format. Therefore 5pt Verdana font is used for these amount boxes.
      -->
					<div style="width:187mm;" class="styBB">
						<div class="styLNLeftLtrBox" style="padding-left: 4mm; height:8mm;">b</div>
						<div class="styLNDesc" style="width:141mm;height:8mm;">
						 Enter the long-term portion of losses from line 10, column (h), here and include on line 11 of Schedule D
						  <span style="float:left;"> or on Form 8949 (see instructions)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:3mm;">11b</div>
							<div class="styLNAmountBoxSmallNBB" style="height:8mm;width:30mm;font-size:6pt;padding-top:3mm;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form6781Data/LongTermPortionRcgnzLossAmt"/>
								</xsl:call-template>
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$Form6781Data/LongTermPortionRcgnzLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Line 11b-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS6781SectionDesc" style="width:183mm;float:left;clear:left;">Section B&#8212;Gains From Straddles</div>
						<!-- &#151; is an em dash (as opposed to an en dash) -->
						<div class="styGenericDiv" style="width:1mm;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form6781Data/GainsFromStraddlesInfoGrp"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'GFSctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- BEGIN Part II Section B Table -->
					<div class="styTableContainer" style="width:187mm;" id="GFSctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" style="border-color:black">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:46mm;" colspan="2"> (a)<span class="styNormalText"> Description of property</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:18mm;"> (b)<span class="styNormalText"> Date entered into or acquired</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:18mm;"> (c)<span class="styNormalText"> Date closed out or sold</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;"> (d)<span class="styNormalText"> Gross sales price</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;"> (e)<span class="styNormalText"> Cost or other basis plus expense of sale</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;border-right-width:0px;"> (f) Gain. <span class="styNormalText"> If column (d) is more than (e), enter difference. Otherwise, enter -0-</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form6781Data/GainsFromStraddlesInfoGrp) &lt;= 2) ">
									<xsl:for-each select="$Form6781Data/GainsFromStraddlesInfoGrp">
										<tr style="height:5mm;">
											<td class="styTableCellTextSmall" style="width:40mm;border-right-width:0px;">
												<xsl:if test="(position() = count($Form6781Data/GainsFromStraddlesInfoGrp)) and (position() &gt;= 2)">
													<xsl:attribute name="style">border-bottom-width:0px;width:40mm;border-right-width:0px;</xsl:attribute>
												</xsl:if>
												<span class="styBoldText" style="padding-left:1mm">
													<xsl:if test="position()=1">12</xsl:if>
												</span>
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDesc "/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="width:6mm;">
												<xsl:if test="(position() = count($Form6781Data/GainsFromStraddlesInfoGrp)) and (position() &gt;= 2)">
													<xsl:attribute name="style">border-bottom-width:0px;width:6mm;</xsl:attribute>
												</xsl:if>
												<span style="width:2px;"/>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:18mm;text-align:center;">
												<xsl:if test="(position() = count($Form6781Data/GainsFromStraddlesInfoGrp)) and (position() &gt;= 2)">
													<xsl:attribute name="style">border-bottom-width:0px;width:18mm;text-align:center;</xsl:attribute>
												</xsl:if>
                                                    <xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="AcquiredDt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:18mm;text-align:center;">
												<xsl:if test="(position() = count($Form6781Data/GainsFromStraddlesInfoGrp)) and (position() &gt;= 2)">
													<xsl:attribute name="style">border-bottom-width:0px;width:18mm;text-align:center;</xsl:attribute>
												</xsl:if>
                                                    <xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="ClosedOrSoldDt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmallArial" style="width:30mm;font-family:verdana;">
												<xsl:if test="(position() = count($Form6781Data/GainsFromStraddlesInfoGrp)) and (position() &gt;= 2)">
													<xsl:attribute name="style">border-bottom-width:0px;width:30mm;font-family:verdana;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmallArial" style="width:36mm;font-family:verdana;">
												<xsl:if test="(position() = count($Form6781Data/GainsFromStraddlesInfoGrp)) and (position() &gt;= 2)">
													<xsl:attribute name="style">border-bottom-width:0px;width:36mm;font-family:verdana;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CostOrOtherBasisExpenseSaleAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmallArial" style="width:36mm;font-family:verdana;border-right-width:0px;">
												<xsl:if test="(position() = count($Form6781Data/GainsFromStraddlesInfoGrp)) and (position() &gt;= 2)">
													<xsl:attribute name="style">border-bottom-width:0px;width:36mm;font-family:verdana;border-right-width:0px;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Table Filler Rows -->
								<xsl:if test="count($Form6781Data/GainsFromStraddlesInfoGrp) &lt; 1 or ((count($Form6781Data/GainsFromStraddlesInfoGrp) &gt; 2) and ($Print = $Separated))">
									<tr >
										<td class="styTableCellTextSmall" colspan="2" style="width:46mm;">
											<span class="styBoldText">
												<xsl:if test="position()=1">12</xsl:if>
											</span>
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form6781Data/GainsFromStraddlesInfoGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellSmall" style="width:18mm;text-align:center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:18mm;text-align:center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:30mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:36mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:36mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form6781Data/GainsFromStraddlesInfoGrp) &lt; 2 or ((count($Form6781Data/GainsFromStraddlesInfoGrp) &gt; 2) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellTextSmall" colspan="2" style="width:46mm;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:18mm;text-align:center;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:18mm;text-align:center;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:30mm;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:36mm;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:36mm;border-right-width:0px;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form6781Data/GainsFromStraddlesInfoGrp"/>
						<xsl:with-param name="containerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'GFSctn' "/>
					</xsl:call-template>
					<!-- END Part II Section B Table -->
					<!-- 
         START Line 13a - The three amount boxes in this line must be the same width as the 
         last three columns of the "Part II Section B table" when the "Part II Section B table"
         is in an expanded format.
      --> 
  <!-- Line 13a  -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8.2mm;">13a</div>
						<div class="styLNDesc" style="width:141mm;height:8.2mm;">
						   Enter the short-term portion of gains from line 12, column (f), here and include on line 4 of Schedule D 
						  <span style="float:left;"> or on Form 8949 (see instructions)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:8.4mm;padding-top:4.2mm;">13a</div>
							<div class="styLNAmountBoxSmall" style="width:30mm;height:8.4mm;padding-top:4.2mm;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form6781Data/ShortTermPortionOfGainAmt"/>
								</xsl:call-template>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6781Data/ShortTermPortionOfGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 13b  -->
					<div style="width:187mm;" class="styBB">
						<div class="styLNLeftLtrBox" style="height:8.2mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:141mm;height:8.2mm;">
						   Enter the long-term portion of gains from line 12, column (f), here and include on line 11 of Schedule D
						  <span style="float:left;"> or on Form 8949 (see instructions)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBoxNBB" style="height:8.2mm;padding-top:4.2mm;">13b</div>
							<div class="styLNAmountBoxSmallNBB" style="width:30mm;height:8.2mm;padding-top:4.2mm;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form6781Data/LongTermPortionOfGainAmt"/>
								</xsl:call-template>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6781Data/LongTermPortionOfGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>   
	 				<!-- BEGIN PART III TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="width: 168mm;height:3.8mm">
							<div class="styGenericDiv" style="width:1mm; float: right; clear: none;">
								<!-- button display logic -->
							<!--<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'UGLctn' "/>
							</xsl:call-template>-->


<!--								<xsl:call-template name="SetTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp"/>
									<xsl:with-param name="containerHeight" select="3"/>
									<xsl:with-param name="containerID" select=" 'UGLctn' "/>
									<xsl:with-param name="imageID" select=" 'UGLimg' "/>
									<xsl:with-param name="buttonID" select=" 'UGLbtn' "/>
								</xsl:call-template>-->
								<!-- end button display logic -->
							</div>
							<span style="width: 6px; float: left; clear: none;"/>
							<span style="float: left; clear: none;">
							Unrecognized Gains From Positions Held on Last Day of Tax Year.
							<span class="styNormalText">Memo Entry Only (see instructions)</span>
							</span>
						</div>
					</div>
					<!-- END PART III TITLE -->
					<!-- BEGIN Part III Table -->
			
					<div class="styTableContainer" style="height:auto;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" style="border-color:black;">
							<thead class="styTableThead" id="UGLctn" >
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:74mm;"> (a)<span class="styNormalText"> Description of property</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:16mm;"> (b)<span class="styNormalText"> Date acquired</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;"> (c)<span class="styNormalText"> Fair market value on last business day of tax year</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;"> (d)<span class="styNormalText"> Cost or other basis<br/>as adjusted</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;border-right-width:0px;"> (e) Unrecognized gain.<br/>
										<span class="styNormalText"> If column (c) is more than (d), enter difference. Otherwise, enter -0-</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp) &lt;= 3) ">
									<xsl:for-each select="$Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp">
										<tr>
											<td class="styTableCellText" style="width:74mm;">
												<xsl:if test="(position() = count($Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp)) and (position() &gt;= 3)">
													<xsl:attribute name="style">border-bottom-width:0px;width:74mm;</xsl:attribute>
												</xsl:if>
												<span class="styBoldText">
													<xsl:if test="position()=1">14</xsl:if>
												</span>
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="width:16mm;">
												<xsl:if test="(position() = count($Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp)) and (position() &gt;= 3)">
													<xsl:attribute name="style">border-bottom-width:0px;width:16mm;</xsl:attribute>
												</xsl:if>
                                                     <xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="AcquisitionDt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:32mm;">
												<xsl:if test="(position() = count($Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp)) and (position() &gt;= 3)">
													<xsl:attribute name="style">border-bottom-width:0px;width:32mm;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FairMarketVlLastBusDayOfTYAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;">
												<xsl:if test="(position() = count($Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp)) and (position() &gt;= 3)">
													<xsl:attribute name="style">border-bottom-width:0px;"width:32mm;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CostOrAdjustedBasisAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;border-right-width:0px;">
												<xsl:if test="(position() = count($Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp)) and (position() &gt;= 3)">
													<xsl:attribute name="style">border-bottom-width:0px;width:32mm;border-right-width:0px;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="UnrecognizedGainAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Table Filler Rows -->
								<xsl:if test="count($Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp) &lt; 1 or ((count($Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp) &gt; 3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:74mm;">
											<span class="styBoldText">14</span>
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:16mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp) &lt; 2 or ((count($Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp) &gt; 3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:74mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:16mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp) &lt; 3 or ((count($Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp) &gt; 3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:74mm;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:16mm;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-right-width:0px;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'UGLctn' "/>
							</xsl:call-template>
					<!-- END Part III Table -->
					<div style="width:187mm;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
						<span style="width:20mm;"/>   
							Cat. No. 13715G
					   <span style="width:40mm"/>  
						  Form <span class="styBoldText" style="font-size:8pt">6781</span> (2014)
					</div>
					<div class="pageEnd"/>
						<p style="page-break-before:always"/>
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
							<xsl:with-param name="TargetNode" select="$Form6781Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Begin Separated Repeating data table -->
					<xsl:if test="($Print = $Separated) and (count($Form6781Data/Section1256CntrctsAcctInfoGrp) &gt; 3)">
						<span class="styRepeatingDataTitle">Form 6781, Part I, Line 1 - Section 1256 Contracts Marked to Market:</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:3mm;border-right-width:0px;padding-right:2px;">
										<span class="styTableCellPad"/>
									</th>
									<th class="styDepTblCell" scope="col" style="width:114mm;border-left-width:0px;padding-left:2px;">(a) Identification of account</th>
									<th class="styDepTblCell" scope="col" style="width:37mm;">(b) (Loss)</th>
									<th class="styDepTblCell" scope="col" style="width:37mm;border-right-width:0px;">(c) Gain</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form6781Data/Section1256CntrctsAcctInfoGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:5mm;border-right-width:0px;border-right-width:0px;padding-right:2px;">
											<span class="styBoldText">
												<xsl:number value="position()" format="1"/>
											</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:114mm;text-align:left;border-left-width:0px;padding-left:2px;">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AccountIdentificationDesc"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:37mm;text-align:right;padding-right:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LossAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:37mm;border-right-width:0px;text-align:right;padding-right:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- Begin Part II Section-A table -->
					<xsl:if test="($Print = $Separated) and (count($Form6781Data/LossesFromStraddlesInfoGrp) &gt; 2)">
						<span class="styRepeatingDataTitle">Form 6781, Part II, Section A, Line 10 - Losses From Straddles:</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:37mm;"> (a) Description of property</th>
									<th class="styDepTblCell" scope="col" style="width:17mm;"> (b) Date entered<br/>into or acquired</th>
									<th class="styDepTblCell" scope="col" style="width:17mm;"> (c) Date closed out or sold</th>
									<th class="styDepTblCell" scope="col" style="width:23mm"> (d) Gross sales price</th>
									<th class="styDepTblCell" scope="col" style="width:23mm"> (e) Cost or other basis plus expense of sale</th>
									<th class="styDepTblCell" scope="col" style="width:23mm"> (f) Loss. If column (e) is more than <br/>(d), enter difference. Otherwise, enter -0-</th>
									<th class="styDepTblCell" scope="col" style="width:23mm"> (g) Unrecognized gain on offsetting positions</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;border-right-width:0px;"> (h) Recognized loss. If column (f) is more than (g), enter difference. Otherwise, enter -0-</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody style="font-size:6pt;">
								<xsl:for-each select="$Form6781Data/LossesFromStraddlesInfoGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:37mm;text-align:left;">
											<span class="styBoldText" style="width:3mm;">
												<xsl:number value="position()" format="1"/>
											</span>
											<span class="styTableCellPad"/>
											<span style="font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDesc "/>
												</xsl:call-template>
											</span>
											<span style="width:2px;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:17mm;text-align:center;">
                                                <xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="AcquiredDt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styDepTblCell" style="width:17mm;text-align:center;">
                                                <xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="ClosedOrSoldDt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styDepTblCell" style="width:23mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:23mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisExpenseSaleAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:23mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LossAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:23mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnrcgnzdGainOffsettingPosAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:24mm;border-right-width:0px;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RecognizedLossAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- Begin Part II section -B table -->
					<xsl:if test="($Print = $Separated) and (count($Form6781Data/GainsFromStraddlesInfoGrp) &gt; 2)">
						<span class="styRepeatingDataTitle">Form 6781, Part II, Section B, Line 12 - Gains From Straddles:</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:46mm;" colspan="2"> (a) Description of property</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;"> (b) Date entered into or acquired</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;"> (c) Date closed out or sold</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;"> (d) Gross sales price</th>
									<th class="styDepTblCell" scope="col" style="width:34mm;"> (e) Cost or other basis plus expense of sale</th>
									<th class="styDepTblCell" scope="col" style="width:34mm;border-right-width:0px;"> (f) Gain. If column (d) is more than (e), enter difference. Otherwise, enter -0-</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form6781Data/GainsFromStraddlesInfoGrp">
									<tr style="font-size:6pt;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:40mm;border-right-width:0px;text-align:left;">
											<span class="styBoldText" style="width:4mm;">
												<!--xsl:if test="position()=1">12</xsl:if-->
												<xsl:number value="position()" format="1"/>
											</span>
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc "/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:6mm;">
											<span style="width:2px;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:20mm;">
											
                                                <xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="AcquiredDt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styDepTblCell" style="width:20mm;">
                                                <xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="ClosedOrSoldDt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styDepTblCell" style="width:30mm;text-align:right;padding-right:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:34mm;text-align:right;padding-right:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisExpenseSaleAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:34mm;border-right-width:0px;text-align:right;padding-right:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- Begin Part III repeating table -->
					<xsl:if test="($Print = $Separated) and (count($Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp) &gt; 3)">
						<span class="styRepeatingDataTitle">Form 6781, Part III, Line 14 - Unrecognized Gains From Positions Held on Last Day of Tax Year:</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:64mm;"> (a) Description of property</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;"> (b) Date acquired</th>
									<th class="styDepTblCell" scope="col" style="width:35mm;"> (c) Fair market value on last business day of tax year</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;"> (d) Cost or other basis<br/>as adjusted</th>
									<th class="styDepTblCell" scope="col" style="width:35mm;border-right-width:0px;"> (e) Unrecognized gain.<br/>If column (c) is more than (d), enter difference. Otherwise, enter -0-</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form6781Data/UnrcgnzdGainsLastDayPosOfTYGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:64mm;text-align:left;">
											<span class="styBoldText" style="width:4mm;">
												<xsl:number value="position()" format="1"/>
											</span>
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:20mm;">
                                                <xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="AcquisitionDt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styDepTblCell" style="width:35mm;text-align:right;padding-right:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FairMarketVlLastBusDayOfTYAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:32mm;text-align:right;padding-right:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrAdjustedBasisAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:35mm;border-right-width:0px;text-align:right;padding-right:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnrecognizedGainAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>