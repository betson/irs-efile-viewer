<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="IRS8916AStyle.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS8916A" />
<xsl:template match="/">
<html>
<head>  
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Description" content="Form IRS 8916A"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
  <link rel="stylesheet" type="text/css" href="{$CSSPath}/header.css"/>
  <link rel="stylesheet" type="text/css" href="{$CSSPath}/body.css"/>
  <link rel="stylesheet" type="text/css" href="{$CSSPath}/general.css"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>  
  <style type="text/css">    
    <xsl:if test="not($Print) or $Print=''">  
      <xsl:call-template name="IRS8916AStyle"></xsl:call-template>
      <xsl:call-template name="AddOnStyle"></xsl:call-template>  
    </xsl:if>
  </style>      
</head>
<body class="styBodyClass">
  <form name="Form8916A">    
    <xsl:call-template name="DocumentHeader"></xsl:call-template>  
  <!--Title of Form -->    
  <div class="styBB" style="width:187mm;">
  
    <div class="styFNBox" style="width:34mm;font-size: 7pt;height:19mm;">
      Form <span class="styFormNumber">8916-A</span>      
      <br/><br/>
      <span>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$FormData"/>
        </xsl:call-template>  
      </span>  
      <span class="styAgency">Department of the Treasury</span><br /><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="height:19mm;width:122mm;padding-top:1mm;">
      <div class="styMainTitle" style="">Supplemental  Attachment to Schedule M-3</div>
      <br/><br/><br/>
      <div  style="font-size:7pt;margin-left:3mm;">
        <img src="{$ImagePath}/8916A_Bullet.gif" alt="MediumBullet"/>  
        Attach to Schedule M-3 for Form 1065, 1120, 1120-L, 1120-PC, or 1120S. 
      </div>
    </div>
    <div class="styTYBox" style="width:30mm;height:19mm; border-left-width: 1px;">
      <div class="styOMB" style="height:2mm;">OMB No. 1545-2061</div><br/>
      <div class="styTY" style="height:10mm;">20<span class="styTYColor">08</span></div>
    </div>
  </div>
  <!--  End title of Form  -->
  <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
     <div class="styNameBox" style="width:140mm;height:4mm;font-size:7pt;">
            Name of common parent<br/>
           <div style="font-family:verdana;font-size:7pt;height:6.25mm;">
             <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>  
             <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template> 
           </div>
          </div>
          <div class="styEINBox" style="width:46mm;height:4mm;padding-left:2mm;font-size:7pt;">
            Employer identification number<br/><br/>
            <span style="font-weight:normal;">  
              <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>
            </span>              
          </div>
  </div>  
  <!--  End Name and Employer indentification number  -->
  
        <!--  Name and Employer identification number 2  -->
  <div class="styBB" style="width:187mm">
         <div class="styNameBox" style="width:140mm;height:4mm;font-size:7pt;">
            Name of subsidiary<br/>
           <div style="font-family:verdana;font-size:7pt;height:6.25mm;">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$FormData/SubsidiaryName/BusinessNameLine1"/></xsl:call-template><br/>  
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$FormData/SubsidiaryName/BusinessNameLine2"/></xsl:call-template>
           </div>
          </div>
          <div class="styEINBox" style="width:46mm;height:4mm;padding-left:2mm;font-size:7pt;">
            Employer identification number<br/><br/>
            <span style="font-weight:normal;">  
              <xsl:call-template name="PopulateEIN"><xsl:with-param name="TargetNode" select="$FormData/EmployerIdentificationNumber"/></xsl:call-template>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$FormData/MissingEINReason"/></xsl:call-template>
            </span>              
          </div>
  </div>  
  <!--  End Name and Employer indentification number 2 -->
    <!-- BEGIN Part I Title -->
  <div class="styBB" style="width:187mm;">
    <div class="styPartName" style="width:23mm;">Part l</div>
    <div class="styPartDesc" style="width:164mm;">Cost of Goods Sold </div>
  </div>
  <!-- END Part I Title -->

