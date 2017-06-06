<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1040SSPRStyle.xsl"/>
  <xsl:param name="Form1040SSPRData" select="$RtnDoc/IRS1040SSPR"/>
  <xsl:param name="Form1040PRData" select="$RtnDoc/IRS1040SSPR"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="/">
    <xsl:if test="$Language='ENGLISH'">
        <xsl:call-template name="IRS1040SS"/>
    </xsl:if>
    <xsl:if test="$Language='SPANISH'">
        <xsl:call-template name="IRS1040PR"/>
    </xsl:if>
  </xsl:template>
 
  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
  <xsl:template name="IRS1040SS">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form1040SSPRData)"/>
          </xsl:call-template>
        </title>
        <!--  No Browser Caching  -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set  -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 1040SSPR"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1040SSPRStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="IRS1040SSPR" style="font-family:arial;">
          <!--  Begin Header section 1 -->
          <xsl:call-template name="DocumentHeader"/>
          <div class="styBB" style="width:187mm;border-bottom-width:2px;">
            <div class="styFNBox" style="width:31mm;height:20mm;border-right-width:2px;padding-top:.5mm;">
              <div style="padding-top:1mm;">
                Form
                <span class="styFormNumber" style="font-size:15pt;">  
                  <xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
                    1040-SS
                  </xsl:if>
                  <xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
					<xsl:attribute name="style">font-size:10pt;</xsl:attribute>
                    1040-PR (ENG)
                  </xsl:if>
                </span>
              </div>
              <!--General Dependency Push Pin-->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData"/>
              </xsl:call-template>
              <xsl:if test="$Form1040SSPRData/PrimaryDateOfDeath">
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Top Left Margin - Primary Date of Death</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/PrimaryDateOfDeath"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="$Form1040SSPRData/SpouseDateOfDeath">
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Top Left Margin - Spouse Date of Death</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/SpouseDateOfDeath"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:call-template name="LinkToLeftoverDataTableInline">
				<xsl:with-param name="Desc">Top Left Margin - Non Paid Preparer Code</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1040PRData/NonPaidPreparerCd"/>
			  </xsl:call-template>
			  <xsl:call-template name="LinkToLeftoverDataTableInline">
				<xsl:with-param name="Desc">Top Left Margin - Refund Anticipation Loan Code</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1040PRData/RefundAnticipationLoanCd"/>
			  </xsl:call-template>
              <br/>
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:125mm;">
              <!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
              <div class="styMainTitle" style="height:8mm;font-size:10pt;">
                U.S. Self-Employment Tax Return (Including the Additional Child Tax<br/>
                Credit for Bona Fide Residents of Puerto Rico)
              </div>
              <div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;width:100%;">
                <span style="text-align:center;font-weight:bold;width:100%;">
                  <div style="width:100%;height:5mm;padding-left:5px;">
                    <div style="width:100%;height:5mm;">
                      U.S. Virgin Islands, Guam, American Samoa, the Commonwealth of the Northern<br/>
                      Mariana Islands, or Puerto Rico. For the year Jan. 1-Dec. 31, 2013,<br/>
                      or other tax year beginning
                      <span style="width:25mm;padding-left:3px;text-align:center;">
                        <xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
                      </span>
                      , and ending
                      <span style="width:25mm;padding-left:3px;text-align:center;">
                        <xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
                      </span>.<br/>
                      <img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>For information about Form 1040-SS and its instructions go to <a href="http://www.irs.gov/form1040ss"><i>www.irs.gov/form1040ss</i></a>.
                    </div>
                  </div>
                </span>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;border-left-width:2px;height:20mm;">
              <div class="styOMB" style="height:2mm;font-size:7pt;">OMB No. 1545-0090</div>
              <div class="styTY" style="padding-top:2mm;">20<span class="styTYColor">13</span>
              </div>
            </div>
          </div>
          <!--  End Header section 1 -->
          <div class="styBB" style="width:187mm;height:41mm;">
            <div class="styIRS1040SSPRCleanDiv" style="width:3%;height:100%;">
              <span style="width:100%;height:auto;padding-top:9.5mm;">
                <img src="{$ImagePath}/1040SS_Please_Print.gif" alt="Please Print"/>
              </span>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:97%;height:100%;border-left-width:1px;">
              <!-- Line 1 -->
              <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:20%;border-bottom-width:1px;">
                <div class="styIRS1040SSPRCleanDiv" style="width:38%;height:100%;border-right-width:1px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;auto;font-size:7pt;">
                    Your first name and initial
                  </div>
                  <span style="width:100%;height:auto;font-size:7pt;padding-left:3mm;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">Name</xsl:with-param>
                      <xsl:with-param name="BackupName">RtnHdrDataFilerName</xsl:with-param>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Header - Header - In Care Of Name</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
                    </xsl:call-template>
                  </span>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:38%;height:100%;border-right-width:1px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;">
                    Last name
                  </div>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:23.9%;height:100%;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;">
                    <b>Your social security number</b>
                  </div>
                  <span style="width:100%;height:auto;font-size:7pt;text-align:center;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                      <xsl:with-param name="EINChanged">true</xsl:with-param>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
              <!-- Line 2 -->
              <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:20%;border-bottom-width:1px;">
                <div class="styIRS1040SSPRCleanDiv" style="width:38%;height:100%;border-right-width:1px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;">
                    If a joint return, spouse's first name and initial
                  </div>               
                  <span style="width:100%;height:auto;font-size:7pt;padding-left:3mm;">
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">SpouseName</xsl:with-param>
                      </xsl:call-template>
                    <span style="width:4px;"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
                    </xsl:call-template>
                  </span>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:38%;height:100%;border-right-width:1px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;">
                    Last name
                  </div>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:23.9%;height:100%;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;">
                    <b>Spouse's social security number</b>
                  </div>
                  <span style="width:100%;height:auto;font-size:7pt;text-align:center;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
                      <xsl:with-param name="EINChanged">true</xsl:with-param>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
              <!-- Line 3 -->
              <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:20%;border-bottom-width:1px;">
                <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;">
                  Present home address (number, street, and apt. no., or rural route)
                </div>
                <span style="width:100%;height:auto;font-size:7pt;padding-left:3mm;">
                  <xsl:if test="$RtnHdrData/Filer/USAddress">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine2</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$RtnHdrData/Filer/ForeignAddress">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine2</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                </span>
              </div>
              <!-- Line 4 -->
              <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:20%;border-bottom-width:1px;">
                <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;">
                  City, town or post office, commonwealth or territory, and ZIP code
                </div>
                <span style="width:100%;height:auto;font-size:7pt;padding-left:3mm;">
                  <xsl:choose>
                    <xsl:when test="$RtnHdrData/Filer/ForeignAddress">
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">City</xsl:with-param>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
                      </xsl:call-template>
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
              </div>
              <!-- Line 5 -->
              <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:20%;">
                <div class="styIRS1040SSPRCleanDiv" style="width:38%;height:100%;border-right-width:1px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;">
                    Foreign country name
                  </div>                
                  <span style="width:100%;height:auto;font-size:7pt;padding-left:3mm;">
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">Country</xsl:with-param>
                        <xsl:with-param name="MainForm" select="true()"/>
                      </xsl:call-template>
                  </span>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:38%;height:100%;border-right-width:1px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;">
                    Foreign province/state/county
                  </div>
                  <span style="width:100%;height:auto;font-size:7pt;padding-left:3mm;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
                    </xsl:call-template>
                  </span>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:23.9%;height:100%;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;">
                    Foreign postal code
                  </div>
                  <span style="width:100%;height:auto;font-size:7pt;padding-left:3mm;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part I                                                -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;">Part I</div>
            <div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
              Total Tax and Credits
            </div>
          </div>
          <!-- Body -->
          <div class="styBB" style="width:187mm;">
            <!-- (1) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">1</div>
              <div class="styIRS1040SSPRLNDesc" style="width:181mm;height:auto;">
                <b>Filing status.</b> Check the box for your filing status (see instructions).<br/>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateEnumeratedCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/IndividualReturnFilingStatusCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataIndividualReturnFilingStatusCd[1]</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:2mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/IndividualReturnFilingStatusCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataIndividualReturnFilingStatusCd[1]</xsl:with-param>
                  </xsl:call-template>
                  Single
                </label>
                <br/>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateEnumeratedCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/IndividualReturnFilingStatusCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataIndividualReturnFilingStatusCd[2]</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:2mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/IndividualReturnFilingStatusCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataIndividualReturnFilingStatusCd[2]</xsl:with-param>
                  </xsl:call-template>
                  Married filing jointly
                </label>
                <br/>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateEnumeratedCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/IndividualReturnFilingStatusCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataIndividualReturnFilingStatusCd[3]</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:2mm;"/>
                <label style="font-size:8pt;">
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/IndividualReturnFilingStatusCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataIndividualReturnFilingStatusCd[3]</xsl:with-param>
                  </xsl:call-template>
                  Married filing separately. Enter spouse's social security no. above and full name here.
                  <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
                  <span style="width:58mm;border-width:0px 0px 1px 0px;border-style:solid;border-color:black;padding-left:2px;font-size:7pt;">
                    <xsl:if test="$Form1040SSPRData/SpousesName">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form1040SSPRData/SpousesName"/>
                      </xsl:call-template>
                    </xsl:if>
                  </span>
                </label>
              </div>
            </div>
            <!-- (2) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">2</div>
              <div class="styIRS1040SSPRLNDesc" style="width:181mm;height:auto;">
                <b>Qualifying children.</b> Complete <b>only</b> if you are a bona fide resident of Puerto Rico and you are claiming the additional child<br/>
                tax credit (see instructions).
              </div>
              <div class="styGenericDiv" style="width:3.2mm;float:right;">
                <!-- button display logic -->
                <xsl:call-template name="SetDynamicTableToggleButton">
                  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/QualifyingChildInfoSSPRGrp"/>
                  <xsl:with-param name="containerHeight" select="6"/>
                  <xsl:with-param name="containerID" select=" 'QualifyingChildInfoSSPRGrpDiv' "/>
                  <xsl:with-param name="headerRowCount" select="1"/>
                </xsl:call-template>
                <!-- end button display logic -->
              </div>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <!-- (Table) ///////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styTableContainerNBB" id="QualifyingChildInfoSSPRGrpDiv">
                <xsl:call-template name="SetInitialState"/>
                <table class="styTable" cellspacing="0" style="width:100%;">
                  <thead class="styTableThead">
                    <xsl:call-template name="QualifyingChildrenTableHeaders_1040SS"/>
                  </thead>
                  <tfoot/>
                  <tbody>
                    <xsl:for-each select="$Form1040SSPRData/QualifyingChildInfoSSPRGrp">
                      <xsl:if test="($Print != $Separated) or (count($Form1040SSPRData/QualifyingChildInfoSSPRGrp) &lt;=6)">
                        <xsl:call-template name="QualifyingChildrenTableRows_1040SS">
                          <xsl:with-param name="TargetNode" select="."/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:for-each>
                    <xsl:if test="count($Form1040SSPRData/QualifyingChildInfoSSPRGrp) &lt; 1 or ((count($Form1040SSPRData/QualifyingChildInfoSSPRGrp) &gt;6) and ($Print = $Separated))">
                      <xsl:call-template name="QualifyingChildrenTableRows_1040SS">
                        <xsl:with-param name="AddAdditionalDataMessage">true</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form1040SSPRData/QualifyingChildInfoSSPRGrp) &lt; 2 or ((count($Form1040SSPRData/QualifyingChildInfoSSPRGrp) &gt;6) and ($Print = $Separated))">
                      <xsl:call-template name="QualifyingChildrenTableRows_1040SS"/>
                    </xsl:if>
                    <xsl:if test="count($Form1040SSPRData/QualifyingChildInfoSSPRGrp) &lt; 3 or ((count($Form1040SSPRData/QualifyingChildInfoSSPRGrp) &gt;6) and ($Print = $Separated))">
                      <xsl:call-template name="QualifyingChildrenTableRows_1040SS"/>
                    </xsl:if>
                    <xsl:if test="count($Form1040SSPRData/QualifyingChildInfoSSPRGrp) &lt; 4 or ((count($Form1040SSPRData/QualifyingChildInfoSSPRGrp) &gt;6) and ($Print = $Separated))">
                      <xsl:call-template name="QualifyingChildrenTableRows_1040SS"/>
                    </xsl:if>
                    <xsl:if test="count($Form1040SSPRData/QualifyingChildInfoSSPRGrp) &lt; 5 or ((count($Form1040SSPRData/QualifyingChildInfoSSPRGrp) &gt;6) and ($Print = $Separated))">
                      <xsl:call-template name="QualifyingChildrenTableRows_1040SS"/>
                    </xsl:if>
                    <xsl:if test="count($Form1040SSPRData/QualifyingChildInfoSSPRGrp) &lt; 6 or ((count($Form1040SSPRData/QualifyingChildInfoSSPRGrp) &gt;6) and ($Print = $Separated))">
                      <xsl:call-template name="QualifyingChildrenTableRows_1040SS"/>
                    </xsl:if>
                  </tbody>
                </table>
              </div>
              <!-- Set Initial Height of Above Table -->
              <xsl:call-template name="SetInitialDynamicTableHeight">
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/QualifyingChildInfoSSPRGrp"/>
                <xsl:with-param name="containerHeight" select="6"/>
                <xsl:with-param name="headerRowCount" select="1"/>
                <xsl:with-param name="containerID" select=" 'QualifyingChildInfoSSPRGrpDiv' "/>
              </xsl:call-template>
              <!-- End Set Initial Height of Above Table -->
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <!-- (3) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">3</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    Self-employment tax from Part V, line 12.
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">3</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/SelfEmploymentTaxAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (4) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">4</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    Household employment taxes (see instructions). Attach Schedule H (Form 1040)
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">4</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/HouseholdEmploymentTaxAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
           <!-- (5) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">5</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    Additional Medicare Tax.  Attach Form 8959
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">5</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalAMRRTTaxAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (6) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">6</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    <b>Total tax.</b> Add lines 3 through 5 (see instructions)
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Part I, Line 6 - Repayment Of Advance Payment Received In Error Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrCd"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Part I, Line 6 - Repayment Of Advance Payment Received In Error Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrAmt"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">					
						<xsl:with-param name="Desc">Part I, Line 6 - Social Security Medicare Tax Unreported Tip Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/SocSecMedicareTaxUnrptdTipAmt"/>
					</xsl:call-template>
					<xsl:call-template name="LinkToLeftoverDataTableInline">					
						<xsl:with-param name="Desc">Part I, Line 6 - Tax On Tips Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/TaxOnTipsCd"/>
					</xsl:call-template>
					<xsl:call-template name="LinkToLeftoverDataTableInline">					
						<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Tax On Tips Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedTaxCd"/>
					</xsl:call-template>
					<xsl:call-template name="LinkToLeftoverDataTableInline">					
						<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Tax On Tips Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedSocSecTaxOnTipsAmt"/>
					</xsl:call-template>
					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedTaxCd"/>
					</xsl:call-template>
					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedSocSecMedTaxAmt"/>
					</xsl:call-template>
					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax GTLI Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedTaxCd"/>
					</xsl:call-template>
					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax GTLI Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedSocSecMedTaxGTLIAmt"/>
					</xsl:call-template>
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">6</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/TotalTaxAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (7) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">7</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    2013 estimated tax payments (see instructions)
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.3mm 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">7</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/EstimatedTaxPaymentsAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (8) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">8</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    Excess social security tax withheld (see instructions)
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.3mm 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">8</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ExSocSecTaxWithheldAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (9) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">9</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    Additional child tax credit from Part II, line 3
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.3mm 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">9</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ACTCBonaFideResidentsGrp/AdditionalChildTaxCreditAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (10) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">10</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    Health coverage tax credit. Attach Form 8885 
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Part I, Line 10 - Health Coverage Tax Credit Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/HealthCoverageTaxCreditGrp/HealthCoverageTaxCd"/>
                    </xsl:call-template>
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.3mm 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <xsl:choose>
					<xsl:when test="$Form1040SSPRData/HealthCoverageTaxCreditGrp">
						<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
						  <xsl:call-template name="CreateBox_1040SS">
							<xsl:with-param name="Number">10</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSPRData/HealthCoverageTaxCreditGrp/HealthCoverageTaxCreditAmt"/>
						  </xsl:call-template>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
						  <xsl:call-template name="CreateBox_1040SS">
							<xsl:with-param name="Number">10</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSPRData/HealthCoverageTaxCreditAmt"/>
						  </xsl:call-template>
						</div>
					</xsl:otherwise>	
				</xsl:choose>
              </div>
            </div>
            <!-- (11) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">11</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    <b>Total payments and credits</b> (see instructions)
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Part I, Line 11 - Request for Extension Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalPaymentsAmt/@requestForExtensionCd"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Part I, Line 11 - Request for Extension Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalPaymentsAmt/@requestForExtensionAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">11</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalPaymentsAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (12) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">12</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    If line 11 is more than line 6, subtract line 6 from line 11. This is the amount you <b>overpaid</b>
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">12</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/OverpaidAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (13a) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">13a</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    Amount of line 12 you want <b>refunded to you.</b> If Form 8888 is attached, check here
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:4px"/>
                      <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
                      <xsl:choose>
                        <xsl:when test="$Form1040SSPRData/Form8888Ind/@referenceDocumentId">
                          <span style="width:6px;"/>
                          <xsl:call-template name="SetFormLinkInline">
                            <xsl:with-param name="TargetNode" select="$Form1040SSPRData/Form8888Ind"/>
                          </xsl:call-template>
                          <span style="width:6px;"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <span style="width:2mm"/>
                        </xsl:otherwise>
                      </xsl:choose>
                      <input type="checkbox" class="styCkbox">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$Form1040SSPRData/Form8888Ind"/>
                          <xsl:with-param name="BackupName">Form1040SSPRDataForm8888Ind</xsl:with-param>
                        </xsl:call-template>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$Form1040SSPRData/Form8888Ind"/>
                          <xsl:with-param name="BackupName">Form1040SSPRDataForm8888Ind</xsl:with-param>
                        </xsl:call-template>
                      </label>
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">13a</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/RefundAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (13b-13c) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="height:auto;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">3.6mm;</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRLineItem" style="height:auto;">
              <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">b</div>
              <div class="styIRS1040SSPRLNDesc" style="width:25mm;">
                Routing Number
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:3mm;border-width:1px 1px 1px 1px;text-align:center;padding:2px 0px 0px 0px;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/RoutingTransitNumber"/>
                </xsl:call-template>
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:55mm;float:left;">
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
                <span class="styBoldText">c </span>Type:
                <span style="width:4px;"/>
                <input class="styCkbox" type="checkbox">
                  <xsl:call-template name="PopulateEnumeratedCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/BankAccountTypeCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataBankAccountTypeCd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/BankAccountTypeCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataBankAccountTypeCd</xsl:with-param>
                  </xsl:call-template>
                  Checking
                </label>
                <span style="width:3mm;"/>
                <input class="styCkbox" type="checkbox">
                  <xsl:call-template name="PopulateEnumeratedCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/BankAccountTypeCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataBankAccountTypeCd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/BankAccountTypeCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataBankAccountTypeCd</xsl:with-param>
                  </xsl:call-template>
                  Savings
                </label>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Height">5mm</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (13d) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">d</div>
              <div class="styIRS1040SSPRLNDesc" style="width:27mm;">
                Account Number
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:90mm;height:100%;border-width:1px 1px 1px 1px;text-align:center;padding-top:2px;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/DepositorAccountNumber"/>
                </xsl:call-template>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Height">5mm</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div class="styIRS1040SSPRLineItem" style="height:auto;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">3.6mm;</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (14) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">14</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    Amount of line 12 you want <b>applied to 2014 estimated tax</b>
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.3mm 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:8px"/>
                      <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">14</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/AppliedToESTaxAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (15) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">15</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    <b>Amount you owe.</b> If line 6 is more than line 11, subtract line 11 from line 6. For details on how<br/>
                    to pay, see instructions
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:8px"/>
                      <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:auto;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">15</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/AmountOwedAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Third Party Designee -->
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <div class="styBB" style="width:187mm;float:none;clear:both;">
            <div class="styIRS1040SSPRLineItem" style="height:8mm;">
              <!-- Header -->
              <div class="styIRS1040SSPRCleanDiv" style="width:18%;height:100%;">
                <span class="styBoldText" style="font-size:10pt;">Third Party<br/>Designee</span>
              </div>
              <!-- Body -->
              <div class="styIRS1040SSPRCleanDiv" style="width:81.8%;height:100%;font-size:7pt;">
                <div class="styIRS1040SSPRLineItem" style="width:100%;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;padding:0px 0px 0px 0px;font-size:7pt;">
                    Do you want to allow another person to discuss this return with the IRS (see instructions)?
                    <span style="width:4mm;"/>
                    <!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
                    <span style="width:1mm;"/>
                    <span>
                      <xsl:call-template name="PopulateSpan">
                        <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneeInd"/>
                      </xsl:call-template>
                      <input type="checkbox" class="styCkbox">
                        <xsl:if test="$Form1040SSPRData/ThirdPartyDesigneeInd">
                          <xsl:call-template name="PopulateYesCheckbox">
                            <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneeInd"/>
                            <xsl:with-param name="BackupName">IRS1040SSThirdPartyDesigneeInd</xsl:with-param>
                          </xsl:call-template>
                        </xsl:if>
                      </input>
                    </span>
                    <span style="width:2mm;"/>
                    <label>
                      <xsl:if test="$Form1040SSPRData/ThirdPartyDesigneeInd">
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneeInd"/>
                          <xsl:with-param name="BackupName">IRS1040SSThirdPartyDesigneeInd</xsl:with-param>
                        </xsl:call-template>
                      </xsl:if>
                      <b>Yes.</b> Complete the following.
                    </label>
                    <!-- ++++++++++++++ No Checkbox +++++++++++++ -->
                    <span style="width:1mm;"/>
                    <span>
                      <xsl:call-template name="PopulateSpan">
                        <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneeInd"/>
                      </xsl:call-template>
                      <input type="checkbox" class="styCkbox">
                        <xsl:if test="$Form1040SSPRData/ThirdPartyDesigneeInd">
                          <xsl:call-template name="PopulateNoCheckbox">
                            <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneeInd"/>
                            <xsl:with-param name="BackupName">IRS1040SSThirdPartyDesigneeInd</xsl:with-param>
                          </xsl:call-template>
                        </xsl:if>
                      </input>
                    </span>
                    <span style="width:2mm;"/>
                    <label>
                      <xsl:if test="$Form1040SSPRData/ThirdPartyDesigneeInd">
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneeInd"/>
                          <xsl:with-param name="BackupName">IRS1040SSThirdPartyDesigneeInd</xsl:with-param>
                        </xsl:call-template>
                      </xsl:if>
                      <span class="styBoldText">No</span>
                    </label>
                  </div>
                </div>
                <div class="styIRS1040SSPRLineItem" style="width:100%;">
                  <!-- Designee's name-->
                  <div class="styIRS1040SSPRLNDesc" style="width:13mm;padding:0px 0px 0px 0px;height:100%;font-size:7pt;">Designee's<br/>name</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:3mm;padding:12px 0px 0px 0px;height:100%;font-size:7pt;">
                    <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:54mm;padding:5px 0px 0px 0px;height:100%;text-align:left;font-size:7pt;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneeName"/>
                    </xsl:call-template>
                  </div>
                  <!-- Phone no.-->
                  <div class="styIRS1040SSPRLNDesc" style="width:7.5mm;padding:0px 0px 0px 0px;height:100%;font-size:7pt;">Phone<br/>no.</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:3mm;padding:12px 0px 0px 0px;height:100%;">
                    <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:25mm;padding:5px 0px 0px 0px;height:100%;text-align:center;font-size:7pt;">
                    <xsl:call-template name="PopulatePhoneNumber">
                      <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneePhone"/>
                    </xsl:call-template>
                  </div>
                  <!-- Personal identification number (PIN) -->
                  <div class="styIRS1040SSPRLNDesc" style="width:25mm;padding:0px 0px 0px 0px;height:100%;font-size:7pt;">Personal Identification<br/>Number (PIN)</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:3mm;padding:12px 0px 0px 0px;height:100%;">
                    <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:19mm;padding:5px 5px 6px 5px;height:100%;text-align:center;font-size:7pt;">
                    <div class="styIRS1040SSPRCleanDiv" style="border-width:1px 1px 1px 1px;border-color:black;text-align:center;width:15mm;height:auto;font-size:7pt;">
                      <xsl:call-template name="PopulatePin">
                        <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneePIN"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Sign Here -->
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <div class="styBB" style="width:187mm;float:none;clear:both;">
            <div class="styIRS1040SSPRLineItem" style="height:6mm;">
              <!-- Header -->
              <div class="styIRS1040SSPRCleanDiv" style="width:33.6mm;height:100%;">
                <span class="styBoldText" style="font-size:10pt;">Sign<br/>Here</span>
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:10mm;padding-top:14px;">
                  <div class="styIRS1040SSPRCleanDiv" style="width:28.5mm;height:10mm;">
                    Joint Return?<br/>
                    See instructions<br/>
                    Keep a copy<br/>
                    for your<br/>
                    records.
                  </div>
                  <div class="styIRS1040SSPRCleanDiv" style="width:5mm;height:10mm;padding-top:3px;">
                    <img src="{$ImagePath}/1040SS_Bullet_Lg.gif" alt="Large Bullet" width="15" height="49"/>
                  </div>
                </div>
              </div>
              <!-- Body -->
              <div class="styIRS1040SSPRCleanDiv" style="width:153mm;height:100%;">
                <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;padding:0px 0px 0px 0px;font-size:7pt;">
                  Under penalties of perjury, I declare that I have examined this return and accompanying schedules and statements, and to the best of my knowledge
                  and belief, they are true, correct, and complete. Declaration of preparer (other than the taxpayer) is based on all information of which the preparer has
                  any knowledge.
                </div>
                <!-- Container -->
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:22mm;">
                  <!-- Line 1 -->
                  <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:10mm;border-bottom-width:1px;border-color:black;">
                    <!-- Your Signature -->
                    <div class="styIRS1040SSPRLNDesc" style="width:55mm;height:100%;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
                      Your signature<br/>
                      <span style="width:100%;padding-top:6px;">
                        <xsl:call-template name="PopulatePin">
                          <xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN"/>
                          <xsl:with-param name="BackupName">RtnHdrDataPrimarySignature</xsl:with-param>
                        </xsl:call-template>
                      </span>
                    </div>
                    <!-- Date -->
                    <div class="styIRS1040SSPRLNDesc" style="width:16mm;height:100%;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
                      <span style="width:100%;padding-left:4px;">Date</span>
                      <span style="width:100%;padding-top:6px;text-align:center;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
                          <xsl:with-param name="BackupName">RtnHdrDataPrimarySignatureDate</xsl:with-param>
                        </xsl:call-template>
                      </span>
                    </div>
                    <!-- Daytime phone number -->
                    <div class="styIRS1040SSPRLNDesc" style="width:35mm;height:100%;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
                      <span style="width:100%;padding-left:4px;">Daytime phone number</span>
                      <span style="width:100%;padding-top:6px;text-align:center;">
                        <xsl:choose>
                          <xsl:when test="$Form1040SSPRData/DaytimePhoneNumber">
                            <xsl:call-template name="PopulatePhoneNumber">
                              <xsl:with-param name="TargetNode" select="$Form1040SSPRData/DaytimePhoneNumber"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ForeignPhoneNumber"/>
                            </xsl:call-template>
                          </xsl:otherwise>
                        </xsl:choose>
                      </span>
                    </div>
                    <!-- Identity protection Pin -->
                    <div class="styIRS1040SSPRLNDesc" style="width:38mm;height:100%;border-color:black;padding-left:0px;font-size:7pt;">
                      <span style="width:100%;padding-left:4px;">If the IRS sent you an Identity Protection PIN, enter it here (see inst.)</span>
                    <span style="width:100%;padding-top:1px;text-align:center;">
                        <xsl:call-template name="PopulatePin">
                          <xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
                          <xsl:with-param name="BackupName">RtnHdrDataIdentityProtectionPIN"</xsl:with-param>
                        </xsl:call-template>
                     </span>
                    </div>
                  </div>
                  <!-- Line 2 -->
                  <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:10mm;">
                    <!-- Spouse's signature -->
                    <div class="styIRS1040SSPRLNDesc" style="width:90mm;height:100%;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
                      Spouse's signature. If a joint return, <b>both</b> must sign.<br/>
                      <span style="width:100%;padding-top:6px;">
                        <xsl:call-template name="PopulatePin">
                          <xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignaturePIN"/>
                          <xsl:with-param name="BackupName">RtnHdrDataSpouseSignature</xsl:with-param>
                        </xsl:call-template>
                      </span>
                    </div>
                    <!-- Date -->
                    <div class="styIRS1040SSPRLNDesc" style="width:16mm;height:100%;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
                      <span style="width:100%;padding-left:4px;">Date</span>
                      <span style="width:100%;padding-top:6px;text-align:center;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDt"/>
                          <xsl:with-param name="BackupName">RtnHdrDataSpouseSignatureDate</xsl:with-param>
                        </xsl:call-template>
                      </span>
                    </div>
                    <!-- Identity protection Pin -->
                    <div class="styShadingCell" style="width:47mm;height:100%;padding-left:0px;border-left-width:0px;font-size:7pt;">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Paid Preparer Use Only -->
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <div class="styTBB" style="width:187mm;font-size:6.5pt;font-family:arial;float:none;clear:both;" >
            <div style="width:22.6mm;padding-top:4mm;float:left;clear:none;">
              <span class="styMainTitle" style="font-size:11pt;">
                Paid
                Preparer
                Use Only
              </span>
            </div>
            <div style="width:164mm;float:left;clear:none;border-width:0px 0px 0px 1px; border-color:black;border-style:solid;">
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;height:100%">
                <div class="styLNDesc" style="height:100%;width:46.8mm;padding-top:0mm;border-right:1 solid black;padding-left:3px;">
                Print/Type preparer's name<br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
                    <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:100%;width:46.5mm;padding-top:0mm;border-right:1 solid black;padding-left:1mm;">
                Preparer's signature
              </div>
                <div class="styLNDesc" style="height:100%;width:15mm;border-right:1 solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
                  <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                    <xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
                    <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:100%;width:18mm;border-right:1 solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
                    </xsl:call-template>
                    Check 
                    <input class="styCkbox" type="checkbox" style="width:4mm;">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <span style="width:4px;"/>if<br/>self-employed 
                  </label>
                </div>
                <div class="styLNDesc" style="height:6mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                             <br/>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">PTIN</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">STIN</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:6mm;width:108.5mm;border-right:1 solid black;">
                  <span class="styGenericDiv" style="padding-left:3px;">Firm's name 
                  <span style="width:2.2mm;"/>
                    <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
                    <span style="width:4px;"/>
                  </span>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
                  <span style="width:4px;"/>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReason">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;">
                <div class="styLNDesc" style="width:108.5mm;border-right:1 solid black;">
                  <div class="styGenericDiv" style="padding-right:.5mm;padding-left:3px;">Firm's address 
                  <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
                  </div>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">City</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">State</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">City</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCode</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">Country</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountry</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                  </div>
                </div>
                <div class="styLNDesc" style="width:32mm;padding-left:1mm;"> Phone no. 
                <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                    <xsl:with-param name="TargetNode">Phone</xsl:with-param>
                    <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
                  </xsl:call-template>
                  <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                    <xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
                    <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;">
              <span class="styBoldText">
                For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see instructions.
              </span>
            </div>
            <div style="float:right;">
              <span style="width:50px;"/>  
                Form 
              <span class="styBoldText" style="font-size:8pt;">
                <xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
                  1040-SS
                </xsl:if>
                <xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
                  1040-PR
                </xsl:if>
              </span> (2013)
            </div>
            <div style="float:right;text-align:center;width:26mm;font-size:7pt;">
              Cat. No. 17184B
            </div>
          </div>
          <!-- END Page Break and Footer-->
          <!-- BEGIN Page Header -->
          <div class="styTBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">
              Form 
                <xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
                  1040-SS
                </xsl:if>
                <xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
                  1040-PR
                </xsl:if>
              (2013)<span style="width:148mm;"/>
            </div>
            <div style="float:right;">
              Page <span style="font-weight:bold;font-size:8pt;">2</span>
            </div>
          </div>
          <!-- END Page Header -->
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part II                                                 -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;">Part II</div>
            <div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
              Bona Fide Residents of Puerto Rico Claiming Additional Child Tax Credit
              <img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>
              <span class="styNormalText">See instructions.</span>
            </div>
          </div>
          <div class="styBB" style="width:187mm;font-size:7pt;">
            <b>Caution.</b> You must have three or more qualifying children to claim the additional child tax credit.          
          </div>
         
          <!-- Body -->
          <div class="styBB" style="width:187mm;">
            <div class="styIRS1040SSPRLineItem">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">4mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (1) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">1</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    Income derived from sources within Puerto Rico
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">1</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ACTCBonaFideResidentsGrp/PuertoRicoIncomeAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div class="styIRS1040SSPRLineItem">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">4mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (2) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">2</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    Withheld social security and Medicare taxes from Forms 499R-2/W-2PR (attach copy of form(s))
                  </div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">2</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ACTCBonaFideResidentsGrp/TotalSocSecAndMedcrWithheldAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (3) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">3</div>
              <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    <b>Additional child tax credit.</b> Use the worksheet in the instructions to figure the amount to enter here<br/>
                    and in Part I, line 9
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:5px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:auto;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">3</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ACTCBonaFideResidentsGrp/AdditionalChildTaxCreditAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part III                                                -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Body -->
          <xsl:for-each select="$Form1040SSPRData/FarmingProfitLoss">
			<xsl:if test="position() &gt; 1">
				<div class="pageEnd"/>
			</xsl:if>
            <xsl:call-template name="PopulateProfitOrLossFromFarmingSection_1040SS">
              <xsl:with-param name="TargetNode" select="."/>
            </xsl:call-template>
          </xsl:for-each>
          <xsl:if test="count($Form1040SSPRData/FarmingProfitLoss) = 0">
            <xsl:call-template name="PopulateProfitOrLossFromFarmingSection_1040SS"/>
          </xsl:if>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part IV                                                 -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Body -->
          <xsl:for-each select="$Form1040SSPRData/ProfitLossFromBusiness">
			<xsl:if test="count($Form1040PRData/ProfitLossFromBusiness) &gt; 1">
				<div class="pageEnd"/>
			</xsl:if>
            <xsl:call-template name="PopulateProfitLossFromBusinessSection_1040SS">
              <xsl:with-param name="TargetNode" select="."/>
            </xsl:call-template>
          </xsl:for-each>
          <xsl:if test="count($Form1040SSPRData/ProfitLossFromBusiness) = 0">
            <xsl:call-template name="PopulateProfitLossFromBusinessSection_1040SS"/>
          </xsl:if>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:right;">
              <span style="width:50px;"/>  
                Form 
              <span class="styBoldText" style="font-size:8pt;">
                <xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
                  1040-SS
                </xsl:if>
                <xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
                  1040-PR
                </xsl:if>
              </span> (2013)
            </div>
          </div>
          <!-- END Page Break and Footer-->
          <!-- BEGIN Page Header -->
          <div class="styTBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">
              Form 
                <xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
                  1040-SS
                </xsl:if>
                <xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
                  1040-PR
                </xsl:if>              
              (2013)<span style="width:148mm;"/>
            </div>
            <div style="float:right;">
              Page <span style="font-weight:bold;font-size:8pt;">4</span>
            </div>
          </div>
          <!-- END Page Header -->
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part V                                                -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <xsl:for-each select="$Form1040SSPRData/SelfEmploymentTaxGrp">
			<xsl:if test="position() &gt; 1">
				<div class="pageEnd"/>
			</xsl:if>
            <xsl:call-template name="PopulateSelfEmploymentTaxSection_1040SS">
              <xsl:with-param name="TargetNode" select="."/>
            </xsl:call-template>
          </xsl:for-each>
          <xsl:if test="count($Form1040SSPRData/SelfEmploymentTaxGrp) = 0">
            <xsl:call-template name="PopulateSelfEmploymentTaxSection_1040SS"/>
          </xsl:if>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:right;">
              <span style="width:50px;"/>  
                Form 
              <span class="styBoldText" style="font-size:8pt;">
                <xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
                  1040-SS
                </xsl:if>
                <xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
                  1040-PR
                </xsl:if>              
              </span> (2013)
            </div>
          </div>
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <xsl:variable name="TableWidth">130</xsl:variable>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form1040SSPRData"/>
              <xsl:with-param name="DescWidth" select="$TableWidth"/>
            </xsl:call-template>
            <xsl:if test="$Form1040SSPRData/PrimaryDateOfDeath">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Top Left Margin - Primary Date of Death</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/PrimaryDateOfDeath"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form1040SSPRData/SpouseDateOfDeath">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Top Left Margin - Spouse Date of Death</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/SpouseDateOfDeath"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Top Left Margin - Non Paid Preparer Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/NonPaidPreparerCd"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Top Left Margin - Refund Anticipation Loan Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1040SSPRData/RefundAnticipationLoanCd"/>
              <xsl:with-param name="DescWidth" select="$TableWidth"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
              <xsl:with-param name="DescWidth" select="$TableWidth"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Header - Header - In Care Of Name</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
              <xsl:with-param name="DescWidth" select="$TableWidth"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
              <xsl:with-param name="DescWidth" select="$TableWidth"/>
            </xsl:call-template>
            <xsl:for-each select="$Form1040SSPRData/QualifyingChildInfoSSPRGrp">
              <xsl:variable name="Num">
                <xsl:number value="position()" format="1"/>
              </xsl:variable>
              <xsl:if test="QualifyingChildNameControl">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part I - Line 2 - Qualifying Child Name Control (Row <xsl:value-of select="$Num"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="QualifyingChildNameControl"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>
              </xsl:if>
            </xsl:for-each>
              <xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Part I, Line 5 - Repayment Of Advance Payment Received In Error Code</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrCd"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRowAmount">
				<xsl:with-param name="Desc">Part I, Line 5 - Repayment Of Advance Payment Received In Error Amount</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrAmt"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part I - Line 5 - Tax On Tips Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/TaxOnTipsCd"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRowAmount">
                <xsl:with-param name="Desc">Part I - Line 5 - Social Security Medicare Tax Unreported Tip Amount</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/SocSecMedicareTaxUnrptdTipAmt"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part I - Line 5 - Uncollected Social Security Tax On Tips Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedTaxCd"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRowAmount">
                <xsl:with-param name="Desc">Part I - Line 5 - Uncollected Social Security Tax On Tips Amount</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedSocSecTaxOnTipsAmt"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part I - Line 5 - Uncollected Social Security Medicare Tax Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedTaxCd"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRowAmount">
                <xsl:with-param name="Desc">Part I - Line 5 - Uncollected Social Security Medicare Tax Amount</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedSocSecMedTaxAmt"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part I - Line 5 - Uncollected Social Security Medicare Tax GTLI Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedTaxCd"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRowAmount">
                <xsl:with-param name="Desc">Part I - Line 5 - Uncollected Social Security Medicare Tax GTLI Amount</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedSocSecMedTaxGTLIAmt"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRow">
				  <xsl:with-param name="Desc">Part I - Line 9 - Health Coverage Tax Credit Code</xsl:with-param>
				  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/HealthCoverageTaxCreditGrp/HealthCoverageTaxCd"/>
				  <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Part I, Line 11 - Request for Extension Code</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalPaymentsAmt/@requestForExtensionCd"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRowAmount">
				<xsl:with-param name="Desc">Part I, Line 11 - Request for Extension Amount</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalPaymentsAmt/@requestForExtensionAmt"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>              
            <xsl:for-each select="$Form1040SSPRData/FarmingProfitLoss">
              <!--<xsl:for-each select="FarmExpenses/OtherExpenses">
                <xsl:if test="TotalPreproductivePeriodExpnss">
                  <xsl:call-template name="PopulateLeftoverRow">
                    <xsl:with-param name="Desc">Part III - Section B - Line 34(e) - Total Preproductive Period Expenses</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="TotalPreproductivePeriodExpnss"/>
                    <xsl:with-param name="DescWidth" select="$TableWidth"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="TotalPreproductivePeriodExpnss/@section263AIndicator">
                  <xsl:call-template name="PopulateLeftoverRow">
                    <xsl:with-param name="Desc">Part III - Section B - Line 34(e) - Section 263 A Indicator</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="TotalPreproductivePeriodExpnss/@section263AIndicator"/>
                    <xsl:with-param name="DescWidth" select="$TableWidth"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:for-each>-->
              <xsl:if test="FarmExpenses/NetFarmProfitOrLoss/@passiveActivityLossLiteralCd">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part III - Section B - Line 36 - Passive Activity Loss Literal Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="FarmExpenses/NetFarmProfitOrLoss/@passiveActivityLossLiteralCd"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>
              </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="$Form1040SSPRData/SelfEmploymentTaxGrp">
              <xsl:if test="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part V - Line 3 - Self-Employment Tax Exempt Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part V - Line 3 - Self-Employment Tax Exempt Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part V - Line 3 - Chap 11 Bankruptcy Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part V - Line 3 - Chap 11 Bankruptcy Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseCd">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part V - Line 3 - Community Income Taxed To Spouse Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseCd"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseAmt">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part V - Line 3 - Community Income Taxed To Spouse Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseAmt"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part V - Line 3 - Exempt Community Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part V - Line 3 - Exempt Community Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part V - Line 3 - Additional Income Or Loss Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part V - Line 3 - Additional Income Or Loss Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>
              </xsl:if>
            </xsl:for-each>
          </table>
          <xsl:for-each select="$Form1040SSPRData/FarmingProfitLoss">
            <xsl:if test="FarmIncomeAccrualMethod and (count(FarmIncomeAccrualMethod/OtherIncomeGrp) &gt; 0)">
              <br/>
              <br/>
              <span class="styRepeatingDataTitle">
                Form 
                <xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
                  1040-SS
                </xsl:if>
                <xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
                  1040-PR
                </xsl:if>                
                , Part III - Section C - Line 43 - Other Farm Income<br/>
                Name of proprietor:<br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NameOfFarmProprietor/BusinessNameLine1"/>
                </xsl:call-template>
                <xsl:if test="NameOfFarmProprietor/BusinessNameLine2">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NameOfFarmProprietor/BusinessNameLine2"/>
                  </xsl:call-template>
                </xsl:if>
              </span>
              <xsl:variable name="CellStyle">border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-left:0px;padding-right:0px;</xsl:variable>
              <table class="styDepTbl" cellspacing="0">
                <thead>
                  <tr class="styDepTblHdr">
                    <th class="styIRS1040SSPRTableCell" scope="col">
                      <xsl:attribute name="style">width:50%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
                      Other Income Type
                    </th>
                    <th class="styIRS1040SSPRTableCell" scope="col">
                      <xsl:attribute name="style">width:50%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
                      Other Income Including<br/>Gas Fuel Tax Credit
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="FarmIncomeAccrualMethod/OtherIncomeGrp">
                    <tr style="font-size:7pt;font-family:arial;">
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <!-- ++++++++++++++++++++++++++++++++++ -->
                      <td class="styIRS1040SSPRTableCell">
                        <xsl:attribute name="style">
                          width:50%;text-align:left;
                          <xsl:if test="position() = last()">
                            border-bottom-width:0px;
                          </xsl:if></xsl:attribute>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="OtherIncomeType"/>
                        </xsl:call-template>
                      </td>
                      <!-- ++++++++++++++++++++++++++++++++++ -->
                      <td class="styIRS1040SSPRTableCell">
                        <xsl:attribute name="style">
                          width:50%;text-align:right;
                          <xsl:if test="position() = last()">
                            border-bottom-width:0px;
                          </xsl:if></xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="OtherIncmIncludingGasFuelTaxCr"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </xsl:if>
          </xsl:for-each>
          <!-- Separated Data for Part I - Qualifying Children -->
          <xsl:if test="($Print = $Separated) and  (count($Form1040SSPRData/QualifyingChildInfoSSPRGrp) &gt; 6)">
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">
              Form 
                <xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
                  1040-SS
                </xsl:if>
                <xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
                  1040-PR
                </xsl:if>              
              , Part I - Qualifying Children
            </span>
            <table class="styDepTbl" cellspacing="0">
              <thead class="styTableThead">
                <xsl:call-template name="QualifyingChildrenTableHeaders_1040SS">
                  <xsl:with-param name="AddColoredHeaders">true</xsl:with-param>
                </xsl:call-template>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form1040SSPRData/QualifyingChildInfoSSPRGrp">
                  <xsl:call-template name="QualifyingChildrenTableRows_1040SS">
                    <xsl:with-param name="TargetNode" select="."/>
                    <xsl:with-param name="AddColoredRows">true</xsl:with-param>
                  </xsl:call-template>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
        </form>
      </body>
    </html>
  </xsl:template>
  <!-- ////////////////////////////////////////////////////////////// (Template:  CreateBox_1040SS) -->
  <xsl:template name="CreateBox_1040SS">
    <xsl:param name="TargetNode"/>
    <xsl:param name="AmountBoxStyle"/>
    <xsl:param name="PopulateAsText"/>
    <xsl:param name="AddParentheses"/>
    <xsl:param name="StaticText"/>
    <xsl:param name="Number"/>
    <xsl:param name="NumberBoxStyle"/>
    <xsl:param name="Width">29mm</xsl:param>
    <xsl:param name="Height">5mm</xsl:param>
    <div class="styLNAmountBox">
      <xsl:attribute name="style">
        width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:7pt;
        <xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:2px;</xsl:when><xsl:otherwise>padding-top:4px;</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:3px;</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:choose>
        <xsl:when test="$TargetNode">
          <xsl:if test="$AddParentheses">
            (<span style="width:5px;"/>
          </xsl:if>
          <xsl:choose>
            <xsl:when test="$PopulateAsText">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$TargetNode"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$TargetNode"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="$TargetNode/@referenceDocumentId">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$TargetNode"/>
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="$AddParentheses">
            <span style="width:5px;"/>)
          </xsl:if>
        </xsl:when>
        <xsl:when test="$StaticText">
          <xsl:value-of select="$StaticText"/>
        </xsl:when>
        <xsl:when test="not($TargetNode) and not($StaticText) and $AddParentheses">
          (<span style="width:23mm;"/>)
        </xsl:when>
      </xsl:choose>
    </div>
    <div class="styLNRightNumBox">
      <xsl:attribute name="style">
        float:right;
        padding:2px 0px 0px 0px;
        border-right-width:0px;font-size:8pt;
        height:<xsl:value-of select="$Height"/>;
        <xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$Number">
        <xsl:value-of select="$Number"/>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- ////////////////////////////////////////////////////////////// (Template:  GenerateEmptyItems_1040SS) -->
  <xsl:template name="GenerateEmptyItems_1040SS">
    <xsl:param name="Number"/>
    <xsl:param name="MaxCount"/>
    <xsl:param name="LineEData"/>
    <xsl:if test="$Number and ($Number &lt;= $MaxCount)">
      <xsl:choose>
		<xsl:when test="$Number = 5 and $LineEData and $LineEData/TotalPreproductivePeriodExpnss">
			<div class="styIRS1040SSPRLineItem">
				<div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">
					<xsl:number value="$Number" format="a"/>
				</div>
				<div class="styIRS1040SSPRLNDesc" style="width:47mm;height:5mm;">
					<span style="width:43mm;height:100%;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$LineEData/TotalPreproductivePeriodExpnss/@section263AIndicatorCd"/>
						</xsl:call-template>
					</span>
				</div>
				<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:call-template name="CreateBox_1040SS">
							<xsl:with-param name="Number">
								<xsl:value-of select="concat('34', 'e')"/>
							</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$LineEData/TotalPreproductivePeriodExpnss"/>
							<xsl:with-param name="AmountBoxStyle">
								border-bottom-width:0px;
							</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">
								border-bottom-width:0px;
							</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
			</div>
		</xsl:when>
        <xsl:when test="$Number = $MaxCount">
          <xsl:call-template name="CreateOtherExpensesItem_1040SS">
            <xsl:with-param name="Letter">
              <xsl:number value="$Number" format="a"/>
            </xsl:with-param>
            <xsl:with-param name="LineEData" select="$LineEData"/>
            <xsl:with-param name="Style">border-bottom-width:0px;</xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="CreateOtherExpensesItem_1040SS">
            <xsl:with-param name="Letter">
              <xsl:number value="$Number" format="a"/>
            </xsl:with-param>
            <xsl:with-param name="LineEData" select="$LineEData"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:call-template name="GenerateEmptyItems_1040SS">
        <xsl:with-param name="Number" select="$Number + 1"/>
        <xsl:with-param name="MaxCount" select="$MaxCount"/>
        <xsl:with-param name="LineEData" select="$LineEData"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <!-- ////////////////////////////////////////////////////////////// (Template:  GenerateEmptyOtherBusinessExpensesItems_1040SS) -->
  <xsl:template name="GenerateEmptyOtherBusinessExpensesItems_1040SS">
    <xsl:param name="Number"/>
    <xsl:param name="MaxCount"/>
    <xsl:if test="$Number and ($Number &lt;= $MaxCount)">
      
      <div class="styIRS1040SSPRCleanDiv" style="float:none;width:90mm;height:auto;padding:0px 0px 0px 0px;padding-left:5mm">
              <div class="styIRS1040SSPRLNDesc" style="float:none;width:auto;padding-top:0;padding-bottom:0">
				  <div class="styGenericDiv" style="width:55.7%;border-bottom:1px dashed black"/>
				  <div class="styGenericDiv" style="background-color:lightgrey;width:9.9%;height:100%;border-left:1px solid black;border-right:1px solid black"/>
				  <div class="styGenericDiv" style="padding-left:6.0mm;float:right;width:34%;font-size:7pt;"/>
			   </div>
		</div>
              
      <xsl:call-template name="GenerateEmptyOtherBusinessExpensesItems_1040SS">
        <xsl:with-param name="Number" select="$Number + 1"/>
        <xsl:with-param name="MaxCount" select="$MaxCount"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <!-- ////////////////////////////////////////////////////////////// (Template:  CreateOtherExpensesItem_1040SS) -->
  <xsl:template name="CreateOtherExpensesItem_1040SS">
    <xsl:param name="TargetNode"/>
    <xsl:param name="Style"/>
    <xsl:param name="LineEData"/>
    <xsl:param name="Letter"/>
    <div class="styIRS1040SSPRLineItem">
      <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">
        <xsl:value-of select="$Letter"/>
      </div>
      <div class="styIRS1040SSPRLNDesc" style="width:47mm;height:5mm;">
        <span style="width:43mm;height:100%;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
          <xsl:if test="$TargetNode">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$TargetNode/Description"/>
            </xsl:call-template>
          </xsl:if>
        </span>
      </div>
      <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
        <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
          <xsl:choose>
            <xsl:when test="$TargetNode">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Number">
                  <xsl:value-of select="concat('34', $Letter)"/>
                </xsl:with-param>
                <xsl:with-param name="TargetNode" select="$TargetNode/Amount"/>
                <xsl:with-param name="AmountBoxStyle">
                  <xsl:value-of select="$Style"/>
                </xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">
                  <xsl:value-of select="$Style"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Number">
                  <xsl:value-of select="concat('34', $Letter)"/>
                </xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">
                  <xsl:value-of select="$Style"/>
                </xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">
                  <xsl:value-of select="$Style"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </div>
      </div>
    </div>
  </xsl:template>
  <!-- ////////////////////////////////////////////////////////////// (Template:  CreateOtherBusinessExpensesItem_1040SS) -->
  <xsl:template name="CreateOtherBusinessExpensesItem_1040SS">
    <xsl:param name="TargetNode"/>
    <xsl:param name="Style"/>
    <div class="styIRS1040SSPRLineItem" style="">
      <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;"/>
      <div class="styIRS1040SSPRLNDesc" style="width:47mm;height:100%;">
        <span style="width:43mm;height:100%;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
          <xsl:if test="$TargetNode">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$TargetNode/Description"/>
            </xsl:call-template>
            <xsl:if test="$TargetNode/@referenceDocumentName">
              <span style="width:4px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$TargetNode"/>
              </xsl:call-template>
            </xsl:if>
          </xsl:if>
        </span>
      </div>
      <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
        <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
          <xsl:choose>
            <xsl:when test="$TargetNode">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="TargetNode" select="$TargetNode/Amount"/>
                <xsl:with-param name="AmountBoxStyle">
                  border-bottom-width:0px;<xsl:value-of select="$Style"/>;height:100%
                </xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">
                  border-bottom-width:0px;<xsl:value-of select="$Style"/>;background-color:lightgrey;height:100%
                </xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">
                  border-bottom-width:0px;<xsl:value-of select="$Style"/>;height:100%
                </xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">
                  border-bottom-width:0px;<xsl:value-of select="$Style"/>;background-color:lightgrey;height:100%
                </xsl:with-param>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </div>
      </div>
    </div>
  </xsl:template>
  <!-- ////////////////////////////////////////////////////////////// (Template: QualifyingChildrenTableHeaders_1040SS) -->
  <xsl:template name="QualifyingChildrenTableHeaders_1040SS">
    <xsl:param name="AddColoredHeaders"/>
    <xsl:variable name="CommonStyle">border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-left:0px;padding-right:0px;</xsl:variable>
    <tr>
      <xsl:if test="$AddColoredHeaders">
        <xsl:attribute name="class">styDepTblHdr</xsl:attribute>
      </xsl:if>
      <th class="styIRS1040SSPRTableCell" scope="col">
        <xsl:attribute name="style">width:60%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        (a)<span class="styNormalText"> First name<span style="width:10mm;"/>Last name</span>
      </th>
      <th class="styIRS1040SSPRTableCell" scope="col">
        <xsl:attribute name="style">width:20%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        (b)<span class="styNormalText"> Child's<br/>identifying number</span>
      </th>
      <th class="styIRS1040SSPRTableCell" scope="col">
        <xsl:attribute name="style">width:20%;<xsl:value-of select="$CommonStyle"/>;border-right-width:0px;</xsl:attribute>
        (c)<span class="styNormalText"> Child's<br/>relationship to you</span>
      </th>
    </tr>
  </xsl:template>
  <!-- ////////////////////////////////////////////////////////////// (Template: QualifyingChildrenTableRows_1040SS) -->
  <xsl:template name="QualifyingChildrenTableRows_1040SS">
    <xsl:param name="TargetNode"/>
    <xsl:param name="AddColoredRows"/>
    <xsl:param name="AddAdditionalDataMessage"/>
    <!-- IsLast -->
    <xsl:variable name="IsLast">
      <xsl:if test="$TargetNode and (position() = last())">
        border-bottom-width:0px;
      </xsl:if>
    </xsl:variable>
    <!-- ClassType -->
    <xsl:variable name="ClassType">
      <xsl:choose>
        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <tr style="font-size:7pt;font-family:arial;">
      <xsl:if test="$AddColoredRows">
        <xsl:attribute name="class"><xsl:value-of select="$ClassType"/></xsl:attribute>
      </xsl:if>
      <!-- First/Last Name +++++++++++++ -->
      <td class="styIRS1040SSPRTableCell">
        <xsl:attribute name="style">width:60%;text-align:left;<xsl:value-of select="$IsLast"/></xsl:attribute>
        <xsl:if test="$TargetNode">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="QualifyingChildFirstName"/>
          </xsl:call-template>
          <span style="width:3mm;"/>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="QualifyingChildLastName"/>
          </xsl:call-template>
          <xsl:if test="$TargetNode/QualifyingChildNameControl">
            <span style="width:3mm;"/>
            <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">Part I, Line 2 - Qualifying Child <xsl:number value="position()"/> Name Control</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$TargetNode/QualifyingChildNameControl"/>
            </xsl:call-template>
          </xsl:if>
        </xsl:if>
        <xsl:if test="not($TargetNode)">
          <span style="width:4px"/>
        </xsl:if>
        <xsl:if test="$AddAdditionalDataMessage">
          <xsl:if test="((count($Form1040SSPRData/QualifyingChildInfoSSPRGrp) &gt;6) and ($Print = $Separated))">
            <xsl:call-template name="PopulateAdditionalDataTableMessage">
              <xsl:with-param name="TargetNode" select="$Form1040SSPRData/QualifyingChildInfoSSPRGrp"/>
            </xsl:call-template>
          </xsl:if>
        </xsl:if>
      </td>
      <!-- (a) +++++++++++++++++++++++ -->
      <td class="styIRS1040SSPRTableCell">
        <xsl:attribute name="style">width:20%;text-align:center;<xsl:value-of select="$IsLast"/></xsl:attribute>
        <xsl:if test="$TargetNode">
          <xsl:call-template name="PopulateSSN">
            <xsl:with-param name="TargetNode" select="QualifyingChildIdentifyingNum"/>
          </xsl:call-template>
        </xsl:if>
        <xsl:if test="not($TargetNode)">
          <span style="width:4px"/>
        </xsl:if>
      </td>
      <!-- (b) +++++++++++++++++++++++ -->
      <td class="styIRS1040SSPRTableCell">
        <xsl:attribute name="style">width:20%;text-align:left;border-right-width:0px;<xsl:value-of select="$IsLast"/></xsl:attribute>
        <xsl:if test="$TargetNode">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ChildRelationshipSSPRCd"/>
          </xsl:call-template>
        </xsl:if>
        <xsl:if test="not($TargetNode)">
          <span style="width:4px"/>
        </xsl:if>
      </td>
    </tr>
  </xsl:template>
  <!-- ////////////////////////////////////////////////////////////// (Template: PopulateProfitOrLossFromFarmingSection_1040SS) -->
  <xsl:template name="PopulateProfitOrLossFromFarmingSection_1040SS">
    <xsl:param name="TargetNode" select="/.."/>
    <!-- Header -->
    <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
      <!-- Content -->
      <div class="styPartName" style="width:15mm;">Part III</div>
      <div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
        Profit or Loss From Farming
        <img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>
        <span class="styNormalText">See the instructions for Schedule F (Form 1040).</span>
      </div>
    </div>
    <!-- Body -->
    <div class="styBB" style="width:187mm;">
      <!-- Name and SSN section -->
      <div class="styIRS1040SSPRLineItem" style="height:8mm;border-bottom-width:1px;border-color:black;">
        <div class="styIRS1040SSPRLNDesc" style="width:80%;height:100%;padding-left:0px;font-size:7.5pt;">
          <span style="width:100%;height:auto;">Name of proprietor</span>
          <span style="width:100%;height:auto;">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$TargetNode/NameOfFarmProprietor/BusinessNameLine1"/>
              </xsl:call-template>
              <xsl:if test="$TargetNode/NameOfFarmProprietor/BusinessNameLine2">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$TargetNode/NameOfFarmProprietor/BusinessNameLine2"/>
                </xsl:call-template>
              </xsl:if>
            </xsl:if>
          </span>
        </div>
        <div class="styIRS1040SSPRLNDesc" style="width:20%;height:100%;border-left-width:1px;padding-left:0px;border-color:black;font-size:7.5pt;">
          <span class="styBoldText" style="width:100%;height:auto;padding-left:4px;">Social security number</span>
          <span style="width:100%;height:auto;text-align:center;">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="$TargetNode/SSN"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </div>
      </div>
      <!-- Note -->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNDesc" style="padding-left:0px;width:100%;">
          <b>Note.</b> If you are filing a joint return and both you and your spouse had a profit or loss from a farming business, see <span class="styItalicText">Joint returns</span> and<br/>
          <span style="width:8mm;"/>
          <span class="styItalicText">Husband-Wife Business</span> in the instructions for more information.
        </div>
      </div>
    </div>
    <!-- Section A -->
    <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
      <!-- Content -->
      <div class="styPartDesc" style="padding:0px 0px 0px 0px;font-size:8.5pt;width:100%;height:auto;text-align:center;">
        Section A<img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>Farm Income<img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>Cash Method<br/>
        <span class="styNormalText">
          Complete Sections A and B. (Accrual method taxpayers, complete Sections B and C, and Section A, line 11.)<br/>
          Do not include sales of livestock held for draft, breeding, sport, or dairy purposes (see instructions).
        </span>
      </div>
    </div>
    <!-- Body -->
    <div class="styBB" style="width:187mm;">
      <!-- (1) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">1</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Sales of livestock and other items you bought for resale
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.3mm 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">1</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/SalesOfLivestockBghtForResale"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">1</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (2) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">2</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Cost or other basis of livestock and other items reported on line 1
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.3mm 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/CostOfLivestockBoughtForResale"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (3) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">3</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Subtract line 2 from line 1
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">3</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/PurchasedProfit"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">3</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (4) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">4</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Sales of livestock, produce, grains, and other products you raised
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">4</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/SalesOfProductsRaised"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">4</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (5a) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:110mm;height:5.1mm;float:left;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">5a</div>
        <div class="styIRS1040SSPRLNDesc" style="width:auto;height:auto;">
          Total cooperative distributions (Form(s)
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">5.1mm</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;border-right-width:1px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>
      </div>
      <div class="styIRS1040SSPRLineItem" style="width:77mm;float:left;height:5.1mm;">
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">5.1mm</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>
      </div>
      <div class="styIRS1040SSPRLineItem" style="width:110mm;height:5.1mm;float:left;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;"/>
        <div class="styIRS1040SSPRLNDesc" style="width:auto;height:auto;">
          1099-PATR)
          <!--Dotted Line-->
          <span class="styBoldText">
            <span style="width:16px"/>.
            <span style="width:11px"/>.
            <span style="width:11px"/>.
            <span style="width:11px"/>.
            <span style="width:11px"/>.
            <span style="width:11px"/>.
            <span style="width:11px"/>.
            <span style="width:11px"/>.
            <span style="width:11px"/>.
          </span>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">5a</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/CooperativeDistributions"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">5a</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (5b) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:77mm;height:5.1mm;float:left;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">5b</div>
        <div class="styIRS1040SSPRLNDesc" style="width:auto;height:auto;">
          Taxable amount
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Height">100%</xsl:with-param>
                  <xsl:with-param name="Number">5b</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/CooperativeDistriTxblAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Height">100%</xsl:with-param>
                  <xsl:with-param name="Number">5b</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (6) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">6</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Agricultural program payments received
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">6</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/AgriculturalProgramPayments"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">6</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (7) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">7</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Commodity Credit Corporation (CCC) loans reported under election (or forfeited)
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">7</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/CCCLoansReportedUnderElection"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">7</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (8) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">8</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Crop insurance proceeds
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">8</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/CropInsProceedsAndDisasterPymt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">8</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (9) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">9</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Custom hire (machine work) income
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">9</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/CustomHireIncome"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">9</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (10) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">10</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Other income
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">10</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/OtherIncmIncludingGasFuelTaxCr"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">10</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (11) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">11</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              <b>Gross farm income.</b> Add amounts in the right column for lines 3 through 10. If accrual method
              taxpayer, enter the amount from Section C, line 50
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:8px"/>
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">11</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/GrossIncome"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">11</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
    </div>
    <!-- Section B -->
    <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
      <!-- Content -->
      <div class="styPartDesc" style="padding:0px 0px 0px 0px;font-size:8.5pt;width:100%;height:auto;text-align:center;">
        Section B<img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>Farm Expenses<img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>Cash and Accrual Method<br/>
        <span class="styNormalText" style="width:100%;text-align:left;">
          Do not include personal or living expenses (such as taxes, insurance, or repairs on your home) that did not produce farm income.<br/>
          Reduce the amount of your farm expenses by any reimbursements before entering the expenses below.
        </span>
      </div>
    </div>
    <!-- Body -->
    <div class="styBB" style="width:187mm;height:auto">
      <div class="styIRS1040SSPRCleanDiv" style="width:49.99%;height:auto;border-right-width:1px;">
        <!-- (12) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">12</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Car and truck expenses<br/>
                (see instructions)
                <span class="styBoldText">
                  <span style="width:14px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">12</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/CarAndTruckExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">12</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (13) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">13</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Chemicals
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">13</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/ChemicalsExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">13</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (14) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">14</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Conservation expenses
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">14</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/ConservationExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">14</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (15) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">15</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Custom hire (machine work)
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">15</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/CustomHireExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">15</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (16) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">16</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Depreciation and section 179<br/>
                expense deduction not<br/>
                claimed elsewhere (attach<br/>
                <b>Form 4562</b> if required)
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:17px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:11mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">16</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/DeprecAndSect179ExpnsDeduction"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">16</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (17) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">17</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Employee benefit programs<br/>
                other than on line 25
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:13px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">17</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/EmployeeBenefitProgramExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">17</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (18) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">18</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Feed purchased
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">18</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/FeedPurchasedExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">18</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (19) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">19</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Fertilizers and lime
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">19</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/FertilizerAndLimeExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">19</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (20) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">20</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Freight and trucking
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">20</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/FreightAndTruckingExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">20</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (21) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">21</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Gasoline, fuel, and oil
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">21</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/GasolineFuelAndOilExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">21</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (22) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">22</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Insurance (other than health)
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">22</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/InsuranceExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">22</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (23) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">23</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Interest:
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!-- (23a) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">a</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Mortgage (paid to banks, etc.)
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">23a</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/MortgageInterestExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">23a</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (23b) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">b</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Other
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">23b</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/OtherInterestExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">23b</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (24) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">24</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Labor hired
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">24</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/LaborHiredExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">24</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- COLUMN ADJUSTER (starts)-->
        <!--<div class="styIRS1040SSPRLineItem" style="height:auto;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv">
              <xsl:attribute name="style">
                width:100%;float:right;height:2.6mm;font-size:2pt;
                <xsl:if test="$TargetNode">
                  <xsl:variable name="cnt" select="count($TargetNode/FarmExpenses/OtherFarmExpensesGrp/OtherFarmExpense) + count($TargetNode/FarmExpenses/OtherFarmExpensesGrp/TotalPreproductivePeriodExpnss)"/><xsl:choose><xsl:when test="$cnt &gt;5">height:<xsl:value-of select="2.6+($cnt - 5)*5"/>mm;</xsl:when><xsl:otherwise>height:2.6mm;</xsl:otherwise></xsl:choose>
                </xsl:if>
              </xsl:attribute>
              <div class="styLNRightNumBoxNBB" style="height:100%;"/>
              <div class="styLNAmountBoxNBB" style="height:100%;width:29mm;"/>
            </div>
          </div>
        </div>-->
        <!-- COLUMN ADJUSTER (ends)-->
      </div>
      <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
      <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
      <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
      <div class="styIRS1040SSPRCleanDiv" style="width:50%;height:100%;float:right;padding-left:3mm;">
        <!-- (25) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">25</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:3mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;">
                Pension and profit-sharing<br/> plans
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:7px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:3mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:3mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">25</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/PensionAndPrftSharingExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">25</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (26) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">26</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:4mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Rent or lease:
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!-- (26a) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">a</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:4mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Vehicles, machinery, and<br/>
                equipment
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:19px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">26a</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/VehMachAndEquipRentLeaseExpnss"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">26a</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (26b) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">b</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:4mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Other (land, animals, etc.)
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;text-align:right;float:right;padding:0px 8px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">26b</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/OtherRentOrLeaseExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">26b</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (27) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">27</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:3mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;">
                Repairs and maintenance
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;text-align:right;float:right;padding:0px 8px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:3mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">27</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/RepairsAndMaintenanceExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">27</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (28) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">28</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:3mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;">
                Seeds and plants purchased
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;text-align:right;float:right;padding:0px 8px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:3mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">28</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/SeedsAndPlantsExpnss"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">28</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (29) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">29</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:3mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;">
                Storage and warehousing
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;text-align:right;float:right;padding:0px 8px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:3mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">29</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/StorageAndWarehousingExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">29</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (30) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">30</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:3mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;">
                Supplies purchased
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;text-align:right;float:right;padding:0px 8px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:3mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">30</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/SuppliesExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">30</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (31) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">31</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:3mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;">
                Taxes
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;text-align:right;float:right;padding:0px 8px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:3mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">31</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/TaxesExpense"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">31</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (32) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">32</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:3mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;">
                Utilities
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;text-align:right;float:right;padding:0px 8px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:3mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">32</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/UtilitiesExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">32</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (33) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">33</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:3mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;">
                Veterinary, breeding, and<br/>
                medicine
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:9px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:3mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:auto;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">33</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/VtrnryBreedingMedicineExpenses"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">33</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (34) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">34</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:3mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;">
                Other expenses (specify):            
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!-- (34a-e) ////////////////////////////////////////////////////-->
        <xsl:choose>
          <xsl:when test="$TargetNode">
            <xsl:variable name="NumberOfOtherExpenseGrp" select="count($TargetNode/FarmExpenses/OtherFarmExpensesGrp/OtherFarmExpense)"/>
            <xsl:for-each select="$TargetNode/FarmExpenses/OtherFarmExpensesGrp/OtherFarmExpense">
              <xsl:variable name="Letter">
                <xsl:number format="a"/>
              </xsl:variable>
              <xsl:choose>
                <xsl:when test="(position() = 5) and ($TargetNode/FarmExpenses/OtherFarmExpensesGrp/TotalPreproductivePeriodExpnss)">
					<div class="styIRS1040SSPRLineItem">
						<div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">
							<xsl:number value="position()" format="a"/>
						</div>
						<div class="styIRS1040SSPRLNDesc" style="width:47mm;height:3mm;">
							<span style="width:43mm;height:3mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/OtherFarmExpensesGrp/TotalPreproductivePeriodExpnss/@section263AIndicatorCd"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
							<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:3mm;float:right;">
								<xsl:call-template name="CreateBox_1040SS">
									<xsl:with-param name="Number">
										<xsl:value-of select="concat('34', 'e')"/>
									</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/OtherFarmExpensesGrp/TotalPreproductivePeriodExpnss"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<xsl:call-template name="CreateOtherExpensesItem_1040SS">
						<xsl:with-param name="TargetNode" select="."/>
						<xsl:with-param name="Letter">
							<xsl:number value="position() + 1" format="a"/>
						</xsl:with-param>
						<xsl:with-param name="LineEData" select="$TargetNode/FarmExpenses/OtherFarmExpensesGrp"/>
					</xsl:call-template>
				</xsl:when>
                <xsl:when test="(position() = last()) and ($NumberOfOtherExpenseGrp &gt;=5)">
                  <xsl:call-template name="CreateOtherExpensesItem_1040SS">
                    <xsl:with-param name="TargetNode" select="."/>
                    <xsl:with-param name="Letter">
                      <xsl:choose>
						<xsl:when test="(position() &gt; 5) and ($TargetNode/FarmExpenses/OtherFarmExpensesGrp/TotalPreproductivePeriodExpnss)">
							<xsl:number value="position() + 1" format="a"/>
						</xsl:when>
						<xsl:otherwise><xsl:number value="position()" format="a"/></xsl:otherwise>
					  </xsl:choose>
                    </xsl:with-param>
                    <xsl:with-param name="Style">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="LineEData" select="$TargetNode/FarmExpenses/OtherFarmExpensesGrp"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateOtherExpensesItem_1040SS">
                    <xsl:with-param name="TargetNode" select="."/>
                    <xsl:with-param name="Letter">
                      <xsl:choose>
						<xsl:when test="(position() &gt; 5) and ($TargetNode/FarmExpenses/OtherFarmExpensesGrp/TotalPreproductivePeriodExpnss)">
							<xsl:number value="position() + 1" format="a"/>
						</xsl:when>
						<xsl:otherwise><xsl:number value="position()" format="a"/></xsl:otherwise>
					  </xsl:choose>
                    </xsl:with-param>
                    <xsl:with-param name="LineEData" select="$TargetNode/FarmExpenses/OtherFarmExpensesGrp"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
            <xsl:if test="$NumberOfOtherExpenseGrp &lt;5">
              <xsl:call-template name="GenerateEmptyItems_1040SS">
                <xsl:with-param name="Number" select="$NumberOfOtherExpenseGrp + 1"/>
                <xsl:with-param name="MaxCount" select="5"/>
                <xsl:with-param name="LineEData" select="$TargetNode/FarmExpenses/OtherFarmExpensesGrp"/>
              </xsl:call-template>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="GenerateEmptyItems_1040SS">
              <xsl:with-param name="Number" select="1"/>
              <xsl:with-param name="MaxCount" select="5"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </div>
    </div>
      <!-- (35) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">35</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              <b>Total expenses.</b> Add lines 12 through 34e
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                .
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:8px"/>
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5.1mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5.1mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">35</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/TotalExpenses"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">35</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (36) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:5.1mm;border-bottom:2px solid black;">
        <div class="styIRS1040SSPRLNLeftNumBox">36</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              <b>Net farm profit or (loss).</b> Subtract line 35 from line 11. Enter the result here and in Part V, line 1a
              <xsl:if test="$TargetNode">
                <xsl:if test="$TargetNode/FarmExpenses/NetFarmProfitOrLoss/@passiveActivityLossLiteralCd">
                  <span style="width:4px;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part III, Line 36 - Passive Activity Loss Literal Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/NetFarmProfitOrLoss/@passiveActivityLossLiteralCd"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:if>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">36</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/NetFarmProfitOrLoss"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">36</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
    <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
    <!-- Page Break and Footer-->
    <div class="pageEnd" style="width:187mm;padding-top:1mm;">
      <div style="float:right;">
        <span style="width:50px;"/>  
          Form 
        <span class="styBoldText" style="font-size:8pt;">
         <xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
          1040-SS
         </xsl:if>
         <xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
          1040-PR
         </xsl:if>
        </span> (2013)
      </div>
    </div>
    <!-- END Page Break and Footer-->
    <!-- BEGIN Page Header -->
    <div class="styTBB" style="width:187mm;padding-top:.5mm;">
      <div style="float:left;">
        Form          
        <xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
          1040-SS
        </xsl:if>
        <xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
          1040-PR
        </xsl:if>
        (2013)<span style="width:148mm;"/>
      </div>
      <div style="float:right;">
        Page <span style="font-weight:bold;font-size:8pt;">3</span>
      </div>
    </div>
    <!-- END Page Header -->
    <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
    <!-- Section C -->
    <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
      <!-- Content -->
      <div class="styPartDesc" style="padding:0px 0px 0px 0px;font-size:8.5pt;width:100%;height:auto;text-align:center;">
        Section C<img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>Farm Income<img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>Accrual Method<br/>
        <span class="styNormalText">
          Do not include sales of livestock held for draft, breeding, sport, or dairy purposes on any of the lines below (see instructions).
        </span>
      </div>
    </div>
    <div class="styBB" style="width:187mm;">
      <!-- (37) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">37</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Sales of livestock, produce, grains, and other products during the year
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">37</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/SalesOfProducts"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">37</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (38a) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:115mm;float:left;height:5.1mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">38a</div>
        <div class="styIRS1040SSPRLNDesc" style="width:auto;height:auto;">
          Total cooperative distributions (<span style="font-family:arial narrow">Form(s) 1099-PATR</span>)
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">38a</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/CooperativeDistributions"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">38a</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (38b) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:72mm;float:left;height:5.1mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">38b</div>
        <div class="styIRS1040SSPRLNDesc" style="width:auto;height:auto;">
          Taxable amount
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Height">100%</xsl:with-param>
                  <xsl:with-param name="Number">38b</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/CooperativeDistriTxblAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Height">100%</xsl:with-param>
                  <xsl:with-param name="Number">38b</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (39) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">39</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Agricultural program payments received
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">39</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/AgriculturalProgramPayments"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">39</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (40) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">40</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Commodity Credit Corporation (CCC) loans reported under election (or forfeited)
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">40</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/CCCLoansReportedUnderElection"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">40</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (41) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">41</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Crop insurance proceeds
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">41</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/CropInsuranceProceeds"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">41</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (42) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">42</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Custom hire (machine work) income
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">42</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/CustomHireIncome"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">42</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (43) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">43</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Other farm income (specify)
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <span style="width:100mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;height:100%;text-align:center;">
                <xsl:if test="$TargetNode">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part III, Line 43 - Other Income Table</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/OtherIncomeGrp"/>
                  </xsl:call-template>
                </xsl:if>
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">43</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/OtherIncomeTotalAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">43</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (44) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">44</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Add the amounts in the right column for lines 37 through 43
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">44</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/TotalIncome"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">44</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (45) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">45</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Inventory of livestock, produce, grains, and other products at the<br/>
              beginning of the year
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">45</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/InventoryOfProductsAtBOY"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">45</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (46) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">46</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;font-size:7.5pt;">
              Cost of livestock, produce, grains, and other products purchased during the year
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">46</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/CostOfProductsPrchsDuringYear"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">46</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (47) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">47</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Add lines 45 and 46
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 1mm 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">47</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/InventoryAtBOYPlusCostOfPrchs"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">47</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (48) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">48</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;font-size:7.5pt;">
              Inventory of livestock, produce, grains, and other products at the end of the year
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">48</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/InventoryOfProductsAtEOY"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">48</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (49) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">49</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Cost of livestock, produce, grains, and other products sold. Subtract line 48 from line 47*
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">49</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/CostOfProductsSold"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">49</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (50) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">50</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              <b>Gross farm income.</b> Subtract line 49 from line 44. Enter the result here and in Part III, line 11
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:34px"/>
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">50</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/GrossIncome"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">50</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
    </div>
    <div class="styBB" style="width:187mm;">
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:auto;padding:0px 0px 0px 0px;font-size:7.5pt;">
          *If you use the unit-livestock-price method or the farm-price method of valuing inventory and the amount on line 48 is larger than the amount on<br/>
          line 47, subtract line 47 from line 48. Enter the result on line 49. Add lines 44 and 49. Enter the total on line 50 and in Part III, line 11.
        </div>
      </div>
    </div>
  </xsl:template>
  <!-- ////////////////////////////////////////////////////////////// (Template: PopulateProfitLossFromBusinessSection_1040SS) -->
  <xsl:template name="PopulateProfitLossFromBusinessSection_1040SS">
    <xsl:param name="TargetNode" select="/.."/>
    <!-- Header -->
    <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
      <!-- Content -->
      <div class="styPartName" style="width:15mm;">Part IV</div>
      <div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
        Profit or Loss From Business (Sole Proprietorship)
        <img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>
        <span class="styNormalText">See the instructions for Schedule C (Form 1040).</span>
      </div>
    </div>
    <!-- Body -->
    <div class="styBB" style="width:187mm;">
      <!-- Name and SSN section -->
      <div class="styIRS1040SSPRLineItem" style="height:8mm;border-bottom-width:1px;border-color:black;">
        <div class="styIRS1040SSPRLNDesc" style="width:80%;height:100%;padding-left:0px;font-size:7.5pt;">
          <span style="width:100%;height:auto;">Name of proprietor</span>
          <span style="width:100%;height:auto;">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$TargetNode/NameOfFarmProprietor"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </div>
        <div class="styIRS1040SSPRLNDesc" style="width:20%;height:100%;border-left-width:1px;padding-left:0px;border-color:black;font-size:7.5pt;">
          <span class="styBoldText" style="width:100%;height:auto;padding-left:4px;">Social security number</span>
          <span style="width:100%;height:auto;text-align:center;">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="$TargetNode/SSN"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </div>
      </div>
      <!-- Note -->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNDesc" style="padding-left:0px;width:100%;">
          <b>Note.</b> If you are filing a joint return and both you and your spouse had a profit or loss from a business, see <span class="styItalicText">Joint returns</span> and<br/>
          <span style="width:8mm;"/>
          <span class="styItalicText">Husband-Wife Business</span> in the instructions for more information.
        </div>
      </div>
    </div>
    <!-- Section A -->
    <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
      <!-- Content -->
      <div class="styPartDesc" style="padding:0px 0px 0px 0px;font-size:8.5pt;width:100%;height:auto;text-align:center;">
        Section A<img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>Income
      </div>
    </div>
    <!-- Body -->
    <div class="styBB" style="width:187mm;">
      <!-- (1) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="height:5.4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">1</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Gross receipts $
              <span style="border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;height:100%;width:27mm;text-align:right;font-size:6pt;">
                <xsl:if test="$TargetNode">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$TargetNode/GrossReceiptsOrSalesAmt"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode and $TargetNode/GrossReceiptsOrSalesAmt/@referenceDocumentName">
                  <span style="width:4px;"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$TargetNode/GrossReceiptsOrSalesAmt"/>
                  </xsl:call-template>
                </xsl:if>
              </span>
              <span style="width:3px;"/>
              Less returns and allowances $
              <span style="border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;height:100%;width:27mm;text-align:right;font-size:6pt;padding-top:.5mm;">
                <xsl:if test="$TargetNode">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$TargetNode/ReturnsAndAllowancesAmt"/>
                  </xsl:call-template>
                </xsl:if>
              </span>
              <span style="width:3px;"/>
              Balance
              <span style="width:2px;"/>
              <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5.4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5.4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                  <xsl:with-param name="Number">1</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/NetGrossReceiptsAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                  <xsl:with-param name="Number">1</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (2a) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">2a</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Inventory at beginning of year
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 1mm 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2a</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/BeginningOfYearInventoryAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2a</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (2b) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">b</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Purchases less cost of items withdrawn for personal use
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 1mm 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2b</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/PurchasesLessPersonalItemsAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2b</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (2c) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">c</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Cost of labor. Do not include any amounts paid to yourself
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 1mm 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2c</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/CostOfLaborAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2c</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (2d) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">d</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Materials and supplies
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 1mm 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2d</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/MaterialsAndSuppliesAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2d</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (2e) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">e</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Other costs (attach statement)
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 1mm 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2e</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/OtherCostsAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2e</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (2f) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">f</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Add lines 2a through 2e
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 1mm 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2f</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/TotalCostsAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2f</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (2g) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">g</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Inventory at end of year
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 1mm 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2g</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/EndOfYearInventoryAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2g</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (2h) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">h</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Cost of goods sold. Subtract line 2g from line 2f
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2h</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/CostOfGoodsSoldAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2h</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (3) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">3</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              <b>Gross profit.</b> Subtract line 2h from line 1
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">3</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/GrossProfitAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">3</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (4) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">4</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Other income
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">4</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/OtherIncomeAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">4</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (5) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNLeftNumBox">5</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              <b>Gross income.</b> Add lines 3 and 4
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:6px"/>
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">5</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/GrossIncomeAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">5</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
    </div>
    <!-- Section B -->
    <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
      <!-- Content -->
      <div class="styPartDesc" style="padding:0px 0px 0px 0px;font-size:8.5pt;width:100%;height:auto;text-align:center;">
        Section B<img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>Expenses
      </div>
    </div>
    <!-- Body -->
    <div class="styBB" style="width:187mm;">
      <div class="styIRS1040SSPRCleanDiv" style="width:49.99%;height:100%;border-right-width:1px;">
        <!-- (6) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">6</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Advertising
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">6</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/AdvertisingAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">6</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (7) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">7</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Car and truck expenses<br/>
                (see instructions)
                <span class="styBoldText">
                  <span style="width:14px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">7</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/CarAndTruckExpensesAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">7</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (8) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">8</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Commissions and fees
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">8</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/CommissionsAndFeesAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">8</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (9) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">9</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Contract labor
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">9</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/ContractLaborAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">9</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (10) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">10</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Depletion
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">10</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/DepletionAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">10</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (11) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:5px;">11</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Depreciation and section 179<br/>
                expense deduction (not<br/>
                included in Section A). (Attach<br/>
                <b>Form 4562</b> if required.)
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:15px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:11mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">11</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/DepreciationAndSection179Amt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">11</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (12) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">12</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Employee benefit programs<br/>
                (other than on line 17)
                <span class="styBoldText">
                  <span style="width:7px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">12</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/EmployeeBenefitProgramAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">12</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (13) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">13</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Insurance (other than health)
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">13</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/InsuranceAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">13</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (14) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">14</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Interest on business<br/>
                indebtedness
                <span class="styBoldText">
                  <span style="width:13px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">14</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/InterestOnBusIndebtdnessAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">14</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (15) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">15</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Legal and professional services
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">15</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/LegalAndProfessionalServiceAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">15</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (16) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">16</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:5mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Office expense
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:5mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">16</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/OfficeExpensesAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">16</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (17) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">17</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:50mm;height:6mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:6mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:6mm;">
                Pension and profit-sharing plans
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:6mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:6mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">17</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;height:6mm</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;height:6mm</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/PensionProfitSharingPlansAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">17</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;height:6mm</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;height:6mm</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- COLUMN ADJUSTER (starts)-->
        <!--<div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv">
              <xsl:attribute name="style">
                width:100%;float:right;height:6mm;
                <xsl:if test="$TargetNode">
                  <xsl:variable name="cnt" select="count($TargetNode/OtherBusinessExpenses)"/><xsl:choose><xsl:when test="$cnt &gt;4">height:<xsl:value-of select="6+($cnt - 4)*5"/>mm;</xsl:when><xsl:otherwise>height:6mm;</xsl:otherwise></xsl:choose>
                </xsl:if>
              </xsl:attribute>
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
        </div>-->
        <!-- COLUMN ADJUSTER (ends)-->
      </div>
      <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
      <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
      <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
      <div class="styIRS1040SSPRCleanDiv" style="width:50%;height:3mm;float:right;padding-left:3mm;">
        <!-- (18) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">18</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:4mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Rent or lease:
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <!--<xsl:with-param name="Height">100%</xsl:with-param>-->
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!-- (18a) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">a</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:4mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Vehicles, machinery, and<br/>
                equipment
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:19px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">18a</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/MachineryAndEquipmentRentAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">18a</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (18b) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">b</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:4mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Other business property
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;text-align:right;float:right;padding:0px 8px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">18b</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/OtherBusinessPropertyRentAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">18b</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (19) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">19</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:4mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Repairs and maintenance
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;text-align:right;float:right;padding:0px 8px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">19</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/RepairsAndMaintenanceAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">19</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (20) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">20</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:4mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Supplies (<span style="font-family:arial narrow;">not included in Section A</span>)
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">20</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SuppliesAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">20</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (21) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">21</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:4mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Taxes and licenses
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;text-align:right;float:right;padding:0px 8px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">21</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/TaxesAndLicensesAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">21</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (22) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">22</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:4mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Travel, meals, and entertainment:
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:8mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Height">100%</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!-- (22a) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">a</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:4mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Travel
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;text-align:right;float:right;padding:0px 8px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">22a</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/TravelAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">22a</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (22b) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">b</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:4mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                <span style="font-family:arial narrow">Deductible meals and entertainment</span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">22b</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/MealsAndEntertainmentAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">22b</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (23) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">23</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:4mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Utilities
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;text-align:right;float:right;padding:0px 8px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">23</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/UtilitiesAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">23</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (24) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem">
          <div class="styIRS1040SSPRLNLeftNumBox">24</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:4mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Wages not included on line 2c
              </div>
            </div>
          </div>
          <div class="styGenericDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styGenericDiv" style="border-bottom:1px solid black;width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">24</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/WagesLessEmploymentCreditsAmt"/>
                    <xsl:with-param name="AmountBoxStyle">border-bottom:1px solid black;</xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">24</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>
        <!-- (25a) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem" style="float:none;clear:both">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">25a</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:84mm;height:3mm;padding:0px 0px 0px 0px;margin-bottom:-0.5mm">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:3mm;">
                <span style="font-family:arial narrow">Other expenses (list type and amount):</span>
              </div>
              
            </div>
            <div class="styIRS1040SSPRLNDesc" style="margin-left:2.24mm;background-color:lightgrey;width:9.8%;height:3mm;border-left:1px solid black;border-right:1px solid black"/>
          </div>
          </div>
          <xsl:choose>
            <xsl:when test="$TargetNode">
            <xsl:variable name="NumberOfOtherBusinessExpensesGrp" select="count($TargetNode/OtherBusinessExpenses)"/>
              <xsl:for-each select="$TargetNode/OtherBusinessExpenses">
              <div class="styIRS1040SSPRCleanDiv" style="float:none;width:90mm;height:4mm;padding-left:5mm;">
              <div class="styIRS1040SSPRLNDesc" style="float:none;width:auto;padding-top:0px;padding-bottom:0;">
              <div class="styGenericDiv" style="width:55.7%;border-bottom:1px dashed black">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="./Description"/>
				  </xsl:call-template>
				  <xsl:if test="./@referenceDocumentName">
					  <span style="width:4px"/>
					  <xsl:call-template name="SetFormLinkInline">
						  <xsl:with-param name="TargetNode" select="."/>
					  </xsl:call-template>
				  </xsl:if>
				  </div>
				 <div class="styGenericDiv" style="background-color:lightgrey;width:9.9%;height:4mm;border-left:1px solid black;border-right:1px solid black"/>
				 <div class="styGenericDiv" style="padding-left:6.0mm;float:right;width:34%;font-size:7pt;">
					 <xsl:call-template name="PopulateAmount">
						 <xsl:with-param name="TargetNode" select="Amount"/>
					 </xsl:call-template>
				 </div>
				 </div>
				 </div>
              </xsl:for-each>
              <xsl:if test="$NumberOfOtherBusinessExpensesGrp &lt; 4">
				  <xsl:call-template name="GenerateEmptyOtherBusinessExpensesItems_1040SS">
					<xsl:with-param name="Number" select="$NumberOfOtherBusinessExpensesGrp + 1"/>
					<xsl:with-param name="MaxCount" select="4"/>
				  </xsl:call-template>
              </xsl:if>
            </xsl:when>
            </xsl:choose>         
      </div>
      <!-- (25b) ////////////////////////////////////////////////////-->
      <table cellpadding="0" cellspacing="0" style="page-break-before: avoid;">
	<tr style="page-break-before: avoid;">
	<td style="page-break-before: avoid;">
        <div class="styIRS1040SSPRLineItem" style="width:91mm;padding-bottom:0px;">          
          <div class="styIRS1040SSPRCleanDiv" style="width:40mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">25b</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;padding-top:0px;width:27.3mm;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;padding-top:0px;width:8mm;</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/TotalOtherExpensesAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">25b</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;padding-top:0px;width:27.3mm;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;padding-top:0px;width:8mm;</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>          
          <div class="styIRS1040SSPRCleanDiv" style="width:43mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Total other expenses
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;text-align:right;float:right;padding:0px 0px 0px 0px;">
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <!--<span style="width:11px"/>.-->
                </span>
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;float:right;">25b</div>
        </div>
        </td>
        </tr>
        </table>
      <!-- (26) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;border-top:1px solid black;">
        <div class="styIRS1040SSPRLNLeftNumBox">26</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Total expenses. Add lines 6 through 25b
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:8px"/>
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">26</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/TotalExpensesAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">26</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (27) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;border-bottom:2px solid black;">
        <div class="styIRS1040SSPRLNLeftNumBox">27</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              <b>Net profit or (loss).</b> Subtract line 26 from line 5. Enter the result here and in Part V, line 2
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 11px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                .
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">27</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/NetProfitOrLossAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">27</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      </div>
  </xsl:template>
  <!-- ////////////////////////////////////////////////////////////// (Template: PopulateSelfEmploymentTaxSection_1040SS) -->
  <xsl:template name="PopulateSelfEmploymentTaxSection_1040SS">
    <xsl:param name="TargetNode" select="/.."/>
    <!-- Header -->
    <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
      <!-- Content -->
      <div class="styPartName" style="width:15mm;">Part V</div>
      <div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
        Self-Employment Tax
        <b><img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/></b>
        <span class="styNormalText">If you had <b>church employee income</b>, see instructions before you begin.</span>
      </div>
    </div>
    <!-- Body -->
      <!-- Name and SSN section -->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:8mm;border-bottom-width:1px;border-color:black;">
        <div class="styIRS1040SSPRLNDesc" style="width:55%;height:100%;padding-left:0px;font-size:7.5pt;">
          <span style="width:100%;height:auto;">Name of person with <b>self-employment</b> income</span>
          <span style="width:100%;height:auto;">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$TargetNode/PersonName"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </div>
        <div class="styIRS1040SSPRLNDesc" style="width:25%;height:100%;border-left-width:1px;padding-left:0px;border-color:black;font-size:7.5pt;">
          <span class="styBoldText" style="width:100%;height:50%;padding-left:4px;">Social security number <span class="styNormalText">of person</span>
          </span>
          <span class="styNormalText" style="width:100%;height:50%;padding-left:4px;">with <span class="styBoldText">self-employment</span> income
          <span style="width:4px;"/>
            <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
          </span>
        </div>
        <div class="styIRS1040SSPRLNDesc" style="width:20%;height:100%;border-left-width:1px;padding-left:0px;border-color:black;font-size:7.5pt;">
          <span style="width:100%;height:auto;text-align:center;padding-top:2mm;">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="$TargetNode/SSN"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </div>
      </div>
      <!-- Note -->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;border-bottom:1px solid black;">
        <div class="styIRS1040SSPRLNDesc" style="padding-left:0px;width:100%;">
          <b>Note.</b> If you are filing a joint return and both you and your spouse had self-employment income, you must <b>each</b> complete a<br/>
          <span style="width:8mm;"/>
          <b>separate</b> Part V.
        </div>
      </div>
      <!-- (A) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-left:0px;text-align:left;">A</div>
        <div class="styIRS1040SSPRLNDesc" style="width:181mm;height:auto;">
          If you are a minister, member of a religious order, or Christian Science practitioner <b>and</b> you filed Form 4361, but you had<br/>
          $400 or more of <b>other</b> net earnings from self-employment, check here and continue with Part V
          <!--Dotted Line-->
          <span class="styBoldText">
            <span style="width:4px"/>.
            <span style="width:11px"/>.
            <span style="width:11px"/>.
            <span style="width:11px"/>.
            <span style="width:11px"/>.
            <span style="width:11px"/>.
            <span style="width:11px"/>.
            <span style="width:11px"/>.
            <span style="width:11px"/>.
          </span>
          <span style="width:2mm;"/>
          <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
          <span style="width:2mm;"/>
          <input type="checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$TargetNode/ExemptForm4361Ind"/>
              <xsl:with-param name="BackupName">Form1040SSPRDataSelfEmploymentTaxGrp<xsl:number value="position()"/>ExemptForm4361Ind</xsl:with-param>
            </xsl:call-template>
          </input>
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$TargetNode/ExemptForm4361Ind"/>
              <xsl:with-param name="BackupName">Form1040SSPRDataSelfEmploymentTaxGrp<xsl:number value="position()"/>ExemptForm4361Ind</xsl:with-param>
            </xsl:call-template>
          </label>
        </div>
      </div>
      <!-- (1a) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">1a</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Net farm profit or (loss) from Part III, line 36, and your distributive share from farm partnerships.<br/>
              <b>Note.</b> Skip lines 1a and 1b if you use the farm optional method (see instructions)
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;border-top-width:1px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;border-top-width:1px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">1a</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/NetFarmProfitLossAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">1a</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (1b) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">b</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              If you received social security retirement or disability benefits, enter<br/>
              the amount of Conservation Reserve Program payments included in Part III, line 6, plus your<br/>
              distributive share of these payments from farm partnerships
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:8mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">1b</xsl:with-param>
                  <xsl:with-param name="AddParentheses">true</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/ConservationReserveProgPymtAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">1b</xsl:with-param>
                  <xsl:with-param name="AddParentheses">true</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (2) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">2</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Net nonfarm profit or (loss) from Part IV, line 27, and your distributive share from nonfarm<br/>
              partnerships. Ministers and members of religious orders, see instructions for amounts to<br/>
              report on this line. See instructions for other income to report. <b>Note.</b> Skip this line if you use the<br/>
              nonfarm optional method (see instructions)
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:11mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/NetNonFarmProfitLossAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (3) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">3</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Combine lines 1a, 1b, and 2
              <xsl:if test="$TargetNode">
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd">
                  <span style="width:4px;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Self-Employment Tax Exempt Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt">
                  <span style="width:4px;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Self-Employment Tax Exempt Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd">
                  <span style="width:4px;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Chap 11 Bankruptcy Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt">
                  <span style="width:4px;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Chap 11 Bankruptcy Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseCd">
                  <span style="width:4px;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Community Income Taxed To Spouse Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseCd"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseAmt">
                  <span style="width:4px;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Community Income Taxed To Spouse Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseAmt"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd">
                  <span style="width:4px;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Exempt Community Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt">
                  <span style="width:4px;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Exempt Community Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd">
                  <span style="width:4px;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Additional Income Or Loss Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt">
                  <span style="width:4px;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Additional Income Or Loss Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:if>
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd)">
                  <span style="width:11px"/>.
                </xsl:if>
                <xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt)">
                  <span style="width:11px"/>.
                </xsl:if>
                <xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd)">
                  <span style="width:11px"/>.
                </xsl:if>
                <xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt)">
                  <span style="width:11px"/>.
                </xsl:if>
                <xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseCd)">
                  <span style="width:11px"/>.
                </xsl:if>
                <xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseAmt)">
                  <span style="width:11px"/>.
                </xsl:if>
                <xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd)">
                  <span style="width:11px"/>.
                </xsl:if>
                <xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt)">
                  <span style="width:11px"/>.
                </xsl:if>
                <xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd)">
                  <span style="width:11px"/>.
                </xsl:if>
                <xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt)">
                  <span style="width:11px"/>.
                </xsl:if>
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">3</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">3</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (4a) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">4a</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              If line 3 is more than zero, multiply line 3 by 92.35% (.9235). Otherwise, enter the amount from<br/>
              line 3
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:15px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">4a</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/MinimumProfitForSETaxAmt"/>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:2px;</xsl:with-param>
				  <xsl:with-param name="NumberBoxStyle">border-bottom-width:2px;</xsl:with-param>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">4a</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:2px;</xsl:with-param>
				  <xsl:with-param name="NumberBoxStyle">border-bottom-width:2px;</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;"/>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              <b>Note.</b> If line 4a is less than $400 due to Conservation Reserve Program payments on line 1b, see<br/>
              instructions.
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:auto;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>
      </div>
      <!-- (4b) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">b</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              If you elect one or both of the optional methods, enter the total of lines 2 and 4 of Part VI here
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">4b</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/OptionalMethodAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">4b</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (4c) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">c</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Combine lines 4a and 4b. If less than $400, <b>stop;</b> you do not owe self-employment tax.<br/>
              <b>Exception.</b> If less than $400 and you had <b>church employee income,</b> enter -0- and continue
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:6px"/>
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">4c</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/CombinedSEAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">4c</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (5a) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">5a</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Enter your <b>church employee income</b> from Form(s) W-2, W-2AS,<br/>
              W-2CM, W-2GU, W-2VI, or 499R-2/W-2PR. See instructions for<br/>
              definition of church employee income
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:14px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">5a</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/W2WagesFromChurchesAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">5a</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (5b) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">b</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Multiply line 5a by 92.35% (.9235). If less than $100, enter -0-
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">5b</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/MinAllowableChurchWagesAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">5b</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (6) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">6</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Add lines 4c and 5b
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:6px"/>
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">6</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/CombinedSEAndChurchWagesAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">6</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (7) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">7</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Maximum amount of combined wages and self-employment earnings subject to social security<br/>
              tax for 2013
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:auto;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Number">7</xsl:with-param>
              <xsl:with-param name="StaticText">113,700.00</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>
      </div>
      <!-- (8a) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">8a</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Total social security wages and tips from Form(s) W-2, W-2AS,<br/>
              W-2CM, W-2GU, W-2VI, or 499R-2/W-2PR. If $113,700 or more, skip<br/>
              lines 8b through 10, and go to line 11
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">8a</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/SocSecWagesAndTipsAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">8a</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (8b) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">b</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Unreported tips subject to social security tax from Form 4137, line 10<br/>
              (see instructions)
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">8b</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/UnreportedTipsSubjToSocSecAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">8b</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (8c) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">c</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Wages subject to social security tax from Form 8919, line 10 (see <br/>
              instructions)
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:12px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">8c</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/WagesSubjectToSSTAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">8c</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (8d) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">d</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Add lines 8a, 8b, and 8c
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">8d</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/TotalWagesAndUnreportedTipsAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">8d</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (9) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">9</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Subtract line 8d from line 7. If zero or less, enter -0- here and on line 10 and go to line 11
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:6px"/>
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">9</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/AllowableSEAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">9</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (10) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">10</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Multiply the <b>smaller</b> of line 6 or line 9 by 12.4% (.124)
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">10</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/TaxBaseAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">10</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (11) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">11</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Multiply line 6 by 2.9% (.029)
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">11</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/SEBaseAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">11</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (12) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;border-bottom:1px solid black;">
        <div class="styIRS1040SSPRLNLeftNumBox">12</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              <b>Self-employment tax.</b> Add lines 10 and 11. Enter here and in Part I, line 3
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">12</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/SelfEmploymentTaxAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">12</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
    <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
    <!-- Begin Part VI                                                 -->
    <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
    <!-- Header -->
    <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
      <!-- Content -->
      <div class="styPartName" style="width:15mm;">Part VI</div>
      <div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
        Optional Methods To Figure Net Earnings
        <b><img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/></b>
        <span class="styNormalText">See instructions for limitations.</span>
      </div>
    </div>
    <!-- Body -->
    <div class="styBB" style="width:187mm;">
      <!-- Note -->
      <div class="styIRS1040SSPRLineItem">
        <div class="styIRS1040SSPRLNDesc" style="padding-left:0px;width:100%;">
          <b>Note.</b> If you are filing a joint return and both you and your spouse choose to use an optional method to figure net earnings, you<br/>
          <span style="width:8mm;"/>
          must <b>each</b> complete and attach a <b>separate</b> Part VI.
        </div>
      </div>
    </div>
      <!-- (**) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox"/>
        <div class="styIRS1040SSPRLNDesc" style="width:144mm;height:auto;">
          <b>Farm Optional Method</b>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>
      </div>
      <!-- (1) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">1</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Maximum income for optional methods
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Number">1</xsl:with-param>
              <xsl:with-param name="StaticText">4,640.00</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>
      </div>
      <!-- (2) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;border-bottom:1px solid black;">
        <div class="styIRS1040SSPRLNLeftNumBox">2</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Enter the <b>smaller</b> of: two-thirds (2/3) of gross farm income (Part III, line 11, plus your distributive<br/>
              share from farm partnerships), but not less than zero; <b>or</b> $4,640. Also include this amount in Part<br/>
              V, line 4b, above
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:8mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/SETaxFarmOptionalMethodAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (**) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox"/>
        <div class="styIRS1040SSPRLNDesc" style="width:144mm;height:auto;">
          <b>Nonfarm Optional Method</b>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>
      </div>
      <!-- (3) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">3</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Subtract line 2 from line 1
            </div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">3</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/SETaxNonFarmOptionalBaseAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">3</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (4) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;border-bottom:2px solid black;">
        <div class="styIRS1040SSPRLNLeftNumBox">4</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Enter the <b>smaller</b> of: two-thirds (2/3) of gross nonfarm income (Part IV, line 5, plus your distributive<br/>
              share from nonfarm partnerships), but not less than zero; <b>or</b> the amount in Part VI, line 3, above.<br/>
              Also include this amount in Part V, line 4b, above
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:10px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
                <span style="width:11px"/>.
              </span>
            </div>
          </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:8mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">4</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/SETaxNonFarmOptionalMethodAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">4</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
  </xsl:template>

  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<xsl:template name="IRS1040PR">
		<html lang="ES">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1040PRData)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1040PR"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040SSPRStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS1040PR" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:38mm;height:24mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Formulario 
								<span class="styFormNumber" style="font-size:15pt;">  
								  <xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
									1040-SS
								  </xsl:if>
								  <xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
									1040-PR
								  </xsl:if>
								</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1040PRData"/>
							</xsl:call-template>
							<xsl:if test="$Form1040PRData/PrimaryDateOfDeath">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Left Margin - Primary Date of Death</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040PRData/PrimaryDateOfDeath"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Form1040PRData/SpouseDateOfDeath">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Left Margin - Spouse Date of Death</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040PRData/SpouseDateOfDeath"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Non Paid Preparer Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040PRData/NonPaidPreparerCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Refund Anticipation Loan Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040PRData/RefundAnticipationLoanCd"/>
							</xsl:call-template>
							<span style="width:100%;padding-top:2.5mm;height:auto;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</span>
						</div>
						<div class="styFTBox" style="width:124mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;font-size:10pt;">
								Planilla para la Declaración de la Contribución Federal sobre el<br/>
								Trabajo por Cuenta Propia (Incluyendo el Crédito Tributario Adicional<br/>
								por Hijos para Residentes <span class="styItalicText">Bona Fide</span> de Puerto Rico)
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;text-align:center;width:100%;">
								<span style="text-align:center;font-weight:bold;width:100%;">
									<div style="width:100%;height:5mm;padding-left:0px;">
										<div style="width:100%;height:5mm;font-size:7.5pt;font-family:arial narrow;">
											<span class="styNormalText">
												Para el año que comienza el primero de enero de 2013 y termina el 31 de diciembre de 2013, o cualquier otro<br/>
												año contributivo comenzado el
												<span style="width:29mm;padding-left:3px;text-align:center;">
													<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
												</span>
												de 2013 y terminado el
												<span style="width:29mm;padding-left:3px;text-align:center;">
													<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
												</span>.
											</span><br/>
											<span style="">
												<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
												Para más información sobre el Formulario 1040-PR y sus instrucciones vea <i>www.irs.gov/form1040pr</i>.
											</span>
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:24mm;border-left-width:2px;height:24mm;">
							<div class="styOMB" style="height:2mm;font-size:7pt;">OMB No. 1545-0090</div>
							<div class="styTY" style="padding-top:2mm;">20<span class="styTYColor">13</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<div class="styBB" style="width:187mm;height:41mm;">
						<div class="styIRS1040PRCleanDiv" style="width:4%;height:100%;">
							<span style="width:100%;height:auto;padding-top:8mm;">
								<img src="{$ImagePath}/1040PR_Please_Print.gif" alt="Please Print"/>
							</span>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:96%;height:100%;border-left-width:1px;">
							<!-- Line 1 -->
							<div class="styIRS1040PRCleanDiv" style="width:100%;height:20%;border-bottom-width:1px;">
								<div class="styIRS1040PRCleanDiv" style="width:40%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;auto;font-size:7pt;">
										Nombre e inicial de su segundo nombre
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">Name</xsl:with-param>
											<xsl:with-param name="BackupName">RtnHdrDataFilerName</xsl:with-param>
										</xsl:call-template>
										<span style="width:4px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:30%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;">
										Apellido
									</div>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:29.9%;height:100%;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;">
										<b>Su número de seguro social</b>
									</div>
									<span style="width:100%;height:auto;font-size:7pt;text-align:center;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
											<xsl:with-param name="EINChanged">true</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<!-- Line 2 -->
							<div class="styIRS1040PRCleanDiv" style="width:100%;height:20%;border-bottom-width:1px;">
								<div class="styIRS1040PRCleanDiv" style="width:40%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;">
										Si es una planilla conjunta, nombre e inicial del cónyuge
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">SpouseName</xsl:with-param>
										</xsl:call-template>
										<span style="width:4px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:30%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;">
										Apellido
									</div>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:29.9%;height:100%;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;">
										<b>Número de seguro social del cónyuge</b>
									</div>
									<span style="width:100%;height:auto;font-size:7pt;text-align:center;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
											<xsl:with-param name="EINChanged">true</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<!-- Line 3 -->
							<div class="styIRS1040PRCleanDiv" style="width:100%;height:20%;border-bottom-width:1px;">
								<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;">
									Dirección actual (número, calle, número de apartamento o ruta rural)
								</div>
								<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
									<xsl:if test="$RtnHdrData/Filer/USAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine2</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine2</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
							<!-- Line 4 -->
							<div class="styIRS1040PRCleanDiv" style="width:100%;height:20%;border-bottom-width:1px;">
								<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;">
									Ciudad, pueblo u oficina postal, estado libre asociado o territorio y zona postal ( <span class="styItalicText">ZIP</span>)
								</div>
								<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<!-- Line 5 -->
							<div class="styIRS1040PRCleanDiv" style="width:100%;height:20%;">
								<div class="styIRS1040PRCleanDiv" style="width:40%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;">
										Nombre del país extranjero
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">Country</xsl:with-param>
											<xsl:with-param name="MainForm" select="true()"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:30%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;">
										Provicia extranjera/estado/condado 
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:29.9%;height:100%;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;">
										Código postal extranjero
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Parte I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Parte I</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Contribución y créditos totales
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">1</div>
							<div class="styIRS1040PRLNDesc" style="width:180.8mm;height:auto;">
								<b>Estado civil.</b> Marque el encasillado para su estado civil (vea las instrucciones).<br/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
										<xsl:with-param name="BackupName">Form1040PRDataIndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
										<xsl:with-param name="BackupName">Form1040PRDataIndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>
									Soltero
								</label>
								<br/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040PRDataIndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040PRDataIndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>
									Casado que radica una planilla conjunta
								</label>
								<br/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
										<xsl:with-param name="BackupName">Form1040PRDataIndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
										<xsl:with-param name="BackupName">Form1040PRDataIndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>
									Casado que radica una planilla por separado. Anote arriba el número de seguro social de su cónyuge y su nombre<br/>
									<span style="width:6mm;"/>completo aquí.
									<span style="width:3px;"/>
									<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
									<span style="width:2px;"/>
									<span style="width:140mm;height:auto;border-width:0px 0px 1px 0px;border-style:solid;border-color:black;padding-left:5px;text-align:center;">
										<xsl:if test="$Form1040PRData/SpousesName">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1040PRData/SpousesName"/>
											</xsl:call-template>
										</xsl:if>
									</span>
								</label>
							</div>
						</div>
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">2</div>
							<div class="styIRS1040PRLNDesc" style="width:181mm;height:auto;">
								<b>Hijos calificados.</b> Complete esta sección <b>únicamente</b> si usted es residente <i>bona fide</i> de Puerto Rico y reclama el crédito tributario adicional 
								por hijos (vea las instrucciones).
							</div>
							<div class="styGenericDiv" style="width:3.2mm;float:right;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1040PRData/QualifyingChildInfoSSPRGrp"/>
									<xsl:with-param name="containerHeight" select="4"/>
									<xsl:with-param name="containerID" select=" 'QualifyingChildInfoSSPRGrpDiv' "/>
									<xsl:with-param name="headerRowCount" select="1"/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- (Table) ///////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styTableContainerNBB" id="QualifyingChildInfoSSPRGrpDiv">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0" style="width:100%;">
									<thead class="styTableThead">
										<xsl:call-template name="QualifyingChildrenTableHeaders_1040PR"/>
									</thead>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form1040PRData/QualifyingChildInfoSSPRGrp">
											<xsl:if test="($Print != $Separated) or (count($Form1040PRData/QualifyingChildInfoSSPRGrp) &lt;=6)">
												<xsl:call-template name="QualifyingChildrenTableRows_1040PR">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="count($Form1040PRData/QualifyingChildInfoSSPRGrp) &lt; 1 or ((count($Form1040PRData/QualifyingChildInfoSSPRGrp) &gt;6) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040PR">
												<xsl:with-param name="AddAdditionalDataMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="count($Form1040PRData/QualifyingChildInfoSSPRGrp) &lt; 2 or ((count($Form1040PRData/QualifyingChildInfoSSPRGrp) &gt;6) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040PR"/>
										</xsl:if>
										<xsl:if test="count($Form1040PRData/QualifyingChildInfoSSPRGrp) &lt; 3 or ((count($Form1040PRData/QualifyingChildInfoSSPRGrp) &gt;6) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040PR"/>
										</xsl:if>
										<xsl:if test="count($Form1040PRData/QualifyingChildInfoSSPRGrp) &lt; 4 or ((count($Form1040PRData/QualifyingChildInfoSSPRGrp) &gt;6) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040PR"/>
										</xsl:if>
										<xsl:if test="count($Form1040PRData/QualifyingChildInfoSSPRGrp) &lt; 5 or ((count($Form1040PRData/QualifyingChildInfoSSPRGrp) &gt;6) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040PR"/>
										</xsl:if>
										<xsl:if test="count($Form1040PRData/QualifyingChildInfoSSPRGrp) &lt; 6 or ((count($Form1040PRData/QualifyingChildInfoSSPRGrp) &gt;6) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040PR"/>
										</xsl:if>
									</tbody>
								</table>
							</div>
							<!-- Set Initial Height of Above Table -->
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form1040PRData/QualifyingChildInfoSSPRGrp"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="headerRowCount" select="1"/>
								<xsl:with-param name="containerID" select=" 'QualifyingChildInfoSSPRGrpDiv' "/>
							</xsl:call-template>
							<!-- End Set Initial Height of Above Table -->
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">3</div>
							<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										Contribución sobre el trabajo por cuenta propia de la línea <b>12</b> de la Parte V
									</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">3</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/SelfEmploymentTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (4) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">4</div>
							<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										Contribuciones por empleados domésticos (vea las instrucciones). Adjunte el Anexo H-PR<br/>
										(Formulario 1040-PR)
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:24px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">4</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/HouseholdEmploymentTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">5</div>
							<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										Contribución Adicional de <i>Medicare</i>.  Adjunte el <b>Formulario 8959</b> 
									</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">5</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalAMRRTTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">6</div>
							<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										<b>Contribuciones totales.</b> Sume las líneas <b>3</b> y <b>4</b> (vea las instrucciones)
									</div>
									<span style="width:4px;"/>
									 <xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Repayment Of Advance Payment Received In Error Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Repayment Of Advance Payment Received In Error Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Tax On Tips Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/TaxOnTipsCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Social Security Medicare Tax Unrptd Tip Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/SocSecMedicareTaxUnrptdTipAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Tax On Tips Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedTaxCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Tax On Tips Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedSocSecTaxOnTipsAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedTaxCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedSocSecMedTaxAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax GTLI Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedTaxCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax GTLI Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedSocSecMedTaxGTLIAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">5</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/TotalTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">7</div>
							<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										<span style="font-size:7pt;">Pagos de contribución estimada del año 2013 (vea las instrucciones</span>)
									</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.3mm 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">7</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/EstimatedTaxPaymentsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">8</div>
							<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										<span style="font-size:7pt;">Contribución al seguro social retenida en exceso (vea las instrucciones)</span>
									</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.3mm 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">8</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/ExSocSecTaxWithheldAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">9</div>
							<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										Crédito tributario adicional por hijos de la línea <b>3</b> de la Parte II
									</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.3mm 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">9</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/ACTCBonaFideResidentsGrp/AdditionalChildTaxCreditAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">10</div>
							<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;font-family:Arial Narrow;">
										Crédito tributario por cobertura de seguro de salud. Adjunte el Formulario 8885
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part I, Line 10 - Health Coverage Tax Credit Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040SSPRData/HealthCoverageTaxCreditGrp/HealthCoverageTaxCd"/>
										</xsl:call-template>
									</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.3mm 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<xsl:choose>
									<xsl:when test="$Form1040PRData/HealthCoverageTaxCreditGrp">
										<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
											<xsl:call-template name="CreateBox_1040PR">
												<xsl:with-param name="Number">10</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$Form1040PRData/HealthCoverageTaxCreditGrp/HealthCoverageTaxCreditAmt"/>
											</xsl:call-template>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
											<xsl:call-template name="CreateBox_1040PR">
												<xsl:with-param name="Number">10</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$Form1040PRData/HealthCoverageTaxCreditAmt"/>
											</xsl:call-template>
										</div>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">11</div>
							<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										<b>Pagos y créditos totales</b> (vea las instrucciones)
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part I, Line 11 - Request for Extension Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalPaymentsAmt/@requestForExtensionCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part I, Line 11 - Request for Extension Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalPaymentsAmt/@requestForExtensionAmt"/>
										</xsl:call-template>
									</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">11</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalPaymentsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">12</div>
							<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										Si la línea <b>11</b> es mayor que la línea <b>6</b>, reste la cantidad de la línea <b>5</b> de la cantidad de la línea <b>11</b>. Esta es la<br/>
										cantidad <b>pagada en exceso</b>
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:20px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:4px"/>
											<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">12</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/OverpaidAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (13a) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">13a</div>
							<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										<span style="font-size:7pt;">Cantidad de la línea <b>11</b> que desea que <b>se le reintegre</b>. Si se ha incluido el Formulario 8888, marque aquí</span>
										<span style="width:4px"/>
											<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
											<xsl:choose>
												<xsl:when test="$Form1040PRData/Form8888Ind/@referenceDocumentId">
													<span style="width:6px;"/>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1040PRData/Form8888Ind"/>
													</xsl:call-template>
													<span style="width:6px;"/>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm"/>
												</xsl:otherwise>
											</xsl:choose>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040PRData/Form8888Ind"/>
													<xsl:with-param name="BackupName">Form1040PRDataForm8888Ind</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$Form1040PRData/Form8888Ind"/>
													<xsl:with-param name="BackupName">Form1040PRDataForm8888Ind</xsl:with-param>
												</xsl:call-template>
											</label>
									</div>
								</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">13a</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/RefundAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (13b-13c) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:auto;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">b</div>
							<div class="styIRS1040PRLNDesc" style="width:31mm;">
								Núm. de circulación
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:50mm;height:3mm;border-width:1px 1px 1px 1px;text-align:center;padding:2px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1040PRData/RoutingTransitNumber"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1040PRLNDesc" style="width:55mm;float:left;">
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
								<span><b>c</b> Tipo:</span>
								<span style="width:3mm;"/>
								<input class="styCkbox" type="checkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/BankAccountTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
										<xsl:with-param name="BackupName">Form1040PRDataBankAccountTypeCd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/BankAccountTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
										<xsl:with-param name="BackupName">Form1040PRDataBankAccountTypeCd</xsl:with-param>
									</xsl:call-template>
									<span style="width:4px;"/>
									Corriente
								</label>
								<span style="width:3mm;"/>
								<input class="styCkbox" type="checkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/BankAccountTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040PRDataBankAccountTypeCd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/BankAccountTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040PRDataBankAccountTypeCd</xsl:with-param>
									</xsl:call-template>
									<span style="width:4px;"/>
									Ahorros
								</label>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Height">5mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (13d) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">d</div>
							<div class="styIRS1040PRLNDesc" style="width:31mm;">
								Núm. de cuenta
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:90mm;height:100%;border-width:1px 1px 1px 1px;text-align:center;padding-top:2px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1040PRData/DepositorAccountNumber"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Height">5mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">14</div>
							<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										Cantidad de la línea <b>12</b> que desea que se le <b>acredite a la contribución<br/>
										estimada de 2014</b>
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:15px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:8px"/>
											<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Height">4mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Height">4mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Height">5mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">14</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/AppliedToESTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">15</div>
							<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										<b>Cantidad que usted adeuda.</b> Si la cantidad de la línea <b>5</b> es mayor que la cantidad de la línea <b>11</b>, reste la<br/>
										cantidad de la línea <b>11</b> de la cantidad de la línea <b>6</b>. Para detalles sobre cómo se paga, vea las<br/>
										instrucciones.
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:12px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:4px"/>
											<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:8mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">15</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/AmountOwedAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Third Party Designee -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="pageEnd" style="width:187mm;border-bottom:1px solid black;">
						<div class="styIRS1040PRLineItem" style="height:8mm;">
							<!-- Header -->
							<div class="styIRS1040PRCleanDiv" style="width:11%;height:100%;">
								<span class="styBoldText" style="padding-top:1mm;font-size:8.5pt;width:100%;text-align:center;">Tercero<br/>Autorizado</span>
							</div>
							<!-- Body -->
							<div class="styIRS1040PRCleanDiv" style="width:88.8%;height:100%;font-size:7pt;">
								<div class="styIRS1040PRLineItem" style="width:100%;">
									<div class="styIRS1040PRLNDesc" style="width:100%;padding:0px 0px 0px 0px;font-size:7pt;">
										¿Desea permitir que otra persona hable sobre esta planilla con el IRS (vea la página 13 de las instrucciones)?
										<span style="width:4px;"/>
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
										<span style="width:4px;"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneeInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:if test="$Form1040PRData/ThirdPartyDesigneeInd">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneeInd"/>
														<xsl:with-param name="BackupName">IRS1040PRThirdPartyDesigneeInd</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</input>
										</span>
										<span style="width:4px;"/>
										<label>
											<xsl:if test="$Form1040PRData/ThirdPartyDesigneeInd">
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneeInd"/>
													<xsl:with-param name="BackupName">IRS1040PRThirdPartyDesigneeInd</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<b>Sí.</b> Complete lo siguiente.
										</label>
										<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
										<span style="width:4px;"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneeInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:if test="$Form1040PRData/ThirdPartyDesigneeInd">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneeInd"/>
														<xsl:with-param name="BackupName">IRS1040PRThirdPartyDesigneeInd</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</input>
										</span>
										<span style="width:4px;"/>
										<label>
											<xsl:if test="$Form1040PRData/ThirdPartyDesigneeInd">
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneeInd"/>
													<xsl:with-param name="BackupName">IRS1040PRThirdPartyDesigneeInd</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<span class="styBoldText">No</span>
										</label>
									</div>
								</div>
								<div class="styIRS1040PRLineItem" style="width:100%;">
									<!-- Designee’s name-->
									<div class="styIRS1040PRLNDesc" style="width:19mm;padding:0px 0px 0px 0px;height:100%;font-size:7pt;">Nombre de esta<br/>persona</div>
									<div class="styIRS1040PRLNDesc" style="width:3mm;padding:12px 0px 0px 0px;height:100%;font-size:7pt;">
										<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
									</div>
									<div class="styIRS1040PRLNDesc" style="width:54mm;padding:5px 0px 0px 0px;height:100%;text-align:center;font-size:7pt;">
										<xsl:if test="$Form1040PRData/ThirdPartyDesigneeName">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneeName"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$Form1040PRData/Preparer">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1040PRData/Preparer"/>
											</xsl:call-template>
										</xsl:if>
									</div>
									<!-- Phone no.-->
									<div class="styIRS1040PRLNDesc" style="width:13mm;padding:0px 0px 0px 0px;height:100%;font-size:7pt;">Número de<br/>teléfono</div>
									<div class="styIRS1040PRLNDesc" style="width:3mm;padding:12px 0px 0px 0px;height:100%;">
										<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
									</div>
									<div class="styIRS1040PRLNDesc" style="width:25mm;padding:5px 0px 0px 0px;height:100%;text-align:center;font-size:7pt;">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneePhone"/>
										</xsl:call-template>
									</div>
									<!-- Personal identification number (PIN) -->
									<div class="styIRS1040PRLNDesc" style="width:28mm;padding:0px 0px 0px 0px;height:100%;font-size:7pt;">Número de identificación<br/>personal (PIN)</div>
									<div class="styIRS1040PRLNDesc" style="width:3mm;padding:12px 0px 0px 0px;height:100%;">
										<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
									</div>
									<div class="styIRS1040PRLNDesc" style="width:16.5mm;padding:7px 0px 6px 2px;height:100%;text-align:center;font-size:7pt;">
										<div class="styIRS1040PRCleanDiv" style="border-width:1px 1px 1px 1px;border-color:black;text-align:center;width:15mm;height:auto;font-size:7pt;">
											<xsl:call-template name="PopulatePin">
												<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneePIN"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Sign Here -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1040PRLineItem" style="height:6mm;">
							<!-- Header -->
							<div class="styIRS1040PRCleanDiv" style="width:11%;height:100%;">
								<span class="styBoldText" style="font-size:8.5pt;text-align:center;width:100%;padding-top:1mm;">Firme<br/>aquí</span>
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:10mm;padding-top:0px;text-align:center;">
									¿Planilla<br/>conjunta? Vea<br/>las instrucciones.<br/>Conserve una<br/>copia para<br/>su archivo.
								</div>
							</div>
							<!-- Body -->
							<div class="styIRS1040PRCleanDiv" style="width:88.8%;height:100%;">
								<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;padding:0px 0px 0px 0px;font-size:7pt;">
									Declaro bajo pena de perjurio que esta planilla, incluyendo los anexos y demás documentos que la acompañan, ha sido examinada por mí y que 
									según mi leal saber y entender es verídica, correcta y completa. La declaración del agente o preparador (que no es el contribuyente) está basada en toda la 
									información de la cual el agente o preparador tiene conocimiento.
								</div>
								<!-- Container -->
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:22mm;">
									<div class="styIRS1040PRCleanDiv" style="width:3%;height:100%;padding-top:3.5mm;">
										<img src="{$ImagePath}/1040PR_Bullet_Lg.gif" alt="Large Bullet"/>
									</div>
									<!-- Line 1 -->
									<div class="styIRS1040PRCleanDiv" style="width:97%;height:10mm;border-bottom-width:1px;border-color:black;">
										<!-- Your Signature -->
										<div class="styIRS1040PRLNDesc" style="width:97mm;height:100%;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
											Su firma<br/>
											<span style="width:100%;padding-top:6px;">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN"/>
													<xsl:with-param name="BackupName">RtnHdrDataPrimarySignature</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Date -->
										<div class="styIRS1040PRLNDesc" style="width:16mm;height:100%;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
											<span style="width:100%;padding-left:4px;">Fecha</span>
											<span style="width:100%;padding-top:6px;text-align:center;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
													<xsl:with-param name="BackupName">RtnHdrDataPrimarySignatureDate</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Daytime phone number -->
										<div class="styIRS1040PRLNDesc" style="width:45.2mm;height:100%;padding-left:0px;font-size:7pt;">
											<span style="width:100%;padding-left:4px;">Número de teléfono durante el día</span>
											<span style="width:100%;padding-top:6px;text-align:center;">
												<xsl:choose>
													<xsl:when test="$Form1040PRData/DaytimePhoneNumber">
														<xsl:call-template name="PopulatePhoneNumber">
															<xsl:with-param name="TargetNode" select="$Form1040PRData/DaytimePhoneNumber"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1040PRData/ForeignPhoneNumber"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</span>
										</div>
									</div>
									<!-- Line 2 -->
									<div class="styIRS1040PRCleanDiv" style="width:97%;height:10mm;">
										<!-- Spouse’s signature -->
										<div class="styIRS1040PRLNDesc" style="width:97mm;height:100%;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
											Firma del cónyuge. Si radican conjuntamente, <b>ambos</b> cónyuges tienen que firmar.<br/>
											<span style="width:100%;padding-top:6px;">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignaturePIN"/>
													<xsl:with-param name="BackupName">RtnHdrDataSpouseSignature</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Date -->
										<div class="styIRS1040PRLNDesc" style="width:16mm;height:100%;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
											<span style="width:100%;padding-left:4px;">Fecha</span>
											<span style="width:100%;padding-top:6px;text-align:center;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDt"/>
													<xsl:with-param name="BackupName">RtnHdrDataSpouseSignatureDate</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Identity protection Pin -->
										<div class="styIRS1040SSPRLNDesc" style="width:38mm;height:100%;border-color:black;padding-left:0px;font-size:7pt;">
										  <span style="width:100%;padding-left:4px;">Si el IRS le envió un Identity Protection PIN," anótelo aquí. (vea inst.)</span>
										  <span style="width:80%;padding-top:0px;padding-right:1mm;float:right;text-align:center;">
										<div class="styLNCtrNumBox" style="float:right;height:2mm;width:20mm;border-top-width:1px;">
											<xsl:call-template name="PopulatePin">
											  <xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
											  <xsl:with-param name="BackupName">RtnHdrDataIdentityProtectionPIN"</xsl:with-param>
											</xsl:call-template>
										 </div>
										</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Paid Preparer Use Only -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styTBB" style="width:187mm;">
						<div class="styIRS1040PRLineItem" style="height:6mm;">
							<!-- Header -->
							<div class="styIRS1040PRCleanDiv" style="width:11%;height:100%;">
								<span class="styBoldText" style="font-size:8pt;text-align:center;width:100%;padding-top:1mm;font-family:arial narrow;">Para uso<br/>exclusivo del<br/>preparador<br/>remunerado</span>
							</div>
							<!-- Body -->
							<div class="styIRS1040PRCleanDiv" style="width:88.8%;height:100%;">
								<!-- Line 1 -->
								<div class="styIRS1040PRCleanDiv" style="width:100%;border-bottom-width:1px;height:8mm;">
									<!-- Box 1 -->
									<div class="styIRS1040PRCleanDiv" style="width:30.5%;height:100%;">
										<div class="styIRS1040PRLNDesc" style="padding-left:0px;width:24%;height:100%;font-size:6pt;">
											Escriba el<br/>nombre del<br/>Preparador
										</div>
										<div class="styIRS1040PRLNDesc" style="padding-left:0px;width:76%;height:100%;font-size:6pt;padding-left:3px;word-wrap:break-word;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
												<xsl:with-param name="BackupName">RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
											</xsl:call-template>
										</div>
									</div>
									<!-- Box 2 -->
									<div class="styIRS1040PRCleanDiv" style="width:30.7%;height:100%;border-left-width:1px;font-size:6pt;padding-left:4px;">
										Firma del Preparador<br/>
									</div>
									<!-- Box 3 -->
									<div class="styIRS1040PRCleanDiv" style="width:9.5%;height:100%;border-left-width:1px;padding-left:4px;font-size:6pt;">
										Fecha<br/>
										<span style="padding-top:1mm;width:100%;height:auto;">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
									<!-- Box 4 -->
									<div class="styIRS1040PRCleanDiv" style="width:29%;height:100%;border-left-width:1px;">
										<div class="styIRS1040PRCleanDiv" style="width:50%;height:100%;padding-left:2px;font-size:6pt;">
											<span style="width:19.0mm;float:left;">
												Marque aquí si el<br/>preparador trabaja<br/>por cuenta propia
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
													</xsl:call-template>
												</label>
											</span>
											<span style="width:4.5mm;padding-top:3mm;padding-left:2px;float:left;">
												<input class="styCkbox" type="checkbox" style="width:4mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
													</xsl:call-template>
												</input>
											</span>
										</div>
										<div class="styIRS1040PRCleanDiv" style="width:49.5%;height:100%;border-left-width:1px;padding-left:4px;">
											<span class="styItalicText">PTIN</span> del preparador<br/>
											<span style="width:100%;height:auto;">
												<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">STIN</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</span>
										</div>
									</div>
								</div>
								<!-- Line 2 -->
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:8mm;">
									<div class="styIRS1040PRCleanDiv" style="width:20%;height:100%;font-size:6pt;">
										Nombre del negocio (o del preparador, si trabaja por cuenta propia), dirección y zona postal
									</div>
									<div class="styIRS1040PRCleanDiv" style="width:2%;height:100%;font-size:6pt;padding-top:2px;">
										<img src="{$ImagePath}/1040PR_Bullet_Md.gif" alt="Medium Bullet"/>
									</div>
									<div class="styIRS1040PRCleanDiv" style="width:77.8%;height:100%;font-size:6pt;">
										<div class="styIRS1040PRCleanDiv" style="width:100%;height:50%;font-size:6pt;border-bottom-width:1px;">
											<div class="styIRS1040PRCleanDiv" style="width:62.5%;height:100%;font-size:6pt;">
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
												</xsl:call-template>
											</div>
											<div class="styIRS1040PRCleanDiv" style="width:32%;height:100%;font-size:6pt;border-left-width:1px;padding-left:4px;">
												Núm. de identificación patronal<span style="width:3px;"/>
												<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReason">
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</div>
										</div>
										<div class="styIRS1040PRCleanDiv" style="width:100%;height:50%;font-size:6pt;">
											<div class="styIRS1040PRCleanDiv" style="width:62.5%;height:100%;font-size:6pt;">
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
												</xsl:call-template>
												<br/>
												<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">City</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
													</xsl:call-template>,
													<span style="width:2px;"/>
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">State</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
													</xsl:call-template>,
													<span style="width:2px;"/>
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">City</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
													</xsl:call-template>,
													<span style="width:2px;"/>
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
													</xsl:call-template>,
													<span style="width:2px;"/>
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCode</xsl:with-param>
													</xsl:call-template>,
													<span style="width:2px;"/>
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">Country</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountry</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</div>
											<div class="styIRS1040PRCleanDiv" style="width:32%;height:100%;font-size:6pt;border-left-width:1px;padding-left:4px;">
												Número de teléfono<span style="width:3px;"/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">Phone</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
												</xsl:call-template>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
												</xsl:call-template>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>	
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">
								Para el Aviso sobre la Ley de Divulgación y Confidencialidad de Información y la Ley de<br/>
								Reducción de Trámites, vea las instrucciones.
							</span>
						</div>
						<div style="float:right;">
							<span style="width:50px;"/>  
								Formulario 
							<span class="styBoldText" style="font-size:8pt;">1040-PR</span> (2013)
						</div>
						<div style="float:right;text-align:center;width:26mm;font-size:7pt;">
							Cat. No. 17182F
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">
							Formulario 1040-PR (2013)
						</div>
						<div style="float:right;">
							Página <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Parte II</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Residentes <i>Bona Fide</i> de Puerto Rico que reclaman el Crédito Tributario Adicional por Hijos.<br/>
							<span class="styNormalText">Vea las instrucciones.</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1040PRLineItem" style="border-bottom-width:1px;border-color:black;">
							<div class="styIRS1040PRLNDesc" style="width:100%;padding-left:0px;">
								<b>Precaución:</b> Tiene que tener tres o más hijos calificados para reclamar el crédito tributario adicional por hijos.
							</div>
						</div>
						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">1</div>
							<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										Ingresos recibidos de fuentes dentro de Puerto Rico
									</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">1</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/ACTCBonaFideResidentsGrp/PuertoRicoIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">2</div>
							<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										Contribuciones al seguro social y al Medicare retenidas de su(s) Formulario(s) 499R-2/W-2PR (adjunte<br/>
										copia(s) de dicho(s) formulario(s))
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:10px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">2</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/ACTCBonaFideResidentsGrp/TotalSocSecAndMedcrWithheldAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem">
							<div class="styIRS1040PRLNLeftNumBox">3</div>
							<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										<b>Crédito tributario adicional por hijos.</b> Utilice la hoja de trabajo en las instrucciones para<br/>
										calcular la cantidad que puede anotar aquí y en la línea <b>9</b> de la Parte I
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:15px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">3</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/ACTCBonaFideResidentsGrp/AdditionalChildTaxCreditAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part III																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Body -->
					<xsl:for-each select="$Form1040PRData/FarmingProfitLoss">
						<xsl:if test="position() &gt; 1">
							<div class="pageEnd"/>
						</xsl:if>
						<xsl:call-template name="PopulateProfitOrLossFromFarmingSection_1040PR">
							<xsl:with-param name="TargetNode" select="."/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($Form1040PRData/FarmingProfitLoss) = 0">
						<xsl:call-template name="PopulateProfitOrLossFromFarmingSection_1040PR"/>
					</xsl:if>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part IV																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Body -->
					<xsl:for-each select="$Form1040PRData/ProfitLossFromBusiness">
						<xsl:if test="count($Form1040PRData/ProfitLossFromBusiness) &gt; 1">
							<div class="pageEnd"/>
						</xsl:if>
						<xsl:call-template name="PopulateProfitLossFromBusinessSection_1040PR">
							<xsl:with-param name="TargetNode" select="."/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($Form1040PRData/ProfitLossFromBusiness) = 0">
						<xsl:call-template name="PopulateProfitLossFromBusinessSection_1040PR"/>
					</xsl:if>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:50px;"/>  
								Formulario 
							<span class="styBoldText" style="font-size:8pt;">1040-PR</span> (2013)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">
							Formulario 1040-PR (2013)
						</div>
						<div style="float:right;">
							Página <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part V																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<xsl:for-each select="$Form1040PRData/SelfEmploymentTaxGrp">
						<xsl:if test="position() &gt; 1">
							<div class="pageEnd"/>
						</xsl:if>
						<xsl:call-template name="PopulateSelfEmploymentTaxSection_1040PR">
							<xsl:with-param name="TargetNode" select="."/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($Form1040PRData/SelfEmploymentTaxGrp) = 0">
						<xsl:call-template name="PopulateSelfEmploymentTaxSection_1040PR"/>
					</xsl:if>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:50px;"/>  
								Formulario 
							<span class="styBoldText" style="font-size:8pt;">1040-PR</span> (2013)
						</div>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">130</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1040PRData"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Primary Date of Death</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/PrimaryDateOfDeath"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Spouse Date of Death</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/SpouseDateOfDeath"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:if test="$Form1040PRData/NonPaidPreparerCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Top Left Margin - Non Paid Preparer Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040PRData/NonPaidPreparerCd"/>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Refund Anticipation Loan Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/RefundAnticipationLoanCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:for-each select="$Form1040PRData/QualifyingChildInfoSSPRGrp">
							<xsl:variable name="Num">
								<xsl:number value="position()" format="1"/>
							</xsl:variable>
							<xsl:if test="QualifyingChildNameControl">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part I - Line 2 - Qualifying Child Name Control (Row <xsl:value-of select="$Num"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="QualifyingChildNameControl"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 5 - Repayment Of Advance Payment Received In Error Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 5 - Repayment Of Advance Payment Received In Error Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Line 5 - Tax On Tips Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/TaxOnTipsCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I - Line 5 - Social Security Medicare Tax Unrptd Tip Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/SocSecMedicareTaxUnrptdTipAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Line 5 - Uncollected Social Security Tax On Tips Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I - Line 5 - Uncollected Social Security Tax On Tips Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedSocSecTaxOnTipsAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Line 5 - Uncollected Social Security Medicare Tax Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I - Line 5 - Uncollected Social Security Medicare Tax Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedSocSecMedTaxAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Line 5 - Uncollected Social Security Medicare Tax GTLI Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I - Line 5 - Uncollected Social Security Medicare Tax GTLI Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedSocSecMedTaxGTLIAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Line 9 - Health Coverage Tax Credit Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/HealthCoverageTaxCreditGrp/HealthCoverageTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 11 - Request for Extension Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalPaymentsAmt/@requestForExtensionCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 11 - Request for Extension Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalPaymentsAmt/@requestForExtensionAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>						
						<xsl:for-each select="$Form1040PRData/FarmingProfitLoss">
							<!--<xsl:for-each select="FarmExpenses/OtherExpenses">
								<xsl:if test="TotalPreproductivePeriodExpnss">
									<xsl:call-template name="PopulateLeftoverRow">
										<xsl:with-param name="Desc">Part III - Section B - Line 34(e) - Total Preproductive Period Expenses</xsl:with-param>
										<xsl:with-param name="TargetNode" select="TotalPreproductivePeriodExpnss"/>
										<xsl:with-param name="DescWidth" select="$TableWidth"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="TotalPreproductivePeriodExpnss/@section263AIndicator">
									<xsl:call-template name="PopulateLeftoverRow">
										<xsl:with-param name="Desc">Part III - Section B - Line 34(e) - Section 263 A Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="TotalPreproductivePeriodExpnss/@section263AIndicator"/>
										<xsl:with-param name="DescWidth" select="$TableWidth"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:for-each>-->
							<xsl:if test="FarmExpenses/NetFarmProfitOrLoss/@passiveActivityLossLiteralCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part III - Section B - Line 36 - Passive Activity Loss Literal Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="FarmExpenses/NetFarmProfitOrLoss/@passiveActivityLossLiteralCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="$Form1040PRData/SelfEmploymentTaxGrp">
							<xsl:if test="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Self-Employment Tax Exempt Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Self-Employment Tax Exempt Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Chap 11 Bankruptcy Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Chap 11 Bankruptcy Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Community Income Taxed To Spouse Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseAmt">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Community Income Taxed To Spouse Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseAmt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Exempt Community Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Exempt Community Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Additional Income Or Loss Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Additional Income Or Loss Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
					</table>
					<xsl:for-each select="$Form1040PRData/FarmingProfitLoss">
						<xsl:if test="FarmIncomeAccrualMethod and (count(FarmIncomeAccrualMethod/OtherIncomeGrp) &gt; 0)">
							<br/>
							<br/>
							<span class="styRepeatingDataTitle">
								Form 1040-PR, Parte III - Sección C - Line 43 - Otros ingresos de negocio agropecuario<br/>
								Name of proprietor:<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="NameOfFarmProprietor/BusinessNameLine1"/>
								</xsl:call-template>
								<xsl:if test="NameOfFarmProprietor/BusinessNameLine2">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="NameOfFarmProprietor/BusinessNameLine2"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<xsl:variable name="CellStyle">border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-left:0px;padding-right:0px;</xsl:variable>
							<table class="styDepTbl" cellspacing="0">
								<thead>
									<tr class="styDepTblHdr">
										<th class="styIRS1040PRTableCell" scope="col">
											<xsl:attribute name="style">width:50%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
											Other Income Type
										</th>
										<th class="styIRS1040PRTableCell" scope="col">
											<xsl:attribute name="style">width:50%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
											Other Income Including<br/>Gas Fuel Tax Credit
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="FarmIncomeAccrualMethod/OtherIncomeGrp">
										<tr style="font-size:7pt;font-family:arial;">
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<!-- ++++++++++++++++++++++++++++++++++ -->
											<td class="styIRS1040PRTableCell">
												<xsl:attribute name="style">
													width:50%;text-align:left;
													<xsl:if test="position() = last()">
														border-bottom-width:0px;
													</xsl:if></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OtherIncomeType"/>
												</xsl:call-template>
											</td>
											<!-- ++++++++++++++++++++++++++++++++++ -->
											<td class="styIRS1040PRTableCell">
												<xsl:attribute name="style">
													width:50%;text-align:right;
													<xsl:if test="position() = last()">
														border-bottom-width:0px;
													</xsl:if></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherIncmIncludingGasFuelTaxCr"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<!-- Separated Data for Part I - Qualifying Children -->
					<xsl:if test="($Print = $Separated) and  (count($Form1040PRData/QualifyingChildInfoSSPRGrp) &gt; 6)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 1040-SS, Part I - Qualifying Children
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<xsl:call-template name="QualifyingChildrenTableHeaders_1040PR">
									<xsl:with-param name="AddColoredHeaders">true</xsl:with-param>
								</xsl:call-template>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1040PRData/QualifyingChildInfoSSPRGrp">
									<xsl:call-template name="QualifyingChildrenTableRows_1040PR">
										<xsl:with-param name="TargetNode" select="."/>
										<xsl:with-param name="AddColoredRows">true</xsl:with-param>
									</xsl:call-template>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
  
  <!-- ////////////////////////////////////////////////////////////// (Template:	CreateBox_1040PR) -->
	<xsl:template name="CreateBox_1040PR">
		<xsl:param name="TargetNode"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="AddParentheses"/>
		<xsl:param name="StaticText"/>
		<xsl:param name="Number"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Width">29mm</xsl:param>
		<xsl:param name="Height">5mm</xsl:param>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
				border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:7pt;
				<xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:2px;</xsl:when><xsl:otherwise>padding-top:4px;</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:3px;</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:choose>
				<xsl:when test="$TargetNode">
					<xsl:if test="$AddParentheses">
						(<span style="width:5px;"/>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="$PopulateAsText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="$TargetNode/@referenceDocumentId">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$TargetNode"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$AddParentheses">
						<span style="width:5px;"/>)
					</xsl:if>
				</xsl:when>
				<xsl:when test="$StaticText">
					<xsl:value-of select="$StaticText"/>
				</xsl:when>
				<xsl:when test="not($TargetNode) and not($StaticText) and $AddParentheses">
					(<span style="width:23mm;"/>)
				</xsl:when>
			</xsl:choose>
		</div>
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				float:right;
				padding:2px 0px 0px 0px;
				border-right-width:0px;font-size:8pt;
				height:<xsl:value-of select="$Height"/>;
				<xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	GenerateEmptyItems_1040PR) -->
	<xsl:template name="GenerateEmptyItems_1040PR">
		<xsl:param name="Number"/>
		<xsl:param name="MaxCount"/>
		<xsl:param name="LineEData"/>
		<xsl:if test="$Number and ($Number &lt;= $MaxCount)">
			<xsl:choose>
				<xsl:when test="$Number = 5 and $LineEData and $LineEData/TotalPreproductivePeriodExpnss">
					<div class="styIRS1040PRLineItem">
						<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">
							<xsl:number value="$Number" format="a"/>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:47mm;height:5mm;">
							<span style="width:43mm;height:100%;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$LineEData/TotalPreproductivePeriodExpnss/@section263AIndicatorCd"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
							<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">
										<xsl:value-of select="concat('34', 'e')"/>
									</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$LineEData/TotalPreproductivePeriodExpnss"/>
									<xsl:with-param name="AmountBoxStyle">
										border-bottom-width:0px;
									</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">
										border-bottom-width:0px;
									</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
				</xsl:when>
				<xsl:when test="$Number = $MaxCount">
					<xsl:call-template name="CreateOtherExpensesItem_1040PR">
						<xsl:with-param name="Letter">
							<xsl:number value="$Number" format="a"/>
						</xsl:with-param>
						<xsl:with-param name="LineEData" select="$LineEData"/>
						<xsl:with-param name="Style">border-bottom-width:0px;</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="CreateOtherExpensesItem_1040PR">
						<xsl:with-param name="Letter">
							<xsl:number value="$Number" format="a"/>
						</xsl:with-param>
						<xsl:with-param name="LineEData" select="$LineEData"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:call-template name="GenerateEmptyItems_1040PR">
				<xsl:with-param name="Number" select="$Number + 1"/>
				<xsl:with-param name="MaxCount" select="$MaxCount"/>
				<xsl:with-param name="LineEData" select="$LineEData"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	GenerateEmptyOtherBusinessExpensesItems_1040PR) -->
	<xsl:template name="GenerateEmptyOtherBusinessExpensesItems_1040PR">
		<xsl:param name="Number"/>
		<xsl:param name="MaxCount"/>
		<xsl:if test="$Number and ($Number &lt;= $MaxCount)">
			<xsl:choose>
				<xsl:when test="$Number = $MaxCount">
					<xsl:call-template name="CreateOtherBusinessExpensesItem_1040PR">
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="CreateOtherBusinessExpensesItem_1040PR"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:call-template name="GenerateEmptyOtherBusinessExpensesItems_1040PR">
				<xsl:with-param name="Number" select="$Number + 1"/>
				<xsl:with-param name="MaxCount" select="$MaxCount"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateOtherExpensesItem_1040PR) -->
	<xsl:template name="CreateOtherExpensesItem_1040PR">
		<xsl:param name="TargetNode"/>
		<xsl:param name="Style"/>
		<xsl:param name="LineEData"/>
		<xsl:param name="Letter"/>
		<div class="styIRS1040PRLineItem">
			<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">
				<xsl:value-of select="$Letter"/>
			</div>
			<div class="styIRS1040PRLNDesc" style="width:47mm;height:5mm;">
				<span style="width:43mm;height:100%;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
					<xsl:if test="$TargetNode">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$TargetNode/Description"/>
						</xsl:call-template>
					</xsl:if>
				</span>
			</div>
			<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
				<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
					<xsl:choose>
						<xsl:when test="$TargetNode">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Number">
									<xsl:value-of select="concat('34', $Letter)"/>
								</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$TargetNode/Amount"/>
								<xsl:with-param name="AmountBoxStyle">
									<xsl:value-of select="$Style"/>
								</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">
									<xsl:value-of select="$Style"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Number">
									<xsl:value-of select="concat('34', $Letter)"/>
								</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">
									<xsl:value-of select="$Style"/>
								</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">
									<xsl:value-of select="$Style"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</div>
		</div>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateOtherBusinessExpensesItem_1040PR) -->
	<xsl:template name="CreateOtherBusinessExpensesItem_1040PR">
		<xsl:param name="TargetNode"/>
		<xsl:param name="Style"/>
		<div class="styIRS1040PRLineItem">
			<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;"/>
			<div class="styIRS1040PRLNDesc" style="width:47mm;height:5mm;">
				<span style="width:43mm;height:100%;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
					<xsl:if test="$TargetNode">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$TargetNode/Description"/>
						</xsl:call-template>
						<xsl:if test="$TargetNode/@referenceDocumentName">
							<span style="width:4px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:if>
				</span>
			</div>
			<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
				<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
					<xsl:choose>
						<xsl:when test="$TargetNode">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="TargetNode" select="$TargetNode/Amount"/>
								<xsl:with-param name="AmountBoxStyle">
									border-bottom-width:0px;<xsl:value-of select="$Style"/>;
								</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">
									border-bottom-width:0px;<xsl:value-of select="$Style"/>;background-color:lightgrey;
								</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">
									border-bottom-width:0px;<xsl:value-of select="$Style"/>;
								</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">
									border-bottom-width:0px;<xsl:value-of select="$Style"/>;background-color:lightgrey;
								</xsl:with-param>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</div>
		</div>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template: QualifyingChildrenTableHeaders_1040PR) -->
	<xsl:template name="QualifyingChildrenTableHeaders_1040PR">
		<xsl:param name="AddColoredHeaders"/>
		<xsl:variable name="CommonStyle">border-color:black;font-size:6pt;text-align:center;font-family:arial;padding-left:0px;padding-right:0px;</xsl:variable>
		<tr>
			<xsl:if test="$AddColoredHeaders">
				<xsl:attribute name="class">styDepTblHdr</xsl:attribute>
			</xsl:if>
			<th class="styIRS1040PRTableCell" scope="col">
				<xsl:attribute name="style">width:60%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(a)<span class="styNormalText"> Nombre de pila<span style="width:60mm;"/>Apellido(s)</span>
			</th>
			<th class="styIRS1040PRTableCell" scope="col">
				<xsl:attribute name="style">width:20%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				(b)<span class="styNormalText"> Número de Identificación del hijo</span>
			</th>
			<th class="styIRS1040PRTableCell" scope="col">
				<xsl:attribute name="style">width:20%;<xsl:value-of select="$CommonStyle"/>;border-right-width:0px;</xsl:attribute>
				(c)<span class="styNormalText"> Parentesco del hijo con usted</span>
			</th>
		</tr>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template: QualifyingChildrenTableRows_1040PR) -->
	<xsl:template name="QualifyingChildrenTableRows_1040PR">
		<xsl:param name="TargetNode"/>
		<xsl:param name="AddColoredRows"/>
		<xsl:param name="AddAdditionalDataMessage"/>
		<!-- IsLast -->
		<xsl:variable name="IsLast">
			<xsl:if test="$TargetNode and (position() = last())">
				border-bottom-width:0px;
			</xsl:if>
		</xsl:variable>
		<!-- ClassType -->
		<xsl:variable name="ClassType">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
				<xsl:otherwise>styDepTblRow2</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr style="font-size:7pt;font-family:arial;">
			<xsl:if test="$AddColoredRows">
				<xsl:attribute name="class"><xsl:value-of select="$ClassType"/></xsl:attribute>
			</xsl:if>
			<!-- First/Last Name +++++++++++++ -->
			<td class="styIRS1040PRTableCell">
				<xsl:attribute name="style">width:60%;text-align:left;<xsl:value-of select="$IsLast"/></xsl:attribute>
				<xsl:if test="$TargetNode">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="QualifyingChildFirstName"/>
					</xsl:call-template>
					<span style="width:3mm;"/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="QualifyingChildLastName"/>
					</xsl:call-template>
					<xsl:if test="$TargetNode/QualifyingChildNameControl">
						<span style="width:3mm;"/>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Part I, Line 2 - Qualifying Child <xsl:number value="position()"/> Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$TargetNode/QualifyingChildNameControl"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
				<xsl:if test="not($TargetNode)">
					<span style="width:4px"/>
				</xsl:if>
				<xsl:if test="$AddAdditionalDataMessage">
					<xsl:if test="((count($Form1040PRData/QualifyingChildInfoSSPRGrp) &gt;6) and ($Print = $Separated))">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form1040PRData/QualifyingChildInfoSSPRGrp"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</td>
			<!-- (a) +++++++++++++++++++++++ -->
			<td class="styIRS1040PRTableCell">
				<xsl:attribute name="style">width:20%;text-align:center;<xsl:value-of select="$IsLast"/></xsl:attribute>
				<xsl:if test="$TargetNode">
					<xsl:call-template name="PopulateSSN">
						<xsl:with-param name="TargetNode" select="QualifyingChildIdentifyingNum"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="not($TargetNode)">
					<span style="width:4px"/>
				</xsl:if>
			</td>
			<!-- (b) +++++++++++++++++++++++ -->
			<td class="styIRS1040PRTableCell">
				<xsl:attribute name="style">width:20%;text-align:left;border-right-width:0px;<xsl:value-of select="$IsLast"/></xsl:attribute>
				<xsl:if test="$TargetNode">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="ChildRelationshipSSPRCd"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="not($TargetNode)">
					<span style="width:4px"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template: PopulateProfitOrLossFromFarmingSection_1040PR) -->
	<xsl:template name="PopulateProfitOrLossFromFarmingSection_1040PR">
		<xsl:param name="TargetNode" select="/.."/>
		<!-- Header -->
		<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
			<!-- Content -->
			<div class="styPartName" style="width:15mm;">Parte III</div>
			<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
				Ganancias o pérdidas de negocio agropecuario. 
				<span class="styNormalText">
					Vea las instrucciones para el Anexo F<br/>
					(Formulario 1040), en inglés.
				</span>
			</div>
		</div>
		<!-- Body -->
		<div class="styBB" style="width:187mm;">
			<!-- Name and SSN section -->
			<div class="styIRS1040PRLineItem" style="height:8mm;border-bottom-width:1px;border-color:black;">
				<div class="styIRS1040PRLNDesc" style="width:80%;height:100%;padding-left:0px;font-size:7.5pt;">
					<span style="width:100%;height:auto;">Nombre del propietario</span>
					<span style="width:100%;height:auto;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode/NameOfFarmProprietor/BusinessNameLine1"/>
							</xsl:call-template>
							<xsl:if test="$TargetNode/NameOfFarmProprietor/BusinessNameLine2">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$TargetNode/NameOfFarmProprietor/BusinessNameLine2"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
					</span>
				</div>
				<div class="styIRS1040PRLNDesc" style="width:20%;height:100%;border-left-width:1px;padding-left:0px;border-color:black;font-size:7.5pt;">
					<span class="styBoldText" style="width:100%;height:auto;padding-left:4px;">Número de seguro social</span>
					<span style="width:100%;height:auto;text-align:center;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$TargetNode/SSN"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
			</div>
			<!-- Note -->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNDesc" style="padding-left:0px;width:100%;">
					<b>Nota:</b> Si radica una planilla conjunta y tanto usted como su cónyuge tuvieron una ganancia o pérdida de un negocio agropecuario, vea <b>Planillas<br/>
					conjuntas</b> y <b>Negocio que pertenece a un matrimonio,</b> en las instrucciones, para más información.
				</div>
			</div>
		</div>
		<!-- Section A -->
		<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
			<!-- Content -->
			<div class="styPartDesc" style="padding:0px 0px 0px 0px;font-size:8.5pt;width:100%;height:auto;text-align:center;">
				Sección A: Ingresos de negocio agropecuario
				<span style="width:3px;"/>
				<img src="{$ImagePath}/1040PR_Short_Line.gif" alt="Short Line"/>
				<span style="width:3px;"/>
				Método de contabilidad a base de efectivo<br/>
				<span class="styNormalText">
					Complete las Secciones A y B<br/>
					(Si usa el método de contabilidad a base de lo devengado, complete las <b>Secciones B</b> y <b>C</b>, así como la línea <b>11</b> de la <b>Sección A</b>).<br/>
					No incluya la venta de ganado usados para tiro, cría, entretenimiento o lechería.
				</span>
			</div>
		</div>
		<!-- Body -->
		<div class="styBB" style="width:187mm;">
			<!-- (1) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">1</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Venta de animales y otros artículos que compró para revender
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.3mm 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">1</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/SalesOfLivestockBghtForResale"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">1</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (2) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">2</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Costo u otra base de los animales y otros artículos que declaró en la línea <b>1</b>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5.3mm 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">.</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/CostOfLivestockBoughtForResale"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (3) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">3</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Reste la línea <b>2</b> de la línea <b>1</b>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">3</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/PurchasedProfit"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">3</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (4) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">4</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Ventas de ganado criado, productos agrícolas, granos y otros productos que cultivó
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:8px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">4</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/SalesOfProductsRaised"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">4</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (5a) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:110mm;float:left;height:5.5mm">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">5a</div>
				<div class="styIRS1040PRLNDesc" style="width:auto;height:auto;">
					<span style="font-family:arial narrow;font-size:7.8pt;">Total de distribuciones de cooperativas</span><span style="font-family:arial narrow;font-size:6pt;"> (Formulario(s) 1099-PATR)</span>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">5a</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/CooperativeDistributions"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">5a</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (5b) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:77mm;float:left;height:5.5mm">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">5b</div>
				<div class="styIRS1040PRLNDesc" style="width:auto;height:auto;">
					Cantidad tributable
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Height">100%</xsl:with-param>
									<xsl:with-param name="Number">5b</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/CooperativeDistriTxblAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Height">100%</xsl:with-param>
									<xsl:with-param name="Number">5b</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (6) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">6</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Pagos recibidos del programa de agricultura
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">6</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/AgriculturalProgramPayments"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">6</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (7) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">7</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Préstamos de la <span class="styItalicText">Commodity Credit Corporation (CCC)</span> declarados bajo elección (o decomisados)
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">7</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/CCCLoansReportedUnderElection"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">7</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (8) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">8</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Ingreso de seguro de cosechas
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">8</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/CropInsProceedsAndDisasterPymt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">8</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (9) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">9</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Ingreso de servicios prestados con maquinaria agrícola
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">9</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/CustomHireIncome"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">9</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (10) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">10</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Otros ingresos
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">10</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/OtherIncmIncludingGasFuelTaxCr"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">10</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (11) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">11</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							<b>Ingreso bruto agropecuario.</b> Sume las líneas de la columna derecha desde la línea <b>3</b> hasta la línea <b>10</b>, ambas 
							inclusive. Si es contribuyente que usa el método de contabilidad a base de lo devengado, anote la cantidad 
							que aparece en la línea <b>50</b> de la <b>Sección C</b>
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:8px"/>
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:8mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">11</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethod/GrossIncome"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">11</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
		</div>
		<!-- Section B -->
		<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
			<!-- Content -->
			<div class="styPartDesc" style="padding:0px 0px 0px 0px;font-size:8.5pt;width:100%;height:auto;text-align:center;">
				Sección B: Gastos de negocio agropecuario
				<span style="width:3px;"/>
				<img src="{$ImagePath}/1040PR_Short_Line.gif" alt="Short Line"/>
				<span style="width:3px;"/>
				Métodos de contabilidad a base de efectivo y a base de lo devengado
				<br/>
				<span class="styNormalText" style="width:100%;text-align:left;">
					No incluya gastos personales o de manutención (tales como contribuciones, seguros o reparaciones de su casa), que no fueron para la<br/>
					producción de ingreso agropecuario. Antes de anotar los gastos, a continuación, reste de éstos todo reembolso recibido por los mismos.
				</span>
			</div>
		</div>
		<!-- Body -->
		<div class="styBB" style="width:187mm;height:auto">
			<div class="styIRS1040PRCleanDiv" style="width:49.99%;height:100%;border-right-width:1px;">
				<!-- (12) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">12</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Gastos de automóvil o de camión<br/>
								(vea las instrucciones.)
								<span class="styBoldText">
									<span style="width:13px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">12</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/CarAndTruckExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">12</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (13) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">13</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Productos químicos
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">13</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/ChemicalsExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">13</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (14) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">14</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Gastos de conservación
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">14</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/ConservationExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">14</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (15) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">15</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;font-size:6pt;">
								Gastos de servicios prestados con equipo agrícola
								<!--Dotted Line
								<span class="styBoldText">
									<span style="width:4px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>-->
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">15</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/CustomHireExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">15</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (16) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">16</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Depreciación y deducciones de<br/>
								gastos hechas de acuerdo a la<br/>
								sección 179 no reclamadas en otra<br/>
								parte de esta planilla. (Adjunte el<br/>
								 <b>Formulario 4562</b> si está obligado a hacerlo)
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:4px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:78%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">16</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/DeprecAndSect179ExpnsDeduction"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">16</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (17) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">17</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Programas de beneficios para los<br/>
								empleados, excepto los incluidos<br/>
								en la línea <b>25</b>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:17px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:8mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">17</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/EmployeeBenefitProgramExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">17</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (18) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">18</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Compra de alimentos para animales
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">18</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/FeedPurchasedExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">18</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (19) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">19</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Fertilizantes y cal
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">19</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/FertilizerAndLimeExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">19</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (20) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">20</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Fletes y acarreo
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">20</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/FreightAndTruckingExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">20</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (21) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">21</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Gasolina, combustible y aceite
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">21</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/GasolineFuelAndOilExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">21</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (22) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">22</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Seguros (excepto de salud)
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">22</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/InsuranceExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">22</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (23) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">23</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Intereses:
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- (23a) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">a</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								<span style="font-family:arial narrow;font-size:7.5pt;">Sobre hipotecas (pagados a bancos, etc.)</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">23a</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/MortgageInterestExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">23a</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (23b) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">b</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Otros
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">23b</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/OtherInterestExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">23b</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (24) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">24</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Mano de obra contratada
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:9px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode and (count($TargetNode/FarmExpenses/OtherExpenses/OtherExpense) &gt;5)">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">24</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/LaborHiredExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">24</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:1px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:1px;</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/LaborHiredExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">24</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- COLUMN ADJUSTER (starts)-->
				<xsl:if test="$TargetNode and (count($TargetNode/FarmExpenses/OtherExpenses/OtherExpense) &gt;5)">
					<div class="styIRS1040PRLineItem">
						<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
							<div class="styIRS1040PRCleanDiv">
								<xsl:attribute name="style">
									width:100%;float:right;height:0mm;
									<xsl:if test="$TargetNode">
										<xsl:variable name="cnt" select="count($TargetNode/FarmExpenses/OtherExpenses/OtherExpense) + count($TargetNode/FarmExpenses/OtherExpenses/TotalPreproductivePeriodExpnss)"/><xsl:choose><xsl:when test="$cnt &gt;5">height:<xsl:value-of select="($cnt - 5)*5"/>mm;</xsl:when><xsl:otherwise>height:0mm;</xsl:otherwise></xsl:choose>
									</xsl:if>
								</xsl:attribute>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Height">100%</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
				</xsl:if>
				<!-- COLUMN ADJUSTER (ends)-->
			</div>
			<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
			<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
			<div class="styIRS1040PRCleanDiv" style="width:50%;height:100%;float:right;padding-left:3mm;">
				<!-- (25) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">25</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Planes de pensión y de<br/>
								participación en las ganancias
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:7px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">25</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/PensionAndPrftSharingExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">25</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (26) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">26</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Renta o alquiler:
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- (26a) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">a</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Vehículos, maquinaria y equipo
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">.</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">26a</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/VehMachAndEquipRentLeaseExpnss"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">26a</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (26b) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">b</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Otros (tierra, animales, etc.)
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">26b</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/OtherRentOrLeaseExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">26b</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (27) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">27</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Reparaciones y mantenimiento
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">.</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">27</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/RepairsAndMaintenanceExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">27</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (28) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">28</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Compra de semillas y plantas
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">28</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/SeedsAndPlantsExpnss"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">28</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (29) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">29</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Gastos de almacenaje
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">29</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/StorageAndWarehousingExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">29</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (30) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">30</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Compra de materiales
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">30</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/SuppliesExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">30</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (31) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">31</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Contribuciones
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">31</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/TaxesExpense"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">31</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (32) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">32</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Servicios públicos (agua,<br/>
								electricidad, gas, etc.)
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:12px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">32</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/UtilitiesExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">32</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (33) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">33</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Honorarios pagados por servicios<br/>
								veterinarios, cría y medicinas
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:12px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">33</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/VtrnryBreedingMedicineExpenses"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">33</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (34) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">34</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Otros gastos (especifique):
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:13.2mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- (34a-e) ////////////////////////////////////////////////////-->
				<xsl:choose>
					<xsl:when test="$TargetNode">
						<xsl:variable name="NumberOfOtherExpenseGrp" select="count($TargetNode/FarmExpenses/OtherFarmExpensesGrp/OtherFarmExpense)"/>
						<xsl:for-each select="$TargetNode/FarmExpenses/OtherFarmExpensesGrp/OtherFarmExpense">
							<xsl:variable name="Letter">
								<xsl:number format="a"/>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="(position() = 5) and ($TargetNode/FarmExpenses/OtherFarmExpensesGrp/TotalPreproductivePeriodExpnss)">
									<div class="styIRS1040PRLineItem">
										<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">
											<xsl:number value="position()" format="a"/>
										</div>
										<div class="styIRS1040PRLNDesc" style="width:47mm;height:5mm;">
											<span style="width:43mm;height:100%;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/OtherFarmExpensesGrp/TotalPreproductivePeriodExpnss/@section263AIndicatorCd"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
											<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
												<xsl:call-template name="CreateBox_1040PR">
													<xsl:with-param name="Number">
														<xsl:value-of select="concat('34', 'e')"/>
													</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/OtherFarmExpensesGrp/TotalPreproductivePeriodExpnss"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
									<xsl:call-template name="CreateOtherExpensesItem_1040PR">
										<xsl:with-param name="TargetNode" select="."/>
										<xsl:with-param name="Letter">
											<xsl:number value="position() + 1" format="a"/>
										</xsl:with-param>
										<xsl:with-param name="LineEData" select="$TargetNode/FarmExpenses/OtherFarmExpensesGrp"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="(position() = last()) and ($NumberOfOtherExpenseGrp &gt;=5)">
									<xsl:call-template name="CreateOtherExpensesItem_1040PR">
										<xsl:with-param name="TargetNode" select="."/>
										<xsl:with-param name="Letter">
											<xsl:choose>
												<xsl:when test="(position() &gt; 5) and ($TargetNode/FarmExpenses/OtherFarmExpensesGrp/TotalPreproductivePeriodExpnss)">
													<xsl:number value="position() + 1" format="a"/>
												</xsl:when>
												<xsl:otherwise><xsl:number value="position()" format="a"/></xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="Style">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="LineEData" select="$TargetNode/FarmExpenses/OtherFarmExpensesGrp"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateOtherExpensesItem_1040PR">
										<xsl:with-param name="TargetNode" select="."/>
										<xsl:with-param name="Letter">
											<xsl:choose>
												<xsl:when test="(position() &gt; 5) and ($TargetNode/FarmExpenses/OtherFarmExpensesGrp/TotalPreproductivePeriodExpnss)">
													<xsl:number value="position() + 1" format="a"/>
												</xsl:when>
												<xsl:otherwise><xsl:number value="position()" format="a"/></xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="LineEData" select="$TargetNode/FarmExpenses/OtherFarmExpensesGrp"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
						<xsl:if test="$NumberOfOtherExpenseGrp &lt;5">
							<xsl:call-template name="GenerateEmptyItems_1040PR">
								<xsl:with-param name="Number" select="$NumberOfOtherExpenseGrp + 1"/>
								<xsl:with-param name="MaxCount" select="5"/>
								<xsl:with-param name="LineEData" select="$TargetNode/FarmExpenses/OtherFarmExpensesGrp"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="GenerateEmptyItems_1040PR">
							<xsl:with-param name="Number" select="1"/>
							<xsl:with-param name="MaxCount" select="5"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
			<!-- (35) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:187mm;">
				<div class="styIRS1040PRLNLeftNumBox">35</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							<b>Total de gastos.</b> Sume las líneas desde la <b>12</b> a la <b>34e</b>, inclusive
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:8px"/>
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">35</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/TotalExpenses"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">35</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (36) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:187mm;">
				<div class="styIRS1040PRLNLeftNumBox">36</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							<b>Ganancias (o pérdidas) netas de negocio agropecuario.</b> Reste la línea <b>35</b> de la línea <b>11</b>. Anote el<br/>
							resultado aquí y en la línea <b>1a</b> de la Parte V
							<xsl:if test="$TargetNode">
								<xsl:if test="$TargetNode/FarmExpenses/NetFarmProfitOrLoss/@passiveActivityLossLiteralCd">
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part III, Line 36 - Passive Activity Loss Literal Code (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/NetFarmProfitOrLoss/@passiveActivityLossLiteralCd"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">	
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">36</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpenses/NetFarmProfitOrLoss"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">36</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
		<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
		<!-- Page Break and Footer-->
		<div class="pageEnd" style="width:187mm;padding-top:1mm;border-top:2px solid black;">
			<div style="float:right;">
				<span style="width:50px;"/>  
					Formulario 
				<span class="styBoldText" style="font-size:8pt;">1040-PR</span> (2013)
			</div>
		</div>
		<!-- END Page Break and Footer-->
		<!-- BEGIN Page Header -->
		<div class="styTBB" style="width:187mm;padding-top:.5mm;">
			<div style="float:left;">
				Formulario 1040-PR (2013)
			</div>
			<div style="float:right;">
				Página <span style="font-weight:bold;font-size:8pt;">3</span>
			</div>
		</div>
		<!-- END Page Header -->
		<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
		<!-- Section C -->
		<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
			<!-- Content -->
			<div class="styPartDesc" style="padding:0px 0px 0px 0px;font-size:8.5pt;width:100%;height:auto;text-align:center;">
				Sección C: Ingresos de negocio agropecuario
				<span style="width:3px;"/>
				<img src="{$ImagePath}/1040PR_Short_Line.gif" alt="Short Line"/>
				<span style="width:3px;"/>
				Método de contabilidad a base de lo devengado
				<br/>
				<span class="styNormalText">
					No incluya en las líneas a continuación la venta de ganado usados para tiro, cría, entretenimiento o lechería. Vea las instrucciones.
				</span>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<!-- (37) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">37</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Venta de ganado, productos agrícolas, granos y otros productos durante el año
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">37</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/SalesOfProducts"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">37</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (38a) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:110mm;float:left;height:5.5mm">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">38a</div>
				<div class="styIRS1040PRLNDesc" style="width:auto;height:auto;">
					<span style="font-family:arial narrow;font-size:7pt;">Total de distribuciones de cooperativas (Formulario(s) 1099-PATR)</span>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">38a</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/CooperativeDistributions"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">38a</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (38b) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:77mm;float:left;height:5.5mm">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">38b</div>
				<div class="styIRS1040PRLNDesc" style="width:auto;height:auto;">
					Cantidad tributable
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Height">100%</xsl:with-param>
									<xsl:with-param name="Number">38b</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/CooperativeDistriTxblAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Height">100%</xsl:with-param>
									<xsl:with-param name="Number">38b</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (39) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">39</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Pagos recibidos del programa de agricultura
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">39</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/AgriculturalProgramPayments"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">39</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (40) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">40</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Préstamos de la <span class="styItalicText">Commodity Credit Corporation</span> declarados bajo elección (o decomisados)
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">40</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/CCCLoansReportedUnderElection"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">40</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (41) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">41</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Ingreso de seguro de cosechas
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">41</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/CropInsuranceProceeds"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">41</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (42) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">42</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Ingreso de servicios prestados con equipo agrícola
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">42</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/CustomHireIncome"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">42</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (43) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">43</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Otros ingresos de negocio agropecuario (especifique)
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<span style="width:66.55mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;height:100%;text-align:center;">
								<xsl:if test="$TargetNode">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part III, Line 43 - Other Income Table</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/OtherIncomeGrp"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">43</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/OtherIncomeTotalAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">43</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (44) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">44</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Sume las líneas de la columna derecha desde la <b>37</b> hasta la <b>43</b>, ambas inclusive
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">44</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/TotalIncome"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">44</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (45) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">45</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							<span style="font-family:arial narrow;">Inventario de ganado, productos agrícolas, granos y otros productos al comienzo del año</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">45</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/InventoryOfProductsAtBOY"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">45</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (46) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">46</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;font-family:arial narrow;">
							Costo de ganado, productos agrícolas, granos y otros productos comprados durante el año
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">46</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/CostOfProductsPrchsDuringYear"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">46</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (47) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">47</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Sume las líneas <b>45</b> y <b>46</b>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 1mm 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">47</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/InventoryAtBOYPlusCostOfPrchs"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">47</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (48) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">48</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;font-family:arial narrow;">
							Inventario de ganado, productos agrícolas, granos y otros productos al final del año
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">48</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/InventoryOfProductsAtEOY"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">48</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (49) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">49</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;font-family:arial narrow;">
							Costo de ganado, productos agrícolas, granos y otros productos agrícolas vendidos. Reste la línea <b>48</b> de la línea <b>47*</b>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">49</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/CostOfProductsSold"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">49</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (50) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">50</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;font-family:arial narrow;">
							<b>Ingreso bruto agropecuario.</b> Reste la línea <b>49</b> de la línea <b>44</b>. Anote el resultado aquí y en la línea <b>11</b> de la Parte III.
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:8px"/>
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">50</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethod/GrossIncome"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">50</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;padding:0px 0px 0px 0px;font-size:7.5pt;">
					*Si usa el método de precio por unidad para el ganado o el método de precio de finca para valorar su inventario y la cantidad que 
					aparece en la línea <b>48</b> es mayor que la cantidad de la línea <b>47</b>, reste la línea <b>47</b> de la línea <b>48</b>. Anote el resultado en la línea <b>49</b>. Sume las 
					líneas <b>44</b> y <b>49</b>. Anote el resultado en la línea <b>50</b> y en la línea <b>11</b> de la Parte III.
				</div>
			</div>
		</div>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template: PopulateProfitLossFromBusinessSection_1040PR) -->
	<xsl:template name="PopulateProfitLossFromBusinessSection_1040PR">
		<xsl:param name="TargetNode" select="/.."/>
		<!-- Header -->
		<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
			<!-- Content -->
			<div class="styPartName" style="width:15mm;">Parte IV</div>
			<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
				<b>Ganancias o pérdidas de negocio (por cuenta propia). </b> 
				<span class="styNormalText">Vea las instrucciones para el Anexo C (Formulario 1040), en inglés.</span>
			</div>
		</div>
		<!-- Body -->
		<div class="styBB" style="width:187mm;">
			<!-- Name and SSN section -->
			<div class="styIRS1040PRLineItem" style="height:8mm;border-bottom-width:1px;border-color:black;">
				<div class="styIRS1040PRLNDesc" style="width:80%;height:100%;padding-left:0px;font-size:7.5pt;">
					<span style="width:100%;height:auto;">Nombre del propietario</span>
					<span style="width:100%;height:auto;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode/NameOfFarmProprietor"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
				<div class="styIRS1040PRLNDesc" style="width:20%;height:100%;border-left-width:1px;padding-left:0px;border-color:black;font-size:7.5pt;">
					<span class="styBoldText" style="width:100%;height:auto;padding-left:4px;">Número de seguro social</span>
					<span style="width:100%;height:auto;text-align:center;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$TargetNode/SSN"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
			</div>
			<!-- Note -->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNDesc" style="padding-left:0px;width:100%;">
					<b>Nota:</b> Si radica una planilla conjunta y tanto usted como su cónyuge tuvieron una ganancia o pérdida de un negocio, vea 
					<b>Planillas conjuntas</b> y <b>Negocio que pertenece a un matrimonio</b>, en las instrucciones, para más información.
				</div>
			</div>
		</div>
		<!-- Section A -->
		<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
			<!-- Content -->
			<div class="styPartDesc" style="padding:0px 0px 0px 0px;font-size:8.5pt;width:100%;height:auto;text-align:center;">
				Sección A
				<span style="width:3px;"/>
				<img src="{$ImagePath}/1040PR_Short_Line.gif" alt="Short Line"/>
				<span style="width:3px;"/>
				Ingresos
			</div>
		</div>
		<!-- Body -->
		<div class="styBB" style="width:187mm;">
			<!-- (1) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">1</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;font-size:7pt">
							Total de ingresos brutos $
							<span style="border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;height:100%;width:28mm;text-align:right;">
								<xsl:if test="$TargetNode">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$TargetNode/GrossReceiptsOrSalesAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode and $TargetNode/GrossReceiptsOrSalesAmt/@referenceDocumentName">
									<span style="width:4px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$TargetNode/GrossReceiptsOrSalesAmt"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<span style="width:3px;"/>
							Menos devoluciones y descuentos $
							<span style="border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;height:100%;width:28mm;text-align:right;">
								<xsl:if test="$TargetNode">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$TargetNode/ReturnsAndAllowancesAmt"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<span style="width:3px;"/>
							Saldo
							<span style="width:2px;"/>
							<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">1</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/NetGrossReceiptsAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">1</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (2a) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">2a</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Inventario al comenzar el año
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 1mm 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2a</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/BeginningOfYearInventoryAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2a</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (2b) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">b</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;font-size:7.5pt;">
							Compras menos el costo de los artículos retirados del negocio para uso personal
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2b</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/PurchasesLessPersonalItemsAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2b</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (2c) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">c</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Costo de mano de obra. No incluya ninguna cantidad pagada a usted mismo
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 1mm 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2c</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/CostOfLaborAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2c</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (2d) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">d</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Materiales y suministros
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 1mm 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2d</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/MaterialsAndSuppliesAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2d</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (2e) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">e</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Otros costos (adjunte una explicación)
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 1mm 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2e</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/OtherCostsAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2e</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (2f) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">f</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Sume las líneas desde la <b>2a</b> a la <b>2e</b>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 1mm 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2f</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/TotalCostsAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2f</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (2g) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">g</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Inventario al final del año
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 1mm 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2g</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/EndOfYearInventoryAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2g</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (2h) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">h</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Costo de mercancías vendidas. Reste la línea <b>2g</b> de la línea <b>2f</b>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2h</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/CostOfGoodsSoldAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2h</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (3) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">3</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							<b>Ganancia bruta.</b> Reste la línea <b>2h</b> de la línea <b>1</b>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">3</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/GrossProfitAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">3</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (4) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">4</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Otros ingresos
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">4</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/OtherIncomeAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">4</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (5) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">5</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							<b>Ingreso bruto.</b> Sume las líneas <b>3</b> y <b>4</b>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:6px"/>
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">5</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/GrossIncomeAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">5</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
		</div>
		<!-- Section B -->
		<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
			<!-- Content -->
			<div class="styPartDesc" style="padding:0px 0px 0px 0px;font-size:8.5pt;width:100%;height:auto;text-align:center;">
				Sección B<img src="{$ImagePath}/1040PR_Short_Line.gif" alt="Short Line"/>Gastos
			</div>
		</div>
		<!-- Body -->
		<div class="styBB" style="width:187mm;border-bottom:0px solid black;">
			<div class="styIRS1040PRCleanDiv" style="width:49.99%;height:100%;border-right-width:1px;">
				<!-- (6) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">6</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Anuncios y publicidad
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">6</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/AdvertisingAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">6</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (7) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">7</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Gastos de vehículos de motor (vea las instrucciones)
								<span class="styBoldText">
									<span style="width:21px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">7</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/CarAndTruckExpensesAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">7</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (8) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">8</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Comisiones y cuotas
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">8</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/CommissionsAndFeesAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">8</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (9) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">9</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Trabajo por contrato
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">9</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/ContractLaborAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">9</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (10) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">10</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Agotamiento
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">10</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/DepletionAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">10</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (11) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">11</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Depreciación y deducciones de<br/>
								gastos de acuerdo a la sección <br/>179	(no incluida en la <b>Sección A</b>).<br/>
								(Adjunte el <b>Formulario 4562</b> si<br/>
								está obligado a hacerlo)
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:12px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:15.5mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">11</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/DepreciationAndSection179Amt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">11</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (12) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">12</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								<span style="font-family:arial narrow;font-size:7.5pt;">Programas de beneficios para los empleados<br/>
								(excepto los incluidos en la línea <b>17</b>)</span>
								<span class="styBoldText">
									<span style="width:8px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">12</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/EmployeeBenefitProgramAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">12</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (13) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">13</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Seguros (excepto de salud)
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">13</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/InsuranceAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">13</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (14) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">14</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Intereses sobre deudas del negocio
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">14</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/InterestOnBusIndebtdnessAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">14</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (15) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">15</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Servicios legales y profesionales
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">15</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/LegalAndProfessionalServiceAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">15</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (16) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">16</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Gastos de oficina
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">16</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/OfficeExpensesAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">16</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (17) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">17</div>
					<div class="styIRS1040PRCleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								<span style="font-size:7pt;">Planes de pensión y de participación<br/>
								en las ganancias</span>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">17</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/PensionProfitSharingPlansAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">17</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
			</div>
			<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
			<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
			<div class="styIRS1040PRCleanDiv" style="width:50%;height:100%;float:right;padding-left:3mm;">
				<!-- (18) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">18</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Renta o alquiler:
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- (18a) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">a</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Vehículos, maquinaria y equipo
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">18a</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/MachineryAndEquipmentRentAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">18a</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (18b) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">b</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Otra propiedad comercial
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">18b</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/OtherBusinessPropertyRentAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">18b</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (19) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">19</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Reparaciones y manutención
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">19</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/RepairsAndMaintenanceAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">19</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (20) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">20</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								<span style="font-family:arial narrow;font-size:7.5pt;">Materiales (no incluidos en la <b>Sección A</b>)</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">20</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SuppliesAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">20</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (21) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">21</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Contribuciones y licencias
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">21</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/TaxesAndLicensesAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">21</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (22) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">22</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Gastos de viaje, comidas y<br/>
								entretenimiento:
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- (22a) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">a</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Viajes
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">22a</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/TravelAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">22a</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (22b) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">b</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								<span style="font-size:7pt;">Comidas y entretenimiento deducibles</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">22b</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/MealsAndEntertainmentAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">22b</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (23) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem">
					<div class="styIRS1040PRLNLeftNumBox">23</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Servicios públicos (agua,<br/>
								electricidad, gas, etc.)
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:10px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">23</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/UtilitiesAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">23</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (24) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem" style="">
					<div class="styIRS1040PRLNLeftNumBox">24</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Salarios no incluidos en la línea <b>2c</b>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">24</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/WagesLessEmploymentCreditsAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">24</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- (25a) ////////////////////////////////////////////////////-->
				
				<div class="styIRS1040SSPRLineItem" style="float:none;clear:both">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">25a</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:84mm;height:7mm;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:56.8%;height:100%;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                <span style="font-family:arial narrow">Otros gastos (indique la clase<br/>
								de gasto y la cantidad):</span>
              </div>
              
            </div>
            <div class="styIRS1040SSPRLNDesc" style="background-color:lightgrey;width:9.7%;height:100%;border-left:1px solid black;border-right:1px solid black"/>
          </div>
          </div>
          <xsl:choose>
            <xsl:when test="$TargetNode">
            <xsl:variable name="NumberOfOtherBusinessExpensesGrp" select="count($TargetNode/OtherBusinessExpenses)"/>
              <xsl:for-each select="$TargetNode/OtherBusinessExpenses">
              <div class="styIRS1040SSPRCleanDiv" style="float:none;width:90mm;height:auto;padding:0px 0px 0px 0px;padding-left:5mm">
              <div class="styIRS1040SSPRLNDesc" style="float:none;width:auto;padding-top:0;padding-bottom:0">
              <div class="styGenericDiv" style="width:55.7%;border-bottom:1px dashed black;">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="./Description"/>
				  </xsl:call-template>
				  <xsl:if test="./@referenceDocumentName">
					  <span style="width:4px"/>
					  <xsl:call-template name="SetFormLinkInline">
						  <xsl:with-param name="TargetNode" select="."/>
					  </xsl:call-template>
				  </xsl:if>
				  </div>
				 <div class="styGenericDiv" style="background-color:lightgrey;width:9.9%;height:100%;border-left:1px solid black;border-right:1px solid black"/>
				 <div class="styGenericDiv" style="padding-left:6.0mm;float:right;width:34%;font-size:7pt;">
					 <xsl:call-template name="PopulateAmount">
						 <xsl:with-param name="TargetNode" select="Amount"/>
					 </xsl:call-template>
				 </div>
				 </div>
				 </div>
              </xsl:for-each>
              <xsl:if test="$NumberOfOtherBusinessExpensesGrp &lt; 3">
				  <xsl:call-template name="GenerateEmptyOtherBusinessExpensesItems_1040SS">
					<xsl:with-param name="Number" select="$NumberOfOtherBusinessExpensesGrp + 1"/>
					<xsl:with-param name="MaxCount" select="3"/>
				  </xsl:call-template>
              </xsl:if>
            </xsl:when>
            </xsl:choose> 
        
				
				
			</div>
		</div>
