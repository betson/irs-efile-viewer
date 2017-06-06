<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4684Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!--  Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="Form4684Data" select="$RtnDoc/IRS4684"/>
	<xsl:template match="/">
		<html>
			<head>
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
			<body class="styBodyClass">
				<form name="Form4684">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!-- Begin Form title an dForm number section -->
					<div class="styBB" style="width:187mm;clear:both;float:none;">
						<div class="styFNBox" style="width:31mm;height:20mm;">
        		Form <span class="styFormNumber">4684</span>
							<br/>
							<!--General Dependency Push Pin -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form4684Data"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 4684, Top Left Margin - Revenue Procedure 2009-20 Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form4684Data/@revenueProcedure200920Cd"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:13mm;">
							<div class="styMainTitle" style="padding-top:1mm;">
              					Casualties and Thefts
        	</div>
							<br/>
							<div class="styFST" style="font-size:7pt;">
								<img src="{$ImagePath}/4684_Bullet.gif" alt="bullet image"/>
             						See separate instructions.
       </div>
							<div class="styFST" style="font-size:7pt;">
								<img src="{$ImagePath}/4684_Bullet.gif" alt="bullet image"/>
          						 Attach to your tax return.
       </div>
							<div class="styFST" style="font-size:7pt;">
								<img src="{$ImagePath}/4684_Bullet.gif" alt="bullet image"/>
              						Use a separate Form 4684 for each casualty or theft.
        </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:13mm;">
							<div class="styOMB" style="height:2mm;">
             					OMB No. 1545-0177
        	</div>
							<div class="styTY" style="height:4mm;font-size:19pt;">
              					20<span class="stytycolor">10</span>
							</div>
							<div class="styOMB" style="height:3mm;border-bottom-width:0px; 
							text-align: center;">Attachment <br/>	Sequence No.
							 <span class="styBoldText">26</span>
							</div>
						</div>
					</div>
					<!-- End form title and Form number Section -->
					<div class="styBB" style="width:187mm;clear:Both;">
						<div class="styNameBox" style="width:144mm;height:8mm;font-size:7pt;">
							<b>Name(s) shown on tax return</b>
							<br/>
<!--							<xsl:choose>
								<xsl:when test="/AppData/Parameters/SubmissionType='CIT'">-->
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
									</xsl:call-template>
	<!--							</xsl:when>
								<xsl:otherwise>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>-->
						</div>
						<div class="styEINBox" style="width:42mm;height:4mm;padding-left:2mm;font-size:7pt;">
            				Identifying number<br/>
							<br/>
							<span style="width:38mm;text-align:left;font-weight:normal;">
<!--								<xsl:choose>
									<xsl:when test="/AppData/Parameters/SubmissionType='CIT'">-->
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
<!--									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>-->
							</span>
						</div>
					</div>
					<!-- End form title and form number section -->
					<!-- Begin Section A -->
					<div class="styBB" style="width:187mm;clear:both;float:none;">
						<!-- Added clear:both attribute -->
						<div class="styIRS4684ScheduleName" style="font-size: 8pt; width: 22mm;">SECTION A&#151;
		</div>
						<div class="styPartDesc" style="font-weight: normal; font-size:8pt; width: 156mm;
				 padding-left: 0px;">
							<span class="styBoldText">Personal Use Property</span>
				(Use this section to report casualties and thefts of property 
				<span class="styBoldText">not</span>
            				used in a trade
            				 or business or for income-producing purposes.)
            				</div>
						<xsl:if test="(count($Form4684Data/PersonalUseProperties) &gt; 4) and ($Print != 
						$Separated)">
							<span class="styGenericDiv" style="float: right;clear:none;width:7mm;padding-top:4mm;padding-right:.5mm;text-align:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties"/>
									<xsl:with-param name="containerHeight" select="4"/>
									<xsl:with-param name="containerID" select=" 'PDctn' "/>
								</xsl:call-template>
							</span>
						</xsl:if>
					</div>
					<!-- End section A-->
					<!-- Begin properties description Section -->
					<div class="styIRS4684TableContainer" id="PDctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" name="TY1Table" id="TY1Table">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS4684TableCellHeaderNoBorders" style="width:8mm;font-size:7pt;
                 			    	text-align:left;font-weight:bold;vertical-align:top;">
										<span style="width:8mm;padding-left:2.5mm">1</span>
									</th>
									<th class="styIRS4684TableCellHeaderNoBorders" style="width:178mm;
								font-size:7pt;text-align:left;font-weight:normal;" colspan="2">
								Description of properties (show type, location, and date acquired for each property). 
                  				Use a separate line for each property lost or damaged from the same casualty or theft.
              	</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or ( ($Print = $Separated)
								 and (count ($Form4684Data/PersonalUseProperties) &lt;= 4) )">
									<xsl:for-each select="$Form4684Data/PersonalUseProperties">
										<tr style="font-size:7pt;height:6mm;">
											<td class="styTableCellNoBorders" style="text-align:left;width:8mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellNoBorders" style="text-align:left;
								       width:25mm;padding-left:0mm;vertical-align:bottom;">
                 					    Property <span class="styBoldText">
													<xsl:number format="A"/>
												</span>
											</td>
											<td class="styTableCellNoBorders" style="width:158mm;
											text-align:left;padding-left:0mm;border-bottom-width:1px;
											vertical-align:bottom;border-color: black;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DescriptionOfProperty"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($Form4684Data/PersonalUseProperties) &lt; 1) or
								 (($Print = $Separated) and (count($Form4684Data/PersonalUseProperties)
								  &gt; 4))">
									<tr style="height:6mm;font-size:7pt;">
										<td class="styTableCellNoBorders" style="text-align:left;width:8mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="text-align:left;width:25mm;
										                    padding-left:0mm;vertical-align:bottom;">
                   							Property <span class="styBoldText">A</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="width:158mm;text-align:left;
										padding-left:3mm;border-bottom-width:1px;vertical-align:center;border-color:black;
										text-align:left;">
											<xsl:choose>
												<xsl:when test="(($Print = $Separated) and 
												(count ($Form4684Data/PersonalUseProperties) &gt; 4))">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<span class="styTableCellPad"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($Form4684Data/PersonalUseProperties) &lt; 2)  or 
								(($Print = $Separated) and (count($Form4684Data/PersonalUseProperties) &gt; 4))">
									<tr style="height:6mm;font-size:7pt;">
										<td class="styTableCellNoBorders" style="text-align:left;width:8mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="text-align:left;width:25mm;
										       padding-left:0mm;vertical-align:bottom;">
                   							Property <span class="styBoldText">B</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="width:158mm;text-align:left;
										       padding-left:3mm;border-bottom-width:1px;vertical-align:bottom;
										       border-color: black;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($Form4684Data/PersonalUseProperties) &lt; 3) 
								 or (($Print = $Separated) and 
								(count($Form4684Data/PersonalUseProperties) &gt; 4))">
									<tr style="height:6mm;font-size:7pt;">
										<td class="styTableCellNoBorders" style="text-align:left;width:8mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="text-align:left;width:25mm;
										padding-left:0mm;vertical-align:bottom;">
                    						Property <span class="styBoldText">C</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="width:158mm;text-align:left;
										       padding-left:3mm;border-bottom-width:1px;vertical-align:bottom;
									           border-color: black;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($Form4684Data/PersonalUseProperties) &lt; 4)  or
								 (($Print = $Separated) and (count($Form4684Data/PersonalUseProperties) 
								 &gt; 4))">
									<tr style="height:6mm;font-size:7pt;">
										<td class="styTableCellNoBorders" style="text-align:left;width:8mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="text-align:left;width:25mm;
										padding-left:0mm;vertical-align:bottom;">
                    						Property <span class="styBoldText">D</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="width:158mm;text-align:left;
									           padding-left:3mm;border-bottom-width:1px;vertical-align:bottom;
									           border-color: black;">
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
					<br/>
					<!-- End properties description section -->
					<xsl:if test="(count($Form4684Data/PersonalUseProperties) &gt; 4) and 
					        ($Print!= Separated)">
						<div class="styGenericDiv" style="width:187;clear:both;float:none;"/>
					</xsl:if>
					<!-- Start Properties table -->
					<!-- <xsl:choose> -->
					<xsl:if test="(($Print != $Separated) or (count($Form4684Data/PersonalUseProperties)
					 &lt;= 4)) and ((count($Form4684Data/PersonalUseProperties) &gt; 0))">
						<xsl:for-each select="$Form4684Data/PersonalUseProperties">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="position() mod 4 = 1">
								<table class="styTable" cellspacing="0">
									<tr>
										<th>
											<span class="styTableCellPad"/>
										</th>
										<th style="width:8mm;color:lightgrey;height:5mm;">
											<span class="styTableCellPad"/>
										</th>
										<th class="styTableCellHeader" style="width:100mm;font-size:8pt;
										        	 border-color: black;border-left-width:1px;border-right-width:0px;
										            border-bottom-width:1px;border-top-width:1px" colspan="4" scope="col">
                    		    					Properties 
										</th>
									</tr>
									<tr>
										<th style="width:60mm;border:none;font-size:7pt;text-align:
										left;padding-left:6mm;font-weight:medium">
											<span class="styTableCellPad"/>
										</th>
										<th style="width:5mm;height:3mm;
											border-left-width:0px;border-right-width:1px;border-top-width:0px;
											border-bottom-width:1px">
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
															border-left-width:1px;border-right-width:0px;border-top-width:0px;
															border-bottom-width:1px;text-align:center;font-weight:bold;</xsl:attribute>
													</xsl:if>
													<xsl:number format="A"/>
													<span class="styTableCellPad"/>
												</td>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="count($Form4684Data/PersonalUseProperties[position() 
											&gt;= $pos  and 
											position() &lt; $pos+4]) = 1">
											<xsl:choose>
												<xsl:when test="count($Form4684Data/PersonalUseProperties) &lt; 2">
													<td class="styTableCellSmall" style="text-align:center;
														border-color:black;border-left-width:1px;border-right-width:0px; 
														border-top-width:0px;border-bottom-width:1px;
														border-color:black;font-weight:bold">B
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="text-align:center;
														border-left-width:1px;border-right-width:0px;
														 border-top-width:0px;border-bottom-width:1px;border-color:black;
														 font-weight:bold;">C<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="text-align:center;
														font-weight:bold;
														border-left-width:1px;border-right-width:0px;
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
											 &gt;= $pos  and
											 position() &lt; $pos+4]) = 2">
											<xsl:choose>
												<xsl:when test="count($Form4684Data/PersonalUseProperties) &lt; 3">
													<td class="styTableCellSmall" style="text-align:center;font-weight:bold;
													border-color:black;
													     	border-left-width:1px;border-right-width:0px;
													     	border-top-width:0px;border-bottom-width:1px;">C
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="text-align:center;
														font-weight:bold;border-color:black;border-left-width:1px;
														border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
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
										<xsl:if test="count($Form4684Data/PersonalUseProperties[position()
											 &gt;= $pos  and position() &lt; $pos+4]) = 3">
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
									<tr>
										<td style="border:none;" scope="row">
											<span>
												<span class="styGenericDiv" style="width:8mm;
													font-weight:bold;border-top-width:1px;font-size:7pt;
													padding-left:2.5mm;">2</span>
												<span class="styGenericDiv" style="width:64mm;font-size:7pt;">
													<span>
														<span style="float:left;">
