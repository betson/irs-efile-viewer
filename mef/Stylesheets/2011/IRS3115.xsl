<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS3115Style.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*" />
<xsl:param name="Form3115Data" select="$RtnDoc/IRS3115" />
<xsl:template match="/">
<html>
  <head>    
    <title>
      <xsl:call-template name="FormTitle">
        <xsl:with-param name="RootElement" select="local-name($Form3115Data)">
      </xsl:with-param></xsl:call-template>
    </title>
    <!-- No Browser Caching  -->
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private"/>        
    <meta name="Description" content="Form 3115"/>
    <meta name="Generator" content="IBM WebSphere Studio"/>
     <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
     <style type="text/css">    
      <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS3115Style"></xsl:call-template>    
        <xsl:call-template name="AddOnStyle"></xsl:call-template>  
 </xsl:if>
    </style>        
    <xsl:call-template name="GlobalStylesForm"/>
  </head>
   <body class="styBodyClass">      
    <form style="font-family:arial; font-size:9pt" name="Form3115">      
      <xsl:call-template name="DocumentHeader"></xsl:call-template>  
      <div class="styTBB" style="width:187mm">
        <div style="float:left; width:31mm; font-size:7pt">    
          Form &nbsp;
          <span class="styFormNumber">3115</span>
          <!--<xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data"/>              
          </xsl:call-template>-->
           <div>(Rev. December 2009)
            <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data"/>              
          </xsl:call-template>    
           </div>        
          <div style="font-size:6pt">        
            Department of the Treasury<br/>Internal Revenue Service
          </div>            
        </div>
        <div class="styMainTitle" style="float:left; border-left:1 solid black; border-right:1 solid black; width:125mm; height:17.5mm; text-align:center; padding-top:7mm;">
          Application for Change in Accounting Method          
        </div>
        <div style="float:left; font-size:7pt; width:31mm; padding-top:8mm; text-align:center">
          OMB No. 1545-0152
        </div>
      </div>      
       <div class="styBB" style="width:187mm; font-size:8pt">
        <div style="float:left; width:108mm; height:16mm; border-right:1 solid black">
          Name of filer (name of parent corporation if a consolidated group) (see instructions)
          <div style="padding-left:5mm; padding-top:1mm">          
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>
          </div>    
        </div>
        <div style="float:left; padding-left:2mm; height:8mm">
          <b>Identification number (see instructions)</b>
          <div style="text-align:left; width:100%; font-size: 8pt">
            <!-- If SSN exists -->
            <xsl:if test="not($Form3115Data/ShareholderSSN='' or not($Form3115Data/SSN))">
              <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="$Form3115Data/SSN"/>
              </xsl:call-template>
            </xsl:if>
            <!-- Else if EIN exists -->
            <xsl:if test="not($Form3115Data/ShareholderEIN='' or not($Form3115Data/EIN))">
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="$Form3115Data/EIN"/>
              </xsl:call-template>
            </xsl:if>
            <!--New- Else reason for no EIN/SSN -->
            <xsl:if test="not($Form3115Data/MissingSSNEINReason='' or not($Form3115Data/MissingSSNEINReason))">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form3115Data/MissingSSNEINReason"/>
              </xsl:call-template>
            </xsl:if>
            <!--
            Old Code
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">
                EIN
              </xsl:with-param>
            </xsl:call-template>
            -->
          </div>
        </div>
        <div style="float:left; padding-left:2mm; border-top:1 solid black">
          Principal business activity code number (see instructions)
          <div style="text-align:left; width:100%; font-size: 8pt">
          
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/PrincipalBusinessActivityCode"/>
            </xsl:call-template>    
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/InactivePrincipalBusActyCode"/>
            </xsl:call-template>                            
     </div>
        </div>
      </div>          
       <div class="styBB" style="width:187mm">
        <div style="float:left; font-size:8pt; width:108mm; height:10mm; border-right:1 solid black">
          Number, street, and room or suite no. If a P.O. box, see the instructions.
          <div style="padding-left:5mm; line-height:100%; font-size: 8pt">          
              <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine1</xsl:with-param></xsl:call-template><br />
              <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine2</xsl:with-param></xsl:call-template>
          </div>    
        </div>
        <div style="float:left; font-size:8pt; padding-left:2mm; height:5mm">
          <span style="float:left">
            Tax year of change begins (MM/DD/YYYY)
          </span>
          <span style="float:right; margin-right:2mm; font-size:8pt">
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="$Form3115Data/TaxYearBeginning"/>
            </xsl:call-template>                            
          </span>
        </div>
        <div style="float:left; font-size:8pt; padding-left:2mm; border-top:1 solid black; width:79mm; height: 5mm">
          <span style="float:left">
            Tax year of change ends (MM/DD/YYYY)
          </span>
          <span style="float:right; margin-right:2mm; font-size:8pt">
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="$Form3115Data/TaxYearEnding"/>
            </xsl:call-template>                            
          </span>
        </div>
      </div>        
       <div class="styBB" style="width:187mm">
        <div style="float:left; font-size:8pt; width:108mm; height:10mm; border-right:1 solid black">
          City or town, state, and ZIP code
          <div style="padding-left:5mm; line-height:100%">                                
              <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param></xsl:call-template>
              <br />
              <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">Country</xsl:with-param></xsl:call-template>
          </div>    
        </div>
        <div style="float:left; font-size:8pt; padding-left:2mm; height:10mm">
          Name of contact person (see instructions)
          <div style=" padding-top:1mm">                            
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/NameOfPersonToContact"/>
            </xsl:call-template>            
          </div>    
        </div>        
      </div>  
       <div class="styBB" style="width:187mm">
        <div style="float:left; font-size:8pt; width:139mm; height:10mm; border-right:1 solid black">
          Name of applicant(s) (if different than filer) and identification number(s) <span style="font-size:7pt">(see instructions)</span>
          <div style="padding-left:5mm; line-height:100%; float:left">    
            <xsl:choose>                        
              <xsl:when test="normalize-space($Form3115Data/BusinessName) != ''">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/BusinessName/BusinessNameLine1"/>
                </xsl:call-template>
                <xsl:if test="normalize-space($Form3115Data/BusinessName/BusinessNameLine2) != ''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/BusinessName/BusinessNameLine2"/>
                  </xsl:call-template>                                                        
                </xsl:if>  
              </xsl:when>    
              <xsl:otherwise>    
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/PersonName"/>
                </xsl:call-template>                
              </xsl:otherwise>    
            </xsl:choose>      
          </div>
          <div style="float:right; padding-right:1mm">
            <xsl:if test="($Form3115Data/SSN) or ($Form3115Data/EIN)">
              I.D. No.:
            </xsl:if> 
            <xsl:for-each select="$Form3115Data/SSN">
              <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="."/>                
              </xsl:call-template>    
              <xsl:if test="position()!=last()">, </xsl:if>
            </xsl:for-each>    
            <xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="$Form3115Data/EIN"/>                
            </xsl:call-template>    
          </div>
        </div>  
        <div style="float:left; font-size:8pt; padding-left:2mm; height:10mm">
          Contact person's telephone number
          <div style="padding-top:1mm">    
            <xsl:call-template name="PopulatePhoneNumber">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ContactPersonPhoneNumber"/>
            </xsl:call-template>  
          </div>    
        </div>        
      </div>  
       <div class="styBB" style="width:187mm; height:4mm">        
        <span style="float:left">
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsMemberOfConsolidatedGroup"/>
            <xsl:with-param name="BackupName">Is Member Of Consolidated Group</xsl:with-param>  
            </xsl:call-template>   
            If the applicant is a member of a consolidated group, check this box
          </label>
        </span>
        <span style="float:right; margin-right:15mm">
          <span class="styDotLn" style="padding-right:5mm">      
            ..............
            <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
          </span>            
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsMemberOfConsolidatedGroup" />
            </xsl:call-template>
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IsMemberOfConsolidatedGroup"/>
                <xsl:with-param name="BackupName">Is Member Of Consolidated Group</xsl:with-param>
              </xsl:call-template>
            </input>    
          </span>
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IsMemberOfConsolidatedGroup"/>
          </xsl:call-template>                  
        </span>              
      </div>
      <!-- ************************************************************************************  -->
        <div style="width:187mm">If <b>Form 2848</b>, Power of Attorney and Declaration of Representative, is attached (see instructions for when Form 2848 is required), </div>
      <!-- ************************************************************************************  -->
         <div class="styBB" style="width:187mm; height:4mm">        
        <span style="float:left">
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form3115Data/HasApplicantAttachedForm2848" />
             <xsl:with-param name="BackupName">Has Applicant Attached Form2848</xsl:with-param> 
            </xsl:call-template> check this box                      
          </label>
        </span>
        <span style="float:right; margin-right:16mm">
          <span class="styDotLn" style="padding-right:5mm">      
            .............................    
            <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>          
          </span>          
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form3115Data/HasApplicantAttachedForm2848" />
            </xsl:call-template>
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/HasApplicantAttachedForm2848"/>
               <xsl:with-param name="BackupName">Has Applicant Attached Form2848</xsl:with-param> 
              </xsl:call-template>
            </input>  
          </span>
        </span>    
      </div>
      <!-- ************************************************************************************  -->
       <div class="styBB" style="width:187mm">
        <div style="float:left; width:108mm; border-right:1 solid black; padding-bottom:0.5mm">
          <b>Check the box to indicate the applicant.</b>          
          <div style="float:left; width:59mm; margin-top:2mm">    
            <div style="width:100%">      
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/Individual"/>
                    <xsl:with-param name="BackupName">Who Is Filing Form/Individual</xsl:with-param>
                  </xsl:call-template>
                </input>  
              </div>
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/Individual" />
                   <xsl:with-param name="BackupName">Who Is Filing Form/Individual</xsl:with-param> 
                  </xsl:call-template>   
                  Individual
                </label>  
              </div>
            </div>  
            <div style="margin-top:0.5mm">
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/Corporation"/>
                 <xsl:with-param name="BackupName">Who Is Filing FormCorporation</xsl:with-param>   
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/Corporation" />
                   <xsl:with-param name="BackupName">Who Is Filing FormCorporation</xsl:with-param>    
                  </xsl:call-template>   
                  Corporation
                </label>  
              </div>
            </div>
            <div style="margin-top:0.5mm">
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/ControlledForeignCorporation"/>
                    <xsl:with-param name="BackupName">Controlled Foreign Corporation</xsl:with-param>   
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">  
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/ControlledForeignCorporation" />
                     <xsl:with-param name="BackupName">Controlled Foreign Corporation</xsl:with-param>  
                  </xsl:call-template>   
                  Controlled foreign corporation<br/>(Sec. 957)
                </label>  
              </div>    
            </div>
            <div style="margin-top:0.5mm">
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/Corporation1050"/>
                   <xsl:with-param name="BackupName">Corporation1050</xsl:with-param>  
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/Corporation1050" />
                 <xsl:with-param name="BackupName">Corporation1050</xsl:with-param> 
                  </xsl:call-template>   
                  10/50 corporation (Sec. 904(d)(2)(E))
                </label>  
              </div>
            </div>
            <div style="margin-top:0.5mm">
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/QualifiedPersonalServiceCorp"/>
                    <xsl:with-param name="BackupName">Qualified Personal Service Corp</xsl:with-param>
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">  
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/QualifiedPersonalServiceCorp" />
                 <xsl:with-param name="BackupName">Qualified Personal Service Corp</xsl:with-param>   
                  </xsl:call-template>   
                  Qualified personal service<br/>corporation (Sec. 448(d)(2))
                </label>  
              </div>                        
            </div>
          </div>
           <div style="float:left; margin-top:2mm">  
            <div style="width:100%">
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/Cooperative"/>
                 <xsl:with-param name="BackupName">Cooperative</xsl:with-param>   
                  </xsl:call-template>
                </input>  
              </div>
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/Cooperative" />
                    <xsl:with-param name="BackupName">Cooperative</xsl:with-param>  
                  </xsl:call-template>   
                  Cooperative (Sec. 1381)
                </label>  
              </div>
            </div>    
            <div style="margin-top:0.5mm">  
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/Partnership"/>
                   <xsl:with-param name="BackupName">Partnership</xsl:with-param>   
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/Partnership" />
                    <xsl:with-param name="BackupName">Partnership</xsl:with-param> 
                  </xsl:call-template>   
                  Partnership
                </label>  
              </div>
            </div>    
            <div style="margin-top:0.5mm">  
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/SCorporation"/>
                  <xsl:with-param name="BackupName">SCorporation</xsl:with-param>   
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">  
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/SCorporation" />
                    <xsl:with-param name="BackupName">SCorporation</xsl:with-param>   
                 </xsl:call-template>   
                  S corporation
                </label>  
              </div>      
            </div>    
            <div style="margin-top:0.5mm">    
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/InsuranceCompanySect816a"/>
                    <xsl:with-param name="BackupName">Insurance Company Sect816a</xsl:with-param>   
                  </xsl:call-template>
                </input>  
              </div>            
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/InsuranceCompanySect816a" />
                    <xsl:with-param name="BackupName">Insurance Company Sect816a</xsl:with-param>  
                  </xsl:call-template>   
                  Insurance co. (Sec. 816(a))
                </label>  
              </div>
            </div>    
            <div style="margin-top:0.5mm">  
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/InsuranceCompanySect831"/>
                    <xsl:with-param name="BackupName">Insurance Company Sect831</xsl:with-param>  
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/InsuranceCompanySect831" />
                    <xsl:with-param name="BackupName">Insurance Company Sect831</xsl:with-param> 
                  </xsl:call-template>   
                  Insurance co. (Sec. 831)
                </label>  
              </div>
            </div>    
            <div style="margin-top:0.5mm">  
              <div style="float:left">  
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/Other"/>
                   <xsl:with-param name="BackupName">WhoIsFilingForm/Other</xsl:with-param>
                  </xsl:call-template>
                </input>  
                <label>
                  <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/Other" />
                   <xsl:with-param name="BackupName">WhoIsFilingForm/Other</xsl:with-param> 
                  </xsl:call-template>   
                  Other (specify) <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>&nbsp;                                    
                </label>  
                <span style="border-bottom:1 solid black; width:18mm;font-size:8pt;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/Other/@description"/>
                  </xsl:call-template>  
                </span>
              </div>      
            </div>                    
          </div>
          <br/>          
          <div class="styIRS3115ChxBoxDiv">
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/ExemptOrganization"/>
                <xsl:with-param name="BackupName">Exempt Organization</xsl:with-param>  
              </xsl:call-template>
            </input>  
          </div>  
          <div style="float:left">  
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/ExemptOrganization" />
                 <xsl:with-param name="BackupName">Exempt Organization</xsl:with-param> 
              </xsl:call-template>   
              Exempt organization. Enter Code section <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>&nbsp;                                          
            </label>  
          </div>      
          <div class="stySmallText" style="float:left; margin-top:1mm">            
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/ExemptOrganization/@codeSection"/>
            </xsl:call-template>  
          </div>                  
        </div>
        <div style="float:left; padding-left:2mm">          
          <b>Check the appropriate box to indicate the type<br/>of accounting method change being requested.</b><br/>(see instructions)                    
          <div style="margin-top:3.5mm">
            <div style="width:100%">
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/TypeOfAccountingMethod/DepreciationOrAmortization"/>
                   <xsl:with-param name="BackupName">DepreciationOrAmortization</xsl:with-param>   
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/TypeOfAccountingMethod/DepreciationOrAmortization" />
                    <xsl:with-param name="BackupName">DepreciationOrAmortization</xsl:with-param>
                  </xsl:call-template>   
                  Depreciation or Amortization
                </label>  
              </div>
            </div>
            <div style="margin-top:0.5mm">
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/TypeOfAccountingMethod/FinancialProductsAndActivities"/>
                    <xsl:with-param name="BackupName">Financial Products And Activities</xsl:with-param>
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/TypeOfAccountingMethod/FinancialProductsAndActivities" />
                     <xsl:with-param name="BackupName">Financial Products And Activities</xsl:with-param>
                  </xsl:call-template>   
                  Financial Products and/or Financial Activities of<br/>Financial Institutions
                </label>  
              </div>
            </div>
            <div style="margin-top:0.5mm">
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/TypeOfAccountingMethod/Other"/>
                     <xsl:with-param name="BackupName">TypeOfAccountingMethod/Other</xsl:with-param>
                  </xsl:call-template>
                </input>  
              </div>                
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/TypeOfAccountingMethod/Other" />
                    <xsl:with-param name="BackupName">TypeOfAccountingMethod/Other</xsl:with-param>
                  </xsl:call-template>   
                  Other (specify) <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>&nbsp;                                
                </label>  
              </div>                
              <div style="border-bottom:1 solid black; width:47mm; float:right">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/TypeOfAccountingMethod/Other/@description"/>
                </xsl:call-template>    
              </div>
            </div>                                    
          </div>  
        </div>        
      </div>  
       <div class="styBB" style="width:187mm; font-size:8.5pt; padding-top:0.5mm; padding-bottom:0.5mm">
        <b>Caution:</b> <i>To be eligible for approval of the requested change in method of accounting, the taxpayer must provide all information that is relevant to the taxpayer
