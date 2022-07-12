<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XML Spy v4.4 U (http://www.xmlspy.com) by Ken Dulabhan (Comteq Federal Inc) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS4136Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!--  Defines the stage of the data, e.g. original or latest-->
  <xsl:param name="IRS4136Data" select="$RtnDoc/IRS4136"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($IRS4136Data)"/>
          </xsl:call-template>
        </title>
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <meta http-equiv="Cache-Control" content="private"/>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 4136"/>
        <META name="GENERATOR" content="IBM WebSphere Studio"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
         <!--  <xsl:if test="not($Print) or $Print=''"> -->
          <xsl:call-template name="IRS4136Style"/>
          <xsl:call-template name="AddOnStyle"/>
       <!-- </xsl:if> -->
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="IRS4136">
          <xsl:call-template name="DocumentHeader"/>
          <!--   BEGIN FORM HEADER   -->
          <div class="styIRS4136BB" style="width:187mm;">
            <div class="styIRS4136FN" style="width:31mm; height: 21mm">
              <div>
                <span>Form <span style="width: 4px"/>
                </span>
                <span class="styFormNumber">4136</span>
                <br/>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$IRS4136Data"/>
                </xsl:call-template>
                <span style="width:1mm"/>
         </div>
              <div class="styIRS4136Agency" style="padding-top:8mm;">
      Department of the Treasury Internal Revenue Service
    </div>
            </div>
            <div class="styGenericDiv" style="width:125mm;height:21mm;text-align:center;font-weight:bold;padding-top:1mm;">
              <div class="styMainTitle">Credit for Federal Tax Paid on Fuels</div>
              <div style="padding-top:7mm;">
                <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/> See the separate instructions.
    </div>
              <div style="padding-top:2mm;">
                <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/> Attach this form to your income tax return.
    </div>
            </div>
            <div class="styIRS4136TYBox" style="height: 25mm;">
              <div class="styIRS4136OMB">OMB No. 1545-0162</div>
              <div class="styIRS4136TY">20<span class="styTYColor">09</span>
              </div>
              <div class="styIRS4136Sequence">Attachment<br/>Sequence No. <b>23</b>
              </div>
            </div>
          </div>
          <!--   END FORM HEADER -->
          <!--   BEGIN TAXPAYER INFO   -->
          <div style="width:187mm;">
            <div class="styIRS4136BusinessName" style="font-size: 7pt; font-weight: normal;">Name (as shown on your income tax return)
    <br/>
              <span style="font-family: verdana, arial, sans-serif;font-size: 7pt; font-weight: normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
            <div class="styEINBox" style="padding-left: 2mm;font-size:7pt;font-weight:bold;">Taxpayer identification number
    <div style="padding-top:3mm;font-weight:normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--   END TAXPAYER INFO   -->
          <!--   BEGIN NOTE HEADER   -->
          <div class="styIRS4136CautionHdr" style="padding-left:1.5mm;">
            <span class="styIRS4136CautionHdrTitle" style="padding-left:2mm;padding-right:1mm;">
       Caution.
  </span>
            <span style="width:160mm;float:left;font-size:7.75pt;padding-right:1mm;">
        Claimant has the name and address of the person who sold the fuel to the claimant and the dates of purchase. <br/>
         For claims on lines 1c and 2b (type of use 13 and 14), 3d, 4c, and 5, claimant has not waived the right to <br/>
         make the claim. For claims on lines 1c and 2b (type of use 13 and 14), claimant certifies that a certificate has <br/>
         not been provided to the credit card issuer.
        
  </span>
            <div style="width:187mm;"/>
          </div>
          <!--   END NOTE HEADER   -->
          <!--   BEGIN BLOCK 1   -->
          <!--   BEGIN LINE 1   -->
          <!-- Count the number of rows in the table -->
          <xsl:variable name="table1RowCount" select="3 + count($IRS4136Data/OtherNontaxableUseOfGasoline)"/>
          <div class="styIRS4136NumLine" style="padding-left:2mm;border-top-width: 0px;">
            <br/>
            <span style="float:left;clear:none;"> 1<span class="styIRS4136NBSP" style="padding-right:3mm;"/> Nontaxable Use of Gasoline</span>
            <br/>
            <span style="width:7mm;text-align:right;float:right; clear: none">
              <xsl:call-template name="SetDynamicTableToggleRowCount">
                <xsl:with-param name="DataRowCount" select="$table1RowCount"/>
                <xsl:with-param name="containerHeight" select="3"/>
                <xsl:with-param name="containerID" select=" 'NGctn' "/>
              </xsl:call-template>
            </span>
          </div>
          <div class="styIRS4136TableContainer1" id="NGctn">
            <!--print logic-->
            <xsl:call-template name="SetInitialState"/>
            <!--end-->
            <!-- Declare all varaible that hold the count of the repeating elements in this block -->
            <xsl:variable name="AFRowCount" select="count($IRS4136Data/OtherNontaxableUseOfGasoline)"/>
            <table class="styIRS4136Table" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th style="width:3mm;height:4mm;"/>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellA" style="text-align: center;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 1A OFF-HIGHWAY BUSINESS USE OF GASOLINE  -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-left:4mm;">
                    <b>a</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:90mm;">Off-highway business use</td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style=" text-align:center;">$ .183</td>
                  <td class="styIRS4136TableCellC" style="text-align:left;">
                    <!-- <xsl:if test="($AFRowCount &lt;=1) or  ($AFRowCount &gt;1) and $Print != $Separated"> -->
                    <xsl:attribute name="style">text-align:right;</xsl:attribute>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="3"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/OffHwyBusinessGasolineGallons"/>
                    </xsl:call-template>
                    <!--</xsl:if>-->
                    <!--<xsl:if test="($AFRowCount &gt;1 and $Print = $Separated)">-->
                    <!-- Hard coded the string.  Reason is the element that could be used for the target node in additional data table may not be present.  So the message is will not be seen.  Other method is to call the mutually exclusive xsl:if calling different PopulateAdditionalDataTableMessage with different targetnodes.-->
                    <!--  </xsl:if>-->
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces" rowspan="3">
                    <!-- When the row count of Line 1C is less than 3, then add a border under the bracket to close out the row -->
                    <xsl:choose>
                      <xsl:when test="$AFRowCount &lt;2">
                        <xsl:attribute name="style">border-bottom-width: 1px</xsl:attribute>
                      </xsl:when>
                      <xsl:when test="$Print = $Separated">
                        <xsl:attribute name="style">border-bottom-width: 1px</xsl:attribute>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:attribute name="style">border-bottom-width: 0px</xsl:attribute>
                      </xsl:otherwise>
                    </xsl:choose>
                    <img src="{$ImagePath}/4136_Bracket_L6.gif" alt="bracket"/>
                  </td>
                  <td class="styIRS4136TableCellD" style="text-align:left;vertical-align:top;">
                    <xsl:choose>
                      <xsl:when test="$AFRowCount &lt;2">
                        <xsl:attribute name="rowspan">3</xsl:attribute>
                      </xsl:when>
                      <xsl:when test="$Print = $Separated">
                        <xsl:attribute name="rowspan">3</xsl:attribute>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount + 2"/></xsl:attribute>
                      </xsl:otherwise>
                    </xsl:choose>
                    <!--<xsl:if test="($AFRowCount &lt;=1) or ($AFRowCount &gt;1 and $Print != $Separated)">-->
                    <xsl:attribute name="style">text-align:right;vertical-align:middle;</xsl:attribute>
                    <!-- </xsl:if>-->
        $
       <!-- <xsl:if test="($AFRowCount &lt;=1) or ($AFRowCount &gt;1 and $Print != $Separated)"> -->
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseOfGasolineCredit"/>
                    </xsl:call-template>
                    <!-- </xsl:if>-->
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">
                    <xsl:choose>
                      <xsl:when test="$AFRowCount &lt; 2">
                        <xsl:attribute name="rowspan"><xsl:number value="3"/></xsl:attribute>
                      </xsl:when>
                      <xsl:when test="$Print = $Separated">
                        <xsl:attribute name="rowspan">3</xsl:attribute>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount + 2"/></xsl:attribute>
                      </xsl:otherwise>
                    </xsl:choose>
        362
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 1B USE OF GASOLINE ON A FARM FOR FARMING PURPOSES -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-left:4mm;">
                    <b>b</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:90mm;">Use on a farm for farming purposes</td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center"> .183</td>
                  <td class="styIRS4136TableCellC">
                    <!-- <xsl:if test="($AFRowCount &lt;=1) or  ($AFRowCount &gt;1) and $Print != $Separated">-->
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="3"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/FarmingPurposesGasolineGallons"/>
                    </xsl:call-template>
                    <!-- </xsl:if>-->
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Loop  -->
                <!--  Row 1C OTHER NONTAXABLE USE OF GASOLINE  -->
                <xsl:if test="$AFRowCount = 0 or (($AFRowCount &gt;1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;">
                      <b>c</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="vertical-align:middle; width:92mm;">Other nontaxable use (see <b>Caution</b> above line 1)</td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="padding-left:2mm; text-align:center;">.183</td>
                    <td class="styIRS4136TableCellC">
                      <xsl:if test="($AFRowCount &gt;1) and ($Print = $Separated)">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableAviationGasoline"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="($AFRowCount &lt;=1)  or  ($Print != $Separated)">
                  <xsl:for-each select="$IRS4136Data/OtherNontaxableUseOfGasoline">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-
              right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount"/></xsl:attribute>
                          <b>c</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount"/></xsl:attribute>
                Other nontaxable use (see <b>Caution </b>above line 1)   
              </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm; text-align:center;">.183</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <!--If this is the last repeating row in line 1C, then add a blank cell with a bottom border to close out -->
                      <!--column under the bracket -->
                      <xsl:if test="position()=$AFRowCount">
                        <td class="styIRS4136Braces">
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!-- End Loop  -->
                <!-- Line D  position -->
                <tr>
                  <td class="styIRS4136LetterCell" style="border-bottom-width:1px;padding-left:4mm;padding-right:2mm;">
                    <b>d</b>
                  </td>
                  <td class="styIRS4136TableCellLine">
                Exported
         </td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:2mm; text-align:center">.184</td>
                  <td class="styIRS4136TableCellC">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedNontaxableUseOfGasGals"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedNontaxableUseOfGasCr"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">
             411
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!-- End Line D -->
              </tbody>
            </table>
          </div>
          <xsl:call-template name="SetInitialDynamicTableHeightRowCount">
            <xsl:with-param name="DataRowCount" select="$table1RowCount"/>
            <xsl:with-param name="containerHeight" select="2"/>
            <xsl:with-param name="containerID" select=" 'NGctn' "/>
          </xsl:call-template>
          <!--  END LINE 1   -->
          <!--   BEGIN BLOCK 2   -->
          <!--   BEGIN LINE 2   -->
          <!-- Track the number of rows in table 2-->
          <xsl:variable name="table2RowCount" select="1 + count($IRS4136Data/NontaxableAviationGasoline)"/>
          <div class="styIRS4136NumLine" style="float:none;padding-top:3mm;padding-left:2mm;">
            <br/>
            <span style="float:left;clear:none;"> 2<span class="styIRS4136NBSP" style="padding-right:3mm;"/>  Nontaxable Use of Aviation Gasoline</span>
            <br/>
            <span style="width:7mm;text-align:right;float:right; clear: none">
              <xsl:call-template name="SetDynamicTableToggleRowCount">
                <xsl:with-param name="DataRowCount" select="$table2RowCount"/>
                <xsl:with-param name="containerHeight" select="2"/>
                <xsl:with-param name="containerID" select=" 'AGctn' "/>
              </xsl:call-template>
            </span>
          </div>
          <div class="styIRS4136TableContainer2" id="AGctn">
            <!--print logic-->
            <xsl:call-template name="SetInitialState"/>
            <!--end-->
            <table class="styIRS4136Table" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th style="width:3mm;height:4mm;"/>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellA" style="text-align: center">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  *******************************************************************************************  -->
                <!-- LINE 2a -->
                <tr>
                  <td class="styIRS4136LetterCell" style="border-bottom-width:0px;padding-left:4mm;padding-right:1.5mm;">
                    <b>a</b>
                  </td>
                  <td class="styIRS4136TableCellLine">Use in commercial aviation (other than foreign trade)</td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">$ .15/.000*</td>
                  <!--td class="styIRS4136TableCellB">
             <span style="width: 5px;text-align:center;"></span>  
             <span class="styIRS4136TableCellPad" style="padding-left:3mm;text-align:center;" >.194</span>
         </td -->
                  <td class="styIRS4136TableCellC">
                    <!--<xsl:if test="($Print != $Separated) ">-->
                    <!--or (count($IRS4136Data/ExpNontaxableAviationGasGals) &lt;= 1)">-->
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/AviationGasolineGallons"/>
                    </xsl:call-template>
                    <!--</xsl:if>-->
                    <xsl:if test=" ((count($IRS4136Data/ExpNontaxableAviationGasCredit) &gt; 1) and ($Print = $Separated))">
                      <xsl:attribute name="style">text-align:left;</xsl:attribute>
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$IRS4136Data/AviationGasolineGallons"/>
                        <xsl:with-param name="ShortMessage" select=" 'true' "/>
                      </xsl:call-template>
                    </xsl:if>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD" style="padding-left:3mm;text-align:left;">
                    <!--<xsl:if test="($Print != $Separated) ">-->
                    <!--or (count($IRS4136Data/NontaxableAviationGasoline) &lt;= 1)">-->
                    <xsl:if test="not(count($IRS4136Data/NontaxableAviationGasoline) = 0) ">
                      <xsl:attribute name="style">text-align:right;</xsl:attribute>
                      <!--</xsl:if>-->
                    </xsl:if>
                    <!--<xsl:if test="($Print != $Separated)"> -->
                    <!--or (count($IRS4136Data/NontaxableAviationGasoline) &lt;= 1)">-->
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/AviationGasolineCredit"/>
                    </xsl:call-template>
                    <!--</xsl:if>-->
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">354
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  END LOOP  -->
                <!--  *******************************************************************************************  -->
                <!--  Row 2B OTHER NONTAXABLE USE  -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCount" select="count($IRS4136Data/NontaxableAviationGasoline)"/>
                <xsl:if test="$AGRowCount = 0 or ((count($IRS4136Data/NontaxableAviationGasoline) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                      <b>b</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="vertical-align:middle;">Other nontaxable use (see<b> Caution </b> above line 1)
      </td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">.193/.043*</td>
                    <td class="styIRS4136TableCellC" style="text-align:left;">
                      <span class="styIRS4136TableCellPad"/>
                      <xsl:if test=" ((count($IRS4136Data/NontaxableAviationGasoline) &gt; 1) and ($Print = $Separated))">
                        <xsl:attribute name="style">text-align:left;</xsl:attribute>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableAviationGasoline"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
        324
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontaxableAviationGasoline) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/NontaxableAviationGasoline">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
                          <b>b</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
           Other nontaxable use (see <b>Caution </b> above line 1)
        </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.193/.043*</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableAviationGasolineCr"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
              324
              <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!-- LINE 2c -->
                <tr>
                  <td class="styIRS4136LetterCell" style="border-bottom-width:0px;padding-left:4mm;padding-right:1.5mm;">
                    <b>c</b>
                  </td>
                  <td class="styIRS4136TableCellLine">Exported</td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.194/.044*</td>
                  <!--td class="styIRS4136TableCellB">
             <span style="width: 5px;text-align:center;"></span>  
             <span class="styIRS4136TableCellPad" style="padding-left:3mm;text-align:center;" >.194</span>
         </td -->
                  <td class="styIRS4136TableCellC">
                    <!--<xsl:if test="($Print != $Separated) ">-->
                    <!--or (count($IRS4136Data/ExpNontaxableAviationGasGals) &lt;= 1)">-->
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontaxableAviationGasGals"/>
                    </xsl:call-template>
                    <!--</xsl:if>-->
                    <xsl:if test=" ((count($IRS4136Data/ExpNontaxableAviationGasCredit) &gt; 1) and ($Print = $Separated))">
                      <xsl:attribute name="style">text-align:left;</xsl:attribute>
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontaxableAviationGasCredit"/>
                        <xsl:with-param name="ShortMessage" select=" 'true' "/>
                      </xsl:call-template>
                    </xsl:if>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD" style="padding-left:3mm;text-align:left;">
                    <!--<xsl:if test="($Print != $Separated) ">-->
                    <!--or (count($IRS4136Data/NontaxableAviationGasoline) &lt;= 1)">-->
                    <xsl:if test="not(count($IRS4136Data/NontaxableAviationGasoline) = 0) ">
                      <xsl:attribute name="style">text-align:right;</xsl:attribute>
                      <!--</xsl:if>-->
                    </xsl:if>
                    <!--<xsl:if test="($Print != $Separated)"> -->
                    <!--or (count($IRS4136Data/NontaxableAviationGasoline) &lt;= 1)">-->
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontaxableAviationGasCredit"/>
                    </xsl:call-template>
                    <!--</xsl:if>-->
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">
        412
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  END LOOP  -->
                <!-- LINE 2d -->
                <tr>
                  <td class="styIRS4136LetterCell" style="border-bottom-width:0px;padding-left:4mm;padding-right:1.5mm;">
                    <b>d</b>
                  </td>
                  <td class="styIRS4136TableCellLine">LUST tax on aviation fuels used in foreign trade</td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.001</td>
                  <!--td class="styIRS4136TableCellB">
             <span style="width: 5px;text-align:center;"></span>  
             <span class="styIRS4136TableCellPad" style="padding-left:3mm;text-align:center;" >.194</span>
         </td -->
                  <td class="styIRS4136TableCellC">
                    <!--<xsl:if test="($Print != $Separated) ">-->
                    <!--or (count($IRS4136Data/ExpNontaxableAviationGasGals) &lt;= 1)">-->
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTaxAviationFuels"/>
                    </xsl:call-template>
                    <!--</xsl:if>-->
                    <xsl:if test=" ((count($IRS4136Data/ExpNontaxableAviationGasCredit) &gt; 1) and ($Print = $Separated))">
                      <xsl:attribute name="style">text-align:left;</xsl:attribute>
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontaxableAviationGasCredit"/>
                        <xsl:with-param name="ShortMessage" select=" 'true' "/>
                      </xsl:call-template>
                    </xsl:if>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD" style="padding-left:3mm;text-align:left;">
                    <!--<xsl:if test="($Print != $Separated) ">-->
                    <!--or (count($IRS4136Data/NontaxableAviationGasoline) &lt;= 1)">-->
                    <xsl:if test="not(count($IRS4136Data/NontaxableAviationGasoline) = 0) ">
                      <xsl:attribute name="style">text-align:right;</xsl:attribute>
                      <!--</xsl:if>-->
                    </xsl:if>
                    <!--<xsl:if test="($Print != $Separated)"> -->
                    <!--or (count($IRS4136Data/NontaxableAviationGasoline) &lt;= 1)">-->
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTaxAviationFuelCredit"/>
                    </xsl:call-template>
                    <!--</xsl:if>-->
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">
       433
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  END LOOP  -->
              </tbody>
            </table>
          </div>
          <xsl:call-template name="SetInitialDynamicTableHeightRowCount">
            <xsl:with-param name="DataRowCount" select="$table2RowCount"/>
            <xsl:with-param name="containerHeight" select="2"/>
            <xsl:with-param name="containerID" select=" 'AGctn' "/>
          </xsl:call-template>
          <!-- END LINE 2   -->
          <div class="styBB" style="width:187mm;height:2mm;padding-left:8mm">*This rate applies after
   September 30, 2009.</div>
          <!--   BEGIN BLOCK 3  -->
          <!--   BEGIN LINE 3   -->
          <div class="styIRS4136NumLine" style="padding-top:4mm;padding-bottom:1mm;padding-left:2mm;float: none; clear: both">
  3<span class="styIRS4136NBSP" style="padding-right:3mm;"/> Nontaxable Use of Undyed Diesel Fuel 
 
 <br/>
          </div>
          <!--   BEGIN BLOCK DESCRIPTION   -->
          <div class="styIRS4136DescLine" style="margin-left: 8mm; width:183mm;">
  Claimant certifies that the diesel fuel did not contain visible evidence of dye.
