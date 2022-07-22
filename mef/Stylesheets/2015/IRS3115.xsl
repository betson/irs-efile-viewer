<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS3115Style.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*"/>
<xsl:param name="Form3115Data" select="$RtnDoc/IRS3115"/>
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
  <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>    
    <title>
      <xsl:call-template name="FormTitle">
        <xsl:with-param name="RootElement" select="local-name($Form3115Data)">
      </xsl:with-param></xsl:call-template>
    </title>
    <!-- No Browser Caching  -->
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!-- No Proxy Caching   -->
    <meta http-equiv="Cache-Control" content="private"/>        
    <meta name="Description" content="Form 3115"/>
    <meta name="Generator" content="IBM WebSphere Studio"/>
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
    <xsl:call-template name="InitJS"/>
    <style type="text/css">    
		 <xsl:if test="not($Print) or $Print=''">
			<xsl:call-template name="IRS3115Style"/>    
			<xsl:call-template name="AddOnStyle"/>  
		</xsl:if>
    </style>        
    <xsl:call-template name="GlobalStylesForm"/>
  </head>
   <body class="styBodyClass">      
    <form style="font-family:arial; font-size:9pt" name="Form3115">      
      <xsl:call-template name="DocumentHeader"/>  
      <div class="styTBB" style="width:187mm">
        <div style="float:left; width:31mm; font-size:7pt">    
          Form  
          <span class="styFormNumber">3115</span>
           <div>(Rev. December 2015)
            <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data"/>              
          </xsl:call-template>    
           </div>        
          <div style="font-size:6pt">        
            Department of the Treasury<br/>Internal Revenue Service
          </div>            
        </div>
        <div class="styMainTitle" style="float:left; border-left:1px solid black; border-right:1px solid black; width:125mm; height:17.5mm; text-align:center; padding-top:7mm;">
          Application for Change in Accounting Method          
			<span style="text-align:center;margin-left:0mm;font-weight:bold;font-size: 8pt">
				<img src="{$ImagePath}/3115_Bullet.gif" alt="MediumBullet"/> 
				Information about Form 3115 and its separate instructions is at 
				<a href="http://www.irs.gov/form3115" title="Link to IRS.gov">
					<i>www.irs.gov/form3115</i>
				</a>.
			</span>
        </div>
       <div style="float:left; font-size:7pt; width:31mm; padding-top:8mm; text-align:center">
          OMB No. 1545-0152
        </div>
      </div>      
       <div class="styBB" style="width:187mm; font-size:8pt">
        <div style="float:left; width:108mm; height:16mm; border-right:1px solid black">
          Name of filer (name of parent corporation if a consolidated group) (see instructions)
          <div style="padding-left:1mm;">          
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param></xsl:call-template><br/>
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param></xsl:call-template>
          </div>    
        </div>
        <div style="float:left; padding-left:2mm; height:8mm;width:79mm;">
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
            <xsl:if test="not($Form3115Data/MissingSSNEINReasonCd='' or not($Form3115Data/MissingSSNEINReasonCd))">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form3115Data/MissingSSNEINReasonCd"/>
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
        <div style="float:left; padding-left:2mm; border-top:1px solid black;width:79mm;">
          Principal business activity code number (see instructions)
          <div style="text-align:left; width:100%; font-size: 8pt">
          
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/PrincipalBusinessActivityCd"/>
            </xsl:call-template>    
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/InactivePrincipalBusActyCd"/>
            </xsl:call-template>                            
     </div>
        </div>
      </div>          
       <div class="styBB" style="width:187mm">
        <div style="float:left; font-size:8pt; width:108mm; height:10mm; border-right:1px solid black">
          Number, street, and room or suite no. If a P.O. box, see the instructions.
          <br />
          <div style="padding-left:1mm; line-height:100%; font-size: 8pt">          
              <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param></xsl:call-template><br/>
              <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param></xsl:call-template>
          </div>    
        </div>
        <div style="float:left; font-size:8pt; padding-left:2mm; height:5mm;width:79mm;">
          <span style="float:left">
            Tax year of change begins (MM/DD/YYYY)
          </span>
          <span style="float:right; margin-right:2mm; font-size:8pt">
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="$Form3115Data/TaxYearBeginDt"/>
            </xsl:call-template>                            
          </span>
        </div>
        <div style="float:left; font-size:8pt; padding-left:2mm; border-top:1px solid black; width:79mm; height: 5mm">
          <span style="float:left">
            Tax year of change ends (MM/DD/YYYY)
          </span>
          <span style="float:right; margin-right:2mm; font-size:8pt">
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="$Form3115Data/TaxYearEndDt"/>
            </xsl:call-template>                            
          </span>
        </div>
      </div>        
       <div class="styBB" style="width:187mm">
        <div style="float:left; font-size:8pt; width:108mm; height:10mm; border-right:1px solid black">
          City or town, state, country and ZIP code
          <br />
          <div style="padding-left:1mm; line-height:100%">                                
              <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param></xsl:call-template>
              <span style="width:1mm;"/>
              <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">CountryCd</xsl:with-param></xsl:call-template>
          </div>    
        </div>
        <div style="float:left; font-size:8pt; padding-left:2mm; height:10mm">
          Name of contact person (see instructions)
          <br />
          <div style=" padding-top:1mm">                            
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ContactPersonNm"/>
            </xsl:call-template>            
          </div>    
        </div>        
      </div>  
       <div class="styBB" style="width:187mm">
        <!--div style="float:left; font-size:8pt; width:139mm; height:10mm; border-right:1px solid black;"-->
   
          <div style="padding-left:1mm; line-height:100%; float:left;width:112mm;font-size:8pt; ">    
               Name of applicant(s) (if different than filer) and identification number(s) <span style="font-size:6pt">(see instructions)</span>
            <xsl:choose>                        
              <xsl:when test="normalize-space($Form3115Data/BusinessName) != ''">
                       <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/BusinessName/BusinessNameLine1Txt"/>
                </xsl:call-template>
                <xsl:if test="normalize-space($Form3115Data/BusinessName/BusinessNameLine2Txt) != ''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/BusinessName/BusinessNameLine2Txt"/>
                  </xsl:call-template>                                                        
                </xsl:if>  
              </xsl:when>    
              <xsl:otherwise>    
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/PersonNm"/>
                </xsl:call-template>                
              </xsl:otherwise>    
            </xsl:choose>      
          </div>
          <div style=" padding-right:1mm;padding-left:1mm;width:27mm;text-align:right;font-size:7pt;border-right:1px solid black;height:10mm;">
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
        <!--/div-->  
        <div style="float:left; font-size:8pt; padding-left:2mm; height:10mm;width:48mm;float:right;">
          Contact person's telephone number
          <div style="padding-top:1mm">    
            <xsl:call-template name="PopulatePhoneNumber">
              <xsl:with-param name="TargetNode" select="$Form3115Data/TelephoneNum"/>
            </xsl:call-template>  
          </div>    
        </div>        
      </div>  
       <div class="styBB" style="width:187mm; height:5mm">        
        <span style="float:left">
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsMemberOfConsolidatedGroupInd"/>
            <xsl:with-param name="BackupName">Is Member Of Consolidated Group</xsl:with-param>  
            </xsl:call-template>   
            If the applicant is a member of a consolidated group, check this box
          </label>
        </span>
        <span style="float:right; margin-right:15mm">
          <span class="styDotLn" style="padding-right:5mm">      
            ..............
            <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IsMemberOfConsolidatedGroupInd"/>
          </xsl:call-template><span style="width:3px;" />     
            <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
          </span>            
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IsMemberOfConsolidatedGroupInd"/>
            </xsl:call-template>
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IsMemberOfConsolidatedGroupInd"/>
                <xsl:with-param name="BackupName">Is Member Of Consolidated Group</xsl:with-param>
              </xsl:call-template>
            </input>    
          </span>                       
        </span>              
      </div>
      <!-- ************************************************************************************  -->
        <div style="width:187mm">If <b>Form 2848</b>, Power of Attorney and Declaration of Representative, is attached (see instructions for when Form 2848 is required), </div>
      <!-- ************************************************************************************  -->
         <div class="styBB" style="width:187mm; height:5mm">        
        <span style="float:left">
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ApplicantAttachedFormInd"/>
             <xsl:with-param name="BackupName">Has Applicant Attached Form2848</xsl:with-param> 
            </xsl:call-template> check this box                      
          </label>
        </span>
        <span style="float:right; margin-right:15mm">
          <span class="styDotLn" style="padding-right:5mm">      
            .............................    
            <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>          
          </span>          
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ApplicantAttachedFormInd"/>
            </xsl:call-template>
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/ApplicantAttachedFormInd"/>
               <xsl:with-param name="BackupName">Has Applicant Attached Form2848</xsl:with-param> 
              </xsl:call-template>
            </input>  
          </span>
        </span>    
      </div>
      <!-- ************************************************************************************  -->
       <div class="styBB" style="width:187mm">
        <div style="float:left; width:108mm; border-right:1px solid black; padding-bottom:0.5mm">
          <b>Check the box to indicate the type of applicant.</b>          
          <div style="float:left; width:59mm; margin-top:2mm">    
            <div style="width:100%">      
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/IndividualInd"/>
                    <xsl:with-param name="BackupName">Who Is Filing Form/Individual</xsl:with-param>
                  </xsl:call-template>
                </input>  
              </div>
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/IndividualInd"/>
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
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/CorporationInd"/>
                 <xsl:with-param name="BackupName">Who Is Filing FormCorporation</xsl:with-param>   
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/CorporationInd"/>
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
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/ControlledForeignCorpInd"/>
                    <xsl:with-param name="BackupName">Controlled Foreign Corporation</xsl:with-param>   
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">  
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/ControlledForeignCorpInd"/>
                     <xsl:with-param name="BackupName">Controlled Foreign Corporation</xsl:with-param>  
                  </xsl:call-template>   
                  Controlled foreign corporation<span style="font-size: 6.5pt">(Sec. 957)</span>
                </label>  
              </div>    
            </div>
            <div style="margin-top:0.5mm">
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/Corporation1050Ind"/>
                   <xsl:with-param name="BackupName">Corporation1050</xsl:with-param>  
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/Corporation1050Ind"/>
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
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/QualifiedPersonalSrvcCorpInd"/>
                    <xsl:with-param name="BackupName">Qualified Personal Service Corp</xsl:with-param>
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">  
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/QualifiedPersonalSrvcCorpInd"/>
                 <xsl:with-param name="BackupName">Qualified Personal Service Corp</xsl:with-param>   
                  </xsl:call-template>   
                  Qualified personal service<br/>corporation (Sec. 448(d)(2))
                </label>  
              </div>                        
            </div>
          </div>
           <div style="float:left; margin-top:2mm;width:48mm;">  
            <div style="width:100%">
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/CooperativeInd"/>
                 <xsl:with-param name="BackupName">Cooperative</xsl:with-param>   
                  </xsl:call-template>
                </input>  
              </div>
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/CooperativeInd"/>
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
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/PartnershipInd"/>
                   <xsl:with-param name="BackupName">Partnership</xsl:with-param>   
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/PartnershipInd"/>
                    <xsl:with-param name="BackupName">Partnership</xsl:with-param> 
                  </xsl:call-template>   
                  Partnership
                </label>  
              </div>
            </div>    
            <br/>
            <div style="margin-top:0.5mm">  
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/SCorporationInd"/>
                  <xsl:with-param name="BackupName">SCorporation</xsl:with-param>   
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">  
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/SCorporationInd"/>
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
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/InsuranceCompanySect816aInd"/>
                    <xsl:with-param name="BackupName">Insurance Company Sect816a</xsl:with-param>   
                  </xsl:call-template>
                </input>  
              </div>            
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/InsuranceCompanySect816aInd"/>
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
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/InsuranceCompanySect831Ind"/>
                    <xsl:with-param name="BackupName">Insurance Company Sect831</xsl:with-param>  
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/InsuranceCompanySect831Ind"/>
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
                  <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/OtherApplicantTypeInd"/>
                   <xsl:with-param name="BackupName">Other Applicant Type</xsl:with-param>
                  </xsl:call-template>
                </input>  
                <label>
                  <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/OtherApplicantTypeInd"/>
                   <xsl:with-param name="BackupName">Other Applicant Type</xsl:with-param> 
                  </xsl:call-template>   
                  Other (specify) <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>                                     
                </label>  
                <span style="border-bottom:1px solid black; width:14mm;font-size:8pt;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/OtherApplicantTypeInd/@desc"/>
                  </xsl:call-template>  
                </span>
              </div>      
            </div>                    
          </div>
          <br/>          
          <div class="styIRS3115ChxBoxDiv">
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/ExemptOrganizationInd"/>
                <xsl:with-param name="BackupName">Exempt Organization</xsl:with-param>  
              </xsl:call-template>
            </input>  
          </div>  
          <div style="float:left">  
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/ExemptOrganizationInd"/>
                 <xsl:with-param name="BackupName">Exempt Organization</xsl:with-param> 
              </xsl:call-template>   
              Exempt organization. Enter Code <br/> section <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>                                           
            </label>  
          </div>      
          <div class="stySmallText" style="float:left; margin-top:1mm">            
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/WhoIsFilingForm/ExemptOrganizationInd/@codeSectionTxt"/>
            </xsl:call-template>  
          </div>                  
        </div>
        <div style="float:left; padding-left:2mm;width:79mm;">          
          <b>Check the appropriate box to indicate the type<br/>of accounting method change being requested.</b><br/>See Instructions.                    
          <div style="margin-top:3.5mm">
            <div style="width:100%">
              <div class="styIRS3115ChxBoxDiv">
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/TypeOfAccountingMethod/DepreciationOrAmortizationInd"/>
                   <xsl:with-param name="BackupName">DepreciationOrAmortization</xsl:with-param>   
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/TypeOfAccountingMethod/DepreciationOrAmortizationInd"/>
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
                    <xsl:with-param name="TargetNode" select="$Form3115Data/TypeOfAccountingMethod/FinclProductsAndActivitiesInd"/>
                    <xsl:with-param name="BackupName">Financial Products And Activities</xsl:with-param>
                  </xsl:call-template>
                </input>  
              </div>  
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/TypeOfAccountingMethod/FinclProductsAndActivitiesInd"/>
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
                    <xsl:with-param name="TargetNode" select="$Form3115Data/TypeOfAccountingMethod/OtherApplicantTypeInd"/>
                     <xsl:with-param name="BackupName">Other Applicant Type</xsl:with-param>
                  </xsl:call-template>
                </input>  
              </div>                
              <div style="float:left">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/TypeOfAccountingMethod/OtherApplicantTypeInd"/>
                    <xsl:with-param name="BackupName">Other Applicant Type</xsl:with-param>
                  </xsl:call-template>   
                  Other (specify) <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>                                 
                </label>  
              </div>                
              <div style="border-bottom:1px solid black; width:47mm; float:right">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/TypeOfAccountingMethod/OtherApplicantTypeInd/@desc"/>
                </xsl:call-template>    
              </div>
            </div>                                    
          </div>  
        </div>        
      </div>  
       <div class="styBB" style="width:187mm; font-size:8.5pt; padding-top:0.5mm; padding-bottom:0.5mm">
        <b>Caution:</b> <i>To be eligible for approval of the requested change in method of accounting, the taxpayer must provide all information that is
relevant to the taxpayer or to the taxpayer's requested change in method of accounting. This includes <b>(1)</b> all relevant information requested on
this</i> Form 3115 <i>(including its instructions), and <b>(2)</b> any other relevant information, even if not specifically requested on</i> Form 3115.<br/>
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
       <div style="width:187mm;height:auto;">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">1</div>
        <div style="float:left;width:165mm">
        Enter the applicable designated automatic accounting method change number ("DCN") for the requested automatic
		change. Enter only one DCN, except as provided for in guidance published by the IRS. If the requested change has no
		DCN, check "Other," and provide both a description of the change and a citation of the IRS guidance providing the
		automatic change. See instructions.<br/>
          <div style="padding-top:1mm;height:auto;">
						<span style="font-size:8pt">a</span>
						<xsl:choose>
							<xsl:when test="count($Form3115Data/DesignatedAccountingMthdChgNum) &lt;= 12">
							<span style="font-size:8pt">(1) DCN</span><img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/><span style="border-bottom:1px solid black; width:25mm; text-align:center">
								<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form3115Data/DesignatedAccountingMthdChgNum[1]"/>
								</xsl:call-template>   
							</span>
							<span style="font-size:8pt"> (2) DCN</span><img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/><span style="border-bottom:1px solid black; width:25mm; text-align:center">
								<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form3115Data/DesignatedAccountingMthdChgNum[2]"/>
								</xsl:call-template>   
							</span>
							<span style="font-size:8pt">  (3) DCN</span><img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/><span style="border-bottom:1px solid black; width:25mm; text-align:center">
								<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form3115Data/DesignatedAccountingMthdChgNum[3]"/>
								</xsl:call-template>   
							</span>
							<span style="font-size:8pt">  (4) DCN</span><img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/><span style="border-bottom:1px solid black; width:25mm; text-align:center">
								<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form3115Data/DesignatedAccountingMthdChgNum[4]"/>
								</xsl:call-template>   
							</span>
							<br/>
							<span style="font-size:8pt;padding-left:2.5mm;"> (5) DCN</span><img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/><span style="border-bottom:1px solid black; width:25mm; text-align:center">
								<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form3115Data/DesignatedAccountingMthdChgNum[5]"/>
								</xsl:call-template>   
							</span>
							<span style="font-size:8pt"> (6) DCN</span><img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/><span style="border-bottom:1px solid black; width:25mm; text-align:center">
								<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form3115Data/DesignatedAccountingMthdChgNum[6]"/>
								</xsl:call-template>   
							</span>
							<span style="font-size:8pt;'"> (7) DCN</span><img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/><span style="border-bottom:1px solid black; width:25mm; text-align:center">
								<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form3115Data/DesignatedAccountingMthdChgNum[7]"/>
								</xsl:call-template>   
							</span>
							<span style="font-size:8pt"> (8) DCN</span><img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/><span style="border-bottom:1px solid black; width:25mm; text-align:center">
								<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form3115Data/DesignatedAccountingMthdChgNum[8]"/>
								</xsl:call-template>   
							</span>
							<br/>
							<span style="font-size:8pt;padding-left:2.5mm;"> (9) DCN</span><img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/><span style="border-bottom:1px solid black; width:25mm; text-align:center">
								<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form3115Data/DesignatedAccountingMthdChgNum[9]"/>
								</xsl:call-template>   
							</span>
							<span style="font-size:8pt"> (10) DCN</span><img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/><span style="border-bottom:1px solid black; width:23mm; text-align:center">
								<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form3115Data/DesignatedAccountingMthdChgNum[10]"/>
								</xsl:call-template>   
							</span>
							<span style="font-size:8pt"> (11) DCN</span><img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/><span style="border-bottom:1px solid black; width:23mm; text-align:center">
								<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form3115Data/DesignatedAccountingMthdChgNum[11]"/>
								</xsl:call-template>   
							</span>
							<span style="font-size:8pt"> (12) DCN</span><img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/><span style="border-bottom:1px solid black; width:24mm; text-align:center">
								<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form3115Data/DesignatedAccountingMthdChgNum[12]"/>
								</xsl:call-template>   
							</span>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="$Form3115Data/DesignatedAccountingMthdChgNum">
								 <xsl:variable name="pos" select="position()"/>
								 <span>
									 <xsl:attribute name="style">
									 <xsl:choose><xsl:when test="(position() mod 4 = 1) and (position() &gt; 1)">font-size:8pt;padding-left:2.5mm;</xsl:when><xsl:otherwise>font-size:8pt;</xsl:otherwise></xsl:choose>
									 </xsl:attribute>
								 (<xsl:number value="position()"/>) DCN</span>
								 <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
								 <span>
									 <xsl:attribute name="style">
										 <xsl:choose><xsl:when test="position() &gt; 9">border-bottom:1px solid black; width:23mm; text-align:center;</xsl:when><xsl:otherwise>border-bottom:1px solid black; width:25mm; text-align:center;</xsl:otherwise></xsl:choose>
									</xsl:attribute>
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3115Data/DesignatedAccountingMthdChgNum[$pos]"/>
									</xsl:call-template>   
								 </span>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
            <br/>
            <span style="font-size:8pt"> b Other </span>
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/MethodOfAccountingOtherInd"/>
                <xsl:with-param name="BackupName">Other Accounting Method</xsl:with-param>
              </xsl:call-template>
            </input>  
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form3115Data/MethodOfAccountingOtherInd"/>
               <xsl:with-param name="BackupName">Other Accounting Method</xsl:with-param> 
              </xsl:call-template>   
             <span style="font-size:8pt"> Description </span><img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>                  
            </label>
            <span style="border-bottom:1px solid black; width:102mm; font-size:7pt">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form3115Data/MethodOfAccountingOtherInd/@methodOfAccountingOtherDesc"/>
              </xsl:call-template>   
            </span>
          </div>
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:32mm"/>  
          <div class="styIRS3115DimNoBox" style="height:32mm"/>  
        </div>
      </div>  
       <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">2</div>
        <div style="float:left">
          Do any of the eligibility rules restrict the applicant from filing the requested change using the automatic change     
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>  
        </div>
      </div>          
       <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center;height:4mm;"></div>
        <div style="float:left">
		  procedures? See instructions. If "Yes," attach an explanation.
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/RulesRstrAutoChangeProcInd"/>
          </xsl:call-template>
        </div>
        <div style="float:right">          
          <span class="styDotLn" style="padding-right:4mm">      
            ...........
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/RulesRstrAutoChangeProcInd"/>
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/RulesRstrAutoChangeProcInd"/>
            </xsl:call-template>
          </div>        
        </div>  
      </div>          
       <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">3</div>
        <div style="float:left">
          Has the filer provided all the information and statements required (a) on this form and (b) by the List of Automatic     
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>  
        </div>
      </div>          
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center;height:4mm;"></div>
        <div style="float:left">
		  Changes under which the applicant is requesting a change? See instructions.
        </div>
        <div style="float:right">          
          <span class="styDotLn" style="padding-right:4mm">      
            ...........
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AllInformationProvidedInd"/>
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AllInformationProvidedInd"/>
            </xsl:call-template>
          </div>        
        </div>  
      </div>                 
      <div style="width:187mm">
        <div style="float:left">
          <span><b>Note:</b> Complete Part II and Part IV of this form, and, Schedules A through E, if applicable.</span>
        </div>
        <div style="float:right">      
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>        
        </div>  
      </div> 
         <!-- BEGIN Part II Title -->
      <div class="styBB" style="width:187mm; border-top:1px solid black">
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
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">4</div>
        <div style="float:left">
		During the tax year of change, did or will the applicant <b>(a)</b> cease to engage in the trade or business to which the
        </div>
        <div style="float:right">      
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>        
        </div>  
      </div> 
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left">
           requested change relates, or <b>(b)</b> terminate its existence? See Instructions.
        </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:0mm">      
            ...............        
          </span>              
        <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ApplcntTrdBusReqChgRelatesInd"/>
            </xsl:call-template>
          </div>  
              <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ApplcntTrdBusReqChgRelatesInd"/>
            </xsl:call-template>
          </div>     
        </div>
      </div>  
    <!-- END Part I Line Items -->
    
    <!-- BEGIN Part II Line Items -->    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">5</div>
        <div style="float:left">
		  Is the applicant requesting to change to the principal method in the tax year of change under section
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="border-bottom:1px solid black"/>  
          <div class="styIRS3115DimNoBox" style="border-bottom:1px solid black"/>        
        </div>
      </div>
       <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
		 1.381(c)(4)-1(d)(1) or 1.381(c)(5)-1(d)(1)? 
        </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:0mm">      
            ........................
          </span>              
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/RequestChgUndSect1381Ind"/>
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/RequestChgUndSect1381Ind"/>
            </xsl:call-template>
          </div>        
        </div>
      </div>
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
           If "No," go to line 6a.
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>        
        </div>
      </div>
      <div style="width:187mm; border-bottom:2px solid black">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
           If "Yes," the applicant cannot file a Form 3115 for this change. See Instructions.
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>        
        </div>
      </div>
      <div class="pageEnd"/>
		<!-- BEGIN Signature Section -->
		<!-- Implementing the signature section as a table -->
		<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;border-bottom:0px solid black;">
			<tr>
				<td rowspan="3" style="width:10mm;font-size: 11pt;font-weight:bold;border-right:1px solid black;">Sign Here</td>
				<td colspan="5" style="padding-left:1mm;padding-bottom:1mm;">Under penalties of perjury, I declare that I have examined this application, including accompanying schedules and statements, and to the best of myknowledge and belief, the application contains all the relevant facts relating to the application, and it is true, correct, and complete. Declaration of preparer
	(other than applicant) is based on all information of which preparer has any knowledge. </td>
			</tr>
			<tr>
				<td rowspan="2" style="padding-left:1mm;">
					<img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
				</td>
				<td style="width:85mm;border-right:1px solid black;border-bottom:1px solid black;vertical-align:bottom;">
					<xsl:call-template name="PopulateReturnHeaderOfficer">
						<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
					</xsl:call-template>
					<span style="width:1px;"/>
				</td>
				<td style="width:20mm;border-bottom:1px solid black;vertical-align:bottom;padding-left:.5mm;">
					<xsl:call-template name="PopulateReturnHeaderOfficer">
						<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
					</xsl:call-template>
				</td>
				<td rowspan="2" style="padding-left:1mm;">
					<img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
				</td>
				<td style="width:60mm;border-bottom:1px solid black;vertical-align:bottom;">
					<xsl:call-template name="PopulateReturnHeaderOfficer">
						<xsl:with-param name="TargetNode">Title</xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td style="vertical-align:top;">Signature of filer (if a joint return, both sposues must sign.)</td>
				<td style="vertical-align:top;">Date </td>
				<td style="vertical-align:top;">Name and title (print or type) </td>
			</tr>
		</table>
		<!-- END Signature Section -->
	