or to the taxpayer's requested change in method of accounting. This includes all information requested on this Form 3115 (including its instructions), as
well as any other information that is not specifically requested.</i><br/>
<b>The taxpayer must attach all applicable supplemental statements requested throughout this form.</b>      
      </div>
     <!-- BEGIN Part I Title -->
      <div class="styBB" style="width:187mm; ">
        <div class="styPartName" style="width:11mm; height:4.2mm; font-size:9.5pt">Part I</div>
        <div class="styPartDesc" style="width:150mm; font-size:9.5pt">
          Information For Automatic Change Request
        </div>      
        <div style="float:right">
          <div class="styIRS3115YesBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>Yes</b></div>  
          <div class="styIRS3115NoBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>No</b></div>
        </div>
      </div>
    <!-- END Part I Title -->
     <!-- BEGIN Part I Line Items -->  
       <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">1</div>
        <div style="float:left">
         Enter the applicable designated automatic accounting method change number for the requested automatic change.<br/>
         Enter only one designated automatic accounting method change number, except as provided for in guidance<br/>published by the IRS. If the requested change has no designated automatic accounting method change number,<br/>check &#8220;Other,&#8221; and provide both a description of the change and citation of the IRS guidance  providing the automatic <br/>
         change. See instructions. <br/>             
          <div style="padding-top:1mm">
            <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
            <span style="font-size:8pt">(a) Change No.</span>
            <span style="border-bottom:1 solid black; width:4mm; text-align:center">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form3115Data/DesignatedAcctMthdChangeNumber" />
              </xsl:call-template>   
            </span>
            <span style="font-size:8pt"> (b) Other </span>
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/OtherAccountingMethod"/>
                <xsl:with-param name="BackupName">Other Accounting Method</xsl:with-param>
              </xsl:call-template>
            </input>  
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form3115Data/OtherAccountingMethod" />
               <xsl:with-param name="BackupName">Other Accounting Method</xsl:with-param> 
              </xsl:call-template>   
             <span style="font-size:8pt"> Description </span><img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>                  
            </label>
            <span style="border-bottom:1 solid black; width:102mm; font-size:7pt">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form3115Data/OtherAccountingMethod/@description" />
              </xsl:call-template>   
            </span>
          </div>
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:26mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:26mm"></div>  
        </div>
      </div>  
       <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">2</div>
        <div style="float:left">
          Do any of the scope limitations described in section 4.02 of Rev. Proc. 2008-52 cause automatic consent to be     
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>  
        </div>
      </div>          
       <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
       unavailable for the applicant&#39;s requested change? If   &#8220;Yes,&#8221; attach an explanation
        </div>
        <div style="float:right">          
          <span class="styDotLn" style="padding-right:4mm">      
            ...........
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ScopeLmtCsAutoCnsntUnavailable"/>
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ScopeLmtCsAutoCnsntUnavailable"/>
            </xsl:call-template>
          </div>        
        </div>  
      </div>          
       <div style="width:187mm">
        <div style="float:left">
    <!--    <b>Note.</b> Complete Part II below and then Part IV, and also Schedules A through E of this form (if applicable).-->
        </div>
         <div style="float:left">
          <span><b>Note:</b> <i> Complete Part II below and then Part IV, and also Schedules A through E of this form (if applicable).</i></span>
        </div>
        <div style="float:right">      
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>        
        </div>  
      </div> 
         <!-- BEGIN Part II Title -->
      <div class="styBB" style="width:187mm; border-top:1 solid black">
        <div class="styPartName" style="width:12mm; height:4.2mm; font-size:9.5pt">Part II</div>
        <div class="styPartDesc" style="width:150mm; font-size:9.5pt">
          Information For All Requests          
        </div>
        <div style="float:right">  
          <div class="styIRS3115YesBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>Yes</b></div>  
          <div class="styIRS3115NoBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>No</b></div>
        </div>
      </div>
    <!-- END Part II Title -->       
       <div style="width:187mm">      
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">3</div>
        <div style="float:left">
       Did or will the applicant cease to engage in the trade or business to which the requested change relates, or
        </div>
        <div style="float:right">      
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>        
        </div>  
      </div> 
      <!-- *******************************************************************************  -->
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
           terminate its existence, in the tax year of change (see instructions)?
        </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:0mm">      
            .................        
          </span>              
        <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ApplcntCsTradeBusReqChgRelates"/>
            </xsl:call-template>
          </div>  
              <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ApplcntCsTradeBusReqChgRelates"/>
            </xsl:call-template>
          </div>     
        </div>
      </div>
      <!--  ******************************************************************************* -->         
     
       <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          If  &#8220;Yes,&#8221; the applicant is not eligible to make the change under automatic change request procedures.      
        </div>
        <div style="float:right">      
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>        
        </div>  
      </div>          
       <div style="width:187mm;">    
       
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>  
        </div>          
      </div>        
    <!-- END Part I Line Items -->
    
    <!-- BEGIN Part II Line Items -->    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">4a</div>
        <div style="float:left">
          Does the applicant (or any present or former consolidated group in which the applicant was a member during
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="border-bottom:1 solid black"></div>  
          <div class="styIRS3115DimNoBox" style="border-bottom:1 solid black"></div>        
        </div>
      </div>
       <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          the applicable tax year(s)) have any Federal income tax return(s) under examination (see instructions)?
        </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:0mm">      
            ...
            <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">
                Any Federal Returns Under Examination Repeating Group
              </xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form3115Data/ReturnsUnderExaminationInfo"/>
            </xsl:call-template>        
          </span>              
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsAnyFederalReturnsUnderExam"/>
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsAnyFederalReturnsUnderExam"/>
            </xsl:call-template>
          </div>        
        </div>
      </div>
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
           If  &#8220; No,&#8221;  go to line 5.             
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>        
        </div>
      </div>
       <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left">
          Is the method of accounting the applicant is requesting to change an issue (with respect to either the applicant<br/>or any present or former consolidated group in which the applicant was a member during the applicable tax                    
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:8mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:8mm"></div>          
        </div>
      </div>
       <div style="width:187mm; border-bottom:1 solid black">
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          year(s)) either (i) under consideration or (ii) placed in suspense (see instructions)?      
        </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:0mm">      
            .........
            <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">
                Method of Change Issue Under Consideration or Placed in Suspense Repeating Group
              </xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form3115Data/ConsiderationOrSuspenseInfo"/>
            </xsl:call-template>    
          </span>    
          <div class="styIRS3115YesBox" style="border-bottom:0">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsMethodOfChangeIssueSuspense"/>
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox" style="border-bottom:0">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsMethodOfChangeIssueSuspense"/>
            </xsl:call-template>
          </div>  
        </div>      
      </div>  
       <div style="width:187.5mm; text-align:center; font-size:7pt">
        <b style="font-size:10pt; padding-top:1mm; padding-bottom:1mm">Signature</b> &nbsp; <i style="font-size:10pt">(see instructions)</i>
        <div style="font-size:7pt; font-weight:bold; text-align: justify;">
          Under penalties of perjury, I declare that I have examined this application, including accompanying schedules and statements, and to the best of my<br/>knowledge and belief, the application contains all the relevant facts relating to the application, and it is true, correct, and complete. Declaration of preparer<br/>(other than applicant) is based on all information of which preparer has any knowledge.
        </div>
        <div style="width:187mm">
          <div style="float:left; width:90mm; text-align:center">
            <b style="font-size:9pt">Filer</b>
            <div style="border-bottom:1 solid black; width:100%; height:7mm">
         <xsl:call-template name="PopulateReturnHeaderOfficer"> 
	            <xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param> 
               </xsl:call-template>
              <span style="width:9mm"></span>
               <xsl:call-template name="PopulateReturnHeaderOfficer"> 
	           <xsl:with-param name="TargetNode">DateSigned</xsl:with-param> 
               </xsl:call-template>
            </div>
            <b>Signature and date</b>
            <div style="border-bottom:1 solid black; width:100%; height:8mm; line-height:105%; text-align:left">                
          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>
            </div>
            <b>Name and title (print or type)</b>
          </div>        
          <div style="float:right; width:90mm; text-align:center">
            <b style="font-size:9pt">Preparer (other than filer/applicant)</b>
            <div style="border-bottom:1 solid black; width:100%; height:7mm">
                <xsl:call-template name="PopulateReturnHeaderPreparer"> 
		   <xsl:with-param name="TargetNode">SSN</xsl:with-param> 
		</xsl:call-template> 
		<xsl:call-template name="PopulateReturnHeaderPreparer"> 
		   <xsl:with-param name="TargetNode">PTIN</xsl:with-param> 
                </xsl:call-template>
            </div>
            <b>Signature of individual preparing the application and date</b>
            <div style="border-bottom:1 solid black; width:100%; height:8mm;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form3115Data/NameOfPreparerOtherThanFiler" />
              </xsl:call-template>
            </div>
            <b>Name of individual preparing the application (print or type)</b>
            <div style="border-bottom:1 solid black; width:100%; text-align:left; height:8mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form3115Data/PreparingFirmBusinessName/BusinessNameLine1" />
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form3115Data/PreparingFirmBusinessName/BusinessNameLine2" />
              </xsl:call-template>                
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form3115Data/PreparingFirmPersonName" />
              </xsl:call-template>            
            </div>
            <b>Name of firm preparing the application</b>
          </div>
        </div>
      </div>          
       <xsl:call-template name="IRS3115Footer">
        <xsl:with-param name="thisPage" select="2"/>
      </xsl:call-template>
       <div class="styBB" style="width:187mm; border-top:1 solid black">
        <div class="styPartName" style="width:12mm; height:4.2mm; font-size:9.5pt">Part II</div>
        <div class="styPartDesc" style="width:150mm; font-size:9.5pt">
          Information For All Requests <span style="font-weight:normal">(continued)</span>
        </div>          
        <div style="float:right">  
          <div class="styIRS3115YesBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>Yes</b></div>  
          <div class="styIRS3115NoBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>No</b></div>
        </div>    
      </div>        
      
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center; padding-top:1mm">4c</div>
        <div style="float:left; padding-top:1mm">
          Is the method of accounting the applicant is requesting to change an issue pending (with respect to either the<br/>applicant or any present or former consolidated group in which the applicant was a member during the applicable          
        </div>
        <div style="float:right">  
          <span style="float:left">
            <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">
                Method of Accounting Issue Pending for Any Tax Year Under Examination Repeating Group
              </xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form3115Data/IssuePendingExaminationInfo"/>
            </xsl:call-template>    
          </span>
          <div class="styIRS3115DimYesBox" style="height:9mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:9mm"></div>        
        </div>    
      </div>    
       <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          tax year(s)) for any tax year under examination (see instructions)?
        </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:4mm">      
            ................                    
          </span>          
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsMethodOfAcctIssuePending"/>
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsMethodOfAcctIssuePending"/>
            </xsl:call-template>
          </div>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">d</div>
        <div style="float:left">
          Is the request to change the method of accounting being filed under the procedures requiring that the operating                  
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>          
        </div>    
      </div>    
       <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          division director consent to the filing of the request (see instructions)?
        </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:4mm">      
            ..............          
          </span>                  
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/DoesRequestRequireConsent"/>
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/DoesRequestRequireConsent"/>
            </xsl:call-template>          
          </div>        
        </div>    
      </div>    
       <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox"></div>
        <div style="float:left">
          If   &#8220;Yes,&#8221; attach the consent statement from the director.  
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/DoesRequestRequireConsent"/>
          </xsl:call-template>                            
        </div>        
        <div style="float:right">                
          <div class="styIRS3115DimYesBox" style="height:4.4mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:4.4mm"></div>          
        </div>    
      </div>    
       <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">e</div>
        <div style="float:left">
          Is the request to change the method of accounting being filed under the 90-day or 120-day window period?        
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">.
          </span>      
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsReqFiledUnderWindowPeriod"/>
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsReqFiledUnderWindowPeriod"/>
            </xsl:call-template>          
          </div>          
        </div>    
      </div>    
            <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox"></div>
        <div style="float:left">
          If   &#8220;Yes,&#8221; check the box for the applicable window period and attach the required statement (see instructions).<br/>
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/NinetyDaysPeriod"/>
              <xsl:with-param name="BackupName">Ninety Days Period</xsl:with-param>
            </xsl:call-template>
          </input>            
          <label>
            <xsl:call-template name="PopulateLabel">
             <xsl:with-param name="TargetNode" select="$Form3115Data/NinetyDaysPeriod" />
             <xsl:with-param name="BackupName">Ninety Days Period</xsl:with-param>
            </xsl:call-template>   
            90 day        
          </label>
          <span style="width:20mm"></span>
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/OneHundredTwentyDaysPeriod"/>
             <xsl:with-param name="BackupName">One Hundred Twenty Days Period</xsl:with-param> 
            </xsl:call-template>
          </input>  
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form3115Data/OneHundredTwentyDaysPeriod"/>
               <xsl:with-param name="BackupName">One Hundred Twenty Days Period</xsl:with-param> 
            </xsl:call-template>   
            120 day : Date examination ended
            <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
          </label>
          <!--KEVINCHANG-->
           <span style="border-bottom:1 solid black; width:60mm; text-align:center">
        <xsl:call-template name="PopulatePhoneNumber">
          <xsl:with-param name="TargetNode" select="PhoneNumber"/>
        </xsl:call-template>
      </span> 
        <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IsReqFiledUnderWindowPeriod" />
          </xsl:call-template> 
        </div>

        <div style="float:right">  
          
          <div class="styIRS3115DimYesBox" style="height:14mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:14mm"></div>          
        </div>    
      </div>    
     <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">f</div>
        <div style="float:left">
          If you answered "Yes" to line 4a, enter the name and telephone number of the examining agent and the tax<br/>year(s) under examination.
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:8mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:8mm"></div>          
        </div>    
      </div> 
    <xsl:if test="($Print != $Separated) or (count($Form3115Data/ContactInfoOfExaminingAgents) = 1) "> 
      <xsl:for-each select="$Form3115Data/ContactInfoOfExaminingAgents">
      <div style="width: 187mm">
      <div style="float:left">
       <span style="width:10mm; margin-left: 6mm">
        Name
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1 solid black; width:62mm">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="Name"/>
        </xsl:call-template>
      </span>
      <span style="width:30mm; margin-left:2mm">
        Telephone number
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1 solid black; width:23mm; text-align:center">
        <xsl:call-template name="PopulatePhoneNumber">
          <xsl:with-param name="TargetNode" select="PhoneNumber"/>
        </xsl:call-template>
      </span>
      <span style="margin-left:2mm;width:17mm">
        Tax year(s)
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1 solid black; width:12mm; text-align:center">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="TaxYear"/>
        </xsl:call-template>
      </span>
      </div>
      <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:4.5mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:4.5mm"></div>          
        </div>
            </div>
    </xsl:for-each>
</xsl:if>
    <xsl:if test="count($Form3115Data/ContactInfoOfExaminingAgents) &lt;1 or ((count($Form3115Data/ContactInfoOfExaminingAgents) &gt; 1) and ($Print = $Separated))">
      <div style="width: 187mm">
      <div style="float:left">
       <span style="width:10mm; margin-left: 6mm">
        Name
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1 solid black; width:62mm">
        <xsl:call-template name="PopulateAdditionalDataTableMessage">
          <xsl:with-param name="TargetNode" select="$Form3115Data/ContactInfoOfExaminingAgents"/>                      
        </xsl:call-template>
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="Name"/>
        </xsl:call-template>
      </span>
      <span style="width:30mm; margin-left:2mm">
        Telephone number
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1 solid black; width:23mm; text-align:center">
        <xsl:call-template name="PopulatePhoneNumber">
          <xsl:with-param name="TargetNode" select="PhoneNumber"/>
        </xsl:call-template>
      </span>
      <span style="margin-left:2mm;width:17mm">
        Tax year(s)
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1 solid black; width:12mm; text-align:center">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="TaxYear"/>
        </xsl:call-template>
      </span>
      </div>
      <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:4mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:4mm"></div>          
        </div>
            </div>
    </xsl:if>
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">g</div>
        <div style="float:left">
          Has a copy of this Form 3115 been provided to the examining agent identified on line 4f?    
        </div>
        <div style="float:right">      
          <span class="styDotLn" style="padding-right:4mm">      
            .......
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/CopyProvidedToExaminingAgent"/>
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/CopyProvidedToExaminingAgent"/>
            </xsl:call-template>          
          </div>          
        </div>    
      </div>  
      <!-- Line 5a  -->  
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">5a</div>
        <div style="float:left">
          Does the applicant (or any present or former consolidated group in which the applicant was a member during        
        </div>
        <div style="float:right">  
          <div class="styIRS3115YesBox" style="border-bottom:0"></div>  
          <div class="styIRS3115NoBox" style="border-bottom:0"></div>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          the applicable tax year(s)) have any Federal income tax return(s) before Appeals and/or a Federal court?  
        </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:4mm">.
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsApplicantMemBeforeAppeals"/>
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsApplicantMemBeforeAppeals"/>
            </xsl:call-template>          
          </div>        
        </div>    
      </div>    
       <div style="width:187mm">
      <div class="styIRS3115LNLeftLtrBox"></div>
        <div style="float:left">
          If   &#8220;Yes,&#8221; enter the name of the (check the box)<span style="width:5mm"></span>          
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AppealsOfficer"/>
       <xsl:with-param name="BackupName">Appeals Officer</xsl:with-param>
            </xsl:call-template>
          </input> &nbsp;    
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AppealsOfficer" />
              <xsl:with-param name="BackupName">Appeals Officer</xsl:with-param>
            </xsl:call-template>   
            Appeals officer and/or    
          </label>
          <span style="width:5mm"></span>  
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/CounselForTheGovernment"/>
         <xsl:with-param name="BackupName">Counsel For The Government</xsl:with-param>
            </xsl:call-template>
          </input> &nbsp;  
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form3115Data/CounselForTheGovernment" />
             <xsl:with-param name="BackupName">Counsel For The Government</xsl:with-param>
            </xsl:call-template>   
            counsel for the government, <br/>telephone number, and the tax year(s) before Appeals and/or a Federal court. 
          </label>
          <br/>
        </div>  
        <div style="float:right">  
          <div class="styIRS3115YesBox" style="height:8mm;background-color:lightgrey;border-bottom:0;"></div>  
          <div class="styIRS3115NoBox" style="height:8mm;background-color:lightgrey;border-bottom:0;"></div>        
        </div>    
      </div>    
        <xsl:if test="($Print != $Separated) or (count($Form3115Data/GovtCouncilContactInfo) = 1) "> 
      <xsl:for-each select="$Form3115Data/GovtCouncilContactInfo">
      <div style="width: 187mm">
      <div style="float:left">
       <span style="width:10mm; margin-left: 6mm">
        Name
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1 solid black; width:62mm">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="Name"/>
        </xsl:call-template>
      </span>
      <span style="width:30mm; margin-left:2mm">
        Telephone number
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1 solid black; width:23mm; text-align:center">
        <xsl:call-template name="PopulatePhoneNumber">
          <xsl:with-param name="TargetNode" select="PhoneNumber"/>
        </xsl:call-template>
      </span>
      <span style="margin-left:2mm;width:17mm">
        Tax year(s)
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1 solid black; width:12mm; text-align:center">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="TaxYear"/>
        </xsl:call-template>
      </span>
      </div>
      <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:4.5mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:4.5mm"></div>          
        </div>
            </div>
    </xsl:for-each>
</xsl:if>
    <xsl:if test="count($Form3115Data/GovtCouncilContactInfo) &lt;1 or ((count($Form3115Data/GovtCouncilContactInfo) &gt; 1) and ($Print = $Separated))">
      <div style="width: 187mm">
      <div style="float:left">
       <span style="width:10mm; margin-left: 6mm">
        Name
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1 solid black; width:62mm">
        <xsl:call-template name="PopulateAdditionalDataTableMessage">
          <xsl:with-param name="TargetNode" select="$Form3115Data/GovtCouncilContactInfo"/>                      
        </xsl:call-template>
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="Name"/>
        </xsl:call-template>
      </span>
      <span style="width:30mm; margin-left:2mm">
        Telephone number
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1 solid black; width:23mm; text-align:center">
        <xsl:call-template name="PopulatePhoneNumber">
          <xsl:with-param name="TargetNode" select="PhoneNumber"/>
        </xsl:call-template>
      </span>
      <span style="margin-left:2mm;width:17mm">
        Tax year(s)
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1 solid black; width:12mm; text-align:center">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="TaxYear"/>
        </xsl:call-template>
      </span>
      </div>
      <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:4mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:4mm"></div>          
        </div>
            </div>
    </xsl:if>
 
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left">
          Has a copy of this Form 3115 been provided to the Appeals officer and/or counsel for the government identified
        </div>
        <div style="float:right">          
          <div class="styIRS3115YesBox" style="border-bottom:0"></div>  
          <div class="styIRS3115NoBox" style="border-bottom:0"></div>          
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox"></div>
        <div style="float:left">
          on line 5a?
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">...............................
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/CopyProvidedToGovtCounsel"/>
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/CopyProvidedToGovtCounsel"/>
            </xsl:call-template>          
          </div>          
        </div>    
      </div>    
            <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">c</div>
        <div style="float:left">
          Is the method of accounting the applicant is requesting to change an issue under consideration by Appeals<br/>and/or a Federal court (for either the applicant or any present or former consolidated group in which the applicant          
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:8mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:8mm"></div>          
        </div>    
      </div>    
            <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox"></div>
        <div style="float:left">
      was a member for the tax year(s) the applicant was a member) (see instructions)?
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">      
            ...........
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AcctMthdUnderCnsdrByFedCourt"/>
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AcctMthdUnderCnsdrByFedCourt"/>
            </xsl:call-template>          
          </div>          
        </div>    
      </div>    
            <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox"></div>
        <div style="float:left">
          If   &#8220;Yes,&#8221; attach an explanation.
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/AcctMthdUnderCnsdrByFedCourt"/>
          </xsl:call-template>    
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:4.5mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:4.5mm"></div>          
        </div>    
      </div> 
      <!-- Line 6 -->   
            <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.2mm">6</div>
        <div style="float:left">
        
          If the applicant answered &#8220;Yes&#8221; to line 4a and/or 5a with respect to any present or former consolidated group,<br/>attach a statement that provides each parent corporation&#8217;s <b>(a)</b> name, <b>(b)</b> identification number, <b>(c)</b> address, and <b>(d)</b><br/> tax year(s) during which the applicant was a member that is under examination, before an Appeals office, and/or <br/>before a Federal court.
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:17mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:17mm"></div>        
        </div>    
      </div>    
      <!--  line 7 -->
       <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.2mm">7</div>
        <div style="float:left">
        If, for federal income tax purposes, the applicant is either an entity (including a limited liability company) treated as <br/>
a partnership or an S corporation, is it requesting a change from a method of accounting that is an issue under<br/>
consideration in an examination, before Appeals, or before a Federal court, with respect to a Federal income tax<br/> 
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:11.8mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:11.8mm"></div>        
        </div>    
      </div>    
            <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          return of a partner, member, or shareholder of that entity?
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">      
            ...................
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AcctMthdOfPrtshpOrSCorpUndExam"/>
             <xsl:with-param name="BackupName">Form3115DataAcctMthdOfPrtshpOrSCorpUndExam</xsl:with-param>  
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AcctMthdOfPrtshpOrSCorpUndExam"/>
                       <xsl:with-param name="BackupName">Form3115DataAcctMthdOfPrtshpOrSCorpUndExam</xsl:with-param>    
            </xsl:call-template>          
          </div>        
        </div>    
      </div>    
       <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          If   &#8220;Yes,&#8221; the applicant is <b>not</b> eligible to make the change.          
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>        
        </div>    
      </div>    
      <!-- Line 8a  -->
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.2mm">8a</div>
        <div style="float:left">
        Does the applicable revenue procedure (advance consent or automatic consent)
          
        state that the applicant does   <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/ApplcblRevProcNotAudProtection"/>
          </xsl:call-template>   
     
        </div>
        <div style="float:right">
       
       <div style="float:right">
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>        
        </div>          
        </div>    
      </div> 
      <!-- ************************************************************************* -->
             <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
        not receive audit protection for the requested change (see instructions)?
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">      
            ..............
          </span>
         <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ApplcblRevProcNotAudProtection"/>
                        <xsl:with-param name="BackupName">Form3115DataApplcblRevProcNotAudProtection</xsl:with-param>   
            </xsl:call-template>          
          </div>  
           <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ApplcblRevProcNotAudProtection"/>
                                      <xsl:with-param name="BackupName">Form3115DataApplcblRevProcNotAudProtection</xsl:with-param>
            </xsl:call-template>          
          </div>    
        </div>    
      </div>    
      <!-- ************************************************************************* -->
          <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="padding-left:3mm" >b</div>
        <div style="float:left">
          If   &#8220;Yes,&#8221; attach an explanation        
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>        
        </div>    
      </div>  
      <!-- Line 9 -->    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">9a</div>
        <div style="float:left">
          Has the applicant, its predecessor, or a related party requested or made (under either an automatic change
      <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/ChangeInMthdAcctMadeInPast5Yrs"/>
          </xsl:call-template>             
          <br/>procedure or a procedure requiring advance consent) a change in method of accounting within the past 5 years          
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/ChangeInAcctMthdMadeInPast5Yrs"/>
          </xsl:call-template>    
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:8.5mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:8.5mm"></div>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          (including the year of the requested change)?  
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">      
            .......................
          </span>
         
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ChangeInMthdAcctMadeInPast5Yrs"/>
                                     <xsl:with-param name="BackupName">Form3115DataChangeInMthdAcctMadeInPast5Yrs</xsl:with-param> 
          </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ChangeInMthdAcctMadeInPast5Yrs"/>
                                                  <xsl:with-param name="BackupName">Form3115DataChangeInMthdAcctMadeInPast5Yrs</xsl:with-param>  
            </xsl:call-template>          
          </div>        
        </div>    
      </div>
      <!-- Line 9b -->    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left">
          If   &#8220;Yes,&#8221;  for each trade or business, attach a description of each requested change in method of accounting <br/>
