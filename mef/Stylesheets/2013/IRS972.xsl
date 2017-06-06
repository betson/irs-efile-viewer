<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS972Style.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>
<xsl:param name="FormData" select="$RtnDoc/IRS972"/>
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
  <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <meta name="Description" content="Form IRS972"/>        
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
    <xsl:call-template name="InitJS"/>
    <style type="text/css">    
     <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS972Style"/>
        <xsl:call-template name="AddOnStyle"/>        
      </xsl:if>
    </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
  <form name="Form972">
    <xsl:call-template name="DocumentHeader"/>        
  <!--Title of Form -->    
  <div class="styTBB" style="width:187mm;min-height: 26mm">
    <div class="styFNBox" style="height: 26.5mm; width:33mm;font-size: 7pt; padding-top:2mm">
      Form <span class="styFormNumber">972</span>
      <br/>
      <br/>
      <span class="styAgency">(Rev. December 2011)</span>
      <span>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$FormData"/>
        </xsl:call-template>  
      </span>  
      <br/><br/>
      <div style="line-height:100%"><span class="styAgency">Department of the Treasury</span><br/><span class="styAgency">Internal Revenue Service</span></div>
    </div>    
    <div class="styFTBox" style="width:123mm; height: 26mm">
      <div class="styFMT" style="line-height:100%;height:12mm;font-size: 12pt; font-weight: bold; padding-top: 2mm">
        <div class="styMainTitle">Consent of Shareholder To Include<br/>Specific Amount in Gross Income<br/></div>
          <span style="font-size:8pt">(Under Section 565 of the Internal Revenue Code)</span><br/>
          <span style="font-size:7pt">(Send this form to the corporation claiming the deduction for consent dividends.<br/>See instructions.)</span>  
      </div>  
    </div>    
    <div class="styTYBox" style="width:31mm; height: 26.5mm">        
      <div style="padding-top:10mm; font-size:7pt">OMB No. 1545-0043</div>
    </div>
  </div>
  <!--  End title of Form  -->    
  <div class="styBB" style="width:187mm">
     <div class="styNameBox" style="font-size:7pt; width:120mm; height:10mm">Name of shareholder
       <div style="padding-left:5mm; line-height:110%;font-family:verdana;font-size:7pt;">
         <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/ShareholderName/BusinessNameLine1"/> 
          </xsl:call-template>         
         <xsl:if test="normalize-space($FormData/ShareholderName/BusinessNameLine2)!=''">
            <br/> 
           <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/ShareholderName/BusinessNameLine2"/> 
            </xsl:call-template>
          </xsl:if>
        </div>
      </div>     
     <div class="styEINBox" style="font-size:7pt; padding-left:2mm;"> Identifying number <span style="font-weight:normal">(see instructions)</span>
       <div style="text-align:left; width:100%; padding-top:1mm; font-weight:normal;">
         <xsl:choose> 
          <xsl:when test="$FormData/EIN">
            <xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="$FormData/EIN"/>
            </xsl:call-template>  
          </xsl:when>
          <xsl:when test="$FormData/MissingEINReasonCd">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
            </xsl:call-template>  
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="PopulateSSN">
              <xsl:with-param name="TargetNode" select="$FormData/SSN"/>
            </xsl:call-template>  
          </xsl:otherwise>
        </xsl:choose> 
      </div>
      </div>
    </div>
    <div class="styBB" style="width:187mm">
   <div class="styNameBox" style="font-size:7pt; width:132mm; height:9mm;border-style:none;"> Number, street, and room or suite no. (If a P.O. box, see instructions.)
     <div style="padding-left:5mm; line-height:110%">
       <xsl:choose>
         <xsl:when test="$FormData/ShareholderUSAddress">
           <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/ShareholderUSAddress/AddressLine1"/> 
            </xsl:call-template>
           <xsl:if test="normalize-space($FormData/ShareholderUSAddress/AddressLine2)!=''">
            <br/> 
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/ShareholderUSAddress/AddressLine2"/> 
              </xsl:call-template>
            </xsl:if>
          </xsl:when>
         </xsl:choose>
      </div>
    </div>
    </div>
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="font-size:7pt; width:80mm; height:8mm;border-style:none;"> City, state, and ZIP code
     <div style="padding-left:5mm; line-height:110%">
       <xsl:choose>
         <xsl:when test="$FormData/ShareholderUSAddress">
           <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/ShareholderUSAddress//City"/> 
            </xsl:call-template>,
           <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/ShareholderUSAddress//State"/> 
            </xsl:call-template>
              <span style="width:1mm"/>
           <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/ShareholderUSAddress/ZIPCode"/> 
            </xsl:call-template>
          </xsl:when>
        </xsl:choose>
      </div>
    </div>
  </div>
  <div style="width:187mm;" class="styBB">
    <div style="width:187mm" class="styBB">        
      <div class="styLNLeftNumBox" style="padding-top:0.5mm;height:8mm;">1</div>      
      <div style="float:left">The shareholder named above agrees to include $ 
        <span class="styUnderlineAmount" style="float:none;text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/GrossIncomeAmt"/>
          </xsl:call-template>
        </span> in gross income on its tax return for the tax year              
      </div>      
      <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">beginning
        <span class="styUnderlineAmount" style="float:none;text-align:center;">
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="$FormData/TaxYearBeginDt"/>
          </xsl:call-template>
        </span> and ending 
        <span class="styUnderlineAmount" style="float:none;text-align:center;">
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="$FormData/TaxYearEndDt"/>
          </xsl:call-template>
        </span> .  This amount is treated as a taxable dividend to the 
      </div>    
      <div style="float:left; padding-left:28mm">(Month, day, year) <span style="width:70"/>(Month, day, year) </div>    
      <div style="float:left;padding-top:1mm;padding-bottom:.5mm;padding-left:8mm;valign:top;">
        <span style="float:left;valign:top;padding-right:2px;">shareholder on the stock of the </span>
        <span class="styUnderlineAmount" style="float:right;padding-top:0mm;width:136mm;text-align:left;font-family:verdana;font-size:7pt;">
          <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine1"/> 
            </xsl:call-template>
           <xsl:if test="normalize-space($FormData/CorporationName/BusinessNameLine2)!=''">
              <br/> 
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine2"/> 
              </xsl:call-template>
            </xsl:if>
        </span>         
      </div>      
      <div style="padding-left:90mm">(Name of corporation)</div>
      <div style="padding-top:1mm;padding-bottom:.5mm;padding-left:8mm;valign:top;">
        <span class="styUnderlineAmount" style="float:none;width:179mm;text-align:left;font-family:verdana;font-size:7pt;">
        	<xsl:if test="$FormData/CorporationUSAddress!= ' '">
	          <xsl:call-template name="PopulateUSAddressTemplate">
	              <xsl:with-param name="TargetNode" select="$FormData/CorporationUSAddress"/> 
	           </xsl:call-template>
           	</xsl:if>
           	<xsl:if test="$FormData/CorporationForeignAddress!= ' '">
	          <xsl:call-template name="PopulateForeignAddressTemplate">
	              <xsl:with-param name="TargetNode" select="$FormData/CorporationForeignAddress"/> 
	           </xsl:call-template>
           	</xsl:if>
         </span>             
      </div>    
      <div style="padding-left:30mm; padding-bottom:5mm">(Number, street, and room or suite no.) (City, state, and ZIP code) (If a P.O. box, see instructions.)</div>
    </div>    
  <!--  Note -->
    <div class="styTBB" style="width: 187mm;height:10mm;padding-top:.5mm;">
			  <div class="styLNLeftNumBox">Note. </div>
				<div class="styLNDesc" style="width:176mm;padding-left:2mm;">
						 <i>If the amount to be included in gross income (on line 1, above) is different than the total shown on line 4, Schedule A, attach a statement to Form 972 explaining the reason and authority for the discrepancy. </i> 
			  </div>
    </div>
  <!--  End Note  -->
  <!--Schedule A Header-->
  <div class="styBB" style="width:187mm;border-bottom-width:1px;border-top-width:0px;           border-right-width:0px;border-left-width:0px;float:left;">
        <span class="styPartName" style="height:8mm;width:23mm;">Schedule A</span>
        <span style="width:164mm;height:8mm;" class="styPartDesc">
          Statement of Shares in Each Class of Stock Owned by the Shareholder on the Last Day of the Corporation’s Tax Year
        </span>
      </div>
  <!--End ScheduleA Header-->    
  <div style="width:187mm;float:none;clear:none;" class="styBB">        
    <div class="styLNLeftNumBox" style="padding-top:.5mm;">2</div>
    <div style="float:left">Enter the last day of the corporation’s tax year <img src="{$ImagePath}/972_Bullet_Md.gif" alt="Right Arrow Bullet"/> 
      <span class="styUnderlineAmount" style="float:none;width:114mm;text-align:center;">  <span style="width:2px"/>
        <xsl:call-template name="PopulateMonthDayYear">
          <xsl:with-param name="TargetNode" select="$FormData/CorpTaxYearLastDayDt"/>
        </xsl:call-template>
      </span>
    </div>
    <div style="padding-left:120mm">(Month, day, year)</div>
     <br/>  
     <div style="float:left;clear:none;padding-left:8mm;padding-bottom:2mm;">
       <div class="styGenericDiv">
        Consent is given to include a specific amount in gross income based on the shares of stock owned on the last day of the<br/>
        corporation’s tax year as shown below.
      </div>
      <div style="float:right; clear:none;padding-top:3mm">
       <xsl:call-template name="SetDynamicTableToggleButton">
        <xsl:with-param name="TargetNode" select="$FormData/ConsentDistribution"/>
        <xsl:with-param name="containerHeight" select="11"/>
        <xsl:with-param name="headerHeight" select="2"/>
        <xsl:with-param name="containerID" select=" 'CDctn' "/>
      </xsl:call-template>
       <!-- end button display logic -->
     </div>
  </div>
