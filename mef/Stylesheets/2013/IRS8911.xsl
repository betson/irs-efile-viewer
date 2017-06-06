<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XML Spy v4.4 U (http://www.xmlspy.com) by Ken Dulabhan (Comteq Federal Inc) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8911Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form8911" select="$RtnDoc/IRS8911"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8911)"/>
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
        <meta name="Description" content="IRS Form 8911"/>
        <xsl:call-template name="InitJS"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <style type="text/css">
          <!-- EXCEPTION: per Tamaira Green's response e-mail dated 8/4/09, column a and b heading for Part III, line 12 can be omitted from PDF dated 1/9/09.-->
          <!--PRINT STATEMENT-->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8911Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form8911">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Number and Name -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:20mm;border-right:none;">
              <span style="height:5mm;">
                Form <span class="styFormNumber">8911</span>
                <!--General Dependency Push Pin -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form8911"/>
                </xsl:call-template>
              </span>
              <span class="styAgency" style="line-height:100%;">
                <br/>
                <br/>
                <br/>
                  Department of the Treasury
                <br/>
                  Internal Revenue Service
              </span>
            </div>
            <div class="styFTBox" style="width:123mm;border-right:1px solid black;border-left:1px solid black;height:20mm;">
              <div style="padding-top:2mm;height:8.5mm;" class="styMainTitle">
                Alternative Fuel Vehicle Refueling Property Credit
              </div>
              <br/>
              <div class="styFST" style="height:5mm;font-size:7pt;">
                <img src="{$ImagePath}/8911_Bullet.gif" alt="Bullet Image"/>
                  Attach to your tax return.<br/>
                    <img src="{$ImagePath}/8911_Bullet.gif" alt="Bullet Image"/>
                  Information about Form 8911 and its instructions is at <!--<i>www.irs.gov/form8911.</i>-->
                       <a href="http://www.irs.gov/form8911" title="Link to irs.gov">
                       <i>www.irs.gov/form8911. </i>
                       </a>
              
              </div>
            </div>
            <div class="styTYBox" style="width:32mm;border-left:none;">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-1981</div>
              <div class="styTaxYear">
                20<span class="styTYColor">13</span>
              </div>
              <div style="margin-left:3mm; text-align:left;">
                Attachment<br/>Sequence No. <span class="styBoldText">151</span>
              </div>
            </div>
            <!-- Close right tax return header box -->
          </div>
          <!-- Close left tax return header box -->
          <!-- End Form Number and Name section -->
          <!-- Begin Name and Identifying number section -->
          <div class="styBB" style="width:187mm;">
          <div class="styNameBox" style="width:140mm;height:8mm;font-size:7pt;">
           Name(s) shown on return
           <br/>
           <!-- =============Return Header goes here==========================================-->
          <xsl:choose>
          <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">								  
            <br/>
           <xsl:call-template name="PopulateReturnHeaderFiler">
             <xsl:with-param name="TargetNode">Name</xsl:with-param>
          </xsl:call-template>
           </xsl:when>
        <xsl:otherwise>
            <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
            </xsl:call-template>
        </xsl:otherwise>
 </xsl:choose>
 </div>  
  <!-- Begin Names and Identifying number section -->
  <div class="styEINBox" style="width:46mm;height:4mm;padding-left:2mm;font-size:7pt;">Identifying number
    <br/>
    <br/>       
    <span style="font-weight:normal;">
  <!--Choice statement for EIN Line when either filing with 1120 or 1040 and data calling from a ReturnHeader-->
  <!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
  <xsl:choose>
    <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
      <xsl:call-template name="PopulateReturnHeaderFiler">
        <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="PopulateReturnHeaderFiler">
        <xsl:with-param name="TargetNode">EIN</xsl:with-param>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
 </span>
</div>   
</div>
<!-- End Names and Identifying number section -->
<div class="styBB" style="width:187mm;height:3.75mm;border-top-width:1px;padding-top: 0;padding-bottom: 0;">
  <div class="styPartName" style="height:.75mm">Part I</div>
      <div class="styPartDesc" style="float:left;width:167mm;">
		    Total Cost of Refueling Property
	       </div>
          </div>
          <!-- Line 1 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:2mm;">1</div>
              <div class="styLNDesc" style="width:139mm;padding-top:2mm;">
                Total cost of qualified alternative fuel vehicle refueling property placed in service during the tax year 
                <span style="float:left;">(see <span style="font-weight:bold;">What's New</span> in the instructions)</span>
           <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:3mm;">....................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="border-bottom-width:0px;height:9mm;padding-top:3.5mm;">1</div>
              <div class="styLNAmountBox" style="border-bottom-width:0px;height:9mm;padding-top:3.5mm;">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/TotalQlfdPropertyCostCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>         
          <div class="styBB" style="width:187mm;height:3.75mm;border-top-width:2px;padding-top:0;padding-bottom:0;">
            <div class="styPartName" style="height:3.75mm">Part II</div>
            <div class="styPartDesc" style="float:left;width:167mm;">
		    Credit for Business/Investment Use Part of Refueling Property
		  </div>
          </div>
          <!-- Line 2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="padding-top:2mm;">2</div>
              <div class="styLNDesc" style="width:137mm;padding-top:2mm;">
                <span style="float:left;">Business/investment use part (see instructions)</span>
             <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="padding-top:2mm;">2</div>           
              <div class="styLNAmountBox" style="padding-top:2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/BusInvestmtUsePartAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--Line 3 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">3</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Section 179 expense deduction (see instructions)</span>
           <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">3</div>           
               <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/Section179ExpenseDeductionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L4 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">4</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Subtract line 3 from line 2 </span>
            <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.........................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">4</div>            
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/NetBusinessUsePartAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 5-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">5</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Multiply line 4 by 30% (.30) </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">5</div>           
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/AdjustedBusinessUsePartAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 6-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">6</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Maximum business/investment use part of credit (see instructions) </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">6</div>       
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/MaximumBusinessUsePartAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 7-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">7</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Enter the <span class="styBoldText">smaller</span> of line 5 or line 6 </span>
            <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">......................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">7</div>            
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/AdjBusUsePrtOrMxBusUsePrtAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 8 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left:2mm;">8</div>
              <div class="styLNDesc" style="width:139mm;">
                <span style="float:left;">Alternative fuel vehicle refueling property credit from partnerships and S corporations </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:3mm;">......</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">8</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/AltFuelVehRefuelPropCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 9 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none">
              <div class="styLNLeftNumBox" style="padding-left:2mm;">9</div>
               <div class="styLNDesc" style="width:139mm;">
                <span class="styBoldText">Business/investment use part of credit. </span>
		        Add lines 7 and 8. Partnerships and S corporations, report this
		      <span style="float:left;">amount on Schedule K. All others, report this amount on Form 3800, line 1s </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:3mm;">.........</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="border-bottom-width:0"/>
              <div class="styLNRightNumBox" style="border-bottom-width:0">9</div>
              <div class="styLNAmountBox" style="border-bottom-width:0">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/BusinessInvstUsePartOfCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part III header -->
          <div class="styBB" style="width:187mm;height:3.75mm;padding-top:0;padding-bottom:0;border-top-width:2px;">
            <div class="styPartName" style="height:3.75mm">Part III</div>
            <div class="styPartDesc" style="float:left;width:167mm;">
		        Credit for Personal Use Part of Refueling Property
		    </div>
          </div>
          <!-- Line 10-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-top:2mm;">10</div>
              <div class="styLNDesc" style="width:137mm;padding-top:2mm;">
                Subtract line 2 from line 1. If zero, stop here; <span class="styBoldText">do not</span> file this form unless you 
                  are claiming a credit on <span style="float:left;">line 9</span> 
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...............................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:9mm;padding-top:4mm;">10</div>             
              <div class="styLNAmountBox" style="height:9mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/PersonalUsePartOfCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>        
          <!-- Line 11-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">11</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Multiply line 10 by 30% (.30) </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">11</div>             
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/AdjustedPersonalUsePartAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 12-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">12</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Maximum personal use part of credit (see instructions) </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">12</div>          
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/MaximumPersonalUsePartAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 13-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">13</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Enter the <span class="styBoldText">smaller</span> of line 11 or line 12
                 </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">13</div>           
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/SmllrAdjOrMxPersnlUsePrtAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>        
          <!-- Line 14 Row 1 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">14</div>
              <div class="styLNDesc" style="width:139mm;">
		      Regular tax before credits:
		    </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0;"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0"/>
            </div>
          </div>
          <!-- Line 14 Row 2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left: 2mm;"/>
              <div class="styLNDesc" style="width:139mm; ">
                <table border="0" cellspacing="0" cellpadding="0" style="padding:0mm">
                  <tr>
                    <td style=" width:111mm;font-size:7pt;font-family:verdana;font-style: normal;font-weight:normal;border:none;">
                      <img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
		              Individuals. Enter the amount from Form 1040, line 44 (or Form 1040NR, line 42).
                      <br/>
                      <img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
                        Other filers. Enter the regular tax before credits from your return
                        <span style="padding-left:1mm;font-weight:bold;letter-spacing:3.3mm;">.....</span>
                    </td>
                    <td style="width:27mm;">
                      <div class="styLNDesc" style="width:2mm;">
                        <img src="{$ImagePath}/8826_Bracket_Tiny.gif" alt="Curly Bracket Image"/>
                      </div>
                      <div class="styLNDesc" style="width:25mm;padding-top:1.5mm;">
                        <span class="styBoldText" style="font-size: 7pt;float:right;padding-right:0mm;letter-spacing:3.3mm;">......</span>
                      </div>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="">14</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/RegularTaxBeforeCreditsAmt"/>
                </xsl:call-template>
              </div>
             <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:6.5mm;background-color:gray;border-right-width:1px;padding-top:0;padding-bottom:0;"/>
            </div>
          </div>
          <!-- Line 15-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">15</div>
              <div class="styLNDesc" style="width:139mm;">
		      Credits that reduce regular tax before the alternative fuel vehicle refueling property credit:
			  <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="TargetNode" select="$Form8911/OtherSpecifiedCredits"/>
                </xsl:call-template>
                <span style="width:2px;"/>
                <!--Dotted Line-->
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="border-bottom-width:0"/>
            </div>
          </div>
          <!-- Line 15a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">
                <span style="width:6px;padding-left:3mm"/>
		        a
		    </div>
              <div class="styLNDesc" style="width:99mm;">
                <span style="float:left;">Foreign tax credit </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">15a</div>
              <div class="styLNAmountBox" style="height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/ForeignTaxCreditAmt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0"/>
            </div>
          </div>
          <!-- Line 15b -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
              <div class="styLNDesc" style="width:99mm;">
                <span style="float:left;">Certain allowable credits (see instructions) </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">15b</div>
              <div class="styLNAmountBox" style="height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/CertainAllowableCreditsAmt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0"/>
            </div>
          </div>
          <!-- Line 15c -->
<!--          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">
                <span style="width:6px;padding-left:3mm">c</span>
              </div>
              <div class="styLNDesc" style="width:99mm;">
		      Non-business qualified electric vehicle credit from Form 8834, Line 30
		      </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">15c</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/ElectricVehicleTaxCreditAmt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0"/>
            </div>
          </div>
-->          <!-- Line 15d -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">
                <span style="width:6px;padding-left:3mm">c</span>
              </div>
              <div class="styLNDesc" style="width:139mm;">
                <span style="float:left;">Add lines 15a and 15b</span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:3mm;">.........................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">15c</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/TotalTaxCreditsAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L16 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="height:4.5mm;">16</div>
              <div class="styLNDesc" style="width:139mm;height:4.5mm;">
		      Net regular tax. Subtract line 15c from line 14. If zero or less, enter -0- and stop here; 
			 <span class="styBoldText">do not</span> file this 
			 <span style="float:left;">form unless you are claiming a credit on line 9 </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:3mm;">..................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">16</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/NetRegularTaxAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 17 Row 2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="">17</div>
              <div class="styLNDesc" style="width:139mm;">
		      Tentative minimum tax (see instructions):	
		    </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="border-bottom-width:0"/>
            </div>
          </div>
          <!-- Line 17 Row 2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left: 2mm; "/>
              <div class="styLNDesc" style="width:139mm; ">
                <table border="0" cellspacing="0" cellpadding="0" style="padding:0mm">
                  <tr>
                    <td style="font-size:7pt;font-family:verdana;font-style: normal;font-weight:normal;border:none; width: 111mm;">
                      <img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
						Individuals. Enter the amount from Form 6251, line 33
			         <span style="padding-left:mm;font-weight:bold;letter-spacing:3.3mm;">.........</span>
                      <br/>
                      <img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
			           Other filers. Enter the tentative minimum tax from your alternative minimum tax
			         <br/>
                      <span style="padding-left:2.5mm;">form or schedule</span>
                      <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">....................</span>
                    </td>
                    <td style="width:27mm">
                      <div class="styLNDesc" style="width:2mm;">
                        <img src="{$ImagePath}/8911_Bracket_Sm.gif" alt="Curly Bracket Image"/>
                      </div>
                      <div class="styLNDesc" style="width:25mm;padding-top:4mm;">
						<span class="styBoldText" style="font-size: 7pt;float:right;letter-spacing:3mm;padding-right:0mm">......
                        </span>
                      </div>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:1mm;background-color:gray;"/>
              <div class="styLNAmountBoxNBB" style="height:1mm;"/>
              <div class="styLNRightNumBox" style="">17</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/TentativeMinimumTaxAmt"/>
                </xsl:call-template>
              </div>
            <div class="styLNRightNumBoxNBB" style="width:8.3mm;height:6mm;background-color:gray;border-right-width:1px;padding-top:0;padding-bottom:0;"/>
            </div>
          </div>
          <!-- L18-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">18</div>
              <div class="styLNDesc" style="width:139mm;">
		      Subtract line 17 from line 16. If zero or less, stop here; <span class="styBoldText">do not</span> 
			 file this form unless you are claiming a 
			 <span style="float:left;">credit on line 9 </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:3mm;">............................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="border-bottom-width:0"/>
              <div class="styLNRightNumBox">18</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/AdjustedRegularTaxAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 19-->
          <div class="styTBB" style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">19</div>
              <div class="styLNDesc" style="width:139mm;">
                <span class="styBoldText">Personal use part of credit. </span>
			   Enter the <span class="styBoldText">smaller</span>
			   of line 13 or line 18 here and on Form 1040, line 53; Form 1040NR, line 50; or the appropriate line of your return. If line 18 is smaller 
			   than line 13, see 
			 <span style="float:left;">instructions </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:3mm;">.............................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:6mm;background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="height:6mm;border-bottom-width:0"/>
              <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0">19</div>
              <div class="styLNAmountBox" style="height:4;border-bottom-width:0">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/TotalPersonalUsePartOfCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End of Page -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <span class="styBoldText" style="width:76mm;">For Paperwork Reduction Act Notice, see instructions. </span>
              <span style="width:83mm; text-align:center;">Cat. No. 37721Q </span>
            </div>
            <div style="float:right;clear:none;">
              <span style="width:27mm;text-align:right;">Form <span class="styBoldText">8911 </span>(2013)</span>
            </div>
          </div>
          <br class="pageend"/>
          <!-- BEGIN Left Over Table -->
          <!-- ADDITIONAL DATA TITLE BAR AND BUTTON-->
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
              <xsl:with-param name="TargetNode" select="$Form8911"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
          <!-- Optional Print Solution for repeating data table  -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>