<!--*** Customer reponse for PreparerOtherThanFilerNm/PreparerFirmName/PreparerPersonNm on 10/8/2015 by Dian Cuellar - The element PreparerOtherThanFilerNm is for the Print/Type preparer’s name. The choice is for the Firm Name, to allow the entry of either: Preparer Firm Name or Preparer Person Name.***-->
		<!-- BEGIN PREPARER SIGNATURE SECTION -->
		<!-- paid preparer -->
		<div style="width:187mm;font-size:6pt;border-top:1px solid black;">
			<div style="width:20mm;height:16mm;float:left;padding-top:1.5mm;clear:none;">
				<span class="styMainTitle">Preparer</span>
				<span class="styMainTitle" style="font-size:8pt;">(other than filer/applicant)</span>
			</div>
			<div style="width:167mm;height:16mm;float:left;clear:none;">
				<div style="width:167mm;float:left;clear:none;border-bottom:1px solid black;">
					<div class="styLNDesc" style="height:8mm;width:63mm;padding-top:0.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
					  Print/Type preparer's name<br/>
						<br/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form3115Data/PreparerOtherThanFilerNm"/>
						</xsl:call-template>
					</div>
					<div class="styLNDesc" style="height:8mm;width:63mm;padding-top:0.5mm;border-right:1px solid black;padding-left:1mm;">
					Preparer's signature
				</div>
					<div class="styLNDesc" style="height:8mm;width:26mm;padding-top:0.5mm;padding-left:1mm;">Date <br/>
						<br/>
						<xsl:call-template name="PopulateReturnHeaderPreparer">
							<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
							<xsl:with-param name="BackupName">Date Prepared</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
				<div style="width:167mm;height:8mm;float:left;clear:none;">
					<div class="styLNDesc" style="width:167mm;height:8mm;border-left:1px solid black;padding-left:1mm;">
						<span style="float:left;padding-top:3.5mm;width:20mm;">Firm's name 
						<span style="width:2.2mm;padding-top:3.5mm;"/>
							<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:4px;"/>
						</span>
						<span style="width:145mm;float:right;padding-right:.5mm;">
							<xsl:choose>                        
							  <xsl:when test="normalize-space($Form3115Data/PreparerPersonNm) != ''">
									   <xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$Form3115Data/PreparerPersonNm"/>
								</xsl:call-template>
							  </xsl:when>    
							  <xsl:otherwise>    
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$Form3115Data//PreparerFirmName/BusinessNameLine1Txt"/>
								</xsl:call-template>  
								<br/>              
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$Form3115Data//PreparerFirmName/BusinessNameLine2Txt"/>
								</xsl:call-template>                
							  </xsl:otherwise>    
							</xsl:choose>      
						</span>
					</div>
				</div>
			</div>
		</div>
		<!-- Implementing the Preparer section in table -->
		<!-- END PREPARER SIGNATURE SECTION -->
	
<!--**********************************************-->
       <xsl:call-template name="IRS3115Footer">
        <xsl:with-param name="thisPage" select="2"/>
      </xsl:call-template>
       <div class="styBB" style="width:187mm; border-top:1px solid black">
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
        <div class="styIRS3115LNLeftNumBox" style="text-align:center; padding-top:1mm">6a</div>
        <div style="float:left; padding-top:1mm">
		  Does the applicant (or any present or former consolidated group in which the applicant was a member during
        </div>
        <div style="float:right">  
          <span style="float:left">
            <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">
                Any Federal Returns Under Examination Repeating Group
              </xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form3115Data/ReturnsUnderExaminationInfo"/>
            </xsl:call-template>    
          </span>
          <div class="styIRS3115DimYesBox" style="height:5mm"/>  
          <div class="styIRS3115DimNoBox" style="height:5mm"/>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left">
          the applicable tax year(s)) have any federal income tax return(s) under examination (see instructions)? 
        </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:4mm">      
            ...                  
          </span>          
          <div class="styIRS3115YesBox" style="height:4mm;">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AnyFederalReturnsUnderExamInd"/>
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox" style="height:4mm;">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AnyFederalReturnsUnderExamInd"/>
            </xsl:call-template>
          </div>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
           If “No,” go to line 7.
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>        
        </div>
      </div>
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left">
          Is the method of accounting the applicant is requesting to change an issue under consideration (with respect to                  
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>          
        </div>    
      </div>
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
           either the applicant or any present or former consolidated group in which the applicant was a member during the
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>        
        </div>
      </div>
       <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
          applicable tax year(s)) (see instructions)?
        </div>
        <div style="float:right">  
          <span class="styDotLn">      
            ........................       
            <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">
                Method of Change Issue Under Consideration Repeating Group 
              </xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form3115Data/AcctMthdChgUndConsiderationGrp"/>
            </xsl:call-template>    
          </span>                  
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AcctMthdChgUndConsiderationInd"/>
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AcctMthdChgUndConsiderationInd"/>
            </xsl:call-template>          
          </div>        
        </div>    
      </div>    
		<!--Part II Line 6c-->
     <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">c</div>
        <div style="float:left">
          Enter the name and telephone number of the examining agent and the tax year(s) under examination.
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>          
        </div>    
      </div> 
    <xsl:if test="($Print != $Separated) or (count($Form3115Data/ExaminingAgentContactInfo) = 1) "> 
      <xsl:for-each select="$Form3115Data/ExaminingAgentContactInfo">
      <div style="width: 187mm">
      <div style="float:left">
       <span style="width:10mm; margin-left: 6mm">
        Name
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1px solid black; width:55mm">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="PersonNm"/>
        </xsl:call-template>
      </span>
      <span style="width:30mm; margin-left:2mm">
        Telephone number
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1px solid black; width:23mm; text-align:center">
        <xsl:call-template name="PopulatePhoneNumber">
          <xsl:with-param name="TargetNode" select="PhoneNum"/>
        </xsl:call-template>
      </span>
      <span style="margin-left:2mm;width:17mm">
        Tax year(s)
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1px solid black; width:12mm; text-align:center">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="TaxYr"/>
        </xsl:call-template>
      </span>
      </div>
      <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:4.5mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4.5mm"/>          
        </div>
            </div>
    </xsl:for-each>
</xsl:if>
    <xsl:if test="count($Form3115Data/ExaminingAgentContactInfo) &lt;1 or ((count($Form3115Data/ExaminingAgentContactInfo) &gt; 1) and ($Print = $Separated))">
      <div style="width: 187mm">
      <div style="float:left">
       <span style="width:10mm; margin-left: 6mm">
        Name
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1px solid black; width:55mm">
        <xsl:call-template name="PopulateAdditionalDataTableMessage">
          <xsl:with-param name="TargetNode" select="$Form3115Data/ExaminingAgentContactInfo"/>                      
        </xsl:call-template>
      </span>
      <span style="width:30mm; margin-left:2mm">
        Telephone number
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1px solid black; width:23mm; text-align:center">
        <xsl:call-template name="PopulatePhoneNumber">
          <xsl:with-param name="TargetNode" select="PhoneNum"/>
        </xsl:call-template>
      </span>
      <span style="margin-left:2mm;width:17mm">
        Tax year(s)
      </span>  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      <span style="border-bottom:1px solid black; width:12mm; text-align:center">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="TaxYr"/>
        </xsl:call-template>
      </span>
      </div>
      <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>          
        </div>
            </div>
    </xsl:if>
		<!--Part II Line 6d-->
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">d</div>
        <div style="float:left">
          Has a copy of this Form 3115 been provided to the examining agent identified on line 6c?   
        </div>
        <div style="float:right">      
          <span class="styDotLn" style="padding-right:4mm">      
            .......
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/CopyProvidedToExaminingAgtInd"/>
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/CopyProvidedToExaminingAgtInd"/>
            </xsl:call-template>          
          </div>          
        </div>    
      </div>  
      <!--Dina Cuellar 10/13/2015 : In regards to the additional clarification of Part II 7a and 7b, in the UWR we requested change to the efile type from: BooleanType to CheckboxType.  We also requested updating this yes/no question to include a checkbox for yes and no at the request of Chief Counsel since the applicant may be able to check both the yes and or no boxes.   

Therefore you are correct the PDF will have two push pins as indicated below, but I do ask that the checkboxes be in line with all the other yes/no's first.   Please let me know if you need any additional information and I do apologize for delay in response.
-->
      <!--Part II Line 7a--> 
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">7a</div>
        <div style="float:left">
          Does audit protection apply to the applicant's requested change in method of accounting? See instructions.     
       </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:4mm">      
            ..
		  </span>
          <div class="styIRS3115YesBox" style="height:4mm;border-bottom:0px solid black; ">
			   <input type="Checkbox" class="styCkbox">
				<xsl:call-template name="PopulateCheckbox">
				  <xsl:with-param name="TargetNode" select="$Form3115Data/AuditProtectionApplyYesInd"/>
				  <xsl:with-param name="BackupName">Audit Protection Apply Yes Ind</xsl:with-param>
				</xsl:call-template>
			  </input>            
          </div>  
          <div class="styIRS3115NoBox" style="height:4mm;border-bottom:0px solid black; ">
		   <input type="Checkbox" class="styCkbox">
			<xsl:call-template name="PopulateCheckbox">
			  <xsl:with-param name="TargetNode" select="$Form3115Data/AuditProtectionApplyNoInd"/>
			  <xsl:with-param name="BackupName">Audit Protection Apply No Ind</xsl:with-param>
			</xsl:call-template>
		  </input>            
          </div>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
           If “No,” attach an explanation.
        </div>
        <div style="float:right">  
          <div class="styIRS3115YesBox">
			  <xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$Form3115Data/AuditProtectionApplyYesInd"/>
			  </xsl:call-template> 
          </div> 
          <div class="styIRS3115NoBox">        
			  <xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$Form3115Data/AuditProtectionApplyNoInd"/>
			  </xsl:call-template>                            
          </div> 
        </div>
      </div>
      <!--Part II Line 7b--> 
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left">
          If “Yes,” check the applicable box and attach the required statement.
          <br/> 
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/NotUnderExamInd"/>
              <xsl:with-param name="BackupName">Not under Exam</xsl:with-param>
            </xsl:call-template>
          </input>            
          <label>
            <xsl:call-template name="PopulateLabel">
             <xsl:with-param name="TargetNode" select="$Form3115Data/NotUnderExamInd"/>
             <xsl:with-param name="BackupName">Not under Exam</xsl:with-param>
            </xsl:call-template>   
            Not under Exam        
          </label>
          <span style="width:21.5mm"/>
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ThreeMonthWindowInd"/>
              <xsl:with-param name="BackupName">3-month window</xsl:with-param>
            </xsl:call-template>
          </input>            
          <label>
            <xsl:call-template name="PopulateLabel">
             <xsl:with-param name="TargetNode" select="$Form3115Data/ThreeMonthWindowInd"/>
             <xsl:with-param name="BackupName">3-month window</xsl:with-param>
            </xsl:call-template>   
            3-month window        
          </label>
          <span style="width:8.5mm"/>
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/OneHundredTwentyDaysPeriodInd"/>
             <xsl:with-param name="BackupName">120 day</xsl:with-param> 
            </xsl:call-template>
          </input>  
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form3115Data/OneHundredTwentyDaysPeriodInd"/>
               <xsl:with-param name="BackupName">120 day</xsl:with-param> 
            </xsl:call-template>   
           120 day: Date examination ended
            <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
          </label>
          <span style="border-bottom:1px solid black; width:20mm; text-align:center">
			<xsl:call-template name="PopulateMonthDayYear">
				<xsl:with-param name="TargetNode" select="$Form3115Data/ExaminationEndDt"/>
			</xsl:call-template>
		  </span> 
          <br/>
           <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/MethodNotBeforeDirectorInd"/>
              <xsl:with-param name="BackupName">Method not before director</xsl:with-param>
            </xsl:call-template>
          </input>            
          <label>
            <xsl:call-template name="PopulateLabel">
             <xsl:with-param name="TargetNode" select="$Form3115Data/MethodNotBeforeDirectorInd"/>
             <xsl:with-param name="BackupName">Method not before director</xsl:with-param>
            </xsl:call-template>   
            Method not before director        
          </label>
          <span style="width:7mm"/>
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/NegativeAdjustmentInd"/>
              <xsl:with-param name="BackupName">Negative adjustment</xsl:with-param>
            </xsl:call-template>
          </input>            
          <label>
            <xsl:call-template name="PopulateLabel">
             <xsl:with-param name="TargetNode" select="$Form3115Data/NegativeAdjustmentInd"/>
             <xsl:with-param name="BackupName">Negative adjustment</xsl:with-param>
            </xsl:call-template>   
            Negative adjustment        
          </label>
          <span style="width:3mm"/>
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/CAPInd"/>
             <xsl:with-param name="BackupName">CAP:Date member joined group</xsl:with-param> 
            </xsl:call-template>
          </input>  
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form3115Data/CAPInd"/>
               <xsl:with-param name="BackupName">CAP:Date member joined group</xsl:with-param> 
            </xsl:call-template>   
			   CAP:Date member joined group
            <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
          </label>
          <span style="border-bottom:1px solid black; width:20mm; text-align:center">
			<xsl:call-template name="PopulateMonthDayYear">
				<xsl:with-param name="TargetNode" select="$Form3115Data/MemberJoinedGroupDt"/>
			</xsl:call-template>
		  </span> 
		  <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/ReqFiledUnderWindowPeriodInd"/>
          </xsl:call-template> 
          <br/>
           <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AuditProtectionExamInd"/>
              <xsl:with-param name="BackupName">Audit protection at end of exam</xsl:with-param>
            </xsl:call-template>
          </input>            
          <label>
            <xsl:call-template name="PopulateLabel">
             <xsl:with-param name="TargetNode" select="$Form3115Data/AuditProtectionExamInd"/>
             <xsl:with-param name="BackupName">Audit protection at end of exam</xsl:with-param>
            </xsl:call-template>   
            Audit protection at end of exam       
          </label>
          <span style="width:0.5mm"/>
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/OtherInd"/>
              <xsl:with-param name="BackupName">Other</xsl:with-param>
            </xsl:call-template>
          </input>            
          <label>
            <xsl:call-template name="PopulateLabel">
             <xsl:with-param name="TargetNode" select="$Form3115Data/OtherInd"/>
             <xsl:with-param name="BackupName">Other</xsl:with-param>
            </xsl:call-template>   
            Other        
          </label>
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:18mm"/>  
          <div class="styIRS3115DimNoBox" style="height:18mm"/>          
        </div>    
      </div>
      <!--Part II Line 8a-->    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center; padding-top:1mm">8a</div>
        <div style="float:left; padding-top:1mm">
		  Does the applicant (or any present or former consolidated group in which the applicant was a member during the
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:5mm"/>  
          <div class="styIRS3115DimNoBox" style="height:5mm"/>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left">
          applicable tax year(s)) have any federal income tax return(s) before Appeals and/or a federal court? 
        </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:4mm">      
            ...                  
          </span>          
          <div class="styIRS3115YesBox" style="height:4mm;">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/FedReturnBeforeAppealsInd"/>
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox" style="height:4mm;">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/FedReturnBeforeAppealsInd"/>
            </xsl:call-template>
          </div>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
           If “No,” go to line 10.
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>        
        </div>
      </div>
      <!--Part II Line 8b-->    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left;">
		  Is the method of accounting the applicant is requesting to change an issue under consideration by Appeals and/or
        </div>
        <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left;">
		  a federal court (for either the applicant or any present or former consolidated group in which the applicant was a
        </div>
         <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
     </div>
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left">
          member for the tax year(s) the applicant was a member)? See instructions. 
		  <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/AcctMthdUnderCnsdrByFedCrtInd"/>
          </xsl:call-template> 
       </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:4mm">      
            ............                  
          </span>          
          <div class="styIRS3115YesBox" style="height:4mm;">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AcctMthdUnderCnsdrByFedCrtInd"/>
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox" style="height:4mm;">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AcctMthdUnderCnsdrByFedCrtInd"/>
            </xsl:call-template>
          </div>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
          If “Yes,” attach an explanation.
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>        
        </div>
      </div>
	<!--Part II Line 8c-->
      <div style="width:187mm">
		  <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm;">c</div>
		  <div style="float:left;">
		 If “Yes,” enter the name of the (check the box)
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/AppealsOfficerInd"/>
                <xsl:with-param name="BackupName">Appeals Officer</xsl:with-param>
              </xsl:call-template>
            </input>  
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form3115Data/AppealsOfficerInd"/>
               <xsl:with-param name="BackupName">Appeals Officer</xsl:with-param> 
              </xsl:call-template>
            </label>
            <span style="font-size:8pt"> Appeals officer </span>
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/CounselForTheGovernmentInd"/>
                <xsl:with-param name="BackupName">Counsel For The Government</xsl:with-param>
              </xsl:call-template>
            </input>  
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form3115Data/CounselForTheGovernmentInd"/>
               <xsl:with-param name="BackupName">Counsel For The Government</xsl:with-param> 
              </xsl:call-template>
            </label>
            <span style="font-size:8pt"> counsel for the government, </span>
		  </div>
        <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:5mm"/>  
          <div class="styIRS3115DimNoBox" style="height:5mm"/>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left;">
		  telephone number, and the tax year(s) before Appeals and/or a federal court.
        </div>
        <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
    </div>
		<xsl:if test="($Print != $Separated) or (count($Form3115Data/AOOrGovtCounselCntctInfo) = 1) "> 
		  <xsl:for-each select="$Form3115Data/AOOrGovtCounselCntctInfo">
		  <div style="width: 187mm">
		  <div style="float:left">
		   <span style="width:10mm; margin-left: 6mm">
			Name
		  </span>  
			<img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
		  <span style="border-bottom:1px solid black; width:55mm">
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="PersonNm"/>
			</xsl:call-template>
		  </span>
		  <span style="width:30mm; margin-left:2mm">
			Telephone number
		  </span>  
			<img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
		  <span style="border-bottom:1px solid black; width:23mm; text-align:center">
			<xsl:call-template name="PopulatePhoneNumber">
			  <xsl:with-param name="TargetNode" select="PhoneNum"/>
			</xsl:call-template>
		  </span>
		  <span style="margin-left:2mm;width:17mm">
			Tax year(s)
		  </span>  
			<img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
		  <span style="border-bottom:1px solid black; width:12mm; text-align:center">
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="TaxYr"/>
			</xsl:call-template>
		  </span>
		  </div>
		  <div style="float:right">  
			  <div class="styIRS3115DimYesBox" style="height:4.5mm"/>  
			  <div class="styIRS3115DimNoBox" style="height:4.5mm"/>          
			</div>
				</div>
		</xsl:for-each>
		</xsl:if>
		<xsl:if test="count($Form3115Data/AOOrGovtCounselCntctInfo) &lt;1 or ((count($Form3115Data/AOOrGovtCounselCntctInfo) &gt; 1) and ($Print = $Separated))">
		  <div style="width: 187mm">
		  <div style="float:left">
		   <span style="width:10mm; margin-left: 6mm;">
			Name
		  </span>  
			<img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
		  <span style="border-bottom:1px solid black; width:55mm">
			<xsl:call-template name="PopulateAdditionalDataTableMessage">
			  <xsl:with-param name="TargetNode" select="$Form3115Data/AOOrGovtCounselCntctInfo"/>                      
			</xsl:call-template>
		  </span>
		  <span style="width:30mm; margin-left:2mm">
			Telephone number
		  </span>  
			<img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
		  <span style="border-bottom:1px solid black; width:23mm; text-align:center">
			<xsl:call-template name="PopulatePhoneNumber">
			  <xsl:with-param name="TargetNode" select="PhoneNum"/>
			</xsl:call-template>
		  </span>
		  <span style="margin-left:2mm;width:17mm">
			Tax year(s)
		  </span>  
			<img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
		  <span style="border-bottom:1px solid black; width:12mm; text-align:center">
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="TaxYr"/>
			</xsl:call-template>
		  </span>
		  </div>
		  <div style="float:right">  
			  <div class="styIRS3115DimYesBox" style="height:4mm"/>  
			  <div class="styIRS3115DimNoBox" style="height:4mm"/>          
			</div>
				</div>
		</xsl:if>
	<!--Part II Line 8d-->
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">d</div>
        <div style="float:left">
          Has a copy of this Form 3115 been provided to the Appeals officer and/or counsel for the government identified
        </div>
        <div style="float:right">          
          <div class="styIRS3115DimYesBox" style="border-bottom:0"/>  
          <div class="styIRS3115DimNoBox" style="border-bottom:0"/>          
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox" style="height:4mm;"/>
        <div style="float:left">
          on line 8a?
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">....................................
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AOOrGovtCounselProvCopyInd"/>
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/AOOrGovtCounselProvCopyInd"/>
            </xsl:call-template>          
          </div>          
        </div>    
      </div>    
      <!--Part II Line 9-->    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">9</div>
        <div style="float:left;">
		  If the applicant answered “Yes” to line 6a and/or 8a with respect to any present or former consolidated group,
        </div>
        <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left;">
		  attach a statement that provides each parent corporation's <b>(a)</b> name, <b>(b)</b> identification number, <b>(c)</b> address, and
        </div>
         <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
     </div>
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left;">
		  <b>(d)</b> tax year(s) during which the applicant was a member that is under examination, before an Appeals office, and/
        </div>
         <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
     </div>
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left">
          or before a federal court. 
        </div>
        <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
      </div>    
      <!--Part II Line 10-->    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox">10</div>
        <div style="float:left;">
		  If for federal income tax purposes, the applicant is either an entity (including a limited liability company) treated as
        </div>
        <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left;">
		  a partnership or an S corporation, is it requesting a change from a method of accounting that is an issue under
        </div>
         <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
     </div>
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left;">
		  consideration in an examination, before Appeals, or before a federal court, with respect to a federal income tax
        </div>
         <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
     </div>
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox" style="height:4mm;"/>
        <div style="float:left">
          return of a partner, member, or shareholder of that entity?
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">...................
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/PrtshpSCorpAcctMthdUndExamInd"/>
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/PrtshpSCorpAcctMthdUndExamInd"/>
            </xsl:call-template>          
          </div>          
        </div>    
      </div>    
      <!--Part II Line 11a-->    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">11a</div>
        <div style="float:left;">
		  Has the applicant, its predecessor, or a related party requested or made (under either an automatic or non-
        </div>
        <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left;">
		  automatic change procedure) a change in method of accounting within any of the five tax years ending with the
        </div>
         <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
     </div>
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left">
          tax year of change? 
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/ChgInAcctMthdMadeInPast5YrsInd"/>
          </xsl:call-template>
       </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:4mm">      
            ............................               
          </span>          
          <div class="styIRS3115YesBox" style="height:4mm;">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ChgInAcctMthdMadeInPast5YrsInd"/>
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox" style="height:4mm;">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ChgInAcctMthdMadeInPast5YrsInd"/>
            </xsl:call-template>
          </div>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
          If “No,” go to line 12.
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>        
        </div>
      </div>
      <!--Part II Line 11b-->    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left;">
		  If “Yes,” for each trade or business, attach a description of each requested change in method of accounting
        </div>
        <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left;">
		  (including the tax year of change) and state whether the applicant received consent.
        </div>
         <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
     </div>
      <!--Part II Line 11c-->    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">c</div>
        <div style="float:left;">
		  If any application was withdrawn, not perfected, or denied, or if a Consent Agreement granting a change was not
        </div>
        <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left;">
		  signed and returned to the IRS, or the change was not made or not made in the requested year of change, attach
        </div>
         <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
     </div>      
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left;">
		  an explanation.
        </div>
         <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
     </div>      
      <!--Part II Line 12-->    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox">12</div>
        <div style="float:left;">
		  Does the applicant, its predecessor, or a related party currently have pending any request (including any
        </div>
        <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox" style="height:4mm;"/>
        <div style="float:left">
          concurrently filed request) for a private letter ruling, change in method of accounting, or technical advice?
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/PnReqPrvtLtrRlngTamAcctChgInd"/>
          </xsl:call-template>
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">.
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/PnReqPrvtLtrRlngTamAcctChgInd"/>
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/PnReqPrvtLtrRlngTamAcctChgInd"/>
            </xsl:call-template>          
          </div>          
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left;">
		  If “Yes,” for each request attach a statement providing <b>(a)</b> the name(s) of the taxpayer, <b>(b)</b> identification number(s),
        </div>
         <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
      </div>
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left;">
		  <b>(c)</b> the type of request (private letter ruling, change in method of accounting, or technical advice), and <b>(d)</b> the
        </div>
         <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
      </div>
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left;">
		  specific issue(s) in the request(s).
        </div>
         <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
     </div>      
      <!--Part II Line 13-->    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox">13</div>
        <div style="float:left">
          Is the applicant requesting to change its overall method of accounting?
       </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:4mm">      
            ..............               
          </span>          
          <div class="styIRS3115YesBox" style="height:4mm;">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/RequestingChgToOverallAcctInd"/>
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox" style="height:4mm;">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/RequestingChgToOverallAcctInd"/>
            </xsl:call-template>
          </div>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
          If “Yes,” complete Schedule A on page 4 of the form.
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>        
        </div>
      </div>    
      <!-- Page Break and Footer-->
      <xsl:call-template name="IRS3115Footer">
        <xsl:with-param name="thisPage" select="3"/>
      </xsl:call-template>
      
      <div class="styBB" style="width:187mm; border-top:2px solid black">
        <div class="styPartName" style="width:12mm; height:4.2mm; font-size:9.5pt">Part II</div>
        <div class="styPartDesc" style="width:150mm; font-size:9.5pt">
          Information For All Requests <span style="font-weight:normal">(continued)</span>
        </div>          
        <div style="float:right">  
          <div class="styIRS3115YesBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>Yes</b></div>  
          <div class="styIRS3115NoBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>No</b></div>
        </div>    
      </div>  
      <!-- Line 14  -->  
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox">14</div>
        <div style="float:left">
         If the applicant is either <b>(i) not </b>changing its overall method of accounting, or <b>(ii)</b> is changing its overall method of<br/>
