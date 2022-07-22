<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="IRS8838Style.xsl"/>
<xsl:include href="AddOnTable.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:strip-space elements="*"/>
<xsl:param name="FormData" select="$RtnDoc/IRS8838"/>


<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>  
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"/></xsl:call-template></title>
  <!-- No Browser Caching  -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Description" content="Form IRS 8838"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
   <xsl:call-template name="GlobalStylesForm"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  <xsl:call-template name="InitJS"/>  
  <style type="text/css">    
    <xsl:if test="not($Print) or $Print=''">  
      <xsl:call-template name="IRS8838Style"/>
      <xsl:call-template name="AddOnStyle"/>  
    </xsl:if>
  </style>      
  
</head>

<body class="styBodyClass">
  <form name="Form8838">    
    <xsl:call-template name="DocumentHeader"/>  
    
  <!--Title of Form -->    
  <div class="styBB" style="width:187mm;height:20mm">
    <div class="styFNBox" style="width:28mm;font-size: 7pt;height:21mm;">
      Form <span class="styFormNumber">8838</span>      
      <br/>
      <span class="styAgency">
      (Rev.December 2012)
             <xsl:call-template name="SetFormLinkInline">
             <xsl:with-param name="TargetNode" select="$FormData"/>
             </xsl:call-template>
      </span>
      <br/>
      <span class="styAgency">Department of the Treasury</span><br/><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="width:122mm;height:14mm;">
      <div class="styMainTitle" style="height:8mm; font-size: 12pt">Consent To Extend the Time To Assess Tax Under<br/>Section 367&#8212; Gain Recognition Agreement</div>
     <div class="styFST" style="height:5mm;margin-left:3mm;font-weight:bold;padding-top:2mm;">
        <img src="{$ImagePath}/8838_Bullet_Sm.gif" alt="SmallBullet"/> 
        Attach to your income tax return.
      </div>
      <div class="styFST" style="height:5mm;font-size:6pt;">
                <img src="{$ImagePath}/8838_Bullet_Sm.gif" alt="bullet image"/>
                 Information about Form 8838 and it instructions is at  
                 <a href="http://www.irs.gov/form8838." title="Link to irs.gov">
                    <i>www.irs.gov/form8838 </i>

            </a>
              </div>
    </div>
    <div class="styTYBox" style="width:37mm; height: 9mm;padding-top:2mm; font-size:7pt;                                                    border-bottom-width:1px">OMB No. 1545-1395
    </div>
     <div class="styTYBox" style="width:37mm; height:12mm;padding-top:3mm; font-size:7pt;                                                     padding-left:4mm;text-align:left;">Attachment<br/>
                                                    Sequence No. <span style="font-weight:bold">145</span>        
    </div>

  </div>
  <!--  End title of Form  -->
      
  <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="width:125mm; height: 20mm;font-size: 7pt;">
      Name(s) of consenting taxpayer(s)<br/><br/>
      <div style="font-size: 6pt;font-family:verdana;">
        <xsl:choose>
          <xsl:when test="normalize-space($FormData/TaxpayerName) != ''">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$FormData/TaxpayerName/BusinessNameLine1"/></xsl:call-template>
            <xsl:if test="normalize-space($FormData/TaxpayerName/BusinessNameLine2)!=''">
              <br/>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$FormData/TaxpayerName/BusinessNameLine2"/></xsl:call-template>
            </xsl:if>            
          </xsl:when>  
          <xsl:otherwise>
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>  
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>    
          </xsl:otherwise>
        </xsl:choose>
      </div>
    </div>
    <div class="styEINBox" style="width: 62mm; padding-left:2mm; height: 9mm; font-size: 7pt;font-weight:normal;">Identifying number (see instructions)
      <div style="text-align:left;">  
        <br/>  
                <xsl:if test="$FormData/EIN != ' ' ">
                    <xsl:call-template name="PopulateEIN">
                         <xsl:with-param name="TargetNode" select="$FormData/EIN"/>
                    </xsl:call-template>
                </xsl:if>
                  <xsl:if test="$FormData/MissingEINReasonCd != ' ' ">
                    <xsl:call-template name="PopulateText">
                         <xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
                    </xsl:call-template>
                </xsl:if>
      </div>    
    </div>
    <div class="styEINBox" style="width: 62mm; padding-left:2mm; height: 9mm; border-color: black; border-style: solid; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; font-weight:normal;font-size: 7pt;">Social security number of spouse (only if a joint income tax return was filed)</div>
  </div>  
  <!--  End Name and Employer indentification number  -->
  <div class="styBB" style="width: 187mm; height: 9mm">Number, street, and room or suite no. (If a P.O. box, see instructions.)<br/>
    <xsl:call-template name="PopulateText">
      <xsl:with-param name="TargetNode" select="$FormData/USAddress/AddressLine1"/>
    </xsl:call-template>
    <xsl:if test="normalize-space($FormData/USAddress/AddressLine1)!=''">
      <br/><xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/USAddress/AddressLine2"/>
      </xsl:call-template>
    </xsl:if>
