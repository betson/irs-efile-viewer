<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<!-- 05/01/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 06/24/2015 - Changes made for UWR 157287 - Jeremy Nichols -->
<!-- 12/08/2015 - Changes made per pdf review - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8621Style.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*"/>
<xsl:param name="Form8621Data" select="$RtnDoc/IRS8621"/>

<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
  <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form8621Data)"/></xsl:call-template></title>    
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private"/>    
    <meta name="Description" content="Form 8621"/>
    <meta name="GENERATOR" content="IBM WebSphere Studio"/>
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
    <xsl:call-template name="InitJS"/>
      
    <style type="text/css">      
<!--      <xsl:if test="not($Print) or $Print=''">
-->        <xsl:call-template name="IRS8621Style"/>  
			<xsl:call-template name="AddOnStyle"/>    
<!--      </xsl:if>
-->    </style>            
    <xsl:call-template name="GlobalStylesForm"/>
  </head>
  
  <body class="styBodyClass">    
    <form style="font-family:arial; font-size:9pt" name="Form8621">      
      <xsl:call-template name="DocumentHeader"/>
      
      <div class="styTBB" style="width:187mm">
        <div class="styIRS8621FNBox" style="height:18mm; width:32mm; font-size:7pt;border-right-width:0px;">
          <div>
            Form <span style="width:1mm;"/> <span class="styFormNumber">8621</span>
            <br/>
            <div style="padding-top:1mm;">
				(Rev. December 2015)
				<xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="$Form8621Data"/>              
				</xsl:call-template>
            </div>
            <div style="font-size:6.5pt; line-height:100%;padding-bottom:1.7mm;">
              Department of the Treasury<br/>Internal Revenue Service
            </div>
          </div>          
        </div>
        <div class="styFTBox" style="width:128mm;border-left:1px solid black;border-right:1px solid black;">
          <div class="styMainTitle" style="height:8mm;padding-top:2mm;">
            Information Return by a Shareholder of a Passive Foreign <br/>Investment Company or Qualified Electing Fund<br/>            
          </div>
          <div class="styFBT" style="height:9mm;padding-top:4mm;font-size:7pt;">            
            <img src="{$ImagePath}/8621_Bullet.gif" alt="Arrow Bullet"/> Information about Form 8621 and its separate instructions is at www.irs.gov/form8621. 
          </div>
        </div>
        <div class="styTYBox" style="font-size:7pt; width:27mm; height:18mm;border-left-width:0px;">
          <div class="styOMB" style="padding-top:2.5mm; height:9mm">OMB No. 1545-1002</div>              
          <div style="text-align:left; padding-left:2mm; padding-top:2mm; padding-bottom:4.4mm; line-height:90%">Attachment<br/>Sequence No. <b style="font-size:9pt">69</b></div>              
        </div>
      </div>
      
      <div class="styIRS8621BB" style="height:9mm;font-size:7pt">
        <div class="styIRS8621FNBox" style="height:9mm;">
          Name of shareholder<br/>
          <div style=" font-family:'verdana';font-size:6pt;">
            <xsl:choose>
              <xsl:when test="normalize-space($Form8621Data/ShareholderPersonNm)!=''">             
                  <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderPersonNm"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>   
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderName/BusinessNameLine1Txt"/>
                </xsl:call-template>
                <xsl:if test="normalize-space($Form8621Data/ShareholderName/BusinessNameLine2Txt)!=''">              
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderName/BusinessNameLine2Txt"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose> 
          </div>
        </div>
        <div style="height:9mm;float:left; padding-left:1mm">
          <b>Identifying number</b> (see instructions)<br/>        
          <div style="text-align:left; padding-top:2mm; font-family:'verdana';font-size:7pt;vertical-align:bottom;">
            <xsl:choose>
                <xsl:when test="normalize-space($Form8621Data/EIN)!=''">
                  <xsl:call-template name="PopulateEIN"><xsl:with-param name="TargetNode" select="$Form8621Data/EIN"/></xsl:call-template>
                </xsl:when>
                <xsl:when test="normalize-space($Form8621Data/MissingEINReasonCd)!=''">
                  <xsl:call-template name="PopulateEIN"><xsl:with-param name="TargetNode" select="$Form8621Data/MissingEINReasonCd"/></xsl:call-template>
                </xsl:when>
                 <xsl:otherwise>    
                <xsl:call-template name="PopulateSSN"><xsl:with-param name="TargetNode" select="$Form8621Data/SSN"/></xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>      
          </div>          
        </div>
      </div>  
      
      <div class="styIRS8621BB" style="height:9.5mm;font-size:7pt">
        <div class="styIRS8621FNBox" style="height:9.5mm;">
          Number, street, and room or suite no. (If a P.O. box, see instructions.)<br/>
          <div style=" font-family:'verdana';font-size:7pt;">
				 <!-- Choose between Shareholder US or Foreign Address -->
                <xsl:if test="$Form8621Data/ShareholderUSAddress">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderUSAddress/AddressLine1Txt"/>
                  </xsl:call-template>
                  <xsl:if test="normalize-space($Form8621Data/ShareholderUSAddress/AddressLine2Txt)!=''">    
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderUSAddress/AddressLine2Txt"/>
                    </xsl:call-template>          
                  </xsl:if>
                </xsl:if>
                <xsl:if test="$Form8621Data/ShareholderForeignAddress">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderForeignAddress/AddressLine1Txt"/>
                  </xsl:call-template>
                  <xsl:if test="normalize-space($Form8621Data/ShareholderForeignAddress/AddressLine2Txt)!=''">    
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderForeignAddress/AddressLine2Txt"/>
                    </xsl:call-template>          
                  </xsl:if>
                </xsl:if>
          </div>
        </div>
        <div style="height:9.5mm;float:left; padding-top:1.5mm;padding-left:1mm;">
          Shareholder tax year: calendar year
          <xsl:choose>
            <xsl:when test="$Form8621Data/ShareholderTaxYr">              
              <span class="styIRS8621DotBB" style="width:10mm">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderTaxYr"/></xsl:call-template>  
              </span>  
            </xsl:when>
            <xsl:otherwise>
              20<span class="styIRS8621DotBB" style="width:5mm"/>  
            </xsl:otherwise>
          </xsl:choose>          
          or other tax year<br/>beginning              
          <xsl:choose>
            <xsl:when test="$Form8621Data/ShareholderTaxYearBeginDt">              
              <span class="styIRS8621DotBB" style="width:20mm">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderTaxYearBeginDt"/></xsl:call-template>  
              </span>  
            </xsl:when>
            <xsl:otherwise>
              <span class="styIRS8621DotBB" style="width:12mm"/><span style="width:1mm;"/>, 
              20<span class="styIRS8621DotBB" style="width:5mm"/>  
            </xsl:otherwise>
          </xsl:choose>                          
           and ending                
          <xsl:choose>
            <xsl:when test="$Form8621Data/ShareholderTaxYearBeginDt">              
              <span class="styIRS8621DotBB" style="width:20mm">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderTaxYearEndDt"/></xsl:call-template>  
              </span>  
            </xsl:when>
            <xsl:otherwise>
              <span class="styIRS8621DotBB" style="width:12mm"/><span style="width:1mm;"/>, 
              20<span class="styIRS8621DotBB" style="width:5mm"/>  
            </xsl:otherwise>
          </xsl:choose>
          .            
        </div>
      </div>  
      
      <div class="styIRS8621BB" style="font-size:6.5pt">
        City or town, state, and ZIP code or country<br/>

       <!-- Choose between Shareholder US or Foreign Address -->
              <xsl:if test="$Form8621Data/ShareholderUSAddress">
                <div style=" font-family:'verdana';font-size:7pt;padding-top:1mm">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderUSAddress/CityNm"/>
                </xsl:call-template>, 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderUSAddress/StateAbbreviationCd"/>
                </xsl:call-template> <span style="width:1mm;"/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderUSAddress/ZIPCd"/>
                </xsl:call-template>
                </div>       
              </xsl:if>
              <xsl:if test="$Form8621Data/ShareholderForeignAddress">
                <div style=" font-family:'verdana';font-size:7pt;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderForeignAddress/CityNm"/>
                </xsl:call-template>, 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderForeignAddress/ProvinceOrStateNm"/>
                </xsl:call-template> <span style="width:1mm;"/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderForeignAddress/ForeignPostalCd"/>
                </xsl:call-template><br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8621Data/ShareholderForeignAddress/CountryCd"/>
                </xsl:call-template>
                </div>  
              </xsl:if>
    </div>
      
      <div class="styIRS8621BB" style="font-size:8pt; height:5.5mm;border-bottom:0px solid black;">
        Check type of shareholder filing the return:
        <span style="width:0.5mm"/>
        <input type="Checkbox" class="styCkbox">
			<xsl:call-template name="PopulateCheckbox">
				<xsl:with-param name="TargetNode" select="$Form8621Data/IndividualShareholderInd"/>
				<xsl:with-param name="BackupName">Form8621IndividualShareholder 
			</xsl:with-param></xsl:call-template>
		</input>
        <label>
        	<xsl:call-template name="PopulateLabel">
        		<xsl:with-param name="TargetNode" select="$Form8621Data/IndividualShareholderInd"/>
        		<xsl:with-param name="BackupName">Form8621IndividualShareholder </xsl:with-param>
        	</xsl:call-template>
          Individual
        </label>  
        <span style="width:0.5mm"/>
        <input type="Checkbox" class="styCkbox">
			<xsl:call-template name="PopulateCheckbox">
				<xsl:with-param name="TargetNode" select="$Form8621Data/CorporationShareholderInd"/>
				<xsl:with-param name="BackupName">Form8621CorporationShareholder </xsl:with-param>
			</xsl:call-template>
		</input>
        <label>
        	<xsl:call-template name="PopulateLabel">
        		<xsl:with-param name="TargetNode" select="$Form8621Data/CorporationShareholderInd"/>
        		<xsl:with-param name="BackupName">Form8621CorporationShareholder </xsl:with-param>
        	</xsl:call-template>
          Corporation
        </label>    
        <span style="width:0.5mm"/>
        <input type="Checkbox" class="styCkbox">
			<xsl:call-template name="PopulateCheckbox">
				<xsl:with-param name="TargetNode" select="$Form8621Data/PartnershipShareholderInd"/>
				<xsl:with-param name="BackupName">Form8621PartnershipShareholder </xsl:with-param>
			</xsl:call-template>
		</input>
        <label>
        	<xsl:call-template name="PopulateLabel">
        		<xsl:with-param name="TargetNode" select="$Form8621Data/PartnershipShareholderInd"/>
        		<xsl:with-param name="BackupName">Form8621PartnershipShareholder </xsl:with-param>
        	</xsl:call-template>
          Partnership
        </label>    
        <span style="width:0.5mm"/>
        <input type="Checkbox" class="styCkbox">
			<xsl:call-template name="PopulateCheckbox">
				<xsl:with-param name="TargetNode" select="$Form8621Data/SCorporationShareholderInd"/>
				<xsl:with-param name="BackupName">Form8621SCorporationShareholder </xsl:with-param>
			</xsl:call-template>
		</input>
        <label>
        	<xsl:call-template name="PopulateLabel">
        		<xsl:with-param name="TargetNode" select="$Form8621Data/SCorporationShareholderInd"/>
        		<xsl:with-param name="BackupName">Form8621SCorporationShareholder </xsl:with-param>
        	</xsl:call-template>
          S Corporation
        </label>    
        <span style="width:0.5mm"/>
        <input type="Checkbox" class="styCkbox">
			<xsl:call-template name="PopulateCheckbox">
				<xsl:with-param name="TargetNode" select="$Form8621Data/NongrantorTrustShareholderInd"/>
				<xsl:with-param name="BackupName">Form8621NongrantorTrustShr </xsl:with-param>
			</xsl:call-template>
		</input>
        <label>
        	<xsl:call-template name="PopulateLabel">
        		<xsl:with-param name="TargetNode" select="$Form8621Data/NongrantorTrustShareholderInd"/>
        		<xsl:with-param name="BackupName">Form8621NongrantorTrustShr </xsl:with-param>
        	</xsl:call-template>
          Nongrantor Trust
        </label>    
        <span style="width:0.5mm"/>
        <input type="Checkbox" class="styCkbox">
			<xsl:call-template name="PopulateCheckbox">
				<xsl:with-param name="TargetNode" select="$Form8621Data/EstateShareholderInd"/>
				<xsl:with-param name="BackupName">Form8621EstateShareholder </xsl:with-param>
			</xsl:call-template>
		</input>
        <label>
        	<xsl:call-template name="PopulateLabel">
        		<xsl:with-param name="TargetNode" select="$Form8621Data/EstateShareholderInd"/>
        		<xsl:with-param name="BackupName">Form8621EstateShareholder </xsl:with-param>
        	</xsl:call-template>
          Estate
        </label>    
      </div>
      
      <div class="styIRS8621BB" style="font-size:8pt; height:5.5mm;width:179mm;border-bottom:1px solid black;">
        <label>
        	<xsl:call-template name="PopulateLabel">
        		<xsl:with-param name="TargetNode" select="$Form8621Data/ForeignFinancialAssetInd"/>
        		<xsl:with-param name="BackupName">ForeignFinancialAssetInd</xsl:with-param>
        	</xsl:call-template>
			Check if any Excepted Specified Foreign Financial Assets are Reported on this Form (see instructions)
        </label>    
		<span class="styDotLn" style="float:right;">.............</span> 
      </div>
      <div class="styIRS8621BB" style="font-size:8pt; height:5.5mm;width:8mm;border-bottom:1px solid black;">
        <input type="Checkbox" class="styCkbox">
			<xsl:call-template name="PopulateCheckbox">
				<xsl:with-param name="TargetNode" select="$Form8621Data/ForeignFinancialAssetInd"/>
				<xsl:with-param name="BackupName">ForeignFinancialAssetInd</xsl:with-param>
			</xsl:call-template>
		</input>
      </div>
      
      <div class="styIRS8621BB" style="height:9mm;font-size:6.5pt">
        <div class="styIRS8621FNBox" style="height:9mm;">
          Name of passive foreign investment company (PFIC) or qualified electing fund (QEF)<br/>
          <div style="font-family:'verdana';font-size:6pt;">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/PFICOrQEFName/BusinessNameLine1Txt"/></xsl:call-template><span style="width:1mm;"/>
            <xsl:if test="normalize-space($Form8621Data/PFICOrQEFName/BusinessNameLine2Txt)!=''">  
              <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/PFICOrQEFName/BusinessNameLine2Txt"/></xsl:call-template>  
            </xsl:if>
          </div>
        </div>
        <div style="height:9mm;float:left; padding-left:1mm">
          <b>Employer identification number</b> (if any)<br/>
          <div style="text-align:left; padding-top:2mm; font-family:'verdana';font-size:7pt;vertical-align:bottom;">  
            <xsl:call-template name="PopulateEIN"><xsl:with-param name="TargetNode" select="$Form8621Data/PFICOrQEFEIN"/></xsl:call-template>
            <xsl:if test="$Form8621Data/EINMissingReasonCd!=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="$Form8621Data/EINMissingReasonCd"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>              
          </div>        
        </div>  
      </div>  
      
      <div style="font-size:6.5pt; border-bottom:1px solid black;">
        <div class="styIRS8621FNBox" style="border-right-width:0px;">
          Address (Enter number, street, city or town, and country.)<br/>
          <div style="font-family:'verdana';font-size:7pt;">
            <xsl:choose>
              <xsl:when test="$Form8621Data/PFICOrQEFUSAddress">
                <xsl:call-template name="PopulateUSAddressTemplate">
	                <xsl:with-param name="TargetNode" select="$Form8621Data/PFICOrQEFUSAddress"/>
	              </xsl:call-template>
              </xsl:when> 
              <xsl:otherwise>  
                <xsl:if test="$Form8621Data/PFICOrQEFForeignAddress">
                  <xsl:call-template name="PopulateForeignAddressTemplate">
		               <xsl:with-param name="TargetNode" select="$Form8621Data/PFICOrQEFForeignAddress"/>
		             </xsl:call-template>
                </xsl:if>     
              </xsl:otherwise>  
            </xsl:choose>      
          </div>
        </div>
        <div style="height:auto;width:87mm;float:left; padding-bottom:1mm;border-bottom:0px solid black; border-left:1px solid black;">
		  <span style="width:1mm;" ></span>
          <b>Reference ID number</b> (see instructions) 
		  <xsl:for-each select="$Form8621Data/ForeignEntityIdentificationGrp">
			  <br/> 
			  <span style="width:1mm;" ></span>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
              </xsl:call-template>
		  </xsl:for-each>
        <div style="height:9mm;width:87mm;float:left; padding-top:1.5mm; padding-left:1mm;border-top:1px solid black;">
          Tax year of  PFIC or QEF: calendar year
          <xsl:choose>
            <xsl:when test="$Form8621Data/TaxYr">              
              <span class="styIRS8621DotBB" style="width:10mm">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/TaxYr"/></xsl:call-template>  
              </span>  
            </xsl:when>
            <xsl:otherwise>
              20<span class="styIRS8621DotBB" style="width:5mm"/>  
            </xsl:otherwise>
          </xsl:choose>                    
          or other<br/>tax year beginning                
          <xsl:choose>
            <xsl:when test="$Form8621Data/TaxYearBeginDt">              
              <span class="styIRS8621DotBB" style="width:20mm">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/TaxYearBeginDt"/></xsl:call-template>  
              </span>  
            </xsl:when>
            <xsl:otherwise>
              <span class="styIRS8621DotBB" style="width:12mm"/><span style="width:1mm;"/>,    
              20<span class="styIRS8621DotBB" style="width:5mm"/>  
            </xsl:otherwise>
          </xsl:choose>                    
          and ending              
          <xsl:choose>
            <xsl:when test="$Form8621Data/TaxYearEndDt">              
              <span class="styIRS8621DotBB" style="width:20mm">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/TaxYearEndDt"/></xsl:call-template>  
              </span>  
            </xsl:when>
            <xsl:otherwise>
              <span class="styIRS8621DotBB" style="width:12mm"/><span style="width:1mm;"/>,
              20<span class="styIRS8621DotBB" style="width:5mm"/>  
            </xsl:otherwise>
          </xsl:choose>
        </div>
        </div>
      </div>
  
    <!-- BEGIN Part I Title -->
      <div class="styIRS8621BB" style="width:187mm;height:4mm; border-top:1px solid black">
        <div class="styTitleName" style="width:12mm; font-size:10pt">Part I</div>
        <div class="styTitleDesc" style="font-size:10pt">Summary of Annual Information <span class="styNormalText">(See instructions.)</span></div>        
      </div>
    <!-- END Part I Title -->
    
    <div style="width:187mm;font-size:8pt;"><span style="width:2mm;"/>Provide the following information with respect to all shares of the PFIC held by the shareholder:</div>
	<table style="width:187mm;font-size:8pt;">
		<tbody>
			<tr>
				<td style="width:5mm;text-align:center;">1</td>
				<td style="width:182mm;">
					Description of each class of shares held by the shareholder:
					<span class="styFixedUnderline" style="float:none;width:60mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ClassOfShareTxt"/>
                    </xsl:call-template>
                  </span>
				</td>
			</tr>
			<tr>
				<td style="width:5mm;vertical-align:bottom;"><span style="width:1mm;"/></td>
				<td style="width:182mm;">
					<span style="">
						<input class="styCkbox" type="checkbox" style="width:3mm;">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8621Data/JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">SharesJointlyOwnedWithSpouse</xsl:with-param>
							</xsl:call-template>
					  </input>
				  </span>
				  <label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$Form8621Data/JointlyOwnedWithSpouseInd"/>
						<xsl:with-param name="BackupName">SharesJointlyOwnedWithSpouse </xsl:with-param>
					</xsl:call-template>
				  Check if shares jointly owned with spouse.
				  </label> 
				</td>
			</tr>
			<tr>
				<td style="width:5mm;text-align:center;padding-top:2.5mm;">2</td>
				<td style="width:182mm;padding-top:3mm;">
					Date shares acquired during the taxable year, if applicable: 
					<span class="styFixedUnderline" style="float:none;width:62mm;">
                    <xsl:call-template name="PopulateMonthDayYear">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/SharesAcquiredDt"/>
                    </xsl:call-template>
                  </span>
				</td>
			</tr>
			<tr>
				<td style="width:5mm;text-align:center;padding-top:3mm;">3</td>
				<td style="width:182mm;padding-top:3mm;">
					Number of shares held at the end of the taxable year: 
					<span class="styFixedUnderline" style="float:none;width:69mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/EndTaxYearSharesCnt"/>
                    </xsl:call-template>
                  </span>
				</td>
			</tr>
			<tr>
				<td style="width:5mm;text-align:center;vertical-align:bottom;padding-top:3mm;">4</td>
				<td style="width:182mm;padding-top:3mm;">
					Value of shares held at the end of the taxable year (check the appropriate box, if applicable):
				</td>
			</tr>
			<tr>
				<td style="width:5mm;"><span style="width:1mm;"/></td>
				<td style="width:182mm;">
					<table style="width:140mm;font-size:8pt;">
						<tbody>
							<tr>
								<td style="width:35mm;">
									<span style="vertical-align:top;padding-top:0.5mm;">(a)</span>
									<span style="">
										<input class="styCkbox" type="checkbox" style="width:3mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8621Data/SharesValueRangeAInd"/>
												<xsl:with-param name="BackupName">ValueOfSharesRangeA</xsl:with-param>
											</xsl:call-template>
									  </input>
								  </span>
								  <label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8621Data/SharesValueRangeAInd"/>
										<xsl:with-param name="BackupName">ValueOfSharesRangeA </xsl:with-param>
									</xsl:call-template>
								  <span style="vertical-align:top;padding-top:1mm;">$0-50,000</span>
								  </label> 
								</td>
								<td style="width:35mm;">
									<span style="vertical-align:top;padding-top:0.5mm;">(b)</span>
									<span style="">
										<input class="styCkbox" type="checkbox" style="width:3mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8621Data/SharesValueRangeBInd"/>
												<xsl:with-param name="BackupName">ValueOfSharesRangeB</xsl:with-param>
											</xsl:call-template>
									  </input>
								  </span>
								  <label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8621Data/SharesValueRangeBInd"/>
										<xsl:with-param name="BackupName">ValueOfSharesRangeB </xsl:with-param>
									</xsl:call-template>
								  <span style="vertical-align:top;padding-top:1mm;">$50,001-100,000</span>
								  </label> 
								</td>
								<td style="width:35mm;">
									<span style="vertical-align:top;padding-top:0.5mm;">(c)</span>
									<span style="">
										<input class="styCkbox" type="checkbox" style="width:3mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8621Data/SharesValueRangeCInd"/>
												<xsl:with-param name="BackupName">ValueOfSharesRangeC</xsl:with-param>
											</xsl:call-template>
									  </input>
								  </span>
								  <label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8621Data/SharesValueRangeCInd"/>
										<xsl:with-param name="BackupName">ValueOfSharesRangeC </xsl:with-param>
									</xsl:call-template>
								  <span style="vertical-align:top;padding-top:1mm;">$100,001-150,000</span>
								  </label> 
								</td>
								<td style="width:35mm;">
									<span style="vertical-align:top;padding-top:0.5mm;">(d)</span>
									<span style="">
										<input class="styCkbox" type="checkbox" style="width:3mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8621Data/SharesValueRangeDInd"/>
												<xsl:with-param name="BackupName">ValueOfSharesRangeD</xsl:with-param>
											</xsl:call-template>
									  </input>
								  </span>
								  <label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8621Data/SharesValueRangeDInd"/>
										<xsl:with-param name="BackupName">ValueOfSharesRangeD </xsl:with-param>
									</xsl:call-template>
								  <span style="vertical-align:top;padding-top:1mm;">$150,001-200,000</span>
								  </label> 
								</td>
							</tr>
							<tr>
								<td colspan="4" style="width:140mm;">
									(e) If more than $200,000, list value: 
									<span class="styFixedUnderline" style="float:none;width:91mm;">
										<xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="$Form8621Data/SharesValueRangeEAmt"/>
										</xsl:call-template>
								  </span>	
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td style="width:5mm;text-align:center;vertical-align:bottom;padding-top:3mm;">5</td>
				<td style="width:182mm;padding-top:3mm;">
					Type of PFIC and amount of any excess distribution or gain treated as an excess distribution
				</td>
			</tr>
			<tr>
				<td style="width:5mm;"><span style="width:1mm;"/></td>
				<td style="width:182mm;">
					under section 1291, inclusion under section 1293, or inclusion or deduction under section 1296:
				</td>
			</tr>
			<tr>
				<td style="width:5mm;"><span style="width:1mm;"/></td>
				<td style="width:182mm;">
					(a)
					<span style="vertical-align:middle;">
						<input class="styCkbox" type="checkbox" style="width:3mm;">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8621Data/Section1291Ind"/>
								<xsl:with-param name="BackupName">Section1291</xsl:with-param>
							</xsl:call-template>
					  </input>
				  </span>
				  <label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$Form8621Data/Section1291Ind"/>
						<xsl:with-param name="BackupName">Section1291</xsl:with-param>
					</xsl:call-template>
				  Section 1291 $
				  </label> 
				  <span class="styFixedUnderline" style="float:none;width:40mm;">
					  <xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form8621Data/Section1291Ind/@section1291Amt"/>
					  </xsl:call-template>
				  </span>	
				</td>
			</tr>
			<tr>
				<td style="width:5mm;"><span style="width:1mm;"/></td>
				<td style="width:182mm;">
					(b)
					<span style="vertical-align:middle;">
						<input class="styCkbox" type="checkbox" style="width:3mm;">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8621Data/Section1293Ind"/>
								<xsl:with-param name="BackupName">Section1293QualElectFund</xsl:with-param>
							</xsl:call-template>
					  </input>
				  </span>
				  <label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$Form8621Data/Section1293Ind"/>
						<xsl:with-param name="BackupName">Section1293QualElectFund</xsl:with-param>
					</xsl:call-template>
				  Section 1293 (Qualified Electing Fund) $
				  </label> 
				  <span class="styFixedUnderline" style="float:none;width:40mm;">
					  <xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form8621Data/Section1293Ind/@section1293Amt"/>
					  </xsl:call-template>
				  </span>	
				</td>
			</tr>
			<tr>
				<td style="width:5mm;"><span style="width:1mm;"/></td>
				<td style="width:182mm;">
					(c)
					<span style="vertical-align:middle;">
						<input class="styCkbox" type="checkbox" style="width:3mm;">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8621Data/Section1296Ind"/>
								<xsl:with-param name="BackupName">Section1296MarkToMarket</xsl:with-param>
							</xsl:call-template>
					  </input>
				  </span>
				  <label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$Form8621Data/Section1296Ind"/>
						<xsl:with-param name="BackupName">Section1296MarkToMarket</xsl:with-param>
					</xsl:call-template>
				  Section 1296 (Mark to Market) $
				  </label> 
				  <span class="styFixedUnderline" style="float:none;width:40mm;">
					  <xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form8621Data/Section1296Ind/@Section1296Amt"/>
					  </xsl:call-template>
				  </span>	
				</td>
			</tr>
		</tbody>
	</table>
	<br/>  
  
    <!-- BEGIN Part II Title -->
      <div class="styIRS8621BB" style="height:4mm; border-top:1px solid black">
        <div class="styTitleName" style="width:12mm; font-size:10pt">Part II</div>
        <div class="styTitleDesc" style="font-size:10pt">Elections <span class="styNormalText">(See instructions.)</span></div>        
      </div>
    <!-- END Part II Title -->
    
    <!-- BEGIN Part II Line Items -->    
      <div class="styIRS8621Item" style="width:187mm;padding-top:1mm">
        <div class="styIRS8621Part1" style="width:10mm;vertical-align:top;display:inline;">
          <b>A</b>
          <input type="Checkbox" class="styCkbox">
			  <xsl:call-template name="PopulateCheckbox">
				  <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionToTreatThePFICAsQEFInd"/>
				  <xsl:with-param name="BackupName">Form8621ElectionToTreatThePFICAsQEF </xsl:with-param>
			  </xsl:call-template>
		  </input>
        </div>
        <div style="width:177mm;display:inline;">
          <label >
          <xsl:call-template name="PopulateLabel">
          	<xsl:with-param name="TargetNode" select="$Form8621Data/ElectionToTreatThePFICAsQEFInd"/>
          	<xsl:with-param name="BackupName">Form8621ElectionToTreatThePFICAsQEF </xsl:with-param>
     
          </xsl:call-template>
            <b>Election To Treat the PFIC as a QEF.</b> I, a shareholder of a PFIC, elect to treat the PFIC as a QEF. <i>Complete lines 6a through 7c of Part III.</i>
          </label>
        </div>
      </div>
      
      <div class="styIRS8621Item" style="width:187mm;padding-top:1mm">
        <div class="styIRS8621Part1" style="width:10mm;vertical-align:top;display:inline;">
          <b>B</b>
          <input type="Checkbox" class="styCkbox">
			  <xsl:call-template name="PopulateCheckbox">
				  <xsl:with-param name="TargetNode" select="$Form8621Data/ElectToExtndTmForPymtOfTxInd"/>
				  <xsl:with-param name="BackupName">Form8621ElectToExtendTimeForPymtOfTax </xsl:with-param>
			  </xsl:call-template>
		  </input>
        </div>
        <div style="width:177mm;display:inline;">
          <label>
          <xsl:call-template name="PopulateLabel">
          	<xsl:with-param name="TargetNode" select="$Form8621Data/ElectToExtndTmForPymtOfTxInd"/>
          	<xsl:with-param name="BackupName">Form8621ElectToExtendTimeForPymtOfTax </xsl:with-param>
          </xsl:call-template>
            <b>Election To Extend Time For Payment of Tax.</b> I, a shareholder of a QEF, elect to extend the time for payment of tax on<br/>the undistributed earnings and profits of the QEF until this election is terminated. <i>Complete lines 8a through 9c of Part III to
            <br/><span style="width:10mm;" />calculate the tax that may be deferred.</i>
            
            <br/><br/><span style="width:10mm;" /><b>Note:</b> <span style="width:1mm;"/> <i>If any portion of line 1a or line 2a of Part II is includible under section  951, you may <b>not</b> make this election.
            <br/><span style="width:10mm;" />Also, see sections 1294(c) and 1294(f) and the related regulations for events that terminate this election.</i><br/><br/>
          </label>
        </div>
      </div>
      
      <div class="styIRS8621Item" style="width:187mm;padding-top:1mm">
        <div class="styIRS8621Part1" style="width:10mm;vertical-align:top;display:inline;">
          <b>C</b>
          <input type="Checkbox" class="styCkbox">
			  <xsl:call-template name="PopulateCheckbox">
				  <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionToMarkToMrktPFICStkInd"/>
				  <xsl:with-param name="BackupName">Form8621ElectToMarkToMarketPFICStock </xsl:with-param>
			  </xsl:call-template>
		  </input>
        </div>
        <div style="width:177mm;display:inline;">
          <label>
          	<xsl:call-template name="PopulateLabel">
          		<xsl:with-param name="TargetNode" select="$Form8621Data/ElectionToMarkToMrktPFICStkInd"/>
          		<xsl:with-param name="BackupName">Form8621ElectToMarkToMarketPFICStock </xsl:with-param>
          	</xsl:call-template>
            <b>Election To Mark-to-Market PFIC Stock.</b> I, a shareholder of a PFIC, elect to mark-to-market the PFIC stock that is<br/>marketable within the meaning of section 1296(e). <i>Complete Part IV.</i>
          </label>
        </div>
      </div>
      
      <div class="styIRS8621Item" style="width:187mm;padding-top:1mm">
        <div class="styIRS8621Part1" style="width:10mm;vertical-align:top;display:inline;">
          <b>D</b>
          <input type="Checkbox" class="styCkbox">
			  <xsl:call-template name="PopulateCheckbox">
				  <xsl:with-param name="TargetNode" select="$Form8621Data/DeemedSaleElectionInd"/>
				  <xsl:with-param name="BackupName">Form8621DeemedSaleElection </xsl:with-param>
			  </xsl:call-template>
		  </input>
        </div>
        <div style="width:177mm;display:inline;">
          <label>
          <xsl:call-template name="PopulateLabel">
          	<xsl:with-param name="TargetNode" select="$Form8621Data/DeemedSaleElectionInd"/>
          	<xsl:with-param name="BackupName">Form8621DeemedSaleElection </xsl:with-param>
          </xsl:call-template>
            <b>Deemed Sale Election.</b> I, a shareholder on the first day of a PFIC's first tax year as a QEF, elect to recognize gain on the<br/>deemed sale of my interest in the PFIC. <i>Enter gain or loss on line 15f of Part V.</i>
          </label>
        </div>
      </div>
      
      <div class="styIRS8621Item" style="width:187mm;padding-top:1mm">
        <div class="styIRS8621Part1" style="width:10mm;vertical-align:top;display:inline;">
          <b>E</b>
          <input type="Checkbox" class="styCkbox">
			  <xsl:call-template name="PopulateCheckbox">
				  <xsl:with-param name="TargetNode" select="$Form8621Data/DeemedDividendElectionInd"/>
				  <xsl:with-param name="BackupName">Form8621DeemedDividendElection </xsl:with-param>
			  </xsl:call-template>
		  </input>
        </div>
        <div style="width:177mm;display:inline;">
          <label>
          <xsl:call-template name="PopulateLabel">
          	<xsl:with-param name="TargetNode" select="$Form8621Data/DeemedDividendElectionInd"/>
          	<xsl:with-param name="BackupName">Form8621DeemedDividendElection </xsl:with-param>          
          </xsl:call-template>
            <b>Deemed Dividend Election.</b> I, a shareholder on the first day of a PFIC's first tax year as a QEF that is a controlled foreign<br/>corporation (CFC), elect to treat an amount equal to my share of the post-1986 earnings and profits of the CFC as an excess
            <br/><span style="width:10mm;" />distribution. <i>Enter this amount on line 15e of Part V.  If the excess distribution is greater than zero, also complete line 16 of 
            <br/><span style="width:10mm;" />Part V.</i>
          </label>
          <span style="width:1mm;"/>
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form8621Data/DeemedDividendElectionInd"/>            
          </xsl:call-template>
        </div>
      </div>
      
      <div class="styIRS8621Item" style="width:187mm;padding-top:1mm">
        <div class="styIRS8621Part1" style="width:10mm;vertical-align:top;display:inline;">
          <b>F</b>
          <input type="Checkbox" class="styCkbox">
			  <xsl:call-template name="PopulateCheckbox">
				  <xsl:with-param name="TargetNode" select="$Form8621Data/ElectToRcgnzGainOnPFICSaleInd"/>
				  <xsl:with-param name="BackupName">Form8621ElectToRecognizeGainOnPFICSale </xsl:with-param>
			  </xsl:call-template>
		  </input>
        </div>
        <div style="width:177mm;display:inline;">
          <label>
          	<xsl:call-template name="PopulateLabel">
          		<xsl:with-param name="TargetNode" select="$Form8621Data/ElectToRcgnzGainOnPFICSaleInd"/>
          		<xsl:with-param name="BackupName">Form8621ElectToRecognizeGainOnPFICSale </xsl:with-param>
          	</xsl:call-template>
            <b>Election To Recognize Gain on Deemed Sale of PFIC.</b> I, a shareholder of a former PFIC or a PFIC to which section 1297(d) applies, elect to treat as an excess distribution the gain recognized on the deemed sale of my interest in the PFIC on the 
            <br/><span style="width:10mm;" />last day of its last tax year as a PFIC under section 1297(a). <i>Enter gain on line 15f of Part V.</i>
          </label>
        </div>
      </div>
      
	  <div class="styIRS8621Item" style="width:187mm;padding-top:1mm">
        <div class="styIRS8621Part1" style="width:10mm;vertical-align:top;display:inline;">
          <b>G</b>
          <input type="Checkbox" class="styCkbox">
			  <xsl:call-template name="PopulateCheckbox">
				  <xsl:with-param name="TargetNode" select="$Form8621Data/DeemedDivElectSec1297ePFICInd"/>
				  <xsl:with-param name="BackupName">Form8621DeemedDivElectSec1297ePFICInd </xsl:with-param>
			  </xsl:call-template>
		  </input>
        </div>
        <div style="width:177mm;display:inline;">
          <label>
          	<xsl:call-template name="PopulateLabel">
          		<xsl:with-param name="TargetNode" select="$Form8621Data/DeemedDivElectSec1297ePFICInd"/>
          		<xsl:with-param name="BackupName">Form8621DeemedDivElectSec1297ePFICInd </xsl:with-param>
          	</xsl:call-template>
            <b>Deemed Dividend Election With Respect to a Section 1297(e) PFIC.</b> I, a shareholder of a section 1297(e) PFIC, within the meaning of Regulations section 1.1297-3(a), elect to make a deemed dividend election with respect to the section 1297(e) 
            <br/><span style="width:10mm;" />PFIC. My holding period in the stock of the Section 1297(e) PFIC includes the CFC qualification date, as defined in 
            <br/><span style="width:10mm;" />Regulations section 1.1297-3(d).  <i>Enter the excess distribution on line 15e, Part V. If the excess distribution is greater than 
            <br/><span style="width:10mm;" />zero, also complete line 16, Part V.</i>
          </label>
          <span style="width:1mm;"/>
		  <xsl:for-each select="$Form8621Data/DeemedDivElectSec1297ePFICInd">
			  <xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="."/>            
			  </xsl:call-template>
		  </xsl:for-each>
        </div>
      </div>      
      
      <div class="styIRS8621Item" style="width:187mm;padding-top:1mm">
        <div class="styIRS8621Part1" style="width:10mm;vertical-align:top;display:inline;">
          <b>H</b>
          <input type="Checkbox" class="styCkbox">
			  <xsl:call-template name="PopulateCheckbox">
				  <xsl:with-param name="TargetNode" select="$Form8621Data/DeemedDivElectFrmrPFICInd"/>
				  <xsl:with-param name="BackupName">Form8621DeemedDivElectFrmrPFICInd </xsl:with-param>
			  </xsl:call-template>
		  </input>
        </div>
        <div style="width:177mm;display:inline;">
          <label>
          	<xsl:call-template name="PopulateLabel">
          		<xsl:with-param name="TargetNode" select="$Form8621Data/DeemedDivElectFrmrPFICInd"/>
          		<xsl:with-param name="BackupName">Form8621DeemedDivElectFrmrPFICInd </xsl:with-param>
          	</xsl:call-template>
            <b>Deemed Dividend Election With Respect to a Former PFIC.</b> I, a shareholder of a former PFIC, within the meaning of Regulations section 1.1298-3(a), elect to make a deemed dividend election with respect to the former PFIC. My holding 
            <br/><span style="width:10mm;" />period in the stock of the former PFIC includes the termination date, as defined in Regulations section 1.1298-3(d).  <i>Enter the 
            <br/><span style="width:10mm;" />excess distribution on line 15e, Part V. If the excess distribution is greater than zero, also complete line 16, Part V.</i>
          </label>
          <span style="width:1mm;"/>
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form8621Data/DeemedDivElectFrmrPFICInd"/>            
          </xsl:call-template>
        </div>
      </div> 
      
    <!-- END Part II Line Items -->
      
    <div style="width:187mm; border-top:1px solid black;font-size:7pt; page-break-after:always">    
      <div style="float:left; font-size:8pt">
        <b>For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see separate instructions.</b>
      </div>    
      <div style="float:right">
        Cat. No. 64174H
        <span style="width:1mm"/>
        Form <b style="font-size:10pt">8621</b> (Rev. 12-2015)
      </div>      
    </div>    
    
    <div style="width:187mm; font-size:7pt">    
      <div style="float:left; font-size:8pt">
        Form 8621 (Rev. 12-2015)
      </div>    
      <div style="float:right">        
        Page <b style="font-size:9pt">2</b>
      </div>      
    </div>    
      
    <!-- BEGIN Part III Title -->  
      <div class="styIRS8621BB" style="height:8mm; border-top:1px solid black">
        <div class="styTitleName" style="width:13mm; font-size:10pt">Part III</div>
        <div class="styTitleDesc" style="font-size:10pt; width:170mm">Income From a Qualified Electing Fund (QEF). <span class="styNormalText" style="font-size:8pt">All QEF shareholders complete lines 6a through 7c. If you are making</span><br/><span class="styNormalText" style="font-size:8pt">Election B, also complete lines 8a through 9c. (See instructions.)</span></div>        
      </div>
    <!-- END Part III Title -->
    
    <!-- BEGIN Part III Line Items -->
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2" style="padding-top:0.5mm">6a</div>
        <div style="float:left; padding-top:0.5mm">
          Enter your pro rata share of the ordinary earnings of the QEF            
        </div>    
        <div style="float:right">    
          <span class="styIRS8621DotLn">      
            .                          
          </span>
          <div class="styIRS8621LNRightNumBox" style="margin-top:0.5mm">6a</div>  
          <div class="styIRS8621LNAmountBox" style="margin-top:0.5mm">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ProRataShareOfQEFOrdnryEarnAmt"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey; height:4.7mm"/>  
          <div class="styIRS8621LNAmountBoxNBB" style="height:4.7mm"/>
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">b</div>
        <div style="float:left">
          Enter the portion of line 6a that is included in income under<br/>section  951 or that may be excluded under section 1293(g)          
        </div>      
        <div style="float:right">    
          <div class="styIRS8621LNRightNumBox" style="height:8.5mm; padding-top:4mm">6b</div>  
          <div class="styIRS8621LNAmountBox" style="height:8.5mm; padding-top:4mm">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/IncomePortionOfOrdinaryEarnAmt"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey; height:8.5mm"/>  
          <div class="styIRS8621LNAmountBoxNBB" style="height:8.5mm"/>  
        </div>  
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">c</div>
        <div style="float:left">
          Subtract line 6b from line 6a. Enter this amount on your tax return as ordinary income
        </div>      
        <div style="float:right">      
          <span class="styIRS8621DotLn">      
            ...                        
          </span>                    
          <div class="styIRS8621LNRightNumBox">6c</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/OrdinaryIncomeFromQEFAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">7a</div>
        <div style="float:left">
          Enter your pro rata share of the total net capital gain of the QEF
        </div>        
        <div style="float:right">    
          <div class="styIRS8621LNRightNumBox">7a</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ProRataShareOfTotNetCapGainAmt"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey"/>  
          <div class="styIRS8621LNAmountBoxNBB"/>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">b</div>
        <div style="float:left">
          Enter the portion of line 7a that is included in income under<br/>section 951 or that may be excluded under section 1293(g)      
        </div>        
        <div style="float:right">    
          <div class="styIRS8621LNRightNumBox" style="height:8mm; padding-top:4mm">7b</div>  
          <div class="styIRS8621LNAmountBox" style="height:8.1mm; padding-top:4mm">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/IncomePortionOfNetCapGainAmt"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey; height:8.1mm"/>  
          <div class="styIRS8621LNAmountBoxNBB" style="height:8.1mm"/>  
        </div>      
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">c</div>
        <div style="float:left">
          Subtract line 7b from line 7a. This amount is a net long-term capital gain. Enter this amount    
        </div>        
        <div style="float:right">                            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"/>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"/>  
        </div>  
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2"/>
        <div style="float:left">
          <span style="width:7mm;"/>in Part II of the Schedule D used for your income tax return. (See instructions.)          
        </div>        
        <div style="float:right">    
          <span class="styIRS8621DotLn">      
            .....                        
          </span>                    
          <div class="styIRS8621LNRightNumBox">7c</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/NetLongTermCapitalGainAmt"/></xsl:call-template>
          </div>  
        </div>  
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">8a</div>
        <div style="float:left">
          Add lines 6c and 7c
        </div>        
        <div style="float:right">      
          <span class="styIRS8621DotLn">      
            .........................                                                          
          </span>                  
          <div class="styIRS8621LNRightNumBox">8a</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DividendIncomeAndNetLTCGAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">b</div>
        <div style="float:left">
          Enter the total amount of cash and the fair market value of other<br/>property distributed or deemed distributed to you during the tax  
        </div>        
        <div style="float:right">                        
          <div class="styIRS8621LNRightNumBox" style="height:8mm; border-bottom:0"/>  
          <div class="styIRS8621LNAmountBox" style="height:8mm; border-bottom:0"/>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey; height:8mm"/>  
          <div class="styIRS8621LNAmountBoxNBB" style="height:8mm"/>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2"/>
        <div style="float:left">
          <span style="width:7mm;"/>year of the QEF. (See instructions.)    
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form8621Data/TotalCashAndDistributionsAmt"/>
          </xsl:call-template>    
        </div>        
        <div style="float:right">      
          <span class="styIRS8621DotLn">    
            ..........                                                                          
          </span>            
          <div class="styIRS8621LNRightNumBox">8b</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/TotalCashAndDistributionsAmt"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey"/>  
          <div class="styIRS8621LNAmountBoxNBB"/>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">c</div>
        <div style="float:left">
          Enter the portion of line 8a not already included in line 8b that is<br/>attributable to shares in the QEF that you disposed of, pledged,
        </div>        
        <div style="float:right">              
          <div class="styIRS8621LNRightNumBox" style="height:8mm; border-bottom:0"/>  
          <div class="styIRS8621LNAmountBox" style="height:8mm; border-bottom:0"/>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey; height:8mm"/>  
          <div class="styIRS8621LNAmountBoxNBB" style="height:8mm"/>  
        </div>      
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2"/>
        <div style="float:left">
          <span style="width:7mm;"/>or otherwise transferred during the tax year
        </div>        
        <div style="float:right">      
          <span class="styIRS8621DotLn">      
            .......                                                                                  
          </span>          
          <div class="styIRS8621LNRightNumBox">8c</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/PortionOfProRateOrdnryEarnAmt"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey"/>  
          <div class="styIRS8621LNAmountBoxNBB"/>  
        </div>      
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">d</div>
        <div style="float:left">
          Add lines 8b and 8c
        </div>        
        <div style="float:right">      
          <span class="styIRS8621DotLn">      
            .........................                            
          </span>                    
          <div class="styIRS8621LNRightNumBox">8d</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/TotalCashAndPrtnOfProRataAmt"/></xsl:call-template>
          </div>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">e</div>
        <div style="float:left">
          Subtract line 8d from line 8a, and enter the difference (if zero or less, enter amount in brackets)
        </div>        
        <div style="float:right">                  
          <div class="styIRS8621LNRightNumBox">8e</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ProRataLessCashAndPortionAmt"/></xsl:call-template>
          </div>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2"/>
        <div style="float:left">
          <span style="width:6mm;"/><b>Important:</b> <span style="width:1mm;"/> <i>If line 8e is greater than zero, and no portion of line 6a or 7a is includible in income
          <br/><span style="width:7mm;"/>under section 951, you may make Election B with respect to the amount on line 8e.</i>
        </div>      
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey; height:8mm"/>  
          <div class="styIRS8621LNAmountBoxNBB" style="height:8mm"/>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">9a</div>
        <div style="float:left">
          Enter the total tax for the tax year (See instructions.)
        </div>      
        <div style="float:right">    
          <span class="styIRS8621DotLn">      
            ....                            
          </span>            
          <div class="styIRS8621LNRightNumBox">9a</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/TotalTaxForTaxYearAmt"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey"/>  
          <div class="styIRS8621LNAmountBoxNBB"/>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">b</div>
        <div style="float:left">
          Enter the total tax for the tax year determined without regard to  
        </div>      
        <div style="float:right">                
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"/>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"/>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey"/>  
          <div class="styIRS8621LNAmountBoxNBB"/>  
        </div>    
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2"/>
        <div style="float:left">
          <span style="width:7mm;"/>the amount entered on line 8e      
        </div>      
        <div style="float:right">    
          <span class="styIRS8621DotLn">      
            ............                          
          </span>            
          <div class="styIRS8621LNRightNumBox">9b</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/TotTxWithoutProRataLessCashAmt"/></xsl:call-template>
          </div>  
          <div class="styIRS8621LNRightNumBoxNBB" style="background-color:lightgrey"/>  
          <div class="styIRS8621LNAmountBoxNBB"/>  
        </div>    
      </div>
              
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2">c</div>
        <div style="float:left">
          Subtract line 9b from line 9a. <b>This is the deferred tax, the time for payment of which is</b>
        </div>      
        <div style="float:right">                          
          <div class="styIRS8621LNRightNumBoxNBB"/>  
          <div class="styIRS8621LNAmountBoxNBB"/>  
        </div>    
      </div>    
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part2"/>
        <div style="float:left">
          <span style="width:6mm;"/><b>extended by making Election B. See instructions</b>
        </div>      
        <div style="float:right">    
          <span class="styIRS8621DotLn">      
            ...............                                                                                    
          </span>                    
          <div class="styIRS8621LNRightNumBoxNBB">9c</div>  
          <div class="styIRS8621LNAmountBoxNBB">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DeferredTaxAmt"/></xsl:call-template>
          </div>  
        </div>    
      </div>      
    <!-- END Part III Line Items -->    

    <!-- BEGIN Part IV Title -->  
      <div class="styIRS8621BB" style="height:4.5mm; border-top:1px solid black">
        <div class="styTitleName" style="width:13mm; font-size:10pt">Part IV</div>
        <div class="styTitleDesc" style="font-size:10pt">Gain or (Loss) From Mark-to-Market Election <span class="styNormalText">(See page 5 of instructions.)</span></div>        
      </div>
    <!-- END Part IV Title -->
      
    <!-- BEGIN Part IV Line Items -->  
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3" style="padding-top:0.5mm">10a</div>
        <div style="float:left; padding-top:0.5mm">
          Enter the fair market value of your PFIC stock at the end of the tax year
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            .......                                  
          </span>                    
          <div class="styIRS8621LNRightNumBox" style="height:4.5mm">10a</div>  
          <div class="styIRS8621LNAmountBox" style="height:4.5mm">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/FairMarketValueOfPFICStkAmt"/></xsl:call-template>
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
          <div class="styIRS8621LNRightNumBox">10b</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/AdjustedBasisInStockEndOfTYAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3">c</div>
        <div style="float:left">
          Subtract line 10b from line 10a. If a gain, do not complete lines 11 and 12. Include this amount
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"/>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"/>  
        </div>      
      </div>  
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3"/>
        <div style="float:left">
          <span style="width:7mm;"/>as ordinary income on your tax return. If a loss, go to line 11
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            ............                          
          </span>                    
          <div class="styIRS8621LNRightNumBox">10c</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ExcessAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>    
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3">11</div>
        <div style="float:left">
          Enter any unreversed inclusions (as defined in section 1296(d)). 
        </div>  
        <div style="float:right">  
          <span class="styIRS8621DotLn">      
            ..........                                                
          </span>                
          <div class="styIRS8621LNRightNumBox">11</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/UnreversedInclusionsAmt"/></xsl:call-template>
          </div>  
        </div>          
      </div>  
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3">12</div>
        <div style="float:left">
          Enter the loss from line 10c, but only to the extent of the unreversed inclusions on line 11.
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"/>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"/>  
        </div>      
      </div>  
            
      
     <div class="styIRS8621Item">
        <div class="styIRS8621Part3"/>
        <div style="float:left">
          <span style="width:7mm;"/>Include this amount as an ordinary loss on your tax return 
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            ............                         
          </span>                    
          <div class="styIRS8621LNRightNumBox">12</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ExcessOrUnreservedInclsnAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>          
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3">13</div>
        <div style="float:left">
        <b>  If you sold or otherwise disposed of any section 1296 stock (see instructions) during </b>
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"/>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"/>  
        </div>      
      </div>  
            
     <div class="styIRS8621Item">
        <div class="styIRS8621Part3"/>
        <div style="float:left">
        <span style="width:6mm;"/><b>the tax year:</b>
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"/>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"/>  
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
          <div class="styIRS8621LNRightNumBox">13a</div>  
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
          <div class="styIRS8621LNRightNumBox">13b</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/AdjBasisStkOnDtSaleOrDisposAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>