</div>
          <div class="styBB" style="width:180mm;margin-left:4mm;font-size:6.25pt;">
            <div style="float:left;padding-top:.5mm;">
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselUseException"/>
                </xsl:call-template>
                <b>Exception.</b> If any of the diesel fuel included in this claim <b>did</b> contain 
      visible evidence of dye, attach an explanation and check here
    </label>
            </div>
            <div style="float:right;padding-right:.5mm;">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselUseException"/>
              </xsl:call-template>
              <span style="letter-spacing:10px;font-weight:bold;"/>
              <span style="margin-left: 1mm; margin-right:1mm">
                <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
              </span>
              <input type="checkbox" class="styIRS4136Ckbox" name="VendorsFuel" id="VendorsFuel" value="">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselUseException"/>
                </xsl:call-template>
              </input>
            </div>
          </div>
          <div style="width:187mm;float:left;clear:left;" id="UDctn">
            <table class="styIRS4136Table" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th style="width:3mm;height:4mm;"/>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellA" style="text-align: center;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center;border-right-width:0;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 3A USE ON A FARM FOR FARMING PURPOSES -->
                <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCount" select="count($IRS4136Data/NontaxableUseOfUndyedDiesel)"/>
                <xsl:if test="$AGRowCount = 0 or ((count($IRS4136Data/NontaxableUseOfUndyedDiesel) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;">
                      <b>a</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="border-top-width:1px">Nontaxable use</td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="padding-left:5mm;">.243</td>
                    <td class="styIRS4136TableCellC">
                      <xsl:attribute name="style">text-align:left;</xsl:attribute>
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseOfUndyedDiesel"/>
                        <xsl:with-param name="ShortMessage" select=" 'true' "/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136Braces">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
      360
              <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontaxableUseOfUndyedDiesel) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/NontaxableUseOfUndyedDiesel">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
                          <b>a</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
          Nontaxable use
        </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">$.243</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136Braces">
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
                          <!-- <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableAviationGasolineCr" />
              </xsl:call-template> -->$
              <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
              360
              <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--  Row3B  -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;">
                    <b>b</b>
                  </td>
                  <td class="styIRS4136TableCellLine">Use on a farm for farming purposes</td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:5mm;">.243</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/UseOnFarmUndyedDieselFuelGals"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">$
        <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseFarmUndyedDslFuelGals"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">
      360
              <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row3C USE IN TRAINS  -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;">
                    <b>c</b>
                  </td>
                  <td class="styIRS4136TableCellLine">Use in trains</td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:5mm;">.22</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/TrainUseOfUndyedDieselGal"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/TrainUseOfUndyedDieselCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">
        353
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row3D USE IN CERTAIN INTERCITY AND LOCAL BUSES  -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-bottom:3.5mm;padding-left:4mm;padding-right:1.5mm;">
                    <b>d</b>
                  </td>
                  <td class="styIRS4136TableCellLine">Use in certain intercity and local buses (see <b>Caution</b>
				above line 1)</td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:5mm;">.17</td>
                  <td class="styIRS4136TableCellC" style="padding-top:2mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/UseOfUndyedDieselBusesGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD" style="padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/UseOfUndyedDieselInBusesCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE" style="padding-top:2mm;">
        350
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row3E EXPORTED  -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-bottom:.5mm;padding-right:1.5mm;padding-left:4mm;border-bottom-width:1px;">
                    <b>e</b>
                  </td>
                  <td class="styIRS4136TableCellLine">Exported</td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:5mm;">.244</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedUndyedDieselFuelGals"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedUndyedDieselFuelCr"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE" style="padding-top:1mm;">
        413
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--  END LINE 3  -->
          <!--   BEGIN BLOCK 4 -->
          <!--   BEGIN LINE 4  -->
          <div class="styIRS4136NumLine" style="padding-top:3mm;padding-bottom:1.5mm;padding-left:2mm;float: none; clear: both">
  4<span class="styIRS4136NBSP" style="padding-right:3mm;"/> Nontaxable Use of Undyed Kerosene (Other Than Kerosene Used in Aviation) 
 </div>
          <!--   BEGIN BLOCK DESCRIPTION   -->
          <div class="styIRS4136DescLine" style="margin-left:8mm; width:180mm;margin-right: 5mm;">
  Claimant certifies that the kerosene did not contain visible evidence of dye.
