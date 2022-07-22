<?xml version="1.0"?>
<!-- 07-11-11 - Added new element as per UWR ETA-10-0929-OTH - Jeremy Nichols -->
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8621Style.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:strip-space elements="*" />
<xsl:param name="Form8621Data" select="$RtnDoc/IRS8621" />

<xsl:template match="/">
<html>
  <head>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form8621Data)"></xsl:with-param></xsl:call-template></title>    
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private"/>    
    <meta name="Description" content="Form 8621"/>
    <meta name="GENERATOR" content="IBM WebSphere Studio"/>
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
      
    <style type="text/css">      
      <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS8621Style"></xsl:call-template>  
        <xsl:call-template name="AddOnStyle"></xsl:call-template>    
      </xsl:if>
    </style>            
    <xsl:call-template name="GlobalStylesForm"/>
  </head>
  
  <body class="styBodyClass">    
    <form style="font-family:arial; font-size:9pt" name="Form8621">      
      <xsl:call-template name="DocumentHeader"></xsl:call-template>
      
      <div class="styTBB" style="width:187mm">
        <div class="styIRS8621FNBox" style="height:18mm; width:32mm; font-size:7pt">
          <div>
            Form &nbsp; <span class="styFormNumber">8621</span><br/>(Rev. December 2011)
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8621Data"/>              
            </xsl:call-template>
            <div style="font-size:6.5pt; line-height:100%">
              Department of the Treasury<br/>Internal Revenue Service
            </div>
          </div>          
        </div>
        <div class="styFTBox" style="width:122mm">
          <div class="styMainTitle" style="height:8mm;">
            Information Return by a Shareholder of a Passive Foreign<br/>Investment Company or Qualified Electing Fund<br />            
          </div>
          <div class="styFBT" style="font-size:8pt; padding-top:1mm">            
            <img src="{$ImagePath}/8621_Bullet.gif" alt="Arrow Bullet"/> See separate instructions.
          </div>
        </div>
        <div class="styTYBox" style="font-size:7pt; width:32mm; height:18mm">
          <div class="styOMB" style="padding-top:2.5mm; height:9mm">OMB No. 1545-1002</div>              
          <div style="padding-left:5mm; text-align:left; padding-top:2mm; line-height:90%">Attachment<br/>Sequence No. <b style="font-size:9pt">69</b></div>              
        </div>
      </div>
      
      <div class="styIRS8621BB" style="font-size:7pt">
        <div class="styIRS8621FNBox">
          Name of shareholder<br/>
          <div style=" font-family:'verdana';font-size:6pt;">
            <xsl:choose>
              <xsl:when test="normalize-space($Form8621Data/PersonNameOfShareholder)!=''">  
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/PersonNameOfShareholder"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>   
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/NameOfShareholder/BusinessNameLine1"/>
                </xsl:call-template>
                <xsl:if test="normalize-space($Form8621Data/NameOfShareholder/BusinessNameLine2)!=''">              
                  <br />
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8621Data/NameOfShareholder/BusinessNameLine2"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose> 
          </div>
        </div>
        <div style="float:left; padding-left:1mm">
          <b>Identifying number</b> (see instructions)        
          <div style="text-align:left; padding-top:2mm; font-family:'verdana';font-size:7pt;vertical-align:bottom;">
            <xsl:choose>
                <xsl:when test="normalize-space($Form8621Data/EmployerIdentificationNumber)!=''">
                  <xsl:call-template name="PopulateEIN"><xsl:with-param name="TargetNode" select="$Form8621Data/EmployerIdentificationNumber"/></xsl:call-template>
                </xsl:when>
                <xsl:when test="normalize-space($Form8621Data/MissingEINReason)!=''">
                  <xsl:call-template name="PopulateEIN"><xsl:with-param name="TargetNode" select="$Form8621Data/MissingEINReason"/></xsl:call-template>
                </xsl:when>
                 <xsl:otherwise>    
                <xsl:call-template name="PopulateSSN"><xsl:with-param name="TargetNode" select="$Form8621Data/SocialSecurityNumber"/></xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>      
          </div>          
        </div>
      </div>  
      
      <div class="styIRS8621BB" style="font-size:7pt">
        <div class="styIRS8621FNBox">
          Number, street, and room or suite no. (If a P.O. box, see instructions.)<br/>
          <div style=" font-family:'verdana';font-size:7pt;">
 <!-- Choose between Shareholder US or Foreign Address -->
                <xsl:if test="$Form8621Data/ShareholderUSAddress">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderUSAddress/AddressLine1"/>
                  </xsl:call-template>
                  <xsl:if test="normalize-space($Form8621Data/ShareholderUSAddress/AddressLine2)!=''">    
                    <br />
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderUSAddress/AddressLine2"/>
                    </xsl:call-template>          
                  </xsl:if>
                </xsl:if>
                <xsl:if test="$Form8621Data/ShareholderForeignAddress">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderForeignAddress/AddressLine1"/>
                  </xsl:call-template>
                  <xsl:if test="normalize-space($Form8621Data/ShareholderForeignAddress/AddressLine2)!=''">    
                    <br />
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderForeignAddress/AddressLine2"/>
                    </xsl:call-template>          
                  </xsl:if>
                </xsl:if>
          </div>
        </div>
        <div style="float:left; padding-left:1mm; line-height:130%">
          Shareholder tax year: calendar year
          <xsl:choose>
            <xsl:when test="$Form8621Data/ShareholderTaxYear">              
              <span class="styIRS8621DotBB" style="width:10mm">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderTaxYear"/></xsl:call-template>  
              </span>  
            </xsl:when>
            <xsl:otherwise>
              20<span class="styIRS8621DotBB" style="width:5mm"></span>  
            </xsl:otherwise>
          </xsl:choose>          
          or other tax year<br/>beginning              
          <xsl:choose>
            <xsl:when test="$Form8621Data/ShareholderBeginningTaxYear">              
              <span class="styIRS8621DotBB" style="width:20mm">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderBeginningTaxYear"/></xsl:call-template>  
              </span>  
            </xsl:when>
            <xsl:otherwise>
              <span class="styIRS8621DotBB" style="width:12mm"></span>&nbsp;, 
              20<span class="styIRS8621DotBB" style="width:5mm"></span>  
            </xsl:otherwise>
          </xsl:choose>                          
           and ending                
          <xsl:choose>
            <xsl:when test="$Form8621Data/ShareholderBeginningTaxYear">              
              <span class="styIRS8621DotBB" style="width:20mm">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderEndingTaxYear"/></xsl:call-template>  
              </span>  
            </xsl:when>
            <xsl:otherwise>
              <span class="styIRS8621DotBB" style="width:12mm"></span>&nbsp;, 
              20<span class="styIRS8621DotBB" style="width:5mm"></span>  
            </xsl:otherwise>
          </xsl:choose>
          .            
        </div>
      </div>  
      
      <div class="styIRS8621BB" style="font-size:6.5pt">
        City or town, state, and ZIP code or country<br />

       <!-- Choose between Shareholder US or Foreign Address -->
              <xsl:if test="$Form8621Data/ShareholderUSAddress">
                <div style=" font-family:'verdana';font-size:7pt;padding-top:1mm">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderUSAddress/City"/>
                </xsl:call-template>, 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderUSAddress/State"/>
                </xsl:call-template> &nbsp;
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderUSAddress/ZIPCode"/>
                </xsl:call-template>
                </div>       
              </xsl:if>
              <xsl:if test="$Form8621Data/ShareholderForeignAddress">
                <div style=" font-family:'verdana';font-size:7pt;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderForeignAddress/City"/>
                </xsl:call-template>, 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderForeignAddress/ProvinceOrState"/>
                </xsl:call-template> &nbsp;
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderForeignAddress/PostalCode"/>
                </xsl:call-template><br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderForeignAddress/Country"/>
                </xsl:call-template>
                </div>  
              </xsl:if>
    </div>
      
      <div class="styIRS8621BB" style="font-size:8pt; height:4mm">
        Check type of shareholder filing the return:
        <span style="width:3mm"></span>
        <input type="Checkbox" class="styCkbox"><xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form8621Data/IndividualShareholder"/><xsl:with-param name="BackupName">Form8621IndividualShareholder </xsl:with-param></xsl:call-template></input>
        <label>
        	<xsl:call-template name="PopulateLabel">
        		<xsl:with-param name="TargetNode" select="$Form8621Data/IndividualShareholder" />
        		<xsl:with-param name="BackupName">Form8621IndividualShareholder </xsl:with-param>
        	</xsl:call-template>
          Individual
        </label>  
        <span style="width:3mm"></span>
        <input type="Checkbox" class="styCkbox"><xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form8621Data/CorporationShareholder"/><xsl:with-param name="BackupName">Form8621CorporationShareholder </xsl:with-param></xsl:call-template></input>
        <label>
        	<xsl:call-template name="PopulateLabel">
        		<xsl:with-param name="TargetNode" select="$Form8621Data/CorporationShareholder" />
        		<xsl:with-param name="BackupName">Form8621CorporationShareholder </xsl:with-param>
        	</xsl:call-template>
          Corporation
        </label>    
        <span style="width:3mm"></span>
        <input type="Checkbox" class="styCkbox"><xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form8621Data/PartnershipShareholder"/><xsl:with-param name="BackupName">Form8621PartnershipShareholder </xsl:with-param></xsl:call-template></input>
        <label>
        	<xsl:call-template name="PopulateLabel">
        		<xsl:with-param name="TargetNode" select="$Form8621Data/PartnershipShareholder" />
        		<xsl:with-param name="BackupName">Form8621PartnershipShareholder </xsl:with-param>
        	</xsl:call-template>
          Partnership
        </label>    
        <span style="width:3mm"></span>
        <input type="Checkbox" class="styCkbox"><xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form8621Data/SCorporationShareholder"/><xsl:with-param name="BackupName">Form8621SCorporationShareholder </xsl:with-param></xsl:call-template></input>
        <label>
        	<xsl:call-template name="PopulateLabel">
        		<xsl:with-param name="TargetNode" select="$Form8621Data/SCorporationShareholder" />
        		<xsl:with-param name="BackupName">Form8621SCorporationShareholder </xsl:with-param>
        	</xsl:call-template>
          S Corporation
        </label>    
        <span style="width:3mm"></span>
        <input type="Checkbox" class="styCkbox"><xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form8621Data/NongrantorTrustShr"/><xsl:with-param name="BackupName">Form8621NongrantorTrustShr </xsl:with-param></xsl:call-template></input>
        <label>
        	<xsl:call-template name="PopulateLabel">
        		<xsl:with-param name="TargetNode" select="$Form8621Data/NongrantorTrustShr" />
        		<xsl:with-param name="BackupName">Form8621NongrantorTrustShr </xsl:with-param>
        	</xsl:call-template>
          Nongrantor Trust
        </label>    
        <span style="width:3mm"></span>
        <input type="Checkbox" class="styCkbox"><xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form8621Data/EstateShareholder"/><xsl:with-param name="BackupName">Form8621EstateShareholder </xsl:with-param></xsl:call-template></input>
        <label>
        	<xsl:call-template name="PopulateLabel">
        		<xsl:with-param name="TargetNode" select="$Form8621Data/EstateShareholder" />
        		<xsl:with-param name="BackupName">Form8621EstateShareholder </xsl:with-param>
        	</xsl:call-template>
          Estate
        </label>    
      </div>
      
      <div class="styIRS8621BB" style="font-size:6.5pt">
        <div class="styIRS8621FNBox">
          Name of passive foreign investment company (PFIC) or qualified electing fund (QEF)<br/>
          <div style="font-family:'verdana';font-size:6pt;">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/NameOfPFICOrQEF/BusinessNameLine1"/></xsl:call-template>&nbsp;
            <xsl:if test="normalize-space($Form8621Data/NameOfPFICOrQEF/BusinessNameLine2)!=''">  
              <br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/NameOfPFICOrQEF/BusinessNameLine2"/></xsl:call-template>  
            </xsl:if>
          </div>
        </div>
        <div style="float:left; padding-left:1mm">
          <b>Employer identification number</b> (if any)
          <div style="text-align:left; padding-top:2mm; font-family:'verdana';font-size:7pt;vertical-align:bottom;">  
            <xsl:call-template name="PopulateEIN"><xsl:with-param name="TargetNode" select="$Form8621Data/EINOfPFICOrQlfyElectingFund"/></xsl:call-template>
            <xsl:if test="$Form8621Data/EINMissingReason!=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="$Form8621Data/EINMissingReason"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>              
          </div>        
        </div>  
      </div>  
      
      <div class="styIRS8621BB" style="font-size:6.5pt">
        <div class="styIRS8621FNBox" style="height:10mm">
          Address (Enter number, street, city or town, and country.)<br/>
          <div style="font-family:'verdana';font-size:7pt;">
            <xsl:choose>
              <xsl:when test="$Form8621Data/USAddressOfPFICOrQEF">
                <xsl:call-template name="PopulateUSAddressTemplate">
	                <xsl:with-param name="TargetNode" select="$Form8621Data/USAddressOfPFICOrQEF" />
	              </xsl:call-template>
              </xsl:when> 
              <xsl:otherwise>  
                <xsl:if test="$Form8621Data/ForeignAddressOfPFICOrQEF">
                  <xsl:call-template name="PopulateForeignAddressTemplate">
		               <xsl:with-param name="TargetNode" select="$Form8621Data/ForeignAddressOfPFICOrQEF" />
		             </xsl:call-template>
                </xsl:if>     
              </xsl:otherwise>  
            </xsl:choose>      
          </div>
        </div>
        <div style="float:left; padding-left:1mm; line-height:130%">
          Tax year of company or fund: calendar year
          <xsl:choose>
            <xsl:when test="$Form8621Data/TaxYearOfCompanyOrFund">              
              <span class="styIRS8621DotBB" style="width:10mm">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/TaxYearOfCompanyOrFund"/></xsl:call-template>  
              </span>  
            </xsl:when>
            <xsl:otherwise>
              20<span class="styIRS8621DotBB" style="width:5mm"></span>  
            </xsl:otherwise>
          </xsl:choose>                    
          or other<br/>tax year beginning                
          <xsl:choose>
            <xsl:when test="$Form8621Data/CompanyOrFundBeginningTaxYear">              
              <span class="styIRS8621DotBB" style="width:20mm">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/CompanyOrFundBeginningTaxYear"/></xsl:call-template>  
              </span>  
            </xsl:when>
            <xsl:otherwise>
              <span class="styIRS8621DotBB" style="width:12mm"></span>&nbsp;,    
              20<span class="styIRS8621DotBB" style="width:5mm"></span>  
            </xsl:otherwise>
          </xsl:choose>                    
          and<br/>ending              
          <xsl:choose>
            <xsl:when test="$Form8621Data/CompanyOrFundBeginningTaxYear">              
              <span class="styIRS8621DotBB" style="width:20mm">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/CompanyOrFundEndingTaxYear"/></xsl:call-template>  
              </span>  
            </xsl:when>
            <xsl:otherwise>
              <span class="styIRS8621DotBB" style="width:12mm"></span>&nbsp;,
              20<span class="styIRS8621DotBB" style="width:5mm"></span>  
            </xsl:otherwise>
          </xsl:choose>
          .            
        </div>
      </div>
  
    <!-- BEGIN Part I Title -->
      <div class="styIRS8621BB" style="height:4mm; border-top:1 solid black">
        <div class="styTitleName" style="width:12mm; font-size:10pt">Part I</div>
        <div class="styTitleDesc" style="font-size:10pt">Elections <span class="styNormalText">(See instructions.)</span></div>        
      </div>
    <!-- END Part I Title -->
    
    <!-- BEGIN Part I Line Items -->    
      <div class="styIRS8621Item" style="padding-bottom:1mm; padding-top:1mm">
        <div class="styIRS8621Part1">
          <b>A</b>&nbsp;<input type="Checkbox" class="styCkbox"><xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionToTreatThePFICAsQEF"/><xsl:with-param name="BackupName">Form8621ElectionToTreatThePFICAsQEF </xsl:with-param></xsl:call-template></input>
        </div>
        <div class="styIRS8621LNDesc" style="font-family:'arial Narrow'">
          <label>
          <xsl:call-template name="PopulateLabel">
          	<xsl:with-param name="TargetNode" select="$Form8621Data/ElectionToTreatThePFICAsQEF" />
          	<xsl:with-param name="BackupName">Form8621ElectionToTreatThePFICAsQEF </xsl:with-param>
     
          </xsl:call-template>
            <b>Election To Treat the PFIC as a QEF.</b> I, a shareholder of a PFIC, elect to treat the PFIC as a QEF. <i>Complete lines 1a through 2c of Part II.</i>
          </label>
        </div>
      </div>
      
      <div class="styIRS8621Item" style="padding-bottom:1mm">
        <div class="styIRS8621Part1">
          <b>B</b>&nbsp;<input type="Checkbox" class="styCkbox"><xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form8621Data/DeemedSaleElection"/><xsl:with-param name="BackupName">Form8621DeemedSaleElection </xsl:with-param></xsl:call-template></input>
        </div>
        <div class="styIRS8621LNDesc">
          <label>
          <xsl:call-template name="PopulateLabel">
          	<xsl:with-param name="TargetNode" select="$Form8621Data/DeemedSaleElection" />
          	<xsl:with-param name="BackupName">Form8621DeemedSaleElection </xsl:with-param>
          </xsl:call-template>
            <b>Deemed Sale Election.</b> I, a shareholder on the first day of a PFIC's first tax year as a QEF, elect to recognize gain on the<br/>deemed sale of my interest in the PFIC. <i>Enter gain or loss on line 10f of Part IV.</i>
          </label>
        </div>
      </div>
      
      <div class="styIRS8621Item" style="padding-bottom:1mm">
        <div class="styIRS8621Part1">
          <b>C</b>&nbsp;<input type="Checkbox" class="styCkbox"><xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form8621Data/DeemedDividendElection"/><xsl:with-param name="BackupName">Form8621DeemedDividendElection </xsl:with-param></xsl:call-template></input>
        </div>
        <div class="styIRS8621LNDesc">
          <label>
          <xsl:call-template name="PopulateLabel">
          	<xsl:with-param name="TargetNode" select="$Form8621Data/DeemedDividendElection" />
          	<xsl:with-param name="BackupName">Form8621DeemedDividendElection </xsl:with-param>          
          </xsl:call-template>
            <b>Deemed Dividend Election.</b> I, a shareholder on the first day of a PFIC's first tax year as a QEF that is a controlled foreign<br/>corporation (CFC), elect to treat an amount equal to my share of the post-1986 earnings and profits of the CFC as an excess<br/>distribution. <i>Enter this amount on line 10e of Part IV.</i>
          </label>
          &nbsp;
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form8621Data/DeemedDividendElection"/>            
          </xsl:call-template>
        </div>
      </div>
      
      <div class="styIRS8621Item" style="padding-bottom:1mm">
        <div class="styIRS8621Part1">
          <b>D</b>&nbsp;<input type="Checkbox" class="styCkbox"><xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectToExtendTimeForPymtOfTax"/><xsl:with-param name="BackupName">Form8621ElectToExtendTimeForPymtOfTax </xsl:with-param></xsl:call-template></input>
        </div>
        <div class="styIRS8621LNDesc">
          <label>
          <xsl:call-template name="PopulateLabel">
          	<xsl:with-param name="TargetNode" select="$Form8621Data/ElectToExtendTimeForPymtOfTax" />
          	<xsl:with-param name="BackupName">Form8621ElectToExtendTimeForPymtOfTax </xsl:with-param>
          </xsl:call-template>
            <b>Election To Extend Time For Payment of Tax.</b> I, a shareholder of a QEF, elect to extend the time for payment of tax on<br/>the undistributed earnings and profits of the QEF until this election is terminated. <i>Complete lines 3a through 4c of Part II to<br/>calculate the tax that may be deferred.</i><br/><b>Note:</b> &nbsp; <i>If any portion of line 1a or line 2a of Part II is includible under section  951, you may <b>not</b> make this election.<br/>Also, see sections 1294(c) and 1294(f) and the related regulations for events that terminate this election.</i>
          </label>
        </div>
      </div>
      
      <div class="styIRS8621Item" style="padding-bottom:1mm">
        <div class="styIRS8621Part1">
          <b>E</b>&nbsp;<input type="Checkbox" class="styCkbox"><xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectToRecognizeGainOnPFICSale"/><xsl:with-param name="BackupName">Form8621ElectToRecognizeGainOnPFICSale </xsl:with-param></xsl:call-template></input>
        </div>
        <div class="styIRS8621LNDesc" style="font-size: 8pt;">
          <label>
          	<xsl:call-template name="PopulateLabel">
          		<xsl:with-param name="TargetNode" select="$Form8621Data/ElectToRecognizeGainOnPFICSale" />
          		<xsl:with-param name="BackupName">Form8621ElectToRecognizeGainOnPFICSale </xsl:with-param>
          	</xsl:call-template>
            <b>Election To Recognize Gain on Deemed Sale of PFIC.</b> I, a shareholder of a former PFIC or a PFIC to which section 1297(e) applies, elect to treat as an excess distribution the gain recognized on the deemed sale of my interest in the PFIC, or, if I qualify, my share of the PFICs post-1986 earnings and profits deemed distributed, on the last day of its last tax year as a PFIC under section 1297(a). <i>Enter gain on line 10f of Part IV.</i>
          </label>
        </div>
      </div>
      
      <div class="styIRS8621Item" style="padding-bottom:1mm">
        <div class="styIRS8621Part1">
          <b>F</b>&nbsp;<input type="Checkbox" class="styCkbox"><xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectToMarkToMarketPFICStock"/><xsl:with-param name="BackupName">Form8621ElectToMarkToMarketPFICStock </xsl:with-param></xsl:call-template></input>
        </div>
        <div class="styIRS8621LNDesc">
          <label>
          	<xsl:call-template name="PopulateLabel">
          		<xsl:with-param name="TargetNode" select="$Form8621Data/ElectToMarkToMarketPFICStock" />
          		<xsl:with-param name="BackupName">Form8621ElectToMarkToMarketPFICStock </xsl:with-param>
          	</xsl:call-template>
            <b>Election To Mark-to-Market PFIC Stock.</b> I, a shareholder of a PFIC, elect to mark-to-market the PFIC stock that is<br/>marketable within the meaning of section 1296(e). <i>Complete Part III.</i>
          </label>
        </div>
      </div>
      
