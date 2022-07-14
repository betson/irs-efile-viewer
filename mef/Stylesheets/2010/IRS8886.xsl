<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
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
		<html>
			<head>
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
					<div class="styTBB" style="width:187mm">
						<div style="float:left; width:31mm; font-size:7pt">  
          Form
          <span class="styFormNumber">8886          
          </span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8886Data"/>
							</xsl:call-template>
							<br/>(Rev. December 2010) <br/>
							<div style="font-size:6pt">        
            Department of the Treasury<br/>Internal Revenue Service
          </div>
						</div>
						<div style="float:left; border-left:1 solid black; border-right:1 solid black; width:125mm; height:18mm; text-align:center; padding-top:1mm; font-size:13pt; font-weight:bold">
							<span class="styMainTitle">Reportable Transaction Disclosure Statement</span>
							<div style="font-size:8pt; padding-top:2mm; text-align:left; margin-left:45mm">
								<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/> &nbsp; Attach to your tax return.            
          </div>
							<div style="font-size:8pt; padding-top:1mm; text-align:left; margin-left:45mm">
								<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/> &nbsp; See separate instructions.
          </div>
						</div>
						<div style="float:left; font-size:7pt; width:31mm; padding-top:3.5mm; text-align:center; border-bottom:1 solid black; height:9mm">
          OMB No. 1545-1800
        </div>
						<div style="float:left; font-size:7pt; padding-top:1mm; padding-left:4.5mm">
          Attachment<br/>Sequence No. <b style="font-size:9pt">137</b>
						</div>
					</div>
					<!-- Begin Filer Name and Address Section -->
					<div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
						<div class="styFNBox" style="width:144mm;height:8mm;">
          Name(s) shown on return (individuals enter last name, first name, middle initial)<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:42mm;height:4mm;padding-left:1mm;">
							<span class="styBoldText">Identifying number</span>
							<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="font-family:verdana;font-size:7pt; width:187mm; height:8mm">
        Number, street, and room or suite no.
        <br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styBB" style="font-family:verdana;font-size:7pt; width:187mm; height:8mm;padding-top:1mm;">
        City or town, state, and ZIP code
        <br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">Country</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- line A top -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm">A</div>
						<div style="float:left;clear:none;padding-top:0.5mm;">If you are filing more than one Form 8886 with your tax return, sequentially number each Form 8886 and
 <div style="float:left;clear:none;padding-top:0.5mm;">enter the statement number for this Form 8886</div>
							<!-- dotted line -->
							<span class="styDotLn" style="padding-left:1px"> ..</span>
							<div style="padding-top:0.5mm;width:103.5mm;">
								<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
		 Statement number
                <span style="width:2px;"/>
								<span style="border-bottom:1 solid black; width:32.5mm; text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8886Data/StatementNumber"/>
									</xsl:call-template>
								</span>
								<span style="width:1px;padding-top:.5mm"/>of
                  <span style="width:1px;"/>
								<span style="border-bottom:1 solid black; width:32.5mm; text-align:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8886Data/TotalStatementNumber"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!-- line B line 1 top -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;height:8mm">B</div>
						<div style="padding-top:0.5mm;width:122mm;float:left;width;">
 Enter the form number of the tax return to which this form is attached or related
</div>
						<!-- dotted line -->
						<span class="styDotLn"> .....</span>
						<div style="float:right;padding-top:0.5mm;width:42mm;">
							<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
							<span style="width:1px;"/>
							<span style="border-bottom:1 solid black; width:38.5mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/FormNumberOfTaxReturn"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- line B line 2 -->
					<div class="styNBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;height:8mm;"/>
						<div style="padding-top:0.5mm;float:left">
         Enter the year of the tax return identified above</div>
						<!-- dotted line -->
						<span class="styDotLn" style="padding-left:3px;">  ................</span>
						<div style="float:right;padding-top:0.5mm;width:42mm">
							<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
							<span style="width:1px;"/>
							<span style="border-bottom:1 solid black; width:38.5mm; text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form8886Data/ForTaxYear"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- line B line 3 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;"/>
						<div style="padding-top:0.5mm;float:left;">
         Is this Form 8886 being filed with an amended tax return?
        <span style="width:3mm;"/>
							<input class="styCkbox" type="checkbox" name="Checkbox" id="dummyidyes" style="width:3mm;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8886Data/AttachedToAmendedReturn"/>
									<xsl:with-param name="BackupName">IRS8886DataAttachedToAmendedReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form8886Data/AttachedToAmendedReturn"/>
								</xsl:call-template>
              Yes
       </label>
							<span style="width:8mm;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8886Data/AttachedToAmendedReturn"/>
									<xsl:with-param name="BackupName">IRS8886NotAttachedToAmendedReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form8886Data/AttachedToAmendedReturn"/>
								</xsl:call-template>
              No
       </label>
						</div>
					</div>
					<!-- Line C top -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;">C</div>
						<div style="float:left;width:165mm; padding-top:.5mm;">
                  Check the box(es) that apply (see instructions).
             <input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8886Data/InitialYearFiler"/>
									<xsl:with-param name="BackupName">IRS8886InitialYearFiler</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8886Data/InitialYearFiler"/>
									<xsl:with-param name="BackupName">IRS8886InitialYearFiler</xsl:with-param>
								</xsl:call-template>   
                Initial year filer
              </label>
							<span style="width:3mm;"/>
							<span style="width:3mm;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8886Data/ProtectiveDisclosure"/>
									<xsl:with-param name="BackupName">IRS8886ProtectiveDisclosure</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8886Data/ProtectiveDisclosure"/>
									<xsl:with-param name="BackupName">IRS8886ProtectiveDisclosure</xsl:with-param>
								</xsl:call-template>   
                Protective disclosure
              </label>
						</div>
					</div>
					<!-- 1a, 1 b, and 1 c table -->
					<xsl:if test="($Print != $Separated) and (count($Form8886Data/ReportableTransactionInfo) &gt;0)">
						<div class="styGenericDiv" style="width:187mm;border-bottom-width:1px;border-top-width:0;border-right-width:0;border-left-width:0;border-color:black;border-style:solid">
							<div style="float:right">
								<xsl:call-template name="SetTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form8886Data/ReportableTransactionInfo"/>
									<xsl:with-param name="containerHeight" select="1"/>
									<xsl:with-param name="containerID" select="'Line1TPctn'"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<xsl:choose>
						<!-- removed following line \modified to test -  need top border for 1 separated data occurence for this line -->
						<!--            <xsl:when test="($Print != $Separated) and (count($Form8886Data/ReportableTransactionInfo) &gt;0) or ($Print = $Separated) and (count($Form8886Data/ReportableTransactionInfo)=1) ">   -->
						<xsl:when test="($Print != $Separated) and (count($Form8886Data/ReportableTransactionInfo) &gt;0)">
							<div class="styIRS8886TableContainer2" style="float: none; clear:both; border-bottom:0; height:24.5mm" id="Line1TPctn">
								<xsl:call-template name="SetInitialState"/>
								<xsl:for-each select="$Form8886Data/ReportableTransactionInfo">
									<div class="styGenericDiv" style="width:182mm; font-size:8.5pt;;height:12mm;border-top:0 solid black;">
										<div style="font-weight:bold; padding-top:0; width:6mm; text-align:center; float:left">1a</div>
										<div style="float:left; width:85mm;">Name of reportable transaction</div>
										<div style="clear:left;float:left;padding-left:6mm; width:90.75mm;padding-top:0mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NameOfReportableTransaction"/>
												<xsl:with-param name="backupName">IRS8886NameOfReportableTransaction</xsl:with-param>
												<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
											</xsl:call-template>
											<!-- write in data pen image -->
											<span style="width:2mm"/>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Form 8886, line 1a - Book tax difference indicator</xsl:with-param>
												<xsl:with-param name="TargetNode" select="NameOfReportableTransaction/@bookTaxDifferenceIndicator"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="styBB" style="width:182mm;font-size:8.5pt;border-top:1 solid black;">
										<div class="styGenericDiv" style="width:91mm;font-size:8.5pt;height:12mm;border-right:1 solid black;">
											<span style="width:1mm;"/>
											<span class="styBoldText">1b</span>
											<span style="width:1.5mm;"/>Initial year participated in transaction<br/>
											<br/>
											<span style="width:6mm;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InitialYearParticipated"/>
											</xsl:call-template>
										</div>
										<span style="width:1mm;"/>
										<span class="styBoldText">1c</span>
										<span style="width:1.5mm;"/>Reportable transaction or tax shelter registration number<br/>
										<span style="width:5.5mm;"/>(9 digits or 11 digits)<br/>
										<div style="float:left; text-align:center; width:91mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransactionOrTaxShelterNumber"/>
											</xsl:call-template>
										</div>
									</div>
								</xsl:for-each>
							</div>
						</xsl:when>
						<xsl:when test="($Print = $Separated) and (count($Form8886Data/ReportableTransactionInfo)=1) ">
							<div class="styIRS8886TableContainer2" style="float: none; clear:both; border-bottom:0; height:24.5mm" id="Line1TPctn">
								<xsl:call-template name="SetInitialState"/>
								<xsl:for-each select="$Form8886Data/ReportableTransactionInfo">
									<div class="styGenericDiv" style="width:182mm; font-size:8.5pt;;height:12mm;border-top:1 solid black;">
										<div style="font-weight:bold; padding-top:0; width:6mm; text-align:center; float:left">1a</div>
										<div style="float:left; width:85mm;">Name of reportable transaction</div>
										<div style="clear:left;float:left;padding-left:6mm; width:90.75mm;padding-top:0mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NameOfReportableTransaction"/>
												<xsl:with-param name="backupName">IRS8886NameOfReportableTransaction</xsl:with-param>
												<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
											</xsl:call-template>
											<!-- write in data pen image -->
											<span style="width:2mm"/>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Form 8886, line 1a - Book tax difference indicator</xsl:with-param>
												<xsl:with-param name="TargetNode" select="NameOfReportableTransaction/@bookTaxDifferenceIndicator"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="styBB" style="width:182mm;font-size:8.5pt;border-top:1 solid black;">
										<div class="styGenericDiv" style="width:91mm;font-size:8.5pt;height:12mm;border-right:1 solid black;">
											<span style="width:1mm;"/>
											<span class="styBoldText">1b</span>
											<span style="width:1.5mm;"/>Initial year participated in transaction<br/>
											<br/>
											<span style="width:6mm;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InitialYearParticipated"/>
											</xsl:call-template>
										</div>
										<span style="width:1mm;"/>
										<span class="styBoldText">1c</span>
										<span style="width:1.5mm;"/>Reportable transaction or tax shelter registration number<br/>
										<span style="width:5.5mm;"/>(9 digits or 11 digits)<br/>
										<div style="float:left; text-align:center; width:91mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransactionOrTaxShelterNumber"/>
											</xsl:call-template>
										</div>
									</div>
								</xsl:for-each>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div class="styBB" style="width:187mm; font-size:8.5pt; bottom-border:1mm;border-top:1 solid black;height:12mm;">
								<div style="font-weight:bold; padding-top:0; width:6mm; text-align:center; float:left;">1a</div>
								<div style="float:left; width:85mm;">Name of reportable transaction</div>
								<div style="clear:left;float:left;padding-left:6mm; width:90.75mm;padding-top:0mm;">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$Form8886Data/ReportableTransactionInfo/NameOfReportableTransaction"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styBB" style="width:187mm;font-size:8.5pt;">
								<div class="styGenericDiv" style="width:91mm;font-size:8.5pt;height:12mm;border-right:1 solid black;">
									<span style="width:1mm;"/>
									<span class="styBoldText">1b</span>
									<span style="width:1.5mm;"/>Initial year participated in transaction
		     </div>
								<span style="width:2mm;"/>
								<span class="styBoldText">1c</span>
								<span style="width:1.5mm;"/>Reportable transaction or tax shelter registration number	 <br/>
								<span style="width:5.5mm;"/>(9 digits or 11 digits)
      </div>
						</xsl:otherwise>
					</xsl:choose>
					<!-- line 2 -->
					<div style="width:187mm; padding-bottom:0.5mm;">
						<div class="styLNLeftNumBox" style="width:6mm">2</div>
						<div class="styLNDesc" style="width:179mm;padding-top:0.5mm">
          Identify the type of reportable transaction. Check all box(es) that apply (see instructions).
        </div>
					</div>
					<!-- line 2a -->
					<div style="width:187mm">
						<div class="styLNLeftLtrBox">a</div>
						<div class="styGenericDiv" style="width:47mm">
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8886Data/Listed"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8886Data/Listed"/>
								</xsl:call-template>
                Listed
              </label>
						</div>
						<!-- line 2c -->
						<div class="styLNLeftLtrBox">c</div>
						<div class="styGenericDiv" style="width:47mm;">
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8886Data/ContractualProtection"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8886Data/ContractualProtection"/>
								</xsl:call-template>   
                Contractual protection
              </label>
						</div>
						<!-- line 2e -->
						<div class="styLNLeftLtrBox">e</div>
						<div class="styGenericDiv" style="width:47mm">
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8886Data/TransactionOfInterest"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8886Data/TransactionOfInterest"/>
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
										<xsl:with-param name="TargetNode" select="$Form8886Data/Confidential"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/Confidential"/>
									</xsl:call-template>   
                Confidential
              </label>
							</div>
							<!-- line 2d -->
							<div class="styLNLeftLtrBox">d</div>
							<div class="styGenericDiv" style="width:47mm">
								<input type="Checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/Loss"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/Loss"/>
									</xsl:call-template>   
                Loss
              </label>
							</div>
						</div>
					</div>
					<!-- line 3 -->
					<div style="width:187mm; padding-top:2mm;">
						<div class="styLNLeftNumBox" style="width:5mm; height:4mm;">3</div>
						<div style="padding-top:0.5mm;">If you checked box 2a or 2e,
             enter the published guidance number for the listed transaction or transaction of interest<b>.</b>
						</div>
					</div>
					<div style="width:187mm;">
						<span class="styDotLn" style="padding-left:6mm;padding-top:0.5mm;">
							<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
						</span>
						<div style="border-bottom:1 solid black; width:160mm;float:right;clear:none;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8886Data/PublishedGuidanceNumber"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 4 -->
					<div style="width:187mm; padding-top:2mm">
						<div class="styLNLeftNumBox" style="width:6mm;height:8mm">4</div>
						<div style="float:left; padding-top:0.5mm">Enter the number of “same as or substantially similar” transactions reported on this form</div>
						<span style="width:1px;float:right"/>
						<span class="styDotLn" style="margin-right:3mm;padding-top:0.5mm;">      
           .<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
						</span>
						<div style="float:right; border-bottom:1 solid black; width:35mm; height:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="6"/>
								<xsl:with-param name="TargetNode" select="$Form8886Data/NumberOfSameOrSimilarTr"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 5 -->
					<div style="width:187mm; padding-top:2mm">
						<div class="styLNLeftNumBox" style="width:6mm; ">5</div>
						<div style="float:left; width:181mm; padding-top:0.5mm">If you participated in the transaction through another entity, check all applicable boxes and provide the information below for the entity (see instructions). (Attach additional sheets, if necessary.)    
      </div>
					</div>
					<!-- button display logic:  If print is not separated and there are more than 2 Entities then create toggle button and scroll