(including the tax year of change) and state whether the applicant received consent.       
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:8mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:8mm"></div>  
        </div>    
      </div>  
      <!-- Line 9 c -->  
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">c</div>
        <div style="float:left">
         If any application was withdrawn, not perfected, or denied, or if a Consent Agreement granting a change was not<br/>
signed and returned to the IRS, or the change was not made or not made in the requested year of change, attach<br/>
an explanation.   
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:12mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:12mm"></div>  
        </div>    
      </div> 
      <!-- Line 10a  -->   
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox">10a</div>
        <div style="float:left">
          Does the applicant, its predecessor, or a related party currently have pending any request (including any                  
        </div>
        <div style="float:right">
          <span style="float:left; margin-right:9mm">
            <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/PrvtLtrRlngTechAdviceOrAcctChg"/>
          </xsl:call-template>  
          </span>
          <div class="styIRS3115DimYesBox" style="height:4.5mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:4.5mm"></div>        
        </div>    
      </div>    
       <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox"></div>
        <div style="float:left">
          concurrently filed request) for a private letter ruling, change in method of accounting, or technical advice?  
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">      
            ...
          </span>    
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/PrvtLtrRlngTechAdviceOrAcctChg"/>
      <xsl:with-param name="BackupName">Form3115DataPrvtLtrRlngTechAdviceOrAcctChg</xsl:with-param> 
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/PrvtLtrRlngTechAdviceOrAcctChg"/>
                  <xsl:with-param name="BackupName">Form3115DataPrvtLtrRlngTechAdviceOrAcctChg</xsl:with-param>   
            </xsl:call-template>          
          </div>  
        </div>    
      </div>  
      <!-- Line 10b -->  
     <div style="width:187mm">        
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left">
          If   &#8220;Yes,&#8221; for each request attach a statement providing the name(s) of the taxpayer, identification number(s), the<br/>type of request (private letter ruling, change in  method of accounting, or technical advice), and the specific issue(s)<br/>in the request(s).          
        </div>      
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:12mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:12mm"></div>  
        </div>    
      </div>    
      <!-- Line 11 -->
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftNumBox">11</div>
        <div style="float:left">
          Is the applicant requesting to change its <b>overall</b> method of accounting?
        </div>      
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:4mm">      
            ..............
          </span>
          <div class="styIRS3115YesBox">          
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/RequestingChangeToOverallAcct"/>
                 <xsl:with-param name="BackupName">Form3115DataRequestingChangeToOverallAcct</xsl:with-param>    
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/RequestingChangeToOverallAcct"/>
                              <xsl:with-param name="BackupName">Form3115DataRequestingChangeToOverallAcct</xsl:with-param> 
            </xsl:call-template>
          </div>      
        </div>    
      </div>    
      
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          If   &#8220;Yes,&#8221; check the appropriate boxes below to indicate the applicant&#39;s present and proposed methods of<br/>accounting. Also, complete Schedule A on page 4 of this form.<br/>          
          <div style="width:40mm; font-weight:bold; float:left">Present method:</div>  
          <div style="float:left">
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/PresentMethod/Cash"/>
                <xsl:with-param name="BackupName">PresentMethod/Cash</xsl:with-param>
              </xsl:call-template>
            </input>  
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form3115Data/PresentMethod/Cash" />
                <xsl:with-param name="BackupName">PresentMethod/Cash</xsl:with-param>
              </xsl:call-template>   
              Cash
            </label>
            <span style="width:20mm"></span>  
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/PresentMethod/Accrual"/>
    <xsl:with-param name="BackupName">PresentMethod/Accrual</xsl:with-param>
              </xsl:call-template>
            </input>  
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form3115Data/PresentMethod/Accrual" />
                    <xsl:with-param name="BackupName">PresentMethod/Accrual</xsl:with-param>
         </xsl:call-template>   
              Accrual
            </label>
            <span style="width:20mm"></span>  
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/PresentMethod/Hybrid"/>
               <xsl:with-param name="BackupName">PresentMethod/Hybrid</xsl:with-param> 
              </xsl:call-template>
            </input>  
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form3115Data/PresentMethod/Hybrid" />
                 <xsl:with-param name="BackupName">PresentMethod/Hybrid</xsl:with-param> 
              </xsl:call-template>   
              Hybrid (attach description)              
            </label>            
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/PresentMethod/Hybrid"/>              
            </xsl:call-template>
          </div>
          <div style="width:40mm; font-weight:bold; float:left">Proposed method:</div>
          <div style="float:left">
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/ProposedMethod/Cash"/>
                <xsl:with-param name="BackupName">ProposedMethod/Cash</xsl:with-param>
              </xsl:call-template>
            </input>  
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form3115Data/ProposedMethod/Cash" />
              <xsl:with-param name="BackupName">ProposedMethod/Cash</xsl:with-param>
              </xsl:call-template>   
              Cash
            </label>
            <span style="width:20mm"></span>  
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/ProposedMethod/Accrual"/>
                <xsl:with-param name="BackupName">ProposedMethod/Accrual</xsl:with-param>
              </xsl:call-template>
            </input>  
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form3115Data/ProposedMethod/Accrual" />
              <xsl:with-param name="BackupName">ProposedMethod/Accrual</xsl:with-param>  
              </xsl:call-template>   
              Accrual
            </label>
            <span style="width:20mm"></span>  
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/ProposedMethod/Hybrid"/>
                 <xsl:with-param name="BackupName">ProposedMethod/Hybrid</xsl:with-param> 
              </xsl:call-template>
            </input>  
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form3115Data/ProposedMethod/Hybrid" />
               <xsl:with-param name="BackupName">ProposedMethod/Hybrid</xsl:with-param>   
              </xsl:call-template>   
              Hybrid (attach description)
            </label>    
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ProposedMethod/Hybrid"/>              
            </xsl:call-template>
          </div>        
        </div>  
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:17mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:17mm"></div>      
        </div>    
      </div>          
      <xsl:call-template name="IRS3115Footer">
        <xsl:with-param name="thisPage" select="3"/>
      </xsl:call-template>
      
      <div class="styBB" style="width:187mm; border-top:2 solid black">
        <div class="styPartName" style="width:12mm; height:4.2mm; font-size:9.5pt">Part II</div>
        <div class="styPartDesc" style="width:150mm; font-size:9.5pt">
          Information For All Requests <span style="font-weight:normal">(continued)</span>
        </div>          
        <div style="float:right">  
          <div class="styIRS3115YesBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>Yes</b></div>  
          <div class="styIRS3115NoBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>No</b></div>
        </div>    
      </div>  
            <!-- Line 12  -->  
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox">12</div>
        <div style="float:left">
         If the applicant is either (i) not changing its overall method of accounting, or (ii) is changing its overall method of<br/>
accounting and also changing to a special method of accounting for one or more items, attach a detailed and<br/>
complete description for each of the following:
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:12mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:12mm"></div>  
        </div>    
      </div>          
       <!-- Line 12a  --> 
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">a</div>
        <div style="float:left">
          The item(s) being changed.      
        </div>    
        <div style="float:right">      
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>  
        </div>    
      </div>          
     <!-- Line 12 b  -->   
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left">
          The applicant&#39;s present method for the item(s) being changed.
        </div>        
        <div style="float:right">      
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>  
        </div>    
      </div>          
      <!-- Line 12 c -->  
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">c</div>
        <div style="float:left">
          The applicant&#39;s proposed method for the item(s) being changed.
        </div>              
        <div style="float:right">    
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>  
        </div>    
      </div>    
      <!-- Line 12 d -->
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">d</div>
        <div style="float:left">
          The applicant&#39;s present overall method of accounting (cash, accrual, or hybrid).
        </div>                
        <div style="float:right">        
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>  
        </div>    
      </div>  
       
      <!-- Line 13  -->      
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm">13</div>
        <div style="float:left; padding-top:1mm">
          Attach a detailed and complete description of the applicant&#39;s trade(s) or business(es), and the principal<br/>business activity code for each. If the applicant has more than one trade or business as defined in<br/>Regulations section 1.446-1(d), describe: whether each trade or business is accounted for separately; the<br/>goods and services provided by each trade or business and any other types of activities engaged in that<br/>generate gross income; the overall method of accounting for each trade or business; and which trade or<br/>business is requesting to change its accounting method as part of this application or a separate application.
        </div>              
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:25mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:25mm"></div>  
        </div>  
      </div>  
    <!--  Line 14 -->  
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox">14</div>
        <div style="float:left">
          Will the proposed method of accounting be used for the applicant&#39;s books and records and financial statements?
        </div>            
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>  
        </div>  
      </div>  
      
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          For insurance companies, see the instructions
        </div>    
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:4mm">      
            .......................
          </span>
          <div class="styIRS3115YesBox">        
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsProposedMethodUsedForBooks"/>
 <xsl:with-param name="BackupName">Form3115DataIsProposedMethodUsedForBooks</xsl:with-param> 
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox">    
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsProposedMethodUsedForBooks"/>
              <xsl:with-param name="BackupName">Form3115DataIsProposedMethodUsedForBooks</xsl:with-param> 
            </xsl:call-template>
          </div>  
        </div>  
      </div>  
      
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
           If  &#8220;No,&#8221; attach an explanation.   
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IsProposedMethodUsedForBooks"/>              
          </xsl:call-template>    
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:4.5mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:4.5mm"></div>  
        </div>  
      </div>  
      
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox">15a</div>
        <div style="float:left">
          Has the applicant engaged, or will it engage, in a transaction to which section 381(a) applies (e.g., a reorganization,<br/>merger, or liquidation) during the proposed tax year of change determined without regard to any potential closing
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:8mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:8mm"></div>  
        </div>  
      </div>  
      
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          of the year under section 381(b)(1)?
        </div>
        <div style="float:right">  
          <span style="float:left">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ApplcntEngageInReorganization"/>              
            </xsl:call-template>      
          </span>
          <span class="styDotLn" style="padding-right:4mm">                
            ..........................
          </span>
          <div class="styIRS3115YesBox" style="height:4.5mm">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ApplcntEngageInReorganization"/>
             <xsl:with-param name="BackupName">Form3115DataApplcntEngageInReorganization</xsl:with-param>  
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox" style="height:4.5mm">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ApplcntEngageInReorganization"/>
                          <xsl:with-param name="BackupName">Form3115DataApplcntEngageInReorganization</xsl:with-param>  
            </xsl:call-template>
          </div>          
        </div>  
      </div>  
      
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left">
          If   &#8220;Yes,&#8221; for the items of income and expense that are the subject of this application, attach a statement identifying<br/>the methods of accounting used by the parties to the section 381(a) transaction immediately before the date of<br/>distribution or transfer and the method(s) that would be required by section 381(c)(4) or (c)(5) absent consent to<br/>the change(s) requested in this application.
        </div>    
        <div style="float:right">      
          <div class="styIRS3115DimYesBox" style="height:16mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:16mm"></div>  
        </div>  
      </div>  
    <!-- Line 16 -->  
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftNumBox">16</div>
        <div style="float:left">
          Does the applicant request a conference with the IRS National Office if the IRS proposes an adverse response?              
        </div>  
        <div style="float:right">  
            <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ConferenceOfRightRequested"/>
                         <xsl:with-param name="BackupName">Form3115DataConferenceOfRightRequested</xsl:with-param>   
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ConferenceOfRightRequested"/>
                                       <xsl:with-param name="BackupName">Form3115DataConferenceOfRightRequested</xsl:with-param>
            </xsl:call-template>   
        </div>  
      </div>  
      </div> 
      <!-- Line 17 -->      
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftNumBox">17</div>
        <div style="float:left">
        If the applicant is changing to either the overall cash method, an overall accrual method, or is changing its method <br/>of accounting for any property subject to section 263A, any long-term contract subject to section 460, or inventories <br/>subject to section 474, enter the applicant&#39;s gross receipts for the 3 tax years preceding the tax year of change.    
        </div>        
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:12mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:12mm">
            <!--div style="float:right; padding-top:4mm">                      
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts3YrsPreceding" />
                <xsl:with-param name="containerHeight" select="1" />
                <xsl:with-param name="containerID" select="'line17TPctn'" />
              </xsl:call-template>               
            </div-->    
          </div>  
        </div>  
      </div>  
      
      <xsl:variable name="line17Count" select="count($Form3115Data/GrossReceipts3YrsPreceding)" />    
      <div style="width:187mm; border-bottom:1 solid black">                
        <div class="styIRS3115TableContainer" id="line17TPctn">  
          <!--xsl:attribute name="style">  
            <xsl:if test="$line17Count &gt; 1">
              height:11.6mm
            </xsl:if>
          </xsl:attribute-->                     
          <xsl:call-template name="SetInitialState"/>                      
          <table class="styTable" style="font-size:7pt;font-weight:normal; width:100%; border-bottom:0" cellspacing="0" cellpadding="0" border="0">  
            <thead class="styTableThead">
              <tr align="left" style="height:8mm">
                <th nowrap="nowrap" scope="col" align="left" valign="bottom" style="width:30.6mm; border-bottom:1 solid black;font-weight:normal;">
                  1st preceding<br/>year ended: mo.                   
                </th>  
                <th class="styIRS3115TblRB" scope="col" align="left" valign="bottom" style="width:25mm;font-weight:normal;">
                  yr.                  
                </th>
                <th nowrap="nowrap" scope="col" valign="bottom" style="width:30.6mm; border-bottom:1 solid black;font-weight:normal;">
                  <div style="padding-left:1mm">
                    2nd preceding<br/>year ended: mo.   
                  </div>                        
                </th>  
                <th class="styIRS3115TblRB" scope="col" align="left" valign="bottom" style="width:25mm;font-weight:normal;">  
                  yr.                    
                </th>  
                <th nowrap="nowrap" scope="col" valign="bottom" style="width:30.6mm; border-bottom:1 solid black;font-weight:normal;">
                  <div style="padding-left:1mm">
                    3rd preceding<br/>year ended: mo.   
                  </div>                    
                </th>    
                <th class="styIRS3115TblRB" align="left" scope="col" valign="bottom" style="width:25mm;font-weight:normal;">
                  yr.                  
                </th>  
                <th class="styIRS3115TblRB" style="width:6.3mm; border-bottom:0; background-color:lightgrey">&nbsp;</th>                
                <th style="border-bottom:0; background-color:lightgrey">&nbsp;</th>
              </tr>  
            </thead>  
            <tfoot></tfoot>
            <tbody>    
              <xsl:if test="($Print != $Separated and $Form3115Data/GrossReceipts3YrsPreceding) or (count($Form3115Data/GrossReceipts3YrsPreceding) = 1)">
              <xsl:call-template name="line17Template">
                <xsl:with-param name="max">
                  <xsl:choose>
                       <xsl:when test="$line17Count &gt; 1">     
                      <xsl:value-of select="$line17Count" />
                       </xsl:when>
                       <xsl:otherwise>
                          <xsl:value-of select="1" />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:with-param>
              </xsl:call-template>  
              </xsl:if>
              <xsl:if test="not($Form3115Data/GrossReceipts3YrsPreceding)" >
                <xsl:call-template name="line17Template">
                <xsl:with-param name="max" select="1"></xsl:with-param>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="($Print = $Separated) and (count($Form3115Data/GrossReceipts3YrsPreceding) &gt;1)" >
                <xsl:call-template name="line17Template">
                <xsl:with-param name="max" select="1"></xsl:with-param>
                 <xsl:with-param name="IsSeparated" select=" 'yes' "></xsl:with-param>
                </xsl:call-template>
              </xsl:if>

             </tbody>    
          </table>                          
        </div>            
      </div>                
      <!-- END Part II Line Items -->
      
      <div class="styBB" style="width:187mm; border-top:0 solid black">
        <div class="styPartName" style="width:13mm; height:4.2mm; font-size:9.5pt">Part III</div>
        <div class="styPartDesc" style="width:150mm; font-size:9.5pt">
          Information For Advance Consent Request
        </div>
        <div style="float:right">
          <div class="styIRS3115YesBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>Yes</b></div>  
          <div class="styIRS3115NoBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>No</b></div>
        </div>
      </div>
      
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm">18</div>
        <div style="float:left; padding-top:1mm">
          Is the applicant&#39;s requested change described in any revenue procedure, revenue ruling, notice, regulation, or
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:5mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:5mm"></div>  
        </div>
      </div>
      
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          other published guidance as an automatic change request?
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">      
            ..................            
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsChangeRequestAllwUnderAuto"/>
                                     <xsl:with-param name="BackupName">Form3115DataIsChangeRequestAllwUnderAuto</xsl:with-param>  
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsChangeRequestAllwUnderAuto"/>
                                                  <xsl:with-param name="BackupName">Form3115DataIsChangeRequestAllwUnderAuto</xsl:with-param>  
            </xsl:call-template>          
          </div>  
        </div>
      </div>
      
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          If   &#8220;Yes,&#8221; attach an explanation describing why the applicant is submitting its request under advance consent<br/>request procedures.
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IsChangeRequestAllwUnderAuto"/>              
          </xsl:call-template>  
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:8.5mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:8.5mm"></div>  
        </div>
      </div>
     <!-- Line 19 --> 
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox">19</div>
        <div style="float:left">
       Attach a full explanation of the legal basis supporting the proposed method for the item being changed. Include a <br/>detailed and complete description of the facts that explains how the law specifically applies to the applicant&#39;s <br/>situation and that demonstrates that the applicant is authorized to use the proposed method. Include all authority <br/>(statutes, regulations, published rulings, court cases, etc.) supporting the proposed method. Also, include either <br/>a discussion of the contrary authorities or a statement that no contrary authority exists.
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:20mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:20mm"></div>  
        </div>
      </div>
      <!--  Line 20  -->
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox">20</div>
        <div style="float:left">
          Attach a copy of all documents related to the proposed change (see instructions).
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>  
        </div>
      </div>
     <!-- Line 21 --> 
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox">21</div>
        <div style="float:left">
          Attach a statement of the applicant&#39;s reasons for the proposed change.
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>  
        </div>
      </div>
    <!-- Line 22  -->  
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox">22</div>
        <div style="float:left">
          If the applicant is a member of a consolidated group for the year of change, do all other members of the
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>  
        </div>
      </div>
      
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          consolidated group use the proposed method of accounting for the item being changed?
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">      
            .......
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AllGroupMembersUseProposedMthd"/>
          <xsl:with-param name="BackupName">Form3115DataAllGroupMembersUseProposedMthd</xsl:with-param>  
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AllGroupMembersUseProposedMthd"/>
                       <xsl:with-param name="BackupName">Form3115DataAllGroupMembersUseProposedMthd</xsl:with-param> 
            </xsl:call-template>
          </div>  
        </div>
      </div>
      
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
       If  &#8220;No,&#8221; attach an explanation.
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/AllGroupMembersUseProposedMthd"/>              
          </xsl:call-template>  
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:4.5mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:4.5mm"></div>        
        </div>
      </div>
      <!-- Line 23a  -->
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox">23a</div>
        <div style="float:left">
          Enter the amount of <b>user fee</b> attached to this application (see instructions).
          <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/> &nbsp; &nbsp;
          $
          <span style="width:45mm; border-bottom:1 solid black; text-align:center">
            <span style="width:1px;"></span>    
          </span>
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:4.5mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:4.5mm"></div>  
        </div>
      </div>
    <!-- Line 23b  -->  
      <div style="width:187mm; ">  
        <div class="styIRS3115LNLeftLtrBox" style="padding-right:0.5mm">b</div>
        <div style="float:left">
         If the applicant qualifies for a reduced user fee, attach the required information or certification (see instructions).
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/QlfyReducedUserFeeRqrInfoAtt"/>              
          </xsl:call-template><br/>
          <xsl:call-template name="LinkToLeftoverBooleanDataTableInline">
            <xsl:with-param name="Desc">Does the Applicant Qualifies for a Reduced User Fee  </xsl:with-param>
            <xsl:with-param name="TargetNode" select="$Form3115Data/QlfyReducedUserFeeRqrInfoAtt"/>
          </xsl:call-template>        
        </div>        
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:8.5mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:8.5mm"></div>  
        </div>
      </div>        
      
      <div class="styBB" style="width:187mm; border-top:1 solid black">
        <div class="styPartName" style="width:13mm; height:4.2mm; font-size:9.5pt">Part IV</div>
        <div class="styPartDesc" style="width:150mm; font-size:9.5pt">
          Section 481(a) Adjustment
        </div>
        <div style="float:right">
          <div class="styIRS3115YesBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>Yes</b></div>  
          <div class="styIRS3115NoBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>No</b></div>
        </div>
      </div>
      <!-- Line 24  -->
      <div style="width:187mm;">  
        <div class="styIRS3115LNLeftNumBox" style="padding-top:0.5mm">24</div>
        <div style="float:left; padding-top:0.5mm">
          Does the applicable revenue procedure, revenue ruling, notice, regulation, or other published guidance require the <br/>applicant to implement the requested change in method of accounting on a cut-off basis rather than a section 
         </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:9mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:9mm"></div>  
        </div>
          </div> 
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
      481(a) adjustment?
        </div>
        <div style="float:right">
         <div class="styIRS3115YesBox">
             <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/DoesChangeRequireUseCutOffMthd"/>
                      <xsl:with-param name="BackupName">Form3115DataDoesChangeRequireUseCutOffMthd</xsl:with-param>  
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox">
         <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/DoesChangeRequireUseCutOffMthd"/>
                                   <xsl:with-param name="BackupName">Form3115DataDoesChangeRequireUseCutOffMthd</xsl:with-param>  
            </xsl:call-template>
          </div>  
        </div>
      </div>
          
  <!-- Line 25 -->    
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox">25</div>
        <div style="float:left">
          Enter the section 481(a) adjustment. Indicate whether the adjustment is an increase (+) or a decrease (-) in<br/>income.
          <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/> &nbsp; &nbsp;
          $
          <span style="width:40mm; border-bottom:1 solid black; text-align:center">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/NetSection481aAdjustment/@increaseOrDecreaseIndicator" />
            </xsl:call-template>  
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3115Data/NetSection481aAdjustment" />
            </xsl:call-template>    
          </span>
          &nbsp; &nbsp; Attach a summary of the computation and an explanation of the
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/NetSection481aAdjustment"/>              
          </xsl:call-template>    
          <br/>methodology used to determine the section 481(a) adjustment. If it is based on more than one component, show<br/>the computation for each component. If more than one applicant is applying for the method change on the same<br/>application, attach a list of the name, identification number, principal business activity code (see instructions),<br/>and the amount of the section 481(a) adjustment attributable to each applicant.          
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:24.5mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:24.5mm"></div>  
        </div>
      </div>
               <xsl:call-template name="IRS3115Footer">
        <xsl:with-param name="thisPage" select="4"/>
      </xsl:call-template>
      <div class="styBB" style="width:187mm; border-top:1 solid black">
        <div class="styPartName" style="width:13mm; height:4.2mm; font-size:9.5pt">Part IV</div>
        <div class="styPartDesc" style="width:150mm; font-size:9.5pt">
          Section 481(a) Adjustment
        </div>
        <div style="float:right">
          <div class="styIRS3115YesBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>Yes</b></div>  
          <div class="styIRS3115NoBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>No</b></div>
        </div>
      </div>
       <!-- Line 26  --> 
      <div style="width:187mm">        
        <div class="styIRS3115LNLeftNumBox">26</div>
        <div style="float:left">
          If the section 481(a) adjustment is an increase to income of less than $25,000, does the applicant elect to take          
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>  
        </div>
      </div>
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          the entire amount of the adjustment into account in the year of change?
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">      
            .............
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/TakingEntire481aAdjIntoAccount"/>
              <xsl:with-param name="BackupName">Form3115DataTakingEntire481aAdjIntoAccount</xsl:with-param>   
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/TakingEntire481aAdjIntoAccount"/>
              <xsl:with-param name="BackupName">Form3115DataTakingEntire481aAdjIntoAccount</xsl:with-param>  
            </xsl:call-template>
          </div>  
        </div>  
      </div>  
     <!-- Line 27  -->   
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox">27</div>
        <div style="float:left">
          Is any part of the section 481(a) adjustment attributable to transactions between members of an affiliated        
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox"></div>  
          <div class="styIRS3115DimNoBox"></div>  
        </div>  
      </div>  
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          group, a consolidated group, a controlled group, or other related parties?
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">      
            .............
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/PartOfAdjFromTransBtwnMembers"/>
              <xsl:with-param name="BackupName">Form3115DataPartOfAdjFromTransBtwnMembers</xsl:with-param>   
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/PartOfAdjFromTransBtwnMembers"/>
              <xsl:with-param name="BackupName">Form3115DataPartOfAdjFromTransBtwnMembers</xsl:with-param> 
            </xsl:call-template>
          </div>    
        </div>      
      </div>    
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          If   &#8220;Yes,&#8221; attach an explanation.  
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/PartOfAdjFromTransBtwnMembers"/>              
          </xsl:call-template>  
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:4.5mm"></div>  
          <div class="styIRS3115DimNoBox" style="height:4.5mm"></div>  
        </div>            
      </div>  
      <div class="styBB" style="border-top:1 solid black; width:187mm; font-size:9.5pt">        
        <b>Schedule A-Change in Overall Method of Accounting</b> (If Schedule A applies, Part I below must be completed.)
      </div>          
      <div class="styBB" style="width:187mm">
        <div class="styPartName" style="width:11mm; font-size:9.5pt">Part I</div>
        <div class="styPartDesc" style="font-size:9.5pt">
          Change in Overall Method <span style="font-weight:normal">(see instructions)</span>
        </div>        
      </div>
       <!--  SCh A Line 1 -->  
      <div style="width:187mm; margin-top:1mm">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">1</div>
        <div style="float:left">
          Enter the following amounts as of the close of the tax year preceding the year of change. If none, state "None." Also,<br/>attach a statement providing a breakdown of the amounts entered on lines 1a through 1g.
        </div>            
      </div>    
      <div style="width:187mm">        
        <div class="styIRS3115SchAP1" style="float:right; text-align:center; border-top:1 solid black; font-weight:bold; font-size:7pt">
          Amount
        </div>          
      </div>    
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftLtrBox">a</div>
        <div style="float:left">
         Income accrued but not received (such as accounts receivable) 
        </div>  
        <div style="float:right">            
          <span class="styDotLn" style="padding-right:1mm">      
            .............
          </span>  
          <div class="styIRS3115SchAP1">
            <div style="text-align:left; float:left; padding-left:1mm">$</div>
            <xsl:choose>
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/IncomeAccruedButNotReceived">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/IncomeAccruedButNotReceived"/>              
                </xsl:call-template>  
              </xsl:when>   
              <xsl:otherwise>       
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/IncmAccruedButNotReceivedNONE"/>              
                </xsl:call-template>  
              </xsl:otherwise> 
            </xsl:choose>                  
          </div>              
        </div>    
      </div>    
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left">
        Income received or reported before it was earned (such as advanced payments). Attach
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/IncomeRcvdOrRptBeforeEarned"/>              
          </xsl:call-template>  
        </div>                  
        <div class="styIRS3115SchAP1" style="float:right; border-bottom:0"></div>      
      </div>    
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftLtrBox"></div>
        <div style="float:left">
          a description of the income and the legal basis for the proposed method
        </div>    
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:1mm">      
            ..........
          </span>  
          <div class="styIRS3115SchAP1">
            <xsl:choose>
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/IncomeRcvdOrRptBeforeEarned">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/IncomeRcvdOrRptBeforeEarned"/>              
                </xsl:call-template>    
              </xsl:when>     
              <xsl:otherwise> 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/IncmRcvdOrRptBeforeEarnedNONE"/>              
                </xsl:call-template>    
              </xsl:otherwise>   
            </xsl:choose>  
          </div>        
        </div>    
      </div>    
      
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox">c</div>
        <div style="float:left">
          Expenses accrued but not paid (such as accounts payable)
        </div>      
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:1mm">      
            ..............
          </span>
          <div class="styIRS3115SchAP1">
            <xsl:choose>
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/ExpensesAccruedButNotPaid">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/ExpensesAccruedButNotPaid"/>              
                </xsl:call-template>  
              </xsl:when>   
              <xsl:otherwise>       
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/ExpensesAccruedButNotPaidNONE"/>              
                </xsl:call-template>  
              </xsl:otherwise> 
            </xsl:choose>    
          </div>    
        </div>    
      </div>    
      
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox">d</div>
        <div style="float:left">
          Prepaid expenses previously deducted
        </div>    
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:1mm">      
            ......................
          </span>
          <div class="styIRS3115SchAP1">
            <xsl:choose>
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/PrepaidExpensePrevDeducted">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/PrepaidExpensePrevDeducted"/>              
                </xsl:call-template>  
              </xsl:when>   
              <xsl:otherwise>       
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/PrepaidExpnsPrevDeductedNONE"/>              
                </xsl:call-template>  
              </xsl:otherwise> 
            </xsl:choose>    
          </div>    
        </div>    
      </div>        
      
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox">e</div>
        <div style="float:left">
          Supplies on hand previously deducted and/or not previously reported
        </div>        
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:1mm">      
            ............
          </span>          
          <div class="styIRS3115SchAP1">
            <xsl:choose>
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/SuppliesOnHandPrevDeducted">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/SuppliesOnHandPrevDeducted"/>              
                </xsl:call-template>  
              </xsl:when>   
              <xsl:otherwise>       
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/SuppliesOnHandPrevDeductedNONE"/>              
                </xsl:call-template>  
              </xsl:otherwise> 
            </xsl:choose>    
          </div>    
        </div>    
      </div>    
      
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox">f</div>
        <div style="float:left">
          Inventory on hand previously deducted and/or not previously reported. Complete Schedule D, Part II
        </div>          
        <div style="float:right">    
          <span class="styDotLn" style="padding-right:1mm">      
            .
          </span>
          <div class="styIRS3115SchAP1">
            <xsl:choose>
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/InventoryOnHandPrevDeducted">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/InventoryOnHandPrevDeducted"/>              
                </xsl:call-template>  
              </xsl:when>   
              <xsl:otherwise>       
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/InvntryOnHandPrevDeductedNONE"/>              
                </xsl:call-template>  
              </xsl:otherwise> 
            </xsl:choose>    
          </div>      
        </div>    
      </div>    
    <!-- *******************************************************************  -->
    <!-- ****************************************************************** -->  
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox">g</div>
        <div style="float:left">
        Other amounts (specify). Attach a description of the item and the legal basis for its inclusion in the<br/>
