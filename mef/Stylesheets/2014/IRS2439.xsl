<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS2439Style.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>
<xsl:param name="Form2439Data" select="$RtnDoc/IRS2439"/>
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form2439Data)"/></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
  <meta name="Description" content="IRS Form 2439"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  <xsl:call-template name="InitJS"/>
  <style type="text/css">  
    <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS2439Style"/>        
      <xsl:call-template name="AddOnStyle"/>
    </xsl:if>
  </style>  
<xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass" style="width:187mm">
  <form name="Form2439">
    <!-- WARNING LINE -->
    <xsl:call-template name="DocumentHeader"/>
    <!-- Begin Void and Corrected Check Boxes -->
    <div class="styBB" style="width:187mm;">
      <span style="width:45mm;font-size: 10pt;"/>
      <input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form2439Data/VoidInd"/>
          <xsl:with-param name="BackupName">IRS2439VoidBoxIndicator</xsl:with-param>
        </xsl:call-template>
      </input> 
      <span style="width:4px;"/>
      <span style="width:25mm;font-size: 10pt;">
        <label>
          <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form2439Data/VoidInd"/>
          <xsl:with-param name="BackupName">IRS2439VoidBoxIndicator</xsl:with-param>
          </xsl:call-template> VOID
        </label>
     </span>
      <input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form2439Data/CorrectedInd"/>
          <xsl:with-param name="BackupName">IRS2439CorrectedBoxIndicator</xsl:with-param>
        </xsl:call-template>
      </input> 
            <span style="width:4px;"/>
      <span style="width:36mm;font-size: 10pt;">
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form2439Data/CorrectedInd"/>
            <xsl:with-param name="BackupName">IRS2439CorrectedBoxIndicator</xsl:with-param>
          </xsl:call-template>CORRECTED
        </label>
      </span>
      <!--<span style="font-size: 6pt;">(99)</span>-->
    </div>
    <!-- End Void and Corrected Check Boxes -->
    <!-- top half of form -->
    <div class="styBB" style="width:187mm;height:30.5mm;">
      <!-- Name and address box -->
      <div class="styIRS2439leftBox" style="width:87mm;height:30.5mm;padding-left:1mm;">
        <span style="font-size: 6pt">Name, address, and ZIP code of RIC or REIT</span>
        <br/>
 	<xsl:choose>
 		<xsl:when test="($Form2439Data/RegInvstCoOrReInvstTrustName)">
	 	  <xsl:call-template name="PopulateText">
	             <xsl:with-param name="TargetNode" select="$Form2439Data/RegInvstCoOrReInvstTrustName/BusinessNameLine1Txt"/>
	          </xsl:call-template>
	          <xsl:if test="$Form2439Data/RegInvstCoOrReInvstTrustName/BusinessNameLine2Txt != ''">
          		<br/>
          		<xsl:call-template name="PopulateText">
          		  <xsl:with-param name="TargetNode" select="$Form2439Data/RegInvstCoOrReInvstTrustName/BusinessNameLine2Txt"/>
          		</xsl:call-template>
        	  </xsl:if>
 		</xsl:when>
 		<xsl:otherwise>
		  <xsl:choose>
		    <xsl:when test="($RtnHdrData/Filer/PrimarySSN)">
		         <br/>
		         <xsl:call-template name="PopulateReturnHeaderFiler">
			   <xsl:with-param name="TargetNode">Name</xsl:with-param>
		         </xsl:call-template>
		        </xsl:when>
		    <xsl:otherwise>
		      <xsl:call-template name="PopulateReturnHeaderFiler">
			<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
		      </xsl:call-template>
		      <xsl:if test="$RtnHdrData/Filer/Name/BusinessNameLine2Txt!=''">
		        <br/>
	      	        <xsl:call-template name="PopulateReturnHeaderFiler">
			  <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
		        </xsl:call-template>				  
		      </xsl:if>
		    </xsl:otherwise>
		  </xsl:choose>
		</xsl:otherwise>
 	</xsl:choose>
        <xsl:choose>
        <!-- US Address -->
          <xsl:when test="$Form2439Data/RICOrREITUSAddress">
            <xsl:if test="$Form2439Data/RICOrREITUSAddress/AddressLine1Txt!='' ">
              <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RICOrREITUSAddress/AddressLine1Txt"/>
                </xsl:call-template>            
       <span class="styTableCellPad"/>
            </xsl:if>              
            <xsl:if test="$Form2439Data/RICOrREITUSAddress/AddressLine2Txt!=''">
              <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RICOrREITUSAddress/AddressLine2Txt"/>
                </xsl:call-template>            
              <span class="styTableCellPad"/>
            </xsl:if>              
            <xsl:if test="$Form2439Data/RICOrREITUSAddress/CityNm!=''">
              <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RICOrREITUSAddress/CityNm"/>
                </xsl:call-template>,              
                <span class="styTableCellPad"/>
            </xsl:if>    
            <xsl:if test="$Form2439Data/RICOrREITUSAddress/StateAbbreviationCd!=''">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RICOrREITUSAddress/StateAbbreviationCd"/>
                </xsl:call-template>
                <span class="styTableCellPad"/>
            </xsl:if>
            <br/>
            <xsl:if test="$Form2439Data/RICOrREITUSAddress/ZIPCd!=''">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RICOrREITUSAddress/ZIPCd"/>
                </xsl:call-template>
                <span class="styTableCellPad"/>
            </xsl:if>            
          </xsl:when>
            <!-- Foreign Address -->             
          <xsl:otherwise>
            <xsl:if test="$Form2439Data/RICOrREITForeignAddress/AddressLine1Txt!=''">
              <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RICOrREITForeignAddress/AddressLine1Txt"/>
                </xsl:call-template>            
              <span class="styTableCellPad"/>
            </xsl:if>  
            <xsl:if test="$Form2439Data/RICOrREITForeignAddress/AddressLine2Txt!=''">
              <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RICOrREITForeignAddress/AddressLine2Txt"/>
                </xsl:call-template>            
              <span class="styTableCellPad"/>
            </xsl:if>              
            <xsl:if test="$Form2439Data/RICOrREITForeignAddress/CityNm!=''">
            <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RICOrREITForeignAddress/CityNm"/>
                </xsl:call-template>,              
                <span class="styTableCellPad"/>
            </xsl:if>
            <xsl:if test="$Form2439Data/RICOrREITForeignAddress/ProvinceOrStateNm!=''">
               <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RICOrREITForeignAddress/ProvinceOrStateNm"/>
                </xsl:call-template>
                <span class="styTableCellPad"/>
            </xsl:if>
          <!-- foreign postal code -->                    
            <xsl:if test="$Form2439Data/RICOrREITForeignAddress/ForeignPostalCd!=''">
               <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RICOrREITForeignAddress/ForeignPostalCd"/>
                </xsl:call-template>
                <span class="styTableCellPad"/>
            </xsl:if>
            <br/> 
        <!-- foreign country -->    
               <xsl:if test="$Form2439Data/RICOrREITForeignAddress/CountryCd!=''">
              <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RICOrREITForeignAddress/CountryCd"/>
                </xsl:call-template>
                <span class="styTableCellPad"/>
            </xsl:if>
         </xsl:otherwise>
        </xsl:choose> 
      </div>
      <!-- Middle top Year and Form Box -->
      <div class="styIRS2439leftBox" style="width:25mm;height:30.5mm;text-align:center;">
        <span style="font-size: 6pt">OMB No. 1545-0145</span>
        <span style="padding-top:2mm;height:11mm;">
          <div class="styTY" style="font-size:26;">20<span class="styTYColor">14</span></div>
        </span>
        <span style="padding-top:2mm;height:8mm;">
          Form<span style="width:4px;"/><span class="styFN" style="font-size:13pt;font-weight:bold;">2439</span>
        </span>
      </div>
      <!--Right top  Form Title and Info box -->
      <div class="styIRS2439rightBox" style="width:75mm;height:30.5mm;text-align:center;">
        <!--<span style="width:4px;"/>--><span style="font-size:9pt;height:8mm;font-weight:bold;">Notice to Shareholder of Undistributed Long-Term Capital Gains</span>
        <br/>
        For calendar year 2014, or other tax year of the <br/>regulated investment company (RIC) or the<br/> 
        real estate investment trust (REIT)<br/>
        <span style="height:3mm;">beginning 
          <span style="width:18mm; border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
            <!-- begin date -->
             <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="$Form2439Data/TaxPeriodBeginDt"/>
            </xsl:call-template>
          </span>
          <!-- end date -->
           , and 
        </span><br/>
        <span style="padding-top:0.25mm;height:3mm;">ending 
          <span style="width:27mm; border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="$Form2439Data/TaxPeriodEndDt"/>
            </xsl:call-template>
          </span>
        </span>
      </div>
    </div>
    <!-- second half of form -->
    <div style="width:187mm;height:43mm;">
      <!-- Left boxes (Identification Number, Shareholder's ID) -->
      <div style="width:87mm;height:43mm;float:left;">
        <span class="styIRS2439leftBoxWithBottom" style="height:8mm;width:87mm;padding-left:1mm">
          <span style="font-size: 6pt;">Identification number of RIC or REIT</span>
         <xsl:choose>
	 <xsl:when test="$Form2439Data/RICOrREITEIN">
          <div style="width:85mm;text-align:center;padding-top:1.5mm;">
                <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="$Form2439Data/RICOrREITEIN"/>
                </xsl:call-template>
          </div>
         </xsl:when>
	 <xsl:when test="$Form2439Data/MissingEINReasonCd">
          <div style="width:85mm;text-align:center;padding-top:1.5mm;">
                  <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form2439Data/MissingEINReasonCd"/>
                    </xsl:call-template>
          </div>
         </xsl:when>
         <xsl:otherwise>
            <div style="text-align:center">
            <xsl:choose>
			  <xsl:when test="($RtnHdrData/Filer/PrimarySSN)">
              <div style="width:85mm;text-align:center;padding-top:1.5mm;">
				<xsl:call-template name="PopulateReturnHeaderFiler">
				  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
				</xsl:call-template>
			  </div>
			  </xsl:when>
			  <xsl:otherwise>
              <div style="width:85mm;text-align:center;padding-top:1.5mm;">
				<xsl:call-template name="PopulateReturnHeaderFiler">
				  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
				</xsl:call-template>
			  </div>
			  </xsl:otherwise>			  
  	    </xsl:choose>
  	    </div>
        </xsl:otherwise>
        </xsl:choose>
  	</span>
        <span class="styIRS2439leftBoxWithBottom" style="height:8mm;width:87mm;padding-left:1mm;">
          <span style="font-size: 6pt;">Shareholder's identifying number</span>
      <xsl:choose>
          <xsl:when test="$Form2439Data/ShareholderEIN">
            <div style="width:85mm;text-align:center;padding-top:2mm;">
            <xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderEIN"/>
            </xsl:call-template>
            </div>
          </xsl:when>
          <xsl:when test="$Form2439Data/ShareholderSSN">
            <div style="width:85mm;text-align:center;padding-top:2mm;">
            <xsl:call-template name="PopulateSSN">
              <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderSSN"/>
            </xsl:call-template>
            </div>
          </xsl:when>
          <xsl:otherwise>
            <div style="width:85mm;text-align:center;padding-top:2mm;">
            <xsl:call-template name="PopulateText">
                 <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderMissingEINReasonCd"/>
            </xsl:call-template>
            </div>
          </xsl:otherwise>
      </xsl:choose>
        </span>
         <!-- Shareholder name, address, and ZIP -->
        <span class="styIRS2439leftBoxWithBottom" style="height:30mm;width:87mm;padding-left:1mm">
          <span style="font-size: 6pt;">Shareholder's name, address, and ZIP code</span>
          <br/>
       <xsl:choose>
             <xsl:when test="$Form2439Data/ShareholderBusinessName">
          	<xsl:call-template name="PopulateText">
          	  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderBusinessName/BusinessNameLine1Txt"/>
          	</xsl:call-template>
          	<xsl:if test="$Form2439Data/ShareholderBusinessName/BusinessNameLine2Txt != ''">
            	   <br/>
            	   <xsl:call-template name="PopulateText">
            	     <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderBusinessName/BusinessNameLine2Txt"/>
            	   </xsl:call-template>
          	</xsl:if>
              </xsl:when>
           <xsl:otherwise>
           <!-- Shareholder's Person Name -->
           <xsl:if test="$Form2439Data/ShareholderPersonNm != ''">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderPersonNm"/>
                </xsl:call-template>            
           </xsl:if>
           </xsl:otherwise>           
       </xsl:choose>
       <xsl:choose>
        <!-- US Address -->
          <xsl:when test="$Form2439Data/ShareholderUSAddress">
            <xsl:if test="$Form2439Data/ShareholderUSAddress/AddressLine1Txt!='' ">
              <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderUSAddress/AddressLine1Txt"/>
                </xsl:call-template>            
              <span class="styTableCellPad"/>
            </xsl:if>              
            <xsl:if test="$Form2439Data/ShareholderUSAddress/AddressLine2Txt!='' ">
             <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderUSAddress/AddressLine2Txt"/>
                </xsl:call-template>            
              <span class="styTableCellPad"/>
            </xsl:if>   
            <xsl:if test="$Form2439Data/ShareholderUSAddress/CityNm!=''">
              <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderUSAddress/CityNm"/>
                </xsl:call-template>,              
                <span class="styTableCellPad"/>
            </xsl:if>
            <xsl:if test="$Form2439Data/ShareholderUSAddress/StateAbbreviationCd!=''">
              <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderUSAddress/StateAbbreviationCd"/>
                </xsl:call-template>
                <span class="styTableCellPad"/>
            </xsl:if>
            <br/>    
            <xsl:if test="$Form2439Data/ShareholderUSAddress/ZIPCd!=''">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderUSAddress/ZIPCd"/>
                </xsl:call-template>
                <span class="styTableCellPad"/>
            </xsl:if>            
          </xsl:when>          
          <xsl:otherwise>
            <!-- Shareholder's Foreign Address -->
            <xsl:if test="$Form2439Data/ShareholderForeignAddress/AddressLine1Txt!=''">
              <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderForeignAddress/AddressLine1Txt"/>
                </xsl:call-template>            
              <span class="styTableCellPad"/>
            </xsl:if>              
            <xsl:if test="$Form2439Data/ShareholderForeignAddress/AddressLine2Txt!=''">
            <br/><!--<span style="vertical-align:bottom;" valign="bottom"/>-->
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderForeignAddress/AddressLine2Txt"/>
                </xsl:call-template>            
              <span class="styTableCellPad"/>
            </xsl:if> 
            <xsl:if test="$Form2439Data/ShareholderForeignAddress/CityNm!=''">
            <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderForeignAddress/CityNm"/>
                </xsl:call-template>,              
                <span class="styTableCellPad"/>
            </xsl:if>
            <xsl:if test="$Form2439Data/ShareholderForeignAddress/ProvinceOrStateNm!=''">
                <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderForeignAddress/ProvinceOrStateNm"/>
                </xsl:call-template>
                <span class="styTableCellPad"/>
            </xsl:if>
             <xsl:if test="$Form2439Data/ShareholderForeignAddress/ForeignPostalCd!=''">
              <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderForeignAddress/ForeignPostalCd"/>
                </xsl:call-template>
                <span class="styTableCellPad"/>
            </xsl:if>
            <br/>     
            <xsl:if test="$Form2439Data/ShareholderForeignAddress/CountryCd!=''">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderForeignAddress/CountryCd"/>
                </xsl:call-template>
                <span class="styTableCellPad"/>
            </xsl:if>
           </xsl:otherwise>
        </xsl:choose> 
    </span>
      </div>
      <!-- Middle Boxes (1a, 1b, 1c,...) -->
      <div style="width:72mm;height:40mm;float:left;">
        <!--L1a -->
        <div style="width:72mm;;">
          <span class="styIRS2439leftBoxWithBottom" style="height:8mm;width:72mm;border-right-width:0px;">
            <span style="font-size: 6pt;font-weight:bold;padding-left:1mm">1a</span>
            <span style="font-size: 6pt;">Total undistributed long-term capital gains
              <!-- Push pin image -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form2439Data/TotalUndistributedLTCapGainAmt"/>
              </xsl:call-template>
            </span>
            <br/>
               <span style="width:71mm;text-align:right;padding-top:1.5mm;vertical-align:bottom;" valign="bottom">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2439Data/TotalUndistributedLTCapGainAmt"/>
              </xsl:call-template>
            </span>
          </span>
        </div>
        <!-- L1b -->
        <div style="width:72mm;float:left;">
          <span class="styIRS2439leftBoxWithBottom" style="height:8mm;width:72mm;float:left;">
            <span style="font-size: 6pt;font-weight:bold;padding-left:1mm">1b</span>
            <span style="font-size: 6pt;">Unrecaptured section 1250 gain</span>
            <br/>
            <!--<span style="width:145px;"/>-->
            <span style="width:71mm;text-align:right;padding-top:2mm;vertical-align:bottom;" valign="bottom">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2439Data/UnrecapturedSection1250GainAmt"/>
              </xsl:call-template>
            </span>
          </span>
        </div>
        <!-- L1c -->
        <div style="width:72mm;float:left;">
          <span class="styIRS2439leftBoxWithBottom" style="height:10mm;width:35.5mm;float:left;">
            <span style="font-size: 6pt;font-weight:bold;padding-left:1mm">1c</span>
            <span style="font-size: 6pt;">Section 1202 gain</span>
            <span style="width:34.5mm;text-align:right;padding-top:3mm;vertical-align:bottom" valign="bottom">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2439Data/CapitalGainSect1202Amt"/>
              </xsl:call-template>
            </span>
          </span>
          <!-- L1d -->
          <span class="styIRS2439leftBoxWithBottom" style="height:10mm;width:36.5mm;float:left;">
            <span style="font-size: 6pt;font-weight:bold;padding-left:1mm">1d</span>
            <span style="font-size: 6pt;">Collectibles (28%) gain</span>
            <span style="width:35mm;text-align:right;padding-top:3mm;vertical-align:bottom" valign="bottom">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2439Data/Collectibles28PercentGainAmt"/>
              </xsl:call-template>
            </span>
          </span>
        </div>
        <!--L2 -->
        <span class="styIRS2439leftBoxWithBottom" style="height:20mm;width:72mm;float:left;">
          <span style="font-size: 6pt;font-weight:bold;padding-left:1mm">2</span>
          <span style="font-size: 6pt;">Tax paid by the RIC or REIT on the box 1a gains</span>
            <br/>
            <span style="height:13.5mm;width:70mm;text-align:right;padding-top:13mm;vertical-align:bottom" valign="bottom">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form2439Data/TaxPaidByRICOrREITAmt"/>
            </xsl:call-template>
            </span>
        </span>
      </div>
      <!-- far right Stylesheet will always show only Copy B box as per customer request -->
      <div style="width:28mm;height:40mm;float:left;text-align:center;">
        <span class="styIRS2439rightBoxWithBottom" style="height:23mm;width:28mm;float:left;padding-bottom:.5mm;">
          <div style="font-size: 9pt;font-weight:bold;height:8mm;padding-top:2mm;">Copy A</div>
          <div style="padding-top:.5mm;padding-bottom:.5mm;">Attach to <br/>Form 1120-RIC <br/>
            or Form 1120-REIT
          </div>
        </span>
        <span class="styIRS2439rightBoxWithBottom" style="height:23mm;width:28mm;float:left;font-weight:bold;padding-top:1mm;">
          For Instructions <br/>
          and Paperwork
          Reduction Act
          Notice, see back of
          Copies A and D.        
        </span>
      </div>
    </div>
    <div style="height:5mm;width:187mm;padding-top:3mm;">
      <span style="width:2px;"/>
      <span style="font-size: 6pt;">Form</span>
      <span style="width:2px;"/>
      <span style="font-weight:bold;width:26mm">2439</span>
      <span style="width:53mm;font-size: 7pt;">Cat. No. 11858E</span>
      <a href="http://www.irs.gov/form2439" title="Link to IRS.gov">
      	<i>www.irs.gov/form2439</i>
       </a>
      <span style="width:7mm;font-size: 7pt;"/>      
      <span style="font-size: 6pt;">Department of the Treasury - Internal Revenue Service</span>
    </div>
  <!-- BEGIN Left Over Table -->  
  <!-- Additonal Data Title Bar and Button -->
  <div style="width:187mm;"/>  
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
      <xsl:with-param name="TargetNode" select="$Form2439Data"/>
      <xsl:with-param name="DescWidth" select="100"/>
    </xsl:call-template>          
  </table>
  <!-- END Left Over Table -->    
    </form>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>