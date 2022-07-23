<?xml version="1.0" encoding="UTF-8"?>
<!-- Last modified on 11/16/2016 by Harold Nadel for Defect # 47376 updated 2nd bullet in header with correct verbage, #46791 updated  -->
<!-- Last modified on 11/02/2016 by Harold Nadel for Defect # 46791 updated amount lines with blue shading per PDF review-->
<!-- Last modified on 9/30/2016 by Harold Nadel for WR# 183722 update tax year to TY2016-->
<!-- Last modified 1/13/2016 by Harold Nadel for Defect #59701  to update for TY2015 -->
<!-- Last modified on 4/06/2015 by Harold Nadel for WR # 123023 changes for IE11-->
<!-- Last modified on 3/2/2015 by Harold Nadel for Defect #42527 updated BusinessNameLine1 to BusinessNameLine1Txt and BusinessNameLine2 to BusinessNameLine2Txt.  -->
<!-- Last modified on 2/17/2015 by Harold Nadel for WR #150654 matched changes to PDF file dated 12/18/2014 -->
<!-- Last modified on 1/15/2015 by Harold Nadel for KISAM # IM01963843 changed verbage on line 5 and lined the dots on line 5 and line 7.  -->
<!-- 08/11/2017 - Changes made for UWR 199057 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8845Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form8845Data" select="$RtnDoc/IRS8845"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8845Data)"/>
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
        <meta name="Description" content="IRS Form 8845"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!-- Form 8845 CSS Styles are located in the template called below -->
            <xsl:call-template name="IRS8845Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form8845">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Number and Name -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:21mm;">
          Form <span class="styFormNumber">8845</span>
              <br/>
              <!--<span style="font-size:6pt;">(Rev. December 2006)</span>-->
              <br/>
              <div style="padding-top:2.85mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;">
              <div class="styMainTitle" style="height:8mm;padding-top: 1mm">
          Indian Employment Credit          
        </div>
              <br/><br/>
               <img src="{$ImagePath}/8845_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
	       <b>Attach to your tax return.</b>
              <br/>
				<div class="styFST" style="height:5mm;font-size:6.5pt;padding-top:.5mm;">
					<img src="{$ImagePath}/8845_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
					Go to <i>www.irs.gov/Form8845</i> for instructions and the latest information
				</div>
            </div>
            <div class="styTYBox" style="width:31mm;height:21mm;">
              <div class="styOMB" style="height:auto;padding-top:1mm;">OMB No. 1545-0123</div>
              <div class="styTaxYear" style="height:auto;font-size:24pt;">
          20<span class="styTYColor">18</span>
        </div>
              <div class="stySequence">Attachment<br/>Sequence No.<b> 113</b>
              </div>
              <!-- "Please remove at end of year"	Attachment<span style="width:20px;"></span><br/> 
        	<span style="width:12px;"></span>Sequence No.<span style="width:4px;"></span><span class="styBoldText">113</span>-->
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:156mm;height:auto;font-size:7pt;">
        Name(s) as shown on return<br/>
		  <xsl:choose>
		    <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
		      <br/>
		      <xsl:call-template name="PopulateReturnHeaderFiler">
		            <xsl:with-param name="TargetNode">Name</xsl:with-param>
		              </xsl:call-template>
		            </xsl:when>
                  <xsl:otherwise>
		      <xsl:call-template name="PopulateReturnHeaderFiler">
		            <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
		              </xsl:call-template>
		              <br/> 
		              <xsl:call-template name="PopulateReturnHeaderFiler">
		            <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
		              </xsl:call-template>		
		                </xsl:otherwise>
                  </xsl:choose>
            </div>
            <div class="styEINBox" style="width:30mm;height:4mm;padding-left:2mm;font-size:7pt;">
        Identifying number<br/>
              <br/>
              <span style="font-weight:normal;">
		<xsl:choose>
		  <xsl:when test="$RtnHdrData/ReturnTypeCd='1040NR'">
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
          <!-- Line 1 -->
          <div class="styBB" style="width:187mm">
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBoxSD" style="height:auto;padding-top:4.5mm">1</div>
                <div class="styLNDesc" style="width:139mm;height:auto;padding-top:4.5mm;">
                   Total of qualified wages and qualified employee health insurance costs paid or incurred during the tax year.
                  <!--Dotted Line
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">...</span>-->
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:8mm;padding-top: 0mm">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>1</div>
                <div class="styLNAmountBox" style="height:8mm;padding-top:4.5mm;">
                  <span style="width:7mm;"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/TotQlfyWagesEmplHlthInsAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Line 2 -->
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBoxSD" style="height:auto;padding-top:1mm;">2</div>
                <div class="styLNDesc" style="width:139mm;height:auto;padding-top:1mm;">
                  Calendar year 1993 qualified wages and qualified employee health insurance costs (see instructions). If none, enter 0.   
                  <!--Dotted Line-->
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">..........................</span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:8mm;padding-top: 0mm">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>2</div>
                <div class="styLNAmountBox" style="height:8mm;padding-top:4.5mm;">
                  <span style="width:7mm;"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/CY93TotQlfyWagesEmplHlthInsAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Line 3 -->
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBoxSD" style="height:auto;padding-top:4.5mm;">3</div>
                <div class="styLNDesc" style="width:139mm;height:auto;padding-top:4.5mm;">
                  Incremental increase. Subtract Line 2 from line 1. If zero or less, enter 0,
                  <!--Dotted Line-->
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">.........</span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:8mm;padding-top: 0mm">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>3</div>
                <div class="styLNAmountBox" style="height:8mm;padding-top:4.5mm;">
                  <span style="width:7mm;"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/IncrementalIncreaseAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Line 4 -->
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBoxSD" style="height:auto;padding-top:4.5mm;">4</div>
                <div class="styLNDesc" style="width:139mm;height:auto;padding-top:4.5mm;">
                  Multiply line 3 by 20% (.20). See instructions for the adjustment you must make to salaries and wages.
                  <!--Dotted Line
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">......................</span>-->
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:8mm;padding-top: 0mm">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>4</div>
                <div class="styLNAmountBox" style="height:8mm;padding-top:4.5mm;;">
                  <span style="width:7mm;"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/CurrentYearCreditAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Line 5 -->
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
               <div class="styLNLeftNumBoxSD" style="height:auto;padding-top:1mm;">5</div>
                <div class="styLNDesc" style="width:138.9mm;heigh:auto;padding-top:1mm;">
                  Indian employment credit from partnerships, S corporations, cooperatives, estates, <br/>
                  <span style="float:left;">and trusts</span>
                  <!--Dotted Line-->
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">.........................</span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:8.25mm;padding-top:0mm;">
                  <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>5
				  </div>
                <div class="styLNAmountBox" style="height:8.25mm;padding-top: 4.25mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/IndianEmploymentCreditAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Line 6 -->
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBoxSD" style="height:auto;">6</div>
                <div class="styLNDesc" style="width:138.9mm;height:auto;">
                  Add lines 4 and 5. Cooperatives, estates, and trusts, go to line 7. Partnerships and S corporations, <br/>
		    <span style="float:left;">stop here and report this amount on Schedule K. All others, stop here and report this amount on  <br/>
		    <span style="float:left;">Form 3800 Part III, line 1g </span>
		    <!--Dotted Line-->
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;padding-left:1.5mm;"> .....................</span></span>
                </div>
              </div>
              <div style="float:right;clear:none">
                <div class="styLNRightNumBox" style="height:auto;padding-top:0mm;">
                  <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;padding-bottom:6mm;"/>
        		6
                </div>
                <div class="styLNAmountBox" style="height:auto;padding-top:6.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/CYIndianEmploymentCreditAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Line 7 -->
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBoxSD" style="height:auto;padding-top:3mm;">7</div>
                <div class="styLNDesc" style="width:138.9mm;height:auto;padding-top:3mm;">
                  Amount allocated to patrons of the cooperative or beneficiaries of the estate or trust (see instructions)
				  <span style="float:left;">
                  <!-- Form to Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/AllocatedToBeneficiariesAmt"/>
                  </xsl:call-template>
                  </span>
                  <!--Dotted Line-->
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">.</span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:8.25mm;padding-top:0mm;">
                  <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>7</div>
                <div class="styLNAmountBox" style="height:8.25mm;padding-top:4.25mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/AllocatedToBeneficiariesAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Line 8 -->
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBoxSD" style="height:auto;">8</div>
                <div class="styLNDesc" style="width:138.9mm;height:auto;">
                  Cooperatives, estates, and trusts, subtract line 7 from line 6. Report this amount on <br/>
                    <span style="float:left;">Form 3800 Part III, line 1g</span>
		      <!--Dotted Line-->
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">....................</span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:0mm;">
                  <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
        		8
        </div>
                <div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4.25mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/EstatesTrustsAndCoopsCreditAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- Page End -->
          <div style="width:187mm;">
            <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>  
            Cat. No. 16146D 
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:7px;"/>
            Form <span class="styBoldText">8845</span> (2018)
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
              <xsl:with-param name="TargetNode" select="$Form8845Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>