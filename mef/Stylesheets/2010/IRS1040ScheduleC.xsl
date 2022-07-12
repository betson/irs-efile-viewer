<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS1040ScheduleCStyle.xsl"/>
<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
<xsl:param name="Form1040ScheduleCData" select="$RtnDoc/IRS1040ScheduleC" />
<xsl:template match="/">
<html lang="EN-US">
<head>
  <title>
  <xsl:call-template name="FormTitle">
  <xsl:with-param name="RootElement" select="local-name($Form1040ScheduleCData)">
  </xsl:with-param></xsl:call-template>
  </title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private" />
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="Description" content="IRS Form 1040ScheduleC" />
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS">
    </xsl:call-template>
 <style type="text/css"> 
 <xsl:if test="not($Print) or $Print=''">
        <!-- Form 1040ScheduleF CSS Styles are located in the template called below -->
        <xsl:call-template name="IRS1040ScheduleCStyle"></xsl:call-template>
        <xsl:call-template name="AddOnStyle"></xsl:call-template>
  </xsl:if>
  </style>  
  <xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass" >
  <form name="Form1040ScheduleC">
    <!-- WARNING LINE -->
    <xsl:call-template name="DocumentHeader"></xsl:call-template>
    <!-- Begin Form Number and Name -->
<!-- put comment here -->
    <div class="styBB" style="width:187mm;height:20mm;">
      <div class="styFNBox" style="width:29mm;height:24mm;">
        <div style="padding-top:1mm;line-height:180%;">                  
          <span class="styFormNumber" style="font-size:9pt;" >SCHEDULE C</span>
          <br/>
          <span class="styFormNumber" style="font-size:9pt;padding-top:2mm;">(Form 1040)</span>
          <br/>
        </div>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData"/>
        </xsl:call-template>
        <div style="padding-top:2mm;">
          <span class="styAgency">Department of the Treasury</span><br/>
          <span class="styAgency">Internal Revenue Service <span style="width:1mm" /> (99)</span>  
        </div>
      </div>
      <div class="styFTBox" style="width:127mm;height:20mm; ">
        <div class="styMainTitle" style="height:4mm;margin-top:2mm;">Profit or Loss From Business    
        <div class="styFBT" style="height:1mm;font-size:7pt;margin-top:3mm;">
         <b>(Sole Proprietorship)</b>
          </div>
          </div>    
 <div class="styFBT" style="height:3mm;margin-top:2mm;font:size:6pt;width:127mm;">
 <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif"  alt="Bullet Image"/> Partnerships, joint ventures, etc., generally must file Form 1065 or 1065-B.<br/>
          <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif"  alt="Bullet Image"/> Attach to Form 1040, 1040NR, or 1041. <span style="width:.5mm;"></span>
          <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif"  alt="Bullet Image"/>  See Instructions for Schedule C (Form 1040).        
        </div>
      </div>
      <div class="styTYBox" style="width:30mm;height:20mm;">
        <div class="styOMB" style="height:2mm;"><span style="width:5mm;"></span>
        <!--<span style="font-size:6pt;text-align:right;">Version A, Cycle 1</span>--><br/>
        OMB No. 1545-0074</div>
        <div class="styTaxYear">
          20<span class="styTYColor">10</span>
        </div>
        <div  style="margin-left:2mm; text-align:left;">
          Attachment<br/>Sequence No. <span class="styBoldText">09</span>
        </div>
      </div>
    </div>
    <!-- End Form Number and Name section -->
    <div class="styBB" style="width:187mm;">
      <div class="styNameBox" style="width:139mm;height:8mm;font-size:7pt;">
        Name of proprietor<br/>  <br/>
      <!--  <span class="stySmallText">-->         
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NameOfProprietor" />
          </xsl:call-template>            
      <!--  </span>-->    
      </div>        
      <div class="styEINBox" style="width:46mm;height:8mm;font-size:7pt;padding-left:2mm;">
        Social security number (SSN)<br/><br/>
        <span class="styEINFld" style="width:30mm; text-align:left;font-weight:normal;">
        <xsl:call-template name="PopulateSSN">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/SSN" />
          </xsl:call-template>            
        </span>  
      </div>
    </div>
     <!-- Item A-->
    <div class="styBB" style="width:187mm;">
      <div class="styLNLeftNumBox" style="width:3mm; height:4.5mm;padding-left: 0px">A</div>
      <div class="styNameBox" style="width:134mm;height:8mm;padding-top:1mm;font-size:7pt;border-right-width: 0px;">
        <span style="width:4px;"></span>
        Principal business or profession, including product or service (see page C-2 of the instructions)<br/>          
        <span style="width:4px;"></span> <br/>       
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/PrincipalBusinessActivity" />
        </xsl:call-template>          
      </div>
 <!-- Item B-->
      <div class="styForm1040ScheduleCEINFullBox" style="width:50mm;height:10.5mm;float:right;">
        <div class="styLNLeftNumBox" style="width:.5mm; height:4.5mm;padding-top:0mm;">B</div>
        <span style="width:1px;"></span>
        <span style="padding-top:3.5mm;">Enter code from pages C-9, 10 &amp; 11</span>
        <br/>
        <span style="padding-left:5.5mm;"><img src="{$ImagePath}/1040SchC_Bullet_Lg.gif"  alt="Bullet Image"/></span>
        <span class="styEINFld" style="width:30mm;font-size:6pt; text-align:center;">
        <xsl:if test="$Form1040ScheduleCData/BusinessActivityCode">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessActivityCode" />
          </xsl:call-template> 
          </xsl:if>  
            <xsl:if test="$Form1040ScheduleCData/UnclassifiedEstablishmentCd">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/UnclassifiedEstablishmentCd" />
          </xsl:call-template> 
          </xsl:if>         
        </span>  
      </div>
    </div>
 <!-- Item C-->
    <div   class="styBB"   style="width:187mm;">        
      <div class="styLNLeftNumBox" style="width:3mm; height:4.5mm;padding-top:1mm;padding-left: 0px;">C</div>   
      <div class="styLNDesc" style="width:136mm;height:7.5mm;padding-top:1mm;">
        Business name. If no separate business name, leave blank. 
       <br/>         
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessName" />
          </xsl:call-template>            
     </div>     
       <!-- Item D-->
      <div class="styOMB" style="width:48mm;height:4.5mm;border-left-width:1px;float:right; border-bottom-width:0px;">
        <div class="styLNLeftNumBox" style="width:4mm; height:2.5mm;font-size:6pt;font-weight:bold;padding-bottom:1.5mm;padding-left:1.5mm;">D</div>
        <span style="width:2px;"></span>
        <span style="padding-top:1.5mm;font-size:6pt;font-weight:bold;">Employer ID number (EIN), if any</span>
        <br/>     
        <span class="styEINFld" style="width:30mm; text-align:left;">                   
             <xsl:choose>
                 <xsl:when test="$Form1040ScheduleCData/EIN">
                   <xsl:call-template name="PopulateEIN"> 
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/EIN" />
                   </xsl:call-template>          
                 </xsl:when>
                 <xsl:otherwise>
                   <xsl:call-template name="PopulateReturnHeaderFiler"> 
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/EIN" />
                   </xsl:call-template>          
                 </xsl:otherwise>
              </xsl:choose>                 
        </span>  
      </div>
      <br/>
    </div>      
    <!--Item E-->     
    <div class="styBB" style= "width:187mm;" >        
      <div class="styLNLeftNumBox" style="height:4mm;width:3mm;padding-top:1mm;padding-left: 0px">E</div>
      <div class="styLNDesc" style="width:65mm;height:4.5mm;padding-top:1mm;">
        Business address (including suite or room no.) 
         <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif"  alt="Bullet Image"/>   
          <br/>City, town or post office, state, and ZIP code
         </div>
         <div class="styLNDesc" style="width:110mm;height:4.5mm;padding-top:1mm;">
         <xsl:if test="$Form1040ScheduleCData/BusinessUSAddress/AddressLine1">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessUSAddress/AddressLine1" />
          </xsl:call-template> 
          </xsl:if>  
          <xsl:if test="$Form1040ScheduleCData/BusinessForeignAddress/AddressLine1">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessForeignAddress/AddressLine1" />
          </xsl:call-template> 
          </xsl:if>  
     <br/>
          <xsl:if test="$Form1040ScheduleCData/BusinessUSAddress/AddressLine2">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessUSAddress/AddressLine2" />
          </xsl:call-template> 
          </xsl:if>      
          <xsl:if test="$Form1040ScheduleCData/BusinessForeignAddress/AddressLine2">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessForeignAddress/AddressLine2" />
          </xsl:call-template> 
          </xsl:if>      
       <br/>
         <xsl:if test="$Form1040ScheduleCData/BusinessUSAddress/City">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessUSAddress/City" />
          </xsl:call-template> 
            </xsl:if>    
          <xsl:if test="$Form1040ScheduleCData/BusinessForeignAddress/City">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessForeignAddress/City" />
          </xsl:call-template> 
            </xsl:if>    
            
         <xsl:if test="$Form1040ScheduleCData/BusinessUSAddress/State">,
           <span style="width:3mm;"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessUSAddress/State" />
          </xsl:call-template> 
            </xsl:if>   
        <xsl:if test="$Form1040ScheduleCData/BusinessForeignAddress/ProvinceOrState">,
           <span style="width:3mm;"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessForeignAddress/ProvinceOrState" />
          </xsl:call-template> 
            </xsl:if>   
            
            
         <xsl:if test="$Form1040ScheduleCData/BusinessUSAddress/ZIPCode">
          <span style="width:3mm;"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessUSAddress/ZIPCode" />
          </xsl:call-template> 
            </xsl:if>   
          <xsl:if test="$Form1040ScheduleCData/BusinessForeignAddress/PostalCode">
          <span style="width:3mm;"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessForeignAddress/PostalCode" />
          </xsl:call-template> 
            </xsl:if>   
             
           <xsl:if test="$Form1040ScheduleCData/BusinessForeignAddress/Country">
           <span style="width:3mm;"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessForeignAddress/Country" />
          </xsl:call-template> 
            </xsl:if>   
                 </div>
   
    </div>
    <!-- Item F-->
    <div class="styBB" style= "width:187mm;" >        
      <div class="styLNLeftNumBox" style="height:4mm;width:3mm;padding-top:1mm;padding-left: 0px">F</div>
      <div class="styLNDesc" style="width:152mm;height:4.5mm;padding-top:1mm;">
        Accounting method:   <span style="width:2px;"></span> 
         <span class="styBoldText">(1)<span style="width: 2mm;"></span></span>
        <input type="checkbox" class="styCkbox">
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MethodOfAccountingCashInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodCash</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MethodOfAccountingCashInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodCash</xsl:with-param>
          </xsl:call-template>
          Cash
        </label>
        <span style="width:20px;"></span>
        <span class="styBoldText">(2)<span style="width: 2mm;"></span></span>
        <input type="checkbox" class="styCkbox">
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MethodOfAccountingAccrualInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodAccrual</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MethodOfAccountingAccrualInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodAccrual</xsl:with-param>
          </xsl:call-template>
          Accrual
        </label>   
         <span style="width:20px;"></span>
        <span class="styBoldText">(3)<span style="width: 2mm;"></span></span>
        <input type="checkbox" class="styCkbox">
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MethodOfAccountingOtherInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodAccrual</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MethodOfAccountingOtherInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodAccrual</xsl:with-param>
          </xsl:call-template>
          Other (specify)
        </label>   
             <span style="width:5px;"></span>
             <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif"  alt="Bullet Image"/>
              <xsl:if test="$Form1040ScheduleCData/MethodOfAccountingOtherInd">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MethodOfAccountingOtherInd/@methodOfAccountingOtherAttr" />
          </xsl:call-template> 
            </xsl:if>  
      </div>
       <!--Item G-->     
    <div class="styBB" style= "width:187mm;border-bottom-width: 0px;" >        
      <div class="styLNLeftNumBox" style="width:3mm;padding-top:0mm;padding-left: 0px">G</div>
      <div class="styLNDesc" style="width:184mm;padding-top:0mm;">
        Did you "materially participate" in the operation of this business during 2010? If "No," see page C-3 for limit on losses    
           <span style="width: 2mm;"></span>             
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MaterialParticipationInCYInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodCash</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MaterialParticipationInCYInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodCash</xsl:with-param>
          </xsl:call-template>
         <b>Yes</b> 
        </label>                    
             <span style="width: 2mm;"></span>
         <input type="checkbox"  class="styCkbox"  name="Checkbox">
            <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MaterialParticipationInCYInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodCash</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
           <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MaterialParticipationInCYInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodCash</xsl:with-param>
          </xsl:call-template>
          <b> No</b> 
        </label>                        
      </div>        
    <!--Item H-->
    <div class="styBB" style= "width:187mm;border-bottom-width: 0px;" >        
      <div class="styLNLeftNumBox" style="width:3mm;padding-top:0mm;padding-left: 0px">H</div>
      <div class="styLNDesc" style="width:184mm;padding-top:0mm;">
         <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NewBusinessInCurrentYearInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCNewBusinessInCurrentYearInd</xsl:with-param>
          </xsl:call-template>
           If you started or acquired this business during 2010, check here
        </label>                    
        <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.   
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.   
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
        <span style="width:4px;"></span>
             <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif"  alt="Bullet Image"/>
           <span style="width: 1mm;"></span>             
        <input type="checkbox" class="styCkbox">
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NewBusinessInCurrentYearInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCNewBusinessInCurrentYearInd</xsl:with-param>
          </xsl:call-template>
        </input>  
           
      </div>
      </div>
    </div>
          </div>
    <!-- BEGIN Part I Title -->
    <div class="styBB" style="width:187mm;">
          <div class="styPartName">Part I</div>
           <div class="styPartDesc"> <b>Income </b>             
      </div>
      </div>    
    <!-- END Part I Title --> 
    <!--Line 1-->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:16mm;">1</div>
      <div class="styLNDesc" style="width:112mm;height:16mm;">
        Gross receipts or sales. <b>Caution.</b> See page C-4 and check the box if:
         <div class="styLNDesc" style="width:112mm;padding-top:1mm;">
         <li>This income was reported to you on Form W-2 and the "Statutory employee" box <br/>on that form was checked ,  or </li>     
          <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/StatutoryEmployeeOrQJVInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCStatutoryEmployeeOrQJVInd</xsl:with-param>
          </xsl:call-template>
         <li>You are a member of a qualified joint venture reporting only rental real estate<br/> income not subject   
         to self-employment tax. Also see page C-3 for limit on losses.</li> 
        </label>  
         </div>        
           </div>        
         <div class="styLNDesc" style="width:2mm; height:7mm;padding-top:4mm;">
        <img src="{$ImagePath}/1040SchC_Bracket.gif"  align="bottom" height="50mm" alt="Curly Bracket Image"/>              
      </div>
      <div class="styLNDesc" style="width:25.3mm;height:16mm;padding-top:6mm;padding-left:2mm;">
           <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/GrossReceiptsOrSalesAmt"/>
        </xsl:call-template>
          <span class="styBoldText">
          <span style="width:10px;"></span>.
          <span style="width:10px;"></span>.    
           <span style="width:10px;"></span>.    
            </span>
            <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif"  alt="Bullet Image"/>
             <input type="checkbox" class="styCkbox">
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/StatutoryEmployeeOrQJVInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCStatutoryEmployeeOrQJVInd</xsl:with-param>
          </xsl:call-template>
        </input> 
               </div>         
      <div class="styLNRightNumBox" style="height:13mm;padding-top:8mm;width:8mm;">1</div>
      <div class="styLNAmountBox" style="height:13mm;padding-top:8mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/GrossReceiptsOrSalesAmt" />
        </xsl:call-template>      
      </div>        
         <div class="styLNRightNumBox" style="height:5.5mm;width:8mm;border-bottom-width:0px; "></div>
      <div class="styLNAmountBox" style="border-bottom-width:0px;height:5.5mm;width:31.5mm; ">
      </div>          
    </div>
    <!--Line 2-->
    <div style="width:187mm;">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;font-size:7pt">Returns and allowances
        <!--Dotted Line-->
        <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
           <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
           <span style="width:16px;"></span>.  
           <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.   
          <span style="width:16px;"></span>.  
           <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
           <span style="width:16px;"></span>.  
           <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.   
          <span style="width:16px;"></span>.  
           <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.   
        </span>
      </div>
      <div class="styLNRightNumBox" style="height:5mm;width:8mm; ">2</div>
      <div class="styLNAmountBox" style="border-bottom-width:1px;height:5mm;width:31.5mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ReturnsAndAllowancesAmt" />
        </xsl:call-template>     
      </div>          
    </div>
      <!-- Line 3-->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Subtract line 2 from line 1
        <!--Dotted Line-->
        <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">3</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NetGrossReceiptsAmt" />
        </xsl:call-template>    
      </div>    
    </div>    
    <!--Line 4-->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Cost of goods sold (from line 42 on page 2)
        <!--Dotted Line-->
        <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
         <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.                     
        </span>      
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">4</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/CostOfGoodsSoldAmt" />
        </xsl:call-template>
      </div>    
    </div>  
    <!--Line 5-->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">5</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;"><b>Gross profit.</b> Subtract line 4 from line 3
        <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.           
        </span>    
          </div>  
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">5</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/GrossProfitAmt" />
        </xsl:call-template>
      </div>  
    </div>
    <!--Line 6-->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">6</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Other income, including federal and state gasoline or fuel tax credit or refund (see page C-4)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
        </span>    
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">6</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherIncomeAmt" />
        </xsl:call-template>
      </div>  
    </div>
