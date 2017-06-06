<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS2441Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form2441Data" select="$RtnDoc/IRS2441"/>
	<xsl:template match="/">
	<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form2441Data)"/>
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
				<meta name="Description" content="IRS Form 2441"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS2441Style"/>
						<xsl:call-template name="AddOnStyle"/>
				</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form2441">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form title and Form number section -->
		<div class="styTBB" style="width:187mm;">
		<div class="styFNBox" style="width:31mm;height:20mm;border-right-width:1px;font-size:7pt;">        
            Form
			<span class="styFormNumber">2441</span><br/><br/>
				<span class="styAgency">Department of the Treasury</span><br/>
				<span class="styAgency">Internal Revenue Service (99)</span>
						</div>
						<!-- Begin Form title -->
						<div class="styFTBox" style="width:120mm;height:20mm;">
							<div class="styMainTitle" style="font-size: 13pt;width:90mm;float:left;padding-top:1mm;padding-left:4mm;">Child and Dependent Care Expenses </div>
							<div class="styFTBox" style="width:15mm;float:right;clear:none;vertical-align:top;padding-top:3mm;padding-right:2mm;">
							 <img src="{$ImagePath}/2441_Form.gif" alt="Bullet"/> </div>
							<div class="styFBT" style="height:5mm;margin-top:3mm;width:90mm;">
								<img src="{$ImagePath}/2441_Bullet.gif" alt="Bullet"/> Attach to Form 1040, Form 1040A or Form 1040NR.
								<span style="width:90mm;padding-top:1mm;">
								<img src="{$ImagePath}/2441_Bullet.gif" alt="Bullet"/> Information about Form 2441 and its separate instructions is at
www.irs.gov/form2441.</span>
								</div>
						</div>
						<!-- Begin Form Tax Year -->
						<div class="styTYBox" style="width:31mm; height:20mm">
							<div style="padding-top:1mm;border-bottom:1 solid black">OMB No. 1545-0074</div>
							<div class="styTaxYear" style="font-size:21pt;">20<span class="styTYColor" style="font-size:21pt:"><b>13</b></span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No. <b style="font-size:8pt">21</b>
							</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!--Name Shown on return-->
					<div class="styBB" style="width:187mm;font-size:7pt;">
						<div class="styFNBox" style="width:140mm; height:5mm;">
                        Name(s) shown on return<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
							</xsl:call-template>
							<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
						</div>
                        <b>Your social security number</b><br/>
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
						</xsl:call-template>
					</div>
					<!-- MAIN SECTION -->
					<!-- BEGIN PART I TITLE -->
	<div class="styBB" style="width:187mm;">
		<div class="styBB" style="width:187mm;">
				<span class="styPartName" style="width:12mm;font-size:13;">Part l</span>
							<div class="styPartDesc" style="padding-left:1mm;width:168mm;font-size:8pt;">
          Persons or Organizations Who Provided the Care&#151;
    <span class="styNormalText" style="padding-left:1mm;font-size:8pt;"> You  
    <span class="styBoldText">must </span>complete this part. </span>
								<br/>
	<span class="styNormalText" style="padding-left:0mm;font-size:8pt;"> (If you have more than two care providers, see the instructions.)</span>
							</div>
							<!-- Table expand/collapse toggle button -->
							<div class="styGenericDiv" style="float:right;height:1mm;padding-top:3mm;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form2441Data/CareProviderGrp"/>
									<xsl:with-param name="containerHeight" select="2"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'CareProviderGrp' "/>
								</xsl:call-template>
							</div>
						</div>						
						<!-- END PART I TITLE -->
						<!--Part I table Header -->