<!--start table-->
      <table class="styTable" id="IRS8916ATable" summary="Cost of Goods Sold Items [header]" cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
        <tr>
          <th class="styTableThead" style="border-bottom:solid black 1px;width:320px;text-align:center;font-size:8pt;" scope="col">
                           Cost of Goods Sold Items</th>
          <th class="styIRS8916ATheadCell" scope="col"><span class="styBoldText">
                           (a)</span><br/> Expense per<br/>Income<br/>Statement<br/></th>
          <th class="styIRS8916ATheadCell" scope="col"><span class="styBoldText">
                           (b)</span><br/> Temporary<br/> Difference</th>
          <th class="styIRS8916ATheadCell" scope="col"><span class="styBoldText">
                           (c)</span><br/> Permanent<br/> Difference</th>
          <th class="styIRS8916ATheadCell" scope="col"><span class="styBoldText">
                           (d)</span><br/> Deduction per<br/>Tax Return<br/></th>
        </tr>
      </table>
<table class="styTable" id="IRS8916ATableData" summary="Cost of Goods Sold Items" cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
<!-- line 1 -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:1.5mm;"/>1</td>
          <td>
          <span style="height:8mm;padding-top: 2mm;"><span style="float:left">Amounts attributable to cost flow assumptions</span> <span class="styDotLn" style="float:right;" >...</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsCostFlowAssumptions/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsCostFlowAssumptions/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsCostFlowAssumptions/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsCostFlowAssumptions/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>
<!-- line 2 -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:1.5mm;"/>2</td>
          <td>
          <span style="padding-top:2mm;height:8mm;">Amounts attributable to:</span>
            <!-- pushpin data -->
          </td>     
          <!-- col 1 -->
          <td class="styIRS8916AShadedCell"><span style="width:1mm"/></td>
          <!-- col 2 -->
         <td class="styIRS8916AShadedCell"><span style="width:1mm"/></td>
          <!-- col 3 -->
          <td class="styIRS8916AShadedCell"><span style="width:1mm"/></td>
          <!-- col 4 -->
          <td class="styIRS8916AShadedCell"><span style="width:1mm"/></td>
        </tr>        