accounting <b>and</b> changing to a special method of accounting for one or more items, attach a detailed and<br/>
complete description for each of the following (See instructions):
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:12mm"/>  
          <div class="styIRS3115DimNoBox" style="height:12mm"/>  
        </div>    
      </div>          
       <!-- Line 14a  --> 
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">a</div>
        <div style="float:left">
          The item(s) being changed.      
        </div>    
        <div style="float:right">      
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>  
        </div>    
      </div>          
     <!-- Line 14 b  -->   
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left">
          The applicant's present method for the item(s) being changed.
        </div>        
        <div style="float:right">      
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>  
        </div>    
      </div>          
      <!-- Line 14 c -->  
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">c</div>
        <div style="float:left">
          The applicant's proposed method for the item(s) being changed.
        </div>              
        <div style="float:right">    
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>  
        </div>    
      </div>    
      <!-- Line 14 d -->
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">d</div>
        <div style="float:left">
          The applicant's present overall method of accounting (cash, accrual, or hybrid).
        </div>                
        <div style="float:right">        
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>  
        </div>    
      </div>  
      <!-- Line 15 a  -->      
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftLtrBox">15a</div>
        <div style="float:left;">
          Attach a detailed and complete description of the applicant's trade(s) or business(es).
        </div>              
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>  
        </div>  
      </div>  
      <!-- Line 15 b  -->      
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left;">
          If the applicant has more than one trade or business, as defined in Regulations section 1.446-1(d), describe
        </div>              
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>  
        </div>  
      </div>  
       <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left;">
		  <b>(i)</b> whether each trade or business is accounted for separately; <b>(ii)</b> the goods and services provided by each trade<br/>
			or business and any other types of activities engaged in that generate gross income; <b>(iii)</b> the overall method of<br/>
			accounting for each trade or business; and <b>(iv)</b> which trade or business is requesting to change its accounting<br/>
			method as part of this application or a separate application.
        </div>
         <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:15mm"/>  
          <div class="styIRS3115DimNoBox" style="height:15mm"/>        
        </div>    
      </div>      
      <!-- Line 16 a  -->      
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftLtrBox">16a</div>
        <div style="float:left;">
			Attach a full explanation of the legal basis supporting the proposed method for the item being changed. Include a<br/>
			detailed and complete description of the facts that explains how the law specifically applies to the applicant's<br/>
			situation and that demonstrates that the applicant is authorized to use the proposed method.<br/>
        </div>              
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:11mm;"/>  
          <div class="styIRS3115DimNoBox" style="height:11mm;"/>  
        </div>  
      </div>  
     <!-- Line 16 b  -->   
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left">
          Include all authority (statutes, regulations, published rulings, court cases, etc.) supporting the proposed method.
        </div>        
        <div style="float:right">      
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>  
        </div>    
      </div>          
     <!-- Line 16 c  -->   
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">c</div>
        <div style="float:left">
          Include either a discussion of the contrary authorities or a statement that no contrary authority exists.
        </div>        
        <div style="float:right">      
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>  
        </div>    
      </div>          
      <!--Part II Line 17-->    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">17</div>
        <div style="float:left;">
		  Will the proposed method of accounting be used for the applicant's books and records and financial statements?
        </div>
        <div style="float:right">  
           <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left">
          For insurance companies, see the instructions 
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/ProposedMethodUsedForBksInd"/>
          </xsl:call-template>
       </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:4mm">      
            ......................              
          </span>          
          <div class="styIRS3115YesBox" style="height:4mm;">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ProposedMethodUsedForBksInd"/>
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox" style="height:4mm;">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ProposedMethodUsedForBksInd"/>
            </xsl:call-template>
          </div>        
        </div>    
      </div>    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
          If “No,” attach an explanation.
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>        
        </div>
      </div>      
      <!--Part II Line 18-->    
      <div style="width:187mm">
        <div class="styIRS3115LNLeftLtrBox">18</div>
        <div style="float:left;">
		  Does the applicant request a conference with the IRS National Office if the IRS National Office proposes an adverse 
        </div>
        <div style="float:right">  
          <div class="styIRS3115DimYesBox"/>  
          <div class="styIRS3115DimNoBox"/>        
        </div>    
      </div>          
      <div style="width:187mm">
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"></div>
        <div style="float:left">
          response?
       </div>
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:4mm">      
            .................................              
          </span>          
          <div class="styIRS3115YesBox" style="height:4mm;">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ConferenceOfRightRequestedInd"/>
            </xsl:call-template>
          </div>  
          <div class="styIRS3115NoBox" style="height:4mm;">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ConferenceOfRightRequestedInd"/>
            </xsl:call-template>
          </div>        
        </div>    
      </div>
      <!-- Line 19 a  -->      
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftLtrBox">19a</div>
        <div style="float:left;">
