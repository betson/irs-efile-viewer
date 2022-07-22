<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8858ScheduleMStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="Form8858Data" select="$RtnDoc/IRS8858"/>
	<xsl:param name="Form8858SchMData" select="$RtnDoc/IRS8858ScheduleM"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8858SchMData)"/>
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
				<meta name="Description" content="Form IRS8824"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--EXCEPTION:  If Controlled Foreign Partnership checked box is checked then column b-e (line 1-19) must be present.
                                  If Controlled Foreign Corporation checked box is checked then column b-f (line 1-19) must be present.  -->
					<!--<xsl:if test="not($Print) or $Print=''">-->
						<xsl:call-template name="IRS8858ScheduleMStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					<!--</xsl:if>-->
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8824">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:29mm;height:18mm;">
							<span class="styFormNumber" style="font-size:9pt;">SCHEDULE M <br/> (Form 8858)</span>
							<br/>(Rev. December 2012)
              <!--General Dependency Push Pin -->
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
								<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8858SchMData"/>
							</xsl:call-template>
						</div>
						<div class="styFTBox" style="width:131mm;height:18mm;">
							<div class="styMainTitle">
           	Transactions Between Foreign Disregarded Entity of a<br/>
Foreign Tax Owner and the Filer or Other Related Entities           
          </div>
							<div class="styFST" style="font-size:7pt">
								<img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="bullet image"/>
            Attach to Form 8858.
              </div>
            <br/>
          <div style="text-align:left">  
        <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
             Information about Schedule M (Form 8858) and its separate instructions is at 
<a href="http://www.irs.gov/form8858">
             <i>www.irs.gov/form8858.</i></a>
			 </div>
						</div>
						<div class="styTYBox" style="width:27mm;height:18mm;">
							<div class="styOMB" style="padding-top:6mm;border-bottom:0px;">
            OMB No. 1545-1910
          </div>
						</div>
					</div>
					<!-- Names and ID's -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:144mm;height:9mm;font-size:7pt;">
           Name of person filing Form 8858<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8858SchMData/FilerName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8858SchMData/FilerName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:42mm;height:9mm;padding-left:2mm;font-size:7pt;">
            Identifying number<br/>
							<br/>
							<xsl:if test="$Form8858SchMData/FilerSSN !=' '">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/FilerSSN"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:if test="$Form8858SchMData/FilerEIN !=' '">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/FilerEIN"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:if test="$Form8858SchMData/MissingEINReasonCd !=' '">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/MissingEINReasonCd"/>
									</xsl:call-template>
								</span>
							</xsl:if>
						</div>
					</div>
					<!-- End of Names and ID's -->
					<!--  Foreign disregarded entity -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:62mm;height:15mm;font-size:7pt;">
           Name of foreign disregarded entity<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignDisregardedEntityName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignDisregardedEntityName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styNameBox" style="width:47mm;height:15mm;padding-left:2mm;font-size:7pt;">
            U.S. identifying number, if any<br/>
							<br/>
							<xsl:if test="$Form8858SchMData/ForeignCorporationEIN !=' '">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorporationEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Form8858SchMData/MissingForeignCorpEINReasonCd !=' '">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8858SchMData/MissingForeignCorpEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<xsl:choose>
							<xsl:when test="((count($Form8858SchMData/ForeignEntityIdentificationGrp) &gt; 1)) ">
								<div class="styEINBox" style="width:78mm;height:15mm;padding-left:2mm;font-size:7pt;font-weight:normal">
            Reference ID number (see instructions)
										<br/>
									<br/>See Additional Data Table
										</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styEINBox" style="width:78mm;height:10mm;padding-left:2mm;font-size:7pt;font-weight:normal;">
            Reference ID number (see instructions)
			<br/>
									<span style="font-size:8px;">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<!--  END Foreign disregarded entity -->
					<!--  Tax owner -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:94mm;height:15mm;font-size:7pt;">
           Name of tax owner<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8858SchMData/TaxOwnerName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8858SchMData/TaxOwnerName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:93mm;height:15mm;padding-left:2mm;font-size:7pt;font-weight:normal;">
            U.S. identifying number, if any<br/>
							<br/>
							<span style="width: 5mm;"/>
						</div>
					</div>
					<!--  END Tax owner -->
					<div class="styBB" style="width:187mm;">
						<div style="padding-top:1.5mm;text-align:justify;">
							<span class="styBoldText" style="display:inline;">Important:</span>
							<span class="styItalicText" style="display:inline;">  Complete a <span class="styBoldText" style="display:inline;">separate</span> Schedule M for each foreign disregarded entity for which the tax owner is a controlled foreign
