<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS5713ScheduleCStyle.xsl"/>
<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
<xsl:param name="Form5713CData" select="$RtnDoc/IRS5713ScheduleC" />
<xsl:template match="/">
<html>
  <head>
    <META http-equiv="Content-Type" content="text/html"/>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form5713CData)"></xsl:with-param></xsl:call-template></title>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="Cache-Control" content="private"/>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <meta name="Description" content="Schedule C (5713)"/>
    <META name="GENERATOR" content="IBM WebSphere Studio"/>
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
    <style type="text/css">
      <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS5713ScheduleCStyle"></xsl:call-template>    
        <xsl:call-template name="AddOnStyle"></xsl:call-template>    
      </xsl:if>
    </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
 <body class="styBodyClass">     
  <form name="Form5713C">
    <xsl:call-template name="DocumentHeader"></xsl:call-template>
    <div class="styTBB" style="width:187mm;height:16mm; border-bottom: 0px;">
      <div class="styFNBox" style="width:32mm;height:19mm;">
        <div class="styFormNumber" style="font-size:9pt;">SCHEDULE C</div>
        <div class="styFormNumber" style="font-size:9pt;">(Form 5713)</div>
        <div style="width:31mm;font-weight:normal;font-size:6.5pt;">(Rev. December 2010)</div>
        <!--General Dependency Push Pin
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120Data"/>
              </xsl:call-template> -->
        <div>
          <span class="styAgency">Department of the Treasury</span><br/>
          <span class="styAgency">Internal Revenue Service</span>
        </div>
      </div>
      <div class="styFTBox" style="width:125mm;height:19mm;">
        <div class="styMainTitle">Tax Effect of the International Boycott Provisions</div>
        <div class="styFBT" style="height:7mm;padding-top:2mm;">
            <img src="{$ImagePath}/5713SchC_Bullet.gif" alt="bullet image pointing to right" width="4"/> Attach to Form 5713.<br/>
            <img src="{$ImagePath}/5713SchC_Bullet.gif" alt="bullet image pointing to right" width="4"/> See instructions on page 2.<br/>
            <!--<img src="{$ImagePath}/5713SchC_Bullet.gif" alt="bullet image pointing to right" width="4"/> Use with the December 2004 revision of Form 5713.-->
        </div>
      </div>
      <div class="styTYBox" style="width:30mm;height:19mm;"><br/><br/>
        <div style="font-size:7pt;padding-top:3mm;">OMB No. 1545-0216</div>
      </div>
      <div class="styBB" style="width:187mm;border-top-width:1px;">
        <div class="styNameBox" style="font-family:verdana;font-size:7pt;width:139mm;height:4mm;text-align:bottom;">Name<br/>
        <xsl:choose>
				<xsl:when test="$Form5713CData/BusinessName/BusinessNameLine1 != ''">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form5713CData/BusinessName/BusinessNameLine1" />
				  </xsl:call-template>  
				</xsl:when>
				<xsl:otherwise>
				  <xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
				  </xsl:call-template>				  
				</xsl:otherwise>
			  </xsl:choose>
			  <br/> 
			  <xsl:choose>
			    <xsl:when test="$Form5713CData/BusinessName/BusinessNameLine2 != ''">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form5713CData/BusinessName/BusinessNameLine2" />
				  </xsl:call-template>				  
				</xsl:when>
				<xsl:otherwise>
				  <xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
				  </xsl:call-template>  
				</xsl:otherwise>
			  </xsl:choose>
          <!--<xsl:choose>
			<xsl:when test="/AppData/Parameters/SubmissionType='CIT'">
			  <xsl:choose>
				<xsl:when test="$Form5713CData/BusinessName/BusinessNameLine1 != ''">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form5713CData/BusinessName/BusinessNameLine1" />
				  </xsl:call-template>  
				</xsl:when>
				<xsl:otherwise>
				  <xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
				  </xsl:call-template>				  
				</xsl:otherwise>
			  </xsl:choose>
			  <br/> 
			  <xsl:choose>
			    <xsl:when test="$Form5713CData/BusinessName/BusinessNameLine1 != ''">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form5713CData/BusinessName/BusinessNameLine2" />
				  </xsl:call-template>				  
				</xsl:when>
				<xsl:otherwise>
				  <xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
				  </xsl:call-template>  
				</xsl:otherwise>
			  </xsl:choose>
			</xsl:when>
			<xsl:otherwise>
			  <br/>
				<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name" />
				</xsl:call-template>
			</xsl:otherwise>
		  </xsl:choose>-->
        </div>
        <div class="styEINBox" style="font-family:verdana;font-size:7pt;width:48mm;height:4mm;padding-left:2mm;">Identifying number<br /><br />
          <span style="text-align:left;font-weight:normal;">
          <xsl:choose >
		    <xsl:when test="$Form5713CData/EIN">
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="$Form5713CData/EIN" />
              </xsl:call-template>
            </xsl:when>
            <xsl:when test="$Form5713CData/MissingEINReason">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form5713CData/MissingEINReason" />
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
            <!--<xsl:choose>
			  <xsl:when test="/AppData/Parameters/SubmissionType='CIT'">
			    <xsl:choose>
			      <xsl:when test="$Form5713CData/EIN != ''">			      
					  <xsl:if test="$Form5713CData/EIN">
					    <xsl:call-template name="PopulateEIN">
					      <xsl:with-param name="TargetNode" select="$Form5713CData/EIN" />
				        </xsl:call-template>
				      </xsl:if>
				      <xsl:if test="$Form5713CData/MissingEINReason">
					    <xsl:call-template name="PopulateText">
					      <xsl:with-param name="TargetNode" select="$Form5713CData/MissingEINReason" />
				        </xsl:call-template>
				      </xsl:if>
				      </xsl:when>
				      <xsl:otherwise>				       
				        <xsl:call-template name="PopulateReturnHeaderFiler">
					      <xsl:with-param name="TargetNode">EIN</xsl:with-param>
				        </xsl:call-template>
				    </xsl:otherwise>
				  </xsl:choose>
				</xsl:when>
				<xsl:otherwise>				  
			    <xsl:call-template name="PopulateReturnHeaderFiler">
				  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
			    </xsl:call-template>			  
			</xsl:otherwise>
		  </xsl:choose>-->
		  </span>
        </div>
      </div>
    </div>