</div>
<!--Line 3 table-->
  <div class="styIRS972TableContainer " style="padding-top:0mm;height:auto;" id="CDctn">
    <!-- print logic -->
      <xsl:call-template name="SetInitialState"/>
    <!-- end -->  
   <table class="styTable" style="font-size:7pt;" cellspacing="0">
     <thead class="styTableThead" style="border-color:black">    
    <tr>
      <th class="styTableCellHeader" style="font-weight:normal;width:35mm;" scope="col">Class of stock</th>
      <th class="styTableCellHeader" style="font-weight:normal;width:40mm;" scope="col">Number of shares</th>
      <th class="styTableCellHeader" style="font-weight:normal;width:75mm;" scope="col">Certificate numbers</th>
      <th class="styTableCellHeader" style="font-weight:normal;border-right-width: 0px;width:35mm;" scope="col">Amount of consent<br/>distribution allocable to<br/>each class of stock<br/>owned</th>
    </tr>
    </thead>
    <tfoot/>
    <tbody style="border-color:black; vertical-align:bottom;">
      <!-- Display blank filler rows. If the Print parameter is Separated and the number of elements exceeds the container -->
      <!-- height, then display a message in the first blank row directing the user to the additional data table -->
      <xsl:if test="count($FormData/ConsentDistribution) = 0 or (($Print = $Separated) and (count($FormData/ConsentDistribution)&gt;11))">
        <tr>
          <td class="styTableCell" style="width:38mm; text-align:left; height:8mm;padding-bottom:1mm;">
            <span class="styBoldText">3</span>
            <span class="styTableCellPad"/>
            <xsl:call-template name="PopulateAdditionalDataTableMessage">
              <xsl:with-param name="TargetNode" select="$FormData/ConsentDistribution"/>
              <xsl:with-param name="ShortMessage" select="'true'"/>
            </xsl:call-template>
          </td>
          <td class="styTableCell" style="width:33mm;height:8mm;"><span class="styTableCellPad"/></td>
          <td class="styTableCell" style="width:79mm;height:8mm;"><span class="styTableCellPad"/></td>
          <td class="styTableCell" style="border-right-width: 0px; width:35mm;text-align:left;height:8mm;padding-bottom:1mm;">
            <span class="styBoldText"><div style="float:left">$</div></span><span class="styTableCellPad"/>
          </td>
        </tr>
        <xsl:call-template name="AddRows972">
          <xsl:with-param name="NumOfRows" select="10"/>
            <xsl:with-param name="StockCount" select="0"/>
        </xsl:call-template>
      </xsl:if>
      <!-- Display all rows if the Print parameter is not Separated. If the Print parameter is Separated, but there are -->
      <!-- fewer elements than the container height, then also display all rows -->
      <xsl:if test="($Print != $Separated) or count($FormData/ConsentDistribution) &lt;= 11">
        <xsl:for-each select="$FormData/ConsentDistribution">
          <tr>
            <td class="styTableCell" style="text-align: left; width:35mm;height:8mm;">
            <span class="styBoldText" style="width:3mm"> <xsl:if test="position()=1">3</xsl:if></span>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="StockClassDesc"/>
              </xsl:call-template>
              <span class="styTableCellPad"/>
            </td>
            <td class="styTableCell" style="text-align: right; width:40mm;height:8mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="SharesCnt"/>
              </xsl:call-template>
              <span class="styTableCellPad"/>
            </td>
            <td class="styTableCell" style="text-align: left; width:75mm;height:8mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CertificateNumbersTxt"/>
              </xsl:call-template>
              <span class="styTableCellPad"/>
            </td>            
            <td class="styTableCell" style="border-right-width: 0px; text-align:right;width:35mm;height:8mm;"><span class="styBoldText"><div style="float:left;">$</div></span>
            <div style="text-align:right; ">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ConsentDistributionAmt"/>
              </xsl:call-template>
            </div>
            </td>
          </tr>
        </xsl:for-each>
        <xsl:call-template name="AddRows972">
          <xsl:with-param name="NumOfRows" select="11"/>
            <xsl:with-param name="StockCount" select="count($FormData/ConsentDistribution)"/>
        </xsl:call-template>
      </xsl:if>      
      <tr>
        <td class="styTableCell" colspan="3" style="text-align:left;border-bottom-width:0px;border-top-width:1px;width:152mm;height:7mm;padding-bottom:1mm;"><span class="styBoldText">4</span><span style="padding-left:4mm">Total consent distribution</span>
          <span class="styBoldText">
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
          </span>
          <img src="{$ImagePath}/972_Bullet_Md.gif" style="padding-left:3mm;" alt="Right Arrow Bullet"/> 
        </td>        
        <td class="styTableCell" style="border-right-width:0px;width:35mm;text-align:right;border-bottom-width:0px;border-top-width:1px;height:8mm;padding-bottom:1mm;">
            <span class="styBoldText"><div style="float:left">$</div></span>
            <div style="text-align:right; padding-right:0mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TotalConsentDistributionAmt"/>
            </xsl:call-template>
          </div>
          </td>
      </tr>
    </tbody>
  </table>
  </div>
  <!-- Set Initial Height of Above Table -->
  <xsl:call-template name="SetInitialDynamicTableHeight">
    <xsl:with-param name="TargetNode" select="$FormData/ConsentDistribution"/>
    <xsl:with-param name="containerHeight" select="11"/>
      <xsl:with-param name="headerHeight" select="2"/>
    <xsl:with-param name="containerID" select=" 'CDctn' "/>
  </xsl:call-template>
  <!-- End Set Initial Height of Above Table -->
  </div>
  <div style="width:187mm;font-weight:bold;float:none;clear:none:padding-top:200mm;" class="styBB">  
  <div style="text-align:center;font-size:12pt:padding-top:200mm;padding-left:90mm;padding-top:2mm;"><span class="styBoldText">Signature</span></div>  
  <div style="float:none;clear:none;font-weight:normal;padding-top:2mm;">Under penalties of perjury, I declare that I have examined this consent, including accompanying schedules and statements, and to the best </div>
  <span style="font-weight:normal">of my knowledge and belief, it is true, correct, and complete.</span>
  <br/>
  <div><span class="styBoldText" style="padding-top:1mm;padding-right:1mm;">Consenting shareholder </span> <img src="{$ImagePath}/972_Bullet_Sm.gif" alt="Right Arrow Bullet"/> <span class="styUnderlineAmount" style="float:none;font-weigt:bold;width:151mm"/></div>
