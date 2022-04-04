<?xml version="1.0"?>
<!-- 06/18/2019 - Changes made for UWR 217975 - Jeremy Nichols -->
<!-- 08/01/2019 - Changes made for defect 128251 - Jeremy Nichols -->
<!-- 08/12/2019 - Changes made for defect 128247 - Jeremy Nichols -->
<!-- 09/09/2019 - Changes made for UWR 225142 - Jeremy Nichols -->
<!-- 09/17/2019 - Changes made for KISAMS IM00796916 - Jeremy Nichols -->
<!-- 10/08/2019 - Changes made per 2019 pdf review - Jeremy Nichols -->
<!-- 11/26/2019 - Changes made for KISAMS IM00878599 - Jeremy Nichols -->
<!-- 12/13/2019 - Changes made for defect 128999 - Jeremy Nichols -->
<!-- 02/12/2020 - Changes made for defect 128264 - Jeremy Nichols -->
<!-- 02/12/2020 - Changes made for defect 128245 - Jeremy Nichols -->
<!-- 10/28/2020 - Changes made for KISAMS IM01325295 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8886Style.xsl"/>
	
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	
	<xsl:param name="Form8886Data" select="$RtnDoc/IRS8886"/>
	<xsl:template match="/">
	
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8886Data)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<meta name="Description" content="Form 8886"/>
				<meta name="Generator" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--***************************************************************************************************
             HINTS: This form contains 4 expandable tables Line 1a, 5a, 6a and 8a.
             ***************************************************************************************************-->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8886Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form style="font-family:Arial; font-size:9.5pt" name="Form8886">
					<xsl:call-template name="DocumentHeader"/>
					<div style="display:block;">
					<div class="styTBB" style="width:187mm;border-bottom-width:1px;">
						<div style="float:left; width:31mm; font-size:7pt">  
          Form
          <span class="styFormNumber">8886          
          </span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8886Data"/>
							</xsl:call-template>
							<br/>(Rev.December 2019) <br/>
							<div style="font-size:6pt">        
            Department of the Treasury<br/>Internal Revenue Service
          </div>
						</div>
						<div style="float:left; border-left:1px solid black; border-right:1px solid black; width:125mm; height:18mm; text-align:center; padding-top:1mm; font-size:13pt; font-weight:bold">
							<span class="styMainTitle">Reportable Transaction Disclosure Statement</span>
							<span style="font-size:8pt; padding-top:2mm;">
								<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/><span style="width:1px;"/>Attach to your tax return. 
							</span><br/>
							<span style="font-size:8pt; padding-top:1mm;">
								<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/><span style="width:1px;"/>See separate instructions.
							</span>
						</div>
						<div style="float:left; font-size:7pt; width:31mm; padding-top:3.5mm; text-align:center; border-bottom:1px solid black; height:9mm">
          OMB No. 1545-1800
        </div>
						<div style="float:left; font-size:7pt; padding-top:1mm; padding-left:4.5mm">
          Attachment<br/>Sequence No. <b style="font-size:9pt">137</b>
						</div>
					</div>
					<!-- Begin Filer Name and Address Section -->
					<div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
						<div class="styFNBox" style="width:144mm;height:9mm;">
							Name(s) shown on return (individuals enter last name, first name, middle initial)<br/>
							<xsl:call-template name="PopulateFilerName">
							  <xsl:with-param name="TargetNode" select="$Form8886Data"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:42mm;height:9mm;padding-left:1mm;">
							<span class="styBoldText">Identifying number</span>
							<br/>
							<br/>
							<xsl:call-template name="PopulateFilerTIN">
							   <xsl:with-param name="TargetNode" select="$Form8886Data"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="font-family:verdana;font-size:7pt; width:187mm; height:9.5mm">
						<div class="styFNBox" style="width:85mm;height:9.5mm;">
        Number, street, and room or suite no.
        <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styFNBox" style="width:50mm;height:9.5mm;">
							City or town	
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
							</xsl:call-template>
							<br/>
						</div>
						<div class="styFNBox" style="width:30mm;height:9.5mm;">
							State
							<br/>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrStateNm"/>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CountryCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/Filer/USAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<br/>
						</div>
						<div class="styFNBox" style="width:20mm;height:9.5mm;border-right:0px;">
							Zip code
							<br/>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/Filer/USAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<br/>
						</div>
					</div>
					<!--					<div class="styBB" style="font-family:verdana;font-size:7pt; width:187mm; height:8mm;padding-top:1mm;">
        City or town, state, and ZIP code
        <br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
						</xsl:call-template>
					</div>  -->
					<!-- line A top -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;display:inline;">A</div>
						<div style="padding-top:0.5mm;display:inline;">If you are filing more than one Form 8886 with your tax return, sequentially number each Form 8886 and
							<div style="padding-top:0.5mm;display:inline;">enter the statement number for this Form 8886</div>
							<div style="padding-top:0.5mm;width:124mm;">
							<!-- dotted line -->
							<span class="styDotLn" style="padding-left:4px;display:inline;">.....</span>
								<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
								Statement number
								<span style="width:4px;"/>
								<span style="border-bottom:1px solid black; width:32.5mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8886Data/StatementCnt"/>
									</xsl:call-template>
								</span>
								<span style="width:1px;padding-top:.5mm"/>of
								<span style="width:1px;"/>
								<span style="border-bottom:1px solid black; width:32.5mm; text-align:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8886Data/TotalStatementCnt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!-- line B line 1 top -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;height:8mm;padding-top:2mm;">B</div>
						<div style="padding-top:2mm;width:120mm;float:left;width;">
							Enter the form number of the tax return to which this form is attached or related
						</div>
						<div style="float:right;padding-top:2mm;width:61mm;display:inline;">
						<!-- dotted line -->
						<span class="styDotLn" style="">....</span>
							<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
							<span style="width:1px;"/>
							<span style="border-bottom:1px solid black; width:38.5mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/TaxReturnFormNumberDsc"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- line B line 2 -->
					<div class="styNBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;height:8mm;"/>
						<div style="width:70mm;padding-top:0.5mm;float:left">
							Enter the year of the tax return identified above</div>
						<div style="float:right;padding-top:0.5mm;width:111mm">
							<span style="width:1px;"/>
						<!-- dotted line -->
						<span class="styDotLn" style="padding-left:3px;">  ................</span>
							<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
							<span style="width:1px;"/>
							<span style="border-bottom:1px solid black; width:38.5mm; text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form8886Data/TaxYearDt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- line B line 3 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;"/>
						<div style="padding-top:0.5mm;float:left;">
							Is this Form 8886 being filed with an amended tax return?
							<!-- <span style="width:3mm;"/>  -->
						</div>
						<span class="styDotLn" style="padding-left:3px;">  ............</span>
						<span style="width:1mm;"/>
						<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
						<span style="width:6mm;"/>
						<input class="styCkbox" type="checkbox" name="CheckAmendedReturnYes" alt="Check Amended Return Yes" id="CheckAmendedReturnYes" style="width:3mm;">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8886Data/AttachedToAmendedReturnInd"/>
								<xsl:with-param name="BackupName">CheckAmendedReturnYes</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="$Form8886Data/AttachedToAmendedReturnInd"/>
								<xsl:with-param name="BackupName">CheckAmendedReturnYes</xsl:with-param>
							</xsl:call-template>
              Yes
						</label>
						<span style="width:8mm;"/>
						<input type="Checkbox" class="styCkbox" name="CheckAmendedReturnNo" id="CheckAmendedReturnNo" alt="Check Amended Return No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8886Data/AttachedToAmendedReturnInd"/>
								<xsl:with-param name="BackupName">CheckAmendedReturnNo</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="$Form8886Data/AttachedToAmendedReturnInd"/>
								<xsl:with-param name="BackupName">CheckAmendedReturnNo</xsl:with-param>
							</xsl:call-template>
              No
						</label>
						<!--			</div>   -->
					</div>
					<!-- Line C top -->
					<div style="height:auto;width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;">C</div>
						<div style="float:left;width:165mm; padding-top:.5mm;">
                  Check the box(es) that apply (see instructions).
             <input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8886Data/InitialYearFilerInd"/>
									<xsl:with-param name="BackupName">IRS8886InitialYearFiler</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8886Data/InitialYearFilerInd"/>
									<xsl:with-param name="BackupName">IRS8886InitialYearFiler</xsl:with-param>
								</xsl:call-template>   
                Initial year filer
              </label>
							<span style="width:3mm;"/>
							<span style="width:3mm;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8886Data/ProtectiveDisclosureInd"/>
									<xsl:with-param name="BackupName">IRS8886ProtectiveDisclosure</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8886Data/ProtectiveDisclosureInd"/>
									<xsl:with-param name="BackupName">IRS8886ProtectiveDisclosure</xsl:with-param>
								</xsl:call-template>   
                Protective disclosure
              </label>
						</div>
					</div>
					<!-- 1a, 1 b, and 1 c table -->
					<xsl:choose>
						<!-- removed following line \modified to test -  need top border for 1 separated data occurence for this line -->
						<!--            <xsl:when test="($Print != $Separated) and (count($Form8886Data/ReportableTransactionInfo) &gt;0) or ($Print = $Separated) and (count($Form8886Data/ReportableTransactionInfo)=1) ">   -->
						<xsl:when test="($Print != $Separated) and (count($Form8886Data/ReportableTransactionInfo) &gt;0)">
							<div style="border-bottom:0; height:auto;" id="Line1TPctn">
								<xsl:for-each select="$Form8886Data/ReportableTransactionInfo">
									<div>
									<div class="styGenericDiv" style="width:182mm; font-size:8.5pt;;height:12mm;border-top:0 solid black;">
										<div style="font-weight:bold; padding-top:0; width:6mm; text-align:center; float:left">1a</div>
										<div style="float:left; width:85mm;">Name of reportable transaction</div>
										<div style="clear:left;float:left;padding-left:6mm; width:90.75mm;padding-top:0mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ReportableTransactionDesc"/>
												<xsl:with-param name="backupName">IRS8886NameOfReportableTransaction</xsl:with-param>
												<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
											</xsl:call-template>
											<!-- write in data pen image -->
											<span style="width:2mm"/>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Form 8886, line 1a - Book tax difference indicator</xsl:with-param>
												<xsl:with-param name="TargetNode" select="ReportableTransactionDesc/@bookTaxDifferenceIndicator"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="styBB" style="width:182mm;font-size:8.5pt;border-top:1px solid black;">
										<div class="styGenericDiv" style="width:91mm;font-size:8.5pt;height:12mm;border-right:1px solid black;">
											<span style="width:1mm;"/>
											<span class="styBoldText">1b</span>
											<span style="width:1.5mm;"/>Initial year participated in transaction<br/>
											<br/>
											<span style="width:6mm;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InitialParticipatedYr"/>
											</xsl:call-template>
										</div>
										<span style="width:1mm;"/>
										<span class="styBoldText">1c</span>
										<span style="width:1.5mm;"/>Reportable transaction or tax shelter registration number<br/>
										<span style="width:5.5mm;"/>(see instructions)<br/>
										<div style="float:left; text-align:center; width:91mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransactionOrTaxShelterNum"/>
											</xsl:call-template>
										</div>
									</div>
									</div>
								</xsl:for-each>
							</div>
						</xsl:when>
						<xsl:when test="($Print = $Separated) and (count($Form8886Data/ReportableTransactionInfo)=1) ">
							<div class="styIRS8886TableContainer2" style="float: none; clear:both; border-bottom:0; height:24.5mm" id="Line1TPctn">
								<xsl:call-template name="SetInitialState"/>
								<xsl:for-each select="$Form8886Data/ReportableTransactionInfo">
									<div class="styGenericDiv" style="width:182mm; font-size:8.5pt;;height:12mm;border-top:1px solid black;">
										<div style="font-weight:bold; padding-top:0; width:6mm; text-align:center; float:left">1a</div>
										<div style="float:left; width:85mm;">Name of reportable transaction</div>
										<div style="clear:left;float:left;padding-left:6mm; width:90.75mm;padding-top:0mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ReportableTransactionDesc"/>
												<xsl:with-param name="backupName">IRS8886NameOfReportableTransaction</xsl:with-param>
												<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
											</xsl:call-template>
											<!-- write in data pen image -->
											<span style="width:2mm"/>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Form 8886, line 1a - Book tax difference indicator</xsl:with-param>
												<xsl:with-param name="TargetNode" select="ReportableTransactionDesc/@bookTaxDifferenceIndicator"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="styBB" style="width:182mm;font-size:8.5pt;border-top:1px solid black;">
										<div class="styGenericDiv" style="width:91mm;font-size:8.5pt;height:12mm;border-right:1px solid black;">
											<span style="width:1mm;"/>
											<span class="styBoldText">1b</span>
											<span style="width:1.5mm;"/>Initial year participated in transaction<br/>
											<br/>
											<span style="width:6mm;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InitialParticipatedYr"/>
											</xsl:call-template>
										</div>
										<span style="width:1mm;"/>
										<span class="styBoldText">1c</span>
										<span style="width:1.5mm;"/>Reportable transaction or tax shelter registration number<br/>
										<span style="width:5.5mm;"/>(see instructions)<br/>
										<div style="float:left; text-align:center; width:91mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransactionOrTaxShelterNum"/>
											</xsl:call-template>
										</div>
									</div>
								</xsl:for-each>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div class="styBB" style="width:187mm; font-size:8.5pt; bottom-border:1mm;border-top:1px solid black;height:12mm;">
								<div style="font-weight:bold; padding-top:0; width:6mm; text-align:center; float:left;">1a</div>
								<div style="float:left; width:85mm;">Name of reportable transaction</div>
								<div style="clear:left;float:left;padding-left:6mm; width:90.75mm;padding-top:0mm;">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$Form8886Data/ReportableTransactionInfo/ReportableTransactionDesc"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styBB" style="width:187mm;font-size:8.5pt;">
								<div class="styGenericDiv" style="width:91mm;font-size:8.5pt;height:12mm;border-right:1px solid black;">
									<span style="width:1mm;"/>
									<span class="styBoldText">1b</span>
									<span style="width:1.5mm;"/>Initial year participated in transaction
		     </div>
								<span style="width:2mm;"/>
								<span class="styBoldText">1c</span>
								<span style="width:1.5mm;"/>Reportable transaction or tax shelter registration number	 <br/>
								<span style="width:5.5mm;"/>(see instructions)
      </div>
						</xsl:otherwise>
					</xsl:choose>
					<!-- line 2 -->
					<div style="width:187mm; padding-bottom:0.5mm;">
						<div class="styLNLeftNumBox" style="width:6mm">2</div>
						<div class="styLNDesc" style="width:179mm;padding-top:0.5mm">
          Identify the type of reportable transaction. Check all boxes that apply (see instructions).
        </div>
					</div>
					<!-- line 2a -->
					<div style="width:187mm">
						<div class="styLNLeftLtrBox">a</div>
						<div class="styGenericDiv" style="width:47mm">
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8886Data/ListedInd"/>
									<xsl:with-param name="BackupName">IRS8886Listed</xsl:with-param> 
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8886Data/ListedInd"/>
									<xsl:with-param name="BackupName">IRS8886Listed</xsl:with-param>
								</xsl:call-template>
                Listed
              </label>
						</div>
						<!-- line 2c -->
						<div class="styLNLeftLtrBox">c</div>
						<div class="styGenericDiv" style="width:47mm;">
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8886Data/ContractualProtectionInd"/>
									<xsl:with-param name="BackupName">IRS8886ContractualProtection</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8886Data/ContractualProtectionInd"/>
									<xsl:with-param name="BackupName">IRS8886ContractualProtection</xsl:with-param>
								</xsl:call-template>   
                Contractual protection
              </label>
						</div>
						<!-- line 2e -->
						<div class="styLNLeftLtrBox">e</div>
						<div class="styGenericDiv" style="width:47mm">
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8886Data/TransactionOfInterestInd"/>
									<xsl:with-param name="BackupName">IRS8886TransactionOfInterest</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8886Data/TransactionOfInterestInd"/>
									<xsl:with-param name="BackupName">IRS8886TransactionOfInterest</xsl:with-param>
								</xsl:call-template>   
                Transaction of interest
                </label>
						</div>
						<!-- line 2b -->
						<div style="width:187mm;padding-top:0px">
							<div class="styLNLeftLtrBox">b</div>
							<div class="styGenericDiv" style="width:47mm">
								<input type="Checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/ConfidentialInd"/>
										<xsl:with-param name="BackupName">IRS8886Confidential</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/ConfidentialInd"/>
										<xsl:with-param name="BackupName">IRS8886Confidential</xsl:with-param>
									</xsl:call-template>   
                Confidential
              </label>
							</div>
							<!-- line 2d -->
							<div class="styLNLeftLtrBox">d</div>
							<div class="styGenericDiv" style="width:47mm">
								<input type="Checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/LossInd"/>
										<xsl:with-param name="BackupName">IRS8886Loss</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/LossInd"/>
										<xsl:with-param name="BackupName">IRS8886Loss</xsl:with-param>
									</xsl:call-template>   
                Loss
              </label>
							</div>
						</div>
					</div>
					<!-- line 3 -->
					<div style="width:187mm; padding-top:2mm;">
						<div class="styLNLeftNumBox" style="width:5mm; height:4mm;">3</div>
						<div style="padding-top:0.5mm;display:inline;">If you checked box 2a or 2e,
							enter the published guidance number for the listed transaction or transaction of <br/>interest
							<span style="font-weight:bold;" >
								<span style="width:1px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>
							</span> 
							<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
							<div style="border-bottom:1px solid black; width:100mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PublishedGuidanceNumberTxt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- line 4 -->
					<div style="width:187mm; padding-top:2mm">
						<div class="styLNLeftNumBox" style="width:6mm;height:8mm">4</div>
						<div style="float:left; padding-top:0.5mm">Enter the number of "same as or substantially similar" transactions reported on this form</div>
						<span style="width:1px;float:right"/>
						<span style="font-weight:bold;" >
								<span style="width:8px;"/>.
								<span style="width:8px;"/>.
								<span style="width:8px;"/>
							</span>      
					    <img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
						<div style="float:right; border-bottom:1px solid black; width:35mm; height:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="6"/>
								<xsl:with-param name="TargetNode" select="$Form8886Data/SameOrSimilarTransactionCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 5 -->
					<div style="width:187mm; padding-top:0mm">
						<div class="styLNLeftNumBox" style="width:6mm;padding-top:0mm; ">5</div>
						<div style="float:left; width:181mm; padding-top:0mm">If you participated in this reportable transaction through a partnership, S corporation, trust, and foreign entity, check the applicable boxes and provide the information below for the entity(s) (see instructions). (Attach additional sheets, if necessary.)</div>
					</div>
					<!-- button display logic:  If print is not separated and there are more than 2 Entities then create toggle button and scroll bar to display in line data. -->
					<div style="width:187mm;display:block;">
						<xsl:choose>
							<xsl:when test="($Print != $Separated) or (($Print = $Separated) and count($Form8886Data/TypeOfEntityInformation) &lt; 3)">
								<!--  count($Form8886Data/TypeOfEntityInformation) = 1 or count($Form8886Data/TypeOfEntityInformation) = 2 ) -->
								<xsl:if test="count($Form8886Data/TypeOfEntityInformation) &gt; 2  ">
									<div style="float:right;clear:all;width:7mm;text-align:right;">
										<xsl:call-template name="SetDynamicTableToggleButton">
											<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation/*"/>
											<xsl:with-param name="containerHeight" select="7"/>
											<xsl:with-param name="headerHeight" select="0"/>
											<xsl:with-param name="containerID" select="'line5TPctn'"/>
										</xsl:call-template>
									</div>
								</xsl:if>
								<div class="styTableContainerNBB" id="line5TPctn">
									<xsl:call-template name="SetInitialState"/>
									<table class="styTable" cellspacing="0" cellpadding="0" border="0" style="width:100%; font-size:8pt;font-family:verdana;">
										<xsl:call-template name="Line5RowGenerator">
											<xsl:with-param name="pos" select="1"/>
										<xsl:with-param name="setCount" select="1"/>
										</xsl:call-template>
									</table>
								</div>
								<xsl:call-template name="SetInitialDynamicTableHeight">
									<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation/*"/>
									<xsl:with-param name="containerHeight" select="7"/>
									<xsl:with-param name="headerHeight" select="0"/>
									<xsl:with-param name="containerID" select="'line5TPctn'"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<!-- When Print is separated and the count of Type of Entity element is 3 or greater then print an empty table with the See Additional data message and display data in Separate data table -->
								<div class="styTableContainerNBB" id="line5TPctn">
									<xsl:call-template name="SetInitialState"/>
									<table class="styTable" cellspacing="0" cellpadding="0" style="width:100%; font-size:8pt;font-family:verdana;border-color:black">
										<xsl:call-template name="Line5EmptyTable"/>
									</table>
								</div>
								<xsl:call-template name="SetInitialDynamicTableHeight">
									<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation/*"/>
									<xsl:with-param name="containerHeight" select="7"/>
									<xsl:with-param name="headerHeight" select="0"/>
									<xsl:with-param name="containerID" select="'line5TPctn'"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					</div>
					<!-- line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;">6</div>
						<div style="width:180mm;float:left; padding-top:0.5mm;padding-bottom:0.5mm;">
            Enter below the name and address of each individual or entity to whom you paid a fee with regard to the transaction if that individual or entity promoted, solicited, or recommended your participation in the transaction, or provided tax 
              advice related to the transaction. (Attach additional sheets, if necessary.)
                <div style="width:3.2mm;float:right;clear:all;text-align:right;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo"/>
									<xsl:with-param name="containerHeight" select="6"/>
									<xsl:with-param name="headerHeight" select="0"/>
									<xsl:with-param name="containerID" select="'line6Tctn'"/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
					</div>
					<div class="styTableContainer" style="width:187mm;border-top:1px solid black;border-bottom:0px solid black;" id="line6Tctn">
						<!-- print logic of table toggle area -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" style="width:187mm;font-size:8pt;" cellspacing="0" cellpadding="0" border="0">
							<thead/>
							<tbody>
								<!--  If the print parameter is not set to be Separated, or there are fewer elements than the container height (2), execute -->
								<xsl:if test="($Print != $Separated) or (count($Form8886Data/PersonsYouPaidAFeeInfo) &lt;=2)">
									<xsl:for-each select="$Form8886Data/PersonsYouPaidAFeeInfo">
										<!--Line 6 Row 1 -->
										<tr >
											<td style="height:8mm;width:6mm;font-weight:bold;padding-left:2mm;border-bottom:1px solid black;" valign="top">
												<xsl:number value="position()" format="a"/>
											</td>
											<td style="height:8mm;width:78mm;padding-left:3px;text-align:left;border-bottom:1px solid black;border-right:1px solid black;">Name
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td style="height:8mm;width:48mm;padding-left:3px;text-align:left;font-weight:normal;border-bottom:1px solid black;border-right:1px solid black;">Identifying number (if known)
												<br/>
												<xsl:choose>
													<xsl:when test="SSN">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SSN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="EIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<span class="styTableCellPad"/>
											</td>
											<td style="height:8mm;width:55mm;padding-left:3px;text-align:left;border-bottom:1px solid black;" colspan="2">Fees paid
												<br/>
												  $ <span style="width:4mm;"/>
												<span style="text-align:right;width:28mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="FeesPaidAmt"/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
										<!-- Line 6 Row 2 street address -->
										<tr>
											<td style="height:12mm;width:84mm;padding-left:9mm;border-bottom:1px solid black;border-right:1px solid black;" colspan="2">Number, street, and room or suite no.
												<br/>
												<!-- A Choice of US or Foreign Street Address-->
												<xsl:choose>
													<!-- US Street Address -->
													<xsl:when test="USAddress">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:when>
													<xsl:otherwise>
														<!-- Foreign Street Address -->
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<!-- A choice of US or Foreign -->
											<xsl:choose>
												<!-- US -->
												<xsl:when test="USAddress">
													<td style="height:12mm;width:48mm;padding-left:3px;border-bottom:1px solid black;border-right:1px solid black;padding-bottom:3.5mm;">City or town<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress//CityNm"/>
														</xsl:call-template>,
													</td>
													<td style="height:12mm;width:37mm;padding-left:3px;border-bottom:1px solid black;border-right:1px solid black;padding-bottom:3.5mm;">State<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress//StateAbbreviationCd"/>
														</xsl:call-template><span style="width:1px;"/>
													</td>
													<td style="height:12mm;width:18mm;padding-left:3px;border-bottom:1px solid black;padding-bottom:3.5mm;">Zip code<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress//ZIPCd"/>
														</xsl:call-template>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<!-- Foreign Street Address -->
													<td style="height:12mm;width:48mm;padding-left:3px;border-bottom:1px solid black;border-right:1px solid black;padding-bottom:3.5mm;">City or town<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
														</xsl:call-template>,
													</td>
													<td style="height:12mm;width:37mm;padding-left:3px;border-bottom:1px solid black;border-right:1px solid black;padding-bottom:3.5mm;">State<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
														</xsl:call-template> <span style="width:2mm;"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
														</xsl:call-template>
													</td>
													<td style="height:12mm;width:18mm;padding-left:3px;border-bottom:1px solid black;padding-bottom:3.5mm;">Zip code<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
														</xsl:call-template>
													</td>
												</xsl:otherwise>
											</xsl:choose>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Line 6 has 1 record -->
								<xsl:if test="($Print != $Separated) and (count($Form8886Data/PersonsYouPaidAFeeInfo)=1)">										
									<tr style="width:187mm;">
											<td style="height:8mm;width:6mm;font-weight:bold;padding-left:2mm;border-bottom:1px solid black;" rowspan="3" valign="top">b
                      </td>
											<td style="height:8mm;width:78mm;padding-left:3px;float:left;border-bottom:1px solid black;border-right:1px solid black;">Name
                        <br/>
												<span class="styTableCellPad"/>
											</td>
											<td style="height:8mm;width:48mm;padding-left:3px;text-align:left;font-weight:normal;border-bottom:1px solid black;border-right:1px solid black;;">Identifying number (if known)
                        <br/>
												<span valign="center"/>
												<span class="styTableCellPad"/>
											</td>
											<td style="height:8mm;width:55mm;padding-left:3px;text-align:left;border-bottom:1px solid black;" colspan="2">Fees paid											
                        <br/>
                          $ <span style="width:4mm;"/>
												<span style="text-align:right;width:32mm;"/>
											</td>
										</tr>
										<!-- Line 6 Row 2 street address -->
										<tr >
											<td style="height:12mm;width:84mm;padding-left:3px;border-bottom:1px solid black;border-right:1px solid black;">Number, street, and room or suite no.
											<br/>
												<span class="styTableCellPad"/>
											</td>
											<td style="height:12mm;width:48mm;padding-left:3px;border-bottom:1px solid black;border-right:1px solid black;padding-bottom:3.5mm;">City or town<br/>
											</td>
											<td style="height:12mm;width:37mm;padding-left:3px;border-bottom:1px solid black;border-right:1px solid black;padding-bottom:3.5mm;">State<br/>
											</td>											
											<td style="float:left;clear:none;height:12mm;width:18mm;padding-left:3px;border-bottom:1px solid black;">ZIP code
											<br/>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>								
								<!--Line 6 Empty table -->
								<xsl:if test="count($Form8886Data/PersonsYouPaidAFeeInfo) &lt; 1 or ((count($Form8886Data/PersonsYouPaidAFeeInfo) &gt;2) and ($Print = $Separated))">
									<!--Line 6 Row 1 -->
									<tr >
											<td style="height:8mm;width:6mm;font-weight:bold;padding-left:2mm;border-bottom:1px solid black;" valign="top">
												a
											</td>
											<td style="height:8mm;width:78mm;padding-left:3px;text-align:left;border-bottom:1px solid black;border-right:1px solid black;">Name
												<br/>
												<span style="width:77mm"/>
											</td>
											<td style="height:8mm;width:48mm;padding-left:3px;text-align:left;font-weight:normal;border-bottom:1px solid black;border-right:1px solid black;">Identifying number (if known)
												<br/>
												<span style="width:47mm"/>
											</td>
											<td style="height:8mm;width:55mm;padding-left:3px;text-align:left;border-bottom:1px solid black;" colspan="2">Fees paid
												<br/>
												  $ <span style="width:47mm"/>
											</td>
										</tr>
										<!-- Line 6 Row 2 street address -->
										<tr>
											<td style="height:12mm;width:84mm;border-bottom:1px solid black;border-right:1px solid black;vertical-align:top;padding-top:1mm;" colspan="2"><span style="width:7mm;"/>Number, street, and room or suite no.
												<br/>
												<span style="width:83mm"/>
											</td>
													<td style="height:12mm;width:48mm;padding-left:3px;border-bottom:1px solid black;border-right:1px solid black;padding-bottom:3.5mm;">City or town<br/>
														<span style="width:47mm"/>
													</td>
													<td style="height:12mm;width:37mm;padding-left:3px;border-bottom:1px solid black;border-right:1px solid black;padding-bottom:3.5mm;">State<br/>
														<span style="width:36mm"/>
													</td>
													<td style="height:12mm;width:18mm;padding-left:3px;border-bottom:1px solid black;padding-bottom:3.5mm;">Zip code<br/>
														<span style="width:17mm"/>
													</td>
										</tr>
									<xsl:if test="count($Form8886Data/PersonsYouPaidAFeeInfo) &lt; 2 or ((count($Form8886Data/PersonsYouPaidAFeeInfo) &gt;2) and ($Print = $Separated))">
										<!--Line 6 Row 1 -->
									<tr >
											<td style="height:8mm;width:6mm;font-weight:bold;padding-left:2mm;border-bottom:1px solid black;" valign="top">
												b
											</td>
											<td style="height:8mm;width:78mm;padding-left:3px;text-align:left;border-bottom:1px solid black;border-right:1px solid black;">Name
												<br/>
												<span style="width:77mm"/>
											</td>
											<td style="height:8mm;width:48mm;padding-left:3px;text-align:left;font-weight:normal;border-bottom:1px solid black;border-right:1px solid black;">Identifying number (if known)
												<br/>
												<span style="width:47mm"/>
											</td>
											<td style="height:8mm;width:55mm;padding-left:3px;text-align:left;border-bottom:1px solid black;" colspan="2">Fees paid
												<br/>
												  $ <span style="width:47mm"/>
											</td>
										</tr>
										<!-- Line 6 Row 2 street address -->
										<tr>
											<td style="height:12mm;width:84mm;border-bottom:1px solid black;border-right:1px solid black;vertical-align:top;padding-top:1mm;" colspan="2"><span style="width:7mm;"/>Number, street, and room or suite no.
												<br/>
												<span style="width:83mm"/>
											</td>
													<td style="height:12mm;width:48mm;padding-left:3px;border-bottom:1px solid black;border-right:1px solid black;padding-bottom:3.5mm;">City or town<br/>
														<span style="width:47mm"/>
													</td>
													<td style="height:12mm;width:37mm;padding-left:3px;border-bottom:1px solid black;border-right:1px solid black;padding-bottom:3.5mm;">State<br/>
														<span style="width:36mm"/>
													</td>
													<td style="height:12mm;width:18mm;padding-left:3px;border-bottom:1px solid black;padding-bottom:3.5mm;">Zip code<br/>
														<span style="width:17mm"/>
													</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="0"/>
						<xsl:with-param name="containerID" select="'line6Tctn'"/>
					</xsl:call-template>
					<!--end of page -->
					<div style="width:187mm; font-size:7pt; border-top:1px solid black;">
						<div style="font-weight:bold; float:left; padding-top:0.5mm">For Paperwork Reduction Act Notice, see separate instructions.</div>
						<div style="float:right">
							<span style="margin-right:45mm">Cat. No. 34654G</span>          
						  Form <b style="font-size:9pt">8886</b> (Rev. 12-2019)
						</div>
					</div>
					<div class="pageEnd" />
					<!-- begin page 2 -->
					<div style="width:187mm; font-size:7pt; border-bottom:1px solid black">
						<span style="float:left">Form 8886 (Rev. 12-2019)</span>
						<span style="float:right">Page <b style="font-size:9pt">2</b>
						</span>
					</div>
					<!-- line 7 -->
					<div style="width:187mm; border-top:0px solid black; padding-top:1mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBox" style="width:6mm;">7</div>
						<div style="float:left;padding-top:0.5mm;font-weight:bold;padding-left:2mm;width:10mm">Facts</div>
					</div>
					<div style="width:187mm; padding-top:1mm">
						<!-- line 7a -->
						<div class="styLNLeftLtrBox" style="padding-top:0.5mm;text-align:left;">a</div>
						<div style="float:left;width:179mm;height:4mm;padding-top:0.5mm;">Identify the type of tax benefit generated by the transaction. Check all the boxes that apply (see instructions).
           </div>
					</div>
					<!-- line 7 checkboxes -->
					<div style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:179mm;height:4.5mm;">
							<div class="styGenericDiv" style="width:33mm;">
								<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/DeductionsInd"/>
										<xsl:with-param name="BackupName">IRS8886Deductions</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/DeductionsInd"/>
										<xsl:with-param name="BackupName">IRS8886Deductions</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/> Deductions
            <span style="width: 5mm;"/>
								</label>
							</div>
							<div class="styGenericDiv" style="width:61mm;">
								<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/ExclusionsFromGrossIncomeInd"/>
										<xsl:with-param name="BackupName">IRS8886ExclusionsFromGrossIncome</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/ExclusionsFromGrossIncomeInd"/>
										<xsl:with-param name="BackupName">IRS8886ExclusionsFromGrossIncome</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/>Exclusions from gross income
            <span style="width: 5mm;"/>
								</label>
							</div>
							<div class="styGenericDiv" style="width:56mm;">
								<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/AbsenceOfAdjustmentsToBasisInd"/>
										<xsl:with-param name="BackupName">IRS8886AbsenceOfAdjustmentsToBasis</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/AbsenceOfAdjustmentsToBasisInd"/>
										<xsl:with-param name="BackupName">IRS8886AbsenceOfAdjustmentsToBasis</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/>
									<span style="font-size:9pt;">Absence of adjustments to basis</span>
								</label>
							</div>
							<div class="styGenericDiv" style="width:25mm;">
								<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/TaxCreditsInd"/>
										<xsl:with-param name="BackupName">IRS8886TaxCredits</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/TaxCreditsInd"/>
										<xsl:with-param name="BackupName">IRS8886TaxCredits</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/>
									<span style="font-size:9pt;">Tax credits</span>
								</label>
							</div>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:179mm;height:4.5mm;">
							<div class="styGenericDiv" style="width:33mm;">
								<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/CapitalLossInd"/>
										<xsl:with-param name="BackupName">IRS8886CapitalLoss</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/CapitalLossInd"/>
										<xsl:with-param name="BackupName">IRS8886CapitalLoss</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/>Capital loss  
	            <span style="width: 5mm;"/>
								</label>
							</div>
							<div class="styGenericDiv" style="width:61mm;">
								<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/NonrecognitionOfGainInd"/>
										<xsl:with-param name="BackupName">IRS8886NonrecognitionOfGain</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/NonrecognitionOfGainInd"/>
										<xsl:with-param name="BackupName">IRS8886NonrecognitionOfGain</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/> Nonrecognition of gain
            <span style="width: 5mm;"/>
								</label>
							</div>
							<div class="styGenericDiv" style="width:46mm;">
								<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/DeferralInd"/>
										<xsl:with-param name="BackupName">IRS8886Deferral</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/DeferralInd"/>
										<xsl:with-param name="BackupName">IRS8886Deferral</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/> Deferral
          </label>
							</div>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:6mm;"/>
						<div class="styLNDesc" style="width:179mm;height:6mm;">
							<div class="styGenericDiv" style="height:6mm;width:33mm;">
								<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/OrdinaryLossInd"/>
										<xsl:with-param name="BackupName">IRS8886OrdinaryLoss</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/OrdinaryLossInd"/>
										<xsl:with-param name="BackupName">IRS8886OrdinaryLoss</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/>Ordinary loss 
          </label>
							</div>
							<div class="styGenericDiv" style="height:6mm;width:61mm;">
								<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/AdjustmentsToBasisInd"/>
										<xsl:with-param name="BackupName">IRS8886AdjustmentsToBasis</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/AdjustmentsToBasisInd"/>
										<xsl:with-param name="BackupName">IRS8886AdjustmentsToBasis</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/> Adjustments to basis
            <span style="width: 5mm;"/>
								</label>
							</div>
							<div class="styGenericDiv" style="height:6mm;width:70mm;">
								<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/OtherInd"/>
										<xsl:with-param name="BackupName">IRS8886Other</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/OtherInd"/>
										<xsl:with-param name="BackupName">IRS8886Other</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/>Other
								</label>
								<span style="border-bottom:1px solid black; text-align:left; width:50mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8886Data/OtherInd/@otherTaxBenefitDesc"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!-- line 7b -->
					<div style="height:auto;width:187mm; padding-top:1mm">
						<div class="styLNLeftLtrBox" style="padding-top:0.5mm;text-align:left;">b</div>
						<div style="float:left;width:179mm;height:5mm;padding-top:0.5mm;">
							Enter the total dollar amount of your tax benefits identified in 7a. (See Instructions.)
						    <span style="float:right;">$
								<span style="width:40mm;border-bottom:1px solid black;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8886Data/TotalTaxBenefitAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
					</div>
					<!-- line 7c -->
					<div style="height:10mm;width:187mm; padding-top:1mm">
						<div class="styLNLeftLtrBox" style="padding-top:0.5mm;text-align:left;">c</div>
						<div style="float:left;width:179mm;height:5mm;padding-top:0.5mm;">
							Enter the anticipated number of years the transaction provides the tax benefits stated <br/>in 7b. (See Instructions.) 
						    <span style="float:right;">$
								<span style="width:40mm;border-bottom:1px solid black;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8886Data/ClmTotTaxBnftAnticipatedYrCnt"/>
									</xsl:call-template>
								</span> 
							</span>
						</div>
					</div>
					<!-- line 7d -->
					<div style="height:auto;width:187mm; padding-top:1mm">
						<div class="styLNLeftLtrBox" style="padding-top:0.5mm;text-align:left;">d</div>
						<div style="float:left;width:179mm;height:5mm;padding-top:0.5mm;">
							 Enter your total investment or basis in the transaction. (See Instructions.)    
						    <span style="float:right;">$
							<span style="width:40mm;border-bottom:1px solid black;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8886Data/TotalInvestmentOrBasisAmt"/>
								</xsl:call-template>
							</span> 
							</span>
						</div>
					</div>
					<!-- line 7e -->
					<div style="height:auto;width:187mm; padding-top:1mm">
						<div class="styLNLeftLtrBox" style="padding-top:0.5mm;text-align:left;">e</div>
						<div style="float:left;width:179mm;height:20mm;padding-top:0.5mm;">Further describe the amount and nature of the expected tax treatment and expected tax benefits generated by the transaction for all affected years.  Include facts of each step of the transaction that relate to the expected tax benefits including the amount and nature of your investment. Include in your description your participation in the transaction and all related transactions regardless of the year in which they were entered into. Also, include a description of any tax result protection with respect to the transaction.  
              <!-- Push Pin image -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8886Data/ExpectedTaxBenefitsExplnTxt"/>
							</xsl:call-template>
						</div><br/>
						<div style="height:auto;width:187mm;border-bottom:1px solid black;padding-top:1mm;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8886Data/ExpectedTaxBenefitsExplnTxt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div style="height:17mm;width:187mm; border-top:0mm;border-style:solid black; padding-top:1mm;">
						<div class="styLNLeftNumBox" style="width:6mm; ">8</div>
						<div style="float:left; padding-top:0.5mm;">Identify all individuals and entities involved in the transaction that are tax-exempt, foreign, or related.  Check the</div>
						<div style="float:left; width:179mm;padding-left:6mm">appropriate box(es) (see instructions). Include their name(s), identifying number(s), address(es), and a brief </div>
						<div style="float:left; width:179mm;padding-left:6mm">description of their involvement. For each foreign entity, identify its country of incorporation or existence. For each </div>
						<div style="float:left; width:179mm;padding-left:6mm;"> individual or related entity, explain how the individual or entity is related.  Attach additional sheets, if necessary. </div>
						<!-- button display logic -->
					</div>
					<div style="width:186mm;text-align:right;">
						<span style="width:3.2mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr"/>
								<xsl:with-param name="containerHeight" select="10"/>
								<xsl:with-param name="headerHeight" select="0"/>
								<xsl:with-param name="containerID" select="'line8TPctn'"/>
							</xsl:call-template>
						</span>
					</div>
						<!--                  
        </div>  
      -->
					<!-- 
       <div class="styIRS8886TableContainer2" id="line8TPctn" style="float: none; clear:both; border-bottom-width: 0px; height:16mm">
       -->
					<div class="styTableContainerNBB" id="line8TPctn" style="height:auto;width:187mm;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<table cellspacing="0" cellpadding="0" style="height:auto;width:187mm;font-family:verdana;font-size:8pt; ">
							<thead/>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form8886Data/IdentifyAllInvolvedInTr) &lt;=2)">
									<xsl:for-each select="$Form8886Data/IdentifyAllInvolvedInTr">
										<tr >
											<td style="height:8mm;width:12mm;font-weight:bold;text-align:center;vertical-align:bottom;border-bottom:1px solid black;padding-bottom:0.5mm;">
												<xsl:number value="position()" format="a"/>
											</td>
											<td class="styLNDesc" style="height:8mm;width:140mm;vertical-align:bottom;padding-top:3mm;border-bottom:1px solid black;">Type of individual or entity:
												<span style="width: 5mm;"/>
												<!-- line 8 checkboxes -->
												<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
													<xsl:call-template name="PopulateCheckbox">
													  <xsl:with-param name="TargetNode" select="TaxExemptInd"/>
														<xsl:with-param name="BackupName">IRS8886TaxExempt<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="font-size:8pt; padding-right:2mm;">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="TaxExemptInd"/>
														<xsl:with-param name="BackupName">IRS8886TaxExempt<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
													Tax-exempt
												 <span style="width: 5mm;"/>
												</label>
												<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="ForeignInd"/>
														<xsl:with-param name="BackupName">IRS8886Foreign<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="font-size:8pt; padding-right:2mm;">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="ForeignInd"/>
														<xsl:with-param name="BackupName">IRS8886Foreign<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
													Foreign
													<span style="width: 5mm;"/>
												</label>
												<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="RelatedInd"/>
														<xsl:with-param name="BackupName">IRS8886Related<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="font-size:8pt; padding-right:2mm;">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="RelatedInd"/>
														<xsl:with-param name="BackupName">IRS8886Related<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
													Related
													<span style="width: 5mm;"/>
												</label>
											</td>
											<td style="height:8mm;width:35mm;vertical-align:bottom;border-bottom:1px solid black;">
											</td>
										</tr>
										<tr>
											<td style="height:8mm;width:12mm;vertical-align:top;border-bottom:1px solid black;">
												Name
											</td>
											<td style="height:8mm;width:140mm;vertical-align:top;border-bottom:1px solid black;">
												<xsl:if test="$Form8886Data/IdentifyAllInvolvedInTr/PersonNm!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</xsl:if>
												<xsl:if test="$Form8886Data/IdentifyAllInvolvedInTr/BusinessName/BusinessNameLine1Txt!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</xsl:if>
												<span style="width:4px;"/>
												<xsl:if test="normalize-space(BusinessName/BusinessNameLine2Txt)!=''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td style="height:8mm;width:35mm;border-bottom:1px solid black;border-left:1px solid black;">
												Identifying number<br/>
												<span valign="bottom" style="padding-top:2mm;padding-left:2px;">
													<xsl:choose>
														<xsl:when test="normalize-space(SSN)">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="SSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="normalize-space(EIN)">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</td>
										</tr>
										<tr><td style="height:8mm;width:12mm;vertical-align:top;border-bottom:1px solid black;">
												Address
											</td>
											<td style="height:8mm;width:175mm;vertical-align:top;border-bottom:1px solid black;" colspan="2">
												<xsl:choose>
													<!-- US Address -->
													<xsl:when test="USAddress">
														<xsl:if test="USAddress/AddressLine1Txt!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
															</xsl:call-template>,            
														    <span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="USAddress/AddressLine2Txt!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
															</xsl:call-template>,            
														    <span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="USAddress/CityNm!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
															</xsl:call-template>,              
															<span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="USAddress/StateAbbreviationCd!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<span style="width:4px;"/>
														<xsl:if test="USAddress/ZIPCd!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
													</xsl:when>
													<!-- Foreign Address -->
													<xsl:otherwise>
														<xsl:if test="ForeignAddress/AddressLine1Txt!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="ForeignAddress/AddressLine2Txt!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
															</xsl:call-template>,            
														    <span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="ForeignAddress/CityNm!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
															</xsl:call-template>,              
															<span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="ForeignAddress/ProvinceOrStateNm!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<!-- foreign postal code -->
														<xsl:if test="ForeignAddress/ForeignPostalCd!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<!-- foreign country -->
														<xsl:if test="ForeignAddress/CountryCd!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<tr>
											<td style="height:4mm;width:187mm;vertical-align:top;" colspan="3">
												Description
											</td>
										</tr>
										<tr>
											<td style="height:auto;width:187mm;vertical-align:top;border-bottom:1px solid black;" colspan="3" wrap="wrap;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="InvolvementDesc"/>
												</xsl:call-template>
											</td>
										</tr>

									</xsl:for-each>
								</xsl:if>
								<!-- table filler rows if I have no data (all elements are optional) or so many data that get pushed to a separated table at the end-->
								<xsl:if test="count($Form8886Data/IdentifyAllInvolvedInTr) &lt; 1 or ((count($Form8886Data/IdentifyAllInvolvedInTr) &gt;2) and ($Print = $Separated))">
									<tr >
											<td style="height:8mm;width:12mm;font-weight:bold;text-align:center;vertical-align:bottom;border-bottom:1px solid black;padding-bottom:0.5mm;">
												a
											</td>
											<td class="styLNDesc" style="height:8mm;width:140mm;vertical-align:bottom;padding-top:3mm;border-bottom:1px solid black;">Type of individual or entity:
												<span style="width: 5mm;"/>
												<!-- line 8 checkboxes -->
												<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
													<xsl:call-template name="PopulateCheckbox">
													  <xsl:with-param name="TargetNode" select="TaxExemptInd"/>
														<xsl:with-param name="BackupName">IRS8886TaxExempt<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="font-size:8pt; padding-right:2mm;">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="TaxExemptInd"/>
														<xsl:with-param name="BackupName">IRS8886TaxExempt<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
													Tax-exempt
												 <span style="width: 5mm;"/>
												</label>
												<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="ForeignInd"/>
														<xsl:with-param name="BackupName">IRS8886Foreign<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="font-size:8pt; padding-right:2mm;">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="ForeignInd"/>
														<xsl:with-param name="BackupName">IRS8886Foreign<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
													Foreign
													<span style="width: 5mm;"/>
												</label>
												<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="RelatedInd"/>
														<xsl:with-param name="BackupName">IRS8886Related<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="font-size:8pt; padding-right:2mm;">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="RelatedInd"/>
														<xsl:with-param name="BackupName">IRS8886Related<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
													Related
													<span style="width: 5mm;"/>
												</label>
											</td>
											<td style="height:8mm;width:35mm;vertical-align:bottom;border-bottom:1px solid black;">
											</td>
										</tr>
										<tr>
											<td style="height:8mm;width:12mm;vertical-align:top;border-bottom:1px solid black;">
												Name
											</td>
											<td style="height:8mm;width:140mm;vertical-align:top;border-bottom:1px solid black;">
												<xsl:if test="$Form8886Data/IdentifyAllInvolvedInTr/PersonNm!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</xsl:if>
												<xsl:if test="$Form8886Data/IdentifyAllInvolvedInTr/BusinessName/BusinessNameLine1Txt!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</xsl:if>
												<span style="width:4px;"/>
												<xsl:if test="normalize-space(BusinessName/BusinessNameLine2Txt)!=''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td style="height:8mm;width:35mm;border-bottom:1px solid black;border-left:1px solid black;">
												Identifying number<br/>
												<span valign="bottom" style="padding-top:2mm;padding-left:2px;">
													<xsl:choose>
														<xsl:when test="normalize-space(SSN)">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="SSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="normalize-space(EIN)">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</td>
										</tr>
										<tr><td style="height:8mm;width:12mm;vertical-align:top;border-bottom:1px solid black;">
												Address
											</td>
											<td style="height:8mm;width:175mm;vertical-align:top;border-bottom:1px solid black;" colspan="2">
												<xsl:choose>
													<!-- US Address -->
													<xsl:when test="USAddress">
														<xsl:if test="USAddress/AddressLine1Txt!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
															</xsl:call-template>,            
														    <span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="USAddress/AddressLine2Txt!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
															</xsl:call-template>,            
														    <span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="USAddress/CityNm!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
															</xsl:call-template>,              
															<span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="USAddress/StateAbbreviationCd!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<span style="width:4px;"/>
														<xsl:if test="USAddress/ZIPCd!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
													</xsl:when>
													<!-- Foreign Address -->
													<xsl:otherwise>
														<xsl:if test="ForeignAddress/AddressLine1Txt!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="ForeignAddress/AddressLine2Txt!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
															</xsl:call-template>,            
														    <span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="ForeignAddress/CityNm!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
															</xsl:call-template>,              
															<span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="ForeignAddress/ProvinceOrStateNm!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<!-- foreign postal code -->
														<xsl:if test="ForeignAddress/ForeignPostalCd!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<!-- foreign country -->
														<xsl:if test="ForeignAddress/CountryCd!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<tr>
											<td style="height:4mm;width:187mm;vertical-align:top;" colspan="3">
												Description
											</td>
										</tr>
										<tr>
											<td style="height:auto;width:187mm;vertical-align:top;border-bottom:1px solid black;" colspan="3" wrap="wrap;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="InvolvementDesc"/>
												</xsl:call-template>
											</td>
										</tr>
								</xsl:if>
								<xsl:if test="count($Form8886Data/IdentifyAllInvolvedInTr) &lt; 2 or ((count($Form8886Data/IdentifyAllInvolvedInTr) &gt;3) and ($Print = $Separated))">
									<tr >
											<td style="height:8mm;width:12mm;font-weight:bold;text-align:center;vertical-align:bottom;border-bottom:1px solid black;padding-bottom:0.5mm;">
												b
											</td>
											<td class="styLNDesc" style="height:8mm;width:140mm;vertical-align:bottom;padding-top:3mm;border-bottom:1px solid black;">Type of individual or entity:
												<span style="width: 5mm;"/>
												<!-- line 8 checkboxes -->
												<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
													<xsl:call-template name="PopulateCheckbox">
													  <xsl:with-param name="TargetNode" select="TaxExemptInd"/>
														<xsl:with-param name="BackupName">IRS8886TaxExempt<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="font-size:8pt; padding-right:2mm;">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="TaxExemptInd"/>
														<xsl:with-param name="BackupName">IRS8886TaxExempt<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
													Tax-exempt
												 <span style="width: 5mm;"/>
												</label>
												<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="ForeignInd"/>
														<xsl:with-param name="BackupName">IRS8886Foreign<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="font-size:8pt; padding-right:2mm;">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="ForeignInd"/>
														<xsl:with-param name="BackupName">IRS8886Foreign<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
													Foreign
													<span style="width: 5mm;"/>
												</label>
												<input type="checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="RelatedInd"/>
														<xsl:with-param name="BackupName">IRS8886Related<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="font-size:8pt; padding-right:2mm;">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="RelatedInd"/>
														<xsl:with-param name="BackupName">IRS8886Related<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
													Related
													<span style="width: 5mm;"/>
												</label>
											</td>
											<td style="height:8mm;width:35mm;vertical-align:bottom;border-bottom:1px solid black;">
											</td>
										</tr>
										<tr>
											<td style="height:8mm;width:12mm;vertical-align:top;border-bottom:1px solid black;">
												Name
											</td>
											<td style="height:8mm;width:140mm;vertical-align:top;border-bottom:1px solid black;">
												<xsl:if test="$Form8886Data/IdentifyAllInvolvedInTr/PersonNm!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</xsl:if>
												<xsl:if test="$Form8886Data/IdentifyAllInvolvedInTr/BusinessName/BusinessNameLine1Txt!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</xsl:if>
												<span style="width:4px;"/>
												<xsl:if test="normalize-space(BusinessName/BusinessNameLine2Txt)!=''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td style="height:8mm;width:35mm;border-bottom:1px solid black;border-left:1px solid black;">
												Identifying number<br/>
												<span valign="bottom" style="padding-top:2mm;padding-left:2px;">
													<xsl:choose>
														<xsl:when test="normalize-space(SSN)">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="SSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="normalize-space(EIN)">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</td>
										</tr>
										<tr><td style="height:8mm;width:12mm;vertical-align:top;border-bottom:1px solid black;">
												Address
											</td>
											<td style="height:8mm;width:175mm;vertical-align:top;border-bottom:1px solid black;" colspan="2">
												<xsl:choose>
													<!-- US Address -->
													<xsl:when test="USAddress">
														<xsl:if test="USAddress/AddressLine1Txt!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
															</xsl:call-template>,            
														    <span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="USAddress/AddressLine2Txt!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
															</xsl:call-template>,            
														    <span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="USAddress/CityNm!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
															</xsl:call-template>,              
															<span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="USAddress/StateAbbreviationCd!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<span style="width:4px;"/>
														<xsl:if test="USAddress/ZIPCd!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
													</xsl:when>
													<!-- Foreign Address -->
													<xsl:otherwise>
														<xsl:if test="ForeignAddress/AddressLine1Txt!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="ForeignAddress/AddressLine2Txt!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
															</xsl:call-template>,            
														    <span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="ForeignAddress/CityNm!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
															</xsl:call-template>,              
															<span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="ForeignAddress/ProvinceOrStateNm!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<!-- foreign postal code -->
														<xsl:if test="ForeignAddress/ForeignPostalCd!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<!-- foreign country -->
														<xsl:if test="ForeignAddress/CountryCd!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<tr>
											<td style="height:4mm;width:187mm;vertical-align:top;" colspan="3">
												Description
											</td>
										</tr>
										<tr>
											<td style="height:auto;width:187mm;vertical-align:top;border-bottom:1px solid black;" colspan="3" wrap="wrap;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="InvolvementDesc"/>
												</xsl:call-template>
											</td>
										</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- set initial height of the above table which equals the number of repetitions of repeating data -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr"/>
						<xsl:with-param name="containerHeight" select="10"/>
						<xsl:with-param name="headerHeight" select="0"/>
						<xsl:with-param name="containerID" select="'line8TPctn'"/>
					</xsl:call-template>
					<!-- page end -->
					<div style="width:187mm; font-size:7pt; border-top:2 solid black; margin-top:1mm">
						<div style="float:right">            
          Form <b style="font-size:9pt">8886</b> (Rev. 12-2019)
        </div>
					</div>
					<p style="page-break-before:always"/>
					<div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
						<div class="styLeftOverTitle" style="padding-bottom:0.5mm; padding-top:0.5mm">
          Additional Data        
        </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();" tabindex="1"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8886Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 8886, Line 1a - Book tax difference Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8886Data/ReportableTransactionInfo/ReportableTransactionDesc/@bookTaxDifferenceIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Separated Repeating Data for Line 1a, 1b. 1c -->
					<xsl:if test="($Print = $Separated) and (count($Form8886Data/ReportableTransactionInfo) &gt;1)">
						<span class="styRepeatingDataTitle">Form 8886 Lines 1a, 1b and 1c - Reportable Transaction Information:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width: 86mm; text-align: left; height:8mm; padding-top: 2.5mm;">
										<b>1a Name of reportable transaction</b>
									</th>
									<th class="styDepTblCell" scope="col" style="width: 50mm; text-align: left; height:8mm; padding-top: 2.5mm;">
										<b>1b Initial year participated in transaction</b>
									</th>
									<th class="styDepTblCell" scope="col" style="width: 50mm; text-align: left; height:8mm; padding-top: 2.5mm;">
										<b>1c Reportable transaction or tax shelter registration number (see instructions)</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8886Data/ReportableTransactionInfo">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td style="padding-left:6mm; width:86mm; border-style: solid; border-color: black; border-top-width: 0px; border-left-width:  0px; border-right-width: 1px; border-bottom-width:1px; padding-top:0mm; height:8mm; text-align: left">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ReportableTransactionDesc"/>
											</xsl:call-template>
										</td>
										<td style="text-align:center; width:50mm; height:8mm; padding-top:2mm; border-bottom:1px solid black">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InitialParticipatedYr"/>
											</xsl:call-template>
										</td>
										<td style="text-align:center; width:50mm; height:8mm; padding-top:2mm; border-bottom:1px solid black;border-left:1px solid black;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransactionOrTaxShelterNum"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!--  Separated Repeating Data for Line 5 -->
					<xsl:if test="($Print = $Separated) and (count($Form8886Data/TypeOfEntityInformation) &gt; 2)">
						<span class="styRepeatingDataTitle">Form 8886 Line 5 - Participation in the transaction through another entity: </span>
						<table class="styDepTbl" style="font-size:7pt;width:185mm;">
							<thead/>
							<tfoot/>
							<tbody>
									<xsl:call-template name="Line5RowGenerator">
										<xsl:with-param name="pos" select="1"/>
										<xsl:with-param name="setCount" select="1"/>
									</xsl:call-template>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- Separated Repeating Data for Line 6 -->
					<xsl:if test="($Print = $Separated) and (count($Form8886Data/PersonsYouPaidAFeeInfo) &gt; 2)">
						<span class="styRepeatingDataTitle">Form 8886 Line 6 - Name and address of each person to whom you paid a fee: </span>
						<table class="styDepTbl" style="font-size:7pt;width:187mm;">
							<thead class="styTableThead"/>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8886Data/PersonsYouPaidAFeeInfo">
									<tr style="width:183mm;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										
											<td style="height:10mm;width:8.5mm;font-weight:bold;padding-left:2mm;padding-top:1.5mm;border-bottom:1px solid black;" valign="top">
												<xsl:number value="position()" format="a"/>
											</td>
											<td style="width:89mm;padding-left:3px;text-align:left;border-bottom:1px solid black;border-right:1px solid black;">Name
                        <br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td style="width:48mm;padding-left:3px;text-align:left;font-weight:normal;border-bottom:1px solid black;border-right:1px solid black;">Identifying number (if known)
                            <br/>
												<xsl:choose>
													<xsl:when test="SSN">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SSN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="EIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<span class="styTableCellPad"/>
											</td>
											<td style="width:40mm;padding-left:3px;text-align:left;border-bottom:1px solid black;" colspan="2">Fees paid
                            <br/>
                              $ <span style="width:4mm;"/>
												<span style="text-align:right;width:32mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="FeesPaidAmt"/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
										<!-- Line 6 Row 2 street address -->
										<tr style="width;183mm;">
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td style="width:95mm;padding-left:9mm;text-align:left;border-bottom:1px solid black;border-right:1px solid black;" colspan="2">Number, street, and room or suite no.
                        <br/>
												<!-- A Choice of US or Foreign Street Address-->
												<xsl:choose>
													<!-- US Street Address -->
													<xsl:when test="USAddress">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:when>
													<xsl:otherwise>
														<!-- Foreign Street Address -->
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<!-- A choice of US or Foreign -->
											<xsl:choose>
												<!-- US -->
												<xsl:when test="USAddress">
													<td style="width:48mm;padding-left:3px;text-align:left;border-bottom:1px solid black;border-right:1px solid black;padding-bottom:3.5mm;">City or town<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress//CityNm"/>
														</xsl:call-template>,
													</td>
													<td style="width:20mm;padding-left:3px;text-align:left;border-bottom:1px solid black;border-right:1px solid black;padding-bottom:3.5mm;">State<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress//StateAbbreviationCd"/>
														</xsl:call-template><span style="width:1px;"/>
													</td>
													<td style="width:20mm;padding-left:3px;text-align:left;border-bottom:1px solid black;padding-bottom:3.5mm;">Zip code<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress//ZIPCd"/>
														</xsl:call-template>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<!-- Foreign Street Address -->
													<td style="width:48mm;padding-left:3px;text-align:left;float:right;border-bottom:1px solid black;border-right:1px solid black;padding-bottom:3.5mm;">City or town<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
														</xsl:call-template>,
													</td>
													<td style="width:20mm;padding-left:3px;text-align:left;border-bottom:1px solid black;border-right:1px solid black;padding-bottom:3.5mm;">State<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
														</xsl:call-template>
													</td>
													<td style="width:20mm;padding-left:3px;text-align:left;border-bottom:1px solid black;padding-bottom:3.5mm;">Zip code<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
														</xsl:call-template>
														<span style="width:1mm;"/>
														<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
														</xsl:call-template>
													</td>
												</xsl:otherwise>
											</xsl:choose>
										</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- End Separated Repeating Data for Line 6 -->
					<!-- Begin Separated Repeating Data for line 8 -->
					<xsl:if test="($Print = $Separated) and (count($Form8886Data/IdentifyAllInvolvedInTr) &gt; 1)">
						<span class="styRepeatingDataTitle">Form 8886 Line 8 - All tax-exempt, foreign, and related entities and individuals involved in the transaction.:</span>
						<table cellspacing="0" cellpadding="0" style="font-size:7pt;width:185mm;border-top:3px; border-style: ridge; border-color: darkblue;">
							<tbody>
								<xsl:for-each select="$Form8886Data/IdentifyAllInvolvedInTr">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td style="float:none;clear:none;">
											<div class="styGenericDiv" style="width:100%;font-weight:bold;padding-left:2mm;text-align:left;" valign="bottom">
												<xsl:number value="position()" format="a"/>
												<span style="padding-left:2.5mm;font-weight:normal;vertical-align:bottom;padding-bottom:0px;padding-top:1mm" valign="bottom">Type of individual or entity:   			 </span>
												<span style="width:5mm;"/>
												<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="TaxExemptInd"/>
														<xsl:with-param name="BackupName">IRS8886TaxExempt<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:4px"/>
												<label style="padding-right:2mm;font-weight:normal">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="TaxExemptInd"/>
														<xsl:with-param name="BackupName">IRS8886TaxExempt<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
													Tax-exempt
													 <span style="width: 5mm;"/>
												</label>
												<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="ForeignInd"/>
														<xsl:with-param name="BackupName">IRS8886Foreign<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="padding-right:2mm;font-weight:normal">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="ForeignInd"/>
														<xsl:with-param name="BackupName">IRS8886Foreign<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
           Foreign
            <span style="width: 5mm;"/>
												</label>
												<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="RelatedInd"/>
														<xsl:with-param name="BackupName">IRS8886Related<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="padding-right:2mm;font-weight:normal">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="RelatedInd"/>
														<xsl:with-param name="BackupName">IRS8886Related<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
           Related
            <span style="width: 5mm;"/>
												</label>
											</div>
											<div class="styGenericDiv" style="width:187mm;font-weight:normal;"/>
											<div class="styBB" style="width:187mm;padding-left:2mm;text-align:left;vertical-align:bottom;">
											   <div style="width:152mm;padding-left:0px;font-weight:normal;text-align:left;vertical-align:bottom;display:inline;">
												   Name<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</div>
													<div style="width:35mm;vertical-align:top;border-color:black;border-left-width:1px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;padding-left:2px;display:inline;float:right;">
														Identifying number<br/>
														<xsl:choose>
															<xsl:when test="normalize-space(SSN)">
																<xsl:call-template name="PopulateSSN">
																	<xsl:with-param name="TargetNode" select="SSN"/>
																</xsl:call-template>
																<span style="width: 2px"/>
															</xsl:when>
															<xsl:when test="normalize-space(EIN)">
																<xsl:call-template name="PopulateEIN">
																	<xsl:with-param name="TargetNode" select="EIN"/>
																</xsl:call-template>
																<span style="width: 2px"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
																</xsl:call-template>
																<span style="width: 2px"/>
															</xsl:otherwise>
														</xsl:choose>
													</div>
											</div>
											<div class="styBB" style="width:100%;padding-left:2mm;text-align:left;padding-top:2mm;vertical-align:bottom;padding-bottom:0px;vertical-align:bottom;" valign="bottom">Address
   <span style="padding-left:2.5mm;font-weight:normal;text-align:left;">
													<xsl:choose>
														<xsl:when test="USAddress">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
															</xsl:call-template>,            
       <span class="styTableCellPad"/>
															<xsl:if test="USAddress/AddressLine2Txt!=''">
																<span style="width:4px;"/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
																</xsl:call-template>,            
              <span class="styTableCellPad"/>
															</xsl:if>
															<xsl:if test="USAddress/CityNm!=''">
																<span style="width:4px;"/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
																</xsl:call-template>,              
                <span class="styTableCellPad"/>
															</xsl:if>
															<xsl:if test="USAddress/StateAbbreviationCd!=''">
																<span style="width:4px;"/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
																</xsl:call-template>
																<span class="styTableCellPad"/>
															</xsl:if>
															<span style="width:4px;"/>
															<xsl:if test="USAddress/ZIPCd!=''">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
																</xsl:call-template>
																<span class="styTableCellPad"/>
															</xsl:if>
														</xsl:when>
														<xsl:otherwise>
															<xsl:if test="ForeignAddress/AddressLine1Txt!=''">
																<br/>
																<span style="width:4px;"/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
																</xsl:call-template>,            
              <span class="styTableCellPad"/>
															</xsl:if>
															<xsl:if test="ForeignAddress/AddressLine2Txt!=''">
																<br/>
																<span style="width:4px;"/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
																</xsl:call-template>,            
              <span class="styTableCellPad"/>
															</xsl:if>
															<xsl:if test="ForeignAddress/CityNm!=''">
																<br/>
																<span style="width:4px;"/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
																</xsl:call-template>,              
                <span class="styTableCellPad"/>
															</xsl:if>
															<xsl:if test="ForeignAddress/ProvinceOrStateNm!=''">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
																</xsl:call-template>
																<span class="styTableCellPad"/>
															</xsl:if>
															<xsl:if test="ForeignAddress/ForeignPostalCd!=''">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
																</xsl:call-template>
																<span class="styTableCellPad"/>
															</xsl:if>
															<xsl:if test="ForeignAddress/CountryCd!=''">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
																</xsl:call-template>
																<span class="styTableCellPad"/>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
											<div class="styGenericDiv" style="width:185mm;font-weight:normal;"/>
											<div class="styBB" style="width:100%;padding-left:2mm;text-align:left;vertical-align:bottom">Description
   <span style="padding-left:2.5mm;font-weight:normal;text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="InvolvementDesc"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- End separated repeating data for line 8 -->
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="line6Template">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:choose>
			<xsl:when test="($Print != $Separated) or (count($Form8886Data/PersonsYouPaidAFeeInfo) &lt;=5)">
				<xsl:if test="$index &lt;= $max">
					<tr>
						<td class="styIRS8886TblRB" style="width:55mm" rowspan="2">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/PersonNm"/>
							</xsl:call-template>
						</td>
						<td class="styIRS8886TblRB" style="height:8mm; border-right:0; border-bottom:0 solid black; padding-left:2mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/USAddress/AddressLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="normalize-space($Form8886Data/PersonsYouPaidAFeeInfo[$index]/USAddress/AddressLine2Txt)!=''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/USAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="styIRS8886TblRB" style="border-right:0; height:8mm; padding-left:2mm">
							<xsl:if test="$Form8886Data/PersonsPromotedYourPrtcpt[$index]/USAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/USAddress/CityNm"/>
								</xsl:call-template>,
		          <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/USAddress/StateAbbreviationCd"/>
								</xsl:call-template><span style="width:1px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/USAddress/ZIPCd"/>
								</xsl:call-template>
							</xsl:if><span style="width:1px;"/>
		        <!-- foreign address -->
							<xsl:if test="$Form8886Data/PersonsPromotedYourPrtcpt[$index]/ForeignAddress">
								<td class="styIRS8886TblRB" style="height:8mm; border-right:0; border-bottom:0 solid black; padding-left:2mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/ForeignAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="normalize-space($Form8886Data/PersonsYouPaidAFeeInfo[$index]/USAddress/AddressLine2Txt)!=''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/ForeignAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</td>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/ForeignAddress/CityNm"/>
								</xsl:call-template>,
		      <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/ForeignAddress/ProvinceOrStateNm"/>
								</xsl:call-template><span style="width:1px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/ForeignAddress/ForeignPostalCd"/>
								</xsl:call-template><span style="width:1px;"/>
		      <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/ForeignAddress/CountryCd"/>
								</xsl:call-template>
							</xsl:if><span style="width:1px;"/>
				 </td>
					</tr>
					<xsl:call-template name="line6Template">
						<xsl:with-param name="index" select="$index + 1"/>
						<xsl:with-param name="max" select="$max"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<tr>
					<td class="styIRS8886TblRB" style="width:55mm" rowspan="2">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/PersonNm"/>
						</xsl:call-template>
					</td>
					<td class="styIRS8886TblRB" style="height:8mm; border-right:0; border-bottom:0 solid black; padding-left:2mm">
						<span style="width: 50mm"/>
						<br/>
						<span style="width: 50mm"/>
					</td>
				</tr>
				<tr>
					<td class="styIRS8886TblRB" style="border-right:0; height:8mm; padding-left:2mm">
						<span style="width: 50mm"/><span style="width:1px;"/>
		      </td>
				</tr>
				<tr>
					<td class="styIRS8886TblRB" style="width:55mm" rowspan="2">
						<span style="width: 50mm"/>
					</td>
					<td class="styIRS8886TblRB" style="height:8mm; border-right:0; border-bottom:0 solid black; padding-left:2mm">
						<span style="width: 50mm"/>
						<br/>
						<span style="width: 50mm"/>
					</td>
				</tr>
				<tr>
					<td class="styIRS8886TblRB" style="border-right:0; height:8mm; padding-left:2mm">
						<span style="width: 50mm"/><span style="width:1px;"/>
		      </td>
				</tr>
				<tr>
					<td class="styIRS8886TblRB" style="width:55mm" rowspan="2">
						<span style="width: 50mm"/>
					</td>
					<td class="styIRS8886TblRB" style="height:8mm; border-right:0; border-bottom:0 solid black; padding-left:2mm">
						<span style="width: 50mm"/>
						<br/>
						<span style="width: 50mm"/>
					</td>
				</tr>
				<tr>
					<td class="styIRS8886TblRB" style="border-right:0; height:8mm; padding-left:2mm">
						<span style="width: 50mm"/><span style="width:1px;"/>
		      </td>
				</tr>
				<tr>
					<td class="styIRS8886TblRB" style="width:55mm" rowspan="2">
						<span style="width: 50mm"/>
					</td>
					<td class="styIRS8886TblRB" style="height:8mm; border-right:0; border-bottom:0 solid black; padding-left:2mm">
						<span style="width: 50mm"/>
						<br/>
						<span style="width: 50mm"/>
					</td>
				</tr>
				<tr>
					<td class="styIRS8886TblRB" style="border-right:0; height:8mm; padding-left:2mm">
						<span style="width: 50mm"/><span style="width:1px;"/>
		      </td>
				</tr>
				<tr>
					<td class="styIRS8886TblRB" style="width:55mm" rowspan="2">
						<span style="width: 50mm"/>
					</td>
					<td class="styIRS8886TblRB" style="height:8mm; border-right:0; border-bottom:0 solid black; padding-left:2mm">
						<span style="width: 50mm"/>
						<br/>
						<span style="width: 50mm"/>
					</td>
				</tr>
				<tr>
					<td class="styIRS8886TblRB" style="border-right:0; height:8mm; padding-left:2mm">
						<span style="width: 50mm"/><span style="width:1px;"/>
		      </td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- line 5 -->
	<xsl:template name="Line5RowGenerator">
		<xsl:param name="pos"/>
		<xsl:param name="setCount"/>
		<tr >
			<xsl:if test="($Print = $Separated)">
				<!-- Define background colors to the rows -->
				<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="$setCount mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>
			<td class="styTableCell" style="height:4mm;font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;width:6mm;padding-top:0.5mm;border-bottom-width:0px;border-right-width:0px;" valign="top">a</td>
			<td class="styLNDesc" style="height:4mm;float:left;border-bottom-width:0px;border-left-width:0px;width:73mm" valign="top">Type of entity:
				<!-- dotted line -->
				<span class="styDotLn" style="float:none">...........</span>
				<span style="width:3px"/>
				<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/></td>
			<td class="styTableCell" style="height:4mm;border-right:1px solid black;text-align:left;border-bottom-width:0px;border-right-width:1px;padding-left:1mm;padding-right:1mm;width:54mm;">
				<!-- Partnership  checkbox column 1-->
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/PartnershipInd"/>
						<xsl:with-param name="BackupName">IRS8886Partnership<xsl:number value="$pos"/></xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/PartnershipInd"/>
						<xsl:with-param name="BackupName">IRS8886Partnership<xsl:number value="$pos"/></xsl:with-param>
					</xsl:call-template>
					<span style="text-align:right;font-weight:normal;">Partnership</span>
				</label>
				<span style="width:5mm;"/>
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/TrustInd"/>
						<xsl:with-param name="BackupName">IRS8886Trust<xsl:number value="$pos"/></xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/TrustInd"/>
						<xsl:with-param name="BackupName">IRS8886Trust<xsl:number value="$pos"/></xsl:with-param>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;">Trust</span>
				</label>
			</td>
			<!-- Partnership  checkbox right column-->
			<td class="styTableCell" style="height:4mm;text-align:left;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;padding-left:1mm;padding-right:1mm;width:54mm;">
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=($pos+1)]/PartnershipInd"/>
						<xsl:with-param name="BackupName">IRS8886Partnership<xsl:number value="$pos + 1"/></xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=($pos+1)]/PartnershipInd"/>
						<xsl:with-param name="BackupName">IRS8886Partnership<xsl:number value="$pos + 1"/></xsl:with-param>
					</xsl:call-template>
					<span style="text-align:right;font-weight:normal;;">Partnership</span>
				</label>
				<span style="width:5mm;"/>
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos+1]/TrustInd"/>
						<xsl:with-param name="BackupName">IRS8886Trust<xsl:number value="$pos + 1"/></xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos+1]/TrustInd"/>
						<xsl:with-param name="BackupName">IRS8886Trust<xsl:number value="$pos + 1"/></xsl:with-param>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;">Trust</span>
				</label>
			</td>
		</tr>
		<!--second row S corporation  checkbox column 1-->
		<tr >
			<xsl:if test="($Print = $Separated)">
				<!-- Define background colors to the rows -->
				<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="$setCount mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>
			<td class="styTableCell" style="padding-left:3mm;text-align:left;font-size:7pt;height:4mm;width:6mm;padding-top:0.5mm;border-right-width:0px;border-bottom-width:0px;" valign="top"/>
			<td class="styLNDesc" style="float:left;width:73mm;border-left-width:0px;" valign="top"/>
			<td class="styTableCell" style="border-right:1px solid black;text-align:left;border-bottom-width:1px;border-right-width:1px;padding-left:1mm;padding-right:1mm;height:4mm;width:54mm;">
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/SCorporationInd"/>
						<xsl:with-param name="BackupName">IRS8886SCorporation<xsl:number value="$pos"/></xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/SCorporationInd"/>
						<xsl:with-param name="BackupName">IRS8886SCorporation<xsl:number value="$pos"/></xsl:with-param>
					</xsl:call-template>
					<span style="text-align:left;font-weight:normal;padding-left:0px;">S corporation</span>
				</label>
				<span style="width:2.25mm;"/>
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/ForeignInd"/>
						<xsl:with-param name="BackupName">IRS8886Foreign<xsl:number value="$pos"/></xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label style="padding-top:2mm;">
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/ForeignInd"/>
						<xsl:with-param name="BackupName">IRS8886Foreign<xsl:number value="$pos"/></xsl:with-param>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;border-left-width:0px;">Foreign</span>
				</label>
			</td>
			<!--S corporation  checkbox right column-->
			<td class="styTableCell" style="border-right:1px solid black;text-align:left;border-bottom-width:1px;border-right-width:0px;border-left-width:0px;padding-left:1mm;padding-right:1mm;height:4mm;width:54mm;">
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=($pos+1)]/SCorporationInd"/>
						<xsl:with-param name="BackupName">IRS8886SCorporation<xsl:number value="$pos + 1"/></xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=($pos+1)]/SCorporationInd"/>
						<xsl:with-param name="BackupName">IRS8886SCorporation<xsl:number value="$pos + 1"/></xsl:with-param>
					</xsl:call-template>
					<span style="text-align:left;font-weight:normal;padding-left:0px;"> S corporation</span>
				</label>
				<span style="width:2.25mm;"/>
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos+1]/ForeignInd"/>
						<xsl:with-param name="BackupName">IRS8886Foreign<xsl:number value="$pos + 1"/></xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label style="padding-top:2mm;">
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos+1]/ForeignInd"/>
						<xsl:with-param name="BackupName">IRS8886Foreign<xsl:number value="$pos + 1"/></xsl:with-param>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;border-left-width:0px;">Foreign</span>
				</label>
			</td>
		</tr>
		<!-- line 5b name-->
		<tr style="width:187mm;border-bottom-width:0px;">
			<xsl:if test="($Print = $Separated)">
				<!-- Define background colors to the rows -->
				<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="$setCount mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>
			<td class="styTableCell" style="font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;height:7mm;width:6mm;padding-top:0.5mm;border-bottom-width:0px;border-right-width:0px;" valign="top">b</td>
			<td class="styLNDesc" style="border-bottom-width:0px;border-left-width:0px;height:7mm;width:73mm" valign="top">Name
				<span style="width:1mm;"/>
				<!-- dotted line -->
				<span class="styDotLn" style="float:none">..............</span>
				<span style="width:3px"/>
				<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
				<td style="border-bottom:1px solid black; text-align:left;border-right-width:1px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:7mm;width:54mm; ">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/EntityName/BusinessNameLine1Txt"/>
					</xsl:call-template>
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/EntityName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</td>
				<td style="border-bottom:1px solid black;  text-align:left;border-right-width:0px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;padding-left:2px;height:7mm;width:54mm;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos+1]/EntityName/BusinessNameLine1Txt"/>
					</xsl:call-template>
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos+1]/EntityName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</td>
			</td>
		</tr>
		<!-- line 5c EIN -->
		<tr style="width:187mm;border-bottom-width:0px;">
			<xsl:if test="($Print = $Separated)">
				<!-- Define background colors to the rows -->
				<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="$setCount mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>
			<td class="styTableCell" style="font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;width:6mm;padding-top:0.5mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;" valign="top">c</td>
			<td class="styLNDesc" style="padding-top:.5mm;border-left-width:0px;width:73mm" valign="top">Employer identification number (EIN), if known    
				<span style="width:2px;"/>
				<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
				<td style="width:54mm;border-bottom:1px solid black; text-align:left; border-right-width:1px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:8mm;padding-top:4mm;padding-left:1mm">
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/EntityEIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/EntityEIN"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/MissingEINReasonCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/MissingEINReasonCd"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
				<td style="width:54mm;border-bottom:1px solid black; text-align:left;border-right-width:0px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:8mm;padding-top:4mm;padding-left:1mm;">
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/EntityEIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=($pos+1)]/EntityEIN"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/MissingEINReasonCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=($pos+1)]/MissingEINReasonCd"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
			</td>
		</tr>
		<!-- line 5d date -->
		<tr >
			<xsl:if test="($Print = $Separated)">
				<!-- Define background colors to the rows -->
				<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="$setCount mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>
			<td class="styTableCell" style="height:8mm;width:6mm;border-left-width:0px;font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;width:2mm;padding-top:0.5mm;border-bottom-width:0px;border-right-width:0px;" valign="top">d</td>
			<td class="styLNDesc" style="height:8mm;padding-top:.5mm;border-left-width:0px;width:73mm" valign="top">
		              Date Schedule K-1 received from entity (enter "none" if Schedule K-1 not received)
   	<span class="styDotLn" style="float:none">....</span>
				<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
				<td style="border-bottom:1px solid black; text-align:center;border-right-width:1px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:8mm;padding-top:4mm;;width:54mm; ">
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/ScheduleK1ReceivedDt">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/ScheduleK1ReceivedDt"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/NoScheduleK1ReceivedCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/NoScheduleK1ReceivedCd"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
				<td style="border-bottom:1px solid black; text-align:center;border-right-width:0px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:8mm;padding-top:4mm;width:54mm; ">
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/ScheduleK1ReceivedDt">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos+1]/ScheduleK1ReceivedDt"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/NoScheduleK1ReceivedCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos+1]/NoScheduleK1ReceivedCd"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
			</td>
		</tr>
		<!--		</tr>     -->
		<!-- This calls the function again, if there are more rows to do-->
		<xsl:if test="($Form8886Data/TypeOfEntityInformation[position()=($pos+2)]=0)"/>
		<xsl:if test="$Form8886Data/TypeOfEntityInformation[position()=($pos+2)]">
			<xsl:call-template name="Line5RowGenerator">
				<xsl:with-param name="pos" select="$pos+2"/>
				<xsl:with-param name="setCount" select="$setCount+1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Line5EmptyTable">
		<tr >
			<td class="styTableCell" style="height:4mm;font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;width:6mm;padding-top:0.5mm;border-bottom-width:0px;border-right-width:0px;" valign="top">a</td>
			<td class="styLNDesc" style="height:4mm;float:left;border-bottom-width:0px;border-left-width:0px;width:73mm" valign="top">Type of entity:</td>
			<td class="styTableCell" style="height:4mm;border-right:1px solid black;text-align:left;border-bottom-width:0px;border-right-width:1px;padding-left:1mm;padding-right:1mm;width:54mm;">
				<!-- Partnership  checkbox column 1-->
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886Partnership</xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886Partnership</xsl:with-param>
					</xsl:call-template>
					<span style="text-align:right;font-weight:normal;">Partnership</span>
				</label>
				<span style="width:5mm;"/>
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886Trust</xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886Trust</xsl:with-param>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;">Trust</span>
				</label>
			</td>
			<!-- Partnership  checkbox right column-->
			<td class="styTableCell" style="height:4mm;text-align:left;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;padding-left:1mm;padding-right:1mm;width:54mm;">
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886Partnership</xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886Partnership</xsl:with-param>
					</xsl:call-template>
					<span style="text-align:right;font-weight:normal;;">Partnership</span>
				</label>
				<span style="width:5mm;"/>
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886Trust</xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886Trust</xsl:with-param>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;">Trust</span>
				</label>
			</td>
		</tr>
		<!--second row S corporation  checkbox column 1-->
		<tr >
			<td class="styTableCell" style="padding-left:3mm;text-align:left;font-size:7pt;height:4mm;width:6mm;padding-top:0.5mm;border-right-width:0px;border-bottom-width:0px;" valign="top"/>
			<td class="styLNDesc" style="float:left;width:73mm;border-left-width:0px;" valign="top"/>
			<td class="styTableCell" style="border-right:1px solid black;text-align:left;border-bottom-width:1px;border-right-width:1px;padding-left:1mm;padding-right:1mm;height:4mm;width:54mm;">
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886SCorporation</xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886SCorporation</xsl:with-param>
					</xsl:call-template>
					<span style="text-align:left;font-weight:normal;padding-left:0px;">S corporation</span>
				</label>
				<span style="width:2.25mm;"/>
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886Foreign</xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label style="padding-top:2mm;">
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886Foreign</xsl:with-param>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;border-left-width:0px;">Foreign</span>
				</label>
			</td>
			<!--S corporation  checkbox right column-->
			<td class="styTableCell" style="border-right:1px solid black;text-align:left;border-bottom-width:1px;border-right-width:0px;border-left-width:0px;padding-left:1mm;padding-right:1mm;height:4mm;width:54mm;">
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886SCorporation</xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886SCorporation</xsl:with-param>
					</xsl:call-template>
					<span style="text-align:left;font-weight:normal;padding-left:0px;"> S corporation</span>
				</label>
				<span style="width:2.25mm;"/>
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 3mm; width: 3mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886Foreign</xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label style="padding-top:2mm;">
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="none"/>
						<xsl:with-param name="BackupName">IRS8886Foreign</xsl:with-param>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;border-left-width:0px;">Foreign</span>
				</label>
			</td>
		</tr>
		<tr style="width:187mm;border-bottom-width:0px;">
			<td class="styTableCell" style="font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;height:7mm;width:6mm;padding-top:0.5mm;border-bottom-width:0px;border-right-width:0px;" valign="top">b</td>
			<td class="styLNDesc" style="border-bottom-width:0px;border-left-width:0px;height:7mm;width:73mm" valign="top">Name
				<span style="width:1mm;"/>
				<!-- dotted line -->
				<span class="styDotLn" style="float:none">..............</span>
				<span style="width:3px"/>
				<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
				<td style="border-bottom:1px solid black; text-align:left;border-right-width:1px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:7mm;width:54mm; ">
					<span class="styTableCellPad"/>
				</td>
				<td style="border-bottom:1px solid black;  text-align:left;border-right-width:0px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;padding-left:2px;height:7mm;width:54mm;">
					<span class="styTableCellPad"/>
				</td>
			</td>
		</tr>
		<!-- line 5c EIN -->
		<tr style="width:187mm;border-bottom-width:0px;">
			<td class="styTableCell" style="font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;width:6mm;padding-top:0.5mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;" valign="top">c</td>
			<td class="styLNDesc" style="padding-top:.5mm;border-left-width:0px;width:73mm" valign="top">Employer identification number (EIN), if known    
				<span style="width:2px;"/>
				<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
				<td style="width:54mm;border-bottom:1px solid black; text-align:left; border-right-width:1px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:8mm;padding-top:4mm;padding-left:1mm">
					
					<span class="styTableCellPad"/>
				</td>
				<td style="width:54mm;border-bottom:1px solid black; text-align:left;border-right-width:0px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:8mm;padding-top:4mm;padding-left:1mm;">
					
					<span class="styTableCellPad"/>
				</td>
			</td>
		</tr>
		<!-- line 5d date -->
		<tr >
			<td class="styTableCell" style="height:8mm;width:6mm;border-left-width:0px;font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;width:2mm;padding-top:0.5mm;border-bottom-width:0px;border-right-width:0px;" valign="top">d</td>
			<td class="styLNDesc" style="height:8mm;padding-top:.5mm;border-left-width:0px;width:73mm" valign="top">
		              Date Schedule K-1 received from entity (enter "none" if Schedule K-1 not received)
   	<span class="styDotLn" style="float:none">....</span>
				<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
				<td style="border-bottom:1px solid black; text-align:center;border-right-width:1px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:8mm;padding-top:4mm;;width:54mm; ">
					
					<span class="styTableCellPad"/>
				</td>
				<td style="border-bottom:1px solid black; text-align:center;border-right-width:0px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:8mm;padding-top:4mm;width:54mm; ">
					
					<span class="styTableCellPad"/>
				</td>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>