</div>
          <div class="styBB" style="width:179mm;margin-left:4mm;font-size:6.35pt;">
            <div style="float:left;padding-top:.5mm;">
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneUseException"/>
                </xsl:call-template>
                <b>Exception.</b> If any of the kerosene included in this claim <b>did</b> contain 
      visible evidence of dye, attach an explanation and check here
    </label>
            </div>
            <div style="float:right;padding-right:.5mm;">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneUseException"/>
              </xsl:call-template>
              <span style="letter-spacing:10px;font-weight:bold;"/>
              <span style="margin-left: 1mm; margin-right:1mm">
                <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
              </span>
              <input type="checkbox" class="styIRS4136Ckbox" name="VendorsFuel" id="VendorsFuel" value="">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneUseException"/>
                </xsl:call-template>
              </input>
            </div>
          </div>
          <div style="width:187mm;float:left;clear:left;" id="UDctn">
            <table class="styIRS4136Table" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th style="width:3mm;height:4mm;"/>
                  <th class="styIRS4136TableCellLine">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellA" style="text-align: center;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center;border-right-width:0;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 4A NONTAXABLE USE  -->
                <!-- ********************************************************************************************************** -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCount" select="count($IRS4136Data/NontaxableUseOfUndyedKerosene)"/>
                <xsl:if test="$AGRowCount = 0 or ((count($IRS4136Data/NontaxableUseOfUndyedKerosene) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;">
                      <b>a</b>
                    </td>
                    <td class="styIRS4136TableCellLine">Nontaxable use</td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="padding-left:5mm;">$.243</td>
                    <td class="styIRS4136TableCellC">
                      <xsl:attribute name="style">text-align:left;</xsl:attribute>
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseOfUndyedDiesel"/>
                        <xsl:with-param name="ShortMessage" select=" 'true' "/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136Braces">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
      346
              <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontaxableUseOfUndyedKerosene) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/NontaxableUseOfUndyedKerosene">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
                          <b>a</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
          Nontaxable use taxed at $.244
        </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">$.243</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136Braces">
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>$
              <!-- <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableAviationGasolineCr" />
              </xsl:call-template> -->
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
              346
              <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--  Row4B  -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;">
                    <b>b</b>
                  </td>
                  <td class="styIRS4136TableCellLine">Use on a farm for farming purposes</td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:5mm;">.243</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneForFarmingGal"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">$
        <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneForFarmingCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">
        346
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!-- ********************************************************************************************************** -->
                <!--  Row4C USE IN CERTAIN INTERCITY AND LOCAL BUSES  -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-bottom:4mm;padding-left:4mm;padding-right:1.5mm;">
                    <b>c</b>
                  </td>
                  <td class="styIRS4136TableCellLine">Use in certain intercity and local buses (see <b>Caution</b>
				above line 1)</td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:4.5mm;">.17</td>
                  <td class="styIRS4136TableCellC" style="padding-top:2mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneBusesGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD" style="padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/UseOfUndyedKeroseneCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE" style="padding-top:2mm;">
        347
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 4d EXPORTED  -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-bottom:.5mm;padding-right:1.5mm;padding-left:4mm;border-bottom-width:1px;">
                    <b>d</b>
                  </td>
                  <td class="styIRS4136TableCellLine">Exported</td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:3mm;">.244</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedUndyedKeroseneGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedUndyedKeroseneCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE" style="padding-top:1mm;">
        414
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!-- ************************************************************************************************************* -->
                <!--  Row 4e Nontaxable use taxed at $.044 -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-bottom:.5mm;padding-right:1.5mm;padding-left:4mm;border-bottom-width:1px;">
                    <b>e</b>
                  </td>
                  <td class="styIRS4136TableCellLine">Nontaxable use taxed at $.044</td>
                  <td class="styIRS4136TableCellA">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseTaxedAt044/TypeOfUse"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:3mm;">.043</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseTaxedAt044/Gallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseTaxedAt044Credit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE" style="padding-top:1mm;">
        377
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 4f   -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-bottom:.5mm;padding-right:1.5mm;padding-left:4mm;border-bottom-width:1px;">
                    <b>f</b>
                  </td>
                  <td class="styIRS4136TableCellLine">Nontaxable use taxed at $.219</td>
                  <td class="styIRS4136TableCellA">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseTaxedAt219TypeUse/TypeOfUse"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:3mm;">.218</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseTaxedAt219TypeUse/Gallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseTaxedAt219Credit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE" style="padding-top:1mm;">
        369
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!-- ************************************************************************************************************* -->
                <!--  Row 4e EXPORTED 
    <tr>
      <td class="styIRS4136LetterCell" style="padding-bottom:.5mm;padding-right:1.5mm;padding-left:4mm;border-bottom-width:1px;"><b>e</b></td>
      <td class="styIRS4136TableCellLine">Nontaxable use taxed at $.044</td>
      <td class="styIRS4136TableCellA" style="background-color: lightgrey">
        <span class="styIRS4136TableCellPad"></span>
      </td>
      <td class="styIRS4136TableCellB" style="padding-left:3mm;">.043</td>
      <td class="styIRS4136TableCellC">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="MaxSize" select="9" />
          <xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedUndyedKeroseneGallons" />
        </xsl:call-template>
        <span class="styIRS4136TableCellPad"></span>
      </td>
      <td class="styIRS4136Braces"><span class="styIRS4136TableCellPad"></span></td>
  
      <td class="styIRS4136TableCellD" >
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedUndyedKeroseneCredit" />
        </xsl:call-template>
        <span class="styIRS4136TableCellPad"></span>
      </td>
      <td class="styIRS4136TableCellE" style="padding-top:1mm;">
        377
        <span class="styIRS4136TableCellPad"></span>
      </td>     
      </tr>  -->
                <!--  Row 4f EXPORTED 
    <tr>
      <td class="styIRS4136LetterCell" style="padding-bottom:.5mm;padding-right:1.5mm;padding-left:4mm;border-bottom-width:1px;"><b>f</b></td>
      <td class="styIRS4136TableCellLine">Nontaxable use taxed at $.219</td>
      <td class="styIRS4136TableCellA" style="background-color: lightgrey">
        <span class="styIRS4136TableCellPad"></span>
      </td>
      <td class="styIRS4136TableCellB" style="padding-left:3mm;">.218</td>
      <td class="styIRS4136TableCellC">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="MaxSize" select="9" />
          <xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedUndyedKeroseneGallons" />
        </xsl:call-template>
        <span class="styIRS4136TableCellPad"></span>
      </td>
      <td class="styIRS4136Braces"><span class="styIRS4136TableCellPad"></span></td>
  
      <td class="styIRS4136TableCellD" >
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedUndyedKeroseneCredit" />
        </xsl:call-template>
        <span class="styIRS4136TableCellPad"></span>
      </td>
      <td class="styIRS4136TableCellE" style="padding-top:1mm;">
        369
        <span class="styIRS4136TableCellPad"></span>
      </td>     
      </tr>   -->
              </tbody>
            </table>
          </div>
          <!--  END LINE 4  -->
          <!--BEGIN FOOTER-->
          <div style="width:187mm; padding-top:1mm;padding-bottom:2mm;">
            <div style="float: left; clear: none;">
              <span class="styBoldText">For Paperwork Reduction Act Notice, see the separate instructions.</span>
            </div>
            <div style="float:right">
    Cat. No. 12625R
    <span style="width:70px"/>
    Form <span class="styBoldText" style="font-size: 8pt">4136</span> (2009)
  </div>
          </div>
          <div class="pageEnd"/>
          <!--END FOOTER-->
          <!--BEGIN HEADER-->
          <div class="styBB" style="width:187mm">
            <div style="float: left; clear: none">Form 4136 (2009)</div>
            <div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">2</span>
            </div>
          </div>
          <!--END HEADER-->
          <!--   BEGIN LINE 5   -->
          <!--   BEGIN BLOCK DESCRIPTION   -->
          <!-- <div class="styIRS4136DescLine" style="margin-left: 5mm; margin-right: 5mm;">-->
          <!--   BEGIN LINE 12   -->
          <div class="styIRS4136NumLine" style="float: none; clear: both;padding-top:1px;padding-left:2mm;padding-bottom:2mm;">
            <br/>
    5
    <span class="styIRS4136NBSP" style="padding-right:3mm;"/>
            <b>Kerosene Used in Aviation </b>
            <span style="font-weight:normal">(see </span>Caution <span style="font-weight:normal">above line 1)</span>
            <!-- <div style="width:186mm;background-color:pink;"></div>-->
          </div>
          <div style="width:187mm;float:left;clear:left;styBB;" id="UVctn">
            <table class="styIRS4136Table" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th style="width:3mm;height:4mm;"/>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellA" style="text-align: center">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 5A -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm; border-bottom-width:4mm;border-color:white">
                    <b>a</b>
                  </td>
                  <td class="styIRS4136TableCellLine">Kerosene used in commercial aviation (other than foreign
trade) taxed at $.244</td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:1mm;text-align:center;">$ .200</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneTaxedAt244Gallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
          $<xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneTaxedAt244Credit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">417<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 5B -->
                <tr>
                  <td class="styIRS4136LetterCell" style="border-bottom-width:1px;padding-left:4mm;padding-right:1.5mm;padding-top:5mm;
        border-bottom-width:10mm;border-color:white">
                    <b>b</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:90mm;padding-bottom:7mm;">Kerosene used in commercial aviation (other than foreign trade) taxed at $.219/.044*<br/>
                  </td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">175/.000*</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneTaxedAt219Gallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneTaxedAt219Credit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">355<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 5C  -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCount" select="count($IRS4136Data/NontaxableUseTaxedAt244)"/>
                <xsl:if test="$AGRowCount = 0 or ((count($IRS4136Data/NontaxableUseTaxedAt244) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                      <b>c</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="vertical-align:middle;">Nontaxable use (other than use by state or local government) taxed at $.244

      </td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">
    .243</td>
                    <td class="styIRS4136TableCellC" style="text-align:left;">
                      <span class="styIRS4136TableCellPad"/>
                      <xsl:if test=" ((count($IRS4136Data/NontaxableUseTaxedAt244) &gt; 1) and ($Print = $Separated))">
                        <xsl:attribute name="style">text-align:left;</xsl:attribute>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseTaxedAt244Cr"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
        346
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontaxableUseTaxedAt244) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/NontaxableUseTaxedAt244">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
                          <b>c</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
       Nontaxable use (other than use by state or local government) taxed at $.244

        </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.243</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseTaxedAt244Cr"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
              346
              <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--  Row 5D  -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCount2" select="count($IRS4136Data/NontaxableUseTaxedAt219)"/>
                <xsl:if test="$AGRowCount2 = 0 or ((count($IRS4136Data/NontaxableUseTaxedAt219) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                      <b>d</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="vertical-align:middle;">Nontaxable use (other than use by state or local government) taxed at $.219/.044*


      </td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">
   .218/.043*</td>
                    <td class="styIRS4136TableCellC" style="text-align:left;">
                      <span class="styIRS4136TableCellPad"/>
                      <xsl:if test=" ((count($IRS4136Data/NontaxableUseTaxedAt219) &gt; 1) and ($Print = $Separated))">
                        <xsl:attribute name="style">text-align:left;</xsl:attribute>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseTaxedAt219"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE"> 360
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontaxableUseTaxedAt219) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/NontaxableUseTaxedAt219">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>
                          <b>d</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>
                         Nontaxable use (other than use by state or local government) taxed at $.219/.044*
                       </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.218/.043*</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseTaxedAt219Cr"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>
              360
              <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--  Row 5E -->
                <!--  *******************************************************************************************  -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCount5e" select="count($IRS4136Data/LUSTTaxAvnFuel)"/>
                <xsl:if test="$AGRowCount5e = 0 or ((count($IRS4136Data/LUSTTaxAvnFuel) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                      <b>e</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                      LUST tax on aviation fuels used in foreign trade

      </td>
                    <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">
    .001</td>
                    <td class="styIRS4136TableCellC" style="text-align:left;">
                      <span class="styIRS4136TableCellPad"/>
                      <xsl:if test=" ((count($IRS4136Data/LUSTTaxAvnFuel) &gt; 1) and ($Print = $Separated))">
                        <xsl:attribute name="style">text-align:left;</xsl:attribute>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTaxAvnFuel"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
        433
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/LUSTTaxAvnFuel) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/LUSTTaxAvnFuel">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount5e"/></xsl:attribute>
                          <b>e</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount5e"/></xsl:attribute>
                           LUST tax on aviation fuels used in foreign trade

        </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA" style="border-bottom-color:lightgrey;background-color: lightgrey;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Type"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.001</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="."/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount5e"/></xsl:attribute>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTaxAvnFuelCredit"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount5e"/></xsl:attribute>
              433
              <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--  *******************************************************************************************  -->
              </tbody>
            </table>
          </div>
          <div class="styBB" style="width:187mm;height:2mm;padding-left:8mm">
          *This rate applies after September 30, 2009.</div>
          <!--   END LINE 5   -->
          <!--   BEGIN BLOCK 6   -->
          <!--   BEGIN LINE 6   -->
          <div class="styIRS4136NumLine" style="width:186mm;float: none; clear: both;padding-left:2mm;">
            <br/>
  6<span class="styIRS4136NBSP" style="padding-right:3mm;"/>  Sales by Registered Ultimate Vendors of Undyed Diesel Fuel <span style="width:4mm;"/>
            <br/>
            <span style="padding-left:6mm"> Registration No.
  <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
              <span style="width:4px;"/>
              <span style="font-weight:normal">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$IRS4136Data/RegistrationUndyedDiesel"/>
                </xsl:call-template>
              </span>
            </span>
            <div style="width:187mm;"/>
          </div>
          <!--   END LINE 6   -->
          <!--   BEGIN BLOCK DESCRIPTION   -->
          <div class="styIRS4136DescLine" style="width:180mm;font-size: 7pt; margin-left: 8mm; margin-right: 8mm; ">
Claimant certifies that it sold the diesel fuel at a tax-excluded price, repaid the amount of tax to the buyer, or has obtained the written
consent of the buyer to make the claim. Claimant certifies that the diesel fuel did not contain visible evidence of dye.
</div>
          <div style="width:187mm;float:left;clear:left;" id="UVctn">
            <table class="styIRS4136Table" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th style="width:3mm;height:4mm;"/>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--   BEGIN BLOCK DESCRIPTION   -->
                <div class="styBB" style="width:180mm;margin-left:3.75mm;font-size:6.25pt;">
                  <div style="float:left;padding-top:1mm;padding-left:.5mm;">
                    <label>
                      <b>Exception.</b> If any of the diesel fuel included in this claim <b>did</b> contain 
      visible evidence of dye, attach an explanation and check here
    </label>
                  </div>
                  <div style="float:right;padding-right:.5mm;">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselSalesException"/>
                      <xsl:with-param name="TabOrder" select="1"/>
                    </xsl:call-template>
                    <span style="letter-spacing:10px;font-weight:bold;"/>
                    <span style="margin-left: 1mm; margin-right:1mm">
                      <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
                    </span>
                    <input type="checkbox" class="styIRS4136Ckbox" name="VendorsFuel" id="VendorsFuel" value="">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselSalesException"/>
                      </xsl:call-template>
                    </input>
                  </div>
                </div>
                <!--  Row 6A USE BY A STATE OR LOCAL GOVERNMENT -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;">
                    <b>a</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Use by a state or local government</td>
                  <td class="styIRS4136TableCellB" style="padding-left:1mm;text-align:center;">$ .243</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/StateLocalGovtDieselGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
          $<xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/StateLocalGovtDieselCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">360<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 6B  -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;border-bottom-width:1px;">
                    <b>b</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Use in certain intercity and local buses</td>
                  <td class="styIRS4136TableCellB" style="padding-left:7mm;">.17</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselFuelBusesGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselFuelBusesCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">350<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--  END LINE 6  -->
          <!--   BEGIN BLOCK 7   -->
          <!--   BEGIN LINE 7   -->
          <div class="styGenericDiv">
            <br/>
            <br/>
            <br/>
            <table class="styIRS4136Table" style="width:187mm;border-bottom:0px solid black;">
              <tbody>
                <tr class="styIRS4136NumLine">
                  <td style="float: none; padding-top: 2mm; border-bottom-width: 0px;border-top-width: 0px;" rowspan="2">
          7<span class="styIRS4136NBSP"/> 
          Sales by Registered Ultimate Vendors of Undyed Kerosene (Other Than Kerosene For Use in 
          Aviation)
        </td>
                  <br/>
                </tr>
              </tbody>
            </table>
          </div>
          <div style="width:187mm;border-bottom:1px solid black;padding-left:5.5mm">
            <b>
          Registration No.</b>
            <span style="width:8px"/>
            <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
            <span style="width:8px;"/>
            <span style="font-weight:normal">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$IRS4136Data/RegistrationUndyedKerosene"/>
              </xsl:call-template>
            </span>
          </div>
          <!--   END LINE 7   -->
          <!--   BEGIN BLOCK DESCRIPTION   -->
          <br/>
          <div class="styIRS4136DescLine" style="font-size: 7pt; margin-left: 5mm; margin-right: 15mm; padding-right:10mm">