calculation of the section 481(a) adjustment.&nbsp;
          <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/> &nbsp;
          <span style="border-bottom:1 solid black; width:70mm"> 
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/OtherAmount"/>              
            </xsl:call-template>  
          </span>
        </div>  
          <div class="styIRS3115SchAP1" style="float:right; border-bottom:0"></div>         
        <div style="float:right">    
          <div class="styIRS3115SchAP1">
            <xsl:choose>
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/OtherAmount">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/OtherAmount"/>              
                </xsl:call-template>  
              </xsl:when>   
              <xsl:otherwise>       
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/OtherAmountNONE"/>              
                </xsl:call-template>  
              </xsl:otherwise> 
            </xsl:choose>  
          </div>  
        </div>    
      </div>    
     <!--  ******************************************************************** --> 
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox">h</div>
        <div style="float:left">
          <b>Net section 481(a) adjustment</b> (Combine lines 1a–1g.) Indicate whether the adjustment is  an 
        </div>            
        <div style="float:right">    
        
          <div class="styIRS3115SchAP1" style="border-bottom:0  solid black">
            <div style="text-align:left; float:left; padding-left:1mm"></div>
     
          </div>      
        </div>    
      </div>    
     <!--  *********************************************************************  --> 
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox"></div>
        <div style="float:left">
        increase (+) or decrease (-) in income. Also enter the net amount of this section 481(a) adjustment
        </div>            
        <div style="float:right">    
                <div class="styIRS3115SchAP1" style="border-bottom:0 solid black">
            <div style="text-align:left; float:left; padding-left:1mm"></div>
   
          </div>      
        </div>    
      </div>    
     <!--  ********************************************************************** -->
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox"></div>
        <div style="float:left">
         amount on Part IV, line 25.
        </div>            
        <div style="float:right">    
          <span class="styDotLn" style="padding-right:1mm">      
            ........................
          </span>
          <div class="styIRS3115SchAP1" style="border-bottom:1 solid black">
            <div style="text-align:left; float:left; padding-left:1mm">$</div>
            <xsl:choose>
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/NetSection481aAdjustment">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/NetSection481aAdjustment"/>              
                </xsl:call-template>  
              </xsl:when>   
              <xsl:otherwise>       
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/NetSection481aAdjustmentNONE"/>              
                </xsl:call-template>  
              </xsl:otherwise> 
            </xsl:choose>  
          </div>      
        </div>    
      </div>    
     <!-- ********************************************************************** -->
      <div style="width:187mm; margin-top:2mm">            
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">2</div>
        <div style="float:left">
          Is the applicant also requesting the recurring item exception under section 461(h)(3)?          
        </div>    
        <div class="styIRS3115YNChxBoxDiv">    
          <span class="styDotLn" style="padding-right:0">      
            .......
          </span>     
      <span>
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/RequestingRecurItemException" />
              </xsl:call-template>     
            <input type="Checkbox"  style="height:4mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/RequestingRecurItemException"/>
              <xsl:with-param name="BackupName">Yes Requesting Recur Item Exception</xsl:with-param>  
              </xsl:call-template>
            </input></span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/RequestingRecurItemException" />
    <xsl:with-param name="BackupName">Yes Requesting Recur Item Exception</xsl:with-param> 
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:5mm"></span>
      <span>
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/RequestingRecurItemException" />
              </xsl:call-template>     
            <input type="Checkbox" style="height:4mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/RequestingRecurItemException"/>
               <xsl:with-param name="BackupName">No Requesting Recur Item Exception</xsl:with-param> 
              </xsl:call-template>
            </input>
            </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/RequestingRecurItemException" />
             <xsl:with-param name="BackupName">No Requesting Recur Item Exception</xsl:with-param> 
              </xsl:call-template> 
              <b>No</b>
            </label>  
           </div>              
      </div>    
      <div style="width:187mm; padding-bottom:1mm; border-bottom:1 solid black">  
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">3</div>
        <div style="float:left">
       Attach copies of the profit and loss statement (Schedule F (Form 1040) for farmers) and the balance sheet, if applicable, as of the close of the tax year preceding the year of change. Also attach a statement specifying the accounting method used when preparing the balance sheet. If books of account are not kept, attach a copy of the business schedules submitted with the Federal income tax return or other return (e.g., tax-exempt organization returns) for that period. If the amounts in Part I, lines 1a through 1g, do not agree with those shown on both the profit and loss statement and the balance sheet, attach a statement explaining the differences.
        </div>          
      </div>    
      <div class="styBB" style="width:187mm; ">
        <div class="styPartName" style="width:12mm; font-size:9.5pt">Part II</div>
        <div class="styPartDesc" style="font-size:9.5pt">
          Change to the Cash Method For Advance Consent Request <span style="font-weight:normal">(see instructions)</span>
        </div>        
      </div>  
      <div style="width:187mm; border-bottom:1 solid black; padding-bottom:0.5mm">
        <div style="padding-top:1mm">
          Applicants requesting a change to the cash method must attach the following information:  
        </div>      
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">1</div>
        <div style="float:left">
          A description of inventory items (items whose production, purchase, or sale is an income-producing factor) and materials<br/>and supplies used in carrying out the business.      
        </div>  
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">2</div>
        <div style="float:left">
          An explanation as to whether the applicant is required to use the accrual method under any section of the Code or regulations.  
        </div>            
      </div>
       <!-- Page Break and Footer-->
		  <div class="pageEnd" style="width:187mm;padding-top:1mm;"/>
	
		  <!-- END Page Break and Footer-->
      <div class="styBB" style="width:187mm; font-size:9.5pt">        
        <b>Schedule B&#8211;Change to the Deferral Method for Advance Payments</b> (see instructions)
      </div>      
      
      <div style="width:187mm; padding-bottom:3mm; padding-top:1mm">                
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">1</div>
        <div style="float:left">
         If the applicant is requesting to change to the Deferral Method for advance payments described in section 5.02 of Rev. Proc.
2004-34, 2004-1 C.B. 991, attach the following information: 
        </div>          
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">a</div>
        <div style="float:left; padding-top:1mm">
         A statement explaining how the advance payments meet the definition in section 4.01 of Rev. Proc. 2004-34. 
        </div>            
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">b</div>
        <div style="float:left; padding-top:1mm">
          If the applicant is filing under the automatic change procedures of Rev. Proc. 2008-52, the information required by section 8.02(3)(a)-(c) of Rev. Proc. 2004-34.
        </div>    
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">c</div>
        <div style="float:left; padding-top:1mm">
         If the applicant is filing under the advance consent provisions of Rev. Proc. 97-27, the information required by section 8.03(2)(a)-(f) of Rev. Proc. 2004-34.
        </div>  
        <br/>
       <div class="styIRS3115LNLeftNumBox" style="text-align:center; padding-top:1mm">2</div>
        <div style="float:left; padding-top:1mm">
          If the applicant is requesting to change to the deferral method for advance payments described in  Regulations section 1.451-5, attach the following. 
        </div>  
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">a</div>
        <div style="float:left; padding-top:1mm">
         A statement explaining how the advance payments meet the definition in Regulations section 1.451-5(a)(1). 
        </div>    
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">b</div>
        <div style="float:left; padding-top:1mm">
        A statement explaining what portions of the advance payments, if any, are attributable to services, whether such services are integral to the provisions of goods or items, and whether any portions of the advance payments that are attributable to non-integral services are less than five percent of the total contract prices. See Regulations sections 1.451-5(a)(2)(i) and (3).
        </div>    
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">c</div>
        <div style="float:left; padding-top:1mm">
         A statement explaining that the advance payments will be included in income no later than when included in gross receipts for
purposes of the applicant&#39;s financial reports. See Regulations section 1.451-5(b)(1)(ii).
        </div>    
        
          <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">d</div>
        <div style="float:left; padding-top:1mm">
        A statement explaining whether the inventoriable goods exception of Regulations section 1.451-5(c) applies and if so, when substantial advance payments will be received under the contracts, and how the exception will limit the deferral of income.
        </div>    
      </div> 
      <xsl:call-template name="IRS3115Footer">
        <xsl:with-param name="thisPage" select="5"/>
      </xsl:call-template>
      
      <div class="styBB" style="border-top:2 solid black; width:187mm; font-size:9.5pt">        
        <b>Schedule C-Changes Within the LIFO Inventory Method</b> (see instructions)
      </div>          
      
      <div class="styBB" style="width:187mm">
        <div class="styPartName" style="width:11mm; font-size:9.5pt">Part I</div>
        <div class="styPartDesc" style="font-size:9.5pt">
          General LIFO Information
        </div>        
      </div>    
      
      <div class="styBB" style="width:187mm; padding-top:0.5mm; padding-bottom:0.5mm">
        Complete this section if the requested change involves changes within the LIFO inventory method. Also, attach a copy of all<br/><b>Forms 970,</b> Application To Use LIFO Inventory Method, filed to adopt or expand the use of the LIFO method.      
      </div>          
      
      <div style="width:187mm; padding-top:1mm; border-bottom:1 solid black">                
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">1</div>
        <div style="float:left">
          Attach a description of the applicant&#39;s present and proposed LIFO methods and submethods for each of the following<br/>items:  
        </div>          
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">a</div>
        <div style="float:left; padding-top:1mm">
          Valuing inventory (e.g., unit method or dollar-value method).
        </div>            
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">b</div>
        <div style="float:left; padding-top:1mm">
          Pooling (e.g., by line or type or class of goods, natural business unit, multiple pools, raw material content, simplified dollar-value method, inventory price index computation (IPIC) pools, vehicle-pool method, etc.).
        </div>    
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">c</div>
        <div style="float:left; padding-top:1mm">
          Pricing dollar-value pools (e.g., double-extension, index, link-chain, link-chain index, IPIC method, etc.).
        </div>  
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">d</div>
        <div style="float:left; padding-top:1mm">
        Determining the current-year cost of goods in the ending inventory (i.e., most recent acquisitions, earliest acquisitions during the current year, average cost of current-year acquisitions, or other permitted method).
        </div>        
        <br/>
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm; text-align:center">2</div>
        <div style="float:left; padding-top:1mm">
          If any present method or submethod used by the applicant is not the same as indicated on Form(s) 970 filed to adopt or<br/>expand the use of the method, attach an explanation.  
        </div>
        <br/>
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm; text-align:center">3</div>
        <div style="float:left; padding-top:1mm">
       If the proposed change is not requested for all the LIFO inventory, attach a statement specifying the inventory to which the change is and is not applicable.
        </div>
        <br/>
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm; text-align:center">4</div>
        <div style="float:left; padding-top:1mm">
      If the proposed change is not requested for all of the LIFO pools, attach a statement specifying the LIFO pool(s) to which the change is applicable.
        </div>
        <br/>
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm; text-align:center">5</div>
        <div style="float:left; padding-top:1mm">
         Attach a statement addressing whether the applicant values any of its LIFO inventory on a method other than cost. For example, if the applicant values some of its LIFO inventory at retail and the remainder at cost, identify which inventory items are valued under each method.
        </div>        
        <br/>
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm; text-align:center">6</div>
        <div style="float:left; padding-top:1mm">
        If changing to the IPIC method, attach a completed Form 970.
        </div>
      </div>    
      
      <div class="styBB" style="width:187mm; ">
        <div class="styPartName" style="width:12mm; font-size:9.5pt">Part II</div>
        <div class="styPartDesc" style="font-size:9.5pt">
          Change in Pooling Inventories
        </div>        
      </div>          
      
      <div style="width:187mm; padding-bottom:1mm; padding-top:1mm">                
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">1</div>
        <div style="float:left">
          If the applicant is proposing to change its pooling method or the number of pools, attach a description of the contents of,<br/>and state the base year for, each dollar-value pool the applicant presently uses and proposes to use.
        </div>      
        <br/>
        <div class="styIRS3115LNLeftNumBox" style="text-align:center; padding-top:1mm">2</div>
        <div style="float:left; padding-top:1mm">
          If the applicant is proposing to use natural business unit (NBU) pools or requesting to change the number of NBU pools,<br/>attach the following information (to the extent not already provided) in sufficient detail to show that each proposed NBU was<br/>determined under Regulations section 1.472-8(b)(1) and (2):
        </div>    
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">a</div>
        <div style="float:left; padding-top:1mm">
          A description of the types of products produced by the applicant. If possible, attach a brochure.
        </div>            
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">b</div>
        <div style="float:left; padding-top:1mm">
          A description of the types of processes and raw materials used to produce the products in each proposed pool.
        </div>    
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">c</div>
        <div style="float:left; padding-top:1mm">
