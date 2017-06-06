<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8858Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="Form8858Data" select="$RtnDoc/IRS8858"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8858Data)"/>
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
        <meta name="Description" content="IRS Form 8858"/>
        <xsl:call-template name="InitJS"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <style type="text/css">
          <!--HINTS - This form contains separated print format -->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8858Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form8858">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Number and Name -->
          <div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:22mm;">
              <div style="height:4mm;">
                Form<span class="styFormNumber">  8858</span>
              </div>
              <div style="height:2mm;font-size:7pt;font-family:arial;">
          	   (Rev. December 2008)
          	   <br/>
                <span style="width:3px;"/>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form8858Data"/>
                </xsl:call-template>
                <span style="width:3px;"/>
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Form 8858, Top Left Margin - Summary Dormant FDE Indicator</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form8858Data/@summaryDormantFDEIndicator"/>
                </xsl:call-template>
              </div>
              <div style="padding-top:1.3mm;">
                <span class="styAgency">Department of the Treasury </span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:124mm;height:22mm;">
              <div class="styMainTitle">Information Return of U.S. Persons With<br/>Respect To Foreign Disregarded Entities</div>
              <div class="styFBT" style="padding-top:1mm;">
                <img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="Bullet"/>
                See separate instructions.            
              </div>
              <span style="padding-left:3.5mm;float:left;">Information furnished for the foreign disregarded entity’s annual accounting period (see </span>
              <div style="height:2mm;padding-left:3.5mm;float:left;">
                instructions) beginning 
              <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/FrgnDisrgrdEntAnnualAcctPeriod/BeginningDate"/>
                </xsl:call-template>
              , and ending         
              <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/FrgnDisrgrdEntAnnualAcctPeriod/EndingDate"/>
                </xsl:call-template>
              </div>
            </div>
            <div class="styTYBox" style="width:31mm;height:22mm;">
              <div class="styOMB" style="height:5mm;padding-bottom:1.5mm;padding-top:1mm;padding-left:1mm;">OMB No. 1545-1910</div>
              <!--<div class="styTY" style="height:7.5mm;font-size:24pt;">
                 20<span class="styTYColor">08</span>
              </div>-->
              <span style="height:9.5mm;"/>
              <div class="stySequence" style="height:2mm;padding-bottom:.5mm;">Attachment<br/>Sequence No. <span style="font-size:8pt;font-weight:bold;">140</span>
              </div>
            </div>
          </div>
          <!-- End Form Header -->
          <!-- Begin Filer Info -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:140mm;height:7mm;font-size:7pt;">
              Name of person filing this return<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8858Data/FilerName/BusinessNameLine1"/>
              </xsl:call-template>
              <xsl:if test="$Form8858Data/FilerName/BusinessNameLine2">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/FilerName/BusinessNameLine2"/>
                </xsl:call-template>
              </xsl:if>
            </div>
            <div style="width:45mm;height: 7mm;padding-left:2mm;font-size:7pt; font-weight: normal;" class="styEINBox">
              <span class="styBoldText">Filer’s identifying number</span>
              <br/>
              <br/>
              <xsl:choose>
                <xsl:when test="$Form8858Data/FilerIdentifyingNumber">
                  <xsl:call-template name="PopulateSSN">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/FilerIdentifyingNumber"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="$Form8858Data/MissingEINReason">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/MissingEINReason"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/FilerIdentifyingNumberEIN"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:8mm;font-size:7pt;">
              Number, street, and room or suite no. (or P.O. box number if mail is not delivered to street address)  
              <br/>
              <xsl:choose>
                <xsl:when test="$Form8858Data/FilerUSAddress">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/FilerUSAddress/AddressLine1"/>
                  </xsl:call-template>
                  <xsl:if test="$Form8858Data/FilerUSAddress/AddressLine2">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/FilerUSAddress/AddressLine2"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/FilerForeignAddress/AddressLine1"/>
                  </xsl:call-template>
                  <xsl:if test="$Form8858Data/FilerForeignAddress/AddressLine2">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/FilerForeignAddress/AddressLine2"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:8mm;font-size:7pt;">
          City or town, state, and ZIP code
              <br/>
              <xsl:choose>
                <xsl:when test="$Form8858Data/FilerUSAddress">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/FilerUSAddress/City"/>
                  </xsl:call-template>,
              <span style="width:4px;"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/FilerUSAddress/State"/>
                  </xsl:call-template>,
              <span style="width:4px;"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/FilerUSAddress/ZIPCode"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/FilerForeignAddress/City"/>
                  </xsl:call-template>,
              <span style="width:.5mm;"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/FilerForeignAddress/ProvinceOrState"/>
                  </xsl:call-template>,
                <span style="width:4px;"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/FilerForeignAddress/Country"/>
                  </xsl:call-template>
                  <span style="width:4px;"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/FilerForeignAddress/PostalCode"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <div class="styBB" style="width:187mm;height:4mm;">
            <div style="text-align:left;height:4mm;">
              Filer’s tax year beginning
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8858Data/FilerTaxYear/BeginningDate"/>
              </xsl:call-template>
              , and ending         
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8858Data/FilerTaxYear/EndingDate"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- End Filer Info -->
          <!-- Begin form contents -->
          <div class="styBB" style="width:187mm;height:8mm;font-size:8pt;">
            <span class="styBoldText" style="height: 8mm; width: 22mm;">Important: </span>
            <span class="styItalicText" style="height: 8mm; width: 160mm;">Fill in all applicable lines and schedules. All information <span class="styBoldText">must</span> be in English. All amounts <span class="styBoldText">must</span> be stated in U.S. dollars unless otherwise indicated.</span>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;">1a</div>
            <!-- Box 1a -->
            <div class="styNameBox" style="width:134mm;height:9.5mm;font-size:7pt;">
              Name and address of foreign disregarded entity<br/>
              <div style="font-family:verdana;font-size:6pt;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/ForeignDisrgrdEntityName/BusinessNameLine1"/>
                </xsl:call-template>
                <xsl:if test="$Form8858Data/ForeignDisrgrdEntityName/BusinessNameLine2 !=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/ForeignDisrgrdEntityName/BusinessNameLine2"/>
                  </xsl:call-template>
                  <br/>
                </xsl:if>
                <xsl:call-template name="PopulateForeignAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/ForeignDisrgrdEntityAddress"/>
                </xsl:call-template>
              </div>
            </div>
            <div style="width:45mm;height:8mm;float:left;">
              <div class="styLNLeftNumBox" style="width:4mm;padding-top:0mm;">b</div>
              <!-- Box 1b -->
              U.S. identifying number, if any <br/>
              <div style="padding-top:2mm">
                <xsl:choose>
                  <xsl:when test="$Form8858Data/ForeignDisrgrdEntityUSIdNumber/SSN">
                    <xsl:call-template name="PopulateSSN">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/ForeignDisrgrdEntityUSIdNumber/SSN"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="$Form8858Data/ForeignDisrgrdEntityUSIdNumber/EINMissingReason">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/ForeignDisrgrdEntityUSIdNumber/EINMissingReason"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/ForeignDisrgrdEntityUSIdNumber/EIN"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </div>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styGenericDiv" style="width:142mm;">
              <table class="styIRS8858CDTable" cellspacing="0" name="TYTable" id="TYTable">
                <thead>
                  <tr style="height:4mm;">
                    <th class="styTableCellHeader" style="width:102mm;border-color:black;border-bottom:1 solid 0px;text-align:left;vertical-align:top;padding-left:1mm;font-weight:normal;font-size:6pt;" scope="col">
                      <span style="font-weight:bold;font-size:7pt;padding-left:2mm;">c</span>
                      <span style="width:10px;"/>Country(ies) under whose laws organized and entity type under local tax law
                  </th>
                    <th class="styTableCellHeader" style="width:39mm;border-color:black;border-bottom:1 solid 0px;font-weight:normal;text-align:left;vertical-align:top;font-size:7pt;" scope="col">
                      <span style="font-weight:bold;padding-left:1mm;">d</span>
                      <span style="width:10px;"/>Date(s) of organization
                </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!-- Display all rows of Line 1c/1d if the print option is not "separated" -->
                  <!-- If the print option is "separated", but there is only one row, display the row -->
                  <xsl:if test="($Print != $Separated) or (count($Form8858Data/CountryEntityTypeDate) = 1)">
                    <xsl:for-each select="$Form8858Data/CountryEntityTypeDate">
                      <tr style="height:7mm;">
                        <td class="styTableCell" style="width:102mm;vertical-align:top;text-align:left;border-color:black;font-size:7pt;padding-left:7mm;">
                          <xsl:if test="position() = last()">
                            <xsl:attribute name="style">width:102mm;vertical-align:top;text-align:left;border-color:black;font-size:7pt;border-bottom-width:0px;padding-left:7mm;</xsl:attribute>
                          </xsl:if>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CountryOrganized"/>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="TypeOfEntity"/>
                          </xsl:call-template>
                        </td>
                        <td class="styTableCell" style="width:36mm;text-align:left;border-color:black;vertical-align:top;font-size:7pt;padding-left:5mm;">
                          <xsl:if test="position() = last()">
                            <xsl:attribute name="style">width:36mm;text-align:left;border-color:black;vertical-align:top;font-size:7pt;border-bottom-width:0px;padding-left:5mm;</xsl:attribute>
                          </xsl:if>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="DateOfOrganization"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </xsl:if>
                  <!-- Display the data container only if there is no data for Lines 1c/1d. -->
                  <!-- If the print parameter is "separated" and there is more than one row of data, then display a -->
                  <!-- message directing the user to the additional data table -->
                  <xsl:if test="not($Form8858Data/CountryEntityTypeDate) or 
                      (($Print = $Separated) and (count($Form8858Data/CountryEntityTypeDate) &gt; 1))">
                    <tr style="height:6mm;">
                      <td class="styTableCell" style="width:102mm;vertical-align:top;text-align:left;border-color:black;font-size:7pt;border-bottom-width:0px;padding-left:7mm;">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form8858Data/CountryEntityTypeDate"/>
                        </xsl:call-template>
                        <br/>
                      </td>
                      <td class="styTableCell" style="width:36mm;text-align:left;border-color:black;vertical-align:top;font-size:7pt;border-bottom-width:0px;padding-left:5mm;">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form8858Data/CountryEntityTypeDate"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                </tbody>
              </table>
            </div>
            <div style="width:42mm;" class="styGenericDiv">
              <div class="styLNLeftNumBox" style="height:6.75mm;width:4mm;padding-top:0mm;">e</div> 
            Effective date as foreign<br/>disregarded entity<br/>
              <span style="width:39mm;padding-left:5mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/ForeignDisrgrdEntEffectiveDate"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm; font-size: 7pt;padding-top:0mm;">
              <span style="width: 1.5mm;"/>f</div>
            <!-- Box 1f -->
            <div class="styNameBox" style="width:55mm;height:13mm;font-size:6pt; border-right: 1px solid black;">
              If benefits under a U.S. tax treaty were claimed with respect to income of the foreign disregarded entity, enter the treaty and article number<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8858Data/TreatyAndArticleNumber"/>
              </xsl:call-template>
            </div>
            <div style="width:39.2mm;height:13mm;float:left; font-size: 6pt; border-right: 1px solid black;">
              <div class="styLNLeftNumBox" style="height:6.75mm;width:4mm; font-size: 7pt;padding-top:0mm;">g</div>
              <!-- Box 1g -->
              Country in which principal business activity is conducted<br/>
              <div style="padding-top:4mm">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/CountryOfPrinBusinessActivity"/>
                </xsl:call-template>
              </div>
            </div>
            <div style="width:39.7mm;height:13mm;float:left; border-right: 1px solid black; font-size: 6pt;">
              <div class="styLNLeftNumBox" style="height:6.75mm;width:4mm;font-size:7pt;padding-top:0mm;">h</div>
              <!-- Box 1h -->
                Principal business activity<br/>
              <span style="width:34mm; float: right;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/PrincipleBusinessActivity"/>
                  <!-- ELEMENT IS MISSPELLED IN SCHEMA -->
                </xsl:call-template>
              </span>
            </div>
            <div style="width:44mm;height:8mm;float:left;">
              <div class="styLNLeftNumBox" style="height:6.75mmmm;width:4mm;padding-top:0mm;">i</div>
              <!-- Box 1i -->
                Functional currency<br/>
              <div style="padding-top:6mm">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/ForeignDisrgrdEntFuncCurrency"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styGenericDiv" style="width:160mm;">
              <span class="styBoldText">2</span>
              <span style="width: 3mm;"/>
              <!-- Line 2 -->
            Provide the following information for the foreign disregarded entity’s accounting period stated above.
            </div>
            <div style="float:right;">
              <!-- Tanuja  no need for dynamictoggle button as this needs to be controlled by height-->
              <xsl:call-template name="SetTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords"/>
                <xsl:with-param name="containerHeight" select="1"/>
                <!--xsl:with-param name="headerHeight" select="1"/-->
                <xsl:with-param name="containerID" select=" 'TPctn' "/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Adding parent div to the elements a and b of line 2.  If not when the height of the line e is less than the c and d, then this table will appear next to the line e -->
          <div class="styBB" style="width:187mm;float:none;clear:both;">
            <div class="styBB" style="width:93mm;height:35.5mm;border-bottom:0px solid black;">
              <div class="styLNLeftNumBox" style="height:4.5mm;  font-size: 7pt;padding-top:0mm;">a</div>
              <!-- Box 2a -->
              <div class="styGenericDiv" style="width:85mmfont-size:7pt; ">
              Name, address, and identifying number of branch office or agent (if any) in the United States
         <!--<br/> -->
                <!-- 2a - Name -->
                <div style="font-family:verdana;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/BranchOfficeOrAgentUSName/BusinessNameLine1"/>
                  </xsl:call-template>
                  <xsl:if test="$Form8858Data/BranchOfficeOrAgentUSName/BusinessNameLine2 !=''">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/BranchOfficeOrAgentUSName/BusinessNameLine2"/>
                    </xsl:call-template>
                  </xsl:if>
                </div>
                <!-- 2a - Address -->
                <!--<br />-->
                <xsl:call-template name="PopulateUSAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/BranchOfficeOrAgentUSAddress"/>
                </xsl:call-template>
                <!-- 2a - Identifying number -->
                <br/>
                <xsl:choose>
                  <xsl:when test="$Form8858Data/BranchOfficeOrAgentUSIdNumber/SSN">
                    <xsl:call-template name="PopulateSSN">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/BranchOfficeOrAgentUSIdNumber/SSN"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="$Form8858Data/BranchOfficeOrAgentUSIdNumber/EINMissingReason">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/BranchOfficeOrAgentUSIdNumber/EINMissingReason"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/BranchOfficeOrAgentUSIdNumber/EIN"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </div>
            </div>
            <!-- Box 2b -->
            <div id="TPctn" style="height:49mm;" class="styIRS8858Ln2bTable">
              <xsl:call-template name="SetInitialState"/>
              <table class="styTable" cellspacing="0" name="TYTable" id="TYTable">
                <thead>
                  <tr>
                    <th class="styTableCellHeader" style="width:8mm;border-color:black;border-color:black;border:none;text-align:left;vertical-align:top;padding-left:1mm;font-size:7pt;padding-top:0mm;" scope="col">
                  b
                </th>
                    <th class="styTableCellHeader" style="width:86mm;border-color:black;border:none;font-weight:normal;text-align:left;vertical-align:top;font-size:7pt;" scope="col">
                  Name and address (including corporate department, if applicable) of person(s) with custody of the books and records of the foreign disregarded entity, and the location of such books and records, if different
                </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!-- Display all rows of Line 2b if the print option is not "separated" -->
                  <!-- If the print option is "separated", but there is only one row, display the row -->
                  <xsl:if test="($Print != $Separated) or (count($Form8858Data/BooksAndRecords) = 1)">
                    <xsl:for-each select="$Form8858Data/BooksAndRecords">
                      <tr>
                        <td class="styTableCell" style="width:8mm;vertical-align:top;text-align:left;border-color:black;border:none;">
                          <span style="width:4px;"/>
                        </td>
                        <td class="styTableCell" style="width:86mm;text-align:left;border-color:black;vertical-align:top;border:none;font-size:7pt;">
                          <span style="font-family:verdana;">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CustodianName/BusinessNameLine1"/>
                            </xsl:call-template>
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CustodianName/BusinessNameLine2"/>
                            </xsl:call-template>
                          </span>
                          <br/>
                        CustodianAddress:<br/>
                          <xsl:choose>
                            <xsl:when test="CustodianUSAddress">
                              <xsl:call-template name="PopulateUSAddressTemplate">
                                <xsl:with-param name="TargetNode" select="CustodianUSAddress"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:call-template name="PopulateForeignAddressTemplate">
                                <xsl:with-param name="TargetNode" select="CustodianForeignAddress"/>
                              </xsl:call-template>
                            </xsl:otherwise>
                          </xsl:choose>
                          <br/>
                        Location:<br/>
                          <xsl:choose>
                            <xsl:when test="USLocation">
                              <xsl:call-template name="PopulateUSAddressTemplate">
                                <xsl:with-param name="TargetNode" select="USLocation"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:call-template name="PopulateForeignAddressTemplate">
                                <xsl:with-param name="TargetNode" select="ForeignLocation"/>
                              </xsl:call-template>
                            </xsl:otherwise>
                          </xsl:choose>
                          <br/>
                          <br/>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </xsl:if>
                  <!-- Display the data container only if there is no data for Line 2b. -->
                  <!-- If the print parameter is "separated" and there is more than one row of data, then display a -->
                  <!-- message directing the user to the additional data table -->
                  <xsl:if test="not($Form8858Data/BooksAndRecords) or 
                      (($Print = $Separated) and (count($Form8858Data/BooksAndRecords) &gt; 1))">
                    <tr>
                      <td class="styTableCell" style="width:8mm;vertical-align:top;text-align:left;border-color:black;border:none;">
                        <span style="width:4px;"/>
                      </td>
                      <td class="styTableCell" style="width:86mm;text-align:left;border-color:black;vertical-align:top;border:none;font-size:7pt;">
                        <br/>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords"/>
                        </xsl:call-template>
                        <span style="width:4px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                </tbody>
              </table>
            </div>
          </div>
          <div style="float: left; clear:none; width: 187mm">
            <table class="styTable" style="font-size: 7pt" cellspacing="0">
              <thead/>
              <tbody>
                <tr style="border-color: black">
                  <td class="styTableCell" style="width: 187mm; text-align: left; border-right-width: 0px; border-bottom-width:0px" colspan="3">
                    <span class="styBoldText">3</span>
                    <span style="width: 3mm;"/>
                    <!-- Line 3 -->
                For the <span class="styBoldText">tax owner</span> of the foreign disregarded entity (if different from the filer) provide the following:
        </td>
                </tr>
                <tr>
                  <td class="styTableCell" style="width: 93mm;border-color:black; text-align: left; border-top-width: 1px; height:20mm; vertical-align:top;" rowspan="2">
                    <span class="styLNLeftNumBox" style="padding-top:0mm;width:4.5mm;height:100%;">a</span>
                    <!-- Box 3a -->
              Name and address<br/>
                    <!-- 3a - Name -->
                    <span style="font-family:verdana;font-size:6pt;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerName/BusinessNameLine1"/>
                      </xsl:call-template>
                      <xsl:if test="$Form8858Data/TaxOwnerName/BusinessNameLine2 !=''">
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerName/BusinessNameLine2"/>
                        </xsl:call-template>
                      </xsl:if>
                      <!-- 3a - Address -->
                      <!-- USA Adress -->
                      <br/>
                      <xsl:if test="$Form8858Data/TaxOwnerUSAddress !=''">
                        <xsl:call-template name="PopulateUSAddressTemplate">
                          <xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerUSAddress"/>
                        </xsl:call-template>
                      </xsl:if>
                      <!-- Foreign Address 3a -->
                      <xsl:if test="$Form8858Data/TaxOwnerForeignAddress!=''">
                        <xsl:call-template name="PopulateForeignAddressTemplate">
                          <xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerForeignAddress"/>
                        </xsl:call-template>
                      </xsl:if>
                    </span>
                  </td>
                  <td class="styNameBox" style="width:47mm;font-size:7pt; border-top-width: 1px; border-bottom-width: 1px">
                    <span class="styBoldText" style="padding-left:1mm;padding-right: 1.8mm">b</span>
                    <!-- Box 3b -->
                    <span style="font-size:6pt;">
	                  Annual accounting period covered by<br/>
                      <span style="width:5mm;"/>the return (see instructions)
                  </span>
                    <br/>
                    <span style="width: 5mm"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerTaxYear/BeginningDate"/>
                    </xsl:call-template>
                  to<br/>
                    <span style="width: 5mm"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerTaxYear/EndingDate"/>
                    </xsl:call-template>
                  </td>
                  <td class="styNameBox" valign="top" style="width:47mm;font-size: 7pt;border-top-width: 1px; border-bottom-width: 1px; border-right-width:  0px">
                    <span class="styBoldText" style="padding-left:1mm;padding-right: 1.8mm">c</span>
                    <!-- Box 3c -->
                  U.S. identifying number, if any<br/>
                    <br/>
                    <span style="width: 5mm"/>
                    <xsl:choose>
                      <xsl:when test="$Form8858Data/TaxOwnerUSIdNumber/SSN">
                        <xsl:call-template name="PopulateSSN">
                          <xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerUSIdNumber/SSN"/>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:when test="$Form8858Data/TaxOwnerUSIdNumber/EINMissingReason">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerUSIdNumber/EINMissingReason"/>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerUSIdNumber/EIN"/>
                        </xsl:call-template>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
                <tr>
                  <td valign="top" class="styNameBox" style="width:47mm;height:10mm;font-size:7pt; border-bottom-width: 1px">
                    <span class="styBoldText" style="padding-left:1mm;padding-right: 1.8mm">d</span>
                    <!-- Box 3d -->
                  Country under whose laws<br/>
                    <span style="width: 5mm"/>organized<br/>
                    <span style="width: 5mm"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerCountryOrganized"/>
                    </xsl:call-template>
                  </td>
                  <td valign="top" class="styNameBox" style="width:47mm;height:10mm;font-size:7pt; border-right: 0px;border-bottom-width: 1px">
                    <span class="styBoldText" style="padding-left:1mm;padding-right: 1.8mm">e</span>
                    <!-- Box 3e -->
                  Functional currency<br/>
                    <br/>
                    <span style="width: 5mm"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerFunctionalCurrency"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- ********************************************************************* -->
          <div class="styBB" style="width:187mm;">
            <div class="styGenericDiv" style="width:160mm;">
              <span class="styBoldText">4</span>
              <span style="width: 3mm;"/>
              <!-- Line 4 -->
            			For the <span class="styBoldText">direct owner</span> of the foreign disregarded entity (if different from the tax owner) provide the following:
             </div>
            <!--Line 4  Toggle Button set begin -->
            <xsl:if test="count($Form8858Data/DirectOwner) > 1">
              <div style="float:right;">
                <xsl:call-template name="SetTableToggleButton">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner"/>
                  <xsl:with-param name="containerHeight" select="1"/>
                  <!--       <xsl:with-param name="header-height" select="0"/>    -->
                  <xsl:with-param name="containerID" select="'DOctn'"/>
                </xsl:call-template>
              </div>
            </xsl:if>
          </div>
          <xsl:if test="($Print != $Separated) and (count($Form8858Data/DirectOwner) &gt;0) or ($Print = $Separated) and (count($Form8858Data/DirectOwner) =1)">
            <div class="styTableContainer" id="DOctn" style="height:26mm;">
              <xsl:call-template name="SetInitialState"/>
              <!-- Display all rows of Line 4 if the print option is not "separated" -->
              <!-- If the print option is  "separated", but there is one row, display the row, including if the data field is empty -->
              <table class="styTable" style="font-size: 7pt" cellspacing="0">
                <thead/>
                <tbody>
                  <xsl:for-each select="$Form8858Data/DirectOwner">
                    <!-- Line 4 -->
                    <tr>
                      <td class="styTableCell" style="width: 93mm;border-color:black; text-align: left; border-top-width: 0px; height:32mm; vertical-align:top;" rowspan="2">
                        <span class="styLNLeftNumBox" style="padding-top:0mm;width:4.5mm;height:100%;">a</span>
                        <!-- Box 4a -->
                        Name and address<br/>
                        <!-- 4a - Name -->
                        <span style="font-family:verdana;font-size:6pt;">
                          <xsl:if test="DirectOwnerName/BusinessNameLine1 !=''">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="DirectOwnerName/BusinessNameLine1"/>
                            </xsl:call-template>
                          </xsl:if>
                          <xsl:if test="DirectOwnerName/BusinessNameLine2 !=''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="DirectOwnerName/BusinessNameLine2"/>
                            </xsl:call-template>
                          </xsl:if>
                          <!-- 4a - Address -->
                          <!-- USA Adress -->
                          <br/>
                          <xsl:if test="DirectOwnerUSAddress">
                            <xsl:call-template name="PopulateUSAddressTemplate">
                              <xsl:with-param name="TargetNode" select="DirectOwnerUSAddress"/>
                            </xsl:call-template>
                          </xsl:if>
                          <!-- Foreign Address 4a -->
                          <xsl:if test="DirectOwnerForeignAddress">
                            <xsl:call-template name="PopulateForeignAddressTemplate">
                              <xsl:with-param name="TargetNode" select="DirectOwnerForeignAddress"/>
                            </xsl:call-template>
                          </xsl:if>
                        </span>
                      </td>
                      <!-- Box 4b -->
                      <td class="styNameBox" style="width:47mm;font-size:7pt; border-top-width: 0px; border-bottom-width: 1px;" rowspan="2">
                        <span class="styLNLeftNumBox" style="padding-top:0mm;width:4.5mm;height:100%;">b</span>
	                  Country under whose laws<br/> organized<br/>
                        <span style="width:5mm;"/>
                        <br/>
                        <span style="width: 5mm"/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="DirectOwnerCountryOrganized"/>
                        </xsl:call-template>
                      </td>
                      <td class="styNameBox" valign="top" style="width:41mm;height:13mm;font-size: 7pt;border-top-width: 0px; border-bottom-width: 1px; border-right-width:  0px;">
                        <span class="styBoldText" style="padding-left:1mm;padding-right: 1.8mm">c</span>
                        <!-- Box 4c -->
                  U.S. identifying number, if <br/>
                        <span style="width: 5mm"/> any
										<br/>
                        <br/>
                        <span style="width: 5mm;"/>
                        <xsl:choose>
                          <xsl:when test="DirectOwnerUSIdNumber/SSN">
                            <xsl:call-template name="PopulateSSN">
                              <xsl:with-param name="TargetNode" select="DirectOwnerUSIdNumber/SSN"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:when test="DirectOwnerUSIdNumber/EINMissingReason">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="DirectOwnerUSIdNumber/EINMissingReason"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="DirectOwnerUSIdNumber/EIN"/>
                            </xsl:call-template>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <tr>
                      <td valign="top" class="styNameBox" style="width:41mm;height:13mm;font-size:7pt; border-right: 0px;border-bottom-width: 1px">
                        <span class="styBoldText" style="padding-left:1mm;padding-right: 1.8mm">d</span>
                        <!-- Box 4d -->
                 Functional currency<br/>
                        <br/>
                        <span style="width: 5mm"/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="DirectOwnerFunctionalCurrency"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- Line 4 Toggle Button End -->
          <!--
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner"/>
           <xsl:with-param name="containerHeight" select="1"/>
            <xsl:with-param name="header-height" select="0"/>
            <xsl:with-param name="containerID" select="DOctn"/>
          </xsl:call-template>