Cost or other basis of each property</span>
														<span class="styBoldText" style="float:right;font-size:8pt;">
															<span class="styDotLn">....</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:4mm;
									        		vertical-align:bottom;border-left-width:1px;border-right-width:0px;
									        		border-top-width:1px;border-bottom-width:1px;border-color:black;
									        		padding-left:1.5mm	">
											<b>2</b>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black;
															border-left-width:1px;border-right-width:0px;border-top-width:0px;
										                 	border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisOfEachProp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black;
										        	border-left-width:1px;border-right-width:0px;border-top-width:0px;
										        	border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +    
													                        1]/CostOrOtherBasisOfEachProp"/>
											</xsl:call-template>
											<span class="styTableCellPad" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black;
										        	border-left-width:1px;border-right-width:0px;border-top-width:0px;
											        border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +   
													                        2]/CostOrOtherBasisOfEachProp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="border-left-width:1px;
											border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +   
													                         3]/CostOrOtherBasisOfEachProp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr>
										<td style="border:none;">
											<span>
												<span class="styGenericDiv" style="width:8mm;
													font-size:7pt;padding-left:2.5mm;font-weight:bold;">3</span>
												<span class="styGenericDiv" style="width:64mm;font-size:7pt;"> 
                      									Insurance or other reimbursement (whether or
                      									<span>
														<span style="float:left;">
                      									not you filed a claim) (see instructions)</span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">...</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
											vertical-align:bottom;
											font-weight:bold;border-left-width:1px;
											border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;border-color:black">
											<b>3</b>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											border-left-width:1px;border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="InsuranceOrOtherReimbursement"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											;border-left-width:1px;border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;border-color:black">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos + 
													  1]/InsuranceOrOtherReimbursement"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											border-left-width:1px;border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +                  
													          2]/InsuranceOrOtherReimbursement"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											border-color:black;border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +    
													                       3]/InsuranceOrOtherReimbursement"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr>
										<td style="border:none;font-size:7pt;">
											<span style="padding-left:8mm;">
												<span class="styItalicText" style="width:66mm;">
													<span class="styBoldText">Note:</span> If line 2 is 
                       											<span class="styBoldText">  more </span> than line 3, 
                       											skip line 4.</span>
												<span class="styGenericDiv" style="width:8mm;padding-top:1mm;
													font-weight:bold;padding-left:2.5mm">4</span>
												<span class="styGenericDiv" style="width:66mm;padding-top:1mm;">
                        									Gain from casualty or theft. If line 3 is <span class="styBoldText">
									                    more</span> than line 2, enter the difference here and skip lines 5
									                    through 9 for that column. See instructions if line 3 includes insurance 
									                    or other reimbursement you did not claim, or you received payment for your
									                    <span>
														<span style="float:left;">
									                     loss in a later tax year</span>
														<span class="styBoldText" style="float:right;padding-right:2mm;">
															<span class="styDotLn">.........</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
											vertical-align:bottom;	font-weight:bold;border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;background-color:lightgrey;
											border-color:black;padding-top:20mm">
											<span style="height:4mm;width:8mm;background-color:white;
											padding-right:4mm;padding-top:2mm;padding-left:3.5mm;w">
												<b>4</b>
											</span>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											        border-left-width:1px;border-right-width:0px;border-top-width:0px;
											       border-bottom-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainFromCasualtyOrTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											border-left-width:1px;border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +  
													                         1]/GainFromCasualtyOrTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											border-left-width:1px;border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +    
													                       2]/GainFromCasualtyOrTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										        	border-color:black;border-left-width:1px;border-right-width:0px;
										        	border-top-width:0px;border-bottom-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/
												PersonalUseProperties[$pos +   3]/GainFromCasualtyOrTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 5  -->
									<tr>
										<td style="border:none;font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;
													font-weight:bold; padding-left:2.5mm;">5</span>
												<span class="styGenericDiv" style="width:64mm;">
													<span>
														<span style="float:left;">Fair market value 
                       										<span class="styBoldText">before</span> casualty or theft</span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">..</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
											       vertical-align:bottom;padding-left:1mm;font-weight:bold;
											       border-left-width:1px;border-right-width:0px;border-top-width:0px;
											       border-bottom-width:1px;border-color:black;">
											<b>5</b>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											       border-left-width:1px;border-right-width:0px;border-top-width:0px;
											       border-bottom-width:1px;border-color:black">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FairMarketValueBeforeTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										        	border-left-width:1px;border-right-width:0px;border-top-width:0px;
										        	border-bottom-width:1px;border-color:black">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +  
													                         1]/FairMarketValueBeforeTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										        	border-left-width:1px;border-right-width:0px;border-top-width:0px;
									         		border-bottom-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +   
													                        2]/FairMarketValueBeforeTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											border-left-width:1px;border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;border-color:black">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +   
													                        3]/FairMarketValueBeforeTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- line 6  -->
									<tr>
										<td style="border:none;font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;
													font-weight:bold;
													padding-left:2.5mm">6</span>
												<span class="styGenericDiv" style="width:64mm;">
													<span>
														<span style="float:left;">
														Fair market value <span class="styBoldText"> after </span>casualty or theft</span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">...</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										        	vertical-align:bottom;font-weight:bold;border-left-width:1px;
								         			border-right-width:0px;border-top-width:0px;
								         			border-bottom-width:1px;border-color:black;padding-left:1mm">
											<b>6</b>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										        	border-left-width:1px;border-right-width:0px;border-top-width:0px;
											        border-bottom-width:1px;border-color:black">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FairMarketValueAfterTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											border-left-width:1px;border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +    
													                       1]/FairMarketValueAfterTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											border-left-width:1px;border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;border-color:black">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +       
													                    2]/FairMarketValueAfterTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
									        		border-color:black;border-left-width:1px;border-right-width:0px;
									         		border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +      
													                     3]/FairMarketValueAfterTheft"/>
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
												<span class="styGenericDiv" style="width:64mm;">
													<span>
														<span style="float:left;">
													 Subtract line 6 from line 5</span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">........</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										        	vertical-align:bottom;font-weight:bold;border-left-width:1px;
										         	border-right-width:0px;border-top-width:0px;
										        	border-bottom-width:1px;border-color:black;padding-left:1mm">
											<b>7</b>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;border-color:black">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FairMarketValueDifference"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;border-color:black">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +    
													                       1]/FairMarketValueDifference"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											border-color:black;border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +       
													                    2]/FairMarketValueDifference"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											border-color:black;border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos + 
													                          3]/FairMarketValueDifference"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr>
										<td style="font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;font-weight:bold;
													padding-left:2.5mm">8</span>
												<span class="styGenericDiv" style="width:64mm;">
													<span>
														<span style="float:left;"> Enter the <span class="styBoldText"> smaller </span>
														 of line 2 or line 7</span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">....</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										     	vertical-align:bottom;font-weight:bold;border-color:black;
									     		border-left-width:1px;border-right-width:0px;border-top-width:0px;
									     		border-bottom-width:1px;padding-left:1mm">
											<b>8</b>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											    border-color:black;border-left-width:1px;border-right-width:0px;
											    border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SmllrOfCostAndFairMarketVlDiff"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
									        		border-color:black;border-left-width:1px;border-right-width:0px;
										        	border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +  
													                         1]/SmllrOfCostAndFairMarketVlDiff"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											    border-color:black;border-left-width:1px;border-right-width:0px;
											    border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +  
													                         2]/SmllrOfCostAndFairMarketVlDiff"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										        	border-color:black;border-left-width:1px;border-right-width:0px;
									         		border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +     
													                      3]/SmllrOfCostAndFairMarketVlDiff"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr>
										<td style="border:none;font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;font-weight:bold;
													padding-left:2.5mm">9</span>
												<span class="styGenericDiv" style="width:64mm;">
								                         Subtract line 3 from line 8. If zero or less, enter
								                         <span>
														<span style="float:left;">
								                          -0-
								                          </span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">...............</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
											    vertical-align:bottom;font-weight:bold;border-color:black;
											    border-left-width:1px;border-right-width:0px;border-top-width:0px;
											    border-bottom-width:1px;padding-left:1mm">
											<b>9</b>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											      border-color:black;border-left-width:1px;border-right-width:0px;
											      border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PropertyMinusInsuranceValue"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											     border-color:black;border-left-width:1px;border-right-width:0px;
											     border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos + 
													                          1]/PropertyMinusInsuranceValue"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											        border-color:black;border-left-width:1px;border-right-width:0px;
											        border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +   
													                        2]/PropertyMinusInsuranceValue"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
											        border-color:black;border-left-width:1px;border-right-width:0px;
											        border-top-width:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties[$pos +     
													                      3]/PropertyMinusInsuranceValue"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</table>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="(($Print = $Separated) and 
					(count($Form4684Data/PersonalUseProperties)
					 &gt;  4)) or ((count($Form4684Data/PersonalUseProperties) = 0))">
						<table class="styTable" cellspacing="0">
							<tr>
								<th>
									<span class="styTableCellPad"/>
								</th>
								<th style="width:8mm;color:lightgrey;height:5mm;">
									<span class="styTableCellPad"/>
								</th>
								<th class="styTableCellHeader" style="width:100mm;font-size:8pt;
										        	 border-color: black;border-left-width:1px;border-right-width:0px;
										            border-bottom-width:1px;border-top-width:1px" colspan="4" scope="col">
                    		    					Properties 
                    							
										</th>
							</tr>
							<tr>
								<th style="width:60mm;border:none;font-size:7pt;text-align:left; 
									       padding-left:6mm;font-weight:medium;">
									<span class="styTableCellPad"/>
								</th>
								<th style="width:4mm;height:3mm;">
									<span class="styTableCellPad"/>
								</th>
								<td class="styTableCellSmall" style="text-align:center;
														border-color:black;border-left-width:1px;border-right-width:0px; 
														border-top-width:0px;border-bottom-width:1px;
														border-color:black;font-weight:bold">A
														<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="text-align:center;
														border-color:black;border-left-width:1px;border-right-width:0px; 
														border-top-width:0px;border-bottom-width:1px;
														border-color:black;font-weight:bold">B
														<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="text-align:center;font-weight:bold;
													border-color:black;
													     	border-left-width:1px;border-right-width:0px;
													     	border-top-width:0px;border-bottom-width:1px;">C
														<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="text-align:center;border-color:black;
														font-weight:bold;border-left-width:1px;border-right-width:0px;
														border-top-width:0px;border-bottom-width:1px;">D
														<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td style="border:none;" scope="row">
									<span>
										<span class="styGenericDiv" style="width:8mm;
													font-weight:bold;border-top-width:1px;font-size:7pt;
													padding-left:2.5mm;">2</span>
										<span class="styGenericDiv" style="width:64mm;font-size:7pt;">
											<span>
												<span style="float:left;">
Cost or other basis of each property</span>
												<span class="styBoldText" style="float:right;font-size:8pt;">
													<span class="styDotLn">....</span>
												</span>
											</span>
										</span>
									</span>
								</td>
								<td class="styIRS4684TableCellSmallRB" style="width:4mm;
									        		vertical-align:bottom;border-left-width:1px;border-right-width:0px;
									        		border-top-width:1px;border-bottom-width:1px;border-color:black;
									        		padding-left:1.5mm;">
									<b>2</b>
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="border-color:black;text-align:left;
															border-left-width:1px;border-right-width:0px;border-top-width:0px;
										                 	border-bottom-width:1px;">
									<xsl:choose>
										<xsl:when test="(($Print = $Separated) and 
												(count ($Form4684Data/PersonalUseProperties) &gt; 4))">
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
							<tr>
								<td style="border:none;">
									<span>
										<span class="styGenericDiv" style="width:8mm;
													font-size:7pt;padding-left:2.5mm;font-weight:bold;">3</span>
										<span class="styGenericDiv" style="width:64mm;font-size:7pt;"> 
                      									Insurance or other reimbursement (whether or
                      									<span>
												<span style="float:left;">
                      									not you filed a claim) (see instructions)</span>
												<span class="styBoldText" style="float:right;">
													<span class="styDotLn">...</span>
												</span>
											</span>
										</span>
									</span>
								</td>
								<td class="styIRS4684TableCellSmallRB" style="width:5mm;
											vertical-align:bottom;
											font-weight:bold;;border-left-width:1px;
											border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;border-color:black">
									<b>3</b>
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;
											border-left-width:1px;border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;border-color:black;">
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;
											;border-left-width:1px;border-right-width:0px;border-top-width:0px;
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
							<tr>
								<td style="border:none;font-size:7pt;">
									<span style="padding-left:8mm;">
										<span class="styItalicText" style="width:66mm;">
											<span class="styBoldText">Note:</span> If line 2 is 
                       											<span class="styBoldText">  more </span> than line 3, 
                       											skip line 4.</span>
										<span class="styGenericDiv" style="width:8mm;padding-top:1mm;
													font-weight:bold;padding-left:2.5mm">4</span>
										<span class="styGenericDiv" style="width:66mm;padding-top:1mm;">
                        									Gain from casualty or theft. If line 3 is <span class="styBoldText">
									                    more</span> than line 2, enter the difference here and skip lines 5
									                    through 9 for that column. See instructions if line 3 includes insurance 
									                    or other reimbursement you did not claim, or you received payment for your
									                    <span>
												<span style="float:left;">
									                     loss in a later tax year</span>
												<span class="styBoldText" style="float:right;padding-right:2mm;">
													<span class="styDotLn">.........</span>
												</span>
											</span>
										</span>
									</span>
								</td>
								<td class="styIRS4684TableCellSmallRB" style="width:5mm;
											vertical-align:bottom;	font-weight:bold;border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;background-color:lightgrey;
											border-color:black;padding-top:20mm">
									<span style="height:4mm;width:8mm;background-color:white;
											padding-right:4mm;padding-top:2mm;padding-left:3.5mm;w">
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
										<span class="styGenericDiv" style="width:8mm;
													font-weight:bold; padding-left:2.5mm;">5</span>
										<span class="styGenericDiv" style="width:64mm;">
											<span>
												<span style="float:left;">Fair market value 
                       										<span class="styBoldText">before</span> casualty or theft</span>
												<span class="styBoldText" style="float:right;">
													<span class="styDotLn">..</span>
												</span>
											</span>
										</span>
									</span>
								</td>
								<td class="styIRS4684TableCellSmallRB" style="width:5mm;
											       vertical-align:bottom;padding-left:1mm;font-weight:bold;
											       border-left-width:1px;border-right-width:0px;border-top-width:0px;
											       border-bottom-width:1px;border-color:black;">
									<b>5</b>
									<span class="styTableCellPad"/>
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
										<span class="styGenericDiv" style="width:8mm;
													font-weight:bold;
													padding-left:2.5mm">6</span>
										<span class="styGenericDiv" style="width:64mm;">
											<span>
												<span style="float:left;">
														Fair market value <span class="styBoldText"> after </span>casualty or theft
								                         </span>
												<span class="styBoldText" style="float:right;">
													<span class="styDotLn">...</span>
												</span>
											</span>
										</span>
									</span>
								</td>
								<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										        	vertical-align:bottom;font-weight:bold;border-left-width:1px;
								         			border-right-width:0px;border-top-width:0px;
								         			border-bottom-width:1px;border-color:black;padding-left:1mm">
									<b>6</b>
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
								<td class="styTableCellSmall" style="vertical-align:bottom;
									        		border-color:black;border-left-width:1px;border-right-width:0px;
									         		border-top-width:0px;border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td style="font-size:7pt;">
									<span>
										<span class="styGenericDiv" style="width:8mm;
													font-weight:bold;padding-left:2.5mm">7</span>
										<span class="styGenericDiv" style="width:64mm;">
											<span>
												<span style="float:left;">
													 Subtract line 6 from line 5
													 </span>
												<span class="styBoldText" style="float:right;">
													<span class="styDotLn">........</span>
												</span>
											</span>
										</span>
									</span>
								</td>
								<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										        	vertical-align:bottom;font-weight:bold;border-left-width:1px;
										         	border-right-width:0px;border-top-width:0px;
										        	border-bottom-width:1px;border-color:black;padding-left:1mm">
									<b>7</b>
									<span class="styTableCellPad"/>
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
							<tr>
								<td style="font-size:7pt;">
									<span>
										<span class="styGenericDiv" style="width:8mm;font-weight:bold;
													padding-left:2.5mm">8</span>
										<span class="styGenericDiv" style="width:64mm;">
											<span>
												<span style="float:left;">
 Enter the <span class="styBoldText"> smaller </span> of line 2 or line 7
