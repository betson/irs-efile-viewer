<?xml version="1.0" encoding="UTF-8" ?>
<!--Created by David Chang 4-01-2007 submitted for inspection 4-09-2007-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8849Schedule2Style.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="FormData" select="$RtnDoc/IRS8849Schedule2" />

<xsl:template match="/">

<html>
  <head>
  <title>
    <xsl:call-template name="FormTitle">
      <xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param>
    </xsl:call-template>
  </title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private" />
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="Description" content="IRS Form 8849Schedule2" />
  
  
  <xsl:call-template name="InitJS"></xsl:call-template>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  
  <style type="text/css">
    <xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS8849Schedule2Style"></xsl:call-template>  
      <xsl:call-template name="AddOnStyle"></xsl:call-template>     
    </xsl:if>
  </style>
  <xsl:call-template name="GlobalStylesForm"/>
  </head>
  <body class="styBodyClass">
    <form name="Form8849Schedule2">
      <xsl:call-template name="DocumentHeader"></xsl:call-template>
      <div class="styBB" style="width:187mm;border-bottom:2px black solid;">
        <div class="styFNBox" style="width:31mm;height:19mm;border-right:2px black solid;">
          <span class="styFormNumber" style="font-size:10pt">Schedule 2</span>      
          <br/>
          <span class="styFormNumber" style="font-size:10pt">(Form 8849)</span>      
          <br/>      
          <span class="styAgency">(Rev. March 2008)<br/> Department of the Treasury</span><br />
          <span class="styAgency">Internal Revenue Service</span>
        </div>
        <div class="styFTBox" style="width:125mm;height:19mm;padding-top:3mm;border-right:1px black solid;">
          <div class="styMainTitle" style="height:8mm;padding-top:3mm;">Sales by Registered Ultimate Vendors</div>
          <div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;padding-top:4mm;">
            <span style="text-align:center;font-weight:normal">
            <img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/> 
            Attach to Form 8849. <span class="styBoldText" >Do not </span> file with any other schedule.
            </span>
          </div>
        </div>
        <div class="styTYBox" style="width:31mm;height:19mm;padding-top:8mm;text-align:center;">
        OMB No. 1545-1420
        </div>
      </div>
 <!--  Name / Employer identification number / Total Refund  -->
<div style="width:187mm">
<table cellspacing="0" style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
<tr>
  <td class="styNameBox" style="width:100mm;font-size:7pt;font-weight:normal; height:10mm">Name as shown on Form 8849
    <br/>
    <div style="padding-top:1mm">
      <span style="font-size:6.373pt;">
        <xsl:call-template name="PopulateReturnHeaderFiler">
          <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
        </xsl:call-template><br/>
        <xsl:call-template name="PopulateReturnHeaderFiler">
          <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
        </xsl:call-template>	
      </span>
    </div>
  </td>
  <td valign="top" class="styNameBox" style="padding-left:2mm;font-size:7pt;width:40mm;font-weight:normal; height:10mm;">EIN<br/>
    <div style="padding-top:1mm">
    <xsl:choose>
      <xsl:when test="normalize-space($FormData/EmployerIdentificationNumber) != ''">
        <xsl:call-template name="PopulateEIN">
          <xsl:with-param name="TargetNode" select="$FormData/EmployerIdentificationNumber"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="normalize-space($FormData/MissingEINReason) != ''">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$FormData/MissingEINReason"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="($RtnHdrData/Filer/EIN)">
          <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
          </xsl:call-template>		
        </xsl:if>
        <xsl:if test="($RtnHdrData/Filer/SSN) and not ($RtnHdrData/Filer/EIN)">
          <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
          </xsl:call-template>		
        </xsl:if>                 
      </xsl:otherwise>
    </xsl:choose>
    </div>
  </td>
  <td valign="top" class="styNameBox" style="padding-left:2mm;font-size:7pt;font-weight:normal;height:10mm; border-right-width:0px">Total refund (see instructions)<br />
    <div style="padding-top:1mm">$
      <span style="width:40mm;text-align:right;clear:none;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalRefund"></xsl:with-param>
        </xsl:call-template>
      </span>
    </div>
  </td>	
  </tr>
</table>
</div>
<!--  end Name / Employer identification number / Total Refund  --> 
 
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4.5mm;width:8mm;"></div>
  <div class="styLNDesc" style="width:179mm;height:4.5mm;">
    <span class="styBoldText" >Period of claim: </span>      
    <span class="styItalicText" >Enter month, day, and year</span>   
  </div>
</div>  
<div class="styBB" style="width:187mm;">  
  <div class="styLNLeftNumBox" style="height:4.5mm;width:8mm;"></div>
  <div class="styLNLeftNumBox" style="height:4.5mm;width:22mm;"></div>
  <div class="styLNDesc" style="width:157mm;height:4.5mm;">  
    <span class="styItalicText" > in MMDDYYYY format.</span>
    <span style="width:120px;clear:none"></span>  
    <span class="styBoldText" >From  <img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/> 
    </span>
    <span style="width:2px;clear:none"></span><span style="width:32mm;text-align:left;clear:none">
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$FormData/PeriodOfClaimFromDate"></xsl:with-param>
      </xsl:call-template>
    </span>
    <span style="width:40px;clear:none"></span>  
    <span class="styBoldText" >To <img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/></span>     
    <span style="width:2px;clear:none"></span><span style="width:32mm;text-align:left;clear:none">
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$FormData/PeriodOfClaimToDate"></xsl:with-param>
      </xsl:call-template>
    </span>
  </div>
</div>  

<!-- Claimant's reg num -->
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:9mm;width:8mm;"></div>
  <div class="styLNDesc" style="width:179mm;padding-top:1.5mm;">
    <span style="width:39mm"><b>Claimant's registration no.</b></span>
    <span style="width:2mm"><img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/></span>
    <span style="width:3mm"></span>
    <span style="width:5mm;font-weight:bold;text-align:right;">U V</span>
    <span style="width:0.5mm" />
    <span style="width:48mm;text-align:left;border-bottom:1px black solid;">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/RegNbrUV"></xsl:with-param>
      </xsl:call-template> 
    </span>
    <span style="width:5mm" />
    <span style="width:76mm; font-style:italic">
      Complete for lines 1a, 2a, 4a, 4b, 5a, and 5b. Also<br/> 
      complete for lines 3d and 3e, type of use 14. <b>Note:</b> UV
    </span>
    <div class="styLNDesc" style="width:179mm">
      <span style="width:102.5mm" />
      <span style="width:76.5mm;vertical-align:top;font-style:italic;">
        claimant must complete line 6 or 7 on page 3.
      </span>  
    </div>
  </div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:9mm;width:8mm;"></div>
  <div class="styLNDesc" style="width:179mm;height:4.5mm;padding-top:1mm">
    <span style="width:39mm;clear:none"></span>
    <span class="styBoldText" ><img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/> 
    </span>
    <span style="width:12px;clear:none"></span>
    <span style="width:20px;clear:none;font-weight:bold;text-align:right;">U B</span>
    <span style="width:0.5mm" />
    <span style="width:48mm;border-bottom:1px black solid;text-align:left;clear:none">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/RegNbrUB"></xsl:with-param>
      </xsl:call-template> 
    </span>
    <span style="width:5mm" />
    <span style="width:70mm;clear:none;font-style:italic;">Complete for lines 1b and 2c.</span>
  </div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:9mm;width:8mm;"></div>
  <div class="styLNDesc" style="width:179mm;height:4.5mm;padding-top:2mm">
    <span style="width:39mm;clear:none"></span>
    <span class="styBoldText" ><img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/> 
    </span>         
    <span style="width:12px;clear:none"></span>
    <span style="width:20px;clear:none;font-weight:bold;text-align:right;">U P</span>
    <span style="width:0.5mm" />
    <span style="width:48mm;border-bottom:1px black solid;text-align:left;clear:none">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/RegNbrUP"></xsl:with-param>
      </xsl:call-template> </span>
    <span style="width:5mm;clear:none;" />
    <span style="width:70mm;clear:none;font-style:italic;">Complete for line 2b.</span>  
  </div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:9mm;width:8mm;"></div>
  <div class="styLNDesc" style="width:179mm;height:4.5mm;padding-top:3mm">
    <span style="width:39mm;clear:none"></span>
    <span class="styBoldText" ><img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/> 
    </span>         
    <span style="width:12px;clear:none"></span>
    <span style="width:20px;clear:none;font-weight:bold;text-align:right;">U A</span>
    <span style="width:0.5mm" />
    <span style="width:48mm;border-bottom:1px black solid;text-align:left;clear:none">
      <xsl:call-template name="PopulateText">     	
        <xsl:with-param name="TargetNode" select="$FormData/RegNbrUA"></xsl:with-param>
      </xsl:call-template> </span>
    <span style="width:5mm;clear:none;" />
    <span style="width:115px;clear:none;font-style:italic">Complete for line 3. See</span>
    <span style="width:15pxclear:none;font-style:italic;font-weight:bold;">UV</span> 
    <span style="width:5px;clear:none;"></span> 
    <span style="width:150px;clear:none;font-style:italic">for lines 3d and 3e, type of</span>  
    <div class="styLNDesc" style="width:179mm;height:1px;">
      <span style="width:12px;clear:none"></span>
      <span style="width:20px;clear:none;font-weight:bold;text-align:right;"></span>
      <span style="width:94.5mm;text-align:left;clear:none"></span>
      <span style="width:70mm;clear:none;text-align:top;font-style:italic;">use 14.
      </span>
    </div>
  </div>
