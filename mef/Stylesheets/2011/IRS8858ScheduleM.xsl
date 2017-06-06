<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8858ScheduleMStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="Form8858SchMData" select="$RtnDoc/IRS8858ScheduleM"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8858SchMData)"/>
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
        <meta name="Description" content="Form IRS8824"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <!--EXCEPTION:  If Controlled Foreign Partnership checked box is checked then column b-e (line 1-19) must be present.
                                  If Controlled Foreign Corporation checked box is checked then column b-f (line 1-19) must be present.  -->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8858ScheduleMStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form8824">
          <!-- BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- END WARNING LINE -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:27mm;height:18mm;">
              <span class="styFormNumber" style="font-size:9pt;">SCHEDULE M <br/> (Form 8858)</span>
              <br/>(December 2004)
              <!--General Dependency Push Pin -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8858SchMData"/>
              </xsl:call-template>
              <br/>
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:127mm;height:18mm;">
              <div class="styMainTitle">
           	Transactions Between Foreign Disregarded Entity of a<br/>
Foreign Tax Owner and the Filer or Other Related Entities           
          </div>
              <div class="styFST" style="font-size:7pt;padding-top:4mm;">
                <img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="bullet image"/>
            Attach to Form 8858.
            <span style="width:10mm;"/>
                <img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="bullet image"/>
            See separate instructions.            
          </div>
            </div>
            <div class="styTYBox" style="width:32mm;height:21.5mm;">
              <div class="styOMB" style="padding-top:6mm;border-bottom:0px;padding-left:2mm;">
            OMB No. 1545-1910
          </div>
            </div>
          </div>
          <!-- Names and ID's -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:144mm;height:8mm;font-size:7pt;">
           Name of person filing Form 8858<br/>
              <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8858SchMData/NameOfPersonFilingForm8858/BusinessNameLine1"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8858SchMData/NameOfPersonFilingForm8858/BusinessNameLine2"/>
                </xsl:call-template>
            </div>
            <div class="styEINBox" style="width:42mm;height:4mm;padding-left:2mm;font-size:7pt;">
            Identifying number<br/>
              <br/>
              <xsl:if test="$Form8858SchMData/IdentifyingNumber !=' '">
                <span style="font-weight:normal;">
                  <xsl:call-template name="PopulateSSN">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/IdentifyingNumber"/>
                  </xsl:call-template>
                </span>
              </xsl:if>
              <xsl:if test="$Form8858SchMData/IdentifyingNumberEIN !=' '">
                <span style="font-weight:normal;">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/IdentifyingNumberEIN"/>
                  </xsl:call-template>
                </span>
              </xsl:if>
              <xsl:if test="$Form8858SchMData/MissingEINReason !=' '">
                <span style="font-weight:normal;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/MissingEINReason"/>
                  </xsl:call-template>
                </span>
              </xsl:if>
            </div>
          </div>
          <!-- End of Names and ID's -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:100mm;height:8mm;font-size:7pt;">
        Name of foreign disregarded entity<br/>
              <div style="font-family:verdana;height:12.5mm">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8858SchMData/NameOfForeignDisregardedEntity/BusinessNameLine1"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8858SchMData/NameOfForeignDisregardedEntity/BusinessNameLine2"/>
                </xsl:call-template>
              </div>
            </div>
            <div class="styEINBox" style="width:87mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:normal;">
         Name of tax owner<br/>
              <span style="font-family:verdana;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8858SchMData/NameOfTaxOwner/BusinessNameLine1"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8858SchMData/NameOfTaxOwner/BusinessNameLine2"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div style="padding-top:1.5mm;text-align:justify;">
              <span class="styBoldText">Important:</span>
              <span class="styItalicText">  Complete a <span class="styBoldText">separate</span> Schedule M for each foreign disregarded entity for which the tax owner is a controlled foreign
