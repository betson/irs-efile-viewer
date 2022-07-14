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
		<html xmlns="http://www.irs.gov/efile" xmlns:efile="http://www.irs.gov/efile">
			<head>
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
			<body class="styBodyClass">
				<form name="Form8283">
					<xsl:call-template name="DocumentHeader"/>
					<div style="width:187mm;">
						<div class="styFNBox" style="width:32mm;height:27mm;">
							<div>
								<span style="padding-top:1mm;">Form<span style="width:6px;"/>
								</span>
								<span class="styFormNumber">8283</span>
							</div>
							<div class="styAgency" style="width:30mm;padding-bottom:2mm;">(Rev. December 2012)
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
						<div class="styFTBox" style="width:125mm;">
							<div class="styMainTitle">Noncash Charitable Contributions
    </div>
							<br/>
							<div class="styFBT" style="font-size: 7pt;padding-bottom:1mm;">
								<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
								<span style="width:3px;"/>Attach to your tax return if you claimed a total deduction<br/>
      of over $500 for all contributed property.
    </div>
							<div class="styFBT">
								<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
								<span style="width:1mm;"/>See separate instructions.
    </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:10.5mm;border-bottom-width:1px;">
							<br/>
							<div style="font-size:7pt;">
								<span style="width:6px;"/>OMB No.1545-0908
    </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:16.5mm">
							<br/>
							<div style="font-size:7pt;text-align:left;">
								<span style="width:6px;"/>Attachment<br/>
								<span style="width:6px;"/>Sequence No.
      <span style="font-family:Arial;font-size:9pt;font-weight:bold;">155</span>
							</div>
						</div>
						<!-- Name(s) & EIN Box  -->
						<div class="styBB" style="width:187mm;border-top-width:1px">
							<div class="styNameBox" style="font-size:7pt;width:139mm;height:10mm;font-weight:normal;">Name(s) shown on your income tax return
 <!--  WARNING: Return Type will need to be update with various future form 1040 return type  -->
							  <xsl:choose>
								<xsl:when test="$RtnHdrData/ReturnType='1040'">
								<br/>								  
									 <xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
								   </xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
								<br/>
							  <xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								  </xsl:call-template>
								  <br/>
							  <xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								  </xsl:call-template>
								</xsl:otherwise>
							  </xsl:choose>
												</div>
							<div class="styEINBox" style="font-size:7pt;width:47mm;height:4mm;padding-left:2mm;">Identifying number<br/><br/>
															<span style="font-weight:normal;">
								  <!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
									<xsl:choose>
										<xsl:when test="$RtnHdrData/ReturnType='1040'">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									</span>
							</div>
						</div>
					</div>
					<!--Name(s) & EIN Box -->
					<!--Note -->
					<div style="width:187mm;">
						<div class="styBB" style="width:187mm;border-top-width:0px">
							<span style="font-size:8pt;">
								<b>Note.</b>
							</span>
							<span style="width:6px;"/>Figure the amount of your contribution deduction before completing this form. See your tax return instructions.
  </div>
						<!--Section A -->
						<div style="width:187mm;">
							<div class="styBB" style="width:187mm;border-top-width:0px;border-bottom-width:0px;">
								<span style="font-size:8pt;">
									<b>Section A.  Donated Property of $5,000 or Less and Certain Publicly Traded Securities&#151;</b>
								</span>
        List in this section <b>only</b>
								<span style="width:19.45mm;"/>items (or groups of similar items) for which you claimed a deduction of $5,000 or less. Also, list certain publicly traded
        <span style="width:19.45mm;"/>securities even if the deduction is more than $5,000 (see instructions).
    
							</div>
						</div>
					</div>
					<!--Part I -->
					<div class="styBB" style="width:187mm;border-top-width:1px">
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;width:150mm;border-top-width:1px;">
              Information on Donated Property&#151;<span class="styNormalText">If you need more space, attach a statement.</span>
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
						<table cellspacing="0" summary="Part I Information on Donated Property" style="" name="TYTable" id="TYTable" class="styTable">
							<thead class="styTableThead">
								<tr>
									<th scope="col" class="styTableCell"  style="width:6mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;border-right:none;">1</th>
									<th scope="col" class="styTableCell" style="width:61mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;" >
										<span class="styBoldText">(a)</span>
										<span style="width:1mm;"/>
										<span style="font-size:7pt;">Name and address of the donee organization</span>
									</th>
	<th scope="col" class="styTableCell"  style="width:61mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;" >
										<span class="styBoldText">(b)</span>
										<span style="width:1mm;"/>
										<span style="font-size:7pt;">if donated property is a vehicle (see instructions), check the box. Also enter the vehicle identification number (unless Form 1098-C is attached)</span>
									</th>								
									<th scope="col" class="styTableCell"  style="width:60mm;text-align:center;font-size:7pt;border-color:black;border-right:none;font-weight:normal;" >
										<span class="styBoldText">(c)</span>
										<span style="width:1mm;"/>
										<span style="font-size:7pt;">Description of donated property  (For a donated vehicle, enter the year, make, model, condition, and mileage, unless Form 1098-C is attached)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- If the Print parameter is not set to be Separated, or there are less elements than the container height (5), execute -->
								<xsl:if test="($Print !=$Separated) or (count($Form8283Data/InformationOnDonatedProperty) &lt;= 5)">
									<xsl:for-each select="$Form8283Data/InformationOnDonatedProperty">
										<tr>
											<td class="styTableCell" style="width:10mm;text-align:left;padding-left:3mm;font-size:7pt;font-weight:bold;border-color:black;">
											
												<xsl:choose>
													<xsl:when test="PropertyIdentifier">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PropertyIdentifier"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:4px;float:center;"/>
													</xsl:otherwise>
												</xsl:choose>
				             			
                                       				<xsl:call-template name="SetFormLinkInline">
                                                      <xsl:with-param name="TargetNode" select="$Form8283Data/InformationOnDonatedProperty"/>
                                                 </xsl:call-template>	
											</td>
											<td class="styTableCell" style="width:60mm;text-align:left;font-size:7pt;font-weight:normal;border-color:black;" >
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfDoneeOrganization/BusinessNameLine1"/>
												</xsl:call-template>
												<xsl:if test="NameOfDoneeOrganization/BusinessNameLine2">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfDoneeOrganization/BusinessNameLine2"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="USAddressOfDoneeOrganization">
													<br/>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddressOfDoneeOrganization"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="FrgnAddressOfDoneeOrganization">
													<br/>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="FrgnAddressOfDoneeOrganization"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCell" style="width:60mm;text-align:left;font-size:7pt;font-weight:normal;border-color:black;" > 
	<span style="width:34mm"/>
	 <input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode"
                     select="DonatedPropertyVehicleInd"/>
                     <xsl:with-param name="BackupName">
                  IRS8283 DonatedPropertyVehicleInd<xsl:number value="position()"/>
                  </xsl:with-param>
                  </xsl:call-template>
                </input>
           <label>
 <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="DonatedPropertyVehicleInd"/>
                  <xsl:with-param name="BackupName">
                 <!-- IRS8283 DonatedPropertyVehicleInd<xsl:number value="position()"/>-->
                 IRS8283 DonatedPropertyVehicleInd
                  </xsl:with-param>
                </xsl:call-template>
            </label>
	<br/>
<xsl:call-template name="PopulateText">
	<xsl:with-param name="TargetNode" select="VehicleIdentificationNumber"/>
	</xsl:call-template>
	</td>
	<td class="styTableCell" style="width:60mm;text-align:left;font-size:7pt;font-weight:normal;border-color:black;
	border-right:none;">
	<xsl:call-template name="PopulateText">
	<xsl:with-param name="TargetNode" select="DescriptionOfDonatedProperty"/>
	</xsl:call-template>
<!--    <xsl:call-template name="PopulateText">
	<xsl:with-param name="TargetNode" select="VehicleYear"/>
	</xsl:call-template>-->
                            		</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($Form8283Data/InformationOnDonatedProperty) &lt; 1) or
        (($Print = $Separated) and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5))">
									<tr>
										<td class="styTableCell" style="width:6mm;text-align:left;padding-left:3mm;font-size: 7pt;font-weight:bold;border-color:black;">A<span class="styTableCellPad"/>
										</td>
										<xsl:if test="($Print != $Separated) or (count($Form8283Data/InformationOnDonatedProperty) &lt; 1)">
											<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;" >
												<span class="styTableCellPad"/>
											</td>
										</xsl:if>
							<!--  Insert additional data message if Print is set to separated and there are five or more elements -->
										<xsl:if test="($Print = $Separated) and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
											<td class="styTableCell" style="width:60mm;text-align:left;font-size:7pt;font-weight:normal;border-color:black;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8283Data/InformationOnDonatedProperty"/>
												</xsl:call-template>
											</td>
										</xsl:if>
										<td class="styTableCell" style="width:60mm;padding-right:38mm;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
	<input type="checkbox" class="styCkbox" name="Checkbox">
			<xsl:call-template name="PopulateCheckbox">
			<xsl:with-param name="TargetNode" select="$Form8283Data/testA"/>
			<xsl:with-param name="BackupName">IRS1120FSchIForeignBankYesA  
			</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/testA"/>
									<xsl:with-param name="BackupName">IRS1120FSchIForeignBankYesA</xsl:with-param>
								</xsl:call-template>
          </label>	
										</td>	
	<!--									<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;" >
									 <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/CorporationIsAForeignBank"/>
                    <xsl:with-param name="BackupName">IRS1120FSchIForeignBankYes</xsl:with-param>
                  </xsl:call-template>
                </input>
           <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/CorporationIsAForeignBank"/>
                  <xsl:with-param name="BackupName">IRS1120FSchIForeignBankYes</xsl:with-param>
                </xsl:call-template>

            </label>

										</td>-->
					<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;border-right:none;" >
											<span class="styTableCellPad"/>
										</td>				
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty) &lt; 2 or
        ($Print = $Separated) and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:6mm;text-align:left;padding-left:3mm;font-size: 7pt;font-weight:bold;border-color:black;">B<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
						<td class="styTableCell" style="width:60mm;padding-right:38mm;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
																												<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/testB"/>
									<xsl:with-param name="BackupName">IRS1120FSchIForeignBankYesB</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/testB"/>
									<xsl:with-param name="BackupName">IRS1120FSchIForeignBankYesB</xsl:with-param>
								</xsl:call-template>
          </label>
										</td>				
	<!--   									<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;
										" >
									 <input type="checkbox" class="styCkbox">
               <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/CorporationIsAForeignBank"/>
                    <xsl:with-param name="BackupName">IRS1120FSchIForeignBankYes</xsl:with-param>
                  </xsl:call-template>
                </input>
           <label>
    <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/CorporationIsAForeignBank"/>
                  <xsl:with-param name="BackupName">IRS1120FSchIForeignBankYes</xsl:with-param>
                </xsl:call-template>

            </label>

										</td>-->
					<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;border-right:none;" >
											<span class="styTableCellPad"/>
										</td>				
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty) &lt; 3 or
        ($Print = $Separated) and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:6mm;text-align:left;padding-left:3mm;font-size: 7pt;font-weight:bold;border-color:black;">C<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;" >
											<span class="styTableCellPad"/>
										</td>
		<td class="styTableCell" style="width:60mm;padding-right:38mm;font-weight:bold;border-color:black;" >
											<span class="styTableCellPad"/>
																												<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/testC"/>
									<xsl:with-param name="BackupName">IRS1120FSchIForeignBankYesC</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/testC"/>
									<xsl:with-param name="BackupName">IRS1120FSchIForeignBankYesC</xsl:with-param>
								</xsl:call-template>
          </label>
										</td>									
	<!--									<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;
										" >
						 <input type="checkbox" class="styCkbox">
                 <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/CorporationIsAForeignBank"/>
                    <xsl:with-param name="BackupName">IRS1120FSchIForeignBankYes</xsl:with-param>
                  </xsl:call-template>
                </input>
           <label>
             <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/CorporationIsAForeignBank"/>
                  <xsl:with-param name="BackupName">IRS1120FSchIForeignBankYes</xsl:with-param>
                </xsl:call-template>
            </label>
		</td>
