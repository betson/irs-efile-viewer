<?xml version="1.0" encoding="UTF-8"?>
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
    <html lang="EN-US">
      <head>
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
              <br/>
              <br/>
              <div class="styFST" style="height:5mm;font-size:7pt;padding-top:1.5mm;">
                <img src="{$ImagePath}/8845_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
          Attach to your tax return.
        </div>
            </div>
            <div class="styTYBox" style="width:31mm;height:21mm;">
              <div class="styOMB" style="height:4mm;padding-top:1mm;">OMB No. 1545-1417</div>
              <div class="styTaxYear" style="height:7.5mm;font-size:24pt;">
          20<span class="styTYColor">11</span>
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
            <div class="styNameBox" style="width:156mm;height:8mm;font-size:7pt;">
        Name(s) as shown on return<br/>
		  <xsl:choose>
		    <xsl:when test="$RtnHdrData/ReturnType='1040'">
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
            <div class="styEINBox" style="width:30mm;height:4mm;padding-left:2mm;font-size:7pt;">
        Identifying number<br/>
              <br/>
              <span style="font-weight:normal;">
		<xsl:choose>
		  <xsl:when test="$RtnHdrData/ReturnType='1040'">
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
                <div class="styLNLeftNumBoxSD" style="height:8.5mm;padding-top:1mm;">1</div>
                <div class="styLNDesc" style="width:139mm;height:8.5mm;padding-top:1mm;">
                  Total of qualified wages and qualified employee health insurance costs paid or incurred during the tax 
                  <span style="float:left;">year </span>
                  <!--Dotted Line-->
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">...........................</span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:8.5mm;padding-top: 4.5mm">1</div>
                <div class="styLNAmountBox" style="height:8.5mm;padding-top:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/TotalOfQualifiedWages"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Line 2 -->
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBoxSD" style="height:8mm;">2</div>
                <div class="styLNDesc" style="width:139mm;height:8mm;">
                  Calendar year 1993 qualified wages and qualified employee health insurance costs (see instructions). If 
                  <span style="float:left;">none, enter -0- </span>
                  <!--Dotted Line-->
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">.........................</span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:8mm;padding-top: 4mm;">2</div>
                <div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/CalendarYear1993QualifiedWages"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Line 3 -->
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBoxSD" style="height:8mm;padding-top: 4mm;">3</div>
                <div class="styLNDesc" style="width:139mm;height:8mm;padding-top: 4mm;">
                  <span style="float:left;">Incremental increase. Subtract line 2 from line 1. If zero or less, enter -0- </span>
                  <!--Dotted Line-->
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">........</span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:8mm;padding-top: 4mm;">3</div>
                <div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/IncrementalIncrease"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Line 4 -->
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBoxSD" style="height:8mm;">4</div>
                <div class="styLNDesc" style="width:139mm;height:8mm;">
                  Multiply line 3 by 20% (.20). See instructions for the adjustment you must make to salaries and wages
        	    <span style="float:left;">
                  <!-- Form to Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/CurrentYearCredit"/>
                  </xsl:call-template>
                  </span>
                  <!--Dotted Line-->
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">............................</span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:8mm;padding-top: 4mm;">4</div>
                <div class="styLNAmountBox" style="height:8mm;padding-top: 4mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/CurrentYearCredit"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Line 5 -->
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBoxSD" style="height:8mm;">5</div>
                <div class="styLNDesc" style="width:138.9mm;height:8mm;">
                  Indian employment credits from partnerships, S corporations, cooperatives, estates, and trusts
                  <span style="float:left;"></span>
                  <!--Dotted Line-->
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">.............................</span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:8.25mm;padding-top:0mm;">
                  <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
		5
	  </div>
                <div class="styLNAmountBox" style="height:8.25mm;padding-top: 4.25mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/IndianEmploymentCredit"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Line 6 -->
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBoxSD" style="height:10.5mm;">6</div>
                <div class="styLNDesc" style="width:138.9mm;height:10.5mm;">
                  Add lines 4 and 5. Cooperatives, estates, and trusts, go to line 7. Partnerships and S corporations,
		    <span style="float:left;">stop here and report this amount on Schedule K. All others, stop here and report this amount on 
		    <span style="float:left;">Form 3800, line 1g</span>
		    <!--Dotted Line-->
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">........................</span></span>
                </div>
              </div>
              <div style="float:right;clear:none">
                <div class="styLNRightNumBox" style="height:10.5mm;padding-top:0mm;">
                  <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;padding-bottom:3mm;"/>
        		6
                </div>
                <div class="styLNAmountBox" style="height10.5mm;padding-top:6.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/AddLines4And5"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Line 7 -->
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBoxSD" style="height:8mm;">7</div>
                <div class="styLNDesc" style="width:138.9mm;height:8mm;">
                  Amount allocated to patrons of the cooperative or beneficiaries of the estate or trust (see instructions)
		    <span style="float:left;">
                  <!-- Form to Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/AmountAllocatedToPatrons"/>
                  </xsl:call-template>
                  </span>
                  <!--Dotted Line-->
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">............................</span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:8.25mm;padding-top:0mm;">
                  <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
        		7
        </div>
                <div class="styLNAmountBox" style="height:8.25mm;padding-top:4.25mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/AmountAllocatedToPatrons"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Line 8 -->
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBoxSD" style="height:8mm;">8</div>
                <div class="styLNDesc" style="width:138.9mm;height:8mm;">
                  Cooperatives, estates, and trusts, subtract line 7 from line 6. Report this amount on Form 3800, line 1g
                    <span style="float:left;"></span>
		      <!--Dotted Line-->
                  <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">.............................</span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:0mm;">
                  <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
        		8
        </div>
                <div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4.25mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8845Data/EstatesTrustsCooperativesCR"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- Page End -->
          <div style="width:187mm;">
            <span class="styBoldText">For Paperwork Reduction Act Notice, see back of form. </span>
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
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:7px;"/>
            Form <span class="styBoldText">8845</span> (2011)
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