<!-- line 2a -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:3mm;"/>a</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Stock option expense</span> <span class="styDotLn" style="float:right;" >.............</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/StockOptionExpense/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/StockOptionExpense/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/StockOptionExpense/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/StockOptionExpense/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>
<!-- line 2b -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:3mm;"/>b</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Other equity based compensation</span> <span class="styDotLn" style="float:right;" >.........</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/OtherEquityBasedCompensation/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/OtherEquityBasedCompensation/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/OtherEquityBasedCompensation/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/OtherEquityBasedCompensation/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>
<!-- line 2c -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:3mm;"/>c</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Meals and entertainment</span> <span class="styDotLn" style="float:right;" >...........</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/MealsAndEntertainment/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/MealsAndEntertainment/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/MealsAndEntertainment/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/MealsAndEntertainment/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>
<!-- line 2d -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:3mm;"/>d</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Parachute payments</span> <span class="styDotLn" style="float:right;" >.............</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/ParachutePayments/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/ParachutePayments/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/ParachutePayments/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/ParachutePayments/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>
<!-- line 2e -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:3mm;"/>e</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Compensation with section 162(m) limitation</span> <span class="styDotLn" style="float:right;" >....</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/CompensationWithSection162mLmt/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/CompensationWithSection162mLmt/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/CompensationWithSection162mLmt/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/CompensationWithSection162mLmt/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>
<!-- line 2f -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:3mm;"/>f</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Pension and profit sharing</span> <span class="styDotLn" style="float:right;" >...........</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/PensionAndProfitSharing/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/PensionAndProfitSharing/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/PensionAndProfitSharing/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/PensionAndProfitSharing/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>
<!-- line 2g -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:3mm;"/>g</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Other post-retirement benefits</span> <span class="styDotLn" style="float:right;" >..........</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/OtherPostRetirementBenefits/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/OtherPostRetirementBenefits/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/OtherPostRetirementBenefits/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/OtherPostRetirementBenefits/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>
<!-- line 2h -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:3mm;"/>h</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Deferred compensation</span> <span class="styDotLn" style="float:right;" >............</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/DeferredCompensation/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/DeferredCompensation/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/DeferredCompensation/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/DeferredCompensation/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>
<!-- line 2i -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:3mm;"/>i</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Section 198 environmental remediation costs</span> <span class="styDotLn" style="float:right;" >.....</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Sect198EnvrmtRemediationCosts/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Sect198EnvrmtRemediationCosts/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Sect198EnvrmtRemediationCosts/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Sect198EnvrmtRemediationCosts/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>
<!-- line 2j -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:3mm;"/>j</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Amortization</span> <span class="styDotLn" style="float:right;" >...............</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Amortization/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Amortization/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Amortization/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Amortization/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>
<!-- line 2k -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:3mm;"/>k</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Depletion</span> <span class="styDotLn" style="float:right;" >................</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Depletion/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Depletion/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Depletion/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Depletion/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>
<!-- line 2l -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:3mm;"/>l</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Depreciation</span> <span class="styDotLn" style="float:right;" >...............</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Depreciation/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Depreciation/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Depreciation/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/Depreciation/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>
<!-- line 2m -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:3mm;"/>m</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Corporate owned life insurance premiums</span> <span class="styDotLn" style="float:right;" >......</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/CorporateOwnedLifeInsPremiums/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/CorporateOwnedLifeInsPremiums/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/CorporateOwnedLifeInsPremiums/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/CorporateOwnedLifeInsPremiums/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>
<!-- line 2n -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:3mm;"/>n</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Other section 263A costs</span> <span class="styDotLn" style="float:right;" >...........</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/OtherSection263ACosts/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/OtherSection263ACosts/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/OtherSection263ACosts/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableTo/OtherSection263ACosts/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>        
<!-- line 3 -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:1.5mm;"/>3</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Inventory shrinkage accruals</span> <span class="styDotLn" style="float:right;" >..........</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/InventoryShrinkageAccruals/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/InventoryShrinkageAccruals/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/InventoryShrinkageAccruals/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/InventoryShrinkageAccruals/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>        
<!-- line 4 -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:1.5mm;"/>4</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Excess inventory and obsolescence reserves</span> <span class="styDotLn" style="float:right;" >....</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/ExInvntryObsolescenceReserves/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/ExInvntryObsolescenceReserves/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/ExInvntryObsolescenceReserves/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/ExInvntryObsolescenceReserves/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>      
<!-- line 5 -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:1.5mm;"/>5</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Lower of cost or market write-downs</span> <span class="styDotLn" style="float:right;" >........</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LowerOfCostOrMarketWritedowns/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LowerOfCostOrMarketWritedowns/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LowerOfCostOrMarketWritedowns/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LowerOfCostOrMarketWritedowns/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>      
<!-- line 6  -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:1.5mm;"/>6</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Other items with differences (attach schedule)                         <xsl:call-template name="SetFormLinkInline"><xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferences"/></xsl:call-template></span> 
          <span class="styDotLn" style="float:right;" >...</span>            </span>
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferences/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferences/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferences/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferences/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>      
<!-- line 7 -->
        <tr valign="middle" style="height:8mm;">
          <td class="styIRS8916ANumberCell"><span style="width:1.5mm;"/>7</td>
          <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left">Other items with no differences</span> <span class="styDotLn" style="float:right;" >.........</span>            </span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithNoDifferences/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
         <td class="styIRS8916AShadedCell"><span style="width:1mm"/></td>
          <!-- col 3 -->
          <td class="styIRS8916AShadedCell"><span style="width:1mm"/></td>
          <!-- col 4 -->
          <td class="styIRS8916ACell">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithNoDifferences/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>          
            
 <!-- line 8  -->
        <tr valign="top" style="height:8mm;">
	<td class="styIRS8916ANumberCell"><span style="width:1.5mm;"/>8</td>
	     <td>
          <span style="padding-top:2mm;height:8mm;"><span style="float:left"><b>Total cost of goods sold.</b> Add lines 1 through 7, in<br/>columns a, b, c, and d