If all of the products to be included in the proposed NBU pool(s) are not produced at one facility, state the reasons for the separate facilities, the location of each facility, and a description of the products each facility produces.
        </div>  
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">d</div>
        <div style="float:left; padding-top:1mm">
          A description of the natural business divisions adopted by the taxpayer. State whether separate cost centers are<br/>maintained and if separate profit and loss statements are prepared.
        </div>          
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">e</div>
        <div style="float:left; padding-top:1mm">
          A statement addressing whether the applicant has inventories of items purchased and held for resale that are not further<br/>processed by the applicant, including whether such items, if any, will be included in any proposed NBU pool.
        </div>        
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">f</div>
        <div style="float:left; padding-top:1mm">
          A statement addressing whether all items including raw materials, goods-in-process, and finished goods entering into the<br/>entire inventory investment for each proposed NBU pool are presently valued under the LIFO method. Describe any items<br/>that are not presently valued under the LIFO method that are to be included in each proposed pool.
        </div>    
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">g</div>
        <div style="float:left; padding-top:1mm">
          A statement addressing whether, within the proposed NBU pool(s), there are items both sold to unrelated parties and<br/>transferred to a different unit of the applicant to be used as a component part of another product prior to final processing.
        </div>          
        <br/>
        <div class="styIRS3115LNLeftNumBox" style="text-align:center; padding-top:1mm">3</div>
        <div style="float:left; padding-top:1mm">
          If the applicant is engaged in manufacturing and is proposing to use the multiple pooling method or raw material content<br/>pools, attach information to show that each proposed pool will consist of a group of items that are substantially similar.<br/>See Regulations section 1.472-8(b)(3).
        </div>
        <br/>
        <div class="styIRS3115LNLeftNumBox" style="text-align:center; padding-top:1mm">4</div>
        <div style="float:left; padding-top:1mm">
          If the applicant is engaged in the wholesaling or retailing of goods and is requesting to change the number of pools used,<br/>attach information to show that each of the proposed pools is based on customary business classifications of the<br/>applicant&#39;s trade or business. See Regulations section 1.472-8(c).
        </div>
      </div>        
      
      <xsl:call-template name="IRS3115Footer">
        <xsl:with-param name="thisPage" select="6"/>
      </xsl:call-template>
      
      <div class="styBB" style="padding-bottom:0.5mm; border-top:1 solid black; width:187mm; font-size:9.5pt">        
        <b>Schedule D-Change in the Treatment of Long-Term Contracts Under Section 460, Inventories, or Other<br/>Section 263A Assets</b> (see instructions)
      </div>          
      
      <div class="styBB" style="width:187mm">
        <div class="styPartName" style="width:11mm; font-size:9.5pt">Part I</div>
        <div class="styPartDesc" style="font-size:9.5pt">
          Change in Reporting Income From Long-Term Contracts <span style="font-weight:normal">(Also complete Part III on pages 7 and 8.)</span>
        </div>        
      </div>    
            
      <div style="width:187mm; padding-top:1mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">1</div>
        <div style="float:left">
To the extent not already provided, attach a description of the applicant’s present and proposed methods for reporting income
and expenses from long-term contracts. Also, attach a representative actual contract (without any deletion) for the requested
change. If the applicant is a construction contractor, attach a detailed description of its construction activities.
        </div>                          
      </div>    
      
      <div style="width:187mm; margin-top:1mm">      
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">2a</div>        
        <div style="float:left">
          Are the applicant&#39;s contracts long-term contracts as defined in section 460(f)(1) (see instructions)?            
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ...
          </span>    
      <span>
                 <xsl:call-template name="PopulateSpan">
                   <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ContractsLTAsDefinedSect460f1" />
                 </xsl:call-template>     
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ContractsLTAsDefinedSect460f1"/>
                <xsl:with-param name="BackupName">Contracts LTAs Defined Sect460f1Yes</xsl:with-param>
              </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ContractsLTAsDefinedSect460f1" />
                <xsl:with-param name="BackupName">Contracts LTAs Defined Sect460f1Yes</xsl:with-param>
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
      <span>
                 <xsl:call-template name="PopulateSpan">
                   <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ContractsLTAsDefinedSect460f1" />
                 </xsl:call-template>     
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ContractsLTAsDefinedSect460f1"/>
              <xsl:with-param name="BackupName">Contracts LTAs Defined Sect460f1No</xsl:with-param>  
              </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ContractsLTAsDefinedSect460f1" />
                <xsl:with-param name="BackupName">Contracts LTAs Defined Sect460f1No</xsl:with-param>
              </xsl:call-template>   
              <b>No</b>
            </label>  
        </div>          
      </div>          
      <div style="width:187mm; margin-top:0.5mm">    
        <div class="styIRS3115LNLeftLtrBox">b</div>        
        <div style="float:left">
          If   &#8220;Yes,&#8221; do all the contracts qualify for the exception under section 460(e) (see instructions)?            
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ....
          </span>      
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AllContractsQlfySection460eExc" />
                </xsl:call-template>         
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AllContractsQlfySection460eExc"/>
                <xsl:with-param name="BackupName">All Contracts Qlfy Section460eExcYes</xsl:with-param>
              </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AllContractsQlfySection460eExc" />
               <xsl:with-param name="BackupName">All Contracts Qlfy Section460eExcYes</xsl:with-param> 
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AllContractsQlfySection460eExc" />
                </xsl:call-template>
                         
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AllContractsQlfySection460eExc"/>
                <xsl:with-param name="BackupName">All Contracts Qlfy Section460eExcNo</xsl:with-param>
              </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AllContractsQlfySection460eExc" />
               <xsl:with-param name="BackupName">All Contracts Qlfy Section460eExcNo</xsl:with-param> 
              </xsl:call-template>   
              <b>No</b>
            </label>  
        </div>              
      </div>    
      
      <div style="width:187mm">      
        <div class="styIRS3115LNLeftNumBox"></div>        
        <div style="float:left">
        If line 2b is &#8220;No,&#8221; attach an explanation.      
        </div>
        <div style="float:left">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AllContractsQlfySection460eExc"/>              
          </xsl:call-template>  
        </div>    
      </div>    
      <div style="width:187mm; margin-top:0.5mm">      
        <div class="styIRS3115LNLeftLtrBox">c</div>        
        <div style="float:left">
          If line 2b is  &#8220;Yes,&#8221; is the applicant requesting to use the percentage-of-completion method using cost-to-cost
        </div>
      </div>    
      
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox"></div>        
        <div style="float:left">
          under Regulations section 1.460-4(b)?          
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            .......................
          </span>        
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IsApplcntReqPctOfComplnMthd" />
                </xsl:call-template>    
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IsApplcntReqPctOfComplnMthd"/>
              <xsl:with-param name="BackupName">IsAppl cnt Req Pct Of Compln MthdYes</xsl:with-param>  
              </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IsApplcntReqPctOfComplnMthd" />
                <xsl:with-param name="BackupName">IsAppl cnt Req Pct Of Compln MthdYes</xsl:with-param>
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IsApplcntReqPctOfComplnMthd" />
                </xsl:call-template>    
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IsApplcntReqPctOfComplnMthd"/>
               <xsl:with-param name="BackupName">IsAppl cnt Req Pct Of Compln MthdNo</xsl:with-param> 
              </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IsApplcntReqPctOfComplnMthd" />
                <xsl:with-param name="BackupName">IsAppl cnt Req Pct Of Compln MthdNo</xsl:with-param>
              </xsl:call-template>   
              <b>No</b>
            </label>  
        </div>              
      </div>          
      
      <div style="width:187mm; margin-top:0.5mm">      
        <div class="styIRS3115LNLeftLtrBox">d</div>        
        <div style="float:left">
If line 2c is &#8220;No,&#8221; is the applicant requesting to use the exempt-contract percentage-of-completion
        </div>
      </div>    
      
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox"></div>        
        <div style="float:left">
          method under Regulations section 1.460-4(c)(2)?    
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ....................
          </span>     
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IsApplcntReqExemptComplnMthd" />
                </xsl:call-template>      
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IsApplcntReqExemptComplnMthd"/>
                        <xsl:with-param name="BackupName">IsApplcntReqExemptComplnMthdYes</xsl:with-param>        
              </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IsApplcntReqExemptComplnMthd" />
             <xsl:with-param name="BackupName">IsApplcntReqExemptComplnMthdYes</xsl:with-param>      
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IsApplcntReqExemptComplnMthd" />
                </xsl:call-template>      
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IsApplcntReqExemptComplnMthd"/>
        <xsl:with-param name="BackupName">IsApplcntReqExemptComplnMthdNo</xsl:with-param> 
              </xsl:call-template>
            </input> 
           </span>&nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IsApplcntReqExemptComplnMthd" />
                    <xsl:with-param name="BackupName">IsApplcntReqExemptComplnMthdNo</xsl:with-param>    

              </xsl:call-template>   
              <b>No</b>
            </label>  
        </div>              
      </div>      
      <div style="width:187mm">      
        <div class="styIRS3115LNLeftLtrBox"></div>        
        <div style="float:left">
          If line 2d is  &#8220;Yes,&#8221; attach an explanation of what cost comparison the applicant will use to determine a<br/>contract&#39;s completion factor.
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IsApplcntReqExemptComplnMthd"/>              
          </xsl:call-template>  
          <br/> If line 2d is &#8220;No,&#8221; attach an explanation of what method the applicant is using and the authority for its use.     
        </div>
      </div>        
      <div style="width:187mm; margin-top:1mm">      
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">3a</div>        
        <div style="float:left">
          Does the applicant have long-term manufacturing contracts as defined in section 460(f)(2)?
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LTMfrContractsAsDefSect460f2"/>              
          </xsl:call-template>  
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ....
          </span>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LTMfrContractsAsDefSect460f2" />
                </xsl:call-template>     
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LTMfrContractsAsDefSect460f2"/>
               <xsl:with-param name="BackupName">LT Mfr Contracts As DefSect460f2Yes</xsl:with-param> 
              </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LTMfrContractsAsDefSect460f2" />
               <xsl:with-param name="BackupName">LT Mfr Contracts As DefSect460f2Yes</xsl:with-param>   
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LTMfrContractsAsDefSect460f2" />
                </xsl:call-template>     
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LTMfrContractsAsDefSect460f2"/>
                <xsl:with-param name="BackupName">LT Mfr Contracts As DefSect460f2No</xsl:with-param>  
              </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LTMfrContractsAsDefSect460f2" />
                  <xsl:with-param name="BackupName">LT Mfr Contracts As DefSect460f2No</xsl:with-param> 
              </xsl:call-template>   
              <b>No</b>
            </label> 
        </div>          
      </div>      
      
      <div style="width:187mm; margin-top:0.5mm">      
        <div class="styIRS3115LNLeftLtrBox">b</div>        
        <div style="float:left">
          If   &#8220;Yes,&#8221; explain the applicant&#39;s present and proposed method(s) of accounting for long-term manufacturing<br/>contracts.                  
        </div>
      </div>  
      
      <div style="width:187mm; margin-top:0.5mm">      
        <div class="styIRS3115LNLeftLtrBox">c</div>        
        <div style="float:left">
        Attach a description of the applicant’s manufacturing activities, including any required installation of manufactured goods.  
        </div>
      </div>  
      
      <div style="width:187mm; margin-top:1mm">      
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">4</div>        
        <div style="float:left">
          To determine a contract&#39;s completion factor using the percentage-of-completion method:
        </div>
      </div>  
      
      <div style="width:187mm; margin-top:0.5mm">      
        <div class="styIRS3115LNLeftLtrBox">a</div>        
        <div style="float:left">
          Will the applicant use the cost-to-cost method in Regulations section 1.460-4(b)?        
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ........
          </span>    
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/WillApplicantUseCosToCostMthd" />
                </xsl:call-template> 
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/WillApplicantUseCosToCostMthd"/>
                <xsl:with-param name="BackupName">WillApplicant Use Cos To Cost MthdYes</xsl:with-param>
              </xsl:call-template>
            </input> 
           </span>&nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/WillApplicantUseCosToCostMthd" />
                 <xsl:with-param name="BackupName">WillApplicant Use Cos To Cost MthdYes</xsl:with-param> 
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/WillApplicantUseCosToCostMthd" />
                </xsl:call-template> 
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/WillApplicantUseCosToCostMthd"/>
               <xsl:with-param name="BackupName">WillApplicant Use Cos To Cost MthdNo</xsl:with-param>   
              </xsl:call-template>
            </input></span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/WillApplicantUseCosToCostMthd" />
               <xsl:with-param name="BackupName">WillApplicant Use Cos To Cost MthdNo</xsl:with-param>
              </xsl:call-template>   
              <b>No</b>
            </label>  
        </div>          
      </div>        
        <div style="width:187mm; margin-top:0.5mm">      
        <div class="styIRS3115LNLeftLtrBox">b</div>        
        <div style="float:left">
         If line 4a is   If   &#8220;No,&#8221; is the applicant electing the simplified cost-to-cost method (see section 460(b)(3) and        
        </div>
      </div>            
      <div style="width:187mm">      
        <div class="styIRS3115LNLeftLtrBox"></div>        
        <div style="float:left">
          Regulations section 1.460-5(c))?  
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            .........................
          </span>           
             <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ElectingSmplfdCostToCostMthd" />
                </xsl:call-template> 
                <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ElectingSmplfdCostToCostMthd"/>
                      <xsl:with-param name="BackupName">Electing Smplfd Cost To Cost MthdYes</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span> &nbsp;          
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ElectingSmplfdCostToCostMthd" />
                       <xsl:with-param name="BackupName">Electing Smplfd Cost To Cost MthdYes</xsl:with-param>
                  </xsl:call-template>   
                  <b>Yes</b>
              </label>  
              <span style="width:3mm"></span>
              <span>
                <xsl:call-template name="PopulateSpan">
                   <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ElectingSmplfdCostToCostMthd" />
                </xsl:call-template> 
                <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ElectingSmplfdCostToCostMthd"/>
                    <xsl:with-param name="BackupName">Electing Smplfd Cost To Cost MthdNo</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span> &nbsp;          
               <label>
                 <xsl:call-template name="PopulateLabelNo">
                   <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ElectingSmplfdCostToCostMthd" />
                    <xsl:with-param name="BackupName">Electing Smplfd Cost To Cost MthdNo</xsl:with-param>
                 </xsl:call-template>   
                 <b>No</b>
              </label>                
        </div>          
      </div>      
              
      <div style="width:187mm; padding-bottom:0.5mm; border-bottom:1 solid black; margin-top:1mm">      
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">5</div>        
        <div style="float:left">
          Attach a statement indicating whether any of the applicant&#39;s contracts are either cost-plus long-term<br/>contracts or Federal long-term contracts.
        </div>
      </div>      
      
      <div class="styBB" style="width:187mm; ">
        <div class="styPartName" style="width:11mm; font-size:9.5pt">Part II</div>
        <div class="styPartDesc" style="padding-left:2mm; width:176mm; font-size:9.5pt">
          Change in Valuing Inventories Including Cost Allocation Changes <span style="font-weight:normal">(Also complete Part III on pages 7 and 8.)</span>
        </div>        
      </div>          
      <!-- Line 1   -->
      <div style="width:187mm; padding-top:1mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">1</div>
        <div style="float:left">
          Attach a description of the inventory goods being changed.
        </div>  
      </div>          
      <!-- Line 2  -->
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">2</div>
        <div style="float:left">
          Attach a description of the inventory goods (if any) NOT being changed.
        </div>  
      </div>  
      <!-- Line 3a  -->
           <div style="width:187mm">      
           <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">3a</div> 
           <div style="float:left">
         Is the applicant subject to section 263A? If &nbsp;&#8220; No,&#8221;&nbsp; go to line 4a
          </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ..............
          </span>    
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplicationSubjectToSec263A" />
                </xsl:call-template> 
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplicationSubjectToSec263A"/>
              <xsl:with-param name="BackupName">Application Subject To Sec263AYes</xsl:with-param>  
              </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplicationSubjectToSec263A" />
              <xsl:with-param name="BackupName">Application Subject To Sec263AYes</xsl:with-param> 
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplicationSubjectToSec263A" />
                </xsl:call-template> 
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplicationSubjectToSec263A"/>
                <xsl:with-param name="BackupName">Application Subject To Sec263ANo</xsl:with-param>
              </xsl:call-template>
            </input></span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplicationSubjectToSec263A" />
                <xsl:with-param name="BackupName">Application Subject To Sec263ANo</xsl:with-param>
              </xsl:call-template>   
              <b>No</b>
            </label>  
          </div>          
      </div>   
      <!-- Line 3b  --> 
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:3.5mm">b</div>
        <div style="float:left">
       Is the applicant&#39;s present inventory valuation method in compliance with section 263A (see instructions)? 
        </div>  
      </div>        
      <div style="width:187mm">      
        <div class="styIRS3115LNLeftLtrBox"></div>        
        <div style="float:left">
          If  &nbsp;&#8220; No,&#8221;&nbsp;attach a detailed explanation
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">
               <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PresentInvntryVltnMthdPer263A"/>              
          </xsl:call-template>  
           .......................
               </span>    
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PresentInvntryVltnMthdPer263A" />
                </xsl:call-template> 
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PresentInvntryVltnMthdPer263A"/>
                <xsl:with-param name="BackupName">Present Invntry Vltn Mthd Per263AYes</xsl:with-param>
              </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PresentInvntryVltnMthdPer263A" />
                <xsl:with-param name="BackupName">Present Invntry Vltn Mthd Per263AYes</xsl:with-param>
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PresentInvntryVltnMthdPer263A" />
                </xsl:call-template> 
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PresentInvntryVltnMthdPer263A"/>
              <xsl:with-param name="BackupName">Present Invntry Vltn Mthd Per263ANo</xsl:with-param>   
              </xsl:call-template>
            </input></span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PresentInvntryVltnMthdPer263A" />
              <xsl:with-param name="BackupName">Present Invntry Vltn Mthd Per263ANo</xsl:with-param>
              </xsl:call-template>   
              <b>No</b>
            </label>  
        </div>          
      </div>    
      <br/>
      <table style="width:187mm; font-size:9pt" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <th class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm; text-align:left; width:4.5mm" nowrap="nowrap" valign="bottom">
            4a
          </th>
          <th scope="col" align="left" style="font-weight:normal" nowrap="nowrap" valign="bottom">
            Check the appropriate boxes below.
          </th>
          <th class="styIRS3115TblRB2" style="border-top:1 solid black; font-weight:normal" nowrap="nowrap" colspan="2" scope="col">
            Inventory Being Changed
          </th>
          <th class="styIRS3115TblRB2" style="border-top:1 solid black; font-weight:normal; padding-bottom:1mm; padding-top:1mm" nowrap="nowrap" scope="col">
            Inventory Not<br/>Being Changed
          </th>          
        </tr>
        <tr>
          <td></td>
          <th scope="row" nowrap="nowrap" style="text-align:left; font-weight:normal">
            Identification methods:  
          </th>
          <th class="styIRS3115TblRB2" style="font-weight:normal; width:22mm" nowrap="nowrap" scope="row">
            Present method
          </th>
          <th class="styIRS3115TblRB2" style="font-weight:normal; width:22mm" nowrap="nowrap" scope="row">
            Proposed method
          </th>  
          <th class="styIRS3115TblRB2" style="font-weight:normal; width:22mm" nowrap="nowrap" scope="row">
            Present method
          </th>          
        </tr>
        <tr align="center">
          <td></td>
          <th scope="row" nowrap="nowrap">
            <div style="float:left; font-weight:normal; padding-left:2mm">
              Specific identification
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                ...................
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethod/Methods/SpecificIdentification"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethod/Methods/SpecificIdentification"/>              
            </xsl:call-template>
          </td>  
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethod/Methods/SpecificIdentification"/>              
            </xsl:call-template>
          </td>          
        </tr>
        <tr align="center">
          <td></td>
          <th scope="row" nowrap="nowrap">
            <div style="float:left; font-weight:normal; padding-left:2mm">
              FIFO
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                .........................
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethod/Methods/FIFO"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethod/Methods/FIFO"/>              
            </xsl:call-template>
          </td>  
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethod/Methods/FIFO"/>              
            </xsl:call-template>
          </td>            
        </tr>
        <tr align="center">
          <td></td>
          <th scope="row" nowrap="nowrap">
            <div style="float:left; font-weight:normal; padding-left:2mm">
              LIFO
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                .........................
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethod/Methods/LIFO"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethod/Methods/LIFO"/>              
            </xsl:call-template>
          </td>  
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethod/Methods/LIFO"/>              
            </xsl:call-template>
          </td>          
        </tr>
        <tr>
          <td></td>
          <th scope="row" nowrap="nowrap">
            <div style="float:left; font-weight:normal; padding-left:2mm">
              Other (attach explanation)
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                .................
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2" align="center">
            <span style="width:15px" />
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethod/Methods/OtherIdentificationMethod"/>              
            </xsl:call-template>
            <span style="width:2px" />
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethod/Methods/OtherIdentificationMethod"/>
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2" align="center">
            <span style="width:15px" />
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethod/Methods/OtherIdentificationMethod"/>              
            </xsl:call-template>
            <span style="width:2px" />
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethod/Methods/OtherIdentificationMethod"/>
            </xsl:call-template>  
          </td>  
          <td class="styIRS3115TblRB2" align="center">
            <span style="width:15px" />
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethod/Methods/OtherIdentificationMethod"/>              
            </xsl:call-template>
            <span style="width:2px" />
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethod/Methods/OtherIdentificationMethod"/>
            </xsl:call-template>  
          </td>          
        </tr>
        <tr align="center" valign="bottom" title=".">
          <td></td>
          <th scope="row" nowrap="nowrap" style="text-align:left">
            <div style="font-weight:normal">Valuation methods:</div>
            <div style="float:left; font-weight:normal; padding-left:2mm">
              Cost
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                .........................
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethod/Methods/Cost"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethod/Methods/Cost"/>              
            </xsl:call-template>
          </td>  
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethod/Methods/Cost"/>              
            </xsl:call-template>
          </td>              
        </tr>
        <tr align="center">
          <td></td>
          <th scope="row" nowrap="nowrap">
            <div style="float:left; font-weight:normal; padding-left:2mm">
              Cost or market, whichever is lower
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                ...............
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethod/Methods/CostOrMarket"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethod/Methods/CostOrMarket"/>              
            </xsl:call-template>
          </td>  
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethod/Methods/CostOrMarket"/>              
            </xsl:call-template>
          </td>            
        </tr>
        <tr align="center">
          <td></td>
          <th scope="row" nowrap="nowrap">
            <div style="float:left; font-weight:normal; padding-left:2mm">
              Retail cost
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                .......................
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethod/Methods/RetailCost"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethod/Methods/RetailCost"/>              
            </xsl:call-template>
          </td>  
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethod/Methods/RetailCost"/>              
            </xsl:call-template>
          </td>      
        </tr>
        <tr align="center">
          <td></td>
          <th scope="row" nowrap="nowrap">
            <div style="float:left; font-weight:normal; padding-left:2mm">
              Retail, lower of cost or market
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                ................
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethod/Methods/RetailLowerOfCostOrMarket"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethod/Methods/RetailLowerOfCostOrMarket"/>              
            </xsl:call-template>
          </td>  
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethod/Methods/RetailLowerOfCostOrMarket"/>              
            </xsl:call-template>
          </td>            
        </tr>
        <tr align="center">
          <td></td>
          <th scope="row" nowrap="nowrap">
            <div style="float:left; font-weight:normal; padding-left:2mm">
              Other (attach explanation)
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                ..................
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2">
            <span style="width:15px" />
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethod/Methods/OtherValutionMethod"/>              
            </xsl:call-template>  
            <span style="width:2px" />
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethod/Methods/OtherValutionMethod"/>
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2">
            <span style="width:15px" />
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethod/Methods/OtherValutionMethod"/>              
            </xsl:call-template>
            <span style="width:2px" />
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethod/Methods/OtherValutionMethod"/>
            </xsl:call-template>  
          </td>  
          <td class="styIRS3115TblRB2">
            <span style="width:15px" />
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethod/Methods/OtherValutionMethod"/>              
            </xsl:call-template>
            <span style="width:2px" />
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethod/Methods/OtherValutionMethod"/>
            </xsl:call-template>  
          </td>          
        </tr>
        <tr align="center">
          <th scope="row" align="right">b&nbsp;</th>
          <th scope="row" nowrap="nowrap">
            <div style="float:left; font-weight:normal">
              Enter the value at the end of the tax year preceding the year of change
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                ...
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethod/ValueEndOfTaxYrBeforeYearOfChg"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethod/ValueEndOfTaxYrBeforeYearOfChg"/>              
            </xsl:call-template>
          </td>            
          <td class="styIRS3115TblRB2" style="background-color:lightgrey">&nbsp;</td>          
        </tr>
      </table>    
      
      <div style="width:187mm; padding-top:1mm">      
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">5</div>        
        <div style="float:left">
          If the applicant is changing from the LIFO inventory method to a non-LIFO method, attach the following information (see<br/>instructions).
        </div>
      </div>    
      
      <div style="width:187mm">      
        <div class="styIRS3115LNLeftLtrBox">a</div>        
        <div style="float:left">
          Copies of Form(s) 970 filed to adopt or expand the use of the method.    
        </div>
      </div>
      
      <div style="width:187mm">      
        <div class="styIRS3115LNLeftLtrBox">b</div>        
        <div style="float:left">
          <b>Only for applicants requesting advance consent.</b> A statement describing whether the applicant is changing to the method<br/>required by Regulations section 1.472-6(a) or (b), or whether the applicant is proposing a different method.
        </div>
      </div>
      <div style="width:187mm">      
        <div class="styIRS3115LNLeftLtrBox">c</div>        
        <div style="float:left">
          <b>Only for applicants requesting an automatic change.</b> The statement required by section 22.01(5) of the Appendix of Rev.