corporation or controlled foreign partnership. Enter the totals for each type of transaction that occurred during the annual accounting
period between the foreign disregarded entity and the persons listed in the applicable columns (b) through (f). All amounts must be
stated in U.S. dollars translated from functional currency at the appropriate exchange rate for the foreign disregarded entity’s tax
year (see instructions).  </span>
						</div>
						<div style="padding-top:1.5mm;">
							<span style="float:left">
		Enter the relevant functional currency and the exchange rate used throughout this schedule <img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="bullet image"/>
								<span style="width:6px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8858SchMData/FunctionalCurrencyDesc"/>
								</xsl:call-template>
							</span>
							<span style="width:4mm;" />
							<span style="float:right;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8858SchMData/ExchangeRt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div style="padding-top:.5mm;padding-bottom:.5mm;">
							<b>Column Headings.</b> This schedule contains two sets of column headings. Check the box that identifies the status of the tax
owner and complete lines 1 through 19 with respect to the applicable set of column headings:	
	</div>
					</div>
					<div style="width:187mm">
					<table cellpadding="0" cellspacing="0" class="styTable" style="width:187mm;font-weight:normal;font-size:7pt;border:1px solid black;">
						<thead class="stythead">
							<tr>
								<th style="width:47mm;border-color:black;font-weight:normal;vertical-align:top;border:1px solid black;border-top:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<div class="styGenericDiv" style="padding-top:3mm;">
										<input type="Checkbox" class="styCkbox" name="ControlledForeignPrtshpInd">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8858SchMData/ControlledForeignPrtshpInd"/>
												<xsl:with-param name="BackupName">ControlledForeignPartnership</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="float:left;padding-left:2mm;padding-top:3mm;">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form8858SchMData/ControlledForeignPrtshpInd"/>
												<xsl:with-param name="BackupName">ControlledForeignPartnership</xsl:with-param>
											</xsl:call-template>
											<span style="font-weight:bold;">Controlled Foreign <br/>Partnership</span>
										</label>
									</div>
									<br/>
									<div style="padding-top:4mm;float:left;text-align:center;width:47mm;padding-bottom:2mm;">
										<span class="styBoldText">(a) </span> Transactions of <br/>foreign disregarded <br/>entity
			              </div>
								</th>
								<!-- tthis col occupies 28mm wide -->
								<th style="border-color:black;font-weight:normal;border:1px solid black;border-top:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<span style="width:2px;"/>
									<span class="styBoldText">(b) </span> U.S. person filing <br/>this return
				</th>
								<th style="width:28mm;border-color:black;font-weight:normal;border:1px solid black;border-top:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<span class="styBoldText">(c) </span> Any domestic corporation or partnership controlling or controlled<br/> by the filer
				</th>
								<th style="width:28mm;border-color:black;font-weight:normal;border:1px solid black;border-top:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<span class="styBoldText">(d) </span> Any foreign corporation or partnership controlling or controlled by the filer (other than the tax owner)<!--br /><span style="font-size:6pt">other than tax owner</span-->
								</th>
								<th style="width:28mm;border-color:black;font-weight:normal;border:1px solid black;border-top:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<span class="styBoldText">(e) </span> Any U.S. person with a 10% or more direct interest in the controlled foreign partnership (other than the filer)
				</th>
								<th style="width:28mm;background-color:lightgrey;border-color:black;border-right-width:0px;font-weight:normal;border-top:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<span style="width:2px;"/>
								</th>
							</tr>
							<tr>
								<th style="width:47mm;border-color:black;font-weight:normal;vertical-align:top;border:1px solid black;border-top:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<div class="styGenericDiv" style="padding-top:3mm;">
										<input type="Checkbox" class="styCkbox" name="ControlledForeignCorpInd">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8858SchMData/ControlledForeignCorpInd"/>
												<xsl:with-param name="BackupName">ControlledForeignCorporation</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="float:left;padding-left:2mm;padding-top:3mm;">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form8858SchMData/ControlledForeignCorpInd"/>
												<xsl:with-param name="BackupName">ControlledForeignCorporation</xsl:with-param>
											</xsl:call-template>
											<span style="font-weight:bold;">Controlled Foreign <br/>Corporation</span>
										</label>
									</div>
									<br/>
									<div style="padding-top:4mm;float:left;text-align:center;width:47mm;padding-bottom:2mm;">
										<span class="styBoldText">(a) </span> Transactions of <br/>foreign disregarded <br/>entity
			              </div>
								</th>
								<th style="border-color:black;font-weight:normal;border:1px solid black;border-top:0px;border-left:0px" class="styTablecellHeader" scope="col">
									<span style="width:2px;"/>
									<span class="styBoldText">(b) </span> U.S. person filing <br/> this return
				</th>
								<th style="border-color:black;font-weight:normal;border:1px solid black;border-top:0px;border-left:0px" class="styTablecellHeader" scope="col">
									<span class="styBoldText">(c) </span> Any domestic corporation or partnership <br/>controlled <br/>by the filer
				</th>
								<th style="border-color:black;font-weight:normal;border:1px solid black;border-top:0px;border-left:0px" class="styTablecellHeader" scope="col">
									<span class="styBoldText">(d) </span> Any foreign corporation or<br/> partnership<br/> controlled by the<br/> filer (other than tax owner)
				</th>
								<th style="border-color:black;font-weight:normal;border:1px solid black;border-top:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<span class="styBoldText">(e) </span> 10% or more U.S.
