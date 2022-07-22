<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120FScheduleIStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!--  Defines the stage of the data, e.g. original or latest  -->
  <xsl:param name="FormData" select="$RtnDoc/IRS1120FScheduleI"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormData)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching  -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="Form IRS1120FScheduleI"/>
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <!-- PRINT STATMENT -->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120FScheduleIStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass" style="width:187mm;">
        <form name="Form1120FScheduleI">
          <!-- BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- END WARNING LINE -->
          <!--Begin Header-->
          <div class="styTBB" style="width:187mm;">
            <table cellspacing="0" cellpadding="0">
              <tbody>
                <tr>
                  <!--Form Number-->
                  <th rowspan="2" class="sty1120FSchIFNBox" style="width:36mm;border-right-width: 2px;" scope="col">
                  SCHEDULE I
                  <br/>
                  (Form 1120-F)<br/>
                    <!--General Dependency Push Pin-->
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData"/>
                    </xsl:call-template>
                    <br/>
                    <div class="sty1120FSchIAgency" style="padding-top:1.5mm">Department of the Treasury</div>
                    <div class="sty1120FSchIAgency">Internal Revenue Service</div>
                  </th>
                  <!--Form Name-->
                 <th rowspan="2" class="sty1120FSchIFTBox" style="width:119mm;" scope="col">
                    <div class="sty1120FSchIMainTitle">
                    Interest Expense Allocation Under Regulations<br/>Section 1.8825
                  </div>
                    <div class="styFST" style="padding-top:0.5mm">
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                    Attach to Form 1120-F.
                    <br/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                    Information about Schedule I (Form 1120-F) and its separate instructions is available at
                      <a href="http://www.irs.gov/form1120F" title="Link to IRS.gov"><i>www.IRS.gov/form1120F</i></a>.
                  </div>
                  </th>
                  <!--OMB/Tax Year-->
                  <th  rowspan="2" style="width:32mm;" scope="col">
										<div class="styTYBox" style="width:31mm;height:19.5mm;border-left-width: 2px;">
											<div style="height:2mm;"/>
											<div class="styOMB">OMB No. 1545-0123</div>
											<div class="styTY" style="height:8mm;padding-top:1mm;">20<span class="styTYColor">14</span></div>
										</div>
                </th>
              </tr>
              </tbody>
            </table>
          </div>
          <!--End header-->
          <!--Begin Name/EIN-->
          <div style="width:187mm">
            <div class="styTableCell" style="width:135mm;float:left;height:10mm;text-align:left">
            Name of corporation
            <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styTableCell" style="width:52mm;border-right-width:0px;padding-left:2mm;float:left;height:10mm;text-align:left">
              <b>Employer identification number</b>
              <br/>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">EIN</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
          <!--End Name/EIN-->
          <!--Lines A and B-->
          <div class="styTBB" style="width:187mm;border-bottom-width: 1px;">
            <!--Line A-->
            <div class="sty1120FSchILineABNum">A</div>
            <div class="sty1120FSchILineABDesc">
              Check here if the corporation is a foreign bank as defined in Regulations section 1.8825(c)(4)
			  <div class="sty1120FSchIRightFloat">
                <span class="sty1120FSchIDotLn" style="padding-right:0.2mm">...........</span>
                <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                <span style="width:2.7mm"/>
                <input type="checkbox" alt="alt" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/ForeignBankDefSect18825c4Ind"/>
                    <xsl:with-param name="BackupName">IRS1120FSchIForeignBankYes</xsl:with-param>
                  </xsl:call-template>
                </input>
              </div>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignBankDefSect18825c4Ind"/>
                  <xsl:with-param name="BackupName">IRS1120FSchIForeignBankYes</xsl:with-param>
                </xsl:call-template>
            </label>
            </div>
            <!--Line B-->
            <div class="sty1120FSchILineABNum" style="float:left;clear:none">B</div>
            <div class="sty1120FSchILineABDesc" style="width:181mm;hight:float:left;clear:none;border-right-width:0">
            This Schedule I is being completed with respect to <i>(check one):</i>
            </div>
            <div class="sty1120FSchILineABNum" style="float:left;clear:none"/>
            <div class="sty1120FSchILineABDesc" style="width:181mm;float:left;clear:none;border-right-width:0">
              <input type="checkbox" alt="alt" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/AdjustedUSBookedLiabMthdInd"/>
                  <xsl:with-param name="BackupName">IRS1120FSchIAdjustedUSBooked</xsl:with-param>
                </xsl:call-template>
              </input>
              <span style="width:1mm"/>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/AdjustedUSBookedLiabMthdInd"/>
                  <xsl:with-param name="BackupName">IRS1120FSchIAdjustedUSBooked</xsl:with-param>
                </xsl:call-template>
              Adjusted U.S. booked liabilities method under Regs. sec. 1.8825(d). <b>Complete lines 1 through 15 and 21 through 25.</b>
              </label>
            </div>
            <div class="sty1120FSchILineABNum" style="float:left;clear:none"/>
            <div class="sty1120FSchILineABDesc" style="width:181mm;height:6mm;float:left;clear:none;border-right-width:0">
              <input type="checkbox" alt="alt" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/SeparateCurrencyPoolsMethodInd"/>
                  <xsl:with-param name="BackupName">IRS1120FSchISeparateCurrencyPools</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/SeparateCurrencyPoolsMethodInd"/>
                  <xsl:with-param name="BackupName">IRS1120FSchISeparateCurrencyPools</xsl:with-param>
                </xsl:call-template>
                <span style="width:1mm"/>
              Separate currency pools method under Regs. sec. 1.8825(e). <b>Complete lines 1 through 9 and 16a through 25.</b>
              </label>
            </div>
          </div>
          <!--Begin Step 1-->
          <!--Step 1 Header-->
          <div class="styBB" style="width:187mm">
            <div class="styPartName" style="height:auto;">Step 1</div>
            <div class="styPartDesc" style="height:auto;">
            Average U.S. Assets for the Tax Year: Regulations Section 1.8825(b)
          </div>
          </div>
          <!--Step 1 Table-->
          <div class="styTBB" style="width:187mm;border-bottom-width: 1px;">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--Line 1-->
                <tr>
                  <td class="styLNLeftNumBox">1</td>
                  <!--Note: the following cell has rowspan of 2 in order to capture the look of line 1's description which is split across the table header and 1st cell-->
                  <td rowspan="2" class="sty1120FSchIStep1Desc" style="height:21mm" scope="row">
                  Specify the method used to determine the value of the corporation’s U.S. assets on lines 2 through 5 below
                  <br/>
                    <i>(check one):</i>
                    <br/>
                    <input type="checkbox" alt="alt"  class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/AdjustedBasisMethodInd"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIAdjustedBasis</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/AdjustedBasisMethodInd"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIAdjustedBasis</xsl:with-param>
                      </xsl:call-template>
                  Adjusted basis method: Regs. sec. 1.8825(b)(2)(i)<br/>
                    </label>
                    <input type="checkbox" alt="alt"  class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/FairMarketValueMethodInd"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIFairMarketValue</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/FairMarketValueMethodInd"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIFairMarketValue</xsl:with-param>
                      </xsl:call-template>
                      Fair market value method: Regs. sec. 1.8825(b)(2)(ii)
                      <br/>
                    </label>
                  Total assets per books
					<div class="sty1120FSchIRightFloat">
						<span class="sty1120FSchIDotLn">..........</span>
					</div>
                  </td>
                  <td class="sty1120FSchIStep1Header" style="height:15mm">
                    <b>(a)</b>
                    <br/>Set(s) of Books that<br/>Give Rise to U.S.<br/>Booked Liabilities<br/>(see inst.)</td>
                  <td class="sty1120FSchIStep1Header" style="height:15mm;padding-bottom:4.5mm">
                    <b>(b)</b>
                    <br/>Partnership<br/>Interests</td>
                  <td class="sty1120FSchIStep1Header" style="height:15mm">
                    <b>(c)</b>
                    <br/>Set(s) of Books<br/>Other than those<br/>Described in<br/>Columns <b>(a)</b> and <b>(b)</b>
                  </td>
                  <td class="sty1120FSchIStep1HeaderLastCol" style="height:15mm;padding-bottom:1.8mm">
                    <b>(d)<br/>Totals.</b> Add<br/>columns <b>(a)</b>
                    <br/>through <b>(c)</b>
                  </td>
                </tr>
                <!--Line 2-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-top:3mm;">2</td>
                  <!--Description cell for Line 2 is part of Line 1 code-->
                  <td class="sty1120FSchIStep1Amount" style="height:6mm;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalAssetsPerBooksAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="height:6mm">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="height:6mm">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol" style="height:6mm">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 3a-->
                <tr>
                  <td class="styLNLeftNumBox">3a</td>
                  <td class="sty1120FSchIStep1Desc" scope="row">
                  Total interbranch assets
					<div class="sty1120FSchIRightFloat">
						<span class="sty1120FSchIDotLn">..........</span>
					</div>
                  </td>
                  <td class="sty1120FSchIStep1Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalInterbranchAssetsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 3b-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left: 2.5mm">b</td>
                  <td class="sty1120FSchIStep1Desc" scope="row" style="height:4.5mm;" >
                  Total non-ECI assets under section 864(c)(4)(D)
					<div class="sty1120FSchIRightFloat">
						<span class="sty1120FSchIDotLn">...</span>
					</div>
                  </td>
                  <td class="sty1120FSchIStep1Amount" style="height:4.5mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalNonECIAssetsSect864c4DAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="height:4.5mm;">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="height:4.5mm;">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol" style="height:4.5mm;">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 3c-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left: 2.5mm">c</td>
                  <td class="sty1120FSchIStep1Desc" scope="row">
                  Total other non-ECI assets(attach statement  see instructions)
                  <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalOtherNonECIAssetsAmt"/>
                   </xsl:call-template> 
					<div class="sty1120FSchIRightFloat">
						<span class="sty1120FSchIDotLn">.............</span>
					</div>
                  </td>
                  <td class="sty1120FSchIStep1Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalOtherNonECIAssetsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                      <span style="width:1px"/>
                   </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 3d-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left: 2.5mm">d</td>
                  <td class="sty1120FSchIStep1Desc" scope="row">
                  Adjustments for amounts from partnerships and certain disregarded entities included on line 2, column (a)
					<div class="sty1120FSchIRightFloat">
						<span class="sty1120FSchIDotLn">...</span>
					</div>
                  </td>
                  <td class="sty1120FSchIStep1Amount" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjPrtshpAndDisregardedEntAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 3e-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left: 2.5mm">e</td>
                  <td class="sty1120FSchIStep1Desc" scope="row">
                  Adjustments for assets that give rise to direct interest expense allocations under Regs. sec. 1.8825(a)(1)(ii)
                </td>
                  <td class="sty1120FSchIStep1Amount" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjustmentsDrtIntExpnsAllocAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 3f-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left: 2.5mm">f</td>
                  <td class="sty1120FSchIStep1Desc" scope="row">
                  Other adjustments to average assets included in line 2 (e.g., mark-to-market differences)
					<div class="sty1120FSchIRightFloat">
						<span class="sty1120FSchIDotLn">.......</span>
					</div>
                  </td>
                  <td class="sty1120FSchIStep1Amount" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsAverageAstAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 4-->
                <tr>
                  <td class="styLNLeftNumBox">4</td>
                  <td class="sty1120FSchIStep1Desc" scope="row">
                  Combine lines 3a through 3f
					<div class="sty1120FSchIRightFloat">
						<span class="sty1120FSchIDotLn">.........</span>
					</div>
                  </td>
                  <td class="sty1120FSchIStep1Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 5-->
                <tr>
                  <td class="styLNLeftNumBox">5</td>
                  <td class="sty1120FSchIStep1Desc" scope="row">
                  Total value of U.S. assets for the tax year
					<div class="sty1120FSchIRightFloat">
						<span class="sty1120FSchIDotLn">....</span>
					</div>
                  </td>
                  <td class="sty1120FSchIStep1Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjustedTotalAssetsPerBooksAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/PartnershipInterestsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/ValueOtherBooksAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalValueUSAssetsAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 5 instructions-->
                <tr>
                  <td class="sty1120FSchIGenericNum"/>
                  <td class="sty1120FSchIStep1Desc">
                    <b>Column (a):</b> Subtract line 4 from line 2.<br/>
                    <b>Column (b):</b> See instructions for amount to enter.<br/>
                    <b>Column (c):</b> See instructions for amount to enter.
                </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="border-bottom-width:0">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="border-bottom-width:0">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="border-bottom-width:0">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol" style="border-bottom-width:0">
                    <span style="width:1px"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--END Step 1-->
          <!--Begin Step 2-->
          <!--Step 2 Header-->
          <div class="styBB" style="width:187mm">
            <div class="styPartName" style="height:auto;">Step 2</div>
            <div class="styPartDesc" style="height:auto;">
							U.S.-Connected Liabilities for the Tax Year: Regulations Section 1.8825(c)
						</div>
          </div>
          <!--Step 2 Table-->
          <div class="styTBB" style="width:187mm;border-bottom-width: 1px;">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--Line 6-->
                <!--Line 6-1-->
                <tr>
                  <td class="styLNLeftNumBox">6</td>
                  <td class="sty1120FSchIStep2Desc" scope="row">
                     Specify the method used to determine the amounts in Step 2 (check one):
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.....</span>
                    </div>
                </td>
                  <td class="sty1120FSchIStep2AmountLastCol" style="border-bottom:0;border-right-width:1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/U"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep2AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--End Line 6-1 -->
                <!--Line 6-2-->
                <tr>
                  <td class="sty1120FSchIGenericNum"/>
                  <td class="sty1120FSchIStep2Desc" scope="row" style="font-size:6pt;">
                    <div class="sty1120FSchIRightFloat">
                      <!--<span class="sty1120FSchIDotLn">....</span>--> 
                    </div>
                    <input type="checkbox" alt="alt" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/ActualRatioMethodInd"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIActualRatio</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/ActualRatioMethodInd"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIActualRatio</xsl:with-param>
                      </xsl:call-template>
                      <span style="width:2mm"/>
						Actual ratio under Regs. sec. 1.8825(c)(2). <b>Complete lines 6a through 6c below.</b>
                    </label>
                  </td>
                  <td class="sty1120FSchIStep2AmountLastCol" style="border-bottom:0;border-right-width:1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/U"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep2AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--   ************************************************************   -->
                <!--Line 6-3-->
                <tr>
                  <td class="sty1120FSchIGenericNum"/>
                  <td class="sty1120FSchIStep2Desc" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <!--<span class="sty1120FSchIDotLn">.....</span>-->
                    </div>
                    <input type="checkbox" alt="alt" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/FixedRatioMethodInd"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIFixedRatio</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/FixedRatioMethodInd"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIFixedRatio</xsl:with-param>
                      </xsl:call-template>
                      <span style="width:2mm"/>
                  Fixed ratio under Regs. sec. 1.8825(c)(4). <b>Complete line 6d below.</b>
                    </label>
                  </td>
                  <td class="sty1120FSchIStep2AmountLastCol" style="border-bottom:0;border-right-width:1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/U"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep2AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--End Line 6-3-->
                <!--   ***************************************************************   -->
                <!--Line 6a-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left: 2.5mm">a</td>
                  <td class="sty1120FSchIStep2Desc" scope="row">
					  Average worldwide liabilities
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">....................</span>
                    </div>
                </td>
                  <td class="sty1120FSchIStep2Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AverageWorldwideLiabilitiesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep2AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 6b-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left: 2.5mm">b</td>
                  <td class="sty1120FSchIStep2Desc" scope="row">
					  Average worldwide assets
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.....................</span>
                    </div>
                </td>
                  <td class="sty1120FSchIStep2Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AverageWorldwideAssetsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep2AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 6c-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left: 2.5mm">c</td>
                  <td class="sty1120FSchIStep2Desc" scope="row">
					  Divide line 6a by line 6b
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.....................</span>
                    </div>
                </td>
                  <td class="sty1120FSchIStep2Amount">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/LiabilitiesDividedByAssetsRt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep2AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 6d-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left: 2.5mm">d</td>
                  <td class="sty1120FSchIStep2Desc" style="text-align:justify" scope="row">
                    Fixed ratio under Regs. sec. 1.8825(c)(4). If the corporation is a foreign bank as defined in Regs. sec. 1.8825(c)(4), enter 95% on line 6d. If the 
                    corporation is not a foreign bank or an insurance company, enter 50% on line 6d
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">...............</span>
                    </div>
                </td>
                  <td class="sty1120FSchIStep2Amount" style="padding-top:7mm">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/FixedRt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep2AmountShadedLastCol" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 6e-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left: 2.5mm">e</td>
                  <td class="sty1120FSchIStep2DescLong" colspan="2" scope="row">
					  Enter the ratio from line 6c or 6d, as applicable
                   <div class="sty1120FSchIRightFloat">
                      <!--<span class="sty1120FSchIDotLn">.</span>-->
                    </div>
                 <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.....................</span>
                 </div>
                </td>
                  <td class="sty1120FSchIStep2AmountLastCol">
					<xsl:call-template name="PopulatePercent">
					  <xsl:with-param name="TargetNode" select="$FormData/ApplicableRt"/>
					</xsl:call-template>
                  </td>
                </tr>
								<!--Line 7a-->
                <tr>
                  <td class="styLNLeftNumBox">7a</td>
                  <td class="sty1120FSchIStep2DescLong" colspan="2" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <!--<span class="sty1120FSchIDotLn">.</span>-->
                    </div>
                  U.S.-connected liabilities before Regs. sec. 1.884-1(e)(3) election(s). Multiply line 5, column (d) by line 6e
                </td>
                  <td class="sty1120FSchIStep2AmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/USConnectedLiabSect18841e3Amt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 7b-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left: 2.5mm">b</td>
                  <td class="sty1120FSchIStep2DescLong" colspan="2" scope="row">
                   U.S. liability reduction under Regs. sec. 1.884-1(e)(3) election.
                   <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">................</span>
                    </div>
                </td>
                  <td class="sty1120FSchIStep2AmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/USLiabilityRedSect18841e3Amt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 7c-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left: 2.5mm">c</td>
                  <td class="sty1120FSchIStep2DescLong" colspan="2" scope="row">
                    <b>U.S.-Connected Liabilities. </b>Subtract line 7b from line 7a
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">..............</span>
                      <span style="width:1.8mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                    </div>
                </td>
                  <td class="sty1120FSchIStep2AmountLastCol" style="border-bottom:0">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/USConnectedLiabilitiesAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--End Step 2-->
          <!--Begin Step 3-->
          <!--Step 3 Header-->
          <div class="styBB" style="width:187mm">
            <div class="styPartName" style="height:auto;">Step 3</div>
            <div class="styPartDesc" style="height:auto;font-size:7.5pt">
							Interest Expense Paid or Accrued on Average U.S. Booked Liabilities: Regulations Section 1.8825(d)
						</div>
          </div>
          <!--Step 3 Table-->
          <div class="styTBB" style="width:187mm;border-bottom-width: 1px;">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--Table Header-->
                <tr>
                  <td class="sty1120FSchIGenericNum">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3Desc">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3Header">
                    <b>(a)</b>
                    <br/>Set(s) of Books that Give<br/>Rise to U.S. Booked<br/>Liabilities (see inst.)</td>
                  <td class="sty1120FSchIStep3Header" style="padding-bottom:2.3mm">
                    <b>(b)</b>
                    <br/>Partnership<br/>Interests</td>
                  <td class="sty1120FSchIStep3HeaderLastCol">
                    <b>(c)<br/>Totals.</b>
                    <br/>Add columns<br/>
                    <b>(a)</b> and <b>(b)</b>
                  </td>
                </tr>
                <!--Line 8-->
                <tr>
                  <td class="styLNLeftNumBox">8</td>
                  <td class="sty1120FSchIStep3Desc" scope="row">
                Total average amount of U.S. booked liabilities as defined in Regs. sec. 1.8825(d)(2) (see instructions)
              </td>
                  <td class="sty1120FSchIStep3Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/BooksGiveRiseUSBookedLiabAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/PartnershipInterestsLiabAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3AmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalAverageUSBookedLiabAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 8 - Column (a) instructions-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="height:10.5mm">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3Desc">
                    <b>Column (a):</b> Do not include amounts that give rise to directly allocable interest under Regs. sec. 1.8825(a)(1)(ii) or from partnerships includible in column (b).
              </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 8 - Column (b) instructions-->
                <tr>
                  <td class="sty1120FSchIGenericNum">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3Desc">
                    <b>Column (b):</b> Enter the portion of the total from Schedule P, line 18 that constitutes U.S. booked liabilities.
              </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--End Step 3-->
          <!--Begin Page 1 Footer-->
          <div style="width:187mm;clear:both;padding-top:0.5mm">
            <div style="width:100mm;" class="styGenericDiv">For Paperwork Reduction Act Notice, see the Instructions for Form 1120-F.
              <span style="width:1px"/>
            </div>
            <div style="width:34mm;text-align:center;" class="styGenericDiv">Cat. No. 49680W</div>
            <div style="float:right;" class="styGenericDiv">
              <b>Schedule I (Form 1120-F) 2014</b>
            </div>
          </div>
          <br/>
          <div class="sty1120FSchIPageBreak"/>
         <!-- End Page 1 Footer-->
          <!--END PAGE 1-->
          <!--BEGIN PAGE 2-->
          <!--Page 2 Header-->
          <div class="styTBB" style="width:187mm;border-bottom-width: 1px;">
            <div>Schedule I (Form 1120-F) 2014</div>
            <div style="float:right;clear:none">
            Page <span style="font-size:8pt;font-weight:bold">2</span>
            </div>
          </div>
          <!--Begin Step 3 (cont) Adjusted U.S. Booked Liabilities Method-->
          <div class="styBB" style="width:187mm">
            <div class="styPartName" style="height:auto;">Step 3</div>
            <div class="styPartDesc" style="height:auto; font-size:7.5pt">
							Interest Expense Paid or Accrued on Average U.S. Booked Liabilities: Regulations Section 1.8825(d)
						</div>
          </div>
         <div class="styTBB" style="width:187mm;border-bottom-width: 1px;">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
             <tbody>
                <!--Table Header-->
                <tr>
                  <td class="sty1120FSchIGenericNum">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3Desc">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3Header">
                    <b>(a)</b>
                    <br/>Set(s) of Books that Give<br/>Rise to U.S. Booked<br/>Liabilities (see inst.)</td>
                  <td class="sty1120FSchIStep3Header" style="padding-bottom:2.3mm">
                    <b>(b)</b>
                    <br/>Partnership<br/>Interests</td>
                  <td class="sty1120FSchIStep3HeaderLastCol">
                    <b>(c)<br/>Totals.</b>
                    <br/>Add columns<br/>
                    <b>(a)</b> and <b>(b)</b>
                  </td>
                </tr>
                <!--Line 9-->
                <tr>
                  <td class="styLNLeftNumBox">9</td>
                  <td class="sty1120FSchIStep3Desc" scope="row">
                Total interest paid or accrued during the tax year on line 8 amount
              </td>
                  <td class="sty1120FSchIStep3Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpenseBooksAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpensePrtshpIntAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3AmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalInterestExpenseLiabAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 9 - Column (a) instructions-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="height:10.5mm">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3Desc">
                    <b>Column (a):</b> Do not include amounts that give rise to directly allocable interest under Regs. sec. 1.8825(a)(1)(ii) or from partnerships includible in column (b).
              </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 9 - Column (b) instructions-->
                <tr>
                  <td class="sty1120FSchIGenericNum">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3Desc">
                    <b>Column (b):</b> Enter the portion of the total from Schedule P, line 15c that is interest on U.S. booked liabilities.
              </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
             </tbody>
            </table>
          </div>
          <!--Step 3 (cont) Adjusted U.S. Booked Liabilities Method header-->
          <div class="styBB" style="width:187mm">
            <div class="styPartName"  style="width:27mm;height:auto;">Step 3 (cont.)</div>
            <div class="styPartDesc" style="width:160mm;height:auto;">
            Adjusted U.S. Booked Liabilities Method: Regulations Section 1.8825(d)
          </div>
          </div>
          <!--Step 3 (cont.) Adjusted U.S. Booked Liabilities Method instructions-->
          <div class="styBB" style="width:187mm">
            <div style="font-size:7pt;padding-top:1mm">
              <b>If line 7c is greater than line 8, column (c),</b> complete lines 10 through 13 below and skip lines 14a and 14b.<br/>
              <b>If line 7c is less than or equal to line 8, column (c),</b> skip lines 10 through 13 and complete lines 14a and 14b.
          </div>
          </div>
          <!--Step 3 (cont.) Adjusted U.S. Booked Liabilities Method Table - Watch the colspans!-->
          <div class="styTBB" style="width:187mm;border-bottom-width: 1px;">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--Line 10-->
                <tr>
                  <td class="styLNLeftNumBox">10</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" style="padding-top:1mm;padding-bottom:1mm">
						If the corporation is a foreign bank which is making a current-year election to use the published
						average 30-day LIBOR (see instructions), check the box on this line, skip lines 10a through 10c, and enter the rate on line 10d
                    <div style="width:136mm;float:left;clear:none;text-align:justify;">
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$FormData/ElectionUse30DayLIBORInd"/>
                          <xsl:with-param name="BackupName">IRS1120FSchIStep3ForeignBankYes</xsl:with-param>
                        </xsl:call-template>
					  </label>
                    </div>
                    <div style="width:136mm;float:left;clear:none;text-align:justify;">
					  <span style="float:left;">
                        <span class="sty1120FSchIDotLn" style="padding-left:1.8mm">............................</span>
                        <span style="width:1mm"/>
                        <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                      </span>
                      <div style="width:3mm;float:right;clear:none;">
                        <input type="checkbox" alt="alt" class="styCkbox">
                          <xsl:call-template name="PopulateCheckbox">
                            <xsl:with-param name="TargetNode" select="$FormData/ElectionUse30DayLIBORInd"/>
                            <xsl:with-param name="BackupName">IRS1120FSchIStep3ForeignBankYes</xsl:with-param>
                          </xsl:call-template>
                        </input>
                      </div>
                      </div>
                  </td>
                  <td class="sty1120FSchIStep3ContAdjUSShadedCell" colspan="2">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 10a-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left:4mm;">a</td>
                  <td class="sty1120FSchIStep3ContAdjUSDescShort" scope="row">
                  Total interest paid or accrued during the tax year on U.S. dollar liabilities<br/>
                  that are <b>not</b> U.S. booked liabilities included on line 8
                    <div class="sty1120FSchIRightFloat" style="padding-right:2.3mm">
                      <span class="sty1120FSchIDotLn">......</span>
                    </div>
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">10a</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmount" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestPaidUSDollarLiabAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContAdjUSShadedCell" colspan="2">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 10b-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left:4mm;">b</td>
                  <td class="sty1120FSchIStep3ContAdjUSDescShort" scope="row">
                  Average U.S. dollar denominated liabilities that are <b>not</b> U.S. booked<br/>
                  liabilities included on line 8
                    <div class="sty1120FSchIRightFloat" style="padding-right:2.3mm">
                      <span class="sty1120FSchIDotLn">.............</span>
                    </div>
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">10b</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmount" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/USDollarDenominatedLiabAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContAdjUSShadedCell" colspan="2">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 10c-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left:4mm;">c</td>
                  <td class="sty1120FSchIStep3ContAdjUSDescShort" scope="row">
					   Divide line 10a by line 10b
                   <div class="sty1120FSchIRightFloat" style="padding-right:2.3mm">
                      <span class="sty1120FSchIDotLn">.............</span>
                    </div>
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">10c</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmount">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestDividedByLiabilitiesRt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContAdjUSShadedCell" colspan="2">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 10d-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left:4mm;">d</td>
                  <td class="sty1120FSchIStep3ContAdjUSDescShort" style="font-size:7pt;" scope="row">
                  Enter the 30-day LIBOR, if elected under Regs. sec. 1.8825(d)(5)(ii)(B)
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">10d</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmount">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/ThirtyDayLIBORRt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContAdjUSShadedCell" colspan="2">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 10e-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left:4mm;">e</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" scope="row">
					  Enter the rate from line 10c or, if elected, the 30-day LIBOR on line 10d
                    <div class="sty1120FSchIRightFloat" style="padding-right:2.3mm">
                      <span class="sty1120FSchIDotLn">..........</span>
                    </div>
                      <!--Push Pin-->
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$FormData/UseRt"/>
                      </xsl:call-template>
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">10e</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmountLastCol">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/UseRt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 11-->
                <tr>
                  <td class="styLNLeftNumBox">11</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" scope="row">
                   <b>Excess U.S.-connected liabilities.</b> Subtract line 8, column (c) from line 7c
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">........</span>
                      <span style="width:1.8mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                    </div>
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">11</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/ExcessUSConnectedLiabAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 12-->
                <tr>
                  <td class="styLNLeftNumBox">12</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" scope="row">
                    <b>Excess interest.</b> Multiply line 10e by line 11
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">................</span>
                      <span style="width:1.8mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                    </div>
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">12</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode" select="$FormData/ExcessInterestAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 13-->
                <tr>
                  <td class="styLNLeftNumBox">13</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" scope="row">
					  Add lines 9, column (c) and 12
                    <div class="sty1120FSchIRightFloat" style="padding-right:2.3mm">
                      <span class="sty1120FSchIDotLn">........................</span>
                    </div>
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">13</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpense1Amt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 14a-->
								<!-- ScalingRt is LargeRatioType and allows 22 digits. The font size has to to be reduced -->
                <tr>
                  <td class="styLNLeftNumBox">14a</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" scope="row">
                    <b>Scaling ratio.</b> Divide line 7c by line 8, column (c)
                    <div class="sty1120FSchIRightFloat" style="padding-right:2.3mm">
                      <span class="sty1120FSchIDotLn">..................</span>
                    </div>
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">14a</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmountLastCol" style="font-size:5.5pt;">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/ScalingRt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 14b-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left:4.5mm;">b</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" scope="row">
					  Multiply line 9, column (c) by line 14a. See instructions for hedging amounts
                    <div class="sty1120FSchIRightFloat" style="padding-right:2.3mm">
                      <span class="sty1120FSchIDotLn">.........</span>
                    </div>
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">14b</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpense2Amt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 15-->
                <tr>
                  <td class="styLNLeftNumBox">15</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" scope="row">
                    <b>Interest expense allocable to ECI under the adjusted U.S. booked liabilities method.</b> Enter the<br/>
					  result from line 13 or line 14b here and on line 21
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.................</span>
                      <span style="width:1.8mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                    </div>
                </td>
                  <td class="sty1120FSchIGenericRightNumBox" style="border-bottom-width:0">15</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmountLastCol" style="padding-top:3mm;border-bottom-width:0">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/IntExpnsAdjUSBookedLiabMthdAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--END Step 3 (cont.)  Adjusted U.S. Booked Liabilities Method-->
          <!--BEGIN Step 3 (cont.) Separate Currency Pools Method-->
          <!--Step 3 (cont.) Separate Currency Pools Method Header-->
          <div class="styBB" style="width:187mm">
            <div class="styPartName" style="width:27mm;height:auto;">Step 3 (cont.)</div>
            <div class="styPartDesc" style="width:160mm;height:auto;">
            Separate Currency Pools Method: Regulations Section 1.8825(e)
          </div>
          </div>
          <!--Step 3 (cont.) Separate Currency Pools Method Table-->
          <div class="styTBB" style="width:187mm;border-bottom-width: 1px;">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--Header-->
                <tr>
                  <!--Note: the following 2 cells have rowspan of 2 in order to capture the look of line 16a's description which is split across the table header and 1st cell-->
                  <td class="sty1120FSchIGenericNum"/>
                  <td class="sty1120FSchIStep3ContSepCurDesc">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurHeader" style="padding-bottom:0.5mm">
                    <b>(a)</b>
                    <br/>U.S. Dollar<br/>Denominated</td>
                  <td class="sty1120FSchIStep3ContSepCurHeader">
                    <b>(b)</b>
                    <br/>Home Country<br/>Currency. Specify:<br/>
                    <br/>
                    <div style="text-align:left">
                      <span style="width:1mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="Bullet Image"/>
                      <span style="width:1mm"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrencyGrp/CurrencyTxt"/>
                      </xsl:call-template>
                    </div>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurHeader">
                    <b>(c)</b>
                    <br/>Other Currency.<br/>Specify:<br/>
                    <br/>
                    <div style="text-align:left">
                      <span style="width:1mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="Bullet Image"/>
                      <span style="width:1mm"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnCGrp/CurrencyTxt"/>
                      </xsl:call-template>
                    </div>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurHeader" style="border-right:none">
                    <b>(d)</b>
                    <br/>Other Currency.<br/>Specify:<br/>
                    <br/>
                    <div style="text-align:left">
                      <span style="width:1mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="Bullet Image"/>
                      <span style="width:1mm"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnDGrp/CurrencyTxt"/>
                      </xsl:call-template>
                    </div>
                  </td>
                </tr>
                <!--Line 16a-->
                <tr>
                  <td class="styLNLeftNumBox">16a</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" scope="row">
                      <b>U.S. assets.</b> Enter the corporation’s U.S. assets, using the methodology in Regs. sec. 1.8825(e)(1)(i). If more columns are needed, attach statement  (see  instructions)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/USAssetsAmt"/>
						</xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:9mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/USAssetsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:9mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrencyGrp/USAssetsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:9mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnCGrp/USAssetsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmountLastCol" style="padding-top:9mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnDGrp/USAssetsAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 16b-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left:4.5mm;padding-bottom:8mm;">b</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" scope="row">
					 Check here if a less than 3% currency election was made
                    <div>
						<label>
							<xsl:call-template name="PopulateLabel">
							  <xsl:with-param name="TargetNode" select="$FormData/LessThan3PctCurrencyElectInd"/>
							  <xsl:with-param name="BackupName">IRS1120FSchIStep3LessThan3PercentYes</xsl:with-param>
							</xsl:call-template>
						</label>
                    </div>
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.............</span>
                      <span style="width:4.7mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                      <span style="width:2mm"/>
                      <input type="checkbox" alt="alt" class="styCkbox">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$FormData/LessThan3PctCurrencyElectInd"/>
                          <xsl:with-param name="BackupName">IRS1120FSchIStep3LessThan3PercentYes</xsl:with-param>
                        </xsl:call-template>
                      </input>
                    </div>
                </td>
                  <td class="sty1120FSchIStep3ContSepCurShaded" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurShaded" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurShaded" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurShadedLastCol" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 17a-->
								<!-- ApplicableRt is LargeRatioType and allows 22 digits. The font size has to to be reduced -->
                <tr>
                  <td class="styLNLeftNumBox">17a</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" scope="row">
                    Enter the percentage from line 6e
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">......</span>
                    </div>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="font-size:5pt;">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/ApplicableRt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="font-size:5pt;">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrencyGrp/ApplicableRt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="font-size:5pt;">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnCGrp/ApplicableRt"/>
                    </xsl:call-template>
                  </td>
                 <td class="sty1120FSchIStep3ContSepCurAmountLastCol" style="font-size:5pt;">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnDGrp/ApplicableRt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 17b-->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left:4.5mm;padding-top:1mm;">b</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" scope="row">
                    <b>U.S.-connected liabilities. </b>Multiply line 16a by line 17a, or, if a liability reduction election is made, see instructions 
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount">
                    <span style="float:left;">
                      <!--Push Pin for LiabilityReductionElectionSchedule-->
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$FormData/Step3USConnectedLiabilitiesAmt"/>
                      </xsl:call-template>
                    </span>
                    <br/><br/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/Step3USConnectedLiabilitiesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount">
                    <span style="float:left;">
                      <!--Push Pin for LiabilityReductionElectionSchedule-->
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$FormData/Step3USConnectedLiabilitiesAmt"/>
                      </xsl:call-template>
                    </span>
                    <br/><br/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrencyGrp/Step3USConnectedLiabilitiesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount">
                   <span style="float:left;">
                      <!--Push Pin for LiabilityReductionElectionSchedule-->
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$FormData/Step3USConnectedLiabilitiesAmt"/>
                      </xsl:call-template>
                    </span>
                  <br/><br/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnCGrp/Step3USConnectedLiabilitiesAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmountLastCol">
                   <span style="float:left;">
                      <!--Push Pin for LiabilityReductionElectionSchedule-->
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$FormData/Step3USConnectedLiabilitiesAmt"/>
                      </xsl:call-template>
                    </span>
                  <br/><br/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnDGrp/Step3USConnectedLiabilitiesAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 18a-->
                <tr>
                  <td class="styLNLeftNumBox">18a</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" scope="row">
                    Enter the total interest expense paid or accrued for the tax year with respect to the foreign corporation’s worldwide liabilities denominated in that foreign 
                    <span style="float:left;">currency (enter in functional currency) </span>
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.....</span>
                    </div>
                </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:8mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpenseFuncCurAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:8mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrencyGrp/InterestExpenseFuncCurAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:8mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnCGrp/InterestExpenseFuncCurAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmountLastCol" style="padding-top:8mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnDGrp/InterestExpenseFuncCurAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 18b-->
                <tr style="padding-top:1mm">
                  <td class="styLNLeftNumBox" style="padding-left:4.5mm;">b</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc">
                    Enter the corporation’s average worldwide liabilities (whether interest bearing or not) denominated in that 
                    <span style="float:left;">foreign currency (enter in functional currency) </span> 
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">...</span>
                    </div>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:6.5mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/LiabilitiesFunctionalCurAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:6.5mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrencyGrp/LiabilitiesFunctionalCurAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:6.5mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnCGrp/LiabilitiesFunctionalCurAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmountLastCol" style="padding-top:6.5mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnDGrp/LiabilitiesFunctionalCurAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 18c-->
								<!-- BorrowingRt is LargeRatioType and allows 22 digits. The font size has to to be reduced -->
                <tr>
                  <td class="styLNLeftNumBox" style="padding-left:4.5mm;">c</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" scope="row">
                    <span style="float:left;"><b>Borrowing rate:</b> Divide line 18a by line 18b </span>
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">...</span>
                    </div>
                </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="font-size:5pt;">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/BorrowingRt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="font-size:5pt;">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrencyGrp/BorrowingRt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="font-size:5pt;">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnCGrp/BorrowingRt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmountLastCol" style="font-size:5pt;">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnDGrp/BorrowingRt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 19-->
                <tr>
                  <td class="styLNLeftNumBox">19</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" scope="row">
                    <div style="text-align-last:justify;font-weight:bold">
                    Interest expense allocation by separate currency
                  </div>
                    <b>pool.</b> Multiply line 17b by line 18c
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">......</span>
                    </div>
                </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:3mm;border-bottom-width:1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpenseAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:3mm;border-bottom-width:1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrencyGrp/InterestExpenseAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:3mm;border-bottom-width:1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnCGrp/InterestExpenseAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmountLastCol" style="padding-top:3mm;border-bottom-width:1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnDGrp/InterestExpenseAllocationAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 20-->
                <tr style="padding-top:1mm">
                  <td class="styLNLeftNumBox">20</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" style="width:155mm" colspan="4">
                    <div style="text-align-last:justify">
                      <b>Interest expense allocable to ECI under the separate currency pools method.</b> Total the amounts on line 19, columns (a) through (d), and amounts from attached statement, if any, and enter the result here and on line 21 <span class="sty1120FSchIDotLn">.</span>
                  </div>
                </td>
                  <td class="sty1120FSchIStep3ContSepCurAmountLastCol" style="border-bottom-width:0;padding-top:4mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/IntExpnsSepCurPoolsMthdAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--END Step 3 (cont.) Separate Currency Pools Method-->
          <!--Begin Page 2 Footer-->
          <div style="width:187mm;clear:both;padding-top:0.5mm">
            <div style="float:right;" class="styGenericDiv">
              <b>Schedule I (Form 1120-F) 2014</b>
            </div>
          </div>
          <br/>
					<p>
						<div class="pageEnd" style="width:187mm;"/>
					</p>
          <!-- End Page 2 Footer-->
          <!--END PAGE 2-->
          <!--BEGIN PAGE 3-->
          <!--Page 3 Header-->
          <div class="styTBB" style="width:187mm;border-bottom-width: 1px;">
            <div>Schedule I (Form 1120-F) 2014</div>
            <div style="float:right;clear:none">
            Page <span style="font-size:8pt;font-weight:bold">3</span>
            </div>
          </div>
          <!--BEGIN Summary-->
          <!--Summary Header-->
          <div class="styBB" style="width:187mm">
            <div class="styPartDesc" style="padding-left:7.5mm;height:auto;">
            SUMMARYInterest Expense Allocation and Deduction under Regulations Section 1.8825
          </div>
          </div>					<!--Summary Table-->
          <div class="styTBB" style="width:187mm;border-bottom-width: 1px;">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--Line 21-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="padding-bottom:0mm;">21</td>
                  <td class="sty1120FSchISummaryDescShort " scope="row">
                   Amount from line 15 or line 20, as applicable
                   <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.........</span>
                    </div>
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">21</td>
                  <td class="sty1120FSchISummaryAmount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/IntExpnsSect18825dOr5eAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchISummaryShadedRightNumBox ">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchISummaryShadedAmountLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 22-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="padding-bottom:3mm;">22</td>
                  <td class="sty1120FSchISummaryDescShort " scope="row">
                    <!--<div style="text-align-last:justify">-->
                    Enter the corporation’s interest expense directly  
                    allocable under Regs. sec. 1.8825(a)(1)(ii).(Include total from Schedule P, line 15b.)
                  <!--</div>-->
                     <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">...</span>
                     </div>
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">22</td>
                  <td class="sty1120FSchISummaryAmount" style="vertical-align:bottom;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpnsSect18825a1iiAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchISummaryShadedRightNumBox ">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchISummaryShadedAmountLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 23-->
                <tr>
                  <td class="sty1120FSchIGenericNum">23</td>
                  <td class="sty1120FSchISummaryDesc" colspan="3" scope="row">
                    <b>Interest expense allocable to ECI under Regs. sec. 1.8825.</b> Add lines 21 and 22
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.....</span>
                      <span style="width:1.5mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                    </div>
                </td>
                  <td class="sty1120FSchIGenericRightNumBox ">23</td>
                  <td class="sty1120FSchISummaryAmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpenseAllocableECIAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 24a-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="padding-bottom:4mm;">24a</td>
                  <td class="sty1120FSchISummaryDescShort" style="padding-left:0mm;" scope="row">Amount of line 23 that is disallowed as a deduction under section 265, 163(f)(2), etc. or under an income tax treaty (attach 
                   statement see instructions)
                                 <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/DisallowedSection265Amt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIGenericRightNumBox">24a</td>
                  <td class="sty1120FSchISummaryAmount" style="padding-right:0mm;padding-top:2mm;">
                    <div style="float:right;clear:none;padding-top:4mm;">
                      (<xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/DisallowedSection265Amt"/>
                      </xsl:call-template>)
                    </div>
                    <div style="text-align:left;padding-top:3mm"></div>
                  </td>
                  <td class="sty1120FSchISummaryShadedRightNumBox ">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchISummaryShadedAmountLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 24b-->
                <tr>
                 <td class="sty1120FSchIGenericLetterDD" style="padding-bottom:3mm">b</td>
                  <td class="sty1120FSchISummaryDescShort" scope="row">Deferred interest expense under section 163(e)(3), 163(j), or 267(a)(3),         
                     etc. (attach statement see instructions)
					<xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/DefrdIntExpnsSect163Or267Amt"/>
                    </xsl:call-template>
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.........</span>
                    </div>
                  </td>
                  <td class="sty1120FSchIGenericRightNumBox">24b</td>
                  <td class="sty1120FSchISummaryAmount" style="padding-right:0mm;">
                  <div style="float:right;clear:none;padding-top:4mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/DefrdIntExpnsSect163Or267Amt"/>
                    </xsl:call-template>
                   </div>
                    <div style="text-align:left;padding-top:3mm;"></div>
                  </td>
                  <td class="sty1120FSchISummaryShadedRightNumBox ">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchISummaryShadedAmountLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 24c-->
                <tr>
                  <td class="sty1120FSchIGenericLetterDD" style="padding-bottom:3mm">c</td>
                  <td class="sty1120FSchISummaryDescShort" scope="row">Amount of line 23 that is capitalized 	under section 263A (attach
                   statement see instructions)
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/CapitalizedSection263AAmount"/>
					</xsl:call-template>
					<div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">..................</span>
                    </div>
                  </td>
                  <td class="sty1120FSchIGenericRightNumBox">24c</td>
                  <td class="sty1120FSchISummaryAmount" style="padding-right:0mm;">
                    <div style="float:right;clear:none;padding-top:4mm;">
                      (<xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/CapitalizedSection263AAmount"/>
                      </xsl:call-template>)
                    </div>
                    <div style="text-align:left;padding-top:3mm;"></div>
                  </td>
                  <td class="sty1120FSchISummaryShadedRightNumBox ">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchISummaryShadedAmountLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 24d -->
                <tr>
                 <td class="sty1120FSchIGenericLetterDD">d</td>
                  <td class="sty1120FSchISummaryDesc" colspan="3" scope="row">
                   Combine lines 24a through 24c
                   <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.......................</span>
                  </div>
                </td>
                  <td class="sty1120FSchIGenericRightNumBox ">24d</td>
                  <td class="sty1120FSchISummaryAmountLastCol">
                     <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalIntExpDefrdIntAndCapAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 25-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="padding-bottom:1.5mm">25</td>
                  <td class="sty1120FSchISummaryDesc" colspan="3" style="padding-top:1.5mm" scope="row">
                    <b>Total interest expense deduction under Regs. sec. 1.8825.</b> Combine lines 23 and 24d and enter here and on Form 1120F, Section II, line 18. The amount entered on line 25 may not exceed the total</td>
                  <td class="sty1120FSchISummaryShadedRightNumBox ">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchISummaryShadedAmountLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <tr>
                  <td class="sty1120FSchIGenericNum"/>
                  <td class="sty1120FSchISummaryDesc" colspan="3" scope="row">
                  interest expense paid or accrued by the foreign corporation
                   <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">..............</span>
                      <span style="width:1.5mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                    </div>
                </td>
                  <td class="sty1120FSchIGenericRightNumBox" style="border-bottom-width:0">25</td>
                  <td class="sty1120FSchISummaryAmountLastCol" style="border-bottom-width:0">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalInterestExpenseDedAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--Begin Page 2 Footer-->
          <div style="width:187mm;clear:both;padding-top:0.5mm">
            <div style="float:right;" class="styGenericDiv">
              <b>Schedule I (Form 1120-F) 2014</b>
            </div>
          </div>
          <br/>
          <div class="pageEnd"/>
          <!-- End Page 2 Footer-->
          <!-- BEGIN Left Over Table -->
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
          Additional Data        
        </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormData"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>