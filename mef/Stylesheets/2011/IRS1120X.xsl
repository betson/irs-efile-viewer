<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120XStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form1120XData" select="$RtnDoc/IRS1120X"/>
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form1120XData)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set  -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 1120X"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120XStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form1120X">
          <!--Form 1120X-->
          <xsl:call-template name="DocumentHeader"/>
          <div class="styBB" style="width:187mm;border-bottom-width:1px;">
            <div class="styFNBox" style="width:31mm;height:22.5mm;border-right-width:.5mm;">
     		Form <span class="styFormNumber">1120X</span>
              <!--General Dependency Push Pin
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120XData"/>
              </xsl:call-template> -->
              <br/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120XData"/>
              </xsl:call-template>
              <span style="width:3px;"/>
              <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="Desc">Form 1120X, Top Left Margin - Section 199 Closing Books Election Indicator</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1120XData/@sect199ClosingBooksElectInd"/>
              </xsl:call-template>
              <span style="width:3px;"/>
              <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="Desc">Form 1120X, Top Left Margin - Section 30191002 Election Indicator</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1120XData/@section30191002ElectionInd"/>
              </xsl:call-template>
              <div style="font-size:7pt;line-height:175%">(Rev. January 2011)
				<span class="styAgency" style="line-height:.75">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:110mm;height:19.5mm;">
              <br/>
              <div class="styMainTitle" style="height:8mm;">Amended U.S. Corporation <br/> Income Tax Return								</div>
            </div>
            <div class="styTYBox" style="width:45mm;height:22.5mm;border-left-width:.5mm;">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-0132</div>
              <table style="width:45mm;cellspacing:0; cell-padding:0;border:1;text-align:bottom;font-size:7pt">
                <tbody>
                  <!-- Row 1 of a 3 row by 2 column table -->
                  <tr style="padding-top:2mm;">
                    <!-- this cell blank and used as a placeholder for row 1 column1 -->
                    <th style="width:4mm"/>
                    <th style="width:40mm;text-align:left">For tax year ending</th>
                  </tr>
                  <!-- Row 2 -->
                  <tr style="height:5mm;">
                    <!-- column 1 -->
                    <th style="padding-bottom:2mm">
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
                    </th>
                    <!-- column 2 -->
                    <td>
                      <div style="font-size:7pt;font-weight:bold;text-align:center;border-top-width:0mm;border-bottom-width:1px;border-style:dashed;border-color:black">
                        <xsl:call-template name="PopulateMonthYearForYearMonthType">
                          <xsl:with-param name="TargetNode" select="$Form1120XData/TaxYearEnding"/>
                        </xsl:call-template>
                      </div>
                    </td>
                  </tr>
                  <!-- Row 3 -->
                  <tr>
                    <!-- this cell blank and used as a placeholder -->
                    <th style="width:4mm"/>
                    <th style="text-align:left;vertical-align:bottom"> (Enter month and year.)</th>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div style="width:187mm;float:left;clear:left;font-size:7pt;">
            <!-- modified address box from common IRS return label -->
            <div class="styLblNameAddr" style="width:145mm;height:27.5mm;border-top-width=0px;border-left-width=0px;border-bottom-width=1px;border-right-width=0px">
              <div class="styUseLbl" style="width:12mm;height:24mm;border-right-width:0px;padding-top:7mm;text-align:center;">Please Type or Print</div>
              <div class="styNameAddr" style="width:133mm;height:8.5mm;border-left-width:1px;">
				Name <br/>
                <span class="stySmallText" style="padding-left:2mm;">
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                  </xsl:call-template>
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                  </xsl:call-template>
                  <br/>
                </span>
              </div>
              <div class="styNameAddr" style="width:133mm;height:8.5mm;border-left-width:1px;">
				Number, street, and room or suite no. (If a P.O. box, see instructions.)<br/>
                <span class="stySmallText" style="padding-left:2mm;">
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                  </xsl:call-template>
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                  </xsl:call-template>
                </span>
              </div>
              <div class="styNameAddr" style="border-bottom-width:0px;width:133mm;height:10.5mm;border-left-width:1px;">
				City or town, state, and ZIP code<br/>
                <span class="stySmallText" style="padding-left:2mm;">
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
                  </xsl:call-template>
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">Country</xsl:with-param>
                    <xsl:with-param name="MainForm">true</xsl:with-param>
                  </xsl:call-template>
                </span>
              </div>
            </div>
            <!-- styLblNameAddr is being used here because it works for these  3 lines with minimal modification - it readily lines up with the previous section -->
            <div class="styLblNameAddr" style="width42:mm;height:27.5mm;border-top-width=0px;border-left-width=0px;border-bottom-width=1px;border-right-width=0px">
              <div class="styNameAddr" style="width:42mm;height:8.5mm;border-bottom-width:1px;border-left-width:1px;font-weight:bold">
				Employer identification number<br/>
                <br/>
                <div style="text-align:left">
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styNameAddr" style="width:42mm;height:8.5mm;border-bottom-width:1px;border-left-width:0px"/>
              <br/>
              <span class="stySmallText" style="font-size:6pt"/>
              <div class="styNameAddr" style="width:42mm;height:10.5mm;border-bottom-width:0px;font-size:6pt;border-left-width:1px">
				Telephone number (optional)<br/>
                <br/>
                <br/>
                <div style="font-size:6pt;text-align:left">
                  <xsl:if test="$Form1120XData/TelephoneNumber">
                    <xsl:call-template name="PopulatePhoneNumber">
                      <xsl:with-param name="TargetNode" select="$Form1120XData/TelephoneNumber "/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$Form1120XData/ForeignTelephoneNumber">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120XData/ForeignTelephoneNumber"/>
                    </xsl:call-template>
                  </xsl:if>
                </div>
              </div>
              <br/>
            </div>
          </div>
          <!-- Choice - Address of original return or use SAME if same as in Return Header -->
          <div class="styBB" style="width:187mm;border-top-width:.5px;border-bottom-width:0px;height:13mm;">
            <div class="styText" style="text-align:left;">Enter name and address used on original return (If same as above, write 							"Same.")
		    <div style="padding-left:2mm;text-align:left">
                <xsl:if test="$Form1120XData/NameAndAddress">
                  <xsl:choose>
                    <xsl:when test="$Form1120XData/NameAndAddress/PersonName">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form1120XData/NameAndAddress/PersonName"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form1120XData/NameAndAddress/BusinessName/BusinessNameLine1"/>
                      </xsl:call-template>
                      <br/>
                      <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/NameAndAddress/BusinessName/BusinessNameLine2"/>
                  </xsl:call-template>
                    </xsl:otherwise>
                  </xsl:choose>
                  <br/>
                  <xsl:choose>
                    <xsl:when test="$Form1120XData/NameAndAddress/AddressInUS">
                      <xsl:call-template name="PopulateUSAddressTemplate">
                        <xsl:with-param name="TargetNode" select="$Form1120XData/NameAndAddress/AddressInUS"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:call-template name="PopulateForeignAddressTemplate">
                        <xsl:with-param name="TargetNode" select="$Form1120XData/NameAndAddress/AddressInForeign"/>
                      </xsl:call-template>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
                <xsl:if test="$Form1120XData/SameAsAbove">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/SameAsAbove"/>
                  </xsl:call-template>
                </xsl:if>
              </div>
            </div>
          </div>
          <div class="styBB" style="width:187mm;border-top-width:1px;border-bottom-width:2px">
            <div class="styLNDesc" style="width:48mm;height:4mm;text-align:left;">Internal Revenue Service Center where original return was filed</div>
            <div class="styIRS1120VTImageBox" style="height:8mm;padding-top:1mm;border-right:0mm;">
              <img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
            </div>
            <div class="styText" style="padding-top:2mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120XData/ServiceCenterOrigReturnFiled"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Start Part I -->
          <div class="styBB" style="width:187mm;border-bottom-width:0px;line-height:9mm;
				text-align:center;font-size:9pt;font-weight:bold">Fill in applicable items and use Part II on the back to explain any changes					</div>
          <!--BEGIN Main Form Table:  Income Section-->
          <table class="styTable" style=" width:187mm;empty-cells:show;border-collapse:collapse;
					border-style:solid;border-color:black;border-top-width:2px;border-left-width:0;border-right-width:0;
					border-bottom-width:0;cell-padding:0;cell-spacing:0;font-size:7pt;">
            <tr style="height:8mm">
              <th class="styTblCell" colspan="3" scope="col" style="width:89mm;border-right-width:0;border-left-width:0">
                <div class="styPartName" style="font-size:9pt">Part I</div>
                <span style="font-size:9pt"> Income and Deductions <span style="font-weight:normal">
							(see instructions)</span>
                </span>
              </th>
              <th class="styTblAmountCell " scope="col" style="width:31mm;font-size:6pt;font-weight:bold;text-align:center;border-left-width:1">(a) <span style="font-weight:normal">As originally<br/>reported or as <br/>previously adjusted</span>
              </th>
              <th class="styTblAmountCell " scope="col" style="width:31mm;font-size:6pt;font-weight:bold;text-align:center">(b) <span style="font-weight:normal">Net change—<br/>increase or (decrease)—<br/>explain in Part II </span>
              </th>
              <th class="styTblAmountCell " scope="col" style="width:31mm;font-size:6pt;font-weight:bold;text-align:center;border-right-width:0">(c) <span style="font-weight:normal">Correct amount</span>
              </th>
            </tr>
            <tbody>
              <!-- Line 1  columns a through c -->
              <tr style="height:8mm;vertical-align:bottom;">
                <td class="styTblCellNumber" style="border-top-width:1px;border-bottom-width:0;border-right-width:0;vertical-align:bottom;text-align:left;padding-left:1.5mm">1</td>
                <td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:0px;border-top-width:1px">
					<span style="float:left;">Total income </span>
					<span class="styDotLn" style="padding-right:1mm;float:right;">...............</span>
                </td>
                <td class="styTblCellNumber">1</td>
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/TotalIncomeOriginallyReported"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell ">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/TotalIncomeNetChange"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell " style="border-right-width:0">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/TotalIncomeCorrectAmount"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 2  -->
              <tr style="height:8mm;vertical-align:bottom">
                <!-- Use space here;  to maintain character alignment use &#160 to place a space below "2" the and still use vertical-align: bottom -->
                <td class="styTblCellNumber" style="border-bottom-width:0;border-right-width:0;vertical-align:bottom;text-align:left;padding-left:1.5mm;padding-top:6mm;">2</td>
                <td class="styTableCellText" style="width:79mm; border-bottom-width:0px;"> 
					<span style="float:left;">Total deductions </span>
					<span class="styDotLn" style="font-weight:bold;padding-right:1mm;float:right;">..............</span>
                </td>
                <td class="styTblCellNumber" style="border-bottom-width:2px;">2</td>
                <td class="styTblAmountCell" style="border-bottom-width:2px">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/TotalDedOriginallyReported"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell" style="border-bottom-width:2px">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/TotalDeductionsNetChange"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell" style="border-bottom-width:2px;border-right-width:0">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/TotalDeductionsCorrectAmount"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 3  -->
              <tr style="height:8mm;vertical-align:bottom">
                <td class="styTblCellNumber" style="border-bottom-width:0;border-right-width:0;vertical-align:bottom;text-align:left;padding-left:1.5mm">3</td>
                <td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:0px;">
					<span style="float:left;">Taxable income. Subtract line 2 from line 1 </span> 
					<span class="styDotLn" style="padding-right:1mm;float:right;">.....</span>
                </td>
                <td class="styTblCellNumber">3</td>
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/TaxableIncomeOriginallyRpt"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/TaxableIncomeNetChange"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell" style="border-right-width:0">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/TaxableIncomeCorrectAmount"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 4  -->
              <tr style="height:8mm;vertical-align:bottom">
                <td class="styTblCellNumber" style="border-bottom-width:1;border-right-width:0;vertical-align:bottom;text-align:left;padding-left:1.5mm">4</td>
                <td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:1px;">
					<span style="float:left">Total tax </span> 
					<span class="styDotLn" style="padding-right:1mm;float:right;">................</span>
                </td>
                <td class="styTblCellNumber">4</td>
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/TaxOriginallyReported"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/TaxNetChange"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell" style="border-right-width:0">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/TaxCorrectAmount"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Payment and Credit Section
					<div class="styBoldText" style="font-size:8pt;">Payments and Credits<span style="font-weight:normal"> (see instructions)</span>
					</div> -->
              <!-- Payment and Credit table -->
              <tr>
                <td class="styBoldText" colspan="6" style="width:187mm;height:8mm;vertical-align:center;font-size:8pt;">Payments and Credits<span style="font-weight:normal"> (see instructions)</span>
                </td>
              </tr>
              <!-- Line 5a  -->
              <tr style="vertical-align:bottom">
                <td class="styTblCellNumber" scope="col" style="border-top-width:1px;border-bottom-width:0;border-right-width:0;text-align:left;padding-left:1.5mm;">5a</td>
                <td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:0px;border-top-width:1px;">
					<span style="float:left;">Overpayment in prior year allowed as a credit </span> 
					<span class="styDotLn" style="padding-right:1mm;float:right;">.....</span>
                </td>
                <td class="styTblCellNumber" style="border-top-width:1px;">5a</td>
                <td class="styTblAmountCell" style="border-top-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/PriorYearOvpmtCrOriginallyRpt"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell" style="border-top-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/PriorYearOvpmtCrNetChange"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell" style="border-right-width:0;border-top-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/PriorYearOvpmtCrCorrectAmount"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 5b  -->
              <tr style="vertical-align:bottom">
                <td class="styTblCellNumber" style="border-bottom-width:0;border-right-width:0;letter-spacing:.5em">&#160;b</td>
                <td class="styTableCellText" scope="col" style="width:79mm; border-bottom-width:0px;">
					<span style="float:left;">Estimated tax payments </span> 
					<span class="styDotLn" style="padding-right:1mm;float:right;">...........</span>
                </td>
                <td class="styTblCellNumber">5b</td>
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/EstTaxPaymentsOriginallyRpt"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/EstimatedTaxPaymentsNetChange"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell" style="border-right-width:0">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/EstTaxPaymentsCorrectAmount"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 5c  -->
              <tr style="vertical-align:bottom">
                <td class="styTblCellNumber" style="border-bottom-width:0;border-right-width:0;letter-spacing:.5em">&#160;c</td>
                <td class="styTableCellText" style="width:79mm;border-bottom-width:0px;">
					<span style="float:left;">Refund applied for on Form 4466 </span> 
					<span class="styDotLn" style="padding-right:1mm;float:right;">........</span>
                </td>
                <td class="styTblCellNumber">5c</td>
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/RefundForm4466OriginallyRpt"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/RefundForm4466NetChange"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell" style="border-right-width:0">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/RefundForm4466CorrectAmount"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!--  Line 5d  -->
              <tr style="vertical-align:bottom">
                <td class="styTblCellNumber" style="border-bottom-width:0;border-right-width:0;letter-spacing:.5em">&#160;d</td>
                <td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:0px;">
					<span style="float:left;">Subtract line 5c from the sum of lines 5a and 5b </span> 
					<span class="styDotLn" style="padding-right:1mm;float:right;">...</span>
                </td>
                <td class="styTblCellNumber">5d</td>
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/DifferenceOriginallyReported"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/DifferenceNetChange"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell" style="border-right-width:0">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/DifferenceCorrectAmount"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 5e  -->
              <tr style="vertical-align:bottom">
                <td class="styTblCellNumber" style="border-bottom-width:0;border-right-width:0;letter-spacing:.5em">&#160;e</td>
                <td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:0px;">
					<span style="float:left;">Tax deposited with Form 7004 </span> 
					<span class="styDotLn" style="padding-right:1mm;float:right;">.........</span>
                </td>
                <td class="styTblCellNumber">5e</td>
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/TaxDepForm7004OriginallyRpt"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/TaxDepositedForm7004NetChange"/>
                  </xsl:call-template>
                </td>
                <td class="styTblAmountCell" style="border-right-width:0">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/TaxDepForm7004CorrectAmount"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 5f  -->
              <tr style="vertical-align:bottom">
                <td class="styTblCellNumber" style="border-bottom-width:0;border-right-width:0;letter-spacing:.5em">&#160;f</td>
                <td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:0px;">
					<span style="float:left;">Credit from Form 2439 </span> 
					<span class="styDotLn" style="padding-right:1mm;float:right;">...........</span>
                </td>
                <td class="styTblCellNumber">5f</td>
                <!-- column a -->
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/Form2439CreditOriginallyRpt"/>
                  </xsl:call-template>
                </td>
                <!-- column b -->
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/Form2439CreditNetChange"/>
                  </xsl:call-template>
                </td>
                <!-- column c -->
                <td class="styTblAmountCell" style="border-right-width:0">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/Form2439CreditCorrectAmount"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 5g -->
              <tr style="vertical-align:bottom">
                <td class="styTblCellNumber" style="border-bottom-width:0;border-right-width:0;letter-spacing:.5em">&#160;g</td>
                <td class="styTableCellText" scope="col" style="width:79mm;border-bottom-width:0px;">
					<span style="float:left;">Credit for federal tax on fuels and other refundable credits </span> 
					<span class="styDotLn" style="padding-right:1mm;float:right;">.</span>
                </td>
                <td class="styTblCellNumber">5g</td>
                <!-- column a -->
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/CrFederalTaxFuelsOriginallyRpt"/>
                  </xsl:call-template>
                </td>
                <!-- column b -->
                <td class="styTblAmountCell">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/CreditFederalTaxFuelsNetChange"/>
                  </xsl:call-template>
                </td>
                <!-- column c -->
                <td class="styTblAmountCell" style="border-right-width:0">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/CrFederalTaxFuelsCorrectAmount"/>
                  </xsl:call-template>
                </td>
              </tr>
            </tbody>
          </table>
          <table class="styTable" style=" width:187mm;empty-cells:show;border-collapse:collapse;border-style:solid;border-color:black;border-top-width:0px; border-left-width:0;border-right-width:0;border-bottom-width:1px;
					;cell-padding:0;cell-spacing:0;font-size:7pt">
            <!-- Line 6  -->
            <tr style="height:8mm;vertical-align:bottom">
              <td class="styTblCellNumber" style="border-bottom-width:0;border-right-width:0;vertical-align:bottom;text-align:left;padding-left:1.5mm">6</td>
              <td class="styTableCellText" scope="col" style="width:143mm;border-bottom-width:0px;">
				  <span style="float:left;">Tax deposited or paid with (or after) the filing of the original return </span> 
				  <span class="styDotLn" style="padding-right:1mm;float:right;">.............</span>
              </td>
              <td class="styTblCellNumber" style="border-bottom-width:2px">6</td>
              <td class="styTblAmountCell" style="width:31.33mm;border-bottom-width:2px;border-right-width:0">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120XData/TaxDepositedWithOriginalReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Line 7  -->
            <tr style="height:8mm;vertical-align:bottom">
              <td class="styTblCellNumber" style="border-bottom-width:0;border-right-width:0;text-align:left;padding-left:1.5mm">7</td>
              <td class="styTableCellText" scope="col" style="width:147mm; border-bottom-width:0px;">
				  <span style="float:left;">Add lines 5d through 6, column (c) </span> 
				  <span class="styDotLn" style="padding-right:1mm;float:right;">........................</span>
              </td>
              <td class="styTblCellNumber">7</td>
              <td class="styTblAmountCell" style="border-right-width:0">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120XData/SubtotalPaymentsAndCredits"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Line 8  -->
            <tr style=";vertical-align:bottom">
              <td class="styTblCellNumber" style="border-bottom-width:0;border-right-width:0;text-align:left;padding-left:1.5mm">8</td>
              <td class="styTableCellText" scope="col" style="width:147mm;border-bottom-width:0px;">
				  <span style="float:left;">Overpayment, if any, as shown on original return or as later adjusted </span> 
				  <span class="styDotLn" style="padding-right:1mm;float:right;">.............</span>
              </td>
              <td class="styTblCellNumber" style="border-bottom-width:2px">8</td>
              <td class="styTblAmountCell" style="border-bottom-width:2px;border-right-width:0">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120XData/OverpaymentOnOriginalReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Line 9  -->
            <tr style="height:8mm;vertical-align:bottom">
              <td class="styTblCellNumber" style="border-bottom-width:0;border-right-width:0;text-align:left;padding-left:1.5mm">9</td>
              <td class="styTableCellText" style="width:147mm;border-bottom-width:0px;">
				  <span style="float:left;">Subtract line 8 from line 7 </span> 
				  <span class="styDotLn" style="padding-right:1mm;float:right;">...........................</span>
              </td>
              <td class="styTblCellNumber">9</td>
              <td class="styTblAmountCell" style="border-right-width:0">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120XData/TotalPaymentsAndCredits"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <br/>
          <div class="styBoldText" style="font-size:8pt;">Tax Due or Overpayment<span style="font-weight:normal"> (see instructions)</span>
          </div>
          <br/>
          <table class="styTable" style=" width:187mm;empty-cells:show;border-collapse:collapse;border-style:solid;border-color:black;border-top-width:1px; border-left-width:0;
					border-right-width:0;border-bottom-width:1px;cell-padding:0;cell-spacing:0;font-size:7pt">
            <!-- Line 10  -->
            <tr style="height:8mm;vertical-align:bottom">
              <td class="styTblCellNumber" style="width:6mm;border-bottom-width:0;border-right-width:0;text-align:left">10 &#160; &#160;</td>
              <td class="styTableCellText" scope="col" style="width:141mm;border-bottom-width:0px;border-right-width:0px">
                <span class="styBoldText">Tax due.  </span>Subtract line 9 from line 4, column (c). If paying by check, make it payable to the <span class="styBoldText">“United
				<span style="float:left;">States Treasury” </span></span>
                <!--Dotted Line-->
                <span class="styDotLn" style="padding-right:1mm;float:right;">............................</span>
              </td>
              <td class="styTblCell" style="width:5mm;border-bottom=0px;">
                <img src="{$ImagePath}/1120X_Bullet_Sm.gif" alt="SmallBullet"/>
              </td>
              <td class="styTblCellNumber">10</td>
              <td class="styTblAmountCell" style="width:32mm;border-right-width:0">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120XData/TaxDue"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Line 11  -->
            <tr style="height:8mm;vertical-align:bottom">
              <td class="styTblCellNumber" style="width:6mm;border-bottom-width:0;border-right-width:0;text-align:left">11</td>
              <td class="styTableCellText" scope="col" style="width:141mm; border-bottom-width:0px;border-right-width:0px;">
                <span style="float:left;"><span class="styBoldText">Overpayment.  </span>Subtract line 4, column (c), from line 9 </span>
				<span class="styDotLn" style="padding-right:1mm;float:right;">.................</span>
              </td>
              <td class="styTblCell" style="width:5mm;border-bottom=0">
                <img src="{$ImagePath}/1120X_Bullet_Sm.gif" alt="SmallBullet"/>
              </td>
              <td class="styTblCellNumber">11</td>
              <td class="styTblAmountCell" style="width:32mm;border-right-width:0">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120XData/Overpayment"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Line 12  -->
            <tr style="vertical-align:bottom;height:5mm">
              <td class="styTblCellNumber" style="width:6mm;border-bottom-width:0;border-right-width:0;text-align:left">12</td>
              <td class="styTableCellText" scope="col" style="width:141mm;border-bottom-width;border-right-width:0px;">
					          Enter the amount of line 11 you want:	
								<span class="styBoldText">Credited to
								<xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/CreditElectYear"/>
                  </xsl:call-template>
							estimated tax</span>
                <span style="width:1px"/>
                <img src="{$ImagePath}/1120X_Bullet_Sm.gif" alt="SmallBullet"/>
                <span style="width:25mm;font-size:6.5pt;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120XData/CreditElectAmount"/>
                  </xsl:call-template>
                </span>
                <span style="width:1mm;"/>
                <span class="styBoldText" style="font-size:7pt">Refunded</span>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120XData/Refund"/>
                </xsl:call-template>
              </td>
              <td class="styTblCell" style="width:5mm;border-bottom=0">
                <img src="{$ImagePath}/1120X_Bullet_Sm.gif" alt="SmallBullet"/>
              </td>
              <td class="styTblCellNumber">12</td>
              <td class="styTblAmountCell" style="width:32mm;border-right-width:0">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120XData/RefundAmount"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <!--END Main Form Tax and Payment Section-->
          <!-- BEGIN Signature Section -->
          <!-- Implementing the signature section as a table -->
          <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;">
            <tr>
              <td rowspan="3" style="width:10mm;font-size: 11pt;font-weight:bold;border-right:1 solid black;border-bottom:1 solid black;">Sign Here</td>
              <td colspan="6" style="padding-left:1mm;padding-bottom:1mm;">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge. </td>
            </tr>
            <tr>
              <td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;">
                <img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
              </td>
              <td style="width:52mm;border-right:1 solid black;border-bottom:1 solid black;vertical-align:bottom;">
                <xsl:call-template name="PopulateReturnHeaderOfficer">
                  <xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
                </xsl:call-template>
                <span style="width:1px;"/>
              </td>
              <td style="width:20mm;border-bottom:1 solid black;vertical-align:bottom;padding-left:.5mm;">
                <xsl:call-template name="PopulateReturnHeaderOfficer">
                  <xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
                </xsl:call-template>
              </td>
              <td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;">
                <img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
              </td>
              <td style="width:60mm;border-bottom:1 solid black;vertical-align:bottom;">
                <xsl:call-template name="PopulateReturnHeaderOfficer">
                  <xsl:with-param name="TargetNode">Title</xsl:with-param>
                </xsl:call-template>
              </td>
              <td rowspan="2" style="width:40mm;border-bottom:1 solid black;padding-bottom:1mm;">
                <div class="styGenericDiv" style="width:2px;"/>
                <div style="border-right:3 solid black;border-left:3 solid black;border-bottom:3 solid black;border-top:3 solid black;float:right;" class="styGenericDiv">    
    May the IRS discuss this return<br/> with the preparer shown below <br/>(see instructions)?
      <input class="styCkbox" type="checkbox" name="Checkbox" id="dummyidyes" style="width:3mm;">
                    <xsl:call-template name="PopulateReturnHeaderOfficer">
                      <xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
                      <xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <span class="styBoldText">
                    <label for="dummyidyes">
                      <xsl:call-template name="PopulateReturnHeaderOfficer">
                        <xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
                        <xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
                      </xsl:call-template>
          Yes
        </label>
                  </span>
                  <input class="styCkbox" type="checkbox" name="Checkbox" id="dummyidno" style="width:2.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderOfficer">
                      <xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
                      <xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <span class="styBoldText">
                    <label for="dummyidno">
                      <xsl:call-template name="PopulateReturnHeaderOfficer">
                        <xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
                        <xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
                      </xsl:call-template>
          No
        </label>
                  </span>
                </div>
              </td>
            </tr>
            <tr>
              <td style="border-bottom:1 solid black;vertical-align:top;">Signature of officer </td>
              <td style="border-bottom:1 solid black;vertical-align:top;">Date </td>
              <td style="border-bottom:1 solid black;vertical-align:top;">Title </td>
            </tr>
          </table>
          <!-- END Signature Section -->
           <!-- BEGIN PREPARER SIGNATURE SECTION -->
          			<!-- paid preparer -->
					<div class="styBB" style="width:187mm;font-size:6pt;">
						<div style="width:22.75mm;padding-top:4mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:11pt;">
									Paid
									Preparer
									Use Only
									</span>
						</div>
						<div style="width:164mm;float:left;clear:none;">
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;border-leftright:1px;">
								<div class="styLNDesc" style="height:6mm;width:46.8mm;padding-top:0mm;border-right:1 solid black;border-left:1 solid black;padding-left:1mm;">
								  Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/Name"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerName</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:6mm;width:46.5mm;padding-top:0mm;border-right:1 solid black;padding-left:1mm;">
								Preparer's signature
							</div>
								<div class="styLNDesc" style="height:6mm;width:15mm;border-right:1 solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerDatePrepared</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:6mm;width:18mm;border-right:1 solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/SelfEmployed"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
										Check 
										<input class="styCkbox" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/SelfEmployed"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>if<br/>self-employed
									</label>
								</div>
								<div class="styLNDesc" style="height:6mm;width:26mm;padding-top:0mm;padding-left:1mm;">PTIN
                  <br/>
                  <span style="width:6mm;"/>
									<xsl:if test="$RtnHdrData/Preparer/SSN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SSN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Preparer/PTIN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<!--<xsl:if test="$RtnHdrData/Preparer/STIN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerSTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>-->
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:126.5mm;border-right:1 solid black;border-left:1 solid black;padding-left:1mm;">
									<span class="styGenericDiv" style="">Firm's name 
									<span style="width:2.2mm;"/>
										<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmPreparerFirmBusinessNameBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmPreparerFirmBusinessNameBusinessName2</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/> 
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/PreparerFirm/EIN">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmEIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PreparerFirm/MissingEINReason">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmMissingEINReason</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;">
								<div class="styLNDesc" style="width:126.5mm;border-right:1 solid black;border-left:1 solid black;padding-left:1mm;">
									<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmAddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PreparerFirm/PreparerFirmUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmUSAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">State</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmUSAddressState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PreparerFirm/PreparerFirmForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmForeignProvinceOrState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmForeignPostalCode</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmForeignCountry</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:32mm;padding-left:1mm;"> Phone no. 
 								<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPhone</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerForeignPhone</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
		  <!-- Implementing the Preparer section in table -->
				
          <!-- END PREPARER SIGNATURE SECTION -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;">
              <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
              <span style="width:13mm;"/>                        
				Cat. No. 11530Z
			</div>
            <div style="float:right;">
              <span style="width:40px;"/>  
				Form <span class="styBoldText" style="font-size:8pt;">1120X</span> (Rev. 1-2011)
			</div>
          </div>
          <!-- END Page Break and Footer-->
          <!--Begin Page 2 -->
          <!-- Page Header -->
          <div style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Form 1120X (Rev. 1-2011)<span style="width:130mm;"/>
            </div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
              <br/>
            </div>
          </div>
          <!-- END Page Header -->
          <div class="styBB" style="width:187mm;border-top-width: 2px; border-bottom-width: 0px;">
            <div class="styPartName" style="width:15mm;">Part II</div>
            <div class="styPartDesc" style="width:170mm">
				Explanation of Changes to Items in Part I <span style="font-weight:normal;">(Enter the line number from page 1 for the items you are
				changing, and give the reason for each change. Show any computation in detail. Also, see<span style="font-weight: bold">&#160;What To Attach</span>
				in the instructions.)<br/>
                <br/>
              </span>
            </div>
            <span class="styNormalText" style="font-size: 8pt; padding-left:0;">
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120XData/CarrybackClaims"/>
                </xsl:call-template>   
					If the change is due to a net operating loss carryback, a capital loss carryback, or a general business credit carryback, see <span style="font-weight: bold">Carryback Claims</span> in the instructions, and check here &#160;
 					</label>
              <span style="letter-spacing:3.3mm; font-weight:bold">......................</span>
              <img src="{$ImagePath}/1120X_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/> &#160;
                <span style="width:2mm;"/>  
				          <input type="Checkbox" alt="alt" name="Checkbox" class="styCkbox" >
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form1120XData/CarrybackClaims"/>
                      <xsl:with-param name="BackupName">IRS1120XICarrybackClaims</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120XData/CarrybackClaims" />
											<xsl:with-param name="BackupName">IRS1120XICarrybackClaims</xsl:with-param>
										</xsl:call-template>
									 </label>
              </span>
            <!-- Explanation of Changes section -->
            <xsl:if test="count($Form1120XData/ExplanationOfChanges) &gt; 1">
              <div style="width:3mm;float:right">
                <!-- button display logic -->
                <xsl:call-template name="SetDynamicTableToggleButton">
                  <xsl:with-param name="TargetNode" select="$Form1120XData/ExplanationOfChanges"/>
                  <xsl:with-param name="containerHeight" select="1"/>
                  <xsl:with-param name="headerHeight" select="0"/>
                  <xsl:with-param name="containerID" select=" 'EOCctn' "/>
                </xsl:call-template>
                <!-- end button display logic -->
              </div>
            </xsl:if>
            <div class="styTableContainer" id="EOCctn">
              <xsl:call-template name="SetInitialState"/>
              <table cellpadding="0" cellspacing="0" style="font-size:7pt">
                <tbody>
                  <xsl:if test="$Form1120XData/ExplanationOfChanges">
                    <xsl:for-each select="$Form1120XData/ExplanationOfChanges">
                      <tr style="height:8mm">
                        <td class="styTableCell" style="text-align:left;width:8mm;border-right-width:0;vertical-align:top">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="ExplanationOfChangesLineNumber"/>
                          </xsl:call-template>
                        </td>
                        <td class="styTableCell" style="text-align:left;width:179mm;border-right-width:0;vertical-align:top">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="ExplanationChangesItemsPartI"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </xsl:if>
                </tbody>
              </table>
            </div>
            <!-- Set Initial Height of Above Table -->
            <xsl:call-template name="SetInitialDynamicTableHeight">
              <xsl:with-param name="TargetNode" select="$Form1120XData/ExplanationOfChanges"/>
              <xsl:with-param name="containerHeight" select="1"/>
              <xsl:with-param name="headerHeight" select="0"/>
              <xsl:with-param name="containerID" select=" 'EOCctn' "/>
            </xsl:call-template>
            <!-- End Set Initial Height of Above Table -->
          </div>
          <div class="pageEnd" style="width:187mm;padding-top:1mm;border-top:1 solid black;border-top-width1px;">
            <div style="width:100mm;float:left;">
              <span style="width:90mm;"/>
            </div>
            <div style="float:right;">
              <span style="width:80px;"/>  
    									  Form <span class="styBoldText" style="font-size:8pt;">1120X </span>(Rev. 1-2011)   
   					 </div>
          </div>
          <!-- Additional Data Section -->
          <div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
            <div class="styLeftOverTitle" style="padding-bottom:0.5mm; padding-top:0.5mm">
       				   Additional Data        
       				 </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage							()" tabindex="1"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form1120XData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Form 1120X, Top Left Margin - Section 199 closing Books Election Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1120XData/@sect199ClosingBooksElectInd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Form 1120X, Top Left Margin - Section 30191002 Election Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1120XData/@section30191002ElectionInd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
