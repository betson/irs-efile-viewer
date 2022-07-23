<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4684Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!--   Defines the stage of the data, e.g. original or latest   -->
	<xsl:param name="Form4684Data" select="$RtnDoc/IRS4684"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form4684Data)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!--  No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 4684"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS4684Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="Form4684">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!-- Begin Form title an dForm number section -->
					<div class="styTBB" style="width:187mm;clear:both;float:none;">
							<div class="styFNBox"
							 style="width:31mm;height:20mm;padding-top:1mm;border-right-width:2px">
					Form <span class="styFormNumber">4684</span>
								<br/>
								<!--General Dependency Push Pin -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form4684Data"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Form 4684, Top Left Margin - Revenue Procedure 2009-20 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form4684Data/@revenueProcedure201036Cd"/>
									<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Form 4684, Top Left Margin - Revenue Procedure 200920 IND</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form4684Data/@revenueProcedure200920Cd"/>
									<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
							<div class="styFTBox" style="width:125mm;height:12mm;padding-top:3mm">
								<div class="styMainTitle" style="padding-top:1mm;">
									Casualties and Thefts
							   </div>
							<div class="styFST" style="font-size:7pt;">
								<img src="{$ImagePath}/4684_Bullet.gif" alt="bullet image"/>
								Go to <a href="http://www.irs.gov/Form4684"><i>www.irs.gov/Form4684</i></a> for instructions and the latest information.
 							</div><br/>
							<div class="styFST" style="font-size:7pt;">
								<img src="{$ImagePath}/4684_Bullet.gif" alt="bullet image"/>
          						 Attach to your tax return.
                             </div><br/>
							<div class="styFST" style="font-size:7pt;">
								<img src="{$ImagePath}/4684_Bullet.gif" alt="bullet image"/>
              						Use a separate Form 4684 for each casualty or theft.
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:20mm;border-left-width:2px">
							<div class="styOMB" style="height:4mm;">
             					OMB No. 1545-0177
							</div>
							<div class="styTY" style="height:4mm;font-size:19pt;">
              					20<span class="styTYColor">19</span>
							</div>
							<br/>
							<br/>
							<div class="styOMB" style="height:2mm;border-bottom-width:0px;text-align: center;">
							Attachment <br/>	Sequence No.
							 <span class="styBoldText">26</span>
							</div>
						</div>
					</div>
					<!-- End form title and Form number Section -->
					<div class="styBB" style="width:187mm;clear:Both;">
						<div class="styNameBox" style="width:144mm;height:10mm;font-size:7pt;">
							Name(s) shown on tax return<br/>
					 <xsl:choose>
							<!-- Name from 1120/990/1065 Return Header -->
							<xsl:when test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode"
								   select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" 
								  select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:when>
							<!-- Name from 1040 Return Header -->
							<xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt"><br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								</xsl:call-template>
							</xsl:when>
							<!-- Name from 1041 Return Header -->
							<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" 
								  select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" 
								  select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
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
						<div class="styEINBox" style="width:42mm;height:4mm;padding-left:2mm;font-size:7pt;">
            				Identifying number<br/>
							<br/>
							<span style="width:38mm;text-align:left;font-weight:normal;">
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
							</span>
						</div>
					</div>
					<!-- End form title and form number section -->
					<!-- Begin Section A -->
					<div class="styBB" style="width:187mm;clear:both;float:none;height:auto">
						<!-- Added clear:both attribute -->
						<!--<div class="styIRS4684ScheduleName" style="font-size: 8pt; width: 22mm;">SECTION A &#8212;</div>-->
						<div class="styPartDesc" style="height:auto;font-weight: normal; font-size:8pt; width:180mm;padding-left: 0px;">
							<b>SECTION A &#8212; Personal Use Property </b>(Use this section to report casualties and thefts of property<b> not</b>
									used in a trade or business or for income-producing purposes. You must use a separate Form 4684 
									(through line 12) for each casualty or theft event involving personal use property. <b>If reporting a qualified disaster loss, see the 
									instructions for special rules that apply before completing this section.</b>)
            			</div>
					</div>
					<!-- End section A-->
					<div style="width:187mm;">
						<div class="styLNDesc" style="width:187mm;padding-top: 0px">
							<label>
								If the casualty or theft loss is attributable to a federally declared disaster, check here 
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form4684Data/FederallyDeclaredDisasterInd"/>
										<xsl:with-param name="BackupName">IRS4684FederallyDeclaredDisasterInd</xsl:with-param>
									</xsl:call-template>
								</input>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form4684Data/FederallyDeclaredDisasterInd"/>
										<xsl:with-param name="BackupName">IRS4684FederallyDeclaredDisasterInd</xsl:with-param>
									</xsl:call-template>
								and enter the FEMA disaster declaration number. 	
							</label>
						</div>
						<div style="width:187mm;">
							<div class="styLNDesc" style="width:24mm;text-align:left;padding-left:0mm;">(See instructions.)</div>
							<div class="styFixedUnderline" style="height:4mm;width:163mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form4684Data/FEMADisasterDeclarationNum"/>
								</xsl:call-template>
								
								<xsl:if test="(count($Form4684Data/PersonalUseProperties) &gt; 4) and ($Print != $Separated)">
									<span class="styGenericDiv" style="float:right;clear:none;width:7mm;padding-right:0mm;text-align:right;">
										<xsl:call-template name="SetDynamicTableToggleButton">
											<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties"/>
											<xsl:with-param name="containerHeight" select="4"/>
											<xsl:with-param name="containerID" select=" 'PDctn' "/>
										</xsl:call-template>
									</span>
								</xsl:if>
							</div>
						</div>
					</div>	
					<!-- Begin properties description Section -->
					<div class="styIRS4684TableContainer" style="height:44mm;"  id="PDctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" name="TY1Table" id="TY1Table">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS4684TableCellHeaderNoBorders" style="width:8mm;font-size:7pt;
									text-align:left;font-weight:bold;vertical-align:top;" scope="col">
										<span style="width:8mm;padding-left:2.5mm,height:mm">1</span>
									</th>
									<th class="styIRS4684TableCellHeaderNoBorders" style="width:178mm;
									font-size:7pt;text-align:left;font-weight:normal;" colspan="5" scope="col">
								Description of properties (show type, location (city, state, and zip code), and date acquired 
								for each property). Use a separate line for each property lost or damaged from the same casualty 
								or theft. If you checked the box and entered the FEMA disaster declaration number above, enter 
								the zip code for the property most affected on the line for Property <b>A</b>.
									</th>
								</tr>
							</thead>
							<!--<thead class="styTableThead">-->
									<tr>
										<th class="styTableCellHeader" style="text-align:left;width:8mm;border-bottom-width:0px;border-right-width:0px;" scope="col">
												<span class="styTableCellPad"/>
										</th>
										<th class="styTableCellHeader" style="text-align:left;width:15mm;" scope="col">
												<span class="styTableCellPad"/>
										</th>
										<th class="styTableCellHeader" style="width:84mm;font-size:8pt;"  scope="col">
                    		    					Type of Property
										</th>
										<th class="styTableCellHeader" style="width:40mm;font-size:8pt;"  scope="col">
                    		    					City and State
										</th>
										<th class="styTableCellHeader" style="width:20mm;font-size:8pt;"  scope="col">
                    		    					ZIP Code
										</th>
										<th class="styTableCellHeader" style="width:20mm;font-size:8pt;border-right-width:0px;" scope="col">
                    		    					Date Acquired
										</th>
									</tr>

							<!--</thead>-->
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or ( ($Print = $Separated) 
								         and (count ($Form4684Data/PersonalUseProperties) &lt;= 4) )">
									<xsl:for-each select="$Form4684Data/PersonalUseProperties">
										<tr style="font-size:7pt;height:6mm;">
											<td class="styTableCellText" style="text-align:left;width:8mm;border-bottom-width:0px;border-right-width:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="width:15mm;">
                 					    Property <span class="styBoldText">
													<xsl:number format="A"/>
												</span>
											</td>
											<td class="styTableCellText" style="width:84mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="width:40mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
												</xsl:call-template>,
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
												</xsl:call-template>												
											</td>
											<td class="styTableCellCtr" style="width:20mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="width:20mm;border-right-width:0px;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AcquiredDt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($Form4684Data/PersonalUseProperties) &lt; 1) or  
								        (($Print = $Separated) and (count($Form4684Data/PersonalUseProperties) 
								                  &gt; 4))">
									<tr style="height:6mm;font-size:7pt;">
										<td class="styTableCellText" style="text-align:left;width:8mm;border-bottom-width:0px;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:15mm;">
                   							Property <span class="styBoldText">A</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:84mm;padding-left:3mm;">
											<xsl:choose>
												<xsl:when test="(($Print = $Separated) and 
												             (count ($Form4684Data/PersonalUseProperties) &gt; 4))">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form4684Data/
														PersonalUseProperties"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<span class="styTableCellPad"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellText" style="width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:20mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:20m;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($Form4684Data/PersonalUseProperties) &lt; 2)  or
								          (($Print = $Separated) and (count($Form4684Data/PersonalUseProperties) &gt; 4))">
									<tr style="height:6mm;font-size:7pt;">
										<td class="styTableCellText" style="text-align:left;width:8mm;border-bottom-width:0px;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:15mm;">
                   							Property <span class="styBoldText">B</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:84mm;padding-left:3mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:20mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:20mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($Form4684Data/PersonalUseProperties) &lt; 3)
								           or (($Print = $Separated) and (count($Form4684Data/PersonalUseProperties) &gt; 4))">
									<tr style="height:6mm;font-size:7pt;">
										<td class="styTableCellText" style="text-align:left;width:8mm;border-bottom-width:0px;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:15mm;">
                    						Property <span class="styBoldText">C</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:84mm;padding-left:3mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:20mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:20mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($Form4684Data/PersonalUseProperties) &lt; 4)  or  
								        (($Print = $Separated) and (count($Form4684Data/PersonalUseProperties)&gt; 4))">
									<tr style="height:6mm;font-size:7pt;">
										<td class="styTableCellText" style="text-align:left;width:8mm;border-bottom-width:0px;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:15mm;">
                    						Property <span class="styBoldText">D</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:84mm;padding-left:3mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:20mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:20mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'PDctn' "/>
					</xsl:call-template>
					<!--<br/>-->
					<!-- End properties description section -->
					<xsl:if test="(count($Form4684Data/PersonalUseProperties) &gt; 4) and  
					             ($Print!= Separated)">
						<div class="styGenericDiv" style="width:187;clear:both;float:none"/>
					</xsl:if>
					<!-- Start Properties table -->
					<xsl:if test="(($Print != $Separated) or (count($Form4684Data/PersonalUseProperties) 
					      &lt;= 4)) and ((count($Form4684Data/PersonalUseProperties) &gt; 0))">
						<xsl:for-each select="$Form4684Data/PersonalUseProperties">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="position() mod 4 = 1">
								<table class="styTable" cellspacing="0" >
									<tr>
										<th scope="col">
											<span class="styTableCellPad"/>
										</th>
										<th style="width:8mm;color:lightgrey;height:5mm;" scope="col">
											<span class="styTableCellPad"/>
										</th>
										<th class="styTableCellHeader" style="width:120mm;font-size:8pt;
										border-color: black;border-left-width:1px;border-right-width:0px;
										border-bottom-width:1px;border-top-width:0px"
										 colspan="4" scope="col">
                    		    					Properties 
										</th>
									</tr>
									<tr>
										<th style="width:60mm;border:none;font-size:7pt;text-align: 
										          left;padding-left:6mm;font-weight:medium" scope="col">
											<span class="styTableCellPad"/>
										</th>
										<th style="width:5mm;height:3mm;  border-left-width:0px;border-right-width:1px;
										border-top-width:0px;border-bottom-width:1px" scope="col">
											<span class="styTableCellPad"/>
										</th>
										<xsl:for-each select="$Form4684Data/PersonalUseProperties">
											<xsl:if test="(position() &gt;= $pos and position() &lt; $pos+4)">
												<td class="styTableCellSmall" scope="col" style="text-align:center; 
												            font-weight:bold;border-left-width:1px; 
												                         border-right-width:0px; border-top-width:0px; 
												                                      border-bottom-width:1px;border-color:black;">
													<xsl:if test="position() mod 4 =1">
														<xsl:attribute name="style">border-color:black;
															border-left-width:1px;border-right-width:0px;
															border-top-width:0px;
															border-bottom-width:1px;text-align:center;
															font-weight:bold;</xsl:attribute>
													</xsl:if>
													<xsl:number format="A"/>
													<span class="styTableCellPad"/>
												</td>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="count($Form4684Data/PersonalUseProperties[position()
										 &gt;= $pos  and position() &lt; $pos+4]) = 1">
											<xsl:choose>
												<xsl:when test="count($Form4684Data/PersonalUseProperties) &lt; 2">
													<td class="styTableCellSmall" style="text-align:center; 
													       border-color:black;border-left-width:1px;
													     border-right-width:0px; border-top-width:0px;
													      border-bottom-width:1px;border-color:black;font-weight:bold">B
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="text-align:center;
													  border-left-width:1px;border-right-width:0px;
													 border-top-width:0px;border-bottom-width:1px;border-color:black;
													                 font-weight:bold;">C<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="text-align:center; 
													       font-weight:bold;border-left-width:1px;border-right-width:0px; 
													                      border-top-width:0px;border-bottom-width:1px;border-color:black;">
														 D<span class="styTableCellPad"/>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCellSmall" style="border-color:black;
													border-left-width:1px;border-right-width:0px; border-top-width:0px;
													               border-bottom-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="border-color:black;
													border-left-width:1px;border-right-width:0px; border-top-width:0px;
													               border-bottom-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="border-color:black;
													                       border-left-width:1px;border-right-width:0px;border-top-width:0px;
													                                             border-bottom-width:1px;">
														<span class="styTableCellPad"/>
													</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="count($Form4684Data/PersonalUseProperties[position() 
										            &gt;= $pos  and position() &lt; $pos+4]) = 2">
											<xsl:choose>
												<xsl:when test="count($Form4684Data/PersonalUseProperties) &lt; 3">
													<td class="styTableCellSmall" style="text-align:center;
													font-weight:bold;border-color:black;border-left-width:1px;
													border-right-width:0px; border-top-width:0px;
													border-bottom-width:1px;">C
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="text-align:center;
													     font-weight:bold;border-color:black;border-left-width:1px;
													     border-right-width:0px;border-top-width:0px;
													     border-bottom-width:1px;">
														D
														<span class="styTableCellPad"/>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCellSmall" style="border-color:black;
													 border-left-width:1px;border-right-width:0px;
													  border-top-width:0px;border-bottom-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="border-color:black; 
													    border-left-width:1px;border-right-width:0px;  
													    border-top-width:0px;border-bottom-width:1px;">
														<span class="styTableCellPad"/>
													</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="count($Form4684Data/PersonalUseProperties[position() &gt;= 
										$pos  and position() &lt; $pos+4]) = 3">
											<xsl:choose>
												<xsl:when test="count($Form4684Data/PersonalUseProperties) &lt; 4">
													<td class="styTableCellSmall" style="border-color:black;text-align:center;
													       font-weight:bold;border-left-width:1px;border-right-width:0px; 
													        border-top-width:0px;border-bottom-width:1px;">D
														<span class="styTableCellPad"/>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCellSmall" style="border-color:black; 
													   border-left-width:1px;border-right-width:0px;border-top-width:0px; 
													     border-bottom-width:1px;">
														<span class="styTableCellPad"/>
													</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
									</tr>
									<!--  Line 2  -->
									<tr>
										<td style="border:none;" scope="row">
											<span>
												<span class="styGenericDiv" style="width:8mm;font-weight:bold;
												border-top-width:1px;font-size:7pt;padding-left:2.5mm">2</span>
                                                Cost or other basis of each property</span>
														<span class="styBoldText" style="float:right;font-size:8pt;">
															<span class="styDotLn">..</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										vertical-align:bottom;border-left-width:1px;border-right-width:0px; 
										                   border-top-width:1px;border-bottom-width:1px;border-color:black;text-align:center; ">
											<b>2</b>
										</td>
										<td class="styTableCellSmall" style="border-color:black;
										     border-left-width:1px;border-right-width:0px;border-top-width:0px;  
										                                border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black; 
										                   border-left-width:1px;border-right-width:0px;
										                   border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												select="$Form4684Data/PersonalUseProperties[$pos +1]/CostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad" style="border-color:black;
											             border-left-width:1px;border-right-width:0px;border-top-width:0px;
											               border-bottom-width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black; 
										                   border-left-width:1px;border-right-width:0px;border-top-width:0px;
										                                       border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties[$pos + 
												                                         2]/CostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" 
										style="border-left-width:1px;border-right-width:0px;border-top-width:0px; 
										           border-bottom-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties[$pos +
												 3]/CostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- Line 3  -->
									<tr>
										<td style="border:none;">
											<span>
												<span class="styGenericDiv" 
												style="width:8mm;font-size:7pt;padding-left:2.5mm;
												font-weight:bold;">3</span>
                      									Insurance or other reimbursement (whether or
 														<span style="float:left;">
                      									not you filed a claim) (see instructions)</span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">..</span>
														</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB"
										 style="width:5mm;vertical-align:bottom;font-weight:bold;
										 border-left-width:1px; border-right-width:0px;border-top-width:0px;
										             border-bottom-width:1px;border-color:black;text-align:center;">
											<b>3</b>
										</td>
										<td class="styTableCellSmall" 
										style="vertical-align:bottom;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px; padding-top:4mm; 
										              border-color:black">
											<!--start here 1-->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode"
												 select="InsuranceOrOthReimbursementAmt"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="InsuranceOrOthReimbursementAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										   padding-top:2mm;border-left-width:1px;border-right-width:0px;
										   border-top-width:0px;border-bottom-width:1px;border-color:black">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties[$pos +1]
												/InsuranceOrOthReimbursementAmt"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties[$pos +1]
												/InsuranceOrOthReimbursementAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" 
										style="vertical-align:bottom;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;border-color:black;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties[$pos +  2]/
												InsuranceOrOthReimbursementAmt"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties[$pos + 2]
												 /InsuranceOrOthReimbursementAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										 border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties[$pos + 3]
												 /InsuranceOrOthReimbursementAmt"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties[$pos +  3]
												 /InsuranceOrOthReimbursementAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
							<!-- Line 4  -->
									<tr>
										<td style="border:none;">
											<span>
												<span class="styBoldText" style="padding-left:8mm">Note:  </span>  If line 2 is <b>  more </b> than line 3, 
                       											skip line 4.<br/><br/>
                      									
												<span class="styGenericDiv" style="width:8mm;font-size:7pt;padding-left:2.5mm;
												font-weight:bold;">4</span>
                      								Gain from casualty or theft. If line 3 is <b>
									                    more</b> than line 2, enter the difference here and skip
									                    <span style="padding-left:7mm"/> lines 5
									                    through 9 for that column. See<br/><span style="padding-left:7mm"/>
									                  instructions if line 3 includes insurance or other
									                   <span style="padding-left:8mm"/>reimbursement you did not claim, or you 
									                    <span style="padding-left:8mm"/>received payment for your
														loss in a later tax <span style="padding-left:8mm"/>year
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">...........</span>
														</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										    vertical-align:bottom; font-weight:bold;border-left-width:1px;border-right-width:0px; 
										     border-top-width:0px;border-bottom-width:1px;background-color:lightgrey;  
										      border-color:black;padding-top:20mm;text-align:center;">
											<span style="height:5mm;width:8mm;background-color:white; 
											   padding-top:2mm;">
												<b>4</b>
											</span>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										     border-left-width:1px;border-right-width:0px;border-top-width:0px;
										      border-bottom-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainFromCasualtyOrTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										    border-left-width:1px;border-right-width:0px;border-top-width:0px; 
										     border-bottom-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties[$pos +1]/GainFromCasualtyOrTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										     border-left-width:1px;border-right-width:0px;border-top-width:0px; 
										      border-bottom-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties[$pos + 2]/GainFromCasualtyOrTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										     border-color:black;border-left-width:1px;border-right-width:0px; 
										      border-top-width:0px;border-bottom-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties[$pos + 3]/GainFromCasualtyOrTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 5  -->
									<tr>
										<td style="border:none;font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;font-weight:bold; padding-left:2.5mm;">5</span>
												Fair market value 
                       										<B>before</B> casualty or  <span style="padding-left:7mm "/>   theft
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">...........</span>
														</span></span>
													</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;vertical-align:bottom;
										font-weight:bold;border-left-width:1px;
										border-right-width:0px;border-top-width:0px; 
										 border-bottom-width:1px;border-color:black;text-align:center;">
											<b>5</b>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;
										border-right-width:0px;border-top-width:0px;border-bottom-width:1px;border-color:black">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FairMarketValueBeforeTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;
										border-right-width:0px;border-top-width:0px;border-bottom-width:1px;border-color:black">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												select="$Form4684Data/PersonalUseProperties[$pos +1]/FairMarketValueBeforeTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;
										border-right-width:0px;border-top-width:0px;border-bottom-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties[$pos + 2]/FairMarketValueBeforeTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;
										border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;border-color:black">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties[$pos + 3]/
												 FairMarketValueBeforeTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 6  -->
									<tr>
										<td style="border:none;font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;font-weight:bold; padding-left:2.5mm;">6</span>
												Fair market value 
                       										<B>after</B>&#160; casualty or  <span style="padding-left:7mm "/>   theft
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">...........</span>
														</span></span>
													</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
						                   vertical-align:bottom;font-weight:bold;border-left-width:1px;border-right-width:0px;
						                   border-top-width:0px;border-bottom-width:1px;border-color:black;text-align:center;">
											<b>6</b>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;
										border-right-width:0px;border-top-width:0px; border-bottom-width:1px;border-color:black">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FairMarketValueAfterTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties[$pos +1]/FairMarketValueAfterTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;
										border-right-width:0px;border-top-width:0px;border-bottom-width:1px;border-color:black">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties[$pos + 2]/FairMarketValueAfterTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;border-color:black;
										border-left-width:1px;border-right-width:0px; border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties[$pos + 3]/FairMarketValueAfterTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!--  line 7  -->
									<tr>
										<td style="font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;
												              font-weight:bold;padding-left:2.5mm">7</span>
												 Subtract line 6 from line 5</span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">....</span>
														</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										                    vertical-align:bottom;font-weight:bold;border-left-width:1px;
										                    border-right-width:0px;border-top-width:0px;  
										                    border-bottom-width:1px;border-color:black;text-align:center;">
											<b>7</b>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										           border-left-width:1px;border-right-width:0px; 
										            border-top-width:0px;border-bottom-width:1px;border-color:black">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetFairMarketValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;border-color:black">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties[$pos +
												1]/NetFairMarketValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										           border-color:black;border-left-width:1px;border-right-width:0px;
										                       border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties[$pos +  2]
												/NetFairMarketValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										            border-color:black;border-left-width:1px;border-right-width:0px;
										                        border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties[$pos +  3]
												/NetFairMarketValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!--  line 8  -->
									<tr>
										<td style="font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;font-weight:bold;
												              padding-left:2.5mm">8</span>
															 Enter the <span class="styBoldText"> smaller </span>
														 of line 2 or line 7
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										    vertical-align:bottom;font-weight:bold;border-color:black; 
										  border-left-width:1px;border-right-width:0px;border-top-width:0px;
										                   border-bottom-width:1px;text-align:center;">
											<b>8</b>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										               border-color:black;border-left-width:1px;border-right-width:0px;  
										                             border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="SmllrOfAdjOrNetFairMrktVlAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										                   border-color:black;border-left-width:1px;border-right-width:0px;
										                                       border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties[$pos + 1]
												/SmllrOfAdjOrNetFairMrktVlAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										                border-color:black;border-left-width:1px;border-right-width:0px;
										                 border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties[$pos +  2]/
												SmllrOfAdjOrNetFairMrktVlAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										      border-color:black;border-left-width:1px;border-right-width:0px;
										       border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties[$pos +   3]
												 /SmllrOfAdjOrNetFairMrktVlAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!--  line 9  -->
									<tr>
										<td style="border:none;font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;font-weight:bold;
												              padding-left:2.5mm">9</span>
								                         Subtract line 3 from line 8. If zero or 
								                         <span style="padding-left:7mm"/>  less, enter
								                          -0-
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">........</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										                vertical-align:bottom;font-weight:bold;border-color:black; 
										                               border-left-width:1px;border-right-width:0px;
										                               border-top-width:0px;border-bottom-width:1px;text-align:center;">
											<b>9</b>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;  
										                border-color:black;border-left-width:1px;border-right-width:0px; 
										                 border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="PropertyMinusInsuranceValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										                border-color:black;border-left-width:1px;border-right-width:0px; 
										                                border-top-width:0px;border-bottom-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties[$pos + 1]
												 /PropertyMinusInsuranceValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;  
										                  border-color:black;border-left-width:1px;border-right-width:0px;
										                 border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties[$pos + 2]
												 /PropertyMinusInsuranceValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;  
										                  border-color:black;border-left-width:1px;border-right-width:0px; 
										                 border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/
												PersonalUseProperties[$pos + 
												  3]/PropertyMinusInsuranceValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</table>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="(($Print = $Separated) and (count($Form4684Data/PersonalUseProperties) 
					      &gt;  4)) or ((count($Form4684Data/PersonalUseProperties) = 0))">
						<table class="styTable"  cellspacing="0">
							<tr>
								<th scope="col">
									<span class="styTableCellPad"/>
								</th>
								<th style="width:8mm;color:lightgrey;height:5mm" scope="col">
									<span class="styTableCellPad"/>
								</th>
								<th class="styTableCellHeader" style="width:100mm;font-size:8pt;
								border-color: black;border-left-width:1px;border-right-width:0px;  
								border-bottom-width:1px;border-top-width:0px" colspan="4" scope="col">
                    		   	Properties 
										</th>
							</tr>
							<tr>
								<th style="width:60mm;border:none;font-size:7pt;text-align:left;  
								                padding-left:6mm;font-weight:medium;" scope="col">
									<span class="styTableCellPad"/>
								</th>
								<th style="width:4mm;height:3mm;" scope="col">
									<span class="styTableCellPad"/>
								</th>
								<td class="styTableCellSmall" style="text-align:center;width:30mm;
								               border-color:black;border-left-width:1px;border-right-width:0px;
								                               border-top-width:0px;border-bottom-width:1px;
								                                              border-color:black;font-weight:bold">A
														<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="text-align:center; ;width:30mm;
								              border-color:black;border-left-width:1px;border-right-width:0px; 
								                             border-top-width:0px;border-bottom-width:1px;
								                                            border-color:black;font-weight:bold">B
														<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="text-align:center;font-weight:bold;
								              border-color:black;
								              border-left-width:1px;border-right-width:0px; ;width:30mm;
								                                 border-top-width:0px;border-bottom-width:1px;">C
														<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="text-align:center;border-color:black; 
								              font-weight:bold;border-left-width:1px;border-right-width:0px;  
								                           border-top-width:0px;border-bottom-width:1px;width:30mm;">D
														<span class="styTableCellPad"/>
								</td>
							</tr>
							<!-- Line 2 -->
							<tr>
								<td style="border:none;" scope="row">
											<span>
												<span class="styGenericDiv" style="width:8mm;font-weight:bold;
												border-top-width:1px;font-size:7pt;padding-left:2.5mm">2</span>
                                                Cost or other basis of each property</span>
														<span class="styBoldText" style="float:right;font-size:8pt;">
															<span class="styDotLn">..</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
								                   vertical-align:bottom;border-left-width:1px;border-right-width:0px;
								                 border-top-width:1px;border-bottom-width:1px;border-color:black;text-align:center;">
									<b>2</b>
								</td>
								<td class="styTableCellSmall" style="border-color:black;text-align:left; 
								               border-left-width:1px;border-right-width:0px;border-top-width:0px;
								                                            border-bottom-width:1px;">
									<xsl:choose>
										<xsl:when test="(($Print = $Separated) and (count ($Form4684Data/PersonalUseProperties)
										 &gt; 4))">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties"/>
												<xsl:with-param name="ShortMessage" select=" 'true' "/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<span class="styTableCellPad"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="styTableCellSmall" style="border-color:black; 
								                   border-left-width:1px;border-right-width:0px;border-top-width:0px; 
								                                      border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="border-color:black; 
								                   border-left-width:1px;border-right-width:0px;border-top-width:0px; 
								                                      border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="border-left-width:1px;
								            border-right-width:0px;border-top-width:0px;
								                        border-bottom-width:1px;border-color:black;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!--  line 3  -->
							<tr>
									<td style="border:none;">
											<span>
												<span class="styGenericDiv" style="width:8mm;font-size:7pt;padding-left:2.5mm;
												font-weight:bold;">3</span>
                      									Insurance or other reimbursement (whether or
 														<span style="float:left;">
                      									not you filed a claim) (see instructions)</span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">..</span>
														</span>
											</span>
										</td>
								<td class="styIRS4684TableCellSmallRB" style="width:5mm;vertical-align:bottom;   
								         font-weight:bold;border-left-width:1px; border-right-width:0px;border-top-width:0px;
								                     border-bottom-width:1px;border-color:black;text-align:center;">
									<b>3</b>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;
								            border-left-width:1px;border-right-width:0px;border-top-width:0px; 
								                       border-bottom-width:1px;border-color:black;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;
								           border-left-width:1px;border-right-width:0px;border-top-width:0px;
								                       border-bottom-width:1px;border-color:black">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;
								            border-left-width:1px;border-right-width:0px;border-top-width:0px; 
								                       border-bottom-width:1px;border-color:black;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom; 
								           border-color:black;border-left-width:1px;border-right-width:0px;  
								                     border-top-width:0px;border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!-- Line 4   -->
							<tr>
								<td style="border:none;">
									<span>
										<span class="styBoldText" style="padding-left:8mm">Note:  </span>  If line 2 is <b>  more </b> than line 3, 
                       						skip line 4.</span><br/><br/>
                      									<span>
												<span class="styGenericDiv" 
												style="width:8mm;font-size:7pt;padding-left:2.5mm;font-weight:bold;">4</span>
                   								Gain from casualty or theft. If line 3 is <b>
									                    more</b> than line 2, enter the difference here and skip
									                    <span style="padding-left:7mm"/> lines 5
									                    through 9 for that column. See<br/><span style="padding-left:7mm"/>
									                  instructions if line 3 includes insurance or other
									                   <span style="padding-left:8mm"/>reimbursement you did not claim, or you 
									                    <span style="padding-left:8mm"/>received payment for your
														loss in a later tax <span style="padding-left:8mm"/>year
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">...........</span>
														</span>
											</span>
										</td>
								<td class="styIRS4684TableCellSmallRB" style="width:5mm;
								            vertical-align:bottom; font-weight:bold;border-left-width:1px;border-right-width:0px;
								             border-top-width:0px;border-bottom-width:1px;background-color:lightgrey;  
								             border-color:black;padding-top:20mm;text-align:center;">
									<span style="height:5mm;width:8mm;background-color:white; 
									           padding-top:2mm;">
										<b>4</b>
									</span>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;
								                    border-left-width:1px;border-right-width:0px;border-top-width:0px;
								                                       border-bottom-width:1px;border-color:black;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;
								            border-left-width:1px;border-right-width:0px;border-top-width:0px;
								                        border-bottom-width:1px;border-color:black;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom; 
								           border-left-width:1px;border-right-width:0px;border-top-width:0px;
								                       border-bottom-width:1px;border-color:black;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom; 
								                   border-color:black;border-left-width:1px;border-right-width:0px;  
								                                     border-top-width:0px;border-bottom-width:1px">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!-- line 5 -->
							<tr>
								<td style="border:none;font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;font-weight:bold;
												 padding-left:2.5mm;">5</span>
												Fair market value 
                       										<B>before</B> casualty or  <span style="padding-left:7mm "/>
                       										   theft
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">...........</span>
														</span></span>
													</td>
								<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
								     vertical-align:bottom;padding-left:0mm;font-weight:bold;
								      border-left-width:1px;border-right-width:0px;border-top-width:0px; 
								                        border-bottom-width:1px;border-color:black;text-align:center;">
									<b>5</b>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;
								                   border-left-width:1px;border-right-width:0px;border-top-width:0px; 
								                                     border-bottom-width:1px;border-color:black">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;
								                    border-left-width:1px;border-right-width:0px;border-top-width:0px;
								                                        border-bottom-width:1px;border-color:black">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;
								                    border-left-width:1px;border-right-width:0px;border-top-width:0px;
								                                         border-bottom-width:1px;border-color:black;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom; 
								           border-left-width:1px;border-right-width:0px;border-top-width:0px; 
								                      border-bottom-width:1px;border-color:black">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!--  line 6 -->
							<tr>
								<td style="border:none;font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;font-weight:bold;
												 padding-left:2.5mm;">6</span>
												Fair market value 
                       										<B>after</B> casualty or  <span style="padding-left:7mm "/>
                       										   theft
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">...........</span>
														</span>
														</span>
										</td>
								<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
								       vertical-align:bottom;font-weight:bold;border-left-width:1px;
								        border-right-width:0px;border-top-width:0px;
								         border-bottom-width:1px;border-color:black;text-align:center;">
									<b>6</b>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;
								      border-left-width:1px;border-right-width:0px;border-top-width:0px; 
								         border-bottom-width:1px;border-color:black">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom; 
								       border-left-width:1px;border-right-width:0px;border-top-width:0px; 
								        border-bottom-width:1px;border-color:black;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom; 
								       border-left-width:1px;border-right-width:0px;border-top-width:0px; 
								       border-bottom-width:1px;border-color:black">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom; 
								       border-color:black;border-left-width:1px;border-right-width:0px;
								       border-top-width:0px;border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!-- Line 7  -->
							<tr>
								<td style="font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;  
												     font-weight:bold;padding-left:2.5mm">7</span>
												 Subtract line 6 from line 5</span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">....</span>
														</span>
										</td>
								<td class="styIRS4684TableCellSmallRB" style="width:5mm;
								         vertical-align:bottom;font-weight:bold;border-left-width:1px; 
								          border-right-width:0px;border-top-width:0px;   
								          border-bottom-width:1px;border-color:black;text-align:center;">
									<b>7</b>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom; 
								           border-left-width:1px;border-right-width:0px; 
								                      border-top-width:0px;border-bottom-width:1px;border-color:black">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom; 
								           border-left-width:1px;border-right-width:0px;
								                       border-top-width:0px;border-bottom-width:1px;border-color:black">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;
								            border-color:black;border-left-width:1px;border-right-width:0px; 
								                       border-top-width:0px;border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom; 
								           border-color:black;border-left-width:1px;border-right-width:0px; 
								                      border-top-width:0px;border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!-- Line 8  -->
							<tr>
								<td style="font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;font-weight:bold;
												              padding-left:2.5mm">8</span>
  													 Enter the <span class="styBoldText"> smaller </span>
														 of line 2 or line 7
											</span>
										</td>
								<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
								                vertical-align:bottom;font-weight:bold;border-color:black; 
								                border-left-width:1px;border-right-width:0px;border-top-width:0px; 
								                                border-bottom-width:1px;text-align:center;">
									<b>8</b>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom; 
								               border-color:black;border-left-width:1px;border-right-width:0px;
								                               border-top-width:0px;border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom; 
								                   border-color:black;border-left-width:1px;border-right-width:0px; 
								                                      border-top-width:0px;border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;  
								              border-color:black;border-left-width:1px;border-right-width:0px; 
								                             border-top-width:0px;border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom; 
								                   border-color:black;border-left-width:1px;border-right-width:0px; 
								                                       border-top-width:0px;border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<!-- line 9  -->
							<tr>
								<td style="border:none;font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;font-weight:bold;
												              padding-left:2.5mm">9</span>
								                         Subtract line 3 from line 8. If zero or 
								                         <span style="padding-left:7mm"/>  less, enter
								                          -0-
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">........</span>
												</span>
											</span>
										</td>
								<td class="styIRS4684TableCellSmallRB" style="width:5mm;
								                vertical-align:bottom;font-weight:bold;border-color:black;
								                                border-left-width:1px;border-right-width:0px;
								                                border-top-width:0px; border-bottom-width:1px;
								                                text-align:center;">
									<b>9</b>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;
								                  border-color:black;border-left-width:1px;border-right-width:0px;
								                                    border-top-width:0px;border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;
								                 border-color:black;border-left-width:1px;border-right-width:0px; 
								                                 border-top-width:0px;border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;  
								                  border-color:black;border-left-width:1px;border-right-width:0px; 
								                                     border-top-width:0px;border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom; 
								                   border-color:black;border-left-width:1px;border-right-width:0px; 
								                                      border-top-width:0px;border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<!-- End properties table -->
					<!-- Begin Amount Boxes -->
					<!-- Line 10  -->             
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="size:7mmheight:4mm;">10</div>
						<div class="styLNDesc" style="width:139mm;height:4mm">
							<span>
					               Casualty or theft loss. Add the amounts on line 9 in columns A through D
                                </span>
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span class="styDotLn">...........</span>
								</span>
							<!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">10</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form4684Data/TotalPrsnlPropertyTheftLossAmt"/>
							</xsl:call-template>
						</div>
						<!-- Line 11  --> 
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">11</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
					              Enter $100 ($500 if qualified disaster loss rules apply; see instructions)
					              <!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">11</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$Form4684Data/CasualtyOrTheftLossLimitAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 12  -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">12</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
			                Subtract line 11 from line 10. If zero or less, enter -0-
  									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">.................</span>
									</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">12</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$Form4684Data/NetCasualtyOrTheftLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span style="width:4px;"/>
							</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span >
									<b>Caution: </b>  Use only one Form 4684 for lines 13 through 18.  
						              </span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4mm;">
								<span style="width:4px;"/>
							</div>
							<div class="styLNAmountBoxNBB" style="height:4mm;"/>
						</div>
						<!-- Line 13  -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">13</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span>
									
					              Add the amounts on line 4 of all Forms 4684
                                   </span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">....................</span>
									</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">13</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$Form4684Data/TotalCasualtyAndTheftGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 14  -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:7mm;">14</div>
							<div class="styLNDesc" style="width:139mm;height:7mm;">
									Add the amounts on line 12 of all Forms 4684.  If you have losses not attributable to a federally declared <br/>
									disaster, see the instructions
                                 
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">.........................</span>
									</span>
							</div>
							<div class="styLNRightNumBox" 
							style="width:8mm;height:3mm;border-bottom-width:0px;background-color:lightgrey"/>
							<div class="styLNAmountBoxNBB" style="height:3mm;width:32mm"/>
							<div class="styLNRightNumBox" style="height:4mm;">14</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$Form4684Data/TotalNetCasualtyOrTheftLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span style="width:4px;"/>
							</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span >
									<b>Caution: </b> See instructions before completing line 15. 
						              </span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4mm;">
								<span style="width:4px;"/>
							</div>
							<div class="styLNAmountBoxNBB" style="height:4mm;"/>
						</div>
						<!--  Line 15  -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;width:8mm">15</div>
							<div class="styLNDesc" style="width:121.7mm;height:auto;">
								 <img src="{$ImagePath}/8827_Bullet_Round.gif" width="4" height="4" alt="Bullet Image"/>
								If line 13 is<b> more </b>than line 14, enter the 
								difference here 	and on Schedule D.  <b>  Do not</b>
									<br/>
					           complete the rest of this section.<br/>
								 <img src="{$ImagePath}/8827_Bullet_Round.gif" width="4" height="4" alt="Bullet Image"/>
								If line 13 is <b> equal </b> to line 14, enter -0- here. <b> Do not </b> complete the rest of this section.
								<br/>
								 <img src="{$ImagePath}/8827_Bullet_Round.gif" width="4" height="4" alt="Bullet Image"/>
								If line 13 is <b> less </b> than line 14, and you have no qualified disaster losses subject to the $500 
								reduction on line 11 on any Form(s) 4684, enter -0- here and go to line 16. <span style="width:1mm"/>If you have qualified 
								disaster losses subject to the $500 reduction, subtract line 13 from line 14 and enter the smaller 
								of this difference or the amount on line 12 of the Form(s) 4684 reporting those losses. <span style="width:1mm"/>Enter that  
								result here and on Schedule A (Form 1040 or 1040-SR), line 16, or Form 1040-NR, Schedule A, line 7. <span style="width:1mm"/>If you 
								claim the standard deduction, also include on Schedule A (Form 1040 or <br/>1040-SR ), line 16, the amount of  
								your standard deduction (see the instructions for Form 1040 or Form 1040-SR).<span style="width:1mm"/>Do not complete the rest of this 
								section if all of your casualty or theft losses are subject to the $500 reduction.
							</div>
							<div class="styLNDesc" style="width:3.1mm; height:4mm;">
								<img src="{$ImagePath}/4684_Bracket.gif" width="8mm" height="135mm" alt="bracket  image"/>
							</div>
							<div style="float:left;padding-left:1mm;width:14.2mm;padding-top:17mm;height:32mm">
									<span class="styDotLn"> ...</span>
							</div>
							<div class="styLNRightNumBox" style="height:20.5mm;padding-top:17mm;width:8mm">15</div>
							<div class="styLNAmountBox" style="height:20.5mm;padding-top:17mm;width:31.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/TotalTheftGainLessTotalLossAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" 
							style="width:8mm;height:17mm;border-bottom-width:0px;background-color:lightgrey">
								<span style="width:3px;"/>
							</div>
							<div class="styLNAmountBoxNBB" style="height:17mm;width:32mm"/>
						</div>
						<!--  line 16   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">16</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span>
					              Add lines 13 and 15. Subtract the result from line 14
                                  </span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">.................</span>
									</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;width:8mm">
					              16
					            </div>
							<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$Form4684Data/TotalLossLessTotalTheftGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  line 17 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">17</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							Enter 10% of your adjusted gross income from Form 1040 or Form 1040-SR, 
							line 8b, or Form 1040-NR, line 35. Estates and trusts, see instructions
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span class="styDotLn">......................</span>
								</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:4mm">17</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:4mm;width:31.9mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form4684Data/TenPercentOfAGIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Amount Box section -->
					<!--  line 18 -->
					<div class="styTBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">18</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">Subtract line 17 
						from line 16. If zero or less, enter -0- Also enter the result on Schedule A
						 (Form 1040 or 1040-SR), line 15, or Form 1040-NR, Schedule A, line 6. Estates and trusts,
						  enter the result on the "Other deductions" line of your tax return
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span class="styDotLn">.......................</span>
								</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10.5mm;
						padding-top:7mm;">18</div>
						<div class="styLNAmountBoxNBB" style="height:10.5mm;
						padding-top:7mm;width:31.9mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form4684Data/CalcAdjGroIncmMnsTotNetLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--footer -->
					<div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
						<div style="width:100mm;font-weight:bold;" class="styGenericDiv">For Paperwork
						 Reduction Act Notice, see instructions.</div>
						<div style="width:30mm;text-align:center;"
						 class="styGenericDiv">Cat. No. 12997O</div>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">4684
						</span> (2019)</div>
					</div>
					<p style="page-break-before:always"/>
					<!-- header page 2 -->
					<div class="styTBB" style="width:187mm;clear:both;padding-bottom:.5mm;">
						<div class="styGenericDiv" style="width:75mm;" >Form 4684 (2019)</div>
						<div class="styGenericDiv" style="width:55mm;text-align:left; padding-left: 3mm;" >
						Attachment Sequence No. <span class="styBoldText">26</span>
						</div>
						<div class="styGenericDiv" style="float:right;" >Page <span
						 class="styBoldText" style="font-size:8pt;">2
						</span>
						</div>
					</div>
					<!-- Taxpayer Name and number section -->
					<div class="styBB" style="width:187mm;clear:both;float:none;">
						<div class="styNameBox" style="width:156mm;height:8mm">
				                    Name(s) shown on tax return. Do not enter name and
				                     identifying number if shown on other side.
				            <br/>
				            <xsl:choose>
							<!-- Name from 1120/990/1065 Return Header -->
							<xsl:when test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode"
								   select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" 
								  select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:when>
							<!-- Name from 1040 Return Header -->
							<xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt"><br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								</xsl:call-template>
							</xsl:when>
							<!-- Name from 1041 Return Header -->
							<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" 
								  select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" 
								  select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
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
						<div class="styEINBox" style="width:31mm;height:4mm;padding-left:2mm;">Identifying number<br/>
							<br/>
							<span style="width:38mm;text-align:left;font-weight:normal;">
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
							</span>
						</div>
					</div>
					<!-- Section B Part I -->
					<div class="styBB" style="width:187mm;float:none;">
						<div class="styIRS4684ScheduleName" 
						style="width:187mm;font-size:8pt;text-align:left;">
				                SECTION B &#8212; Business and Income-Producing Property
				      </div>
					</div>
					<div class="styBB" style="width:187mm;clear:both;float:none;;height:4mm">
						<!-- Added clear:both attribute -->
						<div class="styPartName" style="background-color:black;width:12mm">Part I</div>
						<div class="styPartDesc" style="width:168mm;">Casualty or Theft Gain or Loss 
				                  <span class="styNormalText"> (Use a separate Part I for each casualty or theft.)
				                  </span>
						</div>
						<xsl:if test="(count($Form4684Data/BusinessProperties) &gt; 4)
						 and ($Print !=  $Separated)">
							<div class="styGenericDiv" style="width:7mm;text-align:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" 
									select="$Form4684Data/BusinessProperties"/>
									<xsl:with-param name="containerHeight" select="4"/>
									<xsl:with-param name="containerID" select=" 'BPDctn' "/>
								</xsl:call-template>
							</div>
						</xsl:if>
					</div>
					<!-- Begin properties description table -->
					<!-- Added clear:both attribute for the print logic to work correctly -->
					<div class="styIRS4684TableContainer" style="height:Auto" id="BPDctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" name="TY1Table" id="TY1Table">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS4684TableCellHeaderNoBorders" 
									style="width:8mm;font-size:7pt;text-align:left;font-weight:bold;
									vertical-align:top;" scope="col">
										<span style="width:8mm;padding-left:1mm">19</span>
									</th>
									<th class="styIRS4684TableCellHeaderNoBorders" style="width:178mm; font-size:7pt;
									text-align:left;font-weight:normal;vertical-align:top;" colspan="2" scope="col">
							                  Description of properties (show type, location, and date acquired for each 
							                  property). Use a separate line for each property lost or damaged from the 
							                  same casualty or theft. <b>See instructions if claiming a loss due to a 
							                  Ponzi-type investment scheme and Section C is not completed.</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form4684Data/BusinessProperties) &lt;= 4)">
									<xsl:for-each select="$Form4684Data/BusinessProperties">
										<tr style="font-size:7pt;height:6mm;">
											<td class="styTableCellNoBorders" style="text-align:center;width:8mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellNoBorders" style="text-align:left;width:25mm;vertical-align:bottom;">
                    								Property <span class="styBoldText">
													<xsl:number format="A"/>
												</span>
											</td>
											<td class="styTableCellNoBorders" style="width:158mm;text-align:left; 
											           border-bottom-width:1px;vertical-align:bottom;border-bottom-width:1px; 
											                      border-color: black;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($Form4684Data/BusinessProperties) &lt; 1) or  
								        (($Print = $Separated) and (count($Form4684Data/BusinessProperties) 
								        &gt; 4))">
									<tr style="height:6mm;font-size:7pt;">
										<td class="styTableCellNoBorders" style="text-align:center;width:8mm;">
													<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="text-align:left;width:25mm;
										           vertical-align:bottom;">
                   								 Property <span class="styBoldText">A</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="width:158mm;text-align:left;  
										         padding-left:3mm;border-bottom-width:1px;vertical-align:center; 
										                   border-color: black;text-align:left;">
											<xsl:choose>
												<xsl:when test="(($Print = $Separated) and  
												            (count  ($Form4684Data/BusinessProperties) &gt; 4))">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" 
														select="$Form4684Data/PersonalUseProperties"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<span class="styTableCellPad"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($Form4684Data/BusinessProperties) &lt; 2) or 
								         (($Print = $Separated) and  
								         (count($Form4684Data/BusinessProperties) &gt; 4))">
									<tr style="height:6mm;font-size:7pt;">
										<td class="styTableCellNoBorders" 
										style="text-align:center;width:8mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" 
										style="text-align:left;width:25mm;vertical-align:bottom;">
                    							Property <b>B</b>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders"
										 style="width:158mm;text-align:left; padding-left:3mm;
										 border-bottom-width:1px;vertical-align:center;border-color: black;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($Form4684Data/BusinessProperties) &lt; 3)
								 or (($Print = $Separated) and  (count($Form4684Data/BusinessProperties) &gt; 4))">
									<tr style="height:6mm;font-size:7pt;">
										<td class="styTableCellNoBorders" style="text-align:center;width:8mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="text-align:left;width:25mm;
										           vertical-align:bottom;">
                    							Property <b>C</b>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="width:158mm;text-align:left;
										           padding-left:3mm;border-bottom-width:1px;vertical-align:center; 
										                     border-color: black;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($Form4684Data/BusinessProperties) &lt; 4) or 
								         (($Print = $Separated) and  (count($Form4684Data/BusinessProperties)
								          &gt; 4))">
									<tr style="height:6mm;font-size:7pt;">
										<td class="styTableCellNoBorders"
										 style="text-align:center;width:8mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" 
										style="text-align:left;width:25mm;  padding- left:0mm;vertical-align:bottom;">
                    							Property <b>D</b>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" 
										style="width:158mm;text-align:left; padding-left:3mm;
										border-bottom-width:1px;vertical-align:center;border-color: black;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'BPDctn' "/>
					</xsl:call-template>
					<br/>
					<!-- End Business properties description table -->
					<!-- Start Business Properties table -->
					<xsl:choose>
						<xsl:when test="(($Print != $Separated) or (count($Form4684Data/BusinessProperties) 
						       &lt;= 4)) and        (count($Form4684Data/BusinessProperties) != 0)">
							<xsl:for-each select="$Form4684Data/BusinessProperties">
								<xsl:variable name="pos" select="position()"/>
								<xsl:if test="position() mod 4 = 1">
									<table class="styTable" cellspacing="0" style="width:187mm;">
										<tr>
											<th scope="col">
												<span class="styTableCellPad"/>
											</th>
											<th scope="col">
												<span class="styTableCellPad"/>
											</th>
											<th class="styTableCellHeader" style="width:100mm;font-size:8pt;
											             border-color:black;border-left-width:1px;border-right-width:0px; 
											             border-top-width:1px;border-bottom-width:0px;"
											              colspan="4" scope="col">
			                   							 Properties
											</th>
										</tr>
										<tr>
											<th scope="col">
												<span class="styTableCellPad"/>
											</th>
											<th scope="col">
												<span class="styTableCellPad"/>
											</th>
											<xsl:for-each select="$Form4684Data/BusinessProperties">
												<xsl:if test="(position() &gt;= $pos and position() &lt; $pos+4)">
													<td class="styTableCellSmall" scope="col" style="text-align:center; 
													              font-weight:bold;border-left-width:1px;  
													              border-right-width:0px;border-top-width:1px;   
													            border-bottom-width:1px;border-color:black;">
														<xsl:if test="position() mod 4 =1">
															<xsl:attribute name="style">border-color:black;
																border-left-width:1px;border-right-width:0px;border-top-width:1px;
																border-bottom-width:1px;text-align:center;font-weight:bold;
																</xsl:attribute>
														</xsl:if>
														<xsl:number format="A"/>
														<span class="styTableCellPad"/>
													</td>
												</xsl:if>
											</xsl:for-each>
											<xsl:if test="count($Form4684Data/BusinessProperties[position()
											 &gt;= $pos  and position() &lt; $pos+4]) = 1">
												<xsl:choose>
													<xsl:when test="count($Form4684Data/BusinessProperties) &lt; 2">
														<td class="styTableCellSmall" style="text-align:center;
														       font-weight:bold;border-color:black;border-left-width:1px; 
														        border-right-width:0px;border-top-width:1px;
														                        border-bottom-width:1px;">B
														                        <span class="styTableCellPad"/>
														</td>
														<td class="styTableCellSmall" style="text-align: center;
														      font-weight:bold;border-color:black;border-left-width:1px;
														      border-right-width:0px;border-top-width:1px;
														      border-bottom-width:1px;">C<span class="styTableCellPad"/>
														</td>
														<td class="styTableCellSmall" style="text-align: center; 
														  font-weight:bold;border-color:black;border-left-width:1px;
														  border-right-width:0px;border-top-width:1px;
														  border-bottom-width:1px;">D<span class="styTableCellPad"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styTableCellSmall" style="border-color:black;
														                border-left-width:1px;border-right-width:0px; 
														              border-top-width:1px;border-bottom-width:1px;">
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCellSmall" style="border-color:black; 
														      border-left-width:1px;border-right-width:0px;
														       border-top-width:1px;border-bottom-width:1px;">
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCellSmall" style="border-color:black; 
														    border-left-width:1px;border-right-width:0px;
														     border-top-width:1px;border-bottom-width:1px;">
															<span class="styTableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<xsl:if test="count($Form4684Data/BusinessProperties[position()
											 &gt;=  $pos  and position() &lt; $pos+4]) = 2">
												<xsl:choose>
													<xsl:when test="count($Form4684Data/BusinessProperties) &lt; 3">
												<td class="styTableCellSmall" style="text-align: center; font-weight:bold;
												border-color:black;border-left-width:1px;
												 border-right-width:0px;border-top-width:1px; 
												                border-bottom-width:1px;">C<span class="styTableCellPad"/>
														</td>
														<td class="styTableCellSmall" style="text-align: center; 
														    font-weight:bold;border-color:black;border-left-width:1px; 
														    border-right-width:0px;border-top-width:1px; 
														      border-bottom-width:1px;">D<span class="styTableCellPad"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styTableCellSmall" style="border-color:black;
														   border-left-width:1px;border-right-width:0px;border-top-width:1px;
														                   border-bottom-width:1px;">
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCellSmall" style="border-color:black;
														                border-left-width:1px;border-right-width:0px; 
														                               border-top-width:1px;border-bottom-width:1px;">
															<span class="styTableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<xsl:if test="count($Form4684Data/BusinessProperties[position() 
											             &gt;= $pos  and              position() &lt; $pos+4]) = 3">
												<xsl:choose>
													<xsl:when test="count($Form4684Data/BusinessProperties) &lt; 4">
														<td class="styTableCellSmall" style="text-align: center; 
														               font-weight:bold;border-color:black;border-left-width:1px; 
														                              border-right-width:0px;border-top-width:1px; 
														                                             border-bottom-width:1px;">D
																<span class="styTableCellPad"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styTableCellSmall" style="border-color:black;
														                border-left-width:1px;border-right-width:0px;
														          border-top-width:1px;border-bottom-width:1px;">
															<span class="styTableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</tr>
										<span style="height:2mm;"/>
										<!--  line 20  -->
										<tr>
											<td style="border:none;">
												<div>
													<span class="styGenericDiv" style="width:76mm;font-size:7pt;">
														
															<span class="styBoldText" style="float:left;padding-left:1mm">20</span>
															<span style="padding-left:2mm;float:left clear:none;">
															Cost or adjusted basis of each property</span>
															
															 
																<span class="styDotLn" style="padding-left:2mm;float:right;clear:none;">....</span>
															
														
													</span>
												</div>
											</td>
											<td class="styIRS4684TableCellSmallRB " style="width:5mm;
											             border-top-width:1px;font-weight:bold;border-color:black; 
											                         border-left-width:1px;border-right-width:0px;
											                                     border-top-width:1px;border-bottom-width:1px;text-align:center;">20</td>
											<td class="styTableCellSmall" style="border-color:black;
											             border-left-width:1px;border-right-width:0px;border-top-width:0px;
											                          border-bottom-width:1px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CostOrAdjustedBasisAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
											             border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                         border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties 
													              [$pos + 1]/CostOrAdjustedBasisAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px;
											                         border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="$Form4684Data/BusinessProperties 
													               [$pos +  2]/CostOrAdjustedBasisAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                        border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties 
													              [$pos +  3]/CostOrAdjustedBasisAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Note: We Have the best possible dotes alignment line 21-27 any changes to this alignment in on line 
                                               can effect the alignment for another one or more lines.  --> 
										<!-- line 21 -->
										<tr>
											<td style="border:none;">
												<span>
													<span class="styGenericDiv" style="width:76mm;font-size:7pt;">
														
															<span class="styBoldText"
															 style="float:left;padding-left:1mm">21</span>
													   <span style="padding-left:2mm">
													    Insurance or other reimbursement (whether or not you<br/>filed a claim). 
                                                        See the instructions for line 3 
                                                        
																		<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
																	
														</span>
													</span>
												</span>
											</td>
											<!-- line 21A -->
											<td class="styIRS4684TableCellSmallRB " 
											style="width:5mm;vertical-align:bottom; 
											                  font-weight:bold;border-left-width:1px;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;border-color:black;text-align:center;">21</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px; 
											               border-right-width:0px;border-top-width:0px;border-bottom-width:1px;  
											                             border-color:black">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="InsuranceOrOthReimbursementAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" 
											style="vertical-align:bottom;border-left-width:1px; 
											               border-right-width:0px;border-top-width:0px;
											               border-bottom-width:1px;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties 
													              [$pos + 1]/InsuranceOrOthReimbursementAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" 
											style="vertical-align:bottom;border-left-width:1px;
											                 border-right-width:0px;border-top-width:0px;border-bottom-width:1px; 
											                                  border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties 
													              [$pos +  2]/InsuranceOrOthReimbursementAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" 
											style="vertical-align:bottom;border-color:black; 
											             border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                          border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties  
													             [$pos + 3]/InsuranceOrOthReimbursementAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 22 -->
										<tr>
											<td style="border:none;font-size:7pt;">
												
													<span  style="font-size:7pt;width:76mm;">
														<span  style="padding-left:7mm;padding-bottom:1mm;"><b>Note:  </b>  If line 20 is <b>more</b> than line 21, skip line 22</span>
														<span class="styGenericDiv" style="width:76mm;font-size:7pt;">
														
															<span class="styBoldText" style="float:left;padding-left:1mm">22</span>
													        <span style="padding-left:2mm;width:71mm;">Gain from casualty or theft. If line 21 is 
																   <b>more</b> than line 20, enter the difference   
																	here and on line 29 or line 34, column (c), except as
																	provided in the instructions for line 33. 
																	Also, skip lines 23 through 27 for that column.  See
																	the instructions for line 4 if line 21 includes insurance or other reimbursement you did not
																	claim, or you received payment for your loss in a later tax year
																	
																	<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
																	
															</span>
														</span>
													</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm;
												          vertical-align:bottom;font-weight:bold;border-color:black;border-left-width:1px; 
												          border-right-width:0px;border-top-width:0px; border-bottom-width:1px;
												          background-color:lightgrey; text-align:center;">
													<div style="width:8mm;height:6mm;vertical-align:bottom;text-align:center;
													padding-top:2mm;">
														<span style="height:4mm;width:8mm;background-color:white;
														bordr-right-width:1px;padding-top:1mm;">
															<b>22</b>
														</span>
													</div>
												</td>
											<td class="styTableCellSmall" style="vertical-align:bottom; border-left-width:1px;
											border-right-width:0px;border-top-width:0px;border-bottom-width:1px;border-color:black">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="GainFromCasualtyOrTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom; border-left-width:1px;
											border-right-width:0px;border-top-width:0px; border-bottom-width:1px;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="$Form4684Data/BusinessProperties 
													  [$pos +  1]/GainFromCasualtyOrTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;  
											           border-left-width:1px;border-right-width:0px;border-top-width:0px;
											                        border-bottom-width:1px;border-color:black">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties  
													             [$pos +  2]/GainFromCasualtyOrTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom; 
											            border-color:black;border-left-width:1px;border-right-width:0px; 
                                                     border-top-width:0px;border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties 
													              [$pos +  3]/GainFromCasualtyOrTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 23 -->
										<tr>
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:76mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">23</span>
															<span style="float:left;padding-left:2mm;">Fair market value <b> before </b> casualty or theft 
																</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
															<span class="styDotLn">...</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm;
											             font-weight:bold;border-left-width:1px;text-align:center; 
								                         border-right-width:0px;border-top-width:0px;  
								                                    border-bottom-width:1px;border-color:black;">23</td>
											<td class="styTableCellSmall" style="border-color:black;  
											           border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                       border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="FairMarketValueBeforeTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                        border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="$Form4684Data/BusinessProperties  
													              [$pos + 1]/FairMarketValueBeforeTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
											             border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                         border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties  
													             [$pos + 2]/FairMarketValueBeforeTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px;  
											                       border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties  
													             [$pos + 3]/FairMarketValueBeforeTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 24 -->
										<tr>
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:76mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">24</span>
															<span style="float:left;padding-left:2mm;">
													 Fair market value <b> after </b> casualty or theft																
																</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">....</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
											            font-weight:bold;border-left-width:1px;text-align:center; 
											            border-right-width:0px;border-top-width:0px;
											            border-bottom-width:1px;border-color:black;">24</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                        border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="FairMarketValueAfterTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
											             border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                         border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties  
													             [$pos +   1]/FairMarketValueAfterTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;  
											           border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                       border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="$Form4684Data/BusinessProperties 
													               [$pos +2]/FairMarketValueAfterTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                        border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="$Form4684Data/BusinessProperties  
													              [$pos +  3]/FairMarketValueAfterTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 25  -->
										<tr>
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:76mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">25</span>
															<span style="float:left;padding-left:2mm;">
													 Subtract line 24 from line 23															
																</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">.......</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm;text-align:center;  
											           font-weight:bold;border-left-width:1px;border-right-width:0px; 
											                       border-top-width:0px;border-bottom-width:1px;border-color:black;">25</td>
											<td class="styTableCellSmall" style="border-color:black;  
											           border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                       border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="NetFairMarketValueAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;  
											           border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                       border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties  
													             [$pos + 1]/NetFairMarketValueAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
											             border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                         border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="$Form4684Data/BusinessProperties 
													               [$pos + 2]/NetFairMarketValueAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px;  
											                       border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties 
													              [$pos +  3]/NetFairMarketValueAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!--  Line 26 -->
										<tr>
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:76mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">26</span>
															<span style="float:left;padding-left:2mm;">
														 Enter the <b> smaller </b> of line 20 or line 25														
																</span>
															<span class="styBoldText" style="float:right;">
	                                                           <span class="styDotLn">.....</span>
	                                                      </span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
											            font-weight:bold;text-align:center;border-color:black; 
											                        border-left-width:1px;border-right-width:0px; 
											                                    border-top-width:0px;border-bottom-width:1px;">26</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px;
											                         border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="SmllrOfCostOrNetFairMrktVlAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px;
											                         border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties 
													              [$pos + 1]/SmllrOfCostOrNetFairMrktVlAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;  
											           border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                       border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties  
													             [$pos + 2]/SmllrOfCostOrNetFairMrktVlAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;  
											           border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                       border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties 
													              [$pos + 3]/SmllrOfCostOrNetFairMrktVlAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 27 -->
										<!--start here ii-->
										<tr>
											<td style="border:none;font-size:7pt;">
												
													<span  style="font-size:7pt;padding-top:1mm;padding-left:7mm;">
														<b>Note: </b>  If the property was totally destroyed by 
																casualty or lost from theft, enter on line 26 the 
												                amount from line 20.
												    </span>
													<span>
														<span class="styGenericDiv" style="width:76mm;font-size:7pt;padding-top:1mm;">
															<span>
																<span  style="float:left;padding-left:1mm"><b>27</b>
																	 &#160;Subtract line 21 from line 26. If zero or less, enter -0- 
																</span>
															</span>
														</span>
													
												</span>
												<td class="styIRS4684TableCellSmallRB" style="width:5mm;
												          vertical-align:bottom;font-weight:bold;border-color:black;border-left-width:1px;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;background-color:lightgrey;text-align:center;">
													<div style=";width:8mm;height:6mm;vertical-align:bottom;text-align:center;padding-top:2mm;">
														<span style="height:4mm;width:8mm;background-color:white;bordr-right-width:1px;padding-top:1mm">
															<b>27</b>
														</span>
													</div>
												</td>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
											            border-color:black;border-left-width:1px;border-right-width:0px;  
											            border-top-width:0px;border-bottom-width:1px;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" 
														select="NetBusinessPropertyLossAmt"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 27 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode" 
														select="NetBusinessPropertyLossAmt/@seeAttachedStatementCd"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="NetBusinessPropertyLossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;  
											                       border-right-width:0px;border-top-width:0px; 
											                                   border-bottom-width:1px;border-color:black;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" 
														select="$Form4684Data/BusinessProperties[$pos+1]
														/NetBusinessPropertyLossAmt"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 27 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode"
														 select="$Form4684Data/BusinessProperties[$pos+1]/                                                        NetBusinessPropertyLossAmt/@seeAttachedStatementCd"/>
													</xsl:call-template>
												</div>
												<!-- End adding pen image -->
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties[$pos + 1]
													/NetBusinessPropertyLossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
											             border-left-width:1px;border-right-width:0px;border-top-width:0px;
											                          border-bottom-width:1px;border-color:black;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" 
														select="$Form4684Data/BusinessProperties[$pos+2]
														/NetBusinessPropertyLossAmt"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 27 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode" 
														select="$Form4684Data/BusinessProperties[$pos+2]
														/NetBusinessPropertyLossAmt/@seeAttachedStatementCd"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="$Form4684Data/BusinessProperties[$pos + 2]/
													 NetBusinessPropertyLossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
											             border-color:black;border-left-width:1px;border-right-width:0px;
											                          border-top-width:0px;border-bottom-width:1px;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode"
														 select="$Form4684Data/BusinessProperties[$pos+3]
														 /NetBusinessPropertyLossAmt"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 27 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode" 
														select="$Form4684Data/BusinessProperties[$pos+3]
														/NetBusinessPropertyLossAmt/@seeAttachedStatementCd"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties[$pos + 3]
													/NetBusinessPropertyLossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</table>
								</xsl:if>
							</xsl:for-each>
						</xsl:when>
						<!-- empty table -->
						<xsl:otherwise>
							<table class="styTable" cellspacing="0" style="width:187mm;">
								<tr>
									<th scope="col">
										<span class="styTableCellPad"/>
									</th>
									<th scope="col">
										<span class="styTableCellPad"/>
									</th>
									<th class="styTableCellHeader" style="width:100mm;font-size:8pt; 
									            border-color:black;border-left-width:1px;border-right-width:0px;
									                         border-top-width:0px;border-bottom-width:1px" 
									                         colspan="4" scope="col">
			                   							 Properties
											</th>
								</tr>
								<tr>
									<th scope="col">
										<span class="styTableCellPad"/>
									</th>
									<th scope="col">
										<span class="styTableCellPad"/>
									</th>
									<td class="styTableCellSmall" style="text-align:center;
									                font-weight:bold;border-color:black;border-left-width:1px; 
									                               border-right-width:0px;border-top-width:0px; 
									        border-bottom-width:1px;">A<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="text-align:center; 
									               font-weight:bold;border-color:black;border-left-width:1px; 
									                              border-right-width:0px;border-top-width:0px;  
									              border-bottom-width:1px;">B<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="text-align: center; 
									              font-weight:bold;border-color:black;border-left-width:1px; 
									                             border-right-width:0px;border-top-width:0px; 
									        border-bottom-width:1px;">C<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="text-align: center; 
									               font-weight:bold;border-color:black;border-left-width:1px; 
									                              border-right-width:0px;border-top-width:0px;  
									    border-bottom-width:1px;">D<span class="styTableCellPad"/>
									</td>
								</tr>
								<!--  line 20  -->
										<tr>
											<td style="border:none;">
												<div>
													<span class="styGenericDiv" style="width:76mm;font-size:7pt;">
														
															<span class="styBoldText" style="float:left;padding-left:1mm">20</span>
															<span style="padding-left:2mm;float:left clear:none;">
															Cost or adjusted basis of each property</span>
															
															 
																<span class="styDotLn" style="padding-left:2mm;float:right;clear:none;">....</span>
															
														
													</span>
												</div>
											</td>
											<td class="styIRS4684TableCellSmallRB " style="width:5mm;
											             border-top-width:1px;font-weight:bold;border-color:black; 
											                         border-left-width:1px;border-right-width:0px;
											                                     border-top-width:1px;border-bottom-width:1px;text-align:center;">20</td>
											<td class="styTableCellSmall" style="border-color:black;
											             border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:left;
											                          border-bottom-width:1px">
												<xsl:choose>
													<xsl:when test="(($Print = $Separated) and (count ($Form4684Data/BusinessProperties )
													 &gt; 4))">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties "/>
															<xsl:with-param name="ShortMessage" select=" 'true' "/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span class="styTableCellPad"/>
													</xsl:otherwise>
												</xsl:choose>											                          
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
											             border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                         border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px;
											                         border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                        border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Note: We Have the best possible dotes alignment line 21-27 any changes to this alignment in on line 
                                               can effect the alignment for another one or more lines.  --> 
										<!-- line 21 -->
										<tr>
											<td style="border:none;">
												<span>
													<span class="styGenericDiv" style="width:76mm;font-size:7pt;">
														
															<span class="styBoldText"
															 style="float:left;padding-left:1mm">21</span>
													   <span style="padding-left:2mm">
													    Insurance or other reimbursement (whether or not you<br/>filed a claim). 
                                                        See the instructions for line 3 
 																		<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
																	
														</span>
													</span>
												</span>
											</td>
											<!-- line 21A -->
											<td class="styIRS4684TableCellSmallRB " 
											style="width:5mm;vertical-align:bottom; 
											                  font-weight:bold;border-left-width:1px;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;border-color:black;text-align:center;">21</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px; 
											               border-right-width:0px;border-top-width:0px;border-bottom-width:1px;  
											                             border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" 
											style="vertical-align:bottom;border-left-width:1px; 
											               border-right-width:0px;border-top-width:0px;
											               border-bottom-width:1px;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" 
											style="vertical-align:bottom;border-left-width:1px;
											                 border-right-width:0px;border-top-width:0px;border-bottom-width:1px; 
											                                  border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" 
											style="vertical-align:bottom;border-color:black; 
											             border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                          border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 22 -->
										<tr>
											<td style="border:none;font-size:7pt;">
												
													<span style="font-size:7pt;width:76mm;">
														<span  style="padding-left:7mm;padding-bottom:1mm;"><b>Note: </b>  If line 20 is <b>more</b> than line 21, skip line 22</span>
														<span class="styGenericDiv" style="width:76mm;font-size:7pt;">
														
															<span class="styBoldText" style="float:left;padding-left:1mm">22</span>
													        <span style="padding-left:2mm;width:71mm;">Gain from casualty or theft. If line 21 is 
																   <b>more</b> than line 20, enter the difference   
																	here and on line 29 or line 34, column (c), except as
																	provided in the instructions for line 33. 
																	Also, skip lines 23 through 27 for that column.  See
																	the instructions for line 4 if line 21 includes insurance or other reimbursement you did not
																	claim, or you received payment for your loss in a later tax year
																	
																	<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
																	
															</span>
														</span>
													</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm;
												          vertical-align:bottom;font-weight:bold;border-color:black;border-left-width:1px; 
												          border-right-width:0px;border-top-width:0px; border-bottom-width:1px;
												          background-color:lightgrey; text-align:center;">
													<div style="width:8mm;height:6mm;vertical-align:bottom;text-align:center;
													padding-top:2mm;">
														<span style="height:4mm;width:8mm;background-color:white;
														bordr-right-width:1px;padding-top:1mm;">
															<b>22</b>
														</span>
													</div>
												</td>
											<td class="styTableCellSmall" style="vertical-align:bottom; border-left-width:1px;
											border-right-width:0px;border-top-width:0px;border-bottom-width:1px;border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom; border-left-width:1px;
											border-right-width:0px;border-top-width:0px; border-bottom-width:1px;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;  
											           border-left-width:1px;border-right-width:0px;border-top-width:0px;
											                        border-bottom-width:1px;border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom; 
											            border-color:black;border-left-width:1px;border-right-width:0px; 
                                                     border-top-width:0px;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 23 -->
										<tr>
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:76mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">23</span>
															<span style="float:left;padding-left:2mm;">Fair market value <b> before </b> casualty or theft 
																</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
															<span class="styDotLn">...</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm;
											             font-weight:bold;border-left-width:1px;text-align:center; 
								                         border-right-width:0px;border-top-width:0px;  
								                                    border-bottom-width:1px;border-color:black;">23</td>
											<td class="styTableCellSmall" style="border-color:black;  
											           border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                       border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                        border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
											             border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                         border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px;  
											                       border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 24 -->
										<tr>
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:76mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">24</span>
															<span style="float:left;padding-left:2mm;">
													 Fair market value <b> after </b> casualty or theft																
																</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">....</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
											            font-weight:bold;border-left-width:1px;text-align:center; 
											            border-right-width:0px;border-top-width:0px;
											            border-bottom-width:1px;border-color:black;">24</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                        border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
											             border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                         border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;  
											           border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                       border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                        border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 25  -->
										<tr>
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:76mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">25</span>
															<span style="float:left;padding-left:2mm;">
													 Subtract line 24 from line 23															
																</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">.......</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm;text-align:center;  
											           font-weight:bold;border-left-width:1px;border-right-width:0px; 
											                       border-top-width:0px;border-bottom-width:1px;border-color:black;">25</td>
											<td class="styTableCellSmall" style="border-color:black;  
											           border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                       border-bottom-width:1px;">

												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;  
											           border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                       border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
											             border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                         border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px;  
											                       border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!--  Line 26 -->
										<tr>
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:76mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">26</span>
															<span style="float:left;padding-left:2mm;">
														 Enter the <b> smaller </b> of line 20 or line 25														
																</span>
															<span class="styBoldText" style="float:right;">
	                                                           <span class="styDotLn">.....</span>
	                                                      </span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
											            font-weight:bold;text-align:center;border-color:black; 
											                        border-left-width:1px;border-right-width:0px; 
											                                    border-top-width:0px;border-bottom-width:1px;">26</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px;
											                         border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px;
											                         border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;  
											           border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                       border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;  
											           border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                       border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 27 -->
										<!--start here ii-->
										<tr>
											<td style="border:none;font-size:7pt;">
												
													<span  style="font-size:7pt;padding-top:1mm;padding-left:7mm;">
														<b>Note: </b>  If the property was totally destroyed by 
																casualty or lost from theft, enter on line 26 the 
												                amount from line 20.
												    </span>
													<span>
														<span class="styGenericDiv" style="width:76mm;font-size:7pt;padding-top:1mm;">
															<span>
																<span  style="float:left;padding-left:1mm"><b>27</b>
																	 &#160;Subtract line 21 from line 26. If zero or less, enter -0- 
																</span>
															</span>
														</span>
													
												</span>
												<td class="styIRS4684TableCellSmallRB" style="width:5mm;
												          vertical-align:bottom;font-weight:bold;border-color:black;border-left-width:1px;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;background-color:lightgrey;text-align:center;">
													<div style=";width:8mm;height:6mm;vertical-align:bottom;text-align:center;padding-top:2mm;">
														<span style="height:4mm;width:8mm;background-color:white;bordr-right-width:1px;padding-top:1mm">
															<b>27</b>
														</span>
													</div>
												</td>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
											            border-color:black;border-left-width:1px;border-right-width:0px;  
											            border-top-width:0px;border-bottom-width:1px;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" 
														select="NetBusinessPropertyLossAmt"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 27 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode" 
														select="NetBusinessPropertyLossAmt/@seeAttachedStatementCd"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="NetBusinessPropertyLossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;  
											                       border-right-width:0px;border-top-width:0px; 
											                                   border-bottom-width:1px;border-color:black;">
												<div style="text-align:left;padding-bottom:1mm;">
													<!-- Adding pen image -->
												</div>
												<!-- End adding pen image -->
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
											             border-left-width:1px;border-right-width:0px;border-top-width:0px;
											                          border-bottom-width:1px;border-color:black;">
												<div style="text-align:left;padding-bottom:1mm;">
												</div>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
											             border-color:black;border-left-width:1px;border-right-width:0px;
											                          border-top-width:0px;border-bottom-width:1px;">
												<div style="text-align:left;padding-bottom:1mm;">
												</div>
												<span class="styTableCellPad"/>
											</td>
										</tr>
							</table>
					</xsl:otherwise>
					</xsl:choose>
					<!-- End of Section B properties table -->
					<!-- line 28 A-->
					<div class="styBB" style="width:187;float:none;clear:both;">
						<div class="styBB" style="width:187mm;border-bottom:none; float:left">
							<div class="styLNLeftNumBox" style="height:4mm;width:149.5mm;height:4mm;padding-right:mm">28&#160;
						                      <span  style="font-weight:normal">
									 Casualty or theft loss. Add the amounts on line 27. Enter the total here 
                                           and on line 29 <b>or</b> line 34  (see instructions)</span>
					</div>
							<div class="styLNRightNumBoxNBB">28</div>
							<div class="styLNAmountBoxNBB" style="width:29mm;border-top-width:0px">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
									 select="$Form4684Data/TotalBusPropertyTheftLossAmt"/>
								</xsl:call-template>
							</div>
						</div></div>
					<!-- Place holder for the toggle button -->
					<div style="height:7mm">
						<table class="styTable" cellspacing="0">
								<tr>
									<th  style="width:89mm;" scope="col" colspan="1">
										<div class="styPartName" style="height:4mm">Part II</div>
										<span  style="height:4mm;width:76mm;padding-left:1mm;
										 font-size: 7pt;">
							                 Summary of Gains and Losses <span class="styNormalText">
							                 (from separate Parts I)</span>
										</span>
									</th>
									<th style="height:4mm;width:64mm;font-weight:normal;border-style:solid;border-color:black;border-width:0px 0px 0px 1px;"
									 colspan="2" scope="col">
										<span style="font-weight:bold;">
						                 (b) 
						               </span> Losses from casualties or thefts
						             </th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;border-bottom-width:1px;
									vertical-align:middle;border-right-width:0px;border-top-width:0px;height:14mm"
									 rowspan="2" scope="col">
										<span style="font-weight:bold;">
							                 (c)
							               </span> Gains from casualties or thefts includible in income
							             </th>
								</tr>
								<tr >
									<th class="styDepTblCell" style="width:90mm;vertical-align:middle;
									border-left-width:0px;border-right-width:0px;border-bottom-width:1px" 
									scope="col" colspan="1">
										<span class="styGenericDiv" style="width:90mm;padding-left:2mm; 
										          text-align:center;font-weight:normal">
											<span class="styBoldText">(a)</span> Identify casualty or theft
               							</span>
									</th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;
									border-left-width:1px;border-bottom-width:1px" 
									scope="col">
										<span class="styItalicText">(i) </span>Trade, business, rental or
										 royalty property
             							</th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;border-bottom-width:1px;
									border-left-width:0px;border-right-width:0px" 
									scope="col">
										<span class="styItalicText">(ii) </span> Income-producing property
             						</th>
								</tr>
							</table>
					</div><br/><br/><br/>
					<div  style="width:187mm;clear:both;float:none;height:5mm">
						<div class="styPartDesc" style="height:5mm;font-size:8pt; text-align:center;
						width:180mm;padding-top:1.5mm;">
							<b>Casualty or Theft of Property Held One Year or Less</b>
						</div>
						<div class="styPartDesc" style="font-weight: normal; font-size:8pt
						; width:7mm;padding-left: 0px;">
							<xsl:if test="(count($Form4684Data/ShortTermTheftProperty)
							 &gt; 2) and ($Print !=        $Separated)">
								<span class="styGenericDiv" style="float:right;clear:none;">
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" 
										select="$Form4684Data/ShortTermTheftProperty"/>
										<xsl:with-param name="containerHeight" select="2"/>
										<xsl:with-param name="headerHeight" select="0"/>
										<xsl:with-param name="containerID" select=" 'STctn' "/>
									</xsl:call-template>
								</span>
							</xsl:if>
						</div>
					</div>
					<div class="styIRS4684TableContainer" style="height:8mm;"  id="STctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or  
								      ( ($Print = $Separated) and (count($Form4684Data/ShortTermTheftProperty) 
								      &lt; 3) )">
									<xsl:for-each select="$Form4684Data/ShortTermTheftProperty">
										<tr style="height:4mm;">
											<!-- Line 29 -->
											<td class="styTableCell" style="width:8mm;text-align:left;border-bottom-width:0px;
											border-right-width:0px;border-top-width:0px">
												<xsl:choose>
													<xsl:when test="position()=1">
														<xsl:attribute name="style">width:8mm;
													text-align:left;border-right-width:0px;border-bottom-width:0px;
													font-weight:bold;font-size:7pt;padding-left:1mm;
													border-color:black;
													</xsl:attribute>29
	                    							</xsl:when>
													<xsl:otherwise>
														<span class="styTableCellPad" />
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="width:80.5mm;text-align:left; 
											              border-color:black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CasualtyOrTheftDesc"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;border-bottom-width:1px;
											           border-color:black">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="TradeOrRentalPropertyAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;  
											            border-bottom-width:1px;border-color:black">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" 
													select="IncomeProducingPropertyAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" 
											style="width:30mm;border-bottom-width:1px;
											           border-color:black;border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainsFromCasualtiesOrTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:if test="count($Form4684Data/LongTermTheftProperty) &lt; 1">
										<tr style="height:4mm">
											<td class="styTableCell" style="width:8mm;text-align:left;height:4mm;
											 border-right-width:0px;border-bottom-width:0px;font-weight:bold; 
											 font-size:7pt;padding-left:1mm;border-top-width:1px">29<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:80.5mm;
											border-top-width:0px;border-bottom-width:0px;border-top-width:1px;
											             border-left-width:0px;border-right-width:1px;border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" 
											style="width:32mm;border-top-width:0px;border-bottom-width:0px;
											             border-left-width:0px;border-right-width:1px;border-color:black;border-top-width:1px">
              								  (<span style="width:16px;"/>)<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" 
											style="width:32mm;border-top-width:0px;border-bottom-width:0px;;border-top-width:1px;
											             border-left-width:0px;border-right-width:1px;border-color:black">
                                              (<span style="width:16px;"/>)<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:34mm;border-right-width:0px;;border-top-width:1px;
											border-bottom-width:0px">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form4684Data/LongTermTheftProperty) &lt; 2">
										<tr style="height:4mm; ">
											<td class="styTableCell" style="width:8mm;text-align:left;height:4mm;
											            border-right-width:0px;border-bottom-width:0px;font-weight:bold;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:80.5mm;border-top-width:1px; 
											            border-left-width:0px;border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;border-top-width:1px;
											            border-color:black">
                                            (<span style="width:16px;"/>)<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm; 
											           border-top-width:1px;border-color:black">
                                           (<span style="width:16px;"/>)<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:34mm;border-top-width:1px; 
											           border-right-width:0px;border-color:black">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
								<!-- "See Additional Table" and print empty row.-->
								<xsl:if test="($Print = $Separated) and (count($Form4684Data/
								ShortTermTheftProperty) &gt; 2)">
									<tr style="height:4mm;">
										<td class="styTableCell" style="width:8mm;border-right-width:0px;
										         border-bottom-width:0px;text-align:left;border-top-width: 1px;
										                  font-weight:bold; font-size:7pt;padding-left:1mm">29
										  </td>
										<td class="styTableCell" style="width:80.5mm;border-top-width: 1px;  
										         text-align:left;border-color:black;height:5mm">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form4684Data/
												ShortTermTheftProperty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:32mm;border-top-width: 1px; 
										          border-bottom-width: 1px;border-color:black;">
										</td>
										<td class="styTableCell" style="width:32mm;border-top-width: 1px; 
										          border-bottom-width: 1px;border-color:black;">
										</td>
										<td class="styTableCell" style="width:34mm;border-right-width:0px; 
										          border-top-width: 1px;border-bottom-width: 1px;border-color:black;">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr style="height:4mm;">
										<td class="styTableCell" style="width:8mm;border-right-width:0px; 
										         border-bottom-width:0px;text-align:left;border-top-width: 0px; 
										                  font-weight:bold; font-size:7pt;padding-left:1mm"/>
										<td class="styTableCell" style="width:80.5mm;border-top-width: 0px; 
										          border-bottom-width: 1px;border-color:black;">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-top-width: 0px; 
										          border-bottom-width: 1px;border-color:black;">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-top-width: 0px;  
										         border-bottom-width:1px;border-color:black;">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:34mm;border-top-width: 0px;  
										         border-bottom-width: 1px;border-right-width:0px;border-color:black;">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" 
							select="$Form4684Data/ShortTermTheftProperty"/>
							<xsl:with-param name="containerHeight" select="2"/>
							<xsl:with-param name="headerHeight" select="0"/>
							<xsl:with-param name="containerID" select=" 'STctn' "/>
						</xsl:call-template>
					</div>
					<!-- Line 30 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">30</div>
						<div class="styLNDesc" style="width:72mm;height:4mm;border-style: solid; border-color: black;border-top-width:1px; 
																		border-bottom-width:0px;border-left-width: 0px; border-right-width: 0px;">
							<span>
								<span style="float:left;">
					            Totals. Add the amounts on line 29
					            </span>
								<span class="styBoldText" style="float:right;padding-right:1mm;">
									<span class="styDotLn">......</span>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-top-width:1px;">30</div>
						<div class="styLNAmountBox" style="width:32.5mm;font-size: 6pt;height:4.5mm;border-top-width:1px;border-right-width:1px;
																				border-left-width:1px;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode"
								 select="$Form4684Data/TotShortTermTradeOrBusinessAmt"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						</div>
						<div class="styLNAmountBox" style="width:32mm;font-size: 6pt;height:4.5mm;border-top-width:1px;border-right-width:1px;
																				border-left-width:0px;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" 
								select="$Form4684Data/ShortTermPropIncomeProdTotAmt"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						</div>
						<div class="styLNAmountBox"
						 style="width:34mm;font-size: 6pt;height:4.5mm;border-top-width:1px;border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form4684Data/ShortTermTotalGainsTheftAmt"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						</div>
					</div>
					<!-- Line 31  -->
					<div class="styBB" style="width:187mm;">
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">31</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
					            Combine line 30, columns (b)(i) and (c).  Enter the net gain or (loss) here and on Form 4797, line 14. If
								Form 4797 is not otherwise required, see instructions
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">...............</span>
										<span class="styFixedUnderline" 
										style="border-left-width:0px;width:12mm;height:4mm;text-align:center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/ShortTermPropNetGainOrLossGrp/PassiveActivityLossLiteralCd"/>
											</xsl:call-template>
										</span>
									</span>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;padding-top:5mm;">31</div>
							<div class="styLNAmountBox" style="height:9mm;padding-top:5mm;width:32mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$Form4684Data/ShortTermPropNetGainOrLossGrp/
									ShortTermPropNetGainOrLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 32 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">32</div>
							<div class="styLNDesc" style="width:139mm;height:14.3mm">
					            Enter the amount from line 30, column (b)(ii) here. Individuals, enter the amount from  income-producing 
					            property on Schedule A (Form 1040 or 1040-SR), line 16, or Form 1040-NR, Schedule A, line 7.  (Do not include any
					            loss on property used as an employee.) Estates and trusts, partnerships, and S corporations, see instructions 
					              <!--Dotted Line-->
								<!--<span class="styDotLn" style="float:none;clear:none;padding-right:2mm;">................</span>-->
									<span class="styFixedUnderline" style="border-left-width:0px;width:10mm;
									text-align:center;float:none;clear:none;"><b>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											select="$Form4684Data/ShortTermPropertyIncTotalGrp/
											PassiveActivityLossLiteralCd"/>
										</xsl:call-template></b>
									</span>
								</div>
							<div class="styLNRightNumBox" style="height:14.3mm;padding-top:10mm;  
							      background-color:lightgrey;padding-bottom:0mm;border-bottom-width:0px;">
								<span style="background-color:white;width:100%;height:4.3mm;
								padding-top:1mm">32</span>
							</div>
							<div class="styLNAmountBox" style="height:14.3mm;padding-top:11mm;
							width:32mm;border-bottom-width:0px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$Form4684Data/ShortTermPropertyIncTotalGrp/
									ShortTermPropIncomeProdTotAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Theft property of more than one year -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartDesc" 
						style="float:left;clear:none;text-align:center;width:179mm;height:4mm">
						     Casualty or Theft of Property Held More Than One Year
						     </div>
						<div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
						</div>
					</div>
					<!-- Line 33 -->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">33</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span>
								<span style="float:left;">
					         Casualty or theft gains from Form 4797, line 32</span>
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span class="styDotLn" style="float:right;padding-right:2mm;">..................</span>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="padding-top:1.5mm;
						border-bottom-width:1px;height:4.8mm">33</div>
						<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;
						height:4.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form4684Data/CasualtyOrTheftGainFrom4797Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styPartDesc" 
						style="float:right;clear:none;text-align:right;width:179mm;height:4mm">
						<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form4684Data/
								LongTermTheftProperty"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="headerHeight" select="0"/>
								<xsl:with-param name="containerID" select=" 'LTctn' "/>
							</xsl:call-template>
						     </div>
						<div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
						</div>
					</div>
					<!-- place holder for the second table -->
					<div class="styTableContainer"  style="height:15mm;"  id="LTctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<!-- Line 34-->
								<!--  The top of some fields in the first occurance of this table has a thik top line this is not fixable now
                                        If we remove the extra lines the rest of the fields will not have lines between them ( border-top-width:1px;
                                         should stay 1 not 0 ) -->
								<xsl:if test="($Print != $Separated) or ( ($Print = $Separated) and
								 (count($Form4684Data/LongTermTheftProperty) &lt; 3) )">
									<xsl:for-each select="$Form4684Data/LongTermTheftProperty">
										<tr>
											<td class="styTableCell" style="width:8mm;text-align:left;height:4mm;
											border-right-width:0px;border-bottom-width:0px;border-color:black;">
												<xsl:if test="position()=1">
													<span style="text-align:left;font-weight:bold;border-right-width:0px;
													border-bottom-width:0px;font-size:7pt;padding-left:1mm">34</span>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:4mm;width:80.5mm;text-align:left;
											border-bottom-width:1px;border-color:black">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CasualtyOrTheftDesc"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:4mm;width:32mm;border-bottom-width:1px;border-color:black">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" 
													select="TradeOrRentalPropertyAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;height:4mm;
											 border-right-width: 1px;border-bottom-width:1px;border-color:black;">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode"
													 select="IncomeProducingPropertyAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;height:4mm;
											border-color:black;border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="GainsFromCasualtiesOrTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:if test="count($Form4684Data/LongTermTheftProperty) &lt; 1">
										<tr style="height:5mm;">
											<td class="styTableCell"
											style="width:8mm;text-align:left;height:4mm;border-right-width:0px;
											border-bottom-width:0px;font-weight:bold; font-size:7pt;padding-left:1mm;">34
											<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:4mm;width:80.5mm;border-top-width:0px;
											border-bottom-width:0px;border-left-width:0px;border-right-width:1px;
											border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:4mm;width:32mm;border-top-width:0px;
											border-bottom-width:0px;border-left-width:0px;
											border-right-width:1px;border-color:black">
              								  (<span style="width:16px;"/>)<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:4mm;width:32mm;
											border-top-width:0px;border-bottom-width:0px;  
											           border-left-width:0px;border-right-width:1px;border-color:black">
                                              (<span style="width:16px;"/>)<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:4mm;width:34mm;
											border-right-width:0px;border-bottom-width:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form4684Data/LongTermTheftProperty) &lt; 2">
										<tr style="height:5mm;">
											<td class="styTableCell" 
											style="width:8mm;text-align:left;height:4mm;border-right-width:0px;
											border-bottom-width:0px;font-weight:bold;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" 
											style="height:4mm;width:80.5mm;border-top-width:1px;border-left-width:0px;
											border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell"
											 style="height:4mm;width:32mm;border-top-width:1px;border-color:black">
                                            (<span style="width:16px;"/>)<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" 
											style="height:4mm;width:32mm;border-top-width:1px;border-color:black">
                                           (<span style="width:16px;"/>)<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:4mm;width:34mm;border-top-width:1px;
											border-right-width:0px;border-color:black;
											">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
								<!-- If Optional Print feature is ON and there are more than 2 sets of repeating data,
								 print comment -->
								<!-- "See Additional Table" and print empty rows.-->
								<xsl:if test="($Print = $Separated) and (count($Form4684Data/
								LongTermTheftProperty) &gt; 2)">
									<tr style="height:5mm;">
										<td class="styTableCell" style="width:8mm;text-align:left;height:4mm;
										border-left-width:0px;border-right-width:0px;border-bottom-width:0px;
										font-weight:bold;font-size:7pt;padding-left:1mm">34<span 
										class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="height:4mm;width:80.5mm;text-align:left;
										border-right-width:1px;border-bottom-width:1px;border-left-width:0px; 
										          border-top-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/LongTermTheftProperty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="height:4mm;width:32mm;border-right-width:1px;
										border-bottom-width:1px;border-left-width:0px;
										border-top-width:1px;border-color:black">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="height:4mm;width:32mm;border-right-width:1px;
										border-bottom-width:1px;border-left-width:0px;border-top-width:1px;
										border-color:black;">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="height:4mm;width:34mm;border-right-width:0px;
										border-bottom-width:1px;border-left-width:0px;border-top-width:0px;
										border-color:black;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr style="height:5mm;">
										<td class="styTableCell" 
										style="width:8mm;text-align:left;height:4mm;border-right-width:0px;
										border-bottom-width:0px;font-weight:bold;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" 
										style="height:4mm;width:80.5mm;border-right-width:1px;border-bottom-width:1px;
										font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="height:4mmwidth:32mm;border-right-width:1px; 
										          border-bottom-width:1px;font-weight:bold;border-color:black;">
											<span style="width:16px;border-left-width:0px;
											border-bottom-width:1px;border-color:black;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="height:4mmwidth:32mm;border-left-width:0px;
										           border-bottom-width:1px;border-color:black;">
											<span style="width:16px;border-left-width:1px;border-color:black;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:34mm;height:4mm;border-left-width:0px;
										border-right-width:0px;border-bottom-width:1px;border-color:black">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form4684Data/LongTermTheftProperty"/>
						<xsl:with-param name="containerHeight" select="2"/>
						<xsl:with-param name="headerHeight" select="0"/>
						<xsl:with-param name="containerID" select=" 'LTctn' "/>
					</xsl:call-template>
					<!-- end place holder -->
					<!-- END Line 34 -->
					<!-- Line 35 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">35</div>
						<div class="styLNDesc" style="width:72mm;height:4mm;font-size: 6pt;">
					          Total losses. Add amounts on line 34, columns (b)(i) and (b)(ii)
					          <span class="styBoldText"/>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">35</div>
						<div class="styLNAmountBox" style="width:32.5mm;font-size: 6pt;height:4mm;border-right-width:1px;border-left-width:1px;border-top-width:0px; 
						          border-color:black">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" 
								select="$Form4684Data/LongTermTradeOrBusinessTotAmt"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						</div>
						<div class="styLNAmountBox" style="width:32mm;font-size: 6pt;height:4mm;border-right-width:1px;border-left-width:0px;border-top-width:0px;  
						      border-color:black;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" 
								select="$Form4684Data/LongTermPropIncomeProdTotAmt"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						</div>
						<div class="styLNAmountBox" style="width:34mm;background-color:lightgrey;border-left-width:0px;border-top-width:0px;
						    height:4mm;border-color:black"/>
					</div>
					<!-- line 36-->
					<div class="styBB" style="width:187;">
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">36</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span>
									<span style="float:left;">
						            Total gains. Add lines 33 and 34, column (c)
                                  </span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">..................</span>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="">36</div>
							<div class="styLNAmountBox" style="">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$Form4684Data/LongTermTotalGainsTheftAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 37 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">37</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span>
									<span style="float:left;">
						            Add amounts on line 35, columns (b)(i) and (b)(ii)  
                                  </span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">..................</span>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="">37</div>
							<div class="styLNAmountBox" style="">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$Form4684Data/LongTermPropertyTotalLossesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 38 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">38</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
					            If the loss on line 37 is 
					            <span class="styBoldText">more</span> than the gain on line 36:  
					            <span class="styBoldText"/>
							</div>
							<div class="styLNRightNumBoxNBB" 
							style="background-color:lightgrey;height:4mm;">
								<span style="width:4px;"/>
							</div>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" 
							style="height:4mm;padding-left:4mm">a
					        </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;padding-bottom:0px">
					            Combine line 35, column (b)(i) and line 36, and enter the net gain or (loss) here. 
					            Partnerships and S corporations, see the <b>Note</b> below. All others, enter this amount on 
					            <!--<span>
									<span style="float:left;">-->
					            Form 4797, line 14. If Form 4797
					             is not otherwise required, see instructions
                                <!--</span>-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">....................</span>
										<span class="styLNAmountBox" 
										style="border-left-width:0px;width:10mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/LongTermPropNetGainOrLossGrp/PassiveActivityLossLiteralCd"/>
											</xsl:call-template>
										</span>
									</span>
								<!--</span>-->
							</div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:6mm;  
							      background-color:lightgrey;padding-bottom:0mm;">
								<span style="background-color:white;width:100%;height:4.5mm;
								padding-top:1.5mm">38a</span>
							</div>
								<div class="styLNAmountBox" style="height:11mm;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$Form4684Data/LongTermPropNetGainOrLossGrp/
									LongTermPropNetGainOrLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 38b -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:13.5mm;padding-left:4mm;padding-bottom:2mm">b</div>
							<div class="styLNDesc" style="width:139mm;height:13.5mm;">
								Enter the amount from line 35, column (b)(ii) here. Individuals, enter the amount from income-producing
								property on Schedule A (Form 1040 or 1040-SR), line 16, or Form 1040-NR, Schedule A, line 7.  (Do not include any loss on 
								property used as an employee.) Estates and trusts, enter on the "Other deductions" line of your tax return. 
								Partnerships and S corporations, see the <b>Note</b> below
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span class="styDotLn">..........</span>
									<!--	<b>-->
											<span class="styFixedUnderline"  style="width:8mm;text-align:center;float:none;clear:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/LongTermPropertyIncomeTotalGrp/PassiveActivityLossLiteralCd"/>
												</xsl:call-template>
											</span>
									<!--	</b>-->
								</span>			
							</div>
							<div class="styLNRightNumBox" style="height:13.5mm;padding-top:9mm;  
							      background-color:lightgrey;">
								<span style="background-color:white;width:100%;height:4mm;
								padding-top:1mm">38b</span>
							</div>
							<div class="styLNAmountBox" style="height:13.5mm;padding-top:10mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
									 select="$Form4684Data/LongTermPropertyIncomeTotalGrp/
									 LongTermPropIncomeProdTotAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 39 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">39</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
						          If the loss on line 37 is <b>less</b> than or 
						          <b>equal</b> to the gain on line 36,
						           combine lines 36 and 37 and enter here. Partnerships  
						            see the <b>Note</b> below. All others, enter this amount on Form 4797, line 3   
 									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">.....</span>
										<span class="styLNAmountBox" 
										style="border-left-width:0px;width:10mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/LongTermPropIncomePlusGainGrp/
												PassiveActivityLossLiteralCd"/>
											</xsl:call-template>
										</span>
									</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4.5mm;">39</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/
									LongTermPropIncomePlusGainGrp/LongTermPropIncomePlusGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styBB" style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm;"/>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span class="styBoldText" style="vertical-align: top;">Note:</span>
								<span style="width: 130mm; padding-left: 1mm;">
									<span >
						                Partnerships, enter the amount from line 38a, 38b, or line 39 on Form 1065,
						                 Schedule K, line 11. <br/>
						                S corporations, enter the amount from line 38a or 38b on Form 1120-S, 
						                Schedule K, line 10.
						              </span>
								</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:7mm;padding-top:4mm; 
							       border-right-width:0px;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:7mm;padding-top:4mm;border-bottom-width:0mm;
							        border-left-width:0px;background-color:lightgrey;"/>
						</div>
					</div>
					<!--footer -->
					<div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">4684
						</span> (2019)</div>
					</div>
					<p style="page-break-before:always"/>
					<!-- header page 3 -->
					<div class="styTBB" style="width:187mm;clear:both;padding-bottom:.5mm;">
						<div class="styGenericDiv" style="width:75mm;" >Form 4684 (2019)</div>
						<div class="styGenericDiv" style="width:55mm;text-align:left; padding-left: 3mm;" >
						Attachment Sequence No. <span class="styBoldText">26</span>
						</div>
						<div class="styGenericDiv" style="float:right;" >Page <span
						 class="styBoldText" style="font-size:8pt;">3
						</span>
						</div>
					</div>
					<!--  START here IV   -->
					<!-- Taxpayer Name and number section -->
					<div class="styTBB" style="width:187mm;clear:both;float:none;">
						<div class="styNameBox" style="width:156mm;height:8mm;">
				                    Name(s) shown on tax return
				            <br/>
				             <xsl:choose>
							<!-- Name from 1120/990/1065 Return Header -->
							<xsl:when test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode"
								   select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" 
								  select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:when>
							<!-- Name from 1040 Return Header -->
							<xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt"><br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								</xsl:call-template>
							</xsl:when>
							<!-- Name from 1041 Return Header -->
							<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" 
								  select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" 
								  select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
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
						<div class="styEINBox" style="width:31mm;height:4mm;padding-left:2mm;">Identifying number<br/>
							<br/>
							<span style="width:38mm;text-align:left;font-weight:normal;">
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
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;float:none;height:8mm">
						<div class="styIRS4684ScheduleName" style="width:187mm;
						font-size:8pt;text-align:left;">
				                SECTION C &#8212; Theft Loss Deduction for Ponzi-Type
				                 Investment Scheme Using the Procedures in Revenue
				                Procedure 2009-20
				                <span class="styNormalText"> (Complete this section 
				                in lieu of Appendix A in Revenue Procedure 2009-20. See instructions.)
				                  </span>
						</div>
					</div>
			<div style="width:187mm;display:block;">		
				<xsl:if test="(count($Form4684Data/RevenueProcedure200920Grp) &lt; 1)">					
					<div class="styBB" style="width:187mm;clear:both;float:none;">
						<!-- Added clear:both attribute -->
						<div class="styPartName" style="background-color:black;width:12mm;">Part I</div>
						<div class="styPartDesc" style="width:168mm;">Computation of Deduction
						</div>
					</div>
						<!-- Part II line 40 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">40</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Initial investment</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">40</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="InitialInvestmentAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px; 
								border-right-width:0px;background-color:lightgrey;"/>
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px; 
								border-left-width:0px;;background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part II line 41 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">41</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Subsequent investments (see instructions)</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">41 </div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="SubsequentInvestmentsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px; 
								border-right-width:0px;background-color:lightgrey;"/>
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;
								 border-left-width:0px;;background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part III line 42 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">42</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Income reported on your tax returns
									 for tax years prior to the discovery</span>
									<span style="float:left"> year (see instructions)</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:7.5mm;
								padding-top:3.5mm;">42</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;
								height:7.5mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="IncmRptOnTxRtnTYPrDiscvYrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" 
								style="height:7.5mm;border-bottom-width:0px; border-right-width:0px;
								background-color:lightgrey;"/>
								<div class="styLNAmountBox" 
								style="height:7.5mm;border-bottom-width:0px; border-left-width:0px
								;background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part III line 43 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">43</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Add lines 40, 41, and 42</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">43</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="TotInitialSubsqInvstAndIncmAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox"
								 style="height:4.5mm;border-bottom-width:0px; border-right-width:0px;
								 background-color:lightgrey;"/>
								<div class="styLNAmountBox" 
								style="height:4.5mm;border-bottom-width:0px; border-left-width:0px;
								background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part III line 44 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">44</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Withdrawals for all years (see instructions)</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">44</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="TotalWithdrawalsForAllYearsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;
								 border-right-width:0px;background-color:lightgrey;"/>
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;
								 border-left-width:0px;;background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part III line 45 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">45</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Subtract line 44 from line 43.
									 This is your total qualified investment</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">45</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalQlfyInvstAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;
								 border-right-width:0px;background-color:lightgrey;"/>
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px; 
								border-left-width:0px;;background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part III line 46 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">46</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Enter 0.95 (95%) if you have no 
									potential third-party recovery. Enter 0.75 </span>
									<span style="float:left">(75%) if you have potential 
									third-party recovery</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" 
								style="height:7mm;padding-top:3mm;">46</div>
								<div class="styLNAmountBox" 
								style="border-bottom-width:1px;height:7mm;padding-top:3mm;">.
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" 
										select="ActlOrPotentialClaimsRcvryPct"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" 
								style="height:7mm;border-bottom-width:1px; border-right-width:0px;
								background-color:lightgrey;"/>
								<div class="styLNAmountBox" 
								style="height:7mm;border-bottom-width:1px; border-left-width:0px;
								background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part III line 47 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">47</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Multiply line 46 by line 45</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.8mm;">47</div>
								<div class="styLNAmountBox"
								 style="border-bottom-width:1px;height:4.8mm;background-color:lightgrey;">
							</div>
								<div class="styLNRightNumBox" 
								style="border-bottom-width:1px;height:4.8mm;">
							</div>
								<div class="styLNAmountBox" 
								style="height:4.8mm;border-bottom-width:1px;border-left-width:0px; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="RcvryPctTimesTotalQlfyInvstAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Part III line 48 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">48</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Actual recovery</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">48</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="ActualRecoveryAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" 
								style="height:4.5mm;border-bottom-width:0px; 
								border-right-width:0px;background-color:lightgrey;"/>
								<div class="styLNAmountBox" 
								style="height:4.5mm;border-bottom-width:0px; border-left-width:0px;
								background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part III line 49 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">49</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									Potential insurance/Securities Investor Protection Corporation (SIPC) recovery
									<!--Dotted Line-->
									<!--<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>-->
     							</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" 
								style="height:4mm">49</div>
								<div class="styLNAmountBox"
								 style="border-bottom-width:1px;height:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="InsuranceSIPCRecoveryAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox"
								 style="height:4mm;border-bottom-width:0px; border-right-width:0px;
								 background-color:lightgrey;"/>
								<div class="styLNAmountBox" 
								style="height:4mm;border-bottom-width:0px; border-left-width:0px;
								background-color:lightgrey">
							</div>
							</div>
						</div><!--<span style="height:1mm"/>-->
						<!-- Part III line 50 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4.8mm;">50</div>
								<div class="styLNDesc" style="height:4.8mm;width:99mm;">
									<span style="float:left">Add lines 48 and 49. This is your total recovery</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.8mm;">50</div>
								<div class="styLNAmountBox" 
								style="border-bottom-width:1px;background-color:lightgrey;height:4.8mm;">
							</div>
								<div class="styLNRightNumBox" 
								style="border-top-width:1px;border-bottom-width:1px;;height:4.8mm">
							</div>
								<div class="styLNAmountBox" 
								style="border-top-width:1px;border-bottom-width:1px; 
							border-left-width:0px;;height:4.8mm ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalRecoveryAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Part III line 51 -->
						<div class="styBB" style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">51</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									Subtract line 50 from line 47.  This is your deductible theft loss. Include this amount on
                                     line 28 of Section B, Part I. Do not complete lines 19-27 for this loss. Then complete Section B, Part II.
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" 
								style="height:11mm;padding-top:7mm;border-bottom-width:0px;">51</div>
								<div class="styLNAmountBox" 
								style="border-bottom-width:0px;height:11mm;background-color:lightgrey;">
								</div>
								<div class="styLNRightNumBox" style="border-bottom-width:0px;height:11mm;">
							</div>
								<div class="styLNAmountBox"
								 style="height:11mm;border-bottom-width:0px; border-left-width:0px;
								 padding-top:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TheftLossDeductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styBB" style="width:187mm;clear:both;float:none;">
							<!-- Added clear:both attribute -->
							<div class="styPartName" style="background-color:black;width:12mm;">Part II</div>
							<span style="width:2mm"/>
							<div  style="width:168mm;font-size:8pt"><b>Required Statements and Declarations</b>
							 (See instructions.)</div>
						</div>
						<!--<div style="width:10mm;height:4mm;"/>-->
						<div class="styBB" style="width:187mm;clear:both;float:none;">
							<div style="width:187mm">
							<img src="{$ImagePath}/8827_Bullet_Round.gif" width="4" height="4" alt="Bullet Image"/>
								I am claiming a theft loss deduction pursuant to Revenue Procedure 2009-20 from a specified fraudulent 
					      arrangement conducted by the following <br/><span style="width:2mm;"/>individual or entity.</div>
							<div style="width:187mm;padding-top:1mm;">
								<div class="styLNLeftNumBox" style="width:2mm;"/>
								<div class="styLNDesc" style="width:36mm;">Name of individual or entity</div>
								<div class="styFixedUnderline" style="height:4mm;width:149mm;"/>
							</div>
							<div style="width:187mm;padding-top:1mm;">
								<div class="styLNLeftNumBox" style="width:2mm;"/>
								<div class="styLNDesc" style="width:55mm;">
									Taxpayer identification number (if known)
								</div>
								<div class="styFixedUnderline" style="height:4mm;width:130mm;"/>
							</div>
							<div style="width:187mm;padding-top:1mm;">
								<div class="styLNLeftNumBox" style="width:2mm;"/>
								<div class="styLNDesc" style="width:12mm;">Address</div>
								<div class="styFixedUnderline" style="height:4mm;width:173mm;"/>
							</div>
							<div style="width:187mm;padding-top:1mm;">
								   <img src="{$ImagePath}/8827_Bullet_Round.gif" 
								   width="4" height="4" alt="Bullet Image"/>
								I have written documentation to support the amounts reported in Part I of this Section C.
							</div>
							<div style="width:187mm;padding-top:1mm;">
										   <img src="{$ImagePath}/8827_Bullet_Round.gif" width="4" height="4" alt="Bullet Image"/>
								I am a qualified investor as defined in section 4.03 of Revenue Procedure 2009-20.
							</div>
								<div style="width:187mm;padding-top:1mm;">
										   <img src="{$ImagePath}/8827_Bullet_Round.gif" width="4" height="4" alt="Bullet Image"/>
								If I have determined the amount of my theft loss deduction using 0.95 on line 46 above, I declare that I have not pursued and do not
							 intend to <br/><span style="width:2mm"/>pursue any potential third-party recovery,
								 as that term is defined in section 4.10 of Revenue Procedure 2009-20.
							</div>
							<div style="width:187mm;padding-top:1mm;">
										   <img src="{$ImagePath}/8827_Bullet_Round.gif" width="4" height="4" alt="Bullet Image"/>
										   I agree to comply with the conditions and agreements set forth in Revenue Procedure 2009-20 and this Section C.
							</div>
							<div style="width:187mm;padding-top:1mm;">
										   <img src="{$ImagePath}/8827_Bullet_Round.gif" width="4" height="4" alt="Bullet Image"/>
										   If I have already filed a return or amended return that does not satisfy the conditions in section 6.02 of Revenue Procedure 2009-20, 
	I agree to all <br/><span style="width:2mm"/>adjustments or actions that are necessary to comply with those conditions. The tax year(s) for which I filed the return(s) or amended return(s) <br/><span style="width:2mm"/>and the date(s) on which they were filed are as follows:
							</div>
							<div class="styFixedUnderline" style="height:4mm;width:187mm;"/>
							<div class="styFixedUnderline" style="height:4mm;width:187mm;"/>
							<div class="styFixedUnderline" style="height:4mm;width:187mm;"/>
							<div class="styFixedUnderline" style="height:4mm;width:187mm;font-weight:bold;"/>
						</div>
					</xsl:if>
					
					
				<xsl:if test="(count($Form4684Data/RevenueProcedure200920Grp) &gt;=1)">					
					<xsl:for-each select="$Form4684Data/RevenueProcedure200920Grp">
					<div class="styBB" style="width:187mm;clear:both;float:none;">
						<!-- Added clear:both attribute -->
						<div class="styPartName" style="background-color:black;width:12mm;">Part I</div>
						<div class="styPartDesc" style="width:168mm;">Computation of Deduction
						</div>
					</div>
						<!-- Part II line 40 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">40</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Initial investment</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">40</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="InitialInvestmentAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px; 
								border-right-width:0px;background-color:lightgrey;"/>
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px; 
								border-left-width:0px;;background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part II line 41 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">41</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Subsequent investments (see instructions)</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">41 </div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="SubsequentInvestmentsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px; 
								border-right-width:0px;background-color:lightgrey;"/>
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;
								 border-left-width:0px;;background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part III line 42 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">42</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Income reported on your tax returns
									 for tax years prior to the discovery</span>
									<span style="float:left"> year (see instructions)</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:7.5mm;
								padding-top:3.5mm;">42</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;
								height:7.5mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="IncmRptOnTxRtnTYPrDiscvYrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" 
								style="height:7.5mm;border-bottom-width:0px; border-right-width:0px;
								background-color:lightgrey;"/>
								<div class="styLNAmountBox" 
								style="height:7.5mm;border-bottom-width:0px; border-left-width:0px
								;background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part III line 43 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">43</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Add lines 40, 41, and 42</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">43</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="TotInitialSubsqInvstAndIncmAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox"
								 style="height:4.5mm;border-bottom-width:0px; border-right-width:0px;
								 background-color:lightgrey;"/>
								<div class="styLNAmountBox" 
								style="height:4.5mm;border-bottom-width:0px; border-left-width:0px;
								background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part III line 44 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">44</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Withdrawals for all years (see instructions)</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">44</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="TotalWithdrawalsForAllYearsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;
								 border-right-width:0px;background-color:lightgrey;"/>
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;
								 border-left-width:0px;;background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part III line 45 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">45</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Subtract line 44 from line 43.
									 This is your total qualified investment</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">45</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalQlfyInvstAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;
								 border-right-width:0px;background-color:lightgrey;"/>
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px; 
								border-left-width:0px;;background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part III line 46 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">46</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Enter 0.95 (95%) if you have no 
									potential third-party recovery. Enter 0.75 </span>
									<span style="float:left">(75%) if you have potential 
									third-party recovery</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" 
								style="height:7.5mm;padding-top:3.5mm;">46</div>
								<div class="styLNAmountBox" 
								style="border-bottom-width:1px;height:7.5mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" 
										select="ActlOrPotentialClaimsRcvryPct"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" 
								style="height:7.2mm;border-bottom-width:0px; border-right-width:0px;
								background-color:lightgrey;"/>
								<div class="styLNAmountBox" 
								style="height:7.2mm;border-bottom-width:0px; border-left-width:0px;
								background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part III line 47 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">47</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Multiply line 46 by line 45</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.8mm;">47</div>
								<div class="styLNAmountBox"
								 style="border-bottom-width:1px;height:4.8mm;background-color:lightgrey;">
							</div>
								<div class="styLNRightNumBox" 
								style="border-bottom-width:1px;height:4.8mm;border-top-width:1px;">
							</div>
								<div class="styLNAmountBox" 
								style="height:4.8mm;border-bottom-width:1px;border-top-width:1px;
														 border-left-width:0px; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="RcvryPctTimesTotalQlfyInvstAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Part III line 48 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">48</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									<span style="float:left">Actual recovery</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">48</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="ActualRecoveryAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" 
								style="height:4.5mm;border-bottom-width:0px; 
								border-right-width:0px;background-color:lightgrey;"/>
								<div class="styLNAmountBox" 
								style="height:4.5mm;border-bottom-width:0px; border-left-width:0px;
								background-color:lightgrey">
							</div>
							</div>
						</div>
						<!-- Part III line 49 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">49</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									Potential insurance/Securities Investor Protection Corporation (SIPC) recovery
									<!--Dotted Line-->
									<!--<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>-->
     							</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" 
								style="height:4mm">49</div>
								<div class="styLNAmountBox"
								 style="border-bottom-width:1px;height:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="InsuranceSIPCRecoveryAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox"
								 style="height:4mm;border-bottom-width:0px; border-right-width:0px;
								 background-color:lightgrey;"/>
								<div class="styLNAmountBox" 
								style="height:4mm;border-bottom-width:0px; border-left-width:0px;
								background-color:lightgrey">
							</div>
							</div>
						</div><!--<span style="height:1mm"/>-->
						<!-- Part III line 50 -->
						<div style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4.8mm;">50</div>
								<div class="styLNDesc" style="height:4.8mm;width:99mm;">
									<span style="float:left">Add lines 48 and 49. This is your total recovery</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.8mm;">50</div>
								<div class="styLNAmountBox" 
								style="border-bottom-width:1px;background-color:lightgrey;height:4.8mm;">
							</div>
								<div class="styLNRightNumBox" 
								style="border-top-width:1px;border-bottom-width:1px;;height:4.8mm">
							</div>
								<div class="styLNAmountBox" 
								style="border-top-width:1px;border-bottom-width:1px; 
							border-left-width:0px;;height:4.8mm ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalRecoveryAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Part III line 51 -->
						<div class="styBB" style="width:187mm;">
							<div style=" float:left;clear:none:">
								<div class="styLNLeftNumBox" style="height:4mm;">51</div>
								<div class="styLNDesc" style="height:4mm;width:99mm;">
									Subtract line 50 from line 47.  This is your deductible theft loss. Include this amount on
                                     line 28 of Section B, Part I. Do not complete lines 19-27 for this loss. Then complete Section B, Part II.
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" 
								style="height:11mm;padding-top:7mm;border-bottom-width:0px;">51</div>
								<div class="styLNAmountBox" 
								style="border-bottom-width:0px;height:11mm;background-color:lightgrey;">
								</div>
								<div class="styLNRightNumBox" style="border-bottom-width:0px;height:11mm;">
							</div>
								<div class="styLNAmountBox"
								 style="height:11mm;border-bottom-width:0px; border-left-width:0px;
								 padding-top:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TheftLossDeductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styBB" style="width:187mm;clear:both;float:none;">
							<!-- Added clear:both attribute -->
							<div class="styPartName" style="background-color:black;width:12mm;">Part II</div>
							<span style="width:2mm"/>
							<div  style="width:168mm;font-size:8pt"><b>Required Statements and Declarations</b>
							 (See instructions.)</div>
						</div>
						<!--<div style="width:10mm;height:4mm;"/>-->
						<div class="styBB" style="width:187mm;clear:both;float:none;">
							<div style="width:187mm">
							<img src="{$ImagePath}/8827_Bullet_Round.gif" width="4" height="4" alt="Bullet Image"/>
								I am claiming a theft loss deduction pursuant to Revenue Procedure 2009-20 from a specified fraudulent 
					      arrangement conducted by the following <br/><span style="width:2mm;"/>individual or entity.</div>
							<div style="width:187mm;padding-top:1mm;">
								<div class="styLNLeftNumBox" style="width:2mm;"/>
								<div class="styLNDesc" style="width:36mm;">Name of individual or entity</div>
									<div class="styFixedUnderline" style="height:auto;width:149mm;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" 
											select="TheftLossDedRevenuePr200920Grp"/>
										</xsl:call-template>
										
										<xsl:if test="TheftLossDedRevenuePr200920Grp/PersonNm !=''">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode"
												 select="TheftLossDedRevenuePr200920Grp/PersonNm"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="TheftLossDedRevenuePr200920Grp/
										BusinessName/BusinessNameLine1Txt !=''">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="TheftLossDedRevenuePr200920Grp/
												BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="TheftLossDedRevenuePr200920Grp/
										BusinessName/BusinessNameLine2Txt !=''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="TheftLossDedRevenuePr200920Grp/
												BusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
										
									</div>		
							</div>
							<div style="width:187mm;padding-top:1mm;">
								<div class="styLNLeftNumBox" style="width:2mm;"/>
								<div class="styLNDesc" style="width:55mm;">
									Taxpayer identification number (if known)
								</div>
									<div class="styFixedUnderline" style="height:4mm;width:130mm;">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode"
											 select="TheftLossDedRevenuePr200920Grp/SSN"/>
										</xsl:call-template>
										<xsl:if test="TheftLossDedRevenuePr200920Grp/EIN !=''">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" 
												select="TheftLossDedRevenuePr200920Grp/EIN"/>
											</xsl:call-template>
										</xsl:if>
									</div>		
							</div>
							<div style="width:187mm;padding-top:1mm;">
								<div class="styLNLeftNumBox" style="width:2mm;"/>
								<div class="styLNDesc" style="width:12mm;">Address</div>
									<div class="styFixedUnderline" style="height:auto;width:173mm;">
										<xsl:if test="TheftLossDedRevenuePr200920Grp/USAddress !=''">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" 
												select="TheftLossDedRevenuePr200920Grp/USAddress"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="TheftLossDedRevenuePr200920Grp/ForeignAddress !=''">
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" 
												select="TheftLossDedRevenuePr200920Grp/ForeignAddress"/>
											</xsl:call-template>
										</xsl:if>
									</div>	
							</div>
							<div style="width:187mm;padding-top:1mm;">
								   <img src="{$ImagePath}/8827_Bullet_Round.gif" 
								   width="4" height="4" alt="Bullet Image"/>
								I have written documentation to support the amounts reported in Part I of this Section C.
							</div>
							<div style="width:187mm;padding-top:1mm;">
										   <img src="{$ImagePath}/8827_Bullet_Round.gif" width="4" height="4" alt="Bullet Image"/>
								I am a qualified investor as defined in section 4.03 of Revenue Procedure 2009-20.
							</div>
								<div style="width:187mm;padding-top:1mm;">
										   <img src="{$ImagePath}/8827_Bullet_Round.gif" width="4" height="4" alt="Bullet Image"/>
								If I have determined the amount of my theft loss deduction using 0.95 on line 46 above, I declare that I have not pursued and do not
							 intend to <br/><span style="width:2mm"/>pursue any potential third-party recovery,
								 as that term is defined in section 4.10 of Revenue Procedure 2009-20.
							</div>
							<div style="width:187mm;padding-top:1mm;">
										   <img src="{$ImagePath}/8827_Bullet_Round.gif" width="4" height="4" alt="Bullet Image"/>
										   I agree to comply with the conditions and agreements set forth in Revenue Procedure 2009-20 and this Section C.
							</div>
							<div style="width:187mm;padding-top:1mm;">
										   <img src="{$ImagePath}/8827_Bullet_Round.gif" width="4" height="4" alt="Bullet Image"/>
										   If I have already filed a return or amended return that does not satisfy the conditions in section 6.02 of Revenue Procedure 2009-20, 
	I agree to all <br/><span style="width:2mm"/>adjustments or actions that are necessary to comply with those conditions. The tax year(s) for which I filed the return(s) or amended return(s) <br/><span style="width:2mm"/>and the date(s) on which they were filed are as follows:
							</div>
							<div class="styFixedUnderline" style="height:4mm;width:187mm;"/>
							<div class="styFixedUnderline" style="height:4mm;width:187mm;"/>
							<div class="styFixedUnderline" style="height:4mm;width:187mm;"/>
							<div class="styFixedUnderline" style="height:4mm;width:187mm;"/>
						</div>
					</xsl:for-each>
					</xsl:if>
				</div>	
					<!--footer -->
					<div  style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">4684
						</span> (2019)</div>
					</div>
					<p style="page-break-before:always"/>
					<!-- header page 4 -->
					<div class="styTBB" style="width:187mm;clear:both;padding-bottom:.5mm;">
						<div class="styGenericDiv" style="width:75mm;" >Form 4684 (2019)</div>
						<div class="styGenericDiv" style="width:55mm;text-align:left; padding-left: 3mm;" >
						Attachment Sequence No. <span class="styBoldText">26</span>
						</div>
						<div class="styGenericDiv" style="float:right;" >Page <span
						 class="styBoldText" style="font-size:8pt;">4
						</span>
						</div>
					</div>
					<!-- Taxpayer Name and number section -->
					<div class="styBB" style="width:187mm;clear:both;float:none;">
						<div class="styNameBox" style="width:156mm;height:8mm">
				                    Name(s) shown on tax return
				            <br/>
				            <xsl:choose>
							<!-- Name from 1120/990/1065 Return Header -->
							<xsl:when test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode"
								   select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" 
								  select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:when>
							<!-- Name from 1040 Return Header -->
							<xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt"><br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								</xsl:call-template>
							</xsl:when>
							<!-- Name from 1041 Return Header -->
							<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" 
								  select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" 
								  select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
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
						<div class="styEINBox" style="width:31mm;height:4mm;padding-left:2mm;">Identifying number<br/>
							<br/>
							<span style="width:38mm;text-align:left;font-weight:normal;">
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
							</span>
						</div>
					</div>
					<!-- Section D Part I -->
					<div style="width:187mm;float:none;">
						<div class="styIRS4684ScheduleName" 
						style="width:187mm;font-size:8pt;text-align:left;">
				                SECTION D &#8212; Election to Deduct Federally Declared Disaster Loss in Preceding Tax Year 
									<span style="font-weight:normal;">(See instructions.)</span>
				      </div>
					</div>
					<xsl:if test="(count($Form4684Data/FedDclrDsstrLossElectGrp) &lt; 1)">
						<div class="styBB" style="width:187mm;clear:both;float:none;height:4mm;border-top-width:1px;">
							<!-- Added clear:both attribute -->
							<div class="styPartName" style="background-color:black;width:12mm">Part I</div>
							<div class="styPartDesc" style="width:168mm;">Election Statement</div>
						</div>
						<div class="styLNDesc"  style="height:20mm;width:187mm;text-align:left;">
							<div style="height:12mm;width:187mm;">
								By providing all of the information below, the taxpayer elects, under section 165(i) of the Internal Revenue Code, to deduct a loss attributable to 
								a federally declared disaster and that occurred in a federally declared disaster area in the tax year immediately preceding the tax year the loss 
								was sustained.
							</div>
							<div style="height:8mm;width:187mm;">
								Attach this Section D to your return or amended return for the tax year immediately preceding the tax year the loss was sustained to claim the 
								disaster loss deduction.
							</div>	
						</div>
						<!-- Section D Part I line 52 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="">52</div>
							<div class="styLNDesc" style="width:87mm;">Provide the name or a description of the federally declared disaster.
							</div>
							<div class="styFixedUnderline" style="height:4mm;width:92mm;"/>
						</div>
						<div style="width:187mm;align:right;">
							<div class="styLNLeftNumBox" style=""/>
							<div class="styFixedUnderline" style="height:4mm;width:179mm "/>
						</div>
						<!-- Section D Part I line 53 -->
						<div style="width:187mm;padding-top:1mm;">
							<div class="styLNLeftNumBox" style="">53</div>
							<div class="styLNDesc" style="width:137mm;">Provide the date or dates (mm/dd/yyyy) of the loss or
								losses that arose from the federally declared disaster.
							</div>
							<div class="styFixedUnderline" style="height:4mm;width:42mm;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style=""/>
							<div class="styFixedUnderline" style="height:4mm;width:179mm;"/>
						</div>
						<!-- Section D Part I line 54 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="">54</div>
							<div class="styLNDesc" style="height:auto;width:179mm;">Specify the address, including the city or town, county or parish, 
							state and ZIP code where the damaged or destroyed property was located at 
							<br/>the time of the disaster.
								<span class="styFixedUnderline" style="height:3mm;width:147mm;padding-top:0mm;padding-bottom:0mm;float:none;clear:none;"/>
							</div>	
						</div>
				</xsl:if>
				<xsl:if test="(count($Form4684Data/FedDclrDsstrLossElectGrp) &gt;= 1)">
					<xsl:for-each select="$Form4684Data/FedDclrDsstrLossElectGrp">
						<xsl:variable name="curPos">
							<xsl:value-of select="position()-1"/>
						</xsl:variable>
						<div class="styBB" style="width:187mm;clear:both;float:none;height:4mm;border-top-width:1px;">
							<!-- Added clear:both attribute -->
							<div class="styPartName" style="background-color:black;width:12mm">Part I</div>
							<div class="styPartDesc" style="width:168mm;">Election Statement</div>
						</div>
						<div class="styLNDesc"  style="height:20mm;width:187mm;text-align:left;">
							<div style="height:12mm;width:187mm;">
								By providing all of the information below, the taxpayer elects, under section 165(i) of the Internal Revenue Code, to deduct a loss attributable to 
								a federally declared disaster and that occurred in a federally declared disaster area in the tax year immediately preceding the tax year the loss 
								was sustained.
							</div>
							<div style="height:8mm;width:187mm;">
								Attach this Section D to your return or amended return for the tax year immediately preceding the tax year the loss was sustained to claim the 
								disaster loss deduction.
							</div>	
						</div>
						<!-- Section D Part I line 52 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="">52</div>
							<div class="styLNDesc" style="width:87mm;">Provide the name or a description of the federally declared disaster.
							</div>
						</div>
						<div style="width:187mm;align:right;">
							<div class="styLNLeftNumBox" style=""/>
							<div class="styFixedUnderline" style="height:4mm;width:179mm ">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="DisasterDesc"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Section D Part I line 53 -->
						<div style="width:187mm;padding-top:1mm;">
							<div class="styLNLeftNumBox" style="">53</div>
							<div class="styLNDesc" style="width:137mm;">Provide the date or dates (mm/dd/yyyy) of the loss or
								losses that arose from the federally declared disaster.
							</div>
							<div class="styFixedUnderline" style="height:4mm;width:42mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="DisasterDt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style=""/>
							<div class="styFixedUnderline" style="height:4mm;width:179mm;"/>
						</div>
						<!-- Section D Part I line 54 -->
					<xsl:for-each select="USAddress">
					    <xsl:variable name="Pos">
							<xsl:value-of select="position()-1"/>
						</xsl:variable>
					<xsl:choose>
						<xsl:when test="position() = 1">						
						<div style="width:187mm;padding-bottom:1mm;">
							<div class="styLNLeftNumBox" style="">54</div>
							<div class="styLNDesc" style="width:179mm;">Specify the address, including the city or town, county or parish, state and ZIP code
							 where the damaged or destroyed property was located at 
							 </div>
							<div class="styLNDesc" style="width:40mm;padding-top:0mm;padding-left:8mm;">the time of the disaster. 
							</div>
								<span class="styFixedUnderline" style="height:auto;width:147mm;padding-top:0mm;padding-bottom:0mm;float:none;clear:none;">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" 
										select="$Form4684Data/FedDclrDsstrLossElectGrp[$curPos + 1]/USAddress[$Pos]"/>
									</xsl:call-template>
								</span>
						</div>
					</xsl:when>
					<xsl:otherwise>	
						<div style="width:187mm;padding-bottom:1mm;">
							<div class="styLNLeftNumBox" style=""></div>
							<div class="styLNDesc" style="height:auto;width:179mm;padding-left:32mm;">
								<span class="styFixedUnderline" style="height:auto;width:147mm;padding-top:0mm;padding-bottom:0mm;float:none;clear:none;">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" 
										select="$Form4684Data/FedDclrDsstrLossElectGrp[$curPos + 1]/USAddress[$Pos + 1]"/>
									</xsl:call-template>
								</span>
							</div>	
						</div>
					</xsl:otherwise>
					</xsl:choose>
					</xsl:for-each>
					</xsl:for-each>
				</xsl:if>
				
				<xsl:if test="(count($Form4684Data/FedDclrDsstrLossPrElectRvkGrp) &lt; 1)">
					<div class="styBB" style="width:187mm;border-top-width:1px;clear:both;float:none;">
						<!-- Added clear:both attribute -->
						<div class="styPartName" style="background-color:black;width:12mm;">Part II</div>
						<div class="styPartDesc" style="width:168mm;">Revocation of Prior Election</div>
					</div>	
							<div class="styLNDesc"  style="height:20mm;width:187mm;text-align:left;">
								<div style="height:12mm;width:187mm;">
									By providing all of the information below, the taxpayer revokes the prior election under section 165(i) of the Internal Revenue Code to deduct a loss
									attributable to a federally declared disaster and that occurred in a federally declared disaster area in the tax year immediately preceding the tax year
									the loss was sustained.
								</div>
								<div style="height:8mm;width:187mm;">
									Attach this Section D to your amended return for the tax year immediately preceding the tax year the loss was sustained to remove the previous
									disaster loss deduction.
								</div>
							</div>
							<!-- Section D Part II line 55 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="">55</div>
								<div class="styLNDesc" style="height:auto;width:179mm;">Provide the name or a description of the federally declared disaster and the
								 address of the property that was damaged or destroyed and for 
								 <div class="styLNDesc" style="width:41mm;padding-top:1mm;">which the election was claimed.</div>
									<span class="styFixedUnderline" style="height:4mm;width:138mm;float:none;clear: none;"/>
								</div>
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style=""/>
									<div class="styFixedUnderline" style="height:4mm;width:179mm;"/>
								</div>															
							</div>
							<!-- Section D Part II line 56 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="">56</div>
								<div class="styLNDesc" style="height:auto;width:179mm;">Specify the date (mm/dd/yyyy) you filed the prior election, which you are now
								 revoking. (See instructions and note that new rules went into<br/>effect on October 13, 2016)<span style="width:1mm;"/>	 
									<span class="styFixedUnderline" style="height:3mm;width:143mm;padding-top:0mm;padding-bottom:0mm;float:none;clear:none;"/>
								</div>						
							</div>
					<!-- Section D Part II line 57 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="">57</div>
								<div class="styLNDesc" style="height:7mm;width:179mm;">Enclose your payment or otherwise provide evidence for, or explanation of,
								 your arrangements for the repayment of the amount of any credit or refund which you received and which resulted from the prior election
								 (which you are now revoking).</div>
					</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNLeftNumBox" style=""/>
						<div class="styFixedUnderline" style="height:4mm;width:179mm;"/>
					</div>
				</xsl:if>
				<xsl:if test="(count($Form4684Data/FedDclrDsstrLossPrElectRvkGrp) &gt;= 1)">
					<xsl:for-each select="$Form4684Data/FedDclrDsstrLossPrElectRvkGrp">
						<div style="width:187mm;display:block;">
							<div class="styBB" style="width:187mm;border-top-width:1px;clear:both;float:none;">
								<!-- Added clear:both attribute -->
								<div class="styPartName" style="background-color:black;width:12mm;">Part II</div>
								<div class="styPartDesc" style="width:168mm;">Revocation of Prior Election</div>
							</div>	
							<div class="styLNDesc"  style="height:20mm;width:187mm;text-align:left;">
								<div style="height:12mm;width:187mm;">
									By providing all of the information below, the taxpayer revokes the prior election under section 165(i) of the Internal Revenue Code to deduct a loss
									attributable to a federally declared disaster and that occurred in a federally declared disaster area in the tax year immediately preceding the tax year
									the loss was sustained.
								</div>
								<div style="height:8mm;width:187mm;">
									Attach this Section D to your amended return for the tax year immediately preceding the tax year the loss was sustained to remove the previous
									disaster loss deduction.
								</div>
							</div>
							<!-- Section D Part II line 55 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="">55</div>
								<div class="styLNDesc" style="height:auto;width:179mm;">Provide the name or a description of the federally declared disaster and the
								 address of the property that was damaged or destroyed and for 
								 <div class="styLNDesc" style="width:41mm;padding-top:1mm;">which the election was claimed.</div>
									<span class="styFixedUnderline" style="height:auto;width:138mm;padding-top:1mm;padding-bottom:0mm;float:none;clear: none;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="DisasterDesc"/>
										</xsl:call-template><br/>
										<xsl:call-template name="PopulateUSAddressTemplate">
											<xsl:with-param name="TargetNode" select="USAddress"/>
									   </xsl:call-template>	
									</span>
								</div>
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style=""/>
									<div class="styFixedUnderline" style="height:4mm;width:179mm;"/>
								</div>															
							</div>
							<!-- Section D Part II line 56 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="">56</div>
								<div class="styLNDesc" style="height:auto;width:179mm;">Specify the date (mm/dd/yyyy) you filed the prior election, which you are now
								 revoking. (See instructions and note that new rules went into<br/>effect on October 13, 2016)<span style="width:1mm;"/>	 
									<span class="styFixedUnderline" style="height:3mm;width:143mm;padding-top:0mm;padding-bottom:0mm;float:none;clear:none;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="ElectionFileDt"/>
										</xsl:call-template>
									</span>
								</div>						
							</div>
							<!-- Section D Part II line 57 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="">57</div>
								<div class="styLNDesc" style="height:7mm;width:179mm;">Enclose your payment or otherwise provide evidence for, or explanation of,
								 your arrangements for the repayment of the amount of any credit or refund which you received and which resulted from the prior election
								 (which you are now revoking).</div>
							</div>
							<div style="width:187mm;padding-bottom:2mm;">
								<div class="styLNLeftNumBox" style=""/>
								<div class="styFixedUnderline" style="height:4mm;width:179mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ElectionRepymtAmtExplnTxt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</xsl:for-each>	
				</xsl:if>
					<!--footer -->
					<div  class="pageend" style="width:187mm;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">
						<div class="styGenericDiv" style="float:right;clear:both;">Form 
						<span class="styBoldText">4684</span> (2019)</div>
					</div>					
					
					<p style="page-break-before:always"/>
					<!-- Begininning of write-in data -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle"> Additional Data        
                        </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn"
							 tabindex="1" type="button" 
							 value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form4684Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 4684, Top Left Margin - 
							Revenue Procedure 2009-20 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" 
							select="$Form4684Data/@revenueProcedure201036Cd"/>
							<xsl:with-param name="DescWidth" 
							select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 4684, Top Left Margin - 
							Revenue Procedure 200920 IND</xsl:with-param>
							<xsl:with-param name="TargetNode"
							 select="$Form4684Data/@revenueProcedure200920Cd"/>
							<xsl:with-param name="DescWidth" 
							select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 27 - Note </xsl:with-param>
							<xsl:with-param name="TargetNode"
							 select="$Form4684Data/BusinessProperties/NetBusinessPropertyLossAmt/
							 @seeAttachedStatementCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					<!-- Adding pen image -->
					</table>
					<xsl:if test="($Print = $Separated) and (count($Form4684Data/PersonalUseProperties)&gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 4684, SECTION A, Line 1 — 
						Personal Use Property:
						</span>

						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<!--<th class="styDepTblCell" style="text-align:left;width:8mm;border-bottom-width:0px;border-right-width:0px;" scope="col">
											<span class="styTableCellPad"/>
									</th>-->
									<th class="styDepTblCell" style="text-align:left;width:15mm;" scope="col">
											<span class="styTableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:84mm;font-size:8pt;"  scope="col">
                    		    				Type of Property
									</th>
									<th class="styDepTblCell" style="width:40mm;font-size:8pt;"  scope="col">
                    		    				City and State
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:8pt;"  scope="col">
                    		    				ZIP Code
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:8pt;border-right-width:0px;" scope="col">
                    		    				Date Acquired
									</th>
								</tr>
							</thead>
							<xsl:for-each select="$Form4684Data/PersonalUseProperties">
								<tr style="font-size:7pt;height:6mm;border-color:black;">
									<!-- Define background colors to the rows -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">
									styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise>
									</xsl:choose></xsl:attribute>
											<td class="styTableCellText" style="width:15mm;">
                 					    Property <span class="styBoldText">
													<xsl:number format="A"/>
												</span>
											</td>
											<td class="styTableCellText" style="width:84mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="width:40mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
												</xsl:call-template>,
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
												</xsl:call-template>												
											</td>
											<td class="styTableCellCtr" style="width:20mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="width:20mm;border-right-width:0px;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AcquiredDt"/>
												</xsl:call-template>
											</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($Form4684Data/PersonalUseProperties)       &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 4684, SECTION A, Lines 2-9 — Personal 
						Use Property:
						</span>
						<xsl:for-each select="$Form4684Data/PersonalUseProperties">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="position() mod 4 = 1">
								<br/>
								<table class="styDepTbl" cellspacing="0" style="font-size:7pt">
									<thead class="styTableThead">
										<tr class="styDepTblHdr">
											<th scope="col">
												<span class="styTableCellPad"/>
											</th>
											<th style="width:8mm;color:lightgrey;height:5mm;" scope="col">
												<span class="styTableCellPad"/>
											</th>
											<th class="styDepTblCell" style="width:100mm;font-size:8pt;
											            border-top-width:1px;border-left-width:1px;border-right-width:0;px;
											                        border-bottom-width:1px; border-color: black" colspan="4" scope="col">
											 Properties  
                   						</th>
										</tr>
										<tr class="styDepTblHdr">
											<th class="styDepTblCell" style="width:70mm;border:none;font-size:7pt;
											text-align:left;padding-left:6mm;font-weight:medium;" scope="col">
												<span class="styTableCellPad"/>
											</th>
											<th class="styDepTblCell" style="width:5mm;height:3mm;
											border-color:black;border-left-width:0px;border-right-width:1px;
											            border-top-width:0px;border-bottom-width:1px;" scope="col">
												<span class="styTableCellPad"/>
											</th>
											<xsl:for-each select="$Form4684Data/PersonalUseProperties">
												<xsl:if test="(position() &gt;= $pos and position() &lt; $pos+4)">
													<td class="styDepTblCell" scope="col" style="text-align:center;
													              font-weight:bold;border-color:black;border-left-width:1px; 
													                           border-right-width:0px; border-top-width:0px;border-bottom-width:1px;">
														<xsl:if test="position() mod 4 =1">
															<xsl:attribute name="style">border-color:black;
															border-left-width:1px;border-right-width:0px;
															border-top-width:0px;border-bottom-width:1px;
															text-align:center;font-weight:bold;</xsl:attribute>
														</xsl:if>
														<xsl:number format="A"/>
														<span class="styTableCellPad"/>
													</td>
												</xsl:if>
											</xsl:for-each>
											<xsl:if test="count($Form4684Data/PersonalUseProperties[position()  
											           &gt;= $pos  and position() &lt; $pos+4]) = 1">
												<xsl:choose>
													<xsl:when test="count($Form4684Data/PersonalUseProperties) &lt; 2">
														<td class="styDepTblCell" style="text-align:center; 
														              font-weight:bold;border-color:black;border-left-width:1px;  
														                           border-right-width:0px; border-top-width:0px;
														                           border-bottom-width:1px;">
														B<span class="styTableCellPad"/>
														</td>
														<td class="styDepTblCell" style="text-align:center; 
														              font-weight:bold;border-color:black;border-left-width:1px; 
														                            border-right-width:0px; border-top-width:0px;
														                            border-bottom-width:1px;">
														C<span class="styTableCellPad"/>
														</td>
														<td class="styDepTblCell" style="text-align:center;
														               font-weight:bold;border-color:black;border-left-width:1px; 
														                             border-right-width:0px; border-top-width:0px;
														                             border-bottom-width:1px;">
														D<span class="styTableCellPad"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styTableCellSmall" style="border-color:black;
														                border-left-width:1px;border-right-width:0px; 
														                               border-top-width:0px;border-bottom-width:1px;">
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCellSmall" style="border-color:black; 
														               border-left-width:1px;border-right-width:0px;  
														                             border-top-width:0px;border-bottom-width:1px;">
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCellSmall" style="border-color:black; 
														               border-left-width:1px;border-right-width:0px; 
														                              border-top-width:0px;border-bottom-width:1px;">
															<span class="styTableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<xsl:if test="count($Form4684Data/PersonalUseProperties[position() 
											            &gt;= $pos  and position() &lt; $pos+4]) = 2">
												<xsl:choose>
													<xsl:when test="count($Form4684Data/PersonalUseProperties) &lt; 3">
														<td class="styTableCellSmall" style="text-align:center;  
														             font-weight:bold;border-color:black;border-left-width:1px;
														                            border-right-width:0px;border-top-width:0px;
														                            border-bottom-width:1px;">
														C<span class="styTableCellPad"/>
														</td>
														<td class="styTableCellSmall" style="text-align:center;  
														             font-weight:bold;border-color:black;border-left-width:1px; 
														                           border-right-width:0px;border-top-width:0px;
														                           border-bottom-width:1px;">
														D<span class="styTableCellPad"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styTableCellSmall" style="border-color:black; 
														               border-left-width:1px;border-right-width:0px; 
														                              border-top-width:0px;border-bottom-width:1px;">
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCellSmall" style="border-color:black;  
														              border-left-width:1px;border-right-width:0px; 
														                             border-top-width:0px;border-bottom-width:1px;">
															<span class="styTableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<xsl:if test="count($Form4684Data/PersonalUseProperties[position() 
											            &gt;= $pos  and position() &lt; $pos+4]) = 3">
												<xsl:choose>
													<xsl:when test="count($Form4684Data/PersonalUseProperties) &lt; 4">
														<td class="styTableCellSmall" style="text-align:center;
														               font-weight:bold;border-color:black;border-left-width:1px;
														   border-right-width:0px;border-top-width:0px;
														   border-bottom-width:1px;">
														D<span class="styTableCellPad"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styTableCellSmall" style="border-color:black; 
														               border-left-width:1px;border-right-width:0px;
														               border-top-width:0px;border-bottom-width:1px;">
															<span class="styTableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</tr>
									</thead>
									<!-- Line 2  -->
									<tr class="styDepTblRow1">
										<td style="border:none;">
												<span>
													<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
														<span class="styLNLeftNumBoxSD">2</span>
														<div class="styLNDesc" style="width:65mm;text-align:left;">Cost or other basis of each property
															<span class="styDotLn" style="float:right;">....</span>
														</div>
													</span>
												</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
										    vertical-align:bottom;border-color:black;border-left-width:1px;border-right-width:0px;
										    border-top-width:1px;border-bottom-width:1px;font-weight:bold;text-align:center;">2
										</td>
										<td class="styTableCellSmall" style="border-color:black;  
										         border-left-width:1px;border-right-width:0px;border-top-width:0px;
										                    border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black;
										           border-left-width:1px;border-right-width:0px;border-top-width:0px;
										                      border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties 
												             [$pos + 1]/CostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad" style="border-color:black; 
											           border-left-width:1px;border-right-width:0px;border-top-width:0px;
											                       border-bottom-width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black; 
										          border-left-width:1px;border-right-width:0px;border-top-width:0px; 
										                    border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties  
												           [$pos +  2]/CostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black; 
										          border-left-width:1px;border-right-width:0px;border-top-width:0px;
										                     border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties 
												            [$pos + 3]/CostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- Line 3 -->
									<tr class="styDepTblRow2">
										<td style="border:none;">
											<span>
												<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
													<span class="styLNLeftNumBoxSD">3</span>
													<div class="styLNDesc" style="height:auto;width:65mm;text-align:left;">Insurance or other reimbursement (whether or not 
                       								    you filed a claim) (see instructions)
 														<span class="styDotLn" style="float:right;">....</span>
													</div>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
										    vertical-align:bottom;border-color:black;border-left-width:1px;border-right-width:0px;
										    border-top-width:1px;border-bottom-width:1px;font-weight:bold;text-align:center;">3
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										          border-color:black;border-left-width:1px;border-right-width:0px;
										                    border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:if test="InsuranceOrOthReimbursementAmt != ' '">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode"
													 select="$Form4684Data/PersonalUseProperties/
													 InsuranceOrOthReimbursementAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="InsuranceOrOthReimbursementAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										          border-color:black;border-left-width:1px;border-right-width:0px;
										                     border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:if test="InsuranceOrOthReimbursementAmt != ' '">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/PersonalUseProperties 
													            [$pos + 1]/InsuranceOrOthReimbursementAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties  
												            [$pos + 1]/InsuranceOrOthReimbursementAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										          border-color:black;border-left-width:1px;border-right-width:0px; 
										                    border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:if test="InsuranceOrOthReimbursementAmt != ' '">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode"
													 select="$Form4684Data/PersonalUseProperties 
													             [$pos + 2]/InsuranceOrOthReimbursementAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties  
												           [$pos + 2]/InsuranceOrOthReimbursementAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;  
										         border-color:black;border-left-width:1px;border-right-width:0px; 
										                   border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:if test="InsuranceOrOthReimbursementAmt != ' '">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/PersonalUseProperties 
													            [$pos + 3]/InsuranceOrOthReimbursementAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties   
												          [$pos + 3]/InsuranceOrOthReimbursementAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- Line  4-->
									<tr class="styDepTblRow1">
										<td style="border:none;">
											<span>
												<span  style="width:73mm;font-size:7pt;">
													<span class="styLNDesc" style="width:73mm;font-style: normal;padding-left:1mm;"><b>Note:  </b>
														If line 2 is <b>more</b> than line 3, skip line 4.
													</span>
												</span>
											</span>
											<span>
												<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
													<span class="styLNLeftNumBoxSD">4</span>
													<div class="styLNDesc" style="height:auto;width:65mm;text-align:left;">Gain from casualty or theft. If line 3 is <b>more</b> than line 2, 
														enter the difference here and skip lines 5 through 9 for that column. See instructions if line 3 includes insurance 
									                    or other reimbursement you did not claim, or you received payment for your loss in a later tax year
														<span class="styDotLn" style="float:right;">...........</span>
													</div>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;  
										    vertical-align:bottom;font-weight:bold;border-color:black;border-left-width:1px;border-right-width:0px; 
										    border-top-width:0px;border-bottom-width:1px;text-align:center">4
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										          border-color:black;border-left-width:1px;border-right-width:0px;
										                     border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="GainFromCasualtyOrTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										          border-color:black;border-left-width:1px;border-right-width:0px;
										                     border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												select="$Form4684Data/PersonalUseProperties  
												           [$pos +  1]/GainFromCasualtyOrTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										          border-color:black;border-left-width:1px;border-right-width:0px;
										                     border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties
												             [$pos +  2]/GainFromCasualtyOrTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;  
										         border-color:black;border-left-width:1px;border-right-width:0px; 
										                   border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties [$pos +  3]/
												GainFromCasualtyOrTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- Line 5  -->
									<tr class="styDepTblRow2">
										<td style="border:none;">
											<span>
												<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
													<span class="styLNLeftNumBoxSD">5</span>
													<div class="styLNDesc" style="width:65mm;text-align:left;">Fair market value<b> before </b>casualty or theft
														<span class="styDotLn" style="float:right;">..</span>
													</div>
												</span>
											</span>		
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
										    vertical-align:bottom;font-weight:bold;border-color:black;border-left-width:1px;border-right-width:0px;  
										    border-top-width:0px;border-bottom-width:1px;text-align:center;">5
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										          border-color:black;border-left-width:1px;border-right-width:0px; 
										                    border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FairMarketValueBeforeTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										           border-color:black;border-left-width:1px;border-right-width:0px; 
										                     border-top-width:0px;border-bottom-width:1px; 
										                               font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/
												PersonalUseProperties [$pos +  1]/FairMarketValueBeforeTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										          border-color:black;border-left-width:1px;border-right-width:0px;  
										                   border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties  
												            [$pos +  2]/FairMarketValueBeforeTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;   
										        border-color:black;border-left-width:1px;border-right-width:0px;  
										                 border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties 
												            [$pos +  3]/FairMarketValueBeforeTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- Line 6 -->
									<tr class="styDepTblRow1">
										<td style="border:none;">
											<span>
												<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
													<span class="styLNLeftNumBoxSD">6</span>
													<div class="styLNDesc" style="width:65mm;text-align:left;">Fair market value 
                       									<b> after </b>casualty or theft
														<span class="styDotLn" style="float:right;">...</span>
													</div>	
												</span>
											</span>	
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
										    vertical-align:bottom;font-weight:bold;border-color:black;border-left-width:1px;border-right-width:0px; 
										    border-top- width:0px;border-bottom-width:1px;text-align:center;font-weight:bold;">6
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										          border-color:black;border-left-width:1px;border-right-width:0px;
										                     border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="FairMarketValueAfterTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										          border-color:black;border-left-width:1px;border-right-width:0px; 
										                    border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties  
												           [$pos + 1]/FairMarketValueAfterTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										          border-color:black;border-left-width:1px;border-right-width:0px;  
										                   border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties  
												           [$pos +  2]/FairMarketValueAfterTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										          border-color:black;border-left-width:1px;border-right-width:0px; 
										                    border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties 
												            [$pos + 3]/FairMarketValueAfterTheftAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- Line 7 -->
									<tr class="styDepTblRow2">
										<td style="border:none;">
											<span>
												<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
													<span class="styLNLeftNumBoxSD">7</span>
													<div class="styLNDesc" style="width:65mm;text-align:left;">Subtract line 6 from line 5
														<span class="styDotLn" style="float:right;">.......</span>
													</div>
												</span>
											</span>	
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
										    vertical-align:bottom;font-weight:bold;border-color:black;border-left-width:1px;border-right-width:0px;  
										    border-top-width:0px;border-bottom-width:1px;text-align:center;">7
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										          border-color:black;border-left-width:1px;border-right-width:0px;  
										                   border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetFairMarketValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										          border-color:black;border-left-width:1px;border-right-width:0px;
										                     border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties 
												            [$pos +  1]/NetFairMarketValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;  
										         border-color:black;border-left-width:1px;border-right-width:0px;  
										                  border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties 
												             [$pos + 2]/NetFairMarketValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom; 
										          border-color:black;border-left-width:1px;border-right-width:0px;  
										                   border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties   
												          [$pos + 3]/NetFairMarketValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- Line 8  -->
									<tr class="styDepTblRow1">
										<td style="border:none;">
											<span>
												<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
													<span class="styLNLeftNumBoxSD">8</span>
													<div class="styLNDesc" style="width:65mm;text-align:left;">Enter the <b>smaller</b> of line 2 or line 7
														<span class="styDotLn" style="float:right;">....</span>
													</div>	
												</span>
											</span>	
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
										    vertical-align:bottom;font-weight:bold;border-color:black;border-left-width:1px;border-right-width:0px;  
										    border-top- width:0px;border-bottom-width:1px;text-align:center;">8
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px; 
										          border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="SmllrOfAdjOrNetFairMrktVlAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" 
										style="vertical-align:bottom;border-color:black;border-left-width:1px;
										border-right-width:0px;border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties
												              [$pos + 1]/SmllrOfAdjOrNetFairMrktVlAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" 
										style="vertical-align:bottom;border-color:black;border-left-width:1px;
										border-right-width:0px; border-top-width:0px;border-bottom-width:1px;
										font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties  
												           [$pos + 2]/SmllrOfAdjOrNetFairMrktVlAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" 
										style="vertical-align:bottom;border-color:black;border-left-width:1px;
										border-right-width:0px;border-top-width:0px;
										border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties    
												         [$pos + 3]/SmllrOfAdjOrNetFairMrktVlAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- Line 9  -->
									<tr class="styDepTblRow2">
										<td style="border:none;">
											<span>
												<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
													<span class="styLNLeftNumBoxSD">9</span>
													<div class="styLNDesc" style="width:65mm;text-align:left;">Subtract line 3 from line 8. If zero or less,
								                        enter -0- 
															<!--<span class="styDotLn" style="float:right;">............</span>-->
													</div>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm; 
										    font-weight:bold;border-color:black;border-left-width:1px;border-right-width:0px;  
										    border-top-width:0px;border-bottom-width:1px;text-align:center;">9
										</td>
										<td class="styTableCellSmall" style="
										border-color:black;border-left-width:1px;border-right-width:0px; 
										          border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="PropertyMinusInsuranceValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="
										border-color:black;border-left-width:1px;border-right-width:0px; 
										          border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties 
												            [$pos + 1]/PropertyMinusInsuranceValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="
										border-color:black;border-left-width:1px;border-right-width:0px; 
										          border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form4684Data/PersonalUseProperties 
												             [$pos + 2]/PropertyMinusInsuranceValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="
										border-color:black;border-left-width:1px;border-right-width:0px; 
										          border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form4684Data/PersonalUseProperties  
												           [$pos + 3]/PropertyMinusInsuranceValueAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</table>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and 
					(count($Form4684Data/BusinessProperties) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 4684, 
						SECTION B, Part I, Line 19 - Casualty
						 or Theft Gain
						 or Loss:</span>
						<div>
							<table class="styDepTbl">
								<xsl:for-each select="$Form4684Data/BusinessProperties">
									<tr style="font-size:7pt;height:6mm;border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when
										 test="position() mod 2 = 1">
										styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellNoBorders" style="text-align:left;width:33mm; 
										          vertical-align:bottom;border-bottom-width:1px;border-right-width:1px;">
                                                 Property <span class="styBoldText"/>
											<xsl:number format="A"/>
										</td>
										<td class="styTableCellNoBorders" style="width:158mm;text-align:left; 
										          border-bottom-width:1px;vertical-align:bottom;border-color: black;">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</table>
						</div>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and
					 (count($Form4684Data/BusinessProperties) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
						Form 4684, SECTION B, Part I, Lines 20-27 - 
						Casualty or Theft 
						Gain or Loss:</span>
						<xsl:for-each select="$Form4684Data/BusinessProperties">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="position() mod 4 = 1">
								<div>
									<xsl:if test="position() != 1">
										<br/>
									</xsl:if>
									<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
										<thead class="styTableThead">
											<tr class="styDepTblHdr">
												<th scope="col">
													<span class="styTableCellPad"/>
												</th>
												<th class="styDepTblCell" 
												style="width:8mm;height:5mm;border:none;" scope="col">
													<span class="styTableCellPad"/>
												</th>
												<th class="styDepTblCell" style="width:100mm;font-size:8pt; 
												            border-color:black;border-left-width:1px;border-right-width:0px; 
												                        border-top-width:1px;border-bottom-width:1px;" colspan="4" scope="col">
		                   							 Properties  
									         </th>
											</tr>
											<tr class="styDepTblHdr">
												<th class="styDepTblCell" style="width:70mm;border:none; 
												            font-size:7pt;text-align:left;padding-left:6mm;
												            font-weight:medium;" scope="col">
													<span class="styTableCellPad"/>
												</th>
												<th class="styDepTblCell" 
												style="width:5mm;height:3mm;border:none;" scope="col">
													<span class="styTableCellPad"/>
												</th>
												<xsl:for-each 
												select="$Form4684Data/BusinessProperties">
													<xsl:if test="(position() &gt;= $pos and position() &lt; $pos+4)">
														<td class="styDepTblCell" scope="col" style="text-align:center; 
														              font-weight:bold;border-color:black;border-left-width:1px;   
														                          border-right-width:0px;border-top-width:0px;
														                          border-bottom-width:1px;">
															<xsl:if test="position() mod 4 =1">
																<xsl:attribute name="style">border-color:black;
																border-left-width:1px;border-right-width:0px;
																border-top-width:0px;border-bottom-width:1px;
																font-weight:bold;text-align:center;</xsl:attribute>
															</xsl:if>
															<xsl:number format="A"/>
															<span class="styTableCellPad"/>
														</td>
													</xsl:if>
												</xsl:for-each>
												<xsl:if test="count($Form4684Data/BusinessProperties[position() 
												             &gt;= $pos  and position() &lt; $pos+4]) = 1">
													<xsl:choose>
														<xsl:when test="count($Form4684Data/BusinessProperties) &lt; 2">
															<td class="styTableCellSmall" style="text-align: center; 
															               font-weight:bold;border-color:black;
															               border-left-width:1px;border-right-width:0px;
															               border-top-width:0px;
															               border-bottom-width:1px;">B<span 
															               class="styTableCellPad"/>
															</td>
															<td class="styTableCellSmall" style="text-align: center; 
															               font-weight:bold;border-color:black;
															               border-left-width:1px; border-right-width:0px;
															               border-top-width:0px;
															               border-bottom-width:1px;">C<span 
															               class="styTableCellPad"/>
															</td>
															<td class="styTableCellSmall" style="text-align: center;
															                font-weight:bold;border-color:black;
															                border-left-width:1px;
															                border-right-width:0px;border-top-width:0px;  
															                              border-bottom-width:1px;">D<span 
															                              class="styTableCellPad"/>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td class="styTableCellSmall" style="border-color:black; 
															               border-left-width:1px;border-right-width:0px; 
															             border-top-width:0px;border-bottom-width:1px;">
																<span class="styTableCellPad"/>
															</td>
															<td class="styTableCellSmall" style="border-color:black; 
															 border-left-width:1px;border-right-width:0px;  
															border-top-width:0px;border-bottom-width:1px;">
																<span class="styTableCellPad"/>
															</td>
															<td class="styTableCellSmall" style="border-color:black;
															 border-left-width:1px;border-right-width:0px; 
															 border-top-width:0px;border-bottom-width:1px;">
																<span class="styTableCellPad"/>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
												<xsl:if test="count($Form4684Data/BusinessProperties[position() 
												             &gt;= $pos  and position() &lt; $pos+4]) = 2">
													<xsl:choose>
														<xsl:when test="count($Form4684Data/BusinessProperties) &lt; 3">
															<td class="styTableCellSmall" style="text-align: center; 
															              font-weight:bold;border-color:black;
															              border-left-width:1px; border-right-width:0px;
															              border-top-width:0px;border-bottom-width:1px;">
														C<span class="styTableCellPad"/>
															</td>
															<td class="styTableCellSmall" style="text-align: center; 
															               font-weight:bold;border-color:black;
															               border-left-width:1px;border-right-width:0px;
															               border-top-width:0px;
															               border-bottom-width:1px;">D<span 
															               class="styTableCellPad"/>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td class="styTableCellSmall" style="border-color:black; 
															               border-left-width:1px;border-right-width:0px; 
															  border-top-width:0px;border-bottom-width:1px;">
																<span class="styTableCellPad"/>
															</td>
															<td class="styTableCellSmall" style="border-color:black; 
														border-left-width:1px;border-right-width:0px;   
															 border-top-width:0px;border-bottom-width:1px;">
																<span class="styTableCellPad"/>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
												<xsl:if test="count($Form4684Data/BusinessProperties[position() 
												             &gt;= $pos  and position() &lt; $pos+4]) = 3">
													<xsl:choose>
														<xsl:when test="count($Form4684Data/BusinessProperties) &lt; 4">
															<td class="styTableCellSmall" style="text-align: center;
															                font-weight:bold;border-color:black;
															                border-left-width:1px;border-right-width:0px;
															                border-top-width:0px;
															                 border-bottom-width:1px;">D<span 
															                 class="styTableCellPad"/>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td class="styTableCellSmall" style="border-color:black;
															                border-left-width:1px;border-right-width:0px;
															               border-top-width:0px;border-bottom-width:1px;">
																<span class="styTableCellPad"/>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
											</tr>
										</thead>
										<!--  line 20  -->
										<tr class="styDepTblRow1">
											<td style="border:none;">
												<span>
													<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
														<span class="styLNLeftNumBox">20</span>
														<span class="styLNDesc" style="width:65mm;text-align:left;">Cost or adjusted basis of each property
															<span class="styDotLn"  style="float:right;">...</span>
														</span>	
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB " style="width:5mm;
											            border-top-width:1px;font-weight:bold;border-color:black;
											            vertical-align:bottom;  border-left-width:1px;
											            border-right-width:0px;border-top-width:1px;
											             border-bottom-width:1px;text-align:center;">20<span
											              class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;  
											                       border-top-width:0px;border-bottom-width:1px;
											                                    text-align:right;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="CostOrAdjustedBasisAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;
											                         border-top-width:0px;border-bottom-width:1px;
											                                      text-align:right;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties   
													            [$pos + 1]/CostOrAdjustedBasisAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;   
											                      border-top-width:0px;border-bottom-width:1px;  
											                                 text-align:right;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties  
													             [$pos +  2]/CostOrAdjustedBasisAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;  
											           border-left-width:1px;border-right-width:0px;  
											                      border-top-width:0px;border-bottom-width:1px; 
											                                  text-align:right;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="$Form4684Data/BusinessProperties    
													            [$pos +  3]/CostOrAdjustedBasisAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!--  line 21  -->
										<tr class="styDepTblRow2">
											<td style="border:none;">
												<span>
													<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
														<span class="styLNLeftNumBox">21</span>
														<div class="styLNDesc" style="width:65mm;text-align:left;">Insurance or other reimbursement (whether or not
													you filed a claim).  See the instructions for line 3 
														</div>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB " style="width:5mm;border-top-width:1px;font-weight:bold;
											        border-color:black;vertical-align:bottom;border-left-width:1px;border-right-width:0px;
											        border-top-width:1px;border-bottom-width:1px;text-align:center;">21
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											           border-left-width:1px;border-right-width:0px;
											                        border-top-width:0px;border-bottom-width:1px;  
											                                   text-align:right;font-size:6pt;padding-top:5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="InsuranceOrOthReimbursementAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px;
											                         border-bottom-width:1px;text-align:right;font-size:6pt;padding-top:5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties[$pos + 1]/InsuranceOrOthReimbursementAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="border-color:black; 
												             border-left-width:1px;border-right-width:0px;border-top-width:0px; 
												                          border-bottom-width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                        border-bottom-width:1px;text-align:right;font-size:6pt;padding-top:5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties      
													         [$pos + 2]/InsuranceOrOthReimbursementAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="border-color:black;  
												            border-left-width:1px;border-right-width:0px;
												            border-top-width:0px;              border-bottom-width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											            border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                        border-bottom-width:1px;text-align:right;font-size:6pt;padding-top:5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties     
													          [$pos + 3]/InsuranceOrOthReimbursementAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- line 22 -->
										<tr class="styDepTblRow1">
											<td style="border:none;">
												<span>
													<span style="width:73mm;font-size:7pt;padding-top:1mm;">
														<span class="styLNDesc" style="width:73mm;font-style: normal;padding-left:5mm;"><b>Note:  </b>
															If line 20 is <b>more</b> than line 21, skip line 22.
														</span>
													</span>
												</span>
												<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
													<span class="styLNLeftNumBox">22</span>
													<div class="styLNDesc" style="height:auto;width:65mm;text-align:left;">Gain from casualty or theft. If line 21 is 
													   <b>more </b>than line 20, enter the difference here and on line 29 or line 34, column (c), except 
															as provided in the instructions for line 33. Also, skip lines 23 through 27 for that column.  See the instructions for line 4 if line 21
															includes insurance or other reimbursement you did not	claim, or you received payment for your loss in a later tax year
															<span class="styDotLn" style="float:right;">........</span>
													</div>
												</span>
											</td>
											<!-- line 22-2 -->
											<td class="styIRS4684TableCellSmallRB " style="width:5mm;vertical-align:bottom; 
											             font-weight:bold;border-left-width:1px;border-right-width:1px;
											             border-top-width:0px; border-bottom-width:1px;
											             border-color:black;text-align:center;">22
											</td>
											<td class="styTableCellSmall" 
											style="vertical-align:bottom;border-left-width:0px;
											                border-right-width:1px;border-top-width:0px;border-bottom-width:1px; 
											                               border-color:black;text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="GainFromCasualtyOrTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall"
											 style="vertical-align:bottom;border-left-width:0px; 
											            border-right-width:1px;border-top-width:0px;
											            border-bottom-width:1px;border-color:black;text-align:right;
											            font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties  
													            [$pos +1]/GainFromCasualtyOrTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
											border-left-width:0px;border-right-width:1px;
											border-top-width:0px;border-bottom-width:1px;border-color:black;
											text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="$Form4684Data/BusinessProperties
													                [$pos + 2]/GainFromCasualtyOrTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" 
											style="vertical-align:bottom;border-color:black;  border-left-width:1px;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties [$pos + 3]/GainFromCasualtyOrTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!--   Line 23 -->
										<tr class="styDepTblRow2">
											<td style="border:none;">
												<span>
													<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
														<span class="styLNLeftNumBox">23</span>
														<div class="styLNDesc" style="width:65mm;text-align:left;">
															Fair market value <b> before </b> casualty or theft															
															<span class="styDotLn" style="float:right;">..</span>
														</div>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB " 	style="width:5mm; border-top-width:1px;font-weight:bold;
												border-color:black;border-left-width:1px;border-right-width:0px;
												border-top-width:1px;border-bottom-width:1px;
												text-align:center;">23
											</td>
											<td class="styTableCellSmall" 
											style="vertical-align:bottom;border-left-width:1px;border-right-width:1px; 
											                border-top-width:0px;border-bottom-width:1px;border-color:black; 
											                                text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="FairMarketValueBeforeTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
											                  border-left-width:0px;border-right-width:1px;
											                  border-top-width:0px;
											                                   border-bottom-width:1px;border-color:black;
											                                   text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="$Form4684Data/BusinessProperties 
													               [$pos + 1]/FairMarketValueBeforeTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom; 
											            border-left-width:0px;border-right-width:1px;border-top-width:0px; 
											                        border-bottom-width:1px;border-color:black;
											                        text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													select="$Form4684Data/BusinessProperties   
													            [$pos + 2]/FairMarketValueBeforeTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;   
											          border-color:black;border-left-width:1px;border-right-width:0px; 
											                      border-top-width:0px;border-bottom-width:1px;
											                      text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties     
													          [$pos + 3]/FairMarketValueBeforeTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 24 -->
										<tr class="styDepTblRow1">
											<td style="border:none;">
												<span>
													<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
														<span class="styLNLeftNumBox">24</span>
														<div class="styLNDesc" style="width:65mm;text-align:left;">
															Fair market value <b> after </b> casualty or theft																
															<span class="styDotLn" style="float:right;">...</span>
														</div>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB " style="width:5mm;
											    border-top-width:1px;font-weight:bold;border-color:black;border-left-width:1px;border-right-width:0px;
											    border-top-width:1px;border-bottom-width:1px;text-align:center;">24
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											           border-left-width:1px;border-right-width:0px;border-top-width:0px;
											                       border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="FairMarketValueAfterTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											           border-left-width:1px;border-right-width:0px;border-top-width:0px; 
											                      border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties 
													             [$pos + 1]/FairMarketValueAfterTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="border-color:black;
												             border-left-width:1px;border-right-width:0px;
												             border-top-width:0px; border-bottom-width:1px;"/>
											</td>
											<td class="styTableCellSmall" 
											style="border-color:black; border-left-width:1px;
											border-right-width:0px;border-top-width:0px; 
											           border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties 
													             [$pos + 2]/FairMarketValueAfterTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="border-color:black; 
												            border-left-width:1px;border-right-width:0px;border-top-width:0px; 
												                        border-bottom-width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black; 
											           border-left-width:1px;border-right-width:0px;border-top-width:0px;
											                       border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties   
													           [$pos + 3]/FairMarketValueAfterTheftAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!--  Line 25   -->
										<tr class="styDepTblRow2">
											<td style="border:none;">
												<span>
													<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
														<span class="styLNLeftNumBox">25</span>
														<div class="styLNDesc" style="width:65mm;text-align:left;">Subtract line 24 from line 23															
															<span class="styDotLn" style="float:right;">.....</span>
														</div>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB " style="width:5mm;
											    font-weight:bold;border-color:black;border-left-width:1px;border-right-width:0px; 
											    border-top- width:0px;border-bottom-width:1px;text-align:center;">25
											</td>
											<td class="styTableCellSmall" 
											style="border-color:black;border-left-width:1px;border-right-width:0px; 
											           border-top-width:0px;border-bottom-width:1px;font-size:6pt;
											           text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="NetFairMarketValueAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
											border-left-width:1px;border-right-width:0px;  
											          border-top-width:0px;border-bottom-width:1px;font-size:6pt;
											          text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="$Form4684Data/BusinessProperties  
													             [$pos + 1]/NetFairMarketValueAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" 
											style="border-color:black;border-left-width:1px;border-right-width:0px; 
											           border-top-width:0px;border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="$Form4684Data/BusinessProperties   
													           [$pos + 2]/NetFairMarketValueAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" 
											style="border-color:black;border-left-width:1px;border-right-width:0px; 
											           border-top-width:0px;border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties    
													          [$pos + 3]/NetFairMarketValueAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!--  Line 26   -->
										<tr class="styDepTblRow1">
											<td style="border:none;">
												<span>
													<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
														<span class="styLNLeftNumBox">26</span>
														<div class="styLNDesc" style="width:65mm;text-align:left;">Enter the <b> smaller </b> of line 20
														or line 25														
															<span class="styDotLn" style="float:right;">...</span>
															</div>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm;  
											    font-weight:bold;border-color:black;border-left-width:1px;border-right-width:0px;border-top-width:0px;
											    border-bottom-width:1px;text-align:center;">26
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom; 
											           border-color:black;border-left-width:1px;border-right-width:0px;
											                       border-top-width:0px;border-bottom-width:1px;font-size:6pt;
											                       text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="SmllrOfCostOrNetFairMrktVlAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom; 
											           border-color:black;border-left-width:1px;border-right-width:0px;
											                      border-top-width:0px;border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties      
													        [$pos + 1]/SmllrOfCostOrNetFairMrktVlAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;   
											         border-color:black;border-left-width:1px;border-right-width:0px;
											                     border-top-width:0px;border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="$Form4684Data/BusinessProperties    
													           [$pos + 2]/SmllrOfCostOrNetFairMrktVlAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;  
											          border-color:black;border-left-width:1px;border-right-width:0px;  
											                    border-top-width:0px;border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties   
													           [$pos + 3]/SmllrOfCostOrNetFairMrktVlAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!--   Line 27   -->
										<tr class="styDepTblRow2">
											<td style="border:none;">
												<span>
													<span  style="width:73mm;font-size:7pt;padding-top:1mm;padding-bottom:1mm;">
														<span class="styLNDesc" style="height:auto;width:73mm;font-style: normal;padding-left:8mm;text-align:left;"><b>Note: </b>
																 If the property was totally destroyed by casualty or lost from theft, enter on line 26 the amount from line 20.
														</span>
													</span>	
													<span class="styGenericDiv" style="width:73mm;font-size:7pt;">
														<span class="styLNLeftNumBox">27</span>
														<div class="styLNDesc" style="height:auto;width:65mm;text-align:left;">Subtract line 21 from line 26. If zero or less,
																	enter -0- 
																<span class="styDotLn" style="float:right;">..............</span>
														</div>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm;vertical-align:bottom;
												font-weight:bold;border-color:black;border-left-width:1px; border-right-width:0px;
												border-top-width:0px; border-bottom-width:1px;background-color:lightgrey;text-align:center;">
												<div style="width:9mm;height:6mm;vertical-align:bottom;text-align:center;padding-top:2mm;">
													<span style="height:4mm;width:9mm;background-color:white;border-right-width:1px;
														padding-top:1mm; text-align:center;"><b>27</b>
													</span>
												</div>
											</td>
											<td class="styTableCellSmall" style="	vertical-align:bottom;font-size:6pt;text-align:right; border-color:black;border-left-width:1px;
											border-right-width:0px; border-top-width:0px;border-bottom-width:1px;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" 
														select="NetBusinessPropertyLossAmt"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 30 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode" 
														select="NetBusinessPropertyLossAmt/@seeAttachedStatementCd"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="NetBusinessPropertyLossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;font-size:6pt;text-align:right;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;border-color:black;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" 
														select="$Form4684Data/BusinessProperties[$pos+ 1]/NetBusinessPropertyLossAmt"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 30 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode"
														 select="$Form4684Data/BusinessProperties[$pos+1]/NetBusinessPropertyLossAmt/@seeAttachedStatementCd"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties 
													              [$pos + 1]/NetBusinessPropertyLossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall"
											 style="vertical-align:bottom;font-size:6pt;text-align:right; 
											             border-left-width:1px;border-right-width:0px;
											             border-top-width:0px; border-bottom-width:1px;
											             border-color:black;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" 
														select="$Form4684Data/ BusinessProperties[$pos+2]
														/NetBusinessPropertyLossAmt"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 30 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode" 
														select="$Form4684Data/BusinessProperties[$pos+2]/NetBusinessPropertyLossAmt/@seeAttachedStatementCd"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties[$pos + 2]
													/NetBusinessPropertyLossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" 
											style="vertical-align:bottom;font-size:6pt;text-align:right;
											             border-color:black;border-left-width:1px;border-right-width:0px;
											                          border-top-width:0px;border-bottom-width:1px;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form4684Data/
														                BusinessProperties[$pos+3]
														                /NetBusinessPropertyLossAmt"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 30 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$Form4684Data/
														BusinessProperties[$pos+3]
														/NetBusinessPropertyLossAmt/@seeAttachedStatementCd"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form4684Data/BusinessProperties
													               [$pos + 3]/NetBusinessPropertyLossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</table>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($Form4684Data/ShortTermTheftProperty) &gt; 2)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 4684, SECTION B, Part II, Line 29 - 
						Casualty or Theft of Property Held One Year or Less:</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:89mm;" scope="col" colspan="1">
										<span class="styPartDesc" 
										style="width:89mm;padding-left:1mm; font-size: 7pt;">
								                 Summary of Gains and Losses <span class="styNormalText">
								                 (from separate Parts I)</span>
										</span>
									</th>
									<th class="styDepTblCell" style="width:64mm;font-weight:normal;" 
									colspan="2" scope="col">
										<span style="font-weight:bold;">
						                 (b) 
						               </span> Losses from casualties or thefts
						             </th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;
									vertical-align:middle;" rowspan="2" scope="col">
										<span style="font-weight:bold;">
						                 (c)
						               </span> Gains from casualties or thefts includible in income
						             </th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:89mm;vertical-align:middle;"
									 scope="col" colspan="1">
										<span class="styGenericDiv" style="width:89mm;padding-left:2mm;
										           text-align:center;font-weight:normal;">
											<span class="styBoldText">(a)</span> Identify casualty or theft
               						 	</span>
									</th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;" 
									scope="col">
										<span class="styItalicText">(i) </span>Trade, business, rental 
										or royalty property
             							</th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;"
									 scope="col">
										<span class="styItalicText">(ii) </span> Income-producing and
										 employee property
             							</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:89mm;text-align:center"
									 scope="col" colspan="4">
									  Casualty or Theft of Property Held One Year or Less	
									</th>
								</tr>
							</thead>
								<xsl:for-each select="$Form4684Data/ShortTermTheftProperty">
								<tr style="height:4mm;border-color:black;">
									<xsl:choose>
										<xsl:when test="position() mod 2 = 1">
											<xsl:attribute name="class">styDepTblRow1</xsl:attribute>
										</xsl:when>
										<xsl:otherwise>
											<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
										</xsl:otherwise>
									</xsl:choose>
									<td class="styTableCell" style="width:89mm;text-align:left;">
										<xsl:if test="position()=1">
											<xsl:attribute name="style">border-top-width:1px;width:81mm;
											text-align:left;
											</xsl:attribute>
										</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="CasualtyOrTheftDesc"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:32mm;">
										<xsl:if test="position()=1">
											<xsl:attribute name="style">border-top-width:1px;</xsl:attribute>
										</xsl:if>
										<xsl:call-template name="PopulateNegativeNumber">
											<xsl:with-param name="TargetNode"
											 select="TradeOrRentalPropertyAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:32mm;">
										<xsl:if test="position()=1">
											<xsl:attribute name="style">border-top-width:1px;</xsl:attribute>
										</xsl:if>
										<xsl:call-template name="PopulateNegativeNumber">
											<xsl:with-param name="TargetNode" 
											select="IncomeProducingPropertyAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:32mm;">
										<xsl:if test="position()=1">
											<xsl:attribute name="style">border-top-width:1px;</xsl:attribute>
										</xsl:if>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="GainsFromCasualtiesOrTheftAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
					<!-- If Optional Print feature is ON and there is more than 2 sets of repeating data, print comment -->
					<!-- "See Additional Table" and print empty rows.-->
					<xsl:if test="($Print = $Separated) and (count($Form4684Data/LongTermTheftProperty) &gt; 2)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 4684, SECTION B, Part II, Line 34 -
						 Casualty or Theft of 
						Property Held More Than One Year:</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:89mm;" scope="col" colspan="1">
										<span class="styPartDesc" style="width:89mm;padding-left:1mm;
										 font-size: 7pt;">
							                 Summary of Gains and Losses <span class="styNormalText">
							                 (from separate Parts I)</span>
										</span>
									</th>
									<th class="styDepTblCell" style="width:64mm;font-weight:normal;"
									 colspan="2" scope="col">
										<span style="font-weight:bold;">
						                 (b) 
						               </span> Losses from casualties or thefts
						             </th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;
									vertical-align:middle;" rowspan="2" scope="col">
										<span style="font-weight:bold;">
							                 (c)
							               </span> Gains from casualties or thefts includible in income
							             </th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:89mm;vertical-align:middle;" 
									scope="col" colspan="1">
										<span class="styGenericDiv" style="width:89mm;padding-left:2mm; 
										          text-align:center;font-weight:normal;">
											<span class="styBoldText">(a)</span> Identify casualty or theft
               							</span>
									</th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;" 
									scope="col">
										<span class="styItalicText">(i) </span>Trade, business, rental or
										 royalty property
             							</th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;" 
									scope="col">
										<span class="styItalicText">(ii) </span> Income-producing and 
										employee property
             						</th>
								</tr>
							</thead>
							<xsl:for-each select="$Form4684Data/LongTermTheftProperty">
								<tr style="border-color:black;">
									<xsl:choose>
										<xsl:when test="position() mod 2 = 1">
											<xsl:attribute name="class">styDepTblRow1</xsl:attribute>
										</xsl:when>
										<xsl:otherwise>
											<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
										</xsl:otherwise>
									</xsl:choose>
									<td class="styTableCell" style="width:89mm;text-align:left;height:4mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="CasualtyOrTheftDesc"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:32mm;height:4mm;">
										<xsl:call-template name="PopulateNegativeNumber">
											<xsl:with-param name="TargetNode" 
											select="TradeOrRentalPropertyAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:32mm;height:4mm;">
										<xsl:call-template name="PopulateNegativeNumber">
											<xsl:with-param name="TargetNode" 
											select="IncomeProducingPropertyAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:32mm;height:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="GainsFromCasualtiesOrTheftAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="AddPositionNumber">
		<xsl:if test="position()=1">
    Property <span class="styBoldText">A</span>
		</xsl:if>
		<xsl:if test="position()=2">
    Property <span class="styBoldText">B</span>
		</xsl:if>
		<xsl:if test="position()=3">
    Property <span class="styBoldText">C</span>
		</xsl:if>
		<xsl:if test="position()=4">
    Property <span class="styBoldText;">D</span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AddPositionNumber2">
		<xsl:if test="position()=1">
    A
  </xsl:if>
		<xsl:if test="position()=2">
    B
  </xsl:if>
		<xsl:if test="position()=3">
    C
  </xsl:if>
		<xsl:if test="position()=4">
    D
  </xsl:if>
	</xsl:template>
</xsl:stylesheet>