Claimant certifies that it sold the kerosene at a tax-excluded price, repaid the amount of tax to the buyer, or has obtained the written consent
of the buyer to make the claim. Claimant certifies that the kerosene did not contain visible evidence of dye.
</div>
          <div style="width:183mm;margin-left:2.75mm;font-size:6.3pt;">
            <div style="float:left;padding-top:1mm;padding-left:3mm">
              <label>
                <b>Exception.</b> If any of the kerosene included in this claim <b>did</b> 
      contain visible evidence of dye, attach an explanation and check here
    </label>
            </div>
            <div style="float:right;padding-right:.5mm;">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneSalesException"/>
                <xsl:with-param name="TabOrder" select="1"/>
              </xsl:call-template>
              <span style="letter-spacing:10px;font-weight:bold;font-size:6pt;"/>
              <span style="margin-left: 1mm; margin-right:1mm">
                <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
              </span>
              <input type="checkbox" class="styIRS4136Ckbox" name="VendorsFuel" id="VendorsFuel" value="">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneSalesException"/>
                </xsl:call-template>
              </input>
            </div>
          </div>
          <div style="width:187mm;float:left;clear:left;" id="UVctn">
            <table class="styIRS4136Table" style="width:187mm;" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th class="styIRS4136TableCellLine" style="width:3mm;height:4mm;border-bottom-width:0px;border-right-width:0;border-top-width:1px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px;border-top-width:1px;border-right-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellA" style="text-align: center;border-top-width:1px; border-bottom-width:0px;;">
                    <span style="width:1mm;"/>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center;border-top-width:1px;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center;border-top-width:1px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styIRS4136Braces" style="border-top-width:1px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center;border-top-width:1px;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center;border-top-width:1px;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 7A USE ON A FARM FOR FARMING PURPOSES -->
                <tr>
                  <td class="styIRS4136LetterCell">
                    <b>a</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="border-right-width:0px;">Use by a state or local government
      </td>
                  <td class="styIRS4136TableCellA" style="border-left-width:0px;">
                    <span style="width:1mm;"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">$ .243</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/StateLocalGovtKeroseneGallons"/>
                    </xsl:call-template>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/StateLocalGovtKeroseneGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces" rowspan="2">
                    <img src="{$ImagePath}/4136_Bracket_L2L3L4.gif" alt="bracket"/>
                  </td>
                  <td class="styIRS4136TableCellD" rowspan="2">
                    <!--        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$IRS4136Data/DieselSoldCredit"/>
          <xsl:with-param name="TabOrder" select="4"/>
        </xsl:call-template>    -->   
       $ <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneSoldBlockedPumpCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE" rowspan="2">
        346
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 7B USE BY A STATE OR LOCAL GOVERNMENT  -->
                <tr>
                  <td class="styIRS4136LetterCell">
                    <b>b</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="border-right-width:0px">Sales from a blocked pump</td>
                  <td class="styIRS4136TableCellA">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:3.5mm;text-align:center;">.243</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/BlockedPumpKeroseneGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 7C USE BY A STATE OR LOCAL GOVERNMENT  -->
                <tr>
                  <td class="styIRS4136LetterCell" style="border-bottom-width:1px;">
                    <b>c</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="border-right-width:0px;">Use in certain intercity and local buses</td>
                  <td class="styIRS4136TableCellA">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:8mm;">.17</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/UseInCertainBusesGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/UseInCertainBusesCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">
        347
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--   END LINE 7    -->
          <!--   BEGIN LINE 8   -->
          <!--   BEGIN BLOCK 8   -->
          <!-- Number of rows in table 8 -->
          <xsl:variable name="table8RowCount" select="3 + count($IRS4136Data/OtherNontaxUseAviationGrade)"/>
          <!--   BEGIN LINE 8   -->
          <div class="styIRS4136NumLine" style="float: none; clear: both; padding-bottom:1mm;">
            <br/>
            <br/>
            <br/>
   
  8<span class="styIRS4136NBSP"/> Sales by Registered Ultimate Vendors of Kerosene For Use in Aviation<br/>
            <span style="padding-left:4.5mm">Registration No.</span>
            <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
            <span style="width:6px;"/>
            <span style="font-weight:normal">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$IRS4136Data/RegistrationVendorsAviation"/>
              </xsl:call-template>
            </span>
          </div>
          <div class="styIRS4136DescLine" style="font-size: 7pt; margin-left: 5mm; margin-right: 5mm; padding-right:10mm">
    Claimant sold the kerosene for use in aviation at a tax-excluded price and has not collected the amount of tax from the buyer, repaid 
    the amount of tax to the buyer, or has obtained the written consent of the buyer to make the claim. See the instructions for additional 
    information to be submitted.