bar to display in line data. -->
					<div style="width:187mm;">
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
					<!-- line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;">6</div>
						<div style="width:181mm;float:left; padding-top:0.5mm;">
            Enter below the name and address of each individual or entity to whom you paid a fee with regard to the transaction if that individual or entity promoted, solicited, or recommended your participation in the transaction, or provided tax 
              advice related to the transaction. (Attach additional sheets, if necessary.)
                <div style="width:3.2mm;float:right;clear:all;text-align:right;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo"/>
									<xsl:with-param name="containerHeight" select="2"/>
									<xsl:with-param name="headerHeight" select="4"/>
									<xsl:with-param name="containerID" select="'line6Tctn'"/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
					</div>
					<div class="styTableContainer" style="width:187mm;" id="line6Tctn">
						<!-- print logic of table toggle area -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" style="width:100%;font-size:8pt;border-top:1 solid black;border-bottom:1 solid black;" cellspacing="0" cellpadding="0" border="0">
							<thead/>
							<tfoot/>
							<tbody>
								<!--  If the print parameter is not set to be Separated, or there are fewer elements than the container height (2), execute -->
								<xsl:if test="($Print != $Separated) or (count($Form8886Data/PersonsYouPaidAFeeInfo) &lt;=2)">
									<xsl:for-each select="$Form8886Data/PersonsYouPaidAFeeInfo">
										<!--Line 6 Row 1 -->
										<tr style="width:183mm;">
											<td style="width:6mm;float:left;font-weight:bold;padding-left:2mm;border-bottom:1 solid black;border-right:1 solid black;" rowspan="3" valign="top">
												<xsl:number value="position()" format="a"/>
											</td>
											<td style="width:89mm;padding-left:3px;float:left;border-bottom:1 solid black;border-right:1 solid black;">Name
                        <br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfPersonYouPaidFee"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td style="width:48mm;padding-left:3px;text-align:left;font-weight:normal;border-bottom:1 solid black;border-right:1 solid black;">Identifying number (if known)
                            <br/>
												<span valign="center">
													<xsl:choose>
														<xsl:when test="SSNNumberPersonPaidFee">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="SSNNumberPersonPaidFee"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="EINNumberPersonPaidFee">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EINNumberPersonPaidFee"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReasonPersonPaidFee"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
												<span class="styTableCellPad"/>
											</td>
											<td style="width:40mm;padding-left:3px;text-align:left;border-bottom:1 solid black;">Fees paid
                            <br/>
                              $ <span style="width:4mm;"/>
												<span style="text-align:right;width:32mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="FeesPaid"/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
										<!-- Line 6 Row 2 street address -->
										<tr style="width;183mm;">
											<td style="width:177mm;padding-left:3px;float:right;border-bottom:1 solid black;" colspan="3">Number, street, and room or suite no.
                        <br/>
												<!-- A Choice of US or Foreign Street Address-->
												<xsl:choose>
													<!-- US Street Address -->
													<xsl:when test="USAddressPersonPaidFee">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddressPersonPaidFee/AddressLine1"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddressPersonPaidFee/AddressLine2"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:when>
													<xsl:otherwise>
														<!-- Foreign Street Address -->
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddressPersonPaidFee/AddressLine1"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddressPersonPaidFee/AddressLine2"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:otherwise>
												</xsl:choose>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- line 6 Row 3 City or town, state, and ZIP code -->
										<tr style="width:183mm;">
											<td style="width:177mm;padding-left:3px;float:right;border-bottom:1 solid black;" colspan="3">City or town, state, and ZIP code<br/>
												<!-- A choice of US or Foreign -->
												<xsl:choose>
													<!-- US -->
													<xsl:when test="USAddressPersonPaidFee">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddressPersonPaidFee//City"/>
														</xsl:call-template>,
		                    <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddressPersonPaidFee//State"/>
														</xsl:call-template>&nbsp;
		                    <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddressPersonPaidFee//ZIPCode"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:when>
													<xsl:otherwise>
														<!-- Foreign Street Address -->
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddressPersonPaidFee/City"/>
														</xsl:call-template>,
		                    <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddressPersonPaidFee/ProvinceOrState"/>
														</xsl:call-template>
														<span style="width:2px;"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddressPersonPaidFee/PostalCode"/>
														</xsl:call-template>
														<span style="width:2px;"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddressPersonPaidFee/Country"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:otherwise>
												</xsl:choose>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!--Line 6 Empty table -->
								<xsl:if test="count($Form8886Data/PersonsYouPaidAFeeInfo) &lt; 1 or ((count($Form8886Data/PersonsYouPaidAFeeInfo) &gt;2) and ($Print = $Separated))">
									<!--Line 6 Row 1 -->
									<tr style="width:187mm;">
										<td style="width:6mm;float:left;font-weight:bold;padding-left:2mm;border-bottom:1 solid black;border-right:1 solid black;" rowspan="3" valign="top">
											<xsl:number value="position()" format="a"/>
										</td>
										<td style="width:93mm;padding-left:3px;float:left;border-bottom:1 solid black;border-right:1 solid black;">Name
                      <br/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td style="width:48mm;padding-left:3px;text-align:left;font-weight:normal;border-bottom:1 solid black;border-right:1 solid black;">Identifying number (if known)
                      <br/>
											<span valign="center"/>
											<span class="styTableCellPad"/>
										</td>
										<td style="width:40mm;padding-left:3px;text-align:left;border-bottom:1 solid black;">Fees paid
                      <br/>
                        $ <span style="width:4mm;"/>
											<span style="text-align:right;width:32mm;"/>
										</td>
									</tr>
									<!-- Line 6 Row 2 street address -->
									<tr style="width:187mm;">
										<td style="width:181mm;padding-left:3px;float:right;border-bottom:1 solid black;" colspan="3">Number, street, and room or suite no.
                      <br/>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 6 Row 3 City or town, state, and ZIP code -->
									<tr style="width:187mm;">
										<td style="width:181mm;padding-left:3px;float:right;border-bottom:1 solid black;;" colspan="3">City or town, state, and ZIP code<br/>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<xsl:if test="count($Form8886Data/PersonsYouPaidAFeeInfo) &lt; 2 or ((count($Form8886Data/PersonsYouPaidAFeeInfo) &gt;2) and ($Print = $Separated))">
										<!--Line 6 Row 1 -->
										<tr style="width:187mm;">
											<td style="width:6mm;float:left;font-weight:bold;padding-left:2mm;border-bottom:1 solid black;border-right:1 solid black;" rowspan="3" valign="top">b
                      </td>
											<td style="width:93mm;padding-left:3px;float:left;border-bottom:1 solid black;border-right:1 solid black;">Name
                        <br/>
												<span class="styTableCellPad"/>
											</td>
											<td style="width:48mm;padding-left:3px;text-align:left;font-weight:normal;border-bottom:1 solid black;border-right:1 solid black;;">Identifying number (if known)
                        <br/>
												<span valign="center"/>
												<span class="styTableCellPad"/>
											</td>
											<td style="width:40mm;padding-left:3px;text-align:left;border-bottom:1 solid black;">Fees paid
                        <br/>
                          $ <span style="width:4mm;"/>
												<span style="text-align:right;width:32mm;"/>
											</td>
										</tr>
										<!-- Line 6 Row 2 street address -->
										<tr style="width:187mm;">
											<td style="width:181mm;padding-left:3px;float:right;border-bottom:1 solid black;" colspan="3">Number, street, and room or suite no.
                        <br/>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- line 6 Row 3 City or town, state, and ZIP code -->
										<tr style="width:187mm;">
											<td style="width:181mm;padding-left:3px;float:right;border-bottom:1 solid black;" colspan="3">City or town, state, and ZIP code<br/>
												<span class="styTableCellPad"/>
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
						<xsl:with-param name="containerHeight" select="2"/>
						<xsl:with-param name="headerHeight" select="4"/>
						<xsl:with-param name="containerID" select="'line6Tctn'"/>
					</xsl:call-template>
					<!--end of page -->
					<div style="width:187mm; font-size:7pt; border-top:1 solid black; page-break-after:always">
						<div style="font-weight:bold; float:left; padding-top:0.5mm">For Paperwork Reduction Act Notice, see separate instructions.
        </div>
						<div style="float:right">
							<span style="margin-right:45mm">Cat. No. 34654G</span>          
          Form <b style="font-size:9pt">8886</b> (Rev. 12-2010)
        </div>
					</div>
					<!-- begin page 2 -->
					<div style="width:187mm; font-size:7pt; border-bottom:1 solid black">
						<span style="float:left">Form 8886 (Rev. 12-2010)</span>
						<span style="float:right">Page <b style="font-size:9pt">2</b>
						</span>
					</div>
					<!-- line 7 -->
					<div style="width:187mm; border-top:1 solid black; padding-top:1mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBox" style="width:6mm;">7</div>
						<div style="float:left;padding-top:0.5mm;font-weight:bold;padding-left:2mm;width:10mm">Facts</div>
					</div>
					<div style="width:187mm; padding-top:1mm">
						<!-- line 7a -->
						<div class="styLNLeftLtrBox" style="padding-top:0.5mm;text-align:left;">a</div>
						<div style="float:left;width:179mm;height:8mm;padding-top:0.5mm;">Identity the type of tax benefit generated by the transaction. Check all the boxes that apply (see instructions).
           </div>
					</div>
					<!-- line 7 checkboxes -->
					<div style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:179mm;height:4.5mm;">
							<div class="styGenericDiv" style="width:33mm;">
								<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/Deductions"/>
										<xsl:with-param name="BackupName">IRS8886</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/Deductions"/>
										<xsl:with-param name="BackupName">IRS8886</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/> Deductions
            <span style="width: 5mm;"/>
								</label>
							</div>
							<div class="styGenericDiv" style="width:61mm;">
								<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/ExclusionsFromGrossIncome"/>
										<xsl:with-param name="BackupName">IRS8886</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/ExclusionsFromGrossIncome"/>
										<xsl:with-param name="BackupName">IRS8886</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/>Exclusions from gross income
            <span style="width: 5mm;"/>
								</label>
							</div>
							<div class="styGenericDiv" style="width:56mm;">
								<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/AbsenceOfAdjustmentsToBasis"/>
										<xsl:with-param name="BackupName">IRS1120InitialReturn</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/AbsenceOfAdjustmentsToBasis"/>
										<xsl:with-param name="BackupName">IRS8886</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/>
									<span style="font-size:9pt;">Absence of adjustments to basis</span>
								</label>
							</div>
							<div class="styGenericDiv" style="width:20mm;">
								<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/TaxCredits"/>
										<xsl:with-param name="BackupName">IRS8886</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/TaxCredits"/>
										<xsl:with-param name="BackupName">IRS8886</xsl:with-param>
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
								<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/CapitalLoss"/>
										<xsl:with-param name="BackupName">IRS8886Return</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/CapitalLoss"/>
										<xsl:with-param name="BackupName">IRS8886Return</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/>Capital loss  
	            <span style="width: 5mm;"/>
								</label>
							</div>
							<div class="styGenericDiv" style="width:61mm;">
								<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/NonrecognitionOfGain"/>
										<xsl:with-param name="BackupName">IRS8886Return</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/NonrecognitionOfGain"/>
										<xsl:with-param name="BackupName">IRS8886</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/> Nonrecognition of gain
            <span style="width: 5mm;"/>
								</label>
							</div>
							<div class="styGenericDiv" style="width:46mm;">
								<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/Deferral"/>
										<xsl:with-param name="BackupName">IRS8886</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/Deferral"/>
										<xsl:with-param name="BackupName">IRS8886</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/> Deferral
          </label>
							</div>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:179mm;height:4.5mm;">
							<div class="styGenericDiv" style="width:33mm;">
								<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/OrdinaryLoss"/>
										<xsl:with-param name="BackupName">IRS8886</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/OrdinaryLoss"/>
										<xsl:with-param name="BackupName">IRS8886</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/>Ordinary loss 
          </label>
							</div>
							<div class="styGenericDiv" style="width:61mm;">
								<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/AdjustmentsToBasis"/>
										<xsl:with-param name="BackupName">IRS8886</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/AdjustmentsToBasis"/>
										<xsl:with-param name="BackupName">IRS8886Return</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/> Adjustments to basis
            <span style="width: 5mm;"/>
								</label>
							</div>
							<div class="styGenericDiv" style="width:60mm;">
								<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8886Data/Other"/>
										<xsl:with-param name="BackupName">IRS8886</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8886Data/Other"/>
										<xsl:with-param name="BackupName">IRS8886</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/>Other
								</label>
								<span style="border-bottom:1 solid black; text-align:left; width:31mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8886Data/Other/@otherTaxBenefit"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!-- line 7b -->
					<div style="width:187mm; padding-top:1mm">
						<div class="styLNLeftLtrBox" style="padding-top:0.5mm;text-align:left;">b</div>
						<div style="float:left;width:179mm;height:16mm;padding-top:0.5mm;">Further describe the amount and nature of the expected tax treatment and expected tax benefits generated by the transaction for all affected years.  Include facts of each step of the transaction that relate to the expected tax benefits including the amount and nature of your investment. Include in your description your participation in the transaction and all related transactions regardless of the year in which they were entered into. Also, include a description of any tax result protection with respect to the transaction.  
              <!-- Push Pin image -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8886Data/DescribeExpectedTaxBenefits"/>
							</xsl:call-template>
						</div>
						<div style="width:187mm;border-bottom:1 solid black;width:100%;padding-top:1mm;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8886Data/DescribeExpectedTaxBenefits"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div style="width:187mm; border-top:0mm;border-style:solid black; padding-top:1mm;">
						<div class="styLNLeftNumBox" style="width:6mm; ">8</div>
						<div style="float:left; padding-top:0.5mm;">Identify all individuals and entities that are involved in this transaction and are foreign, related, or tax exempt.  Check </div>
						<div style="float:left; width:179mm">the appropriate box(es) (see instructions). Include their name(s), identifying number(s), address(es), and a brief </div>
						<div style="float:left; width:179mm;padding-left:6mm">description of their involvement. For each foreign entity, identify its country of incorporation or existence. Explain </div>
						<div style="float:left; width:179mm;padding-left:6mm;"> how each related individual or entity is related to you and to the other individuals and entities participating in the </div>
						<div style="float:left; width:179mm;padding-left:6mm;"> transaction.  Attach additional sheets if necessary.</div>
						<!-- button display logic -->
						<span style="width:183mm;"/>
						<span style="width:3.2mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr"/>
								<xsl:with-param name="containerHeight" select="10"/>
								<xsl:with-param name="headerHeight" select="0"/>
								<xsl:with-param name="containerID" select="'line8TPctn'"/>
							</xsl:call-template>
						</span>
						<!--                  
        </div>  
      -->
					</div>
					<!-- 
       <div class="styIRS8886TableContainer2" id="line8TPctn" style="float: none; clear:both; border-bottom-width: 0px; height:16mm">
       -->
					<div class="styTableContainerNBB" id="line8TPctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" cellpadding="0" border="0" style="width:100%;font-family:verdana;font-size:8pt; ">
							<thead/>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form8886Data/IdentifyAllInvolvedInTr) &lt;=2)">
									<xsl:for-each select="$Form8886Data/IdentifyAllInvolvedInTr">
										<tr style="width:187mm;">
											<td class="styLNLeftLtrBox" style="padding-top:0.5mm;text-align:left;float:left;clear:none;">
												<xsl:number value="position()" format="a"/>
											</td>
											<td class="styLNDesc" style="float:left;clear:none;">Type of individual or entity:
               <span style="width: 5mm;"/>
												<!-- line 8 checkboxes -->
												<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="TaxExempt"/>
														<xsl:with-param name="BackupName">IRS8886TaxExempt</xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="font-size:8pt; padding-right:2mm;">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="TaxExempt"/>
														<xsl:with-param name="BackupName">IRS8886TaxExempt</xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
    Tax-exempt
     <span style="width: 5mm;"/>
												</label>
												<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="Foreign"/>
														<xsl:with-param name="BackupName">IRS8886Foreign</xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="font-size:8pt; padding-right:2mm;">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="Foreign"/>
														<xsl:with-param name="BackupName">IRS8886Foreign</xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
           Foreign
            <span style="width: 5mm;"/>
												</label>
												<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="Related"/>
														<xsl:with-param name="BackupName">IRS8886Related</xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="font-size:8pt; padding-right:2mm;">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="Related"/>
														<xsl:with-param name="BackupName">IRS8886Related</xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
           Related
            <span style="width: 5mm;"/>
												</label>
											</td>
										</tr>
										<!-- Line 8 Name and EIN -->
										<tr style="width:187mm;">
											<td style="border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;height:8mm;" valign="bottom"> Name</td>
											<td style="text-align:left;font-family:verdana;width:127mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;" valign="bottom">
												<xsl:if test="$Form8886Data/IdentifyAllInvolvedInTr/PersonNameInvolvedInTr!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNameInvolvedInTr"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</xsl:if>
												<xsl:if test="$Form8886Data/IdentifyAllInvolvedInTr/BusinessNameInvolvedInTr/BusinessNameLine1!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessNameInvolvedInTr/BusinessNameLine1"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</xsl:if>
												<span style="width:4px;"/>
												<xsl:if test="normalize-space(BusinessNameInvolvedInTr/BusinessNameLine2)!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessNameInvolvedInTr/BusinessNameLine2"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td style="width:35mm;vertical-align:top;border-color:black;border-left-width:1px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-left:2px;" valign="top">
	Identifying number<br/>
												<span valign="bottom" style="padding-top:2mm;padding-left:2px;">
													<xsl:choose>
														<xsl:when test="normalize-space(SSNNumberInvolvedInTransaction)">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="SSNNumberInvolvedInTransaction"/>
															</xsl:call-template>
															<span style="width: 2px"/>
														</xsl:when>
														<xsl:when test="normalize-space(EINNumberInvolvedInTransaction)">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EINNumberInvolvedInTransaction"/>
															</xsl:call-template>
															<span style="width: 2px"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReasonInvolvedInTr"/>
															</xsl:call-template>
															<span style="width: 2px"/>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</td>
										</tr>
										<!-- line 8 address -->
										<tr style="width:187mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
											<td style="height:8mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-right:1mm;" valign="bottom">Address</td>
											<td style="font-family:verdana;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;" valign="bottom">
												<xsl:choose>
													<!-- US Address -->
													<xsl:when test="$Form8886Data/IdentifyAllInvolvedInTr/USAddressInvolvedInTransaction">
														<xsl:if test="USAddressInvolvedInTransaction/AddressLine1!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddressInvolvedInTransaction/AddressLine1"/>
															</xsl:call-template>,            
       <span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="USAddressInvolvedInTransaction/AddressLine2!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddressInvolvedInTransaction/AddressLine2"/>
															</xsl:call-template>,            
              <span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="USAddressInvolvedInTransaction/City!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddressInvolvedInTransaction/City"/>
															</xsl:call-template>,              
                <span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="USAddressInvolvedInTransaction/State!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddressInvolvedInTransaction/State"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<span style="width:4px;"/>
														<xsl:if test="USAddressInvolvedInTransaction/ZIPCode!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddressInvolvedInTransaction/ZIPCode"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
													</xsl:when>
													<!-- Foreign Address -->
													<xsl:otherwise>
														<xsl:if test="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/AddressLine1!=''">
															<span style="width:4px;">&nbsp;</span>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddressInvolvedInTr/AddressLine1"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="ForeignAddressInvolvedInTr/AddressLine2!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddressInvolvedInTr/AddressLine2"/>
															</xsl:call-template>,            
          <span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="ForeignAddressInvolvedInTr/City!=''">
															<span style="width:4px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddressInvolvedInTr/City"/>
															</xsl:call-template>,              
                <span class="styTableCellPad"/>
														</xsl:if>
														<xsl:if test="ForeignAddressInvolvedInTr/ProvinceOrState!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddressInvolvedInTr/ProvinceOrState"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<!-- foreign postal code -->
														<xsl:if test="ForeignAddressInvolvedInTr/Country!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddressInvolvedInTr/Country"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
														<!-- foreign country -->
														<xsl:if test="ForeignAddressInvolvedInTr/PostalCode!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignAddressInvolvedInTr/PostalCode"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<!-- filling out line under EIN-->
											<td style="width:35mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddressInvolvedInTr/xxx"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr style="width:187mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;height:8mm;"/>
										<tr style="width:187mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
											<td style="height:8mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-right:1mm;padding-top:2mm" valign="top"> Description</td>
											<td style="width:177mm;border-bottom:1 solid black;float:left:clear:none;" valign="bottom">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DescriptionOfInvolvement"/>
												</xsl:call-template>
											</td>
											<td style="width:35mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DescriptionOfInvolvementxx"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- table filler rows if I have no data (all elements are optional) or so many data that get pushed to a separated table at the end-->
								<xsl:if test="count($Form8886Data/IdentifyAllInvolvedInTr) &lt; 1 or ((count($Form8886Data/IdentifyAllInvolvedInTr) &gt;2) and ($Print = $Separated))">
									<tr style="width:187mm;">
										<td class="styLNLeftLtrBox" style="padding-top:0.5mm;text-align:left;float:left;clear:none;">a</td>
										<td class="styLNDesc" style="float:left;clear:none;">Type of entity:
          <span style="width: 5mm;"/>
											<!-- line 8 checkboxes -->
											<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;"/>
											<label style="font-size:8pt; padding-right:2mm;">
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/TaxExempt"/>
													<xsl:with-param name="BackupName">IRS8886TaxExempt</xsl:with-param>
												</xsl:call-template>
												<span style="width:2px;"/>
    Tax-exempt
     <span style="width: 5mm;"/>
											</label>
											<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;"/>
											<label style="font-size:8pt; padding-right:2mm;">
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/Foreign"/>
													<xsl:with-param name="BackupName">IRS8886Foreign</xsl:with-param>
												</xsl:call-template>
												<span style="width:2px;"/>
   Foreign
            <span style="width: 5mm;"/>
											</label>
											<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;"/>
											<label style="font-size:8pt; padding-right:2mm;">
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/Related"/>
													<xsl:with-param name="BackupName">IRS8886Related</xsl:with-param>
												</xsl:call-template>
												<span style="width:2px;"/>
     Related
            <span style="width: 5mm;"/>
											</label>
										</td>
									</tr>
									<!-- Line 8 Name and EIN -->
									<tr style="width:187mm;">
										<td style="border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;height:8mm;" valign="bottom"> Name
    </td>
										<td style="width:127mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;" valign="bottom">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/NameInvolvedInTransaction/BusinessNameLine1"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td style="width:35mm;vertical-align:top;border-color:black;border-left-width:1px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-left:2px;" valign="top">	Identifying number<br/>
											<span valign="bottom" style="padding-top:2mm;padding-left:2px;">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="xx"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
									<!-- line 8 address -->
									<tr style="width:187mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
										<td style="height:8mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-right:1mm;" valign="bottom">Address</td>
										<td style="font-family:verdana;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;" valign="bottom">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/USAddressInvolvedInTransaction/xx"/>
     </xsl:call-template>
										</td>
										<td style="width:35mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/USAddressInvolvedInTransaction/xx"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr style="width:187mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
										<td style="height:8mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-right:1mm;" valign="bottom"> Description</td>
										<td style="width:177mm;border-bottom:1 solid black;float:left:clear:none;" valign="bottom">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="xx"/>
											</xsl:call-template>
										</td>
										<!-- full length of line -->
										<td style="width:35mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/xxx"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- empty rows -->
									<tr style="width:187mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
										<td style="height:8mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-right:1mm;" valign="bottom">&nbsp;</td>
										<td style="width:177mm;border-bottom:1 solid black;float:left:clear:none;" valign="bottom">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="xx"/>
											</xsl:call-template>
										</td>
										<td style="width:35mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/xxx"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr style="width:187mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
										<td style="height:8mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-right:1mm;" valign="bottom">&nbsp;</td>
										<td style="width:177mm;border-bottom:1 solid black;float:left:clear:none;" valign="bottom">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="xx"/>
											</xsl:call-template>
										</td>
										<td style="width:35mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/xxx"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr style="width:187mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
										<td style="height:8mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-right:1mm;" valign="bottom">&nbsp;</td>
										<td style="width:177mm;border-bottom:1 solid black;float:left:clear:none;" valign="bottom">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="xx"/>
											</xsl:call-template>
										</td>
										<td style="width:35mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/xxx"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr style="width:187mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
										<td style="height:8mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-right:1mm;" valign="bottom">&nbsp;</td>
										<td style="width:177mm;border-bottom:1 solid black;float:left:clear:none;" valign="bottom">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="xx"/>
											</xsl:call-template>
										</td>
										<td style="width:35mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/xxx"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8886Data/IdentifyAllInvolvedInTr) &lt; 2 or ((count($Form8886Data/IdentifyAllInvolvedInTr) &gt;3) and ($Print = $Separated))">
									<tr style="width:187mm;">
										<td class="styLNLeftLtrBox" style="padding-top:0.5mm;text-align:left;float:left;clear:none;">b</td>
										<td class="styLNDesc" style="float:left;clear:none;">Type of entity:
          <span style="width: 5mm;"/>
											<!-- line 8 checkboxes -->
											<input type="checkbox" alt="alt" class="styCkbox" style="height: 4mm; width: 4mm;"/>
											<label style="font-size:8pt; padding-right:2mm;">
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/TaxExempt"/>
													<xsl:with-param name="BackupName">IRS8886TaxExempt</xsl:with-param>
												</xsl:call-template>
												<span style="width:2px;"/>
    Tax-exempt
     <span style="width: 5mm;"/>
											</label>
											<input type="checkbox" alt="alt" class="styCkbox" style="height: 4mm; width: 4mm;"/>
											<label style="font-size:8pt; padding-right:2mm;">
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/Foreign"/>
													<xsl:with-param name="BackupName">IRS8886Foreign</xsl:with-param>
												</xsl:call-template>
												<span style="width:2px;"/>
   Foreign
            <span style="width: 5mm;"/>
											</label>
											<input type="checkbox" alt="alt" class="styCkbox" style="height: 4mm; width: 4mm;"/>
											<label style="font-size:8pt; padding-right:2mm;">
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/Related"/>
													<xsl:with-param name="BackupName">IRS8886Related</xsl:with-param>
												</xsl:call-template>
												<span style="width:2px;"/>
     Related
            <span style="width: 5mm;"/>
											</label>
										</td>
									</tr>
									<!-- Line 8 Name and EIN -->
									<tr style="width:187mm;">
										<td style="border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;height:8mm;" valign="bottom"> Name
    </td>
										<td style="text-align:left;font-family:verdana;width:127mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;" valign="bottom">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NameInvolvedInTransaction/xx"/>
											</xsl:call-template>
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NameInvolvedInTransaction/BusinessNameLine2"/>
											</xsl:call-template>
										</td>
										<td style="width:35mm;vertical-align:top;border-color:black;border-left-width:1px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-left:2px;" valign="top">	Identifying number<br/>
											<span valign="bottom" style="padding-top:2mm;padding-left:2px;">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="xx"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
									<!-- line 8 address -->
									<tr style="width:187mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
										<td style="height:8mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-right:1mm;" valign="bottom">Address</td>
										<td style="font-family:verdana;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;" valign="bottom">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddressInvolvedInTransaction/xx"/>
											</xsl:call-template>
										</td>
										<td style="width:35mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr//xxx"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr style="width:187mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
										<td style="height:8mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-right:1mm;" valign="bottom"> Description</td>
										<td style="width:177mm;border-bottom:1 solid black;float:left:clear:none;" valign="bottom">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="xx"/>
											</xsl:call-template>
										</td>
										<td style="width:35mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/xxx"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- empty rows -->
									<tr style="width:187mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
										<td style="height:8mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-right:1mm;" valign="bottom">&nbsp;</td>
										<td style="width:177mm;border-bottom:1 solid black;float:left:clear:none;" valign="bottom">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="xx"/>
											</xsl:call-template>
										</td>
										<td style="width:35mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/xxx"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr style="width:187mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
										<td style="height:8mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-right:1mm;" valign="bottom">&nbsp;</td>
										<td style="width:177mm;border-bottom:1 solid black;float:left:clear:none;" valign="bottom">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="xx"/>
											</xsl:call-template>
										</td>
										<td style="width:35mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/xxx"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr style="width:187mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
										<td style="height:8mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;padding-right:1mm;" valign="bottom">&nbsp;</td>
										<td style="width:177mm;border-bottom:1 solid black;float:left:clear:none;" valign="bottom">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="xx"/>
											</xsl:call-template>
										</td>
										<td style="width:35mm;border-color:black;border-left-width:0px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/xxx"/>
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
          Form <b style="font-size:9pt">8886</b> (Rev. 12-2010)
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
							<xsl:with-param name="TargetNode" select="$Form8886Data/ReportableTransactionInfo/NameOfReportableTransaction/@bookTaxDifferenceIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Separated Repeating Data for Line 1a, 1b. 1c -->
					<xsl:if test="($Print = $Separated) and (count($Form8886Data/ReportableTransactionInfo) &gt;1)">
						<span class="styRepeatingDataTitle">Form 8886 Lines 1a, 1b and 1c - Reportable Transaction Information:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width: 93mm; text-align: left; height:8mm; padding-top: 2.5mm;">
										<b>1a Name of reportable transaction</b>
									</th>
									<th class="styDepTblCell" scope="col" style="width: 93mm; text-align: left; height:8mm; padding-top: 2.5mm;">
										<b>1b Initial year participated in transaction</b>
									</th>
									<th class="styDepTblCell" scope="col" style="width: 93mm; text-align: left; height:8mm; padding-top: 2.5mm;">
										<b>1c Reportable transaction or tax shelter registration number (9 digits or 11 digits)</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8886Data/ReportableTransactionInfo">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td style="clear:left; float:left; padding-left:6mm; width:91mm; border-style: solid; border-color: black; border-top-width: 0px; border-left-width: 	0px; border-right-width: 1px; border-bottom-width:1px; padding-top:0mm; height:8mm; text-align: left">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NameOfReportableTransaction"/>
											</xsl:call-template>
										</td>
										<td style="float:left; text-align:center; width:91mm; height:8mm; padding-top:2mm; border-bottom:1 solid black">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InitialYearParticipated"/>
											</xsl:call-template>
										</td>
										<td style="float:left; text-align:center; width:91mm; height:8mm; padding-top:2mm; border-bottom:1 solid black;border-left:1 solid black;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransactionOrTaxShelterNumber"/>
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
						<table class="styDepTbl" style="font-size:7pt;">
							<thead/>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8886Data/TypeOfEntityInformation">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td>
											<div class="styGenericDiv" style="width:100%;font-weight:bold;padding-left:2mm;text-align:left;">a
                     <span style="padding-left:2.5mm;font-weight:normal;">Type of entity:</span>
												<span style="width:5mm;"/>
												<!-- Partnership  checkbox -->
												<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="Partnership"/>
													</xsl:call-template>
												</input>
												<span style="width:4px;"/>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="Partnership"/>
													</xsl:call-template>
													<span style="width:3mm;text-align:right;font-weight:normal;">Partnership</span>
												</label>
												<span style="width:4mm;"/>
												<!--S corporation  checkbox -->
												<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="SCorporation"/>
													</xsl:call-template>
												</input>
												<span style="width:4px;"/>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="SCorporation"/>
													</xsl:call-template>
													<span style="width:5px;text-align:left;font-weight:normal;padding-left:0px;">S&nbsp;corporation</span>
												</label>
												<span style="width:4mm;"/>
												<!--Trust  checkbox -->
												<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="Trust"/>
													</xsl:call-template>
												</input>
												<span style="width:4px;"/>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="Trust"/>
													</xsl:call-template>
													<span style="width:3mm;text-align:left;font-weight:normal;">Trust</span>
												</label>
												<span style="width:4mm;"/>
												<!-- Foreign  checkbox -->
												<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="Foreign"/>
													</xsl:call-template>
												</input>
												<span style="width:4px;"/>
												<label style="padding-top:2mm;">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="Foreign"/>
													</xsl:call-template>
													<span style="width:3mm;text-align:left;font-weight:normal;border-left-width:0px;">Foreign</span>
												</label>
											</div>
											<div class="styGenericDiv" style="width:187mm;font-weight:normal;"/>
											<div class="styGenericDiv" style="width:100%;padding-left:2mm;text-align:left;">
												<b>b</b>
												<span style="padding-left:2.5mm;font-weight:normal;">Name:</span>
												<span style="width:3.2mm;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<span style="width:16mm"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2"/>
												</xsl:call-template>
											</div>
											<div class="styGenericDiv" style="width:187mm;font-weight:normal"/>
											<div class="styGenericDiv" style="width:100%;padding-left:2mm;text-align:left;">
												<b>c</b>
												<span style="padding-left:2.5mm;font-weight:normal;">Employer identification number (EIN), if known:</span>
												<span style="width:5mm;"/>
												<xsl:choose>
													<xsl:when test="EntityEIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EntityEIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReason"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</div>
											<div class="styGenericDiv" style="width:187mm;font-weight:normal"/>
											<div class="styGenericDiv" style="width:100%;padding-left:2mm;text-align:left;">
												<b>d</b>
												<span style="padding-left:2.5mm;font-weight:normal;">Date Schedule K-1 received from entity:</span>
												<span style="width:5mm;"/>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="ScheduleK1ReceivedDate"/>
												</xsl:call-template>
											</div>
											<div class="styGenericDiv" style="width:187mm"/>
										</td>
									</tr>
								</xsl:for-each>
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
									<tr class="styDepTblHdr" style="width:187mm;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:6mm;float:left;font-weight:bold;padding-left:2mm;" rowspan="3" valign="top">
											<xsl:number value="position()" format="a"/>
										</td>
										<td class="styDepTblCell" style="width:93mm;padding-left:3px;text-align:left;">Name
                        <br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NameOfPersonYouPaidFee"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:48mm;padding-left:3px;text-align:left;font-weight:normal;">Identifying number (if known)
                            <br/>
											<span valign="center">
												<xsl:choose>
													<xsl:when test="SSNNumberPersonPaidFee">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SSNNumberPersonPaidFee"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="EINNumberPersonPaidFee">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EINNumberPersonPaidFee"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonPersonPaidFee"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:40mm;padding-left:3px;text-align:left;border-bottom-width:1px;">Fees paid
                            <br/>
                              $ <span style="width:4mm;"/>
											<span style="text-align:right;width:32mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FeesPaid"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
									<!-- Line 6 Row 2 street address -->
									<tr class="styDepTblHdr" style="width:187mm;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:181mm;padding-left:3px;text-align:left;" colspan="3">Number, street, and room or suite no.
                        <br/>
											<!-- A Choice of US or Foreign Street Address-->
											<xsl:choose>
												<!-- US Street Address -->
												<xsl:when test="USAddressPersonPaidFee">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddressPersonPaidFee/AddressLine1"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddressPersonPaidFee/AddressLine2"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</xsl:when>
												<xsl:otherwise>
													<!-- Foreign Street Address -->
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddressPersonPaidFee/AddressLine1"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddressPersonPaidFee/AddressLine2"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</xsl:otherwise>
											</xsl:choose>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 6 Row 3 City or town, state, and ZIP code -->
									<tr class="styDepTblHdr" style="width:187mm;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:181mm;padding-left:3px;text-align:left;;" colspan="3">City or town, state, and ZIP code<br/>
											<!-- A choice of US or Foreign -->
											<xsl:choose>
												<!-- US -->
												<xsl:when test="USAddressPersonPaidFee">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddressPersonPaidFee//City"/>
													</xsl:call-template>,
		                    <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddressPersonPaidFee//State"/>
													</xsl:call-template>&nbsp;
		                    <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddressPersonPaidFee//ZIPCode"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</xsl:when>
												<xsl:otherwise>
													<!-- Foreign Street Address -->
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddressPersonPaidFee/City"/>
													</xsl:call-template>,
		                    <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddressPersonPaidFee/ProvinceOrState"/>
													</xsl:call-template>
													<span style="width:2px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddressPersonPaidFee/PostalCode"/>
													</xsl:call-template>
													<span style="width:2px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddressPersonPaidFee/Country"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
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
						<table class="styDepTbl" cellspacing="0" cellpadding="0" border="0" style="font-size:7pt;float:none;clear:both;">
							<tbody>
								<xsl:for-each select="$Form8886Data/IdentifyAllInvolvedInTr">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td>
											<div class="styGenericDiv" style="width:100%;font-weight:bold;padding-left:2mm;text-align:left;" valign="bottom">
												<xsl:number value="position()" format="a"/>
												<span style="padding-left:2.5mm;font-weight:normal;vertical-align:bottom;padding-bottom:0px;padding-top:1mm" valign="bottom">Type of entity:   			 </span>
												<span style="width:5mm;"/>
												<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/TaxExempt"/>
														<xsl:with-param name="BackupName">IRS8886TaxExempt</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:4px"/>
												<label style="padding-right:2mm;font-weight:normal">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/TaxExempt"/>
														<xsl:with-param name="BackupName">IRS8886TaxExempt</xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
    Tax-exempt
     <span style="width: 5mm;"/>
												</label>
												<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/Foreign"/>
														<xsl:with-param name="BackupName">IRS8886Foreign</xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="padding-right:2mm;font-weight:normal">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/Foreign"/>
														<xsl:with-param name="BackupName">IRS8886Foreign</xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
           Foreign
            <span style="width: 5mm;"/>
												</label>
												<input type="checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/Related"/>
														<xsl:with-param name="BackupName">IRS8886Related</xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="padding-right:2mm;font-weight:normal">
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/Related"/>
														<xsl:with-param name="BackupName">IRS8886Related</xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
           Related
            <span style="width: 5mm;"/>
												</label>
											</div>
											<div class="styGenericDiv" style="width:187mm;font-weight:normal;"/>
											<div class="styBB" style="width:100%;padding-left:2mm;text-align:left;vertical-align:bottom;" valign="bottom">Name

   <span style="padding-left:0px;font-weight:normal;text-align:left;vertical-align:bottom" valign="bottom">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameInvolvedInTransaction/BusinessNameLine1"/>
													</xsl:call-template>,
                                 <span style="width:2px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameInvolvedInTransaction/BusinessNameLine2"/>
													</xsl:call-template>
													<span style="width:40mm;"/>
													<span style="width:35mm;vertical-align:top;border-color:black;border-left-width:1px;border-style:solid;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;padding-left:2px;" valign="top">Identifying number<br/>
														<xsl:choose>
															<xsl:when test="normalize-space(SSNNumberInvolvedInTransaction)">
																<xsl:call-template name="PopulateSSN">
																	<xsl:with-param name="TargetNode" select="SSNNumberInvolvedInTransaction"/>
																</xsl:call-template>
																<span style="width: 2px"/>
															</xsl:when>
															<xsl:when test="normalize-space(EINNumberInvolvedInTransaction)">
																<xsl:call-template name="PopulateEIN">
																	<xsl:with-param name="TargetNode" select="EINNumberInvolvedInTransaction"/>
																</xsl:call-template>
																<span style="width: 2px"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="MissingEINReasonInvolvedInTr"/>
																</xsl:call-template>
																<span style="width: 2px"/>
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</span>
											</div>
											<div class="styBB" style="width:100%;padding-left:2mm;text-align:left;padding-top:2mm;vertical-align:bottom;padding-bottom:0px;vertical-align:bottom;" valign="bottom">Address
   <span style="padding-left:2.5mm;font-weight:normal;text-align:left;">
													<xsl:choose>
														<xsl:when test="USAddressInvolvedInTransaction">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddressInvolvedInTransaction/AddressLine1"/>
															</xsl:call-template>,            
       <span class="styTableCellPad"/>
															<xsl:if test="USAddressInvolvedInTransaction/AddressLine2!=''">
																<span style="width:4px;"/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="USAddressInvolvedInTransaction/AddressLine2"/>
																</xsl:call-template>,            
              <span class="styTableCellPad"/>
															</xsl:if>
															<xsl:if test="USAddressInvolvedInTransaction/City!=''">
																<span style="width:4px;"/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="USAddressInvolvedInTransaction/City"/>
																</xsl:call-template>,              
                <span class="styTableCellPad"/>
															</xsl:if>
															<xsl:if test="USAddressInvolvedInTransaction/State!=''">
																<span style="width:4px;"/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="USAddressInvolvedInTransaction/State"/>
																</xsl:call-template>
																<span class="styTableCellPad"/>
															</xsl:if>
															<span style="width:4px;"/>
															<xsl:if test="USAddressInvolvedInTransaction/ZIPCode!=''">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="USAddressInvolvedInTransaction/ZIPCode"/>
																</xsl:call-template>
																<span class="styTableCellPad"/>
															</xsl:if>
														</xsl:when>
														<xsl:otherwise>
															<xsl:if test="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/AddressLine1!=''">
																<br/>
																<span style="width:4px;"/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/AddressLine1"/>
																</xsl:call-template>,            
              <span class="styTableCellPad"/>
															</xsl:if>
															<xsl:if test="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/AddressLine2!=''">
																<br/>
																<span style="width:4px;"/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/AddressLine2"/>
																</xsl:call-template>,            
              <span class="styTableCellPad"/>
															</xsl:if>
															<xsl:if test="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/City!=''">
																<br/>
																<span style="width:4px;"/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/City"/>
																</xsl:call-template>,              
                <span class="styTableCellPad"/>
															</xsl:if>
															<xsl:if test="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/ProvinceOrState!=''">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/ProvinceOrState"/>
																</xsl:call-template>
																<span class="styTableCellPad"/>
															</xsl:if>
															<xsl:if test="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/PostalCode!=''">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/PostalCode"/>
																</xsl:call-template>
																<span class="styTableCellPad"/>
															</xsl:if>
															<xsl:if test="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/Country!=''">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8886Data/IdentifyAllInvolvedInTr/ForeignAddressInvolvedInTr/Country"/>
																</xsl:call-template>
																<span class="styTableCellPad"/>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
											<div class="styGenericDiv" style="width:187mm;font-weight:normal;"/>
											<div class="styBB" style="width:100%;padding-left:2mm;text-align:left;vertical-align:bottom">Description
   <span style="padding-left:2.5mm;font-weight:normal;text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DescriptionOfInvolvement"/>
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
								<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/NameOfPersonYouPaidFee"/>
							</xsl:call-template>
						</td>
						<td class="styIRS8886TblRB" style="height:8mm; border-right:0; border-bottom:0 solid black; padding-left:2mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/USAddressPersonPaidFee/AddressLine1"/>
							</xsl:call-template>
							<xsl:if test="normalize-space($Form8886Data/PersonsYouPaidAFeeInfo[$index]/USAddressPersonPaidFee/AddressLine2)!=''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/USAddressPersonPaidFee/AddressLine2"/>
								</xsl:call-template>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="styIRS8886TblRB" style="border-right:0; height:8mm; padding-left:2mm">
							<xsl:if test="$Form8886Data/PersonsPromotedYourPrtcpt[$index]/USAddressPersonPaidFee">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/USAddressPersonPaidFee/City"/>
								</xsl:call-template>,
		          <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/USAddressPersonPaidFee/State"/>
								</xsl:call-template>&nbsp;
		          <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/USAddressPersonPaidFee/ZIPCode"/>
								</xsl:call-template>
							</xsl:if>&nbsp;
		        <!-- foreign address -->
							<xsl:if test="$Form8886Data/PersonsPromotedYourPrtcpt[$index]/ForeignAddressPersonPaidFee">
								<td class="styIRS8886TblRB" style="height:8mm; border-right:0; border-bottom:0 solid black; padding-left:2mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/ForeignAddressPersonPaidFee/AddressLine1"/>
									</xsl:call-template>
									<xsl:if test="normalize-space($Form8886Data/PersonsYouPaidAFeeInfo[$index]/USAddressPersonPaidFee/AddressLine2)!=''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/ForeignAddressPersonPaidFee/AddressLine2"/>
										</xsl:call-template>
									</xsl:if>
								</td>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/ForeignAddressPersonPaidFee/City"/>
								</xsl:call-template>,
		      <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/ForeignAddressPersonPaidFee/ProvinceOrState"/>
								</xsl:call-template>&nbsp;
		      <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/ForeignAddressPersonPaidFee/Country"/>
								</xsl:call-template>&nbsp;
		        <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/ForeignAddressPersonPaidFee/PostalCode"/>
								</xsl:call-template>
							</xsl:if>&nbsp;
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
							<xsl:with-param name="TargetNode" select="$Form8886Data/PersonsYouPaidAFeeInfo[$index]/NameOfPersonYouPaidFee"/>
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
						<span style="width: 50mm"/>&nbsp;
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
						<span style="width: 50mm"/>&nbsp;
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
						<span style="width: 50mm"/>&nbsp;
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
						<span style="width: 50mm"/>&nbsp;
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
						<span style="width: 50mm"/>&nbsp;
		      </td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- line 5 -->
	<xsl:template name="Line5RowGenerator">
		<xsl:param name="pos"/>
		<tr style="width:187mm;height:4.5mm;border-bottom-width:0px;">
			<td class="styTableCell" style="font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;width:6mm;padding-top:0.5mm;border-bottom-width:0px;border-right-width:0px;" valign="top">a</td>
			<td class="styLNDesc" style="float:left;border-bottom-width:0px;border-left-width:0px;width:50mm" valign="top">Type of entity:</td>
			<td class="styTableCell" style="border-right:1 solid black;text-align:left;border-bottom-width:0px;border-right-width:1px;padding-left:1mm;padding-right:1mm;width:50mm;">
				<!-- Partnership  checkbox column 1-->
				<input type="checkbox" name="Checkbox" alt="alt" class="styCkbox" style="height: 4mm; width: 4mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/Partnership"/>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="Partnership"/>
					</xsl:call-template>
					<span style="width:3mm;text-align:right;font-weight:normal;">Partnership</span>
				</label>
				<span style="width:12mm;"/>
				<input type="checkbox" name="Checkbox" alt="alt" class="styCkbox" style="height: 4mm; width: 4mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/Trust"/>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="Trust"/>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;">Trust</span>
				</label>
			</td>
			<!-- Partnership  checkbox right column-->
			<td class="styTableCell" style=";text-align:left;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;padding-left:1mm;padding-right:1mm;width:50mm;">
				<input type="checkbox" name="Checkbox" alt="alt" class="styCkbox" style="height: 4mm; width: 4mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=($pos+1)]/Partnership"/>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="Partnership"/>
					</xsl:call-template>
					<span style="width:3mm;text-align:right;font-weight:normal;;">Partnership</span>
				</label>
				<span style="width:12mm;"/>
				<input type="checkbox" name="Checkbox" alt="alt" class="styCkbox" style="height: 4mm; width: 4mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos+1]/Trust"/>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="Trust"/>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;">Trust</span>
				</label>
			</td>
		</tr>
		<!--second row S corporation  checkbox column 1-->
		<tr style="width:187mm;height:4mm;border-bottom-width:0px;">
			<td class="styTableCell" style="padding-left:3mm;text-align:left;font-size:7pt;width:6mm;padding-top:0.5mm;border-bottom-width:0px;" valign="top"/>
			<td class="styLNDesc" style="float:left;width:50mm" valign="top"/>
			<td class="styTableCell" style="border-right:1 solid black;text-align:left;border-bottom-width:0px;border-right-width:1px;padding-left:1mm;padding-right:1mm;width:52mm;">
				<input type="checkbox" name="Checkbox" alt="alt" class="styCkbox" style="height: 4mm; width: 4mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/SCorporation"/>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="SCorporation"/>
					</xsl:call-template>
					<span style="width:5px;text-align:left;font-weight:normal;padding-left:0px;">S&nbsp;corporation</span>
				</label>
				<span style="width:8.75mm;"/>
				<input type="checkbox" name="Checkbox" alt="alt" class="styCkbox" style="height: 4mm; width: 4mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/Foreign"/>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label style="padding-top:2mm;">
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="Foreign"/>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;border-left-width:0px;">Foreign</span>
				</label>
			</td>
			<!--S corporation  checkbox right column-->
			<td class="styTableCell" style="border-right:1 solid black;text-align:left;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;padding-left:1mm;padding-right:1mm;width:52mm;">
				<input type="checkbox" name="Checkbox" alt="alt" class="styCkbox" style="height: 4mm; width: 4mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=($pos+1)]/SCorporation"/>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="SCorporation"/>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;padding-left:0px;">S&nbsp;corporation</span>
				</label>
				<span style="width:8.75mm;"/>
				<input type="checkbox" name="Checkbox" alt="alt" class="styCkbox" style="height: 4mm; width: 4mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos+1]/Foreign"/>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label style="padding-top:2mm;">
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="Foreign"/>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;border-left-width:0px;">Foreign</span>
				</label>
			</td>
		</tr>
		<!--Trust  checkbox -->
		<!--		<tr style="width:187mm;height:4mm;border-bottom-width:0px;">
			<td class="styTableCell" style="padding-left:3mm;text-align:left;font-size:7pt;width:6mm;padding-top:0.5mm;border-bottom-width:0px;" valign="top"/>
			<td class="styLNDesc" style="float:left;width:50mm;" valign="top"/>
			<td class="styTableCell" style="border-right:1 solid black;text-align:left;border-bottom-width:0px;border-right-width:1px;padding-left:17mm;padding-right:17mm">
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/Trust"/>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="Trust"/>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;">Trust</span>
				</label>
			</td>   -->
		<!--Trust  checkbox right-->
		<!--			<td class="styTableCell" style="text-align:left;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;padding-left:17mm;padding-right:17mm;">
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=($pos+1)]/Trust"/>
					</xsl:call-template>
				</input>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="Trust"/>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;">Trust</span>
				</label>
			</td>      -->
		<!-- Foreign  checkbox -->
		<!--			<tr style="width:187mm;height:4mm;border-bottom-width:0px;">
				<td class="styTableCell" style="border-left-width:0px;padding-left:3mm;text-align:left;font-size:7pt;width:6mm;padding-top:0.5mm;border-bottom-width:0px;" valign="top"/>
				<td class="styLNDesc" style="float:left;width:50mm" valign="top"/>
				<td class="styTableCell" style="border-right:1 solid black;text-align:left;border-bottom-width:0px;padding-left:17mm;padding-right:17mm">
					<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/Foreign"/>
						</xsl:call-template>
					</input>
					<span style="width:4px;"/>
					<label style="padding-top:2mm;">
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="Foreign"/>
						</xsl:call-template>
						<span style="width:3mm;text-align:left;font-weight:normal;border-left-width:0px;">Foreign</span>
					</label>
				</td>      -->
		<!-- Foreign  checkbox right-->
		<!--				<td class="styTableCell" style="text-align:left;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;padding-left:17mm;padding-right:17mm">
					<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=($pos+1)]/Foreign"/>
						</xsl:call-template>
					</input>
					<span style="width:4px;"/>
					<label style="padding-top:2mm;">
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="Foreign"/>
						</xsl:call-template>
						<span style="width:3mm;text-align:left;font-weight:normal;">Foreign</span>
					</label>
				</td>
			</tr>      -->
		<!-- line 5b name-->
		<tr style="width:187mm;border-bottom-width:0px;">
			<td class="styTableCell" style="font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;width:6mm;padding-top:0.5mm;border-bottom-width:0px;border-right-width:0px;" valign="top">b</td>
			<td class="styLNDesc" style="float:left;border-bottom-width:0px;border-left-width:0px;width:55mm" valign="top">Name
