<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
    
  <xsl:include href="PopulateTemplate.xsl"/>  
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
  <xsl:param name="Form990DepsData" select="$RtnDoc/LoansFromOfficersSchedule"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$Form990DepsData"/></xsl:call-template>  
  </xsl:param>
    
  <!-- Template to display dependency schedule -->
  <xsl:template name="ShowDS">
    <!-- Itemized dependency Schedule -->
    <xsl:for-each select="$Form990DepsData/LoansFromOfficerGrp">
      <table id="DSTbl" class="styDepTbl">      
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 45%">Item No.</th>
          <td class="styDepTblCell" style="text-align:center;">
            <xsl:value-of select="position()"/>
          </td>  
        </tr>  
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 45%">Lender's Name</th>
          <td class="styDepTblCell" style="text-align:left">          
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="LenderPersonNm"/></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 45%">Lender's Title</th>              
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="TitleTxt"/></xsl:call-template>             
          </td>
        </tr>  
        <tr class="styDepTblRow2">  
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 45%">Original Amount of Loan</th>                                
          <td class="styDepTblCell" style="text-align:right">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="LoanOriginalAmt"/></xsl:call-template>               
            </span>
          </td>  
        </tr>
        <tr class="styDepTblRow1">        
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 45%">Balance Due</th>                          
          <td class="styDepTblCell" style="text-align:right">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="BalanceDueAmt"/></xsl:call-template>                   
            </span>      
          </td>                                    
        </tr>
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 45%">Date of Note</th>
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="NoteDt"/></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow1">      
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 45%">Maturity Date</th>                            
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="LoanMaturityDt"/></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow2">              
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 45%">Repayment Terms</th>                        
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RepaymentTermsTxt"/></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow1">                  
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 45%">Interest Rate</th>                  
          <td class="styDepTblCell" style="text-align:left">
            <span style="width:44mm;text-align:left;">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="InterestRt"/></xsl:call-template> 
            </span>            
          </td>
        </tr>
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 45%">Security Provided by Borrower</th>                                    
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="SecurityProvidedBorrowerTxt"/></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow1">    
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 45%">Purpose of Loan</th>                                  
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="LoanPurposeTxt"/></xsl:call-template>             
          </td>    
        </tr>
        <tr class="styDepTblRow2">    
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 45%">Description of Lender Consideration</th>                            
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="LenderConsiderationDesc"/></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow1">        
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 45%">Consideration FMV</th>                              
          <td class="styDepTblCell" style="text-align:right">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="ConsiderationFMVAmt"/></xsl:call-template>
            </span>             
          </td>
        </tr>                                    
      </table>
      <br/>
    </xsl:for-each>
  </xsl:template>
  
  
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
         <title><xsl:value-of select="$depDocTitle"/></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
         <meta name="Author" content="lshen@us.ibm.com"/>
         <meta name="Description" content="{$depDocTitle}"/>
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!--Generic CSS Styles are located in the template called below -->
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesDep"/>
      </head>
    
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"/>  
        <div class="styDepTitleLine">
          <div class="styDepTitle" style="width: 187mm">
            <xsl:value-of select="$depDocTitle"/>            
          </div>
        </div>        
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$Form990DepsData"/>
        </xsl:call-template>
        <br/>            
        <xsl:call-template name="ShowDS"/>          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>