<span class="styBoldText">
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
           <span style="width:16px"></span>.
           </span>
</span>
</span>
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell" style="border-bottom:none;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotalCostOfGoodsSold/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
                   <td class="styIRS8916ACell" style="border-bottom:none;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotalCostOfGoodsSold/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
                    <td class="styIRS8916ACell" style="border-bottom:none;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotalCostOfGoodsSold/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell" style="border-bottom:none;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotalCostOfGoodsSold/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/> 
          </td>
        </tr>             
      </table>
<!-- table end -->
  <!--  FOOTER-->
        <div style="width:187mm;border-top:1px solid black;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see page 4. </span> 
          <span style="width:108px;"></span>                      
          Cat. No. 48657X
          <span style="width:155px;"></span>  
          Form <span class="styBoldText">8916-A</span> (2008)
        </div> 
        <br class="pageEnd"/>
          <!--Begin Page 2 -->
  
  <!-- Page Header -->
  <div class="styBB" style="width:187mm;padding-top:.5mm;">  
    <div style="float:left;">Form 8916-A (2008)<span style="width:148mm;"></span></div>
    <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div> 
  </div>  
  <!-- END Page Header -->

  <!-- BEGIN Part ll Title -->
  <div class="styBB" style="width:187mm;border-top:1px solid black">
    <div class="styPartName" style="width:23mm;">Part ll</div>
    <div class="styPartDesc" style="width:164mm;">Interest Income</div>
  </div>
  <!-- END Part ll Title -->

<!--start table-->
      <table class="styTable" id="IRS8916ATable" summary="Interest Income [header]" cellspacing="0" cellpadding="0" style="font-size:7pt;">
        <tr valign="middle" style="height:7mm;">
         <td class="styIRS8916ALnNumCell"><span style="width:9.0mm;"/></td>

            <td class="styNormalText" style="border-bottom:solid black 1px;border-right:solid black 1px; width:45.6mm;text-align:center;font-size:8pt;">
                           Interest Income Item</td>
          <td class="styIRS8916ATheadCellPt2"><span class="styBoldText">
                           (a)</span><br/>Income (Loss) per<br/>Income Statement<br/></td>
          <td class="styIRS8916ATheadCellPt2"><span class="styBoldText">
                           (b)</span><br/> Temporary<br/> Difference</td>
          <td class="styIRS8916ATheadCellPt2"><span class="styBoldText" >
                           (c)</span><br/> Permanent<br/> Difference</td>
          <td class="styIRS8916ATheadCellPt2" style="border-right:0px;"><span class="styBoldText" >
                           (d)</span><br/> Income (Loss) per<br/>Tax Return<br/></td>
        </tr>
      </table>
<table class="styTable" id="IRS8916ATableData" summary="Interest Income" cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">

<!-- line 1 -->
        <tr valign="middle" style="height:6mm;">
          <td class="styIRS8916ALnNumCell"><span style="width:1.5mm;"/>1</td>
          <td class="styIRS8916ATxCell ">Tax-exempt interest<br/> income
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell" style="width:30mm;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestIncome/IncomeLossPerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestIncome/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestIncome/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916AShadedCell" style="width:30mm;"><span style="width:1mm"/></td>
        </tr>
