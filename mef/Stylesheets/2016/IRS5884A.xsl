<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS5884AStyle.xsl"/>

<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:param name="Form5884AData" select="$RtnDoc/IRS5884A"/>

<xsl:template match="/">

<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
  <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form5884AData)"/></xsl:call-template></title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private"/>
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <meta name="Description" content="IRS Form 5884A"/>
      
       <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
      <xsl:call-template name="InitJS"/>

    <style type="text/css">
      <xsl:if test="not($Print) or $Print=''">
        <!-- Form 5884A CSS Styles are located in the template called below -->
        <xsl:call-template name="IRS5884AStyle"/>
        <xsl:call-template name="AddOnStyle"/>
      </xsl:if>  
    </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>

  <body class="styBodyClass">
    <form name="Form5884A">
      <xsl:call-template name="DocumentHeader"/>  

    <!-- Begin Form Number and Name -->
    
 					<div class="styBB" style="width:187mm;padding-bottom:0mm;">
						<div class="styFNBox" style="height:18mm;width:32mm;padding-top:0mm;">
							<div style="height:7mm;font-size:7.5pt;">
            		Form<span class="styFormNumber" style="padding-left:1mm;font-size:16pt;"> 5884-A</span>
							</div>
									<span class="styAgency" style="font-size:7.5pt;">(Rev. December 2008)</span>
							            <xsl:call-template name="SetFormLinkInline">
											  <xsl:with-param name="TargetNode" select="$Form5884AData"/>
										</xsl:call-template><br/>
								<span class="styAgency" style="font-size:7.5pt;">Department of the Treasury</span>
								<br/>
								<span class="styAgency" style="font-size:7.5pt;">Internal Revenue Service</span>
						</div>   
 
    <div class="styFTBox" style="width:117mm;border-right:1px solid black;border-left:0px solid black;">
		  <div class="styMainTitle" style="height:13mm;">Credits for Affected Midwestern Disaster<br/>
