<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8916Style.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8916"/>
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
		  <meta name="Description" content="Schedule P (Form 5735)"/>
		  <meta name="Generator" content="IBM WebSphere Studio"/>
		  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
		  <xsl:call-template name="InitJS"/>
		  <style type="text/css">
			<xsl:if test="not($Print) or $Print=''">
			  <xsl:call-template name="IRS8916Style"/>
			  <xsl:call-template name="AddOnStyle"/>
			</xsl:if>
		  </style>
		  <xsl:call-template name="GlobalStylesForm"/>
		</head>
		<body class="styBodyClass">
		  <form style="font-family:Arial; font-size:9pt">
			<xsl:call-template name="DocumentHeader"/>
			<!-- Begin Form title an dForm number section -->
			  <div class="styBB" style="width:187mm;clear:both;float:none;">
				<div class="styFNBox" style="width:31mm;height:18mm;">
                  Form <span class="styFormNumber">8916</span>
                  <div class="styAgency" style="padding-left:3mm;padding-top:1.5mm;">(Rev. December 2008)</div>
                  <div class="styAgency" style="padding-left:3mm;height:1.5mm;">Department of the Treasury</div>
                  <div class="styAgency" style="padding-left:3mm;height:1.5mm;">Internal Revenue Service</div>
				</div>
				<div class="styFTBox" style="width:125mm;height:15mm; ">
				  <div class="styMainTitle" style="padding-top:0mm;">
                    Reconciliation of Schedule M-3 Taxable Income <br/>
                    with Tax Return Taxable Income for Mixed Groups
                  </div>
				  <div class="styFST" style="font-size:7pt;padding-top:5mm;font-weight:bold;">
					<img src="{$ImagePath}/8916_Bullet.gif" alt="bullet image"/>
                    Attach to Schedule M-3 for Forms 1120, 1120-L, or 1120-PC.
                  </div>
				</div>
				<div class="styTYBox" style="width:30mm;height:20.4mm;font-size:7pt;">
				  <div class="styOMB" style="height:2mm;border-bottom-width:0px;">
                    OMB No. 1545-2062
                  </div>
	                <!--<div class="styTY" style="height:5mm;font-size:23pt; padding-top:2mm;">hhhhhh
					  <div class="styTaxYear" style="height:9mm;padding-top:0;">20<span class="styTYColor">07</span>
					  </div>  					
					</div>-->
				  </div>
			  </div>
			  <!-- End form title and Form number Section -->
			  <!-- Begin Name and Identifying Number Section-->
			  <div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
			    <div class="styFNBox" style="width:144mm;height:8mm;">
                  Name of common parent<br/>
				  <xsl:call-template name="PopulateText">
				    <xsl:with-param name="TargetNode" select="$FormData/BusinessName/BusinessNameLine1"/>
				  </xsl:call-template>
				  <br/>
				  <xsl:call-template name="PopulateText">
				    <xsl:with-param name="TargetNode" select="$FormData/BusinessName/BusinessNameLine2"/>
				  </xsl:call-template>
			    </div>
			    <div class="styEINBox" style="padding-left:2mm;">
			      <span class="BoldText">Employer identification number</span>
				  <br/>
				  <br/>
				  <span style="font-weight:normal;">
				    <xsl:choose>
					  <xsl:when test="$FormData/EIN">
					    <xsl:call-template name="PopulateEIN">
						  <xsl:with-param name="TargetNode" select="$FormData/EIN"/>
					    </xsl:call-template>
					  </xsl:when>
					  <xsl:otherwise>
					    <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$FormData/MissingEINReason"/>
					    </xsl:call-template>
					  </xsl:otherwise>
				    </xsl:choose>
				  </span>
			    </div>
			  </div>
			  <!-- End Name and Identifying Number Section-->
			  <!-- BEGIN Part I Line Items -->
			  <!-- line 1 -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:6mm;padding-top:3mm;">1</div>
			      <div class="styLNDesc" style="width:99mm;height:6mm;padding-top:3mm;">
			        Enter the tax reconciliation amount from the applicable line of 
			        <span style="float:left;">Schedule M-3 (see instructions)</span>
				    <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
			      </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:11.5mm;padding-top:6mm;">1</div>
			      <div class="styLNAmountBox" style="height:11.5mm;padding-top:6mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/SchM3TaxReconciliationAamt"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:11.5mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:11.5mm;border-bottom-width:0px;"/>
			    </div>
			  </div>			  		
			  <!-- line 2a -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:6mm;padding-top:5mm;">2a</div>
			      <div class="styLNDesc" style="width:99mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;">Life/non-life loss limitation amount </span> 
				    <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
			      </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">2a</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/LifeNonLifeLimitationAmount"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>		
			  <!-- Line 2b -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:6mm;padding-top:5mm;padding-left:3mm;">b</div>
			      <div class="styLNDesc" style="width:99mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;">Limitation on non-insurance losses (Form 1120-L, page 1, line 25) </span> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">2b</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/LimitationOnNonIssuranceLosses"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>		  
			  <!-- line 2c -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:6mm;padding-top:3mm;padding-left:3mm;">c</div>
			      <div class="styLNDesc" style="width:99mm;height:6mm;padding-top:3mm;">
			        Amount subtracted from policyholders surplus account (Form  
			        <span style="float:left;">1120-L, page 1, line 26) </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">................</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:11.5mm;padding-top:6mm;">2c</div>
			      <div class="styLNAmountBox" style="height:11.5mm;padding-top:6mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/AmtSubFromPlcyhldrsSurplusAcct"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:11.5mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:11.5mm;border-bottom-width:0px;"/>
			    </div>
			  </div>		 
			  <!-- Line 2d(1) -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:6mm;padding-top:5mm;padding-left:3mm;">d</div>
			      <div class="styLNDesc" style="width:99mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;">
					  <span class="styBoldText" > (1)</span>
						Non-life capital loss limitation
					  </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">.............</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">2d(1)</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/NonLifeCapitalLossLimitation"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>
			  <!-- Line 2d(2) -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNDesc" style="width:107mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;padding-left:8mm;">
					  <span class="styBoldText"> (2)</span>
						Life capital loss limitation
					  </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">..............</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">2d(2)</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/LifeCapitalLossLimitation"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>
			  <!-- Line 2e(1) -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:6mm;padding-top:5mm;padding-left:3mm;">e</div>
			      <div class="styLNDesc" style="width:99mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;">
					  <span class="styBoldText" > (1)</span>
						Non-life charitable deduction limitation
					  </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">.........</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">2e(1)</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/NonLifeCharitableDedLmt"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>
			  <!-- Line 2e(2) -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNDesc" style="width:107mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;padding-left:8mm;">
					  <span class="styBoldText"> (2)</span>
						Life charitable deduction limitation
					  </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">...........</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">2e(2)</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/LifeCharitableDedLmt"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>
			  <!-- Line 2f(1) -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:6mm;padding-top:5mm;padding-left:3mm;">f</div>
			      <div class="styLNDesc" style="width:99mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;">
					  <span class="styBoldText" > (1)</span>
						Non-life dual consolidated loss amount disallowed
					  </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">.....</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">2f(1)</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/NonLifeDualConsolidatedLoss"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>
			  <!-- Line 2f(2) -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNDesc" style="width:107mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;padding-left:8mm;">
					  <span class="styBoldText"> (2)</span>
						Life dual consolidated loss amount disallowed
					  </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">......</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">2f(2)</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/LifeDualConsolidatedLoss"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>
			  <!-- Line 3 -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:6mm;padding-top:5mm;">3</div>
			      <div class="styLNDesc" style="width:139mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;">Combine lines 1 through 2f(2) </span> 
				    <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
			      </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">3</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/SchM3TaxRecnclPlusLmtAmt"/>
				    </xsl:call-template>
			      </div>
			    </div>
			  </div>		
			  <!-- Line 4a(1) -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:6mm;padding-top:5mm;">4a</div>
			      <div class="styLNDesc" style="width:99mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;">
					  <span class="styBoldText" > (1)</span>
						Non-life net operating loss deduction
					  </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">..........</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">4a(1)</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/NonLifeNetOperatingLossDed"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>
			  <!-- Line 4a(2) -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNDesc" style="width:107mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;padding-left:8mm;">
					  <span class="styBoldText"> (2)</span>
						Life operations loss deduction
					  </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">............</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">4a(2)</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/LifeOperationsLossDeduction"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>
			  <!-- Line 4b(1) -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:6mm;padding-top:5mm;padding-left:3mm">b</div>
			      <div class="styLNDesc" style="width:99mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;">
					  <span class="styBoldText" > (1)</span>
						Non-life dividends received deduction
					  </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">..........</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">4b(1)</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/NonLifeDividendsReceivedDed"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>
			  <!-- Line 4b(2) -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNDesc" style="width:107mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;padding-left:8mm;">
					  <span class="styBoldText"> (2)</span>
						Life dividends received deduction
					  </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">...........</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">4b(2)</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/LifeDividendsReceivedDed"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>
			  <!-- Line 4c(1) -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:6mm;padding-top:5mm;padding-left:3mm">c</div>
			      <div class="styLNDesc" style="width:99mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;">
					  <span class="styBoldText" > (1)</span>
						Non-life capital loss carryforward used
					  </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">..........</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">4c(1)</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/NonLifeCapitalLossCfwdUsed"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>
			  <!-- Line 4c(2) -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNDesc" style="width:107mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;padding-left:8mm;">
					  <span class="styBoldText"> (2)</span>
						Life capital loss carryforward used
					  </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">...........</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">4c(2)</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/LifeCapitalLossCfwdUsed"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>
			  <!-- Line 4d(1) -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:6mm;padding-top:5mm;padding-left:3mm">d</div>
			      <div class="styLNDesc" style="width:99mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;">
					  <span class="styBoldText" > (1)</span>
						Non-life charitable deduction carryforward used
					  </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">.....</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">4d(1)</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/NonLifeCharitableDedCfwdUsed"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>
			  <!-- Line 4d(2) -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNDesc" style="width:107mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;padding-left:8mm;">
					  <span class="styBoldText"> (2)</span>
						Life charitable deduction carryforward used
					  </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">........</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">4d(2)</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/LifeCharitableDedCfwdUsed"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:10mm;border-bottom-width:0px;"/>
			    </div>
			  </div>
			  <!-- line 4e(1) -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;padding-left:3mm;">e</div>
			      <div class="styLNDesc" style="width:99mm;height:8mm;padding-top:4mm;">
			        Small life insurance company deduction (Form 1120-L, page 1,   
			        <span style="float:left;">line 23) </span>
			        <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div> 
				  </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:12.5mm;padding-top:7mm;">4e(1)</div>
			      <div class="styLNAmountBox" style="height:12.5mm;padding-top:7mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/SmallLifeInsuranceCompanyDed"/>
				    </xsl:call-template>
			      </div>
			      <div class="styLNRightNumBox" style="height:12.5mm;background-color:lightgrey;border-bottom-width:0px;"/>
			      <div class="styLNAmountBox" style="height:12.5mm;border-bottom-width:0px;"/>
			    </div>
			  </div>		
			  <!-- Line 5 -->
			  <div style="width:187mm">
				<div style="float:left; width:147mm;height:4mm;"/>					
				<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;width:8mm;"/>
				<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
			  </div>
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:4mm;padding-top:3mm;">5</div>
			      <div class="styLNDesc" style="width:139mm;height:4mm;padding-top:3mm;">
			        <span style="float:left;">Add lines 4a(1) through 4e</span> 
				    <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
			      </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:8mm;padding-top:3mm;">5</div>
			      <div class="styLNAmountBox" style="height:8mm;padding-top:3mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/AddCfwdAndDeductionAmounts"/>
				    </xsl:call-template>
			      </div>
			    </div>
			  </div>		
			  <!-- Line 6 -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:6mm;padding-top:5mm;">6</div>
			      <div class="styLNDesc" style="width:139mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;">Subtract line 5 from line 3 </span> 
				    <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">.........................</div>
			      </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">6</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/SubCfwdAndDedFrmShM3PlusLmtAmt"/>
				    </xsl:call-template>
			      </div>
			    </div>
			  </div>		
			  <!-- Line 7 -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:6mm;padding-top:5mm;">7</div>
			      <div class="styLNDesc" style="width:139mm;height:6mm;padding-top:5mm;">
			        <span style="float:left;">Other adjustments to reconcile to taxable income on tax return (attach schedule)</span> 
				    <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">...
					  <xsl:call-template name="SetFormLinkInline">
					    <xsl:with-param name="TargetNode" select="$FormData/OtherReconcileAdjustments"/>
					  </xsl:call-template>		    
				    </div>
			      </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">7</div>
			      <div class="styLNAmountBox" style="height:10mm;padding-top:5mm;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/OtherReconcileAdjustments"/>
				    </xsl:call-template>
			      </div>
			    </div>
			  </div>	
			  <!-- Line 8 -->
			  <div style="width:187mm">
			    <div style="float:left;clear:none;">
			      <div class="styLNLeftNumBox" style="height:5mm;padding-top:4mm;">8</div>
			      <div class="styLNDesc" style="width:139mm;height:5mm;padding-top:4mm;">
				    <span style="font-weight:bold">Total.</span> 
					  Combine lines 6 and 7. This amount must equal the amount reported on the "Taxable Income
			        line of  the consolidated Form 1120, Form 1120-L, or Form 1120-PC, (see instructions)
			      </div>
			    </div>
			    <div style="float:right;clear:none;">
			      <div class="styLNRightNumBox" style="height:13mm;padding-top:8mm;border-bottom-width:0px;">8</div>
			      <div class="styLNAmountBox" style="height:13mm;padding-top:8mm;border-bottom-width:0px;">
				    <xsl:call-template name="PopulateAmount">
				      <xsl:with-param name="TargetNode" select="$FormData/Total"/>
				    </xsl:call-template>
			      </div>
			    </div>
			  </div>		
			  <!--  End of Page  -->
			  <div style="width:187mm; border-top:1 solid Black; font-size:8pt;">
			    <div style="font-weight:bold; float:left; padding-top:0.5mm;">
                  For Paperwork Reduction Act Notice,  see page 2.  
			    </div>
				<div style="float:right">
				  <span style="margin-right:20mm; font-size:7pt;">Cat. No. 37727E</span>          
                    Form <b>8916</b> (12-2008)   
                </div>
			  </div>
			  <p style="page-break-before:always"/>
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
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
	  </html>
  </xsl:template>
</xsl:stylesheet>