<div class="styIRS8621Item" style="padding-bottom:1mm">
        <div class="styIRS8621Part1">
          <b>G</b>&nbsp;<input type="Checkbox" class="styCkbox"><xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form8621Data/DeemedDivElectSec1297ePFICInd"/><xsl:with-param name="BackupName">Form8621DeemedDivElectSec1297ePFICInd </xsl:with-param></xsl:call-template></input>
        </div>
        <div class="styIRS8621LNDesc" style="font-size: 8pt;">
          <label>
          	<xsl:call-template name="PopulateLabel">
          		<xsl:with-param name="TargetNode" select="$Form8621Data/DeemedDivElectSec1297ePFICInd" />
          		<xsl:with-param name="BackupName">Form8621DeemedDivElectSec1297ePFICInd </xsl:with-param>
          	</xsl:call-template>
            <b>Deemed Dividend Election With Respect to a Section 1297(e) PFIC.</b> I, a shareholder of a section 1297(e) PFIC, within the meaning of Regulations section 1.1291-9(j)(2)(v), elect to make a deemed dividend election with respect to the section 1297(e) PFIC. My holding period in the stock of the Section 1297(e) PFIC includes the CFC qualiication date, as defined in Regulations section 1.1297-3(d).
          </label>
        </div>
      </div>      
      
      <div class="styIRS8621Item" style="padding-bottom:1mm">
        <div class="styIRS8621Part1">
          <b>H</b>&nbsp;<input type="Checkbox" class="styCkbox"><xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form8621Data/DeemedDivElectFrmrPFICInd"/><xsl:with-param name="BackupName">Form8621DeemedDivElectFrmrPFICInd </xsl:with-param></xsl:call-template></input>
        </div>
        <div class="styIRS8621LNDesc" style="font-size: 8pt;">
          <label>
          	<xsl:call-template name="PopulateLabel">
          		<xsl:with-param name="TargetNode" select="$Form8621Data/DeemedDivElectFrmrPFICInd" />
          		<xsl:with-param name="BackupName">Form8621DeemedDivElectFrmrPFICInd </xsl:with-param>
          	</xsl:call-template>
            <b>Deemed Dividend Election With Respect to a Former PFIC.</b> I, a shareholder of a former PFIC, within the meaning of Regulations section 1.1291-9(j)(2)(iv), elect to make a deemed dividend election with respect to the former PFIC. My holding period in the stock of the former PFIC includes the termination date, as defined in Regulations section 1.1298-3(d).
          </label>
        </div>
      </div> 
      
    <!-- END Part I Line Items -->
  
    <!-- BEGIN Part II Title -->  
      <div class="styIRS8621BB" style="height:8mm; border-top:2 solid black">
        <div class="styTitleName" style="width:13mm; font-size:10pt">Part II</div>
        <div class="styTitleDesc" style="font-size:10pt; width:170mm">Income From a Qualified Electing Fund (QEF). <span class="styNormalText" style="font-size:8pt">All QEF shareholders complete lines 1a through 2c. If you are making<br/>Election D, also complete lines 3a through 4c. (See instructions.)</span></div>        
      </div>
    <!-- END Part II Title -->
    
    <!-- BEGIN Part II Line Items -->
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2" style="padding-top:0.5mm">1a</div>
        <div style="float:left; padding-top:0.5mm">
          Enter your pro rata share of the ordinary earnings of the QEF            
        </div>    
        <div style="float:right">    
          <span class="styIRS8621DotLn">      
            .                          
          </span>
          <div class="styIRS8621LNRightNumBox" style="margin-top:0.5mm">1a</div>  
          <div class="styIRS8621LNAmountBox" style="margin-top:0.5mm">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ProRataShareOfQEFOrdinaryEarn"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey; height:4.7mm"></div>  
          <div class="styIRS8621LNAmountBoxNBB" style="height:4.7mm"></div>
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">b</div>
        <div style="float:left">
          Enter the portion of line 1a that is included in income under<br/>section  951 or that may be excluded under section 1293(g)          
        </div>      
        <div style="float:right">    
          <div class="styIRS8621LNRightNumBox" style="height:8.5mm; padding-top:4mm">1b</div>  
          <div class="styIRS8621LNAmountBox" style="height:8.5mm; padding-top:4mm">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/IncomePortionOfOrdinaryEarn"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey; height:8.5mm"></div>  
          <div class="styIRS8621LNAmountBoxNBB" style="height:8.5mm"></div>  
        </div>  
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">c</div>
        <div style="float:left">
          Subtract line 1b from line 1a. Enter this amount on your tax return as ordinary income
        </div>      
        <div style="float:right">      
          <span class="styIRS8621DotLn">      
            ...                        
          </span>                    
          <div class="styIRS8621LNRightNumBox">1c</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/OrdinaryIncomeFromQEFAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">2a</div>
        <div style="float:left">
          Enter your pro rata share of the total net capital gain of the QEF
        </div>        
        <div style="float:right">    
          <div class="styIRS8621LNRightNumBox">2a</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ProRataShareOfTotalNetCapGain"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey"></div>  
          <div class="styIRS8621LNAmountBoxNBB"></div>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">b</div>
        <div style="float:left">
          Enter the portion of line 2a that is included in income under<br/>section 951 or that may be excluded under section 1293(g)      
        </div>        
        <div style="float:right">    
          <div class="styIRS8621LNRightNumBox" style="height:8mm; padding-top:4mm">2b</div>  
          <div class="styIRS8621LNAmountBox" style="height:8.1mm; padding-top:4mm">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/IncomePortionOfNetCapitalGain"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey; height:8.1mm"></div>  
          <div class="styIRS8621LNAmountBoxNBB" style="height:8.1mm"></div>  
        </div>      
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">c</div>
        <div style="float:left">
          Subtract line 2b from line 2a. This amount is a net long-term capital gain. Enter this amount    
        </div>        
        <div style="float:right">                            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"></div>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"></div>  
        </div>  
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2"></div>
        <div style="float:left">
          in Part II of the Schedule D used for your income tax return. (See instructions.)          
        </div>        
        <div style="float:right">    
          <span class="styIRS8621DotLn">      
            .....                        
          </span>                    
          <div class="styIRS8621LNRightNumBox">2c</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/NetLongTermCapitalGain"/></xsl:call-template>
          </div>  
        </div>  
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">3a</div>
        <div style="float:left">
          Add lines 1c and 2c
        </div>        
        <div style="float:right">      
          <span class="styIRS8621DotLn">      
            .........................                                                          
          </span>                  
          <div class="styIRS8621LNRightNumBox">3a</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DividendIncomeAndNetLTCG"/></xsl:call-template>
          </div>  
        </div>      
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">b</div>
        <div style="float:left">
          Enter the total amount of cash and the fair market value of other<br/>property distributed or deemed distributed to you during the tax  
        </div>        
        <div style="float:right">                        
          <div class="styIRS8621LNRightNumBox" style="height:8mm; border-bottom:0"></div>  
          <div class="styIRS8621LNAmountBox" style="height:8mm; border-bottom:0"></div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey; height:8mm"></div>  
          <div class="styIRS8621LNAmountBoxNBB" style="height:8mm"></div>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2"></div>
        <div style="float:left">
          year of the QEF. (See instructions.)    
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form8621Data/TotalCashAndDistributions"/>
          </xsl:call-template>    
        </div>        
        <div style="float:right">      
          <span class="styIRS8621DotLn">    
            ..........                                                                          
          </span>            
          <div class="styIRS8621LNRightNumBox">3b</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/TotalCashAndDistributions"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey"></div>  
          <div class="styIRS8621LNAmountBoxNBB"></div>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">c</div>
        <div style="float:left">
          Enter the portion of line 3a not already included in line 3b that is<br/>attributable to shares in the QEF that you disposed of, pledged,
        </div>        
        <div style="float:right">              
          <div class="styIRS8621LNRightNumBox" style="height:8mm; border-bottom:0"></div>  
          <div class="styIRS8621LNAmountBox" style="height:8mm; border-bottom:0"></div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey; height:8mm"></div>  
          <div class="styIRS8621LNAmountBoxNBB" style="height:8mm"></div>  
        </div>      
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2"></div>
        <div style="float:left">
          or otherwise transferred during the tax year
        </div>        
        <div style="float:right">      
          <span class="styIRS8621DotLn">      
            .......                                                                                  
          </span>          
          <div class="styIRS8621LNRightNumBox">3c</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/PortionOfProRataOrdnryEarnings"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey"></div>  
          <div class="styIRS8621LNAmountBoxNBB"></div>  
        </div>      
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">d</div>
        <div style="float:left">
          Add lines 3b and 3c
        </div>        
        <div style="float:right">      
          <span class="styIRS8621DotLn">      
            .........................                            
          </span>                    
          <div class="styIRS8621LNRightNumBox">3d</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/TotalCashAndPortionOfProRata"/></xsl:call-template>
          </div>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">e</div>
        <div style="float:left">
          Subtract line 3d from line 3a, and enter the difference (if zero or less, enter amount in brackets)
        </div>        
        <div style="float:right">                  
          <div class="styIRS8621LNRightNumBox">3e</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ProRataLessCashAndPortion"/></xsl:call-template>
          </div>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2"></div>
        <div style="float:left">
          <b>Important:</b> &nbsp; <i>If line 3e is greater than zero, and no portion of line 1a or 2a is includible in income<br/>under section 951, you may make Election D with respect to the amount on line 3e.</i>
        </div>      
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey; height:8mm"></div>  
          <div class="styIRS8621LNAmountBoxNBB" style="height:8mm"></div>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">4a</div>
        <div style="float:left">
          Enter the total tax for the tax year (See instructions.)
        </div>      
        <div style="float:right">    
          <span class="styIRS8621DotLn">      
            ....                            
          </span>            
          <div class="styIRS8621LNRightNumBox">4a</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/TotalTaxForTheTaxYear"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey"></div>  
          <div class="styIRS8621LNAmountBoxNBB"></div>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">b</div>
        <div style="float:left">
          Enter the total tax for the tax year determined without regard to  
        </div>      
        <div style="float:right">                
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"></div>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"></div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey"></div>  
          <div class="styIRS8621LNAmountBoxNBB"></div>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2"></div>
        <div style="float:left">
          the amount entered on line 3e      
        </div>      
        <div style="float:right">    
          <span class="styIRS8621DotLn">      
            ............                          
          </span>            
          <div class="styIRS8621LNRightNumBox">4b</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/TotTaxWithoutProRataLessCash"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey"></div>  
          <div class="styIRS8621LNAmountBoxNBB"></div>  
        </div>    
      </div>
              
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">c</div>
        <div style="float:left">
          Subtract line 4b from line 4a. <b>This is the deferred tax, the time for payment of which is</b>
        </div>      
        <div style="float:right">                          
          <div class="styIRS8621LNRightNumBoxNBB"></div>  
          <div class="styIRS8621LNAmountBoxNBB"></div>  
        </div>    
      </div>    
      
      <div class="styIRS8621Item" style="border-bottom:2 solid black">
        <div class="styIRS8621Part2"></div>
        <div style="float:left">
          <b>extended by making Election D. See instructions</b>
        </div>      
        <div style="float:right">    
          <span class="styIRS8621DotLn">      
            ...............                                                                                    
          </span>                    
          <div class="styIRS8621LNRightNumBoxNBB">4c</div>  
          <div class="styIRS8621LNAmountBoxNBB">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DeferredTax"/></xsl:call-template>
          </div>  
        </div>    
      </div>      
    <!-- END Part II Line Items -->    
    
    <div style="width:187mm; font-size:7pt; page-break-after:always">    
      <div style="float:left; font-size:8pt">
        <b>For Paperwork Reduction Act Notice, see separate instructions.</b>
      </div>    
      <div style="float:right">
        Cat. No. 64174H
        <span style="width:15mm"></span>
        Form <b style="font-size:10pt">8621</b> (Rev. 12-2011)
      </div>      
    </div>    
    
    <div style="width:187mm; font-size:7pt">    
      <div style="float:left; font-size:8pt">
        Form 8621 (Rev. 12-2011)
      </div>    
      <div style="float:right">        
        Page <b style="font-size:9pt">2</b>
      </div>      
    </div>    
      
    <!-- BEGIN Part III Title -->  
      <div class="styIRS8621BB" style="height:4mm; border-top:2 solid black">
        <div class="styTitleName" style="width:13mm; font-size:10pt">Part III</div>
        <div class="styTitleDesc" style="font-size:10pt">Gain or (Loss) From Mark-to-Market Election <span class="styNormalText">(See page 5 of instructions.)</span></div>        
      </div>
    <!-- END Part III Title -->
      
    <!-- BEGIN Part III Line Items -->  
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3" style="padding-top:0.5mm">5a</div>
        <div style="float:left; padding-top:0.5mm">
          Enter the fair market value of your PFIC stock at the end of the tax year
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            .......                                  
          </span>                    
          <div class="styIRS8621LNRightNumBox" style="height:4.5mm">5a</div>  
          <div class="styIRS8621LNAmountBox" style="height:4.5mm">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/FairMarketValueOfPFICStock"/></xsl:call-template>
          </div>  
        </div>      
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3">b</div>
        <div style="float:left">
          Enter your adjusted basis in the stock at the end of the tax year
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            ..........                        
          </span>                  
          <div class="styIRS8621LNRightNumBox">5b</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/AdjustedBasisInStockEndOfTY"/></xsl:call-template>
          </div>  
        </div>      
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3">c</div>
        <div style="float:left">
          Subtract line 5b from line 5a. If a gain, do not complete lines 6 and 7. Include this amount as 
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"></div>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"></div>  
        </div>      
      </div>  
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3"></div>
        <div style="float:left">
          ordinary income on your tax return. If a loss, go to line 6
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            ..............                          
          </span>                    
          <div class="styIRS8621LNRightNumBox">5c</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/Excess"/></xsl:call-template>
          </div>  
        </div>      
      </div>    
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3">6</div>
        <div style="float:left">
          Enter any unreversed inclusions (as defined in section 1296(d)). 
        </div>  
        <div style="float:right">  
          <span class="styIRS8621DotLn">      
            ..........                                                
          </span>                
          <div class="styIRS8621LNRightNumBox">6</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/UnreversedInclusions"/></xsl:call-template>
          </div>  
        </div>          
      </div>  
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3">7</div>
        <div style="float:left">
          Enter the loss from line 5c, but only to the extent of the unreversed inclusions on line 6. Include
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"></div>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"></div>  
        </div>      
      </div>  
            
      
     <div class="styIRS8621Item">
        <div class="styIRS8621Part3"></div>
        <div style="float:left">
          this amount as an ordinary loss on your tax return 
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            ...............                          
          </span>                    
          <div class="styIRS8621LNRightNumBox">7</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ExcessOrUnreservedInclusions"/></xsl:call-template>
          </div>  
        </div>      
      </div>          
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3">8</div>
        <div style="float:left">
        <b>  If you sold or otherwise disposed of any section 1296 stock (see instructions) during </b>
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"></div>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"></div>  
        </div>      
      </div>  
            
     <div class="styIRS8621Item">
        <div class="styIRS8621Part3"></div>
        <div style="float:left">
        <b>  the tax year:</b>
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"></div>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"></div>  
        </div>      
      </div>        
      
     <div class="styIRS8621Item">
        <div class="styIRS8621Part3">a</div>
        <div style="float:left">
          Enter the fair market value of the stock on the date of sale or disposition 
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
           ......                          
          </span>                    
          <div class="styIRS8621LNRightNumBox">8a</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/FMVStkOnDtSaleOrDisposAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>          

      <div class="styIRS8621Item">
        <div class="styIRS8621Part3">b</div>
        <div style="float:left">
          Enter the adjusted basis of the stock on the date of sale or dispostion.
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            ........                        
          </span>                  
          <div class="styIRS8621LNRightNumBox">8b</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/AdjBasisStkOnDtSaleOrDisposAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>