-->					<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;border-right:none;" >
											<span class="styTableCellPad"/>
										</td>				
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty) &lt; 4 or
        ($Print = $Separated) and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:6mm;text-align:left;padding-left:3mm;font-size: 7pt;font-weight:bold;border-color:black;">D<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:81mm;text-align:center;font-weight:bold;border-color:black;" >
											<span class="styTableCellPad"/>
										</td>
													<td class="styTableCell" style="width:81mm;;padding-right:38mm;font-weight:bold;border-color:black;" >
											<span class="styTableCellPad"/>
								<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/testD"/>
			<xsl:with-param name="BackupName">IRS1120FSchIForeignBankYesD</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/testD"/>
									<xsl:with-param name="BackupName">IRS1120FSchIForeignBankYesD</xsl:with-param>
								</xsl:call-template>
          </label>
										</td>						
	<!--				<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;
										" >
						 <input type="checkbox" class="styCkbox">
                 <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/CorporationIsAForeignBank"/>
                    <xsl:with-param name="BackupName">IRS1120FSchIForeignBankYes</xsl:with-param>
                  </xsl:call-template>
                </input>
           <label>
               <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/CorporationIsAForeignBank"/>
                  <xsl:with-param name="BackupName">IRS1120FSchIForeignBankYes</xsl:with-param>
                </xsl:call-template>
           </label>

										</td>  -->

					<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;border-right:none;" >
											<span class="styTableCellPad"/>
										</td>				
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty) &lt; 5 or
        ($Print = $Separated) and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:6mm;text-align:left;padding-left:3mm;font-size: 7pt;font-weight:bold;border-color:black;">E<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:81mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
		<td class="styTableCell" style="width:81mm;padding-right:38mm;font-weight:bold;border-color:black;" >
											<span class="styTableCellPad"/>
																												<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/testE"/>
									<xsl:with-param name="BackupName">IRS1120FSchIForeignBankYesE</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/testE"/>
									<xsl:with-param name="BackupName">IRS1120FSchIForeignBankYesE</xsl:with-param>
								</xsl:call-template>
          </label>
										</td>
					<td class="styTableCell" style="width:60mm;text-align:center;font-weight:bold;border-color:black;border-right:none;" >
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
						<table cellspacing="0" summary="Part I Information on Donated Property If the amount you claimed as a deduction for an item is $500 or less, you do not have to complete columns (d), (e), and (f)." class="styTable" style="" name="TYTable1" id="TYTable1">
							<thead class="styTableThead">
								<tr>
									<th scope="col" colspan="7"  class="styTableCell" style="width:187mm;text-align:left;font-size:7pt;border-right:none;font-weight:normal;border-top-width:0px;border-color:black;">
										<span class="styBoldText">Note.</span>
										<span style="width:1mm;"/>
										<span style="font-size: 7pt;">If the amount you claimed as a deduction for an item is $500 or less, you do not have to complete columns (e), (f), and (g).</span>
									</th>
								</tr>
								<tr>
									<th scope="col" class="styTableCell"  style="width:7mm;background-color:lightgrey;border-right:1 solid black;border-bottom:1 solid black;">
										<span style="width:1mm;"/>
									</th>
									<th scope="col" class="styTableCell"  style="width:28mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;">
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
									<th scope="col" class="styTableCell"  style="width:36mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;">
										<span class="styBoldText">(g)</span>
										<span style="width:1mm;"/>Donor's cost or adjusted basis
          </th>
									<th scope="col" class="styTableCell"  style="width:36mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;">
										<span class="styBoldText">(h)</span>
										<span style="width:1mm;"/>Fair market value (see instructions)
          </th>
									<th scope="col" class="styTableCell"  style="width:26mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;border-right:none;">
										<span class="styBoldText">(i)</span>
										<span style="width:1mm;"/>Method used to determine the fair market value
          </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- If the Print parameter is not set to be Separated, or there are less elements than the container height (5), execute -->
								<xsl:if test="($Print !=$Separated) or (count($Form8283Data/InformationOnDonatedProperty) &lt;= 5)">
									<xsl:for-each select="$Form8283Data/InformationOnDonatedProperty">
										<tr>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size: 7pt;font-weight:bold;border-color:black;">
												<xsl:choose>
													<xsl:when test="PropertyIdentifier">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PropertyIdentifier"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:4px;float:center;"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="float:right;width:28mm;text-align:center;font-size: 7pt;font-weight:normal;
            border-color:black;">
												<span style="width:0.1mm;float:left;">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Section A Part I Line 1 Columns (c) - (f) Donor line detail</xsl:with-param>
														<xsl:with-param name="TargetNode" select="DonorLineDetail/@scheduleK-1Indicator"/>
														<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DonorLineDetail/DateOfTheContribution"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:27mm;font-size: 7pt;font-weight:normal;border-color:black;">
												<span style="width:0.1mm;float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonorLineDetail/DateAcquiredByDonor"/>
													</xsl:call-template>
												</span>
												<span style="width:19mm;text-align:center;">
													<xsl:choose>
														<xsl:when test="DonorLineDetail/DateAcquiredByDonor = 'VARIOUS'  ">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DonorLineDetail/DateAcquiredByDonor"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateMonth">
																<xsl:with-param name="TargetNode" select="DonorLineDetail/DateAcquiredByDonor"/>
															</xsl:call-template>-<xsl:call-template name="PopulateYear">
																<xsl:with-param name="TargetNode" select="DonorLineDetail/DateAcquiredByDonor"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
												<span style="width:2px;"/>
												<!-- Tags are pushed up against the hyphen to prevent spaces from getting between the hyphen and numbers -Kevin Chang -->
											</td>
											<td class="styTableCell" style="width:26mm;text-align:left;font-size: 7pt;font-weight:normal;border-color:black;">
												<span style="text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DonorLineDetail/HowAcquiredByDonor"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" style="width:36mm;text-align:right;font-size: 7pt;font-weight:normal;border-color:black;">
												<!--span style="width:21.5mm;float:left;text-align:right;"-->
												<div class="styGenericDiv" style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorsCostOrAdjustedBasis"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorsCostOrAdjustedBasis"/>
												</xsl:call-template>
												<span style="width:0.1mm;"/>
											</td>
											<td class="styTableCell" style="width:36mm;text-align:right;font-size: 7pt;font-weight:normal;border-color:black;">
												<div class="styGenericDiv" style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="FairMarketValue"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FairMarketValue"/>
												</xsl:call-template>
												<span style="width:0.1mm;"/>
											</td>
											<td class="styTableCell" style="width:26mm;text-align:left;font-size: 7pt;font-weight:normal;border-color:black;border-right:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FairMarketValueMethod"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty) &lt; 1 or
        ($Print = $Separated) and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size: 7pt;font-weight:bold;border-color:black;">A<span class="styTableCellPad"/>
										</td>
										<xsl:choose>
											<xsl:when test="($Print = $Separated) and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
												<td class="styTableCell" style="float:right;width:26mm;text-align:left;font-size: 7pt;font-weight:normal;border-color:black;">
													<span class="styTableCellPad" style="width:26mm">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$Form8283Data/InformationOnDonatedProperty"/>
															<xsl:with-param name="ShortMessage" select="'true'"/>
														</xsl:call-template>
													</span>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td class="styTableCell" style="float:right;width:26mm;text-align:center;font-weight:bold;border-color:black;">
													<span class="styTableCellPad"/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styTableCell" style="float:left;width:26mm;text-align:center;font-weight:bold;border-color:black;">
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
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty) &lt; 2 or
        ($Print = $Separated) and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size: 7pt;font-weight:bold;border-color:black;">B<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="float:right;width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="float:left;width:26mm;text-align:center;font-weight:bold;border-color:black;">
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
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty) &lt; 3 or
        ($Print = $Separated) and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size: 7pt;font-weight:bold;border-color:black;">C<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="float:right;width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="float:left;width:26mm;text-align:center;font-weight:bold;border-color:black;">
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
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty) &lt; 4 or
        ($Print = $Separated) and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size: 7pt;font-weight:bold;border-color:black;">D<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="float:right;width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="float:left;width:26mm;text-align:center;font-weight:bold;border-color:black;">
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
								<xsl:if test="count($Form8283Data/InformationOnDonatedProperty) &lt; 5 or
        ($Print = $Separated) and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size: 7pt;font-weight:bold;border-color:black;">E<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="float:right;width:26mm;text-align:center;font-weight:bold;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="float:left;width:26mm;text-align:center;font-weight:bold;border-color:black;">
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
					<!-- PART II -->
					<div style="width:187mm;height:34mm;" id="TPXctn">
						<xsl:call-template name="SetInitialState"/>
						<table cellspacing="0" summary="Part II Partial Interests and Restricted Use Property" class="styIRS8283TableContainer" style="width:183mm;border-top:none;" name="TYTable3" id="TYTable3">
							<!--Display empty Section A Part II -->
							<xsl:if test="(not($Form8283Data/InformationOnDonatedProperty)) or (((count($Form8283Data/InformationOnDonatedProperty) &gt; 5) and ($Print = $Separated)))">
								<tr>
									<th scope="col" colspan="7" class="styTableCell" style="width:187mm;text-align:left;font-size:7pt;border-right:none;">
										<div style="width:187mm;border-top-width:0px">
											<span class="styPartName" style="width:16mm;">Part II</span>
											<span style="font-family:verdana;font-size:8pt;">
												<span style="width:6px;"/>
												<b>Partial Interests and Restricted Use Property&#151;</b>
											</span>
											<span style="font-family:verdana;font-size:8pt;font-weight:normal;">
              Complete lines 2a through 2e if you gave less than an entire interest in
              a property listed in Part I.  Complete lines 3a through 3c if conditions were placed on a contribution listed in Part I; also attach the required statement (see instructions).
           </span>
										</div>
									</th>
								</tr>
								<tr>
									<td colspan="7" class="styTableCell" style="width:187mm;text-align:left;
                         font-size:7pt;border-right:none;">
										<div style="width:187mm;">
											<div class="styLNLeftNumBox" style="height:4mm;">2a</div>
											<div class="styLNDesc" style="height:4mm;font-weight:normal;">Enter the letter from Part I that identifies the property for which you gave less than an entire interest</div>
											<div class="" style="float:right;">
												<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
												<span style="width:6px;"/>
												<span style="width:32mm;border-bottom:1 solid black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PropertyIdentifier"/>
													</xsl:call-template>
												</span>
											</div>
										</div>
										<div style="width:187mm;padding-left:8mm;">
              If Part II applies to more than one property, attach a separate statement.</div>
										<div style="width:187mm;">
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
													<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
													<span style="width:6px;"/>
													<span style="width:32mm;border-bottom:1 solid black;padding-left:3mm;">
														<xsl:choose>
															<xsl:when test="((count($Form8283Data/InformationOnDonatedProperty) &gt; 5) and ($Print = $Separated))">
																<xsl:call-template name="PopulateAdditionalDataTableMessage">
																	<xsl:with-param name="TargetNode" select="$Form8283Data/InformationOnDonatedProperty"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="TotalDeductionClaimedThisTY"/>
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
												<div class="styGenericDiv" style="width:95mm;">
            </div>
												<div class="styGenericDiv" style="padding-left:0mm;width:48mm;">
													<b>(2)</b>
													<span style="width:12px;"/>For any prior tax years
         </div>
												<div class="" style="float:right;">
													<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
													<span style="width:6px;"/>
													<span style="width:32mm;border-bottom:1 solid black;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TotDeductionClaimedAnyPriorTY"/>
														</xsl:call-template>
													</span>
												</div>
											</div>
										</div>
										<div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>
										<div class="styLNDesc" style="width:172mm;height:4.5mm;border-bottom-width:1px;font-weight:normal;">Name and address of each organization to which any such contribution was made in a prior year (complete only if different from the donee organization above):</div>
										<br/>
										<div class="styBB" style="width:180mm;margin-left:4mm;float:left;"/>
										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">
												<span style="width:1mm;"/>
											</div>
											<div style="font-size:6pt;font-weight:normal;">Name of charitable organization (donee)</div>
										</div>
										<div class="styBB" style="width:180mm;margin-left:4mm;float:left;">
											<span style="width:1px;"/>
										</div>
										<div style="width:172mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">
												<span style="width:1mm;"/>
											</div>
											<div style="font-size:6pt;font-weight:normal;">Address (number, street, and room or suite no.)</div>
										</div>
										<div class="styBB" style="width:180mm;margin-left:4mm;float:left;">
											<span style="width:1px;"/>
										</div>
										<div style="width:172mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">
												<span style="width:1mm;"/>
											</div>
											<div style="font-size:6pt;font-weight:normal;">City or town, state, and ZIP code</div>
										</div>
										<div class="styBB" style="width:180mm;margin-left:4mm;float:left;"/>
										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">d</div>
											<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">For tangible property, enter the place where the property is located or kept
												<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/><span style="width:7mm;"/>
												<span style="width: 2mm;"/>
												<span style="border-bottom: 1px solid black; width: 20mm;"/>
											</div>
										</div>
										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">e</div>
											<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">Name of any person, other than the donee organization, having actual possession of the property
			<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
												<span style="width:5mm;"/>
												<span style="border-bottom: 1px solid black; width: 20mm;"/>
											</div>
										</div>
										<div class="styBB" style="width:180mm;margin-left:4mm;float:left;"/>
										<xsl:choose>
											<xsl:when test="$Form8283Data/InformationOnDonatedProperty/RestrictionOnDonatedProperty=1">
												<div style="width:186mm;float:left;">
													<div class="styLNLeftLtrBox" style="height:4mm;">3a</div>
													<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">Is there a restriction, either temporary or permanent, on the donee's right to use or dispose of the donated 
                  </div>
													<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4mm;font-weight:bold;border-top-width:1px;">Yes</div>
													<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4mm;font-weight:bold;border-top-width:1px;">No</div>
												</div>
												<div style="width:186mm;float:left;">
													<div class="styLNLeftLtrBox" style="height:4mm;"/>
													<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;padding-bottom:0mm;padding-top:0mm">
                 property?
            <span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
	        <span class="styBoldText" style="width:20px;">.</span>
            <span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
		   <span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
		    <span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:20px;">.</span>
			<span class="styBoldText" style="width:8px;">.</span>
													</div>
													<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4.5mm;font-weight:bold;border-top-width:0px;padding-bottom:0mm;padding-top:0mm"/>
													<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4.5mm;font-weight:bold;border-top-width:0px;padding-bottom:0mm;padding-top:0mm"/>
												</div>
											</xsl:when>
											<xsl:otherwise>
												<div style="width:186mm;float:left;">
													<div class="styLNLeftLtrBox" style="height:4mm;">a</div>
													<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">Is there a restriction, either temporary or permanent, on the donee's right to use or dispose of the donated 
                  </div>
													<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4mm;font-weight:bold;border-top-width:1px;">Yes</div>
													<div class="styIRS8283LNYesNoBox" style="width:6mm;height:4mm;font-weight:bold;border-top-width:1px;">No</div>
												</div>
												<div style="width:186mm;float:left;">
													<div class="styLNLeftLtrBox" style="height:4mm;padding-bottom:0mm;padding-top:0mm"/>
													<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;padding-bottom:0mm;padding-top:0mm">
            property?
        <span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
														<span class="styBoldText" style="width:20px;">.</span>
													</div>
													<div class="styLNAmountBox" style="width:6mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;">
														<span style="1px;"/>
													</div>
													<div class="styLNAmountBox" style="width:6mm;height:4.5mm;padding-bottom:0mm;padding-top:0mm;float:right; text-align: center;"/>
												</div>
											</xsl:otherwise>
										</xsl:choose>
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
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;padding-bottom:0mm;padding-top:0mm">organization in cooperative fundraising) the right to the income from the donated property or to the possession</div>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;padding-bottom:0mm;padding-top:0mm"/>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;padding-bottom:0mm;padding-top:0mm"/>
										</div>
										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
											<div class="styLNDesc" style="width:166mm;height:4mm;padding-bottom:0mm;padding-top:0mm; font-weight:normal;">of the property, including the right to vote donated securities, to acquire the property by purchase or otherwise,</div>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;padding-bottom:0mm;padding-top:0mm; border-bottom-width:1px;"/>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;padding-bottom:0mm;padding-top:0mm; border-bottom-width:1px;"/>
										</div>
										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4mm;padding-bottom:0mm;padding-top:0mm"/>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;padding-bottom:0mm;padding-top:0mm"> or to designate the person having such income, possession, or right to acquire?
                <span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
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
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;padding-bottom:0mm;padding-top:0mm">Is there a restriction limiting the donated property for a particular use?
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
												<span class="styBoldText" style="width:19px;">.</span>
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
							<xsl:if test="((count($Form8283Data/InformationOnDonatedProperty) &lt;= 5) or ($Print != $Separated))">
								<xsl:for-each select="$Form8283Data/InformationOnDonatedProperty">
									<tr>
										<th scope="col" colspan="7"  class="styTableCell" style="width:187mm;text-align:left;font-size:7pt;border-right:none;">
											<div style="width:187mm;border-top-width:0px">
												<span class="styPartName" style="width:16mm;">Part II</span>
												<span style="font-family:verdana;font-size:8pt;">
													<span style="width:6px;"/>
													<b>Partial Interests and Restricted Use Property&#151;</b>
												</span>
												<span style="font-family:verdana;font-size:8pt;font-weight:normal;">
                  Complete lines 2a through 2e if you gave less than an <br/>
													<span style="width:18mm;"/>entire interest in a property listed in Part I. Complete lines 3a through 3c if conditions were placed on a <br/>
													<span style="width:18mm;"/>contribution listed in Part I; also attach the required statement (see instructions).
      </span>
											</div>
										</th>
									</tr>
									<tr>
										<td colspan="7" class="styTableCell" style="width:187mm;text-align:left;font-size:7pt;border-right:none;">
											<!--Line 2a begin-->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:4mm;">2a</div>
												<div class="styLNDesc" style="height:4mm;font-weight:normal;">Enter the letter from Part I that identifies the property in which you gave less than an entire interest</div>
												<div class="" style="float:right;">
													<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
													<span style="width:6px;"/>
													<span style="width:32mm;border-bottom:1 solid black;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="PropertyIdentifier"/>
														</xsl:call-template>
													</span>
												</div>
											</div>
											<div style="width:187mm;padding-left:8mm;">
              If Part II applies to more than one property, attach a separate statement.</div>
											<!--Line 2a end-->
											<div style="width:187mm;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
												<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">
													<div class="styGenericDiv" style="width:95mm;">
                Total amount claimed as a deduction for the property listed in Part I:
              </div>
													<div class="styGenericDiv" style="padding-left:0mm;width:45mm;">
														<b>(1)</b>
														<span style="width:12px;"/>For this tax year
           </div>
													<div class="" style="float:right;">
														<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
														<span style="width:6px;"/>
														<span style="width:32mm;border-bottom:1 solid black;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="TotalDeductionClaimedThisTY"/>
															</xsl:call-template>
														</span>
													</div>
												</div>
											</div>
											<div style="width:187mm;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
												<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">
													<div class="styGenericDiv" style="width:95mm;">
              </div>
													<div class="styGenericDiv" style="padding-left:0mm;width:45mm;">
														<b>(2)</b>
														<span style="width:12px;"/>For any prior tax years
           </div>
													<div class="" style="float:right;">
														<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
														<span style="width:6px;"/>
														<span style="width:32mm;border-bottom:1 solid black;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="TotDeductionClaimedAnyPriorTY"/>
															</xsl:call-template>
														</span>
													</div>
												</div>
											</div>
											<div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>
											<div class="styLNDesc" style="width:179mm;height:4.5mm;border-color:black;border-style:solid;border-left:none;border-right:none;border-top:none;border-bottom-width:1px;font-weight:normal;">Name and address of each organization to which any such contribution was made in a prior year (complete only if different from the donee organization above):</div>
											<!-- Name of Charitable Organization (Donee) -->
											<div style="width:172mm;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;">
													<span style="width:1mm;"/>
												</div>
												<div style="font-size:6pt;font-weight:normal;">Name of charitable organization (donee)</div>
											</div>
											<div class="styBB" style="width:180mm;margin-left:4mm;float:left;">
												<xsl:if test="NameOfOrganization/BusinessNameLine1 !=''">
												<span style="width:5mm"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfOrganization/BusinessNameLine1"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="NameOfOrganization/BusinessNameLine2 !=''">
													<br/><span style="width:5mm"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfOrganization/BusinessNameLine2"/>
													</xsl:call-template>
												</xsl:if>
											</div>
											<!-- Address of Organization -->
											<div style="width:172mm;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;">
													<span style="width:1mm;"/>
												</div>
												<div style="font-size:6pt;font-weight:normal;">Address (number, street, and room or suite no.)</div>
											</div>
											<div class="styBB" style="width:180mm;margin-left:4mm;float:left;">
												<xsl:if test="USAddressOfOrganization!=''">
												<span style="width:5mm"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddressOfOrganization/AddressLine1"/>
													</xsl:call-template>
													<br/><span style="width:5mm"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddressOfOrganization/AddressLine2"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="ForeignAddressOfOrganization!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddressOfOrganization/AddressLine1"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddressOfOrganization/AddressLine2"/>
													</xsl:call-template>
												</xsl:if>
											</div>
											<!-- Organization City, State & Zip Code-->
											<div style="width:172mm;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;">
													<span style="width:1mm;"/>
												</div>
												<div style="font-size:6pt;font-weight:normal;">City or town, state, and ZIP code</div>
											</div>
											<div class="styBB" style="width:180mm;margin-left:4mm;float:left;">
												<xsl:if test="USAddressOfOrganization"><span style="width:5mm"/>
													<xsl:call-template name="PopulateCityStateInfo">
														<xsl:with-param name="TargetNode" select="USAddressOfOrganization"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="ForeignAddressOfOrganization">
													<xsl:call-template name="PopulateCityStateInfo">
														<xsl:with-param name="TargetNode" select="''"/>
														<xsl:with-param name="ForeignAddressTargetNode" select="ForeignAddressOfOrganization"/>
													</xsl:call-template>
													<span style="width: 2mm"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddressOfOrganization/Country"/>
													</xsl:call-template>
												</xsl:if>
											</div>
											<div style="width:187mm;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;">d</div>
												<div class="styLNDesc" style="width:108mm;height:4mm;font-weight:normal;">
													<span style="width:99mm;">For tangible property, enter the place where the property is located or kept</span>
													
													<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/><span style="width:5mm;"/>
												</div>
												<div style="width:80mm;float:right;clear:all;">
													<span class="styUnderlineAmount" style="width:81mm;float:right;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TangiblePropertyLocation"/>
														</xsl:call-template>
													</span>
												</div>
											</div>
											<div style="width:187mm;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;">e</div>
												<div class="styLNDesc" style="width:134mm;height:4mm;font-weight:normal;float:left;clear:none;">
													<span style="width:130mm;">Name of any person, other than the donee organization, having actual possession of the property</span>
													
													<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
												</div>
												<div style="width:47mm;float:right;clear:all;">
													<span class="styUnderlineText" style="width:47mm;float:right;">
														<!--    *****************************************************************************  -->
														<choice>
															<when test="BusNameOfPersonPossessingProp">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="BusNameOfPersonPossessingProp/BusinessNameLine1"/>
																</xsl:call-template>
																<br/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="BusNameOfPersonPossessingProp/BusinessNameLine2"/>
																</xsl:call-template>
															</when>
															<Otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select=" NameOfPersonPossessingProperty"/>
																</xsl:call-template>
															</Otherwise>
														</choice>
														<!--**********************************************************************************  -->
													</span>
												</div>
												<div class="styFixedUnderline" style="width:180mm;margin-left:4mm;">
         
               
            </div>
											</div>
											<!-- Section A Part II line 3a begin-->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:4mm;">3a</div>
												<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal">Is there a restriction, either temporary or permanent, on the donee's right to use or dispose of the donated </div>
												<div class="styIRS8283LNYesNoBox" style="width:6mm;height:2mm;font-weight:bold;border-top-width:1px;">Yes</div>
												<div class="styIRS8283LNYesNoBox" style="width:6mm;height:2mm;font-weight:bold;border-top-width:1px;">No</div>
											</div>
											<div style="width:186mm;float:left;">
									<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
	<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">              
             <span> property? </span>  
       <xsl:call-template name="SetFormLinkInline">
	    <xsl:with-param name="TargetNode" select="RestrictionOnDonatedProperty"/>
		</xsl:call-template>