</div>
<!-- Line 1-->
<div class="styBB" style="width:187mm;border-top:1px black solid;">
  <div class="styLNLeftNumBox" style="height:6mm;text-align:left;padding-bottom:2mm;"><br/>1</div>
  <div class="styLNDesc" style="width:100mm;height:6mm;padding-bottom:2mm;">
    <span class="styBoldText" ><br/>Sales by Registered Ultimate Vendors of Undyed Diesel Fuel</span>   
  </div>      
</div>
<div style="width:187mm;font-size:7pt;">
  <div class="styLNLeftNumBox" style="height:16mm;width:8mm;"></div>
  <div class="styLNDesc" style="width:170mm;height:16mm;text-align:justify;">
    <span class="styText">
    Claimant sold the diesel fuel at a tax-excluded price, repaid the amount of tax to the buyer, or obtained written consent of the buyer to make the claim. 
    </span>
    <span class="styText"  style="font-weight:bold;" >For line 1a, </span>
    <span class="styText">claimant has obtained the required certificate from the buyer and has no reason to believe any information in the certificate is false. 
    </span>
    <span class="styText"  style="font-weight:bold;" >For line 1b, </span>
    <span class="styText">the registered ultimate vendor is eligible to make this claim only if the buyer waives their right to make the claim by providing the registered ultimate vendor with an unexpired waiver and has no reason to believe any of the information in the waiver is false. See the instructions for additional information to be submitted. </span>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;width:8mm;"></div>
    <div class="styLNDesc" style="width:179mm;height:4mm;">
    <span class="styText">Claimant certifies that the diesel fuel did not contain visible evidence of dye.</span>
    </div>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:3mm;width:8mm;"></div>
    <div class="styLNDesc" style="width:179mm;height:3mm;">
      <span class="styText" style="font-weight:bold;" >Exception. </span>
      <span style="width:3px;clear:none">   </span>
      <span class="styText">
      If any of the diesel fuel included in this claim</span>
      <span class="styText"  style="font-weight:bold;" >
      did</span>
      <span class="styText"  >
      contain visible evidence of dye, attach an explanation and</span> 
      <span style="width:22mm;clear:none"></span>
      <span class="styText" style="text-align:bottom;">check here</span>
      <xsl:call-template name="SetFormLinkInline">
	  <xsl:with-param name="TargetNode" select="$FormData/UndyedDieselFuel/Exception"/>
	</xsl:call-template>
       <!--Dotted Line-->
       <span class="styBoldText">
         <!--<span style="width:16px"></span>-->.
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
         <span style="width:16px"></span>.
         <span style="width:16px"></span>.
	   <span style="width:16px"></span>.
         <span style="width:16px"></span>.
         <span style="width:16px"></span>.
         <span style="width:16px"></span>.
	  <span style="width:16px"></span>.
         <span style="width:16px"></span>.
        </span>
        <span style="width:1mm;clear:none"></span>
        <span class="styBoldText" ><img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/></span>     
        <span style="width:4mm;clear:none"></span>
        <input type="checkbox" class="styCkbox">
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$FormData/UndyedDieselFuel/Exception" />
            <xsl:with-param name="BackupName"></xsl:with-param>
          </xsl:call-template>
       </input>
       <label>
         <xsl:call-template name="PopulateLabel">
           <xsl:with-param name="TargetNode" select="$FormData/UndyedDieselFuel/Exception" />
           <xsl:with-param name="BackupName"></xsl:with-param>
         </xsl:call-template>
       </label>
     </div>
  </div>
</div>
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:3mm;width:8mm;"></div>
  <div class="styLNDesc" style="width:170mm;height:3mm;text-align:justify;">
    <span class="styText" style="font-weight:bold;" >Caution. </span>
    <span style="width:3px;clear:none" />
    <span class="styText" style="font-style:italic;">
    Claims cannot be made on line 1a for diesel fuel purchased by a state or local government for its exclusive use with a 
    credit card issued to the state or local government by a credit card issuer.
    </span>
  </div>
</div>
<div style="width:187mm;">
  <table style="font-size:7pt;border-collapse:collapse;">
    <tbody>
    <tr>				
      <th style="width=8mm;height:8.0mm;border-top:1px black solid;"><span style="width=1px;"></span></th>
      <th style="width=58mm;height:8.0mm;border-top:1px black solid;"><span style="width=1px;"></span></th>
      <th style="width=22mm;height:8.0mm;border-left:1px black solid;border-bottom:1px black solid;
        border-top:1px black solid;" valign="top">(a) Rate</th>
      <th style="width=35mm;height:8.0mm;border-left:1px black solid;border-bottom:1px black solid;
        border-top:1px black solid;" valign="top">(b) Gallons<br/></th>
      <th style="width=53mm;height:8.0mm;border-left:1px black solid;border-bottom:1px black solid;
        border-top:1px black solid;" valign="top">
        (c) Amount of refund<br/>
        <span class="styItalicText" style="font-weight:normal;">Multiply col. </span>
        <span class="styItalicText" >(a) </span>
        <span class="styItalicText" style="font-weight:normal">by col. </span>
        <span class="styItalicText" >(b)<br/></span>
      </th>
      <th style="width=10mm;height:8.0mm;border-left:1px black solid;border-bottom:1px black solid;
        border-top:1px black solid;" valign="top">(d)<br/>CRN</th>
    </tr>
    <tr>
      <td style="height:9mm;width:6mm;text-align:center;font-weight=bold;">a</td>
      <td style="height:9mm;text-align:left;border-bottom:1px black solid;">Use by a state or local government</td>
      <td style="height:9mm;border-left:1px black solid;border-bottom:1px black solid;">
        <span style="width:2.5mm;clear:none" />$
        <span style="width:3.3mm;clear:none" />
        <span style="width:1.2mm;clear:none;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/UndyedDieselFuel/UsedByStateLocalGov/Rate">
            </xsl:with-param>
          </xsl:call-template> 
        </span>
      </td>
      <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:4px;">
        <xsl:call-template name="PopulateAmount">        	
          <xsl:with-param name="TargetNode" select="$FormData/UndyedDieselFuel/UsedByStateLocalGov/Gallons">
          </xsl:with-param>
        </xsl:call-template> 
      </td>
      <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
        <span style="height:6.5mm;width:2mm;text-align:bottom;padding-top:1.8mm;">$</span>
        <span style="height:6.5mm;width:50mm;padding-top:1.8mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/UndyedDieselFuel/UsedByStateLocalGov/Amount">
            </xsl:with-param>
          </xsl:call-template>
        </span>
      </td>
      <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;padding-top:1mm;" >
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$FormData/UndyedDieselFuel/UsedByStateLocalGov/CRN">
          </xsl:with-param>
        </xsl:call-template> 
      </td>
    </tr>
    <tr>
      <td style="height:6.5mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;">b</td>
      <td  style="height:6.5mm;text-align:left;border-bottom:1px black solid;">Use in certain intercity and local buses</td>
      <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;">
        <span style="width:3.3mm;clear:none"></span>
        <span style="height:6.5mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:1.5mm;text-align:center">
          <xsl:call-template name="PopulateText">        	
            <xsl:with-param name="TargetNode" select="$FormData/UndyedDieselFuel/UseIntercityLocalBuses/Rate">
            </xsl:with-param>
          </xsl:call-template>
        </span>
        </td>
        <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/UndyedDieselFuel/UseIntercityLocalBuses/Gallons">
            </xsl:with-param>
          </xsl:call-template>
        </td>
        <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
          <span style="width:2mm;text-align:left;"></span>
          <span style="width:37mm;padding-top:0.7mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/UndyedDieselFuel/UseIntercityLocalBuses/Amount">
              </xsl:with-param>
            </xsl:call-template> 
          </span>
        </td>
        <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;padding-top:1mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/UndyedDieselFuel/UseIntercityLocalBuses/CRN">
            </xsl:with-param>
          </xsl:call-template>
        </td>
      </tr>
    </tbody>
  </table>