<!--Line 7-->   
     <div class="styBB" style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">7</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;"><b>Gross income.</b> Add lines 5 and 6
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.  
        </span>   
           <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif"  alt="Bullet Image"/>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;border-bottom-width: 0px;width:8mm; ">7</div>
      <div class="styLNAmountBox" style="height:4mm;border-bottom-width: 0px; width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/GrossIncomeAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    <!-- BEGIN Part II Title -->
    <div class="styBB" style="width:187mm;">
      <div class="styPartName">Part II</div>
      <div class="styPartDesc" style="font-weight: normal;"> <b>Expenses. </b> Enter expenses for business use of your home <b>only</b> on line 30.             
      </div>
    </div>
    <!-- END Part II Title -->    
    <!-- BEGIN Part II Line Items -->
    <div class="styBB" style="width:187mm;">      
      <!-- BEGIN Left Side Table of Part II-->
      <table class="styTable" style="width:94mm;float:left;font-size:7pt;" cellspacing="0">
        <thead></thead>
        <tfoot></tfoot>
        <tbody>
        <!--Line 8-->
          <tr style="width:94mm;">
            <td class="styLNLeftNumBoxSD" style="vertical-align:top;width:5mm;padding-top:1mm;height:5mm;">8</td>
            <td style="width:41mm;vertical-align:top;padding-top:1mm;font-size:7pt" >
             Advertising
              <!--Dotted Line--> 
               <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>                          
            <td class="styLNRightNumBox" style="width:7.25mm;padding-top:1mm;height:5mm;">
             8
            </td>
            <td class="styLNAmountBox" style="border-right-width:1px;width:31.5mm;padding-top:1mm;height:5mm;">     
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AdvertisingAmt" />
                </xsl:call-template>
            </td>
            </td>          
          </tr>
<!--Line 9-->
          <tr>
            <td class="styLNLeftNumBoxSD" style="vertical-align:top;width:5mm;height:7mm;">9</td>
            <td class="styGenericDiv" style="width:41mm;font-size:7pt;" colspan="1">Car and truck expenses (see <br/>page C-4)
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"></span>.
                <span style="width:16px"></span>.
                <span style="width:16px"></span>.
                 <span style="width:16px"></span>.
              </span>
              
            </td>
            <td class="styLNRightNumBox" style="width:7.25mm;height:7mm;">
              9
            </td>
            <td class="styLNAmountBox" style="border-right-width:1px;width:31.5mm;height:7mm;padding-top:3mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/CarAndTruckExpensesAmt" />
            </xsl:call-template><span style="width:1px;"></span></td>
          </tr>