<br/>
<div>
  <span class="styBoldText" style="padding-right:1mm;">Title </span> <img src="{$ImagePath}/972_Bullet_Sm.gif" alt="Right Arrow Bullet"/>  <span style="padding-left:140mm;padding-bottom:1mm;padding-top:1mm;"><span class="styBoldText">Date </span> <img src="{$ImagePath}/972_Bullet_Sm.gif" style="padding-left:1mm;" alt="Right Arrow Bullet"/></span></div>
</div>
<div style="width:187mm;clear:both;border-top:1px solid black;">
  <div style="width:100mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see back of form.</div>
  <div style="width:45mm;text-align:center;" class="styGenericDiv">Cat. No. 17058E</div>
  <div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">972</span> (Rev. 12-2011)</div>
</div>
  <!--<br class="pageEnd"/>-->     
  <div class="pageEnd"/>
  <!-- Begininning of write-in data -->
    <div class="styLeftOverTitleLine" id="LeftoverData">
      <div class="styLeftOverTitle">
        Additional Data        
      </div>
      <div class="styLeftOverButtonContainer">
        <input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
      </div>      
    </div>
    <table class="styLeftOverTbl">
      <xsl:call-template name="PopulateCommonLeftover">
        <xsl:with-param name="TargetNode" select="$FormData"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
    </table>
    
    <!--@@@@@@-->
       <!-- Additional Data Table for Separated Data from Lines 3 and 4-->
   <xsl:if test="($Print = $Separated) and count($FormData/ConsentDistribution) &gt; 11">
      <span class="styRepeatingDataTitle">
        Form 972, Lines 3 and 4 - Consent is given to include a specific amount in gross income based on the shares of stock 
        owned on the last day of the corporation’s tax year as shown below:
      </span>
   <table class="styDepTbl" style="width:187mm;font-size:7pt;">
     <thead class="styTableHead">    
    <tr class="styDepTblHdr">
      <th class="styDepTblCell" style="font-weight:normal;width:35mm;" scope="col">Class of stock</th>
      <th class="styDepTblCell" style="font-weight:normal;width:40mm;" scope="col">Number of shares</th>
      <th class="styDepTblCell" style="font-weight:normal;width:75mm;" scope="col">Certificate numbers</th>
      <th class="styDepTblCell" style="font-weight:normal;border-right-width: 0px;width:35mm;" scope="col">Amount of consent<br/>distribution allocable to<br/>each class of stock<br/>owned</th>
    </tr>
    </thead>
    <tfoot/>
    <tbody>
      <!-- Display all rows if the Print parameter is not Separated. If the Print parameter is Separated, but there are-->
      <!-- fewer elements than the container height, then also display all rows -->
        <xsl:for-each select="$FormData/ConsentDistribution">
          <tr>
            <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
            <td class="styDepTblCell" style="text-align: left; width:35mm;height:8mm;">
            <span class="styBoldText" style="width:3mm"> <xsl:if test="position()=1">3</xsl:if></span>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="StockClassDesc"/>
              </xsl:call-template>
              <span class="styTableCellPad"/>
            </td>
            <td class="styDepTblCell" style="text-align: right; width:40mm;height:8mm;padding-top:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="SharesCnt"/>
              </xsl:call-template>
              <span class="styTableCellPad"/>
            </td>
            <td class="styDepTblCell" style="text-align: left; width:75mm;height:8mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CertificateNumbersTxt"/>
              </xsl:call-template>
              <span class="styTableCellPad"/>
            </td>            
            <td class="styDepTblCell" style="border-right-width: 0px; text-align: right;width:35mm;height:8mm;padding-top:4mm;"><span class="styBoldText"><div style="float:left">$</div></span>
            <div style="text-align:right; ">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ConsentDistributionAmt"/>
              </xsl:call-template>
            </div>
            </td>
          </tr>
        </xsl:for-each>
        <xsl:call-template name="AddRows972">
          <xsl:with-param name="NumOfRows" select="11"/>
            <xsl:with-param name="StockCount" select="count($FormData/ConsentDistribution)"/>
        </xsl:call-template>
      <tr class="styDepTblRow1">
        <td class="styDepTblCell" colspan="3" style="text-align:left;border-bottom-width:0px;border-top-width:1px;width:152mm;height:8mm;padding-top:2mm;"><span class="styBoldText">4</span><span style="padding-left:4mm">Total consent distribution</span>
          <span class="styBoldText">
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
          </span>
          <img src="{$ImagePath}/972_Bullet_Md.gif" alt="Right Arrow Bullet"/> 
        </td>        
        <td class="styDepTblCell" style="border-right-width:0px;width:35mm;text-align:right;border-bottom-width:0px;border-top-width:1px;height:8mm;padding-top:2mm;"><span class="styBoldText"><div style="float:left">$</div></span>
          <div style="text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TotalConsentDistributionAmt"/>
            </xsl:call-template>
          </div>
        </td>
      </tr>
    </tbody>
  </table>
</xsl:if>
    <!-- End Line 3 Separated Data -->      
</form>
</body>  </html>
</xsl:template>
<xsl:template name="AddRows972">
<xsl:param name="NumOfRows"/>
  <xsl:param name="StockCount"/>
  <xsl:if test="$StockCount &lt; $NumOfRows">
<tr>
  <td class="styTableCell" style="width:38mm; height:8mm;"><span class="styTableCellPad"/></td>
  <td class="styTableCell" style=" width:33mm;height:8mm;"><span class="styTableCellPad"/></td>
  <td class="styTableCell" style=" width:79mm;height:8mm;"><span class="styTableCellPad"/></td>
  <td class="styTableCell" style="width:35mm;border-right-width: 0px;height:8mm; "><span class="styTableCellPad"/></td>
</tr>
<xsl:call-template name="AddRows972">
      <xsl:with-param name="StockCount" select="$StockCount + 1"/>
      <xsl:with-param name="NumOfRows" select="$NumOfRows"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>
</xsl:stylesheet>