</div>      
 
<!-- Line 2 -->
<div class="styBB" style="width:187mm;border-top:1px black;">
  <div class="styLNLeftNumBox" style="height:6mm;text-align:left;padding-bottom:2mm;"><br/>2</div>
  <div class="styLNDesc" style="width:150mm;height:6mm;padding-bottom:2mm;">
    <span class="styBoldText" ><br/>Sales by Registered Ultimate Vendors of Undyed Kerosene (Other Than Kerosene For Use in Aviation)
    </span>
  </div>      
</div>
<div style="width:187mm;font-size:7pt;">
  <div class="styLNLeftNumBox" style="height:16mm;width:8mm;"></div>
  <div class="styLNDesc" style="width:170mm;height:16mm;text-align:justify;">
    <span class="styText">Claimant sold the kerosene at a tax-excluded price, repaid the amount of tax to the buyer, or obtained written consent of the buyer to make the claim. 
    </span>
    <span class="styText"  style="font-weight:bold;" >For line 2a, 
    </span>
    <span class="styText">claimant has obtained the required certificate from the buyer and has no reason to believe any information in the certificate is false. </span>
    <span class="styText"  style="font-weight:bold;">For line 2b, 
    </span>
    <span class="styText">claimant has a statement, if required, that contains: the date of sale, name and address of the buyer, and the number of gallons of kerosene sold to the buyer. 
    </span>
    <span class="styText"  style="font-weight:bold;" >For line 2c, </span>
    <span class="styText">the registered ultimate vendor is eligible to make this claim only if the buyer waives their right to make the claim by providing the registered ultimate vendor with an unexpired waiver and has no reason to believe any of the information in the waiver is false. See the instructions for additional information to be submitted.
    </span>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;width:8mm;"></div>
    <div class="styLNDesc" style="width:179mm;height:4mm;">
      <span class="styText">Claimant certifies that the kerosene did not contain visible evidence of dye.</span>
    </div>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:3mm;width:8mm;"></div>
    <div class="styLNDesc" style="width:179mm;height:3mm;">
      <span class="styText" style="font-weight:bold;" >Exception. </span>
      <span style="width:3px;clear:none"></span>
      <span class="styText">If any of the kerosene included in this claim </span>
      <span class="styText"  style="font-weight:bold;" >did </span>
      <span class="styText">contain visible evidence of dye, attach an explanation and </span> 
      <span style="width:23mm;clear:none"></span>
      <span class="styText" style="text-align:bottom;" >check here</span>
      <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/Exception"/>
      </xsl:call-template>
      <!--Dotted Line-->
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
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
	 <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
	 <span style="width:16px"></span>.
        <span style="width:16px"></span>.
      </span>
      <span style="width:1mm;clear:none"></span>
      <span class="styBoldText" ><img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/> 
      </span>     
      <span style="width:4mm;clear:none"></span>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/Exception" />
          <xsl:with-param name="BackupName"></xsl:with-param>
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/Exception" />
          <xsl:with-param name="BackupName"></xsl:with-param>
        </xsl:call-template>
      </label>
    </div>
  </div>
</div>
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:3mm;width:8mm;"></div>
  <div class="styLNDesc" style="width:170mm;height:3mm;text-align:justify;">
    <span class="styText" style="font-weight:bold;" >Caution. </span>
    <span style="width:3px;clear:none" />
    <span class="styText" style="font-style:italic;">Claims cannot be made on line 2a for kerosene purchased by a state or local government for its exclusive use with a </span>
    <span class="styText" style="font-style:italic;"  >credit card issued to the state or local government by a credit card issuer.
    </span>
  </div>
</div>
<div style="width:187mm;">
  <table style="font-size:7pt;border-collapse:collapse;">
    <tbody>
      <tr>
        <th style="width=8mm;height:8mm;border-top:1px black solid;"><span style="width=1px;"></span></th>
        <th style="width=58mm;height:8mm;border-top:1px black solid;"><span style="width=1px;"></span></th>
        <th style="width=22mm;height:8mm;border-left:1px black solid;border-bottom:1px black solid;
          border-top:1px black solid;" valign="top">(a) Rate</th>
        <th style="width=35mm;height:8mm;border-left:1px black solid;border-bottom:1px black solid;
          border-top:1px black solid;" valign="top">(b) Gallons</th>
        <th style="width=53mm;height:8mm;border-left:1px black solid;border-bottom:1px black solid;
          border-top:1px black solid;" valign="top">(c) Amount of refund<br/>
          <span class="styItalicText"  style="font-weight:normal;">Multiply col. </span>
          <span class="styItalicText">(a) </span>
          <span class="styItalicText"  style="font-weight:normal">by col. </span>
          <span class="styItalicText" >(b) <br/></span>
        </th>
        <th style="width=10mm;height:8mm;border-left:1px black solid;border-bottom:1px black solid;
          border-top:1px black solid;" valign="top">(d)<br/> CRN</th>
      </tr>
      <tr>
        <td style="height:9mm;width:6mm;text-align:center;font-weight=bold;">a</td>
        <td style="height:9mm;text-align:left;border-bottom:1px black solid;">Use by a state or local government</td>
        <td style="height:9mm;border-left:1px black solid;border-bottom:1px black solid;">
          <span style="width:2.5mm;clear:none"></span>$
          <span style="width:3.3mm;clear:none"></span>
          <span style="width:1.2mm;clear:none">   
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/UsedByStateLocalGov/Rate">
              </xsl:with-param>
            </xsl:call-template> 
          </span>
        </td>
        <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:4px;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/UsedByStateLocalGov/Gallons">
            </xsl:with-param>
          </xsl:call-template> 
        </td>
        <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
          <span style="height:6.5mm;width:2mm;text-align:bottom;padding-top:1.8mm;">$</span>
          <span style="height:6.5mm;width:50mm;padding-top:1.8mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/UsedByStateLocalGov/Amount">
              </xsl:with-param>
            </xsl:call-template> 
          </span>
        </td>
        <td rowspan="2" style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;" >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/UsedByStateLocalGov/CRN">
            </xsl:with-param>
          </xsl:call-template>
        </td>
      </tr>
      <tr>
        <td style="height:6.5mm;width:6mm;text-align:center;font-weight=bold;">b</td>
        <td  style="height:6.5mm;text-align:left;border-bottom:1px black solid;">Sales from a blocked pump</td>
        <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;">
          <span style="width:3.3mm;clear:none"></span>
          <span style="height:6.5mm;width:6mm;clear:none;padding-left:5.2mm;padding-bottom:2.6mm;text-align:center">
          <span style="width:3mm;clear:none"></span>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/SalesFromBlockedPump/Rate">
              </xsl:with-param>
            </xsl:call-template>
          </span>
        </td>
        <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/SalesFromBlockedPump/Gallons">
            </xsl:with-param>
          </xsl:call-template>
        </td>
        <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
          <span style="width:2mm;text-align:left;"></span>
          <span style="width:37mm;padding-top:0.7mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/SalesFromBlockedPump/Amount">
              </xsl:with-param>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr>
        <td style="height:6.5mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;">c</td>
        <td  style="height:6.5mm;text-align:left;border-bottom:1px black solid;">Use in certain intercity and local buses</td>
        <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;">
          <span style="width:3.3mm;clear:none"></span>
          <span style="height:6.5mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:1.5mm;text-align:center">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/UseIntercityLocalBuses/Rate">
              </xsl:with-param>
            </xsl:call-template>
          </span>
        </td>
        <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/UseIntercityLocalBuses/Gallons">
            </xsl:with-param>
          </xsl:call-template> 
        </td>
        <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
          <span style="width:2mm;text-align:left;"></span>
          <span style="width:37mm;padding-top:0.7mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/UseIntercityLocalBuses/Amount">
              </xsl:with-param>
            </xsl:call-template> 
          </span>
        </td>
        <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;padding-top:1mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/UseIntercityLocalBuses/CRN">
            </xsl:with-param>
          </xsl:call-template> 
        </td>
      </tr>
    </tbody>
  </table>    
</div>      

<!-- Footer of first page -->
<div style="width:187mm;border-top:1px black solid;">
  <span style="width:104mm;font-weight:bold;text-align:left;font-size:6pt;"> 
    For Privacy Act and Paperwork Reduction Act Notice, see Form 8849 instructions.
  </span>
  <span style="width:5mm;"></span>  
  <span style="width:18mm;font-weight:normal;font-size:6pt;">
    Cat. No. 27450U
  </span> 
  <span style="width:7mm;"></span>
  <span style="text-align:right;width:30mm;font-weight:bold;font-size:6pt;">Schedule 2 (Form 8849)</span>
  <span style="text-align:right;width:20mm;padding-left:4mm;font-weight:normal;font-size:6pt;">(Rev. 3-2008)</span> 
