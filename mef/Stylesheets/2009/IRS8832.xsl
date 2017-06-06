<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8832Style.xsl"/>



<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="Form8832Data" select="$RtnDoc/IRS8832" />

<xsl:template match="/">

<html lang="EN-US">
  <head>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form8832Data)"></xsl:with-param></xsl:call-template></title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private" />
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="Description" content="IRS Form 8832" />
      
      
      
      <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
      <xsl:call-template name="InitJS"></xsl:call-template>
    <style type="text/css">
      <xsl:if test="not($Print) or $Print=''">
        <!-- Form 8832 CSS Styles are located in the template called below -->
        <xsl:call-template name="IRS8832Style"></xsl:call-template>  
        <xsl:call-template name="AddOnStyle"></xsl:call-template>
      </xsl:if>
    </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
    <form name="Form8832">
      <xsl:call-template name="DocumentHeader"></xsl:call-template>
      
      <!-- Begin Form Number and Name -->
      <div class="styTBB" style="width:187mm;height:22.5mm;">
        <div class="styFNBox" style="width:32mm;height:22.5mm;">
          <div style="height:13mm;">
            Form<span class="styFormNumber" >8832</span><br/>
            (Rev. March 2007)
            <xsl:call-template name="SetFormLinkInline">
              	<xsl:with-param name="TargetNode" select="$Form8832Data"/>
            </xsl:call-template>
          </div>
          <div style="height:7mm" >
            <span class="styAgency">Department of the Treasury</span><br/>
            <span class="styAgency">Internal Revenue Service</span>
          </div>        
        </div>    
        <div class="styFTBox" style="width:125mm;height:22.5mm;padding-top:9mm;">
          <div class="styMainTitle">Entity Classification Election </div>          
        </div>
        <div class="styTYBox" style="width:30mm;height:22.5mm;padding-top:9mm;">        
            OMB No. 1545-1516        
        </div>
      </div>
      
<!-- End Form Number and Name section -->
      
      
      <div class="styBB" style="width:187mm;">
        <div class="styUseLbl" style="width:10mm;height:32mm; text-align:center;padding-top:9.5mm;font-size:7pt;">    
                           Type or Print</div>
        <div class="styNameAddr" style="width:130mm;height:9.7mm;font-size:7pt;">
          Name of eligible entity making election<br/>
          
