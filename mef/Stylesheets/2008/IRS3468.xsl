<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS3468Style.xsl"/>
<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<!--  Defines the stage of the data, e.g. original or latest -->

<xsl:param name="Form3468Data" select="$RtnDoc/IRS3468" />


<xsl:template match="/">

<html>
  <head>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form3468Data)"></xsl:with-param></xsl:call-template></title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private" />
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="Description" content="IRS Form 3468" />
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
    <style type="text/css">  
     <xsl:if test="not($Print) or $Print=''">    
        <xsl:call-template name="IRS3468Style"></xsl:call-template>        
    <xsl:call-template name="AddOnStyle"></xsl:call-template>    
 </xsl:if>  
</style>    
  <xsl:call-template name="GlobalStylesForm"/>
</head>

  <body class="styBodyClass">

    <form name="Form3468">
      <xsl:call-template name="DocumentHeader"/>  
      <!-- Begin Form Number and Name -->
      <div class="styTBB" style="width:187mm;height:20mm;">
        <div class="styFNBox" style="width:34mm;height:21mm;">
          <div style="height:8.25mm;">
            Form <span class="styFormNumber" >3468</span>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form3468Data" />
            </xsl:call-template>
          </div>
          <div style="height:6mm;font-family:arial;font-size:7pt; padding-top:1.5mm" >
            <span class="styAgency">(Rev. December 2006)</span><br/>
            <span class="styAgency">Department of the Treasury</span><br/>
            <span class="styAgency">Internal Revenue Service</span> <span class="styAgency" style="padding-left:3mm;">(99)</span> 
          </div>        
        </div>
        <div class="styFTBox" style="width:122mm;height:20mm;">
            <div class="styMainTitle" style="height:12mm;">
              Investment Credit 
            </div>
            <div class="styFBT">
              <img src="{$ImagePath}/3468_Bullet.gif" alt="bullet image"/> Attach to your tax return. See instructions.
            </div>        
        </div>
        <div class="styTYBox" style="width:30mm;height:20mm;line-height:110%;">
          <div class="styOMB" style="height:2mm;">
            OMB No. 1545-0155
          </div>
          <div class="styTY" style="height:8mm;font-size:25pt;line-height:110%;">
           
          </div>
          <div style="height:6.8mm;text-align:left;padding-left:3mm;">
            Attachment<br/>
            Sequence No. <span class="styBoldText">52</span>
          </div>
        </div>
      </div>
      <!-- End Form Number and Name section -->
      <!-- Begin Names and Identifying number section -->
      <div class="styBB" style="width:187mm;">
        <div class="styNameBox" style="width:146mm;height:8mm;font-size:7pt;font-weight:normal;">
          Name(s) shown on return<br/>
          <span>
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>
          </span>            
        </div>
        <div class="styEINBox" style="width:30mm;height:4mm;font-size:7pt;font-weight:bold;padding-left:2mm;">
          Identifying number<br/><br />
          <span style="width:25mm;text-align:left;font-size:7pt;font-weight:normal;">
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>          
          </span>      
        </div>
      </div>    
      <!-- End Names and Identifying number section -->
      <!-- Begin Current Year Credit Section -->
     
      <div class="styBB" style="width:187mm;">
        <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4mm;">
            1
          </div>
          <div class="styLNDesc" style="width:137.9mm;height:4mm;">
            Rehabilitation credit
            (see instructions for requirements that must be met):
          </div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm"></div>
          <div class="styLNAmountBox" style="border-bottom-width: 0px"></div>
        </div>
        <div style="width:187mm;">
          <div class="styLNLeftLtrBox" style="height:4mm;">a</div>
          <div class="styLNDesc" style="width:137.9mm;height:4mm;">
            <label>
  <!--            <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form3468Data/RehabilitationExpendituresUsed" />
              </xsl:call-template>            -->
              Check this box if you are electing under section 47(d)(5) to
              take your qualified rehabilitation expenditures into account
              for the tax year in which paid (or, for self-rehabilitated
              property, when capitalized). See instructions.
              <span class = "styBoldText">Note: </span>
              <span class = "styItalicText">This election applies to the
                current tax year and to all later tax years. You may
                not revoke this election without IRS consent
              </span>
            </label>
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
              <span style="width:12px;"></span>
            </span>
            <img src="{$ImagePath}/3468_Bullet.gif" width="7" alt="bullet image"/>
            <input type="checkbox" class="styCkbox" onclick="return false;" >
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form3468Data/RehabilitationExpendituresUsed" />
              </xsl:call-template>  
            </input>
                   
          </div>
          <div class="styLNRightNumBox" style="background-color:lightgrey;height:14mm; border-bottom-width: 0px"></div>
          <div class="styLNAmountBox" style="height: 14mm;border-bottom-width: 0px"></div>
        </div>
        <!-- Line 1B -->
        
        <div style="width:187mm;">
          <div class="styLNLeftLtrBox" style="width:8mm;">b</div>
          <div class="styLNDesc" style="width:48.2mm;;">
            Enter the date on which the 24-or<br/>
            60-month measuring period begins
          </div>
           <div class="styIRS3468LNSLeftLtrBoxBB" style="padding-left:0.5mm;"></div>  

          <div class="styUnderlineAmount" style="width:30mm;text-align:center;padding-top:3.5mm;">
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="$Form3468Data/RehbltTestPeriodBeginningDate" />                  
            </xsl:call-template>
          </div>
          <div class="styGenericDiv" style="padding-top:3.5mm;width:18mm;text-align:center;">
            and ends
          </div>                      
          <div class="styUnderlineAmount" style="width:30mm;text-align:center;padding-top:3.5mm;">
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="$Form3468Data/RehbltTestPeriodEndDate" />                    
            </xsl:call-template>
          </div>
          <div class="styGenericDiv" style="width:4mm;"></div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm"></div>
          <div class="styLNAmountBox" style="border-bottom-width: 0px; height: 7.5mm"></div>
        </div>

        <!-- Line 1C -->
            
                <div style="width:187mm;">
          <div class="styLNLeftLtrBox" style="width:8mm;">c</div>        
              <div class="styLNDesc" style="width:93.1mm;height:4mm;">
            Enter the adjusted basis of the building as of the beginning
            date above (or the first day of your holding period, if later)
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
            </span>
          </div>
          <!-- check-2 -->
          <span class ="styUnderlineAmount" style ="width:2mm;height:4mm;padding-top:3mm;">$</span>
          <div class ="styUnderlineAmount" style ="width:31mm;height:4mm;padding-top:3mm;">
 
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3468Data/AdjustedBasisOfBuildingAmount" />                  
              </xsl:call-template>
          </div>
          <div class="styGenericDiv" style="width:11.75mm;"></div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"></div>
          <div class="styLNAmountBox" style="border-bottom-width: 0px; height: 7.5mm;"></div>

        </div>




        <!-- Line 1d --> 
        <div style="width:187mm;">
          <div class="styLNLeftLtrBox" style="width:8mm;">d</div>        
          <div class="styLNDesc" style="width:100mm;height:4mm;">
            Enter the amount of the qualified rehabilitation expenditures
            incurred, <br/>or treated as incurred, during the period on line
            1b above
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
            </span>
          </div>
     

          <!-- Check -->
            
            <span class ="styUnderlineAmount" style ="width:2mm;height:4mm;padding-top:3mm;">$</span>
         
          <div class ="styUnderlineAmount" style ="height:4mm;padding-top:3mm;width:32mm;">
               <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/QlfyRehbltExpendituresAmt" />
            </xsl:call-template>
          </div>
            <!--        <div class="styIRS3468LNSLeftLtrBoxBB" style="height:4mm;padding-left:0.5mm;"></div>   -->

          <div class="styGenericDiv" style="width:3.75mm;"></div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm"></div>
          <div class="styLNAmountBox" style="border-bottom-width: 0px; height: 7.5mm"></div>
        </div>

        <!-- header line 1 -->

                  <div style="width:187mm;">

          <div class="styLNDesc" style="width:137.9mm;height:4mm;padding-left:8mm;padding-right:4mm;">
   
            Enter the amount of qualified rehabilitation expenditures and multiply by the percentage shown:
          </div>
             <div class="styLNLeftNumBox" style="height:4mm;"></div>  
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm"></div>
          <div class="styLNAmountBox" style="border-bottom-width: 0px"></div>
        </div>
      
   <!-- Line 1E -->
            
          <div style="width:187mm;">
          <div class="styLNLeftLtrBox" style="height:4mm;width:8mm;">e</div>
          <div class="styLNDesc" style="width:137.9mm;height:4mm;">
        <div class="styGenericDiv" style="padding-left:0mm;padding-right:2mm; font-size:6pt;padding-right:11.5mm;">
        Pre-1936 buildings located in the Gulf Opportunity Zone
            <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form3468Data/CalcExpendPre1936Buildings"/>
                </xsl:call-template>
 </div>   
       
           <span class ="styUnderlineAmount" style ="width:1mm;height:4mm;padding-top:0mm;">$</span>
             <span class ="styUnderlineAmount" style="width:30.2mm;height:4mm;padding-top:0mm;">
               <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/QlfyRehbltPre1936Buildings" />                      
            </xsl:call-template>    
          </span>
          <span class="styGenericDiv" style="font-size:7pt; padding-top:1mm; padding-left:2mm;" >X 13% (.13)</span>
  