If the applicant is changing to either the overall cash method, an overall accrual method, or is changing its method of <br/>
accounting for any property subject to section 263A, any long-term contract subject to section 460 (see 19b), or<br/>
inventories subject to section 474, enter the applicant's gross receipts for the 3 tax years preceding the tax year of<br/> change.
        </div>              
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:15mm;"/>  
          <div class="styIRS3115DimNoBox" style="height:15mm;"/>  
        </div>  
      </div>        
      <xsl:variable name="line19Count" select="count($Form3115Data/GrossReceipts4YrsPreceding)"/>    
      <div style="width:187mm;">                
        <div class="styIRS3115TableContainer" id="line19TPctn">  
          <xsl:call-template name="SetInitialState"/>                      
          <table class="styTable" style="font-size:7pt;font-weight:normal; width:100%; border-bottom:0" cellspacing="0" cellpadding="0" border="0">  
            <thead class="styTableThead">
              <tr align="left" style="height:8mm">
                <th nowrap="nowrap" scope="col" align="left" valign="bottom" style="width:30.6mm; border-bottom:1px solid black;font-weight:normal;"> 
                  1st preceding<br/>year ended: mo.                   
                </th>  
                <th class="styIRS3115TblRB" scope="col" align="left" valign="bottom" style="width:25mm;font-weight:normal;">
                  yr.                  
                </th>
                <th nowrap="nowrap" scope="col" valign="bottom" style="width:30.6mm; border-bottom:1px solid black;font-weight:normal;">
                  <div style="padding-left:1mm">
                    2nd preceding<br/>year ended: mo.   
                  </div>                        
                </th>  
                <th class="styIRS3115TblRB" scope="col" align="left" valign="bottom" style="width:25mm;font-weight:normal;">  
                  yr.                    
                </th>  
                <th nowrap="nowrap" scope="col" valign="bottom" style="width:31mm; border-bottom:1px solid black;font-weight:normal;">
                  <div style="padding-left:1mm">
                    3rd preceding<br/>year ended: mo.   
                  </div>                    
                </th>    
                <th class="styIRS3115TblRB" align="left" scope="col" valign="bottom" style="width:25mm;font-weight:normal;">
                  yr.                  
                </th>  
                <th class="styIRS3115TblRB" align="left" style="width:6.7mm; border-bottom:0; background-color:lightgrey" scope="col"> </th>                
                <th style="border-bottom:0; background-color:lightgrey;width:7.0mm;" scope="col"> </th>
              </tr>  
            </thead>  
            <tfoot/>
            <tbody>    
              <xsl:if test="($Print != $Separated and $Form3115Data/GrossReceipts4YrsPreceding) or (count($Form3115Data/GrossReceipts4YrsPreceding) = 1)">
              <xsl:call-template name="line19Template">
                <xsl:with-param name="max">
                  <xsl:choose>
                       <xsl:when test="$line19Count &gt; 1">     
                      <xsl:value-of select="$line19Count"/>
                       </xsl:when>
                       <xsl:otherwise>
                          <xsl:value-of select="1"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:with-param>
              </xsl:call-template>  
              </xsl:if>
              <xsl:if test="not($Form3115Data/GrossReceipts4YrsPreceding)">
                <xsl:call-template name="line19Template">
                <xsl:with-param name="max" select="1"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="($Print = $Separated) and (count($Form3115Data/GrossReceipts4YrsPreceding) &gt;1)">
                <xsl:call-template name="line19Template">
                <xsl:with-param name="max" select="1"/>
                 <xsl:with-param name="IsSeparated" select=" 'yes' "/>
                </xsl:call-template>
              </xsl:if>
             </tbody>    
          </table>                          
        </div>            
      </div>                

      <!-- Line 19 b  -->      
     <div style="width:187mm">  
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left;">
			If the applicant is changing its method of accounting for any long-term contract subject to section 460, in addition<br/>
			to completing 19a, enter the applicant's gross receipts for the 4th tax year preceding the tax year of change:
        </div>              
        <div style="float:right">  
          <div class="styIRS3115DimYesBox" style="height:8mm;"/>  
          <div class="styIRS3115DimNoBox" style="height:8mm;"/>  
        </div>  
      </div> 
	  <xsl:if test="($Print != $Separated) or (count($Form3115Data/GrossReceipts4YrsPreceding) = 1) "> 
		  <xsl:for-each select="$Form3115Data/GrossReceipts4YrsPreceding">
			  <div style="width: 187mm">
				  <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
				  <div style="float:left">
					  <xsl:choose>
						<xsl:when test="position()=1">
						  <span style="width:40mm; ">4th preceding year ended: </span>
						</xsl:when>
						<xsl:otherwise>
						  <span style="width:40mm"/>
						</xsl:otherwise>
					  </xsl:choose>
					  <span style="margin-left: 2mm">mo.</span>
					  <span style="border-bottom:1px solid black; width:30mm; text-align:center">
						<xsl:call-template name="PopulateMonth">
						  <xsl:with-param name="TargetNode" select="FourthPrecedingYearEndDt"/>
						</xsl:call-template>
					  </span>
					  <span style="width:2mm"/>   
					  <span style="margin-left:2mm">
						yr.
					  </span>  
					  <span style="border-bottom:1px solid black; width:23mm; text-align:center">
						<xsl:call-template name="PopulateYear">
						  <xsl:with-param name="TargetNode" select="FourthPrecedingYearEndDt"/>
						</xsl:call-template>
					  </span>
					  <span style="margin-left:2mm;">
						$
					  </span>  
					  <span style="border-bottom:1px solid black; width:40mm; text-align:center">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="GrossReceiptsFor4thPrecYrAmt"/>
						</xsl:call-template>
					  </span>
				  </div>
				  <div style="float:right">  
					  <div class="styIRS3115DimYesBox" style="height:4.5mm"/>  
					  <div class="styIRS3115DimNoBox" style="height:4.5mm"/>          
				  </div>
			  </div>
		  </xsl:for-each>
	  </xsl:if>
	  <xsl:if test="count($Form3115Data/GrossReceipts4YrsPreceding) &lt;1 or ((count($Form3115Data/GrossReceipts4YrsPreceding) &gt; 1) and ($Print = $Separated))">
		<div style="width:187mm">  
			<div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
			<div style="float:left">
				<span style="width:40mm; ">4th preceding year ended: </span>
				<span style="margin-left: 2mm">mo.</span>
				<span style="border-bottom:1px solid black; width:40mm; text-align:center">
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts4YrsPreceding"/>                      
					</xsl:call-template>
					<xsl:call-template name="PopulateMonth">
						<xsl:with-param name="TargetNode" select="FourthPrecedingYearEndDt"/>
					</xsl:call-template>
				</span>
				<span style="width:2mm"/>   
				<span style="margin-left:2mm">
					yr.
				</span>  
				<span style="border-bottom:1px solid black; width:23mm; text-align:center">
					<xsl:call-template name="PopulateYear">
						<xsl:with-param name="TargetNode" select="FourthPrecedingYearEndDt"/>
					</xsl:call-template>
				</span>
				<span style="margin-left:2mm;">
				$
				</span>  
				<span style="border-bottom:1px solid black; width:30mm; text-align:center">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GrossReceiptsFor4thPrecYrAmt"/>
					</xsl:call-template>
				</span>
			</div>
			<div style="float:right">  
				<div class="styIRS3115DimYesBox" style="height:4.5mm"/>  
				<div class="styIRS3115DimNoBox" style="height:4.5mm"/>          
			</div>
		</div>
	  </xsl:if>

      <!-- END Part II Line Items -->
      <!-- BEGIN Part III Line Items -->
      <div class="styBB" style="width:187mm; border-top:1px solid black">
        <div class="styPartName" style="width:13mm; height:4.2mm; font-size:9.5pt">Part III</div>
        <div class="styPartDesc" style="width:150mm; font-size:9.5pt">
          Information For Non-Automatic Change Request
        </div>
        <div style="float:right">
          <div class="styIRS3115YesBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>Yes</b></div>  
          <div class="styIRS3115NoBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>No</b></div>
        </div>
      </div>
     <!-- Line 20 --> 
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm">20</div>
        <div style="float:left; padding-top:1mm">
          Is the applicant's requested change described in any revenue procedure, revenue ruling, notice, regulation, or
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:5mm"/>  
          <div class="styIRS3115DimNoBox" style="height:5mm"/>  
        </div>
      </div>
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
          other published guidance as an automatic change request?
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/ChangeReqAllwUnderAutoChgInd"/>
          </xsl:call-template>          
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">      
            ..................            
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ChangeReqAllwUnderAutoChgInd"/>
                <xsl:with-param name="BackupName">Change Request Allow Under Auto Change</xsl:with-param>  
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/ChangeReqAllwUnderAutoChgInd"/>
                <xsl:with-param name="BackupName">Change Request Allow Under Auto Change</xsl:with-param>  
            </xsl:call-template>          
          </div>  
        </div>
      </div>
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
          If   Yes, attach an explanation describing why the applicant is submitting its request under the non-automatic<br/> change procedures.
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:8.5mm"/>  
          <div class="styIRS3115DimNoBox" style="height:8.5mm"/>  
        </div>
      </div>
      <!-- Line 21 --> 
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm">21</div>
        <div style="float:left; padding-top:1mm">
         Attach a copy of all documents related to the proposed change (see instructions).
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:5mm"/>  
          <div class="styIRS3115DimNoBox" style="height:5mm"/>  
        </div>
      </div> 
      <!-- Line 22 --> 
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm">22</div>
        <div style="float:left; padding-top:1mm">
         Attach a statement of the applicant’s reasons for the proposed change.
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:5mm"/>  
          <div class="styIRS3115DimNoBox" style="height:5mm"/>  
        </div>
      </div> 
     <!-- Line 23 --> 
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm">23</div>
        <div style="float:left; padding-top:1mm">
			If the applicant is a member of a consolidated group for the year of change, do all other members of the
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:5mm"/>  
          <div class="styIRS3115DimNoBox" style="height:5mm"/>  
        </div>
      </div>
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
          consolidated group use the proposed method of accounting for the item being changed?
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/GroupMembersUsePrpsdMthdInd"/>              
          </xsl:call-template>  
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">      
            .......           
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/GroupMembersUsePrpsdMthdInd"/>
                <xsl:with-param name="BackupName">Group Members Use Prpsd Mothed</xsl:with-param>  
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/GroupMembersUsePrpsdMthdInd"/>
                <xsl:with-param name="BackupName">Group Members Use Prpsd Mothed</xsl:with-param>  
            </xsl:call-template>          
          </div>  
        </div>
      </div>
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
          If “No,” attach an explanation.
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height4mm"/>  
        </div>
      </div> 
      <!-- Line 24a  -->
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox">24a</div>
        <div style="float:left">
          Enter the amount of <b>user fee</b> attached to this application (see instructions).
          <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>    
          $
          <span style="width:45mm; border-bottom:1px solid black; text-align:center">
            <span style="width:1px;"/>    
          </span>
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:4.5mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4.5mm"/>  
        </div>
      </div>
    <!-- Line 24b  -->  
      <div style="width:187mm; ">  
        <div class="styIRS3115LNLeftLtrBox" style="padding-right:0.5mm">b</div>
        <div style="float:left">
         If the applicant qualifies for a reduced user fee, attach the required information or certification (see instructions).
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/QlfyRdcUserFeeRqrInfoAttInd"/>              
          </xsl:call-template><br/>
        </div>        
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:8.5mm"/>  
          <div class="styIRS3115DimNoBox" style="height:8.5mm"/>  
        </div>
      </div>        
	  <xsl:call-template name="IRS3115Footer">
        <xsl:with-param name="thisPage" select="4"/>
      </xsl:call-template>
      <div class="styBB" style="width:187mm; border-top:1px solid black">
        <div class="styPartName" style="width:13mm; height:4.2mm; font-size:9.5pt">Part IV</div>
        <div class="styPartDesc" style="width:150mm; font-size:9.5pt">
          Section 481(a) Adjustment
        </div>
        <div style="float:right">
          <div class="styIRS3115YesBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>Yes</b></div>  
          <div class="styIRS3115NoBox" style="border-bottom:0; height:4.2mm; font-size:9pt"><b>No</b></div>
        </div>
      </div>
      <!-- Line 25  -->
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm">25</div>
        <div style="float:left; padding-top:1mm">
          Does published guidance require the applicant (or permit the applicant and the applicant is electing) to implement the
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:5mm"/>  
          <div class="styIRS3115DimNoBox" style="height:5mm"/>  
        </div>
      </div>
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
          requested change in method of accounting on a cut-off basis?
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/RequireUseCutOffBasisYesInd"/>
          </xsl:call-template>          
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">      
            ..................            
          </span>
          <div class="styIRS3115YesBox" style="height:4mm;border-bottom:0px solid black; ">
			   <input type="Checkbox" class="styCkbox">
				<xsl:call-template name="PopulateCheckbox">
				  <xsl:with-param name="TargetNode" select="$Form3115Data/RequireUseCutOffBasisYesInd"/>
				  <xsl:with-param name="BackupName">Require Use Cut Off Basis Yes</xsl:with-param>
				</xsl:call-template>
			  </input>            
          </div>  
          <div class="styIRS3115NoBox" style="height:4mm;border-bottom:0px solid black; ">
		   <input type="Checkbox" class="styCkbox">
			<xsl:call-template name="PopulateCheckbox">
			  <xsl:with-param name="TargetNode" select="$Form3115Data/RequireUseCutOffBasisNoInd"/>
			  <xsl:with-param name="BackupName">Require Use Cut Off Basis No</xsl:with-param>
			</xsl:call-template>
		  </input>            
          </div>        
        </div>
      </div>
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
         If “Yes,” attach an explanation and do not complete lines 26, 27, and 28 below. For multiple changes, see instructions.
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>  
        </div>
      </div>
	  <!-- Line 26 -->    
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox">26</div>
        <div style="float:left">
          Enter the section 481(a) adjustment. Indicate whether the adjustment is an increase (+) or a decrease (-) in<br/>income.
          <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>    
          $
          <span style="width:40mm; border-bottom:1px solid black; text-align:center">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/NetSectionAdjustmentAmt/@increaseOrDecreaseCd"/>
            </xsl:call-template>  
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3115Data/NetSectionAdjustmentAmt"/>
            </xsl:call-template>    
          </span>
              Attach a summary of the computation and an explanation of the
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/NetSectionAdjustmentAmt"/>              
          </xsl:call-template>    
          <br/>methodology used to determine the section 481(a) adjustment. If it is based on more than one component, show<br/>the computation for each component. If more than one applicant is applying for the method 	change on the application,<br/> attach a list of the <b>(a)</b> name, <b>(b)</b> identification number, and <b>(c)</b> the amount of the section 481(a) adjustment <br/>attributable to each applicant.          
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:22.5mm"/>  
          <div class="styIRS3115DimNoBox" style="height:22.5mm"/>  
        </div>
      </div>
      <!-- Line 27  -->
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm">27</div>
        <div style="float:left; padding-top:1mm">
          Is the applicant making an election to take the entire amount of the adjustment into account in the tax year of change?
        </div>
        <div style="float:right;">
          <div class="styIRS3115YesBox" style="height:5mm;">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/TakingEntireSectAdjIntoAcctInd"/>
                <xsl:with-param name="BackupName">Taking Entire Sect Adjustment Into Account</xsl:with-param>  
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox" style="height:5mm;">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/TakingEntireSectAdjIntoAcctInd"/>
                <xsl:with-param name="BackupName">Taking Entire Sect Adjustment Into Account</xsl:with-param>  
            </xsl:call-template>          
          </div>  
        </div>
      </div>
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
         If “Yes,” check the box for the applicable elective provision used to make the election (see instructions).
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>  
        </div>
      </div>
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/DeMinimisElection50KInd"/>
              <xsl:with-param name="BackupName">$50,000 de minimus election</xsl:with-param>
            </xsl:call-template>
          </input>            
          <label>
            <xsl:call-template name="PopulateLabel">
             <xsl:with-param name="TargetNode" select="$Form3115Data/DeMinimisElection50KInd"/>
             <xsl:with-param name="BackupName">$50,000 de minimus election</xsl:with-param>
            </xsl:call-template>   
            $50,000 de minimis election      
          </label>
          <span style="width:15mm"/>
           <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/EligibleAcquisTransElectInd"/>
              <xsl:with-param name="BackupName">Eligible acquisition transaction election</xsl:with-param>
            </xsl:call-template>
          </input>            
          <label>
            <xsl:call-template name="PopulateLabel">
             <xsl:with-param name="TargetNode" select="$Form3115Data/EligibleAcquisTransElectInd"/>
             <xsl:with-param name="BackupName">Eligible acquisition transaction election</xsl:with-param>
            </xsl:call-template>   
            Eligible acquisition transaction election     
          </label>
       </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:5mm"/>  
          <div class="styIRS3115DimNoBox" style="height:5mm"/>  
        </div>
      </div>
	<!-- Line 28  -->
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm">28</div>
        <div style="float:left; padding-top:1mm">
          Is any part of the section 481(a) adjustment attributable to transactions between members of an affiliated group, a
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:5mm"/>  
          <div class="styIRS3115DimNoBox" style="height:5mm"/>  
        </div>
      </div>
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
          consolidated group, a controlled group, or other related parties?
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/PartOfAdjAttrblBtwnMembersInd"/>
          </xsl:call-template>          
        </div>
        <div style="float:right">
          <span class="styDotLn" style="padding-right:4mm">      
            ...............           
          </span>
          <div class="styIRS3115YesBox">
            <xsl:call-template name="PopulateYesBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/PartOfAdjAttrblBtwnMembersInd"/>
                <xsl:with-param name="BackupName">Part Of Adj Attrbl Btwn Members</xsl:with-param>  
            </xsl:call-template>          
          </div>  
          <div class="styIRS3115NoBox">
            <xsl:call-template name="PopulateNoBox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/PartOfAdjAttrblBtwnMembersInd"/>
                <xsl:with-param name="BackupName">Part Of Adj Attrbl Btwn Members</xsl:with-param>  
            </xsl:call-template>          
          </div>  
        </div>
      </div>
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
         If “Yes,” attach an explanation.
        </div>
        <div style="float:right">
          <div class="styIRS3115DimYesBox" style="height:4mm"/>  
          <div class="styIRS3115DimNoBox" style="height:4mm"/>  
        </div>
      </div>      
	<!-- IRS3115 Schedule A -->
      <div class="styBB" style="border-top:1px solid black; width:187mm; font-size:9.5pt;height:8mm;padding-top:2mm;">        
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
          Check the appropriate boxes below to indicate the applicant's present and proposed methods of accounting.
        </div>            
      </div>    
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
         <div>
		  <span style="width:40mm;"><b>Present method:</b></span>
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/PresentMethod/CashInd"/>
              <xsl:with-param name="BackupName">Cash</xsl:with-param>
            </xsl:call-template>
          </input>            
          <label>
            <xsl:call-template name="PopulateLabel">
             <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/PresentMethod/CashInd"/>
             <xsl:with-param name="BackupName">Cash</xsl:with-param>
            </xsl:call-template>   
            Cash      
          </label>
          <span style="width:15mm"/>
           <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/PresentMethod/AccrualInd"/>
              <xsl:with-param name="BackupName">Accrual</xsl:with-param>
            </xsl:call-template>
          </input>            
          <label>
            <xsl:call-template name="PopulateLabel">
             <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/PresentMethod/AccrualInd"/>
             <xsl:with-param name="BackupName">Accrual</xsl:with-param>
            </xsl:call-template>   
            Accrual     
          </label>
          <span style="width:15mm"/>
           <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/PresentMethod/HybridInd"/>
              <xsl:with-param name="BackupName">Hybrid (attach description)</xsl:with-param>
            </xsl:call-template>
          </input>            
          <label>
            <xsl:call-template name="PopulateLabel">
             <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/PresentMethod/HybridInd"/>
             <xsl:with-param name="BackupName">Hybrid (attach description)</xsl:with-param>
            </xsl:call-template>   
            Hybrid (attach description)     
          </label>       
		  <xsl:call-template name="SetFormLinkInline">
			<xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/PresentMethod/HybridInd"/>
		  </xsl:call-template>          
       </div>
	  </div>
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
         <div>
		  <span style="width:40mm;"><b>Proposed method:</b></span>
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/ProposedMethod/CashInd"/>
              <xsl:with-param name="BackupName">Cash</xsl:with-param>
            </xsl:call-template>
          </input>            
          <label>
            <xsl:call-template name="PopulateLabel">
             <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/ProposedMethod/CashInd"/>
             <xsl:with-param name="BackupName">Cash</xsl:with-param>
            </xsl:call-template>   
            Cash      
          </label>
          <span style="width:15mm"/>
           <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/ProposedMethod/AccrualInd"/>
              <xsl:with-param name="BackupName">Accrual</xsl:with-param>
            </xsl:call-template>
          </input>            
          <label>
            <xsl:call-template name="PopulateLabel">
             <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/ProposedMethod/AccrualInd"/>
             <xsl:with-param name="BackupName">Accrual</xsl:with-param>
            </xsl:call-template>   
            Accrual     
          </label>
          <span style="width:15mm"/>
           <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/ProposedMethod/HybridInd"/>
              <xsl:with-param name="BackupName">Hybrid (attach description)</xsl:with-param>
            </xsl:call-template>
          </input>            
          <label>
            <xsl:call-template name="PopulateLabel">
             <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/ProposedMethod/HybridInd"/>
             <xsl:with-param name="BackupName">Hybrid (attach description)</xsl:with-param>
            </xsl:call-template>   
            Hybrid (attach description)     
          </label>       
		  <xsl:call-template name="SetFormLinkInline">
			<xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/ProposedMethod/HybridInd"/>
		  </xsl:call-template>          
       </div>
      </div>
      <div style="width:187mm; margin-top:1mm">
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">2</div>
        <div style="float:left">
          Enter the following amounts as of the close of the tax year preceding the year of change. If none, state "None." Also,<br/>attach a statement providing a breakdown of the amounts entered on lines 2a through 2g.
        </div>            
      </div>    
      <div style="width:187mm">        
        <div class="styIRS3115SchAP1" style="float:right; text-align:center; border-top:1px solid black; font-weight:bold; font-size:7pt">
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
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/IncomeAccruedButNotReceivedAmt">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/IncomeAccruedButNotReceivedAmt"/>              
                </xsl:call-template>  
              </xsl:when>   
              <xsl:otherwise>       
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/IncomeAccruedButNotRcvdNONECd"/>              
                </xsl:call-template>  
              </xsl:otherwise> 
            </xsl:choose>                  
          </div>              
        </div>    
      </div>    
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftLtrBox">b</div>
        <div style="float:left">
        Income received or reported before it was earned (such as advanced payments). Attach a description
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/IncomeReceivedOrRptBfrEarnAmt"/>              
          </xsl:call-template>  
        </div>                  
        <div class="styIRS3115SchAP1" style="float:right; border-bottom:0"/>      
      </div>    
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftLtrBox" style="height:4mm;"/>
        <div style="float:left">
         of the income and the legal basis for the proposed method
        </div>    
        <div style="float:right">  
          <span class="styDotLn" style="padding-right:1mm">      
            ..........
          </span>  
          <div class="styIRS3115SchAP1">
            <xsl:choose>
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/IncomeReceivedOrRptBfrEarnAmt">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/IncomeReceivedOrRptBfrEarnAmt"/>              
                </xsl:call-template>    
              </xsl:when>     
              <xsl:otherwise> 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/IncomeRcvdOrRptBefEarnNONECd"/>              
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
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/ExpensesAccruedButNotPaidAmt">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/ExpensesAccruedButNotPaidAmt"/>              
                </xsl:call-template>  
              </xsl:when>   
              <xsl:otherwise>       
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/ExpensesAccruedButNotPdNONECd"/>              
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
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/PrepaidExpensePrevDeductedAmt">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/PrepaidExpensePrevDeductedAmt"/>              
                </xsl:call-template>  
              </xsl:when>   
              <xsl:otherwise>       
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/PrepaidExpnsPrevDedNONECd"/>              
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
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/SuppliesOnHandPrevDeductedAmt">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/SuppliesOnHandPrevDeductedAmt"/>              
                </xsl:call-template>  
              </xsl:when>   
              <xsl:otherwise>       
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/SupOnHandPrevDeductedNONECd"/>              
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
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/InventoryOnHandPrevDeductedAmt">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/InventoryOnHandPrevDeductedAmt"/>              
                </xsl:call-template>  
              </xsl:when>   
              <xsl:otherwise>       
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/InvntryOnHandPrevDedNONECd"/>              
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
calculation of the section 481(a) adjustment. 
          <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>  
          <span style="border-bottom:1px solid black; width:70mm"> 
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/OtherAmt"/>              
            </xsl:call-template>  
          </span>
        </div>  
          <div class="styIRS3115SchAP1" style="float:right; border-bottom:0"/>         
        <div style="float:right">    
          <div class="styIRS3115SchAP1">
            <xsl:choose>
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/OtherAmt">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/OtherAmt"/>              
                </xsl:call-template>  
              </xsl:when>   
              <xsl:otherwise>       
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/OtherAmountNONECd"/>              
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
          <b>Net section 481(a) adjustment</b> (Combine lines 2a–2g.) Indicate whether the adjustment is  an 
        </div>            
        <div style="float:right">    
        
          <div class="styIRS3115SchAP1" style="border-bottom:0  solid black">
            <div style="text-align:left; float:left; padding-left:1mm"/>
     
          </div>      
        </div>    
      </div>    
     <!--  *********************************************************************  --> 
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox" style="height:4mm;"/>
        <div style="float:left">
        increase (+) or decrease (-) in income. Also enter the net amount of this section 481(a) adjustment
        </div>            
        <div style="float:right">    
                <div class="styIRS3115SchAP1" style="border-bottom:0 solid black">
            <div style="text-align:left; float:left; padding-left:1mm"/>
   
          </div>      
        </div>    
      </div>    
     <!--  ********************************************************************** -->
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox" style="height:4mm;"/>
        <div style="float:left">
         amount on Part IV, line 26.
        </div>            
        <div style="float:right">    
          <span class="styDotLn" style="padding-right:1mm">      
            ........................
          </span>
          <div class="styIRS3115SchAP1" style="border-bottom:1px solid black">
            <div style="text-align:left; float:left; padding-left:1mm">$</div>
            <xsl:choose>
              <xsl:when test="$Form3115Data/IRS3115ScheduleA/NetSectionAdjustmentAmt">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/NetSectionAdjustmentAmt"/>              
                </xsl:call-template>  
              </xsl:when>   
              <xsl:otherwise>       
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/NetSectionAdjustmentNoneCd"/>              
                </xsl:call-template>  
              </xsl:otherwise> 
            </xsl:choose>  
          </div>      
        </div>    
      </div>    
     <!-- ********************************************************************** -->
      <div style="width:187mm; margin-top:1mm">            
        <div class="styIRS3115LNLeftNumBox" style="text-align:center;padding-top:1mm">3</div>
        <div style="float:left;padding-top:1mm">
          Is the applicant also requesting the recurring item exception under section 461(h)(3)?          
        </div>    
        <div class="styIRS3115YNChxBoxDiv">    
          <span class="styDotLn" style="padding-right:0;padding-top:1mm">      
            .......
          </span>     
		  <span>
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/RequestingRecurItemExcInd"/>
              </xsl:call-template>     
            <input type="Checkbox" style="height:4mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/RequestingRecurItemExcInd"/>
              <xsl:with-param name="BackupName">Yes Requesting Recur Item Exception</xsl:with-param>  
              </xsl:call-template>
            </input></span>            
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/RequestingRecurItemExcInd"/>
    <xsl:with-param name="BackupName">Yes Requesting Recur Item Exception</xsl:with-param> 
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:5mm"/>
      <span>
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/RequestingRecurItemExcInd"/>
              </xsl:call-template>     
            <input type="Checkbox" style="height:4mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/RequestingRecurItemExcInd"/>
               <xsl:with-param name="BackupName">No Requesting Recur Item Exception</xsl:with-param> 
              </xsl:call-template>
            </input>
            </span>            
            <label>
              <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/RequestingRecurItemExcInd"/>
             <xsl:with-param name="BackupName">No Requesting Recur Item Exception</xsl:with-param> 
              </xsl:call-template> 
              <b>No</b>
            </label>  
           </div>              
      </div>    
      <div style="width:187mm;">  
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">4</div>
        <div style="float:left;width:181mm;">
       Attach copies of the profit and loss statement (Schedule F (Form 1040) for farmers) and the balance sheet, if applicable, as of the close of the tax year preceding the year of change. Also attach a statement specifying the accounting method used when preparing the balance sheet. If books of account are not kept, attach a copy of the business schedules submitted with the federal income tax return or other return (e.g., tax-exempt organization returns) for that period. If the amounts in Part I, lines 2a through 2g, do not agree with those shown on both the profit and loss statement and the balance sheet, attach a statement explaining the differences.
        </div>          
      </div>    
      <div style="width:187mm;">            
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">5</div>
        <div style="float:left">
          Is the applicant making a change to the overall cash method under Rev. Proc. 2002-28 (DCN "33")?          
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/DCN33Ind"/>              
            </xsl:call-template>  
        </div>    
        <div class="styIRS3115YNChxBoxDiv">    
          <span class="styDotLn" style="padding-right:0">      
            .
          </span>     
		  <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/DCN33Ind"/>
            </xsl:call-template>     
            <input type="Checkbox" style="height:4mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/DCN33Ind"/>
              <xsl:with-param name="BackupName">Yes Requesting Recur Item Exception</xsl:with-param>  
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/DCN33Ind"/>
				<xsl:with-param name="BackupName">Yes Requesting Recur Item Exception</xsl:with-param> 
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
          </span>            
            <span style="width:5mm"/>
		  <span>
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/DCN33Ind"/>
              </xsl:call-template>     
            <input type="Checkbox" style="height:4mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/DCN33Ind"/>
               <xsl:with-param name="BackupName">No Requesting Recur Item Exception</xsl:with-param> 
              </xsl:call-template>
            </input>
            </span>            
            <label>
              <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleA/DCN33Ind"/>
             <xsl:with-param name="BackupName">No Requesting Recur Item Exception</xsl:with-param> 
              </xsl:call-template> 
              <b>No</b>
            </label>  
           </div>              
      </div>    
      <div style="width:187mm">  
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
         If “Yes,” attach a statement that provides the applicant's NAICS code. See instructions.
        </div>
      </div>      
      <div class="styBB" style="width:187mm;border-top:1px solid black;">
        <div class="styPartName" style="width:12mm; font-size:9.5pt">Part II</div>
        <div class="styPartDesc" style="font-size:9.5pt">
          Change to the Cash Method For Non-Automatic Change Request <span style="font-weight:normal">(see instructions)</span>
        </div>        
      </div>  
      <div style="width:187mm; border-bottom:1px solid black; padding-bottom:0.5mm">
        <div style="padding-top:1mm;width:187mm;padding-bottom:1mm;">
          Applicants requesting a change to the cash method must attach the following information:  
        </div>      
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">1</div>
        <div style="float:left;width:181mm;">
          A description of inventory items (items whose production, purchase, or sale is an income-producing factor) and materials<br/>and supplies used in carrying out the business.      
        </div>  
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">2</div>
        <div style="float:left">
          An explanation as to whether the applicant is required to use the accrual method under any section of the Code or regulations.  
        </div>            
      </div>
       <!-- Page Break and Footer-->
	  <xsl:call-template name="IRS3115Footer">
        <xsl:with-param name="thisPage" select="5"/>
      </xsl:call-template>
 		<!-- END Page Break and Footer-->
      <div class="styBB" style="width:187mm; border-top:1px solid black;font-size:9.5pt;height:6mm;padding-top:1mm;">        
        <b>Schedule BChange to the Deferral Method for Advance Payments</b> (see instructions)
      </div>      
      
      <div style="width:187mm; padding-bottom:3mm; padding-top:1mm">                
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">1</div>
        <div style="float:left;width:181mm;">
         If the applicant is requesting to change to the deferral method for advance payments described in section 5.02 of Rev. Proc.