<div class="styIRS8621Item">
        <div class="styIRS8621Part3">c</div>
        <div style="float:left">
          Subtract line 8b from line 8a. If a gain, do not complete line 9. Include this amount as 
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"></div>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"></div>  
        </div>      
      </div>  
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3"></div>
        <div style="float:left">
          ordinary income on your tax return. If a loss, go to line 9
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            ..............                          
          </span>                    
          <div class="styIRS8621LNRightNumBox">8c</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/OrdinaryIncomeFromPFICStkAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>         
     
       <div class="styIRS8621Item">
        <div class="styIRS8621Part3" style="padding-top:0.5mm">9a</div>
        <div style="float:left; padding-top:0.5mm">
          Enter any unreversed inclusions (as defined in section 1296(d))
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            ..........                                  
          </span>                    
          <div class="styIRS8621LNRightNumBox" style="height:4.5mm">9a</div>  
          <div class="styIRS8621LNAmountBox" style="height:4.5mm">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/LossLimitedByOrdinaryIncomeAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>

     
     <div class="styIRS8621Item">
        <div class="styIRS8621Part3">b</div>
        <div style="float:left">
          Enter the loss from line 8c, but only to the extent of unreversed inclusions on line 9a. Include 
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"></div>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"></div>  
        </div>      
      </div>  