</div>
<br class="pageEnd"/>
<div  style="width:187mm;border-bottom:2px black solid;">
  <span style="width:104mm;font-weight:normal;text-align:left;font-size:7pt;"> 
    Schedule 2 (Form 8849) (Rev. 3-2008)
  </span>
  <span style="width:5mm;"></span>
  <span style="width:18mm;font-weight:normal;font-size:7pt;"></span>
  <span style="width:7mm;"></span>  
  <span style="text-align:right;width:20mm;font-weight:bold;font-size:7pt;"></span> 
  <span style="text-align:right;width:30mm;font-weight:normal;font-size:7pt;">Page</span> 
  <span style="width:4px"></span> 
  <span style="text-align:right;width:1mm;font-weight:bold;font-size:7pt;">2</span>
</div>
 
<!--  Name / Employer identification number -->
<div style="width:187mm;border-bottom:1px black solid;">
  <table cellspacing="0" style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
    <tr>
      <td class="styNameBox" style="width:143mm;font-size:7pt;font-weight:normal; height:10mm">
        Name as shown on Form 8849<br/>
        <span style="font-size:6.373pt;">
          <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
          </xsl:call-template><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
          </xsl:call-template>	
        </span>
      </td>
      <td valign="top" class="styNameBox" style="padding-left:2mm;font-size:7pt;font-weight:normal; height:10mm; border-right-width:0px">EIN<br/>
        <xsl:choose>
          <xsl:when test="normalize-space($FormData/EmployerIdentificationNumber) != ''">
            <xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="$FormData/EmployerIdentificationNumber"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="normalize-space($FormData/MissingEINReason) != ''">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/MissingEINReason"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if test="($RtnHdrData/Filer/EIN)">
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
              </xsl:call-template>		
            </xsl:if>
            <xsl:if test="($RtnHdrData/Filer/SSN) and not ($RtnHdrData/Filer/EIN)">
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
              </xsl:call-template>		
            </xsl:if>                 
          </xsl:otherwise>
        </xsl:choose>
      </td>
    </tr>
  </table>
</div>
<!--  end Name / Employer identification number --> 

<!-- Line 3 Sales-->
<div class="styBB" style="width:187mm;border-top:1px black;height:3mm;">
  <div class="styLNLeftNumBox" style="text-align:left;">3</div>
  <div class="styLNDesc" style="width:150mm;">
    <span class="styBoldText" style="text-align:left;padding-right:8mm;padding-top:0.6mm" >Sales by Registered Ultimate Vendors of Kerosene for Use in Aviation
    </span>
  </div>  
</div>
<div style="width:187mm;font-size:7pt;">
  <div class="styLNLeftNumBox" style="height:16mm;width:8mm;"></div>
  <div class="styLNDesc" style="width:170mm;height:16mm;text-align:justify;">
    <span class="styText">
      Claimant sold the kerosene for use in aviation at a tax-excluded price and has not collected the amount of tax from the buyer, repaid the amount of tax to the buyer, or has obtained written consent of the buyer to make the claim.
    </span>
    <span class="styText"  style="font-weight:bold;" >For lines 3a, 3b, 3d, 3e, and 3f, </span>
    <span class="styText">the registered ultimate vendor is eligible to make this claim only if the buyer waives their right to make the claim by providing the registered ultimate vendor with an unexpired waiver and has no reason to believe any of the information in the waiver is false. </span>
    <span class="styText"  style="font-weight:bold;" >
      For line 3c, 
    </span>
    <span class="styText">claimant has obtained the required certificate from the buyer and has no reason to believe any of the information in the certificate is false. See the instructions for additional information to be submitted. </span>
    <span class="styText"  style="font-weight:bold;" ></span>
    <span class="styText"></span>
  </div>
</div>
 
<div style="width:187mm;">
  <table style="font-size:7pt;border-collapse:collapse;">
    <tbody>
      <tr>
        <th style="width=8mm;height:6.5mm;"><span style="width=1px;"></span></th>
        <th style="width=80mm;height:6.5mm;border-top:1px black solid;"><span style="width=1px;"></span></th>
        <th style="width=13mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-aligh:right;
          border-top:1px black solid;" valign="top">
          Type of <br/>use
        </th>
        <th style="width=15mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;
          border-top:1px black solid;" valign="top">
          (a) <br/>Rate
        </th>
        <th style="width=27mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;
          border-top:1px black solid;" valign="top">
          (b) <br/>Gallons
        </th>
        <th style="width=36mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;
          border-top:1px black solid;" valign="top">
          (c) <br/>Amount of refund<br/>
          <span class="styItalicText"  style="font-weight:normal;">Multiply col.	</span>
          <span class="styItalicText">(a)<br/></span>
          <span class="styItalicText"  style="font-weight:normal">by col. </span>
          <span class="styItalicText">(b)<br/></span>
        </th>
        <th style="width=8mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;
          padding-bottom:2mm;border-top:1px black solid;">
          (d)<br/> CRN<br/>
        </th>
      </tr>
      
      <!-- line 3a -->
      <tr>
        <td style="height:6.5mm;width:6mm;text-align:center;font-weight=bold;padding-bottom:3.2mm;">a</td>
        <td style="height:6.5mm;text-align:left;border-bottom:1px black solid;" valign="bottom">
          Use in commercial aviation (other than foreign trade) <br/> taxed at $.219
        </td>
        <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;background-color:gray;">
          <span style="width:2.5mm;clear:none"></span>
          <span style="width:1.2mm;clear:none">
          </span>
        </td>
        <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:1.5mm;">
          <span style="width:0.5mm;clear:none;"></span>$
          <span style="width:2mm;clear:none;"></span>
          <span style="width:1.2mm;clear:none;padding-top:2mm;">   
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/UsedCommercialAviationTaxed219/Rate">
              </xsl:with-param>
            </xsl:call-template> 
          </span>
        </td>
        <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:4mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/UsedCommercialAviationTaxed219/Gallons">
            </xsl:with-param>
          </xsl:call-template>
        </td>
        <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
          <span style="width:7px;clear:none;"> $ </span>
          <span style="width:0mm;clear:none;padding-right:0mm;"></span>
          <span style="height:6.5mm;width:33mm;padding-top:3.8mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/UsedCommercialAviationTaxed219/Amount">
              </xsl:with-param>
            </xsl:call-template> 
          </span>
        </td>
        <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;padding-top:3mm" >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/UsedCommercialAviationTaxed219/CRN">
            </xsl:with-param>
          </xsl:call-template> 
        </td>
      </tr>
      
      <!-- line 3b -->
      <tr>
        <td style="height:4.5mm;width:6mm;text-align:center;font-weight=bold;padding-bottom:3mm;">b</td>
        <td style="height:4.5mm;text-align:left;border-bottom:1px black solid;" valign="bottom">
          Use in commercial aviation (other than foreign trade)<br/> taxed at $.244
        </td>
        <td style="height:4.5mm;border-left:1px black solid;border-bottom:1px black solid;background-color:gray;">
          <span style="width:2.5mm;clear:none"></span>
          <span style="width:1.2mm;clear:none"></span>
        </td>
        <td style="height:4.5mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:1mm;">
          <span style="height:4.5mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:2.5mm;text-align:center">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/UsedCommercialAviationTaxed244/Rate">
              </xsl:with-param>
            </xsl:call-template>
          </span>
        </td>
        <td style="height:4.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:3.5mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/UsedCommercialAviationTaxed244/Gallons">
            </xsl:with-param>
          </xsl:call-template>
        </td>
        <td style="height:4.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
          <span style="width:2mm;text-align:left;"></span>
          <span style="width:30mm;padding-top:3.3mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/UsedCommercialAviationTaxed244/Amount">
              </xsl:with-param>
            </xsl:call-template>
          </span>
        </td>
        <td style="height:4.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;padding-top:3.5mm">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/UsedCommercialAviationTaxed244/CRN">
            </xsl:with-param>
          </xsl:call-template> 
        </td>
      </tr>
      
      <!-- line 3c -->
            
      <tr>
        <td style="height:3mm;width:6mm;text-align:center;font-weight=bold;">c</td>
        <td style="height:3mm;text-align:left;border-bottom:1px black solid;">Nonexempt use in noncommercial aviation</td>
        <td style="height:3mm;border-left:1px black solid;border-bottom:1px black solid;background-color:gray;">
          <span style="width:2.5mm;clear:none"></span>
          <span style="width:1.2mm;clear:none"></span>
        </td>
        <td style="height:3mm;border-left:1px black solid;border-bottom:1px black solid;">
          <span style="height:3mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:0mm;text-align:center">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/NonexemptUseNoncommercial/Rate">
              </xsl:with-param>
            </xsl:call-template>
          </span>
        </td>
        <td style="height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/NonexemptUseNoncommercial/Gallons">
            </xsl:with-param>
          </xsl:call-template> 
        </td>
        <td style="height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
          <span style="height:3mm;width:0.5m;text-align:bottom;text-aligh:left;padding-top:0mm;"></span>
          <span style="width:34mm;paddng-top:0mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/NonexemptUseNoncommercial/Amount">
              </xsl:with-param>
            </xsl:call-template> 
          </span>
        </td>
        <td style="height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/NonexemptUseNoncommercial/CRN">
            </xsl:with-param>
          </xsl:call-template> 
        </td>
      </tr>
      
      <!-- line 3d -->
      
        <!-- Added this <xsl:if test so that when no amounts were entered for lines 3d or 3e, the lines would still show as they
                       were not showing in RRD when lines were empty   SKM  11/17/09 -->
                
                <xsl:if test="not($FormData/KeroseneUseInAviation/OtherNontaxableUseTaxed244)">
                 <!--In case there is nothing for the for-each loop to grab-->
                  <tr>
                   <td style=" height:3mm;width:6mm;text-align:center;font-weight=bold;">d</td>
                    <td style=" height:3mm;text-align:left;border-bottom:1px black solid;">Other nontaxable uses taxed at $.244</td>
                    <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:center">
                     <span class="styTableCellPad"/>
                    </td>
                    <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;">
                      <span style=" height:3mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:0.5mm;text-align:center">
                        <span class="styTableCellPad"/>
                      </span>
                    </td>
                    <td style=" height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                      <span style="width:2mm;text-align:left;"/>
                      <span style="width:26mm;padding-top:0mm;">
                        <span class="styTableCellPad"/>
                      </span>
                    </td>
                    <td style=" height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  </xsl:if>
                                
                <xsl:for-each select="$FormData/KeroseneUseInAviation/OtherNontaxableUseTaxed244">
                  <tr>
                   <td style=" height:3mm;width:6mm;text-align:center;font-weight:bold;border-bottom:0px black solid;">d</td>
                      <td style=" height:3mm;text-align:left;border-bottom:1px black solid;">Other nontaxable uses taxed at $.244</td>
                      <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:center">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                    </td>
                    <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;">
                      <span style=" height:3mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:0.5mm;text-align:center">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Rate"/>
                        </xsl:call-template>
                      </span>
                    </td>
                    <td style=" height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                    </td>
                    <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                      <span style="width:2mm;text-align:left;"/>
                      <span style="width:26mm;padding-top:0mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Amount"/>
                        </xsl:call-template>
                      </span>
                    </td>
                    <td style=" height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CRN"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
      
    <!-- line 3e -->  
    <xsl:if test="not($FormData/KeroseneUseInAviation/OtherNontaxableUseTaxed219)">
           <!--In case there is nothing for the for-each loop to grab-->
