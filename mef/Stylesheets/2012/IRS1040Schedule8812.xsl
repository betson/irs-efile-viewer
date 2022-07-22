<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 7/19/2010 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1040Schedule8812Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="Form8812Data" select="$RtnDoc/IRS1040Schedule8812"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8812Data)">
             </xsl:with-param>
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
        <meta name="Description" content="IRS Form 8812"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
           <xsl:if test="not($Print) or $Print=''"> 
            <xsl:call-template name="IRS1040Schedule8812Style"/>
            <xsl:call-template name="AddOnStyle"/>
           </xsl:if> 
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form1040Schedule8812" style="font-size:7pt;">
          <!-- BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- END WARNING LINE -->
          <!-- Begin Form Number and Name -->
          <div class="styTBB" style="width:187mm;height:18mm;">
            <div class="styFNBox" style="width:34mm;height:22.2mm;padding-top:1mm;">
              <div style="height:13mm;">
				<span style="font-weight:bold;font-size:10pt;">SCHEDULE 8812<br/></span>
				<span style="font-weight:bold;font-size:9pt;">(Form 1040A or<br/><span style="width:7px;"/>Form 1040)</span>
              </div>
              <div style="height:8mm;padding-top:.75mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
                <span style="padding-left:3mm">(99)</span>
              </div>
            </div>
            <div class="styFTBox" style="width:120mm;height:18mm;">
				<div class="styMainTitle" style="height:11mm;font-size:17pt;padding-top:3mm;padding-left:5mm;">
					Child Tax Credit
				</div>
				<div class="styFBT" style="height:8mm;padding-bottom:2px;width:99%;font-size:8pt;font-family:Arial;">
					<img src="{$ImagePath}/8812_Bullet_Md.gif" alt="MediumBullet" height="9" width="9"/>
					Attach to Form 1040, Form 1040A, or Form 1040NR.<br/>
					<img src="{$ImagePath}/8812_Bullet_Md.gif" alt="MediumBullet" height="9" width="9"/>
					<span style="font-family:Arial;font-size:7pt;padding-left:3px;">Information about Schedule 8812 and its separate instructions is at <i>www.irs.gov/form1040</i>.</span>
				</div>
			</div>
            <div class="styTYBox" style="width:32mm;height:22.2mm;">
              <div class="styOMB" style="height:2mm;">
            OMB No. 1545-0074
          </div>
              <div class="styTaxYear" style="height:9mm;padding-top:1mm;padding-bottom:0;">20<span class="styTYColor">12</span>
         </div>
              <div style="text-align:left;padding-left:3mm;">Attachment<br/>Sequence No.
           <span class="styBoldText">47</span>
              </div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:140mm;height:8mm;font-size:7pt;font-weight:normal;">
          Name(s) shown on return<br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">Name</xsl:with-param>
                </xsl:call-template>
             </div>
            <div class="styEINBox" style="width:45mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
				Your social security number <br/>
              <span style="width:40mm;text-align:center;font-weight:normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
			<!-- BEGIN Part I Title -->
            <div class="styBB" style="width:187mm;border-top-width:1px;float:none;clear:both;">
				<div class="styPartName" style="font-family:Arial;font-size:10pt;">Part I</div>
				<div class="styPartDesc" style="font-family:Arial;font-size:10pt;">Filers Who Have Certain Child Dependent(s) with an ITIN (Individual Taxpayer Identification Number)</div>
            </div>
            <!-- END Part I  Title -->
            <!-- Caution line -->
            <div class="styBB" style="width:187mm;padding-top:1mm;float:none;clear:both;">
				<img alt="Caution" src="{$ImagePath}/1040Sch8812_Caution.gif" width="50" height="50"/>
				<span style="width:165mm;padding-left:4mm;padding-bottom:4mm;">
					Complete this part only for each dependent who has an ITIN and for whom you are claiming the child tax credit. <br/>
					If your dependent does not qualify for the credit, you cannot include that dependent in the calculation of this credit.
				</span>
            </div>
            <div style="width:187mm;float:none;clear:both;">
				<div style="width:187mm;padding-top:2mm;font-family:Arial;font-size:8pt;">
					Answer the following questions for each dependent listed on Form 1040, line 6c; Form 1040A, line 6c; or Form 1040NR, line 7c, who has an ITIN <br/>
					(Individual Taxpayer Identification Number) and that you indicated qualified for the child tax credit by checking column (4) for that dependent.
					<div style="float:right;clear:none;margin-right:1px;">
						<xsl:call-template name="SetDynamicTableToggleButton">
							<xsl:with-param name="TargetNode" select="$Form8812Data/QualifiedChildDepdWithITINInd"/>
							<xsl:with-param name="headerHeight" select="0"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="containerID" select=" 'pt1ContainerId' "/>
						</xsl:call-template>
					</div>
				</div>
				<!-- repeating table -->
				<div id="pt1ContainerId">
					<xsl:attribute name="style">
						height:58mm;width:182mm;float:none;clear:both;
						<xsl:choose>
							<xsl:when test="($Print='inline' or $Print='separated')">overflow:visible;</xsl:when>
							<xsl:otherwise>overflow-y:auto;</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<table border="0" class="styTable" style="font-size:7pt;width:182mm;">
						<thead/>
						<tfoot/>
						<tbody>
							<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINInd">
								<tr style="height:14mm;">
									<td>
										<div style="width:180mm;float:none;clear:both;">
											<div class="styGenericDiv" style="width:8mm;font-weight:bold;"><xsl:number value="position()" format="A"/></div>
											<div class="styGenericDiv" style="width:170mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the <br/>
												substantial presence test? See separate instructions.
											</div>
										</div>
										<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
											<span>
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
												<input type="checkbox">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="padding-left:1px;">
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													Yes
												</label>
												<span style="width:6mm;"/>
												<input type="checkbox">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="padding-left:1px;">
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													No
												</label>
											</span>
										</div>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINInd) &lt; 1">
								<tr style="height:14mm;">
									<td>
										<div style="width:180mm;float:none;clear:both;">
											<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
											<div class="styGenericDiv" style="width:170mm;">
												For the <xsl:call-template name="OrdinalNumber"><xsl:with-param name="number" select="1"/></xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the <br/>
												substantial presence test? See separate instructions.
											</div>
										</div>
										<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
											<span>
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="/.."/>
												</xsl:call-template>
												<input type="checkbox">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="padding-left:1px;">
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
													</xsl:call-template>
													Yes
												</label>
												<span style="width:6mm;"/>
												<input type="checkbox">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="padding-left:1px;">
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
													</xsl:call-template>
													No
												</label>
											</span>
										</div>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINInd) &lt; 2">
								<tr style="height:14mm;">
									<td>
										<div style="width:180mm;float:none;clear:both;">
											<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
											<div class="styGenericDiv" style="width:170mm;">
												For the <xsl:call-template name="OrdinalNumber"><xsl:with-param name="number" select="2"/></xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the <br/>
												substantial presence test? See separate instructions.
											</div>
										</div>
										<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
											<span>
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="/.."/>
												</xsl:call-template>
												<input type="checkbox">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="padding-left:1px;">
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
													</xsl:call-template>
													Yes
												</label>
												<span style="width:6mm;"/>
												<input type="checkbox">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="padding-left:1px;">
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
													</xsl:call-template>
													No
												</label>
											</span>
										</div>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINInd) &lt; 3">
								<tr style="height:14mm;">
									<td>
										<div style="width:180mm;float:none;clear:both;">
											<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
											<div class="styGenericDiv" style="width:170mm;">
												For the <xsl:call-template name="OrdinalNumber"><xsl:with-param name="number" select="3"/></xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the <br/>
												substantial presence test? See separate instructions.
											</div>
										</div>
										<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
											<span>
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="/.."/>
												</xsl:call-template>
												<input type="checkbox">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="padding-left:1px;">
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
													</xsl:call-template>
													Yes
												</label>
												<span style="width:6mm;"/>
												<input type="checkbox">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="padding-left:1px;">
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
													</xsl:call-template>
													No
												</label>
											</span>
										</div>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINInd) &lt; 4">
								<tr style="height:14mm;">
									<td>
										<div style="width:180mm;float:none;clear:both;">
											<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
											<div class="styGenericDiv" style="width:170mm;">
												For the <xsl:call-template name="OrdinalNumber"><xsl:with-param name="number" select="4"/></xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the <br/>
												substantial presence test? See separate instructions.
											</div>
										</div>
										<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
											<span>
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="/.."/>
												</xsl:call-template>
												<input type="checkbox">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="padding-left:1px;">
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
													</xsl:call-template>
													Yes
												</label>
												<span style="width:6mm;"/>
												<input type="checkbox">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
													</xsl:call-template>
												</input>
												<label style="padding-left:1px;">
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="/.."/>
														<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
													</xsl:call-template>
													No
												</label>
											</span>
										</div>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8812Data/QualifiedChildDepdWithITINInd"/>
						<xsl:with-param name="headerHeight" select="0"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'pt1ContainerId' "/>
					</xsl:call-template>
				</div>
				<div style="width:187mm;padding-top:4mm;padding-bottom:4mm;">
					<div class="styGenericDiv" style="width:9mm;font-weight:bold;">Note:</div>
					<div class="styGenericDiv" style="width:177mm;">
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8812Data/OverLmtQlfyChldDepdWithITINInd"/>
								<xsl:with-param name="BackupName">IRSSch8812OverLmtQlfyChld</xsl:with-param>
							</xsl:call-template>
							If you have more than four dependents identified with an ITIN and listed as a qualifying child for the child tax credit, see the <br/>
							instructions and check here. 
						</label>
						<img src="{$ImagePath}/8812_Bullet_Md.gif" alt="MediumBullet" height="8" width="8"/>
						<span style="width:10px;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8812Data/OverLmtQlfyChldDepdWithITINInd"/>
								<xsl:with-param name="BackupName">IRSSch8812OverLmtQlfyChld</xsl:with-param>
							</xsl:call-template>
						</input>
					</div>
				</div>
            </div>
            <!-- BEGIN Part II Title -->
            <div class="styBB" style="width:187mm;border-top-width:1px;">
              <div class="styPartName" style="font-family:Arial;font-size:10pt;">Part II</div>
              <div class="styPartDesc" style="font-family:Arial;font-size:10pt;">Additional Child Tax Credit Filers</div>
            </div>
            <!-- END Part II Title -->
            <!-- Line 1 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:9mm;padding-left:3mm;">1</div>
			  <div style="width:141mm;float:left;clear:none;">
              <div class="styLNDesc" style="width:138mm;height:9mm;">
                <div class="styLNDesc" style="width:24mm">
                  <b>1040 filers:</b>
                </div>
                <div class="styLNDesc" style="width:110mm">
						Enter the amount from line 6 of your Child Tax Credit Worksheet (see the<br/>
						Instructions for Form 1040, line 51).
				</div>
                <div class="styLNDesc" style="width:24mm">
                  <b>1040A filers:</b>
                </div>
                <div class="styLNDesc" style="width:110mm"> 
						Enter the amount from line 6 of your Child Tax Credit Worksheet (see the<br/>
						Instructions for Form 1040A, line 33).
				 </div>
                <br/>
                <div class="styLNDesc" style="width:24mm">
                  <b>1040NR filers:</b>
                </div>
                <div class="styLNDesc" style="width:110mm;">
						Enter the amount from line 6 of your Child Tax Credit Worksheet (see the
						Instructions for Form 1040NR, line 48).
                </div>
                
                <div class="styLNDesc" style="width:130mm;font-size:8pt;font-family:Arial;padding-top:4mm;"> 
					If you used Pub. 972, enter the amount from line 8 of the Child Tax Credit Worksheet in the publication.
				</div>
            </div>
              <div class="styLNDesc" style="width:2.8mm;">
                <img src="{$ImagePath}/8812_Bracket_X_Lg.gif" alt="Curly Bracket Image"/>
 
              </div>
			  </div>
              <div class="styLNRightNumBox" style="height:13mm;width:6mm;padding-top:12mm">1</div>
              <div class="styLNAmountBox" style="height:13mm;padding-top:12mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/ChildTaxCreditWrkshtAmt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:13mm;width:6mm;padding-top:12mm;border-bottom-width:0px"></div>
              <div class="styLNAmountBox" style="height:13mm;padding-top:12mm;border-bottom-width:0px;"></div>
            </div>
            <!--End of line 1 -->
            <!-- Line 2 space -->
            <!--End of line 2space -->
            <!-- Line 2 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
              <div class="styLNDesc" style="width:141mm;height:4mm;">
				<span style="float:left;clear:none;">  
					Enter the amount from Form 1040, line 51, Form 1040A, line 33, or Form 1040NR, line 48
				</span>
				<span class="styDotLn" style="float:right;padding-right:2mm;">..</span> 
              </div>
              <div class="styLNRightNumBox" style="height:4mm;width:6mm;">2</div>
              <div class="styLNAmountBox" style="height:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/ChildTaxCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--End of line 2 -->
            <!--Line 3 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBoxSD" style="height:2mm;">3</div>
              <div class="styLNDesc" style="width:141mm;height:2mm;">
				<span style="float:left;clear:none;">    
					Subtract line 2 from line 1. If zero, <b>stop;</b> you cannot take this credit
                </span>
				<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>    
              </div>
              <div class="styLNRightNumBox" style="height:2mm;width:6mm;">3</div>
              <div class="styLNAmountBox" style="">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/NetFromWorksheetAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--End of line 3 -->
            <!-- Line 4a -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm">4a </div>
              <div class="styLNDesc" style="width:103mm;height:2mm;">
				<span style="float:left;clear:none;">
					Earned income (see separate instructions). 
				</span>
				<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>    
              </div>
              
              <div class="styLNRightNumBox" style="height:2mm;width:6mm;padding-top:1mm;">4a </div>
              <div class="styLNAmountBox" style="height:2mm;border-bottom-width:1px;padding-top:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:2mm;width:6.3mm;padding-top:1.3mm;background-color:lightgrey;
				  border-bottom-width:0px;border-right-width:1px;"/>
            </div>
            <!-- Line 4b1 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm">b</div>
              <div class="styLNDesc" style="width:103mm;height:4.5mm;">Nontaxable combat pay (see separate</div>
              <div class="styLNRightNumBox" style="height:4.5mm;width:6mm;background-color:lightgrey;border-bottom-width:0px"/>
              <div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;">
                <!--  <xsl:call-template name="PopulateAmount" >
      <xsl:with-param name="TargetNode"  select="$Form1120ScheduleJ/ForeignTaxCredit" />
      </xsl:call-template> -->
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;width:6.3mm;background-color:lightgrey;border-right-width:1px;
      border-bottom-width:0px;"/>
             </div>
            <!-- Line 4b2 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm"/>
			  <div style="width:103mm;float:left;clear:none;">
              <div class="styLNDesc" style="width:64.8mm;height:4mm;">
				<span style="float:left;clear:none;">
					instructions)
				</span>
				<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span> 
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;width:6mm;border-bottom-width:1px">4b</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:32.1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/NontaxableCombatPayAmt"/>
                </xsl:call-template>
              </div>
			  </div>
              <div class="styLNRightNumBox" style="height:4.5mm;width:6mm;background-color:lightgrey;border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;"/>
              <div class="styLNRightNumBox" style="height:4.5mm;width:6.3mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;"/>
             </div>
            <!--Line 5 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2mm">5</div>
              <div class="styLNDesc" 
              style="width:103mm;height:4mm;">Is the amount on line 4a more than $3,000?
       </div>
              <div class="styLNRightNumBox" style="height:5mm;width:6mm;background-color:lightgrey;border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="border-bottom-width:0px;height:5mm;">
                <!--<xsl:call-template name="PopulateAmount" >
      <xsl:with-param name="TargetNode"  select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd" />
      </xsl:call-template>  -->
              </div>
              <div class="styLNRightNumBox" style="height:5mm;width:6.3mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;"/>
            </div>
            <!--End of line 5 -->
            <!--Line 5 NO -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:4.5mm;"/>
              <div class="styLNDesc" style="width:103mm;height:4mm;">
                <div class="styLNDesc" style="width:12mm;height:4mm;">
				  <xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
				  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <span style="width:4px"/>
                  <label>
                    <xsl:call-template name="PopulateLabelNo">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
                    </xsl:call-template>
                    <b>No.</b>
                  </label>
                </div>
          Leave line 5 blank and enter -0- on line 6.
       </div>
              <div class="styLNRightNumBox" style="height:6mm;width:6mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;"/>
              <div class="styLNAmountBox" style="border-bottom-width:0px;height:6mm;">
                <!--  <xsl:call-template name="PopulateAmount" >
      <xsl:with-param name="TargetNode"  select="$Form1120ScheduleJ/ForeignTaxCredit" />
      </xsl:call-template> -->
              </div>
              <div class="styLNRightNumBox" style="height:6mm;width:6.3mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;"/>
              </div>
            <!--End of line 5  No-->
            <!-- Line 5 Yes  -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="width:103mm;height:4mm;">
                <div class="styLNDesc" style="width:12mm;height:4mm;">
 				  <xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
				  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <span style="width:4px"/>
                  <label>
                    <xsl:call-template name="PopulateLabelYes">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
                    </xsl:call-template>
                    <b>Yes. </b>
                  </label>
                </div>
					 Subtract $3,000 from the amount on line 4a. Enter the result
      </div>
              <div class="styLNRightNumBox" style="border-bottom-width:1px;height:4mm;width:6mm;padding-top:.5mm;padding-bottom:0mm">5</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;padding-top:.5mm;padding-bottom:0mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/NetTotalEarnedIncomeAmt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:5.5mm;width:6.3mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;"/>
             </div>
            <!--End of line 5 yes -->
            <!--Line 6 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBoxSD" style="height:2mm;">6</div>
              <div class="styLNDesc" style="width:141mm;height:2mm;">
				<span style="float:left;clear:none;">  
					Multiply the amount on line 5 by 15% (.15) and enter the result
				</span>
				<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
              </div>
              <div class="styLNRightNumBox" style="height:2mm;width:6mm;">6</div>
              <div class="styLNAmountBox" style="height:2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--End of line 6 -->
            <!--Line 6A -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;"/>
              <div class="styLNDesc" style="width:141mm;height:4mm;">
                 <b>Next. </b> Do you have three or more qualifying children?
          </div>
              <div class="styLNRightNumBox" style="height:4mm;width:38mm;background-color:lightgrey;border-bottom-width:0px;"/>
            </div>
            <!--End of line 6A -->
            <!--Line 6A  no1 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBoxSD" style="height:2mm;"/>
              <div class="styLNDesc" style="width:141mm;height:2mm;">
                <div class="styLNDesc" style="width:12mm;height:2mm;">
				  <xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
				  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <span style="width:4px"/>
                  <label>
                    <xsl:call-template name="PopulateLabelNo">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
                    </xsl:call-template>
                    <b>No.  </b>
                  </label>
                </div>
						If line 6 is zero, stop; you cannot take this credit. Otherwise, skip Part III and enter the
						<b>smaller</b> of line 3 or line 6 on line 13.
              </div>
              <div class="styLNRightNumBox" style="height:8mm;width:38mm;background-color:lightgrey;border-bottom-width:0px"/>
            </div>
            <!--End of line 6A  no1 -->
             <!--Line 6A  yes1 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBoxSD" style="height:2mm;"/>
              <div class="styLNDesc" style="width:141mm;height:2mm;">
                <div class="styLNDesc" style="width:12mm;height:2mm;">
				  <xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
				  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                   <span style="width:4px"/> 
                  <label>
                    <xsl:call-template name="PopulateLabelYes">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
                    </xsl:call-template>
                    <b>Yes. </b>
                  </label>
                </div>
						 If line 6 is equal to or more than line 3, skip Part III and enter the amount 
						 from line 3 on line 13. Otherwise, go to line 7.
          </div>
              <div class="styLNRightNumBox" style="height:7.5mm;width:38mm;background-color:lightgrey;border-bottom-width:0px"/>
            </div>
            <!--End of line 6A  yes1 -->
            <!-- Page Break -->
            <div class="pageEnd" style="width:187mm;float:none;clear:both;border-top:2px solid black;font-family:Arial;font-size:7pt;">
				<span style="float:left;clear:none;"><b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
				<span style="width:15mm;"/>Cat. No. 59761M</span>
				<span style="float:right;clear:none;font-weight:bold;">Schedule 8812 (Form 1040A or Form 1040) 2012</span>
			</div>
			<div class="styTBB" style="width:187mm;">
				<span style="float:left;clear:none;">Schedule 8812 (Form 1040A or Form 1040) 2012</span>
				<span style="float:right;clear:none;">Page <span style="font-weight:bold;font-size:9pt;">2</span></span>
			</div>
            <!-- BEGIN Part III Title -->
            <div class="styBB" style="width:187mm;border-top-width:1px;">
              <div class="styPartName" style="font-family:Arial;font-size:10pt;">Part III</div>
              <div class="styPartDesc" style="font-family:Arial;font-size:10pt;">Certain Filers Who Have Three or More Qualifying Children</div>
            </div>
            <!-- END Part II  Title -->
            <!-- Line 7 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:11mm;padding-left:3mm;padding-top:2mm">7</div>
              <div class="styLNDesc" style="width:103mm;height:11mm;padding-top:2mm">
						Withheld social security and Medicare taxes from Form(s) W-2, boxes 4 and
						6. If married filing jointly, include your spouse’s amounts with yours. If you
						worked for a railroad, see separate instructions 
			   <span class="styDotLn" style="float:none;padding-left:2mm;">..........</span>
              </div>
              <div class="styLNRightNumBox" style="height:13mm;width:6mm;padding-top:9mm">7 </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:13mm;padding-top:9mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/FromW2Amt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:13mm;width:6.3mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;"/>
             </div>
            <!-- Line 8 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:9mm;padding-left:3mm;">8</div>
			  <div style="width:103mm;float:left;clear:none;">
              <div class="styLNDesc" style="width:100mm;height:9mm;">
                <div class="styLNDesc" style="width:22mm">
                  <b>1040 filers:</b>
                </div>
                <div class="styLNDesc" style="width:75mm">
					Enter the total of the amounts from Form 1040, lines<br/>
					27 and 57, plus any taxes that you identified using code<br/>
					"UT" and entered on the dotted line next to line 60.
				</div>
                <div class="styLNDesc" style="width:22mm">
                  <b>1040A filers:</b>
                </div>
                <div class="styLNDesc" style="width:75mm"> Enter -0-.
				 </div>
                <br/>
                <div class="styLNDesc" style="width:22mm">
                  <b>1040NR filers:</b>
                </div>
                <div class="styLNDesc" 
                style="width:75mm;">
					Enter the total of the amounts from Form 1040NR, lines<br/>
					27 and 55, plus any taxes that you identified using code<br/>
					 "UT" and entered on the dotted line next to line 59.
			  </div>
              </div>
              <div class="styLNDesc" style="width:2.8mm;">
                <img src="{$ImagePath}/8812_Bracket_Lger.gif" alt="Curly Bracket Image"/>
               </div>
			   </div>
               <div class="styLNRightNumBox" style="height:27.3mm;width:6mm;border-bottom-width:0px;">
					   <span  style="height:6mm;width:5.7mm;padding-top:12mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">8</span>
               </div>
               <div class="styLNAmountBox" style="height:27.3mm;border-bottom-width:0px;">
				   <span  style="width:31.7mm;border-bottom-width:1px;height:6mm;padding-top:12mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form8812Data/FromTaxReturnAmt"/>
						  </xsl:call-template>
					</span>	  
               </div>
              <div class="styLNRightNumBox" style="height:27.3mm;width:6.3mm;padding-top:12mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;"/>
            </div>
            <!-- Line 9 -->
            <div  style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:2mm;padding-left:3mm">9</div>
              <div class="styLNDesc" style="height:2mm;width:103mm;">
				<span style="float:left;clear:none;">      
					  Add lines 7 and 8
				 </span>
				<span class="styDotLn" style="float:right;padding-right:2mm;">..................</span> 
              </div>
              <div class="styLNRightNumBox" style="height:2mm;width:6mm;">9</div>
              <div class="styLNAmountBox" style="height:2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/CalcFromW2AndReturnAmt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;width:6.3mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px"/>
             </div>
            <!-- Line 10 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:11mm;">10</div>
			  <div style="width:103mm;float:left;clear:none;">
              <div class="styLNDesc" style="width:100mm;">
                <div class="styLNDesc" style="width:22mm">
                  <b>1040 filers:</b>
                </div>
                <div class="styLNDesc" style="width:77mm;">Enter the total of the amounts from Form 1040, lines<br/>
					64a and 69.
				 </div>
                <br/>
                <div class="styLNDesc" style="width:22mm">
                  <b>1040A filers:</b>
                </div>
                <div class="styLNDesc" style="width:77mm">Enter the total of the amount from Form 1040A, line<br/>
						38a, plus any excess social security and tier 1 RRTA<br/>
						taxes withheld that you entered to the left of line 41<br/>
						(see separate instructions).
      </div>
                <div class="styLNDesc" style="width:22mm;">
                  <b>1040NR filers:</b>
                </div>
                <div class="styLNDesc" style="width:77mm;font-size:7.5pt;">Enter the amount from Form 1040NR, line 65.</div>
              </div>
              <div class="styLNDesc" style="width:2.8mm;">
                <img src="{$ImagePath}/8812_Bracket_Lger_1.gif" alt="Curly Bracket Image" width="6" height="90"/>
               </div>
			  </div>
              <div class="styLNRightNumBox" style="height:12mm;width:6mm;padding-top:11mm">10</div>
              <div class="styLNAmountBox" style="height:12mm;border-bottom-width:1px;padding-top:11mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/CalcAmtFromRetPlusTaxWhldAmt"/>
                </xsl:call-template>
              </div>
          <div class="styLNRightNumBox" style="height:27mm;width:5.8mm;border-bottom-width:0px;border-right-width:1px;padding-top:0mm;">
        <span style="height:15mm;background-color:lightgrey;width:5.8mm;"></span>
          </div>
            </div>
            <!--Line 11 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:2mm;">11</div>
              <div class="styLNDesc" style="width:141mm;height:2mm;">
              <span style="float:left;clear:none;">  
					 Subtract line 10 from line 9. If zero or less, enter -0-
            </span>
        <!--Dotted Line-->   
            <span class="styDotLn" style="float:right;padding-right:2mm;">...............</span> 
              </div>
              <div class="styLNRightNumBox" style="height:2mm;width:6mm;">11</div>
              <div class="styLNAmountBox" style="height:2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/CalculatedDifferenceAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--End of line 11 -->
            <!--Line 12 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:2mm;">12</div>
              <div class="styLNDesc" style="width:141mm;height:2mm;">
				<span style="float:left;clear:none;">    
					Enter the <b>larger </b> of line 6 or line 11
			    </span>
        <!--Dotted Line-->   
                <span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span> 
              </div>
              <div class="styLNRightNumBox" style="height:2mm;width:6mm;">12</div>
              <div class="styLNAmountBox" style="height:2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/LargerCalcIncomeOrDiffAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--End of line 12 -->
            <!--Line 12A -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:2mm;padding-top:0mm;"/>
              <div class="styLNDesc" style="width:141mm;height:2mm;padding-top:0mm;">
                <b>Next, </b>
       enter the <b>smaller</b> of line 3 or line 12 on line 13.
          </div>
              <div class="styLNRightNumBox" style="height:2mm;width:38mm;padding-top:0mm;background-color:lightgrey;
          border-bottom-width:0px"/>
            </div>
            <!--End of line 12A -->
            <!-- BEGIN Part IV Title -->
            <div style="width:187mm;border-top:1px solid black;border-bottom:1px solid black;">
              <div class="styPartName" style="font-family:Arial;font-size:10pt;">Part IV</div>
              <div class="styPartDesc" style="font-family:Arial;font-size:10pt;">Additional Child Tax Credit</div>
            </div>
            <!-- END Part IV Title -->
            <!--Line 13 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:2mm;padding-top:.5mm">13</div>
            <div class="styLNDesc" style="width:141mm;height:2mm;padding-top:.5mm;">
				<span style="float:left;clear:none;">    
					<b>This is your additional child tax credit</b>
			   </span>
        <!--Dotted Line-->   
                <span class="styDotLn" style="float:right;padding-right:2mm;">....................</span> 
              </div>
              <div class="styLNRightNumBox" style="height:2mm;width:6mm;border-bottom-width:1px;padding-top:.5mm">13</div>
              <div class="styLNAmountBox" style="height:2mm;border-bottom-width:1px;padding-top:.5mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/AdditionalChildTaxCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
  
               <div class="styLNDesc" style="width:155mm;height:2mm;text-align: right;padding-top:0mm"> </div>	
               <div class="styLNDesc" style="height:12mm;width:31mm;font-size:6pt;padding-top:0.5mm;border-style:none dotted dotted none;border-color:black;border-width:2px;">
											    <span style="width:28.3mm;">Enter this amount on</span><br/>
												<span style="width:28.3mm;">Form 1040, line 65,</span><br/>
												<span style="width:28.3mm;">Form 1040A, line 39, or</span><br/>
												<span style="width:28.3mm;">Form 1040NR, line 63.</span><br/>
			    </div>
			    <div style="width:187mm;"/>
            <!--End of line 13 -->
 
          <!-- capturing the page bottom info -->
          <!--  FOOTER-->
          <div class="pageEnd" style="width:187mm;float:none;clear:both;border-top:2px solid black;">
            <div style="width:100mm;float:right;font-weight:bold;text-align:right;">Schedule 8812 (Form 1040A or Form 1040) 2012</div>
        </div>
          <!-- Adding page break -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
        Additional Data        
      </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form8812Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template name="OrdinalNumber">
	<xsl:param name="number" select="position()"/>
	<xsl:choose>
		<xsl:when test="$number = 1">first</xsl:when>
		<xsl:when test="$number = 2">second</xsl:when>
		<xsl:when test="$number = 3">third</xsl:when>
		<xsl:when test="$number = 4">fourth</xsl:when>
		<xsl:when test="$number mod 10 = 1 and $number != 11"><xsl:value-of select="$number"/>st</xsl:when>
		<xsl:when test="$number mod 10 = 2 and $number != 12"><xsl:value-of select="$number"/>nd</xsl:when>
		<xsl:when test="$number mod 10 = 3 and $number != 13"><xsl:value-of select="$number"/>rd</xsl:when>
		<xsl:otherwise><xsl:value-of select="$number"/>th</xsl:otherwise>
	</xsl:choose>
  </xsl:template>
</xsl:stylesheet>