<!--Line 10-->
          <tr>
            <td class="styLNLeftNumBox" style="vertical-align:top;width:5mm;height:5mm;">10</td>
            <td class="styGenericDiv" style="width:41mm;font-size:7pt" >
             Commissions and fees
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"></span>.
                <span style="width:12px"></span>.
              </span>
            </td>
            <td class="styLNRightNumBox" style="width:7.25mm;height:5mm;">
              10
            </td>
            <td class="styLNAmountBox" style="border-right-width:1px;width:31.5mm;height:5mm;"> 
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/CommissionsAndFeesAmt" />
            </xsl:call-template>
            </td>
          </tr>
        <!--Line 11-->  
          <tr>
            <td class="styLNLeftNumBox" style="height:5mm;width:5mm;">11</td>
            <td class="styGenericDiv" style="width:41mm;height:4.5mm;" >Contact labor (see pages C-4)            
            </td>
            <td class="styLNRightNumBox" style="height:5mm;width:7.25mm;">
              11
            </td>
            <td class="styLNAmountBox" style="height:5mm;border-right-width:1px;width:31.5mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ContractLaborAmt" />
            </xsl:call-template><span style="width:1px;"></span></td>
          </tr>
          <!--Line 12-->  
          <tr>
            <td class="styLNLeftNumBox" style="height:5mm;vertical-align:top;width:5mm;">12</td>
            <td class="styGenericDiv" style="width:41mm;height:4.5mm;" >Depletion
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"></span>. 
                <span style="width:16px"></span>.  
                <span style="width:16px"></span>. 
                <span style="width:16px"></span>.   
                   <span style="width:12px"></span>.      
              </span>
            </td>
            <td class="styLNRightNumBox" style="height:5mm;width:7.25mm;">
              12
            </td>
            <td class="styLNAmountBox" style="height:5mm;border-right-width:1px;width:31.5mm;">      
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/DepletionAmt" />
            </xsl:call-template>
            </td>
          </tr>
            <!--Line 13-->  
          <tr>
            <td class="styLNLeftNumBox" style="height:12mm;vertical-align:top;width:5mm;">13</td>
            <td class="styGenericDiv" style="width:41mm;height:12mm;" >Depreciation and section 179<br/> expense deduction (not <br/> included in Part III) (see page <br/> C-5)
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"></span>.
                <span style="width:16px"></span>.    
                <span style="width:16px"></span>.
                <span style="width:16px"></span>.  
                <span style="width:16px"></span>.       
              </span>
              <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/DepreciationAndSection179Amt"/>
        </xsl:call-template>
            </td>
            <td class="styLNRightNumBox" style="width:7.25mm;height:12mm;">
              13
            </td>
            <td class="styLNAmountBox" style="width:31.5mm;border-right-width:1px;height:12mm;padding-top:9mm;">     
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/DepreciationAndSection179Amt" />
            </xsl:call-template>
            </td>
          </tr>  
           <!--Line 14-->  
             <tr>
            <td class="styLNLeftNumBox" style="height:6mm;vertical-align:top;width:5mm;">14</td>
            <td class="styGenericDiv" style="width:41mm;height:4.5mm;" >Employee benefit programs<br/> (other than on line 19)
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"></span>.
                       <span style="width:12px"></span>.        
              </span>
            </td>
            <td class="styLNRightNumBox" style="height:6mm;width:7.25mm;">
              14
            </td>
            <td class="styLNAmountBox" style="height:6mm;border-right-width:1px;width:31.5mm;">     
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/EmployeeBenefitProgramAmt" />
            </xsl:call-template>
            </td>
          </tr>   
           <!--Line 15-->
            <tr>
            <td class="styLNLeftNumBox" style="vertical-align:top;width:5mm;height:5mm;">15</td>
            <td class="styGenericDiv" style="width:41mm" >
             Insurance (other than health)
              <!--Dotted Line-->
              <span class="styBoldText">
              </span>
            </td>
            <td class="styLNRightNumBox" style="width:7.25mm;height:5mm;">
              15
            </td>
            <td class="styLNAmountBox" style="border-right-width:1px;width:31.5mm;height:5mm;"> 
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/InsuranceAmt" />
            </xsl:call-template>
            </td>
          </tr>
           <!--Line 16-->
             <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;">16</td>
            <td class="styGenericDiv" style="width:41mm;height:4.5mm;" >Interest:           
            </td>        
            <td class="styLNRightNumBox" style="height:5mm;width:7.25mm;border-bottom-width:0px;background-color:lightgrey;">
              <span style="width:1px;"></span>  
            </td>     
            <td class="styLNRightNumBoxNBB" style="width:7.25mm;height:4.5mm;border-right-width:1px;">
            <span style="width:1px;"></span> 
            </td>            
          </tr>          
          <tr>
            <td class="styLNLeftNumBoxSD" style="height:4.5mm;vertical-align:top;width:5mm;">
            <span style="width:3mm;"></span>  a</td>
            <td class="styGenericDiv" style="width:45mm;height:4.5mm;">Mortgage (paid to banks, etc.)
              <!--Dotted Line-->
              <span class="styBoldText">   
              </span>
            </td>
            <td class="styLNRightNumBox" style="height:6mm;width:7.25mm;">
              16a
            </td>
            <td class="styLNAmountBox" style="height:6mm;width:31.5mm;border-right-width:1px;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MortgageInterestPaidBanksAmt" />
            </xsl:call-template>
            </td>
          </tr>         
          <tr>
            <td class="styLNLeftNumBoxSD" style="height:5mm;width:6mm;">
            <span style="width:3mm;"></span>  b</td>
            <td class="styGenericDiv" style="width:45mm;height:6mm;" >Other    
                  <!--Dotted Line-->
              <span class="styBoldText">  
                <span style="width:16px"></span>.
                <span style="width:16px"></span>.   
                  <span style="width:16px"></span>.   
                  <span style="width:16px"></span>.   
                  <span style="width:16px"></span>.   
                   <span style="width:16px"></span>.   
              </span>  
            </td>
            <td class="styLNRightNumBox" style="height:6mm;width:7.25mm;">
              16b
            </td>
            <td class="styLNAmountBox" style="height:6mm;width:31.5mm;border-right-width:1px;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MortgageInterestPaidOtherAmt" />
            </xsl:call-template>
            <span style="width:1px;"></span></td>
          </tr>  
           <!--Line 17-->
           <tr>
            <td class="styLNLeftNumBox" style="vertical-align:top;width:5mm;height:8mm;padding-top:1.5mm;">17</td>
            <td class="styGenericDiv" style="width:41mm;height:8mm;" >Legal and professional<br/>services
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"></span>.
                <span style="width:16px"></span>.
                <span style="width:16px"></span>.
                <span style="width:16px"></span>.
                 <span style="width:16px"></span>.   
              </span>
            </td>
            <td class="styLNRightNumBox" style="width:7.25mm;height:8mm;border-bottom-width: 0px;">
              17
            </td>
            <td class="styLNAmountBox" style="border-right-width:1px;width:31.5mm;height:8mm;border-bottom-width: 0px;padding-top:5mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/LegalAndProfessionalServiceAmt" />
            </xsl:call-template><span style="width:1px;"></span></td>
          </tr>
        </tbody>
      </table>
      <!-- END Left Side table of Part II-->
      <!-- BEGIN Right Side table of Part II-->
      <table class="styTable" style="width:93mm;float:left;font-size:7pt;" cellspacing="0">
        <thead></thead>
        <tfoot></tfoot>
        <tbody>
        <!--Line 18-->
        <tr>        
          <td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;width:4mm;padding-top:1mm;padding-left:1mm;">18</td>
          <td class="styGenericDiv" style="width:48mm;height:4.5mm;padding-top:1mm;" >
          Office expense
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.  
              <span style="width:16px"></span>.                     
            </span>
          </td>
          <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;padding-top:1mm;">
            18
          </td>
          <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;padding-top:1mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OfficeExpensesAmt" />
            </xsl:call-template>
            </td>
        </tr>
        <!--Line 19-->
        <tr>
            <td class="styLNLeftNumBox" style="height:4mm;vertical-align:top;width:4mm;padding-left:1mm;">19</td>
            <td class="styGenericDiv" style="width:48mm;height:4mm;" >Pension and profit-sharing plans              
            </td>         
            <td class="styLNRightNumBox" style="height:4mm;width:7.25mm;">
            19
          </td>
          <td class="styLNAmountBox" style="height:4mm;width:31.5mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/PensionProfitSharingPlansAmt" />
            </xsl:call-template>
            </td>         
          </tr>         
       <!--Line 20-->      
            <tr>
            <td class="styLNLeftNumBox" style="height:4mm;width:4mm;padding-left:1mm;">20</td>
            <td class="styGenericDiv" style="width:48mm;height:4mm;" >Rent or lease (see page C-6):         
            </td>        
            <td class="styLNRightNumBox" style="height:4mm;width:7.25mm;border-bottom-width:0px;background-color:lightgrey;">
              <span style="width:1px;"></span>  
            </td>     
            <td class="styLNRightNumBoxNBB" style="width:7.25mm;height:4.5mm;"><span style="width:1px;"></span> 
            </td>            
          </tr>          
          <tr>
            <td class="styLNLeftNumBoxSD" style="height:4.5mm;vertical-align:top;width:5mm;padding-left:1mm;">
            <span style="width:3mm;"></span>  a</td>
            <td class="styGenericDiv" style="width:45mm;height:4.5mm;">Vehicles, machinery, and equipment
              <!--Dotted Line-->
              <span class="styBoldText">  
                <span style="width:16px"></span>.
                <span style="width:16px"></span>.
                <span style="width:16px"></span>.
                <span style="width:16px"></span>.
                <span style="width:16px"></span>.
              </span>  
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              20a
            </td>
            <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MachineryAndEquipmentRentAmt" />
            </xsl:call-template>
            </td>
          </tr>         
          <tr>
            <td class="styLNLeftNumBoxSD" style="height:4.5mm;width:5mm;padding-left:1mm;">
            <span style="width:3mm;">
            </span>  b</td>
            <td class="styGenericDiv" style="width:45mm;height:4.5mm;" >Other business property 
                  <!--Dotted Line-->
              <span class="styBoldText">  
                <span style="width:16px"></span>.
                 <span style="width:16px"></span>.
              </span>  
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              20b
            </td>
            <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherBusinessPropertyRentAmt" />
            </xsl:call-template>
            <span style="width:1px;"></span></td>
          </tr>  
             <!--Line 21-->   
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;width:4mm;padding-left:1mm;">21</td>
            <td class="styGenericDiv" style="width:48mm;height:4.5mm;" >Repairs and maintenance
            <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"></span>.    
                <span style="width:16px"></span>.              
              </span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              21
            </td>
            <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/RepairsAndMaintenanceAmt" />
            </xsl:call-template><span style="width:1px;"></span></td>
          </tr>
          <!--Line 22-->   
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;width:4mm;padding-left:1mm;">22</td>
            <td class="styGenericDiv" style="width:48mm;height:4.5mm;" >Supplies  (not included in Part III)
              <!--Dotted Line-->
              <span class="styBoldText">                      
              </span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              22
            </td>
            <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/SuppliesAmt" />
            </xsl:call-template><span style="width:1px;"></span></td>
          </tr>
          <tr>
           <!--Line 23-->   
            <td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;width:4mm;padding-left:1mm;">23</td>
            <td class="styGenericDiv" style="width:48mm;height:4.5mm;" >Taxes and licenses
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"></span>.    
                <span style="width:16px"></span>. 
                <span style="width:16px"></span>. 
              </span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              23
            </td>
            <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TaxesAndLicensesAmt" />
            </xsl:call-template><span style="width:1px;"></span></td>
          </tr>
           <!--Line 24-->   
           <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:1mm;">24</td>
            <td class="styGenericDiv" style="width:48mm;height:4.5mm;" >Travel, meals, and entertainment:        
            </td>        
            <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;border-bottom-width:0px;background-color:lightgrey;">
              <span style="width:1px;"></span>  
            </td>     
            <td class="styLNRightNumBoxNBB" style="width:7.25mm;height:4.5mm;"><span style="width:1px;"></span> 
            </td>            
          </tr>          
          <tr>
            <td class="styLNLeftNumBoxSD" style="height:4.5mm;vertical-align:top;width:5mm;padding-left:1mm;">
            <span style="width:3mm;"></span>  a</td>
            <td class="styGenericDiv" style="width:45mm;height:4.5mm;">Travel
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"></span>.    
                <span style="width:16px"></span>. 
                <span style="width:16px"></span>. 
                 <span style="width:16px"></span>. 
                <span style="width:16px"></span>. 
              </span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              24a
            </td>
            <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TravelAmt" />
            </xsl:call-template>
            </td>
          </tr>         
          <tr>
            <td class="styLNLeftNumBoxSD" style="height:4.5mm;width:5mm;vertical-align:top;padding-left:1mm;">
            <span style="width:3mm;"></span>  b</td>
            <td class="styGenericDiv" style="width:45mm;height:4.5mm;" >Deductible meals and <br/>entertainment (see page C-6)   
                  <!--Dotted Line-->
              <span class="styBoldText">  
              </span>  
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              24b
            </td>
            <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MealsAndEntertainmentAmt" />
            </xsl:call-template>
            <span style="width:1px;"></span></td>
          </tr>  
           <!--Line 25-->   
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;width:4mm;padding-left:1mm;">25</td>
            <td class="styGenericDiv" style="width:48mm;height:4.5mm;" >Utilities
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"></span>.  
                <span style="width:16px"></span>.    
                <span style="width:16px"></span>.  
                <span style="width:16px"></span>.    
                <span style="width:16px"></span>.                              
              </span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              25
            </td>
            <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/UtilitiesAmt" />
            </xsl:call-template><span style="width:1px;"></span></td>
          </tr>
             <!--Line 26-->   
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;width:4mm;padding-left:1mm;">26</td>
            <td class="styGenericDiv" style="width:48mm;height:4.5mm;" >Wages (less employment credits)
              <!--Dotted Line-->
              <span class="styBoldText">                              
              </span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              26
            </td>
            <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/WagesLessEmploymentCreditsAmt" />
            </xsl:call-template></td>
          </tr>          
          <!--Line 27-->
          <tr>
            <td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;width:4mm;padding-left:1mm;">27</td>
            <td class="styGenericDiv" style="width:48mm;height:4.5mm;" >Other expenses (from line 48 on <br/> page 2)
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"></span>.
                <span style="width:16px"></span>.     
                  <span style="width:16px"></span>.
                <span style="width:16px"></span>.   
                   <span style="width:16px"></span>.
                <span style="width:16px"></span>.     
              </span>
            </td>
            <td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              27
            </td>
            <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">     
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TotalOtherExpensesAmt" />
            </xsl:call-template>
            </td>
          </tr>  
          <!--Blank Line-->
            <tr>
            <td class="styLNLeftNumBoxSD" style="height:8mm;width:4mm;padding-left:1mm;"></td>
            <td class="styGenericDiv" style="width:48mm;height:8mm;" >      
            </td>        
            <td class="styLNRightNumBox" style="height:8mm;width:7.25mm;border-bottom-width:0px;background-color:lightgrey;">
              <span style="width:1px;"></span>  
            </td>     
            <td class="styLNRightNumBoxNBB" style="width:7.25mm;height:8mm;background-color:lightgrey;">
            <span style="width:1px;"></span> 
            </td>            
          </tr>          
        </tbody>
      </table>
      <!-- END Right Side Table of Part II-->
    </div>       
    <!--Line 28--> 
    <div style="width:187mm;">      
      <div class="styLNLeftNumBox" style="height:5mm;padding-top:0mm;">28</div>      
      <div class="styGenericDiv" style="width:139.3mm; height:5mm;padding-top:0mm;">          
        <span class="styBoldText">Total expenses </span>
         before expenses for business use of home. Add lines 8 through 27  
        <!--Dotted Line-->
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
          <span style="width:16px"></span>.
        <span style="width:16px"></span>.   
       </span>       
        <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif"  alt="Bullet Image"/> 
      </div>
      <div class="styLNRightNumBox" style="height:5mm;padding-top:1mm;width:8mm;">      
        28
      </div>
      <div class="styLNAmountBox" style="height:5mm;padding-top:1mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TotalExpensesAmt"/>
        </xsl:call-template>        
      </div>
    </div>  
    <!--Line 29-->
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm; padding-top:0mm;">29</div>
        <div class="styLNDesc" style="width:139.3mm;height:4mm;padding-top:0mm;">
            Tentative profit or (loss). Subtract line 28 from line 7               
         <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.   
             <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
          </span>       
        </div>
        <div class="styLNRightNumBox" style="width:8mm;height:4mm;">
           29
        </div>
        <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TentativeProfitOrLossAmt"/>
          </xsl:call-template>
        </div>       
      </div>
