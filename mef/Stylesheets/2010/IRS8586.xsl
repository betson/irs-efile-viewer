<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8586Style.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form8586Data" select="$RtnDoc/IRS8586"/>
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8586Data)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <meta name="Description" content="Form 8586"/>
        <META name="GENERATOR" content="IBM WebSphere Studio"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <!--********************************************************************************************
                HINTS: Line 2 (i) and 9 (i) to adjust these go to the Additional Data Section.
                           As of TY2008 there is no separated print for line 2(i)-(iv) and line 9(i)-(iv)
                           because the limit is 4 for (i) - (iv).
          ************************************************************************************************ -->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8586Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form id="Form8586">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:30mm;height:20.7mm;">
              <div style="height:9mm;">Form<span class="styFormNumber">  8586</span>
                <br/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8586Data"/>
              </xsl:call-template>
              <br/>
              </div>
              <div style="padding-top:1.5mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
                <span style="padding-left:1.0mm;">(99)</span>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;height:10mm;">
              <div class="styMainTitle" style="height:12mm;padding-top:1.5mm;">
                Low-Income Housing Credit
              </div>
              <div class="styFMT" style="height:4mm;font-size:7pt;padding-top:4mm;">
                <!--<img src="{$ImagePath}/8586_Bullet_Title.gif" alt="Arrow Bullet"/> See instructions on back.<br/>-->
                <img src="{$ImagePath}/8586_Bullet_Title.gif" alt="Arrow Bullet"/> Attach to your tax return.
          </div>
            </div>
            <div class="styTYBox" style="width:32mm;height:17mm;">
              <div class="styOMB" style="height:3mm;padding-top:.0mm;">OMB No. 1545-0984</div>
              <div class="styTaxYear" style="height:10.1mm;font-size:24pt;padding-top:0mm;padding-bottom:0mm;">
                20<span class="styTYcolor">10</span>
              </div>
              <div style="height:5mm;padding-left:5mm;text-align:left;border-bottom-width:25px;">
                 Attachment Sequence No. <span class="styBoldText" style="font-size:8pt">36a</span>
              </div>
            </div>
          </div>
          <!-- End Form title -->
          <!--Start Name and EIN Line-->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="font-size:7pt; width:151mm; height:8mm">
              Name(s) shown on return<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
              </xsl:call-template>
            </div>
            <div style="height:4mm;padding-left:2mm;font-size:7pt;font-family:verdana;" class="styEINBox">
          Identifying number<br/>
              <br/>
              <span style="font-weight:normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- BEGIN Part I Line Items -->
          <!-- Start Part I - Header -->
          <div class="styBB" style="width:187mm;">
            <span class="styPartName" style="width:16mm;">Part I</span>
            <span class="styPartDesc" style="width:170mm;">
              Buildings Placed in Service Before 2008
            </span>
          </div>
          <!-- end Part I - Header -->
          <!-- Start Line 1 row 1-->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD">1</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left">Number of Forms 8609-A attached for buildings placed in service before 2008</span>
              <!--Dotted Line-->
              <span class="styBoldText" style="float:right;padding-right:1mm;">
                <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.                
              </span>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB"/>
          </div>
          <!-- End Line 1row 1 -->
          <!-- Start Line 1 row 2-->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD"/>
            <div class="styLNDesc" style="width:109mm;">
              <!--Dotted Line-->
              <span class="styBoldText" style="float:left;">
                <span/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              <span style="float:right; margin-right:2mm;">
                <img src="{$ImagePath}/8586_Bullet_L1.gif" alt="Arrow Bullet"/>
              </span>
            </div>
            <div class="styIRS8586DotBB" style="width:27mm; margin-right:3mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="MaxSize" select="4"/>
                <xsl:with-param name="TargetNode" select="$Form8586Data/NumberOfForms8609AAtchBF2008"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB"/>
          </div>
          <!-- End Line 1 row 2-->
          <!-- Start Line 2 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD">2</div>
            <div class="styLNDesc" style="width:139mm;">
              Has there been a decrease in the qualified basis of any buildings accounted for on line 1 since the close of the preceding tax year?
              <span style="width:2mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsBF2008"/>
                </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsBF2008"/>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:1mm;"/>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsBF2008"/>
                </xsl:call-template>
                <b> Yes </b>
              </label>
              <span style="width:2mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsBF2008"/>
                </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsBF2008"/>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:1mm;"/>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsBF2008"/>
                </xsl:call-template>
                <b>No </b>
              </label>
              <span style="width:2mm;"/>  
                If "Yes," enter the building identification numbers (BINs) of the buildings that had a decreased basis. If you need more space, attach a schedule.
                <span style="width:1mm;"/>
              <!--Push Pin Image -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8586Data/BldgIdOfBldgWithDecreasedBasis"/>
              </xsl:call-template>
            </div>
            <div class="styGenericDiv">
              <div class="styLNRightNumBoxNBB" style="width:8mm;height:11mm;padding-top:0px; background-color:lightgrey"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:11mm;padding-top:0px;"/>
            </div>
          </div>
          <xsl:variable name="ESCount" select="count($Form8586Data/BldgIdOfBldgWithDecreasedBasis)"/>
          <xsl:variable name="containerHeight" select="5"/>
          <xsl:variable name="preMax">
            <xsl:choose>
              <xsl:when test="$ESCount mod 4 = 0">
                <xsl:value-of select="$ESCount div 4"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="ceiling($ESCount div 4)"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <div class="styIRS8586TableContainer" id="part1TPctn">
            <xsl:attribute name="style"><xsl:if test="$ESCount &gt; $containerHeight">
            height:4mm;  
          </xsl:if></xsl:attribute>
            <!-- print logic -->
            <!--      <xsl:call-template name="SetInitialState"/>-->
            <!-- end -->
            <table class="styIRS8586Table" cellpadding="0" cellspacing="0" border="0">
              <xsl:choose>
                <xsl:when test="($Print!=$Separated) or (($Print = $Separated) and (count($Form8586Data/BldgIdOfBldgWithDecreasedBasis) &lt;5))">
                  <xsl:call-template name="partI3bLoop">
                    <xsl:with-param name="ESCount" select="$ESCount"/>
                    <xsl:with-param name="max">
                      <xsl:choose>
                        <xsl:when test="$preMax = 0">
                          <xsl:value-of select="1"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="$preMax"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <tr>
                    <th style="width:6mm">
          (i)
      </th>
                    <td style="text-align:left;font-size: 7pt" class="styIRS8586DotBB">
                      <xsl:if test="($Print = $Separated) and (count($Form8586Data/BldgIdOfBldgWithDecreasedBasis) &gt;4)">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form8586Data/BldgIdOfBldgWithDecreasedBasis"/>
                        </xsl:call-template>
                      </xsl:if>
                      <span class="styTableCellPad"/>
                    </td>
                    <td style="width:2mm"/>
                    <th style="width:6mm">
          (ii)
      </th>
                    <td style="text-align:left;" class="styIRS8586DotBB">
                      <span class="styTableCellPad"/>
                    </td>
                    <td style="width:2mm"/>
                    <th style="width:6mm">
          (iii)
      </th>
                    <td style="text-align:left;" class="styIRS8586DotBB">
                      <span class="styTableCellPad"/>
                    </td>
                    <td style="width:2mm"/>
                    <th style="width:6mm">
          (iv)
      </th>
                    <td style="text-align:left;background-color:blue;" class="styIRS8586DotBB">
                      <span class="styTableCellPad"/>
                    </td>
                    <td style="width:6.2mm"/>
                    <td style="border-left:1 solid black; width:8mm; background-color:lightgrey"/>
                    <td style="border-left:1 solid black; width:32mm;"/>
                  </tr>
                </xsl:otherwise>
              </xsl:choose>
            </table>
          </div>
          <!-- End Line 2 -->
          <!-- Start Line 3 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">3</div>
              <div class="styLNDesc" style="width:139mm;">
              Current year credit from attached Form(s) 8609-A for buildings placed in service before 2008 
              <span style="float:left">(see instructions)
              <!--Push Pin image -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form8586Data/CurrentYearCreditBF2008"/>
                  </xsl:call-template>
                </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">3</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/CurrentYearCreditBF2008"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 3 -->
          <!-- Start Line 4 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">4</div>
              <div class="styLNDesc" style="width:139mm;">
                Low-income housing credit for buildings placed in service before 2008, from partnerships, S corporations, 
                <span style="float:left;">estates, and trusts </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">4</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/LowIncomeHousingCreditsBF2008"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 4 -->
          <!-- Start Line 5 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">5</div>
              <div class="styLNDesc" style="width:139mm;">
                Add lines 3 and 4. Estates and trusts, go to line 6; partnerships and S corporations, report this amount  
                <span style="float:left;">on Schedule K; all others, report this amount on Form 3800, line 1d
                </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">5</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/LowIncmHsnCrPlusCurrYrCrBF2008"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 5 -->
          <!-- Start Line 6 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="padding-top:4mm;">6</div>
              <div class="styLNDesc" style="width:139mm;padding-top:4mm;">
                <span style="float:left;">Amount allocated to beneficiaries of the estate or trust (see instructions) </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">6</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/AmountAllocatedtoBeneficiaries"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 6 -->
          <!-- Start Line 7 -->
          <div class="styBB" style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="padding-top:4mm;">7</div>
              <div class="styLNDesc" style="width:139mm;padding-top:4mm;">
                <span style="float:left;">Estates and trusts. Subtract line 6 from line 5. Report this amount on Form 3800, line 1d </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">7</div>
              <div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/PassiveActivityOrTotCurrYearCr"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 7 -->
          <!-- Start Part II - Header -->
          <div class="styBB" style="width:187mm;">
            <span class="styPartName" style="width:16mm;">Part II</span>
            <span class="styPartDesc" style="width:170mm;">
              Buildings Placed in Service After 2007
            </span>
          </div>
          <!-- end Part II - Header -->
          <!-- Start Line 8 row 1-->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD">8</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left">Number of Forms 8609-A attached for buildings placed in service after 2007</span>
              <!--Dotted Line-->
              <span class="styBoldText" style="float:right;padding-right:1mm;">
                <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB"/>
          </div>
          <!-- End Line 8 row 1 -->
          <!-- Start Line 8 row 2-->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD"/>
            <div class="styLNDesc" style="width:109mm;">
              <!--Dotted Line-->
              <span class="styBoldText" style="float:left;">
                <span/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              <span style="float:right; margin-right:2mm">
                <img src="{$ImagePath}/8586_Bullet_L1.gif" alt="Arrow Bullet"/>
              </span>
            </div>
            <div class="styIRS8586DotBB" style="width:27mm; margin-right:3mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="MaxSize" select="4"/>
                <xsl:with-param name="TargetNode" select="$Form8586Data/NumberOfForms8609AAtchAF2007"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB"/>
          </div>
          <!-- End Line 8 row 2-->
          <!-- Start Line 9 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD">9</div>
            <div class="styLNDesc" style="width:139mm;">
              Has there been a decrease in the qualified basis of any buildings accounted for on line 8 since the close of the preceding tax year?
              <span style="width:2mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrQlfyBasisOfBuildingsAF2007"/>
                </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8586Data/DecrQlfyBasisOfBuildingsAF2007"/>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:1mm;"/>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrQlfyBasisOfBuildingsAF2007"/>
                </xsl:call-template>
                <b> Yes </b>
              </label>
              <span style="width:2mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrQlfyBasisOfBuildingsAF2007"/>
                </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8586Data/DecrQlfyBasisOfBuildingsAF2007"/>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:1mm;"/>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrQlfyBasisOfBuildingsAF2007"/>
                </xsl:call-template>
                <b>No </b>
              </label>
              <span style="width:2mm;"/>  
                If "Yes," enter the building identification numbers (BINs) of the buildings that had a decreased basis. If you need more space, attach a schedule.
                <span style="width:1mm;"/>
              <!--Push Pin Image -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsAF2007"/>
              </xsl:call-template>
            </div>
            <div class="stygenericDiv">
              <div class="styLNRightNumBoxNBB" style="width:8mm;height:11mm; background-color:lightgrey"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:11mm"/>
            </div>
          </div>
          <!--Start (i) row -->
          <xsl:variable name="ES9Count" select="count($Form8586Data/DecrInQlfyBasisOfBldgsAF2007)"/>
          <xsl:variable name="containerHeight9" select="5"/>
          <xsl:variable name="preMax9">
            <xsl:choose>
              <xsl:when test="$ES9Count mod 4 = 0">
                <xsl:value-of select="$ES9Count div 4"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="ceiling($ES9Count div 4)"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <div class="styIRS8586TableContainer" id="part1TPctn">
            <xsl:attribute name="style"><xsl:if test="$ES9Count &gt; $containerHeight">
            height:4mm;  
          </xsl:if></xsl:attribute>
            <!-- print logic -->
            <!--      <xsl:call-template name="SetInitialState"/>-->
            <!-- end -->
            <table class="styIRS8586Table" cellpadding="0" cellspacing="0" border="0">
              <xsl:choose>
                <xsl:when test="($Print!=$Separated) or (($Print = $Separated) and (count($Form8586Data/DecrInQlfyBasisOfBldgsAF2007) &lt;5))">
                  <xsl:call-template name="partII9bLoop">
                    <xsl:with-param name="ES9Count" select="$ES9Count"/>
                    <xsl:with-param name="max">
                      <xsl:choose>
                        <xsl:when test="$preMax9 = 0">
                          <xsl:value-of select="1"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="$preMax9"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <tr>
                    <th style="width:6mm">
          (i)
      </th>
                    <td style="text-align:left;font-size: 7pt" class="styIRS8586DotBB">
                      <xsl:if test="($Print = $Separated) and (count($Form8586Data/DecrInQlfyBasisOfBldgsAF2007) &gt;4)">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsAF2007"/>
                        </xsl:call-template>
                      </xsl:if>
                      <span class="styTableCellPad"/>
                    </td>
                    <td style="width:2mm"/>
                    <th style="width:6mm">
          (ii)
      </th>
                    <td style="text-align:left;" class="styIRS8586DotBB">
                      <span class="styTableCellPad"/>
                    </td>
                    <td style="width:2mm"/>
                    <th style="width:6mm">
          (iii)
      </th>
                    <td style="text-align:left;" class="styIRS8586DotBB">
                      <span class="styTableCellPad"/>
                    </td>
                    <td style="width:2mm"/>
                    <th style="width:6mm">
          (iv)
      </th>
                    <td style="text-align:left;background-color:blue;" class="styIRS8586DotBB">
                      <span class="styTableCellPad"/>
                    </td>
                    <td style="width:6.2mm"/>
                    <td style="border-left:1 solid black; width:8mm; background-color:lightgrey"/>
                    <td style="border-left:1 solid black; width:32mm;"/>
                  </tr>
                </xsl:otherwise>
              </xsl:choose>
            </table>
          </div>
          <!-- End Line 9 -->
          <!-- Start Line 10 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">10</div>
              <div class="styLNDesc" style="width:139mm;">
              Current year credit from attached Form(s) 8609-A for buildings placed in service after 2007
              <span style="float:left"> (see instructions)
              <!--Push Pin image -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form8586Data/CurrentYearCreditAF2007"/>
                  </xsl:call-template>
                </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">10</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/CurrentYearCreditAF2007"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 10 -->
          <!-- Start Line 11 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">11</div>
              <div class="styLNDesc" style="width:139mm;">
                Low-income housing credit for buildings placed in service after 2007, from partnerships, S corporations, 
                <span style="float:left;">estates, and trusts </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">11</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/LowIncomeHousingCreditsAF2007"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 11 -->
          <!-- Start Line 12 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">12</div>
              <div class="styLNDesc" style="width:139mm;">
                Add lines 10 and 11. Partnerships and S corporations, report this amount on Schedule K; all others,  
                <span style="float:left;">continue to line 13
                </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">12</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/LowIncmHsnCrPlusCurrYrCrAF2007"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 12 -->
          <!-- Start Line 13 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-top:4mm;">13</div>
              <div class="styLNDesc" style="width:139mm;padding-top:4mm;">
                <span style="float:left;">Low-income housing credit included on line 12 from passive activities (see instructions) </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">13</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/LowIncmHsingCredPassive"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 13 -->
          <!-- Start Line 14 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-top:4mm;">14</div>
              <div class="styLNDesc" style="width:139mm;padding-top:4mm;">
                <span style="float:left;">Subtract line 13 from line 12 </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">14</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/LowIncHsgCrLowIncHsgCredResult"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 14 -->
          <!-- Start Line 15 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-top:4mm;">15</div>
              <div class="styLNDesc" style="width:139mm;padding-top:4mm;">
                <span style="float:left;">Low-income housing credit allowed for 2010 from a passive activity (see instructions) </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">15</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/LowIncHsingCreditPYPassive"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 15 -->
          <!-- Start Line 16 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-top:4mm;">16</div>
              <div class="styLNDesc" style="width:139mm;padding-top:4mm;">
                <span style="float:left;">Carryforward of low-income housing credit to 2010 (see instructions) </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.                
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">16</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/CarryForwardLowIncCredit"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 16 -->
          <!-- Start Line 17 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-top:4mm;">17</div>
              <div class="styLNDesc" style="width:139mm;padding-top:4mm;">
                <span style="float:left;">Carryback of low-income housing credit from 2011 (see instructions) </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">17</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/CarryBackLowIncHsingCred"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 17 -->
          <!-- Start Line 18 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">18</div>
              <div class="styLNDesc" style="width:139mm;">
                Add lines 14 through 17. Estates and trusts, go to line 19; all others, report this amount on Form 3800,   
                <span style="float:left;">line 29d
                </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">18</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/SumPartIIFormLines"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 18 -->
          <!-- Start Line 19 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-top:4mm;">19</div>
              <div class="styLNDesc" style="width:139mm;padding-top:4mm;">
                <span style="float:left;">Amount allocated to beneficiaries of the estate or trust (see instructions) </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">19</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/AmtAlloctoBeneficiaries"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 19 -->
          <!-- Start Line 20 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-top:4mm;">20</div>
              <div class="styLNDesc" style="width:139mm;padding-top:4mm;">
                <span style="float:left;"><b>Estates and trusts.</b> Subtract line 19 from line 18. Report this amount on Form 3800, line 29d </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">20</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/EstatesAndTrustsResult"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Line 20 -->
          <!-- Start Page footer -->
          <div style="border-top:1 solid Black; font-size:7pt; width:187mm">
            <div style="font-weight:bold; float:left; padding-top:0.5mm">
              For Paperwork Reduction Act Notice, see instructions.
            </div>
            <div style="float:right">
              Cat. No. 63987I
              <span style="width:45mm"/>
                Form <b style="font-size:9pt">8586</b> (2010)
            </div>
          </div>
          <p style="page-break-before:always"/>
          <!-- end Page footer -->
          <!--Start ADDITIONAL DATA PAGE -->
          <div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
            <div class="styLeftOverTitle">
              Additional Data        
          </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form8586Data"/>
            </xsl:call-template>
          </table>
          <!-- end ADDITIONAL DATA PAGE -->
          <!--start Separated Print for Part I, Line 2: HINTS:as of TY2008 there is no separated print for Part 1, Line 2(i) - (iv) -->
          <xsl:if test="($Print = $Separated) and (count($Form8586Data/BldgIdOfBldgWithDecreasedBasis) &gt;4)">
            <br/>
            <span class="styRepeatingDataTitle">Form 8586, Part I, Line 2 - Building Identification Numbers</span>
            <table class="styDepTbl" style="font-size: 7pt">
              <thead class="styTableThead"/>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form8586Data/BldgIdOfBldgWithDecreasedBasis">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <th style="width:12mm; text-align: left">
          (<xsl:number value="position()" format="i"/>)
      </th>
                    <td style="text-align:left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="."/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!--start Separated Print for Part II, Line 9 HINTS:as of TY2008 there is no separated print for Part 2, Line 9(i) - (iv)-->
          <xsl:if test="($Print = $Separated) and (count($Form8586Data/DecrInQlfyBasisOfBldgsAF2007) &gt;4)">
            <br/>
            <span class="styRepeatingDataTitle">Form 8586, Part II, Line 9 - Building Identification Numbers</span>
            <table class="styDepTbl" style="font-size: 7pt">
              <thead class="styTableThead"/>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form8586Data/DecrInQlfyBasisOfBldgsAF2007">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <th style="width:12mm; text-align: left">
          (<xsl:number value="position()" format="i"/>)
      </th>
                    <td style="text-align:left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="."/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
        </form>
      </body>
    </html>
  </xsl:template>
  <!--*******************
       Part I line 2(i)-(iv)
       *******************-->
  <xsl:template name="partI3bLoop">
    <xsl:param name="index" select="1"/>
    <xsl:param name="max"/>
    <xsl:if test="$index &lt;= $max">
      <tr>
        <th style="width:6mm">
          <xsl:if test="(($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BldgIdNbrBF2008[$index*4-3]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4-3" format="i"/>)
        </xsl:if>
        </th>
        <td style="text-align:left;">
          <xsl:attribute name="class"><xsl:if test="($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BldgIdNbrBF2008[$index*4-3]) or ($index*4-3 &lt; 5)">
            styIRS8586DotBB
          </xsl:if></xsl:attribute>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/BldgIdOfBldgWithDecreasedBasis/BldgIdNbrBF2008[$index*4-3]"/>
          </xsl:call-template>
        </td>
        <td style="width:2mm"/>
        <th style="width:6mm">
          <xsl:if test="(($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BldgIdNbrBF2008[$index*4-2]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4-2" format="i"/>)
        </xsl:if>
        </th>
        <td style="text-align:left;">
          <xsl:attribute name="class"><xsl:if test="($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BldgIdNbrBF2008[$index*4-2]) or ($index*4-3 &lt; 5)">
            styIRS8586DotBB
          </xsl:if></xsl:attribute>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/BldgIdOfBldgWithDecreasedBasis/BldgIdNbrBF2008[$index*4-2]"/>
          </xsl:call-template>
        </td>
        <td style="width:2mm"/>
        <th style="width:6mm">
          <xsl:if test="(($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BldgIdNbrBF2008[$index*4-1]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4-1" format="i"/>)
        </xsl:if>
        </th>
        <td style="text-align:left;">
          <xsl:attribute name="class"><xsl:if test="($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BldgIdNbrBF2008[$index*4-1]) or ($index*4-3 &lt; 5)">
            styIRS8586DotBB
          </xsl:if></xsl:attribute>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/BldgIdOfBldgWithDecreasedBasis/BldgIdNbrBF2008[$index*4-1]"/>
          </xsl:call-template>
        </td>
        <td style="width:2mm"/>
        <th style="width:6mm">
          <xsl:if test="(($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BldgIdNbrBF2008[$index*4]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4" format="i"/>)
        </xsl:if>
        </th>
        <td style="text-align:left;">
          <xsl:attribute name="class"><xsl:if test="($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BldgIdNbrBF2008[$index*4]) or ($index*4-3 &lt; 5)">
            styIRS8586DotBB
          </xsl:if></xsl:attribute>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/BldgIdOfBldgWithDecreasedBasis/BldgIdNbrBF2008[$index*4]"/>
          </xsl:call-template>
        </td>
        <td style="width:6.2mm"/>
        <td style="border-left:1 solid black; width:8mm; background-color:lightgrey"/>
        <td style="border-left:1 solid black; width:32mm"/>
      </tr>
      <xsl:call-template name="partI3bLoop">
        <xsl:with-param name="index" select="$index+1"/>
        <xsl:with-param name="max" select="$max"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <!-- **********************
        Part II,Line 9(i)-(iv)
        ********************** -->
  <xsl:template name="partII9bLoop">
    <xsl:param name="index" select="1"/>
    <xsl:param name="max"/>
    <xsl:if test="$index &lt;= $max">
      <tr>
        <th style="width:6mm">
          <xsl:if test="(($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BldgIdNbrAF2007[$index*4-3]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4-3" format="i"/>)
        </xsl:if>
        </th>
        <td style="text-align:left;">
          <xsl:attribute name="class"><xsl:if test="($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BldgIdNbrAF2007[$index*4-3]) or ($index*4-3 &lt; 5)">
            styIRS8586DotBB
          </xsl:if></xsl:attribute>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BldgIdNbrAF2007[$index*4-3]"/>
          </xsl:call-template>
        </td>
        <td style="width:2mm"/>
        <th style="width:6mm">
          <xsl:if test="(($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BldgIdNbrAF2007[$index*4-2]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4-2" format="i"/>)
        </xsl:if>
        </th>
        <td style="text-align:left;">
          <xsl:attribute name="class"><xsl:if test="($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BldgIdNbrAF2007[$index*4-2]) or ($index*4-3 &lt; 5)">
            styIRS8586DotBB
          </xsl:if></xsl:attribute>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BldgIdNbrAF2007[$index*4-2]"/>
          </xsl:call-template>
        </td>
        <td style="width:2mm"/>
        <th style="width:6mm">
          <xsl:if test="(($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BldgIdNbrAF2007[$index*4-1]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4-1" format="i"/>)
        </xsl:if>
        </th>
        <td style="text-align:left;">
          <xsl:attribute name="class"><xsl:if test="($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BldgIdNbrAF2007[$index*4-1]) or ($index*4-3 &lt; 5)">
            styIRS8586DotBB
          </xsl:if></xsl:attribute>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BldgIdNbrAF2007[$index*4-1]"/>
          </xsl:call-template>
        </td>
        <td style="width:2mm"/>
        <th style="width:6mm">
          <xsl:if test="(($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BldgIdNbrAF2007[$index*4]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4" format="i"/>)
        </xsl:if>
        </th>
        <td style="text-align:left;">
          <xsl:attribute name="class"><xsl:if test="($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BldgIdNbrAF2007[$index*4]) or ($index*4-3 &lt; 5)">
            styIRS8586DotBB
          </xsl:if></xsl:attribute>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BldgIdNbrAF2007[$index*4]"/>
          </xsl:call-template>
        </td>
        <td style="width:6.2mm"/>
        <td style="border-left:1 solid black; width:8mm; background-color:lightgrey"/>
        <td style="border-left:1 solid black; width:32mm"/>
      </tr>
      <xsl:call-template name="partII9bLoop">
        <xsl:with-param name="index" select="$index+1"/>
        <xsl:with-param name="max" select="$max"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>


