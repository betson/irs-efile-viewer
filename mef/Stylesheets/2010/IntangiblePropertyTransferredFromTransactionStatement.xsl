<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:param name="DependencyData" select="$RtnDoc/IntngblPropTrnsfrFromTrStmt" />
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName">
  <xsl:with-param name="TargetNode" select="$DependencyData" />
  </xsl:call-template>  
  </xsl:param>
             <!--Intangible property transferred from transaction statement  -->  

    <xsl:template name="IntngblPropTrnsfrFromTrStmtTemp">
    <table id="IntngblPropTrnsfrFromTrStmtTbl" class="styDepTbl">
 <span class="styRepeatingDataTitle">Intangible Property Transferred From Transaction Statement</span>   
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="text-align:center">Descript of Intang Prop Trans</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Descript Reg<br/>16038B1Td1iiB</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Descript Reg<br/>16038B1Td1iii</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Descript Reg<br/>16038B1Td1iv</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Calc Annl Pymt Reg<br/>16038B1Td1v</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Trnsfr As Sale Reg<br/>16038B1Td1vi</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Intngbl Prop Reg<br/>16038B1Td1vii</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Intngbl Prop Reg<br/>16038B1Td1viii</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Date Trnsfr Reg<br/>16038B1Td2iiA</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Desc Trnsfr Reg<br/>16038B1Td2iiC</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Desc Trnsfr Reg<br/>16038B1Td2iiiA</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Calc Gain Reg<br/>16038B1Td2iiiB</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Rcvd AnnlPymt Reg<br/>16038B1Td2iiiC</th>
        </tr>
      </thead>
      <tfoot></tfoot>
    
      <tbody>
     
       <xsl:for-each select="$DependencyData/IntngblPropTrnsfrFromTrStmt">
        <!-- set row background -->
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>

          <!--Description Of Intangible Property Transferred --> 
          <td class="styDepTblCell" style="width:14mm;text-align:right;font-size:7pt;">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DescOfIntngblPropTrnsfr" />
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtDescOfIntngblPropTrnsfr</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!--Enter a general description of the transfer, and any wider transaction of which it forms a part, including a chronology of the transfers involved and an identification of the other parties to the transaction to the extent known --> 
          <td class="styDepTblCell" style="width:14mm;text-align:right;font-size:7pt;">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DescOfTrnsfrReg16038B1Td1iiB" />
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtDescOfTrnsfrReg16038B1Td1iiB</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!--Provide a description of the consideration received by the U.S. person making the transfer, including its estimated fair market value and, in the case of stock or securities, the class or type, amount, and characteristics of the interest received --> 
          <td class="styDepTblCell" style="width:14mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DescOfCnsdrReg16038B1Td1iii" />
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtDescOfCnsdrReg16038B1Td1iii</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!--Provide a description of the intangible property transferred, including its adjusted basis.  Generally, each intangible asset must be separately identified.  Operating intangibles and foreign goodwill or going concern value, as defined in Regulations section 1.367(a)-1T (d) (5) (ii) and (iii), should be so identified and classified --> 
          <td class="styDepTblCell" style="width:14mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DescIntngblPropReg16038B1Td1iv" />
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtDescIntngblPropReg16038B1Td1iv</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Provide and explain the calculation of the annual deemed payment for the use of the intangible property required to be recognized by the transferor under the rules of Section 367(d) --> 
          <td class="styDepTblCell" style="width:14mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CalcAnnlPymtReg16038B1Td1v" />
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtCalcAnnlPymtReg16038B1Td1v</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--List any intangible with respect to which an election is being made under Regulations Section 1.367(d)-1T(g)(2) to treat the transfer as a sale.  Include the fair market value of the intangible on the date of the transfer and a calculation of the gain required to be recognized in the year of the transfer by reason of the election --> 
          <td class="styDepTblCell" style="width:14mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TrnsfrSaleReg16038B1Td1vi" />
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtTrnsfrSaleReg16038B1Td1vi</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--List any intangible property subject to Section 367(d) the transfer of which also gives rise to the recognition of gain under Section 904(f)(3) or Reg Section 1.367(a)-6T.  Provide a calculation of the gain required to be recognized with respect to such property, in accordance with the provisions of Reg Section 1.367(d)-1T(g)(4) --> 
          <td class="styDepTblCell" style="width:14mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IntngblPropReg16038B1Td1vii" />
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtIntngblPropReg16038B1Td1vii</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!-- Describe any intangible property sold or licensed by the transferor to the transferee foreign corporation, and set forth the general terms of each sale or license --> 
         <td class="styDepTblCell" style="width:14mm;text-align:right;font-size:7pt"> 
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="IntngblPropReg16038B1Td1viii" />
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtIntngblPropReg16038B1Td1viii</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Date of the initial transfer --> 
          <td class="styDepTblCell" style="width:14mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateMonthDayYear">
                <xsl:with-param name="TargetNode" select="DateTrnsfrReg16038B1Td2iiA" />
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtDateTrnsfrReg16038B1Td2iiA</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Enter a general description of the transfer and any wider transaction of which it formed a part --> 
          <td class="styDepTblCell" style="width:14mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DescTrnsfrReg16038B1Td2iiC" />
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtDescTrnsfrReg16038B1Td2iiC</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!-- Enter a general description of the subsequent transfer and any wider transaction of which it forms a part -->
          <td class="styDepTblCell" style="width:14mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DescTrnsfrReg16038B1Td2iiiA" />
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtDescTrnsfrReg16038B1Td2iiiA</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!-- Provide a calculation of any gain required to be recognized by the U.S. person under the rules of Reg Section 1.367(d)-1T (d) through (f) -->
          <td class="styDepTblCell" style="width:14mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CalcGainReg16038B1Td2iiiB" />
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtCalcGainReg16038B1Td2iiiB</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!-- Under the rules of Reg Section 1.367(d)-1T (e) or (f) did anyone receive contingent annual payments for the use of the intangible property? -->
          <td class="styDepTblCell" style="width:14mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="RcvdAnnlPymtReg16038B1Td2iiiC" />
                <xsl:with-param name="BackupName">IntngblPropTrnsfrFromTrStmtRcvdAnnlPymtReg16038B1Td2iiiC</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!-- Name of Person receiving annual payment -->
          <td class="styDepTblCell" style="text-align:left;" >
            <xsl:choose> 
              <xsl:when test="BusinessName"> 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessName" />
                </xsl:call-template>
                 </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PersonName" />
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td class="styDepTblCell" style="text-align:left;" >
            <xsl:choose> 
              <xsl:when test="USAddress"> 
                <xsl:call-template name="PopulateUSAddressTemplate">
                  <xsl:with-param name="TargetNode" select="USAddress" />
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateForeignAddressTemplate">
                  <xsl:with-param name="TargetNode" select="ForeignAddress" />
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>  
          <td class="styDepTblCell" style="text-align:center;width=24mm">
         <xsl:choose> 
          <xsl:when test="EIN">
                <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="EIN" />
              </xsl:call-template>
          </xsl:when>
          <xsl:when test="SSN">
            <xsl:call-template name="PopulateSSN">
              <xsl:with-param name="TargetNode" select="SSN" />
            </xsl:call-template>
         </xsl:when> 
        <xsl:otherwise>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="MissingEINReason" />
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose> 
     </td>                
        </tr>
      </xsl:for-each>
      </tbody>
    </table>
 </xsl:template> 
  <!--
                Intangible property transferred from transaction statement 
  <xsl:template name="IntngblPropTrnsfrFromTrStmt2Temp">
    <table id="IntngblPropTrnsfrFromTrStmtTbl2" class="styDepTbl">
 <span class="styRepeatingDataTitle">Intangible Property Transferred From Transaction Statement continued</span>   
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="text-align:center">Desc Trnsfr Reg16038B1Td2iiiA</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Calc Gain Reg16038B1Td2iiiB</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Rcvd AnnlPymt Reg16038B1Td2iiiC</th>
           
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
       <xsl:for-each select="$DependencyData/IntngblPropTrnsfrFromTrStmt">
       set row background 
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
       Total Allocation Group Wages Amount 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="WagesAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpWagesAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
          Total Allocation Group Taxable Interest Amount
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxableInterestAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpTaxableInterestAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
         Total Allocation Group Ordinary Dividends Amount 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OrdinaryDividendsAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpOrdinaryDividendsAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
          Total Allocation Group State Local Income Tax Refund Amount  
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="StateLocalIncomeTaxRefundAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpStateLocalIncomeTaxRefundAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           Total Allocation Group Captial Gain Loss Amount 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CaptialGainLossAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpCaptialGainLossAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           Total Allocation Group Taxable Pensions Amount 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxablePensionsAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpTaxablePensionsAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           Total Allocation Group Rental Real EST Amount  
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="RentalRealESTAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpRentalRealESTAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           Total Allocation Group Total Other Income Amount 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalOtherIncomeAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpTotalOtherIncomeAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           Total Allocation Group Total Income Amount 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalIncomeAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpTotalIncomeAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           Total Allocation Group Overpaid Amount  
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OverpaidAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpOverpaidAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
        </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:template> 
                  Wife Allocation Group  
  <xsl:template name="WifeAllocationGrpTemp">
    <table id="WifeAllocationGrpTbl" class="styDepTbl">
 <span class="styRepeatingDataTitle">Intangible Property Transferred From Transaction Statement continued</span>   
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="text-align:center">Wages Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Taxable Interest Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Ordinary Dividends Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">State Local Income Tax Refund Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Captial Gain Loss Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Taxable Pensions Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Rental Real EST Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Total Other Income Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Total Income Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Overpaid Amount</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
       <xsl:for-each select="$DependencyData/WifeAllocationGrp">
       set row background 
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          Total Allocation Group Wages Amount 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="WagesAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpWagesAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
          Total Allocation Group Taxable Interest Amount 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxableInterestAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpTaxableInterestAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
          Total Allocation Group Ordinary Dividends Amount 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OrdinaryDividendsAmt" />
                <xsl:with-param name="BackupName">HWifeAllocationGrpOrdinaryDividendsAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
          Total Allocation Group State Local Income Tax Refund Amount  
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="StateLocalIncomeTaxRefundAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpStateLocalIncomeTaxRefundAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           Total Allocation Group Captial Gain Loss Amount 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CaptialGainLossAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpCaptialGainLossAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           Total Allocation Group Taxable Pensions Amount  
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxablePensionsAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpTaxablePensionsAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           Total Allocation Group Rental Real EST Amount 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="RentalRealESTAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpRentalRealESTAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           Total Allocation Group Total Other Income Amount 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalOtherIncomeAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpTotalOtherIncomeAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           Total Allocation Group Total Income Amount
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalIncomeAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpTotalIncomeAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           Total Allocation Group Overpaid Amount 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OverpaidAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpOverpaidAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
        </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>  -->
  
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
         <meta name="Author" content="Trin Xue" />
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
    
      <body class="styBodyClass">
      <xsl:call-template name="DocumentHeaderDependency">
      </xsl:call-template>
    
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:187mm;">
              <xsl:value-of select="$depDocTitle" />
            </span>
          </span>
        </div>
        
        <xsl:call-template name="PopulateDepCommonLeftover">
        <xsl:with-param name="TargetNode" select="$DependencyData" />
        </xsl:call-template><br/>                
        <xsl:call-template name="IntngblPropTrnsfrFromTrStmtTemp" /><br/>
        
        
              
         
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