</span>
												<span class="styBoldText" style="float:right;">
													<span class="styDotLn">....</span>
												</span>
											</span>
										</span>
									</span>
								</td>
								<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										     	vertical-align:bottom;font-weight:bold;border-color:black;
									     		border-left-width:1px;border-right-width:0px;border-top-width:0px;
									     		border-bottom-width:1px;padding-left:1mm">
									<b>8</b>
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
								<td class="styTableCellSmall" style="vertical-align:bottom;
										        	border-color:black;border-left-width:1px;border-right-width:0px;
									         		border-top-width:0px;border-bottom-width:1px;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
							<tr>
								<td style="border:none;font-size:7pt;">
									<span>
										<span class="styGenericDiv" style="width:8mm;font-weight:bold;
													padding-left:2.5mm">9</span>
										<span class="styGenericDiv" style="width:64mm;">
								                         Subtract line 3 from line 8. If zero or less, enter
								                         <span>
												<span style="float:left;">
								                          -0-
								                          </span>
												<span class="styBoldText" style="float:right;">
													<span class="styDotLn">...............</span>
												</span>
											</span>
										</span>
									</span>
								</td>
								<td class="styIRS4684TableCellSmallRB" style="width:5mm;
											    vertical-align:bottom;font-weight:bold;border-color:black;
											    border-left-width:1px;border-right-width:0px;border-top-width:0px;
											    border-bottom-width:1px;padding-left:1mm">
									<b>9</b>
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
					<!--<div class="styBB" style="width:187mm;float:none;clear:both;">commented to test the print logic-->
					<!-- Adding clear:both and float:none.makes the print preview and the print to look properly.  Or else 
					there is some huge
        					gap between the table and firs tline of this div -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="size:7mmheight:4mm;">10</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span>
								<span style="float:left;">
					               Casualty or theft loss. Add the amounts on line 9 in columns A through D
</span>
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span class="styDotLn">..........</span>
								</span>
							</span>
							<!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">10</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4684Data/TotalPersonalPropertyTheftLoss"/>
							</xsl:call-template>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">11</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span>
									<span style="float:left;">
					              Enter the <span class="styBoldText"> smaller </span> of line 10 or $100
</span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">.......................</span>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">11</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/CasualtyOrTheftLossLimit"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">12</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span>
									<span style="float:left;">


				                Subtract line 11 from line 10
</span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">.........................</span>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">12</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/NetCasualtyOrTheftLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span style="width:4px;"/>
							</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span class="styItalicText">
									<span class="styBoldText" style="font-style: normal;">Caution:</span>
						                Use only one Form 4684 for lines 13 through 21.  
						              </span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4mm;">
								<span style="width:4px;"/>
							</div>
							<div class="styLNAmountBoxNBB" style="height:4mm;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">13</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span>
									<span style="float:left;">
					              Add the amounts on line 12 of all Forms 4684
</span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">...................</span>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">13</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/TotalNetCasualtyOrTheftLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">14</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span>
									<span style="float:left;">
					              Add the amounts on line 4 of all Forms 4684
</span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">....................</span>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox">14</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/TotalCasualtyOrTheftGain"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  Line 15  -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">15</div>
							<div class="styLNDesc" style="width:119.8mm;height:4mm;">
								<li>If line 14 is <span class="styBoldText">more</span> than line 13, enter the 
								difference here 	and on Schedule D.
                					<span class="styBoldText">Do not</span>
									<br/>
									<span style="width: 4.25mm;"/>
					                complete the rest of this section (see instructions).
					              </li>
								<li>If line 14 is <span class="styBoldText">less</span> than line 13, enter -0- here 
								and go to line 16.</li>
								<li>If line 14 is <span class="styBoldText">equal</span>
                 					to line 13, enter -0- here. <span style="font-weight: bold;">Do not</span> complete 
                 					the rest of this section.</li>
							</div>
							<div class="styLNDesc" style="width:3.1mm; height:4mm;">
								<img src="{$ImagePath}/4684_Bracket.gif" width="8mm" height="48mm" alt="bracket
								 image"/>
							</div>
							<div style="float:left;padding-left:1mm;width:16mm;padding-top:4.5mm;height:14mm;">
								<span class="styBoldText" style="float:right;">
									<span class="styDotLn">  
						            ...
						          </span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">15</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/TotalGainMinusTotalLoss"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:6.5mm;
							border-bottom-width:0px;background-color:lightgrey">
								<span style="width:4px;"/>
							</div>
							<div class="styLNAmountBoxNBB" style="height:6.5mm;"/>
						</div>
						<!--  line 16   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">
					              16
					            </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span>
									<span style="float:left;">
					              If line 14 is <span class="styBoldText">less</span> than line 13, enter the difference
</span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">..................</span>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">
					              16
					            </div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/TotalLossMinusTotalTheftGain"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  line 17 -->
						<!--  line 17-1-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">17</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
			 Does the amount on line 12 include a loss from a disaster declared a federal disaster
			  in tax years beginning after 2007 that occurred before 2010?
              </div>
							<div class="styLNRightNumBox" style="height:8mm;border-bottom-width:0px"/>
							<div class="styLNAmountBox" style="height:8mm;border-bottom-width:0px"/>
						</div>
						<!--Line 17-2-->
						<div style="width:187mm;clear:both;">
							<div class="styLNLeftNumBox" style="height:4mm;"/>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form4684Data/DiffDisasterLossMinusGainAmt"/>
								</xsl:call-template>
								<span style="width: 2mm"/>
								<input type="checkbox" class="styCkbox" name="DiffPriorYearDisasterLossIndTest">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form4684Data/PriorYearDisasterLossInd"/>
										<xsl:with-param name="BackupName">IRS4684PriorYearDisasterLossIndTest</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width: 2mm"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form4684Data/PriorYearDisasterLossInd"/>
										<xsl:with-param name="BackupName">IRS4684PriorYearDisasterLossIndTest</xsl:with-param>
									</xsl:call-template>
									<b>Yes. </b>Enter the amount from line 3 of the Worksheet for Line 17 in the instructions. If you are
filing<br/>
									<span style="padding-left:7.5mm"/>
                 Schedule A (Form 1040), go to line 18. Otherwise, enter this amount on
Schedule L (Form 1040A
<br/>
									<span style="padding-left:7.5mm"/> or 1040).  Do not complete the rest of Section A. Form
1040NR filers, see instructions.
                </label>
								<br/>
								<span>
									<span style="float:left;">
										<span style="width: 2mm"/>
										<input type="checkbox" class="styCkbox" name="PriorYearDisasterLossIndTest">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PriorYearDisasterLossInd"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PriorYearDisasterLossInd"/>
												<xsl:with-param name="BackupName">IRS4684PriorYearDisasterLossIndTest</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width: 2mm;"/>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PriorYearDisasterLossInd"/>
												<xsl:with-param name="BackupName">IRS4684PriorYearDisasterLossIndTest</xsl:with-param>
											</xsl:call-template>
											<b>No. </b> Enter -0- and go to line 18
                 </label>
									</span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">.......................</span>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:15mm;
				border-bottom-width:0px;border-bottom-width:1px;padding-top:10mm">17</div>
							<div class="styLNAmountBox" style="height:15mm;padding-top:10mm;
				border-bottom-width:1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/PriorYearDisasterLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  line 18 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">18</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span>
								<span style="float:left;">

			Subtract line 17 from line 16
</span>
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span class="styDotLn">.........................</span>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">18</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4684Data/DiffDisasterLossMinusGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  line 19 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">19</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
	        	Enter 10% of your adjusted gross income from Form 1040, 
	        	line 38, or Form 1040NR, line 36. Estates 

	        	<span>
								<span style="float:left;">

	        	and trusts, see instructions.
</span>
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span class="styDotLn">.........................</span>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">19</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4684Data/TenPercentOfAdjGrossIncome"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Amount Box section -->
					<!--  line 20 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">20</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span>
								<span style="float:left;">

	        	Subtract line 19 from line 18. If zero or less, enter -0-