<div class="styTableContainer" style="height:14mm;" id="CareProviderGrp">
<xsl:call-template name="SetInitialState"/>
	<table class="styTable" cellspacing="0" style="font-size:7pt;" summary="Table displaying Care Provider information " name="CPtable" id="CPtable">
	<thead class="styTableThead">
	<tr>
	<th class="styTableCellHeader" scope="col" colspan="1" rowspan="1" style="width:60mm;font-weight:normal;text-align: left;height:9mm; border-color:black;vertical-align:top;">
	<b>1</b>
		<span style="width:7mm;"/>
		<span style="font-weight:bold;">(a)</span>
       Care provider's <br/>
											<span style="font-weight:bold;width:1mm;font-size:7pt;"></span>
											<span style="width:17mm;"/> name
      </th>
	<th class="styTableCellHeader" scope="col" colspan="1" style="width:70mm;font-weight:normal;height:11mm; border-color:black;vertical-align:top;">
											<span style="font-weight:bold;">(b)</span>Address<br/>(number, street, apt. no., city, state, and ZIP code)
    </th>
	<th class="styTableCellHeader" scope="col" colspan="1" style="width:23mm;font-weight:normal;height:9mm;  border-color:black;vertical-align:top;">
											<span style="font-weight:bold;">(c)</span> Identifying number<br/> (SSN or EIN)
     </th>
	<th class="styTableCellHeader" scope="col" colspan="1" style="width:30mm;font-weight:normal;height:9mm;  border-color:black;vertical-align:top;">
											<span style="font-weight:bold;">(d)</span> Amount paid<br/>(see instructions)
     </th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<!-- print logic -->
									<xsl:for-each select="$Form2441Data/CareProviderGrp">
										<xsl:if test="($Print != $Separated) or (count($Form2441Data/CareProviderGrp) &lt;= 2) ">
											<tr>
								<td class="styTableCellText" style="width:64mm;border-color:black;text-align:none;vertical-align:top;padding-top:0mm">
													<!--CareProviderPersonName-->
													<xsl:choose>
														<xsl:when test="CareProviderPersonName">
													<xsl:if test="CareProviderPersonName !=''">
													<div style="text-align:left;vertical-align:top;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="CareProviderPersonName/PersonFirstName"/>
														</xsl:call-template>
												 <span style="width:1mm;"></span>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="CareProviderPersonName/PersonLastName"/>
														</xsl:call-template>
														<!--CareProviderNameControl-->
														<xsl:if test="CareProviderNameControl !=''">
														    <span style="width:1mm;"></span>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="CareProviderNameControl"/>
															</xsl:call-template>
															</xsl:if>
																 </div>
															  </xsl:if>
															  <xsl:if test="CareProviderPersonName=''">
															<span style="width:1mm;"></span>
														</xsl:if>
														</xsl:when>
														<xsl:when test="CareProviderBusinessName/BusinessNameLine1">
													<!--CareProviderBusinessName-->
													<xsl:if test="CareProviderBusinessName/BusinessNameLine1 !=''">
													<div style="text-align:left;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="CareProviderBusinessName/BusinessNameLine1"/>
														</xsl:call-template>
															<xsl:if test="CareProviderBusinessName/BusinessNameLine2 !=''">
															  <br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="CareProviderBusinessName/BusinessNameLine2"/>
														</xsl:call-template>
														</xsl:if>	
														
													<!--CareProviderBusNameCtrl-->
														<xsl:if test="$Form2441Data/CareProviderGrp/CareProviderBusNameCtrl  !=''">
													 <span style="width:1mm;"></span>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="CareProviderBusNameCtrl"/>
															</xsl:call-template>
																
															</xsl:if>
																</div>
																	
														</xsl:if>
														<xsl:if test="CareProviderBusinessName/BusinessNameLine1=''">
															<span style="width:1mm;"></span>
														</xsl:if>
														</xsl:when>
														</xsl:choose>														
												</td>
												<td class="styTableCellText" style="width:70mm;vertical-align:top;border-color:black;text-align:left;">
												<!--USAAddress-->
												<xsl:if test="$Form2441Data/CareProviderGrp/USAddress !=''">
												<div style="float:left;clear:none;">
												<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="USAddress"/>
														</xsl:call-template>
														</div>
													</xsl:if>
													<!--ForiegnAddress-->
										<xsl:if test="$Form2441Data/CareProviderGrp/ForeignAddress !=''">
														<div style="float:left;clear:none;">
												<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="ForeignAddress"/>
														</xsl:call-template>
														</div>
													</xsl:if>
													<!--SeeW2Cd-->
										<xsl:if test="$Form2441Data/CareProviderGrp/SeeW2Cd !=''">
														<div style="float:left;clear:none;">
												<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SeeW2Cd"/>
														</xsl:call-template>
														</div>
													</xsl:if>
												</td>
												<td class="styTableCellCtr" style="width:23mm;  border-color:black;text-align:center;vertical-align:top">
													<!--SSN number-->
													<xsl:if test="$Form2441Data/CareProviderGrp/SSN">
													<div style="text-align:center">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SSN"/>
														</xsl:call-template></div>
													</xsl:if>
													<!--EIN number-->
													<xsl:if test="$Form2441Data/CareProviderGrp/EIN">
													<div style="text-align:center">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template></div>
													</xsl:if>
													<!--Tax Exempt-->
													<xsl:if test="$Form2441Data/CareProviderGrp/TaxExempt">
														<div style="text-align:center">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TaxExempt"/>
														</xsl:call-template></div>
													</xsl:if>
												<!--Living Abroad Foreign Care Providers-->
													<xsl:if test="$Form2441Data/CareProviderGrp/LAFCP">
													<div style="text-align:center">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LAFCP"/>
														</xsl:call-template></div>
													</xsl:if>
												</td>
												<!--Paid amount-->
												<td class="styTableCell" style="width:30mm;  border-color:black;text-align:right;vertical-align:top">
												<div style="text-align:right">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PaidAmt"/>
													</xsl:call-template>
													</div>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
		<xsl:if test="count($Form2441Data/CareProviderGrp)&lt; 1 or ((count($Form2441Data/CareProviderGrp) &gt; 2) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:60mm;text-align:left; border-color:black">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form2441Data/CareProviderGrp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
							
											<td class="styTableCellText" style="width:70mm;  border-color:black">
												<span class="styTableCellPad"/>
											
											</td>
											<td class="styTableCellCtr" style="width:27mm;  border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;  border-color:black">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
			<xsl:if test="count($Form2441Data/CareProviderGrp)&lt; 2  or ((count($Form2441Data/CareProviderGrp) &gt; 2) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:60mm;  border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="width:70mm;  border-color:black">
											<span class="styTableCellPad"/>
											
											</td>
											<td class="styTableCellCtr" style="width:27mm;  border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;  border-color:black">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
									</table>
						</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form2441Data/CareProviderGrp"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'CareProviderGrp' "/>
							</xsl:call-template>
						<!-- END Part I table -->
						<!--instructions-->
						<div style="width:187mm;">
							<div class="styIRS2441SpaceBox"/>
							<br/>
							<div class="styIRS2441instructionBoxNBB" style="height:10mm;width:50mm;font-size:8pt;padding-top:2mm;">
Did you receive<br/>
								<span class="styBoldText">dependent care benefits?</span>
							</div>
							<span style="vertical-align:top;"> ___________</span>
							<span class="styBoldText" style=" vertical-align:bottom; font-size:8pt;"> No  </span>
							<span style="vertical-align:top; "> ___________</span>
							<span style="font-size:8pt; vertical-align:sub;">
								<img src="{$ImagePath}/2441_Bullet_Md.gif" alt="MediumBullet" align="middle"/> Complete only Part II below.</span>
							<br/>
							<span style="vertical-align:top;"> __________</span>
							<span class="styBoldText" style="vertical-align:bottom; font-size:8pt"> Yes  </span>
							<span style="vertical-align:top; "> ____________</span>
							<span style="font-size:8pt;vertical-align:sub;">
								<img src="{$ImagePath}/2441_Bullet_Md.gif" alt="MediumBullet" align="middle"/> Complete Part III on the back next.  </span>
						</div>
						<br/>
<div class="styPartDesc" style="font-weight:Bold;width:187mm;padding-left:0mm;font-size:8pt;">         
      Caution. <span style="width:1mm;"></span>
     <span class="styNormalText" style="font-size:8pt;"> 
If the care was provided in your home, you may owe employment taxes. If you do, you cannot file Form 1040A. For details,
see the instructions for Form 1040, line 59a, or Form 1040NR, line 58a. 
     </span>
						</div>
						<!-- BEGIN PART II TITLE -->
						<div class="styBB" style="width:187mm;border-top-width: 1px">
								<span class="styPartName" style="width:12mm;font-size:13;">Part ll</span>
							<div class="styPartDesc" style="font-size:8pt;">Credit for Child and Dependent Care Expenses
        </div>
						</div>
						<!-- END PART II TITLE -->
						<!--line 2 Part II-->
						<div class="styBB" style="width:187mm;height:1mm;">
							<div class="styLNLeftNumBox" style="height:1mm;width:6mm;">2</div>
							<div class="styLNDesc" style="width:177mm;font-size:8pt;height:1mm;">
        Information about your <span class="styBoldText">qualifying person(s).</span>
 If you have more than two qualifying persons, see the instructions.
          </div>
							<!-- Table expand/collapse toggle button -->
							<div style="float:right;padding-top:0mm;height:1mm;">
								<!--div style="width:5mm;float:right;vertical-align:top;"-->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form2441Data/QualifyingPersonGrp"/>
									<xsl:with-param name="containerHeight" select="2"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'CareExpenses' "/>
								</xsl:call-template>
							</div>
						</div>
	<!--Part II table Header -->
	<div class="styTableContainer" style="height:15mm;" id="CareExpenses">
		<xsl:call-template name="SetInitialState"/>
	<table class="styTable" cellspacing="0" style="font-size:7pt;" summary="Table displaying Qualifying persons information" name="Qualtable" id="Qualtable">
	<thead class="styTableThead">
	<tr>
	<th class="styTableCellHeader" scope="col" colspan="2" style="width:88mm;font-weight:normal;  border-color:black">
	<span style="font-weight:bold;">(a)</span>
       Qualifying person's name
      <br/> First<span style="width:45mm"/>Last
      </th>
										<th class="styTableCellHeader" scope="col" colspan="1" style="width:49mm;font-weight:normal;  border-color:black">
											<span style="font-weight:bold;">(b)</span> Qualifying person's social<br/> security number
    </th>
										<th class="styTableCellHeader" scope="col" colspan="1" style="width:49mm;font-weight:normal;  height:14mm;border-color:black">
											<span style="font-weight:bold;">(c)</span>
											<span class="styBoldText"> Qualified expenses</span> you<br/> incurred and paid in 2013 for the person listed in column (a)
     </th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="($Print != $Separated) or (count($Form2441Data/QualifyingPersonGrp) &lt;= 5) ">
										<xsl:for-each select="$Form2441Data/QualifyingPersonGrp">
											<tr>
												<td class="styTableCellText" style="width:44mm; border-color:black">
											<span style="width:0mm;">
											</span>
													<!--Person Name-->
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="QualifyingPersonName/PersonFirstName"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCellText" style="width:44mm;border-color:black">
												<div style="text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="QualifyingPersonName/PersonLastName"/>
													</xsl:call-template>
													<!--QualifyingPersonLiteralCd-->
													<xsl:if test="$Form2441Data/QualifyingPersonGrp/QualifyingPersonNameControl">
											           <span style="width:5mm;"></span>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="QualifyingPersonNameControl"/>
														</xsl:call-template>
												
													</xsl:if>
													</div>
												</td>
												<!--Person SSN-->
												<td class="styTableCellCtr" style="width:49mm;  border-color:black">
													<xsl:choose>
														<xsl:when test="DiedLiteralCd">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DiedLiteralCd"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="QualifyingPersonSSN"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:49mm;  border-color:black">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="QualifiedCareExpensesPaidAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