<b>
  <span style="width:6mm;"/>
    <span style="letter-spacing:4mm;font-weight:bold;text-align:right;">.............................</span>
  </b>
  </div>
  
 
  
  

  
												<div class="styLNAmountBox" style="width:6mm;height:5mm;padding-top:0.5mm;padding-bottom:0mm;font-weight:normal;text-align:center;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="RestrictionOnDonatedProperty"/>
													</xsl:call-template>
												</div>
												<div class="styLNAmountBox" style="width:6mm;height:5mm;padding-top:0.5mm;padding-bottom:0mm;float:right; text-align: center;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="RestrictionOnDonatedProperty"/>
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
												<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;"> in cooperative fundraising) the right to the income from the donated property or to the possession of the property,  including </div>
												<div class="styShadingCell" style="width:6mm;height:5mm;"/>
												<div class="styShadingCell" style="width:6mm;height:5mm;"/>
											</div>
											<div style="width:187mm;">
												<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
												<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">the right to vote donated securities, to acquire the property by purchase or otherwise,  possession, or right to acquire?
	                <span style="width:2px;"/>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="RightsGivenToDonatedProperty"/>
													</xsl:call-template>									
																								</div>
<div class="styLNAmountBox" style="width:6mm;height:4.5mm; text-align: center;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="RightsGivenToDonatedProperty"/>
													</xsl:call-template>
												</div>
												<div class="styLNAmountBox" style="width:6mm;height:4.5mm; text-align: center;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="RightsGivenToDonatedProperty"/>
													</xsl:call-template>
												</div>
											</div>