</div>
  <div class="styBB" style="width: 187mm; height: 8mm">City or town, state, and ZIP code<br/>
    <xsl:if test="normalize-space($FormData/USAddress/City)!=''">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/USAddress/City"/>
      </xsl:call-template>,<span style="width: 2mm"/>
    </xsl:if>
    <xsl:if test="normalize-space($FormData/USAddress/State)!=''">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/USAddress/State"/>
      </xsl:call-template><span style="width: 2mm"/>
    </xsl:if>
    <xsl:if test="normalize-space($FormData/USAddress/ZIPCode)!=''">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/USAddress/ZIPCode"/>
      </xsl:call-template>
    </xsl:if>
  </div>
  <div style="width: 187mm;font-size:7pt;">The taxpayer(s) listed above and the Commissioner of Internal Revenue, pursuant to the regulations under section 367, agree to<br/>the following:</div>
  
  <!--  Line 1 -->    
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">1</div>
    <span class="styLNDesc" style="width: 177mm;font-size:7pt;">
      The amount of any federal income tax due relating to the transfer described in item 5, below, on any income tax return
    </span>      
  </div>
  <div style="width: 187mm">  
    <span class="styLNDesc" style="padding-left: 8mm; width: 177mm;font-size:7pt;height:auto;">
      made by or for the above taxpayer(s) for the tax year ended 
      <xsl:choose>
        <xsl:when test="$FormData/TaxPeriodEndDt != ''">
          <span style="text-align: left; width: 15mm; border-style:solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
            <xsl:call-template name="PopulateMonth">
              <xsl:with-param name="TargetNode" select="$FormData/TaxPeriodEndDt"/>
            </xsl:call-template>
          </span> ,
          <span style="text-align: left; width: 15mm; border-style:solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
            <xsl:call-template name="PopulateDay">
              <xsl:with-param name="TargetNode" select="$FormData/TaxPeriodEndDt"/>
            </xsl:call-template>
          </span> ,
          <span style="text-align: left; width: 15mm; border-style:solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
            <xsl:call-template name="PopulateYear">
              <xsl:with-param name="TargetNode" select="$FormData/TaxPeriodEndDt"/>
            </xsl:call-template>
          </span> , may be
        </xsl:when>
        <xsl:otherwise>
          __________ , _________ , _________ , may be
        </xsl:otherwise>
      </xsl:choose>
      <div style="width: 187mm"><span style="width: 83mm"/>month<span style="width: 10mm"/>day<span style="width:10mm"/>year</div>
    </span>      
  </div>
  <div style="width: 187mm">  
    <span class="styLNDesc" style="padding-left: 8mm; width: 177mm;height:auto;">
      assessed at any time on or before  
      <xsl:choose>
        <xsl:when test="$FormData/ExpirationDt != ''">
        <span style="text-align: left; width: 15mm; border-style:solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
            <xsl:call-template name="PopulateMonth">
              <xsl:with-param name="TargetNode" select="$FormData/ExpirationDt"/>
            </xsl:call-template>
          </span> ,
          <span style="text-align: left; width: 15mm; border-style:solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
            <xsl:call-template name="PopulateDay">
              <xsl:with-param name="TargetNode" select="$FormData/ExpirationDt"/>
            </xsl:call-template>
          </span> ,
          <span style="text-align: left; width: 15mm; border-style:solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
            <xsl:call-template name="PopulateYear">
              <xsl:with-param name="TargetNode" select="$FormData/ExpirationDt"/>
            </xsl:call-template>
          </span> , (expiration date—see instructions).
        </xsl:when>
        <xsl:otherwise>
          __________, _________, _________, (expiration date—see instructions).<br/>
        </xsl:otherwise>
      </xsl:choose>
      <div style="width: 187mm"><span style="width: 50mm"/>month<span style="width: 10mm"/>day<span style="width: 10mm"/>year</div>
    </span>      
  </div>
  <!--  Line 1 -->
  
  <!--  Line 2 -->    
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">2</div>
    <span class="styLNDesc" style="width: 177mm;font-size:7pt;height:auto;">
      This consent establishes an extended period for assessing tax. The expiration of the extended period may be suspended
       or otherwise affected by the operation of law in the same manner as the original period. For example, if a notice of deficiency
      in tax covered by this consent is issued, the period for assessing tax will not end prior to the end of the suspension period
      provided for by section 6503(a), plus any time that remains in the assessment period, as extended, at the time the suspension
      takes effect. Under no circumstances will this consent reduce the period of time otherwise provided by law for making an
      assessment.
    </span>      
  </div>
  <!--  Line 2  -->
  
  <!--  Line 3  -->
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">3</div>
    <span class="styLNDesc" style="width: 177mm;font-size:7pt;height:auto;">
      The consenting taxpayer(s) may file a claim for credit or refund for the tax assessed by reason of this consent within 6
      months after the period ends for assessing tax established by this consent.
    </span>      
  </div>
  <!--  Line 3  -->
  
  <!--  Line 4  -->
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">4</div>
    <span class="styLNDesc" style="width: 177mm;font-size:7pt;height:auto;">
      The amount of any deficiency assessment covered by this consent will be limited to the amount of any federal income tax<br/>
      due relating to the recognition of gain on the transfer described in item 5, including any penalties, additions to tax, and<br/>
      interest attributable thereto and consequential changes to other items based on that adjustment.
    </span>      
  </div>
  <!--  Line 4  -->
  
  <!--  Line 5  -->
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">5</div>
    <span class="styLNDesc" style="width: 177mm">
      Complete the following information (see instructions):
    </span>      
  </div>
  <!--  Line 5  -->
  
  <!--  Line 5a  -->
  <div style="width: 187mm">  
    <div class="styLNLeftLtrBox">a</div>
    <div style="float: left; padding-top: .5mm">
      Date of transfer  
    </div>  
    <div class="styBB" style="float: right; clear: none; border-style: solid; width: 156mm; border-bottom-width: 1px">
      <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$FormData/TransferredDt"/></xsl:call-template>
    </div>    
  </div>
  <!--  Line 5a  -->
  
  <!--  Line 5b  -->
  <div style="width: 187mm">  
    <div class="styLNLeftLtrBox">b</div>
    <div style="float: left; padding-top: .5mm">
      Description of the property transferred  
    </div>  
    <xsl:choose>
      <xsl:when test="$FormData/PropertyDesc != ''">
        <div class="styBB" style="float: right; clear: none; width: 127mm; padding-top: .5mm; border-style: solid; border-bottom-width: 1px">
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$FormData/PropertyDesc"/></xsl:call-template>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <div class="styBB" style="float: right; clear: none; border-style: solid; width: 125mm; border-bottom-width: 1px;height:12px"/>
        <br/>
          <div class="styBB" style="float: right; border-style: solid; width: 178mm; border-bottom-width: 1px;height:12px"/>
   
        <div style="width: 187mm">
          <div class="styBB" style="float: right; border-style: solid; width: 178mm;height:12px"/>
        </div>    
        <div style="width: 187mm">
          <div class="styBB" style="float: right; border-style: solid; width: 178mm;height:12px"/>
        </div>
        <div style="width: 187mm">
          <div class="styBB" style="float: right; border-style: solid; width: 178mm; border-bottom-width: 1px;height:12px"/>
        </div>
      </xsl:otherwise>
    </xsl:choose>        
  </div>  
  <!--  Line 5b  -->
  <br/>
  <!--  Line 5c  -->
  <div style="width: 187mm">  
    <div class="styLNLeftLtrBox">c</div>
    <div style="float: left; padding-top: .5mm">
      Name of transferee and identifying number, if any  
    </div>  
    <div class="styBB" style="float: right; clear: none; border-style: solid; width: 112mm; border-bottom-width: 1px;font-size:6pt;font-family:verdana;">
      <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$FormData/TransfereeName/BusinessNameLine1"/></xsl:call-template>
    </div>    
  </div>    
  <div style="width: 187mm;height:6mm;">
    <div class="styBB" style="float: right; border-style: solid; width: 178mm;font-size:6pt">
      <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$FormData/TransfereeName/BusinessNameLine2"/></xsl:call-template>
      <span style="width: 2mm"/>
      <xsl:if test="$FormData/TransfereeEIN">
             <xsl:call-template name="PopulateEIN">
                   <xsl:with-param name="TargetNode" select="$FormData/TransfereeEIN"/>
             </xsl:call-template>    
      </xsl:if>
      <xsl:if test="$FormData/EINMissingReasonCd">
             <xsl:call-template name="PopulateText">
                   <xsl:with-param name="TargetNode" select="$FormData/EINMissingReasonCd"/>
             </xsl:call-template>    
      </xsl:if>
    </div>
  </div>
  <!--  Line 5c  -->
  
  <!-- Signature of consenting taxpayer  -->
  <div class="styBB" style="width: 187mm"/>
  <div style="width: 187mm">
    Under penalties of perjury, I declare that I have examined this consent, including accompanying statements and schedules, and to the best of my knowledge and belief,
    it is true, correct, and complete. A signed consent, properly completed in accordance with this form and its instructions, is deemed to have been executed by the