<div class="styIRS8621Item">
        <div class="styIRS8621Part3">c</div>
        <div style="float:left">
          Subtract line 13b from line 13a. If a gain, do not complete line 14. Include this amount as 
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"/>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"/>  
        </div>      
      </div>  
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3"/>
        <div style="float:left">
          <span style="width:7mm;"/>ordinary income on your tax return. If a loss, go to line 14
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            .............                          
          </span>                    
          <div class="styIRS8621LNRightNumBox">13c</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/OrdinaryIncomeFromPFICStkAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>         
     
       <div class="styIRS8621Item">
        <div class="styIRS8621Part3" style="padding-top:0.5mm">14a</div>
        <div style="float:left; padding-top:0.5mm">
          Enter any unreversed inclusions (as defined in section 1296(d))
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            ..........                                  
          </span>                    
          <div class="styIRS8621LNRightNumBox" style="height:4.5mm">14a</div>  
          <div class="styIRS8621LNAmountBox" style="height:4.5mm">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/StkSaleUnreversedInclusionsAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>

     
     <div class="styIRS8621Item">
        <div class="styIRS8621Part3">b</div>
        <div style="float:left">
          Enter the loss from line 13c, but only to the extent of unreversed inclusions on line 14a. Include 
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"/>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"/>  
        </div>      
      </div>  