<!-- (25b) ////////////////////////////////////////////////////-->
<table cellpadding="0" cellspacing="0" style="page-break-before: avoid;">
	<tr style="page-break-before: avoid;">
	<td style="page-break-before: avoid;">
				<div class="styIRS1040PRLineItem" style="width:187mm;">					
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">25b</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/TotalOtherExpensesAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">25b</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>					
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Total de los demás gastos
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px; float:right;">b</div>
				</div>		
		 </td>
        </tr>
        </table>
			<!-- (26) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:187mm;border-top:1px solid black;">
				<div class="styIRS1040PRLNLeftNumBox">26</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							<b>Total de gastos.</b> Sume las líneas desde la <b>6</b> a la <b>25b</b>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:8px"/>
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">26</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/TotalExpensesAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">26</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (27) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:187mm;border-bottom:2px solid black;">
				<div class="styIRS1040PRLNLeftNumBox">27</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							<b>Ganancia (o pérdida) neta.</b> Reste la línea <b>26</b> de la línea <b>5</b>. Anote el resultado aquí y en la línea <b>2</b> de la <span style="font-size:7pt;">Parte V</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">27</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/NetProfitOrLossAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">27</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template: PopulateSelfEmploymentTaxSection_1040PR) -->
	<xsl:template name="PopulateSelfEmploymentTaxSection_1040PR">
		<xsl:param name="TargetNode" select="/.."/>
		<!-- Header -->
		<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
			<!-- Content -->
			<div class="styPartName" style="width:15mm;">Parte V</div>
			<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
				Contribución sobre el ingreso del trabajo por cuenta propia.  Nota:
				<span class="styNormalText">Si recibió</span> ingresos como empleado<br/>
				<span class="styNormalText"><b>de una iglesia</b>, vea las instrucciones antes de seguir.</span>
			</div>
		</div>
		<!-- Body -->
		<div class="styBB" style="width:187mm;">
			<!-- Name and SSN section -->
			<div class="styIRS1040PRLineItem" style="height:8mm;border-bottom-width:1px;border-color:black;">
				<div class="styIRS1040PRLNDesc" style="width:55%;height:100%;padding-left:0px;font-size:6pt;">
					<span style="width:100%;height:auto;">Nombre del individuo que recibió <b>ingresos del trabajo por cuenta propia</b></span>
					<span style="width:100%;height:auto;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode/PersonName"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
				<div class="styIRS1040PRLNDesc" style="width:25%;height:100%;border-left-width:1px;padding-left:0px;border-color:black;font-size:6pt;">
					<span class="styNormalText" style="width:100%;height:50%;padding-left:4px;">
						Número de seguro social del individuo con<br/><b>ingresos del trabajo por cuenta propia</b>
						<span style="width:4px;"/>
						<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
					</span>
				</div>
				<div class="styIRS1040PRLNDesc" style="width:20%;height:100%;border-left-width:1px;padding-left:0px;border-color:black;font-size:7.5pt;">
					<span style="width:100%;height:auto;text-align:center;padding-top:2mm;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$TargetNode/SSN"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
			</div>
			<!-- Note -->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNDesc" style="padding-left:0px;width:100%;">
					<b>Nota:</b> Si radica una planilla de contribución conjunta y tanto usted como su cónyuge recibieron ingresos del trabajo por cuenta propia, <b>cada uno</b> de 
					ustedes tiene que completar una Parte V <b>por separado.</b>
				</div>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<!-- (A) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-left:0px;text-align:left;">A</div>
				<div class="styIRS1040PRLNDesc" style="width:181mm;height:auto;">
					Si es ministro, miembro de una orden religiosa o practicante de la Ciencia Cristiana <b>y</b> radicó el Formulario 4361, pero obtuvo <b>otras</b><br/>
					ganancias netas de $400 o más del trabajo por cuenta propia, marque este encasillado y continúe con la Parte V
					<!--Dotted Line-->
					<span class="styBoldText">
						<span style="width:4px"/>.
						<span style="width:11px"/>.
						<span style="width:11px"/>.
						<span style="width:11px"/>.
						<span style="width:11px"/>.
					</span>
					<span style="width:3mm;"/>
					<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
					<span style="width:4mm;"/>
					<input type="checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$TargetNode/ExemptForm4361Ind"/>
							<xsl:with-param name="BackupName">Form1040PRDataSelfEmploymentTaxGrp<xsl:number value="position()"/>ExemptForm4361Ind</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$TargetNode/ExemptForm4361Ind"/>
							<xsl:with-param name="BackupName">Form1040PRDataSelfEmploymentTaxGrp<xsl:number value="position()"/>ExemptForm4361Ind</xsl:with-param>
						</xsl:call-template>
					</label>
				</div>
			</div>
			<!-- (1a) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">1a</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Ganancia (o pérdida) neta de un negocio agropecuario procedente de la línea <b>36</b>, Parte III, más la parte que<br/>
							usted recibió de una sociedad agropecuaria. <b>Nota:</b> No complete las líneas <b>1a</b> y <b>1b</b> si usa el método opcional<br/>
							para calcular la ganancia neta de un negocio agropecuario (vea las instrucciones)
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:8mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;border-top-width:1px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;border-top-width:1px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">1a</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/NetFarmProfitLossAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">1a</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (1b) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">b</div>
				<div class="styIRS1040PRCleanDiv" style="width:142mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Si recibió beneficios de jubilación o por incapacidad del seguro social, 
							anote la cantidad incluida en la línea <b>6</b> de la Parte III procedente de pagos del Programa de Reservas para 
							la Conservación de Tierras más su participación distribuible de dichos pagos procedentes de sociedades colectivas agrícolas
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:8mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">1b</xsl:with-param>
									<xsl:with-param name="AddParentheses">true</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/ConservationReserveProgPymtAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">1b</xsl:with-param>
									<xsl:with-param name="AddParentheses">true</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (2) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">2</div>
				<div class="styIRS1040PRCleanDiv" style="width:142mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Ganancia (o pérdida) neta procedente de un negocio no agropecuario, la cantidad de la línea <b>27</b>, Parte IV, más la 
							parte recibida por usted de una sociedad no agropecuaria. Los ministros o miembros de una orden religiosa 
							deben ver las instrucciones para obtener las cantidades que tienen que declarar en esta línea y  
							para saber qué otros ingresos debe declarar. <b>Nota:</b> No llene esta línea si usa el método 
							opcional para calcular la ganancia neta de un negocio no agropecuario (vea las instrucciones).
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:20px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:15mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/NetNonFarmProfitLossAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (3) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">3</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Combine las líneas <b>1a, 1b</b> y <b>2</b>
							<xsl:if test="$TargetNode">
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd">
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Self-Employment Tax Exempt Code (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt">
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Self-Employment Tax Exempt Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd">
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Chap 11 Bankruptcy Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt">
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Chap 11 Bankruptcy Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseCd">
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Community Income Taxed To Spouse Code (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseAmt">
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Community Income Taxed To Spouse Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd">
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Exempt Community Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt">
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Exempt Community Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd">
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Additional Income Or Loss Code (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt">
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Additional Income Or Loss Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd)">
									<span style="width:11px"/>.
								</xsl:if>
								<xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt)">
									<span style="width:11px"/>.
								</xsl:if>
								<xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd)">
									<span style="width:11px"/>.
								</xsl:if>
								<xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt)">
									<span style="width:11px"/>.
								</xsl:if>
								<xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseCd)">
									<span style="width:11px"/>.
								</xsl:if>
								<xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseAmt)">
									<span style="width:11px"/>.
								</xsl:if>
								<xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd)">
									<span style="width:11px"/>.
								</xsl:if>
								<xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt)">
									<span style="width:11px"/>.
								</xsl:if>
								<xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd)">
									<span style="width:11px"/>.
								</xsl:if>
								<xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt)">
									<span style="width:11px"/>.
								</xsl:if>
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">3</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">3</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (4a) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">4a</div>
				<div class="styIRS1040PRCleanDiv" style="width:142mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							<span style="font-size:8.5pt;font-family:arial narrow;">
								Si la línea <b>3</b> es más de cero, multiplique la línea <b>3</b> por el 92.35% (0.9235). De otro modo, anote la cantidad de la línea <b>3</b>
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">4a</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/MinimumProfitForSETaxAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">4a</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;"/>
				<div class="styIRS1040PRCleanDiv" style="width:142mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							<b>Nota:</b> Si la línea <b>4a</b> es menor de $400 debido a los pagos del Programa del fondo de conservación en la línea <b>1b</b>, vea las instrucciones..
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<!-- (4b) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">b</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Si eligió uno (o ambos) de los dos métodos opcionales, anote aquí el total de las líneas <b>2</b> y <b>4</b> de la Parte VI
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">4b</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/OptionalMethodAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">4b</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (4c) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">c</div>
				<div class="styIRS1040PRCleanDiv" style="width:142mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Combine las líneas <b>4a</b> y <b>4b</b>. Si es menos de $400, <b>deténgase</b>; no adeuda la contribución federal sobre el trabajo por cuenta 
							propia. <b>Excepción:</b> Si es menos de $400 y usted tenía ingresos como empleado de una iglesia, anote -0- y continúe
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:9px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:6px"/>
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:8mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">4c</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/CombinedSEAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">4c</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (5a) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">5a</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Anote sus <b>ingresos como empleado de una iglesia</b> del (de los) Formulario(s) 
							499R-2/W-2PR o W-2. Vea las instrucciones para ver la definición 
							de ingresos recibidos por ser empleado de una iglesia
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">5a</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/W2WagesFromChurchesAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">5a</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (5b) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">b</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Multiplique la línea <b>5a</b> por el 92.35% (0.9235). Si es menos de $100, anote -0-
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">5b</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/MinAllowableChurchWagesAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">5b</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (6) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">6</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Sume las líneas <b>4c</b> y <b>5b</b>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:6px"/>
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">6</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/CombinedSEAndChurchWagesAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">6</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (7) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">7</div>
				<div class="styIRS1040PRCleanDiv" style="width:142mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Cantidad máxima de salarios e ingreso del trabajo por cuenta propia combinados sujeta a la contribución al seguro social para 2013
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:9px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Number">7</xsl:with-param>
							<xsl:with-param name="StaticText">113,700.00</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<!-- (8a) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">8a</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Total de salarios y propinas sujetos a la contribución al seguro social, según 
							aparecen en el (los) Formulario(s) 499R-2/W-2PR o W-2. Si es $113,700 o más, 
							no complete las líneas desde la <b>8b</b> hasta la <b>10</b> y continúe en la línea <b>11</b>
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:25px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:3mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:3mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">8a</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/SocSecWagesAndTipsAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">8a</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (8b) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">b</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Propinas que no declaró a su patrono y que están sujetas a la contribución al seguro 
							social de la línea <b>10</b> del Formulario 4137 (vea las instrucciones)
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:22px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">8b</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/UnreportedTipsSubjToSocSecAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">8b</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (8c) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">c</div>
				<div class="styIRS1040PRCleanDiv" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Salarios sujetos a la contribución al seguro social de la línea <b>10</b> del Formulario 8919 (vea las instrucciones)
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:5px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:5mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">8c</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/WagesSubjectToSSTAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">8c</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (8d) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">d</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Sume las líneas <b>8a, 8b</b> y <b>8c</b>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">8d</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/TotalWagesAndUnreportedTipsAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">8d</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (9) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">9</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							<span style="font-family:arial narrow;font-size:8.5pt;">Reste la línea <b>8d</b> de la línea <b>7</b>.</span> Si es cero o menos, anote -0- aquí y también en la línea <b>10</b> y pase a la línea <b>11</b>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:2px 10px 0px 0px;">
							<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">9</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/AllowableSEAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">9</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (10) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">10</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Multiplique por el 12.4% (.124) la cantidad que sea <b>menor</b> entre la línea <b>6</b> o la línea <b>9</b>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">10</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/TaxBaseAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">10</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (11) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">11</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Multiplique por el 2.9% (0.029) la cantidad de la línea <b>6</b>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">11</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/SEBaseAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">11</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (12) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNLeftNumBox">12</div>
				<div class="styIRS1040PRCleanDiv" style="width:142mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							<b>Contribución sobre el trabajo por cuenta propia.</b> Sume las líneas <b>10</b> y <b>11</b>. Anote el resultado aquí y en la línea <b>3</b> de la Parte I
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:9px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">12</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/SelfEmploymentTaxAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">12</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
		</div>
		<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
		<!-- Begin Part VI																								 -->
		<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
		<!-- Header -->
		<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
			<!-- Content -->
			<div class="styPartName" style="width:15mm;">Parte VI</div>
			<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
				Métodos opcionales para calcular la ganancia neta. 
				<span class="styNormalText">Vea las instrucciones para las limitaciones.</span>
			</div>
		</div>
		<!-- Body -->
		<div class="styBB" style="width:187mm;">
			<!-- Note -->
			<div class="styIRS1040PRLineItem">
				<div class="styIRS1040PRLNDesc" style="padding-left:0px;width:100%;">
					<b>Nota:</b><span style="width:4px;"/>Si radica una planilla conjunta y tanto usted como su cónyuge eligen usar un método opcional para calcular sus ganancias netas, <b>cada uno</b> de 
					ustedes tiene que completar y adjuntar una Parte VI <b>por separado</b>.
				</div>
			</div>
		</div>
			<!-- (**) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:187mm;">
				<div class="styIRS1040PRLNLeftNumBox"/>
				<div class="styIRS1040PRLNDesc" style="width:144mm;height:auto;">
					<b>Método opcional<span style="width:3px;"/><img src="{$ImagePath}/1040PR_Short_Line.gif" alt="Small Bullet"/><span style="width:3px;"/>Negocio agropecuario</b>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<!-- (1) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:187mm;">
				<div class="styIRS1040PRLNLeftNumBox">1</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Ingreso máximo para los efectos de los métodos opcionales
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Number">1</xsl:with-param>
							<xsl:with-param name="StaticText">4,640.00</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<!-- (2) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:187mm;border-bottom:1px solid black;">
				<div class="styIRS1040PRLNLeftNumBox">2</div>
				<div class="styIRS1040PRCleanDiv" style="width:142mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Anote <b>la cantidad menor entre</b>: dos tercios (2/3) del ingreso bruto del negocio agropecuario (la línea <b>11</b> de la 
							Parte III, más la parte recibida por usted de una sociedad agropecuaria) pero no menos de cero; <b>o</b> $4,640.
							 Incluya esta cantidad en la línea <b>4b</b> de la Parte V, anteriormente
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:19px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:8mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/SETaxFarmOptionalMethodAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (**) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:187mm;">
				<div class="styIRS1040PRLNLeftNumBox"/>
				<div class="styIRS1040PRLNDesc" style="width:144mm;height:auto;">
					<b>Método opcional<span style="width:3px;"/><img src="{$ImagePath}/1040PR_Short_Line.gif" alt="Small Bullet"/><span style="width:3px;"/>Negocio no agropecuario</b>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<!-- (3) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:187mm;">
				<div class="styIRS1040PRLNLeftNumBox">3</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Reste la línea <b>2</b> de la línea <b>1</b>
						</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">3</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/SETaxNonFarmOptionalBaseAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">3</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (4) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:187mm;border-bottom:2px solid black;">
				<div class="styIRS1040PRLNLeftNumBox">4</div>
				<div class="styIRS1040PRCleanDiv" style="width:142mm;height:auto;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Anote <b>la cantidad menor entre</b>: dos tercios (2/3) del ingreso bruto del negocio no agropecuario (la línea <b>5</b> de la 
							Parte IV, más la parte recibida por usted de una sociedad colectiva no agropecuaria) pero no menos de cero;
							 <b>o</b> la cantidad que aparece en la línea <b>3</b> de la Parte VI, anteriormente. Incluya también esta cantidad en la línea
							  <b>4b</b> de la Parte V, anteriormente
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:24px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
							</span>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:11mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">4</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/SETaxNonFarmOptionalMethodAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">4</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
	</xsl:template>
  
</xsl:stylesheet>
