<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8863Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8863Data" select="$RtnDoc/IRS8863"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8863Data)"/>
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
				<meta name="Description" content="IRS Form 8863"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8863Style"/>
						<xsl:call-template name="AddOnStyle"/>
				</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8863">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:20mm;">
      Form 
            <span class="styFormNumber">8863</span>
							<br/>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service (99)</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:20mm;">
							<div class="styMainTitle" style="height:7mm;padding-top:1mm;">Education Credits
            (American Opportunity, Hope, and<br />
            Lifetime Learning Credits)
							</div>
							<div class="styFBT" stype="font-size:7pt;height:6mm;padding-top:0mm;">
								<img src="{$ImagePath}/8863_Bullet.gif" alt="MediumBullet"/>  See separate instructions to find out if you are eligible to take the credits.<br/>
								<img src="{$ImagePath}/8863_Bullet.gif" alt="MediumBullet"/> Attach to Form 1040 or Form 1040A.</div>
						</div>
						<div class="styTYBox" style="width:31mm; height:20mm">
							<div style="padding-top:1mm;border-bottom:1 solid black">OMB No. 1545-0074</div>
							<div class="styTaxYear" style="font-size:21pt;">20<span class="styTYColor" style="font-size:21pt">09</span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No. <b style="font-size:8pt">50</b>
							</div>
						</div>
					</div>
	<!-- Name(s) shown on return -->
<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:140mm; height:9mm;">
                    Name(s) shown on return<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name"/>
							</xsl:call-template>
							<br/>
						</div>
                              <b>Your social security number</b><br/>
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
						</xsl:call-template>
					</div>
					<!--Caution-->
					<div class="styBB" style="width:187mm;font-size:8pt;float:left;clear:none;">
					<div class="styPartDesc" style="font-weight:normal;font-size:8pt;width:11mm;padding-left:0mm;height:4mm;float:left;clear:none;" >
					<b>Caution:</b></div>
					<div class="styPartDesc" style="width:173mm;padding-left:0mm;height:4mm;font-weight:normal;padding-left:3mm;font-size:7pt;" >
				<i>
				You <b>cannot</b> take both an education credit and the tuition and fees deduction
				(see Form 8917) for the <b>same student </b>for the same year.</i>
</div>
				</div>
<!-- Part l -->
<!-- Part I - Header -->
<div class="styBB" style="width:187mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;">
						<span class="styPartName" style="width:11mm;font-size:13;">Part l</span>
						<span style="width:172mm;font-weight:normal;font-size:8pt;" class="styPartDesc">
							<span  style="font-size:12.5;"><b>American Opportunity Credit. </b></span>
							<br/>
							Use Part II if you are claiming the Hope credit for a student attending school in a Midwestern
							disaster area and elect to waive the computation method in this part for all students. <br/><b>  Caution: </b>
								<i>You <b>cannot</b> take the American opportunity credit for more than <b>4 </b>tax years for the <b>same student.</b>
							</i>
						</span>
						<!-- Table expand/collapse toggle button -->
						<div class="styGenericDiv" style="float:right;width:2mm;padding-top:11mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8863Data/AmericanOpportunityCreditGroup"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'AmericanOpportunityCreditGroup' "/>
							</xsl:call-template>
						</div>
					</div>
		<!--Student's Name-->
		<div class="styTableContainer" style="height:31.5mm;" id="AmericanOpportunityCreditGroup">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" style="" summary="Table displaying Hope Credit Group " name="HCGtable" id="HCGtable">
							<thead class="styTableThead">
								<tr>
			<th class="styTableCellHeader" style="width:49mm;border-color:black;border-left-width:0px;font-size:7pt;text-align:none;