<xsl:if test="(count($Form2441Data/QualifyingPersonGrp)&lt; 1) or ((count($Form2441Data/QualifyingPersonGrp) &gt; 2) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:44mm;text-align:left;  border-color:black">
												<span class="styBoldText"></span>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form2441Data/QualifyingPersonGrp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="width:44mm;  border-color:black">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellCtr" style="width:49mm;  border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:49mm;  border-color:black">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
<xsl:if test="(count($Form2441Data/QualifyingPersonGrp)&lt; 2) or ((count($Form2441Data/QualifyingPersonGrp) &gt; 2) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:44mm;  border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="width:44mm;  border-color:black">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellCtr" style="width:49mm;  border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:49mm;  border-color:black">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form2441Data/QualifyingPersonGrp"/>
							<xsl:with-param name="containerHeight" select="2"/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerID" select=" 'CareExpenses' "/>
						</xsl:call-template>
						<!-- END Part II table -->
						<!--Line 3-->
						<div  style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:5mm;">3
                     </div>
							<div class="styLNDesc" style="width:123mm;height:5mm;font-size:7pt;">Add the amounts in column (c) of line 2.  
							<span class="styBoldText">Do not </span> enter more than $3,000 for one qualifying<br/>
						 person or $6,000 for two or more persons. If you completed Part III, enter the amount from<br/> line 31 
       			 <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
					   <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
					   <span style="width:16px"/>.
					   <span style="width:16px"/>.
                               </span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:6mm;border-right-width:0px;border-top-width:0px;background-color:lightgrey;border-top-width:0px;"/>
							<div class="styIRS2441RightSpaceBox" style="height:6mm;border-left-width:1px;border-top-width:0px;"/>
							<div class="styLNRightNumBox" style="height:5mm;border-right-width:0px;padding-top:1mm;">3                          
                            </div>
							<div class="styLNAmountBox" style="height:5mm;border-left-width:1px;width:48mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2441Data/TotalQlfdExpensesOrLimitAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 4-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">4
                            </div>
							<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;">Enter your  
						<span class="styBoldText">earned income.</span> See instructions
       			 <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.       
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.
                                       <span style="width:16px"/>.                                                     
                               </span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;border-right-width:0px;padding-top:1mm;">4                         
                            </div>
							<div class="styLNAmountBox" style="height:5mm;border-left-width:1px;width:48mm;padding-top:mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2441Data/PrimaryEarnedIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 5-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:5mm;">5
                            </div>
							<div class="styLNDesc" style="width:123mm;height:5mm;">If married filing jointly, enter your spouse's 
						earned income (if you or your spouse was a student or was disabled, see the instructions); <span class="styBoldText">all others,</span>
						 enter the amount from line 4
       			 <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
                               </span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;border-right-width:0px;padding-top:3.5mm;">5                       
                            </div>
							<div class="styLNAmountBox" style="height:8mm;border-left-width:1px;width:48mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2441Data/SpouseEarnedIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 6-->
						<div  style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:5mm;font-size:7pt;">6
                            </div>
							<div class="styLNDesc" style="width:123mm;height:5mm;">Enter the <span class="styBoldText">smallest </span> of line 3, 4, or 5
       			 <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.      
                                        <span style="width:16px"/>.
                                       <span style="width:16px"/>.
                                       <span style="width:16px"/>.   
                                       <span style="width:16px"/>.    
                                        <span style="width:16px"/>.
                                       <span style="width:16px"/>.   
                                       <span style="width:16px"/>.     
                                         <span style="width:16px"/>.   
                                       <span style="width:16px"/>.                                                                                     
                               </span>
							</div>
							<div class="styLNRightNumBox" style="height:5.5mm;border-right-width:0px;border-bottom-width:1px;">6                      
                            </div>
							<div class="styLNAmountBox" style="height:5.5mm;border-left-width:1px;width:48mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2441Data/SmallerOfExpensesOrIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 7-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">7
                        </div>
							<div class="styLNDesc" style="width:123mm;height:4mm;">Enter the amount from Form 1040, line 38; Form 1040A, line 22; or Form   
       		     </div>
							<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;background-color:lightgrey;"/>
							<div class="styIRS2441RightSpaceBox" style="height:4mm;border-right-width:0px;width:48mm;"/>
							<div class="styLNDesc" style="width:91mm;height:4mm;font-size:7pt;">
								<span style="width:9mm"/>1040NR, line 37    
 			<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.      
                                        <span style="width:16px"/>.
                                       <span style="width:16px"/>.   
                                        <span style="width:16px"/>.
                                       <span style="width:16px"/>.                                                                                                                                                          
                               </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">7                     
                            </div>
							<div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2441Data/AGIAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:0px;background-color:lightgrey;"/>
							<div class="styIRS2441RightSpaceBox" style="height:4.5mm;"/>
						</div>
