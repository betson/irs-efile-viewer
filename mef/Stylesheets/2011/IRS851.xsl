<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS851Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form851Data" select="$RtnDoc/IRS851"/>
  <xsl:template match="/">
    <html xmlns="http://www.irs.gov/efile" xmlns:efile="http://www.irs.gov/efile">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form851Data)"/>
          </xsl:call-template>
        </title>
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <meta http-equiv="Cache-Control" content="private"/>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 851"/>
        <META name="GENERATOR" content="IBM WebSphere Studio"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <!--HINTS: separated print would not display if test data is less than 9 for Part I, II, III and IV .
                          Part II, column 6 to 9 repeat and Part III, column 4 to 8 repeat within a row
						  Each Part Table there is a separation between line 1 (not repeat) and line 2 (repeat)
                          Part IV line 3 and continuation part 3 (d)...should not be displayed per Style Sheet Guide line document 
                          No Scroll bar for Part II and III due to repeat row within row-->
         <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS851Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form851">
          <xsl:call-template name="DocumentHeader"/>
          <div style="width:187mm;">
            <div class="styFNBox" style="width:32mm;height:18.75mm;">
              <div>
                <span style="padding-top:1mm;">Form<span style="width:6px;"/>
                </span>
                <span class="styFormNumber">851</span>
              </div>
              <div class="styAgency" style="width:22mm;">(Rev. December 2010)
                <!--General Dependency Push Pin -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form851Data"/>
                </xsl:call-template>
              </div>
              <div>
                <span class="styAgency">Department of the Treasury </span>
                <span style="width:20px;"/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;height:18.75mm;">
              <div class="styMainTitle">Affiliations Schedule</div>
              <div class="styFBT" style="font-size: 7pt;">
                <img src="{$ImagePath}/851_Bullet_Lg.gif" alt="Right pointing arrow large image" width="4"/>
                <span style="width:6px;"/>File with each consolidated income tax return.</div>
              <div style="font-size:7pt;font-weight:normal;padding-top:5mm;">
                <span style="width:30mm;text-align:left; ">For tax year ending </span>
                <span style="width:20mm;text-align:left;">
                  <xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
                </span>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:18.75mm;">
              <span style="width:110px;"/>
              <span style="width:110px;font-size:7pt;padding-top: 4mm">OMB No.1545-0025</span>
            </div>
          </div>
          <!-- Name and EIN -->
          <div class="styBB" style="width:187mm;border-top-width:1px">
            <div class="styNameBox" style="font-family:verdana;font-size:7pt;width:133mm;height:4mm;">Name of common parent corporation
			  <br/>
              <div style="font-family:verdana;font-size:6pt;height:6.25mm">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <div class="styEINBox" style="font-family:verdana;font-size:7pt;font-weight:bold;width:50mm;height:4mm;padding-left:2mm;">
			  Employer identification number
			  <br/>
              <span style="width:50mm;text-align:left;font-weight:normal;padding-top: 3mm">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- Number street and room ... -->
          <div class="styBB" style="width:187mm;">
            <div style="font-family:Verdana;font-size:7pt;width:140mm;height:8mm;">Number, street, and room or suite no. If a P.O. box, see instructions.<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
          <!-- City, Town, State and Zip Code -->
          <div class="styBB" style="width:187mm;">
            <div style="font-family:Verdana;font-size:7pt;width:140mm;">City or town, state, and ZIP code<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">Country</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
          <!-- @@@PART 1 TABLE@@@ -->
          <div class="styBB" style="width:187mm;border-top-width:0px">
            <span class="styPartName" style="width:16mm;">Part I</span>
            <span style="width:150mm;" class="styPartDesc">Overpayment Credits, Estimated Tax Payments, and Tax Deposits<span class="styNormalText">  (see instructions)</span>
            </span>
            <!-- Table expand/collapse toggle button-->
            <span class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo"/>
                <xsl:with-param name="containerHeight" select="10"/>
                <xsl:with-param name="headerHeight" select="2"/>
                <xsl:with-param name="containerID" select=" 'TPctn' "/>
              </xsl:call-template>
            </span>
            <!--Table expand/collapse toggle button end-->
          </div>
          <!--Part I table header for inline format -->
          <div class="styIRS851TableContainer" id="TPctn">
            <xsl:call-template name="SetInitialState"/>
            <table cellspacing="0" style="width:182.5mm;">
              <thead class="styTableThead">
                <tr>
                  <th class="styTableCell" scope="col" style="width:10mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Corp. No. </th>
                  <th class="styTableCell" scope="col" style="width:59.5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Name and address of corporation </th>
                  <th class="styTableCell" scope="col" style="width:32mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Employer identification number </th>
                  <th class="styTableCell" scope="col" style="width:40mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Portion of overpayment credits and estimated tax payments </th>
                  <th class="styTableCell" scope="col" style="width:40mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">Portion of tax deposited with Form 7004 </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!-- Part I Table row 1 for inline format-->
                <tr>
                  <td valign="middle" class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;font-weight:bold;text-align:left;border-color:black;">
                    <!-- Choice option of input Corporation Number is blank or separated format is selected then the default number 1 would display -->
                    <xsl:choose>
                      <!-- When there is no data or the separated data tag is switched, fill the box with just a 1 -->
                      <xsl:when test="(not($Form851Data/CommonParentCorporationInfo)) or ($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9)">
						1
					  </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNumber"/>
                        </xsl:call-template>
                      </xsl:otherwise>
                    </xsl:choose>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:55mm;font-size:7pt;border-color:black;text-align:left;">Common parent corporation
					<span style="width:1px;"/>
                    <!--<span style="letter-spacing:3mm;">.....</span>-->
                  </td>
                  <td class="styTableCell" style="width:32mm;background-color:lightgrey;border-color:black;">
                    <span style="width:1px;"/>
                  </td>
                  <td class="styTableCell" style="width:40mm;text-align:right;font-size:7pt;border-style:solid;border-color:black;">
                    <!-- If the separated data tag is not switched, populate with data -->
                    <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PortionOfCrAndEstTaxPayments"/>
                      </xsl:call-template>
                    </xsl:if>
                    <span style="width:1px;"/>
                  </td>
                  <td class="styTableCell" style="width:40mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                    <!-- If the separated data tag is not switched, populate with data -->
                    <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PortionOfTaxDepositedWith7004"/>
                      </xsl:call-template>
                    </xsl:if>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <!-- Part I Table row 2 repeated line for inline format-->
                <!-- If the separated data tag is not switched, populate the rest of the table's rows -->
                <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                  <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo">
                    <tr>
                      <!--Column 1 of Part I row 2 for inline format -->
                      <td valign="middle" class="styTableCell" style="width:7mm;font-size:7pt;font-weight:bold;text-align:left;border-color:black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CorporationNumber"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                      <!--Column 2 of Part I row 2 for inline format -->
                      <td valign="top" class="styTableCell" style="width:55mm;font-size:7pt;border-color:black;text-align:left;">
                        <xsl:if test="position()=1">
						  Subsidiary corporations:<br/>
                        </xsl:if>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                        <xsl:if test="CorporationName/BusinessNameLine2!=''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </xsl:if>
                        <!-- Subsidiary Corporation Address -->
                        <xsl:choose>
                          <!-- US Address -->
                          <xsl:when test="CorporationUSAddress">
                            <xsl:if test="CorporationUSAddress/AddressLine1!=''">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="CorporationUSAddress/AddressLine1"/>
                              </xsl:call-template>
                              <span class="styTableCellPad"/>
                            </xsl:if>
                            <xsl:if test="CorporationUSAddress/AddressLine2!=''">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="CorporationUSAddress/AddressLine2"/>
                              </xsl:call-template>
                              <span class="styTableCellPad"/>
                            </xsl:if>
                            <xsl:if test="CorporationUSAddress/City!=''">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="CorporationUSAddress/City"/>
                              </xsl:call-template>
                              <span class="styTableCellPad"/>
                            </xsl:if>
                            <xsl:if test="CorporationUSAddress/State!=''">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="CorporationUSAddress/State"/>
                              </xsl:call-template>
                              <span class="styTableCellPad"/>
                            </xsl:if>
                            <xsl:if test="CorporationUSAddress/ZIPCode!=''">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="CorporationUSAddress/ZIPCode"/>
                              </xsl:call-template>
                              <span class="styTableCellPad"/>
                            </xsl:if>
                          </xsl:when>
                          <xsl:otherwise>
                            <!-- Foreign Address -->
                            <xsl:if test="CorporationForeignAddress/AddressLine1!=''">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="CorporationForeignAddress/AddressLine1"/>
                              </xsl:call-template>
                              <span class="styTableCellPad"/>
                            </xsl:if>
                            <xsl:if test="CorporationForeignAddress/AddressLine2!=''">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="CorporationForeignAddress/AddressLine2"/>
                              </xsl:call-template>
                              <span class="styTableCellPad"/>
                            </xsl:if>
                            <xsl:if test="CorporationForeignAddress/City!=''">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="CorporationForeignAddress/City"/>
                              </xsl:call-template>
                              <span class="styTableCellPad"/>
                            </xsl:if>
                            <xsl:if test="CorporationForeignAddress/ProvinceOrState!=''">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="CorporationForeignAddress/ProvinceOrState"/>
                              </xsl:call-template>
                              <span class="styTableCellPad"/>
                            </xsl:if>
                            <xsl:if test="CorporationForeignAddress/Country!=''">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="CorporationForeignAddress/Country"/>
                              </xsl:call-template>
                              <span class="styTableCellPad"/>
                            </xsl:if>
                            <xsl:if test="CorporationForeignAddress/PostalCode!=''">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="CorporationForeignAddress/PostalCode"/>
                              </xsl:call-template>
                              <span class="styTableCellPad"/>
                            </xsl:if>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="CorporationNameControl!=''">
                          <br/>
						  Corporation Name Control: 
						  <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CorporationNameControl"/>
                          </xsl:call-template>
                        </xsl:if>
                      </td>
                      <!--Column 3 of Part I row 2 for inline format -->
                      <td class="styTableCell" style="width:32mm;font-size:7pt;border-style:solid;border-color:black;text-align:center;">
                        <xsl:choose>
                          <xsl:when test="CorporationEIN">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="CorporationEIN"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                            </xsl:call-template>
                          </xsl:otherwise>
                        </xsl:choose>
                        <span class="styTableCellPad"/>
                      </td>
                      <!--Column 4 of Part I row 2 for inline format -->
                      <td class="styTableCell" style="width:40mm;font-size:7pt;border-color:black;text-align:right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="PortionOfCrAndEstTaxPayments"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                      <!--Column 5 of Part I row 2 for inline format -->
                      <td class="styTableCell" style="width:40mm;font-size:7pt;text-align:right;border-color:black;border-right:none;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="PortionOfTaxDepositedWith7004"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!-- Start Part I row 2 repeat data for Empty table in separated print format -->
                <!-- Filler rows which are used when there is not enough data to match the PDF or when the separated data parameter is set for row 2-->
                <!--Display empty row for Part I line 2 -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;1) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                  <tr style="width:187mm;">
                    <!--Column 1 of Part I row 2 repeat data table-->
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;font-weight:bold;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!--Column 2 of Part I row 2 repeat data table-->
                    <td class="styTableCell" style="width:55mm;height:10mm;font-size:7pt;border-color:black;text-align:left;vertical-align:top;">Subsidiary corporations:<br/>
                      <!-- Part I row 2 repeat data for empty table with the See additional Data Message -->
                      <xsl:if test="($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9)">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo"/>
                        </xsl:call-template>
                      </xsl:if>
                      <span class="styTableCellPad"/>
                    </td>
                    <!--Column 3 of Part I row 2 repeat data table-->
                    <td class="styTableCell" style="width:32mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!--Column 4 of Part I row 2 repeat data table-->
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!--Column 5 of Part I row 2 repeat data table-->
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Display empty row for Part I line 3 -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;2) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;font-weight:bold;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:55mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:32mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Display empty row for Part I line 4 -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt; 3) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;font-weight:bold;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:55mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:32mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Display empty row for Part I line 5 -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt; 4) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;font-weight:bold;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:55mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:32mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Display empty row for Part I line 6 -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt; 5) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;font-weight:bold;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:55mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:32mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Display empty row for Part I line 7 -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt; 6) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;font-weight:bold;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:55mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:32mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Display empty row for Part I line 8 -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt; 7) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;font-weight:bold;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:55mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:32mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Display empty row for Part I line 9 -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt; 8) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;font-weight:bold;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:55mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:32mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Display empty row for Part I line 10 -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt; 9) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;font-weight:bold;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:55mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:32mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Part I Totals Line for inline format-->
                <tr>
                  <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;border-right:none; border-bottom-width: 0px">
                    <span style="float:left;"/>
                  </td>
                  <td colspan="2" class="styTableCell" style="width:100mm;height:10mm;font-size:7pt;text-align:left;border-color:black; border-bottom-width: 0px">
                    <span style="text-align:left;">
                      <b>Totals</b>
                      <span style="width:1mm;"/>(Must equal amounts shown on the consolidated tax return.)
					  <span style="width:1px;font-weight:bold;">.</span>
                      <img src="{$ImagePath}/851_Bullet_Lg.gif" alt="Right pointing arrow large image" width="4"/>
                    </span>
                  </td>
                  <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;text-align:right; border-bottom-width: 0px">
                    <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form851Data/TotalCreditsAndEstTaxPayments"/>
                      </xsl:call-template>
                    </xsl:if>
                    <span style="width:1px;"/>
                  </td>
                  <td class="styTableCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;border-right:none;text-align:right; border-bottom-width: 0px">
                    <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form851Data/TotalTaxDepositedWithForm7004"/>
                      </xsl:call-template>
                    </xsl:if>
                    <span style="width:1px;"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--Part I toggle button at the end of the table -->
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo"/>
            <xsl:with-param name="containerHeight" select="10"/>
            <xsl:with-param name="headerHeight" select="2"/>
            <xsl:with-param name="containerID" select=" 'TPctn' "/>
          </xsl:call-template>
          <!--@@@PART II TABLE@@@-->
          <!-- Part II table for inline format Begin-->
          <div class="styBB" style="width:187mm;">
            <span class="styPartName" style="width:16mm;">Part II</span>
            <span style="width:158mm;" class="styPartDesc">Principal Business Activity, Voting  Stock Information, Etc.<span style="width:1px;"/>
              <span class="styNormalText">  (see instructions)</span>
            </span>
          </div>
          <!--Part II table for inline print format -->
          <div style="width:187mm;clear:both;float:none;">
            <xsl:call-template name="SetInitialState"/>
            <div class="styTableContainer" style="width:182.5mm;overflow-y:visible;border-bottom-width:0px;">
              <table cellspacing="0" summary="Table describing Principal Business Activity, Voting Stock information, etc. (See instructions)">
                <thead class="styTableThead">
                  <tr>
                    <th class="styTableCell" rowspan="2" scope="col" style="width:12mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Corp. No.</th>
                    <th class="styTableCell" rowspan="2" scope="col" style="width:43mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Principal business activity (PBA)</th>
                    <th class="styTableCell" rowspan="2" scope="col" style="width:12mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">PBA Code No.</th>
                    <th class="styTableCell" colspan="2" scope="col" style="width:24mm;text-align:center;font-size:7pt;font-weight:normal;border-style:solid;border-color:black;border-top:none;border-left:none;border-width:1px;;">
					  Did the subsidiary make any nondividend distributions?
					</th>
                    <th class="styTableCell" scope="col" colspan="4" style="width:95mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">
					  Stock holdings at beginning of year
					</th>
                  </tr>
                  <tr>
                    <th class="styTableCell" scope="col" style="width:12mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Yes</th>
                    <th class="styTableCell" scope="col" style="width:12mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">No</th>
                    <th class="styTableCell" scope="col" style="width:32mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Number of shares</th>
                    <th class="styTableCell" scope="col" style="width:21mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Percent of voting power</th>
                    <th class="styTableCell" scope="col" style="width:21mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Percent of value</th>
                    <th class="styTableCell" scope="col" style="width:21mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">Owned by corporation no.</th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <tr style="height: 10mm">
                    <!--Column 1 of Part II line 1  of Parent Corp for inline format-->
                    <td valign="middle" class="styTableCell" style="width:12mm;text-align:left;font-size:7pt;font-weight:bold;border-color:black;">
                      <!-- Choice option of input Corporation Number is blank or separated format is selected then the default number 1 would display -->
                      <xsl:choose>
                      <!-- When there is no data or the separated data tag is switched, fill the box with just a 1 -->
                        <xsl:when test="(not($Form851Data/CommonParentCorporationInfo)) or ($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9)">
						  1
					    </xsl:when>
                        <xsl:otherwise>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNumber"/>
                          </xsl:call-template>
                        </xsl:otherwise>
                      </xsl:choose>
                      <span style="width:1px;"/>
                    </td>
                    <!-- Column 2 of Part II line 1 - Parent Corp for inline format -->
                    <td valign="middle" class="styTableCell" style="width:43mm;text-align:left;font-size:7pt;border-color:black;">Common parent corporation<br/>
                      <!-- If the separated data tag is not switched, populate with data -->
                      <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PBA"/>
                      </xsl:call-template>
                      </xsl:if>                      
                      <span style="width:1px;"/>
                    </td>
                    <!--Column 3 of Part II line 1  of Parent Corpfor inline print-->
                    <td valign="middle" class="styTableCell" style="width:12mm;text-align:center;font-size:7pt;border-color:black;border-right-width:1px;border-bottom-width:1px;">
                      <!-- If the separated data tag is not switched, populate with data -->
                      <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                      <xsl:choose>
                        <xsl:when test="$Form851Data/CommonParentCorporationInfo/PBACodeNumber">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PBACodeNumber"/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/InactivePBACodeNumber"/>
                          </xsl:call-template>
                        </xsl:otherwise>
                      </xsl:choose>
                      </xsl:if>                      
                      <span style="width:1px;"/>
                    </td>
                    <!--Column 4 of Part II line 1  of Parent Corpfor inline print-->
                    <td class="styTableCell" style="width:12mm;background-color:lightgrey;border-color:black;border-right-width:1px;border-bottom-width:1px;">
                      <span style="width:1px;"/>
                    </td>
                    <!--Column 5 of Part II line 1  of Parent Corpfor inline print-->
                    <td class="styTableCell" style="width:12mm;background-color:lightgrey;border-color:black;border-right-width:1px;border-bottom-width:1px;">
                      <span style="width:1px;"/>
                    </td>
                    <!--Column 6 of Part II line 1 for inline print-->
                    <td class="styTableCell" style="width:32mm;background-color:lightgrey;border-color:black;border-right-width:1px;border-bottom-width:1px;">
                      <span style="width:1px;"/>
                    </td>
                    <!--Column 7 of Part II line 1 for inline print-->
                    <td class="styTableCell" style="width:21mm;background-color:lightgrey;border-color:black;border-right-width:1px;border-bottom-width:1px;">
                      <span style="width:1px;"/>
                    </td>
                    <!--Column 8 of Part II line 1 for inline print-->
                    <td class="styTableCell" style="width:21mm;background-color:lightgrey;border-color:black;border-right-width:1px;border-bottom-width:1px;">
                      <span style="width:1px;"/>
                    </td>
                    <!--Column 9 of Part II line 1 for inline print-->
                    <td class="styTableCell" style="width:21mm;background-color:lightgrey;border-color:black;border-right-width:1px;border-bottom-width:1px;border-right:none;">
                      <span style="width:1px;"/>
                    </td>
                  </tr>
                  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                  <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo">
                    <tr style="height: 10mm">
                      <!--Column 1 of Part II LIne 2  of Subsidiary for inline print -->
                      <td valign="middle" class="styTableCell" style="width:12mm;">
                        <!--Row will span for column 1 Part II -->
                        <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
                        <xsl:attribute name="style"><xsl:value-of select="'width:12mm;text-align:left;font-size:7pt;font-weight:bold;border-color:black'"/></xsl:attribute>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CorporationNumber"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                        <span class="styTableCellPad"/>
                      </td>
                      <!--Column 2 of Part II LIne 2  of Subsidiary for inline print-->
                      <td valign="top" class="styTableCell" style="width:43mm;">
                        <!--Row will span for column 2 Part II -->
                        <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
                        <xsl:attribute name="style"><xsl:value-of select="'width:43mm;text-align:left;font-size:7pt;border-color:black;'"/></xsl:attribute>
                        <xsl:if test="position() = 1">
						Subsidiary corporations:<br/>
                        </xsl:if>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PBA"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <!--Column 3 of Part II LIne 2 of Subsidiary for inline print -->
                      <td valign="middle" class="styTableCell" style="width:12mm;">
                        <!--Row will span for column 3 Part II -->
                        <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
                        <xsl:attribute name="style"><xsl:value-of select="'width:12mm;text-align:center;font-size:7pt;border-color:black;'"/></xsl:attribute>
                        <xsl:choose>
                          <xsl:when test="PBACodeNumber">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="PBACodeNumber"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="InactivePBACodeNumber"/>
                            </xsl:call-template>
                          </xsl:otherwise>
                        </xsl:choose>
                        <span class="styTableCellPad"/>
                      </td>
                      <!--Column 4  Yes of Part II LIne 2 of Subsidiary for inline print -->
                      <td valign="middle" class="styTableCell" style="width:12mm;">
                        <!--Row will span for column 4 Part II -->
                        <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
                        <xsl:attribute name="style"><xsl:value-of select="'width:12mm;text-align:center;font-size:7pt;border-color:black;'"/></xsl:attribute>
                        <xsl:call-template name="PopulateYesBoxText">
                          <xsl:with-param name="TargetNode" select="MadeNondividendDistributions"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                        <span class="styTableCellPad"/>
                      </td>
                      <!--Column 5 NO of Part II LIne 2 of Subsidiary for inline print -->
                      <td valign="middle" class="styTableCell" style="width:12mm;">
                        <!--Row will span for column 5 Part II -->
                        <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
                        <xsl:attribute name="style"><xsl:value-of select="'width:12mm;text-align:center;font-size:7pt;border-color:black;'"/></xsl:attribute>
                        <xsl:call-template name="PopulateNoBoxText">
                          <xsl:with-param name="TargetNode" select="MadeNondividendDistributions"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                        <span class="styTableCellPad"/>
                      </td>
                      <!-- First Instance of Column 6 Through 9 Below. The remaining repeating Column 6 Through 9 will be handled by the for-each loop-->
                      <td valign="middle" class="styTableCell" style="width:21mm;">
                        <xsl:attribute name="style"><xsl:value-of select="'width:32mm;text-align:right;font-size:7pt;border-color:black;'"/></xsl:attribute>
                        <span style="width:30mm; vertical-align:bottom;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/NumberOfShares"/>
                          </xsl:call-template>
                          <span style="width:1px;"/>
                          <span class="styTableCellPad"/>
                        </span>
                      </td>
                      <td valign="middle" class="styTableCell" style="width:21mm;">
                        <xsl:attribute name="style"><xsl:value-of select="'width:21mm;text-align:right;font-size:7pt;border-color:black;'"/></xsl:attribute>
                        <xsl:choose>
                          <xsl:when test="normalize-space(StockHoldingInfo[1]/PercentOfVotingPower)=''">
                            <span style="width:2px;">%</span>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/PercentOfVotingPower"/>
                            </xsl:call-template>
                          </xsl:otherwise>
                        </xsl:choose>
                        <span class="styTableCellPad"/>
                      </td>
                      <td valign="middle" class="styTableCell" style="width:21mm;">
                        <xsl:attribute name="style"><xsl:value-of select="'width:21mm;text-align:right;font-size:7pt;border-color:black;'"/></xsl:attribute>
                        <xsl:choose>
                          <xsl:when test="normalize-space(StockHoldingInfo[1]/PercentOfValue)=''">
                            <span style="width:2px;">%</span>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/PercentOfValue"/>
                            </xsl:call-template>
                          </xsl:otherwise>
                        </xsl:choose>
                        <span class="styTableCellPad"/>
                      </td>
                      <td valign="middle" class="styTableCell" style="width:21mm;">
                        <xsl:attribute name="style"><xsl:value-of select="'width:21mm;text-align:left;font-size:7pt;border-color:black;border-right:none;'"/></xsl:attribute>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/OwnedByCorporationNumber"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <!--Column 6 to 9 of Part II will repeat-->
                    <xsl:for-each select="StockHoldingInfo">
                      <xsl:if test="position() &gt; 1">
                        <tr>
                          <!--Column 6 of Part II LIne 2 of Subsidiary for inline print-->
                          <td valign="middle" class="styTableCell" style="width:21mm;">
                            <xsl:attribute name="style"><xsl:value-of select="'width:32mm;text-align:right;font-size:7pt;border-color:black;'"/></xsl:attribute>
                            <span style="width:30mm; vertical-align:bottom;">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="NumberOfShares"/>
                              </xsl:call-template>
                              <span style="width:1px;"/>
                              <span class="styTableCellPad"/>
                            </span>
                          </td>
                          <!--Column 7 of Part II LIne 2 of Subsidiary for inline print -->
                          <td valign="middle" class="styTableCell" style="width:21mm;">
                            <xsl:attribute name="style"><xsl:value-of select="'width:21mm;text-align:right;font-size:7pt;border-color:black;'"/></xsl:attribute>
                            <xsl:choose>
                              <xsl:when test="normalize-space(PercentOfVotingPower)=''">
                                <span style="width:2px;">%</span>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:call-template name="PopulatePercent">
                                  <xsl:with-param name="TargetNode" select="PercentOfVotingPower"/>
                                </xsl:call-template>
                              </xsl:otherwise>
                            </xsl:choose>
                            <span class="styTableCellPad"/>
                          </td>
                          <!--Column 8 of Part II LIne 2 of Subsidiary for inline print -->
                          <td valign="middle" class="styTableCell" style="width:21mm;">
                            <xsl:attribute name="style"><xsl:value-of select="'width:21mm;text-align:right;font-size:7pt;border-color:black;'"/></xsl:attribute>
                            <xsl:choose>
                              <xsl:when test="normalize-space(PercentOfValue)=''">
                                <span style="width:2px;">%</span>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:call-template name="PopulatePercent">
                                  <xsl:with-param name="TargetNode" select="PercentOfValue"/>
                                </xsl:call-template>
                              </xsl:otherwise>
                            </xsl:choose>
                            <span class="styTableCellPad"/>
                          </td>
                          <!--Column 9 of Part II LIne 2 for inline print-->
                          <td valign="middle" class="styTableCell" style="width:21mm;">
                            <xsl:attribute name="style"><xsl:value-of select="'width:21mm;text-align:left;font-size:7pt;border-color:black;border-right:none;'"/></xsl:attribute>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="OwnedByCorporationNumber"/>
                            </xsl:call-template>
                            <span style="width:1px;"/>
                            <span class="styTableCellPad"/>
                          </td>
                        </tr>
                      </xsl:if>
                    </xsl:for-each>
                  </xsl:for-each>
                </xsl:if>
                
                  <!-- Part II Table Blank Line 1 -->
                  <!--<xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt; 1)">-->
                  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;1) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                    <tr style="height: 10mm;">
                      <td class="styTableCell" style="width:12mm;text-align:left;font-size:7pt;border-color:black;font-weight:bold;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:43mm;font-size:7pt;border-color:black;vertical-align:top;text-align:left;">Subsidiary corporations:<br/>
					    <br/>
                        <xsl:if test="($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9)">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo"/>
                        </xsl:call-template>
                        </xsl:if>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:32mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;border-right:none;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <!-- Part II Table Blank Line 2 -->
                  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;2) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                    <tr style="height: 10mm;">
                      <td class="styTableCell" style="width:12mm;text-align:left;font-size:7pt;border-color:black;font-weight:bold;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:43mm;font-size:7pt;border-color:black;vertical-align:top;text-align:left;"><br/>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:32mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;border-right:none;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <!-- Part II Table Blank Line 3 -->
                  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;3) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                    <tr style="height: 10mm;">
                      <td class="styTableCell" style="width:12mm;text-align:left;font-size:7pt;border-color:black;font-weight:bold;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:43mm;font-size:7pt;border-color:black;vertical-align:top;text-align:left;"><br/>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:32mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;border-right:none;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <!-- Part II Table Blank Line 4 -->
                  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;4) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                    <tr style="height: 10mm;">
                      <td class="styTableCell" style="width:12mm;text-align:left;font-size:7pt;border-color:black;font-weight:bold;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:43mm;font-size:7pt;border-color:black;vertical-align:top;text-align:left;"><br/>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:32mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;border-right:none;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <!-- Part II Table Blank Line 5 -->
                  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;5) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                    <tr style="height: 10mm;">
                      <td class="styTableCell" style="width:12mm;text-align:left;font-size:7pt;border-color:black;font-weight:bold;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:43mm;font-size:7pt;border-color:black;vertical-align:top;text-align:left;"><br/>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:32mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;border-right:none;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <!-- Part II Table Blank Line 6 -->
                  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;6) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                    <tr style="height: 10mm;">
                      <td class="styTableCell" style="width:12mm;text-align:left;font-size:7pt;border-color:black;font-weight:bold;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:43mm;font-size:7pt;border-color:black;vertical-align:top;text-align:left;"><br/>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:32mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;border-right:none;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <!-- Part II Table Blank Line 7 -->
                  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;7) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                    <tr style="height: 10mm;">
                      <td class="styTableCell" style="width:12mm;text-align:left;font-size:7pt;border-color:black;font-weight:bold;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:43mm;font-size:7pt;border-color:black;vertical-align:top;text-align:left;"><br/>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:32mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;border-right:none;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <!-- Part II Table Blank Line 8 -->
                  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;8) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                    <tr style="height: 10mm;">
                      <td class="styTableCell" style="width:12mm;text-align:left;font-size:7pt;border-color:black;font-weight:bold;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:43mm;font-size:7pt;border-color:black;vertical-align:top;text-align:left;"><br/>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:32mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;border-right:none;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <!-- Part II Table Blank Line 9 -->
                  <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;9) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                    <tr style="height: 10mm;">
                      <td class="styTableCell" style="width:12mm;text-align:left;font-size:7pt;border-color:black;font-weight:bold;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:43mm;font-size:7pt;border-color:black;vertical-align:top;text-align:left;"><br/>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:12mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:32mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;">
                        <span class="styTableCellPad" style="padding-right:1mm;">%</span>
                      </td>
                      <td class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;border-right:none;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                </tbody>
              </table>
            </div>
          </div>
          <!--Page 1 footer -->
          <div class="styIRS851PageBreak" style="width:187mm;padding-top:1mm;">
            <div style="float:left;width:100mm;font-weight:bold;">For Paperwork Reduction Act Notice, see instructions.</div>
            <div style="width:35mm;float:left;">Cat. No. 16880G</div>
            <div style="float:right;">Form <span style="font-weight:bold;font-size:7pt;">851</span> (Rev. 12-2010)</div>
          </div>
          <!--Page 2 start-->
          <div class="styBB" style="width:187mm;padding-bottom:.5mm;">
            <div style="float:left">Form 851 (Rev. 12-2010)</div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
            </div>
          </div>
          <!--@@@PART III TABLE @@@-->
          <div class="styBB" style="width:187mm;">
            <span class="styPartName" style="width:16mm;">Part III</span>
            <span style="width:158mm;" class="styPartDesc">Changes in Stock Holdings During the Tax Year<span style="width:1px;"/>
            </span>
          </div>
          <div style="width:187mm;clear:both;float:none;">
            <table class="styTable" cellspacing="0" summary="Table Changes in Stock Holdings During the Tax Year">
              <thead class="styTableThead">
                <tr>
                  <th class="styTableCell" rowspan="2" scope="col" style="width:10mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Corp. No.</th>
                  <th class="styTableCell" rowspan="2" scope="col" style="width:16mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Name of corporation  </th>
                  <th class="styTableCell" rowspan="2" scope="col" style="width:15mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Share-holder of Corporation No.</th>
                  <th class="styTableCell" rowspan="2" scope="col" style="width:24mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Date of transaction</th>
                  <th class="styTableCell" colspan="2" scope="col" style="width:70mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
                    <b>(a)</b> Changes</th>
                  <th class="styTableCell" colspan="2" scope="col" style="width:44mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">
                    <b>(b)  </b> Shares held after changes described in column (a)</th>
                </tr>
                <tr>
                  <th class="styTableCell" scope="col" style="width:35mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
          Number of shares acquired
        </th>
                  <th class="styTableCell" scope="col" style="width:35mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
          Number of shares disposed of
        </th>
                  <th class="styTableCell" scope="col" style="width:22mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
          Percent of voting power
        </th>
                  <th class="styTableCell" scope="col" style="width:22mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">
          Percent of value
        </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--START Part III, Line 1-->
                <tr>
                  <!--Column 1 of Part III for inline format -->
                  <td valign="middle" class="styTableCell" style="text-align: left; width:10mm;height:10mm;font-size:7pt;border-color:black;">
                    <!-- Choice option of input Corporation Number is blank or separated format is selected then the default number 1 would display -->
                      <xsl:choose>
                      <!-- When there is no data or the separated data tag is switched, fill the box with just a 1 -->
                        <xsl:when test="(not($Form851Data/CommonParentCorporationInfo)) or ($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9)">
						  1
					    </xsl:when>
                        <xsl:otherwise>
                          <xsl:attribute name="rowspan"><xsl:value-of select="count($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear)"/></xsl:attribute>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNumber"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                      </xsl:choose>
                    <span style="width:1px;"/>
                  </td>
                  <!--Column 2 of Part III for inline format -->
                  <td valign="top" class="styTableCell" style="width:54mm;height:5mm;font-size:7pt;text-align:left;border-color:black;">
                    <!-- If the separated data tag is not switched, populate with data -->
                      <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                      <!--Row to expand for column 2 of Part III-->
                    <xsl:attribute name="rowspan"><xsl:value-of select="count($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear)"/></xsl:attribute>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                      </xsl:if> 
                    <span style="width:1px;"/>
                  </td>
                  <!--Column 3 of Part III for inline format -->
                  <td valign="middle" class="styTableCell" style="width:15mm;height:5mm;font-size:7pt;border-color:black;text-align:left;">
                    <!-- If the separated data tag is not switched, populate with data -->
                      <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                      <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/ShareholderOfCorporationNumber"/>
                    </xsl:call-template>
                      </xsl:if>                       
                    <span style="width:1px;"/>
                  </td>
                  <!--Column 4 of Part III for inline format -->
                  <td valign="middle" class="styTableCell" style="width:21mm;height:5mm;font-size:7pt;border-color:black;text-align:center;">
					<!-- If the separated data tag is not switched, populate with data -->
                      <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                      <xsl:call-template name="PopulateMonthDayYear">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/TransactionDate"/>
                    </xsl:call-template>
                      </xsl:if>
                    <span style="width:1px;"/>
                  </td>
                  <!--Column 5 of Part III for inline format -->
                  <td valign="bottom" class="styTableCell" style="width:35mm;height:5mm;font-size:7pt;border-color:black;text-align:right;vertical-align:bottom;">
                    <!-- If the separated data tag is not switched, populate with data -->
                      <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                      <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/NumberOfSharesAcquired"/>
                    </xsl:call-template>
                      </xsl:if>
                    <span style="width:1px;"/>
                  </td>
                  <!--Column 6 of Part III for inline format -->
                  <td valign="bottom" class="styTableCell" style="width:35mm;height:5mm;font-size:7pt;border-color:black;text-align:right;">
                    <!-- If the separated data tag is not switched, populate with data -->
                      <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                      <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/NumberOfSharesDisposedOf"/>
                    </xsl:call-template>
                      </xsl:if> 
                    <span style="width:1px;"/>
                  </td>
                  <!--Column 7 of Part III for inline format -->
                  <td class="styTableCell" style="text-align:right;width:22mm;font-size:7pt;border-color:black;">
                    <!-- If the separated data tag is not switched, populate with data -->
                      <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                      <xsl:choose>
                      <xsl:when test="not($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/PercentOfVotingPower) or $Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/PercentOfVotingPower='' ">
                        <span style="width:2px;">%</span>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulatePercent">
                          <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/PercentOfVotingPower"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </xsl:otherwise>
                    </xsl:choose>
                      </xsl:if>                     
                    <span style="width:1px;"/>
                  </td>
                 <!--Column 8 %sign of Part III for inline format -->
                  <td class="styTableCell" style="text-align:right;width:22mm;font-size:7pt;border-color:black;border-right:none;">
                    <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                      <xsl:choose>
                      <xsl:when test="not($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/PercentOfVotingPower) or $Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/PercentOfValue='' ">
                        <span style="width:2px;text-align:right;">%</span>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulatePercent">
                          <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/PercentOfValue"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </xsl:otherwise>
                    </xsl:choose>
                      </xsl:if>                                         
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                <!--START Repeating Group For Part III, Line 1, Column 3-8-->
                <xsl:for-each select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear">
                  <xsl:if test="not(position() = 1)">
                    <tr>
                      <!--Column 3 of Part III for inline format -->
                      <td valign="middle" class="styTableCell" style="width:15mm;height:5mm;font-size:7pt;border-color:black;text-align:left;">
                        <!-- If the separated data tag is not switched, populate with data -->
                      
                      <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ShareholderOfCorporationNumber"/>
                        </xsl:call-template>
                                            
                        <span style="width:1px;"/>
                      </td>
                      <!--Column 4 of Part III for inline format -->
                      <td valign="middle" class="styTableCell" style="width:21mm;height:5mm;font-size:7pt;border-color:black;text-align:center;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransactionDate"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                      <!--Column 5 of Part III for inline format -->
                      <td valign="bottom" class="styTableCell" style="width:35mm;height:5mm;font-size:7pt;border-color:black;text-align:right;vertical-align:bottom;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="NumberOfSharesAcquired"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                     <!--Column 6 of Part III for inline format -->
                      <td valign="bottom" class="styTableCell" style="width:35mm;height:5mm;font-size:7pt;border-color:black;text-align:right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="NumberOfSharesDisposedOf"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                      <!--Column 7 of Part III for inline format -->
                      <xsl:choose>
                        <xsl:when test="PercentOfVotingPower='' ">
                          <td valign="middle" class="styTableCell" style="width:22mm;height:5mm;text-align:right;font-size:7pt;border-color:black;padding-right:4mm;">
                            <span style="width:2px;">%</span>
                          </td>
                        </xsl:when>
                        <xsl:otherwise>
                          <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="PercentOfVotingPower"/>
                            </xsl:call-template>
                            <span style="width:1px;"/>
                          </td>
                        </xsl:otherwise>
                      </xsl:choose>
                      <!--Column 8 %sign of Part III for inline format -->
                      <xsl:choose>
                        <xsl:when test="PercentOfValue='' ">
                          <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;padding-right:4mm;">
                            <span style="width:2px;text-align:right;">%</span>
                          </td>
                        </xsl:when>
                        <xsl:otherwise>
                          <!--Column 8 of Part III for inline format -->
                          <td class="styTableCell" style="text-align:right;width:22mm;font-size:7pt;border-color:black;border-right:none;">
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="PercentOfValue"/>
                            </xsl:call-template>
                            <span style="width:1px;"/>
                          </td>
                        </xsl:otherwise>
                      </xsl:choose>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
                </xsl:if> 
                <!--END Repeating Group For Part III, Line 1, Column 3-8-->
                <!--END Part III, Line 1-->
                <!--START Part III line 2 -->
                <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 8))">
                <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo">
                  <tr>
                    <!-- Column 1 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="height: 10mm; text-align: left; width:10mm;font-size:7pt;border-color:black;">
                      <!-- Row to span for column 1-->
                      <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingChangesForTaxYear)"/></xsl:attribute>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CorporationNumber"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                    <!-- Column 2 Part III line2 for inline format -->
                    <td valign="top" class="styTableCell" style="width:19mm;font-size:7pt;text-align:left;border-color:black;">
                      <!-- Row to span for column 2-->
                      <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingChangesForTaxYear)"/></xsl:attribute>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                      <xsl:if test="CorporationName/BusinessNameLine2!=''">
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </xsl:if>
                    </td>
                    <!-- Column 3 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:15mm;font-size:7pt;border-color:black;text-align:left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/ShareholderOfCorporationNumber"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                    <!-- Column 4 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;text-align:center;">
                      <xsl:call-template name="PopulateMonthDayYear">
                        <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/TransactionDate"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                    <!-- Column 5 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/NumberOfSharesAcquired"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                    <!-- Column 6 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/NumberOfSharesDisposedOf"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                    <!-- Column 7 Part III line2 for inline format -->
                    <xsl:choose>
                      <xsl:when test="PercentOfVotingPower=''">
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                        %
                      </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td valign="bottom" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                          <xsl:call-template name="PopulatePercent">
                            <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/PercentOfVotingPower"/>
                          </xsl:call-template>
                          <span style="width:1px;"/>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <!-- Column 8 Part III line2 for inline format -->
                    <xsl:choose>
                      <xsl:when test="PercentOfValue=''">
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                        %
                      </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td valign="bottom" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                          <xsl:call-template name="PopulatePercent">
                            <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/PercentOfValue"/>
                          </xsl:call-template>
                          <span style="width:1px;"/>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </tr>
                  <!--START Repeating Group For Part III line 2 Column 3-8-->
                  <xsl:for-each select="StockHoldingChangesForTaxYear">
                    <xsl:if test="position() &gt;1">
                      <tr>
                        <!-- Column 3 Part III line2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:15mm;font-size:7pt;border-color:black;text-align:left;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="ShareholderOfCorporationNumber"/>
                          </xsl:call-template>
                          <span style="width:1px;"/>
                        </td>
                        <!-- Column 4 Part III line2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;text-align:center;">
                          <xsl:call-template name="PopulateMonthDayYear">
                            <xsl:with-param name="TargetNode" select="TransactionDate"/>
                          </xsl:call-template>
                          <span style="width:1px;"/>
                        </td>
                        <!-- Column 5 Part III line2 for inline format -->
                        <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="NumberOfSharesAcquired"/>
                          </xsl:call-template>
                          <span style="width:1px;"/>
                        </td>
                        <!-- Column 6 Part III line2 for inline format -->
                        <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="NumberOfSharesDisposedOf"/>
                          </xsl:call-template>
                          <span style="width:1px;"/>
                        </td>
                        <!-- Column 7 Part III line2 for inline format -->
                        <xsl:choose>
                          <xsl:when test="PercentOfVotingPower=''">
                            <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                        %
                      </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td valign="bottom" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                              <xsl:call-template name="PopulatePercent">
                                <xsl:with-param name="TargetNode" select="PercentOfVotingPower"/>
                              </xsl:call-template>
                              <span style="width:1px;"/>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <!-- Column 8 Part III line2 for inline format -->
                        <xsl:choose>
                          <xsl:when test="PercentOfValue=''">
                            <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                        %
                      </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td valign="bottom" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                              <xsl:call-template name="PopulatePercent">
                                <xsl:with-param name="TargetNode" select="PercentOfValue"/>
                              </xsl:call-template>
                              <span style="width:1px;"/>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                      </tr>
                    </xsl:if>
                  </xsl:for-each>
                  <!--END Repeating Group For Part III line 2 Column 3-8-->
                </xsl:for-each>
                </xsl:if>
                <!--END Part III line 2 -->
                <!-- Part III line 1 empty row -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;1) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9))">
                <tr>
                    <!-- Column 1 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="height: 10mm; text-align: left; width:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 2 Part III line2 for inline format -->
                    <td valign="top" class="styTableCell" style="width:19mm;font-size:7pt;text-align:left;border-color:black;">
                      <xsl:if test="($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 9)">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo"/>
                        </xsl:call-template>
                        </xsl:if>
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 3 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:15mm;font-size:7pt;border-color:black;text-align:left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 4 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;text-align:center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 5 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 6 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 7 Part III line 2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                    <!-- Column 8 Part III line2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                  </tr>
                  </xsl:if>
                <!-- Part III line 2 empty row -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;2) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 8))">
                <tr>
                    <!-- Column 1 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="height: 10mm; text-align: left; width:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 2 Part III line2 for inline format -->
                    <td valign="top" class="styTableCell" style="width:19mm;font-size:7pt;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 3 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:15mm;font-size:7pt;border-color:black;text-align:left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 4 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;text-align:center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 5 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 6 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                    <!-- Column 8 Part III line2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                  </tr>
                </xsl:if>
				<!-- Part III line 3 empty row -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;3) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 8))">
                <tr>
                    <!-- Column 1 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="height: 10mm; text-align: left; width:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 2 Part III line2 for inline format -->
                    <td valign="top" class="styTableCell" style="width:19mm;font-size:7pt;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 3 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:15mm;font-size:7pt;border-color:black;text-align:left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 4 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;text-align:center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 5 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 6 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 7 Part III line 2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                    <!-- Column 8 Part III line2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                  </tr>
                </xsl:if>
                <!-- Part III line 4 empty row -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;4) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 8))">
                <tr>
                    <!-- Column 1 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="height: 10mm; text-align: left; width:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 2 Part III line2 for inline format -->
                    <td valign="top" class="styTableCell" style="width:19mm;font-size:7pt;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 3 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:15mm;font-size:7pt;border-color:black;text-align:left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 4 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;text-align:center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 5 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 6 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 7 Part III line 2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                    <!-- Column 8 Part III line2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                  </tr>
                </xsl:if>
                <!-- Part III line 5 empty row -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;5) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 8))">
                <tr>
                    <!-- Column 1 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="height: 10mm; text-align: left; width:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 2 Part III line2 for inline format -->
                    <td valign="top" class="styTableCell" style="width:19mm;font-size:7pt;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 3 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:15mm;font-size:7pt;border-color:black;text-align:left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 4 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;text-align:center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 5 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 6 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 7 Part III line 2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                    <!-- Column 8 Part III line2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                  </tr>
                </xsl:if>
                <!-- Part III line 6 empty row -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;6) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 8))">
                <tr>
                    <!-- Column 1 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="height: 10mm; text-align: left; width:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 2 Part III line2 for inline format -->
                    <td valign="top" class="styTableCell" style="width:19mm;font-size:7pt;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 3 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:15mm;font-size:7pt;border-color:black;text-align:left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 4 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;text-align:center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 5 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 6 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 7 Part III line 2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                    <!-- Column 8 Part III line2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                  </tr>
                </xsl:if>
                <!-- Part III line 7 empty row -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;7) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 8))">
                <tr>
                    <!-- Column 1 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="height: 10mm; text-align: left; width:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 2 Part III line2 for inline format -->
                    <td valign="top" class="styTableCell" style="width:19mm;font-size:7pt;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 3 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:15mm;font-size:7pt;border-color:black;text-align:left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 4 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;text-align:center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 5 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 6 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 7 Part III line 2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                    <!-- Column 8 Part III line2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                  </tr>
                </xsl:if>
                <!-- Part III line 8 empty row -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &lt;8) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo) &gt; 8))">
                <tr>
                    <!-- Column 1 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="height: 10mm; text-align: left; width:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 2 Part III line2 for inline format -->
                    <td valign="top" class="styTableCell" style="width:19mm;font-size:7pt;text-align:left;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 3 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:15mm;font-size:7pt;border-color:black;text-align:left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 4 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;text-align:center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 5 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 6 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 7 Part III line 2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                    <!-- Column 8 Part III line2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                        %
                        <span class="styTableCellPad"/>
                      </td>
                  </tr>
                </xsl:if>
              </tbody>
            </table>
          </div>
          <!-- Part III Line (c) row 1 -->
          <div style="width:187mm;float:none;clear:both;"/>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:2mm;">(c)</div>
            <div class="styLNDesc" style="width:179mm;">
			  If any transaction listed above caused a transfer of a share of subsidiary stock (defined to include dispositions and deconsolidations), 
			</div>
          </div>
          <!-- End of Part III line (c) row 1-->
          <!-- Part III Line (c) row 2 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" ></div>
            <div class="styLNDesc" style="width:155mm;">
			  <span style="float:left;">did the share's basis exceed its value at the time of the transfer? See instructions. </span>
			  <span class="styBoldText" style="padding-left:1mm;letter-spacing:2mm;">...............</span> 
			</div>
            <div class="styGenericDiv">
              <span style="float:right;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form851Data/RetainedShrExceedValAtTsfrTime"/>
                  </xsl:call-template>
                  <input class="styCkBox" type="checkbox" TabIndex="-1" name="Checkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form851Data/RetainedShrExceedValAtTsfrTime"/>
                      <xsl:with-param name="BackupName">IRS851RetainedShrExceedValAtTsfrTime</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form851Data/RetainedShrExceedValAtTsfrTime"/>
                    <xsl:with-param name="BackupName">IRS851RetainedShrExceedValAtTsfrTime</xsl:with-param>
                 </xsl:call-template>
                  <span style="width:2px;"/>
                  <b>Yes</b>
                </label>
                <span class="styBoldText" style="width:5mm;"/>
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form851Data/RetainedShrExceedValAtTsfrTime"/>
                  </xsl:call-template>
                  <input class="styCkBox" type="checkbox" TabIndex="-1" name="Checkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form851Data/RetainedShrExceedValAtTsfrTime"/>
                      <xsl:with-param name="BackupName">IRS851RetainedShrExceedValAtTsfrTime</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form851Data/RetainedShrExceedValAtTsfrTime"/>
                    <xsl:with-param name="BackupName">IRS851RetainedShrExceedValAtTsfrTime</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                  <b>No</b>
                </label>
              </span>
            </div>
          </div>
          <!-- End of Part III line (c) row 2-->
          <!-- Part III Line (d) row 1 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:2mm;">(d)</div>
            <div class="styLNDesc" style="width:179mm;">
			  Did any share of subsidiary stock become worthless within the meaning of section 165 (taking into account the provisions of
			</div>
          </div>
          <!-- End of Part III line (d) row 1-->
          <!-- Part III Line (d) row 2 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" ></div>
            <div class="styLNDesc" style="width:155mm;">
              <span style="float:left;">Regulations section 1.1502-80(c)) during the taxable year? See instructions. </span>    
              <span class="styBoldText" style="padding-left:1mm;letter-spacing:2mm;">..................</span>
            </div>
            <div class="styGenericDiv">
              <span style="float:right;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form851Data/ShareValueWorthlessUnderSec165"/>
                  </xsl:call-template>
                  <input class="styCkBox" type="checkbox" TabIndex="-1" name="Checkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form851Data/ShareValueWorthlessUnderSec165"/>
                      <xsl:with-param name="BackupName">IRS851ShareValueWorthlessUnderSec165</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form851Data/ShareValueWorthlessUnderSec165"/>
                    <xsl:with-param name="BackupName">IRS851ShareValueWorthlessUnderSec165</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                  <b>Yes</b>
                </label>
                <span class="styBoldText" style="width:5mm;"/>
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form851Data/ShareValueWorthlessUnderSec165"/>
                  </xsl:call-template>
                  <input class="styCkBox" type="checkbox" TabIndex="-1" name="Checkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form851Data/ShareValueWorthlessUnderSec165"/>
                      <xsl:with-param name="BackupName">IRS851ShareValueWorthlessUnderSec165</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form851Data/ShareValueWorthlessUnderSec165"/>
                    <xsl:with-param name="BackupName">IRS851ShareValueWorthlessUnderSec165</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                  <b>No</b>
                </label>
              </span>
            </div>
          </div>
          <!-- Part III Line (e) -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:2mm;">(e)</div>
            <div class="styLNDesc" style="width:168mm;height:4mm;">If the equitable owners of any capital stock shown above were other than the holders of record, provide details of the changes.</div>
            <div style="width:187mm;"/>
            <xsl:choose>
              <xsl:when test="not($Form851Data/OwnersNotRecordHoldersDetails)">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:when test="$Form851Data/OwnersNotRecordHoldersDetails = ''">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:otherwise>
                <div class="styBB" style="width:187mm;margin-left:0.75mm;text-align:justify;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form851Data/OwnersNotRecordHoldersDetails"/>
                  </xsl:call-template>
                </div>
              </xsl:otherwise>
            </xsl:choose>
          </div>
          <!--Part III Line (f) -->
          <div style="width:187mm;"/>
          <!-- Align data all the way to the left -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:2mm;">(f)</div>
            <div class="styLNDesc" style="width:168mm;height:4mm;">If additional stock was issued, or if any stock was retired during the year, list the dates and amounts of these transactions.</div>
            <div style="width:187mm;"/>
            <div class="styBB" style="width:187mm;text-align:justify;margin-left:0.75mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form851Data/StockPurchasedOrRetiredDetails"/>
              </xsl:call-template>
            </div>
          </div>
          <!--Page Footer -->
          <div class="styIRS851PageBreak" style="width:187mm;padding-top:1mm;">
            <div style="float:right;">Form <span style="font-weight:bold;font-size:7pt;">851</span> (Rev. 12-2010)</div>
          </div>
          <!--Page 3 start-->
          <div class="styBB" style="width:187mm;padding-bottom:.5mm;">
            <div style="float:left">Form 851 (Rev. 12-2010)</div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
            </div>
          </div>
          <!--Part IV -->
          <div class="styBB" style="width:187mm;border-top-width:0px">
            <span class="styPartName" style="width:16mm;">Part IV</span>
            <span style="width:151mm;" class="styPartDesc"> Additional Stock Information<span style="font-weight:normal;"> (see instructions)</span>
            </span>
          </div>
          <!--Part IV Line 1-->
          <div class="styBB" style="width:187mm;bottom-border:1px;">
            <div class="styLNLeftNumBox">1</div>
            <div class="styLNDesc" style="width:155mm;">
              <span style="float:left;">During the tax year, did the corporation have more than one class of stock outstanding? </span>    
              <span class="styBoldText" style="float:right;padding-right:1mm;letter-spacing:2mm;">.............</span>
            </div>
            <div class="styGenericDiv">
              <span style="float:right;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/MoreThanOneClassStkOutstd"/>
                  </xsl:call-template>
                  <input class="styCkBox" type="checkbox" TabIndex="-1" name="Checkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/MoreThanOneClassStkOutstd"/>
                      <xsl:with-param name="BackupName">IRS851MoreThanOneClassStkOutstd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/MoreThanOneClassStkOutstd"/>
                    <xsl:with-param name="BackupName">IRS851MoreThanOneClassStkOutstd</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                  <b>Yes</b>
                </label>
                <span class="styBoldText" style="width:5mm;"/>
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/MoreThanOneClassStkOutstd"/>
                  </xsl:call-template>
                  <input class="styCkBox" type="checkbox" TabIndex="-1" name="Checkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/MoreThanOneClassStkOutstd"/>
                      <xsl:with-param name="BackupName">IRS851MoreThanOneClassStkOutstd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/MoreThanOneClassStkOutstd"/>
                    <xsl:with-param name="BackupName">IRS851MoreThanOneClassStkOutstd</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                  <b>No</b>
                </label>
              </span>
            </div>
            <!--Part IV Line 1 row 2 -->
            <div style="width:165mm;float:left">
              <div class="styGenericDiv" style="width:150mm;padding-bottom:.5mm;padding-left:8mm;" >
				If "Yes," enter the name of the corporation and list and describe each class of stock.
			  </div>
            </div>
            <!--Table expand/collapse toggle button-->
            <div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
              <xsl:call-template name="SetTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
                <xsl:with-param name="containerHeight" select="4"/>
                <xsl:with-param name="headerHeight" select="2"/>
                <xsl:with-param name="containerID" select=" 'TPctnA1' "/>
                <xsl:with-param name="imageID" select=" 'TPimgA1' "/>
                <xsl:with-param name="buttonID" select=" 'TPbtnA1' "/>
              </xsl:call-template>
            </div>
            <!--Table expand/collapse toggle button end-->
          </div>
          <div class="styIRS851TableContainer1" id="TPctnA1">
            <xsl:call-template name="SetInitialState"/>
            <table cellspacing="0" style="width:182.5mm;">
              <tr>
                <th class="styTableCell" scope="col" rowspan="1" style="width:7mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Corp. No.</th>
                <th class="styTableCell" scope="col" rowspan="1" style="width:85mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Name of corporation</th>
                <th class="styTableCell" scope="col" rowspan="1" style="width:85mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">
        Class of stock
      </th>
              </tr>
              <!--Part IV table Row 1 for inline format -->
              <tr>
                <!-- Column 1 of Part IV for inline format -->
                <td valign="middle" class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNumber"/>
                    </xsl:call-template>
                  </xsl:if>
                  <span class="styTableCellPad"/>
                </td>
                <!-- Column 2 of Part IV for inline format -->
                <td valign="top" class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                  <xsl:choose>
                    <xsl:when test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                      </xsl:call-template>
                      <br/>
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
                      </xsl:call-template>
                    </xsl:otherwise>
                  </xsl:choose>
                  <span class="styTableCellPad"/>
                </td>
                <!-- Column 3 of Part IV for inline format -->
                <td valign="top" class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;text-align:left;border-color:black;border-right:none;">
                  <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/ClassesOfStock"/>
                    </xsl:call-template>
                  </xsl:if>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!-- Part IV table ??-->
              <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
                  <tr>
                    <!-- Column 1 of Part IV Line ? for inline format -->
                    <td valign="middle" class="styTableCell">
                      <xsl:choose>
                        <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                          <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-bottom-width: 0px'"/></xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;'"/></xsl:attribute>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="../CorporationNumber"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <!-- Column 2 of Part IV Line ? for inline format -->
                    <td valign="top" class="styTableCell">
                      <xsl:choose>
                        <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                          <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-bottom-width: 0px'"/></xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;'"/></xsl:attribute>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine1"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                      <xsl:if test="../CorporationName/BusinessNameLine2!=''">
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine2"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </xsl:if>
                    </td>
                    <!-- Column 3 of Part IV Line ? for inline format -->
                    <td valign="top" class="styTableCell">
                      <xsl:choose>
                        <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                          <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;text-align:left;border-color:black;border-right:none;border-bottom-width: 0px'"/></xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;text-align:left;border-color:black;border-right:none;'"/></xsl:attribute>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ClassesOfStock"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </xsl:if>
              <!-- Part IV Line 1 Empty table: Check if Additional Stock Information is less than 1 and greater than 3 or Separated print format is selected then display line 1 empty -->
              <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 1) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                <tr>
                  <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
              <!-- Part IV Line 1 Empty table: Check if Additional Stock Information is less than 1 and greater than 3 or Separated print format is selected then display line 2 empty -->
              <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 2) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                <tr>
                  <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
              <!-- Part IV Line 1 Empty table: Check if Additional Stock Information is less than 1 and greater than 3 or Separated print format is selected then display line 3 empty -->
              <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 3) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                <tr>
                  <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;border-bottom:none;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;border-bottom:none;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;border-right:none;border-bottom:none">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
            </table>
          </div>
          <!-- Part IV line 2 -->
          <div class="styBB" style="width:187mm;bottom-border:1px;">
            <div class="styLNLeftNumBox">2</div>
            <div class="styLNDesc" style="width:155mm;">
              During the tax year, was there any member of the consolidated group that reaffiliated within 60 months of 
              <span style="float:left;">disaffiliation? </span>    
              <span class="styBoldText" style="float:right;padding-right:1mm;letter-spacing:2mm;">..............................................</span>
            </div>
            <div style="height:4mm;" class="styGenericDiv">
              <br/>
              <span style="float:right;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/MemReaffltWithin60Mnth"/>
                  </xsl:call-template>
                  <input class="styCkBox" type="checkbox" TabIndex="-1" name="Checkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/MemReaffltWithin60Mnth"/>
                      <xsl:with-param name="BackupName">IRS851MemReaffltWithin60Mnth</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/MemReaffltWithin60Mnth"/>
                    <xsl:with-param name="BackupName">IRS851MemReaffltWithin60Mnth</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                  <b>Yes</b>
                </label>
                <span class="styBoldText" style="width:5mm;"/>
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/MemReaffltWithin60Mnth"/>
                  </xsl:call-template>
                  <input class="styCkBox" type="checkbox" TabIndex="-1" name="Checkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/MemReaffltWithin60Mnth"/>
                      <xsl:with-param name="BackupName">IRS851MemReaffltWithin60Mnth</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/MemReaffltWithin60Mnth"/>
                    <xsl:with-param name="BackupName">IRS851MemReaffltWithin60Mnth</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                  <b>No</b>
                </label>
              </span>
            </div>
            <!--Part IV Line 2 row 3 -->
            <div style="width:165mm;float:left">
              <div class="styLNLeftNumBox"/>
              <div class="styGenericDiv" style="width:150mm;">If "Yes," enter the name of the corporation(s) and explain the circumstances.</div>
            </div>
            <div>
              <!--Part IV Line 2  Table Begin -->
              <!--Table expand/collapse toggle button-->
              <span class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
                <xsl:call-template name="SetTableToggleButton">
                  <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
                  <xsl:with-param name="containerHeight" select="4"/>
                  <xsl:with-param name="headerHeight" select="2"/>
                  <xsl:with-param name="containerID" select=" 'TPctnB1' "/>
                  <xsl:with-param name="imageID" select=" 'TPimgB1' "/>
                  <xsl:with-param name="buttonID" select=" 'TPbtnB1' "/>
                </xsl:call-template>
              </span>
              <!--Table expand/collapse toggle button end-->
            </div>
          </div>
          <div class="styIRS851TableContainer1 " id="TPctnB1">
            <xsl:call-template name="SetInitialState"/>
            <table cellspacing="0" style="width:182.5mm;">
              <thead class="styTableThead">
                <tr>
                  <th class="styTableCell" scope="col" rowspan="1" style="width:7mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Corp. No.</th>
                  <th class="styTableCell" scope="col" rowspan="1" style="width:80mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Name of corporation</th>
                  <th class="styTableCell" scope="col" rowspan="1" style="width:85mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">
          Explanation
        </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <tr>
                  <!--Column 1 Part IV line 2 Table for inline format -->
                  <td valign="middle" class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                    <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNumber"/>
                      </xsl:call-template>
                    </xsl:if>
                    <span class="styTableCellPad"/>
                  </td>
                  <!--Column 2 Part IV line 2 Table Choice of inline or separated format -->
                  <td valign="top" class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                    <xsl:choose>
                      <xsl:when test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                        <xsl:call-template name="PopulateReturnHeaderFiler">
                          <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                        </xsl:call-template>
                        <br/>
                        <xsl:call-template name="PopulateReturnHeaderFiler">
                          <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
                        </xsl:call-template>
                      </xsl:otherwise>
                    </xsl:choose>
                    <span class="styTableCellPad"/>
                  </td>
                  <!--Column 2 Part IV line 2 Table for inline format -->
                  <xsl:if test="$Form851Data/CommonParentCorporationInfo/MemReaffltWithin60Mnth=1">
                    <td class="styTableCell" style="width:7.5mm;height:10mm;font-size:7pt;text-align:center;border-color:black;">
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/MemReaffltWithin60Mnth"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:7.5mm;height:10mm;font-size:7pt;text-align:center;border-color:black;">
                      <span style="width:1px;"/>
                    </td>
                  </xsl:if>
                  <!--Column 3 Part IV line 2 Table for inline format -->
                  <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;text-align:left;border-color:black;border-right:none;">
                    <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/Explanation"/>
                      </xsl:call-template>
                    </xsl:if>
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <!--Part IV line 2 for inline format when greater than 3 lines -->
                <xsl:if test="not(($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                  <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
                    <tr>
                      <!-- Column 1 of Part IV line 2 for inline format -->
                      <td valign="middle" class="styTableCell">
                        <xsl:choose>
                          <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                            <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-bottom-width: 0px'"/></xsl:attribute>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;'"/></xsl:attribute>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="../CorporationNumber"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <!-- Column 2 of Part IV line 2 for inline format -->
                      <td valign="top" class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                        <xsl:choose>
                          <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                            <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-bottom-width: 0px'"/></xsl:attribute>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;'"/></xsl:attribute>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine1"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                        <xsl:if test="../CorporationName/BusinessNameLine2!=''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </xsl:if>
                      </td>
                      <!-- Column 3 of Part IV line 2 for inline format -->
                      <td valign="top" class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;text-align:left;border-color:black;border-right:none;">
                        <xsl:choose>
                          <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                            <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;text-align:left;border-color:black;border-right:none;border-bottom-width: 0px'"/></xsl:attribute>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;text-align:left;border-color:black;border-right:none;'"/></xsl:attribute>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Explanation"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--Part IV Line 2 Empty table for row 1 -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 1) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Part IV Line 2 Empty table for row 2 -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 2) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Part IV Line 2 Empty table for row 3 -->
                <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 3) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;border-bottom-width: 0px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;border-bottom-width: 0px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;border-right:none;border-bottom-width: 0px">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
              </tbody>
            </table>
          </div>
          <!-- Part IV line 3 -->
          <div class="styBB" style="width:187mm;bottom-border:1px;">
            <div class="styLNLeftNumBox">3</div>
            <div class="styLNDesc" style="width:155mm;">
              During the tax year, was there any arrangement in existence by which one or more persons that were not members of 
              the affiliated group could acquire any stock, or acquire any voting power without acquiring stock, in the corporation, 
              <span style="float:left;">other than a de minimis amount, from the corporation or another member of the affiliated group? </span>    
              <span class="styBoldText" style="float:right;padding-right:1mm;letter-spacing:2mm;">..........</span>
            </div>
            <div class="styGeneriCDiv">
              <br/>
              <br/>
              <span style="float:right;">
                <span style="height:3mm;">
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/ArrngmExstNonMemAcqStkVotePwr"/>
                  </xsl:call-template>
                  <input class="styCkBox" type="checkbox" TabIndex="-1" name="Checkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/ArrngmExstNonMemAcqStkVotePwr"/>
                      <xsl:with-param name="BackupName">IRS851ArrngmExstNonMemAcqStkVotePwr</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/ArrngmExstNonMemAcqStkVotePwr"/>
                    <xsl:with-param name="BackupName">IRS851ArrngmExstNonMemAcqStkVotePwr</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                  <b>Yes</b>
                </label>
                <span class="styBoldText" style="width:5mm;"/>
                <span style="height:3mm;">
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/ArrngmExstNonMemAcqStkVotePwr"/>
                  </xsl:call-template>
                  <input class="styCkBox" type="checkbox" TabIndex="-1" name="Checkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/ArrngmExstNonMemAcqStkVotePwr"/>
                      <xsl:with-param name="BackupName">IRS851ArrngmExstNonMemAcqStkVotePwr</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation/ArrngmExstNonMemAcqStkVotePwr"/>
                    <xsl:with-param name="BackupName">IRS851ArrngmExstNonMemAcqStkVotePwr</xsl:with-param>
                 </xsl:call-template>
                  <span style="width:2px;"/>
                  <b>No</b>
                </label>
              </span>
            </div>
            <!--Part IV line 3 the if row -->
            <div class="styGenericDiv" style="width:187mm;height:4mm;">
              <div class="styLNLeftNumBox"/>
              <div style="width:165mm;padding-top:.5mm;" class="styGenericDiv">    
			    If "Yes," enter the name of the corporation and see the instructions for the percentages to enter in columns (a), (b), and (c).
			  </div>
              <!--Table expand/collapse toggle button-->
              <div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;padding-top:.5mm;">
                <xsl:call-template name="SetTableToggleButton">
                  <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
                  <xsl:with-param name="containerHeight" select="4"/>
                  <xsl:with-param name="headerHeight" select="2"/>
                  <xsl:with-param name="containerID" select=" 'TPctnC1' "/>
                  <xsl:with-param name="imageID" select=" 'TPimgC1' "/>
                  <xsl:with-param name="buttonID" select=" 'TPbtnC1' "/>
                </xsl:call-template>
              </div>
              <!--Table expand/collapse toggle button end-->
            </div>
          </div>
          <div class="styIRS851TableContainer1 " id="TPctnC1">
            <xsl:call-template name="SetInitialState"/>
            <table cellspacing="0" style="width:182.5mm;">
              <thead class="styTableThead">
                <tr>
                  <th class="styTableCell" scope="col" rowspan="1" style="width:7mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Corp. No.</th>
                  <th class="styTableCell" scope="col" rowspan="1" style="width:80mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Name of corporation</th>
                  <th class="styTableCell" scope="col" rowspan="1" style="width:27mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;"><b>(a)</b><br/>Percentage of value</th>
                  <th class="styTableCell" scope="col" rowspan="1" style="width:28mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;"><b>(b)</b><br/>Percent of outstanding voting stock</th>
                  <th class="styTableCell" scope="col" rowspan="1" style="width:29mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;"><b>(c)</b><br/>Percent of voting power</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <tr>
                  <td valign="middle" class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                    <!--<xsl:if test="not((count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated))">-->
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNumber"/>
                      </xsl:call-template>
                   <!-- </xsl:if>-->
                    <span class="styTableCellPad"/>
                  </td>
                  <td valign="top" class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                        <xsl:call-template name="PopulateReturnHeaderFiler">
                          <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                        </xsl:call-template>
                        <br/>
                        <xsl:call-template name="PopulateReturnHeaderFiler">
                          <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                        </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <!-- Common Parent Corporation Info - begin -->
                      <td class="styTableCell" style="width:27mm;height:10mm;font-size:7pt;border-color:black;">
                        <xsl:call-template name="PopulatePercent">
                          <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/PercentOfValue"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:27mm;height:5mm;text-align:right;font-size:7pt;border-color:black;">
                        <xsl:call-template name="PopulatePercent">
                          <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/PercentOutstandingVotingStock"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:26mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                        <xsl:call-template name="PopulatePercent">
                          <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/PercentOfVotingPower"/>
                        </xsl:call-template>
                      </td>
                </tr>
                <!-- Common Parent Corporation Info - end -->
                <!-- Subsidiary Corporation Info - begin -->
                <!--<xsl:if test="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation!=''">
                  <xsl:if test="not((count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated))">-->
                    <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
                      <tr>
                        <td valign="middle" class="styTableCell">
                          <xsl:choose>
                            <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                              <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-bottom-width: 0px'"/></xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;'"/></xsl:attribute>
                            </xsl:otherwise>
                          </xsl:choose>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="../CorporationNumber"/>
                          </xsl:call-template>
                        </td>
                        <td valign="top" class="styTableCell">
                          <xsl:choose>
                            <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                              <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-bottom-width: 0px'"/></xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;'"/></xsl:attribute>
                            </xsl:otherwise>
                          </xsl:choose>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                          <xsl:if test="../CorporationName/BusinessNameLine2!=''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine2"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                        </td>
                        <xsl:choose>
                          <xsl:when test="PercentOfValue!=''">
                            <td valign="middle" class="styTableCell" style="">
                              <xsl:choose>
                                <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                                  <xsl:attribute name="style"><xsl:value-of select="'width:27mm;height:10mm;font-size:7pt;border-color:black;border-bottom-width: 0px'"/></xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:attribute name="style"><xsl:value-of select="'width:27mm;height:10mm;font-size:7pt;border-color:black;'"/></xsl:attribute>
                                </xsl:otherwise>
                              </xsl:choose>
                              <xsl:call-template name="PopulatePercent">
                                <xsl:with-param name="TargetNode" select="PercentOfValue"/>
                              </xsl:call-template>
                              <span class="styTableCellPad"/>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td class="styTableCell" style="height:10mm;font-size:7pt;text-align:right;border-color:black;">
                              <xsl:choose>
                                <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                                  <xsl:attribute name="style"><xsl:value-of select="'height:10mm;font-size:7pt;text-align:right;border-color:black;border-bottom-width: 0px'"/></xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:attribute name="style"><xsl:value-of select="'height:10mm;font-size:7pt;text-align:right;border-color:black;'"/></xsl:attribute>
                                </xsl:otherwise>
                              </xsl:choose>
                              <span class="styTableCell" style="text-align:right;">%</span>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                          <xsl:when test="PercentOutstandingVotingStock!=''">
                            <td valign="middle" class="styTableCell">
                              <xsl:choose>
                                <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                                  <xsl:attribute name="style"><xsl:value-of select="'width:27mm;height:5mm;text-align:right;font-size:7pt;border-color:black;border-bottom-width: 0px'"/></xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:attribute name="style"><xsl:value-of select="'width:27mm;height:5mm;text-align:right;font-size:7pt;border-color:black;'"/></xsl:attribute>
                                </xsl:otherwise>
                              </xsl:choose>
                              <xsl:call-template name="PopulatePercent">
                                <xsl:with-param name="TargetNode" select="PercentOutstandingVotingStock"/>
                              </xsl:call-template>
                              <span class="styTableCellPad"/>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td valign="middle" class="styTableCell" style="height:5mm;text-align:right;font-size:7pt;border-color:black;">
                              <span class="styTableCell" style="text-align:right;">%</span>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                          <xsl:when test="PercentOfVotingPower!=''">
                            <td valign="middle" class="styTableCell">
                              <xsl:choose>
                                <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                                  <xsl:attribute name="style"><xsl:value-of select="'width:26mm;height:10mm;font-size:7pt;border-color:black;border-right:none;border-bottom-width: 0px'"/></xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:attribute name="style"><xsl:value-of select="'width:26mm;height:10mm;font-size:7pt;border-color:black;border-right:none;'"/></xsl:attribute>
                                </xsl:otherwise>
                              </xsl:choose>
                              <xsl:call-template name="PopulatePercent">
                                <xsl:with-param name="TargetNode" select="PercentOfVotingPower"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td valign="middle" class="styTableCell">
                              <xsl:choose>
                                <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                                  <xsl:attribute name="style"><xsl:value-of select="'height:10mm;font-size:7pt;text-align:right;border-color:black;border-right:none;border-bottom-width: 0px'"/></xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:attribute name="style"><xsl:value-of select="'height:10mm;font-size:7pt;text-align:right;border-color:black;border-right:none;'"/></xsl:attribute>
                                </xsl:otherwise>
                              </xsl:choose>
                              <span class="styTableCell" style="text-align:right;">%</span>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                      </tr>
                    </xsl:for-each>
                  <!--</xsl:if>
                </xsl:if>-->
                <!-- Subsidiary Corporation Info - end -->
                <!--<xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 1) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="height:10mm;font-size:7pt;border-color:black;">%</td>
                    <td class="styTableCell" style="height:10mm;font-size:7pt;border-color:black;">%</td>
                    <td class="styTableCell" style="height:10mm;font-size:7pt;border-color:black;border-right:none;">%</td>
                  </tr>
                </xsl:if>-->
                <!--<xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 2) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="height:10mm;font-size:7pt;border-color:black;text-align:right;">%</td>
                    <td class="styTableCell" style="height:10mm;font-size:7pt;border-color:black;">%</td>
                    <td class="styTableCell" style="height:10mm;font-size:7pt;border-color:black;border-right:none;">%</td>
                  </tr>
                </xsl:if>-->
                <!--<xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 3) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black; border-bottom-width: 0px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black; border-bottom-width: 0px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="height:10mm;font-size:7pt;border-color:black; border-bottom-width: 0px">%</td>
                    <td class="styTableCell" style="height:10mm;font-size:7pt;border-color:black; border-bottom-width: 0px">%</td>
                    <td class="styTableCell" style="height:10mm;font-size:7pt;border-color:black;border-right:none; border-bottom-width: 0px">%</td>
                  </tr>
                </xsl:if>-->
              </tbody>
            </table>
          </div>
          <div class="styBB" style="width:187mm;bottom-border:1px;">
            <!--Table expand/collapse toggle button-->
            <div class="styGenericDiv" style="float:right;clear:all;width:7mm;text-align:right;">
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
                <xsl:with-param name="containerHeight" select="4"/>
                <xsl:with-param name="containerID" select=" 'TPctnD1' "/>
                <xsl:with-param name="imageID" select=" 'TPimgD1' "/>
                <xsl:with-param name="buttonID" select=" 'TPbtnD1' "/>
              </xsl:call-template>
            </div>
            <!--Table expand/collapse toggle button end-->
          </div>
          <div class="styIRS851TableContainer2 " id="TPctnD1">
            <xsl:call-template name="SetInitialState"/>
            <table cellspacing="0" style="width:182.5mm;">
              <thead class="styTableThead">
                <tr>
                  <th class="styTableCell" scope="col" style="width:7mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Corp. No.</th>
                  <th class="styTableCell" scope="col" style="width:175mm;text-align:left;font-size:7pt;font-weight:normal;border-color:black;border-right:none;"><b>(d)</b> &#8212; Provide a description of any   arrangement.</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <tr>
                  <td valign="middle" class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                    <xsl:if test="not((count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated))">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNumber"/>
                      </xsl:call-template>
                    </xsl:if>
                    <span class="styTableCellPad"/>
                  </td>
                  <td valign="top" class="styTableCell" style="width:180mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-right:none;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/ArrangementDescForQuestion3"/>
                        </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <!--<xsl:if test="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation!=''">
                  <xsl:if test="not((count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated))">-->
                    <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
                      <tr>
                        <td valign="middle" class="styTableCell">
                          <xsl:choose>
                            <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                              <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-bottom-width: 0px'"/></xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;'"/></xsl:attribute>
                            </xsl:otherwise>
                          </xsl:choose>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="../CorporationNumber"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td valign="top" class="styTableCell">
                          <xsl:choose>
                            <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                              <xsl:attribute name="style"><xsl:value-of select="'width:175mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-right:none;border-bottom-width: 0px'"/></xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:attribute name="style"><xsl:value-of select="'width:175mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-right:none;'"/></xsl:attribute>
                            </xsl:otherwise>
                          </xsl:choose>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="ArrangementDescForQuestion3"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                    </xsl:for-each>
                 <!-- </xsl:if>
                </xsl:if>-->
                <!-- Part IV line 3 empty row 1 -->
                <!--<xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 1) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:175mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>-->
                <!-- Part IV line 3 empty row 2 -->
                <!--<xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 2) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:175mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>-->
                <!-- Part IV line 3 empty row 3 -->
                <!--<xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &lt; 3) or (($Print = $Separated) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;3))">
                  <tr>
                    <td class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black; border-bottom-width: 0px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:175mm;height:10mm;font-size:7pt;border-color:black;border-right:none;border-bottom-width: 0px">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>-->
              </tbody>
            </table>
          </div>
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation"/>
            <xsl:with-param name="containerHeight" select="4"/>
            <xsl:with-param name="containerID" select=" 'TPctnD1' "/>
          </xsl:call-template>
          <div style="width:187mm;padding-top:1mm;">
            <div style="float:right;">Form
			  <span style="font-weight:bold;font-size:7pt;">851</span> (Rev. 12-2010)
		    </div>
          </div>
          <!-- Left over data -->
          <br/>
          <br class="pageEnd"/>
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
          <!-- ADDITIONAL DATA TABLE -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form851Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
          <!--@@@PART I TABLE@@@-->
          <!-- Separated Print for Part I table -->
          <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &gt; 9) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">Form 851, Part I - Overpayment Credits, Estimated Tax Payments, and Tax Deposits:</span>
            <table class="styDepTbl" cellspacing="0" style="width:187mm;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col" style="width:10mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Corp. No.</th>
                  <th class="styDepTblCell" scope="col" style="width:59.5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Name and address of corporation</th>
                  <th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Employer identification number</th>
                  <th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
              Portion of overpayment credits and estimated tax payments
            </th>
                  <th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">
              Portion of tax deposited with Form 7004
            </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <tr class="styDepTblRow1">
                  <td valign="middle" class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;font-weight:bold;text-align:left;border-color:black;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNumber"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:55mm;font-size:7pt;border-color:black;text-align:left;">Common parent corporation
            <span style="width:1px;"/>
                    <span style="letter-spacing:3mm;">.....</span>
                  </td>
                  <td class="styTableCell" style="width:32mm;background-color:lightgrey;border-color:black;">
                    <span style="width:1px;"/>
                  </td>
                  <td class="styTableCell" style="width:40mm;text-align:right;font-size:7pt;border-style:solid;border-color:black;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PortionOfCrAndEstTaxPayments"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                  <td class="styTableCell" style="width:40mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PortionOfTaxDepositedWith7004"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo">
                  <tr>
                    <!-- Define background colors to the rows -->
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td valign="middle" class="styTableCell" style="width:7mm;font-size:7pt;font-weight:bold;text-align:left;border-color:black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CorporationNumber"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                    <td valign="top" class="styTableCell" style="width:55mm;font-size:7pt;border-color:black;text-align:left;">
                      <xsl:if test="position()=1">
              Subsidiary corporations:<br/>
                      </xsl:if>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                      <xsl:if test="CorporationName/BusinessNameLine2!=''">
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </xsl:if>
                      <!-- Subsidiary Corporation Address -->
                      <xsl:choose>
                        <!-- US Address -->
                        <xsl:when test="CorporationUSAddress">
                          <xsl:if test="CorporationUSAddress/AddressLine1!=''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CorporationUSAddress/AddressLine1"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="CorporationUSAddress/AddressLine2!=''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CorporationUSAddress/AddressLine2"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="CorporationUSAddress/City!=''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CorporationUSAddress/City"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="CorporationUSAddress/State!=''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CorporationUSAddress/State"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="CorporationUSAddress/ZIPCode!=''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CorporationUSAddress/ZIPCode"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                          <!-- Foreign Address -->
                          <xsl:if test="CorporationForeignAddress/AddressLine1!=''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CorporationForeignAddress/AddressLine1"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="CorporationForeignAddress/AddressLine2!=''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CorporationForeignAddress/AddressLine2"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="CorporationForeignAddress/City!=''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CorporationForeignAddress/City"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="CorporationForeignAddress/ProvinceOrState!=''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CorporationForeignAddress/ProvinceOrState"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="CorporationForeignAddress/Country!=''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CorporationForeignAddress/Country"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="CorporationForeignAddress/PostalCode!=''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CorporationForeignAddress/PostalCode"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:if test="CorporationNameControl!=''">
                        <br/>            
                Corporation Name Control: 
                <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CorporationNameControl"/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styTableCell" style="width:32mm;font-size:7pt;border-style:solid;border-color:black;text-align:center;">
                      <xsl:choose>
                        <xsl:when test="CorporationEIN">
                          <xsl:call-template name="PopulateEIN">
                            <xsl:with-param name="TargetNode" select="CorporationEIN"/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                          </xsl:call-template>
                        </xsl:otherwise>
                      </xsl:choose>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;font-size:7pt;border-color:black;text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="PortionOfCrAndEstTaxPayments"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                    <td class="styTableCell" style="width:40mm;font-size:7pt;text-align:right;border-color:black;border-right:none;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="PortionOfTaxDepositedWith7004"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                  </tr>
                </xsl:for-each>
                <tr class="styDepTblHdr">
                  <td colspan="3" class="styDepTblCell" style="width:100mm;height:10mm;font-size:7pt;text-align:left;border-color:black; border-bottom-width: 0px">
                    <span style="text-align:left;">
                      <b>Totals</b>
                      <span style="width:1mm;"/>(Must equal amounts shown on the consolidated tax return.)
              <span style="width:1px;font-weight:bold;">.</span>
                      <img src="{$ImagePath}/851_Bullet_Lg.gif" alt="Right pointing arrow large image" width="4"/>
                    </span>
                  </td>
                  <td class="styDepTblCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;text-align:right; border-bottom-width: 0px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form851Data/TotalCreditsAndEstTaxPayments"/>
                      <xsl:with-param name="WhiteFont">true</xsl:with-param>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                  <td class="styDepTblCell" style="width:40mm;height:10mm;font-size:7pt;border-color:black;border-right:none;text-align:right; border-bottom-width: 0px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form851Data/TotalTaxDepositedWithForm7004"/>
                      <xsl:with-param name="WhiteFont">true</xsl:with-param>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </xsl:if>          
		  <!--@@@PART II TABLE@@@-->
          <!-- Separated Print for Part II table -->
          <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &gt; 9) and ($Print = $Separated)">
         <br/>
          <span class="styRepeatingDataTitle">Form 851, Part II - Principal Business Activity, Voting Stock information, etc.:</span>
          <!--Part II table for inline print format -->
              <table class="styDepTbl" cellspacing="0" summary="Table describing Principal Business Activity, Voting Stock information, etc. (See instructions)" style="width:187mm;overflow-y:visible;border-bottom-width:0px;">
                <thead class="styTableThead">                  
                  <tr class="styDepTblHdr"> 
                    <th class="styDepTblCell" rowspan="2" scope="col" style="width:12mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Corp. No.</th>
                    <th class="styDepTblCell" rowspan="2" scope="col" style="width:43mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Principal business activity (PBA)</th>
                    <th class="styDepTblCell" rowspan="2" scope="col" style="width:12mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">PBA Code No.</th>
                    <th class="styDepTblCell" colspan="2" scope="col" style="width:24mm;text-align:center;font-size:7pt;font-weight:normal;border-style:solid;border-color:black;border-top:none;border-left:none;border-width:1px;;">
					  Did the subsidiary make any nondividend distributions?
					</th>
                    <th class="styDepTblCell" scope="col" colspan="4" style="width:95mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">
					  Stock holdings at beginning of year
					</th>
                  </tr>
                  <!-- Define background colors to the rows -->
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell" scope="col" style="width:12mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Yes</th>
                    <th class="styDepTblCell" scope="col" style="width:12mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">No</th>
                    <th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Number of shares</th>
                    <th class="styDepTblCell" scope="col" style="width:21mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Percent of voting power</th>
                    <th class="styDepTblCell" scope="col" style="width:21mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Percent of value</th>
                    <th class="styDepTblCell" scope="col" style="width:21mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">Owned by corporation no.</th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>                  
                  <tr class="styDepTblRow1" style="height: 10mm">
                    <!--Column 1 of Part II line 1  of Parent Corp for inline format-->
                    <td valign="middle" class="styTableCell" style="width:12mm;text-align:left;font-size:7pt;font-weight:bold;border-color:black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNumber"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                    <!-- Column 2 of Part II line 1 - Parent Corp for inline format -->
                    <td valign="middle" class="styTableCell" style="width:43mm;text-align:left;font-size:7pt;border-color:black;">Common parent corporation:<br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PBA"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                    <!--Column 3 of Part II line 1  of Parent Corpfor inline print-->
                    <td valign="middle" class="styTableCell" style="width:12mm;text-align:center;font-size:7pt;border-color:black;border-right-width:1px;border-bottom-width:1px;">
                      <!-- If the separated data tag is not switched, populate with data -->
                      <xsl:choose>
                        <xsl:when test="$Form851Data/CommonParentCorporationInfo/PBACodeNumber">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/PBACodeNumber"/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/InactivePBACodeNumber"/>
                          </xsl:call-template>
                        </xsl:otherwise>
                      </xsl:choose>
                      <span style="width:1px;"/>
                    </td>
                    <!--Column 4 of Part II line 1  of Parent Corpfor inline print-->
                    <td class="styTableCell" style="width:12mm;background-color:lightgrey;border-color:black;border-right-width:1px;border-bottom-width:1px;">
                      <span style="width:1px;"/>
                    </td>
                    <!--Column 5 of Part II line 1  of Parent Corpfor inline print-->
                    <td class="styTableCell" style="width:12mm;background-color:lightgrey;border-color:black;border-right-width:1px;border-bottom-width:1px;">
                      <span style="width:1px;"/>
                    </td>
                    <!--Column 6 of Part II line 1 for inline print-->
                    <td class="styTableCell" style="width:32mm;background-color:lightgrey;border-color:black;border-right-width:1px;border-bottom-width:1px;">
                      <span style="width:1px;"/>
                    </td>
                    <!--Column 7 of Part II line 1 for inline print-->
                    <td class="styTableCell" style="width:21mm;background-color:lightgrey;border-color:black;border-right-width:1px;border-bottom-width:1px;">
                      <span style="width:1px;"/>
                    </td>
                    <!--Column 8 of Part II line 1 for inline print-->
                    <td class="styTableCell" style="width:21mm;background-color:lightgrey;border-color:black;border-right-width:1px;border-bottom-width:1px;">
                      <span style="width:1px;"/>
                    </td>
                    <!--Column 9 of Part II line 1 for inline print-->
                    <td class="styTableCell" style="width:21mm;background-color:lightgrey;border-color:black;border-right-width:1px;border-bottom-width:1px;border-right:none;">
                      <span style="width:1px;"/>
                    </td>
                  </tr>
                  <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo">
                    <tr style="height: 10mm">
                      <!-- Define background colors to the rows -->
						  <xsl:attribute name="class">
						    <xsl:choose>
						      <xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when>
						      <xsl:otherwise>styDepTblRow1</xsl:otherwise>
						    </xsl:choose>
						  </xsl:attribute>
                      <!--Column 1 of Part II LIne 2  of Subsidiary for inline print -->
                      <td valign="middle" class="styTableCell" style="width:12mm;">
                        <!--Row will span for column 1 Part II -->
                        <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
                        <xsl:attribute name="style"><xsl:value-of select="'width:12mm;text-align:left;font-size:7pt;font-weight:bold;border-color:black'"/></xsl:attribute>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CorporationNumber"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                        <span class="styTableCellPad"/>
                      </td>
                      <!--Column 2 of Part II LIne 2  of Subsidiary for inline print-->
                      <td valign="top" class="styTableCell" style="width:43mm;">
                        <!--Row will span for column 2 Part II -->
                        <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
                        <xsl:attribute name="style"><xsl:value-of select="'width:43mm;text-align:left;font-size:7pt;border-color:black;'"/></xsl:attribute>
                        <xsl:if test="position() = 1">
						Subsidiary corporations:<br/>
                        </xsl:if>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PBA"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <!--Column 3 of Part II LIne 2 of Subsidiary for inline print -->
                      <td valign="middle" class="styTableCell" style="width:12mm;">
                        <!--Row will span for column 3 Part II -->
                        <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
                        <xsl:attribute name="style"><xsl:value-of select="'width:12mm;text-align:center;font-size:7pt;border-color:black;'"/></xsl:attribute>
                        <xsl:choose>
                          <xsl:when test="PBACodeNumber">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="PBACodeNumber"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="InactivePBACodeNumber"/>
                            </xsl:call-template>
                          </xsl:otherwise>
                        </xsl:choose>
                        <span class="styTableCellPad"/>
                      </td>
                      <!--Column 4  Yes of Part II LIne 2 of Subsidiary for inline print -->
                      <td valign="middle" class="styTableCell" style="width:12mm;">
                        <!--Row will span for column 4 Part II -->
                        <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
                        <xsl:attribute name="style"><xsl:value-of select="'width:12mm;text-align:center;font-size:7pt;border-color:black;'"/></xsl:attribute>
                        <xsl:call-template name="PopulateYesBoxText">
                          <xsl:with-param name="TargetNode" select="MadeNondividendDistributions"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                        <span class="styTableCellPad"/>
                      </td>
                      <!--Column 5 NO of Part II LIne 2 of Subsidiary for inline print -->
                      <td valign="middle" class="styTableCell" style="width:12mm;">
                        <!--Row will span for column 5 Part II -->
                        <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingInfo)"/></xsl:attribute>
                        <xsl:attribute name="style"><xsl:value-of select="'width:12mm;text-align:center;font-size:7pt;border-color:black;'"/></xsl:attribute>
                        <xsl:call-template name="PopulateNoBoxText">
                          <xsl:with-param name="TargetNode" select="MadeNondividendDistributions"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                        <span class="styTableCellPad"/>
                      </td>
                      <!-- First Instance of Column 6 Through 9 Below. The remaining repeating Column 6 Through 9 will be handled by the for-each loop-->
                      <td valign="middle" class="styTableCell" style="width:21mm;">
                        <xsl:attribute name="style"><xsl:value-of select="'width:32mm;text-align:right;font-size:7pt;border-color:black;'"/></xsl:attribute>
                        <span style="width:30mm; vertical-align:bottom;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/NumberOfShares"/>
                          </xsl:call-template>
                          <span style="width:1px;"/>
                          <span class="styTableCellPad"/>
                        </span>
                      </td>
                      <td valign="middle" class="styTableCell" style="width:21mm;">
                        <xsl:attribute name="style"><xsl:value-of select="'width:21mm;text-align:right;font-size:7pt;border-color:black;'"/></xsl:attribute>
                        <xsl:choose>
                          <xsl:when test="normalize-space(StockHoldingInfo[1]/PercentOfVotingPower)=''">
                            <span style="width:2px;">%</span>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/PercentOfVotingPower"/>
                            </xsl:call-template>
                          </xsl:otherwise>
                        </xsl:choose>
                        <span class="styTableCellPad"/>
                      </td>
                      <td valign="middle" class="styTableCell" style="width:21mm;">
                        <xsl:attribute name="style"><xsl:value-of select="'width:21mm;text-align:right;font-size:7pt;border-color:black;'"/></xsl:attribute>
                        <xsl:choose>
                          <xsl:when test="normalize-space(StockHoldingInfo[1]/PercentOfValue)=''">
                            <span style="width:2px;">%</span>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/PercentOfValue"/>
                            </xsl:call-template>
                          </xsl:otherwise>
                        </xsl:choose>
                        <span class="styTableCellPad"/>
                      </td>
                      <td valign="middle" class="styTableCell" style="width:21mm;">
                        <xsl:attribute name="style"><xsl:value-of select="'width:21mm;text-align:left;font-size:7pt;border-color:black;border-right:none;'"/></xsl:attribute>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="StockHoldingInfo[1]/OwnedByCorporationNumber"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <!--Column 6 to 9 of Part II will repeat-->
                    <xsl:for-each select="StockHoldingInfo">
                      <xsl:if test="position() &gt; 1">
                        <tr>
                          <!-- Define background colors to the rows -->
						  <xsl:attribute name="class">
						    <xsl:choose>
						      <xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when>
						      <xsl:otherwise>styDepTblRow1</xsl:otherwise>
						    </xsl:choose>
						  </xsl:attribute>
                          <!--Column 6 of Part II LIne 2 of Subsidiary for inline print-->
                          <td valign="middle" class="styTableCell" style="width:21mm;">
                            <xsl:attribute name="style"><xsl:value-of select="'width:32mm;text-align:right;font-size:7pt;border-color:black;'"/></xsl:attribute>
                            <span style="width:30mm; vertical-align:bottom;">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="NumberOfShares"/>
                              </xsl:call-template>
                              <span style="width:1px;"/>
                              <span class="styTableCellPad"/>
                            </span>
                          </td>
                          <!--Column 7 of Part II LIne 2 of Subsidiary for inline print -->
                          <td valign="middle" class="styTableCell" style="width:21mm;">
                            <xsl:attribute name="style"><xsl:value-of select="'width:21mm;text-align:right;font-size:7pt;border-color:black;'"/></xsl:attribute>
                            <xsl:choose>
                              <xsl:when test="normalize-space(PercentOfVotingPower)=''">
                                <span style="width:2px;">%</span>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:call-template name="PopulatePercent">
                                  <xsl:with-param name="TargetNode" select="PercentOfVotingPower"/>
                                </xsl:call-template>
                              </xsl:otherwise>
                            </xsl:choose>
                            <span class="styTableCellPad"/>
                          </td>
                          <!--Column 8 of Part II LIne 2 of Subsidiary for inline print -->
                          <td valign="middle" class="styTableCell" style="width:21mm;">
                            <xsl:attribute name="style"><xsl:value-of select="'width:21mm;text-align:right;font-size:7pt;border-color:black;'"/></xsl:attribute>
                            <xsl:choose>
                              <xsl:when test="normalize-space(PercentOfValue)=''">
                                <span style="width:2px;">%</span>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:call-template name="PopulatePercent">
                                  <xsl:with-param name="TargetNode" select="PercentOfValue"/>
                                </xsl:call-template>
                              </xsl:otherwise>
                            </xsl:choose>
                            <span class="styTableCellPad"/>
                          </td>
                          <!--Column 9 of Part II LIne 2 for inline print-->
                          <td valign="middle" class="styTableCell" style="width:21mm;">
                            <xsl:attribute name="style"><xsl:value-of select="'width:21mm;text-align:left;font-size:7pt;border-color:black;border-right:none;'"/></xsl:attribute>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="OwnedByCorporationNumber"/>
                            </xsl:call-template>
                            <span style="width:1px;"/>
                            <span class="styTableCellPad"/>
                          </td>
                        </tr>
                      </xsl:if>
                    </xsl:for-each>
                  </xsl:for-each>
                </tbody>
              </table>
            </xsl:if>
            <!--@@@PART III TABLE@@@-->
            <!-- Separated Print for Part III table -->
          <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo) &gt; 9) and ($Print = $Separated)">
            <br/>
            <span class="styRepeatingDataTitle">Form 851, Part III - Changes in Stock Holdings During the Tax Year:</span>
            <table class="styDepTbl" cellspacing="0" summary="Table Changes in Stock Holdings During the Tax Year" style="width:187mm;clear:both;float:none;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styTableCell" rowspan="2" scope="col" style="width:10mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Corp. No.</th>
                  <th class="styTableCell" rowspan="2" scope="col" style="width:16mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Name of corporation  </th>
                  <th class="styTableCell" rowspan="2" scope="col" style="width:15mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Share-holder of Corporation No.</th>
                  <th class="styTableCell" rowspan="2" scope="col" style="width:24mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Date of transaction</th>
                  <th class="styTableCell" colspan="2" scope="col" style="width:70mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
                    <b>(a)</b> Changes</th>
                  <th class="styTableCell" colspan="2" scope="col" style="width:44mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">
                    <b>(b)  </b> Shares held after changes described in column (a)</th>
                </tr>
                <tr class="styDepTblHdr">
                  <th class="styTableCell" scope="col" style="width:35mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Number of shares acquired </th>
                  <th class="styTableCell" scope="col" style="width:35mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Number of shares disposed of </th>
                  <th class="styTableCell" scope="col" style="width:22mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Percent of voting power </th>
                  <th class="styTableCell" scope="col" style="width:22mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">Percent of value </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--START Part III, Line 1-->
                <tr class="styDepTblRow1">
                  <!--Column 1 of Part III for inline format -->
                  <td valign="middle" class="styTableCell" style="text-align: left; width:10mm;height:10mm;font-size:7pt;border-color:black;">
                    <!--Row to expand for column 1 of Part III-->
                    <xsl:attribute name="rowspan"><xsl:value-of select="count($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear)"/></xsl:attribute>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNumber"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                  <!--Column 2 of Part III for inline format -->
                  <td valign="top" class="styTableCell" style="width:54mm;height:5mm;font-size:7pt;text-align:left;border-color:black;">
                    <!--Row to expand for column 2 of Part III-->
                    <xsl:attribute name="rowspan"><xsl:value-of select="count($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear)"/></xsl:attribute>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                  <!--Column 3 of Part III for inline format -->
                  <td valign="middle" class="styTableCell" style="width:15mm;height:5mm;font-size:7pt;border-color:black;text-align:left;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/ShareholderOfCorporationNumber"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                  <!--Column 4 of Part III for inline format -->
                  <td valign="middle" class="styTableCell" style="width:21mm;height:5mm;font-size:7pt;border-color:black;text-align:center;">
                    <xsl:call-template name="PopulateMonthDayYear">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/TransactionDate"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                  <!--Column 5 of Part III for inline format -->
                  <td valign="bottom" class="styTableCell" style="width:35mm;height:5mm;font-size:7pt;border-color:black;text-align:right;vertical-align:bottom;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/NumberOfSharesAcquired"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                  <!--Column 6 of Part III for inline format -->
                  <td valign="bottom" class="styTableCell" style="width:35mm;height:5mm;font-size:7pt;border-color:black;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/NumberOfSharesDisposedOf"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                  <!--Column 7 of Part III for inline format -->
                  <td class="styTableCell" style="text-align:right;width:22mm;font-size:7pt;border-color:black;">
                    <xsl:choose>
                      <xsl:when test="not($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/PercentOfVotingPower) or $Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/PercentOfVotingPower='' ">
                        <span style="width:2px;">%</span>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulatePercent">
                          <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/PercentOfVotingPower"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <!--Column 8 %sign of Part III for inline format -->
                  <td class="styTableCell" style="text-align:right;width:22mm;font-size:7pt;border-color:black;border-right:none;">
                    <xsl:choose>
                      <xsl:when test="not($Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/PercentOfVotingPower) or $Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/PercentOfValue='' ">
                        <span style="width:2px;text-align:right;">%</span>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulatePercent">
                          <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear[1]/PercentOfValue"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
                <!--START Repeating Group For Part III, Line 1, Column 3-8-->
                <xsl:for-each select="$Form851Data/CommonParentCorporationInfo/StockHoldingChangesForTaxYear">
                  <xsl:if test="not(position() = 1)">
                    <tr>
                      <!-- Define background colors to the rows -->
						  <xsl:attribute name="class">
						    <xsl:choose>
						      <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
						      <xsl:otherwise>styDepTblRow2</xsl:otherwise>
						    </xsl:choose>
						  </xsl:attribute>
                      <!--Column 3 of Part III for inline format -->
                      <td valign="middle" class="styTableCell" style="width:15mm;height:5mm;font-size:7pt;border-color:black;text-align:left;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ShareholderOfCorporationNumber"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                      <!--Column 4 of Part III for inline format -->
                      <td valign="middle" class="styTableCell" style="width:21mm;height:5mm;font-size:7pt;border-color:black;text-align:center;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransactionDate"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                      <!--Column 5 of Part III for inline format -->
                      <td valign="bottom" class="styTableCell" style="width:35mm;height:5mm;font-size:7pt;border-color:black;text-align:right;vertical-align:bottom;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="NumberOfSharesAcquired"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                      <!--Column 6 of Part III for inline format -->
                      <td valign="bottom" class="styTableCell" style="width:35mm;height:5mm;font-size:7pt;border-color:black;text-align:right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="NumberOfSharesDisposedOf"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                      <!--Column 7 of Part III for inline format -->
                      <xsl:choose>
                        <xsl:when test="PercentOfVotingPower='' ">
                          <td valign="middle" class="styTableCell" style="width:22mm;height:5mm;text-align:right;font-size:7pt;border-color:black;padding-right:4mm;">
                            <span style="width:2px;">%</span>
                          </td>
                        </xsl:when>
                        <xsl:otherwise>
                          <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="PercentOfVotingPower"/>
                            </xsl:call-template>
                            <span style="width:1px;"/>
                          </td>
                        </xsl:otherwise>
                      </xsl:choose>
                      <!--Column 8 %sign of Part III for inline format -->
                      <xsl:choose>
                        <xsl:when test="PercentOfValue='' ">
                          <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;padding-right:4mm;">
                            <span style="width:2px;text-align:right;">%</span>
                          </td>
                        </xsl:when>
                        <xsl:otherwise>
                          <!--Column 8 of Part III for inline format -->
                          <td class="styTableCell" style="text-align:right;width:22mm;font-size:7pt;border-color:black;border-right:none;">
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="PercentOfValue"/>
                            </xsl:call-template>
                            <span style="width:1px;"/>
                          </td>
                        </xsl:otherwise>
                      </xsl:choose>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
                <!--END Repeating Group For Part III, Line 1, Column 3-8-->
                <!--END Part III, Line 1-->
                <!--START Part III line 2 -->
                <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo">
                  <tr>
                    <!-- Define background colors to the rows -->
						  <xsl:attribute name="class">
						    <xsl:choose>
						      <xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when>
						      <xsl:otherwise>styDepTblRow1</xsl:otherwise>
						    </xsl:choose>
						  </xsl:attribute>
                    <!-- Column 1 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="height: 10mm; text-align: left; width:10mm;font-size:7pt;border-color:black;">
                      <!-- Row to span for column 1-->
                      <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingChangesForTaxYear)"/></xsl:attribute>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CorporationNumber"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                    <!-- Column 2 Part III line2 for inline format -->
                    <td valign="top" class="styTableCell" style="width:19mm;font-size:7pt;text-align:left;border-color:black;">
                      <!-- Row to span for column 2-->
                      <xsl:attribute name="rowspan"><xsl:value-of select="count(StockHoldingChangesForTaxYear)"/></xsl:attribute>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                      <xsl:if test="CorporationName/BusinessNameLine2!=''">
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </xsl:if>
                    </td>
                    <!-- Column 3 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:15mm;font-size:7pt;border-color:black;text-align:left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/ShareholderOfCorporationNumber"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                    <!-- Column 4 Part III line2 for inline format -->
                    <td valign="middle" class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;text-align:center;">
                      <xsl:call-template name="PopulateMonthDayYear">
                        <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/TransactionDate"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                    <!-- Column 5 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/NumberOfSharesAcquired"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                    <!-- Column 6 Part III line2 for inline format -->
                    <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/NumberOfSharesDisposedOf"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                    <!-- Column 7 Part III line2 for inline format -->
                    <xsl:choose>
                      <xsl:when test="PercentOfVotingPower=''">
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                        %
                      </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td valign="bottom" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                          <xsl:call-template name="PopulatePercent">
                            <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/PercentOfVotingPower"/>
                          </xsl:call-template>
                          <span style="width:1px;"/>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <!-- Column 8 Part III line2 for inline format -->
                    <xsl:choose>
                      <xsl:when test="PercentOfValue=''">
                        <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                        %
                      </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td valign="bottom" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                          <xsl:call-template name="PopulatePercent">
                            <xsl:with-param name="TargetNode" select="StockHoldingChangesForTaxYear[1]/PercentOfValue"/>
                          </xsl:call-template>
                          <span style="width:1px;"/>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </tr>
                  <!--START Repeating Group For Part III line 2 Column 3-8-->
                  <xsl:for-each select="StockHoldingChangesForTaxYear">
                    <xsl:if test="position() &gt;1">
                      <tr>
                        <!-- Define background colors to the rows -->
						  <xsl:attribute name="class">
						    <xsl:choose>
						      <xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when>
						      <xsl:otherwise>styDepTblRow1</xsl:otherwise>
						    </xsl:choose>
						  </xsl:attribute>
                        <!-- Column 3 Part III line2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:15mm;font-size:7pt;border-color:black;text-align:left;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="ShareholderOfCorporationNumber"/>
                          </xsl:call-template>
                          <span style="width:1px;"/>
                        </td>
                        <!-- Column 4 Part III line2 for inline format -->
                        <td valign="middle" class="styTableCell" style="width:21mm;font-size:7pt;border-color:black;text-align:center;">
                          <xsl:call-template name="PopulateMonthDayYear">
                            <xsl:with-param name="TargetNode" select="TransactionDate"/>
                          </xsl:call-template>
                          <span style="width:1px;"/>
                        </td>
                        <!-- Column 5 Part III line2 for inline format -->
                        <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="NumberOfSharesAcquired"/>
                          </xsl:call-template>
                          <span style="width:1px;"/>
                        </td>
                        <!-- Column 6 Part III line2 for inline format -->
                        <td valign="bottom" class="styTableCell" style="width:35mm;font-size:7pt;border-color:black;text-align:right;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="NumberOfSharesDisposedOf"/>
                          </xsl:call-template>
                          <span style="width:1px;"/>
                        </td>
                        <!-- Column 7 Part III line2 for inline format -->
                        <xsl:choose>
                          <xsl:when test="PercentOfVotingPower=''">
                            <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                        %
                      </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td valign="bottom" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                              <xsl:call-template name="PopulatePercent">
                                <xsl:with-param name="TargetNode" select="PercentOfVotingPower"/>
                              </xsl:call-template>
                              <span style="width:1px;"/>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <!-- Column 8 Part III line2 for inline format -->
                        <xsl:choose>
                          <xsl:when test="PercentOfValue=''">
                            <td valign="middle" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                        %
                      </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td valign="bottom" class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;border-right:none;">
                              <xsl:call-template name="PopulatePercent">
                                <xsl:with-param name="TargetNode" select="PercentOfValue"/>
                              </xsl:call-template>
                              <span style="width:1px;"/>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                      </tr>
                    </xsl:if>
                  </xsl:for-each>
                  <!--END Repeating Group For Part III line 2 Column 3-8-->
                </xsl:for-each>
                <!--END Part III line 2 -->
              </tbody>
            </table>
          </xsl:if>
          <!--@@@PART IV LINE 1@@@-->
          <!--Separated Print for PART IV LINE 1 -->
          <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated)">
            <br/>
            <span class="styRepeatingDataTitle">Form 851, Part IV, Line 1 - Additional Stock Information:</span>
            <table class="styDepTbl" cellspacing="0" style="width:187mm;">
              <tr class="styDepTblHdr">
                <th class="styDepTblCell" scope="col" rowspan="1" style="width:7mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Corp. No.</th>
                <th class="styDepTblCell" scope="col" rowspan="1" style="width:80mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Name of corporation</th>
                <th class="styDepTblCell" scope="col" rowspan="1" style="width:85mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">
            Class of stock
          </th>
              </tr>
              <tr class="styDepTblRow1">
                <td valign="middle" class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNumber"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td valign="top" class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                  </xsl:call-template>
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td valign="top" class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;text-align:left;border-color:black;border-right:none;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/ClassesOfStock"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
                <tr>
                  <!-- Define background colors to the rows -->
                  <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
                  <td valign="middle" class="styTableCell">
                    <xsl:choose>
                      <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                        <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-bottom-width: 0px'"/></xsl:attribute>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;'"/></xsl:attribute>
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="../CorporationNumber"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td valign="top" class="styTableCell">
                    <xsl:choose>
                      <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                        <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-bottom-width: 0px'"/></xsl:attribute>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;'"/></xsl:attribute>
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine1"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                    <xsl:if test="../CorporationName/BusinessNameLine2!=''">
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine2"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </xsl:if>
                  </td>
                  <td valign="top" class="styTableCell">
                    <xsl:choose>
                      <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                        <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;text-align:left;border-color:black;border-right:none;border-bottom-width: 0px'"/></xsl:attribute>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;text-align:left;border-color:black;border-right:none;'"/></xsl:attribute>
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="ClassesOfStock"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:for-each>
            </table>
          </xsl:if>
          <!--@@@PART IV LINE 2@@@-->
          <!-- Separated Print for Part IV, Line 2 -->
          <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated)">
            <br/>
            <span class="styRepeatingDataTitle">Form 851, Part IV, Line 2 - Additional Stock Information:</span>
            <table class="styDepTbl" cellspacing="0" style="width:187mm;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col" rowspan="1" style="width:7mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Corp. No.</th>
                  <th class="styDepTblCell" scope="col" rowspan="1" style="width:80mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Name of corporation</th>
                  <th class="styDepTblCell" scope="col" rowspan="1" style="width:85mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">Explanation</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <tr class="styDepTblRow1">
                  <td valign="middle" class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNumber"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td valign="top" class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <xsl:if test="$Form851Data/CommonParentCorporationInfo/MemReaffltWithin60Mnth=1">
                    <td class="styTableCell" style="width:7.5mm;height:10mm;font-size:7pt;text-align:center;border-color:black;">
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/MemReaffltWithin60Mnth"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="width:7.5mm;height:10mm;font-size:7pt;text-align:center;border-color:black;">
                      <span style="width:1px;"/>
                    </td>
                  </xsl:if>
                  <td class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;text-align:left;border-color:black;border-right:none;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/Explanation"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <xsl:if test="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation!=''">
                  <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
                    <tr>
                      <!-- Define background colors to the rows -->
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
                      <td valign="middle" class="styTableCell">
                        <xsl:choose>
                          <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                            <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-bottom-width: 0px'"/></xsl:attribute>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;'"/></xsl:attribute>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="../CorporationNumber"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td valign="top" class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                        <xsl:choose>
                          <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                            <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-bottom-width: 0px'"/></xsl:attribute>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;'"/></xsl:attribute>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine1"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                        <xsl:if test="../CorporationName/BusinessNameLine2!=''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </xsl:if>
                      </td>
                      <td valign="top" class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;text-align:left;border-color:black;border-right:none;">
                        <xsl:choose>
                          <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                            <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;text-align:left;border-color:black;border-right:none;border-bottom-width: 0px'"/></xsl:attribute>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;text-align:left;border-color:black;border-right:none;'"/></xsl:attribute>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Explanation"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
              </tbody>
            </table>
          </xsl:if>
          <!--@@@PART IV LINE 3 FIRST TABLE@@@-->
          <!-- Separated Print for Part I, Line 3 first table -->
          <!--<xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated)">
            <br/>
            <span class="styRepeatingDataTitle">Form 851, Part IV, Line 3, First Table - Additional Stock Information:</span>
            <table class="styDepTbl" cellspacing="0" style="width:187mm;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col" rowspan="1" style="width:7mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Corp. No.</th>
                  <th class="styDepTblCell" scope="col" rowspan="1" style="width:80mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Name of corporation</th>
                  <th class="styDepTblCell" scope="col" rowspan="1" style="width:27mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;"><b>(a)</b><br/>Percent of value</th>
                  <th class="styDepTblCell" scope="col" rowspan="1" style="width:28mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;"><b>(b)</b><br/>Percent of outstanding voting stock</th>
                  <th class="styDepTblCell" scope="col" rowspan="1" style="width:29mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;"><b>(c)</b><br/>Percent of voting power</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <tr class="styDepTblRow1">
                  <td valign="middle" class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNumber"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td valign="top" class="styTableCell" style="width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  --><!-- Common Parent Corporation Info - begin --><!--
                  <xsl:choose>
                    <xsl:when test="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/PercentOfValue!=''">
                      <td class="styTableCell" style="width:27mm;height:10mm;font-size:7pt;border-color:black;">
                        <xsl:call-template name="PopulatePercent">
                          <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/PercentOfValue"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </xsl:when>
                    <xsl:otherwise>
                      <td class="styTableCell" style="height:10mm;font-size:7pt;text-align:right;border-color:black;">
               %
          </td>
                    </xsl:otherwise>
                  </xsl:choose>
                  <xsl:choose>
                    <xsl:when test="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/PercentOutstandingVotingStock!=''">
                      <td class="styTableCell" style="width:27mm;height:5mm;text-align:right;font-size:7pt;border-color:black;">
                        <xsl:call-template name="PopulatePercent">
                          <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/PercentOutstandingVotingStock"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </xsl:when>
                    <xsl:otherwise>
                      <td class="styTableCell" style="height:5mm;text-align:right;font-size:7pt;border-color:black;">
            %
          </td>
                    </xsl:otherwise>
                  </xsl:choose>
                  <xsl:choose>
                    <xsl:when test="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/PercentOfVotingPower!=''">
                      <td class="styTableCell" style="width:26mm;height:10mm;font-size:7pt;border-color:black;border-right:none;">
                        <xsl:call-template name="PopulatePercent">
                          <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/PercentOfVotingPower"/>
                        </xsl:call-template>
                      </td>
                    </xsl:when>
                    <xsl:otherwise>
                      <td class="styTableCell" style="height:10mm;font-size:7pt;text-align:right;border-color:black;border-right:none;">
            %
          </td>
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
                --><!-- Common Parent Corporation Info - end --><!--
                --><!-- Subsidiary Corporation Info - begin --><!--
                <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
                  <tr>
                    --><!-- Define background colors to the rows --><!--
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td valign="middle" class="styTableCell">
                      <xsl:choose>
                        <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                          <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-bottom-width: 0px'"/></xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;'"/></xsl:attribute>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="../CorporationNumber"/>
                      </xsl:call-template>
                    </td>
                    <td valign="top" class="styTableCell">
                      <xsl:choose>
                        <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                          <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-bottom-width: 0px'"/></xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:attribute name="style"><xsl:value-of select="'width:80mm;height:10mm;font-size:7pt;border-color:black;text-align:left;'"/></xsl:attribute>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine1"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                      <xsl:if test="../CorporationName/BusinessNameLine2!=''">
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="../CorporationName/BusinessNameLine2"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </xsl:if>
                    </td>
                    <xsl:choose>
                      <xsl:when test="PercentOfValue!=''">
                        <td valign="middle" class="styTableCell" style="">
                          <xsl:choose>
                            <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                              <xsl:attribute name="style"><xsl:value-of select="'width:27mm;height:10mm;font-size:7pt;border-color:black;border-bottom-width: 0px'"/></xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:attribute name="style"><xsl:value-of select="'width:27mm;height:10mm;font-size:7pt;border-color:black;'"/></xsl:attribute>
                            </xsl:otherwise>
                          </xsl:choose>
                          <xsl:call-template name="PopulatePercent">
                            <xsl:with-param name="TargetNode" select="PercentOfValue"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td class="styTableCell" style="height:10mm;font-size:7pt;text-align:right;border-color:black;">
                          <xsl:choose>
                            <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                              <xsl:attribute name="style"><xsl:value-of select="'height:10mm;font-size:7pt;text-align:right;border-color:black;border-bottom-width: 0px'"/></xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:attribute name="style"><xsl:value-of select="'height:10mm;font-size:7pt;text-align:right;border-color:black;'"/></xsl:attribute>
                            </xsl:otherwise>
                          </xsl:choose>
                          <span class="styTableCell" style="text-align:right;">%</span>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                      <xsl:when test="PercentOutstandingVotingStock!=''">
                        <td valign="middle" class="styTableCell">
                          <xsl:choose>
                            <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                              <xsl:attribute name="style"><xsl:value-of select="'width:27mm;height:5mm;text-align:right;font-size:7pt;border-color:black;border-bottom-width: 0px'"/></xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:attribute name="style"><xsl:value-of select="'width:27mm;height:5mm;text-align:right;font-size:7pt;border-color:black;'"/></xsl:attribute>
                            </xsl:otherwise>
                          </xsl:choose>
                          <xsl:call-template name="PopulatePercent">
                            <xsl:with-param name="TargetNode" select="PercentOutstandingVotingStock"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td valign="middle" class="styTableCell" style="height:5mm;text-align:right;font-size:7pt;border-color:black;">
                          <span class="styTableCell" style="text-align:right;">%</span>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                      <xsl:when test="PercentOfVotingPower!=''">
                        <td valign="middle" class="styTableCell">
                          <xsl:choose>
                            <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                              <xsl:attribute name="style"><xsl:value-of select="'width:26mm;height:10mm;font-size:7pt;border-color:black;border-right:none;border-bottom-width: 0px'"/></xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:attribute name="style"><xsl:value-of select="'width:26mm;height:10mm;font-size:7pt;border-color:black;border-right:none;'"/></xsl:attribute>
                            </xsl:otherwise>
                          </xsl:choose>
                          <xsl:call-template name="PopulatePercent">
                            <xsl:with-param name="TargetNode" select="PercentOfVotingPower"/>
                          </xsl:call-template>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td valign="middle" class="styTableCell">
                          <xsl:choose>
                            <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                              <xsl:attribute name="style"><xsl:value-of select="'height:10mm;font-size:7pt;text-align:right;border-color:black;border-right:none;border-bottom-width: 0px'"/></xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:attribute name="style"><xsl:value-of select="'height:10mm;font-size:7pt;text-align:right;border-color:black;border-right:none;'"/></xsl:attribute>
                            </xsl:otherwise>
                          </xsl:choose>
                          <span class="styTableCell" style="text-align:right;">%</span>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </tr>
                </xsl:for-each>
                --><!-- Subsidiary Corporation Info - end --><!--
              </tbody>
            </table>
          </xsl:if>
          --><!--@@@PART IV LINE 3 SECOND TABLE@@@--><!--
          --><!-- Separated Print for Part IV, Line 3, Second Table --><!--
          <xsl:if test="(count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt; 3) and ($Print = $Separated)">
            <br/>
            <span class="styRepeatingDataTitle">Form 851, Part IV, Line 3, Second Table - Additional Stock Information:</span>
            <table class="styDepTbl" cellspacing="0" style="width:182.5mm;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col" style="width:7mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Corp. No.</th>
                  <th class="styDepTblCell" scope="col" style="width:175mm;text-align:left;font-size:7pt;font-weight:normal;border-color:black;border-right:none;"><b>(d)</b> &#8212; Provide a description of any   arrangement.</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <tr class="styDepTblRow1">
                  <td valign="middle" class="styTableCell" style="width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/CorporationNumber"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td valign="top" class="styTableCell" style="width:180mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-right:none;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form851Data/CommonParentCorporationInfo/AdditionalStockInformation/ArrangementDescForQuestion3"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <xsl:if test="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation!=''">
                  <xsl:for-each select="$Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation">
                    <tr>
                      --><!-- Define background colors to the rows --><!--
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
                      <td valign="middle" class="styTableCell">
                        <xsl:choose>
                          <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                            <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-bottom-width: 0px'"/></xsl:attribute>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:attribute name="style"><xsl:value-of select="'width:7mm;height:10mm;font-size:7pt;border-color:black;text-align:left;'"/></xsl:attribute>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="../CorporationNumber"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td valign="top" class="styTableCell">
                        <xsl:choose>
                          <xsl:when test="(position() = last()) and (count($Form851Data/SubsidiaryCorporationInfo/AdditionalStockInformation) &gt;2)">
                            <xsl:attribute name="style"><xsl:value-of select="'width:175mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-right:none;border-bottom-width: 0px'"/></xsl:attribute>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:attribute name="style"><xsl:value-of select="'width:175mm;height:10mm;font-size:7pt;border-color:black;text-align:left;border-right:none;'"/></xsl:attribute>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ArrangementDescForQuestion3"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
              </tbody>
            </table>
          </xsl:if>-->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