shareholder of any
corporation
controlling the tax
owner
				</th>
								<th style="border-color:black;border-right-width:0px;font-weight:normal;border:1px solid black;border-right:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<span class="styBoldText">(f) </span> 10% or more U.S. shareholder, or other owner, of any entity controlling the tax owner
				</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
									<span class="styLNLeftNumBoxSD">1</span>
									<span style="float:left;">Sales of inventory</span>
				<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/InventorySalesAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/InventorySalesAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/InventorySalesAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/InventorySalesAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-color:black;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/InventorySalesAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
									<span class="styLNLeftNumBoxSD">2</span>
									<span style="float:left;">
						Sales of property rights
					</span>
												<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/PropertyRightsSalesAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/PropertyRightsSalesAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/PropertyRightsSalesAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/PropertyRightsSalesAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/PropertyRightsSalesAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
		<tr>
			<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
				<span class="styLNLeftNumBoxSD">3</span>
				<span style="float:left;">Compensation recieved for</span>
					<br/>
				<span style="float:left;">certain services</span>
				<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
			</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/CompensationRcvdForCrtnSrvcAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/CompensationRcvdForCrtnSrvcAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/CompensationRcvdForCrtnSrvcAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/CompensationRcvdForCrtnSrvcAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/CompensationRcvdForCrtnSrvcAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
									<span class="styLNLeftNumBoxSD">4</span>
									<span style="float:left;">
						Commissions received
					</span>
												<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/CommissionsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/CommissionsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/CommissionsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/CommissionsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/CommissionsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
									<span class="styLNLeftNumBoxSD">5</span>
									<span style="float:left;">
						Rents, royalties, and license
					</span>
<br/>
									<span style="float:left;">
						fees received
								</span>
												<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/RentsRoyaltiesLcnsFeesRcvdAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/RentsRoyaltiesLcnsFeesRcvdAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/RentsRoyaltiesLcnsFeesRcvdAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/RentsRoyaltiesLcnsFeesRcvdAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/RentsRoyaltiesLcnsFeesRcvdAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
									<span class="styLNLeftNumBoxSD">6</span>
									<span style="float:left;">
						Dividends/Distributions		
					</span>
<br/>									<span style="float:left;">
						received					
					</span>
												<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/DividendsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/DividendsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/DividendsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/DividendsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/DividendsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
								<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
									<span class="styLNLeftNumBoxSD">7</span>
									<span style="float:left;">
						Interest received					
					</span>
						<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/InterestReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/InterestReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/InterestReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/InterestReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/InterestReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
									<span class="styLNLeftNumBoxSD">8</span>
									<span style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Other					
					</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/OtherTransactionsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/OtherTransactionsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/OtherTransactionsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/OtherTransactionsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/OtherTransactionsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;">
									<span class="styLNLeftNumBoxSD">9</span>
									<span style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Add lines 1 through 8					
					</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/TotalTransactionsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/TotalTransactionsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/TotalTransactionsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/TotalTransactionsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/TotalTransactionsReceivedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
									<span class="styLNLeftNumBox">10</span>
									<span style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Purchases of inventory					
					</span>
						<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/InventoryPurchaseAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/InventoryPurchaseAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/InventoryPurchaseAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/InventoryPurchaseAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/InventoryPurchaseAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
									<span class="styLNLeftNumBox">11</span>
									<span style="float:left;">Purchases of tangible prop-</span>