2004-34, 2004-1 C.B. 991, attach the following information: 
        </div>          
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">a</div>
        <div style="float:left; padding-top:1mm">
         A statement explaining how the advance payments meet the definition in section 4.01 of Rev. Proc. 2004-34. 
        </div>            
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">b</div>
        <div style="float:left; padding-top:1mm;width:181mm;">
          If the applicant is filing under the automatic change procedures, the information required by section 8.02(3)(a)-(c) of Rev. Proc. 2004-34.
        </div>    
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">c</div>
        <div style="float:left; padding-top:1mm;width:181mm;">
         If the applicant is filing under the non-automatic change procedures, the information required by section 8.03(2)(a)-(f) of Rev. Proc. 2004-34.
        </div>  
        <br/>
       <div class="styIRS3115LNLeftNumBox" style="text-align:center; padding-top:1mm">2</div>
        <div style="float:left; padding-top:1mm;width:181mm;">
          If the applicant is requesting to change to the deferral method for advance payments described in  Regulations section 1.451-5(b)(1)(ii), attach the following. 
        </div>  
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">a</div>
        <div style="float:left; padding-top:1mm">
         A statement explaining how the advance payments meet the definition in Regulations section 1.451-5(a)(1). 
        </div>    
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">b</div>
        <div style="float:left; padding-top:1mm;width:181mm;">
        A statement explaining what portions of the advance payments, if any, are attributable to services, whether such services are integral to the provisions of goods or items, and whether any portions of the advance payments that are attributable to non-integral services are less than five percent of the total contract prices. See Regulations sections 1.451-5(a)(2)(i) and (3).
        </div>    
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">c</div>
        <div style="float:left; padding-top:1mm;width:181mm;">
         A statement explaining that the advance payments will be included in income no later than when included in gross receipts for
purposes of the applicant's financial reports. See Regulations section 1.451-5(b)(1)(ii).
        </div>    
        
          <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">d</div>
        <div style="float:left; padding-top:1mm;width:181mm;">
        A statement explaining whether the inventoriable goods exception of Regulations section 1.451-5(c) applies and if so, when substantial advance payments will be received under the contracts, and how the exception will limit the deferral of income.
        </div>    
      </div> 
      <div class="styBB" style="border-top:2px solid black; width:187mm; font-size:9.5pt;height:6mm;padding-top:1mm;">        
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
      <div style="width:187mm; padding-top:1mm; border-bottom:1px solid black">                
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">1</div>
        <div style="float:left">
          Attach a description of the applicant's present and proposed LIFO methods and submethods for each of the following<br/>items:  
        </div>          
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">a</div>
        <div style="float:left; padding-top:1mm">
          Valuing inventory (e.g., unit method or dollar-value method).
        </div>            
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">b</div>
        <div style="float:left; padding-top:1mm;width:181mm;">
          Pooling (e.g., by line or type or class of goods, natural business unit, multiple pools, raw material content, simplified dollar-value method, inventory price index computation (IPIC) pools, vehicle-pool method, etc.).
        </div>    
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">c</div>
        <div style="float:left; padding-top:1mm">
          Pricing dollar-value pools (e.g., double-extension, index, link-chain, link-chain index, IPIC method, etc.).
        </div>  
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">d</div>
        <div style="float:left; padding-top:1mm;width:181mm;">
        Determining the current-year cost of goods in the ending inventory (i.e., most recent acquisitions, earliest acquisitions during the current year, average cost of current-year acquisitions, rolling-average cost, or other permitted method).
        </div>        
        <br/>
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm; text-align:center">2</div>
        <div style="float:left; padding-top:1mm;width:181mm;">
          If any present method or submethod used by the applicant is not the same as indicated on Form(s) 970 filed to adopt or<br/>expand the use of the method, attach an explanation.  
        </div>
        <br/>
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm; text-align:center">3</div>
        <div style="float:left; padding-top:1mm;width:181mm;">
       If the proposed change is not requested for all the LIFO inventory, attach a statement specifying the inventory to which the change is and is not applicable.
        </div>
        <br/>
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm; text-align:center">4</div>
        <div style="float:left; padding-top:1mm;width:181mm;">
      If the proposed change is not requested for all of the LIFO pools, attach a statement specifying the LIFO pool(s) to which the change is applicable.
        </div>
        <br/>
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm; text-align:center">5</div>
        <div style="float:left; padding-top:1mm;width:181mm;">
         Attach a statement addressing whether the applicant values any of its LIFO inventory on a method other than cost. For example, if the applicant values some of its LIFO inventory at retail and the remainder at cost, identify which inventory items are valued under each method.
        </div>        
        <br/>
        <div class="styIRS3115LNLeftNumBox" style="padding-top:1mm; text-align:center">6</div>
        <div style="float:left; padding-top:1mm;width:181mm;">
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
        <div style="float:left; padding-top:1mm;">
          A description of the types of processes and raw materials used to produce the products in each proposed pool.
        </div>    
        <br/>
        <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">c</div>
        <div style="float:left; padding-top:1mm;width:181mm;">
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
      </div>
      
      <xsl:call-template name="IRS3115Footer">
        <xsl:with-param name="thisPage" select="6"/>
      </xsl:call-template>
      <div class="styBB" style="width:187mm; border-top:1px solid black;">
		<div class="styPartName" style="width:12mm; font-size:9.5pt">Part II</div>
		<div class="styPartDesc" style="font-size:9.5pt">Change in Pooling Inventories (continued)</div>        
      </div>          
      <div style="width:187mm; padding-bottom:1mm; ">  
        <div class="styIRS3115LNLeftLtrBox" >g</div>
        <div style="float:left;">
          A statement addressing whether, within the proposed NBU pool(s), there are items both sold to unrelated parties and<br/>transferred to a different unit of the applicant to be used as a component part of another product prior to final processing.
        </div>          
        <div class="styIRS3115LNLeftNumBox" style="text-align:center; ">3</div>
        <div style="float:left; ">
          If the applicant is engaged in manufacturing and is proposing to use the multiple pooling method or raw material content<br/>pools, attach information to show that each proposed pool will consist of a group of items that are substantially similar.<br/>See Regulations section 1.472-8(b)(3).
        </div>
        <div class="styIRS3115LNLeftNumBox" style="text-align:center;">4</div>
        <div style="float:left;">
          If the applicant is engaged in the wholesaling or retailing of goods and is requesting to change the number of pools used,<br/>attach information to show that each of the proposed pools is based on customary business classifications of the<br/>applicant's trade or business. See Regulations section 1.472-8(c).
        </div>
      </div>        
      <div class="styBB" style="padding-bottom:0.5mm; border-top:1px solid black; width:187mm; font-size:9.5pt">        
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
        <div style="float:left;width:181mm;">
To the extent not already provided, attach a description of the applicant’s present and proposed methods for reporting income
and expenses from long-term contracts. Also, attach a representative actual contract (without any deletion) for the requested
change. If the applicant is a construction contractor, attach a detailed description of its construction activities.
        </div>                          
      </div>    
      
      <div style="width:187mm; margin-top:1mm">      
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">2a</div>        
        <div style="float:left">
          Are the applicant's contracts long-term contracts as defined in section 460(f)(1) (see instructions)?            
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ...
          </span>    
      <span>
                 <xsl:call-template name="PopulateSpan">
                   <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LongTermApplicantContractsInd"/>
                 </xsl:call-template>     
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LongTermApplicantContractsInd"/>
                <xsl:with-param name="BackupName">Contracts LTAs Defined Sect460f1Yes</xsl:with-param>
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LongTermApplicantContractsInd"/>
                <xsl:with-param name="BackupName">Contracts LTAs Defined Sect460f1Yes</xsl:with-param>
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
      <span>
                 <xsl:call-template name="PopulateSpan">
                   <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LongTermApplicantContractsInd"/>
                 </xsl:call-template>     
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LongTermApplicantContractsInd"/>
              <xsl:with-param name="BackupName">Contracts LTAs Defined Sect460f1No</xsl:with-param>  
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LongTermApplicantContractsInd"/>
                <xsl:with-param name="BackupName">Contracts LTAs Defined Sect460f1No</xsl:with-param>
              </xsl:call-template>   
              <b>No</b>
            </label>  
        </div>          
      </div>          
      <div style="width:187mm; margin-top:0.5mm">    
        <div class="styIRS3115LNLeftLtrBox">b</div>        
        <div style="float:left">
          If   Yes, do all the contracts qualify for the exception under section 460(e) (see instructions)?            
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ....
          </span>      
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AllContractsQlfySectionExcInd"/>
                </xsl:call-template>         
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AllContractsQlfySectionExcInd"/>
                <xsl:with-param name="BackupName">All Contracts Qlfy Section460eExcYes</xsl:with-param>
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AllContractsQlfySectionExcInd"/>
               <xsl:with-param name="BackupName">All Contracts Qlfy Section460eExcYes</xsl:with-param> 
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AllContractsQlfySectionExcInd"/>
                </xsl:call-template>
                         
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AllContractsQlfySectionExcInd"/>
                <xsl:with-param name="BackupName">All Contracts Qlfy Section460eExcNo</xsl:with-param>
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AllContractsQlfySectionExcInd"/>
               <xsl:with-param name="BackupName">All Contracts Qlfy Section460eExcNo</xsl:with-param> 
              </xsl:call-template>   
              <b>No</b>
            </label>  
        </div>              
      </div>    
      
      <div style="width:187mm">      
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>        
        <div style="float:left">
        If line 2b is No, attach an explanation.      
        </div>
        <div style="float:left">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AllContractsQlfySectionExcInd"/>              
          </xsl:call-template>  
        </div>    
      </div>    
      <div style="width:187mm; margin-top:0.5mm">      
        <div class="styIRS3115LNLeftLtrBox">c</div>        
        <div style="float:left">
          Is the applicant requesting to use the percentage-of-completion method using cost-to-cost under Regulations 
        </div>
      </div>    
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox" style="height:4mm;"/>        
        <div style="float:left">
          section 1.460-4(b)?          
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            .............................
          </span>        
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplcntReqPctOfCompMethodInd"/>
                </xsl:call-template>    
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplcntReqPctOfCompMethodInd"/>
              <xsl:with-param name="BackupName">IsAppl cnt Req Pct Of Compln MthdYes</xsl:with-param>  
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplcntReqPctOfCompMethodInd"/>
                <xsl:with-param name="BackupName">IsAppl cnt Req Pct Of Compln MthdYes</xsl:with-param>
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplcntReqPctOfCompMethodInd"/>
                </xsl:call-template>    
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplcntReqPctOfCompMethodInd"/>
               <xsl:with-param name="BackupName">IsAppl cnt Req Pct Of Compln MthdNo</xsl:with-param> 
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplcntReqPctOfCompMethodInd"/>
                <xsl:with-param name="BackupName">IsAppl cnt Req Pct Of Compln MthdNo</xsl:with-param>
              </xsl:call-template>   
              <b>No</b>
            </label>  
        </div>              
      </div>          
      <div style="width:187mm; margin-top:0.5mm">      
        <div class="styIRS3115LNLeftLtrBox">d</div>        
        <div style="float:left;width:150mm;">
         In computing the completion factor of a contract, will the applicant use the cost-to-cost method described in Regulations section 1.460-5(b) or the simplified cost-to-cost method described in Regulations section 
        </div>
      </div>    
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox" style="height:4mm;"/>        
        <div style="float:left">
           1.460-5(c)? (See instructions)      
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ..........................
          </span>        
		  <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/CmplnFctrCstCstSmplfdMthdInd"/>
                </xsl:call-template>    
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/CmplnFctrCstCstSmplfdMthdInd"/>
              <xsl:with-param name="BackupName">IsAppl cnt Req Pct Of Compln MthdYes</xsl:with-param>  
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/CmplnFctrCstCstSmplfdMthdInd"/>
                <xsl:with-param name="BackupName">IsAppl cnt Req Pct Of Compln MthdYes</xsl:with-param>
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/CmplnFctrCstCstSmplfdMthdInd"/>
                </xsl:call-template>    
            <input type="Checkbox" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/CmplnFctrCstCstSmplfdMthdInd"/>
               <xsl:with-param name="BackupName">IsAppl cnt Req Pct Of Compln MthdNo</xsl:with-param> 
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/CmplnFctrCstCstSmplfdMthdInd"/>
                <xsl:with-param name="BackupName">IsAppl cnt Req Pct Of Compln MthdNo</xsl:with-param>
              </xsl:call-template>   
              <b>No</b>
            </label>  
        </div>              
      </div>          
      <div style="width:187mm; margin-top:0.5mm">      
      <div class="styIRS3115LNLeftLtrBox">e</div>        
        <div style="float:left">
