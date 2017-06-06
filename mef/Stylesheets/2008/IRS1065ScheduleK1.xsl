<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:import href="PopulateTemplate.xsl"/>
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:include href="IRS1065ScheduleK1Style.xsl"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="FormData" select="$RtnDoc/IRS1065ScheduleK1"/>
    <xsl:template name="RowWriterCore">
        <tr>
            <td class="styLeftNumBox">
                <span style="width:1px;"/>
            </td>
            <td height="10px;" style="height:4.5mm;font-size:7pt;text-align:left;width:172mm;" class="styIRS1065ScheduleK1BBtable">
                <span style="width:1px;"/>
            </td>
        </tr>
    </xsl:template>
    <!-- This template is called to fill in blank filler rows in Part III where multiple of rows of data -->
    <!-- may be applicable. The parameter NumOfTotRows is the set number of rows required to display on the page -->
    <!-- even if no data is populated. The parameter CurrentRowCount is the current number of rows already -->
    <!-- populated with data or blank row(s). When this template is called, a new blank row is populated in the -->
    <!-- form and the CurrentRowCount is incremented by 1. It will keep popoulating blank rows as long as -->
    <!-- CurrentRowCount is less than NumOfTotRows and stop when these two numbers are equal. -->
    <xsl:template name="AddBlankFillerRows">
        <xsl:param name="NumOfTotRows"/>
        <xsl:param name="CurrentRowCount"/>
        <!-- Test condition to populate a blank row -->
        <xsl:if test="$CurrentRowCount &lt; $NumOfTotRows">
            <!-- Recursive call to itself after incrementing the CurrentRowCount. -->
            <xsl:call-template name="AddBlankFillerRows">
                <xsl:with-param name="NumOfTotRows" select="$NumOfTotRows"/>
                <xsl:with-param name="CurrentRowCount" select="$CurrentRowCount + 1"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    <!-- This template displays tables populated with data of the CodeAndAmountType data types      -->
    <!-- The data is displayed in a dependency data style table. There is an optional parameter     -->
    <!-- that indicates whether to display the associated push pin that comes from the Code element -->
    <!-- By default, this field is set to false unless the caller set it to true.                   -->
    <xsl:template name="DisplayCodeAndAmountTable">
        <xsl:param name="TargetNode"/>
        <xsl:param name="CodeAndAmountTableTitle"/>
        <xsl:param name="DisplayPushPin">false</xsl:param>
        <xsl:if test="count($TargetNode) &gt; 0">
            <br/>
            <span class="styRepeatingDataTitle">
                <xsl:value-of select="$CodeAndAmountTableTitle"/>
            </span>
            <table class="styDepTbl" style="font-size:7pt;">
                <thead class="styTableTHead">
                    <tr class="styDepTblHdr">
                        <th class="styDepTblCell" scope="col">Code</th>
                        <th class="styDepTblCell" scope="col">Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="$TargetNode">
                        <tr>
                            <!--Define background colors to the rows -->
                            <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                            <!--First column -->
                            <td class="styDepTblCell" style="text-align:left;width:50mm;">
                                <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="Code"/>
                                </xsl:call-template>
                                <xsl:choose>
                                    <xsl:when test="$DisplayPushPin = 'true'">
                                        <xsl:call-template name="SetFormLinkInline">
                                            <xsl:with-param name="TargetNode" select="Code"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                </xsl:choose>
                            </td>
                            <!-- Second Column -->
                            <td class="styDepTblCell" style="text-align:right;padding-right:62mm;width:136mm;">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="Amount"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </xsl:if>
    </xsl:template>
    <!-- This template displays a line or lines of data for the IRS1065 Schedule K1 Part III Code/Amount fields -->
    <!-- If the number of data elements exceed the specified number of allowable lines, and the print option is -->
    <!-- set to separated, then a message is displayed indicating that the data is in an additional data table. -->
    <xsl:template name="DisplayPart3CodeAmountLine">
        <xsl:param name="TargetNode"/>
        <xsl:param name="NumOfTotalRows"/>
        <xsl:choose>
            <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
            <!-- If the print parameter is separated, but there are fewer elements than the container height  -->
            <xsl:when test="($Print != $Separated) or (count($TargetNode) &lt;= $NumOfTotalRows) ">
                <xsl:for-each select="$TargetNode">
                    <span class="IRS1065ScheduleK1_codeCell">
                        <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Code"/>
                        </xsl:call-template>
                    </span>
                    <span class="IRS1065ScheduleK1_amountCell">
                        <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amount"/>
                        </xsl:call-template>
                    </span>
                    <br/>
                </xsl:for-each>
                <!-- Add blank rows -->
                <xsl:call-template name="AddBlankFillerRows">
                    <xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
                    <xsl:with-param name="CurrentRowCount" select="count($TargetNode)"/>
                </xsl:call-template>
            </xsl:when>
            <!-- For separated print where the number of data elements exceed container height, -->
            <!-- display message directing user to additional data table. -->
            <xsl:otherwise>
                <span class="IRS1065ScheduleK1_codeCell" style="border-bottom:1px solid lightgrey;"/>
                <span class="IRS1065ScheduleK1_amountCell" style="text-align:left;padding-left:1px;border-bottom:1px solid lightgrey;">
                    <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$TargetNode"/>
                    </xsl:call-template>
                </span>
                <br/>
                <!-- Add blank rows -->
                <xsl:call-template name="AddBlankFillerRows">
                    <xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
                    <xsl:with-param name="CurrentRowCount" select="1"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- This template is the same as DisplayPart3CodeAmountLine with additional display of the pushpin in the amount field. -->
    <!-- This template displays a line or lines of data for the IRS1065 Schedule K1 Part III Line 10 Code/Amount fields     -->
    <!-- If the number of data elements exceed the specified number of allowable lines, and the print option is              -->
    <!-- set to separated, then a message is displayed indicating that the data is in an additional data table.              -->
    <xsl:template name="DisplayPart3CodeAmountAddlDataLine">
        <xsl:param name="TargetNode"/>
        <xsl:param name="NumOfTotalRows"/>
        <xsl:choose>
            <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
            <!-- If the print parameter is separated, but there are fewer elements than the container height  -->
            <xsl:when test="($Print != $Separated) or (count($TargetNode) &lt;= $NumOfTotalRows) ">
                <xsl:for-each select="$TargetNode">
                    <tr>
                        <td style="font-size:7pt;font-family:Verdana;width:6mm;height:8mm;vertical-align:bottom;padding-bottom:2px;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;">
                            <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="Code"/>
                            </xsl:call-template>
                        </td>
                        <td style="border-bottom:1px solid lightgrey;width:5mm;height:8mm;text-align:left;padding-left:2px;">
                            <xsl:call-template name="SetFormLinkInline">
                                <xsl:with-param name="TargetNode" select="Code"/>
                            </xsl:call-template>
                        </td>
                        <td style="vertical-align:bottom;font-size:7pt;font-family:Verdana;float:right;width:41.5mm;border-bottom:1px solid lightgrey;text-align:right;height:8mm;padding-bottom:2px;">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="Amount"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                </xsl:for-each>
                <!-- Add blank rows -->
                <xsl:call-template name="AddBlankFillerRows">
                    <xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
                    <xsl:with-param name="CurrentRowCount" select="count($TargetNode)"/>
                </xsl:call-template>
            </xsl:when>
            <!-- For separated print where the number of data elements exceed container height, -->
            <!-- display message directing user to additional data table. -->
            <xsl:otherwise>
                <tr>
                    <td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
                        <span class="styTableCellPad"/>
                    </td>
                    <td colspan="2" style="float:right;font-size:7pt;width:41.5mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:left;padding-left:1px;">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$TargetNode"/>
                        </xsl:call-template>
                    </td>
                </tr>
                <!-- Add blank rows -->
                <xsl:call-template name="AddBlankFillerRows">
                    <xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
                    <xsl:with-param name="CurrentRowCount" select="1"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:call-template name="FormTitle">
                        <xsl:with-param name="RootElement" select="local-name($FormData)"/>
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
                <meta name="Description" content="IRS Form 1065ScheduleK1"/>
                <!-- javascript include -->
                <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
                <xsl:call-template name="InitJS"/>
                <style type="text/css">
                    <xsl:if test="not($Print) or $Print=''">
                        <xsl:call-template name="IRS1065ScheduleK1Style"/>
                        <xsl:call-template name="AddOnStyle"/>
                    </xsl:if>
                </style>
                <xsl:call-template name="GlobalStylesForm"/>
            </head>
            <body class="styBodyClass">
                <!-- Standard Header -->
                <xsl:call-template name="DocumentHeader"/>
                <!-- Form Display Starts Here -->
                <!--
                    +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    |  Top row: td   (6711)                                              
                    |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    |  Second row: td  (checkboxes)                             
                    |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    |  Middle row:                                                           
                    |  one td                             second td                       
                    |  +~~~~~~~~~~~~~~~~+ | +~~~~~~~~~~~~~~~~~  
                    |   |   with new table         with new tables      
                    |   |       Header                    header                  
                    |   |       Part I                        Part III                    
                    |   |       Part II                       +~~~~~~~~~~~~ 
                    |   |                                       | 1-12   |  13-17  
                    |   |                                       +~~~~~~~~~~~~ 
                    |  +~~~~~~~~~~~~~~~~+ |  +~~~~~~~~~~~~~~~~
                    |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    |  Bottom row: td                                                      
                    +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                -->
                <table width="186mm" border="0" cellpadding="0" cellspacing="0" style="font-family: Verdana; font-size: 7pt;">
                    <tr>
                        <td width="186mm" colspan="2" style="width: 186mm;">
                            <span style="font-family: Courier New, monospace; font-size: 13pt; text-align: right; width: 186mm;">651106</span>
                        </td>
                    </tr>
                    <tr>
                        <td width="186mm" colspan="2" style="width: 186mm;">
                            <span style="width: 186mm;">
                                <span style="float: right; margin-bottom: 0.5mm;">
                                    <input type="checkbox" class="styCkbox" name="checkbox" id="dummyID1" onclick="return false;">
                                        <xsl:call-template name="PopulateCheckbox">
                                            <xsl:with-param name="TargetNode" select="$FormData/FinalK1"/>
                                        </xsl:call-template>
                                    </input>
                                    <label>
                                        <xsl:call-template name="PopulateLabel">
                                            <xsl:with-param name="TargetNode" select="$FormData/FinalK1"/>
                                            <xsl:with-param name="BackupName">IRS1065ScheduleK1FinalK1</xsl:with-param>
                                        </xsl:call-template>
                                        <span style="vertical-align: bottom;">Final K-1</span>
                                    </label>
                                    <span style="width: 11mm;"/>
                                    <input type="checkbox" class="styCkbox" name="checkbox" id="dummyID2" onclick="return false;">
                                        <xsl:call-template name="PopulateCheckbox">
                                            <xsl:with-param name="TargetNode" select="$FormData/AmmendedK1"/>
                                        </xsl:call-template>
                                    </input>
                                    <label>
                                        <xsl:call-template name="PopulateLabel">
                                            <xsl:with-param name="TargetNode" select="$FormData/AmmendedK1"/>
                                            <xsl:with-param name="BackupName">IRS1065ScheduleK1AmmendedK1</xsl:with-param>
                                        </xsl:call-template>
                                        <span style="vertical-align: bottom;">Amended K-1</span>
                                    </label>
                                    <span style="width: 11mm;"/>
                    OMB No. 1545-0099</span>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 93mm;" valign="top">
                            <table border="0" cellspacing="0" cellpadding="0" style="border-right: 1px solid black;">
                                <!-- Inner table - Header, Part I, Part II -->
                                <tr>
                                    <td style="width: 93mm;">
                                        <div style="width: 93mm;">
                                            <!-- Width necessary to prevent table from shrinking -->
                                            <span class="styFormNumber" style="font-size: 10pt;padding-top:2mm; float: left; clear: none;">Schedule K-1<br/>(Form 1065)
                      <xsl:call-template name="SetFormLinkInline">
                                                    <xsl:with-param name="TargetNode" select="$FormData"/>
                                                </xsl:call-template>
                                            </span>
                                            <div class="styTY" style="float: right; clear: none; padding-right: 2mm;">20<span class="styTYColor">08</span>
                                            </div>
                                            <!-- 2008 -->
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 7pt;">
                                        Department of the Treasury<br/>
                                        <span style="float: left; clear: none;">Internal Revenue Service</span>
                                        <span style="float: right; clear: none; padding-right: 1mm;">For calendar year 2008, or tax <br/>year beginning
                                        <span style="width: 20mm; border-bottom: 1px solid black; text-align: center;">
                                                <xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
                                            </span>
                                        </span>
                                        <br/>
                                        <span style="float: left; clear:none;">
                                            <span style="width:2mm;"/>
                                            <xsl:call-template name="LinkToLeftoverDataTableInline">
                                                <xsl:with-param name="Desc">Form 1065 Schedule K-1, Top Left Margin - Section 1377 (A)(2) Election Indicator</xsl:with-param>
                                                <xsl:with-param name="TargetNode" select="$FormData/@sect1377a2Indicator"/>
                                            </xsl:call-template>
                                        </span>
                                        <span style="float: right; clear: both; padding-right: 1mm;">
                      ending
                                          <span style="width: 20mm; border-bottom: 1px solid black; text-align: center;">
                                                <xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
                                            </span>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="styMainTitle" style="font-size: 12pt;">Partner’s Share of Income, Deductions,</span>
                                        <br/>
                                        <span class="styMainTitle" style="float: left; clear: none; font-size: 12pt;">Credits, etc.</span>
                                        <span style="float: right; clear: none; font-weight: bold; font-size: 7pt; padding-right: 1mm; padding-top: 0.5mm;">
                                            <img src="{$ImagePath}/1065SchK1_Bullet.gif" width="4" height="7" alt="Right arrow image" border="0"/> See back of form and separate instructions.</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-left: 2px solid black; border-top: 2px solid black; height: 5mm; background-color: lightgrey;">
                                        <!-- Part I header -->
                                        <span class="IRS1065ScheduleK1_partName" style="margin: 2mm;">Part I</span>
                                        <span class="IRS1065ScheduleK1_partDesc">Information About the Partnership</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="IRS1065ScheduleK1_tdLeft" style="height: 8mm;padding-bottom:0mm">
                                        <!-- Line A -->
                                        <span style="font-weight: bold;">A</span>
                                        <span style="width: 3mm;"/>
                                        <span style="width: 80mm;">Partnership’s employer identification number</span>
                                        <br/>
                                        <span style="width: 5mm;"/>
                                <!--        <xsl:choose>
                                          <xsl:when test="$FormData/PartnershipSSN">
                                            <xsl:call-template name="PopulateSSN">
                                              <xsl:with-param name="TargetNode" select="$FormData/PartnershipSSN" />
                                            </xsl:call-template>
                                          </xsl:when>
                                          <xsl:when test="$FormData/PartnershipEIN">
                                            <xsl:call-template name="PopulateEIN">
                                              <xsl:with-param name="TargetNode" select="$FormData/PartnershipEIN" />
                                            </xsl:call-template>
                                          </xsl:when>
                                        </xsl:choose>-->
                                        <xsl:call-template name="PopulateReturnHeaderFiler">
                                            <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                                        </xsl:call-template>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="IRS1065ScheduleK1_tdLeft" style="height: 24mm;">
                                        <!-- Line B -->
                                        <span style="font-weight: bold;">B</span>
                                        <span style="width: 3mm;"/>
                                        <span style="width: 80mm;">Partnership’s name, address, city, state, and ZIP code</span>
                                        <br/>
                                        <span style="width: 5mm;"/>
                                        <span style="width: 84mm;">
                                            <xsl:call-template name="PopulateReturnHeaderFiler">
                                                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                                            </xsl:call-template>
                                            <br/>
                                            <xsl:call-template name="PopulateReturnHeaderFiler">
                                                <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                                            </xsl:call-template>
                                            <br/>
                                            <xsl:call-template name="PopulateReturnHeaderFiler">
                                                <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                                            </xsl:call-template>
                                            <br/>
                                            <xsl:call-template name="PopulateReturnHeaderFiler">
                                                <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                                            </xsl:call-template>
                                            <br/>
                                            <xsl:call-template name="PopulateReturnHeaderFiler">
                                                <xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
                                            </xsl:call-template>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="IRS1065ScheduleK1_tdLeft" style="height: 8mm;">
                                        <!-- Line C -->
                                        <span style="font-weight: bold;">C</span>
                                        <span style="width: 3mm;"/>
                                        <span style="width: 80mm;">IRS Center where partnership filed return</span>
                                        <br/>
                                        <span style="width: 5mm;"/>
                                        <xsl:call-template name="PopulateText">
                                            <xsl:with-param name="TargetNode" select="$FormData/IRSServiceCenterWhereFiled"/>
                                        </xsl:call-template>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="IRS1065ScheduleK1_tdLeft" style="height: 7.5mm;">
                                        <!-- Line D -->
                                        <!--<div style="float: left; clear: none;">-->
                                            <span style="font-weight: bold; width: 2mm;">D</span>
                                            <span style="width: 1mm;"/>
                                            <span style="width: 80mm;">
                                                <input type="checkbox" class="styckbox" name="checkbox" id="dummyid">
                                                    <xsl:call-template name="PopulateCheckbox">
                                                        <xsl:with-param name="TargetNode" select="$FormData/PubliclyTradedPartnership"/>
                                                    </xsl:call-template>
                                                </input>
                                                <label>
                                                    <xsl:call-template name="PopulateLabel">
                                                        <xsl:with-param name="TargetNode" select="$FormData/PubliclyTradedPartnership"/>
                                                        <xsl:with-param name="BackupName">IRS1065ScheduleK1PubliclyTradedPartnership</xsl:with-param>
                                                    </xsl:call-template>
                             Check if this is a publicly traded partnership (PTP)
                                                </label>
                                            </span>
                                        <!--</div>-->
                                    </td>
                                </tr>
                               <tr>
                                    <td style="border-left: 2px solid black; border-top: 1px solid black; height: 5mm; background-color: lightgrey;">
                                        <!-- Part II header -->
                                        <span class="IRS1065ScheduleK1_partName" style="margin: 2mm;">Part II</span>
                                        <span class="IRS1065ScheduleK1_partDesc">Information About the Partner</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="IRS1065ScheduleK1_tdLeft" style="height: 8.5mm;padding-bottom:0mm">
                                        <!-- PART II Line E -->
                                        <span style="font-weight: bold;">E</span>
                                        <span style="width: 3mm;"/>
                             Partner’s identifying number<br/>
                                        <span style="width: 5mm;"/>
                                        <xsl:if test="$FormData/MissingSSNEINReason">
                                            <xsl:call-template name="PopulateText">
                                                <xsl:with-param name="TargetNode" select="$FormData/MissingSSNEINReason"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="$FormData/PartnerEIN">
                                            <xsl:call-template name="PopulateEIN">
                                                <xsl:with-param name="TargetNode" select="$FormData/PartnerEIN"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="$FormData/PartnerSSN">
                                            <xsl:call-template name="PopulateSSN">
                                                <xsl:with-param name="TargetNode" select="$FormData/PartnerSSN"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                        <br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="IRS1065ScheduleK1_tdLeft" style="height: 24mm;">
                                        <!-- PART II Line F -->
                                        <span style="font-weight: bold;">F</span>
                                        <span style="width: 3mm;"/>
                                        <span style="width: 80mm;">Partner’s name, address, city, state, and ZIP code</span>
                                        <br/>
                                        <span style="width: 5mm;"/>
                                        <span style="width: 84mm;">
                                            <xsl:call-template name="PopulateText">
                                                <xsl:with-param name="TargetNode" select="$FormData/PartnerName"/>
                                            </xsl:call-template>
                                            <br/>
                                            <xsl:if test="$FormData/PartnerUSAddress and $FormData/PartnerUSAddress !=''">
                                                <xsl:call-template name="PopulateUSAddressTemplate">
                                                    <xsl:with-param name="TargetNode" select="$FormData/PartnerUSAddress "/>
                                                </xsl:call-template>
                                            </xsl:if>
                                            <xsl:if test="$FormData/PartnerForeignAddress and $FormData/PartnerForeignAddress !=''">
                                                <xsl:call-template name="PopulateForeignAddressTemplate">
                                                    <xsl:with-param name="TargetNode" select="$FormData/PartnerForeignAddress "/>
                                                </xsl:call-template>
                                            </xsl:if>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="IRS1065ScheduleK1_tdLeft" style="height:10mm;">
                                        <!-- PART II Line G -->
                                        <div style="float:left;clear:none;">
                                            <span style="font-weight: bold; width: 2mm;height:8mm;">G</span>
                                            <span style="width: 3mm;"/>
                                            <span style="width: 40mm;height:8mm;">
                                                      <input type="checkbox" class="styckbox" name="checkbox" id="dummyid">
                                                                <xsl:call-template name="PopulateCheckbox">
                                                                        <xsl:with-param name="TargetNode" select="$FormData/GenPartnerOrLLCMemManager"/>
                                                                </xsl:call-template>
                                                      </input>
                                                      <label>
                                                            <xsl:call-template name="PopulateLabel">
                                                                   <xsl:with-param name="TargetNode" select="$FormData/GenPartnerOrLLCMemManager"/>
                                                                   <xsl:with-param name="BackupName">IRS1065ScheduleK1GenPartnerOrLLCMemManager</xsl:with-param>
                                                            </xsl:call-template>
                             General partner or LLC<br/>
                                                            <span style="width:5mm;"/>member-manager
                                                     </label>
                                            </span>
                                        </div>
                                        <div style="float:right;clear:all;">
                                            <span style="width: 50mm;height:8mm;">
                                                <input type="checkbox" class="styckbox" name="checkbox" id="dummyid">
                                                    <xsl:call-template name="PopulateCheckbox">
                                                        <xsl:with-param name="TargetNode" select="$FormData/LimitedPartnerOrOtherLLCMember"/>
                                                    </xsl:call-template>
                                                </input>
                                                <label>
                                                    <xsl:call-template name="PopulateLabel">
                                                        <xsl:with-param name="TargetNode" select="$FormData/LimitedPartnerOrOtherLLCMember"/>
                                                        <xsl:with-param name="BackupName">IRS1065ScheduleK1LimitedPartnerOrOtherLLCMember</xsl:with-param>
                                                    </xsl:call-template>
                             Limited partner or other LLC<br/>
                                                    <span style="width:5mm;"/>member
                          </label>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="IRS1065ScheduleK1_tdLeft" style="height: 4mm;border-top-width:0;">
                                        <!-- PART II Line H-->
                                        <div style="float:left;clear:none;">
                                            <span style="font-weight: bold; width: 2mm;height:4mm;">H</span>
                                            <span style="width: 3mm;"/>
                                            <span style="width: 40mm;height:4mm;">
                                                <input type="checkbox" class="styckbox" name="checkbox" id="dummyid">
                                                    <xsl:if test="$FormData/DomesticPartner">
                                                        <xsl:call-template name="PopulateCheckbox">
                                                            <xsl:with-param name="TargetNode" select="$FormData/DomesticPartner"/>
                                                        </xsl:call-template>
                                                    </xsl:if>
                                                </input>
                                                <label>
                                                    <xsl:call-template name="PopulateLabel">
                                                        <xsl:with-param name="TargetNode" select="$FormData/DomesticPartner"/>
                                                        <xsl:with-param name="BackupName">IRS1065ScheduleK1DomesticPartner</xsl:with-param>
                                                    </xsl:call-template>
                              Domestic partner  
                          </label>
                                            </span>
                                        </div>
                                        <div style="float:right;clear:all;">
                                            <span style="width: 50mm;height:4mm;">
                                                <input type="checkbox" class="styckbox" name="checkbox" id="dummyid">
                                                    <xsl:if test="$FormData/ForeignPartner">
                                                        <xsl:call-template name="PopulateCheckbox">
                                                            <xsl:with-param name="TargetNode" select="$FormData/ForeignPartner"/>
                                                        </xsl:call-template>
                                                    </xsl:if>
                                                </input>
                                                <label>
                                                    <xsl:call-template name="PopulateLabel">
                                                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartner"/>
                                                        <xsl:with-param name="BackupName">IRS1065ScheduleK1ForeignPartner</xsl:with-param>
                                                    </xsl:call-template>
                              Foreign partner 
                          </label>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="IRS1065ScheduleK1_tdLeft" style="border-top-width:0;">
                                        <!-- PART II Line I -->
                                        <span style="font-weight: bold;">I</span>
                                        <span style="width: 4mm;"/>What type of entity is this partner?
                    <span style="width: 33mm; border-bottom: 1px solid black; text-align: left; ">
                                            <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/TypeOfEntityPartner"/>
                                            </xsl:call-template>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="IRS1065ScheduleK1_tdLeft" style="height: 23mm;border-top-width:0;">
                                        <!-- PART II Line J -->
                                        <span style="font-weight: bold;">J</span>
                                        <span style="width: 4mm;"/>Partner’s share of profit, loss, and capital (see instructions):
										<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/PartnersShareProfitLossCapital"/>
										</xsl:call-template>
										<br/>
										<br/>
										<table style="font-size:7pt;margin-left:5.3mm;" cellpadding="0" cellspacing="0">
												<tbody>
													   <tr>
															<th/>
															<th style="width:38mm;">Beginning</th>
															<th style="width:38mm;">Ending</th>
														</tr>
														<tr>
															<td width="3" style="width:2mm;border:1px black solid;border-top:0px;border-left:0;border-right:0;">Profit</td>
															<td style="border:1px black solid;border-top:0px;border-left:0;font-size:6pt" align="right">
																<span style="width:10mm;text-align:right;">
																	   <xsl:call-template name="PopulateText">
																				<xsl:with-param name="TargetNode"
																				 select="$FormData/PartnersShareProfitLossCapital/PartnersShareOfProfitBOY"/>
																	   </xsl:call-template>%
																</span>
															</td>
															<td style="border:1px black solid;border-top:0px;border-left:0;border-right:0px;text-align:right;font-size:6pt">
																<span style="width:32mm;text-align:right;font-size:6pt">
																		<xsl:call-template name="PopulateText">
																				<xsl:with-param name="TargetNode" 
																				select="$FormData/PartnersShareProfitLossCapital/PartnersShareOfProfitEOY"/>
																		</xsl:call-template>%
																</span>
															</td>
															</tr>
															<tr>
																<td width="3" style="width:2mm;border:1px black solid;border-top:0px;border-left:0;border-right:0;">Loss</td>
																<td style="border:1px black solid;border-top:0px;border-left:0;font-size:6pt" align="right">
																	  <span style="width:16mm;text-align:right;">
																				<xsl:call-template name="PopulateText">
																						<xsl:with-param name="TargetNode"
																						 select="$FormData/PartnersShareProfitLossCapital/PartnersShareOfLossBOY"/>
																				</xsl:call-template>%
																	  </span>
																</td>
																<td style="border:1px black solid;border-top:0px;border-left:0;border-right:0px;text-align:right;font-size:6pt">
																	  <span style="width:32mm;text-align:right;">
																				<xsl:call-template name="PopulateText">
																						<xsl:with-param name="TargetNode"
																						 select="$FormData/PartnersShareProfitLossCapital/PartnersShareOfLossEOY"/>
																				</xsl:call-template>%
																	  </span>
																</td>
															</tr>
															<tr>
																<td width="3" style="width:2mm;border:1px black solid;border-top:0px;border-left:0;border-right:0;">Capital</td>
																<td style="border:1px black solid;border-top:0px;border-left:0;font-size:6pt" align="right">
																	<span style="width:16mm;text-align:right;">
																			<xsl:call-template name="PopulateText">
																					<xsl:with-param name="TargetNode"
																					 select="$FormData/PartnersShareProfitLossCapital/PartnersShareOfCapitalBOY"/>
																			</xsl:call-template>%
																	</span>
																</td>
																<td style="border:1px black solid;border-top:0px;border-left:0;border-right:0px;text-align:right;font-size:6pt">
																	  <span style="width:32mm;text-align:right;">
																				<xsl:call-template name="PopulateText">
																						<xsl:with-param name="TargetNode"
																						 select="$FormData/PartnersShareProfitLossCapital/PartnersShareOfCapitalEOY"/>
																				</xsl:call-template>%
																	  </span>
																</td>
															</tr>
												</tbody>
										</table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="IRS1065ScheduleK1_tdLeft" style="height: 19mm;border-top-width:0;">
                                        <!-- PART II Line K -->
                                        <span style="font-weight: bold;">K</span>
                                        <span style="width: 4mm;"/>Partner’s share of liabilities at year end:
                    <xsl:call-template name="SetFormLinkInline">
                                            <xsl:with-param name="TargetNode" select="$FormData/PartnersShareOfLiabilityEOY"/>
                                        </xsl:call-template>
                                        <br/>
                                        <table cellspacing="0" cellpadding="0" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td style="padding-left:5.8mm;">
                                                        <span style="font-size:7pt;">
                            Nonrecourse
                                  <!--Dotted Line-->
                                                            <span style="width:8px;"/>.
                                    <span style="width:8px;"/>.
                                    <span style="width:8px;"/>.
                                    <span style="width:8px;"/>.
                                    <span style="width:8px;"/>.
                                    <span style="width:8px;"/>.
                                    <span style="width:8px;"/>.
                                    <span style="width:8px;"/>.
                            </span>
                                                    </td>
                                                    <td>
                                                        <span style="font-size:7pt;">$</span>
                                                        <span style="width: 33mm; border-bottom: 1px solid black; text-align: right; font-size:7pt;">
                                                            <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/PartnersShareOfLiabilityEOY/PrtnrShareOfLiabNonRcrsEOY"/>
                                                            </xsl:call-template>
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left:5.5mm;">
                                                        <span style="font-size:7pt;">
                            Qualified nonrecourse financing
                                  <!--Dotted Line-->
                                                            <span style="width:8px;"/>.
                            </span>
                                                    </td>
                                                    <td>
                                                        <span style="font-size:7pt;">$</span>
                                                        <span style="width: 33mm; border-bottom: 1px solid black; text-align: right; font-size:7pt;">
                                                            <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/PartnersShareOfLiabilityEOY/PrtnrShareOfLiabQlfyNonRcrsEOY"/>
                                                            </xsl:call-template>
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left:5.8mm;">
                                                        <span style="font-size:7pt;">
                            Recourse 
                            <!--Dotted Line-->
                                                            <span style="width:8px;"/>.
                                    <span style="width:8px;"/>.
                                    <span style="width:8px;"/>.
                                    <span style="width:8px;"/>.
                                    <span style="width:8px;"/>.
                                    <span style="width:8px;"/>.
                                    <span style="width:8px;"/>.
                                    <span style="width:8px;"/>.
                                    <span style="width:8px;"/>.                            
                            </span>
                                                    </td>
                                                    <td>
                                                        <span style="font-size:7pt;">$</span>
                                                        <span style="width: 33mm; border-bottom: 1px solid black; text-align: right;font-size:7pt; ">
                                                            <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/PartnersShareOfLiabilityEOY/PartnersShareOfLiabRcrsEOY"/>
                                                            </xsl:call-template>
                                                        </span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="IRS1065ScheduleK1_tdLeft" style="height: 46.8mm;border-bottom:1px solid black;">
                                        <!-- PART II Line L -->
                                        <span style="font-weight: bold;">L</span>
                                        <span style="width: 4mm;"/>Partner’s capital account analysis:
                                        <span style="width:2mm;"/>
                                        <xsl:call-template name="SetFormLinkInline">
                                            <xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAcct/OtherExplain"/>
                                        </xsl:call-template>
                                        <br/>
                                        <table cellspacing="0" cellpadding="0" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td style="padding-left:5.6mm;">
                                                        <span style="font-size:7pt;">
                            Beginning capital account
                            </span>
                                                        <!--Dotted Line-->
                                                        <span style="width:8px;"/>.                     
                              <span style="width:8px;"/>. 
                          </td>
                                                    <td>
                                                        <span style="font-size:7pt;">$</span>
                                                        <span style="width: 33mm; border-bottom: 1px solid black; text-align: right;font-size:7pt; ">
                                                            <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAcct/PrtnrBeginningCapitalAcct"/>
                                                            </xsl:call-template>
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left:5.6mm;">
                                                        <span style="font-size:7pt;">
                              Capital contributed during the year
                          </span>
                                                    </td>
                                                    <td>
                                                        <span style="font-size:7pt;">$</span>
                                                        <span style="width: 33mm; border-bottom: 1px solid black; text-align: right; font-size:7pt;">
                                                            <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAcct/PrtnrCapContributedDuringYr"/>
                                                            </xsl:call-template>
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left:5.6mm;">
                                                        <span style="font-size:7pt;">
                              Current year increase (decrease)
                          </span>
                                                    </td>
                                                    <td>
                                                        <span style="font-size:7pt;">$</span>
                                                        <span style="width: 33mm; border-bottom: 1px solid black; text-align: right;font-size:7pt; ">
                                                            <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAcct/PrtnrCurrentYrIncrDecr"/>
                                                            </xsl:call-template>
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left:5.6mm;">
                                                        <span style="font-size:7pt;">
                              Withdrawals &amp; distributions
                              </span>
                                                        <span style="width:8px;"/>.
                              <span style="width:8px;"/>.                     
                          </td>
                                                    <td>
                                                        <span style="font-size:7pt;">$</span>
                                                        <span style="width: 33mm; border-bottom: 1px solid black; text-align: right; font-size:7pt;">
                              (
                              <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAcct/PrtnrWithdrawAndDistribution"/>
                                                            </xsl:call-template>
                              )
                            </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left:5.7mm;">
                                                        <span style="font-size:7pt;">
                              Ending capital account    
                          </span>
                                                        <span style="width:8px;"/>.
                          <span style="width:8px;"/>.
                          <span style="width:8px;"/>.
                          </td>
                                                    <td>
                                                        <span style="font-size:7pt;">$</span>
                                                        <span style="width: 33mm; border-bottom: 1px solid black; text-align: right; font-size:7pt;">
                                                            <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAcct/PrtnrEndingCapitalAccount"/>
                                                            </xsl:call-template>
                                                        </span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <br/>
                                        <span style="width:5.9mm;"/>
                                        <input type="checkbox" class="styCkbox" name="checkbox" id="dummyID1" onclick="return false;">
                                            <xsl:call-template name="PopulateCheckbox">
                                                <xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAcct/TaxBasis"/>
                                            </xsl:call-template>
                                        </input>
                                        <label>
                                            <xsl:call-template name="PopulateLabel">
                                                <xsl:with-param name="TargetNode" select="$FormData/LimitedPartnerOrOtherLLCMember"/>
                                                <xsl:with-param name="BackupName">IRS1065ScheduleK1LimitedPartnerOrOtherLLCMember</xsl:with-param>
                                            </xsl:call-template>
                                            <span style="vertical-align: bottom;padding-left:1mm;">Tax basis</span>
                                        </label>
                                        <span style="width:5mm;"/>
                                        <input type="checkbox" class="styCkbox" name="checkbox" id="dummyID1" onclick="return false;">
                                            <xsl:call-template name="PopulateCheckbox">
                                                <xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAcct/GAAP"/>
                                            </xsl:call-template>
                                        </input>
                                        <label>
                                            <xsl:call-template name="PopulateLabel">
                                                <xsl:with-param name="TargetNode" select="$FormData/LimitedPartnerOrOtherLLCMember"/>
                                                <xsl:with-param name="BackupName">IRS1065ScheduleK1LimitedPartnerOrOtherLLCMember</xsl:with-param>
                                            </xsl:call-template>
                                            <span style="vertical-align: bottom;padding-left:1mm;">GAAP</span>
                                        </label>
                                        <span style="width:5mm;"/>
                                        <input type="checkbox" class="styCkbox" name="checkbox" id="dummyID1" onclick="return false;">
                                            <xsl:call-template name="PopulateCheckbox">
                                                <xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAcct/Section704bBook"/>
                                            </xsl:call-template>
                                        </input>
                                        <label>
                                            <xsl:call-template name="PopulateLabel">
                                                <xsl:with-param name="TargetNode" select="$FormData/LimitedPartnerOrOtherLLCMember"/>
                                                <xsl:with-param name="BackupName">IRS1065ScheduleK1LimitedPartnerOrOtherLLCMember</xsl:with-param>
                                            </xsl:call-template>
                                            <span style="vertical-align: bottom;padding-left:1mm;">Section 704(b) book</span>
                                        </label>
                                        <br/>
                                        <span style="width:5.9mm;"/>
                                        <input type="checkbox" class="styCkbox" name="checkbox" id="dummyID1" onclick="return false;">
                                            <xsl:call-template name="PopulateCheckbox">
                                                <xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAcct/OtherExplain"/>
                                            </xsl:call-template>
                                        </input>
                                        <label>
                                            <xsl:call-template name="PopulateLabel">
                                                <xsl:with-param name="TargetNode" select="$FormData/LimitedPartnerOrOtherLLCMember"/>
                                                <xsl:with-param name="BackupName">IRS1065ScheduleK1LimitedPartnerOrOtherLLCMember</xsl:with-param>
                                            </xsl:call-template>
                                            <span style="vertical-align: bottom;padding-left:1mm;">Other (explain)</span>
                                        </label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="93mm" style="width: 93mm;" valign="top">
                            <table width="93mm" border="0" cellpadding="0" cellspacing="0" style="border-top: 2px solid black; border-bottom: 0px; border-left: 1px solid black; border-right: 2px solid black;">
                                <!-- Inner table - Part III -->
                                <tr>
                                    <td colspan="2">
                                        <!-- Part III header -->
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="IRS1065ScheduleK1_tdPartName" style="width: 15mm;">
                                                    <span class="IRS1065ScheduleK1_partName" style="vertical-align: top;">Part III</span>
                                                </td>
                                                <td class="IRS1065ScheduleK1_tdPartDesc">
                                                    <span class="IRS1065ScheduleK1_partDesc">Partner’s Share of Current Year Income, Deductions, Credits, and Other Items</span>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" style="border-right:1px solid black;">
                                        <table width="46.5mm" border="0" cellpadding="0" cellspacing="0" style="">
                                            <!-- Part III columns 1-14 -->
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="height:4mm;">
                                                    <!-- Line 1 -->
                                                    <div style="width: 46.5mm;">
                                                        <span class="IRS1065ScheduleK1_itemLabel" style="text-align: center;height:3.5mm;">1</span>
                                                        <span style="font-size: 6pt;height:3.5mm;width:40mm;">
                                                            <span style="width:1mm"/>Ordinary business income (loss)
                            </span>
                                                        <span class="IRS1065ScheduleK1_codeBox" style="height:4mm;"/>
                                                        <span class="IRS1065ScheduleK1_amountBox" style="text-align: right;height:4mm;">
                                                            <span style="float:left;">
                                                                <span style="width:2px;height:1px;"/>
                                                                <xsl:call-template name="SetFormLinkInline">
                                                                    <xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncomeLoss"/>
                                                                </xsl:call-template>
                                                            </span>
                                                            <span>
                                                                <xsl:call-template name="PopulateAmount">
                                                                    <xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncomeLoss"/>
                                                                </xsl:call-template>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="height:4mm;">
                                                    <!-- Line 2 -->
                                                    <div style="width: 46.5mm;">
                                                        <span class="IRS1065ScheduleK1_itemLabel" style="text-align: center;height:3.5mm;">2</span>
                                                        <span style="font-size: 6pt;height:3.5mm;width:40mm;">
                                                            <span style="width:1mm"/>Net rental real estate income (loss)
                            </span>
                                                        <span class="IRS1065ScheduleK1_codeBox" style="height:4mm;"/>
                                                        <span class="IRS1065ScheduleK1_amountBox" style="text-align: right;height:3.5mm">
                                                            <span style="float:left;">
                                                                <span style="width:2px;height:1px;"/>
                                                                <xsl:call-template name="SetFormLinkInline">
                                                                    <xsl:with-param name="TargetNode" select="$FormData/NetIncomeLossRealEstateAmount"/>
                                                                </xsl:call-template>
                                                            </span>
                                                            <span style="float:right;">
                                                                <xsl:call-template name="PopulateAmount">
                                                                    <xsl:with-param name="TargetNode" select="$FormData/NetIncomeLossRealEstateAmount"/>
                                                                </xsl:call-template>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="height:4mm;">
                                                    <!-- Line 3 -->
                                                    <div style="width: 46.5mm;">
                                                        <span class="IRS1065ScheduleK1_itemLabel" style="text-align: center;height:3.5mm;">3</span>
                                                        <span style="font-size: 6pt;height:3.5mm;width:40mm;">
                                                            <span style="width:1mm"/>Other net rental income (loss)</span>
                                                        <br/>
                                                        <span class="IRS1065ScheduleK1_codeBox"/>
                                                        <span class="IRS1065ScheduleK1_amountBox" style="text-align: right;height:3.5mm;">
                                                            <span style="float:left;padding-left:2px;">
                                                                <xsl:call-template name="SetFormLinkInline">
                                                                    <xsl:with-param name="TargetNode" select="$FormData/OtherNetRentalIncomeLoss"/>
                                                                </xsl:call-template>
                                                            </span>
                                                            <span style="float:right;">
                                                                <xsl:call-template name="PopulateAmount">
                                                                    <xsl:with-param name="TargetNode" select="$FormData/OtherNetRentalIncomeLoss"/>
                                                                </xsl:call-template>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="height:4mm;">
                                                    <!-- Line 4 -->
                                                    <div style="width: 46.5mm;">
                                                        <span class="IRS1065ScheduleK1_itemLabel" style="text-align: center;height:3.5mm">4</span>
                                                        <span style="font-size: 7pt;height:3.5mm;width:40mm;">
                                                            <span style="width:1mm"/>Guaranteed payments</span>
                                                        <br/>
                                                        <span class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;"/>
                                                        <span class="IRS1065ScheduleK1_amountBox" style="text-align: right;height:4.5mm;">
                                                            <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/GuaranteedPayments"/>
                                                            </xsl:call-template>
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="height:4mm;">
                                                    <!-- Line 5 -->
                                                    <div style="width: 46.5mm;">
                                                        <span class="IRS1065ScheduleK1_itemLabel" style="text-align: center;height:3.5mm">5</span>
                                                        <span style="font-size: 7pt;height:3.5mm;width:40mm;">
                                                            <span style="width:1mm"/>Interest income</span>
                                                        <br/>
                                                        <span class="IRS1065ScheduleK1_codeBox"/>
                                                        <span class="IRS1065ScheduleK1_amountBox" style="text-align: right;">
                                                            <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/InterestIncome"/>
                                                            </xsl:call-template>
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="height:4mm;">
                                                    <!-- Line 6a -->
                                                    <div style="width: 46.5mm;">
                                                        <span class="IRS1065ScheduleK1_itemLabel" style="text-align: center;height:3.5mm">6a</span>
                                                        <span style="font-size: 7pt;height:3.5mm;width:40mm;">
                                                            <span style="width:1mm"/>Ordinary dividends</span>
                                                        <br/>
                                                        <span class="IRS1065ScheduleK1_codeBox"/>
                                                        <span class="IRS1065ScheduleK1_amountBox" style="text-align: right;height:3.5mm">
                                                            <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividends"/>
                                                            </xsl:call-template>
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="height:4mm;">
                                                    <!-- Line 6b -->
                                                    <div style="width: 46.5mm;">
                                                        <span class="IRS1065ScheduleK1_itemLabel" style="text-align: center;height:3.5mm">6b</span>
                                                        <span style="font-size: 7pt;height:3.5mm;width:40mm;">
                                                            <span style="width:1mm"/>Qualified dividends</span>
                                                        <br/>
                                                        <span class="IRS1065ScheduleK1_codeBox"/>
                                                        <span class="IRS1065ScheduleK1_amountBox" style="text-align: right;height:3.5mm">
                                                            <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/QualifiedDividends"/>
                                                            </xsl:call-template>
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <!-- Line 7 -->
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="height:4mm;">
                                                    <div style="width: 46.5mm;">
                                                        <span class="IRS1065ScheduleK1_itemLabel" style="text-align: center;height:3.5mm">7</span>
                                                        <span style="font-size: 7pt;height:3.5mm;width:40mm;">
                                                            <span style="width:1mm"/>Royalties</span>
                                                        <br/>
                                                        <span class="IRS1065ScheduleK1_codeBox"/>
                                                        <span class="IRS1065ScheduleK1_amountBox" style="text-align: right;height:3.5mm">
                                                            <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/Royalties"/>
                                                            </xsl:call-template>
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <!-- Line 8 -->
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="height:4mm;">
                                                    <div style="width: 46.5mm;">
                                                        <span class="IRS1065ScheduleK1_itemLabel" style="text-align: center;height:3.5mm">8</span>
                                                        <span style="font-size: 6pt;height:3.5mm;width:40mm;">
                                                            <span style="width:1mm"/>Net short-term capital gain (loss)</span>
                                                        <br/>
                                                        <span class="IRS1065ScheduleK1_codeBox"/>
                                                        <span class="IRS1065ScheduleK1_amountBox" style="text-align: right;height:3.5mm">
                                                            <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/NetSTCapitalGainLoss"/>
                                                            </xsl:call-template>
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="height:4.4mm;">
                                                    <!-- Line 9a -->
                                                    <div style="width: 46.5mm;">
                                                        <span class="IRS1065ScheduleK1_itemLabel" style="text-align: center;height:3.9mm">9a</span>
                                                        <span style="font-size: 6pt;height:3.9mm;width:40mm;">
                                                            <span style="width:1mm"/>Net long-term capital gain (loss)</span>
                                                        <br/>
                                                        <span class="IRS1065ScheduleK1_codeBox"/>
                                                        <span class="IRS1065ScheduleK1_amountBox" style="text-align: right;height:3.9mm">
                                                            <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/NetLTCapitalGainLoss"/>
                                                            </xsl:call-template>
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="height:4.2mm;">
                                                    <!-- Line 9b -->
                                                    <div style="width: 46.5mm;">
                                                        <span class="IRS1065ScheduleK1_itemLabel" style="text-align: center;height:3.7mm">9b</span>
                                                        <span style="font-size: 6pt;height:3.7mm;width:40mm;">
                                                            <span style="width:1mm"/>Collectibles (28%) gain (loss)</span>
                                                        <br/>
                                                        <span class="IRS1065ScheduleK1_codeBox"/>
                                                        <span class="IRS1065ScheduleK1_amountBox" style="text-align: right;height:3.7mm;">
                                                            <xsl:call-template name="PopulateAmount">
                                                                <xsl:with-param name="TargetNode" select="$FormData/CollectiblesGainLoss"/>
                                                            </xsl:call-template>
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="height:4mm;">
                                                    <!-- Line 9c -->
                                                    <div style="width: 46.5mm;">
                                                        <span class="IRS1065ScheduleK1_itemLabel" style="text-align:center;height:3.5mm;">9c</span>
                                                        <span style="font-size: 6pt;height:3.5mm;width:40mm;">
                                                            <span style="width:1mm"/>Unrecaptured section 1250 gain</span>
                                                        <br/>
                                                        <span class="IRS1065ScheduleK1_codeBox"/>
                                                        <span class="IRS1065ScheduleK1_amountBox" style="text-align:right;height:3.5mm;">
                                                            <span style="float:left;padding-left:2px;">
                                                                <xsl:call-template name="SetFormLinkInline">
                                                                    <xsl:with-param name="TargetNode" select="$FormData/UnrecapturedSection1250Gain"/>
                                                                </xsl:call-template>
                                                            </span>
                                                            <span style="float:right;">
                                                                <xsl:call-template name="PopulateAmount">
                                                                    <xsl:with-param name="TargetNode" select="$FormData/UnrecapturedSection1250Gain"/>
                                                                </xsl:call-template>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="height:4mm;">
                                                    <!-- Line 10 -->
                                                    <div style="width: 46.5mm;">
                                                        <span class="IRS1065ScheduleK1_itemLabel" style="text-align: center;height:3.5mm;">10</span>
                                                        <span style="font-size: 6pt;height:3.5mm;width:40mm;">
                                                            <span style="width:1mm"/>Net section 1231 gain (loss)</span>
                                                        <br/>
                                                        <span class="IRS1065ScheduleK1_codeBox"/>
                                                        <span class="IRS1065ScheduleK1_amountBox" style="text-align: right;height:3.5mm;">
                                                            <span style="float:left;padding-left:2px;">
                                                                <xsl:call-template name="SetFormLinkInline">
                                                                    <xsl:with-param name="TargetNode" select="$FormData/NetSect1231GainLoss"/>
                                                                </xsl:call-template>
                                                            </span>
                                                            <span style="float:right;">
                                                                <xsl:call-template name="PopulateAmount">
                                                                    <xsl:with-param name="TargetNode" select="$FormData/NetSect1231GainLoss"/>
                                                                </xsl:call-template>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <!-- Line 11 -->
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
                                                    <table cellpadding="0" cellspacing="0" style="width:46.5mm;">
                                                        <tbody>
                                                            <tr>
                                                                <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;float:left;">11</td>
                                                                <td style="float:left;font-size:7pt;">
                                                                    <span style="width:1mm;"/>Other income (loss)</td>
                                                            </tr>
                                                            <!-- Display a blank line if there are no data elements -->
                                                            <xsl:if test="count($FormData/OtherIncomeLoss/Item) = 0 ">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <xsl:for-each select="$FormData/OtherIncomeLoss/Item">
                                                                <xsl:choose>
                                                                    <xsl:when test="position() = 1">
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                <span style="float:left;padding-left:2px;">
                                                                                    <xsl:call-template name="SetFormLinkInline">
                                                                                        <xsl:with-param name="TargetNode" select="$FormData/OtherIncomeLoss"/>
                                                                                    </xsl:call-template>
                                                                                </span>
                                                                                <span style="float:right;">
                                                                                    <xsl:call-template name="PopulateAmount">
                                                                                        <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                    </xsl:call-template>
                                                                                    <span style="width:1.5mm;"/>
                                                                                </span>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateAmount">
                                                                                    <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                </xsl:call-template>
                                                                                <span style="width:1.5mm;"/>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:for-each>
                                                            <!-- If there is only 1 element, add 2 rows-->
                                                            <xsl:if test="count($FormData/OtherIncomeLoss/Item) = 1">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <!-- If there are only 2 elements, add 1 row-->
                                                            <xsl:if test="count($FormData/OtherIncomeLoss/Item) = 2">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <!-- Line 12 -->
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="height:4mm;">
                                                    <div style="width:46.5mm;">
                                                        <span class="IRS1065ScheduleK1_itemLabel" style="text-align:center;">12</span>
                                                        <span style="width:1mm;"/>Section 179 deduction<br/>
                                                        <!-- Display a blank line if there are no data elements -->
                                                        <xsl:if test="count($FormData/Section179ExpenseDeduction) = 0 ">
                                                            <span class="IRS1065ScheduleK1_codeBox" style="border-bottom:0px;margin-top:0mm;"/>
                                                            <span class="IRS1065ScheduleK1_amountBox" style="border-bottom:0px;margin-top:0mm;"/>
                                                        </xsl:if>
                                                        <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
                                                        <!-- If the print parameter is separated, but there are fewer elements than the container height (1) -->
                                                        <xsl:if test="($Print != $Separated) or (count($FormData/Section179ExpenseDeduction) = 1) ">
                                                            <span class="IRS1065ScheduleK1_codeBox"/>
                                                            <span class="IRS1065ScheduleK1_amountBox" style="text-align:right;">
                                                                <span style="float:left;padding-left:2px;">
                                                                    <xsl:call-template name="SetFormLinkInline">
                                                                        <xsl:with-param name="TargetNode" select="$FormData/Section179ExpenseDeduction"/>
                                                                    </xsl:call-template>
                                                                </span>
                                                                <span style="float:right;">
                                                                    <xsl:call-template name="PopulateAmount">
                                                                        <xsl:with-param name="TargetNode" select="$FormData/Section179ExpenseDeduction"/>
                                                                    </xsl:call-template>
                                                                </span>
                                                            </span>
                                                        </xsl:if>
                                                    </div>
                                                </td>
                                            </tr>
                                            <!-- Line 13 -->
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
                                                    <table cellpadding="0" cellspacing="0" style="width:46.5mm;">
                                                        <tbody>
                                                            <tr>
                                                                <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;float:left;">13</td>
                                                                <td style="float:left;font-size:7pt;">
                                                                    <span style="width:1mm;"/>Other deductions</td>
                                                            </tr>
                                                            <!-- Display a blank line if there are no data elements -->
                                                            <xsl:if test="count($FormData/OtherDeductions/Item) = 0 ">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <xsl:for-each select="$FormData/OtherDeductions/Item">
                                                                <xsl:choose>
                                                                    <xsl:when test="position() = 1">
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                <span style="float:left;padding-left:2px;">
                                                                                    <xsl:call-template name="SetFormLinkInline">
                                                                                        <xsl:with-param name="TargetNode" select="$FormData/OtherDeductions"/>
                                                                                    </xsl:call-template>
                                                                                    <span style="width:1.5mm;"/>
                                                                                </span>
                                                                                <span style="float:right;">
                                                                                    <xsl:call-template name="PopulateAmount">
                                                                                        <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                    </xsl:call-template>
                                                                                </span>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateAmount">
                                                                                    <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                </xsl:call-template>
                                                                                <span style="width:1.5mm;"/>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:for-each>
                                                            <!-- If there is only 1 element, add 2 rows-->
                                                            <xsl:if test="count($FormData/OtherDeductions/Item) = 1">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <!-- If there are only 2 elements, add 1 row-->
                                                            <xsl:if test="count($FormData/OtherDeductions/Item) = 2">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <!-- Line 14 -->
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
                                                    <table cellpadding="0" cellspacing="0" style="width:46.5mm;">
                                                        <tbody>
                                                            <tr>
                                                                <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;float:left;">14</td>
                                                                <td style="float:left;font-size:6pt;">
                                                                    <span style="width:1mm;"/>Self-employment earnings (loss)</td>
                                                            </tr>
                                                            <!-- Display a blank line if there are no data elements -->
                                                            <xsl:if test="count($FormData/SelfEmploymentEarningsLoss/Item) = 0 ">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <xsl:for-each select="$FormData/SelfEmploymentEarningsLoss/Item">
                                                                <xsl:choose>
                                                                    <xsl:when test="position() = 1">
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateAmount">
                                                                                    <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                </xsl:call-template>
                                                                                <br/>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:8.2mm;float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:8.2mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateAmount">
                                                                                    <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                </xsl:call-template>
                                                                                <br/>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:for-each>
                                                            <!-- If there is only 1 element, add 1 row -->
                                                            <xsl:if test="count($FormData/SelfEmploymentEarningsLoss/Item) = 1">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8.2mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8.2mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <!-- If there is only 1 element, add 1 rows -->
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <!-- Part III columns 15-20 -->
                                    <!-- Line 15 -->
                                    <td valign="top">
                                        <table width="46.5mm" border="0" cellpadding="0" cellspacing="0" style="">
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
                                                    <table cellpadding="0" cellspacing="0" style="width:46.5mm;">
                                                        <tbody>
                                                            <tr>
                                                                <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;float:left;">15</td>
                                                                <td style="float:left;font-size:7pt;">
                                                                    <span style="width:1mm;"/>Credits</td>
                                                            </tr>
                                                            <!-- Display a blank line if there are no data elements -->
                                                            <xsl:if test="count($FormData/CreditsAndCreditRecapture/Item) = 0 ">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <xsl:for-each select="$FormData/CreditsAndCreditRecapture/Item">
                                                                <xsl:choose>
                                                                    <xsl:when test="position() = 1">
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                <span style="float:left;padding-left:2px;">
                                                                                    <xsl:call-template name="SetFormLinkInline">
                                                                                        <xsl:with-param name="TargetNode" select="$FormData/CreditsAndCreditRecapture"/>
                                                                                    </xsl:call-template>
                                                                                </span>
                                                                                <span style="float:right;">
                                                                                    <xsl:call-template name="PopulateAmount">
                                                                                        <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                    </xsl:call-template>
                                                                                </span>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateAmount">
                                                                                    <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                </xsl:call-template>
                                                                                <br/>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:for-each>
                                                            <!-- If there is only 1 element, add 1 row -->
                                                            <xsl:if test="count($FormData/CreditsAndCreditRecapture/Item) = 1">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <!-- If there is only 1 element, add 1 rows -->
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <!-- Line 16 -->
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
                                                    <table cellpadding="0" cellspacing="0" style="width:46.5mm;">
                                                        <tbody>
                                                            <tr>
                                                                <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;float:left;" valign="top">16</td>
                                                                <td style="font-size:7pt;">
                                                                    <span style="width:1mm;"/>Foreign transactions
                                </td>
                                                            </tr>
                                                            <!-- Display a blank line if there are no data elements -->
                                                            <xsl:if test="count($FormData/ForeignTransactions) = 0 ">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <xsl:for-each select="$FormData/ForeignTransactions">
                                                                <xsl:if test="CountryOrPossessionCode">
                                                                    <xsl:choose>
                                                                        <xsl:when test="position() = 1">
                                                                            <tr>
                                                                                <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
                                                                                    <xsl:call-template name="PopulateText">
                                                                                        <xsl:with-param name="TargetNode" select="CountryOrPossessionCode"/>
                                                                                    </xsl:call-template>
                                                                                </td>
                                                                                <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                    <span style="float:left;padding-left:2px;">
                                                                                        <xsl:call-template name="SetFormLinkInline">
                                                                                            <xsl:with-param name="TargetNode" select="CountryOrPossessionCode"/>
                                                                                        </xsl:call-template>
                                                                                    </span>
                                                                                    <span style="float:right;">
                                                                                        <xsl:call-template name="PopulateAmount">
                                                                                            <xsl:with-param name="TargetNode" select="CountryOrPossessionName"/>
                                                                                        </xsl:call-template>
                                                                                    </span>
                                                                                </td>
                                                                            </tr>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <tr>
                                                                                <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
                                                                                    <xsl:call-template name="PopulateText">
                                                                                        <xsl:with-param name="TargetNode" select="CountryOrPossessionCode"/>
                                                                                    </xsl:call-template>
                                                                                </td>
                                                                                <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                    <span style="float:left;padding-left:2px;">
                                                                                        <xsl:call-template name="SetFormLinkInline">
                                                                                            <xsl:with-param name="TargetNode" select="CountryOrPossessionCode"/>
                                                                                        </xsl:call-template>
                                                                                    </span>
                                                                                    <span style="float:right;">
                                                                                        <xsl:call-template name="PopulateAmount">
                                                                                            <xsl:with-param name="TargetNode" select="CountryOrPossessionName"/>
                                                                                        </xsl:call-template>
                                                                                    </span>
                                                                                </td>
                                                                            </tr>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>
                                                                </xsl:if>
                                                                <xsl:if test="Code">
                                                                    <xsl:choose>
                                                                        <xsl:when test="position() = 1">
                                                                            <tr>
                                                                                <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
                                                                                    <xsl:call-template name="PopulateText">
                                                                                        <xsl:with-param name="TargetNode" select="Code"/>
                                                                                    </xsl:call-template>
                                                                                </td>
                                                                                <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                    <span style="float:left;padding-left:2px;">
                                                                                        <xsl:call-template name="SetFormLinkInline">
                                                                                            <xsl:with-param name="TargetNode" select="Code"/>
                                                                                        </xsl:call-template>
                                                                                    </span>
                                                                                    <span style="float:right;">
                                                                                        <xsl:call-template name="PopulateAmount">
                                                                                            <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                        </xsl:call-template>
                                                                                    </span>
                                                                                </td>
                                                                            </tr>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <tr>
                                                                                <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
                                                                                    <xsl:call-template name="PopulateText">
                                                                                        <xsl:with-param name="TargetNode" select="Code"/>
                                                                                    </xsl:call-template>
                                                                                </td>
                                                                                <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                    <span style="float:left;padding-left:2px;">
                                                                                        <xsl:call-template name="SetFormLinkInline">
                                                                                            <xsl:with-param name="TargetNode" select="Code"/>
                                                                                        </xsl:call-template>
                                                                                    </span>
                                                                                    <span style="float:right;">
                                                                                        <xsl:call-template name="PopulateAmount">
                                                                                            <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                        </xsl:call-template>
                                                                                    </span>
                                                                                </td>
                                                                            </tr>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>
                                                                </xsl:if>
                                                                <!--<xsl:if test="CountryOrPossessionCode">
                                <xsl:choose>
                                <xsl:when test="position() = 1">
                                      <tr>
                                      <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;background-color:pink;" valign="bottom">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="Code" />
                              </xsl:call-template>                                                                 
                                      </td>
                                      <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;background-color:pink;" valign="bottom">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="Amount" />
                                </xsl:call-template><br/>   
                                      </td>
                                      </tr>
                                </xsl:when>
                                 <xsl:otherwise>
                                      <tr>
                                      <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
                                    <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="Code" />
                                    </xsl:call-template>                                                                 
                                      </td>
                                      <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;" valign="bottom">                      
                                    <xsl:call-template name="PopulateAmount">
                                      <xsl:with-param name="TargetNode" select="Amount" />
                                    </xsl:call-template><br/>   
                                      </td>
                                      </tr>
                 </xsl:otherwise> 
                 </xsl:choose>
                </xsl:if>       -->
                                                            </xsl:for-each>
                                                            <!-- If there are only 1 element, add 6 rows -->
                                                            <xsl:if test="count($FormData/ForeignTransactions) = 1">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <!-- If there are only 2 elements, add 5 rows -->
                                                            <xsl:if test="count($FormData/ForeignTransactions) = 2">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <!-- If there are only 3 elements, add 4 rows -->
                                                            <xsl:if test="count($FormData/ForeignTransactions) = 3">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <!-- If there are only 4 elements, add 3 rows -->
                                                            <xsl:if test="count($FormData/ForeignTransactions) = 4">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <!-- If there are only 5 elements, add 2 rows -->
                                                            <xsl:if test="count($FormData/ForeignTransactions) = 5">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <!-- If there are only 6 elements, add 1 row -->
                                                            <xsl:if test="count($FormData/ForeignTransactions) = 6">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <!-- If there is only 1 element, add 2 rows -->
                                                            <xsl:if test="count($FormData/ForeignTransactions) = 1">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <!-- Line 17 -->
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
                                                    <table cellpadding="0" cellspacing="0" style="width:46.5mm;">
                                                        <tbody>
                                                            <tr>
                                                                <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;float:left;" valign="top">17</td>
                                                                <td style="font-size:6pt;">
                                                                    <span style="width:0.5mm;"/>Alternative minimum tax (AMT) items</td>
                                                            </tr>
                                                            <!-- Display a blank line if there are no data elements -->
                                                            <xsl:if test="count($FormData/AMTItems/Item) = 0 ">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <xsl:for-each select="$FormData/AMTItems/Item">
                                                                <xsl:choose>
                                                                    <xsl:when test="position() = 1">
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                <span style="float:left;padding-left:2px;">
                                                                                    <xsl:call-template name="SetFormLinkInline">
                                                                                        <xsl:with-param name="TargetNode" select="$FormData/AMTItems"/>
                                                                                    </xsl:call-template>
                                                                                </span>
                                                                                <span style="float:right;">
                                                                                    <xsl:call-template name="PopulateAmount">
                                                                                        <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                    </xsl:call-template>
                                                                                </span>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateAmount">
                                                                                    <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                </xsl:call-template>
                                                                                <br/>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:for-each>
                                                            <!-- If there are only 2 elements, add 1 row -->
                                                            <xsl:if test="count($FormData/AMTItems/Item) = 2">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <!-- If there is only 1 element, add 2 rows -->
                                                            <xsl:if test="count($FormData/AMTItems/Item) = 1">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <!-- Line 18 -->
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
                                                    <table cellpadding="0" cellspacing="0" style="width:46.5mm;">
                                                        <tbody>
                                                            <tr>
                                                                <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;float:left;height:6.5mm;" valign="top">18</td>
                                                                <td style="float:left;font-size:7pt;">
                                                                    <span style="width:1mm;"/>Tax-exempt income and <br/>
                                                                    <span style="width:1mm;"/>nondeductible expenses
                                      </td>
                                                            </tr>
                                                            <!-- Display a blank line if there are no data elements -->
                                                            <xsl:if test="count($FormData/TaxExemptIncomeNonDedExpenses/Item) = 0 ">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <xsl:for-each select="$FormData/TaxExemptIncomeNonDedExpenses/Item">
                                                                <xsl:choose>
                                                                    <xsl:when test="position() = 1">
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateAmount">
                                                                                    <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                </xsl:call-template>
                                                                                <br/>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateAmount">
                                                                                    <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                </xsl:call-template>
                                                                                <br/>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:for-each>
                                                            <!-- If there are only 2 elements, add 1 row -->
                                                            <xsl:if test="count($FormData/TaxExemptIncomeNonDedExpenses/Item) = 2">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <!-- If there is only 1 element, add 2 rows -->
                                                            <xsl:if test="count($FormData/TaxExemptIncomeNonDedExpenses/Item) = 1">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <!-- Line 19 -->
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
                                                    <table cellpadding="0" cellspacing="0" style="width:46.5mm;">
                                                        <tbody>
                                                            <tr>
                                                                <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;float:left;">19</td>
                                                                <td style="float:left;font-size:7pt;">
                                                                    <span style="width:1mm;"/>Distributions</td>
                                                            </tr>
                                                            <!-- Display a blank line if there are no data elements -->
                                                            <xsl:if test="count($FormData/Distributions) = 0 ">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
                                                                           <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <xsl:for-each select="$FormData/Distributions">
                                                              <xsl:if test="$FormData/Distributions/Item">
                                                                <xsl:choose>
                                                                    <xsl:when test="position() = 1">
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="$FormData/Distributions/Item/Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                <span style="float:left;padding-left:2px;">
                                                                                    <xsl:call-template name="SetFormLinkInline">
                                                                                        <xsl:with-param name="TargetNode" select="$FormData/Distributions/Item"/>
                                                                                    </xsl:call-template>
                                                                                </span>
                                                                                <span style="float:right;">
                                                                                         <xsl:call-template name="PopulateAmount">
                                                                                                <xsl:with-param name="TargetNode" select="$FormData/Distributions/Item/Amount"/>
                                                                                         </xsl:call-template>
                                                                                </span>
                                                                                <br/>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="$FormData/Distributions/Item/Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                 <span style="float:left;padding-left:2px;">
                                                                                    <xsl:call-template name="SetFormLinkInline"> 
                                                                                          <xsl:with-param name="TargetNode" select="$FormData/Distributions/Item"/>
                                                                                    </xsl:call-template>
                                                                                 </span>
                                                                                 <span style="float:right;">
                                                                                <xsl:call-template name="PopulateAmount">
                                                                                    <xsl:with-param name="TargetNode" select="$FormData/Distributions/Item/Amount"/>
                                                                                </xsl:call-template>
                                                                                </span>
                                                                                <!--<br/>-->
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                               </xsl:if> 
                                                            </xsl:for-each>
                                                            <!-- If there is only 1 element, add 1 row -->
                                                            <xsl:if test="count($FormData/Distributions/Item) = 1">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <!-- If there is only 1 element, add 1 rows -->
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <!-- Line 20 -->
                                            <tr>
                                                <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
                                                    <table cellpadding="0" cellspacing="0" style="width:46.5mm;">
                                                        <tbody>
                                                            <tr>
                                                                <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;float:left;">20</td>
                                                                <td style="float:left;font-size:7pt;">
                                                                    <span style="width:1mm;"/>Other information</td>
                                                            </tr>
                                                            <!-- Display a blank line if there are no data elements -->
                                                            <xsl:if test="count($FormData/OtherInformation/Item) = 0 ">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <xsl:for-each select="$FormData/OtherInformation/Item">
                                                                <xsl:choose>
                                                                    <xsl:when test="position() = 1">
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:9.1mm;float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:9.1mm;border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                <span style="float:left;padding-left:2px;">
                                                                                    <xsl:call-template name="SetFormLinkInline">
                                                                                        <xsl:with-param name="TargetNode" select="$FormData/OtherInformation"/>
                                                                                    </xsl:call-template>
                                                                                
                                                                                <span style="width:1mm;"/>
                                                                                <xsl:call-template name="LinkToLeftoverDataTableInline">
																					<xsl:with-param name="Desc">Schedule K-1, Part III, Line 20 Other Information
																					</xsl:with-param>
																					<xsl:with-param name="TargetNode" 
																					    select="$FormData/OtherInformation/Item/Code"/>
																			     </xsl:call-template>
																			     </span>
                                                                                 <span style="float:right;">
                                                                                    <xsl:call-template name="PopulateAmount">
                                                                                        <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                    </xsl:call-template>
                                                                                </span>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <tr>
                                                                            <td class="IRS1065ScheduleK1_codeBox" style="height:8.1mm;float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="Code"/>
                                                                                </xsl:call-template>
                                                                            </td>
                                                                            <td class="IRS1065ScheduleK1_amountBox" style="height:8.1mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;" valign="bottom">
                                                                                <xsl:call-template name="PopulateAmount">
                                                                                    <xsl:with-param name="TargetNode" select="Amount"/>
                                                                                </xsl:call-template>
                                                                                <br/>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:for-each>
                                                            <!-- If there is only 1 element, add 3 rows-->
                                                            <xsl:if test="count($FormData/OtherInformation/Item) = 1">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8.1mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8.1mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8.1mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8.1mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8.1mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8.1mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <!-- If there are only 2 elements, add 2 rows-->
                                                            <xsl:if test="count($FormData/OtherInformation/Item) = 2">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8.1mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8.1mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8.1mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8.1mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                            <!-- If there are only 3 elements, add 1 row-->
                                                            <xsl:if test="count($FormData/OtherInformation/Item) = 3">
                                                                <tr>
                                                                    <td class="IRS1065ScheduleK1_codeBox" style="height:8.1mm;float:left;border-top:1px solid black;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                    <td class="IRS1065ScheduleK1_amountBox" style="height:8.1mm;float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
                                                                        <span style="vertical-align:baseline;height:100%;"/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="font-family: Verdana; font-size: 7pt; border-top: 2px solid black; text-align: left;border-bottom:2px solid black;">
               * See attached statement for additional information.
               </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="height:100%;height:44.6mm;border-bottom:1px solid black;">
										<!-- IRS Use Only box -->
                                        <span style="vertical-align:baseline;height:90%;"/>
                                        <img src="{$ImagePath}/1065SchK1_For_IRS_Use_Only.gif" width="24" height="112" alt="For IRS Use Only"/>
                                    </td>
                                </tr>
                            </table>
                            <!-- End inner table - Part III -->
                        </td>
                    </tr>
                    <tr>
                        <td width="189mm" colspan="2" style="width: 189mm; font-family: Verdana; font-size: 6pt; font-weight: bold; border-top: 1px solid black;">
                            <span style="width: 116mm;">For Paperwork Reduction Act Notice, see Instructions for Form 1065.</span>
                            <span style="font-weight: normal; width: 31mm;">Cat. No. 11394R</span>
                            <span style="width: 40mm;">Schedule K-1 (Form 1065) 2008</span>
                        </td>
                    </tr>
                </table>
                <!-- FORM DISPLAY ENDS  HERE -->
                <br/>
                <br class="pageEnd"/>
                <!-- From 1065 form -->
                <!-- BEGIN Left Over Table -->
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
                        <xsl:with-param name="TargetNode" select="$FormData"/>
                        <xsl:with-param name="DescWidth" select="100"/>
                    </xsl:call-template>
                    <xsl:call-template name="PopulateLeftoverRow">
                            <xsl:with-param name="Desc">Form 1065 Schedule K-1 Line 20 Other Information</xsl:with-param>
                            <xsl:with-param name="TargetNode" select="$FormData/OtherInformation/Item/Code"/>
                            <xsl:with-param name="DescWidth" select="100"/>
                        </xsl:call-template>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