<div class="styIRS8621Item">
<div class="styIRS8621Part3"></div>
        <div style="float:left">
          this amount as an ordinary loss on your tax return. If the loss on line 8c exceeds unreversed 
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"></div>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"></div>  
        </div>      
      </div>        
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3"></div>
        <div style="float:left">
          inclusions on line 9a, complete line 9c
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            ....................                          
          </span>                    
          <div class="styIRS8621LNRightNumBox">9b</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/LossLimitedByOrdinaryIncomeAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>         

     <div class="styIRS8621Item">
        <div class="styIRS8621Part3">c</div>
        <div style="float:left">
          Enter the amount by which the loss on line 8c exceeds unreversed inclusions on line 9a.  
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"></div>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"></div>  
        </div>      
      </div>  
<div class="styIRS8621Item">
<div class="styIRS8621Part3"></div>
        <div style="float:left">
          Include this amount on your tax return according to the rules generally applicable for losses 
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"></div>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"></div>  
        </div>      
      </div>        
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3"></div>
        <div style="float:left">
          provided elsewhere in the Code and regulations
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            .................                          
          </span>                    
          <div class="styIRS8621LNRightNumBox">9c</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/LossExcessOfUnrvrsdInclsnAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>         


      <div class="styIRS8621Item">
        <div class="styIRS8621Part3"></div>
        <div style="float:left"></div>      
        <div style="float:right">            

        </div>      
      </div>
     
      <div class="styIRS8621Item" style="border-bottom:1 solid black">
        <div class="styIRS8621Part3"><b>Note:</b></div>
        <div style="float:left">
          See instructions in case of multiple dispositions.
        </div>      
        <div style="float:right">            

        </div>      
      </div>

    <!-- END Part III Line Items -->  

    
    <!-- BEGIN Part IV Title -->  
      
      <xsl:variable name="part4Count" select="count($Form8621Data/DistriAndDispositionOfStock)"/>
      <xsl:variable name="containerHeight" select="1" />  
      
      <div class="styIRS8621BB" style="height:8mm; border-top:1 solid black">
        <div class="styTitleName" style="width:13mm; font-size:10pt">Part IV</div>
        <div class="styTitleDesc" style="font-size:10pt">
          Distributions From and Dispositions of Stock of a Section 1291 Fund <span class="styNormalText">(See instructions.)<br/><i>Complete a  <b>separate</b> </i>&nbsp; <i>Part IV for each excess distribution (see instructions).</i></span>          
        </div>          
        <div style="float:right; vertical-align:bottom; padding-top:5mm">                      
          <!-- button display logic -->          
          <xsl:call-template name="SetTableToggleButton">
              <xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDispositionOfStock" />
              <xsl:with-param name="containerHeight" select="$containerHeight" />
              <xsl:with-param name="containerID" select="'part4TPctn'" />
          </xsl:call-template>               
           <!-- end button display logic -->                    
        </div>                
      </div>        
    <!-- END Part IV Title -->
    
    <!-- BEGIN Part IV Line Items -->        
      <div class="styIRS8621TableContainer" id="part4TPctn">    
        <xsl:attribute name="style">  
          <xsl:if test="$part4Count &gt; $containerHeight">
            height:109.8mm;  
          </xsl:if>
        </xsl:attribute>                           
        <!-- print logic -->
        <xsl:call-template name="SetInitialState"/>
        <!-- end -->  
        <table class="styIRS8621Table" cellspacing="0" cellpadding="0" border="0" style="font-size:9pt">
          <!-- Display all rows when the Print parameter is not Separated. If the Print parameter is Separated, but -->
          <!-- there is only one Part IV, then also display all rows -->
          <xsl:if test="($Print != $Separated) or (count($Form8621Data/DistriAndDispositionOfStock) = 1)">                                
            <xsl:call-template name="part4Tamplate">                          
              <xsl:with-param name="max">
                <xsl:choose>
                  <xsl:when test="$part4Count &gt; $containerHeight">     
                    <xsl:value-of select="$part4Count" />
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$containerHeight" />
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <!-- When the Print parameter is Separated and there is more than one Part IV, then display a blank section -->
          <!-- and direct the user to the addtional data table -->
          <xsl:if test="($Print = $Separated) and (count($Form8621Data/DistriAndDispositionOfStock) &gt; 1)">
            <xsl:call-template name="part4Tamplate">
              <xsl:with-param name="index" select="0" />                        
              <xsl:with-param name="max" select="0" />
            </xsl:call-template>
          </xsl:if>  
        </table>
      </div>  
          
    <!-- END Part IV Line Items -->  

    <div style="width:187mm; font-size:7pt; page-break-after:always">    
      <div style="float:left; font-size:8pt">
        <b>For Paperwork Reduction Act Notice, see separate instructions.</b>
      </div>    
      <div style="float:right">
        Cat. No. 64174H
        <span style="width:15mm"></span>
        Form <b style="font-size:10pt">8621</b> (Rev. 12-2011)
      </div>      
    </div>    
    
    <div style="width:187mm; font-size:7pt">    
      <div style="float:left; font-size:8pt">
        Form 8621 (Rev. 12-2011)
      </div>    
      <div style="float:right">        
        Page <b style="font-size:9pt">3</b>
      </div>      
    </div>    
    
    <!-- BEGIN Part V Title -->  
    <!--  <div class="styIRS8621BB" style="height:4mm; border-top:2 solid black">-->
      <div class="styIRS8621BB" style="height:8mm; border-top:1 solid black; width:187mm">
        <div class="styTitleName" style="width:12mm; font-size:10pt">Part V</div>
        <div class="styTitleDesc" style="font-size:10pt">Status of Prior Year Section 1294 Elections and Termination of Section 1294 Elections<br/><span class="styNormalText" style="font-style: italic;">Complete a separate column for each outstanding election. Complete lines 9 and 10 only if there is a<br/>partial termination of the section 1294 election.</span></div>        
      </div>
    <!-- END Part V Title -->
    
    <!-- BEGIN Part V Line Items -->
    <!-- Display all repeating elements when the Print parameter is not Separated. If the Print parameter is Separated, but -->
    <!-- there are fewer Part V repeating elements than the container height, then also display all elements -->
    <xsl:if test="($Print != $Separated) or (count($Form8621Data/ElectionStatus) &lt;= 6)">
      <xsl:variable name="ESCount" select="count($Form8621Data/ElectionStatus)" />
      <xsl:variable name="preMax">
        <xsl:choose>
             <xsl:when test="$ESCount mod 6 = 0">     
            <xsl:value-of select="$ESCount div 6" />
             </xsl:when>
             <xsl:otherwise>
                <xsl:value-of select="ceiling($ESCount div 6)" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      
      <xsl:call-template name="part5Loop">
        <xsl:with-param name="ESCount" select="$ESCount" />        
        <xsl:with-param name="max">
          <xsl:choose>
               <xsl:when test="$preMax = 0">     
              <xsl:value-of select="1" />
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="$preMax" />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="($Print = $Separated) and (count($Form8621Data/ElectionStatus) &gt; 6)">
      <xsl:call-template name="part5Loop">
        <xsl:with-param name="index" select="0" />                        
        <xsl:with-param name="max" select="0" />
      </xsl:call-template>
    </xsl:if>
    <!-- END Part V Line Items -->  
    
    <div style="width:187mm; font-size:7pt">            
        <div style="float:right">          
          Form <b style="font-size:10pt">8621</b> (Rev. 12-2011)
        </div>      
      </div>            
    
      <p style="page-break-before:always" />    
      
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
          <xsl:with-param name="TargetNode" select="$Form8621Data" />        
        </xsl:call-template>
      </table>
      
      <!-- Additional Data Table for Separated Data from Part IV -->
      <xsl:if test="($Print = $Separated) and (count($Form8621Data/DistriAndDispositionOfStock) &gt; 1)">
        <span class="styRepeatingDataTitle">
          <br />Form 8621, Part IV - Distributions From and Dispositions of Stock of a Section 1291 Fund:
        </span>
        <xsl:for-each select="$Form8621Data/DistriAndDispositionOfStock">
          <table class="styDepTbl" style="font-size:7pt">
            <thead class="styTableHead">
              <tr class="styDepTblHdr">
                <th class="styDepTblCell">&nbsp;</th>
                <th class="styDepTblCell">&nbsp;</th>
                <th class="styDepTblCell">&nbsp;</th>
                <th class="styDepTblCell">&nbsp;</th>
              </tr>
            </thead>
            <tfoot></tfoot>
            <tbody>
              <!-- Line 10a -->
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">10a</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
	                Enter your total distributions from the section 1291 fund during the current tax year with respect <br/>to the
	              applicable stock. If the holding period of the stock began in the current tax year, see 
	              <div style="float:left">instructions</div>
	              <div style="float:right"><span class="styIRS8621DotLn">..............................</span></div>                 
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">10a</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TotalPFICDistriDuringCurrentTY"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 10b -->
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">b</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  Enter the total distributions (reduced by the portions of such distributions that were excess<br/>
                  distributions but not included in income under section 1291(a)(1)(B)) made by the fund with<br/>
                  respect to the applicable stock for each of the 3 years preceding the current tax year (or if 
                  <div style="float:left">shorter, the portion of the shareholder's holding period before the current tax year)</div>
                  <div style="float:right"><span class="styIRS8621DotLn">.....</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">10b</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="DistributionsIn3PrecedingTY"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 10c -->
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">c</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  <div style="float:left">Divide line 10b by 3. (See instructions if the number of preceding tax years is less than 3.)</div>
                  <div style="float:right"><span class="styIRS8621DotLn">..</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">10c</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AvgDistribution3PrecedingTY"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 10d -->
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">d</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                	<div style="float:left">Multiply line 10c by 125% (1.25)</div>
                  	<div style="float:right;"><span class="styIRS8621DotLn">......................</span></div>                  
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">10d</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AverageDistri3PreviousTY125Pct"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 10e -->
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">e</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  	Subtract line 10d from line 10a. This amount, if more than zero, is the excess distribution with <br/>respect to zero or less and you did not 			dispose of stock during the tax year, <b>do not</b> complete <br/>the rest of Part  IV. See instructions if you received more than one distribution 			during the current 
		        <div style="float:left;">
		         tax year
		        </div>
		        <div style="float:right">
		          <span class="styIRS8621DotLn">      
		            ..............................                                                          
		          </span>
		        </div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">10e</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TotalExcessDistribution"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 10f -->
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">f</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  Enter gain or loss from the disposition of stock of a section 1291 fund or former section 1291
                  <div style="float:left">fund. If a gain, complete line 11. If a loss, show it in brackets and <b>do not</b> complete line 11</div>
                  <div style="float:right"><span class="styIRS8621DotLn">.</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">10f</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="GainLossFromDispositionOfStock"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 11a -->
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">11a</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  Attach a statement for each distribution and disposition. Show your holding period for each<br/>
                  share of stock or block of shares held. Allocate the excess distribution to each day in your<br/>
                  holding period. Add all amounts that are allocated to days in each tax year.
                </td>                
                <td class="styDepTblCell" style="width:5mm;background-color:lightgrey;border-bottom:0"></td>  
                <td class="styDepTblCell" style="width:34mm;background-color:lightgrey;border-bottom:0"></td>
              </tr>
              <!-- Line 11b -->
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold;border-bottom:0;padding-bottom:0">b</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;border-bottom:0;padding-bottom:0">
                  Enter the total of the amounts determined in line 11a that are allocable to the current tax year<br/>
                  and tax years before the foreign corporation became a PFIC (pre-PFIC tax years). Enter these
                </td>                
                <td class="styDepTblCell" style="width:5mm;background-color:lightgrey;border-top:0;padding-bottom:0"></td>  
                <td class="styDepTblCell" style="width:34mm;background-color:lightgrey;border-top:0;padding-bottom:0"></td>
              </tr>
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold;border-top:0;padding-top:0"></td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;border-top:0;padding-top:0">
                  <div style="float:left">amounts on your income tax return as other income</div>
                  <div style="float:right"><span class="styIRS8621DotLn">..............</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold;padding-top:0">11b</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom;padding-top:0">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TotAllocatableCurrAndPrePFICTY"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 11c -->
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">c</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  Enter the aggregate increases in tax (before credits) for each tax year in your holding period
                  <div style="float:left">(other than the current tax year and pre-PFIC years). (See instructions.)</div>
                  <div style="float:right"><span class="styIRS8621DotLn">........</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">11c</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AggregateIncreaseInTaxEachTY"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 11d -->
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">d</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  <div style="float:left">Foreign tax credit. (See instructions.)</div>
                  <div style="float:right"><span class="styIRS8621DotLn">...................</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">11d</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="ForeignTaxCredit"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 11e -->
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">e</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  Subtract line 11d from line 11c. Enter this amount on your income tax return as "additional
                  <div style="float:left">tax." (See instructions.)</div>
                  <div style="float:right"><span class="styIRS8621DotLn">........................</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">11e</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AggregateIncrLessForeignTaxCr"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 11f -->
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">f</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  Determine interest on each net increase in tax determined on line 11e using the rates and
                  <div style="float:left">methods of section 6621. Enter the aggregate amount of interest here. (See instructions.)</div>
                  <div style="float:right"><span class="styIRS8621DotLn">..</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">11f</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="InterestOnEachNetIncreaseInTax"/>
                  </xsl:call-template>
                </td>
              </tr>
            </tbody>
          </table><br/>
        </xsl:for-each>
      </xsl:if>
      <!-- End of Part IV Separated Data -->
      
      <!-- Additional Data Table for Separated Data from Part V -->
      <xsl:if test="($Print = $Separated) and (count($Form8621Data/ElectionStatus) &gt; 6)">
        <span class="styRepeatingDataTitle">
          <br />Form 8621, Part V - Status of Prior Year Section 1294 Elections and Termination of Section 1294 Elections:
        </span>
        <xsl:for-each select="$Form8621Data/ElectionStatus">
          <xsl:variable name="pos" select="position()"/>
          <xsl:if test="$pos mod 6 = 1">
            <table class="styDepTbl" style="font-size:7pt">
              <thead class="styTableThead">
                <!-- Header row -->
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" style="border-right:0"></th>
                  <th class="styDepTblCell" style="border-left:0"></th>
                  <th class="styDepTblCell">
                    <xsl:number value="$pos" format="i"/>
                  </th>
                  <th class="styDepTblCell">
                    <xsl:if test="($pos + 1) &lt;= count($Form8621Data/ElectionStatus)">
                      <xsl:number value="$pos + 1" format="i"/>
                    </xsl:if>
                  </th>
                  <th class="styDepTblCell">
                    <xsl:if test="($pos + 2) &lt;= count($Form8621Data/ElectionStatus)">
                      <xsl:number value="$pos + 2" format="i"/>
                    </xsl:if>
                  </th>
                  <th class="styDepTblCell">
                    <xsl:if test="($pos + 3) &lt;= count($Form8621Data/ElectionStatus)">
                      <xsl:number value="$pos + 3" format="i"/>
                    </xsl:if>
                  </th>
                  <th class="styDepTblCell">
                    <xsl:if test="($pos + 4) &lt;= count($Form8621Data/ElectionStatus)">
                      <xsl:number value="$pos + 4" format="i"/>
                    </xsl:if>
                  </th>
                  <th class="styDepTblCell">
                    <xsl:if test="($pos + 5) &lt;= count($Form8621Data/ElectionStatus)">
                      <xsl:number value="$pos + 5" format="i"/>
                    </xsl:if>
                  </th>
                </tr>
              </thead>
              <tfoot></tfoot>
              <tbody>
                <!-- Line 1 -->
                <tr class="styDepTblRow1">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">1</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Tax year of outstanding election
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:center">
                    <span class="styIRS8621DotBB" style="margin-bottom:2.5mm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/TaxYearOfOutstandingElection"/>
                      </xsl:call-template>          
                    </span>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:center">
                    <span class="styIRS8621DotBB" style="margin-bottom:2.5mm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/TaxYearOfOutstandingElection"/>
                      </xsl:call-template>          
                    </span>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:center">
                    <span class="styIRS8621DotBB" style="margin-bottom:2.5mm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/TaxYearOfOutstandingElection"/>
                      </xsl:call-template>          
                    </span>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:center">
                    <span class="styIRS8621DotBB" style="margin-bottom:2.5mm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/TaxYearOfOutstandingElection"/>
                      </xsl:call-template>          
                    </span>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:center">
                    <span class="styIRS8621DotBB" style="margin-bottom:2.5mm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/TaxYearOfOutstandingElection"/>
                      </xsl:call-template>          
                    </span>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:center">
                    <span class="styIRS8621DotBB" style="margin-bottom:2.5mm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/TaxYearOfOutstandingElection"/>
                      </xsl:call-template>          
                    </span>
                  </td>
                </tr>
                <!-- Line 2 -->
                <tr class="styDepTblRow2">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">2</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Undistributed earnings to which the election relates
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/UndistributedEarnings"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/UndistributedEarnings"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/UndistributedEarnings"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/UndistributedEarnings"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/UndistributedEarnings"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/UndistributedEarnings"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 3 -->
                <tr class="styDepTblRow1">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;vertical-align:bottom;font-weight:bold;border-right:0">3</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    <br/><div style="float:left">Deferred tax</div>
                    <div style="float:right"><span class="styIRS8621DotLn">....</span></div>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/DeferredTax"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/DeferredTax"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/DeferredTax"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/DeferredTax"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/DeferredTax"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/DeferredTax"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 4 -->
                <tr class="styDepTblRow2">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">4</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Interest accrued on deferred tax (line 3) as of the filing date
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/InterestAccruedOnDeferredTax"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/InterestAccruedOnDeferredTax"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/InterestAccruedOnDeferredTax"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/InterestAccruedOnDeferredTax"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/InterestAccruedOnDeferredTax"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/InterestAccruedOnDeferredTax"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 5 -->
                <tr class="styDepTblRow1">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">5</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Event terminating election
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/EventTerminatingElection"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/EventTerminatingElection"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/EventTerminatingElection"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/EventTerminatingElection"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/EventTerminatingElection"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/EventTerminatingElection"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 6 -->
                <tr class="styDepTblRow2">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">6</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Earnings distributed or deemed distributed during the tax year
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/EarningsDistributedDuringTheTY"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/EarningsDistributedDuringTheTY"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/EarningsDistributedDuringTheTY"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/EarningsDistributedDuringTheTY"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/EarningsDistributedDuringTheTY"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/EarningsDistributedDuringTheTY"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 7 -->
                <tr class="styDepTblRow1">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">7</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;;border-left:0">
                    Deferred tax due with
                    <div style="float:left">this return</div>
                    <div style="float:right"><span class="styIRS8621DotLn">.....</span></div>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/DeferredTaxDueWithThisReturn"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/DeferredTaxDueWithThisReturn"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/DeferredTaxDueWithThisReturn"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/DeferredTaxDueWithThisReturn"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/DeferredTaxDueWithThisReturn"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/DeferredTaxDueWithThisReturn"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 8 -->
                <tr class="styDepTblRow2">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">8</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Accrued interest due
                    <div style="float:left">with this return</div>
                    <div style="float:right"><span class="styIRS8621DotLn">...</span></div>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/AccruedInterestDueThisReturn"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/AccruedInterestDueThisReturn"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/AccruedInterestDueThisReturn"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/AccruedInterestDueThisReturn"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/AccruedInterestDueThisReturn"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/AccruedInterestDueThisReturn"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 9 -->
                <tr class="styDepTblRow1">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">9</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Deferred tax outstanding after partial termination of election
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/DeferredTaxAfterPartialTerm"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/DeferredTaxAfterPartialTerm"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/DeferredTaxAfterPartialTerm"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/DeferredTaxAfterPartialTerm"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/DeferredTaxAfterPartialTerm"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/DeferredTaxAfterPartialTerm"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 10 -->
                <tr class="styDepTblRow2">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">10</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Interest accrued after partial termination
                    <div style="float:left">of election</div>
                    <div style="float:right"><span class="styIRS8621DotLn">....</span></div>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/IntAccruedAfterPartialTerm"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/IntAccruedAfterPartialTerm"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/IntAccruedAfterPartialTerm"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/IntAccruedAfterPartialTerm"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/IntAccruedAfterPartialTerm"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/IntAccruedAfterPartialTerm"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table><br/>
          </xsl:if>
        </xsl:for-each>
      </xsl:if>
      <!-- End of Part V Separated Data -->
      
    </form>  
  </body>
</html>
</xsl:template>

<xsl:template name="part4Tamplate">
  <xsl:param name="index" select="1"/>  
  <xsl:param name="max" />  
  <xsl:if test="$index &lt;= $max">    
    <tr>
      <td class="styIRS8621Part2" valign="top" style="padding-top:1mm">
        10a
      </td>
      <td style="width:138mm; padding-top:1mm" valign="top">
     		 Enter your total distributions from the section 1291 fund during the current tax year with respect <br/>to the
              applicable stock. If the holding period of the stock began in the current tax year, see 
              <div style="float:left">instructions</div>
              <div style="float:right"><span class="styIRS8621DotLn">............................</span></div>       
      </td>                
      <td class="styIRS8621LNRightNumBox" valign="bottom" >
        10a
      </td>  
      <td class="styIRS8621TblLB" valign="bottom" style="width:31mm;">
        <xsl:if test="($Print = $Separated) and (count($Form8621Data/DistriAndDispositionOfStock) &gt; 1)">
          <span style="float:left">
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
            <xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDispositionOfStock" />
            <xsl:with-param name="ShortMessage" select="'true'" />
          </xsl:call-template>
          </span>
        </xsl:if>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDispositionOfStock[$index]/TotalPFICDistriDuringCurrentTY"/>
        </xsl:call-template>
      </td>  
    </tr>  
    
    <tr>
      <td class="styIRS8621Part2" valign="top">b</td>     
      
      <td valign="top">
     		 Enter the total distributions (reduced by the portions of such distributions that were excess<br/>
              distributions but not included in income under section 1291(a)(1)(B)) made by the fund with<br/>
              respect to the applicable stock for each of the 3 years preceding the current tax year (or if 
              <div style="float:left">shorter, the portion of the shareholder's holding period before the current tax year)</div>
              <div style="float:right"><span class="styIRS8621DotLn">.....</span></div>         
      </td>                
      <td class="styIRS8621LNRightNumBox" valign="bottom">
        10b
      </td>  
      <td class="styIRS8621TblLB" valign="bottom">
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDispositionOfStock[$index]/DistributionsIn3PrecedingTY"/></xsl:call-template>
      </td>  
    </tr>  
    
    <tr>
      <td class="styIRS8621Part2" valign="top">c</td>
      <td valign="top">
        <div style="float:left">
          Divide line 10b by 3. (See instructions if the number of preceding tax years is less than 3.)
        </div>      
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            .                                        
          </span>
        </div>        
      </td>                
      <td class="styIRS8621LNRightNumBox">
        10c
      </td>  
      <td class="styIRS8621TblLB" valign="bottom">
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDispositionOfStock[$index]/AvgDistribution3PrecedingTY"/></xsl:call-template>
      </td>  
    </tr>
    
    <tr>              
      <td class="styIRS8621Part2" valign="top">d</td>
      <td valign="top">
       	<div style="float:left;font-family:'Arial Narrow'; font-size:10pt">Multiply line 10c by 125% (1.25)</div>
             <div style="float:right;"><span class="styIRS8621DotLn">........................</span></div>
      </td>                      
      <td class="styIRS8621LNRightNumBox">
        10d
      </td>  
      <td class="styIRS8621TblLB" >
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDispositionOfStock[$index]/AverageDistri3PreviousTY125Pct"/></xsl:call-template>
      </td>                
    </tr>
        
    <tr>
      <td class="styIRS8621Part2" valign="top">e</td>
      <td valign="top">  		
      
        Subtract line 10d from line 10a. This amount, if more than zero, is the excess distribution with <br/>respect to the applicable stock. If zero or less and you did not dispose of stock during the tax <br/>year, <b>do not</b> complete the rest of Part  IV. See instructions if you received more than one <br/>distribution during the current tax year. Also, see instructions for rules for reporting a nonexcess
        <div style="float:left;">
       	 distribution on your income tax return
        </div>
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            .....................                                                          
          </span>
        </div>
      </td>                
      <td class="styIRS8621LNRightNumBox">
        10e
      </td>  
      <td class="styIRS8621TblLB" valign="bottom">
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDispositionOfStock[$index]/TotalExcessDistribution"/></xsl:call-template>
      </td>  
    </tr>      
    
    <tr>
      <td class="styIRS8621Part2" valign="top">f</td>
      <td valign="top">
        Enter gain or loss from the disposition of stock of a section 1291 fund or former section 1291
        <div style="float:left">
          fund. If a gain, complete line 11. If a loss, show it in brackets and <b>do not</b> complete line 11                                            
        </div>
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            .                                                                                            
          </span>
        </div>
      </td>                
      <td class="styIRS8621LNRightNumBox">
        10f
      </td>  
      <td class="styIRS8621TblLB" valign="bottom">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDispositionOfStock[$index]/GainLossFromDispositionOfStock"/>
        </xsl:call-template>
      </td>  
    </tr>  
    
    <tr>
      <td class="styIRS8621Part2" valign="top">11a</td>
      <td valign="top">
        Attach a statement for each distribution and disposition. Show your holding period for each<br/>share of stock or block of shares held. Allocate the excess distribution to each day in your<br/>holding period. Add all amounts that are allocated to days in each tax year.      
      </td>                
      <td class="styIRS8621LNRightNumBoxNBB" style="height:12mm; background-color:lightgrey">&nbsp;</td>  
      <td class="styIRS8621TblLB" style="border-bottom:0; height:12mm; background-color:lightgrey">&nbsp;</td>  
    </tr>  
    
    <tr>
      <td class="styIRS8621Part2" valign="top">b</td>
      <td valign="top">
        Enter the total of the amounts determined in line 11a that are allocable to the current tax year<br/>and tax years before the foreign corporation became a PFIC (pre-PFIC tax years). Enter these</td>
      <td class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey">&nbsp;</td>  
      <td class="styIRS8621TblLB" style="border-bottom:0; background-color:lightgrey">&nbsp;</td>                                
    </tr>    
    
    <tr>
      <td class="styIRS8621Part2"></td>
      <td valign="top">
        <div style="float:left">
          amounts on your income tax return as other income    
        </div>    
        <div style="float:right">          
          <span class="styIRS8621DotLn">      
            ..............                                      
          </span>
        </div>    
      </td>                            
      <td class="styIRS8621LNRightNumBox" valign="bottom">
        11b
      </td>  
      <td class="styIRS8621TblLB">
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDispositionOfStock[$index]/TotAllocatableCurrAndPrePFICTY"/></xsl:call-template>
      </td>  
    </tr>
    
    <tr>
      <td class="styIRS8621Part2" valign="top">c</td>
      <td valign="top">
        Enter the aggregate increases in tax (before credits) for each tax year in your holding period
        <div style="float:left">
          (other than the current tax year and pre-PFIC years). (See instructions.)                  
        </div>
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            ........                                                                            
          </span>
        </div>
      </td>                
      <td class="styIRS8621LNRightNumBox">
        11c
      </td>  
      <td class="styIRS8621TblLB" valign="bottom">
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDispositionOfStock[$index]/AggregateIncreaseInTaxEachTY"/></xsl:call-template>
      </td>  
    </tr>  
    
    <tr>
      <td class="styIRS8621Part2" valign="top">d</td>
      <td valign="top">
        <div style="float:left">
          Foreign tax credit. (See instructions.)                  
        </div>
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            ...................                                                                      
          </span>
        </div>
      </td>                
      <td class="styIRS8621LNRightNumBox">
        11d
      </td>  
      <td class="styIRS8621TblLB">
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDispositionOfStock[$index]/ForeignTaxCredit"/></xsl:call-template>
      </td>  
    </tr>      
    
    <tr>
      <td class="styIRS8621Part2" valign="top">e</td>
      <td valign="top">
        Subtract line 11d from line 11c. Enter this amount on your income tax return as "additional
        <div style="float:left">
          tax." (See instructions.)    
        </div>      
        <div style="float:right">        
          <span class="styIRS8621DotLn">      
            ........................                                                                        
          </span>
        </div>
      </td>                
      <td class="styIRS8621LNRightNumBox">
        11e
      </td>  
      <td class="styIRS8621TblLB" valign="bottom">
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDispositionOfStock[$index]/AggregateIncrLessForeignTaxCr"/></xsl:call-template>
      </td>  
    </tr>      
    
    <tr>
      <td class="styIRS8621Part2" valign="top" style="border-bottom:1 solid black">f</td>
      <td style="border-bottom:1 solid black" valign="top">
        Determine interest on each net increase in tax determined on line 11e using the rates and        
        <div style="float:left">
          methods of section 6621. Enter the aggregate amount of interest here. (See instructions.)                  
        </div>
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            ..                                                                                  
          </span>
        </div>
      </td>                
      <td class="styIRS8621LNRightNumBox">        
        11f
      </td>  
      <td class="styIRS8621TblLB" valign="bottom">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDispositionOfStock[$index]/InterestOnEachNetIncreaseInTax"/>
        </xsl:call-template>
      </td>  
    </tr>                        
    <xsl:call-template name="part4Tamplate">      
      <xsl:with-param name="index" select="$index + 1"/>
      <xsl:with-param name="max" select="$max"/>
    </xsl:call-template>  
  </xsl:if>    
</xsl:template>

<xsl:template name="part5Loop">
  <xsl:param name="ESCount" />  
  <xsl:param name="index" select="1"/>
  <xsl:param name="max" />  
    
  <xsl:if test="$index &lt;= $max">    
    <table style="clear:both; width:187mm; font-size:7pt; border-top:1 solid black; border-bottom:2 solid black" cellpadding="0" cellspacing="0">
      <thead class="styTableThead">
        <tr style="font-size:8pt">
          <th></th><th></th>
          <th class="styIRS8621P5Th" scope="col">
            <xsl:choose>
              <xsl:when test="($Form8621Data/ElectionStatus[$index*6-5]) or ($index*6-5 = 1)">
                (<xsl:number value="$index*6-5" format="i" />)              
              </xsl:when> 
              <xsl:otherwise>
                  &nbsp;
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$index=0 and $max=0">
              <xsl:number value="1" format="i" />
            </xsl:if>
          </th>
          <th class="styIRS8621P5Th" scope="col">
            <xsl:choose>
              <xsl:when test="($Form8621Data/ElectionStatus[$index*6-4]) or ($index*6-4 = 2)">
                (<xsl:number value="$index*6-4" format="i" />)
              </xsl:when>   
              <xsl:otherwise>
                  &nbsp;
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$index=0 and $max=0">
              <xsl:number value="2" format="i" />
            </xsl:if>
          </th>
          <th class="styIRS8621P5Th" scope="col">
            <xsl:choose>  
              <xsl:when test="($Form8621Data/ElectionStatus[$index*6-3]) or ($index*6-3 = 3)">
                (<xsl:number value="$index*6-3" format="i" />)
              </xsl:when>     
              <xsl:otherwise>
                  &nbsp;
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$index=0 and $max=0">
              <xsl:number value="3" format="i" />
            </xsl:if>
          </th>
          <th class="styIRS8621P5Th" scope="col">
            <xsl:choose>
              <xsl:when test="($Form8621Data/ElectionStatus[$index*6-2]) or ($index*6-2 = 4)">
                (<xsl:number value="$index*6-2" format="i" />)
              </xsl:when>   
              <xsl:otherwise>
                  &nbsp;
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$index=0 and $max=0">
              <xsl:number value="4" format="i" />
            </xsl:if>   
          </th>
          <th class="styIRS8621P5Th" scope="col">
            <xsl:choose>
              <xsl:when test="($Form8621Data/ElectionStatus[$index*6-1]) or ($index*6-1 = 5)">
                (<xsl:number value="$index*6-1" format="i" />)
              </xsl:when>     
              <xsl:otherwise>
                  &nbsp;
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$index=0 and $max=0">
              <xsl:number value="5" format="i" />
            </xsl:if>   
          </th>
          <th class="styIRS8621P5Th" scope="col">
            <xsl:choose>
              <xsl:when test="($Form8621Data/ElectionStatus[$index*6]) or ($index*6 = 6)">
                (<xsl:number value="$index*6" format="i" />)
              </xsl:when>   
              <xsl:otherwise>
                &nbsp;
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$index=0 and $max=0">
              <xsl:number value="6" format="i" />
            </xsl:if>
          </th>
        </tr>
      </thead>    
      <tfoot></tfoot>
      <tbody>    
        <tr style="font-size:8pt">
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt">1</th>
          <th style="text-align:left; vertical-align:top; font-weight:normal; font-size:9pt" scope="row" nowrap="nowrap">
            Tax year of outstanding<br/>election
          </th>
          <td class="styIRS8621P5Td" style="text-align:center">
            <span class="styIRS8621DotBB" style="margin-bottom:2.5mm">
              <xsl:choose>
                <xsl:when test="$index=0 and $max=0">
                  <xsl:call-template name="PopulateAdditionalDataTableMessage">
                    <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus" />
                    <xsl:with-param name="ShortMessage" select="'true'" />
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/TaxYearOfOutstandingElection"/>   
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </span>
          </td>
          <td class="styIRS8621P5Td" style="text-align:center">
            <span class="styIRS8621DotBB" style="margin-bottom:2.5mm">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/TaxYearOfOutstandingElection"/></xsl:call-template>
            </span>
          </td>
          <td class="styIRS8621P5Td" style="text-align:center">
            <span class="styIRS8621DotBB" style="margin-bottom:2.5mm">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/TaxYearOfOutstandingElection"/></xsl:call-template>
            </span>
          </td>
          <td class="styIRS8621P5Td" style="text-align:center">
            <span class="styIRS8621DotBB" style="margin-bottom:2.5mm">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/TaxYearOfOutstandingElection"/></xsl:call-template>
            </span>
          </td>
          <td class="styIRS8621P5Td" style="text-align:center">
            <span class="styIRS8621DotBB" style="margin-bottom:2.5mm">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/TaxYearOfOutstandingElection"/></xsl:call-template>
            </span>
          </td>
          <td class="styIRS8621P5Td" style="text-align:center">
            <span class="styIRS8621DotBB" style="margin-bottom:2.5mm">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/TaxYearOfOutstandingElection"/></xsl:call-template>
            </span>
          </td>
        </tr>
        <tr>
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt">2</th>
          <th style="text-align:left; vertical-align:top; font-weight:normal; font-size:9pt" scope="row" nowrap="nowrap">
            Undistributed earnings to<br/>which the election relates
          </th>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/UndistributedEarnings"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/UndistributedEarnings"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/UndistributedEarnings"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/UndistributedEarnings"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/UndistributedEarnings"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/UndistributedEarnings"/></xsl:call-template>&nbsp;
          </td>
        </tr>
        <tr>
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt"><br/>3</th>
          <th style="text-align:left; vertical-align:top; font-weight:normal; font-size:9pt" scope="row" nowrap="nowrap">
            <br/>
            <div style="float:left">
              Deferred tax
            </div>
            <div style="float:right">
              <span class="styIRS8621DotLn">      
                .....                                      
              </span>    
            </div>    
          </th>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/DeferredTax"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/DeferredTax"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/DeferredTax"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/DeferredTax"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/DeferredTax"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/DeferredTax"/></xsl:call-template>&nbsp;
          </td>
        </tr>
        <tr>
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt; padding-top:0.5mm">4</th>
          <th style="text-align:left; vertical-align:top; font-weight:normal; font-family:'Arial Narrow'; font-size:9.5pt" scope="row" nowrap="nowrap">
            Interest accrued on deferred<br/>tax (line 3) as of the filing date
          </th>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/InterestAccruedOnDeferredTax"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/InterestAccruedOnDeferredTax"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/InterestAccruedOnDeferredTax"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/InterestAccruedOnDeferredTax"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/InterestAccruedOnDeferredTax"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/InterestAccruedOnDeferredTax"/></xsl:call-template>&nbsp;
          </td>
        </tr>        
        <tr>
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt"><br/>5</th>
          <th style="text-align:left; vertical-align:top; font-weight:normal; font-size:9pt" scope="row" nowrap="nowrap">
            <br/>Event terminating election
          </th>
          <td class="styIRS8621P5Td" style="padding-left:0.5mm; text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/EventTerminatingElection"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" style="padding-left:0.5mm; text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/EventTerminatingElection"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" style="padding-left:0.5mm; text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/EventTerminatingElection"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" style="padding-left:0.5mm; text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/EventTerminatingElection"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" style="padding-left:0.5mm; text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/EventTerminatingElection"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" style="padding-left:0.5mm; text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/EventTerminatingElection"/></xsl:call-template>&nbsp;
          </td>
        </tr>
        <tr>
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt">6</th>
          <th style="text-align:left; vertical-align:top; font-weight:normal; font-family:'Arial Narrow'; font-size:9.5pt" scope="row" nowrap="nowrap">
            Earnings distributed or deemed<br/>distributed during the tax year
          </th>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/EarningsDistributedDuringTheTY"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/EarningsDistributedDuringTheTY"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/EarningsDistributedDuringTheTY"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/EarningsDistributedDuringTheTY"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/EarningsDistributedDuringTheTY"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/EarningsDistributedDuringTheTY"/></xsl:call-template>&nbsp;
          </td>
        </tr>
        <tr>
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt">7</th>
          <th style="text-align:left; vertical-align:top; font-weight:normal; font-size:9pt" scope="row" nowrap="nowrap">
            Deferred tax due with this
            <div style="float:left">
              return
            </div>
            <div style="float:right">
              <span class="styIRS8621DotLn">      
                .......                                    
              </span>        
            </div>
          </th>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/DeferredTaxDueWithThisReturn"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/DeferredTaxDueWithThisReturn"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/DeferredTaxDueWithThisReturn"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/DeferredTaxDueWithThisReturn"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/DeferredTaxDueWithThisReturn"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/DeferredTaxDueWithThisReturn"/></xsl:call-template>&nbsp;
          </td>
        </tr>
        <tr style="font-size:7pt">
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt">8</th>
          <th style="text-align:left; vertical-align:top; font-weight:normal; font-size:9pt" scope="row" nowrap="nowrap">
            Accrued interest due with
            <div style="float:left">
              this return
            </div>
            <div style="float:right">
              <span class="styIRS8621DotLn">      
                ......                                      
              </span>    
            </div>    
          </th>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/AccruedInterestDueThisReturn"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/AccruedInterestDueThisReturn"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/AccruedInterestDueThisReturn"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/AccruedInterestDueThisReturn"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/AccruedInterestDueThisReturn"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/AccruedInterestDueThisReturn"/></xsl:call-template>&nbsp;
          </td>
        </tr>        
        <tr>
          <th class="styIRS8621P5ItemNo" style="background-color:white; font-size:9pt" scope="row">9</th>
          <th style="text-align:left; vertical-align:top; font-weight:normal; font-family:'Arial Narrow'; font-size:9.5pt" scope="row" nowrap="nowrap">
            Deferred tax outstanding after<br/>partial termination of election
          </th>
          <td class="styIRS8621P5Td" style="border-top:7 solid Lightgrey" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/DeferredTaxAfterPartialTerm"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" style="border-top:7 solid Lightgrey" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/DeferredTaxAfterPartialTerm"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" style="border-top:7 solid Lightgrey" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/DeferredTaxAfterPartialTerm"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" style="border-top:7 solid Lightgrey" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/DeferredTaxAfterPartialTerm"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" style="border-top:7 solid Lightgrey" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/DeferredTaxAfterPartialTerm"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" style="border-top:7 solid Lightgrey" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/DeferredTaxAfterPartialTerm"/></xsl:call-template>&nbsp;
          </td>
        </tr> 
        <tr style="font-size:7pt">
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt">10</th>
          <th style="text-align:left; vertical-align:top; font-weight:normal; font-size:9pt" scope="row" nowrap="nowrap">
            <div style="font-family:'Arial Narrow'; font-size:9.5pt">Interest accrued after partial</div>
            <div style="float:left; font-family:'Arial Narrow'; font-size:10pt">
              termination of election
            </div>
            <div style="float:right">
              <span class="styIRS8621DotLn">      
                ..                                  
              </span>    
            </div>  
          </th>
          <td class="styIRS8621P5Td" style="border-bottom:0" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/IntAccruedAfterPartialTerm"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" style="border-bottom:0" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/IntAccruedAfterPartialTerm"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" style="border-bottom:0" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/IntAccruedAfterPartialTerm"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" style="border-bottom:0" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/IntAccruedAfterPartialTerm"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" style="border-bottom:0" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/IntAccruedAfterPartialTerm"/></xsl:call-template>&nbsp;
          </td>
          <td class="styIRS8621P5Td" style="border-bottom:0" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/IntAccruedAfterPartialTerm"/></xsl:call-template>&nbsp;
          </td>
        </tr>
      </tbody>      
    </table>      
    <xsl:call-template name="part5Loop">
      <xsl:with-param name="index" select="$index+1" />
      <xsl:with-param name="ESCount" select="$ESCount" />      
      <xsl:with-param name="max" select="$max" />
    </xsl:call-template>  
  </xsl:if>    
</xsl:template>

</xsl:stylesheet>