<!--Line 8-->
<div  style="width:187mm;">
			<div class="styLNLeftNumBox" style="height:4mm;font-size:7pt;">8
            </div>
		<div class="styLNDesc" style="width:123mm;height:4mm;">Enter on line 8 the decimal amount shown below that applies to the amount on line 7  
           </div>
							<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;background-color:lightgrey;"/>
							<div class="styIRS2441RightSpaceBox" style="height:4mm;border-left-width:1px;"/>
						</div>
						<!--Decimal chart Headers-->
						<div style="width:187mm;">
							<div class="styLNDesc" style="width:131mm;height:4mm;">
								<span style="width:17mm"/>
								<span class="styBoldText">If line 7 is:</span>
								<span style="width:40mm"/>
								<span class="styBoldText">If line 7 is:</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;background-color:lightgrey;"/>
							<div class="styIRS2441RightSpaceBox" style="height:4mm;border-left-width:1px;"/>
						</div>
						<!--Column Headers-->
						<div style="width:187mm;">
							<div class="styLNDesc" style="width:57mm;">
								<div class="styLNAmountBoxNBB" style="height:5mm;border-left-width:0px;width:57mm;border-top-width: 0px;text-align:left;">
									<span style="width:29mm"/>
									<span class="styBoldText">But not</span>
									<span style="width:3mm"/>
									<span class="styBoldText">Decimal</span>
									<br/>
									<span style="width:17mm"/>
									<span class="styBoldText"> Over</span>
									<span style="width:5.7mm"/>
									<span class="styBoldText">over</span>
									<span style="width:7mm"/>
									<span class="styBoldText">amount is</span>
								</div>
							</div>
							<div class="styLNAmountBoxNBB" style="height:6.0mm;border-left-width:0px;width:5mm;"/>
							<div class="styLNDesc" style="width:56.9mm;">
								<div class="styLNAmountBoxNBB" style="height:5mm;border-left-width:0px;width:56.9mm;border-top-width: 0px;text-align:left;">
									<span style="width:23mm"/>
									<span class="styBoldText">But not</span>
									<span style="width:4mm"/>
									<span class="styBoldText">Decimal</span>
									<br/>
									<span style="width:10mm"/>
									<span class="styBoldText"> Over</span>
									<span style="width:7mm"/>
									<span class="styBoldText">over</span>
									<span style="width:8mm"/>
									<span class="styBoldText">amount is</span>
								</div>
							</div>
							<div class="styLNAmountBoxNBB" style="height:9mm;border-left-width:0px;width:12.1mm;"/>
							<div class="styLNRightNumBoxNBB" style="height:9mm;border-right-width:0px;background-color:lightgrey;width:8mm;"/>
							<div class="styIRS2441RightSpaceBox" style="height:9mm;border-left-width:1px;"/>
						</div>
						<!--Decimal values-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:49px;"/>
							<div class="styLNDesc" style="width:45mm;height:6mm;">
								<div class="styIRS2441TableBox" style="height:7mm;border-left-width:0px;width:177px;border-top-width: 1px;text-align:right;">
									$0&#151;15,000   <span style="width:36px;"/><span style="padding-right:36px"> .35</span><br/>
									15,000&#151;17,000   <span style="width:36px"/><span style="padding-right:36px"> .34</span><br/>
									17,000&#151;19,000   <span style="width:36px"/><span style="padding-right:36px"> .33</span><br/>
									19,000&#151;21,000   <span style="width:36px"/><span style="padding-right:36px"> .32</span><br/>
									21,000&#151;23,000   <span style="width:36px"/><span style="padding-right:36px"> .31</span><br/>
									23,000&#151;25,000   <span style="width:36px"/><span style="padding-right:36px"> .30</span><br/>
									25,000&#151;27,000   <span style="width:36px"/><span style="padding-right:36px"> .29</span><br/>
									27,000&#151;29,000   <span style="width:36px"/><span style="padding-right:36px"> .28</span>
  </div>
							</div>
							<div class="styLNAmountBoxNBB" style="height:26.0mm;border-left-width:0px;width:5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:26.0mm;border-left-width:1px;width:5mm;"/>
							<div class="styLNDesc" style="width:45mm;height:6mm;">
								<div class="styIRS2441TableBox" style="height:7mm;border-left-width:0px;width:45mm;border-top-width: 1px;text-align:left;">
									<span style="width:.7mm"/>$29,000&#151;31,000   <span style="width:10mm"/> .27<br/>
									<span style="width:2.5mm"/>31,000&#151;33,000   <span style="width:10mm"/> .26<br/>
									<span style="width:2.5mm"/>33,000&#151;35,000   <span style="width:10mm"/> .25<br/>
									<span style="width:2.5mm"/>35,000&#151;37,000   <span style="width:10mm"/> .24 <br/>
									<span style="width:2.5mm"/>37,000&#151;39,000   <span style="width:10mm"/> .23<br/>
									<span style="width:2.5mm"/>39,000&#151;41,000   <span style="width:10mm"/> .22 <br/>
									<span style="width:2.5mm"/>41,000&#151;43,000   <span style="width:10mm"/> .21<br/>
									<span style="width:2.3mm"/>43,000&#151;No limit   <span style="width:9.3mm"/> .20              
</div>
							</div>
							<div style="width:72mm;height:24mm;float:right">
								<div class="styLNAmountBoxNBB" style="height:100%;border-left-width:0px;width:16mm;float:left;"/>
								<div style="height:6.3mm;width:56mm;float:right;">
									<div class="styLNRightNumBoxNBB" style="height:6.3mm;border-right-width:0px;background-color:lightgrey;"/>
									<div class="styIRS2441RightSpaceBox" style="height:6.3mm;border-left-width:1px;"/>
								</div>
								<div style="height:9mm;width:56mm;float:right">
									<div class="styLNRightNumBoxNBB" style="height:100%;border-right-width:0px;border-bottom-width:1px;padding-top:3.5mm">  8                  
		  </div>
									<div class="styLNAmountBox" style="height:100%;border-left-width:1px;width:47.5mm;padding-top:3.5mm;">
										<span style="font-weight:bold;width:1mm;font-size:8pt;">X</span>
										<span style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form2441Data/CareExpensesDecimalAmt"/>
											</xsl:call-template>
										</span>
									</div>
								</div>
								<div style="height:13mm;float:right;width:56mm;">
									<div class="styLNRightNumBoxNBB" style="height:13mm;border-right-width:0px;background-color:lightgrey;"/>
									<div class="styIRS2441RightSpaceBox" style="height:13mm;border-left-width:1px;"/>
								</div>
							</div>
							<!--Line 9-->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:5mm;padding-top:0mm;font-size:7pt;">9
                          </div>
								<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:0mm;">Multiply line 6 by the decimal amount on line 8. If you paid 2012 expenses in 2013, see<br/> the instructions
                             <!--CPYEExplainationStatement-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form2441Data/CalculatedTentativeExpenseAmt"/>
									</xsl:call-template>
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                      <span style="width:16px"/>.   
                                      <span style="width:16px"/>.
                                      <span style="width:16px"/>.
                                       <span style="width:16px"/>.   
                                      <span style="width:16px"/>.     
                                      <span style="width:16px"/>.   
                                      <span style="width:16px"/>.
                                      <span style="width:16px"/>.
                                       <span style="width:16px"/>.   
                                      <span style="width:16px"/>.    
                                        <span style="width:16px"/>.   
                                      <span style="width:16px"/>.
                                    	</span>
								</div>
	<div class="styLNRightNumBox" style="height:8mm;border-right-width:0px;padding-top:3mm;">9                      
                            </div>
								<div class="styLNAmountBox" style="height:8mm;border-left-width:1px;width:48mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2441Data/CalculatedTentativeExpenseAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 10-->
							<div  style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:4mm;font-size:7pt;">10
                        </div>
								<div class="styLNDesc" style="width:123mm;height:4mm;">Tax liability limit. Enter the amount from the Credit Limit 
       		     </div>
								<div class="styLNRightNumBoxNBB" style="height:3mm;border-right-width:0px;background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="height:3mm;border-left-width:1px;width:48mm;"/>
							</div>
							<div class="styLNDesc" style="width:91mm;height:4mm;">
								<span style="width:8mm"/>Worksheet in the instructions
 			<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.      
                                        <span style="width:16px"/>.
                                       <span style="width:16px"/>.   
                                        <span style="width:16px"/>.  
                               </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">10                    
                            </div>
							<div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2441Data/TaxLiabLmtFromCrLmtWrkshtAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:0px;background-color:lightgrey;"/>
							<div class="styIRS2441RightSpaceBox" style="height:4.5mm;border-left-width:1px;"/>
						</div>
						<!--line 11-->
			<div  style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-top:0.5mm;">11
         </div>
							<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:0.5mm;">
								<span class="styBoldText">Credit for child and dependent care expenses.</span> Enter the <b> smaller </b>of line 9 or line 10 here and on Form 1040, line 48; Form 1040A, line 29; or Form 1040NR, line 46
       			 <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.                                                                    
                               </span>
							</div>
			<div class="styLNRightNumBox" style="height:8mm;border-right-width:0px;border-bottom-width:0px;padding-top:3.5mm;">11                     
                            </div>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:1px;border-bottom-width:0px;width:48mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2441Data/CrForChildAndDEPDCareAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Begin Footer-->
					<div class="pageEnd" style="width:187mm;border-top:1 solid black;border-top-width1px;">
						<div class="stySmallText" style="width:110mm;"><span class="styBoldText">
							For Paperwork Reduction Act Notice, see yout tax return instructions.</span>
						</div>
