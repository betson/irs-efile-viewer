<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">
<!-- Last modified on 01/12/2017 by Harold Nadel for KISAM # IM02756170 defect # 60683 -->	
<!-- Last modified on 11/04/2016 by Harold Nadel for KISAM # IM02756170 updated "(.20)" to "(0.20)" on line 17b -->	
<!-- Last modified on 10/03/2016 by Harold Nadel for UWR # 186620 per pdf dated 06/09/2016 -->
<!-- Last modified on 06/22/2016 by Harold Nadel for UWR # 182027 legislative changes per PDF 3/9/2016 -->
<!-- Last modified on 06/21/2016 by Harold Nadel for UWR # 174572 update TY from 2015 to 2016 -->
<!-- Last modified on 05/03/2016 by Harold Nadel for UWR# 177234-->
<!-- Last modified on 01/13/2016 by Harold Nadel for WR # 172666-->
<!-- Last modified on 12/04/2015 by Harold Nadel for defect # 59621-->
<!-- Last modified on 11/10/2015 by Harold Nadel for WR #166114 -->
<!-- Last modified on 09/30/2015 by Harold Nadel for WR #159749 -->
<!-- Last modified on 06/24/2015 by Harold Nadel for WR # 123023 changes for IE11-->
<!--Updated per UWR 117705 and PDF 03/27/2014 on 09/17/2014 by Harold Nadel  -->
<!-- 08/14/2017 - Changes made for UWR 199207 - Jeremy Nichols -->
<!-- 09/28/2017 - Rate Changes made for UWR 199320 by Harold Nadel -->
<!-- 01/19/2018 - Changes made for KISAM IM00056733 - Jeremy Nichols -->
<!-- 01/19/2018 - Changes made for KISAM IM00022569 - Jeremy Nichols -->
]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="IRS8835Style.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8835"/>
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
				<meta name="Author" content="Michelle Hayden - haydem@us.ibm.com"/>
				<meta name="Description" content="Form IRS 8835"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/header.css"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/body.css"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/general.css"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8835Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass">
				<form name="Form8835">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form -->
					<div class="styBB" style="width:187mm;height: auto">
						<div class="styFNBox" style="width:31mm;font-size: 7pt;height: auto">
              Form <span class="styFormNumber">8835</span>
							<br/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Fiscal Year Taxpayer Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/@fiscalYearTaxpayerCd"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<br/>
							<div class="styAgency" style="padding-top: 1.5mm">Department of the Treasury</div>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="height: auto;width:125mm">
							<div class="styMainTitle" style="height:auto; padding-top: 1mm">Renewable Electricity, Refined Coal,<br/>and Indian Coal Production Credit</div><br/>
	<!--						<div class="styFST" style="font-size:7pt;font-weight:bold; padding-top: 5mm">
								<img src="{$ImagePath}/8835_Bullet.gif" alt="MediumBullet"/>  
                See separate instructions.
               					 <span style="padding-left: 8mm">
									<img src="{$ImagePath}/8835_Bullet.gif" alt="MediumBullet"/>
								</span>						
                Attach to your tax return. 
          		   				 </div>  -->
          		   				 <div class="styFST" style="font-size:7pt;font-weight:bold; padding-top: 1mm">
								 <img src="{$ImagePath}/8835_Bullet.gif" alt="MediumBullet"/>
				Attach to your tax return. 
          		   				 </div>	
            		   			 <div class="styFST" style="font-size:6.5pt;font-weight:bold; padding-top: 1mm">
								 <img src="{$ImagePath}/8835_Bullet.gif" alt="MediumBullet"/>
								 Go to <i>www.irs.gov/Form8835</i> for instructions and the latest information
          		   				 </div>	       		   				 			   
						</div>
						<div class="styTYBox" style="width:30mm;height:auto; border-left-width: 1px">
							<div class="styOMB" style="height:auto;">OMB No. 1545-1362</div>
							<div class="styTaxYear" style="height:auto">20<span class="styTYColor">17</span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No. <b>95</b>
							</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!--  Name and Employer identification number  -->
					<div class="styBB" style="width:187mm">
						<div class="styNameBox" style="width:141mm;font-size:7pt;">
              Name(s) shown on return<br/>
