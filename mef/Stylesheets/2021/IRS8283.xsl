<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8283Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8283Data" select="$RtnDoc/IRS8283"/>
	<xsl:variable name="FRTbl1">5</xsl:variable>
	<xsl:variable name="FRTbl2">5</xsl:variable>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8283Data)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8283"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8283Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="Form8283">
					<xsl:call-template name="DocumentHeader"/>
					<div style="width:187mm;">
						<div class="styFNBox" style="width:32mm;height:21mm;">
							<div>
								<span style="padding-top:1mm;">Form<span style="width:6px;"/>
								</span>
								<span class="styFormNumber">8283</span>
							</div>
							<div class="styAgency" style="width:30mm;padding-bottom:2mm;">(Rev. December 2021)
								<span style="width:3px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8283Data"/>
									<xsl:with-param name="IDstring">Form8283Data</xsl:with-param>
								</xsl:call-template>
							</div>
							<div>
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm">
							<div class="styMainTitle">Noncash Charitable Contributions
							</div>
							<br/>
							<div class="styFBT" style="font-size: 7pt;padding-top:4mm;">
								<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
								<span style="width:3px;"/>Attach one or more forms 8283 to your tax return if you claimed a total deduction<br/>
								of over $500 for all contributed property.
							</div>
							<div style="font-weight:bold;font-size:6.5pt">
								<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
								Go to 
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form8283" title="Link to IRS.gov">
									<i>www.irs.gov/Form8283</i>
										for instructions and the latest information.
								</a>					
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:10.5mm;border-bottom-width:1px;">
							<br/>
							<div style="font-size:7pt;">
								<span style="width:6px;"/>OMB No.1545-0074
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:10.5mm">
							<br/>
							<div style="font-size:7pt;text-align:left;">
								<span style="width:6px;"/>Attachment<br/>
								<span style="width:6px;"/>Sequence No.
								<span style="font-family:Arial;font-size:9pt;font-weight:bold;">155</span>
							</div>
						</div>
						<!-- Name(s) & EIN Box  -->
						<div class="styBB" style="width:187mm;border-top-width:1px">
						<div class="styNameBox" style="width:144mm;height:auto;font-size:7pt;">
						   Name(s) shown on your income tax return<br/>
						  <!-- choise beween input Name versus Name from 1120/1065/1040 and 1041 Return Header info --> 
						 <xsl:call-template name="PopulateFilerName">
							<xsl:with-param name="TargetNode" select="$Form8283Data"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:42mm;height:9mm;padding-left:2mm;font-size:7pt;">
							Identifying number<br/><br/>
							<!-- Choice between input TIN versus TIN from 1120, 1065, 1040, and 1041 Return Header Filer info -->
                            <span style="font-weight:normal">
								<xsl:call-template name="PopulateFilerTIN">
									<xsl:with-param name="TargetNode" select="$Form8283Data"/>
								</xsl:call-template>
							</span>							
							</div>
						</div>
					<!--End Name(s) & EIN Box -->
					</div>
					<!--Note -->
					<div class="styBB" style="width:187mm;border-top-width:0px">
						<span style="font-size:8pt;">
							<b>Note.</b>
						</span>
						<span style="width:6px;"/>
						Figure the amount of your contribution deduction before completing this form.  See your tax return instructions.
                    </div>
					<!--Section A -->
					<div style="width:187mm;border-top-width:0px;border-bottom-width:0px;clear:none;">
						<div class="styNameBox" style="width:17mm;height:10mm;border-right-width:0px;clear:none;font-size:8pt;">
							<b>Section A. </b>
						</div>
						<div class="styEINBox" style="width:169mm;height:10mm;clear:none;font-weight:normal;font-size:7pt;">					
							<b style="font-size:8pt;">
								Donated Property of $5,000 or Less and Publicly Traded Securities &#8212;
								</b>List in this section <b>only</b>
								an item (or groups of similar items) for which you claimed a deduction of $5,000 or less. Also
								 list publicly traded securities and certain other property even if the deduction is more than $5,000 (see instructions).    
						</div>
					</div>		
					<!--Part I -->
					<div class="styBB" style="width:187mm;border-top-width:1px">
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;width:150mm;border-top-width:1px;">
						    Information on Donated Property&#8212;
							<span class="styNormalText">If you need more space, attach a statement.
								<xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form8283Data/InformationOnDonatedProperty"/>
								</xsl:call-template>	
							</span>
						</div>
						<div style="float:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8283Data/InformationOnDonatedProperty"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'TPctn' "/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;" id="TPctn" class="styTableContainerNBB">
						<xsl:call-template name="SetInitialState"/>
						<table cellspacing="0" style="" name="TYTable" id="TYTable" class="styTable">
						<!--<table cellspacing="0" summary="Part I Information on Donated Property" style="" name="TYTable" id="TYTable" class="styTable">-->
							<thead class="styTableThead">
								<tr>
									<th scope="col" class="styTableCell"
									 style="width:6mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;border-right:none;">1</th>
									<th scope="col" class="styTableCell" style="width:61mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
										<span class="styBoldText">(a)</span><br/>
										<span style="width:1mm;"/>
										<span style="font-size:7pt;">Name and address of the donee organization</span>
									</th>
									<th scope="col" class="styTableCell" style="width:61mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
										<span class="styBoldText">(b)</span>
										<span style="width:1mm;"/>
										<span style="font-size:7pt;">if donated property is a vehicle (see instructions), 
											check the box. Also enter the vehicle identification number (unless Form 1098-C is attached)</span>
									</th>								
									<th scope="col" class="styTableCell" 
									style="width:60mm;text-align:center;font-size:7pt;border-color:black;border-right:none;font-weight:normal;">
										<span class="styBoldText">(c)</span>
										<span style="width:1mm;"/>
										<span style="font-size:7pt;">Description and condition of donated property  
										(For a vehicle, enter the year, make, model, and mileage.  For securities, and other property see instructions.)
										</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- If the Print parameter is not set to be Separated, or there are less elements than the container height (5), execute -->
								<xsl:if test="($Print !=$Separated) 
								or (count($Form8283Data/InformationOnDonatedProperty) &lt;= 5)">
									<xsl:for-each select="$Form8283Data/InformationOnDonatedProperty">
										<tr>
											<td class="styTableCell" style="width:10mm;text-align:left;padding-left:3mm;font-size:7pt;font-weight:bold;border-color:black;">
												<xsl:choose>
													<xsl:when test="PropertyId">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PropertyId"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:4px;float:center;"/>
													</xsl:otherwise>
												</xsl:choose>
                                       			
											</td>
											<td class="styTableCell"  style="width:60mm;text-align:left;font-size:7pt;font-weight:normal;border-color:black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DoneeOrganizationName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="DoneeOrganizationName/BusinessNameLine2Txt">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DoneeOrganizationName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="DoneeOrganizationUSAddress">
													<br/>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="DoneeOrganizationUSAddress"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="DoneeOrganizationFrgnAddress">
													<br/>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="DoneeOrganizationFrgnAddress"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCell" style="width:60mm;text-align:left;font-size:7pt;font-weight:normal;border-color:black;"> 
											  <span style="width:34mm"/>
											  	 <input type="checkbox"   alt="Donated Property Vehicle"  class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
													  <xsl:with-param name="TargetNode" select="DonatedPropertyVehicleInd"/>
													  <xsl:with-param name="BackupName">DonatedPropertyVehicleInd<xsl:number value="position()"/>
											  	      </xsl:with-param>
											  	    </xsl:call-template>
											  	 </input>
											  	  <label>
											  	   	<xsl:call-template name="PopulateLabel">
											  	   	    <xsl:with-param name="TargetNode" select="DonatedPropertyVehicleInd"/>
											  	   	        <xsl:with-param name="BackupName">DonatedPropertyVehicleInd
											  	   	        </xsl:with-param>
											  	   	    </xsl:call-template>
											  	   </label>
	                                                <br/>
                                                    <xsl:call-template name="PopulateText">
	                                                    <xsl:with-param name="TargetNode" select="VIN"/>
	                                                </xsl:call-template>
	                                            </td>
	                                            <td class="styTableCell" style="width:60mm;text-align:left;font-size:7pt;font-weight:normal;border-color:black;  border-right:none;">
													<xsl:call-template name="PopulateText">
													   <xsl:with-param name="TargetNode" select="DonatedPropertyDesc"/>
													</xsl:call-template>
												</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($Form8283Data/InformationOnDonatedProperty)
								 &lt; 1)  or         (($Print = $Separated) 
								  and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5))">
									<tr>
										<td class="styTableCell" style="width:6mm;text-align:left;padding-left:3mm;
										font-size: 7pt;font-weight:bold;border-color:black;">A
										<span class="styTableCellPad"/>
										</td>
										<xsl:if test="($Print != $Separated)
										 or (count($Form8283Data/InformationOnDonatedProperty) &lt; 1)">
											<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
										</xsl:if>
										<!--  Insert additional data message if Print is set to separated and there are five or more elements -->
										<xsl:if test="($Print = $Separated)
										 and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
											<td class="styTableCell" style="width:60mm;text-align:left;font-size:7pt;font-weight:normal; border-color:black;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8283Data/InformationOnDonatedProperty"/>
												</xsl:call-template>
											</td>
										</xsl:if>
										<td class="styTableCell" style="width:60mm;padding-right:38mm;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
	                                        <input type="checkbox"   alt="Donated Property Vehicle A"  class="styCkbox" name="Checkbox">
	                                        	<xsl:call-template name="PopulateCheckbox">
	                                        		<xsl:with-param name="TargetNode" select="$Form8283Data/testA"/>
                                         			<xsl:with-param name="BackupName">DonatedPropertyVehicleA 
		                                        	</xsl:with-param>
			                     				</xsl:call-template>
		                     				</input>
					                 		<span style="width: 2mm;"/>
				                			<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$Form8283Data/testA"/>
													<xsl:with-param name="BackupName">DonatedPropertyVehicleA</xsl:with-param>
												</xsl:call-template>
											</label>	
										</td>
										<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;border-right:none;">
											<span class="styTableCellPad"/>
										</td>				
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty) 
								&lt; 2 or ($Print = $Separated) 
								and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" 
										style="width:6mm;text-align:left;padding-left:3mm;font-size: 7pt;font-weight:bold;border-color:black;">
										B<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
				                 		<td class="styTableCell" style="width:60mm;padding-right:38mm;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
											<input type="checkbox"  alt="Donated Property Vehicle B" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8283Data/testB"/>
														<xsl:with-param name="BackupName">DonatedPropertyVehicleB
														</xsl:with-param>
												</xsl:call-template>
											</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/testB"/>
									<xsl:with-param name="BackupName">DonatedPropertyVehicleB</xsl:with-param>
								</xsl:call-template>
                                    </label>
										</td>				
	            				<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;border-right:none;">
											<span class="styTableCellPad"/>
										</td>				
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty) 
								&lt; 3 or         ($Print = $Separated)
								 and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:6mm;text-align:left;padding-left:3mm;
										font-size: 7pt;font-weight:bold;border-color:black;">
										C<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
	                                 	<td class="styTableCell"  style="width:60mm;padding-right:38mm;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
											<input type="checkbox" alt="Donated Property Vehicle C" class="styCkbox" name="Checkbox">
							                	<xsl:call-template name="PopulateCheckbox">
			             						<xsl:with-param name="TargetNode" select="$Form8283Data/testC"/>
									<xsl:with-param name="BackupName">DonatedPropertyVehicleC</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/testC"/>
									<xsl:with-param name="BackupName">DonatedPropertyVehicleC</xsl:with-param>
								</xsl:call-template>
                             </label>
						</td>									
            	       	<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;border-right:none;">
											<span class="styTableCellPad"/>
										</td>				
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty)
								 &lt; 4 or         ($Print = $Separated) 
								 and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:6mm;text-align:left;padding-left:3mm;font-size: 7pt;font-weight:bold;border-color:black;">
											D<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:81mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:81mm;;padding-right:38mm;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
								<input type="checkbox" alt="Donated Property Vehicle D" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/testD"/>
		                      	<xsl:with-param name="BackupName">DonatedPropertyVehicleD</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/testD"/>
									<xsl:with-param name="BackupName">DonatedPropertyVehicleD</xsl:with-param>
								</xsl:call-template>
                             </label>
						</td>						
		        			<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;border-right:none;">
											<span class="styTableCellPad"/>
										</td>				
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty)
								 &lt; 5 or         ($Print = $Separated) 
								 and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:6mm;text-align:left;padding-left:3mm;font-size: 7pt;font-weight:bold;border-color:black;">
										E<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:81mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
	                                 	<td class="styTableCell" style="width:81mm;padding-right:38mm;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										<input type="checkbox" alt="Donated Property Vehicle E" class="styCkbox" name="Checkbox">
							        	<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/testE"/>
									<xsl:with-param name="BackupName">DonatedPropertyVehicleE</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/testE"/>
									<xsl:with-param name="BackupName">DonatedPropertyVehicleE</xsl:with-param>
								</xsl:call-template>
                             </label>
						</td>
					<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;border-right:none;">
											<span class="styTableCellPad"/>
										</td>				
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8283Data/InformationOnDonatedProperty"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select=" 'TPctn' "/>
					</xsl:call-template>
					<!--Table expand/collapse toggle button -->
					<div style="width:187mm;">
						<span class="styGenericDiv" style="float:right;clear:none;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8283Data/InformationOnDonatedProperty"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'TP1ctn' "/>
							</xsl:call-template>
						</span>
						<!--Table expand/collapse toggle button end -->
					</div>
					<div style="width:187mm;" id="TP1ctn" class="styTableContainerNBB">
						<xsl:call-template name="SetInitialState"/>
						<!--<table cellspacing="0" summary="Information on Donated Property table columns (d) through (i)." -->
						<table cellspacing="0" class="styTable" style="" name="TYTable1" id="TYTable1">
							<thead class="styTableThead">
								<tr>
									<th scope="col" colspan="7" class="styTableCell"
									 style="width:187mm;text-align:left;font-size:7pt;border-right:none;
									 font-weight:normal;border-top-width:0px;border-color:black;">
										<span class="styBoldText">Note.</span>
										<span style="width:1mm;"/>
										<span style="font-size: 7pt;">
										If the amount you claimed as a deduction for
										 an item is $500 or less, you do not have to complete columns (e), (f), and (g).
										</span>
									</th>
								</tr>
								<tr>
									<th scope="col" class="styTableCell" style="width:7mm;background-color:lightgrey;border-right:1px solid black;border-bottom:1px solid black;">
										<span style="width:1mm;"/>
									</th>
									<th scope="col" class="styTableCell" style="width:28mm;text-align:center;
									font-size: 7pt;font-weight:normal;border-color:black;">
										<span class="styBoldText">(d)</span>
										<span style="width:1mm;"/>Date of the contribution
                                    </th>
									<th scope="col" class="styTableCell" style="width:27mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;">
										<span class="styBoldText">(e)</span>
										<span style="width:1mm;"/>Date acquired by donor (mo., yr.)
                                     </th>
									<th scope="col" class="styTableCell" style="width:26mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;">
										<span class="styBoldText">(f)</span>
										<span style="width:1mm;"/>How acquired by donor
                                    </th>
									<th scope="col" class="styTableCell" style="width:36mm;text-align:center;
									font-size: 7pt;font-weight:normal;border-color:black;">
										<span class="styBoldText">(g)</span>
										<span style="width:1mm;"/>Donor's cost or adjusted basis
                                    </th>
									<th scope="col" class="styTableCell" style="width:36mm;text-align:center;font-size: 7pt;font-weight:normal;	border-color:black;">
										<span class="styBoldText">(h)</span>
										<span style="width:1mm;"/>Fair market value (see instructions)
                                    </th>
									<th scope="col" class="styTableCell" 	style="width:26mm;text-align:center;
									font-size: 7pt;font-weight:normal;border-color:black;border-right:none;">
										<span class="styBoldText">(i)</span>
										<span style="width:1mm;"/>Method used to determine the fair market value
                                   </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- If the Print parameter is not set to be Separated, or there are less elements than the container height (5), execute -->
								<xsl:if test="($Print !=$Separated)
								 or (count($Form8283Data/InformationOnDonatedProperty) &lt;= 5)">
									<xsl:for-each select="$Form8283Data/InformationOnDonatedProperty">
										<tr>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size: 7pt;font-weight:bold;border-color:black;">
												<xsl:choose>
													<xsl:when test="PropertyId">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PropertyId"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:4px;float:center;"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="float:none;width:28mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;">
												<span style="width:0.1mm;float:left;">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">
														Section A Part I Line 1 Columns (c) - (f) Donor line detail</xsl:with-param>
														<xsl:with-param name="TargetNode" select="DonorLineDetail/@scheduleK1Cd"/>
														<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DonorLineDetail/ContributionDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:27mm;font-size: 7pt;font-weight:normal;border-color:black;">
												<span style="width:0.1mm;float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorAcquiredDt"/>
													</xsl:call-template>
												</span>
												<span style="width:19mm;text-align:center;">
													<xsl:choose>
														<xsl:when test="DonorLineDetail/DonorAcquiredDt = 'VARIOUS'  ">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorAcquiredDt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateMonth">
																<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorAcquiredDt"/>
															</xsl:call-template>-<xsl:call-template name="PopulateYear">
																<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorAcquiredDt"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
												<span style="width:2px;"/>
												<!-- Tags are pushed up against the hyphen to prevent spaces from getting between the hyphen and numbers -Kevin Chang -->
											</td>
											<td class="styTableCell" style="width:26mm;text-align:left;font-size: 7pt;font-weight:normal;	border-color:black;">
												<span style="text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorAcquisitionDesc"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" style="width:36mm;text-align:right;font-size: 7pt;font-weight:normal;border-color:black;">
												<div class="styGenericDiv" style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorCostOrAdjustedBasisAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorCostOrAdjustedBasisAmt"/>
												</xsl:call-template>
												<span style="width:0.1mm;"/>
											</td>
											<td class="styTableCell" style="width:36mm;text-align:right;font-size: 7pt;font-weight:normal;border-color:black;">
												<div class="styGenericDiv" style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
												</xsl:call-template>
												<span style="width:0.1mm;"/>
											</td>
											<td class="styTableCell" style="width:26mm;text-align:left;font-size: 7pt;font-weight:normal;border-color:black;border-right:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FairMarketValueMethodDesc"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty)
								 &lt; 1 or ($Print = $Separated) 
								 and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size: 7pt;font-weight:bold;border-color:black;">
										A<span class="styTableCellPad"/>
										</td>
										<xsl:choose>
											<xsl:when test="($Print = $Separated)
											 and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
												<td class="styTableCell" style="width:26mm;text-align:left;font-size: 7pt;font-weight:normal;border-color:black;">
													<span class="styTableCellPad" style="width:26mm">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$Form8283Data/InformationOnDonatedProperty"/>
															<xsl:with-param name="ShortMessage" select="'true'"/>
														</xsl:call-template>
													</span>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
													<span class="styTableCellPad"/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:44mm;text-align:center;font-weight:bold;
										border-color:black;border-right:none;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty)
								 &lt; 2 or         ($Print = $Separated) 
								 and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size: 7pt;font-weight:bold;border-color:black;">
										B<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style=";width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style=";width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:44mm;text-align:center;font-weight:bold;border-color:black;border-right:none;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty)
								 &lt; 3 or         ($Print = $Separated)
								  and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size: 7pt;font-weight:bold;border-color:black;">
										C<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:44mm;text-align:center;font-weight:bold;border-color:black;border-right:none;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty)
								 &lt; 4 or         ($Print = $Separated) 
								 and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size: 7pt;font-weight:bold;border-color:black;">
										D<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:44mm;text-align:center;font-weight:bold;border-color:black;border-right:none;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty)
								 &lt; 5 or         ($Print = $Separated)
								  and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size: 7pt;font-weight:bold;border-color:black;">
										 E<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:44mm;text-align:center;font-weight:bold;border-color:black;border-right:none;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8283Data/InformationOnDonatedProperty"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'TP1ctn' "/>
					</xsl:call-template>
					
		<!-- Page Break and Footer-->
			<div class="pageEnd" style="width:187mm;padding-top:1mm;">
				<div style="float:left;">
					<span class="styBoldText">
						For Paperwork Reduction Act Notice, see separate instructions.</span>
					<span style="width:20mm;"/>                        
					  Cat. No. 62299J
				</div>
					<div style="float:right;">
						<span style="width:10px;"/>  
						  Form <span class="styBoldText" style="font-size:8pt;">8283</span>  (Rev. 12-2021)
					</div>
				</div>
				<!-- END Page Break and Footer-->
				<!--Begin Page 2 -->
				<!-- Page Header -->
				<div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
					<div style="float:left;">Form 8283 (Rev. 12-2021)<span style="width:130mm;"/>
					</div>
					<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
					</div>
				</div>
				<!-- END Page Header -->
					<div style="width:187mm;border-top:none;">
						<div class="styNameBox" style="font-size:7pt;width:133mm;height:auto;border-left:none;border-top:none;border-bottom:none;">
							Name(s) shown on your income tax return
						  <br/>
                          <!-- choise beween input Name versus Name from 1120/1065/1040 and 1041 Return Header info --> 
							<xsl:call-template name="PopulateFilerName">
								<xsl:with-param name="TargetNode" select="$Form8283Data"/>
							</xsl:call-template>						
						</div>
						<div class="styNameBox" style="padding-left:2mm;font-size:7pt;width:47mm;height:9mm;border-right:none;
						border-left:none;border-top:none;border-bottom:none;font-weight:bold;">
						Identifying number
						  <br/>
						  <br/>
							<span style="font-weight:normal;">
								<!-- Choice between input TIN versus TIN from 1120, 1065, 1040, and 1041 Return Header Filer info -->
								<xsl:call-template name="PopulateFilerTIN">
									<xsl:with-param name="TargetNode" select="$Form8283Data"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--Section B -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div  style="width:15mm;float:left;clear:none;padding-top:.5mm;">
							<b>Section B.</b>
						</div>
						<div  style="width:172mm;float:left;clear:none;">
							<span style="font-size:8pt;">
								<b> Donated Property Over $5,000 (Except Publicly Traded Securities, Vehicles, Intellectual Property or Inventory reported in Section A) &#8212;</b>Complete this section for one item (or a group of similar items) for which you claimed a deduction of more than $5,000 per item or group (except contributions reportable in Section A). Provide a separate form for each item donated unless it is part of a group of similar items. A