<!--Line 30-->
<div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">30</div>
        <div class="styLNDesc" style="width:139.3mm;height:5mm;">
            Expenses for business use of your home. Attach <b>Form 8829</b>         
         <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.   
             <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>.              
          </span>    
             <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/HomeBusinessExpenseAmt"/>
        </xsl:call-template>
        </div>
        <div class="styLNRightNumBox" style="width:8mm;height:5mm;">
           30
        </div>
        <div class="styLNAmountBox" style="height:5mm;width:31.5mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/HomeBusinessExpenseAmt"/>
          </xsl:call-template>
        </div>       
      </div>
      <!--Line 31-->
          <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:5mm; padding-top:.5mm;">31</div>
        <div class="styLNDesc" style="width:135.3mm;height:5mm;">
            <span class="styBoldText">Net profit or (loss). </span>Subtract line 30 from line 29.
            <li>If a profit, enter on both <b>Form 1040, line 12,</b> and <b> Schedule SE, line 2,</b> or on <b>Form 1040NR, line 13 </b>(if you checked the box on line 1, see page C-7). Estates and trusts, enter on <b>Form 1041, line 3.</b>  <span style="width:.5mm;"></span>  
     <xsl:call-template name="LinkToLeftoverDataTableInline">
      <xsl:with-param name="Desc">Line 31 - Passive Activity Loss Literal </xsl:with-param>
      <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NetProfitOrLossAmt/@passiveActivityLossLiteralCd"/>
       </xsl:call-template> 
       <xsl:call-template name="LinkToLeftoverDataTableInline">
          <xsl:with-param name="Desc">Line 31 - Passive Activity Loss Amount</xsl:with-param>
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NetProfitOrLossAmt/@pALAmount"/>      
        </xsl:call-template>
       <br/>   </li>   
            <li>If a loss, you <span class="styBoldText">must</span> go to line 32.</li>             
        </div>
        <div class="styLNDesc" style="width:4mm; height:5mm;padding-top:3mm;">
          <img src="{$ImagePath}/1040SchC_Bracket.gif" height="40mm" alt="Curly Bracket Image"/>        
        </div>       
        <div class="styLNRightNumBox" style="width:8mm;height:7mm;padding-top:4mm;">
           31
        </div>    
        <div class="styLNAmountBox" style="height:7mm;width:31.5mm;padding-top:4mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NetProfitOrLossAmt"/>
          </xsl:call-template>
        </div>       
      </div>
      <!--Line 32-->  
    <div class="styBB" style="width:187mm;float:left;clear:none;">
      <div class="styLNLeftNumBox" style="height:10mm; padding-top:0mm;">32</div>
      <div class="styLNDesc" style="width:130mm;height:10mm;padding-top:0mm;">
        If you have a loss, check the box that describes your investment in this activity (see page C-7).                 
        <li>If you checked 32a, enter the loss on both <span class="styBoldText">Form 1040, line 12,</span> and <span class="styBoldText">Schedule SE, line 2,</span> or on <br/> <b>Form 1040NR, line 13</b> (if you checked the box on line 1, see the line 31 instructions on page C-7). Estates and trusts, enter on <b>Form 1041, line 3.</b>
        </li>
        <li>If you checked 32b, you <span class="styBoldText">must</span> attach <span class="styBoldText">Form 6198. </span>Your loss may be limited.</li>        </div>      
      <div class="styLNDesc" style="width:8mm; height:10mm;padding-top:3mm;">
        <img src="{$ImagePath}/1040SchC_Bracket.gif"  align="bottom" height="42mm" alt="Curly Bracket Image"/>              
      </div>
      <div style="height:10mm;">
     <!--Line 32a-->  
      <div class="styLNDesc" style="width:40mm;height:4mm;padding-top:2mm;">
        <span style="width:.5mm;"></span>
        <span class="styBoldText">32a</span>
        <span style="width:1px"></span>
        <input type="checkbox" class="styCkbox">
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AllInvestmentIsAtRiskInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAllInvestmentIsAtRiskInd</xsl:with-param>
          </xsl:call-template>
        </input>        
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AllInvestmentIsAtRiskInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAllInvestmentIsAtRiskInd</xsl:with-param>
          </xsl:call-template>
          <span style="font-family:Arial;font-size: 7pt;">All investment is at risk. </span>
        </label>
      </div>
       <!--Line 32b-->  
      <div class="styLNDesc" style="width:40mm;height:4mm;padding-top:2mm;">
        <span style="width:.5mm;"></span>
        <span class="styBoldText">32b</span>
        <span style="width:1px"></span>
        <input type="checkbox" class="styCkbox">
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/SomeInvestmentIsNotAtRiskInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCSomeInvestmentIsNotAtRiskInd</xsl:with-param>
          </xsl:call-template>
        </input>      
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/SomeInvestmentIsNotAtRiskInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCSomeInvestmentIsNotAtRiskInd</xsl:with-param>
          </xsl:call-template>
          <span style="font-family:Arial;font-size: 6pt;">Some investment is not at risk.</span>
        </label>
      </div></div>
    </div> 
    <!-- Page Break-->
    <!-- Footer-->   
    <div class="pageEnd" style="width:187mm;">  
        <span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions. </span>   
        <span style="width:15mm;"></span>                        
        Cat. No. 11334P 
        <span style="width:7mm;"></span>  
        <span class="styBoldText" >Schedule C (Form 1040) 2010 </span>
    </div>   
    <!--Begin Page 2 -->   
    <!-- Header -->    
      <div class="styBB" style="width:187mm;border-bottom-width: 0px;">  
         <!--<div style="float:right;">
      Version A, Cycle 1</div>-->
      </div>  
    <div class="styBB" style="width:187mm;float:left;clear:none;">  
      <div style="float:left;">Schedule C (Form 1040) 2010 <span style="width:130mm;"></span></div>
      <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>  
    </div>  
    <!-- BEGIN Part III Title -->
    <div class="styBB" style="width:187mm;">
      <div class="styPartName">Part III</div>
      <div class="styPartDesc" style="font-weight: normal;"><b>Cost of Goods Sold </b>(see page C-8)<span class="styNormalText"></span>             
      </div>
    </div>
    <!-- END Part III Title -->
 <!--Line 33--> 
    <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:2mm;">33</div>      
      <div class="styLNDesc" style="width: 50mm; height:4mm;padding-top:2mm;">        
   Method(s) used to<br/> value closing inventory:        
      </div>
       <div class="styLNDesc" style="width: 28mm; height:4mm;padding-top:5mm;"><b> a </b>       
        <input type="checkbox" class="styCkbox">
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ClosingInventoryCostMethodInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCClosingInventoryCostMethodInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ClosingInventoryCostMethodInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCClosingInventoryCostMethodInd</xsl:with-param>
          </xsl:call-template>
          Cost
        </label>
      </div>
      <div class="styLNDesc" style="width: 50mm; height:4mm;padding-top:5mm;"><b> b </b>         
        <input type="checkbox" class="styCkbox">
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/LowerOfCostOrMarketMethodInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCLowerOfCostOrMarketMethodInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/LowerOfCostOrMarketMethodInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCLowerOfCostOrMarketMethodInd</xsl:with-param>
          </xsl:call-template>
          Lower of cost or market
        </label>
      </div>
      <div class="styLNDesc" style="width: 48mm; height:4mm;padding-top:5mm;"><b> c </b>          
        <input type="checkbox" class="styCkbox">
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherClosingInventoryMethodInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCOtherClosingInventoryMethodInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherClosingInventoryMethodInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCOtherClosingInventoryMethodInd</xsl:with-param>
          </xsl:call-template>
          Other (attach explanation)
          <xsl:call-template name="SetFormLinkInline">
           <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherClosingInventoryMethodInd"/>
              </xsl:call-template>  
        </label>
      </div>
    </div>
    <!--Line 34-->
     <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">34</div>
      <div class="styLNDesc" style="width:174mm;padding-top:1mm;">
   Was there any change in determining quantities, costs, or valuations between opening and closing inventory?<br/> 
   If "Yes," attach explanation
    <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
             <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
             <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.    
          </span>    
            <span style="width: 2mm;"></span>          
         <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ChangeInValuationsInd"/>
        </xsl:call-template> 
           <span style="width: 5mm;"></span>             
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ChangeInValuationsInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCChangeInValuationsInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ChangeInValuationsInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCChangeInValuationsInd</xsl:with-param>
          </xsl:call-template>
          <b>Yes</b>
        </label>                    
             <span style="width: 4mm;"></span>
         <input type="checkbox"  class="styCkbox"  name="Checkbox">
            <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ChangeInValuationsInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCChangeInValuationsInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
           <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ChangeInValuationsInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCChangeInValuationsInd</xsl:with-param>
          </xsl:call-template>
         <b>No</b> 
        </label>                        
      </div>        
    </div>
    <!--Line 35-->
    <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">35</div>      
      <div class="styLNDesc" style="width: 139mm; height:4mm;padding-top:1mm;">        
         Inventory at beginning of year. If different from last year's closing inventory, attach explanation        
        <!--Dotted Line-->
        <span class="styBoldText">
          <span style="width:16px"></span>.
        </span>  
           <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BeginningOfYearInventoryAmt"/>
        </xsl:call-template>    
      </div>
      <div class="styLNRightNumBox" style="height:5mm;padding-top:2mm;">      
        35
      </div>
      <div class="styLNAmountBox" style="height:5mm;padding-top:2mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BeginningOfYearInventoryAmt"/>
        </xsl:call-template>        
      </div>
    </div>
   <!--Line 36-->
    <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:4mm;">36</div>      
      <div class="styLNDesc" style="width:139mm; height:4mm;">        
        Purchases less cost of items withdrawn for personal use     
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
        </span>                
      </div>
      <div class="styLNRightNumBox" style="height:4mm;">      
        36
      </div>
      <div class="styLNAmountBox" style="height:4mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/PurchasesLessPersonalItemsAmt"/>
        </xsl:call-template>        
      </div>
    </div>
  <!--Line 37-->  
    <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:4mm;">37</div>      
      <div class="styLNDesc" style="width: 139mm; height:4mm;">        
        Cost of labor. Do not include any amounts paid to yourself
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
        </span>               
      </div>
      <div class="styLNRightNumBox" style="height:4mm;">      
        37
      </div>
      <div class="styLNAmountBox" style="height:4mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/CostOfLaborAmt"/>
        </xsl:call-template>        
      </div>
    </div>  
   <!--Line 38-->
    <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:4mm;">38</div>      
      <div class="styLNDesc" style="width: 139mm; height:4mm;">        
        Materials and supplies
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
        </span>             
      </div>
      <div class="styLNRightNumBox" style="height:4mm;">      
        38
      </div>
      <div class="styLNAmountBox" style="height:4mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MaterialsAndSuppliesAmt"/>
        </xsl:call-template>        
      </div>
    </div>
   <!--Line 39--> 
    <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:4mm;">39</div>      
      <div class="styLNDesc" style="width: 139mm; height:4mm;">        
        Other costs
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
        </span>             
      </div>
      <div class="styLNRightNumBox" style="height:4mm;">      
        39
      </div>
      <div class="styLNAmountBox" style="height:4mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherCostsAmt"/>
        </xsl:call-template>        
      </div>
    </div>
    <!--Line 40-->
     <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:4mm;">40</div>      
      <div class="styLNDesc" style="width: 139mm; height:4mm;">        
        Add lines 35 through 39
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
        </span>             
      </div>
      <div class="styLNRightNumBox" style="height:4mm;">      
        40
      </div>
      <div class="styLNAmountBox" style="height:4mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TotalCostsAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
 <!--Line 41-->   
    <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:4mm;">41</div>      
      <div class="styLNDesc" style="width: 139mm; height:4mm;">        
        Inventory at end of year
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
        </span>             
      </div>
      <div class="styLNRightNumBox" style="height:4mm;">      
        41
      </div>
      <div class="styLNAmountBox" style="height:4mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/EndOfYearInventoryAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
      <!--Line 42-->
      <div class="styBB" style="width:187mm;border-bottom-width: 1px;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:4mm;">42</div>      
      <div class="styLNDesc" style="width: 139mm; height:4mm;">        
        <b>Cost of goods sold.</b> Subtract line 41 from line 40. Enter the result here and on page 1, line 4
        <!--Dotted Line-->
        <span class="styBoldText">
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.    
          <span style="width:16px"></span>.             
        </span>             
      </div>
      <div class="styLNRightNumBox" style="height:4mm;border-bottom-width: 0px;">      
        42
      </div>
      <div class="styLNAmountBox" style="height:4mm;border-bottom-width: 0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/CostOfGoodsSoldAmt"/>
        </xsl:call-template>        
      </div>
    </div>
     <!-- END Part IV Title -->
    <!--Table-->