</div>
          <div class="styIRS4136TableContainer8" style="height:24mm;" id="8bFctn;">
            <!--print logic-->
            <xsl:call-template name="SetInitialState"/>
            <!--end-->
            <table class="styIRS4136Table" style="width:187mm;" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px;border-top-width:1px;border-right-width:0;width:3mm;height:4mm;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px;border-top-width:1px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellA" style="text-align: center;border-top-width:1px;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center;border-top-width:1px;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center;border-top-width:1px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styIRS4136Braces" style="border-top-width:1px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center;border-top-width:1px;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center;border-top-width:1px;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 8A USE IN COMMERCIAL AVIATION (OTHER THAN FOREIGN TRADE) -->
                <xsl:variable name="Line8bcount" select="count($IRS4136Data/OtherNontaxUseAviationGrade)"/>
                <tr>
                  <td class="styIRS4136LetterCell " style=";border-bottom-width:9mm;border-color:white;padding-bottom:8mm">
                    <b>a</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="padding-bottom:13mm;">
                  Use in commercial aviation (other than foreign trade) taxed at
                   $.219/.044*<br/>
                  </td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-top:2mm; text-align:center;">
        $ .175/.000*
        <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/UseCmrclAviation219Kerosene"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
   
       $
           <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/UseCmrclAviation219KeroseneCr"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">
        355
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 8B OTHER NONTAXABLE USE  -->
                <td class="styIRS4136LetterCell " style="padding-bottom:4mm;">
                  <b>b</b>
                </td>
                <td class="styIRS4136TableCellLine">Use in commercial aviation (other than foreign trade) taxed at $.244</td>
                <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                  <span class="styIRS4136TableCellPad"/>
                </td>
                <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;padding-top:3mm;">
         .200
        <span class="styIRS4136TableCellPad"/>
                </td>
                <td class="styIRS4136TableCellC">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="MaxSize" select="9"/>
                    <xsl:with-param name="TargetNode" select="$IRS4136Data/UseCmrclAviation244Kerosene"/>
                  </xsl:call-template>
                  <span class="styIRS4136TableCellPad"/>
                </td>
                <td class="styIRS4136Braces">
                  <span class="styIRS4136TableCellPad"/>
                </td>
                <td class="styIRS4136TableCellD">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$IRS4136Data/UseCmrclAviation244KeroseneCr"/>
                  </xsl:call-template>
                  <span class="styIRS4136TableCellPad"/>
                </td>
                <td class="styIRS4136TableCellE">
        417
        <span class="styIRS4136TableCellPad"/>
                </td>
                <!--  Row 8C  -->
                <tr>
                  <td class="styIRS4136LetterCell ">
                    <b>c</b>
                  </td>
                  <td class="styIRS4136TableCellLine">Nonexempt use in noncommercial aviation</td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-top:3mm;padding-left:1.5mm;text-align:center;">
      .025/.200*
        <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/NonexemptUseNonCmrclAviation"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/NonexemptUseNonCmrclAviationCr"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">
        418
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!-- ########################################################## -->
                <!--  Row 8D  -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCount" select="count($IRS4136Data/OtherNontaxableUseTaxedAt244)"/>
                <xsl:if test="$AGRowCount = 0 or ((count($IRS4136Data/OtherNontaxableUseTaxedAt244) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="padding-left:3mm;padding-right:2mm;">
                      <b>d</b>
                    </td>
                    <td class="styIRS4136TableCellLine">Other nontaxable uses taxed at $.244</td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="padding-left:5mm;">.243</td>
                    <td class="styIRS4136TableCellC">
                      <xsl:attribute name="style">text-align:left;</xsl:attribute>
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseOfUndyedDiesel"/>
                        <xsl:with-param name="ShortMessage" select=" 'true' "/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136Braces">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
        346
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/OtherNontaxableUseTaxedAt244) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/OtherNontaxableUseTaxedAt244">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
                          <b>d</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
        Other nontaxable uses taxed at $.244
        </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.243</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <td class="styIRS4136Braces">
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/OtherNontaxableUseTaxedAt244Cr"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
              346
              <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!-- ############################################################# -->
                <!-- ########################################################## -->
                <!--  Row 8E  -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCount2" select="count($IRS4136Data/OtherNontaxableUseTaxedAt219)"/>
                <xsl:if test="$AGRowCount2 = 0 or ((count($IRS4136Data/OtherNontaxableUseTaxedAt219) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="padding-left:3mm;padding-right:2mm;">
                      <b>e</b>
                    </td>
                    <td class="styIRS4136TableCellLine">Other nontaxable uses taxed at $.219/.044*</td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="padding-left:1mm;">.218/.043*</td>
                    <td class="styIRS4136TableCellC">
                      <xsl:attribute name="style">text-align:left;</xsl:attribute>
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$IRS4136Data/OtherNontaxableUseTaxedAt219Cr"/>
                        <xsl:with-param name="ShortMessage" select=" 'true' "/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136Braces">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
        346
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/OtherNontaxableUseTaxedAt219) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/OtherNontaxableUseTaxedAt219">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>
                          <b>e</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>
          Other nontaxable uses taxed at $.219/.044*



        </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.218/.043*</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <td class="styIRS4136Braces">
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/OtherNontaxableUseTaxedAt219Cr"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>
              369
              <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!-- ############################################################# -->
                <!--  Row 8F  -->
                <tr>
                  <td class="styIRS4136LetterCell ">
                    <b>f</b>
                  </td>
                  <td class="styIRS4136TableCellLine">LUST tax on aviation fuels used in foreign trade</td>
                  <td class="styIRS4136TableCellA" style="background-color: lightgrey">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellB" style="padding-left:1.5mm;text-align:center;">
      .001
        <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTxAviationFuels"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136Braces">
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTxAviationFuelCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">
        433
        <span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!-- ############################################################# -->
              </tbody>
            </table>
          </div>
          <xsl:call-template name="SetInitialDynamicTableHeightRowCount">
            <xsl:with-param name="DataRowCount" select="$table8RowCount"/>
            <xsl:with-param name="containerHeight" select="4"/>
            <xsl:with-param name="containerID" select=" '8bFctn' "/>
          </xsl:call-template>
          <!--   END LINE 8   -->
          <div class="styBB" style="width:187mm;height:2mm;padding-left:6mm">
              *This rate applies after September 30, 2009.</div>
          <!--BEGIN FOOTER-->
          <div style="width:187mm; padding-top:1mm;padding-bottom:2mm;">
            <div style="float: left; clear: none;">
              <span class="styBoldText"/>
            </div>
            <div style="float:right">
              <span style="width:70px"/>
    Form <span class="styBoldText" style="font-size: 8pt">4136</span> (2009)
  </div>
          </div>
          <div class="pageEnd"/>
          <!--END FOOTER-->
          <!--BEGIN HEADER-->
          <div class="styBB" style="width:187mm">
            <div style="float: left; clear: none">Form 4136 (2009)</div>
            <div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">3</span>
            </div>
          </div>
          <!--END HEADER-->
          <!--   BEGIN LINE 09   -->
          <div class="styIRS4136NumLine" style="float: none; clear: both">
            <br/>
            <br/>
    9
    <span class="styIRS4136NBSP"/>  
    Alcohol Fuel Mixture Credit<br/>
            <span style="width:5mm;"/> 
    Registration No.
    <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
            <span style="width:8px;"/>
            <span style="font-weight:normal">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$IRS4136Data/RegistrationNumberAlcoholFuel"/>
              </xsl:call-template>
            </span>
            <br/>
            <br/>
          </div>
          <!--<div class="styIRS4136DescLine" style="font-size: 7pt;">
  <div style="width:5mm;float:left;clear:none;"></div>
  <div style="width:182mm;border:solid black 1; border-top-width:0px;border-right-width:0px;border-left-width:0px;float:right;clear:none;">-->
          <div class="styIRS4136DescLine" style="font-size: 7pt; margin-left: 5mm; margin-right: 5mm; padding-right:10mm;width:182mm;border:solid black 1; border-top-width:0px;border-right-width:0px;border-left-width:0px;">

    Claimant produced an alcohol fuel mixture by mixing taxable fuel with alcohol. The alcohol 
    fuel mixture was sold by the claimant to any person for use as a fuel or was used as a fuel 
    by the claimant.
  </div>
          <!--</div>-->
          <div style="width:187mm;float:left;clear:left;" id="UVctn">
            <table class="styIRS4136Table" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th style="width:3mm;height:4mm;"/>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center">
                    <b>(c) Gallons of alcohol</b>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 09A -->
                <tr>
                  <td class="styIRS4136LetterCell">
                    <b>a</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Alcohol fuel mixtures containing ethanol</td>
                  <td class="styIRS4136TableCellB" style="padding-left:4mm">$0.45
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/AlcoholFuelMixtureEthanolGals"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
          $<xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/AlcoholFuelMixtureEthanolCr"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">393<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 09B  -->
                <tr>
                  <td class="styIRS4136LetterCell" style="border-bottom-width:1px;">
                    <b>b</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Alcohol fuel mixtures containing alcohol (other than ethanol)</td>
                  <td class="styIRS4136TableCellB" style="padding-left:1.5mm;text-align: center">.60</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/AlcoholFuelMixtureAlcoholGals"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/AlcoholFuelMixtureAlcoholCr"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">394<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--   END LINE 09   -->
          <!--   BEGIN LINE 10   -->
          <div class="styIRS4136NumLine" style="float: none; clear: both">
            <br/>
            <br/>
    10
    <span class="styIRS4136NBSP"/>  
    Biodiesel or Renewable Diesel Mixture Credit<br/>
            <span style="width:5mm;"/>
            <span class="styIRS4136TableCellPad">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$IRS4136Data/RegistrationNumberBiodiesel"/>
              </xsl:call-template>
            </span> Registration No.
    <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
            <span style="width:8px;"/>
            <span style="font-weight:normal">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$IRS4136Data/RegistrationNumberBiodiesel"/>
              </xsl:call-template>
            </span>
            <br/>
            <br/>
          </div>
          <!--<div class="styIRS4136DescLine" style="font-size: 7pt;">
  <div style="width:5mm;float:left;clear:none;"></div>
  <div style="width:182mm;border:solid black 1; border-top-width:0px;border-right-width:0px;border-left-width:0px;float:right;clear:none;">-->
          <div class="styIRS4136DescLine" style="font-size: 7pt; margin-left:5mm; margin-right: 5mm;width:182mm;border:solid black 1; border-top-width:0px;border-right-width:0px;border-left-width:0px;">
            <b>Biodiesel mixtures. </b>Claimant produced a mixture by mixing biodiesel with diesel fuel. The biodiesel used to
       produce the mixture met ASTM D6751 and met EPA’s registration requirements for fuels and fuel 
       additives. The mixture was sold by the claimant to any person for use as a fuel or was used as a fuel by 
       the claimant. Claimant has attached the Certificate for Biodiesel and, if applicable, the Statement of 
       Biodiesel Reseller. <b>Renewable diesel mixtures.</b> Claimant produced a mixture by mixing renewable 
      diesel with liquid fuel (other than renewable diesel). The renewable diesel used to produce the renewable
      diesel mixture was derived from biomass process, met EPA’s registration requirements for fuels and fuel additives, and met 
      ASTM D975, D396, or other equivalent standard approved by the IRS. The mixture was sold by the claimant to any person for use as a fuel or was used 
      as a fuel by the aimant. Claimant has attached the Certificate for Biodiesel and, if applicable, the 
      Statement of Biodiesel Reseller, both of which have been edited as discussed in the Instructions for Form 
      4136. See the instructions for line 10 for information about renewable diesel in aviation.
   </div>
          <!--</div>-->
          <div style="width:187mm;float:left;clear:left;" id="UVctn">
            <table class="styIRS4136Table" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th style="width:3mm;height:4mm;"/>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center;font-size:2.15mm;">
                    <b>(c) Gallons of biodiesel or renewable diesel</b>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 10A -->
                <tr>
                  <td class="styIRS4136LetterCell">
                    <b>a</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Biodiesel (other than agri-biodiesel) mixtures</td>
                  <td class="styIRS4136TableCellB" style="text-align: center">$1.00/000*</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/BiodieselMixtureGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
          $<xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/BiodieselMixtureCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad">
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$IRS4136Data/BiodieselMixtureCredit"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="styIRS4136TableCellE">388<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 10B  -->
                <tr>
                  <td class="styIRS4136LetterCell">
                    <b>b</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Agri-biodiesel mixtures</td>
                  <td class="styIRS4136TableCellB">$1.00/000*</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/AgriBiodieselMixtureGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/AgriBiodieselMixtureCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">390<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 10C  -->
                <tr>
                  <td class="styIRS4136LetterCell" style="border-bottom-width:1px;">
                    <b>c</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Renewable diesel mixtures</td>
                  <td class="styIRS4136TableCellB">$1.00/000*</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/RenewableDieselMixtureGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/RenewableDieselMixtureCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">307<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div style="width:187mm;height:2mm;padding-left:6mm">
              *This rate applies after December 31, 2009.</div>
          <!--   END LINE 10   -->
          <xsl:variable name="table9RowCount" select="3 + count($IRS4136Data/OtherNontaxableUseAviationGrade)"/>
          <xsl:variable name="RowCount11C" select="count($IRS4136Data/OtherNontaxableUse)"/>
          <!-- BEGIN LINE 11  Nontaxable Use of Alternative Fuel (after September 30, 2006) -->
          <xsl:variable name="RowCount11" select="count($IRS4136Data/OtherNontaxableUse)"/>
          <div class="styIRS4136NumLine" style="float: none; clear: both;">
            <br/>
            <br/>
            <br/>
    11
    <span class="styIRS4136NBSP"/>  
    Nontaxable Use of Alternative Fuel 
    <span style="width:182mm;"/>
            <br/>
          </div>
          <div style="width:187mm;font-size:6pt;padding-bottom:.5mm;border-top-width:1px;">
            <div style="float:left;padding-top:1mm;margin-left:2.5mm;padding-left:4mm">
              <label>
                <b>Caution.</b> There is a reduced credit rate for use in certain intercity and local buses (type of use 5).
         See page 4 in the Instructions for Form 4136 for the credit rate.  
      </label>
            </div>
            <span style="width:7mm;text-align:right;float:right; clear: none">
              <xsl:call-template name="SetDynamicTableToggleRowCount">
                <xsl:with-param name="DataRowCount" select="$RowCount11 + 2"/>
                <xsl:with-param name="containerHeight" select="3"/>
                <xsl:with-param name="containerID" select=" '14ctn' "/>
              </xsl:call-template>
            </span>
          </div>
          <div style="width:187mm;float:left;clear:left;" id="14ctn">
            <table class="styIRS4136Table" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th style="width:3mm;height:4mm;;border-top-width:1px;"/>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px;border-top-width:1px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellA" style="text-align: center;border-top-width:1px;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center;border-top-width:1px;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center;border-top-width:1px;">
                    <b>(c) Gallons or gasoline gallon equivalents (GGE)</b>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center;border-top-width:1px;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center;border-top-width:1px;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 11A -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCount" select="count($IRS4136Data/NontxLiquifiedPetroleumGas)"/>
                <xsl:if test="$AGRowCount = 0 or ((count($IRS4136Data/NontxLiquifiedPetroleumGas) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                      <b>a</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="vertical-align:middle;">Liquefied petroleum gas (LPG)

      </td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">
   $ .183</td>
                    <td class="styIRS4136TableCellC" style="text-align:left;">
                      <span class="styIRS4136TableCellPad"/>
                      <xsl:if test=" ((count($IRS4136Data/NontxLiquifiedPetroleumGas) &gt; 1) and ($Print = $Separated))">
                        <xsl:attribute name="style">text-align:left;</xsl:attribute>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquifiedPetroleumGasCr"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
       419
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxLiquifiedPetroleumGas) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/NontxLiquifiedPetroleumGas">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
                          <b>a</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
          Liquefied petroleum gas (LPG)


        </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">$ .183</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>$
               <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquifiedPetroleumGasCr"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
             419
             <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--  Row 11B -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCountb" select="count($IRS4136Data/NontxPSeriesFuels)"/>
                <xsl:if test="$AGRowCountb = 0 or ((count($IRS4136Data/NontxPSeriesFuels) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                      <b>b</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="vertical-align:middle;">“P Series” fuels
      </td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">
    .183</td>
                    <td class="styIRS4136TableCellC" style="text-align:left;">
                      <span class="styIRS4136TableCellPad"/>
                      <xsl:if test=" ((count($IRS4136Data/NontxPSeriesFuels) &gt; 1) and ($Print = $Separated))">
                        <xsl:attribute name="style">text-align:left;</xsl:attribute>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxPSeriesFuelsCredit"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
        420
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxPSeriesFuels) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/NontxPSeriesFuels">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountb"/></xsl:attribute>
                          <b>b</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountb"/></xsl:attribute>
          “P Series” fuels


        </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.183</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountb"/></xsl:attribute>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxPSeriesFuelsCredit"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountb"/></xsl:attribute>
             420
              <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--  Row 11C -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCountc" select="count($IRS4136Data/NontxCompressedNaturalGas)"/>
                <xsl:if test="$AGRowCountc = 0 or ((count($IRS4136Data/NontxCompressedNaturalGas) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                      <b>c</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="vertical-align:middle;">Compressed natural gas (CNG) (GGE = 126.67 cu. ft.)
      </td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">
    .183</td>
                    <td class="styIRS4136TableCellC" style="text-align:left;">
                      <span class="styIRS4136TableCellPad"/>
                      <xsl:if test=" ((count($IRS4136Data/NontxCompressedNaturalGas) &gt; 1) and ($Print = $Separated))">
                        <xsl:attribute name="style">text-align:left;</xsl:attribute>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxCompressedNaturalGasCr"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
        421
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxCompressedNaturalGas) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/NontxCompressedNaturalGas">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountc"/></xsl:attribute>
                          <b>c</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountc"/></xsl:attribute>
        Compressed natural gas (CNG) (GGE = 126.67 cu. ft.)
        </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.183</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountc"/></xsl:attribute>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxCompressedNaturalGasCr"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountc"/></xsl:attribute>
             421
              <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--  Row 11D -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCountd" select="count($IRS4136Data/NontxLiquifiedHydrogen)"/>
                <xsl:if test="$AGRowCountd = 0 or ((count($IRS4136Data/NontxLiquifiedHydrogen) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                      <b>d</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="vertical-align:middle;">Liquefied hydrogen
      </td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">
    .183</td>
                    <td class="styIRS4136TableCellC" style="text-align:left;">
                      <span class="styIRS4136TableCellPad"/>
                      <xsl:if test=" ((count($IRS4136Data/NontxLiquifiedHydrogen) &gt; 1) and ($Print = $Separated))">
                        <xsl:attribute name="style">text-align:left;</xsl:attribute>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquifiedHydrogenCredit"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
        422
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxLiquifiedHydrogen) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/NontxLiquifiedHydrogen">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountd"/></xsl:attribute>
                          <b>d</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountd"/></xsl:attribute>
       Liquefied hydrogen
        </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.183</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountd"/></xsl:attribute>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquifiedHydrogenCredit"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountd"/></xsl:attribute>
             422
              <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--  Row 11E -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCounte" select="count($IRS4136Data/NontxLqfdFuelDerivedFromCoal)"/>
                <xsl:if test="$AGRowCounte = 0 or ((count($IRS4136Data/NontxLqfdFuelDerivedFromCoal) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                      <b>e</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="vertical-align:middle;">Any liquid fuel derived from coal
         (including peat) through the Fischer-Tropsch process


      </td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">
    .243</td>
                    <td class="styIRS4136TableCellC" style="text-align:left;">
                      <span class="styIRS4136TableCellPad"/>
                      <xsl:if test=" ((count($IRS4136Data/NontxLqfdFuelDerivedFromCoal) &gt; 1) and ($Print = $Separated))">
                        <xsl:attribute name="style">text-align:left;</xsl:attribute>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLqfdFuelDerivedFromCoalCr"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
        423
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxLqfdFuelDerivedFromCoal) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/NontxLqfdFuelDerivedFromCoal">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounte"/></xsl:attribute>
                          <b>e</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounte"/></xsl:attribute>
     Any liquid fuel derived from coal (including peat) through