qualified appraisal is generally required for items reportable in Section B. See instructions.</span>
							</div>
                          </div>
                         <div>
						<!-- Section B Part I -->
						<div class="styBB" style="width:187mm;">
							<span class="styPartName" style="width:16mm;">Part I</span>
							<span style="font-family:verdana;font-size:8pt;font-weight:bold;">
							<span style="width:2mm;"/>Information on Donated Property</span>
							<!--<span style="font-family:verdana;font-size:8pt;">
							To be completed by the taxpayer and/or their tax appraiser.</span>-->
						</div>
					<div style="width=187mm;">
						<!--span style="width:10mm;float:left;text-align:center;"><b>4</b></span-->
						<span style="text-align:center;width:6mm;font-weight:bold;">2</span>
						<span style="text-align:center;padding-top:.5mm;padding-bottom:.5mm;padding-left:2mm;">
							Check the box that describes the type of property donated:</span>
					</div>
					</div>
					<!-- Drop 4 7 modification: These are choice elements; All checkboxes displayed per pdf form but only one should show checked -->
					<!-- Line 2 a, d, g, j  -->
					<div style="width:187mm;font-size:6pt;">
						<span style="width:5mm;"/>
						<!-- Line 4 a  -->			
						<span style="width:52mm;height:4.5mm;text-align:left;">a 
							<input type="checkbox" alt="ArtWorthAtLeast20000Dollars" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/ArtWorthAtLeast20000DollarsInd"/>
									<xsl:with-param name="BackupName">Form8283DataArtWorthAtLeast20000Dollars
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/ArtWorthAtLeast20000DollarsInd"/>
									<xsl:with-param name="BackupName">Form8283DataArtWorthAtLeast20000Dollars</xsl:with-param>
								</xsl:call-template>Art*(contribution of $20,000 or more)
                           </label>
						</span>
						<!-- Line 2 d -->
						<span style="width:55mm;height:4.5mm;text-align:left;">d 
							<input type="checkbox" alt="ArtWorthLessThan20000Dollars" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/ArtWorthLssThan20000DollarsInd"/>
									<xsl:with-param name="BackupName">Form8283DataArtWorthLessThan20000Dollars
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/ArtWorthLssThan20000DollarsInd"/>
									<xsl:with-param name="BackupName">Form8283DataArtWorthLessThan20000Dollars
									</xsl:with-param>
								</xsl:call-template>Art*(contribution of less than $20,000)
                           </label>
						</span>
						<!-- Line 2 g -->
						<span style="width:34mm;height:4.5mm;text-align:left;">g 
							<input type="checkbox" alt="Collectibles" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/CollectiblesInd"/>
									<xsl:with-param name="BackupName">Form8283DataCollectibles</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/CollectiblesInd"/>
									<xsl:with-param name="BackupName">Form8283DataCollectibles</xsl:with-param>
								</xsl:call-template>Collectibles**
						    </label>
						</span>
						<!-- Line 2 j -->
						<span style="width:40mm;height:4.5mm;text-align:left;">j
						<input type="checkbox" alt="Clothing and household items" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form8283Data/ClothingHouseholdItemsInd"/>
								<xsl:with-param name="BackupName">Form8283DataClothingHouseholdItemsInd</xsl:with-param>
							</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/ClothingHouseholdItemsInd"/>
									<xsl:with-param name="BackupName">Form8283DataClothingHouseholdItemsInd</xsl:with-param>
								</xsl:call-template>Clothing and household items
                            </label>
						</span>						
					</div>
					<!-- Line 2 b, e, h, i -->					
					<div style="width:187mm;font-size:6pt;">
					<!-- Line 4 b -->
						<span style="width:5mm;"/>
						<span style="width:52mm;height:4.5mm;text-align:left;">b 
							<input type="checkbox" alt="QualifiedConservationContrInd"  class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/QualifiedConservationContriInd"/>
									<xsl:with-param name="BackupName">Form8283DataQualifiedConservationContrInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/QualifiedConservationContriInd"/>
									<xsl:with-param name="BackupName">Form8283DataQualifiedConservationContri</xsl:with-param>
								</xsl:call-template>Qualified Conservation Contribution
                            </label>
						</span>						
						<!-- Line 2 e -->		
						<span style="width:55mm;height:4.5mm;text-align:left;">e
							<input type="checkbox" alt="OtherRealEstate"  class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/OtherRealEstateInd"/>
									<xsl:with-param name="BackupName">Form8283DataOtherRealEstate</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/OtherRealEstateInd"/>
									<xsl:with-param name="BackupName">Form8283DataOtherRealEstate</xsl:with-param>
								</xsl:call-template>Other Real Estate
							</label>
						</span>
						<!-- Line 2 h -->	
						<span style="width:34mm;height:4.5mm;text-align:left;">h 
							<input type="checkbox" alt="IntellectualProperty" class="styCkbox" name="Checkbox"> 
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/IntellectualPropertyInd"/>
									<xsl:with-param name="BackupName">Form8283DataIntellectualProperty</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/IntellectualPropertyInd"/>
									<xsl:with-param name="BackupName">
									Form8283DataIntellectualProperty</xsl:with-param>
								</xsl:call-template>Intellectual Property
							</label>
						</span>	
						<!-- Line 2 k -->
						<span style="width:20mm;height:4.5mm;text-align:left;">k
						<input type="checkbox" alt="Other" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form8283Data/OtherInd"/>
								<xsl:with-param name="BackupName">Form8283DataOtherInd</xsl:with-param>
							</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/OtherInd"/>
									<xsl:with-param name="BackupName">Form8283DataOtherInd</xsl:with-param>
								</xsl:call-template>Other
                            </label>
						</span>					
					</div>
					<!-- Line 2 c, f, i -->
					<div style="width:187mm;font-size:6pt;">
						<span style="width:5mm;"/>					
						<!-- Line 2 c  -->	
						<span style="width:52mm;height:4.5mm;text-align:left;">c 
						 <span style="padding-left:.5mm"/>
							<input type="checkbox"  alt="Equipment" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/EquipmentInd"/>
									<xsl:with-param name="BackupName">Form8283DataEquipment</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/EquipmentInd"/>
									<xsl:with-param name="BackupName">Form8283DataEquipment</xsl:with-param>
								</xsl:call-template>Equipment
							</label>
						</span>
						<!-- Line 2 f -->
						<span style="width:55mm;height:4.5mm;text-align:left;">f <span style="width:1mm"/> 
							<input type="checkbox" alt="Securities" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/SecuritiesInd"/>
									<xsl:with-param name="BackupName">Form8283DataSecurities</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/SecuritiesInd"/>
									<xsl:with-param name="BackupName">Form8283DataSecurities</xsl:with-param>
								</xsl:call-template>Securities
                            </label>
						</span>
						<!-- Line 2 i -->				
						<span style="width:60mm;height:4.5mm;text-align:left;">i <span style="width:1mm"/>
							<input type="checkbox" alt="Vehicle" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/VehicleInd"/>
									<xsl:with-param name="BackupName">Form8283DataVehicleInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/VehicleInd"/>
									<xsl:with-param name="BackupName">Form8283DataVehicleInd</xsl:with-param>
								</xsl:call-template>Vehicles
							</label>
						</span>
					</div>
					<div style="width:187mm;">
					<!-- Blank line -->						
					</div>
					<!-- End drop 4 modification-->
					<div style="width:187mm;padding-bottom:1mm;padding-top:.5mm;">
					*Art includes paintings, sculptures, watercolors, prints, drawings, ceramics, antiques, decorative arts, textiles, carpets, silver,
					 rare manuscripts, historical memorabilia and other similar objects.</div>
					<div style="width:187mm;">**Collectibles include coins, stamps, books, gems, jewelry, 
					sports memorabilia, dolls, etc., but not art as defined above.
                 <div style="width:180mm;">
						<b>Note.  </b>  In certain cases, you must attach a qualified appraisal of the property.  See instructions.
					<!--   removed from form to reflect pdf form 12-2006  If your total art contribution was $20,000 or more, you must attach a complete
						 copy of the signed appraisal. If your deduction for  <span style="padding-left:7mm">
						   any donated property was more than $500,000, you must attach a qualified appraisal of the property. See instructions.</span> -->
						</div>
						<!--Table expand/collapse toggle button-->
						<div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8283Data/PropertyInformation"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'TP2ctn' "/>
							</xsl:call-template>
						</div>
						<!--Table expand/collapse toggle button end-->
					</div>
					<div class="styIRS8283TableContainer" style="width:187mm;" id="TP2ctn">
						<xsl:call-template name="SetInitialState"/>
						<!--<table cellspacing="0" Summary="Section B. Part I. Information on Donated Property" style="" class="styTable">-->
						<table cellspacing="0" style="" class="styTable">
							<thead class="styTableThead">
								<tr>
									<th scope="col" colspan="2" class="styTableCell" 
									style="width:77mm;text-align:center;font-size:7pt;border-color:black;border-top-width:1px;font-weight:normal;">
										<div class="styGenericDiv" style="text-align:center;width:6mm;font-weight:bold;">3</div>
										<div class="styGenericDiv" style="width:68mm;text-align:center;">
											<b>(a)</b>
											<span style="width:4px;"/>
											Description of donated property (if you need more space, attach a separate statement)
											<xsl:call-template name="SetFormLinkInline">
                                                <xsl:with-param name="TargetNode" select="$Form8283Data/PropertyInformation"/>
											</xsl:call-template>
										</div>
									</th>
									<th scope="col" class="styTableCell" 
									style="width:70mm;text-align:center;font-size:7pt;border-color:black;border-top-width:1px;font-weight:normal;">
										<b>(b)</b>
										<span style="width:1px;"/>
										If any tangible personal property or real property was donated, give a brief summary of the overall physical condition of the property at the time of the gift</th>
									<th scope="col" class="styTableCell" style="width:40mm;text-align:center;font-size:7pt;border-color:black;border-right:none;
									border-top-width:1px;font-weight:normal;">
										<b>(c)</b>
										<span style="width:1px;"/>Appraised fair market value</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- If the Print parameter is not set to be Separated, or there are less elements than the container height (5), execute -->
								<xsl:if test="($Print != $Separated) or (count($Form8283Data/PropertyInformation)
								 &lt;= 3)">
									<xsl:for-each select="$Form8283Data/PropertyInformation">
										<tr>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;
											border-color:black;font-weight:bold;vertical-align:middle;">
												<xsl:choose>
													<xsl:when test="PropertyId">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PropertyId"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:4px;float:center;"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="width:68mm;text-align:left;border-color:black;font-size:7pt;">
												<div>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DonatedPropertyDesc"/>
													</xsl:call-template>
												</div>
												<div>
                                                   <!--<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="VehicleModelYr"/>
													</xsl:call-template>-->
												</div>
												<div style="text-align:bottom;padding-top:0mm;">
                                       			    <span class="styLNLeftNumBox" style="float:left;width:62mm;text-align:bottom;"/>
                                       				
                                       			</div>														
											</td>
											<td class="styTableCell" style="width:70mm;text-align:left;border-color:black;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DonatedPropertyPhysicalCondTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:40mm;text-align:right;border-color:black;font-size:7pt;border-right:none;padding-top:5mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AppraisedFairMarketValueAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($Form8283Data/PropertyInformation)
								 &lt; 1 or         (($Print = $Separated)
								  and (count($Form8283Data/PropertyInformation) &gt; 3))">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;
										border-color:black;font-weight:bold;">
										A<span class="styTableCellPad"/>
										</td>
										<xsl:choose>
											<xsl:when test="($Print = $Separated) 
											and (count($Form8283Data/PropertyInformation) &gt; 3)">
												<td class="styTableCell" style="width:68mm;text-align:left;border-color:black;font-size:7pt;">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form8283Data/PropertyInformation"/>
													</xsl:call-template>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td class="styTableCell" style="width:68mm;text-align:center;border-color:black;font-size:7pt;">
													<span class="styTableCellPad"/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styTableCell" style="width:70mm;text-align:center;border-color:black;font-size:7pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:40mm;text-align:center;border-color:black;font-size:7pt;border-right:none;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8283Data/PropertyInformation) 
								&lt; 2 or         (($Print = $Separated) 
								and (count($Form8283Data/PropertyInformation) &gt; 3))">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;
										border-color:black;font-weight:bold;">
										B<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:68mm;text-align:center;border-color:black;font-size:7pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:70mm;text-align:center;border-color:black;font-size:7pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:40mm;text-align:center;border-color:black;font-size:7pt;border-right:none;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>								
								<xsl:if test="count($Form8283Data/PropertyInformation)
								 &lt; 3 or         (($Print = $Separated) 
								 and (count($Form8283Data/PropertyInformation) &gt; 3))">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;
										font-weight:bold;">
										C<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:68mm;text-align:center;border-color:black;font-size:7pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:70mm;text-align:center;border-color:black;font-size:7pt;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:40mm;text-align:center;border-color:black;font-size:7pt;border-right:none;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8283Data/PropertyInformation"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select=" 'TP2ctn' "/>
					</xsl:call-template>
					<div style="width:187mm;">
						<!--Table expand/collapse toggle button-->
						<div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8283Data/PropertyInformation"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'TP3ctn' "/>
							</xsl:call-template>
						</div>
						<!--Table expand/collapse toggle button end-->
						<div class="styTableContainerForTP3ctn" style="height:30mm;" id="TP3ctn">
							<xsl:call-template name="SetInitialState"/>
							<table cellspacing="0" class="styTable" style=" border-bottom: 0px;">
								<thead class="styTableThead">
									<tr>
										<th scope="col" rowspan="2" colspan="2" class="styTableCell"
										 style="width:30mm;text-align:center;font-size:7pt;border-color:black;left-margin:3mm;font-weight:normal;">
											<b>(d)</b>
											<span style="width:1mm;"/>Date acquired by donor (mo., yr.)</th>
										<th scope="col" rowspan="2" class="styTableCell" 
										style="width:20mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
											<b>(e)</b>
											<span style="width:1mm;"/>How acquired by donor</th>
										<th scope="col" rowspan="2" class="styTableCell" 
										style="width:35mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
											<b>(f)</b>
											<span style="width:1mm;"/>Donor's cost or adjusted basis</th>
										<th scope="col" rowspan="2" class="styTableCell" 
										style="width:30mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
											<b>(g)</b>
											<span style="width:1mm;"/>For bargain sales, enter amount received</th>
										<th scope="col" colspan="2" class="styTableCell" 
										style="left-margin:0mm;width:70mm;text-align:center;font-size:7pt;border-color:black;border-right-width:0px;font-weight:bold;">
										See instructions</th>
									</tr>
									<tr>
										<th scope="col" class="styTableCell" style="width:35mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
											<b>(h)</b>
											<span style="width:1mm;"/>Amount claimed as a deduction</th>
										<th scope="col" class="styTableCell" style="width:35mm;text-align:center;font-size:7pt;border-color:black;border-right:none;font-weight:normal;">
											<b>(i)</b>
											<span style="width:1mm;"/>Date of contribution</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="($Print != $Separated)
									 or (count($Form8283Data/PropertyInformation) &lt;= 3)">
										<xsl:for-each select="$Form8283Data/PropertyInformation">
											<tr>
												<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">
													<xsl:choose>
														<xsl:when test="PropertyId">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="PropertyId"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:4px;float:center;"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCell" style="width:23mm;text-align:center;font-size:7pt;border-color:black;">
													<xsl:choose>
														<xsl:when test="DonorAcquiredDt">
															<span style="width:3px;float:left;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="DonorAcquiredDt"/>
																</xsl:call-template>
															</span>
															<xsl:choose>
																<xsl:when test="DonorAcquiredDt = 'VARIOUS' ">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="DonorAcquiredDt"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:call-template name="PopulateMonth">
																		<xsl:with-param name="TargetNode" select="DonorAcquiredDt"/>
																	</xsl:call-template>-<xsl:call-template name="PopulateYear">
																		<xsl:with-param name="TargetNode" select="DonorAcquiredDt"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:when>
														<xsl:otherwise>  </xsl:otherwise>
													</xsl:choose>
													<span style="width:2px;"/>
													<!-- Tags are pushed up against the hyphen to prevent spaces from getting between the hyphen and numbers -Kevin Chang -->
												</td>
												<td class="styTableCell" style="text-align:center;width:20mm;font-size:7pt;border-color:black;">
													<span style="width:4px;float:left;">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="DonorAcquisitionDesc"/>
														</xsl:call-template>
													</span>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DonorAcquisitionDesc"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:35mm;text-align:right;font-size:7pt;border-color:black;">
													<span style="float:left;">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="DonorCostOrAdjustedBasisAmt"/>
														</xsl:call-template>
													</span>
													<span style="float:right;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="DonorCostOrAdjustedBasisAmt"/>
														</xsl:call-template>
													</span>
												</td>
												<td class="styTableCell" style="width:30mm;text-align:right;font-size:7pt;border-color:black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="BargainSalesReceivedAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:35mm;text-align:right;font-size:7pt;border-color:black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DeductionClaimedAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:35mm;text-align:center;font-size:7pt;
												 border-color:black;border-right:none;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ContributionDt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="count($Form8283Data/PropertyInformation) 
									&lt; 1 or         (($Print = $Separated) 
									and (count($Form8283Data/PropertyInformation) &gt; 3))">
										<tr>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">
											A<span class="styTableCellPad"/>
											</td>
											<xsl:choose>
												<xsl:when test="($Print = $Separated)
												 and (count($Form8283Data/PropertyInformation) &gt; 3)">
													<td class="styTableCell" style="width:23mm;text-align:left;font-size:7pt;border-color:black;">
														<span class="styTableCellPad" style="width:26mm">
															<xsl:call-template name="PopulateAdditionalDataTableMessage">
																<xsl:with-param name="TargetNode" select="$Form8283Data/PropertyInformation"/>
																<xsl:with-param name="ShortMessage">true</xsl:with-param>
															</xsl:call-template>
														</span>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCell" style="width:23mm;text-align:center;font-size:7pt;border-color:black;">
														<span class="styTableCellPad"/>
													</td>
												</xsl:otherwise>
											</xsl:choose>
											<td class="styTableCell" style="width:20mm;text-align:center;font-size:7pt;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:35mm;text-align:center;font-size:7pt;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:35mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8283Data/PropertyInformation) 
									&lt; 2 or         (($Print = $Separated)
									 and (count($Form8283Data/PropertyInformation) &gt; 3))">
										<tr>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">
											B<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;font-size:7pt;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;text-align:center;font-size:7pt;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:35mm;text-align:center;font-size:7pt;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:35mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>									
									<xsl:if test="count($Form8283Data/PropertyInformation)
									 &lt; 3 or         (($Print = $Separated) 
									 and (count($Form8283Data/PropertyInformation) &gt; 3))">
										<tr>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;
											 border-color:black;font-weight:bold;">
											C<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;font-size:7pt;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;text-align:center;font-size:7pt;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:35mm;text-align:center;font-size:7pt;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:35mm;text-align:center;font-size:7pt;border-color:black;	border-right:none;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form8283Data/PropertyInformation"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" 'TP3ctn' "/>
						</xsl:call-template>
					</div>
					<!-- PART II -->
					<div style="width:187mm;height:auto;" id="TPXctn">
						<xsl:call-template name="SetInitialState"/>
						<!--<table cellspacing="0" summary="Part II Partial Interests and Restricted Use Property" class="styIRS8283TableContainer"-->
						<table cellspacing="0" class="styIRS8283TableContainer" style="width:183mm;border-top:none;" name="TYTable3" id="TYTable3">
							<!--Display empty Section A Part II -->
							<xsl:if test="(not($Form8283Data/InformationOnDonatedProperty)) 
							or (((count($Form8283Data/InformationOnDonatedProperty) &gt; 5)
							 and ($Print = $Separated)))">
								<tr>
									<th scope="col" colspan="7" class="styTableCell" style="width:187mm;text-align:left;font-size:7pt;border-right:none;">
										<div style="width:187mm;border-top-width:0px">
											<div class="styPartName" style="width:16mm;">Part II</div>
											<div style="font-family:verdana;font-size:8pt;font-weight:normal;width:171mm;padding-left:3mm;">
											<b>Partial Interests and Restricted Use Property (Other Than Qualified Conservation Contributions) &#8212;</b>
											Complete lines 4a through 4e if you gave less than an entire interest in a property listed in Section B, Part I.  Complete lines 5a through 5c if conditions were placed on a contribution listed in Section B, Part I; also attach the required statement. See instructions.
										</div>
										</div>
									</th>
								</tr>
								<tr>
									<td colspan="7" class="styTableCell" style="width:187mm;text-align:left;font-size:7pt;border-right:none;">
										<div style="width:187mm;">
											<div class="styLNLeftNumBox" style="height:8mm;">4a</div>
											<div class="styLNDesc" style="height:8mm;font-weight:normal;">
											Enter the letter from Section B, Part I that identifies the property for which you gave less than an entire interest</div>
											<div class="" style="float:right;">
												<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
												<span style="width:6px;"/>
												<span style="width:32mm;border-bottom:1px solid black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PropertyId"/>
													</xsl:call-template>
												</span>
											</div>
										</div>
										<div style="width:187mm;padding-left:8mm;">
										      If Section B, Part II applies to more than one property, attach a separate statement.</div>
										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
											<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">
												<div class="styGenericDiv" style="width:95mm;">
												    Total amount claimed as a deduction for the property listed in Section B, Part I:
                                                </div>
												<div class="styGenericDiv" style="padding-left:0mm;width:45mm;">
													<b>(1)</b>
													<span style="width:12px;"/>For this tax year
                                                </div>
												<div class="" style="float:right;">
													<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
													<span style="width:6px;"/>
													<span style="width:32mm;border-bottom:1px solid black;padding-left:3mm;">
														<xsl:choose>
															<xsl:when 
															test="((count($Form8283Data/InformationOnDonatedProperty)
															 &gt; 5) and ($Print = $Separated))">
																<xsl:call-template name="PopulateAdditionalDataTableMessage">
																	<xsl:with-param name="TargetNode" select="$Form8283Data/InformationOnDonatedProperty"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="TotalDeductionClaimedThisTYAmt"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</div>
											</div>
										</div>
										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
											<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">
												<div class="styGenericDiv" style="width:94mm;float:none;">
                                              </div>
												<div class="styGenericDiv" style="padding-left:0mm;width:45mm;float:none;">
													<b>(2)</b>
													<span style="width:12px;"/>For any prior tax years
                                               </div>
												<div class="" style="float:right;">
													<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
													<span style="width:6px;"/>
													<span style="width:32mm;border-bottom:1px solid black;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TotalDeductionClaimedPrTYAmt"/>
														</xsl:call-template>
													</span>
												</div>
											</div>
										</div>
									<div class="styLNLeftLtrBox" style="height:7mm;border-bottom-width:0px;">c</div>
										<div class="styLNDesc" style="width:172mm;height:7mm;border-bottom-width:0px;font-weight:normal;">
										 Name and address of each organization to which any such contribution was
										  made in a prior year (complete only if different from the donee 
										  organization above):</div>
										<br/>
										<div class="styBB" style="width:180mm;margin-left:4mm;float:left;"/>
										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:7mm;">
												<span style="width:1mm;"/>
											</div>
											<div style="font-size:6pt;font-weight:normal;">
											Name of charitable organization (donee)</div>
										</div>								
										<div class="styBB" style="width:180mm;margin-left:4mm;float:left;">
											<span style="width:1px;"/>
										</div>
										<div style="width:172mm;">
											<div class="styLNLeftLtrBox" style="height:7mm;">
												<span style="width:1mm;"/>
											</div>
											<div style="font-size:6pt;font-weight:normal;">
											Address (number, street, and room or suite no.)</div>
										</div>
										<div class="styBB" style="width:180mm;margin-left:4mm;float:left;">
											<span style="width:1px;"/>
										</div>
										<div style="width:172mm;">
											<div class="styLNLeftLtrBox" style="height:7mm;">
												<span style="width:1mm;"/>
											</div>
											<div style="font-size:6pt;font-weight:normal;">
											City or town, state, and ZIP code</div>
										</div>
										<div class="styBB" style="width:180mm;margin-left:4mm;float:left;"/>
										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">d</div>
											<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">
											For tangible property, enter the place where the property is located or kept
												<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/><span style="width:7mm;"/>
												<span style="width: 2mm;"/>
												<span style="border-bottom: 1px solid black; width: 20mm;"/>
											</div>
										</div>
										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">e</div>
											<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">
											Name of any person, other than the donee organization, having actual possession of the property
	                                		<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
												<span style="width:5mm;"/>
												<span style="border-bottom: 1px solid black; width: 20mm;"/>
											</div>
										</div>
										<div class="styBB" style="width:183mm;margin-left:4mm;float:left;"/>
										
										<!--<xsl:choose> Comment out 8/18/2021 - When boxes "a" or "b" are checked the "Yes" and "NO" boxes on line 5a are