<!--<span class = "stysmalltext"> -->
          <div style="font-family:verdana;font-size:6pt;height:6.25mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form8832Data/EntityName/BusinessNameLine1" />
            </xsl:call-template><br/>  
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form8832Data/EntityName/BusinessNameLine2" />
            </xsl:call-template>
          <!--</span> -->   
           </div>         
        </div>        
        
        <div class="styLNAmountBox" style="width:47mm;height: 9.7mm;font-size:7pt; text-align:left; padding-top: 1.8mm;">
          <span style="width: 1mm;" /><b>Employer identification number</b><span style="width: 1mm;" />          
          <span style="width:25mm;padding-left:1mm">
            <!-- If EntityEIN -->
            <xsl:if test="not($Form8832Data/EntityEIN='' or not($Form8832Data/EntityEIN))">
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="$Form8832Data/EntityEIN" />
              </xsl:call-template>
            </xsl:if>
        
          </span>                
        </div>      
                    
        <div class="styNameAddr" style="width:177mm;height:8mm;font-size:7pt;">
          Number, street, and room or suite no. If a P.O. box, see instructions.<br/>
          <xsl:choose> 
                       <xsl:when test="$Form8832Data/EntityForeignAddress"> 
              <!--<span class = "stysmalltext"> -->
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8832Data/EntityForeignAddress/AddressLine1" />
                </xsl:call-template><br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8832Data/EntityForeignAddress/AddressLine2" />
                </xsl:call-template>
              <!--</span> -->
            </xsl:when>         
                    <xsl:otherwise> 
                <!--<span class = "stysmalltext"> -->
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8832Data/EntityDomesticAddress/AddressLine1" />
                </xsl:call-template><br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8832Data/EntityDomesticAddress/AddressLine2" />
                </xsl:call-template>
                <!--</span> -->
                    </xsl:otherwise> 
                  </xsl:choose>                               
        </div>
                      
        <div class="styNumberBox" style="height:8mm;font-size:7pt;">
          City or town,<span style="width:2px;"></span> state,<span style="width:2px;"></span> and<span style="width:2px;"></span> ZIP code.<span style="width:2px;"></span> If a
          foreign address, enter city, province or state, postal code and country. Follow the country’s practice for 
          entering the postal code.
          <br/>                    
          <xsl:choose> 
          <xsl:when test="$Form8832Data/EntityForeignAddress">               
          	<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8832Data/EntityForeignAddress/City" />
               </xsl:call-template>
               <xsl:if test="$Form8832Data/EntityForeignAddress/City != '' and 
               $Form8832Data/EntityForeignAddress/ProvinceOrState != ''">,
                  <span style="width:2px;"></span>
               </xsl:if>                            
               <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8832Data/EntityForeignAddress/ProvinceOrState" />
               </xsl:call-template>
               <span style="width:7px"></span>                
               <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8832Data/EntityForeignAddress/PostalCode" />
               </xsl:call-template><br/>                
               <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8832Data/EntityForeignAddress/Country" />
               </xsl:call-template>
          </xsl:when>         
          <xsl:otherwise> 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8832Data/EntityDomesticAddress/City" />
                </xsl:call-template>
                <xsl:if test="$Form8832Data/EntityDomesticAddress/City != '' and 
                $Form8832Data/EntityDomesticAddress/State != ''">,
                  <span style="width:2px;"></span>
                </xsl:if>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8832Data/EntityDomesticAddress/State" />
                </xsl:call-template>
                <span style="width:7px"></span> 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8832Data/EntityDomesticAddress/ZIPCode" />
                </xsl:call-template>
          </xsl:otherwise> 
          </xsl:choose> 
        </div>      
      </div>
      
            
   <div class="styBB" style="width:187mm;padding-left:2mm">
       <img src="{$ImagePath}/8832_Bullet_Lg.gif" alt="Bullet Image"/> Check if: 
       
           <input type="checkbox" class="styCkbox" name="Checkbox">
             <xsl:call-template name="PopulateCheckbox">
               <xsl:with-param name="TargetNode" select="$Form8832Data/AddressChange" />
             </xsl:call-template>
           </input>
           <span style="width:8px"></span>
           <label>
             <xsl:call-template name="PopulateLabel">
               <xsl:with-param name="TargetNode" select="$Form8832Data/AddressChange" />
             </xsl:call-template> 
            Address change
           </label>       
        
      </div>

      <div style="width:187mm;"> </div>
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">1</div>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
          <span class="styBoldText">Type of election</span> (see instructions):    
        </div>
      </div>
<!-- start line 1a -->
	<div style="width:187mm;"/>
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
           <input type="checkbox" class="styCkbox" name="Checkbox">
             <xsl:call-template name="PopulateCheckbox">
               <xsl:with-param name="TargetNode" select="$Form8832Data/InitialClassification" />
             </xsl:call-template>
           </input>
           <span style="width:8px"></span>
           <label>
             <xsl:call-template name="PopulateLabel">
               <xsl:with-param name="TargetNode" select="$Form8832Data/InitialClassification" />
             </xsl:call-template> 
             Initial classification by a newly-formed entity. Skip lines 2a and 2b and go to line 3.
           </label>       
        </div>
      </div>

<!-- end line 1a -->

<!-- start line 1b -->

      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
        <div class="styLNDesc" style="width:158mm;height:4.5mm;">
          <input type="checkbox" class="styCkbox" name="Checkbox">
            <xsl:call-template name="PopulateCheckbox">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               ChangeInCurrentClassification" />
             </xsl:call-template>
           </input>
           <span style="width:8px"></span>
           <label>
             <xsl:call-template name="PopulateLabel">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               ChangeInCurrentClassification" />
             </xsl:call-template> 
             Change in current classification. Go to line 2a
           </label>
        </div>  
      </div>

<!-- end line 1b --> 