" scope="col">
			<div class="styLNLeftNumBox" style="width:3mm;font-size:7pt;height:7mm;padding-top:0mm;padding-left:2.25mm;">1
                 </div>
            <span style="width:6mm;"></span>(a)<span class="styNormalText" style=""> Student's name<br/>      
            <span style="width:8mm;"></span>(as shown on page 1<br/>   
            <span style="width:10mm;"></span>of your tax return)<br/>
           <span style="width:10mm;"> </span>First name<br/>
           <span style="width:10mm;"> </span>------------<br/>
           <span style="width:10mm;"> </span>Last Name</span>
									</th>
		<th class="styTableCellHeader" style="text-align:center;width:20mm;border-color:black;font-size:7pt;padding-top:3mm;
                 " scope="col">
            (b)<span class="styNormalText"> Student's<br/>social security<br/>number (as<br/>shown on page<br/> 1 of your tax return)</span>
									</th>
		<th class="styTableCellHeader" style="text-align:center;width:29.8mm;border-color:black;font-size:7pt;" scope="col">
            (c)<span class="styNormalText"> Qualified <br/>expenses (see<br/>instructions). <b>Do<br/>not</b> enter more<br/>than $4,000 for<br/>each student.</span>
									</th>
		<th class="styTableCellHeader" style="width:29.8mm;border-color:black;font-size:7pt;padding-top:3mm;" scope="col">
            (d)<span class="styNormalText"> Subtract $2,000<br/>
			from the amount in<br/>column (c). If zero<br/> or less, enter -0- </span>
									</th>
		<th class="styTableCellHeader" style="width:29.8mm;border-color:black;font-size:7pt;" scope="col">
            (e)<span class="styNormalText"> Multiply the<br/>amount in column<br/>(d) by 25% (.25)</span>
									</th>
		<th class="styTableCellHeader" style="width:30mm;border-color:black;font-size:7pt;border-right-width:0px;" scope="col">
            (f)<span class="styNormalText" style="font-size:7pt;"> If column (d) is zero, enter the amount from column (c). Otherwise, add $2,000 to the amount in column (e).</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
				<!-- print logic -->
					<xsl:for-each select="$Form8863Data/AmericanOpportunityCreditGroup">
									<xsl:if test="($Print != $Separated) or (count($Form8863Data/AmericanOpportunityCreditGroup) &lt;= 5) ">
										<tr>
											<td class="styTableCellSmall" style="text-align:left;font-size:8pt;border-color:black;border-left-width:0px;width:48mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AmerOppStudentName/PersonFirstName"/>
												</xsl:call-template>
											<br/>-----------------------------<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AmerOppStudentName/PersonLastName"/>
												</xsl:call-template>
											<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AmerOppStudentNameControl"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size:8pt;border-color:black;width:18mm;text-align:center;">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="AmerOppStudentSSN"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size:8pt;border-color:black;width:31mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AmerOppQualifiedExpensesAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size:8pt;border-color:black;width:31mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AmerOppQlfyExpnssLessAllwblAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size:8pt;border-color:black;width:31mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AmerOppAllwblExpnssTimesPctAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="font-size:8pt;border-color:black;border-right-width:0px;width:30mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AmerOppCreditNetCalcExpnssAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
			<xsl:if test="(count($Form8863Data/AmericanOpportunityCreditGroup)&lt; 1)or ((count($Form8863Data/AmericanOpportunityCreditGroup) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:49mm;text-align:left;font-weight:normal;height:8mm;">
											<span class="styBoldText"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form8863Data/AmericanOpportunityCreditGroup"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:center;font-size:7pt;font-weight:normal;height:8mm;width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:left;font-size:7pt;font-weight:normal;height:8mm;width:29.8mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:left;font-size:7pt;font-weight:normal;height:8mm;width:29.8mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:left;font-size:7pt;font-weight:normal;height:8mm;width:29.8mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:left;font-size:7pt;font-weight:normal;height:8mm;width:30mm">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							<xsl:if test="count($Form8863Data/AmericanOpportunityCreditGroup)&lt; 2  or ((count($Form8863Data/AmericanOpportunityCreditGroup) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:49mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29.8mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29.8mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29.8mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							<xsl:if test="count($Form8863Data/AmericanOpportunityCreditGroup)&lt; 3  or ((count($Form8863Data/AmericanOpportunityCreditGroup) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:49mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29.8mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29.8mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29.8mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							<xsl:if test="count($Form8863Data/AmericanOpportunityCreditGroup)&lt; 4  or ((count($Form8863Data/AmericanOpportunityCreditGroup) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:49mm;">
											<span class="styTableCellPad"/>
										</td>
										
										<td class="styTableCell" style="width:20mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29.8mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29.8mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29.8mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							<xsl:if test="count($Form8863Data/AmericanOpportunityCreditGroup)&lt; 5  or ((count($Form8863Data/AmericanOpportunityCreditGroup) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:49mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:20mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29.8mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29.8mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29.8mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form8863Data/AmericanOpportunityCreditGroup"/>
							<xsl:with-param name="containerHeight" select="2"/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerID" select=" 'AmericanOpportunityCreditGroup' "/>
						</xsl:call-template>
					</div>

<!--line 2-->
<div class="styBB" style="width:187mm;">
	<div class="styLNLeftNumBoxSD" style="font-size:7pt;height:8mm;padding-left: 2.25mm">2
        </div>
		<div class="styLNDesc" style="font-size:7pt;width:141mm;height:8mm;">
		<b>Tentative American opportunity credit.</b>  Add the amounts on line 1, column (f). Skip Part II if line 2 is <br/>
more than zero. If you are taking the lifetime learning credit for a different student, go to Part III; <br />otherwise, go to Part IV
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
				<img src="{$ImagePath}/8863_Bullet.gif" alt="MediumBullet"/>
						</div>
		<div class="styLNRightNumBox" style="font-size:7pt;height:11mm;padding-top:7mm; width:7.1mm; text-align:center; border-bottom-width:0px; ">2</div>
						<div class="styLNAmountBox" style="width:30mm;height:11mm;padding-top:7mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/TentativeAmerOppCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
	<!-- Part lI-->
<!-- Part II - Header -->
<div class="styBB" style="width:187mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;">
						<div class="styPartName" style="width:12mm;font-size:13;height:4mm;">Part ll</div>
						<div  class="styPartDesc" style="width:175mm;font-weight:normal;font-size:8pt;height:4mm;">
							<span  style="font-size:12.5;"><b>Hope Credit.</b></span>
							<br/>
							Use this part if you are claming the Hope credit for a student attending a school in a Midwestern 
							disaster area and elect to waive the computation method in Part I for all students. 
									</div>
						<div  class="styPartDesc" style="width:176mm;font-weight:normal;font-size:8pt;padding-left:14.5mm;height:4mm;">		
							<b>Caution:</b>
						<i>	You <b>cannot</b> take the Hope credit for more than <b>2</b> tax years for the <b>same student.</b>
							</i>
							</div>
						<!-- Table expand/collapse toggle button -->
						<div style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8863Data/HopeCreditMWDAGroup"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'HopeCreditMWDAGroup' "/>
							</xsl:call-template>
							</div>
					</div>
		<!--Student's Name-->
		<div class="styTableContainer" style="height:31.5mm;" id="HopeCreditMWDAGroup">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" style="" summary="Table displaying Hope Credit Group " name="HCGtable" id="HCGtable">
							<thead class="styTableThead">
								<tr>
			<th class="styTableCellHeader" style="width:40mm;border-color:black;border-left-width:0px;font-size:7pt;text-align:none;
" scope="col">
			<div class="styLNLeftNumBox" style="width:3mm;font-size:7pt;height:7mm;padding-top:0mm;padding-left:2.25mm;">3
                 </div>
            (a)<span class="styNormalText" style="text-align: center;"> Student's name<br/> (as shown on page 1<br/>of your tax return)<br/>
             <span style="width:10mm;"> </span>First name<br/>
           <span style="width:10mm;"> </span>------------<br/>
           <span style="width:10mm;"> </span>Last Name</span>
									</th>
									<th class="styTableCellHeader" style="text-align:center;width:30mm;border-color:black;font-size:7pt;padding-top:3mm;
                 " scope="col">
            (b)<span class="styNormalText"> Student's<br/>social security<br/>number (as<br/>shown on page 1<br/>of your tax return)</span>
									</th>
									<th class="styTableCellHeader" style="text-align:center;width:30mm;border-color:black;font-size:7pt;" scope="col">
            (c)<span class="styNormalText"> Qualified <br/>expenses (see<br/>instructions). <b>Do<br/>not</b> enter more<br/>than $2,400* for<br/>each student.</span>
									</th>
									<th class="styTableCellHeader" style="width:30mm;border-color:black;font-size:7pt;padding-top:3mm;" scope="col">
            (d)<span class="styNormalText"> Enter the<br/>
											<b>smaller</b> of the<br/>amount in<br/>column (c) or
            $1,200**<br/>
										</span>
									</th>
									<th class="styTableCellHeader" style="width:30mm;border-color:black;font-size:7pt;" scope="col">
            (e)<span class="styNormalText"> Add <br/>column (c) and<br/>column (d)</span>
									</th>
									<th class="styTableCellHeader" style="width:30mm;border-color:black;font-size:7pt;border-right-width:0px;" scope="col">
            (f)<span class="styNormalText" style="font-size:7pt;"> Enter one-half<br/>of the amount in<br/>column (e)           </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
				<!-- print logic -->
					<xsl:for-each select="$Form8863Data/HopeCreditMWDAGroup">
									<xsl:if test="($Print != $Separated) or (count($Form8863Data/HopeCreditMWDAGroup) &lt;= 5) ">
										<tr>
										<!--column 3a-->
											<td class="styTableCellSmall" style="text-align:left;font-size:8pt;border-color:black;border-left-width:0px;width:45mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="HopeStudentNameMWDA/PersonFirstName"/>
												</xsl:call-template>
												<br/>--------------------------<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="HopeStudentNameMWDA/PersonLastName"/>
												</xsl:call-template>
												<br/>
											<span style="width:2mm;"></span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="HopeStudentNameControlMWDA"/>
												</xsl:call-template>
											</td>
											<!--column 3b-->
											<td class="styTableCellSmall" style="font-size:8pt;border-color:black;width:30mm;text-align:center;">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="HopeStudentSSNMWDA"/>
												</xsl:call-template>
											</td>
											<!--column 3c-->
											<td class="styTableCellSmall" style="font-size:8pt;border-color:black;width:30mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="HopeQualifiedExpensesMWDAAmt"/>
												</xsl:call-template>
											</td>
											<!--column 3d-->
											<td class="styTableCellSmall" style="font-size:8pt;border-color:black;width:30mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="QlfyExpnssOrQlfyExpnssMWDAAmt"/>
												</xsl:call-template>
											</td>
											<!--column 3e-->
											<td class="styTableCellSmall" style="font-size:8pt;border-color:black;border-right-width:1px;width:30mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SumOfQualifiedExpensesMWDAAmt"/>
												</xsl:call-template>
											</td>
											<!--column 3f-->
											<td class="styTableCellSmall" style="font-size:8pt;border-color:black;border-right-width:0px;width:30mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="HalfSumOfQlfyExpnssMWDAAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
			<xsl:if test="(count($Form8863Data/HopeCreditMWDAGroup)&lt; 1)or ((count($Form8863Data/HopeCreditMWDAGroup) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:40mm;text-align:left;">
											<span class="styBoldText"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form8863Data/HopeCreditMWDAGroup"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:left;font-size:7pt;font-weight:normal;height:8mm;width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:left;font-size:7pt;font-weight:normal;height:8mm;width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:left;font-size:7pt;font-weight:normal;height:8mm;width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:left;font-size:7pt;font-weight:normal;height:8mm;width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:left;font-size:7pt;font-weight:normal;height:8mm;width:30mm">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
<xsl:if test="count($Form8863Data/HopeCreditMWDAGroup)&lt; 2  or ((count($Form8863Data/HopeCreditMWDAGroup) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							<xsl:if test="count($Form8863Data/HopeCreditMWDAGroup)&lt; 3  or ((count($Form8863Data/HopeCreditMWDAGroup) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							<xsl:if test="count($Form8863Data/HopeCreditMWDAGroup)&lt; 4  or ((count($Form8863Data/HopeCreditMWDAGroup) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							<xsl:if test="count($Form8863Data/HopeCreditMWDAGroup)&lt; 5  or ((count($Form8863Data/HopeCreditMWDAGroup) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm;">
										<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form8863Data/HopeCreditMWDAGroup"/>
							<xsl:with-param name="containerHeight" select="2"/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerID" select=" 'HopeCreditMWDAGroup' "/>
						</xsl:call-template>
					</div>
<!--*note-->
<div class="styBB" style="width:187mm;border-bottom-width:0px;float:left;clear:none">
	<div class="styLNDesc" style="width:180mm;height:3mm;font-size:7pt;padding-left:7mm;">*For each student who attended an eligible educational 
	                   institution in a Midwestern disaster area, <b>do not</b>  enter more than $4,800.
	</div>
	</div>
	<!--**note-->
	<div class="styBB" style="width:187mm;border-bottom-width:0px;float:left;clear:none;padding-top:0mm;">
<div class="styLNDesc" style="font-size:7pt;width:182mm;height:3mm;padding-left:7mm;">**For each student who attended an eligible educational institution in a Midwestern disaster area, enter the <b>smaller</b> of the amount in column (c) or $2,400.</div>
	</div>
<!--line 4-->
<div class="styBB" style="width:187mm;">
	<div class="styLNLeftNumBoxSD" style="font-size:7pt;height:6mm;padding-left: 2.25mm">4
        </div>
	<div class="styLNDesc" style="font-size:7pt;width:142mm;height:6mm;">
	<b>Tentative Hope credit.</b>  Add the amounts on line 3, column (f). If you are taking the lifetime learning<br/>
     credit for another student, go to Part lll; otherwise, go to Part V
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
				<img src="{$ImagePath}/8863_Bullet.gif" alt="MediumBullet"/>
				</div>
		<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:3mm; width:7.1mm; text-align:center; border-bottom-width:0px; ">4</div>
	<div class="styLNAmountBox" style="width:30mm;height:8mm;padding-top:3mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/TentativeHopeCreditAmt"/>
							</xsl:call-template>
						</div>
	</div>	
	<!-- Part Ill - Header -->
	<div class="styBB" style="width:187mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;">
						<span class="styPartName" style="width:15mm;font-size:13;">Part lll</span>
						<span class="styPartDesc" style="width:168mm;font-weight:normal;" >
							<span style="width:3mm;font-size:9pt;vertical-align:center;"/>
							<b>Lifetime Learning Credit.</b>   
							<span style="width:2mm;"></span><b>Caution: </b>
					<i> You <b>cannot </b>take the American opportunity credit or the Hope<br/>
                      	<span style="width:3mm;"></span> credit and the lifetime learning credit for the <b>same student</b> in the same year.</i> 
						</span>
						<!-- Table expand/collapse toggle button -->
						<div class="styGenericDiv" style="float:right;height:1mm;padding-top:4mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8863Data/LifetimeLearningCreditGroup"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'LLCGroup' "/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 5-->
<div class="styTableContainer" style="height:31.5mm;" id="LLCGroup">
			<xsl:call-template name="SetInitialState"/>
			<table class="styTable" cellspacing="0" style="" summary="Table containing life time learning group" name="LLCtable" id="LLCtable">
			<thead class="styTableThead">
			<tr>
	<th class="styTableCellHeader" style="vertical-align:top;border-color:black; border-bottom-width:1px; width:115mm; font-size:7pt;text-align: left;" scope="col">
			<div class="styLNLeftNumBox" style="font-size:7pt;height:7mm;padding-top:0mm;padding-left: 2.25mm;">5
                 </div>
										<span class="styNormalText">
											<span style="width:22mm;"/>
											<span style="font-weight:bold;">(a) </span> Student's name (as shown on page 1 of your tax return)</span>
										<br/>
										<br/>
										<br/>
											<span style="width:12mm;"/><span class="styNormalText">  First name <span style="width:40mm;"/> Last Name</span>
									</th>
<th class="styTableCellHeader" style="text-align:center;width:50mm;border-color:black; border-bottom-width:1px; black;font-size:7pt;" scope="col">
                (b)<span class="styNormalText"> Student's social security <br/> number (as shown on page<br/> 1 of your tax return)</span>
									</th>
<th class="styTableCellHeader" style="text-align:center;width:30mm;border-color:black;border-right-width:0px; border-bottom-width:1px; font-size:7pt;" scope="col">
                (c)<span class="styNormalText"> Qualified  <br/> expenses (see<br/> instructions)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- print logic -->
								<xsl:for-each select="$Form8863Data/LifetimeLearningCreditGroup">
									<xsl:if test="($Print != $Separated) or (count($Form8863Data/LifetimeLearningCreditGroup) &lt;= 5) ">
										<tr>
											<td class="styTableCellSmall" style="font-size:8pt;width:128mm; border-color:black; border-left-width:0px;text-align:left;padding-left:12mm;">
										
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LifetimeStudentName/PersonFirstName"/>
												</xsl:call-template>
												<span style="width:5mm;"/>
												<span class="styNormalText" style="text-align:left;padding-left:12mm;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LifetimeStudentName/PersonLastName"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LifetimeStudentNameControl"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="text-align:center;width:36mm; font-size:8pt;border-color:black;">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="LifetimeStudentSSN"/>
												</xsl:call-template>
											</td>
									<td class="styTableCellSmall" style="text-align:right; font-size:8pt; border-right-width:0px; border-color:black;width:30mm; ">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LifetimeQualifiedExpensesAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:if test="count($Form8863Data/LifetimeLearningCreditGroup)&lt; 1 or ((count($Form8863Data/LifetimeLearningCreditGroup) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:128mm;text-align:left;">
											<span class="styBoldText"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form8863Data/LifetimeLearningCreditGroup"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:36mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8863Data/LifetimeLearningCreditGroup)&lt; 2  or ((count($Form8863Data/LifetimeLearningCreditGroup) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:128mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:36mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8863Data/LifetimeLearningCreditGroup)&lt; 3  or ((count($Form8863Data/LifetimeLearningCreditGroup) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:128mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:36mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8863Data/LifetimeLearningCreditGroup)&lt; 4  or ((count($Form8863Data/LifetimeLearningCreditGroup) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:128mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:36mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8863Data/LifetimeLearningCreditGroup)&lt; 5  or ((count($Form8863Data/LifetimeLearningCreditGroup) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:128mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:36mm;">
										<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form8863Data/LifetimeLearningCreditGroup"/>
							<xsl:with-param name="containerHeight" select="2"/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerID" select=" 'LLCGroup' "/>
						</xsl:call-template>
					</div>
<!--line 6-->
<div class="styBB" style="width:187mm;float:left;clear:none;border-bottom-width:0px;">
	<div class="styLNLeftNumBoxSD" style="font-size:7pt;height:4mm;padding-top:0mm;padding-left: 2.25mm; border-bottom-width:0px">6
        </div>
	<div class="styLNDesc" style="font-size:7pt;width:142mm;height:4mm;padding-top:0mm;">
         Add the amounts on line 5, column (c), and enter the total
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
						<div class="styLNRightNumBox" style="font-size:7pt;height:4mm;padding-top:0mm; width:7.1mm; text-align:center;  ">6</div>
						<div class="styLNAmountBox" style="width:30mm;height:4mm;padding-top:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/TotalQualifiedExpensesAmt"/>
							</xsl:call-template>
						</div>
					</div>
<!--line 7a-->
<div style="width:187mm;border-bottom-width:0px;">
	<div class="styLNLeftNumBoxSD" style="font-size:7pt;height:4mm;padding-top:0mm;padding-left: 2.25mm;">7a
        </div>
<div class="styLNDesc" style="font-size:7pt;width:142mm;height:4mm;padding-top:0mm;">
         Enter the <b>smaller</b> of line 6 or $10,000
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
		<div class="styLNRightNumBox" style="font-size:7pt;height:5mm;padding-top:1mm; width:7.1mm; text-align:center;">7a
		</div>
		<div class="styLNAmountBox" style="width:30mm;height:5mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/SmllrOfTotExpnssOrSpcfdAmt"/>
							</xsl:call-template>
						</div>
					</div>
<!--line 7b-->
<div  style="width:187mm;border-bottom-width:0px;">
	<div class="styLNLeftNumBoxSD" style="font-size:7pt;height:8mm;padding-top:0mm;padding-left:4.3mm">b
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:142mm;height:8mm;padding-top:0mm;">
         For students who attended an eligible educational institution in a Midwestern disaster area, enter<br/>
        the <b>smaller</b> of $10,000 or their qualified expenses included on line 6 (see special rules on page 3 of the instructions)
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
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                  <span style="width:16px"/>.
            </span>
						</div>
						<div class="styLNRightNumBox" style="font-size:7pt;height:11mm;padding-top:6mm; width:7.1mm; text-align:center;">7b</div>
						<div class="styLNAmountBox" style="width:30mm;height:11mm;padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/MWDASmllrOfSpcfdAmtorTotExpn"/>
							</xsl:call-template>
						</div>
					</div>
<!--line 7c-->
<div  style="width:187mm;border-bottom-width:0px;">
	<div class="styLNLeftNumBoxSD" style="font-size:7pt;height:4mm;padding-top:0mm;padding-left: 4.3mm;">c
        </div>
<div class="styLNDesc" style="font-size:7pt;width:142mm;height:4mm;padding-top:0mm;">
        Subtract line 7b from line 7a
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
            </span>
						</div>
		<div class="styLNRightNumBox" style="font-size:7pt;height:5mm;padding-top:1mm; width:7.1mm; text-align:center;">7c</div>
		<div class="styLNAmountBox" style="width:30mm;height:5mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/CalculatedDifferenceAmt"/>
							</xsl:call-template>
						</div>
					</div>
<!--line 8a-->
<div style="width:187mm;border-bottom-width:0px;float:left;clear:none">
<div class="styLNLeftNumBoxSD" style="font-size:7pt;height:4mm;padding-top:0mm;padding-left: 2.25mm;">8a
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:142mm;height:4mm;padding-top:0mm;">
         Multiply line 7b by 40% (.40) 
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
            </span>
						</div>
<div class="styLNRightNumBox" style="font-size:7pt;height:5mm;padding-top:2mm; width:7.1mm; text-align:center; border-bottom-width:1px;">8a</div>
						<div class="styLNAmountBox" style="width:30mm;height:5mm;border-bottom-width:1px; padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/MultiplyMWDAAmtByDecimalAmt"/>
							</xsl:call-template>
						</div>
					</div>
<!--line 8b-->
<div style="width:187mm;border-bottom-width:0px;float:left;clear:none">
	<div class="styLNLeftNumBoxSD" style="font-size:7pt;height:4mm;padding-top:0mm;padding-left:4.3mm;">b
        </div>
	<div class="styLNDesc" style="font-size:7pt;width:142mm;height:4mm;padding-top:0mm;">
         Multiply line 7c by 20% (.20) 
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
            </span>
						</div>
	<div class="styLNRightNumBox" style="font-size:7pt;height:5mm;padding-top:2mm; width:7.1mm; text-align:center; border-bottom-width:1px;">8b</div>
				<div class="styLNAmountBox" style="width:30mm;height:5mm;border-bottom-width:1px; padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/MultiplyCalcDiffByDecimalAmt"/>
							</xsl:call-template>
						</div>
					</div>
<!--line 8c-->
<div  style="width:187mm;border-style: solid; border-color: black;border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;border-top-width: 0px;float:left;clear:none">
	<div class="styLNLeftNumBoxSD" style="font-size:7pt;height:4mm;padding-top:0mm;padding-left: 4.3mm;">c
        </div>
	<div class="styLNDesc" style="font-size:7pt;width:142mm;height:4mm;padding-top:0mm;">
         <b>Tentative lifetime learning credit. </b>Add lines 8a and 8b. If you have an entry on line 2, go to Part lV; <br />otherwise go to Part V
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
	<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:3mm; width:7.1mm; text-align:center; border-bottom-width:0px;">8c</div>
				<div class="styLNAmountBox" style="width:30mm;height:8mm;border-bottom-width:0px; padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/TentLifetimeLearningCreditAmt"/>
							</xsl:call-template>
						</div>						
		</div>	
<!-- Page 1 End -->
<!-- Page Break and Footer-->
	<div class="pageEnd" style="width:187mm;padding-top:0mm;border-top-width:1px;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see page 5 of separate instructions.</span>
							<span style="width:13mm;"/>                        
      Cat. No. 25379M
                        </div>
						<div style="float:right;">
							<span style="width:40px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">8863</span> (2009)
                        </div>
  </div>
  <!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 8863 (2009)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
  
<!-- Part lV -->
	<!-- Part IV - Header -->
	<div class="styBB" style="width:187mm;height:0mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;">
						<span class="styPartName" style="width:15mm;font-size:13;">Part lV</span>
						<span style="width:170mm;font-weight:normal;" class="styPartDesc">
							<span style="width:3mm;font-size:10pt;vertical-align:bottom;"/>
							<b>Refundable American Opportunity Credit</b>
						</span>
					</div>
<!--Line 9-->
	<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">9
        </div>
	<div class="styLNDesc" style="font-size:7pt;width:142mm;height:4mm;padding-top:1mm;">
         Enter the amount from line 2. 
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
						<div class="styLNRightNumBox" style="font-size:7pt;height:5mm;width:7.1mm; text-align:center; ">9</div>
						<div class="styLNAmountBox" style="width:30mm;height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/RefundableAmerOppCreditGroup/TentativeAmerOppCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
<!--Line 10-->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">10
        </div>
<div class="styLNDesc" style="font-size:7pt;width:105mm;height:4mm;padding-top:1mm;">
         Enter: $180,000 if married filing jointly; $90,000 if single, head of <br/>household,
         or qualifying widow(er)
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
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:3mm; width:7.1mm; text-align:center; ">10</div>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;padding-top:3mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/RefundableAmerOppCreditGroup/EnterSpecifiedAmountForFSAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm; width:7.3mm; background-color:lightgrey; 
        border-bottom-width:0px; border-right-width:1px;"/>
					</div>
<!--Line 11-->
<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">11
        </div>
		<div class="styLNDesc" style="font-size:7pt;width:105mm;height:4mm;padding-top:1mm;">
         Enter the amount from Form 1040, line 38,* or Form 1040A, line 22
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
                 <span style="width:16px"/>.
            </span>
						</div>
						<div class="styLNRightNumBox" style="font-size:7pt;height:5mm;padding-top:1mm; width:7.1mm; text-align:center; ">11</div>
						<div class="styLNAmountBox" style="width:30mm;height:5mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/RefundableAmerOppCreditGroup/ModifiedAGIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-size:7pt;height:5mm; width:7.3mm; 
         background-color:lightgrey; border-bottom-width:0px; border-right-width:1px;"/>
					</div>
	<!--Line 12-->
	<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">12
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:105mm;height:4mm;padding-top:1mm;">
         Subtract line 11 from line 10. If zero or less, <b>stop;</b> you cannot take any<br/>
         education credit
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
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:3mm; width:7.1mm; text-align:center; ">12</div>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;padding-top:3mm; font-size:7pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/RefundableAmerOppCreditGroup/SubtractAGIFromAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:8mm; width:7.3mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:1px;"/>
					</div>
					<!--Line 13-->
	<div style="width:187mm;">
	<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">13
        </div>
						<div class="styLNDesc" style="font-size:7pt;width:105mm;height:4mm;padding-top:1mm;">
         Enter: $20,000 if married filing jointly; $10,000 if single, head of household,<br/>
         or qualifying widow(er)
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
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:2mm; width:7.1mm; text-align:center; ">13</div>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;padding-top:2mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/RefundableAmerOppCreditGroup/SpecifiedAmtPerFSAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:8mm; width:7.3mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:1px;"/>
					</div>	
			<!--LINE 14 -->
        <div class="styGenericDiv " style="width:187mm;">
           <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">14
        </div>
          <div class="styLNDesc" style="width:142mm;"> If line 12 is:
          </div>
          <div class="styLNRightNumBox" style=" width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:5mm"/>
          <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;height:5mm"/>
          <br/>
          <div class="styGenericDiv " style="width:187mm;">
           <div class="styLNLeftNumBox" style="width:6mm;"></div>
            <div class="styLNDesc" style="width:120mm;height:8mm;padding-left: 2.25mm">
            <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
                Equal to or more than line 13, enter 1.000 on line 14
                 <span class="styBoldText">
				<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                    <span style="width:8px"/>.
            </span>
                
                <br/>
                 <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
                  Less than line 13, divide line 12 by line 13 . Enter the result as a decimal (rounded to 
                  <br/>
                  <span style="width:2mm;"></span>at least three places)
                   <span class="styBoldText">
				<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                    <span style="width:8px"/>.
                    <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
            </span>
                   </div>
                  <div class="styLNDesc" style="width:2mm;height:8mm;"> 
                  <img src="{$ImagePath}/1040SchD_Bracket.gif" height="37mm"  alt="bracket image"/>
            </div>
              <div class="styLNDesc" style="width:21.7mm;height:8mm;padding-top:2mm;"> 
              <span class="styBoldText">
					<span style="width:16px;"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
                </div>
              <div class="styLNRightNumBox" style="width:7.1mm;height:6mm">14</div>
              <div class="styLNAmountBox" style="width: 30mm;height:6mm">
              <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8863Data/RefundableAmerOppCreditGroup/CalcTentativeEducationRatio"/>
                </xsl:call-template>
            </div>
           <div class="styLNRightNumBox" style=" width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:6mm"/>
          <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;height:6mm"/>
        
          </div>
        </div>
      
        <!-- END LINE 14 -->		
<!--Line 15-->
	<div style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">15
        </div>
	<div class="styLNDesc" style="font-size:7pt;width:137mm;height:4mm;padding-top:1mm;">
	Multiple line 9 by line 14. <b>Caution: </b> If you were under age 24 at the end of the year <b>and </b>meet<br/> the conditions in the instructions, you cannot take the refundable American opportunity<br /> credit. Skip line 16, enter the amount from line 15 on line 17, and check this box
        <!--Dotted Line-->
				<span class="styBoldText">
				<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
            </span>
            <img src="{$ImagePath}/8863_Bullet.gif" alt="MediumBullet"/>
						</div>
					<div class="styLNDesc" style="font-size:7pt;width:5mm;height:11mm;padding-top:7mm;">
						<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8863Data/RefundableAmerOppCreditGroup/RefundableAmerOppCrUnder24Ind"/>
									<xsl:with-param name="BackupName">Form8863DataRefundableAmericanOpportunityCreditGroup</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8863Data/RefundableAmerOppCreditGroup/RefundableAmerOppCrUnder24Ind"/>
									<xsl:with-param name="BackupName">Form8863DataRefundableAmericanOpportunityCreditGroup</xsl:with-param>
								</xsl:call-template>
                            </label>
                            	</div>
                            	<div class="styLNRightNumBox" style=" width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:5mm"/>
          <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;height:5mm"/>
						<div class="styLNRightNumBox" style="font-size:7pt;height:6mm;padding-top:1mm; width:7.1mm; text-align:center; ">15</div>
						<div class="styLNAmountBox" style="width:30mm;height:6mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/RefundableAmerOppCreditGroup/CalcTentativeEducationCrAmt"/>
							</xsl:call-template>
						</div>
	</div>					
<!--Line 16-->
	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:0mm;padding-left: 2.25mm">16
        </div>
		<div class="styLNDesc" style="font-size:7pt;width:142mm;height:4mm;padding-top:0mm;">
       <b>Refundable American opportunity credit.</b> Multiply line 15 by 40% (.40). Enter the amount here and on Form 1040, line 66, or Form 1040A, line 43. Then go to line 17 below.
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
						<div class="styLNRightNumBox" style="height:7mm;width:7.1mm;padding-top:2mm;border-bottom-width:0px;">16</div>
						<div class="styLNAmountBox" style="width:30mm;height:7mm;padding-top:2mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/RefundableAmerOppCreditGroup/RefundableAmerOppCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
		<!-- Part V -->
	<!-- Part V - Header -->
	<div class="styBB" style="width:187mm;height:0mm;border-style:solid; border-bottom-width:1px;border-top-width:1px;
          border-right-width:0px;border-left-width:0px;float:left;">
						<span class="styPartName" style="width:15mm;font-size:13;">Part V</span>
						<span style="width:170mm;font-weight:normal;" class="styPartDesc">
							<span style="width:3mm;font-size:10pt;vertical-align:bottom;"/>
							<b>Nonrefundable Education Credits</b>
						</span>
					</div>
	<!--Line 17-->
	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">17
        </div>
		<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
        Subtract line 16 from line 15
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
            
            </span>
          </div>
<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:0mm;">17</div>
						<div class="styLNAmountBox" style="width:30mm;height:5mm;padding-top:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/NonrefundableEducationCrGroup/TentativeEducCrLessRfdbCrAmt"/>
							</xsl:call-template>
						</div>
		</div>
	<!--Line 18-->
	<div style="width:187mm;">
	<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-left: 2.25mm">18
        </div>
		<div class="styLNDesc" style="font-size:7pt;width:142mm;height:5mm;">
        Add line 4 and line 8c. If you have no entry on these lines skip lines 19 through 24, and enter the<br /> amount from line 17 on line 25
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
            </span>
              </div>
		<div class="styLNRightNumBox" style="height:8mm; width:7.1mm;padding-top:3mm;">18</div>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/NonrefundableEducationCrGroup/TentativeEducationCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
<!--Line19-->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="font-size:7pt;height:8mm;padding-left: 2.25mm">19
        </div>
		<div class="styLNDesc" style="font-size:7pt;width:105mm;height:8mm;">
			Enter: $120,000 if married filing jointly; $60,000 if single, head of <br />household, or qualifying widow(er)
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
<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:3mm; width:7.1mm; text-align:center; ">19</div>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;padding-top:3mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/NonrefundableEducationCrGroup/EnterSpecifiedAmountForFSAmt"/>
							</xsl:call-template>
						</div>
<div class="styLNRightNumBox" style="font-size:7pt;height:8mm; width:7.3mm; background-color:lightgrey; 
        border-bottom-width:0px; border-right-width:1px;"/>
					</div>
<!--Line 20-->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-left: 2.25mm">20
        </div>
		<div class="styLNDesc" style="font-size:7pt;width:105mm;height:5mm;">
			Enter the amount from Form 1040, line 38,* or Form 1040A, line 22
        <!--Dotted Line-->
			<span class="styBoldText">
				<span style="width:16px"/>.
                <span style="width:16px"/>.
            </span>
		</div>
<div class="styLNRightNumBox" style="font-size:7pt;height:5mm;padding-top:0mm; width:7.1mm; text-align:center; ">20</div>
						<div class="styLNAmountBox" style="width:30mm;height:5mm;padding-top:0mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/NonrefundableEducationCrGroup/ModifiedAGIAmt"/>
							</xsl:call-template>
						</div>
<div class="styLNRightNumBox" style="height:5mm; width:7.3mm; background-color:lightgrey; 
        border-bottom-width:0px; border-right-width:1px;"/>
					</div>
<!--Line 21-->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="font-size:7pt;height:8mm;padding-left: 2.25mm">21
        </div>
		<div class="styLNDesc" style="font-size:7pt;width:105mm;height:8mm;">
			Subtract line 20 from line 19. If zero or less, skip lines 22 and 23, and enter<br /> zero on line 24
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
<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:3mm; width:7.1mm; text-align:center; ">21</div>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;padding-top:3mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/NonrefundableEducationCrGroup/SubtractAGIFromAmt"/>
							</xsl:call-template>
						</div>
<div class="styLNRightNumBox" style="font-size:7pt;height:8mm; width:7.3mm; background-color:lightgrey; 
        border-bottom-width:0px; border-right-width:1px;"/>
					</div>
<!--Line 22-->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="font-size:7pt;height:8mm;padding-left: 2.25mm">22
        </div>
		<div class="styLNDesc" style="font-size:7pt;width:105mm;height:8mm;">
			Enter: $20,000 if married filing jointly; $10,000 if single, head of household,<br/> or qualifying widow(er)
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
<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:3mm; width:7.1mm; text-align:center; ">22</div>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;padding-top:3mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/NonrefundableEducationCrGroup/SpecifiedAmtPerFSAmt"/>
							</xsl:call-template>
						</div>
<div class="styLNRightNumBox" style="font-size:7pt;height:8mm; width:7.3mm; background-color:lightgrey; 
        border-bottom-width:0px; border-right-width:1px;"/>
</div>					
	<!--LINE 23 -->
        <div class="styGenericDiv " style="width:187mm;">
           <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">23
        </div>
          <div class="styLNDesc" style="width:142mm;padding-top:1mm;"> If line 21 is:
          </div>
          <div class="styLNRightNumBox" style=" width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:5mm"/>
          <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;height:5mm"/>
          <br/>
          <div class="styGenericDiv " style="width:187mm;">
           <div class="styLNLeftNumBox" style="width:6mm;"></div>
            <div class="styLNDesc" style="width:123mm;height:8mm;padding-left: 2.25mm">
            <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
             Equal to or more than line 22, enter the amount from line 18 on line 24 and go to line 25.<br/>
                 <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
                  Less than line 22, divide line 21 by line 22. Enter the result as a decimal (rounded to    <br/>
                  <span style="width:2mm;"></span>at least three places)
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
                  <div class="styLNDesc" style="width:2mm;height:8mm;"> 
                  <img src="{$ImagePath}/1040SchD_Bracket.gif"   height="37mm" alt="bracket image"/>
            </div>
              <div class="styLNDesc" style="width:18.7mm;height:8mm;padding-top:2mm;"> 
              <span class="styBoldText">
					<span style="width:16px;"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
                </div>
              <div class="styLNRightNumBox" style="width:7.1mm;height:6mm">23</div>
              <div class="styLNAmountBox" style="width: 30mm;height:6mm">
              <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8863Data/NonrefundableEducationCrGroup/CalcTentativeEducationRatio"/>
                </xsl:call-template>
            </div>
           <div class="styLNRightNumBox" style=" width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:5mm"/>
          <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;height:5mm"/>
          </div>
        </div>
        <!-- END LINE 23 -->		
	<!--Line 24-->
	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">24
        </div>
		<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
      Multiply line 18 by line 23
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
            
            </span>
          </div>
<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:1mm;">24</div>
						<div class="styLNAmountBox" style="width:30mm;height:5mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/NonrefundableEducationCrGroup/CalcTentativeEducationCrAmt"/>
							</xsl:call-template>
		</div>
		</div>	
<!--Line 25-->
	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">25
        </div>
		<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
    Add line 17 and line 24. If zero, <b>stop;</b> you <b>cannot</b> take any nonrefundable education credit
        <!--Dotted Line-->
				<span class="styBoldText">
				<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
            </span>
          </div>
<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:1mm;">25</div>
						<div class="styLNAmountBox" style="width:30mm;height:5mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/NonrefundableEducationCrGroup/TentativeEducCrNonRfdblCrAmt"/>
							</xsl:call-template>
		</div>
		</div>	
<!--Line 26-->
	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">26
        </div>
		<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
    Enter the amount from Form 1040, line 46, or Form 1040A, line 28
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
<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:1mm;">26</div>
						<div class="styLNAmountBox" style="width:30mm;height:5mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/NonrefundableEducationCrGroup/TotalTaxAmt"/>
							</xsl:call-template>
		</div>
		</div>
		<!--Line 27-->
        <div class="styGenericDiv " style="width:187mm;">
           <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">27
        </div>
          <div class="styLNDesc" style="width:142mm;padding-top:1mm;"> Enter the total, if any, of your credits from:
          </div>
          <div class="styLNRightNumBox" style=" width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:5mm"/>
          <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;height:5mm"/>
          <br/>
          <div class="styGenericDiv " style="width:187mm;">
           <div class="styLNLeftNumBox" style="width:6mm;"></div>
            <div class="styLNDesc" style="width:123mm;height:8mm;padding-left: 2.25mm;">
            <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
            From 1040, lines 47, 48, and the amount from Schedule R (Form 1040) entered<br/>
             <span style="width:2mm;"></span>on line 53
             <span class="styBoldText" style="">
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
             
             <br />
                 <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
               Form 1040A, lines 29 and 30 
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
                  <div class="styLNDesc" style="width:2mm;height:8mm;"> 
                  <img src="{$ImagePath}/1040SchD_Bracket.gif"   height="37mm" alt="bracket image"/>
            </div>
              <div class="styLNDesc" style="width:18.7mm;height:8mm;padding-top:2mm;"> 
              <span class="styBoldText">
					<span style="width:16px;"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
                </div>
              <div class="styLNRightNumBox" style="width:7.1mm;height:6mm">27</div>
              <div class="styLNAmountBox" style="width: 30mm;height:6mm">
              <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8863Data/NonrefundableEducationCrGroup/TotalOtherCreditsAmt"/>
                </xsl:call-template>
            </div>
           <div class="styLNRightNumBox" style=" width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:6mm"/>
          <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;height:6mm"/>
          </div>
        </div>
		<!--Line 28-->
	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">28
        </div>
		<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
    Subtract line 27 from line 26. If zero or less, <b>stop</b>; you <b>cannot</b> take any nonrefundable education credit
        <!--Dotted Line-->
				<span class="styBoldText">
				<span style="width:16px"/>.
            </span>
          </div>
<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:1mm;">28</div>
						<div class="styLNAmountBox" style="width:30mm;height:5mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/NonrefundableEducationCrGroup/CalculatedCreditTaxAmt"/>
							</xsl:call-template>
		</div>
		</div>
		<!--Line 29-->
	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">29
        </div>
		<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
   <b>Nonrefundable education credits.</b> Enter the <b>smaller</b> of line 25 or line 28 here and on Form 1040, <br/>line 49, or Form 1040A, line 31
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
            </span>
          </div>
<div class="styLNRightNumBox" style="height:8mm;width:7.1mm;padding-top:3mm;">29</div>
		<div class="styLNAmountBox" style="width:30mm;height:8mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8863Data/NonrefundableEducationCrGroup/NonrefundableEducationCrAmt"/>
							</xsl:call-template>
		</div>
		</div>
	<div class="styBB" style="width:187mm;float:left;clear:none;">
	<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:0mm;padding-left: 2.25mm;float:left;clear:none;">
	<span style="width:1mm;"></span>
        </div>
		<div class="styLNDesc" style="width:177mm;height:5mm;padding-top:1mm;font-size:7pt;">
   *If you are filing Form 2555, 2555-EZ, or 4563, or you are excluding income from Puerto Rico, see Pub. 970 for the amount to enter.
   	</div>
			</div>
					<!-- Page End -->
					<div class="pageEnd" style="width:187mm;padding-top:0mm; border-top-width:1px;">
      <span style="width:161mm"/>  
      Form <span class="styBoldText">8863</span> (2009)
      <br/>
					</div>
					<!-- <p> class="pageEnd"></p>-->
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
							<xsl:with-param name="TargetNode" select="$Form8863Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					
					<!--Separated Data  Part I American Opportunity Credit Group Table -->
					<xsl:if test="($Print = $Separated) and (count($Form8863Data/AmericanOpportunityCreditGroup) &gt; 5)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 8863 - Part I - American Opportunity Credit Group Table, Line 1:</span>
						<br/>
						<table class="styDepTbl" cellspacing="0" style="" summary="Table displaying American Opportunity Credit Group Group " name="HCGtable" id="HCGtable">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:40mm;border-color:black;border-left-width:0px;font-size:7pt;text-align:none;
" scope="col" colspan="1">
										<span style="text-align:left;">1</span>
										<span style="width:2mm;"/>(a)<span class="styNormalText" style="text-align: center;">  Student's name<br/>
											<span style="width:2mm;"/>(as shown on page 1<br/>
											<span style="width:2mm;"/>of your tax return)<br/>
            First name<br/>------------<br/>Last Name</span>
									</th>
									
									<th class="styDepTblCell" style="text-align:center;width:30mm;border-color:black;font-size:7pt;padding-top:3mm;
                 " scope="col" colspan="1">
            (b)<span class="styNormalText"> Student's<br/>social security<br/>number (as<br/>shown on page 1<br/>of your tax return)</span>
									</th>
									<th class="styDepTblCell" style="text-align:center;width:30mm;border-color:black;font-size:7pt;" scope="col" colspan="1">
            (c)<span class="styNormalText"> Qualified <br/>expenses (see<br/>instructions). <b>Do<br/>not</b> enter more<br/>than $4,000 for<br/>each student.</span>
									</th>
									<th class="styDepTblCell" style="width:30mm;border-color:black;font-size:7pt;padding-top:3mm;" scope="col" colspan="1">
            (d)<span class="styNormalText"> Subtract $2,000
											from the amount in column (c). If zero<br/>or less, enter -0-
										</span>
									</th>
									<th class="styDepTblCell" style="width:30mm;border-color:black;font-size:7pt;" scope="col" colspan="1">
            (e)<span class="styNormalText"> Multiply the <br/>amount in column <br/>(d) by 25% (.25)</span>
									</th>
									<th class="styDepTblCell" style="width:30mm;border-color:black;font-size:7pt;" scope="col" colspan="1">
            (f)<span class="styNormalText" style="font-size:7pt;"> If column (d) is xero, enter the amount from column (c). Otherwise, ass $2,000 to the amount in column (e).        </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8863Data/AmericanOpportunityCreditGroup">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--position 1-->
										<td class="styDepTblCell" style="font-size:8pt;border-color:black;border-left-width:0px;width:60mm;text-align:left;">
											<span style="width:0mm;">
												<xsl:if test="position()=1">
													<span class="styBoldText"/>
												</xsl:if>
											</span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AmerOppStudentName/PersonFirstName"/>
											</xsl:call-template>
											<br/>-----------------<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AmerOppStudentName/PersonLastName"/>
											</xsl:call-template>
											<br/>-----------------<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AmerOppStudentNameControl"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-size:8pt;border-color:black;width:30mm;">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="AmerOppStudentSSN"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size:8pt;border-color:black;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AmerOppQualifiedExpensesAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size:8pt;border-color:black;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AmerOppQlfyExpnssLessAllwblAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size:8pt;border-color:black;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AmerOppAllwblExpnssTimesPctAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size:8pt;border-color:black;border-right-width:0px;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AmerOppCreditNetCalcExpnssAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- END Separated Data for Part I -->
					<!--Separated Data  Part II Hope Credit Group Table -->
					<xsl:if test="($Print = $Separated) and (count($Form8863Data/HopeCreditMWDAGroup) &gt; 5)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 8863 - Part II - Hope Credit Group Table, Line 3:</span>
						<br/>
				<table class="styDepTbl" cellspacing="0" style="" summary="Table displaying Hope Credit Group " name="HCGP2table" id="HCGP2table">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:40mm;border-color:black;border-left-width:0px;font-size:7pt;text-align:none;
" scope="col" colspan="1">
										<span style="text-align:left;">1</span>
										<span style="width:2mm;"/>(a)<span class="styNormalText" style="text-align: center;">  Student's name<br/>
											<span style="width:2mm;"/>(as shown on page 1<br/>
											<span style="width:2mm;"/>of your tax return)<br/>
            First name<br/>------------<br/>Last Name</span>
									</th>
									
									<th class="styDepTblCell" style="text-align:center;width:30mm;border-color:black;font-size:7pt;padding-top:3mm;
                 " scope="col" colspan="1">
            (b)<span class="styNormalText"> Student's<br/>social security<br/>number (as<br/>shown on page 1<br/>of your tax return)</span>
									</th>
									<th class="styDepTblCell" style="text-align:center;width:30mm;border-color:black;font-size:7pt;" scope="col" colspan="1">
            (c)<span class="styNormalText"> Qualified <br/>expenses (see<br/>instructions). <b>Do<br/>not</b> enter more<br/>than $2,400 for<br/>each student.</span>
									</th>
									<th class="styDepTblCell" style="width:30mm;border-color:black;font-size:7pt;padding-top:3mm;" scope="col" colspan="1">
            (d)<span class="styNormalText"> Enter the<br/>
											<b>smaller</b> or the<br/>amount in<br/>column (c) or
            $1,200<br/>
										</span>
									</th>
									<th class="styDepTblCell" style="width:30mm;border-color:black;font-size:7pt;" scope="col" colspan="1">
            (e)<span class="styNormalText"> Add <br/>column (c) and<br/>column (d)</span>
									</th>
									<th class="styDepTblCell" style="width:30mm;border-color:black;font-size:7pt;" scope="col" colspan="1">
            (f)<span class="styNormalText" style="font-size:7pt;"> Enter one-half<br/>of the amount in<br/>column (e)           </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8863Data/HopeCreditMWDAGroup">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--position 1-->
										<td class="styDepTblCell" style="font-size:8pt;border-color:black;border-left-width:0px;width:60mm;text-align:left;">
											<span style="width:0mm;">
												<xsl:if test="position()=1">
													<span class="styBoldText"/>
												</xsl:if>
											</span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="HopeStudentNameMWDA/PersonFirstName"/>
											</xsl:call-template>
											<br/>-----------------<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="HopeStudentNameMWDA/PersonLastName"/>
											</xsl:call-template>
											<br/>-----------------<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="HopeStudentNameControlMWDA"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-size:8pt;border-color:black;width:30mm;">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="HopeStudentSSNMWDA"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size:8pt;border-color:black;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="HopeQualifiedExpensesMWDAAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size:8pt;border-color:black;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="QlfyExpnssOrQlfyExpnssMWDAAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size:8pt;border-color:black;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SumOfQualifiedExpensesMWDAAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size:8pt;border-color:black;border-right-width:0px;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="HalfSumOfQlfyExpnssMWDAAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- END Separated Data for Part II -->
					<!-- Separated Data for Part III Lifetime learning credit Table -->
					<xsl:if test="($Print = $Separated) and (count($Form8863Data/LifetimeLearningCreditGroup) &gt; 5)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 8863 - Part III - Lifetime Learning Group Table, Line 5:</span>
						<br/>
						<table class="styDepTbl" cellspacing="0" style="" summary="Table containing life time learning credit group" name="LLCtable" id="LLCtable">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
			<th class="styDepTblHdr" style="border-color:black; border-bottom-width:1px; width:46mm; font-size:7pt;text-align: left;" scope="col" colspan="1">
                3
                 
                 <span class="styNormalText">
											<span style="width:4.5mm;"/>
											<span style="font-weight:bold;">(a) </span> Students name (as shown<br/>
										</span>
										<span class="styNormalText">
											<br/>First name </span>
									</th>
									<th class="styDepTblHdr" style="border-color:black; border-bottom-width:1px; width:59mm; font-size:7pt;text-align: left;" scope="col" colspan="1">
										<span class="styNormalText">  
                         on page 1 of your tax return)<br/>
										</span>
										<span class="styNormalText">
											<br/>Last name </span>
									</th>
									<th class="styDepTblHdr" style="text-align:center;width:46mm;border-color:black; border-bottom-width:1px;font-size:7pt;" scope="col" colspan="1">
                (b)<span class="styNormalText"> Student's social security <br/> number (as shown on page<br/> 1 of your tax return)</span>
									</th>
									<th class="styDepTblHdr" style="text-align:center;width:30mm;border-color:black;border-right-width:0px; border-bottom-width:1px; font-size:7pt;" scope="col" colspan="1">
                (c)<span class="styNormalText"> Qualified  <br/> expenses (see<br/> instructions)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8863Data/LifetimeLearningCreditGroup">
									<tr>
										<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--position 1-->
										<td class="styDepTblCell" style="font-size:8pt;width:46mm; border-color:black; border-left-width:0px;text-align:left">
											<span style="width:0mm;">
												<xsl:if test="position()=1">
													<span class="styBoldText"/>
												</xsl:if>
											</span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LifetimeStudentName/PersonFirstName"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="font-size:8pt;width:59mm; border-color:black; border-left-width:0px;text-align:left">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LifetimeStudentName/PersonLastName"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LifetimeStudentNameControl"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:center;width:46mm; font-size:8pt;border-color:black;">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="LifetimeStudentSSN"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:right; font-size:8pt; border-right-width:0px; border-color:black;width:30mm; ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LifetimeQualifiedExpensesAmt"/>
											</xsl:call-template>
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
</xsl:stylesheet>