<span style="width:7mm"></span>
          </div>
                  
          <div class="styLNRightNumBox" style="height:5.5mm; padding-top:1mm;">1e
          </div>
          <div class="styLNAmountBox" style="height:5.5mm;padding-top:1mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/CalcExpendPre1936Buildings" />
            </xsl:call-template>
      
          </div>
        </div>
 
        <!-- Line1F -->
            
          <div style="width:187mm;">
          <div class="styLNLeftLtrBox" style="height:4mm;width:8mm;">f</div>
          <div class="styLNDesc" style="width:137.9mm;height:4mm;">
        <div class="styGenericDiv" style="width:6mm;padding-left:0mm;width:75.5mm;">Other pre-1936 buildings</div>   
       
           <span class ="styUnderlineAmount" style ="width:1mm;height:4mm;padding-top:0mm;">$</span>
             <span class ="styUnderlineAmount" style="width:30.2mm;height:4mm;padding-top:0mm;">
               <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/QlfyRehbltOtherPre1936Blds" />                      
            </xsl:call-template>    
          </span>
          <span class="styGenericDiv" style="font-size:7pt; padding-top:1mm; padding-left:2mm;" >X 10% (.10)</span>
          </div>
                
          <div class="styLNRightNumBox" style="height:5.5mm; padding-top:1mm;">1f
          </div>
          <div class="styLNAmountBox" style="height:5.5mm;padding-top:1mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/CalcExpendOtherPre1936Blds" />
            </xsl:call-template>
          </div>
        </div>
        
           <!-- Line 1G -->
            
          <div style="width:187mm;">
          <div class="styLNLeftLtrBox" style="height:4mm;width:8mm;">g</div>
          <div class="styLNDesc" style="width:137.9mm;height:4mm;;">
        <div class="styGenericDiv" style="width:75.5mm; font-size:6pt;">Certified historic structures located in the Gulf Opportunity Zone
      <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form3468Data/CalcExpendituresCertHistStrctr"/>
                </xsl:call-template>
