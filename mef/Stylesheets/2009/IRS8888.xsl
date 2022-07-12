<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="IRS8888Template.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8888Style.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="Form8888Data" select="$RtnDoc/IRS8888" />


<xsl:template match="/">

<html>
  <head>
    <META http-equiv="Content-Type" content="text/html"/>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form8888Data)"></xsl:with-param></xsl:call-template></title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private" />
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="Description" content="IRS Form 8888" />
    
    
    
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
    <style type="text/css">

    <xsl:if test="not($Print) or $Print=''">
    
      <xsl:call-template name="IRS8888Style"></xsl:call-template>
         <xsl:call-template name="AddOnStyle"></xsl:call-template>
     
     </xsl:if>

   </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
    <form name="Form8888">
      <xsl:call-template name="DocumentHeader"></xsl:call-template>
      <div class="styBB" style="width:187mm;">
        <div class="styFNBox" style="width:31mm;height:4mm;">
          <div style="padding-top:2.5mm;padding-bottom:2.5mm;font-size:8pt;">
            Form<span class="styFormNumber" >  8888</span>
          </div>
         <!-- <div style="padding-top:1.3mm;padding-bottom:0mm;font-size:12pt;">-->
            <div class="styAgency" style="font-size:7.5pt;">Department of  the Treasury<br>
            Internal Revenue Service</br>
          </div>
        </div>
        <div class="styFTBox" style="width:120mm;height:4mm;">
          <div class="styMainTitle"  style="height:4mm;padding-top:3mm;padding-bottom:0mm;">Direct Deposit of Refund to More Than One Account</div>
          <div class="styFBT" style="height:1mm;margin-top:1mm;padding-bottom:1mm;font-size:7.5pt;">
            <img src="{$ImagePath}/8888_Bullet_Md.gif" alt="Bullet"/> See instructions below and on back.</div>
            <img src="{$ImagePath}/8888_Bullet_Md.gif" alt="Bullet"/><b> Attach to Form 1040, Form 1040A, Form 1040EZ, <br/>
             Form 1040NR ,   Form 1040NR-EZ,  Form 1040-SS, or Form 1040-PR.</b>
          
        </div>
        <div class="styTYBox" style="width:32mm;height:2mm;text-align:left;">
          <div class="styOMB" style="width:35.5mm;height:2mm;font-size:7pt;padding-left:2mm">OMB No. 1545-0074</div>
          <div class="styTaxYear" style="width:32mm;height:1mm;margin-left:3mm;
          padding-left:3mm;">20<span class="styTYColor">09</span></div>
           <div  style="width:32mm;height:1mm;margin-left:3mm; text-align:left;font-size:7pt;">
          Attachment<br/> Sequence No.  <b>  56</b>
        </div>
        </div>
      </div>
     <!-- BEGIN Occupation TITLE -->

   <div class="styBB" style="width:187mm;">
        <div class="styNameBox" style="width:135mm;font-size:8pt;font-weight:normal;padding-top:0mm;">
          Name(s) shown on return<br/>
          
        		<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
				</xsl:call-template><br/>
	
				<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
				</xsl:call-template>

        </div>
 
   
          <div class="styIRS8888SSNBox" style="width:45mm;font-size:7.5pt;font-weight:normal;padding-top:0mm;
				  padding-bottom:0mm;"><b>Your social security number</b><br/><br/>
		   <span style="font-size:8pt;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">EIN</xsl:with-param>
				</xsl:call-template>
                <xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
				</xsl:call-template>
			</span>	
          </div>
     
   </div>
 
 
   <div  style="width:187mm;">     
   
              <xsl:if test="($Print != $Separated) or (count($Form8888Data/DirectDepositInfoGroup) &lt;= 3)">
		 <xsl:for-each select="$Form8888Data/DirectDepositInfoGroup">
  		<xsl:variable name="pos" select="position()"/><xsl:if test="(position() mod 3)=1"> 

  		<div class="styIRS8888TableContainer" id="Spcctn" >

  		<xsl:call-template name="SetInitialState"/>


		<!-- Beginning of 1a -->
	
 
	  <div style="width:187mm;font-size:8.5pt;">
       	 <div class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-top:1mm;padding-right:3mm"><xsl:number value="($pos)" format="1" />a</div>
		<div class="styLNDesc" style="width:140mm;height:4.5mm;padding-top:1mm;">Amount to be deposited in first account
          <!--Dotted Line-->
          <span class="styBoldText">
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
             <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
         </span></div>

		<div class="styLNLeftNumBox" style="height:2mm;width:7mm;padding-top:2mm;text-align:center;border-style:solid;
		border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">
		<xsl:number value="($pos)" format="1" />a</div>
		<div class="styIRS8888ColBox" style="height:4mm;font-size:7.5pt;border-left:0px;border-right-width:0px;padding-bottom:.5mm;padding-top:2.5mm;"> 
		
			<xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode"  select="$Form8888Data/DirectDepositInfoGroup[$pos]/DirectDepositRefundAmt" /></xsl:call-template></div>
	</div>		
		<!-- End of Step 1a -->
		
	
	<!-- Beginning of b -->

	  <div style="width:187mm;font-size:8.5pt;">
       	 <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;padding-right:3mm;text-align:right;">b</div>
       	 
	<div class="styLNDesc" style="width:139.5mm;padding-top:0mm;padding-bottom:0mm;">

		<div class="styLNDesc" style="width:28mm;height:2mm;padding-top:1mm;">Routing number</div>

  
      <!-- call routing number -->
      
					<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
						<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/RoutingTransitNumber" />
						<xsl:with-param name="BackupName">IRS1040RoutingTransitNumber1</xsl:with-param>
						</xsl:call-template>
					</span>
         <span style="width:4mm;padding-top:.5mm;padding-bottom:.5mm;float:left; clear: none;"></span>
         
        <span style="height:.5mm;padding-bottom:1mm;float:left;clear:none;">
	
         <img src="{$ImagePath}/8888_Bullet_Lg.gif" alt="Bullet"/><span class="styBoldText"  style="font-size:9pt;padding-bottom:3mm;">c</span>
       
               <span style="width:4.5mm;" />
        
        	<xsl:call-template name="PopulateSpan">
          	<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup" />
        	</xsl:call-template>
        	<input type="checkbox" class="styCkbox" style="width:4mm;">
           
          		<xsl:call-template name="PopulateNoCheckbox">
            			<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/AccountTypeCd" />
            			<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
            			<xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
          		</xsl:call-template>
          
        	</input>
      	</span>
      <span style="width:2mm;padding-bottom:3mm;"/>
      <label>
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/AccountTypeCd" />
          <xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
        </xsl:call-template>
        <span   style="font-size:8.5pt;">Checking</span>

      </label>
      <span style="width:4mm;"/>
      <span>
        	<xsl:call-template name="PopulateSpan">
         	 <xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup" />
       	 </xsl:call-template>
       	 <input type="checkbox" class="styCkbox" style="width:4mm;">
         		 <xsl:call-template name="PopulateYesCheckbox">
            		<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/AccountTypeCd"></xsl:with-param>
            		<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
           		 <xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
          		</xsl:call-template>
        	</input>
      </span>
      <span style="width:1mm;" />
      <label>
        	<xsl:call-template name="PopulateLabelYes">
          	<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup/AccountTypeCd" />
         	 <xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
        	</xsl:call-template>
         <span   style="font-size:8.5pt;">Savings</span>
      </label>
 
  
     </div>
    		<span style="width:7mm;height:5mm;padding-top:4mm;text-align:center;border-style:solid;border-right-width:1px;border-left-width:1px;
    		border-top-width:0px;border-bottom-width:0px;border-color:black;background-color:lightgrey;"></span>
				 
 		<span style="width:32mm;height:5mm;padding-top:4mm;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;
 		border-bottom-width:0px;border-color:black;"></span>

  </div>
 	  <div style="width:187mm;font-size:8.5pt;">
       	 <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;;padding-right:3mm;font-size:8pt;text-align:right;">d</div>


		<div class="styLNDesc" style="width:28mm;height:2mm;font-size:8.5pt;padding-top:1mm;">Account number</div>
                            <span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
                              <xsl:call-template name="PopulateText">
                                 <xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/DepositorAccountNumber" />
                                 <xsl:with-param name="BackupName">IRS1040DepositorAccountNumber</xsl:with-param>
                              </xsl:call-template>
                           </span>
                           
      <span style="width:27.5mm;" />
      
    		<span style="width:7mm;height:4mm;padding-top:4mm;text-align:center;border-style:solid;
		border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;background-color:lightgrey"></span>
				 
 		<span style="width:32mm;height:4mm;padding-top:4mm;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;
 		border-bottom-width:0px;border-color:black;"></span>
 	</div>		
  <!-- END of 1a -->
  
  <!-- Beginning of 2a -->
  
	  <div style="width:187mm;font-size:8.5pt;">
       	 <div class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-top:1mm;padding-right:3mm"><xsl:number value="($pos + 1)" format="1" />a</div>
		<div class="styLNDesc" style="width:140mm;height:4.5mm;padding-top:1mm;">Amount to be deposited in second account
          <!--Dotted Line-->
          <span class="styBoldText">
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
             <span style="width:8px"></span>.
            <span style="width:8px"></span>.
         </span></div>

		<div class="styLNLeftNumBox" style="height:2mm;width:7mm;padding-top:2mm;text-align:center;border-style:solid;
		border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">
		<xsl:number value="($pos + 1)" format="1" />a</div>
		<div class="styIRS8888ColBox" style="height:4mm;font-size:7.5pt;border-left:0px;border-right-width:0px;padding-bottom:.5mm;padding-top:2.5mm;"> 
		
			<xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode"  select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/DirectDepositRefundAmt" /></xsl:call-template></div>
	</div>		
		<!-- End of Step 2a -->
		<!-- Beginning of b -->

	  <div style="width:187mm;font-size:8.5pt;">
       	 <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;padding-right:3mm;text-align:right;">b</div>
       	 
	<div class="styLNDesc" style="width:139.5mm;padding-top:0mm;padding-bottom:0mm;">

		<div class="styLNDesc" style="width:28mm;height:2mm;padding-top:1mm;">Routing number</div>

  
      <!-- call routing number -->
      
					<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
						<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/RoutingTransitNumber" />
						<xsl:with-param name="BackupName">IRS1040RoutingTransitNumber1</xsl:with-param>
						</xsl:call-template>
					</span>
         <span style="width:4mm;padding-top:.5mm;padding-bottom:.5mm;float:left; clear: none;"></span>
         
        <span style="height:.5mm;padding-bottom:1mm;float:left;clear:none;">
	
         <img src="{$ImagePath}/8888_Bullet_Lg.gif" alt="Bullet"/><span class="styBoldText"  style="font-size:9pt;padding-bottom:3mm;">c</span>
       
               <span style="width:4.5mm;" />
        
        	<xsl:call-template name="PopulateSpan">
          	<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup" />
        	</xsl:call-template>
        	<input type="checkbox" class="styCkbox" style="width:4mm;">
           
          		<xsl:call-template name="PopulateNoCheckbox">
            			<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/AccountTypeCd" />
            			<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
            			<xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
          		</xsl:call-template>
          
        	</input>
      	</span>
      <span style="width:2mm;padding-bottom:3mm;"/>
      <label>
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/AccountTypeCd" />
          <xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
        </xsl:call-template>
        <span   style="font-size:8.5pt;">Checking</span>

      </label>
      <span style="width:4mm;"/>
      <span>
        	<xsl:call-template name="PopulateSpan">
         	 <xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup" />
       	 </xsl:call-template>
       	 <input type="checkbox" class="styCkbox" style="width:4mm;">
         		 <xsl:call-template name="PopulateYesCheckbox">
            		<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/AccountTypeCd"></xsl:with-param>
            		<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
           		 <xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
          		</xsl:call-template>
        	</input>
      </span>
      <span style="width:1mm;" />
      <label>
        	<xsl:call-template name="PopulateLabelYes">
          	<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/AccountTypeCd" />
         	 <xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
        	</xsl:call-template>
         <span   style="font-size:8.5pt;">Savings</span>
      </label>
 
  
     </div>
    		<span style="width:7mm;height:5mm;padding-top:4mm;text-align:center;border-style:solid;border-right-width:1px;border-left-width:1px;
    		border-top-width:0px;border-bottom-width:0px;border-color:black;background-color:lightgrey;"></span>
				 
 		<span style="width:32mm;height:5mm;padding-top:4mm;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;
 		border-bottom-width:0px;border-color:black;"></span>

  </div>
 	  <div style="width:187mm;font-size:8.5pt;">
       	 <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;;padding-right:3mm;font-size:8pt;text-align:right;">d</div>


		<div class="styLNDesc" style="width:28mm;height:2mm;font-size:8.5pt;padding-top:1mm;">Account number</div>
                            <span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
                              <xsl:call-template name="PopulateText">
                                 <xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/DepositorAccountNumber" />
                                 <xsl:with-param name="BackupName">IRS1040DepositorAccountNumber</xsl:with-param>
                              </xsl:call-template>
                           </span>
                           
      <span style="width:27.5mm;" />
      
    		<span style="width:7mm;height:4mm;padding-top:4mm;text-align:center;border-style:solid;
		border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;background-color:lightgrey"></span>
				 
 		<span style="width:32mm;height:4mm;padding-top:4mm;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;
 		border-bottom-width:0px;border-color:black;"></span>
 	</div>		
	

 	<!-- End of 2a -->
		
 	<!-- Beginning of 3a -->
	
  
	  <div style="width:187mm;font-size:8.5pt;">
       	 <div class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-top:1mm;padding-right:3mm"><xsl:number value="($pos + 2)" format="1" />a</div>
		<div class="styLNDesc" style="width:140mm;height:4.5mm;padding-top:1mm;">Amount to be deposited in third account
          <!--Dotted Line-->
          <span class="styBoldText">
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
            <span style="width:8px"></span>.
             <span style="width:8px"></span>.
            <span style="width:8px"></span>.
             <span style="width:8px"></span>.
         </span></div>

		<div class="styLNLeftNumBox" style="height:2mm;width:7mm;padding-top:2mm;text-align:center;border-style:solid;
		border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">
		<xsl:number value="($pos + 2)" format="1" />a</div>
		<div class="styIRS8888ColBox" style="height:4mm;font-size:7.5pt;border-left:0px;border-right-width:0px;padding-bottom:.5mm;padding-top:2.5mm;"> 
		
			<xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode"  select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/DirectDepositRefundAmt" /></xsl:call-template></div>
	</div>		
		<!-- End of Step 3a -->
		
	
	<!-- Beginning of b -->
	  <div style="width:187mm;font-size:8.5pt;">
       	 <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;padding-right:3mm;text-align:right;">b</div>
       	 
	<div class="styLNDesc" style="width:139.5mm;padding-top:0mm;padding-bottom:0mm;">

		<div class="styLNDesc" style="width:28mm;height:2mm;padding-top:1mm;">Routing number</div>

  
      <!-- call routing number -->
      
					<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
						<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/RoutingTransitNumber" />
						<xsl:with-param name="BackupName">IRS1040RoutingTransitNumber1</xsl:with-param>
						</xsl:call-template>
					</span>
         <span style="width:4mm;padding-top:.5mm;padding-bottom:.5mm;float:left; clear: none;"></span>
         
        <span style="height:.5mm;padding-bottom:1mm;float:left;clear:none;">
	
         <img src="{$ImagePath}/8888_Bullet_Lg.gif" alt="Bullet"/><span class="styBoldText"  style="font-size:9pt;padding-bottom:3mm;">c</span>
       
               <span style="width:4.5mm;" />
        
        	<xsl:call-template name="PopulateSpan">
          	<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup" />
        	</xsl:call-template>
        	<input type="checkbox" class="styCkbox" style="width:4mm;">
           
          		<xsl:call-template name="PopulateNoCheckbox">
            			<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/AccountTypeCd" />
            			<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
            			<xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
          		</xsl:call-template>
          
        	</input>
      	</span>
      <span style="width:2mm;padding-bottom:3mm;"/>
      <label>
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/AccountTypeCd" />
          <xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
        </xsl:call-template>
        <span   style="font-size:8.5pt;">Checking</span>

      </label>
      <span style="width:4mm;"/>
      <span>
        	<xsl:call-template name="PopulateSpan">
         	 <xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup" />
       	 </xsl:call-template>
       	 <input type="checkbox" class="styCkbox" style="width:4mm;">
         		 <xsl:call-template name="PopulateYesCheckbox">
            		<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/AccountTypeCd"></xsl:with-param>
            		<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
           		 <xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
          		</xsl:call-template>
        	</input>
      </span>
      <span style="width:1mm;" />
      <label>
        	<xsl:call-template name="PopulateLabelYes">
          	<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/AccountTypeCd" />
         	 <xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
        	</xsl:call-template>
         <span   style="font-size:8.5pt;">Savings</span>
      </label>
 
  
     </div>
    		<span style="width:7mm;height:5mm;padding-top:4mm;text-align:center;border-style:solid;border-right-width:1px;border-left-width:1px;
    		border-top-width:0px;border-bottom-width:0px;border-color:black;background-color:lightgrey;"></span>
				 
 		<span style="width:32mm;height:5mm;padding-top:4mm;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;
 		border-bottom-width:0px;border-color:black;"></span>

  </div>
 	  <div style="width:187mm;font-size:8.5pt;">
       	 <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;;padding-right:3mm;font-size:8pt;text-align:right;">d</div>


		<div class="styLNDesc" style="width:28mm;height:2mm;font-size:8.5pt;padding-top:1mm;">Account number</div>
                            <span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
                              <xsl:call-template name="PopulateText">
                                 <xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/DepositorAccountNumber" />
                                 <xsl:with-param name="BackupName">IRS1040DepositorAccountNumber</xsl:with-param>
                              </xsl:call-template>
                           </span>
                           
      <span style="width:27.5mm;" />
      
    		<span style="width:7mm;height:4mm;padding-top:4mm;text-align:center;border-style:solid;
		border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;background-color:lightgrey"></span>
				 
 		<span style="width:32mm;height:4mm;padding-top:4mm;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;
 		border-bottom-width:0px;border-color:black;"></span>
 	</div>		

	<!-- End of 3a -->
	 	
 	</div>		
	</xsl:if>
	</xsl:for-each>
	</xsl:if>
	</div>		
	
   	  <div class="styBB" style="width:187mm;">
      	 	<div class="styLNLeftNumBox" style="height:4.5mm;font-size:8.5pt;padding-top:1mm;">4</div>

		<div class="styLNDesc" style="width:140.2mm;height:4.5mm;font-size:7pt;padding-top:1mm;"><b>Total amount to be directly deposited. </b>  Add lines 1a, 2a, and 3a.  
		The total must equal the amount<br/> shown on Form 1040, line 73a; Form 1040A,  line 46a; Form 1040EZ, line 12a; Form 1040NR,<br/> line 68a; Form 1040NR-EZ, line 23a; Form 1040-SS, line 13a; or Form 1040-PR, line 13a
		
		
		<span class="styBoldText">
             <span style="width:8px"></span>.
             <span style="width:8px"></span>.
             <span style="width:8px"></span>.
             <span style="width:8px"></span>.
             <span style="width:8px"></span>.
             </span></div>

  		<div class="styIRS8888ColBoxGrey" style="height:11mm;width:7mm;padding-top:7.5mm;text-align:center;border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;
  		border-bottom-width:0px;border-color:black;"><span style="width:6mm;height:4mm;font-size:8.5pt;padding-top:.5mm;background-color: white">4</span> </div>
 
 		<div class="styIRS8888ColBox" style="height:11mm;font-size:7.5pt;padding-top:8mm;border-left-width:0px;border-bottom-width:0px;border-right-width:0px;">
		
			<xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8888Data/TotalDirectDepositRefundAmt" /></xsl:call-template></div>

	</div>
	
		 <!-- End signature part -->
      <div style="width:187mm;font-size:6.5pt;padding-top:1mm;padding-bottom:4mm;">
        <div style="width:90mm;font-weight:bold;float:left;clear:none;">For Paperwork Reduction Act Notice, see back.</div>
        <div style="width:30mm;float:left;clear:none;">Cat. No. 21858A</div>
        <div style = "width:30mm;text-align:right;font-size:6pt;float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">8888  </span> (2009)</div>
      </div>

	<div class="pageEnd"  style="width:187mm;"></div>

	<!-- END of Page 1 -->

  <!-- BEGIN Left Over Table -->  
        <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>

        <!-- Additional Data Table -->
        <table class="styLeftOverTbl">

			<xsl:call-template name="PopulateCommonLeftover">
				<xsl:with-param name="TargetNode" select="$Form8888Data"/>
				<xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
        
        </table>

  
    </form>
  </body>
</html>

</xsl:template>
</xsl:stylesheet>