Proc. 2008-52 (or its successor).
        </div>
      </div>
      <xsl:call-template name="IRS3115Footer">
        <xsl:with-param name="thisPage" select="7"/>
      </xsl:call-template>
            
      <div class="styBB" style="width:187mm; border-top:2 solid black">
        <div class="styPartName" style="width:13mm; font-size:9.5pt">Part III</div>
        <div class="styPartDesc" style="width:170mm; font-size:9.5pt; padding-bottom:0.5mm">
          Method of Cost Allocation <span style="font-weight:normal">(Complete this part if the requested change involves either property subject<br/>to section 263A or long-term contracts as described in section 460 (see instructions)).</span>
        </div>        
      </div>    
      
      <div class="styBB" style="width:187mm">
        <b>Section A-Allocation and Capitalization Methods</b>  
      </div>        
      
      <div style="width:189mm; margin-top:1mm">
        Attach a description (including sample computations) of the present and proposed method(s) the applicant uses to capitalize direct<br/>and indirect costs properly allocable to real or tangible personal property produced and property acquired for resale, or to allocate<br/>and, where appropriate, capitalize direct and indirect costs properly allocable to long-term contracts. Include a description of the<br/>method(s) used for allocating indirect costs to intermediate cost objectives such as departments or activities prior to the allocation<br/>of such costs to long-term contracts, real or tangible personal property produced, and property acquired for resale. The description<br/>must include the following:
      </div>
      
      <div style="width:187mm; padding-top:1mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">1</div>
        <div style="float:left">
          The method of allocating direct and indirect costs (i.e., specific identification, burden rate, standard cost, or other<br/>reasonable allocation method).
        </div>  
      </div>      
      
      <div style="width:187mm; padding-top:1mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">2</div>
        <div style="float:left">
          The method of allocating mixed service costs (i.e., direct reallocation, step-allocation, simplified service cost using the<br/>labor-based allocation ratio, simplified service cost using the production cost allocation ratio, or other reasonable allocation<br/>method).
        </div>  
      </div>      
      
      <div style="width:187mm; padding-top:1mm; ">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">3</div>
        <div style="float:left">
          The method of capitalizing additional section 263A costs (i.e., simplified production with or without the historic absorption<br/>ratio election, simplified resale with or without the historic absorption ratio election including permissible variations, the<br/>U.S. ratio, or other reasonable allocation method).
        </div>  
      </div>      
      
      <div class="styBB" style="border-top:1 solid black; width:187mm; padding-top:1mm; padding-bottom:1.5mm"><b>Section B-Direct and Indirect Costs Required To Be Allocated</b><br/>Check the appropriate boxes showing the costs that are or will be fully included, to the extent required, in the cost of real or tangible personal property produced or property acquired for resale under section 263A or allocated to long-term contracts under section 460. Mark &#8220;N/A&#8221; in a box if those costs are not incurred by the applicant. If a box is not checked, it is assumed that those costs are not fully included to the extent required. Attach an explanation for boxes that are not checked.
      </div>  
      <div style="width:187mm">
        <div style="float:right">
          <div class="styIRS3115SchDP3" style="text-align:center">Present method</div>
          <div class="styIRS3115SchDP3" style="text-align:center">Proposed method</div>
        </div>      
      </div>
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">1</div>
        <div style="float:left">
          Direct material
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ...........................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/DirectMaterial/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/DirectMaterial/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">2</div>
        <div style="float:left">
          Direct labor
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ............................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/DirectLabor/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/DirectLabor/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">3</div>
        <div style="float:left">
          Indirect labor
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ...........................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IndirectLabor/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IndirectLabor/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">4</div>
        <div style="float:left">
          Officers&#39; compensation (not including selling activities)
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .............
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OfficersCompensation/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OfficersCompensation/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">5</div>
        <div style="float:left">
          Pension and other related costs
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .....................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PensionAndOtherRelatedCosts/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PensionAndOtherRelatedCosts/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
            
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">6</div>
        <div style="float:left">
          Employee benefits
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ..........................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EmployeeBenefits/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EmployeeBenefits/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">7</div>
        <div style="float:left">
          Indirect materials and supplies
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ......................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IndirectMaterialsAndSupplies/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IndirectMaterialsAndSupplies/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">8</div>
        <div style="float:left">
          Purchasing costs
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ..........................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PurchasingCosts/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PurchasingCosts/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">9</div>
        <div style="float:left">
          Handling, processing, assembly, and repackaging costs
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .............
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/HandlingProcessingAssemblyCost/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/HandlingProcessingAssemblyCost/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">10</div>
        <div style="float:left">
          Offsite storage and warehousing costs
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ...................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OffsiteStorageWarehousingCosts/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OffsiteStorageWarehousingCosts/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>        
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">11</div>
        <div style="float:left">
          Depreciation, amortization, and cost recovery allowance for equipment and facilities placed in
        </div>  
        <div style="float:right">          
          <div class="styIRS3115SchDP3" style="border-bottom:0"></div>
          <div class="styIRS3115SchDP3" style="border-bottom:0"></div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          service and not temporarily idle
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .....................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/DeprecAmortzAndCostRecovery/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/DeprecAmortzAndCostRecovery/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">12</div>
        <div style="float:left">
          Depletion
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .............................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Depletion/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Depletion/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">13</div>
        <div style="float:left">
          Rent
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ..............................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Rent/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Rent/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">14</div>
        <div style="float:left">
          Taxes other than state, local, and foreign income taxes
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .............
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/TaxesNotStateLocalAndForeign/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/TaxesNotStateLocalAndForeign/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  

      <!-- ******************************************************************  -->
          <div style="width:187mm;" >                
        <div class="styIRS3115LNLeftNumBox">15</div>
        <div style="float:left">
         Insurance 
        </div>  
        <div style="float:right">
         <span class="styDotLn" style="padding-right:0">
            ............................
          </span>
          <div class="styIRS3115SchDP3">
                    <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Insurance/PresentMethod"/>              
            </xsl:call-template>  
          </div>
          <div class="styIRS3115SchDP3">
              <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Insurance/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>        
      <!-- ******************************************************************  -->
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">16</div>
        <div style="float:left">
          Utilities
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .............................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Utilities/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Utilities/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>        
        
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">17</div>
        <div style="float:left">
          Maintenance and repairs that relate to a production, resale, or long-term contract activity
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ..
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/MaintRepairsProdResaleLTCntrct/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/MaintRepairsProdResaleLTCntrct/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm;">                
        <div class="styIRS3115LNLeftNumBox">18</div>
        <div style="float:left">
          Engineering and design costs (not including section 174 research and experimental
        </div>  
        <div style="float:right">          
          <div class="styIRS3115SchDP3" style="border-bottom:0"></div>
          <div class="styIRS3115SchDP3" style="border-bottom:0"></div>
        </div>  
      </div>  
      
      <div style="width:187mm;">                
        <div class="styIRS3115LNLeftNumBox"></div>
        <div style="float:left">
          expenses)
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ............................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EngineeringAndDesignCosts/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EngineeringAndDesignCosts/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">19</div>
        <div style="float:left">
          Rework labor, scrap, and spoilage
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ....................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ReworkLaborScrapAndSpoilage/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ReworkLaborScrapAndSpoilage/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">20</div>
        <div style="float:left">
          Tools and equipment
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .........................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ToolsAndEquipment/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ToolsAndEquipment/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">21</div>
        <div style="float:left">
          Quality control and inspection
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ......................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/QualityControlAndInspection/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/QualityControlAndInspection/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
        
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">22</div>
        <div style="float:left">
          Bidding expenses incurred in the solicitation of contracts awarded to the applicant
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ....
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ContractBiddingExpnssIncurred/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ContractBiddingExpnssIncurred/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">23</div>
        <div style="float:left">
          Licensing and franchise costs
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ......................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LicensingAndFranchiseCosts/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LicensingAndFranchiseCosts/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">24</div>
        <div style="float:left">
          Capitalizable service costs (including mixed service costs)
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ............
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/CapitalizableServiceCosts/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/CapitalizableServiceCosts/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">25</div>
        <div style="float:left">
          Administrative costs (not including any costs of selling or any return on capital)
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .....
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AdministrativeCosts/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AdministrativeCosts/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">26</div>
        <div style="float:left">
          Research and experimental expenses attributable to long-term contracts
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .......
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/RsrchAndExptlExpnssLTContracts/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/RsrchAndExptlExpnssLTContracts/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm;">                
        <div class="styIRS3115LNLeftNumBox">27</div>
        <div style="float:left">
          Interest
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .............................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Interest/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Interest/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>    
      
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">28</div>
        <div style="float:left">
          Other costs (Attach a list of these costs.)
        </div>  
        <div style="float:left">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherCostsRqrToBeAllocated"/>              
          </xsl:call-template>  
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ...............
          </span>
          <div class="styIRS3115SchDP3" style="border-bottom:0">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherCostsRqrToBeAllocated/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3" style="border-bottom:0">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherCostsRqrToBeAllocated/ProposedMethod"/>              
            </xsl:call-template>
          </div>          
        </div>  
      </div>        
        
      <xsl:call-template name="IRS3115Footer">
        <xsl:with-param name="thisPage" select="8"/>
      </xsl:call-template>
            
      <div class="styBB" style="width:187mm; border-top:2 solid black">
        <div class="styPartName" style="width:13mm; font-size:9.5pt">Part III</div>
        <div class="styPartDesc" style="width:170mm; font-size:9.5pt">
          Method of Cost Allocation <span style="font-weight:normal">(see instructions) (continued)</span>
        </div>        
      </div>    
      
      <div class="styBB" style="width:187mm">
        <b>Section C-Other Costs Not Required To Be Allocated</b> (Complete Section C only if the applicant is requesting to change its<br/>method for these costs.)  
      </div>        
      
      <div style="width:187mm">
        <div style="float:right">
          <div class="styIRS3115SchDP3" style="text-align:center">Present method</div>
          <div class="styIRS3115SchDP3" style="text-align:center">Proposed method</div>
        </div>      
      </div>
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">1</div>
        <div style="float:left">
          Marketing, selling, advertising, and distribution expenses
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ............
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/MarketingSellAdvtgDistriExpnss/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/MarketingSellAdvtgDistriExpnss/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">2</div>
        <div style="float:left">
          Research and experimental expenses not included in Section B, line 26
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .......
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherResearchAndExptlExpenses/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherResearchAndExptlExpenses/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">3</div>
        <div style="float:left">
        Bidding expenses not included in Section B, line 22
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ...............
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherBiddingExpenses/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherBiddingExpenses/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">4</div>
        <div style="float:left">
         General and administrative costs not included in Section B
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ............
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/GeneralAndAdministrativeCosts/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/GeneralAndAdministrativeCosts/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm;w">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">5</div>
        <div style="float:left">
          Income taxes
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ..........................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IncomeTaxes/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IncomeTaxes/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
            
      <div style="width:187mm;">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">6</div>
        <div style="float:left">
          Cost of strikes
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .........................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/CostOfStrikes/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/CostOfStrikes/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm;">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">7</div>
        <div style="float:left">
          Warranty and product liability costs
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ..................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/WarrantyProductLiabilityCosts/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/WarrantyProductLiabilityCosts/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm;">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">8</div>
        <div style="float:left">
          Section 179 costs
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ........................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Section179Costs/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Section179Costs/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm;">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">9</div>
        <div style="float:left">
          On-site storage
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .......................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OnSiteStorage/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OnSiteStorage/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox">10</div>
        <div style="float:left">
         Depreciation, amortization, and cost recovery allowance not included in Section B,
line 11
        </div>  
        <div style="float:right">
         
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherDeprecAmortzCostRecovery/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherDeprecAmortzCostRecovery/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
            
      <div style="width:187mm; border-bottom:1 solid black;">                
        <div class="styIRS3115LNLeftNumBox">11</div>
        <div style="float:left">
         Other costs (Attach a list of these costs.)     
        </div>  
        <div style="float:right">
          
          <span class="styDotLn" style="padding-right:0">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherCostsNotRqrToBeAllocated"/>              
            </xsl:call-template>...............
          </span>
          <div class="styIRS3115SchDP3" style="border-bottom:0">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherCostsNotRqrToBeAllocated/PresentMethod"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3" style="border-bottom:0">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherCostsNotRqrToBeAllocated/ProposedMethod"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div class="styBB" style="width:187mm;font-size:9.5pt">
        <b>Schedule E-Change in Depreciation or Amortization</b> (see instructions)
      </div>  
      
      <div style="width:187mm; padding-top:1mm;">
        Applicants requesting approval to change their method of accounting for depreciation or amortization complete this section.<br/>Applicants <b>must</b> provide this information for each item or class of property for which a change is requested.<br/><span><b>Note:</b> <i> See the <b>List of Automatic Accounting Method Changes</b> in the instructions for information regarding automatic changes<br/>under sections 56, 167, 168, 197, 1400I, 1400L, or former section 168.<b> do not</b> file Form 3115 with respect to certain late elections</i></span>        
      </div>  
      
      <xsl:variable name="schECount" select="count($Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization)" />  
      <div style="width:187mm">
        <xsl:attribute name="style">  
          <xsl:if test="$schECount &gt; 1">
            width:187mm
          </xsl:if>
        </xsl:attribute>   
        <div style="float:left">
          <i>and election revocations (see instructions).</i>
        </div>
        <div style="float:right">            
          <xsl:call-template name="SetTableToggleButton">
             <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization" />
              <xsl:with-param name="containerHeight" select="1" />
              <xsl:with-param name="containerID" select="'schETPctn'" />
          </xsl:call-template>               
        </div>    
      </div>        
              
      <div class="styIRS3115TableContainer2" id="schETPctn">  
        <xsl:attribute name="style">            
          <xsl:if test="$schECount &gt; 1">
            height:56mm
          </xsl:if>          
        </xsl:attribute>   
        <xsl:call-template name="SetInitialState"/>          
        <table class="styTable" style="width:100%; border-bottom:0; font-size:9pt" cellspacing="0" cellpadding="0" border="0">
          <xsl:if test="($Print != $Separated and $Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization) or (count($Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization) = 1)">          
            <xsl:call-template name="SchETemplate">
              <xsl:with-param name="max">
                <xsl:choose>
                     <xsl:when test="$schECount &gt; 1">     
                    <xsl:value-of select="$schECount" />
                     </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="1" />
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="not($Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization)" >
            <xsl:call-template name="SchETemplate">
            <xsl:with-param name="max" select="1"></xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="($Print = $Separated) and (count($Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization) &gt;1)" >
            <xsl:call-template name="SchETemplate">
            <xsl:with-param name="max" select="1"></xsl:with-param>
             <xsl:with-param name="IsSeparated" select=" 'yes' "></xsl:with-param>
            </xsl:call-template>
          </xsl:if>
        </table>              
      </div>    
    
      <div class="styIRS3115LNLeftNumBox" style="text-align:center; padding-top:1mm">5</div>  
    <div style="float:left; padding-top:1mm">
     To the extent not already provided in the applicant&#39;s description of its present method, attach a statement explaining how <br/>the property is treated under the applicant’s present method (e.g., depreciable property, inventory property, supplies <br/>under Regulations section 1.162-3, nondepreciable section 263(a) property, property deductible as a current expense, etc.).
    </div> 
    <br/>   
    <div class="styIRS3115LNLeftNumBox" style="text-align:center; padding-top:1mm">6</div>  
    <div style="float:left; padding-top:1mm">
      If the property is not currently treated as depreciable or amortizable property, attach a statement of the facts supporting the<br/>proposed change to depreciate or amortize the property.
    </div>        
    <br/>   
    <div class="styIRS3115LNLeftNumBox" style="text-align:center; padding-top:1mm">7</div>  
    <div style="float:left; padding-top:1mm">
       If the property is currently treated and/or will be treated as depreciable or amortizable property, provide the following<br/>information for both the present (if applicable) and proposed methods:
    </div>  
    <br/>   
    <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">a</div>
    <div style="float:left; padding-top:1mm">
      The Code section under which the property is or will be depreciated or amortized (e.g., section 168(g)).
    </div>     
    <br/>   
    <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">b</div>
    <div style="float:left; padding-top:1mm">
      The applicable asset class from Rev. Proc. 87-56, 1987-2 C.B. 674, for each asset depreciated under section 168 (MACRS)<br/>or under section 1400L; the applicable asset class from Rev. Proc. 83-35, 1983-1 C.B. 745, for each asset depreciated under<br/>former section 168 (ACRS); an explanation why no asset class is identified for each asset for which an asset class has not<br/>been identified by the applicant.
    </div>  
    <br/>   
    <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">c</div>
    <div style="float:left; padding-top:1mm">
       The facts to support the asset class for the proposed method.
    </div>  
    <br/>   
    <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">d</div>
    <div style="float:left; padding-top:1mm">
       The depreciation or amortization method of the property, including the applicable Code section (e.g., 200% declining balance<br/>method under section 168(b)(1)).
    </div>   
    <br/>   
    <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">e</div>
    <div style="float:left; padding-top:1mm">
      The useful life, recovery period, or amortization period of the property.
    </div>  
    <br/>   
    <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">f</div>
    <div style="float:left; padding-top:1mm">
      The applicable convention of the property.
    </div>  
    <br/>
      <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">g</div>
    <div style="float:left; padding-top:1mm">A statement of whether or not the additional first-year special depreciation allowance (for example, as provided by section
<br/>168(k), 168(l), 168(m), 168(n), 1400L(b), or 1400N(d)) was or will be claimed for the property. If not, also provide an explanation<br/>as to why no special depreciation allowance was or will be claimed.
    </div>  
    <br/>   
    <br/>            
      
      <xsl:call-template name="IRS3115Footer">
        <xsl:with-param name="thisPage" select="9"/>
      </xsl:call-template>
            
      <div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif; height:4mm; padding-top:6mm">
        <div class="styLeftOverTitle">
          Additional Data        
        </div>
        <div class="styLeftOverButtonContainer">
          <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
        </div>      
      </div>
      
      <table class="styLeftOverTbl">
        <xsl:call-template name="PopulateCommonLeftover">
          <xsl:with-param name="TargetNode" select="$Form3115Data" />
          <xsl:with-param name="DescWidth" select="110"/>
        </xsl:call-template>
        <xsl:call-template name="PopulateLeftoverRow">
          <xsl:with-param name="Desc">120-Day Window Ending Date of Examination - Part II Line 4e</xsl:with-param>
          <xsl:with-param name="TargetNode" select="$Form3115Data/EndingDayOfExamination"/>
          <xsl:with-param name="DescWidth" select="110"/>
        </xsl:call-template>  
        <tr>
          <td class="styLeftOverTableRowDesc" style="width:110mm;" scope="row">
            Does the Applicant Qualifies For a Reduced User Fee - Part III Line 23b:
          </td>
          <td class="styLeftOverTableRowAmount" style="width:77mm;text-align:left;">
            <xsl:if test="$Form3115Data/QlfyReducedUserFeeRqrInfoAtt = '1'">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form3115Data/QlfyReducedUserFeeRqrInfoAtt"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form3115Data/QlfyReducedUserFeeRqrInfoAtt = '0'">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form3115Data/QlfyReducedUserFeeRqrInfoAtt"/>
              </xsl:call-template>
            </xsl:if>
          </td>
        </tr>
      </table>          
      
      <xsl:call-template name="leftOverTbl">
        <xsl:with-param name="itemName" select="$Form3115Data/ReturnsUnderExaminationInfo" />
        <xsl:with-param name="desc" select="'Federal Returns Under Examination - Part II Line 4a'" />                  
        <xsl:with-param name="colTitle" select="'Examination Period'" />                
        <xsl:with-param name="lineNum" select="'4a'" />                            
      </xsl:call-template>
      
      <xsl:call-template name="leftOverTbl">
        <xsl:with-param name="itemName" select="$Form3115Data/ConsiderationOrSuspenseInfo" />
        <xsl:with-param name="desc" select="'Method of Change Issue Under Consideration or Placed in Suspense - Part II Line 4b'" />                  
        <xsl:with-param name="colTitle" select="'Consideration or Suspense'" />            
        <xsl:with-param name="lineNum" select="'4b'" />                      
      </xsl:call-template>
      
      <xsl:call-template name="leftOverTbl">
        <xsl:with-param name="itemName" select="$Form3115Data/IssuePendingExaminationInfo" />
        <xsl:with-param name="desc" select="'Method of Accounting Issue Pending for Any Tax Year Under Examination - Part II Line 4c'" />                  
        <xsl:with-param name="colTitle" select="'Issue Pending Examination'" />            
        <xsl:with-param name="lineNum" select="'4c'" />    
      </xsl:call-template> 
      
      <!-- Begin separated repeating data tables for part II Line 4f tanuja-->
    <xsl:if test="($Print = $Separated) and (count($Form3115Data/ContactInfoOfExaminingAgents) &gt;1)">
    <br />
      <span class="styRepeatingDataTitle"  style="font-size:8pt;">Form 3115, Part II, Line 4f - If you answered "Yes" to line 4a, enter the name and telephone number of the examining agent and the tax