<!-- dotted line -->
				<span class="styDotLn" style="float:none">.........</span>
				<span style="width:3px"/>
				<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
				<td style="float:left;clear:none;border-bottom:1 solid black; text-align:left;border-right-width:1px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;width:45mm; ">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/EntityName/BusinessNameLine1"/>
					</xsl:call-template>
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/EntityName/BusinessNameLine2"/>
					</xsl:call-template>
				</td>
				<td style="float:left;clear:none;border-bottom:1 solid black;  text-align:left;border-right-width:0px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;padding-left:2px;width:45mm;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos+1]/EntityName/BusinessNameLine1"/>
					</xsl:call-template>
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos+1]/EntityName/BusinessNameLine2"/>
					</xsl:call-template>
				</td>
			</td>
		</tr>
		<!-- line 5c EIN -->
		<tr style="width:187mm;border-bottom-width:0px;">
			<td class="styTableCell" style="font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;width:2mm;padding-top:0.5mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;" valign="top">c</td>
			<td class="styLNDesc" style="padding-top:.5mm;float:left;clear:none;border-left-width:0px;width:55mm" valign="top">Employer identification number (EIN), if known    
			 <span class="styDotLn" style="float:none">.....  </span>
				<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
				<td style="width:45mm;border-bottom:1 solid black; text-align:left; float:left;clear:none;border-right-width:1px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:8mm;padding-top:4mm;padding-left:1mm">
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/EntityEIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/EntityEIN"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/MissingEINReason">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/MissingEINReason"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
				<td style="width:45mm;border-bottom:1 solid black; text-align:left; float:left;clear:none;border-right-width:0px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:8mm;padding-top:4mm;padding-left:1mm;">
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/EntityEIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=($pos+1)]/EntityEIN"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/MissingEINReason">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=($pos+1)]/MissingEINReason"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
			</td>
		</tr>
		<!-- line 5d date -->
		<tr style="width:187mm;border-bottom-width:0px;height:12mm">
			<td class="styTableCell" style="border-left-width:0px;font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;width:2mm;padding-top:0.5mm;border-bottom-width:0px;border-right-width:0px;" valign="top">d</td>
			<td class="styLNDesc" style="height:12mm;padding-top:.5mm;float:left;clear:none;border-left-width:0px;width:55mm" valign="top">
		              Date Schedule K-1 received from entity (enter “none” if Schedule K-1 not received)
   	<span class="styDotLn" style="float:none">......</span>
				<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
				<td style="border-bottom:1 solid black; text-align:center;float:left;clear:none;border-right-width:1px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:12mm;padding-top:8mm;;width:45mm; ">
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/ScheduleK1ReceivedDate">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/ScheduleK1ReceivedDate"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/NoScheduleK1Received">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos]/NoScheduleK1Received"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
				</td>
				<td style="border-bottom:1 solid black; text-align:center;float:left;clear:none;border-right-width:0px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:12.75mm;padding-top:8mm;width:45mm; ">
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/ScheduleK1ReceivedDate">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos+1]/ScheduleK1ReceivedDate"/>
						</xsl:call-template>
					</xsl:if>
					<span class="styTableCellPad"/>
					<xsl:if test="$Form8886Data/TypeOfEntityInformation/NoScheduleK1Received">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form8886Data/TypeOfEntityInformation[position()=$pos+1]/NoScheduleK1Received"/>
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
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Line5EmptyTable">
		<tr style="width:187mm;height:4.5mm;border-bottom-width:0px;">
			<td class="styTableCell" style="font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;width:6mm;padding-top:0.5mm;border-bottom-width:0px;border-right-width:0px;" valign="top">a</td>
			<td class="styLNDesc" style="float:left;border-bottom-width:0px;border-left-width:0px;width:50mm" valign="top">Type of entity: <span style="width: 3mm"/>See Add'l Data </td>
			<td class="styTableCell" style="border-right:1 solid black;text-align:left;border-bottom-width:0px;border-right-width:1px;padding-left:17mm;padding-right:16mm;">
				<!-- Partnership  checkbox column 1-->
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;"/>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="Partnership"/>
					</xsl:call-template>
					<span style="width:3mm;text-align:right;font-weight:normal;">Partnership</span>
				</label>
			</td>
			<!-- Partnership  checkbox right column-->
			<td class="styTableCell" style=";text-align:left;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;padding-left:17mm;padding-right:16mm;">
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;"/>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="Partnership"/>
					</xsl:call-template>
					<span style="width:3mm;text-align:right;font-weight:normal;;">Partnership</span>
				</label>
			</td>
		</tr>
		<!--second row S corporation  checkbox column 1-->
		<tr style="width:187mm;height:4mm;border-bottom-width:0px;">
			<td class="styTableCellPad" style="padding-left:3mm;text-align:left;font-size:7pt;width:6mm;padding-top:0.5mm;border-bottom-width:0px;" valign="top"/>
			<td class="styLNDesc" style="float:left;width:50mm" valign="top"/>
			<td class="styTableCell" style="border-right:1 solid black;text-align:left;border-bottom-width:0px;border-right-width:1px;padding-left:17mm;">
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;"/>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="SCorporation"/>
					</xsl:call-template>
					<span style="width:3px;text-align:left;font-weight:normal;padding-left:0px;">S&nbsp;corporation</span>
				</label>
			</td>
			<!--S corporation  checkbox right column-->
			<td class="styTableCell" style="border-right:1 solid black;text-align:left;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;padding-left:17mm;padding-right:10mm">
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;"/>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="SCorporation"/>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;padding-left:0px;">S&nbsp;corporation</span>
				</label>
			</td>
		</tr>
		<!--Trust  checkbox -->
		<tr style="width:187mm;height:4mm;border-bottom-width:0px;">
			<td class="styTableCellPad" style="padding-left:3mm;text-align:left;font-size:7pt;width:6mm;padding-top:0.5mm;border-bottom-width:0px;" valign="top"/>
			<td class="styLNDesc" style="float:left;width:50mm;" valign="top"/>
			<td class="styTableCell" style="border-right:1 solid black;text-align:left;border-bottom-width:0px;border-right-width:1px;padding-left:17mm;padding-right:17mm">
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;"/>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="Trust"/>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;">Trust</span>
				</label>
			</td>
			<!--Trust  checkbox right-->
			<td class="styTableCell" style="text-align:left;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;padding-left:17mm;padding-right:17mm;">
				<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;"/>
				<span style="width:4px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="Trust"/>
					</xsl:call-template>
					<span style="width:3mm;text-align:left;font-weight:normal;">Trust</span>
				</label>
			</td>
			<!-- Foreign  checkbox -->
			<tr style="width:187mm;height:4mm;border-bottom-width:px;">
				<td class="styTableCellPad" style="border-left-width:0px;padding-left:3mm;text-align:left;font-size:7pt;width:6mm;padding-top:0.5mm;border-bottom-width:0px;" valign="top"/>
				<td class="styLNDesc" style="float:left;width:50mm" valign="top"/>
				<td class="styTableCell" style="border-right:1 solid black;text-align:left;border-bottom-width:0px;padding-left:17mm;padding-right:17mm">
					<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;"/>
					<span style="width:4px;"/>
					<label style="padding-top:2mm;">
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="Foreign"/>
						</xsl:call-template>
						<span style="width:3mm;text-align:left;font-weight:normal;border-left-width:0px;">Foreign</span>
					</label>
				</td>
				<!-- Foreign  checkbox right-->
				<td class="styTableCell" style="text-align:left;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;padding-left:17mm;padding-right:17mm">
					<input type="checkbox" name="Checkbox" class="styCkbox" style="height: 4mm; width: 4mm;"/>
					<span style="width:4px;"/>
					<label style="padding-top:2mm;">
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="Foreign"/>
						</xsl:call-template>
						<span style="width:3mm;text-align:left;font-weight:normal;">Foreign</span>
					</label>
				</td>
			</tr>
			<!-- line 5b name-->
			<tr style="width:187mm;border-bottom-width:0px;">
				<td class="styTableCell" style="font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;width:6mm;padding-top:0.5mm;border-bottom-width:0px;border-right-width:0px;" valign="top">b</td>
				<td class="styLNDesc" style="float:left;border-bottom-width:0px;border-left-width:0px;width:55mm" valign="top">Name