<div class="styIRS8621Item">
<div class="styIRS8621Part3"/>
        <div style="float:left">
          <span style="width:7mm;"/>this amount as an ordinary loss on your tax return. If the loss on line 13c exceeds unreversed 
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"/>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"/>  
        </div>      
      </div>        
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3"/>
        <div style="float:left">
          <span style="width:7mm;"/>inclusions on line 14a, complete line 14c
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            ...................                          
          </span>                    
          <div class="styIRS8621LNRightNumBox">14b</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/LossLimitedByOrdinaryIncomeAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>         

     <div class="styIRS8621Item">
        <div class="styIRS8621Part3">c</div>
        <div style="float:left">
          Enter the amount by which the loss on line 13c exceeds unreversed inclusions on line 14a.  
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"/>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"/>  
        </div>      
      </div>  
<div class="styIRS8621Item">
<div class="styIRS8621Part3"/>
        <div style="float:left">
          <span style="width:7mm;"/>Include this amount on your tax return according to the rules generally applicable for losses 
        </div>  
        <div style="float:right">            
          <div class="styIRS8621LNRightNumBox" style="border-bottom:0"/>  
          <div class="styIRS8621LNAmountBox" style="border-bottom:0"/>  
        </div>      
      </div>        
      
      <div class="styIRS8621Item">
        <div class="styIRS8621Part3"/>
        <div style="float:left">
          <span style="width:7mm;"/>provided elsewhere in the Code and regulations
        </div>  
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            ................                          
          </span>                    
          <div class="styIRS8621LNRightNumBox">14c</div>  
          <div class="styIRS8621LNAmountBox">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/LossExcessOfUnrvrsdInclsnAmt"/></xsl:call-template>
          </div>  
        </div>      
      </div>         
     
      <div class="styIRS8621Item" style="border-bottom:2 solid black">
        <div class="styIRS8621Part3"/>
        <div style="float:left">
          <span style="width:6mm;"/><b>Note:</b>See instructions in case of multiple dispositions.
        </div>      
        <div style="float:right">            

        </div>      
      </div>

    <!-- END Part IV Line Items -->  

    <div style="width:187mm; border-top:1px solid black;font-size:7pt; page-break-after:always">    
      <div style="float:left; font-size:8pt">
        <span style="width:1mm;"/>
      </div>    
      <div style="float:right">
        <span style="width:15mm"/>
        Form <b style="font-size:10pt">8621</b> (Rev. 12-2015)
      </div>      
    </div>    
    
    <div style="width:187mm; font-size:7pt">    
      <div style="float:left; font-size:8pt">
        Form 8621 (Rev. 12-2015)
      </div>    
      <div style="float:right">        
        Page <b style="font-size:9pt">3</b>
      </div>      
    </div>    
    
    <!-- BEGIN Part V Title -->  
      
      <xsl:variable name="part4Count" select="count($Form8621Data/DistriAndDisposOfStockTyp)"/>
      <xsl:variable name="containerHeight" select="1"/>  
      
      <div class="styIRS8621BB" style="height:8mm; border-top:1px solid black">
        <div class="styTitleName" style="width:13mm; font-size:10pt">Part V</div>
        <div class="styTitleDesc" style="font-size:10pt">
          Distributions From and Dispositions of Stock of a Section 1291 Fund <span class="styNormalText">(See instructions.)</span><br/><span class="styNormalText"><i>Complete a  <b>separate</b> </i><span style="width:1mm;"/> <i>Part V for each excess distribution (see instructions).</i></span>          
        </div>          
        <div style="float:right; vertical-align:bottom; padding-top:5mm">                      
          <!-- button display logic -->          
          <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDisposOfStockTyp"/>
              <xsl:with-param name="containerHeight" select="$containerHeight"/>
						<xsl:with-param name="headerHeight" select="4"/>
              <xsl:with-param name="containerID" select="'part5TPctn'"/>
          </xsl:call-template>               
           <!-- end button display logic -->                    
        </div>                
      </div>        
    <!-- END Part V Title -->
    
    <!-- BEGIN Part V Line Items -->        
      <div class="styIRS8621TableContainer" id="part5TPctn">    
        <xsl:attribute name="style">  
          <xsl:if test="$part4Count &gt; $containerHeight">
            height:121mm;  
          </xsl:if>
        </xsl:attribute>                           
        <!-- print logic -->
        <xsl:call-template name="SetInitialState"/>
        <!-- end -->  
        <table class="styIRS8621Table" cellspacing="0" cellpadding="0" border="0" style="font-size:9pt">
          <!-- Display all rows when the Print parameter is not Separated. If the Print parameter is Separated, but -->
          <!-- there is only one Part IV, then also display all rows -->
          <xsl:if test="($Print != $Separated) or (count($Form8621Data/DistriAndDisposOfStockTyp) = 1) or (count($Form8621Data/DistriAndDisposOfStockTyp) = 0)">                                
            <xsl:call-template name="part4Tamplate">                          
              <xsl:with-param name="max">
                <xsl:choose>
                  <xsl:when test="$part4Count &gt; $containerHeight">     
                    <xsl:value-of select="$part4Count"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$containerHeight"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <!-- When the Print parameter is Separated and there is more than one Part V, then display a blank section -->
          <!-- and direct the user to the addtional data table -->
          <xsl:if test="($Print = $Separated) and (count($Form8621Data/DistriAndDisposOfStockTyp) &gt; 1)">
            <xsl:call-template name="part4Tamplate">
              <xsl:with-param name="index" select="0"/>                        
              <xsl:with-param name="max" select="0"/>
            </xsl:call-template>
          </xsl:if>  
        </table>
      </div>  
          
    <!-- END Part V Line Items -->  

    <!-- BEGIN Part VI Title -->  
    <!--  <div class="styIRS8621BB" style="height:4mm; border-top:2 solid black">-->
      <div class="styIRS8621BB" style="height:13mm; border-top:1px solid black; border-bottom:0px; width:187mm">
        <div class="styTitleName" style="width:12mm; font-size:10pt">Part VI</div>
        <div class="styTitleDesc" style="font-size:10pt">Status of Prior Year Section 1294 Elections and Termination of Section 1294 Elections<br/><span class="styNormalText" style="font-style: italic;">Complete a separate column for each outstanding election. Complete lines 25 and 26 only if there is a</span><br/><span class="styNormalText" style="font-style: italic;">partial termination of the section 1294 election.</span></div>        
      </div>
    <!-- END Part VI Title -->
    
    <!-- BEGIN Part VI Line Items -->
    <!-- Display all repeating elements when the Print parameter is not Separated. If the Print parameter is Separated, but -->
    <!-- there are fewer Part VI repeating elements than the container height, then also display all elements -->
    <xsl:if test="($Print != $Separated) or (count($Form8621Data/ElectionStatus) &lt;= 6)">
      <xsl:variable name="ESCount" select="count($Form8621Data/ElectionStatus)"/>
      <xsl:variable name="preMax">
        <xsl:choose>
             <xsl:when test="$ESCount mod 6 = 0">     
            <xsl:value-of select="$ESCount div 6"/>
             </xsl:when>
             <xsl:otherwise>
                <xsl:value-of select="ceiling($ESCount div 6)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      
      <xsl:call-template name="part5Loop">
        <xsl:with-param name="ESCount" select="$ESCount"/>        
        <xsl:with-param name="max">
          <xsl:choose>
               <xsl:when test="$preMax = 0">     
              <xsl:value-of select="1"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="$preMax"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="($Print = $Separated) and (count($Form8621Data/ElectionStatus) &gt; 6)">
      <xsl:call-template name="part5Loop">
        <xsl:with-param name="index" select="0"/>                        
        <xsl:with-param name="max" select="0"/>
      </xsl:call-template>
    </xsl:if>
    <!-- END Part VI Line Items -->  
    
    <div style="width:187mm; border-top:1px solid black;font-size:7pt">            
        <div style="float:right">          
          Form <b style="font-size:10pt">8621</b> (Rev. 12-2015)
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
          <xsl:with-param name="TargetNode" select="$Form8621Data"/>        
        </xsl:call-template>
      </table>
      
      <!-- Additional Data Table for Separated Data from Part V -->
      <xsl:if test="($Print = $Separated) and (count($Form8621Data/DistriAndDisposOfStockTyp) &gt; 1)">
        <span class="styRepeatingDataTitle">
          <br/>Form 8621, Part V - Distributions From and Dispositions of Stock of a Section 1291 Fund:
        </span>
        <xsl:for-each select="$Form8621Data/DistriAndDisposOfStockTyp">
          <table class="styDepTbl" style="font-size:7pt">
            <thead class="styTableHead">
              <tr class="styDepTblHdr">
                <th class="styDepTblCell"><span style="width:1mm;"/></th>
                <th class="styDepTblCell"><span style="width:1mm;"/></th>
                <th class="styDepTblCell"><span style="width:1mm;"/></th>
                <th class="styDepTblCell"><span style="width:1mm;"/></th>
              </tr>
            </thead>
            <tfoot/>
            <tbody>
              <!-- Line 15a -->
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">15a</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
	                Enter your total distributions from the section 1291 fund during the current tax year with respect <br/>to the
	              applicable stock. If the holding period of the stock began in the current tax year, see 
	              <div style="float:left">instructions</div>
	              <div style="float:right"><span class="styIRS8621DotLn">..............................</span></div>                 
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">15a</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TotalPFICDistriDurCurrTYAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 15b -->
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">b</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  Enter the total distributions (reduced by the portions of such distributions that were excess<br/>
                  distributions but not included in income under section 1291(a)(1)(B)) made by the fund with<br/>
                  respect to the applicable stock for each of the 3 years preceding the current tax year (or if 
                  <div style="float:left">shorter, the portion of the shareholder's holding period before the current tax year)</div>
                  <div style="float:right"><span class="styIRS8621DotLn">.....</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">15b</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="DistributionsIn3PrecedingTYAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 15c -->
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">c</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  <div style="float:left">Divide line 15b by 3. (See instructions if the number of preceding tax years is less than 3.)</div>
                  <div style="float:right"><span class="styIRS8621DotLn">..</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">15c</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AverageDistribution3PrecTYAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 15d -->
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">d</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                	<div style="float:left">Multiply line 15c by 125% (1.25)</div>
                  	<div style="float:right;"><span class="styIRS8621DotLn">......................</span></div>                  
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">15d</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AverageDistri3PrevTY125PctAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 15e -->
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">e</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  	Subtract line 15d from line 15a. This amount, if more than zero, is the excess distribution with <br/>respect to zero or less and you did not 			
                  	dispose of stock during the tax year, <b>do not</b> complete <br/>the rest of Part  V. See instructions if you received more than one distribution 			
                  	during the current 
		        <div style="float:left;">
		         tax year
		        </div>
		        <div style="float:right">
		          <span class="styIRS8621DotLn">      
		            ..............................                                                          
		          </span>
		        </div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">15e</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TotalExcessDistributionAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 15f -->
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">f</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  Enter gain or loss from the disposition of stock of a section 1291 fund or former section 1291
                  <div style="float:left">fund. If a gain, complete line 16. If a loss, show it in brackets and <b>do not</b> complete line 16</div>
                  <div style="float:right"><span class="styIRS8621DotLn">.</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">15f</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="GainLossFromDisposOfStkAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 16a -->
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">16a</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  Attach a statement for each distribution and disposition. Show your holding period for each<br/>
                  share of stock or block of shares held. Allocate the excess distribution to each day in your<br/>
                  holding period. Add all amounts that are allocated to days in each tax year.
                </td>                
                <td class="styDepTblCell" style="width:5mm;background-color:lightgrey;border-bottom:0"/>  
                <td class="styDepTblCell" style="width:34mm;background-color:lightgrey;border-bottom:0"/>
              </tr>
              <!-- Line 16b -->
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold;border-bottom:0;padding-bottom:0">b</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;border-bottom:0;padding-bottom:0">
                  Enter the total of the amounts determined in line 16a that are allocable to the current tax year<br/>
                  and tax years before the foreign corporation became a PFIC (pre-PFIC tax years). Enter these
                </td>                
                <td class="styDepTblCell" style="width:5mm;background-color:lightgrey;border-top:0;padding-bottom:0"/>  
                <td class="styDepTblCell" style="width:34mm;background-color:lightgrey;border-top:0;padding-bottom:0"/>
              </tr>
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold;border-top:0;padding-top:0"/>
                <td class="styDepTblCell" style="text-align:left;width:138mm;border-top:0;padding-top:0">
                  <div style="float:left">amounts on your income tax return as other income</div>
                  <div style="float:right"><span class="styIRS8621DotLn">..............</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold;padding-top:0">16b</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom;padding-top:0">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TotalAllcblCurrAndPrePFICTYAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 16c -->
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">c</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  Enter the aggregate increases in tax (before credits) for each tax year in your holding period
                  <div style="float:left">(other than the current tax year and pre-PFIC years). (See instructions.)</div>
                  <div style="float:right"><span class="styIRS8621DotLn">........</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">16c</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AggregateIncreaseInTxEachTYAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 16d -->
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">d</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  <div style="float:left">Foreign tax credit. (See instructions.)</div>
                  <div style="float:right"><span class="styIRS8621DotLn">...................</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">16d</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="ForeignTaxCreditAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 16e -->
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">e</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  Subtract line 16d from line 16c. Enter this amount on your income tax return as "additional
                  <div style="float:left">tax." (See instructions.)</div>
                  <div style="float:right"><span class="styIRS8621DotLn">........................</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">16e</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AggregateIncrLessFrgnTxCrAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 16f -->
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" style="text-align:right;font-weight:bold">f</td>
                <td class="styDepTblCell" style="text-align:left;width:138mm;">
                  Determine interest on each net increase in tax determined on line 16e using the rates and
                  <div style="float:left">methods of section 6621. Enter the aggregate amount of interest here. (See instructions.)</div>
                  <div style="float:right"><span class="styIRS8621DotLn">..</span></div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold">16f</td>  
                <td class="styDepTblCell" style="text-align:right;width:34mm;vertical-align:bottom">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="InterestOnEachNetIncrInTaxAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
            </tbody>
          </table><br/>
        </xsl:for-each>
      </xsl:if>
      <!-- End of Part V Separated Data -->
      
      <!-- Additional Data Table for Separated Data from Part VI -->
      <xsl:if test="($Print = $Separated) and (count($Form8621Data/ElectionStatus) &gt; 6)">
        <span class="styRepeatingDataTitle">
          <br/>Form 8621, Part VI - Status of Prior Year Section 1294 Elections and Termination of Section 1294 Elections:
        </span>
        <xsl:for-each select="$Form8621Data/ElectionStatus">
          <xsl:variable name="pos" select="position()"/>
          <xsl:if test="$pos mod 6 = 1">
            <table class="styDepTbl" style="font-size:7pt">
              <thead class="styTableThead">
                <!-- Header row -->
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" style="border-right:0"/>
                  <th class="styDepTblCell" style="border-left:0"/>
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
              <tfoot/>
              <tbody>
                <!-- Line 17 -->
                <tr class="styDepTblRow1">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">17</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Tax year of outstanding election
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:center">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/OutstandingElectionTaxYr"/>
                      </xsl:call-template>          
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:center">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/OutstandingElectionTaxYr"/>
                      </xsl:call-template>          
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:center">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/OutstandingElectionTaxYr"/>
                      </xsl:call-template>          
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:center">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/OutstandingElectionTaxYr"/>
                      </xsl:call-template>          
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:center">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/OutstandingElectionTaxYr"/>
                      </xsl:call-template>          
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:center">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/OutstandingElectionTaxYr"/>
                      </xsl:call-template>       
                  </td>
                </tr>
                <!-- Line 18 -->
                <tr class="styDepTblRow2">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">18</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Undistributed earnings to which the election relates
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/UndistributedEarningsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/UndistributedEarningsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/UndistributedEarningsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/UndistributedEarningsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/UndistributedEarningsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/UndistributedEarningsAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 19 -->
                <tr class="styDepTblRow1">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;vertical-align:bottom;font-weight:bold;border-right:0">19</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    <br/><div style="float:left">Deferred tax</div>
                    <div style="float:right"><span class="styIRS8621DotLn">....</span></div>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/DeferredTaxAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/DeferredTaxAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/DeferredTaxAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/DeferredTaxAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/DeferredTaxAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/DeferredTaxAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 20 -->
                <tr class="styDepTblRow2">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">20</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Interest accrued on deferred tax (line 19) as of the filing date
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/InterestAccruedOnDefrdTaxAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/InterestAccruedOnDefrdTaxAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/InterestAccruedOnDefrdTaxAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/InterestAccruedOnDefrdTaxAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/InterestAccruedOnDefrdTaxAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/InterestAccruedOnDefrdTaxAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 21 -->
                <tr class="styDepTblRow1">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">21</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Event terminating election
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/EventTerminatingElectionTxt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/EventTerminatingElectionTxt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/EventTerminatingElectionTxt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/EventTerminatingElectionTxt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/EventTerminatingElectionTxt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/EventTerminatingElectionTxt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 22 -->
                <tr class="styDepTblRow2">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">22</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Earnings distributed or deemed distributed during the tax year
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/EarningsDistributedDurTheTYAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/EarningsDistributedDurTheTYAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/EarningsDistributedDurTheTYAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/EarningsDistributedDurTheTYAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/EarningsDistributedDurTheTYAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/EarningsDistributedDurTheTYAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 23 -->
                <tr class="styDepTblRow1">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">23</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;;border-left:0">
                    Deferred tax due with
                    <div style="float:left">this return</div>
                    <div style="float:right"><span class="styIRS8621DotLn">.....</span></div>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/DeferredTaxDueWithThisRetAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/DeferredTaxDueWithThisRetAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/DeferredTaxDueWithThisRetAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/DeferredTaxDueWithThisRetAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/DeferredTaxDueWithThisRetAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/DeferredTaxDueWithThisRetAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 24 -->
                <tr class="styDepTblRow2">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">24</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Accrued interest due
                    <div style="float:left">with this return</div>
                    <div style="float:right"><span class="styIRS8621DotLn">...</span></div>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/AccruedInterestDueThisRetAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/AccruedInterestDueThisRetAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/AccruedInterestDueThisRetAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/AccruedInterestDueThisRetAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/AccruedInterestDueThisRetAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/AccruedInterestDueThisRetAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 25 -->
                <tr class="styDepTblRow1">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">25</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Deferred tax outstanding after partial termination of election
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/DeferredTaxAfterPartialTermAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/DeferredTaxAfterPartialTermAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/DeferredTaxAfterPartialTermAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/DeferredTaxAfterPartialTermAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/DeferredTaxAfterPartialTermAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/DeferredTaxAfterPartialTermAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 26 -->
                <tr class="styDepTblRow2">
                  <td class="styDepTblCell" style="width:2mm;text-align:right;font-weight:bold;border-right:0">26</td>
                  <td class="styDepTblCell" style="width:47mm;text-align:left;border-left:0">
                    Interest accrued after partial termination
                    <div style="float:left">of election</div>
                    <div style="float:right"><span class="styIRS8621DotLn">....</span></div>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos]/InterestAccrAftrPartlTermAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+1]/InterestAccrAftrPartlTermAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+2]/InterestAccrAftrPartlTermAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+3]/InterestAccrAftrPartlTermAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+4]/InterestAccrAftrPartlTermAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="width:23mm;text-align:right;vertical-align:bottom;font-size:6pt">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$pos+5]/InterestAccrAftrPartlTermAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table><br/>
          </xsl:if>
        </xsl:for-each>
      </xsl:if>
      <!-- End of Part VI Separated Data -->
      
    </form>  
  </body>
