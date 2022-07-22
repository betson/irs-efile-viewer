<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<!-- 05/05/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 06/23/2015 - Changes made for UWR 151655 - Jeremy Nichols -->
<!-- 06/14/2016 - Changes made for UWR 182766 - Jeremy Nichols -->
<!-- 08/16/2016 - Changes made for defect 46561 - Jeremy Nichols -->
<!-- 05/11/2017 - Changes made for UWR 194393 - Jeremy Nichols -->
<!-- 06/26/2017 - Changes made for UWR 198218 - Jeremy Nichols -->
<!-- 06/28/2017 - Changes made for defect 48212 - Jeremy Nichols -->
<!-- 08/08/2017 - Changes made for KISAM IM03060847 - Jeremy Nichols -->
<!-- 09/14/2017 - Changes made for defect 125297 - Jeremy Nichols -->
<!-- 09/14/2017 - Changes made for defect 125298 - Jeremy Nichols -->
<!-- 09/22/2017 - Changes made for KISAM IM03103134 - Jeremy Nichols -->
<!-- 09/25/2017 - Changes made for UWR 200091 - Jeremy Nichols -->
<!-- 10/17/2017 - Changes made for defect 125299 - Jeremy Nichols -->
<!-- 11/09/2017 - Changes made for defect 125773 - Jeremy Nichols -->
<!-- 11/09/2017 - Changes made for defect 125774 - Jeremy Nichols -->
<!-- 11/22/2017 - Changes made for KISAM IM03060847 - Jeremy Nichols -->
<!-- 01/23/2018 - Additional changes made for defect 125774 - Jeremy Nichols -->
<!-- 09/28/2018 - Additional changes made for KISAM IM00347621 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8865ScheduleOStyle.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8865ScheduleOData" select="$RtnDoc/IRS8865ScheduleO"/>
	<xsl:template match="/">
		<xsl:variable name="TransfersReportable" select="count($Form8865ScheduleOData)&gt;5"/>
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8865ScheduleOData)"/>
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
				<meta name="Description" content="IRS Form 8865ScheduleO"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- Remember to remove comment before checked-in your code -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8865ScheduleOStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8865ScheduleO">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