<tr>
           <td style=" height:3mm;width:6mm;text-align:center;font-weight:bold;border-bottom:0px black solid;">e</td>
           <td style=" height:3mm;text-align:left;border-bottom:1px black solid;">Other nontaxable uses taxed at $.219</td>
            <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:center">
            <xsl:call-template name="PopulateText">    	
              <xsl:with-param name="TargetNode" select="TypeOfUse">
              </xsl:with-param>
            </xsl:call-template>
          </td>
          <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;">
            <span style=" height:3mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:0.5mm;text-align:center">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Rate">
                </xsl:with-param>
              </xsl:call-template> 
            </span>
          </td>
          <td style=" height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="Gallons">
              </xsl:with-param>
            </xsl:call-template> 
          </td>
          <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
            <span style="width:2mm;text-align:left;"></span>
            <span style="width:26mm;padding-top:0mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Amount">
                </xsl:with-param>
              </xsl:call-template> 
            </span>
          </td>
          <td style=" height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="CRN">
              </xsl:with-param>
            </xsl:call-template> 
          </td>
        </tr>
        </xsl:if>           
           
      <xsl:for-each select="$FormData/KeroseneUseInAviation/OtherNontaxableUseTaxed219">
        <tr>
           <td style=" height:3mm;width:6mm;text-align:center;font-weight:bold;border-bottom:0px black solid;">e</td>
           <td style=" height:3mm;text-align:left;border-bottom:1px black solid;">Other nontaxable uses taxed at $.219</td>
            <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:center">
            <xsl:call-template name="PopulateText">    	
              <xsl:with-param name="TargetNode" select="TypeOfUse">
              </xsl:with-param>
            </xsl:call-template>
          </td>
          <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;">
            <span style=" height:3mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:0.5mm;text-align:center">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Rate">
                </xsl:with-param>
              </xsl:call-template> 
            </span>
          </td>
          <td style=" height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="Gallons">
              </xsl:with-param>
            </xsl:call-template> 
          </td>
          <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
            <span style="width:2mm;text-align:left;"></span>
            <span style="width:26mm;padding-top:0mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Amount">
                </xsl:with-param>
              </xsl:call-template> 
            </span>
          </td>
          <td style=" height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="CRN">
              </xsl:with-param>
            </xsl:call-template> 
          </td>
        </tr>
      </xsl:for-each>	
      
      <!-- Line 3f was added per RIS ETA0801388OTH  - Schema ver 2008v2.0 -  PDF dated 2/29/2008 was used 4/9/08  SKM-->
      <tr>
        <td style="height:3mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;">f</td>
        <td style="height:3mm;text-align:left;border-bottom:1px black solid;">LUST tax on aviation fuels used in foreign trade</td>
        <td style="height:3mm;border-left:1px black solid;border-bottom:1px black solid;background-color:gray;">
          <span style="width:2.5mm;clear:none"></span>
          <span style="width:1.2mm;clear:none"></span>
        </td>
        <td style="height:3mm;border-left:1px black solid;border-bottom:1px black solid;">
          <span style="height:3mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:0mm;text-align:center">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/LUSTTaxAviationUseForeignTrade/Rate">
              </xsl:with-param>
            </xsl:call-template>
          </span>
        </td>
        <td style="height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/LUSTTaxAviationUseForeignTrade/Gallons">
            </xsl:with-param>
          </xsl:call-template> 
        </td>
        <td style="height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
          <span style="height:3mm;width:0.5m;text-align:bottom;text-aligh:left;padding-top:0mm;"></span>
          <span style="width:34mm;paddng-top:0mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/LUSTTaxAviationUseForeignTrade/Amount">
              </xsl:with-param>
            </xsl:call-template> 
          </span>
        </td>
        <td style="height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/KeroseneUseInAviation/LUSTTaxAviationUseForeignTrade/CRN">
            </xsl:with-param>
          </xsl:call-template> 
        </td>
      </tr>
  
      

      
      	
    </tbody>
  </table>
</div>      

<!--new section 4 Sales-->
<div class="styBB" style="width:187mm;border-top:1px black;height:3mm;">
  <div class="styLNLeftNumBox" style="text-align:left;">4</div>
  <div class="styLNDesc" style="width:150mm;">
    <span class="styBoldText" style="text-align:left;padding-right:8mm;padding-top:0.6mm" >
      Sales by Registered Ultimate Vendors of Gasoline
    </span>
  </div>
</div>
<div style="width:187mm;font-size:7pt;">
  <div class="styLNLeftNumBox" style="height:14mm;width:8mm;"></div>
  <div class="styLNDesc" style="width:170mm;height:14mm;text-align:justify;">
    <span class="styText">
      Claimant sold the gasoline at a tax-excluded price and has not collected the amount of tax from the buyer, repaid the 
      amount of tax to the buyer, or has obtained written consent of the buyer to make the claim; and obtained an unexpired 
      certificate from the buyer and has no reason to believe any information in the certificate is false. See the instructions for
      additional information to be submitted.
    </span>
  </div>
</div>
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:6mm;width:8mm;"></div>
  <div class="styLNDesc" style="width:170mm;height:6mm;text-align:justify;">
    <span class="styText" style="font-weight:bold;" >
      Caution. 
    </span>
    <span class="styText" style="font-style:italic;">
      Claims cannot be made on line 4a or 4b for gasoline purchased by a state or local government or a nonprofit 
      educational organization for its exclusive use with a credit card issued to the state or local government or nonprofit 
      educational organization by the credit card issuer.
    </span>
    <span style="width:9mm;clear:none;"></span>
  </div>
</div>