<!-- item 1 row 1 start -->
    <div style="width:181mm;">
      <div class="styLNLeftNumBox" style="height:4.5mm;">1</div>
      <div class="styLNDesc" style="width:90mm;height:4.5mm;">Method used to compute loss of tax benefits (check one):</div>
    </div>
    <div style="width:187mm;">
      <!-- To accomodate right floats, items listed in reverse: -->   
      <input type="checkbox" class="styCkbox" style="float: right; clear: none;">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form5713CData/IntntlBoycottFactorMethod" />
        </xsl:call-template>
      </input>
      <label style="float: right; clear: none;">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form5713CData/IntntlBoycottFactorMethod" />
        </xsl:call-template>
      </label>
      <span class="styBoldText" style="width: 3mm; float: right; clear: none;"></span>
      <img src="{$ImagePath}/5713SchC_Bullet.gif" alt="bullet image pointing to right" style="float: right; clear: none;" />
      <span class="styLNLeftLtrBox" style="height:4.5mm; float: left; clear: none;">a</span>
      <span class="styLNDesc" style="width:169mm; height:4.0mm;">
        <span style="float:left;">International boycott factor from Schedule A (Form 5713). See lines 2a, 3a, 4a, and 5a below </span> 
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
      </span>
    </div>
    <div class="styBB" style="width:187mm;">
      <!-- To accomodate right floats, items listed in reverse: -->   
      <input type="checkbox" class="styCkbox" style="float: right; clear: none;">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name = "TargetNode" select="$Form5713CData/SpcfcAttrblTaxesAndIncmMethod" />
        </xsl:call-template>
      </input>
      <span class="styBoldText" style="width:3mm; float: right; clear: none;"></span>
      <label style="float: right; clear: none;">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form5713CData/SpcfcAttrblTaxesAndIncmMethod" />
        </xsl:call-template>
      </label>
      <img src="{$ImagePath}/5713SchC_Bullet.gif" alt="bullet image pointing to right" style="float: right; clear: none;" />       
    <div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
    <div class="styLNDesc" style="width:169mm;height:4.5mm;border-bottom-width:1px;">
      <span style="float:left;">Identification of specifically attributable taxes and income from Schedule B (Form 5713). See lines 2b, 3b, 4b, and 5b below </span> 
      <!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
    </div>
  </div>