<br/>
									<span style="float:left;">
						erty other than inventory				
					</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/TangiblePropertyPurchaseAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/TangiblePropertyPurchaseAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/TangiblePropertyPurchaseAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/TangiblePropertyPurchaseAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/TangiblePropertyPurchaseAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
									<span class="styLNLeftNumBox">12</span>
									<span style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Purchases of property rights					
					</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/PurchasesOfPropertyRightsAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/PurchasesOfPropertyRightsAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/PurchasesOfPropertyRightsAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/PurchasesOfPropertyRightsAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/PurchasesOfPropertyRightsAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
									<span class="styLNLeftNumBox">13</span>
									<span style="float:left;">
						Compensation paid for 					
					</span>
<br/>
									<span style="float:left;">
						certain services					
					</span>
												<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/CompensationPaidForCrtnSrvcAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/CompensationPaidForCrtnSrvcAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/CompensationPaidForCrtnSrvcAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/CompensationPaidForCrtnSrvcAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style=";border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/CompensationPaidForCrtnSrvcAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
									<span class="styLNLeftNumBox">14</span>
									<span style="float:left;">
						Commissions paid					
					</span>
												<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/CommissionsPaidAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/CommissionsPaidAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/CommissionsPaidAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/CommissionsPaidAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/CommissionsPaidAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
									<span class="styLNLeftNumBox">15</span>
									<span style="float:left;">
						Rents, royalties, and license					
					</span>
<br/>									<span style="float:left;">
						fees paid					
					</span>
												<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/RentsRoyaltiesLicenseFeesPdAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/RentsRoyaltiesLicenseFeesPdAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/RentsRoyaltiesLicenseFeesPdAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/RentsRoyaltiesLicenseFeesPdAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/RentsRoyaltiesLicenseFeesPdAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<tr/>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
									<span class="styLNLeftNumBox">16</span>
									<span style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Interest paid					
					</span>
												<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/InterestPaidAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/InterestPaidAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/InterestPaidAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/InterestPaidAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/InterestPaidAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:1px;">
									<span class="styLNLeftNumBox">17</span>
									<span style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Add lines 10 through 16				
					</span>
												<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/TotalTransactionsPdAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/TotalTransactionsPdAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/TotalTransactionsPdAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/TotalTransactionsPdAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/TotalTransactionsPdAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
									<span class="styLNLeftNumBox">18</span>
									<span style="text-align:justify;width:39mm;" class="styLNDesc">
						Amounts borrowed (see 				
					</span>
									<br/>
									<span class="styLNLeftNumBox"/>
									<span style="float:left;">
						instructions)				
					</span>
												<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/BorrowedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/BorrowedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/BorrowedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/BorrowedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/BorrowedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
							<tr>
								<td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:1px;">
									<span class="styLNLeftNumBox">19</span>
									<span style="float:left;">
						Amounts loaned (see 				
					</span>
<br/>	<span style="float:left;">
						instructions)				
					</span>
												<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/USFilerGrp/LoanAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnershipGrp/LoanAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnershipGrp/LoanAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPctOrMoreCtrlFrgnPrtshpGrp/LoanAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
								<td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwnerGrp/LoanAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
								</td>
							</tr>
						</tbody>
					</table>
					</div>
					<!-- Footer -->
					<div  class="pageEnd" style="width:187mm;padding-top:1mm;float:none;">
						<div style="float:left;font-weight:bold;width:107mm;">For Paperwork Reduction Act Notice, see the Instructions for Form 8858.
  </div>
						<div style="width:30mm;float:left;">Cat. No. 37387C</div>
						<div style="float:right;font-weight:bold;">
    Schedule M (Form 8858) (12-2012)
  </div>
					</div>
					<!-- Introducing page end -->
					<!--p class="pageEnd" style="float:none;"/-->
					<!-- Begininning of write-in data -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="float:none;">
						<div class="styLeftOverTitle">
        Additional Data        
      </div>
						<div class="styLeftOverButtonContainer">
						<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8858SchMData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<xsl:if test="((count($Form8858SchMData/ForeignEntityIdentificationGrp) &gt; 1))">
						<span class="styRepeatingDataTitle">
							<br/>
						</span>
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="text-align:left" scope="col">
										Reference ID number (see instructions)
                                     </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form8858SchMData/ForeignEntityIdentificationGrp">
									<tr>
										<!--Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<span style="font-family:verdana;font-size:6pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</span>
											<br/>
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