<!-- Table expand/collapse toggle button -->
   <div class="styBB" style="width:187mm;border-bottom-width: 1px; ">     
			<div style="width:5mm;float:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AdditionalVehicleInformation"/>
									<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'AVInfo' "/>
								</xsl:call-template>	
			</div>	
</div>					
	<div class="styTableContainer" style="" id="AVInfo">
<xsl:call-template name="SetInitialState"/>
<table class="styTable" cellspacing="0" style="font-size:7pt;" summary="Additional Vehicle Information " name="AVtable" id="AVtable">
		<thead class="styTableThead">
		<tr>
	</tr>
	</thead>
	<tfoot/>
	<tbody>				  	
    <xsl:for-each select="$Form1040ScheduleCData/AdditionalVehicleInformation">
    <xsl:if test="($Print != $Separated) or (count($Form1040ScheduleCData/AdditionalVehicleInformation) &lt;= 6) ">
  <!-- BEGIN Part IV Title -->
  <tr>
    <td class="styBB" style="width:182mm;">
      <div class="styPartName" style="width:13mm;">Part IV  </div> 
      <span style="width:2mm;"></span><b>Information on Your Vehicle. </b><span class="styNormalText" style="font-size:8pt;">Complete this part <b>only</b> if you are claiming car or truck expenses on line 9,<br/>
      <span style="width:16mm;"></span> and are not required to file Form 4562 for this business. See the instructions for line 13 on page C-5 to find <br/>
      <span style="width:16mm;"></span> out if you must file Form 4562.</span>    
    </td>
    </tr>
    <tr>				
  <!--Line 43-->  
    <td style="width:182mm;">      
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">43</div>      
      <div class="styGenericDiv" style="width:120mm; height:4mm;padding-top:1mm;">          
        When did you place your vehicle in service for business purposes? (month, day, year)     
        <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif"  alt="Bullet Image"/> 
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm; border-bottom-width: 1px; border-left-width: 0px;text-align:left;">        
        <xsl:call-template name="PopulateMonthDayYear">
          <xsl:with-param name="TargetNode" select="DateVehiclePlacedInService"/>
        </xsl:call-template>        
      </div>
    </td>    
    </tr>
    <tr>			
    <!--Line 44-->
     <td style="width:182mm;">    
        <div style="width:182mm;">      
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">44</div>      
      <div class="styLNDesc" style="width: 165mm; height:4mm;padding-top:1mm;">        
       Of the total number of miles you drove your vehicle during 2010, enter the number of miles you used your vehicle for:
      </div>
       </div>         
      <div class="styLNLeftNumBox" style="height:4mm;">
      <span style="width: 3mm;"></span>a</div>      
       <div class="styLNDesc" style="width: 15mm; height:4mm;">        
        Business 
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">  
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="BusinessMilesCnt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNLeftNumBox" style="height:4mm;">
      <span style="width: 3mm;"></span>b</div>   
       <div class="styLNDesc" style="width: 43mm; height:4mm;">  Commuting (see instructions)         
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">   
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="CommutingMilesCnt"/>
        </xsl:call-template>        
      </div>
  <div class="styLNLeftNumBox" style="height:4mm;"><span style="width: 3mm;"></span>c</div>   
       <div class="styLNDesc" style="width: 10mm; height:4mm;">Other        
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OtherMilesCnt"/>
        </xsl:call-template>        
      </div>
      </td>
      </tr>
      <tr>
   <!--Line 45-->
   <td style="width:182mm;">    
   <div style="width:182mm;">      
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">45</div>
      <div class="styLNDesc" style="width:140mm;padding-top:1mm;">
  Was your vehicle available for personal use during off-duty hours?
    <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
             <span style="width:16px;"></span>.    
          </span>       
          </div>
          <div class=".styGenericDiv " style="width:28mm;">
           <span style="width: 0mm;"></span>             
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
          </xsl:call-template>
         <span class="styBoldText"> Yes</span>
        </label>                    
             <span style="width: 5mm;"></span>
         <input type="checkbox"  class="styCkbox"  name="Checkbox">
            <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
           <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
          </xsl:call-template>
          <span class="styBoldText"> No</span>
        </label>                        
      </div>        
    </div>
    </td>
    </tr>
    <tr>		
      <!--Line 46-->
       <td style="width:182mm;">      
        <div style="width:182mm;">      
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">46</div>
      <div class="styLNDesc" style="width:140mm;padding-top:1mm;">
