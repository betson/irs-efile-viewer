<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8594Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest  -->
  <xsl:param name="Form8594Data" select="$RtnDoc/IRS8594"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8594Data)"/>
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
        <meta name="Description" content="IRS Form 8594"/>
        <xsl:call-template name="InitJS"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8594Style"/>
            <xsl:call-template name="AddOnStyle"/>
           </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form8594">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Number and Name -->
          <div class="styTBB" style="width:187mm;height:20.5mm;">
            <div class="styFNBox" style="width:35mm;height:20.5mm;">
                Form <span class="styFormNumber"> 8594</span>
                <br/>
                (Rev. December 2012)
                <br/>
              <span style="height:7mm;"/>
              <div style="height:7mm;font-size:7pt;font-family:arial;padding-top:1.5mm;">
                <span class="styAgency">Department of the Treasury</span>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form8594Data"/>
                </xsl:call-template>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:121mm;height:20.5mm;padding-top:1mm">
              <div class="styMainTitle">Asset Acquisition Statement </div>
              <br/>
              <div class="styMainTitle" style="font-size:11pt;">Under Section 1060 </div>
             <br/>
             <br/>
                <img src="{$ImagePath}/8594_Bullet.gif" alt="bullet image"/>
                Attach to your income tax return.
              <br/>
                <img src="{$ImagePath}/8594_Bullet.gif" alt="bullet image"/>
                Information about Form 8594 and its separate instructions is at 
                <a href="http://www.irs.gov/form8594" title="Link to IRS.gov">
                <i>www.irs.gov/form8594.</i>
            </a>
            </div>
            <div class="styTYBox" style="width:30mm;height:20.5mm;">
              <div class="styOMB" style="height:9mm;padding-top:2mm;padding-left:3mm;">OMB No. 1545-1021</div>
              <div style="height:9mm;text-align:left;padding-left:3mm;border-bottom-width:0px;" class="styOMB">
                <span style="height:6mm;" />
                Attachment
                <br/>
                Sequence No.
                <span class="styBoldText">169</span>
              </div>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:120mm;height:9mm;font-size:7pt; padding-left:9mm;">
              Name as shown on return
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8594Data/BusinessName/BusinessNameLine1Txt">
                </xsl:with-param>
              </xsl:call-template>
              <xsl:if test="$Form8594Data/BusinessName/BusinessNameLine2Txt">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8594Data/BusinessName/BusinessNameLine2Txt">
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:if>
            </div>
            <div style="width:65mm;height:9mm;float:left;padding-left:2mm;font-size:7pt;">
              <span style="width:4px;"/>
              Identifying number as shown on return
              <br/>
              <br/>
              <xsl:if test="$Form8594Data/EIN!=' '">
                <span style="width:15mm;"/>
                <span style="font-weight:normal;padding-left:1.5mm;text-align:center;">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/EIN"/>
                  </xsl:call-template>
                </span>
              </xsl:if>
              <xsl:if test="$Form8594Data/SSN!=' '">
                <span style="font-weight:normal;padding-left:1.5mm;text-align:center;">
                  <xsl:call-template name="PopulateSSN">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/SSN"/>
                  </xsl:call-template>
                </span>
              </xsl:if>
              <xsl:if test="$Form8594Data/BusinessMissingEINReasonCd!=' '">
                <span style="font-weight:normal;padding-left:1.5mm;text-align:center;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/BusinessMissingEINReasonCd"/>
                  </xsl:call-template>
                </span>
              </xsl:if>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div style="width:182mm;padding-left:9mm;">
              Check the box that identifies you:
              <br/>
              <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/PurchaserInd"/>
                  </xsl:call-template>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form8594Data/PurchaserInd"/>
                  <xsl:with-param name="BackupName">IRS8594PurchaserInd</xsl:with-param>
                </xsl:call-template>
              </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form8594Data/PurchaserInd"/>
                  <xsl:with-param name="BackupName">IRS8594Purchaser</xsl:with-param>
                </xsl:call-template>
                Purchaser
              </label>
              <span style="width:24px"/>
              <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/SellerInd"/>
                  </xsl:call-template>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form8594Data/SellerInd"/>
                  <xsl:with-param name="BackupName">IRS8594Seller</xsl:with-param>
                </xsl:call-template>
              </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form8594Data/SellerInd"/>
                  <xsl:with-param name="BackupName">IRS8594Seller</xsl:with-param>
                </xsl:call-template>
                Seller
              </label>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- BEGIN Part I Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName">Part I </div>
            <div class="styPartDesc">General Information </div>
          </div>
          <!-- END Part I Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;">1</div>
            <div class="styNameBox" style="width:112mm;height:9.5mm;font-size:7pt;">
              Name of other party to the transaction
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8594Data/OtherPartyName/BusinessNameLine1Txt"/>
              </xsl:call-template>
              <xsl:if test="$Form8594Data/OtherPartyName/BusinessNameLine2Txt !=''">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8594Data/OtherPartyName/BusinessNameLine2Txt"/>
                </xsl:call-template>
              </xsl:if>
            </div>
            <div style="width:63mm;padding-left:3mm;float:left;">
              Other party's identifying number
              <br/>
              <br/> 
              <xsl:choose>
                <xsl:when test="normalize-space($Form8594Data/OtherPartyEIN)">
                  <span style="text-align:center;width:40mm;padding-top:.1mm;vertical-align:bottom">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/OtherPartyEIN"/>
                    </xsl:call-template>
                  </span>
                  <span style="width: 2px"/>
                </xsl:when>
                <xsl:when test="normalize-space($Form8594Data/OtherPartySSN)">
                  <span style="text-align:center;width:40mm;">
                    <xsl:call-template name="PopulateSSN">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/OtherPartySSN"/>
                    </xsl:call-template>
                  </span>
                  <span style="width: 2px"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/MissingEINReasonCd"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:9mm;font-size:7pt;padding-left:8mm;">
              Address (number, street, and room or suite no.)
              <br/>
              <xsl:if test="$Form8594Data/OtherPartyUSAddress">
                <xsl:if test="$Form8594Data/OtherPartyUSAddress/AddressLine1Txt!=''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/OtherPartyUSAddress/AddressLine1Txt"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$Form8594Data/OtherPartyUSAddress/AddressLine2Txt!=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/OtherPartyUSAddress/AddressLine2Txt"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:if>
              <xsl:if test="$Form8594Data/OtherPartyForeignAddress">
                <xsl:if test="$Form8594Data/OtherPartyForeignAddress/AddressLine1Txt!=''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/OtherPartyForeignAddress/AddressLine1Txt"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$Form8594Data/OtherPartyForeignAddress/AddressLine2Txt!=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/OtherPartyForeignAddress/AddressLine2Txt"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:if>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:9mm;font-size:7pt;padding-left:8mm;">
              City or town,
              <span style="width:1px;"/>
              state,
              <span style="width:1px;"/>
              and
              <span style="width:1px;"/>
              ZIP code
              <br/>
              <br/>
              <xsl:if test="$Form8594Data/OtherPartyUSAddress">
                <xsl:if test="$Form8594Data/OtherPartyUSAddress/CityNm!=''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/OtherPartyUSAddress/CityNm"/>
                  </xsl:call-template>
                  ,
                </xsl:if>
                <xsl:if test="$Form8594Data/OtherPartyUSAddress/StateAbbreviationCd!=''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/OtherPartyUSAddress/StateAbbreviationCd"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$Form8594Data/OtherPartyUSAddress/ZIPCd!=''">
                  <span style="width:1mm;"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/OtherPartyUSAddress/ZIPCd"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:if>
              <xsl:if test="$Form8594Data/OtherPartyForeignAddress">
                <xsl:if test="$Form8594Data/OtherPartyForeignAddress/CityNm!=''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/OtherPartyForeignAddress/CityNm"/>
                  </xsl:call-template>
                  ,
                </xsl:if>
                <xsl:if test="$Form8594Data/OtherPartyForeignAddress/ProvinceOrStateNm!=''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/OtherPartyForeignAddress/ProvinceOrStateNm"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$Form8594Data/OtherPartyForeignAddress/CountryCd!=''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/OtherPartyForeignAddress/CountryCd"/>
                  </xsl:call-template>
                </xsl:if>
                <span style="width:1mm;"/>
                <xsl:if test="$Form8594Data/OtherPartyForeignAddress/ForeignPostalCd!=''">
                  <span style="width:1mm;"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/OtherPartyForeignAddress/ForeignPostalCd"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:if>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;">2</div>
            <div class="styNameBox" style="width:100mm;height:9mm;font-size:7pt;">
              Date of sale
              <br/>
              <br/>
              <span style="text-align:center;width:100mm;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form8594Data/SaleDt"/>
                </xsl:call-template>
              </span>
            </div>
            <div style="width:78mm;height:8mm;padding-left:3mm;float:left;">
              <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;">3</div>
              Total sales price (consideration)
              <br/>
              <br/>
              <span style="width:30mm;text-align:right;float:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8594Data/TotalSalePriceAmt"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- BEGIN Part II Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName">Part II </div>
            <div class="styPartDesc">Original Statement of Assets Transferred </div>
          </div>
          <!-- END Part II Title -->
          <div class="styIRS8594TableContainer">
            <!-- print logic -->
            <xsl:call-template name="SetInitialState"/>
            <!-- end -->
            <table class="styTable" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr>
                  <th class="styTableCellHeader" style="width:31mm;text-align:left;font-weight:normal;" scope="col">
                    <span class="styBoldText" style="width:24px;padding-left:1mm;">4</span>
                    Assets
                  </th>
                  <th class="styTableCellHeader" style="width:80mm;font-weight:normal;" scope="col">Aggregate fair market value (actual amount for Class I)</th>
                  <th class="styTableCellHeader" style="width:75mm;border-right-width: 0px;font-weight:normal;" scope="col">Allocation of sales price</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <tr>
                  <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;"> Class I </td>
                  <td class="styTableCellText" style="width:80mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class1FairMarketValueAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:76mm;padding-top:5mm;text-align:right;border-right-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class1SalesPriceAllocationAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;"> Class II </td>
                  <td class="styTableCellText" style="width:80mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class2FairMarketValueAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:76mm;padding-top:5mm;text-align:right;border-right-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class2SalesPriceAllocationAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;"> Class III </td>
                  <td class="styTableCellText" style="width:80mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class3FairMarketValueAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:76mm;padding-top:5mm;text-align:right;border-right-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class3SalesPriceAllocationAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;"> Class IV </td>
                  <td class="styTableCellText" style="width:80mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class4FairMarketValueAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:76mm;padding-top:5mm;text-align:right;border-right-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class4SalesPriceAllocationAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;"> Class V </td>
                  <td class="styTableCellText" style="width:80mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class5FairMarketValueAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:76mm;padding-top:5mm;text-align:right;border-right-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class5SalesPriceAllocationAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;"> Class VI and VII </td>
                  <td class="styTableCellText" style="width:80mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class6And7FairMarketValueAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:76mm;padding-top:5mm;text-align:right;border-right-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class6And7SalesPriceAllocnAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;border-bottom-width: 0px;"> Total </td>
                  <td class="styTableCellText" style="width:80mm;padding-top:5mm;text-align:right;border-bottom-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/TotalFairMarketValueAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:76mm;padding-top:5mm;text-align:right;border-right-width: 0px;border-bottom-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/TotalSalesPriceAllocationAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">5</div>
            <div class="styLNDesc" style="width:145mm;"> Did the purchaser and seller provide for an allocation of the sales price in the sales contract or in another </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div style="float:left;"> written document signed by both parties? </div>
            <div style="float:right">
              <span style="letter-spacing:16px; font-weight:bold; float:left">..................</span>
              <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/BuyerOrSellerProvAllocnPrcInd"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/BuyerOrSellerProvAllocnPrcInd"/>
                      <xsl:with-param name="BackupName">
                        IRS8594BuyerOrSellerProvAllocnPrice
                      </xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <span style="width:8px"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/BuyerOrSellerProvAllocnPrcInd"/>
                    <xsl:with-param name="BackupName">
                      IRS8594BuyerOrSellerProvAllocnPrice
                    </xsl:with-param>
                  </xsl:call-template>
                  Yes
                </label>
              </div>
              <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/BuyerOrSellerProvAllocnPrcInd"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/BuyerOrSellerProvAllocnPrcInd"/>
                      <xsl:with-param name="BackupName">
                        IRS8594BuyerOrSellerProvAllocnPrice
                      </xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <span style="width:8px"/>
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/BuyerOrSellerProvAllocnPrcInd"/>
                    <xsl:with-param name="BackupName">
                      IRS8594BuyerOrSellerProvAllocnPrice
                    </xsl:with-param>
                  </xsl:call-template>
                  No
                </label>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:145mm;"> If "Yes," are the aggregate fair market values (FMV) listed for each of asset Classes I, II, III, IV, V, VI, and </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div style="float:left;"> VII the amounts agreed upon in your sales contract or in a separate written document? </div>
            <div style="float:right">
              <span style="letter-spacing:16px; font-weight:bold; float:left">.......</span>
              <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/AggregateValuesListedInd"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/AggregateValuesListedInd"/>
                      <xsl:with-param name="BackupName">
                        IRS8594AggregateValuesListed
                      </xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <span style="width:8px"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/AggregateValuesListedInd"/>
                    <xsl:with-param name="BackupName">
                      IRS8594AggregateValuesListed
                    </xsl:with-param>
                  </xsl:call-template>
                  Yes
                </label>
              </div>
              <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/AggregateValuesListedInd"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/AggregateValuesListedInd"/>
                      <xsl:with-param name="BackupName">
                        IRS8594AggregateValuesListed
                      </xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <span style="width:8px"/>
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/AggregateValuesListedInd"/>
                    <xsl:with-param name="BackupName">
                      IRS8594AggregateValuesListed
                    </xsl:with-param>
                  </xsl:call-template>
                  No
                </label>
              </div>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">6</div>
            <div class="styLNDesc" style="width:145mm;"> In the purchase of the group of assets (or stock), did the purchaser also purchase a license or a covenant </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:145mm;"> not to compete, or enter into a lease agreement, employment contract, management contract, or similar </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div style="float:left;">
              arrangement with the seller (or managers, directors, owners, or employees of the seller)?
              <span style="width:1px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8594Data/PrchsOrEntrAgrmtWithSellrInd"/>
              </xsl:call-template>
            </div>
            <div style="float:right">
              <span style="letter-spacing:16px; font-weight:bold; float:left">......</span>
              <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/PrchsOrEntrAgrmtWithSellrInd"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/PrchsOrEntrAgrmtWithSellrInd"/>
                      <xsl:with-param name="BackupName">
                        IRS8594PurchaseOrEnterAgrmtWithSeller
                      </xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <span style="width:8px"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/PrchsOrEntrAgrmtWithSellrInd"/>
                    <xsl:with-param name="BackupName">
                      IRS8594PurchaseOrEnterAgrmtWithSeller
                    </xsl:with-param>
                  </xsl:call-template>
                  Yes
                </label>
              </div>
              <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/PrchsOrEntrAgrmtWithSellrInd"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/PrchsOrEntrAgrmtWithSellrInd"/>
                      <xsl:with-param name="BackupName">
                        IRS8594PurchaseOrEnterAgrmtWithSeller
                      </xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <span style="width:8px"/>
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form8594Data/PrchsOrEntrAgrmtWithSellrInd"/>
                    <xsl:with-param name="BackupName">
                      IRS8594PurchaseOrEnterAgrmtWithSeller
                    </xsl:with-param>
                  </xsl:call-template>
                  No
                </label>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:145mm;">
              If "Yes," attach a statement that specifies
              <span class="styBoldText">(a)</span>
              the type of agreement and
              <span class="styBoldText">(b)</span>
              the maximum amount of
            </div>
          </div>
          <div class="styTBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:145mm;"> consideration (not including interest) paid or to be paid under the agreement. See instructions. </div>
          </div>
          <!-- Page Break -->
          <!-- Footer -->
          <div class="pageEnd" style="width:187mm;">
            <div style="float:left;">
              <span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>
              <span style="width:80px;"/>
              Cat. No. 63768Z
            </div>
            <div style="float:right;">
              <span style="width:80px;"/>
              Form
              <span class="styBoldText">8594</span>
              (Rev. 12-2012)
            </div>
          </div>
           <p style="page-break-before: always"/> 
          <!--Begin Page 2 -->
          <!-- Header -->
          <div class="styTBB" style="width:187mm;">
            <div style="float:left;">
              Form 8594 (Rev. 12-2012)
              <span style="width:130mm;"/>
            </div>
            <div style="float:right;">
              Page
              <span style="font-weight:bold;font-size:7pt;">2</span>
            </div>
          </div>         
          <!-- BEGIN Part III Title -->
          <div class="styBB" style="width:187mm; height:8mm;">
            <div class="styPartName">Part III </div>
            <div class="styPartDesc" style="width:173mm;font-weight:normal;"><b>Supplemental Statement &#8212; </b>
                Complete only if amending an original statement or previously filed supplemental statement 
                because of an increase or decrease in consideration. See instructions.			
            </div>
          </div>
          <!-- END Part III Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">7</div>
            <div class="styLNDesc" style="width:178mm;height:9.5mm;">
              Tax year and tax return form number with which the original Form 8594 and any supplemental statements were filed.
              <br/>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8594Data/OrignalFormFiledTaxYear"/>
              </xsl:call-template>
              <span style="width:16px;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8594Data/TaxReturnFormNumberDsc"/>
              </xsl:call-template>
            </div>
          </div>
          <div class="styIRS8594TableContainer">
            <!-- print logic -->
            <xsl:call-template name="SetInitialState"/>
            <!-- end -->
            <table class="styTable" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr>
                  <th class="styTableCellHeader" style="width:31mm;text-align:left;" scope="col">
                    <span class="styBoldText" style="width:24px;padding-left:1mm;">8</span>
                    <span style="font-weight:normal;padding-left:6mm;"> Assets </span>
                  </th>
                  <th class="styTableCellHeader" style="width:61mm;font-weight:normal;" scope="col">Allocation of sales price as previously reported</th>
                  <th class="styTableCellHeader" style="width:37mm;font-weight:normal;" scope="col">Increase or (decrease)</th>
                  <th class="styTableCellHeader" style="width:58mm;border-right-width: 0px;font-weight:normal;" scope="col">Redetermined allocation of sales price</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <tr>
                  <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;"> Class I </td>
                  <td class="styTableCellText" style="width:61mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class1PrevPriceAllocationAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:37mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/AggregateValuesListedIndAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class1RedeterminedAllocnAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;"> Class II </td>
                  <td class="styTableCellText" style="width:61mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class2PrevPriceAllocationAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:37mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class2IncreaseDecreaseAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class2RedeterminedAllocnAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;"> Class III </td>
                  <td class="styTableCellText" style="width:61mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class3PrevPriceAllocationAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:37mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class3IncreaseDecreaseAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class3RedeterminedAllocnAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;"> Class IV </td>
                  <td class="styTableCellText" style="width:61mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class4PrevPriceAllocationAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:37mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class4IncreaseDecreaseAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class4RedeterminedAllocnAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;"> Class V </td>
                  <td class="styTableCellText" style="width:61mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class5PrevPriceAllocationAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:37mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class5IncreaseDecreaseAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class5RedeterminedAllocnAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;"> Class VI and VII </td>
                  <td class="styTableCellText" style="width:61mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class6And7PrevPriceAllocnAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:37mm;padding-top:5mm;text-align:right;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class6And7IncreaseDecreaseAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/Class6And7RedetermAllocnAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;border-bottom-width: 0px;"> Total </td>
                  <td class="styTableCellText" style="width:61mm;padding-top:5mm;text-align:right;border-bottom-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/TotalOfPreviousPriceAllocnAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                  <td class="styTableCellText" style="width:37mm;background-color:lightgrey;border-bottom-width: 0px;">
                    <span style="width:1px;"/>
                  </td>
                  <td class="styTableCellText" style="width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;border-bottom-width: 0px;">
                    <span style="width:4px; float:left;padding-left:.5mm;">$</span>
                    <span style="width:2px;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8594Data/TotalRedeterminedAllocationAmt"/>
                    </xsl:call-template>
                    <span style="width:4px;"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">9</div>
            <div class="styLNDesc" style="width:178mm;height:auto;">
              Reason(s) for increase or decrease. Attach additional sheets if more space is needed.
              <span style="width:1px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8594Data/IncreaseOrDecreaseReasonsDsc"/>
              </xsl:call-template>
              <xsl:if test="count($Form8594Data/IncreaseOrDecreaseReasonsDsc) !=0 and ($Form8594Data/IncreaseOrDecreaseReasonsDsc !='')">
                <br/>
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8594Data/IncreaseOrDecreaseReasonsDsc"/>
                </xsl:call-template>
              </xsl:if>
            </div>
            <!--Empty rows -->
            <xsl:if test="not($Form8594Data/IncreaseOrDecreaseReasonsDsc)  or $Form8594Data/IncreaseOrDecreaseReasonsDsc=''">
              <div class="styGenericDiv">
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;">
                  <br/>
                  <br/>
                </div>
                <br/>
                <br/>
              </div>
            </xsl:if>
          </div>
          <!-- Footer -->
          <div style="width:187mm;">
            <div class="stySmallText" style="width:130mm;text-align:center;padding-top:1mm;">
              <span style="width:156px"/>
            </div>
            <div style="width:46mm;text-align:right;float:right;">
              Form
              <span class="styBoldText" style="font-size:8pt;">8594</span>
              (Rev. 12-2012)
            </div>
          </div>
           <p style="page-break-before: always"/> 
          <!--<br class="pageEnd"/>-->
          <!-- BEGIN Left Over Table -->
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle"> Additional Data </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form8594Data"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>