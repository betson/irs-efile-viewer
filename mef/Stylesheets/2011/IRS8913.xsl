<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8913Style.xsl"/>


<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="Form8913" select="$RtnDoc/IRS8913" />

<xsl:template match="/">

<html>
  <head>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form8913)"></xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private" />
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="Description" content="IRS Form 8913" />
  
 
  
  <xsl:call-template name="InitJS"></xsl:call-template>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  
  <style type="text/css">
   <xsl:if test="not($Print) or $Print=''">
      
      <xsl:call-template name="IRS8913Style"></xsl:call-template>  
      <xsl:call-template name="AddOnStyle"></xsl:call-template>
    </xsl:if>
  </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
    <form name="Form8913">
      <xsl:call-template name="DocumentHeader"></xsl:call-template>

    <div class="styBB" style="width:187mm;">
    <div class="styFNBox" style="width:31mm;height:23.25mm;">
      Form <span class="styFormNumber">8913</span>      
      	<br />      
	<br />
	<br />
      <span class="styAgency">Department of the Treasury</span><br /><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="width:125mm;height:20mm;"><br/><br/>
      <div class="styMainTitle" style="height:8mm;">Credit for Federal Telephone Excise Tax Paid</div>
      <div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
	      <span style="text-align:center;">
          <img src="{$ImagePath}/8913_Bullet_Md.gif" alt="MediumBullet"/> 
          See the separate instructions.
          <br />
          <img src="{$ImagePath}/8913_Bullet_Md.gif" alt="MediumBullet"/> 
          Attach to your income tax return.
        </span>

      </div>
    </div>
    <div class="styTYBox" style="width:30mm;text-align:left;">
      	<div class="styOMB" style="height:2mm">OMB No. 1545-2051</div>
	<div class="styTY" style="padding-left:4mm">20<span class="styTYColor">06</span></div>
	<div class="styOMB" style="border-bottom-width:0;padding-left:4mm">Attachment<br/>
Sequence No. <span class="styBoldText">63</span></div>
    </div>
  </div>
      
      <div class="styNameAddr" style="width:123mm;height:14mm;border-left-width:1px;padding-left:1px;border-left-width:0">
        Name(s) as shown on your income tax return<br/>
         <span style="font-size:7pt">
          <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
          </xsl:call-template><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
          </xsl:call-template><br />
         <xsl:call-template name="PopulateReturnHeaderFiler">
             <xsl:with-param name="TargetNode">InCareOfName</xsl:with-param>
        </xsl:call-template>
        </span>
     
      </div>
       <div class="styNameAddr" style="font-size:7pt;width:63mm;height:14mm;border-left-width:1px;padding-left:1px;">
			<span style="width:8px"></span><b>Identifying number</b>
			<br/><span style="width:12px;padding-top:6mm"></span>
      	<xsl:call-template name="PopulateReturnHeaderFiler">
        	<xsl:with-param name="EINChanged">true</xsl:with-param>
        	<xsl:with-param name="TargetNode">EIN</xsl:with-param>
        </xsl:call-template> 
      </div>
      <div class="styBB" style="width:187mm">
	<div style="padding-bottom:1mm">
		Enter the federal telephone excise tax billed during each period as listed in column (a) of lines 1-14 below.	</div>