Do you (or your spouse) have another vehicle available for personal use?
    <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
             <span style="width:16px;"></span>.    
          </span>   
             </div>
              <div class=".styGenericDiv " style="width:28mm;">
           <span style="width:0mm;"> </span>         
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="AnotherVehicleInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="AnotherVehicleInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
          </xsl:call-template>
          <span class="styBoldText"> Yes</span>
        </label>                    
             <span style="width: 5mm;"></span>
         <input type="checkbox"  class="styCkbox"  name="Checkbox">
            <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="AnotherVehicleInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
           <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="AnotherVehicleInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
          </xsl:call-template>
           <span class="styBoldText"> No</span>
        </label>                        
      </div>        
    </div>
    </td>
    </tr>
    <tr>
    	 <td class="styBB" style="width:182mm;">      	
       <!--Line 47a--> 
        <div class="styBB" style="width:182mm;">      
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">47a</div>
      <div class="styLNDesc" style="width:140mm;padding-top:1mm;">
Do you have evidence to support your deduction?
    <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
             <span style="width:16px;"></span>.    
          </span> 
             </div>
                <div class=".styGenericDiv " style="width:28mm;">
           <span style="width:0mm;"> </span>         
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
          </xsl:call-template>
           <span class="styBoldText"> Yes</span>
        </label>                    
             <span style="width: 5mm;"></span>
         <input type="checkbox"  class="styCkbox"  name="Checkbox">
            <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
           <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
          </xsl:call-template>
           <span class="styBoldText"> No</span>
        </label>                        
      </div> 
      <!--Line 47b-->     
        <div class="styBB" style="width:182mm;">  
       <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">
        <span style="width:3.4mm;"></span>b</div>
      <div class="styLNDesc" style="width:140mm;padding-top:1mm;">
If "Yes," is the evidence written?
    <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
             <span style="width:16px;"></span>.    
          </span>   
              </div>
                <div class=".styGenericDiv " style="width:28mm;">
           <span style="width:0mm;"> </span>         
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="EvidenceWrittenInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AdditionalVehicleInformation/EvidenceWrittenInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
          </xsl:call-template>
           <span class="styBoldText"> Yes</span>
        </label>                    
             <span style="width: 5mm;"></span>
         <input type="checkbox"  class="styCkbox"  name="Checkbox">
            <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="EvidenceWrittenInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
           <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AdditionalVehicleInformation/EvidenceWrittenInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
          </xsl:call-template>
           <span class="styBoldText"> No</span>
        </label>                        
      </div>        
    </div>
    </div>
    </td>
    </tr>
    </xsl:if> 
    	</xsl:for-each>
    	<!--Blank table-->
    	 <xsl:if test="count($Form1040ScheduleCData/AdditionalVehicleInformation)&lt; 1 or ((count($Form1040ScheduleCData/AdditionalVehicleInformation) &gt; 2) and ($Print = $Separated))">
    <!-- BEGIN Part IV Title -->
  <tr>
    <td class="styTableCellText" style="width:187mm;height:3mm;border-right-width: 0px;border-color: black;padding_top:0mm">
      <div class="styPartName" style="width:13mm;">Part IV  </div> 
      <div style="vertical-align:top;padding_top:0mm"><span style="width:2mm;"></span>  <span class="styNormalText" style="font-size:8pt;"><b>Information on Your Vehicle. </b>
    Complete this part <b>only</b> if you are claiming car or truck expenses on line 9,<br/>
      <span style="width:16mm;"></span> and are not required to file Form 4562 for this business. See the instructions for line 13 on page C-5 to find <br/>
      <span style="width:16mm;"></span> out if you must file Form 4562.</span>  
           <span style="width:6mm;"></span>
      <xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherExpenses"/>
												</xsl:call-template>
       </div>   
    </td>
    </tr>
    <tr>				
  <!--Line 43-->  
    <td class="styTableCellText" style="width:187mm;height:3mm;border-right-width: 0px;border-color: black;padding_top:0mm;border-bottom-width: 0px; ">      
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">43</div>      
      <div class="styGenericDiv" style="width:120mm; height:4mm;padding-top:1mm;">          
        When did you place your vehicle in service for business purposes? (month, day, year)     
        <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif"  alt="Bullet Image"/> 
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm; border-bottom-width: 1px; border-left-width: 0px;text-align:left;">        
        <xsl:call-template name="PopulateMonthDayYear">
          <xsl:with-param name="TargetNode" select="DateVehiclePlacedInService"/>
        </xsl:call-template>        
      </div>
    </td>    
    </tr>
    <tr>			
    <!--Line 44-->
    <td class="styTableCellText" style="width:187mm;height:3mm;border-right-width: 0px;border-color: black;padding_top:0mm;border-bottom-width: 0px; ">      
        <span style="width:182mm;">      
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">44</div>      
      <div class="styLNDesc" style="width: 165mm; height:4mm;padding-top:1mm;">        
        Of the total number of miles you drove your vehicle during 2010, enter the number of miles you used your vehicle for:
      </div>
       </span>         
      <div class="styLNLeftNumBox" style="height:4mm;">
      <span style="width: 3mm;"></span>a</div>      
       <div class="styLNDesc" style="width: 15mm; height:4mm;">        
        Business 
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="BusinessMilesCnt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNLeftNumBox" style="height:4mm;">
      <span style="width: 3mm;"></span>b</div>   
       <div class="styLNDesc" style="width: 43mm; height:4mm;">  Commuting (see instructions)         
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="CommutingMilesCnt"/>
        </xsl:call-template>        
      </div>
  <div class="styLNLeftNumBox" style="height:4mm;"><span style="width: 3mm;"></span>c</div>   
       <div class="styLNDesc" style="width: 10mm; height:4mm;">Other        
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OtherMilesCnt"/>
        </xsl:call-template>        
      </div>
      </td>
      </tr>
      <tr>
   <!--Line 45-->
   <td class="styTableCellText" style="width:187mm;height:3mm;border-right-width: 0px;border-color: black;padding_top:0mm;border-bottom-width: 0px; ">      
   <span style="width:182mm;">      
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">45</div>
      <div class="styLNDesc" style="width:140mm;padding-top:1mm;">
  Was your vehicle available for personal use during off-duty hours?
    <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
             <span style="width:16px;"></span>.    
          </span>       
          </div>
          <div class=".styGenericDiv " style="width:28mm;">
           <span style="width: 0mm;"></span>             
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
          </xsl:call-template>
         <span class="styBoldText"> Yes</span>
        </label>                    
             <span style="width: 5mm;"></span>
         <input type="checkbox"  class="styCkbox"  name="Checkbox">
            <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
           <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
          </xsl:call-template>
          <span class="styBoldText"> No</span>
        </label>                        
      </div>        
    </span>
    </td>
    </tr>
    <tr>		
      <!--Line 46-->
       <td class="styTableCellText" style="width:187mm;height:3mm;border-right-width: 0px;border-color: black;padding_top:0mm;border-bottom-width: 0px; ">        
        <span style="width:182mm;">      
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">46</div>
      <div class="styLNDesc" style="width:140mm;padding-top:1mm;">