<!--							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>   -->
 							<xsl:choose>
								<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
							<span class="BoldText">Identifying number</span><br/>
							<div style="text-align:left;font-weight:normal;">
								<br/>
								<xsl:call-template name="PopulateFilerTIN">
								   <xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->

					<!--  Part II Title-->
					<div class="styBB" style="width: 187mm; border-top-width: 0px">
						<div class="styPartDesc" style="width: 172mm;height:auto;">
							Electricity and Refined Coal Produced at Qualified Facilities Placed in Service After October 22, 2004 (After October 2, 2008, for Electricity Produced 
							From Marine and Hydrokinetic Renewables), and Indian Coal Produced at Facilities Placed in Service After August 8, 2005
						</div>
					</div>
					<!--  End Part II Title-->
					<div class="styTableContainer" style="border-top-width: 0px; border-bottom-width:0px; width: 187mm; height: 100%">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr>
									<th class="styTableCellHeader" colspan="2" style="text-align:left;width: 48mm; border-bottom-width: 0px;  border-left-width: 0px; border-top-width: 0px;height:auto;" scope="col">
										<!--<span class="styBoldText" style="padding-left:1.5mm;">13 Electricity produced at qualified <br/>facilities using:-->
										<!--<span style="width: 3mm"/>-->
										<span class="styNormalText"> <b>1</b><span style="padding-left:2mm;"/>Electricity produced at qualified <br/><span style="padding-left:6mm"/>facilities using:</span><!--</span>-->
										<!--									<span class="styTableCellPad"/>    -->
									</th>
									<th class="styTableCellHeader" style="width: 36mm;" scope="col">
        (a)<br/>
										<span class="styNormalText">Kilowatt-hours produced and sold (see instructions)</span>
									</th>
									<th class="styTableCellHeader" style="width: 15mm" scope="col">
        (b)<br/>
										<span class="styNormalText">Rate</span>
									</th>
									<th class="styTableCellHeader" style="width: 39.25mm" scope="col">
        (c)<br/>
										<span class="styNormalText">Column (a) x Column (b)</span>
									</th>
									<th class="styTableCellHeader" style="width: 8mm; background-color:lightgrey;color:lightgrey;border-color: black;border-right-width:1px;border-bottom-width:0px;" scope="col">.
									</th>
									<th class="styTableCellHeader"  scope="col" style="width: 32mm; border-right-width: 0px;border-bottom-width:0px;"/>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">a</span>
										<span style="width: 2mm"/>
         Wind<span class="styDotLn" style="float:none;padding-left:2mm; clear:none">.......</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;border-top-width: 1px;text-align:center;font:bold;">1a
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldWindQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm;text-align:center;">0.024
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldWindCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; background-color:lightgrey; border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px;border-right-width:0px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">b</span>
										<span style="width: 1.5mm"/>
         Closed-loop biomass<span class="styDotLn" style="float:none; clear:none;padding-left:3mm;">..</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;">1b
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdSoldClsLoopBmssQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm;border-bottom-width:1px;text-align:center;">0.024
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdSoldClsLoopBmssCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; border-bottom-width:0px; background-color:lightgrey;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">c</span>
										<span style="width: 1.5mm"/>
        Geothermal<span class="styDotLn" style="float:none;padding-left:2mm; clear:none">.....</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;">1c
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldGthrmlQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm; border-bottom-width:1px;text-align:center;">0.024
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldGthrmlAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; border-bottom-width:0px; background-color:lightgrey;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm;">d</span>
										<span style="width: 1.5mm;"/>
         Solar<span class="styDotLn" style="float:none; clear:none">.......</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;">1d
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldSolarQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm;text-align:center;">0.024
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldSolarCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; background-color:lightgrey;border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-right-width:0px;border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">e</div>
						<span class="styLNDesc" style="width: 137mm">
              Add column (c) of lines 1a through 1d and enter here (see instructions)<span style="width: 7mm">
								<span class="styDotLn" style="float: none;padding-left:2mm;">..........</span>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">1e</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
							<span style="float: left; clear:none"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalForCreditRateUnder45a1Amt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styTableContainer" style="width: 187mm; border-bottom-width:0px; height: 100%">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr scope="col">
									<th class="styTableCellHeader" colspan="2" scope="col" style="text-align:left;width: 48mm; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px">
									<span class="styNormalText"> <b>2</b><span style="padding-left:2mm;"/>Electricity produced at qualified <br/><span style="padding-left:6mm"/>facilities using:</span><!--</span>-->
										
										<span class="styTableCellPad"/>
									</th>
									<th class="styTableCellHeader" style="width: 36mm" scope="col">
        (a)<br/>
										<span class="styNormalText">Kilowatt-hours produced and sold (see instructions)</span>
									</th>
									<th class="styTableCellHeader" style="width: 15mm" scope="col">
        (b)<br/>
										<span class="styNormalText">Rate</span>
									</th>
									<th class="styTableCellHeader" style="width: 39.25mm" scope="col">
        (c)<br/>
										<span class="styNormalText">Column (a) x Column (b)</span>
									</th>
									<th class="styTableCellHeader" style="width: 8mm; background-color:lightgrey;color:lightgrey;border-bottom-width: 0px;border-color: black;border-right-width:1px;float:none;clear:both;" scope="col">.
									</th>
									<th class="styTableCellHeader" style="width: 32mm; border-right-width: 0px;border-bottom-width: 0px;float:none;clear:both;" scope="col" />
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">a</span>
										<span style="width: 1.5mm"/>
        Open-loop biomass<span class="styDotLn" style="float:none; clear:none">...</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;border-top-width: 1px;text-align:center;font:bold;">2a
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdSoldOpenLoopBmssQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm;text-align:center;">0.012
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35.25mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdSoldOpenLopBmssCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; background-color:lightgrey; border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px;border-right-width:0px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">b</span>
										<span style="width: 1.5mm"/>
         Small irrigation power<span class="styDotLn" style="float:none; clear:none">..</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;">2b
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdSoldSmllIrgtnPwrQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm;border-bottom-width:1px;text-align:center;">0.012
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35.25mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdSldSmllIrgtnPwrCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; border-bottom-width:0px; background-color:lightgrey;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">c</span>
										<span style="width: 1.5mm"/>
        Landfill gas<span class="styDotLn" style="float:none; clear:none;padding-left:2mm;">.....</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;">2c
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldLndfllGasQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm; border-bottom-width:1px;text-align:center;">0.012
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35.25mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldLndfllGsCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; border-bottom-width:0px; background-color:lightgrey;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">d</span>
										<span style="width: 1.5mm"/>
         Trash<span class="styDotLn" style="float:none; clear:none">.......</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;">2d
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldTrashQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm;text-align:center;">0.012
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35.25mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldTrashCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; border-bottom-width:0px; background-color:lightgrey;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-right-width:0px;border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">e</span>
										<span style="width: 1.5mm"/>
         Hydropower<span class="styDotLn" style="float:none; clear:none">.....</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;">2e
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldHydropowerQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm;text-align:center;">0.012
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35.25mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldHydropwrCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; border-bottom-width:0px; background-color:lightgrey;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-right-width:0px;border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">f</span>
										<span style="width: 1.5mm"/>
         Marine and hydrokinetic <br/><span style="padding-left:8mm"/>renewables<span class="styDotLn" style="float:none; clear:none">......</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;padding-top:3mm;">2f
									</td>
									<td class="styTableCellSmall" style="width: 36mm;padding-top:3mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdSoldMarineRnwblQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm; text-align:center;padding-top:3mm;">0.012
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35.25mm;padding-top:3mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdSoldMarineRnwblCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; background-color:lightgrey;border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-right-width:0px;border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">g</div>
						<span class="styLNDesc" style="width: 137mm">
              Add column (c) of lines 2a through 2f and enter here (see instructions)<span style="width: 7mm">
								<span class="styDotLn" style="float: none">..........</span>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">2g</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
							<span style="float: left; clear:none"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalForCreditRtUnder45b4AAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Line 3 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">3</div>
						<div style="float:left; padding-top: .5mm">
              Add lines 1e and 2g  
            </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
                ..........................
              </span>
							<div class="styLNRightNumBox">3</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotClsOpenKwHrsPrdcdSoldCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 3  -->
					<!--  Line 4 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">4</div>
						<span class="styLNDesc" style="width: 137mm">
              Phaseout adjustment (see instructions)  
              <span style="width: 31mm">
								<span class="styDotLn" style="float: none">  
                  ........
                </span>
							</span>
							<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 34mm">$
                <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/CreditBfrPhaseoutAdjustmentAmt"/>
								</xsl:call-template>
							</span>
							<span style="width: 22mm">
								<span style="width: 2mm"/> X<span style="width: 2mm"/>
								<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 10mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/PhaseoutAdjustmentRt"/>
									</xsl:call-template>
								</span>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">4</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
							<span style="float: left; clear:none"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalPhaseoutAdjustmentAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Line 4 -->
					<!--  Line 5 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">5</div>
						<div style="float:left; padding-top: .5mm">
							  Subtract line 4 from line 3  
						</div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
								........................
							</span>
							<div class="styLNRightNumBox">5</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/NetPhaseoutAdjustmentAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 5  -->
					<div style="width187mm;height:auto;">
						<div class="styLNDesc" style="font-weight:bold; width:145mm; padding-left:9mm; ">Refined coal produced at a qualified refined coal production facility
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;padding-left:4mm;"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<!--  Line 6 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">6</div>
						<span class="styLNDesc" style="width: 137mm">
              Tons produced and sold (see instructions)
              <span style="width: 27mm">
								<span class="styDotLn" style="float: none">  
                  .......
                </span>
							</span>
							<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="18"/>
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/RefineCoalTonPrdcdSoldQty"/>
								</xsl:call-template>
							</span>
							<span style="width: 21mm">
								<span style="width: 2mm"/> X<span style="width: 2mm"/>$6.909</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">6</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
							<span style="float: left; clear:none"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotRefineCoalTonPrdcdSoldCrAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Line 6-->
					<!--  Line 7 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">7</div>
						<span class="styLNDesc" style="width: 137mm">
              Phaseout adjustment (see instructions)  
            <span style="width: 30.5mm">
								<span class="styDotLn" style="float: none">  
                  ........
                </span>
							</span>
							<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 34mm">$
                <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/RefinedCoalCrBfrPhaseoutAdjAmt"/>
								</xsl:call-template>
							</span>
							<span style="width: 22mm">
								<span style="width: 3mm"/> X<span style="width: 2mm"/>
								<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 10mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/RefinedCoalPhaseoutAdjRt"/>
									</xsl:call-template>
								</span>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">7</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
							<span style="float: left; clear:none"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/RefinedCoalTotalPhaseoutAdjAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Line 7 -->
					<!--  Line 8-->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">8</div>
						<div style="float:left; padding-top: .5mm">
						  Subtract line 7 from line 6 
						</div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
								........................
						    </span>
							<div class="styLNRightNumBox">8</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/NetRefinedCoalPhaseoutAdjAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 8  -->
					<!--  Line 9 -->
					<!--<div style="width187mm;">
						<div class="styLNDesc">
							<span style="font-weight:bold; width:145mm; padding-left:9mm;">Steel industry fuel produced at a qualified refined coal production facility</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB"/>
					</div>  -->
					
					<!--Line 9 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="height: 5mm;">9</div>
						<span class="styLNDesc" style="width: 137mm;">
							<span style="width:14mm; float:left">
							  Reserved <!--for future use (see instructions)-->
							</span>
						<!--<span style="width: 7mm">-->
							<span class="styDotLn" style="float: right">  
							  .............................
							</span>
						<!--</span>-->
						<!--<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 
									1px; width: 34mm;font-size:7pt;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="21"/>
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/SteelFuelPrdcdQlfdRefinedCoal"/>
								</xsl:call-template>
						</span>
						<span style="width: 22mm;font-size:7pt;">
							<span style="width: 2mm"/> X<span style="width: 2mm;font-size:7pt;"/>$2.89</span>  -->
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">9</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm;background-color:lightgrey;">
							<span style="float: left; clear:none"/>
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotSteelFuelPrdcdQlfdRfndCoal"/>
							</xsl:call-template>  -->
						</span>
					</div>
					
					<!--  Line 10 -->
										<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="height: 5mm;">10</div>
						<span class="styLNDesc" style="width: 137mm;">
							 Reserved for future use
							 	<span style="width:2mm;">
							<span class="styDotLn" style="float: none;padding-left:3mm;">  
							  ..........................
							</span>
							</span>
							<span style="width: 35mm">
								<span style="width:1mm"/>
								
							</span>
							<span style="width: 21mm"></span>
						 </span>
						 
						
						<span class="styLNRightNumBox" style="height: 5mm;border-bottom-width:1px;">10</span>
						
					
						 <!--<span class="styLNAmountBox" style="width: 34mm; height: 5mm;border-bottom-width:1px;"/>-->
						 
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm;border-bottom-width:1px;background-color:lightgrey; ">
							<span style="float: left; clear:none"/>
							<span style="width:1mm"/>
						</span>
						
						<!--<span class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="width: 34mm; border-bottom-width: 0px"/>
						<span class="styLNRightNumBox" style="height: 5mm">22</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm;background-color:lightgrey;">
							<span style="float: left; clear:none"/></span>-->
					</div>
					<!--  Line 10 -->