<!-- start line 2a -->

      <div style="width:187mm;"/>
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">2a</div>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
         Has the eligible entity previously filed an entity election that had an effective date within the last 60 months?     
        </div>
      </div>
      <div style="width:187mm;"/>
      <!-- Yes Check Box -->
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
        	<input type="checkbox" class="styCkbox">
          	<xsl:call-template name="PopulateYesCheckbox">
               	<xsl:with-param name="TargetNode" select="$Form8832Data/ElecWithPriorEffectiveDateInd" />
              	</xsl:call-template>
           </input>
           <label>
           	<xsl:call-template name="PopulateLabelYes">
              		<xsl:with-param name="TargetNode" select="$Form8832Data/ElecWithPriorEffectiveDateInd" />
              		<xsl:with-param name="BackupName" select="Form8832Data/ElecWithPriorEffectiveDateInd" />
            	</xsl:call-template>
          </label>
          <b> Yes.</b>Go to line 2b.
        </div>  
      </div>
       <!-- No Check Box -->
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
        	<input type="checkbox" class="styCkbox">
          	<xsl:call-template name="PopulateNoCheckbox">
               	<xsl:with-param name="TargetNode" select="$Form8832Data/ElecWithPriorEffectiveDateInd" />
              	</xsl:call-template>
           </input>
           <label>
           	<xsl:call-template name="PopulateLabelNo">
              		<xsl:with-param name="TargetNode" select="$Form8832Data/ElecWithPriorEffectiveDateInd" />
              		<xsl:with-param name="BackupName" select="Form8832Data/ElecWithPriorEffectiveDateInd" />
            	</xsl:call-template>
          </label>
          <b> No. </b>Skip line 2b and go to line 3.
        </div>  
      </div>
      
<!-- end line 2a -->

<!-- start line 2b -->

      <div style="width:187mm;"/>
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">2b</div>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
         Was the eligible entity’s prior election for initial classification by a newly formed entity effective on the date of formation?    
        </div>
      </div>
      <div style="width:187mm;"/>
      <!-- Yes Check Box -->
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
        	<input type="checkbox" class="styCkbox">
          	<xsl:call-template name="PopulateYesCheckbox">
               	<xsl:with-param name="TargetNode" select="$Form8832Data/PriorElecDateOfFormationInd" />
              	</xsl:call-template>
           </input>
           <label>
           	<xsl:call-template name="PopulateLabelYes">
              		<xsl:with-param name="TargetNode" select="$Form8832Data/PriorElecDateOfFormationInd" />
              		<xsl:with-param name="BackupName" select="Form8832Data/PriorElecDateOfFormationInd" />
            	</xsl:call-template>
          </label>
          <b> Yes.</b>Go to line 3.
        </div>  
      </div>
       <!-- No Check Box -->
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
        	<input type="checkbox" class="styCkbox">
          	<xsl:call-template name="PopulateNoCheckbox">
               	<xsl:with-param name="TargetNode" select="$Form8832Data/PriorElecDateOfFormationInd" />
              	</xsl:call-template>
           </input>
           <label>
           	<xsl:call-template name="PopulateLabelNo">
              		<xsl:with-param name="TargetNode" select="$Form8832Data/PriorElecDateOfFormationInd" />
              		<xsl:with-param name="BackupName" select="Form8832Data/PriorElecDateOfFormationInd" />
            	</xsl:call-template>
          </label>
          <b> No. </b>Stop here. You generally are not currently eligible to make the election (see instructions).
        </div>  
      </div>
      
<!-- end line 2b -->