Do you (or your spouse) have another vehicle available for personal use?
    <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
             <span style="width:16px;"></span>.    
          </span>   
             </div>
              <div class=".styGenericDiv " style="width:28mm;">
           <span style="width:0mm;"> </span>         
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="AnotherVehicleInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="AnotherVehicleInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
          </xsl:call-template>
          <span class="styBoldText"> Yes</span>
        </label>                    
             <span style="width: 5mm;"></span>
         <input type="checkbox"  class="styCkbox"  name="Checkbox">
            <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="AnotherVehicleInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
           <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="AnotherVehicleInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
          </xsl:call-template>
           <span class="styBoldText"> No</span>
        </label>                        
      </div>        
    </span>
    </td>
    </tr>
    <tr>
    	<td class="styTableCellText" style="width:187mm;height:3mm;border-right-width: 0px;border-color: black;padding_top:0mm;border-bottom-width: 0px; ">      
       <!--Line 47a--> 
        <span style="width:182mm;">      
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">47a</div>
      <div class="styLNDesc" style="width:140mm;padding-top:1mm;">
Do you have evidence to support your deduction?
    <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
             <span style="width:16px;"></span>.    
          </span> 
             </div>
                <div class=".styGenericDiv " style="width:28mm;">
           <span style="width:0mm;"> </span>         
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
          </xsl:call-template>
           <span class="styBoldText"> Yes</span>
        </label>                    
             <span style="width: 5mm;"></span>
         <input type="checkbox"  class="styCkbox"  name="Checkbox">
            <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
           <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
          </xsl:call-template>
           <span class="styBoldText"> No</span>
        </label>                        
      </div> 
      <!--Line 47b-->     
        <div class="styBB" style="width:187mm;">  
       <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">
        <span style="width:3.4mm;"></span>b</div>
      <div class="styLNDesc" style="width:140mm;padding-top:1mm;">
If "Yes," is the evidence written?
    <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
             <span style="width:16px;"></span>.    
          </span>   
              </div>
                <div class=".styGenericDiv " style="width:28mm;">
           <span style="width:0mm;"> </span>         
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="EvidenceWrittenInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AdditionalVehicleInformation/EvidenceWrittenInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
          </xsl:call-template>
           <span class="styBoldText"> Yes</span>
        </label>                    
             <span style="width: 5mm;"></span>
         <input type="checkbox"  class="styCkbox"  name="Checkbox">
            <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="EvidenceWrittenInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
           <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AdditionalVehicleInformation/EvidenceWrittenInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
          </xsl:call-template>
           <span class="styBoldText"> No</span>
        </label>                        
      </div>        
    </div>
    </span>
    </td>
    </tr>	 
    	     </xsl:if> 
    	</tbody>
	</table>
		</div>
	<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AdditionalVehicleInformation"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'AVInfo' "/>
								</xsl:call-template>	

	 <!-- END Part IV Title -->		
	 	
   <!-- BEGIN Part V Title -->
    <div class="styBB" style="width:187mm;">
      <div class="styPartName" style="width:12mm;height:4mm;">Part V</div>
      <div class="styPartDesc" style="width:169mm;"><b>Other Expenses. </b>
      <span class="styNormalText"> List below business expenses not included on lines 8-26 or line 30.
      </span> 
       </div>	
<!--Table-->
<!-- Table expand/collapse toggle button -->
			<div style="width:5mm;float:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherExpenses"/>
									<xsl:with-param name="containerHeight" select="9"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'OtherExpenses' "/>
								</xsl:call-template>	
								</div>		
						  	</div>	
<!--Part V table Header -->
<div class="styTableContainer" style="height:31.5mm;" id="OtherExpenses">
<xsl:call-template name="SetInitialState"/>
<table class="styTable" cellspacing="0" style="font-size:7pt;" summary="Table displaying Other Expenses information " name="OEtable" id="OEtable">
		<thead class="styTableThead">
		<tr>
	</tr>
	</thead>
	<tfoot/>
	<tbody>
	<!-- print logic -->
	<xsl:for-each select="$Form1040ScheduleCData/OtherExpenses">
				<xsl:if test="($Print != $Separated) or (count($Form1040ScheduleCData/OtherExpenses) &lt;= 5) ">
						<tr>
							<td class="styTableCellText" style="width:177mm;">
							<!--Description-->
							<xsl:if test="$Form1040ScheduleCData/OtherExpenses/Description"> 
								<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Description"/>
								</xsl:call-template>
								<span style="width:9mm;"/>
								 <xsl:call-template name="SetFormLinkInline">
                             <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherExpenses"/>
                                 </xsl:call-template>  
								</xsl:if>
							   <span style="width:1mm;"/>
							</td>
							<td class="styTableCell" style="border-right-width: 0px;">
							<!--Expenses-->
							<xsl:if test="$Form1040ScheduleCData/OtherExpenses/Amount">
												<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amount"/>
												</xsl:call-template>																								
											    </xsl:if>
							</td>
						</tr>
						</xsl:if>
									</xsl:for-each>
<xsl:if test="count($Form1040ScheduleCData/OtherExpenses)&lt; 1 or ((count($Form1040ScheduleCData/OtherExpenses) &gt; 7) and ($Print = $Separated))">
										<tr>
										<td class="styTableCell" style="width:150mm;text-align:left;">
												<span class="styBoldText"> </span>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherExpenses"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											
											<td class="styTableCellText" style="width:34.7mm; border-right-width: 0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form1040ScheduleCData/OtherExpenses)&lt; 2 or ((count($Form1040ScheduleCData/OtherExpenses) &gt; 7) and ($Print = $Separated))">
										<tr>
										<td class="styTableCell" style="width:150mm;text-align:left;">
												<span class="styBoldText"> </span>
												<span class="styTableCellPad"/>
											</td>
											
											<td class="styTableCellText"  style="width:34.7mm; border-right-width: 0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form1040ScheduleCData/OtherExpenses)&lt; 3 or ((count($Form1040ScheduleCData/OtherExpenses) &gt; 7) and ($Print = $Separated))">
										<tr>
										<td class="styTableCell" style="width:150mm;text-align:left;">
												<span class="styBoldText"> </span>
												<span class="styTableCellPad"/>
											</td>
											
											<td class="styTableCellText" style="width:34.7mm; border-right-width: 0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
										<xsl:if test="count($Form1040ScheduleCData/OtherExpenses)&lt; 4 or ((count($Form1040ScheduleCData/OtherExpenses) &gt; 7) and ($Print = $Separated))">
										<tr>
										<td class="styTableCell" style="width:150mm;text-align:left;">
												<span class="styBoldText"> </span>
												<span class="styTableCellPad"/>
											</td>
											
											<td class="styTableCellText" style="width:34.7mm; border-right-width: 0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form1040ScheduleCData/OtherExpenses)&lt; 5 or ((count($Form1040ScheduleCData/OtherExpenses) &gt; 7) and ($Print = $Separated))">
										<tr>
										<td class="styTableCell" style="width:150mm;text-align:left;">
												<span class="styBoldText"> </span>
												<span class="styTableCellPad"/>
											</td>
											
											<td class="styTableCellText" style="width:34.7mm; border-right-width: 0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form1040ScheduleCData/OtherExpenses)&lt; 6 or ((count($Form1040ScheduleCData/OtherExpenses) &gt; 7) and ($Print = $Separated))">
										<tr>
										<td class="styTableCell" style="width:150mm;text-align:left;">
												<span class="styBoldText"> </span>
												<span class="styTableCellPad"/>
											</td>
											
											<td class="styTableCellText" style="width:34.7mm; border-right-width: 0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form1040ScheduleCData/OtherExpenses)&lt; 7 or ((count($Form1040ScheduleCData/OtherExpenses) &gt; 7) and ($Print = $Separated))">
										<tr>
										<td class="styTableCell" style="width:150mm;text-align:left;">
												<span class="styBoldText"> </span>
												<span class="styTableCellPad"/>
											</td>
											
											<td class="styTableCellText" style="width:34.7mm; border-right-width: 0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
	</tbody>
	</table>
	<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherExpenses"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'OtherExpenses' "/>
							</xsl:call-template>
						</div>