By filing this form, you are certifying that you (1) have not received from your service provider a credit or refund of the tax paid on
long distance service or bundled service billed after February 28, 2003, and before August 1, 2006, and (2) will not ask your
provider for a credit or refund or have withdrawn any request submitted to the provider for a credit or refund.<br/>
	<div style="padding-top:1mm">
	      <span class="styBoldText">Caution.</span>
	      See the instructions for explanations of the services that qualify for a credit or refund of the federal telephone excise tax.      </div>
      </div> 
      
	<div class="styBB" style="width:187mm;text-align:center;font-size:8pt;">
		<span class="styBoldText">Amount of federal excise tax on long distance or<br/> bundled service only</span>
	</div>

    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:12mm;border-bottom:black solid 1px"></div>
      <div class="styLNDesc" style="width:50mm;height:12mm;border-bottom:black solid 1px;padding-top:4mm"><span class="styBoldText">(a) Bills dated during:</span></div>
      <div class="styLNAmountBox" style="height:12mm;text-align:center"><span class="styBoldText">(b) Long<br/>distance<br/>service</span>
      </div>
      <div class="styLNAmountBox" style="height:12mm;text-align:center;padding-top:2mm;"><span class="styBoldText">(c) Bundled<br/>service</span>
      </div>
      <div class="styLNAmountBox" style="height:12mm;text-align:center"><span class="styBoldText">(d) Tax credit or<br/> refund (add<br/> columns (b) and (c))</span>
      </div>
      <div class="styLNAmountBox" style="height:12mm;text-align:center"><span class="styBoldText">(e) Interest <br/></span> (see instructions)
      </div>
    </div>
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:8mm;border-bottom:black solid 1">1</div>
      <div class="styLNDesc" style="width:50mm;height:8mm;border-bottom:black solid 1px">March, April, and<br/> May of 2003</div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2003/LongDistanceService"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2003/BundledService"/>
	      </xsl:call-template>
      </div>
     
      <xsl:choose>
        <xsl:when test="$Version = '2006v2.0' or $Version ='2006v2.1'">
        
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2003/TaxRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2003/InterestOnTaxRefund"/>
	      </xsl:call-template>
      </div>
        
    </xsl:when>
      
      <xsl:otherwise>
      

      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2003/TaxCreditOrRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2003/Interest"/>
	      </xsl:call-template>
      </div>
    
    </xsl:otherwise>
    
      </xsl:choose>
      
     </div>   
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:8mm;border-bottom:black solid 1">2</div>
      <div class="styLNDesc" style="width:50mm;height:8mm;border-bottom:black solid 1px">June, July, and<br/> August of 2003</div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2003/LongDistanceService"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2003/BundledService"/>
	      </xsl:call-template>
      </div>
      <xsl:choose>
        <xsl:when test="$Version = '2006v2.0' or $Version ='2006v2.1'">
        
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2003/TaxRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2003/InterestOnTaxRefund"/>
	      </xsl:call-template>
      </div>
        
    </xsl:when>
      
      <xsl:otherwise>
      

      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2003/TaxCreditOrRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2003/Interest"/>
	      </xsl:call-template>
      </div>
    
    </xsl:otherwise>
    
      </xsl:choose>
    </div>
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:8mm;border-bottom:black solid 1">3</div>
      <div class="styLNDesc" style="width:50mm;height:8mm;border-bottom:black solid 1px">September, October, and<br/> November of 2003</div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2003/LongDistanceService"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2003/BundledService"/>
	      </xsl:call-template>
      </div>
      <xsl:choose>
        <xsl:when test="$Version = '2006v2.0' or $Version ='2006v2.1'">
        
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2003/TaxRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2003/InterestOnTaxRefund"/>
	      </xsl:call-template>
      </div>
        
    </xsl:when>
      
      <xsl:otherwise>
      

      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2003/TaxCreditOrRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2003/Interest"/>
	      </xsl:call-template>
      </div>
    
    </xsl:otherwise>
    
      </xsl:choose>
    </div>
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:8mm;border-bottom:black solid 1">4</div>
      <div class="styLNDesc" style="width:50mm;height:8mm;border-bottom:black solid 1px;">December of 2003; January<br/> and February of 2004</div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December03JanuaryFebruary2004/LongDistanceService"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December03JanuaryFebruary2004/BundledService"/>
	      </xsl:call-template>
      </div>
      <xsl:choose>
        <xsl:when test="$Version = '2006v2.0' or $Version ='2006v2.1'">
        
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December03JanuaryFebruary2004/TaxRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December03JanuaryFebruary2004/InterestOnTaxRefund"/>
	      </xsl:call-template>
      </div>
        
    </xsl:when>
      
      <xsl:otherwise>
      

      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December03JanuaryFebruary2004/TaxCreditOrRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December03JanuaryFebruary2004/Interest"/>
	      </xsl:call-template>
      </div>
    
    </xsl:otherwise>
    
      </xsl:choose>
    </div>
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:8mm;border-bottom:black solid 1">5</div>
      <div class="styLNDesc" style="width:50mm;height:8mm;border-bottom:black solid 1px">March, April, and<br/> May of 2004</div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2004/LongDistanceService"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2004/BundledService"/>
	      </xsl:call-template>
      </div>
      <xsl:choose>
        <xsl:when test="$Version = '2006v2.0' or $Version ='2006v2.1'">
        
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2004/TaxRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2004/InterestOnTaxRefund"/>
	      </xsl:call-template>
      </div>
        
    </xsl:when>
      
      <xsl:otherwise>
      

      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2004/TaxCreditOrRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2004/Interest"/>
	      </xsl:call-template>
      </div>
    
    </xsl:otherwise>
    
      </xsl:choose>
    </div>
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:8mm;border-bottom:black solid 1">6</div>
      <div class="styLNDesc" style="width:50mm;height:8mm;border-bottom:black solid 1px">June, July, and<br/> August of 2004</div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2004/LongDistanceService"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2004/BundledService"/>
	      </xsl:call-template>
      </div>
      <xsl:choose>
        <xsl:when test="$Version = '2006v2.0' or $Version ='2006v2.1'">
        
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2004/TaxRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2004/InterestOnTaxRefund"/>
	      </xsl:call-template>
      </div>
        
    </xsl:when>
      
      <xsl:otherwise>
      

      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2004/TaxCreditOrRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2004/Interest"/>
	      </xsl:call-template>
      </div>
    
    </xsl:otherwise>
    
      </xsl:choose>
    </div>
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:8mm;border-bottom:black solid 1">7</div>
      <div class="styLNDesc" style="width:50mm;height:8mm;border-bottom:black solid 1px">September, October, and<br/> November of 2004</div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2004/LongDistanceService"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2004/BundledService"/>
	      </xsl:call-template>
      </div>
      <xsl:choose>
        <xsl:when test="$Version = '2006v2.0' or $Version ='2006v2.1'">
        
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2004/TaxRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2004/InterestOnTaxRefund"/>
	      </xsl:call-template>
      </div>
        
    </xsl:when>
      
      <xsl:otherwise>
      

      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2004/TaxCreditOrRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2004/Interest"/>
	      </xsl:call-template>
      </div>
    
    </xsl:otherwise>
    
      </xsl:choose>
    </div>
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:8mm;border-bottom:black solid 1">8</div>
      <div class="styLNDesc" style="width:50mm;height:8mm;border-bottom:black solid 1px">December of 2004; January<br/> and February of 2005</div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December04JanuaryFebruary2005/LongDistanceService"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December04JanuaryFebruary2005/BundledService"/>
	      </xsl:call-template>
      </div>
      <xsl:choose>
        <xsl:when test="$Version = '2006v2.0' or $Version ='2006v2.1'">
        
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December04JanuaryFebruary2005/TaxRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December04JanuaryFebruary2005/InterestOnTaxRefund"/>
	      </xsl:call-template>
      </div>
        
    </xsl:when>
      
      <xsl:otherwise>
      

      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December04JanuaryFebruary2005/TaxCreditOrRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December04JanuaryFebruary2005/Interest"/>
	      </xsl:call-template>
      </div>
    
    </xsl:otherwise>
    
      </xsl:choose>
    </div>
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:8mm;border-bottom:black solid 1">9</div>
      <div class="styLNDesc" style="width:50mm;height:8mm;border-bottom:black solid 1px">March, April, and<br/> May of 2005</div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMayJune2005/LongDistanceService"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMayJune2005/BundledService"/>
	      </xsl:call-template>
      </div>
      <xsl:choose>
        <xsl:when test="$Version = '2006v2.0' or $Version ='2006v2.1'">
        
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMayJune2005/TaxRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMayJune2005/InterestOnTaxRefund"/>
	      </xsl:call-template>
      </div>
        
    </xsl:when>
      
      <xsl:otherwise>
      

      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMayJune2005/TaxCreditOrRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMayJune2005/Interest"/>
	      </xsl:call-template>
      </div>
    
    </xsl:otherwise>
    
      </xsl:choose>
    </div>
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:8mm;border-bottom:black solid 1">10</div>
      <div class="styLNDesc" style="width:50mm;height:8mm;border-bottom:black solid 1px">June, July, and<br/> August of 2005</div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2005/LongDistanceService"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2005/BundledService"/>
	      </xsl:call-template>
      </div>
      <xsl:choose>
        <xsl:when test="$Version = '2006v2.0' or $Version ='2006v2.1'">
        
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2005/TaxRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2005/InterestOnTaxRefund"/>
	      </xsl:call-template>
      </div>
        
    </xsl:when>
      
      <xsl:otherwise>
      

      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2005/TaxCreditOrRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJulyAugust2005/Interest"/>
	      </xsl:call-template>
      </div>
    
    </xsl:otherwise>
    
      </xsl:choose>
    </div>
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:8mm;border-bottom:black solid 1">11</div>
      <div class="styLNDesc" style="width:50mm;height:8mm;border-bottom:black solid 1px">September, October, and<BR/> November of 2005</div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2005/LongDistanceService"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2005/BundledService"/>
	      </xsl:call-template>
      </div>
      <xsl:choose>
        <xsl:when test="$Version = '2006v2.0' or $Version ='2006v2.1'">
        
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2005/TaxRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2005/InterestOnTaxRefund"/>
	      </xsl:call-template>
      </div>
        
    </xsl:when>
      
      <xsl:otherwise>
      

      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2005/TaxCreditOrRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/SeptemberOctoberNovember2005/Interest"/>
	      </xsl:call-template>
      </div>
    
    </xsl:otherwise>
    
      </xsl:choose>
    </div>
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:8mm;border-bottom:black solid 1">12</div>
      <div class="styLNDesc" style="width:50mm;height:8mm;border-bottom:black solid 1px">December of 2005; January<BR/> and February of 2006</div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December05JanuaryFebruary2006/LongDistanceService"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December05JanuaryFebruary2006/BundledService"/>
	      </xsl:call-template>
      </div>
      <xsl:choose>
        <xsl:when test="$Version = '2006v2.0' or $Version ='2006v2.1'">
        
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December05JanuaryFebruary2006/TaxRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December05JanuaryFebruary2006/InterestOnTaxRefund"/>
	      </xsl:call-template>
      </div>
        
    </xsl:when>
      
      <xsl:otherwise>
      

      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December05JanuaryFebruary2006/TaxCreditOrRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/December05JanuaryFebruary2006/Interest"/>
	      </xsl:call-template>
      </div>
    
    </xsl:otherwise>
    
      </xsl:choose>
    </div>
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:8mm;border-bottom:black solid 1px">13</div>
      <div class="styLNDesc" style="width:50mm;height:8mm;border-bottom:black solid 1px">March, April, and<br/> May of 2006</div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2006/LongDistanceService"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2006/BundledService"/>
	      </xsl:call-template>
      </div>
      <xsl:choose>
        <xsl:when test="$Version = '2006v2.0' or $Version ='2006v2.1'">
        
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2006/TaxRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2006/InterestOnTaxRefund"/>
	      </xsl:call-template>
      </div>
        
    </xsl:when>
      
      <xsl:otherwise>
      

      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2006/TaxCreditOrRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/MarchAprilMay2006/Interest"/>
	      </xsl:call-template>
      </div>
    
    </xsl:otherwise>
    
      </xsl:choose>
    </div>
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:8mm;border-bottom:black solid 1px">14</div>
      <div class="styLNDesc" style="width:50mm;height:8mm;border-bottom:black solid 1px">June and<br/> July of 2006</div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJuly2006/LongDistanceService"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJuly2006/BundledService"/>
	      </xsl:call-template>
      </div>
      <xsl:choose>
        <xsl:when test="$Version = '2006v2.0' or $Version ='2006v2.1'">
        
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJuly2006/TaxRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJuly2006/InterestOnTaxRefund"/>
	      </xsl:call-template>
      </div>
        
    </xsl:when>
      
      <xsl:otherwise>
      

      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJuly2006/TaxCreditOrRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;;padding-top:4mm"><span style="float:left">$</span> 
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/JuneJuly2006/Interest"/>
	      </xsl:call-template>
      </div>
    
    </xsl:otherwise>
    
      </xsl:choose>
    </div>
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:8mm;border-bottom:1 solid black;padding-top:4mm">15</div>
      <div class="styLNDesc" style="width:114mm;height:8mm;border-bottom:1 solid black;padding-top:4mm">Add lines 1-14 in columns (d) and (e)
      
        <span class="styBoldText">
          <span style="width:16px"></span>.
	  <span style="width:16px"></span>.
	  <span style="width:16px"></span>.
	  <span style="width:16px"></span>.
	  <span style="width:16px"></span>.
	  <span style="width:16px"></span>.
	  <span style="width:16px"></span>.
	  <span style="width:16px"></span>.
	  <span style="width:16px"></span>.
	  <span style="width:16px"></span>.
	  <span style="width:16px"></span>.
  	</span>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/Totals/TaxRefund"/>
	      </xsl:call-template>
      </div>
      <div class="styLNAmountBox" style="height:8mm;text-align:right;padding-top:4mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/Totals/InterestOnTaxRefund"/>
	      </xsl:call-template>
      </div>
    </div>
    <div style="width:187mm">

      <div class="styLNLeftNumBox" style="height:77px;border-bottom:1 solid black">16</div>
      <div class="styLNDesc" style="width:114mm;height:77px;border-bottom:1 solid black">