<div class="stySmallText" style="width:40mm;">Cat. No. 11862M
        </div>
						<div class="stySmallText" style="width:36mm;text-align:right;">Form <span class="styBoldText">2441</span> (2013)
        </div>
					</div>
					<!--End Footer-->
					<!-- Page Header -->
					<div style="width:187mm;padding-top:0.5mm;">
						<div style="float:left;">Form 2441 (2013)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- BEGIN PART III TITLE -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
							<span class="styPartName" style="width:17mm;font-size:13;">Part lll</span>
						<div class="styPartDesc" style="padding-left:1mm;width:163mm;font-size:8pt">Dependent Care Benefits</div>
					</div>
					<!--End Part IIITitle-->
					<!--line 12-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">12
                   </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;font-size:7pt;">
						Enter the total amount of <span class="styBoldText">dependent care benefits</span>  
						you received in 2013. Amounts you<br/> received as an employee should be shown in box 10 of your Form(s) W-2. 
						<span class="styBoldText">Do not </span> include <br/>amounts reported as wages in box 1 of Form(s) W-2. 
			If you were self-employed or a partner, <br/> include amounts you received under a dependent care assistance program from your sole<br/>
						 proprietorship or partnership
       			 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.   
                                       <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.    
                                      <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.  
                                          <span style="width:16px"/>.   
                                       <span style="width:16px"/>.   
                                       <span style="width:16px"/>.  
                                     <span style="width:16px"/>.                                                                                          
                               </span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;border-right-width:0px;background-color:lightgrey;border-top-width:0px;"/>
						<div class="styIRS2441RightSpaceBox" style="height:10mm;border-left-width:1px;"/>
						<div class="styLNRightNumBox" style="height:8mm;border-right-width:0px;padding-top:3.5mm;">12                    
                            </div>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:1px;width:48mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/DependentCareBenefitsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 13-->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;font-size:7pt;">13
                      </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;">Enter the amount, if any, you carried over from 2012 and used in 2013 during the grace<br/> period. See instructions
       			 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                      <span style="width:16px"/>.   
                                      <span style="width:16px"/>.
                                      <span style="width:16px"/>.
                                       <span style="width:16px"/>.   
                                      <span style="width:16px"/>.     
                                      <span style="width:16px"/>.
                                      <span style="width:16px"/>.
                                       <span style="width:16px"/>.   
                                      <span style="width:16px"/>.     
                                      <span style="width:16px"/>.   
                                      <span style="width:16px"/>.       
                                        <span style="width:16px"/>.                                                                                      
                               </span>
						</div>