<!--  Line 11 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">11</div>
						<div style="float:left; padding-top: .5mm">
              Credit before reduction. Add lines 5 and 8
            </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
                ....................
              </span>
							<div class="styLNRightNumBox">11</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/RefinedCoalCreditBeforeRedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>					
					
					<div style="width: 187mm">
						<div style="float:left; padding-left: 8.5mm; padding-top: .5mm">
							<span class="styBoldText">
        Reduction for government grants, subsidized financing, and other credits:
      </span>
						</div>
						<div style="float:right">
							<div class="styLNRightNumBox" style="background-color: lightgrey; height: 4mm; border-bottom-width: 0px"/>
							<div class="styLNAmountBox" style="height: 4mm; border-bottom-width: 0px; width: 34mm"/>
						</div>
					</div>
					<!--  Line 12 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">12</div>
						<div style="float: left; padding-top: .5mm;  ">
      Total of government grants, proceeds of tax-exempt government obligations, subsidized energy financing,
    </div>
						<div style="float: right">
							<span class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<span class="styLNAmountBox" style="width: 34mm; background-color: lilghtgrey; border-bottom-width: 0px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float: left; padding-top: .5mm;">
       and any federal tax credits allowed for the project for this and all prior tax years (see instructions)
    </div>
						<div style="float: right">
							<span class="styDotLn" style="padding-top: .5mm">  
         ...
      </span>
							<span class="styLNRightNumBox" style="height: 5mm">12</span>
							<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalGovernmentGrantsAmt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--  Line 12 -->
					<!--  Line 13 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">13</div>
						<div style="float:left; padding-top: .5mm">
        Total of additions to the capital account for the project for this and all prior tax years
    </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
        ......
      </span>
							<div class="styLNRightNumBox">13</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotCapitalAccountAdditionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 13  -->
					<!--  Line 14 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">14</div>
						<div style="float:left; padding-top: .5mm">
              Divide line 12 by line 13. Show as a decimal carried to at least 4 places  
            </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
        ..........
      </span>
							<div class="styLNRightNumBox">14</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/CreditReductionRt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 14  -->
					<!--  Line 15 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">15</div>
						<div style="float:left; padding-top: .5mm">
              Multiply line 11 by the smaller of 1/2 or line 14
            </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
        ..................
      </span>
							<div class="styLNRightNumBox">15</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/CreditReductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 15  -->
					<!--  Line 16 -->
					<div class="styGeneric" style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">16</div>
						<div style="float:left; padding-top: .5mm">
              Subtract line 15 from line 11
            </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
        ........................
      </span>
							<div class="styLNRightNumBox">16</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/AdjustedCreditReductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 16  -->
					
					<!--  Line 17a -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">17a</div>
						<div style="float:left; padding-top: .5mm">
              Enter the amount from line 16 applicable to wind facilities the construction of which began during 2017
            </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
								..
							</span>
							<div class="styLNRightNumBox">17a</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/WindFacilityAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 17a  -->
					<!--  Line 17b -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4.5mm">b</div>
						<div style="float:left; padding-top: .5mm">
              Multiply line 17a by 20% (0.20)
            </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
        ........................
      </span>
							<div class="styLNRightNumBox">17b</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/WindFacilityPercentageAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 17b  -->
					<!--  Line 17c -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4.5mm">c</div>
						<div style="float:left; padding-top: .5mm">
						  Enter the amount from line 16 applicable to wind facilities the construction of which began during 2018
						</div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">.</span>
							<div class="styLNRightNumBox">17c</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/WindFacilityYr2Amt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 17c  -->
					<!--  Line 17d -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4.5mm">d</div>
						<div style="float:left; padding-top: .5mm">
						  Multiply line 17c by 40% (0.40)
						</div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
								........................
							</span>
							<div class="styLNRightNumBox">17d</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/WindFacilityPercentageYr2Amt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 17d  -->
					<!--  Line 17e -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4.5mm">e</div>
						<div style="float:left; padding-top: .5mm">
						  Add lines 17b and 17d
						</div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
								..........................
							</span>
							<div class="styLNRightNumBox">17e</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/WindFacilityPhaseOutCrYr2Amt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 17e  -->
					<!--  Line 18 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">18</div>
						<div style="float:left; padding-top: .5mm">
              Subtract line 17e from line 16
            </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
        ........................
      </span>
							<div class="styLNRightNumBox">18</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/NetWindFacilityPercentageAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 18 -->

					
					<!--  Line 19  -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">19</div>
						<div style="float:left; padding-top: .5mm">
              Part II renewable electricity, refined coal, and Indian coal production credit from partnerships, </div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
        S corporations, cooperatives, estates, and trusts (see instructions)
        </div>
						<div style="float: right">
							<!--Dotted Line-->
							<span class="styDotLn">  
              .............
            </span>
							<div class="styLNRightNumBox" style="height:4.5mm;">19</div>
							<div class="styLNAmountBox" style="height:4.5mm;width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/RnwblElecRefinedCoalProdCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 19  -->
					<!--  Line 20  -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">20</div>
						<div style="float:left; padding-top: .5mm">
           Add lines 18 and 19.  Cooperatives, estates, and trusts, go to line 21. Partnerships and S corporations,
         </div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
		 stop here and report this amount on Schedule K. All others: For electricity or refined coal produced
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
              during the 4-year period beginning on the date the facility was placed in service or Indian coal produced 
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
		stop here and report the applicable part of this amount on Form 3800, Part III, line 4e. For all other 
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
	production of electricity or refined coal, stop here and report the applicable part of this amount on 
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
               Form 3800, Part III, line 1f (see instructions)
             <span style="width:2px;"/>
							<!-- Form to Form Link -->
