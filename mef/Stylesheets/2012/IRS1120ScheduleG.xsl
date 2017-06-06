<?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE xsl:stylesheet [
	  <!ENTITY nbsp "&#160;">
  ]>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
		<xsl:strip-space elements="*"/>
		<xsl:include href="PopulateTemplate.xsl"/>
		<xsl:include href="AddHeader.xsl"/>
		<xsl:include href="CommonPathRef.xsl"/>
		<xsl:include href="AddOnTable.xsl"/>
		<xsl:include href="IRS1120ScheduleGStyle.xsl"/>
		<xsl:param name="FormData" select="$RtnDoc/IRS1120ScheduleG"/>
		<xsl:template match="/">
		<html>
			<head>
				<!--  Set Document Title  -->
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
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<!-- Set Target to Top -->
				<!-- <meta http-equiv="Window-target" content="_top" /> -->
				<!-- Set Filename and Description -->
				<meta name="Description" content="Schedule G (Form 1120)"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--Note:
						Part I Table; Form PDF shows 10 data rows and scroll bar will display on 11 data rows;
						Part II Table: Form PDF shows 10 data rows and no scroll bar will display becz table is at the end of the form.
					-->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120ScheduleGStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<!-- <body onload="init();"> -->
			<body class="styBodyClass">
				<form name="Form1120ScheduleG">
					<!-- END FORM HEADER -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="IRS1120ScheduleG_styBB" style="width:187mm;">
						<div class="styFNBox" style="width:33.3mm;height:23mm;">
							<div class="styFormNumber" style="font-size: 10pt;">
								SCHEDULE G<br/>
								<div class="styFormNumber" style="font-size: 9pt;">(Form 1120)</div>
                <span style="font-size:7pt;">(Rev. December 2011) </span> 
							</div>
							<!--General Dependency Push Pin -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:120mm;height:23mm;">
							<div class="styMainTitle" style="height:8mm;">
                Information on Certain Persons Owning the
                <span style=" padding-left:2mm;width:118mm;text-align:center">
                  Corporation's Voting Stock 
                </span>
							</div>
							<br/>
							<span style="text-align:center;">
								<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
								<b>Attach to Form 1120. </b>
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:23mm;">
							<div class="styOMB" style="height:2mm;border-bottom-width:0px;">OMB No. 1545-0123</div>
							<!--<div class="styTY" style="height:10mm;padding-top:2mm">20<span class="styTYColor">11</span></div>-->
						</div>
					</div>
					<!-- BEGIN FORM HEADER -->
					<!-- BEGIN TAXPAYER INFO -->
					<div style="width:186mm;float:left;clear:left;border-top:1 solid black;">
						<!-- Name -->
						<div class="styNameBox" style="width:136mm;height:8mm;font-size:7pt;font-weight:normal;">
              Name<br/>
							<span>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<!-- EIN -->
						<div class="styEINBox" style="width:50mm;height:8mm;padding-left:2mm;font-size:6pt;font-weight:bold;">
              Employer identification number (EIN)
              <br/>
							<br/>
							<span style="text-align:left;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- END TAXPAYER INFO -->
					<!-- BEGIN PART I HEADER -->
					<!-- BEGIN PART I -->
					<div class="styBB" style="width:187mm;border-top-width:1px">
						<div class="styPartName" style="width:23mm;">Part I</div>
						<div class="styPartDesc" style="width:164mm;font-weight:normal">
							<b>Certain Entities Owning the Corporation’s Voting Stock. </b>(Form 1120, Schedule K, 
                Question 4a). Complete columns (i) through (v) below for any foreign or domestic corporation,
                partnership (including any entity treated as a partnership), trust, or tax-exempt organization
                that owns directly 20% or more, or owns, directly or indirectly, 50% or more of the total voting
                power of all classes of the corporation’s stock entitled to vote (see instructions).
						</div>
					</div>
					<div>
						<!--   END PART I HEADER   -->
						<!-- button display logic -->
						<div class="styBB" style="width:187mm;float:none;clear:none;border-top-width:1px;">
							<div class="styGenericDiv" style="height:4mm;padding-top:0mm;float:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/EntityInformation"/>
									<xsl:with-param name="containerHeight" select="6"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select="'EntityInformationTableContainer'"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end button display logic -->
						<!-- END PART I HEADER -->
						<div class="IRS1120ScheduleG_styTableContainer" id="EntityInformationTableContainer">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="IRS1120ScheduleG_styTable" cellspacing="0" name="STCapGainTable" id="STCapGainTable">
								<!-- BEGIN PART I TABLE HEADER -->
								<tr>
									<th class="IRS1120ScheduleG_styTableCellA" style="width:70mm;text-align:center;font-weight:normal;" scope="col">
										(i) Name of Entity 
									</th>
									<th class="IRS1120ScheduleG_styTableCellB" style="width20mm;font-weight:normal;" scope="col">
										(ii) Employer Identification Number<br/> (if any) 
									</th>
									<th class="IRS1120ScheduleG_styTableCellC" style="text-align:center;font-weight:normal;" scope="col">
										(iii) Type of Entity
									</th>
									<th class="IRS1120ScheduleG_styTableCellD" style="text-align:center;font-weight:normal;" scope="col">
										(iv) Country of<br/>Organization
									</th>
									<th class="IRS1120ScheduleG_styTableCellE" style="text-align:center;font-weight:normal;border-right-width:0px" scope="col">
										(v) Percentage Owned<br/>in Voting Stock
									</th>
								</tr>
								<!-- END PART I TABLE HEADER -->
								<!-- BEGIN PART I TABLE -->
								<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
								<!-- If the print parameter is separated, but there are fewer elements than the container height (7) -->
								<xsl:if test="($Print != $Separated) or (count($FormData/EntityInformation) &lt;= 6) ">
									<xsl:for-each select="$FormData/EntityInformation">
										<tr>
											<td class="IRS1120ScheduleG_styTableCellA" style="width:70mm;" scope="row">
												<!-- If this is the last row, do not display a bottom line -->
												<xsl:if test="(position() = last()) and (count($FormData/EntityInformation) &gt;5)">
													<xsl:attribute name="style">border-bottom-width:0px;width:70mm;</xsl:attribute>
												</xsl:if>
												<!--<span class="IRS1120ScheduleG_styLN" style="font-size:8pt;">
													<xsl:if test="position() = 1"/></span>-->
												<!--modify left border for this cell here -->
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2"/>
												</xsl:call-template>
											</td>
											<td class="IRS1120ScheduleG_styTableCellB" style="padding-left:2mm;text-align:left">
												<xsl:if test="EmplrIdentificationNumber">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EmplrIdentificationNumber"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="EINMissingReason">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="EINMissingReason"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="IRS1120ScheduleG_styTableCellC" style="padding-left:2mm;text-align:left">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EntityType"/>
												</xsl:call-template>
											</td>
											<td class="IRS1120ScheduleG_styTableCellD" style="padding-left:2mm;text-align:center">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryOfOrganization"/>
												</xsl:call-template>
											</td>
											<td class="IRS1120ScheduleG_styTableCellE" style="text-align:right;padding-right:4mm;border-right-width:0px">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="PercentageOwnedVotingStock"/>
												</xsl:call-template>
											</td>
											<td class="IRS1120ScheduleG_styTableLastCol" id="Table1LastCol"/>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Build blank row 1 for Part I table -->
								<xsl:if test="count($FormData/EntityInformation) &lt; 1 or 
		                  ((count($FormData/EntityInformation) &gt; 6) and ($Print = $Separated))">
									<tr>
										<td class="IRS1120ScheduleG_styTableCellA">
											<span class="IRS1120ScheduleG_styLN" style="font-size:8pt"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/EntityInformation"/>
											</xsl:call-template>
										</td>
										<td class="IRS1120ScheduleG_styTableCellB">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellC">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellD">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellE" style="border-right-width:0px">
											<span style="width: 4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Build blank row 2 for Part I table -->
								<xsl:if test="count($FormData/EntityInformation) &lt; 2 or 
		                    ((count($FormData/EntityInformation) &gt; 6) and ($Print = $Separated))">
									<tr>
										<td class="IRS1120ScheduleG_styTableCellA">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellB">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellC">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellD">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellE" style="border-right-width:0px">
											<span style="width: 4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Build blank row 3 for Part I table -->
								<xsl:if test="count($FormData/EntityInformation) &lt; 3 or
		                    ((count($FormData/EntityInformation) &gt; 6) and ($Print = $Separated))">
									<tr>
										<td class="IRS1120ScheduleG_styTableCellA">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellB">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellC">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellD">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellE" style="border-right-width:0px">
											<span style="width: 4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Build blank row 4 for Part I table -->
								<xsl:if test="count($FormData/EntityInformation) &lt; 4 or
		                    ((count($FormData/EntityInformation) &gt; 6) and ($Print = $Separated))">
									<tr>
										<td class="IRS1120ScheduleG_styTableCellA">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellB">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellC">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellD">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellE" style="border-right-width:0px">
											<span style="width: 4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Build blank row 5 for Part I table -->
								<xsl:if test="count($FormData/EntityInformation) &lt; 5 or
		                    ((count($FormData/EntityInformation) &gt; 6) and ($Print = $Separated))">
									<tr>
										<td class="IRS1120ScheduleG_styTableCellA">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellB">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellC">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellD">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellE" style="border-right-width:0px">
											<span style="width: 4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Build blank row 6 for Part I table -->
								<xsl:if test="count($FormData/EntityInformation) &lt; 6 or
		                    ((count($FormData/EntityInformation) &gt; 6) and ($Print = $Separated))">
									<tr>
										<td class="IRS1120ScheduleG_styTableCellA" style="border-bottom-width:0px">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellB" style="border-bottom-width:0px">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellC" style="border-bottom-width:0px">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellD" style="border-bottom-width:0px">
											<span style="width: 4px"/>
										</td>
										<td class="IRS1120ScheduleG_styTableCellE" style="border-bottom-width:0px;border-right-width:0px">
											<span style="width: 4px"/>
										</td>
									</tr>
								</xsl:if>
							</table>
						</div>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/EntityInformation"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select="'EntityInformationTableContainer'"/>
					</xsl:call-template>
					<!-- END PART I TABLE -->
					<!--  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&  -->
					<!-- BEGIN PART II HEADER -->
					<!-- BEGIN PART II -->
					<div class="styBB" style="width:187mm;border-top-width:0px">
						<div class="styPartName" style="width:23mm;">Part II</div>
						<div class="styPartDesc" style="width:164mm;font-weight:normal">
							<b>Certain Individuals and Estates Owning the Corporation’s Voting Stock. </b>(Form 1120, Schedule K,
							Question 4b). Complete columns (i) through (iv) below for any individual or estate that owns directly 20%
							or more, or owns, directly or indirectly, 50% or more of the total voting power of all classes of the
							corporation’s stock entitled to vote (see instructions).
						</div>
					</div>
					<!--   END PART II HEADER   -->
					<!-- BEGIN PART II TABLE -->
					<!-- button display logic -->
					<div class="styBB" style="width:187mm;float:none;clear:none;border-top-width:1px;">
						<div class="styGenericDiv" style="height:4mm;padding-top:0mm;float:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualInformation"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select="'IndividualInformationTableContainer'"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end button display logic -->
					<div class="IRS1120ScheduleG_styTableContainer" id="IndividualInformationTableContainer">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="IRS1120ScheduleG_styTable" cellspacing="0" name="STCapGainTable" id="STCapGainTable">
							<tr>
								<th class="IRS1120ScheduleG_styTableCellA" style="width:70mm;text-align:center;font-weight:normal;" scope="col">
									(i) Name of Individual or Estate 
								</th>
								<th class="IRS1120ScheduleG_styTableCellB" style="width20mm;font-weight:normal;" scope="col">
									(ii) Identifying Number <br/>(if any) 
								</th>
								<th class="IRS1120ScheduleG_styTableCellD" style="text-align:center;font-weight:normal;" scope="col">
									(iii) Country of Citzenship<br/>(see instructions)
								</th>
								<th class="IRS1120ScheduleG_styTableCellE" style="text-align:center;font-weight:normal;border-right-width:0px" scope="col">
									(iv) Percentage Owned <br/>in Voting Stock
								</th>
							</tr>
							<!-- END PART I TABLE HEADER -->
							<!-- BEGIN PART I TABLE -->
							<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
							<!-- If the print parameter is separated, but there are fewer elements than the container height (7) -->
							<xsl:if test="($Print != $Separated) or (count($FormData/IndividualInformation) &lt;= 6) ">
								<xsl:for-each select="$FormData/IndividualInformation">
									<tr>
										<td class="IRS1120ScheduleG_styTableCellA" style="width:70mm;" scope="row">
											<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="(position() = last()) and (count($FormData/IndividualInformation) &gt;5)">
												<xsl:attribute name="style">border-bottom-width:0px;width:70mm;</xsl:attribute>
											</xsl:if>
											<!--<span class="IRS1120ScheduleG_styLN" style="font-size:8pt;">
											<xsl:if test="position() = 1"/></span>-->
											<!--modify left border for this cell here -->
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="IndividualEstateName"/>
											</xsl:call-template>
										</td>
										<td class="IRS1120ScheduleG_styTableCellB" style="padding-left:2mm;text-align:left">
											<xsl:if test="IdentifyingNumber">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="IdentifyingNumber"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="IdentifyingSSNNumber">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="IdentifyingSSNNumber"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="MissingIdentifyingNumberReason">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MissingIdentifyingNumberReason"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="Blank">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Blank"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="IRS1120ScheduleG_styTableCellD" style="padding-left:2mm;text-align:center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryOfCitizenship"/>
											</xsl:call-template>
										</td>
										<td class="IRS1120ScheduleG_styTableCellE" style="text-align:right;border-right-width:0px">
											<!-- If this is the last row, do not display a bottom line
												<xsl:if test="(position() = last()) and (count($FormData/ShortTermCapitalGainAndLoss) &gt;6)">
													<xsl:attribute name="style">border-bottom-width:0px;</xsl:attribute>
												</xsl:if> -->
											<span style="text-align:left;width:3mm;" class="styGenericDiv"/>
											<span style="text-align:right;float:right;" class="styGenericDiv">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="VotingStockPercentageOwned"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="IRS1120ScheduleG_styTableLastCol" id="Table1LastCol"/>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<!-- Depending on the number of data rows, insert blank rows to fill the container height -->
							<!-- For separated print where there are more data elements than the container height, -->
							<!-- display a message in the first row directing the user to the additional data table -->
							<!-- Build blank row 1 for Part II Table -->
							<xsl:if test="count($FormData/IndividualInformation) &lt; 1 or 
		                    ((count($FormData/IndividualInformation) &gt; 6) and ($Print = $Separated))">
								<tr>
									<td class="IRS1120ScheduleG_styTableCellA">
										<span class="IRS1120ScheduleG_styLN" style="font-size:8pt"/>
										<xsl:call-template name="PopulateAdditionalDataTableMessage">
											<xsl:with-param name="TargetNode" select="$FormData/EntityInformation"/>
										</xsl:call-template>
									</td>
									<td class="IRS1120ScheduleG_styTableCellB">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellD">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellE" style="border-right-width:0px">
										<span style="width: 4px"/>
									</td>
								</tr>
							</xsl:if>
							<!-- Build blank row 2 for Part II Table -->
							<xsl:if test="count($FormData/IndividualInformation) &lt; 2 or 
		                    ((count($FormData/IndividualInformation) &gt; 6) and ($Print = $Separated))">
								<tr>
									<td class="IRS1120ScheduleG_styTableCellA">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellB">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellD">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellE" style="border-right-width:0px">
										<span style="width: 4px"/>
									</td>
								</tr>
							</xsl:if>
							<!-- Build blank row 3 for Part II Table -->
							<xsl:if test="count($FormData/IndividualInformation) &lt; 3 or
		                     ((count($FormData/IndividualInformation) &gt; 6) and ($Print = $Separated))">
								<tr>
									<td class="IRS1120ScheduleG_styTableCellA">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellB">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellC">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellD" style="border-right-width:0px">
										<span style="width: 4px"/>
									</td>
								</tr>
							</xsl:if>
							<!-- Build blank row 4 for Part II Table -->
							<xsl:if test="count($FormData/IndividualInformation) &lt; 4 or
		                    ((count($FormData/IndividualInformation) &gt; 6) and ($Print = $Separated))">
								<tr>
									<td class="IRS1120ScheduleG_styTableCellA">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellB">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellC">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellD" style="border-right-width:0px">
										<span style="width: 4px"/>
									</td>
								</tr>
							</xsl:if>
							<!-- Build blank row 5 for Part II Table -->
							<xsl:if test="count($FormData/IndividualInformation) &lt; 5 or
		                    ((count($FormData/IndividualInformation) &gt; 6) and ($Print = $Separated))">
								<tr>
									<td class="IRS1120ScheduleG_styTableCellA">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellB">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellC">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellD" style="border-right-width:0px">
										<span style="width: 4px"/>
									</td>
								</tr>
							</xsl:if>
							<!-- Build blank row 6 for Part II Table -->
							<xsl:if test="count($FormData/IndividualInformation) &lt; 6 or
		                    ((count($FormData/IndividualInformation) &gt; 6) and ($Print = $Separated))">
								<tr>
									<td class="IRS1120ScheduleG_styTableCellA" style="border-bottom-width:0px">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellB" style="border-bottom-width:0px">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellC" style="border-bottom-width:0px">
										<span style="width: 4px"/>
									</td>
									<td class="IRS1120ScheduleG_styTableCellD" style="border-bottom-width:0px;border-right-width:0px">
										<span style="width: 4px"/>
									</td>
								</tr>
							</xsl:if>
						</table>
					</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/IndividualInformation"/>
							<xsl:with-param name="containerHeight" select="6"/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerID" select="'IndividualInformationTableContainer'"/>
						</xsl:call-template>
						<!-- END PART II TABLE -->
						<!--  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&  -->
						<!-- BEGIN FOOTER -->
						<div class="IRS1120ScheduleG_styFormFooter" style="width:187mm;border-top-width: 0px;">
							<span style="width:103mm;font-weight:bold;font-size:6.5pt;" class="styGenericDiv">
								For Privacy Act and Paperwork Reduction Act Notice, see the Instructions. 
							</span>
							<span class="styGenericDiv" style="font-weight:normal;font-size:7pt;text-align:center;" >Cat. No. 52684S</span>
							<span class="styGenericDiv" style="float:right;width:57.5mm;font-weight:bold;font-size:7pt;">
								Schedule G (Form 1120) (Rev. 12-2011)
							</span>
						</div>
						<!-- BEGIN FOOTER -->
				</form>
				<!-- leftover data table -->
				<br class="pageend"/>
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
				</table>
				<!-- Additonal Data Table for Part I  -->
				<xsl:if test="($Print = $Separated) and (count($FormData/EntityInformation) &gt; 7)">
					<span class="styRepeatingDataTitle">
						<br/>Form 1120 Schedule G, Part I, - Entity Information
          </span>
					<table class="styDepTbl" style="font-size:7pt">
						<thead class="styTableHead">
							<tr>
								<th class="IRS1120ScheduleG_styTableCellA" style="width:70mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(i) Name of Entity </span>
								</th>
								<th class="IRS1120ScheduleG_styTableCellB" style="width20mm;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(ii) Employer Identification Number<br/> (if any) </span>
								</th>
								<th class="IRS1120ScheduleG_styTableCellC" style="text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(iii) Type of Entity</span>
								</th>
								<th class="IRS1120ScheduleG_styTableCellD" style="text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(iv) Country of <br/>Organization</span>
								</th>
								<th class="IRS1120ScheduleG_styTableCellE" style="text-align:center;font-weight:normal;border-right-width:0px" scope="col">
									<span style="font-weight:bold;">(v) Percentage Owned<br/>in Voting Stock</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/EntityInformation">
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<td class="IRS1120ScheduleG_styTableCellA" style="width:70mm;padding-left:2mm;text-align:left;" scope="row">
										<!-- If this is the last row, do not display a bottom line -->
										<xsl:if test="(position() = last()) and (count($FormData/EntityInformation) &gt;5)">
											<xsl:attribute name="style">border-bottom-width:0px;width:70mm;padding-left:2mm;text-align:left;</xsl:attribute>
										</xsl:if>
											<!--modify left border for this cell here -->
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2"/>
										</xsl:call-template>
									</td>
									<td class="IRS1120ScheduleG_styTableCellB" style="padding-left:2mm;text-align:left">
										<xsl:if test="EmplrIdentificationNumber">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EmplrIdentificationNumber"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="EINMissingReason">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EINMissingReason"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="IRS1120ScheduleG_styTableCellC" style="padding-left:2mm;text-align:left;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="EntityType"/>
										</xsl:call-template>
									</td>
									<td class="IRS1120ScheduleG_styTableCellD" style="text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="CountryOfOrganization"/>
										</xsl:call-template>
									</td>
									<td class="IRS1120ScheduleG_styTableCellE" style="text-align:right;padding-right:2mm;border-right-width:0px">
										<span style="text-align:left;width:3mm;" class="styGenericDiv"/>
										<span style="text-align:right;float:right;" class="styGenericDiv">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="PercentageOwnedVotingStock"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="IRS1120ScheduleG_styTableLastCol" id="Table1LastCol"/>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Part I separated data -->
				<!-- Additonal Data Table for Part II  -->
				<xsl:if test="($Print = $Separated) and (count($FormData/IndividualInformation) &gt; 7)">
					<span class="styRepeatingDataTitle">
						<br/>
            Form 1120 Schedule G, Part II  - Individual Information 
          </span>
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr>
									<th class="IRS1120ScheduleG_styTableCellA" style="width:90mm;font-weight:normal;text-align:center" scope="col">
										<span style="font-weight:bold;">(i) Name of Individual or Estate </span>
									</th>
									<th class="IRS1120ScheduleG_styTableCellA" style="width:20mm;text-align:center;font-weight:normal;" scope="col">
										<span style="font-weight:bold;text-align:center">(ii) Identifying Number<br/> (if any)</span>
									</th>
									<th class="IRS1120ScheduleG_styTableCellA" style="width:40mm;text-align:center;font-weight:normal;" scope="col">
										<span style="font-weight:bold;">(iii) Country of Citizenship<br/>(see instruction) </span>
									</th>
									<th class="IRS1120ScheduleG_styTableCellA" style="text-align:center;font-weight:normal;border-right-width:0px" scope="col">
										<span style="font-weight:bold;">(iv) Percentage<br/>Owened in Voting Stock</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IndividualInformation">
									<tr>
										<!--Define background colors to the rows -->
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="IRS1120ScheduleG_styTableCellA" style="width:70mm;padding-left:2mm;text-align:left;" scope="row">
										<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="(position() = last()) and (count($FormData/IndividualInformation) &gt;5)">
												<xsl:attribute name="style">border-bottom-width:0px;width:90mm;padding-left:2mm;text-align:left;</xsl:attribute>
											</xsl:if>
											<!--<span class="IRS1120ScheduleG_styLN" style="font-size:8pt;">
												<xsl:if test="position() = 1"/></span>-->
											<!--modify left border for this cell here -->
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="IndividualEstateName"/>
											</xsl:call-template>
										</td>
										<td class="IRS1120ScheduleG_styTableCellB" style="padding-left:2mm;text-align:left">
											<xsl:if test="IdentifyingNumber">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="IdentifyingNumber"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="IdentifyingSSNNumber">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="IdentifyingSSNNumber"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="MissingIdentifyingNumberReason">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MissingIdentifyingNumberReason"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="Blank">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Blank"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="IRS1120ScheduleG_styTableCellC" style="width:40mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryOfCitizenship"/>
											</xsl:call-template>
										</td>
										<td class="IRS1120ScheduleG_styTableCellD" style="width:36mm;text-align:right;border-right-width:0px">
											<!-- If this is the last row, do not display a bottom line
												<xsl:if test="(position() = last()) and (count($FormData/ShortTermCapitalGainAndLoss) &gt;6)">
												<xsl:attribute name="style">border-bottom-width:0px;</xsl:attribute>
												</xsl:if> -->
												<!--<span style="text-align:left;width:3mm;" class="styGenericDiv"/>-->
											<!--<span style="text-align:right;float:right;" class="styGenericDiv">-->
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="VotingStockPercentageOwned"/>
											</xsl:call-template>
											<!--</span>-->
										</td>
										<td class="IRS1120ScheduleG_styTableLastCol" id="Table1LastCol"/>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
				</xsl:if>
				<!-- End Part II separated data -->
			</body>
		</html>
		</xsl:template>
	</xsl:stylesheet>