<!--new 4 sales table-->
<div style="width:187mm;">
  <table style="font-size:7pt;border-collapse:collapse;">
    <tbody>
      <tr>
        <th style="width=8mm;height:6.5mm;"><span style="width=1px;"></span></th>
        <th style="width=95mm;height:6.5mm;border-top:1px black solid;"><span style="width=1px;"></span></th>
        <th style="width=15mm;height:6.5mm;border-left:1px black solid;
          border-bottom:1px black solid;border-top:1px black solid;">(a) Rate<br/><br/></th>
        <th style="width=20mm;height:6.5mm;border-left:1px black solid;
          border-bottom:1px black solid;border-top:1px black solid;">(b) Gallons<br/><br/>
        </th>
        <th style="width=49mm;height:6.5mm;border-left:1px black solid;
          border-bottom:1px black solid;border-top:1px black solid;">
          (c) Amount of refund<br/>
          <span class="styItalicText" style="font-weight:normal;">
            Multiply col.
          </span>
          <span class="styItalicText" >
            (a)
          </span>
          <span class="styItalicText"  style="font-weight:normal">
            by col.
          </span>
          <span class="styItalicText" >
            (b)
          </span>
        </th>
        <th style="width=10mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;
          border-top:1px black solid;padding-bottom:2mm;">
          (d)<br/> CRN<br/>
        </th>
      </tr>
      <tr>
        <td style="height:8mm;width:8mm;text-align:center;font-weight=bold;" valign="bottom">a</td>
        <td style="height:8mm;text-align:left;border-bottom:1px black solid;" valign="bottom">
          Use by a nonprofit educational organization
        </td>
        <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;" valign="bottom">
          <span style="width:0.5mm;clear:none;"></span>$
          <span style="width:2mm;clear:none;"></span>
          <span style="width:1.2mm;clear:none;padding-top:2mm;">  
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/Gasoline/UsedByNonprofitEducationalOrg/Rate">
              </xsl:with-param>
            </xsl:call-template> 
          </span>
        </td>
        <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:2.8mm;" valign="bottom">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/Gasoline/UsedByNonprofitEducationalOrg/Gallons">
            </xsl:with-param>
          </xsl:call-template> 
        </td>
        <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;" valign="bottom">
          <span style="width:.5mm;text-align:bottom;text-aligh:left;">$</span>
          <span style="width:46.5mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/Gasoline/UsedByNonprofitEducationalOrg/Amount">
              </xsl:with-param>
            </xsl:call-template> 
          </span>
        </td>
        <td rowspan="2" style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/Gasoline/UsedByNonprofitEducationalOrg/CRN">
            </xsl:with-param>
          </xsl:call-template> 
        </td>
      </tr>
      <tr>
        <td style="height:6.5mm;width:8mm;text-align:center;font-weight=bold;border-bottom:1px black solid;" 
         valign="bottom">b</td>
        <td style="height:6.5mm;text-align:left;border-bottom:1px black solid;" 
         valign="bottom">Use by a state or local government</td>
        <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;" valign="bottom">
          <span style="width:0.5mm;clear:none;"></span>
          <span style="width:2.5mm;clear:none;"></span>
          <span style="width:1.2mm;clear:none;padding-top:2mm;padding-left:2mm;">  
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/Gasoline/UseByStateLocalGov/Rate">
              </xsl:with-param>
            </xsl:call-template> 
          </span>
        </td>
        <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;" 
         valign="bottom">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/Gasoline/UseByStateLocalGov/Gallons">
            </xsl:with-param>
          </xsl:call-template> 
        </td>
        <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;" valign="bottom">
          <span style="width:.5mm;text-align:bottom;text-aligh:left;"></span>
          <span style="width:46.5mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/Gasoline/UseByStateLocalGov/Amount">
              </xsl:with-param>
            </xsl:call-template> 
          </span>
        </td>
      </tr>
    </tbody>
  </table>
</div>      

<!--new section 5 sales -->
<div class="styBB" style="width:187mm;border-top:1px black;height:3mm;">
  <div class="styLNLeftNumBox" style="text-align:left;">5</div>
  <div class="styLNDesc" style="width:150mm;">
    <span class="styBoldText" style="text-align:left;padding-right:8mm;padding-top:0.6mm" >Sales by Registered Ultimate Vendors of Aviation Gasoline
    </span>
  </div>  
</div>
<div style="width:187mm;font-size:7pt;">
  <div class="styLNLeftNumBox" style="height:14mm;width:8mm;"></div>      
  <div class="styLNDesc" style="width:170mm;height:14mm;text-align:justify;">
    <span class="styText">
      Claimant sold the aviation gasoline at a tax-excluded price and has not collected the amount of tax from the buyer, repaid 
      the amount of tax to the buyer, or has obtained written consent of the buyer to make the claim; and obtained an unexpired 
      certificate from the buyer and has no reason to believe any information in the certificate is false. See the instructions for 
      additional information to be submitted.
    </span>
  </div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:9mm;width:8mm;"></div>
  <div class="styLNDesc" style="width:170mm;height:9mm;text-align:justify;">
    <span class="styText" style="font-weight:bold" >
      Caution. 
    </span>
    <span style="width:3px;clear:none"></span>
    <span class="styText" style="font-style:italic;">
      Claims cannot be made on line 5a or 5b for aviation gasoline purchased by a state or local government or a nonprofit 
      educational organization for its exclusive use with a credit card issued to the state or local government or nonprofit 
      educational organization by the credit card issuer.
    </span> 
    <span style="width:18mm;clear:none;"></span>
  </div>
</div>

<!--new 5 sales table-->
<div style="width:187mm;border-bottom:1px black solid;">
  <table style="font-size:7pt;border-collapse:collapse;">
    <tbody>
      <tr>
        <th style="width=8mm;height:6.5mm;"><span style="width=1px;"></span></th>
        <th style="width=95mm;height:6.5mm;border-top:1px black solid;"><span style="width=1px;"></span></th>
        <th style="width=15mm;height:6.5mm;border-left:1px black solid;
          border-top:1px black solid;border-bottom:1px black solid;">(a) Rate<br/><br/></th>
        <th style="width=20mm;height:6.5mm;border-left:1px black solid;
          border-top:1px black solid;border-bottom:1px black solid;">(b) Gallons<br/><br/>
        </th>
        <th style="width=49mm;height:6.5mm;border-left:1px black solid;border-top:1px black solid;
          border-bottom:1px black solid;">
          (c) Amount of refund<br/>
          <span class="styItalicText" style="font-weight:normal;">Multiply col. </span>
          <span class="styItalicText">(a) </span>
          <span class="styItalicText" style="font-weight:normal">by col. </span>
          <span class="styItalicText">(b) </span>
        </th>
        <th style="width=10mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;
          border-top:1px black solid;padding-bottom:2mm;">
          (d)<br/> CRN<br/>
        </th>
      </tr>
      <tr>
        <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;" valign="bottom">a</td>
        <td style="height:8mm;text-align:left;border-bottom:1px black solid;" valign="bottom">Use by a nonprofit educational organization</td>
        <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;" valign="bottom">
          <span style="width:0.5mm;clear:none;"></span>$
          <span style="width:2mm;clear:none;"></span>
          <span style="width:1.2mm;clear:none;padding-top:2mm;">  
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/AviationGasoline/UsedByNonprofitEducationalOrg/Rate">
              </xsl:with-param>
            </xsl:call-template> 
          </span>
        </td>
        <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;
          padding-top:2.8mm;" valign="bottom">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/AviationGasoline/UsedByNonprofitEducationalOrg/Gallons">
            </xsl:with-param>
          </xsl:call-template> 
        </td>
        <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;" valign="bottom">
          <span style="height:6mm;width:.5mm;text-align:bottom;test-aligh:left;padding-top:2.8mm;">$</span>
          <span style="height:6mm;width:46.5mm;padding-top:2.8mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/AviationGasoline/UsedByNonprofitEducationalOrg/Amount">
              </xsl:with-param>
            </xsl:call-template>
          </span>
        </td>
        <td rowspan="2" style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;" >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/AviationGasoline/UsedByNonprofitEducationalOrg/CRN">
            </xsl:with-param>
          </xsl:call-template> 
        </td>
      </tr>
      <tr>
        <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;" 
         valign="bottom">b</td>
        <td style="height:8mm;text-align:left;border-bottom:1px black solid;" valign="bottom">
          Use by a state or local government
        </td>
        <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;" valign="bottom">
          <span style="width:6mm;clear:none;padding-left:5.2mm;text-align:center">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/AviationGasoline/UseStateLocalGov/Rate">
              </xsl:with-param>
            </xsl:call-template>
          </span>
        </td>
        <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;
          text-align:right;padding-top:2mm;" valign="bottom">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/AviationGasoline/UseStateLocalGov/Gallons">
            </xsl:with-param>
          </xsl:call-template> 
        </td>
        <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;" valign="bottom">
          <span style="width:2mm;text-align:left;"></span>
          <span style="width:45mm;padding-top:1.7mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/AviationGasoline/UseStateLocalGov/Amount">
              </xsl:with-param>
            </xsl:call-template> 
          </span>
        </td>
      </tr>
    </tbody>
  </table>
</div>      