corporation or controlled foreign partnership. Enter the totals for each type of transaction that occurred during the annual accounting
period between the foreign disregarded entity and the persons listed in the applicable columns (b) through (f). All amounts must be
stated in U.S. dollars translated from functional currency at the appropriate exchange rate for the foreign disregarded entity’s tax
year (see instructions).  </span>
            </div>
            <div style="padding-top:1.5mm;">
              <span style="float:left">
		Enter the relevant functional currency and the exchange rate used throughout this schedule <img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="bullet image"/>
                <span style="width:6px;"/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8858SchMData/RelevantFunctionalCurrency"/>
                </xsl:call-template>
              </span>
              <span style="float:right;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8858SchMData/ExchangeRateUsed"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div style="padding-top:.5mm;padding-bottom:.5mm;">
              <b>Column Headings.</b> This schedule contains two sets of column headings. Check the box that identifies the status of the tax
owner and complete lines 1 through 19 with respect to the applicable set of column headings:	
	</div>
          </div>
          <table cellpadding="0" cellspacing="0" class="styTable" style="width:187mm;font-weight:normal;font-size:7pt;">
            <thead class="stythead">
              <tr>
                <th style="width:47mm;border-color:black;font-weight:normal;vertical-align:top;" class="styTablecellHeader">
                  <div class="styGenericDiv" style="padding-top:3mm;">
                    <input type="Checkbox" class="styCkbox" name="ControlledForeignPartnership">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form8858SchMData/ControlledForeignPartnership"/>
						<xsl:with-param name="BackupName">ControlledForeignPartnership</xsl:with-param>
                      </xsl:call-template>
                    </input>
                  </div>
                  <div style="float:left;padding-left:2mm;padding-top:3mm;">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form8858SchMData/ControlledForeignPartnership"/>
						<xsl:with-param name="BackupName">ControlledForeignPartnership</xsl:with-param>
                      </xsl:call-template>
                      <span style="font-weight:bold;">Controlled Foreign Partnership</span>
                    </label>
                  </div>
                  <br/>
                  <div style="padding-top:4mm;float:left;text-align:center;width:47mm;padding-bottom:2mm;">
                    <span class="styBoldText">(a) </span> Transactions of <br/>foreign disregarded <br/>entity
			              </div>
                </th>
                <!-- tthis col occupies 28mm wide -->
                <th style="border-color:black;font-weight:normal;" class="styTablecellHeader">
                  <span style="width:2px;"/>
                  <span class="styBoldText">(b) </span> U.S. person filing this return
				</th>
                <th style="width:28mm;border-color:black;font-weight:normal;" class="styTablecellHeader">
                  <span class="styBoldText">(c) </span> Any domestic corporation or partnership controlling or controlled by the filer
				</th>
                <th style="width:28mm;border-color:black;font-weight:normal;" class="styTablecellHeader">
                  <span class="styBoldText">(d) </span> Any foreign corporation or partnership controlling or controlled by the filer (other than the tax owner)<!--br /><span style="font-size:6pt">other than tax owner</span-->
                </th>
                <th style="width:28mm;border-color:black;font-weight:normal;" class="styTablecellHeader">
                  <span class="styBoldText">(e) </span> Any U.S. person with a 10% or more direct interest in the controlled foreign partnership (other than the filer)
				</th>
                <th style="width:28mm;background-color:lightgrey;border-color:black;border-right-width:0px;font-weight:normal;" class="styTablecellHeader">
                  <span style="width:2px;"/>
                </th>
              </tr>
              <tr>
                <th style="width:47mm;border-color:black;font-weight:normal;vertical-align:top;" class="styTablecellHeader">
                  <div class="styGenericDiv" style="padding-top:3mm;">
                    <input type="Checkbox" class="styCkbox" name="ControlledForeignCorporation">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form8858SchMData/ControlledForeignCorporation"/>
						<xsl:with-param name="BackupName">ControlledForeignCorporation</xsl:with-param>
                      </xsl:call-template>
                    </input>
                  </div>
                  <div style="float:left;padding-left:2mm;padding-top:3mm;">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form8858SchMData/ControlledForeignCorporation"/>
						<xsl:with-param name="BackupName">ControlledForeignCorporation</xsl:with-param>
                      </xsl:call-template>
                      <span style="font-weight:bold;">Controlled Foreign Corporation</span>
                    </label>
                  </div>
                  <br/>
                  <div style="padding-top:4mm;float:left;text-align:center;width:47mm;padding-bottom:2mm;">
                    <span class="styBoldText">(a) </span> Transactions of <br/>foreign disregarded <br/>entity
			              </div>
                </th>
                <th style="border-color:black;font-weight:normal;" class="styTablecellHeader">
                  <span style="width:2px;"/>
                  <span class="styBoldText">(b) </span> U.S. person filing this return
				</th>
                <th style="border-color:black;font-weight:normal;" class="styTablecellHeader">
                  <span class="styBoldText">(c) </span> Any domestic corporation or partnership controlled by the filer
				</th>
                <th style="border-color:black;font-weight:normal;" class="styTablecellHeader">
                  <span class="styBoldText">(d) </span> Any foreign corporation or partnership controlled by the filer (other than tax owner)
				</th>
                <th style="border-color:black;font-weight:normal;" class="styTablecellHeader">
                  <span class="styBoldText">(e) </span> 10% or more U.S.