the Fischer-Tropsch process
        </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.243</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounte"/></xsl:attribute>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLqfdFuelDerivedFromCoalCr"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounte"/></xsl:attribute>
             423
              <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--  Row 11F -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCountf" select="count($IRS4136Data/NontxLiqHydrcrbnsDerBiomass)"/>
                <xsl:if test="$AGRowCountf = 0 or ((count($IRS4136Data/NontxLiqHydrcrbnsDerBiomass) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                      <b>f</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="vertical-align:middle;">Liquid fuel derived from biomass


      </td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">
    .243</td>
                    <td class="styIRS4136TableCellC" style="text-align:left;">
                      <span class="styIRS4136TableCellPad"/>
                      <xsl:if test=" ((count($IRS4136Data/NontxLiqHydrcrbnsDerBiomass) &gt; 1) and ($Print = $Separated))">
                        <xsl:attribute name="style">text-align:left;</xsl:attribute>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiqHydrcrbnsDerBiomassCr"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
        424
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxLiqHydrcrbnsDerBiomass) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/NontxLiqHydrcrbnsDerBiomass">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>
                          <b>f</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>
    Liquid fuel derived from biomass
        </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.243</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiqHydrcrbnsDerBiomassCr"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>
             424
              <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--  Row 11G -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCountg" select="count($IRS4136Data/NontxLiquifiedNaturalGas)"/>
                <xsl:if test="$AGRowCountg = 0 or ((count($IRS4136Data/NontxLiquifiedNaturalGas) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                      <b>g</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="vertical-align:middle;">Liquefied natural gas (LNG)


      </td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">
    .243</td>
                    <td class="styIRS4136TableCellC" style="text-align:left;">
                      <span class="styIRS4136TableCellPad"/>
                      <xsl:if test=" ((count($IRS4136Data/NontxLiquifiedNaturalGas) &gt; 1) and ($Print = $Separated))">
                        <xsl:attribute name="style">text-align:left;</xsl:attribute>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquifiedNaturalGasCredit"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
        425
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxLiquifiedNaturalGas) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/NontxLiquifiedNaturalGas">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountg"/></xsl:attribute>
                          <b>g</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountg"/></xsl:attribute>
  Liquefied natural gas (LNG)
        </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.243</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquifiedNaturalGasCredit"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountg"/></xsl:attribute>
             425
              <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--  Row 11H -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCounth" select="count($IRS4136Data/LiquefiedGasBiomass)"/>
                <xsl:if test="$AGRowCounth = 0 or ((count($IRS4136Data/LiquefiedGasBiomass) &gt; 1) 
                and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                      <b>h</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="vertical-align:middle;">Liquefied gas derived from biomass
                    </td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">
    .183</td>
                    <td class="styIRS4136TableCellC" style="text-align:left;">
                      <span class="styIRS4136TableCellPad"/>
                      <xsl:if test=" ((count($IRS4136Data/LiquefiedGasBiomass) &gt; 1) and ($Print = $Separated))">
                        <xsl:attribute name="style">text-align:left;</xsl:attribute>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedGasBiomass"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
        435
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/LiquefiedGasBiomass) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/LiquefiedGasBiomass">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounth"/></xsl:attribute>
                          <b>h</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounth"/></xsl:attribute>
                          Liquified gas derived from biomass
                         </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.183</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounth"/></xsl:attribute>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedGasBiomassCredit"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounth"/></xsl:attribute>
             435
              <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
              </tbody>
            </table>
          </div>
          <xsl:call-template name="SetInitialDynamicTableHeightRowCount">
            <xsl:with-param name="DataRowCount" select="$RowCount11 + 2"/>
            <xsl:with-param name="containerHeight" select="3"/>
            <xsl:with-param name="containerID" select=" '14ctn' "/>
          </xsl:call-template>
          <!--   END LINE 11   -->
          <!--   BEGIN LINE 12   -->
          <div class="styIRS4136NumLine" style="float: none; clear: both">
            <br/>
            <br/>
            <br/>
    12
    <span class="styIRS4136NBSP"/>  
    Alternative Fuel Credit and Alternative Fuel Mixture Credit <br/>
            <span style="padding-left:6.5mm;">Registration No.</span>
            <span style="width:2mm;"/>
            <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
            <span style="width:8px;"/>
            <span style="font-weight:normal">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$IRS4136Data/RegistrationAlternativeFuel"/>
              </xsl:call-template>
            </span>
            <br/>
            <br/>
            <!--<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/><span style="width:8px;"/>
    <span style="font-weight:normal">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$IRS4136Data/RegistrationNumberBiodiesel" />
      </xsl:call-template>
    </span><br/> 
    <br/>-->
          </div>
          <div style="width:187mm;float:left;clear:left;" id="UVctn">
            <table class="styIRS4136Table" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th style="width:3mm;height:4mm;"/>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center">
                    <b>(c) Gallons or gasoline gallon equivalents (GGE)</b>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 12A -->
                <tr>
                  <td class="styIRS4136LetterCell">
                    <b>a</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Liquefied petroleum gas (LPG)</td>
                  <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">$ .50/000*</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/LiquifiedPetroleumGas"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
          $<xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/LiquifiedPetroleumGasCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">426<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 12B  -->
                <tr>
                  <td class="styIRS4136LetterCell" style="">
                    <b>b</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">“P Series” fuels</td>
                  <td class="styIRS4136TableCellB" style="padding-left:5mm;"> .50/000*</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/PSeriesFuels"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/PSeriesFuelsCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">427<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 12C  -->
                <tr>
                  <td class="styIRS4136LetterCell">
                    <b>c</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Compressed natural gas (CNG) (GGE = 121 cu. ft.)</td>
                  <td class="styIRS4136TableCellB" style="padding-left:5mm;"> .50/000*</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedNaturalGas"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedNaturalGasCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">428<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 12D  -->
                <tr>
                  <td class="styIRS4136LetterCell">
                    <b>d</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Liquefied hydrogen</td>
                  <td class="styIRS4136TableCellB" style="padding-left:7.5mm;">.50</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/LiquifiedHydrogen"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/LiquifiedHydrogenCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">429<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 12e  -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-bottom:4mm;;">
                    <b>e</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Any liquid fuel derived from coal (including peat) through the Fischer-Tropsch process</td>
                  <td class="styIRS4136TableCellB" style="padding-left:5mm;"> .50/000*</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/LiquifiedFuelDerivedFromCoal"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/LiquifiedFuelDerivedFromCoalCr"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">430<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 12f  -->
                <tr>
                  <td class="styIRS4136LetterCell">
                    <b>f</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Liquid fuel derived from biomass</td>
                  <td class="styIRS4136TableCellB" style="padding-left:5mm;"> .50/000*</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/LiqHydrcrbnsDerFromBiomass"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/LiqHydrcrbnsDerFromBiomassCr"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">431<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 12g  -->
                <tr>
                  <td class="styIRS4136LetterCell" style="border-bottom-width:0px;">
                    <b>g</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Liquefied natural gas (LNG)</td>
                  <td class="styIRS4136TableCellB" style="padding-left:5mm;"> .50/000*</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/LiquifiedNaturalGas"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/LiquifiedNaturalGasCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">432<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 12h  -->
                <!--  ******************************************************************************************  -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCount12h" select="count($IRS4136Data/LiqfdGasBiomass)"/>
                <xsl:if test="$AGRowCount12h = 0 or ((count($IRS4136Data/LiqfdGasBiomass) &gt; 1) 
                and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:3mm;">
                      <b>h</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="vertical-align:middle;">Liquefied gas derived from biomass
                    </td>
                    <td class="styIRS4136TableCellB" style="padding-left:5mm;"> .50/000*</td>
                    <td class="styIRS4136TableCellC" style="text-align:left;">
                      <span class="styIRS4136TableCellPad"/>
                      <xsl:if test=" ((count($IRS4136Data/LiqfdGasBiomass) &gt; 1) and ($Print = $Separated))">
                        <xsl:attribute name="style">text-align:left;</xsl:attribute>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/LiqfdGasBiomass"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
        436
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/LiqfdGasBiomass) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/LiqfdGasBiomass">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount12h"/></xsl:attribute>
                          <b>h</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount12h"/></xsl:attribute>
                          Liquified gas derived from biomass
                         </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellB" style="padding-left:5mm;"> .50/000*</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="."/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount12h"/></xsl:attribute>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/LiqfdGasBiomassCredit"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount12h"/></xsl:attribute>436
                         <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--  ******************************************************************************************  -->
                <!--   Row 12i  -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCount12i" select="count($IRS4136Data/CompressedGasBiomass)"/>
                <xsl:if test="$AGRowCount12i = 0 or ((count($IRS4136Data/CompressedGasBiomass) &gt; 1) 
                and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:3mm;">
                      <b>i</b>
                    </td>
                    <td class="styIRS4136TableCellLine" style="vertical-align:middle;">Compressed gas derived from biomass (GGE = 121 cu.ft.)
                    </td>
                    <td class="styIRS4136TableCellB" style="padding-left:5mm;"> .50/000*</td>
                    <td class="styIRS4136TableCellC" style="text-align:left;">
                      <span class="styIRS4136TableCellPad"/>
                      <xsl:if test=" ((count($IRS4136Data/CompressedGasBiomass) &gt; 1) and ($Print = $Separated))">
                        <xsl:attribute name="style">text-align:left;</xsl:attribute>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedGasBiomass"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
        437
        <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <xsl:if test="($Print != $Separated) or (count($IRS4136Data/CompressedGasBiomass) &lt;= 1) ">
                  <xsl:for-each select="$IRS4136Data/CompressedGasBiomass">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount12i"/></xsl:attribute>
                          <b>i</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount12i"/></xsl:attribute>
                      Compressed gas derived from biomass (GGE = 121 cu.ft.)
                         </td>
                      </xsl:if>
                      <td class="styIRS4136TableCellB" style="padding-left:5mm;"> .50/000*</td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="."/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount12i"/></xsl:attribute>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedGasBiomassCredit"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad"/>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount12i"/></xsl:attribute>437
                         <span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--  ******************************************************************************************* -->
              </tbody>
            </table>
            <span style="width:8mm"/>*This rate applies after December 31, 2009. 
          </div>
          <!--   END LINE 12   -->
          <!--   BEGIN BLOCK 13   -->
          <!--BEGIN FOOTER-->
          <div style="width:187mm; padding-top:1mm;padding-bottom:2mm;">
            <div style="float: left; clear: none;">
              <span class="styBoldText"/>
            </div>
            <div style="float:right">
              <span style="width:70px"/>
    Form <span class="styBoldText" style="font-size: 8pt">4136</span> (2009)
  </div>
          </div>
          <div class="pageEnd"/>
          <!--END FOOTER-->
          <!--BEGIN HEADER-->
          <div class="styBB" style="width:187mm">
            <div style="float: left; clear: none">Form 4136 (2009)</div>
            <div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">4</span>
            </div>
          </div>
          <!--END HEADER-->
          <!--   BEGIN LINE 13   -->
          <div class="styIRS4136NumLine" style="float: none; clear: both">
            <br/>
    13
    <span class="styIRS4136NBSP"/>  
    Registered Credit Card Issuers<br/>
            <span style="padding-left:6.5mm;">Registration No.</span>
            <!--   <span style="width:82mm;"></span>  -->
            <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
            <span style="width:8px;"/>
            <span style="font-weight:normal">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$IRS4136Data/RegistrationNumberCreditCard"/>
              </xsl:call-template>
            </span>
            <br/>
            <br/>
          </div>
          <div style="width:187mm;float:left;clear:left;" id="UVctn">
            <table class="styIRS4136Table" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th style="width:3mm;height:4mm;"/>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center">
                    <b>(c) Gallons </b>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 13a -->
                <tr>
                  <td class="styIRS4136LetterCell">
                    <b>a</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Diesel fuel sold for the exclusive use of a state or local government</td>
                  <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">$ .243</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/DieselFuelSoldGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
          $<xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/DieselFuelSoldCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">360<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 13b  -->
                <tr>
                  <td class="styIRS4136LetterCell">
                    <b>b</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Kerosene sold for the exclusive use of a state or local government</td>
                  <td class="styIRS4136TableCellB" style="padding-left:6.5mm;text-align:center:">.243</td>
                  <td class="styIRS4136TableCellC">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneSoldGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneSoldCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">346<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!-- Row 13C -->
                <tr>
                  <td class="styIRS4136LetterCell" style="border-bottom-width:0px;padding-bottom:4mm;">
                    <b>c</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Kerosene for use in aviation sold for the exclusive use of a state or local government taxed at $.219/.044*</td>
                  <td class="styIRS4136TableCellB" style="padding-left:6mm;padding-top:3mm;">.218/.043*</td>
                  <td class="styIRS4136TableCellC" style="padding-top:3mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/AviationKeroseneGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD" style="padding-top:4mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/AviationKeroseneCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad">
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$IRS4136Data/AviationKeroseneCredit"/>
                      </xsl:call-template>
                    </span>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE" style="padding-top:3mm;">369<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="styBB" style="width:187mm;height:2mm;padding-left:6mm">
          *This rate applies after Septemper 30, 2009.</div>
          <!--   END LINE 13   -->
          <!--   BEGIN BLOCK 14   -->
          <!--   BEGIN LINE 14   -->
          <xsl:variable name="Line14aCount" select="count($IRS4136Data/NontxUseDieselWaterEmulsion)"/>
          <div style="width:187mm;"/>
          <div class="styIRS4136NumLine" style="float:none;clear:both;border-bottom-width: 0px">
    14
    <span class="styIRS4136NBSP">
              <br/>
            </span>  
    Nontaxable Use of a Diesel-Water Fuel Emulsion
        <span style="font-weight:normal">
              <br/>
              <br/>
            </span>
          </div>
          <div style="width:187mm;border-top:solid black 1;font-size:6pt;padding-top:1mm;border-top-width:1px;">
            <div class="styGenericDiv" style="padding-left:8mm">
              <b>Caution.</b>There is a reduced credit rate for use in certain intercity and local buses (type of use 5). 
		See page 6 in the Instructions for Form 4136 for the credit rate.
            </div>
            <xsl:variable name="line14TableRowCount" select="1 + count($IRS4136Data/NontxUseDieselWaterEmulsion)"/>
            <div class="styGenericDiv" style="float:right;">
              <xsl:call-template name="SetDynamicTableToggleRowCount">
                <xsl:with-param name="DataRowCount" select="$line14TableRowCount"/>
                <xsl:with-param name="containerHeight" select="2"/>
                <xsl:with-param name="containerID" select=" '17ctn' "/>
              </xsl:call-template>
            </div>
          </div>
          <div class="styTableContainer" id="17ctn">
            <!--print logic-->
            <xsl:call-template name="SetInitialState"/>
            <!--end-->
            <table class="styTable" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px;border-top-width:1px;border-right-width:0;
                  width:3mm;height:4mm;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px;border-top-width:1px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellA" style="text-align: center;border-top-width:1px;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center;border-top-width:1px;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center;border-top-width:1px;width:32mm">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styIRS4136Braces" style="border-top-width:1px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center;border-top-width:1px;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center;border-top-width:1px;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 14A  -->
                <xsl:if test="$Line14aCount= 0 or (($Line14aCount &gt;1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS4136LetterCell ">
                      <b>a</b>
                    </td>
                    <td class="styIRS4136TableCellLine">Nontaxable use</td>
                    <td class="styIRS4136TableCellA">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="padding-top:1mm;">
                      <xsl:if test="position()=1">$ </xsl:if>
                      <xsl:if test="position()!=1">
                        <span style="padding-left:3mm; text-align:center;"/>
                      </xsl:if>
                .197
              </td>
                    <td class="styIRS4136TableCellC">
                      <span class="styIRS4136TableCellPad"/>
                      <xsl:if test="$Line14aCount  &gt;1 and $Print = $Separated">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseDieselWaterEmulsion"/>
                          <xsl:with-param name="ShortMessage" select=" 'true' "/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styIRS4136Braces">
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellD">
                      <span class="styIRS4136TableCellPad">
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseDieselWaterEmulsionCr"/>
                        </xsl:call-template>
                      </span>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellE">
        309
      <span class="styIRS4136TableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="$Line14aCount= 1 or (($Line14aCount &gt; 1) and ($Print != $Separated))">
                  <xsl:for-each select="$IRS4136Data/NontxUseDieselWaterEmulsion">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136LetterCell" style="border-bottom-width:1px;padding-bottom:10mm">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$Line14aCount"/></xsl:attribute>
                          <b>a</b>
                        </td>
                        <td class="styIRS4136TableCellLine" style="padding-bottom:10mm">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$Line14aCount"/></xsl:attribute>
   		Nontaxable use</td>
                      </xsl:if>
                      <td class="styIRS4136TableCellA">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136TableCellB" style="padding-top:1mm;">
                        <xsl:if test="position()=1">$ </xsl:if>
                        <xsl:if test="position()!=1">
                          <span style="padding-left:3mm; text-align:center;"/>
                        </xsl:if>
                .197
              </td>
                      <td class="styIRS4136TableCellC">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="MaxSize" select="9"/>
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styIRS4136Braces">
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <xsl:if test="position()=1">
                        <td class="styIRS4136TableCellD">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$Line14aCount"/></xsl:attribute>     
                    $<xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseDieselWaterEmulsionCr"/>
                          </xsl:call-template>
                          <span class="styIRS4136TableCellPad">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseDieselWaterEmulsionCr"/>
                            </xsl:call-template>
                          </span>
                        </td>
                        <td class="styIRS4136TableCellE">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$Line14aCount"/></xsl:attribute> 309<span class="styIRS4136TableCellPad"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--  Row 14B OTHER NONTAXABLE USE  -->
                <td class="styIRS4136LetterCell " style="border-bottom-width:1px;">
                  <b>b</b>
                </td>
                <td class="styIRS4136TableCellLine">Exported</td>
                <td class="styIRS4136TableCellA" style="background-color: lightgrey;">
                  <span class="styIRS4136TableCellPad"/>
                </td>
                <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;padding-top:3mm;">
         .198
        <span class="styIRS4136TableCellPad"/>
                </td>
                <td class="styIRS4136TableCellC" style="text-align:right;padding-top:2mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="MaxSize" select="9"/>
                    <xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontxUseDieselWaterEmlsn"/>
                  </xsl:call-template>
                  <span class="styIRS4136TableCellPad"/>
                </td>
                <td class="styIRS4136Braces">
                  <span class="styIRS4136TableCellPad"/>
                </td>
                <td class="styIRS4136TableCellD" style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="MaxSize" select="9"/>
                    <xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontxUseDieselWaterEmlsnCr"/>
                  </xsl:call-template>
                  <span class="styIRS4136TableCellPad"/>
                </td>
                <td class="styIRS4136TableCellE">
        306
        <span class="styIRS4136TableCellPad"/>
                </td>
              </tbody>
            </table>
          </div>
          <xsl:call-template name="SetInitialDynamicTableHeightRowCount">
            <xsl:with-param name="DataRowCount" select="$Line14aCount"/>
            <xsl:with-param name="containerHeight" select="4"/>
            <xsl:with-param name="containerID" select=" '17ctn' "/>
          </xsl:call-template>
          <!--   END LINE 14   -->
          <!--   BEGIN BLOCK 15   -->
          <!--   BEGIN LINE 15   -->
          <div class="styIRS4136NumLine" style="float: none; clear: both">
            <br/>
    15
   
    <span class="styIRS4136NBSP"/>  
    Diesel-Water Fuel Emulsion Blending<br/>
            <span style="padding-left:6mm;">Registration No.</span>
            <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
            <span style="width:8px;"/>
            <span style="font-weight:normal">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$IRS4136Data/RegistrationNumberDieselWater"/>
              </xsl:call-template>
            </span>
            <div style="width:187mm;"/>
          </div>
          <div style="width:187mm;float:left;clear:left;" id="UVctn">
            <table class="styIRS4136Table" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th style="width:3mm;height:4mm;"/>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 15A -->
                <tr>
                  <td class="styIRS4136LetterCell" style="border-bottom-width:1px;">
                    <span style="border-bottom-width:1px"/>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:95mm;">Blender credit</td>
                  <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">$ .046</td>
                  <td class="styIRS4136TableCellC" style="width=32mm">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/BlenderCrUseDieselWaterEmlsn"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD" style="width=35mm">
          $<xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/BlenderCrUseDieselWaterEmlsnCr"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad">
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$IRS4136Data/BlenderCrUseDieselWaterEmlsnCr"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="styIRS4136TableCellE">310<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- end Line 15 -->
          <!--   BEGIN BLOCK 16   -->
          <!--   BEGIN LINE 16   -->
          <div class="styIRS4136NumLine" style="float: none; clear: both">
            <br/>
    16
    <span class="styIRS4136NBSP"/>  
    Exported Dyed Fuels and Exported Gasoline Blendstocks
  <div style="width187mm'">
              <br/>
            </div>
          </div>
          <div style="width:187mm;float:left;clear:left;" id="UVctn">
            <table class="styIRS4136Table" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th style="width:3mm;height:4mm;"/>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 16a -->
                <tr>
                  <td class="styIRS4136LetterCell" style="padding-bottom:4mm">
                    <b>a</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:95mm;">Exported dyed diesel fuel and exported gasoline blendstocks taxed at $.001</td>
                  <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">$ .001</td>
                  <td class="styIRS4136TableCellC" style="width=32mm">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedDyedDieselFuelGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD" style="width=32mm">
          $<xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedDyedDieselFuelCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">415<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
                <!--  Row 16b -->
                <tr>
                  <td class="styIRS4136LetterCell" style="border-bottom:1px solid black;">
                    <b>b</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">Exported dyed kerosene</td>
                  <td class="styIRS4136TableCellB" style="padding-left:3.5mm;text-align:center;"> .001</td>
                  <td class="styIRS4136TableCellC" style="width=32mm">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedDyedKeroseneGallons"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD" style="width=32mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedDyedKeroseneCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">416<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- end Line 16 -->
          <!--     BEGIN BLOCK 17  
            BEGIN LINE 17  
          <div class="styIRS4136NumLine" style="float: none; clear: both">
            <br/>
    17
    <span class="styIRS4136NBSP"/>  
   Leaking Underground Storage Tank(LUST) Tax
  <div style="width187mm'">
              <br/>
            </div>
          </div>
          <div style="width:187mm;float:left;clear:left;" id="UVctn">
            <table class="styIRS4136Table" cellspacing="0">
              <thead class="styIRS4136TableThead">
                <tr>
                  <th style="width:3mm;height:4mm;"/>
                  <th class="styIRS4136TableCellLine" style="border-bottom-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styIRS4136TableCellB" style="text-align: center">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styIRS4136TableCellC" style="text-align: center">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styIRS4136TableCellD" style="text-align: center">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styIRS4136TableCellE" style="text-align: center">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
               Row 17a 
                <tr>
                  <td class="styIRS4136LetterCell">
                    <b>a</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:95mm;">
        LUST tax on aviation fuels used in foreign trade</td>
                  <td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">$ .001</td>
                  <td class="styIRS4136TableCellC" style="width=32mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/AviationFuelsUsedForeignTrade"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD" style="width=32mm">
          $<xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTaxAvaiationFuelsCredit"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">433<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
             Row 17b
                <tr>
                  <td class="styIRS4136LetterCell" style="border-bottom:1px solid black;">
                    <b>b</b>
                  </td>
                  <td class="styIRS4136TableCellLine" style="width:100mm;">LUST tax on fuels used in trains or inland waterways</td>
                  <td class="styIRS4136TableCellB" style="padding-left:3.5mm;text-align:center;"> .001</td>
                  <td class="styIRS4136TableCellC" style="width=32mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="MaxSize" select="9"/>
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/FuelsInTrainsOrInlandWaterWays"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellD" style="width=32mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$IRS4136Data/FuelInTrainInLandWaterWayCr"/>
                    </xsl:call-template>
                    <span class="styIRS4136TableCellPad"/>
                  </td>
                  <td class="styIRS4136TableCellE">434<span class="styIRS4136TableCellPad"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
         end Line 17 -->
          <!-- BEGIN of line 17 -->
          <div class="styBB" style="width:187mm;font-size:7pt;float:none;clear:both;">
            <div class="styGenericDiv" style="width:6mm;height:11mm;font-weight:bold;padding-left:1mm;padding-top:3px; font-size:8pt;">
        17
      </div>
            <div class="styGenericDiv" style="width:131mm;height:11mm;padding-left:5px;padding-top:3px;">
              <b>Total income tax credit claimed. </b>Add lines 1 through 16, column (d). Enter here and on
        Form 1040, line 70 (also check box b on line 70); Form 1120, line 32f(2); Form 1120S, line
        23c; Form 1041, line 24g; or the proper line of other returns.
        <span style="padding-left:2mm">
                <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
              </span>
            </div>
            <div class="styGenericDiv" style="width:7.2mm;height:11mm;font-weight: bold;text-align:center;
        padding-top:7mm;border-left:1 solid black;">17</div>
            <div class="styGenericDiv" style="width:31.5mm;height:11mm;padding-top:6mm;text-align:right;padding-
      right:1mm;border-left:1 solid black;">
          $
          <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS4136Data/TotalIncomeTaxCredit"/>
              </xsl:call-template>
            </div>
            <div class="styGenericDiv" style="width:11mm;height:11mm;border-left:1px solid black;background-color:lightgrey;">
              <span style="width:1px;"/>
            </div>
          </div>
          <!--   END LINE 17   -->
          <!--   END BLOCK 17   -->
          <!--   BEGIN FORM FOOTER  -->
          <div class="pageEnd" style="width:187mm;padding-top:.5mm;">
            <div style="float:right">
              <span style="width:80px"/>Form <span class="styBoldText">4136</span> (2009)
  </div>
          </div>
          <!--   END FORM FOOTER   -->
          <!-- <br/>
      <div class="pageEnd"></div> -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
          Additional Data        
        </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$IRS4136Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Form 4136, Line 14b(d) - UA Registration Number</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$IRS4136Data/OtherNonTaxableUses/@UARegistrationNumber"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- Begin Separated Repeating data -->
          <!-- Begin SRD for line 1 -->
          <xsl:variable name="AFRowCount" select="count($IRS4136Data/OtherNontaxableUseOfGasoline)"/>
          <xsl:if test="($Print = $Separated) and  ($AFRowCount &gt; 1) ">
            <span class="styRepeatingDataTitle">Form 4136, Line 1 - Nontaxable Use of Gasoline</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" style="width:3mm;height:4mm;border-right-width:0px;"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="text-align: center;width:16mm;border-left-width:0px;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="text-align: center;width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="text-align: center;width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="text-align: center;width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="text-align: center;width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Loop  -->
                <xsl:for-each select="$IRS4136Data/OtherNontaxableUseOfGasoline">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="vertical-align:top;border-right-width:0px;text-align:left;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount"/></xsl:attribute>
                        <b>c</b>
                      </td>
                      <td class="styDepTblCell" style="width:77mm;vertical-align:top;border-left-width:0px;text-align:left;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount"/></xsl:attribute>
                  Other nontaxable use of gasoline (see <b>Caution</b> above line 1)
            </td>
                    </xsl:if>
                    <td class="styIRS4136TableCellA" style="width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="padding-top:1mm;">
                      <xsl:if test="position()=1">$ </xsl:if>
                      <xsl:if test="position()!=1">
                        <span style="padding-left:3mm; text-align:center;"/>
                      </xsl:if>
                .183
              </td>
                    <td class="styIRS4136TableCellC" style="border-right-width:1px">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblRow2Cell" style="width:32mm;text-align:right;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount "/></xsl:attribute>$
                      <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseOfGasolineCredit"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblRow2Cell" style="width:9mm;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount "/></xsl:attribute>
                      362
                      <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
                <!-- End Loop  -->
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!--  Start here 222 -->
          <!-- Begin SRD for Line 2-->
          <xsl:if test="($Print = $Separated) and (count($IRS4136Data/NontaxableAviationGasoline) &gt; 1)">
            <span class="styRepeatingDataTitle">Form 4136, Line 2 - Nontaxable Use of Aviation Gasoline</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" style="width:3mm;height:4mm;border-right-width:0px;"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="text-align: center;width:16mm;border-left-width:0px;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="text-align: center;width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="text-align: center;width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="text-align: center;width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="text-align: center;width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 2A USE IN COMMERCIAL AVIATION (OTHER THAN FOREIGN TRADE) -->
                <!--  Row 2B OTHER NONTAXABLE USE  -->
                <!-- LOOP -->
                <xsl:variable name="AGRowCount" select="count($IRS4136Data/NontaxableAviationGasoline)"/>
                <xsl:for-each select="$IRS4136Data/NontaxableAviationGasoline">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblRow2Cell" style="vertical-align:top;width:3mm;border-right-width:0px;text-align:left;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
                        <b>b</b>
                      </td>
                      <td class="styDepTblRow2Cell" style="vertical-align:top;width:77mm;border-left-width:0px;text-align:left;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
                      Other nontaxable use (see<b> Caution </b> above line 1)
                    </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styIRS4136TableCellB" style="padding-top:1mm;">
                      <xsl:if test="position()=1">$ </xsl:if>
                      <xsl:if test="position()!=1">
                        <span style="padding-left:3mm; text-align:center;"/>
                      </xsl:if>
               .193/.043*
              </td>
                    <!--<td class="styDepTblCell" style="padding-left:3mm;text-align:center;">.193</td>-->
                    <td class="styDepTblCell" style="width:32mm;border-right-width:0px;text-align:right;border-right-width:1px">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblRow2Cell" style="width:32mm;text-align:right;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>$
                      <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableAviationGasolineCr"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblRow2Cell" style="width:9mm;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
                      324
                      <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  start line 3 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->
          <!-- Begin line 3 SRD table -->
          <xsl:if test="($Print = $Separated) and (count($IRS4136Data/NontaxableUseOfUndyedDiesel) &gt; 1)">
            <span class="styRepeatingDataTitle">Form 4136, Line 3 - Nontaxable Use of Undyed Diesel Fuel</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 3A NONTAXABLE USE  -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount" select="count($IRS4136Data/NontaxableUseOfUndyedDiesel)"/>
                <xsl:for-each select="$IRS4136Data/NontaxableUseOfUndyedDiesel">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
                        <b>a</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
                  Nontaxable use
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1">$</xsl:if>
                      <xsl:if test="position()!=1">
                        <span style="padding-left:3mm;"/>
                      </xsl:if>
                .243
            <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
                        <!-- <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseFarmUndyedDslFuelGals"/>
                        </xsl:call-template> -->
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  end line 3  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->
          <!-- Begin line 4 SRD table -->
          <xsl:if test="($Print = $Separated) and (count($IRS4136Data/NontaxableUseOfUndyedKerosene) &gt; 2)">
            <span class="styRepeatingDataTitle">Form 4136, Line 4 - Nontaxable Use of Undyed Kerosene (Other Than Kerosene Used in Aviation)</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 4A NONTAXABLE USE  -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount" select="count($IRS4136Data/NontaxableUseOfUndyedKerosene)"/>
                <xsl:for-each select="$IRS4136Data/NontaxableUseOfUndyedKerosene">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
                        <b>a</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
                  Nontaxable use
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1">$</xsl:if>
                      <xsl:if test="position()!=1">
                        <span style="padding-left:3mm;"/>
                      </xsl:if>
                .243
            <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
                        <!--   <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneForFarmingCredit"/>
                        </xsl:call-template> -->
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- Begin Line 5 SRD table -->
          <!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$start line 5c  $$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
          <!-- Begin line 5c SRD table -->
          <xsl:if test="(count($IRS4136Data/OtherNontaxableUseTaxedAt244) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">Form 4136, Line 5 - Kerosene Used in Aviation
  <span style="font-weight:normal">(see </span>
              <b>Caution </b>
              <span style="font-weight:normal">above line 1)</span>
            </span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 5c  -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontaxableUseTaxedAt244)"/>
                <xsl:for-each select="$IRS4136Data/NontaxableUseTaxedAt244">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>c</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-
            right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                    Nontaxable use (Other than use by state or local government) taxed at $.244
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1"/>
                      <xsl:if test="position()!=1"/>
                .243
            <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseTaxedAt244Cr"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              346
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ end line 5c $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start line 5d  $$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
          <!-- Begin line 5d SRD table -->
          <xsl:if test="(count($IRS4136Data/NontaxableUseTaxedAt219) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">Form 4136, Line 5 - Kerosene Used in Aviation
  <span style="font-weight:normal">(see </span>
              <b>Caution </b>
              <span style="font-weight:normal">above line 1)</span>
            </span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 5d  -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontaxableUseTaxedAt219)"/>
                <xsl:for-each select="$IRS4136Data/NontaxableUseTaxedAt219">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>d</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-
            right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                    Nontaxable use (Other than use by state or local government) taxed at $.219/.244
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1"/>
                      <xsl:if test="position()!=1"/>
                .218/.243*
            <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseTaxedAt219Cr"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              360
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ end line 5d $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
          <!--  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   bstart line 5e  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
          <!-- Begin line 5e SRD table -->
          <xsl:if test="(count($IRS4136Data/LUSTTaxAvnFuel) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">Form 4136, Line 5 - LUST tax on aviation fuels used in foreign trade
          
            </span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 5d  -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/LUSTTaxAvnFuel)"/>
                <xsl:for-each select="$IRS4136Data/LUSTTaxAvnFuel">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>e</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-
            right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                  LUST tax on aviation fuels used in foreign trade
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Type"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1"/>
                      <xsl:if test="position()!=1"/>
             .001
            <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="."/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTaxAvnFuelCredit"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              433
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!--  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   end line 5e      $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$start line 8d   $$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
          <!-- Begin line 8D SRD table -->
          <xsl:if test="(count($IRS4136Data/OtherNontaxableUseTaxedAt244) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">Form 4136, Line 8 - Sales by Registered Ultimate Vendors of Kerosene For Use in Aviation</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 8D  -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/OtherNontaxableUseTaxedAt244)"/>
                <!-- Line8d -->
                <xsl:for-each select="$IRS4136Data/OtherNontaxableUseTaxedAt244">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>d</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                    Other nontaxable uses taxed at $.244
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1">$</xsl:if>
                      <xsl:if test="position()!=1">
                        <span style="padding-left:3mm;"/>
                      </xsl:if>
                .243
            <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>$
              <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/OtherNontaxableUseTaxedAt244Cr"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              346
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ end line 8d $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$start line 8e $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
          <!-- Begin line 8E SRD table -->
          <xsl:if test="(count($IRS4136Data/OtherNontaxableUseTaxedAt219) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">Form 4136, Line 8 - Sales by Registered Ultimate Vendors of Kerosene For Use in Aviation</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 8E  -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/OtherNontaxableUseTaxedAt219)"/>
                <!-- Line8E -->
                <xsl:for-each select="$IRS4136Data/OtherNontaxableUseTaxedAt219">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>e</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                     Other nontaxable uses taxed at $.219/.044*
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1">$</xsl:if>
                      <xsl:if test="position()!=1">
                        <span style="padding-left:3mm;"/>
                      </xsl:if>
              .218/.043*

            <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/OtherNontaxableUseTaxedAt219Cr"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              346
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ end line 8e $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  11a $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- Begin line 11a SRD table -->
          <xsl:if test="(count($IRS4136Data/NontxLiquifiedPetroleumGas) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 11a  -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxLiquifiedPetroleumGas)"/>
                <xsl:for-each select="$IRS4136Data/NontxLiquifiedPetroleumGas">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>a</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                    Liquefied petroleum gas (LPG)
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1">$</xsl:if>
                      <xsl:if test="position()!=1"/>.183
            <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquifiedPetroleumGasCr"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              419
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  11a $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  11b $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- Begin line 11a SRD table -->
          <xsl:if test="(count($IRS4136Data/NontxPSeriesFuels) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 11b  -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxPSeriesFuels)"/>
                <xsl:for-each select="$IRS4136Data/NontxPSeriesFuels">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>b</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                    "P Series" fuels
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1"/>
                      <xsl:if test="position()!=1"/>.183
            <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxPSeriesFuelsCredit"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              420
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  11b $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start 11c $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- Begin line 11a SRD table -->
          <xsl:if test="(count($IRS4136Data/NontxCompressedNaturalGas) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 11b  -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxCompressedNaturalGas)"/>
                <xsl:for-each select="$IRS4136Data/NontxCompressedNaturalGas">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>c</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                    Compressed natural gas (CNG) (GGE = 126.67 cu. ft.)
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1"/>
                      <xsl:if test="position()!=1"/>.183
            <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxCompressedNaturalGasCr"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              421
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 11c $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start 11d $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- Begin line 11d SRD table -->
          <xsl:if test="(count($IRS4136Data/NontxLiquifiedHydrogen) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 11d  -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxLiquifiedHydrogen)"/>
                <xsl:for-each select="$IRS4136Data/NontxLiquifiedHydrogen">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>d</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                    Liquefied hydrogen
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1"/>
                      <xsl:if test="position()!=1"/>.183
            <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquifiedHydrogenCredit"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              422
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 11d $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start 11e $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- Begin line 11e SRD table -->
          <xsl:if test="(count($IRS4136Data/NontxLqfdFuelDerivedFromCoal) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 11e  -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxLqfdFuelDerivedFromCoal)"/>
                <xsl:for-each select="$IRS4136Data/NontxLqfdFuelDerivedFromCoal">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>e</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                  Any liquid fuel derived from coal (including peat) through the Fischer-Tropsch process
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1"/>
                      <xsl:if test="position()!=1"/>.243
                        <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLqfdFuelDerivedFromCoalCr"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              423
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 11e $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start 11f $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- Begin line 11f SRD table -->
          <xsl:if test="(count($IRS4136Data/NontxLiqHydrcrbnsDerBiomass) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 11f  -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxLiqHydrcrbnsDerBiomass)"/>
                <xsl:for-each select="$IRS4136Data/NontxLiqHydrcrbnsDerBiomass">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>f</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
               Liquid fuel derived from biomass
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1"/>
                      <xsl:if test="position()!=1"/>.243
                        <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiqHydrcrbnsDerBiomassCr"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              424
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 11f $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start 11g $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- Begin line 11g SRD table -->
          <xsl:if test="(count($IRS4136Data/NontxLiqHydrcrbnsDerBiomass) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 11g  -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxLiquifiedNaturalGas)"/>
                <xsl:for-each select="$IRS4136Data/NontxLiquifiedNaturalGas">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>g</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
             Liquefied natural gas (LNG)
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1"/>
                      <xsl:if test="position()!=1"/>.243
                        <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquifiedNaturalGasCredit"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              425
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 11g $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start 11h $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- Begin line 11h SRD table -->
          <xsl:if test="(count($IRS4136Data/NontxLiqHydrcrbnsDerBiomass) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">
            Form 4136, Line 11 - Liquified gas derived from biomass</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 11h -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/LiquefiedGasBiomass)"/>
                <xsl:for-each select="$IRS4136Data/LiquefiedGasBiomass">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>h</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                     Liquified gas derived from biomass
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1"/>
                      <xsl:if test="position()!=1"/>.183
                        <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedGasBiomassCredit"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              435
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 11h $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!--  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  start 12h $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- Begin line 12h SRD table -->
          <xsl:if test="(count($IRS4136Data/LiqfdGasBiomass) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">
            Form 4136, Line 12 - Liquified gas derived from biomass</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 12h -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/LiqfdGasBiomass)"/>
                <xsl:for-each select="$IRS4136Data/LiqfdGasBiomass">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>h</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
             Liquified gas derived from biomass
            </td>
                    </xsl:if>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1"/>
                      <xsl:if test="position()!=1"/>.50
                        <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="."/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/LiqfdGasBiomassCredit"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              436
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!--  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 12h $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!--  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  start 12i $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- Begin line 12i SRD table -->
          <xsl:if test="(count($IRS4136Data/CompressedGasBiomass) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">
            Form 4136, Line 12 - Compressed gas derived from biomass (GG = 121 cu.ft.)</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 12i -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/CompressedGasBiomass)"/>
                <xsl:for-each select="$IRS4136Data/CompressedGasBiomass">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>i</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
            Compressed gas derived from biomass (GG = 121 cu.ft.)
            </td>
                    </xsl:if>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1"/>
                      <xsl:if test="position()!=1"/>.50
                        <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="."/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedGasBiomassCredit"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              437
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!--  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 12i $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start 14a $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- Begin line 14a SRD table -->
          <xsl:if test="(count($IRS4136Data/NontxUseDieselWaterEmulsion) &gt;1) and ($Print = $Separated)">
            <span class="styRepeatingDataTitle">Form 4136, Line 14 - Nontaxable Use of Diesel-Water Fuel Emuision</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell"/>
                  <th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
                    <span class="styIRS4136TableCellPad"/>
                  </th>
                  <th class="styDepTblCell" style="width:16mm;">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styDepTblCell" style="width:13mm;">
                    <b>(b) Rate</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;border-right-width:0px;">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styDepTblCell" style="width:32mm;">
                    <b>(d) Amount of credit</b>
                  </th>
                  <th class="styDepTblCell" style="width:9mm;">
                    <b>(e) CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--  Row 14a  -->
                <!-- LOOP -->
                <xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxUseDieselWaterEmulsion)"/>
                <xsl:for-each select="$IRS4136Data/NontxUseDieselWaterEmulsion">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="border-right-width:0px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <b>a</b>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
           Nontaxable use
            </td>
                    </xsl:if>
                    <td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td style="border-bottom:1 solid black;padding-top:2mm;">
                      <xsl:if test="position()=1">$</xsl:if>
                      <xsl:if test="position()!=1"/>.197
                        <span class="styIRS4136TableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="border:1 solid black;text-align:right;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="MaxSize" select="9"/>
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                      <span class="styIRS4136TableCellPad"/>
                    </td>
                    <xsl:if test="position()=1">
                      <td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseDieselWaterEmulsionCr"/>
                        </xsl:call-template>
                        <span class="styIRS4136TableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
                        <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              309
              <span class="styIRS4136TableCellPad"/>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 14a $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
          <!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&  -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
