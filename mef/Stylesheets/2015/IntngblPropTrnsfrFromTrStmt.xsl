<?xml version="1.0" encoding="UTF-8"?>
<!-- UWR123023 IE11 Upgrade Fixes 5/22/2015 by Robert L Jones-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="DependencyData" select="$RtnDoc/IntngblPropTrnsfrFromTrStmt"/>
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName">
  <xsl:with-param name="TargetNode" select="$DependencyData"/>
  </xsl:call-template>  
  </xsl:param>
             <!--Intangible property transferred from transaction statement  -->  

    <xsl:template name="IntngblPropTrnsfrFromTrStmtTemp">
    <!-- This puts the columns back    -->
    <table id="IntngblPropTrnsfrFromTrStmtTbl" class="styDepTblLandscape">
<!--    <span class="styRepeatingDataTitle">Intangible Property Transferred From Transaction Statement</span>   
-->		<thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">Descript of Intang Prop Trans</th>
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">Descript Reg<br/>16038B1Td1iiB</th>
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">Descript Reg<br/>16038B1Td1iii</th>
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">Descript Reg<br/>16038B1Td1iv</th>
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">Calc Annl Pymt Reg<br/>16038B1Td1v</th>
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">Trnsfr As Sale Reg<br/>16038B1Td1vi</th>
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">Intngbl Prop Reg<br/>16038B1Td1vii</th>
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">Intngbl Prop Reg<br/>16038B1Td1viii</th>
       </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
     
       <xsl:for-each select="$DependencyData/IntngblPropTrnsfrFromTrInfo">
        <!-- set row background -->
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>

          <!--Description Of Intangible Property Transferred --> 
          <td class="styDepTblCell" style="width:32mm;text-align:left;font-size:7pt;">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="IntangiblePropertyTransferDesc"/>
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtDescOfIntngblPropTrnsfr</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!--Enter a general description of the transfer, and any wider transaction of which it forms a part, including a chronology of the transfers involved and an identification of the other parties to the transaction to the extent known --> 
          <td class="styDepTblCell" style="width:32mm;text-align:left;font-size:7pt;">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TransferReg16038B1Td1iiBDesc"/>
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtDescOfTrnsfrReg16038B1Td1iiB</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!--Provide a description of the consideration received by the U.S. person making the transfer, including its estimated fair market value and, in the case of stock or securities, the class or type, amount, and characteristics of the interest received --> 
          <td class="styDepTblCell" style="width:32mm;text-align:left;font-size:7pt">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CnsdrReg16038B1Td1iiiDesc"/>
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtDescOfCnsdrReg16038B1Td1iii</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!--Provide a description of the intangible property transferred, including its adjusted basis.  Generally, each intangible asset must be separately identified.  Operating intangibles and foreign goodwill or going concern value, as defined in Regulations section 1.367(a)-1T (d) (5) (ii) and (iii), should be so identified and classified --> 
          <td class="styDepTblCell" style="width:32mm;text-align:left;font-size:7pt">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="IntngblPropReg16038B1Td1ivDesc"/>
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtDescIntngblPropReg16038B1Td1iv</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Provide and explain the calculation of the annual deemed payment for the use of the intangible property required to be recognized by the transferor under the rules of Section 367(d) --> 
          <td class="styDepTblCell" style="width:32mm;text-align:left;font-size:7pt">
             <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="CalcAnnlPymtReg16038B1Td1vDesc"/>
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtCalcAnnlPymtReg16038B1Td1v</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--List any intangible with respect to which an election is being made under Regulations Section 1.367(d)-1T(g)(2) to treat the transfer as a sale.  Include the fair market value of the intangible on the date of the transfer and a calculation of the gain required to be recognized in the year of the transfer by reason of the election --> 
          <td class="styDepTblCell" style="width:32mm;text-align:left;font-size:7pt">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TrnsfrSaleReg16038B1Td1viDesc"/>
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtTrnsfrSaleReg16038B1Td1vi</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--List any intangible property subject to Section 367(d) the transfer of which also gives rise to the recognition of gain under Section 904(f)(3) or Reg Section 1.367(a)-6T.  Provide a calculation of the gain required to be recognized with respect to such property, in accordance with the provisions of Reg Section 1.367(d)-1T(g)(4) --> 
          <td class="styDepTblCell" style="width:32mm;text-align:left;font-size:7pt">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="IntngblPropReg16038B1Td1viiTxt"/>
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtIntngblPropReg16038B1Td1vii</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!-- Describe any intangible property sold or licensed by the transferor to the transferee foreign corporation, and set forth the general terms of each sale or license --> 
         <td class="styDepTblCell" style="width:32mm;text-align:left;font-size:7pt"> 
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="IntngblPrpReg16038B1Td1viiiTxt"/>
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtIntngblPropReg16038B1Td1viii</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Date of the initial transfer --> 
        </tr>
      </xsl:for-each>
      </tbody>
		</table> 
 </xsl:template> 
 
     <xsl:template name="IntngblPropTrnsfrFromTrStmtTempContinue">
    <!-- This puts the columns back    -->
    <table id="IntngblPropTrnsfrFromTrStmtTbl" class="styDepTblLandscape">