year(s) under examination:</span>
      <table class="styDepTbl" cellspacing="0" style="font-size:8pt;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:100mm;">Name</th>
          <th class="styDepTblCell" scope="col" style="width:40mm;">Telephone number</th>
          <th class="styDepTblCell" scope="col" style="width:40mm;">Tax year(s)</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
      <xsl:for-each select="$Form3115Data/ContactInfoOfExaminingAgents">
              <tr>
              <xsl:attribute name="class">
                <xsl:choose>
                   <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                   <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
                <td class="styDepTblCell" style="height:4.5mm;text-align:left;border-left:1 solid 0px;">      
                  <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Name" /></xsl:call-template>
                </td>
                <td class="styDepTblCell" style="height:4.5mm;text-align:center;"><xsl:call-template name="PopulatePhoneNumber"><xsl:with-param name="TargetNode" select="PhoneNumber" /></xsl:call-template><span style="width:1px;"></span></td>
                <td class="styDepTblCell" style="height:4.5mm;text-align:center;"><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="TaxYear" /></xsl:call-template><span style="width:1px;"></span></td>
              </tr>
          </xsl:for-each>  
      
       </tbody>
    </table> <br />     
    </xsl:if>  

    <xsl:if test="($Print = $Separated) and (count($Form3115Data/GovtCouncilContactInfo) &gt;1)">
      <span class="styRepeatingDataTitle" style="font-size:8pt;">Form 3115, Part II, Line 5a -  Enter the name and telephone number of the council for the government:</span>
      <table class="styDepTbl" cellspacing="0" style="font-size:8pt;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:100mm;">Name</th>
          <th class="styDepTblCell" scope="col" style="width:40mm;">Telephone number</th>
          <th class="styDepTblCell" scope="col" style="width:40mm;">Tax year(s)</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
      <xsl:for-each select="$Form3115Data/GovtCouncilContactInfo">
              <tr>
              <xsl:attribute name="class">
                <xsl:choose>
                   <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                   <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
                <td class="styDepTblCell" style="height:4.5mm;text-align:left;border-left:1 solid 0px;">      
                  <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Name" /></xsl:call-template>
                </td>
                <td class="styDepTblCell" style="height:4.5mm;text-align:center;"><xsl:call-template name="PopulatePhoneNumber"><xsl:with-param name="TargetNode" select="PhoneNumber" /></xsl:call-template><span style="width:1px;"></span></td>
                <td class="styDepTblCell" style="height:4.5mm;text-align:center;"><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="TaxYear" /></xsl:call-template><span style="width:1px;"></span></td>
              </tr>
          </xsl:for-each>  
      
       </tbody>
    </table> <br />     
    </xsl:if>  
    
    <xsl:if test="($Print = $Separated) and (count($Form3115Data/GrossReceipts3YrsPreceding) &gt;1)">
      <span class="styRepeatingDataTitle" style="font-size:8pt;">Form 3115, Part II, Line 17 - If the applicant is changing to or from the cash method or changing its method of accounting under sections
263A, 448, 460, or 471, enter the gross receipts of the 3 tax years preceding the year of change:</span>
      <table class="styDepTbl" cellspacing="0" style="font-size:8pt;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
            <th nowrap="nowrap" scope="col"  class="styDepTblCell" style="width:30.6mm;border-right-width:0px;">
              1st preceding<br/>year ended: mo.                   
            </th>  
            <th class="styDepTblCell" scope="col" style="border-left-width:0px;width:25mm;vertical-align:bottom;">
              yr.                  
            </th>
            <th nowrap="nowrap" scope="col" style="width:30.6mm;border-right-width:0px; " class="styDepTblCell">
              <div style="padding-left:1mm">
                2nd preceding<br/>year ended: mo.   
              </div>                        
            </th>  
            <th class="styDepTblCell" scope="col" style="width:25mm;border-left-width:0px;vertical-align:bottom;">  
              yr.                    
            </th>  
            <th nowrap="nowrap" scope="col" style="width:30.6mm;border-right-width:0px; " class="styDepTblCell">
              <div style="padding-left:1mm">
                3rd preceding<br/>year ended: mo.   
              </div>                    
            </th>    
            <th class="styDepTblCell"  scope="col" style="width:25mm;border-left-width:0px;vertical-align:bottom;">
              yr.                  
            </th>  
          </tr>  
        </thead>  
        <tfoot></tfoot>
        <tbody>
        <xsl:for-each select="$Form3115Data/GrossReceipts3YrsPreceding">
        
    <tr align="left" style="height:4mm">  
              <xsl:attribute name="class">
                <xsl:choose>
                   <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                   <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
      <td style="border-right-width:0px;text-align:right;" nowrap="nowrap" class="styDepTblCell" >                  
        $
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="GrossReceiptsFor1stPrecedingYr"/>
          </xsl:call-template><span style="width:1px;"></span>
      </td>
      <td class="styDepTblCell" style="border-left-width:0px;text-align:center;">
          <xsl:call-template name="PopulateMonth">
            <xsl:with-param name="TargetNode" select="EndDateFor1stPrecedingYear"/>
          </xsl:call-template><span style="width:2mm"></span>   
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="EndDateFor1stPrecedingYear"/>
          </xsl:call-template>
      </td>
      <td style="border-right-width:0px;text-align:right;" nowrap="nowrap" class="styDepTblCell" >                  
        <div style="padding-left:1mm">$
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="GrossReceiptsFor2ndPrecedingYr"/>
          </xsl:call-template>  
        </div>        
      </td>
      <td class="styDepTblCell" style="border-left-width:0px;text-align:center;">
        <xsl:call-template name="PopulateMonth">
          <xsl:with-param name="TargetNode" select="EndDateFor2ndPrecedingYear"/>
        </xsl:call-template><span style="width: 2mm"></span>
        <xsl:call-template name="PopulateYear">
          <xsl:with-param name="TargetNode" select="EndDateFor2ndPrecedingYear"/>
        </xsl:call-template>
      </td>    
      <td style="border-right-width:0px;text-align:right;" nowrap="nowrap" class="styDepTblCell" >                  
        <div style="padding-left:1mm">$          
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="GrossReceiptsFor3rdPrecedingYr"/>
          </xsl:call-template><span style="width:1px;"></span>
        </div>
      </td>    
      <td class="styDepTblCell" style="border-left-width:0px;text-align:center;">
       <xsl:call-template name="PopulateMonth">
          <xsl:with-param name="TargetNode" select="EndDateFor3rdPrecedingYear"/>
        </xsl:call-template><span style="width: 2mm"></span>
        <xsl:call-template name="PopulateYear">
          <xsl:with-param name="TargetNode" select="EndDateFor3rdPrecedingYear"/>
        </xsl:call-template><span style="width:1px;"></span>
      </td>      
    </tr>   
    </xsl:for-each>       </tbody>
        </table>
        <br />
    </xsl:if>  
<!-- Begin Schedule E repeating data -->
    <xsl:if test="($Print = $Separated) and (count($Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization) &gt;1)">
      <span class="styRepeatingDataTitle">Form 3115, Schedule E, Lines 1 Through 4c -  Change in Depreciation or Amortization:</span>
    <table class="styDepTbl" style="font-size:7pt;">
    <tbody>
  <xsl:for-each select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization">  
    <tr>    
      <xsl:attribute name="class">
        <xsl:choose>
           <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
           <xsl:otherwise>styDepTblRow2</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <td>
        <span style="text-align:left;" class="styGenericDiv">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="."/>              
          </xsl:call-template>
          </span><br />
        <div class="styGenericDiv">
          <div style="padding-right:1mm;font-weight:bold;width:6mm;text-align:left;padding-left:.5mm;" class="styGenericDiv">1</div>
          <div style="float:left">
            Is depreciation for the property determined under Regulations section 1.167(a)-11 (CLADR)?
          </div>  
          <div class="styIRS3115YNChxBoxDiv">  
            <span class="styDotLn" style="padding-right:0">      
              .......
            </span>    
            <span>
              <xsl:call-template name="PopulateSpan">
             <xsl:with-param name="TargetNode" select="PropertyDeprecUnderSect1167a11" />
              </xsl:call-template> 
              <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
                <xsl:call-template name="PopulateYesCheckbox">
              <xsl:with-param name="TargetNode" select="PropertyDeprecUnderSect1167a11"/>
              <xsl:with-param name="BackupName">Property Deprec Under Sect1167a11Yes</xsl:with-param>
                </xsl:call-template>
              </input>
             </span> &nbsp;          
              <label>
                <xsl:call-template name="PopulateLabelYes">
             <xsl:with-param name="TargetNode" select="PropertyDeprecUnderSect1167a11" />
             <xsl:with-param name="BackupName">Property Deprec Under Sect1167a11Yes</xsl:with-param>
                </xsl:call-template>   
                <b>Yes</b>
              </label>  
              <span style="width:3mm"></span>
              <span>
                <xsl:call-template name="PopulateSpan">
                 <xsl:with-param name="TargetNode" select="PropertyDeprecUnderSect1167a11" />
                </xsl:call-template> 
                <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="PropertyDeprecUnderSect1167a11"/>
                  <xsl:with-param name="BackupName">Property Deprec Under Sect1167a11No</xsl:with-param>
                  </xsl:call-template>
                </input>
               </span> &nbsp;          
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="PropertyDeprecUnderSect1167a11" />
                    <xsl:with-param name="BackupName">Property Deprec Under Sect1167a11No</xsl:with-param> 
                  </xsl:call-template>   
                  <b>No</b>
              </label>  
            </div>  
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
        <td>
            <div class="styGenericDiv" style="border-bottom:1 solid black;width:187mm;">
            <div style="padding-left:.5mm;padding-right:1mm;font-weight:bold;width:6mm;text-align:left;" class="styGenericDiv"></div>
            <div style="float:left">
                If   &#8220;Yes,&#8221; the only changes permitted are under Regulations section 1.167(a)-11(c)(1)(iii).
            </div> 
          </div>  
          </td>
        </tr>
            <!-- begin line 2 -->
        <tr>    
        <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <td>
        <div class="styGenericDiv">
          <div style="padding-left:.5mm;padding-right:1mm;font-weight:bold;width:6mm;text-align:left;" class="styGenericDiv">2</div>
          <div style="float:left">
                   Is any of the depreciation or amortization required to be capitalized under any Code section (e.g., section  263A)?
          </div>  
          <div class="styIRS3115YNChxBoxDiv">  
            <span class="styDotLn" style="padding-right:0">
            .      
            </span>  
            <span>
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="AnyDeprecOrAmortzRqrUnderCode" />
              </xsl:call-template>   
              <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
                <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="AnyDeprecOrAmortzRqrUnderCode"/>
               <xsl:with-param name="BackupName">Any Deprec Or Amortz Rqr Under Code Yes</xsl:with-param>
                </xsl:call-template>
              </input>
             </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="AnyDeprecOrAmortzRqrUnderCode" />
               <xsl:with-param name="BackupName">Any Deprec Or Amortz Rqr Under Code Yes</xsl:with-param>
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
            <span>
              <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="AnyDeprecOrAmortzRqrUnderCode" />
              </xsl:call-template>   
              <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="AnyDeprecOrAmortzRqrUnderCode"/>
                <xsl:with-param name="BackupName">Any Deprec Or Amortz Rqr Under Code No</xsl:with-param>  
                </xsl:call-template>
              </input>
             </span> &nbsp;          
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="AnyDeprecOrAmortzRqrUnderCode" />
                 <xsl:with-param name="BackupName">Any Deprec Or Amortz Rqr Under Code No</xsl:with-param> 
                </xsl:call-template>   
                <b>No</b>
              </label>  
          </div>    
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
      <td>
        <div class="styGenericDiv" style="border-bottom:1 solid black;width:187mm;">
          <div style="padding-left:.5mm;padding-right:1mm;font-weight:bold;text-align:left;width:6mm;" class="styGenericDiv"></div>
          <div style="float:left">
            If   &#8220;Yes,&#8221; enter the applicable section &nbsp;
            <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/> &nbsp;
            <span style="border-bottom:1 solid black; width:100mm; padding-left:1mm;text-align:left;">          
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ApplicableSection"/>
              </xsl:call-template>
            </span>
          </div> 
        </div>  
      </td>
    </tr>  
    <!-- begin line 3 -->
    <tr>    
        <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
     <td>
    <div class="styGenericDiv">
      <div style="padding-left:.5mm;padding-right:1mm;font-weight:bold;width:6mm;text-align:left;" class="styGenericDiv">3</div>
       <div style="float:left">
          Has a depreciation or amortization election been made for the property (e.g., the election under section 168(f)(1))?
        </div>  
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">     
          . 
          </span>    
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="DeprecOrAmortzElectionBeenMade" />
            </xsl:call-template> 
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
             <xsl:with-param name="TargetNode" select="DeprecOrAmortzElectionBeenMade"/>
               <xsl:with-param name="BackupName">Deprec Or Amortz Election Been MadeYes</xsl:with-param>
              </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="DeprecOrAmortzElectionBeenMade" />
             <xsl:with-param name="BackupName">Deprec Or Amortz Election Been MadeYes</xsl:with-param>
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
            <span>
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="DeprecOrAmortzElectionBeenMade" />
              </xsl:call-template> 
              <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="DeprecOrAmortzElectionBeenMade"/>
                <xsl:with-param name="BackupName">Deprec Or Amortz Election Been Made No</xsl:with-param>   
                </xsl:call-template>
              </input>
           </span> &nbsp;          
          <label>
            <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="DeprecOrAmortzElectionBeenMade" />
                 <xsl:with-param name="BackupName">Deprec Or Amortz Election Been Made No</xsl:with-param> 
            </xsl:call-template>   
            <b>No</b>
          </label>
        </div>  
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
        <td>
          <div class="styGenericDiv" style="border-bottom:1 solid black;width:187mm;">
        <div style="padding-left:.5mm;padding-right:1mm;font-weight:bold;width:6mm;" class="styGenericDiv"></div>
        <div style="float:left">
          If   &#8220;Yes,&#8221; state the election made &nbsp;
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/> &nbsp;
        <span style="border-bottom:1 solid black; width:106mm; padding-left:1mm;text-align:left;"> 
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ElectionMade"/>
          </xsl:call-template>
        </span>
    </div>
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
        <td>
      <!-- Begin line 4a -->
          <div class="styGenericDiv" style="border-bottom:1 solid black;width:187mm;">
            <div style="padding-left:.5mm;padding-right:1mm;font-weight:bold;width:6mm;text-align:left;" class="styGenericDiv">4a</div>
            <div style="float:left;text-align:left;">
            To the extent not already provided, attach a statement describing the property being changed. Include in the description the<br/>type of property, the year the property was placed in                       service, and the property's use in the applicant&#39;s trade or business or<br/>income-producing activity.
            </div>
          </div>            
        </td>      
      </tr>
  
<!-- Begin line 4b -->
         <tr>    
        <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <td>
      <div class="styGenericDiv" style="border-bottom:1 solid black;width:187mm;">
        <div style="padding-left:2.5mm;padding-right:1mm;font-weight:bold;width:6mm;text-align:left;" class="styGenericDiv">b</div>
        <div style="float:left;text-align:left;">
            If the property is residential rental property, did the applicant live in the property before renting it?        
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ......
          </span>
      	  <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="LivedInPropertyBeforeRentingIt" />
                </xsl:call-template>     
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="LivedInPropertyBeforeRentingIt"/>
                 <xsl:with-param name="BackupName">Lived In Property Before Renting It Yes</xsl:with-param>
              </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="LivedInPropertyBeforeRentingIt" />
                    <xsl:with-param name="BackupName">Lived In Property Before Renting It Yes</xsl:with-param>
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
      		<span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="LivedInPropertyBeforeRentingIt" />
                </xsl:call-template>     
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="LivedInPropertyBeforeRentingIt"/>
                   <xsl:with-param name="BackupName">Lived In Property Before Renting It No</xsl:with-param> 
              </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="LivedInPropertyBeforeRentingIt" />
                    <xsl:with-param name="BackupName">Lived In Property Before Renting It No</xsl:with-param>
              </xsl:call-template>   
              <b>No</b>
            </label>  
        </div>    
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
        <td>
    <div class="styGenericDiv" style="border-bottom:1 solid black;width:187mm;">
        <xsl:if test="position() = last()">
          <xsl:attribute name="style">width:187mm;</xsl:attribute>
        </xsl:if>
        <div style="padding-left:2.5mm;padding-right:1mm;font-weight:bold;width:6mm;text-align:left;" class="styGenericDiv">c</div>
        <div style="float:left;text-align:left;">
            Is the property public utility property?        
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ..........................
          </span>    
          <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="PublicUtilityProperty" />
                </xsl:call-template> 
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="PublicUtilityProperty"/>
                    <xsl:with-param name="BackupName">Public Utility Property Yes</xsl:with-param>
              </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="PublicUtilityProperty" />
                   <xsl:with-param name="BackupName">Public Utility Property Yes</xsl:with-param>
                </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
            <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="PublicUtilityProperty" />
                </xsl:call-template> 
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="PublicUtilityProperty"/>
                    <xsl:with-param name="BackupName">Public Utility Property No</xsl:with-param>
                 </xsl:call-template>
            </input>
           </span> &nbsp;          
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="PublicUtilityProperty" />
                    <xsl:with-param name="BackupName">Public Utility Property No</xsl:with-param>
                        </xsl:call-template>   
              <b>No</b>
            </label>  
        </div>  
    </div>
            
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