Area Employers</div>      
      <div class="styFST" style="height:5mm;padding-top:.5mm;font-size:7.5pt;">
        <img src="{$ImagePath}/5884A_Bullet.gif" alt="Bullet Image"/>
        Attach to your tax return.
      </div>
    </div>
    <div class="styTYBox" style="width:37.5mm;padding-bottom:0mm;border-left:none;">
        <div class="styOMB" style="height:8mm;">
			  <div style="margin-top:6px;">OMB No. 1545-1978</div>
        </div>
 
							<div style="height:2mm;padding-top:3mm;margin-left:3mm;text-align:left;font-size:7pt;">
          			Attachment<br/>Sequence No. <span class="styBoldText" style="font-size:9pt;">77A</span>
							</div>    
     </div>
  </div>    
  <!-- End Form Number and Name section -->
  
    <!-- Begin Names and Identifying number section -->

    <div class="styBB" style="width:187mm;">
      <div class="styNameBox" style="height:auto;width:140mm;font-size:7pt;">
        Name(s) shown on return<br/><br/>
             <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param></xsl:call-template><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param></xsl:call-template><br/>
       </div>
      <div class="styEINBox" style="width:35mm;height:auto;padding-left:2mm;font-size:7pt;font-weight:normal;">
        <b>Identifying number</b><br/>
        <span style="width:34mm; text-align:left;font-weight:normal;"><br/>
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
    
    <!-- Start Section A Employee Retention Credit -->
    
    <div class="styBB" style="width:187mm;padding-top:1.5mm; padding-bottom:1.5mm;">
      <div class="styPartDesc" style="padding-left:0mm;font-size:9pt;float:left;clear:none;">
      SECTION A.<span style="width:10px;"/>Employee Retention Credit <span class="styNormalText"> (see instructions)</span>
      </div>
    </div>
    
     <!--Line 1 Begin-->
 	<!-- Qualified Wages Paid/Incurred after Disaster and before January 1, 2009 -->    
   <div class="styBB" style="width:187mm;">    
      <div style="width:187mm;font-size:8pt;">
        <div class="styLNLeftNumBox" style="height:8mm;">1</div>
        <div class="styLNDesc" style="width:138mm;height:8mm;">
				Enter the total qualified wages paid or incurred after the applicable disaster date and<br/>
				before January 1, 2009, while the business was inoperable
          <!--Dotted Line-->
          <span class="styBoldText">
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
           </span>
        </div>

      <div class="styLNRightNumBox" style="height:8mm;padding-top:0mm;">
      <span style="vertical-align:baseline;height:100%;"/><span> 1 </span>
        </div>
        <div class="styLNAmountBox" style="height:8mm;">
          <br/>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form5884AData/QlfyWgsPdIncurdAftrDsstrAmt"/>
          </xsl:call-template>
        </div>

      </div>
     <!-- end line 1 -->      
 
    <!-- begin line 2 -->
	<!-- Multiply Line 1 by 40% -->      
      <div style="width:187mm;font-size:8pt;">
        <div class="styLNLeftNumBox" style="height:8mm;padding-top:1.3mm;"><br/>2</div>
        <div class="styLNDesc" style="width:138mm;height:8mm;padding-top:1.3mm;"><br/>
          Multiply line 1 by 40% (.40). See instructions for the adjustment you must make to<br/>
		  salaries and wages
          <!--Dotted Line-->
          
               <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form5884AData/EmployeeSalariesAndWageAdjAmt"/>
               </xsl:call-template>           
          
          <span class="styBoldText">
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
          </span>
        </div>
        
        <div class="styLNRightNumBox" style="height:12mm;padding-top:0mm;">
        <span style="height:8mm;background-color:lightgrey;width:7.80mm;"/>
        2
        </div>
        <div class="styLNAmountBox" style="height:12mm;">
        <span style="vertical-align:baseline;height:100%;"/><span>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form5884AData/EmployeeSalariesAndWageAdjAmt"/>
          </xsl:call-template>
        </span>
        </div>
      </div>
      
	<!--Line 2 End-->
      
    <!--Line 3 Begin-->
 	<!-- Employee Retention Credit --> 
        <div style="width:187mm;font-size:8pt;">
        <div class="styLNLeftNumBox" style="height:8mm;padding-top:1.3mm;"><br/>3</div>
        <div class="styLNDesc" style="width:138mm;height:8mm;padding-top:1.3mm;"><br/>
			Employee retention credit from partnerships, S corporations, cooperatives, estates,<br/>
			and trusts
          <!--Dotted Line-->
          <span class="styBoldText">
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
          </span>
        </div>
        
        <div class="styLNRightNumBox" style="height:12mm;padding-top:0mm;">
        <span style="height:8mm;background-color:lightgrey;width:7.80mm;"/>
        3
        </div>
        <div class="styLNAmountBox" style="height:12mm;">
        <span style="vertical-align:baseline;height:100%;"/><span>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form5884AData/EmployeeRetentionCreditAmt"/>
          </xsl:call-template>
        </span>
        </div>
      </div>
  
  <!--Line 3 End-->
  
	 <!--Line 4 Begin-->
	<!-- Current Year Credit -->
        <div style="width:187mm;font-size:8pt;">
        <div class="styLNLeftNumBox" style="height:8mm;"><br/>4</div>
        <div class="styLNDesc" style="width:138mm;height:8mm;"><br/>
			<b>Current year credit.</b> Add lines 2 and 3. Report this amount on the applicable line of<br/>
			Form 3800 (e.g., line 1t of the 2008 Form 3800). If you have a credit from Section B, see<br/>
			instructions. S corporations, partnerships, estates, trusts, cooperatives, regulated<br/>
			investment companies, and real estate investment trusts, see instructions
          <!--Dotted Line-->
                           	<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">    </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form5884AData/CurrentYearRetentionCreditAmt/@form1041PortionCd"/>
							</xsl:call-template>
          
          <span class="styBoldText">
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
          </span>
        </div>
        
        <div class="styLNRightNumBox" style="height:18mm;padding-top:0mm;border-bottom:none;">
        <span style="height:14mm;background-color:lightgrey;width:7.80mm;"/>
        4
        </div>
        <div class="styLNAmountBox" style="height:18mm;border-bottom:none;">
        <span style="vertical-align:baseline;height:100%;"/><span>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form5884AData/CurrentYearRetentionCreditAmt"/>
          </xsl:call-template>
        </span>
        </div>
      </div>
    </div>

	  <!--Line 4 End-->
	  
     <!-- End Section A Employee Retention Credit -->
          
     <!-- Start Section B Employer Housing Credit  -->
    
     <div class="styBB" style="width:187mm;padding-top:1.5mm; padding-bottom:1.5mm;">
      <div class="styPartDesc" style="padding-left:0mm;font-size:9pt;float:left;clear:none;">
      SECTION B.<span style="width:10px;"/>Employee Housing Credit <span class="styNormalText"> (see instructions)</span>
      </div>
    </div>
    
    <!--Line 5 Begin-->
 	<!-- =============== Section B - Housing Credit =============== -->
	<!-- Qualified Lodging --> 
    <div class="styBB" style="width:187mm;">    
      <div style="width:187mm;font-size:8pt;">
        <div class="styLNLeftNumBox" style="height:8mm;">5</div>
        <div class="styLNDesc" style="width:138mm;height:8mm;">
				Enter the value (up to $600 per month per employee) of qualified lodging furnished<br/>
				in-kind to qualified employees during the tax year from November 1, 2008, through<br/>
				May 1, 2009 (see instructions)
          <!--Dotted Line-->
          <span class="styBoldText">
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
           </span>
        </div>

      <div class="styLNRightNumBox" style="height:12mm;padding-top:0mm;">
      <span style="vertical-align:baseline;height:100%;"/><span> 5 </span>
        </div>
        <div class="styLNAmountBox" style="height:12mm;padding-top:4mm;">
          <br/>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form5884AData/QualifiedLodgingAmt"/>
          </xsl:call-template>
        </div>
      </div>
      
	<!--Line 5 End-->
        
    <!--Line 6 Begin-->
	<!-- Multiply Line 5 by 30%  -->
      <div style="width:187mm;font-size:8pt;">
        <div class="styLNLeftNumBox" style="height:7mm;"><br/>6</div>
        <div class="styLNDesc" style="height:7mm;"><br/>
				Multiply line 5 by 30% (.30). See instructions for the adjustment you must make to<br/>
				salaries and wages 
          <!--Dotted Line-->
          
               <xsl:call-template name="SetFormLinkInline">
                   <xsl:with-param name="TargetNode" select="$Form5884AData/EmployerSalariesAndWageAdjAmt"/>
               </xsl:call-template>           
           
          <span class="styBoldText">
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.            
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
          </span>
        </div>        
       <div class="styLNRightNumBox" style="height:11mm;padding-top:0mm;">
          <div style="height:7.5mm;width:7.80mm;border-left-width:0px;background-color:lightgrey;"/>
          6          
        </div>        
        <div class="styLNAmountBox" style="height:11mm;">
        <span style="vertical-align:baseline;height:100%;"/><span>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form5884AData/EmployerSalariesAndWageAdjAmt"/>
          </xsl:call-template></span>
        </div>
      </div>

       <!--Line 6 End-->
       
    <!--Line 7 Begin-->
	<!-- Employer Housing Credit from partnerships, S corporations, cooperatives, estates, and trusts -->  
        <div style="width:187mm;font-size:8pt;">
        <div class="styLNLeftNumBox" style="height:8mm;"><br/>7</div>
        <div class="styLNDesc" style="width:138mm;height:8mm;"><br/>
				Employer housing credit from partnerships, S corporations, cooperatives, estates,<br/>
				and trusts
          <!--Dotted Line-->
          <span class="styBoldText">
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>. 
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>. 
          </span>
        </div>
        
        <div class="styLNRightNumBox" style="height:12mm;padding-top:0mm;">
        <span style="height:8mm;background-color:lightgrey;width:7.80mm;"/>
       7
        </div>
        <div class="styLNAmountBox" style="height:12mm;">
        <span style="vertical-align:baseline;height:100%;"/><span>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form5884AData/PrtshpEstTrHousingCreditAmt"/>
          </xsl:call-template>
        </span>
        </div>
      </div>
  
    <!--Line7 End-->
    
    <!--Line8 Begin-->
	<!-- Current Year Credit (add lines 6 and 7) -->
        <div style="width:187mm;font-size:8pt;">
        <div class="styLNLeftNumBox" style="height:8mm;"><br/>8</div>
        <div class="styLNDesc" style="width:138mm;height:8mm;"><br/>
				<b>Current year credit.</b> Add lines 6 and 7. Report this amount on the applicable line of<br/>
				Form 3800 (e.g., line 1t of the 2008 Form 3800). If you have a credit from Section A, see<br/>
				instructions. S corporations, partnerships, estates, trusts, cooperatives, regulated<br/>
				investment companies, and real estate investment trusts, see instructions
          <!--Dotted Line-->

                           	<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">    </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form5884AData/CurrentYearHousingCreditAmt/@form1041PortionCd"/>
							</xsl:call-template>
          
          <span class="styBoldText">
            <span style="width:8px"/>.
            <span style="width:8px"/>.
            <span style="width:8px"/>. 
            <span style="width:8px"/>. 
            <span style="width:8px"/>.
          </span>
        </div>
        
        <div class="styLNRightNumBox" style="height:18mm;padding-top:0mm;border-bottom:none;">
        <span style="height:14mm;background-color:lightgrey;width:7.80mm;"/>
       8
        </div>
        <div class="styLNAmountBox" style="height:18mm;border-bottom:none;">
        <span style="vertical-align:baseline;height:100%;"/><span>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form5884AData/CurrentYearHousingCreditAmt"/>
          </xsl:call-template>
        </span>
        </div>
      </div>