<!--							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 36 - Form 6478 Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalAllowedTaxCredit/@form6478Indicator"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 36 - Form 6478 Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalAllowedTaxCredit/@form6478Amount"/>
							</xsl:call-template>  -->
						</div>
						<div style="float: right">
							<!--Dotted Line-->
							<span class="styDotLn">.................. </span>
							<div class="styLNRightNumBox" style="height:4.5mm;">20</div>
							<div class="styLNAmountBox" style="height:4.5mm;width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalAllowedTaxCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 20  -->
					
					<!--  Line 21 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">21</div>
						<div style="float: left; padding-top: .5mm">
        Amount allocated to patrons of the cooperative or beneficiaries of the estate or trust (see instructions) 
      </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm"/>
							<div class="styLNRightNumBox">21</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/AllocatedToBeneficiariesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Line 21 -->
					<!-- Line 22  -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">22</div>
						<div style="float:left; padding-top: .5mm">
						Cooperatives, estates, and trusts, subtract line 21 from line 20. For electricity or refined coal
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
       		      produced during the 4-year period beginning on the date the facility was placed in service, or Indian coal 
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
     		    	 	produced report the applicable part of this amount on Form 3800, Part III, line 4e. For all other production 
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
     		    	 	of electricity or refined coal, report the applicable part of this amount on Form 3800, 
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>

					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
          		   	 Part III, line 1f
						</div>
						<div style="float: right">
							<!--Dotted Line-->
								<span class="styDotLn">............................ </span>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;">22</div>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/EstatesTrustsAndCoopsCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Line 32  -->
					<!--  FOOTER-->
					<div style="width:187mm">
						<span style="float: right">
          Form <span class="styBoldText">8835</span> (2017)
        </span>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					
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
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Fiscal Year Taxpayer Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/@fiscalYearTaxpayerCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
<!--						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 34 - Form 8884 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/CfwdRnwblElecRefinedCoalCr/@form8884Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 34 - Form 8884 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/CfwdRnwblElecRefinedCoalCr/@form8884Amount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 36 - Form 6478 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalAllowedTaxCredit/@form6478Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 36 - Form 6478 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalAllowedTaxCredit/@form6478Amount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>  -->
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>