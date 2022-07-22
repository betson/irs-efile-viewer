<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
    
  <xsl:include href="PopulateTemplate.xsl"/>  
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
<!-- change -->    
  <xsl:param name="Form990DepsData" select="$RtnDoc/OtherNotesLoansRcvblLongSch"/>
<!-- end change -->

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$Form990DepsData"/></xsl:call-template>  
  </xsl:param>

    
  <!-- Template to display dependency schedule -->
  <xsl:template name="ShowDS">
    <!-- Itemized dependency Schedule -->
    
    <table id="DSTbl" class="styDepTblLandscape" style="font-size: 6pt">  
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">Borrower's Name</th>
          <th class="styDepTblCell" scope="col">Relationship to Insider</th>
          <th class="styDepTblCell" scope="col">Original Amount of Loan</th>
          <th class="styDepTblCell" scope="col">Balance Due</th>
          <th class="styDepTblCell" scope="col">Date of Note</th>
          <th class="styDepTblCell" scope="col">Maturity Date</th>
          <th class="styDepTblCell" scope="col">Repayment Terms</th>  
          <th class="styDepTblCell" scope="col">Interest Rate</th>
          <th class="styDepTblCell" scope="col">Security Provided by Borrower</th>
          <th class="styDepTblCell" scope="col">Purpose of Loan</th>  
          <th class="styDepTblCell" scope="col">Description of Lender Consideration</th>
          <th class="styDepTblCell" scope="col">Consideration FMV</th>  
        </tr>
      </thead>  
      <tfoot/>    
      <tbody>
        <xsl:for-each select="$Form990DepsData/OtherNotesLoansRcvblLongGrp">
        <tr>
          <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="text-align:left">
            <xsl:if test="BorrowerNameGrp/PersonNm != ''">          
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BorrowerNameGrp/PersonNm"/></xsl:call-template> 
            </xsl:if>
            <xsl:if test="BorrowerNameGrp/BusinessName/BusinessNameLine1 != ''">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BorrowerNameGrp/BusinessName/BusinessNameLine1"/>
              </xsl:call-template> 
            </xsl:if>  
            <xsl:if test="BorrowerNameGrp/BusinessName/BusinessNameLine2 != ''"><br/>          
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BorrowerNameGrp/BusinessName/BusinessNameLine2"/>
              </xsl:call-template>
            </xsl:if>                     
          </td>
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="InsiderRelationshipTxt"/></xsl:call-template>             
          </td>
          <td class="styDepTblCell" style="text-align:right">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="LoanOriginalAmt"/></xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="BalanceDueAmt"/></xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:center; width: 13mm">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="NoteDt"/></xsl:call-template>             
          </td>
          <td class="styDepTblCell" style="text-align:center;width13mm;">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="LoanMaturityDt"/></xsl:call-template>             
          </td>
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RepaymentTermsTxt"/></xsl:call-template>             
          </td>
          <td class="styDepTblCell" style="text-align:right">
            <span style="width: 34mm;">
              <xsl:call-template name="PopulatePercent"><xsl:with-param name="TargetNode" select="InterestRt"/></xsl:call-template>            
            </span>
          </td>
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="SecurityProvidedBorrowerTxt"/></xsl:call-template>             
          </td>
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="LoanPurposeTxt"/></xsl:call-template>             
          </td>
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="LenderConsiderationDesc"/></xsl:call-template>             
          </td>
          <td class="styDepTblCell" style="text-align:right">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="ConsiderationFMVAmt"/></xsl:call-template>           
          </td>
        </tr>
        </xsl:for-each>
      </tbody>
<!-- end change -->
        <!--tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Item No.</th>
          <td class="styDepTblCell" style="text-align: center;">
            <xsl:value-of select="position()" />
          </td>
        </tr-->    
<!-- change -->  
        <!--tr class="styDepTblRow2">  
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Borrower's Name</th>
          <td class="styDepTblCell" style="text-align:left">          
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BorrowersName/Individual" />
            </xsl:call-template>         
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BorrowersName/Business/BusinessNameLine1" />
            </xsl:call-template> 
            &nbsp;              
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BorrowersName/Business/BusinessNameLine2" />
            </xsl:call-template>             
          </td>  
        </tr>
        <tr class="styDepTblRow1">  
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Relationship to Insider</th>          
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RelationshipToInsider" /></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow2">    
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Original Amount of Loan</th>                                
          <td class="styDepTblCell">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="OriginalAmountOfLoan" /></xsl:call-template>             </span>
          </td>
        </tr>
        <tr class="styDepTblRow1">    
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Balance Due</th>    
                            
          <td class="styDepTblCell" >
          <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BalanceDue" /></xsl:call-template>           </span>  
          </td>
        </tr>
        <tr class="styDepTblRow2">    
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Date of Note</th>                                
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="DateOfNote" /></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow1">          
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Maturity Date</th>                          
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="MaturityDate" /></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow2">      
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Repayment Terms</th>                              
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RepaymentTerms" /></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow1">        
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Interest Rate</th>                            
          <td class="styDepTblCell">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="InterestRate" /></xsl:call-template>
            </span>             
          </td>
        </tr>
        <tr class="styDepTblRow2">        
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Security Provided by Borrower</th>                            
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="SecurityProvidedByBorrower" /></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow1">        
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Purpose of Loan</th>                            
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="PurposeOfLoan" /></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow2">            
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Description of Lender Consideration</th>                        
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="DescOfLenderConsideration" /></xsl:call-template>             
          </td>
        </tr>
        <tr class="styDepTblRow1">                
          <th class="styDepTblCell" scope="col" nowrap="nowrap" style="text-align: right; width: 40%">Consideration FMV</th>                      
          <td class="styDepTblCell">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="ConsiderationFmv" /></xsl:call-template> 
            </span>            
          </td>
        </tr-->                                    
<!-- end change -->    
    </table>
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
<!-- change -->    
         <meta name="Description" content="{$depDocTitle}"/>
<!-- end change -->    
        
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
        <xsl:call-template name="DocumentHeaderDependencyLandscape"/>  
        <div class="styDepTitleLineLandscape">
          <div class="styDepTitle" style="width: 65mm;">
<!-- change -->    
            <xsl:value-of select="$depDocTitle"/>
<!-- end change -->    
          </div>
        </div>        
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$Form990DepsData"/></xsl:call-template>
        
        <br/>            
        <xsl:call-template name="ShowDS"/>          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>