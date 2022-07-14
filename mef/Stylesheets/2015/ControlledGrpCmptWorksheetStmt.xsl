<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="CCSData" select="$RtnDoc/ControlledGrpCmptWorksheetStmt" />
  
  <!-- Template to display Itemized Charitable Contribution Statement -->
  
  
  <!-- HORIZONTAL TABLE STYLE COMMENTED  
  <xsl:template name="ShowCCS">      
    <table id="CCSTbl" class="styDepTbl" style="font-size:7pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
           <th class="styDepTblCell" scope="col">Corporation Name</th>        
           <th class="styDepTblCell" scope="col">Corporation EIN</th>  
           <th class="styDepTblCell" scope="col">Member Name</th>        
           <th class="styDepTblCell" scope="col">Enter taxable income from line 30, page 1, Form 1120</th>
            <th class="styDepTblCell" scope="col">Enter lesser of line 1 or the corporation's share of the $50,000 taxable income bracket</th>        
           <th class="styDepTblCell" scope="col">Subtract line 2 from line 1</th>
            <th class="styDepTblCell" scope="col">Enter lesser of line 3 or the corporation's share of the $25,000 taxable income bracket</th>        
           <th class="styDepTblCell" scope="col">Subtract line 4 from line 3 </th>
            <th class="styDepTblCell" scope="col">Enter lesser of line 5 or the corporation's share of the $9,925,000 taxable income bracket</th>        
           <th class="styDepTblCell" scope="col">Subtract line 6 from line 5</th>
            <th class="styDepTblCell" scope="col">Multiply line 2 by 15%</th>        
           <th class="styDepTblCell" scope="col">Multiply line 4 by 25%</th>
            <th class="styDepTblCell" scope="col">Multiply line 6 by 34%</th>        
           <th class="styDepTblCell" scope="col">Multiply line 7 by 35%</th>
            <th class="styDepTblCell" scope="col">If the taxable income of the controlled group exceeds $100,000, enter this member's share of the smaller of: 5% of the taxable income in excess of $100,000, or $11,750</th>        
           <th class="styDepTblCell" scope="col">If the taxable income of the controlled group exceeds $15 million, enter this member's share of the smaller of: 3% of the taxable income in excess of $15 million</th>
            <th class="styDepTblCell" scope="col">Total.  Add lines 8 through 13.  Enter total here and on line 3, Schedule J, Form 1120</th>                 
        </tr>
      </thead>
        <tfoot></tfoot>
        
       <tbody>    
        <xsl:for-each select="$CCSData/TaxComputationInfo">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1" />
              </xsl:call-template>
            
              <xsl:if test="CorporationName/BusinessNameLine2 != ''">
                <br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2" />
                </xsl:call-template>
              </xsl:if>
            </td>
            
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationEIN" />
              </xsl:call-template>
            </td>      
            
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="MemberName/BusinessNameLine1" />
              </xsl:call-template>
            
              <xsl:if test="MemberName/BusinessNameLine2 != ''">
                <br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="MemberName/BusinessNameLine2" />
                </xsl:call-template>
              </xsl:if>
            </td>          
          
            <td class="styDepTblCell" style="text-align:right;" >              
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxableIncome" />
              </xsl:call-template>              
            </td>        
        
            <td class="styDepTblCell" style="text-align:right;" >              
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxableIncomePortion1" />
              </xsl:call-template>            
            </td>        
        
            <td class="styDepTblCell" style="text-align:right;" >            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxableIncomeDifference1" />
              </xsl:call-template>            
            </td>                   
        
            <td class="styDepTblCell" style="text-align:right;" >            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxableIncomePortion2" />
              </xsl:call-template>            
            </td>      
        
            <td class="styDepTblCell" style="text-align:right;" >              
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxableIncomeDifference2" />
              </xsl:call-template>              
            </td>        
        
            <td class="styDepTblCell" style="text-align:right;" >            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxableIncomePortion3" />
              </xsl:call-template>            
            </td>      
        
            <td class="styDepTblCell" style="text-align:right;" >            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxableIncomeDifference3" />
              </xsl:call-template>            
            </td>        
        
            <td class="styDepTblCell" style="text-align:right;" >            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxComputation1" />
              </xsl:call-template>            
            </td>                   
        
            <td class="styDepTblCell" style="text-align:right;" >            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxComputation2" />
              </xsl:call-template>            
            </td>      
        
            <td class="styDepTblCell" style="text-align:right;" >            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxComputation3" />
              </xsl:call-template>            
            </td>        
        
            <td class="styDepTblCell" style="text-align:right;" >            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxComputation4" />
              </xsl:call-template>            
            </td>        
        
            <td class="styDepTblCell" style="text-align:right;" >            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxComputation5" />
              </xsl:call-template>            
            </td>        
        
            <td class="styDepTblCell" style="text-align:right;" >            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxComputation6" />
              </xsl:call-template>              
            </td>
                
            <td class="styDepTblCell" style="text-align:right;" >            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TotalTax" />
              </xsl:call-template>            
            </td>    
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
-->        
    
  
  <xsl:template name="ShowCCS">
    
    <xsl:for-each select="$CCSData/TaxComputationInfo">
      <table id="CCSTbl" class="styDepTbl">
        
         <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row"  style="width:40%;text-align:right;">Item No.</th>
          <td class="styDepTblCell" style="text-align:center;" ><xsl:value-of select="position()" /></td>
        </tr>        
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Corporation Name
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1" />
            </xsl:call-template>
          
            <xsl:if test="CorporationName/BusinessNameLine2 != ''">
              <br />
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2" />
              </xsl:call-template>
            </xsl:if>
          </td>  
        </tr>
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Corporation EIN
          </th>
          <td class="styDepTblCell" style="text-align:left;">
             <xsl:if test="CorporationEIN">
                 <xsl:call-template name="PopulateEIN">
                 <xsl:with-param name="TargetNode" select="CorporationEIN" />
                 </xsl:call-template>
             </xsl:if>
              <xsl:if test="MissingEINReason">
                 <xsl:call-template name="PopulateText">
                 <xsl:with-param name="TargetNode" select="MissingEINReason" />
                 </xsl:call-template>
            </xsl:if>
          </td>
        </tr>
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Member Name
          </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="MemberName/BusinessNameLine1" />
            </xsl:call-template>
          
            <xsl:if test="MemberName/BusinessNameLine2 != ''">
              <br />
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="MemberName/BusinessNameLine2" />
              </xsl:call-template>
            </xsl:if>
          </td>  
        </tr>
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Enter taxable income from line 30, page 1, Form 1120
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxableIncome" />
              </xsl:call-template>
            </span>
          </td>
        </tr>        
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Enter lesser of line 1 or the corporation's share of the $50,000 taxable income bracket
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxableIncomePortion1" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Subtract line 2 from line 1
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxableIncomeDifference1" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
                   
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Enter lesser of line 3 or the corporation's share of the $25,000 taxable income bracket
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxableIncomePortion2" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Subtract line 4 from line 3 
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxableIncomeDifference2" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Enter lesser of line 5 or the corporation's share of the $9,925,000 taxable income bracket
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxableIncomePortion3" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
          
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Subtract line 6 from line 5
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxableIncomeDifference3" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
          
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Multiply line 2 by 15%
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxComputation1" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
                   
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Multiply line 4 by 25%
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxComputation2" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Multiply line 6 by 34%
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxComputation3" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Multiply line 7 by 35%
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxComputation4" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
          
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            If the taxable income of the controlled group exceeds $100,000, enter this member's share of the smaller of: 5% of the taxable income in excess of $100,000, or $11,750
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxComputation5" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            If the taxable income of the controlled group exceeds $15 million, enter this member's share of the smaller of: 3% of the taxable income in excess of $15 million
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxComputation6" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
          
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Total.  Add lines 8 through 13.  Enter total here and on line 3, Schedule J, Form 1120
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalTax" />
              </xsl:call-template>
            </span>
          </td>
        </tr>         
        
      </table>
      <br/>        
    </xsl:for-each>    
  </xsl:template>
  
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$CCSData" /></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
          <title><xsl:value-of select="$depDocTitle" /></title>

         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
         <meta name="Author" content="Ravi Venigalla" />
         <meta name="Description" content= "{$depDocTitle}" /> 
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
      
        
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>    
      <body class="styBodyClass" >
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>    
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:80mm">
            <xsl:value-of select="$depDocTitle" />        
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$CCSData" /></xsl:call-template>        
                
        <xsl:call-template name="ShowCCS" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