If line 2c is No, is the applicant requesting to use the exempt-contract percentage-of-completion
        </div>
      </div>    
      
      <div style="width:187mm">    
        <div class="styIRS3115LNLeftLtrBox" style="height:4mm;"/>        
        <div style="float:left">
          method under Regulations section 1.460-4(c)(2)?    
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ....................
          </span>     
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplcntReqExmptComplnMethodInd"/>
                </xsl:call-template>      
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplcntReqExmptComplnMethodInd"/>
                        <xsl:with-param name="BackupName">IsApplcntReqExemptComplnMthdYes</xsl:with-param>        
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplcntReqExmptComplnMethodInd"/>
             <xsl:with-param name="BackupName">IsApplcntReqExemptComplnMthdYes</xsl:with-param>      
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplcntReqExmptComplnMethodInd"/>
                </xsl:call-template>      
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplcntReqExmptComplnMethodInd"/>
        <xsl:with-param name="BackupName">IsApplcntReqExemptComplnMthdNo</xsl:with-param> 
              </xsl:call-template>
            </input> 
           </span>           
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplcntReqExmptComplnMethodInd"/>
                    <xsl:with-param name="BackupName">IsApplcntReqExemptComplnMthdNo</xsl:with-param>    
              </xsl:call-template>   
              <b>No</b>
            </label>  
        </div>              
      </div>      
      <div style="width:187mm">      
        <div class="styIRS3115LNLeftLtrBox" style="height:4mm;"/>        
        <div style="float:left">
          If line 2e is  Yes, attach an explanation of what method the applicant will use to determine a<br/>contract's completion factor.
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplcntReqExmptComplnMethodInd"/>              
          </xsl:call-template>  
          <br/> If line 2e is No, attach an explanation of what method the applicant is using and the authority for its use.     
        </div>
      </div>        
      <div style="width:187mm; margin-top:1mm">      
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">3a</div>        
        <div style="float:left">
          Does the applicant have long-term manufacturing contracts as defined in section 460(f)(2)?
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LTMfrContractsAsDefInSectInd"/>              
          </xsl:call-template>  
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ....
          </span>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LTMfrContractsAsDefInSectInd"/>
                </xsl:call-template>     
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LTMfrContractsAsDefInSectInd"/>
               <xsl:with-param name="BackupName">LT Mfr Contracts As DefSect460f2Yes</xsl:with-param> 
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LTMfrContractsAsDefInSectInd"/>
               <xsl:with-param name="BackupName">LT Mfr Contracts As DefSect460f2Yes</xsl:with-param>   
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LTMfrContractsAsDefInSectInd"/>
                </xsl:call-template>     
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LTMfrContractsAsDefInSectInd"/>
                <xsl:with-param name="BackupName">LT Mfr Contracts As DefSect460f2No</xsl:with-param>  
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LTMfrContractsAsDefInSectInd"/>
                  <xsl:with-param name="BackupName">LT Mfr Contracts As DefSect460f2No</xsl:with-param> 
              </xsl:call-template>   
              <b>No</b>
            </label> 
        </div>          
      </div>      
      
      <div style="width:187mm; margin-top:0.5mm">      
        <div class="styIRS3115LNLeftLtrBox">b</div>        
        <div style="float:left">
          If   Yes, attach a description of the applicant’s manufacturing activities, including any required installation<br/>of manufactured goods.                  
        </div>
      </div>  
      <div style="width:187mm; margin-top:1mm">      
        <div class="styIRS3115LNLeftNumBox" style="text-align:center">4a</div>        
        <div style="float:left">
          Does the applicant enter into cost-plus long-term contracts?
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ................
          </span>
      <span>
		<xsl:call-template name="PopulateSpan">
		  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EnterCostPlusLTCntrctInd"/>
		</xsl:call-template>     
		<input type="Checkbox" style="height:3.5mm;" class="styCkbox">
		  <xsl:call-template name="PopulateYesCheckbox">
			<xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EnterCostPlusLTCntrctInd"/>
		   <xsl:with-param name="BackupName">EnterCostPlusLTCntrctIndYes</xsl:with-param> 
		  </xsl:call-template>
		</input>
	   </span>            
		<label>
		  <xsl:call-template name="PopulateLabelYes">
			<xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EnterCostPlusLTCntrctInd"/>
		   <xsl:with-param name="BackupName">EnterCostPlusLTCntrctIndYes</xsl:with-param>   
		  </xsl:call-template>   
		  <b>Yes</b>
		</label>  
		<span style="width:3mm"/>
		  <span>
			<xsl:call-template name="PopulateSpan">
			  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EnterCostPlusLTCntrctInd"/>
			</xsl:call-template>     
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EnterCostPlusLTCntrctInd"/>
                <xsl:with-param name="BackupName">EnterCostPlusLTCntrctIndNo</xsl:with-param>  
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EnterCostPlusLTCntrctInd"/>
                  <xsl:with-param name="BackupName">EnterCostPlusLTCntrctIndNo</xsl:with-param> 
              </xsl:call-template>   
              <b>No</b>
            </label> 
        </div>          
      </div>      
      <div style="width:187mm; margin-top:1mm">      
        <div class="styIRS3115LNLeftLtrBox">b</div>        
        <div style="float:left">
          Does the applicant enter into federal long-term contracts?
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EnterFederalLTCntrctInd"/>              
          </xsl:call-template>  
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ................
          </span>
      <span>
		<xsl:call-template name="PopulateSpan">
		  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EnterFederalLTCntrctInd"/>
		</xsl:call-template>     
		<input type="Checkbox" style="height:3.5mm;" class="styCkbox">
		  <xsl:call-template name="PopulateYesCheckbox">
			<xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EnterFederalLTCntrctInd"/>
		   <xsl:with-param name="BackupName">EnterFederalLTCntrctIndYes</xsl:with-param> 
		  </xsl:call-template>
		</input>
	   </span>            
		<label>
		  <xsl:call-template name="PopulateLabelYes">
			<xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EnterFederalLTCntrctInd"/>
		   <xsl:with-param name="BackupName">EnterFederalLTCntrctIndYes</xsl:with-param>   
		  </xsl:call-template>   
		  <b>Yes</b>
		</label>  
		<span style="width:3mm"/>
		<span>
			<xsl:call-template name="PopulateSpan">
			  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EnterFederalLTCntrctInd"/>
			</xsl:call-template>     
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EnterFederalLTCntrctInd"/>
                <xsl:with-param name="BackupName">EnterFederalLTCntrctIndNo</xsl:with-param>  
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EnterFederalLTCntrctInd"/>
                  <xsl:with-param name="BackupName">EnterFederalLTCntrctInd2No</xsl:with-param> 
              </xsl:call-template>   
              <b>No</b>
            </label> 
        </div>          
      </div>      
	<!-- ===== Schedule D Part II - Change in Valuing Inventories Including Cost Allocation Changes ===== -->
      <div class="styBB" style="width:187mm;border-top:1px solid black; ">
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
         Is the applicant subject to section 263A? If   No,  go to line 4a
          </div>
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ..............
          </span>    
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplicationSubjectToSectionInd"/>
                </xsl:call-template> 
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplicationSubjectToSectionInd"/>
              <xsl:with-param name="BackupName">Application Subject To Sec263AYes</xsl:with-param>  
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplicationSubjectToSectionInd"/>
              <xsl:with-param name="BackupName">Application Subject To Sec263AYes</xsl:with-param> 
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplicationSubjectToSectionInd"/>
                </xsl:call-template> 
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplicationSubjectToSectionInd"/>
                <xsl:with-param name="BackupName">Application Subject To Sec263ANo</xsl:with-param>
              </xsl:call-template>
            </input></span>            
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ApplicationSubjectToSectionInd"/>
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
       Is the applicant's present inventory valuation method in compliance with section 263A (see instructions)? 
        </div>  
      </div>        
      <div style="width:187mm">      
        <div class="styIRS3115LNLeftLtrBox" style="height:4mm;"/>        
        <!--<div style="float:left">-->
        <div style="float:left">
          If   No, attach a detailed explanation
        </div>
        <div class="styIRS3115YNChxBoxDiv">  
			<span class="styDotLn" style="padding-right:0">
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PresInvntryVltnMethodCmplncInd"/>              
				</xsl:call-template>  
           ......................
            </span>    
			<span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PresInvntryVltnMethodCmplncInd"/>
                </xsl:call-template> 
				<input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PresInvntryVltnMethodCmplncInd"/>
                <xsl:with-param name="BackupName">Present Invntry Vltn Mthd Per263AYes</xsl:with-param>
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PresInvntryVltnMethodCmplncInd"/>
                <xsl:with-param name="BackupName">Present Invntry Vltn Mthd Per263AYes</xsl:with-param>
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
      <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PresInvntryVltnMethodCmplncInd"/>
                </xsl:call-template> 
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PresInvntryVltnMethodCmplncInd"/>
              <xsl:with-param name="BackupName">Present Invntry Vltn Mthd Per263ANo</xsl:with-param>   
              </xsl:call-template>
            </input></span>            
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PresInvntryVltnMethodCmplncInd"/>
              <xsl:with-param name="BackupName">Present Invntry Vltn Mthd Per263ANo</xsl:with-param>
              </xsl:call-template>   
              <b>No</b>
            </label>  
        </div>          
      </div>    
      <br/>
      <table style="width:187mm; font-size:9pt" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <th style="padding-left:1.5mm; text-align:left; width:8mm;height:4.5mm;" valign="center" nowrap="nowrap" scope="col">
            4a
          </th>
          <th  scope="col"  style="font-weight:normal;width:100mm;text-align:left;height:4.5mm;padding-left:3mm;" nowrap="nowrap" valign="center">
            Check the appropriate boxes in the chart.
          </th>
          <th class="styIRS3115TblRB2" style="border-top:1px solid black; font-weight:bold:width:50mm;" nowrap="nowrap" colspan="2" scope="col">
            Inventory Method Being Changed
          </th>
          <th class="styIRS3115TblRB2" style="border-top:1px solid black; font-weight:bold; padding-bottom:1mm; padding-top:1mm;width:25mm" nowrap="nowrap" scope="col">
            Inventory Method Not<br/>Being Changed
          </th>          
        </tr>
        <tr>
          <td style=" width:8mm;height:4.5mm;"></td>
          <th scope="row" nowrap="nowrap" style="text-align:left; font-weight:normal;width:100mm;padding-left:3mm;">
            Identification methods:  
          </th>
          <th class="styIRS3115TblRB2" style="font-weight:normal; width:25mm" nowrap="nowrap" scope="row">
            Present method
          </th>
          <th class="styIRS3115TblRB2" style="font-weight:normal; width:25mm" nowrap="nowrap" scope="row">
            Proposed method
          </th>  
          <th class="styIRS3115TblRB2" style="font-weight:normal; width:25mm" nowrap="nowrap" scope="row">
            Present method
          </th>          
        </tr>
        <tr align="center">
          <td style=" width:8mm;height:4.5mm;"></td>
          <th scope="row" nowrap="nowrap" style="text-align:left; font-weight:normal;width:100mm;padding-left:3mm;">
            <div style="float:left; font-weight:normal; padding-left:4mm">
              Specific identification
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                ...............
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2" style="font-weight:normal; width:25mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethodTxt/Methods/SpecificIdentificationInd"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2" style="font-weight:normal; width:25mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethodTxt/Methods/SpecificIdentificationInd"/>              
            </xsl:call-template>
          </td>  
          <td class="styIRS3115TblRB2" style="font-weight:normal; width:25mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethodTxt/Methods/SpecificIdentificationInd"/>              
            </xsl:call-template>
          </td>          
        </tr>
        <tr align="center">
          <td style=" width:8mm;height:4.5mm;" />
          <th scope="row" nowrap="nowrap" style="text-align:left; font-weight:normal;width:100mm;padding-left:3mm;">
            <div style="float:left; font-weight:normal; padding-left:4mm">
              FIFO
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                .....................
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2" style="font-weight:normal; width:25mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethodTxt/Methods/FIFOInd"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2" style="font-weight:normal; width:25mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethodTxt/Methods/FIFOInd"/>              
            </xsl:call-template>
          </td>  
          <td class="styIRS3115TblRB2" style="font-weight:normal; width:25mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethodTxt/Methods/FIFOInd"/>              
            </xsl:call-template>
          </td>            
        </tr>
        <tr align="center">
          <td style=" width:8mm;height:4.5mm;" />
          <th scope="row" nowrap="nowrap" style="text-align:left; font-weight:normal;width:100mm;padding-left:3mm;">
            <div style="float:left; font-weight:normal; padding-left:4mm">
              LIFO
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                ...................
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2" style="font-weight:normal; width:25mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethodTxt/Methods/LIFOInd"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2" style="font-weight:normal; width:25mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethodTxt/Methods/LIFOInd"/>              
            </xsl:call-template>
          </td>  
          <td class="styIRS3115TblRB2" style="font-weight:normal; width:25mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethodTxt/Methods/LIFOInd"/>              
            </xsl:call-template>
          </td>          
        </tr>
              <tr  align="center">
          <td style=" width:8mm;height:4.5mm;" />
          <th scope="row" nowrap="nowrap" style="text-align:left; font-weight:normal;width:100mm;padding-left:3mm;">
            <div style="float:left; font-weight:normal; padding-left:4mm">
              Other (attach explanation)
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                ..............
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2" align="center" style="font-weight:normal; width:25mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethodTxt/Methods/OtherIdentificationMethodInd"/>              
            </xsl:call-template>
            <span style="width:2px"/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethodTxt/Methods/OtherIdentificationMethodInd"/>
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2" align="center" style="font-weight:normal; width:25mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethodTxt/Methods/OtherIdentificationMethodInd"/>              
            </xsl:call-template>
            <span style="width:2px"/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethodTxt/Methods/OtherIdentificationMethodInd"/>
            </xsl:call-template>  
          </td>  
          <td class="styIRS3115TblRB2" align="center" style="font-weight:normal; width:25mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethodTxt/Methods/OtherIdentificationMethodInd"/>              
            </xsl:call-template>
            <span style="width:2px"/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethodTxt/Methods/OtherIdentificationMethodInd"/>
            </xsl:call-template>  
          </td>          
        </tr>
        <tr align="center" valign="bottom" title=".">
          <td style=" width:8mm;height:4.5mm;" />
          <th scope="row" nowrap="nowrap" style="text-align:left; font-weight:normal;width:100mm;padding-left:3mm;">
            <div style="font-weight:normal">Valuation methods:</div>
            <br />
            <div style=" font-weight:normal; padding-left:4mm">
              Cost
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                ...................
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethodTxt/Methods/CostInd"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethodTxt/Methods/CostInd"/>              
            </xsl:call-template>
          </td>  
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethodTxt/Methods/CostInd"/>              
            </xsl:call-template>
          </td>              
        </tr>
        <tr align="center">
          <td tyle=" width:8mm;height:4.5mm;" />
          <th scope="row" nowrap="nowrap"  style="text-align:left; font-weight:normal;width:100mm;padding-left:3mm;">
            <div style="float:left; font-weight:normal; padding-left:4mm">
              Cost or market, whichever is lower
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                .........
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethodTxt/Methods/CostOrMarketInd"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethodTxt/Methods/CostOrMarketInd"/>              
            </xsl:call-template>
          </td>  
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethodTxt/Methods/CostOrMarketInd"/>              
            </xsl:call-template>
          </td>            
        </tr>
        <tr align="center">
          <td style=" width:8mm;height:4.5mm;" />
          <th scope="row" nowrap="nowrap"  style="text-align:left; font-weight:normal;width:100mm;padding-left:3mm;">
            <div style="float:left; font-weight:normal; padding-left:4mm">
              Retail cost
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                .................
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethodTxt/Methods/RetailCostInd"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethodTxt/Methods/RetailCostInd"/>              
            </xsl:call-template>
          </td>  
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethodTxt/Methods/RetailCostInd"/>              
            </xsl:call-template>
          </td>      
        </tr>
        <tr align="center">
          <td style=" width:8mm;height:4.5mm;" />
          <th scope="row" nowrap="nowrap" style="text-align:left; font-weight:normal;width:100mm;padding-left:3mm;">
            <div style="float:left; font-weight:normal; padding-left:2mm">
              Retail, lower of cost or market
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                ...........
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethodTxt/Methods/LowerRetailOfCostOrMarketInd"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethodTxt/Methods/LowerRetailOfCostOrMarketInd"/>              
            </xsl:call-template>
          </td>  
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethodTxt/Methods/LowerRetailOfCostOrMarketInd"/>              
            </xsl:call-template>
          </td>            
        </tr>
        <tr align="center">
          <td style=" width:8mm;height:4.5mm;" />
          <th scope="row" nowrap="nowrap" style="text-align:left; font-weight:normal;width:100mm;padding-left:3mm;">
            <div style="float:left; font-weight:normal; padding-left:2mm">
              Other (attach explanation)
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
                ..............
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2">
          
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethodTxt/Methods/OtherValutionMethodInd"/>              
            </xsl:call-template>  
            <span style="width:2px"/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethodTxt/Methods/OtherValutionMethodInd"/>
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2">
           
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethodTxt/Methods/OtherValutionMethodInd"/>              
            </xsl:call-template>
            <span style="width:2px"/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethodTxt/Methods/OtherValutionMethodInd"/>
            </xsl:call-template>  
          </td>  
          <td class="styIRS3115TblRB2">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethodTxt/Methods/OtherValutionMethodInd"/>              
            </xsl:call-template>
            <span style="width:2px"/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryNotBeingChanged/PresentMethodTxt/Methods/OtherValutionMethodInd"/>
            </xsl:call-template>  
          </td>          
        </tr>
        <tr align="center">
          <th scope="row" align="right" style=" width:8mm;height:4.5mm;">b </th>
          <th scope="row" nowrap="nowrap" style="text-align:left; font-weight:normal;width:100mm;padding-left:3mm;">
            <div style="float:left; font-weight:normal">
              Enter the value at the end of the tax year preceding the year of change
            </div>
            <div style="float:right">
              <span style="letter-spacing:3.3mm">      
               
              </span>
            </div>    
          </th>
          <td class="styIRS3115TblRB2">
          $  <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/PresentMethodTxt/ValueEndOfTaxYearBefYrOfChgAmt"/>              
            </xsl:call-template>  
          </td>
          <td class="styIRS3115TblRB2">
          $  <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/InventoryBeingChanged/ProposedMethodTxt/ValueEndOfTaxYearBefYrOfChgAmt"/>              
            </xsl:call-template>
          </td>            
          <td class="styIRS3115TblRB2" style="background-color:lightgrey"> </td>          
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
          <b>Only for applicants requesting a non-automatic change.</b> A statement describing whether the applicant is changing to the<br/> method required by Regulations section 1.472-6(a) or (b), or whether the applicant is proposing a different method.
        </div>
      </div>
      <div style="width:187mm">      
        <div class="styIRS3115LNLeftLtrBox">c</div>        
        <div style="float:left;width:181mm;">
          <b>Only for applicants requesting an automatic change.</b> The statement required by section 22.01(5) of Rev.