<!-- start line 3 -->

      <div style="width:187mm;"/>
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">3</div>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
         Does the eligible entity have more than one owner?
        </div>
      </div>
      <div style="width:187mm;"/>
      <!-- Yes Check Box -->
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
        	<input type="checkbox" class="styCkbox">
          	<xsl:call-template name="PopulateYesCheckbox">
               	<xsl:with-param name="TargetNode" select="$Form8832Data/MultipleOwnerYesOrNo" />
              	</xsl:call-template>
           </input>
           <label>
           	<xsl:call-template name="PopulateLabelYes">
              		<xsl:with-param name="TargetNode" select="$Form8832Data/MultipleOwnerYesOrNo" />
              		<xsl:with-param name="BackupName" select="Form8832Data/MultipleOwnerYesOrNo" />
            	</xsl:call-template>
          </label>
          <b> Yes.</b>You can elect to be classified as a partnership or an association taxable as a corporation. Skip line 4 and go to line 5.        </div>  
      </div>
       <!-- No Check Box -->
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
        	<input type="checkbox" class="styCkbox">
          	<xsl:call-template name="PopulateNoCheckbox">
               	<xsl:with-param name="TargetNode" select="$Form8832Data/MultipleOwnerYesOrNo" />
              	</xsl:call-template>
           </input>
           <label>
           	<xsl:call-template name="PopulateLabelNo">
              		<xsl:with-param name="TargetNode" select="$Form8832Data/MultipleOwnerYesOrNo" />
              		<xsl:with-param name="BackupName" select="$Form8832Data/MultipleOwnerYesOrNo" />
            	</xsl:call-template>
          </label>
          <b> No. </b>You can elect to be classified as an association taxable as a corporation or disregarded as a separate entity. Go to
			line 4.
        </div>  
      </div>
      
<!-- end line 3 -->

<!-- start line 4 -->      
      
      <div style="width:187mm;"> </div>
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">4</div>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
        If the eligible entity has only one owner, provide the following information:
        </div>
      </div>
	<div style="width:187mm;"/>
<!-- end line 4 -->

<!-- start line 4a -->      
      
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
        <div class="styLNDesc" style="width:30mm;height:4.5mm;">
          Name of owner <img src="{$ImagePath}/8832_Bullet_Lg.gif" alt="Bullet Image"/>              
        </div>        
        <span class="styFixedUnderline" style ="width:110mm;height:4.5mm;">        
	       <xsl:call-template name="PopulateText">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               NameOfOwner/BusinessNameLine1" />
            </xsl:call-template>
            <span style="width:16px;"></span>
            <xsl:call-template name="PopulateText">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               NameOfOwner/BusinessNameLine2" />
            </xsl:call-template>  
          </span>                    
      </div>

<!-- end line 4a -->

<!-- start line 4b -->      
      
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
        <div class="styLNDesc" style="width:40mm;height:4.5mm;">
          Identifying number of owner <img src="{$ImagePath}/8832_Bullet_Lg.gif" alt="Bullet Image"/>              
        </div>        
        <span class="styFixedUnderline" style ="width:110mm; height: 4.5mm;">
          <xsl:choose> 
              <xsl:when test="$Form8832Data/OwnerEIN"> 
                  <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$Form8832Data/OwnerEIN"/>
                  </xsl:call-template>
             </xsl:when> 
             <xsl:when test="$Form8832Data/OwnerSSN"> 
                <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="$Form8832Data/OwnerSSN"/>
                </xsl:call-template>
              </xsl:when> 
              <xsl:when test="$Form8832Data/MissingEINReason"> 
                <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8832Data/MissingEINReason"/>
                </xsl:call-template>
              </xsl:when> 
           </xsl:choose>      
        </span>        
      </div>
      
<!-- end line 4b -->

<!-- start line 5 -->      
      
      <div style="width:187mm;"> </div>
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">5</div>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
        If the eligible entity is owned by one or more affiliated corporations that file a consolidated return, provide the name and
	   employer identification number of the parent corporation:
        </div>
      </div>
	 <div style="width:187mm;"/>
<!-- end line 5 -->

<!-- start line 5a -->      
      
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
        <div class="styLNDesc" style="width:40mm;height:4.5mm;">
          Name of parent corporation <img src="{$ImagePath}/8832_Bullet_Lg.gif"  alt="Bullet Image"/>              
        </div>        
        <div class="styFixedUnderline" style ="width:110mm;">        
          <div style="font-family:verdana;font-size:6pt;">        
             <xsl:call-template name="PopulateText">
               <xsl:with-param name="TargetNode" select="$Form8832Data/ParentCorporationName
               /BusinessNameLine1" />
            </xsl:call-template>
            <span style="width:16px;"></span>
            <xsl:call-template name="PopulateText">
               <xsl:with-param name="TargetNode" select="$Form8832Data/ParentCorporationName
               /BusinessNameLine2" />
            </xsl:call-template>  
          </div>                    
        </div>        
      </div>