<div style="width:60mm;">              
</div>  
</div>   
       
           <span class ="styUnderlineAmount" style ="width:1mm;height:4mm;padding-top:0mm;">$</span>
             <span class ="styUnderlineAmount" style="width:30.2mm;height:4mm;padding-top:0mm;">
               <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/CertifiedHistoricStructures" />                      
            </xsl:call-template>    
          </span>
          <span class="styGenericDiv" style="width:25mm;font-size:7pt; padding-top:1mm; padding-left:2mm;" >X 26% (.26)
          <xsl:call-template name="LinkToLeftoverBooleanDataTableInline">
          <xsl:with-param name="Desc">Line 1g - Certified Historic Structure on File</xsl:with-param>
         <xsl:with-param name="TargetNode" select="$Form3468Data/CertifiedHistoricStructures/@historicStructureCertOnFile"/>
          </xsl:call-template>


</span>
        

          </div>
                
          <div class="styLNRightNumBox" style="height:7.5mm; padding-top:1.5mm;">1g
          </div>
          <div class="styLNAmountBox" style="height:7.5mm;padding-top:2mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/CalcExpendituresCertHistStrctr" />
            </xsl:call-template>
          </div>
        </div>

<!-- Line 1H -->
            
          <div style="width:187mm;">
          <div class="styLNLeftLtrBox" style="height:4mm;width:8mm;">h</div>
          <div class="styLNDesc" style="width:137.9mm;height:4mm;">
        <div class="styGenericDiv" style="width:75.5mm;">Other certified historic structures</div>   
       
           <span class ="styUnderlineAmount" style ="width:1mm;height:4mm;padding-top:0mm;">$</span>
             <span class ="styUnderlineAmount" style="width:30.2mm;height:4mm;padding-top:0mm;">
               <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/OtherCertHistoricStructures" />                      
            </xsl:call-template>    
          </span>
          <span class="styGenericDiv" style="font-size:7pt; padding-top:1mm; padding-left:2mm;" >X 20% (.20)</span>
          </div>
                
          <div class="styLNRightNumBox" style="height:5.5mm; padding-top:1mm;">1h
          </div>
          <div class="styLNAmountBox" style="height:5.5mm;padding-top:1mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/CalcExpendOtherCertHistStrctr" />
            </xsl:call-template>
          </div>
        </div>


   <!-- header line 2 -->

                  <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4mm;width:8mm;">
        
          </div>
          <div class="styLNDesc" style="width:137.9mm;height:4mm;">
            For properties identified on lines 1g or 1h, complete lines 1i and 1j
           </div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm"></div>
          <div class="styLNAmountBox" style="border-bottom-width: 0px"></div>
        </div>


        
        <!-- Line 1I -->
        <div style="width:187mm;">
          <div class="styLNLeftLtrBox" style="width:8mm;">i</div>        
    
          <div class="styLNDesc" style="width:90.3mm;height:4mm;">
            Enter the assigned NPS project number or the pass-through
            entity's employer identification number (see instructions)
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
            </span>
             </div>
            <div class="styIRS3468LNSLeftLtrBoxBB" style="height:4mm;padding-left:0.5mm;"></div>   
          <div class ="styUnderlineAmount" style ="width:35.75mm;height:4mm;padding-top:3mm;text-align:right;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form3468Data/QualifiedRehabilitationNPS" />                  
            </xsl:call-template>
          </div>
          <div class="styGenericDiv" style="width:4mm;"></div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm"></div>
          <div class="styLNAmountBox" style="border-bottom-width: 0px; height: 7.5mm"></div>
         
        </div>
        
        <!-- Line 1j -->
        <div style="width:187mm;">
           <div class="styLNLeftLtrBox" style="width:8mm;">j</div>        
          
          <div class="styLNDesc" style="width:99.9mm;height:4mm;">
            Enter the date that the NPS approved the Request for Certification of <br/>
            Completed Work (see instructions)
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
            </span>
          </div>
          <div class ="styUnderlineAmount" style ="height:4mm;padding-top:3mm;width:26mm;text-align:center;">
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="$Form3468Data/DateOfNPSApproval" />
            </xsl:call-template>
          </div>
          <div class="styIRS3468LNSLeftLtrBoxBB" style="height:4mm;padding-left:0.5mm"></div>
          <div class="styGenericDiv" style="width:4mm;"></div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm"></div>
          <div class="styLNAmountBox" style="border-bottom-width: 0px; height: 7.5mm"></div>
        </div>
        
        
    <!-- Line 1k -->
      
         <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="width:8mm;">k</div>   
   
          <div class="styLNDesc" style="width:137.8mm;height:4.5mm;">
            Rehabilitation credit from an electing large partnership (Schedule K-1 (Form 1065-B), box 9)           
          </div>
          <div class="styLNRightNumBox" style="height:4.5mm;">1k</div>
          <div class="styLNAmountBox" style="height:4.5mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/RehabilitationCredit" />
            </xsl:call-template>
            
          </div>
          
        </div>

        
        <!-- Line 2 -->
        
       <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:1mm; ">2</div>
          <div class="styLNDesc" style="width:137.9mm;height:4.5mm;">
         Energy credit </div>
    
          <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"></div>
          <div class="styLNAmountBoxNBB" style="height:4.5mm"></div>   

        </div>    
    
    
    
    <!-- Line 2a -->
    
     <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; ">a</div>
          <div class="styLNDesc" style="width:137.9mm;height:4.5mm;font-size:9px;">
          
   Basis of property using geothermal energy placed in service during the </div>
          <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"></div>
          <div class="styLNAmountBoxNBB" style="height:4.5mm"></div>   
        </div>    
         <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; "></div>
          <div class="styLNDesc" style="width:40.4mm;height:4.5mm;font-size:9px; ">
           tax year (see instructions)

         </div>
             <span class ="styUnderlineAmount" style ="width:2mm;height:3.5mm;">$</span>
                       <div class ="styUnderlineAmount" style="width:29.5mm;height:3.5mm;">
                         <xsl:call-template name="PopulateAmount">
                               <xsl:with-param name="TargetNode" select="$Form3468Data/GeothermalEnergyPropertyBasis" />                      
                               </xsl:call-template>      
                        </div>
                         <div class="styGenericDiv" style="width:25.8mm;height:4.5mm;padding-top:2mm;"><span style="width:4px;"></span>X10% (.10)            </div>

           
          <div class="styLNRightNumBox" style="height:5.5mm;">2a</div>
          <div class="styLNAmountBox" style="height:5.5mm;">
                              <xsl:call-template name="PopulateAmount">
                               <xsl:with-param name="TargetNode" select="$Form3468Data/CalcGeothermalEnergyPropBssCr" />                      
                               </xsl:call-template>   
          </div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm"></div>
          <div class="styLNAmountBoxNBB" style="height: 5.5mm"></div>   
        </div>

 
 <!-- Line 2b -->
   
    
     <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; ">b</div>
          <div class="styLNDesc" style="width:98mm;height:4.5mm;font-size:8px;">
             Basis of property using solar illumination or solar energy placed in service during the</div>
         
    
          <div class="styLNRightNumBoxNBB" style="height:4.5mm;"></div>
          <div class="styLNAmountBoxNBB" style="height:4.5mm;">
        
          </div>
          <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"></div>
          <div class="styLNAmountBoxNBB" style="height:4.5mm"></div>   
        </div>    
        
         <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; "></div>
          <div class="styLNDesc" style="width:42mm;height:4.5mm;font-size:8px;">
           tax year (see instructions)

         </div>
             <span class ="styUnderlineAmount" style ="width:2mm;height:3.5mm;">$</span>
                       <div class ="styUnderlineAmount" style="width:30mm;height:3.5mm;">
                         <xsl:call-template name="PopulateAmount">
                               <xsl:with-param name="TargetNode" select="$Form3468Data/SolarIllumOrEnergyPropBss" />                      
                               </xsl:call-template>      
                        </div>
                         <div class="styGenericDiv" style="width:23.7mm;height:4.5mm;padding-top:2mm;"><span style="width:4px;"></span>X 30% (.30) 
                        </div>

           
          <div class="styLNRightNumBox" style="height:4.5mm;">2b</div>
          <div class="styLNAmountBox" style="height:4.5mm;">
                      <xsl:call-template name="PopulateAmount">
                       <xsl:with-param name="TargetNode" select="$Form3468Data/CalcSolarIllumOrEngeryPropBss" />                      
                       </xsl:call-template>      
     
          </div>
          
          
          
          <!-- Header 3 -->
          
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm"></div>
          <div class="styLNAmountBoxNBB" style="height: 5.5mm"></div>   
        </div>
            
                    <div style="width:187mm;">
             <div class="styLNDesc" style="width:145.9mm;height:4mm;padding-left:8mm;">
            Qualified fuel cell property (see instructions):          </div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm"></div>
          <div class="styLNAmountBox" style="border-bottom-width: 0px"></div>
        </div>

          
               <!--  Line 2c -->     
  
       <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; ">c</div>
          <div class="styLNDesc" style="width:137.9mm;height:4.5mm;font-size:9px;">
          Basis of property installed during the tax year</div>
         
          <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"></div>
          <div class="styLNAmountBoxNBB" style="height:4.5mm"></div>   
        </div>    
        
         <div style="width:187mm;">
                 <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; "></div>
                 <span class ="styUnderlineAmount" style ="width:2mm;height:3.5mm;">$</span>
                  <div class ="styUnderlineAmount" style="width:33mm;height:3.5mm;">
                        <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form3468Data/QualifiedFuelCellPropertyBasis" />                      
                         </xsl:call-template>       
                   </div>
                   <div class="styGenericDiv" style="width:18mm;height:4.5mm;padding-top:2mm;"><span style="width:22.8mm;">X 30% (.30)</span>            </div>
           
                  <div class="styLNRightNumBox" style="height:5.5mm;">2c</div>
                  <div class="styLNAmountBox" style="height:5.5mm;">
                      <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form3468Data/CalcQualifiedFuelCellPropBasis" />                      
                      </xsl:call-template>       
                  </div>
    
                  <div class="styLNAmountBoxNBB" style="height: 5.5mm;width:40mm;background-color:lightgrey;"></div> 
                 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm"></div>
                 <div class="styLNAmountBoxNBB" style="height: 5.5mm; "></div>   
  
        </div>
       
       
            <!--  Line 2d -->     

            <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; ">d</div>
          <div class="styLNDesc" style="width:58mm;height:4.5mm;font-size:9px;">
           Kilowatt capacity of property in <span style="font-weight:bold;"> c </span>above</div>
         
    
          <div class="styLNRightNumBoxNBB" style="height:4.5mm;"></div>
          <div class="styLNAmountBoxNBB" style="height:4.5mm;">
        
          </div>
          <div class="styLNAmountBoxNBB" style="height:4.5mm;background-color:lightgrey;width:40mm;"></div>   
          <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"></div>
          <div class="styLNAmountBoxNBB" style="height:4.5mm"></div>   
        </div>    
        
         <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; "></div>
          <div class="styLNDesc" style="width:12mm;height:4.5mm;font-size:8px;">
           <span class="styBoldText">
      <!--          <span style="width:10px;">.</span>
                <span style="width:10px;">.</span>
                <span style="width:10px;">.</span>      -->
                
           </span>


              <img src="{$ImagePath}/3468_Bullet.gif"  style="float"   alt="right arrow"/>
         </div>
    
                       <div class ="styUnderlineAmount" style="width:29mm;height:3.5mm;">
                              <xsl:call-template name="PopulateAmount">
                               <xsl:with-param name="TargetNode" select="$Form3468Data/QlfyFuelCellPropKwCapacity" />                      
                               </xsl:call-template>      
                        </div>
                         <div class="styGenericDiv" style="width:17mm;height:4.5mm;padding-top:2mm;"><span style="width:4px;"></span>X $1000  </div>

           
          <div class="styLNRightNumBox" style="height:5.5mm;">2d</div>
          <div class="styLNAmountBox" style="height:5.5mm;">
                <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyFuelCellPropKwCapacity" />                      
                  </xsl:call-template>      
  
          </div>
    

      
          <div class="styLNAmountBoxNBB" style="height: 5.5mm;width:40mm;background-color:lightgrey;"></div> 
                     <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm"></div>
          <div class="styLNAmountBoxNBB" style="height: 5.5mm"></div>   

  
        </div>

          <!-- Line 2e -->  
            
           <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">e</div>
          <div class="styLNDesc" style="width:98mm;height:4.5mm;">
            Enter the lesser of line 2c or 2d
            <!--Dotted Line-->
            <span class="styBoldText">
                <span style="width:4px;"></span>
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
          
          <div class="styLNRightNumBox" style="height:4.5mm;">2e</div>
          <div class="styLNAmountBox" style="height:4.5mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/AdjQlfyFuelCellPropertyCredit" />
            </xsl:call-template>
          </div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"></div>
          <div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"></div>
        </div>


        <!-- Line 2f -->     
            
        <div style="width:187mm;">
             <div class="styLNDesc" style="width:145.9mm;height:4mm;padding-left:8mm;">
             Qualified microturbine property (see instructions):
          </div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm"></div>
          <div class="styLNAmountBox" style="border-bottom-width: 0px"></div>
        </div>
      
    
      
             <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; ">f</div>
          <div class="styLNDesc" style="width:137.9mm;height:4.5mm;font-size:9px;">
          Basis of property installed during the tax  year</div>
         
    
    
          <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"></div>
          <div class="styLNAmountBoxNBB" style="height:4.5mm"></div>   

        </div>    
        
         <div style="width:187mm;">
                 <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; "></div>
                 <span class ="styUnderlineAmount" style ="width:2mm;height:3.5mm;">$</span>
                  <div class ="styUnderlineAmount" style="width:29mm;height:3.5mm;">
                         <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form3468Data/QlfyMircroturbinePropBasis" />                      
                          </xsl:call-template>    
                   </div>
                   <div class="styGenericDiv" style="width:18mm;height:4.5mm;padding-top:2mm;"><span style="width:26.8mm;">X 10% (.10)</span>            </div>
                   <div class="styLNRightNumBox" style="height:5.5mm;">2f</div>
                   <div class="styLNAmountBox" style="height:5.5mm;">
                                <xsl:call-template name="PopulateAmount">
                               <xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyMircroturbinePropBasis" />                      
                               </xsl:call-template>    
 
          </div>
  
          <div class="styLNAmountBoxNBB" style="height: 5.5mm;background-color:lightgrey;width:40mm;"></div> 
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm"></div>
          <div class="styLNAmountBoxNBB" style="height: 5.5mm"></div>   

          </div>
       
       
       
   <!-- Line 2g -->
  
         <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; ">g</div>
              <div class="styLNDesc" style="width:58mm;height:4.5mm;font-size:9px;">
               Kilowatt capacity of property in <b> f </b>above </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;"></div>
              <div class="styLNAmountBoxNBB" style="height:4.5mm;"></div>
          <div class="styLNAmountBoxNBB" style="height:4.5mm;background-color:lightgrey;width:40mm;"></div>   
          <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"></div>
          <div class="styLNAmountBoxNBB" style="height:4.5mm"></div>   

        </div>    
        
         <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; "></div>
          <div class="styLNDesc" style="width:13mm;height:4.5mm;font-size:8px;">
            <span class="styBoldText">
            <!--    <span style="width:10px;">.</span>
                <span style="width:10px;">.</span>
                <span style="width:10px;">.</span>     -->
   
           </span>
           <img src="{$ImagePath}/3468_Bullet.gif"  style="float"   alt="right arrow"/>
         </div>
          

    
                       <div class ="styUnderlineAmount" style="width:29mm;height:3.5mm;">
                             <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="$Form3468Data/QlfyMicroturbinePropKwCapacity" />                      
                             </xsl:call-template> 
                        </div>
                         <div class="styGenericDiv" style="width:16mm;height:4.5mm;padding-top:2mm;"><span style="width:4px;"></span>X $200  </div>

           
          <div class="styLNRightNumBox" style="height:5.5mm;">2g</div>
          <div class="styLNAmountBox" style="height:5.5mm;">
                <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode" select="$Form3468Data/TotQlfyMicroturbinePropKwCap" />                      
                  </xsl:call-template>      
  
          </div>
      
          <div class="styLNAmountBoxNBB" style="height: 5.5mm;width:40mm;background-color:lightgrey;"></div> 
                     <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm"></div>
          <div class="styLNAmountBoxNBB" style="height: 5.5mm"></div>   

  
        </div>
        
      <!-- Line 2h -->
        <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">h</div>
          <div class="styLNDesc" style="width:98mm;height:4.5mm;">
            Enter the lesser of line 2f or 2g
            <!--Dotted Line-->
            <span class="styBoldText">
                <span style="width:4px;"></span>
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
          <div class="styLNRightNumBox" style="height:4.5mm;">2h</div>
          <div class="styLNAmountBox" style="height:4.5mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/AdjQlfyMircroturbinePropBasis" />
            </xsl:call-template>
          </div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"></div>
          <div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"></div>
        </div>


               
         <!-- Line 2i -->

        <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4mm;">i</div>
            <div class="styLNDesc" style="width:137.8mm;height:4mm;">
          Total. Add lines 2a, 2b, 2e, and 2h
                        <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:8px;"></span>.
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
          <div class="styLNRightNumBox" style="height:4.5mm;">
            2i
          </div>
          <div class="styLNAmountBox" style="height:4.5mm;">
           <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/TotalEnergyCredit" />
           </xsl:call-template>           
          </div>
        </div>

                  <!-- Line 3 -->

          <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4mm;">
            3
          </div>
          <div class="styLNDesc" style="width:137.9mm;height:4mm;">
                Qualifying advanced coal project credit (see instructions):
          </div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm"></div>
          <div class="styLNAmountBox" style="border-bottom-width: 0px"></div>
        </div>
      
    
          <!-- Line 3a -->
     <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; ">a</div>
          <div class="styLNDesc" style="width:137.9mm;height:4.5mm;font-size:8px;">
             Basis of qualified investment in integrated gasification combined cycle property  placed in</div>
          <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"></div>
          <div class="styLNAmountBoxNBB" style="height:4.5mm"></div>   
        </div>    
         <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; "></div>
          <div class="styLNDesc" style="width:30mm;height:4.5mm;font-size:8px;">
            service during the tax year
         </div>
             <span class ="styUnderlineAmount" style ="width:2mm;height:3.5mm;">$</span>
                       <div class ="styUnderlineAmount" style="width:32.4mm;height:3.5mm;">
                              <xsl:call-template name="PopulateAmount">
                               <xsl:with-param name="TargetNode" select="$Form3468Data/IntgrtGasCombCycPropInvstBasis" />                      
                               </xsl:call-template>       
                        </div>
                         <div class="styGenericDiv" style="width:33.7mm;height:4.5mm;padding-top:2mm;"><span style="width:4px;"></span>X 20% (.20)            </div>

           
          <div class="styLNRightNumBox" style="height:5.5mm;">3a</div>
          <div class="styLNAmountBox" style="height:5.5mm;">
                     <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form3468Data/CalcGasCombinedCycPropInvstCr" />                      
                      </xsl:call-template>       
  
          </div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm"></div>
          <div class="styLNAmountBoxNBB" style="height: 5.5mm"></div>   
        </div>


   
         <!-- Line 3b -->
     <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; ">b</div>
          <div class="styLNDesc" style="width:98mm;height:4.5mm;font-size:8px;">
             Basis of qualified investment in property other than in <b>a</b> above placed in service</div>
         
    
          <div class="styLNRightNumBoxNBB" style="height:4.5mm;"></div>
          <div class="styLNAmountBoxNBB" style="height:4.5mm;">
        
          </div>
          <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"></div>
          <div class="styLNAmountBoxNBB" style="height:4.5mm"></div>   
        </div>    
        
         <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm; "></div>
          <div class="styLNDesc" style="width:28mm;height:4.5mm;font-size:8px;">
           during the tax year
         <img src="{$ImagePath}/3468_Bullet.gif"  style="float"   alt="right arrow"/>
         </div>
             <span class ="styUnderlineAmount" style ="width:2mm;height:3.5mm;">$</span>
                       <div class ="styUnderlineAmount" style="width:34mm;height:3.5mm;">
                           
                             <xsl:call-template name="PopulateAmount">
                                   <xsl:with-param name="TargetNode" select="$Form3468Data/OtherQlfyInvstPropertyBasis" />                      
                              </xsl:call-template>      
                        </div>
                         <div class="styGenericDiv" style="width:33.7mm;height:4.5mm;padding-top:2mm;"><span style="width:4px;"></span>X 15% (.15)            </div>

           
          <div class="styLNRightNumBox" style="height:4.5mm;">3b</div>
          <div class="styLNAmountBox" style="height:4.5mm;">
                 <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" select="$Form3468Data/CalcOtherQlfyInvstPropCredit" />                      
                   </xsl:call-template>      

          </div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm"></div>
          <div class="styLNAmountBoxNBB" style="height: 5.5mm"></div>   
        </div>
        
    
              <!-- Line 3c -->
        <div style="width:187mm;">
          <div class="styLNLeftLtrBox" style="height:4mm;">c</div>
          <div class="styLNDesc" style="width:137.8mm;height:4mm;">
          Total. Add lines 3a and 3b
                      <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:8px;"></span>.
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
          <div class="styLNRightNumBox" style="height:4.5mm;">
            3c
          </div>
          <div class="styLNAmountBox" style="height:4.5mm;">
           <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/QlfyAdvancedCoalProjectCredit" />
           </xsl:call-template>           

          </div>
        </div>
        
        <!-- Line 4 -->
                <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4mm;">4</div>
          <div class="styLNDesc" style="width:137.9mm;height:4mm;;">
        <div class="styGenericDiv" style="font-size:7pt">Qualifying gasification project credit (see instructions). Basis of qualified investment in property placed</div>   
         <div class="styGenericDiv" style=" font-size:7pt; width:85mm;" > in service during the tax year
                               <!--Dotted Line-->
            <span class="styBoldText">
                <span style="width:8px;"></span>.
                <span style="width:16px;"></span>.
                <span style="width:16px;"></span>.
                <span style="width:16px;"></span>.    
                <span style="width:16px;"></span>.
                <span style="width:16px;"></span>.
                <span style="width:16px;"></span>.  
                  <span style="width:12px;"></span>
                       
             </span>
         <img src="{$ImagePath}/3468_Bullet.gif"  style="float"   alt="right arrow"/>

         
         </div>
           <span class ="styUnderlineAmount" style ="width:1mm;height:4mm;padding-top:0mm;">$</span>
             <span class ="styUnderlineAmount" style="width:30.2mm;height:4mm;padding-top:0mm;">
               <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/QlfyGasificationPropertyBasis" />                      
            </xsl:call-template>    
          </span>
          <span class="styGenericDiv" style="font-size:7pt; padding-top:1mm; padding-left:2mm;" >X 20% (.20)</span>
          </div>
                
          <div class="styLNRightNumBox" style="height:8.5mm;padding-top:5mm">4
          </div>
          <div class="styLNAmountBox" style="height:8.5mm;padding-top:5mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyGasificationBasis" />
            </xsl:call-template>
          </div>
        </div>

        
        
            <!-- Line 5 -->

        <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm;">5</div>
          <div class="styLNDesc" style="width:137.9mm;height:4.5mm;">
            Credit from cooperatives.  Enter the unused investment credit from
            cooperatives.
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:8px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
            </span>
          </div>
          <div class="styLNRightNumBox" style="height:4.5mm;">5</div>
          <div class="styLNAmountBox" style="height:4.5mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/CreditFromCooperatives" />
            </xsl:call-template>
          </div>
          
        </div>
        
        
        
            <!-- Line 6 -->
        <div style="width:187mm;">
               <div class="styLNLeftNumBox" style="height:4mm;">6</div>
          <div class="styLNDesc" style="width:137.9mm;height:4mm;font-size:7pt;">
            Add lines 1e through 1h, 1k, 2i, 3c, 4, and 5. Report this amount on the applicable line of <br/>
            Form 3800 (e.g., line 1a of the 2006 Form 3800)
                <!--Dotted Line-->
            <span class="styBoldText">
                <span style="width:6px;"></span>
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
                
          <div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:4mm;">6
          </div>
          <div class="styLNAmountBoxNBB" style="height:7.5mm;padding-top:4mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3468Data/CurrentYearCredit" />
            </xsl:call-template>
          </div>
        </div>
      </div>

    <!--footer -->
    <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
      <div style="width:90mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see instructions.</div>
      <div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12276E</div>
      <div style = "float:right;" class="styGenericDiv">Form <span class="styBoldText">3468</span> (Rev. 12-2006)</div>
    </div>