<!-- line 2 -->
        <tr valign="middle" style="height:6mm;">
          <td class="styIRS8916ALnNumCell"><span style="width:1.5mm;"/>2</td>
          <td class="styIRS8916ATxCell ">Interest income from hybrid<br/>securities
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell" style="width:30mm;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesInterestIncome/IncomeLossPerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesInterestIncome/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesInterestIncome/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesInterestIncome/IncomeLossPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
        </tr>
 <!-- line 3 -->
        <tr valign="middle" style="height:6mm;">
          <td class="styIRS8916ALnNumCell"><span style="width:1.5mm;"/>3</td>
          <td class="styIRS8916ATxCell ">Sales/lease interest income
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell" style="width:30mm;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/SaleLeaseInterestIncome/IncomeLossPerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/SaleLeaseInterestIncome/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell"  style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/SaleLeaseInterestIncome/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/SaleLeaseInterestIncome/IncomeLossPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
        </tr>
 <!-- line 4a -->
        <tr valign="middle" style="height:6mm;">
          <td class="styIRS8916ALnNumCell"><span style="width:1.5mm;"/>4a</td>
          <td class="styIRS8916ATxCell ">Intercompany interest <br/>income - From outside tax <br/>affiliated group
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell" style="width:30mm;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncOutsideGrp/IncomeLossPerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncOutsideGrp/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell"  style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncOutsideGrp/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncOutsideGrp/IncomeLossPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
        </tr>
 <!-- line 4b -->
        <tr valign="middle" style="height:6mm;">
          <td class="styIRS8916ALnNumCell"><span style="width:1.5mm;"/>4b</td>
          <td class="styIRS8916ATxCell ">Intercompany interest <br/>income - From tax <br/>affiliated group
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell" style="width:30mm;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncAffiliatdGrp/IncomeLossPerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncAffiliatdGrp/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell"  style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncAffiliatdGrp/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncAffiliatdGrp/IncomeLossPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
        </tr>
 <!-- line 5 -->
        <tr valign="middle" style="height:6mm;">
          <td class="styIRS8916ALnNumCell"><span style="width:1.5mm;"/>5</td>
          <td class="styIRS8916ATxCell">Other interest income
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell" style="width:30mm;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/OtherInterestIncome/IncomeLossPerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/OtherInterestIncome/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell"  style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/OtherInterestIncome/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/OtherInterestIncome/IncomeLossPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
        </tr>
 <!-- line 6 -->
        <tr valign="top" style="height:6mm;">
          <td class="styIRS8916ALnNumCell"><span style="width:1.5mm;height:6mm;"/>6</td>
          <td class="styIRS8916ATxCell">Total interest income. Add
          <br/>lines 1 through 5. Enter total
          <br/>on Schedule M-3 (Forms
          <br/>1120,1120-PC,and 1120-L),<br/>
          Part ll, line 13 or Schedule<br/>
           M-3 (Forms 1065, and<br/>
           1120-S) Part ll, line 11.
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell" style="width:30mm;height:6mm;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotalInterestIncome/IncomeLossPerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell" style="width:30mm;height:6mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotalInterestIncome/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell"  style="width:30mm;height:6mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotalInterestIncome/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell" style="width:30mm;height:6mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotalInterestIncome/IncomeLossPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
        </tr>
   </table>
  <!-- BEGIN Part lll Title -->
  <div class="styBB" style="width:187mm;">
    <div class="styPartName" style="width:23mm;">Part lll</div>
    <div class="styPartDesc" style="width:164mm;">Interest Expense</div>
  </div>
  <!-- END Part lll Title -->
<!--start table-->
      <table class="styTable" id="IRS8916ATable" summary="Interest Expense [header]" cellspacing="0" cellpadding="0" style="font-size:7pt;">
        <tr valign="middle" style="height:7mm;">
         <td class="styIRS8916ALnNumCell"><span style="width:9.0mm;"/></td>

            <td class="styNormalText" style="border-bottom:solid black 1px;border-right:solid black 1px; width:45.6mm;text-align:center;font-size:8pt;">
                           Interest Expense Item</td>
          <td class="styIRS8916ATheadCellPt2"><span class="styBoldText">
                           (a)</span><br/>Expense per Income<br/>Statement<br/></td>
          <td class="styIRS8916ATheadCellPt2"><span class="styBoldText">
                           (b)</span><br/> Temporary<br/> Difference</td>
          <td class="styIRS8916ATheadCellPt2"><span class="styBoldText" >
                           (c)</span><br/> Permanent<br/> Difference</td>
          <td class="styIRS8916ATheadCellPt2" style="border-right:0px;"><span class="styBoldText" >
                           (d)</span><br/>Deduction per<br/>Tax Return<br/></td>
        </tr>
      </table>