<!-- dotted line -->
					<span class="styDotLn" style="float:none">.........</span>
					<span style="width:3px"/>
					<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
					<td style="float:left;clear:none;border-bottom:1 solid black; text-align:left;border-right-width:1px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;width:45mm; ">
						<span class="styTableCellPad"/>
					</td>
					<td style="float:left;clear:none;border-bottom:1 solid black;  text-align:left;border-right-width:0px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;padding-left:2px;width:45mm;">
						<span class="styTableCellPad"/>
					</td>
				</td>
			</tr>
			<!-- line 5c EIN -->
			<tr style="width:187mm;border-bottom-width:0px;">
				<td class="styTableCell" style="font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;width:2mm;padding-top:0.5mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;" valign="top">c</td>
				<td class="styLNDesc" style="padding-top:.5mm;float:left;clear:none;border-left-width:0px;width:55mm" valign="top">Employer identification number (EIN), if known    
			 <span class="styDotLn" style="float:none">.....  </span>
					<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
					<td style="width:45mm;border-bottom:1 solid black; text-align:left; float:left;clear:none;border-right-width:1px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:8mm;padding-top:4mm;padding-left:1mm">
						<span class="styTableCellPad"/>
					</td>
					<td style="width:45mm;border-bottom:1px; text-align:left; float:left;clear:none;border-right-width:0px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:8mm;padding-top:4mm;padding-left:1mm;">
						<span class="styTableCellPad"/>
					</td>
				</td>
			</tr>
			<!-- line 5d date -->
			<tr style="width:187mm;border-bottom-width:0px;height:12mm">
				<td class="styTableCell" style="border-left-width:0px;font-weight:bold;padding-left:3mm;text-align:left;font-size:7pt;width:2mm;padding-top:0.5mm;border-bottom-width:0px;border-right-width:0px;" valign="top">d</td>
				<td class="styLNDesc" style="height:12mm;padding-top:.5mm;float:left;clear:none;border-left-width:0px;width:55mm" valign="top">
		              Date Schedule K-1 received from entity (enter “none” if Schedule K-1 not received)
   	<span class="styDotLn" style="float:none">......</span>
					<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
				</td>
				<td style=" text-align:center;float:left;clear:none;border-right-width:1px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:12mm;padding-top:8mm;;width:45mm; solid black;border-bottom:1 mm">
					<span class="styTableCellPad"/>
				</td>
				<td style="border-bottom-width:1px; text-align:center;float:left;clear:none;border-right-width:0px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;height:12.75mm;padding-top:8mm;width:45mm; ">
					<span class="styTableCellPad"/>
				</td>
			</tr>
		</tr>
	</xsl:template>
</xsl:stylesheet>