<!-- Item 1 end -->
<!-- Item 2 start -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">2</div>
    <div class="styLNDesc" style="width:146mm;height:4mm;">Reduction of foreign tax credit (section 908(a)):
    </div>
    <div class="styShadingCell" style="height:5mm;"></div><br/>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
    <div class="styLNDesc" style="width:146mm;height:4mm;"><b>International boycott factor.</b><span style="width:1mm;"></span>Complete if you checked box 1a above and answered "Yes" to the question on line 7d, Form 5713.
    </div>
    <div class="styShadingCell" style="height:8mm;"></div><br/>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:146mm">
      <span style="float:left;"><b>(1)<span style="width:1.5mm;"/></b>Foreign tax credit before adjustment from Form 1116 or 1118 (see instructions) </span>
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
    </div>
    <div class="styLNAmountBox" style="border-top-width:0px;text-align:bottom;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713CData/FrgnTaxCrBefore1116Or1118Adj" />
      </xsl:call-template>    
    </div>
  </div>
  <!-- item 2a(2) -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:146mm">
      <span style="float:left;"><b>(2)<span style="width:1.5mm;"/></b>International boycott factor from Schedule A (Form 5713), line 3 </span>
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
    </div>
    <div class="styLNAmountBox" style="border-top-width:0px;text-align:bottom;">
	<xsl:call-template name="PopulateText">
		<xsl:with-param name="TargetNode" select="$Form5713CData/RedFrgnTxCrIntntlBoycottFactor" />
     </xsl:call-template>
    </div>
  </div>
  <!-- item 2a(3) -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:146mm">
      <b>(3)<span style="width:1.5mm;"/></b>Reduction of foreign tax credit. Multiply line 2a(1) by line 2a(2). Enter here and on Form 1116 or 1118 
      <span style="float:left;"><span style="width:5mm;"/>(see instructions) </span>
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">..............................</span>
    </div>
    <div class="styLNAmountBox" style="border-top-width:0px;height=8mm;text-align:bottom;padding-top:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713CData/ReductionOfForeignTaxCredit" />
      </xsl:call-template>
    </div>
  </div>
  <!-- item 2a(4) -->
  <div style="width:187mm;">
      <div class="styLNLeftLtrBox"></div>
      <div class="styLNDesc" style="width:146mm">
      <span style="float:left;"><b>(4)<span style="width:1.5mm;"/></b>Adjusted foreign tax credit. Subtract line 2a(3) from line 2a(1) </span>
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
    </div>
      <div class="styLNAmountBox" style="border-top-width:0px;text-align:bottom;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713CData/AdjustedForeignTaxCredit" />
      </xsl:call-template>
      </div>
  </div>
  <!-- item 2b start-->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox" style="height:10.8mm; border-bottom: 1px solid black;">b</div>
    <div class="styLNDesc" style="width:146mm;height:10.8mm; border-bottom: 1px solid black;">
    <b>Specifically attributable taxes and income.</b>
      <span style="width:2px;"></span>
      Complete if you checked box 1b above and answered "Yes" to the 
      <span style="float:left;">question on line 7d, Form 5713. Enter the amount from line o, column (4), Schedule B (Form 5713) </span> 
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
      Enter the appropriate part of this amount on Form 1116 or 1118 (see instructions).
    </div>
      <div class="styLNAmountBox" style="height:10.8mm;border-bottom: 1px solid black;padding-top:4mm;">
      <br/>
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713CData/RedFrgnTaxCrSpcfcAttrblTaxes" />
      </xsl:call-template>
      </div>
  </div>