<!-- end line 5a -->

<!-- start line 5b -->      
      
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
        <div class="styLNDesc" style="width:47mm;height:4.5mm;">
         Employer identification number <img src="{$ImagePath}/8832_Bullet_Lg.gif"  alt="Bullet Image"/>              
        </div>        
        <span class="styFixedUnderline" style ="width:103mm; height: 4.5mm;">
          <xsl:choose> 
              <xsl:when test="$Form8832Data/EmployerIdentificationNumber"> 
                  <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$Form8832Data/EmployerIdentificationNumber"/>
                  </xsl:call-template>
             </xsl:when> 
             <xsl:when test="$Form8832Data/EmployerMissingEINReason"> 
                <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8832Data/EmployerMissingEINReason"/>
                </xsl:call-template>
              </xsl:when> 
             
          </xsl:choose>      
        </span>        
      </div>
      <div style="width:187mm;"/>
      <div class="styBB" style="width:187mm;"/>
<!-- end line 5b -->
 
  <!-- Page Break and Footer-->
  <div class="pageEnd" style="width:187mm;padding-top:1mm;">  
    <div style="float:left;">
            <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span>
      <span style="width:13mm;"></span>                        
      Cat. No. 22598R 
    </div>
    <div style="float:right;">
      <span style="width:40px;"></span>  
      Form <span class="styBoldText" style="font-size:8pt;">8832</span>(Rev. 3-2007)
    </div>    
  </div>
  <!-- END Page Break and Footer-->


<!-- Page 2 -->

<!-- Page 2 Header -->

      <div class="styBB" style="width:187mm;">
        <div style="float:left;">Form 8832 (Rev. 3-2007)</div>
        <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">2</span></div>
      </div>

	
<!-- start line 6 -->

      <div style="width:187mm;"/>
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">6</div>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
          <span class="styBoldText">Type of entity</span> (see instructions):    
        </div>
      </div>
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
          <input type="checkbox" class="styCkbox" name="Checkbox">
            <xsl:call-template name="PopulateCheckbox">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               DomAssocTaxableAsACorporation" />
             </xsl:call-template>
           </input>
           <span style="width:8px"></span>
           <label>
             <xsl:call-template name="PopulateLabel">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               DomAssocTaxableAsACorporation" />
             </xsl:call-template> 
             A domestic eligible entity electing to be classified as an association taxable as a corporation.
           </label>
        </div>  
      </div>
      
<!-- end line 6a -->

<!-- start line 6b --> 

      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
        <div class="styLNDesc" style="width:158mm;height:4.5mm;">
          <input type="checkbox" class="styCkbox" name="Checkbox">
            <xsl:call-template name="PopulateCheckbox">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               DomesticEntityAsAPartnership" />
             </xsl:call-template>
           </input>
           <span style="width:8px"></span>
           <label>
             <xsl:call-template name="PopulateLabel">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               DomesticEntityAsAPartnership" />
             </xsl:call-template> 
             A domestic eligible entity electing to be classified as a partnership.
           </label>
        </div>  
      </div>

<!-- end line 6b -->

<!-- start line 6c -->

      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
          <input type="checkbox" class="styCkbox" name="Checkbox">
            <xsl:call-template name="PopulateCheckbox">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               DomSnglOwnerDisregardedSepEnt" />
             </xsl:call-template>
           </input>
           <span style="width:8px"></span>
           <label>
             <xsl:call-template name="PopulateLabel">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               DomSnglOwnerDisregardedSepEnt" />
             </xsl:call-template> 
             A domestic eligible entity with a single owner electing to be disregarded as a separate entity.
           </label>
        </div>  
      </div>
      
<!-- end line 6c -->