</span>
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span class="styDotLn">.................</span>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">20</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4684Data/CalcAdjGroIncmMinusTotNetLoss"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  line 21 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:6mm;">21</div>
						<div class="styLNDesc" style="width:139mm;height:6mm;">
	        	Add lines 17 and 20. Also enter the result on Schedule A (Form 1040), line 20, 
	        	or Form 1040NR, Schedule A, line 8. Estates and trusts, enter the result on the 
	        	"Other deductions" line of your tax return.
		       <span class="styBoldText"/>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px;">21</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4684Data/TotalCasualtyTheftDeductions"/>
							</xsl:call-template>
						</div>
					</div>
					<!--footer -->
					<div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
						<div style="width:100mm;font-weight:bold;" class="styGenericDiv">For Paperwork
						 Reduction Act Notice, see page 5 of the instructions.</div>
						<div style="width:30mm;text-align:center;" class="styGenericDiv">Cat. No. 12997O</div>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">4684
						</span> (2010)</div>
					</div>
					<!-- header page 2 -->
					<div style="width:187mm;clear:both;padding-bottom:.5mm;" class="styBB">
						<div style="width:75mm;" class="styGenericDiv">Form 4684 (2010)</div>
						<div style="width:55mm;text-align:left; padding-left: 3mm;" class="styGenericDiv">
						Attachment Sequence No. <span class="styBoldText">26</span>
						</div>
						<div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2
						</span>
						</div>
					</div>
					<!-- Taxpayer Name and number section -->
					<div class="styBB" style="width:187mm;clear:both;float:none;">
						<div class="styNameBox" style="width:156mm;height:8mm;">
				                    Name(s) shown on tax return. Do not enter name and identifying number if shown 
				                    on other side.
				            <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:31mm;height:4mm;">
							<span style="width:1mm;"/>Identifying number<br/>
							<span style="padding-left:2mm">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Section B Part I -->
					<div class="styBB" style="width:187mm;float:none;">
						<div class="styIRS4684ScheduleName" style="width:187mm;font-size:8pt;text-align:left;">
				                SECTION B&#151;Business and Income-Producing Property
				      </div>
					</div>
					<div class="styBB" style="width:187mm;clear:both;float:none;">
						<!-- Added clear:both attribute -->
						<div class="styPartName" style="background-color:black;width:12mm;">Part I</div>
						<div class="styPartDesc" style="width:168mm;">Casualty or Theft Gain or Loss 
				                  <span class="styNormalText"> (Use a separate Part l for each casualty or theft.)  
				                  </span>
						</div>
						<xsl:if test="(count($Form4684Data/BusinessProperties) &gt; 4) and ($Print != 
						$Separated)">
							<div class="styGenericDiv" style="width:7mm;text-align:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties"/>
									<xsl:with-param name="containerHeight" select="4"/>
									<xsl:with-param name="containerID" select=" 'BPDctn' "/>
								</xsl:call-template>
							</div>
						</xsl:if>
					</div>
					<!-- Begin properties description table -->
					<!-- Added clear:both attribute for the print logic to work correctly -->
					<div class="styIRS4684TableContainer" id="BPDctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" name="TY1Table" id="TY1Table">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS4684TableCellHeaderNoBorders" style="width:8mm;font-size:7pt;
							                  text-align:left;font-weight:bold;vertical-align:top;">
										<span style="width:8mm;padding-left:1mm;">22</span>
									</th>
									<th class="styIRS4684TableCellHeaderNoBorders" style="width:178mm;
									font-size:7pt;text-align:left;font-weight:normal;vertical-align:top;" colspan="2">
							                  Description of properties (show type, location, and date acquired for each 
							                  property). Use a separate line for each property lost or damaged from the 
							                  same casualty or theft.
							                </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form4684Data/BusinessProperties) 
								&lt;= 4)">
									<xsl:for-each select="$Form4684Data/BusinessProperties">
										<tr style="font-size:7pt;height:6mm;">
											<td class="styTableCellNoBorders" style="text-align:center;width:8mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellNoBorders" style="text-align:left;width:25mm;
											vertical-align:bottom;vertical-align:bottom;border-bottom-width:1px;">
                    								Property <span class="styBoldText">
													<xsl:number format="A"/>
												</span>
											</td>
											<td class="styTableCellNoBorders" style="width:158mm;text-align:left;
											border-bottom-width:1px;vertical-align:bottom;border-bottom-width:1px;
											border-color: black;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DescriptionOfProperty"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($Form4684Data/BusinessProperties) &lt; 1) or 
								(($Print = $Separated) and (count($Form4684Data/BusinessProperties) &gt; 4))">
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
														<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties"/>
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
								(($Print = $Separated) and 	(count($Form4684Data/BusinessProperties) &gt; 4))">
									<tr style="height:6mm;font-size:7pt;">
										<td class="styTableCellNoBorders" style="text-align:center;width:8mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="text-align:left;width:25mm;
										vertical-align:bottom;">
                    							Property <b>B</b>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="width:158mm;text-align:left;
										padding-left:3mm;border-bottom-width:1px;vertical-align:center;
										border-color: black;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($Form4684Data/BusinessProperties) &lt; 3) or 
								(($Print = $Separated) and 	(count($Form4684Data/BusinessProperties) &gt; 4))">
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
								(($Print = $Separated) and 
								(count($Form4684Data/BusinessProperties) &gt; 4))">
									<tr style="height:6mm;font-size:7pt;">
										<td class="styTableCellNoBorders" style="text-align:center;width:8mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="text-align:left;width:25mm;
										padding-	left:0mm;vertical-align:bottom;">
                    							Property <b>D</b>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellNoBorders" style="width:158mm;text-align:left;
										padding-left:3mm;border-bottom-width:1px;vertical-align:center;
										border-color: black;">
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
						&lt;= 4)) and
						 (count($Form4684Data/BusinessProperties) != 0)">
							<xsl:for-each select="$Form4684Data/BusinessProperties">
								<xsl:variable name="pos" select="position()"/>
								<xsl:if test="position() mod 4 = 1">
									<table class="styTable" cellspacing="0" style="width:187mm;">
										<tr>
											<th>
												<span class="styTableCellPad"/>
											</th>
											<th>
												<span class="styTableCellPad"/>
											</th>
											<th class="styTableCellHeader" style="width:100mm;font-size:8pt;
												border-color:black;border-left-width:1px;border-right-width:0px;
												border-top-width:1px;border-bottom-width:0px;" colspan="4" scope="col">
			                   							 Properties
											</th>
										</tr>
										<tr>
											<th>
												<span class="styTableCellPad"/>
											</th>
											<th>
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
											<xsl:if test="count($Form4684Data/BusinessProperties[position() &gt;= $pos
												  and position() &lt; $pos+4]) = 1">
												<xsl:choose>
													<xsl:when test="count($Form4684Data/BusinessProperties) &lt; 2">
														<td class="styTableCellSmall" style="text-align:center;
															font-weight:bold;border-color:black;border-left-width:1px;
															border-right-width:0px;border-top-width:1px;
															border-bottom-width:1px;">B<span class="styTableCellPad"/>
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
											<xsl:if test="count($Form4684Data/BusinessProperties[position() &gt;= $pos
												  and position() &lt; $pos+4]) = 2">
												<xsl:choose>
													<xsl:when test="count($Form4684Data/BusinessProperties) &lt; 3">
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
												&gt;= $pos  and 
												position() &lt; $pos+4]) = 3">
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
										<!--  line 23  -->
										<tr>
											<td style="border:none;">
												<div>
													<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">23</span>
															<span style="float:left;padding-left:2mm;">Cost or adjusted basis of each property</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">...</span>
															</span>
														</span>
													</span>
												</div>
											</td>
											<td class="styIRS4684TableCellSmallRB " style="width:5mm;
												border-top-width:1px;font-weight:bold;border-color:black;
												border-left-width:1px;border-right-width:0px;padding-left:3.5mm;
												border-top-width:1px;border-bottom-width:1px;">23
												</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CostOrAdjustedBasisOfEachProp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 1]/CostOrAdjustedBasisOfEachProp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos +  2]/CostOrAdjustedBasisOfEachProp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos +  3]/CostOrAdjustedBasisOfEachProp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- line 24 -->
										<tr>
											<td style="border:none;">
												<span>
													<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">24</span>
															<span style="float:left;padding-left:2mm;">Insurance or other reimbursement (whether or<br/>
 not you filed a claim). See the instructions for	<span>
																	<span style="float:left;"> line 3 </span>
																	<span class="styBoldText" style="float:right;padding-right:2mm;">
																		<span class="styDotLn">..............</span>
																	</span>
																</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<!-- line 24A -->
											<td class="styIRS4684TableCellSmallRB " style="width:5mm;vertical-align:bottom;
													     font-weight:bold;border-left-width:1px;border-right-width:0px;padding-left:3.5mm;
													     border-top-width:0px;border-bottom-width:1px;border-color:black;">24
												</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;
												   border-right-width:0px;border-top-width:0px;border-bottom-width:1px;
												   border-color:black">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="InsuranceOrOtherReimbursement"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;
												   border-right-width:0px;border-top-width:0px;border-bottom-width:1px;
												   border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 1]/InsuranceOrOtherReimbursement"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;
												     border-right-width:0px;border-top-width:0px;border-bottom-width:1px;
												     border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos +  2]/InsuranceOrOtherReimbursement"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;border-color:black;
													border-left-width:1px;border-right-width:0px;border-top-width:0px;
													border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 3]/InsuranceOrOtherReimbursement"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 25 -->
										<tr>
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styItalicText" style="font-size:7pt;width:66mm;">
														<span class="styBoldText" style="font-style: normal;padding-left:7mm;">Note:</span> If 
															line 23 is <span class="styBoldText">more</span> than line 24, skip
															 line <span style="padding-left:7mm"/>25.</span>
													<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">25</span>
															<span style="float:left;padding-left:2mm;">
Gain from casualty or theft. If line 24 is <b>more</b>
																<br/>
than line 23, enter the difference here and on<br/>
line 32 or line 37, column (c), except as<br/>
provided in the instructions for line 36. Also,<br/>
skip lines 26 through 30 for that column.  See<br/>
the instructions for line 4 if line 24 includes
insurance or other reimbursement you did not<br/>
claim, or you received payment for your loss<br/>
																<span>
																	<span style="float:left;">
in a later tax year
</span>
																	<span class="styBoldText" style="float:right;padding-right:2mm;">
																		<span class="styDotLn">..........</span>
																	</span>
																</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm;
									vertical-align:bottom;font-weight:bold;border-color:black;border-left-width:1px;
														            border-right-width:0px;border-top-width:0px;
														            border-bottom-width:1px;background-color:lightgrey;
														            text-align:left;">
												<div style="width:8mm;height:4.5mm;vertical-align:bottom;padding-top:2mm;">
													<span style="height:4mm;width:13mm;float:left;background-color:white;padding-top:2mm;padding-left:5mm;">
														<b>25</b>
													</span>
												</div>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
										     		border-left-width:1px;border-right-width:0px;border-top-width:0px;
										     		border-bottom-width:1px;border-color:black">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainFromCasualtyOrTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
										     		border-left-width:1px;border-right-width:0px;border-top-width:0px;
										    		border-bottom-width:1px;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos +  1]/GainFromCasualtyOrTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;border-color:black">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos +  2]/GainFromCasualtyOrTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
												border-color:black;border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos +  3]/GainFromCasualtyOrTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 26 -->
										<tr>
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">26</span>
															<span style="float:left;padding-left:2mm;">Fair market value <b> before </b> casualty or theft 
																</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">..</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm;
												font-weight:bold;border-left-width:1px;padding-left:3.5mm;
												border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;border-color:black;">26
												</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FairMarketValueBeforeTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 1]/FairMarketValueBeforeTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 2]/FairMarketValueBeforeTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 3]/FairMarketValueBeforeTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 27 -->
										<tr>
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">27</span>
															<span style="float:left;padding-left:2mm;">
													 Fair market value <b> after </b> casualty or theft																
																</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">..</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm;
												font-weight:bold;border-left-width:1px;padding-left:3.5mm;
												border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;border-color:black;">27
												</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FairMarketValueAfterTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos +   1]/FairMarketValueAfterTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos +2]/FairMarketValueAfterTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos +  3]/FairMarketValueAfterTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 28  -->
										<tr>
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">28</span>
															<span style="float:left;padding-left:2mm;">
													 Subtract line 27 from line 26															
																</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">......</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm;padding-left:3.5mm;
												font-weight:bold;border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;border-color:black;">28
												</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FairMarketValueDifference"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 1]/FairMarketValueDifference"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 2]/FairMarketValueDifference"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos +  3]/FairMarketValueDifference"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!--  Line 29 -->
										<tr>
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">29</span>
															<span style="float:left;padding-left:2mm;">
														 Enter the <b> smaller </b> of line 23 or line 28														
																</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">...</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm;
												font-weight:bold;padding-left:3.5mm;border-color:black;
												border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;">
												29
												</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SmllrOfCostAndFairMarketVlDiff"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 1]/SmllrOfCostAndFairMarketVlDiff"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 2]/SmllrOfCostAndFairMarketVlDiff"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 3]/SmllrOfCostAndFairMarketVlDiff"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 30 -->
										<tr>
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styItalicText" style="font-size:7pt;padding-top:1mm;">
														<span class="styBoldText" style="font-style: normal;padding-left:7mm;">Note:</span>
																 If the property was totally destroyed by 
																 <span style="padding-left:7mm"/>casualty or lost from theft, enter on line 29 the 
												                <span style="padding-left:7mm;"/>amount from line 23.
												                </span>
													<span>
														<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
															<span>
																<span class="styBoldText" style="float:left;padding-left:1mm;">30</span>
																<span style="float:left;padding-left:2mm;">
 Subtract line 24 from line 29. If zero or less, 
<span style="float:left;"> enter -0- </span>
																	<span class="styBoldText" style="float:right;padding-right:2mm;">
																		<span class="styDotLn">.............</span>
																	</span>
																</span>
															</span>
														</span>
													</span>
												</span>
												<td class="styIRS4684TableCellSmallRB" style="width:5mm;
									vertical-align:bottom;font-weight:bold;border-color:black;border-left-width:1px;
														            border-right-width:0px;border-top-width:0px;
														            border-bottom-width:1px;background-color:lightgrey;
														            text-align:center;">
													<div style=";width:8mm;height:4.5mm;
														vertical-align:bottom;text-align:center;padding-top:2mm;">
														<span style="height:4mm;width:13mm;background-color:white;
											padding-right:4mm;padding-top:2mm;padding-left:3.5mm;">
															<b>30</b>
														</span>
													</div>
												</td>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
												border-color:black;border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties/NetBusinessPropertyLoss"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 30 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties/
																	                                      NetBusinessPropertyLoss/@note"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetBusinessPropertyLoss"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="padding-right:2mm;
												vertical-align:bottom;border-left-width:1px;
												border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;border-color:black;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties[$pos+
															 1]/NetBusinessPropertyLoss"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 30 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties[$pos+1]/
																	                                      NetBusinessPropertyLoss/@note"/>
													</xsl:call-template>
												</div>
												<!-- End adding pen image -->
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 1]/NetBusinessPropertyLoss"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;border-color:black;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form4684Data/
															BusinessProperties[$pos+2]/NetBusinessPropertyLoss"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 30 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties[$pos+2]/
																	                                      NetBusinessPropertyLoss/@note"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 2]/NetBusinessPropertyLoss"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
												border-color:black;border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form4684Data/
															BusinessProperties[$pos+3]/NetBusinessPropertyLoss"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 30 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties[$pos+3]/
																	                                      NetBusinessPropertyLoss/@note"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 3]/NetBusinessPropertyLoss"/>
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
									<th>
										<span class="styTableCellPad"/>
									</th>
									<th>
										<span class="styTableCellPad"/>
									</th>
									<th class="styTableCellHeader" style="width:100mm;font-size:8pt;
												border-color:black;border-left-width:1px;border-right-width:0px;
												border-top-width:1px;border-bottom-width:1px;" colspan="4" scope="col">
			                   							 Properties
											</th>
								</tr>
								<tr>
									<th>
										<span class="styTableCellPad"/>
									</th>
									<th>
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
								<!--  line 23  -->
								<tr>
									<td style="border:none;">
										<div>
											<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
												<span>
													<span class="styBoldText" style="float:left;padding-left:1mm;">23</span>
													<span style="float:left;padding-left:2mm;">Cost or adjusted basis of each property</span>
													<span class="styBoldText" style="float:right;padding-right:2mm;">
														<span class="styDotLn">...</span>
													</span>
												</span>
											</span>
										</div>
									</td>
									<td class="styIRS4684TableCellSmallRB " style="width:5mm;
												border-top-width:1px;font-weight:bold;border-color:black;
												border-left-width:1px;border-right-width:0px;padding-left:3.5mm;
												border-top-width:1px;border-bottom-width:1px;">23
												</td>
									<td class="styTableCellSmall" style="border-color:black;text-align:left;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px">
										<xsl:choose>
											<xsl:when test="(($Print = $Separated) and 
												(count ($Form4684Data/BusinessProperties) &gt; 4))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties"/>
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
									<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!-- line 24 -->
								<tr>
									<td style="border:none;">
										<span>
											<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
												<span>
													<span class="styBoldText" style="float:left;padding-left:1mm;">24</span>
													<span style="float:left;padding-left:2mm;">Insurance or other reimbursement (whether or<br/>
 not you filed a claim). See the instructions for	<span>
															<span style="float:left;"> line 3 </span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">..............</span>
															</span>
														</span>
													</span>
												</span>
											</span>
										</span>
									</td>
									<!-- line 24A -->
									<td class="styIRS4684TableCellSmallRB " style="width:5mm;vertical-align:bottom;
													     font-weight:bold;border-left-width:1px;border-right-width:0px;padding-left:3.5mm;
													     border-top-width:0px;border-bottom-width:1px;border-color:black;">24
												</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;
												   border-right-width:0px;border-top-width:0px;border-bottom-width:1px;
												   border-color:black">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;
												   border-right-width:0px;border-top-width:0px;border-bottom-width:1px;
												   border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:1px;
												     border-right-width:0px;border-top-width:0px;border-bottom-width:1px;
												     border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;border-color:black;
													border-left-width:1px;border-right-width:0px;border-top-width:0px;
													border-bottom-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!-- Line 25 -->
								<tr>
									<td style="border:none;font-size:7pt;">
										<span>
											<span class="styItalicText" style="font-size:7pt;width:66mm;">
												<span class="styBoldText" style="font-style: normal;padding-left:7mm;">Note:</span> If 
															line 23 is <span class="styBoldText">more</span> than line 24, skip
															 line <span style="padding-left:7mm"/>25.</span>
											<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
												<span>
													<span class="styBoldText" style="float:left;padding-left:1mm;">25</span>
													<span style="float:left;padding-left:2mm;">