checked automatically on line 5a, the reference linking needs to be removed. This should NOT happen.

											<xsl:when 
											test="$Form8283Data/InformationOnDonatedProperty/DonatedPropertyRestrictionInd=1">
												<div style="width:186mm;float:left;">
													<div class="styLNLeftLtrBox" style="height:4mm;">5a</div>
													<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">
														Is there a restriction, either temporary or permanent, on the donee's right to use or dispose of the donated 
												    </div>
													<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4mm;font-weight:bold;border-top-width:1px;">
													 Yes</div>
													<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4mm;font-weight:bold;border-top-width:1px;">
													 No</div>
												</div>
												<div style="width:186mm;float:left;">
													<div class="styLNLeftLtrBox" style="height:4mm;"/>
													<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;padding-bottom:0mm;padding-top:0mm">
														<span style="float:left;">property? </span>
														--><!--Dotted Line--><!--
														<div class="styDotLn" 
														style="float:right;padding-right:1mm;">...................................</div>
													</div>
													<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4.5mm;font-weight:bold;border-top-width:0px;
													padding-bottom:0mm;padding-top:0mm"/>
													<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4.5mm;font-weight:bold;border-top-width:0px;
													padding-bottom:0mm;padding-top:0mm"/>
												</div>
											</xsl:when>
											<xsl:otherwise>
												<div style="width:186mm;float:left;">
													<div class="styLNLeftLtrBox" style="height:4mm;padding-left:1.5mm;">5a</div>
													<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">
													Is there a restriction, either temporary or permanent, on the donee's right to use or dispose of the donated 
                                                </div>
													<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4mm;font-weight:bold;border-top-width:1px;">
													Yes</div>
													<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4mm;font-weight:bold;border-top-width:1px;">
													 No</div>
												</div>
												<div style="width:186mm;float:left;">
													<div class="styLNLeftLtrBox"  style="height:4mm;padding-bottom:0mm;padding-top:0mm"/>
													<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;padding-bottom:0mm;padding-top:0mm">
														<span style="float:left;">
															property?
														</span>
														--><!--Dotted Line--><!--
														<div class="styDotLn" style="float:right;padding-right:1mm;">.....................................</div>
													</div>
													<div class="styLNAmountBox" style="width:6mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;">
														<span style="1px;"/>
													</div>
													<div class="styLNAmountBox" style="width:6mm;height:4.5mm;padding-bottom:0mm;padding-top:0mm;
													float:right; text-align: center;"/>
												</div>
											</xsl:otherwise>
										</xsl:choose>-->
										
										<div style="width:186mm;float:left;">
											<div class="styLNLeftLtrBox" style="height:4mm;padding-left:1.5mm;">5a</div>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">
												Is there a restriction, either temporary or permanent, on the donee's right to use or dispose of the donated 
                                        </div>
											<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4mm;font-weight:bold;border-top-width:1px;">
												Yes</div>
											<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4mm;font-weight:bold;border-top-width:1px;">
												No</div>
											</div>
											<div style="width:186mm;float:left;">
												<div class="styLNLeftLtrBox"  style="height:4mm;padding-bottom:0mm;padding-top:0mm"/>
												<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;padding-bottom:0mm;padding-top:0mm">
													<span style="float:left;">
														property?
													</span>
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">.....................................</div>
												</div>
												<div class="styLNAmountBox" style="width:6mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;">
													<span style="1px;"/>
												</div>
												<div class="styLNAmountBox" style="width:6mm;height:4.5mm;padding-bottom:0mm;padding-top:0mm;
													float:right; text-align: center;"/>
												</div>

										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4mm;padding-bottom:0mm;padding-top:0mm">b</div>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;padding-bottom:0mm;padding-top:0mm">
                                                Did you give to anyone (other than the donee organization or another organization participating with the donee
                                           </div>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;padding-bottom:0mm;padding-top:0mm"/>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;padding-bottom:0mm;padding-top:0mm"/>
										</div>
										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4mm;padding-bottom:0mm;padding-top:0mm"/>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;padding-bottom:0mm;padding-top:0mm">
												organization in cooperative fundraising) the right to the income from the donated property or to the possession</div>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;padding-bottom:0mm;padding-top:0mm"/>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;padding-bottom:0mm;padding-top:0mm"/>
										</div>
										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
											<div class="styLNDesc" style="width:166mm;height:4mm;padding-bottom:0mm;padding-top:0mm; font-weight:normal;">
												of the property, including the right to vote donated securities, to acquire the property by purchase or otherwise,</div>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;padding-bottom:0mm;padding-top:0mm; border-bottom-width:1px;"/>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;padding-bottom:0mm;padding-top:0mm; border-bottom-width:1px;"/>
										</div>
										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4mm;padding-bottom:0mm;padding-top:0mm"/>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;padding-bottom:0mm;padding-top:0mm">
											 or to designate the person having such income, possession, or right to acquire?
												<!--Dotted Line-->
												<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
											</div>
											<div class="styLNAmountBox" style="width:6mm;height: 4mm; padding-bottom:0mm;padding-top:0mm">
												<span style="width:1px;"/>
											</div>
											<div class="styLNAmountBox" style="width:6mm;height: 4mm; padding-bottom:0mm;padding-top:0mm">
												<span style="width:1px;"/>
											</div>
										</div>
										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4mm;padding-bottom:0mm;padding-top:0mm">c</div>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;padding-bottom:0mm;padding-top:0mm">
												<span style="float:left;">
													Is there a restriction limiting the donated property for a particular use?
												</span>
												<!--Dotted Line-->
												<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
											</div>
											<div class="styLNAmountBox" style="height: 4.5mm; width:6mm;border-bottom:none;padding-bottom:0mm;padding-top:0mm">
												<span style="width:1px;"/>
											</div>
											<div class="styLNAmountBox" style="height: 4.5mm; width:6mm;border-bottom:none;padding-bottom:0mm;padding-top:0mm">
												<span style="width:1px;"/>
											</div>
										</div>
									</td>
								</tr>
							</xsl:if>
							<!--end empty Section A Part II-->
							<!--Normal reapeating data for Section A Part II-->
							<xsl:if test="((count($Form8283Data/PropertyInformation)
							 &lt;= 5) or ($Print != $Separated))">
								<xsl:for-each select="$Form8283Data/PropertyInformation">
									<tr>
										<th scope="col" colspan="7" class="styTableCell" style="width:187mm;text-align:left;font-size:7pt;border-right:none;">
											<div style="width:187mm;border-top-width:0px">
											<div class="styPartName" style="width:16mm;">Part II</div>
											<div style="font-family:verdana;font-size:8pt;font-weight:normal;width:171mm;padding-left:3mm;">
											<b>Partial Interests and Restricted Use Property (Other Than Qualified Conservation Contributions) &#8212;</b>
											Complete lines 4a through 4e if you gave less than an entire interest in a property listed in Section B, Part I.  Complete lines 5a through 5c if conditions were placed on a contribution listed in Section B, Part I; also attach the required statement. See instructions.
										</div>
											</div>
										</th>
									</tr>
									<tr>
										<td colspan="7" class="styTableCell" style="width:187mm;text-align:left;font-size:7pt;border-right:none;height:auto;">
											<!--Line 4a begin-->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:8mm;">4a</div>
												<div class="styLNDesc" style="height:8mm;font-weight:normal;">
													Enter the letter from Section B, Part I that identifies the property in which you gave less than an entire interest</div>
												<div class="" style="float:right;">
													<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
													<span style="width:6px;"/>
													<span style="width:32mm;border-bottom:1px solid black;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="PropertyId"/>
														</xsl:call-template>
													</span>
												</div>
											</div>
											<div style="width:187mm;padding-left:8mm;">
											    If Section B, Part II applies to more than one property, attach a separate statement.</div>
											<!--Line 4a end-->
											<div style="width:187mm;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
												<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">
													<div class="styGenericDiv" style="width:95mm;">
													    Total amount claimed as a deduction for the property listed in Section B, Part I:
                                                   </div>
													<div class="styGenericDiv" style="padding-left:0mm;width:45mm;">
														<b>(1)</b>
														<span style="width:12px;"/>For this tax year
                                                  </div>
													<div class="" style="float:right;">
														<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
														<span style="width:6px;"/>
														<span style="width:32mm;border-bottom:1px solid black;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="TotalDeductionClaimedThisTYAmt"/>
															</xsl:call-template>
														</span>
													</div>
												</div>
											</div>
											<div style="width:187mm;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
												<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">
													<div class="styGenericDiv" style="width:95mm;">&#160;
													</div>
													<div class="styGenericDiv" style="padding-left:0mm;width:45mm;">
														<b>(2)</b>
														<span style="width:12px;"/>For any prior tax years
													</div>
													<div class="" style="float:right;">
														<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
														<span style="width:6px;"/>
														<span style="width:32mm;border-bottom:1px solid black;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="TotalDeductionClaimedPrTYAmt"/>
															</xsl:call-template>
														</span>
													</div>
												</div>
											</div>
											<div class="styLNLeftLtrBox" style="height:7mm;">c</div>
											<div class="styLNDesc" style="width:179mm;height:4.5mm;border-color:black;border-style:solid;border-left:none;border-right:none;
											border-top:none;border-bottom-width:0px;font-weight:normal;height:7mm;">
											Name and address of each organization to which any such contribution was made in a prior 
											year (complete only if different from the donee organization above):</div>
											<!-- Name of Charitable Organization (Donee) -->
											<div style="width:187mm;">
												<div class="styLNLeftLtrBox" style="height:9mm;">
													<span style="width:1mm;"/>
												</div>
												<div style="width:177mm;font-size:6pt;font-weight:normal;height:auto;border-bottom:1px solid black;">
												Name of charitable organization (donee) 
												<br />
												<xsl:if test="OrganizationNm/BusinessNameLine1Txt !=''">												
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OrganizationNm/BusinessNameLine1Txt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="OrganizationNm/BusinessNameLine2Txt !=''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OrganizationNm/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												</div>
											</div>
											<!-- Address of Organization -->
											<div style="width:187mm;height:10mm;">
												<div class="styLNLeftLtrBox" style="height:10mm;">
													<span style="width:1mm;"/>
												</div>
												<div style="font-size:6pt;font-weight:normal;height:auto;border-bottom:1px solid black;height:10mm;width:177mm;">
												Address (number, street, and room or suite no.)
												<br />
											<!--div class="styBB" style="width:180mm;margin-left:4mm;float:left;"-->
												<xsl:if test="OrganizatonUSAddress!=''">												
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OrganizatonUSAddress/AddressLine1Txt"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OrganizatonUSAddress/AddressLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="OrganizatonForeignAddress!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OrganizatonForeignAddress/AddressLine1Txt"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OrganizatonForeignAddress/AddressLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<!--/div-->
											    </div>
											</div>
											<!-- Organization City, State & Zip Code-->
											<div style="width:187mm;">
												<div class="styLNLeftLtrBox" style="height:auto;">
													<span style="width:1mm;"/>
												</div>
												<div style="font-size:6pt;font-weight:normal;width:177mm;border-bottom:1px solid black;height:auto;">
												City or town, state, and ZIP code
												<br />
												<xsl:if test="OrganizatonUSAddress">
													<xsl:call-template name="PopulateCityStateInfo">
														<xsl:with-param name="TargetNode" select="OrganizatonUSAddress"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="OrganizatonForeignAddress">
													<xsl:call-template name="PopulateCityStateInfo">
														<xsl:with-param name="TargetNode" select="''"/>
														<xsl:with-param name="ForeignAddressTargetNode" select="OrganizatonForeignAddress"/>
													</xsl:call-template>
													<span style="width: 2mm"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OrganizatonForeignAddress/CountryCd"/>
													</xsl:call-template>
												</xsl:if>
												</div>
											</div>
											<div style="width:187mm;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;">d</div>
												<div class="styLNDesc" style="width:108mm;height:4mm;font-weight:normal;">
													<span style="width:99mm;">
													For tangible property, enter the place where the property is located or kept</span>
													<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/><span style="width:5mm;"/>
												</div>
												<div style="width:80mm;float:right;clear:all;">
													<span class="styUnderlineAmount" style="width:81mm;float:right;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TangiblePropertyLocationTxt"/>
														</xsl:call-template>
													</span>
												</div>
											</div>
											<div style="width:187mm;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;">e</div>
												<div class="styLNDesc" style="width:134mm;height:4mm;font-weight:normal;float:left;clear:none;">
													<span style="width:130mm;">
													Name of any person, other than the donee organization, having actual possession of the property</span>
													<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
												</div>
												<div style="width:40mm;float:right;clear:right;">
													<span class="styUnderlineText" style="width:40mm;float:right;">
														<xsl:choose>
															<xsl:when test="PersonPossessingPropBusName">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="PersonPossessingPropBusName/BusinessNameLine1Txt"/>
																</xsl:call-template>
																<br/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="PersonPossessingPropBusName/BusinessNameLine2Txt"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select=" PersonPossessingPropPersonNm"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</div>
												<div class="styFixedUnderline" style="width:179mm;margin-left:8mm;">
                                           </div>
											</div>
											<!-- Section A Part II line 3a begin-->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:4mm;">5a</div>
												<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal">
												Is there a restriction, either temporary or permanent, on the donee's right to use or dispose of the donated </div>
												<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4mm;font-weight:bold;border-top-width:0px;">
												Yes</div>
												<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4mm;font-weight:bold;border-top-width:0px;">
												 No</div>
											</div>
											<div style="width:186mm;float:left;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
												<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">
												    <span style="width:14mm;"> property? </span>  
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonatedPropertyRestrictionInd"/>
													</xsl:call-template>													
													<!--Dotted Line-->
													<div class="styDotLn" style="float:right;padding-right:1mm;">...................................</div>
												</div>
												<div class="styLNAmountBox" style="width:6mm;height:5mm;padding-top:0.5mm;padding-bottom:0mm;
												font-weight:normal;text-align:center;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="DonatedPropertyRestrictionInd"/>
													</xsl:call-template>
												</div>
												<div class="styLNAmountBox" style="width:6mm;height:5mm;padding-top:0.5mm;padding-bottom:0mm;
												 float:right; text-align: center;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="DonatedPropertyRestrictionInd"/>
													</xsl:call-template>
													<span style="1px;"/>
												</div>
											</div>
											<!--end 3a -->
											<!-- start 3b --> 
											<div style="width:187mm;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
												<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">
												  Did you give to anyone (other than the donee organization or another organization participating with the donee organization
												</div>
												<div class="styShadingCell" style="width:6mm;height:5mm;"/>
												<div class="styShadingCell" style="width:6mm;height:5mm;"/>
											</div>
											<div style="width:187mm;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
												<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">
												  in cooperative fundraising) the right to the income from the donated property or to the possession of the property,
												    including </div>
												<div class="styShadingCell" style="width:6mm;height:5mm;"/>
												<div class="styShadingCell" style="width:6mm;height:5mm;"/>
											</div>
											<div style="width:187mm;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
												<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">
												 the right to vote donated securities, to acquire the property by purchase or otherwise, possession, or right to acquire?
												   <span style="width:2px;"/>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonatedPropertyRightsGivenInd"/>
													</xsl:call-template>									
												</div>
												<div class="styLNAmountBox" style="width:6mm;height:4.5mm; text-align: center;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="DonatedPropertyRightsGivenInd"/>
													</xsl:call-template>
												</div>
												<div class="styLNAmountBox" style="width:6mm;height:4.5mm; text-align: center;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="DonatedPropertyRightsGivenInd"/>
													</xsl:call-template>
												</div>
											</div>
					<!-- end 3b -->
					<!-- start 3c  -->	
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>
							<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">
							Is there a restriction limiting the donated property for a particular use?
							 <span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="DonatedPropertyLimitingRstrInd"/>
							</xsl:call-template>
							  <span style="width:6mm;"/>
								<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
						</div>
						<div class="styLNAmountBox" style="width:6mm;height:4.5mm;border-bottom:none; text-align: center;">
							<xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="DonatedPropertyLimitingRstrInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:6mm;height:4.5mm;border-bottom:none; text-align: center;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="DonatedPropertyLimitingRstrInd"/>
							</xsl:call-template>
						</div>
					<!-- end 3c -->
					<!--/div-->
					</div>
				</td>
			</tr>
			</xsl:for-each>
		</xsl:if>
	</table>
		</div>
					<!-- Section B part III  Taxpayer (Donor) Statement-->
					<br/><br/>
					<div class="styBB" style="width:187mm;border-top-width:0px;font-family:verdana;font-size:8pt;">
						<div class="styPartName" style="float:left;clear:none;"><b>Part III</b></div>
						<div style="float:left;clear:none;width:168mm;padding-left:3mm;">
						<b>Taxpayer (Donor) Statement&#8212;</b>
						List each item included in Section B, Part I above that the appraisal identifies as having a value of $500 or less. See instructions.						
						</div>						
					</div>
					<div style="width:187mm;"/>
					<div style="width:187mm;">
						<div style="float:left;">I declare that the following item(s) included in Section B, Part I above has to the best of my knowledge
						 and belief an appraised value of not more than $500 (per item). Enter identifying letter from Section B, Part I and describe the specific item.</div>
						<div style="width:138mm;float:left;" class="styGenericDiv">
						  See instructions.<span style="width:2mm;"/>
							<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
						</div>
						<div style="width:49mm;border-bottom:1px solid black;padding-left:1mm;float:right;clear:none;height:auto;" class="styGenericDiv">
							<xsl:if test="($Print != $Separated) or ( ($Print = $Separated) and 
							(count($Form8283Data/PropertyIdLetterAndDescGrp) &lt;= 1) )">
								<xsl:for-each select="$Form8283Data/PropertyIdLetterAndDescGrp">
									<span style="width:8mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PropertyId"/>
										</xsl:call-template>
									</span>
									<span style="width:39mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="DonatedPropertyDesc"/>
										</xsl:call-template>
									</span>
									<br/>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="($Print = $Separated) 
							and (count($Form8283Data/PropertyIdLetterAndDescGrp) &gt; 1)">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$Form8283Data/PropertyIdLetterAndDescGrp"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div style="width:187mm;"/>
					<div class="styBB" style="width:187mm;">
						Signature of taxpayer (donor)<span style="width:2mm;"/>
						<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
						<span style="width:105mm;"/>Date<span style="width:2mm;"/>
						<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
					</div><br/><br/><br/><br/><br/><br/>
					<div class="styBB" style="width:187mm;border-top-width:0px">
						<span class="styPartName" style="width:16mm;">Part IV</span>
						<span style="font-family:verdana;font-size:8pt;font-weight:bold;">
							<span style="width:2mm;"/>Declaration of Appraiser</span>
					</div>
					<div style="width:187mm;height:10mm;">
                       I declare that I am not the donor, the donee, a party to the transaction in which the donor acquired the property, employed by,
					   or related to any of the foregoing persons, or married to any person who is related to any of the foregoing persons. And, if regularly
					   used by the donor, donee, or party to the transaction, I performed the majority of my appraisals during my tax year for other persons.
					</div>
					<div style="width:187mm;">
                        Also, I declare that I perform appraisals on a regular basis; and that because of my qualifications as described in the appraisal, 
                        I am qualified to make appraisals of the type of property being valued.   I certify that the appraisal fees were not based on a percentage 
                        of the appraised property value. Furthermore, I understand that a false or fraudulent overstatement of the property value as described
                        in the qualified appraisal or this Form 8283 may subject me to the penalty under section 6701(a) (aiding and abetting the understatement 
                        of tax liability).  I  understand that my appraisal will be used in connection with a return or claim for refund. I also understand that, if there is
						a substantial or gross valuation misstatement of the value of the property claimed on the return or claim for refund that is based on my
						appraisal, I may be subject to a penalty under section 6695A of the Internal Revenue Code, as well as other applicable penalties. I affirm that
						I have not been at any time in the three-year period ending on the date of the appraisal barred from presenting evidence or testimony before
						the Department of the Treasury or the Internal Revenue Service pursuant to 31 U.S.C. 330(c).
					</div>
					<div style="width:187mm;"/>
					<div style="width:187mm;">
					    <div class="styIRS8283SignatureBox" style="width:10mm;font-size:9pt;font-weight:bold;border-bottom-width:0px;height:8mm;">
					    Sign Here</div>
						<span style="width:6mm;"/>
						<div class="styIRS8283SignatureBox" style="width:82mm;border-right-width:0px;padding-bottom:0px;padding-left: 1mm;border-bottom-width:0px;
						height:8mm;padding-top:4mm;font-size:6.5pt;">Appraiser name       
                         <span style="width:1mm;"/>
							<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/><span style="width:1mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserName/PersonFirstNm"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserName/PersonLastNm"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8283SignatureBox" style="width:31mm;border-right-width:0px;padding-bottom:0px;padding-left: 1mm;border-bottom-width:0px;
						height:4mm;padding-top:4mm;font-size:6pt;">Appraiser signature     
                         <span style="width:1mm;"/>
							<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/><span style="width:1mm;"/>
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserName/PersonFirstNm"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserName/PersonLastNm"/>
							</xsl:call-template>-->
							</div>							
							<span style="padding-right:1mm;padding-top:4mm;"> Title </span>
							<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/><span style="width:1mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserTitleTxt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<span style="padding-right:1mm;"> Date </span>
							<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/><span style="width:1mm;"/>
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserSignedDt"/>
							</xsl:call-template>	
					</div>
					<div class="styBB" style="width:187mm;">						
						<!--<div class="styIRS8283SignatureBox" style="width:89mm;border-right-width:0px;border-bottom-width:0px;padding-top:4mm;height:8mm;border-left-width:1px;padding-left:2.5mm;">
                             Title<span style="width:1mm;"/>							
						</div>
						<div class="styIRS8283SignatureBox" style="width:29mm;border-right-width:0px;border-bottom-width:0px;padding-top:4mm;height:8mm;">
                           Date <span style="width:1mm;"/>							
						</div>-->
					</div>
					<!-- Could not reduce the height for name and EIN line -->
					<div style="width:187mm;border-top-width:1px;">
						<div class="styNameBox" style="font-family:Arial;font-size:7pt;width:135mm;">
						<span style="width:100%">
						Business address (including room or suite no.)</span>
							<span>
								<xsl:choose>
									<xsl:when test="$Form8283Data/AppraiserUSAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserUSAddress/AddressLine1Txt"/>
										</xsl:call-template>
										<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserUSAddress/AddressLine2Txt"/>
											</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserForeignAddress/AddressLine1Txt"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserForeignAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="styEINBox" style="font-family:Arial;font-size:7pt;width:47mm;padding-left: 2mm;">
							<b>Identifying number</b>
							<br/>
								<span style="font weight:normal;padding-top:2mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserIdentifyingNum"/>
									</xsl:call-template>
								</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px">
						<div class="styNameBox" style="font-family:Arial;font-size:7pt;width:187mm;height:8mm;border-right-width:0px;">
						 City or town, state, and ZIP code<br/>
						<div>
								<xsl:choose>
									<xsl:when test="$Form8283Data/AppraiserUSAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserUSAddress/CityNm"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserUSAddress/StateAbbreviationCd"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserUSAddress/ZIPCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserForeignAddress/CityNm"/>
										</xsl:call-template>
										<span style="width:1mm;"/> 
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserForeignAddress/ProvinceOrStateNm"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserForeignAddress/ForeignPostalCd"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
		 								<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserForeignAddress/CountryCd"/>
										</xsl:call-template> 
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
					</div><br/><br/>
					<div class="styBB" style="width:187mm;border-top-width:0px">
						<span class="styPartName" style="width:16mm;">Part V</span>
						<span style="font-family:verdana;font-size:8pt;font-weight:bold;">
							<span style="width:2mm;"/>Donee Acknowledgment</span>
						<!--<span style="font-family:verdana;font-size:8pt;">
						To be completed by the charitable organization.</span>-->
					</div>
					<div style="width:187mm;">This charitable organization acknowledges that it is a qualified organization under section  170(c) 
					and that it received the donated property as described in Section B, Part I, above on the following date<span style="width:2mm;"/>
						<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
						<!-- A straight Line -->
						<span style="width:75mm;border-bottom:solid 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8283Data/ReceivedDt"/>
							</xsl:call-template>
						</span>
					</div>
					<br/>
					<br />
					<div style="width:187mm;">Furthermore, this organization affirms that in the event it sells, exchanges, or otherwise disposes 
					of the property described in Section B, Part I (or any portion thereof) within 3 years after the date of receipt, it will file <b>
					Form 8282,</b> Donee Information Return, with the IRS and give the	donor a copy of that form. This acknowledgment does 
					not represent agreement with the claimed fair market value.</div>
					<br/>
					<br/>
					<div style="width:187mm;border-top-width:1px;">
						<!--  <div style="width:187mm;">-->
						<div class="styLNDesc" style="width:179mm;height:5.5mm;">
						Does the organization intend to use the property for an unrelated use?
                            <span class="styBoldText" style="width:19px;">.</span>
							<span class="styBoldText" style="width:19px;">.</span>
							<span class="styBoldText" style="width:19px;">.</span>
							<span class="styBoldText" style="width:19px;">.</span>
							<span class="styBoldText" style="width:19px;">.</span>
							<span class="styBoldText" style="width:19px;">.</span>
							<span class="styBoldText" style="width:19px;">.</span>
							<span class="styBoldText" style="width:19px;">.</span>
							<span class="styBoldText" style="width:19px;">.</span>
							<span class="styBoldText" style="width:19px;">.</span>
							<img src="{$ImagePath}/8283_Bullet_Lg.gif" alt="right pointing arrow"/>
							<span style="width:1px;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form8283Data/UsePropertyForUnrelatedUseInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="UsePropertyForUnrelatedUseYes" class="styCkbox" name="Checkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8283Data/UsePropertyForUnrelatedUseInd"/>
										<xsl:with-param name="BackupName">Form8283DataUsePropertyForUnrelatedUseYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form8283Data/UsePropertyForUnrelatedUseInd"/>
									<xsl:with-param name="BackupName">Form8283DataUsePropertyForUnrelatedUseYes</xsl:with-param>
								</xsl:call-template>Yes
                         </label>
							<span style="width:3mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form8283Data/UsePropertyForUnrelatedUseInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="UsePropertyForUnrelatedUseNo" class="styCkbox" name="Checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8283Data/UsePropertyForUnrelatedUseInd"/>
										<xsl:with-param name="BackupName">Form8283DataUsePropertyForUnrelatedUseNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form8283Data/UsePropertyForUnrelatedUseInd"/>
									<xsl:with-param name="BackupName">Form8283DataUsePropertyForUnrelatedUseNo</xsl:with-param>
								</xsl:call-template>No
                       </label>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styNameBox" style="font-face:Arial;font-size:7pt;width:94mm;height:auto;">
						Name of charitable organization (donee)<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$Form8283Data/DoneeName/BusinessNameLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styEINBox" style="font-family:face;font-size:7pt;width:93mm;height:auto;">
							<b>Employer identification number</b>
							<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeEIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div style="width:187mm;border-top-width:1px">
						<div class="styNameBox" style="font-family:Arial;font-size:7pt;width:94mm;height:auto;">
						Address (number, street, and room or suite no.) <br/>
							<xsl:if test="$Form8283Data/DoneeUSAddress">
								<xsl:if test="$Form8283Data/DoneeUSAddress/AddressLine1Txt!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeUSAddress/AddressLine1Txt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8283Data/DoneeUSAddress/AddressLine2Txt!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeUSAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
							<xsl:if test="$Form8283Data/DoneeForeignAddress">
								<xsl:if test="$Form8283Data/DoneeForeignAddress/AddressLine1Txt!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeForeignAddress/AddressLine1Txt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8283Data/DoneeForeignAddress/AddressLine2Txt!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeForeignAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
						</div>
						<div class="styEINBox" style="font-family:Arial;font-size:7pt;
						width:93mm;font-weight:normal;">City or town, state, and ZIP code <br/>
							<br/>
							<xsl:if test="$Form8283Data/DoneeUSAddress">
								<xsl:if test="$Form8283Data/DoneeUSAddress/CityNm!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeUSAddress/CityNm"/>
									</xsl:call-template>,
                             </xsl:if>
								<xsl:if test="$Form8283Data/DoneeUSAddress/StateAbbreviationCd!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeUSAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8283Data/DoneeUSAddress/ZIPCd!=''">
									<span style="width:1mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeUSAddress/ZIPCd"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
							<xsl:if test="$Form8283Data/DoneeForeignAddress">
								<xsl:if test="$Form8283Data/DoneeForeignAddress/CityNm!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeForeignAddress/CityNm"/>
									</xsl:call-template>,
                            </xsl:if>
								<xsl:if test="$Form8283Data/DoneeForeignAddress/ProvinceOrStateNm!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8283Data/DoneeForeignAddress/ForeignPostalCd!=''">
									<span style="width:1mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8283Data/DoneeForeignAddress/CountryCd!=''">
									<span style="width:1mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeForeignAddress/CountryCd"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px">
						<div class="styNameBox" style="font-family:Arial;font-size:7pt;width:94mm;height:8mm;">Authorized signature</div>
						<div class="styNameBox" style="font-family:Arial;font-size:7pt;width:46mm;height:8mm;">Title</div>
						<div class="styEINBox" style="font-face:Arial;font-size:7pt;width:46mm;height:8mm;font-weight:normal;">
						Date</div>
					</div>
					<br/>
					<!-- Left over data -->
					<!-- <br/>
                     <br class="pageEnd"/> -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
                        Form <span class="styBoldText" style="font-size:8pt;">8283</span>  (Rev. 12-2021)
                     </div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Left Over Table -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
                          Additional Data        
                       </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" 
							type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8283Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>						
					<xsl:if test="($Print !=$Separated)
					 or (count($Form8283Data/InformationOnDonatedProperty) &lt;= 5)">
						<xsl:for-each select="$Form8283Data/InformationOnDonatedProperty/DonorLineDetail">	
							<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">
							Section A Part I Line 1 Columns (c) - (f) Donor line detail</xsl:with-param>
							<xsl:with-param name="TargetNode" select="@scheduleK1Cd"/>
							<xsl:with-param name="DescWidth" select="105"/>
						</xsl:call-template>
						</xsl:for-each>
					</xsl:if>	
					</table>
					<!-- END Left Over Table -->
					<!-- If the Print parameter is set to be Separated and there are more elements than the container height (5), execute -->
					<xsl:if test="($Print =$Separated) 
					and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
						<br/>
						<br/>
						<div>
						<span class="styRepeatingDataTitle">
						Form 8283, Section A, Part I - Information on Donated Property:
						<xsl:call-template name="SetFormLinkInline">
                            <xsl:with-param name="TargetNode" select="$Form8283Data/InformationOnDonatedProperty"/>
						</xsl:call-template>	
						</span>
							<table class="styDepTbl" style="width:187mm;" id="donatedPrptyInfo">
								<thead class="styTableThead">
									<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width:7mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;border-right:none;
									 border-right-width:0px">1</th>
										<th scope="col" class="styDepTblCell" style="width:60mm;text-align:center;font-size:7pt;border-color:black;
										 font-weight:normal;border-left-width:0px">
											<span class="styBoldText">(a)</span>
											<span style="width:1mm;"/>
											<span style="font-size:7pt;">
											Name and address of the donee organization</span>
										</th>
									<th scope="col" class="styDepTblCell" style="width:60mm;text-align:center;font-size:7pt;border-color:black; font-weight:normal;">
											<span class="styBoldText">(b)</span>
											<span style="width:1mm;"/>
											<span style="font-size:7pt;">
											if donated property is a vehicle (see instructions), check the box. Also enter the vehicle identification number 
											(unless Form 1098-C is attached)</span>
										</th>
										<th scope="col" class="styDepTblCell" style="width:60mm;text-align:center;font-size:7pt;border-color:black;border-right:none;font-weight:normal;">
											<span class="styBoldText">(c)</span><br/>
											<span style="width:1mm;"/>
											Description of donated property (For a vehicle, enter the year, make, model, and mileage. For securities, 
											enter the company name and the number of shares.) 
											<!--Description of donated property (For a donated vehicle, enter the year, mark, 
											model, condition, and mileage unless Form 1098-C is attached--></th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form8283Data/InformationOnDonatedProperty">
										<tr>
											<!-- Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:3mm;font-size:7pt;font-weight:bold;border-color:black;">
												<xsl:choose>
													<xsl:when test="PropertyId">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PropertyId"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
														<!--<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="."/>
														</xsl:call-template>-->
													</xsl:when>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="width:60mm;text-align:left;font-size:7pt;font-weight:normal;border-color:black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DoneeOrganizationName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="DoneeOrganizationName/BusinessNameLine2Txt">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DoneeOrganizationName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="DoneeOrganizationUSAddress">
													<br/>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="DoneeOrganizationUSAddress"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="DoneeOrganizationFrgnAddress">
													<br/>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="DoneeOrganizationFrgnAddress"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCell" style="width:60mm;text-align:left;font-size:7pt;font-weight:normal;border-color:black;">
											<span style="width:28mm;"/>
	                                           <input type="checkbox" alt="DonatedPropertyVehicle" class="styCkbox">
                                                  <xsl:call-template name="PopulateCheckbox">
                                                   <xsl:with-param name="TargetNode" select="DonatedPropertyVehicleInd"/>
                                                   <xsl:with-param name="BackupName">IRS8283 DonatedPropertyVehicleInd
                                                  </xsl:with-param>
                                                 </xsl:call-template>
                                                </input>
                                                <label>
                                                 <xsl:call-template name="PopulateLabel">
                                                        <xsl:with-param name="TargetNode" select="DonatedPropertyVehicleInd"/>
                                                      <xsl:with-param name="BackupName">IRS8283 DonatedPropertyVehicleInd 
                                                   </xsl:with-param>
                                                     </xsl:call-template>
                                                </label>					
                                            	<br/>
                                                    <xsl:call-template name="PopulateText">
	                                                 <xsl:with-param name="TargetNode" select="VIN"/>
	                                                </xsl:call-template>
											</td>			
												<td class="styTableCell" style="width:60mm;text-align:left;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DonatedPropertyDesc"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</div>
						<br/>
						<div>
							<table class="styDepTbl" style="width:187mm;" id="contDonPrptInfo">
								<thead class="styTableThead">
									<tr class="styDepTblHdr">
										<th scope="col" colspan="7" class="styDepTblCell"
										 style="width:187mm;text-align:left;font-size:7pt;border-right:none;font-weight:normal; border-top-width:0px;border-color:black;">
											<span class="styBoldText">Note:</span>
											<span style="width:1mm;"/>
											<span style="font-style: italic; font-size: 7pt;">
											If the amount you claimed as a deduction for an item is $500 or less, you do not have to complete columns (e), (f), and (g).</span>
										</th>
									</tr>
									<tr class="styDepTblHdr">
										<th scope="col" class="styDepTblCell" style="width:7mm;background-color:lightgrey; border-right:1px solid black;border-bottom:1px solid black;">
											<span style="width:1mm;"/>
										</th>
										<th scope="col" class="styDepTblCell" style="width:26mm;text-align:center;font-size: 7pt;font-weight:normal;
										border-color:black;padding-top:3mm;">
											<span class="styBoldText">(d)</span>
											<span style="width:1mm;"/>Date of the contribution
                                       </th>
										<th scope="col" class="styDepTblCell" style="width:26mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;">
											<span class="styBoldText">(e)</span>
											<span style="width:1mm;"/>Date acquired by donor (mo., yr.)
                                        </th>
										<th scope="col" class="styDepTblCell" style="width:26mm;text-align:center;font-size: 7pt;font-weight:normal;
										border-color:black;padding-top:3mm;">
											<span class="styBoldText">(f)</span>
											<span style="width:1mm;"/>How acquired by donor
                                       </th>
										<th scope="col" class="styDepTblCell" style="width:36mm;text-align:center;font-size: 7pt;font-weight:normal;
										border-color:black;padding-top:3mm;">
											<span class="styBoldText">(g)</span>
											<span style="width:1mm;"/>Donor's cost or adjusted basis
                                       </th>
										<th scope="col" class="styDepTblCell" style="width:36mm;text-align:center;font-size: 7pt;font-weight:normal;
										 border-color:black;padding-top:3mm;">
											<span class="styBoldText">(h)</span>
											<span style="width:1mm;"/>Fair market value (see instructions) 
                                        </th>
										<th scope="col" class="styDepTblCell" style="width:30mm;text-align:center;font-size: 7pt;font-weight:normal;
										border-color:black;border-right:none;">
											<span class="styBoldText">(i)</span>
											<span style="width:1mm;"/>Method used to determine the fair market value
                                         </th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form8283Data/InformationOnDonatedProperty">
										<tr>
											<!-- Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size: 7pt;font-weight:bold;border-color:black;">
												<xsl:choose>
													<xsl:when test="PropertyId">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PropertyId"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:4px;float:center;"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="float:none;width:26mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;">
												<span style="width:0.1mm;float:left;">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">
														Section A Part I Line 1 Columns (c) - (f) Donor line detail</xsl:with-param>
														<xsl:with-param name="TargetNode" select="DonorLineDetail/@scheduleK1Cd"/>
														<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DonorLineDetail/ContributionDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:26mm;font-size: 7pt;font-weight:normal;border-color:black;">
												<span style="width:0.1mm;float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorAcquiredDt"/>
													</xsl:call-template>
												</span>
												<span style="width:19mm;text-align:center;">
													<xsl:choose>
														<xsl:when test="DonorLineDetail/DonorAcquiredDt = 'VARIOUS' ">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorAcquiredDt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateMonth">
																<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorAcquiredDt"/>
															</xsl:call-template>-<xsl:call-template name="PopulateYear">
																<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorAcquiredDt"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
												<span style="width:2px;"/>
												<!-- Tags are pushed up against the hyphen to prevent spaces from getting between the hyphen and numbers -Kevin Chang -->
											</td>
											<td class="styTableCell" style="width:26mm;text-align:left;font-size: 7pt;font-weight:normal; border-color:black;">
												<span style="text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorAcquisitionDesc"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" style="width:36mm;text-align:right;	font-size: 7pt;font-weight:normal;border-color:black;">											
												<div class="styGenericDiv" style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorCostOrAdjustedBasisAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorCostOrAdjustedBasisAmt"/>
												</xsl:call-template>
												<span style="width:0.1mm;"/>
											</td>
											<td class="styTableCell" style="width:36mm;text-align:right;
											font-size: 7pt;font-weight:normal;border-color:black;">
												<div class="styGenericDiv" style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
												</xsl:call-template>
												<span style="width:0.1mm;"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:left;
											 font-size: 7pt;font-weight:normal;border-color:black;border-right:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FairMarketValueMethodDesc"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</div>
					</xsl:if>
					<!-- End -->
					<!-- If the Print parameter is set to be Separated and there are more elements than the container height (5), execute -->
					<xsl:if test="($Print =$Separated) 
					and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
						Form 8283, Section A, Part II - Partial Interests and Restricted Use Property:</span>
						<xsl:for-each select="$Form8283Data/InformationOnDonatedProperty">
							<br/>
							<table class="styDepTbl" id="othrInfo">
								<tr>
									<td colspan="7" class="styTableCell" style="width:187mm;text-align:left;font-size:7pt;border-right:none;">
										<div class="styDepTblHdr" style="width:187mm;"/>
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftNumBox" style="height:4.5mm;">2a</div>
											<div class="styLNDesc" style="height:4mm;font-weight:normal;">
											Enter the letter from Part I that identifies the property in which you gave less than an entire interest
                                           </div>
											<div class="" style="float:right;clear:none;">
												<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
												<span style="width:6px;"/>
												<span style="width:32mm;border-bottom:1px solid black;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PropertyId"/>
													</xsl:call-template>
												</span>
											</div>
										</div>
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftNumBox" style="height:4.5mm;"/>
											<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">
											 If Part II applies to more than one property, attach a separate statement.</div>
										</div>
										<div class="styDepTblRow2" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
											<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">
												<div class="styGenericDiv" style="width:95mm;">
												Total amount claimed as a deduction for the property listed in Part I:
                                             </div>
												<div class="styGenericDiv" style="padding-left:0mm;width:48mm;">
													<b>(1)</b>
													<span style="width:12px;"/>For this tax year
                                              </div>
												<div class="" style="float:right;">
													<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
													<span style="width:6px;"/>
													<span style="width:32mm;border-bottom:1px solid black;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TotalDeductionClaimedThisTYAmt"/>
														</xsl:call-template>
													</span>
												</div>
											</div>
										</div>
										<div class="styDepTblRow2" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
											<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">
			     								<div class="styGenericDiv" style="width:95mm;">
												&#160; 
                                             </div>
												<div class="styGenericDiv" style="padding-left:0mm;width:48mm;">
													<b>(2)</b>
													<span style="width:12px;"/> For any prior tax years
                                              </div>
												<div class="" style="float:right;">
													<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
													<span style="width:6px;"/>
													<span style="width:32mm;border-bottom:1px solid black;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TotalDeductionClaimedPrTYAmt"/>
														</xsl:call-template>
													</span>
												</div>
											</div>
										</div>
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:8mm;">c</div>
											<div class="styLNDesc"
											 style="width:179mm;height:7mm;border-color:black;border-style:solid;
											 border-left:none;border-right:none; border-top:none;border-bottom-width:1px;font-weight:normal;">
											 Name and address of each organization to which any such contribution was made in a prior year 
											 (complete only if different from the donee </div>
										</div>
										<!-- Name of Charitable Organization (Donee) -->
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">
												<span style="width:1mm;"/>
											</div>
											<div style="font-size:6pt;font-weight:normal;">
											Name of charitable organization (donee)</div>
											<div class="styBB" style="width:180mm;margin-left:8mm;float:left;">
												<xsl:if test="OrganizationNm/BusinessNameLine1Txt !=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OrganizationNm/BusinessNameLine1Txt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="OrganizationNm/BusinessNameLine2Txt !=''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OrganizationNm/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</div>
										</div>
										<!-- Address of Organization -->
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">
												<span style="width:1mm;"/>
											</div>
											<div style="font-size:6pt;font-weight:normal;">
											Address (number, street, and room or suite no.)</div>
											<div class="styBB" style="width:180mm;margin-left:8mm;float:left;">
												<xsl:if test="OrganizatonUSAddress">
													<xsl:if test="OrganizatonUSAddress/AddressLine1Txt!=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OrganizatonUSAddress/AddressLine1Txt"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="OrganizatonUSAddress/AddressLine2Txt!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OrganizatonUSAddress/AddressLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
												<xsl:if test="OrganizatonForeignAddress">
													<xsl:if test="OrganizatonForeignAddress/AddressLine1Txt!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OrganizatonForeignAddress/AddressLine1Txt"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="OrganizatonForeignAddress/AddressLine2Txt!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OrganizatonForeignAddress/AddressLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
											</div>
										</div>
										<!-- Organization City, State & Zip Code-->
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">
												<span style="width:1mm;"/>
											</div>
											<div style="font-size:6pt;font-weight:normal;">
											City or town, state, and ZIP code</div>
											<div class="styBB" style="width:180mm;margin-left:8mm;float:left;">
												<xsl:if test="OrganizatonUSAddress">
													<xsl:if test="OrganizatonUSAddress/CityNm!=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OrganizatonUSAddress/CityNm"/>
														</xsl:call-template>,
													</xsl:if>
													<xsl:if test="OrganizatonUSAddress/StateAbbreviationCd!=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OrganizatonUSAddress/StateAbbreviationCd"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="OrganizatonUSAddress/ZIPCd!=''">
														<span style="width:1mm;"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OrganizatonUSAddress/ZIPCd"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
												<xsl:if test="OrganizatonForeignAddress">
													<xsl:if test="OrganizatonForeignAddress/CityNm!=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OrganizatonForeignAddress/CityNm"/>
														</xsl:call-template>,
													</xsl:if>
													<xsl:if test="OrganizatonForeignAddress/ProvinceOrStateNm!=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OrganizatonForeignAddress/ProvinceOrStateNm"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="OrganizatonForeignAddress/ForeignPostalCd!=''">
														<span style="width:1mm;"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OrganizatonForeignAddress/ForeignPostalCd"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="OrganizatonForeignAddress/CountryCd!=''">
														<span style="width:1mm;"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OrganizatonForeignAddress/CountryCd"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
											</div>
										</div>
										<div class="styDepTblRow2" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">d</div>
											<div class="styLNDesc" style="width:108mm;height:4mm;font-weight:normal;">
											For tangible property, enter the place where the property is located or kept
												<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/><span style="width:5mm;"/>
											</div>
											<span class="styUnderlineAmount" style="width:71mm;float:right;clear:all;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TangiblePropertyLocationTxt"/>
												</xsl:call-template>
											</span>
										</div>
									<div style="width:187mm;">
                             		<!--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  -->
										<div class="styLNLeftLtrBox" style="height:4.5mm;">e</div>
										<div class="styLNDesc" style="width:179mm;height:10mm;font-weight:normal;">
										Name of any person, other than the donee organization, having actual possession of the property
											<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="right pointing arrow"/>
											<br/>
												<xsl:choose>
													<xsl:when test="PersonPossessingPropBusName">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonPossessingPropBusName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonPossessingPropBusName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select=" PersonPossessingPropPersonNm"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</div>
										</div>
                            	        <div class="styFixedUnderline" style="width:180mm;margin-left:7mm"/>					
                                       <!-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  -->																
										<!-- Line 3a -->
										<div class="styDepTblRow2" style="width:187mm;float:left;">
											<div class="styLNLeftNumBox" style="height:4.5mm;">3a</div>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">
											Is there a restriction, either temporary or permanent, on the donee's right to use or dispose of the donated </div>
											<div class="styIRS8283LNYesNoBox" style="width:6.5mm;height:5mm;font-weight:bold;border-top-width:0px;">Yes</div>
											<div class="styIRS8283LNYesNoBox"	 style="width:6.5mm;height:5mm;font-weight:bold;border-top-width:0px;">No</div>
										</div>
										<div class="styDepTblRow2" style="width:187mm;float:left;">
											<div class="styLNLeftLtrBox" style="height:4mm;"/>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal">
												<span style="float:left;">property?   
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonatedPropertyRestrictionInd"/>
													</xsl:call-template>
												</span>
												<!--Dotted Line-->
												<div class="styDotLn" style="float:right;padding-right:1mm;">....................................</div>
											</div>
											<div class="styLNAmountBox" style="width:6.5mm;height:4.5mm;padding-top:0.5mm;padding-bottom:0mm;
											font-weight:normal;text-align:center;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="DonatedPropertyRestrictionInd"/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="width:6.5mm;height:4.5mm;padding-top:0.5mm;	padding-bottom:0mm;text-align:center;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="DonatedPropertyRestrictionInd"/>
												</xsl:call-template>
												<span style="1px;"/>
											</div>
										</div>
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">
											Did you give to anyone (other than the donee organization or another organization participating with the donee</div>
											<div class="styShadingCell" style="width:6.5mm;height:4.5mm;"/>
											<div class="styShadingCell" style="width:6.5mm;height:4.5mm;"/>
										</div>
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">
											 organization in cooperative fundraising) the right to the income from the donated property or to the possession</div>
											<div class="styShadingCell" style="width:6.5mm;height:4.5mm;"/>
											<div class="styShadingCell" style="width:6.5mm;height:4.5mm;"/>
										</div>
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">
											of the property, including the right to vote donated securities,	to acquire the property by purchase or otherwise,</div>
											<div class="styShadingCell" style="width:6.5mm;height:4.5mm;border-bottom-width:1px;"/>
											<div class="styShadingCell" style="width:6.5mm;height:4.5mm;border-bottom-width:1px;"/>
										</div>
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">
											 or to designate the person having such income, possession, or right to acquire?
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonatedPropertyRightsGivenInd"/>
													</xsl:call-template>
												<!--Dotted Line-->
												<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
											</div>
											<div class="styLNAmountBox" style="width:6.5mm;height:4.5mm; text-align: center;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="DonatedPropertyRightsGivenInd"/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="width:6.5mm;height:4.5mm; text-align: center;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="DonatedPropertyRightsGivenInd"/>
												</xsl:call-template>
											</div>
										</div>
										<div class="styDepTblRow2" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">
												Is there a restriction limiting the donated property for a particular use?
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="DonatedPropertyLimitingRstrInd"/>
												</xsl:call-template>
												<!--Dotted Line-->
												<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
											</div>
											<div class="styLNAmountBox" style="width:6.5mm;height:4.5mm;border-bottom:none; text-align: center;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="DonatedPropertyLimitingRstrInd"/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="width:6.5mm;height:4.5mm;border-bottom:none; text-align: center;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="DonatedPropertyLimitingRstrInd"/>
												</xsl:call-template>
											</div>
										</div>
									</td>
								</tr>
							</table>
						</xsl:for-each>
					</xsl:if>
					<!-- End -->
					<!-- If the Print parameter is not set to be Separated and there are more elements than the container height (5), execute -->
					<xsl:if test="($Print =$Separated) and (count($Form8283Data/PropertyInformation) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
						Form 8283, Section B, Part I - Information on Donated Property:</span>
						<div>
							<xsl:call-template name="SetInitialState"/>
							<table class="styDepTbl" style="width:187mm;">
								<thead class="styTableThead">
									<tr class="styDepTblHdr">
										<th scope="col" colspan="2" class="styDepTblCell" style="width:77mm;text-align:center;font-size:7pt;border-color:black;
										border-top-width:1px;font-weight:normal;">
											<div class="styGenericDiv" style="width:6mm;text-align:center;font-weight:bold;">5</div>
											<div class="styGenericDiv" style="width:68mm;text-align:center;">
												<b>(a)</b>
												<span style="width:4px;"/>
												Description of donated property (if you need more space, attach a separate statement)
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form8283Data/PropertyInformation"/>
												</xsl:call-template>
											</div>
										</th>
										<th scope="col" class="styDepTblCell" style="width:70mm;text-align:center;font-size:7pt;border-color:black;
										border-top-width:1px;font-weight:normal;">
											<b>(b)</b>
											<span style="width:1px;"/>
											If any tangible personal property or real property was donated, give a brief summary of the overall physical conditionof the property at the time of the gift 
											</th>
										<th scope="col" class="styDepTblCell" style="width:40mm;text-align:center;font-size:7pt;border-color:black;
										border-right:none;border-top-width:1px;font-weight:normal;">
											<b>(c)</b>
											<span style="width:1px;"/>Appraised fair market value</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form8283Data/PropertyInformation">
										<tr>
											<!-- Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1
											</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose></xsl:attribute>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">
												<xsl:choose>
													<xsl:when test="PropertyId">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PropertyId"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:4px;float:center;"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="width:68mm;text-align:left;border-color:black;font-size:7pt;">											
											<span style="width:1mm"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DonatedPropertyDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:70mm;text-align:left;border-color:black;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DonatedPropertyPhysicalCondTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:40mm;text-align:right;border-color:black;font-size:7pt;border-right:none;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AppraisedFairMarketValueAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</div>
						<br/>
						<div>
							<table class="styDepTbl" style="width:187mm;">
								<thead class="styTableThead">
									<tr class="styDepTblHdr">
										<th scope="col" rowspan="2" colspan="2" class="styDepTblCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;
										 left-margin:3mm;font-weight:normal;">
											<b>(d)</b>
											<span style="width:1mm;"/>Date acquired by donor (mo., yr)</th>
										<th scope="col" rowspan="2" class="styDepTblCell" style="width:20mm;text-align:center;font-size:7pt;border-color:black;	font-weight:normal;">
											<b>(e)</b>
											<span style="width:1mm;"/>How acquired by donor</th>
										<th scope="col" rowspan="2" class="styDepTblCell" style="width:36mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
											<b>(f)</b>
											<span style="width:1mm;"/>Donor's cost or adjusted basis</th>
										<th scope="col" rowspan="2" class="styDepTblCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;	font-weight:normal;">
											<b>(g)</b>
											<span style="width:1mm;"/>For bargain sales, enter amount received</th>
										<th scope="col" colspan="2" class="styDepTblCell" style="left-margin:0mm;width:64mm;text-align:center;font-size:7pt;border-color:black;
										border-right-width:0px;font-weight:bold;">See instructions</th>
									</tr>
									<tr class="styDepTblHdr">
										<th scope="col" class="styDepTblCell" style="width:32mm;text-align:center;font-size:7pt;border-color:black;
										font-weight:normal;">
											<b>(h)</b>
											<span style="width:1mm;"/>Amount claimed as a deduction</th>
										<th scope="col" class="styDepTblCell" style="width:32mm;text-align:center;font-size:7pt;border-color:black;
										 border-right:none;font-weight:normal;">
											<b>(i)</b>
											<span style="width:1mm;"/>Date of contribution</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form8283Data/PropertyInformation">
										<tr>
											<!-- Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1
											</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose></xsl:attribute>
											<td class="styTableCell" style="width:8mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">
												<xsl:choose>
													<xsl:when test="PropertyId">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PropertyId"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:4px;float:center;"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;font-size:7pt;border-color:black;">
												<span style="width:3px;float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonorAcquiredDt"/>
													</xsl:call-template>
												</span>
												<xsl:choose>
													<xsl:when test="DonorAcquiredDt = 'VARIOUS' ">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DonorAcquiredDt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateMonth">
															<xsl:with-param name="TargetNode" select="DonorAcquiredDt"/>
														</xsl:call-template>-<xsl:call-template name="PopulateYear">
															<xsl:with-param name="TargetNode" select="DonorAcquiredDt"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<span style="width:2px;"/>
												<!-- Tags are pushed up against the hyphen to prevent spaces from getting between the hyphen and numbers -Kevin Chang -->
											</td>
											<td class="styTableCell" style="text-align:left;width:20mm;font-size:7pt;border-color:black;">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonorAcquisitionDesc"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DonorAcquisitionDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:36mm;text-align:right;font-size:7pt;border-color:black;">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonorCostOrAdjustedBasisAmt"/>
													</xsl:call-template>
												</span>
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DonorCostOrAdjustedBasisAmt"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;font-size:7pt;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BargainSalesReceivedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:32mm;text-align:right;font-size:7pt;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeductionClaimedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:32mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ContributionDt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</div>
					</xsl:if>
					<!-- End -->
					<!-- Separated Repeating Data for Section B, Part II - Taxpayer (Donor) Statement -->
					<!-- When print option ON and more than 1 set of repeating data                   -->
					<xsl:if test="($Print = $Separated)
					 and (count($Form8283Data/PropertyIdLetterAndDescGrp) &gt; 1)">
						<br/>
						<span class="styRepeatingDataTitle">
						Form 8283, Section B, Part II - Taxpayer (Donor) Statement:</span>
						<table class="styDepTbl" style="width:187mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width:70mm;font-size:7pt;border-color:black;border-right-width:1px;">
										Property Identifying Letter</th>
									<th scope="col" class="styDepTblCell" style="width:118mm;font-size:7pt;border-color:black;border-right-width:0px;">
										Description</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8283Data/PropertyIdLetterAndDescGrp">
									<tr>
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">
												<xsl:attribute name="class">styDepTblRow1</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styDepTblCell" style="text-align:left;padding-left:2mm;font-size:7pt;font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyId"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:left;font-size:7pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DonatedPropertyDesc"/>
											</xsl:call-template>
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