Total credit or refund requested. Add columns (d) and (e) on line 15. Enter here
and <br/>on Form 1040, line 71; Form 1040A, line 42; Form 1040EZ, line 9; Form
<br/>1040EZ-T, line 1a; Form 1040NR, line 69; Form 1040NR-EZ, line 21; Form 1120,
line 32g; Form 1120-A, line 28g; Form 1120S, line 23d; Form 1041, line 24f;
Form 1041-N, line 17; Form 1065, line 23; Form 990-T, line 44f; or the proper
line of other returns

        <span class="styBoldText">
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
	  <span style="width:16px"></span>.
  	</span>
	<img src="{$ImagePath}/8913_Bullet_Md.gif" alt="MediumBullet"/> 
      </div>
      <div class="styLNAmountBox" style="height:77px;background-color:gray">
      </div>
      <div class="styLNAmountBox" style="height:77px;padding-top:16mm"><span style="float:left">$</span>
	      <xsl:call-template name="PopulateAmount">
		      <xsl:with-param name="TargetNode" select="$Form8913/TotalCreditClaimed"/>
	      </xsl:call-template>
      </div>

    </div>
    <div style="width:187mm">
	    <span class="styBoldText">For Paperwork Reduction Act Notice, see page 2.</span>
	    <span style="padding-left:30mm">Cat. No. 37723M</span>
	    <span style="padding-left:43mm">Form <span class="styBoldText">8913</span> (2006)</span>

    </div>


<br class="pageend" />    



      <!-- BEGIN Left Over Table -->  
        <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>
        <!-- Additional Data Table -->
   <table class="styLeftOverTbl">
      <xsl:call-template name="PopulateCommonLeftover">
        <xsl:with-param name="TargetNode" select="$Form8913" />
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>          
    </table>
      <!-- END Left Over Table -->  

      <!-- Optional Print Solution for repeating data table Part I, Line 2 -->
     

    
     

    
     
    </form>
  </body>
</html>

</xsl:template>



</xsl:stylesheet>