<!--footnote-->
<div style="width:187mm">
  <span style="width:104mm;font-weight:bold;text-align:left;font-size:6pt;"></span>
  <span style="width:5mm;"></span>
  <span style="width:18mm;font-weight:normal;font-size:6pt;"></span> 
  <span style="width:7mm;"></span>  
  <span style="text-align:right;width:30mm;font-weight:bold;font-size:6pt;">
    Schedule 2 (Form 8849)
  </span> 
  <span style="text-align:right;width:20mm;font-weight:normal;font-size:6pt;">(Rev. 3-2008)</span> 
</div>
<br class="pageEnd"/>
<div style="width:187mm;border-bottom:2px black solid;">
  <span style="width:104mm;font-weight:normal;text-align:left;font-size:7pt;"> 
    Schedule 2 (Form 8849) (Rev. 3-2008)
  </span>
  <span style="width:5mm;"></span>  
  <span style="width:18mm;font-weight:normal;font-size:7pt;"></span>
  <span style="width:7mm;"></span>  
  <span style="text-align:right;width:20mm;font-weight:bold;font-size:7pt;"></span> 
  <span style="text-align:right;width:30mm;font-weight:normal;font-size:7pt;">Page</span> 
  <span style="width:4px"></span>
  <span style="text-align:right;width:1mm;font-weight:bold;font-size:7pt;">3</span> 
</div>

<!--  Name / Employer identification number -->
<div style="width:187mm">
  <table cellspacing="0" style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
    <tr>
      <td class="styNameBox" style="width:143mm;font-size:7pt;font-weight:normal; height:10mm">Name as shown on Form 8849<br/>
        <span style="font-size:6.373pt;">
          <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
          </xsl:call-template><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
          </xsl:call-template>	
        </span>
      </td>
      <td valign="top" class="styNameBox" style="padding-left:2mm;font-size:7pt;font-weight:normal; height:10mm; border-right-width:0px">EIN<br/>
        <xsl:choose>
          <xsl:when test="normalize-space($FormData/EmployerIdentificationNumber) != ''">
            <xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="$FormData/EmployerIdentificationNumber"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="normalize-space($FormData/MissingEINReason) != ''">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/MissingEINReason"/>
              </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if test="($RtnHdrData/Filer/EIN)">
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
              </xsl:call-template>		
            </xsl:if>
            <xsl:if test="($RtnHdrData/Filer/SSN) and not ($RtnHdrData/Filer/EIN)">
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
                </xsl:call-template>		
            </xsl:if>                 
          </xsl:otherwise>
        </xsl:choose>
      </td>
    </tr>
  </table>
</div>
<!--  end Name / Employer identification number --> 

<!-- section 6 Government-->
<div class="styBB" style="width:187mm;border-top:1px black;">
  <div class="styLNLeftNumBox" style="height:9mm;text-align:left"><br/>6</div>
  <div class="styLNDesc" style="width:150mm;height:9mm;">
    <span class="styBoldText" ><br/>Government Unit Information</span>   
  </div>
</div>

<div style="width:187mm;font-size:7pt;border-bottom:1px black solid;">
  <div class="styLNLeftNumBox" style="height:7mm;width:8mm;"></div>
  <div class="styLNDesc" style="width:175mm;height:7mm;">
    Complete if making a claim on lines 1a or 2a; or lines 3d and 3e for type of use 14. Enter the information below for <br/>
    each governmental unit to whom the fuel was sold. If more space is needed, attach additional sheets.
  </div>
  <!-- button display logic -->
  <div style="float:right">
    <br/>
    <xsl:call-template name="SetDynamicTableToggleButton" >
      <xsl:with-param name="TargetNode" select="$FormData/GovernmentUnitInformation" />
      <xsl:with-param name="containerHeight" select="11" />
      <xsl:with-param name="containerID" select=" 'PSOctn' " />
    </xsl:call-template>
  </div>
  <!-- end button display logic -->
</div>  
 
<div class="styBB" style="width:187mm;border-top:1px black;border-bottom:0px;">
  <div class="styTableContainer" style="height:25.5mm;" id="PSOctn">
    <xsl:call-template name="SetInitialState"/>
    <table style="font-size:7pt;cellspacing:0;border-collapse:collapse;">
      <thead>
        <tr>
          <th style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
            border-bottom-width:1;text-align:center;">Taxpayer Identification No.
          </th>
          <th style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
            border-right-width:1;border-bottom-width:1;text-align-center">Name
          </th>
          <th style="width=42mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
            border-bottom-width:1;text-align:center;">Gallons</th>
        </tr>
      </thead>
      <tbody>
        <xsl:if test="(count($FormData/GovernmentUnitInformation) &lt; 12 or ($Print != $Separated))" >
          <xsl:for-each select="$FormData/GovernmentUnitInformation">
           <tr>
              <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
                border-bottom-width:1;text-align:center;">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="TaxpayerIdentificationNo">
                  </xsl:with-param>
                </xsl:call-template> 
              </td>
              <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
                border-right-width:1;border-bottom-width:1;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1">
                  </xsl:with-param>
                </xsl:call-template> 
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2"></xsl:with-param>
                </xsl:call-template> 
              </td>
              <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
                border-bottom-width:1;text-align:right;padding-left:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="Gallons">
                  </xsl:with-param>
                </xsl:call-template> 
              </td>
            </tr>            
          </xsl:for-each>
        </xsl:if>
        <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 1 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$FormData/GovernmentUnitInformation">
                </xsl:with-param>
              </xsl:call-template>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;
              border:0 black solid;border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;
              border:0 black solid;border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 2 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td  style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 3 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 4 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 5 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 6 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 7 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 8 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 9 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 10 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 11 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border-right-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border-right-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
      </tbody>
    </table>
    <!-- Set Initial Height of Above Table -->
    <xsl:call-template name="SetInitialDynamicTableHeight">
      <xsl:with-param name="TargetNode" select="$FormData/GovernmentUnitInformation"/>
      <xsl:with-param name="containerHeight" select="11"/>
      <xsl:with-param name="containerID" select=" 'PSOctn' "/>
    </xsl:call-template>
    <!-- End Set Initial Height of Above Table -->
  </div>
</div>

<!--new section 7-->
<div class="styBB" style="width:187mm;border-top:1px black;">
  <div class="styLNLeftNumBox" style="height:9mm;text-align:left"><br/>7</div>
  <div class="styLNDesc" style="width:150mm;height:9mm;">
    <span class="styBoldText" ><br/>Nonprofit Educational Organization and Government Unit Information</span>   
  </div>
</div>
<div style="width:187mm;font-size:7pt;border-bottom:1px black solid;">
  <div class="styLNLeftNumBox" style="height:7mm;width:8mm;"></div>
  <div class="styLNDesc" style="width:175mm;height:7mm;">
    Complete if making a claim on lines 4a, 4b, 5a, or 5b. Enter the information below for each nonprofit educational organization
    <br/> or governmental unit to whom the gasoline or aviation gasoline was sold. If more space is needed, attach additional 
    sheets.
  </div>
  <!-- button display logic -->
  <div style="float:right">
    <br/>
    <xsl:call-template name="SetDynamicTableToggleButton" >
      <xsl:with-param name="TargetNode" select="$FormData/NonprofitEdOrgAndGovtUnitInfo"/>
      <xsl:with-param name="containerHeight" select="11"/>
      <xsl:with-param name="containerID" select=" 'PSOctn2' "/>
    </xsl:call-template>
  </div>
  <!-- end button display logic -->
</div>  