<table class="styTable" id="IRS8916ATableData" summary="Interest Expense" cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
<!-- line 1 -->
        <tr valign="middle" style="height:6mm;">
          <td class="styIRS8916ALnNumCell"><span style="width:1.5mm;"/>1</td>
          <td class="styIRS8916ATxCell">Interest expense from hybrid<br/>securities
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell" style="width:30mm;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesIntExp/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesIntExp/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesIntExp/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
                    <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesIntExp/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>

        </tr>
<!-- line 2 -->
        <tr valign="middle" style="height:6mm;">
          <td class="styIRS8916ALnNumCell"><span style="width:1.5mm;"/>2</td>
          <td class="styIRS8916ATxCell">Lease/purchase interest<br/>expense
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell" style="width:30mm;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LeasePurchaseInterestExpense/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LeasePurchaseInterestExpense/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LeasePurchaseInterestExpense/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/LeasePurchaseInterestExpense/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
        </tr>
 <!-- line 3a -->
        <tr valign="middle" style="height:6mm;">
          <td class="styIRS8916ALnNumCell"><span style="width:1.5mm;"/>3a</td>
          <td class="styIRS8916ATxCell">Intercompany interest<br/>expense – Paid to outside
             <br/>tax affiliated group
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell" style="width:30mm;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpOutsideGrp/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpOutsideGrp/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell"  style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpOutsideGrp/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpOutsideGrp/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
        </tr>
 <!-- line 3b -->
        <tr valign="middle" style="height:6mm;">
          <td class="styIRS8916ALnNumCell"><span style="width:1.5mm;"/>3b</td>
          <td class="styIRS8916ATxCell">Intercompany interest
            <br/>expense – Paid to tax<br/>affiliated group
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell" style="width:30mm;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpAffiliatdGrp/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpAffiliatdGrp/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell"  style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpAffiliatdGrp/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpAffiliatdGrp/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
        </tr>
 <!-- line 4 -->
        <tr valign="middle" style="height:6mm;">
          <td class="styIRS8916ALnNumCell"><span style="width:1.5mm;"/>4</td>
          <td class="styIRS8916ATxCell">Other interest expense
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell" style="width:30mm;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/OtherInterestExpense/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/OtherInterestExpense/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell"  style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/OtherInterestExpense/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/OtherInterestExpense/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
        </tr>
 <!-- line 5 -->
        <tr valign="middle" style="height:6mm;">
          <td class="styIRS8916ALnNumCell"><span style="width:1.5mm;"/>5</td>
          <td class="styIRS8916ATxCell">Total interest expense. Add
            <br/>lines 1 through 4. Enter total
            <br/>on Schedule M-3 (Form
            <br/>1120) Part lll, line 8;
            <br/>Schedule M-3 (Forms 1120-PC and
            <br/>1120-L), Part lll, line 36; 
            <br/>Schedule M-3 (Form 1065)
            <br/>Part lll, line 27; or Schedule
            <br/>M-3 (Form 1120-S) Part lll, line 26.
            <!-- pushpin data -->
          </td>
          <!-- col 1 -->
          <td class="styIRS8916ACell" style="width:30mm;">
               <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotalInterestExpense/ExpensePerIncomeStatement"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 2 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotalInterestExpense/TemporaryDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 3 -->
          <td class="styIRS8916ACell"  style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotalInterestExpense/PermanentDifference"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
          <!-- col 4 -->
          <td class="styIRS8916ACell" style="width:30mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotalInterestExpense/DeductionPerTaxReturn"/></xsl:call-template>
               <span style="width:1px;"/>
          </td>
        </tr>
   </table>
   <!--  FOOTER-->
        <div style="width:187mm;border-top:1px solid black;">
          <span style="width:155mm;"></span>  
          Form <span class="styBoldText">8916-A</span> (2008)
        </div> 
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
            <xsl:with-param name="TargetNode" select="$FormData" />
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>          
        </table>
      <!-- END Left Over Table -->      
  </form>  
</body>
</html>
</xsl:template>    
</xsl:stylesheet>