</html>
</xsl:template>

<xsl:template name="part4Tamplate">
  <xsl:param name="index" select="1"/>  
  <xsl:param name="max"/>  
  <xsl:if test="$index &lt;= $max">    
    <tr>
      <td class="styIRS8621Part2" valign="top" style="height:12mm;padding-top:1mm">
        15a
      </td>
      <td style="height:12mm;width:138mm; padding-top:1mm" valign="top">
     		 Enter your total distributions from the section 1291 fund during the current tax year with respect <br/>to the
              applicable stock. If the holding period of the stock began in the current tax year, see 
              <div style="float:left">instructions</div>
              <div style="float:right"><span class="styIRS8621DotLn">............................</span></div>       
      </td>                
      <td class="styIRS8621LNRightNumBox" style="height:12mm;padding-top:8mm;" valign="bottom">
        15a
      </td>  
      <td class="styIRS8621TblLB" valign="bottom" style="height:12mm;width:31mm;">
        <xsl:if test="($Print = $Separated) and (count($Form8621Data/DistriAndDisposOfStockTyp) &gt; 1)">
          <span style="float:left">
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
            <xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDisposOfStockTyp"/>
            <xsl:with-param name="ShortMessage" select="'true'"/>
          </xsl:call-template>
          </span>
        </xsl:if>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDisposOfStockTyp[$index]/TotalPFICDistriDurCurrTYAmt"/>
        </xsl:call-template>
      </td>  
    </tr>  
    
    <tr>
      <td class="styIRS8621Part2" style="height:15mm;" valign="top">b</td>     
      
      <td valign="top" style="height:15mm;">
     		 Enter the total distributions (reduced by the portions of such distributions that were excess<br/>
              distributions but not included in income under section 1291(a)(1)(B)) made by the fund with<br/>
              respect to the applicable stock for each of the 3 years preceding the current tax year (or if 
              <div style="float:left">shorter, the portion of the shareholder's holding period before the current tax year)</div>
              <div style="float:right"><span class="styIRS8621DotLn">.....</span></div>         
      </td>                
      <td class="styIRS8621LNRightNumBox" style="height:15mm;padding-top:11.5mm;" valign="bottom">
        15b
      </td>  
      <td class="styIRS8621TblLB" style="height:15mm;" valign="bottom">
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDisposOfStockTyp[$index]/DistributionsIn3PrecedingTYAmt"/></xsl:call-template>
      </td>  
    </tr>  
    
    <tr>
      <td class="styIRS8621Part2" style="height:4mm;" valign="top">c</td>
      <td valign="top" style="height:4mm;padding-top:0.25mm;">
        <div style="float:left">
          Divide line 15b by 3. (See instructions if the number of preceding tax years is less than 3.)
        </div>      
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            .                                        
          </span>
        </div>        
      </td>                
      <td class="styIRS8621LNRightNumBox" style="height:4mm;padding-top:0.5mm;">
        15c
      </td>  
      <td class="styIRS8621TblLB" style="height:4mm;" valign="bottom">
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDisposOfStockTyp[$index]/AverageDistribution3PrecTYAmt"/></xsl:call-template>
      </td>  
    </tr>
    
    <tr>              
      <td class="styIRS8621Part2" style="height:4mm;" valign="top">d</td>
      <td valign="top" style="height:4mm;" >
       	<div style="float:left;font-family:'Arial Narrow'; font-size:10pt">Multiply line 15c by 125% (1.25)</div>
             <div style="float:right;"><span class="styIRS8621DotLn">......................</span></div>
      </td>                      
      <td class="styIRS8621LNRightNumBox" style="height:4mm;" >
        15d
      </td>  
      <td class="styIRS8621TblLB" style="height:4mm;" >
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDisposOfStockTyp[$index]/AverageDistri3PrevTY125PctAmt"/></xsl:call-template>
      </td>                
    </tr>
        
    <tr>
      <td class="styIRS8621Part2" style="height:18.5mm;" valign="top">e</td>
      <td valign="top" style="height:18.5mm;">  		
        Subtract line 15d from line 15a. This amount, if more than zero, is the excess distribution with respect to the applicable stock. 
        If there is an excess distribution, complete line 16.  If zero or <br/>less and you did not dispose of stock during the tax 
        year, <b>do not</b> complete the rest of Part  V. <br/>See instructions if you received more than one 
        distribution during the current tax year. Also, <br/>see instructions for rules for reporting a nonexcess distribution on your income tax return
             <div style="float:right;"><span class="styIRS8621DotLn">...</span></div>
      </td>                
      <td class="styIRS8621LNRightNumBox" style="height:18.5mm;padding-top:14.5mm;">
        15e
      </td>  
      <td class="styIRS8621TblLB" valign="bottom" style="height:18.5mm;">
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDisposOfStockTyp[$index]/TotalExcessDistributionAmt"/></xsl:call-template>
      </td>  
    </tr>      
    
    <tr>
      <td class="styIRS8621Part2" style="height:8mm;" valign="top">f</td>
      <td valign="top" style="height:8mm;">
        Enter gain or loss from the disposition of stock of a section 1291 fund or former section 1291
        <div style="float:left">
          fund. If a gain, complete line 16. If a loss, show it in brackets and <b>do not</b> complete line 16                                            
        </div>
        <div style="float:right">
          <span class="styIRS8621DotLn">      
            .                                                                                            
          </span>
        </div>
      </td>                
      <td class="styIRS8621LNRightNumBox" style="height:8mm;padding-top:4mm;">
        15f
      </td>  
      <td class="styIRS8621TblLB" style="height:8mm;" valign="bottom">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDisposOfStockTyp[$index]/GainLossFromDisposOfStkAmt"/>
        </xsl:call-template>
      </td>  
    </tr>  
    
    <tr>
      <td class="styIRS8621Part2" style="height:15mm;" valign="top">16a</td>
      <td valign="top" style="height:15mm;" >
        If there is a positive amount on line 15e or 15f (or both), attach a statement for each distribution and disposition. Show your holding period for each
        share of stock or block of shares held. Allocate the excess distribution to each day in your
        holding period. Add all amounts that are allocated to days in each tax year.      
      </td>                
      <td class="styIRS8621LNRightNumBoxNBB" style="height:15mm; background-color:lightgrey"><span style="width:1mm;"/></td>  
      <td class="styIRS8621TblLB" style="border-bottom:0; height:15mm; background-color:lightgrey"><span style="width:1mm;"/></td>  
    </tr>  
    
    <tr>
      <td class="styIRS8621Part2" style="height:8mm;" valign="top">b</td>
      <td valign="top" style="height:8mm;" >
        Enter the total of the amounts determined in line 16a that are allocable to the current tax year<br/>and tax years before the foreign corporation became a PFIC (pre-PFIC tax years). Enter these</td>
      <td class="styIRS8621LNRightNumBoxNBB" style="height:8mm;background-color:lightgrey"><span style="width:1mm;"/></td>  
      <td class="styIRS8621TblLB" style="height:8mm;border-bottom:0; background-color:lightgrey"><span style="width:1mm;"/></td>                                
    </tr>    
    
    <tr>
      <td class="styIRS8621Part2"/>
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
        16b
      </td>  
      <td class="styIRS8621TblLB">
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDisposOfStockTyp[$index]/TotalAllcblCurrAndPrePFICTYAmt"/></xsl:call-template>
      </td>  
    </tr>
    
    <tr>
      <td class="styIRS8621Part2" style="height:8mm;" valign="top">c</td>
      <td valign="top" style="height:8mm;">
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
      <td class="styIRS8621LNRightNumBox" style="height:8mm;padding-top:4mm;">
        16c
      </td>  
      <td class="styIRS8621TblLB" style="height:8mm;" valign="bottom">
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDisposOfStockTyp[$index]/AggregateIncreaseInTxEachTYAmt"/></xsl:call-template>
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
        16d
      </td>  
      <td class="styIRS8621TblLB">
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDisposOfStockTyp[$index]/ForeignTaxCreditAmt"/></xsl:call-template>
      </td>  
    </tr>      
    
    <tr>
      <td class="styIRS8621Part2" style="height:8mm;" valign="top">e</td>
      <td valign="top" style="height:8mm;">
        Subtract line 16d from line 16c. Enter this amount on your income tax return as "additional
        <div style="float:left">
          tax." (See instructions.)    
        </div>      
        <div style="float:right">        
          <span class="styIRS8621DotLn">      
            ........................                                                                        
          </span>
        </div>
      </td>                
      <td class="styIRS8621LNRightNumBox" style="height:8mm;padding-top:4mm;">
        16e
      </td>  
      <td class="styIRS8621TblLB" style="height:8mm;" valign="bottom">
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDisposOfStockTyp[$index]/AggregateIncrLessFrgnTxCrAmt"/></xsl:call-template>
      </td>  
    </tr>      
    
    <tr>
      <td class="styIRS8621Part2" valign="top" style="height:8mm;border-bottom:1px solid black">f</td>
      <td style="height:8mm;border-bottom:1px solid black" valign="top">
        Determine interest on each net increase in tax determined on line 16e using the rates and        
        <div style="float:left">
          methods of section 6621. Enter the aggregate amount of interest here. (See instructions.)    
        </div>
        <div style="float:right">
          <span class="styIRS8621DotLn">..</span>
        </div>
      </td>                
      <td class="styIRS8621LNRightNumBox" style="height:8mm;padding-top:4mm;">        
        16f
      </td>  
      <td class="styIRS8621TblLB" style="height:8mm;" valign="bottom">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8621Data/DistriAndDisposOfStockTyp[$index]/InterestOnEachNetIncrInTaxAmt"/>
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
  <xsl:param name="ESCount"/>  
  <xsl:param name="index" select="1"/>
  <xsl:param name="max"/>  
    
  <xsl:if test="$index &lt;= $max">    
    <table style="clear:both; width:187mm; font-size:7pt; border-top:1px solid black; border-bottom:2 solid black" cellpadding="0" cellspacing="0">
      <thead class="styTableThead">
        <tr style="font-size:8pt">
          <th/><th/>
          <th class="styIRS8621P5Th" scope="col">
            <xsl:choose>
              <xsl:when test="($Form8621Data/ElectionStatus[$index*6-5]) or ($index*6-5 = 1)">
                (<xsl:number value="$index*6-5" format="i"/>)              
              </xsl:when> 
              <xsl:otherwise>
                  <span style="width:1mm;"/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$index=0 and $max=0">
              <xsl:number value="1" format="i"/>
            </xsl:if>
          </th>
          <th class="styIRS8621P5Th" scope="col">
            <xsl:choose>
              <xsl:when test="($Form8621Data/ElectionStatus[$index*6-4]) or ($index*6-4 = 2)">
                (<xsl:number value="$index*6-4" format="i"/>)
              </xsl:when>   
              <xsl:otherwise>
                  <span style="width:1mm;"/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$index=0 and $max=0">
              <xsl:number value="2" format="i"/>
            </xsl:if>
          </th>
          <th class="styIRS8621P5Th" scope="col">
            <xsl:choose>  
              <xsl:when test="($Form8621Data/ElectionStatus[$index*6-3]) or ($index*6-3 = 3)">
                (<xsl:number value="$index*6-3" format="i"/>)
              </xsl:when>     
              <xsl:otherwise>
                  <span style="width:1mm;"/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$index=0 and $max=0">
              <xsl:number value="3" format="i"/>
            </xsl:if>
          </th>
          <th class="styIRS8621P5Th" scope="col">
            <xsl:choose>
              <xsl:when test="($Form8621Data/ElectionStatus[$index*6-2]) or ($index*6-2 = 4)">
                (<xsl:number value="$index*6-2" format="i"/>)
              </xsl:when>   
              <xsl:otherwise>
                  <span style="width:1mm;"/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$index=0 and $max=0">
              <xsl:number value="4" format="i"/>
            </xsl:if>   
          </th>
          <th class="styIRS8621P5Th" scope="col">
            <xsl:choose>
              <xsl:when test="($Form8621Data/ElectionStatus[$index*6-1]) or ($index*6-1 = 5)">
                (<xsl:number value="$index*6-1" format="i"/>)
              </xsl:when>     
              <xsl:otherwise>
                  <span style="width:1mm;"/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$index=0 and $max=0">
              <xsl:number value="5" format="i"/>
            </xsl:if>   
          </th>
          <th class="styIRS8621P5Th" scope="col">
            <xsl:choose>
              <xsl:when test="($Form8621Data/ElectionStatus[$index*6]) or ($index*6 = 6)">
                (<xsl:number value="$index*6" format="i"/>)
              </xsl:when>   
              <xsl:otherwise>
                <span style="width:1mm;"/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$index=0 and $max=0">
              <xsl:number value="6" format="i"/>
            </xsl:if>
          </th>
        </tr>
      </thead>    
      <tfoot/>
      <tbody>    
        <tr style="font-size:8pt">
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt">17</th>
          <th style="text-align:left; vertical-align:top; font-weight:normal; font-size:9pt" scope="row" nowrap="nowrap">
            Tax year of outstanding<br/>election
          </th>
          <td class="styIRS8621P5Td" style="text-align:center">
              <xsl:choose>
                <xsl:when test="$index=0 and $max=0">
                  <xsl:call-template name="PopulateAdditionalDataTableMessage">
                    <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus"/>
                    <xsl:with-param name="ShortMessage" select="'true'"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/OutstandingElectionTaxYr"/>   
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
          </td>
          <td class="styIRS8621P5Td" style="text-align:center">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/OutstandingElectionTaxYr"/></xsl:call-template>
          </td>
          <td class="styIRS8621P5Td" style="text-align:center">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/OutstandingElectionTaxYr"/></xsl:call-template>
          </td>
          <td class="styIRS8621P5Td" style="text-align:center">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/OutstandingElectionTaxYr"/></xsl:call-template>
          </td>
          <td class="styIRS8621P5Td" style="text-align:center">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/OutstandingElectionTaxYr"/></xsl:call-template>
          </td>
          <td class="styIRS8621P5Td" style="text-align:center">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/OutstandingElectionTaxYr"/></xsl:call-template>
          </td>
        </tr>
        <tr>
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt">18</th>
          <th style="text-align:left; vertical-align:top; font-weight:normal; font-size:9pt" scope="row" nowrap="nowrap">
            Undistributed earnings to<br/>which the election relates
          </th>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/UndistributedEarningsAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/UndistributedEarningsAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/UndistributedEarningsAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/UndistributedEarningsAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/UndistributedEarningsAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/UndistributedEarningsAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
        </tr>
        <tr>
          <th class="styIRS8621P5ItemNo" scope="row" style="height:4mm;font-size:9pt">19</th>
          <th style="height:4mm;text-align:left; vertical-align:top; font-weight:normal; font-size:9pt" scope="row" nowrap="nowrap">
            <div style="float:left">
              Deferred tax
            </div>
            <div style="float:right">
              <span class="styIRS8621DotLn">      
                .....                                      
              </span>    
            </div>    
          </th>
          <td class="styIRS8621P5Td" nowrap="nowrap" style="height:4mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/DeferredTaxAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap" style="height:4mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/DeferredTaxAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap" style="height:4mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/DeferredTaxAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap" style="height:4mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/DeferredTaxAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap" style="height:4mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/DeferredTaxAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap" style="height:4mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/DeferredTaxAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
        </tr>
        <tr>
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt; padding-top:0.5mm">20</th>
          <th style="text-align:left; vertical-align:top; font-weight:normal; font-family:'Arial Narrow'; font-size:9.5pt" scope="row" nowrap="nowrap">
            Interest accrued on deferred<br/>tax (line 19) as of the filing date
          </th>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/InterestAccruedOnDefrdTaxAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/InterestAccruedOnDefrdTaxAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/InterestAccruedOnDefrdTaxAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/InterestAccruedOnDefrdTaxAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/InterestAccruedOnDefrdTaxAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/InterestAccruedOnDefrdTaxAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
        </tr>        
        <tr>
          <th class="styIRS8621P5ItemNo" scope="row" style="height:4mm;font-size:9pt">21</th>
          <th style="height:4mm;text-align:left; vertical-align:top; font-weight:normal; font-size:9pt" scope="row" nowrap="nowrap">
            Event terminating election
          </th>
          <td class="styIRS8621P5Td" style="height:4mm;padding-left:0.5mm; text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/EventTerminatingElectionTxt"/></xsl:call-template>
          </td>
          <td class="styIRS8621P5Td" style="height:4mm;padding-left:0.5mm; text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/EventTerminatingElectionTxt"/></xsl:call-template>
          </td>
          <td class="styIRS8621P5Td" style="height:4mm;padding-left:0.5mm; text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/EventTerminatingElectionTxt"/></xsl:call-template>
          </td>
          <td class="styIRS8621P5Td" style="height:4mm;padding-left:0.5mm; text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/EventTerminatingElectionTxt"/></xsl:call-template>
          </td>
          <td class="styIRS8621P5Td" style="height:4mm;padding-left:0.5mm; text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/EventTerminatingElectionTxt"/></xsl:call-template>
          </td>
          <td class="styIRS8621P5Td" style="height:4mm;padding-left:0.5mm; text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/EventTerminatingElectionTxt"/></xsl:call-template>
          </td>
        </tr>
        <tr>
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt">22</th>
          <th style="text-align:left; vertical-align:top; font-weight:normal; font-family:'Arial Narrow'; font-size:9.5pt" scope="row" nowrap="nowrap">
            Earnings distributed or deemed<br/>distributed during the tax year
          </th>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/EarningsDistributedDurTheTYAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/EarningsDistributedDurTheTYAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/EarningsDistributedDurTheTYAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/EarningsDistributedDurTheTYAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/EarningsDistributedDurTheTYAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/EarningsDistributedDurTheTYAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
        </tr>
        <tr>
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt">23</th>
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
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/DeferredTaxDueWithThisRetAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/DeferredTaxDueWithThisRetAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/DeferredTaxDueWithThisRetAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/DeferredTaxDueWithThisRetAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/DeferredTaxDueWithThisRetAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/DeferredTaxDueWithThisRetAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
        </tr>
        <tr style="font-size:7pt">
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt">24</th>
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
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/AccruedInterestDueThisRetAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/AccruedInterestDueThisRetAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/AccruedInterestDueThisRetAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/AccruedInterestDueThisRetAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/AccruedInterestDueThisRetAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/AccruedInterestDueThisRetAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
        </tr>        
        <tr>
          <th class="styIRS8621P5ItemNo" style="background-color:white; font-size:9pt" scope="row">25</th>
          <th style="text-align:left; vertical-align:top; font-weight:normal; font-family:'Arial Narrow'; font-size:9.5pt" scope="row" nowrap="nowrap">
            Deferred tax outstanding after<br/>partial termination of election
          </th>
          <td class="styIRS8621P5Td" style="border-top:7 solid Lightgrey" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/DeferredTaxAfterPartialTermAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" style="border-top:7 solid Lightgrey" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/DeferredTaxAfterPartialTermAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" style="border-top:7 solid Lightgrey" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/DeferredTaxAfterPartialTermAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" style="border-top:7 solid Lightgrey" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/DeferredTaxAfterPartialTermAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" style="border-top:7 solid Lightgrey" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/DeferredTaxAfterPartialTermAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" style="border-top:7 solid Lightgrey" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/DeferredTaxAfterPartialTermAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
        </tr> 
        <tr style="font-size:7pt">
          <th class="styIRS8621P5ItemNo" scope="row" style="font-size:9pt">26</th>
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
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-5]/InterestAccrAftrPartlTermAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" style="border-bottom:0" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-4]/InterestAccrAftrPartlTermAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" style="border-bottom:0" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-3]/InterestAccrAftrPartlTermAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" style="border-bottom:0" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-2]/InterestAccrAftrPartlTermAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" style="border-bottom:0" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6-1]/InterestAccrAftrPartlTermAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
          <td class="styIRS8621P5Td" style="border-bottom:0" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8621Data/ElectionStatus[$index*6]/InterestAccrAftrPartlTermAmt"/></xsl:call-template><span style="width:1mm;"/>
          </td>
        </tr>
      </tbody>      
    </table>      
    <xsl:call-template name="part5Loop">
      <xsl:with-param name="index" select="$index+1"/>
      <xsl:with-param name="ESCount" select="$ESCount"/>      
      <xsl:with-param name="max" select="$max"/>
    </xsl:call-template>  
  </xsl:if>    
</xsl:template>

</xsl:stylesheet>