shareholder of any
corporation
controlling the tax
owner
				</th>
                <th style="border-color:black;border-right-width:0px;font-weight:normal;" class="styTablecellHeader">
                  <span class="styBoldText">(f) </span> 10% or more U.S. shareholder, or other owner, of any entity controlling the tax owner
				</th>
              </tr>
            </thead>
            <tfoot/>
            <tbody>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBoxSD">1</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Sales of inventory
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:.5mm;padding-right:.5mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">...
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/SalesOfInventory"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/SalesOfInventory"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/SalesOfInventory"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/SalesOfInventory"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-color:black;border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/SalesOfInventory"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBoxSD">2</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Sales of property rights
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:.5mm;padding-right:.5mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">.
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/SalesOfPropertyRights"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/SalesOfPropertyRights"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/SalesOfPropertyRights"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/SalesOfPropertyRights"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/SalesOfPropertyRights"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBoxSD">3</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;border-bottom-width:0px;">
						Compensation recieved for
					</div>
                  <div class="styLNLeftNumBox"/>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						certain services
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:1mm;padding-right:1mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">...
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/CompReceivedForCertainServices"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/CompReceivedForCertainServices"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/CompReceivedForCertainServices"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/CompReceivedForCertainServices"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/CompReceivedForCertainServices"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBoxSD">4</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Commissions received
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:1mm;padding-right:1mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">.
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/CommissionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/CommissionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/CommissionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/CommissionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/CommissionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBoxSD">5</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Rents, royalties, and license
					</div>
                  <div class="styLNLeftNumBox"/>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						fees received
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:1mm;padding-right:1mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">....
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/RentsRoyaltiesLicenseFeesRcvd"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/RentsRoyaltiesLicenseFeesRcvd"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/RentsRoyaltiesLicenseFeesRcvd"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/RentsRoyaltiesLicenseFeesRcvd"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/RentsRoyaltiesLicenseFeesRcvd"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBoxSD">6</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;width:38mm;">
						Dividends/Distributions		
					</div>
                  <div class="styLNLeftNumBox"/>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						received					
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:1mm;padding-right:1mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">.....
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/DividendsDistributionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/DividendsDistributionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/DividendsDistributionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/DividendsDistributionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/DividendsDistributionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBoxSD">7</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Interest received					
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:1mm;padding-right:1mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">...
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/InterestReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/InterestReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/InterestReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/InterestReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/InterestReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBoxSD">8</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Other					
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:1mm;padding-right:1mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">.......
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/OtherTransactionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/OtherTransactionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/OtherTransactionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/OtherTransactionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/OtherTransactionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;">
                  <div class="styLNLeftNumBoxSD">9</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Add lines 1 through 8					
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:1mm;padding-right:1mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">..
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/TotalTransactionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/TotalTransactionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/TotalTransactionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/TotalTransactionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/TotalTransactionsReceived"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBox">10</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Purchases of inventory					
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:1mm;padding-right:1mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">.
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/PurchasesOfInventory"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/PurchasesOfInventory"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/PurchasesOfInventory"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/PurchasesOfInventory"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/PurchasesOfInventory"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBox">11</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Purchases of tangible prop-					
					</div>
                  <div class="styLNLeftNumBox"/>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						erty other than inventory				
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/PurchasesOfTangibleProperty"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/PurchasesOfTangibleProperty"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/PurchasesOfTangibleProperty"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/PurchasesOfTangibleProperty"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/PurchasesOfTangibleProperty"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBox">12</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Purchases of property rights					
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/PurchasesOfPropertyRights"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/PurchasesOfPropertyRights"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/PurchasesOfPropertyRights"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/PurchasesOfPropertyRights"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/PurchasesOfPropertyRights"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBox">13</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Compensation paid for 					
					</div>
                  <div class="styLNLeftNumBox"/>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;padding-left:8mm;">
						certain services					
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:1mm;padding-right:1mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">...
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/CompPaidForCertainServices"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/CompPaidForCertainServices"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/CompPaidForCertainServices"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/CompPaidForCertainServices"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style=";border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/CompPaidForCertainServices"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBox">14</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Commissions paid					
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:1mm;padding-right:1mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">...
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/CommissionsPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/CommissionsPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/CommissionsPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/CommissionsPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/CommissionsPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBox">15</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Rents, royalties, and license					
					</div>
                  <div class="styLNLeftNumBox"/>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						fees paid					
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:1mm;padding-right:1mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">......
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/RentsRoyaltiesLicenseFeesPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/RentsRoyaltiesLicenseFeesPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/RentsRoyaltiesLicenseFeesPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/RentsRoyaltiesLicenseFeesPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/RentsRoyaltiesLicenseFeesPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <tr/>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBox">16</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Interest paid					
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:1mm;padding-right:1mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">....
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/InterestPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/InterestPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/InterestPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/InterestPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/InterestPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:1px;">
                  <div class="styLNLeftNumBox">17</div>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						Add lines 10 through 16				
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:1mm;padding-right:1mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">.
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/TotalTransactionsPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/TotalTransactionsPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/TotalTransactionsPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/TotalTransactionsPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/TotalTransactionsPaid"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:0px;">
                  <div class="styLNLeftNumBox">18</div>
                  <div style="text-align:justify;width:39mm;" class="styLNDesc">
						Amounts borrowed (see 				
					</div>
                  <br/>
                  <div class="styLNLeftNumBox"/>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;">
						instructions)				
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:1mm;padding-right:1mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">.....
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/AmountsBorrowed"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/AmountsBorrowed"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/AmountsBorrowed"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/AmountsBorrowed"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/AmountsBorrowed"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:47mm;text-align:left;border-color:black;border-bottom-width:1px;">
                  <div class="styLNLeftNumBox">19</div>
                  <div style="text-align:justify;width:39mm;" class="styLNDesc">
						Amounts loaned (see 				
					</div>
                  <div class="styLNLeftNumBox" style=""/>
                  <div style="float:left;padding-top:.5mm;padding-bottom:.5mm;text-align:justified;">
						instructions)				
					</div>
                  <div style="letter-spacing:3.2mm;padding-left:1mm;padding-right:1mm;float:right;padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;">.....
					</div>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/USFiler/AmountsLoaned"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/DomesticCorpOrPartnership/AmountsLoaned"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/ForeignCorpOrPartnership/AmountsLoaned"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentForeignPrtshpOrUSShr/AmountsLoaned"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
                <td class="styIRS8858SchMTableCell" style="border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8858SchMData/TenPercentUSShrOrOtherOwner/AmountsLoaned"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                </td>
              </tr>
            </tbody>
          </table>
          <!-- Footer -->
          <div style="width:187mm;padding-top:1mm;">
            <div style="float:left;font-weight:bold;width:107mm;">For Paperwork Reduction Act Notice, see the Instructions for Form 8858.
  </div>
            <div style="width:30mm;float:left;">Cat. No. 37387C</div>
            <div style="float:right;font-weight:bold;">
    Schedule M (Form 8858) (12-2004)
  </div>
          </div>
          <!-- Introducing page end -->
          <p class="pageend"/>
          <!-- Begininning of write-in data -->
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
              <xsl:with-param name="TargetNode" select="$Form8858SchMData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