<!-- Item 2b end -->
<!-- Item 3 Start -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4.5mm;border-top-width:0px;">3</div>
    <div class="styLNDesc" style="width:146mm;height:4mm;">Denial of deferral under subpart F (section 952(a)(3)):
    </div>
    <div class="styShadingCell" style="height:5mm;"></div><br/>
  </div>
  <!-- Item 3a -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
    <div class="styLNDesc" style="width:146mm;height:4mm;"><b>International boycott factor.</b><span style="width:1mm;"></span>Complete if you checked box 1a above and answered "Yes" to the question on line 7b, Form 5713.
    </div>
    <div class="styShadingCell" style="height:8mm;"></div><br/>
  </div>
  <!-- Item 3a(1) -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:146mm">
      <span style="float:left;"><b>(1)<span style="width:1.5mm;"/></b>Prorated share of total income of controlled foreign corporations (see instructions) </span>
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
    </div>
    <div class="styLNAmountBox" style="border-top-width:0px;height:4mm;text-align:bottom;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713CData/PrortShareOfTotIncmOfFrgnCorps" />
      </xsl:call-template>
    </div>
  </div>
  <!-- Item 3a(2) -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:146mm">
      <b>(2)<span style="width:1.5mm;"/></b>Prorated share of income attributable to earnings and profits of controlled foreign corporations included in 
      <span style="width:5.5mm;"/>income under sections 951(a)(1)(A)(ii), 951(a)(1)(A)(iii), 951(a)(1)(B), 952(a)(1), 952(a)(2), 952(a)(4),
      <span style="float:left;"><span style="width:5.5mm;"/>952(a)(5), and 952(b) </span>
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>
    </div>
    <div class="styLNAmountBox" style="border-top-width:0px;height:11mm;text-align:bottom;">
    <br/><br/>
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713CData/PrortShareEPIncomeOfFrgnCorps" />
      </xsl:call-template>    
    </div>
  </div>
  <!-- Item 3a(3) -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:146mm">
      <span style="float:left;"><b>(3)<span style="width:1.5mm;"/></b>Subtract line 3a(2) from line 3a(1) </span>
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
    </div>
    <div class="styLNAmountBox" style="border-top-width:0px;text-align:bottom;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713CData/PrortShareNonEPIncomeFrgnCorps" />
      </xsl:call-template>
    </div>
  </div>
  <!-- Item 3a(4) -->
  <div style="width:187mm;">
      <div class="styLNLeftLtrBox"></div>
      <div class="styLNDesc" style="width:146mm">
        <span style="float:left;"><b>(4)<span style="width:1.5mm;"/></b>International boycott factor from Schedule A (Form 5713), line 3 </span>
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
      </div>
      <div class="styLNAmountBox" style="border-top-width:0px;text-align:bottom;">
		<xsl:call-template name="PopulateText">
     		<xsl:with-param name="TargetNode" select="$Form5713CData/DfrlDenialIntntlBoycottFactor" />
     	</xsl:call-template>
      </div>
  </div>
  <!-- Item 3a(5) -->
  <div style="width:187mm;">
      <div class="styLNLeftLtrBox"></div>
      <div class="styLNDesc" style="width:146mm">
        <b>(5)<span style="width:1.5mm;"/></b>Prorated share of subpart F international boycott income. Multiply line 3a(3) by line 3a(4). Enter here and 
        <span style="float:left;"><span style="width:5.5mm;"/>on line 22 of Worksheet A in the Form 5471 instructions </span>
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
      </div>
      <div class="styLNAmountBox" style="border-top-width:0px;height:8mm;text-align:bottom;">
        <br/>
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713CData/PrortShrSubpartFIntntlByctIncm" />
      </xsl:call-template>
      </div>
  </div>
  <!-- Item 3b -->
  <div class="styBB" style="width:187mm;">
    <div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
    <div class="styLNDesc" style="width:146mm">
        <b>Specifically attributable taxes and income. </b>Complete if you checked box 1b above and answered "Yes" to the 
        question on line 7b, Form 5713. Enter the amount from line o, column (5), Schedule B (Form 5713) here and 
        <span style="float:left;">on line 22 of Worksheet A in the Form 5471 instructions </span>
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
      </div>
      <div class="styLNAmountBoxNBB" style="border-top-width:0px;height:10.5mm;">
        <br/><br/>
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713CData/DfrlDenialSpcfcAttrblTaxes" />
      </xsl:call-template>        
      </div>
  </div>
