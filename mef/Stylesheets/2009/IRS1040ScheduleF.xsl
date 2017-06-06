<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1040ScheduleFStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form1040ScheduleFData" select="$RtnDoc/IRS1040ScheduleF"/>
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form1040ScheduleFData)"/>
          </xsl:call-template>
        </title>
        <!--  No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 1040ScheduleF"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!-- Form 1040ScheduleF CSS Styles are located in the template called below -->
            <xsl:call-template name="IRS1040ScheduleFStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if >
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form1040ScheduleF">
          <!-- WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Number and Name -->
          <!-- put comment here -->
          <div class="styBB" style="width:187mm;height:20mm;">
            <div class="styFNBox" style="width:31mm;height:21.75mm;">
              <div style="padding-top:1mm;line-height:180%;">
                <span class="styFormNumber" style="font-size:9pt;">SCHEDULE F</span>
                <br/>
                <span class="styFormNumber" style="font-size:9pt;padding-top:2mm;">(Form 1040)</span>
                <br/>
              </div>
              <div style="padding-top:5mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service <span style="width:3mm"/> (99)</span>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;height:21.75mm; padding-top:2mm;">
              <div class="styMainTitle" style="height:6mm;">Profit or Loss From Farming</div>
              <br/>
              <div class="styFBT" style="height:5mm;">
                <img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/> Attach to Form 1040, Form 1040NR, Form 1041, Form 1065, or Form 1065-B.<br/>
                <br/>
                <img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/> See Instructions for Schedule F (Form 1040).<br/>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:21.75mm;">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-0074</div>
              <div class="styTaxYear">
          20<span class="styTYColor">09</span>
              </div>
              <div style="margin-left:3mm; text-align:left;">
          Attachment<br/>Sequence No. <span class="styBoldText">14</span>
              </div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:140mm;height:8mm;font-size:7pt;">
        Name of proprietor<br/>
              <!--  <span class="stySmallText">-->
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/NameOfProprietor/BusinessNameLine1"/>
              </xsl:call-template>
              <!--  </span>-->
              <br/>
              <!--  <span class="stySmallText">-->
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/NameOfProprietor/BusinessNameLine2"/>
              </xsl:call-template>
              <!--  </span>-->
              <br/>
            </div>
            <div class="styEINBox" style="width:45mm;height:8mm;font-size:7pt;padding-left:2mm;">
        Social security number (SSN)<br/>
              <br/>
              <span class="styEINFld" style="width:30mm; text-align:left;font-weight:normal;">
                <!--          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>  -->
              </span>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="width:3mm; height:4.5mm;padding-left: 0px">A</div>
            <div class="styNameBox" style="width:135mm;height:8mm;padding-top:1mm;font-size:7pt;border-right-width: 0px;">
              <span style="width:4px;"/>
        Principal product. Describe in one or two words your principal crop or activity for the current tax year.<br/>
              <span style="width:4px;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/PrincipalProduct"/>
              </xsl:call-template>
            </div>
            <div class="styForm1040ScheduleFEINFullBox" style="width:47mm;height:10.5mm;float:right;">
              <div class="styLNLeftNumBox" style="width:4mm; height:4.5mm;">B</div>
              <span style="width:2px;"/>
              <span style="padding-top:2.5mm;">Enter code from Part IV</span>
              <br/>
              <span style="padding-left:5.5mm;">
                <img src="{$ImagePath}/1040SchF_Bullet_Lg.gif" alt="Bullet Image"/>
              </span>
              <span class="styEINFld" style="width:30mm;font-size:6pt; text-align:center;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/AgriculturalActivityCode"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- stop here -->
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="width:3mm; height:4.5mm;padding-top:1mm;padding-left: 0px;">C</div>
            <div class="styLNDesc" style="width:137mm;height:7.5mm;padding-top:1mm;">
        Accounting method:
        <span style="width:80px;"/>
              <span class="styBoldText">(1)<span style="width: 2mm;"/>
              </span>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/AccountingMethodCash"/>
                  <xsl:with-param name="BackupName">IRS1040ScheduleFAccountingMethodCash</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/AccountingMethodCash"/>
                  <xsl:with-param name="BackupName">IRS1040ScheduleFAccountingMethodCash</xsl:with-param>
                </xsl:call-template>
          Cash
        </label>
              <span style="width:80px;"/>
              <span class="styBoldText">(2)<span style="width: 2mm;"/>
              </span>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/AccountingMethodAccrual"/>
                  <xsl:with-param name="BackupName">IRS1040ScheduleFAccountingMethodAccrual</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/AccountingMethodAccrual"/>
                  <xsl:with-param name="BackupName">IRS1040ScheduleFAccountingMethodAccrual</xsl:with-param>
                </xsl:call-template>
          Accrual
        </label>
            </div>
            <div class="styOMB" style="width:47mm;height:4.5mm;border-left-width:1px;float:right; border-bottom-width:0px;">
              <div class="styLNLeftNumBox" style="width:4mm; height:2.5mm;font-size:6pt;font-weight:bold;padding-bottom:1.5mm;padding-left:1.5mm;">D</div>
              <span style="width:2px;"/>
              <span style="padding-top:1.5mm;font-size:6pt;font-weight:bold;">Employer ID number (EIN), if any</span>
              <br/>
              <span class="styEINFld" style="width:30mm; text-align:center;">
                <xsl:choose>
                  <xsl:when test="normalize-space($Form1040ScheduleFData/EIN) != ''">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/EIN"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="normalize-space($Form1040ScheduleFData/MissingEINReason) != ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/MissingEINReason"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/EIN"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </span>
            </div>
            <br/>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;width:3mm;padding-top:1mm;padding-left: 0px">E</div>
            <div class="styLNDesc" style="width:152mm;height:4.5mm;padding-top:1.5mm;font-size:6pt;">
        Did you "materially participate" in the operation of this business during 2009? If “No," see page F-3 for limit on passive losses.          
      </div>
            <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/MateriallyParticipateIndicator"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox" name="Checkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/MateriallyParticipateIndicator"/>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:1px"/>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/MateriallyParticipateIndicator"/>
                </xsl:call-template>          
               Yes           
          </label>
            </div>
            <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/MateriallyParticipateIndicator"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox" name="Checkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/MateriallyParticipateIndicator"/>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:1px"/>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/MateriallyParticipateIndicator"/>
                </xsl:call-template>            
               No            
          </label>
            </div>
          </div>
          <!-- BEGIN Part I Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName">Part I</div>
            <div style="padding-left:3mm;width:160mm;">
              <b>Farm Income—Cash Method.</b> Complete Parts I and II (Accrual method. Complete Parts II and III, and Part I, line 11.)</div>
            <div style="width:160mm;padding-left:3mm;">Do not include sales of livestock held for draft, breeding, sport, or dairy purposes.  Report these sales on Form 4797.</div>
          </div>
          <!-- END Part I Title -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">1</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
        Sales of livestock and other items you bought for resale    
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.          
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">1</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/SalesOfLivestockBghtForResale"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
            <div class="styLNDesc" style="width:99mm;height:4;">Cost or other basis of livestock and other items reported on line 1
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px;"/>.
          <span style="width:16px;"/>.        
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">2</div>
            <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CostOfLivestockBoughtForResale"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">Subtract line 2 from line 1
        <!--Dotted Line-->
              <span class="styBoldText">
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
            <div class="styLNRightNumBox" style="height:4mm;">3</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/PurchasedProfit"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">Sales of livestock, produce, grains, and other products you raised
        <!--Dotted Line-->
              <span class="styBoldText">
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
            <div class="styLNRightNumBox" style="height:4mm;">4</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/SalesOfProductsRaised"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">5a</div>
            <div class="styLNDesc" style="width:67.5mm;height:4mm;font-size:6pt;">Cooperative distributions (Form(s) 1099-PATR)</div>
            <div class="styLNRightNumBox" style="height:4mm;">5a</div>
            <div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CooperativeDistributions"/>
              </xsl:call-template>
            </div>
            <div class="styLNDesc" style="width:31.5mm;height:4mm;">
              <span style="width:8px;"/>
              <span class="styBoldText"> 5b</span>
              <span style="width:8px;"/>
         Taxable amount
      </div>
            <div class="styLNRightNumBox" style="height:4mm;">5b</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CooperativeDistriTxblAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">6a</div>
            <div class="styLNDesc" style="width:67.5mm;height:4mm;">Agricultural program payments (see page F-3)</div>
            <div class="styLNRightNumBox" style="height:4mm;">6a</div>
            <div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/AgriculturalProgramPayments"/>
              </xsl:call-template>
            </div>
            <div class="styLNDesc" style="width:31.5mm;height:4mm;">
              <span style="width:8px;"/>
              <span class="styBoldText"> 6b</span>
              <span style="width:8px;"/>
         Taxable amount
      </div>
            <div class="styLNRightNumBox" style="height:4mm;">6b</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/AgriculturalProgramPymtTxblAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">7</div>
            <div class="styLNDesc" style="width:139mm;height:4;">Commodity Credit Corporation (CCC) loans (see page F-3):        
      </div>
            <div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">a</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">CCC loans reported under election
        <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CCCLoansReportedUnderElection"/>
              </xsl:call-template>
              <!--Dotted Line-->
              <span class="styBoldText">
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
            <div class="styLNRightNumBox" style="height:4mm;">7a</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CCCLoansReportedUnderElection"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:67.5mm;height:4mm;">CCC loans forfeited
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">7b</div>
            <div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CCCLoansForfeited"/>
              </xsl:call-template>
            </div>
            <div class="styLNDesc" style="width:31.5mm;height:4mm;">
              <span style="width:8px;"/>
              <span class="styBoldText"> 7c</span>
              <span style="width:8px;"/>
         Taxable amount
      </div>
            <div class="styLNRightNumBox" style="height:4mm;">7c</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CCCLoansForfeitedTaxableAmount"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
            <div class="styLNDesc" style="width:139mm;height:4;">Crop insurance proceeds and federal crop disaster payments (see page F-3):        
      </div>
            <div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">a</div>
            <div class="styLNDesc" style="width:67.5mm;height:4mm;">Amount received in 2009
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.          
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">8a</div>
            <div class="styLNAmountBox" 
            style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" 
                select="$Form1040ScheduleFData/FarmIncomeCashMethod/CropInsProceedsAndDisasterPymt"/>
              </xsl:call-template>
            </div>
            <div class="styLNDesc" style="width:31.5mm;height:4mm;">
              <span style="width:8px;"/>
              <span class="styBoldText"> 8b</span>
              <span style="width:8px;"/>
         Taxable amount
      </div>
            <div class="styLNRightNumBox" style="height:4mm;">8b</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" 
                select="$Form1040ScheduleFData/FarmIncomeCashMethod/CropInsProcAndDsstrPymtTxblAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">c</div>
            <div class="styLNDesc" style="width:80mm;height:4mm;">
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/ElectionToDeferCropInsProc"/>
                  <xsl:with-param name="BackupName">IRS1040ScheduleFElectionToDeferCropInsProc</xsl:with-param>
                </xsl:call-template>
          If election to defer to 2010 is attached, check here
          <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/ElectionToDeferCropInsProc"/>
                </xsl:call-template>
                <span style="width:5px;"/>
              </label>
              <img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/>
              <span style="width:2px;"/>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/ElectionToDeferCropInsProc"/>
                  <xsl:with-param name="BackupName">IRS1040ScheduleFElectionToDeferCropInsProc</xsl:with-param>
                </xsl:call-template>
              </input>
            </div>
            <div class="styLNDesc" style="width:59mm;height:4mm;">
              <span style="width:35px;"/>
              <span class="styBoldText"> 8d</span>
              <span style="width:8px;"/>
         Amount deferred from 2008
         <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px;"/>.                                  
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">8d</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CropInsProcDeferredFromPrevTY"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">9</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">Custom hire (machine work) income
        <!--Dotted Line-->
              <span class="styBoldText">
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
            <div class="styLNRightNumBox" style="height:4mm;">9</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CustomHireIncome"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">10</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">Other income, including federal and state gasoline or fuel tax credit or refund (see page F-4)
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px;"/>.
          <span style="width:16px;"/>.    
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">10</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/OtherIncmIncludingGasFuelTaxCr"/>
              </xsl:call-template>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">11</div>
            <div class="styLNDesc" style="width: 139mm; height:4mm;">
              <span class="styBoldText">Gross income. </span>
              <span style="font-size:7pt;"> Add amounts in the right column for lines 3 through 10. If you use the accrual method, enter </span>
           the amount from Part III, line 51
        
        <!--Dotted Line-->
              <span style="letter-spacing:12px; font-weight:bold;">..................... </span>
              <img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/>
            </div>
            <div class="styLNRightNumBoxNBB" style="height:8mm;">
              <br/>
      11
      </div>
            <div class="styLNAmountBoxNBB" style="height:8mm;">            
            &#160;<br/>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/GrossIncome"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- BEGIN Part II Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName">Part II</div>
            <div class="styPartDesc">Farm Expenses—Cash and Accrual Method. <br/>
              <span style="font-weight:normal;"> Do not </span>
              <span class="styNormalText">include personal or living expenses such as taxes, insurance, or repairs on your home.</span>
            </div>
          </div>
          <!-- END Part II Title -->
          <!-- BEGIN Part II Line Items -->
          <div class="styBB" style="width:187mm;clear:both;">
            <!-- BEGIN Left Side Table of Part II-->
            <table class="styTable" style="width:94mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
              <thead/>
              <tfoot/>
              <tbody>
                <tr>
                  <td class="styLNLeftNumBox" style="vertical-align:top;">12</td>
                  <td class="styGenericDiv" style="width:52mm;font-size:6pt;vertical-align:top;" colspan="2">
              Car and truck expenses (see page F-5). Also attach  <span class="styBoldText">  Form 4562 </span>
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <!--                <span style="width:16px"></span>.              -->
                    </span>
                  </td>
                  <td class="styLNRightNumBox">
              12
            </td>
                  <td class="styLNAmountBox" style="border-right-width:1px">
            &#160;
                <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/CarAndTruckExpenses"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox">13</td>
                  <td class="styGenericDiv" style="width:52mm" colspan="2">Chemicals
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
                  </td>
                  <td class="styLNRightNumBox">
              13
            </td>
                  <td class="styLNAmountBox" style="border-right-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/ChemicalsExpenses"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="vertical-align:top;">14</td>
                  <td class="styGenericDiv" style="width:52mm" colspan="2">
              Conservation expenses (see page F-5)
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
                  </td>
                  <td class="styLNRightNumBox">
              14
            </td>
                  <td class="styLNAmountBox" style="border-right-width:1px;">
            &#160;
            <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/ConservationExpenses"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;">15</td>
                  <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Custom hire (machine work)
              
            </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;">
              15
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/CustomHireExpenses"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;">16</td>
                  <td class="styGenericDiv" style="width:52mm;height:4.5mm;font-size:6pt;" colspan="2">Depreciation and section 179 expense deduction not claimed elsewhere (see page F-5)
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.               
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;">
              16
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
            &#160;<br/>
            &#160;<br/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/DeprecAndSect179ExpnsDeduction"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;">17</td>
                  <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Employee benefit programs other than on line 25
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.
                <span style="width:16px"/>.                
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;">
              17
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
            &#160;<br/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/EmployeeBenefitProgramExpenses"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;">18</td>
                  <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Feed
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.                
                 <span style="width:16px"/>.
                <span style="width:16px"/>.                 
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;">
              18
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/FeedPurchasedExpenses"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;">19</td>
                  <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Fertilizers and lime
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.
                <span style="width:16px"/>.                
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;">
              19
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/FertilizerAndLimeExpenses"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;">20</td>
                  <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Freight and trucking
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.
                <span style="width:16px"/>.                
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;">
              20
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/FreightAndTruckingExpenses"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;">21</td>
                  <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Gasoline, fuel, and oil
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.                
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;">
              21
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/GasolineFuelAndOilExpenses"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;">22</td>
                  <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Insurance (other than health)
              
            </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;">
              22
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/InsuranceExpenses"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;">23</td>
                  <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Interest:              
            </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;background-color:lightgrey;">
                    <span style="width:1px;"/>
                  </td>
                  <td class="styLNRightNumBoxNBB" style="width=8.25mm;height:4.5mm;border-right-width:1px;">
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;padding-left:4mm">a</td>
                  <td class="styGenericDiv" style="width:52mm;height:4.5mm;font-size:6pt;" colspan="2">Mortgage (paid to banks, etc.)
            <span style="width:1px;"/>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/MortgageInterestExpenses"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;">
              23a
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px; vertical-align: bottom;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/MortgageInterestExpenses"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm">b</td>
                  <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Other
              <span style="width:1px;"/>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherInterestExpenses"/>
                    </xsl:call-template>
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.                
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;">
              23b
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherInterestExpenses"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:8.75mm;vertical-align:top;">24</td>
                  <td class="styGenericDiv" 
                  style="width:52mm;height:8.75mm" 
                  colspan="2">Labor hired (less employment credits)
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:8.75mm;border-bottom-width:1px;">
              24
            </td>
                  <td class="styLNAmountBox" style="height:8.75mm;border-right-width:1px;border-bottom-width:1px;">
                    <br/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/LaborHiredExpenses"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
              </tbody>
            </table>
            <!-- END Left Side table of Part II-->
            <!-- BEGIN Right Side table of Part II-->
            <table class="styTable" style="width:92.25mm;float:right;clear:none;font-size:7pt;" cellspacing="0">
              <thead/>
              <tfoot/>
              <tbody>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;">25</td>
                  <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
            Pension and profit-sharing<br/>plans 
            <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.  
              <span style="width:16px"/>.
              <span style="width:16px"/>.              
            </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
            25
          </td>
                  <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/PensionAndPrftSharingExpenses"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;">26</td>
                  <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">Rent or lease (see page F-6):              
            </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;border-bottom-width:0px;background-color:lightgrey;">
                    <span style="width:1px;"/>
                  </td>
                  <td class="styLNRightNumBoxNBB" style="width:7.25mm;height:4.5mm;">
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;">a</td>
                  <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">Vehicles, machinery, and equipment
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.                
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              26a
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
            &#160;<br/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/VehMachAndEquipRentLeaseExpnss"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftLtrBox" style="height:4.5mm;">b</td>
                  <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">Other (land, animals, etc.)
              
            </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              26b
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherRentOrLeaseExpenses"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;">27</td>
                  <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">Repairs and maintenance
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.                              
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              27
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/RepairsAndMaintenanceExpenses"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;">28</td>
                  <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">Seeds and plants
            <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.    
                <span style="width:16px"/>.                            
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              28
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/SeedsAndPlantsExpnss"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;">29</td>
                  <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">Storage and warehousing
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.                              
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              29
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/StorageAndWarehousingExpenses"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;">30</td>
                  <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">Supplies
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.    
                <span style="width:16px"/>. 
                <span style="width:16px"/>. 
                <span style="width:16px"/>. 
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              30
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/SuppliesExpenses"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;">31</td>
                  <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">Taxes
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.  
                <span style="width:16px"/>.    
                <span style="width:16px"/>.  
                <span style="width:16px"/>.    
                <span style="width:16px"/>.                              
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              31
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/TaxesExpense"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;">32</td>
                  <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">Utilities
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:16px"/>.  
                <span style="width:16px"/>.    
                <span style="width:16px"/>.  
                <span style="width:16px"/>.    
                <span style="width:16px"/>.                              
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              32
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/UtilitiesExpenses"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;">33</td>
                  <td class="styGenericDiv" style="width:50mm;height:4.5mm;font-size:6pt;" colspan="2">Veterinary, breeding, and medicine
              <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:3px"/>.                                                    
              </span>
                  </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              33
            </td>
                  <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/VtrnryBreedingMedicineExpenses"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 34-->
                <tr>
                  <td class="styLNLeftNumBox" style="height:4.5mm;">34</td>
                  <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">Other expenses (specify):              
            </td>
                  <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;border-bottom-width:0px;background-color:lightgrey;">
                    <span style="width:1px;"/>
                  </td>
                  <td class="styLNRightNumBoxNBB" style="width:7.25mm;height:4.5mm;">
                    <span style="width:1px;"/>
                  </td>
                </tr>
                <xsl:if test="($Print != $Separated) or (count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense) &lt;= 5) ">
                  <xsl:for-each select="$Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense">
                    <tr>
                      <td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;">
                        <xsl:call-template name="AddPositionNumber"/>
                        <xsl:if test="position() = 6 and not($Form1040ScheduleFData/FarmExpenses/OtherExpenses/TotalPreproductivePeriodExpnss)">
                  f
                  </xsl:if>
                      </td>
                      <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
                        <span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;">
                          <xsl:if test="position() = last() and count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense)&gt; 5">
                            <xsl:attribute name="class">styGenericDiv</xsl:attribute>
                          </xsl:if>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Description"/>
                          </xsl:call-template>
                        </span>
                      </td>
                      <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
                        <xsl:if test="position() = last() and count          ($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense)    &gt;     5">
                          <xsl:attribute name="class">styLNRightNumBoxNBB</xsl:attribute>
                        </xsl:if>
                        <xsl:if test="position() &lt;= 5">
                  34<xsl:call-template name="AddPositionNumber"/>
                        </xsl:if>
                        <xsl:if test="position() = 6 and not($Form1040ScheduleFData/FarmExpenses/OtherExpenses/TotalPreproductivePeriodExpnss)">
                     34f
                  </xsl:if>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                        <xsl:if test="position() = last() and count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense)&gt; 5">
                          <xsl:attribute name="class">styLNAmountBoxNBB</xsl:attribute>
                        </xsl:if>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Amount"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                    <!-- Line f will be displayed if the element  "TotalPreproductivePeriodExpnss" exists.  If not then the regular iteration would continue and line f would be displayed with description and amount-->
                    <xsl:if test="position() = 5 and $Form1040ScheduleFData/FarmExpenses/OtherExpenses/TotalPreproductivePeriodExpnss">
    
                    </xsl:if>
                  </xsl:for-each>
                </xsl:if>
                <!--Filler rows when there are no elements or the element does not exist-->
                <!-- Other Filler rows-->
                <xsl:if test="count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense) &lt; 1 or ((count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense) &gt; 5) and ($Print = $Separated))">
                  <tr>
                    <td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;">a</td>
                    <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
                      <span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense"/>
                        </xsl:call-template>
                      </span>
                    </td>
                    <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
                34a
              </td>
                    <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                      <span style="width:1px;"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense) &lt; 2 or ((count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense) &gt; 5) and ($Print = $Separated))">
                  <tr>
                    <td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;">b</td>
                    <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
                      <span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;"/>
                    </td>
                    <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
                34b
              </td>
                    <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                      <span style="width:1px;"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense) &lt; 3 or ((count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense) &gt; 5) and ($Print = $Separated))">
                  <tr>
                    <td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;">c</td>
                    <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
                      <span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;"/>
                    </td>
                    <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
                34c
              </td>
                    <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                      <span style="width:1px;"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense) &lt; 4 or ((count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense) &gt; 5) and ($Print = $Separated))">
                  <tr>
                    <td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;">d</td>
                    <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
                      <span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;"/>
                    </td>
                    <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
                34d
              </td>
                    <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                      <span style="width:1px;"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense) &lt; 5 or ((count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense) &gt; 5) and ($Print = $Separated))">
                  <tr>
                    <td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;">e</td>
                    <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
                      <span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;"/>
                    </td>
                    <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
                34e
              </td>
                    <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                      <span style="width:1px;"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense) &lt;5">
       
                </xsl:if>
                <xsl:if test="((count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense) &gt; 5) and ($Print = $Separated))">
                  <tr>
                    <td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;">f</td>
                    <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
                      <span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;"/>
                    </td>
                    <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
                34f
              </td>
                    <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                      <span style="width:1px;"/>
                    </td>
                  </tr>
                </xsl:if>
                           <tr>
                    <td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;">
              f
            </td>
                    <td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
                      <span class="styGenericDiv" style="width: 37mm;float: none; text-align:left;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherExpenses/TotalPreproductivePeriodExpnss/@section263AIndicator"/>
                        </xsl:call-template>
                      </span>
                    </td>
                    <td class="styLNRightNumBoxNBB" style="height:4.5mm;width:7.25mm;">
              34f
            </td>
                    <td class="styLNAmountBoxNBB" style="height:4.5mm;width:31.5mm;">
                      <xsl:if test="$Form1040ScheduleFData/FarmExpenses/OtherExpenses/TotalPreproductivePeriodExpnss"/>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherExpenses/TotalPreproductivePeriodExpnss"/>
                      </xsl:call-template>
                      <xsl:if test="$Form1040ScheduleFData/FarmExpenses/OtherExpenses/TotalPreproductivePeriodExpnss"/>
                      <span style="width:1px;"/>
                    </td>
                  </tr>
              </tbody>
            </table>
            <!-- END Right Side Table of Part II-->
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width: 139mm; height:4mm;"/>
            <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
            <div class="styLNAmountBoxNBB" style="height:4mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">35</div>
            <div class="styLNDesc" style="width: 139mm; height:4mm;">
              <span class="styBoldText">Total expenses. </span>
        Add lines 12 through 34f. If line 34f is negative, see instructions     
        
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.    
          <span style="width:16px"/>.
          <span style="width:16px"/>.  
       </span>
              <img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">      
        35
      </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/TotalExpenses"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 36   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm; padding-left: 1mm;">36</div>
            <div class="styLNDesc" style="width:123mm;height:4mm;">
              <span class="styBoldText">Net farm profit or(loss). </span>
              Subtract line 35 from line 11.  Partnerships, see page F-7.
            <li>If a profit, enter the profit on both <b> Form 1040, line 18,</b> and <b>Schedule SE, line 1a;</b>
              </li>
              <div style="padding-left:4.5mm;">
                on <b>Form 1040NR, line 19;</b>  or on<b> Form 1041, line 6.</b>
              </div>
              <li>If a loss, you <span class="styBoldText">must</span> go on to line 37. </li>
            </div>
            <div class="styLNDesc" style="width:5mm; height:4mm;padding-top:1mm;">
              <img src="{$ImagePath}/1040SchF_Bracket.gif" height="45mm" alt="Curly Bracket Image"/>
            </div>
            <div class="styLNDesc" style="width:10mm; height:6mm;">
              <span class="styBoldText" style="width:10.75mm; height:4mm;padding-bottom:0mm;padding-top:4.5mm;">
                <span style="width:8px;"/>.    
            <span style="width:8px;"/>. 
            <span style="width:8px;"/>. 
          </span>
            </div>
            <div class="styLNRightNumBox" style="width:8mm;height:8.25mm;padding-top:4mm;">
           36
        </div>
            <div class="styLNAmountBox" style="height:8.25mm;">
              <br/>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/NetFarmProfitOrLoss"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  ************************************End of line 36 ********************************* -->
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:10mm;">37</div>
            <div class="styLNDesc" style="width:140mm;height:11mm;">
        If you have a loss, you <span class="styBoldText">must</span> check the box that describes your investment in this activity (see page F-7).
                  
        <li>If you checked 37a, enter the loss on both <span class="styBoldText">Form 1040, line 18,</span>
         and <span class="styBoldText">Schedule SE, line 1a;</span>
              </li> on
              <div style="padding-left:4mm;">
                <b>Form 1040NR, line 19;</b> or on<b> Form 1041, line 6.</b>
              </div>
              <li>If you checked 37b, you <span class="styBoldText">must</span> attach <span class="styBoldText">Form 6198. </span>Your loss maybe limited.</li>
            </div>
            <div class="styLNDesc" style="width:3mm; height:12mm;padding-top:1mm;">
              <img src="{$ImagePath}/1040SchF_Bracket.gif" height="40mm" alt="Curly Bracket Image"/>
            </div>
            <div class="styLNDesc" style="width:36mm;height:4mm;padding-top:2mm;">
              <span style="width:2mm;"/>
              <span class="styBoldText">37a</span>
              <span style="width:4px"/>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/AllInvestmentIsAtRisk"/>
                  <xsl:with-param name="BackupName">IRS1040ScheduleFAllInvestmentIsAtRisk</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/AllInvestmentIsAtRisk"/>
                  <xsl:with-param name="BackupName">IRS1040ScheduleFAllInvestmentIsAtRisk</xsl:with-param>
                </xsl:call-template>
                <span style="font-family: Arial Narrow; font-size: 7pt;">All investment is at risk. </span>
              </label>
            </div>
            <div class="styLNDesc" style="width:36mm;height:4mm;padding-top:2mm;">
              <span style="width:2mm;"/>
              <span class="styBoldText">37b</span>
              <span style="width:4px"/>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/SomeInvestmentIsNotAtRisk"/>
                  <xsl:with-param name="BackupName">IRS1040ScheduleFSomeInvestmentIsNotAtRisk</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/SomeInvestmentIsNotAtRisk"/>
                  <xsl:with-param name="BackupName">IRS1040ScheduleFSomeInvestmentIsNotAtRisk</xsl:with-param>
                </xsl:call-template>
                <span style="font-family: Arial Narrow; font-size: 6pt;">Some investment is not at risk.</span>
              </label>
            </div>
          </div>
          <!-- Page Break-->
          <!-- Footer-->
          <div class="pageEnd" style="width:187mm;">
            <div style="float:left;">
              <span class="styBoldText">For Paperwork Reduction Act Notice, see page F-7 of the instructions. </span>
              <span style="width:80px;"/>                        
        Cat. No. 11346H 
      </div>
            <div style="float:right;">
              <span style="width:20px;"/>
              <span class="styBoldText">Schedule F (Form 1040) 2009 </span>
            </div>
          </div>
          <!--Begin Page 2 -->
          <!-- Header -->
          <div class="styBB" style="width:187mm;">
            <div style="float:left;">Schedule F (Form 1040) 2009 <span style="width:130mm;"/>
            </div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:7pt;">2</span>
            </div>
          </div>
          <!-- BEGIN Part III Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName">Part III</div>
            <div class="styPartDesc">Farm Income—Accrual Method <span class="styNormalText">(see page F-7). </span>
              <br/>
              <div style="font-weight:normal;">Do not include sales of livestock held for draft, breeding, sport, or dairy purposes. Report these sales on Form
           4797 and do not include this livestock on line 46 below. </div>
            </div>
          </div>
          <!-- END Part III Title -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width: 139mm; height:4mm;"/>
            <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
            <div class="styLNAmountBoxNBB" style="height:4mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">38</div>
            <div class="styLNDesc" style="width: 139mm; height:4mm;">        
         Sales of livestock, produce, grains, and other products    
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.    
          <span style="width:16px"/>.
          <span style="width:16px"/>.  
          <span style="width:16px"/>.
          <span style="width:16px"/>.  
          <span style="width:16px"/>.                    
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">      
        38
      </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/SalesOfProducts"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width: 139mm; height:4mm;"/>
            <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
            <div class="styLNAmountBoxNBB" style="height:4mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">39a</div>
            <div class="styLNDesc" style="width:67.5mm;height:4mm;font-size:6pt;padding-top:1mm;">Cooperative distributions (Form(s) 1099-PATR)
        <span style="width:16px"/>.    
      </div>
            <div class="styLNRightNumBox" style="height:4mm;">39a</div>
            <div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CooperativeDistributions"/>
              </xsl:call-template>
            </div>
            <div class="styLNDesc" style="width:31.5mm;height:4mm;">
              <span style="width:8px;"/>
              <span class="styBoldText"> 39b</span>
              <span style="width:8px;"/>
         Taxable amount
      </div>
            <div class="styLNRightNumBox" style="height:4mm;">39b</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CooperativeDistriTxblAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width: 139mm; height:4mm;"/>
            <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
            <div class="styLNAmountBoxNBB" style="height:4mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">40a</div>
            <div class="styLNDesc" style="width:67.5mm;height:4mm;">Agricultural program payments
	      <span style="width:16px"/>.    
	      <span style="width:16px"/>.  
	      <span style="width:16px"/>.
			 <span style="width:16px"/>.
      </div>
            <div class="styLNRightNumBox" style="height:4mm;">40a</div>
            <div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/AgriculturalProgramPayments"/>
              </xsl:call-template>
            </div>
            <div class="styLNDesc" style="width:31.5mm;height:4mm;">
              <span style="width:8px;"/>
              <span class="styBoldText"> 40b</span>
              <span style="width:8px;"/>
         Taxable amount
      </div>
            <div class="styLNRightNumBox" style="height:4mm;">40b</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/AgriculturalProgramPymtTxblAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;height:10px;">
            <div class="styLNLeftNumBox" style="height:10px;"/>
            <div class="styLNDesc" style="width: 139mm; height:10px;"/>
            <div class="styLNRightNumBoxNBB" style="height:10px;background-color:lightgrey;"/>
            <div class="styLNAmountBoxNBB" style="height:10px;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">41</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">Commodity Credit Corporation (CCC) loans:        
      </div>
            <div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm">a</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">CCC loans reported under election
        <span style="width:1px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CCCLoansReportedUnderElection"/>
              </xsl:call-template>
              <!--Dotted Line-->
              <span class="styBoldText">
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
            <div class="styLNRightNumBox" style="height:5.25mm;">41a</div>
            <div class="styLNAmountBox" style="height:5.25mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CCCLoansReportedUnderElection"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width: 139mm; height:4mm;"/>
            <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
            <div class="styLNAmountBoxNBB" style="height:4mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm">b</div>
            <div class="styLNDesc" style="width:67.5mm;height:4mm;">CCC loans forfeited
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">41b</div>
            <div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CCCLoansForfeited"/>
              </xsl:call-template>
            </div>
            <div class="styLNDesc" style="width:31.5mm;height:4mm;">
              <span style="width:8px;"/>
              <span class="styBoldText">41c</span>
              <span style="width:8px;"/>
         Taxable amount
      </div>
            <div class="styLNRightNumBox" style="height:4mm;">41c</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CCCLoansForfeitedTaxableAmount"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width: 139mm; height:4mm;"/>
            <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
            <div class="styLNAmountBoxNBB" style="height:4mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">42</div>
            <div class="styLNDesc" style="width: 139mm; height:4mm;">        
         Crop insurance proceeds        
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.    
          <span style="width:16px"/>.
          <span style="width:16px"/>.  
          <span style="width:16px"/>.
          <span style="width:16px"/>.  
          <span style="width:16px"/>.  
          <span style="width:16px"/>.
          <span style="width:16px"/>.    
          <span style="width:16px"/>.
          <span style="width:16px"/>.  
          <span style="width:16px"/>.
          <span style="width:16px"/>.  
          <span style="width:16px"/>.  
          <span style="width:16px"/>.  
          <span style="width:16px"/>.  
          <span style="width:16px"/>.                    
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">      
        42
      </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CropInsuranceProceeds"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width: 139mm; height:4mm;"/>
            <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
            <div class="styLNAmountBoxNBB" style="height:4mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">43</div>
            <div class="styLNDesc" style="width: 139mm; height:4mm;">        
        Custom hire (machine work) income        
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.    
          <span style="width:16px"/>.
          <span style="width:16px"/>.  
          <span style="width:16px"/>.
          <span style="width:16px"/>.  
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.    
          <span style="width:16px"/>.
          <span style="width:16px"/>.  
          <span style="width:16px"/>.
          <span style="width:16px"/>.  
          <span style="width:16px"/>.    
          <span style="width:16px"/>.                    
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">      
        43
      </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CustomHireIncome"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width: 139mm; height:4mm;"/>
            <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
            <div class="styLNAmountBoxNBB" style="height:4mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">44</div>
            <div class="styLNDesc" style="width: 139mm; height:4mm;">        
        Other income, including federal and state gasoline or fuel tax credit or refund
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.    
          <span style="width:16px"/>.
          <span style="width:16px"/>.  
          <span style="width:16px"/>.
          <span style="width:16px"/>.                              
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">      
        44
      </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/OtherIncmIncludingGasFuelTaxCr"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width: 139mm; height:4mm;"/>
            <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
            <div class="styLNAmountBoxNBB" style="height:4mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">45</div>
            <div class="styLNDesc" style="width: 139mm; height:4mm;">        
        Add amounts in the right column for lines 38 through 44
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.    
          <span style="width:16px"/>.
          <span style="width:16px"/>.  
          <span style="width:16px"/>.
          <span style="width:16px"/>.  
          <span style="width:16px"/>.    
          <span style="width:16px"/>.
          <span style="width:16px"/>.  
          <span style="width:16px"/>.                    
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">      
        45
      </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/TotalIncome"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">46</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
        Inventory of livestock, produce, grains, and other products at beginning of the year    
        <!--Dotted Line-->
              <span class="styBoldText">
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
            <div class="styLNRightNumBox" style="height:8mm;">
              <br/>46</div>
            <div class="styLNAmountBox" style="height:8mm;">
              <br/>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/InventoryOfProductsAtBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:8mm;border-right-width:1px;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">47</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
        Cost of livestock, produce, grains, and other products purchased during the year
        <!--Dotted Line-->
              <span class="styBoldText">
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
            <div class="styLNRightNumBox" style="height:8mm;">
              <br/>47</div>
            <div class="styLNAmountBox" style="border-bottom-width:1px;height:8mm;">
              <br/>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CostOfProductsPrchsDuringYear"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:8mm;border-right-width:1px;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">
              <br/>48</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
              <br/>
        Add lines 46 and 47    
        <!--Dotted Line-->
              <span class="styBoldText">
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
            <div class="styLNRightNumBox" style="height:8mm;">
              <br/>48</div>
            <div class="styLNAmountBox" style="height:8mm;">
              <br/>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/InventoryAtBOYPlusCostOfPrchs"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:8mm;border-right-width:1px;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">
              <br/>49</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
              <br/>
        Inventory of livestock, produce, grains, and other products at end of year        
      </div>
            <div class="styLNRightNumBox" style="height:8mm;">
              <br/>49</div>
            <div class="styLNAmountBox" style="border-bottom-width:1px;height:8mm;">
              <br/>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/InventoryOfProductsAtEOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:8mm;border-right-width:1px;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width: 139mm; height:4mm;"/>
            <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
            <div class="styLNAmountBoxNBB" style="height:4mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">50</div>
            <div class="styLNDesc" style="width: 139mm; height:4mm;">          
        Cost of livestock, produce, grains, and other products sold. Subtract line 49 from line 48*      
        
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.    
          <span style="width:16px"/>.                                
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">      
        50
      </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CostOfProductsSold"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width: 139mm; height:4mm;"/>
            <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
            <div class="styLNAmountBoxNBB" style="height:4mm;"/>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">51</div>
            <div class="styLNDesc" style="width: 139mm; height:4mm;">
              <span class="styBoldText">Gross income. </span>Subtract line 50 from line 45. Enter the result here and on Part 1, line 11          
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.    
          <span style="width:16px"/>.                              
        </span>
              <img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/>
            </div>
            <div class="styLNRightNumBoxNBB" style="height:4mm;">      
        51
      </div>
            <div class="styLNAmountBoxNBB" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/GrossIncome"/>
              </xsl:call-template>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styLNDesc" style="width: 187mm; height:4mm;">  
        *If you use the unit-livestock-price method or the farm-price method of valuing inventory and the amount on line 49 is larger than the amount on
        line 48, subtract line 48 from line 49. Enter the result on line 50. Add lines 45 and 50. Enter the total on line 51 and on Part I, line 11.      
      </div>
          </div>
          <!-- Part IV -->
          <!-- No actual data in Part IV, only information; therefore, no need to print it out on the page -->
          <!-- 
    
    COMMENT BEGIN Part IV Title COMMENT
    <div class="styBB" style="width:187mm;">
      <div class="styPartName">Part IV</div>
      <div class="styPartDesc">
        Principal Agricultural Activity Codes                  
      </div>
    </div>
    COMMENT END Part IV Title COMMENT
    
    <div style="width:187mm;">
      <div style="border-top-width: 1px; border-right-width: 25px; width: 86mm; height: 8mm;float: left;">
        <br/>
        <div style="float:left;background-color:black;">
          <img src="{$ImagePath}/1040SchF_Caution.gif" alt="Caution Image"/>  
        </div>      
        <div style="width:70mm;float:right;padding-top:2mm;">  
          File <span class="styBoldText">Schedule C</span> (Form 1040), Profit or Loss From
          Business, or <span class="styBoldText">Schedule C-EZ</span> (Form 1040), Net Profit
          From Business, instead of Schedule F if:
        </div>
        <br/><br/><br/><br/><br/>
        <div style=" float:left;">
          <span style="width:10px;"></span> <img src="{$ImagePath}/1040SchF_Bullet_Round.gif" alt="Bullet Image" /> Your principal source of income is from providing
          agricultural services such as soil preparation, veterinary, farm
          labor, horticultural, or management for a fee or on a contract
          basis or  
        </div>
        <br/><br/><br/>
        <div style=" float:left;">
          <span style="width:10px;"></span><img src="{$ImagePath}/1040SchF_Bullet_Round.gif" alt="Bullet Image" /> 
          You are engaged in the business of breeding, raising, and
          caring for dogs, cats, or other pet animals.
        </div>
      
        <div class="styBB" style="width:86mm;border-bottom-width: 2px;"></div>
        
        
        These codes for the Principal Agricultural Activity classify farms
        by the type of activity they are engaged in to facilitate the
        administration of the Internal Revenue Code. These six-digit
        codes are based on the North American Industry Classification
        System (NAICS).        
        <br/>
        <span style="width:10px;"></span> Select one of the following codes and enter the six-digit
        number on page 1, line B.
        <br/><br/>
        <span class="styBoldText" >Crop Production</span>
        <br/>
        111100 <span style="width:10px;"></span> Oilseed and grain farming
        <br/>
        111210 <span style="width:10px;"></span> Vegetable and melon farming  
        <br/>      
    
      </div>
      <div style="padding-left: 1mm; border-top-width: 1px; width: 91mm; height: 8mm;float: right;clear:both;padding-top:2mm;"> 
        <br/>
        111300 <span style="width:10px;"></span> Fruit and tree nut farming
        <br/>
        111400 <span style="width:10px;"></span> Greenhouse, nursery, and floriculture production
        <br/>
        111900 <span style="width:10px;"></span> Other crop farming
        <br/><br/>
        <span class="styBoldText">Animal Production</span>
        <br/>
        112111 <span style="width:10px;"></span> Beef cattle ranching and farming
        <br/>
        112112 <span style="width:10px;"></span> Cattle feedlots
        <br/>
        112120 <span style="width:10px;"></span> Dairy cattle and milk production
        <br/>
        112210 <span style="width:10px;"></span> Hog and pig farming
        <br/>
        112300 <span style="width:10px;"></span> Poultry and egg production
        <br/>
        112400 <span style="width:10px;"></span> Sheep and goat farming
        <br/>
        112510 <span style="width:10px;"></span> Animal aquaculture
        <br/>
        112900 <span style="width:10px;"></span> Other animal production
        <br/><br/>
        <span class="styBoldText">Forestry and Logging</span>
        <br/>
        113000 <span style="width:10px;"></span> Forestry and logging (including forest nurseries
        <br/> <span style="width:53px;"></span> and timber tracts)    
      </div>
      
    </div>    
     <div class="styBB" style="width:187mm;">
    </div>
    