<!--						<div class="styForm8865ScheduleOFN" style="width:28mm;height:17.25mm;float:left;">  -->
						<div class="styForm8865ScheduleOFN" style="width:28mm;height:21.5mm;float:left;">				
							<span class="styForm8865ScheduleOFST" style="margin-left:0mm;">SCHEDULE O </span>
							<span class="styFBT" style="font:size:9pt;">(Form 8865)</span><br/>
							<!--  Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData"/>
							</xsl:call-template>
							<br/>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:126mm;height:21.5mm;">
							<div class="styMainTitle" style="height:6mm;font-size:13pt;">
          Transfer of Property to a Foreign Partnership
						</div>
							<div class="styForm8865ScheduleOFST" style="height:5mm;font-size:10pt;">
          (under section 6038B)
						</div>
							<div class="styForm8865ScheduleOFST" style="height:4mm;font-size:7pt;">
								<img src="{$ImagePath}/8865SchO_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
         Attach to Form 8865.  See Instructions for Form 8865.
						</div> 
							<div class="styForm8865ScheduleOFST" style="height:4mm;font-size:7pt;">
								<img src="{$ImagePath}/8865SchO_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
 <!--         Attach to Form 8865. See Instructions for Form 8865. -->
			   Information about Schedule O (Form 8865) and its separate instructions is at <a href="http://www.irs.gov/form8865" title="Link to IRS.gov"><i>www.irs.gov/form8865</i></a>
						</div>               
						</div>
						<div class="styTYBox" style="width:32mm;height:21.5mm;">
							<div class="styOMB" style="height:4mm;">
          OMB No. 1545-1668
        </div>
							<div class="styTY" style="height:13mm;padding-top:3mm;">
          20<span class="styTYColor">17</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;">
						<tr>
						  <td colspan="2" style="width:116mm;font-size:6pt;vertical-align:top;border-right:1px solid black;border-bottom:1px solid black;">
							<b>Name of transferor</b><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferorName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferorName/BusinessNameLine2Txt"/>
							</xsl:call-template>
							<br/>
						  </td>
						  <td style="font-size:6pt;vertical-align:top;padding-left:0.5mm;border-right:0 solid black;border-bottom:1px solid black;">
							<b>Filer's identifying number</b><br/>
							<br/>
							<xsl:choose>
								<!-- EIN-->
								<xsl:when test="$Form8865ScheduleOData/FilersEIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/FilersEIN"/>
									</xsl:call-template>
								</xsl:when>
								<!-- SSN -->
								<xsl:when test="$Form8865ScheduleOData/FilersSSN">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/FilersSSN"/>
									</xsl:call-template>
								</xsl:when>
								<!-- Missing EIN Reason-->
								<xsl:when test="$Form8865ScheduleOData/MissingEINReasonCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<!-- Pull Data from Return Header-->
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>   
						</td>
					</tr>
					<tr>
					  <td style="width:90mm;font-size:6pt;vertical-align:top;border-right:1px solid black;border-bottom:1px solid black;">
							<b>Name of foreign partnership</b><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/ForeignPartnershipName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/ForeignPartnershipName/BusinessNameLine2Txt"/>
							</xsl:call-template>
							<br/>
						</td>
						<td style="width:26mm;font-size:6pt;vertical-align:top;padding-left:0.5mm;border-right:1px solid black;border-bottom:1px solid black;">
							<b>EIN (if any)</b><br/><br/>
 								<xsl:choose>
									<xsl:when test="$Form8865ScheduleOData/EIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/EIN"/>
										</xsl:call-template>
									</xsl:when>							
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/FrgnPrtshpMissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>          
						</td>
						<td style="font-size:6pt;vertical-align:top;padding-left:0.5mm;border-right:0 solid black;border-bottom:1px solid black;">
							<b>Reference ID number (see instructions)</b>
							<xsl:if test="(count($Form8865ScheduleOData/ForeignEntityIdentificationGrp) &lt;=1)">
								<br/>
							</xsl:if>
							<xsl:for-each select="$Form8865ScheduleOData/ForeignEntityIdentificationGrp">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
								</xsl:call-template>
							</xsl:for-each>
						</td>  			
					  </tr>
					  </table>						
					</div>
					<!-- End Names and Identifying number section -->
					<xsl:variable name="defaultRows" select="4"/>
					<xsl:variable name="p1RecCount1" select="count($Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp)"/>
					<xsl:variable name="p1RecCount2" select="count($Form8865ScheduleOData/InventoryTransfersGrp)"/>
					<xsl:variable name="p1RecCount3" select="count($Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp)"/>
					<xsl:variable name="p1RecCount4" select="count($Form8865ScheduleOData/IntangiblePropSect197f9Grp)"/>
					<xsl:variable name="p1RecCount4b" select="count($Form8865ScheduleOData/IntangiblePropNotSect197f9Grp)"/>
					<xsl:variable name="p1RecCount5" select="count($Form8865ScheduleOData/OtherPropertyTransfersGrp)"/>
					<!-- Calculate the actual number of rows in the Part I table. If the sets of data in each category (other than Cash, always 1) -->
					<!-- is less than or equal to 4, make the count for the category equal to 4. If the set of data is greater                     -->
					<!-- than 4, make the count equal to the number of the data set.                                                               -->
					<xsl:variable name="MSCount">
						<xsl:choose>
							<xsl:when test="count($Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp) &lt; 5">
								<xsl:number value="4"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="count($Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="InvCount">
						<xsl:choose>
							<xsl:when test="count($Form8865ScheduleOData/InventoryTransfersGrp) &lt; 5">
								<xsl:number value="4"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="count($Form8865ScheduleOData/InventoryTransfersGrp)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="TPCount">
						<xsl:choose>
							<xsl:when test="count($Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp) &lt; 5">
								<xsl:number value="4"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="count($Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="IPCount">
						<xsl:choose>
							<xsl:when test="count($Form8865ScheduleOData/IntangiblePropSect197f9Grp) &lt; 5">
								<xsl:number value="4"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="count($Form8865ScheduleOData/IntangiblePropSect197f9Grp)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="OIPCount">
						<xsl:choose>
							<xsl:when test="count($Form8865ScheduleOData/IntangiblePropNotSect197f9Grp) &lt; 5">
								<xsl:number value="4"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="count($Form8865ScheduleOData/IntangiblePropNotSect197f9Grp)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="OPCount">
						<xsl:choose>
							<xsl:when test="count($Form8865ScheduleOData/OtherPropertyTransfersGrp) &lt; 5">
								<xsl:number value="4"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="count($Form8865ScheduleOData/OtherPropertyTransfersGrp)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<div style="width:187mm;padding-bottom:1mm;">
						<table>
							<tbody>
								<tr>
									<td style="width:5mm;">1a</td>
									<td style="width:160mm;">
										Is the partnership a section 721(c) partnership (as defined in Regulation section 1.721(c)-1T(b)(14))? See instructions
										<span class="styDotLn" style="float:right;">..</span>
									</td>
									<td style="width:11mm;">
										<span style="display:inline;">
											<input type="checkbox" class="styCkbox" name="Checkbox721">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/Section721cPartnershipInd"/>
												</xsl:call-template>
											</input>
										</span>
										<span style="width:1mm;display:inline;" />
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/Section721cPartnershipInd"/>
											</xsl:call-template>
											Yes
										</label>
									</td>
									<td style="width:11mm;text-align:right;">
										<span style="display:inline;">
											<input type="checkbox" class="styCkbox" name="Checkbox721">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/Section721cPartnershipInd"/>
												</xsl:call-template>
											</input>
										</span>
										<span style="width:1mm;display:inline;" />
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/Section721cPartnershipInd"/>
											</xsl:call-template>
											No
										</label>
									</td>
								</tr>
								<tr>
									<td style="width:5mm;"><span style="width:1.5mm;" />b</td>
									<td style="width:160mm;">
										If “Yes”, was the gain deferral method applied to avoid the recognition of gain upon the contribution of property?
										<span class="styDotLn" style="float:right;">...</span>
									</td>
									<td style="width:11mm;">
										<span style="display:inline;">
											<input type="checkbox" class="styCkbox" name="CheckboxApp">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/GainDeferralMethodAppliedInd"/>
												</xsl:call-template>
											</input>
										</span>
										<span style="width:1mm;display:inline;" />
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/GainDeferralMethodAppliedInd"/>
											</xsl:call-template>
											Yes
										</label>
									</td>
									<td style="width:11mm;text-align:right;">
										<span style="display:inline;">
											<input type="checkbox" class="styCkbox" name="CheckboxApp">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/GainDeferralMethodAppliedInd"/>
												</xsl:call-template>
											</input>
										</span>
										<span style="width:1mm;display:inline;" />
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/GainDeferralMethodAppliedInd"/>
											</xsl:call-template>
											No
										</label>
									</td>
								</tr>
								<tr>
									<td style="width:5mm;vertical-align:top;">2</td>
									<td style="width:160mm;">
										Was any intangible property transferred considered or anticipated to be, at the time of the transfer or at any time thereafter,
										a platform contribution as defined in Regulations section1.482-7(c)(1)? 
										<span class="styDotLn" style="float:right;">................</span>
									</td>
									<td style="width:11mm;vertical-align:bottom;">
										<span style="display:inline;">
											<input type="checkbox" class="styCkbox" name="CheckboxProp">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntngblPropTrnsfrContriInd"/>
												</xsl:call-template>
											</input>
										</span>
										<span style="width:1mm;display:inline;" />
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntngblPropTrnsfrContriInd"/>
											</xsl:call-template>
											Yes
										</label>
									</td>
									<td style="width:11mm;text-align:right;vertical-align:bottom;">
										<span style="display:inline;">
											<input type="checkbox" class="styCkbox" name="CheckboxProp">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntngblPropTrnsfrContriInd"/>
												</xsl:call-template>
											</input>
										</span>
										<span style="width:1mm;display:inline;" />
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntngblPropTrnsfrContriInd"/>
											</xsl:call-template>
											No
										</label>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!--Begin Part I-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width:156mm;">Transfers Reportable Under Section 6038B</div>
						<!-- Pass in the DataRowCount value as the sum of Cash (which is always 1) and the rest of the data row count.-->
						<span class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleRowCount">
								<xsl:with-param name="DataRowCount" select="1 + $MSCount + $InvCount + $TPCount + $IPCount + $OPCount"/>
								<xsl:with-param name="containerHeight" select="21"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'TPctn' "/>
							</xsl:call-template>
						</span>
					</div>
					<div style="display:block;float: none; clear:both;overflow-y: auto;" id="TPctn">
						<xsl:call-template name="SetInitialState"/>
						<table cellspacing="0" cellpadding="0" summary="Table for Transfers Reportable Under Section 6038B">
							<thead class="styTableThead">
								<tr>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 20mm; text-align: center;" colspan="2"> Type of <br/> property </th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 20mm; text-align: center;">
										<b>(a)</b>
										<br/> Date of <br/> transfer </th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 28mm; text-align: center;">
										<b>(b)</b>
										<br/> Description of property</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;">
										<b>(c)</b>
										<br/> Fair market <br/> value on date <br/>   of transfer </th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;">
										<b>(d)</b>
										<br/>Cost or other<br/> basis</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 20mm; text-align: center;">
										<b>(e)</b>
										<br/>Recovery period  </th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 20mm; text-align: center;">
										<b>(f)</b>
										<br/> Section 704(c) <br/> allocation <br/>  method </th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;border-right:0;">
										<b>(g)</b>
										<br/> Gain <br/> recognized on <br/> transfer </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- Jessica 10/30/2003: Re-program using index-loop to show structure as PDF form when records are less than space reserved on PDF - Begin -->
								<!-- JMI: 09/23/04: imped repeating data trying to maintain the index loop from above -->
								<xsl:choose>
									<xsl:when test="(($p1RecCount1 &gt; $defaultRows) or ($p1RecCount2 &gt; $defaultRows) or ($p1RecCount3 &gt; $defaultRows) or ($p1RecCount4 &gt; $defaultRows) or ($p1RecCount5 &gt; $defaultRows)) and ($Print = $Separated)">
										<!-- Part I: Rows of Cash - Begin -->
										<tr>
											<td class="styForm8865ScheduleOTablesCells" scope="row" style="width: 20mm;text-align: left;" colspan="2"> Cash</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 20mm; text-align: left; padding-left: 1.5mm">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/DispositionsReportableGrp/PropertyDesc"/>
													<xsl:with-param name="ShortMessage" select="'true'"/>
												</xsl:call-template>
											</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 28mm;height: 4mm; background-color:lightgrey"> </td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; text-align: right">
												<span style="width:4px;"/>
											</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; height: 4mm; background-color:lightgrey"> </td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 20mm; height: 4mm; background-color:lightgrey"> </td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 20mm; height: 4mm; background-color:lightgrey"> </td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; height: 4mm; background-color:lightgrey;border-right:0;"> </td>
										</tr>
										<!-- Part I: Rows of Cash - End -->
										<!-- Part I: Rows of Marketable Securities - Begin -->
										<xsl:call-template name="p1FillerTemplate">
											<xsl:with-param name="max" select="$defaultRows"/>
											<xsl:with-param name="PropertyType">Stock, notes receivable and payable, and other <br/>securities</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Marketable Securities - End -->
										<!-- Part I: Rows of Inventory - Begin -->
										<xsl:call-template name="p1FillerTemplate">
											<xsl:with-param name="max" select="$defaultRows"/>
											<xsl:with-param name="PropertyType">Inventory</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Inventory - End -->
										<!-- Part I: Rows of Tangible Property - Begin -->
										<xsl:call-template name="p1FillerTemplate">
											<xsl:with-param name="max" select="$defaultRows"/>
											<xsl:with-param name="PropertyType">Tangible<br/>property<br/>used in trade<br/>or business</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Tangible Property  - End -->
										<!-- Part I: Rows of Intangible property - Begin -->
										<xsl:call-template name="p1FillerTemplate">
											<xsl:with-param name="max" select="$defaultRows"/>
											<xsl:with-param name="PropertyType">Intangible<br/>property</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Intangible property - End -->
										<!-- Part I: Rows of Other Intangible property - Begin -->
										<xsl:call-template name="p1FillerTemplate">
											<xsl:with-param name="max" select="$defaultRows"/>
											<xsl:with-param name="PropertyType">Intangible property,<br/> other than<br/> intangible property<br/>  described in section<br/> 197(f)(9)</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Other Intangible property - End -->
										<!-- Part I: Rows of Other property - Begin -->
										<xsl:call-template name="p1FillerTemplate">
											<xsl:with-param name="max" select="$defaultRows"/>
											<xsl:with-param name="PropertyType">Other<br/>property</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Other property - End -->
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="styForm8865ScheduleOTablesCells" scope="row" style="width: 20mm;text-align: left;" colspan="2"> Cash</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 20mm; text-align: center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/CashTransferDt"/>
												</xsl:call-template>
											</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 28mm;height: 4mm; background-color:lightgrey"> </td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; text-align: right">
												<span style="width:4px;"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/FairMarketValueCashAmt"/>
												</xsl:call-template>
											</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; height: 4mm; background-color:lightgrey"> </td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 20mm; height: 4mm; background-color:lightgrey"> </td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 20mm; height: 4mm; background-color:lightgrey"> </td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; height: 4mm; background-color:lightgrey;border-right:0;"> </td>
										</tr>
										<!-- Part I: Rows of Marketable Securities - Begin -->
										<xsl:call-template name="p1Template1">
											<xsl:with-param name="max">
												<xsl:choose>
													<xsl:when test="$p1RecCount1 &gt; $defaultRows">
														<xsl:value-of select="$p1RecCount1"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$defaultRows"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Marketable Securities - End -->
										<!-- Part I: Rows of Inventory - Begin -->
										<xsl:call-template name="p1Template2">
											<xsl:with-param name="max">
												<xsl:choose>
													<xsl:when test="$p1RecCount2 &gt; $defaultRows">
														<xsl:value-of select="$p1RecCount2"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$defaultRows"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Inventory - End -->
										<!-- Part I: Rows of Tangible Property Used in Trade or Business - Begin -->
										<xsl:call-template name="p1Template3">
											<xsl:with-param name="max">
												<xsl:choose>
													<xsl:when test="$p1RecCount3 &gt; $defaultRows">
														<xsl:value-of select="$p1RecCount3"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$defaultRows"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Tangible Property Used in Trade or Business - End -->
										<!-- Part I: Rows of Intangible Property - Begin -->
										<xsl:call-template name="p1Template4">
											<xsl:with-param name="max">
												<xsl:choose>
													<xsl:when test="$p1RecCount4 &gt; $defaultRows">
														<xsl:value-of select="$p1RecCount4"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$defaultRows"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Intangible Property - End -->
										<!-- Part I: Rows of OtherIntangible Property - Begin -->
										<xsl:call-template name="p1Template4b">
											<xsl:with-param name="max">
												<xsl:choose>
													<xsl:when test="$p1RecCount4b &gt; $defaultRows">
														<xsl:value-of select="$p1RecCount4b"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$defaultRows"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Other Intangible Property - End -->
										<!-- Part I: Rows of Other Property - Begin -->
										<xsl:call-template name="p1Template5">
											<xsl:with-param name="max">
												<xsl:choose>
													<xsl:when test="$p1RecCount5 &gt; $defaultRows">
														<xsl:value-of select="$p1RecCount5"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$defaultRows"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Other Property - End -->
										<!-- Re-program using index-loop to show structure as PDF form when records are less than space reserved on PDF - End -->
									</xsl:otherwise>
								</xsl:choose>
								<!-- Part I: Totals - Begin -->
								<tr>
									<td class="styForm8865ScheduleOTablesCells" scope="row" style="width: 20mm;text-align: left;" colspan="2"> Totals</td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 28mm;height: 4mm; background-color:lightgrey"> </td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 28mm;height: 4mm; background-color:lightgrey"> </td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 20mm; text-align: right; padding-left: 1.5mm">
										<xsl:call-template name="PopulateAmount" >
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TotalFairMarketValueAmt"/>
										</xsl:call-template>
									</td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 20mm; text-align: right; padding-left: 1.5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TotalCostOrOtherBasisAmt"/>
										</xsl:call-template>
									</td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; height: 4mm; background-color:lightgrey"> </td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; height: 4mm; background-color:lightgrey"> </td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 20mm; text-align: right; padding-left: 1.5mm;border-right:0;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TotGainRecognizedOnTransferAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td style="width:5mm;height:5mm;vertical-align:center;">3</td>
									<td style="width:160mm;height:5mm;vertical-align:center;" colspan="8">
										Enter the transferor’s percentage interest in the partnership: (a) Before the transfer 
										<xsl:if test="(count($Form8865ScheduleOData/TransferorsBeforeTransferIntRt) &lt;=1)">
											<span style="width:8mm;"/>%
										</xsl:if>
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferorsBeforeTransferIntRt"/>
										</xsl:call-template> (b) After the transfer 
										<xsl:if test="(count($Form8865ScheduleOData/TransferorsAfterTransferIntRt) &lt;=1)">
											<span style="width:8mm;"/>%
										</xsl:if>
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferorsAfterTransferIntRt"/>
										</xsl:call-template> 
									</td>
								</tr>
								<!-- Part I: Totals - End -->
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeightRowCount">
						<xsl:with-param name="DataRowCount" select="1 + $MSCount + $InvCount + $TPCount + $IPCount + $OPCount"/>
						<xsl:with-param name="containerHeight" select="21"/>
						<xsl:with-param name="containerID" select=" 'TPctn' "/>
					</xsl:call-template>
					<div class="styBB" style="float:none;clear:none;width:187mm;height:4mm;border-top:1px solid black;">
						<div class="styTitleDesc" style="font-size: 8pt;padding-left:0px;">Supplemental Information Required To Be Reported
						    <span class="styNormalText"> (see instructions):</span>
						</div>
						<br/>
					</div>
					<table class="styIRS926Table" cellspacing="0" cellpadding="0" border="0">
						<tfoot/>
						<tbody>
							<xsl:for-each select="$Form8865ScheduleOData/SupplementalInformationTxt">
								<xsl:if test="($Print != $Separated) or (count($Form8865ScheduleOData/SupplementalInformationTxt) &lt;=4)">
									<tr style="height:8mm; width: 187mm; font-size: 7pt">
										<td style="border-bottom:1px solid black; padding-left:2mm; height:5mm;width:187mm">
											<span style="width:4px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<br/>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
							<!-- 1 -->
							<!--Showing empty rows when there is no element added Ravi Venigalla 11/13/03 -->
							<xsl:if test="count($Form8865ScheduleOData/SupplementalInformationTxt) &lt; 1 or ((count($Form8865ScheduleOData/SupplementalInformationTxt) &gt;4) and ($Print =    $Separated))">
								<tr style="font-size: 7pt">
									<td style="border-bottom:1px solid black; padding-left:2mm; height:5mm; width:187mm; font-size: 7pt">
										<xsl:if test="(count($Form8865ScheduleOData/SupplementalInformationTxt) &gt;4) and ($Print = $Separated)">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/SupplementalInformationTxt"/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="(count($Form8865ScheduleOData/SupplementalInformationTxt) &lt;1)">
								<tr style="font-size: 7pt">
									<td style="border-bottom:1px solid black; padding-left:2mm; height:5mm; width:185mm; font-size: 7pt">
										<span style="width:4px"/>
									</td>
								</tr>
							</xsl:if>
							<!-- 2 -->
							<xsl:if test="count($Form8865ScheduleOData/SupplementalInformationTxt) &lt; 2 or ((count($Form8865ScheduleOData/SupplementalInformationTxt) &gt;4) and ($Print = $Separated))">
								<tr style="font-size: 7pt">
									<td style="border-bottom:1px solid black; padding-left:2mm; height:5mm; width:185mm; font-size: 7pt">
										<span style="width:4px"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form8865ScheduleOData/SupplementalInformationTxt) &lt; 3 or ((count($Form8865ScheduleOData/SupplementalInformationTxt) &gt;4) and ($Print = $Separated))">
								<tr style="font-size: 7pt">
									<td style="border-bottom:1px solid black; padding-left:2mm; height:5mm; width:185mm; font-size: 7pt">
										<span style="width:4px"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form8865ScheduleOData/SupplementalInformationTxt) &lt; 4 or ((count($Form8865ScheduleOData/SupplementalInformationTxt) &gt;4) and ($Print = $Separated))">
								<tr style="font-size: 7pt">
									<td style="border-bottom:1px solid black; padding-left:2mm; height:5mm; width:185mm; font-size: 7pt">
										<span style="width:4px"/>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<!--END Part I-->
					<!--Begin Part II-->
					<div class="styBB" style="width:187mm;height:auto;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="width:156mm;">Dispositions Reportable Under Section 6038B</div>
						<div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/DispositionsReportableGrp"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="containerID" select=" 'DTPctn' "/>
							</xsl:call-template>
						</div>
					</div>
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="display:block;" cellspacing="0" name="Dispositions6038B" id="DTPctn" summary="Table for Dispositions Reportable Under Section 6038B">
							<thead class="styTableThead">
								<tr>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(a)</b>
										<br/> Type of <br/> property</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(b)</b>
										<br/> Date of <br/> original <br/> transfer</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 20mm; text-align: center;">
										<b>(c)</b>
										<br/> Date of <br/> disposition</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 20mm; text-align: center;">
										<b>(d)</b>
										<br/> Manner of <br/> disposition</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;">
										<b>(e)</b>
										<br/> Gain <br/> recognized by <br/> partnership</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(f)</b>
										<br/> Depreciation <br/> recapture <br/> recognized by partnership</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(g)</b>
										<br/> Gain allocated <br/> to partner</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;border-right:0px;">
										<b>(h)</b>
										<br/> Depreciation <br/> recapture<br/> allocated<br/> to partner</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8865ScheduleOData/DispositionsReportableGrp">
									<xsl:if test="($Print != $Separated) or (count($Form8865ScheduleOData/DispositionsReportableGrp)&lt;=4)">
										<tr>
											<td class="styForm8865ScheduleOPartIITableCell" scope="row" style="width:23mm;text-align:left;padding-top:1.5mm;">
												<!-- Form to Form Link -->
												<span style="width:3mm; text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="PropertyDesc"/>
													</xsl:call-template>
												</span>
												<span style="width:2px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8865ScheduleOPartIITableCell" style="width:23mm;text-align:center;padding-top:1.5mm;">
												<!-- Form to Form Link -->
												<span style="width:3mm;text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="TransferDt"/>
													</xsl:call-template>
												</span>
												<span style="width:2px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransferDt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8865ScheduleOPartIITableCell" style="width: 20mm; border-left:0px; text-align: center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DispositionDt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8865ScheduleOPartIITableCell" style="width: 20mm;text-align: left; ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MannerOfDispositionTxt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8865ScheduleOPartIITableCell" style="width: 27mm; border-left:0px;text-align: right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PartnershipGainAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8865ScheduleOPartIITableCell" style="width: 23mm; border-left:0px; text-align: right; ">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeprecRcptrRcgnzByPrtshpAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8865ScheduleOPartIITableCell" style="width: 23mm; border-left:0px; text-align: right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainAllocatedToPartnerAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8865ScheduleOPartIITableCell" style="width: 27mm; border-right:0px; text-align: right; ">
												<!-- Form to Form Link -->
												<span style="width:3mm; text-align:left;" class="styGenericDiv">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DeprecRcptrAllocnToPrtnrAmt"/>
													</xsl:call-template>
												</span>
												<span style="float:right;text-align:left;" class="styGenericDiv">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DeprecRcptrAllocnToPrtnrAmt"/>
													</xsl:call-template>
												</span>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:if test="count($Form8865ScheduleOData/DispositionsReportableGrp)&lt; 1 or (($Print = $Separated) and  (count($Form8865ScheduleOData/DispositionsReportableGrp)&gt; 4))">
									<tr>
										<td class="styForm8865ScheduleOPartIITableCell" style="text-align:left;">
											<span class="styTableCellPad"/>
											<xsl:if test="((count($Form8865ScheduleOData/DispositionsReportableGrp) &gt;4) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/DispositionsReportableGrp/PropertyDesc"/>
													<xsl:with-param name="ShortMessage" select="'true'"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8865ScheduleOData/DispositionsReportableGrp)&lt; 2 or (($Print = $Separated) and  (count($Form8865ScheduleOData/DispositionsReportableGrp)&gt; 4)) ">
									<tr>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8865ScheduleOData/DispositionsReportableGrp)&lt; 3 or (($Print = $Separated) and  (count($Form8865ScheduleOData/DispositionsReportableGrp)&gt; 4)) ">
									<tr>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8865ScheduleOData/DispositionsReportableGrp)&lt; 4 or (($Print = $Separated) and  (count($Form8865ScheduleOData/DispositionsReportableGrp)&gt; 4)) ">
									<tr>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					<!--Set initial height of the Dispositions Reportable table-->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/DispositionsReportableGrp"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'DTPctn' "/>
					</xsl:call-template>
					<!--END Part II-->
					
					<!-- BEGIN Part III Title -->
					<div class="styTableContainer" style="height:8mm;width:187mm;border-bottom:1px solid black;display:block;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="width:133mm;">
							<span class="styNormalText">
							    Is any transfer reported on this schedule subject to gain recognition under section 904(f)(3) or
							    section 904(f)(5)(F)?
								
							    <!-- Form to Form Link -->
								<span style="width:2px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferRptOnSubjectToGainInd"/>
								</xsl:call-template>
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
									<span style="width:6px;"/>
								</span>
								<img src="{$ImagePath}/8865SchO_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
							</span>
						</div>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferRptOnSubjectToGainInd"/>
							</xsl:call-template>
							<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;padding-top:3mm;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferRptOnSubjectToGainInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferRptOnSubjectToGainInd"/>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:8px"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferRptOnSubjectToGainInd"/>
									</xsl:call-template>
									<span class="styBoldText">
									 Yes 
								   </span>
								</label>
							</div>
							<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;padding-top:3mm;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferRptOnSubjectToGainInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferRptOnSubjectToGainInd"/>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:8px"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferRptOnSubjectToGainInd"/>
									</xsl:call-template>
									<span class="styBoldText">
									 No 
								   </span>
								</label>
							</div>
						</span>
					</div>
					<!-- END Part III Title -->
					<div style="width:187mm;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see the Instructions for Form 8865. </span>
						<span style="width:32px;"/>  
      Cat. No. 25909U
      <span style="width:36px;"/>
						<span class="styBoldText">Schedule O (Form 8865) 2017</span>
					</div>
					<br/>
					<div class="pageEnd"/>
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
							<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- JMI -->
					<!-- JMI: Additional Data Table-->
					<!-- Separated Data for Part I -->
					<xsl:if test="($Print = $Separated) and  (($p1RecCount1 &gt; $defaultRows) or ($p1RecCount2 &gt; $defaultRows) or ($p1RecCount3 &gt; $defaultRows) or ($p1RecCount4 &gt; $defaultRows) or ($p1RecCount4b &gt; $defaultRows) or ($p1RecCount5 &gt; $defaultRows))">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 8865 Schedule O, Part I - Transfers Reportable Under Section 6038B:</span>
						<table class="styDepTbl" style="font-size:7pt;" cellspacing="0" cellpadding="0">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;"> Type of <br/> property</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(a)</b>
										<br/> Date of <br/> transfer</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(b)</b>
										<br/> Number of <br/> items <br/> transferred</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(c)</b>
										<br/> Fair market <br/> value on date <br/> of transfer</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;">
										<b>(d)</b>
										<br/> Cost or other <br/> basis</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 17mm; text-align: center;">
										<b>(e)</b>
										<br/> Section 704(c) <br/> allocation <br/> method</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(f)</b>
										<br/> Gain <br/> recognized on <br/> transfer</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<tr>
									<xsl:attribute name="class">styDepTblRow1</xsl:attribute>
									<td class="styForm8865ScheduleOTablesCells" scope="row" style="width: 23mm;text-align: left;"> Cash</td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 23mm; text-align: center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/CashTransferDt"/>
										</xsl:call-template>
									</td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 20mm;height: 4mm; background-color:lightgrey"> </td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 23mm; text-align: right">
										<span style="width:4px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/FairMarketValueCashAmt"/>
										</xsl:call-template>
									</td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; height: 4mm; background-color:lightgrey"> </td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 20mm; height: 4mm; background-color:lightgrey"> </td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 23mm; height: 4mm; background-color:lightgrey"> </td>
								</tr>
								<!-- Part I: Rows of Marketable Securities - Begin -->
								<tr>
									<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
													<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left">
														  Stock, notes receivable and payable, and other <br/>securities  
														</td>
													<td colspan="6">
													<xsl:for-each select="$Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp">
														<xsl:variable name="index" select="position()"/>
														<xsl:variable name="max" select="count($Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp)"/>
														<xsl:if test="$index &lt;= $max">
														<table cellspacing="0" cellpadding="0" >
															<tbody>
																<tr>
																	<td class="styForm8865ScheduleOTablesCells" style="width:26.5mm;text-align:center">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp[$index]/TransferDt"/>
																		</xsl:call-template>
																	</td>
																	<!-- **************** this is where the line starts  ***************** -->
																	<td class="styForm8865ScheduleOTablesCells" style="width:26.75mm;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp[$index]/PropertyDesc"/>
																			<!--   <xsl:with-param name="MaxSize" select="10" />   -->
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:27.25mm;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp[$index]/FairMarketValueOnDtOfTrnsfrAmt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:31.25mm;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp[$index]/CostOrOtherBasisAmt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:23.25mm;text-align:left">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp[$index]/SectionAllocationMethodTxt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:27.25mm;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp[$index]/GainRecognizedOnTransferAmt"/>
																		</xsl:call-template>
																	</td>
																</tr>
															</tbody>
														</table>
														</xsl:if>
													</xsl:for-each>
													</td>
												</tr>
										<!-- Part I: Rows of Marketable Securities - End -->
										<!-- Part I: Rows of Inventory - Begin -->
										
												<tr>
													<xsl:attribute name="class">styDepTblRow1</xsl:attribute>
													<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left">
													  Inventory             
													</td>
													<td colspan="6">
													<xsl:for-each select="$Form8865ScheduleOData/InventoryTransfersGrp">
														<xsl:variable name="index" select="position()"/>
														<xsl:variable name="max" select="count($Form8865ScheduleOData/InventoryTransfersGrp)"/>
														<xsl:if test="$index &lt;= $max">
														<table cellspacing="0" cellpadding="0" >
															<tbody>
																<tr>
																	<td class="styForm8865ScheduleOTablesCells" style="width:26.5mm;text-align:center">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/InventoryTransfersGrp[$index]/TransferDt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:26.75mm;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/InventoryTransfersGrp[$index]/PropertyDesc"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:27.25mm;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/InventoryTransfersGrp[$index]/FairMarketValueOnDtOfTrnsfrAmt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:31.25mm;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/InventoryTransfersGrp[$index]/CostOrOtherBasisAmt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:23.25mm;text-align:left">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/InventoryTransfersGrp[$index]/SectionAllocationMethodTxt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:27.25mm;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/InventoryTransfersGrp[$index]/GainRecognizedOnTransferAmt"/>
																		</xsl:call-template>
																	</td>
																</tr>
															</tbody>
														</table>
														</xsl:if>
													</xsl:for-each>
													</td>
												</tr>
										<!-- Part I: Rows of Inventory - End -->
										<!-- Part I: Rows of Tangible Property Used in Trade or Business - Begin -->
										
												<tr>
													<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
													<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left">
													  Tangible<br/>property<br/>used in trade<br/>or business      
													</td>
													<td colspan="6">
													<xsl:for-each select="$Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp">
														<xsl:variable name="index" select="position()"/>
														<xsl:variable name="max" select="count($Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp)"/>
														<xsl:if test="$index &lt;= $max">
														<table cellspacing="0" cellpadding="0" >
															<tbody>
																<tr>
																	<td class="styForm8865ScheduleOTablesCells" style="width:26.5mm;text-align:center">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp[$index]/TransferDt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:26.75mm;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp[$index]/PropertyDesc"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:27.25mm;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp[$index]/FairMarketValueOnDtOfTrnsfrAmt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:31.25mm;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp[$index]/CostOrOtherBasisAmt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:23.25mm;text-align:left">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp[$index]/SectionAllocationMethodTxt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:27.25mm;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp[$index]/GainRecognizedOnTransferAmt"/>
																		</xsl:call-template>
																	</td>
																</tr>
															</tbody>
														</table>
														</xsl:if>
													</xsl:for-each>
													</td>
												</tr>
										<!-- Part I: Rows of Tangible Property Used in Trade or Business - End -->
										<!-- Part I: Rows of Intangible Property - Begin -->
										
												<tr>
													<xsl:attribute name="class">styDepTblRow1</xsl:attribute>
													<td scope="row" style="text-align:left;font-size: 6pt;height: 5mm;font-weight: normal;border-right:1px solid black;border-bottom:1px solid black;padding-right:0.5mm;padding-left:0.5mm">
															Intangible property<br/>  described in section<br/> 197(f)(9)
														</td>
													<td colspan="6">
													<xsl:for-each select="$Form8865ScheduleOData/IntangiblePropSect197f9Grp">
														<xsl:variable name="index" select="position()"/>
														<xsl:variable name="max" select="count($Form8865ScheduleOData/IntangiblePropSect197f9Grp)"/>
														<xsl:if test="$index &lt;= $max">
														<table cellspacing="0" cellpadding="0" >
															<tbody>
																<tr>
																	<td style="width:26.5mm;text-align:center;font-size: 6pt;height: 5mm;font-weight: normal;border-right:1px solid black;border-bottom:1px solid black;padding-right:0.5mm;padding-left:0.5mm">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropSect197f9Grp[$index]/TransferDt"/>
																		</xsl:call-template>
																	</td>
																	<td  style=" width:26.75mm;font-size: 6pt;height: 5mm;font-weight: normal;text-align: right;border-right:1px solid black;border-bottom:1px solid black;padding-right:0.5mm;padding-left:0.5mm">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropSect197f9Grp[$index]/PropertyDesc"/>
																		</xsl:call-template>
																	</td>
																	<td  style=" width:27.25mm;font-size: 6pt;height: 5mm;font-weight: normal;text-align: right;border-right:1px solid black;border-bottom:1px solid black;padding-right:0.5mm;padding-left:0.5mm">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropSect197f9Grp[$index]/FairMarketValueOnDtOfTrnsfrAmt"/>
																		</xsl:call-template>
																	</td>
																	<td  style=" width:31.25mm;font-size: 6pt;height: 5mm;font-weight: normal;text-align: right;border-right:1px solid black;border-bottom:1px solid black;padding-right:0.5mm;padding-left:0.5mm">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropSect197f9Grp[$index]/CostOrOtherBasisAmt"/>
																		</xsl:call-template>
																	</td>
																	<td style="width:23.25mm;text-align:left;font-size: 6pt;height: 5mm;font-weight: normal;border-right:1px solid black;border-bottom:1px solid black;padding-right:0.5mm;padding-left:0.5mm">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropSect197f9Grp[$index]/SectionAllocationMethodTxt"/>
																		</xsl:call-template>
																	</td>
																	<td style=" width:27.25mm;font-size: 6pt;height: 5mm;font-weight: normal;text-align: right;border-right:1px solid black;border-bottom:1px solid black;padding-right:0.5mm;padding-left:0.5mm">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropSect197f9Grp[$index]/GainRecognizedOnTransferAmt"/>
																		</xsl:call-template>
																	</td>
																</tr>
															</tbody>
														</table>
														</xsl:if>
													</xsl:for-each>
													</td>
												</tr>
										<!-- Part I: Rows of Intangible Property - End -->
										<!-- Part I: Rows of Other Intangible Property - Begin -->
										
												<tr>
													<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
													<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left">
														  Intangible property,<br/> other than<br/> intangible property<br/>  described in section<br/> 197(f)(9)
													</td>
													<td colspan="6">
													<xsl:for-each select="$Form8865ScheduleOData/IntangiblePropNotSect197f9Grp">
														<xsl:variable name="index" select="position()"/>
														<xsl:variable name="max" select="count($Form8865ScheduleOData/IntangiblePropNotSect197f9Grp)"/>
														<xsl:if test="$index &lt;= $max">
														<table cellspacing="0" cellpadding="0" >
															<tbody>
																<tr>
																	<td class="styForm8865ScheduleOTablesCells" style="text-align:center;width:26.5mm;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropNotSect197f9Grp[$index]/TransferDt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:26.75mm;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropNotSect197f9Grp[$index]/PropertyDesc"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:27.25mm;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropNotSect197f9Grp[$index]/FairMarketValueOnDtOfTrnsfrAmt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:31.25mm;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropNotSect197f9Grp[$index]/CostOrOtherBasisAmt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="text-align:left;width:23.25mm;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropNotSect197f9Grp[$index]/SectionAllocationMethodTxt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:27.25mm;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropNotSect197f9Grp[$index]/GainRecognizedOnTransferAmt"/>
																		</xsl:call-template>
																	</td>
																</tr>
															</tbody>
														</table>
														</xsl:if>
													</xsl:for-each>
													</td>
												</tr>
										<!-- Part I: Rows of Intangible Property - End -->
										<!-- Part I: Rows of Other Property - Begin -->
												<tr>
													<xsl:attribute name="class">styDepTblRow1</xsl:attribute>
														<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left;vertical-align:center;">
														  Other<br/>property  
														</td>
													<td colspan="6">
													<xsl:for-each select="$Form8865ScheduleOData/OtherPropertyTransfersGrp">
														<xsl:variable name="index" select="position()"/>
														<xsl:variable name="max" select="count($Form8865ScheduleOData/OtherPropertyTransfersGrp)"/>
														<xsl:if test="$index &lt;= $max">
														<table cellspacing="0" cellpadding="0" >
															<tbody>
																<tr>
																	<td class="styForm8865ScheduleOTablesCells" style="width:26.5mm;text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherPropertyTransfersGrp[$index]/TransferDt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:26.75mm;border-bottom:1px solid black;border-right:1px solid black;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherPropertyTransfersGrp[$index]/PropertyDesc"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:27.25mm;border-bottom:1px solid black;border-right:1px solid black;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherPropertyTransfersGrp[$index]/FairMarketValueOnDtOfTrnsfrAmt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:31.25mm;border-bottom:1px solid black;border-right:1px solid black;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherPropertyTransfersGrp[$index]/CostOrOtherBasisAmt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:23.25mm;text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherPropertyTransfersGrp[$index]/SectionAllocationMethodTxt"/>
																		</xsl:call-template>
																	</td>
																	<td class="styForm8865ScheduleOTablesCells" style="width:27.25mm;border-bottom:1px solid black;border-right:1px solid black;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherPropertyTransfersGrp[$index]/GainRecognizedOnTransferAmt"/>
																		</xsl:call-template>
																	</td>
																</tr>
															</tbody>
														</table>
														</xsl:if>
													</xsl:for-each>
													</td>
												</tr>
										<!-- Part I: Rows of Other Property - End -->
								<!-- Part I: Total Row - Begin -->
								<tr>
									<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align: left;"> Totals</td>
									<td class="styForm8865ScheduleOTablesCells" style="height: 4mm; background-color:lightgrey"> </td>
									<td class="styForm8865ScheduleOTablesCells" style="height: 4mm; background-color:lightgrey"> </td>
									<td class="styForm8865ScheduleOTablesCells" style="text-align: left; padding-left: 1.5mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TotalFairMarketValueAmt"/>
										</xsl:call-template>
									</td>
									<td class="styForm8865ScheduleOTablesCells" style="text-align: left; padding-left: 1.5mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TotalCostOrOtherBasisAmt"/>
										</xsl:call-template>
									</td>
									<td class="styForm8865ScheduleOTablesCells" style="height: 4mm; background-color:lightgrey"> </td>
									<td class="styForm8865ScheduleOTablesCells" style="text-align: left; padding-left: 1.5mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TotGainRecognizedOnTransferAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Part I: Total Row - End -->
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Data for Part I -->
					<!-- Separated Data for Part I - Supplemental Info. -->
					<xsl:if test="($Print = $Separated) and  (count($Form8865ScheduleOData/SupplementalInformationTxt) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 8865 Schedule O, Part I - Supplemental Information Required To Be Reported:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="padding-left:5mm; padding-bottom:4mm">
										<br/>Supplemental Information Required To Be Reported (see instructions)<br/>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8865ScheduleOData/SupplementalInformationTxt">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" style="width:184mm; height:7mm">
											<span style="width:4px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Data for Part I - Supplemental Info. -->
					<!-- Separated Data for Part II HERE -->
					<xsl:if test="($Print = $Separated) and  (count($Form8865ScheduleOData/DispositionsReportableGrp) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 8865 Schedule O, Part II - Dispositions Reportable Under Section 6038B:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(a)</b>
										<br/> Type of <br/> property</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(b)</b>
										<br/> Date of <br/> original <br>/ </br> transfer</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(c)</b>
										<br/> Date of disposition</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(d)</b>
										<br/> Manner of disposition</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;">
										<b>(e)</b>
										<br/> Gain recognized by partnership</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 17mm; text-align: center;">
										<b>(f)</b>
										<br/> Depreciation recapture recognized by partnership</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(g)</b>
										<br/> Gain allocated to partner</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;border-right:0px;">
										<b>(h)</b>
										<br/> Depreciation <br/> recapture<br/> allocated<br/> to partner</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8865ScheduleOData/DispositionsReportableGrp">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styForm8865ScheduleOPartIITableCell" scope="row" style="width:23mm;text-align:left;padding-top:1.5mm;">
											<!-- Form to Form Link -->
											<span style="width:3mm;text-align:left;">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
											</span>
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="width:23mm;text-align:center;padding-top:1.5mm;">
											<!-- Form to Form Link -->
											<span style="width:3mm; text-align:left;">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="TransferDt"/>
												</xsl:call-template>
											</span>
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransferDt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="width: 20mm; border-left:0px; text-align: center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DispositionDt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="width: 20mm;text-align: left; ">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MannerOfDispositionTxt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="width: 27mm; border-left:0px;text-align: right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PartnershipGainAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="width: 23mm; border-left:0px; text-align: right; ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeprecRcptrRcgnzByPrtshpAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="width: 23mm; border-left:0px; text-align: right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainAllocatedToPartnerAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="width: 27mm; border-right:0px; text-align: right; ">
											<!-- Form to Form Link -->
											<span style="width:3mm; text-align:left;" class="styGenericDiv">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="DeprecRcptrAllocnToPrtnrAmt"/>
												</xsl:call-template>
											</span>
											<span style="float:right;text-align:right;" class="styGenericDiv">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeprecRcptrAllocnToPrtnrAmt"/>
												</xsl:call-template>
											</span>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Data for Part II -->
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- Jessica 10/30/2003: Add templates for showing Part I structure as PDF form when records are less than space reserved on PDF  - Begin -->
	<xsl:template name="p1Template1">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<xsl:if test="($Print=$Separated) and ((count($Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp)&gt;4) or (count($Form8865ScheduleOData/InventoryTransfersGrp)&gt;4) or (count($Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp)&gt;4) or (count($Form8865ScheduleOData/IntangiblePropSect197f9Grp)&gt;4) or (count($Form8865ScheduleOData/IntangiblePropNotSect197f9Grp)&gt;4) or (count($Form8865ScheduleOData/OtherPropertyTransfersGrp)&gt;4))">
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when>
							<xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="$index = 1">
					<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left" colspan="2">
						<xsl:attribute name="rowspan"><xsl:value-of select="$max"/></xsl:attribute>  
					  Stock, notes receivable and payable, and other <br/>securities  
					</td>
				</xsl:if>
				<td style="font-size: 6pt;height: 5mm;font-weight: normal;text-align: center;border-right:1px solid black;border-bottom:1px solid black;  padding-right:0.5mm;padding-left:0.5mm">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp[$index]/TransferDt"/>
					</xsl:call-template>
				</td>
				<!-- **************** this is where the line starts  ***************** -->
				<td style="font-size: 6pt;height: 5mm;font-weight: normal;text-align: right;border-right:1px solid black;border-bottom:1px solid black;  padding-right:0.5mm;padding-left:0.5mm">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp[$index]/PropertyDesc"/>
						<!--   <xsl:with-param name="MaxSize" select="10" />   -->
					</xsl:call-template>
				</td>
				<td style="font-size: 6pt;height: 5mm;font-weight: normal;text-align: right;border-right:1px solid black;border-bottom:1px solid black;  padding-right:0.5mm;padding-left:0.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp[$index]/FairMarketValueOnDtOfTrnsfrAmt"/>
					</xsl:call-template>
				</td>
				<td style="font-size: 6pt;height: 5mm;font-weight: normal;text-align: right;border-right:1px solid black;border-bottom:1px solid black;  padding-right:0.5mm;padding-left:0.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp[$index]/CostOrOtherBasisAmt"/>
					</xsl:call-template>
				</td>
				<td style="font-size: 6pt;height: 5mm;font-weight: normal;text-align: left;border-right:1px solid black;border-bottom:1px solid black;  padding-right:0.5mm;padding-left:0.5mm">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp[$index]/RecoveryPrd"/>
					</xsl:call-template>
				</td>
				<td style="font-size: 6pt;height: 5mm;font-weight: normal;text-align: left;border-right:1px solid black;border-bottom:1px solid black;  padding-right:0.5mm;padding-left:0.5mm">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp[$index]/SectionAllocationMethodTxt"/>
					</xsl:call-template>
				</td>
				<td style="font-size: 6pt;height: 5mm;font-weight: normal;text-align: right;border-right:0;border-bottom:1px solid black;  padding-right:0.5mm;padding-left:0.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp[$index]/GainRecognizedOnTransferAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:call-template name="p1Template1">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="p1Template2">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<xsl:if test="($Print=$Separated) and ((count($Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp)&gt;4) or (count($Form8865ScheduleOData/InventoryTransfersGrp)&gt;4) or (count($Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp)&gt;4) or (count($Form8865ScheduleOData/IntangiblePropSect197f9Grp)&gt;4) or (count($Form8865ScheduleOData/IntangiblePropNotSect197f9Grp)&gt;4) or (count($Form8865ScheduleOData/OtherPropertyTransfersGrp)&gt;4))">
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<xsl:if test="$index = 1">
					<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left" colspan="2">
						<xsl:attribute name="rowspan"><xsl:value-of select="$max"/></xsl:attribute>        
      Inventory             
    </td>
				</xsl:if>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:center">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/InventoryTransfersGrp[$index]/TransferDt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/InventoryTransfersGrp[$index]/PropertyDesc"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/InventoryTransfersGrp[$index]/FairMarketValueOnDtOfTrnsfrAmt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/InventoryTransfersGrp[$index]/CostOrOtherBasisAmt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/InventoryTransfersGrp[$index]/RecoveryPrd"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/InventoryTransfersGrp[$index]/SectionAllocationMethodTxt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="border-right:0;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/InventoryTransfersGrp[$index]/GainRecognizedOnTransferAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:call-template name="p1Template2">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="p1Template3">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<xsl:if test="($Print=$Separated) and ((count($Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp)&gt;4) or (count($Form8865ScheduleOData/InventoryTransfersGrp)&gt;4) or (count($Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp)&gt;4) or (count($Form8865ScheduleOData/IntangiblePropSect197f9Grp)&gt;4) or (count($Form8865ScheduleOData/IntangiblePropNotSect197f9Grp)&gt;4) or (count($Form8865ScheduleOData/OtherPropertyTransfersGrp)&gt;4))">
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<xsl:if test="$index = 1">
					<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left" colspan="2">
						<xsl:attribute name="rowspan"><xsl:value-of select="$max"/></xsl:attribute>        
      Tangible<br/>property<br/>used in trade<br/>or business      
    </td>
				</xsl:if>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:center">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp[$index]/TransferDt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp[$index]/PropertyDesc"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp[$index]/FairMarketValueOnDtOfTrnsfrAmt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp[$index]/CostOrOtherBasisAmt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp[$index]/RecoveryPrd"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp[$index]/SectionAllocationMethodTxt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="border-right:0;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp[$index]/GainRecognizedOnTransferAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:call-template name="p1Template3">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="p1Template4">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<xsl:if test="($Print=$Separated) and ((count($Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp)&gt;4) or (count($Form8865ScheduleOData/InventoryTransfersGrp)&gt;4) or (count($Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp)&gt;4) or (count($Form8865ScheduleOData/IntangiblePropSect197f9Grp)&gt;4) or (count($Form8865ScheduleOData/IntangiblePropNotSect197f9Grp)&gt;4) or (count($Form8865ScheduleOData/OtherPropertyTransfersGrp)&gt;4))">
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<xsl:if test="$index = 1">
					<td scope="row" style="text-align:left;font-size: 6pt;height: 5mm;font-weight: normal;border-right:1px solid black;border-bottom:1px solid black;padding-right:0.5mm;padding-left:0.5mm" colspan="2">
						<xsl:attribute name="rowspan"><xsl:value-of select="$max"/></xsl:attribute>        
						  Intangible property<br/>  described in section<br/> 197(f)(9)
				</td>
				</xsl:if>
				<td style="text-align:center;font-size: 6pt;height: 5mm;font-weight: normal;border-right:1px solid black;border-bottom:1px solid black;padding-right:0.5mm;padding-left:0.5mm">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropSect197f9Grp[$index]/TransferDt"/>
					</xsl:call-template>
				</td>
				<td  style=" font-size: 6pt;height: 5mm;font-weight: normal;text-align: right;border-right:1px solid black;border-bottom:1px solid black;padding-right:0.5mm;padding-left:0.5mm">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropSect197f9Grp[$index]/PropertyDesc"/>
					</xsl:call-template>
				</td>
				<td  style=" font-size: 6pt;height: 5mm;font-weight: normal;text-align: right;border-right:1px solid black;border-bottom:1px solid black;padding-right:0.5mm;padding-left:0.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropSect197f9Grp[$index]/FairMarketValueOnDtOfTrnsfrAmt"/>
					</xsl:call-template>
				</td>
				<td  style=" font-size: 6pt;height: 5mm;font-weight: normal;text-align: right;border-right:1px solid black;border-bottom:1px solid black;padding-right:0.5mm;padding-left:0.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropSect197f9Grp[$index]/CostOrOtherBasisAmt"/>
					</xsl:call-template>
				</td>
				<td style="font-size: 6pt;height: 5mm;font-weight: normal;text-align: left;border-right:1px solid black;border-bottom:1px solid black;  padding-right:0.5mm;padding-left:0.5mm">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropSect197f9Grp[$index]/RecoveryPrd"/>
					</xsl:call-template>
				</td>
				<td style="text-align:left;font-size: 6pt;height: 5mm;font-weight: normal;border-right:1px solid black;border-bottom:1px solid black;padding-right:0.5mm;padding-left:0.5mm">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropSect197f9Grp[$index]/SectionAllocationMethodTxt"/>
					</xsl:call-template>
				</td>
				<td style=" font-size: 6pt;height: 5mm;font-weight: normal;text-align: right;border-right:0;border-bottom:1px solid black;padding-right:0.5mm;padding-left:0.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropSect197f9Grp[$index]/GainRecognizedOnTransferAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:call-template name="p1Template4">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="p1Template4b">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<xsl:if test="($Print=$Separated) and ((count($Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp)&gt;4) or (count($Form8865ScheduleOData/InventoryTransfersGrp)&gt;4) or (count($Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp)&gt;4) or (count($Form8865ScheduleOData/IntangiblePropSect197f9Grp)&gt;4) or (count($Form8865ScheduleOData/IntangiblePropNotSect197f9Grp)&gt;4) or (count($Form8865ScheduleOData/OtherPropertyTransfersGrp)&gt;4))">
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<xsl:if test="$index = 1">
					<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left" colspan="2">
						<xsl:attribute name="rowspan"><xsl:value-of select="$max"/></xsl:attribute>        
						  Intangible property,<br/> other than<br/> intangible property<br/>  described in section<br/> 197(f)(9)
				</td>
				</xsl:if>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:center">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropNotSect197f9Grp[$index]/TransferDt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropNotSect197f9Grp[$index]/PropertyDesc"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropNotSect197f9Grp[$index]/FairMarketValueOnDtOfTrnsfrAmt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropNotSect197f9Grp[$index]/CostOrOtherBasisAmt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropNotSect197f9Grp[$index]/RecoveryPrd"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropNotSect197f9Grp[$index]/SectionAllocationMethodTxt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="border-right:0;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangiblePropNotSect197f9Grp[$index]/GainRecognizedOnTransferAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:call-template name="p1Template4b">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="p1Template5">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<xsl:if test="($Print=$Separated) and ((count($Form8865ScheduleOData/StkNtsRcvblPyblOtherSecGrp)&gt;4) or (count($Form8865ScheduleOData/InventoryTransfersGrp)&gt;4) or (count($Form8865ScheduleOData/TngblPropUsedInTradeOrBusGrp)&gt;4) or (count($Form8865ScheduleOData/IntangiblePropSect197f9Grp)&gt;4) or (count($Form8865ScheduleOData/IntangiblePropNotSect197f9Grp)&gt;4) or (count($Form8865ScheduleOData/OtherPropertyTransfersGrp)&gt;4))">
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<xsl:if test="$index = 1">
					<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left" colspan="2">
						<xsl:attribute name="rowspan"><xsl:value-of select="$max"/></xsl:attribute>        
					  Other<br/>property  
					</td>
				</xsl:if>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:center">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherPropertyTransfersGrp[$index]/TransferDt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherPropertyTransfersGrp[$index]/PropertyDesc"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherPropertyTransfersGrp[$index]/FairMarketValueOnDtOfTrnsfrAmt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherPropertyTransfersGrp[$index]/CostOrOtherBasisAmt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherPropertyTransfersGrp[$index]/RecoveryPrd"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherPropertyTransfersGrp[$index]/SectionAllocationMethodTxt"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="border-right:0;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherPropertyTransfersGrp[$index]/GainRecognizedOnTransferAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:call-template name="p1Template5">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Jessica 10/30/2003: Add templates for showing Part I structure as PDF form when records are less than space reserved on PDF - End -->
	<!-- JMI -->
	<xsl:template name="p1FillerTemplate">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:param name="PropertyType"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<xsl:if test="$index = 1">
					<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left" colspan="2">
						<xsl:attribute name="rowspan"><xsl:value-of select="$max"/></xsl:attribute>
						<xsl:value-of select="$PropertyType"/>
					</td>
				</xsl:if>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<span style="width:4px"/>
					<xsl:if test="$index = 1">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/DispositionsReportableGrp/PropertyDesc"/>
							<xsl:with-param name="ShortMessage" select="'true'"/>
						</xsl:call-template>
					</xsl:if>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<span style="width:4px"/>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<span style="width:4px"/>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<span style="width:4px"/>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<span style="width:4px"/>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<span style="width:4px"/>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left;border-right:0;">
					<span style="width:4px"/>
				</td>
			</tr>
			<xsl:call-template name="p1FillerTemplate">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>