Proc. 2015-14 (or its successor).
        </div>
      </div>
      <xsl:call-template name="IRS3115Footer">
        <xsl:with-param name="thisPage" select="7"/>
      </xsl:call-template>
            
      <div class="styBB" style="width:187mm; border-top:2px solid black">
        <div class="styPartName" style="width:13mm; font-size:9.5pt">Part III</div>
        <div class="styPartDesc" style="width:170mm;  padding-bottom:0.5mm;height:auto;font-weight:normal;">
         <span style="font-size:9.5pt;font-weight:bold;"> Method of Cost Allocation </span> (Complete this part if the requested change involves either property subject<br/>to section 263A or long-term contracts as described in section 460). See instructions.
        </div>        
      </div>    
      
      <div style="width:187mm">
        <b>Section A - Allocation and Capitalization Methods</b>  
      </div>        
      
      <div style="width:189mm; margin-top:1mm">
        Attach a description (including sample computations) of the present and proposed method(s) the applicant uses to capitalize direct and indirect costs properly allocable to real or tangible personal property produced and property acquired for resale, or to allocate direct and indirect costs required to be allocated to long-term contracts. Include a description of the method(s) used for allocating indirect costs to intermediate cost objectives such as departments or activities prior to the allocation of such costs to long-term contracts, real or tangible personal property produced, and property acquired for resale. The description must include the following:
      </div>
      
      <div style="width:187mm; padding-top:1mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">1</div>
        <div style="float:left">
          The method of allocating direct and indirect costs (for example, specific identification, burden rate, standard cost, or other<br/>reasonable allocation method).
        </div>  
      </div>      
      
      <div style="width:187mm; padding-top:1mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">2</div>
        <div style="float:left">
          The method of allocating mixed service costs (for example, direct reallocation, step-allocation, simplified service cost using the<br/>labor-based allocation ratio, simplified service cost using the production cost allocation ratio, or other reasonable allocation<br/>method).
        </div>  
      </div>      
      
      <div style="width:187mm; padding-top:1mm; ">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">3</div>
        <div style="float:left;width:180mm;">
          Except for long-term contract accounting methods, the method of capitalizing additional section 263A costs (for example, simplified production with or without the historic absorption ratio election, simplified resale with or without the historic absorption ratio election including permissible variations, the U.S. ratio, or other reasonable allocation method).
        </div>  
      </div>      
      
      <div class="styBB" style="border-top:1px solid black; width:187mm; padding-top:1mm; padding-bottom:1.5mm"><b>Section B-Direct and Indirect Costs Required To Be Allocated</b><br/>Check the appropriate boxes showing the costs that are or will be fully included, to the extent required, in the cost of real or tangible personal property produced or property acquired for resale under section 263A or allocated to long-term contracts under section 460. Mark N/A in a box if those costs are not incurred by the applicant. If a box is not checked, it is assumed that those costs are not fully included to the extent required. Attach an explanation for boxes that are not checked.
      </div>  
      <div style="width:187mm">
        <div style="float:right">
          <div class="styIRS3115SchDP3" style="text-align:center;font-weight:bold;">Present method</div>
          <div class="styIRS3115SchDP3" style="text-align:center;font-weight:bold;">Proposed method</div>
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/DirectMaterial/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/DirectMaterial/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/DirectLabor/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/DirectLabor/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IndirectLabor/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IndirectLabor/ProposedMethodTxt"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="padding-left:1.5mm">4</div>
        <div style="float:left">
          Officers' compensation (not including selling activities)
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .............
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OfficersCompensation/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OfficersCompensation/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PensionAndOtherRelatedCosts/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PensionAndOtherRelatedCosts/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EmployeeBenefits/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EmployeeBenefits/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IndirectMaterialsAndSupplies/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IndirectMaterialsAndSupplies/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PurchasingCosts/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/PurchasingCosts/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/HandlingProcessingAssemblyCost/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/HandlingProcessingAssemblyCost/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OffsiteStorageWarehousingCosts/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OffsiteStorageWarehousingCosts/ProposedMethodTxt"/>              
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
          <div class="styIRS3115SchDP3" style="border-bottom:0"/>
          <div class="styIRS3115SchDP3" style="border-bottom:0"/>
        </div>  
      </div>  
      
      <div style="width:187mm">                
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
          service and not temporarily idle
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            .....................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/DeprecAmortzAndCostRecovery/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/DeprecAmortzAndCostRecovery/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Depletion/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Depletion/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Rent/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Rent/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/TaxesNotStateLocalAndForeign/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/TaxesNotStateLocalAndForeign/ProposedMethodTxt"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  

      <!-- ******************************************************************  -->
          <div style="width:187mm;">                
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Insurance/PresentMethodTxt"/>              
            </xsl:call-template>  
          </div>
          <div class="styIRS3115SchDP3">
              <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Insurance/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Utilities/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Utilities/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/MaintRepairsProdResaleLTCntrct/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/MaintRepairsProdResaleLTCntrct/ProposedMethodTxt"/>              
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
          <div class="styIRS3115SchDP3" style="border-bottom:0"/>
          <div class="styIRS3115SchDP3" style="border-bottom:0"/>
        </div>  
      </div>  
      
      <div style="width:187mm;">                
        <div class="styIRS3115LNLeftNumBox" style="height:4mm;"/>
        <div style="float:left">
          expenses)
        </div>  
        <div style="float:right">
          <span class="styDotLn" style="padding-right:0">
            ............................
          </span>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EngineeringAndDesignCosts/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/EngineeringAndDesignCosts/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ReworkLaborScrapAndSpoilage/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ReworkLaborScrapAndSpoilage/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ToolsAndEquipment/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ToolsAndEquipment/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/QualityControlAndInspection/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/QualityControlAndInspection/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ContractBiddingExpnssIncurred/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/ContractBiddingExpnssIncurred/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LicensingAndFranchiseCosts/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/LicensingAndFranchiseCosts/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/CapitalizableServiceCosts/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/CapitalizableServiceCosts/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AdministrativeCosts/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/AdministrativeCosts/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/RsrchAndExptlExpnssLTContracts/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/RsrchAndExptlExpnssLTContracts/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Interest/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Interest/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherCostsRqrToBeAllocated/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3" style="border-bottom:0">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherCostsRqrToBeAllocated/ProposedMethodTxt"/>              
            </xsl:call-template>
          </div>          
        </div>  
      </div>        
        
      <xsl:call-template name="IRS3115Footer">
        <xsl:with-param name="thisPage" select="8"/>
      </xsl:call-template>
            
      <div class="styBB" style="width:187mm; border-top:2px solid black">
        <div class="styPartName" style="width:13mm; font-size:9.5pt">Part III</div>
        <div class="styPartDesc" style="width:170mm; font-size:9.5pt">
          Method of Cost Allocation. <span style="font-weight:normal">See instructions. (continued)</span>
        </div>        
      </div>    
      
      <div class="styBB" style="width:187mm">
        <b>Section C-Other Costs Not Required To Be Allocated</b> (Complete Section C only if the applicant is requesting to change its<br/>method for these costs.)  
      </div>        
      
      <div style="width:187mm">
        <div style="float:right">
          <div class="styIRS3115SchDP3" style="text-align:center;font-weight:bold;">Present method</div>
          <div class="styIRS3115SchDP3" style="text-align:center;font-weight:bold;">Proposed method</div>
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/MarketingSellAdvtgDistriExpnss/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/MarketingSellAdvtgDistriExpnss/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherResearchAndExptlExpenses/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherResearchAndExptlExpenses/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherBiddingExpenses/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherBiddingExpenses/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/GeneralAndAdministrativeCosts/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/GeneralAndAdministrativeCosts/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IncomeTaxes/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/IncomeTaxes/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/CostOfStrikes/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/CostOfStrikes/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/WarrantyProductLiabilityCosts/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/WarrantyProductLiabilityCosts/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Section179Costs/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/Section179Costs/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OnSiteStorage/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OnSiteStorage/ProposedMethodTxt"/>              
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherDeprecAmortzCostRecovery/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherDeprecAmortzCostRecovery/ProposedMethodTxt"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
            
      <div style="width:187mm; border-bottom:1px solid black;">                
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
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherCostsNotRqrToBeAllocated/PresentMethodTxt"/>              
            </xsl:call-template>
          </div>
          <div class="styIRS3115SchDP3" style="border-bottom:0">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleD/OtherCostsNotRqrToBeAllocated/ProposedMethodTxt"/>              
            </xsl:call-template>
          </div>
        </div>  
      </div>  
      
      <div class="styBB" style="width:187mm;font-size:9.5pt;height:8mm;padding-top:2mm;">
        <b>Schedule E-Change in Depreciation or Amortization.</b> See instructions.
      </div>  
      
      <div style="width:187mm; padding-top:1mm;">
        <div style="padding-bottom:1mm;">Applicants requesting approval to change their method of accounting for depreciation or amortization complete this section.<br/>Applicants <b>must</b> provide this information for each item or class of property for which a change is requested.<br/>
        </div>
        <span><b>Note:</b>  See the <i><b>Summary of the List of Automatic Accounting Method Changes</b></i> in the instructions for information regarding automatic changes under sections 56, 167, 168, 197, 1400I, 1400L, or former section 168.<i><b> Do not</b></i> file Form 3115 with respect to certain late electionsand election revocations. See instructions.</span>        
      </div>  
        <div style="float:left">
          <i></i>
        </div>
      
      <xsl:variable name="schECount" select="count($Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization)"/>  
      <div style="width:187mm">
        <xsl:attribute name="style">  
          <xsl:if test="$schECount &gt; 1">
            width:187mm
          </xsl:if>
        </xsl:attribute>   
        <div style="float:right">            
          <xsl:call-template name="SetTableToggleButton">
             <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization"/>
              <xsl:with-param name="containerHeight" select="1"/>
              <xsl:with-param name="containerID" select="'schETPctn'"/>
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
        <table class="styTable" style="width:100%; border-bottom:0; font-size:9pt;" cellspacing="0" cellpadding="0" border="0" id="schETPctn">
          <xsl:if test="($Print != $Separated and $Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization) or (count($Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization) = 1)">          
            <xsl:call-template name="SchETemplate">
              <xsl:with-param name="max">
                <xsl:choose>
                     <xsl:when test="$schECount &gt; 1">     
                    <xsl:value-of select="$schECount"/>
                     </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="1"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="not($Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization)">
            <xsl:call-template name="SchETemplate">
            <xsl:with-param name="max" select="1"/>
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="($Print = $Separated) and (count($Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization) &gt;1)">
            <xsl:call-template name="SchETemplate">
            <xsl:with-param name="max" select="1"/>
             <xsl:with-param name="IsSeparated" select=" 'yes' "/>
            </xsl:call-template>
          </xsl:if>
        </table>              
      </div>    
    
      <div class="styIRS3115LNLeftNumBox" style="text-align:center; padding-top:1mm">5</div>  
    <div style="width:181mm;float:left; padding-top:1mm;">
     To the extent not already provided in the applicant's description of its present method, attach a statement explaining how the property is treated under the applicant’s present method (for example, depreciable property, inventory property, supplies under Regulations section 1.162-3, nondepreciable section 263(a) property, property deductible as a current expense, etc.).
    </div> 
    <br/>   
    <div class="styIRS3115LNLeftNumBox" style="text-align:center; padding-top:1mm">6</div>  
    <div style="width:181mm;float:left; padding-top:1mm;">
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
      The Code section under which the property is or will be depreciated or amortized (for example, section 168(g)).
    </div>     
    <br/>
    <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">b</div>
    <div style="float:none; padding-top:1mm"> The applicable asset class from Rev. Proc. 87-56, 1987-2 C.B. 674, for each asset depreciated under section 168 (MACRS)<br/>or under section 1400L; the applicable asset class from Rev. Proc. 83-35, 1983-1 C.B. 745, for each asset depreciated under<br/>former section 168 (ACRS); an explanation why no asset class is identified for each asset for which an asset class has not<br/>been identified by the applicant.
      <!--The applicable asset class from Rev. Proc. 87-56, 1987-2 C.B. 674, for each asset depreciated under section 168 (MACRS)<br/>or under section 1400L; the applicable asset class from Rev. Proc. 83-35, 1983-1 C.B. 745, for each asset depreciated under<br/>former section 168 (ACRS); an explanation why no asset class is identified for each asset for which an asset class has not<br/>been identified by the applicant.-->
    </div>  
    <br/>   
    <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">c</div>
    <div style="float:left; padding-top:1mm">
       The facts to support the asset class for the proposed method.
    </div>  
    <br/>   
    <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">d</div>
    <div style="float:left; padding-top:1mm">
       The depreciation or amortization method of the property, including the applicable Code section (for example, 200% declining <br/>balance method under section 168(b)(1)).
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
    <div style="float:none; padding-top:1mm;width:180mm;">Whether the additional first-year special depreciation allowance (for example, as provided by section 168(k), 168(l), 168(m), 168(n), 1400L(b), or 1400N(d)) was or will be claimed for the property. If not, also provide an explanation as to why no special depreciation allowance was or will be claimed.
    </div>  
    <br/>   
      <div class="styIRS3115LNLeftLtrBox" style="padding-top:1mm">h</div>
    <div style="float:none; padding-top:1mm">Whether the property was or will be in a single asset account, a multiple asset account, or a general asset account.
    </div>  
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
          <xsl:with-param name="TargetNode" select="$Form3115Data"/>
          <xsl:with-param name="DescWidth" select="110"/>
        </xsl:call-template>
        <xsl:call-template name="PopulateLeftoverRow">
          <xsl:with-param name="Desc">120-Day Window Ending Date of Examination - Part II Line 4e</xsl:with-param>
          <xsl:with-param name="TargetNode" select="$Form3115Data/ExaminationEndDt"/>
          <xsl:with-param name="DescWidth" select="110"/>
        </xsl:call-template>  
        <tr>
          <td class="styLeftOverTableRowDesc" style="width:110mm;" scope="row">
            Does the Applicant Qualifies For a Reduced User Fee - Part III Line 24b:
          </td>
          <td class="styLeftOverTableRowAmount" style="width:77mm;text-align:left;">
            <xsl:if test="$Form3115Data/QlfyRdcUserFeeRqrInfoAttInd = '1'">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form3115Data/QlfyRdcUserFeeRqrInfoAttInd"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form3115Data/QlfyRdcUserFeeRqrInfoAttInd = '0'">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form3115Data/QlfyRdcUserFeeRqrInfoAttInd"/>
              </xsl:call-template>
            </xsl:if>
          </td>
        </tr>
      </table>          
      
      <xsl:call-template name="leftOverTbl">
        <xsl:with-param name="itemName" select="$Form3115Data/ReturnsUnderExaminationInfo"/>
        <xsl:with-param name="desc" select="'Form 3115, Part II, Line 6a - Does the applicant (or any present or former consolidated group in which the applicant was a member during the applicable tax year(s)) have any federal income tax return(s) under examination?'"/>                  
        <xsl:with-param name="colTitle" select="'Examination Period'"/>                
        <xsl:with-param name="lineNum" select="'6a'"/>                            
      </xsl:call-template>
      
      <xsl:call-template name="leftOverTbl">
        <xsl:with-param name="itemName" select="$Form3115Data/AcctMthdChgUndConsiderationGrp"/>
        <xsl:with-param name="desc" select="'Form 3115, Part II, Line 6b - Is the method of accounting the applicant is requesting to change an issue under consideration (with respect to either the applicant or any present or former consolidated group in which the applicant was a member during the applicable tax year(s))?'"/>                  
        <xsl:with-param name="colTitle" select="'Consideration'"/>            
        <xsl:with-param name="lineNum" select="'6b'"/>                      
      </xsl:call-template>
      
      <!-- Begin separated repeating data tables for part II Line 6c-->
    <xsl:if test="($Print = $Separated) and (count($Form3115Data/ExaminingAgentContactInfo) &gt;1)">
    <br/>
      <span class="styRepeatingDataTitle" style="font-size:8pt;">Form 3115, Part II, Line 6c - Enter the name and telephone number of the examining agent and the tax year(s) under examination</span>
      <table class="styDepTbl" cellspacing="0" style="font-size:8pt;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:100mm;">Name</th>
          <th class="styDepTblCell" scope="col" style="width:40mm;">Telephone number</th>
          <th class="styDepTblCell" scope="col" style="width:40mm;">Tax year(s)</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
      <xsl:for-each select="$Form3115Data/ExaminingAgentContactInfo">
              <tr>
              <xsl:attribute name="class">
                <xsl:choose>
                   <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                   <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
                <td class="styDepTblCell" style="height:4.5mm;text-align:left;border-left:1px solid 0px;">      
                  <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="PersonNm"/></xsl:call-template>
                </td>
                <td class="styDepTblCell" style="height:4.5mm;text-align:center;"><xsl:call-template name="PopulatePhoneNumber"><xsl:with-param name="TargetNode" select="PhoneNum"/></xsl:call-template><span style="width:1px;"/></td>
                <td class="styDepTblCell" style="height:4.5mm;text-align:center;"><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="TaxYr"/></xsl:call-template><span style="width:1px;"/></td>
              </tr>
          </xsl:for-each>  
      
       </tbody>
    </table> <br/>     
    </xsl:if>  

    <xsl:if test="($Print = $Separated) and (count($Form3115Data/AOOrGovtCounselCntctInfo) &gt;1)">
      <span class="styRepeatingDataTitle" style="font-size:8pt;">Form 3115, Part II, Line 8c -  If “Yes,” enter the name of the (check the box), telephone number, and the tax year(s) before Appeals and/or a federal court. </span>
      <table class="styDepTbl" cellspacing="0" style="font-size:8pt;">
      <thead class="styTableThead" scope="col">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:100mm;">Name</th>
          <th class="styDepTblCell" scope="col" style="width:40mm;">Telephone number</th>
          <th class="styDepTblCell" scope="col" style="width:40mm;">Tax year(s)</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
      <xsl:for-each select="$Form3115Data/AOOrGovtCounselCntctInfo">
              <tr>
              <xsl:attribute name="class">
                <xsl:choose>
                   <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                   <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
                <td class="styDepTblCell" style="height:4.5mm;text-align:left;border-left:1px solid 0px;">      
                  <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="PersonNm"/></xsl:call-template>
                </td>
                <td class="styDepTblCell" style="height:4.5mm;text-align:center;"><xsl:call-template name="PopulatePhoneNumber"><xsl:with-param name="TargetNode" select="PhoneNum"/></xsl:call-template><span style="width:1px;"/></td>
                <td class="styDepTblCell" style="height:4.5mm;text-align:center;"><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="TaxYr"/></xsl:call-template><span style="width:1px;"/></td>
              </tr>
          </xsl:for-each>  
      
       </tbody>
    </table> <br/>     
    </xsl:if>  
    <br/>
    
    <xsl:if test="($Print = $Separated) and (count($Form3115Data/GrossReceipts4YrsPreceding) &gt;1)">
      <span class="styRepeatingDataTitle" style="font-size:8pt;">Form 3115, Part II, Line 19a - If the applicant is changing to either the overall cash method, an overall accrual method, or is changing its method of accounting for any property subject to section 263A, any long-term contract subject to section 460 (see 19b), or inventories subject to section 474, enter the applicant's gross receipts for the 3 tax years preceding the tax year of change.</span>
      <table class="styDepTbl" cellspacing="0" style="font-size:8pt;">
		  <thead class="styTableThead">
			<tr class="styDepTblHdr">
				<th nowrap="nowrap" scope="col" class="styDepTblCell" style="width:30.6mm;border-right-width:0px;">
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
				<th class="styDepTblCell" scope="col" style="width:25mm;border-left-width:0px;vertical-align:bottom;">
				  yr.                  
				</th>  
			  </tr>  
			</thead>  
        <tfoot/>
        <tbody>
			<xsl:for-each select="$Form3115Data/GrossReceipts4YrsPreceding">
				<tr align="left" style="height:4mm">  
						  <xsl:attribute name="class">
							<xsl:choose>
							   <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
							   <xsl:otherwise>styDepTblRow2</xsl:otherwise>
							</xsl:choose>
						  </xsl:attribute>
				  <td style="border-right-width:0px;text-align:right;" nowrap="nowrap" class="styDepTblCell">                  
					$
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GrossReceiptsForFirstPrecYrAmt"/>
					  </xsl:call-template><span style="width:1px;"/>
				  </td>
				  <td class="styDepTblCell" style="border-left-width:0px;text-align:center;">
					  <xsl:call-template name="PopulateMonth">
						<xsl:with-param name="TargetNode" select="FirstPrecedingYearEndDt"/>
					  </xsl:call-template><span style="width:2mm"/>   
					  <xsl:call-template name="PopulateYear">
						<xsl:with-param name="TargetNode" select="FirstPrecedingYearEndDt"/>
					  </xsl:call-template>
				  </td>
				  <td style="border-right-width:0px;text-align:right;" nowrap="nowrap" class="styDepTblCell">                  
					<div style="padding-left:1mm">$
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GrossReceiptsFor2ndPrecYrAmt"/>
					  </xsl:call-template>  
					</div>        
				  </td>
				  <td class="styDepTblCell" style="border-left-width:0px;text-align:center;">
					<xsl:call-template name="PopulateMonth">
					  <xsl:with-param name="TargetNode" select="SecondPrecedingYearEndDt"/>
					</xsl:call-template><span style="width: 2mm"/>
					<xsl:call-template name="PopulateYear">
					  <xsl:with-param name="TargetNode" select="SecondPrecedingYearEndDt"/>
					</xsl:call-template>
				  </td>    
				  <td style="border-right-width:0px;text-align:right;" nowrap="nowrap" class="styDepTblCell">                  
					<div style="padding-left:1mm">$          
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GrossReceiptsForThirdPrecYrAmt"/>
					  </xsl:call-template><span style="width:1px;"/>
					</div>
				  </td>    
				  <td class="styDepTblCell" style="border-left-width:0px;text-align:center;">
				   <xsl:call-template name="PopulateMonth">
					  <xsl:with-param name="TargetNode" select="ThirdPrecedingYearEndDt"/>
					</xsl:call-template><span style="width: 2mm"/>
					<xsl:call-template name="PopulateYear">
					  <xsl:with-param name="TargetNode" select="ThirdPrecedingYearEndDt"/>
					</xsl:call-template><span style="width:1px;"/>
				  </td>      
				</tr>   
			</xsl:for-each>
		</tbody>
      </table>
       <br/>
    </xsl:if>  

    <xsl:if test="($Print = $Separated) and (count($Form3115Data/GrossReceipts4YrsPreceding) &gt;1)">
      <span class="styRepeatingDataTitle" style="font-size:8pt;">Form 3115, Part II, Line 19b - If the applicant is changing its method of accounting for any long-term contract subject to section 460, in addition to completing 19a, enter the applicant's gross receipts for the 4th tax year preceding the tax year of change:</span>
      <table class="styDepTbl" cellspacing="0" style="font-size:8pt;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:60mm;">4th preceding year ended:mo.</th>
          <th class="styDepTblCell" scope="col" style="width:50mm;">yr. </th>
          <th class="styDepTblCell" scope="col" style="width:50mm;">$</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
      <xsl:for-each select="$Form3115Data/GrossReceipts4YrsPreceding">
              <tr>
              <xsl:attribute name="class">
                <xsl:choose>
                   <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                   <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
                <td class="styDepTblCell" style="height:4.5mm;;text-align:center;border-left:1px solid 0px;">      
                  <xsl:call-template name="PopulateMonth"><xsl:with-param name="TargetNode" select="FourthPrecedingYearEndDt"/></xsl:call-template>
                </td>
                <td class="styDepTblCell" style="height:4.5mm;text-align:center;"><xsl:call-template name="PopulateYear"><xsl:with-param name="TargetNode" select="FourthPrecedingYearEndDt"/></xsl:call-template><span style="width:1px;"/></td>
                <td class="styDepTblCell" style="height:4.5mm;text-align:right;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="GrossReceiptsFor4thPrecYrAmt"/></xsl:call-template><span style="width:1px;"/></td>
              </tr>
          </xsl:for-each>  
       </tbody>
    </table> <br/>     
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
          <br/>
        <div class="styGenericDiv">
          <div style="padding-right:1mm;font-weight:bold;width:6mm;text-align:left;padding-left:.5mm;" class="styGenericDiv">1</div>
          <div style="float:left">
            Is depreciation for the property determined under Regulations section 1.167(a)-11 (CLADR)?
          </div>  
          <div class="styIRS3115YNChxBoxDiv">  
            <span class="styDotLn" style="padding-right:1mm">      
              .......
            </span>    
            <span>
              <xsl:call-template name="PopulateSpan">
             <xsl:with-param name="TargetNode" select="PropertyDeprecUnderSectionInd"/>
              </xsl:call-template> 
              <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
                <xsl:call-template name="PopulateYesCheckbox">
              <xsl:with-param name="TargetNode" select="PropertyDeprecUnderSectionInd"/>
              <xsl:with-param name="BackupName">Property Deprec Under Sect1167a11Yes</xsl:with-param>
                </xsl:call-template>
              </input>
             </span>            
              <label>
                <xsl:call-template name="PopulateLabelYes">
             <xsl:with-param name="TargetNode" select="PropertyDeprecUnderSectionInd"/>
             <xsl:with-param name="BackupName">Property Deprec Under Sect1167a11Yes</xsl:with-param>
                </xsl:call-template>   
                <b>Yes</b>
              </label>  
              <span style="width:3mm"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                 <xsl:with-param name="TargetNode" select="PropertyDeprecUnderSectionInd"/>
                </xsl:call-template> 
                <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="PropertyDeprecUnderSectionInd"/>
                  <xsl:with-param name="BackupName">Property Deprec Under Sect1167a11No</xsl:with-param>
                  </xsl:call-template>
                </input>
               </span>            
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="PropertyDeprecUnderSectionInd"/>
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
            <div class="styGenericDiv" style="border-bottom:1px solid black;width:187mm;">
            <div style="padding-left:.5mm;padding-right:1mm;font-weight:bold;width:6mm;text-align:left;" class="styGenericDiv"/>
            <div style="float:left">
                If   Yes, the only changes permitted are under Regulations section 1.167(a)-11(c)(1)(iii).
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
            <span class="styDotLn" style="padding-left:4mm;">
            .         
            </span>  
            <span>
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="DepreciationOrAmortizationInd"/>
              </xsl:call-template>   
              <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
                <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="DepreciationOrAmortizationInd"/>
               <xsl:with-param name="BackupName">Any Deprec Or Amortz Rqr Under Code Yes</xsl:with-param>
                </xsl:call-template>
              </input>
             </span>            
            <label>
              <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="DepreciationOrAmortizationInd"/>
               <xsl:with-param name="BackupName">Any Deprec Or Amortz Rqr Under Code Yes</xsl:with-param>
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
            <span>
              <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="DepreciationOrAmortizationInd"/>
              </xsl:call-template>   
              <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="DepreciationOrAmortizationInd"/>
                <xsl:with-param name="BackupName">Any Deprec Or Amortz Rqr Under Code No</xsl:with-param>  
                </xsl:call-template>
              </input>
             </span>            
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="DepreciationOrAmortizationInd"/>
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
        <div class="styGenericDiv" style="border-bottom:1px solid black;width:187mm;">
          <div style="padding-left:.5mm;padding-right:1mm;font-weight:bold;text-align:left;width:6mm;" class="styGenericDiv"/>
          <div style="float:left">
            If   Yes, enter the applicable section  
            <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>  
            <span style="border-bottom:1px solid black; width:100mm; padding-left:1mm;text-align:left;">          
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ApplicableSectionTxt"/>
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
          <span class="styDotLn" style="padding-left:1mm">     
          .
          </span>    
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="DeprecOrAmortzElectionMadeInd"/>
            </xsl:call-template> 
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
             <xsl:with-param name="TargetNode" select="DeprecOrAmortzElectionMadeInd"/>
               <xsl:with-param name="BackupName">Deprec Or Amortz Election Been MadeYes</xsl:with-param>
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="DeprecOrAmortzElectionMadeInd"/>
             <xsl:with-param name="BackupName">Deprec Or Amortz Election Been MadeYes</xsl:with-param>
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
            <span>
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="DeprecOrAmortzElectionMadeInd"/>
              </xsl:call-template> 
              <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="DeprecOrAmortzElectionMadeInd"/>
                <xsl:with-param name="BackupName">Deprec Or Amortz Election Been Made No</xsl:with-param>   
                </xsl:call-template>
              </input>
           </span>            
          <label>
            <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="DeprecOrAmortzElectionMadeInd"/>
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
          <div class="styGenericDiv" style="border-bottom:1px solid black;width:187mm;">
        <div style="padding-left:.5mm;padding-right:1mm;font-weight:bold;width:6mm;" class="styGenericDiv"/>
        <div style="float:left">
          If   Yes, state the election made  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>  
        <span style="border-bottom:1px solid black; width:106mm; padding-left:1mm;text-align:left;"> 
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ElectionMadeTxt"/>
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
          <div class="styGenericDiv" style="border-bottom:1px solid black;width:187mm;">
            <div style="padding-left:.5mm;padding-right:1mm;font-weight:bold;width:6mm;text-align:left;" class="styGenericDiv">4a</div>
            <div style="float:left;text-align:left;">
            To the extent not already provided, attach a statement describing the property being changed. Include in the description the<br/>type of property, the year the property was placed in service, and the property's use in the applicant's trade or business or
            </div>
            <div style="float:left;text-align:left;padding-left:6mm;">income-producing activity.</div>
			<div class="styGenericDiv">
			  <xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="."/>              
			  </xsl:call-template>
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
      <div class="styGenericDiv" style="border-bottom:1px solid black;width:187mm;">
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
                  <xsl:with-param name="TargetNode" select="LivedInPropertyBefRentingItInd"/>
                </xsl:call-template>     
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="LivedInPropertyBefRentingItInd"/>
                 <xsl:with-param name="BackupName">Lived In Property Before Renting It Yes</xsl:with-param>
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="LivedInPropertyBefRentingItInd"/>
                    <xsl:with-param name="BackupName">Lived In Property Before Renting It Yes</xsl:with-param>
              </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
      		<span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="LivedInPropertyBefRentingItInd"/>
                </xsl:call-template>     
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="LivedInPropertyBefRentingItInd"/>
                   <xsl:with-param name="BackupName">Lived In Property Before Renting It No</xsl:with-param> 
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="LivedInPropertyBefRentingItInd"/>
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
    <div class="styGenericDiv" style="border-bottom:1px solid black;width:187mm;">
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
                  <xsl:with-param name="TargetNode" select="PublicUtilityPropertyInd"/>
                </xsl:call-template> 
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="PublicUtilityPropertyInd"/>
                    <xsl:with-param name="BackupName">Public Utility Property Yes</xsl:with-param>
              </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="PublicUtilityPropertyInd"/>
                   <xsl:with-param name="BackupName">Public Utility Property Yes</xsl:with-param>
                </xsl:call-template>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
            <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="PublicUtilityPropertyInd"/>
                </xsl:call-template> 
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="PublicUtilityPropertyInd"/>
                    <xsl:with-param name="BackupName">Public Utility Property No</xsl:with-param>
                 </xsl:call-template>
            </input>
           </span>            
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="PublicUtilityPropertyInd"/>
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
  <xsl:param name="itemName"/>
  <xsl:param name="desc"/>  
  <xsl:param name="lineNum"/>  
  <xsl:param name="colTitle"/>      
  <xsl:if test="count($itemName) &gt; 0">
    <br/>
    <div style="width:187mm">
      <span class="styRepeatingDataTitle" style="font-size:8pt;">        
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
              <xsl:if test="$lineNum = '6a'">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ExaminationPeriodBeginDt"/>
                </xsl:call-template>  
              </xsl:if>
              <xsl:if test="$lineNum = '6b'">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ConsiderationStartDt"/>
                </xsl:call-template>
              </xsl:if>      
              <xsl:if test="$lineNum = '6c'">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="IssuePendingExaminationStartDt"/>
                </xsl:call-template>
              </xsl:if>                      
            </td>
            <td class="styDepTblCell">                  
              <xsl:if test="$lineNum = '6a'">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ExaminationPeriodEndDt"/>
                </xsl:call-template>  
              </xsl:if>
              <xsl:if test="$lineNum = '6b'">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ConsiderationEndDt"/>
                </xsl:call-template>
              </xsl:if>    
              <xsl:if test="$lineNum = '6c'">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="IssuePendingExaminationEndDt"/>
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
  <xsl:param name="max"/>  
  <xsl:param name="thisElement"/>
  <xsl:if test="$index &lt;= $max">    
    <tr align="left">                      
      <td style="width:10mm">
        Name
      </td>  
      <td style="width:3mm" align="center">
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      </td>
      <td style="border-bottom:1px solid black; width:62mm" class="stySmallText">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$thisElement[$index]/PersonNm"/>
        </xsl:call-template>
      </td>
      <td style="width:30mm" nowrap="nowrap" align="center">
        Telephone number
      </td>  
      <td style="width:3mm;" align="center">
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      </td>
      <td style="border-bottom:1px solid black; width:21mm" align="center">
        <xsl:call-template name="PopulatePhoneNumber">
          <xsl:with-param name="TargetNode" select="$thisElement[$index]/PhoneNum"/>
        </xsl:call-template>
      </td>
      <td style="width:19mm" nowrap="nowrap" align="center">
        Tax year(s)
      </td>  
      <td style="width:3mm" align="center">
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>
      </td>
      <td style="border-bottom:1px solid black; width:14mm" align="center">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$thisElement[$index]/TaxYr"/>
        </xsl:call-template>
      </td>
      <td class="styIRS3115TblRB" style="border-bottom:0; width:2.7mm"> </td>
      <td class="styIRS3115TblRB" style="border-bottom:0; background-color:lightgrey; width:6.3mm"> </td>                
      <td style="border-bottom:0; background-color:lightgrey"> </td>
    </tr>                
    <xsl:call-template name="prt2Template">      
      <xsl:with-param name="index" select="$index + 1"/>
      <xsl:with-param name="max" select="$max"/>
      <xsl:with-param name="thisElement" select="$thisElement"/>
    </xsl:call-template>  
  </xsl:if>                  