<div class="styBB" style="width:187mm;border-top:1px black;border-bottom:0px;">
  <div class="styTableContainer" style="height:25.5mm;" id="PSOctn2">
    <xsl:call-template name="SetInitialState" />
    <table style="font-size:7pt;cellspacing:0;border-collapse:collapse;">
      <thead>
        <tr>
          <th style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;border-bottom-width:1;text-align:center;">
            Taxpayer Identification No.
          </th>
          <th style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
            border-right-width:1;border-bottom-width:1;text-align-center">
            Name
          </th>
          <th style="width=42mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
            border-bottom-width:1;text-align:center;">
            Gallons
          </th>
        </tr>
      </thead>
      <tbody>
        <xsl:if test="(count($FormData/NonprofitEdOrgAndGovtUnitInfo) &lt; 12 or ($Print != $Separated))" >
          <xsl:for-each select="$FormData/NonprofitEdOrgAndGovtUnitInfo">
            <tr>
              <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
                border-bottom-width:1;text-align:center;">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="TaxpayerIdentificationNo">
                  </xsl:with-param>
                </xsl:call-template> 
              </td>
              <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
                border-right-width:1;border-bottom-width:1;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1">
                  </xsl:with-param>
                </xsl:call-template> 
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2">
                  </xsl:with-param>
                </xsl:call-template> 
              </td>
              <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
                border-bottom-width:1;text-align:right;padding-left:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="Gallons">
                  </xsl:with-param>
                </xsl:call-template> 
              </td>
            </tr>
          </xsl:for-each>
        </xsl:if>
        <xsl:if test="count($FormData/NonprofitEdOrgAndGovtUnitInfo) &lt; 1 or 
          (count($FormData/NonprofitEdOrgAndGovtUnitInfo) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$FormData/NonprofitEdOrgAndGovtUnitInfo">
                </xsl:with-param>
              </xsl:call-template>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/NonprofitEdOrgAndGovtUnitInfo) &lt; 2 or 
          (count($FormData/NonprofitEdOrgAndGovtUnitInfo) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/NonprofitEdOrgAndGovtUnitInfo) &lt; 3 or 
          (count($FormData/NonprofitEdOrgAndGovtUnitInfo) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/NonprofitEdOrgAndGovtUnitInfo) &lt; 4 or 
          (count($FormData/NonprofitEdOrgAndGovtUnitInfo) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/NonprofitEdOrgAndGovtUnitInfo) &lt; 5 or 
          (count($FormData/NonprofitEdOrgAndGovtUnitInfo) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/NonprofitEdOrgAndGovtUnitInfo) &lt; 6 or 
          (count($FormData/NonprofitEdOrgAndGovtUnitInfo) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/NonprofitEdOrgAndGovtUnitInfo) &lt; 7 or 
          (count($FormData/NonprofitEdOrgAndGovtUnitInfo) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/NonprofitEdOrgAndGovtUnitInfo) &lt; 8 or 
          (count($FormData/NonprofitEdOrgAndGovtUnitInfo) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/NonprofitEdOrgAndGovtUnitInfo) &lt; 9 or 
          (count($FormData/NonprofitEdOrgAndGovtUnitInfo) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/NonprofitEdOrgAndGovtUnitInfo) &lt; 10 or 
          (count($FormData/NonprofitEdOrgAndGovtUnitInfo) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="count($FormData/NonprofitEdOrgAndGovtUnitInfo) &lt; 11 or 
          (count($FormData/NonprofitEdOrgAndGovtUnitInfo) &gt; 11 and ($Print = $Separated))" >
          <tr>
            <td style="width=44mm;height:7.7mm;border:0 black solid;border-right-width:1;
              border-bottom-width:1;text-align:center;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-right-width:1;border-bottom-width:1;">
              <span style="width=1px;"></span>
            </td>
            <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
              border-bottom-width:1;text-align:right;">
              <span style="width=1px;"></span>
            </td>
          </tr>
        </xsl:if>
      </tbody>
    </table>
    <!-- Set Initial Height of Above Table -->
    <xsl:call-template name="SetInitialDynamicTableHeight">
      <xsl:with-param name="TargetNode" select="$FormData/NonprofitEdOrgAndGovtUnitInfo"/>
      <xsl:with-param name="containerHeight" select="11"/>
      <xsl:with-param name="containerID" select=" 'PSOctn2' "/>
    </xsl:call-template>
    <!-- End Set Initial Height of Above Table -->
  </div>
</div>

<div style="width:187mm">
  <span style="width:104mm;font-weight:bold;text-align:left;font-size:6pt;"></span>
  <span style="width:5mm;"></span>  
  <span style="width:18mm;font-weight:normal;font-size:6pt;"></span> 
  <span style="width:7mm;"></span>  
  <span style="text-align:right;width:30mm;font-weight:bold;font-size:6pt;">Schedule 2 (Form 8849)</span> 
  <span style="text-align:right;width:20mm;font-weight:normal;font-size:6pt;">(Rev. 3-2008)</span> 
</div>
<br class="pageEnd"/>
<!--header 6 -->

<!-- Additonal Data Title Bar and Button -->
<div class="styLeftOverTitleLine" id="LeftoverData">
  <div class="styLeftOverTitle">
    Additional Data        
  </div>
  <div class="styLeftOverButtonContainer">
    <input class="styLeftoverTableBtn" TabIndex="1"  type="button" 
      value="Return to Form" onclick="javascript:returnToWriteInImage();" />
  </div>      
</div>

<!-- Additional Data Table -->
<table class="styLeftOverTbl">
  <xsl:call-template name="PopulateCommonLeftover">
    <xsl:with-param name="TargetNode" select="$FormData" />
    <xsl:with-param name="DescWidth" select="100"/>
  </xsl:call-template>          
</table>

<!--print section 6-->
<xsl:if test="(count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))" >
  <div class="styLNDesc" style="width:187mm;height:4mm;">
    <span class="styText" style="font-weight:bold">
      <br/>IRS Form 8849 Schedule 2, Section 6, Government Unit Information
    </span>
  </div>
  <table  class="styDepTbl" style="font-size:7pt;cellspacing:0;border-collapse:collapse;">
    <thead class="styTableThead">
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" style="width=44mm;height:7.7mm;border:0 black solid;
          border-right-width:1;border-bottom-width:1;text-align:center;">
          Taxpayer Identification No.
        </th>
        <th class="styDepTblCell" style="width=99mm;height:7.7mm;border-left:1px black solid;
          border:0 black solid;border-right-width:1;border-bottom-width:1;text-align-center">
          Name
        </th>
        <th class="styDepTblCell" style="width=42mm;height:7.7mm;border-left:1px black solid;
          border:0 black solid;border-bottom-width:1;text-align:center;">
          Gallons
        </th>
      </tr>
    </thead>
    <tbody>
      <xsl:for-each select="$FormData/GovernmentUnitInformation">
        <tr>
          <xsl:attribute name="class">
            <xsl:choose>
              <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
              <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="width=44mm;height:7.7mm;border:0 black solid;
            border-right-width:1;border-bottom-width:1;text-align:center;">
            <xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="TaxpayerIdentificationNo">
              </xsl:with-param>
            </xsl:call-template> 
          </td>
          <td class="styDepTblCell" style="width=99mm;height:7.7mm;border-left:1px black solid;
            border:0 black solid;border-right-width:1;border-bottom-width:1;text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1">
              </xsl:with-param>
            </xsl:call-template> 
            <br/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2">
              </xsl:with-param>
            </xsl:call-template> 
          </td>
          <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
            border-bottom-width:1;text-align:right;padding-left:7mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="Gallons">
              </xsl:with-param>
            </xsl:call-template> 
          </td>
        </tr>
      </xsl:for-each>
    </tbody>
  </table>
</xsl:if>
<br/>

<!--header 7-->

<!--print section 7-->
<xsl:if test="(count($FormData/NonprofitEdOrgAndGovtUnitInfo) &gt; 11 and ($Print = $Separated))" >
  <div class="styLNDesc" style="width:187mm;height:4mm;">
    <span class="styText" style="font-weight:bold">
      <br/>IRS Form 8849 Schedule 2, Section 7, Nonprofit Educational Organization and Government Unit Information
    </span>
  </div>
  <table class="styDepTbl" style="font-size:7pt;cellspacing:0;border-collapse:collapse;">
    <thead class="styTableThead">
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" style="width=44mm;height:7.7mm;border:0 black solid;
          border-right-width:1;border-bottom-width:1;text-align:center;">
          Taxpayer Identification No.
        </th>
        <th class="styDepTblCell" style="width=99mm;height:7.7mm;border-left:1px black solid;
          border:0 black solid;border-right-width:1;border-bottom-width:1;text-align-center">
          Name
        </th>
        <th class="styDepTblCell" style="width=42mm;height:7.7mm;border-left:1px black solid;
          border:0 black solid;border-bottom-width:1;text-align:center;">
          Gallons
        </th>
      </tr>
    </thead>
    <tbody>
      <xsl:for-each select="$FormData/NonprofitEdOrgAndGovtUnitInfo">
        <tr>
          <xsl:attribute name="class">
            <xsl:choose>
              <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
              <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="width=44mm;height:7.7mm;border:0 black solid;
            border-right-width:1;border-bottom-width:1;text-align:center;">
            <xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="TaxpayerIdentificationNo">
              </xsl:with-param>
            </xsl:call-template> 
          </td>
          <td class="styDepTblCell" style="width=99mm;height:7.7mm;border-left:1px black solid;
            border:0 black solid;border-right-width:1;border-bottom-width:1;text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1">
              </xsl:with-param>
            </xsl:call-template> 
            <br/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2">
              </xsl:with-param>
            </xsl:call-template> 
          </td>
          <td style="width=35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;
            border-bottom-width:1;text-align:right;padding-left:7mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="Gallons">
              </xsl:with-param>
            </xsl:call-template> 
          </td>
        </tr>
      </xsl:for-each>
    </tbody>
  </table>
</xsl:if>
<br/>
</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>