<!-- *******************************************************     -->
    <!-- Adding page break -->

<!--  <p class="pageend"></p>  -->
 <div style="width:187mm;"/>

<!-- Begininning of write-in data -->
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
        <xsl:with-param name="TargetNode" select="$Form3468Data" />
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>  
      <!-- Added the xsl:if clause here as the <tr> needs to shown only when the attribute exists.  And also added xsl:choose block if not both templates will be called resulting in display problems as both templates insert the span tag for id's.For more information look for defect 9101-->
      <xsl:if test="$Form3468Data/CertifiedHistoricStructures/@historicStructureCertOnFile">
       <tr>
          <td class="styLeftOverTableRowDesc" style="width:110mm;" scope="row">
            Line 1g - Certified Historic Structure on File:
          </td>
          <td class="styLeftOverTableRowAmount" style="width:100mm;text-align:left;">
            <xsl:choose>
              <xsl:when test="$Form3468Data/CertifiedHistoricStructures/@historicStructureCertOnFile = '1'">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form3468Data/CertifiedHistoricStructures/  @historicStructureCertOnFile"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form3468Data/CertifiedHistoricStructures/  @historicStructureCertOnFile"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          
        </tr>
      </xsl:if>
<!--         <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Line 1g - Form 4684 Indicator</xsl:with-param>
        <xsl:with-param name="TargetNode" select="$Form3468Data/CertifiedHistoricStructures/@historicStructureCertOnFile"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>    -->
      
    </table>  

    
    
      </form>
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>