</xsl:template>    
  
<xsl:template name="line19Template">  
  <xsl:param name="index" select="1"/>  
  <xsl:param name="max"/>
  <xsl:param name="IsSeparated" select=" 'no' "/>  
  <xsl:if test="$index &lt;= $max">    
    <tr align="left" style="height:4mm">                      
      <td>                  
        <xsl:attribute name="style">  
          <xsl:choose>
            <xsl:when test="$index = $max">
              border-bottom:0;
            </xsl:when>
            <xsl:otherwise>
              border-bottom:1px solid black;
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>     
        $
		<xsl:choose>                        
		  <xsl:when test="$IsSeparated = 'yes' ">
			<xsl:call-template name="PopulateAdditionalDataTableMessage">
				<xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts4YrsPreceding"/>                      
          </xsl:call-template>
		  </xsl:when>    
		  <xsl:otherwise>    
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts4YrsPreceding[$index]/GrossReceiptsForFirstPrecYrAmt"/>
          </xsl:call-template><span style="width:1px;"/>
		  </xsl:otherwise>    
		</xsl:choose>      
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
        <xsl:if test="$IsSeparated = 'yes' ">
			<xsl:attribute name="style">  
				  border-bottom:0;width:25mm
			</xsl:attribute>     
        </xsl:if>
        <xsl:if test="$IsSeparated != 'yes' ">
          <xsl:call-template name="PopulateMonth">
            <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts4YrsPreceding[$index]/FirstPrecedingYearEndDt"/>
          </xsl:call-template><span style="width:2mm"/>   
        </xsl:if>
        <xsl:if test="$IsSeparated != 'yes' ">
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts4YrsPreceding[$index]/FirstPrecedingYearEndDt"/>
          </xsl:call-template>
        </xsl:if> <span style="width:1px;"/>
      </td>
      <td style="border-bottom:1">                  
        <xsl:attribute name="style">  
          <xsl:choose>
            <xsl:when test="$index = $max">
              border-bottom:0
            </xsl:when>
            <xsl:otherwise>
              border-bottom:1px solid black
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>   
        <div style="padding-left:1mm">$
        <xsl:if test="$IsSeparated != 'yes' ">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts4YrsPreceding[$index]/GrossReceiptsFor2ndPrecYrAmt"/>
          </xsl:call-template>  
        </xsl:if><span style="width:1px;"/>
        </div>        
      </td>
      <td class="styIRS3115TblRB">
        <xsl:attribute name="style">  
          <xsl:choose>
            <xsl:when test="$index = $max">
              border-bottom:0
            </xsl:when>
            <xsl:otherwise>
              border-bottom:1px solid black
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>   
        <xsl:if test="$IsSeparated != 'yes' ">
        <xsl:call-template name="PopulateMonth">
          <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts4YrsPreceding[$index]/SecondPrecedingYearEndDt"/>
        </xsl:call-template><span style="width: 2mm"/>
        <xsl:call-template name="PopulateYear">
          <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts4YrsPreceding[$index]/SecondPrecedingYearEndDt"/>
        </xsl:call-template>
        </xsl:if><span style="width:1px;"/>
      </td>    
      <td style="border-bottom:1" nowrap="nowrap">                  
        <xsl:attribute name="style">  
          <xsl:choose>
            <xsl:when test="$index = $max">
              border-bottom:0
            </xsl:when>
            <xsl:otherwise>
              border-bottom:1px solid black
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>   
        <div style="padding-left:1mm">$          
        <xsl:if test="$IsSeparated != 'yes' ">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts4YrsPreceding[$index]/GrossReceiptsForThirdPrecYrAmt"/>
          </xsl:call-template><span style="width:1px;"/>
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
              border-bottom:1px solid black
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>       
         <xsl:if test="$IsSeparated != 'yes' ">
       <xsl:call-template name="PopulateMonth">
          <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts4YrsPreceding[$index]/ThirdPrecedingYearEndDt"/>
        </xsl:call-template><span style="width: 2mm"/>
        <xsl:call-template name="PopulateYear">
          <xsl:with-param name="TargetNode" select="$Form3115Data/GrossReceipts4YrsPreceding[$index]/ThirdPrecedingYearEndDt"/>
        </xsl:call-template>
        </xsl:if><span style="width:1px;"/>
      </td>      
      <td class="styIRS3115TblRB" style="border-bottom:0; background-color:lightgrey"> </td>                
      <td style="border-bottom:0; background-color:lightgrey"> </td>
    </tr>                
    <xsl:call-template name="line19Template">      
      <xsl:with-param name="index" select="$index + 1"/>
      <xsl:with-param name="max" select="$max"/>
    </xsl:call-template>  
  </xsl:if>                  
</xsl:template>

<xsl:template name="SchETemplate">  
  <xsl:param name="index" select="1"/>  
  <xsl:param name="max"/>
  <xsl:param name="IsSeparated">no</xsl:param>  
  <!-- Added the IsSeparated param as the same template is used to show the empty rows when the data is set to show in the separated table and also to show the data when the separated is not set to true.  So, this parameter acts as a switch controlling when to show the data and when not to show the data.  By default it is set to "no' which indicates data will be shown.  This parameter is set to true when the separated flag has evaluated to true  -->
  <xsl:if test="$index &lt;= $max">    
    <tr>
      <td colspan="4">
       <xsl:if test="$IsSeparated = 'no' ">
        </xsl:if>
      </td>
    </tr>
    <tr align="left">                
      <td style="width:1.5mm"/>
      <th scope="row" align="left">1</th>
      <td style="width:1mm"/>
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
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PropertyDeprecUnderSectionInd"/>
             <xsl:with-param name="BackupName">PropertyDeprecUnderSect1167a11</xsl:with-param> 
                </xsl:call-template> 
              </xsl:if>
              <input type="Checkbox" style="height:3.5mm;" class="styCkbox" id="PropertyDeprecUnderSect1167a11yes">
                     <xsl:if test="$IsSeparated = 'no' ">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PropertyDeprecUnderSectionInd"/>
             <xsl:with-param name="BackupName">PropertyDeprecUnderSect1167a11Yes</xsl:with-param>   
              </xsl:call-template>
              </xsl:if>
            </input>
           </span>            
            <label for="PropertyDeprecUnderSect1167a11yes">
                   <xsl:if test="$IsSeparated = 'no' ">
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PropertyDeprecUnderSectionInd"/>
                   <xsl:with-param name="BackupName">PropertyDeprecUnderSect1167a11Yes</xsl:with-param>           
          </xsl:call-template> 
              </xsl:if>
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
      <span>
             <xsl:if test="$IsSeparated = 'no' ">

                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PropertyDeprecUnderSectionInd"/>
                </xsl:call-template> 
              </xsl:if>
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox" id="PropertyDeprecUnderSect1167a11no">
                   <xsl:if test="$IsSeparated = 'no' ">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PropertyDeprecUnderSectionInd"/>
                  <xsl:with-param name="BackupName">PropertyDeprecUnderSect1167a11No</xsl:with-param>            
              </xsl:call-template>
              </xsl:if>
            </input>
           </span>            
            <label for="PropertyDeprecUnderSect1167a11no">
                   <xsl:if test="$IsSeparated = 'no' ">
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PropertyDeprecUnderSectionInd"/>
                     <xsl:with-param name="BackupName">PropertyDeprecUnderSect1167a11No</xsl:with-param>             
              </xsl:call-template>   
              </xsl:if>
              <b>No</b>
            </label>  
        </div>        
      </td>      
    </tr>      
    <tr>
      <td/>
      <td/>
      <td/>
      <td>
        If   Yes, the only changes permitted are under Regulations section 1.167(a)-11(c)(1)(iii).
      </td>
    </tr>  
    <tr>  
      <td/>
      <th scope="row" align="left">2</th>
      <td/>
      <td>
        Is any of the depreciation or amortization required to be capitalized under any Code section such as section
      </td>
    </tr>  
    <tr>
      <td/>
      <td/>
      <td/>
      <td>
        <div style="float:left">
          263A?
        </div>  
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            .................................
          </span>  
      <span>
                <xsl:if test="$IsSeparated = 'no' ">
               <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DepreciationOrAmortizationInd"/>
                </xsl:call-template>
              </xsl:if>   
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
                <xsl:if test="$IsSeparated = 'no' ">
             <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DepreciationOrAmortizationInd"/>
             <xsl:with-param name="BackupName">AnyDeprecOrAmortzRqrUnderCodeYes</xsl:with-param>   
              </xsl:call-template>
            </xsl:if>
            </input>
           </span>            
            <label>
                 <xsl:if test="$IsSeparated = 'no' ">
            <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DepreciationOrAmortizationInd"/>

             <xsl:with-param name="BackupName">AnyDeprecOrAmortzRqrUnderCodeYes</xsl:with-param>   
              </xsl:call-template>
            </xsl:if>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
      <span>
                  <xsl:if test="$IsSeparated = 'no' ">
             <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DepreciationOrAmortizationInd"/>
                </xsl:call-template> 
              </xsl:if>  
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
               <xsl:if test="$IsSeparated = 'no' ">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DepreciationOrAmortizationInd"/>
        <xsl:with-param name="BackupName">AnyDeprecOrAmortzRqrUnderCodeNo</xsl:with-param>
              </xsl:call-template>
            </xsl:if>
            </input>
           </span>            
            <label>
               <xsl:if test="$IsSeparated = 'no' ">
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DepreciationOrAmortizationInd"/>
          <xsl:with-param name="BackupName">AnyDeprecOrAmortzRqrUnderCodeNo</xsl:with-param>
              </xsl:call-template>
              </xsl:if>   
              <b>No</b>
            </label>  
        </div>    
      </td>
    </tr>  
    <tr>
      <td/>
      <td/>
      <td/>
      <td>
        If   Yes, enter the applicable section  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>  
        <span style="border-bottom:1px solid black; width:100mm; padding-left:1mm">
         <xsl:if test="$IsSeparated = 'no' ">          
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/ApplicableSectionTxt"/>
          </xsl:call-template>
        </xsl:if>
         <xsl:if test="$IsSeparated = 'yes' ">
           See Additional Data Table for Lines 1 Through 4c.
         </xsl:if>          
        </span>
      </td>
    </tr>
    <tr>  
      <td/>
      <th scope="row" align="left">3</th>
      <td/>
      <td>
      Has a depreciation, amortization, expense, or disposition election been made for the property (such as., 
      </td>
    </tr>
    <tr>
      <td/>
      <td/>
      <td/>
      <td>
        <div style="float:left">
        the election under sections 168(f)(1), 168(i)(4), 179, or 179C, or Regulations section 1.168(i)-8(d))?
        </div>  
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ..
          </span>    
      <span>
         <xsl:if test="$IsSeparated = 'no' ">          
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DeprecOrAmortzElectionMadeInd"/>
                </xsl:call-template> 
              </xsl:if>
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
         <xsl:if test="$IsSeparated = 'no' ">          
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DeprecOrAmortzElectionMadeInd"/>
         <xsl:with-param name="BackupName">DepreOrAmortzElectionBeenMadeYes</xsl:with-param>  
              </xsl:call-template>
            </xsl:if>
            </input>
           </span>            
            <label>
         <xsl:if test="$IsSeparated = 'no' ">          
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DeprecOrAmortzElectionMadeInd"/>
              <xsl:with-param name="BackupName">DepreOrAmortzElectionBeenMadeYes</xsl:with-param>
              </xsl:call-template>
            </xsl:if>   
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
      <span>
         <xsl:if test="$IsSeparated = 'no' ">          
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DeprecOrAmortzElectionMadeInd"/>
                </xsl:call-template> 
              </xsl:if>
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
         <xsl:if test="$IsSeparated = 'no' ">          
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DeprecOrAmortzElectionMadeInd"/>
          <xsl:with-param name="BackupName">DepreOrAmortzElectionBeenMadeNo</xsl:with-param>  
              </xsl:call-template>
            </xsl:if>
            </input>
           </span>            
            <label>
         <xsl:if test="$IsSeparated = 'no' ">          
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/DeprecOrAmortzElectionMadeInd"/>
               <xsl:with-param name="BackupName">DepreOrAmortzElectionBeenMadeNo</xsl:with-param>  
              </xsl:call-template>   
            </xsl:if>
              <b>No</b>
            </label>
        </div>  
      </td>
    </tr>
    <tr>
      <td/>
      <td/>
      <td/>
      <td>
        If   Yes, state the election made  
        <img src="{$ImagePath}/3115_Bullet.gif" alt="Right Arrow Bullet"/>  
        <span style="border-bottom:1px solid black; width:106mm; padding-left:1mm"> 
         <xsl:if test="$IsSeparated = 'no' ">          
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/ElectionMadeTxt"/>
          </xsl:call-template>
        </xsl:if>
        </span>
      </td>
    </tr>
    <tr>  
      <td/>
      <th scope="row" valign="top">4a</th>
      <td/>
      <td>
        To the extent not already provided, attach a statement describing the property subject to the change. Include in the description the type of property, the year the property was placed in service, and the property's use in the applicant's trade or business or income-producing activity.

          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]"/>              
          </xsl:call-template>
      </td>
    </tr>
    <tr>  
      <td/>
      <th scope="row" align="right">b</th>
      <td/>
      <td>
        <div style="float:left;padding-top:1mm;">
          If the property is residential rental property, did the applicant live in the property before renting it?
        </div>  
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ..
          </span>
          <span>
           <xsl:if test="$IsSeparated = 'no' ">          
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/LivedInPropertyBefRentingItInd"/>
              </xsl:call-template>    
            </xsl:if> 
             <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
               <xsl:if test="$IsSeparated = 'no' ">          
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/LivedInPropertyBefRentingItInd"/>
           <xsl:with-param name="BackupName">Lived In Property Before Renting It Yes</xsl:with-param>       
                  </xsl:call-template>
                </xsl:if>
              </input>
           </span>            
            <label>
               <xsl:if test="$IsSeparated = 'no' ">          
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/LivedInPropertyBefRentingItInd"/>
                          <xsl:with-param name="BackupName">Lived In Property Before Renting It Yes</xsl:with-param>    
                </xsl:call-template>   
              </xsl:if>
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
            <span>
             <xsl:if test="$IsSeparated = 'no' ">          
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/LivedInPropertyBefRentingItInd"/>
                </xsl:call-template> 
              </xsl:if>    
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
               <xsl:if test="$IsSeparated = 'no' ">          
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/LivedInPropertyBefRentingItInd"/>
                     <xsl:with-param name="BackupName">Lived In Property Before Renting It No</xsl:with-param>           
                  </xsl:call-template>
                </xsl:if>
            </input>
           </span>            
            <label>
               <xsl:if test="$IsSeparated = 'no' ">          
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/LivedInPropertyBefRentingItInd"/>
                           <xsl:with-param name="BackupName">Lived In Property Before Renting It No</xsl:with-param>   
                </xsl:call-template>   
              </xsl:if>
              <b>No</b>
            </label>  
        </div>    
      </td>
    </tr>
    <tr>  
      <td/>
      <th scope="row" align="right">c</th>
      <td/>
      <td>
        <div style="float:left;padding-top:1mm;">
          Is the property public utility property?
        </div>  
        <div class="styIRS3115YNChxBoxDiv">  
          <span class="styDotLn" style="padding-right:0">      
            ......................
          </span>    
          <span>
           <xsl:if test="$IsSeparated = 'no' ">          
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PublicUtilityPropertyInd"/>
                </xsl:call-template> 
            </xsl:if>
            <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
               <xsl:if test="$IsSeparated = 'no' ">          
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PublicUtilityPropertyInd"/>
      <xsl:with-param name="BackupName"> Public Utility Property Yes</xsl:with-param>          
                  </xsl:call-template>
                </xsl:if>
            </input>
           </span>            
            <label>
               <xsl:if test="$IsSeparated = 'no' ">          
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PublicUtilityPropertyInd"/>
                <xsl:with-param name="BackupName"> Public Utility Property Yes</xsl:with-param>      
                  </xsl:call-template>   
                </xsl:if>
              <b>Yes</b>
            </label>  
            <span style="width:3mm"/>
              <span>
               <xsl:if test="$IsSeparated = 'no' ">          
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PublicUtilityPropertyInd"/>
                  </xsl:call-template> 
              </xsl:if>
              <input type="Checkbox" style="height:3.5mm;" class="styCkbox">
               <xsl:if test="$IsSeparated = 'no' ">          
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PublicUtilityPropertyInd"/>
            <xsl:with-param name="BackupName"> Public Utility Property No</xsl:with-param>          
                  </xsl:call-template>
                </xsl:if>
              </input>
             </span>            
              <label>
               <xsl:if test="$IsSeparated = 'no' ">          
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form3115Data/IRS3115ScheduleE/ChangeInDeprecOrAmortization[$index]/PublicUtilityPropertyInd"/>
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
  <xsl:param name="thisPage"/>    
  <div style="width:187mm; border-top:2px solid black; page-break-after:always" class="pageEnd">  
    <xsl:if test="$thisPage = 2">
      <div style="font-weight:bold; float:left; font-size:8pt; ">
        For Privacy Act and Paperwork Reduction Act Notice, see the instructions.
      </div>    
    </xsl:if>           
    <div style="float:right; font-size:7pt">
      <xsl:if test="$thisPage = 2">
        <span style="margin-right:10mm">Cat. No. 19280E</span>
      </xsl:if>       
      Form <b style="font-size:9pt">3115</b> (Rev. 12-2015)
    </div>      
  </div> 
   <p style="page-break-before:always"/> 
  <xsl:if test="$thisPage != 9">
    <div style="width:187mm; font-size:7pt">    
      <div style="float:left">
        Form 3115 (Rev. 12-2015)
      </div>    
      <div style="float:right; font-size:7pt">
        Page <b style="font-size:9pt"><xsl:value-of select="$thisPage"/></b> 
      </div>      
    </div>  
  </xsl:if> 
</xsl:template>

</xsl:stylesheet>