</div>

	  <!--Line 8 End-->
  
     <!-- End Section B Employer Housing Credit  --> 
  
  <!--End of form-->

    <div style="width:187mm;">
		<div class="styLNDesc" style="width:93mm;">
			<b>For Paperwork Reduction Act Notice, see instructions.</b> 
			  <span style="width:14px;"/>  
			  <span style="width:14px;"/>
			  <span style="width:14px;"/>  
			  <span style="width:14px;"/>
			  <span style="width:14px;"/>
			  <span style="width:14px;"/>
			  <span style="width:10px;"/>  
		</div>  
		<div class="styLNDesc" style="width:93mm;text-align:right;">
			  Cat. No. 47425B
			  <span style="width:14px;"/>  
			  <span style="width:14px;"/>
			  <span style="width:14px;"/>
			  <span style="width:14px;"/>
			  <span style="width:4px;"/>
				
			  <span style="font-size:7pt;padding-right:1mm;'">Form</span> <span class="styBoldText" style="font-size:8pt;">5884-A</span> <span style="font-size:7pt;padding-left:1mm;">(Rev. 12-2008)</span>
		</div>
    </div>
         <p style="page-break-before: always"/> 
        
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
            <xsl:with-param name="TargetNode" select="$Form5884AData"/>
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template> 
 						<xsl:if test="$Form5884AData/CurrentYearRetentionCreditAmt/@form1041PortionCd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form5884AData/CurrentYearRetentionCreditAmt/@form1041PortionCd"/>
											<xsl:with-param name="BackupName">A 1041 Portion Write In </xsl:with-param>
										</xsl:call-template>
              Current Year Credit (Add Lines 2 and 3):
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5884AData/CurrentYearRetentionCreditAmt/@form1041PortionCd"/>
											<xsl:with-param name="BackupName">A 1041 Portion Write In</xsl:with-param>
										</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
 
  						<xsl:if test="$Form5884AData/CurrentYearHousingCreditAmt/@form1041PortionCd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form5884AData/CurrentYearHousingCreditAmt/@form1041PortionCd"/>
											<xsl:with-param name="BackupName">B 1041 Portion Write In</xsl:with-param>
										</xsl:call-template>
              Current Year Credit (Add Lines 6 and 7):
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5884AData/CurrentYearHousingCreditAmt/@form1041PortionCd"/>
											<xsl:with-param name="BackupName">B 1041 Portion Write In</xsl:with-param>
										</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
         </table>
        <!-- END Left Over Table -->    
      </form>
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>