<!-- End Part V Table-->
  <!--Line 48-->
      <div class="styBB" style="width:187mm;border-bottom-width: 1px;">      
      <div class="styLNLeftNumBox" style="height:4mm;">48</div>      
      <div class="styLNDesc" style="width: 139mm; height:4mm;">        
        <b>Total other expenses.</b> Enter here and on page 1, line 27
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
        </span>             
      </div>
      <div class="styLNRightNumBox" style="height:4mm;">      
        48
      </div>
      <div class="styLNAmountBox" style="height:4mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TotalOtherExpensesAmt"/>
        </xsl:call-template>        
      </div>
    </div>    
     <!--Footer -->
    <div style="width:187mm;">    
      <div class="stySmallText" style="width:141mm;text-align:center;padding-top:1mm;">
      <span style="width:156px"></span></div>
      <div class="stySmallText" style="width:46mm;text-align:right;"><span class="styBoldText" style="font-weight:bold;">Schedule C (Form 1040) 2010</span> </div>
    </div>       
      <br /><br class="pageEnd"/>
      <!-- BEGIN Left Over Table -->  
        <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" TabIndex="1"  type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>
        <!-- Additional Data Table -->
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData" />
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>     
        <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Part II, Line 31 - Passive Activity Loss Literal
        </xsl:with-param>
        <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NetProfitOrLossAmt/@passiveActivityLossLiteralCd"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
      <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Part II, Line 31 - Passive Activity Loss Amount
        </xsl:with-param>
        <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NetProfitOrLossAmt/@pALAmount"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
        </table>
      <!-- END Left Over Table --> 
      <!-- Begin separated repeating data table Part IV-->
  <xsl:if test="($Print = $Separated) and (count($Form1040ScheduleCData/AdditionalVehicleInformation) &gt; 6)">
      <span class="styRepeatingDataTitle">Form 1040 Schedule C, Part IV, Information on Your Vehicle:</span>
   <table class="styDepTbl" cellspacing="0" style="font-size:7pt;" summary="Additional Vehicle Information " name="AVtable" id="AVtable">	
	<thead class="styTableThead">
		<tr class="styDepTblHdr">
		 <th class="styDepTblCell" style="width:187mm; vertical-align:top">
      <div class="styPartName" style="width:13mm;">Part IV  </div> 
     <b>Information on Your Vehicle. </b><span class="styNormalText" style="font-size:8pt;">Complete this part <b>only</b> if you are claiming car or truck expenses on line 9,
   and are not required to file Form 4562 for this business. See the instructions for line 13 on page C-5 to find 
    out if you must file Form 4562.</span>    
    </th>
	</tr>
	</thead>
	  <tfoot></tfoot>
	<tbody>				  	
    <xsl:for-each select="$Form1040ScheduleCData/AdditionalVehicleInformation">
  <!-- BEGIN Part IV Title -->
  <tr >			
		<xsl:attribute name="class">
						<xsl:choose>
						<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>
  <!--Line 43-->  
    <td class="styDepTblCell" style="height:5mm;vertical-align:top">      
    <div style="width:187mm;float:left;clear:none">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;text-align:left">43</div>      
      <div class="styLNDesc" style="width:145mm; height:4mm;padding-top:1mm;text-align:left">          
        When did you place your vehicle in service for business purposes? (month, day, year)     
        <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif"  alt="Bullet Image"/> 
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm; border-bottom-width: 1px; border-left-width: 0px;">        
        <xsl:call-template name="PopulateMonthDayYear">
          <xsl:with-param name="TargetNode" select="DateVehiclePlacedInService"/>
        </xsl:call-template>        
      </div>
      <br/>    
      </div>
    </td>   
      </tr>	
        <tr>	
        <xsl:attribute name="class">
						<xsl:choose>
						<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>
    <!--Line 44-->
        <td class="styDepTblCell">   
              <div style="width:187mm;float:left;clear:none">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;text-align:left">44</div>      
      <div class="styLNDesc" style="width: 155mm; height:4mm;padding-top:1mm;text-align:left">        
        Of the total number of miles you drove your vehicle during 2010, enter the number of miles you used your vehicle for:
      </div>      
        </div>
            <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:4mm;text-align:left">
      <span style="width: 3mm;"></span>a</div>      
       <div class="styLNDesc" style="width: 15mm; height:4mm;">        
        Business 
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="BusinessMilesCnt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNLeftNumBox" style="height:4mm;">
      <span style="width: 3mm;"></span>b</div>   
       <div class="styLNDesc" style="width: 43mm; height:4mm;">  Commuting (see instructions)         
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="CommutingMilesCnt"/>
        </xsl:call-template>        
      </div>
  <div class="styLNLeftNumBox" style="height:4mm;"><span style="width: 3mm;"></span>c</div>   
       <div class="styLNDesc" style="width: 10mm; height:4mm;">Other        
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OtherMilesCnt"/>
        </xsl:call-template>        
      </div>
       <br/>    
           </div>
       </td>     
       </tr>
       <tr>					
	 <xsl:attribute name="class">
						<xsl:choose>
						<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>						
   <!--Line 45-->
   <td class="styDepTblCell">      
    <div style="width:187mm;float:left;clear:none">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;text-align:left">45</div>
      <div class="styLNDesc" style="width:140mm;padding-top:1mm;text-align:left">
  Was your vehicle available for personal use during off-duty hours?
    <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
             <span style="width:16px;"></span>.    
          </span>       
          </div>
          <div class="styLNDesc" style="width:28mm;text-align:left">
           <span style="width: 0mm;"></span>             
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
          </xsl:call-template>
         <span class="styBoldText"> Yes</span>
        </label>                    
             <span style="width: 5mm;"></span>
         <input type="checkbox"  class="styCkbox"  name="Checkbox">
            <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
           <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
          </xsl:call-template>
          <span class="styBoldText"> No</span>
        </label>                        
      </div>  
       <br/>    
            </div>     
    </td>
    </tr>
    
 <tr>					
	 <xsl:attribute name="class">
						<xsl:choose>
						<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>				
      <!--Line 46-->
        <td class="styDepTblCell" style="width:187mm;">      
          <div style="width:187mm;float:left;clear:none">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;text-align:left">46</div>
      <div class="styLNDesc" style="width:140mm;padding-top:1mm;text-align:left">
Do you (or your spouse) have another vehicle available for personal use?
    <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
             <span style="width:16px;"></span>.    
          </span>   
             </div>
              <div  class="styLNDesc"  style="width:28mm;text-align:left">
           <span style="width:0mm;"> </span>         
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="AnotherVehicleInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="AnotherVehicleInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
          </xsl:call-template>
          <span class="styBoldText"> Yes</span>
        </label>                    
             <span style="width: 5mm;"></span>
         <input type="checkbox"  class="styCkbox"  name="Checkbox">
            <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="AnotherVehicleInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
           <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="AnotherVehicleInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
          </xsl:call-template>
           <span class="styBoldText"> No</span>
        </label>                        
      </div>    
 <br/>    
      </div>          
    </td>
    </tr>	
<tr>					
	 <xsl:attribute name="class">
						<xsl:choose>
						<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>		
       <!--Line 47a--> 
        <td class="styDepTblCell" style="width:187mm;">      
        <div style="width:187mm;float:left;clear:none">      
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;text-align:left">47a</div>
      <div class="styLNDesc" style="width:140mm;padding-top:1mm;text-align:left">
Do you have evidence to support your deduction?
    <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
             <span style="width:16px;"></span>.    
          </span> 
             </div>
                <div class="styLNDesc"  style="width:28mm;text-align:left">
           <span style="width:0mm;"> </span>         
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
          </xsl:call-template>
           <span class="styBoldText"> Yes</span>
        </label>                    
             <span style="width: 5mm;"></span>
         <input type="checkbox"  class="styCkbox"  name="Checkbox">
            <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
           <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
          </xsl:call-template>
           <span class="styBoldText"> No</span>
        </label>  
                              
      </div> 
      <!--Line 47b-->     
        <div style="width:187mm;float:left;clear:none;">  
       <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;text-align:left">
        <span style="width:3.4mm;"></span>b</div>
      <div class="styLNDesc" style="width:140mm;padding-top:1mm;text-align:left">
If "Yes," is the evidence written?
    <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
             <span style="width:16px;"></span>.    
          </span>   
              </div>
                <div class="styLNDesc"  style="width:28mm;text-align:left">
           <span style="width:0mm;"> </span>         
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="EvidenceWrittenInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AdditionalVehicleInformation/EvidenceWrittenInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
          </xsl:call-template>
           <span class="styBoldText"> Yes</span>
        </label>                    
             <span style="width: 5mm;"></span>
         <input type="checkbox"  class="styCkbox"  name="Checkbox">
            <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="EvidenceWrittenInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
           <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AdditionalVehicleInformation/EvidenceWrittenInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
          </xsl:call-template>
           <span class="styBoldText"> No</span>
        </label>                        
      </div>        
    </div>
    <br/>    
      </div> 
    </td>   
    </tr>
    	</xsl:for-each>
    	</tbody>
	</table>
	 </xsl:if>
	 <!-- END Part IV Title -->	
      <!-- Begin separated repeating data table Part V-->
    <xsl:if test="($Print = $Separated) and (count($Form1040ScheduleCData/OtherExpenses) &gt; 5)">
      <span class="styRepeatingDataTitle">Form 1040 Schedule C, Part V, Other expenses (specify):</span><br/>    
      <table class="styDepTbl" style="font-size:7pt;" cellspacing="0" summary="Table displaying Other Expenses information" name="OEtable" id="OEtable">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell"  scope="col" colspan="1" style="width:155mm;" >(a) Description</th>
          <th class="styDepTblCell" scope="col" colspan="1" style="width:32mm;" >(b) Amount</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
          <xsl:for-each select="$Form1040ScheduleCData/OtherExpenses">
              <tr> 
                  <xsl:choose>
                    <xsl:when   test="$Form1040ScheduleCData/OtherExpenses">
                      <xsl:attribute name="class">
                        <xsl:choose>
                           <xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when>
                           <xsl:otherwise>styDepTblRow1</xsl:otherwise>
                        </xsl:choose>
                      </xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:attribute name="class">
                        <xsl:choose>
                           <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                           <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                        </xsl:choose>
                      </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
                <td class="styDepTblCell" style="width:155mm;height:4.5mm;text-align:left;border-left:1 solid 0px;">      
                  <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Description" />
                  </xsl:call-template>
                  <span style="width:9mm;"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherExpenses"/>
                    </xsl:call-template>  
                </td>
                <td class="styDepTblCell" style="height:4.5mm;width:32mm;text-align:right;border-right-width: 0px;">
                <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Amount" />
                </xsl:call-template>
           
                </td>
              </tr>
          </xsl:for-each>  
       </tbody>
    </table>
 </xsl:if>    
 
</form>
  </body>
</html>
</xsl:template>
<xsl:template name="AddPositionNumber">
  <xsl:if test="position()=1">1</xsl:if>
  <xsl:if test="position()=2">2</xsl:if>
  <xsl:if test="position()=3">3</xsl:if>
  <xsl:if test="position()=4">4</xsl:if>
  <xsl:if test="position()=5">5</xsl:if>    
</xsl:template>
</xsl:stylesheet>

  