Commissioner of Internal Revenue.
  </div>
  <br/>
  <div style="width: 187mm;height: 12mm">
    <div style="width: 103mm; float: left; clear none">
      <div style="width: 4mm; float: left; clear: none"><img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/></div>
      <div class="styBB" style="float: left; clear: none; width:95mm; height:4mm; border-style:solid"/>
      <div style="float: left; clear: none; width:95mm; height:4mm; font-size: 6pt; text-align:left">Signature of consenting taxpayer (see instructions)</div>
    </div>
    <div style="width:83mm; float: right; clear none">
      <div style="width: 4mm; float: left; clear: none"><img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/></div>
      <div class="styBB" style="float: right; clear: none; width:79mm;height:4mm; border-style:solid">
        <span style="width:4px"/>
        <xsl:call-template name="PopulateReturnHeaderPreparer"> 
	   <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param> 
        </xsl:call-template>
      </div>
      <div style="float: right; clear: none; width:79mm;height:4mm;padding-left:.5mm;font-size: 6pt; text-align:left">Date</div>
    </div>
  </div>
  <!--Signature of consenting taxpayer-->
  
  <!-- Signature of spouse (complete only if a joint return is filed)  -->
  <div style="width: 187mm;height: 12mm">
    <div style="width: 103mm; float: left; clear none">
      <div style="width: 4mm; float: left; clear: none"><img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/></div>
      <div class="styBB" style="float: left; clear: none; width:95mm; height:4mm; border-style:solid"/>
      <div style="float: left; clear: none; width:95mm; height:4mm; padding-left:.5mm;font-size: 6pt; text-align:left">Signature of spouse (complete only if a joint return is filed)</div>
    </div>
    <div style="width:83mm; float: right; clear none">
      <div style="width: 4mm; float: left; clear: none"><img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/></div>
      <div class="styBB" style="float: right; clear: none; width:79mm;height:4mm; border-style:solid">
        <span style="width:4px"/>
        <xsl:call-template name="PopulateReturnHeaderPreparer"> 
	    <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param> 
        </xsl:call-template>
      </div>
      <div style="float: right; clear: none; width:79mm;height:4mm;padding-left:.5mm;font-size: 6pt; text-align:left">Date</div>
    </div>
  </div>
  <!--Signature of spouse (complete only if a joint return is filed)-->
  
  <!-- Taxpayer’s representative sign here  -->
  <div style="width: 187mm;height: 12mm">
    <div style="width: 103mm; float: left; clear none">
      <div style="width: 4mm; float: left; clear: none"><img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/></div>
      <div class="styBB" style="float: left; clear: none; width:95mm; height:4mm; border-style:solid"/>
      <div style="float: left; clear: none; width:95mm; height:4mm; padding-left:.5mm;font-size: 6pt; text-align:left">Taxpayer’s representative sign here</div>
    </div>
    <div style="width:83mm; float: right; clear none">
      <div style="width: 4mm; float: left; clear: none"><img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/></div>
      <div class="styBB" style="float: right; clear: none; width:79mm;height:4mm; border-style:solid">
        <span style="width:4px"/>
        <xsl:call-template name="PopulateReturnHeaderPreparer"> 
	      <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param> 
        </xsl:call-template>
      </div>
      <div style="float: right; clear: none; width:79mm;height:4mm;padding-left:.5mm;font-size: 6pt; text-align:left">Date</div>
    </div>
  </div>
  <!--Taxpayer’s representative sign here -->
  
  <!-- Corporate officer(s) sign here  -->
  <div style="width: 187mm;">
    <div style="width: 103mm; float: left; clear none">
      <div style="width: 4mm; float: left; clear: none"><img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/></div>
      <div class="styBB" style="float: left; clear: none; width:95mm; height:4mm; border-style:solid"/>
      <div style="float: left; clear: none; width:95mm; height:4mm; padding-left:.5mm;font-size: 6pt; text-align:left">Corporate officer(s) sign here</div>
    </div>
    <div style="width:83mm; float: right; clear none">
      <div style="width: 4mm; float: left; clear: none"><img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/></div>
      <div class="styBB" style="float: right; clear: none; width:79mm;height:4mm; border-style:solid">
        <span style="width:4px"/>
        <xsl:call-template name="PopulateReturnHeaderPreparer"> 
	     <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param> 
        </xsl:call-template>
      </div>
      <div style="float: right; clear: none; width:79mm;height:4mm;padding-left:.5mm;font-size: 6pt; text-align:left">Date</div>
    </div>
  </div>
  <!--Corporate officer(s) sign here-->
  <!--  Pager Footer  -->
  <div class="styBB" style="border-top-width: 1px; border-bottom-width: 0px; width:187mm;">
    <span class="styBoldText">For Paperwork Reduction Act Notice, see the instructions.</span> 
    <span style="width:110px;"/>        

    Cat. No. 20471F 
    <span style="width:73px"/>  
    Form <span class="styBoldText" style="font-size: 8pt">8838</span> (Rev. 12-2012)
  </div>
  <br/>
  <br/>
  <div class="pageEnd"/>
      
      <div class="styLeftOverTitleLine" id="LeftoverData">
        <div class="styLeftOverTitle">
          Additional Data        
        </div>
        <div class="styLeftOverButtonContainer">
          <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
        </div>      
      </div>
      
      <table class="styLeftOverTbl">
        <xsl:call-template name="PopulateCommonLeftover">
          <xsl:with-param name="TargetNode" select="$FormData"/>
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
      </table>    
  </form>  
</body>
</html>
</xsl:template>    

</xsl:stylesheet>