-->
          <!-- End of Part IV -->
          <!--Footer -->
          <div style="width:187mm;">
            <div class="stySmallText" style="width:141mm;text-align:center;padding-top:1mm;">
              <span style="width:156px"/>
            </div>
            <div class="stySmallText" style="width:46mm;text-align:right;">
              <span class="styBoldText" style="font-weight:bold;">Schedule F (Form 1040) 2009</span>
            </div>
          </div>
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
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
          <!-- Begin separated repeating data table -->
          <xsl:if test="($Print = $Separated) and (count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense) &gt; 5)">
            <xsl:variable name="CountExpenses" select="count($Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense)"/>
            <span class="styRepeatingDataTitle">Form 1040 Schedule F, Part II, Line 34 - Other expenses (specify):</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col" style="width:130mm;" colspan="2">(a) Description</th>
                  <th class="styDepTblCell" scope="col" style="width:50mm;" colspan="2">(b) Amount</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form1040ScheduleFData/FarmExpenses/OtherExpenses/OtherExpense">
                  <tr>
                    <xsl:if test="position() &gt; 5">
                      <xsl:choose>
                        <xsl:when test="$Form1040ScheduleFData/FarmExpenses/OtherExpenses/TotalPreproductivePeriodExpnss">
                          <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:if>
                    <xsl:if test="position() &lt;=5">
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    </xsl:if>
                    <td class="styDepTblCell" style="height:4.5mm;vertical-align:top;width:8mm;border-right:1 solid 0px;font-weight:bold;">
                      <xsl:call-template name="AddPositionNumber"/>
                      <xsl:if test="position() &gt; 5">
                        <xsl:choose>
                          <xsl:when test="$Form1040ScheduleFData/FarmExpenses/OtherExpenses/TotalPreproductivePeriodExpnss">
                            <xsl:number value="position() + 1" format="a"/>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:number value="position()" format="a"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:if>
                    </td>
                    <td class="styDepTblCell" style="width:122mm;height:4.5mm;text-align:left;border-left:1 solid 0px;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Description"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;vertical-align:top;width:8mm;border-right:1 solid 0px;font-weight:bold;text-align:center;">
                  34<xsl:call-template name="AddPositionNumber"/>
                      <xsl:if test="position() &gt; 5">
                        <xsl:choose>
                          <xsl:when test="$Form1040ScheduleFData/FarmExpenses/OtherExpenses/TotalPreproductivePeriodExpnss">
                            <xsl:number value="position() + 1" format="a"/>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:number value="position()" format="a"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:if>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;width:50mm;text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Amount"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                  </tr>
                  <!-- Line f will be displayed if the element  "TotalPreproductivePeriodExpnss" exists.  If not then the regular iteration would continue and line f would be displayed with description and amount-->
                  <xsl:if test="position() = 5 and $Form1040ScheduleFData/FarmExpenses/OtherExpenses/TotalPreproductivePeriodExpnss">
                    <tr class="styDepTblRow2">
                      <td class="styDepTblCell" style="height:4.5mm;vertical-align:top;width:8mm;border-right:1 solid   0px;font-weight:bold;">
                    f
                  </td>
                      <td class="styDepTblCell" style="width:122mm;height:4.5mm;text-align:left;border-left:1 solid   0px;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherExpenses/TotalPreproductivePeriodExpnss/@section263AIndicator"/>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="height:4.5mm;vertical-align:top;width:8mm;border-right:1 solid   0px;font-weight:bold;">
                    34f
                  </td>
                      <td class="styDepTblCell" style="height:4.5mm;width:50mm;text-align:right;">
                        <span style="width:1px;"/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherExpenses/TotalPreproductivePeriodExpnss"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
        </form>
      </body>
    </html>
  </xsl:template>
  <xsl:template name="AddPositionNumber">
    <xsl:if test="position()=1">a</xsl:if>
    <xsl:if test="position()=2">b</xsl:if>
    <xsl:if test="position()=3">c</xsl:if>
    <xsl:if test="position()=4">d</xsl:if>
    <xsl:if test="position()=5">e</xsl:if>
  </xsl:template>
</xsl:stylesheet>