<!-- item 3 End -->
<!-- Item 4 Start  -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">4</div>
    <div class="styLNDesc" style="width:146mm;height:4mm;">Denial of IC-DISC benefits (section 995(b)(1)(F)(ii)):
    </div>
    <div class="styShadingCell" style="height:5mm;"></div><br/>
  </div>
  <!-- Item 4a  -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
    <div class="styLNDesc" style="width:146mm;height:4mm;"><b>International boycott factor.</b><span style="width:1mm;"></span>Complete if you checked box 1a above and answered "Yes" to the question on line 7c, Form 5713.
    </div>
    <div class="styShadingCell" style="height:8mm;"></div><br/>
  </div>
  <!-- Item 4a(1)  -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:146mm">
        <span style="float:left;"><b>(1)<span style="width:1.5mm;"/></b>Prorated share of section 995(b)(1)(F)(i) amount (see instructions) </span>
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
      </div>
    <div class="styLNAmountBox" style="border-top-width:0px;text-align:bottom;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713CData/ProratedShareOfSect995b1FiAmt" />
      </xsl:call-template>
    </div>
  </div>
  <!-- Item 4a(2)  -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:146mm">
      <span style="float:left;"><b>(2)<span style="width:1.5mm;"/></b>International boycott factor from Schedule A (Form 5713), line 3 </span>
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
    </div>
    <div class="styLNAmountBox" style="border-top-width:0px;text-align:bottom;">
	<xsl:call-template name="PopulateText">
		<xsl:with-param name="TargetNode" select="$Form5713CData/DenialOfICDISCIntntlByctFactor" />
     </xsl:call-template>
    </div>
  </div>
  <!-- Item 4a(3)  -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:146mm">
      <b>(3)<span style="width:1.5mm;"/></b>Prorated share of IC-DISC international boycott income. Multiply line 4a(1) by line 4a(2). Enter this 
      <span style="float:left;"><span style="width:5.5mm;"/>amount here and the IC-DISC will include it on line 10, Part I, Schedule J, Form 1120-IC-DISC  </span>
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
      </div>
    <div class="styLNAmountBox" style="border-top-width:0px;height:8mm;text-align:bottom;padding-top:4mm;">
    <xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$Form5713CData/PrortShareICDISCIntntlByctIncm" />
     </xsl:call-template>
    <br/>
    </div>
  </div>
  <!-- Item 4b  -->
  <div class="styBB" style="width:187mm;">
    <div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
    <div class="styLNDesc" style="width:146mm">
      <b>Specifically attributable taxes and income. </b>Complete if you checked box 1b above and answered "Yes" to the 
      question on line 7c, Form 5713. Enter the amount from line o, column (6), Schedule B (Form 5713) here and 
      <span style="float:left;">the IC-DISC will include it on line 10, Part I, Schedule J, Form 1120-IC-DISC </span>
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
      </div>    
      <div class="styLNAmountBoxNBB" style="border-top-width:0px;height:10mm;padding-top:7mm;">
      <xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$Form5713CData/DenialOfICDISCBenefits" />
     </xsl:call-template>
        <br/>      
      </div>
  </div>
<!--item 4  End -->
<!-- item 5 Start -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">5</div>
    <div class="styLNDesc" style="width:146mm;height:4mm;">Denial of exemption of foreign trade income (section 927(e)(2), as in effect before its repeal):
    </div>
    <div class="styShadingCell" style="height:5mm;"></div><br/>
  </div>
  <!-- item 5a -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
    <div class="styLNDesc" style="width:146mm;height:4mm;"><b>International boycott factor.</b><span style="width:1mm;"></span>Complete if you checked box 1a above and answered "Yes" to the question on line 7i, Form 5713.
    </div>
    <div class="styShadingCell" style="height:8mm;"></div><br/>
  </div>
  <!-- item 5a(1) -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:146mm">
      <span style="float:left;"><b>(1)<span style="width:1.5mm;"/></b>Add amounts from columns (a) and (b), line 10, Schedule B (Form 1120-FSC) </span>
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
    </div>
    <div class="styLNAmountBox" style="border-top-width:0px;text-align:bottom;text-align:right">
    		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form5713CData/ExmptFrgnTradeIncm1120FSCSchB" />
     	</xsl:call-template>
    		<span style="width:1px;"></span>
    </div>
  </div>
  <!-- item 5a(2) -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:146mm">
      <span style="float:left;"><b>(2)<span style="width:1.5mm;"/></b>International boycott factor from Schedule A (Form 5713), line 3 </span>
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
    </div>
    <div class="styLNAmountBox" style="border-top-width:0px;text-align:bottom;text-align:right">
    		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="$Form5713CData/IntntlByctFactorFromScheduleA" />
     	</xsl:call-template>
    		<span style="width:1px;"></span>
    </div>
  </div>
  <!-- item 5a(3) -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:146mm">
      <b>(3)<span style="width:1.5mm;"/></b>Exempt foreign trade income of a FSC attributable to international boycott operations. Multiply line 5a(1) 
      <span style="float:left;"><span style="width:5.5mm;"/>by line 5a(2). Enter here and on line 2, Schedule F, Form 1120-FSC </span>
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
    </div>
    <div class="styLNAmountBox" style="border-top-width:0px;height:7mm;text-align:bottom;padding-top:3.5mm;">
    	 <xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form5713CData/ExemptForeignTradeIncome" />
     	</xsl:call-template>
      <span style="width:1px;"></span>        
    </div>
  </div>
  <!-- item 5b -->
  <div class="styBB" style="width:187mm;">
    <div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
    <div class="styLNDesc" style="width:146mm">
      <b>Specifically attributable taxes and income. </b>Complete if you checked box 1b above and answered "Yes" to the 
      question on line 7i, Form 5713. Enter the amount from line o, column (7), Schedule B (Form 5713) here and on 
      <span style="float:left;">line 2, Schedule F, Form 1120-FSC </span>
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
    </div>
    <div class="styLNAmountBoxNBB" style="padding-top:6.5mm;height:10.5mm;">
    		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form5713CData/DenialOfExemptForeignTradeIncm" />
     	</xsl:call-template>
    </div>
  </div>
  <!-- item 5 End -->