Gain from casualty or theft. If line 24 is <b>more</b>
														<br/>
than line 23, enter the difference here and on<br/>
line 32 or line 37, column (c), except as<br/>
provided in the instructions for line 36. Also,<br/>
skip lines 26 through 30 for that column.  See<br/>
the instructions for line 4 if line 24 includes
insurance or other reimbursement you did not<br/>
claim, or you received payment for your loss<br/>
														<span>
															<span style="float:left;">
in a later tax year
</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">..........</span>
															</span>
														</span>
													</span>
												</span>
											</span>
										</span>
									</td>
									<td class="styIRS4684TableCellSmallRB" style="width:5mm;
									vertical-align:bottom;font-weight:bold;border-color:black;border-left-width:1px;
														            border-right-width:0px;border-top-width:0px;
														            border-bottom-width:1px;background-color:lightgrey;
														            text-align:left;">
										<div style="width:8mm;height:4.5mm;vertical-align:bottom;padding-top:2mm;">
											<span style="height:4mm;width:13mm;float:left;background-color:white;padding-top:2mm;padding-left:5mm;">
												<b>25</b>
											</span>
										</div>
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
								<!-- Line 26 -->
								<tr>
									<td style="border:none;font-size:7pt;">
										<span>
											<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
												<span>
													<span class="styBoldText" style="float:left;padding-left:1mm;">26</span>
													<span style="float:left;padding-left:2mm;">Fair market value <b> before </b> casualty or theft 
																</span>
													<span class="styBoldText" style="float:right;padding-right:2mm;">
														<span class="styDotLn">..</span>
													</span>
												</span>
											</span>
										</span>
									</td>
									<td class="styIRS4684TableCellSmallRB" style="width:5mm;
												font-weight:bold;border-left-width:1px;padding-left:3.5mm;
												border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;border-color:black;">26
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
									<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!-- Line 27 -->
								<tr>
									<td style="border:none;font-size:7pt;">
										<span>
											<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
												<span>
													<span class="styBoldText" style="float:left;padding-left:1mm;">27</span>
													<span style="float:left;padding-left:2mm;">
													 Fair market value <b> after </b> casualty or theft																
																</span>
													<span class="styBoldText" style="float:right;padding-right:2mm;">
														<span class="styDotLn">..</span>
													</span>
												</span>
											</span>
										</span>
									</td>
									<td class="styIRS4684TableCellSmallRB" style="width:5mm;
												font-weight:bold;border-left-width:1px;padding-left:3.5mm;
												border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;border-color:black;">27
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
									<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!-- Line 28  -->
								<tr>
									<td style="border:none;font-size:7pt;">
										<span>
											<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
												<span>
													<span class="styBoldText" style="float:left;padding-left:1mm;">28</span>
													<span style="float:left;padding-left:2mm;">
													 Subtract line 27 from line 26															
																</span>
													<span class="styBoldText" style="float:right;padding-right:2mm;">
														<span class="styDotLn">......</span>
													</span>
												</span>
											</span>
										</span>
									</td>
									<td class="styIRS4684TableCellSmallRB" style="width:5mm;padding-left:3.5mm;
												font-weight:bold;border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;border-color:black;">28
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
									<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!--  Line 29 -->
								<tr>
									<td style="border:none;font-size:7pt;">
										<span>
											<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
												<span>
													<span class="styBoldText" style="float:left;padding-left:1mm;">29</span>
													<span style="float:left;padding-left:2mm;">
														 Enter the <b> smaller </b> of line 23 or line 28														
																</span>
													<span class="styBoldText" style="float:right;padding-right:2mm;">
														<span class="styDotLn">...</span>
													</span>
												</span>
											</span>
										</span>
									</td>
									<td class="styIRS4684TableCellSmallRB" style="width:5mm;
												font-weight:bold;padding-left:3.5mm;border-color:black;
												border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;">
												29
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
									<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!--  Line 30 -->
								<tr>
									<td style="border:none;font-size:7pt;">
										<span>
											<span class="styItalicText" style="font-size:7pt;padding-top:1mm;">
												<span class="styBoldText" style="font-style: normal;padding-left:7mm;">Note:</span>
																 If the property was totally destroyed by 
																 <span style="padding-left:7mm"/>casualty or lost from theft, enter on line 29 the 
												                <span style="padding-left:7mm;"/>amount from line 23.
												                </span>
											<!-- Line 30 -->
											<span>
												<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
													<span>
														<span class="styBoldText" style="float:left;padding-left:1mm;">30</span>
														<span style="float:left;padding-left:2mm;">
 Subtract line 24 from line 29. If zero or less, 