<!-- start line 6d -->
      
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;">d</div>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
          <input type="checkbox" class="styCkbox" name="Checkbox">
            <xsl:call-template name="PopulateCheckbox">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               FrgnAssocTaxableAsACorporation" />
             </xsl:call-template>
           </input>
           <span style="width:8px"></span>
           <label>
             <xsl:call-template name="PopulateLabel">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               FrgnAssocTaxableAsACorporation" />
             </xsl:call-template> 
             A foreign eligible entity electing to be classified as an association taxable as a corporation.
           </label>
              
        </div>  
      </div>
      
<!-- end line 6d -->

<!-- start line 6e -->
      
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;">e</div>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
          <input type="checkbox" class="styCkbox" name="Checkbox">
            <xsl:call-template name="PopulateCheckbox">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               ForeignEntityAsAPartnership" />
             </xsl:call-template>
           </input>
           <span style="width:8px"></span>
           <label>
             <xsl:call-template name="PopulateLabel">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               ForeignEntityAsAPartnership" />
             </xsl:call-template> 
             A foreign eligible entity electing to be classified as a partnership.
           </label>
        </div>  
      </div>
      
<!-- end line 6e --> 

<!-- start line 6f -->
      
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;">f</div>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
          <input type="checkbox" class="styCkbox" name="Checkbox">
            <xsl:call-template name="PopulateCheckbox">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               FrgnSnglOwnerDisregardedSepEnt" />
             </xsl:call-template>
           </input>
           <span style="width:8px"></span>
           <label>
             <xsl:call-template name="PopulateLabel">
               <xsl:with-param name="TargetNode" select="$Form8832Data/
               FrgnSnglOwnerDisregardedSepEnt" />
             </xsl:call-template> 
             A foreign eligible entity with a single owner electing to be disregarded as a separate entity.
           </label>
        </div>  
      </div>
      
<!-- end line 6f -->

<!-- start line 7 -->      
      
      <div style="width:187mm;"> </div>
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">7</div>
        <div class="styLNDesc" style="width:178mm;height:4.5mm;">
        If the eligible entity is created or organized in a foreign jurisdiction, provide the foreign country of
	   organization     
        </div>
      </div>
      
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4.5mm;"></div>
        <div class="styLNDesc" style="width:10mm;height:4.5mm;">
         <img src="{$ImagePath}/8832_Bullet_Lg.gif"  alt="Bullet Image"/>              
        </div>        
        <div class="styFixedUnderline" style ="width:160mm;">        
          <div style="font-family:verdana;font-size:6pt;">        
            
             
            <xsl:call-template name="PopulateText">
               <xsl:with-param name="TargetNode" select="$Form8832Data/CountryOfOrganization" />
            </xsl:call-template>  
         </div>                    
        </div>        
      </div>

<!-- end line 7 -->

<!-- start line 8 -->
      
      <div style="width:187mm;"> </div>
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">8</div>
        <div class="styLNDesc" style="width:148mm;height:4.5mm;">          
          Election is to be effective beginning (month, day, year) (see instructions)
          <!--Dotted Line-->
          <span class="styBoldText" style="width:180px;">
            <span style="width:16px;">.</span>
            <span style="width:16px;">.</span>
            <span style="width:16px;">.</span>
            <span style="width:16px;">.</span>
            <span style="width:16px;">.</span>
            <span style="width:16px;">.</span>
            <span style="width:16px;">.</span>
            <span style="width:16px;">.</span>
            <span style="width:16px;">.</span>
            <span style="width:16px;">.</span>      
            <span style="width:16px;">.</span>            
          </span>      
          
          <img src="{$ImagePath}/8832_Bullet_Lg.gif" alt="Bullet Image"/>
        </div>
        <div class="styFixedUnderline" style ="width:30mm;text-align:center;">
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="$Form8832Data/ElectionEffectiveDate" />
          </xsl:call-template>
        </div>
        <div style="width:4mm;float:left;Clear:none;"></div>        
      </div>      

<!-- end line 8 -->

<!-- start line 9 -->
      
      <div class="styTBB"  style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4.5mm;">9</div>        
        <div class="styLNDesc" style="width:108mm;height:7mm;font-size:7pt;">
         Name and title of contact person whom the IRS may call for more information
          <br/><br/>  
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8832Data/
            PersonNameIRSMayCallForInfo" />
          </xsl:call-template>  
          <span style="width:8px;"></span> 
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8832Data/
            PersonTitleIRSMayCallForInfo" />
          </xsl:call-template>        
        </div>        