<xsl:template name="leftOverTbl">  
  <xsl:param name="itemName" />
  <xsl:param name="desc" />  
  <xsl:param name="lineNum" />  
  <xsl:param name="colTitle" />      
  <xsl:if test="count($itemName) &gt; 0">
    <br/><br/>
    <div class="styDepTitleLine" style="width:187mm">
      <span class="styDepTitle" style="font-size:10pt; padding-right:2mm">        
        <xsl:value-of select="$desc"/>                
      </span>
    </div>
    <br/>
    <table class="styDepTbl" style="width:187mm; font-size:8pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" colspan="2">
             <xsl:value-of select="$colTitle"/>      
          </th>
        </tr>
        <tr class="styDepTblHdr">          
           <th class="styDepTblCell" scope="col">Beginning Date</th>
           <th class="styDepTblCell" scope="col">Ending date</th>
        </tr>
      </thead>    
      <tbody>
        <xsl:for-each select="$itemName">
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>              
            <td class="styDepTblCell">              
              <xsl:if test="$lineNum = '4a'">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ExaminationPeriodBeginningDate" />
                </xsl:call-template>  
              </xsl:if>
              <xsl:if test="$lineNum = '4b'">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CnsdrOrSuspBeginningDate" />
                </xsl:call-template>
              </xsl:if>      
              <xsl:if test="$lineNum = '4c'">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="IssuePendingExamBeginningDate" />
                </xsl:call-template>
              </xsl:if>                      
            </td>
            <td class="styDepTblCell">                  
              <xsl:if test="$lineNum = '4a'">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ExaminationPeriodEndingDate" />
                </xsl:call-template>  
              </xsl:if>
              <xsl:if test="$lineNum = '4b'">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CnsdrOrSuspEndingDate" />
                </xsl:call-template>
              </xsl:if>    
              <xsl:if test="$lineNum = '4c'">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="IssuePendingExamEndingDate" />
                </xsl:call-template>
              </xsl:if>                    
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:if>  
</xsl:template>

<xsl:template name="prt2Template">  
  <xsl:param name="index" select="1"/>  
  <xsl:param name="max" />  
  <xsl:param name="thisElement" />
  <xsl:if test="$index &lt;= $max">    
    <tr align="left">                      
      <td style="width:10mm">
        Name
      </td>  
      <td style="width:3mm" align="center">
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      </td>
      <td style="border-bottom:1 solid black; width:62mm" class="stySmallText">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$thisElement[$index]/Name"/>
        </xsl:call-template>
      </td>
      <td style="width:30mm" nowrap="nowrap" align="center">
        Telephone number
      </td>  
      <td style="width:3mm;" align="center">
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      </td>
      <td style="border-bottom:1 solid black; width:21mm" align="center">
        <xsl:call-template name="PopulatePhoneNumber">
          <xsl:with-param name="TargetNode" select="$thisElement[$index]/PhoneNumber"/>
        </xsl:call-template>
      </td>
      <td style="width:19mm" nowrap="nowrap" align="center">
        Tax year(s)
      </td>  
      <td style="width:3mm" align="center">
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      </td>
      <td style="border-bottom:1 solid black; width:14mm" align="center">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$thisElement[$index]/TaxYear"/>
        </xsl:call-template>
      </td>
      <td class="styIRS3115TblRB" style="border-bottom:0; width:2.7mm">&nbsp;</td>
      <td class="styIRS3115TblRB" style="border-bottom:0; background-color:lightgrey; width:6.3mm">&nbsp;</td>                
      <td style="border-bottom:0; background-color:lightgrey">&nbsp;</td>
    </tr>                
    <xsl:call-template name="prt2Template">      
      <xsl:with-param name="index" select="$index + 1"/>
      <xsl:with-param name="max" select="$max"/>
      <xsl:with-param name="thisElement" select="$thisElement"/>
    </xsl:call-template>  
  </xsl:if>                  
</xsl:template>    
  
<xsl:template name="line17Template">  
  <xsl:param name="index" select="1"/>  
  <xsl:param name="max" />
  <xsl:param name="IsSeparated" select=" 'no' " />  
  <xsl:if test="$index &lt;= $max">    
    <tr align="left" style="height:4mm">                      
      <td>                  
        <xsl:attribute name="style">  
          <xsl:choose>
            <xsl:when test="$index = $max">
              border-bottom:0
            </xsl:when>
            <xsl:otherwise>
              border-bottom:1 solid black
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>     
        $
        <xsl:if test="$IsSeparated = 'yes' ">
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
            <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts3YrsPreceding"/>                      
          </xsl:call-template>
        </xsl:if>
        <xsl:if test="$IsSeparated != 'yes' ">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts3YrsPreceding[$index]/GrossReceiptsFor1stPrecedingYr"/>
          </xsl:call-template><span style="width:1px;"></span>
        </xsl:if>
      </td>
      <td class="styIRS3115TblRB">
        <xsl:attribute name="style">  
          <xsl:choose>
            <xsl:when test="$index = $max">
              border-bottom:0
            </xsl:when>
            <xsl:otherwise>
              border-bottom:1 solid black
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute> 
        <xsl:if test="$IsSeparated != 'yes' ">
          <xsl:call-template name="PopulateMonth">
            <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts3YrsPreceding[$index]/EndDateFor1stPrecedingYear"/>
          </xsl:call-template><span style="width:2mm"></span>   
        </xsl:if>
        <xsl:if test="$IsSeparated != 'yes' ">
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts3YrsPreceding[$index]/EndDateFor1stPrecedingYear"/>
          </xsl:call-template>
        </xsl:if> <span style="width:1px;"></span>
      </td>
      <td style="border-bottom:1">                  
        <xsl:attribute name="style">  
          <xsl:choose>
            <xsl:when test="$index = $max">
              border-bottom:0
            </xsl:when>
            <xsl:otherwise>
              border-bottom:1 solid black
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>   
        <div style="padding-left:1mm">$
        <xsl:if test="$IsSeparated != 'yes' ">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts3YrsPreceding[$index]/GrossReceiptsFor2ndPrecedingYr"/>
          </xsl:call-template>  
        </xsl:if><span style="width:1px;"></span>
        </div>        
      </td>
      <td class="styIRS3115TblRB">
        <xsl:attribute name="style">  
          <xsl:choose>
            <xsl:when test="$index = $max">
              border-bottom:0
            </xsl:when>
            <xsl:otherwise>
              border-bottom:1 solid black
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>   
        <xsl:if test="$IsSeparated != 'yes' ">
        <xsl:call-template name="PopulateMonth">
          <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts3YrsPreceding[$index]/EndDateFor2ndPrecedingYear"/>
        </xsl:call-template><span style="width: 2mm"></span>
        <xsl:call-template name="PopulateYear">
          <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts3YrsPreceding[$index]/EndDateFor2ndPrecedingYear"/>
        </xsl:call-template>
        </xsl:if><span style="width:1px;"></span>
      </td>    
      <td style="border-bottom:1" nowrap="nowrap">                  
        <xsl:attribute name="style">  
          <xsl:choose>
            <xsl:when test="$index = $max">
              border-bottom:0
            </xsl:when>
            <xsl:otherwise>
              border-bottom:1 solid black
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>   
        <div style="padding-left:1mm">$          
        <xsl:if test="$IsSeparated != 'yes' ">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts3YrsPreceding[$index]/GrossReceiptsFor3rdPrecedingYr"/>
          </xsl:call-template><span style="width:1px;"></span>
          </xsl:if>
        </div>
      </td>    
      <td class="styIRS3115TblRB">
        <xsl:attribute name="style">  
          <xsl:choose>
            <xsl:when test="$index = $max">
              border-bottom:0
            </xsl:when>
            <xsl:otherwise>
              border-bottom:1 solid black
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>       
         <xsl:if test="$IsSeparated != 'yes' ">
       <xsl:call-template name="PopulateMonth">
          <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts3YrsPreceding[$index]/EndDateFor3rdPrecedingYear"/>
        </xsl:call-template><span style="width: 2mm"></span>
        <xsl:call-template name="PopulateYear">
          <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts3YrsPreceding[$index]/EndDateFor3rdPrecedingYear"/>
        </xsl:call-template>
        </xsl:if><span style="width:1px;"></span>
      </td>      
      <td class="styIRS3115TblRB" style="border-bottom:0; background-color:lightgrey">&nbsp;</td>                
      <td style="border-bottom:0; background-color:lightgrey">&nbsp;</td>
    </tr>                
    <xsl:call-template name="line17Template">      
      <xsl:with-param name="index" select="$index + 1"/>
      <xsl:with-param name="max" select="$max"/>
    </xsl:call-template>  
  </xsl:if>                  
</xsl:template>

<xsl:template name="SchETemplate">  
  <xsl:param name="index" select="1"/>  
  <xsl:param name="max" />
  <xsl:param name="IsSeparated">no</xsl:param>  
  <!-- Added the IsSeparated param as the same template is used to show the empty rows when the data is set to show in the separated table and also to show the data when the separated is not set to true.  So, this parameter acts as a switch controlling when to show the data and when not to show the data.  By default it is set to "no' which indicates data will be shown.  This parameter is set to true when the separated flag has evaluated to true  -->
  <xsl:if test="$index &lt;= $max">    
    <tr>
      <td colspan="4">
       <xsl:if test="$IsSeparated = 'no' ">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]"/>              
          </xsl:call-template>
        </xsl:if>
      </td>
    </tr>
    <tr align="left">                
      <td style="width:1.5mm"></td>
      <th scope="row" align="left">1</th>
      <td style="width:1mm"></td>
      <td>
        <div style="float:left">
          Is depreciation for the property determined under Regulations section 1.167(a)-11 (CLADR)?
        </div>  
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ....
          </span>    
      <span>
               <xsl:if test="$IsSeparated = 'no' ">
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PropertyDeprecUnderSect1167a11" />
             <xsl:with-param name="BackupName">PropertyDeprecUnderSect1167a11</xsl:with-param> 
                </xsl:call-template> 
              </xsl:if>
              <input type="Checkbox" style="height:3.5mm;" class="styCkbox" id="PropertyDeprecUnderSect1167a11yes">
                     <xsl:if test="$IsSeparated = 'no' ">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PropertyDeprecUnderSect1167a11"/>
             <xsl:with-param name="BackupName">PropertyDeprecUnderSect1167a11Yes</xsl:with-param>   
              </xsl:call-template>
              </xsl:if>
            </input>
           </span> &nbsp;          
            <label for="PropertyDeprecUnderSect1167a11yes">
                   <xsl:if test="$IsSeparated = 'no' ">
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PropertyDeprecUnderSect1167a11" />
                   <xsl:with-param name="BackupName">PropertyDeprecUnderSect1167a11Yes</xsl:with-param>           
          </xsl:call-template> 
              </xsl:if>
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
      <span>
             <xsl:if test="$IsSeparated = 'no' ">

                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PropertyDeprecUnderSect1167a11" />
                </xsl:call-template> 
              </xsl:if>
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox" id="PropertyDeprecUnderSect1167a11no">
                   <xsl:if test="$IsSeparated = 'no' ">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PropertyDeprecUnderSect1167a11"/>
                  <xsl:with-param name="BackupName">PropertyDeprecUnderSect1167a11No</xsl:with-param>            
              </xsl:call-template>
              </xsl:if>
            </input>
           </span> &nbsp;          
            <label for="PropertyDeprecUnderSect1167a11no">
                   <xsl:if test="$IsSeparated = 'no' ">
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PropertyDeprecUnderSect1167a11" />
                     <xsl:with-param name="BackupName">PropertyDeprecUnderSect1167a11No</xsl:with-param>             
              </xsl:call-template>   
              </xsl:if>
              <b>No</b>
            </label>  
        </div>        
      </td>      
    </tr>      
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td>
        If   &#8220;Yes,&#8221; the only changes permitted are under Regulations section 1.167(a)-11(c)(1)(iii).
      </td>
    </tr>  
    <tr>  
      <td></td>
      <th scope="row" align="left">2</th>
      <td></td>
      <td>
        Is any of the depreciation or amortization required to be capitalized under any Code section (e.g., section
      </td>
    </tr>  
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td>
        <div style="float:left">
          263A)?
        </div>  
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            .................................
          </span>  
      <span>
                <xsl:if test="$IsSeparated = 'no' ">
               <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/AnyDeprecOrAmortzRqrUnderCode" />
                </xsl:call-template>
              </xsl:if>   
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
                <xsl:if test="$IsSeparated = 'no' ">
             <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/AnyDeprecOrAmortzRqrUnderCode"/>
             <xsl:with-param name="BackupName">AnyDeprecOrAmortzRqrUnderCodeYes</xsl:with-param>   
              </xsl:call-template>
            </xsl:if>
            </input>
           </span> &nbsp;          
            <label>
                 <xsl:if test="$IsSeparated = 'no' ">
            <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/AnyDeprecOrAmortzRqrUnderCode" />

             <xsl:with-param name="BackupName">AnyDeprecOrAmortzRqrUnderCodeYes</xsl:with-param>   
              </xsl:call-template>
            </xsl:if>   
              <b>Yes</b>
            </label>  
            <span style="width:2mm"></span>
      <span>
                  <xsl:if test="$IsSeparated = 'no' ">
             <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/AnyDeprecOrAmortzRqrUnderCode" />
                </xsl:call-template> 
              </xsl:if>  
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
               <xsl:if test="$IsSeparated = 'no' ">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/AnyDeprecOrAmortzRqrUnderCode"/>
        <xsl:with-param name="BackupName">AnyDeprecOrAmortzRqrUnderCodeNo</xsl:with-param>
              </xsl:call-template>
            </xsl:if>
            </input>
           </span> &nbsp;          
            <label>
               <xsl:if test="$IsSeparated = 'no' ">
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/AnyDeprecOrAmortzRqrUnderCode" />
          <xsl:with-param name="BackupName">AnyDeprecOrAmortzRqrUnderCodeNo</xsl:with-param>
              </xsl:call-template>
              </xsl:if>   
              <b>No</b>
            </label>  
        </div>    
      </td>
    </tr>  
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td>
        If   &#8220;Yes,&#8221; enter the applicable section &nbsp;
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/> &nbsp;
        <span style="border-bottom:1 solid black; width:100mm; padding-left:1mm">
         <xsl:if test="$IsSeparated = 'no' ">          
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/ApplicableSection"/>
          </xsl:call-template>
        </xsl:if>
         <xsl:if test="$IsSeparated = 'yes' ">
           See Additional Data Table for Lines 1 Through 4c.
         </xsl:if>          
        </span>
      </td>
    </tr>
    <tr>  
      <td></td>
      <th scope="row" align="left">3</th>
      <td></td>
      <td>
      Has a depreciation, amortization, or expense election been made for the property (e.g., the election under
      </td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td>
        <div style="float:left">
        sections 168(f)(1), 179, or 179C)?
        </div>  
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            .........................
          </span>    
      <span>
         <xsl:if test="$IsSeparated = 'no' ">          
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DeprecOrAmortzElectionBeenMade" />
                </xsl:call-template> 
              </xsl:if>
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
         <xsl:if test="$IsSeparated = 'no' ">          
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DeprecOrAmortzElectionBeenMade"/>
         <xsl:with-param name="BackupName">DepreOrAmortzElectionBeenMadeYes</xsl:with-param>  
              </xsl:call-template>
            </xsl:if>
            </input>
           </span> &nbsp;          
            <label>
         <xsl:if test="$IsSeparated = 'no' ">          
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DeprecOrAmortzElectionBeenMade" />
              <xsl:with-param name="BackupName">DepreOrAmortzElectionBeenMadeYes</xsl:with-param>
              </xsl:call-template>
            </xsl:if>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
      <span>
         <xsl:if test="$IsSeparated = 'no' ">          
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DeprecOrAmortzElectionBeenMade" />
                </xsl:call-template> 
              </xsl:if>
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
         <xsl:if test="$IsSeparated = 'no' ">          
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DeprecOrAmortzElectionBeenMade"/>
          <xsl:with-param name="BackupName">DepreOrAmortzElectionBeenMadeNo</xsl:with-param>  
              </xsl:call-template>
            </xsl:if>
            </input>
           </span> &nbsp;          
            <label>
         <xsl:if test="$IsSeparated = 'no' ">          
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DeprecOrAmortzElectionBeenMade" />
               <xsl:with-param name="BackupName">DepreOrAmortzElectionBeenMadeNo</xsl:with-param>  
              </xsl:call-template>   
            </xsl:if>
              <b>No</b>
            </label>
        </div>  
      </td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td>
        If   &#8220;Yes,&#8221; state the election made &nbsp;
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/> &nbsp;
        <span style="border-bottom:1 solid black; width:106mm; padding-left:1mm"> 
         <xsl:if test="$IsSeparated = 'no' ">          
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/ElectionMade"/>
          </xsl:call-template>
        </xsl:if>
        </span>
      </td>
    </tr>
    <tr>  
      <td></td>
      <th scope="row" valign="top">4a</th>
      <td></td>
      <td>
        To the extent not already provided, attach a statement describing the property being changed. Include in the description the<br/>type of property, the year the property was placed in service, and the property's use in the applicant&#39;s trade or business or<br/>income-producing activity.
      </td>
    </tr>
    <tr>  
      <td></td>
      <th scope="row" align="right">b</th>
      <td></td>
      <td>
        <div style="float:left">
          If the property is residential rental property, did the applicant live in the property before renting it?
        </div>  
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ..
          </span>
          <span>
           <xsl:if test="$IsSeparated = 'no' ">          
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/LivedInPropertyBeforeRentingIt" />
              </xsl:call-template>    
            </xsl:if> 
             <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
               <xsl:if test="$IsSeparated = 'no' ">          
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/LivedInPropertyBeforeRentingIt"/>
           <xsl:with-param name="BackupName">Lived In Property Before Renting It Yes</xsl:with-param>       
                  </xsl:call-template>
                </xsl:if>
              </input>
           </span> &nbsp;          
            <label>
               <xsl:if test="$IsSeparated = 'no' ">          
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/LivedInPropertyBeforeRentingIt" />
                          <xsl:with-param name="BackupName">Lived In Property Before Renting It Yes</xsl:with-param>    
                </xsl:call-template>   
              </xsl:if>
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
            <span>
             <xsl:if test="$IsSeparated = 'no' ">          
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/LivedInPropertyBeforeRentingIt" />
                </xsl:call-template> 
              </xsl:if>    
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
               <xsl:if test="$IsSeparated = 'no' ">          
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/LivedInPropertyBeforeRentingIt"/>
                     <xsl:with-param name="BackupName">Lived In Property Before Renting It No</xsl:with-param>           
                  </xsl:call-template>
                </xsl:if>
            </input>
           </span> &nbsp;          
            <label>
               <xsl:if test="$IsSeparated = 'no' ">          
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/LivedInPropertyBeforeRentingIt" />
                           <xsl:with-param name="BackupName">Lived In Property Before Renting It No</xsl:with-param>   
                </xsl:call-template>   
              </xsl:if>
              <b>No</b>
            </label>  
        </div>    
      </td>
    </tr>
    <tr>  
      <td></td>
      <th scope="row" align="right">c</th>
      <td></td>
      <td>
        <div style="float:left">
          Is the property public utility property?
        </div>  
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ......................
          </span>    
          <span>
           <xsl:if test="$IsSeparated = 'no' ">          
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PublicUtilityProperty" />
                </xsl:call-template> 
            </xsl:if>
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
               <xsl:if test="$IsSeparated = 'no' ">          
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PublicUtilityProperty"/>
      <xsl:with-param name="BackupName"> Public Utility Property Yes</xsl:with-param>          
                  </xsl:call-template>
                </xsl:if>
            </input>
           </span> &nbsp;          
            <label>
               <xsl:if test="$IsSeparated = 'no' ">          
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PublicUtilityProperty" />
                <xsl:with-param name="BackupName"> Public Utility Property Yes</xsl:with-param>      
                  </xsl:call-template>   
                </xsl:if>
              <b>Yes</b>
            </label>  
            <span style="width:3mm"></span>
              <span>
               <xsl:if test="$IsSeparated = 'no' ">          
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PublicUtilityProperty" />
                  </xsl:call-template> 
              </xsl:if>
              <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
               <xsl:if test="$IsSeparated = 'no' ">          
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PublicUtilityProperty"/>
            <xsl:with-param name="BackupName"> Public Utility Property No</xsl:with-param>          
                  </xsl:call-template>
                </xsl:if>
              </input>
             </span> &nbsp;          
              <label>
               <xsl:if test="$IsSeparated = 'no' ">          
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PublicUtilityProperty" />
              <xsl:with-param name="BackupName"> Public Utility Property No</xsl:with-param>        
                  </xsl:call-template>
                </xsl:if>   
                <b>No</b>
              </label>  
        </div>  
      </td>
    </tr>   
    <xsl:call-template name="SchETemplate">      
      <xsl:with-param name="index" select="$index + 1"/>
      <xsl:with-param name="max" select="$max"/>
    </xsl:call-template>  
  </xsl:if> 
                   
</xsl:template>

<xsl:template name="IRS3115Footer">  
  <xsl:param name="thisPage" />    
  <div style="width:187mm; border-top:2 solid black; page-break-after:always">  
    <xsl:if test="$thisPage = 2">
      <div style="font-weight:bold; float:left; font-size:8pt; ">
        For Privacy Act and Paperwork Reduction Act Notice, see the instructions.
      </div>    
    </xsl:if>           
    <div style="float:right; font-size:7pt">
      <xsl:if test="$thisPage = 2">
        <span style="margin-right:10mm">Cat. No. 19280E</span>
      </xsl:if>       
      Form <b style="font-size:9pt">3115</b> (Rev. 12-2009)
    </div>      
  </div>  
  <xsl:if test="$thisPage != 9">
    <div style="width:187mm; font-size:7pt">    
      <div style="float:left">
        Form 3115 (Rev. 12-2009)
      </div>    
      <div style="float:right; font-size:7pt">
        Page <b style="font-size:9pt"><xsl:value-of select="$thisPage" /></b> 
      </div>      
    </div>  
  </xsl:if> 
</xsl:template>

</xsl:stylesheet>