<span style="float:left;"> enter -0- </span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">.............</span>
															</span>
														</span>
													</span>
												</span>
											</span>
										</span>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
									vertical-align:bottom;font-weight:bold;border-color:black;border-left-width:1px;
														            border-right-width:0px;border-top-width:0px;
														            border-bottom-width:1px;background-color:lightgrey;
														            text-align:center;">
											<div style=";width:8mm;height:4.5mm;
														vertical-align:bottom;text-align:center;padding-top:2mm;">
												<span style="height:4mm;width:13mm;background-color:white;
											padding-right:4mm;padding-top:2mm;padding-left:3.5mm;">
													<b>30</b>
												</span>
											</div>
										</td>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;
												border-color:black;border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="padding-right:2mm;
												vertical-align:bottom;border-left-width:1px;
												border-right-width:0px;border-top-width:0px;
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
												border-top-width:0px;border-bottom-width:1px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</table>
							<!-- ***************************************************************************** -->
						</xsl:otherwise>
					</xsl:choose>
					<!-- End of Section B properties table -->
					<!-- ***************************************************************************** -->
					<!-- ********************************************************************************  -->
					<!-- line 31 -->
					<div class="styBB" style="width:187;float:none;clear:both;">
						<div class="styBB" style="width:187mm;border-bottom:none; float:left">
							<div class="styLNLeftNumBox" style="height:4mm;">31</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;font-size: 6pt;">
								<span style="float:left;">
                                           Casualty or theft loss. Add the amounts on line 30. Enter the total here 
                                           and on line 32 <b>or</b> line 37 (see instructions)</span>
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span class="styDotLn">....</span>
								</span>
							</div>
							<div class="styLNRightNumBoxNBB">31</div>
							<div class="styLNAmountBoxNBB" style="width:32mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/TotalBusinessPropertyTheftLoss"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Place holder for the toggle button -->
					<div>
						<table class="styTable" cellspacing="0">
							<tr>
								<th class="styTablecellheader" style="width:89mm;border-color:black" scope="col" colspan="2">
									<span class="styPartName" style="width:13mm;">Part II</span>
									<span class="styPartDesc" style="width:74mm;padding-left:1mm;
									border-bottom-width:1px;font-size: 7pt;"> 
									 Summary of Gains and Losses <span class="styNormalText">
									 (from separate Parts I)</span>
									</span>
								</th>
								<th class="styTablecellheader" style="width:64mm;font-weight:normal;
								border-bottom-width:1px;border-color:black;" colspan="2" scope="col">
									<span style="font-weight:bold;border-bottom-width:1px;border-color:black;"> (b) 
									     </span> Losses from casualties or thefts
                              </th>
								<th class="styTablecellheader" style="width:32mm;font-weight:normal;
								border-right-width:0px;
								border-bottom-width:1px;border-color:black;" rowspan="2" scope="col">
									<span style="font-weight:bold;"> (c)
                                         </span> Gains from casualties or thefts includible in income
              </th>
							</tr>
							<tr>
								<th class="styTablecellheader" style="width:80mm;border-bottom-width:1px;
								border-color:black;" scope="col" colspan="2">
									<span class="styGenericDiv" style="width:80mm;padding-left:2mm;
									text-align:center;font-weight:normal;">
										<span class="styBoldText">(a)</span>
										<span style="font-weight:normal">
									        	 Identify casualty or theft</span>
									</span>
								</th>
								<th class="styTablecellheader" style="width:32mm;font-weight:normal;
								border-bottom-width:1px;border-color:black;" scope="col">
									<span class="styItalicText">(i) </span>Trade, business, rental or royalty property
									
                                </th>
								<th class="styTablecellheader" style="width:32mm;font-weight:normal;
								border-bottom-width:1px;border-color:black;" scope="col">
									<span class="styItalicText">(ii) </span> Income-producing and employee property
                                </th>
							</tr>
						</table>
					</div>
					<div class="styBB" style="width:187mm;clear:both;float:none;">
						<div class="styPartDesc" style="font-size:8pt; text-align:center;width:180mm;padding-left:40px;">
							<span class="styBoldText">Casualty or Theft of Property Held One Year or Less</span>
						</div>
						<div class="styPartDesc" style="font-weight: normal; font-size:8pt; width: 7mm;padding-left: 0px;">
							<xsl:if test="(count($Form4684Data/ShortTermTheftProperty) &gt; 2) and ($Print != 
						$Separated)">
								<span class="styGenericDiv" style="float:right;clear:none;">
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$Form4684Data/ShortTermTheftProperty"/>
										<xsl:with-param name="containerHeight" select="2"/>
										<xsl:with-param name="headerHeight" select="0"/>
										<xsl:with-param name="containerID" select=" 'STctn' "/>
									</xsl:call-template>
								</span>
							</xsl:if>
						</div>
					</div>
					<div class="styTableContainerNBB" id="STctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or
                          ( ($Print = $Separated) and (count($Form4684Data/ShortTermTheftProperty) &lt; 3) )">
									<xsl:for-each select="$Form4684Data/ShortTermTheftProperty">
										<tr style="height:4mm;">
											<!-- Line 32 -->
											<td class="styTableCell" style="width:8mm;text-align:left;border-right-width:0px;">
												<xsl:choose>
													<xsl:when test="position()=1">
														<xsl:attribute name="style">border-top-width:1px;width:8mm;
													text-align:left;border-right-width:0px;border-bottom-width:1px;
													font-weight:bold;font-size:7pt;padding-left:1mm;
													border-color:black;
													</xsl:attribute>32
	                    							</xsl:when>
													<xsl:otherwise>
														<span class="styTableCellPad"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="width:81mm;text-align:left;
										    border-color:black;">
												<xsl:if test="position()=1">
													<xsl:attribute name="style">border-top-width:1px;width:81mm;
												text-align:left;border-bottom-width:1px;border-color:black</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CasualtyOrTheftDescription"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;border-bottom-width:1px;
										border-color:black">
												<xsl:if test="position()=1">
													<xsl:attribute name="style">border-top-width:1px;
												border-color:black</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="TradeOrRentalProperty"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;
										   border-bottom-width:1px;border-color:black">
												<xsl:if test="position()=1">
													<xsl:attribute name="style">border-top-width:1px;
												border-color:black</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="IncomeProducingProperty"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;border-bottom-width:1px;
										border-color:black;border-right-width:0px">
												<xsl:if test="position()=1">
													<xsl:attribute name="style">border-top-width:1px;border-color:black;
												border-right-width:0px</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainsFromCasualtiesOrTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:if test="count($Form4684Data/ShortTermTheftProperty) &lt; 1">
										<tr style="height:4mm;">
											<td class="styTableCell" style="width:8mm;border-right-width:0px;
										border-bottom-width:0px;text-align:left;border-top-width: 1px;
										font-weight:bold;font-size:7pt;padding-left:1mm;">
			           				       32
		              					   </td>
											<td class="styTableCell" style="width:81mm;border-top-width: 1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;border-top-width: 1px;">
	                  						(<span style="width:16px;"/>)<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;border-top-width: 1px;">
	                  						(<span style="width:16px;"/>)<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;border-top-width: 1px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form4684Data/ShortTermTheftProperty) &lt; 2">
										<tr style="height:4mm;">
											<td class="styTableCell" style="width:8mm;border-right-width:0px;
										border-bottom-width:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:81mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;">
												<span style="width:16px;"/>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;">
												<span style="width:16px;"/>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
								<!-- "See Additional Table" and print empty row.-->
								<xsl:if test="($Print = $Separated) and (count($Form4684Data/ShortTermTheftProperty)
							 &gt; 2)">
									<tr style="height:4mm;">
										<td class="styTableCell" style="width:8mm;border-right-width:0px;
									border-bottom-width:1px;text-align:left;border-top-width: 1px;
									font-weight:bold;	font-size:7pt;padding-left:1mm">
		             					   32
	              						</td>
										<td class="styTableCell" style="width:81mm;border-top-width: 1px;
										text-align:left;border-color:black;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form4684Data/ShortTermTheftProperty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:32mm;border-top-width: 1px;
										border-bottom-width: 1px;border-color:black;">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:34mm;border-top-width: 1px;
										border-bottom-width: 1px;border-color:black;">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-right-width:0px;
										border-top-width: 1px;border-bottom-width: 1px;border-color:black;">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr style="height:4mm;">
										<td class="styTableCell" style="width:8mm;border-right-width:0px;
									border-bottom-width:1px;text-align:left;border-top-width: 1px;
									font-weight:bold;	font-size:7pt;padding-left:1mm"/>
										<td class="styTableCell" style="width:80mm;border-top-width: 0px;
										border-bottom-width: 1px;border-color:black;">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-top-width: 0px;
										border-bottom-width: 1px;border-color:black;">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:34mm;border-top-width: 0px;
										border-bottom-width: 1px;border-color:black;">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-top-width: 0px;
										border-bottom-width: 1px;border-right-width:0px;border-color:black;">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form4684Data/ShortTermTheftProperty"/>
						<xsl:with-param name="containerHeight" select="2"/>
						<xsl:with-param name="headerHeight" select="0"/>
						<xsl:with-param name="containerID" select=" 'STctn' "/>
					</xsl:call-template>
					<!-- Line 33 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">33</div>
						<div class="styLNDesc" style="width:71.5mm;height:4mm;">
							<span>
								<span style="float:left;">
					            Totals. Add the amounts on line 32
					            </span>
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span class="styDotLn">......</span>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
				            33
				          </div>
						<div class="styLNAmountBox" style="width:32.8mm;font-size: 6pt;height:4.5mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form4684Data/ShortTermTradeOrBusinessTotal"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						</div>
						<div class="styLNAmountBox" style="width:34.7mm;font-size: 6pt;height:4.5mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form4684Data/ShortTermPropertyIncomeProdTot"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						</div>
						<div class="styLNAmountBox" style="width:32mm;font-size: 6pt;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4684Data/ShortTermTheftTotalGains"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						</div>
					</div>
					<!-- Line 34  -->
					<div class="styBB" style="width:187mm;">
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">
					              34
					            </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
					              Combine line 33, columns (b)(i) and (c). 
					              Enter the net gain or (loss) here and on Form 4797, line 14. If
					              <span>
									<span style="float:left;">					              
					               Form 4797
					              is not otherwise required, see instructions
					              </span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">.................</span>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;padding-top:4mm;">34
					            </div>
							<div class="styLNAmountBox" style="height:7mm;padding-top:4mm;width:32mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/ShortTermPropNetGainOrLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  ******************************************************************************  -->
						<!--  ****************************************************************************** -->
						<!-- Line 35 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">35
					            </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
					              Enter the amount from line 33, column (b)(ii) here. Individuals, enter the amount from
					               income-producing property
					              on Schedule A (Form 1040), line 28, or Form 1040NR, Schedule A, line 16, and enter the 
					              amount from property used as an employee on Schedule A (Form 1040), line 23, or 
					              Form 1040NR, 
					              <span>
									<span style="float:left;">
					             Schedule A, line 11. Estates and trusts, partnerships, and S corporations, see instructions
					             </span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">....</span>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;
							background-color:lightgrey;padding-bottom:0mm;border-bottom-width:0px;">
								<span style="background-color:white;width:100%;height:3.9mm;">35</span>
							</div>
							<div class="styLNAmountBox" style="height:14mm;padding-top:10mm;width:32mm;
							                    border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/ShortTermPropertyIncomeTotal"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Theft property of more than one year -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartDesc" style="float:left;clear:none;text-align:center;width:179mm;">
						     Casualty or Theft of Property Held More Than One Year
						     </div>
						<div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
						</div>
					</div>
					<!-- Line 36 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">
					          36
					        </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span>
								<span style="float:left;">
					         Casualty or theft gains from Form 4797, line 32</span>
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span class="styDotLn">...................</span>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="">36</div>
						<div class="styLNAmountBox" style="width:32mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4684Data/CasualtyOrTheftGainFrom4797Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:if test="(count($Form4684Data/LongTermTheftProperty) &gt; 2) and ($Print != $Separated)">
						<div class="styGenericDiv" style="width:187mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form4684Data/LongTermTheftProperty"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="headerHeight" select="0"/>
								<xsl:with-param name="containerID" select=" 'LTctn' "/>
							</xsl:call-template>
						</div>
					</xsl:if>
					<!-- place holder for the second table -->
					<div class="styTableContainerNBB" id="LTctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<!-- If the Optional Print feature is OFF OR if Optional Print feature is ON and the there is 
								less
								 than 3 sets of data set -->
								<!--    *********************************************************************************************   -->
								<!--    *********************************************************************************************   -->
								<!-- Line 37-->
								<xsl:if test="($Print != $Separated) or
	                     		 ( ($Print = $Separated) and (count($Form4684Data/LongTermTheftProperty) 
	                     		 &lt; 3) )">
									<xsl:for-each select="$Form4684Data/LongTermTheftProperty">
										<tr>
											<td class="styTableCell" style="width:8mm;text-align:left;height:4mm;
											border-right-width:0px;border-bottom-width:0px;border-color:black">
												<xsl:if test="position()=1">
													<span style="text-align:left;font-weight:bold;
													border-right-width:0px;border-bottom-width:0px;font-size:7pt;
													padding-left:1mm">37</span>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:77.5mm;text-align:left;height:4mm;
											  border-bottom-width:1px;border-color:black">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CasualtyOrTheftDescription"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;height:4mm;
											       border-bottom-width:1px;border-color:black">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="TradeOrRentalProperty"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;height:4mm;
											   ; border-right-width: 1px;border-bottom-width:1px;border-color:black">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="IncomeProducingProperty"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;height:4mm;border-color:black;
											border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainsFromCasualtiesOrTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:if test="count($Form4684Data/LongTermTheftProperty) &lt; 1">
										<tr style="height:4mm;">
											<td class="styTableCell" style="width:8mm;text-align:left;height:4mm;
											border-right-width:0px;border-bottom-width:0px;font-weight:bold;
											font-size:7pt;padding-left:1mm;">37
               								 <span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:77.5mm;border-top-width:0px;border-bottom-width:0px;
											 border-left-width:0px;border-right-width:1px;border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;border-top-width:0px;border-bottom-width:0px;
											 border-left-width:0px;border-right-width:1px;border-color:black">
              								  (<span style="width:16px;"/>)<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:33.8mm;border-top-width:0px;border-bottom-width:0px;
											 border-left-width:0px;border-right-width:1px;border-color:black">
                                              (<span style="width:16px;"/>)<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:31mm;border-right-width:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form4684Data/LongTermTheftProperty) &lt; 2">
										<tr style="height:4mm;">
											<td class="styTableCell" style="width:8mm;text-align:left;height:4mm;
											border-right-width:0px;border-bottom-width:0px;font-weight:bold;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:77.5mm;border-top-width:1px;
											 border-left-width:0px;border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;border-top-width:1px;
											border-color:black">
                                            (<span style="width:16px;"/>)<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:33.8mm;
											border-top-width:1px;border-color:black">
                                           (<span style="width:16px;"/>)<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:31mm;border-top-width:1px;
											border-right-width:0px;border-color:black">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
								<!-- If Optional Print feature is ON and there are more than 2 sets of repeating data,
								 print comment -->
								<!-- "See Additional Table" and print empty rows.-->
								<xsl:if test="($Print = $Separated) and 
								(count($Form4684Data/LongTermTheftProperty) &gt; 2)">
									<tr style="height:4mm;">
										<td class="styTableCell" style="width:8mm;text-align:left;height:4mm;
										border-left-width:0px;border-right-width:0px;border-bottom-width:0px;font-weight:bold;
										font-size:7pt;padding-left:1mm;">37
                                            <span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:95mm;text-align:left;
										border-right-width:1px;border-bottom-width:1px;border-left-width:0px;
										border-top-width:1px;border-color:black;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form4684Data/LongTermTheftProperty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:36mm;border-right-width:1px;
										border-bottom-width:1px;border-left-width:0px;border-top-width:1px;border-color:black">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:45mm;border-right-width:1px;
										border-bottom-width:1px;border-left-width:0px;border-top-width:1px;border-color:black;">
											<span style="width:16px;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:35mm;border-right-width:0px;
										border-bottom-width:1px;border-left-width:0px;border-top-width:0px;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr style="height:4mm;">
										<td class="styTableCell" style="width:8mm;text-align:left;height:4mm;
										border-right-width:0px;border-bottom-width:0px;font-weight:bold;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:81mm;border-right-width:1px;
										border-bottom-width:1px;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-right-width:1px;
										border-bottom-width:1px;font-weight:bold;border-color:black;">
											<span style="width:16px;border-left-width:0px;border-bottom-width:1px;border-color:black;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-left-width:0px;
										border-bottom-width:1px;border-color:black;">
											<span style="width:16px;border-left-width:1px;border-color:black;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:35mm;height:6mm;border-left-width:0px;
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
					<!-- END Line 37 -->
					<!-- Line 38 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">
					          38
					        </div>
						<div class="styLNDesc" style="width:71.5mm;height:4mm;font-size: 6pt;">
					          Total losses. Add amounts on line 37, columns (b)(i) and (b)(ii)
					          <span class="styBoldText"/>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-top-width:0px;
						border-color:black;">
					          38
					        </div>
						<div class="styLNAmountBox" style="width:32.8mm;font-size: 6pt;height:5mm;
						   border-top-width:0px;border-color:black">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form4684Data/LongTermTradeOrBusinessTotal"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						</div>
						<div class="styLNAmountBox" style="width:34.7mm;font-size: 6pt;height:5mm;
						border-top-width:0px;border-color:black">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form4684Data/LongTermPropertyIncomeProdTot"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						</div>
						<div class="styLNAmountBox" style="width:32mm;background-color:lightgrey;
						height:5mm;border-top-width:0px;border-color:black"/>
					</div>
					<!-- line 39-->
					<div class="styBB" style="width:187;">
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">
						            39
						          </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span>
									<span style="float:left;">
						            Total gains. Add lines 36 and 37, column (c)
</span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">....................</span>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="">
					            39
					          </div>
							<div class="styLNAmountBox" style="">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/LongTermPropertyTotalGains"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 40 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">
					            40
					          </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span>
									<span style="float:left;">

						            Add amounts on line 38, columns (b)(i) and (b)(ii)  
</span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">..................</span>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="">
					            40
					          </div>
							<div class="styLNAmountBox" style="">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/LongTermPropertyLossesTotal"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 41 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">
					            41
					          </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
					            If the loss on line 40 is <span class="styBoldText">more</span> than the gain on
					             line 39:  
					            <span class="styBoldText"/>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;">
								<span style="width:4px;"/>
							</div>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm">a
					        </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;padding-bottom:0px">
					            Combine line 38, column (b)(i) and line 39, and enter the net gain or (loss) here. 
					            Partnerships (except electing large partnerships) and S corporations, 
					            see the note below. All others, enter this amount on 
					            
					            <span>
									<span style="float:left;">
					            Form 4797, line 14. If Form 4797
					             is not otherwise required, see instructions
</span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">.........</span>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:10mm;padding-top:6mm;
							background-color:lightgrey;padding-bottom:0mm;">
								<span style="background-color:white;width:100%;height:3.9mm;">41a</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;padding-top:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/LongTermPropertyNetGainOrLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm">b
					        </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;padding-top: 0px">
Enter the amount from line 38, column (b)(ii) here. Individuals, enter the amount from income-producing<br/>
property on Schedule A (Form 1040), line 28, or Form 1040NR, Schedule A, line 16, and enter the<br/>
amount from property used as an employee on Schedule A (Form 1040), line 23 or Form 1040NR,<br/>
Schedule A, line 11. Estates and trusts, enter on the "Other deductions" line of your tax return.<br/>
 Partnerships (except electing large partnerships) and S corporations, see the note below. Electing<br/> 
	           				  <span>
									<span style="float:left;">
	           				   large partnerships, enter on Form 1065-B, Part II, line 11                
</span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">...............</span>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:20mm;padding-top:16mm;
							background-color:lightgrey;padding-bottom:0mm;">
								<span style="background-color:white;width:100%;height:3.9mm;">41b</span>
							</div>
							<div class="styLNAmountBox" style="height:20mm;padding-top:16mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/LongTermPropertyIncomeTotal"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 42 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">42
					          </div>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
						          If the loss on line 40 is <span class="styBoldText">less</span> than or 
						          <span class="styBoldText">equal</span> to the gain on line 39, combine lines 39 and 40
						            and enter here. Partnerships (except electing large
						            
 partnerships), see the note 
						            below. All others, enter this amount on 
						            <span>
									<span style="float:left;">
						            
						            Form 4797, line 3   