<!--    <span class="styRepeatingDataTitle">Intangible Property Transferred From Transaction Statement</span>   
-->		<thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">Date Trnsfr Reg<br/>16038B1Td2iiA</th>
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">Desc Trnsfr Reg<br/>16038B1Td2iiC</th>
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">Desc Trnsfr Reg<br/>16038B1Td2iiiA</th>
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">Calc Gain Reg<br/>16038B1Td2iiiB</th>
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">Rcvd AnnlPymt Reg<br/>16038B1Td2iiiC</th>
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">Person/Bussiness<br/>Name</th>
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">Address<br/></th>
           <th class="styDepTblCell"  scope="col" style="width:32mm;text-align:center">EIN/SSN<br/></th>
       </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
     
       <xsl:for-each select="$DependencyData/IntngblPropTrnsfrFromTrInfo">
        <!-- set row background -->
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
           <!--Date of the initial transfer --> 
          <td class="styDepTblCell" style="width:32mm;text-align:left;font-size:7pt">
             <xsl:call-template name="PopulateMonthDayYear">
                <xsl:with-param name="TargetNode" select="TransferReg16038B1Td2iiADt"/>
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtDateTrnsfrReg16038B1Td2iiA</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Enter a general description of the transfer and any wider transaction of which it formed a part --> 
          <td class="styDepTblCell" style="width:32mm;text-align:left;font-size:7pt">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TransferReg16038B1Td2iiCDesc"/>
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtDescTrnsfrReg16038B1Td2iiC</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!-- Enter a general description of the subsequent transfer and any wider transaction of which it forms a part -->
          <td class="styDepTblCell" style="width:32mm;text-align:left;font-size:7pt">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TransferReg16038B1Td2iiiADesc"/>
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtDescTrnsfrReg16038B1Td2iiiA</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!-- Provide a calculation of any gain required to be recognized by the U.S. person under the rules of Reg Section 1.367(d)-1T (d) through (f) -->
          <td class="styDepTblCell" style="width:32mm;text-align:left;font-size:7pt">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CalcGainReg16038B1Td2iiiBDesc"/>
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtCalcGainReg16038B1Td2iiiB</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!-- Under the rules of Reg Section 1.367(d)-1T (e) or (f) did anyone receive contingent annual payments for the use of the intangible property? -->
          <td class="styDepTblCell" style="width:32mm;text-align:left;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="RcvAnnlPymtRg16038B1Td2iiiCInd"/>
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtRcvdAnnlPymtReg16038B1Td2iiiC</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!-- Name of Person receiving annual payment -->
          <td class="styDepTblCell" style="width:32mm;text-align:left;font-size:7pt">
            <xsl:choose> 
              <xsl:when test="BusinessNameLine1Txt"> 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessNameLine1Txt"/>
                </xsl:call-template>
                 </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PersonNm"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>
         
          <td class="styDepTblCell" style="width:32mm;text-align:left;font-size:7pt">
           <!--  <xsl:choose> 
              <xsl:when test="USAddress"> 
                <xsl:call-template name="PopulateUSAddressTemplate">
                  <xsl:with-param name="TargetNode" select="USAddress"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateForeignAddressTemplate">
                  <xsl:with-param name="TargetNode" select="ForeignAddress"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>  -->
           <xsl:if test="USAddress/AddressLine1 != ''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="USAddress/AddressLine1" />
              </xsl:call-template> 
            </xsl:if>
           <xsl:if test="USAddress/AddressLine1 != ''"><br/></xsl:if> 
            <xsl:if test="USAddress/AddressLine2 != ''">            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="USAddress/AddressLine2" />
              </xsl:call-template><br/>
            </xsl:if>
            <xsl:if test="USAddress/City != ''">             
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="USAddress/City" />
              </xsl:call-template>, 
            </xsl:if> 
            <xsl:if test="USAddress/State != ''">            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="USAddress/State" />
              </xsl:call-template>
              <span style="width: 1mm"></span>
              </xsl:if> 
               
               <xsl:if test="USAddress/ZIPCode != ''">            
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="USAddress/ZIPCode" />
            </xsl:call-template> 
            </xsl:if>     
          <!-- foreign Address -->
            <xsl:if test="ForeignAddress/AddressLine1 != ''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1" />
              </xsl:call-template><br/> 
            </xsl:if>        
            <xsl:if test="ForeignAddress/AddressLine2 != ''">    
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2" />
              </xsl:call-template><br/>
            </xsl:if>  
            <xsl:if test="ForeignAddress/City != ''">          
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ForeignAddress/City" />
              </xsl:call-template>, <br></br>
            </xsl:if>   
            <xsl:if test="ForeignAddress/ProvinceOrState != ''">          
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState" />
              </xsl:call-template>, 
            </xsl:if>    
            <span style="width: 1mm"></span>     
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCode" />
            </xsl:call-template>         
             <span style="width:1mm"></span>    
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ForeignAddress/CountryCode" />
            </xsl:call-template> 
             </td> 
          <td class="styDepTblCell" style="width:32mm;text-align:center;font-size:7pt">
         <xsl:choose> 
          <xsl:when test="EIN">
                <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="EIN"/>
              </xsl:call-template>
          </xsl:when>
          <xsl:when test="SSN">
            <xsl:call-template name="PopulateSSN">
              <xsl:with-param name="TargetNode" select="SSN"/>
            </xsl:call-template>
         </xsl:when> 
        <xsl:otherwise>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose> 
        </td>
        </tr>
      </xsl:for-each>
      </tbody>
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
         <meta name="Author" content="Trin Xue"/>
         <meta name="Description" content="{$depDocTitle}"/>
         
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
         <xsl:call-template name="InitJS"/>
         <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"/>    
          </xsl:if>
         </style>
      <xsl:call-template name="GlobalStylesDep"/>
		</head>
    
      <body class="styBodyClass">
      <xsl:call-template name="DocumentHeaderDependencyLandscape">
      </xsl:call-template>
    
        <div class="styDepTitleLineLandscape">
          <span class="styDepTitle">
            
              <xsl:value-of select="$depDocTitle"/>
           
          </span>
        </div>
        
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
        <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <br/>      
        <xsl:call-template name="IntngblPropTrnsfrFromTrStmtTemp"/>
        <br/>
         <xsl:call-template name="IntngblPropTrnsfrFromTrStmtTempContinue"/>
       <br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>