<!-- end line 9 -->

<!-- start line 10 -->
        
        <div class="styLNAmountBox" style="border-bottom:0px;width:70mm;height:8mm;font-size:6pt; text-align:left;">
          <div class="styLNLeftNumBox" style="width:55mm;height:4.5mm;">
          <span class="styBoldText">10</span>
          <span style="font-size:7pt; font-weight:normal; ">                  
            <span style="width:8px;"></span>Contact person’s telephone number
            <br/><br/>
            <span style="width:50mm; text-align:left;">
              <span style="width:15px;"></span>
              <xsl:choose>
                <xsl:when test="$Form8832Data/PhoneOfPersonIRSMayCallForInfo">
                  <xsl:call-template name="PopulatePhoneNumber">
                    <xsl:with-param name="TargetNode" select="$Form8832Data/
                    PhoneOfPersonIRSMayCallForInfo" />
                  </xsl:call-template>  
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8832Data/
                    ForeignPhoneOfPersonIRSMayCall" />
                  </xsl:call-template>  
                </xsl:otherwise>
              </xsl:choose>
            </span>              
          </span>
          </div>
        </div>
      </div>

<!-- end line 10 -->
      
<!-- Begin signature part -->
          
      <div class="styBB" style="width:187mm;">
        <div class="styLNDesc" style="width:187mm;height:4.5mm;text-align:center;font-size:9pt;">
          <br/>
          <span class="styBoldText">
            Consent Statement and Signature(s) (see instructions)                      
          </span>
          <div style="width:187mm;"><br/> </div>                        
        </div>        
      </div>
      
      <div class="styForm8832SignatureText" style="width:187mm">
        <br/>
        Under penalties of perjury, I (we) declare that I (we) consent to the election of the 
        above-named entity to be classified as indicated above, and that I (we) have examined this
        consent statement, and to the best of my (our) knowledge and belief, it is true, correct, and 
        complete.  If I am an officer, manager, or member signing for all members of the entity, I 
        further declare that I am authorized to execute this consent statement on their behalf.        
      </div>      
      <div style="width:187mm;"><br/> </div>
      <div style="width:187mm;"><br/> </div>
      <div style="width:187mm;">
        <span class="styBoldText" style="width:260px; text-align:center">          
          Signature(s)        
        </span>
        <span class="styBoldText" style="width:160px;text-align:center">
          Date        
        </span>
        <span class="styBoldText" style="width:260px;text-align:center">
          Title        
        </span>        
      </div>
      <div class="styBB" style="width:187mm;border-top-width:1px;border-bottom-width:0px;">
        <div style="width:187mm;">
          <table cellspacing="0"  class="TableContainer" style="width:187mm;" summary="Table for Signatures">          
            <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>
            <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>
            <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>
            <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>
            <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>
            <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>            
		  <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>            
		  <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>            
		  <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>            
		  <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>            
		  <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>            
		 <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>            
		 <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>            
		  <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>            
		  <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>            
		  <tr>
              <td class="styTableCell" scope="row" style="width:72mm;text-align:left;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:43mm;text-align:center;font-weight:bold;border-color:black;"><div style="width:20mm;"> </div></td>
              <td class="styTableCell" style="width:72mm;text-align:center;font-weight:bold;border-color:black;border-right:none;"><div style="width:20mm;"> </div></td>
            </tr>            
          </table>
        </div>
      </div>            
      
      <!-- End signature part -->

      <div style="width:187mm;">
        <span class="styBoldText" style="width:330px;"> </span>         
        <span style="width:144px;"></span>        
        <span style="width:88px;"></span>        
        Form <span class="styBoldText">8832</span> (Rev. 3-2007)
      </div>
            
      <!-- End signature part -->
      
        <br/>
        <br class="pageEnd"/>
        
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
            <xsl:with-param name="TargetNode" select="$Form8832Data" />
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>          
        </table>
<!-- END Left Over Table -->              
      </form>
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>