</span>
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span class="styDotLn">............................</span>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:10mm;padding-top:7mm;">42
					          </div>
							<div class="styLNAmountBox" style="height:10mm;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4684Data/LongTermPropIncomePlusGain"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;"/>
							<div class="styLNDesc" style="width:139mm;height:4mm;">
								<span class="styBoldText" style="vertical-align: top;">Note:</span>
								<span style="width: 130mm; padding-left: 1mm;">
									<span class="styItalicText">
						                Partnerships, enter the amount from line 41a, 41b, or line 42 on Form 1065,
						                 Schedule K, line 11. <br/>
						                S corporations, enter the amount from line 41a or 41b on Form 1120S, 
						                Schedule K, line 10.
						              </span>
								</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:7mm;padding-top:4mm;
							border-right-width:0px;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:7mm;padding-top:4mm;
							border-left-width:0px;background-color:lightgrey;"/>
						</div>
					</div>
					<!-- Footer -->
					<div class="styGenericDiv " style="width:187mm;float:none;clear:both;padding-top:1mm;">
						<div style="width:95mm;float:left;clear:none;"/>
						<div style="width:40mm;float:left;clear:none;"/>
						<div style="float:right;clear:none;">Form <span class="styBoldText">4684 </span>(2010)    
						</div>
					</div>
					<!-- Introducing pageend before the additional data -->
					<p class="pageend"/>
					<!-- Begininning of write-in data -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle"> Additional Data        
                        </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form4684Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 4684, Top Left Margin - Revenue Procedure 2009-20 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form4684Data/@revenueProcedure200920Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 30 - Note</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties/NetBusinessPropertyLoss/@note"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<xsl:if test="($Print = $Separated) and (count($Form4684Data/PersonalUseProperties) 
					&gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 4684, SECTION A, Line 1 — 
						Personal Use Property:
						</span>
						<table class="styDepTbl" style="font-size:7pt">
							<xsl:for-each select="$Form4684Data/PersonalUseProperties">
								<tr style="font-size:7pt;height:6mm;border-color:black;">
									<!-- Define background colors to the rows -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">
									styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellNoBorders" style="text-align:left;width:33mm;
									padding-left:0mm;vertical-align:bottom;border-bottom-width:1px;
									border-right-width:1px;">
                                    Property <span class="styBoldText">
											<xsl:number format="A"/>
										</span>
									</td>
									<td class="styTableCellNoBorders" style="width:158mm;text-align:left;
									padding-left:0mm;border-bottom-width:1px;vertical-align:bottom;
									border-color: black;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="DescriptionOfProperty"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($Form4684Data/PersonalUseProperties) 
					&gt; 4)">
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
											<th>
												<span class="styTableCellPad"/>
											</th>
											<th style="width:8mm;color:lightgrey;height:5mm;">
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
											text-align:left;padding-left:6mm;font-weight:medium;">
												<span class="styTableCellPad"/>
											</th>
											<th class="styDepTblCell" style="width:5mm;height:3mm;
											border-color:black;border-left-width:0px;border-right-width:1px;
											border-top-width:0px;border-bottom-width:1px;">
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
														border-right-width:0px; border-top-width:0px;border-bottom-width:1px;">
														B<span class="styTableCellPad"/>
														</td>
														<td class="styDepTblCell" style="text-align:center;
														font-weight:bold;border-color:black;border-left-width:1px;
														border-right-width:0px; border-top-width:0px;border-bottom-width:1px;">
														C<span class="styTableCellPad"/>
														</td>
														<td class="styDepTblCell" style="text-align:center;
														font-weight:bold;border-color:black;border-left-width:1px;
														border-right-width:0px; border-top-width:0px;border-bottom-width:1px;">
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
														border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
														C<span class="styTableCellPad"/>
														</td>
														<td class="styTableCellSmall" style="text-align:center;
														font-weight:bold;border-color:black;border-left-width:1px;
														border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
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
														border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
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
									<tr class="styDepTblRow1">
										<td style="border:none;" scope="row">
											<span>
												<span class="styGenericDiv" style="width:8mm;
													font-weight:bold;border-top-width:1px;font-size:7pt;padding-left:2.5mm;">2</span>
												<span class="styGenericDiv" style="width:64mm;font-size:7pt;">
													<span>
														<span style="float:left;">
														Cost or other basis of each property
														</span>
														<span class="styBoldText" style="float:right;font-size:8pt;">
															<span class="styDotLn">....</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										vertical-align:bottom;border-color:black;border-left-width:1px;
										border-right-width:0px;border-top-width:1px;
										border-bottom-width:1px;font-weight:bold;padding-left:1mm;">2
										<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black;
										border-left-width:1px;border-right-width:0px;border-top-width:0px;
										border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisOfEachProp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black;
										border-left-width:1px;border-right-width:0px;border-top-width:0px;
										border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos + 1]/CostOrOtherBasisOfEachProp"/>
											</xsl:call-template>
											<span class="styTableCellPad" style="border-color:black;
											border-left-width:1px;border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black;
										border-left-width:1px;border-right-width:0px;border-top-width:0px;
										border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos +  2]/CostOrOtherBasisOfEachProp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black;
										border-left-width:1px;border-right-width:0px;border-top-width:0px;
										border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos + 3]/CostOrOtherBasisOfEachProp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td style="border:none;">
											<span>
												<span class="styGenericDiv" style="width:8mm;
													font-size:7pt;padding-left:2.5mm;font-weight:bold;">3</span>
												<span class="styGenericDiv" style="width:64mm;font-size:7pt;text-align:left;"> 
                      									Insurance or other reimbursement (whether or
                      									<span>
														<span style="float:left;">
                      									not you filed a claim) (see instructions)</span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">...</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										vertical-align:bottom;font-weight:bold;border-color:black;
										border-left-width:1px;border-right-width:0px;border-top-width:0px;
										border-bottom-width:1px;">3<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="InsuranceOrOtherReimbursement"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos + 1]/InsuranceOrOtherReimbursement"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos + 2]/InsuranceOrOtherReimbursement"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos + 3]/InsuranceOrOtherReimbursement"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr class="styDepTblRow1">
										<td style="border:none;font-size:7pt;">
											<span>
												<span style="padding-left:5mm;">
													<span class="styItalicText" style="width:64mm;text-align:left;">
														<span class="styBoldText" style="float:left;text-align:left;">Note:</span> If line 2 is 
                       											<span class="styBoldText">  more </span> than line 3, 
                       											skip line 4.</span>
													<span class="styGenericDiv" style="width:8mm;padding-top:1mm;
													font-weight:bold;padding-left:2.5mm">4</span>
													<span class="styGenericDiv" style="width:65mm;padding-top:1mm;text-align:left;">
                        									Gain from casualty or theft. If line 3 is <span class="styBoldText">
									                    more</span> than line 2, enter the difference here and skip lines 5
									                    through 9 for that column. See instructions if line 3 includes insurance 
									                    or other reimbursement you did not claim, or you received payment for your
									                    <span>
															<span style="float:left;">
									                     loss in a later tax year</span>
															<span class="styBoldText" style="float:right;padding-right:1mm;">
																<span class="styDotLn">........</span>
															</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										vertical-align:bottom;font-weight:bold;border-color:black;
										border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;padding-left:1mm">4
										<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainFromCasualtyOrTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos +  1]/GainFromCasualtyOrTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos +  2]/GainFromCasualtyOrTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos +  3]/GainFromCasualtyOrTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td style="border:none;font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;
													font-weight:bold; padding-left:2.5mm;">5</span>
												<span class="styGenericDiv" style="width:64mm;">
													<span>
														<span style="float:left;">Fair market value 
                       										<span class="styBoldText">before</span> casualty or theft</span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">..</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										vertical-align:bottom;font-weight:bold;border-color:black;
										border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;padding-left:1mm">5
										<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FairMarketValueBeforeTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;
										font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos +  1]/FairMarketValueBeforeTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos +  2]/FairMarketValueBeforeTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos +  3]/FairMarketValueBeforeTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr class="styDepTblRow1">
										<td style="border:none;font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;
													font-weight:bold;
													padding-left:2.5mm">6</span>
												<span class="styGenericDiv" style="width:64mm;">
													<span>
														<span style="float:left;">
														Fair market value <span class="styBoldText"> after </span>casualty or theft</span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">...</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										vertical-align:bottom;font-weight:bold;border-color:black;
										border-left-width:1px;border-right-width:0px;
										border-top-	width:0px;border-bottom-width:1px;padding-left:1mm;font-weight:bold;