<!--Page Footer-->
      <div  class="pageEnd" style="width:187mm;padding-top:1mm;">
        <div style="float:left;">
             <span class="styBoldText" >For Paperwork Reduction Act Notice, see Instructions for Form 5713.</span>
             <span style="width:10px;"></span>
              Cat. No. 120770O
            </div>
            <div style="float:right;">
              <span class="styBoldText"> Schedule C (Form 5713) (Rev. 12-2010)</span>
        </div>
      </div>
<!--END Page Footer-->
<!-- Page Header -->
  <span style="width:187mm;">  
    <div style="float:left">Schedule C (Form 5713) (Rev. 12-2010)</div>
    <div style="float:right">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>                    
  </span>  
<!-- END Page Header -->
<!-- item 6 Start -->
  <div style="width:187mm;border-top:1 solid;">
    <div class="styLNLeftNumBox" style="height:4mm;">6</div>
    <div class="styLNDesc" style="width:146mm;height:4mm;">Reduction of foreign trade income qualifying for the extraterritorial income exclusion. Complete if you answered "Yes" to the question on line 7j, Form 5713.</div>
    <div class="styShadingCell" style="height:8mm;"></div>
  </div>
  <!-- item 6a -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
    <div class="styLNDesc" style="width:146mm">
      <span style="float:left;">Enter amount from line 49 of Form 8873 </span>
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
    </div>
    <div class="styLNAmountBox" style="border-top-width:0px;height:5mm;text-align:bottom;padding-top:1mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713CData/AmountFromForm8873" />
      </xsl:call-template>
    </div>
  </div>
  <!-- item 6b -->
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
    <div class="styLNDesc" style="width:146mm">
      <span style="float:left;">International boycott factor from Schedule A (Form 5713), line 3 </span>
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
    </div>
    <div class="styLNAmountBox" style="border-top-width:0px;height:5mm;text-align:bottom;">
		<xsl:call-template name="PopulateText">
        		<xsl:with-param name="TargetNode" select="$Form5713CData/RedFrgnTrdIntntlBoycottFactor" />
      	</xsl:call-template>
    </div>
  </div>
  <!-- item 6b -->
  <div class="styBB" style="width:187mm;">
    <div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>
    <div class="styLNDesc" style="width:146mm">
      <span style="float:left;">Reduction of qualifying foreign trade income. Multiply line 6a by 6b. Enter here and on Form 8873, line 50 </span>
      <!--Dotted Line-->
      <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
    </div>
    <div class="styLNAmountBoxNBB" style="border-top-width:0px;height:5mm;text-align:bottom;padding-top:1mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713CData/RedOfQualifyingFrgnTradeIncome" />
      </xsl:call-template>
    </div>
  </div>
<!-- End of item 6 -->
 <!-- Begin Footer -->
      <div class="pageEnd" style="width:187mm;padding-top:1mm;">
        <!--<div style="float:left;">
             <span class="styBoldText" >For Paperwork Reduction Act Notice, see see Instructions for Form 5713.</span>
             <span style="width:10px;"></span>
              Cat. No. 120770O
            </div>-->
            <div style="float:right;">
              <span class="styBoldText"> Schedule C (Form 5713) (Rev. 12-2010)</span>
        </div>
      </div>
      <!-- End Footer -->
<br/>
  <!-- BEGIN Left Over Table -->  
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
        <xsl:with-param name="TargetNode" select="$Form5713CData" />
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
    </table>
  <!-- END Left Over Table -->
    </form>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>