<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS6478Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form6478Data" select="$RtnDoc/IRS6478"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form6478Data)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching   -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Author" content="Ravi Venigalla"/>
        <meta name="Description" content="TY 2007 IRS Form 6478"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!-- Form 6478 CSS Styles are located in the template called below -->
            <xsl:call-template name="IRS6478Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass" style="width:187mm">
        <form name="Form6478" id="Form6478">
          <!-- Standard Warning Lines -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Number and Name -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:28mm;height:19mm;">
            Form <span class="styFormNumber">6478</span>
              <br/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form6478Data"/>
              </xsl:call-template>
              <br/>
              <div style="padding-top:1mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:129mm;height:13mm;">
              <div class="styMainTitle" style="padding-top:1.5mm;">
          	  Biofuel Producer Credit
          	 </div>
              <div class="styFST" style="height:5mm;font-size:7pt;padding-top:3mm;">
					<img src="{$ImagePath}/6478_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
					  Attach to your tax return.
              <div/>
              <div class="styFST" style="width:128mm;height:2mm;text-align:center;font-size:7pt;padding-top:1mm;">
                <img src="{$ImagePath}/6478_Bullet.gif" width="4" height="7" alt="Bullet Image"/> 
				  Information about Form 6478 and its separate instructions is at <a href="http://www.irs.gov/form6748" title="Link to irs.gov">
				  <i>www.irs.gov/form6478</i></a>.
			  </div>
            </div>
            </div>
            <!-- This can be taken out later -->
            <div class="styTYBox" style="width:30mm;height:19mm;">
              <div class="styOMB" style="height:4mm;">OMB No. 1545-0231</div>
              <div class="styTY" style="height:7mm;font-size:24pt;">
               20<span class="styTYColor">14</span>
              </div>
              <div class="stySequence" style="padding-top:2mm">Attachment<br/>Sequence No. <b style="font-size:7.5pt;">83</b>
              </div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Name and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:134mm;height:9mm;font-size:7pt;">
                Name(s) shown on return
             <br/>
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
            <div class="styEINBox" style="width:50mm;height:4mm;font-size:7pt;padding-left:2mm;">
              <span style="text-align:left;">Identifying number</span><br/>
              <br/>              
              <span style="font-weight:normal;text-align:center;width:50mm;">
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
          <!--Table header Begin -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" align="center" style="width:101.85mm;height:11mm;font-size:7pt;text-align:center;padding-top:4mm;">
            Type of Fuel
            </div>
            <div class="styNameBox" align="center" style="width:32.1mm;height:11mm;font-size:7pt;text-align: center;padding-top:.5mm;">
              <span class="styBoldText">(a)</span>
              <br/>Number of Gallons <br/>Sold or Used
            </div>
            <div class="styNameBox" align="center" style="width:21mm;height:11mm;font-size:7pt;text-align: center;padding-top:1mm;">
              <span class="styBoldText">(b)</span>
              <br/>Rate      
            </div>
            <div class="styNameBox" align="center" style="width:32mm;height:11mm;font-size:7pt;border-right-width:0px;text-align: center;padding-top:1mm;">
              <span class="styBoldText">(c)</span>
              <br/>Column(a) x Column(b)</div>
          </div>
          <!-- start line 1 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">1</div>
            <div class="styLNDesc" style="width:88.7mm;height:4mm;">
             Qualified second generation biofuel
            </div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;width:5mm;padding-right:2mm;"/>
            <div class="styLNAmountBox" style="width:32mm;border-bottom-width:0px;"/>
            <!-- Text is aligned center as it is in center aligned in the PDF -->
            <div class="styLNAmountBox" style="width:21mm;text-align:center;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-bottom-width:0px;"/>
          </div>
          <!-- End line 1 -->
          <!-- start line 1 extention -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:88.7mm;height:4mm;">
              <span style="float:left">production (see instructions for election)  </span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
            </div>
            <div class="styLNAmountBox" style="width:5mm;padding-right:1mm;"><b>1</b></div>
            <div class="styLNAmountBox" style="width:32mm;padding-right:1mm;text-align:center;">
              <xsl:call-template name="PopulateText">
                 <xsl:with-param name="TargetNode" select="$Form6478Data/Qlfy2ndBiofuelProdFuelGalsQty"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width:21mm;text-align:center;">  
			  $ 1.01    
            </div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/Qlfy2ndBiofuelProdFuelCrAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- End line 1a extention -->
           <!-- start line 2 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">2</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Enter the amount in column (c) on line 1.  Include this amount in your income for 2014, </span>
            </div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;width:8mm;padding-right:2mm;"/>
            <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;"/>
          </div>
          <!-- End line 2 -->
          <!-- start line 2 extention 1 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
              <span style="float:left;padding-right:1mm;">and enter your IRS registration number (see instructions) </span>
                <span class="styFixedUnderline" style="width:50mm;padding-top:.1mm;padding-bottom:0mm;text-align:center">
		 	<xsl:call-template name="PopulateText">
		 		<xsl:with-param name="TargetNode" select="$Form6478Data/FuelsCreditRegistrationNum"/>
		 	</xsl:call-template>
		</span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
            </div>
            <div class="styLNRightNumBox">2</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/OtherIncomeAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- end line 2 extention 1 -->
          <!-- start line3 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">3</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Biofuel producer credit from partnerships, S corporations, cooperatives, estates, and</span>
            </div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;width:8mm;padding-right:2mm;"/>
            <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;"/>
            <!-- Text is aligned center as it is in center aligned in the PDF -->
          </div>
          <!-- End line 3 -->
          <!-- start line 3 extention -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
              <span style="float:left">trusts (see instructions)</span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
            </div>
            <div class="styLNRightNumBox">3</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/BiofuelProducerCreditAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- end line 3 extension -->
           <!-- start line 4 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">4</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Add lines 2 and 3. Cooperatives, estates, and trusts, go to line 5. Partnerships and S corporations,</span>
            </div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;width:8mm;padding-right:2mm;"/>
            <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;"/>
            <!-- Text is aligned center as it is in center aligned in the PDF -->
          </div>
          <!-- End line 4 -->
          <!-- start line 4 extention 1-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
              <span style="float:left">stop here and report this amount on Schedule K. All others, stop here and report this amount on</span>
            </div>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"></div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;"></div>
          </div>
         <!-- end line 4 extension 1-->
          <!-- start line 4 extention 2-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
              <span style="float:left">Form 3800, Part III, line 4c</span>
               <!--Form 3800,line 4c-->
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">.........................</div>
            </div>
            <div class="styLNRightNumBox">4</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/EthanolAlcoholOtherCreditAmt"/>
              </xsl:call-template>
            </div>
          </div>
         <!-- end line 4 extension 2-->
          <!-- start line 5 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">5</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Amount allocated to patrons of the cooperative or beneficiaries of the estate or trust (see instructions)</span>
               <div class="styDotLn" style="float:right;padding-right:1mm;">.</div>
            </div>
            <div class="styLNRightNumBox">5</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/AllocatedToBeneficiariesAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- End line 5 -->
          <!-- start line 6 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">6</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Cooperatives, estates, and trusts, subtract line 5 from line 4. Report this amount on Form 3800,</span>
            </div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;width:8mm;padding-right:2mm;"/>
            <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;"/>
            <!-- Text is aligned center as it is in center aligned in the PDF -->
          </div>
          <!-- End line 6 -->
          <!-- start line 6 extention -->
          <div class="styBB" style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
              <span style="float:left">Part III, line 4c </span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">............................</div>
            </div>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;">6</div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/EstatesTrustsCooperativesAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- end line 6 extention -->          
          <!-- Start Reserved line 
          <div style="width:187mm;border-top-width:1px">
            <div class="styLNDesc" style="width:187mm;">
              <span style="width:6px;"/>
           <span/>Reserved
           <br/>
            </div>
          </div>-->
          <!-- Start asterisk line -->
          <!--div style="width:187mm;border-top-width:1px">
            <div class="styLNDesc" style="width:187mm;">
              <span style="width:6px;"/>
           *<span/>Only the rate for ethanol is shown. See instructions for the rate for alcohol other than ethanol.
           <br/>
            </div>
          </div-->
          <!-- end asterisk line -->
          <!-- Start asterisk line -->
          <!--div class="styBB" style="width:187mm;">
            <div class="styLNDesc" style="width:187mm;">
              <span style="width:6px;"/>
           **<span/>Only the rate for alcohol other than ethanol is shown. See instructions for the rate for ethanol.
           <br/>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <br/>
          </div-->
          <!-- end asterisk line -->
          <!-- Start Page footer -->
          <div class="styFooter" style="width:187mm; font-size:7pt; border-top:1 solid black; padding-top:1mm;">
            <div style="float:left; font-size:8.5pt">
              <b>For Paperwork Reduction Act Notice, see separate instructions.</b>
            </div>
            <div style="float:right;font-size:6pt">
              Cat. No. 13605J
                <span style="width:30mm"/>
                Form <b style="font-size:9pt">6478<span style="font-size:6pt"> (2014)</span>
              </b>
            </div>
          </div>
          <!-- end Page footer -->
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
              <xsl:with-param name="TargetNode" select="$Form6478Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