">6
										<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FairMarketValueAfterTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos + 1]/FairMarketValueAfterTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos +  2]/FairMarketValueAfterTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos + 3]/FairMarketValueAfterTheft"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td style="font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;
													font-weight:bold;padding-left:2.5mm">7</span>
												<span class="styGenericDiv" style="width:64mm;">
													<span>
														<span style="float:left;">
													 Subtract line 6 from line 5</span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">........</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										vertical-align:bottom;font-weight:bold;border-color:black;
										border-left-width:1px;border-right-width:0px;border-top-width:0px;
										border-bottom-width:1px;">7<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FairMarketValueDifference"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos +  1]/FairMarketValueDifference"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos + 2]/FairMarketValueDifference"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos + 3]/FairMarketValueDifference"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr class="styDepTblRow1">
										<td style="font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;font-weight:bold;
													padding-left:2.5mm">8</span>
												<span class="styGenericDiv" style="width:64mm;">
													<span>
														<span style="float:left;">
														 Enter the <span class="styBoldText"> smaller </span> of line 2 or line 7
														 </span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">....</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										vertical-align:bottom;font-weight:bold;border-color:black;
										border-left-width:1px;border-right-width:0px;
										border-top-	width:0px;border-bottom-width:1px;padding-left:1mm">8
										<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SmllrOfCostAndFairMarketVlDiff"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos + 1]/SmllrOfCostAndFairMarketVlDiff"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos + 2]/SmllrOfCostAndFairMarketVlDiff"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos + 3]/SmllrOfCostAndFairMarketVlDiff"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td style="border:none;font-size:7pt;">
											<span>
												<span class="styGenericDiv" style="width:8mm;font-weight:bold;
													padding-left:2.5mm">9</span>
												<span class="styGenericDiv" style="width:64mm;">
								                         Subtract line 3 from line 8. If zero or less, enter
								                         <span>
														<span style="float:left;">
								                          -0-
								                          </span>
														<span class="styBoldText" style="float:right;">
															<span class="styDotLn">...............</span>
														</span>
													</span>
												</span>
											</span>
										</td>
										<td class="styIRS4684TableCellSmallRB" style="width:5mm;
										vertical-align:bottom;font-weight:bold;border-color:black;
										border-left-width:1px;border-right-width:0px;border-top-width:0px;
										border-bottom-width:1px;">9<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PropertyMinusInsuranceValue"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;
										font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos + 1]/PropertyMinusInsuranceValue"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos + 2]/PropertyMinusInsuranceValue"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="vertical-align:bottom;
										border-color:black;border-left-width:1px;border-right-width:0px;
										border-top-width:0px;border-bottom-width:1px;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4684Data/PersonalUseProperties
												[$pos + 3]/PropertyMinusInsuranceValue"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</table>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($Form4684Data/BusinessProperties) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 4684, SECTION B, Part I, Line 22 - Casualty
						 or Theft Gain
						 or Loss:</span>
						<div>
							<table class="styDepTbl">
								<xsl:for-each select="$Form4684Data/BusinessProperties">
									<tr style="font-size:7pt;height:6mm;border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">
										styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellNoBorders" style="text-align:left;width:33mm;
										vertical-align:bottom;border-bottom-width:1px;border-right-width:1px;">
                                                 Property <span class="styBoldText"/>
											<xsl:number format="A"/>
										</td>
										<td class="styTableCellNoBorders" style="width:158mm;text-align:left;
										border-bottom-width:1px;vertical-align:bottom;border-color: black;">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DescriptionOfProperty"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</table>
						</div>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($Form4684Data/BusinessProperties) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 4684, SECTION B, Part I, Lines 23-30 - 
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
												<th>
													<span class="styTableCellPad"/>
												</th>
												<th class="styDepTblCell" style="width:8mm;height:5mm;border:none;" scope="col">
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
												font-size:7pt;text-align:left;padding-left:6mm;font-weight:medium;" scope="col">
													<span class="styTableCellPad"/>
												</th>
												<th class="styDepTblCell" style="width:5mm;height:3mm;border:none;">
													<span class="styTableCellPad"/>
												</th>
												<xsl:for-each select="$Form4684Data/BusinessProperties">
													<xsl:if test="(position() &gt;= $pos and position() &lt; $pos+4)">
														<td class="styDepTblCell" scope="col" style="text-align:center;
														font-weight:bold;border-color:black;border-left-width:1px;
														border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
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
														<xsl:when test="count($Form4684Data/BusinessProperties)
														 &lt; 3">
															<td class="styTableCellSmall" style="text-align: center;
														font-weight:bold;border-color:black;border-left-width:1px;
														border-right-width:0px;border-top-width:0px;border-bottom-width:1px;">
														C<span class="styTableCellPad"/>
															</td>
															<td class="styTableCellSmall" style="text-align: center;
															font-weight:bold;border-color:black;border-left-width:1px;
															border-right-width:0px;border-top-width:0px;
															border-bottom-width:1px;">D<span class="styTableCellPad"/>
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
															font-weight:bold;border-color:black;border-left-width:1px;
															border-right-width:0px;border-top-width:0px;
															border-bottom-width:1px;">D<span class="styTableCellPad"/>
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
										<!--  line 23  -->
										<tr class="styDepTblRow1">
											<td style="border:none;">
												<span>
													<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">23</span>
															<span style="float:left;padding-left:2mm;">Cost or adjusted basis of each property</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">...</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB " style="width:5mm;
											border-top-width:1px;font-weight:bold;border-color:black;vertical-align:bottom;
											border-left-width:1px;border-right-width:0px;border-top-width:1px;
											border-bottom-width:1px;padding-left:3mm;">23
											<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;
												text-align:right;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CostOrAdjustedBasisOfEachProp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;
												text-align:right;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 1]/CostOrAdjustedBasisOfEachProp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;
												text-align:right;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos +  2]/CostOrAdjustedBasisOfEachProp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;
												text-align:right;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos +  3]/CostOrAdjustedBasisOfEachProp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!--  line 24  -->
										<tr class="styDepTblRow2">
											<td style="border:none;">
												<span>
													<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">24</span>
															<span style="float:left;padding-left:2mm;text-align:left;">Insurance or other reimbursement (whether or<br/>
 not you filed a claim). See the instructions for	<span>
																	<span style="float:left;"> line 3 </span>
																	<span class="styBoldText" style="float:right;padding-right:2mm;">
																		<span class="styDotLn">..............</span>
																	</span>
																</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB " style="width:5mm;
											border-top-width:1px;font-weight:bold;border-color:black;vertical-align:bottom;
											border-left-width:1px;border-right-width:0px;border-top-width:1px;
											border-bottom-width:1px;padding-left:3mm;">24
											<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;
												text-align:right;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="InsuranceOrOtherReimbursement"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 1]/InsuranceOrOtherReimbursement"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="border-color:black;
													border-left-width:1px;border-right-width:0px;border-top-width:0px;
													border-bottom-width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 2]/InsuranceOrOtherReimbursement"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="border-color:black;
													border-left-width:1px;border-right-width:0px;border-top-width:0px;
													border-bottom-width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 3]/InsuranceOrOtherReimbursement"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- line 25 -->
										<tr class="styDepTblRow1">
											<td style="border:none;">
												<span>
													<span class="styItalicText" style="font-size:7pt;width:66mm;text-align:left;">
														<span class="styBoldText" style="font-style: normal;padding-left:2mm;">Note:</span> If 
															line 23 is <span class="styBoldText">more</span> than line 24, skip line
															<span style="padding-left:2mm"/>25.</span>
													<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">25</span>
															<span style="float:left;padding-left:2mm;text-align:left;">
															Gain from casualty or theft. If line 24 is <b>more</b>
																<br/>
																than line 23, enter the difference here and on<br/>
																line 32 or line 37, column (c), except as<br/>
																provided in the instructions for line 36. Also,<br/>
																skip lines 26 through 30 for that column.  See<br/>
																the instructions for line 4 if line 24 includes
																insurance or other reimbursement you did not<br/>
																claim, or you received payment for your loss<br/>
																<span>
																	<span style="float:left;">in a later tax year</span>
																	<span class="styBoldText" style="float:right;padding-right:2mm;">
																		<span class="styDotLn">..........</span>
																	</span>
																</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<!-- line 25-2 -->
											<td class="styIRS4684TableCellSmallRB " style="width:5mm;vertical-align:bottom;
											  font-weight:bold;border-left-width:1px;border-right-width:1px;border-top-width:0px;
											  border-bottom-width:1px;border-color:black;padding-left:1mm;">25
	</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:0px;
												   border-right-width:1px;border-top-width:0px;border-bottom-width:1px;
												   border-color:black;text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainFromCasualtyOrTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:0px;
											border-right-width:1px;border-top-width:0px;border-bottom-width:1px;
											border-color:black;text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
													[$pos +1]/GainFromCasualtyOrTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;border-left-width:0px;
											    border-right-width:1px;border-top-width:0px;border-bottom-width:1px;
											    border-color:black;text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
													 [$pos + 2]/GainFromCasualtyOrTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties [$pos + 
													   3]/GainFromCasualtyOrTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!--   Line 26 -->
										<tr class="styDepTblRow2">
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">26</span>
															<span style="text-align:left;float:left;padding-left:2mm;">Fair market value <b> before </b> casualty or theft 
																</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">..</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB " style="width:5mm;
											border-top-width:1px;font-weight:bold;border-color:black;
											border-left-width:1px;border-right-width:0px;border-top-width:1px;
											border-bottom-width:1px;padding-left:3mm;">26
											<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
										     		;border-left-width:1px;border-right-width:1px;
										    		border-top-width:0px;border-bottom-width:1px;border-color:black;
										    		text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FairMarketValueBeforeTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
										     		border-left-width:0px;border-right-width:1px;border-top-width:0px;
										    		border-bottom-width:1px;border-color:black;text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 1]/FairMarketValueBeforeTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
												border-left-width:0px;border-right-width:1px;border-top-width:0px;
												border-bottom-width:1px;border-color:black;text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 2]/FairMarketValueBeforeTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
												border-color:black;border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;text-align:right;font-size:6pt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 3]/FairMarketValueBeforeTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<tr class="styDepTblRow1">
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">27</span>
															<span style="float:left;padding-left:2mm;">
													 Fair market value <b> after </b> casualty or theft																
																</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">..</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB " style="width:5mm;
											border-top-width:1px;font-weight:bold;border-color:black;
											border-left-width:1px;border-right-width:0px;border-top-width:1px;
											border-bottom-width:1px;padding-left:2mm;">27<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
											border-left-width:1px;border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FairMarketValueAfterTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
											border-left-width:1px;border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
													[$pos + 1]/FairMarketValueAfterTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
											border-left-width:1px;border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
													[$pos + 2]/FairMarketValueAfterTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="border-color:black;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;
											border-left-width:1px;border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
													[$pos + 3]/FairMarketValueAfterTheft"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!--  Line 28   -->
										<tr class="styDepTblRow2">
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">28</span>
															<span style="float:left;padding-left:2mm;">
													 Subtract line 27 from line 26															
																</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">......</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB " style="width:5mm;
											font-weight:bold;border-color:black;
											border-left-width:1px;border-right-width:0px;
											border-top-	width:0px;border-bottom-width:1px;padding-left:3mm">28
											<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FairMarketValueDifference"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
													[$pos + 1]/FairMarketValueDifference"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
													[$pos + 2]/FairMarketValueDifference"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
													[$pos + 3]/FairMarketValueDifference"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!--  Line 29   -->
										<tr class="styDepTblRow1">
											<td style="border:none;font-size:7pt;">
												<span>
													<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">29</span>
															<span style="float:left;padding-left:2mm;">
														 Enter the <b> smaller </b> of line 23 or line 28														
																</span>
															<span class="styBoldText" style="float:right;padding-right:2mm;">
																<span class="styDotLn">...</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm;
											vertical-align:bottom;font-weight:bold;border-color:black;
											border-left-width:1px;border-right-width:0px;border-top-width:0px;
											border-bottom-width:1px;padding-left:2mm">29<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
											border-color:black;border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SmllrOfCostAndFairMarketVlDiff"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
											border-color:black;border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
													[$pos + 1]/SmllrOfCostAndFairMarketVlDiff"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
											border-color:black;border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
													[$pos + 2]/SmllrOfCostAndFairMarketVlDiff"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;
											border-color:black;border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;font-size:6pt;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
													[$pos + 3]/SmllrOfCostAndFairMarketVlDiff"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!--   Line 30   -->
										<tr class="styDepTblRow2">
											<td style="border:none;font-size:7pt;">
												<span class="styItalicText" style="text-align:left;font-size:7pt;padding-top:1mm;padding-left:4mm;width:70mm;">
													<span class="styBoldText" style="font-style:normal;">
			Note:
		</span>
		If the property was totally destroyed by casualty or lost from theft, enter on line 29 the  amount from line 23.
		</span>
												<span>
													<span class="styGenericDiv" style="width:70mm;font-size:7pt;">
														<span>
															<span class="styBoldText" style="float:left;padding-left:1mm;">30</span>
															<span style="float:left;text-align:left;padding-left:2mm;">
 Subtract line 24 from line 29. If zero or less, 
<span style="float:left;"> enter -0- </span>
																<span class="styBoldText" style="float:right;padding-right:2mm;">
																	<span class="styDotLn">.............</span>
																</span>
															</span>
														</span>
													</span>
												</span>
											</td>
											<td class="styIRS4684TableCellSmallRB" style="width:5mm;vertical-align:bottom;
											font-weight:bold;border-color:black;border-left-width:1px;border-right-width:0px;
											border-top-width:0px;border-bottom-width:1px;padding-left:3mm">30
											<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;font-size:6pt;text-align:right;
												border-color:black;border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties/NetBusinessPropertyLoss"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 30 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties[$pos]/
																	                                      NetBusinessPropertyLoss/@note"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetBusinessPropertyLoss"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="padding-right:2mm;
												vertical-align:bottom;border-left-width:1px;font-size:6pt;text-align:right;
												border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;border-color:black;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties[$pos+
															 1]/NetBusinessPropertyLoss"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 30 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties[$pos+1]/
																	                                      NetBusinessPropertyLoss/@note"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 1]/NetBusinessPropertyLoss"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;font-size:6pt;text-align:right;
												border-left-width:1px;border-right-width:0px;border-top-width:0px;
												border-bottom-width:1px;border-color:black;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form4684Data/
															BusinessProperties[$pos+2]/NetBusinessPropertyLoss"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 30 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties[$pos+2]/
																	                                      NetBusinessPropertyLoss/@note"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 2]/NetBusinessPropertyLoss"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;font-size:6pt;text-align:right;
												border-color:black;border-left-width:1px;border-right-width:0px;
												border-top-width:0px;border-bottom-width:1px;">
												<div style="text-align:left;padding-bottom:1mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form4684Data/
															BusinessProperties[$pos+3]/NetBusinessPropertyLoss"/>
													</xsl:call-template>
													<!-- Adding pen image -->
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 30 - Note</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties[$pos+3]/
																	                                      NetBusinessPropertyLoss/@note"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4684Data/BusinessProperties
														[$pos + 3]/NetBusinessPropertyLoss"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</table>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($Form4684Data/ShortTermTheftProperty) 
					&gt; 2)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 4684, SECTION B, Part II, Line 32 - 
						Casualty or Theft of Property Held One Year or Less:</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:89mm;" scope="col" colspan="1">
										<span class="styPartName" style="width:13mm;">Part II</span>
										<span class="styPartDesc" style="width:76mm;padding-left:1mm; font-size: 7pt;">
								                 Summary of Gains and Losses <span class="styNormalText">
								                 (from separate Parts I)</span>
										</span>
									</th>
									<th class="styDepTblCell" style="width:64mm;font-weight:normal;" colspan="2" scope="col">
										<span style="font-weight:bold;">
						                 (b) 
						               </span> Losses from casualties or thefts
						             </th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;vertical-align:middle;" rowspan="2" scope="col">
										<span style="font-weight:bold;">
						                 (c)
						               </span> Gains from casualties or thefts includible in income
						             </th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:89mm;vertical-align:middle;" scope="col" colspan="1">
										<span class="styGenericDiv" style="width:89mm;padding-left:2mm;
										text-align:center;font-weight:normal;">
											<span class="styBoldText">(a)</span> Identify casualty or theft
               						 	</span>
									</th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;" scope="col">
										<span class="styItalicText">(i) </span>Trade, business, rental or royalty property
             							</th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;" scope="col">
										<span class="styItalicText">(ii) </span> Income-producing and employee property
             							</th>
								</tr>
								<tr class="styDepTblHdr">
									<td colspan="4" class="styPartDesc" style="text-align:center;
									border-bottom: 1px solid black;">
						               Casualty or Theft of Property Held One Year or Less
						             </td>
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
											<xsl:attribute name="style">border-top-width:1px;width:81mm;text-align:left;
											</xsl:attribute>
										</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="CasualtyOrTheftDescription"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:32mm;">
										<xsl:if test="position()=1">
											<xsl:attribute name="style">border-top-width:1px;</xsl:attribute>
										</xsl:if>
										<xsl:call-template name="PopulateNegativeNumber">
											<xsl:with-param name="TargetNode" select="TradeOrRentalProperty"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:32mm;">
										<xsl:if test="position()=1">
											<xsl:attribute name="style">border-top-width:1px;</xsl:attribute>
										</xsl:if>
										<xsl:call-template name="PopulateNegativeNumber">
											<xsl:with-param name="TargetNode" select="IncomeProducingProperty"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:32mm;">
										<xsl:if test="position()=1">
											<xsl:attribute name="style">border-top-width:1px;</xsl:attribute>
										</xsl:if>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GainsFromCasualtiesOrTheft"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
					<!-- If Optional Print feature is ON and there is more than 2 sets of repeating data, print comment -->
					<!-- "See Additional Table" and print empty rows.-->
					<xsl:if test="($Print = $Separated) and (count($Form4684Data/LongTermTheftProperty)
					 &gt; 2)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 4684, SECTION B, Part II, Line 37 -
						 Casualty or Theft of 
						Property Held More Than One Year:</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:89mm;" scope="col" colspan="1">
										<span class="styPartName" style="width:13mm;">Part II</span>
										<span class="styPartDesc" style="width:76mm;padding-left:1mm; font-size: 7pt;">
							                 Summary of Gains and Losses <span class="styNormalText">
							                 (from separate Parts I)</span>
										</span>
									</th>
									<th class="styDepTblCell" style="width:64mm;font-weight:normal;" colspan="2" scope="col">
										<span style="font-weight:bold;">
						                 (b) 
						               </span> Losses from casualties or thefts
						             </th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;vertical-align:middle;" rowspan="2" scope="col">
										<span style="font-weight:bold;">
							                 (c)
							               </span> Gains from casualties or thefts includible in income
							             </th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:89mm;vertical-align:middle;" scope="col" colspan="1">
										<span class="styGenericDiv" style="width:89mm;padding-left:2mm;
										text-align:center;font-weight:normal;">
											<span class="styBoldText">(a)</span> Identify casualty or theft
               							</span>
									</th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;" scope="col">
										<span class="styItalicText">(i) </span>Trade, business, rental or royalty property
             							</th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;" scope="col">
										<span class="styItalicText">(ii) </span> Income-producing and employee property
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
											<xsl:with-param name="TargetNode" select="CasualtyOrTheftDescription"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:32mm;height:4mm;">
										<xsl:call-template name="PopulateNegativeNumber">
											<xsl:with-param name="TargetNode" select="TradeOrRentalProperty"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:32mm;height:4mm;">
										<xsl:call-template name="PopulateNegativeNumber">
											<xsl:with-param name="TargetNode" select="IncomeProducingProperty"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:32mm;height:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GainsFromCasualtiesOrTheft"/>
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
