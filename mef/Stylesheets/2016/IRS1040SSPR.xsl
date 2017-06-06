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
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
        <meta name="Desc" content="IRS Form 1040SSPR"/>
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
      <body class="styBodyClass" style="width:187mm;">
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
                    1040-PR 
                  </xsl:if>
                </span>
              </div><br/>
              <!--General Dependency Push Pin-->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData"/>
              </xsl:call-template>
              <xsl:if test="$Form1040SSPRData/PrimaryDeathDt">
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Top Left Margin - Primary Date of Death</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/PrimaryDeathDt"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="$Form1040SSPRData/SpouseDeathDt">
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Top Left Margin - Spouse Date of Death</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/SpouseDeathDt"/>
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
              <span class="styAgency" style="padding-top:3.25mm;">Department of the Treasury</span>
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
                      U.S. Virgin Islands, Guam, American Samoa, the Commonwealth of the Northern
                      Mariana Islands, or Puerto Rico. For the year Jan. 1-Dec. 31, 2016,<br/>
                      or other tax year beginning
                      <span style="width:25mm;padding-left:3px;text-align:center;">
                        <xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
                      </span>
                      , and ending
                      <span style="width:25mm;padding-left:3px;text-align:center;">
                        <xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
                      </span>.<br/>
                      <img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/> Information about Form 1040-SS and its separate instructions is at
                      <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form1040ss"><i>www.irs.gov/form1040ss.</i></a>
                    </div>
                  </div>
                </span>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;border-left-width:2px;height:20mm;">
              <div class="styOMB" style="height:4mm;font-size:7pt;">OMB No. 1545-0090</div>
              <div class="styTY" style="padding-top:2mm;">20<span class="styTYColor">16</span>
              </div>
            </div>
          </div>
          <!--  End Header section 1 -->
          <div class="styBB" style="width:187mm;height:41mm;">
            <div class="styIRS1040SSPRCleanDiv" style="width:3%;height:100%;">
              <span style="width:100%;height:auto;padding-top:6mm;">
                <img src="{$ImagePath}/1040SS_Please_Print.gif" alt="Please Type or Print"/>
              </span>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:97%;height:100%;border-left-width:1px;">
              <!-- Line 1 -->
              <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:20%;border-bottom-width:1px;">
                <div class="styIRS1040SSPRCleanDiv" style="width:38%;height:100%;border-right-width:1px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;auto;font-size:7pt;padding:0mm 0mm 0mm 1mm;">
                    Your first name and initial
                  <span style="width:.5mm;padding:.5mm 0mm 0mm 1mm;"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Header - Header - In Care Of Name</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
                    </xsl:call-template>                    
                  </div>
                  <span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">Name</xsl:with-param>
                      <xsl:with-param name="BackupName">RtnHdrDataFilerName</xsl:with-param>
                    </xsl:call-template>
                  </span>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:38%;height:100%;border-right-width:1px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    Last name
                  </div>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:23.9%;height:100%;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    <b>Your social security number</b>
                  </div>
                  <span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
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
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:0mm 0mm 0mm 1mm;">
                    If a joint return, spouse's first name and initial
                    <span style="width:.5mm;"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
                    </xsl:call-template>
                  </div>               
                  <span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">SpouseName</xsl:with-param>
                      </xsl:call-template>
                  </span>                      
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:38%;height:100%;border-right-width:1px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    Last name
                  </div>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:23.9%;height:100%;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    <b>Spouse's social security number</b>
                  </div>
                  <span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
                      <xsl:with-param name="EINChanged">true</xsl:with-param>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
              <!-- Line 3 -->
              <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:20%;border-bottom-width:1px;">
                <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                  Present home address (number, street, and apt. no., or rural route)
                </div>
                <span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                  <xsl:if test="$RtnHdrData/Filer/USAddress">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine1</xsl:with-param>
                    </xsl:call-template>
                    <span style="width:2mm;"/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine2</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$RtnHdrData/Filer/ForeignAddress">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine1</xsl:with-param>
                    </xsl:call-template>
                    <span style="width:2mm;"/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine2</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                </span>
              </div>
              <!-- Line 4 -->
              <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:20%;border-bottom-width:1px;">
                <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                  City, town or post office, commonwealth or territory, and ZIP code
                </div>
                <span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                  <xsl:choose>
                    <xsl:when test="$RtnHdrData/Filer/ForeignAddress">
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">CityNm</xsl:with-param>
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
                <div class="styIRS1040SSPRCleanDiv" style="width:95mm;height:100%;border-right-width:1px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    Foreign country name
                  </div>                
                  <span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
                        <xsl:with-param name="MainForm" select="true()"/>
                      </xsl:call-template>
                  </span>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:57mm;height:100%;border-right-width:1px;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    Foreign province/state/county
                  </div>
                  <span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
                    </xsl:call-template>
                  </span>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:25mm;height:100%;">
                  <div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    Foreign postal code
                  </div>
                  <span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
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
            <div class="styPartName" style="width:12mm;height:4mm;font-size:9pt;background-color:black">Part I</div>
            <div class="styPartDesc" style="padding-left:2mm;font-size:9pt;padding-top:.25mm;">
              Total Tax and Credits
            </div>
          </div>
          <!-- Body -->
          <div class="styBB" style="width:187mm;">
            <!-- (1) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="height:18mm;">
              <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">1</div>
              <div class="styIRS1040SSPRLNDesc" style="width:181mm;">
                <b>Filing status.</b> Check the box for your filing status (see instructions).<br/>
                <input type="checkbox" class="styCkbox" style="margin:.5mm 0mm;">
                  <xsl:call-template name="PopulateEnumeratedCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/IndividualReturnFilingStatusCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataIndividualReturnFilingStatusCd[1]</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:.25mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/IndividualReturnFilingStatusCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataIndividualReturnFilingStatusCd[1]</xsl:with-param>
                  </xsl:call-template>
                  Single
                </label>
                <br/>
                <input type="checkbox" class="styCkbox" style="margin:.5mm 0mm;">
                  <xsl:call-template name="PopulateEnumeratedCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/IndividualReturnFilingStatusCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataIndividualReturnFilingStatusCd[2]</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:.25mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/IndividualReturnFilingStatusCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataIndividualReturnFilingStatusCd[2]</xsl:with-param>
                  </xsl:call-template>
                  Married filing jointly
                </label>
                <br/>
                <input type="checkbox" class="styCkbox" style="margin:.5mm 0mm;">
                  <xsl:call-template name="PopulateEnumeratedCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/IndividualReturnFilingStatusCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataIndividualReturnFilingStatusCd[3]</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:.25mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/IndividualReturnFilingStatusCd"/>
                    <xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
                    <xsl:with-param name="BackupName">Form1040SSPRDataIndividualReturnFilingStatusCd[3]</xsl:with-param>
                  </xsl:call-template>
                  Married filing separately. Enter spouse's social security no. above and full name here. <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
                    <span style="width:55mm;border-width:0px 0px 1px 0px;border-style:solid;border-color:black;font-size:7pt;margin-left:2mm;">
                    <xsl:if test="$Form1040SSPRData/SpouseNm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form1040SSPRData/SpouseNm"/>
                      </xsl:call-template>
                    </xsl:if>
                  </span>
                </label>
              </div>
            </div>
            <!-- (2) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="height:7mm;">
              <div class="styIRS1040SSPRLNLeftNumBox" style="padding:0mm 1.5mm .75mm 0mm;">2</div>
              <div class="styIRS1040SSPRLNDesc" style="width:180mm;padding:0mm 0mm 1mm 2.5mm;">
                <b>Qualifying children.</b> Complete <b>only</b> if you are a bona fide resident of Puerto Rico and you are claiming the additional child tax credit
                <br/> (see instructions).
              </div>
              <div class="styGenericDiv" style="width:3.2mm;height:4mm;float:right;clear:none;">
                <!-- button display logic -->
                <xsl:call-template name="SetDynamicTableToggleButton">
                  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/QualifyingChildInfoSSPRGrp"/>
                  <xsl:with-param name="containerHeight" select="6"/>
                  <xsl:with-param name="containerID" select=" 'QualifyingChildInfoSSPRGrpDiv' "/>
                  <xsl:with-param name="headerHeight" select="1"/>
                </xsl:call-template>
                <!-- end button display logic -->
              </div>
            </div>
          </div>
          <div class="styBB" style="width:187mm;border-bottom-width:.1px">
            <!-- (Table) ///////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="width:187mm;height:auto;">
              <div id="QualifyingChildInfoSSPRGrpDiv" class="styTableContainerNBB" style="width:187mm;clear:all;height:auto;"> 
                <xsl:call-template name="SetInitialState"/>
                <table class="styTable" cellspacing="0">
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
            <div class="styIRS1040SSPRLineItem" style="height:4mm;">
              <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">3</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                    Self-employment tax from Part V, line 12.
                    <!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....................</span>
                  </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">3</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/SelfEmploymentTaxAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (4) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="height:4mm;">
              <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">4</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                    Household employment taxes (see instructions). Attach Schedule H (Form 1040)
                    <!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......</span>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/HouseholdEmploymentTaxAmt"/>
					</xsl:call-template>					
                  </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">4</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/HouseholdEmploymentTaxAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
           <!-- (5) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="height:4mm;">
              <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.65mm;">5</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                    Additional Medicare Tax.  Attach Form 8959
                    <!--Dotted Line-->                    
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....................</span>
                  </div>
				  <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
				  <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">5</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalAMRRTTaxAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (6) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="height:4mm;">
              <div class="styIRS1040SSPRLNLeftNumBox">6</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                    <b>Total tax.</b> Add lines 3 through 5 (see instructions)
                    <!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........</span>
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
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">6</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/TotalTaxAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (7) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="height:4mm;">
              <div class="styIRS1040SSPRLNLeftNumBox">7</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding-top:.75mm;">
                    2016 estimated tax payments (see instructions)
                    <!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>
                  </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">7</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/EstimatedTaxPaymentsAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (8) ////////////////////////////////////////////////////-->
           <div class="styIRS1040SSPRLineItem" style="height:4mm;">
              <div class="styIRS1040SSPRLNLeftNumBox">8</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding-top:.65mm;">
                    Excess social security tax withheld (see instructions)
                    <!--Dotted Line-->                    
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......</span>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ExSocSecTaxWithheldAmt"/>
					</xsl:call-template>							
                  </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">8</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ExSocSecTaxWithheldAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (9) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="height:4mm;">
              <div class="styIRS1040SSPRLNLeftNumBox">9</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding-top:.75mm;">
                    Additional child tax credit from Part II, line 3
                    <!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...........</span>
                  </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">9</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ACTCBonaFideResidentsGrp/AdditionalChildTaxCreditAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (10) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="height:4mm;">
              <div class="styIRS1040SSPRLNLeftNumBox">10</div>  
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding-top:.7mm;">
                    Health coverage tax credit. Attach Form 8885 
                    <!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........</span>
                 </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
				<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
					<xsl:call-template name="CreateBox_1040SS">
						<xsl:with-param name="Number">10</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/HealthCoverageTaxCreditAmt"/>
					</xsl:call-template>
				</div>
              </div>
            </div>
            <!-- (11) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="height:4mm;">
              <div class="styIRS1040SSPRLNLeftNumBox">11</div>
                   <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding-top:.75mm;">
                    <b>Total payments and credits</b> (see instructions)
                   <!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>                    
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Part I, Line 11 - Request for Extension Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalPaymentsAmt/@requestForExtensionCd"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Part I, Line 11 - Request for Extension Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalPaymentsAmt/@requestForExtensionAmt"/>
                    </xsl:call-template>
                     <xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Part I, Line 11 - Additional Medicare Tax Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/AddnlMedicareTaxWithheldGrp/AdditionalMedicareTaxCd"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Part I, Line 11 - Additional Medicare Withholding Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSPRData/AddnlMedicareTaxWithheldGrp/AddlMedcrRRTTaxWithholdingAmt"/>
                    </xsl:call-template>
                  </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">11</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalPaymentsAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (12) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="height:4mm;">
              <div class="styIRS1040SSPRLNLeftNumBox">12</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                    If line 11 is more than line 6, subtract line 6 from line 11. This is the amount you <b>overpaid</b>
                   <!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....</span>                    
                  </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.5mm;">
                    Amount of line 12 you want <b>refunded to you.</b> If Form 8888 is attached, check here
                  <!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>                       
                  </div>
                    <xsl:choose>
                        <xsl:when test="$Form1040SSPRData/Form8888Ind/@referenceDocumentId">
                          <span style="width:.25mm;"/>
                          <xsl:call-template name="SetFormLinkInline">
                            <xsl:with-param name="TargetNode" select="$Form1040SSPRData/Form8888Ind"/>
                          </xsl:call-template>
                          <span style="width:.25mm;"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <span style="width:.25mm"/>
                        </xsl:otherwise>
                      </xsl:choose>
                      <span style="width:.5mm"/>                                        
                      <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
                       <span style="width:.5mm"/>  
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
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">13a</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/RefundAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (13b-13c) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="padding-left:150mm;height:3mm;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRLineItem" style="height:4mm;">
              <div class="styIRS1040SSPRLNLeftNumBox" style="padding:1mm 0mm .5mm 0mm;">b</div>
              <div class="styIRS1040SSPRLNDesc" style="width:25mm;padding:.5mm 0mm 1mm 1mm;;">
                Routing Number
              </div>
              <span class="styLNCtrNumBox" style="width:50mm;height:4mm;border-width:1px 1px 1px 1px;text-align:center;margin-top:.5mm;padding:.5mm 0mm 0mm 0mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/RoutingTransitNum"/>
                </xsl:call-template>
              </span>
              <span style="width:1mm;"/>
              <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
              <span style="width:.5mm;"/>
              <span class="styBoldText">c</span> Type:
              <span style="width:.5mm;"/>              
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
                <span style="width:.5mm;"/>
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
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (13d) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="height:4mm;">
              <div class="styIRS1040SSPRLNLeftNumBox" style="padding:2.5mm 0mm 0mm 0mm;">d</div>
              <div class="styIRS1040SSPRLNDesc" style="width:25mm;padding:2.25mm 0mm 0mm 1mm;">
                Account Number
              </div>                
              <span class="styLNCtrNumBox" style="width:90mm;height:4mm;border-width:1px 1px 1px 1px;text-align:center;margin-top:1.5mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/DepositorAccountNum"/>
                </xsl:call-template>
              </span>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div class="styIRS1040SSPRLineItem" style="padding-left:150mm;height:4mm;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (14) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="height:4mm;">
              <div class="styIRS1040SSPRLNLeftNumBox">14</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.65mm;">
                    Amount of line 12 you want <b>applied to 2017 estimated tax</b>
                    <!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....</span>          
                   <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>					             
                  </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">14</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/AppliedToEsTaxAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (15) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="height:7.5mm;">
              <div class="styIRS1040SSPRLNLeftNumBox">15</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-bottom:.5mm;">
                    <b>Amount you owe.</b> If line 6 is more than line 11, subtract line 11 from line 6. For details on how
						 to pay,<br/> see instructions
                    <!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.............................</span>          
                      <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>	
				  </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="AmountBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">15</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/OwedAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Third Party Designee -->
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <div class="styBB" style="width:187mm;border-top-width:1.25px;">
            <div class="styIRS1040SSPRLineItem" style="height:12mm;">
              <!-- Header -->
            <div style="width:22mm;float:left;">
              <div style="padding-top:1mm;padding-bottom:0mm;">
                <span class="styMainTitle" style="font-size:11pt;">
                   Third Party</span>
                 <span style="font-weight:bold;font-size:11pt;padding-top:.25mm;">  
                   Designee                
                </span>
              </div>
            </div>              
              <!-- Body -->
			   <div style="float:left;width:165mm;">
				  <div style="font-size:7pt;float:left;padding:.75mm 0mm 0mm 3mm;">
						 Do you want to allow another person to discuss this return with the IRS (see instructions)?
				</div>
                <!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
			  <div style="float:left;padding:0mm 0mm 2mm .25mm;">
                <!-- Checkbox -->                
                      <xsl:call-template name="PopulateSpan">
                        <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneeInd"/>
                      </xsl:call-template>                    
                     <input type="checkbox" class="styCkbox" style="margin:.25mm .25mm;">
                        <xsl:if test="$Form1040SSPRData/ThirdPartyDesigneeInd">
                          <xsl:call-template name="PopulateYesCheckbox">
                            <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneeInd"/>
                            <xsl:with-param name="BackupName">IRS1040SSThirdPartyDesigneeInd</xsl:with-param>
                          </xsl:call-template>
                        </xsl:if>
                      </input>  
                    <label>
                      <xsl:if test="$Form1040SSPRData/ThirdPartyDesigneeInd">
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneeInd"/>
                          <xsl:with-param name="BackupName">IRS1040SSThirdPartyDesigneeInd</xsl:with-param>
                        </xsl:call-template>
                      </xsl:if>
                      <b>Yes.</b> Complete the following.
                    </label>
                   </div>                    
				  <div style="float:left;padding-left:1.5mm;">                   
                    <!-- ++++++++++++++ No Checkbox +++++++++++++ -->
                      <xsl:call-template name="PopulateSpan">
                        <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneeInd"/>
                      </xsl:call-template>
                      <input type="checkbox" class="styCkbox" style="margin:.25mm .25mm;">
                        <xsl:if test="$Form1040SSPRData/ThirdPartyDesigneeInd">
                          <xsl:call-template name="PopulateNoCheckbox">
                            <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneeInd"/>
                            <xsl:with-param name="BackupName">IRS1040SSThirdPartyDesigneeInd</xsl:with-param>
                          </xsl:call-template>
                        </xsl:if>
                      </input>
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
            <div style="height:2mm;float:left;width:165mm;">
              <div style="height:10mm;float:left;clear:none;width:22mm;font-size:7pt;padding:0mm 0mm 4mm 3mm;">Designee's<br/>
                <span style="padding-top:.5mm;">name</span>
				<span style="width:3.5mm;"/>
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
              </div>
              <div style="width:47mm;float:left;clear:none;padding:3.5mm 0mm 0mm 0mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneeNm"/>
              </xsl:call-template>
              </div>
              <div style="float:left;width:13mm;padding-left:.5mm;font-size:7pt;">
                Phone<br/>
                <span style="padding-top:.5mm;"> no</span>
                <span style="width:2.5mm;"/>
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
              </div>
              <div style="float:left;width:27mm;padding-top:2mm;">
                <xsl:call-template name="PopulatePhoneNumber">
                  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneePhoneNum"/>
                </xsl:call-template>
              </div>
              <div style="float:left;width:32mm;padding-bottom:1mm;padding-left:5mm;font-size:7pt;">
				Personal Identification 
                <span style="padding-top:.5mm;">Number (PIN)</span>
                <span style="width:6.75mm;"/>
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
              </div>
                <div class="styLNCtrNumBox" style="float:right;width:20mm;border-top-width:1px;margin-top:1.5mm;">
                  <xsl:call-template name="PopulatePin">
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ThirdPartyDesigneePIN"/>
                  </xsl:call-template>
                </div>
            </div>				
           </div>
          </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Sign Here -->
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <div class="styBB" style="width:187mm;float:none;">
            <div class="styIRS1040SSPRLineItem" style="height:27.5mm;">
              <!-- Header -->
              <div class="styIRS1040SSPRCleanDiv" style="width:22mm;height:100%;">
                <span class="styBoldText" style="font-size:11pt;">Sign<br/>Here</span>
                  <div class="styIRS1040SSPRCleanDiv" style="width:22mm;padding-top:2mm;">
                    Joint Return?<br/>
                    See instructions<br/>
                    Keep a copy<br/>
                    for your<br/>
                    records.
                  </div>
              </div>
              <!-- Body -->
              <div class="styIRS1040SSPRCleanDiv" style="width:165mm;height:100%;">
                <div class="styIRS1040SSPRLNDesc" style="width:100%;height:8.5mm;padding:0mm 0mm 0mm 3mm;font-size:7pt;">
                  Under penalties of perjury, I declare that I have examined this return and accompanying schedules and statements, and to the best of my knowledge
                  and belief, they are true, correct, and complete. Declaration of preparer (other than the taxpayer) is based on all information of which the preparer has
                  any knowledge.
                </div>
                <!-- Container -->
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;">
                  <!-- Line 1 -->
                  <img src="{$ImagePath}/1040SS_Bullet_Lg.gif" alt="Large Bullet" width="19" height="49" style="float:left;margin:3.25mm -4mm;padding-left:2mm;"/>
                  <div class="styIRS1040SSPRCleanDiv" style="width:162mm;margin-left:3mm;height:10mm;border-bottom-width:1px;border-color:black;">
                    <!-- Your Signature -->
                    <div class="styIRS1040SSPRLNDesc" style="width:48mm;height:9.5mm;border-right-width:1px;border-color:black;padding-left:0mm;font-size:7pt;">
                      Your signature<br/>
                      <span style="width:100%;padding-top:6px;">
                        <xsl:call-template name="PopulatePin">
                          <xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN"/>
                          <xsl:with-param name="BackupName">RtnHdrDataPrimarySignature</xsl:with-param>
                        </xsl:call-template>
                      </span>
                    </div>
                    <!-- Date -->
                    <div class="styIRS1040SSPRLNDesc" style="width:16mm;height:9.5mm;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
                      <span style="width:100%;padding-left:4px;">Date</span>
                      <span style="width:100%;padding-top:6px;text-align:center;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
                          <xsl:with-param name="BackupName">RtnHdrDataPrimarySignatureDate</xsl:with-param>
                        </xsl:call-template>
                      </span>
                    </div>
                    <!-- Daytime phone number -->
                    <div class="styIRS1040SSPRLNDesc" style="width:45mm;height:9.5mm;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
                      <span style="width:100%;padding-left:4px;">Daytime phone number</span>
                      <span style="width:100%;padding-top:6px;text-align:center;">
                        <xsl:choose>
                          <xsl:when test="$Form1040SSPRData/DaytimePhoneNum">
                            <xsl:call-template name="PopulatePhoneNumber">
                              <xsl:with-param name="TargetNode" select="$Form1040SSPRData/DaytimePhoneNum"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ForeignPhoneNum"/>
                            </xsl:call-template>
                          </xsl:otherwise>
                        </xsl:choose>
                      </span>
                    </div>
                    <!-- Identity protection Pin -->
                    <div class="styIRS1040SSPRLNDesc" style="width:52mm;height:4mm;border-color:black;padding-left:0px;font-size:7pt;">
					<span style="width:100%;padding-left:4px;">If the IRS sent you an Identity Protection PIN, enter it here (see inst.)</span>
					<div class="styLNCtrNumBox" style="float:right;width:26mm;border-top-width:1px;margin:-1mm -1mm;">
					<span style="width:100%;padding-top:1px;text-align:center;">
                        <xsl:call-template name="PopulatePin">
                          <xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
                          <xsl:with-param name="BackupName">RtnHdrDataIdentityProtectionPIN"</xsl:with-param>
                        </xsl:call-template>
                     </span>
                    </div>
                    </div>                    
                  </div>
                  <!-- Line 2 -->
                    <!-- Spouse's signature -->
                    <div class="styIRS1040SSPRLNDesc" style="width:106mm;height:9mm;border-right-width:1px;border-color:black;padding-left:3mm;font-size:7pt;">
                      Spouse's signature. If a joint return, <b>both</b> must sign.<br/>
                      <span style="width:100%;padding-top:6px;">
                        <xsl:call-template name="PopulatePin">
                          <xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignaturePIN"/>
                          <xsl:with-param name="BackupName">RtnHdrDataSpouseSignature</xsl:with-param>
                        </xsl:call-template>
                      </span>
                    </div>
                    <!-- Date -->
                    <div class="styIRS1040SSPRLNDesc" style="width:16mm;height:9mm;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
                      <span style="width:100%;padding-left:4px;">Date</span>
                      <span style="width:100%;padding-top:6px;text-align:center;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDt"/>
                          <xsl:with-param name="BackupName">RtnHdrDataSpouseSignatureDate</xsl:with-param>
                        </xsl:call-template>
                      </span>
                    </div>
                    <!-- Identity protection Pin -->
                    <div class="styShadingCell" style="width:43mm;height:9mm;padding-left:0px;border-left-width:0px;font-size:7pt;">
                    </div>
                </div>
              </div>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Paid Preparer Use Only -->
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <div class="styTBB" style="width:187mm;font-size:6.5pt;font-family:arial;float:none;">
            <div style="width:20mm;padding-top:2mm;float:left;">
              <span class="styMainTitle" style="font-size:11pt;">
                Paid
                Preparer
                Use Only
              </span>
            </div>
            <div style="width:166.5mm;float:left;border-width:0px 0px 0px 1px; border-color:black;border-style:solid;">
              <div style="width:166.5mm;height:8mm;float:left;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;height:100%">
                <div class="styFNBox" style="width:52mm;height:8mm;padding:.25mm 0mm .5mm 1mm;">
                Print/Type preparer's name<br/>
				<div style="padding-top:1mm;">                 
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
                    <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
                  </xsl:call-template>
                </div>
				</div>                
                <div class="styFNBox" style="width:43.5mm;height:8mm;padding:.25mm 0mm .5mm 1mm;border-right-width:1 solid black;">
                Preparer's signature
              </div>
                <div class="styFNBox" style="width:20mm;height:8mm;padding:.25mm 0mm .5mm 1mm;">Date <br/>
				<div style="padding-top:1mm;">                 
                  <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                    <xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
                    <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
                  </xsl:call-template>
                </div>
                </div>                
                <div class="styFNBox" style="width:27mm;height:8mm;padding:0mm 0mm .5mm 1mm;">
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
                    <span style="width:1mm"/>if<br/>self-employed 
                  </label>
                </div>
                <div class="styFNBox" style="width:15mm;height:8mm;padding:.25mm 0mm .5mm 1mm;border-right:none;">PTIN<br/>
				<div style="padding-top:1mm;">
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
              </div>
              <div style="width:166.5mm;float:left;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styFNBox" style=";width:115.5mm;height:8mm">
                  <span class="styGenericDiv" style="padding:1.5mm 0mm 0mm 1mm;">Firm's name 
                  <span style="width:2.4mm;"/>
                    <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
                    <span style="width:1mm;"/>
                  </span>
                  <div style="width:90mm;height:8mm;padding-top:1.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
                    </xsl:call-template><br/>
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styFNBox" style="width:32mm;height:4mm;padding:1.5mm 0mm 0mm 1mm;border-right:none;">Firm's EIN
                <span style="width:.5mm;"/>                
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
                  <span style="width:1mm;"/>
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
              <div style="width:164mm;float:left;">
                <div class="styFNBox" style="width:115.5mm;height:12mm;">
                  <div class="styGenericDiv" style="padding:1.5mm 0mm 0mm 1mm">Firm's address 
                  <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
                  </div>
                  <div class="styGenericDiv" style="width:57mm;height:9mm;padding:1.5mm 0mm 0mm 1mm">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
                    </xsl:call-template><br/>
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
                    </xsl:call-template><br/>
                    <xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">CityNm</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
                      </xsl:call-template>,
					  <span style="width:.25mm;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
                      </xsl:call-template>,
					  <span style="width:.25mm;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">CityNm</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:.25mm;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
                      </xsl:call-template>,
					  <span style="width:.25mm;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCd</xsl:with-param>
                      </xsl:call-template>,
					  <span style="width:.25mm;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountryCd</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                  </div>
                </div>
                <div class="styFNBox" style="width:32mm;height:4mm;padding:1.5mm 0mm 0mm 1mm;border-right:none;"> Phone no. 
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
          <div class="pageEnd" style="width:187mm;padding-top:.25mm;">
            <div style="float:left;">
              <span class="styBoldText">
                For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see instructions.
              </span>
            </div>
            <div style="float:right;">
              <span style="width:50px;"/>  
                Form <span class="styBoldText" style="font-size:8pt;">1040-SS</span> (2016)
            </div>
            <div style="float:right;text-align:center;width:26mm;font-size:7pt;">
              Cat. No. 17184B
            </div>
          </div>
   		  <p style="page-break-before: always"/>           
          <!-- END Page Break and Footer-->
          <!-- BEGIN Page Header -->
          <div class="styTBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">
              Form 1040-SS (2016)<span style="width:148mm;"/>
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
            <div class="styPartName" style="width:11mm;height:4mm;font-size:9pt;">Part II</div>
            <div class="styPartDesc" style="padding:.25mm 0mm 0mm 2mm;font-size:8.5pt;">
              Bona Fide Residents of Puerto Rico Claiming Additional Child Tax Credit
              <img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>
              <span class="styNormalText" style="padding-left:.5mm;">See instructions.</span>
            </div>
          </div>
          <div class="styBB" style="width:187mm;font-size:8pt;">
            <b>Caution.</b> You must have three or more qualifying children to claim the additional child tax credit.          
          </div>
          <!-- Body -->
          <div class="styBB" style="width:187mm;">
            <div class="styIRS1040SSPRLineItem"  style="padding-left:150mm;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (1) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem">
              <div class="styIRS1040SSPRLNLeftNumBox">1</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                    Income derived from sources within Puerto Rico
                    <!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...................</span>          
                  </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">1</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ACTCBonaFideResidentsGrp/PuertoRicoIncomeAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
             <!-- (2) ////////////////////////////////////////////////////-->            
            <div class="styIRS1040SSPRLineItem" style="height:10.5mm;">
              <div class="styIRS1040SSPRLNLeftNumBox">2</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;">
						Withheld social security, Medicare, and Additional Medicare taxes from Puerto Rico Form(s)<br/>
						499R-2/W-2PR <b>(attach copy of form(s))</b>. If married filing jointly, include your spouse's amounts<br/> with yours.
                    <!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............................</span>    
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ACTCBonaFideResidentsGrp/TotalSocSecAndMedcrWithheldAmt"/>
					</xsl:call-template>					
				  </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="AmountBoxStyle">height:6.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">height:6.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">2</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ACTCBonaFideResidentsGrp/TotalSocSecAndMedcrWithheldAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>            
            <!-- (3) ////////////////////////////////////////////////////-->
            <div class="styIRS1040SSPRLineItem" style="height:7.5mm;">
              <div class="styIRS1040SSPRLNLeftNumBox">3</div>
                  <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                    <b>Additional child tax credit.</b> Use the worksheet in the instructions to figure the amount to enter here<br/>
                    and in Part I, line 9
                    <!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.............................</span>          
                  </div>
              <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS1040SSPRCleanDiv" style="width:37mm;float:right;">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="AmountBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
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
          <xsl:for-each select="$Form1040SSPRData/FarmingProfitLoss">
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
          <xsl:for-each select="$Form1040SSPRData/ProfitLossFromBusiness">
            <xsl:call-template name="PopulateProfitLossFromBusinessSection_1040SS">
              <xsl:with-param name="TargetNode" select="."/>
            </xsl:call-template>
          </xsl:for-each>
          <xsl:if test="count($Form1040SSPRData/ProfitLossFromBusiness) = 0">
            <xsl:call-template name="PopulateProfitLossFromBusinessSection_1040SS"/>
          </xsl:if>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part V                                                -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <xsl:for-each select="$Form1040SSPRData/SelfEmploymentTaxGrp">
            <xsl:call-template name="PopulateSelfEmploymentTaxSection_1040SS">
              <xsl:with-param name="TargetNode" select="."/>
            </xsl:call-template>
          </xsl:for-each>
          <xsl:if test="count($Form1040SSPRData/SelfEmploymentTaxGrp) = 0">
            <xsl:call-template name="PopulateSelfEmploymentTaxSection_1040SS"/>
          </xsl:if>
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
            <xsl:if test="$Form1040SSPRData/PrimaryDeathDt">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Top Left Margin - Primary Date of Death</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/PrimaryDeathDt"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form1040SSPRData/SpouseDeathDt">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Top Left Margin - Spouse Date of Death</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/SpouseDeathDt"/>
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
              <xsl:if test="QualifyingChildNameControlTxt">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part I - Line 2 - Qualifying Child Name Control (Row <xsl:value-of select="$Num"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="QualifyingChildNameControlTxt"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>
              </xsl:if>
            </xsl:for-each>
              <xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Part I, Line 6 - Repayment Of Advance Payment Received In Error Code</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrCd"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRowAmount">
				<xsl:with-param name="Desc">Part I, Line 6 - Repayment Of Advance Payment Received In Error Amount</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrAmt"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part I - Line 6 - Tax On Tips Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/TaxOnTipsCd"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRowAmount">
                <xsl:with-param name="Desc">Part I - Line 6 - Social Security Medicare Tax Unreported Tip Amount</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/SocSecMedicareTaxUnrptdTipAmt"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Tax On Tips Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedTaxCd"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRowAmount">
                <xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Tax On Tips Amount</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedSocSecTaxOnTipsAmt"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Medicare Tax Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedTaxCd"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRowAmount">
                <xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Medicare Tax Amount</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedSocSecMedTaxAmt"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Medicare Tax GTLI Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedTaxCd"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRowAmount">
                <xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Medicare Tax GTLI Amount</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1040SSPRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedSocSecMedTaxGTLIAmt"/>
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
              <xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Part I, Line 11 - Additional Medicare Tax Code</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1040SSPRData/AddnlMedicareTaxWithheldGrp/AdditionalMedicareTaxCd"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRowAmount">
				<xsl:with-param name="Desc">Part I, Line 11 - Additional Medicare Withholding Amount</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1040SSPRData/AddnlMedicareTaxWithheldGrp/AddlMedcrRRTTaxWithholdingAmt"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>        
  			  <xsl:for-each select="$Form1040SSPRData/FarmingProfitLoss">
					 <xsl:if test="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/@section263AIndicatorCd">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part III - Section B - Line 34(e) - Section 263 A Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/@section263AIndicatorCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>  
					 </xsl:if>  			  
					 <xsl:if test="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/Desc">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part III - Section B - Line 34(e) - Total Preproductive Period Expenses</xsl:with-param>
							<xsl:with-param name="TargetNode" select="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/Desc"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					 </xsl:if>
              </xsl:for-each>					                
               <xsl:for-each select="$Form1040SSPRData/FarmingProfitLoss">
               <xsl:if test="FarmExpensesGrp/NetFarmProfitLossAmt/@passiveActivityLossLiteralCd">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part III - Section B - Line 36 - Passive Activity Loss Literal Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="FarmExpensesGrp/NetFarmProfitLossAmt/@passiveActivityLossLiteralCd"/>
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
              <xsl:if test="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part V - Line 3 - Community Income Taxed To Spouse Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part V - Line 3 - Community Income Taxed To Spouse Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt"/>
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
<!--	  --><!-- (34a-e) //////////////////////////////////////////////////// --><!--          
           <xsl:if test="($Print = $Separated) and (count($Form1040SSPRData/FarmingProfitLoss/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &gt; 5)">
			<span class="styRepeatingDataTitle">Form
             <xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
                  1040-SS
                </xsl:if>
                <xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
                  1040-PR
                </xsl:if>                
                Part III - Section B - Line 34 - Other Expenses			
			</span>
				<table class="styDepTbl" cellspacing="0" style="font-size:7pt;font-family:arial;width:100mm;">
					<thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styIRS1040SSPRTableCell" scope="col" rowspan="2" style="width:10mm;font-weight:normal;">
								Letter
							</th>
							<th class="styIRS1040SSPRTableCell" scope="col" rowspan="2" style="width:55mm;font-weight:normal;">
								Description
							</th>
							<th class="styIRS1040SSPRTableCell" scope="col" rowspan="2" style="width:35mm;font-weight:normal;">
								Amount
							</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="$Form1040SSPRData/FarmingProfitLoss/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense">
							<xsl:variable name="Letter">
								<xsl:number format="a"/>
							</xsl:variable>
							<tr style="border-color:black;height:6mm;">
								<xsl:attribute name="class">
									<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<td class="styTableCellText" style="width:10mm;text-align:center;">
									<xsl:value-of select="$Letter"/>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellText" style="width:55mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Desc"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellText" style="width:35mm;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="Amt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
          </xsl:if> -->
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
	  <!--(43) ////////////////////////////////////////////////////-->
          <xsl:for-each select="$Form1040SSPRData/FarmingProfitLoss">
            <xsl:if test="FarmIncomeAccrualMethodGrp and (count(FarmIncomeAccrualMethodGrp/OtherIncomeGrp) &gt; 0)">
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
                Part III - Section C - Line 43 - Other Farm Income<br/>
                Name of proprietor:<br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="FarmProprietorName/BusinessNameLine1Txt"/>
                </xsl:call-template>
                <xsl:if test="FarmProprietorName/BusinessNameLine2Txt">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="FarmProprietorName/BusinessNameLine2Txt"/>
                  </xsl:call-template>
                </xsl:if>
              </span>
              <xsl:variable name="CellStyle">border-color:black;font-size:7pt;text-align:center;font-family:arial;padding-left:0px;padding-right:0px;</xsl:variable>
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
                  <xsl:for-each select="FarmIncomeAccrualMethodGrp/OtherIncomeGrp">
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
                          <xsl:with-param name="TargetNode" select="OtherIncomeTyp"/>
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
                          <xsl:with-param name="TargetNode" select="OthIncmIncludingGasFuelTxCrAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </xsl:if>
          </xsl:for-each>
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
    <xsl:param name="Height">4mm</xsl:param>
    <div class="styLNRightNumBox">
      <xsl:attribute name="style">
        padding:2px 0px 0px 0px;
        border-right-width:0px;font-size:8pt;
        height:4mm<xsl:value-of select="$Height"/>;
        <xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$Number">
        <xsl:value-of select="$Number"/>
      </xsl:if>
    </div>
    <div class="styLNAmountBox">
      <xsl:attribute name="style">
        width:<xsl:value-of select="$Width"/>;height:4mm<xsl:value-of select="$Height"/>;
        border-right-width:0px;text-align:right;padding-right:2px;font-size:7pt;
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
  </xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:  GenerateEmptyItems_1040SS) -->
	  <xsl:template name="GenerateEmptyItems_1040SS">
		<xsl:param name="Number"/>
		<xsl:param name="MaxCount"/>
		<xsl:param name="LineEData"/>
		<xsl:if test="$Number and ($Number &lt;= $MaxCount)">
		  <xsl:choose>
			<xsl:when test="$Number = 5 and $LineEData and $LineEData/TotalPreproductivePrdExpnsAmt">
				<div class="styIRS1040SSPRLineItem" style="height:3.8mm;">
					<div class="styIRS1040SSPRLNLeftNumBox" style="height:3.8mm;padding:.75mm 0mm 0mm 0mm;">
						<xsl:number value="$Number" format="a"/>
					</div>
					<div class="styIRS1040SSPRLNDesc" style="width:47mm;height:3.8mm;padding-top:0mm;">
						<span style="width:43mm;height:3.8mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$LineEData/TotalPreproductivePrdExpnsAmt/@section263AIndicatorCd"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3.8mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:3.8mm;float:right;">
							<xsl:call-template name="CreateBox_1040SS">
								<xsl:with-param name="Number">
									<xsl:value-of select="concat('34', 'e')"/>
								</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$LineEData/TotalPreproductivePrdExpnsAmt"/>
								<xsl:with-param name="AmountBoxStyle">
									border-bottom-width:1px;
								</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">
									border-bottom-width:1px;
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
				<xsl:with-param name="Style">border-bottom-width:1px;</xsl:with-param>
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
			<xsl:choose>
				<xsl:when test="$Number = $MaxCount">
					<xsl:call-template name="CreateOtherBusinessExpensesItem_1040SS">
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="CreateOtherBusinessExpensesItem_1040SS"/>
				</xsl:otherwise>
			</xsl:choose>
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
    <div class="styIRS1040SSPRLineItem" style="height:3.8mm;">
      <div class="styIRS1040SSPRLNLeftNumBox" style="height:3.8mm;padding:.75mm 0mm 0mm 0mm;">
        <xsl:value-of select="$Letter"/>
      </div>
      <div class="styIRS1040SSPRLNDesc" style="width:47mm;height:3.8mm;padding-top:0mm;">
        <span style="width:43mm;height:3.8mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
          <xsl:if test="$TargetNode">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$TargetNode/Desc"/>
            </xsl:call-template>
          </xsl:if>
        </span>
      </div>
      <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3.8mm;padding:0px 0px 0px 0px;float:right;">
        <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:3.8mm;float:right;">
          <xsl:choose>
            <xsl:when test="$TargetNode">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="Number">
                  <xsl:value-of select="concat('34', $Letter)"/>
                </xsl:with-param>
                <xsl:with-param name="TargetNode" select="$TargetNode/Amt"/>
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
		<div class="styIRS1040SSPRLineItem" style="height:auto;">
			<div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;"/>
			<div class="styIRS1040SSPRLNDesc" style="width:47mm;">
				<span style="width:43mm;height:auto;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
					<xsl:if test="$TargetNode">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$TargetNode/Desc"/>
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
								<xsl:with-param name="TargetNode" select="$TargetNode/Amt"/>
								<xsl:with-param name="AmountBoxStyle">height:15.5mm; 
									border-bottom-width:0px;<xsl:value-of select="$Style"/>;
								</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">height:15.5mm; 
									border-bottom-width:0px;<xsl:value-of select="$Style"/>;background-color:lightgrey;
								</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="CreateBox_1040SS">
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
  <!-- ////////////////////////////////////////////////////////////// (Template: QualifyingChildrenTableHeaders_1040SS) -->
  <xsl:template name="QualifyingChildrenTableHeaders_1040SS">
    <xsl:param name="AddColoredHeaders"/>
    <xsl:variable name="CommonStyle">border-color:black;font-size:7pt;text-align:center;font-family:arial;padding-left:0px;padding-right:0px;</xsl:variable>
    <tr>
      <xsl:if test="$AddColoredHeaders">
        <xsl:attribute name="class">styDepTblHdr</xsl:attribute>
      </xsl:if>
      <th class="styIRS1040SSPRTableCell" scope="col">
        <xsl:attribute name="style">width:104mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        <span class="styNormalText"><b>(a)</b>  First name<span style="width:10mm;"/>Last name</span>
      </th>
      <th class="styIRS1040SSPRTableCell" scope="col">
        <xsl:attribute name="style">width:41.5mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
		<span class="styNormalText"><b>(b)</b> Child's<br/>identifying number</span>
      </th>
      <th class="styIRS1040SSPRTableCell" scope="col">
        <xsl:attribute name="style">width:41.5mm;<xsl:value-of select="$CommonStyle"/>;border-right-width:0px;</xsl:attribute>
        <span class="styNormalText"><b>(c)</b> Child's<br/>relationship to you</span>
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
        border-bottom-width:1px;
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
        <xsl:attribute name="style">width:104mm;height:4mm;text-align:left;<xsl:value-of select="$IsLast"/></xsl:attribute>
        <xsl:if test="$TargetNode">
		 <span style="width:40mm;text-align:left;">
         <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="QualifyingChildFirstNm"/>
          </xsl:call-template>
         </span>
          <span style="width:14mm;"/>
		 <span style="width:40mm;text-align:left;;">          
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="QualifyingChildLastNm"/>
          </xsl:call-template>                     
         </span> 
		 <span style="width:4mm;">           
          <xsl:if test="$TargetNode/QualifyingChildNameControlTxt">
            <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">Part I, Line 2 - Qualifying Child <xsl:number value="position()"/> Name Control</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$TargetNode/QualifyingChildNameControlTxt"/>
            </xsl:call-template>
          </xsl:if>
           </span>                   
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
        <xsl:attribute name="style">width:37mm;height:4mm;text-align:center;<xsl:value-of select="$IsLast"/></xsl:attribute>
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
        <xsl:attribute name="style">width:37mm;height:4mm;text-align:left;border-right-width:0px;<xsl:value-of select="$IsLast"/></xsl:attribute>
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
      <div class="styPartName" style="width:11mm;height:4mm;font-size:9pt;padding-top:.25mm">Part III</div>
      <div class="styPartDesc" style="padding:.25mm 0mm 0mm 2mm;font-size:8.5pt;">
        Profit or Loss From Farming
        <img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>
        <span style="width:.5mm"/>
        <span class="styNormalText">See the instructions for Schedule F (Form 1040).</span>
      </div>
    </div>
    <!-- Body -->
    <div class="styBB" style="width:187mm;">
      <!-- Name and SSN section -->
      <div class="styIRS1040SSPRLineItem" style="height:10mm;border-bottom-width:1px;border-color:black;">
        <div class="styIRS1040SSPRLNDesc" style="width:150mm;height:8mm;padding-top:0mm;padding-left:0mm;font-size:7.5pt;">
			Name of proprietor<br/>
          <span style="padding:.5mm 0mm 0mm 0mm;">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$TargetNode/FarmProprietorName/BusinessNameLine1Txt"/>
               </xsl:call-template><br/>
              <xsl:if test="$TargetNode/FarmProprietorName/BusinessNameLine2Txt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmProprietorName/BusinessNameLine2Txt"/>
                </xsl:call-template>
              </xsl:if>
            </xsl:if>
          </span>
        </div>
        <div class="styIRS1040SSPRLNDesc" style="width:37mm;height:10mm;border-left-width:1px;padding-top:0mm;padding-left:.5mm;border-color:black;font-size:7.5pt;">
			<b>Social security number</b>
          <span style="padding:.5mm 0mm 0mm .5mm;">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="$TargetNode/SSN"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </div>
      </div>
      <!-- Note -->
      <div class="styIRS1040SSPRLineItem" style="height:8mm;">
        <div class="styIRS1040SSPRLNDesc" style="padding-left:0mm;width:187mm;">
          <b>Note.</b> If you are filing a joint return and both you and your spouse had a profit or loss from a farming business, see 
          <i>Joint returns and</i> 
          <span class="styItalicText" style="padding-left:8mm;">Business Owned and Operated by Spouses</span> in the instructions for more information.
        </div>
      </div>
    </div>
    <!-- Section A -->
    <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
      <!-- Content -->
      <div class="styPartDesc" style="width:187mm;height:12mm;padding:1mm 0mm 0mm 0mm;font-size:8.5pt;text-align:center;">
			Section A<span style="width:.25mm;"/><img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>
			Farm Income<span style="width:.25mm;"/><img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/><span style="width:.25mm;"/>Cash Method<br/>
        <span class="styNormalText">
			Complete Sections A and B. (Accrual method taxpayers, complete Sections B and C, and Section A, line 11.)<br/>
            Don't include sales of livestock held for draft, breeding, sport, or dairy purposes (see instructions).
        </span>
      </div>
    </div>
    <!-- Body -->
    <div class="styBB" style="width:187mm;">
      <!-- (1) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">1</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Sales of livestock and other items you bought for resale
			<!--Dotted Line-->
  			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">1</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/SalesOfLvstckBghtForResaleAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">2</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Cost or other basis of livestock and other items reported on line 1
			<!--Dotted Line-->
  			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">2</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/CostOfLvstckBghtForResaleAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">3</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Subtract line 2 from line 1
			<!--Dotted Line-->
  			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........................</span>               
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">3</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/PurchasedProfitAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">4</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Sales of livestock, produce, grains, and other products you raised
			<!--Dotted Line-->
  			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.............</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">4</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/SaleOfProductsRaisedAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="width:113mm;height:3mm;float:left;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;padding-right:0px;">5a</div>
        <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
          Total cooperative distributions (Form(s)<br/>1099-PATR)
		<!--Dotted Line-->
		<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............</span>          
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:3mm;border-bottom-width:0px;padding:0px 0px 0px 0px;border-right-width:1px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:3mm;border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>
      </div>
      <div class="styIRS1040SSPRLineItem" style="width:74mm;float:left;height:3mm;">
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:3mm;border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:3mm;border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>
      </div>
      <div class="styIRS1040SSPRLineItem" style="width:113mm;height:4mm;float:left;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;"/>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">5a</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/CooperativeDistributionsAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="width:74mm;height:4mm;float:left;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="width:8mm;padding:.5mm 0mm 0mm 2mm;">5b</div>
        <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding-left:2mm;">
          Taxable amount
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">5b</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/CooperativeDistriTxblAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">6</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Agricultural program payments received
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....................</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">6</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/AgriculturalProgramPymtAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">7</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Commodity Credit Corporation (CCC) loans reported under election (or forfeited)
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......</span>
			<xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/FarmingProfitLoss/FarmIncomeCashMethodGrp/CCCLoanReportedElectionAmt"/>
			</xsl:call-template>			              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">7</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/CCCLoanReportedElectionAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">8</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.25mm;">
              Crop insurance proceeds
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:3.25mm;">.........................</span>
			<xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/FarmingProfitLoss/FarmIncomeCashMethodGrp/CropInsProcAndDsstrPymtAmt"/>
			</xsl:call-template>			                            
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">8</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/CropInsProcAndDsstrPymtAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.8mm;">9</div>
             <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Custom hire (machine work) income
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......................</span>
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">9</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/CustomHireIncomeAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">10</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Other income
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............................</span>
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">10</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/OthIncmIncludingGasFuelTxCrAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:7.5mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">11</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              <b>Gross farm income.</b> Add amounts in the right column for lines 3 through 10. If accrual method taxpayer,<br/>
				    enter the amount from Section C, line 50
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....................</span>
               <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
            </div>
         <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:auto;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">11</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/GrossIncomeAmt"/>
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
      <div class="styPartDesc" style="width:187mm;height:12mm;padding:1mm 0mm 0mm 0mm;font-size:8.5pt;text-align:center;">
        Section B<span style="width:.25mm;"/> <img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/><span style="width:.3mm;"/>Farm Expenses<span style="width:.25mm;"/>
        <img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/><span style="width:.35mm;"/>Cash and Accrual Method<br/>
        <span class="styNormalText" style="width:100%;text-align:left;">
          Don't include personal or living expenses (such as taxes, insurance, or repairs on your home) that didn't produce farm income.<br/>
          Reduce the amount of your farm expenses by any reimbursements before entering the expenses below.
        </span>
      </div>
    </div>
    <!-- Body -->
    <div class="styBB" style="width:187mm;height:auto">
      <div class="styIRS1040SSPRCleanDiv" style="width:49.99%;height:auto;border-right-width:1px;">
        <!-- (12) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem" style="height:7mm;">
          <div class="styIRS1040SSPRLNLeftNumBox">12</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Car and truck expenses<br/>
                (see instructions)
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....</span>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">12</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/CarAndTruckExpensesAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox">13</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.75mm;">
                Chemicals
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......</span>                
              </div>
           <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">13</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/ChemicalExpenseAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">14</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Conservation expenses
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>              
            </div>			 
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">14</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/ConservationExpenseAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">15</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Custom hire (machine work)
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>              
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">15</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/CustomHireExpenseAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:14mm;">
          <div class="styIRS1040SSPRLNLeftNumBox">16</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Depreciation and section 179<br/>
                expense deduction not<br/>
                claimed elsewhere (attach<br/>
                <b>Form 4562</b> if required)
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>
			</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">height:10mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:10mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:14mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">16</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/DeprecAndSect179ExpnsDedAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:7mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">17</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Employee benefit programs<br/>
                other than on line 25
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....</span>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">17</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/EmployeeBenefitProgramAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox">18</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Feed purchased
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....</span>                
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">18</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/FeedPurchasedExpenseAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">19</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Fertilizers and lime
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....</span>                
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">19</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/FertilizerAndLimeExpenseAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">20</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Freight and trucking
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....</span>                
              </div>
           <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">20</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/FreightAndTruckingExpenseAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">21</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Gasoline, fuel, and oil
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....</span>                
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">21</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/GasolineFuelAndOilExpenseAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">22</div>
             <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Insurance (other than health)
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.</span>                
              </div>
         <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">22</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/InsuranceAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">23</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Interest:
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!-- (23a) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">a</div>
             <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Mortgage (paid to banks, etc.)
			<span style="width:2mm;"/>
			<xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/FarmingProfitLoss/FarmExpensesGrp/MortgageInterestPaidBanksAmt"/>
			</xsl:call-template>                
             </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">23a</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/MortgageInterestPaidBanksAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">b</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:5mm;">
                Other
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:2.75mm;">........</span>
			<xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/FarmingProfitLoss/FarmExpensesGrp/MortgageInterestPaidOtherAmt"/>
			</xsl:call-template>			                 
            </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">23b</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/MortgageInterestPaidOtherAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.8mm;">24</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Labor hired
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......</span>                
              </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
					<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 1px 1px;</xsl:with-param>
					<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 1px 1px;</xsl:with-param>
                    <xsl:with-param name="Number">24</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/LaborHiredExpenseAmt"/>
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
      </div>
      <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
      <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
      <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
      <div class="styIRS1040SSPRCleanDiv" style="width:50%;height:100%;float:right;padding-left:3mm;">
        <!-- (25) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem" style="height:7mm">
          <div class="styIRS1040SSPRLNLeftNumBox">25</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Pension and profit-sharing<br/> plans
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>
			</div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">25</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/PensionProfitSharingPlansAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">26</div>
               <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Rent or lease:
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!-- (26a) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem" style="height:7mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;padding-right:0px;">a</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Vehicles, machinery, and<br/>
                equipment
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......</span>
              </div>
             <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">26a</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/MachineryAndEquipmentRentAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">b</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Other (land, animals, etc.)
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">26b</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/OtherBusinessPropertyRentAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox">27</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Repairs and maintenance
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>                
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">27</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/RepairsAndMaintenanceAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">28</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Seeds and plants purchased
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.</span>                
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">28</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/SeedAndPlantExpenseAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">29</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Storage and warehousing
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>                
              </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">29</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/StorageAndWarehousingExpnsAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">30</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto; ">
                Supplies purchased
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....</span>                
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">30</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/SuppliesAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">31</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Taxes
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........</span>                
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">31</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/TaxExpenseAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">32</div>
               <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Utilities
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........</span>                
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">32</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/UtilitiesAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:7mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">33</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Veterinary, breeding, and<br/>
                medicine
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......</span>                
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">33</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/VtrnryBreedingMedicineExpnsAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">34</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Other expenses (specify):   
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>                         
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
        </div>
       <!-- (34a-e) ////////////////////////////////////////////////////-->
      <xsl:choose>
          <xsl:when test="$TargetNode">
            <xsl:variable name="NumberOfOtherExpenseGrp" select="count($TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense)"/>
            <xsl:for-each select="$TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense">
              <xsl:variable name="Letter">
                <xsl:number format="a"/>
              </xsl:variable>
              <xsl:choose>
                <xsl:when test="(position() = 5) and ($TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt)">
					<div class="styIRS1040SSPRLineItem">
						<div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">
							<xsl:number value="position()" format="a"/>
						</div>
						<div class="styIRS1040SSPRLNDesc" style="width:47mm;height:3mm;">
							<span style="width:43mm;height:3mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/@section263AIndicatorCd"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
							<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:3mm;float:right;">
								<xsl:call-template name="CreateBox_1040SS">
									<xsl:with-param name="Number">
										<xsl:value-of select="concat('34', 'e')"/>
									</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<xsl:call-template name="CreateOtherExpensesItem_1040SS">
						<xsl:with-param name="TargetNode" select="."/>
						<xsl:with-param name="Letter">
							<xsl:number value="position() + 1" format="a"/>
						</xsl:with-param>
						<xsl:with-param name="LineEData" select="$TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp"/>
					</xsl:call-template>
				</xsl:when>
                <xsl:when test="(position() = last()) and ($NumberOfOtherExpenseGrp &gt;=5)">
                  <xsl:call-template name="CreateOtherExpensesItem_1040SS">
                    <xsl:with-param name="TargetNode" select="."/>
                    <xsl:with-param name="Letter">
                      <xsl:choose>
						<xsl:when test="(position() &gt; 5) and ($TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt)">
							<xsl:number value="position() + 1" format="a"/>
						</xsl:when>
						<xsl:otherwise><xsl:number value="position()" format="a"/></xsl:otherwise>
					  </xsl:choose>
                    </xsl:with-param>
                    <xsl:with-param name="Style">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="LineEData" select="$TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateOtherExpensesItem_1040SS">
                    <xsl:with-param name="TargetNode" select="."/>
                    <xsl:with-param name="Letter">
                      <xsl:choose>
						<xsl:when test="(position() &gt; 5) and ($TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt)">
							<xsl:number value="position() + 1" format="a"/>
						</xsl:when>
						<xsl:otherwise><xsl:number value="position()" format="a"/></xsl:otherwise>
					  </xsl:choose>
                    </xsl:with-param>
                    <xsl:with-param name="LineEData" select="$TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
            <xsl:if test="$NumberOfOtherExpenseGrp &lt;5">
              <xsl:call-template name="GenerateEmptyItems_1040SS">
                <xsl:with-param name="Number" select="$NumberOfOtherExpenseGrp + 1"/>
                <xsl:with-param name="MaxCount" select="5"/>
                <xsl:with-param name="LineEData" select="$TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp"/>
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">35</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              <b>Total expenses.</b> Add lines 12 through 34e
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....................</span>                
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
              </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">35</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/TotalExpensesAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:4.5mm;border-bottom:1.5px solid black;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">36</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              <b>Net farm profit or (loss).</b> Subtract line 35 from line 11. Enter the result here and in Part V, line 1a        
			</div>
              <xsl:if test="$TargetNode">
                <xsl:if test="$TargetNode/FarmExpensesGrp/NetFarmProfitLossAmt/@passiveActivityLossLiteralCd">
                  <span style="width:4px;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part III, Line 36 - Passive Activity Loss Literal Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/NetFarmProfitLossAmt/@passiveActivityLossLiteralCd"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:if>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">36</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/NetFarmProfitLossAmt"/>
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
    <div class="pageEnd" style="width:187mm;padding-top:.25mm;">
		<div style="float:right;">
			<span style="width:50px;"/>  
				Form 
			<span class="styBoldText" style="font-size:8pt;">1040-SS</span> (2016)
		</div>
	</div>
	<p style="page-break-before: always"/>    
    <!-- END Page Break and Footer-->
    <!-- BEGIN Page Header -->
    <div class="styTBB" style="width:187mm;padding-top:.5mm;">
      <div style="float:left;">
        Form 1040-SS (2016)<span style="width:148mm;"/>
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
      <div class="styPartDesc" style="width:100%;height:7.5mm;padding:0px 0px 0px 0px;font-size:8.5pt;text-align:center;">
        Section C<img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>Farm Income<img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>Accrual Method<br/>
        <span class="styNormalText">
          Don't include sales of livestock held for draft, breeding, sport, or dairy purposes on any of the lines below (see instructions).
        </span>
      </div>
    </div>
    <div class="styBB" style="width:187mm;">
      <!-- (37) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">37</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Sales of livestock, produce, grains, and other products during the year
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...........</span>                
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">37</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/AccrualLvstckProduceSalesAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="width:115mm;float:left;height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:.25mm;">38a</div>
        <div class="styIRS1040SSPRLNDesc" style="width:auto;">
          Total cooperative distributions (<span style="font-family:arial narrow">Form(s) 1099-PATR</span>)
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">38a</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/CooperativeDistributionsAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="width:72mm;float:left;height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">38b</div>
        <div class="styIRS1040SSPRLNDesc" style="width:auto;">
          Taxable amount
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">38b</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/CooperativeDistriTxblAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">38b</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <!-- (39) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">39</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;;">
              Agricultural program payments received
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....................</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">39</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/AgriculturalProgramPymtAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:1mm;">40</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Commodity Credit Corporation (CCC) loans reported under election (or forfeited)
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......</span>              
			<xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/FarmingProfitLoss/FarmIncomeAccrualMethodGrp/CCCLoanReportedElectionAmt"/>
			</xsl:call-template>			
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">40</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/CCCLoanReportedElectionAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.7mm;">41</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Crop insurance proceeds
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........................</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">41</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/CropInsProcAndDsstrPymtAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.7mm;">42</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Custom hire (machine work) income
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......................</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">42</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/CustomHireIncomeAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">43</div>
          <div class="styIRS1040SSPRLNDesc" style="width:auto;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Other farm income (specify)    
            </div>
              <span style="width:.25mm;"/>            
              <xsl:if test="$TargetNode">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part III, Line 43 - Other Income Table</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/OtherIncomeGrp"/>
                  </xsl:call-template>
                </xsl:if>       
              <span style="width:.25mm;"/>                              
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
              <span style="width:96mm;height:4mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;text-align:center;">
              </span>
            </div>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">43</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/OtherIncomeTotalAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">44</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Add the amounts in the right column for lines 37 through 43
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...............</span>               
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">44</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/TotalIncomeAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:7mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">45</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Inventory of livestock, produce, grains, and other products at the<br/>
              beginning of the year
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..................</span>
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">45</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/InventoryOfProductsAtBOYAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:7mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">46</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Cost of livestock, produce, grains, and other products purchased during the<br/>year    
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........................</span>                        
            </div>
	      <div class="styIRS1040SSPRCleanDiv" style="width:75mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">46</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/CostOfProductsPrchsDuringYrAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">47</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Add lines 45 and 46
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..................</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">47</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/InvntryAtBOYPlusCostOfPrchsAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:7mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">48</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Inventory of livestock, produce, grains, and other products at the end of the<br/>year
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........................</span>                        
            </div>
  	      <div class="styIRS1040SSPRCleanDiv" style="width:75mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">48</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/InventoryOfProductsAtEOYAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">49</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Cost of livestock, produce, grains, and other products sold. Subtract line 48 from line 47*
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">49</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/CostOfProductsSoldAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">50</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              <b>Gross farm income.</b> Subtract line 49 from line 44. Enter the result here and in Part III, line 11
                <span style="width:1mm;"/>
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">50</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/GrossIncomeAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="height:7mm;">
        <div class="styIRS1040SSPRCleanDiv" style="width:100%;padding:.5mm 0mm 0mm 0mm;font-size:7.5pt;">
          *If you use the unit-livestock-price method or the farm-price method of valuing inventory and the amount on line 48 is larger than the amount on 
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
      <div class="styPartName" style="width:11mm;height:4mm;font-size:9pt;padding-top:.25mm">Part IV</div>
      <div class="styPartDesc" style="padding:.25mm 0mm 0mm 2mm;font-size:8.5pt;">
        Profit or Loss From Business (Sole Proprietorship)
        <img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/>
        <span class="styNormalText" style="padding-left:.5mm;"> See the instructions for Schedule C (Form 1040).</span>
      </div>
    </div>
    <!-- Body -->
    <div class="styBB" style="width:187mm;">
      <!-- Name and SSN section -->
      <div class="styIRS1040SSPRLineItem" style="height:8mm;border-bottom-width:1px;border-color:black;">
        <div class="styIRS1040SSPRLNDesc" style="width:150mm;height:8mm;padding-top:0mm;padding-left:0mm;font-size:7.5pt;">
				Name of proprietor<br/>
          <span style="padding-left:0mm;">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$TargetNode/ProprietorNm"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </div>
        <div class="styIRS1040SSPRLNDesc" style="width:37mm;height:8mm;border-left-width:1px;padding-top:0mm;padding-left:.5mm;border-color:black;font-size:7.5pt;">
			<b>Social security number</b>
          <span style="padding-left:.5mm;">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="$TargetNode/SSN"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </div>
      </div>
      <!-- Note -->
      <div class="styIRS1040SSPRLineItem" style="height:8mm;">
        <div class="styIRS1040SSPRLNDesc" style="padding-left:0mm;width:187mm;">
          <b>Note.</b> If you are filing a joint return and both you and your spouse had a profit or loss from a business, see 
			  <i>Joint returns and Business Owned</i> 
          <span style="width:8mm;"/>
          <span class="styItalicText">and Operated by Spouses</span> in the instructions for more information.
        </div>
      </div>
    </div>
    <!-- Section A -->
    <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
      <!-- Content -->
      <div class="styPartDesc" style="width:187mm;height:4mm;padding:.5mm 0mm 0mm 0mm;font-size:8.5pt;text-align:center;">
			Section A<img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line" style="padding-left:.5mm;"/> 
        <span class="styNormalText" style="padding-left:.5mm;">Income</span>
      </div>
    </div>
    <!-- Body -->
    <div class="styBB" style="width:187mm;">
      <!-- (1) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;padding-left:.25mm;">1</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Gross receipts $
              <span style="width:27mm;height:2.75mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;text-align:right;font-size:6.5pt;padding-right:.5mm;padding">
                <xsl:if test="$TargetNode">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$TargetNode/GrossReceiptsOrSalesAmt"/>
                  </xsl:call-template>
                </xsl:if>
              </span>
              <span style="width:1.5mm;"/>
              Less returns and allowances $
              <span style="width:27mm;height:2.75mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;text-align:right;font-size:6.5pt;padding-right:.5mm;">
                <xsl:if test="$TargetNode">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$TargetNode/ReturnsAndAllowancesAmt"/>
                  </xsl:call-template>
                </xsl:if>
              </span>
              <span style="width:.5mm;"/>
              Balance
              <span style="width:.5mm;"/>
              <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
            </div>           
                <xsl:if test="$TargetNode and $TargetNode/GrossReceiptsOrSalesAmt/@referenceDocumentName">
                  <span style="width:.25mm;"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$TargetNode/GrossReceiptsOrSalesAmt"/>
                  </xsl:call-template>
                </xsl:if>            
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">1</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/NetGrossReceiptsAmt"/>
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
      <!-- (2a) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;padding-right:0px;">2a</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Inventory at beginning of year
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...............</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;padding-right:0px;">b</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Purchases less cost of items withdrawn for personal use
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Height">100%</xsl:with-param>
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;padding-right:0px;">c</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Cost of labor. Don't include any amounts paid to yourself
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>              
            </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">d</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Materials and supplies
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..................</span>              
            </div>
         <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">e</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Other costs (attach statement)
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............</span>     
			<span style="width:1.5mm;"/>    
            <xsl:call-template name="SetFormLinkInline">
               <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ProfitLossFromBusiness/OtherCostsAmt"/>
            </xsl:call-template>			
            </div>            
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">          
				  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
				  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;padding-right:.5mm;">f</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Add lines 2a through 2e
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.................</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
				<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 1px 1px;padding:.5mm .5mm 0mm 0mm;</xsl:with-param>
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;padding-right:0px;">g</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Inventory at end of year
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.................</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;padding-right:0px;">h</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Cost of goods sold. Subtract line 2g from line 2f
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...................</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">3</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              <b>Gross profit.</b> Subtract line 2h from line 1
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....................</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">4</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Other income
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............................</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">5</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              <b>Gross income.</b> Add lines 3 and 4
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......................</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
      <div class="styPartDesc" style="width:187mm;height:4mm;padding:.5mm 0mm 0mm 0mm;font-size:8.5pt;text-align:center;">
        Section B<img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line" style="padding-left:.5mm;"/>
        <span class="styNormalText" style="padding-left:.5mm;">Expenses</span>
      </div>
    </div>
    <!-- Body -->
    <div class="styBB" style="width:187mm;">
      <div class="styIRS1040SSPRCleanDiv" style="width:49.99%;height:100%;border-right-width:1px;">
        <!-- (6) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">6</div>
               <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Advertising
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......</span> 
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">6</xsl:with-param>
					<xsl:with-param name="NumberBoxStyle">padding-top:.75mm;</xsl:with-param>
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
        <div class="styIRS1040SSPRLineItem" style="height:7.5mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">7</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Car and truck expenses<br/>
                (see instructions)
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">....</span>        
            <xsl:call-template name="SetFormLinkInline">
               <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ProfitLossFromBusiness/CarAndTruckExpensesAmt"/>
            </xsl:call-template>			        
            </div>			
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">8</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Commissions and fees
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>                
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">9</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Contract labor
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>                
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">10</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Depletion
              <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:2.25mm;">......</span>    
			<span style="width:1.75mm"/>			
              </div>
			<xsl:call-template name="SetFormLinkInline">
               <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ProfitLossFromBusiness/DepletionAmt"/>
            </xsl:call-template>              
           <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
        <div class="styIRS1040SSPRLineItem" style="height:14.5mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm">11</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto">
                Depreciation and section 179<br/>
                expense deduction (not included<br/>
                 in Section A). (Attach <b>Form 4562</b><br/>
                  if required.)
                <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......</span>    
			 </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">height:10.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:10.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">11</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/DeprecAndSect179ExpnsDedAmt"/>
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
        <div class="styIRS1040SSPRLineItem" style="height:7.5mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">12</div>
               <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Employee benefit programs<br/>
                (other than on line 17)
                <!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....</span>           
            </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">13</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.5mm;">
                Insurance (other than health)
                <!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.</span>           
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
        <div class="styIRS1040SSPRLineItem" style="height:7.5mm;">
          <div class="styIRS1040SSPRLNLeftNumBox">14</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Interest on business<br/>
                indebtedness
                <!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2.25mm;">.....</span>    
				<span style="width:.75mm;"/>
				<xsl:call-template name="SetFormLinkInline">
				   <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ProfitLossFromBusiness/InterestOnBusIndebtdnessAmt"/>
				</xsl:call-template> 				       
              </div>                           
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">15</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Legal and professional services              
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">16</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Office expense
                <!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>                
              </div>
           <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox">17</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.75mm;">
                Pension and profit-sharing 
                <!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>                
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">17</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/PensionProfitSharingPlansAmt"/>
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
      <div class="styIRS1040SSPRCleanDiv" style="width:50%;float:right;padding-left:3mm;">
        <!-- (18) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox">18</div>
               <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Rent or lease:
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!-- (18a) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem" style="height:7.5mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;padding-right:0mm;">a</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
                Vehicles, machinery, and<br/>
                equipment
                <!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......</span>                                   
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;padding-right:0px;">b</div>
               <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.5mm;">
                Other business property
               <!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>                 
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox">19</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.75mm;">
                Repairs and maintenance
               <!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>                
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox">20</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.5mm;">
                Supplies (<span style="font-family:arial narrow;">not included in Section A</span>)
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox">21</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.5mm;">
                Taxes and licenses
              <!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>                
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
        <div class="styIRS1040SSPRLineItem" style="height:4.5mm;">
          <div class="styIRS1040SSPRLNLeftNumBox">22</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.75mm;font-size:8.25pt;">
                Travel, meals, and entertainment:
              </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">height:4.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:4.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!-- (22a) ////////////////////////////////////////////////////-->
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">a</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.5mm;">
                Travel
              <!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........</span>                
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
        <div class="styIRS1040SSPRLineItem" style="height:7.5mm">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">b</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;">
				Deductible meals and <br/>entertainment 
              <!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>                
              </div>
			<div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
              <xsl:call-template name="CreateBox_1040SS">
                <xsl:with-param name="AmountBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;;</xsl:with-param>
              </xsl:call-template>
            </div>
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">23</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Utilities
              <!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........</span>  
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
        <div class="styIRS1040SSPRLineItem" style="height:4mm;">
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">24</div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;">
                Wages not included on line 2c
              </div>
          <div class="styGenericDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
            <div class="styGenericDiv" style="width:100%;height:4mm;border-bottom:1px solid black;float:right;">
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
				<div class="styIRS1040SSPRLineItem">
					<div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">25a</div>
					<div class="styIRS1040SSPRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
								<span style="font-family:arial narrow">Other expenses (list type and amount):</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:call-template name="CreateBox_1040SS">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
				</div> 
				<xsl:choose>
					<xsl:when test="$TargetNode">
						<xsl:variable name="NumberOfOtherBusinessExpensesGrp" select="count($TargetNode/OtherBusinessExpenses)"/>
						<xsl:for-each select="$TargetNode/OtherBusinessExpenses">
							<xsl:choose>
								<xsl:when test="(position() = last()) and ($NumberOfOtherBusinessExpensesGrp &gt;=4)">
									<xsl:call-template name="CreateOtherBusinessExpensesItem_1040SS">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateOtherBusinessExpensesItem_1040SS">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
						<xsl:if test="$NumberOfOtherBusinessExpensesGrp &lt;4">
							<xsl:call-template name="GenerateEmptyOtherBusinessExpensesItems_1040SS">
								<xsl:with-param name="Number" select="$NumberOfOtherBusinessExpensesGrp + 1"/>
								<xsl:with-param name="MaxCount" select="4"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="GenerateEmptyOtherBusinessExpensesItems_1040SS">
							<xsl:with-param name="Number" select="1"/>
							<xsl:with-param name="MaxCount" select="4"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
      </div>
      <!-- (25b) ////////////////////////////////////////////////////-->
       <div class="styIRS1040SSPRLineItem" style="width:187mm;">
          <div class="styIRS1040SSPRCleanDiv" style="width:41mm;height:100%;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRCleanDiv" style="padding-left:4mm;width:100%;height:100%;float:right;">
              <xsl:choose>
                <xsl:when test="$TargetNode">
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">25b</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/TotalOtherExpensesAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="CreateBox_1040SS">
                    <xsl:with-param name="Number">25b</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>          
          <div class="styIRS1040SSPRCleanDiv" style="width:43mm;height:auto;padding:0px 0px 0px 0px;float:right;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
                Total other expenses
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 0px 0px 0px;">
 				<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">...</span>							
              </div>
            </div>
          </div>
          <div class="styIRS1040SSPRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;float:right;">25b</div>
        </div>
    <!-- (26) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:4mm;border-top:1px solid black;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">26</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Total expenses. Add lines 6 through 25b
              <!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.....................</span>       
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>				       
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:4.5mm;border-bottom:1.25px solid black;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">27</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              <b>Net profit or (loss).</b> Subtract line 26 from line 5. Enter the result here and in Part V, line 2
              <!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">27</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">height:4.5mm;border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">height:4.5mm;border-bottom-width:0px;padding-top:1mm;</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/NetProfitOrLossAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">27</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">height:4.5mm;border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">height:4.5mm;border-bottom-width:0px;</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      </div>
	  <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
	  <!-- Page Break and Footer-->
		<div class="pageEnd" style="width:187mm;padding-top:.25mm;">
			<div style="float:right;">
				<span style="width:50px;"/>  
					Form 
				<span class="styBoldText" style="font-size:8pt;">1040-SS</span> (2016)
			</div>
		</div>
		<p style="page-break-before: always"/>          
  </xsl:template>
  <!-- ////////////////////////////////////////////////////////////// (Template: PopulateSelfEmploymentTaxSection_1040SS) -->
  <xsl:template name="PopulateSelfEmploymentTaxSection_1040SS">
    <xsl:param name="TargetNode" select="/.."/>
	<!-- BEGIN Page Header -->
	 <div class="styTBB" style="width:187mm;padding-top:.5mm;">
		<div style="float:left;">
		  Form  1040-SS  (2016)<span style="width:148mm;"/>
		</div>
		<div style="float:right;">
		  Page <span style="font-weight:bold;font-size:8pt;">4</span>
		</div>
	</div>
	<!-- END Page Header -->     
    <!-- Header -->
    <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
      <!-- Content -->
     <div class="styPartName" style="width:11mm;height:4mm;font-size:9pt;padding-top:.25mm">Part V</div>
      <div class="styPartDesc" style="padding:0mm 0mm 0mm 2mm;font-size:8.5pt;">      
         Self-Employment Tax
        <b><img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/></b>
        <span class="styNormalText">If you had <b>church employee income</b>, see instructions before you begin.</span>
      </div>
    </div>
    <!-- Body -->
      <!-- Name and SSN section -->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:8mm;border-bottom-width:1px;border-color:black;">
        <div class="styIRS1040SSPRLNDesc" style="width:55%;height:100%;padding-top:0mm;padding-left:0px;font-size:7.5pt;">
          <span style="width:100%;height:auto;">Name of person with <b>self-employment</b> income</span>
          <span style="width:100%;height:auto;">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$TargetNode/PersonNm"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </div>
        <div class="styIRS1040SSPRLNDesc" style="width:25%;height:100%;border-left-width:1px;padding-left:0px;border-color:black;font-size:7.5pt;">
          <span class="styBoldText" style="width:100%;height:50%;padding-left:.5mm;">Social security number <span class="styNormalText">of person</span>
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:8mm;border-bottom:1px solid black;">
        <div class="styIRS1040SSPRLNDesc" style="width:100%;padding-left:0px;">
          <b>Note.</b> If you are filing a joint return and both you and your spouse had self-employment income, you must <b>each</b> complete a<br/>
          <span style="width:8mm;"/>
          <b>separate</b> Part V.
        </div>
      </div>
      <!-- (A) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:7.5mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-left:0px;text-align:left;">A</div>
        <div class="styIRS1040SSPRLNDesc" style="width:181mm;">
			  If you are a minister, member of a religious order, or Christian Science practitioner <b>and</b> you filed Form 4361, but you had
			  $400 or more of <b>other</b> net earnings from self-employment, check here and continue with Part V
        <!--Dotted Line-->
		  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.............</span>
          <span style="width:.5mm;"/>
          <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
		</div>	            
          <span style="width:2mm;display:inline; ">
          <input type="checkbox" class="styCkbox" style="float:right;margin:0mm 1mm;">
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
		 </span>          
      </div>
      <!-- (1a) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:7.5mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;padding-right:0px;">1a</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
				  Net farm profit or (loss) from Part III, line 36, and your distributive share from farm partnerships.<br/>
				  <b>Note.</b> Skip lines 1a and 1b if you use the farm optional method (see instructions)
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........</span>
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;border-top-width:1px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;border-top-width:1px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:11mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;padding-right:0px;">b</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              If you received social security retirement or disability benefits, enter the amount of Conservation<br/> Reserve
              Program payments included in Part III, line 6, plus your distributive share of these payments<br/> from farm partnerships
 				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...........................</span>
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:7mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:7mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:14mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;">2</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Net nonfarm profit or (loss) from Part IV, line 27, and your distributive share from nonfarm partnerships.<br/>
              Ministers and members of religious orders, see instructions for amounts to report on this line. See<br/> 
              instructions for other income to report. <b>Note.</b> Skip this line if you use the nonfarm optional method<br/>
              (see instructions)
 				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.............................</span>
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:10mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:10mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">3</div>
        <div class="styIRS1040SSPRCleanDiv" style="width:144mm;height:4mm;padding:0px 0px 0px 0px;">
          <div class="styIRS1040SSPRLNDesc" style="width:auto;padding:0px 0px 0px 0px;">
            <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.5mm;">
              Combine lines 1a, 1b, and 2
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
                <xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd)">
                  <span style="width:11px"/>.
                </xsl:if>
                <xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt)">
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
                <span style="width:11px"/>.
              </span>
            </div>              
           <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:.5mm 1mm 0px 0px;">                    
              <xsl:if test="$TargetNode">
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd">
                  <span style="width:1mm;"/>                
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Self-Employment Tax Exempt Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Self-Employment Tax Exempt Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Chap 11 Bankruptcy Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Chap 11 Bankruptcy Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Community Income Taxed To Spouse Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Community Income Taxed To Spouse Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Exempt Community Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Exempt Community Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Additional Income Or Loss Code (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part V, Line 3 - Additional Income Or Loss Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:7.5mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;padding-right:0px;">4a</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              If line 3 is more than zero, multiply line 3 by 92.35% (0.9235). Otherwise, enter the amount from<br/>
              line 3
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.................................</span>
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:3.5mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:3.5mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">4a</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$TargetNode/MinimumProfitForSETaxAmt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">4a</xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </div>
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:7.5mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;"/>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              <b>Note.</b> If line 4a is less than $400 due to Conservation Reserve Program payments on line 1b, see<br/>
              instructions.
            </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>
      </div>
      <!-- (4b) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;padding-right:0px;">b</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              If you elect one or both of the optional methods, enter the total of lines 2 and 4 of Part VI here
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:8mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;padding-right:0px;">c</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Combine lines 4a and 4b. If less than $400, <b>stop;</b> you don't owe self-employment tax.<br/>
              <b>Exception.</b> If less than $400 and you had <b>church employee income,</b> enter -0- and continue
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:4mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:4mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:11mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;padding-right:0px;">5a</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Enter your <b>church employee income</b> from Form(s) W-2, W-2AS,<br/>
              W-2CM, W-2GU, W-2VI, or 499R-2/W-2PR. See instructions for<br/>
              definition of church employee income
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.............</span>
            </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;padding-right:0px;">b</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Multiply line 5a by 92.35% (0.9235). If less than $100, enter -0-
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:.75mm;">..............</span>
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Add lines 4c and 5b
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">............................</span>
                   <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>
             </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:7.5mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">7</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Maximum amount of combined wages and self-employment earnings subject to social security<br/>
              tax for 2016
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...............................</span>            
          </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:3.5mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:3.5mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Number">7</xsl:with-param>
              <xsl:with-param name="StaticText">118,500.00</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>
      </div>
      <!-- (8a) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:11mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;padding-right:0px;">8a</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Total social security wages and tips from Form(s) W-2, W-2AS, W-2CM,<br/>
              W-2GU, W-2VI, or 499R-2/W-2PR. If $118,500 or more, skip lines 8b<br/>
              through 10, and go to line 11
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:7.5mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;padding-right:0px;">b</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Unreported tips subject to social security tax from Form 4137, line 10<br/>
              (see instructions)
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...................</span>
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3.5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:7.5mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.5mm;padding-right:0px;">c</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Wages subject to social security tax from Form 8919, line 10 (see <br/>
              instructions)
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....................</span>
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:3.5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:5mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;padding-right:0px;">d</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Add lines 8a, 8b, and 8c
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...........................</span>
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.8mm;">9</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Subtract line 8d from line 7. If zero or less, enter -0- here and on line 10 and go to line 11
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:2.5mm;">....</span>              
                <img src="{$ImagePath}/1040SS_Bullet_Sm.gif" alt="Small Bullet"/>				  
            </div>
         <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:1mm;">10</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.75mm;">
              Multiply the <b>smaller</b> of line 6 or line 9 by 12.4% (0.124)
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:1mm;">11</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.75mm;">
              Multiply line 6 by 2.9% (0.029)
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........................</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:4.75mm;border-bottom:1px solid black;">
        <div class="styIRS1040SSPRLNLeftNumBox">12</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.75mm;">
              <b>Self-employment tax.</b> Add lines 10 and 11. Enter here and in Part I, line 3
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
            <xsl:choose>
              <xsl:when test="$TargetNode">
                <xsl:call-template name="CreateBox_1040SS">
                  <xsl:with-param name="Number">12</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">height:4.75mm;border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">height:4.75mm;border-bottom-width:0px;padding-top:1.25mm;</xsl:with-param>
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
     <div class="styPartName" style="width:12mm;height:4mm;font-size:9pt;padding-top:.25mm">Part VI</div>
     <div class="styPartDesc" style="padding:0mm 0mm 0mm 2mm;font-size:8.5pt;">      
        Optional Methods To Figure Net Earnings
        <b><img src="{$ImagePath}/1040SS_Short_Line.gif" alt="Short Line"/></b>
        <span class="styNormalText">See instructions for limitations.</span>
      </div>
    </div>
    <!-- Body -->
    <div class="styBB" style="width:187mm;">
      <!-- Note -->
      <div class="styIRS1040SSPRLineItem" style="height:8mm;">
        <div class="styIRS1040SSPRLNDesc" style="width:100%;padding-left:0px;">
          <b>Note.</b> If you are filing a joint return and both you and your spouse choose to use an optional method to figure net earnings, you must <b>each</b> 
          <span style="width:8mm;"/>complete and attach a <b>separate</b> Part VI.
        </div>
      </div>
    </div>
      <!-- (**) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox"/>
        <div class="styIRS1040SSPRLNDesc" style="width:144mm;">
          <b>Farm Optional Method</b>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>
      </div>
      <!-- (1) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;">
        <div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">1</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Maximum income for optional methods
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........</span>                            
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="Number">1</xsl:with-param>
              <xsl:with-param name="StaticText">5,040.00</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>
      </div>
      <!-- (2) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:11mm;border-bottom:1px solid black;">
        <div class="styIRS1040SSPRLNLeftNumBox">2</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;height:100%;">
              Enter the <b>smaller</b> of: two-thirds (2/3) of gross farm income (Part III, line 11, plus your distributive share<br/>
              from farm partnerships), but not less than zero; <b>or</b> $5,040. Also include this amount in Part V, line 4b,<br/>
              above
 				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........</span>                            
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:7mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:7mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox"/>
        <div class="styIRS1040SSPRLNDesc" style="width:144mm;">
          <b>Nonfarm Optional Method</b>
        </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>
      </div>
      <!-- (3) ////////////////////////////////////////////////////-->
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:4mm;">
        <div class="styIRS1040SSPRLNLeftNumBox">3</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Subtract line 2 from line 1
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........................</span>              
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
      <div class="styIRS1040SSPRLineItem" style="width:187mm;height:11.5mm;border-bottom:2px solid black;">
        <div class="styIRS1040SSPRLNLeftNumBox">4</div>
            <div class="styIRS1040SSPRLNDesc" style="width:auto;">
              Enter the <b>smaller</b> of: two-thirds (2/3) of gross nonfarm income (Part IV, line 5, plus your distributive<br/>
              share from nonfarm partnerships), but not less than zero; <b>or</b> the amount in Part VI, line 3, above.<br/>
              Also include this amount in Part V, line 4b, above
				<!--Dotted Line-->
				  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.............</span>
            </div>
        <div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;">
            <xsl:call-template name="CreateBox_1040SS">
              <xsl:with-param name="AmountBoxStyle">height:7mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
              <xsl:with-param name="NumberBoxStyle">height:7mm;padding:0px 0px .5mm 0px;border-bottom-width:0px;</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
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
  	 <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
	 <div class="pageEnd" style="width:187mm;padding-top:.25mm;">
	 	<div style="float:right;">
	 		<span style="width:50px;"/>  
				Form 
			<span class="styBoldText" style="font-size:8pt;">1040-SS</span> (2016)
		</div>
	</div>
	<p style="page-break-before: always"/>
  </xsl:template>
  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<xsl:template name="IRS1040PR">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="ES">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
				<meta name="Desc" content="IRS Form 1040PR"/>
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
			<body class="styBodyClass" style="width:187mm;">
				<form name="IRS1040PR" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:35mm;height:23mm;border-right-width:2px;padding-top:.5mm;">
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
							<xsl:if test="$Form1040PRData/PrimaryDeathDt">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Left Margin - Primary Date of Death</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040PRData/PrimaryDeathDt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Form1040PRData/SpouseDeathDt">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Left Margin - Spouse Date of Death</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040PRData/SpouseDeathDt"/>
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
							<span class="styAgency" style="padding-top:5.5mm;">Department of the Treasury</span>
							 <br/>
							  <span class="styAgency">Internal Revenue Service</span>
							</div>
							<div class="styFTBox" style="width:125mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:13mm;font-size:10pt;">
								Planilla para la Declaración de la Contribución Federal sobre el<br/>
								Trabajo por Cuenta Propia (Incluyendo el Crédito Tributario Adicional<br/>
								por Hijos para Residentes <span class="styItalicText">Bona Fide</span> de Puerto Rico)
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;text-align:center;width:100%;">
								<span style="text-align:center;font-weight:bold;width:100%;">
									<div style="width:100%;height:5mm;padding-left:0px;">
										<div style="width:100%;height:5mm;font-size:7.5pt;font-family:arial narrow;">
											<span class="styNormalText">
												Para el año que comienza el primero de enero de 2016 y termina el 31 de diciembre de 2016, o cualquier otro<br/>
												año contributivo comenzado el
												<span style="width:29mm;padding-left:3px;text-align:center;">
													<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
												</span>
												de 2014 y terminado el
												<span style="width:29mm;padding-left:3px;text-align:center;">
													<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
												</span>.
											</span><br/>
											<span style="">
												<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/> Información sobre el Formulario 1040-PR y sus instrucciones separadas está disponible en 
												 <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form1040pr"><i>www.irs.gov/form1040pr.</i></a>	
											</span>
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:27mm;height:23mm;border-left-width:2px;">
							<div class="styOMB" style="height:4mm;font-size:7pt;">OMB No. 1545-0090</div>
							<div class="styTY" style="padding-top:3.5mm;">20<span class="styTYColor">16</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<div class="styBB" style="width:187mm;height:41mm;">
						<div class="styIRS1040PRCleanDiv" style="width:4%;height:100%;">
							<span style="width:100%;height:auto;padding-top:5mm;">
								<img src="{$ImagePath}/1040PR_Please_Print.gif" alt="Please Type or Print"/>
							</span>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:96%;height:100%;border-left-width:1px;">
							<!-- Line 1 -->
							<div class="styIRS1040PRCleanDiv" style="width:100%;height:20%;border-bottom-width:1px;">
								<div class="styIRS1040PRCleanDiv" style="width:40%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;auto;font-size:7pt;padding:0mm 0mm 0mm 1mm;">
										Nombre e inicial de su segundo nombre
										<span style="width:.5mm;padding:.5mm 0mm 0mm 1mm;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
										</xsl:call-template>
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.25mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">Name</xsl:with-param>
											<xsl:with-param name="BackupName">RtnHdrDataFilerName</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:30%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										Apellido
									</div>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:29.9%;height:100%;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<b>Su número de seguro social</b>
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:1mm 0mm 0mm 1mm;">
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
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:0mm 0mm 0mm 1mm;">
										Si es una planilla conjunta, nombre e inicial del cónyuge
										<span style="width:.5mm;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
										</xsl:call-template>										
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">SpouseName</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:30%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										Apellido
									</div>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:29.9%;height:100%;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:1mm 0mm 0mm 1mm;">
										<b>Número de seguro social del cónyuge</b>
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
											<xsl:with-param name="EINChanged">true</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<!-- Line 3 -->
							<div class="styIRS1040PRCleanDiv" style="width:100%;height:20%;border-bottom-width:1px;">
								<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
									Dirección actual (número, calle, número de apartamento o ruta rural)
								</div>
								<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
									<xsl:if test="$RtnHdrData/Filer/USAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine1</xsl:with-param>
										</xsl:call-template>
										<span style="width:2mm;"/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine2</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine1</xsl:with-param>
										</xsl:call-template>
										<span style="width:2mm;"/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine2</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
							<!-- Line 4 -->
							<div class="styIRS1040PRCleanDiv" style="width:100%;height:20%;border-bottom-width:1px;">
								<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
									Ciudad, pueblo u oficina postal, estado libre asociado o territorio y zona postal ( <span class="styItalicText">ZIP</span>)
								</div>
								<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
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
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										Nombre del país extranjero
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
											<xsl:with-param name="MainForm" select="true()"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:30%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										Provicia extranjera/estado/condado 
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:29.9%;height:100%;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										Código postal extranjero
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
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
						<div class="styPartName" style="width:12mm;font-size:9pt;background-color:black">Parte I</div>
						<div class="styPartDesc" style="padding:.25mm 0mm 0mm 4mm;font-size:8.5pt;">
							Contribución y créditos totales
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:20mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">1</div>
							<div class="styIRS1040PRLNDesc" style="width:181mm;height:auto;">
								<b>Estado civil.</b> Marque el encasillado para su estado civil (vea las instrucciones).<br/>
								<input type="checkbox" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
										<xsl:with-param name="BackupName">Form1040PRDataIndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
										<xsl:with-param name="BackupName">Form1040PRDataIndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>
									Soltero
								</label>
								<br/>
								<input type="checkbox" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040PRDataIndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040PRDataIndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>
									Casado que radica una planilla conjunta
								</label>
								<br/>
								<input type="checkbox" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
										<xsl:with-param name="BackupName">Form1040PRDataIndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
										<xsl:with-param name="BackupName">Form1040PRDataIndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>
									Casado que radica una planilla por separado. Anote arriba el número de seguro social de su cónyuge y su nombre<br/>
									completo aquí.<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
									<span style="width:130mm;border-width:0px 0px 1px 0px;border-style:solid;border-color:black;font-size:7pt;margin-left:2mm;">		
										<xsl:if test="$Form1040PRData/SpouseNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1040PRData/SpouseNm"/>
											</xsl:call-template>
										</xsl:if>
									</span>
								</label>
							</div>
						</div>
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:7.5mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 1.5mm .75mm 0mm;">2</div>
							<div class="styIRS1040PRLNDesc" style="width:181mm;">
								<b>Hijos calificados.</b> Complete esta sección <b>únicamente</b> si usted es residente <i>bona fide</i> de Puerto Rico y reclama el crédito tributario adicional 
								por hijos (vea las instrucciones).
							</div>
							<div class="styGenericDiv" style="width:3.2mm;height:4mm;float:right;clear:none;">
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
						<div class="styIRS1040PRLineItem" style="width:187mm;height:auto;">
							<div class="styTableContainerNBB" id="QualifyingChildInfoSSPRGrpDiv" style="width:187mm;clear:all;height:auto;">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0" style="width:187mm;height:4mm;">
									<thead class="styTableThead">
										<xsl:call-template name="QualifyingChildrenTableHeaders_1040PR"/>
									</thead>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form1040PRData/QualifyingChildInfoSSPRGrp">
											<xsl:if test="($Print != $Separated) or (count($Form1040PRData/QualifyingChildInfoSSPRGrp) &lt;=4)">
												<xsl:call-template name="QualifyingChildrenTableRows_1040PR">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="count($Form1040PRData/QualifyingChildInfoSSPRGrp) &lt; 1 or 
																   ((count($Form1040PRData/QualifyingChildInfoSSPRGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040PR">
												<xsl:with-param name="AddAdditionalDataMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="count($Form1040PRData/QualifyingChildInfoSSPRGrp) &lt; 2 or 
																   ((count($Form1040PRData/QualifyingChildInfoSSPRGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040PR"/>
										</xsl:if>
										<xsl:if test="count($Form1040PRData/QualifyingChildInfoSSPRGrp) &lt; 3 or 
																   ((count($Form1040PRData/QualifyingChildInfoSSPRGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040PR"/>
										</xsl:if>
										<xsl:if test="count($Form1040PRData/QualifyingChildInfoSSPRGrp) &lt; 4 or 
																   ((count($Form1040PRData/QualifyingChildInfoSSPRGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040PR"/>
										</xsl:if>
									</tbody>
								</table>
							</div>
							<!-- Set Initial Height of Above Table -->
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form1040PRData/QualifyingChildInfoSSPRGrp"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerRowCount" select="1"/>
								<xsl:with-param name="containerID" select=" 'QualifyingChildInfoSSPRGrpDiv' "/>
							</xsl:call-template>
							<!-- End Set Initial Height of Above Table -->
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:4mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">3</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;">
										Contribución sobre el trabajo por cuenta propia de la línea <b>12</b> de la Parte V
										<!--Dotted Line-->
									  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...........</span>
									</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">padding:.5mm;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding:.5mm;</xsl:with-param>									
										<xsl:with-param name="Number">3</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/SelfEmploymentTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (4) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:7.5mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-left:.25mm;">4</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;">
										Contribuciones por empleados domésticos (vea las instrucciones). Adjunte el Anexo H-PR<br/>
										(Formulario 1040-PR)
										<!--Dotted Line-->
									  <span class="styDotLn" style="float:none;clear:none;padding-left:2.75mm;">...........................</span>
									  <xsl:call-template name="SetFormLinkInline">
									    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/HouseholdEmploymentTaxAmt"/>
									  </xsl:call-template>									  
									</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">height:3.5mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">height:3.5mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">4</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/HouseholdEmploymentTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (5) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:4mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">5</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
										Contribución Adicional de <i>Medicare</i>.  Adjunte el <b>Formulario 8959</b> 
										<!--Dotted Line-->
									  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...............</span>										
									</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">5</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalAMRRTTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:4mm;">
							<div class="styIRS1040PRLNLeftNumBox"  style="padding-top:.5mm;">6</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;">
										<b>Contribuciones totales.</b> Sume las líneas <b>3</b> ala <b>5</b> (vea las instrucciones)
	 								<!--Dotted Line-->
									  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....</span>
									<span style="width:.25mm;"/>
									 <xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Repayment Of Advance Payment Received In Error Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="	
																		   $Form1040PRData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Repayment Of Advance Payment Received In Error Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="							
																		   $Form1040PRData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Tax On Tips Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/TaxOnTipsCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Social Security Medicare Tax Unrptd Tip Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="
																		    $Form1040PRData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/SocSecMedicareTaxUnrptdTipAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Tax On Tips Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="
										                                   $Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedTaxCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Tax On Tips Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="
										                                   $Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedSocSecTaxOnTipsAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="
																		   $Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedTaxCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="
																	       $Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedSocSecMedTaxAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax GTLI Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="
										                                   $Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedTaxCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax GTLI Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="
														                $Form1040PRData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedSocSecMedTaxGTLIAmt"/>
									</xsl:call-template>
									</div>									
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">6</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalTaxAdditionsGrp/TotalTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:4mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">7</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;">
										<span style="font-size:8pt;">Pagos de contribución estimada del año 2016 (vea las instrucciones</span>)
	 								<!--Dotted Line-->
									  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>
									</div>
							<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;
										</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">7</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/EstimatedTaxPaymentsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:4mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">8</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;">
										<span style="font-size:8pt;">Contribución al seguro social retenida en exceso (vea las instrucciones)</span>
	 								<!--Dotted Line-->
									  <span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">..</span>	
									  <xsl:call-template name="SetFormLinkInline">
									    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ExSocSecTaxWithheldAmt"/>
									  </xsl:call-template>											  									
									</div>
							<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">8</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/ExSocSecTaxWithheldAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:4mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">9</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;">
										Crédito tributario adicional por hijos de la línea <b>3</b> de la Parte II
	 								<!--Dotted Line-->
									  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>										
									</div>
							<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">9</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/ACTCBonaFideResidentsGrp/AdditionalChildTaxCreditAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:4mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">10</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;">
										Crédito tributario por cobertura de seguro de salud. Adjunte el <b>Formulario 8885</b>
									</div>
							<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
											<xsl:call-template name="CreateBox_1040PR">
												<xsl:with-param name="Number">10</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$Form1040PRData/HealthCoverageTaxCreditAmt"/>
											</xsl:call-template>
										</div>
								</div>
						</div>
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:4mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">11</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;padding-top:0mm;">
										<b>Pagos y créditos totales</b> (vea las instrucciones)
	 								<!--Dotted Line-->
									  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>										
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part I, Line 11 - Request for Extension Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalPaymentsAmt/@requestForExtensionCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part I, Line 11 - Request for Extension Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalPaymentsAmt/@requestForExtensionAmt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											 <xsl:with-param name="Desc">Part I, Line 11 - Additional Medicare Tax Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040SSPRData/AddnlMedicareTaxWithheldGrp/AdditionalMedicareTaxCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part I, Line 11 - Additional Medicare Withholding Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040SSPRData/AddnlMedicareTaxWithheldGrp/AddlMedcrRRTTaxWithholdingAmt"/>
										</xsl:call-template>
									</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">11</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalPaymentsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:7mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm">12</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;">
										Si la línea <b>11</b> es mayor que la línea <b>6</b>, reste la cantidad de la línea <b>5</b> de la cantidad de la línea <b>11</b>. Esta es la<br/>
										cantidad <b>pagada en exceso</b>	 								
									  <!--Dotted Line-->
									  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........................</span>
								      <img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
									</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">height:3mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">height:3mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">12</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/OverpaidAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (13a) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:7mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">13a</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;">
										Cantidad de la línea <b>12</b> que desea que <b>se le reintegre</b>. Si se ha incluido el <b>Formulario 8888</b>,<br/>
										marque aquí
									  <!--Dotted Line-->
									  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............................</span>										
										</div>				
										<span style="margin-top:3mm">										
										<xsl:choose>
												<xsl:when test="$Form1040PRData/Form8888Ind/@referenceDocumentId">
													<span style="width:.25mm;"/>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1040PRData/Form8888Ind"/>
													</xsl:call-template>
													<span style="width:.25mm;"/>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:.25mm"/>
												</xsl:otherwise>
											</xsl:choose>
											<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>																					
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
										</span>													
						<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">height:3mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">height:3mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>																																	
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">13a</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/RefundAmt"/>
									</xsl:call-template>
								</div>
							 </div>
						  </div>							
						</div>
						<!-- (13b-13c) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:4mm">
							<div class="styIRS1040PRLNLeftNumBox" style="padding:1.25mm 0mm .5mm 0mm;">b</div>
							<div class="styIRS1040PRLNDesc" style="width:33mm;padding:1mm 0mm 1mm 3mm;">
								Núm. de circulación
							</div>
							<span class="styLNCtrNumBox" style="width:50mm;height:4mm;border-width:1px 1px 1px 1px;text-align:center;margin-top:.5mm;padding:.5mm 0mm 0mm 0mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1040PRData/RoutingTransitNum"/>
								</xsl:call-template>
							</span>
						    <span style="width:1.5mm;"/>
 						    <img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
							<span style="width:.5mm;"/>
							<span class="styBoldText">c</span><span style="padding-left:.75mm">Tipo:</span>
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
								<span style="width:.25mm;"/>									
									Corriente
								</label>
								<span style="width:1mm;"/>
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
								<span style="width:.25mm;"/>												
									Ahorros
								</label>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (13d) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:5.5mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding:2.5mm 0mm 0mm 0mm;">d</div>
							<div class="styIRS1040PRLNDesc" style="width:33mm;padding:2.25mm 0mm 0mm 3mm;">
								Núm. de cuenta
							</div>
							<span class="styLNCtrNumBox" style="width:90mm;height:4mm;border-width:1px 1px 1px 1px;text-align:center;margin-top:1.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1040PRData/DepositorAccountNum"/>
								</xsl:call-template>
							</span>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">height:5.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">height:5.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:6.5mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-bottom:0mm;">14</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;padding-bottom:0mm;">
										Cantidad de la línea <b>12</b> que desea que se le <b>acredite a la contribución<br/>
										estimada de 2017</b>
									  <!--Dotted Line-->
									  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...................</span>	
											<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
									</div>
							<div class="styIRS1040PRCleanDiv" style="width:75mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">height:3.4mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">height:3.4mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:auto;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">14</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/AppliedToEsTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:8mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:1mm;">15</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;padding:1mm 0mm 0mm 3mm;">
										<b>Cantidad que usted adeuda.</b> Si la cantidad de la línea <b>6</b> es mayor que la cantidad de la línea <b>11</b>, reste la<br/>
										cantidad de la línea <b>11</b> de la cantidad de la línea <b>6</b>. Para detalles sobre cómo se paga, vea las instrucciones
										<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
									</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:37mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">height:4mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">height:4mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">15</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/OwedAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Third Party Designee -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styBB" style="width:187mm;border-bottom:1px solid black;">
						<div class="styIRS1040PRLineItem" style="height:12mm;">
							<!-- Header -->
						 <div style="width:17.5mm;float:left;clear:none;">
							  <div style="padding-top:1mm;padding-bottom:0mm;">
								<span class="styMainTitle" style="font-size:9pt;padding-top:1mm;">
									Tercero</span><br/>							
								<span style="font-weight:bold;font-size:8.5pt;padding-top:.25mm;">Autorizado</span>
							</div>
							</div>
							<!-- Body -->
							<div style="width:169.5mm;float:left;clear:none;">
								<div style="font-size:7pt;float:left;clear:none;padding:.75mm 0mm 0mm 3mm;;">
										¿Desea permitir que otra persona hable sobre esta planilla con el IRS (vea las instrucciones)?
								</div>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<div style="float:left;clear:none;padding:0mm 0mm 2mm 3mm;">
								 <!-- Checkbox -->        
								 <xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneeInd"/>
								 </xsl:call-template>
								<input type="checkbox" class="styCkbox" style="margin:.25mm .25mm;">
									 <xsl:if test="$Form1040PRData/ThirdPartyDesigneeInd">
										<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneeInd"/>
									 <xsl:with-param name="BackupName">IRS1040PRThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
									</xsl:if>
								</input>
								<label>
									<xsl:if test="$Form1040PRData/ThirdPartyDesigneeInd">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneeInd"/>
											<xsl:with-param name="BackupName">IRS1040PRThirdPartyDesigneeInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
										<span style="width:.1mm;"/>		
										<b>Sí.</b> Complete lo siguiente.
									</label>
							   </div>   									
							   <div style="float:left;clear:none;padding-left:7mm;">                   
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneeInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" style="margin:.25mm .25mm;">
									<xsl:if test="$Form1040PRData/ThirdPartyDesigneeInd">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneeInd"/>
											<xsl:with-param name="BackupName">IRS1040PRThirdPartyDesigneeInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</input>
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
								<div style="height:2mm;float:left;clear:none;width:165mm;">
								<!-- Designee’s name-->
								<div style="height:10mm;float:left;clear:none;width:22mm;font-size:7pt;padding:0mm 0mm 4mm 3mm;">Nombre de esta<br/>
									<span style="padding-top:.25mm;"> persona	</span>		
									<span style="width:3.5mm;"/>
									<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
								</div>
								<div style="width:47mm;float:left;clear:none;padding:3.5mm 0mm 0mm 0mm;">
								<xsl:if test="$Form1040PRData/ThirdPartyDesigneeNm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneeNm"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1040PRData/Preparer">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/Preparer"/>
									</xsl:call-template>
								</xsl:if>
								</div>								
								<!-- Phone no.-->
  				               <div style="float:left;clear:none;width:13mm;padding-left:.5mm;font-size:7pt;">
									Número de<br/>
							   <span style="padding-top:.5mm;"> teléfono</span>
							   <span style="width:1mm;"/>	
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
								</div>
							    <div style="float:left;clear:none;width:29mm;padding-top:3.5mm;">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneePhoneNum"/>
										</xsl:call-template>
								</div>
								<!-- Personal identification number (PIN) -->
								<div style="float:left;clear:none;width:35mm;padding-bottom:1mm;padding-left:5mm;font-size:7pt;">
									Número de identificación<br/>
								<span style="padding-top:.5mm;">personal (PIN)</span>
								<span style="width:9mm;"/>
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
								</div>
								 <div class="styLNCtrNumBox" style="float:right;width:19mm;border-top-width:1px;margin-top:1.5mm;">
									<xsl:call-template name="PopulatePin">
										<xsl:with-param name="TargetNode" select="$Form1040PRData/ThirdPartyDesigneePIN"/>
									</xsl:call-template>
								</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Sign Here -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styBB" style="width:187mm;float:none;clear:both;">
						<div class="styIRS1040PRLineItem" style="height:24.5mm;">
							<!-- Header -->
							<div class="styIRS1040PRCleanDiv" style="width:17.5mm;height:100%;">
								<span class="styBoldText" style="font-size:9pt;padding-top:.25mm;">Firme aquí</span>
								<div class="styIRS1040PRCleanDiv" style="width:22;text-align:center;padding-top:.25mm;">
									¿Planilla<br/>conjunta?<br/> Vea las<br/>instrucciones.<br/>Conserve una<br/>copia para<br/>su archivo.
								</div>
							</div>
							<!-- Body -->
							<div class="styIRS1040PRCleanDiv" style="width:165mm;height:100%;">
								<div class="styIRS1040PRLNDesc" style="width:100%;height:8.5mm;padding:.25mm 0mm 0mm 3mm;font-size:7pt;">
									Declaro bajo pena de perjurio que esta planilla, incluyendo los anexos y demás documentos que la acompañan, ha sido examinada por mí y que 
									según mi leal saber y entender es verídica, correcta y completa. La declaración del agente o preparador (que no es el contribuyente) está basada en toda la 
									información de la cual el agente o preparador tiene conocimiento.
								</div>
								<!-- Container -->
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:22mm;margin-left:6mm;">
									<!-- Line 1 -->
									<img src="{$ImagePath}/1040PR_Bullet_Lg.gif" alt="Large Bullet" width="21" height="49" style="float:left;margin:2.5mm -4mm;padding-left:1.5mm;"/>
									<div class="styIRS1040PRCleanDiv" style="width:160mm;height:8mm;margin-left:3mm;border-bottom-width:1px;border-color:black;">
										<!-- Your Signature -->
										<div class="styIRS1040PRLNDesc" style="width:90mm;height:8mm;border-right-width:1px;border-color:black;padding-left:0mm;font-size:7pt;">
											Su firma<br/>
											<span style="width:100%;padding-top:6px;">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN"/>
													<xsl:with-param name="BackupName">RtnHdrDataPrimarySignature</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Date -->
										<div class="styIRS1040PRLNDesc" style="width:20mm;height:8mm;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
											<span style="width:100%;padding-left:4px;">Fecha</span>
											<span style="width:100%;padding:1.5mm 0mm 0mm 1mm;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
													<xsl:with-param name="BackupName">RtnHdrDataPrimarySignatureDate</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Daytime phone number -->
										<div class="styIRS1040PRLNDesc" style="width:50mm;height:8mm;border-right-width:0px;border-color:black;padding-left:0px;font-size:7pt;">
											<span style="width:100%;padding-left:4px;">Número de teléfono durante el día</span>
											<span style="width:100%;padding-top:6px;padding:1.5mm 0mm 0mm 1mm;">
												<xsl:choose>
													<xsl:when test="$Form1040PRData/DaytimePhoneNum">
														<xsl:call-template name="PopulatePhoneNumber">
															<xsl:with-param name="TargetNode" select="$Form1040PRData/DaytimePhoneNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1040PRData/ForeignPhoneNum"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</span>
										</div>
									</div>										
									<!-- Line 2 -->
										<!-- Spouse’s signature -->
										<div class="styIRS1040PRLNDesc" style="width:93mm;height:8mm;border-right-width:1px;border-color:black;padding-left:3mm;font-size:6.5pt;">
											Firma del cónyuge. Si radican conjuntamente, <b>ambos</b> cónyuges tienen que firmar.<br/>
											<span style="width:100%;padding-top:6px;">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignaturePIN"/>
													<xsl:with-param name="BackupName">RtnHdrDataSpouseSignature</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Date -->
										<div class="styIRS1040PRLNDesc" style="width:20mm;height:8mm;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
											<span style="width:100%;padding-left:4px;">Fecha</span>
											<span style="width:100%;padding-top:6px;padding:1.5mm 0mm 0mm 1mm;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDt"/>
													<xsl:with-param name="BackupName">RtnHdrDataSpouseSignatureDate</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Identity protection Pin -->
										<div class="styIRS1040SSPRLNDesc" style="width:52mm;height:8mm;border-color:black;padding-left:1mm;font-size:7pt;">
											Si el IRS le envió un Identity Protection PIN," anótelo aquí. (vea inst.)
										<div class="styLNCtrNumBox" style="width:21mm;border-top-width:1px;float:right;margin-right:2mm;">
											<xsl:call-template name="PopulatePin">
											  <xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
											  <xsl:with-param name="BackupName">RtnHdrDataIdentityProtectionPIN"</xsl:with-param>
											</xsl:call-template>
										</div>											
										 </div>
									</div>
								</div>
							</div>
						</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Paid Preparer Use Only -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styTBB" style="width:187mm;padding-bottom:8.5mm;font-size:6.5pt;font-family:arial;float:none;clear:both;">
						<!-- Header -->					
						<div style="width:21mm;padding-top:1mm;float:left;clear:none;">
						<span class="styMainTitle" style="font-size:9pt;">	
								Para uso<br/>exclusivo del<br/>Preparador<br/>Remunerado
						  </span>
							</div>
							<!-- Body -->
							<!-- Line 1 -->														
							<div style="width:166mm;float:left;clear:none;border-width:0px 0px 0px 0px; border-color:black;border-style:solid;">
							<div style="width:166mm;height:8mm;float:left;clear:none;;border-width:0px 0px 1px 0px;border-style:solid;border-color:black;">
							<!-- Box 1 -->							
							 <div class="styFNBox" style="width:52mm;height:8mm;padding:.25mm 0mm .5mm 1.5mm;">
									Escriba el nombre del Preparador<br/>
 							 <div style="padding-top:1mm;">
							 <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
									<xsl:with-param name="BackupName">RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
							</xsl:call-template>
							</div>			
							</div>										
							<!-- Box 2 -->							
						   <div class="styFNBox" style="width:43.5mm;height:8mm;padding:.25mm 0mm .5mm 1mm;border-right-width:1 solid black;">
								Firma del Preparador<br/>						   
							</div>
							<!-- Box 3 -->
							<div class="styFNBox" style="width:20mm;height:8mm;padding:.25mm 0mm .5mm 1mm;">
								Fecha<br/>
							<div style="padding-top:1mm;">
							<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
								<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
							</xsl:call-template>
							</div>
							</div>
							<!-- Box 4 -->
							<div class="styFNBox" style="width:27mm;height:8mm;padding:0mm 0mm .5mm 1mm;">
								Marque aquí si el<br/>preparador trabaja<br/>por cuenta propia	
							<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
								<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
							</xsl:call-template>
							<input class="styCkbox" type="checkbox" style="margin:-5mm 0mm 3mm 3mm;">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
								<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
							</xsl:call-template>
							</input>				
							</label>
							</div>							
							<div class="styFNBox" style="width:23mm;height:8mm;padding:.25mm 0mm .5mm 1mm;border-right:none;">
								<i>PTIN</i><br/>
							<div style="padding-top:1mm;">
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
  							<!-- Line 2 -->
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:8mm;">
									<div class="styIRS1040PRCleanDiv" style="width:40mm;height:8mm;font-size:6pt;padding-left:3mm;">
										Nombre del negocio (o del<br/>preparador, si trabaja por cuenta<br/>propia), dirección y zona postal
									</div>
									<img src="{$ImagePath}/1040PR_Bullet_Md.gif" alt="Medium Bullet" width="8" height="23" style="float:left;margin:.5mm -3mm;"/>										
									<div class="styIRS1040PRCleanDiv" style="width:126mm;height:8mm;">
										<div class="styIRS1040PRCleanDiv" style="width:100%;height:6mm;border-bottom-width:1px;">
											<div class="styIRS1040PRCleanDiv" style="width:82.25mm;height:4mm;padding-top:.5mm;font-size:6pt;">
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
												</xsl:call-template><br/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
												</xsl:call-template>
											</div>
											<div class="styIRS1040PRCleanDiv" style="width:43mm;height:6mm;font-size:6pt;border-left-width:1px;padding:.5mm 0mm 0mm .5mm;">
												Núm. de identificación patronal<span style="width:1mm;"/>
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
										<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;font-size:6pt;">
											<div class="styIRS1040PRCleanDiv" style="width:82.25mm;height:4mm;padding-top:.5mm;font-size:6pt;">
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
												</xsl:call-template><br/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
												</xsl:call-template><br/>
												<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
													</xsl:call-template>,
													<span style="width:.25mm;"/>
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
													</xsl:call-template>,
													<span style="width:.25mm;"/>
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
													</xsl:call-template>,
													<span style="width:.25mm;"/>
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
													</xsl:call-template>,
													<span style="width:.25mm;"/>
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCd</xsl:with-param>
													</xsl:call-template>,
													<span style="width:.25mm;"/>
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountryCd</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</div>
											<div class="styIRS1040PRCleanDiv" style="width:43mm;height:10.5mm;font-size:6pt;border-left-width:1px;padding:.5mm 0mm 0mm .5mm;">
												Número de teléfono<span style="width:1mm;"/>
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
					<div class="pageEnd" style="width:187mm;padding-top:.25mm;">
						<div style="float:left;">
							<span class="styBoldText">
								Para el Aviso sobre la Ley de Divulgación y Confidencialidad de Información y la Ley de<br/>
								Reducción de Trámites, vea las instrucciones.
							</span>
						</div>
						<div style="float:right;">
							<span style="width:10mm;"/>  
								Formulario 
							<span class="styBoldText" style="font-size:8pt;">1040-PR</span> (2016)
						</div>
						<div style="width:26mm;loat:right;text-align:center;font-size:7pt;">
							Cat. No. 17182F
						</div>
					</div>
					<p style="page-break-before: always;"/>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">
							Formulario 1040-PR (2016)
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
						<div class="styPartName" style="width:14mm;height:4mm;padding-top:.25mm;font-size:9pt">Parte II</div>
						<div class="styPartDesc" style="height:7mm;padding:.25mm 0mm 0mm 4mm;font-size:8.5pt;">
							Residentes <i>Bona Fide</i> de Puerto Rico que reclaman el Crédito Tributario Adicional por Hijos.<br/>
							<span class="styNormalText" style="padding-left:.5mm;">Vea las instrucciones.</span>
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
						<div class="styIRS1040PRLineItem" style="height:4mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">1</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;">
										Ingresos recibidos de fuentes dentro de Puerto Rico
										  <!--Dotted Line-->
									  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...................</span>										
									</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">1</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040PRData/ACTCBonaFideResidentsGrp/PuertoRicoIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:7.5mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">2</div>
								<div class="styIRS1040PRLNDesc" style="width:auto;">
										Contribuciones al Seguro Social y al <i>Medicare</i> retenidas de su(s) Formulario(s) 499R-2/W-2PR (adjunte<br/>
										copia(s) de dicho(s) formulario(s))
										  <!--Dotted Line-->
									  <span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">........................</span>
									  <xsl:call-template name="SetFormLinkInline">
									    <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ACTCBonaFideResidentsGrp/TotalSocSecAndMedcrWithheldAmt"/>
									  </xsl:call-template>											  									
								</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
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
						<div class="styIRS1040PRLineItem" style="height:7.5mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">3</div>
									<div class="styIRS1040PRLNDesc" style="width:auto;">
										<b>Crédito tributario adicional por hijos.</b> Utilice la hoja de trabajo en las instrucciones para<br/>
										calcular la cantidad que puede anotar aquí y en la línea <b>9</b> de la Parte I
										  <!--Dotted Line-->
									  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.............</span>
									</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:37mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
						<xsl:call-template name="PopulateProfitLossFromBusinessSection_1040PR">
							<xsl:with-param name="TargetNode" select="."/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($Form1040PRData/ProfitLossFromBusiness) = 0">
						<xsl:call-template name="PopulateProfitLossFromBusinessSection_1040PR"/>
					</xsl:if>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part V																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<xsl:for-each select="$Form1040PRData/SelfEmploymentTaxGrp">
						<xsl:call-template name="PopulateSelfEmploymentTaxSection_1040PR">
							<xsl:with-param name="TargetNode" select="."/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($Form1040PRData/SelfEmploymentTaxGrp) = 0">
						<xsl:call-template name="PopulateSelfEmploymentTaxSection_1040PR"/>
					</xsl:if>
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
							<xsl:with-param name="TargetNode" select="$Form1040PRData/PrimaryDeathDt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Spouse Date of Death</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/SpouseDeathDt"/>
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
							<xsl:if test="QualifyingChildNameControlTxt">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part I - Line 2 - Qualifying Child Name Control (Row <xsl:value-of select="$Num"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="QualifyingChildNameControlTxt"/>
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
							<xsl:with-param name="Desc">Part I, Line 11 - Request for Extension Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalPaymentsAmt/@requestForExtensionCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 11 - Request for Extension Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040PRData/TotalPaymentsAmt/@requestForExtensionAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 11 - Additional Medicare Tax Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSPRData/AddnlMedicareTaxWithheldGrp/AdditionalMedicareTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					    <xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 11 - Additional Medicare Withholding Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSPRData/AddnlMedicareTaxWithheldGrp/AddlMedcrRRTTaxWithholdingAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
					     </xsl:call-template>        						
						<xsl:for-each select="$Form1040SSPRData/FarmingProfitLoss">
							 <xsl:if test="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/@section263AIndicatorCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part III - Section B - Line 34(e) - Section 263 A Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/@section263AIndicatorCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>  
							</xsl:if>  			  
							<xsl:if test="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/Desc">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part III - Section B - Line 34(e) - Total Preproductive Period Expenses</xsl:with-param>
									<xsl:with-param name="TargetNode" select="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/Desc"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
					    </xsl:for-each>					                
					    <xsl:for-each select="$Form1040SSPRData/FarmingProfitLoss">
						<xsl:if test="FarmExpensesGrp/NetFarmProfitLossAmt/@passiveActivityLossLiteralCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part III - Section B - Line 36 - Passive Activity Loss Literal Code (<xsl:value-of select="position()"/>)</xsl:with-param>
								<xsl:with-param name="TargetNode" select="FarmExpensesGrp/NetFarmProfitLossAmt/@passiveActivityLossLiteralCd"/>
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
							<xsl:if test="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Community Income Taxed To Spouse Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Community Income Taxed To Spouse Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt"/>
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
				  <!-- (34a-e) //////////////////////////////////////////////////// -->          
<!--					   <xsl:if test="($Print = $Separated) and (count($Form1040SSPRData/FarmingProfitLoss/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &gt; 5)">
						<span class="styRepeatingDataTitle">Formulario
						 <xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
							  1040-SS
							</xsl:if>
							<xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
							  1040-PR
							</xsl:if>                
							Parte III - Sección C - La Línea 34 - Otros Gastos			
						</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;font-family:arial;width:100mm;">
								<thead class="styTableThead">
									<tr class="styDepTblHdr">
										<th class="styIRS1040PRTableCell" scope="col" rowspan="2" style="width:10mm;font-weight:normal;">
											Letter
										</th>
										<th class="styIRS1040PRTableCell" scope="col" rowspan="2" style="width:55mm;font-weight:normal">
											Description
										</th>
										<th class="styIRS1040PRTableCell" scope="col" rowspan="2" style="width:35mm;font-weight:normal">
											Amount
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$Form1040SSPRData/FarmingProfitLoss/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense">
										<xsl:variable name="Letter">
											<xsl:number format="a"/>
										</xsl:variable>
										<tr style="border-color:black;height:6mm;">
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styTableCellText" style="width:10mm;text-align:center;">
												<xsl:value-of select="$Letter"/>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellText" style="width:55mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Desc"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellText" style="width:35mm;text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Amt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
					  </xsl:if>        -->
					<!-- Separated Data for Part I - Qualifying Children -->
					<xsl:if test="($Print = $Separated) and  (count($Form1040PRData/QualifyingChildInfoSSPRGrp) &gt; 6)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Formulario 1040-PR, Parte I - Hijos calificados
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
				  <!--(43) ////////////////////////////////////////////////////-->
					<xsl:for-each select="$Form1040PRData/FarmingProfitLoss">
						<xsl:if test="FarmIncomeAccrualMethodGrp and (count(FarmIncomeAccrualMethodGrp/OtherIncomeGrp) &gt; 0)">
							<br/>
							<br/>
							<span class="styRepeatingDataTitle">
								Formulario 1040-PR, Parte III - Sección C - La Línea 43 - Otros ingresos de negocio agropecuario<br/>
								Nombre del propietario:<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="FarmProprietorName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="FarmProprietorName/BusinessNameLine2Txt">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="FarmProprietorName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<xsl:variable name="CellStyle">border-color:black;font-size:7pt;text-align:center;font-family:arial;padding-left:0px;padding-right:0px;</xsl:variable>
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
									<xsl:for-each select="FarmIncomeAccrualMethodGrp/OtherIncomeGrp">
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
													<xsl:with-param name="TargetNode" select="OtherIncomeTyp"/>
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
													<xsl:with-param name="TargetNode" select="OthIncmIncludingGasFuelTxCrAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
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
		<xsl:param name="Height">4mm</xsl:param>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:4mm;<xsl:value-of select="$Height"/>;
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
				height:4mm;<xsl:value-of select="$Height"/>;
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
			<xsl:when test="$Number = 5 and $LineEData and $LineEData/TotalPreproductivePrdExpnsAmt">
				<div class="styIRS1040PRLineItem" style="height:3.8mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="height:3.8mm;padding:.75mm 0mm 0mm 0mm;">
						<xsl:number value="$Number" format="a"/>
					</div>
					<div class="styIRS1040PRLNDesc" style="width:47mm;height:3.8mm;padding-top:0mm;">
						<span style="width:43mm;height:3.8mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$LineEData/TotalPreproductivePrdExpnsAmt/@section263AIndicatorCd"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:3.8mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:3.8mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="Number">
									<xsl:value-of select="concat('34', 'e')"/>
								</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$LineEData/TotalPreproductivePrdExpnsAmt"/>
								<xsl:with-param name="AmountBoxStyle">
									border-bottom-width:1px;
								</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">
									border-bottom-width:1px;
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
				<xsl:with-param name="Style">border-bottom-width:1px;</xsl:with-param>
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
		<div class="styIRS1040PRLineItem" style="height:3.8mm;">
		  <div class="styIRS1040PRLNLeftNumBox" style="height:3.8mm;padding:.75mm 0mm 0mm 0mm;">
			<xsl:value-of select="$Letter"/>
		  </div>
		  <div class="styIRS1040PRLNDesc" style="width:47mm;height:3.8mm;padding-top:0mm;">
			<span style="width:43mm;height:3.8mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
			  <xsl:if test="$TargetNode">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$TargetNode/Desc"/>
				</xsl:call-template>
			  </xsl:if>
			</span>
		  </div>
		  <div class="styIRS1040PRCleanDiv" style="width:37mm;height:3.8mm;padding:0px 0px 0px 0px;float:right;">
			<div class="styIRS1040PRCleanDiv" style="width:100%;height:3.8mm;float:right;">
			  <xsl:choose>
				<xsl:when test="$TargetNode">
				  <xsl:call-template name="CreateBox_1040PR">
					<xsl:with-param name="Number">
					  <xsl:value-of select="concat('34', $Letter)"/>
					</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$TargetNode/Amt"/>
					<xsl:with-param name="AmountBoxStyle">border-bottom-width:1px;
					  <xsl:value-of select="$Style"/>
					</xsl:with-param>
					<xsl:with-param name="NumberBoxStyle">border-bottom-width:1px;
					  <xsl:value-of select="$Style"/>
					</xsl:with-param>
				  </xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
				  <xsl:call-template name="CreateBox_1040PR">
					<xsl:with-param name="Number">
					  <xsl:value-of select="concat('34', $Letter)"/>
					</xsl:with-param>
					<xsl:with-param name="AmountBoxStyle">border-bottom-width:1px;
					  <xsl:value-of select="$Style"/>
					</xsl:with-param>
					<xsl:with-param name="NumberBoxStyle">border-bottom-width:1px;
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
			<div class="styIRS1040PRLineItem" style="height:auto;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;"/>
				<div class="styIRS1040PRLNDesc" style="width:47mm;">
					<span style="width:43mm;height:auto;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode/Desc"/>
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
									<xsl:with-param name="TargetNode" select="$TargetNode/Amt"/>
									<xsl:with-param name="AmountBoxStyle">height:15.5mm; 
										border-bottom-width:0px;<xsl:value-of select="$Style"/>;
									</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">height:15.5mm; 
										border-bottom-width:0px;<xsl:value-of select="$Style"/>;background-color:lightgrey;
									</xsl:with-param>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="AmountBoxStyle">height:4.75mm;
										border-bottom-width:0px;<xsl:value-of select="$Style"/>;
									</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">height:4.75mm; 
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
		<xsl:variable name="CommonStyle">border-color:black;font-size:7pt;text-align:center;font-family:arial;padding-left:0px;padding-right:0px;</xsl:variable>
		<tr>
			<xsl:if test="$AddColoredHeaders">
				<xsl:attribute name="class">styDepTblHdr</xsl:attribute>
			</xsl:if>
			<th class="styIRS1040PRTableCell" scope="col">
				<xsl:attribute name="style">width:80mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				<div class="styNormalText"><b>(a)</b> Nombre de pila				
					<span style="width:25mm;"/>Apellido(s) 
				</div>	
			</th>
			<th class="styIRS1040PRTableCell" scope="col">
				<xsl:attribute name="style">width:35mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				<span class="styNormalText"><b>(b)</b> Número de Identificación del hijo</span>
			</th>
			<th class="styIRS1040PRTableCell" scope="col">
				<xsl:attribute name="style">width:72mm;<xsl:value-of select="$CommonStyle"/>;border-right-width:0px;</xsl:attribute>
				<span class="styNormalText"><b>(c)</b> Parentesco del hijo con usted</span>
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
				<xsl:attribute name="style">width:80mm;height:4mm;text-align:left;<xsl:value-of select="$IsLast"/></xsl:attribute>
				<xsl:if test="$TargetNode">
				 <span style="width:30mm;text-align:left;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="QualifyingChildFirstNm"/>
					</xsl:call-template>
				 </span>	
				 <span style="width:8mm;"/>
				 <span style="width:32mm;text-align:left;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="QualifyingChildLastNm"/>
					</xsl:call-template>
				 </span>	
				 <span style="width:4mm;">					
					<xsl:if test="$TargetNode/QualifyingChildNameControlTxt">
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Part I, Line 2 - Qualifying Child <xsl:number value="position()"/> Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$TargetNode/QualifyingChildNameControlTxt"/>
						</xsl:call-template>
					</xsl:if>
				 </span>						
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
				<xsl:attribute name="style">width:38mm;height:4mm;text-align:center;<xsl:value-of select="$IsLast"/></xsl:attribute>
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
				<xsl:attribute name="style">width:65mm;height:4mm;text-align:left;border-right-width:0px;<xsl:value-of select="$IsLast"/></xsl:attribute>
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
			<div class="styPartName" style="width:14mm;height:4mm;font-size:9pt;padding-top:.25mm">Parte III</div>
			<div class="styPartDesc" style="height:7mm;padding:.25mm 0mm 0mm 4mm;font-size:8.5pt;font-weight:normal;">
				<b>Ganancias o pérdidas de negocio agropecuario.</b> Vea las instrucciones para el Anexo F<br/>
			<span class="styNormalText">(Formulario 1040), en inglés.</span>				
			</div>
		</div>
		<!-- Body -->
		<div class="styBB" style="width:187mm;">
			<!-- Name and SSN section -->
			<div class="styIRS1040PRLineItem" style="height:10mm;border-bottom-width:1px;border-color:black;">
				<div class="styIRS1040PRLNDesc" style="width:150mm;height:10mm;padding-top:0mm;padding-left:0mm;font-size:7.5pt;">
					Nombre del propietario<br/>
					  <span style="padding:.5mm 0mm 0mm 0mm;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode/FarmProprietorName/BusinessNameLine1Txt"/>
							</xsl:call-template><br/>							
							<xsl:if test="$TargetNode/FarmProprietorName/BusinessNameLine2Txt">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmProprietorName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
					</span>
				</div>
				<div class="styIRS1040PRLNDesc" style="width:37mm;height:10mm;border-left-width:1px;padding-top:0mm;padding-left:1mm;border-color:black;font-size:7.5pt;">
					<b>Número de seguro social</b>
					  <span style="padding:.5mm 0mm 0mm 0mm;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$TargetNode/SSN"/>
							</xsl:call-template>
						</xsl:if>
					  </span>						
				</div>
			</div>
			<!-- Note -->
			<div class="styIRS1040PRLineItem" style="height:8mm;">
				<div class="styIRS1040PRLNDesc" style="width:187mm;padding-left:0mm;">
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
				<span style="width:.25mm;"/>
				<img src="{$ImagePath}/1040PR_Short_Line.gif" alt="Short Line"/>
				Método de contabilidad a base de efectivo (Complete las Secciones A y B)
				<span class="styNormalText">
					(Si usa el método de contabilidad a base de lo devengado, complete las <b>Secciones B</b> y <b>C</b>, así como la línea <b>11</b> de la <b>Sección A</b>).<br/>
					No incluya la venta de ganado usados para tiro, cría, entretenimiento o lechería.
				</span>
			</div>
		</div>
		<!-- Body -->
		<div class="styBB" style="width:187mm;">
			<!-- (1) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">1</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Venta de ganado y otros artículos que compró para revender
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">1</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/SalesOfLvstckBghtForResaleAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">2</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Costo u otra base del ganado y otros artículos que declaró en la línea <b>1</b>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">2</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/CostOfLvstckBghtForResaleAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">3</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Reste la línea <b>2</b> de la línea <b>1</b>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........................</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">3</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/PurchasedProfitAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">4</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;">
							Ventas de ganado criado, productos agrícolas, granos y otros productos que cultivó
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">4</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/SaleOfProductsRaisedAmt"/>
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
			<div class="styIRS1040PRLineItem" style="width:118mm;float:left;height:4mm">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.75mm;padding-right:0mm;">5a</div>
				<div class="styIRS1040PRLNDesc" style="width:auto;">
					<span style="font-family:arial narrow;font-size:8.25pt;">Total de distribuciones de cooperativas</span><span style="font-family:arial narrow;font-size:8pt;"> <b>(Formulario(s) 1099-PATR)</b></span>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">5a</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/CooperativeDistributionsAmt"/>
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
			<div class="styIRS1040PRLineItem" style="width:69mm;float:left;height:4mm">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">5b</div>
				<div class="styIRS1040PRLNDesc" style="width:auto;padding:.75mm 0mm 0mm .75mm;">
					Cantidad tributable
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">5b</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/CooperativeDistriTxblAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">6</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Pagos recibidos del programa de agricultura
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....................</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">6</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/AgriculturalProgramPymtAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">7</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Préstamos de la <span class="styItalicText">Commodity Credit Corporation (CCC)</span> declarados bajo elección (o decomisados)
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1.75mm;">...</span>							
						</div>
						<xsl:call-template name="SetFormLinkInline">
							  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/FarmingProfitLoss/FarmIncomeCashMethodGrp/CCCLoanReportedElectionAmt"/>
						</xsl:call-template>												
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">7</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/CCCLoanReportedElectionAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">8</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Ingreso de seguro de cosechas
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:2.5mm;">........................</span>							
						</div>
						<xsl:call-template name="SetFormLinkInline">
							  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/FarmingProfitLoss/FarmIncomeCashMethodGrp/CropInsProcAndDsstrPymtAmt"/>
						</xsl:call-template>						
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">8</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/CropInsProcAndDsstrPymtAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.6mm;">9</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Ingreso de servicios prestados con maquinaria agrícola
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..................</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">9</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/CustomHireIncomeAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.65mm;">10</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
							Otros ingresos
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...............................</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">10</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/OthIncmIncludingGasFuelTxCrAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:10.5mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.7mm;" >11</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							<b>Ingreso bruto agropecuario.</b> Sume las líneas de la columna derecha desde la línea <b>3</b> hasta la línea <b>10</b>, ambas<br/>
							 inclusive. Si es contribuyente que usa el método de contabilidad a base de lo devengado, anote la cantidad que<br/>
							 aparece en la línea <b>50</b> de la <b>Sección C</b>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1.75mm;">......................</span>							
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">height:6.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">height:6.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">11</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeCashMethodGrp/GrossIncomeAmt"/>
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
			<div class="styPartDesc" style="width:187mm;height:11mm;padding:.5mm 0mm 0mm 0mm;font-size:8.5pt;text-align:center;">
				Sección B: Gastos de negocio agropecuario
				<span style="width:3px;"/>
				<img src="{$ImagePath}/1040PR_Short_Line.gif" alt="Short Line"/>
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
				<div class="styIRS1040PRLineItem" style="height:7mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">12</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Gastos de automóvil o de camión<br/>
								(vea las instrucciones.)
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....</span>
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">12</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/CarAndTruckExpensesAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">13</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Productos químicos
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....</span>								
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">13</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/ChemicalExpenseAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.6mm;">14</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Gastos de conservación
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>								
							</div>
						<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">14</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/ConservationExpenseAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:7mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.6mm;">15</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Gastos de servicios prestados con<br/> equipo agrícola
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">15</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/CustomHireExpenseAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:20.5mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">16</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Depreciación y deducciones de<br/>
								gastos hechas de acuerdo a la<br/>
								sección 179 no reclamadas en otra<br/>
								parte de esta planilla. (Adjunte el<br/>
								<b>Formulario 4562</b> si está obligado<br/>
								 a hacerlo)
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........</span>
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">height:16.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">height:16.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">16</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/DeprecAndSect179ExpnsDedAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:9.5mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.15mm;">17</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;padding-top:0mm;">
								Programas de beneficios para los<br/>
								empleados, excepto los incluidos<br/>
								en la línea <b>25</b>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......</span>
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">height:5.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">height:5.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">17</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/EmployeeBenefitProgramAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.6mm;">18</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Compra de alimentos para ganado
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">18</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/FeedPurchasedExpenseAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.6mm;">19</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
								Fertilizantes y cal
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....</span>								
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">19</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/FertilizerAndLimeExpenseAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">20</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Fletes y acarreo
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>								
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">20</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/FreightAndTruckingExpenseAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">21</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Gasolina, combustible y aceite
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.</span>								
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">21</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/GasolineFuelAndOilExpenseAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">22</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Seguros (excepto de salud)
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>								
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">22</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/InsuranceAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">23</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Intereses:
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- (23a) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">a</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;font-family:arial narrow;font-size:8pt;">
								Sobre hipotecas (pagados a bancos, etc.)
							</div>
							<xsl:call-template name="SetFormLinkInline">
								  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/FarmingProfitLoss/FarmExpensesGrp/MortgageInterestPaidBanksAmt"/>
							</xsl:call-template>							
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">23a</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/MortgageInterestPaidBanksAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">b</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Otros
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.........</span>								
							</div>
							<xsl:call-template name="SetFormLinkInline">
								  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/FarmingProfitLoss/FarmExpensesGrp/MortgageInterestPaidOtherAmt"/>
							</xsl:call-template>									
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">23b</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/MortgageInterestPaidOtherAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">24</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
								Mano de obra contratada
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">...</span>								
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode and (count($TargetNode/FarmExpensesGrp/OtherExpenses/OtherExpense) &gt;5)">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">24</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/LaborHiredExpenseAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">24</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:1px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:1px;</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/LaborHiredExpenseAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">24</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:1px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:1px;</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- COLUMN ADJUSTER (starts)-->
				<xsl:if test="$TargetNode and (count($TargetNode/FarmExpensesGrp/OtherExpenses/OtherExpense) &gt;5)">
					<div class="styIRS1040PRLineItem">
						<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
							<div class="styIRS1040PRCleanDiv">
								<xsl:attribute name="style">
									width:100%;float:right;height:0mm;
									<xsl:if test="$TargetNode">
										<xsl:variable name="cnt" select="count($TargetNode/FarmExpensesGrp/OtherExpenses/OtherExpense) + count($TargetNode/FarmExpensesGrp/OtherExpenses/TotalPreproductivePrdExpnsAmt)"/><xsl:choose><xsl:when test="$cnt &gt;5">height:<xsl:value-of select="($cnt - 5)*5"/>mm;</xsl:when><xsl:otherwise>height:0mm;</xsl:otherwise></xsl:choose>
									</xsl:if>
								</xsl:attribute>
								<xsl:call-template name="CreateBox_1040PR">
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
				<div class="styIRS1040PRLineItem" style="height:7mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">25</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Planes de pensión y de<br/>
								participación en las ganancias
								<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.</span>
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">25</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/PensionProfitSharingPlansAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">26</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Alquiler o arrendamiento:
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- (26a) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">a</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Vehículos, maquinaria y equipo
							</div>
						<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">26a</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/MachineryAndEquipmentRentAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm .5mm;">b</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Otros (tierra, animales, etc.)
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.</span>								
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">26b</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/OtherBusinessPropertyRentAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">27</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Reparaciones y mantenimiento
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">27</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/RepairsAndMaintenanceAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">28</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Compra de semillas y plantas
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.</span>                
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">28</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/SeedAndPlantExpenseAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">29</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Gastos de almacenaje
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>                
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">29</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/StorageAndWarehousingExpnsAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">30</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Compra de materiales
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>                
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">30</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/SuppliesAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">31</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Contribuciones
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>                
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">31</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/TaxExpenseAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:7mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">32</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Servicios públicos (agua, gas,<br/>
								electricidad, etc.)
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....</span>  
							</div>							              
					<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="NumberBoxStyle">height:3mm;border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">height:3mm;border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">32</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/UtilitiesAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:7mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">33</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Honorarios pagados por servicios<br/>
								veterinarios, cría y medicinas
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.</span>                
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">33</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/VtrnryBreedingMedicineExpnsAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">34</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;;">
								Otros gastos (especifique):
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- (34a-e) ////////////////////////////////////////////////////-->
				<xsl:choose>
					<xsl:when test="$TargetNode">
						<xsl:variable name="NumberOfOtherExpenseGrp" select="count($TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense)"/>
						<xsl:for-each select="$TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense">
							<xsl:variable name="Letter">
								<xsl:number format="a"/>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="(position() = 5) and ($TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt)">
									<div class="styIRS1040PRLineItem">
										<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">
											<xsl:number value="position()" format="a"/>
										</div>
										<div class="styIRS1040PRLNDesc" style="width:47mm;height:5mm;">
											<span style="width:43mm;height:100%;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/@section263AIndicatorCd"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
											<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
												<xsl:call-template name="CreateBox_1040PR">
													<xsl:with-param name="Number">
														<xsl:value-of select="concat('34', 'e')"/>
													</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
									<xsl:call-template name="CreateOtherExpensesItem_1040PR">
										<xsl:with-param name="TargetNode" select="."/>
										<xsl:with-param name="Letter">
											<xsl:number value="position() + 1" format="a"/>
										</xsl:with-param>
										<xsl:with-param name="LineEData" select="$TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="(position() = last()) and ($NumberOfOtherExpenseGrp &gt;=5)">
									<xsl:call-template name="CreateOtherExpensesItem_1040PR">
										<xsl:with-param name="TargetNode" select="."/>
										<xsl:with-param name="Letter">
											<xsl:choose>
												<xsl:when test="(position() &gt; 5) and ($TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt)">
													<xsl:number value="position() + 1" format="a"/>
												</xsl:when>
												<xsl:otherwise><xsl:number value="position()" format="a"/></xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="Style">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="LineEData" select="$TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateOtherExpensesItem_1040PR">
										<xsl:with-param name="TargetNode" select="."/>
										<xsl:with-param name="Letter">
											<xsl:choose>
												<xsl:when test="(position() &gt; 5) and ($TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt)">
													<xsl:number value="position() + 1" format="a"/>
												</xsl:when>
												<xsl:otherwise><xsl:number value="position()" format="a"/></xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="LineEData" select="$TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
						<xsl:if test="$NumberOfOtherExpenseGrp &lt;5">
							<xsl:call-template name="GenerateEmptyItems_1040PR">
								<xsl:with-param name="Number" select="$NumberOfOtherExpenseGrp + 1"/>
								<xsl:with-param name="MaxCount" select="5"/>
								<xsl:with-param name="LineEData" select="$TargetNode/FarmExpensesGrp/OtherFarmExpensesGrp"/>
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
			<div class="styIRS1040PRLineItem" style="width:187mm;height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">35</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							<b>Total de gastos.</b> Sume las líneas desde la <b>12</b> a la <b>34e</b>, inclusive
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............</span>				
							<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">35</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/TotalExpensesAmt"/>
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
			<div class="styIRS1040PRLineItem" style="width:187mm;height:7mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">36</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							<b>Ganancias (o pérdidas) netas de negocio agropecuario.</b> Reste la línea <b>35</b> de la línea <b>11</b>. Anote el<br/>
							resultado aquí y en la línea <b>1a</b> de la Parte V
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">....................</span>			
							<xsl:if test="$TargetNode">
								<xsl:if test="$TargetNode/FarmExpensesGrp/NetFarmProfitLossAmt/@passiveActivityLossLiteralCd">
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part III, Line 36 - Passive Activity Loss Literal Code (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/NetFarmProfitLossAmt/@passiveActivityLossLiteralCd"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>											
						</div>							
				<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">	
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">height:3mm;border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">height:3mm;border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:auto;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">36</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmExpensesGrp/NetFarmProfitLossAmt"/>
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
		<div class="pageEnd" style="width:187mm;padding-top:.25mm;border-top:2px solid black;">
			<div style="float:right;">
				<span style="width:50px;"/>  
					Formulario 
				<span class="styBoldText" style="font-size:8pt;">1040-PR</span> (2016)
			</div>
		</div>
 		<p style="page-break-before: always"/> 	
		<!-- END Page Break and Footer-->
		<!-- BEGIN Page Header -->
		<div class="styTBB" style="width:187mm;padding-top:.5mm;">
			<div style="float:left;">
				Formulario 1040-PR (2016)
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
			<div class="styPartDesc" style="width:100%;height:7.5mm;padding:.5mm 0mm 0mm 0mm;font-size:8.5pt;text-align:center;">
				Sección C: Ingresos de negocio agropecuario
				<img src="{$ImagePath}/1040PR_Short_Line.gif" alt="Short Line"/>
				Método de contabilidad a base de lo devengado
				<br/>
				<span class="styNormalText">
					No incluya en las líneas a continuación la venta de ganado usados para tiro, cría, entretenimiento o lechería. Vea las instrucciones.
				</span>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<!-- (37) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">37</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Venta de ganado, productos agrícolas, granos y otros productos durante el año
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">37</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/AccrualLvstckProduceSalesAmt"/>
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
			<div class="styIRS1040PRLineItem" style="width:119mm;float:left;height:4mm">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.75mm 0mm 0mm 0mm;">38a</div>
				<div class="styIRS1040PRLNDesc" style="width:auto;">
					<span style="font-family:arial narrow;font-size:8.25pt;">Total de distribuciones de cooperativas <b>(Formulario(s) 1099-PATR)</b></span>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">38a</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/CooperativeDistributionsAmt"/>
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
			<div class="styIRS1040PRLineItem" style="width:68mm;float:left;height:4mm">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">38b</div>
				<div class="styIRS1040PRLNDesc" style="width:auto;padding:.75mm 0mm 0mm .75mm;">
					Cantidad tributable
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">38b</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/CooperativeDistriTxblAmt"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">38b</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!-- (39) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">39</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;">
							Pagos recibidos del programa de agricultura
						  <!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....................</span> 							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">39</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/AgriculturalProgramPymtAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">40</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Préstamos de la <span class="styItalicText">Commodity Credit Corporation</span> declarados bajo elección (o decomisados)
						  <!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:2.5mm;">.....</span>		
						</div>
						<xsl:call-template name="SetFormLinkInline">
							  <xsl:with-param name="TargetNode" select="$Form1040SSPRData/FarmingProfitLoss/FarmIncomeAccrualMethodGrp/CCCLoanReportedElectionAmt"/>
						</xsl:call-template>						
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">40</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/CCCLoanReportedElectionAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">41</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Ingreso de seguro de cosechas
						  <!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........................</span>		
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">41</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/CropInsProcAndDsstrPymtAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">42</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Ingreso de servicios prestados con equipo agrícola
						  <!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...................</span>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">42</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/CustomHireIncomeAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">43</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Otros ingresos de negocio agropecuario (especifique)
						</div>
						<span style="width:.25mm;"/>
						<xsl:if test="$TargetNode">
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III, Line 43 - Other Income Table</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/OtherIncomeGrp"/>
							</xsl:call-template>
						</xsl:if>						
						<span style="width:.25mm;"/>
						<div class="styIRS1040PRLNDesc" style="width:auto;height:4mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
							<span style="width:65.75mm;height:4mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;text-align:center;">
							</span>
						</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">43</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/OtherIncomeTotalAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">44</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;">
							Sume las líneas de la columna derecha desde la <b>37</b> hasta la <b>43</b>, ambas inclusive
						  <!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">44</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/TotalIncomeAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">45</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;font-family:arial narrow;">
							Inventario de ganado, productos agrícolas, granos y otros productos al comienzo del año
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">45</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/InventoryOfProductsAtBOYAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">46</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;;font-family:arial narrow;">
							Costo de ganado, productos agrícolas, granos y otros productos comprados durante el año
					</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">46</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/CostOfProductsPrchsDuringYrAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">47</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
						Sume las líneas <b>45</b> y <b>46</b>
						 <!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..................</span>						
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Height">100%</xsl:with-param>
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">47</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/InvntryAtBOYPlusCostOfPrchsAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">48</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;font-family:arial narrow;">
							Inventario de ganado, productos agrícolas, granos y otros productos al final del año
					</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">48</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/InventoryOfProductsAtEOYAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">49</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;font-family:arial narrow;">
							Costo de ganado, productos agrícolas, granos y otros productos agrícolas vendidos. Reste la línea <b>48</b> de la línea <b>47*</b>
					</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">49</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/CostOfProductsSoldAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.75mm;">50</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;font-family:arial narrow;padding-bottom:0mm;">
							<b>Ingreso bruto agropecuario.</b> Reste la línea <b>49</b> de la línea <b>44</b>. Anote el resultado aquí y en la línea <b>11</b> de la Parte III.
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....</span>              
							<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">50</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$TargetNode/FarmIncomeAccrualMethodGrp/GrossIncomeAmt"/>
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
			<div class="styIRS1040PRLineItem" style="height:10mm;">
				<div class="styIRS1040PRCleanDiv" style="width:100%;padding:.5mm 0mm 0mm 0mm;font-size:7.5pt;">
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
			<div class="styPartName" style="width:14mm;height:4mm;font-size:9pt;padding-top:.25mm">Parte IV</div>
			<div class="styPartDesc" style="padding:.25mm 0mm 0mm 4mm;font-size:8.5pt;">
				Ganancias o pérdidas de negocio (por cuenta propia). <span class="styNormalText">Vea las instrucciones para el Anexo C (Formulario 1040), en inglés.</span>
			</div>
		</div>
		<!-- Body -->
		<div class="styBB" style="width:187mm;">
			<!-- Name and SSN section -->
			<div class="styIRS1040PRLineItem" style="height:8mm;border-bottom-width:1px;border-color:black;">
				<div class="styIRS1040PRLNDesc" style="width:150mm;height:8mm;padding-top:0mm;padding-left:0mm;font-size:7.5pt;">
						Nombre del propietario<br/>
					   <span style="padding:.5mm 0mm 0mm 0mm;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode/ProprietorNm"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
				<div class="styIRS1040PRLNDesc" style="width:37mm;height:8mm;border-left-width:1px;padding-top:0mm;padding-left:1mm;border-color:black;font-size:7.5pt;">
					<b>Número de seguro social</b><br/>
					  <span style="padding:.5mm 0mm 0mm 0mm;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$TargetNode/SSN"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
			</div>
			<!-- Note -->
			<div class="styIRS1040PRLineItem" style="height:7.5mm;">
				<div class="styIRS1040PRLNDesc" style="padding-left:0px;width:100%;">
					<b>Nota:</b> Si radica una planilla conjunta y tanto usted como su cónyuge tuvieron una ganancia o pérdida de un negocio, vea 
					<b>Planillas conjuntas</b> y <b>Negocio que pertenece a un matrimonio</b>, en las instrucciones, para más información.
				</div>
			</div>
		</div>
		<!-- Section A -->
		<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
			<!-- Content -->
			<div class="styPartDesc" style="width:187mm;height:4mm;padding:.5mm 0mm 0mm 0mm;font-size:8.5pt;text-align:center;">
				Sección A
				<span style="width:.25mm;"/>
				<img src="{$ImagePath}/1040PR_Short_Line.gif" alt="Short Line"/>
				<span style="width:.5mm;"/>
				Ingresos
			</div>
		</div>
		<!-- Body -->
		<div class="styBB" style="width:187mm;">
			<!-- (1) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">1</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;font-size:8pt">
							Total de ingresos  $
							<span style="width:22mm;height:2.5mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;text-align:right;font-size:6.5pt;padding-right:.5mm;">
								<xsl:if test="$TargetNode">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$TargetNode/GrossReceiptsOrSalesAmt"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						  <span style="width:1.5mm;"/>
							Menos devoluciones y descuentos $
							<span style="width:22mm;height:2.5mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;text-align:right;font-size:6.5pt;padding-right:.5mm;">
								<xsl:if test="$TargetNode">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$TargetNode/ReturnsAndAllowancesAmt"/>
						  			</xsl:call-template>
								</xsl:if>
							</span>
							<span style="width:.25mm;"/>
							Saldo
							<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
							</div>
						<xsl:if test="$TargetNode and $TargetNode/GrossReceiptsOrSalesAmt/@referenceDocumentName">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$TargetNode/GrossReceiptsOrSalesAmt"/>
							</xsl:call-template>
						</xsl:if>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">2a</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Inventario al comenzar el año
						 <!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">b</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;font-size:8pt;">
							Compras menos el costo de los artículos retirados del negocio para uso personal
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">c</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Costo de mano de obra. No incluya ninguna cantidad pagada a usted mismo
						 <!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">d</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Materiales y suministros
						 <!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..................</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">e</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Otros costos (adjunte una explicación)
						 <!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.............</span>							
						</div>
						<xsl:call-template name="SetFormLinkInline">
						   <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ProfitLossFromBusiness/OtherCostsAmt"/>
						</xsl:call-template>						
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm .5mm 0mm 0mm;">f</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Sume las líneas desde la <b>2a</b> a la <b>2e</b>
						 <!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">g</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Inventario al final del año
						 <!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.................</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">h</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Costo de mercancías vendidas. Reste la línea <b>2g</b> de la línea <b>2f</b>
						 <!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...............</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">3</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							<b>Ganancia bruta.</b> Reste la línea <b>2h</b> de la línea <b>1</b>
							 <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....................</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">4</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Otros ingresos
						 <!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...............................</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">5</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							<b>Ingreso bruto.</b> Sume las líneas <b>3</b> y <b>4</b>
						 <!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......................</span>							
						<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styPartDesc" style="width:187mm;height:4mm;padding:.5mm 0mm 0mm 0mm;font-size:8.5pt;text-align:center;">
				Sección B <img src="{$ImagePath}/1040PR_Short_Line.gif" alt="Short Line"/> Gastos
			</div>
		</div>
		<!-- Body -->
		<div class="styBB" style="width:187mm;border-bottom:0px solid black;">
			<div class="styIRS1040PRCleanDiv" style="width:49.99%;height:100%;border-right-width:1px;">
				<!-- (6) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">6</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Anuncios y publicidad
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....</span> 								
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:7.5mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">7</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Gastos de automóvil o de<br/> camión (vea las instrucciones)
							   <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.</span> 	
							<xsl:call-template name="SetFormLinkInline">
							   <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ProfitLossFromBusiness/CarAndTruckExpensesAmt"/>
							</xsl:call-template>										
							</div>																
					<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">8</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Comisiones y cuotas
							   <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....</span>								
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">9</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Trabajo por contrato
							   <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....</span>								
							</div>
						<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">10</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Agotamiento
							   <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2.5mm;">......</span>								
							</div>
							<xsl:call-template name="SetFormLinkInline">
							   <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ProfitLossFromBusiness/DepletionAmt"/>
							</xsl:call-template>							
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:17mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">11</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Depreciación y deducciones de<br/>
								gastos de acuerdo a la sección <br/>179	(no incluida en la <b>Sección A</b>).<br/>
								(Adjunte el <b>Formulario 4562</b> si<br/>
								está obligado a hacerlo)
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>    
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">height:13mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">height:13mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:choose>
								<xsl:when test="$TargetNode">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">11</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/DeprecAndSect179ExpnsDedAmt"/>
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
				<div class="styIRS1040PRLineItem" style="height:7mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">12</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								<span style="font-family:arial narrow;font-size:8pt;">Programas de beneficios para los empleados<br/>
								(excepto los incluidos en la línea <b>17</b>)
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>    
							</span>							
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">13</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Seguros (excepto de salud)
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>           
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.55mm;">14</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;font-family:arial narrow;font-size:8.5pt;padding-top:0mm;">
								Intereses sobre deudas del negocio
							<span style="width:1.5mm;"/>
							<xsl:call-template name="SetFormLinkInline">
							   <xsl:with-param name="TargetNode" select="$Form1040SSPRData/ProfitLossFromBusiness/InterestOnBusIndebtdnessAmt"/>
							</xsl:call-template>	
							</div>													
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">15</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Servicios legales y profesionales
						   <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.</span>								
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">16</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Gastos de oficina
						   <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>								
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:7.5mm;">
					<div class="styIRS1040PRLNLeftNumBox">17</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;font-size:8pt;">
								Planes de pensión y de participación<br/>
								en las ganancias		
						   <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRCleanDiv" style="width:50%;float:right;padding-left:3mm;">
				<!-- (18) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">18</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Alquiler o arrendamiento:
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- (18a) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">a</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								Vehículos, maquinaria y equipo								
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;flmoat:right;">
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm .25mm;">b</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Otra propiedad comercial
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>								
							</div>
						<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">19</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Reparaciones y manutención
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.</span>								
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-left:.5mm">20</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;font-family:arial narrow;font-size:8pt;">
								Materiales (no incluidos en la <b>Sección A</b>)
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">21</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Contribuciones y licencias
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>								
							</div>
						<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:7mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">22</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Gastos de viaje, comidas y<br/>
								entretenimiento:
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">height:7mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">height:7mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- (22a) ////////////////////////////////////////////////////-->
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">a</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Viajes
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>								
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding:.75mm 0mm 0mm 0mm;">b</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;font-family:arial narrow;font-size:8.5pt;">
								Comidas y entretenimiento deducibles
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:7mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">23</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
								Servicios públicos (agua, gas<br/>
								electricidad, etc.)
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....</span>							
						</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
							<xsl:call-template name="CreateBox_1040PR">
								<xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:4mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">24</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
								Salarios no incluidos en la línea <b>2c</b>								
							</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
				<div class="styIRS1040PRLineItem" style="height:7mm;">
					<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;">25a</div>
					<div class="styIRS1040PRCleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;">
								<span style="">Otros gastos (indique la clase<br/>
							de gasto y la cantidad):</span>
							</div>
						</div>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;float:right;">
							<xsl:call-template name="CreateBox_1040SS">
								<xsl:with-param name="Height">100%</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">height:7mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">height:7mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
				</div> 
				<xsl:choose>
					<xsl:when test="$TargetNode">
						<xsl:variable name="NumberOfOtherBusinessExpensesGrp" select="count($TargetNode/OtherBusinessExpenses)"/>
						<xsl:for-each select="$TargetNode/OtherBusinessExpenses">
							<xsl:choose>
								<xsl:when test="(position() = last()) and ($NumberOfOtherBusinessExpensesGrp &gt;=3)">
									<xsl:call-template name="CreateOtherBusinessExpensesItem_1040PR">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateOtherBusinessExpensesItem_1040PR">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
						<xsl:if test="$NumberOfOtherBusinessExpensesGrp &lt;3">
							<xsl:call-template name="GenerateEmptyOtherBusinessExpensesItems_1040PR">
								<xsl:with-param name="Number" select="$NumberOfOtherBusinessExpensesGrp + 1"/>
								<xsl:with-param name="MaxCount" select="3"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="GenerateEmptyOtherBusinessExpensesItems_1040PR">
							<xsl:with-param name="Number" select="1"/>
							<xsl:with-param name="MaxCount" select="3"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
          </div>
<!-- (25b) ////////////////////////////////////////////////////-->
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
							<div class="styIRS1040PRLNDesc" style="width:auto;padding-bottom:0mm;">
								Total de los demás gastos
							</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">...</span>							
						</div>
						</div>
					</div>
					<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm; float:right;">b</div>
				</div>		
	<!-- (26) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:187mm;height:4mm;border-top:1px solid black;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">26</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							<b>Total de gastos.</b> Sume las líneas desde la <b>6</b> a la <b>25b</b>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..................</span>
							<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>													
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="width:187mm;height:4.5mm;border-bottom:2px solid black;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">27</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							<b>Ganancia (o pérdida) neta.</b> Reste la línea <b>26</b> de la línea <b>5</b>. Anote el resultado aquí y en la línea <b>2</b> de la <span style="font-size:7pt;">Parte V</span>
						</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="Number">27</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">height:4.5mm;border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">height:4.5mm;border-bottom-width:0px;</xsl:with-param>
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
			</div>
			<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
			<!-- Page Break and Footer-->
			<div class="pageEnd" style="width:187mm;padding-top:.25mm;">
				<div style="float:right;">
					<span style="width:50px;"/>  
						Formulario 
					<span class="styBoldText" style="font-size:8pt;">1040-PR</span> (2016)
				</div>
			</div>
			<p style="page-break-before: always"/>		
			<!-- END Page Break and Footer-->
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template: PopulateSelfEmploymentTaxSection_1040PR) -->
	<xsl:template name="PopulateSelfEmploymentTaxSection_1040PR">
		<xsl:param name="TargetNode" select="/.."/>
		<!-- BEGIN Page Header -->
		<div class="styTBB" style="width:187mm;padding-top:.5mm;">
			<div style="float:left;">
				Formulario 1040-PR (2016)
			</div>
			<div style="float:right;">
				Página <span style="font-weight:bold;font-size:8pt;">4</span>
			</div>
		</div>
		<!-- END Page Header -->		
		<!-- Header -->
		<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
			<!-- Content -->
			<div class="styPartName" style="width:14mm;height:4mm;font-size:9pt;">Parte V</div>
			<div class="styPartDesc" style="height:7.5mm;padding-left:4mm;font-size:8.5pt;">
				Contribución sobre el ingreso del trabajo por cuenta propia.  Nota:
				<span class="styNormalText">Si recibió</span> ingresos como empleado<br/>
				<span class="styNormalText"><b>de una iglesia</b>, vea las instrucciones antes de seguir.</span>
			</div>
		</div>
		<!-- Body -->
		<div class="styBB" style="width:187mm;">
			<!-- Name and SSN section -->
			<div class="styIRS1040PRLineItem" style="height:8mm;border-bottom-width:1px;border-color:black;">
				<div class="styIRS1040PRLNDesc" style="width:55%;height:8mm;padding-left:0px;font-size:6pt;">
					Nombre del individuo que recibió <b>ingresos del trabajo por cuenta propia</b><br/>
					<span style="padding-left:0mm;font-size:7.5pt;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode/PersonNm"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
				<div class="styIRS1040PRLNDesc" style="width:25%;height:100%;border-left-width:1px;padding-left:0px;border-color:black;font-size:6pt;">
					<span class="styNormalText" style="width:100%;height:50%;padding-left:1mm;">
						Número de Seguro Social del individuo con<br/><b>ingresos del trabajo por cuenta propia</b>
						<span style="width:.75mm;"/>
						<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
					</span>
				</div>
				<div class="styIRS1040PRLNDesc" style="width:20%;height:100%;border-left-width:1px;padding-left:0px;border-color:black;font-size:7.5pt;">
					<span style="width:100%;height:auto;text-align:center;padding-top:2.25mm;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$TargetNode/SSN"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
			</div>
			<!-- Note -->
			<div class="styIRS1040PRLineItem" style="height:8mm;">
				<div class="styIRS1040PRLNDesc" style="padding-left:0px;width:100%;">
					<b>Nota:</b> Si radica una planilla de contribución conjunta y tanto usted como su cónyuge recibieron ingresos del trabajo por cuenta propia, <b>cada uno</b> de 
					ustedes tiene que completar una Parte V <b>por separado.</b>
				</div>
			</div>
		</div>
		<div class="styBB" style="width:187mm;">
			<!-- (A) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="height:7.5mm">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-left:0px;text-align:left;">A</div>
				<div class="styIRS1040PRLNDesc" style="width:181mm;">
					Si es ministro, miembro de una orden religiosa o practicante de la Ciencia Cristiana <b>y</b> radicó el <b>Formulario 4361</b>, pero obtuvo <b>otras</b><br/>
					ganancias netas de $400 o más del trabajo por cuenta propia, marque este encasillado y continúe con la Parte V
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.......</span>
					<span style="width:.5mm;"/>
					<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
					</div>
					<span style="display:inline;">
					<input type="checkbox" class="styCkbox" style="float:right;margin:0mm 0mm;">
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
				</span>
			</div>
			<!-- (1a) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="height:11mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">1a</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Ganancia (o pérdida) neta de un negocio agropecuario procedente de la línea <b>36</b>, Parte III, más la parte que<br/>
							usted recibió de una sociedad agropecuaria. <b>Nota:</b> No complete las líneas <b>1a</b> y <b>1b</b> si usa el método opcional<br/>
							para calcular la ganancia neta de un negocio agropecuario (vea las instrucciones)
							<!--Dotted Line-->
						   <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">height:7mm;padding:0px 0px 0px 0px;border-bottom-width:0px;border-top-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">height:7mm;padding:0px 0px 0px 0px;border-bottom-width:0px;border-top-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:11mm;" >
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">b</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Si recibió beneficios de jubilación o por incapacidad del seguro social, anote la cantidad incluida en la línea <b>6</b><br/> 
							de la Parte III procedente de pagos del Programa de Reservas para la Conservación de Tierras más su<br/>
							participación distribuible de dichos pagos procedentes de sociedades colectivas agrícolas
						 <!--Dotted Line-->
						 <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">height:7mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">height:7mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:17mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">2</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Ganancia (o pérdida) neta procedente de un negocio no agropecuario, la cantidad de la línea <b>27</b>, Parte IV,<br/>
							más la parte recibida por usted de una sociedad no agropecuaria. Los ministros o miembros	de una orden<br/>
							religiosa deben ver las instrucciones para obtener las cantidades que tienen que declarar en esta línea y para <br/>
							saber qué otros ingresos debe declarar. <b>Nota:</b> No llene esta línea si usa el método opcional para <br/>
							calcular la ganancia neta de un negocio no agropecuario (vea las instrucciones).
							<!--Dotted Line-->
							  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">height:13mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">height:13mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">3</div>
				<div class="styIRS1040PRCleanDiv" style="width:144mm;height:4mm;padding:0px 0px 0px 0px;">
					<div class="styIRS1040PRLNDesc" style="width:auto;padding:0px 0px 0px 0px;">
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Combine las líneas <b>1a, 1b</b> y <b>2</b>
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
								<xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd)">
									<span style="width:11px"/>.
								</xsl:if>
								<xsl:if test="not($TargetNode and $TargetNode/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt)">
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
								<span style="width:11px"/>.
								<span style="width:11px"/>.								
							</span>							
						</div>							
						<div class="styIRS1040PRLNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:.5mm 1mm 0mm 0mm;">
							<xsl:if test="$TargetNode">
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd">
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Self-Employment Tax Exempt Code (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Self-Employment Tax Exempt Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Chap 11 Bankruptcy Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Chap 11 Bankruptcy Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Community Income Taxed To Spouse Code (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Community Income Taxed To Spouse Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Exempt Community Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Exempt Community Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Additional Income Or Loss Code (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part V, Line 3 - Additional Income Or Loss Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$TargetNode/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
						</div>
					</div>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">4a</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;font-family:arial narrow;font-size:8.5pt;">
								Si la línea <b>3</b> es más de cero, multiplique la línea <b>3</b> por el 92.35% (0.9235). De otro modo, anote la cantidad de la línea <b>3</b>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-right:0px;"/>
					<div class="styIRS1040PRLNDesc" style="width:auto;font-family:arial narrow;font-size:8pt;">
							<b>Nota:</b> Si la línea <b>4a</b> es menor de $400 debido a los pagos del Programa del fondo de conservación en la línea <b>1b</b>, vea las instrucciones
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<!-- (4b) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">b</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Si eligió uno (o ambos) de los dos métodos opcionales, anote aquí el total de las líneas <b>2</b> y <b>4</b> de la Parte VI
							<!--Dotted Line-->
							  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:8mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">c</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;font-family:arial narrow;font-size:8.5pt;">
							Combine las líneas <b>4a</b> y <b>4b</b>. Si es menos de $400, <b>deténgase</b>; no adeuda la contribución federal sobre el trabajo por cuenta<br/>
							propia. <b>Excepción:</b> Si es menos de $400 y usted tenía ingresos como empleado de una iglesia, anote -0-	y continúe
						<!--Dotted Line-->
						  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">height:4mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">height:4mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:11mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">5a</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Anote sus <b>ingresos como empleado de una iglesia</b> del (de los) <b>Formulario(s)<br/> 
							499R-2/W-2PR</b> o <b>W-2</b>. Vea las instrucciones para ver la definición de ingresos<br/>
							recibidos por ser empleado de una iglesia
						<!--Dotted Line-->
						 <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............</span>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:3mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:3mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">b</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;">
							Multiplique la línea <b>5a</b> por el 92.35% (0.9235). Si es menos de $100, anote -0-
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">6</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;">
							Sume las líneas <b>4c</b> y <b>5b</b>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">...........................</span>							
						<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">7</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;font-family:arial narrow;font-size:8.25pt;">
							Cantidad máxima de salarios e ingreso del trabajo por cuenta propia combinados sujeta a la contribución al seguro social para 2016
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Number">7</xsl:with-param>
							<xsl:with-param name="StaticText">118,500.00</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<!-- (8a) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="height:10.5mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">8a</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;">
							Total de salarios y propinas sujetos a la contribución al seguro social, según<br/> 
							aparecen en el (los) <b>Formulario(s) 499R-2/W-2PR</b> o <b>W-2.</b> Si es $118,500 o más,<br/>
							no complete las líneas desde la <b>8b</b> hasta la <b>10</b> y continúe en la línea <b>11</b>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:3mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:3mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:3mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:7.5mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">b</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;">
							Propinas que no declaró a su patrono y que están sujetas a la contribución al<br/> 
							seguro social de la línea <b>10</b> del <b>Formulario 4137</b> (vea las instrucciones)
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:7.5mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">c</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;">
							Salarios sujetos a la contribución al seguro social de la línea <b>10</b> del <b>Formulario<br/>
							8919</b> (vea las instrucciones)
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.................</span>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">d</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;padding-bottom:0mm;">
							Sume las líneas <b>8a, 8b</b> y <b>8c</b>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...........................</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:choose>
							<xsl:when test="$TargetNode">
								<xsl:call-template name="CreateBox_1040PR">
									<xsl:with-param name="NumberBoxStyle">padding:.75mm 0mm 0mm 0mm;</xsl:with-param>
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">9</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;font-size:7.9pt;">
								Reste la línea <b>8d</b> de la línea <b>7</b>. Si es cero o menos, anote -0- aquí y también en la línea <b>10</b> y pase a la línea <b>11</b>
								<span style="width:.5mm;"/>
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Small Bullet"/>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">10</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;">
							Multiplique por el 12.4% (0.124) la cantidad que sea <b>menor</b> entre la línea <b>6</b> o la línea <b>9</b>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">11</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;">
							Multiplique por el 2.9% (0.029) la cantidad de la línea <b>6</b>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..................</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="height:7.5mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">12</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							<b>Contribución sobre el trabajo por cuenta propia.</b> Sume las líneas <b>10</b> y <b>11</b>. Anote el resultado aquí y en la<br/>
							 línea <b>3</b> de la Parte I
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.............................</span>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:37mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styPartName" style="width:14mm;height:4mm;font-size:9pt;padding-top:.25mm;">Parte VI</div>
			<div class="styPartDesc" style="padding:.5mm 0mm 0mm 4mm;font-size:8.5pt;">
				Métodos opcionales para calcular la ganancia neta. 
				<span class="styNormalText">Vea las instrucciones para las limitaciones.</span>
			</div>
		</div>
		<!-- Body -->
		<div class="styBB" style="width:187mm;">
			<!-- Note -->
			<div class="styIRS1040PRLineItem" style="height:7.5mm;">
				<div class="styIRS1040PRLNDesc" style="padding-left:0px;width:100%;">
					<b>Nota:</b><span style="width:1mm;"/>Si radica una planilla conjunta y tanto usted como su cónyuge eligen usar un método opcional para calcular sus ganancias netas, <b>cada uno</b> de 
					ustedes tiene que completar y adjuntar una Parte VI <b>por separado</b>.
				</div>
			</div>
		</div>
			<!-- (**) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:187mm;">
				<div class="styIRS1040PRLNLeftNumBox"/>
				<div class="styIRS1040PRLNDesc" style="width:144mm;height:4mm;">
					<b>Método opcional<span style="width:.5mm"/><img src="{$ImagePath}/1040PR_Short_Line.gif" alt="Small Bullet"/><span style="width:.25mm;"/>Negocio agropecuario</b>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<!-- (1) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:187mm;height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top.5mm;">1</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;">
							Ingreso máximo para los efectos de los métodos opcionales
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="Number">1</xsl:with-param>
							<xsl:with-param name="StaticText">5,040.00</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<!-- (2) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:187mm;height:11mm;border-bottom:1px solid black;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">2</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;">
							Anote <b>la cantidad menor entre</b>: dos tercios (2/3) del ingreso bruto del negocio agropecuario (la línea <b>11</b> de la<br/>
							Parte III, más la parte recibida por usted de una sociedad agropecuaria) pero no menos de cero; <b>o</b> $5,040.<br/>
							Incluya esta cantidad en la línea <b>4b</b> de la Parte V, anteriormente
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...............</span>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">height:7mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">height:7mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="width:187mm; height:4mm;">
				<div class="styIRS1040PRLNLeftNumBox"/>
				<div class="styIRS1040PRLNDesc" style="width:144mm;">
					<b>Método opcional<span style="width:.75mm;"/><img src="{$ImagePath}/1040PR_Short_Line.gif" alt="Small Bullet"/><span style="width:.9mm;"/>Negocio no agropecuario</b>
				</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<!-- (3) ////////////////////////////////////////////////////-->
			<div class="styIRS1040PRLineItem" style="width:187mm;height::4mm;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">3</div>
					<div class="styIRS1040PRLNDesc" style="width:auto;">
							Reste la línea <b>2</b> de la línea <b>1</b>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........................</span>							
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<div class="styIRS1040PRLineItem" style="width:187mm;height:14mm;border-bottom:2px solid black;">
				<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">4</div>
						<div class="styIRS1040PRLNDesc" style="width:auto;">
							Anote <b>la cantidad menor entre</b>: dos tercios (2/3) del ingreso bruto del negocio no agropecuario (la línea <b>5</b> de la<br/>
							Parte IV, más la parte recibida por usted de una sociedad colectiva no agropecuaria) pero no menos de cero; <b>o</b> <br/>
							la cantidad que aparece en la línea <b>3</b> de la Parte VI, anteriormente. Incluya también esta cantidad en la línea <b>4b</b><br/>
							de la Parte V, anteriormente
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........................</span>
						</div>
				<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
					<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
						<xsl:call-template name="CreateBox_1040PR">
							<xsl:with-param name="AmountBoxStyle">height:10mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
							<xsl:with-param name="NumberBoxStyle">height:10mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
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
			<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
			<!-- Page Break and Footer-->
			<div class="pageEnd" style="width:187mm;padding-top:.25mm;">
				<div style="float:right;">
					<span style="width:50px;"/>  
						Formulario 
					<span class="styBoldText" style="font-size:8pt;">1040-PR</span> (2016)
				</div>
			</div>
			<p style="page-break-before: always"/>			
	</xsl:template>
</xsl:stylesheet>