<!-- end 3b -->
<!-- start 3c  -->	
	<div style="width:187mm;">
		<div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>
	<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">Is there a restriction limiting the donated property for a particular use?
     <span style="width:2px;"/>
<xsl:call-template name="SetFormLinkInline">
	<xsl:with-param name="TargetNode" select="RstrLimitingDonatedProperty"/>
	</xsl:call-template>
  <span style="width:6mm;"/>
    <span style="letter-spacing:4mm;font-weight:bold;text-align:right">............</span>
	</div>
	<div class="styLNAmountBox" style="width:6mm;height:4.5mm;border-bottom:none; text-align: center;">
<xsl:call-template name="PopulateYesBoxText">
<xsl:with-param name="TargetNode" select="RstrLimitingDonatedProperty"/>
</xsl:call-template>
</div>
	<div class="styLNAmountBox" style="width:6mm;height:4.5mm;border-bottom:none; text-align: center;">
	<xsl:call-template name="PopulateNoBoxText">
<xsl:with-param name="TargetNode" select="RstrLimitingDonatedProperty"/>
													</xsl:call-template>
												</div>
<!-- end 3b -->
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:if>
						</table>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
							<span style="width:20mm;"/>                        
      Cat. No. 62299J
    </div>
						<div style="float:right;">
							<span style="width:10px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">8283</span>  (Rev. 12-2012)
    </div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 8283 (Rev. 12-2012)<span style="width:130mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<div style="width:187mm;border-top:none;">
						<div class="styNameBox" style="font-size:7pt;width:133mm;height:7mm;border-left:none;border-top:none;border-bottom:none;">Name(s) shown on your income tax return
						  <br/>
                          <!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
							  <xsl:choose>
								<xsl:when test="$RtnHdrData/ReturnType='1040'">								  
								  <br/>
								  <xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
								   </xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
								  <xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								  </xsl:call-template>
								  <br/>
								  <xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								  </xsl:call-template>
								</xsl:otherwise>
							  </xsl:choose>
						</div>
						<div class="styNameBox" style="padding-left:2mm;font-size:7pt;width:47mm;height:7mm;border-right:none;border-left:none;border-top:none;border-bottom:none;font-weight:bold;">Identifying number
						  <br/>
						  <br/>
							<span style="font-weight:normal;">
								<!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
									<xsl:choose>
										<xsl:when test="$RtnHdrData/ReturnType='1040'">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
							</span>
						</div>
					</div>
					<!--Section B -->
					<div style="width:187mm;">
						<div class="styBB" style="width:187mm;border-style:solid;border-top-width:1px;border-bottom-width:0px;">
							<span style="font-size:8pt;">
								<b>Section B.  Donated Property Over $5,000 (Except Certain Publicly Traded Securities)&#151;</b>
							</span>List in this section only 
        <br/>
							<span style="width:20mm;"/>items (or groups of similar items) for which you claimed a deduction of more than $5,000 per item or group (except 
        <br/>
							<span style="width:20mm;"/>contributions of certain publicly traded securities reported in Section A). An appraisal is generally required for property listed 
        <br/>
							<span style="width:20mm;"/>in Section B (see instructions).

      </div>

						<!-- Section B Part I -->
						<div class="styBB" style="width:187mm;border-top-width:1px;">
							<span class="styPartName" style="width:16mm;">Part I</span>
							<span style="font-family:verdana;font-size:8pt;font-weight:bold;">
								<span style="width:2mm;"/>Information on Donated Property&#151;</span>
							<span style="font-family:verdana;font-size:8pt;">To be completed by the taxpayer and/or the appraiser.</span>
						</div>
						<div style="width=187mm;">
							<!--span style="width:10mm;float:left;text-align:center;"><b>4</b></span-->
							<span style="text-align:center;width:6mm;font-weight:bold;">4</span>
							<span style="text-align:center;padding-top:.5mm;padding-bottom:.5mm;padding-left:2mm;">Check the box that describes the type of property donated:</span>
						</div>
					</div>
					<!-- Drop 7 modification: These are choice elements; All checkboxes displayed per pdf form but only one should show checked -->
					<!-- Line 4 a, b, c  -->
					<div style="width:187mm;">
						<span style="width:9mm;"/>
			<!-- Line 4 a  -->			
						<span style="width:70mm;height:4.5mm;text-align:left;">a 
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/ArtWorthAtLeast20000Dollars"/>
									<xsl:with-param name="BackupName">Form8283DataArtWorthAtLeast20000Dollars</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/ArtWorthAtLeast20000Dollars"/>
									<xsl:with-param name="BackupName">Form8283DataArtWorthAtLeast20000Dollars</xsl:with-param>
								</xsl:call-template>Art*(contribution of $20,000 or more)
          </label>
						</span>
			<!-- Line 4 b -->			
						<span style="width:67mm;height:4.5mm;text-align:left;">b 
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/QualifiedConservationContri"/>
									<xsl:with-param name="BackupName">Form8283DataQualifiedConservationContri</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/QualifiedConservationContri"/>
									<xsl:with-param name="BackupName">Form8283DataQualifiedConservationContri</xsl:with-param>
								</xsl:call-template>Qualified Conservation Contribution
          </label>
						</span>
					<!-- Line 4 c  -->	
						<span style="width:30mm;height:4.5mm;text-align:left;">c
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/Equipment"/>
									<xsl:with-param name="BackupName">Form8283DataEquipment</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/Equipment"/>
									<xsl:with-param name="BackupName">Form8283DataEquipment</xsl:with-param>
								</xsl:call-template>Equipment
          </label>
						</span>
					</div>
					<!-- Line 4d -->
					<div style="width:187mm;">
						<span style="width:9mm;"/>
						<span style="width:70mm;height:4.5mm;text-align:left;">d 
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/ArtWorthLessThan20000Dollars"/>
									<xsl:with-param name="BackupName">Form8283DataArtWorthLessThan20000Dollars</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/ArtWorthLessThan20000Dollars"/>
									<xsl:with-param name="BackupName">Form8283DataArtWorthLessThan20000Dollars</xsl:with-param>
								</xsl:call-template>Art*(contribution of less than $20,000)
          </label>
						</span>
				<!-- Line 4e -->		
						<span style="width:67mm;height:4.5mm;text-align:left;">e
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/OtherRealEstate"/>
									<xsl:with-param name="BackupName">Form8283DataOtherRealEstate</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/OtherRealEstate"/>
									<xsl:with-param name="BackupName">Form8283DataOtherRealEstate</xsl:with-param>
								</xsl:call-template>Other Real Estate
          </label>
						</span>
						<!-- Line 4f -->
						<span style="width:30mm;height:4.5mm;text-align:left;">f <span style="width:1mm"/> 
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/Securities"/>
									<xsl:with-param name="BackupName">Form8283DataSecurities</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/Securities"/>
									<xsl:with-param name="BackupName">Form8283DataSecurities</xsl:with-param>
								</xsl:call-template>Securities
          </label>
						</span>
					</div>
					<!-- Line 4g -->
					<div style="width:187mm;">
						<span style="width:9mm;"/>
						<span style="width:70mm;height:4.5mm;text-align:left;">g 
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/Collectibles"/>
									<xsl:with-param name="BackupName">Form8283DataCollectibles</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/Collectibles"/>
									<xsl:with-param name="BackupName">Form8283DataCollectibles</xsl:with-param>
								</xsl:call-template>Collectibles**
          </label>
						</span>
					<!-- Line 4h -->	
						<span style="width:67mm;height:4.5mm;text-align:left;">h 
							<input type="checkbox" class="styCkbox" name="Checkbox"> 
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/IntellectualProperty"/>
									<xsl:with-param name="BackupName">Form8283DataIntellectualProperty</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/IntellectualProperty"/>
									<xsl:with-param name="BackupName">Form8283DataIntellectualProperty</xsl:with-param>
								</xsl:call-template>Intellectual Property
          </label>
						</span>
		<!-- Line 4i -->				
						<span style="width:30mm;height:4.5mm;text-align:left;">i <span style="width:1mm"/>
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/VehicleInd"/>
									<xsl:with-param name="BackupName">Form8283DataOtherProperty</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/VehicleInd"/>
									<xsl:with-param name="BackupName">Form8283DataOtherProperty</xsl:with-param>
								</xsl:call-template> Vehicles
          </label>
						</span>
					</div>
					<!-- line 4j -->
							<div style="width:187mm;">
						<span style="width:9mm;"/>
						<span style="width:70mm;height:4.5mm;text-align:left;">j<span style="width:.7mm;"/>
							<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8283Data/OtherProperty"/>
									<xsl:with-param name="BackupName">Form8283DataCollectibles</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm;"/>
							<label>