<div class="styLNRightNumBox" style="height:8.5mm;border-right-width:0px;padding-top:3.5mm;">13                    
                            </div>
						<div class="styLNAmountBox" style="height:8.5mm;border-left-width:1px;width:48mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/CarryoverAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 14-->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;font-size:7pt;">14
                     </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;">Enter the amount, if any, you forfeited or carried forward to 2014. See instructions
       			 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.                                                                   
                               </span>
						</div>
	<div class="styLNRightNumBox" style="height:5mm;border-right-width:0px;padding-top:.5mm;">14                    
                            </div>
						<div class="styLNAmountBox" style="height:5mm;border-left-width:1px;width:48mm;padding-top:.5mm;">
							(<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/ForfeitedAmt"/>
							</xsl:call-template>)
						</div>
					</div>
					<!--line 15-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;font-size:7pt;">15
                            </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;">Combine lines 12 through 14. See instructions
       			 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.   
                                       <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.    
                                      <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.                                                                       
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-right-width:0px;">15                     
                            </div>
						<div class="styLNAmountBox" style="height:5mm;border-left-width:1px;width:48mm;">
							<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form2441Data/AdjustedDepdCareBenefitsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 16-->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;font-size:7pt;">16
                        </div>
						<div class="styLNDesc" style="width:123mm;height:4mm;">Enter the total amount of <span class="styBoldText">qualified expenses   </span> incurred
       		     </div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4mm;border-left-width:1px;width:48mm;"/>
						<div class="styLNDesc" style="width:91mm;height:4mm;">
							<span style="width:9mm"/>in 2013 for the care of the <span class="styBoldText">qualifying person(s)</span>
							<!--Dotted Line-->
				<span class="styBoldText">
					<span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.                                                                                                                                              
               </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:0px;">16                   
                            </div>
						<div class="styLNAmountBox" style="height:4.5mm;border-left-width:1px;width:32mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/QualifiedExpensesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4.5mm;"/>
					</div>
					<!--line 17-->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">17
                        </div>
						<div class="styLNDesc" style="width:83mm;height:4mm;">Enter the <span class="styBoldText">smaller </span>of line 15 or 16
                      	 			<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.     
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.                                                                                                                                                                
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:0px;">17                  
                            </div>
						<div class="styLNAmountBox" style="height:4.5mm;border-left-width:1px;width:32mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/SmallerOfAdjOrQualifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4.5mm;"/>
					</div>
					<!--line 18-->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">18
                        </div>
						<div class="styLNDesc" style="width:83mm;height:4mm;">Enter your <span class="styBoldText">earned income. </span>See instructions
                      	 			<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.     
                                     <span style="width:16px"/>.
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:0px;">18                  
                            </div>
						<div class="styLNAmountBox" style="height:4.5mm;border-left-width:1px;width:32mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/EarnedIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4.5mm;"/>
					</div>
					<!--line 19-->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">19 </div>
						<div class="styLNDesc" style="width:60mm;height:4mm;">Enter the amount shown below that applies<br/> to you.
                        <br/>
							<span style="text-align:left;">
								<img src="{$ImagePath}/2441_Bullet_Round.gif" alt="MediumBullet"/> 
   If married filing jointly, enter your<br/>
								<span style="width:2mm"/>spouse's earned income (if you or your<br/>
								<span style="width:2mm"/>spouse was a student or was disabled,<br/>
								<span style="width:2mm"/>see the instructions for line 5).
							</span><br/>
							<span style="text-align:left;">
								<img src="{$ImagePath}/2441_Bullet_Round.gif" alt="MediumBullet"/> 
  If married filing separately, see<br/>
								<span style="width:2mm"/>instructions.
							</span><br/>
							<span style="text-align:left;">
								<img src="{$ImagePath}/2441_Bullet_Round.gif" alt="MediumBullet"/> 
  All others, enter the amount from line 18.
  </span>
						</div>
						<div class="styLNDesc" style="width:5mm;height:12mm;">
							<div class="styLNRightNumBoxNBB" style="height:6mm;border-left-width: 0px; "/>
							<span style="text-align:left;">
								<img align="bottom" src="{$ImagePath}/2441_Bracket.gif" alt=""/>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;border-left-width: 0px;width:15mm; "/>
						<div class="styLNRightNumBoxNBB" style="height:16mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:16mm;width:32mm;border-right-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:16mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:16mm;width:48mm;border-right-width:0px;"/>
						<div class="styLNDesc" style="width:15mm;height:5mm;">
							<span class="styBoldText">
								<span style="width:16px"/>.
                           <span style="width:16px"/>.                                                                                                                                                                                                                       
                            </span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;border-right-width:0px;padding-top:3mm;">19</div>
						<div class="styLNAmountBox" style="height:7.5mm;border-left-width:1px;width:32mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/SpouseIncomeAmt"/>
							</xsl:call-template>
						</div>
					<div class="styLNRightNumBoxNBB" style="height:7.5mm;border-left-width: 1px; border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:7.5mm;width:48mm;border-right-width:0px;"/>
						<div class="styIRS2441SpaceBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;width:15mm;"/>
					<div class="styLNRightNumBoxNBB" style="height:8.5mm;border-left-width: 1px; border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:8.5mm;width:32mm;border-right-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:8.5mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:8.5mm;width:48mm;border-right-width:0px;"/>
					</div>
					<!--line 20-->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">20
                        </div>
						<div class="styLNDesc" style="width:83mm;height:4mm;">Enter the <span class="styBoldText">smallest</span> of line 17, 18, or 19
                      	 			<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.     
                                     <span style="width:16px"/>.   
                                      <span style="width:16px"/>.                                                                                                                                                                                              
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:0px;">20                  
                            </div>
						<div class="styLNAmountBox" style="height:4.5mm;border-left-width:1px;width:32mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/TentativeExclusionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4.5mm;width:48mm;border-right-width:0px;"/>
						
					</div>
					<!--line 21-->
					<div style="width:187mm;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="padding-top:0mm;height:8mm;">21
                            </div>
		<div class="styLNDesc" style="width:83mm;padding-top:0mm;height:8mm;">Enter $5,000 ($2,500 if married filing separately <b>and</b> <br/>you were required to enter your spouse’s earned <br/>income on line 19)
       			 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                 <span style="width:16px"/>.
                                 <span style="width:16px"/>.  
                                  <span style="width:16px"/>.
                                 <span style="width:16px"/>.
                                 <span style="width:16px"/>.  
                                    <span style="width:16px"/>.
                                 <span style="width:16px"/>.  
                                  <span style="width:16px"/>.
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.0mm;border-right-width:0px;background-color:lightgrey;border-bottom-width:0px;">                  
                            </div>
                            <div class="styLNAmountBox" style="height:4.0mm;border-left-width:1px;width:32mm;border-bottom-width:0px;">
						</div>
							<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4mm;width:48mm;border-right-width:0px;"/>
						<div class="styLNRightNumBox" style="height:5.5mm;border-right-width:0px;">21                  
                            </div>
						<div class="styLNAmountBox" style="height:5.5mm;border-left-width:1px;width:32mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/EnterSpecifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:6mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:6mm;width:48mm;border-right-width:0px;"/>
					</div>
					<!--line 22-->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">22
                   </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;font-size:7pt;">Is any amount  on line 12 from your sole proprietorship or <br/>partnership? (Form 1040A filers go to line 25.)
          <span class="styBoldText">
                               </span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;background-color:lightgrey;border-top-width:1px;border-top-width:0px;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4mm;border-left-width:1px;"/>
						<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;background-color:lightgrey;border-top-width:1px;border-top-width:0px;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4mm;border-left-width:1px;"/>
						<div class="styLNDesc" style="width:131mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							 <input type="checkbox"  class="styCkbox"  name="Checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form2441Data/Filed1040A"/>
									<xsl:with-param name="BackupName">Form2441DataFiled1040AYesInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form2441Data/Filed1040A"/>
									<xsl:with-param name="BackupName">Form2441DataFiled1040AYesInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:4px;"/>
								<b>No.  </b>
							</label> Enter -0-.
                        </div>
      <div class="styLNRightNumBoxNBB" style="height:6mm;border-right-width:0px;background-color:lightgrey;border-top-width:1px;border-top-width:0px;"/>
						<div class="styIRS2441RightSpaceBox" style="height:6mm;border-left-width:1px;"/>
						<div  class="styLNDesc" style="width:131mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form2441Data/Filed1040A"/>
									<xsl:with-param name="BackupName">Form2441DataFiled1040ANoInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:4px;"/>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form2441Data/Filed1040A"/>
									<xsl:with-param name="BackupName">Form2441DataFiled1040ANoInd</xsl:with-param>
								</xsl:call-template>
								<b>Yes.  </b>
					</label>   Enter the amount here
						 <!--Dotted Line-->
						  <span class="styBoldText">
							<span style="width:16px"/>.
                                 <span style="width:16px"/>.
                                 <span style="width:16px"/>.  
                                  <span style="width:16px"/>.
                                  <span style="width:16px"/>.
                                 <span style="width:16px"/>.
                                 <span style="width:16px"/>.  
                                  <span style="width:16px"/>.
                                  <span style="width:16px"/>.
                                 <span style="width:16px"/>.
                                 <span style="width:16px"/>.  
                                  <span style="width:16px"/>.
                                   <span style="width:16px"/>.
                               </span>
                               </div>
						<div class="styLNRightNumBox" style="height:5mm;border-right-width:0px;padding-top:1mm;">22</div>
						<div class="styLNAmountBox" style="height:5mm;border-left-width:1px;width:48mm;padding-top:1mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/SolePropshpPrtshpAmt"/>
							</xsl:call-template>
						</div>
						</div>
					<!--line 23-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">23
             </div>
						<div class="styLNDesc" style="width:83mm;height:4mm;font-size:7pt;">Subtract line 22 from line 15
                      	 			<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                    <span style="width:16px"/>.     
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.  
                                     <span style="width:16px"/>.                                                                                                                                                                             
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">23               
                            </div>
						<div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;width:32mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/PropshpPrtshpLessAdjBnftAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4.5mm;width:48mm;border-right-width:0px;"/>
					</div>
					<!--line 24-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">24
                            </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;"><b>Deductible benefits.</b> Enter the <b>smallest</b> of line 20, 21, or 22. Also, include this amount on the appropriate line(s) of your return. See instructions
       			 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.   
                                       <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.    
                                      <span style="width:16px"/>.
                                     <span style="width:16px"/>.                                                                                             
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;border-right-width:0px;padding-top:3.5mm;">24                    
                            </div>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:1px;width:48mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/DeductibleBenefitsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 25-->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-top:1mm;">25
                            </div>
						<div class="styLNDesc" style="width:123mm;height:8mm;padding-top:1mm;font-size:7pt;">
						<b>Excluded benefits. Form 1040 and 1040NR filers:</b> If you checked "No" on line 22, enter the smaller of line 20 or 21. Otherwise, subtract line 24 from the smaller of line 20 or line 21. If zero or less, enter -0-. <b>Form 1040A filers: </b>Enter the <b>smaller</b> of line 20 or line 21
       			 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;border-right-width:0px;padding-top:5.5mm;">25                     
                            </div>
						<div class="styLNAmountBox" style="height:11mm;border-left-width:1px;width:48mm;padding-top:5.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/ExcludedBenefitsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 26 -->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;">26
                         </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;font-size:7pt;">
							<b>Taxable benefits. Form 1040 and 1040NR filers:</b> Subtract line 25 from line 23. If zero or less, enter -0-. Also, include this amount on Form 1040, line 7, or Form 1040NR, line 8. On the dotted line next to Form 1040, line 7, or Form 1040NR, line 8, enter “DCB.” <b>Form 1040A filers:</b> Subtract line 25 from line 15. Also, include this amount on Form 1040A, line 7. In the space to the left of line 7, enter “DCB.”
       			 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.  
                                       <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.   
                                        <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>.                        
                               </span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:12mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:12mm;width:48mm;border-right-width:0px;"/>
						<div class="styLNRightNumBox" style="height:5mm;border-right-width:0px;border-bottom-width:0px;">26                     
                            </div>
						<div class="styLNAmountBox" style="height:5mm;border-left-width:1px;width:48mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/TaxableBenefitsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Instructions on Child and dependent care-->
					<div class="styBB" style="width:187mm;border-top-width: 1px;height: 15mm;">
						<div class="styPartDesc" style="text-align:center;padding-top:5mm;font-weight: normal;font-size:7pt;">To claim the child and dependent care <br/> credit, complete lines 27 through 31 below.
        </div>
					</div>
						<!--line 27-->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">27
                            </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;font-size:7pt;">
							Enter $3,000 ($6,000 if two or more qualifying persons)
       			 <!--Dotted Line-->
							<span class="styBoldText">
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                      <span style="width:16px"/>.   
                                      <span style="width:16px"/>.
                                      <span style="width:16px"/>.
                                       <span style="width:16px"/>.   
                                      <span style="width:16px"/>.    
                                        <span style="width:16px"/>.                                                                                                   
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-right-width:1px;">27                   
                            </div>
						<div class="styLNAmountBox" style="height:5mm;border-left-width:0px;width:48mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/AllowedCaredForAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 28 -->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;">28
                            </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;font-size:7pt;"><b>Form 1040 and 1040NR filers: </b> Add lines 24 and 25. <b>Form 1040A filers: </b>Enter the amount from line 25
       			 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>. 
                                      <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>. 
                                          <span style="width:16px"/>.               
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>. 
                                      <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>. 
                                          <span style="width:16px"/>.      
                                         <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       <span style="width:16px"/>. 
                                          <span style="width:16px"/>.                                                   
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;border-right-width:1px;padding-top:3mm;">28                     
                            </div>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:0px;width:48mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/SumOfDedAndExcludedBenefitsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 29 -->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;">29
                            </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;font-size:7pt;">Subtract line 28 from line 27. If zero or less, <b>stop.</b> 
						You cannot take the credit. <br/><b>Exception.</b> If you paid 2012 expenses in 2013, see the instructions for line 9
       			 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                       
                               </span>
						</div>
		<div class="styLNRightNumBox" style="height:8mm;border-right-width:1px;padding-top:3mm;">29                    
                            </div>
		<div class="styLNAmountBox" style="height:8mm;border-left-width:0px;width:48mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/NetAllowableAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 30-->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">30
                            </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;font-size:7pt;">Complete line 2 on the front of this form. <b> Do not </b>include in column (c) any benefits shown on line 28 above. Then, add the amounts in column (c) and enter the total here
       			 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                               </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;border-right-width:1px;padding-top:3.5mm;">30                    
                            </div>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:0px;width:48mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/TotalQualifiedExpensesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 31-->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">31
                            </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;font-size:7pt;">Enter the <b>smaller </b>of line 29 or 30. Also, enter this amount on line 3 on the front of this form and complete lines 4 through 11
       			 <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                   <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.   
                                     <span style="width:16px"/>.
                                    <span style="width:16px"/>.
                                     <span style="width:16px"/>.  
                                     <span style="width:16px"/>.                                             
                               </span>
						</div>
				<div class="styLNRightNumBox" style="height:8mm;border-right-width:1px;padding-top:3.5mm;border-bottom-width:0px;">31                    
                            </div>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:0px;width:48mm;padding-top:3.5mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/SmallerOfTotalQlfyExpensesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm; border-top:1 solid black;border-top-width:1px;">
						<div style="float:right;">
							<span style="width:80px;"/>  
          Form <span class="styBoldText">2441</span> (2013)
        </div>
					</div>
					<!--END Page Footer-->
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
							<xsl:with-param name="TargetNode" select="$Form2441Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Additional Data Left Over Table -->
					<!--Separated Data  Part I Care Provider Table -->
					<xsl:if test="($Print = $Separated) and (count($Form2441Data/CareProviderGrp) &gt; 2)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 2441 - Part I - Care Provider Table, Line 1:</span>
						<br/>
						<table class="styDepTbl" style="font-size:7pt;" cellspacing="0" summary="Table displaying Care Provider information" name="CPtable" id="CPtable">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" colspan="1" style="width:50mm;font-weight:normal;text-align: left;">
										<span style="width:7mm;"/>
										<span style="font-weight:bold;">(a)</span>
                                                         Care provider's <br/>
										<span style="font-weight:bold;width:1mm;font-size:7pt;">1</span>
										<span style="width:10mm;"/> name

                                                           </th>
									<th class="styDepTblCell" scope="col" colspan="1" style="width:80mm;font-weight:normal;">
										<span style="font-weight:bold;">(b)</span>Address<br/>(number, street, apt. no., city, state, and ZIP code)
                                                                </th>
									<th class="styDepTblCell" scope="col" colspan="1" style="width:27mm;font-weight:normal;">
										<span style="font-weight:bold;">(c)</span> Identify number<br/> (SSN or EIN)
                                                                </th>
									<th class="styDepTblCell" scope="col" colspan="1" style="width:30mm;font-weight:normal;">
										<span style="font-weight:bold;">(d)</span> Amount paid<br/>(see instructions)
                                                             </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form2441Data/CareProviderGrp">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class">
										<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
										</xsl:attribute>
										<!--position 1-->
										<td class="styDepTblCell" style="width:50mm;text-align:left">
											<span style="width:0mm;">
												<xsl:if test="position()=1">
													<span class="styBoldText"/>
												</xsl:if>
											</span>
											<xsl:choose>
											<xsl:when test="CareProviderPersonName">
											<!--CareProviderPersonName-->											
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CareProviderPersonName/PersonFirstName"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CareProviderPersonName/PersonLastName"/>
												</xsl:call-template>											
											<!--CareProviderNameControl-->
													<div style="text-align:left">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CareProviderNameControl"/>
												</xsl:call-template>
												</div>
											</xsl:when>
											<xsl:otherwise>
											<!--CareProviderBusinessName-->										
												
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CareProviderBusinessName/BusinessNameLine1"/>
												</xsl:call-template>
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CareProviderBusinessName/BusinessNameLine2"/>
												</xsl:call-template>
												
											<!--CareProviderBusNameCtrl-->
													<div style="text-align:left">
												<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CareProviderBusNameCtrl"/>
												</xsl:call-template>
												</div>
											</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styDepTblCell" style="width:80mm;text-align:left;vertical-align:top;">
												<!--USAAddress-->
												<xsl:choose>													
												<xsl:when test="USAddress">													
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="USAddress"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
												<!--ForiegnAddress-->												
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
														</xsl:call-template>
											                <br/>
													
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2"/>
														</xsl:call-template>
														<br/>
	
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/City"/>
														</xsl:call-template>																								
														
															<span style="width:1mm;"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
														</xsl:call-template>									
														
														<span style="width:1mm;"/>	
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
														</xsl:call-template>	
														
														<span style="width:1mm;"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
														</xsl:call-template>
													</xsl:otherwise>
													</xsl:choose>
											<!--SeeW2Cd-->
										<xsl:if test="$Form2441Data/CareProviderGrp/SeeW2Cd !=''">
														<div style="float:left;clear:none;">
												<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SeeW2Cd"/>
														</xsl:call-template>
														</div>
													</xsl:if>
										</td>
										<td class="styDepTblCell" style="width:27mm;">
											<!--SSN number-->
											<xsl:if test="$Form2441Data/CareProviderGrp/SSN">
												<div style="text-align:center">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="SSN"/>
												</xsl:call-template>
													</div>
											</xsl:if>
											<!--EIN number-->
											<xsl:if test="$Form2441Data/CareProviderGrp/EIN">
												<div style="text-align:center">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
														</div>
											</xsl:if>
											<!--Tax Exempt-->
											<xsl:if test="$Form2441Data/CareProviderGrp/TaxExempt">
											<div style="text-align:center">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxExempt"/>
												</xsl:call-template>
												</div>
											</xsl:if>
											<!--Living Abroad Foreign Care Providers-->
											<xsl:if test="$Form2441Data/CareProviderGrp/LAFCP">
												<div style="text-align:center">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LAFCP"/>
													</xsl:call-template>
											</div>
											</xsl:if>
										</td>
										<td class="styDepTblCell" style="width:30mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PaidAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- END Separated Data for Part I -->
					<!-- Separated Data for Part II Qualifying Peron Table -->
					<xsl:if test="($Print = $Separated) and (count($Form2441Data/QualifyingPersonGrp) &gt; 2)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 2441 - Part II - Qualifying Person Table, Line 2:</span>
						<br/>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;" summary="Table displaying Qualifying persons information" name="Qualtable" id="Qualtable">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" colspan="2" style="width:88mm;font-weight:normal;">
										<span style="font-weight:bold;">(a)</span>
       Qualifying person's name
      <br/> First<span style="width:45mm"/>Last
                                   </th>
									<th class="styDepTblCell" scope="col" colspan="1" style="width:49mm;font-weight:normal;">
										<span style="font-weight:bold;">(b)</span> Qualifying person's social security number
                                 </th>
									<th class="styDepTblCell" scope="col" colspan="1" style="width:49mm;font-weight:normal;">
										<span style="font-weight:bold;">(c)</span>Qualified expenses you<br/> incurred and paid in 2008 for the person listed in column (a)
                                </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form2441Data/QualifyingPersonGrp">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class">
										<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="width:44mm;text-align:left;">
											<span style="width:0mm;">
												<xsl:if test="position()=1">
													<span class="styBoldText"/>
												</xsl:if>
											</span>
											<!--Person Name-->
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="QualifyingPersonName/PersonFirstName"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:44mm;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="QualifyingPersonName/PersonLastName"/>
											</xsl:call-template>
											<span style="width:1px;"/>
											<!--QualifyingPersonLiteralCd-->													
											           <span style="width:5mm;"></span>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="QualifyingPersonNameControl"/>
														</xsl:call-template>												
										</td>
										<!--Person SSN-->
										<td class="styDepTblCell" style="width:49mm;text-align:center;">
											<xsl:if test="$Form2441Data/QualifyingPersonGrp/QualifyingPersonSSN">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="QualifyingPersonSSN"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
											<!--QualifyingPersonLiteralCd-->
											<xsl:if test="$Form2441Data/QualifyingPersonGrp/DiedLiteralCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DiedLiteralCd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
										<td class="styDepTblCell" style="width:49mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="QualifiedCareExpensesPaidAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- END Separated Data for Part II-->
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="CreateTableUSAAddress">
	<xsl:param name="Start" />
	<xsl:param name="Stop" />
	<xsl:param name="TargetNode" />
		<xsl:if test="($TargetNode[position()=$Start] !='') ">
		<xsl:if test="$Start &lt; $Stop">
		<td class="styTableCellText " style="width:70mm;text-align:top;">	 	   	
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]" />
			</xsl:call-template>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]" />
			</xsl:call-template>
				<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]" />
			</xsl:call-template>     
			</td>			
			<xsl:call-template name="CreateTableUSAAddress">
			<xsl:with-param name="Start" select="$Start + 1" />
			<xsl:with-param name="Stop" select="$Stop" />
			<xsl:with-param name="TargetNode" select="$TargetNode" />
			</xsl:call-template>
		</xsl:if>
		</xsl:if>
</xsl:template>
	<xsl:template name="AddPositionNumber">
  <xsl:if test="position()=1">1</xsl:if>
  <xsl:if test="position()=2">2</xsl:if> 
    <xsl:if test="position()=3">3</xsl:if>  
</xsl:template>
</xsl:stylesheet>