-->
          <!-- *************************************************************************************************************-->
          <!-- If the print parameter is "separated" and there is more than one row of data, then display a -->
          <!-- message directing the user to the additional data table.  If there is no Direct Owner data print an empty
          table -->
          <xsl:if test="not($Form8858Data/DirectOwner) or 
					($Print = $Separated) and (count($Form8858Data/DirectOwner) &gt; 1)">
            <div style="float: left; clear:none; width: 187mm">
              <table class="styTable" style="font-size: 7pt" cellspacing="0">
                <thead/>
                <tbody>
                  <!-- Line 4 -->
                  <tr>
                    <td class="styTableCell" style="width: 93mm;border-color:black; text-align: left; border-top-width: 0px; height:20mm; vertical-align:top;" rowspan="2">
                      <span class="styLNLeftNumBox" style="padding-top:0mm;width:4.5mm;height:100%;">a</span>
                      <!-- Box 4a -->
              Name and address<br/>
                      <br/>
                      <!-- 4a - Name -->
                      <span style="font-family:verdana;font-size:7pt;">
                        <xsl:if test="$Form8858Data/DirectOwner !=''">
                          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerName"/>
                          </xsl:call-template>
                        </xsl:if>
                        <!-- 4a - Address -->
                        <!-- USA Adress -->
                      </span>
                    </td>
                    <!-- Box 4b -->
                    <td class="styNameBox" style="width:47mm;font-size:7pt; border-top-width: 0px; border-bottom-width: 1px;" rowspan="2">
                      <span class="styLNLeftNumBox" style="padding-top:0mm;width:4.5mm;height:100%;">b</span>
                      <span style="font-size:6pt;">
	                  Country under whose laws<br/> organized<br/>
                        <span style="width:5mm;"/>
                      </span>
                      <br/>
                      <span style="width: 5mm"/>
                      <xsl:if test="$Form8858Data/DirectOwner/DirectOwnerCountryOrganized !=''">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerCountryOrganized"/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styNameBox" valign="top" style="width:47mm;font-size: 7pt;border-top-width: 0px; border-bottom-width: 1px; border-right-width:  0px">
                      <span class="styBoldText" style="padding-left:1mm;padding-right: 1.8mm">c</span>
                      <!-- Box 4c -->
                  U.S. identifying number, if any<br/>
                      <br/>
                      <span style="width: 5mm"/>
                      <xsl:if test="$Form8858Data/DirectOwner/DirectOwnerUSIdNumber/EIN !=''">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerUSIdNumber/EIN"/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                  </tr>
                  <tr>
                    <td valign="top" class="styNameBox" style="width:47mm;height:10mm;font-size:7pt; border-right: 0px;border-bottom-width: 1px">
                      <span class="styBoldText" style="padding-left:1mm;padding-right: 1.8mm">d</span>
                      <!-- Box 4d -->
                 Functional currency<br/>
                      <br/>
                      <span style="width: 5mm"/>
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerFunctionalCurrency"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </tbody>
              </table>
              <!-- Line 4 Toggle Button End -->
              <xsl:call-template name="SetInitialDynamicTableHeight">
                <xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner"/>
                <xsl:with-param name="containerHeight" select="1"/>
                <!--<xsl:with-param name="header-height" select="2"/>-->
                <xsl:with-param name="containerID" select=" 'Line4' "/>
              </xsl:call-template>
              <!--   END line 4 TABLE   -->
            </div>
          </xsl:if>
          <!-- *********************************************************************************************-->
          <div class="styBB" style="width:187mm;">
            <div style="width:187mm;"/>
            <div style="width:187mm:">
              <span class="styLNLeftNumBox" style="width:8mm;padding-left:0mm;">5</span>
              <!--span style="width: 3mm;"></span-->
              <!-- Line 5 -->
              <span class="styLNDesc" style="width:179mm;font-size: 6pt;">
              Attach an organizational chart that identifies the name, placement, percentage of ownership, tax classification, and country 
              of organization of all entities in the chain of ownership between the tax owner and the foreign disregarded entity, and the chain 
              of ownership between the foreign disregarded entity and each entity in which the foreign disregarded entity has a 10% or more 
              direct or indirect interest. See instructions.
            </span>
            </div>
            <div style="width:187mm;"/>
          </div>
          <!-- Schedule C header -->
          <div class="styBB" style="width:187mm;float:none;clear:both;">
            <span class="styPartName" style="width: 20mm;">Schedule C</span>
            <span class="styPartDesc" style="width: 160mm;">Income Statement<span class="styNormalText"> (see instructions)</span>
            </span>
          </div>
          <div class="styBB" style="width:187mm;font-size: 9pt">
            <!-- Schedule C description -->
            <span class="styBoldText" style="width: 23mm; vertical-align: top;">Important:</span>
            <span class="styItalicText">
              <label for="Section989bAverageExchangeRate">
                <!-- The xsl:choose code block below will display multiple schema versions using one stylesheet -->
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/Section989bAverageExchangeRate"/>
                  <xsl:with-param name="BackupName">IRS8858ScheduleCSection989(b)AverageExchangeRate</xsl:with-param>
                </xsl:call-template>
                 
                Report all information in functional currency in accordance with U.S. GAAP. Also, report each amount in U.S. 
                dollars translated from functional currency (using GAAP translation rules or the average exchange rate determined 
                under section 989(b)). If the functional currency is the U.S. dollar, complete only the U.S. Dollars column. See 
                instructions for special rules for foreign disregarded entities that use DASTM.
              </label>
            </span>
            <br/>
            <div class="styItalicText" style="float:left;clear:none;">
              If you are using the average exchange rate (determined under section 989(b)), check the following box
            </div>
            <div style="float:right;clear:none;">
              <span class="styDotLn">....</span>
              <input type="checkbox" class="styCkbox" id="Section989bAverageExchangeRate">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/Section989bAverageExchangeRate"/>
                  <xsl:with-param name="BackupName">IRS8858ScheduleCSection989(b)AverageExchangeRate</xsl:with-param>
                </xsl:call-template>
              </input>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <!-- Schedule C data -->
            <table class="styTable" id="grossRctOrSales" cellpadding="0" cellspacing="0" style="font-size:7pt;">
              <tr>
                <td class="styLNLeftNumBox" style="height: 4.5mm;float:left;text-align:left;"/>
                <td style="width: 107mm; height: 4.5mm; ">
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height: 4.5mm;border-left-width:1px;">
                  <span style="width:1px;"/>
                </td>
                <td class="styLNAmountBox" style="width:33mm;text-align:center;font-weight:bold;">Functional Currency</td>
                <td class="styLNAmountBox" style="width:31mm;text-align:center;font-weight:bold;">U.S. Dollars</td>
              </tr>
              <tr>
                <!-- Schedule C Line 1 -->
                <td class="styLNLeftNumBox" style="height: 4mm;">1</td>
                <td style="width: 107mm; height: 4.5mm;">
                  <span style="float:left;">Gross receipts or sales (net of returns and allowances)</span>
                  <span style="font-weight: bold; float: right; letter-spacing: 16px; padding-right: 1mm;">......</span>
                </td>
                <td class="styLNRightNumBox">1</td>
                <td class="styLNAmountBox" style="width:33mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/GrossReceiptsOrSales/FunctionalCurrency"/>
                    <xsl:with-param name="MaxSize" select="17"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="width:31mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/GrossReceiptsOrSales/USDollars"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!--Schedule C Line 2 -->
              <tr>
                <td class="styLNLeftNumBox" style="height: 4mm;">2</td>
                <td style="width: 107mm; height: 4.5mm; float: right; clear: none;">
                  <span style="float:left;">Cost of goods sold</span>
                  <span style="font-weight: bold; float: right; letter-spacing:16px; padding-right: 1mm;">................</span>
                </td>
                <td class="styLNRightNumBox">2</td>
                <td class="styLNAmountBox" style="width:33mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/CostOfGoodsSold/FunctionalCurrency"/>
                    <xsl:with-param name="MaxSize" select="17"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="width:31mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/CostOfGoodsSold/USDollars"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Schedule C Line 3 -->
              <tr>
                <td class="styLNLeftNumBox" style="height: 4mm;">3</td>
                <td style="width: 107mm; height: 4.5mm; float: right; clear: none;">
                  <span style="float:left;">Gross profit (subtract line 2 from line 1)</span>
                  <span style="font-weight: bold; float: right; letter-spacing: 16px; padding-right:1mm;">..........</span>
                </td>
                <td class="styLNRightNumBox">3</td>
                <td class="styLNAmountBox" style="width:33mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/GrossProfit/FunctionalCurrency"/>
                    <xsl:with-param name="MaxSize" select="17"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="width:31mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/GrossProfit/USDollars"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Schedule C Line 4 -->
              <tr>
                <td class="styLNLeftNumBox" style="height: 4mm;">4</td>
                <td style="width: 107mm; height: 4.5mm;">
                  <span style="float:left;">Other income</span>
                  <span style="font-weight: bold; float: right; letter-spacing: 16px; padding-right: 1mm;">.................</span>
                </td>
                <td class="styLNRightNumBox">4</td>
                <td class="styLNAmountBox" style="width:33mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/OtherIncome/FunctionalCurrency"/>
                    <xsl:with-param name="MaxSize" select="17"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="width:31mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/OtherIncome/USDollars"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Schedule C Line 5 -->
              <tr>
                <td class="styLNLeftNumBox" style="height: 4mm;">5</td>
                <td style="width: 107mm; height: 4.5mm;">
                  <span style="float:left;">Total income (add lines 3 and 4)</span>
                  <span style="font-weight: bold; float: right; padding-right:1mm; letter-spacing: 16px;">...........</span>
                </td>
                <td class="styLNRightNumBox">5</td>
                <td class="styLNAmountBox" style="width:33mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/TotalIncome/FunctionalCurrency"/>
                    <xsl:with-param name="MaxSize" select="17"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="width:31mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/TotalIncome/USDollars"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Schedule C Line 6 -->
              <tr>
                <td class="styLNLeftNumBox" style="height: 4mm;">6</td>
                <td style="width: 107mm; height: 4.5mm;">
                  <span style="float: left;">Total deductions</span>
                  <span style="font-weight: bold; float: right; letter-spacing: 16px; padding-right: 1mm;">................</span>
                </td>
                <td class="styLNRightNumBox">6</td>
                <td class="styLNAmountBox" style="width:33mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/TotalDeductions/FunctionalCurrency"/>
                    <xsl:with-param name="MaxSize" select="17"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="width:31mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/TotalDeductions/USDollars"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Schedule C Line 7 -->
              <tr>
                <td class="styLNLeftNumBox" style="height: 4mm;">7</td>
                <td style="width: 107mm; height: 4.5mm;">
                  <span style="float: left; clear: none;">Other adjustments</span>
                  <span style="font-weight: bold; float: right; padding-right:1mm; letter-spacing: 16px;">................</span>
                </td>
                <td class="styLNRightNumBox" style="float: right;">7</td>
                <td class="styLNAmountBox" style="width:33mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/OtherAdjustments/FunctionalCurrency"/>
                    <xsl:with-param name="MaxSize" select="17"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="width:31mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/OtherAdjustments/USDollars"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Schedule C Line 8 -->
              <tr>
                <td class="styLNLeftNumBox" style="height: 4mm;">8</td>
                <td style="width: 107mm; height: 4.5mm;">
                  <span style="float: left; clear: none;">Net income (loss) per books</span>
                  <span style="font-weight: bold; float: right; padding-right:1mm; letter-spacing: 16px;">..............</span>
                </td>
                <td class="styLNRightNumBox" style="float: right;border-bottom: 0px;">8</td>
                <td class="styLNAmountBox" style="width:33mm;border-bottom: 0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/NetIncomeOrLossPerBooks/FunctionalCurrency"/>
                    <xsl:with-param name="MaxSize" select="17"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="width:31mm; border-bottom: 0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/NetIncomeOrLossPerBooks/USDollars"/>
                  </xsl:call-template>
                </td>
              </tr>
            </table>
          </div>
          <div style="width:187mm;">
            <div class="stySmallText" style="width:90mm;text-align:left;float;left; font-weight: bold;">
              For Paperwork Reduction Act Notice, see the separate instructions.
            </div>
            <div class="stySmallText" style="width:41mm;text-align:right;clear:none;">
              Cat. No. 21457L
            </div>
            <div class="stySmallText" style="width:36mm;text-align:right;float:right;clear:none;">
              Form <span class="styBoldText" style="font-size:8pt;">8858</span> (12-2008)
            </div>
          </div>
          <br class="pageEnd"/>
          <div style="width:187mm;">
            <div class="stySmallText" style="width:90mm;text-align:left;float;left; font-weight: bold;">
              Form 8858 (12-2008)
            </div>
            <div class="stySmallText" style="width:36mm;text-align:right;float:right;clear:none;">
              Page <span class="styBoldText" style="font-size:8pt;">2</span>
            </div>
          </div>
          <!-- Schedule C-1 header -->
          <!-- Filler section for Schedule C-1 -->
          <!-- Display the data container only if there is no data for Schedule C-1 -->
          <!-- If the print parameter is "separated" and there is more than one instance of Schedule C-1,  -->
          <!-- then display a message directing the user to the additional data table -->
          <xsl:if test="not($Form8858Data/IRS8858ScheduleC1) or 
              (($Print = $Separated) and (count($Form8858Data/IRS8858ScheduleC1) &gt; 1))">
            <div class="styBB" style="width:187mm;border-top:1px solid black;">
              <span class="styPartName" style="width: 25mm;">Schedule C-1</span>
              <span class="styPartDesc" style="width: 155mm;">Section 987 Gain or Loss Information</span>
            </div>
            <div class="styBB" style="width:187mm;">
              <div style="width:187mm;">
                <div style="float:left;">
                  <div class="styLNLeftNumBox" style="height:15mm;"/>
                  <div class="styLNDesc" style="height:15mm;width:107mm;"/>
                </div>
                <div style="float:right;">
                  <div class="styLNRightNumBox" style="height:15mm;"/>
                  <div class="styLNAmountBox" style="height:15mm;font-weight:normal;text-align:center;font-size:6pt;">
                    <b>(a)</b>
                    <br/>Amount stated in <br/>functional currency of <br/>foreign disregarded entity</div>
                  <div class="styLNAmountBox" style="height:15mm;font-weight:normal;text-align:center;">
                    <b>(b)</b>
                    <br/>Amount stated in <br/>functional currency <br/>of recipient</div>
                </div>
              </div>
              <div style="width:187mm;">
                <div style="float:left;">
                  <div class="styLNLeftNumBox" style="height:4mm;">1</div>
                  <div class="styLNDesc" style="height:4mm;width:107mm;">
                    <span style="float:left;">Remittances from the foreign disregarded entity</span>
                    <span style="font-weight: bold;  letter-spacing: 16px; float: right; padding-right:1mm;">.........</span>
                  </div>
                </div>
                <div style="float:right;">
                  <div class="styLNRightNumBox" style="height:4mm;">1</div>
                  <div class="styLNAmountBox" style="text-align:center">
                    <xsl:call-template name="PopulateAdditionalDataTableMessage">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC1"/>
                      <xsl:with-param name="ShortMessage" select="'true'"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox"/>
                </div>
              </div>
              <div style="width:187mm;">
                <div style="float:left;">
                  <div class="styLNLeftNumBox" style="height:4mm;">2</div>
                  <div class="styLNDesc" style="height:4mm;width:107mm;">
                    <span style="float:left;">Section 987 gain (loss) of recipient </span>
                    <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">............</span>
                  </div>
                </div>
                <div style="float:right;">
                  <div class="styLNRightNumBox" style="height:4mm;">2</div>
                  <div class="styLNAmountBox" style="background-color:lightgrey;"/>
                  <div class="styLNAmountBox"/>
                </div>
              </div>
              <div style="width:187mm;">
                <div style="float:left;">
                  <div class="styLNLeftNumBox" style="height:4mm;"/>
                  <div class="styLNDesc" style="height:4mm;width:146.75mm;"/>
                </div>
                <div style="float:right;">
                  <div class="styLNAmountBox" style="width:16.25mm;text-align:center;font-weight:bold;">Yes</div>
                  <div class="styLNAmountBox" style="width:16mm;text-align:center;font-weight:bold;">No</div>
                </div>
              </div>
              <!-- Begin c-1 line 3 -->
              <div style="width:187mm;">
                <div style="float:left;">
                  <div class="styLNLeftNumBox" style="height:4mm;">3</div>
                  <div class="styLNDesc" style="height:4mm;width:146.75mm;">Were all remittances from the foreign disregarded entity treated as made to the direct owner? </div>
                </div>
                <div style="float:right;">
                  <div class="styLNAmountBox" style="width:16.25mm;text-align:center;font-weight:bold;"/>
                  <div class="styLNAmountBox" style="width:16mm;text-align:center;font-weight:bold;"/>
                </div>
              </div>
              <div style="width:187mm;">
                <div style="float:left;">
                  <div class="styLNLeftNumBox" style="height:4mm;">4
                </div>
                  <div class="styLNDesc" style="height:7mm;width:146.75mm;">Did the tax owner change its method of accounting for section 987 gain or loss with respect to remittances from the foreign disregarded entity during the tax year?        
                </div>
                </div>
                <div style="float:right;">
                  <div class="styLNAmountBoxNBB" style="width:16.25mm;text-align:center;font-weight:bold;height:7mm;">
                    <br/>
                  </div>
                  <div class="styLNAmountBoxNBB" style="width:16mm;text-align:center;font-weight:bold;height:7mm;">
                    <br/>
                  </div>
                </div>
              </div>
            </div>
          </xsl:if>
          <!-- Display all instances of Schedule C-1 if the print option is not "separated" -->
          <!-- If the print option is "separated", but there is only one instance, display that instance -->
          <xsl:if test="($Print != $Separated) or (count($Form8858Data/IRS8858ScheduleC1) = 1)">
            <xsl:for-each select="$Form8858Data/IRS8858ScheduleC1">
              <!--div class="styGenericDiv"-->
              <div class="styBB" style="width:187mm;float:none;clear:both;">
                <xsl:if test="position() = 1">
                  <xsl:attribute name="style">width:187mm; border-top: 1px solid black;float:none;clear:both;
              </xsl:attribute>
                </xsl:if>
                <span class="styPartName" style="width: 25mm;">Schedule C-1</span>
                <span class="styPartDesc" style="width: 155mm;">Section 987 Gain or Loss Information</span>
              </div>
              <!-- The headers for the section c-1 -->
              <div class="styBB" style="width:187mm;float:none;clear:both;">
                <div style="width:187mm;">
                  <div style="float:left;">
                    <div class="styLNLeftNumBox" style="height:15mm;"/>
                    <div class="styLNDesc" style="height:15mm;width:105mm;"/>
                  </div>
                  <div style="float:right;">
                    <div class="styLNRightNumBox" style="height:15mm;"/>
                    <div class="styLNAmountBox" style="width:33mm;height:15mm;font-weight:normal;text-align:center;font-size:6pt;">
                      <b>(a)</b>
                      <br/>Amount stated in <br/>functional currency of <br/>foreign disregarded entity</div>
                    <div class="styLNAmountBox" style="width:33mm;height:15mm;font-weight:normal;text-align:center;">
                      <b>(b)</b>
                      <br/>Amount stated in <br/>functional currency <br/>of recipient</div>
                  </div>
                </div>
                <div style="width:187mm;">
                  <div style="float:left;">
                    <div class="styLNLeftNumBox" style="height:4mm;">
                  1
                </div>
                    <div class="styLNDesc" style="height:4mm;width:105mm;">
                      <span style="float:left;">Remittances from the foreign disregarded entity </span>
                      <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">........</span>
                    </div>
                  </div>
                  <div style="float:right;">
                    <div class="styLNRightNumBox" style="height:4mm;">1
                </div>
                    <div class="styLNAmountBox" style="width:33mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="RemittancesFrgnDisrgrdEntAmt"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </div>
                    <div class="styLNAmountBox" style="width:33mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="RemittancesRecipientAmount"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
                <div style="width:187mm;">
                  <div style="float:left;">
                    <div class="styLNLeftNumBox" style="height:4mm;">
                  2
                </div>
                    <div class="styLNDesc" style="height:4mm;width:105mm;">
                      <span style="float:left;">Section 987 gain (loss) of recipient </span>
                      <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">...........</span>
                    </div>
                  </div>
                  <div style="float:right;">
                    <div class="styLNRightNumBox" style="height:4mm;">2
                </div>
                    <div class="styLNAmountBox" style="width:33mm;background-color:lightgrey;"/>
                    <div class="styLNAmountBox" style="width:33mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Section987GainOrLossOfRcpnt"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
                <div style="width:187mm;">
                  <div style="float:left;">
                    <div class="styLNLeftNumBox" style="height:4mm;"/>
                    <div class="styLNDesc" style="height:4mm;width:145.75mm;"/>
                  </div>
                  <div style="float:right;">
                    <div class="styLNAmountBox" style="width:16.25mm;text-align:center;font-weight:bold;">Yes</div>
                    <div class="styLNAmountBox" style="width:17mm;text-align:center;font-weight:bold;">No</div>
                  </div>
                </div>
                <!-- Begin c-1 line 3 -->
                <div style="width:187mm;">
                  <div style="float:left;">
                    <div class="styLNLeftNumBox" style="height:4mm;">3
                </div>
                    <div class="styLNDesc" style="height:4mm;width:145.75mm;">
                      <span style="float:left;">Were all remittances from the foreign disregarded entity treated as made to the direct owner? </span>
                      <span style="font-weight: bold; letter-spacing: 16px;float: right;padding-right:1mm;">....</span>
                    </div>
                  </div>
                  <div style="float:right;">
                    <div class="styLNAmountBox" style="width:16.25mm;text-align:center;font-weight:bold;">
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="RemittancesOnDirectOwnerBooks"/>
                      </xsl:call-template>
                    </div>
                    <div class="styLNAmountBox" style="width:17mm;text-align:center;font-weight:bold;">
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="RemittancesOnDirectOwnerBooks"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
                <div style="width:187mm;">
                  <div style="float:left;">
                    <div class="styLNLeftNumBox" style="height:4mm;">4
                </div>
                    <div class="styLNDesc" style="height:7mm;width:145.75mm;">Did the tax owner change its method of accounting for section 987 gain or loss with respect to remittances 
                      <span style="float:left;">from the foreign disregarded entity during the tax year? </span>
                      <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">..............</span>
                    </div>
                  </div>
                  <div style="float:right;">
                    <div class="styLNAmountBoxNBB" style="width:16.25mm;text-align:center;font-weight:bold;height:7mm;">
                      <br/>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="TaxOwnerMethodOfAcctChange"/>
                      </xsl:call-template>
                    </div>
                    <div class="styLNAmountBoxNBB" style="width:17mm;text-align:center;font-weight:bold;height:7mm;">
                      <br/>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="TaxOwnerMethodOfAcctChange"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
              </div>
            </xsl:for-each>
          </xsl:if>
          <!-- Schedule F header -->
          <div class="styBB" style="width: 187mm;float:none;clear:none;">
            <span class="styPartName" style="width: 20mm;">Schedule F</span>
            <span class="styPartDesc" style="width: 160mm; font-weight: bold;">Balance Sheet</span>
          </div>
          <div class="styBB" style="width:187mm;float:none;clear:none;">
            <!-- Schedule F description -->
            <span class="styBoldText" style="font-size: 9pt;">Important: </span>
            <span class="styItalicText" style="font-size: 9pt;">Report all amounts in U.S. dollars computed in functional currency and translated into U.S. dollars in accordance with U.S. GAAP. See instructions for an exception for foreign disregarded entities that use DASTM.</span>
          </div>
          <div class="styBB" style="width:187mm;float:none;clear:none;">
            <!-- Schedule F data -->
            <div style="height: 11mm;">
              <span class="styLNLeftNumBox" style="height: 11mm;"/>
              <span style="width: 107mm; height: 11mm; float: left; clear: none; text-align: center; font-size: 12; font-weight: bold;padding-top:3mm;">Assets</span>
              <span class="styLNAmountBoxNBB" style="text-align: center; height: 11mm; float: right; clear: none;">
                <span class="styBoldText">(b)</span>
                <br/>End of annual<br/>accounting period</span>
              <span class="styLNAmountBoxNBB" style="text-align: center; height: 11mm; float: right; clear: none;">
                <span class="styBoldText">(a)</span>
                <br/>Beginning of annual accounting period</span>
              <span class="styLNRightNumBoxNBB" style="height: 11mm; float: right; clear: none;"/>
            </div>
          </div>
          <!-- Schedule F line 1 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none">
              <div class="styLNLeftNumBox" style="widht:8mm;height: 4.5mm;">1</div>
              <div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
                <span style="float: left; clear: none;">Cash and other current assets</span>
                <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">.............</span>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBox" style="height: 4.5mm;">1</div>
              <div class="styLNAmountBox" style="height: 4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/CashAndOtherCurrentAssets/BeginningAmount"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="height: 4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/CashAndOtherCurrentAssets/EndingAmount"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule F line 2 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none">
              <div class="styLNLeftNumBox" style="widht:8mm;height: 4.5mm;">2</div>
              <div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
                <span style="float: left; clear: none;">Other assets</span>
                <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">..................</span>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBox" style="height: 4.5mm;">2</div>
              <div class="styLNAmountBox" style="height: 4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/OtherAssets/BeginningAmount"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="height: 4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/OtherAssets/EndingAmount"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule F line 3 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none">
              <div class="styLNLeftNumBox" style="widht:8mm;height: 4.5mm;">3</div>
              <div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
                <span style="float: left; clear: none;">Total assets</span>
                <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">..................</span>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBox" style="height: 4.5mm;">3</div>
              <div class="styLNAmountBox" style="height: 4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/TotalAssets/BeginningAmount"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="height: 4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/TotalAssets/EndingAmount"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width: 187mm; height: 4.5mm;">
            <span class="styLNLeftNumBox"/>
            <span style="width: 106mm; height: 8mm; float: left; clear: none; text-align: center; font-size: 12; font-weight: bold;padding-top:2mm;padding-bottom:2mm;">Liabilities and Owner's Equity</span>
            <span style="width: 32mm; height: 8mm; border-left: 1px solid black; background-color: lightgrey; float: right; clear: none;"/>
            <span style="width: 32mm; height: 8mm; border-left: 1px solid black; background-color: lightgrey; float: right; clear: none;"/>
            <span style="width: 8mm; height: 8mm; border-left: 1px solid black; background-color: lightgrey; float: right; clear: none;"/>
          </div>
          <!-- Schedule F line 4 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none">
              <div class="styLNLeftNumBox" style="widht:8mm;height: 4.5mm;">4</div>
              <div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
                <span style="float: left; clear: none;">Liabilities</span>
                <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">...................</span>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBox" style="height: 4.5mm;">4</div>
              <div class="styLNAmountBox" style="height: 4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/Liabilities/BeginningAmount"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="height: 4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/Liabilities/EndingAmount"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule F line 5 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none">
              <div class="styLNLeftNumBox" style="widht:8mm;height: 4.5mm;">5</div>
              <div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
                <span style="float: left; clear: none;">Owner's equity</span>
                <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">.................</span>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBox" style="height: 4.5mm;">5</div>
              <div class="styLNAmountBox" style="height: 4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/OwnerEquity/BeginningAmount"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="height: 4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/OwnerEquity/EndingAmount"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule F line 6 -->
          <div class="styBB" style="width:187mm;">
            <div style="float:left;clear:none">
              <div class="styLNLeftNumBox" style="widht:8mm;height: 4.5mm;">6</div>
              <div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
                <span style="float: left; clear: none;">Total liabilities and owner's equity </span>
                <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">............</span>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBoxNBB" style="height: 4.5mm;">6</div>
              <div class="styLNAmountBoxNBB" style="height: 4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/TotalLiabilitiesAndOwnerEquity/BeginningAmount"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBoxNBB" style="height: 4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/TotalLiabilitiesAndOwnerEquity/EndingAmount"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule G data -->
          <div class="styBB" style="width:187mm;">
            <span class="styPartName" style="width: 20mm;">Schedule G</span>
            <span class="styPartDesc" style="width: 160mm; font-weight: bold;">Other Information</span>
          </div>
          <!-- Schedule G data -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" />
              <div class="styLNDesc" style="width: 146.5mm;"/>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:32mm;">
                <div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black; border-bottom: 1px solid black; height: 4.5mm;padding-left:0mm;float:left;clear:none; ">Yes
           </div>
                <div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black; border-bottom: 1px solid black; height: 4.5mm;float:right;">No
           </div>
              </div>
            </div>
          </div>
          <!-- Schedule G line 1-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="height: 4.5mm;">1</div>
              <div class="styLNDesc" style="width: 146.5mm; height: 4.5mm;">
                <span style="float: left; clear: none;">During the tax year, did the foreign disregarded entity own an interest in any trust?</span>
                <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">........</span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:32mm;">
                <div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black; border-bottom: 1px solid black; height: 4.5mm;padding-left:0mm;float:left;clear:none; ">
                  <xsl:call-template name="PopulateYesBoxText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/InterestOwnedInTrust"/>
                  </xsl:call-template>
                </div>
                <div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black; border-bottom: 1px solid black; height: 4.5mm;float:right;">
                  <xsl:call-template name="PopulateNoBoxText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/InterestOwnedInTrust"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- Schedule G line 2 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="height: 8mm;">2</div>
              <div class="styLNDesc" style="width: 146.5mm; height: 8mm;">
              During the tax year, did the foreign disregarded entity own at least a 10% interest, directly or indirectly, in any
              <span style="float: left; clear: none;">foreign partnership?
                <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/Owned10PercentIntForeignPrtshp"/>
                  </xsl:call-template>
                </span>
                <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">.......................</span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:32mm;">
                <div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black; border-bottom: 1px solid black; height: 8mm;padding-left:0mm;float:left;clear:none; ">
                  <xsl:call-template name="PopulateYesBoxText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/Owned10PercentIntForeignPrtshp"/>
                  </xsl:call-template>
                </div>
                <div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black; border-bottom: 1px solid black; height: 8mm;float:right;">
                  <xsl:call-template name="PopulateNoBoxText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/Owned10PercentIntForeignPrtshp"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- Schedule G line 3 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="height: 10mm;">3</div>
              <div class="styLNDesc" style="width: 146.5mm; height: 10mm;">
                <span class="styItalicText">Answer the following question only if the foreign disregarded entity made its election to be treated as disregarded from
                its owner during the tax year:</span> Did the tax owner claim a loss with respect to stock or debt of the foreign 
              <span style="float: left; clear: none;">disregarded entity as a result of the election?
            <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/LossClaimToStockOrDebt"/>
                  </xsl:call-template>
                </span>
                <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">.................</span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:32mm;">
                <div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black; border-bottom: 1px solid black; height: 10.5mm;padding-left:0mm;float:left;clear:none; ">
                  <xsl:call-template name="PopulateYesBoxText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/LossClaimToStockOrDebt"/>
                  </xsl:call-template>
                </div>
                <div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black; border-bottom: 1px solid black; height: 10.5mm;float:right;">
                  <xsl:call-template name="PopulateNoBoxText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/LossClaimToStockOrDebt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- Schedule G line 4 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="height: 13mm;">4</div>
              <div class="styLNDesc" style="width: 146.5mm; height: 13mm;">
                <span class="styItalicText">Answer the following question only if the foreign disregarded entity is owned directly or indirectly by a domestic 
                corporation and the foreign disregarded entity incurred a net operating loss for the tax year: </span>
                <!-- &#167; is html reference for section symbol -->
                Is the foreign disregarded entity a separate unit as defined in Regulations sections 1.1503(d)-1(b)(4)? (If yes, see the 
              <span style="float: left; clear: none;">instructions)
          <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/SeparateUnitDefinedInReg"/>
                  </xsl:call-template>
                </span>
                <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">.........................</span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:32mm;">
                <div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black; border-bottom: 1px solid black; height: 14mm;padding-left:0mm;float:left;clear:none; ">
                  <xsl:if test="$Form8858Data/IRS8858ScheduleG/SeparateUnitDefinedInReg">
                    <xsl:call-template name="PopulateYesBoxText">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/SeparateUnitDefinedInReg"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$Form8858Data/IRS8858ScheduleG/SeparateUnitDefinedInRegNA">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/SeparateUnitDefinedInRegNA"/>
                    </xsl:call-template>
                  </xsl:if>
                </div>
                <div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black; border-bottom: 1px solid black; height: 14mm;float:right;">
                  <xsl:if test="$Form8858Data/IRS8858ScheduleG/SeparateUnitDefinedInReg">
                    <xsl:call-template name="PopulateNoBoxText">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/SeparateUnitDefinedInReg"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$Form8858Data/IRS8858ScheduleG/SeparateUnitDefinedInRegNA">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/SeparateUnitDefinedInRegNA"/>
                    </xsl:call-template>
                  </xsl:if>
                </div>
              </div>
            </div>
          </div>
          <!-- Schedule G line 5  Line 5 did not print out in print preview or paper.  change first span2div-->
          <div class="styBB" style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="height: 13mm;">5</div>
              <div class="styLNDesc" style="width: 146.5mm; height: 13mm;">
                <span class="styItalicText">Answer the following question only if the tax owner of the foreign disregarded entity is a controlled foreign corporation (CFC): </span>
                Were there any intracompany transactions between the foreign disregarded entity and the CFC or any other branch 
                of the CFC during the tax year, in which the foreign disregarded entity acted as a 
              <span style="float: left; clear: none;">manufacturing, selling, or purchasing branch? </span>
                <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">.................</span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:32mm;">
                <div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black; border-bottom: 0px solid black; height: 14mm;padding-left:0mm;float:left;clear:none; ">
                  <xsl:call-template name="PopulateYesBoxText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/MfrSellingOrPurchasingBranch"/>
                  </xsl:call-template>
                </div>
                <div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black; border-bottom: 0px solid black; height: 14mm;float:right;">
                  <xsl:call-template name="PopulateNoBoxText">
                    <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/MfrSellingOrPurchasingBranch"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- Schedule H header -->
          <!-- Filler for Schedule H-->
          <!-- Display the data container only if there is no data for Schedule H. -->
          <!-- If the print parameter is "separated" and there is more than one instance of Schedule H, -->
          <!-- then display a message directing the user to the additional data table -->
          <xsl:if test="not($Form8858Data/IRS8858ScheduleH) or 
              (($Print = $Separated) and (count($Form8858Data/IRS8858ScheduleH) &gt; 1))">
            <div class="styBB" style="width:187mm;float:none;clear:both;">
              <span class="styPartName" style="width: 20mm;">Schedule H</span>
              <span class="styPartDesc" style="width: 160mm;">Current Earnings and Profits or Taxable Income<span class="styNormalText"> (see instructions)</span>
              </span>
            </div>
            <div class="styBB" style="width:187mm;">
              <!-- Schedule H description -->
              <span class="styBoldText" style="height: 4mm; width: 23mm; font-size: 9pt; vertical-align: top;">Important:</span>
              <span class="styItalicText" style="height: 4mm; width: 163mm; font-size: 9pt;">Enter the amounts on lines 1 through 6 in functional currency.
            </span>
            </div>
            <div class="styBB" style="width:187mm;">
              <!-- Schedule H line 1 -->
              <div style="width:187mm;">
                <div style="float:left;clear:none;">
                  <div class="styLNLeftNumBox" style="width:8mm;">1</div>
                  <div class="styLNDesc" style="width:139mm;padding-top:.5mm;padding-bottom:.5mm;">
                    <span style="float:left;">Current year net income or (loss) per foreign books of account </span>
                    <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">...........</span>
                  </div>
                </div>
                <div style="float:right;clear;none;">
                  <div style="width:40mm;">
                    <div class="styLNRightNumBox">1</div>
                    <div class="styLNAmountBox">
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleH"/>
                        <xsl:with-param name="ShortMessage" select="'true'"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Line 2 -->
              <div style="width:187mm;">
                <div style="float:left;">
                  <div class="styLNLeftNumBox">2</div>
                  <div class="styLNDesc" style="width:139mm;padding-top:.5mm;padding-bottom:.5mm;">
                    <span style="float:left;">Total net additions</span>
                    <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">......................</span>
                  </div>
                </div>
                <div style="float:right;">
                  <div class="styLNRightNumBox">2</div>
                  <div class="styLNAmountBox"/>
                </div>
              </div>
              <!-- Line 3 -->
              <div style="width:187mm;">
                <div style="float:left;">
                  <div class="styLNLeftNumBox">3</div>
                  <div class="styLNDesc" style="width:139mm;padding-top:.5mm;padding-bottom:.5mm;">
                    <span style="float:left;">Total net substractions</span>
                    <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">.....................</span>
                  </div>
                </div>
                <div style="float:right;">
                  <div class="styLNRightNumBox">3</div>
                  <div class="styLNAmountBox"/>
                </div>
              </div>
              <!-- Line 4 -->
              <div style="width:187mm;">
                <div style="float:left;">
                  <div class="styLNLeftNumBox">4</div>
                  <div class="styLNDesc" style="width:139mm;padding-top:.5mm;padding-bottom:.5mm;">
                    <span style="float:left;">Current earnings and profits (or taxable income&#151;see instructions) (line 1 plus line 2 minus line 3) </span>
                    <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">..</span>
                  </div>
                </div>
                <div style="float:right;">
                  <div class="styLNRightNumBox">4</div>
                  <div class="styLNAmountBox"/>
                </div>
              </div>
              <!-- Line 5 -->
              <div style="width:187mm;">
                <div style="float:left;">
                  <div class="styLNLeftNumBox">5</div>
                  <div class="styLNDesc" style="width:139mm;padding-top:.5mm;padding-bottom:.5mm;">
                    <span style="float:left;">DASTM gain or loss (if applicable) </span>
                    <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">..................</span>
                  </div>
                </div>
                <div style="float:right;">
                  <div class="styLNRightNumBox">5</div>
                  <div class="styLNAmountBox"/>
                </div>
              </div>
              <!-- Line 6 -->
              <div style="width:187mm;">
                <div style="float:left;">
                  <div class="styLNLeftNumBox" style="height:4mm;">6</div>
                  <div class="styLNDesc" style="width:139mm;height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                    <span style="float:left;">Combine lines 4 and 5</span>
                    <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">.....................</span>
                  </div>
                </div>
                <div style="float:right;">
                  <div class="styLNRightNumBox">6</div>
                  <div class="styLNAmountBox"/>
                </div>
              </div>
              <!-- Line 7 -->
              <div style="width:187mm;">
                <div style="float:left;">
                  <div class="styLNLeftNumBox" style="height:11mm;">7</div>
                  <div class="styLNDesc" style="width:139mm;height:11mm;padding-top:.5mm;padding-bottom:.5mm;">
                      Current earnings and profits (or taxable income) in U.S. dollars (line 6 translated at the average 
                  <span style="float:left;">exchange rate determined under section 989(b) and the related regulations (see instructions)) </span>
                    <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">...</span>
                    <span style="float:left;padding-top:.5mm;">Enter exchange rate used for line 7&#160;
                      <img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="Bullet"/>&#160;
                   </span>
                    <span style="float:right;"/>
                  </div>
                </div>
                <div style="float:right;">
                  <div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">7</div>
                  <div class="styLNAmountBox" style="height:7.5mm;padding-top:4mm;float:right;"/>
                  <div class="styLNRightNumBoxNBB" style="height:3mm;background-color:lightgrey;border-rigth-width:0px;"/>
                  <div class="styLNAmountBoxNBB" style="height:3mm;background-color:lightgrey;border-left-width:0px;"/>
                </div>
              </div>
            </div>
          </xsl:if>
          <!-- Display all instances of Schedule H data if the print option is not "separated" -->
          <!-- If the print option is "separated", but there is only one Schedule H, display that instance -->
          <xsl:if test="($Print != $Separated) or (count($Form8858Data/IRS8858ScheduleH) = 1)">
            <xsl:for-each select="$Form8858Data/IRS8858ScheduleH">
              <div class="styBB" style="width:187mm;float:none;clear:both;">
                <span class="styPartName" style="width: 20mm;">Schedule H</span>
                <span class="styPartDesc" style="width: 160mm;">Current Earnings and Profits or Taxable Income<span class="styNormalText"> (see instructions)</span>
                </span>
              </div>
              <div class="styBB" style="width:187mm;float:none;clear:both;">
                <!-- Schedule H description -->
                <span class="styBoldText" style="height: 4mm; width: 23mm; font-size: 9pt; vertical-align: top;">Important:</span>
                <span class="styItalicText" style="height: 4mm; width: 163mm; font-size: 9pt;">Enter the amounts on lines 1 through 6 in functional currency.
            </span>
              </div>
              <div class="styTBB" style="width:187mm;float:none;clear:both;">
                <!-- Schedule H line 1 -->
                <div style="width:187mm;">
                  <div style="float:left;">
                    <div class="styLNLeftNumBox">1</div>
                    <div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
                      <span style="float:left;">Current year net income or (loss) per foreign books of account </span>
                      <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">...........</span>
                    </div>
                  </div>
                  <div style="float:right;">
                    <div class="styLNRightNumBox">1</div>
                    <div class="styLNAmountBox" style="width:33mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="CurrentYearNetIncomeOrLoss"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
                <!-- Line 2 -->
                <div style="width:187mm;">
                  <div style="float:left;">
                    <div class="styLNLeftNumBox">2</div>
                    <div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
                      <span style="float:left;"> Total net additions   
                       <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="TotalNetAdditions"/>
                          <xsl:with-param name="TabOrder" select="2"/>
                        </xsl:call-template>
                      </span>
                      <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">.....................</span>
                    </div>
                  </div>
                  <div style="float:right;">
                    <div class="styLNRightNumBox" style="height:4.5mm;">2</div>
                    <div class="styLNAmountBox" style="width:33mm;height:4.5mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TotalNetAdditions"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
                <!-- Line 3 -->
                <div style="width:187mm;">
                  <div style="float:left;">
                    <div class="styLNLeftNumBox">3</div>
                    <div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
                      <span style="float:left;">Total net substractions   
                   <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="TotalNetSubtractions"/>
                          <xsl:with-param name="TabOrder" select="2"/>
                        </xsl:call-template>
                      </span>
                      <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">....................</span>
                    </div>
                  </div>
                  <div style="float:right;">
                    <div class="styLNRightNumBox">3</div>
                    <div class="styLNAmountBox" style="width:33mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TotalNetSubtractions"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
                <!-- Line 4 -->
                <div style="width:187mm;">
                  <div style="float:left;">
                    <div class="styLNLeftNumBox">4</div>
                    <div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
                      <span style="float:left;">Current earnings and profits (or taxable income&#151;see instructions) (line 1 plus line 2 minus line 3) </span>
                      <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">..</span>
                    </div>
                  </div>
                  <div style="float:right;">
                    <div class="styLNRightNumBox">4</div>
                    <div class="styLNAmountBox" style="width:33mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="CurrentEarningsAndProfits"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
                <!-- Line 5 -->
                <div style="width:187mm;">
                  <div style="float:left;">
                    <div class="styLNLeftNumBox">5</div>
                    <div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
                      <span style="float:left;">DASTM gain or loss (if applicable) </span>
                      <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">..................</span>
                    </div>
                  </div>
                  <div style="float:right;">
                    <div class="styLNRightNumBox">5</div>
                    <div class="styLNAmountBox" style="width:33mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="DASTMGainOrLoss"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
                <!-- Line 6 -->
                <div style="width:187mm;">
                  <div style="float:left;">
                    <div class="styLNLeftNumBox">6</div>
                    <div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
                      <span style="float:left;">Combine lines 4 and 5 </span>
                      <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">.....................</span>
                    </div>
                  </div>
                  <div style="float:right;">
                    <div class="styLNRightNumBox">6</div>
                    <div class="styLNAmountBox" style="width:33mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="CurrEarnPrftPlusDASTMGainLoss"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
                <!-- Line 7 -->
                <div style="width:187mm;">
                  <div style="float:left;">
                    <div class="styLNLeftNumBox" style="height:11mm;">7</div>
                    <div class="styLNDesc" style="height:11mm;padding-top:.5mm;padding-bottom:.5mm;">
                      Current earnings and profits (or taxable income) in U.S. dollars (line 6 translated at the average 
                  <span style="float:left;">exchange rate determined under section 989(b) and the related regulations (see instructions)) </span>
                      <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">...</span>
                      <span style="float:left;padding-top:.5mm;">Enter exchange rate used for line 7&#160;
                                      <img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="Bullet"/>&#160;
                  <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ExchangeRateUsed"/>
                        </xsl:call-template>
                      </span>
                    </div>
                  </div>
                  <div style="float:right;">
                    <div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">7</div>
                    <div class="styLNAmountBox" style="width:33mm;height:7.5mm;padding-top:4mm;float:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="CurrEarnPrftOrTaxableIncome"/>
                      </xsl:call-template>
                    </div>
                    <div class="styLNRightNumBoxNBB" style="height:3mm;background-color:lightgrey;border-rigth-width:0px;"/>
                    <div class="styLNAmountBoxNBB" style="width:33mm;height:3mm;background-color:lightgrey;border-left-width:0px;"/>
                  </div>
                </div>
              </div>
            </xsl:for-each>
          </xsl:if>
          <!-- Page 2 Footer -->
          <div style="width:187mm;">
            <div class="stySmallText" style="width:36mm;text-align:right;float:right;clear:none;">
              Form <span class="styBoldText" style="font-size:8pt;">8858</span> (12-2008)
            </div>
          </div>
          <br class="pageEnd"/>
          <!-- BEGIN Left Over Table -->
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
            Additional Data        
          </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form8858Data"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Form 8858, Top Left Margin - Summary Dormant FDE Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form8858Data/@summaryDormantFDEIndicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
          <!-- Additional Data Table for Separated Repeating Data from Line 1c/1d -->
          <xsl:if test="($Print = $Separated) and (count($Form8858Data/CountryEntityTypeDate) &gt; 1) ">
            <span class="styRepeatingDataTitle">
              <br/>Form 8858, Lines 1c and 1d:
            </span>
            <table class="styDepTbl" style="font-size:7pt">
              <thead class="styTableHead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell">
                    c<span style="width:10px;"/>Country(ies) under whose laws organized and entity type under local tax law
                  </th>
                  <th class="styDepTblCell">
                    d<span style="width:10px;"/>Date(s) of organization
                  </th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="$Form8858Data/CountryEntityTypeDate">
                  <tr>
                    <!--Define background colors to the rows -->
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="text-align:left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CountryOrganized"/>
                      </xsl:call-template>
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfEntity"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="text-align:center;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="DateOfOrganization"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!-- End Line 1c/1d Separated Data -->
          <!-- Additional Data Table for Separated Repeating Data from Line 2b -->
          <xsl:if test="($Print = $Separated) and (count($Form8858Data/BooksAndRecords) &gt; 1) ">
            <span class="styRepeatingDataTitle">
              <br/>Form 8858, Line 2b:
            </span>
            <table class="styDepTbl" style="font-size:7pt">
              <thead class="styTableHead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" style="text-align:left">
                    b<span style="width:20px;"/>
                    Name and address (including corporate department, if applicable) of person(s)<br/>
                    <span style="width:28px;"/>with custody of the books and records of the foreign disregarded entity, and the <br/>
                    <span style="width:28px;"/>location of such books and records, if different
                  </th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="$Form8858Data/BooksAndRecords">
                  <tr>
                    <!--Define background colors to the rows -->
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="text-align:left;">
                      <span style="font-family:verdana;font-size:6pt;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CustodianName/BusinessNameLine1"/>
                        </xsl:call-template>
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CustodianName/BusinessNameLine2"/>
                        </xsl:call-template>
                      </span>
                      <br/>
                      CustodianAddress:<br/>
                      <xsl:if test="CustodianUSAddress!=''">
                        <xsl:call-template name="PopulateUSAddressTemplate">
                          <xsl:with-param name="TargetNode" select="CustodianUSAddress"/>
                        </xsl:call-template>
                      </xsl:if>
                      <xsl:if test="CustodianForeignAddress!=''">
                        <xsl:call-template name="PopulateForeignAddressTemplate">
                          <xsl:with-param name="TargetNode" select="CustodianForeignAddress"/>
                        </xsl:call-template>
                      </xsl:if>
                      <br/>
                      Location:<br/>
                      <xsl:if test="USLocation!=''">
                        <xsl:call-template name="PopulateUSAddressTemplate">
                          <xsl:with-param name="TargetNode" select="USLocation"/>
                        </xsl:call-template>
                      </xsl:if>
                      <xsl:if test="ForeignLocation!=''">
                        <xsl:call-template name="PopulateForeignAddressTemplate">
                          <xsl:with-param name="TargetNode" select="ForeignLocation"/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!-- End Line 2b Separated Data -->
          <!-- Additional Data Table for Separated Repeating Data from Lines 4a thru 4d -->
          <xsl:if test="($Print = $Separated) and (count($Form8858Data/DirectOwner/DirectOwnerName) &gt; 1) ">
            <span class="styRepeatingDataTitle">
              <br/>Form 8858, Line 4:  Direct owner of the foreign disregarded entity (if different from the tax owner) provide the following:
           				 </span>
            <div style="float: left; clear:none; width: 187mm">
              <table class="styDepTbl" style="font-size: 7pt" cellspacing="0">
                <thead class="styTableHead">
                  <!-- Line 4 -->
                  <tr class="styDepTblHdr">
                    <td class="styDepTblCell" style="width: 77mm; text-align: left; height:10mm; vertical-align:top;">
                      <span class="styLNLeftNumBox" style="padding-top:0mm;width:4.5mm;height:100%;">a</span>
                      <!-- Box 4a -->
          						    Name and address
              							</td>
                    <td class="styDepTblCell" style="width:25mm;font-size:7pt;">
                      <span class="styLNLeftNumBox" style="padding-top:0mm;width:4.5mm;height:100%;">b</span>
	                  Country under whose laws<br/> organized
	                  </td>
                    <td class="styDepTblCell" style="width:43mm;font-size: 7pt; vertical-align:top;">
                      <span class="styBoldText" style="padding-left:1mm;padding-right: 1.8mm">c</span>
                      <!-- Box 4c -->
                  U.S. identifying number, if any
              			   </td>
                    <td class="styDepTblCell" style="width:42mm;font-size:7pt; vertical-align:top;">
                      <span class="styBoldText" style="padding-left:1mm;padding-right: 1.8mm">d</span>
                      <!-- Box 4d -->
              							   Functional currency              							   
					</td>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="$Form8858Data/DirectOwner">
                    <tr>
                      <!--Define background colors to the rows -->
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>								styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <td class="styDepTblCell" style="width:93mm;font-size:7pt; text-align:left;">
                        <!-- 4a - Name -->
                        <span style="font-family:verdana;font-size:6pt;">
                          <xsl:if test="DirectOwnerName/BusinessNameLine1 !=''">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="DirectOwnerName/BusinessNameLine1"/>
                            </xsl:call-template>
                          </xsl:if>
                          <xsl:if test="DirectOwnerName/BusinessNameLine2 !=''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="DirectOwnerName/BusinessNameLine2"/>
                            </xsl:call-template>
                          </xsl:if>
                          <!-- 4a - Address -->
                          <!-- USA Address -->
                          <br/>
                          <xsl:if test="DirectOwnerUSAddress !=''">
                            <xsl:call-template name="PopulateUSAddressTemplate">
                              <xsl:with-param name="TargetNode" select="DirectOwnerUSAddress"/>
                            </xsl:call-template>
                          </xsl:if>
                          <!-- Foreign Address 4a -->
                          <xsl:if test="DirectOwnerForeignAddress!=''">
                            <xsl:call-template name="PopulateForeignAddressTemplate">
                              <xsl:with-param name="TargetNode" select="DirectOwnerForeignAddress"/>
                            </xsl:call-template>
                          </xsl:if>
                        </span>
                      </td>
                      <!-- Box 4b -->
                      <td class="styDepTblCell" style="width:47mm;font-size:7pt; text-align:left">
                        <span style="width:2mm;"/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="DirectOwnerCountryOrganized"/>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" valign="top" style="height: 8mm;width:47mm;font-size: 7pt;text-align:left">
                        <!-- Box 4c -->
                        <span style="width: 2mm"/>
                        <xsl:if test="DirectOwnerUSIdNumber/EIN">
                          <xsl:call-template name="PopulateEIN">
                            <xsl:with-param name="TargetNode" select="DirectOwnerUSIdNumber/EIN"/>
                          </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="DirectOwnerUSIdNumber/SSN">
                          <xsl:call-template name="PopulateSSN">
                            <xsl:with-param name="TargetNode" select="DirectOwnerUSIdNumber/SSN"/>
                          </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="DirectOwnerUSIdNumber/EINMissingReason">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="DirectOwnerUSIdNumber/EINMissingReason"/>
                          </xsl:call-template>
                        </xsl:if>
                      </td>
                      <td class="styDepTblCell" valign="top" style="height: 8mm;width:47mm;font-size: 7pt;text-align:left">
                        <span style="width: 2mm"/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="DirectOwnerFunctionalCurrency"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
            <br/>
          </xsl:if>
          <!-- Additional Data Table for Separated Repeating Data from Schedule C-1 -->
          <xsl:if test="($Print = $Separated) and (count($Form8858Data/IRS8858ScheduleC1) &gt; 1)">
            <span class="styRepeatingDataTitle">
              <br/>Form 8858, Schedule C-1 - Section 987 Gain or Loss Information:
            </span>
            <xsl:for-each select="$Form8858Data/IRS8858ScheduleC1">
              <table class="styDepTbl" style="font-size:7pt">
                <tbody>
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell" style="width:115mm">
                      <span style="width:2px"/>
                    </th>
                    <th class="styDepTblCell" style="width:5mm"/>
                    <th class="styDepTblCell" style="text-align:center;width:33mm">
                      (a)<br/>Amount stated in <br/>functional currency of <br/>foreign disregarded entity
                    </th>
                    <th class="styDepTblCell" colspan="2" style="text-align:center;width:32mm">
                      (b)<br/>Amount stated in <br/>functional currency <br/>of recipient
                    </th>
                  </tr>
                  <tr class="styDepTblRow1">
                    <td class="styDepTblCell" style="text-align:left;">
                      <div class="styLNLeftNumBox" style="text-align:left">1</div>
                      Remittances from the foreign disregarded entity
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold;">1</td>
                    <td class="styDepTblCell" style="text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="RemittancesFrgnDisrgrdEntAmt"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" colspan="2" style="text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="RemittancesRecipientAmount"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  <tr class="styDepTblRow2">
                    <td class="styDepTblCell" style="text-align:left;">
                      <div class="styLNLeftNumBox" style="text-align:left">2</div>
                      Section 987 gain (loss) of recipient
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold;">2</td>
                    <td class="styDepTblCell" style="background-color:lightgrey"/>
                    <td class="styDepTblCell" colspan="2" style="text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Section987GainOrLossOfRcpnt"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  <tr class="styDepTblRow1">
                    <td class="styDepTblCell" colspan="3" style="text-align:left;"/>
                    <td class="styDepTblCell" style="text-align:center;width:16mm;font-weight:bold">Yes</td>
                    <td class="styDepTblCell" style="text-align:center;width:16mm;font-weight:bold">No</td>
                  </tr>
                  <tr class="styDepTblRow2">
                    <td class="styDepTblCell" colspan="3" style="text-align:left;">
                      <div class="styLNLeftNumBox" style="text-align:left">3</div>
                      Were all remittances from the foreign disregarded entity treated as made to the direct owner?
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold">
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="RemittancesOnDirectOwnerBooks"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold">
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="RemittancesOnDirectOwnerBooks"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  <tr class="styDepTblRow1">
                    <td class="styDepTblCell" colspan="3" style="text-align:left;">
                      <div class="styLNLeftNumBox" style="text-align:left">4</div>
                      Did the tax owner change its method of accounting for section 987 gain or loss with respect to 
                      remittances from the disregarded entity during the tax year?
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold">
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="TaxOwnerMethodOfAcctChange"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold">
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="TaxOwnerMethodOfAcctChange"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </tbody>
              </table>
              <br/>
            </xsl:for-each>
          </xsl:if>
          <!-- End Schedule C-1 Separated Data -->
          <!-- Additional Data Table for Separated Repeating Data from Schedule H -->
          <xsl:if test="($Print = $Separated) and (count($Form8858Data/IRS8858ScheduleH) &gt; 1) ">
            <span class="styRepeatingDataTitle">
              <br/>Form 8858, Schedule H - Current Earnings and Profits or Taxable Income:
            </span>
            <xsl:for-each select="$Form8858Data/IRS8858ScheduleH">
              <table class="styDepTbl" style="font-size:7pt">
                <tbody>
                  <tr class="styDepTblRow1">
                    <td class="styDepTblCell" style="text-align:left;">
                      <div class="styLNLeftNumBox" style="text-align:left;">1</div>
                        Current year net income or (loss) per foreign books of account
                       <!--<span style="float:left;">Current year net income or (loss) per foreign books of account </span>
                      <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">..........</span>-->
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">1</td>
                    <td class="styDepTblCell" style="text-align:right;width:33mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="CurrentYearNetIncomeOrLoss"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  <tr class="styDepTblRow2">
                    <td class="styDepTblCell" style="text-align:left;">
                      <div class="styLNLeftNumBox" style="text-align:left">2</div>
                        Total net additions 
                       <!--<span style="float:left;">Total net additions </span>
                        <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">.....................</span>-->
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">2</td>
                    <td class="styDepTblCell" style="text-align:right;width:33mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TotalNetAdditions"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  <tr class="styDepTblRow1">
                    <td class="styDepTblCell" style="text-align:left;">
                      <div class="styLNLeftNumBox" style="text-align:left">3</div>
                        Total net substractions 
                        <!--<span style="float:left;">Total net substractions </span>
                        <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">....................</span>-->
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">3</td>
                    <td class="styDepTblCell" style="text-align:right;width:33mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TotalNetSubtractions"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  <tr class="styDepTblRow2">
                    <td class="styDepTblCell" style="text-align:left;">
                      <div class="styLNLeftNumBox" style="text-align:left">4</div>
                        Current earnings and profits (or taxable income&#151;see instructions) (line 1 plus line 2 minus line 3) 
                      <!--<span style="float:left;">Current earnings and profits (or taxable income&#151;see instructions) (line 1 plus line 2 minus line 3) </span>
                        <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">.</span>-->
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">4</td>
                    <td class="styDepTblCell" style="text-align:right;width:33mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="CurrentEarningsAndProfits"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  <tr class="styDepTblRow1">
                    <td class="styDepTblCell" style="text-align:left;">
                      <div class="styLNLeftNumBox" style="text-align:left">5</div>
                        DASTM gain or loss (if applicable) 
                        <!--<span style="float:left;">DASTM gain or loss (if applicable) </span>
                        <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">.................</span>-->
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">5</td>
                    <td class="styDepTblCell" style="text-align:right;width:33mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="DASTMGainOrLoss"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  <tr class="styDepTblRow2">
                    <td class="styDepTblCell" style="text-align:left;">
                      <div class="styLNLeftNumBox" style="text-align:left">6</div>
                        Combine lines 4 and 5 
                        <!--<span style="float:left;">Combine lines 4 and 5 </span>
                        <span style="font-weight: bold; letter-spacing: 16px; float: right; padding-right:1mm;">....................</span>-->
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">6</td>
                    <td class="styDepTblCell" style="text-align:right;width:33mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="CurrEarnPrftPlusDASTMGainLoss"/>
                        <xsl:with-param name="MaxSize" select="17"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  <tr class="styDepTblRow1">
                    <td class="styDepTblCell" style="text-align:left;border-bottom-width:0px">
                      <div class="styLNLeftNumBox" style="text-align:left">7</div>
                      Current earnings and profits (or taxable income) in U.S. dollars (line 6 translated at the average
                      exchange rate determined under section 989(b) and the related regulations (see instructions))    
                      <!--<span style="font-weight: bold; letter-spacing: 16px; ">.</span>-->
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold;vertical-align:bottom;width:5mm">7</td>
                    <td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:33mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="CurrEarnPrftOrTaxableIncome"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  <tr class="styDepTblRow1">
                    <td class="styDepTblCell" style="text-align:left;border-top-width:0px">
                      <div class="styLNLeftNumBox" style="text-align:left"/>
                      Enter exchange rate used for line 7<span style="width:4px"/>
                      <img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="Bullet"/>
                      <span style="width:4px"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ExchangeRateUsed"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="background-color:lightgrey;width:5mm;border-right-width:0px;"/>
                    <td class="styDepTblCell" style="background-color:lightgrey;width:33mm;border-left-width:0px;"/>
                  </tr>
                </tbody>
              </table>
              <br/>
            </xsl:for-each>
          </xsl:if>
          <!-- End Schedule H Separated Data -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