<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form8283Data/OtherProperty"/>
									<xsl:with-param name="BackupName">Form8283DataCollectibles</xsl:with-param>
								</xsl:call-template>Other
          </label>
						</span>
								</div>
					<!-- End drop 7 modification-->
					<div style="width:187mm;">*Art includes paintings, sculptures, watercolors, prints, drawings, ceramics, antiques, decorative arts, textiles, carpets, silver, rare manuscripts, historical memorabilia and other similar objects.</div>
					<div style="width:187mm;">**Collectibles include coins, stamps, books, gems, jewelry, sports memorabilia, dolls, etc., but not art as defined above.
       
        <div style="width:180mm;">
							<b>Note.  </b>  In certain cases, you must attach a qualified appraisal of the property.  See instructions.
        
<!--     removed from form to reflect pdf form 12-2006  
         If your total art contribution was $20,000 or more, you must attach a complete copy of the signed appraisal. If your deduction for 
     <span style="padding-left:7mm"> any donated property was more than $500,000, you must attach a qualified appraisal of the property. See instructions.</span>
-->
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
						<table cellspacing="0" Summary="Section B. Part I. Information on Donated Property" style="" class="styTable">
							<thead class="styTableThead">
								<tr>
									<th scope="col" colspan="2"  class="styTableCell" style="width:77mm;text-align:center;font-size:7pt;border-color:black;border-top-width:1px;font-weight:normal;">
										<div class="styGenericDiv" style="text-align:center;width:6mm;font-weight:bold;">5</div>
										<div class="styGenericDiv" style="width:68mm;text-align:center;">
											<b>(a)</b>
											<span style="width:4px;"/>Description of donated property (if you need more space, attach a separate statement)</div>
									</th>
									<th scope="col" class="styTableCell" style="width:70mm;text-align:center;font-size:7pt;border-color:black;border-top-width:1px;font-weight:normal;">
										<b>(b)</b>
										<span style="width:1px;"/>If tangible property was donated, give a brief summary of the overall physical condition of the property at the time of the gift</th>
									<th scope="col" class="styTableCell" style="width:40mm;text-align:center;font-size:7pt;border-color:black;border-right:none;border-top-width:1px;font-weight:normal;">
										<b>(c)</b>
										<span style="width:1px;"/>Appraised fair market value</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- If the Print parameter is not set to be Separated, or there are less elements than the container height (5), execute -->
								<xsl:if test="($Print != $Separated) or (count($Form8283Data/PropertyInformation) &lt;= 4)">
									<xsl:for-each select="$Form8283Data/PropertyInformation">
										<tr>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;vertical-align:middle;">
												<xsl:choose>
													<xsl:when test="PropertyIdentifier">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PropertyIdentifier"/>
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
														<xsl:with-param name="TargetNode" select="DescriptionOfDonatedProperty"/>
													</xsl:call-template>
												</div>
												<div>
<!--													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="VehicleYear"/>
													</xsl:call-template>-->
												</div>
                                            <div style="text-align:bottom;padding-top:0mm;">
                                       			    <span class="styLNLeftNumBox" style="float:left;width:62mm;text-align:bottom;"/>
                                       				<xsl:call-template name="SetFormLinkInline">
                                                      <xsl:with-param name="TargetNode" select="$Form8283Data/PropertyInformation"/>
                                                 </xsl:call-template>
                                       			
                                       			</div>														
												
											</td>
											<td class="styTableCell" style="width:70mm;text-align:left;border-color:black;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PhysicalConditionOfDonatedProp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:40mm;text-align:right;border-color:black;font-size:7pt;border-right:none;padding-top:5mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AppraisedFairMarketValue"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($Form8283Data/PropertyInformation) &lt; 1 or
        (($Print = $Separated) and (count($Form8283Data/PropertyInformation) &gt; 4))">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">A<span class="styTableCellPad"/>
										</td>
										<xsl:choose>
											<xsl:when test="($Print = $Separated) and (count($Form8283Data/PropertyInformation) &gt; 4)">
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
								<xsl:if test="count($Form8283Data/PropertyInformation) &lt; 2 or
        (($Print = $Separated) and (count($Form8283Data/PropertyInformation) &gt; 4))">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">B<span class="styTableCellPad"/>
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
								<xsl:if test="count($Form8283Data/PropertyInformation) &lt; 3 or
        (($Print = $Separated) and (count($Form8283Data/PropertyInformation) &gt; 4))">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">C<span class="styTableCellPad"/>
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
								<xsl:if test="count($Form8283Data/PropertyInformation) &lt; 4 or
        (($Print = $Separated) and (count($Form8283Data/PropertyInformation) &gt; 4))">
									<tr>
										<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">D<span class="styTableCellPad"/>
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
						<div class="styTableContainerForTP3ctn" style="height:27mm" id="TP3ctn">
							<xsl:call-template name="SetInitialState"/>
							<table cellspacing="0" class="styTable" style=" border-bottom: 0px;">
								<thead class="styTableThead">
									<tr>
										<th scope="col" rowspan="2" colspan="2" class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;left-margin:3mm;font-weight:normal;">
											<b>(d)</b>
											<span style="width:1mm;"/>Date acquired by donor (mo., yr)</th>
										<th scope="col" rowspan="2" class="styTableCell" style="width:20mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
											<b>(e)</b>
											<span style="width:1mm;"/>How acquired by donor</th>
										<th scope="col" rowspan="2" class="styTableCell" style="width:35mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
											<b>(f)</b>
											<span style="width:1mm;"/>Donor's cost or adjusted basis</th>
										<th scope="col" rowspan="2" class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
											<b>(g)</b>
											<span style="width:1mm;"/>For bargain sales, enter amount received</th>
										<th scope="col" colspan="2" class="styTableCell" style="left-margin:0mm;width:70mm;text-align:center;font-size:7pt;border-color:black;border-right-width:0px;font-weight:bold;">See instructions</th>
									</tr>
									<tr>
										<th scope="col" class="styTableCell" style="width:35mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
											<b>(h)</b>
											<span style="width:1mm;"/>Amount claimed as a deduction</th>
										<th scope="col" class="styTableCell" style="width:35mm;text-align:center;font-size:7pt;border-color:black;border-right:none;font-weight:normal;">
											<b>(i)</b>
											<span style="width:1mm;"/>Average trading price of securities</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="($Print != $Separated) or (count($Form8283Data/PropertyInformation) &lt;= 4)">
										<xsl:for-each select="$Form8283Data/PropertyInformation">
											<tr>
												<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">
													<xsl:choose>
														<xsl:when test="PropertyIdentifier">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="PropertyIdentifier"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:4px;float:center;"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCell" style="width:23mm;text-align:center;font-size:7pt;border-color:black;">
													<xsl:choose>
														<xsl:when test="DateAcquiredByDonor">
															<span style="width:3px;float:left;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="DateAcquiredByDonor"/>
																</xsl:call-template>
															</span>
															<xsl:choose>
																<xsl:when test="DateAcquiredByDonor = 'VARIOUS' ">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="DateAcquiredByDonor"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:call-template name="PopulateMonth">
																		<xsl:with-param name="TargetNode" select="DateAcquiredByDonor"/>
																	</xsl:call-template>-<xsl:call-template name="PopulateYear">
																		<xsl:with-param name="TargetNode" select="DateAcquiredByDonor"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:when>
														<xsl:otherwise>  </xsl:otherwise>
													</xsl:choose>
													<span style="width:2px;"/>
													<!-- Tags are pushed up against the hyphen to prevent spaces from getting between the hyphen and numbers -Kevin Chang -->
												</td>
												<td class="styTableCell" style="text-align:left;width:20mm;font-size:7pt;border-color:black;">
													<span style="width:3px;float:left;">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="HowAcquiredByDonor"/>
														</xsl:call-template>
													</span>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="HowAcquiredByDonor"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:35mm;text-align:right;font-size:7pt;border-color:black;">
													<span style="float:left;">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="DonorsCostOrAdjustedBasis"/>
														</xsl:call-template>
													</span>
													<span style="float:right;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="DonorsCostOrAdjustedBasis"/>
														</xsl:call-template>
													</span>
												</td>
												<td class="styTableCell" style="width:30mm;text-align:right;font-size:7pt;border-color:black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="BargainSalesAmountReceived"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:35mm;text-align:right;font-size:7pt;border-color:black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AmountClaimedAsADeduction"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:35mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AvgTradingPriceOfSecurities"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="count($Form8283Data/PropertyInformation) &lt; 1 or
        (($Print = $Separated) and (count($Form8283Data/PropertyInformation) &gt; 4))">
										<tr>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">A<span class="styTableCellPad"/>
											</td>
											<xsl:choose>
												<xsl:when test="($Print = $Separated) and (count($Form8283Data/PropertyInformation) &gt; 4)">
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
									<xsl:if test="count($Form8283Data/PropertyInformation) &lt; 2 or
        (($Print = $Separated) and (count($Form8283Data/PropertyInformation) &gt; 4))">
										<tr>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">B<span class="styTableCellPad"/>
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
									<xsl:if test="count($Form8283Data/PropertyInformation) &lt; 3 or
        (($Print = $Separated) and (count($Form8283Data/PropertyInformation) &gt; 4))">
										<tr>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">C<span class="styTableCellPad"/>
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
									<xsl:if test="count($Form8283Data/PropertyInformation) &lt; 4 or
        (($Print = $Separated) and (count($Form8283Data/PropertyInformation) &gt; 4))">
										<tr>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">D<span class="styTableCellPad"/>
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
					<!-- Section B part II  Taxpayer (Donor) Statement-->
					<div class="styBB" style="width:187mm;border-top-width:0px">
						<span class="styPartName" style="width:16mm;">Part II</span>
						<span style="font-family:verdana;font-size:8pt;font-weight:bold;">
							<span style="width:2mm;"/>Taxpayer (Donor) Statement&#151;</span>
						<span style="font-family:verdana;font-size:8pt;">List each item included in Part I above that the appraisal identifies as<br/>
        <span style="width:19mm;"/>having a value of $500 or less. See instructions.</span>
					</div>
					<div style="width:187mm;"/>
					<div style="width:187mm;">
						<div style="float:left;">I declare that the following item(s) included in Part I above has to the best of my knowledge and belief an appraised value of not more than </div>
						<div style="width:138mm;float:left;" class="styGenericDiv">$500 (per item). Enter identifying letter from Part I and describe the specific item. See instructions.<span style="width:2mm;"/>
							<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
						</div>
						<div style="width:49mm;border-bottom:1 solid black;padding-left:1mm;float:right;clear:none;" class="styGenericDiv">
							<xsl:if test="($Print != $Separated) or ( ($Print = $Separated) and (count($Form8283Data/PropertyIdLetterAndDescription) &lt;= 1) )">
								<xsl:for-each select="$Form8283Data/PropertyIdLetterAndDescription">
									<span style="width:8mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PropertyIdentifier"/>
										</xsl:call-template>
									</span>
									<span style="width:39mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PropertyItemDescription"/>
										</xsl:call-template>
									</span>
									<br/>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="($Print = $Separated) and (count($Form8283Data/PropertyIdLetterAndDescription) &gt; 1)">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$Form8283Data/PropertyIdLetterAndDescription"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div style="width:187mm;"/>
					<div class="styBB" style="width:187mm;">Signature of taxpayer (donor)<span style="width:2mm;"/>
						<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
						<span style="width:105mm;"/>Date<span style="width:2mm;"/>
						<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
					</div><br/><br/><br/><br/>
					<div class="styBB" style="width:187mm;border-top-width:0px">
						<span class="styPartName" style="width:16mm;">Part III</span>
						<span style="font-family:verdana;font-size:8pt;font-weight:bold;">
							<span style="width:2mm;"/>Declaration of Appraiser</span>
					</div>
					<div style="width:187mm;">
      I declare that I am not the donor, the donee, a party to the transaction in which the donor acquired the property, employed by, or related to any of the foregoing persons, or married to any person who is related to any of the foregoing persons. And, if regularly used by the donor, donee, or party to the transaction, I performed the majority of my appraisals during my tax year for other persons.
        <span style="width:187mm;"/>
      Also, I declare that I perform appraisals on a regular basis; and that because of my qualifications as described in the appraisal, I am qualified to make appraisals of the type of property being valued. I certify that the appraisal fees were not based on a percentage of the appraised property value. Furthermore, I understand that a false or fraudulent overstatement of the property value as described in the qualified appraisal or this Form 8283 may subject me to the penalty under section 6701(a) (aiding and abetting the understatement of tax liability).  In addition, I understand that I may be subject to a penalty under section 6695A if I know, or reasonably should know, that my appraisal is to be used in connection with a return or claim for refund and a
substantial or gross valuation misstatement results from my appraisal.  I affirm that I have not been barred from presenting evidence or testimony by the Office of Professional Responsibility.
    </div>
					<div style="width:187mm;"/>
					<div class="styBB" style="width:187mm;">
						<span class="styIRS8283SignatureBox" style="width:10mm;font-size:9pt;font-weight:bold;border-bottom-width:0px;">Sign Here</span>
						<span style="width:6mm;"/>
						<span class="styIRS8283SignatureBox" style="width:90mm;border-right-width:0px;
            padding-left: 2mm;border-bottom-width:0px;">Signature            
            <span style="width:1mm;"/>
							<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/><span style="width:1mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserName/PersonFirstName"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserName/PersonLastName"/>
							</xsl:call-template>
						</span>
						<span class="styIRS8283SignatureBox" style="width:45mm;border-right-width:0px;border-bottom-width:0px;">
            Title<span style="width:1mm;"/>
							<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/><span style="width:1mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserTitle"/>
							</xsl:call-template>
						</span>
						<span class="styIRS8283SignatureBox" style="width:35mm;border-right-width:0px;border-bottom-width:0px;">
        Date <span style="width:1mm;"/>
							<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/><span style="width:1mm;"/>
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserDateSigned"/>
							</xsl:call-template>
						</span>
					</div>
					<div style="width:187mm;border-top-width:1px">
						<div class="styNameBox" style="font-family:Arial;font-size:7pt;width:135mm;height:6mm">Business address (including room or suite no.)
        <div>
								<choice>
									<when test="$Form8283Data/USAddressOfAppraiser">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/USAddressOfAppraiser/AddressLine1"/>
										</xsl:call-template>
										<div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8283Data/USAddressOfAppraiser/AddressLine2"/>
											</xsl:call-template>
										</div>
									</when>
									<Otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/ForeignAddressOfAppraiser/AddressLine1"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/ForeignAddressOfAppraiser/AddressLine2"/>
										</xsl:call-template>
									</Otherwise>
								</choice>
							</div>
						</div>
						<div class="styEINBox" style="font-family:Arial;font-size:7pt;width:47mm;padding-left: 2mm;">
							<b>Identifying number</b><br/><br/>
							<div style="padding-top:2.8mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8283Data/AppraiserIdentifyingNumber"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px">
						<div class="styNameBox" style="font-family:Arial;font-size:7pt;width:187mm;height:8mm;border-right-width:0px;">City or town, state, and ZIP code
        <div>
								<choice>
									<when test="$Form8283Data/USAddressOfAppraiser">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/USAddressOfAppraiser/City"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/USAddressOfAppraiser/State"/>
										</xsl:call-template>
											<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/USAddressOfAppraiser/ZIPCode"/>
										</xsl:call-template>
									</when>
									<Otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/ForeignAddressOfAppraiser/City"/>
										</xsl:call-template><span style="width:1mm;"/> 
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/ForeignAddressOfAppraiser/ProvinceOrState"/>
										</xsl:call-template><span style="width:1mm;"/>
		 										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/ForeignAddressOfAppraiser/Country"/>
										</xsl:call-template> <span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8283Data/ForeignAddressOfAppraiser/PostalCode"/>
										</xsl:call-template>
									</Otherwise>
								</choice>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:0px">
						<span class="styPartName" style="width:16mm;">Part IV</span>
						<span style="font-family:verdana;font-size:8pt;font-weight:bold;">
							<span style="width:2mm;"/>Donee Acknowledgment&#151;</span>
						<span style="font-family:verdana;font-size:8pt;">To be completed by the charitable organization.</span>
					</div>
					<div style="width:187mm;">This charitable organization acknowledges that it is a qualified organization under section  170(c) and that it received the donated property as described in Section B, Part I, above on the following date<span style="width:2mm;"/>
						<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
						<!-- A straight Line -->
						<span style="width:75mm;border-bottom:solid 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8283Data/DateReceived"/>
							</xsl:call-template>
						</span>
					</div>
					<br/>
					<div style="width:187mm;">Furthermore, this organization affirms that in the event it sells, exchanges, or otherwise disposes of the property described in Section B, Part I (or any portion thereof) within 3 years after the date of receipt, it will file <b>Form 8282,</b> Donee Information Return, with the IRS and give the donor a copy of that form. This acknowledgment does not represent agreement with the claimed fair market value.</div>
					<br/>
					<div style="width:187mm;border-top-width:1px;">
						<!--  <div style="width:187mm;">-->
						<div class="styLNDesc" style="width:179mm;height:4.0mm;">Does the organization intend to use the property for an unrelated use?
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
							<img src="{$ImagePath}/8283_Bullet_Lg.gif" alt="bullet image pointing to right"/>
							<span style="width:1px;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form8283Data/UsePropertyForUnrelatedUse"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" name="Checkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8283Data/UsePropertyForUnrelatedUse"/>
										<xsl:with-param name="BackupName">Form8283DataUsePropertyForUnrelatedUseYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form8283Data/UsePropertyForUnrelatedUse"/>
									<xsl:with-param name="BackupName">Form8283DataUsePropertyForUnrelatedUseYes</xsl:with-param>
								</xsl:call-template>Yes
            </label>
							<span style="width:3mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form8283Data/UsePropertyForUnrelatedUse"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" name="Checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8283Data/UsePropertyForUnrelatedUse"/>
										<xsl:with-param name="BackupName">Form8283DataUsePropertyForUnrelatedUseNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form8283Data/UsePropertyForUnrelatedUse"/>
									<xsl:with-param name="BackupName">Form8283DataUsePropertyForUnrelatedUseNo</xsl:with-param>
								</xsl:call-template>No
          </label>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styNameBox" style="font-face:Arial;font-size:7pt;width:94mm;height:8mm;">Name of charitable organization (donee)<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeName/BusinessNameLine1"/>
							</xsl:call-template>
							<xsl:if test="$Form8283Data/DoneeName/BusinessNameLine2">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8283Data/DoneeName/BusinessNameLine2"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styEINBox" style="font-family:face;font-size:7pt;width:93mm;height:4mm;">
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
						<div class="styNameBox" style="font-family:Arial;font-size:7pt;width:94mm;height:13mm;">Address (number, street, and room or suite no.) <br/>
							<xsl:if test="$Form8283Data/USAddressOfDonee">
								<xsl:if test="$Form8283Data/USAddressOfDonee/AddressLine1!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/USAddressOfDonee/AddressLine1"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8283Data/USAddressOfDonee/AddressLine2!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/USAddressOfDonee/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
							<xsl:if test="$Form8283Data/ForeignAddressOfDonee">
								<xsl:if test="$Form8283Data/ForeignAddressOfDonee/AddressLine1!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/ForeignAddressOfDonee/AddressLine1"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8283Data/ForeignAddressOfDonee/AddressLine2!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/ForeignAddressOfDonee/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
						</div>
						<div class="styEINBox" style="font-family:Arial;font-size:7pt;width:93mm;font-weight:normal;">City or town, state, and ZIP code <br/>
							<br/>
							<xsl:if test="$Form8283Data/USAddressOfDonee">
								<xsl:if test="$Form8283Data/USAddressOfDonee/City!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/USAddressOfDonee/City"/>
									</xsl:call-template>,
            </xsl:if>
								<xsl:if test="$Form8283Data/USAddressOfDonee/State!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/USAddressOfDonee/State"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8283Data/USAddressOfDonee/ZIPCode!=''">
									<span style="width:1mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/USAddressOfDonee/ZIPCode"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
							<xsl:if test="$Form8283Data/ForeignAddressOfDonee">
								<xsl:if test="$Form8283Data/ForeignAddressOfDonee/City!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/ForeignAddressOfDonee/City"/>
									</xsl:call-template>,
            </xsl:if>
								<xsl:if test="$Form8283Data/ForeignAddressOfDonee/ProvinceOrState!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/ForeignAddressOfDonee/ProvinceOrState"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8283Data/ForeignAddressOfDonee/PostalCode!=''">
									<span style="width:1mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/ForeignAddressOfDonee/PostalCode"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8283Data/ForeignAddressOfDonee/Country!=''">
									<span style="width:1mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8283Data/ForeignAddressOfDonee/Country"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px">
						<div class="styNameBox" style="font-family:Arial;font-size:7pt;width:94mm;height:8mm;">Authorized signature</div>
						<div class="styNameBox" style="font-family:Arial;font-size:7pt;width:46mm;height:8mm;">Title</div>
						<div class="styEINBox" style="font-face:Arial;font-size:7pt;width:46mm;height:8mm;font-weight:normal;">Date</div>
					</div>
					<br/>
					<!-- Left over data -->
					<!-- <br/>
  <br class="pageEnd"/> -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
    
      Form <span class="styBoldText" style="font-size:8pt;">8283</span>  (Rev. 12-2012)
    </div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Left Over Table -->
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
							<xsl:with-param name="TargetNode" select="$Form8283Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						
					<xsl:if test="($Print !=$Separated) or (count($Form8283Data/InformationOnDonatedProperty) &lt;= 5)">
								<xsl:for-each select="$Form8283Data/InformationOnDonatedProperty/DonorLineDetail">	
										<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section A Part I Line 1 Columns (c) - (f) Donor line detail</xsl:with-param>
							<xsl:with-param name="TargetNode" select="@scheduleK-1Indicator"/>
							<xsl:with-param name="DescWidth" select="105"/>
						</xsl:call-template>
						</xsl:for-each>
					</xsl:if>	
					</table>
					<!-- END Left Over Table -->
					<!-- If the Print parameter is set to be Separated and there are more elements than the container height (5), execute -->
					<xsl:if test="($Print =$Separated) and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 8283, Section A, Part I - Information on Donated Property:</span>
						<div>
							<table class="styDepTbl" style="width:187mm;" id="donatedPrptyInfo">
								<thead class="styTableThead">
									<tr class="styDepTblHdr">
										<th scope="col" class="styDepTblCell" style="width:7mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;border-right:none;">1</th>
										<th scope="col" class="styDepTblCell" style="width:60mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
											<span class="styBoldText">(a)</span>
											<span style="width:1mm;"/>
											<span style="font-size:7pt;">Name and address of the donee organization</span>
										</th>
										<th scope="col" class="styDepTblCell" style="width:60mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
											<span class="styBoldText">(b)</span>
											<span style="width:1mm;"/>
											<span style="font-size:7pt;">if donated property is a vehicle (see instructions), check the box. Also enter the vehicle identification number (unless Form 1098-C is attached)</span>
										</th>
										<th scope="col" class="styDepTblCell" style="width:60mm;text-align:center;font-size:7pt;border-color:black;border-right:none;font-weight:normal;">
											<span class="styBoldText">(c)</span>
											<span style="width:1mm;"/>Description of donated property (For a donated vehicle, enter the year, mark, model, condition, and mileage unless Form 1098-C is attached</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form8283Data/InformationOnDonatedProperty">
										<tr>
											<!-- Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:3mm;font-size:7pt;font-weight:bold;border-color:black;">
												<xsl:choose>
													<xsl:when test="PropertyIdentifier">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PropertyIdentifier"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
														<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="."/>
														</xsl:call-template>
													</xsl:when>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="width:60mm;text-align:left;font-size:7pt;font-weight:normal;border-color:black;" >
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfDoneeOrganization/BusinessNameLine1"/>
												</xsl:call-template>
												<xsl:if test="NameOfDoneeOrganization/BusinessNameLine2">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfDoneeOrganization/BusinessNameLine2"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="USAddressOfDoneeOrganization">
													<br/>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddressOfDoneeOrganization"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="FrgnAddressOfDoneeOrganization">
													<br/>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="FrgnAddressOfDoneeOrganization"/>
													</xsl:call-template>
												</xsl:if>
											</td>
																			<td class="styTableCell" style="width:60mm;text-align:left;font-size:7pt;font-weight:normal;border-color:black;" >
<span style="width:28mm;"/>
	<input type="checkbox" class="styCkbox">
 <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="DonatedPropertyVehicleInd"/>
                    <xsl:with-param name="BackupName">
                   <!--Separated Mode IRS8283 DonatedPropertyVehicleInd <xsl:number value="position()"/>-->
                   IRS8283 DonatedPropertyVehicleInd
                    </xsl:with-param>
                  </xsl:call-template>
                </input>
           <label>
<xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="DonatedPropertyVehicleInd"/>
                  <xsl:with-param name="BackupName">
                 <!-- IRS8283 DonatedPropertyVehicleInd <xsl:number value="position()"/>-->
               IRS8283 DonatedPropertyVehicleInd 
                  </xsl:with-param>
                </xsl:call-template>

            </label>					
	<br/>
<xsl:call-template name="PopulateText">
	<xsl:with-param name="TargetNode" select="VehicleIdentificationNumber"/>
	</xsl:call-template>
	</td>			
											
											<td class="styTableCell" style="width:60mm;text-align:left;font-size:7pt;font-weight:normal;border-color:black;border-right:none;" >
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DescriptionOfDonatedProperty"/>
												</xsl:call-template>
<!--                <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="VehicleYear"/>
												</xsl:call-template>-->
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
										<th scope="col" colspan="7" class="styDepTblCell" style="width:187mm;text-align:left;font-size:7pt;border-right:none;font-weight:normal;border-top-width:0px;border-color:black;">
											<span class="styBoldText">Note:</span>
											<span style="width:1mm;"/>
											<span style="font-style: italic; font-size: 7pt;">If the amount you claimed as a deduction for an item is $500 or less, you do not have to complete columns (e), (f), and (g).</span>
										</th>
									</tr>
									<tr class="styDepTblHdr">
										<th scope="col" class="styDepTblCell" style="width:7mm;background-color:lightgrey;border-right:1 solid black;border-bottom:1 solid black;">
											<span style="width:1mm;"/>
										</th>
										<th scope="col" class="styDepTblCell" style="width:26mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;padding-top:3mm;">
											<span class="styBoldText">(d)</span>
											<span style="width:1mm;"/>Date of the contribution
            </th>
										<th scope="col" class="styDepTblCell" style="width:26mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;">
											<span class="styBoldText">(e)</span>
											<span style="width:1mm;"/>Date acquired by donor (mo., yr.)
            </th>
										<th scope="col" class="styDepTblCell" style="width:26mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;padding-top:3mm;">
											<span class="styBoldText">(f)</span>
											<span style="width:1mm;"/>How acquired by donor
            </th>
										<th scope="col" class="styDepTblCell" style="width:36mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;padding-top:3mm;">
											<span class="styBoldText">(g)</span>
											<span style="width:1mm;"/>Donor's cost or adjusted basis
            </th>
										<th scope="col" class="styDepTblCell" style="width:36mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;padding-top:3mm;">
											<span class="styBoldText">(h)</span>
											<span style="width:1mm;"/>Fair market value
            </th>
										<th scope="col" class="styDepTblCell" style="width:30mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;border-right:none;">
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
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size: 7pt;font-weight:bold;border-color:black;">
												<xsl:choose>
													<xsl:when test="PropertyIdentifier">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PropertyIdentifier"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:4px;float:center;"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="float:right;width:26mm;text-align:center;font-size: 7pt;font-weight:normal;border-color:black;">
												<!--
            <span style="width:0.1mm;float:left;">
            <xsl:call-template name="LinkToLeftoverDataTableInline">
            <xsl:with-param name="Desc">Section A Part I Line 1 Columns (c) - (f) Donor line detail</xsl:with-param>
           <xsl:with-param name="TargetNode" select="DonorLineDetail/@scheduleK-1Indicator"/>
           <xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
           </xsl:call-template>
           </span>
                -->
												<span style="width:0.1mm;float:left;">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Section A Part I Line 1 Columns (c) - (f) Donor line detail</xsl:with-param>
														<xsl:with-param name="TargetNode" select="DonorLineDetail/@scheduleK-1Indicator"/>
														<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DonorLineDetail/DateOfTheContribution"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:26mm;font-size: 7pt;font-weight:normal;border-color:black;">
												<span style="width:0.1mm;float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonorLineDetail/DateAcquiredByDonor"/>
													</xsl:call-template>
												</span>
												<span style="width:19mm;text-align:center;">
													<xsl:choose>
														<xsl:when test="DonorLineDetail/DateAcquiredByDonor = 'VARIOUS' ">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DonorLineDetail/DateAcquiredByDonor"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateMonth">
																<xsl:with-param name="TargetNode" select="DonorLineDetail/DateAcquiredByDonor"/>
															</xsl:call-template>-<xsl:call-template name="PopulateYear">
																<xsl:with-param name="TargetNode" select="DonorLineDetail/DateAcquiredByDonor"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
												<span style="width:2px;"/>
												<!-- Tags are pushed up against the hyphen to prevent spaces from getting between the hyphen and numbers -Kevin Chang -->
											</td>
											<td class="styTableCell" style="width:26mm;text-align:left;font-size: 7pt;font-weight:normal;border-color:black;">
												<span style="text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DonorLineDetail/HowAcquiredByDonor"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" style="width:36mm;text-align:right;font-size: 7pt;font-weight:normal;border-color:black;">
												<!--span style="width:21.5mm;float:left;text-align:right;"-->
												<div class="styGenericDiv" style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorsCostOrAdjustedBasis"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DonorLineDetail/DonorsCostOrAdjustedBasis"/>
												</xsl:call-template>
												<span style="width:0.1mm;"/>
											</td>
											<td class="styTableCell" style="width:36mm;text-align:right;font-size: 7pt;font-weight:normal;border-color:black;">
												<div class="styGenericDiv" style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="FairMarketValue"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FairMarketValue"/>
												</xsl:call-template>
												<span style="width:0.1mm;"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:left;font-size: 7pt;font-weight:normal;border-color:black;border-right:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FairMarketValueMethod"/>
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
					<xsl:if test="($Print =$Separated) and (count($Form8283Data/InformationOnDonatedProperty) &gt; 5)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 8283, Section A, Part II - Partial Interests and Restricted Use Property:</span>
						<xsl:for-each select="$Form8283Data/InformationOnDonatedProperty">
							<br/>
							<table class="styDepTbl" id="othrInfo">
								<tr>
									<td colspan="7" class="styTableCell" style="width:187mm;text-align:left;font-size:7pt;border-right:none;">
										<div class="styDepTblHdr" style="width:187mm;"/>
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftNumBox" style="height:4.5mm;">2a</div>
											<div class="styLNDesc" style="height:4mm;font-weight:normal;">Enter the letter from Part I that identifies the property in which you gave less than an entire interest
              </div>
											<div class="" style="float:right;clear:none;">
												<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
												<span style="width:6px;"/>
												<span style="width:32mm;border-bottom:1 solid black;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PropertyIdentifier"/>
													</xsl:call-template>
												</span>
											</div>
										</div>
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftNumBox" style="height:4.5mm;"/>
											<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">If Part II applies to more than one property, attach a separate statement.</div>
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
													<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
													<span style="width:6px;"/>
													<span style="width:32mm;border-bottom:1 solid black;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TotalDeductionClaimedThisTY"/>
														</xsl:call-template>
													</span>
												</div>
											</div>
										</div>
										<div class="styDepTblRow2" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
											<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">
												<div class="styGenericDiv" style="width:95mm;">
              </div>
												<div class="styGenericDiv" style="padding-left:0mm;width:48mm;">
													<b>(2)</b>
													<span style="width:12px;"/>For any prior tax years
           </div>
												<div class="" style="float:right;">
													<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
													<span style="width:6px;"/>
													<span style="width:32mm;border-bottom:1 solid black;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TotDeductionClaimedAnyPriorTY"/>
														</xsl:call-template>
													</span>
												</div>
											</div>
										</div>
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:8mm;">c</div>
											<div class="styLNDesc" style="width:179mm;height:4.5mm;border-color:black;border-style:solid;border-left:none;border-right:none;border-top:none;border-bottom-width:1px;font-weight:normal;">Name and address of each organization to which any such contribution was made in a prior year (complete only if different from the donee organization above):</div>
										</div>
										<!-- Name of Charitable Organization (Donee) -->
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">
												<span style="width:1mm;"/>
											</div>
											<div style="font-size:6pt;font-weight:normal;">Name of charitable organization (donee)</div>
											<div class="styBB" style="width:180mm;margin-left:4mm;float:left;">
												<xsl:if test="NameOfOrganization/BusinessNameLine1 !=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfOrganization/BusinessNameLine1"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="NameOfOrganization/BusinessNameLine2 !=''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfOrganization/BusinessNameLine2"/>
													</xsl:call-template>
												</xsl:if>
											</div>
										</div>
										<!-- Address of Organization -->
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">
												<span style="width:1mm;"/>
											</div>
											<div style="font-size:6pt;font-weight:normal;">Address (number, street, and room or suite no.)</div>
											<div class="styBB" style="width:180mm;margin-left:4mm;float:left;">
												<xsl:if test="USAddressOfOrganization">
													<xsl:if test="USAddressOfOrganization/AddressLine1!=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddressOfOrganization/AddressLine1"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="USAddressOfOrganization/AddressLine2!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddressOfOrganization/AddressLine2"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
												<xsl:if test="ForeignAddressOfOrganization">
													<xsl:if test="ForeignAddressOfOrganization/AddressLine1!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddressOfOrganization/AddressLine1"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="ForeignAddressOfOrganization/AddressLine2!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddressOfOrganization/AddressLine2"/>
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
											<div style="font-size:6pt;font-weight:normal;">City or town, state, and ZIP code</div>
											<div class="styBB" style="width:180mm;margin-left:4mm;float:left;">
												<xsl:if test="USAddressOfOrganization">
													<xsl:if test="USAddressOfOrganization/City!=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddressOfOrganization/City"/>
														</xsl:call-template>,
            </xsl:if>
													<xsl:if test="USAddressOfOrganization/State!=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddressOfOrganization/State"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="USAddressOfOrganization/ZIPCode!=''">
														<span style="width:1mm;"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddressOfOrganization/ZIPCode"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
												<xsl:if test="ForeignAddressOfOrganization">
													<xsl:if test="ForeignAddressOfOrganization/City!=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddressOfOrganization/City"/>
														</xsl:call-template>,
            </xsl:if>
													<xsl:if test="ForeignAddressOfOrganization/ProvinceOrState!=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddressOfOrganization/ProvinceOrState"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="ForeignAddressOfOrganization/PostalCode!=''">
														<span style="width:1mm;"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddressOfOrganization/PostalCode"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="ForeignAddressOfOrganization/Country!=''">
														<span style="width:1mm;"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddressOfOrganization/Country"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
											</div>
										</div>
										<div class="styDepTblRow2" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">d</div>
											<div class="styLNDesc" style="width:108mm;height:4mm;font-weight:normal;">For tangible property, enter the place where the property is located or kept
												<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/><span style="width:5mm;"/>
											</div>
											<span class="styUnderlineAmount" style="width:71mm;float:right;clear:all;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TangiblePropertyLocation"/>
												</xsl:call-template>
											</span>
										</div>
	<div style="width:187mm;">
	<!--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  -->
											<div class="styLNLeftLtrBox" style="height:4.5mm;">e</div>
											<div class="styLNDesc" style="width:179mm;height:4mm;font-weight:normal;">Name of any person, other than the donee organization, having actual possession of the property
			<img src="{$ImagePath}/8283_Bullet_Sm.gif" alt="bullet image pointing to right"/>
												<span style="width:2mm;"/>
											
												<choice>
														<when test="BusNameOfPersonPossessingProp">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="BusNameOfPersonPossessingProp/BusinessNameLine1"/>
															</xsl:call-template>
															<br/><span style="width:133mm"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="BusNameOfPersonPossessingProp/BusinessNameLine2"/>
															</xsl:call-template>
														<span class="styUnderlineAmount" style="width:47mm;float:right"/>
														</when>
														<Otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select=" NameOfPersonPossessingProperty/BusinessNameLine1"/>
															</xsl:call-template>
															<br/><span style="width:133mm"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select=" NameOfPersonPossessingProperty/BusinessNameLine2"/>
															</xsl:call-template>
														</Otherwise>
													</choice>
														
												</div>
										</div>	
					<div class="styFixedUnderline" style="width:180mm;margin-left:4mm;"/>					
<!-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  -->  																	
										<!-- Line 3a -->
										<div class="styDepTblRow2" style="width:187mm;float:left;">
											<div class="styLNLeftNumBox" style="height:4.5mm;">3a</div>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">Is there a restriction, either temporary or permanent, on the donee's right to use or dispose of the donated </div>
											<div class="styIRS8283LNYesNoBox" style="width:6mm;height:2mm;font-weight:bold;border-top-width:1px;">Yes</div>
											<div class="styIRS8283LNYesNoBox" style="width:6mm;height:2mm;font-weight:bold;border-top-width:1px;">No</div>
										</div>
										<div class="styDepTblRow2" style="width:187mm;float:left;">
											<div class="styLNLeftLtrBox" style="height:4mm;"/>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal">
              property?   
                <xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="RestrictionOnDonatedProperty"/>
												</xsl:call-template>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:20px;">.</span>
												<span class="styBoldText" style="width:8px;">.</span>
											</div>
											<div class="styLNAmountBox" style="width:6mm;height:4.5mm;padding-top:0.5mm;padding-bottom:0mm;font-weight:normal;text-align:center;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="RestrictionOnDonatedProperty"/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="width:6mm;height:4.5mm;padding-top:0.5mm;padding-bottom:0mm;text-align:center;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="RestrictionOnDonatedProperty"/>
												</xsl:call-template>
												<span style="1px;"/>
											</div>
										</div>
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">Did you give to anyone (other than the donee organization or another organization participating with the donee</div>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
										</div>
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">organization in cooperative fundraising) the right to the income from the donated property or to the possession</div>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
										</div>
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">of the property, including the right to vote donated securities, to acquire the property by purchase or otherwise,</div>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;border-bottom-width:1px;"/>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;border-bottom-width:1px;"/>
										</div>
										<div class="styDepTblRow1" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;"> or to designate the person having such income, possession, or right to acquire?
                <xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="RightsGivenToDonatedProperty"/>
												</xsl:call-template>
												<span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
												<span class="styBoldText" style="width:19px;">.</span>
											</div>
											<div class="styLNAmountBox" style="width:6mm;height:4.5mm; text-align: center;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="RightsGivenToDonatedProperty"/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="width:6mm;height:4.5mm; text-align: center;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="RightsGivenToDonatedProperty"/>
												</xsl:call-template>
											</div>
										</div>
										<div class="styDepTblRow2" style="width:187mm;">
											<div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>
											<div class="styLNDesc" style="width:166mm;height:4mm;font-weight:normal;">Is there a restriction limiting the donated property for a particular use?
                <xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="RstrLimitingDonatedProperty"/>
												</xsl:call-template>
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
												<span class="styBoldText" style="width:19px;">.</span>
											</div>
											<div class="styLNAmountBox" style="width:6mm;height:4.5mm;border-bottom:none; text-align: center;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="RstrLimitingDonatedProperty"/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="width:6mm;height:4.5mm;border-bottom:none; text-align: center;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="RstrLimitingDonatedProperty"/>
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
						<span class="styRepeatingDataTitle">Form 8283, Section B, Part I - Information on Donated Property:</span>
						<div>
							<xsl:call-template name="SetInitialState"/>
							<table class="styDepTbl" style="width:187mm;">
								<thead class="styTableThead">
									<tr class="styDepTblHdr">
										<th scope="col" colspan="2" class="styDepTblCell" style="width:77mm;text-align:center;font-size:7pt;border-color:black;border-top-width:1px;font-weight:normal;">
											<div class="styGenericDiv" style="width:6mm;text-align:center;font-weight:bold;">5</div>
											<div class="styGenericDiv" style="width:68mm;text-align:center;">
												<b>(a)</b>
												<span style="width:4px;"/>Description of donated property (if you need more space, attach a separate statement)</div>
										</th>
										<th scope="col" class="styDepTblCell" style="width:70mm;text-align:center;font-size:7pt;border-color:black;border-top-width:1px;font-weight:normal;">
											<b>(b)</b>
											<span style="width:1px;"/>If tangible property was donated, give a brief summary of the overall physical condition at the time of the gift</th>
										<th scope="col" class="styDepTblCell" style="width:40mm;text-align:center;font-size:7pt;border-color:black;border-right:none;border-top-width:1px;font-weight:normal;">
											<b>(c)</b>
											<span style="width:1px;"/>Appraised fair market value</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form8283Data/PropertyInformation">
										<tr>
											<!-- Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCell" style="width:7mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">
												<xsl:choose>
													<xsl:when test="PropertyIdentifier">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PropertyIdentifier"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:4px;float:center;"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="width:68mm;text-align:left;border-color:black;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DescriptionOfDonatedProperty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:70mm;text-align:left;border-color:black;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PhysicalConditionOfDonatedProp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:40mm;text-align:right;border-color:black;font-size:7pt;border-right:none;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AppraisedFairMarketValue"/>
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
										<th scope="col" rowspan="2" colspan="2" class="styDepTblCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;left-margin:3mm;font-weight:normal;">
											<b>(d)</b>
											<span style="width:1mm;"/>Date acquired by donor (mo., yr)</th>
										<th scope="col" rowspan="2" class="styDepTblCell" style="width:20mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
											<b>(e)</b>
											<span style="width:1mm;"/>How acquired by donor</th>
										<th scope="col" rowspan="2" class="styDepTblCell" style="width:36mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
											<b>(f)</b>
											<span style="width:1mm;"/>Donor's cost or adjusted basis</th>
										<th scope="col" rowspan="2" class="styDepTblCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
											<b>(g)</b>
											<span style="width:1mm;"/>For bargain sales, enter amount received</th>
										<th scope="col" colspan="2" class="styDepTblCell" style="left-margin:0mm;width:64mm;text-align:center;font-size:7pt;border-color:black;border-right-width:0px;font-weight:bold;">See instructions</th>
									</tr>
									<tr class="styDepTblHdr">
										<th scope="col" class="styDepTblCell" style="width:32mm;text-align:center;font-size:7pt;border-color:black;font-weight:normal;">
											<b>(h)</b>
											<span style="width:1mm;"/>Amount claimed as a deduction</th>
										<th scope="col" class="styDepTblCell" style="width:32mm;text-align:center;font-size:7pt;border-color:black;border-right:none;font-weight:normal;">
											<b>(i)</b>
											<span style="width:1mm;"/>Average trading price of securities</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form8283Data/PropertyInformation">
										<tr>
											<!-- Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCell" style="width:8mm;text-align:left;padding-left:2mm;font-size:7pt;border-color:black;font-weight:bold;">
												<xsl:choose>
													<xsl:when test="PropertyIdentifier">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PropertyIdentifier"/>
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
														<xsl:with-param name="TargetNode" select="DateAcquiredByDonor"/>
													</xsl:call-template>
												</span>
												<xsl:choose>
													<xsl:when test="DateAcquiredByDonor = 'VARIOUS' ">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DateAcquiredByDonor"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateMonth">
															<xsl:with-param name="TargetNode" select="DateAcquiredByDonor"/>
														</xsl:call-template>-<xsl:call-template name="PopulateYear">
															<xsl:with-param name="TargetNode" select="DateAcquiredByDonor"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<span style="width:2px;"/>
												<!-- Tags are pushed up against the hyphen to prevent spaces from getting between the hyphen and numbers -Kevin Chang -->
											</td>
											<td class="styTableCell" style="text-align:left;width:20mm;font-size:7pt;border-color:black;">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="HowAcquiredByDonor"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="HowAcquiredByDonor"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:36mm;text-align:right;font-size:7pt;border-color:black;">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DonorsCostOrAdjustedBasis"/>
													</xsl:call-template>
												</span>
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DonorsCostOrAdjustedBasis"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;font-size:7pt;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BargainSalesAmountReceived"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:32mm;text-align:right;font-size:7pt;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AmountClaimedAsADeduction"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:32mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AvgTradingPriceOfSecurities"/>
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
					<xsl:if test="($Print = $Separated) and (count($Form8283Data/PropertyIdLetterAndDescription) &gt; 1)">
						<br/>
						<span class="styRepeatingDataTitle">Form 8283, Section B, Part II - Taxpayer (Donor) Statement:</span>
						<table class="styDepTbl" style="width:187mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width:70mm;font-size:7pt;border-color:black;border-right-width:1px;">Property Identifying Letter</th>
									<th scope="col" class="styDepTblCell" style="width:118mm;font-size:7pt;border-color:black;border-right-width:0px;">Description</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8283Data/PropertyIdLetterAndDescription">
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
												<xsl:with-param name="TargetNode" select="PropertyIdentifier"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:left;font-size:7pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyItemDescription"/>
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
